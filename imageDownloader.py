from os.path import exists
from requests import get
from os import makedirs

from selenium.webdriver import Chrome
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys
from time import sleep
# from subprocess import CREATE_NO_WINDOW


# Create directories if they don't exist
makedirs('./assets/images', exist_ok=True)
makedirs('./assets/images/720', exist_ok=True)
makedirs('./assets/images/1080', exist_ok=True)
makedirs('./assets/images/review', exist_ok=True)
makedirs('./assets/images/small', exist_ok=True)
makedirs('./assets/images/find', exist_ok=True)
makedirs('./assets/images/find/720', exist_ok=True)
makedirs('./assets/images/find/1080', exist_ok=True)
makedirs('./assets/images/find/review', exist_ok=True)
makedirs('./assets/images/find/small', exist_ok=True)

# set the escape character for curly brace formatting
escapeCharacter = '\n'

# set the base url
baseURL = "https://www.classfind.com/trent/"

"""
# photoNames = [
#     "bata102.jpg",
#     "bata102.jpg",
#     "bata103.jpg",
#     "bata107.1.jpg",
#     "bata107.2.jpg",
#     "bata201.jpg",
#     "bata210.jpg",
#     "bata314.jpg",
#     "bata401.jpg",
#     "bata402.jpg",
#     "bike5.jpg",
#     "CCNG4.jpg",
#     "CCNI1.jpg",
#     "CCNI2.jpg",
#     "CCNK1.jpg",
#     "CCNM2.jpg",
#     "CCS307.jpg",
#     "CCWA1.jpg",
#     "CCWA2.jpg",
#     "CCWC3.jpg",
#     "seasonedspoon4.jpg",
#     "CSBD101.jpg",
#     "CSBD109.jpg",
#     "CSBD113.jpg",
#     "CSBD116.jpg",
#     "CSBE101.jpg",
#     "CSBE103.jpg",
#     "DNAD103.jpg",
#     "DNAB104.jpg",
#     "DNAB105.jpg",
#     "DNAD105.jpg",
#     "DNAD106.jpg",
#     "DNAD108.jpg",
#     "DNAB110.1.jpg",
#     "DNAB110.2.jpg",
#     "DNAB113.jpg",
#     "DNAC141.jpg",
#     "DNAC142.jpg",
#     "DNAD202.jpg",
#     "DNAD208.jpg",
#     "DNAC215.jpg",
#     "DNAC231.jpg",
#     "DNAC231.jpg",
#     "DNAC233.jpg",
#     "ECC201.jpg",
#     "ECC207.jpg",
#     "ECC208.jpg",
#     "ECC212.jpg",
#     "ESCC111.3.jpg",
#     "ESCA202.jpg",
#     "ECC208.jpg",
#     "ESCC202.jpg",
#     "ESCB203.jpg",
#     "ESCA205.jpg",
#     "ESC209.jpg",
#     "ESCB305.jpg",
#     "enviroscience30.jpg",
#     "ESCB319.jpg",
#     "FPHL101.jpg",
#     "GCS103-2.jpg",
#     "GCS105-3.jpg",
#     "GCS106-3.jpg",
#     "GCS108-3.jpg",
#     "GCS110-2.jpg",
#     "GCS111-2.jpg",
#     "GCS112-2.jpg",
#     "GCS114.jpg",
#     "GCS115-2.jpg",
#     "FPHL117.jpg",
#     "GCS345.jpg",
#     "OCAW101.2.jpg",
#     "OCA109.jpg",
#     "OCA128.jpg",
#     "OCA134.jpg",
#     "OCA143.jpg",
#     "OCA171.jpg",
#     "OCA203.jpg",
#     "OCA204.jpg",
#     "OCA205.jpg",
#     "OCA206.jpg",
#     "OCA207.jpg",
#     "OCA208.jpg",
#     "OCA219.jpg",
#     "SC103-2.jpg",
#     "SC115.jpg",
#     "SC137-2.jpg",
#     "SCW1W2.jpg",
#     "SC203.jpg",
#     "SC208.jpg",
#     "SC215.jpg",
#     "SCW3W4.jpg",
#     "SCW3W4.jpg",
#     "SC305.jpg",
#     "SC317.jpg",
#     "CH102.jpg",
#     "SC.jpg",
#     "SC.jpg",
#     "TC101.jpg",
#     "WH.jpg",
#     "WH.jpg",
# ]

# # Remove duplicates
# photoNames = list(set(photoNames))

# completedPhotos = []

# print(f'{len(photoNames) * 3} images to download')
# print(f'{round((len(completedPhotos)/(len(photoNames) * 3)), 4) * 100}% completed, {len(completedPhotos)} downloaded, downloading {str(None)}                                                                            ', end='\r', flush=True)

# # Function to download an image
# def download_image(url, save_path):
#     response = get(url)
#     if response.status_code == 200:
#         with open(save_path, 'wb') as file:
#             file.write(response.content)
#         # print(f'Downloaded: {save_path}')
#     else:
#         # print(f'Failed to download: {save_path}')
#         pass
#     if exists(save_path):
#         completedPhotos.append(save_path)


# # Function to download images with different resolutions
# threads = []
# for photo_name in photoNames:
#     resolutions = ['review', '720', '1080']
#     for resolution in resolutions:
#         url = f"{baseURL}{resolution}/{photo_name}"
#         save_path = f"./assets/images/{resolution}/{photo_name}"
#         print(f'{round((len(completedPhotos)/(len(photoNames) * 3)), 4) * 100}% completed, {len(completedPhotos)} downloaded, downloading {save_path}                                                                            ', end='\r', flush=True)
#         if not exists(save_path):
#             download_image(url, save_path)

# # print("All downloads completed.")
"""

