*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem   
Library    Process
Suite Setup     Start Process    python    C:/Users/jompp/Desktop/ohjelmistotestaus/ohjelmistotestaus_lp/robot_tests/runApi.py
Suite Teardown    Terminate All Processes
Task Setup     Open Browser    ${url_projektit}    Chrome    executable_path=C:/Users/jompp/Desktop/ohjelmistotestaus/ohjelmistotestaus_lp/robot_tests/chromedriver.exe    
Task Teardown    Close Browser    
Documentation    Järjestelmätestaus jossa pyrittään löytämään mahdollisia virhetilanteita.

*** Tasks ***
Budjetin virhesyöte

    [Documentation]    Annetaan edit-valikossa budjetti kohdalle  "väärä" syöte ja odotetaan vastaukseksi oikeanlaista virheilmoitusta, jossa kerrotaan että budjetin oltava yli 0$

    Wait Until Element Is Visible     xpath:/html/body/div/div/div[1]/div[1]/div/section/button    

    Click Element    xpath:/html/body/div/div/div[1]/div[1]/div/section/button

    Press Keys    xpath:/html/body/div/div/div[1]/div[1]/form/input[2]    E+Q+R+T+Å+ä+ö

    Sleep    1s    

    Element Should Contain    xpath:/html/body/div/div/div[1]/div[1]/form/div[1]/p    Budget must be more than $0.

Projektin nimen puuttuminen

    [Documentation]    Tyhjennetään projektin nimi ja tarkistetaan annetaanko oikea virheilmoitus nimen puuttumisesta

    Wait Until Element Is Visible    xpath:/html/body/div/div/div[1]/div[1]/div/section/button

    Click Element    xpath:/html/body/div/div/div[1]/div[1]/div/section/button

    Press Keys   name=name    CTRL+a   BACKSPACE

    Sleep    1s

    Element Should Contain    xpath:/html/body/div/div/div[1]/div[1]/form/div[1]/p    ${nimenpuuttuminen_virhe}

Projektin nimi liian lyhyt

    [Documentation]    Tyhjennetään projektin nimi ja tarkistetaan että kahden ensimmäisen syötetyn merkin jälkeen saadaan virheilmoitus siitä että projektin nimi on liian lyhyt

    Wait Until Element Is Visible    xpath:/html/body/div/div/div[1]/div[1]/div/section/button

    Click Element    xpath:/html/body/div/div/div[1]/div[1]/div/section/button

    Press Keys   name=name    CTRL+a   BACKSPACE

    Sleep    1s

    Press Keys    name=name    Ä

    Element Should Contain    xpath:/html/body/div/div/div[1]/div[1]/form/div[1]/p    ${nimilyhyt_virhe}

    Press Keys    name=name    Ö

    Element Should Contain    xpath:/html/body/div/div/div[1]/div[1]/form/div[1]/p    ${nimilyhyt_virhe}

Projektin kuvauksen puuttuminen

    [Documentation]    Tyhjennetään projektin kuvaus ja testataan saadaanko oikeanlainen virheilmoitus
    
    Wait Until Element Is Visible    xpath:/html/body/div/div/div[1]/div[1]/div/section/button

    Click Element    xpath:/html/body/div/div/div[1]/div[1]/div/section/button

    Press Keys    xpath:/html/body/div/div/div[1]/div[1]/form/textarea    CTRL+a   BACKSPACE

    Element Should Contain    xpath:/html/body/div/div/div[1]/div[1]/form/div[1]/p    ${kuvauspuuttuminen_virhe}

Projektien haun epäonnistuminen

    [Documentation]    Testataan saadaanko oikeanlainen virheilmoitus kun apiin ei saada yhteyttä tai projekteja ei muutenvaan voida hakea

    Terminate All Processes

    Start Process    python    C:/Users/jompp/Desktop/ohjelmistotestaus/ohjelmistotestaus_lp/robot_tests/closeApi.py

    Wait Until Element Is Visible    xpath:/html/body/div/div/div/div    30s

    Element Should Contain    xpath:/html/body/div/div/div/div/section/p    ${api_virhe}

*** Variables ***
${api_virhe}    There was an error retrieving the projects. Please try again.    
${kuvauspuuttuminen_virhe}    Description is required.
${nimilyhyt_virhe}    Name needs to be at least 3 characters.
${nimenpuuttuminen_virhe}    Name is required
${budjetti_virhe}    Budget must be more than $0.
${url_projektit}    http://localhost:3000/projects/

