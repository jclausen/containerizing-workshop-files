#!/bin/bash

curl http://${TEST_DOMAIN}:8080/tests/runner.cfm\?directory=%2Ftests%2Fspecs%2Finterceptors\&reporter=json > ${PWD}/tests/results/interceptor-tests.json

if [[ $(cat ${PWD}/tests/results/interceptor-tests.json | jq -r '.totalFail') > 0 ]] || [[ $(cat ${PWD}/tests/results/interceptor-tests.json | jq -r '.totalError') > 0 ]]; then 
    jq . ${PWD}/tests/results/interceptor-tests.json
    echo "Interceptor Tests have failed. The test output received is provided above"
    exit 1
fi
