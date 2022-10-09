# (7) SQL Exercises with 7-KYU
# 7-1 SQL Basics: Repeat and Reverse
#     Using our monsters table with the following schema:
#
# monsters table schema
# 	id
# 	name
# 	legs
# 	arms
# 	characteristics

# return the following table:
#	name
#	characteristics

# Where the name is the original string repeated three times (do not add any spaces), 
# and the characteristics are the original strings in reverse (e.g. 'abc, def, ghi' becomes 'ihg ,fed ,cba').
SELECT REPEAT(name, 3) AS name,
	   REVERSE(characteristics) AS characteristics
	   FROM monsters

# 7-2) SQL Basics: Maths with String Manipulations
# Given a demographics table in the following format:

# demographics table schema
#	id
#	name
#	birthday
#	race

# Return a single column named calculation where the value is the bit length of name, added to the number of characters in race.
SELECT BIT_LENGTH(name) + LENGTH(race) AS calculation FROM demographics

# 7-3) SQL Basics: Simple JOIN with COUNT
# For this challenge you need to create a simple SELECT statement that will return all columns from the people table, 
# and join to the toys table so that you can return the COUNT of the toys

# people table schema
#	id
#	name

# toys table schema
#	id
#	name
#	people_id

# You should return all people fields as well as the toy count as "toy_count".
SELECT *,
  (SELECT COUNT(*) FROM toys WHERE people.id = toys.people_id) AS toy_count
   FROM people
