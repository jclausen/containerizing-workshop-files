#!/bin/bash
MODULE=$1

curl http://${TEST_DOMAIN}:8080/tests/runner.cfm\?directory=%2Ftests%2Fspecs%2Funit%2Fmodules%2F${MODULE}\&reporter=json > ${PWD}/tests/results/${MODULE}-Unit-Tests.json

if [[ $(cat ${PWD}/tests/results/${MODULE}-Unit-Tests.json | jq -r '.totalFail') > 0 ]] || [[ $(cat ${PWD}/tests/results/${MODULE}-Unit-Tests.json | jq -r '.totalError') > 0 ]]; then 
    jq . ${PWD}/tests/results/${MODULE}-Unit-Tests.json
    echo "${MODULE} Unit Tests have failed. The test output received is provided above"
    exit 1
fi
