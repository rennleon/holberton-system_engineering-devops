#!/usr/bin/python3
"""This module makes a request to an API
and exports the results to a json file"""
import json
import requests as rq

url = 'https://jsonplaceholder.typicode.com/{}'
if __name__ == '__main__':
    users = rq.get(url.format('users')).json()

    data = dict()
    for u in users:
        _id = u.get('id')
        data[_id] = []
        uri = 'users/{}/todos'.format(_id)
        for t in rq.get(url.format(uri)).json():
            task = {'task': t.get('title'),
                    'username': u.get('username'),
                    'completed': t.get('completed')}
            data[_id].append(task)

    filename = 'todo_all_employees.json'
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(data, f)
