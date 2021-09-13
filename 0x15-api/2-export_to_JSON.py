#!/usr/bin/python3
"""This module makes a request to an API
and exports the results to a json file"""
import json
import requests as rq
import sys

url = 'https://jsonplaceholder.typicode.com/users/{}/{}'
if __name__ == '__main__':
    _id = sys.argv[1]
    u = rq.get(url.format(_id, '')).json()
    todos = rq.get(url.format(_id, 'todos')).json()

    user = {_id: []}
    for t in todos:
        task = {'task': t.get('title'),
                'completed': t.get('completed'),
                'username': u.get('username')}
        user[_id].append(task)

    filename = '{}.json'.format(u['id'])
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(user, f)
