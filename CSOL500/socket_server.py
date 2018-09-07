import socket
import datetime
from threading import Thread
from socketserver import ThreadingMixIn

class ClientThread(Thread):

    def __init__(self, ip, tport):
        Thread.__init__(self)
        self.ip = ip
        self.port = tport
        logtime = datetime.datetime.now()
        print('Client %s:%s connected at %s' % (ip, port, logtime.strftime("%m-%d-%Y %H:%M:%S")))

    def run(self):
        client.send('Connected not much you can do yet! Type quit to quit'.encode(encoding='utf8'))
        while True:
            data = client.recv(2048)
            command = bytes(data).decode(encoding='utf-8')
            if command == 'quit':
                client.send('Bye!'.encode(encoding='utf8'))
                break
            client.send('Unknown command'.encode(encoding='utf8'))


mytcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  # Create a socket object

defaulthost = socket.gethostname()  #Get the ip set to the hostname

# Request the user to set the host to bind to
requesthost = input('Please type IP for server or press enter for default(%s):' % (defaulthost))

# Set the requested host
if requesthost == "":
    host = defaulthost
    print('The server will bind to', socket.gethostbyname(host))
else:
    host = requesthost
    print('The server will bind to', host)

# Request user to select a port
port = input('Enter listen port: ')

mytcp.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
mytcp.bind((host, int(port)))  # Bind to the port
logtime = datetime.datetime.now()
print('Server started on %s:%d at %s' % (socket.gethostbyname(host), int(port),
                                         logtime.strftime("%m-%d-%Y %H:%M:%S")))

threads = []


while True:
    mytcp.listen(5)  # Allow up to 5 connections
    client, address = mytcp.accept()  # Establish connection with client.
    newthread = ClientThread(host, port)
    newthread.start()
    threads.append(newthread)

for t in threads:
    t.join()

