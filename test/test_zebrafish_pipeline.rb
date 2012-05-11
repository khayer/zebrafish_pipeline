require 'minitest/spec'
require 'minitest/autorun'
require 'zebrafish_pipeline'

describe ZebrafishPipeline do
  it "can be created with no arguments" do
    ZebrafishPipeline.new.must_be_instance_of ZebrafishPipeline
  end

  it "is not an Array" do
    ZebrafishPipeline.new.wont_be_instance_of Array
  end
end

describe Aligner do
  it "can be created with no arguments" do
    Aligner.new.must_be_instance_of Aligner
  end

  it "is not an Array" do
    Aligner.new.wont_be_instance_of Array
  end

  it "it has a method add options" do
    Aligner.add_options(Array.new).must_equal 5
  end
end

#describe Usage do
#  it "can be created with no arguments" do
#    Usage.new.must_be_instance_of Usage
#  end
#
#  it "has a method usage" do
#    puts Usage.new().usage
#    Usage.new()::usage.must_be_instance_of String
#  end

#end