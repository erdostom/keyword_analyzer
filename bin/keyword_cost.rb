#!/usr/bin/env ruby
# p 'about to boot'
require_relative '../lib/keyword_cost/boot'
# p 'about to load'
SearchTermParser.load "search.xls"
# p 'now adding to dict'
SearchTerm.all.each do |term|
  term.parse
end
# p 'about to print'
Keyword.print_table