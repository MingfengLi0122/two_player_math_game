class Game 
  attr_accessor :player1, :player2, :userinput
  
  def initialize(game_name)
    @game_name = game_name
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @userinput = nil
  end

  def new_question(player_name, player)
    new_question = Question.new
    new_question.ask_question(player_name)
    print ">"
    self.userinput = gets.chomp
    if (new_question.is_correct(self.userinput))
      puts "Yes! You are correct"
      track_life(self.player1, self.player2)
    else 
      puts "Seriously? No!"
      player.lose_life
      track_life(self.player1, self.player2)
    end
  end

  def track_life(player1, player2)
    puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
  end

  def win
    if self.player1.is_dead
      puts "#{self.player2.name} wins with score of #{self.player2.lives}/3"
      puts "-----------GAME OVER------------"
      puts "Good Bye!"
      exit(0)
    end
    if self.player2.is_dead
      puts "#{self.player1.name} wins with score of #{self.player1.lives}/3"
      puts "-----------GAME OVER------------"
      puts "Good Bye!"
      exit(0)
    end
  end

  def turn
    new_question(self.player1.name, self.player1)
    win
    puts "-----------NEW TURN------------"
    new_question(self.player2.name, self.player2)
    win
    puts "-----------NEW TURN------------"
    turn
  end

  def start_game
    turn
  end
end