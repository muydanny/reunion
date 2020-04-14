class Activity

  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(participant, cost)
    @participants[participant] = cost
  end

  def total_cost
    @participants.values.map(&@participant).reduce(:+)
  end

  def split
    total_cost / @participants.count
  end

  # For the `owed` method, the amount each person owes is the
  # difference between what they paid and the `split`.

  def owed
    debt = {}
    @participants.each do |participant, cost|
      debt[participant] = (split - cost)
    end
    debt
  end
end
