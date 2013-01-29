#!/usr/bin/env python3
##-------------------------------------------------------
## Name:       Unread Mail Notifier
## Author:     Charles Gu
##-------------------------------------------------------

import imaplib
from sys import stdout
from time import sleep
from gi.repository import Notify

_username = "your_gmail_username"
_password = "your_gmail_password"

def main():
	_newMailChecker()

def _newMailChecker():
	unread_before = _unreadMailCount()
	while True:
		sleep(1)
		unread_after = _unreadMailCount()
		if unread_after > unread_before:
			i = unread_after - unread_before
			Notify.init("New Mail")
			popup=Notify.Notification.new("New Mail", "You have received %d new mail." % i, "mail_new")
			popup.show()
			_write(unread_after)
			unread_before = unread_after
		elif unread_after == unread_before:
			_write(unread_before)
			unread_before = unread_after
		else:
			_write(unread_after)
			unread_before = unread_after

def _unreadMailCount():
	try:
		mail = imaplib.IMAP4_SSL("imap.gmail.com","993")
	except Exception as err:
		_write("n/a")
		Notify.init("Error")
		err=Notify.Notification.new("Error", "Failed to connect to mail server.", "error")
		err.show()
		return _write("n/a")
	else:
		try:
			mail.login(_username,_password)
		except Exception as login_err:
			_write("err")
			Notify.int("Error")
			login_err=Notify.Notification.new("Error", "Failed to login.", "error")
			login_err.show()
			return _write("err")
		else:
			mail.select()
			unread = len(mail.search(None,"UnSeen")[1][0].split())
			return unread

def _write(f):
	stdout.write("\r%s" % f)
	stdout.flush()
	_writeToFile(f)

def _writeToFile(n):
	target = open("/tmp/.new-mail-checker","w")
	target.write("%s\n" % n)

if __name__ == '__main__':
	main()
