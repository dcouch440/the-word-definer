class Word
  @@words = {}
  @@global_Count = 0

  attr_reader :word, :glob_id
  def initialize(word:, glob_id: nil)
    @word = word
    @glob_id = (glob_id || @@global_Count += 1)
  end

  def save()
    @@words[self.glob_id] = Word.new(word: self.word, glob_id: self.glob_id)
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

  def update(new_word:)
    @word = new_word
    self
  end

  def self.find(glob_id)
    @@words[glob_id]
  end

  def delete(glob_id)
    @@words.delete(glob_id)
    if Definition.find_definition(glob_id)
      Definition.find_definition(glob_id).delete(glob_id)
    end
  end

end