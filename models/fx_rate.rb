require 'pry-byebug'
require_relative '../db/sql_runner.rb'

class FxRate

  attr_reader :id, :rate_date, :currency, :rate

  def initialize(options)
    @id = options['id'].to_i
    @rate_date = options.fetch('rate_date')
    @currency = options.fetch('currency')
    @rate = options.fetch('rate')
  end

  def save()
    sql = "
      INSERT INTO rates (
        rate_date,
        currency,
        rate
      )
      VALUES (
        '#{@rate_date}',
        '#{@currency}',
        '#{@rate}'
      )
    RETURNING *
    ;"
    fx_rate = SqlRunner.run(sql).first
    @id = fx_rate['id']
  end



end