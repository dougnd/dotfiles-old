import json
import getpass
import requests
import os
import stat

template = '''#!/bin/bash
# Forces git commits to have JIRA issues attached

commit_regex='(({0})-[0-9]+|NOSSUE)'

if ! grep -qE "$commit_regex" "$1"; then
    echo "Aborting commit.  You must include either a JIRA Issue or NOISSUE"
    exit 1
fi
'''

print "Getting jira projects..."
usr = raw_input("username: ")
pwd = getpass.getpass("password: ")

#response = requests.get("https://jira.app.clemson.edu/rest/api/2/issue/createmeta", auth=(usr,pwd))
response = requests.get("https://jira.app.clemson.edu/rest/api/2/issue/createmeta", auth=(usr,pwd)).json()

projectKeys = [p['key'] for p in response['projects']]

with open('commit-msg', 'w') as f:
    f.write(template.format('|'.join(projectKeys)))

st = os.stat('commit-msg')
os.chmod('commit-msg', st.st_mode | stat.S_IEXEC)
