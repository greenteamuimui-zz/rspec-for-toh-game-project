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

    context "when it is a valid move" do
      it "moves the disc from 'from_pile' tower to 'to_pile' tower and lands on top" do
        game.tower = [[3,2],[],[1]]
        game.move(0, 1)
        expect(game.tower[1][-1]).to eq(2)
      end
    end

    context "when the move is invalid" do
    let(:game1) do
        game1 = TOH.new
        game1.tower = [[3,2],[],[1]]
        game1
      end
      context 'when the pile that is being drawn from is empty' do
        it "should raise error that indicates the pile is empty" do
          expect { game1.move(1, 2)}.to raise_error("Empty pile")
        end
      end

    context "when the disc being moved is bigger than the last disc on the to_pile" do

      it "should raise error that indicates the disc is too big to be moved" do
        p game.tower
        expect {game1.move(0, 2)}.to raise_error("Disc is too big")
      end
    end

  end

    describe "#won?" do

      context 'when the game is won' do
        before(:each) do
          game.tower = [[],[3,2,1],[]]
        end

        it "should end the game and return true" do
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
end
