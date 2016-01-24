
measure-startup-time:
	# only the second call gives the right times
	# I do not know the reason for this behavior
	time zsh -i -c 'print -n'
	time zsh -i -c 'print -n'

