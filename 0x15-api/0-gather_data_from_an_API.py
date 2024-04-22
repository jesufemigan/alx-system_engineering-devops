#!/usr/bin/python3
"""displays an API response"""

import requests
import sys

if __name__ == "__main__":
    employee_id = sys.argv[1]
    user_url = 'https://jsonplaceholder.typicode.com/users'
    todo_url = 'https://jsonplaceholder.typicode.com/todos'

    employee_data = requests.get(user_url, {'id': employee_id})
    todo_data = requests.get(todo_url, {'userId': employee_id})
    completed_todo = requests.get(todo_url, {'userId': employee_id,
                                  'completed': 'true'})
    employee_name = employee_data.json()[0].get('name')
    done_todos = len(completed_todo.json())
    total_todo = len(todo_data.json())

    print(f'Employee {employee_name} is done with\
    tasks({done_todos}/{total_todo}):')
    for todo in completed_todo.json():
        print(f"\t {todo['title']}")
