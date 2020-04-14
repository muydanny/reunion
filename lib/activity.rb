class Activity

  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, total_cost)
    @participants[name] = total_cost
  end

  def total_cost
    @participants.values.sum
  end
end
