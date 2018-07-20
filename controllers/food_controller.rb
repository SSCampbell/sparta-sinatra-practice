class FoodController < Sinatra::Base # inherit from a class called bass
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

configure :development do
  register Sinatra::Reloader ##Allows reload to occur while in developement environement
end

# $food = [
# {
# 	 id: 0,
# 	 title: "MEAT",
# 	 body: "There are different type of meat such as, Fish, Chicken, Beef, Lamb and the delicious Turkey!!"
# },
#
# {
#     id: 1,
#     title: "DAIRY",
#     body: "Dairy products range from: Milk, Yogurt and Cheese"
# },
#
# {
#     id: 2,
#     title: "VEGETABLES",
#     body: "With The vibrant colours vegetables can be red like tomatoes, orange like carrots, yellow as a banana,
#     green as lettace, blue as blueberries and purple like beetroot!"
# },
#
# {
#     id: 3,
#     title: "FATS(Sugars)",
#     body: "This category of food is the most popular! Sweets, chocolates for people with a sweet tooth! "
# }
# ]


get '/new' do
  @food = {
    id: "",
    title: "",
    body: ""
  }
  erb :"food/food_form"
end
#Index
  get '/' do
    @title = "Food Page" #Instance variable
    @food = Food.all
    erb :"food/index"
  end
#SHOW
  get '/:id' do
    @title = "Food Category"
    id = params[:id]
   @food = $food[id.to_i]
    erb :"food/show" #Embedded Ruby
  end

  #CREATE
    post "/" do
      food = Food.new

      food.title = params[:title]
      food.body = params[:body]

      food.save

      redirect "/"
    end


  get "/:id/edit" do
    id = params[:id].to_i
   @food = Food.find(id)
    erb :"food/edit_form"

  end

  put "/:id" do
    id = params[:id]
    food = Food.find(id)
    food.title = params[:title]
    food.body = params[:body]

    food.save

    redirect "/"
  end

  delete "/:id" do
    id = params[:id].to_i
    Food.destroy(id)
    redirect "/"
  end

end
