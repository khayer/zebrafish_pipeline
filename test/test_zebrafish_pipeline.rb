require 'minitest/spec'
require 'minitest/autorun'
require 'zebrafish_pipeline'

describe ZebrafishPipeline do
  it "can be created with no arguments" do
    ZebrafishPipeline.new.must_be_instance_of ZebrafishPipeline
  end

  it "can be created with a specific size" do
    ZebrafishPipeline.new.wont_be_instance_of Array
  end
end