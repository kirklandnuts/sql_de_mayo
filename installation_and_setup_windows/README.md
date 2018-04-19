
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

Installing PostgreSQL utilizing their available [installer](https://www.postgresql.org/download/windows/). With this installer, the PostgreSQL server and pgAdmin will be bundled to deliver a straightforward process for windows. More will be outlined later.  

## Installing PostgreSQL Kernel
We've compiled the commands needed to run `PostgreSQL` within a `jupyter notebook`. This step requires that PostgreSQL be installed from the previous step.

1. Clone this repository (copy its contents onto your machine) by running the following command in your terminal:
```
> git clone https://github.com/timothydnguyen/sql_de_mayo
```
2. Navigate within the cloned repository to the directory containing the installation script using the following command:
```
> cd sql_de_mayo/installation_and_setup_windows
```
3. Execute the script with the following command:
```
> install_psql.bat
```

4. You can utilize by entering the following commands to open a jupyter notebook inside your virtualenv.

```
> jupyter notebook
```
Upon entering this you should be able to create both python and PostgreSQL kernels!
