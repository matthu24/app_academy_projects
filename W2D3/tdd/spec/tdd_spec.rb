require 'tdd'
require 'rspec'

RSpec.describe Array do


  describe "#my_uniq" do
    subject(:arr) { [1, 2, 1, 3, 3] }
    let(:result) { arr.my_uniq }

    it "removes duplicates from an array" do
      expect(result).to eq([1, 2, 3])

    end

    it "doesn't modify original array" do
      arr.my_uniq
      expect(arr).to eq(arr)
    end

    it "returns uniq elements in order they first appeared" do
      expect(result).to_not eq([1, 3, 2])
      expect(result).to_not eq([3, 2, 1])
      expect(result).to eq([1, 2, 3])
    end

  end

  describe "#two_sum" do
    subject(:arr) { [-1, 0, 2, -2, 1] }
    let(:result) { arr.two_sum }
    it "finds all indices of pairs that sum to zero" do
      expect(result).to eq([[0, 4], [2, 3]])
    end

    it "sorts dictionary-wise" do
      expect(result[0] )
    end

  end

  describe "#my_transpose" do
    subject(:arr) do
      [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
      ]
    end
    let(:result) { arr.my_transpose }
    let(:transposed_arr) do
      [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
      ]
    end
    it "transposes array" do
      expect(result).to eq(transposed_arr)
    end
  end






end
