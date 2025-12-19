## Customize Makefile settings for prefer
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

## changing base iri for bao 
.PHONY: mirror-bao
.PRECIOUS: $(MIRRORDIR)/bao.owl
mirror-bao: | $(TMPDIR)
	$(ROBOT) remove -I http://www.bioassayontology.org/bao/bao_complete.owl --base-iri http://www.bioassayontology.org/ --axioms external --preserve-structure false --trim false -o $(TMPDIR)/$@.owl
