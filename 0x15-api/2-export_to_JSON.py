#!/usr/bin/python3
"""displays an API response"""

import json
import requests
import sys

if __name__ == "__main__":
    employee_id = sys.argv[1]
    user_url = 'https://jsonplaceholder.typicode.com/users'
    todo_url = 'https://jsonplaceholder.typicode.com/todos'

    employee_data = requests.get(user_url, {'id': employee_id})
    todo_data = requests.get(todo_url, {'userId': employee_id})
    employee_name = employee_data.json()[0].get('username')
    string = {f"{employee_id}": [{"task": t.get('title'), "completed":
              t.get('completed'), "username": employee_name}
            for t in todo_data.json()]}

    with open(f"{employee_id}.json", "w") as f:
        json.dump(string, f)
