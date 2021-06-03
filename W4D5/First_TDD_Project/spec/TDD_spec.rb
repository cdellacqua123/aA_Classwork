require "TDD_Project"

describe "my_unique" do 
    let(:arr) { [1, 2, 1, 3, 3, 4] }
    let(:uniq_arr) { my_unique(arr.dup) }

    it "removes duplicate ele's in array" do 
        expect(uniq_arr.length).to eq(2)
    end

    it "returns unique elements in order they appear" do 
        expect(uniq_arr).to eq([2, 4])
    end

    it "returns a new array" do
        expect(uniq_arr.object_id).to_not eq(arr.object_id)
    end
end

describe "two_sum" do
    let(:arr) {[-1, 0, 2, -2, 1]}
    
    it "finds pairs of positions where ele's @ said positions sum to 0" do
        expect(two_sum(arr)).to eq([[0, 4], [2, 3]])
    end
end

describe "my_transpose" do
    let(:matrix) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
            ]}

    # before (:each) do 
        
    # end

    it "transposes a matrix" do
        expect(my_transpose(matrix)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end

    it "does not use the built-in #Array.transpose" do
        expect(matrix).not_to receive(:transpose)
    end
end



describe "pick_stocks" do
    let(:arr) {[5, 4, 3, 7, 8, 9]}
    it "finds a simple pair" do
        expect(pick_stocks(arr).length).to eq(2)
    end

    it "makes sure it buys on the dip & sells at the peak" do
        expect(pick_stocks(arr)).to eq([3, 9])
    end
end