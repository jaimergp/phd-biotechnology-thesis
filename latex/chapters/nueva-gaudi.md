
- Multiscale approaches have an implicit sequentiality restriction: each method (and its corresponding level of theory) is separate from the other, and must be solved as such (no collaboration from other methods is allowed!). Why don't we break that restriction? It might be not strict, but at some point we have to make compromises. Refinement can get later.
- GaudiMM takes Python native modularity and uses that to create an molecular design platform with unprecedented flexibility:
    - it forces a mindset: exploration is uncoupled from evaluation,
        - stop learning new mindsets (physics vs chemistry, etc)
    - each component in those stages is a separate, independent module.
        - recombining those in new recipes allows solving different modeling tasks
        - devising new strategies is easy: just combine the ingredients and test (hypotheses-driven comp. modeling --- you can ask )
        - multiobjective optimization

Given Python modular nature, and the existing ecosystem of scientific packages, it is the perfect language to implement this idea. Following sections will describe the implementation details of the platform, how to analyze the proposed results, and the notion of recipe. Application examples will be given in Chapter 06.

- Algorithmic details: Multiobjective opt
    This is possible thanks to a particular case of vectorial opt.
    - Underlying algorithm: NSGA-II (DE FACTO)
    - Multi objective results: Pareto optimization

- Implementation details:
     genes
     objectives
     UCSF CHIMERA as kickstarter
     The Python API: extend it!

- From recipes to molecular modeling task (hybrids)
    - A recipe: choose from the table.
    - You can choose as many as you want (multi-instantiation). This defines accuracy, resolution, level of theory... you have control. If thi
    - Example: table of genes+objectives for... toy example

- Analyzing results

- Conclusions, discussions & further work

