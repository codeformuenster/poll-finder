require 'sinatra/base'
require 'sinatra'
require 'sinatra/cross_origin'
require './lib/polling_service/muenster'

module PollingService
  class App < Sinatra::Base

    before do
       content_type :json
       headers 'Access-Control-Allow-Origin' => '*', 
                'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']  
    end
    get '/' do
      'Find your polling station'
    end

    get '/find/:street/:nr' do |street, nr|
      ms = Muenster.new
      ms.find(street, nr)

      { wahlbezirk_nr: ms.wahlbezirk, stimmbezirk_nr: ms.stimmbezirk }.to_json
    end
  end
end
