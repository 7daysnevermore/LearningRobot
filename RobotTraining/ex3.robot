*** Settings ***
Library    SeleniumLibrary
Test Teardown

*** Test Cases ***
Test Open Browser
    Open Browser    http://www.google.com    gc

Search on google
    input text    lst-ib    Chonlasith Jucksriporn github
    press key    lst-ib    \\13    #ASCII code for enter key

Wait for search Results
    wait until page contains    chonla (Chonlasith Jucksriporn) · GitHub    #Chanasit Thanasatianwich

Close Browser After Finish
    close browser