require "spec_helper"

describe "Object" do

  it "yields the object" do
    obj = Object.new
    obj.let { |arg|
      expect(arg).to eq obj
    }
  end

  it "returns the block result" do
    obj = Object.new
    expect(obj.let {|arg| 3}).to eq 3
  end

end
