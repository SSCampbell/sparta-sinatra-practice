require "pg"
require "sinatra"
require "sinatra/contrib"
require "sinatra/reloader" if development?
require_relative "models/food.rb"
require_relative "controllers/food_controller.rb"

use Rack::MethodOverride
run FoodController
