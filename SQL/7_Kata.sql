# (7) SQL Exercises with 7-KYU
# (7-1) SQL Basics: Repeat and Reverse -----------------------------------------
# Using our monsters table with the following schema:
# > "monsters" table schema:
# 	id
# 	name
# 	legs
# 	arms
# 	characteristics

# Return the following table:
#	  name
#	  characteristics

# Where the name is the original string repeated three times (don't add spaces), 
# and the characteristics are the original strings in reverse.
# (e.g. 'abc, def, ghi' becomes 'ihg ,fed ,cba').
SELECT REPEAT(name, 3) AS name,
	     REVERSE(characteristics) AS characteristics
FROM monsters

# (7-2) SQL Basics: Maths with String Manipulations ----------------------------
# Given a demographics table in the following format:
# > "demographics" table schema
#   id
#	  name
#	  birthday
#	  race

# Return a single column named calculation where the value is the bit length of
#  name, added to the number of characters in race.
SELECT BIT_LENGTH(name) + LENGTH(race) AS calculation 
FROM demographics

# (7-3) SQL Basics: Simple JOIN with COUNT -------------------------------------
# For this challenge you need to create a simple SELECT statement that will 
# return all columns from the people table, and join to the toys table so that 
# you can return the COUNT of the toys
# > "people" table schema
# 	id
#	  name

# > "toys" table schema
#	  id
#	  name
#	  people_id

# You should return all people fields as well as the toy count as "toy_count".
SELECT *,
       (SELECT COUNT(*) FROM toys WHERE people.id = toys.people_id) AS toy_count
FROM people

# (7-4) First and last IP in a network -----------------------------------------
# Given a table where users' connections are logged, find the first and the last
# address of the networks they connected from.

# Notes
# - Order the result by the id column
# - There's no need to validate anything - it's okay if the user connects from a
#   private network (You don't need the connection_time field for this task but
#                    without it the input data looks too dull)
# - You can read more about IPv4 on Wikipedia 

# Input table
# |    Table    |     Column      |   Type    |
# |-------------+-----------------+-----------|
# | connections | id              | int       |
# |             | connection_time | timestamp |
# |             | ip_address      | inet      |

# Output table
# |    Column     | Type |
# |---------------+------|
# | id            | int  |
# | first_address | text |
# | last_address  | text |
SELECT id,
	     network(ip_address) AS first_address,
  	   broadcast(ip_address) AS last_address
FROM connections
ORDER BY id

# (7-5) Truncating -------------------------------------------------------------
# Given the following table 'decimals':

# > "decimals" table schema
#	  id
#	  number1
#	  number2

# Return a table with a single column towardzero where the values are the 
# result of number1 + number2 truncated towards zero.
SELECT TRUNC(number1 + number2) AS towardzero
FROM decimals

# Alternativly (if you don't know TRUNC)
SELECT CASE 
          WHEN number1 + number2 > 0 
             THEN FLOOR(number1 + number2)
          ELSE CEILING(number1 + number2)
       END as towardzero
FROM decimals

# (7-6) Concatenating Columns --------------------------------------------------
# > "names"-table schema
#	  id
#	  prefix
#	  first
#	  last
#	  suffix

# Your task is to use a select statement to return a single column table con-
# taining the full title of the person (all columns together except id)
SELECT CONCAT(prefix, ' ', first, ' ', last, ' ', suffix) AS title 
FROM names

# (7-7) GROCERY STORE: Logistic Optimisation -----------------------------------
# You are the owner of the Grocery Store. All your products are in the database, 
# that you have created after CodeWars SQL excercises!:)
# You have reached a conclusion that you waste to much time because you have to 
# many different warehouse to visit each week. You have to find out how many 
# different type of products you buy from each producer - if you take only 
# few items from some of them you will stop going there to save the gasoline:)

# In the results show producer and count_products_types which you buy from him.
# Order the result by count_products_types (DESC) then by producer (ASC) in case
#  there are duplicate amounts

# > "products" table schema
#   id
#   name
#   price
#   stock
#   producer

