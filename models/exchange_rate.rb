require 'date'
require 'pry-byebug'
require_relative 'rate_record.rb'


class ExchangeRate
  
  def self.get_rate(date_requested, from_currency, to_currency)
    from_currency_rate_record = RateRecord.rate_record_by_date_and_currency(date_requested, from_currency)
    to_currency_rate_record = RateRecord.rate_record_by_date_and_currency(date_requested, to_currency)
    return [from_currency_rate_record.rate, to_currency_rate_record.rate]
  end

  def self.calculate_from_to_currency_rate(from_currency_rate, to_currency_rate)
    from_to_currency_rate = to_currency_rate / from_currency_rate
    return from_to_currency_rate
  end

  def self.at(date_requested, from_currency, to_currency)
    from_currency_rate_against_euro = get_rate(date_requested, from_currency, to_currency)[0]
    to_currency_rate_against_euro = get_rate(date_requested, from_currency, to_currency)[1]
    from_to_currency_rate = calculate_from_to_currency_rate(from_currency_rate_against_euro, to_currency_rate_against_euro)
    return from_to_currency_rate
  end

  def self.convert(date_requested, from_currency, to_currency, amount)
    from_to_currency_rate = at(date_requested, from_currency, to_currency)
    conversion = amount.to_f * from_to_currency_rate
    binding.pry
    return conversion.round(5)
  end

end



