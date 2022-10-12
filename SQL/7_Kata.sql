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

# 7-2 SQL Basics: Maths with String Manipulations
# Given a demographics table in the following format:

# demographics table schema
#	id
#	name
#	birthday
#	race

# Return a single column named calculation where the value is the bit length of name, added to the number of characters in race.
SELECT BIT_LENGTH(name) + LENGTH(race) AS calculation FROM demographics

# 7-3 SQL Basics: Simple JOIN with COUNT
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

# 7-4 First and last IP in a network
# Given a table where users' connections are logged, find the first and the last address of the
# networks they connected from.

# Notes
# - Order the result by the id column
# - There's no need to validate anything - it's okay if the user connects from a private network
#   (You don't need the connection_time field for this task but without it the input data looks too dull)
# - You can read more about IPv4 on Wikipedia 

# Input table
# ---------------------------------------------
# |    Table    |     Column      |   Type    |
# |-------------+-----------------+-----------|
# | connections | id              | int       |
# |             | connection_time | timestamp |
# |             | ip_address      | inet      |
# ---------------------------------------------

# Output table
# ------------------------
# |    Column     | Type |
# |---------------+------|
# | id            | int  |
# | first_address | text |
# | last_address  | text |
# ------------------------
SELECT id,
	   network(ip_address) as first_address,
  	   broadcast(ip_address) AS last_address
	FROM connections
	ORDER BY id

# 7-5 Truncating
# Given the following table 'decimals':

# decimals table schema
#	id
#	number1
#	number2

# Return a table with a single column towardzero where the values are the 
# result of number1 + number2 truncated towards zero.
SELECT TRUNC(number1+number2) as towardzero
	FROM decimals

# Alternativly (if you don't know TRUNC)
SELECT CASE 
          WHEN number1 + number2 > 0 
             THEN FLOOR(number1 + number2)
          ELSE CEILING(number1 + number2)
       END as towardzero
	FROM decimals
