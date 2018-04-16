# Introduction to SQL

## Contents
- [Background](## Background)
- [Databases and Tables](## Databases and Tables)
    - [Tables](### Tables)
    - [Databases](### Databases)
        - [Relational Databases](#### Relational Databases)
- [Sources](## Sources)

## Background
**SQL** stands for *Structured Query Language* and is a standard language for storing, manipulating, and retrieving data in databases. [SQL comes in a variety of flavors](https://stackoverflow.com/questions/1326318/difference-between-different-types-of-sql), and for this workshop, we will be working with [PostgreSQL](https://www.postgresql.org/) due to its popularity in industry and open source nature.


## Databases and Tables
A *database* is a collection of data, where the data is typically stored across a number of *tables*. To understand databases, we first need to understand tables and their properties.

### Tables
In a *table*, each row denotes a record or observation of data, and each column denotes a variable or attribute of the data. For example, suppose we have a table containing data about a number of Data Science at UCSB officers.

name | major | favorite food
--- | --- | ---
Samantha | Statistics |
Arthur | Computer Science | hamburgers
Jonny | Communication | lobster rolls

We can see that each non-header row contains data pertaining to a single student. Moreover, for each student, we have three attributes separated by the three columns: `name`, `major`, and `favorite food`.

The takeaway here is that for any data to be considered as tabular data,
1. each row must represent an instance of a particular class such that from one row to the next, the class remains the same
    - in the case of data collected from an experiment, each row can represent a single trial
2. each column must represent an attribute or facet of the data
    - revisiting our example of data collected from an experiment, each column would represent a characteristic for a trial (e.g., trial conductor, location of trial, time trial was ran, whether or not the trial succeeded)

### Databases
With an understanding of tables and their properties, one can think of a database as a collection of named tables, each of which contains data that is related to the data in other tables.

For example, suppose that we are a university where students take two courses per quarter, and we store enrollment data in a database. Our database might consist of the following tables:

`course_enrollment`

student name | major | year | courseID | professor | location | time_of_enrollment | grading_option
--- | --- | --- | --- | --- | --- | --- | ---
Samantha | Statistics | 4 | PSTAT 101 | T. Bayes | PSYCH 1924 | 2018-04-15T22:42:03+00:01 | letter grade
Arthur | Computer Science | 3 | CS 101 | A. Lovelace | HFH 1901 | 2018-04-12T22:42:10+23:32 | p/np
Jonny | Communication | 3 | COMM 101 | M. King Jr. | CAMPBHALL | 2018-04-13T22:42:07+23:43 | p/np
Samantha | Statistics | 4 | WRIT 101 | E. Hemingway | HSSB 2322 | 2018-04-15T22:42:03+05:23 | p/np
Arthur | Computer Science | 3 | WRIT 101 | E. Hemingway | HSSB 2322 | 2018-04-12T22:42:10+26:26 | letter grade
Jonny | Communication | 3 | WRIT 101 | E. Hemingway | HSSB 2322 | 2018-04-13T22:42:08+23:59 | letter grade

`courses`

courseID | course_name | professor | location | days
--- | --- | --- | --- | ---
WRIT 101 | Writing Internationally Bestselling Novels | E. Hemingway | HSSB 2322 | M W F
CS 101 | Solving NP-complete Problems in P Time | A. Lovelace | HFH 1901 | T R
COMM 101 | Public Speaking on a National Stage | M. King Jr. | CAMPBHALL | M W
PSTAT 101 | Literally Predicting the Future | T. Bayes | PSYCH 1924 | M W F

In this example, the tables `course_enrollment`, and `courses` indeed constitute a database in the sense that our data is distributed across a series of tables; however, due to the way it's structured, it doesn't fully exhibit the benefits offered by storing data in numerous tables. A specific type of database that *does* exhibit these benefits is the *relational database*.

#### Relational Databases
A *relational database* is a database which is organized based on the principals of the [relational model](https://en.wikipedia.org/wiki/Relational_model). This paradigm has found great success in practice, as most databases are structured relationally. To understand what relational database are and the benefits they provide, we will begin with a critique of the database presented in the previous section.

A weakness of the database is redundancy; there are multiple cases where data is unnecessarily repeated. In the table `course_enrollment`, each student's name, major, and year are stored twice because they each enrolled in two courses. Furthermore, in the same table, data about the course `WRIT 101`'s location and professor occurs multiple times. Not only is data repeated within the table `course_enrollment`, but also across different tables. Data regarding each course's professor and location is stored in both tables. Redundancy in databases is considered a weakness because it results in wasted storage space. Why store any more data than you need to? Additionally, if data occurs in multiple locations, any updates to that data will have to be made in all locations. For example, if the location for course `WRIT 101` were to change to `SSMS 1303`, we would have to update our data on four occasions (three times in `course_enrollment` and once in `courses`).

**Relational databases aim to store data in a way that minimizes wasted storage while maintaining ease of access of that data.** It helps to adopt the terminology associated with relational databases, some of which we've already encountered. In dealing with relational databases, rows of a table are referred to as *records* or *tuples* and columns as *attributes* or *fields*. Additionally, tables are called *relations*, as a table communicates the relationships between each record and attribute.

![](img/reldb_term1.png)

In order to eliminate redundancy, each relation (table) in a relational database represents a single "entity type". Each relation can be linked to each other through the use of  In our case, the table `course_enrollment` should represent instances of course enrollment and the table `courses` should represent courses).

`course_enrollment`

studentID | courseID | time_of_enrollment | grading_option
--- | --- | --- | ---
1001 | PSTAT 101 | 2018-04-15T22:42:03+00:01 | letter grade
1002 | CS 101 | 2018-04-12T22:42:10+23:32 | p/np
1003 | COMM 101 | 2018-04-13T22:42:07+23:43 | p/np
1001 | WRIT 101 | 2018-04-15T22:42:03+05:23 | p/np
1002 | WRIT 101 | 2018-04-12T22:42:10+26:26 | letter grade
1003 | WRIT 101 | 2018-04-13T22:42:08+23:59 | letter grade

`courses`

courseID | course_name | professor | location | days
--- | --- | --- | --- | ---
WRIT 101 | Writing Internationally Bestselling Novels | E. Hemingway | HSSB 2322 | M W F
CS 101 | Solving NP-complete Problems in P Time | A. Lovelace | HFH 1901 | T R
COMM 101 | Public Speaking on a National Stage | M. King Jr. | CAMPBHALL | M W
PSTAT 101 | Literally Predicting the Future | T. Bayes | PSYCH 1924 | M W F

`students`

studentID | name | major | year
--- | --- | --- | ---
1001 | Samantha | Statistics | 4
1002 | Arthur | Computer Science | 3
1003 | Jonny | Communication | 3


## Sources
This curriculum has drawn heavily the following online resources:
- [w3schools' SQL tutorial](https://www.w3schools.com/sql/)
- [Wikipedia: Relational database](https://en.wikipedia.org/wiki/Relational_database)
