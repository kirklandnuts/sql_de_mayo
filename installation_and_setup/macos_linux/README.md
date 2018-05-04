# Installation

NOTE: Throughout this guide, `$` denotes the linux shell prompt. So, when the guide instructs to enter a command as such,
```
$ [COMMAND]
```
the command `[COMMAND]` should be entered into a linux shell, which can be accessed through a program such as `Terminal` (preinstalled on MacOS).

ALSO, at various points throughout this process, you will be prompted to enter password. In these cases, your input won't be displayed on screen for security purposes, so don't worry when you don't see what you're typing. Simply type what you intend, and hit enter.

## Contents
- [Installing PostgreSQL](#installing-postgresql)
- [Loading Data into Databases](#loading-data-into-databases)
- [Configuring Jupyter Notebook to run PostgreSQL](#configuring-jupyter-notebook-to-run-postgresql)

## Installing PostgreSQL
We've compiled the commands needed to install PostgreSQL into a single shell script. The program is installed through a popular package manager called Homebrew. Please follow these instructions to run the installation script:

1. Clone this repository (copy its contents onto your machine) by running the following command in your terminal:
```
$ git clone https://github.com/timothydnguyen/sql_de_mayo
```
2. Navigate within the cloned repository to the directory containing the installation script using the following command:
```
$ cd sql_de_mayo/installation_and_setup/macos_linux
```
3. Execute the script with the following command:
```
$ ./install_psql.sh
```
Note that you will be asked to enter a password; this is the password to your user account on your computer. If you are asked to install "XCode Command Line Tools", press the `return` key. This command may take a while to complete.

4. Check that you have installed PostgreSQL properly by checking the version number with the following command:
```
$ postgres -V
```
You should see the following output:
```
$ postgres -V
postgres (PostgreSQL) 10.3
```

Congrats! You've successfully installed PostgreSQL and started a server for it on your Mac!

At any point, if you wish to kill the server, enter the following command into your terminal:
```
$ pg_ctl stop -D /usr/local/var/postgres
```


## Loading Data into Databases
We will load a couple data sets into our PostgreSQL server to be accessible as databases.

### Northwind
The Northwind database contains the sales data for a fictitious company called Northwind Traders, which imports and exports specialty foods from around the world. We will be using [code written by Github user *pthom*](https://github.com/pthom/northwind_psql.git) to quickly set up this database. Follow these instructions to run the code.

1. In your terminal, navigate within the previously cloned repository (`sql_de_mayo`) to the directory containing the northwind database setup script. Assuming you haven't touched your terminal since the last set of terminal instructions, the command to do so should be as follows:
```
$ cd db_setup
```
2. From here, simply run the script to instantiate the Northwind database with the following command:
```
$ ./create_db.sh
```

## Configuring Jupyter Notebook to run PostgreSQL
We'll be using [Jupyter Notebooks](http://jupyter.org/) to write our SQL queries. Once set up, Jupyter notebooks are very interactive and easy to use, making them a good choice for learning. Notebooks typically set up to work with Python code, but we've written a script to configure them to run on a [PostgreSQL kernel](https://github.com/bgschiller/postgres_kernel).
1. Navigate to the `macos_linux` folder which contains the next script we need to run. If you haven't done anything since the last set of instructions, the command to do so should look like this:
```
$ cd ..
```
2. Then, run the jupyter setup script with the following command:
```
$ ./jupyter_setup.sh
```

## Starting Your Jupyter Notebook


1. First, activate your virtual environment by navigating to the `sql_de_mayo` folder from your terminal and typing `source venv/bin/activate`. If you haven't done anything since the last set of instructions, your commands should look like this:
```
$ cd ../..
$ source venv/bin/activate
```
2. launch jupyter notebook with the following command:
```
$ jupyter notebook
```
You should see a browser window open up displaying the Jupyter Notebook dashboard. From here, navigate to whichever notebook (identified by the `.ipynb` file extension) you want to launch and click on it to start it. We suggest starting with `beginner_notebook.ipynb` which is located in the `beginner` folder.


That's it - you should be all set up. Congratulations, you're ready to begin!
