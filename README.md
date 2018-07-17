# Sparta Global Academy Homework -- Ruby Sinatra Practice

## Project Review:

### In this project we had to create a website containing different array of items and a form using sinatra operation skills currently reviewed. Using different methods to grab and link information from the array to be presented to the webpage. Also experimenting with simplifying the layout from splitting repetitive code which can be accessed using a link.

## Project Download:  
### Download from the files created and transferred to GITHUB
### The repository was created on GITHUB and cloned to access from terminal  
### Used External RUBY files
### Used Sinatra
### Gem Files

## Using RUBY-Sinatra tools such as:
```RUBY
get '/' do
  @title = "Food Page"
  @food = $food
  erb :"food/index"
end

get '/:id' do
  @title = "Food Category"
  id = params[:id]
 @food = $food[id.to_i]
  erb :"food/show"
end
```
