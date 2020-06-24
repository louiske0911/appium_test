*** Variables ***
${XPATH_BUTTON_SEARCH}    //button[@aria-label="Search"]
${XPATH_INPUT_SEARCH}     //input[@type="search"]

*** Keywords ***
# -------- Action Keywords --------
Click Search Button
    Wait Until Page Contains Element    ${XPATH_BUTTON_SEARCH}
    Click Element                       ${XPATH_BUTTON_SEARCH}

Input Search Text
    [Arguments]    ${topic}
    Wait Until Page Contains Element    ${XPATH_INPUT_SEARCH}
    Input Text    ${XPATH_INPUT_SEARCH}    ${topic}

Search Topic
    [Arguments]    ${topic}
    Click Search Button
    Input Search Text    ${topic}
    Click Search Button
    Page Should Not Contain Text    Sorry nothing matched your search.

# -------- Verify Keywords --------