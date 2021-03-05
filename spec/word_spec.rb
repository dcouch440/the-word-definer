require 'rspec'
require 'pry'
require 'word'

describe("Word") do
  before(:each) do
    Word.clear()
  end
  describe(".save") do
    it("saves words in an object") do
      Word
        .new(word: "Dog").save()
        .new(word: "Cat").save()
      expect(Word.all_words)
        .to(eq(["Dog", "Cat"]))
    end
  end

  describe(".clear") do
    it("clears all the words") do
      Word
        .new(word: "Dog").save()
        .new(word: "Cat").save()
        .clear()
      expect(Word.all_words)
        .to(eq([]))
    end
  end

  describe(".all_words") do
    it("returns all words from the words object") do
      Word
        .new(word: "Dog").save()
        .new(word: "Cat").save()
      expect(Word.all_words)
        .to(eq(["Dog", "Cat"]))
    end
  end

  describe(".all") do
    it("returns all words from the words object") do
      word_1 = Word.new(word: "Dog")
      word_1.save()
      word_2 = Word.new(word: "Cat")
      word_2.save()
      expect(Word.all.map {|instance| instance.global_id})
        .to(eq([word_1.global_id, word_2.global_id]))
    end
  end

  describe(".find") do
    it("returns words corresponding to their global id") do
      word_1 = Word
        .new(word: "Dog").save()
      expect(Word.find(1).global_id)
        .to(eq(word_1.global_id))
    end
  end
end