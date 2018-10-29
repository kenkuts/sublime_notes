ERB:
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

	All the data that is passed is going to end up in a hash called params which is part of rack
	Query Strings are another way to pass data into the urls.
	Anything after the question mark is not part of the url.
	'localhost:9393/posts/2?whatever=helloworld'
	





























