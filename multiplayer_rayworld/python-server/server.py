# -*- coding: utf-8 -*-
import select, socket
#from collections import deque

# Config 
RECV_BUF_SIZE = 4096
HOST_IP = '0.0.0.0'
PORT = 5556

# Initialize Server
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#server.setblocking(0)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server.bind((HOST_IP, PORT))
server.listen(5)
inputs = [server]
outputs = []
#message_queues = {}

# broadcast data
def broadcast_data (message, cur_sock = None): # including me
    exclusion = [server]
    if cur_sock: exclusion.append(cur_sock) 

    for conn in filter(lambda x: x not in exclusion, inputs):
        try :
            conn.send(message)
        except :
            # broken socket connection may be, chat client pressed ctrl+c for example
            print('failed to send!')
            conn.close()
            if conn in inputs:
                inputs.remove(conn)

while inputs:
    readable, _, _ = select.select(inputs, [], [])
    for s in readable:
        if s is server:
            connection, client_address = s.accept()
            connection.setblocking(0)
            inputs.append(connection)
            #message_queues[connection] = deque()
            print("New connection - ", client_address)
        else:
            data = s.recv(RECV_BUF_SIZE)
            if data:
                broadcast_data(data)
                #message_queues[s].append(data)
            else:
                print('Connection is closed')
                if s in inputs: 
                    inputs.remove(s)
                s.close()
                #del message_queues[s]
