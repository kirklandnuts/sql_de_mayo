
## Windows

# Setup

In order to start writing SQL code as soon as possible at the workshop, we'll configure our databases and load them with the required data.

# Installation

NOTE: Throughout this guide, `>` denotes the windows command prompt. So, when the guide instructs to enter a command as such,
```
> [COMMAND]
```
the command `[COMMAND]` should be entered into a command prompt, which is natively installed on windows.

## Contents
- [Installing PostgreSQL](#installing-postgresql)
- [Installing PostgreSQL Kernel](#installing-psql-kernel)

## Installing PostgreSQL

This section is heavily drawn from PostgrSQLTutorial's [Installing PostgreSQL walkthrough](http://www.postgresqltutorial.com/install-postgresql/).

### Creating User
For the windows download to be successful, you will need to create a new user for this example we will call it *timmy* which you will need to allow admin access to be able to download and install PostgreSQL. More information [here](https://support.microsoft.com/en-us/help/4026923/windows-create-a-local-user-or-administrator-account-in-windows-10)


Go to PostgreSQL's [installer](https://www.postgresql.org/download/windows/) page and choose the appropriate bundle depending on whether your computer is 32 or 64 bit.

<img src="img/postgres_installer.png" />

Once you have chosen the appropriate bit version download the program and once that is complete double click the .exe file (shown below).

<img src="img/postgres_exe.png" />

You should be prompted with the following window which you will use to set the appropriate options for PostgreSQL.

<img src="img/window_popup.png" />


Create a password for your user. We recommend using *postgres* as your username and password initially for troubleshooting issues. This can be changed later if needed.

PostgreSQL utilizes port 5432 so when prompted to enter port, **enter 5432**.
Choose the default locale for PostgreSQL, and you should be done with the installation process!


## Loading Data into Databases

We will load a couple data sets into our PostgreSQL server to be accessible as databases. 


### Northwind

The Northwind database contains the sales data for a fictitious company called Northwind Traders, which imports and exports specialty foods from around the world. We will be utilizing `psql`, the terminal installed with PostgreSQL. 

First use the `window` button to search *psql*, upon opening the application you should be prompted with a terminal asking for credentials. 


You can press enter since leaving the repsonses blank default to the values inside the [], which is the necessary credentials. You will need to enter your password, which is `postgres`. 

```
Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Password:

```

Once you have done so you will be logged into the PostgreSQL server and here we will create the database and load our data into it. 

You should be prompted with the following syntax on the terminal:

```
postgres=#
```


### Creating Database

Here you will utilize SQL syntax to create a database for us to populate the sample data. 


```
postgres=# CREATE DATABASE northwind;
```

You can check if you have created the database sucessfully by running:

```
postgres=# \d
```


Here you should see northwind within the list of available databases. 

### Populating database

We want to import the database from a file called a SQL dump. This has the necessary SQL operations to create the schemas available within the database including things such as the primary key. 

To do so you will need to know the path for where you cloned this repository, we will showcase this with a mock path. 


```
postgres=# \i 'C:/Users/ds_at_ucsb/sql_de_mayo/installation_and_setup/macos_and_linux/db_setup/northwind.sql';

```

Tip: If the path has `\` you can change them manually to `/` or `\\`.  

You should be prompted with messages indicating that the database has been populated. You can exit out of the `psql` terminal and begin installing the PostgreSQL kernel for jupyter.

## Installing PostgreSQL Kernel
We've compiled the commands needed to run `PostgreSQL` within a `jupyter notebook`. This step requires that PostgreSQL be installed from the previous step.

1. Clone this repository (copy its contents onto your machine) by running the following command in your terminal:
```
> git clone https://github.com/timothydnguyen/sql_de_mayo
```
2. Navigate within the cloned repository to the directory containing the installation script using the following command:
```
> cd sql_de_mayo/installation_and_setup/windows
```
3. Execute the script with the following command:
```
> jupyter_setup.bat
```

4. You can utilize by entering the following commands to open a jupyter notebook inside your virtualenv.

```
> jupyter notebook
```
Upon entering this you should be able to create both python and PostgreSQL kernels!


# ------- STOP HERE (DEPRECATED) --------


## Running pgAdmin4

At this point, PostgreSQL should be running on your compuyrt but we still need a way to easily work with it, [pgAdmin4](https://www.pgadmin.org/) provides a graphical user interface (GUI) to do just that. Luckily for windows the installer comes bundled with pgAdmin4 so use the `window` button to search for pgAdmin. Once opened you should be prompted with:


<img src="img/pgAdmin_launch.png" />

Next we need to add the server to pgAdmin4,

1. From the pgAdmin dashboard, click `Add New Server`, and you should see a window pop up.
2. In the popup window, you should be in the `General` tab. Here, you can enter any name for your server into the name field, but let's go with `sql_de_mayo` for simplicity's sake.
3. At the top of the popup window, click `Connection` to switch to that tab. Here, enter `localhost` into the `Host name/address` field. Additionally, in the `Username` field, replace `postgres` with the username you utilized to download PostgreSQL. Before clicking `save`, your window should look as follows (with your username in place of `timmy`):

<img src="img/connection_parameters.png" />


Once this is done you should have pgAdmin connected to your local server!