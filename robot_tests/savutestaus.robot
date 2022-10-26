*** Settings ***
Library    SeleniumLibrary
Task Teardown    Close Browser
Documentation    Savutestaus

*** Tasks ***
Avaa etusivu
    
    [Documentation]    avataan ohjelman etusivu ja tarkastetaan onko sivu auennut oikein tarkastamalla onko Home-teksti ja logo paikoillaan     

    Open Browser    ${url_etusivu}    Chrome    executable_path=C:/Users/jompp/Desktop/ohjelmistotestaus/ohjelmistotestaus_lp/robot_tests/chromedriver.exe

    Sleep    2s

    Page Should Contain    Home

    Page Should Contain Image    xpath:/html/body/div/header/span/img    

Navigointi sivujen välillä

    [Documentation]    kokeillaan navigoida projektisivulle ja sieltä takaisin etusivulle niille suunniteltuja nappeja käyttämällä.
    
    Open Browser    ${url_etusivu}    Chrome    executable_path=C:/Users/jompp/Desktop/ohjelmistotestaus/ohjelmistotestaus_lp/robot_tests/chromedriver.exe

    Sleep    2s

    Click Element    xpath:/html/body/div/header/a[2]

    Sleep    1s

    ${current_url}    Get Location

    Should Match Regexp    ${current_url}    ${url_projektit}

    Sleep    1s

    Click Element    xpath:/html/body/div/header/a[1]

    ${current_url}    Get Location

    Should Match Regexp    ${current_url}    ${url_etusivu}

    Sleep    1s

Projektien hakeminen

    [Documentation]     kokeillaan navigoida projektisivulle ja sieltä takaisin etusivulle niille suunniteltuja nappeja käyttämällä.

    Open Browser    ${url_projektit}    Chrome    executable_path=C:/Users/jompp/Desktop/ohjelmistotestaus/ohjelmistotestaus_lp/robot_tests/chromedriver.exe

    Sleep    5s

    Page Should Contain Element    class:card

Yksittäisen projektin avaaminen

    [Documentation]    navigoidaan projektisivulle ja pyritään avaamaan yksittäinen projektinäkymä

    Open Browser    ${url_projektit}    Chrome    executable_path=C:/Users/jompp/Desktop/ohjelmistotestaus/ohjelmistotestaus_lp/robot_tests/chromedriver.exe

    Sleep    5s

    Click Element    xpath:/html/body/div/div/div[1]/div[1]/div/section/a

    Sleep    1s

    Page Should Contain    Project Detail

Projektin edit ikkunan avaus

    [Documentation]    kokeillaan avata projektin edit ikkuna, kuitenkaan muokkaamatta mitään

    Open Browser    ${url_projektit}    Chrome    executable_path=C:/Users/jompp/Desktop/ohjelmistotestaus/ohjelmistotestaus_lp/robot_tests/chromedriver.exe

    Sleep    5s

    Click Element    xpath:/html/body/div/div/div[1]/div[1]/div/section/button

    Page Should Contain Element    xpath:/html/body/div/div/div[1]/div[1]/form

*** Variables ***
${current_url}
${url_etusivu}    http://localhost:3000/
${url_projektit}    http://localhost:3000/projects/
