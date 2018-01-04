*** Settings ****
Resource    keywords.robot

*** Variables ****
#scalar = ${left_operand}
#list = @{list}
#dictionary = &{INPUT}    left_operand=2    right_operand=3
&{INPUT}    left_operand=2    right_operand=3

*** Test Cases ***
Should Sum Correctly
    [Tags]    nonweb
    #Assign
    ${expectation}=    Set Variable    ${10}
    #Act
    ${result}=    Sum    1    2    3    4
    #Assert
    Should Be Equal    ${result}    ${expectation}

Should Sum Correctly 2
    [Tags]    nonweb
    #Assign
    ${expectation}=    Set Variable    ${5}
    #Act
    ${result}=    Add    &{INPUT}
    #Assert
    Should Be Equal    ${result}    ${expectation}

