*** Settings ***
Documentation     使用robotframework和appium，
...               寫一個依照page object pattern的結構的
...               test script，Test Case如下：
...               以https://www.twitch.tv/ 為例，在手機瀏覽器下，進去首頁後，
...               從搜尋框輸入 “Monster Hunter World” ，然後從結果的過去影片中找尋
...               第一筆使用者為CervelloneRe 的影片 (如果找不到，挑一個使用者名稱，
...               至少需要往下延伸list兩三次的)，進去播放5秒後截圖，確認有播放。

Force Tags        Twitch

Resource          ../init.robot

Suite Setup       Open App     ${TWITCH_URL}
Suite Teardown    Close All Applications

Test Teardown     Capture Page Screenshot

Test Timeout      ${TEST_TIMEOUT}

*** Test Cases ***
Check twitch video playing with video searh list
    [Tags]    TOFT
    [Setup]    Go To Twitch
    Search Topic    topic=Monster Hunter World
    Click Video List
    Search Author And Swipe Page    author=CervelloneRe
    Click Video
    Watch The Video
    Verify Video Playing 5 Seconds

*** Keywords ***
Go To Twitch
    Go To URL    ${TWITCH_URL}
    Wait Until Page Contains    Welcome to Twitch!