# initialize empty lists for photos to download and completed photos
photosToDownload = []
completedPhotos = []


# Function to download an image
def download_image(url, save_path):
    """Downloads an image from a url and saves it to a path

    Args:
        url (str): The url of the image to download
        save_path (str): The path to save the image to
    """
    # download the image
    response = get(url)
    # check if the image was downloaded
    if response.status_code == 200:
        # save the image by writing the response content to the file
        with open(save_path, 'wb') as file:
            file.write(response.content)
            
    # if the image wasn't downloaded
    else:
        # don't save the image
        pass
    # check if the image exists
    if exists(save_path):
        # add the image to the list of completed photos
        completedPhotos.append(save_path)


# # open the assetInfo file
# with open('assetInfo.txt', 'w') as assetInfoFile:
#     # initialize the browser service
#     chromeService = Service(
#         '/usr/bin/chromedriver', )
#     # set the browser service to not show a window when running to disable console spam and save resoucees to increase performance
#     # chromeService.creation_flags = CREATE_NO_WINDOW

#     # initialize the browser options
#     chromeOptions = Options()
#     """# set the browser options to not show a window when running to disable console spam and save resoucees to increase performance
#     chromeOptions.add_argument('--headless')"""
#     chromeOptions.add_argument('--log-level=3')

#     # initialize the browser
#     browser = Chrome(service=chromeService, options=chromeOptions)
#     # initialize the browser action chain
#     action = ActionChains(browser)

#     # go to the base url
#     browser.get(baseURL)

#     # # wait for user to start script
#     # input('Press Return To Continue...')
#     sleep(10)

#     # loop through all trent centers
#     for trentCenterIndex in range(len(browser.find_elements(By.XPATH, "//div[@id='tab1']/div[@class='buttoncontainer']"))):
#         # print the name of the trent center
#         print(browser.find_elements(By.XPATH, "//div[@id='tab1']/div[@class='buttoncontainer']")[trentCenterIndex].find_element(
#             By.XPATH, "div[2]").text)
#         # write the name of the trent center to the assetInfo file
#         assetInfoFile.write(
#             f'''{browser.find_elements(By.XPATH, "//div[@id='tab1']/div[@class='buttoncontainer']")[trentCenterIndex].find_element(By.XPATH, "div[2]").text}\n''')

