# Defined in - @ line 1
function sysctl --description 'alias sysctl=systemctl'
	systemctl  $argv;
end
