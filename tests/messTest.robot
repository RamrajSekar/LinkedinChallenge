*** Settings ***
Resource          baseClass.robot
Resource          homePage.robot
Resource          loginPage.robot
Suite Teardown    Common Teardown


***Test Cases***
Verify That Use Is Able To Login In LinkedIn
    Navigate To Homepage
    Login To LinkedIn

Verify That Login User Is Displayed
    Login User Name Should Display