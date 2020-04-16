import requests
from bs4 import BeautifulSoup
import pandas

courseList = []
base_url = "https://www.coursera.org/search?index=prod_all_products_term_optimization&query=free&page="
for page in range(1, 2, 1):
    r = requests.get(base_url + str(page))
    c = r.content
    soup = BeautifulSoup(c, "html.parser")
    courses = soup.find_all("li", {"class": "ais-InfiniteHits-item"})
    print(page)
    for course in courses:
        courseDetails = {}
        try:
            courseDetails["title"] = course.find("h2", {"class": "color-primary-text card-title headline-1-text"}).text
        except:
            courseDetails["title"] = "None"
        try:
            courseDetails["category"] = course.find("span", {"class": "partner-name"}).text
        except:
            courseDetails["category"] = "None"
        try:
            courseType = course.find("div", {"class": "product-type-row horizontal-box"}).text
            if courseType == "COURSE":
                courseDetails["cost"] = "Free"
            else:
                courseDetails["cost"] = "Paid"
        except:
            courseDetails["cost"] = "Free"
        try:
            courseDetails["level"] = course.find("span", {"class": "difficulty"}).text
        except:
            courseDetails["level"] = "Mixed"
        try:
            courseDetails["url"] = "https://www.coursera.org" + \
                                   course.find("a", {"class": "rc-DesktopSearchCard anchor-wrapper"})['href']
        except:
            courseDetails["url"] ="None"
        try:
            courseDetails["image"] = course.find("img", {"class": "product-photo"})['src']
        except:
            courseDetails["image"] = "None"
        courseList.append(courseDetails)

print(len(courseList))
df = pandas.DataFrame(courseList)
df.to_json("courseracourses1.json", orient="records")
