require 'gossip'

class ApplicationController < Sinatra::Base
  attr_accessor :content, :author, :gossips, :id


  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do
    erb :show, locals: {real_gossip: Gossip.find(params['id']), id: Gossip.find(params['id'])}
  end

end