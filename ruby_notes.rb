=begin
	RUBY MODULES

	This block of instruction contains notes from learning ruby modules. Modules are basically method packages
	that can be accessed by a class if they are 'included' in the begining of the class declaration. This is done
	as shown below:

=end
require_relative './dance_module.rb'
class Dancer
	include Moves  # Module class name
	...
	...
end

=begin
	The Moves module methods are the Dancer classes instance methods. This will allow the class to use its
	methods declared within the module. In order to use modules we would need to put a 'require_relative './filepath'' on top of the file.

	We can also take the modules methods as a class method by using the 'extend' keyword instead of a 'include'
	This is done by replacing the 'include' with 'extend'.

	We can also create nested modules to specify which module we will use for instance methods and class 
	methods. This is done by putting the modules within a bigger module. 

=end

module BigModule
	module LittleModule 
		def ...
		end
	end

	module TinyModule
		def ....
		end
	end
end

=begin 
	We can also specify which module we will use as an instance method or as a class method
	For example the person class will use the little modules for its instance methods and the
	tinymodule for class methods.
=end
class Person
	include BigModule::LittleModule
	extend BigModule::TinyModule
end
=begin
	The '::' specifies that this is a parent to child relationship of the nested modules and that the 
	parent module will always be at the left side while the child will always be at the rigth. 
=end

=begin
To unistall a RUBY gem: gem uninstall <gem_name>
Creating a RUBY gem
type 'bundle gem <gemname>'
This will create the files essential for creating a ruby
gem.

For creating an executable code file me must use the bin file.
Within the 'bin' folder we must put a shebang line on the first line
of our file. 

'#!/usr/bin/env ruby'

this will tell the system know that it should use ruby to execute
our code.
Since our excecutable file is not a ruby file the shebang
line on top of it makes sure that the system interprets the
file as a ruby file.

To change your bin excutable file with an executable command you would need to type
chmod +x <file> 
This would allow you to run your bin file as './bin/gigs'

What you should write insdie of your bin file: 
When coding your bin/<gem_file> be as abstract as possible
meaning that the program's functionality will be hidden from
the user. What you want to put is a simple class method
call that starts the programs UI. An example would be:
'Gigs::CLI.new.call'
This would be our CLI controller. In an MVC, controllers 
are responsible for our business logic and the CLI class is
a great example of what this is it contains most of our
programs functionality.
=end










































































