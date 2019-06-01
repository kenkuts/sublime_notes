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
















