require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../tennis'

describe Tennis::Game do
    let(:game) { Tennis::Game.new }
    # begin initialize test
    describe '.initialize' do
        it 'creates two players' do
          expect(game.player1).to be_a(Tennis::Player)
          expect(game.player2).to be_a(Tennis::Player)
        end
    end
    

    describe '#wins_ball' do
        it 'increments the points of the winning player' do
            game.wins_ball(game.player1)
            expect(game.player1.points).to eq(1)
        end
    end

    describe "#announce_score" do
        context "When points are 0 and 0" do
            it "announces the score as love all" do
                expect(game.announce_score).to eq "The score is love all!"
            end
        end

        context "When points are 3 and 3" do
            it "announces the score as duece" do
                3.times {game.wins_ball(game.player2)}
                3.times {game.wins_ball(game.player1)}
                expect(game.announce_score).to eq "Deuce!"
            end
        end

        context "When points are 0 1" do
            it "announces the score as love fifteen" do
                game.wins_ball(game.player2)

                expect(game.announce_score).to eq "The score is love fifteen!"
            end
        end

        context "When points are 1 0" do
            it "announces the score as fifteen love" do
                game.wins_ball(game.player1)

                expect(game.announce_score).to eq "The score is fifteen love!"
            end
        end

        context "When points are 1 3" do
            it "announces the player 2 wins" do
                game.wins_ball(game.player1)
                3.times {game.wins_ball(game.player2)}

                expect(game.announce_score).to eq "Player 2 wins!"
            end
        end

        context "When points are 2 3" do
            it "announces advantage player 2" do
                2.times {game.wins_ball(game.player1)}
                3.times {game.wins_ball(game.player2)}

                expect(game.announce_score).to eq "Advantage player 2!"
            end
        end

        context "When points are 2 2" do
            it "announces fourty all" do
                2.times {game.wins_ball(game.player1)}
                2.times {game.wins_ball(game.player2)}

                expect(game.announce_score).to eq "The score is thirty all!"
            end
        end

        context "When points are 6 5" do
            it "announces advantage player 1" do
                6.times {game.wins_ball(game.player1)}
                5.times {game.wins_ball(game.player2)}

                expect(game.announce_score).to eq "Advantage player 1!"
            end
        end

        context "When points are 5 6" do
            it "announces advantage player 2" do
                5.times {game.wins_ball(game.player1)}
                6.times {game.wins_ball(game.player2)}

                expect(game.announce_score).to eq "Advantage player 2!"
            end
        end

        context "When points are 5 7" do
            it "announces player 2 wins" do
                5.times {game.wins_ball(game.player1)}
                7.times {game.wins_ball(game.player2)}

                expect(game.announce_score).to eq "Player 2 wins!"
            end
        end

        context "When points are 5 4" do
            it "announces advantage player 1" do
                5.times {game.wins_ball(game.player1)}
                4.times {game.wins_ball(game.player2)}

                expect(game.announce_score).to eq "Advantage player 1!"
            end
        end

        context "When points are 10 8" do
            it "announces player 1 wins" do
                10.times {game.wins_ball(game.player1)}
                8.times {game.wins_ball(game.player2)}

                expect(game.announce_score).to eq "Player 1 wins!"
            end
        end



    end
end

describe Tennis::Player do
    let(:player) do
        player = Tennis::Player.new
    end

    describe '.initialize' do
        it 'sets the points to 0' do
            expect(player.points).to eq(0)
        end 
    end

    describe '#record_won_ball!' do
        it 'increments the points' do
            player.record_won_ball!

            expect(player.points).to eq(1)
        end
    end

    describe '#score' do
        context 'when points is 0' do
            it 'returns love' do
                expect(player.score).to eq('love')
            end
        end
        
        context 'when points is 1' do
            it 'returns fifteen' do
                player.points = 1
                expect(player.score).to eq('fifteen')
            end 
        end
        
        context 'when points is 2' do
            it 'returns thirty' do
                player.points = 2
                expect(player.score).to eq "thirty"
            end 
        end
        
        context 'when points is 3' do
            it 'returns forty' do
                player.points = 3
                expect(player.score).to eq "fourty"
            end
        end
    end
end