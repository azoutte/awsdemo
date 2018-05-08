#!/bin/bash -vx

DATE=`date +%s`

if aws cloudformation describe-stacks --region us-west-2 --stack-name MyStack > /dev/null; then
   aws cloudformation update-stack --region us-west-2 --stack-name MyStack --template-body file://./vpc.yaml --parameters ParameterKey=SerialNumber,ParameterValue=${DATE}
else
   aws cloudformation create-stack --region us-west-2 --stack-name MyStack --template-body file://./vpc.yaml --parameters ParameterKey=SerialNumber,ParameterValue=${DATE}
fi


