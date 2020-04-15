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

# It should be the total
# cost divided by the number of participants.

  def split
    total_cost / @participants.count
  end

# the amount each person owes is the difference
# between what they paid and the `split`

  def owed
    debt = {}
    @participants.each do |participant|
      debt[participant.first] = split - participant.last
    end
    debt
  end
end
