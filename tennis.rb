# Require the Announcer Module that is needed for
# Game#announce_score to function correctly.
require_relative 'AnnouncerMod.rb'

module Tennis
    class Game
        include Announcer
        attr_accessor :player1, :player2

        def initialize
          @player1 = Player.new
          @player2 = Player.new
        end

        # Records a win for a ball in a game.
        #
        # winner - The Integer (1 or 2) representing the winning player.
        #
        # Returns the score of the winning player. 
        def wins_ball(player)
          player.record_won_ball!
        end


        # Announces the score of the game.
        # 
        # Examples
        # 
        #   player1.points = 2
        #   player2.points = 3
        #
        #   announce_score
        #   #=> "Advantage player 2!"
        #
        # Returns the String of the correct score or the
        # String annoucing the win, depending on the number 
        # of points for each player. 
        def announce_score
            if both_player_points < 3
                report_scores
            else
                if absolute_diff >= 2
                    report_win
                elsif absolute_diff == 1
                    report_advantage
                else
                    "Duece!"
                end
            end
        end

    end


  class Player
        attr_accessor :points

        def initialize
          @points = 0
        end

        # Increments the score by 1.
        #
        # Returns the Integer new score.
        def record_won_ball!
          @points += 1
        end
        
        #Converts from Integer points to String that
        # is used when announcing the score.
        #
        # Returns the String score for the player.
        def score
            case points
                when 0
                    'love'
                when 1
                    'fifteen'
                when 2
                    'thirty'
                when 3
                    'fourty'
            end
        end

    end
end