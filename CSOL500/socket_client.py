import socket               # Import socket module

server = socket.socket()         # Create a socket object
host = input('Please enter server IP: ')  # Server IP
port = int(input('Please enter port: '))  # Server port

server.connect((host, port))
message = ''

reply = server.recv(2048)
print(bytes(reply).decode(encoding='utf-8'))

while message != 'quit':
    message = input('Enter your command: ')
    server.send(bytes(message, encoding='utf8'))
    reply = server.recv(2048)
    print(bytes(reply).decode(encoding='utf-8'))


server.close()
