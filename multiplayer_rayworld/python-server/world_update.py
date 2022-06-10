# -*- coding: utf-8 -*-
import rayworld_pb2

class WorldUpdate:
    pass 

def protobuf_test():
    import random
    from time import time
    from google.protobuf.json_format import MessageToJson

    now_milliseconds = lambda: int(time() * 1000)

    print("protobuf test")

    world_state = rayworld_pb2.WorldState()
    print("Time in milliseconds since epoch", now_milliseconds())

    p1 = world_state.players.add()
    p1.tick = now_milliseconds()
    p1.name = "John"
    p1.id = random.randint(0, 10000)

    p2 = world_state.players.add()
    p2.tick = now_milliseconds()
    p2.name = "Terry"
    p2.id = random.randint(0, 10000)

    # changed to Json type
    print(MessageToJson(p1))
    
    # iteration test 
    print("Total number of players: ", len(world_state.players))
    for i, player in enumerate(world_state.players):
        print(f"No.{i} - {player.name} ")

if __name__ == "__main__":
    protobuf_test()