#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
import json
import time
import random
import requests
from LevPasha.InstagramAPI import InstagramAPI
from igramscraper.instagram import Instagram
from saveLog import my


### Delay in seconds ###
min_delay = 60
max_delay = 540
MAX = 75

print('Initiating')

# define login credentials using POST data payload
if len(sys.argv) > 1:
	usr = sys.argv[1]
	pwd = sys.argv[2]
	postId = sys.argv[3]

# define class
instagram = Instagram()

my.log('Signing in..')

# generate user instances of both classes
api = InstagramAPI(usr, pwd)
instagram.with_credentials(usr, pwd)

# authentication - login
instagram.login()
time.sleep(12)
api.login()
time.sleep(6)

my.log('Getting likes..')

# get likes
likes = instagram.get_media_likes_by_code(postId, MAX)
time.sleep(8)

# print the resulting amount
my.log("Result count: " + str(len(likes['accounts'])))
my.log('Starting follow sequence..')

# print the user id for the accounts
tot = 0

for like in likes['accounts']:
	usrId = like.identifier
	usrname = like.username
	api.follow(usrId)
	tot += 1
	my.log("Following "+str(usrname)+" ID: "+str(usrId) + "\n")
	my.log("Followed user "+str(usrname) + "\n")
	if(tot>=MAX):
		break
	time.sleep(float( random.uniform(min_delay*10,max_delay*10) / 10 ))

msg = "Total: "+str(tot)+" users followed from list. (Max val: "+str(MAX)+")\n"

my.log(msg)

exit()
