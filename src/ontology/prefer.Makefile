## Customize Makefile settings for prefer
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

# ----------------------------------------
# Dictionary CSV release product
# ----------------------------------------
# VERSION defaults to TODAY (YYYY-MM-DD) in the main Makefile,
# matching GitHub release tags like v2026-07-14.
DICTIONARY = prefer_dictionary_$(VERSION).csv

.PHONY: dictionary
dictionary: $(DICTIONARY)

$(DICTIONARY): $(ONT)-base.owl
	$(ROBOT) export \
		--input $< \
		--header "ID|LABEL|IAO:0000115|oboInOwl:hasExactSynonym|oboInOwl:hasNarrowSynonym|oboInOwl:hasBroadSynonym|oboInOwl:hasRelatedSynonym|rdfs:comment" \
		--export $@

# all_assets prerequisites are expanded before this file is included, so
# ASSETS += alone does not make Make build the dictionary. Add it explicitly.
all_assets: $(DICTIONARY)

ASSETS += $(DICTIONARY)
RELEASE_ASSETS += $(DICTIONARY)
