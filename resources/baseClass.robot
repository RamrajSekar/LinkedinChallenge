*** Settings ***
Library           SeleniumLibrary
Library           String

***Variables***
${BROWSER}           chrome
${USERNAME}          test
${PWD}               test@2020
${BASE_URL}          https://www.linkedin.com/
${SEL_TIMEOUT}       30

***Keywords***
Set Variables
    Set Selenium Timeout    ${SEL_TIMEOUT}
    
Open Test Browser
    [Arguments]    ${testUrl}
    Open Browser    ${testUrl}    browser=${BROWSER}
    ${hp_location}=    Get Location
    Set Suite Variable   ${hp_link}    ${hp_location}

Common Teardown
    Close All Browsers