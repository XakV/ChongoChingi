#!/usr/bin/env python2

import sys
import json
import requests

URL = 'https://habitica.com/api/v3'
API_USER = 'ab1b048a-39ab-4318-b136-0601526658e2'
API_KEY = '18f6f4e4-794a-4fc4-ace2-5df25c35fcb1'

headers = {
		'Content-Type' : 'application/json',
		'x-api-user' : API_USER,
		'x-api-key' : API_KEY
	}

def main():
	jsonTask = json.loads(sys.stdin.readline())

	id = pushTask(jsonTask)
	if not id == "":
		jsonTask["id_habitica"] = id
		print "Task added on Habitica"
	else:
		print "Task was not added on Habitica"

	print(json.dumps(jsonTask))

def pushTask( jsonTask ):
        if not jsonTask["type"] == "":
            values = {
		"type" : jsonTask["type"],
		"text" : jsonTask["description"],
		"notes" : "Created from Taskwarrior"
		}
        else:
            values = {
		"type" : "todo",
		"text" : jsonTask["description"],
		"notes" : "Created from Taskwarrior"
		}

	priorityMap = {
		"trivial": .1,
		"easy": 1,
		"medium": 1.5,
		"hard": 2
	}

	if 'due' in jsonTask:
		values["date"] = jsonTask["due"]

	if 'difficulty' in jsonTask and jsonTask["difficulty"] in priorityMap:
		values["difficulty"] = priorityMap[jsonTask["difficulty"]]

	try:
		req = requests.post(URL + '/tasks/user', data=json.dumps(values), headers=headers, timeout=30)
		jsonHabiticaTask = json.loads(req.text)
		value = '';
	except requests.ConnectTimeout:
		print "Timeout while communicating with Habitica server!"
	except requests.ConnectionError:
		print "Connection error while communicating with Habitica server!"

	try:
		vError = jsonHabiticaTask["err"]
		print "Error while pushing task to Habitica : " + vError
	except:
		try:
			value = jsonHabiticaTask["data"]["id"]
		except:
			value = ""

	return value

try:
	main()
except:
	print "Error! Unable to add task to Habitica"
sys.exit(0)
