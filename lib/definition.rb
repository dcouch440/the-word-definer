class Definition
  @@definitions = {}
  @@local_id = 0

  attr_reader :glob_id, :id, :definition
  def initialize(definition:, glob_id:, id: nil)
    @definition = definition
    @glob_id = glob_id
    @id = (id || @@local_id += 1)
  end

  def save()
    definition_to_save = Definition.new(
      definition: definition,
      glob_id: glob_id,
      id: id
    )
    if @@definitions[glob_id]
      @@definitions[glob_id][id] = definition_to_save
    else
      @@definitions[glob_id] = {id => definition_to_save}
    end
    Definition
  end

  def self.all()
    @@definitions.values()
  end

  def self.find_definitions(id)
      unless @@definitions.empty?
        unless @@definitions[id].empty?
          @@definitions[id].values()
        end
      end
  end

  def self.find_definition(glob_id:, def_id:)
    @@definitions[glob_id][def_id]
  end

  def self.all_definitions()
    @@definitions.values().collect {|hash_id_instance|
      hash_id_instance.values().collect {|instance|
        instance.definition
      }
    }.flatten()
  end

  def delete(glob_id:, def_id:)
    @@definitions[glob_id].delete(def_id)
  end

  def self.clear()
    @@definitions = {}
    @@local_id = 0
  end

  def update(new_definition:)
    @definition = new_definition
  end

end
