#!/usr/bin/env python

import imaplib
gm = imaplib.IMAP4_SSL("imap.gmail.com","993")
gm.login("gmail username","application-specific password")
gm.select()
gm.search(None,"UnSeen")
unRead = len(gm.search(None,"UnSeen")[1][0].split())
print(unRead)
