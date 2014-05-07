module SearchTermParser
  extend SearchTermParser

  def load(file)
    book = Spreadsheet.open file
    sheet = book.worksheet 0
    sheet.each 1 do |row|
      unless row.length == 0
        SearchTerm.new(phrase: row[0], cost: row[8].to_f, conversions: row[10].to_i, clicks: row[4].to_i)
      end
    end
  end
end