If statement assignments
	If user = User.find_by(:email => email) # If User.find_by returns an object then that means that user will be assigned that object
		true								# If there is such an object then the statement is true.
	else
		false								# If the object doesnt exist then the user variable will be set to nil thus equals to false.
	end									


RUBY Restful notes: