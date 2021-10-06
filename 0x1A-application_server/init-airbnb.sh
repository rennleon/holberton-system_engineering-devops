#!/usr/bin/env bash
# This script initializes services to expose airbnb

cd /home/ubuntu/AirBnB_clone_v2
tmux new-session -d 'gunicorn --bind 0.0.0.0:5000 web_flask.0-hello_route:app'
tmux new-session -d 'gunicorn --bind 0.0.0.0:5001 web_flask.6-number_odd_or_even:app'

cd /home/ubuntu/AirBnB_clone_v3
#export HBNB_ENV=test
#export HBNB_MYSQL_USER=hbnb_test
#export HBNB_MYSQL_PWD=hbnb_test_pwd
#export HBNB_MYSQL_HOST=localhost
#export HBNB_MYSQL_DB=hbnb_test_db
#export HBNB_TYPE_STORAGE=db
# tmux new-session -d 'gunicorn --bind 0.0.0.0:5002 api.v1.app:app'
HBNB_ENV=production HBNB_MYSQL_USER=hbnb_dev HBNB_MYSQL_PWD=hbnb_dev_pwd HBNB_MYSQL_HOST=localhost HBNB_MYSQL_DB=hbnb_dev_db HBNB_TYPE_STORAGE=db gunicorn --bind 0.0.0.0:5002 api.v1.app:app &
