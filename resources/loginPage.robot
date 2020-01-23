*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          baseClass.robot
Resource          common.robot

***Variables***
&{LILP_LOCATORS}    uname=//div[text()='Ramraj Sekar']

***Keywords***
Login User Name Should Display
    Wait Until Element Is Visible    ${LILP_LOCATORS.uname}
    Element Should Contain    ${LILP_LOCATORS.uname}    Ramraj Sekar