*** Settings ***
Resource    ../resources/common_resources.resource

*** Test Cases ***

Nur ein Test ablaufen lassen
#1. Step: Open Browser
    Test Setup

#2. Step: Navigate To The "Partnerek" Menu
    Wait Until Element Is Visible    ${PARTNERS_BUTTON}
    Click Element    ${PARTNERS_BUTTON}
    Wait Until Element Is Visible    ${PARTNERS_ADD_BUTTON}    timeout=5s 
    Click Element    ${PARTNERS_ADD_BUTTON}

#3. Step: API Call Test (based on API_URL_1)
    ${response}=    Get    ${API_URL_1}    params=size=1
    #${user_data}=    Evaluate    json.loads('''${response}''')    json
    ${user_data}=    Set Variable   ${response.json()}

#4. Step: Attach A Partner Based On The API Message (first_name, last_name, email, id)
    ${first_name}=    Set Variable   ${user_data[0]['first_name']}
    ${last_name}=    Set Variable   ${user_data[0]['last_name']}
    ${email}=    Set Variable   ${user_data[0]['email']}
    ${id}=    Set Variable   ${user_data[0]['id']}

    #Attach And Check The Values
    Input Text    ${PARTNERS_ADD_NAME}    ${first_name} ${last_name}
    ${first_last_name_value}    Get Element Attribute    ${PARTNERS_ADD_NAME}    value
    Should Be Equal As Strings    ${first_name} ${last_name}    ${PARTNERS_ADD_BUTTON}
    
    
    Input Text    ${PARTNERS_ADD_EMAIL}    ${email}
    ${email_value}    Get Element Attribute    ${PARTNERS_ADD_EMAIL}     value
    Should Be Equal As Strings    ${email_value}    ${PARTNERS_ADD_EMAIL}

    Input Text    ${PARTNERS_ADD_COMMENT}    ${id}
    ${comment_value}    Get Element Attribute    ${PARTNERS_ADD_COMMENT}    value
    Should Be Equal As Integers    ${comment_value}    ${PARTNERS_ADD_COMMENT}

   # Place Data Into "Ügyfél" Grid    ${first_name}    ${last_name}    ${email}    ${phone_number}    ${id}

#5. Step: Save The Menu
    Wait Until Element Is Visible    ${PARTNERS_ADD_BUTTON}    timeout=5s
    Click Element    ${PARTNERS_ADD_SAVE}

#6. Step: Navigate To The "Telephelyek" Menu
    Wait Until Element Is Visible    ${LOCATIONS_BUTTON}    timeout=5s
    Click Element    ${LOCATIONS_BUTTON}

#7. Step: Attach A Location Based On The API Message (city, zip_code, street_name, street:number) AND Check The Values
    Wait Until Element Is Visible    ${LOCATIONS_ADD_BUTTON}    timeout=5s
    Click Element    ${LOCATIONS_ADD_BUTTON}
    Wait Until Element Is Visible    ${LOCATIONS_ADD_CUSTOMER}    timeout=5s
    Wait Until Element Is Enabled    ${LOCATIONS_ADD_SAVE}    timeout=5s
    Input Text    ${LOCATIONS_FIRST_NAME_ON_THE_LIST}    ${first_name} ${last_name}
    Click Element    ${LOCATIONS_CUSTOMER_DROPDOWN}

    ${partner_city}    Set Variable    ${user_data}[0][address][city]
    Click Element    ${LOCATIONS_ADD_CITY}
    Input Text    ${LOCATIONS_ADD_CITY}    ${partner_city}
    ${partner_city_value}    Get Element Attribute    ${LOCATIONS_ADD_CITY}    value
    Should Be Equal As Strings    ${partner_city_value}    ${LOCATIONS_ADD_CITY}

    ${partner_zip_code}    Set Variable    ${user_data}[0][address][zip_code]
    Click Element    ${LOCATIONS_ADD_ZIP}
    Input Text    ${LOCATIONS_ADD_ZIP}    ${partner_zip_code}
    ${partner_zip_code_value}    Get Element Attribute    ${LOCATIONS_ADD_ZIP}    value
    Should Be Equal As Integers    ${partner_city_value}    ${LOCATIONS_ADD_ZIP}

    ${partner_street_name}    Set Variable    ${user_data}[0][address][street_name]
    Click Element    ${LOCATIONS_ADD_STREET}
    Input Text    ${LOCATIONS_ADD_STREET}    ${partner_street_name}
    ${partner_street_name_value}    Get Element Attribute    ${LOCATIONS_ADD_STREET}    value
    Should Be Equal As Strings    ${partner_street_name_value}    ${LOCATIONS_ADD_STREET}

    ${partner_street_number}    Set Variable    ${user_data}[0][address][street_address]
    Click Element    ${LOCATIONS_ADD_STREET_NUMBER}    
    Input Text    ${LOCATIONS_ADD_STREET_NUMBER}    ${partner_street_number}
    ${partner_street_number_value}    Get Element Attribute    ${LOCATIONS_ADD_STREET_NUMBER}    value
    Should Be Equal As Integers    ${partner_street_number_value}    ${LOCATIONS_ADD_STREET_NUMBER}

