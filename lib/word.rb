class Word
  @@words = {}
  @@global_Count = 0

  attr_reader :word, :global_id
  def initialize(word:, id: nil)
    @word = word
    @global_id = (id || @@global_Count += 1)
  end

  def save()
    @@words[global_id] = Word.new(word: word, id: global_id)
    Word
  end

  def self.all_words()
    @@words.values().collect {|instance| instance.word}
  end

  def self.all()
    @@words.values()
  end

  def self.clear()
    @@words = {}
    @@global_Count = 0
  end
  def self.find(id)
    @@words[id]
  end
end