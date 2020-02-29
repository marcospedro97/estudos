from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys
from selenium.common.exceptions import NoSuchElementException
import time
from datetime import datetime

def proxy_call():
    proxy = "131.108.75.130:8080"
    chrome_options = Options()
    chrome_options.add_argument("--proxy-server=%s" % proxy)
    chrome_options.add_argument("--incognito")
    chrome_options.add_argument("--window-size=1920x1080")
    driver = webdriver.Chrome(chrome_options=chrome_options, executable_path="./chromedriver")
    url = "https://www.meuip.com.br/"
    driver.get(url)

def no_proxy():
    chrome_options = Options()
    chrome_options.add_argument("--incognito")
    chrome_options.add_argument("--window-size=1920x1080")
    driver = webdriver.Chrome(chrome_options=chrome_options, executable_path="./chromedriver")
    url = "https://www.meuip.com.br/"
    driver.get(url)

if __name__ == "__main__":
    no_proxy()
    print(datetime.now())
    proxy_call()
    print(datetime.now())
    time.sleep(10000)