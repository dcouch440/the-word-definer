require 'rspec'
require 'pry'
require 'word'

describe "Word" do

  before :each do
    Word.clear()
  end

  describe ".save" do
    it "saves words in an object" do
      Word.new(word: "Dog").save()
      Word.new(word: "Cat").save()
      expect(Word.all_words).to(eq(["Dog", "Cat"]))
    end
  end

  describe ".clear" do
    it "clears all the words" do
      Word.new(word: "Dog").save()
      Word.new(word: "Cat").save()
      Word.clear()
      expect(Word.all_words).to(eq([]))
    end
  end

  describe ".update" do
    it "updates the word" do
      Word.new(word: "Dog").save().update(new_word: 'Cat').save()
      expect(Word.all_words).to(eq(['Cat']))
    end
  end

  describe ".all_words" do
    it "returns all words from the words object" do
      Word.new(word: "Dog").save()
      Word.new(word: "Cat").save()
      expect(Word.all_words).to(eq(["Dog", "Cat"]))
    end
  end

  describe ".all" do
    it "returns all words from the words object" do
      word_1 = Word.new(word: "Dog").save()
      word_2 = Word.new(word: "Cat").save()
      expect(Word.all.map {|instance| instance.glob_id}).to(eq([word_1.glob_id, word_2.glob_id]))
    end
  end

  describe ".find" do
    it "returns words corresponding to their global id" do
      word_1 = Word.new(word: "Dog").save()
      expect(Word.find(1).glob_id).to(eq(word_1.glob_id))
    end
  end

  describe ".delete" do
    it "deletes the word at the given global id" do
      word_1 = Word.new(word: "Dog", glob_id: 1).save().delete(1)
      expect(Word.find(1)).to(eq(nil))
    end
    it "deletes the definition along with the word" do
      word_1 = Word.new(word: "Dog", glob_id: 1).save().delete(1)
      expect(Definition.find_definition(1)).to(eq(nil))
    end
  end

end