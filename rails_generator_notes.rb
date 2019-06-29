Rails Generator Notes

rails generate <name of generator> <options> --no-test-framework

--no-test-framework is a flag that tells the generator not to create any tests for the
newly-generated models, controllers, etc.

Main generators that Rails offers:
-Migrations
-Models
-Controllers
-Resources



Migration Generators:

Migration name is Plural

	-rails g migration add_published_status_to_posts published_status:string --no-test-framework

Basically creates a migration file that adds a column to the posts table and
published_status attribute to the posts model.

If you go to the db/migrate folder you will see a file called:
	-db/migrate/20151127174031_add_published_status_to_posts.rb

Which should contain:

class AddPublishedStatusToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :published_status, :string
  end
end

If we need to remove the added column from the table we can use the following command:
	-rails g migration remove_published_status_from_posts published_status:string --no-test-framework

When you open up the migration file you will see the following code:

class RemovePublishedStatusFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :published_status, :string
  end
end


Model Generators:

Model name is singular

-rails g model Author name:string genre:string bio:text --no-test-framework

This command creates a model with the class name Author that inherits from ActiveRecord:Base 
with attributes of name and genre as a string and bio as a text.

This also creates a migration that will add a table called Authors with 
name, genre and bio as its columns.


Controller Generators:

Controller name is singular

-rails g controller admin dashboard stats financials settings --no-test-framework

This will create a controller called admin and it arguments create routes i.e: (dashboard, stats, financials and settings).
This also creates a directory for all the view templates for each of the controller actions.
Creates a view helper method.
Coffeescript file for specific JS for that controller
A scss file for the styles for the controller


Resource Generators:

Resrouce name is singular

-rails g resource Account name:string payment_status:string --no-test-framework

Creates: 
-Migration file that will create a new database table
-Model file that inherits from ActiveRecord::Base
-Controller file that inherits from ApplicationController
-View directory but no view templates
-View Helper file
-Coffeescript file for specific JS for that controller
-scss file for the styles for the controller
-A full resourcs call in the routes.rb file

The last item that gets added is resources :accounts and its considered a 'magic' route that entails the full set of 
RESTful routes needed to perform CRUD in an application.

This basically gets all the CRUD routes thats listed below:

accounts      GET    /accounts(.:format)          accounts#index
              POST   /accounts(.:format)          accounts#create
new_account   GET    /accounts/new(.:format)      accounts#new
edit_account  GET    /accounts/:id/edit(.:format) accounts#edit
account       GET    /accounts/:id(.:format)      accounts#show
              PATCH  /accounts/:id(.:format)      accounts#update
              PUT    /accounts/:id(.:format)      accounts#update
              DELETE /accounts/:id(.:format)      accounts#destroy

















































