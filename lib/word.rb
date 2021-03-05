class Words
  @@words = {}
  @@global_id = 0

  def initialize(word:, id: nil)
    @word = :word
    @global_id = @@global_id += 1
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end
end

puts Words.new(new_word: 'dogs')