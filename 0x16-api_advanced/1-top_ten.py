#!/usr/bin/python3
"""This module makes a request to reddit api"""
import requests as rq

url = 'https://www.reddit.com/r/{}/hot/.json'


def top_ten(subreddit):
    """This function fetches a reddit and returns the number of subscribers"""
    headers = {'User-Agent': 'My User Agent 1.0'}
    params = {'limit': 10}
    res = rq.get(url.format(subreddit), headers=headers, params=params)
    body = res.json().get('data', None)

    if body is None:
        print('None')
        return
    for post in body.get('children', []):
        print(post.get('data', {}).get('title', ''))
