class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist&.name
  end

  def note_contents=(contents)
    self.notes = contents.map do |content|
      Note.find_or_create_by(content: content)
    end
  end

  def note_contents
    self.notes.map { |note| note.content}
  end

end
