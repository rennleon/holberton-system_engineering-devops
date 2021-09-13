#!/usr/bin/python3
"""This module makes a request to an API
and exports the results to a json file"""
import json
from sys import argv
import requests as rq

url = 'https://jsonplaceholder.typicode.com/users/{}/{}'
if __name__ == '__main__':
    _id = argv[1]
    u = rq.get(url.format(_id, '')).json()
    todos = rq.get(url.format(_id, 'todos')).json()

    user = {u['id']: []}
    for t in todos:
        task = {'task': t['title'],
                'completed': t['completed'],
                'username': u['username']}
        user[u['id']].append(task)

    filename = '{}.json'.format(u['id'])
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(user, f)
