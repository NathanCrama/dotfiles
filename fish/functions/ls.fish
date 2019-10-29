# Defined in - @ line 1
function ls --description 'alias ls=ls -Alh --color=auto'
	command /usr/bin/ls -Alh --color=auto $argv;
end
