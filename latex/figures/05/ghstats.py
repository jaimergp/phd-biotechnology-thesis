#!/usr/bin/env python
# coding: utf-8

"""
PyStats
-------

Stats of Python packages. Includes data of GitHub Repository &
Anaconda downloads (if available).

Usage
-----

python ghstats.py owner [owner2 ...]

Configuration
-------------
Go to https://github.com/settings/tokens and generate a new
token with repo, user permissions. Replace USER and TOKEN global
variables below accordingly. Alternatively, GH_USER and GH_TOKEN
environment variables can be set.

- `tqdm` is needed for nice progress bars
- `pandas` and `matplotlib` for graphical representation


Notes on PyPI downloads
-----------------------

Those must be obtained through (paid) Google Query, with the help of pypinfo
Setup described here: https://github.com/ofek/pypinfo#installation

`--pip` flag is important to discard spiders and false downloads. Like this:

    > pypinfo --auth your-big-query.json
    > pypinfo --days 1000 --pip esigen
    Served from cache: False
    Data processed: 255.49 GiB
    Data billed: 255.50 GiB
    Estimated cost: $1.25

    | download_count |
    | -------------- |
    |             15 |

"""

import sys
import os
from datetime import datetime
import requests
try:
    from tqdm import tqdm
except ImportError:
    tqdm = lambda i, **kw: i
try:
    import pandas as pd
    import matplotlib
    matplotlib.use('TkAgg')
    from matplotlib import pyplot as plt
    plt.ioff()
    ANALYSIS = True
except ImportError:
    ANALYSIS = False


# Go to https://github.com/settings/tokens
# and generate a new token with repo, user permissions
USER = r'XXXXXXXXXX'
TOKEN = r'XXXXXXXXXXXXXXXXXXXXX'


def gh_request(url, *args, **kwargs):
    BASE = r'https://api.github.com'
    r = requests.get(BASE + url, *args, **kwargs)
    if r.status_code != 200 and not int(r.headers['X-RateLimit-Remaining']):
        reset = datetime.fromtimestamp(int(r.headers['X-RateLimit-Reset']))
        raise requests.HTTPError('Rate limit exceeded! Blocked until {}'.format(reset))
    r.raise_for_status()
    return r


def repo_count(owner):
    return gh_request('/users/' + owner).json()['public_repos']


def repos(owner, page=1):
    r = gh_request('/users/{}/repos'.format(owner),
                   params={'per_page': 100, 'page': page})
    yield from iter(r.json())
    if r.links.get('next'):
        yield from repos(owner, page=page + 1)


def views_and_clones(owner, repo, **kw):
    views = gh_request('/repos/{}/{}/traffic/views'.format(owner, repo), **kw).json()
    clones = gh_request('/repos/{}/{}/traffic/clones'.format(owner, repo), **kw).json()
    releases = gh_request('/repos/{}/{}/releases'.format(owner, repo), **kw).json()
    downloads = 0
    for release in releases:
        for asset in release['assets']:
            downloads += asset['download_count']
    return views['count'], clones['count'], downloads


def anaconda_downloads(owner, package, **kw):
    r = requests.get('https://api.anaconda.org/package/{}/{}'.format(owner, package))
    if r.status_code != 200:
        return 0
    downloads = 0
    for f in r.json()['files']:
        downloads += f['ndownloads']
    return downloads


def stats(owner, **kw):
    data = {}
    for repo in tqdm(repos(owner), total=repo_count(owner)):
        repo_owner = repo['owner']['login']
        repo_name = repo['name']
        stars = repo['stargazers_count']
        forks = repo['forks_count']
        anaconda_dl = anaconda_downloads(repo_owner, repo_name)
        views, clones, gh_downloads = views_and_clones(repo_owner, repo_name, **kw)
        data[repo['full_name']] = {
            'GitHub Stars': stars,
            'GitHub Clones': clones,
            'GitHub Forks': forks,
            'GitHub Visits': views,
            'GitHub Downloads': gh_downloads,
            'Conda Installations': anaconda_dl,
        }
    return data


def pandas_analysis(data):
    # If you have Pandas, these are useful
    df_raw = pd.DataFrame.from_dict(data, orient='index')
    df_raw['sum'] = df_raw.T.sum()
    df_raw.sort_values('sum', ascending=False, inplace=True)

    with open('ghstats.html', 'w') as f:
        print(df_raw.to_html(), file=f)

    with open('ghstats.json', 'w') as f:
        print(df_raw.to_json(), file=f)

    df = pd.DataFrame()
    df['Code Impact'] = sum(df_raw[k] for k in ('GitHub Stars', 'GitHub Forks', 'GitHub Visits'))
    df['Installations'] = sum(df_raw[k] for k in ('Conda Installations', 'GitHub Clones', 'GitHub Downloads'))
    df['sum'] = df.T.sum()
    df.sort_values('sum', ascending=False, inplace=True)
    print(df)
    print('More details can be found in ghstats.html and ghstats.json')

    p = df.drop('sum', axis=1).plot.bar(stacked=True)
    plt.show()


def main(*owners):
    d = {}
    for owner in owners:
        d.update(stats(owner, auth=(os.environ.get('GH_USER', USER),
                                    os.environ.get('GH_TOKEN', TOKEN))))
    if ANALYSIS:
        pandas_analysis(d)
    else:
        header = sorted(list(d.values())[0].keys())
        print('Repo', *header, sep='\t')
        for repo, data in d.items():
            numbers = [v for (k,v) in sorted(data.items())]
            print(repo, *numbers, sep='\t')


if __name__ == '__main__':
    main(*sys.argv[1:])
