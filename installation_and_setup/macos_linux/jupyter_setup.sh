cd ../..;
pip3 install virtualenv;
virtualenv -p python3 venv;
source venv/bin/activate;
pip install jupyter;
# pip install -r requirements.txt; WILL UPLOAD LATER- psycopg2 and tabulate should be the only dependencies for postgres_kernel, but check pip logging if having errors to check for additional dependencies that i'm missing
pip install psycopg2;
pip install tabulate;
git clone https://github.com/bgschiller/postgres_kernel;
cd postgres_kernel;
python setup.py build;
python setup.py install;
