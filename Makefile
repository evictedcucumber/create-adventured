MODSLIST_ARGS := list --save --only main
MODSLIST_SERVER_ARGS := $(MODSLIST_ARGS) --side server

.PHONY: modslist
modslist:
	packwiz $(MODSLIST_ARGS)
	packwiz $(MODSLIST_SERVER_ARGS)

CHANGELOG_ARGS := changelog --save

.PHONY: changelog
changelog:
	packwiz $(CHANGELOG_ARGS)

EXPORT_ARGS := mr export
EXPORT_SERVER_ARGS := $(EXPORT_ARGS) --server
EXPORT_BISECT_ARGS := $(EXPORT_ARGS) --bisect

.PHONY: export_
export_:
	packwiz $(EXPORT_ARGS)
	packwiz $(EXPORT_SERVER_ARGS)
	packwiz $(EXPORT_BISECT_ARGS)