#         # press ctrl + home and hold
#         browser.find_elements(
#             By.XPATH, "//body")[0].send_keys(Keys.CONTROL)
#         # wait 0.1 seconds
#         sleep(0.1)
#         # release ctrl + home
#         browser.find_elements(By.XPATH, "//body")[0].send_keys(Keys.HOME)

#         # wait for the trent center to load
#         sleep(10)

#         # click on the trent center
#         browser.find_elements(
#             By.XPATH, "//div[@id='tab1']/div[@class='buttoncontainer']")[trentCenterIndex].click()

#         # wait for the trent center to load
#         while len(browser.find_elements(By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")) == 0 and len(browser.find_elements(By.XPATH, "//div[@class='roomholder']")) == 0:
#             # refresh the page
#             browser.refresh()

#             # wait for the trent center to load
#             while len(browser.find_elements(By.XPATH, "//div[@id='tab1']/div[@class='buttoncontainer']")) == 0:
#                 # press ctrl + home and hold
#                 browser.find_elements(
#                     By.XPATH, "//body")[0].send_keys(Keys.CONTROL)
#                 # wait 0.1 seconds
#                 sleep(0.1)
#                 # release ctrl + home
#                 browser.find_elements(
#                     By.XPATH, "//body")[0].send_keys(Keys.HOME)
#                 # wait 10 seconds for the page to load
#                 sleep(10)

#             # get all trent centers
#             trentCenters = browser.find_elements(
#                 By.XPATH, "//div[@id='tab1']/div[@class='buttoncontainer']")

#             # click on the trent center
#             trentCenters[trentCenterIndex].click()

#             # wait for the trent center to load
#             sleep(10)

#         # wait for the trent center to load
#         while len(browser.find_elements(By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")) == 0 and len(browser.find_elements(By.XPATH, "//div[@class='roomholder']")) == 0:
#             # wait for the trent center to load
#             sleep(10)

#         # wait for the trent center to load
#         sleep(10)

#         # loop through all trent center floors
#         for trentCenterFloorIndex in range(len(browser.find_elements(By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")) if len(browser.find_elements(By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")) != 0 and len(browser.find_elements(By.XPATH, "//div[@class='roomholder']")) == 0 else 1):
#             waitForTrentCenterFloor = True

#             # wait for the trent center to load
#             while len(browser.find_elements(By.XPATH, "//div[@class='roomholder']")) == 0 and (len(browser.find_elements(By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")) == 0 or len(browser.find_elements(By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")) < trentCenterFloorIndex):
#                 # wait for the trent center to load
#                 sleep(10)
#             else:
#                 if len(browser.find_elements(By.XPATH, "//div[@class='roomholder']")) != 0 and len(browser.find_elements(By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")) == 0:
#                     trentCenterFloorIndex = 0
#                     waitForTrentCenterFloor = False

#             if waitForTrentCenterFloor:
#                 # wait for the trent center to load
#                 sleep(10)

#                 # print the name of the trent center floor
#                 print(
#                     f''' - {browser.find_elements(By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")[trentCenterFloorIndex].find_element(By.XPATH, "div").text}''')
#                 # write the name of the trent center floor to the assetInfo file
#                 assetInfoFile.write(
#                     f''' - {browser.find_elements(By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")[trentCenterFloorIndex].find_element(By.XPATH, "div").text}\n''')

#                 # click on the trent center floor
#                 browser.find_elements(
#                     By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")[trentCenterFloorIndex].click()

#                 # wait for the trent center floor to load
#                 while len(browser.find_elements(By.XPATH, "//div[@class='roomholder']")) == 0:
#                     # wait for the trent center floor to load
#                     sleep(10)

#                 # wait for the trent center floor to load
#                 sleep(10)

