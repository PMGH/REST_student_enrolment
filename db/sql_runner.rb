require('pg')

class SqlRunner

  def self.run(sql, tag, values)
    begin
      # connect
      db = PG.connect({ dbname: "hogwarts", host: "localhost" })
      # prepare
      db.prepare(tag, sql)
      # execute
      results = db.exec_prepared(tag, values)
    ensure
      # close
      db.close()
    end
    # return
    return results if results
  end

end
