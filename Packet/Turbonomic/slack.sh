#!/bin/bash
# 
# Slack Notifier
#
curl -X POST --data-urlencode 'payload={"channel": "#turbonomic", "username": "discohook", "text": "Deploy completed for '$VMT_ACTION_NAME'", "icon_emoji": ":bear:"}' https://hooks.slack.com/services/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