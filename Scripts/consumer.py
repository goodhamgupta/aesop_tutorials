from kafka import KafkaConsumer
import json
# To consume latest messages and auto-commit offsets
consumer = KafkaConsumer('or_test.topic',group_id='groupid',bootstrap_servers=['localhost:9092'])
for message in consumer:
	data =json.loads(message.value)
	print data
