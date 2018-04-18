cd ..;
pip3 install virtualenv;
virtualenv -p python3 venv;
source venv/bin/activate;
pip install -r requirements.txt;
git clone https://github.com/bgschiller/postgres_kernel;
python setup.py build;
python setup.py install;
