# >> CodeWars 'SQL for Beginners Series' <<
# (1) Adults only (SQL for Beginners #1) ---------------------------------------
# In your application, there is a section for adults only. You need to get a 
# list of names and ages of users from the users table, who are 18 years old or 
# older.

# > "users" table schema
#	name
#	age
SELECT * FROM users
	WHERE age >= 18

# (2) On the Canadian Border (SQL for Beginners #2) ----------------------------
# You are a border guard sitting on the Canadian border. You were given a list 
# of travelers who have arrived at your gate today. You know that American, 
# Mexican, and Canadian citizens don't need visas, so they can just continue 
# their trips. You don't need to check their passports for visas! You only need 
# to check the passports of citizens of all other countries! Select names, and 
# countries of origin of all the travelers, excluding anyone from Canada, 
# Mexico, or The US.

# > "travelers" table schema
# 	name
# 	country
SELECT * FROM travelers 
	WHERE country NOT IN ('USA', 'Mexico', 'Canada')

# (3) Register for the Party (SQL for Beginners #3) ----------------------------
# You received an invitation to an amazing party. Now you need to write an 
# insert statement to add yourself to the table of participants.

# > "participants" table schema
# 	name (string)
# 	age (integer)
# 	attending (boolean)
INSERT INTO participants (name, age, attending)
    VALUES ('Klaus', 29, true)

# (4) --------------------------------------------------------------------------
# You are working for a local school, and you are responsible for collecting
# tuition from students. You have a list of all students, some of them have 
# already paid tution and some haven't. Write a select statement to get a list
# of all students who haven't paid their tuition yet. The list should include 
# all the data available about these students.

# > "students" table schema
#    name (string)
#    age (integer)
#    semester (integer)
#    mentor (string)
#    tuition_received (Boolean)
SELECT * FROM students
  	WHERE NOT tuition_received

# (5) --------------------------------------------------------------------------
# You work at a book store. It's the end of the month, and you need to find out 
# the 5 bestselling books at your store. Use a select statement to list names, 
# authors, and number of copies sold of the 5 books which were sold most.

# > "books" table schema
#    name
#    author
#    copies_sold
SELECT * FROM books
  	ORDER BY copies_sold DESC
	LIMIT 5

# (6) Countries Capitals for Trivia Night --------------------------------------
# Your friends told you that if you keep coding on your computer, you are going 
# to hurt your eyes. They suggested that you go with them to trivia night at the
# local club. Once you arrive at the club, you realize the true motive behind 
# your friends' invitation. They know that you are a computer nerd, and they
# want you to query the countries table and get the answers to the trivia 
questions.

# > "countries" table schema:
#    country (String)
#    capital (String)
#    continent (String)

# The first question: 
#  - From the African countries that start with the character E, get the names 
#    of their capitals ordered alphabetically.
#  - You should only give the names of the capitals. Any additional information
#    is just noise
#  - If you get more than 3, you will be kicked out, for being too smart
#  - Also, this database is crowd-sourced, so sometimes Africa is written Africa
#    and in other times Afrika.
SELECT capital FROM countries 
    WHERE continent IN ('Africa', 'Afrika') AND country LIKE 'E%' 
    ORDER BY capital 
    LIMIT 3