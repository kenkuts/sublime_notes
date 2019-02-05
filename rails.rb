app – contains the models, views, and controllers, along with the the rest of the core functionality of the application. This is the one directory where you can make a change and not have to restart the Rails server. The majority of your time will be spent working in this directory. In addition to the full MVC structure, this directory also contains non Ruby files, such as: css files, javascripts, images, fonts, etc.

bin – some built-in Rails tasks that you most likely will never have to work with.

config – the config directory manages a number of settings that control the default behavior, including: the environment settings, a set of modules that are initialized when the application starts, the ability to set language values, the application settings, the database settings, the application routes, and lastly the secret key base.

db – within the db directory you will find the database schema file that lists the database tables, their columns, and each column’s associated data type. The db directory also contains the seeds.rb file, which lets you create some data that can be utilized in the application. This is a great way to quickly integrate data in the application without having to manually add records through a web form element. The schema file can be found at db/schema.rb.

lib – while many developers could build full applications without ever entering the lib directory, you will discover that it can be incredibly helpful. The lib/tasks directory is where custom rake tasks are created. You have already used a built-in rake task when you ran the database creation and migration tasks; however, creating custom rake tasks can be very helpful and sometimes necessary. For example, a custom rake task that runs in the background, making calls to an external API and syncing the returned data into the application’s database.

log – within the log directory you will discover the application logs. This can be helpful for debugging purposes, but for a production application its often better to use an outside service since they can offer more advanced services like querying and alerts.

public – this directory contains some of the custom error pages, such as 404 errors, along with the robots.txt file which will let developers control how search engines index the application on the web.

test – by default Rails will install the test suite in this directory. This is where all of your specs, factories, test helpers, and test configuration files can be found. Side note: We always use RSpec, which means this directory will actually be called spec.

tmp – this is where the temporary items are stored and is rarely accessed by developers.

vendor – this directory has been utilized for varying purposes in the past. In Rails 4+, its main purpose is for integrating Client-side MVC frameworks, such as AngularJS.

Gemfile – the Gemfile contains all of the gems that are included in the application; this is where you will place outside libraries that are utilized in the application. After any change to the Gemfile, you will need to run bundle. This will call in all of the code dependencies in the application. The Gem process can seem like a mystery to new developers, but it is important to realize that the Gems that are brought into an application are simply Ruby files that help extend the functionality of the app.

Gemfile.lock – this file should not be edited. It displays all of the dependencies that each of the Gems contain along with their associated versions. Messing around with the lock file can lead to application bugs due to missing or altered Gem dependencies.

README.rdoc – the readme file is an important place to document the details of the application. If the application is an open-source project, this is where you can place instructions to other developers, such as how to get the app up and running locally.


RAILS SCAFFOLD;

rails g scaffold Blog title:string contnet:text 

This line basically creates everything from your table to the views for this 'Blog' feature.
Once you run this line the rails application will generate a model file, a migration file, a controller file and
your CRUD view html files. It also generates css and js files. 


/////////////////////VIEW MAPPING

View mapping in Rails:

Explicit rendering - for explicit rendering, Rails lets you dictate which view file you want to have the controller action mapped to.

Implicit rendering - for implicit rendering, Rails follows a standard convention that automatically looks for the view file with the same name as the controller action.


////////////////////ROUTING

RESTFUL actions; The seven restful actions are:
index - can be the home or shows everything inside of the feature or model
show - shows a specific record inside of our database
new	- loads up a page for creating a new record to our database. This is followed by create.
edit - like the new action this shows the page for making edits to a record. This is followed by update.
create - This comes after new where the information that was sent get saved inside of our database
update - updates a record inside of our database.
destroy - deletes a record.

/////

Creating Static Routes:
We added the line `get 'about', to: 'static#about'`

The HTTP verb in this case is `get`
The path `about` represents the path in the URL bar that
the route will be mapped to.
The controller action 'static#about' tells the rails routing
system that this route should be passed through the static
controllers about action. 


