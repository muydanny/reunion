class Reunion

  attr_reader :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum do |activity|
      activity.total_cost
    end
  end

  # breakout` method, the key is a person's
  # name and the value is what they owe for
  # the whole reunion. This should be
  # the combination of what they owe from all activities.

  def breakout
    debt = {}
    @activities.each do |activity|
      debt[@participants] = activity.owed
    end
    debt.compact
  end
end