#8. Step: Save the Menu
    Wait Until Element Is Visible    ${LOCATIONS_ADD_SAVE}    timeout=5s
    Click Element    ${LOCATIONS_ADD_SAVE}

#9. Step: Request 2 Tools Via API
    ${response}=    Get    ${API_URL_2}    params=size=2
    ${tools_data}=    Set Variable   ${response.json()}

#10. Step: Navigate To The "Eszközök" Menu
    Wait Until Element Is Visible    ${TOOLS_BUTTON}    timeout=5s
    Click Element    ${TOOLS_BUTTON}

#11. Step: Attach The 2 Tools (manufacturer, model, platform, serial_number) AND Check The Values
    
    Click Element    ${TOOLS_ADD_BUTTON} 
    Wait Until Element Is Enabled    ${TOOLS_SAVE_BUTTON}    timeout=5s
    Input Text    ${TOOLS_USER_NAME_INPUT}    ${first_name} ${last_name}
    Click Element    ${TOOLS_USER_NAME_DROP_DOWN}

    ${tools_'neve'}    Set Variable    ${tools_data}[0][manufacturer] [model]
    Click Element    ${TOOLS_'NEVE'_INPUT}    
    Input Text    ${TOOLS_'NEVE'_INPUT}    ${tools_'neve'}
    ${tools_'neve'_value}    Get Element Attribute    ${TOOLS_'NEVE'_INPUT}    value
    Should Be Equal As Strings    ${tools_'neve'_value}    ${TOOLS_'NEVE'_INPUT}

    ${tools'leiras'}    Set Variable    ${tools_data}[0][platform]
    Click Element    ${TOOLS_'LEIRAS'_INPUT}
    Input Text    ${TOOLS_'LEIRAS'_INPUT}    ${tools'leiras'}
    ${tools'leiras'_value}    Get Element Attribute    ${TOOLS_'LEIRAS'_INPUT}    value
    Should Be Equal As Strings    ${tools_'neve'_value}    ${TOOLS_'LEIRAS'_INPUT}

    ${tools'megjegyzes'}    Set Variable    ${tools_data}[0][serial_number]
    Click Element    ${TOOLS_'MEGJEGYZES'_INPUT}
    Input Text    ${TOOLS_'LEIRAS'_INPUT}    ${tools'megjegyzes'}    
    ${tools'megjegyzes'_value}    Get Element Attribute    ${TOOLS_'MEGJEGYZES'_INPUT}    value
    Should Be Equal As Strings    ${tools'megjegyzes'_value}    ${TOOLS_'MEGJEGYZES'_INPUT}

#12. Step: Save The Menu
    Wait Until Element Is Visible    ${TOOLS_SAVE_BUTTON}    timeout=5s
    Click Element    ${TOOLS_SAVE_BUTTON}

#13. Click On "Excel Export" Button
    Wait Until Element Is Visible    ${TOOLS_EXCEL_EXPORT_MENU}    timeout=5s
    Click Element    ${TOOLS_EXCEL_EXPORT_MENU}

#14. Step: Navigate To The "Telephelyek" Menu
    Wait Until Element Is Visible    ${LOCATIONS_BUTTON}    timeout=5s
    Click Element    ${LOCATIONS_BUTTON}

#15. Step: Filter By Attached Location In The Search Menu AND Check The Name Value
    Wait Until Element Is Visible    ${LOCATIONS_SEARCH_INPUT}    timeout=5s
    Click Element    ${LOCATIONS_SEARCH_INPUT}
    Input Text    ${LOCATIONS_SEARCH_INPUT}    ${first_name} ${last_name}
    ${name_value}    Get Element Attribute    ${LOCATIONS_SEARCH_INPUT}    value
    Should Be Equal As Strings    ${name_value}    ${LOCATIONS_SEARCH_INPUT}

    Wait Until Element Is Visible    ${LOCATION_SEARCH_BUTTON}

#16: Step: Click On The 'UTCA' Field Menu
    Wait Until Element Is Visible    ${LOCATION_NAVIGATION_BUTTON}
    Click Element    ${LOCATION_NAVIGATION_BUTTON}

    Test Teardown
