class Definition
  @@definitions = {}

  attr_reader :definition, :id
  def initialize(definition:, glob_id:)
    @definition = definition
    @id = glob_id
  end

  def save()
    @@definitions[self.id] = Definition.new(
        definition: self.definition,
        glob_id: self.id
    )
    self
  end

  def self.all()
    @@definitions.values()
  end

  def self.find_definition(glob_id)
    @@definitions[glob_id]
  end

  def delete(glob_id)
    @@definitions.delete(glob_id)
  end

  def self.clear()
    @@definitions = {}
  end

  def update(new_definition:)
    @definition = new_definition
    self
  end

end
