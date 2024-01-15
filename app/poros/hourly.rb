class Hourly
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time = Time.at(data[:time]).strftime("%I:%M %p")
    @temperature = data[:temp]
    @conditions = data[:condition]
    @icon = data[:icon]
  end
end
