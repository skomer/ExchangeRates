require 'pry-byebug'

class FxRate

  attr_reader :id, :rate_date, :currency, :rate

  def initialize(options)
    @id = options['id'].to_i
    @rate_date = options.fetch('rate_date')
    @currency = options.fetch('currency')
    @rate = options.fetch('rate')
  end





end