#             # loop through all trent center floor rooms
#             for trentCenterFloorRoomIndex in range(len(browser.find_elements(By.XPATH, "//div[@class='roomholder']"))):
#                 # wait for the trent center floor to load
#                 while len(browser.find_elements(By.XPATH, "//div[@class='roomholder']")) == 0:
#                     # wait for the trent center floor to load
#                     sleep(10)

#                 # wait for the trent center floor to load
#                 sleep(10)

#                 # print the name of the trent center floor room
#                 print(
#                     f'''    - {browser.find_elements(By.XPATH, "//div[@class='roomholder']")[trentCenterFloorRoomIndex].find_element(By.XPATH, "div[@class='roomtitle']").text}''')
#                 # write the name of the trent center floor room to the assetInfo file
#                 assetInfoFile.write(
#                     f'''    - {browser.find_elements(By.XPATH, "//div[@class='roomholder']")[trentCenterFloorRoomIndex].find_element(By.XPATH, "div[@class='roomtitle']").text}\n''')

#                 # open a new window for the trent room find page and go to the trent room find page
#                 browser.execute_script(
#                     f'''window.open("{ browser.find_elements(By.XPATH, "//div[@class='roomholder']")[trentCenterFloorRoomIndex].find_element(By.XPATH, """div[@class='roomdirections']/a""").get_attribute("""href""")}");''')

#                 # switch to the new window
#                 browser.switch_to.window(browser.window_handles[1])

#                 # wait for the trent room find page to load
#                 while len(browser.find_elements(By.XPATH, "//ul[@id='steplist2']/li")) == 0 and len(browser.find_elements(By.XPATH, "//div[@id='layoutwithbackdrop']/section/div")) == 0:
#                     # wait for the trent room find page to load
#                     sleep(10)
#                 # wait for the trent room find page to load
#                 sleep(10)

#                 # print the number of steps
#                 print(f'''       - {len(browser.find_elements(By.XPATH, "//ul[@id='steplist2']/li"))} Step{"" if len(browser.find_elements(By.XPATH, "//ul[@id='steplist2']/li")) == 1 else "s"}''' if len(browser.find_elements(
#                     By.XPATH, "//ul[@id='steplist2']/li")) != 0 else f'''       - {len(browser.find_elements(By.XPATH, "//div[@id='layoutwithbackdrop']/section/div"))} Step{"" if len(browser.find_elements(By.XPATH, "//div[@id='layoutwithbackdrop']/section/div")) == 1 else "s"}''')
#                 # write the number of steps to the assetInfo file
#                 assetInfoFile.write(f'''       - {len(browser.find_elements(By.XPATH, "//ul[@id='steplist2']/li"))} Step{"" if len(browser.find_elements(By.XPATH, "//ul[@id='steplist2']/li")) == 1 else "s"}{escapeCharacter}''' if len(browser.find_elements(
#                     By.XPATH, "//ul[@id='steplist2']/li")) != 0 else f'''       - {len(browser.find_elements(By.XPATH, "//div[@id='layoutwithbackdrop']/section/div"))} Step{"" if len(browser.find_elements(By.XPATH, "//div[@id='layoutwithbackdrop']/section/div")) == 1 else "s"}{escapeCharacter}''')
#                 # iterate through all steps
#                 for trentCenterFloorRoomFindStepDescriptionIndex in range(len(browser.find_elements(By.XPATH, "//div[@id='layoutwithbackdrop']/section/div/div/div[@id='description']" if len(browser.find_elements(By.XPATH, "//div[@id='layoutwithbackdrop']/section/div/div/div[@id='description']")) != 0 else "//div[@id='layoutwithbackdrop']/div/section/div/div/div[@id='description']"))):
#                     # print the step number
#                     print(
#                         f'         - Step {trentCenterFloorRoomFindStepDescriptionIndex + 1}')
#                     # write the step number to the assetInfo file
#                     assetInfoFile.write(
#                         f'         - Step {trentCenterFloorRoomFindStepDescriptionIndex + 1}\n')
#                     # print the step description
#                     print(
#                         f'''            - {browser.find_elements(By.XPATH, "//div[@id='layoutwithbackdrop']/section/div/div/div[@id='description']" if len(browser.find_elements(By.XPATH, "//div[@id='layoutwithbackdrop']/section/div/div/div[@id='description']")) != 0 else "//div[@id='layoutwithbackdrop']/div/section/div/div/div[@id='description']")[trentCenterFloorRoomFindStepDescriptionIndex].text.split(escapeCharacter)[0]}''')
#                     # write the step description to the assetInfo file
#                     assetInfoFile.write(
#                         f"""            - {browser.find_elements(By.XPATH, "//div[@id='layoutwithbackdrop']/section/div/div/div[@id='description']" if len(browser.find_elements(By.XPATH, "//div[@id='layoutwithbackdrop']/section/div/div/div[@id='description']")) != 0 else "//div[@id='layoutwithbackdrop']/div/section/div/div/div[@id='description']")[trentCenterFloorRoomFindStepDescriptionIndex].text.split(escapeCharacter)[0]}{escapeCharacter}""")

