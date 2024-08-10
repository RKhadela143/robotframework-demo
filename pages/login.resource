*** Settings ***
Resource    ../config/common.resource


*** Variables ***
${USERNAME_IP}              id=user-name
${PASSWORD_IP}              id=password
${LOGIN_BTN}                id=login-button
${HAMBURGER_MENU}           css=div.bm-burger-button
${LOGOUT_SIDEBAR_LINK}      id=logout_sidebar_link
${ERROR_MSG}                css=[data-test="error"]
${APP_LOGO}                 css=div.app_logo


*** Keywords ***
Enter Username
    [Documentation]    Enter username
    [Arguments]    ${username}
    Input Text    ${USERNAME_IP}    ${username}

Enter Password
    [Documentation]    Enter password
    [Arguments]    ${password}
    Input Password    ${PASSWORD_IP}    ${password}

Click Login Button
    [Documentation]    Click login button
    Click Element    ${LOGIN_BTN}

Logout
    [Documentation]    Logout
    Click Element    ${HAMBURGER_MENU}
    Wait Until Element Is Visible    ${LOGOUT_SIDEBAR_LINK}    timeout=${3}
    Click Element    ${LOGOUT_SIDEBAR_LINK}

Login
    [Documentation]    login with username and password
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login Button
    Wait Until Element Is Visible    ${APP_LOGO}    timeout=${3}

Login With Valid Username And Password
    [Documentation]    Login with valid username and password
    [Arguments]    ${username}    ${password}
    Login    ${username}    ${password}
    Logout

Login With Invalid Username And Password
    [Documentation]    Login with invalid username and password
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login Button
    IF    '${username}' == '${LOCKED_USERNAME}'
        Element Text Should Be    ${ERROR_MSG}    Epic sadface: Sorry, this user has been locked out.
    ELSE
        Element Text Should Be
        ...    ${ERROR_MSG}
        ...    Epic sadface: Username and password do not match any user in this service
    END
