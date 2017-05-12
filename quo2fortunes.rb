#!/usr/bin/env ruby

class Quote
  def initialize
    @text = []
    @attr = []
  end

  def text_add line
    line = clean line
    @text.push line unless line.size == 0
  end

  def attr_add line
    line = clean line
    return if line.size == 0
    @attr.push @attr.size == 0 ? line[2..-1] : line
  end

  def to_s
    return "" if @text.size == 0
    # w/o quote marks
    text = @text.first[0] == '"' ? @text.join("\n")[1..-2] : @text.join("\n")
    text + "\n" +
      # properly indented
      @attr.map.with_index do |line, idx|
      "\t\t" + (idx === 0 ? "-- #{line}" : "   #{line}")
    end.join("\n")
  end

  private

  def clean line
    line.strip.sub(/^[[:space:]*]+/, '').gsub(/[^[:ascii:]]/, '')
  end
end


# Main

quotes = []

entry = false
attr = false
line_prev = nil
quote = nil
quote_last = nil

while line = $stdin.gets
  if line =~ /^\s+\* \* /
    entry = true
    attr = false
    line_prev = nil

    quotes.push quote if quote
    quote_last = quote
    quote = Quote.new
  end

  attr = true if entry && line_prev == "\n" && line =~ /^\s{2,}- /

  if attr
    quote.attr_add line
  else
    quote.text_add line if entry
  end

  line_prev = line
end

# catch the last entry
quotes.push quote if quote_last != quote

# print the result
quotes.each do |q|
  puts q
  puts '%'
end
