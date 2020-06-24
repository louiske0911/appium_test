*** Keywords ***
# -------- Common Keywords --------
Open App
    [Arguments]    ${url}
	Open Application    ${APPIUM_SERVER}
    ...    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}        automationName=${AUTOMATION_NAME}
    ...    browserName=${BROWSER_NAME}      app=${url}

# -------- Action Keywords --------
Get Video Current Time
    ${current_time} =    Execute Script    return document.getElementsByTagName("video")[0].currentTime
    [Return]    ${current_time}

Swipe Page Down
    Swipe By Percent	50  90  50  10

# -------- Verify Keywords --------
Verify Page Url
    [Documentation]    Check the URL of pages
    [Arguments]    ${expected}
    ${current_url} =    Get Location
    Should Match Regexp    ${current_url}    ${expected}

Verify Video Playing ${second} Seconds
    ${second} =     Convert To Integer    ${second}
    ${timeout} =    Set Variable          ${second + 10}
    Wait Until Keyword Succeeds    ${timeout}s    1s    Verify Video Progress Should Be Greater Then    ${second}

Verify Video Progress Should Be Greater Then
    [Arguments]    ${expected_time}
    ${current_time} =    Get Video Current Time
    Should Be True   ${current_time} >= ${expected_time}
