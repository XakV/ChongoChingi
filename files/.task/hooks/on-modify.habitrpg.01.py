#!/usr/bin/env python2

import sys
import json
import requests
import copy

URL = 'https://habitica.com/api/v3'
API_USER = 'ab1b048a-39ab-4318-b136-0601526658e2'
API_KEY = '18f6f4e4-794a-4fc4-ace2-5df25c35fcb1'

headers = {
		'Content-Type' : 'application/json',
		'x-api-user' : API_USER,
		'x-api-key' : API_KEY
	}

def main():
	jsonTaskOriginal = json.loads(sys.stdin.readline())
	jsonTask = json.loads(sys.stdin.readline())

	if 'id_habitica' not in jsonTask or not jsonTask["status"] == "completed":
		print json.dumps(jsonTask)
		print "No task updated on Habitica"
		return

	jsonOutput = copy.deepcopy(jsonTask)

	if pushTask(jsonOutput):
		print "Task completed on Habitica"
                try:
                        spellResult = pushSpell(jsonOutput)
                        if spellResult == 1:
                            print "Fireball!"
                        else:
                            print "Fizzle"
                except:
                        print "You may not call upon the gods."
	else:
		print "Task was not completed on Habitica"

	print json.dumps(jsonTask)

def pushTask( jsonOutput ):
	try:
		req = requests.post(URL + '/tasks/' + jsonOutput["id_habitica"] + '/score/up', headers=headers, timeout=10)
		jsonHabiticaTask = json.loads(req.text)
		return 1
	except requests.ConnectTimeout:
		print "Timeout while communicating with Habitica server!"
		return 0
	except requests.ConnectionError:
		print "Connection error while communicating with Habitica server!"
		return 0

def pushSpell( jsonOutput ):
	try:
            req = requests.post(URL + '/user/class/cast/fireball' + jsonOutput["id_habitica"], headers=headers, timeout=10)
            jsonHabiticaTask = json.loads(req.text)
            return 1
	except requests.ConnectTimeout:
            print "Timeout while communicating with Habitica server!"
            return 0
	except requests.ConnectionError:
            print "Connection error while communicating with Habitica server!"
            return 0

main()
sys.exit(0)
