# Defined in - @ line 1
function gac --description 'alias gac=git add -A && git commit -m '
	git add -A && git commit -m  $argv;
end
