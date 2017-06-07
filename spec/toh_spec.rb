require 'rspec'
require 'toh'


describe TOH do
  subject(:game) {TOH.new}

  describe "#move" do
    it "moves the disc from 'from_pile' array to 'to_pile' array and lands on top" do
      move(0, 1)
      expect(game.array[1][-1]).to eq(game.array[0][-1])
    end




    context 'when the pile that is being drawn is empty' do
      before(:each) do

      end

      it "should raise error that indicates the pile is empty" do
        expect { game.move(from_pile, to_pile)}.to raise_error("Empty pile")
      end
    end

  end

  context "when the disc being moved is bigger than the last disc on the to_pile" do
    before(:each) do

    end

    it "should raise error that indicates the disc is too big to be moved" do
      expect { game.move(from_pile, to_pile)}.to raise_error("Disc is too big")
    end
  end

end




end
