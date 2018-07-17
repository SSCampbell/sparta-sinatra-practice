require "sinatra"
require "sinatra/contrib"
require "sinatra/reloader" if development?
require_relative "controllers/food_controller.rb"

run FoodController
