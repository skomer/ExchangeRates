require 'date'


class ExchangeRate

  attr_reader :date_requested, :from_currency, :to_currency

  def initialize(options)
    @date_requested = options.fetch('date_requested')
    @from_currency = options.fetch('from_currency')
    @to_currency = options.fetch('to_currency')
  end

  





  # ExchangeRate.at(Date.today,'GBP','USD')
  # GBP is from currency and USD to currency

end