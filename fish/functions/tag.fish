# Defined in - @ line 1
function tag --description 'alias tag=ctags -R -f ./.git/tags'
	ctags -R -f ./.git/tags $argv;
end
