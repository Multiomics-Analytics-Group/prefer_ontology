# Dictionary_relases
This folder contains released versions of the ontologydictonary generated using ROBOT.

## Files
 - current.csv (e.g. prefer_dictionary_2026-03-10) -  latest stable dictionary (generated, do not edit manually)
 - archive/ – previous versions of the dicitonary (timestamped)

## How to generate
The dictionary is generated from the ontology using ROBOT:
- Input (release: 20260310): prefer-base.owl
 - "IAO:0000115" : definition

>>> ROBOT query
robot export\
    --input ./prefer-base.owl \
    --header "ID|LABEL|IAO:0000115|oboInOwl:hasExactSynonym|oboInOwl:hasNarrowSynonym|oboInOwl:hasBroadSynonym|oboInOwl:hasRelatedSynonym|rdfs:comment" \
    --export prefer_dictionary_2026-03-10.csv


## Contribution workflow
1. Update ontology source files in src/
2. Run ROBOT to regenerate prefer_dictionary_current.csv
3. Move previous version to archive/
4. Commit both changes