#                     # get the photo src link
#                     photosToDownloadSrc = browser.find_elements(By.XPATH, "//div[@id='layoutwithbackdrop']/section/div/img" if len(browser.find_elements(By.XPATH, "//div[@id='layoutwithbackdrop']/section/div/img")) != 0 else "//div[@id='layoutwithbackdrop']/div/section/div/img")[
#                         trentCenterFloorRoomFindStepDescriptionIndex].get_attribute("src")

#                     # iterate through all resolutions
#                     for i in range(4):
#                         # change the resolution
#                         photosToDownloadSrcSplit = photosToDownloadSrc.split(
#                             "/")
#                         photosToDownloadSrcSplit[-2] = "review" if i == 0 else "small" if i == 1 else "720" if i == 2 else "1080"

#                         # check if the photo exists
#                         response = get("/".join(photosToDownloadSrcSplit))
#                         if response.status_code == 200:
#                             # add the photo to the list of photos to download
#                             photosToDownload.append(
#                                 "/".join(photosToDownloadSrcSplit))
#                             # print the photo src link
#                             print(
#                                 f"            - {'/'.join(photosToDownloadSrcSplit)}")
#                             # write the photo src link to the assetInfo file
#                             assetInfoFile.write(
#                                 f"            - {'/'.join(photosToDownloadSrcSplit)}{escapeCharacter}")
#                         else:
#                             # don't add the photo to the list of photos to download
#                             pass

#                 # go back to the main page
#                 browser.close()

#                 # wait for the main page to load
#                 sleep(10)

#                 # switch to the main page
#                 browser.switch_to.window(browser.window_handles[0])

#                 # wait for the main page to load
#                 while len(browser.find_elements(By.XPATH, "//div[@id='tab1']/div[@class='buttoncontainer']")) == 0:
#                     # press ctrl + home and hold
#                     browser.find_elements(
#                         By.XPATH, "//body")[0].send_keys(Keys.CONTROL)
#                     # wait 0.1 seconds
#                     sleep(0.1)
#                     # release ctrl + home
#                     browser.find_elements(
#                         By.XPATH, "//body")[0].send_keys(Keys.HOME)
#                     # wait 10 seconds for the page to load
#                     sleep(10)

#                 waitForTrentCenterFloor = True

#                 # click on the trent center
#                 browser.find_elements(
#                     By.XPATH, "//div[@id='tab1']/div[@class='buttoncontainer']")[trentCenterIndex].click()
#                 # wait for the trent center to load
#                 while (len(browser.find_elements(By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")) if len(browser.find_elements(By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")) != 0 and len(browser.find_elements(By.XPATH, "//div[@class='roomholder']")) == 0 else 1) == 0:
#                     # wait 10 seconds for the page to load
#                     sleep(10)
#                 else:
#                     # if (len(browser.find_elements(By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")) if len(browser.find_elements(By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")) != 0 and len(browser.find_elements(By.XPATH, "//div[@class='roomholder']")) == 0 else 1) != 0:
#                     # load trent center rooms if no floors are found but rooms are found
#                     if len(browser.find_elements(By.XPATH, "//div[@class='roomholder']")) != 0 and len(browser.find_elements(By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")) == 0:
#                         trentCenterFloorIndex = 0
#                         waitForTrentCenterFloor = False

