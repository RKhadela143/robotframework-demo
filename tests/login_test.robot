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
    ${PROBLEM_USERNAME}    ${PASSWORD}
    ${PERFORMANCE_GLITCH_USERNAME}    ${PASSWORD}

Verify Login With Invalid Username And Password
    [Documentation]    Verify that a user cannot log in with invalid or empty credentials
    [Template]    Login With Invalid Username And Password

    ${LOCKED_USERNAME}    ${PASSWORD}
    ${USERNAME}    ${INVALID_PASSWORD}
