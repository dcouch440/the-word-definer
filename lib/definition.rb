class Definition
  @@definitions = {}
  @@local_id = 0

  attr_reader :definition, :global_id, :id
  def initialize(definition:, global_id:, id: nil)
    @definition = definition
    @global_id = global_id
    @id = (id || @@local_id += 1)
  end

  def save
    if @@definitions[self.global_id]
      @@definitions[self.global_id][self.id] = Definition.new(
        definition: self.definition,
        global_id: self.global_id,
        id: self.id
      )
    else
      @@definitions[global_id] = Definition.new(
        definition: definition,
        global_id: global_id,
        id: id
      )
    end
  end

  def self.all
    @@definitions.values()
  end

  def self.all_definitions
    @@definitions.values().collect {|instance| instance.definition}
  end

  def self.clear
    @@definitions = {}
    @@local_id = 0
  end
end
