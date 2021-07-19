class Question
  attr_reader :number1, :number2, :result
  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @result = @number1 + @number2
  end

  def is_correct(input)
    self.result == input.to_i
  end

  def ask_question(player)
    puts "#{player}: What does #{self.number1} plus #{self.number2} equal?"
  end
end