get 'products/id', to: 'products#index'
		URL			  Controller  Method

How to get 'about' and 'team' page within a static controller:

first create Static controller = rails g controller static about team
create two methods def about and def team. 
go to routes and add lines
get '/about', to: "static#about"
get '/team', to: "static#team"
then create views for both pages in the static folder.


////////////////////Action View
link_to method accepts two arguments where they take in
the text for the link and the route. 

<%= link_to "About Page", "/about" %>>
<a href="/about">About Page</a>

Route Helpers: 
RouteName_path used incase you change your route names;

if you have a route that points to a specific method inside of a controller.
You can use:
	get '/about_us', to: "static#about", as: => :about
										 This creates the name for your RouteName_path. If you rename this to 
										 something like: kens_special_route_path your RouteName_path will be
										 kens_special_route_path_route.

<%= link_to "About Page", about_path %>> - no matter what changes you make to the path name this wont break your code. 

Getting a route with a symbol:

When getting a RouteName_path with a variable you would need to pass in an argument into the path. Example is:
get '/posts/:id', to: "posts#show", as: => :post
When we try to get this in the console 'app.post_route' we will get an error because we need to pass in an
argument inside of the RouteName_path because the route requires a variable. In order to get the desired route
is to pass an id into the RouteName_path. This is done by:
p = Post.find(1)
app.post_route(p.id) #=> This will return a renedered page with a post with a post id of 1. 


<%= link_to post.title, post_path(post) %>>

link_to method is a route helper:

Route helpers are more dynamic than a staic path. This helps make our code flexible beacuse if 
the route changes the code itself wont be changed at all.

Route helper methods help clean up the view and controller code and assist with readability.

Its more natural to be able to pass arguments into a method as opposed to using string interpolation.
For example, post_path(post, opt_in: true) is more readable than "posts/<%= post.id %>?opt_in=true".

Route helpers translate directly into HTML-friendly paths. In other words, if you have any weird characters
in your urls, the route helpers will convert them so they can be read properly by browsers. This includes 
items such as spaces or characters such as &, %, etc.

Route helpers:
resources: :posts, only: [:index, :show]
This route helper help us set up our posts routes by specifying that we are only using :index and :show. This will create the following
routing methods for posts that we can utilize in our views controller.

get '/posts', to: 'posts#index', as: :posts
get '/posts/:id', to: 'posts#show', as: :post

Finding our RouteNames:
We can run 'rake routes' inside of the teminal to see a list of our routes and help us use our route helper methods.
	posts   GET  /posts(.:format)       posts#index
	post    GET  /posts/:id(.:format)   posts#show

Column 1 - This column gives the prefix for the route helper methods. In the current application, posts and 
post are the prefixes for the methods that you can use throughout your applications. 

Column 2 - HTTP Verb

Column 3 - This column shows what the path for the route will be and what parameters need to be passed to the route. 
As you may notice, the second row for the show route calls for an ID. When you pass the resources method to the :show 
argument, it will automatically create this route and assume that you will need to pass the id into the URL string.

Column 4 - This column shows the controller and action with a syntax of controller#action.
When you type the controller for the routes always remeber that the controller is plural!


Rails is smart enough to know that if you pass in the post object as an argument, it will automatically 
use the ID attribute, so well use this implementation code:

<% @posts.each do |post| %>
  <div><%= link_to post.title, post_path(post) %></div> #=> instead of passing post.id we pass post
<% end %>>

Using :as option
If for any reason you dont like the naming structure for the methods or paths, you can customize them quite easily. A common change is updating the path users go to in order to register for a site. Out of the box, the standard path would be /users/new. 

get '/posts', to: 'posts#index', as: :posts      					#=> posts_path
get '/posts/:id', to: 'posts#show', as: :kens_special_path_route    #=> kens_special_path_route_path




































