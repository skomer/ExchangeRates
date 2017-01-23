require 'pg'

class SqlRunner

  def self.run(sql)
    begin
      db = PG.connect({
        dbname: 'fx_rates',
        host: 'localhost'
      })
      result = db.exec(sql)
    rescue
      result = ["Error: duplicate record not saved"]
    ensure
      db.close
    end
    return result
  end

end