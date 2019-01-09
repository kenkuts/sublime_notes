Unit test:
Unit tests test the models in our application and how they interact with our database.

Controller Test:
These tests test the code thats responsible for delivering the appropriate data to a user is working properly. In a
web app, a controller test is responsible for making sure that an HTTP request returns the expected HTTP response.
Controller tests should test not HTML or forms but, rather, that the controller is behaving as expected.

Intergration Tests:
Intergration tests are the highest level test, and they are the closest to describing how a user will actually interact
with our application. Commonly refered to as 'End-to-End' tests, intergration tests should flex your entire application stack
(I.E: all of the MVC components) and rarely isolate components or behaviors. They are perfect for specing high level
user interactions with HTML and forms. 


Capybara is an intergration test within the RSpec test suite it is a library of code that we can include in our application via
the Capybara gem. The Capybara library allows us to write code that simulates how a user interacts with our app.
To add capybara into our testing environment we must add the following code into our 'spec/spec_helper.rb' file.

# Load RSpec and Capybara
require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'
 
# Configure RSpec
RSpec.configure do |config|
  # Mixin the Capybara functionality into Rspec
  config.include Capybara::DSL
  config.order = 'default'
end
 
# Define the application we're testing
def app
  # Load the application defined in config.ru
  Rack::Builder.parse_file('config.ru').first
end
 
# Configure Capybara to test against the application above.
Capybara.app = app

visit method:
Capybara has a visit method where it navigates the tests browser to a specific URL. It is equivalent to a user typing
a URL into their browsers location bar. The argument it accepts is a string for the URL you want to test. 

page method:
the page method exposes the session or browser that is conceptually being used during the test. The page method gives
you a Capybara::Session object that represents the browser page the user would actually be looking at if they navigated
to '/' (or whichever route was last passed to visit). I.E. 'page.body' this method takes the contents of everything inside
of your page or whichever route youre in and turn them into a string.

page responds to a lot of methods that represents actions a user could take on a page, such as 'click_link', 'fill_in' and 'body'.

expect(page).to have_selector("form")
Capybara 'page' objects respond to methods that relate intimately to HTML and the DOM that defines web applications. You can ask
the 'page' object: "Hey, do you have HTML that matches the following selector?" buy using the 'have_selector' mathcer. 

expect(page).to have_field(:user_name)
We are asking the page object to have a form field called 'user_name'.

HTML/ERB:
<form action="/greet" method="POST"> # the POST request will contain whatever the user typed into the form's <input> field.
  <label for="user_name">Name:</label> # which is nested within the form and has a name value of user_name, matching our Capybara text expectation.
  # the 'for' attribute for label must correspond with the 'id' attribute for the input.
  <p><input type="text" name="user_name" id="user_name" /></p>

  <input type="submit" value="Submit"/> 
</form>

When the user submit this post request we need to create a route for it in our controller.
  # New route to respond to the form submission
  post '/greet' do
    erb :greet
  end
This code will respond the to information that the user sent and post it inside of our 'greet.erb' file

Below is the code that shows the user greeting:
<h1>Hi <%= params[:user_name] %>, nice to meet you!</h1>

The information the user submitted in the form is available to our code within a hash named 'params'.
params[:user_name] returns the text the user typed into the form input field user_name.


Dynamic Routes:
Are created based on attributes within the url of the request. 

Static routing is the the standard routing we use when return a string or file to the user. I.E:

get '/hello' do
	"Hello World!"
end


Dynamic routing is something where we are capturing data from the user. I.E:

get '/hello/:name' do
	@name = params[:name]
	"Hello!, #{@name}".
end

In sinatra a route is simply an HTTP method/verb that is paired with a URL-matching pattern. 
When our application recieves a request, it will match that route to a specific controller action that matches that URL pattern.
URL params help us get the text from the URL into the views. That :name in the route name is just a symbol that will be
filled in with text later. The data is passed from the URL to the controller action through an automatically generated hash
called params. 

The key of hash is determined by the symbol in the url(:id), and the associated value will be the content in the url provided
by the user. Once inside the controller action we can access the value from the params hash, just like we would any other hash.

<<<<<<< HEAD
Passing values in the route:

Passing values to a route is as simple as '/square/:number'. If a user types in a url the address 'square/9' this route will square
the number 9 and turn it generate an output of 81. This is done by using the params variable. 

params[:number] will access the values that are passed in the address. params[:number] == 9 if the user sends 'square/9' in the
address bar.


HTML Form Tag:

The method attribute tells the form what kind of request should be fired to the server when the submit button is clicked. 
In general, forms use POST request, because it is 'posting' data to the server.

The action attribute tells the form what specific route the post request should be sent to. In this case, were posting 
to a route called "/food". The "/food" route might have a different erb file to render. The data might be passed via instance
variables such as '@menu'.

Using Instance Variables:
Instance Variables allow us to bypass scope between the various methods in a class. Creating an instance variable in a controller
method(route) lets the contents become 'visible' to the erb file to which it renders. Instead of creating a local variable
'reversed_string', change it to an instance variable '@reversed_string'.

Instance variables are ONLY passed from the controller method where they are created to the view that is rendered, not 
between controller methods. 

Defining Routes: 

The order in which you define routes in sinatra matters.
If you were to define the code below to your controller file:

get '/post/:id' do
  erb :'post/show.html'
end

get '/post/new' do
  erb :'post/new'
end

If the client sends a request for 'localhost:9393/post/new' there will be an error.
Because beacuse it will evaluate 'post/new' as 'post/:id' and id => new. 
To avoid this we need to change the order in which the routers are setup.


..............//// Routes and Controllers ////.....................



Associations In Activerecord

Whem associating two tables together remember to create a column for the child table with the corresponding id table name.
Example if an article has multiple authors then the Articles table should have author_id as a foreign key column added to it.

After declaring an added column to the child table remember to write the association in their models. The author should have
has_many :aticles and the article should have belongs_to :author.
The model with the belongs_to association has the foreign key. 



Creating complex forms 

When creating dynamic multiple checkboxes from a class.
# Controller
@pets = Pet.all

# ERB
<% @pets.each do |pet| %>
  <input type="checkbox" name="owner[pet_ids]" value="<% pet.id %>" id="<% pet.id %>"
  <%= "checked" if owner.pets.include?(pet) %> # This adds an extra touch where if the pet is already owned by the owner the checkbox will be checked.
  ><%= pet.name %></input>
<% end %>
































































































