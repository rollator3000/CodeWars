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