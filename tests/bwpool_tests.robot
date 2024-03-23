*** Settings ***
Resource    ../resources/common_resources.resource

# Test Setup    Test Setup
# Test Setup    Test Setup

*** Test Cases ***

1.Step: Login Page
    Open Browser    ${HOMEPAGE_URL}    ${BROWSER}

2. Step: Navigate To The "Partnerek" Manu
    Click Element    ${PARTNERS_BUTTON}
    Wait Until Element Is Visible    ${PARTNERS_ADD_BUTTON}    timeout=5s 
    Click Element    ${PARTNERS_ADD_BUTTON}

3. Step: API Call Test + 4. Step: Attach A Partner Based On The API Message

    ${response}=    Get    ${API_URL_1}    params=size=1
    ${user_data}=    Set Variable   ${response.json()}
    ${first_name}=    Set Variable   ${user_data[0]['first_name']}
    #Log    ${first_name}
    ${last_name}=    Set Variable   ${user_data[0]['last_name']}
    #Log    ${last_name}
    ${email}=    Set Variable   ${user_data[0]['email']}
    #Log    ${email}
    ${phone_number}=    Set Variable    ${user_data[0]['phone_number']}
    #Log    ${phone_number}
    ${id}=    Set Variable   ${user_data[0]['id']}

    Place Data Into "Ügyfél" Grid    ${first_name}    ${last_name}    ${email}    ${phone_number}    ${id}

5. Step: Save The Menu
    Save The Partner Menu

6. Step: Navigate To The "Telephelyek" Menu
    Wait Until Element Is Visible    ${LOCATIONS_BUTTON}
    Click Element    ${LOCATIONS_BUTTON}

7. Step: Attach A Location Based On The API Message
    #Wait Until Element Is Visible    ${LOCATIONS_ADD_BUTTON}    timeout=10
    Click Element    ${LOCATIONS_ADD_BUTTON}
    Wait Until Page Contains Element    ${LOCATIONS_ADD_CUSTOMER}    timeout=5s
    Click Element    ${LOCATIONS_ADD_CUSTOMER}
    ${location_data}=    Create Location Data    ${partner_city}    ${partner_zip_code}    ${partner_street}    ${partner_street_number}
    Attach Location To Partner    ${id}    ${location_data}
    Place Data Into "Telephely" Grid    ${partner_city}    ${partner_zip_code}    ${partner_street}    ${partner_street_number}

8. Step: Save the Menu
    Wait Until Element Is Visible    ${LOCATIONS_ADD_SAVE}    timeout=5s
    Save The Locations Menu

10. Step: Navigate To The "Eszközök" Menu
    Wait Until Element Is Visible    ${TOOLS_BUTTON}
    Click Element    ${TOOLS_BUTTON}

12. Step: Save The Menu
    Wait Until Element Is Visible    ${TOOLS_SAVE_BUTTON}
    Save The Tools Menu

13. Click On "Excel Export" Button
    Wait Until Element Is Visible    ${TOOLS_EXCEL_EXPORT_MENU}
    Click Element    ${TOOLS_EXCEL_EXPORT_MENU}

14. Step: Navigate To The "Telephelyek" Menu
    Wait Until Element Is Visible    ${LOCATIONS_BUTTON}
    Click Element    ${LOCATIONS_BUTTON}

15. Step: Filter by fixed location in the search menu
    Click Element    ${LOCATIONS_SEARCH_BUTTON}
    #rögzített telephelyet beilleszteni

