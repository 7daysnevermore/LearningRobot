install robot and selenium --> pip install --pre --upgrade robotframework robotframework-seleniumlibrary selenium
python -V
robot --version

----------------------------------------------------------------------------------------------------------
COMMAND

run robot --> robot ex1.robot (ex1.robot=files name)
เอาทุกอันที่เป็น nonweb
robot -i nonweb .
เอาทุกอันที่ไม่เป็น nonweb
robot -e nonweb .

----------------------------------------------------------------------------------------------------------

???? robot ??????????? web browser ????
Robot --> Robot Selenium Library --> Selenuim --> Web Driver --> Web browser(Chrome)

----------------------------------------------------------------------------------------------------------

Suite Setup          SS
Suite TearDown       ST
Test Setup           TS
Test Teardown        TT

SS open browser
TS Login
T1
TT Logout
ST close browser

----------------------------------------------------------------------------------------------------------

Level of Abstraction
1.Rules -> 
2.WorkFlow -> Business User เข้าใจ
3.Technical Activities -> IT เข้าใจ