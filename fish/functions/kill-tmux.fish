# Defined in - @ line 1
function kill-tmux --description alias\ kill-tmux=tmux\ ls\ \|\ grep\ :\ \|\ cut\ -d.\ -f1\ \|\ awk\ \'\{print\ substr\(,\ 0,\ length\(\)-1\)\}\'\ \|\ xargs\ kill
	tmux ls | grep : | cut -d. -f1 | awk '{print substr(, 0, length()-1)}' | xargs kill $argv;
end
