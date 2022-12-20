.PHONY: help generate l10n check pub

help: ## Help
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done

generate: ## Generate files using build_runner
	@flutter pub run build_runner build --delete-conflicting-outputs

l10n: ## Generate localizations files
	@(cd core && flutter gen-l10n)

check: ## Format analyze
	@flutter format .
	@flutter analyze

pub: ## Run pub get on all modules
	@chmod +x scripts/pub.sh && scripts/pub.sh