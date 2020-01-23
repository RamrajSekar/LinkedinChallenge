*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          baseClass.robot
Resource          common.robot

***Variables***
&{LIHP_LOCATORS}    sigin_card=//section[@class='sign-in-card show']
...                 signin_btn=//div[@class='sign-in-form__footer']//following-sibling::button


***Keywords***
Navigate To Homepage
    Set Variables
    Open Test Browser    ${BASE_URL}
    Set Window Size    1920    1080
    ${act_title}=    Get Title
    Should Contain    ${act_title}    LinkedIn: Log In or Sign Up

Login To LinkedIn
    Wait Until Element Is Visible    ${LIHP_LOCATORS.sigin_card}
    Element Should Be Visible    ${LIHP_LOCATORS.sigin_card}
    Enter Text In Sign-In Field     session_key    ${USERNAME}
    Enter Text In Sign-In Field     session_password    ${PWD}
    Click Element    ${LIHP_LOCATORS.signin_btn}
