*** Settings ***
Resource    ../resources/common_resources.resource

# Test Setup    Test Setup
# Test Setup    Test Setup

*** Test Cases ***

1. Step: Login Page
    Open Browser    ${HOMEPAGE_URL}    ${BROWSER}

2. Step: Navigate To The "Partnerek" Manu
    Click Element    ${PARTNERS_BUTTON}

3. Step: API Call Test
    ${response}    GET    https://random-data-api.com/api/users/random_user    params=size=1
    ${body}    Set Variable    ${response.json()}