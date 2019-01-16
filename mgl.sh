#!/usr/bin/python
#!/bin/sh
#!/bin/bash
import sys
import os
import calendar
import time
import socket
import re,uuid
import smtplib
import getpass

print('  ==    ==     ==             ==')
print('  == \       / ==          =    ')
print('  ==  \     /  ==         =     ')
print('  ==   \   /   ==         =   ===  ')
print('  ==    \ /    ==           ===  = ')
print('  ==     |     ==                = ')


print('=================================================')

localtime = time.asctime( time.localtime(time.time()) )

print('Time IS ::',localtime,'::')

print('select options....')
print('1-show calendar')
print('2-show time')
print('3-show ip address')
print('4-show mac address')
print('5-show computer name')
print('6-find gmail from paragraph ')
print('7-send email to anyone')

i=int(input())

if i==1:
    yr=int(input('enter year'))
    mth=int(input('enter month'))
    cal = calendar.month(yr, mth)
    print("Calendar is ::")
    print(cal)
if i==2:
    localtime = time.asctime( time.localtime(time.time()))
    print('Time IS ::',localtime,'::')
if i==3:
    hostname = socket.gethostname()
    IPAddr = socket.gethostbyname(hostname)
    print("Computer IP Address is:" + IPAddr) 
if i==4:
    
    print(':'.join(re.findall('..','%012x' % uuid.getnode())))

if i==5:
    hostname = socket.gethostname()
    print("Computer Name is:" + hostname)
    
if i==6:
    s=raw_input()
    lst = re.findall('\S+@\S+', s)
    print(lst)
if i==7:
    server = 'gmail '
    user = 'smithjohn11502@gmail.com'
    passwd ='sanjZ123@'


    to = raw_input('\nTo: ')
    #subject = raw_input('Subject: ') 
    body = raw_input('Message: ')

    try:
        server = smtplib.SMTP('smtp.gmail.com:587') 
	server.starttls()
        server.login(user,passwd)
	msg=user+to+body
        server.sendmail(user,to,msg)
        server.quit()
        print ('\n Done !!!')
    except smtplib.SMTPAuthenticationError:
        print('\n[!] username or password you entered is incorrect.')
    sys.exit()

