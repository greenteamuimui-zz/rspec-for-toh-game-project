require 'rspec'
require 'toh'

describe TOH do
  subject(:game) {TOH.new}

  describe "#initialize" do
    it "set up the stack in the right way" do
      expect(game.tower).to eq([[3, 2, 1 ], [], []])
    end

  end

  describe "#move" do
    it "moves the disc from 'from_pile' tower to 'to_pile' tower and lands on top" do
      game.move(0, 1)
      expect(game.tower[1][-1]).to eq(game.tower[0][-1])
    end

    context 'when the pile that is being drawn from is empty' do
      before(:each) do
        game.tower = [[3,2],[],[1]]
      end

      it "should raise error that indicates the pile is empty" do
        expect { game.move(1, 2)}.to raise_error("Empty pile")
      end
    end

  end

    context "when the disc being moved is bigger than the last disc on the to_pile" do
      before(:each) do
        game.tower = [[3,2],[],[1]]
      end

      it "should raise error that indicates the disc is too big to be moved" do
        expect { game.move(0, 2) }.to raise_error("Disc is too big")
      end

    end

    describe "#won?" do

      context 'when the game is won' do
        before(:each) do
          game.tower = [[],[3,2,1],[]]
        end

        it "should end the game and display a message" do
          expect(game.won?).to eq true
        end

      end

      context 'when the game is not over' do
        before(:each) do
          game.tower = [[1],[2,3],[]]
        end

        it "should continue the game" do
          expect(game.won?).to eq false
        end

      end

    end



end
