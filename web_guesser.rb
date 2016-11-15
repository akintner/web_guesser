require 'sinatra'
require 'sinatra/reloader'


  number = rand(0..100)

  get '/' do
    words = "secret number".upcase
    "The #{words} is #{number}."
  end
