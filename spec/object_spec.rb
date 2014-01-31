require "spec_helper"

shared_examples "let" do

  it "should be supported" do
    obj = Object.new
    obj.should be_respond_to method
  end

  it "should yield the object" do
    obj = Object.new
    obj.send(method) { |arg|
      arg.should equal obj
    }
  end

  it "should return the block result" do
    obj = Object.new
    obj.send(method) {|arg| 3}.should == 3
  end
end

shared_examples "let_if" do
  it "should not yield" do
    expect { subject.let_if { raise "in block"} }.to_not raise_error
  end

  it "should return nil" do
    subject.let_if { 12345 }.should be_nil
  end
end

describe "Object" do

  context "let" do
    it_should_behave_like "let" do
      let(:method) { :let }
    end
  end

  context "let_if" do
    it_should_behave_like "let" do
      let(:method) { :let_if }
    end

    context "when object is nil" do
      subject { nil }
      it_should_behave_like "let_if"
    end

    context "when object is false" do
      subject { false }
      it_should_behave_like "let_if"
    end

  end

end
