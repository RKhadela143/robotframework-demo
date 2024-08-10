*** Settings ***
Resource            ../pages/products.resource

Suite Setup         Open Browser To Login Page
Suite Teardown      Teardown
Test Setup          Navigate to Products Page


*** Test Cases ***
Verify Product List Page Loads Correctly
    Header Element Presence Check
    Secondary Header Element Presence Check
    Check Inventory Cards Details
    Footer Element Presence Check
