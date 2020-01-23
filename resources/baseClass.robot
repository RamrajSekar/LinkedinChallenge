*** Settings ***
Library           SeleniumLibrary
Library           String

***Variables***
${BROWSER}           chrome
${USERNAME}          test
${PWD}               test@2020
${BASE_URL}          https://www.linkedin.com/
${SEL_TIMEOUT}       30
${TEST_FILE_PATH}    ${EXECDIR}/resources/test_files/
# Set default retry count and duration
${RetryCnt}          3x
${RetryDur}          1s

***Keywords***
Set Variables
    ${UN}    Set Variable    sekar.ramraj@gmail.com 
    ${PASS}    Set Variable    Loyol@11
    Set Suite Variable    ${USERNAME}    ${UN}
    Set Suite Variable    ${PWD}    ${PASS}

Open Test Browser
    [Arguments]    ${testUrl}
    Open Browser    ${testUrl}    browser=${BROWSER}
    ${hp_location}=    Get Location
    Set Suite Variable   ${hp_link}    ${hp_location}

Common Teardown
    Close All Browsers