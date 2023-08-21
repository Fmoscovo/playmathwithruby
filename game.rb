class Game
  attr_accessor :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def switch_turn
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def display_scores
    puts "Scores:"
    [@player1, @player2].each do |player|
      puts "#{player.name}: #{player.lives}/3"
    end
  end

  def announce_winner
    winner = (@player1.alive?) ? @player1 : @player2
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
  end

  def start
    while @player1.alive? && @player2.alive?
      question = Question.new
      puts "#{current_player.name}: #{question.ask}"
      answer = gets.chomp.to_i

      if question.validate_answer?(answer)
        puts "YES! You are correct."
      else
        puts "Seriously? No!"
        current_player.lose_life
      end

      display_scores
      switch_turn
    end

    announce_winner
  end
end
