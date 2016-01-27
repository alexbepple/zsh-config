eclint := ./node_modules/.bin/eclint
zsh := zsh -i -c
zsh_noop := $(zsh) 'print -n'

test: check-style check-init-generation measure-startup-time

measure-startup-time:
	# only the second call gives the right times
	# I do not know the reason for this behavior
	time $(zsh_noop)
	time $(zsh_noop)

reset:
	$(zsh) 'zgen reset'
	rm $(fasd_cache)

check-init-generation: reset
	$(zsh_noop)

check-style:
	$(eclint) check * modules/*

