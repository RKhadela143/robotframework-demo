*** Settings ***
Resource    ../config/config.robot
Resource    home.resource

*** Variables ***
${username_ip}    id=user-name
${password_ip}    id=password
${login_btn}    id=login-button
${hamburger_menu}    css=div.bm-burger-button
${logout_sidebar_link}    id=logout_sidebar_link
${error_msg}    css=[data-test="error"]

*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Input Text    ${username_ip}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Password    ${password_ip}    ${password}

Click Login Button
    Click Element    ${login_btn}

Logout
    Click Element    ${hamburger_menu}
    Wait Until Element Is Visible    ${logout_sidebar_link}    timeout=${3}
    Click Element    ${logout_sidebar_link}

Login With Valid Username and Password
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login Button
    Wait Until Element Is Visible    ${app_logo}    timeout=${3}
    Logout

Login with Invalid Username and Password
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login Button
    Element Should Be Visible    ${error_msg}
    Element Text Should Be    ${error_msg}    Epic sadface: Username and password do not match any user in this service

