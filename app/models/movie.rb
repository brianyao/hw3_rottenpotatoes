class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  class Movie::InvalidKeyError < StandardError ; end

  def self.api_key
  	'e3d1bde3a478bc9f409b4f36668b986f'
  end

  def self.find_in_tmdb(string)
  	Tmdb.api_key = self.api_key
  	begin
      TmdbMovie.find(:title => string)
    rescue ArgumentError => tmdb_error
    	raise Movie::InvalidKeyError, tmdb_error.message
    end
  end
  # rest of file elided for brevity
end
