class SearchTerm
  @@instance_collector = []
  attr_accessor :phrase, :cost, :clicks, :conversions
  def initialize(params = {})
    @phrase = params[:phrase]
    @cost = params[:cost]
    @conversions = params[:conversions]
    @clicks = params[:clicks]
    @@instance_collector << self
  end

  def parse
    ary = phrase.split
    ary.each do |word|
      if word.length > 3
        Keyword.add(word, clicks, cost, conversions)
      end
    end
  end

  def self.all
    @@instance_collector
  end
end