/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" # get homebrew (package manager)
brew upgrade # upgrade homebrew
brew install postgresql # install postgresql thru homebrew
pg_ctl -D /usr/local/var/postgres start # start server
brew services start postgresql # have the postgresql server start at computer startup
