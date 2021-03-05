require 'rspec'
require 'pry'
require 'word'

describe("Word") do

  describe(".save") do
    it("saves words in an object") do
      Word
        .new(word: "Dog").save()
        .new(word: "Cat").save()
      expect(Word.all)
        .to(eq(["Dog", "Cat"]))
    end
  end

  describe(".clear") do
    it("clears all the words") do
      Word
        .new(word: "Dog").save()
        .new(word: "Cat").save()
        .clear()
      expect(Word.all)
        .to(eq([]))
    end
  end

  describe(".all") do
    it("returns all words from the words object") do
      Word
        .new(word: "Dog").save()
        .new(word: "Cat").save()
      expect(Word.all)
        .to(eq(["Dog", "Cat"]))
    end
  end

end