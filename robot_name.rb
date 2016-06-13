class Robot
  attr_reader :name

  @@taken_names = []

  def initialize
    reset
  end

  def reset
    @name = ''
    loop do
      potential_name = generate_name
      unless @@taken_names.include? potential_name
        @name = potential_name
        @@taken_names << potential_name
        break
      end
    end
  end

  def generate_name
    letters = (0...2).map { ('A'..'Z').to_a[rand(26)] }.join
    letters + (0...3).map { rand(10).to_s }.join
  end
end