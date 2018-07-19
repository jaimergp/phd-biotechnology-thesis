%!TEX TS-program = xelatex
%!TEX root = dissertation.tex
%!TEX encoding = UTF-8 Unicode
% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "2.0",
%     date            = "25 March 2014",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "Send email to suchow@post.harvard.edu.",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2014/03/25 v2.0 Dissertate Class]
% Comment/uncomment these two lines for digital A4 PDF or print-ready B5 PDF
% Remember to change the geometry package as well
\LoadClass[12pt,oneside,a4paper]{extbook}
% \LoadClass[14pt,twoside,openright,b5paper]{extbook}
%\RequirePackage[width=5.75in,letterpaper]{geometry}
%\RequirePackage[b5paper]{geometry}
\RequirePackage{geometry}
%
% Options
%
\RequirePackage{etoolbox}

% Line spacing: dsingle/ddouble
%   Whether to use single- or doublespacing.
\newtoggle{DissertateSingleSpace}
\togglefalse{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    %\ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

% Line Spacing
%   Define two line spacings: one for the body, and one that is more compressed.
\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.5}
    \newcommand{\dcompressedspacing}{1.5}
    \newcommand{\dxcompressedspacing}{1.0}
}{
    \newcommand{\dnormalspacing}{2.0}
    \newcommand{\dcompressedspacing}{1.5}
    \newcommand{\dxcompressedspacing}{1.2}
}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dxcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

% Text layout.
\usepackage{ragged2e}
%\RaggedRight
\raggedbottom
% \RequirePackage[draft]{graphicx}
\RequirePackage{graphicx}
\parindent 12pt
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}
\setlength{\DefaultNindent}{0pt}
\setlength{\DefaultFindent}{1pt}

% My packages
\RequirePackage{float}
\usepackage{hhline}
\usepackage[normalem]{ulem}
\usepackage[english]{babel}
\usepackage{blindtext}
\usepackage{cprotect}
\usepackage{rotating}
\usepackage{multirow}
\usepackage{booktabs}
\usepackage{tabularx}
\usepackage{listings}

% Fonts.
\RequirePackage{color}
\RequirePackage{xcolor}
\usepackage{hyperref}
\usepackage{nameref}
\RequirePackage{url}
\usepackage{fontspec}
\defaultfontfeatures+[\rmfamily]{RawFeature={-calt}} % disable contextual alternative ligatures (long Q, etc)
\usepackage[lining]{ebgaramond}
\usepackage{ebgaramond-maths}
\usepackage{amsmath}
% \RequirePackage{amssymb}
% \RequirePackage{mathspec}
% \setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{EB Garamond}
% \setmathrm{EB Garamond}
\AtBeginEnvironment{tabularx}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
% \setromanfont[Numbers=Lining, Ligatures={NoCommon, Common, TeX}, Scale=1.0]{EB Garamond}
% \newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EB Garamond}
% \setmainfont{EB Garamond}
\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=MatchLowercase]{Source Code Pro}


\RequirePackage[labelfont={bf,sf,sc,small,singlespacing},
                textfont={sf,small,singlespacing},
                justification={justified,RaggedRight},
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\RequirePackage{microtype}

% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[small, md, sc]{titlesec}
\setcounter{secnumdepth}{5}
\setlength{\headheight}{15pt}
\pagestyle{plain}
\RequirePackage{titling}
\RequirePackage{emptypage}

% Front matter.
\setcounter{tocdepth}{2}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Listing of tables}

% Endmatter
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References.
\renewcommand\bibname{References}
\RequirePackage[super,comma,numbers,sort&compress]{natbib}
\renewcommand{\bibnumfmt}[1]{[#1]}
\setlength{\bibsep}{0pt}

% Chapter headings
\RequirePackage[palatino]{quotchap}
\renewcommand*{\chapterheadstartvskip}{\vspace*{-4.5\baselineskip}}
\renewcommand*{\chapterheadendvskip}{\vspace{0.5\baselineskip}}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}

\newcommand*{\Lettrine}[2][]{
  \def\tmp##1##2 {\lettrine[#1,lines=3]{\color{SchoolColor}##1}{##2} }
  \tmp#2
}


% Align reference numbers so that they do not cause an indent.
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}

% Some definitions.
\def\advisor#1{\gdef\@advisor{#1}}
\def\coadvisorOne#1{\gdef\@coadvisorOne{#1}}
\def\coadvisorTwo#1{\gdef\@coadvisorTwo{#1}}
\def\tutor#1{\gdef\@tutor{#1}}
\def\committeeInternal#1{\gdef\@committeeInternal{#1}}
\def\committeeInternalOne#1{\gdef\@committeeInternalOne{#1}}
\def\committeeInternalTwo#1{\gdef\@committeeInternalTwo{#1}}
\def\committeeExternal#1{\gdef\@committeeExternal{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeterm#1{\gdef\@degreeterm{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\programname#1{\gdef\@programname{#1}}
\def\pdOneName#1{\gdef\@pdOneName{#1}}
\def\pdOneSchool#1{\gdef\@pdOneSchool{#1}}
\def\pdOneYear#1{\gdef\@pdOneYear{#1}}
\def\pdTwoName#1{\gdef\@pdTwoName{#1}}
\def\pdTwoSchool#1{\gdef\@pdTwoSchool{#1}}
\def\pdTwoYear#1{\gdef\@pdTwoYear{#1}}
% School name and location
\university{Universitat Autònoma de Barcelona}
\universitycity{Barcelona}
\universitystate{Spain}

