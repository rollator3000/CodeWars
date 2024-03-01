# (6) SQL Exercises with 6-KYU
# 6-1 SQL Basics: Simple JOIN and RANK
# For this challenge you need to create a simple SELECT statement that will return all columns from the people table, 
# and join to the sales table so that you can return the COUNT of all sales and RANK each person by their sale_count.

# (1) people table schema
#  - id
#  - name

# (2) sales table schema
#  - id
#  - people_id
#  - sale
#  - price

# Return all people fields as well as the sale count as "sale_count" and the rank as "sale_rank".
SELECT people.*,
       COUNT(sales) as sale_count,                               -- Count the amount of sales
       RANK() OVER (ORDER BY sum(sales.price) DESC) as sale_rank -- create ranging based on the sum of sales
  FROM people
  JOIN sales ON sales.people_id = people.id -- join the sales information
  GROUP BY people.id                        -- group over persons

# 6-2 SQL Basics: Simple UNION ALL
# For this challenge you need to create a UNION statement, there are two tables ussales and eusales 
# the parent company tracks each sale at its respective location in each table, you must all filter 
# the sale price so it only returns rows with a sale greater than 50.00. You have been tasked with 
# combining that data for future analysis. Order by location (US before EU), then by id.

# (1) (us/eu)sales table schema
# - id
# - name
# - price
# - card_name
# - card_number
# - transaction_date

# (2) resultant table schema
#  - location (EU for eusales and US for ussales)
#  - id
#  - name
#  - price
#  - card_name
#  - card_number
#  - transaction_date
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

# (1) people table schema
# - id
# - name
# - age

# return table schema
# - age
# - total_people
SELECT age, 
       COUNT(*) as total_people FROM people -- Count the amount of people
  GROUP BY age                              -- group it by the age
  HAVING COUNT(*) > 9                       -- and only keep groups > 9 (HAVING = WHERE for GroupBy)

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
SELECT EXTRACT(MONTH FROM payment_date)        AS month,         -- Get the month from the payment date
       COUNT(*)                                AS total_count,   -- Count amount of payments
       SUM(amount)                             AS total_amount,  -- Get the sum of payments
       COUNT(*)    FILTER (WHERE staff_id = 1) AS mike_count,    -- Count the amount of payments at Mike's
       SUM(amount) FILTER (WHERE staff_id = 1) AS mike_amount,   -- Get the sum of payment's at Mike's
       COUNT(*)    FILTER (WHERE staff_id = 2) AS jon_count,     -- Count the amount of payments at Jon's
       SUM(amount) FILTER (WHERE staff_id = 2) AS jon_amount     -- Get the sum of payment's at Jon's
  FROM payment
  GROUP BY month
  ORDER BY month

# 6-5 Analyzing the sales by product and date
# Given the information about sales in a store, calculate the total revenue for each day, month, year, and product.
# Notes:
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
SELECT name                          AS product_name, -- Name of the product
  	   EXTRACT(year from date)::int  AS year,         -- Extract year, month and day from date
  	   EXTRACT(month from date)::int AS month,
  	   EXTRACT(day from date)::int   AS day,
  	   SUM(price * count)            AS total         -- Total spending
FROM sales_details 
JOIN sales    ON sales_details.sale_id    = sales.id   
JOIN products ON sales_details.product_id = products.id
GROUP BY name, rollup(year, month, day)
ORDER BY product_name, year, month, day

# 6-6 Subqueries master
# The objective of this Kata is to show that you are proficient at string manipulation 
# (and perhaps that you can use extensively subqueries).

# You will use people table but will focus solely on the name column
# name: 
#  - Greyson Tate Lebsack Jr.
#  - Elmore Clementina O'Conner

# Will be provided with a full name and you have to return the name in columns as follows.
# - name:              Greyson       Elmore
# - first_lastname:    Tate          Clementina
# - second_lastname:   Lebsack Jr.   O'Conner

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

# (1) people table schema
# - name
# - points
# - clan

# You should then return a table that resembles below select on
#	- rank
#	- clan
#	- total_points
#	- total_people

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

# 6-8 Customers with Urgently Expiring Certificates
# You are working with a database for a company that manages certifications for its customers. 
# The company needs to identify customers who have certificates expiring within the next 14 days and do not have any other certificates that expire later. 
# This information is crucial for sending timely reminders to customers for renewals.

# (1) customers table:
# - id (int): primary key.
# - ssn (string): The social security number of the customer. Serves as a unique identifier.
# - name (string): The name of the customer.

# (2) certs table:
# - id (int): primary key.
# - cert_num (string): The unique number of the certificate.
# - ssn (string): The social security number of the customer to whom the certificate belongs. This is a foreign key referencing the Customers table.
# - cert_start (date): The start date of the certificate's validity.
# - cert_finish (date): The expiration date of the certificate.

# Construct an SQL query that selects the appropriate data from these tables. The query should:
# - Identify certificates that are expiring within the next 14 days from the current_date.
# - For each customer, the query should include every certificate that is expiring within the next 14 days. 
#   --> This means a single customer might have multiple certificates listed in the results if all of them are expiring within the 14-day window.
# - Exclude customers who have any other certificates with expiration dates beyond this 14-day window.
# - Order the results by the customer's name then by customer's SSN, and finally by certificate number - all in ascending order.

