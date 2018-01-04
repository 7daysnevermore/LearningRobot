*** Settings ****
Resource    keywords.robot

*** Test Cases ***
Should Add Correctly
    [Tags]    nonweb
    ${expectation}=    Set Variable    ${5}
    ${result}=    Add    4    1
    Should Be Equal    ${result}    ${expectation}

Should Minus Correctly
    [Tags]    nonweb
    ${expectation}=    Set Variable    ${3}
    ${result}=    Minus    4    1
    Should Be Equal    ${result}    ${expectation}