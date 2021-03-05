class Words
  @@global_count = 0
  def initialize(word:, id: nil)
    @word = :word
    @id = @@global_count += 1
  end
  def create_word()
    
  end
end

puts Words.new(new_word: 'dogs')