# (8) SQL Exercises with 8-KYU
# (8-1) Third Angle of a Triangle ----------------------------------------------
# You are given two interior angles (in degrees) of a triangle. Write a function
# to return the 3rd. Note: only positive integers will be tested.

# You are given a table 'otherangle' with columns 'a' and 'b'.
# Return a table with these columns and your result in a column named 'res'.
SELECT a,
	     b,
	     (180 - (a + b)) AS res
FROM otherangle

# (8-2) String repeat ----------------------------------------------------------
# Write a function that accepts an integer n and a string s as parameters and
# returns a string of s repeated exactly n times.

# Write your SQL statement here: you are given a table 'repeatstr' with columns
# 'n' and 's'. Return a table with all columns and your result in a column named
# 'res'.
SELECT s,
       n,
       REPEAT(s, n) AS res
FROM repeatstr

# (8-3) Opposite number --------------------------------------------------------
# Very simple, given an integer or a floating-point number, find its opposite.
# Examples:
# 	  1: -1
# 	 14: -14
# 	-34:  34

# You will be given a table: opposite, with a column: number. Return a table 
# with a column: res.
# LONG-Version
SELECT CASE
        WHEN number = 0 THEN 0
        WHEN number > 0 THEN -number
        WHEN number < 0 THEN -number
       END AS res
FROM opposite

# SHORT-Version
SELECT -number AS res 
FROM opposite

# (8-4) Remove First and Last Character ----------------------------------------
# It's pretty straightforward. Your goal is to create a function that removes 
# the first and  last characters of a string. You're given one parameter, the 
# original string. You don't have to worry with strings with less than two 
# characters.

# You are given a table 'removechar' with column 's', return a table with the 
# column 's' and your result in a column named 'res'
SELECT s, 
       CASE 
        WHEN LENGTH(s) < 3 THEN ''
        ELSE SUBSTRING(s, 2, LENGTH(s) - 2)
       END AS res
FROM removechar

# (8-5) Will you make it? ------------------------------------------------------
# You were camping with your friends far away from home, but when it's time to 
# go back, you realize that your fuel is running out and the nearest pump is 
# 50 miles away! You know that on average, your car runs on about 25 miles per
# gallon. There are 2 gallons left. Considering these factors write a function
#  that tells you if it is possible to get to the pump or not.

# Write your SQL statement here: you are given a table 'zerofuel' with columns 
# 'distance_to_pump', 'mpg' and 'fuel_left', return a table with all the 
# columns and your result in a column named 'res'.
SELECT distance_to_pump,
       mpg,
       fuel_left,
       CASE 
        WHEN (mpg * fuel_left) < distance_to_pump THEN false
        ELSE true
       END AS res
FROM zerofuel

# (8-6) Is it a palindrome? ----------------------------------------------------
# Write a function that checks if a string (case insensitive) is a palindrome.

# You are given a table 'ispalindrome' with column 'str', return a table with
# the column 'str' and your result in a column named 'res'.
SELECT str, 
       REVERSE(LOWER(str)) = LOWER(str) AS res
FROM ispalindrome

# (8-7) Remove exclamation marks -----------------------------------------------
# Write function RemoveExclamationMarks which removes all exclamation marks 
# from a given string.

# You are given a table 'removeexclamationmarks' with column 's', return a 
# table with column 's' and your result in a column named 'res'.
SELECT s,
       REPLACE(s, '!', '') AS res
FROM removeexclamationmarks

# (8-8) Keep Hydrated! ---------------------------------------------------------
# Nathan loves cycling. Because Nathan knows it is important to stay hydrated, 
# he drinks 0.5 litres of water per hour of cycling. You get given the time in 
# hours and you need to return the number of litres Nathan will drink, rounded 
# to the smallest value.
# For example:
#   hours = 3 ----> liters = 1
#   hours = 6.7---> liters = 3
#   hours = 11.8--> liters = 5

# You have to return 3 columns: id, hours and liters 
SELECT id, 
       hours,
       FLOOR(hours / 2) AS liters
FROM cycling

# (8-9) Even or Odd ------------------------------------------------------------
# You will be given a table, numbers, with one column number.
# Return a table with a column is_even containing "Even" or "Odd" depending on 
# number column values.

# numbers table schema
#   number INT
# output table schema
#   is_even STRING
SELECT CASE
        WHEN MOD(number, 2) = 0 THEN 'Even'
        ELSE 'Odd'
       END AS is_even
FROM numbers

 # (8-10) MakeUpperCase --------------------------------------------------------
 # Write a function which converts the input string to uppercase.
 # You are given a table 'makeuppercase' with column 's', 
 # return a table with column 's' and your result in a column named 'res'.
SELECT s,
       UPPER(s) AS res
FROM makeuppercase

# (8-11) Simple multiplication -------------------------------------------------
# This kata is about multiplying a given number by eight if it is an even number 
# and by nine otherwise.
# Write your SQL statement here: you are given a table 'multiplication' with col
# 'number', return a table with col 'number' & your result in a col named 'res'.
SELECT number,
       CASE
        WHEN mod(number, 2) = 0 THEN number * 8
        WHEN mod(number, 2) != 0 THEN number * 9
       END AS res
FROM multiplication

# (8-12) Quarter of the year ---------------------------------------------------
# Given a month as an integer from 1 to 12, return to which quarter of the year 
# it belongs as an integer number. For example: month 2 (February), is part of 
# the first quarter; month 6 (June), is part of the second quarter; and month 
# 11 (November), is part of the fourth quarter.

# You are given a table 'quarterof' with column 'month', return a table with
# column 'month' and your result in a column named 'res'.
SELECT month, 
       CASE
        WHEN month <= 3  THEN 1
        WHEN month <= 6  THEN 2
        WHEN month <= 9  THEN 3
        WHEN month <= 12 THEN 4
      END AS res
FROM quarterof