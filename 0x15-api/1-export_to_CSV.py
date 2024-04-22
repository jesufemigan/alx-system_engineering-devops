#!/usr/bin/python3
"""displays an API response"""

import csv
import requests
import sys

if __name__ == "__main__":
    employee_id = sys.argv[1]
    user_url = 'https://jsonplaceholder.typicode.com/users'
    todo_url = 'https://jsonplaceholder.typicode.com/todos'

    employee_data = requests.get(user_url, {'id': employee_id})
    todo_data = requests.get(todo_url, {'userId': employee_id})
    employee_name = employee_data.json()[0].get('name')

    with open(f'{employee_id}.csv', 'w', newline="") as f:
        writer = csv.writer(f, quoting=csv.QUOTE_ALL)
        [writer.writerow(
            [employee_id, employee_name, t.get('completed'), t.get('title')]
         ) for t in todo_data.json()]
