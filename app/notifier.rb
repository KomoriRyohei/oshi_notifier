require 'line_notify'
require_relative './env_loader.rb'

class Notifier
  def initialize
    @client = LineNotify.new(EnvLoader.new.parse_env_file['LINE_NOTIFY_TOKEN'])
  end

  def notify(options)
    @client.ping(options)
  end
end
