require 'sinatra/base'
require 'tinder'
require 'yaml'

class Campfire
  def initialize
    @config = {}
    config = YAML.load_file('campfire.yml')

    # fancy
    config.each do |key, value|
      @config[key.to_sym] = value
    end
  end

  def room
    return @room if @room
    
    campfire = Tinder::Campfire.new(@config[:account], :ssl => @config[:ssl])
    campfire.login(@config[:user], @config[:pass])
    @room = campfire.find_room_by_name(@config[:room])
  end
  
  def notify(text)
    room.speak text
  end

  def self.notify(text)
    new.notify(text)
  end
end


#
# sinatra
#

class Burn < Sinatra::Base
  post '/' do
    message = params[:message]
    Thread.new { campfire.notify(message) }
    message
  end

  def campfire
    @campfire ||= Campfire.new
  end
end

if $0 == __FILE__
  Burn.run!
end
