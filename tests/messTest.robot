*** Settings ***
Resource          baseClass.robot
Resource          homePage.robot
Resource          landingPage.robot
Suite Teardown    Common Teardown


***Test Cases***
Verify That Use Is Able To Login In LinkedIn
    Navigate To Landing Page
    Login To LinkedIn
    Login User Name Should Display

Verify User Is Located And Message Is Sent
    Search User And Navigate To User Profile Page In LinkedIn    Vallalarasu Pandiyan (Valla)
    Send Message To User    How r u da?