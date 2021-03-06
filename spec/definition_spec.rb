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

  describe(".find_definitions") do
    it("returns the instance by its global id") do
      definition = Definition
        .new(definition: "Jumping", global_id: 1)
      definition.save()
      expect(Definition.find_definitions(g_id: 1)[0].global_id)
        .to(eq(definition.global_id))
    end
  end

  describe(".find_definition") do
    it("returns the specific definition") do
      definition = Definition
        .new(definition: "Jumping", global_id: 1)
      definition.save()
      expect(Definition.find_definition(g_id: 1, d_id: 1).global_id)
        .to(eq(definition.global_id))
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

  describe(".delete") do
    it("deletes the selected album") do
      definition = Definition
        .new(definition: "Jumping", global_id: 1)
      definition.save()
      definition2 = Definition
        .new(definition: 'Soaring', global_id: 1)
      definition2.save()
      definition.delete(g_id: 1, d_id: 1)
      expect(Definition.all_definitions).to(eq(['Soaring']))
    end
  end
  describe(".update") do
    it("updates a definition at a given index") do
      @definition = Definition
        .new(definition: "Jumping", global_id: 1)
      @definition.save()
      @definition.update(new_definition: "Red")
      expect(@definition.definition).to(eq("Red"))
    end
  end
end
