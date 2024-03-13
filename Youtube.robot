*** Settings ***

Library    AppiumLibrary



*** Test Cases ***

Rodar um video no youtube
    Abrir App

*** Variables ***
${locator}          xpath=//android.view.ViewGroup[@content-desc="Eminem - Lose Yourself, Super Bowl Halftime Show 2022, Dr Dre, Snoop Dogg - 3 minutes, 35 seconds - Go to channel - Shady Records - 4.4M views - 2 years ago - play video"]/android.view.ViewGroup[2]/android.view.ViewGroup[1]
${element_visible}    False

*** Keywords ***
#Suite Setup    Run Keywords    Capture Errors    Continue From Failure

Abrir App
    Open application    http://localhost:4723
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=emulador-5554
    ...                 app=C:\\Users\\betto\\QArentena\\nuclone-appium-robot\\app\\nuclone.apk
    ...                 udid=emulator-5554

    Wait until element is visible    accessibility_id=card-hero     10
    Sleep    2
    Press keycode    4
    Sleep    3
    Click element    accessibility_id=YouTube
    Sleep    4
    Wait until element is visible    accessibility_id=Search    10
    Click element    accessibility_id=Search
    Input text    id=com.google.android.youtube:id/search_edit_text    Eminem
    Click element    xpath=//android.widget.TextView[@resource-id="com.google.android.youtube:id/text" and @text="eminem lose yourself"]
    Sleep    1

#    WHILE    ${element_visible} != True
#    Swipe    0      905       0       100
#    ${element_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${locator}
#    Log to console    ${element_visible}
#    Run Keyword If    ${element_visible}    Log    Element found: ${locator}
#    ...    ELSE    Log    Element not found: ${locator}
#    END

#    FOR    ${x}    IN RANGE    ${locator}    True
#    Swipe    0      905       0       100
#    ${element_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${locator}
#    Log to console    ${element_visible}
#    Run Keyword If    ${element_visible}    Log    Element found: ${locator}
#    ...    ELSE    Log    Element not found: ${locator}
#    ${x}=    Set Variable    ${locator}
#    ${x}+1
#    Exit For Loop If     ${element_visible}==True
    #${x}==4
#    END

    Sleep    1
    Click element    xpath=//android.view.ViewGroup[@content-desc="Eminem - Lose Yourself, Super Bowl Halftime Show 2022, Dr Dre, Snoop Dogg - 3 minutes, 35 seconds - Go to channel - Shady Records - 4.4M views - 2 years ago - play video"]/android.view.ViewGroup[2]/android.view.ViewGroup[1]
    Sleep    10
