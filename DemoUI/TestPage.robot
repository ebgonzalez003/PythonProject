*** Settings ***
Documentation   To Validate Loging form
Library     SeleniumLibrary
Library     Collections
Library     ../customLibraries/Shop.py
Test Setup  open the browser with the Mortgage payment url
#Test Setup      open the browser with the url
Suite Setup
Suite Teardown
Test Teardown  Close Browser session
Resource    Resources.robot
Resource    LandingPage.robot
Resource    ShopPage.robot
Resource    CheckOut.robot
Resource    ConfirmationPage.robot

*** Variables ***

@{listofProducts}       Blackberry      Samsung Note 8
${country_name}         India

*** Test Cases ***
Validate Unsuccesful Login
    [Tags]     SMOKE    REGRESSION
    LandingPage.Fill the login form     ${user_name}    ${invalid_password}
    LandingPage.wait until Element is located in the Page
    LandingPage.Verify the error message is correct

Validate Cards displayed in the Shopping Page
    [Tags]      REGRESSION
    LandingPage.Fill the login form  ${user_name}   ${valid_password}
    ShopPage.wait until Element is located in the Page
    ShopPage.Verify titles in the Shop page
    add items to cart and checkout      @{listofProducts}
    CheckOut.Verify items in the Checkout Page and proceed
    ConfirmationPage.Enter the Country and select the terms   ${country_name}
    ConfirmationPage.Purchase the Product and Confirm the Purchase

Select the Form and navigate to Child window
    LandingPage.Fill the Login Details and Loging Form