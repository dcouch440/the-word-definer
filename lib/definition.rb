class Definition
  @@definitions = {}

  attr_reader :id, :definition
  def initialize(definition:, glob_id:)
    @definition = definition
    @id = glob_id
  end

  def save()
    definition_to_save = Definition.new(
      definition: definition,
      glob_id: id
    )
    @@definitions[id] = definition_to_save
  end

  def self.all()
    @@definitions.values()
  end

  def self.find_definition(glob_id:)
    @@definitions[glob_id]
  end


  def delete(glob_id:)
    @@definitions.delete(glob_id)
  end

  def self.clear()
    @@definitions = {}
    @@local_id = 0
  end

  def update(new_definition:)
    @definition = new_definition
  end

end
