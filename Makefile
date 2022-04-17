.PHONY: bats publish tests version

SHELL := $(shell bash -c 'command -v bash')
msg := fix: completions
export msg

bats:
	@brew bundle --file tests/Brewfile --quiet --no-lock | grep -v "^Using"

publish: tests
	@git add .
	@git commit --quiet -a -m "$${msg:-auto}" || true
	@git push --quiet

tests:
	@echo hello

