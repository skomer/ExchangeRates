require 'pry-byebug'
require_relative '../db/sql_runner.rb'

class FxRate

  attr_reader :id, :rate_date, :currency, :rate

  def initialize(options)
    @id = options['id'].to_i
    @rate_date = options.fetch('rate_date')
    @currency = options.fetch('currency')
    @rate = options['rate'].to_f
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
        #{@rate}
      )
    RETURNING *
    ;"
    fx_rate = SqlRunner.run(sql).first
    if fx_rate.is_a?(String)
      return fx_rate
    else
      @id = fx_rate['id']
      return FxRate.new(fx_rate)
    end
  end

  def self.fx_rate(fx_rate_id)
    fx_rate_id = fx_rate_id.to_i
    sql = "
      SELECT * FROM rates
      WHERE id = #{fx_rate_id}
    ;"
    fx_rate = SqlRunner.run(sql)
    return FxRate.new(fx_rate.first)    
  end

  def self.fx_rate_by_date_and_currency(date, currency)
    sql = "
      SELECT * FROM rates
      WHERE rate_date = '#{date}'
      AND currency = '#{currency}'
    ;"
    fx_rate = SqlRunner.run(sql)
    return FxRate.new(fx_rate.first)
  end

end








