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

# 6-4 Conditional Count
# Given a payment table, which is a part of DVD Rental Sample Database, with the following schema:
	# Column       | Type                        | Modifiers
	# -------------+-----------------------------+----------
	# payment_id   | integer                     | not null 
	# customer_id  | smallint                    | not null
	# staff_id     | smallint                    | not null
	# rental_id    | integer                     | not null
	# amount       | numeric(5,2)                | not null
	# payment_date | timestamp without time zone | not null

# Produce a result set for the report that shows a side-by-side comparison of the number and total 
# amounts of payments made in Mike's and Jon's stores broken down by months.
# The resulting data set should be ordered by month using natural order (Jan, Feb, Mar, etc.).
# Note: You don't need to worry about the year component. Months are never repeated because the 
# sample data set contains payment information only for one year.

# The desired output for the report
	# month | total_count | total_amount | mike_count | mike_amount | jon_count | jon_amount
	# ------+-------------+--------------+------------+-------------+-----------+-----------
	# 2     |             |              |            |             |           |           
	# 5     |             |              |            |             |           |           
	# ...

# - month        - number of the month (1 - January, 2 - February, etc.)
# - total_count  - total number of payments
# - total_amount - total payment amount
# - mike_count   - total number of payments accepted by Mike (staff_id = 1)
# - mike_amount  - total amount of payments accepted by Mike (staff_id = 1)
# - jon_count    - total number of payments accepted by Jon (staff_id = 2)
# - jon_amount   - total amount of payments accepted by Jon (staff_id = 2)
SELECT EXTRACT(MONTH FROM payment_date)        AS month,
       COUNT(*)                                AS total_count,
       SUM(amount)                             AS total_amount,
       COUNT(*)    FILTER (WHERE staff_id = 1) AS mike_count,
       SUM(amount) FILTER (WHERE staff_id = 1) AS mike_amount,
       COUNT(*)    FILTER (WHERE staff_id = 2) AS jon_count,
       SUM(amount) FILTER (WHERE staff_id = 2) AS jon_amount
  FROM payment
  GROUP BY month
  ORDER BY month
