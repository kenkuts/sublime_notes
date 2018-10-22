Sinatra Notes:
1.) Client makes HTTP request. Sinatra grabs it and routes it to the correct action -- Client
2.) Action asks model for objects -- Controller to Model
3.) Model asks for the data -- Model retrieving data
4.) Database or API responds -- Model gets the data 
5.) Model sends objects to action - This is where the tweets and usernames gets created and passed -- Model creates the objects passes it to Controller
6.) The action sends objects to view for rendering - This is where the HTML comes in -- Controller passes it to view
7.) View responds with HTML -- View passes it back to Controller
8.) Controller sends back HTML in HTTP response. -- Controller sends it to the client or browser.

Web Application Framework:
Is a software framework that is designed to support development of dynamic websites, web applications, web services and web resources.

Sinatra is a Domain Specific Language implemented by Ruby thats used for writing web applications. A DSL is a specialized, situation
specific langauge It is rack based which means it can fit into any Rack-based application stack, including Rails. 
It is nothing more than some pre-written methods that we can inculde in our applications to turn them into ruby web applications.

Sinatra is designed to provide you with the bare minimum requirements and abstrations for building simple and dynamic Ruby web
applications. It is a lightweight framework where the responsibility of app structure and communication falls solely on the 
developer. 

The MVC concept is a system for building web applications that governs 90% of the worlds apps.
In sinatra you are required to manually setup routes and connect them to other pieces of your application

Sinatra relies on Rack for its middleware. Middleware is software that bridges the connection between our ruby application and the
database. 

config.ru requires a valid Sinatra Controller to run. A sinatra controller is simply a ruby class that inherits from Sinatra::Base.
The classes that inherit from Sinatra::Base and define the HTTP interface for our application are called Controllers. 
The controller will define every single URL and response of our application.
Controllers define an HTTP method using the sinatra DSL provided methods like get and post. 

The final step in creating a controller is mounting it in config.ru. Mounting a controller 
means telling Rack that part of your web application is defined within the following class. 
We do this in config.ru by using 'run Application' where 'run' is the mounting method and 'Application' 
is the controller class that inherits from Sinatra::Base and is defined in a previously required file.

A Sinatra Controller is simply a ruby class that inherits from Sinatra::Base. This class transforms into a
web application by giving it Rack-compatible interface behind the scence via Sinatra framework. 

Shotgun: 
When starting our sintra application our code is read once and on boot and never again. Our application
server wont read any new changes until it stops and restarts. 

Shotgun Ruby Gem:
This gem makes is eaisier for us to develop our ruby projects locally by starting Rack with automatic code
reloading. All of our code will be reloaded upon every request. This means that when you change your code and
hit refresh on the browser the application will respond with the latest version of our code. 
There is no need to stop the server and run it again in order to see the update. 

Routes:
Routes are the part of an application that connect HTTP requests to a specific method in your application code built 
to handle responding to such a request (that part of code is called a Controller Action).
Routes are basically mappings of the URL and domain paths.

In Sinatra, a route is constructed by pairing an HTTP method/verb, like GET or POST with a URL-matching pattern,
i.e. a string that matches what users type in to their browser when they want to visit our webpage. 
Below is an example of a route:

get '/patients' do 					# This is called when a user is declaring a '/patients' path on the domain
	@patients = Patient.all         # Controller takes from the model
	erb :'patients/index'           # Then it renders it to the view
end

Routes match the web request sent by clients to some code in our application that tells the app what data and templates
to send back to the client. If our user types in http://hospital.com/medicine our application gets a request: GET /medicines
Our application will match this request to a route that is defined in a controller.

get '/medicines' do
	# some code to get all the medicines
	# some code to render the correct HTML page
end

This is also called the controller action. 




























