from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys
from selenium.common.exceptions import NoSuchElementException
import time

def new_account(proxy):
    chrome_options = Options()
    chrome_options.add_argument("--incognito")
    chrome_options.add_argument("--window-size=1920x1080")
    driver_email = webdriver.Chrome(chrome_options=chrome_options, executable_path="./chromedriver")

    url = "https://10minutemail.com/10MinuteMail/index.html"
    driver_email.get(url)
    b = True
    while b:
        try:
            email = driver_email.find_element_by_id('mailAddress')
            email = email.get_attribute("value")
            driver_email.find_element_by_tag_name('body').send_keys(Keys.CONTROL + 't')
            print(email)
            b = False
        except NoSuchElementException:
            time.sleep(2)

    chrome_options = Options()
    #chrome_options.add_argument("--proxy-server=%s" % proxy)
    chrome_options.add_argument("--incognito")
    chrome_options.add_argument("--window-size=1920x1080")
    driver = webdriver.Chrome(chrome_options=chrome_options, executable_path="./chromedriver")
    url = "https://twitter.com/i/flow/signup"
    driver.get(url)
    b = True
    print("FIRST PAGE")
    while b:
        time.sleep(2)
        try:
            driver.find_element_by_xpath("//span[contains(text(), 'Usar o e-mail')]").click()
            driver.find_element_by_name("name").send_keys("alfred hit")
            driver.find_element_by_name("email").send_keys(email)
            b = False
        except NoSuchElementException:
            time.sleep(2)
    
    b = True
    print("SECOND PAGE")
    while b:
        try:
            driver.find_element_by_xpath("//span[contains(text(), 'Avançar')]").click()
            b = False
        except NoSuchElementException:
            time.sleep(2)

    b = True
    print("THIRD PAGE")
    while b:
        try:
            driver.find_element_by_xpath("//span[contains(text(), 'Avançar')]").click()
        except NoSuchElementException:
            try:
                driver.find_element_by_xpath("//span[contains(text(), 'Inscrever-se')]").click()
            except NoSuchElementException:
                b = False
    
    b = True
    cod = None
    print("Get verification")
    while b:
        try:
            driver_email.find_element_by_xpath("/html/body/div[1]/div[1]/div[2]/div/div/h3").click()
            cod = driver_email.find_element_by_xpath('//*[@id="ui-id-2"]/div/table/tbody/tr[1]/td/table/tbody/tr[1]/td/table[1]/tbody/tr/td[2]/table/tbody/tr[10]/td').get_attribute("innerHTML")
            cod = cod.replace(" ", "")
            print(cod)
            b = False
        except NoSuchElementException:
            time.sleep(3)

    b = True
    print("Send verification")
    while b:
        try:
            driver.find_element_by_name("verfication_code").send_keys(cod)
            driver.find_element_by_xpath("//span[contains(text(), 'Avançar')]").click()
            b = False
        except NoSuchElementException:
            time.sleep(2)

    b = True
    print("Send Password")
    while b:
        try:
            driver.find_element_by_name("password").send_keys("zE$%D6:X")
            b = False
        except NoSuchElementException:
            time.sleep(2)

    b = True
    print("button click after password")
    while b:
        try:
            time.sleep(2)
            driver.find_element_by_xpath("//span[contains(text(), 'Avançar')]").click()
            b = False
        except NoSuchElementException:
            time.sleep(2)
    print("Sleeping")
    time.sleep(40)
    b = True
    c = 0
    while b:
        print(c)
        try:
            driver.find_element_by_xpath("//span[contains(text(), 'Ignorar por enquanto')]").click()
            b = False
            c = c + 1
        except NoSuchElementException:
                time.sleep(2)
                c = c + 1
    
    driver.find_element_by_tag_name("textarea").send_keys("Bots can change the world (for better and worst)")
    # time.sleep(7)
    # ele = driver.find_element_by_xpath("//span[contains(text(), 'Avançar')]").click()
    # print(ele)
    # print("chegou aqui")
    time.sleep(100000)

if __name__ == "__main__":
    new_account("187.125.23.26:8080")

    # name="country_code"
    # option text() +code + " " + "country name"
    