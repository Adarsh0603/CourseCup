import time
import pandas
import timeunit
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from bs4 import BeautifulSoup
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.common.exceptions import TimeoutException

driver = webdriver.Chrome()


def contentres():
    try:

        driver.set_page_load_timeout(60)

        driver.get('https://www.edx.org/course/?language=English&availability=current')

        # Get scroll height.
        last_height = driver.execute_script("return document.body.scrollHeight")

        while True:

            # Scroll down to the bottom.
            driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")

            # Wait to load the page.
            time.sleep(10)
            print(last_height)
            # Calculate new scroll height and compare with last scroll height.
            new_height = driver.execute_script("return document.body.scrollHeight")

            if new_height == last_height:
                break

            last_height = new_height
        # SCROLL_PAUSE_TIME = 0.5
        # SCROLL_LENGTH = 200
        # page_height = int(driver.execute_script("return document.body.scrollHeight"))
        # scrollPosition = 0
        # while scrollPosition < page_height:
        #     scrollPosition = scrollPosition + SCROLL_LENGTH
        #     driver.execute_script("window.scrollTo(0, " + str(scrollPosition) + ");")
        #     time.sleep(SCROLL_PAUSE_TIME)
        # till here
        html = driver.page_source
        content = BeautifulSoup(html, "html.parser")

        # driver.quit()
        return content
    except TimeoutException:
        print('time out from contact')
        return None
    # delay = 120  # seconds


res = contentres()
courses = res.find_all("div", {"class": "discovery-card course-card shadow verified"})
courseList = []
for course in courses:
    courseDetails = {}
    try:
        courseDetails["title"] = course.find("h3", {"class": "title-heading ellipsis-overflowing-child"}).text
    except:
        courseDetails["title"] = "None"
    try:
        courseDetails["category"] = course.find("div", {"class": "label"}).text.replace("\n", "").replace(" ",
                                                                                                          '').replace(
            'SchoolsandPartners:', '')
    except:
        courseDetails["category"] = "None"
    try:
        courseDetails["url"] = course.find("a", {"class": "course-link"})['href']
    except:
        courseDetails["url"] = "None"
    try:
        banner = course.find("div", {"class": "banner"}).text.replace(" ", '')
        if banner == 'Verified':
            courseDetails["cost"] = "Free"
        else:
            courseDetails["cost"] = "Paid"
    except:
        courseDetails["cost"] = "Free"
    try:
        courseDetails["image"] = course.find("div", {"class": "img-wrapper"}).find("img")['src']
    except:
        courseDetails["image"] = "None"
    courseDetails['level'] = "Mixed"
    courseList.append(courseDetails)
print(len(courseList))
df = pandas.DataFrame(courseList)
df.to_json("edxcourses.json", orient="records")
# print(box.find("h3", {"class": "title-heading ellipsis-overflowing-child"}).text)
# print(box)
