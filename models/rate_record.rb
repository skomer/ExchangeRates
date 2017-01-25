require 'pry-byebug'
require_relative '../db/sql_runner.rb'

class RateRecord

  attr_reader :id, :rate_date, :currency, :rate

  def initialize(options)
    @id = options['id'].to_i
    @rate_date = options.fetch('rate_date')
    @currency = options.fetch('currency')
    @rate = options['rate'].to_f
  end

  def save()
    sql = "
      INSERT INTO rate_records (
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
    rate_record = SqlRunner.run(sql).first
    if rate_record.is_a?(String)
      return rate_record
    else
      @id = rate_record['id']
      return RateRecord.new(rate_record)
    end
  end

  def self.rate_record(rate_record_id)
    rate_record_id = rate_record_id.to_i
    sql = "
      SELECT * FROM rate_records
      WHERE id = #{rate_record_id}
    ;"
    rate_record = SqlRunner.run(sql)
    return RateRecord.new(rate_record.first)    
  end

  def self.rate_record_by_date_and_currency(date, currency)
    sql = "
      SELECT * FROM rate_records
      WHERE rate_date = '#{date}'
      AND currency = '#{currency}'
    ;"
    rate_record = SqlRunner.run(sql)
    return RateRecord.new(rate_record.first)
  end

end








