***Settings***
Resource    baseClass.robot
Library     SeleniumLibrary
Library     String
Library     Collections

***Variables***
&{COMMON_LOCATORS}   link_text=//a[text()='LINK-TEXT']
...                  title_text=//h1[text()='TITLE-NAME']
...                  input_text=//input[@id='TEXT-NAME']
...                  input_btn_field=//input[@value='BUTTON-NAME']
...                  btn_field=//button[text()='BUTTON-NAME']
...                  menu_items=//ul[@class="top-menu"]/li/a[contains(text(),'ITEM-NAME')]
...                  submenu_items=//ul[@class="top-menu"]/li/a[contains(text(),'SUBITEM-NAME')]/following-sibling::ul/li/a
...                  sub_items=//ul[@class="top-menu"]/li/a[contains(text(),'MENU')]/following-sibling::ul/li/a[contains(text(),'SUB')]
...                  login_input=//div[@class='sign-in-form__inputs']//div//input[@name='LABLE-NAME']
...                  search_input=//input[@placeholder='Search']
...                  search_btn=//button[@class='search-typeahead-v2__button search-global-typeahead__button']
...                  search_result_link=//span[@class="name-and-icon"]/span/span[contains(text(),'NAME')]
...                  username=//li[text()='NAME']
#...                  username=//div[@class='profile-background-image ember-view']//following::div/ul/li[contains(text(),'NAME')]  #//li[contains(text(),'NAME')]

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
    [Arguments]    ${button}    ${btn_type}=button
    ${locator}=    Run Keyword If    '${btn_type}'=='button'    Replace String    ${COMMON_LOCATORS.btn_field}    BUTTON-NAME    ${button}
    ...                      ELSE    Replace String    ${COMMON_LOCATORS.input_btn_field}    BUTTON-NAME    ${button}
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

Search User And Navigate To User Profile Page In LinkedIn
    [Arguments]    ${search_input}
    ${user_locator}=    Replace String    ${COMMON_LOCATORS.search_result_link}    NAME    ${search_input}
    ${user_name}=    Replace String    ${COMMON_LOCATORS.username}    NAME    ${search_input}
    Wait Until Element Is Visible    ${COMMON_LOCATORS.search_input}
    Input Text    ${COMMON_LOCATORS.search_input}    ${search_input}
    Click Element    ${COMMON_LOCATORS.search_btn}
    Wait Until Element Is Visible    ${user_locator}
    Click Element    ${user_locator}
    Sleep    8s
    #${Isdisplayed}=      Run Keyword And Return Status    Element Should Be Visible    ${user_name}
    Wait Until Element Is Visible    ${user_name}    8s
    Element Should Contain    ${user_name}    ${search_input}