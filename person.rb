class person
  attr_reader :id, :name, :age
  def initialize (age, parent_permission: true, name: "Unknown")
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def name=(new_name)
    @name = new_name
  end

  def age=(new_age)
    @age = new_age
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id 
    timestamp = Time.now.to_i
    random_id = rand(1000..9999)
    id = "#{random_id}#{timestamp}"
    id.to_i
  end
end