How the internet works:

The client sends an HTTP request through the browser and puts in the type of request and domain name. -HTTP
The unique domain name indentifies the unique location of the web server that hosts the 
site. - youtube.com, google.com, etc.

This sends a request header with all the information that the server needs to fulfill the request. 
Information such as type of request, metadata of what type of browser is making the request, source path and domain name. 

The request is then proccessed and returns the request and headers. The response are split into two
sections the top part is the header and the bottom part is the body. 
The headers are all of the metadata about the response. This includes things like content-length 
(how big is my response) and what type of content it is. The headers also include the status code
of the response. The body of the response is what you see rendered on the page. It is all of that 
HTML/CSS that you see! Most of the data of a response is in the body, not in the headers.

Status Codes:
100's - informational
200's - success
300's - redirect
400's - error
500's - server error'

HTTP Request
The http request that our browser sends is made up of two sections one is the header and the other is a path. I.E: google.com 
The path signifies which part of the sever it wants. I.E: shop.com/items -  '/items' is the server path.

In a rack app the path lives in the HTTP request and to get to it we inspect the env part of our call function. 
class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env) # env is where our HTTP request is and the Rack::Request object parses it
  
    resp.finish
  end
end

Rack::Request has a lot of useful tools. It has a method called '.path' where it returns the path that was requested.
In order to filter our HTTP request we can use the path method from our Rack::Request object.

class Application
 
  @@items = ["Apples","Carrots","Pears"]
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env) #req variable is a parsed version of the HTTP request
 
    if req.path.match(/items/) # we use the .path method to to filter out if the path has been requested or not. If this is true;
      @@items.each do |item|   # we would then print out our array @@items. 
        resp.write "#{item}\n"
      end
    else
      resp.write "Path Not Found" # If false we would let them know that the path does not exist.
    end
    resp.finish # This sends the information back to the browser.
  end
end

User input via the path:
If users want to check to see if we have specific items in our array. I.E: 'apples'
We would need to use GET parameters this is the '?' on each HTTP request path. I.E: http://google.com/search?q=apples
GET params come in key/value pairs the key in the http request above would be 'q' and the value is 'apples'.
Rack provides the mechanism to parse the GET paras and return them to use in a standard Hash.
See code below. 

class Application
 
  @@items = ["Apples","Carrots","Pears"]
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/) 
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/) #if the HTTP request contains a 'search' path
 
      search_term = req.params["q"] #get the value that equals to the key 'q' and set it equal to search_term
 
      if @@items.include?(search_term) #if @@items include the search_term
        resp.write "#{search_term} is one of our items" # confirm that the item is there
      else
        resp.write "Couldn't find #{search_term}" 
      end
 
    else
      resp.write "Path Not Found"
    end
 
    resp.finish
  end
end

Dynamic URL routes:

Dynamic routes was created because we cannot rewrite our paths everytime a new user signs up.



How the web works notes: 
The browsers speak a language called HTTP and the browser sends a request to the server
When the server sends the response back to the client it sends it using TCP/IP which 
breaks down the data into 8 bits and sends them all at once not in any specific order. 


DSL:
Domain Specific Langnage = A prgramming language on top of another programming langauge 






