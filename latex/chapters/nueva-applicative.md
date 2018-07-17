Title: Benchmark and applications

[ Consider reordering Gaudi after Tangram ]

* Each section must mention (consider implicit or explicit headings for subsections)
    - INTRO: - A paragraph on definition of the problem
             - Another on the state of the art for that problem
    - MAT&METHODS: "The recipe"
        - Una tabla con genes y objetivos
    - RESULTS
    - DISCUSSION:
        - Comparison (docking & peptide folding only)
        - Perspectives

* Be more concise. Less words, more ideas.

6.1 - From classical to exotic dockings

    Advantages of our approach: we can do the same as everyone, and then more if needed.

    - CCDC benchmark

        - Mention (beginning): this is not the goal! just one of the possible applications. it can be perfected after careful optimization. good software already exists for this. we focus on building new

        - Mention (end): this is not the goal, it still could work but the real potential of MOExploration will be explained now. still related to recognition, though.

    - Exotic cases of docking

        - Multi-ligand docking with covalency.

            -   INTRO: Docking is about supramol recognition (usually, no covalent no coordination, just nonbonded interactions). However, a lot of systems do exhibit these phenomena during their recognition (examples). In our group, we work with metallodrugs and artificial enzymes; two fields where these phenomena do occur, which demand software able  to deal with those (cov and coord).

            - During this PhD, a specific thesis needed a prediction on the position of 2 artificial cofactors, covalently linked in two sites of the same pocket (dimer interface). No information was available besides the protein. With Gaudi, we could pprovide new models that satisfy the initial guesses for a system of these characteristics.

            - RECIPE: lkajbslabdl

            - RESULTS: it fits, but not as expected - confirmed with MD.

            - CONCLUSION:.... life is hard. no software allows this type of modelling. in gaudi you can. This technique was reused in another system further detailed in section B.

            [ USE THIS SCHEME FOR EVERY SECTION]

        - Streptavidin (implicit) -> fragment-based optimization

            * Dealing with metals implicitly is possible, but we can do better as well

            - EXPERIMENTALISTS:
                - They tried to synth it with our size suggestions. Only a change in a chemical group was needed due to synth requirements.
                - From now on, preliminar results involve:
                    - Micromolar affinity with Sav
                    - XRAY obtained & refined with help of our model (even more useful this way)
                    - THe only difference is a 180$^\circ$ flip in the amide group (due to a now corrected bug). Everything else fits previous predictions.

6.2 - Metal ions: organization and binding site prediction

    *Metal-driven optimization - the metal ion stops being a secondary actor, and starts leading the optimization (WITHOUT QM, force-fields or anything). We just need implicit terms to search for compatible structures that results in 3D building processes sitting at the frontier between DOCKING and HOMOLOGY MODELLING.

        - Peptide folding with a twist (implicit metal handling)

            - Compatible conformations with metal-bounded peptide (Zn)

        - Siderophore


        - GaudiMM Metals -> explicit handling, no parameters

            - Mention aluminium as the precursor


6.x - Guinda del pastel: full usage of GaudiMM+Tangram <ROTAXANE>

    - Recortar intro general
    - Recoger una lista con las preguntas que luego detallaré
    - Mencionar recetas
    - Detalles a appendix (comp details (mention there MD parameterization and stuff))