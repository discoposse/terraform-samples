#!/bin/bash
# 
# Slack Notifier
#
curl -X POST --data-urlencode 'payload={"channel": "#turbonomic", "username": "discohook", "text": "Deploy completed for '$VMT_ACTION_NAME'", "icon_emoji": ":bear:"}' https://hooks.slack.com/services/YOURWEBHOOKURL
