
class Question

  attr_reader :num1, :num2, :answer, :user_input

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = (num1 + num2).to_s
    generate_question
    user_answer
    correct
  end

  def generate_question
    puts "======New Question======"
    puts "What is #{@num1} plus #{@num2}?"
  end

  def user_answer
    puts "What is your answer?"
    @user_input = gets.chomp
  end

  def correct
    @answer == @user_input ? true : false
  end
end





