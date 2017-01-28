require 'date'
require_relative 'rate_record.rb'


class ExchangeRate
  
  def self.get_rate(date_requested, from_currency, to_currency)
    from_currency_rate_record = RateRecord.rate_record_by_date_and_currency(date_requested, from_currency)
    to_currency_rate_record = RateRecord.rate_record_by_date_and_currency(date_requested, to_currency)
    return [from_currency_rate_record.rate, to_currency_rate_record.rate]
  end

  def self.calculate_from_to_currency_rate(from_currency_rate, to_currency_rate)
    from_to_currency_rate = to_currency_rate / from_currency_rate
    return from_to_currency_rate.round(5)
  end


  # ExchangeRate.at(Date.today,'GBP','USD')
  # GBP is from currency and USD to currency

end