*** Settings ***
Documentation       Login page tests

Resource            ../pages/login.resource

Suite Setup         Open Browser To Login Page
Suite Teardown      Teardown


*** Test Cases ***
Verify Login With Valid Username And Password
    [Documentation]    Verify that a registered user can successfully log in with valid credentials
    [Template]    Login With Valid Username And Password

    ${USERNAME}    ${PASSWORD}
    ${LOCKED_USERNAME}    ${PASSWORD}
    ${PROBLEM_USERNAME}    ${PASSWORD}
    ${PERFORMANCE_GLITCH_USERNAME}    ${PASSWORD}

Verify Login With Valid Username And Invalid Password
    [Documentation]    Verify that user can not login with valid username and invalid password
    [Template]    Login With Invalid Username And Password
    ${USERNAME}    ${INVALID_PASSWORD1}
    ${USERNAME}    ${EMPTY}
    ${USERNAME}    ${SPACE}
    ${LOCKED_USERNAME}    ${PASSWORD}
    ${LOCKED_USERNAME}    ${EMPTY}
    ${LOCKED_USERNAME}    ${SPACE}
    ${PROBLEM_USERNAME}    ${INVALID_PASSWORD2}
    ${PROBLEM_USERNAME}    ${EMPTY}
    ${PROBLEM_USERNAME}    ${SPACE}
    ${PERFORMANCE_GLITCH_USERNAME}    ${INVALID_PASSWORD3}
    ${PERFORMANCE_GLITCH_USERNAME}    ${EMPTY}
    ${PERFORMANCE_GLITCH_USERNAME}    ${SPACE}

Verify Login With Invalid Username And Password
    [Documentation]    Verify that a user cannot log in with invalid or empty credentials
    [Template]    Login With Invalid Username And Password

    ${LOCKED_USERNAME}    ${PASSWORD}
    ${USERNAME}    ${INVALID_PASSWORD1}
