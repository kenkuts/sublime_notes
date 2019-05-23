
The rails 'form_tag' is what we use to submit a form via a POST method. This tag also automatically generates the necessary authenticiy token.
This tag is not very useful when editing forms becuase if we used the 'form_tag' method for editing certain attributes or fields the page
will resubmit the all of the fields that the page contains regardless if it was edited or not. There is a specific method for editing forms and
it is the 'form_for' method.


Below is an example of a 'form_tag' in an erb file:
<h3>Post Form</h3>
 
<%= form_tag post_path(@post), method: "put" do %>
  <label>Post title:</label><br>
  <%= text_field_tag :title, @post.title %><br>
 
  <label>Post description</label><br>
  <%= text_area_tag :description, @post.description %><br>
 
  <%= submit_tag "Submit Post" %>
<% end %>



Below is an example of a 'form_for' method in an erb file:
<h3>Post Form</h3>

<%= form_for @post do |f| %>
	<%= f.label "Post Title" %>
	<%= f.text_field :title %><br>

	<%= f.label "Post Description" %>
	<%= f.text_field :description %><br>

	<% f.submit "Create Post" %>
<% end %>


Difference between form_for and form_tag
The differences between form_for and form_tag are subtle, but important. Below is a basic breakdown of the differences. We will start with talking 
about them at a high level perspective and then get into each one of the aspects on a practical/implementation basis:

	-The 'form_for' method accepts the instance of the model as an argument. Using this argument, 'form_for' is able to make a bunch of assumptions for you.
	'form_for' yields an object of class FormBuilder

	-'form_for' automatically knows the standard route (it follows RESTful conventions) for the form data as opposed to having to manually declare it

	-'form_for' gives the option to dynamically change the submit button text (this comes in very handy when youre using a form partial and the new and edit 
	pages will share the same form, but more on that in a later lesson)

A good rule of thumb for when to use one approach over the other is below:

	-Use 'form_for' when your form is directly connected to a model. This is the most common case when form_for is used

	-Use form_tag when you simply need an HTML form generated. Examples of this would be: a search form field or a contact form

The differnece between 'PUT' and 'PATCH' is that on a high level 'PUT' has the ability to updated an entire object while 'PATCH' simply updates the elements that
were changed. 


Because form_for is bound directly with the Post model, we need to pass the model name into the Active Record update method in the controller. 
Lets change @post.update(title: params[:title], description: params[:description]) to:

	@post.update(params.require(:post).permit(:title, :description))

Thats why we add the require method when updating and we also add the permit method for the title and description in the nested hash. 

This is because the 'form_tag' sends a nested hash that looks like:

	{
		post: {
			title: "My Title",
			description: "My Description"
		}
	}

	
=========================================================================================================================================================================

Stong Params










