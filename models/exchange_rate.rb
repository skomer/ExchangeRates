require 'date'
require_relative 'rate_record.rb'


class ExchangeRate
  
  def self.get_rate(date_requested, from_currency, to_currency)
    from_currency_rate_record = RateRecord.rate_record_by_date_and_currency(date_requested, from_currency)
    to_currency_rate_record = RateRecord.rate_record_by_date_and_currency(date_requested, to_currency)
    return [from_currency_rate_record.rate, to_currency_rate_record.rate]
  end

  def self.calculate_from_to_currency_rate(from_currency_rate, to_currency_rate)


  end

  # def self.convert(options)
  #   from_currency_rate_against_euro = at(
  #     options.fetch("date_requested"),
  #     options.fetch("from_currency"),
  #     options.fetch("to_currency")
  #   )

  #   to_currency_rate_against_euro = at(
  #     options.fetch("date_requested"),
  #     options.fetch("from_currency"),
  #     options.fetch("to_currency")
  #   )



  #   converted_amount = (
  #     (options.fetch("amount_to_convert") / )



  #   )


  # end



  # ExchangeRate.at(Date.today,'GBP','USD')
  # GBP is from currency and USD to currency

end