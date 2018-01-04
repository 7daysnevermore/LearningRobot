*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser
Test Setup    เปิด Google Chrome ไปที่หน้าล็อกอิน

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com/#signin
${BROWSER}    gc
${DASHBOARD_URL}    https://robot-stage-1.firebaseapp.com/#/user/dashboard
${VALID_USERNAME}    demouser
${VALID_PASSWORD}    demopassword
${INVALID_USERNAME}    JEABuser
${INVALID_PASSWORD}    JEABpassword

*** Test Cases ***
ล็อกอินต้องสำเร็จ
    ล็อกอินเข้าสู่ระบบด้วย    ${VALID_USERNAME}    ${VALID_PASSWORD}
    ระบบจะต้องแสดงหน้า Dashboard

ล็อกอินไม่สำเร็จ
    [Template]    ล็อกอินเข้าสู่ระบบด้วยชื่อผู้ใช้หรือรหัสผ่านที่ไม่ถูกต้องจะต้องแสดงข้อผิดพลาด
    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    #${VALID_USERNAME}    ${INVALID_PASSWORD}
    #${INVALID_USERNAME}    ${VALID_PASSWORD}

*** Keywords ***

ล็อกอินเข้าสู่ระบบด้วยชื่อผู้ใช้หรือรหัสผ่านที่ไม่ถูกต้องจะต้องแสดงข้อผิดพลาด
    [Arguments]    ${username}    ${password}
    ล็อกอินเข้าสู่ระบบด้วย    ${username}    ${password}
    ระบบจะต้องแสดงข้อผิดพลาดว่าชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง
    ปิดป๊อบอัพข้อผิดพลาด

ปิดป๊อบอัพข้อผิดพลาด
    Wait Until Element Is Visible    close-error-modal-button
    Click Button    close-error-modal-button
    Wait Until Element Is Not Visible    errorModal

#เปิด Google Chrome ตอนรันทุกเคส
เปิด Google Chrome ไปที่หน้าล็อกอิน
    Open Browser    ${URL}    ${BROWSER}

#สำเร็จ
ล็อกอินเข้าสู่ระบบด้วย
    [Arguments]    ${username}    ${password}
    Input Text    inputUser    ${username}
    Input Text    inputPassword    ${password}
    Click Button    buttonLogin
ระบบจะต้องแสดงหน้า Dashboard
    Retry    Location Should Be    ${DASHBOARD_URL}
#ไม่สำเร็จ
ระบบจะต้องแสดงข้อผิดพลาดว่าชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง
    Wait Until Element Is Visible    errorModalBody
    Element Should Contain    errorModalBody    ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง

Retry
    [Arguments]    @{args}
    Wait Until Keyword Succeeds    5s    2s    @{args}