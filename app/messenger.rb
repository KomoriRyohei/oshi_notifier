require_relative './env_getter.rb'

class Messenger
  def initialize
    @searcher = Searcher.new
  end

  def build_message_about_latest_uploads
    latest_video = @searcher.get_latest_video
    foward_message = @searcher.has_new_uploads? ? '新しい動画がアップロードされました!!!' : '新しい動画が見つからなかったので、最新の動画の情報をお伝えします!!!'
    backword_message = "#{@searcher.get_video_title(latest_video)}\n#{@searcher.get_video_url(latest_video)}"
    "\n#{today}\n#{foward_message}\n#{backword_message}"
  end

  def build_message_about_latest_uploads_in_playlist
    latest_video = @searcher.get_latest_video_in_playlist
    foward_message = @searcher.has_new_uploads_in_playlist? ? 'メン限のプレイリストに新しい動画がアップロードされました!!!' : 'メン限のプレイリストに新しい動画が見つからなかったので、プレイリスト内の最新の動画の情報をお伝えします!!!'
    backword_message = "#{@searcher.get_video_title(latest_video)}\n#{@searcher.get_video_url_in_playlist(latest_video)}"
    "\n#{today}\n#{foward_message}\n#{backword_message}"
  end

  def today
    wday_mapping = ["日", "月", "火", "水", "木", "金", "土"]
    "【#{Time.now.strftime("%Y年%m月%d日#{wday_mapping[Time.now.wday]}")}曜日】"
  end
end