% School color found from university's graphic identity site:
% http://brand.berkeley.edu/colors/

% \definecolor{chaptergrey}{HTML}{003262} % chapter numbers
% \definecolor{SchoolColor}{HTML}{FDB515} %berkeley gold

% \definecolor{SchoolColor}{rgb}{0,0.19608,0.3843} %berkeley blue
% \definecolor{chaptergrey}{rgb}{0,0.19608,0.3843} % chapter numbers

\definecolor{SchoolColor}{HTML}{A00000}
\definecolor{chaptergrey}{HTML}{999999}

\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=SchoolColor,
}
% Formatting guidelines found in:
% http://www.gsas.harvard.edu/publications/form_of_the_phd_dissertation.php
\renewcommand{\frontmatter}{
    \input{frontmatter/personalize}
    \pagenumbering{roman}
    \maketitle
    \makesignatures
    \copyrightpage
    \dedicationpage
    \setcounter{page}{1}
    \setstretch{\dnormalspacing}
      \abstractpage
      \officialacknowledgments
      % \acknowledgments
    \setstretch{\dxcompressedspacing}
    \maketoc
    \makelof % optional
    \makelot % optional
    % \setcounter{page}{1}
    \renewcommand{\thepage}{\arabic{page}}
    % \pagenumbering{arabic}
    \renewcommand\thepage{\arabic{page}}
    \setstretch{\dnormalspacing}
}

\newcommand{\maketoc}{
    \pagestyle{empty}
    {
      \renewcommand{\thispagestyle}[1]{}
      \tableofcontents
    }
    \newpage
    \thispagestyle{empty}
    \pagestyle{fancy}
}

\newcommand{\makelof}{
    \pagestyle{empty}
    {
      \renewcommand{\thispagestyle}[1]{}
      \listoffigures
    }
    \newpage
    \thispagestyle{empty}
    \pagestyle{fancy}
}

\newcommand{\makelot}{
    \pagestyle{empty}
    {
      \renewcommand{\thispagestyle}[1]{}
      \listoftables
    }
    \newpage
    \thispagestyle{empty}
    \pagestyle{fancy}
}
\renewcommand{\maketitle}{
    \thispagestyle{empty}
    \begin{center}
    \includegraphics[width=0.5\textwidth]{figures/logoUAB.jpg} \\
    %\vspace*{\fill}
    \vspace{40pt}
    \Huge \textcolor{SchoolColor}{\thetitle} \normalsize \\
    \vspace{40pt}
    \textsc{a dissertation submitted by\\
    \theauthor\\
    \vspace{12pt}
    \textit{\&} directed by \\
    \@advisor \\}
    \vspace{12pt}
    \textsc{in fulfillment of the requirements \\
    for the degree of \\
    \@degree\\
    % \vspace{12pt}
    % \rule{10mm}{.1pt}\\
    \vspace*{\fill}
    \@university\\
    \@degreemonth\ \@degreeyear}
    \end{center}
}

\newcommand{\makesignatures}{
    \newpage
    \thispagestyle{empty}
    \begin{center}
    \includegraphics[width=0.5\textwidth]{figures/logoUAB.jpg} \\
    %\vspace*{\fill}
    \vspace{40pt}
    \Huge \thetitle \normalsize \\
    \vspace{40pt}
    \textsc{a dissertation submitted by\\
    \theauthor\\
    \vspace{12pt}
    \textit{\&} recommended for acceptance \\
      by advisor \\
    \vspace{120pt}
    \@advisor \\}
    \vspace*{\fill}
    \textsc{\@university\\
    \@degreemonth\ \@degreeyear}
    \end{center}
}
\newcommand{\copyrightpage}{
    \newpage
    \thispagestyle{empty}
    \vspace*{\fill}
    \scshape \noindent \small \copyright \small \@degreeyear\hspace{3pt}-- \theauthor \\
    \noindent Licensed as Creative Commons BY-NC-ND\\
    \noindent Attribution-NonCommercial-NoDerivs \\
    \vspace*{\fill}
    \newpage
    \rm
}

\newcommand{\abstractpage}{
    \newpage
    \pagestyle{fancy}
    \lhead{Advisor: \\\@advisor\\}
    \rhead{Author: \\\@author\\}
    \renewcommand{\headrulewidth}{0.0pt}
    \vspace*{35pt}
    \begin{center}
    \Large \@title \normalsize \\
    \vspace*{20pt}
    \scshape Abstract \\ \rm
    \end{center}
    \input{frontmatter/abstract}
    \vspace*{\fill}
    \newpage \lhead{} \rhead{}
    \cfoot{\thepage}
    \if@twoside
        % insert blank page
        \pagestyle{empty}
        {
        \renewcommand{\thispagestyle}[1]{}
        \cleardoublepage
        }
        \newpage
        \thispagestyle{empty}
        \pagestyle{fancy}
    \fi
}

