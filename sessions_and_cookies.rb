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