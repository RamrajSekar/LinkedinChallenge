*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          baseClass.robot
Resource          common.robot

***Variables***
&{HP_LOCATORS}    uname=//div[text()='Ramraj Sekar']
...                 msg_btn=//span[text()='Message']
...                 msg_box=//div[@aria-label="Write a message…"]/p  #//aside[@id='msg-overlay']/div[2]/div[1]/form/div[3]/div/div[1]/div[@role='textbox']/p/br  #//div[@aria-label="Write a message…"]/p/br
...                 msg_sent=//p[text()="MSG-SENT"]
...                 send_btn=//button[text()='Send']


***Keywords***
Login User Name Should Display
    Wait Until Element Is Visible    ${HP_LOCATORS.uname}
    Element Should Contain    ${HP_LOCATORS.uname}    Ramraj Sekar

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
