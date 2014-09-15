require 'json'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/config_file'

require './app/dashboard/build'
require './app/routes/base'
require './app/routes/builds'


module Dashboard
  class Application < Sinatra::Base
    register Sinatra::ConfigFile

    configure do
      set :bind, '0.0.0.0'
      enable :logging
    end

    use Routes::Builds
  end
end
