# Defined in - @ line 1
function gl --description 'alias gl=git --no-pager log --oneline --decorate=short --pretty=oneline -n20'
	git --no-pager log --oneline --decorate=short --pretty=oneline -n20 $argv;
end
