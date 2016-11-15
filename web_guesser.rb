require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(0..100)
@@guess_count = 7

get '/' do
  guess = params["guess"].to_i
  result, color = check_guess(guess)
  erb :index, :locals => {:number => NUMBER, :result => result, :color => color, :guess_count => @@guess_count}
end

def check_guess(guess)
  if guess.zero?
    result = "Please input a number between 1 and 100. You have #{@@guess_count} guesses left."
    color = "#78DB14"
  elsif(guess - NUMBER) >= 5
    result = "Way too high! You have #{@@guess_count} guesses left."
    color = "#DB147B"
  elsif (guess - NUMBER) <= -5
    result = "Way too low! You have #{@@guess_count} guesses left."
    color = "#114EBF"
  elsif guess > NUMBER
    result = "Too high! You have #{@@guess_count} guesses left."
    color = "#5E1FDE"
  elsif guess < NUMBER
    result = "Too low! You have #{@@guess_count} guesses left."
    color = "#4C84ED"
  else
    result= "You got it right!\nThe SECRET NUMBER is #{NUMBER}."
    color = "#1FDEBE"
  end
  return result, color
end