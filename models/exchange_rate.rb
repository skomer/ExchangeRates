require 'date'


class ExchangeRate

  attr_reader :date_requested, :from_currency, :to_currency

  def initialize(date_requested, from_currency, to_currency)
    @date_requested = date_requested
    @from_currency = from_currency
    @to_currency = to_currency
  end

  





  # ExchangeRate.at(Date.today,'GBP','USD')
  # GBP is from currency and USD to currency

end