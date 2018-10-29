## Regular Expession

## this is a regular expression course.
## the dot selects everything inside of the string. The notation below

[cmf]an # this regEx specifies what we want to match meaning
		# anything from a c, m, and f that follows an 'an' is 
		# a correct ex: can, man, fam is a match. Anything that
		# is not those three will never match. 

\w+ing  # The \w means any word or character
		# the + means one or more of whatever is the first letter or metacharacter
		# the ing is just specific. 
.scan(/\w+ing/) # will return an array of words with 'ing'

# The ruby match method will return the first word that matches inside
# of our regEx declaration
"There is a light that never goes out.".match(/\w+ht/)
#=> returns "light"
# if nothing is found it will return nil

.grep # is an enumreable method that for pattern searching inside arrays
	  # and hashes. This is the same as the .scan method the only dif. is
	  # that it is scans arrays instead of strings.

# if the ^ is inside brackets [] this would mean that the ^ is equivlent to
# except. 
# If it is outside of [] this would mean that ^ is a starting line.



