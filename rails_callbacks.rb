There are six callbacks before the database operation and two after. In order these are:

1. before_validation
2. before_validation_on_create
3. after_validation
4. after_validation_on_create
5. before_save
6. before_create

Database Insert:==============
7. after_create
8. after_save

before_validation:


Active Record Lifecycle Callbacks:===================================================================================

In this model we have 2 callback methods that are declared with 
class Post < ActiveRecord::Base
 
  belongs_to :author
  validate :is_title_case 
 
  before_validation :make_title_case 
 
# New Code!!
  before_save :email_author_about_post
 
  private
 
  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end
 
  def make_title_case
    self.title = self.title.titlecase
  end

  def email_the_author_about_post
  	puts "We made changed to your title before we persisted the attributes to the database."
  end
end

The 'before_validation' callback makes changes necessary to check the validation. In this model our before_validation
method changes the posts input title into 'titlecase'. This means that the first letters of every word inside of our title
is changed into capital letters. After changing the title it calls the validate method then persists the attribute into
the database. 

The 'email_author_about_post' is then called to notify the author that there were changes made before we saved it into the database.
