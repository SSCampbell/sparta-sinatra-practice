class FoodController < Sinatra::Base # inherit from a class called bass
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

configure :development do
  register Sinatra::Reloader
end

$food = [
{
	 id: 0,
	 title: "MEAT",
	 body: "There are different type of meat such as, Fish, Chicken, Beef, Lamb and the delicious Turkey!!"
},

{
    id: 1,
    title: "DAIRY",
    body: "Dairy products range from: Milk, Yogurt and Cheese"
},

{
    id: 2,
    title: "VEGETABLES",
    body: "With the vibrant colours vegetables can be red like tomatoes, orange like carrots, yellow as a banana,
    green as lettace, blue as blueberries and purple like beetroot!"
},

{
    id: 3,
    title: "FATS(Sugars)",
    body: "This category of food is the most popular! Sweets, chocolates for people with a sweet tooth! "
}
]

#Index
  get '/' do
    @title = "Food Page"
    @food = $food
    erb :"posts/index"
  end

  get "/:id" do
    id = params[:id]
   @food = $food[id.to_i]
    erb :"posts/show"
  end

  post "/create" do
    "This is the create root"
  end

  get "/new" do
    "This is the new root"
  end

  get "/:id" do
    id = params[:id]
    "This is show route for #{id}"
  end

  get "/:id/edit" do
    id = params[:id]
    "This is edit route for #{id}"
  end

  put "/:id" do
    id = params[:id]
    "This is update route for #{id}"
  end

  delete "/:id" do
    id = params[:id]
    "This is delete route for #{id}"
  end

end
