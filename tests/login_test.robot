*** Settings ***
Resource    ../pages/login.resource

Suite Setup    Open Browser To Login Page
Suite Teardown    Teardown

*** Test Cases ***
Verify Login With Valid Username and Password
    [Documentation]    Verify that a registered user can successfully log in with valid credentials
    [Template]    LogIn With Valid Username and Password
    
    ${USERNAME}    ${PASSWORD}
    ${PROBLEM_USERNAME}    ${PASSWORD}
    ${PERFORMANCE_GLITCH_USERNAME}    ${PASSWORD}

Verify Login with Invalid Username and Password
    [Documentation]    Verify that a user cannot log in with invalid or empty credentials
    [Template]    Login with Invalid Username and Password

    ${LOCKED_USERNAME}    ${PASSWORD}
    ${USERNAME}    ${}