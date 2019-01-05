If statement assignments
	If user = User.find_by(:email => email) # If User.find_by returns an object then that means that user will be assigned that object
		true								# If there is such an object then the statement is true.
	else
		false								# If the object doesnt exist then the user variable will be set to nil thus equals to false.
	end									


RUBY Restful notes:
Restful provides a design pattern that allows for easy data manipulation. A RESTful route is a route that provides mapping between HTTP
verbs(get, post, put, delete, patch) to controller CRUD action(create, read, update, delete). A RESTful route depends on the HTTP verb
and the URL.

Browser Caveat:
Browsers behave a little strangely as it relates to PUT, PATCH and DELETE requests, in that they dont know how to send those requests.
Forms that delete and edit need to be submitted via POST request.

Creating a PATH and DELETE method in our controller:
When submitting a PATCH or a DELETE request we must include a hidden input field that will submit our form via PATCH.

<form action="/articles/<%= @article.id %>" method="post">
  <input id="hidden" type="hidden" name="_method" value="patch">    <--- The hidden input field.
  <input type="text" name="title">
  <input type="text" name="content">
  <input type="submit" value="submit">
</form>

The hidden input field shown above uses Rack::MethodOverride, which is part of Sinatra middleware.
In order to use this middleware, and therefore use PATCH, PUT and DELETE requests, you must tell your app to use
the middleware.
In the config.ru file, youll need the following line to be placed above the 'run ApplicationController' line:
use Rack::MethodOverride











































































