*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser
Test Setup    เปิด Google Chrome ไปที่หน้าล็อกอิน
Test Template    ล็อกอินเข้าสู่ระบบด้วยชื่อผู้ใช้หรือรหัสผ่านที่ไม่ถูกต้องจะต้องแสดงข้อผิดพลาด

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com/#signin
${BROWSER}    gc
${DASHBOARD_URL}    https://robot-stage-1.firebaseapp.com/#/user/dashboard
${VALID_USERNAME}    demouser
${VALID_PASSWORD}    demopassword
${INVALID_USERNAME}    JEABuser
${INVALID_PASSWORD}    JEABpassword

*** Test Cases ***
ล็อกอินไม่สำเร็จเพราะชื่อผู้ใช้และรหัสผ่านไม่ถูกต้อง    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
ล็อกอินไม่สำเร็จเพราะชื่อผู้ใช้ไม่ถูกต้อง             ${INVALID_USERNAME}    ${VALID_PASSWORD}
ล็อกอินไม่สำเร็จเพราะรหัสผ่านไม่ถูกต้อง            ${VALID_USERNAME}      ${INVALID_PASSWORD}

*** Keywords ***
เปิด Google Chrome ไปที่หน้าล็อกอิน
    Open Browser    ${URL}    ${BROWSER}

ล็อกอินเข้าสู่ระบบด้วยชื่อผู้ใช้หรือรหัสผ่านที่ไม่ถูกต้องจะต้องแสดงข้อผิดพลาด
    [Arguments]    ${username}    ${password}
    ล็อกอินเข้าสู่ระบบด้วย    ${username}    ${password}
    ระบบจะต้องแสดงข้อผิดพลาดว่าชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง

ล็อกอินเข้าสู่ระบบด้วย
    [Arguments]    ${username}    ${password}
    Input Text    inputUser    ${username}
    Input Text    inputPassword    ${password}
    Click Button    buttonLogin

ระบบจะต้องแสดงข้อผิดพลาดว่าชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง
    Wait Until Element Is Visible    errorModalBody
    Element Should Contain    errorModalBody    ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง