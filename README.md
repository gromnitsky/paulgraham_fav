# PG's favourite quotes in fortune(6) format

The src: http://paulgraham.com/quo.html

## Compilation

Requirements:

* ruby
* w3m
* strfile(1), fortune(6) (both are in `fortune-mod` Fedora pkg)
* GNU Make

Type `make`. The dir `_out` should appear. To test:

~~~
$ fortune -m mail _out/paulgraham_fav
(/home/alex/lib/software/alex/fortunes/paulgraham_fav/_out/paulgraham_fav)
%
I'm surrounded by postmodern idiots and blatherers. Your
writings give me hope.
                -- email from a reader
%
~~~

## Installation

Copy the contents of `_out` dir to `/usr/share/games/fortune/`.


## License

(For everything except `quo.html` file)

MIT.