\newcommand{\acknowledgments}{
    \newpage \thispagestyle{fancy} \vspace*{10pt}
    {
      \huge \hspace*{\fill}  Acknowledgments
    }
    \noindent
    \input{frontmatter/thanks}
    \vspace*{\fill}
    \if@twoside
        \newpage \thispagestyle{empty}  \rm
        % insert blank page
        \pagestyle{empty}
        {
        \renewcommand{\thispagestyle}[1]{}
        \cleardoublepage
        }
        \newpage
        \thispagestyle{empty}
        \pagestyle{fancy}
    \fi
}
\newcommand{\officialacknowledgments}{
    \newpage \thispagestyle{fancy} \vspace*{10pt}
    {
      \huge \hspace*{\fill} Official Acknowledgments
    }
    \noindent
    \input{frontmatter/official-acknowledgments}
    \if@twoside
       \vspace*{\fill}
        \newpage \thispagestyle{empty}  \rm
        % insert blank page
        \pagestyle{empty}
        {
        \renewcommand{\thispagestyle}[1]{}
        \cleardoublepage
        }
        \newpage
        \thispagestyle{empty}
        \pagestyle{fancy}
    \fi
}

\newcommand{\dedicationpage}{
    \newpage \thispagestyle{empty} \vspace*{\fill}
    %\scshape
    \noindent \input{frontmatter/dedication}
    \vspace*{\fill} \newpage \thispagestyle{empty}  \rm
}


\renewcommand{\backmatter}{
    \input{endmatter/personalize}
    \clearpage
    {
      \footnotesize
      \setstretch{1.0}
      \raggedright
      \bibliography{dissertation}
      \addcontentsline{toc}{chapter}{Bibliography}
      \bibliographystyle{ieeetr}
    }
    %\include{endmatter/colophon}
}


%% Customizations

\fancypagestyle{plain}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
%   \fancyhf[leh,roh]{\thepage}%
}

% Redefine autoref to handle section keyword replacement
% Taken from https://tex.stackexchange.com/a/101065
\usepackage{xifthen}
\usepackage{letltxmacro}
\usepackage{refcount}
\LetLtxMacro\org@autoref\autoref % "org" stands for "original"
\RenewDocumentCommand{\autoref}{o m}{%
  % test 1: reference defined?
  \@ifundefined{r@#2}{%
    \org@autoref{#2}%
  }{%
    \begingroup
      \def\ar@next{\org@autoref{#2}}%
      % test 2: anchor available?
      \edef\ar@anchor{\getrefbykeydefault{#2}{anchor}{}}%
      \ifx\ar@anchor\@empty
      \else
        % test 3: counter part extractable from anchor name?
        \expandafter\ar@getcounter\ar@anchor.\@nil
        \ifx\ar@counter\ar@dot
        \else
          % test 4: color defined?
          \@ifundefined{\ar@counter autorefcolor}{%
            \def\ar@next{\IfValueTF{#1}{%
              \ifthenelse{\isempty{#1}}{\ref{#2}}{#1~\ref{#2}}%
            }{\ar@autoref{#2}}}%
          }{%
            \def\ar@next{%
              \hypersetup{%
                linkcolor=\csname\ar@counter autorefcolor\endcsname,%
                linkbordercolor=\csname\ar@counter autorefcolor\endcsname
              }%
              \IfValueTF{#1}{%
                \ifthenelse{\isempty{#1}}{\ref{#2}}{#1~\ref{#2}}%
              }{\ar@autoref{#2}}%
            }%
          }%
        \fi
      \fi
      \ar@next
    \endgroup
  }%
}
\def\ar@getcounter#1.#2\@nil{%
  \def\ar@counter{#1}%
}
\newcommand*{\ar@dot}{.}
\newcommand*{\ar@autoref}[1]{%
  \@ifundefined{\ar@counter autorefname}{%
    \@ifundefined{\ar@counter name}{%
    }{%
      \@nameuse{\ar@counter name}~%
    }%
  }{%
    \@nameuse{\ar@counter autorefname}~%
  }%
  \ref{#1}%
}
\newcommand*{\setautorefcolor}[2]{%
  \@namedef{#1autorefcolor}{#2}%
}

% Same vertical space in numbered and unnumbered chapters
\renewcommand{\@makechapterhead}[1]{%
  \chapterheadstartvskip%
  {\size@chapter{\sectfont\raggedleft
    {\chapnumfont
      \ifnum \c@secnumdepth >\m@ne%
        \if@mainmatter\thechapter\else\phantom{\thechapter}%
      \fi\else\phantom{\thechapter}\fi
      \par\nobreak}%
    {\raggedleft\advance\leftmargin10em\interlinepenalty\@M #1\par}}
  \nobreak\chapterheadendvskip}}


% Fix vertical space in lists (from https://tex.stackexchange.com/a/10689)
\usepackage{enumitem}
\setlist{noitemsep}

\usepackage[textsize=footnotesize]{todonotes}