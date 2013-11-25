module Announcer

    # Includes both the points for the players.
    # 
    # Returns the point values of both players.
    def players_less_than_three?
        player1.points < 3 && player2.points < 3
    end

    # Checks for equal scores.
    #
    # Returns boolean.
    def scores_equal?
        @player1.points == @player2.points
    end

    # Reports the scores of each player individually.
    #
    # Returns a String of each score.
    def report_both_scores
        "The score is #{@player1.score} #{player2.score}!"
    end

    # Announces the score as a current tie.
    # 
    # Returns a String reporting a tie score below 3.
    def report_as_tie
        "The score is #{@player1.score} all!"
    end

    # Calculates the absolute value of the difference between
    # the player 1 and player 2 scores.
    #
    # Returns an Integer
    def absolute_diff
        (@player1.points - @player2.points).abs
    end

    # Reports the scores in the correct verbal syntax
    # and in the correct format.
    #
    # Examples
    # 
    #   player1.points = 1
    #   player2.points = 1
    #
    #   report_scores
    #   #=> "The score is fifteen all!"
    #
    #   player1.points = 2
    #   player2.points = 1
    #
    #   report_scores
    #   #=> "The score is thirty fifteen!"
    #
    # Returns the String of the single tie score or the
    # String of both scores, depending on the number 
    # of points for each player. 
    def report_scores
        if scores_equal?
            report_as_tie
        else
            report_both_scores
        end
    end

    # Reports the scores of the winning player.
    #
    # Returns a String of the winning player.

    def report_win
        if @player1.points > @player2.points
            if win_set?(player1)
                "Player 1 wins the set!"
            elsif tie?
                announce_tiebreaker
            else
                record_game_win!(player1)
                "Player 1 wins!"
            end
        else 
            if win_set?(player2)
                "Player 2 wins the set!"
            elsif tie?
                announce_tiebreaker
            else
                record_game_win!(player2)
                "Player 2 wins!"
            end
        end
    end

    # Checks to see if the current play is a set-winning game.
    #
    # player - A variable representing player 1 or player 2. 
    #
    # Examples
    #   
    #   player1.games_won = 5
    #   player2.games_won = 6
    #
    #   win_set?(player2)
    #   => true
    #
    # Returns boolean.
    def win_set?(player)
        player.games_won >= 6 && player.opponent.games_won < 6
    end

    # Announcement that is triggered when there is a tie game.
    #
    # Returns a String announcing tie.
    def announce_tiebreaker
        "There is a tie. Starting final match game!"
    end

    # Checks to see if the current play results in a tie set.
    #
    #
    # Examples
    #   
    #   player1.games_won = 6
    #   player2.games_won = 6
    #
    #   tie?
    #   => true
    #
    # Returns boolean.
    def tie?
        player1.games_won == 6 && player2.games_won == 6
    end


    # Increments the player#games_won by 1.
    #
    # player - A variable representing player 1 or player 2. 
    #
    # Examples
    #   
    #   player1.games_won = 0
    #   player2.games_won = 0
    #
    #   record_game_win!(player2)
    #   
    #   player2.games_won
    #   => 1
    #
    # Returns nothing
    def record_game_win!(player)
        player.games_won+= 1
    end

    # Reports the player with the advantage.
    #
    # Returns a String of the advantaged player.
    def report_advantage
        if @player1.points > @player2.points
           "Advantage player 1!"
        else 
            "Advantage player 2!"
        end
    end
end