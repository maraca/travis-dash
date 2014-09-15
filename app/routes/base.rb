require 'sinatra/config_file'

module Dashboard
  module Routes
    class Base < Sinatra::Base
      register Sinatra::ConfigFile

      config_file '../../config.yml'
    end
  end
end
