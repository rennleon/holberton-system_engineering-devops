#!/usr/bin/python3
"""This module makes a request to reddit api"""
import requests as rq

url = 'https://www.reddit.com/r/{}/hot/.json'


def recurse(subreddit, hot_list=[], params={}):
    """This function fetches a reddit and returns a list with post
    titles for a reddit account"""
    headers = {'User-Agent': 'My User Agent 1.0'}

    res = rq.get(url.format(subreddit), headers=headers, params=params,
                 allow_redirects=False)

    if res.status_code != 200:
        return None

    try:
        body = res.json().get('data', None)
        if body is None:
            return None
    except ValueError:
        return None

    updated_params = {
        'after': body.get('after', ''),
        'count': body.get('dist', 0),
        'limit': 100
    }

    for post in body.get('children', []):
        hot_list.append(post.get('data', {}).get('title', ''))

    recurse(subreddit, hot_list, params=updated_params)
