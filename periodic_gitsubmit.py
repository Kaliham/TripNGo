from subprocess import call
from time import sleep
import datetime

count = 1
while True:
    call(['git','add','.'])
    call(['git','commit','-m','"periodic commit no. ' + str(count) + '"'])
    call(['git', 'push'])
    print('push number : '+str(count))
    print('Done!')
    count+=1
    sleep(60*60)

