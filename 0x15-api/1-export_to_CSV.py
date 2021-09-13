#!/usr/bin/python3
"""This module makes a request to an API
and exports the results to a csv file"""
import csv
from sys import argv
import requests as rq

url = 'https://jsonplaceholder.typicode.com/users/{}/{}'
if __name__ == '__main__':
    _id = argv[1]
    u = rq.get(url.format(_id, '')).json()
    todos = rq.get(url.format(_id, 'todos')).json()

    data = []
    for task in todos:
        data.append([u['id'], u['username'], task['completed'], task['title']])

    filename = '{}.csv'.format(u['id'])
    with open(filename, 'w', encoding='utf-8') as f:
        writer = csv.writer(f, quoting=csv.QUOTE_ALL)
        writer.writerows(data)
