require '../db/sqlrunner'

class Artist

    attr_accessor :name
    attr_reader :id


    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
    end

    def self.delete_all()
        sql = "DELETE FROM artists;"
        values = []
        SqlRunner.run(sql, "delete_all_artists", values)
    end

    def save
        sql = "INSERT INTO artists(name) VALUES($1) RETURNING *;"
        values = [@name]
        result = SqlRunner.run(sql, 'save_artist', values)
        @id = result[0]["id"].to_i
    end







end