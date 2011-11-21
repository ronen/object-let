require "spec_helper"

describe "Object" do

  it "should support let method" do
    obj = Object.new
    obj.should be_respond_to :let
  end

  it "let should yield the object" do
    obj = Object.new
    obj.let { |arg|
      arg.should equal obj
    }
  end

  it "let should return the block result" do
    obj = Object.new
    obj.let{|arg| 3}.should == 3
  end
end
