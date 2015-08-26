require './environment'
require 'pry'

module FormsLab
  class App < Sinatra::Base
    set :views, Proc.new { File.join(root, './views')}

    get '/' do
      erb :'pirates/new'
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @pirate = Pirate.new(params)
      # binding.pry
      erb :'pirates/show'
      # redirect "/pirates/#{pirate.id}"
    end

    get '/pirates/:id' do
      @pirate = Pirate.find(params[:id])
      erb :'pirates/show'
    end
  end
end
