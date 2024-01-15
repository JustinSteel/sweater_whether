class Hourly
  attr_reader :time,
              :temperature,
              :condition,
              :icon

  def initialize(data)
    @time = formated_time(data[:time])
    @temperature = data[:temp_f]
    @condition = data[:condition][:text]
    @icon = data[:condition][:icon]
  end

  def formated_time(time)
     time.slice(11..15)
  end
end
