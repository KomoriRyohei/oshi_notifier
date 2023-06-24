require 'google/apis/youtube_v3'
require 'date'
require_relative './env_loader.rb'

class Searcher
  def initialize
    @client = Google::Apis::YoutubeV3::YouTubeService.new
    @client.key = EnvLoader.new.parse_env_file['YOUTUBE_DATA_API_KEY']
    @options = {
      channel_id: 'UCXRlIK3Cw_TJIQC5kSJJQMg',
      playlist_id: 'PLRGzS-dvI7ZzllJHCHsoEM8XJ9wvR955A'
    }
    @prev_day = DateTime.now.prev_day.strftime("%Y-%m-%dT%H:%M:%S") + '.15Z'
  end

  def has_new_uploads?
    get_latest_video.snippet.published_at > @prev_day
  end

  def has_new_uploads_in_playlist?
    get_latest_video_in_playlist.snippet.published_at > @prev_day
  end

  def get_video_url(video)
    "https://www.youtube.com/watch?v=#{video.id.video_id}"
  end

  def get_video_url_in_playlist(video)
    "https://www.youtube.com/watch?v=#{video.snippet.resource_id.video_id}"
  end

  def get_video_title(video)
    video.snippet.title
  end

  def get_latest_video
    @client.list_searches(
      'snippet',
      channel_id: @options[:channel_id],
      order: 'date',
      max_results: 1
    ).items.first
  end

  def get_latest_video_in_playlist
    @client.list_playlist_items(
      'snippet',
      max_results: 1,
      playlist_id: @options[:playlist_id]
    ).items.first
  end
end
