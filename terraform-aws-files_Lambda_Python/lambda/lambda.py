#!/usr/bin/env python3

def lambda_handler(event, context):
  helloStr = '{"message":"Hello World, from binbashblog"}'
  print(helloStr)
  return helloStr