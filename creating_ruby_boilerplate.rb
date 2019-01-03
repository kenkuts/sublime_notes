When creating a ruby boilerplate for projects there are essential files that you must have.

Gemfile:

Is created by typing 'bundle init' inside of the terminal in the project file path.
This is used to declare all your dependecies and gems. Once you have all the gems required for your project you will
type 'bundle install' on the terminal. This will then create a Gemfile.lock whcih is a file that contains all 
of your dependecies/gems and thier dependecies.


Rakefile:



config/environment.rb:

This file is the common file required by config.ru. This is where
there 2 ways to run the server meet.


config.ru
This file defines the stack of our web application. Thats going to start the server thats also going to respond to requests.
The first thing config.ru need to do is load up an evirnoment.


If statement assignments
	If user = User.find_by(:email => email) # If User.find_by returns an object then that means that user will be assigned that object
		true								# If there is such an object then the statement is true.
	else
		false								# If the object doesnt exist then the user variable will be set to nil thus equals to false.
	end									

















