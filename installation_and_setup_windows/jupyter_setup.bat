@echo off
py -m pip install virtualenv
py -m virtualenv venv
CALL venv\Scripts\activate.bat
pip install jupyter
pip install psycopg2
pip install tabulate
git clone https://github.com/bgschiller/postgres_kernel
cd postgres_kernel
python setup.py build
python setup.py install
cd ..
