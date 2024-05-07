#!/usr/bin/python3
'''queries reddit API and returns number of subscribers'''
import requests


def number_of_subscribers(subreddit):
    '''return number of subscribers'''
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {
            "User-Agent": "ubuntu:alx.api.advance.task"
    }
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 404:
        return 0
    results = response.json().get("data")
    return results.get("subscribers")
