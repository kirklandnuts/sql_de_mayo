cd ../..;
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

brew install python3;
pip3 install --upgrade pip;
pip3 install virtualenv;
virtualenv -p /usr/local/Cellar/python/3.6.5/bin/python3 venv;
source venv/bin/activate;
pip install jupyter;
pip install psycopg2;
pip install tabulate;
git clone https://github.com/bgschiller/postgres_kernel;
cd postgres_kernel;
python setup.py build;
python setup.py install;
