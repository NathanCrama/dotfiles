function md
	pandoc $1 | w3m -T text/html
end