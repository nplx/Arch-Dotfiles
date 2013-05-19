#!/usr/bin/env python3
##-------------------------------------------------------
## Name:       Unread Mail Notifier
## Author:     Charles Gu
##-------------------------------------------------------

import subprocess, re, imaplib
from sys import stdout
from time import sleep
from gi.repository import Notify

_username = "YOUR USERNAME"
_password = "YOUR PASSWORD"
mail = imaplib.IMAP4_SSL("imap.gmail.com","993")
mail.login(_username,_password)
mail.list()

def _newMailChecker():
	unread_before = _read()
	while True:
		sleep(4)
		unread_after = _read()
		if unread_after > unread_before:
			Notify.init("New Mail")
			popup=Notify.Notification.new("New Mail", "You have %d new mail." %unread_after, "mail-mark-unread")
			popup.show()
			subprocess.check_output(['aplay','-q','SOUND FILE'])
			_write(unread_after)
			unread_before = unread_after
		elif unread_after <= unread_before:
			_write(unread_before)
			unread_before = unread_after
		else:
			_write("0")
			unread_before = 0

def _read():
	mail.select("inbox")
	unread = str(len(mail.search(None,"UnSeen")[1][0].split()))
	num = ''.join(re.findall('\d', unread))
	if num == '':
		return 0
	else:
		return int(num)

def _write(f):
	stdout.write("\r%s" % f)
	stdout.flush()
	_writeToFile(f)

def _writeToFile(n):
	target = open("/tmp/.new-mail-number","w")
	target.write("%s\n" % n)

if __name__ == '__main__':
	_newMailChecker()
