*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem   
Library    Process
Suite Setup     Start Process    python    C:/Users/jompp/Desktop/ohjelmistotestaus/ohjelmistotestaus_lp/robot_tests/runApi.py
Suite Teardown    Terminate All Processes
Task Setup     Open Browser    ${url_projektit}    Chrome    executable_path=C:/Users/jompp/Desktop/ohjelmistotestaus/ohjelmistotestaus_lp/robot_tests/chromedriver.exe    
Task Teardown    Close Browser    
Documentation    Integraatiotestejä, joissa syötetään käyttöliittymään syötteität ja tarkistetaan että syötetöt tallentuvat json-tiedostoon tarkastelemalla käyttöliittymään syntyviä muutoksia.

*** Tasks ***
Uuden projektikuvauksen kirjoittaminen

    [Documentation]    Edit valikossa muutetaan tietyn projektin nimeä, tallennetaan muutokset, suljetaan ja avataan sivu uudelleen ja tarkastetaan että tehdyt muutokset ovat varmasti tallentuneet.

    Wait Until Element Is Visible     xpath:/html/body/div/div/div[1]/div[1]/div/section/button    

    Click Element    xpath:/html/body/div/div/div[1]/div[1]/div/section/button

    Input Text    xpath:/html/body/div/div/div[1]/div[1]/form/textarea    ${testi_syöte}

    Click Element    xpath:/html/body/div/div/div[1]/div[1]/form/div/button[1]

    Sleep    5s

    Close All Browsers 

    Open Browser    ${url_projektit}    Chrome    executable_path=C:/Users/jompp/Desktop/ohjelmistotestaus/ohjelmistotestaus_lp/robot_tests/chromedriver.exe    

    Wait Until Element Is Visible    xpath:/html/body/div/div/div[1]/div[1]

    Element Should Contain    xpath:/html/body/div/div/div[1]/div[1]/div/section/a/p[1]    ${testi_syöte}

Projektin aktiivisuus-statuksen päivittäminen

    [Documentation]    Ensin tarkistetaan projektin omalta sivulta onko projekti aktiivinen vai ei, tämän jälkeen palataan projekti-valikkoon jossa edit-valikossa muutetaan projektin aktiivisuus, tämän jälkeen sivu suljetaan ja avataan ja tarkistetaan onko aktiivisuus muuttunut.

    Wait Until Element Is Visible     xpath:/html/body/div/div/div[1]/div[1]/div/section/a

    Click Element    xpath:/html/body/div/div/div[1]/div[1]/div/section/a

    Sleep    5s

    ${aktiivisuus}=    Set Variable    xpath:/html/body/div/div/div/div/div/div/section/p[4]/mark

    Go Back

    Wait Until Element Is Visible     xpath:/html/body/div/div/div[1]/div[1]/div/section/button

    Click Element    xpath:/html/body/div/div/div[1]/div[1]/div/section/button

    Click Element    xpath:/html/body/div/div/div[1]/div[1]/form/input[3]

    Click Element    xpath:/html/body/div/div/div[1]/div[1]/form/div/button[1]

    Sleep    5s

    Close All Browsers 

    Open Browser    ${url_projektit}    Chrome    executable_path=C:/Users/jompp/Desktop/ohjelmistotestaus/ohjelmistotestaus_lp/robot_tests/chromedriver.exe    

    Wait Until Element Is Visible     xpath:/html/body/div/div/div[1]/div[1]/div/section/a

    Click Element    xpath:/html/body/div/div/div[1]/div[1]/div/section/a

    Page Should Not Contain    ${aktiivisuus}

*** Variables *** 
${testi_syöte}    Testisyöte
${url_projektit}    http://localhost:3000/projects/

