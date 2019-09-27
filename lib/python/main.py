import sys
# import tensorflow as tf
import pickle
import numpy as np

with open('lib/python/apaman_ai_weights.pickle', mode='rb') as fi:
    ws = pickle.load(fi)

with open('lib/python/station.pickle', mode='rb') as fi:
    station_to_id, id_to_station = pickle.load(fi)
    
with open('lib/python/floor_plan.pickle', mode='rb') as fi:
    plan_to_id, id_to_plan = pickle.load(fi)

def room_flatten(room):
    array = [
              room.get("min_time_to_house")/ws.get("max_time_to_house"),
              room.get("age")/ws.get("max_age"),
              room.get("area")/ws.get("max_area")
             ]
    array += get_one_hot(station_to_id, room.get("station_id"))
    array += get_one_hot(plan_to_id, room.get("plan_id"))
    return array

def get_one_hot(ids, id):
    ar = np.zeros(len(ids))
    ar[id] = 1
    return ar.tolist()

#{"area": 61, "station_id": 5, "plan_id": 8, "age": 23, "min_time_to_house": 7}
args = sys.argv
area = args[1]
station_id = args[2]
plan_id = args[3]
age = args[4]
min_time_to_house = args[5]
room = {"area": float(area), "station_id": int(station_id), "plan_id": int(plan_id), "age": float(age), "min_time_to_house": float(min_time_to_house)}
room = room_flatten(room)


# with tf.name_scope('X'):
#     x = tf.placeholder(tf.float32, [None, 32])
# with tf.name_scope('W1'):
#     w1 = tf.constant(ws.get("w1"))
# with tf.name_scope('b1'):
#     b1 = tf.constant(ws.get("b1"))
# with tf.name_scope('W2'):
#     w2 = tf.constant(ws.get("w2"))
# with tf.name_scope('b2'):
#     b2 = tf.constant(ws.get("b2"))
# with tf.name_scope('y1'):
#     y1 = tf.nn.relu(tf.add(tf.matmul(x, w1), b1))
# with tf.name_scope('y2'):
#     y2 =  tf.nn.relu(tf.add(tf.matmul(y1, w2),b2))
# sess = tf.InteractiveSession()

calc_y1 = np.dot([room], ws.get("w1")) + ws.get("b1")
for i in range(len(calc_y1)):
    for j in range(len(calc_y1[i])):
        calc_y1[i][j] = max(0, calc_y1[i][j])

calc_y2 = np.dot(calc_y1, ws.get("w2")) + ws.get("b2")
for i in range(len(calc_y2)):
    for j in range(len(calc_y2[i])):
        calc_y2[i][j] = max(0, calc_y2[i][j])

print(calc_y2[0][0])

# print(sess.run(y2, feed_dict = {x: [room]})[0][0])