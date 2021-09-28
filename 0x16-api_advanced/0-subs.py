#!/usr/bin/python3
"""This module makes a request to reddit api"""
import requests as rq

url = 'https://www.reddit.com/r/{}/about.json'


def number_of_subscribers(subreddit):
    """This function fetches a reddit and returns the number of subscribers"""
    headers = {'User-Agent': 'My User Agent 1.0'}
    res = rq.get(url.format(subreddit), headers=headers)
    body = res.json().get('data', {})
    return body.get('subscribers', 0)
