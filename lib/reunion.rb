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

  def breakout
    total = {}
    @activities.each do |activity|
      activity.participants.each do |participant, cost|
        if total[participant] == nil
          total[participant] = 0
        end
        total[participant] += activity.owed[participant]
      end
    end
    total
  end

  def summary
    breakout.flatten
  end
end
