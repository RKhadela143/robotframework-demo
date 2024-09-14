*** Settings ***
Library     Collections
Library     DateTime
Library     SeleniumLibrary
Library     ../lib/python_lib.py
Resource    app_variables.resource
Resource    browser_details.resource
Resource    env_details.resource


*** Keywords ***
Open Browser To Login Page
    [Documentation]    Open the browser and navigates to the login page

    Open Browser    ${ENV_URL}    ${BROWSER}    # remote_url=http://localhost:4444/wd/hub
    Maximize Browser Window

Teardown
    [Documentation]    Close browser window
    Close Browser
