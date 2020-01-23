*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          baseClass.robot
Resource          common.robot

***Variables***
&{LIHP_LOCATORS}    sigin_card=//section[@class='sign-in-card show']
...                 signin_btn=//div[@class='sign-in-form__footer']//following-sibling::button
...                 login_btn=//a[text()='Sign in'] 

***Keywords***
Navigate To Landing Page
    Open Test Browser    ${BASE_URL}
    Set Window Size    1920    1080
    ${act_title}=    Get Title
    Should Contain    ${act_title}    LinkedIn: Log In or Sign Up

Login To LinkedIn
    Wait Until Element Is Visible    ${LIHP_LOCATORS.login_btn}
    ${Isdisplayed}=      Run Keyword And Return Status    Element Should Be Visible    ${LIHP_LOCATORS.sigin_card}
    Run Keyword If    '${Isdisplayed}'=='True'    Login Using Sign Card
    ...       ELSE    Login With Default Login Page

Login Using Sign Card
    Enter Text In Sign-In Field     session_key    ${USERNAME}
    Enter Text In Sign-In Field     session_password    ${PWD}
    Click Element    ${LIHP_LOCATORS.signin_btn}

Login With Default Login Page
    Click Element    ${LIHP_LOCATORS.login_btn}
    Page Title Should Be Loaded    Welcome Back
    Enter Text In A Field    username    ${USERNAME}
    Enter Text In A Field    password    ${PWD}
    Click A Button    Sign in