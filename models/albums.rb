require '../db/sqlrunner'

class Album

    attr_accessor :name
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @genre = options['genre']
        @artist_id = options['artist_id'].to_i()
    end

    def self.delete_all()
        sql = "DELETE FROM albums;"
        values = []
        SqlRunner.run(sql, "delete_all_albums", values)
    end

    def save
        sql = "INSERT INTO albums(name, genre, artist_id) VALUES($1,$2,$3) RETURNING *;"
        values = [@name, @genre, @artist_id]
        result = SqlRunner.run(sql, 'save_album', values)
        @id = result[0]["id"].to_i
    end

end