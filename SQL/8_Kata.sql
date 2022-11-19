# (8) SQL Exercises with 8-KYU
# 8-1 Third Angle of a Triangle
# You are given two interior angles (in degrees) of a triangle.
# Write a function to return the 3rd.
# Note: only positive integers will be tested.

# you are given a table 'otherangle' with columns 'a' and 'b'.
# return a table with these columns and your result in a column named 'res'.
SELECT a,
	   b,
	   (180 - (a + b)) AS res
FROM otherangle

# 8-2 String repeat
# Write a function that accepts an integer n and a string s as parameters, 
# and returns a string of s repeated exactly n times.

# Write your SQL statement here: you are given a table 'repeatstr' with columns 'n' and 's', 
# Return a table with all columns and your result in a column named 'res'.
SELECT s,
       n,
       REPEAT(s, n) AS res
FROM repeatstr

# 8-3 Opposite number
# Very simple, given an integer or a floating-point number, find its opposite.
# Examples:
# 	  1: -1
# 	 14: -14
# 	-34:  34

# You will be given a table: opposite, with a column: number. 
# Return a table with a column: res.
# LONG
SELECT CASE
        WHEN number = 0 THEN 0
        WHEN number > 0 THEN -number
        WHEN number < 0 THEN -number
       END AS res
FROM opposite

# SHORT
SELECT -number AS res 
FROM opposite

# 8-4 Remove First and Last Character
# It's pretty straightforward. Your goal is to create a function that removes the first and 
# last characters of a string. You're given one parameter, the original string. 
# You don't have to worry with strings with less than two characters.
# -- You are given a table 'removechar' with column 's', 
#    return a table with column 's' and your result in a column named 'res'
SELECT s, CASE 
           WHEN LENGTH(s) < 3 THEN ''
           ELSE SUBSTRING(s, 2, LENGTH(s) - 2)
          END AS res
FROM removechar

# 8-5 Will you make it?
# You were camping with your friends far away from home, but when it's time to go back, 
# you realize that your fuel is running out and the nearest pump is 50 miles away! 
# You know that on average, your car runs on about 25 miles per gallon. There are 2 gallons left.
# Considering these factors, write a function that tells you if it is possible to get to the pump or not.

# Write your SQL statement here: you are given a table 'zerofuel' with columns 
# 'distance_to_pump', 'mpg' and 'fuel_left', return a table with all the columns 
# and your result in a column named 'res'.
SELECT distance_to_pump,
       mpg,
       fuel_left,
       CASE 
        WHEN (mpg * fuel_left) < distance_to_pump THEN false
        ELSE true
       END AS res
FROM zerofuel

# 8-6 Is it a palindrome?
# Write a function that checks if a given string (case insensitive) is a palindrome.
# You are given a table 'ispalindrome' with column 'str', return a table with column 
# 'str' and your result in a column named 'res'.
SELECT str, 
       REVERSE(LOWER(str)) = LOWER(str) AS res
FROM ispalindrome

# 8-7 Remove exclamation marks
# Write function RemoveExclamationMarks which removes all exclamation marks from a given string.
# You are given a table 'removeexclamationmarks' with column 's', return a table with column 's' and your result in a column named 'res'.
SELECT s,
       REPLACE(s, '!', '') AS res
FROM removeexclamationmarks
