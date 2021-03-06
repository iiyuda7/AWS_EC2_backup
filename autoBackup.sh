#!/bin/bash
BASE_DIR=$(cd $(dirname $0);pwd)
source ${BASE_DIR}/config


AWS_PROFILE=$1

LIST=$(${BASE_DIR}/getInstances.sh ${AWS_PROFILE})

IFS=$'\n'
for ITEM in ${LIST} ; do
	INSTANCEID=$(echo ${ITEM}|awk '{print $1}')
	TAGNAME=$(echo ${ITEM}|awk '{print $2}')

        ${BASE_DIR}/createAMI.sh ${AWS_PROFILE} ${INSTANCEID} ${TAGNAME}

done
