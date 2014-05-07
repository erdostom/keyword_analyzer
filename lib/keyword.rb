class Keyword
  @@instance_collector = []
  attr_accessor :word, :cost, :clicks, :conversions, :cost_per_conversion, :search_count
  def initialize(params = {})
    @word = params[:word]
    @cost = params[:cost]
    @clicks = params[:clicks]
    @conversions = params[:conversions]
    @cost_per_conversion = 0.0
    @search_count = 0.0
    @@instance_collector << self
  end

  def update
    @cost_per_conversion = @cost.to_f / @conversions.to_f if @conversions > 0
    @search_count += 1
  end

  def self.add(word, clicks, cost, conversions)
    existing = @@instance_collector.find {|obj| obj.word == word}
    if existing
      existing.cost += cost
      existing.clicks += clicks
      existing.conversions += conversions
      existing.update
    else
      Keyword.new(word: word, clicks: clicks, cost: cost, conversions: conversions)
    end
  end

  def self.all
    @@instance_collector
  end

  def self.print_table
    sorted = @@instance_collector.sort {|a,b| a.cost_per_conversion <=> b.cost_per_conversion}
    puts "Keyword,Count,Clicks,Cost,Conversions,Cost per conversion\n"
    @@instance_collector.each do |keyword|
      puts "#{keyword.word},#{keyword.search_count},#{keyword.clicks},$#{keyword.cost},#{keyword.conversions},$#{keyword.cost_per_conversion}\n"
    end
  end
end