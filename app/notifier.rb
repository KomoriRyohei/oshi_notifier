require 'line_notify'
require_relative './env_getter.rb'

class Notifier
  def initialize
    @client = LineNotify.new(EnvGetter.new.get_parameter("/r_komori/line_notify_token"))
  end

  def notify(options)
    @client.ping(options)
  end
end
