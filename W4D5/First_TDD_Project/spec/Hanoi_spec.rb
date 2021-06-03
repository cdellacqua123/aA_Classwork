require "Hanoi"

describe "Game" do

    let(:tower) {Game.new}
    let(:tower_1) {[[], [3, 2, 1], []]}

    describe "#initialize" do

        it "sets @stack to [[3, 2, 1], [], []]" do
            expect(tower.stacks).to eq([[3, 2, 1], [], []])
        end

    end

    describe "move" do
        it "should move from one stack to another" do
            expect(tower.move(0, 1)).to eq([[3, 2], [1], []])
        end
    end

    describe "win?" do
        it "should return true if the game has been won" do
            tower.move(0, 1)
            tower.move(0, 2)
            tower.move(1, 2)
            tower.move(0, 1)
            tower.move(2, 0)
            tower.move(2, 1)
            tower.move(0, 1)

            expect(tower.win?).to eq(true)
        end
    end
end