# results table schema
#   count_products_types
#   producer
SELECT COUNT(stock) AS count_products_types, producer 
FROM products
GROUP BY producer
ORDER BY count_products_types DESC, 
         producer ASC

# (7-8) GROCERY STORE: Support Local Products ----------------------------------
# You are the owner of the Grocery Store. All your products are in the database,
# that you have created after CodeWars SQL excercises!:) You care about local
# market, and want to check how many products come from  United States of 
# America or Canada. Please use SELECT statement and IN to filter out other 
# origins. In the results show how many products are from United States of 
# America and Canada respectively. Order by number of products, descending.

# > "products" table schema
#   id
#   name
#   price
#   stock
#   producer
#   country

# results table schema
#   products
#   country
SELECT country, 
       COUNT(*) AS products 
FROM products
WHERE country IN ('Canada', 'United States of America')
GROUP BY country
ORDER BY products DESC

# (7-9) Easy SQL: Counting and Grouping ----------------------------------------
# Given a demographics table in the following format:

# > "demographics" table schema
#   id
#   name
#   birthday
#   race

# you need to return a table that shows a count of each race represented, 
# ordered by the count in descending order as:

# output table schema
#   race
#   count
SELECT race, 
       COUNT(*) AS count 
FROM demographics
GROUP BY race 
ORDER BY count DESC

# (7-10) SQL Basics: Raise to the Power ----------------------------------------
# Given the following table 'decimals':

# > "decimals" table schema
#   id
#   number1
#   number2

# Return a table with a single column result which is the output of 
# number1 raised to the power of number2.
SELECT POWER(number1, number2) AS result
FROM decimals

# (7-11) Alphabetical Addition -------------------------------------------------
# Your task is to add up letters to one letter.
# In SQL, you will be given a table letters, with a string column letter. 
# Return the sum of the letters in a column letter.

# Notes:
# - Letters will always be lowercase.
# - Letters can overflow (see second to last example of the description)
# - If no letters are given, the function should return 'z'

# Examples:
#   table(letter: ["a", "b", "c"]) = "f"
#   table(letter: ["a", "b"]) = "c"
#   table(letter: ["z"]) = "z"
#   table(letter: ["z", "a"]) = "a"
#   table(letter: ["y", "c", "b"]) = "d" -- notice the letters overflowing
#   table(letter: []) = "z"
SELECT CASE
        WHEN SUM(ASCII(letter) - 96) % 26 = 0 THEN 'z'
        WHEN SUM(ASCII(letter) - 96) > 26     THEN CHR(CAST(SUM(ASCII(letter) - 96) % 26 AS int) + 96)
        WHEN SUM(ASCII(letter) - 96) <= 26    THEN CHR(CAST(SUM(ASCII(letter) - 96)      AS int) + 96)
        ELSE 'z'
      END AS letter
FROM letters

# (7-12) Alphabetical Addition -------------------------------------------------
# There is truly no magic in the world; the Hogwarts Sorting Hat is SQL-based, 
# its decision-making powers are common operators and prospectIve students are
#  merely data - names, and two columns of qualities.

# students
# - id
# - name
# - quality1
# - quality2

# Slytherin are being quite strict this year and will only take students who are
# evil AND cunning.
# Gryffindor will take students who are brave but only if their second quality 
# is NOT evil.
# Ravenclaw accepts students who are studious OR intelligent.
# Hufflepuff will simply take those who have the quality hufflepuff.
# (don't worry, for simplicity's sake 'brave' and 'studious' will only appear in
#  quality1, and 'cunning' and 'intelligent' will only appear in quality2.)

# Return the id, name, quality1 and quality2 of all the students who'll be 
# accepted, ordered by ascending id.
SELECT * FROM students
  WHERE quality1 = 'evil' AND quality2 = 'cunning' OR
        quality1 = 'brave' AND quality2 <> 'evil' OR
        quality1 in ('studious', 'hufflepuff') OR 
        quality2 in ('intelligent', 'hufflepuff')
  ORDER BY id