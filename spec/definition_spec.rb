require 'rspec'
require 'pry'
require 'definition'

describe "Definition" do

  before :each do
    Definition.clear()
  end

  describe ".all" do
    it "returns an empty array if their is no values" do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe ".find_definition" do
    it "returns the specific definition" do
      definition = Definition.new(definition: "Jumping", glob_id: 1).save()
      expect(Definition.find_definition(glob_id: 1).id).to(eq(definition.id))
    end
  end

  describe ".save" do
    it "saves the definitions in an object" do
      definition = Definition.new(definition: "Jumping", glob_id: 1).save()
      expect(Definition.find_definition(glob_id: 1).id).to(eq(definition.id))
    end
  end

  describe ".clear" do
    it "clears all Definitions" do
      definition = Definition.new(definition: "Jumping", glob_id: 1).save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe ".delete" do
    it "deletes the selected album" do
      definition = Definition.new(definition: "Jumping", glob_id: 1)
        .save().delete(glob_id: 1)
      expect(Definition.all()).to(eq([]))
    end
  end

  describe ".update" do
    it "updates a definition at a given index" do
      @definition = Definition.new(definition: "Jumping", glob_id: 1).save()
      @definition.update(new_definition: "Red")
      expect(@definition.definition).to(eq("Red"))
    end
  end

end

