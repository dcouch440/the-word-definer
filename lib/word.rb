class Word
  @@words = {}
  @@global_Count = 0

  attr_reader :word, :glob_id
  def initialize(word:, glob_id: nil)
    @word = word
    @glob_id = (glob_id || @@global_Count += 1)
  end

  def save()
    @@words[glob_id] = Word.new(word: word, glob_id: glob_id)
    self
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

  def self.find(glob_id:)
    @@words[glob_id]
  end

  def delete(glob_id:)
    @@words.delete(glob_id)
  end

end