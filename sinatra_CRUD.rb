CRUD stands for Create, Read, Update and Delete.

To CREATE something we need a POST to a controller action and create the article and save it to the database. 

When we want to READ our posts we use the GET method and use a loop to enummerate our past and recent posts.

When we want to UPDATE our posts we use POST as our method attribute in HTML then we send it to the 'patch' method in our controller. Like
the delete method we need to use the tag: <input type="hidden" name="_method" value="patch">. After adding this tag inside of our form
tag we can now use the 'patch' method inside our controller file for updating our posts. 

When we DELETE our posts our controller responds to the 'delete' method and this method deletes our post. IOT use our delete method we need
to add in the input tag: <input type="hidden" name="_method" value="delete">. We need to have a POST method inside of our form tag.


Authentication:

The action of logging in is the simple action of storing users ID in the session hash. Flow of logging in:

>User visits login page and fills out a form with their email and password. They hit submit to POST that data to the controller.

>The controller route accesses the users email and password from the params[:hash]. The info is used to find the appropriate user
from the database with a line such as User.find_by(email: params[:email], password: params[:password]). That users ID is stored as
the value of session[:id].

>As a result we can introspect on the session hash in any other controller route and grab the current user by matching up a user ID
with the value in session[:id]. For the duration of the session the appliction will know who the current user is on every page.
For the time between when someone logs in to and logs out of our app.


Logging out: 
Conceptually means we are terminating the session the period of interaction between a given user and our app. The action of logging out
is really just the action of clearing all of the data, including the users ID from the session hash. 

Password encryption:
The act of scrambling a users password into a super-secret code and storing a decrypter that will be able to match up a plaintext
password entered by a user with the encrypted version stored in a database.

Mapping our sign up and login authentication appliction.

'/' homepage => sign up and login

sign up => get '/registration/signup' with erb :signup => erb :signup => post '/registration' where user gets created
 and session[:id] gets saved redirect '/users/home' with erb: home => logout clears session hash and returns the user to '/home'

login => get '/sessions/login' with erb :login => erb :login => post '/sessions' where the username and password gets validated,
if it doesnt exist the user gets sent back to login if it does the user goes to '/users/home' and the sessions[:id] equals user.id.




