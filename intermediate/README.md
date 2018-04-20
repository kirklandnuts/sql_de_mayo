# Working with Joins

In this section, we introduce SQL joins. SQL joins are used to combine multiple tables in a relational database.

Suppose we have a database for all the companies in Santa Barbara. We have two different tables: companies and positions. The names table contains the columns company_name, and employee_id, a unique number assigned to each employee. The employee table contains the columns employee_id, name, and the position.

Note that there are some missing rows from both tables - Appfolio's' employee information is missing from the Positions table, and a row with employee_id hc_18 is missing from the Companies table.

#### Companies
Company_Name | Employee_Id |
--- | --- |
Carpe Data | tn_19 |
Invoca | rw_20 |
Impact Radius | lm_20 |
Appfolio | jr_21 |
HG Data | dr_16 |

#### Positions
Employee_Id | Name | Position |
--- | --- | --- |
tn_19 | Timmy | Data Scientist Intern
rw_20 | Richa | Software Engineer |
hc_18 | Holly | Financial Analyst
dr_16 | Daniel | Actuarial Analyst
lm_20 | Leslie | Consultant

To compute the company of Daniel the Actuarial Analyst, we have to use information in both tables. We can join the tables on the employee_id column, creating a new table with both company name and position. In this section we'll work together to explore all the different joins that exist in SQL.

Open up the intermediate notebook by typing into your terminal:

```
$ jupyter notebook intermediate\intermediate_notebook.ipynb
```
