require './lib/enumerable_methods'



describe "Enumerable Methods" do 

  before :all do
    @array = [0,1,2,3,4]
  end

  describe "#my_each" do
    it "Returns all numbers of enumerable" do
      a = 0;
      @array.my_each{|i| a+=i}
      expect(a).to eql 10
    end

    it "doesnt change the array content" do
      array = @array.my_each{|i| i+=i}
      expect(@array).to eql array
    end
  end

  describe "#my_select" do
    it "select appropriate elements" do
      expect(@array.my_select{|i| i>2}).to eql [3,4]
    end

    it "return empty when always false" do
      expect(@array.my_select{|i| i<0}).to be_empty
    end

    it "return self when always true" do
      expect(@array.my_select{|i| i>=0}).to eql @array
    end
  end

  describe "#my_all?" do
    it "returns true if all true" do
      expect(@array.my_all?{|i| i>=0}).to eql true
    end

    it "returns false if all false" do
      expect(@array.my_all?{|i| i<0}).to eql false
    end

    it "returns false if at least one false" do
      expect(@array.my_all?{|i| i>0}).to eql false
    end
  end

  describe "#my_any?" do
    it "returns true if all true" do
      expect(@array.my_any?{|i| i>=0}).to eql true
    end

    it "returns false if all false" do
      expect(@array.my_any?{|i| i<0}).to eql false
    end

    it "returns true if at least one true" do
      expect(@array.my_any?{|i| i>2}).to eql true
    end
  end

  describe "#my_none?" do
    it "returns false if all true" do
      expect(@array.my_none?{|i| i>=0}).to eql false
    end

    it "returns true if all false" do
      expect(@array.my_none?{|i| i<0}).to eql true
    end

    it "returns false if at least one true" do
      expect(@array.my_none?{|i| i>2}).to eql false
    end
  end

  describe "#my_count" do
    it "returns good number of elements" do
      expect(@array.my_count).to eql 5
    end

    it "returns 0 if empty" do
      array = []
      expect(array.my_count).to eql 0
    end
  end

end