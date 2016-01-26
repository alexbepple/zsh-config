zsh := zsh -i -c
test: measure-startup-time check-manually

measure-startup-time:
	# only the second call gives the right times
	# I do not know the reason for this behavior
	time $(zsh) 'print -n'
	time $(zsh) 'print -n'

check-manually:
	$(zsh) 'zgen reset && zsh'

