NoSQL - Not Only SQL
Key-value pairs
Column Family
graph
Document

SQL
Relational(tables)
Analytical(OLAP) - 3D arrays

-Structured - organized easy to join
-Error checkin - enforces relationships
-Fast Joins:
	-Cross Indexes 
	-Query Optimizer
-Support lots of documentation
-Stability features arent changing as much
-Reporting/analysis across relations

Frameworks:
SQL:
Sqlite


NoSQL: 
MongoDB



ActiveRecord Association Notes:

When an object belongs to another object, it always has the foreign key. 
In this example we have the songs table belongs_to the Artist table. This means 
that the song table will have a foreign key of artist_id as one of its columns and an
artist attribute inside of its class. 

class Song < ActiveRecord::Base
	belongs_to :artist

end 






















