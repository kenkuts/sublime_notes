DOM - Document Object Model:
	-Structured representation of an HTML document.
	-It can be used to connect webpages to scripts like JS. 
	-HTML webpage content is stored in the DOM, which can then be accessed and 
	manipulated by JS.

	-For each HTML box, there is an object in the DOM that we can access
	and interact with.

HTML:
	-id: is unique
	     is represented with a # in CSS

	-class: can be used for different elements. 
			is represented with a . in CSS

Events:
	- Notifications that are sent to notify the code that something happened
		on the webpage.
	- Example: clicking a button, resizing a window, scrolling down or press
		ing a key.
	- Event Listeners: are functions that performs an action based on a certain
		event. It waits for a specific event to happen.


* How to setup an event handler 
	


* Call back functions
	- Are functions that are passed into another function and are called
		by that function.

* Anonymous Function
	- Are functions that doesn't have a name, it cannot be reused
	Example:

	document.querySelector('.btn-roll').addEventListener('click', 
		function() {
			// Do something 
			// This is the annonymous function
		});

* Selecting Elements by ID
	document.getElementById('score-0').textContent = '0';
	// Selects the element that has the specified id attribute
	// There is no need to add the hash marks!

* Change the img in an <img> element:
	Using string concatenation with the image name 
	can change your images when doing a certain event.







































