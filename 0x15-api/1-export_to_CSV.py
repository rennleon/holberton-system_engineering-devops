#!/usr/bin/python3
"""This module makes a request to an API
and exports the results to a csv file"""
import csv
import requests as rq
import sys

url = 'https://jsonplaceholder.typicode.com/users/{}/{}'
if __name__ == '__main__':
    _id = sys.argv[1]
    u = rq.get(url.format(_id, '')).json()
    todos = rq.get(url.format(_id, 'todos')).json()

    username = u.get('username')
    data = []
    for task in todos:
        data.append([_id, username, task.get('completed'), task.get('title')])

    filename = '{}.csv'.format(_id)
    with open(filename, 'w', encoding='utf-8') as f:
        writer = csv.writer(f, quoting=csv.QUOTE_ALL)
        writer.writerows(data)
