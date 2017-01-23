

class Feed

  attr_reader :source

  def initialize(options)
    @source = options.fetch('source')
  end


end