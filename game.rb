class Game

  def initialize
    puts "Tic Tac Toe Game Starting"

    puts "Player 1, what's your name ?"
    name_one = gets.chomp
    @player_one = Player.new(name_one, "X")

    puts "Player 2, what's your name ?"
    name_two = gets.chomp
    @player_two = Player.new(name_two, "O")
    
    @current_player = @player_one
    @board = Board.new
  end

  def switch_player
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

  def move
    puts "#{@current_player.name} , where do you want to make your #{@current_player.value} ? (number from 1 to 9)"
    cell = gets.chomp.to_i
		if cell == @board.cell[cell - 1]
			@board.cell[cell - 1] = @current_player.value
		else
			puts "This is not a valid move, please try again!: "
			switch_player
		end
  end

  def play
    loop do
      @board.display
      move
        if game_over?
          puts "Game over play again nobady won !"
          break
        else
          switch_player
        end
      @board.display
      if @board.is_win?
        puts "Game over #{@current_player.name} won!"
      else
        puts "#{@current_player.name} your turn to play !"
      end
    end
  end

  def game_over?
    @board.is_win? || @board.cell.all? { |cell| cell.is_a? String }
  end
end