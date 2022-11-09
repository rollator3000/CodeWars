# (8) SQL Exercises with 8-KYU
# 8-1 Third Angle of a Triangle

# You are given two interior angles (in degrees) of a triangle.
# Write a function to return the 3rd.
# Note: only positive integers will be tested.
# https://en.wikipedia.org/wiki/Triangle

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