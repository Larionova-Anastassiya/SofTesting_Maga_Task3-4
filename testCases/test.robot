*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/resources.robot
Suite Setup       Open Demo Blaze
Suite Teardown    Close Demo


*** Test Cases ***
Sign Up Test
    Sign Up User

Login Test
    Login User

Logout Test
    Logout User

Login Again Test
    Login User

Buy Product Test
    Buy Product
