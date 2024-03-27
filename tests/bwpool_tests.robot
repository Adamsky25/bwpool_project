*** Settings ***
Resource    ../resources/common_resources.resource

# Test Setup    Test Setup
# Test Setup    Test Setup

*** Test Cases ***

Nur ein Test ablaufen lassen
#1. Step: Open Browser
    Open Browser    ${HOMEPAGE_URL}    ${BROWSER}
    Wait Until Element Is Visible    ${PARTNERS_BUTTON}

#2. Step: Navigate To The "Partnerek" Menu
    Click Element    ${PARTNERS_BUTTON}
    Wait Until Element Is Visible    ${PARTNERS_ADD_BUTTON}    timeout=5s 
    Click Element    ${PARTNERS_ADD_BUTTON}

#3. Step: API Call Test (based on API_URL_1)
    ${response}=    Get    ${API_URL_1}    params=size=1
    #${user_data}=    Evaluate    json.loads('''${response}''')    json
    ${user_data}=    Set Variable   ${response.json()}

#4. Step: Attach A Partner Based On The API Message (first_name, last_name, email, id)
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

#5. Step: Save The Menu
    Wait Until Element Is Visible    ${PARTNERS_ADD_BUTTON}    timeout=5s
    Click Element    ${PARTNERS_ADD_SAVE}

#6. Step: Navigate To The "Telephelyek" Menu
    Wait Until Element Is Visible    ${LOCATIONS_BUTTON}    timeout=5s
    Click Element    ${LOCATIONS_BUTTON}

#7. Step: Attach A Location Based On The API Message (city, zip_code, street_name, street:number)
    Wait Until Element Is Visible    ${LOCATIONS_ADD_BUTTON}    timeout=5s
    Click Element    ${LOCATIONS_ADD_BUTTON}
    Wait Until Element Is Visible    ${LOCATIONS_ADD_CUSTOMER}    timeout=5s
    Wait Until Element Is Enabled    ${LOCATIONS_ADD_SAVE}    timeout=5s
    Input Text    ${LOCATIONS_FIRST_NAME_ON_THE_LIST}    ${first_name} ${last_name}
    Click Element    ${LOCATIONS_CUSTOMER_DROPDOWN}

    ${partner_city}    Set Variable    ${user_data}[0][address][city]
    Click Element    ${LOCATIONS_ADD_CITY}
    Input Text    ${LOCATIONS_ADD_CITY}    ${partner_city}

    ${partner_zip_code}    Set Variable    ${user_data}[0][address][zip_code]
    Click Element    ${LOCATIONS_ADD_CITY}
    Input Text    ${LOCATIONS_ADD_ZIP}    ${partner_zip_code}

    ${partner_street_name}    Set Variable    ${user_data}[0][address][street_name]
    Click Element    ${LOCATIONS_ADD_STREET}
    Input Text    ${LOCATIONS_ADD_STREET}    ${partner_street_name}

    ${partner_street_number}    Set Variable    ${user_data}[0][address][street_address]
    Click Element    ${LOCATIONS_ADD_STREET_NUMBER}    
    Input Text    ${LOCATIONS_ADD_STREET_NUMBER}    ${partner_street_number}

#8. Step: Save the Menu
    Wait Until Element Is Visible    ${LOCATIONS_ADD_SAVE}    timeout=5s
    Click Element    ${LOCATIONS_ADD_SAVE}

#9. Step: Request 2 Tools Via API
    ${response}=    Get    ${API_URL_2}    params=size=2
    ${tools_data}=    Set Variable   ${response.json()}

#10. Step: Navigate To The "Eszközök" Menu
    Wait Until Element Is Visible    ${TOOLS_BUTTON}    timeout=5s
    Click Element    ${TOOLS_BUTTON}

#11. Step: Attach The 2 Tools (manufacturer, model, platform, serial_number)
    
    Click Element    ${TOOLS_ADD_BUTTON} 
    Wait Until Element Is Enabled    ${TOOLS_SAVE_BUTTON}    timeout=5s
    Input Text    ${TOOLS_USER_NAME_INPUT}    ${first_name} ${last_name}
    Click Element    ${TOOLS_USER_NAME_DROP_DOWN}

    ${tools_'neve'}    Set Variable    ${tools_data}[0][manufacturer] [model]
    Click Element    ${TOOLS_'NEVE'_INPUT}    
    Input Text    ${TOOLS_'NEVE'_INPUT}    ${tools_'neve'}

    ${tools'leiras'}    Set Variable    ${tools_data}[0][platform]
    Click Element    ${TOOLS_'LEIRAS'_INPUT}
    Input Text    ${TOOLS_'LEIRAS'_INPUT}    ${tools'leiras'}

    ${tools'megjegyzes'}    Set Variable    ${tools_data}[0][serial_number]
    Click Element    ${TOOLS_'MEGJEGYZES'_INPUT}
    Input Text    ${TOOLS_'LEIRAS'_INPUT}    ${tools'megjegyzes'}

#12. Step: Save The Menu
    Wait Until Element Is Visible    ${TOOLS_SAVE_BUTTON}    timeout=5s
    Click Element    ${TOOLS_SAVE_BUTTON}

#13. Click On "Excel Export" Button
    Wait Until Element Is Visible    ${TOOLS_EXCEL_EXPORT_MENU}    timeout=5s
    Click Element    ${TOOLS_EXCEL_EXPORT_MENU}

#14. Step: Navigate To The "Telephelyek" Menu
    Wait Until Element Is Visible    ${LOCATIONS_BUTTON}    timeout=5s
    Click Element    ${LOCATIONS_BUTTON}

#15. Step: Filter By Attached Location In The Search Menu
    Wait Until Element Is Visible    ${LOCATIONS_SEARCH_INPUT}    timeout=5s
    Click Element    ${LOCATIONS_SEARCH_INPUT}
    Input Text    ${LOCATIONS_SEARCH_INPUT}    ${first_name} ${last_name}
    Wait Until Element Is Visible    ${LOCATION_SEARCH_BUTTON}

#16: Step: Click On The 'UTCA' Field Menu
    Wait Until Element Is Visible    ${LOCATION_NAVIGATION_BUTTON}
    Click Element    ${LOCATION_NAVIGATION_BUTTON}