#                 # if the trent center floor is found
#                 if waitForTrentCenterFloor:
#                     # click on the trent center floor
#                     browser.find_elements(
#                         By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")[trentCenterFloorIndex].click()

#                 # wait for the trent center floor to load
#                 while len(browser.find_elements(By.XPATH, "//div[@class='roomholder']")) == 0 and len(browser.find_elements(By.XPATH, "//table[@class='notablestyle floorfind growfloorleft']/tbody/tr/td[not(@class)]")) == 0:
#                     # wait 10 seconds for the page to load
#                     sleep(10)

#     # close the browser
#     browser.quit()


# # initialize the list of photos to download
# photosToDownload = []

# # write the photos to download to the assetInfo file
# with open('assetInfo.txt', 'r') as assetInfoFile:
#     for line in assetInfoFile.readlines():
#         if "https://" in line:
#             # if not exists(f"./assets/images/find/{line.strip()[2:].split('/')[-2]}/{line.strip()[2:].split('/')[-1]}"):
#             photosToDownload.append(line.strip()[2:].split('/')[-1])

# # read the photos to download from the assetUrlsInfo file
# with open('assetUrlsInfo.txt', 'r') as assetUrlsInfoFile:
#     # iterate through all lines in the assetUrlsInfo file
#     for line in assetUrlsInfoFile.readlines():
#         # add the photo to download to the list of photos to download
#         photosToDownload.append(line.strip())

# remove duplicates
photosToDownload = list(set(photosToDownload))

# print(photosToDownload)

# # print the number of photos to download and the number of photos downloaded
# print(f'{len(photosToDownload)} images to download')
# print(f'{round((len(completedPhotos)/len(photosToDownload)), 4) * 100}% completed, {len(completedPhotos)} downloaded, downloading {str(None)}                                                                            ', end='\r', flush=True)


# # # input('Press Return To Continue...')

# # write the photos to download to the assetInfoUrls file with the photos to download asset uris for flutter
# with open('assetInfoUrls.txt', 'w') as assetInfoUrlsFile:
#     # download the photos
#     for photoToDownloadIndex in range(len(photosToDownload)):
#         assetInfoUrlsFile.write(
#             f"{photosToDownload[photoToDownloadIndex]}{escapeCharacter}")
#         # get the photo url
#         url = photosToDownload[photoToDownloadIndex]
#         # get the photo save path
#         save_path = f"./assets/images/find/{url.split('/')[-2]}/{url.split('/')[-1]}"
#         assetInfoUrlsFile.write(f"{save_path}{escapeCharacter}")
#         # print the number of photos to download and the number of photos downloaded
#         print(f'{round((len(completedPhotos)/len(photosToDownload)), 4) * 100}% completed, {len(completedPhotos)} downloaded, downloading {save_path}                                                                            ', end='\r', flush=True)
#         # download the photo if it doesn't exist
#         if not exists(save_path):
#             # download the photo
#             download_image(url, save_path)

assetInfoFileLines: str = ""

with open('assetInfo.txt', 'r') as assetInfoFile:
    assetInfoFileLines = assetInfoFile.readlines()

with open('assetInfo.txt', 'w') as assetInfoFile:
    for line in assetInfoFileLines:
        if "            - https://" in line:
            assetInfoFile.write(line)
            assetInfoFile.write(f"            - ./assets/images/find/{line.strip()[2:].split('/')[-2]}/{line.strip()[2:].split('/')[-1]}\n")
        else:
            assetInfoFile.write(line)
