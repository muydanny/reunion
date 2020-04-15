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
    debt = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each do |name, cost|
        debt[name] += cost
      end
    end
    debt
  end

  def summary
    breakout.collect { |k,v| "#{k}: #{v}" }.join("\n")
  end

end
