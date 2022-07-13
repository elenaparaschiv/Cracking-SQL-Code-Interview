# Cracking the SQL Code Interview 

## Description of repo 
In this project we are solving SQL Interview Questions from FAANG companies, such as Google, Facebook, Airbnb, Amazon etc.

The questions are sourced from https://www.stratascratch.com/ and have my own solution to the problems


## Structure
At each level {company_name}_{interview_question}_{id} is referenced
The source files are in the csv folder and the solution is in solution.sql


## Concepts covered
We are going to learn about SQL concepts below. 
In example we will reference to a certain interview question for further practice.
This can be found in the project structure through the id which is appended to each interview question folder

### WINDOW FUNCTIONS


=====

### WINDOW FUNCTIONS
Definition: https://www.youtube.com/watch?v=mZwKALGyVr0&t=139s <br>
Examples: 10302,10313

## RANK VS DENSE_RANK()

RANK AND DENSE RANK() both rank rows in a table. The difference is that while rank will assign the same rank if there are ties on the value that is ranking by and will skip ranks that are missing, DENSE_RANK will always rank in chronological order.

I.e. 514,2008,2060(rank

## FILTER
Examples

https://modern-sql.com/feature/filter
SUM(<expression>) FILTER(WHERE <condition>)

Filter inside an aggregate ( I.e. 2047, 2044, 2048)

## CASE 

Example: 2044 ( it also has case inside aggregate) ,
2047

## JOINS
	INNER JOIN
	I.e. 2105

The INNER JOIN keyword selects records that have matching values in both tables.

	LEFT JOIN

The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2). The result is 0 records from the right side, if there is no match.

I.e. I.e. 514	

## UNION ALL 

I.e. 2008

## INTERSECT
I.e. 9816


## WHERE IN and WHERE NOT IN 
I.e. 2060 , 9608


## HAVING
I.e. 2047

## COALESCE

I.e. : 2042,2096

## TO_CHAR
I.e. 2096, 10302

## STRING_TO_ARRAY()
I.e. 9794

## UNNEST()
I.e. 9794

## PIVOT
	I.e. 2047 : PIVOT FROM CASE WHEN VALUE

## LAG
	I.e. 2045

## OFFSET

## DATEDIFF

## EXTRACT(MONTH/DAY/YEAR from DATE)
	I.e. 2047, 2076


## LTRIM








