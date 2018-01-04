*** Variables ***
@{CHROME_OPTIONS}    headless    disable-gpu

*** Keywords ***
Open Headless Browser
    [Arguments]    ${url}
    ${options}=    Set Chrome Options
    Create WebDriver    Chrome    chrome_options=${options} 
    Go To    ${url}

Set Chrome Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    : FOR    ${option}    IN    @{CHROME_OPTIONS}
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}

Add
    [Arguments]    ${left_operand}    ${right_operand}
    ${expression}=    Set Variable    ${left_operand} + ${right_operand}
    ${result}=    Evaluate    ${expression}
    Log To Console    ${expression},${result}
    [Return]    ${result}

Minus
    [Arguments]    ${left_operand}    ${right_operand}
    ${expression}=    Set Variable    ${left_operand} - ${right_operand}
    ${result}=    Evaluate    ${expression}
    Log To Console    ${expression},${result}
    [Return]    ${result}

Sum
    [Arguments]    @{list}
    ${sum}=    Set Variable    ${0}
    :FOR    ${item}    IN    @{list}
    \    ${sum}=    Evaluate    ${sum} + ${item}
    Log To Console    ${list},${sum}
    [Return]    ${10}