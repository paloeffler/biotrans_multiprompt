# biotrans_multiprompt
BioTransformer Batch Mode for Multiple Models

Python script as an extension to predict biotransformation for multiple chemicals and multiple transformation models using BioTransformer3.0 (https://biotransformer.ca/ & https://github.com/Wishartlab-openscience/Biotransformer)

The script is required to run from inside the cloned BioTransformer repository and needs an input file (SMILES.log in the given example) containing the chemicals in SMILES format (one chemical in each line without further signs).

Model selection can be chosen in line 21 of the script. Models "cyp450", "ecbased", "phaseII", "hgut", "allHuman", "superbio", and "env" can be selected.
Output file name should be adjusted in line 5, 33, and 38.
