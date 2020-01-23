*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          baseClass.robot
Resource          common.robot

***Variables***
&{HP_LOCATORS}      uname=//div[text()='USER-NAME']
...                 msg_btn=//span[text()='Message']
...                 msg_box=//div[@aria-label="Write a message…"]/p
...                 msg_sent=//p[text()="MSG-SENT"]
...                 send_btn=//button[text()='Send']


***Keywords***
Login User Name Should Display
    [Arguments]    ${name}
    ${locator}=    Replace String    ${HP_LOCATORS.uname}    USER-NAME    ${name}
    Wait Until Element Is Visible    ${locator}
    Element Should Contain    ${locator}    ${name}

Send Message To User
    [Arguments]    ${msg_input}
    Wait Until Element Is Visible    ${HP_LOCATORS.msg_btn}
    Click Element    ${HP_LOCATORS.msg_btn}
    Wait Until Element Is Visible    ${HP_LOCATORS.msg_box}    30s
    ${message}=    Set Variable    ${msg_input}
    #Input Text    ${HP_LOCATORS.msg_box}    ${message}
    Press Keys    ${HP_LOCATORS.msg_box}    ${message}
    Click Element    ${HP_LOCATORS.send_btn}
    ${sent_msg_locator}=    Replace String    ${HP_LOCATORS.msg_sent}    MSG-SENT    ${message}
    Element Should Contain    ${sent_msg_locator}    ${message}
