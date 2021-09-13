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
    tasks_completed = list(filter(lambda task: task.get('completed'), todos))
    print('Employee {} is done with tasks({}/{}):'
          .format(name, len(tasks_completed), len(todos)))
    for task in tasks_completed:
        print('\t {}'.format(task.get('title')))
