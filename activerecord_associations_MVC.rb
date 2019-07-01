Active Record Associations Review:

Foreign Keys are columns that refer to the primary key of another table. Conventionally, 
foreign keys in Active Record are comprised of the name of the model youre referencing, 
and '_id'. So for example if the foreign key was for a posts table it would be post_id.

In this example we are adding a column in a migration file to the Posts model. In
which case we are adding the foreign key 'author_id' into our Posts table/model.

class AddAuthorIdToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.integer :author_id
    end
  end
end

Author.find(@post.author_id) == SELECT * FROM 'authors' WHERE id = {@post.author_id}
Post.where("author_id = ?", @author.id) == SELECT * FROM 'posts' WHERE author_id = #{@author.id}


======Relationships=======
Many-To-One relationships:
The most common relationships with our tables and modes are many-to-one. This is declared in Active-Record
with belongs_to and has_many.

With the exmaple below each post is associated with one author:
class Post < ActiveRecord::Base
  belongs_to :author
end

We now have access to some new instance methods, like author. This will return the actual Author objects that
is attached to that @post. 

@post.author_id = 5
@post.author_id == <Author id=5>


has_many:
In the opposite direction, each Author might be associated with zero, one, or many Post objects.

The code below will add a relationship between Author and Post where the Author object has many posts.
This is declared inside of the class Author with 'has_many :posts'.
class Author < ActiveRecord::Base
  has_many :posts
end

Because Author has many posts the code below will return an array.
@author.posts #=> [#<Post id=1>, #<Post id=20>]

Active Record uses its inflector to switch between the singular and plural forms of your models.
===Name===	===Data====
   Model	 Author    
   Table	 authors
Foreign Key	 author_id
 belongs_to	 :author    
  has_many	 :authors


Convenience Builders:

Building a new item in a collection when adding new posts for an author we usually start out this way:

new_post = Post.new(author_id: @author.id, title: "Web Development for Dogs")
new_post.save

But the association macros allows us to use this instead:

new_post = @author.posts.build(title: "Web Development for Dogs") #=> Posts.new(author_id: @author_id, title:"Web...")
new_post.save

This will return a new Post object with the author_id already set for you. '.build' works just like
'.new'. So the instance that is returned isnt quite saved to the database just yet. Youll need to 
'.save' the instance when you want it to be persisted to the database.

Basically when using the '.build' method that second method is the class to which we are declaring the '.new'
instance from. The instance variable is the variable we are associating it with with the title of "Web Development for Dogs".


Setting a singular association:

if a Post 'belongs_to' Author, the verbose way of creating this association would be:

@post.author = Author.new(name: "Kenneth R. Kutschera")

In the previous section @author.posts is an empty array. But @post.author is nil until the
author is defined, so Active Record cant give us something like @post.author.build.
Instead we need to put 'build_' or 'create_'. 'create_' will authomatically persist to the 
datebase for you.

new_author = @post.build_author(name: "Kenneth R. Kutschera") == @post.author = Author.new(name: "Kenneth R. Kutschera")


Collection Convenience:

When we add existing onjects to a collection association, Active record will conveniently take care of setting the
foreign key for you:

@author = Author.create(name: "Kenneth R. Kutschera")
@author.posts #=> []

@post = Post.create(title: "Cool Beans")
@post.author #=> nil

@author.posts < @post
@post.author #=> #<Author @name="Kenneth R. Kutschera">


One-to-one Relationships:
-Every author would have one, and only one, profile.
-Every profile would have one, and only one, author.

'belongs_to' will be used but instead of 'has_many' the other model is declared with 'has_one'.
In this case the model with the 'belongs_to' relationship will get the foreign key. 

# Profile Model
class Profile < ActiveRecord::Base
	belongs_to :author
end	

# Author Model
class Author < ActiveRecord::Base
	has_one :profile
end

# Profile Migration

class profiles < ActiveRecord::Migration
	create_table :profiles do |t|
		t.integer :author_id
	end
end

The model with the 'has_one' association doesnt have a foreign key.


Many-To-Many Relationships and Join Tables:

When we have a many-to-many relationship we can declare model that 'belongs_to' these two
models. 

A tag has many posts
A posts has many tags

In this care we declare our model 'PostTag'

class Post < ActiveRecord::Base 
	has_many :posts_tags
	has_many :tags, through: :posts_tags
end

class Tag < ActiveRecord::Base
	has_many :posts_tags
	has_many :posts, through: :posts_tags
end 

class PostTag < ActiveRecord::Base
	belongs_to :tag
	belongs_to :post
end	


For the migration of our table should look like:

class CreatePostsTagsJoinTable < ActiveRecord::Migration
	create_join_table :posts, :tags do |t|
		t.index :post_id
		t.index :tag_id
	end
end

In conclusion:

Summary
For every relationship, there is a foreign key somewhere. Foreign keys correspond to the belongs_to macro 
on the model.

One-to-one and many-to-one relationships only require a single foreign key, which is stored in the 
'subordinate' or 'owned' model. The other model declares its relationship via a has_one or has_many 
statement, respectively.

Many-to-many relationships require a join table containing a foreign key for both models. The models 
are joined using has_many :through statements.



ActiveRecord Specifying Relationship :=====================================================================

If we want to rename a table in by using association in our activerecord models. We can do this by using
the 'class_name' method.

For example we would like to say that a 'Listing' model belongs to a specific type of user which is a host.
inside of our model we would write something like.

class Listing < ActiveRecord::Base
	belongs_to :host, :class_name => "User"
end	

This would mean that "listings" table belongs to "host". 'host' which is a user table.
For our user table we would need to specify which type of user has many listings.

class User < ActiveRecord::Base
	has_many :lisitngs, :foreign_key => 'host_id'
end

This would signify that our host user has many listings and listings belongs to a user with the :foreign_key => 'host_id'.

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







