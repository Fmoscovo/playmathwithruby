class Question
  attr_reader :number1, :number2

  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
  end

  def ask
    "What does #{number1} plus #{number2} equal?"
  end

  def validate_answer?(answer)
    answer == (number1 + number2)
  end
end
