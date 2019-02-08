#!/usr/bin/env ruby

require 'sinatra'

set :public_folder, './'

get '/' do
  redirect '/index.html'
end

get '/*.html' do |file|
  erb(File.read "#{file}.html.erb")
end
