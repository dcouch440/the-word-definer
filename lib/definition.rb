class Definition
  @@definitions = {}
  @@local_id = 0

  attr_reader :definition, :global_id, :id
  def initialize(definition:, global_id:, id: nil)
    @definition = definition
    @global_id = global_id
    @id = (id || @@local_id += 1)
  end

  def save()
    definition_to_save = Definition.new(
      definition: definition,
      global_id: global_id,
      id: id
    )
    if @@definitions[global_id]
      @@definitions[global_id][id] = definition_to_save
    else
      @@definitions[global_id] = {id => definition_to_save}
    end
    Definition
  end

  def self.all()
    @@definitions.values()
  end

  def self.find_definitions(global_id:)
      @@definitions[global_id].values()
  end

  def self.find_definition(global_id: , definition_id:)
    @@definitions[global_id][definition_id]
  end
  def self.all_definitions()
    @@definitions.values().collect {|hash_id_instance|
      hash_id_instance.values().collect {|instance|
        instance.definition
      }
    }.flatten()
  end

  def self.clear()
    @@definitions = {}
    @@local_id = 0
  end

end
