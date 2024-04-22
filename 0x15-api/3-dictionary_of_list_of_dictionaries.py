#!/usr/bin/python3
"""displays an API response"""

import json
import requests

if __name__ == "__main__":
    user_url = 'https://jsonplaceholder.typicode.com/users'
    todo_url = 'https://jsonplaceholder.typicode.com/todos'

    users = requests.get(user_url).json()
    string = {u.get("id"): [{
                 "task": t.get('title'),
                 "completed": t.get('completed'),
                 "username": u.get('username')
             } for t in requests.get(todo_url,
                                     {"userId": u.get('id')}).json()]
             for u in users}

    with open("todo_all_employees.json", "w") as f:
        json.dump(string, f)
