*** Settings ***
Library             XML
Library             String
Library             Collections
Library             SeleniumLibrary

Test Setup          Setup
Test Teardown       Teardown

*** Variables ***

*** Keywords ***
Setup
    Open Browser    https://www.google.com    chrome    remote_url=http://localhost:4444/wd/hub
    Maximize Browser Window

Teardown
    Close Browser

*** Test Cases ***
TC1
    Input Text    name=q    robot framework
    Press Keys    name=q    ENTER
    # Capture Page Screenshot
    Sleep    5s

TC2
    Input Text    name=q    facebook
    Press Keys    name=q    ENTER
    # Capture Page Screenshot
    Sleep    5s

TC3
    Input Text    name=q    twitter
    Press Keys    name=q    ENTER
    # Capture Page Screenshot
    Sleep    5s

TC4
    Input Text    name=q    linkedin
    Press Keys    name=q    ENTER
    # Capture Page Screenshot
    Sleep    5s

TC5
    Input Text    name=q    instagram
    Press Keys    name=q    ENTER
    # Capture Page Screenshot
    Sleep    5s

TC6
    Input Text    name=q    pinterest
    Press Keys    name=q    ENTER
    # Capture Page Screenshot
    Sleep    5s

TC7
    Input Text    name=q    youtube
    Press Keys    name=q    ENTER
    # Capture Page Screenshot
    Sleep    5s

TC8
    Input Text    name=q    github
    Press Keys    name=q    ENTER
    # Capture Page Screenshot
    Sleep    5s

TC9
    Input Text    name=q    stackoverflow
    Press Keys    name=q    ENTER
    # Capture Page Screenshot
    Sleep    5s

TC10
    Input Text    name=q    medium
    Press Keys    name=q    ENTER
    # Capture Page Screenshot
    Sleep    5s
