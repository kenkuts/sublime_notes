ERB:

	ERB is a templating engine which stands for embedded Ruby. We can write code here just like in a plain old '.html' file.
	Sinatra is configured by default to look for our '.erb' files in a directory called 'views'.

	To let our controller render our '.erb' file we add the following syntax to our App class:
	get '/' do
	  erb :index
	end
	This renders the 'index.erb' file at the '/' route. This tells Sinatra to render a file called 'index.erb'
	inside of a directory called 'views'. 

	By convention we keep our routes and our erb files named the same. This makes it easier to keep track of
	them as our projects get bigger. 

	The line erb :index tells the application to render, or deliver to the users browser, the file in 'views/index.erb'.
	This is a sinatra-provided functionality that renders ERB templates located in the views directroy. 
	Sinatra will automatically look for the '.erb' extension when you call erb in the controller.

	ERB templating engine comes standard with Ruby installation.

	The ERB engine allows us to modify the content and structure of our HTML code. With ERB, we do this using two different types of
	tags; the subsitution tag '<%=' and the scripting tag '<%'.

Subsitution Tag:

	The substitution tag evaluates Ruby code and then displays the results into the view. It opens with '<%=' and closes with '%>'. 
	Inside of these tags, you can write any valid Ruby code that you want.
	
	We use the subsitution tags when we want to display some evaluation on the page. We can wrap up the subsitution tags in any other
	HTML tags that we like. The code below will output <h1>I love Ruby!<h1>.

	<h1><%= "I love " + "Ruby!!"%></h1>

Scripting Tag:

	Scripting tags open with '<%' and close with '%>'. They evaluate –– but do not actually display –– Ruby code. 

	<% if 1 == 2 %>
  		<p>1 equals 2.</p>
	<% else %>
  		<p>1 does not equal 2.</p>
	<% end %>

	The scripting tag's logic will work but it will not show in the browser. In this example only the 2nd <p> tag
	will be displayed on the browser.


Sinatra Lecture Video Notes:
	'use PostController' is used to mount our controller. Controllers are responsible for taking requests from the internet and delegating those
	request and provide the logic for how to respond to those requests. 

	Everytime we add a controller: 
		Inherit from ApplicationController
		Mount the controller in config.ru

	The 'ApplicationController' is where you generally set where your views files are; 
	Sinatra wants you to have your views placed in the same area as your controllers

	Models are responsible for data 
	Views are responsible for presentation (HTML, CSS, Forms, ERB)
	Controllers are responsible for logic

	The way that the controller passes the data to the view is by using instance variables. 

	This is called a route variable 
	get 'post/:id' do
		#code here
	end
	This code lets you access the :id variable with the corresponding id posts number.
	If the user types in 'http://localhost:9393/posts/2' this will show the 2nd post.

	All the data that is passed is going to end up in a hash called params which is part of rack.
	Query Strings are another way to pass data into the urls.
	Anything after the question mark is not part of the url.
	'localhost:9393/posts/2?whatever=helloworld'
	
	The four things you can do with data is CRUD.
	You can POST(create), GET(retrieve), PUT(update), DELETE.


layout.erb:

In order to provide DRY code we use layout.erb. This contains all of the code we want to exist on every single web page.

yield is used to whenever we want the other page content to be loaded into our layout.
<%= yield %>>

When a controller action is triggered and the 'erb' method is called, it looks to see if there is a view titled layout.erb.
If the file exists, it loads that content around the desired erb file. 

ERB Creating Nested forms: 

In ERB if you wanted to create a hash to store and array of hashes it would be as easy as the code below:

  Course Name: <input type="text" name="student[courses][][name]">   # Instead of putting an index to each array 
  Course Topic: <input type="text" name="student[courses][][topic]"> # we can use an empty array in our form view
  Course Name: <input type="text" name="student[courses][][name]">   # and ERB will automatically index the array for us. 
  Course Topic: <input type="text" name="student[courses][][topic]">

In Ruby to create a hash to store an array of hashes you would have to manually index the hash:

  my_hash["student"]["courses"][0] = { "name" => "Intro to Computer Science", "topic" => "Computer Science" }
  my_hash["student"]["courses"][1] = { "name" => "Databases", "topic" => "Computer Science"}





















