=begin
	The '.send' method basically takes in two arguments and creates a setter method. The first
	argument inside of the method is a setter method name and the second argument is its value.
	instance_of_class.send(key=, value) == instance_of_class.key = value

	Or to be more clear lets say 'key' is euqal to name and value is ken. 
	instance_of_class.send(key=, value) == instance_of_class.name = ken
=end

class Twitter
	attr_accessor :username, :first_name, :last_name, :dob, :hobbies, :other_hobbies

	def initialize(information)
		information.each { |key,value| self.send(("#{key}="),value) }
	end

	def user_profile
		puts "Username: #{@username}"
		puts "Name: #{@first_name} #{@last_name}"
		puts "Date of Birth: #{@dob}"
		puts "Hoobies: #{@hobbies}"
	end

end
users_infromation = { username: "kenkuts", first_name: "Kenneth", last_name: "Kutschera", dob: "April 4, 1991", 
	hobbies: "Lifting, Coding, Running", other_hobbies: "Shopping"}

ken = Twitter.new(users_infromation)
ken.user_profile