import requests
from bs4 import BeautifulSoup
import cssutils
import pandas

r = requests.get("https://www.udacity.com/courses/all")
c = r.content
soup = BeautifulSoup(c, "html.parser")
courses = soup.find_all("div", {"class", "course-summary-card"})
courseList = []
for course in courses:
    courseDetails = {}
    courseDetails["title"] = course.find_all("h3", {"class": "card-heading"})[0].text

    try:
        courseDetails["category"] = course.find("h4", {"class": "category"}).text
    except:
        courseDetails["category"] = "None"
    courseDetails["level"] = course.find("span", {"class": "level"}).text

    courseDetails["summary"] = course.find("div", {"class": "card__expander--summary"}).text
    link = course.find("div", {"class": "image_wrapper hidden-md-down"}).find("a")['href']
    courseDetails["url"] = link
    if "nanodegree" in link:
        courseDetails["cost"] = 'Paid'
    else:
        courseDetails["cost"] = "Free"
    try:
        # courseDetails["image"] =
        div_style = course.find("div", {"class": "image-container ng-star-inserted"})['style']
        style = cssutils.parseStyle(div_style)
        courseDetails["image"] = style['background-image']
        print(courseDetails["image"])

    except:
        courseDetails["image"] = 'None'
    courseList.append(courseDetails)

print(len(courseList))
df = pandas.DataFrame(courseList)
df.to_json("courses.json", orient="records")
