.DELETE_ON_ERROR:

.PHONY: compile
compile:

out := _out
mkdir = @mkdir -p $(dir $@)

fortunes.dest := $(addprefix $(out)/, paulgraham_fav)

$(out)/paulgraham_fav: quo.html
	$(mkdir)
	w3m -dump quo.html | ./quo2fortunes.rb > $@

str := $(addsuffix .dat, $(fortunes.dest))

$(str): %.dat: %
	$(mkdir)
	strfile $<

compile: $(str)
