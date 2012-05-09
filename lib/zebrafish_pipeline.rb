class ZebrafishPipeline
  attr_accessor :fwd, :rev

  def initialize()
    @fwd = "r1"
    @rev = "r2"
  end

  def to_s
    @fwd + ", " + @rev
  end

  def self.find_by_fwd(fwd)
    found = nil
    ObjectSpace.each_object(ZebrafishPipeline) { |o|
      found = o if o.fwd == fwd
    }
    found
  end

end