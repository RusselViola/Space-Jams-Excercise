class Album
  attr_reader :album_id, :album_name, :artists
  def initialize(album_id, album_name, artists)
      @album_id = album_id
      @album_name = album_name
      @artists = artists
      @tracks = []
  end

  def id
    @album_id
  end

  def artists
    @artists
  end

  def tracks
    @tracks
  end


  def duration_min
    album_duration_ms = 0
    @tracks.each do |track|
      album_duration_ms += track[:duration_ms].to_f
    end
    duration_min = ((album_duration_ms / 1000) /60).round(2).to_s.gsub('.',':')
  end

  def track_list
    track_list = ""
    @tracks.each do |track|
      track_list += "- #{track[:title]}\n"
    end
    track_list
 end


  def summary
      "Name: '#{@album_name}'\nArtist(s): #{@artists}\nDuration (min.): #{duration_min}\nTracks:\n#{track_list}\n"
  end
end
