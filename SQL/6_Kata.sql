# (6) SQL Exercises with 6-KYU
# 6-1 SQL Basics: Simple JOIN and RANK
# For this challenge you need to create a simple SELECT statement that will return all columns from 
# the people table, and join to the sales table so that you can return the COUNT of all sales and RANK 
# each person by their sale_count.

# people table schema
#  id
#  name

# sales table schema
#  id
#  people_id
#  sale
#  price

# Return all people fields as well as the sale count as "sale_count" and the rank as "sale_rank".
SELECT people.*,
       COUNT(sales) as sale_count, 
       RANK() OVER (ORDER BY sum(sales.price) DESC) as sale_rank
  FROM people
  JOIN sales ON sales.people_id = people.id
  GROUP BY people.id

# 6-2 SQL Basics: Simple UNION ALL
# For this challenge you need to create a UNION statement, there are two tables ussales and eusales 
# the parent company tracks each sale at its respective location in each table, you must all filter 
# the sale price so it only returns rows with a sale greater than 50.00. You have been tasked with 
# combining that data for future analysis. Order by location (US before EU), then by id.

# (us/eu)sales table schema
#   id
#   name
#   price
#   card_name
#   card_number
#   transaction_date

# resultant table schema
#   location (EU for eusales and US for ussales)
#   id
#   name
#   price
#   card_name
#   card_number
#   transaction_date
SELECT 'US' AS location, *
	FROM ussales
	WHERE price>50
UNION ALL 
SELECT 'EU', * FROM eusales
	WHERE price>50
ORDER BY location DESC, id ASC

# 6-3 SQL Basics: Simple HAVING 
# For this challenge you need to create a simple HAVING statement, you want to count how many 
# people have the same age and return the groups with 10 or more people who have that age.

# people table schema
#  id
#  name
#  age

#return table schema
#  age
#  total_people
SELECT age, COUNT(*) as total_people FROM people
  GROUP BY age
  HAVING COUNT(*) > 9