HTTP is a stateless protocol, treating each request as an independent transaction that is undable to use information from any previous
requests. We must rely on the individual actors involved in an HTTP exchange - the users browser and the websites servers - to
persist any sort of simple state. 

On each HTTP request, the server sends information to the browser. Cookies were invented as a means to store that data. A cookie is a
hash that gets stored in the browser and sent back to the server along with every subsequent request.

Sessions is an object, like a hash, that stores data describing a clients interactions with a website at a given point in time.
The session hash lives in the server. Your application can access it cia any of your controllers at any point in time.

How sessions and cookies work: 
When you send a request to a website the application on the server will generate and store some data about you. The application will
save that data in a session hash, and it will place it in a small text snippet called a cookie. The cookie is sent back to you
and is stored in your browser. When a website sets cookies, they persist between pages while you continue to browse the web. Upon next
visits to the setting website, the cookies are sent back to the sites server. When that happens, the client-side cookie
data will be compared to the server-side session data to help the application determine what steps to take and what information to
send back to you.

How do cookies work?
Heres the general flow:

1. You visit a webpage, such as facebook.com.
2. Facebooks web application receives the request and creates a cookie with some information about you as a user.
3. Facebook sends that cookie back to the browser, where it is stored. Cookies will last until they expire or are deleted.
4. Every subsequent request you make to facebook.com sends the cookies back to the server, where Facebook can access them, 
5. retrieve information, and alter the cookies.

What is inside of the cookie?
Contains a URL to the generating website.
The date on which it was created(the date on which it is set to expire, if applicable).
Pertinent information that the web application has requested to persist(such as remembered login information, user preference, etc.)

2 primary kinds of cookies: session and persistent

Session Cookies:
Session cookies allow a website to keep track of your movement from page to page for that specific session. Session cookies
allow you to navigate through a website without continually login in on every new page you visit within the web application domain.
Session cookies expire every time you log out or navigate away from the webiste.

One good example of this would be if you stored something inside of your amazon cart. Without the session cookie, if you navigate to
the checkout page your cart would be empty because it would have no recollection of your previous account activity. 

A session is basically just a hash that stores data on the server and passes that data to the client as a cookie. You can access the
data in the session in the same way you would any hash in Ruby.

Persistent Cookies:
Persistent cookies allow a website to remember your user information and preference for future visits. It is stored on your computer
while a session cookie is termporarily stored in your web browser. It allows for faster page loading, automatic login and user auth,
and access to other potential web application features.  
These cookies are created when you first visit the webpage after youve created an account on the site, and they typicall persist
unless either the web application has a protocol in place for cookie expiration or the user clears their browsers cache. 

If we would have no persistent cookies everytime we would go to facebook we would have to login and none of our preferences would be
saved. the quality of our user experience would go down.

Cookies are a client-side counterpart to sessions. They store information locally and are visible only to the server that created them.
The client browser sends cookies to remote servers along with each web request. The web application on the server read the cookie,
associates it with an existing session, and decides how to respond.

Example if there is no cookie received the application might show the login page. If a cookie is received that doesnt match the data
stored in the server-side session hash, the app might show the login page with the username filled out - Having retrieved the that data
from the cookie - but request that the user reauthenticate. If a cookie is recieved that matches the data in the server-side session hash,
the app would respond with that users data.




Setting Up sessions in Sinatra:

We enable sessions within the controller by adding two lines in the configure block:

configure do
	enable :sessions
	set :session_secret, "secret"
end

The configure block is part of built-in settings that control whether featuers are enabled or not. In this case, we're
enabling the session feature'.

enable :sessions = turns session on
set :session_secret, "secret" = is an encryption key that will be used to create a session_id
session_id = is a string of letters and numbers that is unique to a given users session and is stored in the browser cookie. 

IOT keep track of a current user throughout a session, we need to set up the session hash to store the user_id in the hash
during a controller action. 

get '/hey' do 
  @session = session
end

In the example above, we have a route, '/hey' that gets processed by a GET request. Because we enabled session in our app, every 
controller action has access to the session hash.

We stored the session hash in the instance variavble @sessions so that our views will have access to the session data. In this case,
@session no looks like this:

@session = {
  "session_id"=>  
    "dd32f512ee239ad74aa6f10c8cad37ce28d6c6922eff252ed641b1017130fe22", 
  "csrf"=> "040e9777d4dfae03bb1e6498f2a75482", 
  "tracking"=>{ 
    "HTTP_USER_AGENT"=> "e193e9e937caa9a19ca483f046281aae77d2216b", 
    "HTTP_ACCEPT_LANGUAGE"=> "66eae971492938c2dcc2fb1ddc8d7ec3196037da"
  }
}

You can access information from the hash just like you would any hash. @session["session_id"] 
will return "dd32f512ee239ad74aa6f10c8cad37ce28d6c6922eff252ed641b1017130fe22"

You can also modify and add data to the session hash by adding a key-value pair:

get '/hey' do
	session["name"] = "Victoria"
	@session = session
end

Viewing sessions:
Sessions are created on the server but you can view the contents if the session hash as a cookie in your browser using Dev Tools. 

Sessions and Data Persistance:
HTTP is a stateless protocol. HTTP is called a stateless protocol because a browser does not attach special meaning to a request,
and consequently does not require the server to retain any information about a user or entity for the duration of the request.
This means that each web request you send is from the point of view of the application that is receiving that request independently.
Meaning that if we didnt have sessions we would always have to login everytime we navigate into a website after loging in.

A session is a hash that lives in your application in the server. The session hash can be accessed in any controller file of your
application. We can access, add, change and delete data that is stored in a session hash in any controller file or
route at any time and that change persists for the duration of the session -- time between logging in and logging out.

The act of logging in is simply the act of having your user id stored inside the session hash. The act of loggin out is simply
the act of your user id being removed from the session hash.
The session hash is mostly used to store info like a users id which the web application will use to know who is the 'current user'
and show that user the appropriate information. We can put anything we want on the session hash.






























