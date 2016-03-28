require 'rainwater_trapping'

describe "Rainwater Trapping" do
  describe "rain_trap" do
    it "works on standard example" do
      expect(rain_trap([0,1,0,2,1,0,1,3,2,1,2,1])).to eq(6)
    end

    it "works on semi-random examples" do
      expect(rain_trap([0,1,2,1,2,3,0])).to eq(1)
      expect(rain_trap([5,4,3,2,1,2,3,2,1,3])).to eq(7)
      expect(rain_trap([4,0,2,1,2,1,4])).to eq(14)
    end

    it "works on symmetrical examples" do
      expect(rain_trap([1,3,5,0,5,3,1])).to eq(5)
      expect(rain_trap([1,0,2,2,0,1])).to eq(2)
    end

    it "works on a mountain-like set" do
      expect(rain_trap([1,2,3,4,3,2,1])).to eq(0)
    end

    it "works on a valley-like set" do
      expect(rain_trap([4,3,2,1,2,3,4])).to eq(9)
    end

    it "works on a down slope" do
      expect(rain_trap([5,4,3,2,1,0])).to eq(0)
    end

    it "works on an up slope" do
      expect(rain_trap([0,1,2,3,4,5])).to eq(0)
    end

    it "works on a nearly-flat set" do
      expect(rain_trap([1,0,1,1,1,0,1,1])).to eq(2)
    end

    it "works on a totally flat set" do
      expect(rain_trap([1,1,1,1,1,1])).to eq(0)
    end

    it "works on a single pit" do
      expect(rain_trap([5,5,5,0,5,5])).to eq(5)
    end

    it "works on multiple pits" do
      expect(rain_trap([5,5,5,0,5,5,5,5,0,5,5])).to eq(10)
    end
  end
end
