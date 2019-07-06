What is validation?
 -In the context of Rails, validations are special method calls that go at the top of the model
 class definitions and prevent them from being saved to the database if their data
 doesnt look right. 

ActiveRecord validations are not Database Validations!!

class Person < ActiveRecord::Base
  validates :name, presence: true
end
 
Person.create(name: "John Doe").valid? # => true
Person.create(name: nil).valid? # => false

'validates' is our Swiss Army knife for validations. It takes two arguments: the first is the
name of the attribute we want to validate, and the second is a hash of options that will include
the details of how to validate it.

In this example, the options hash is the { presence: true }, which implements the most basic form
of validation, preventing the object from being saved if its name attribute is empty.

Database activity triggers validation: 
An activeRecord model instantiated with new will not be validated, because no attempt to 
write the database was made. Validations wont run unless you call a method that actually
hits the DB like 'save'.

The only way to trigger validation without touching the database is to call the 'valid?'
method.

By default, AR doesnt raise an exception when validation fails. DB operations such as save
will simply return false and decline to update the database.
Every database mehtod has a sister method with a '!' at the end which will raise an exeption
like '.create!' instead of '.create'.

class Person < ActiveRecord::Base
  validates :name, presence: true
end
 
person = Person.new
person.valid? #=> false
person.save #=> false
person.save! #=> EXCEPTION

Finding out why validations fail: 
person = Person.new
person.errors.messages #=> empty
person.valid? #=> false
person.errors.messages #=> name: can't be blank

You can check one attribute at a time by passing the name to errors as key, like:
person.errors[:name] #=> 'Title can't be blank'

Displaying validation errors in Views:======================

<% if @article.errors.any? %>
  <div id="error_explanation">
    <h2>
      <%= pluralize(@article.errors.count, "error") %>
      prohibited this article from being saved:
    </h2>
 
    <ul>
    <% @article.errors.full_messages.each do |msg| %>
      <li><%= msg %></li>
    <% end %>
    </ul>
  </div>
<% end %>>

Thr first line will validate if it has any errors. If true
then the pluralize() method is called and the error messages
are counted. This will print out a message "x errors prohibited this
article from being saved". 

And then it will print out each error message from 'errors.full_message' method.

This constructs more complete-looking sentences from the more terse messages available in errors.messages.



Length validation:==================

class Person < ActiveRecord::Base
  validates :name, length: { minimum: 2 } #=> minimum of 2 letters 
  validates :bio, length: { maximum: 500 } #=> maximum of 500 chars
  validates :password, length: { in: 6..20 } #=> length range from 6-20
  validates :registration_number, length: { is: 6 } #=> length must be 6
end


Uniqueness:=========================

class Account < ActiveRecord::Base
  validates :email, uniqueness: true #=> checks the database to see if this email is unique
end

This will prevent any account from being created with the same email as another already-existing account.


Custom Messages:====================

class Person < ActiveRecord::Base
  validates :not_a_robot, acceptance: true, message: "Humans only!"
end

==============================Validations in Controller Actions================================

When a form is submitted, a full page load occurs as if you had navigated completely to
a new URL. All of the variables set by the controllers new action disappear and are unavailable
to the create action. 

# app/controllers/posts_controller.rb
 
  def create
    # Create a brand new, unsaved, not-yet-validated Post object from the form.
    @post = Post.new(post_params)
 	# User then types in values for the @post attributes then once the user clicks
 	# 'create post' the @post variable gets validated.

    # Run the validations WITHOUT attempting to save to the database, returning
    # true if the Post is valid, and false if it's not.
    if @post.valid?
      # If--and only if--the post is valid, do what we usually do.
      @post.save
      # This returns a status_code of 302, which instructs the browser to
      # perform a NEW REQUEST! (AKA: throw @post away and let the show action
      # worry about re-reading it from the database)
      redirect_to post_path(@post)
    else
      # If the post is invalid, hold on to @post, because it is now full of
      # useful error messages, and re-render the :new page, which knows how
      # to display them alongside the user's entries.
      render :new
    end
  end 

'render' can be instructed to render the templates from other action. In the case
of the code above we want to render the :new template from the same controller.

When we redirect after a validation failure, we lose the instance of @post that has
feedback in its errors attribute.

If you hit refresh after a redirect/page load, your browser resubmits the GET request
without complaint.

If you hit Refresh after rendering on a form submit, your browser gives you a popup 
to confirm that you want to resubmit form data with the POST request.


============================== Validations with the form tag ===============================

We will now let the user know and display errors once the user submits invalid data in our
application. 


Displaying all errors with 'errors.full_messages'
-When a model fails validation, its errors attribute is filled with information about what went
wrong. Rails creates an ActiveModel::Errors object to carry this information.

The simplest way to show errors is to just spit them all out at the top of the form by iterating
 over '@person.errors.full_messages'. But first, we will have to check whether there are errors to
 display with '@person.errors.any?'.

<% if @person.errors.any? %>
  <div id="error_explanation">
    <h2>There were some errors:</h2>
    <ul>
      <% @person.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
    </ul>
  </div>
<% end %>>

Displaying per-filled errors with errors[].

ActiveModel::Errors can also be used to access field-specific errors by interacting with it like a hash.
If the field has errors, they will be returned in an array of strings.

@person.errors[:name] #=> ['does not allow numbers']
@person.errors[:email] #=> [] no error

conditionally adding a class if there are errors:

<div class="field<%= ' field_with_errors' if @person.errors[:name].any? %>">
  <%= label_tag "name", "Name" %>>
  <%= text_field_tag "name", @person.name %>>
</div>

There is a deliberate space added in ' field_with_errors' in the example above. 
If @person.errors[:name].any? validates to true, the goal here is to produce two 
class names separated by a space (class=field field_with_errors). Without the added 
	space, we would get class=fieldfield_with_errors instead!


============================== Validations with the form for ===============================

The biggest difference between the two helpers is that the form_for create a form specifically for a model
object. form_for is full of convenient features.

form_for automatically performs a route lookup to find the right URL for post.
form_for takes a block. It passes an instance of FormBuilder as a parameter to the block
which is what f is below:
 
<%= form_for @post do |f| %>     #=> @post is the vairable
  <%= f.text_field :title %>   
  <%= f.text_area :content %>
  <%= f.submit %>
<% end %>

Differnece between form_tag and form_for:
form_tag doesnt know what action were going to use it for, because it has no model object to check. 
form_for knows that an empty, unsaved model object needs a new form and a populated object needs an edit form. 
This means we get to skip all of these steps:

Setting the name and id of the <form> element.
Setting the method to patch on edits.
Setting the text of the <submit> element.
Specifying the root parameter name (post[whatever]) for every field.
Choosing the attribute (@post.whatever) fill for every field.


Perks of form_for:
form_for inherits from FormBuilder which will pre-fill an existing Post objects
data, it will also wrap the tag in a div with an error class if the field has failed
validation(s):

<div class="field_with_errors">
  <input type="text" name="post[title]" id="post_title" value="Existing Post Title"/>
</div>

Drawbacks to this is:

This can also result in some unexpected styling changes because <div> is a block tag 
(which takes up the entire width of its container) while <input> is an inline tag. If
your layout suddenly gets messed up when a field has errors, this is probably why.


===========================Delete Requests==================================







