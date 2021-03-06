MVC and Forms: 

Models: The 'logic' of a web application. This is where the data is manipulated and/or saved.

Views: The 'front-end', user-facing part of the web application - this is the only part of the app that the user interacts with directly.
	   Views generally consist of HTML, CSS and javascript. In sinatra views are written as '.erb' files.

Controllers: The go-between for models and views. The controller relays data from the browser to the application, and from the
	   application to the browser. In sinatra, controllers are written in ruby and consists of 'routes' that take requests sent
	   from the browser, run code based on those requests by using models and then render the '.erb' files for the user to see.

Gemfile: 
	Holds a list of all the gems needed to run the application. The bundler gem provides us access to a terminal command: bundle install
	Bundler will look in the Gemfile and install any gems, as well as any gem dependencies for the application. Once you 'bundle install'
	on the terminal it will create a 'Gemlock.file', which is a documentation of the specific gems version that should be installed.

app directory:
	This folder holds our MVC directories - 'models', 'views' and 'controllers'.

Models Directory:
	Holds the logic behind the application. These files represent either a component of the application such as a User, Post or Comment,
	or a unit of work. Each file in models typically contains a different class. Models represent the data and object logic of our
	application. 

Controllers Directory:
	Controllers represent the application logic, generally; the interface and flow of our application.

	Is where the application configurations, routes and controller actions are implemented. Sometimes our controllers will use
	ApplicationController as an inheritance point so that they inherit all the defaults and behaviors defined in our main
	ApplicationController. When we start up a server, the server will spin up an instance of the ApplicationController class to
	run our app.

	'configure' blocks tells the controller where to look to find the views and the public directory.
	When a client makes a request to a server to load an application, the request is recieved and processed by the controller.
	We need to setup a controller action to accept the request and respond with the appropriate HTML.

Views Directory:
	Views represent how things look and are displayed in our application. This directory holds the code that will be displayed in the
	browser. 

	In Sinatra we use '.erb' files instead of '.html' file. This is because '.erb' files allow us to include regular, old
	HTML tags and special erb tags which contain ruby code. By convention our file names will match up with the action that renders
	them. I.E; a GET request to / typically renders a file called 'index.erb'.

config.ru File:
	This file is necessary when building Rack-base applications and using rackup/shotgun to start the application server.
	'config.ru' is first responsible for loading our application environment, code and libraries.

	Once all our code is loaded, config.ru then specifies which controllers to load as part of our application using run or use.
	run ApplicationController creates an instance of our ApplicationController class that can respond to requests from a client.

config Directroy:
	This directory holds an environment.rb file. We/ll be using this file to connect up all the files in our application to the 
	appropriate gems and to each other. The environment.rb file loads Bundler and thus all the gems in our Gemfile, as well as
	the app directory.

public Directory:
	The public directory holds our front-end assets. It holds a css directory with a stylesheet and JS directories and any other
	front-end assets.

Forms:
<form action="route url to where the form is going" method="how its going to get there, POST, GET, PUT, DELETE">
	<label for="input_box">Title</label> # If you click the word title on the browser it will focus on the input_box
	<input type="text" name="the name of the input" id="input_box"> #the name is where the value of our input gets assigned.
	<input type="submit">
</form>

The name is where the value of our input gets assigned. When a user types in data from the input box it
is stored inside of the name. An example would be if the name="first_name". Then the key to where the data
would be stored is in params[:first_name]. 

The two most important parts of the form is the action and the method. action is where the data from the form is going
and the method is how its going to get there. 

Models file:

In our models file we store our models. This is where our controller gets our class objects.
require_relative 'config/environment'
require_relative 'models/text_analyzer.rb' # We load our path file for models/text_analyzer.rb to our controller

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text]) # We create an object using the users input
    erb :results
  end
end

The @analyzed_text instance variable is then passed to the our results.erb and inside of the results.erb our
instance object calls the the class methods to change the users input data. 















