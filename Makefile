PACKWIZ := ../packwiz/packwiz

.PHONY: validate
validate:
	$(PACKWIZ) validate

.PHONY: refresh
refresh:
	$(PACKWIZ) refresh

.PHONY: mrexport
mrexport:
	$(PACKWIZ) mr export

modlist-validate:
	$(PACKWIZ) modlist validate

modlist-generate:
	$(PACKWIZ) modlist generate

modlist-fix:
	$(PACKWIZ) modlist fix