# Expected Result Columns:
# - name: The name of the customer.
# - ssn: The social security number of the customer.
# - cert_num: The number of the certificate.
# - cert_start: The start date of the certificate's validity.
# - cert_finish: The expiration date of the certificate.

SELECT customers.name,
       certs.ssn, 
       certs.cert_num,
       certs.cert_start,
       certs.cert_finish
FROM certs
JOIN customers ON customers.ssn = certs.ssn -- join the customer information based on the 'ssn'
WHERE cert_finish - CURRENT_DATE <= 14      -- only keep those contracts that run out in the next 14 days
  AND cert_finish - CURRENT_DATE > 0
  AND certs.ssn NOT IN (                    -- exclude those customers that have another contract valid > 14 days
    SELECT ssn ssn                          -- (single customers might have multiple contracts)
    FROM certs
    WHERE CERT_FINISH - CURRENT_DATE > 14 
  )
ORDER BY customers.name, certs.ssn, certs.cert_num ASC -- order the results

# 6-9 Youngest Team Members
# You are working with a database that stores information about employees in a tech firm. 
# The database includes a table named employees with the following columns:
# - employee_id: A unique integer identifier for each employee.
# - full_name:   A string representing the employee's full name.
# - team:        A string that specifies which team the employee is part of("backend", "frontend", "devops", or "design")
#- birth_date:   A date that represents the employee's birthdate.

# The company is planning an event where the youngest employee from each team will be given a chance to share their vision of future technology trends.
# Your task is to write an SQL query that retrieves the complete record for the youngest member of each team. 
# You should consider the person with the latest birthdate as the youngest. Let's assume for this task that the are no youngest employees who share the same birthdate.

# The classical solution of using aggregate function and group by is forbidden. Can you come up with something more witty?

# The result should be ordered by team in asc alphabetical order.

# The desired output should look like this:

# employee_id   full_name     team      birth_date
#    11         John Doe      backend   1980-12-01
#    7          Jane Smith    design    1985-05-03
#    24         Bob Jones     devops    1990-04-15
#    54         Dana Smith    frontend  1995-05-03

# 'DISTINCT ON' --> will only return one entrance per 'team'
SELECT DISTINCT ON (team) employee_id, full_name, team, birth_date
       FROM employees
ORDER BY team, birth_date DESC

# 6-10 Reporting on House Maintenance Tasks Completion
# A home maintenance company uses a database to keep track of tasks that need to be performed at various houses. 
# The database has two tables: 
# 1) house_tasks: contains a list of tasks scheduled for each house identified by a house_id. 
#   - task_id (int, primary key): A unique identifier for each task.
#   - house_id (int)            : The identifier of the house for which the task is scheduled.
#   - task_name (varchar)       : The name of the task to be performed.

# 2) task_status: racks the progress of each task, including a description and its current status.
#   - id (int, primary key): A unique identifier for each task status record.
#   - task_id (int)        : The identifier of the task which this status relates to.
#   - description (varchar): A brief description of the task status.
#   - task_status (varchar): The current status of the task; it can be 'Completed', 'In Progress', or NULL if the status has not been set.

# Write a SQL query that generates a report for each house. The report should include the following columns:

# - house_id        : The identifier of the house.
# - total_tasks     : The total number of tasks scheduled for the house.
# - completed_tasks : The number of tasks that have been completed. 
#                     A task is considered completed if all of its corresponding statuses in the task_status table are set to 'Completed'.
# - incomplete_tasks: The number of tasks that are not completed. 
#                     A task is considered incomplete if any of its statuses are not 'Completed' or if the task does not have any status record in the task_status table.
# The result should be ordered by house_id in descending order.

# For this sample data:
'house_tasks:
| task_id | house_id | task_name |
+---------+----------+-----------+
| 1       | 1        | Paint     |
| 2       | 1        | Plumb     |
| 3       | 1        | Garden    |
| 4       | 2        | Electric  |
| 5       | 2        | Roof      |
| 6       | 3        | Cleanup   |
| 7       | 4        | Extra Work|

task_status:
| task_id | description | task_status |
+---------+-------------+-------------+
| 1       | Desc 1      | Completed   |
| 1       | Desc 2      | Completed   |
| 1       | Desc 3      | Completed   |
| 2       | Desc 4      | In Progress |
| 2       | Desc 5      | In Progress |
| 3       | Desc 6      | In Progress |
| 3       | Desc 7      | Completed   |
| 4       | Desc 8      | Completed   |
| 5       | Desc 9      | NULL        |
| 7       | Desc 10     | NULL        |
| 7       | Desc 11     | Completed   |

desired output:
| house_id | total_tasks | completed_tasks | incomplete_tasks |
+----------+-------------+-----------------+------------------+
| 4        | 1           | 0               | 1                |
| 3        | 1           | 0               | 1                |
| 2        | 2           | 1               | 1                |
| 1        | 3           | 1               | 2                |
'
SELECT house_id, 
       COUNT(DISTINCT task_id)                                                                                   AS total_tasks, 
       COUNT(DISTINCT task_id) - COUNT(DISTINCT task_id) FILTER (WHERE task_status IS DISTINCT FROM 'Completed') AS completed_tasks,
       COUNT(distinct task_id) FILTER(WHERE task_status IS DISTINCT FROM 'Completed')                            AS incomplete_tasks
FROM house_tasks LEFT JOIN task_status
GROUP BY house_id
ORDER BY house_id DESC