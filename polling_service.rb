require 'rubygems'
require 'bundler'
require 'sinatra/base'
require 'sinatra'
require 'sinatra/cross_origin'
require_relative 'ms_polling'
Bundler.require

module PollingService
  class App < Sinatra::Base

    before do
       content_type :json
       headers 'Access-Control-Allow-Origin' => '*', 
                'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']  
    end
    get '/' do
      'Hello World'
    end

    get '/find/:street/:nr' do |street, nr|
      ms = MuensterPollStation.new
      { wahlbezirk_nr: ms.find(street, nr) }.to_json

    end
  end
end
