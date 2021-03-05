require 'rspec'
require 'pry'
require 'definition'

describe("Definitions") do

  before(:each) do
    Definition.clear()
  end

  describe(".all") do
    it("returns an empty array if their is no values") do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe(".all_definitions") do
    it("returns the definitions from the global definitions object") do
      Definition
        .new(definition: "Jumping", global_id: 1).save()
      expect(Definition.all_definitions)
        .to(eq(["Jumping"]))
    end
  end

  describe(".save") do
    it("saves the definitions in an object") do
      Definition
        .new(definition: "Jumping", global_id: 1).save()
        .new(definition: "Soaring", global_id: 1).save()
      expect(Definition.all_definitions)
        .to(eq(["Jumping", "Soaring"]))
    end
  end

  describe(".clear") do
    it("clears all Definitions") do
      Definition
        .new(definition: "Jumping", global_id: 1).save()
        .new(definition: 'Soaring', global_id: 1).save()
        .clear()
      expect(Definition.all_definitions)
        .to(eq([]))
    end
  end

end
