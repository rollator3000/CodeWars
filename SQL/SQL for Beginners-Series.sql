# CodeWars 'SQL for Beginners Series'
# (1) Adults only (SQL for Beginners #1)
# In your application, there is a section for adults only. You need to get a list of names and ages
# of users from the users table, who are 18 years old or older.

# users table schema
#	name
#	age
SELECT * FROM users
	WHERE age >= 18

# (2) On the Canadian Border (SQL for Beginners #2)
# You are a border guard sitting on the Canadian border. You were given a list of travelers who have arrived
# at your gate today. You know that American, Mexican, and Canadian citizens don't need visas, so they can
# just continue their trips. You don't need to check their passports for visas! You only need to check the
# passports of citizens of all other countries!
# Select names, and countries of origin of all the travelers, excluding anyone from Canada, Mexico, or The US.

# travelers table schema
# 	name
# 	country
SELECT * FROM travelers 
	WHERE country NOT IN ('USA', 'Mexico', 'Canada')


# (3) Register for the Party (SQL for Beginners #3)
# You received an invitation to an amazing party. Now you need to write an insert statement to add yourself 
# to the table of participants.

# participants table schema
# 	name (string)
# 	age (integer)
# 	attending (boolean)
INSERT INTO participants (name, age, attending)
       VALUES ('Klaus', 29, true)