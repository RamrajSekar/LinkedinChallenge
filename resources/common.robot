***Settings***
Resource    baseClass.robot
Library     SeleniumLibrary
Library     String
Library     Collections

***Variables***
&{COMMON_LOCATORS}   link_text=//a[text()='LINK-TEXT']
...                  title_text=//h1[text()='TITLE-NAME']
...                  input_text=//input[@id='TEXT-NAME']
...                  btn_field=//input[@value='BUTTON-NAME']
...                  menu_items=//ul[@class="top-menu"]/li/a[contains(text(),'ITEM-NAME')]
...                  submenu_items=//ul[@class="top-menu"]/li/a[contains(text(),'SUBITEM-NAME')]/following-sibling::ul/li/a
...                  sub_items=//ul[@class="top-menu"]/li/a[contains(text(),'MENU')]/following-sibling::ul/li/a[contains(text(),'SUB')]
...                  login_input=//div[@class='sign-in-form__inputs']//div//input[@name='LABLE-NAME']


***Keywords***
Click A Link Text
    [Arguments]    ${link}
    ${locator}=    Replace String    ${COMMON_LOCATORS.link_text}    LINK-TEXT    ${link}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}

Page Title Should Be Loaded
    [Arguments]    ${text}
    ${locator}=    Replace String    ${COMMON_LOCATORS.title_text}    TITLE-NAME    ${text}
    Wait Until Element Is Visible    ${locator}
    Element Should Contain    ${locator}    ${text}

Enter Text In A Field 
    [Arguments]    ${field_name}    ${text}
    ${locator}=    Replace String    ${COMMON_LOCATORS.input_text}    TEXT-NAME    ${field_name}
    Wait Until Element Is Visible    ${locator}
    Input Text    ${locator}    ${text}

Click A Button
    [Arguments]    ${button}
    ${locator}=    Replace String    ${COMMON_LOCATORS.btn_field}    BUTTON-NAME    ${button}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}

Generate First Name 
    ${num}=    Generate Random String    4    chars=[NUMBERS]
    ${fname}=    Catenate    DEMO    ${num}
    [Return]    ${fname}

Generate Last Name
    ${num}=    Generate Random String    4    chars=[NUMBERS]
    ${lname}=    Catenate    AUTO    ${num}
    [Return]    ${lname}

Select A Menu Item From Header
    [Arguments]    ${name}    ${subitem}=False
    ${menu}=    Replace String    ${COMMON_LOCATORS.menu_items}    ITEM-NAME    ${name}
    Wait Until Element Is Visible    ${menu}
    Run Keyword If    '${subitem}'=='False'    Click Element    ${menu}
    ...       ELSE    Mouse Over    ${menu}

Select Sub Menu Item From Header
    [Arguments]    ${menu_name}    ${sub_name}
    Select A Menu Item From Header     name=${menu_name}    subitem=True
    ${sub_menu}=    Replace String    ${COMMON_LOCATORS.submenu_items}    SUBITEM-NAME    ${menu_name}
    ${sub_menu_count}=    Get Element Count    ${sub_menu}
    ${submenus}=    Run Keyword If    ('${sub_menu_count}'!='${0}' and '${menu_name}' in ('Computers','Electronics'))
    ...             Get Sub-Menu Items    item_count=${sub_menu_count}    locator=${sub_menu}
    ${l1}=    Replace String    ${COMMON_LOCATORS.sub_items}    MENU    ${menu_name}
    ${locator}=    Replace String    ${l1}    SUB    ${sub_name}
    Run Keyword If    '${sub_name}' in @{submenus}    Click Element    ${locator}
    Page Title Should Be Loaded    ${sub_name}

Get Sub-Menu Items
    [Arguments]    ${item_count}    ${locator}
    @{items}=    Create List
    :For     ${x}     IN RANGE    1    ${item_count}+${1}
    \    ${item_val}=    Get Text    (${locator})[${x}]
    \    Append To List    ${items}    ${item_val}
    [Return]    ${items}    

Enter Text In Sign-In Field 
    [Arguments]    ${field_name}    ${text}
    ${locator}=    Replace String    ${COMMON_LOCATORS.login_input}    LABLE-NAME    ${field_name}
    Wait Until Element Is Visible    ${locator}
    Input Text    ${locator}    ${text}
