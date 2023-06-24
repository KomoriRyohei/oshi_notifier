require_relative './notifier.rb'
require_relative './messenger.rb'
require_relative './searcher.rb'

def main
  messenger = Messenger.new
  notifier = Notifier.new
  options = {
    message: messenger.build_message_about_latest_uploads
  }
  options_playlist = {
    message: messenger.build_message_about_latest_uploads_in_playlist
  }
  notifier.notify(options)
  notifier.notify(options_playlist)
end

main
