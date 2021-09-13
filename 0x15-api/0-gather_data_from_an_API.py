#!/usr/bin/python3
"""This module makes a request to an api and displays the results to stdout"""
import requests as rq
import sys

url = 'https://jsonplaceholder.typicode.com/users/{}/{}'
if __name__ == '__main__':
    _id = sys.argv[1]
    user = rq.get(url.format(_id, '')).json()
    todos = rq.get(url.format(_id, 'todos')).json()

    name = user.get('name')
    tasks_completed = len(
        list(filter(lambda task: task.get('completed'), todos)))
    tasks_all = len(todos)
    print('Employee {} is done with tasks({}/{}):'
          .format(name, tasks_completed, tasks_all))
    for task in todos:
        print('\t {}'.format(task.get('title')))
