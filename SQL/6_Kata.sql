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

# 6-5 Analyzing the sales by product and date
# Given the information about sales in a store, calculate the total revenue for each day, month, year, and product.
# Notes
# - The sales table stores only the dates for which any data has been recorded - the information about individual 
#   sales (what was sold, and when) is stored in the sales_details table instead
# - The sales_details table stores totals per product per date
# - Order the result by the product_name, year, month, day columns
# - We're interested only in the product-specific data, so you shouldn't return the total revenue from all sales

# Input tables
# ----------------------------------------
# |    Table      |   Column   |  Type   |
# |---------------+------------+---------|
# | products      | id         | int     |
# |               | name       | text    |
# |               | price      | numeric |
# |---------------+------------+---------|
# | sales         | id         | int     |
# |               | date       | date    |
# |---------------+------------+---------|
# | sales_details | id         | int     |
# |               | sale_id    | int     |
# |               | product_id | int     |
# |               | count      | int     |
# ----------------------------------------

# Output table
# --------------------------
# |    Column    |  Type   |
# |--------------+---------|
# | product_name | text    |
# | year         | int     |
# | month        | int     |
# | day          | int     |
# | total        | numeric |
# --------------------------
SELECT name                          AS product_name,
  	   EXTRACT(year from date)::int  AS year,
  	   EXTRACT(month from date)::int AS month,
  	   EXTRACT(day from date)::int   AS day,
  	   SUM(price * count)            AS total
FROM sales_details 
JOIN sales    ON sales_details.sale_id    = sales.id
JOIN products ON sales_details.product_id = products.id
GROUP BY name, rollup(year, month, day)
ORDER BY product_name, year, month, day

# 6-6 Subqueries master
# The objective of this Kata is to show that you are proficient at string manipulation 
# (and perhaps that you can use extensively subqueries).

# You will use people table but will focus solely on the name column
# name: Greyson Tate Lebsack Jr. - Elmore Clementina O'Conner

# Will be provided with a full name and you have to return the name in columns as follows.
# name:              Greyson       Elmore
# first_lastname:    Tate          Clementina
# second_lastname:   Lebsack Jr.   O'Conner

# Note: Don't forget to remove spaces around names in your result. 
# Note: Due to multicultural context, if full name has more than 3 words, consider first 2 as name
SELECT
  SUBSTRING(name, '^(.+)\s\S+\s\S+$') AS name,
  SUBSTRING(name, '^.+\s(\S+)\s\S+$') AS first_lastname,
  SUBSTRING(name, '^.+\s(\S+)$')      AS second_lastname
FROM people

# 6-7 SQL Basics: Simple table totaling.
# For this challenge you need to create a simple query to display each unique clan with their total 
# points and ranked by their total points. 

# people table schema
#  name
#  points
#  clan

# You should then return a table that resembles below select on
#	rank
#	clan
#	total_points
#	total_people

# The query must rank each clan by their total_points, you must return each unqiue clan and if there is no clan name 
# (i.e. it's an empty string) you must replace it with [no clan specified], you must sum the total_points for each clan 
# and the total_people within that clan.
# Note The data is loaded from the live leaderboard, this means values will change but also could cause the kata to time 
# out retreiving the information.
SELECT RANK() OVER (ORDER BY SUM(points) DESC),
  	   COALESCE(NULLIF(clan,''), '[no clan specified]') AS clan,
  	   SUM(points) AS total_points,
  	   COUNT(*) AS total_people
  	FROM people 
  	GROUP BY clan
  	ORDER BY total_points DESC

