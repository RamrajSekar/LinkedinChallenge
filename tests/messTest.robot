*** Settings ***
Resource          baseClass.robot
Resource          homePage.robot
Resource          landingPage.robot
Suite Teardown    Common Teardown


***Test Cases***
Verify That Use Is Able To Login In LinkedIn
    Navigate To Landing Page
    Login To LinkedIn
    #Replace TEST USER with FULL NAME of the Logged In LinkedIn USER in below line
    Login User Name Should Display    TEST USER

Verify User Is Located And Message Is Sent
	#Replace TEST USER with FULL NAME of the LinkedIn USER To whom the message has to be sent in below line
    Search User And Navigate To User Profile Page In LinkedIn    TEST USER
    Send Message To User    How r u da?