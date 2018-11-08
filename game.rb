require "./player.rb"


class Game

  attr_reader :p1_name, :p2_name
  attr_accessor :p1, :p2, :turn

  def initialize
    @turn = 0
    introduction
    create_players
  end

  def introduction
    puts "Welcome to the Math Game!"
    puts "Here are the rules: each player gets 3 lives, players take turns, a player must answer the question, if the player answers incorrectly, they lose a life "
    puts "The game ends either a player's life is 0"
    puts ""
  end

  def create_players
    puts "Player1: enter your name"
    p1_name = gets.chomp
    @p1 = Player.new(p1_name)
    puts "Player2: enter your name"
    p2_name = gets.chomp
    @p2 = Player.new(p2_name)
  end

  def show_question
    @question = Question.new
  end

  def show_current_player
    case @turn
    when 0
      print "#{p1_name}"
    else
      print "#{p2_name}"
    end
  end

  def declare_winner
    
  end

  def show_score
    puts "#{p1.name}: #{p1.lives}/3 #{p2.name}: #{p2.lives}/3"
  end

  def start_game
    while(p1.lives > 0 || p2.lives > 0)
      show_current_player
      show_question
      if(@question.correct && @turn == 0)
        puts "Correct!"
        @turn +=1
      elsif !@question.correct && @turn ==0
        puts "Incorrect"
        @turn +=1
        p1.lose_life
      elsif @question.correct && @turn != 0
        puts "Correct!"
        @turn -=1
      else !@question.correct && @turn != 0
        puts "Incorrect"
        @turn -=1
        p2.lose_life
      end
        
      show_score
    end
  end

end



