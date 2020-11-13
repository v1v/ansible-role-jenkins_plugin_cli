default: lint

SHELL:=/bin/bash -eux

.PHONY: setup-lint lint setup-molecule

setup-lint:
	@pip3 install yamllint ansible-lint

setup-molecule:
	@pip3 install ansible molecule[docker] docker

lint:
	yamllint . ; \
    ansible-lint
