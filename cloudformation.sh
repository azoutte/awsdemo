#!/bin/bash

if aws cloudformation describe-stacks --stack-name MyStack > /dev/null; then
   aws cloudformation update-stack --stack-name MyStack --template-body file://./vpc.yaml
else
   aws cloudformation create-stack --stack-name MyStack --template-body file://./vpc.yaml
fi


