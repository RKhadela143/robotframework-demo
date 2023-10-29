*** Settings ***
Library    SeleniumLibrary
Resource    app_variables.resource
Resource    browser_details.resource
Resource    env_details.resource


*** Keywords ***
Open Browser To Login Page
    [Documentation]    Open the browser and navigates to the login page
    # ${services}    Evaluate    sys.modules['selenium.webdriver.chrome'].service()    modules=sys, selenium.webdriver, selenium.webdriver.chrome.service
    # Create Webdriver    ${BROWSER}    #service=${services}
    Open Browser    ${ENV_URL}    ${BROWSER}
    Maximize Browser Window
    # Set Window Size	    ${WINDOW_WIDTH}     ${WINDOW_HEIGHT}

Teardown
    [Documentation]    Close browser window
    Close Browser