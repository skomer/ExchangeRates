require 'date'
require_relative 'rate_record.rb'


class ExchangeRate

  attr_reader :date_requested, :from_currency, :to_currency

  def initialize(date_requested, from_currency, to_currency)
    @date_requested = date_requested
    @from_currency = from_currency
    @to_currency = to_currency
  end

  
  def at(date_requested, from_currency, to_currency)
    rate_record = RateRecord.rate_record_by_date_and_currency(date_requested, from_currency)
    return rate_record.rate
  end





  # ExchangeRate.at(Date.today,'GBP','USD')
  # GBP is from currency and USD to currency

end