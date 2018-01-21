#!/bin/python

print "hello world"
with open('data.txt','a') as file:
	file.write("hello")
