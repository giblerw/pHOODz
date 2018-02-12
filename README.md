![pHOODz](/images/phoodzTitle.png)

![pHOODz](/images/sub.png)

# ![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)![Contributions welcome](https://img.shields.io/badge/contributions-welcome-orange.svg)![License](https://img.shields.io/badge/license-MIT-blue.svg)[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

### App Screenshots
![search](/images/1clip.png)
![list](/images/5clip.png)
![swiper](/images/3clip.png)
![map](/images/4clip.png)

### App Walkthrough
![pHOODz](https://lh3.googleusercontent.com/j1G8GhhFBnsv-RohyfQXtlkWLlcR-6WbOnE1Vt-SB7lgCpwxxP0dE8eXcxZ0Q2YOMB_wng0D9iCRxmFAJTOtncz__CUYAXkAGXJ7YJRJVb8QplVK1mBevMYQSp3tnQElZfpJAtHsv9HL3KdmzS8XMomRZMce9sovj49gzr_-fVd5p3E2EHRjVkRVBQwB9Ni8PD6Sw7pxORkYxk31L47GxVGlexxziwK4eEUqDbLBlgLH3cv5T-mkTkxLM00Yv4sk8VIHDnY9ypmiIJ8EEh1V16bTae3g-MWts6yuEg8S8uFuTPETbaXEcZtJvnJ6w78cKTftkLwvmMuF4hOecE9GPc04C97CsCRbWarBRGmJtHCPhSNlsbOwuk_zW75ZHjPRgd4xX9dWjO8BqOhgT6KcZGSik10A9luF46vScJ-TOWm_o306VwpDnRoMUYa_x_huHQ_EZwBMJEEmn9lanX4Il_r1gpdpjWgH8EkqYIxVqW5kQthPyX0QC0QQ7p2hnutrxe8rU-1yPmHoY3h1Ky8EtMWPtDsOGW0SOSp7zfFKEzzCmvpuZi5BkWiyO35NcR5ld7YxZtbiSoUUcqk5_ZiUEMcUS6B_XRIZ0oWUjBk=w222-h480-no)

### Installation to run Locally

* Download & Install [XCODE](https://developer.apple.com/xcode/)
* Download & Install [Cocoapods](https://guides.cocoapods.org/using/getting-started.html)


```
$ git clone repository
$ cd into project folder pHOODz
madke sure Xcode is closed
$ pod install
open .workspace Xcode file
Run build, in Xcode
```
### Run App Locally on your machine in Xcode

```
with XcodeProject.workspace file open,
plug in your iOS device.
Select your phone from the device drop down menu.
Set up "Signing" under the "general" tab.
Run build; side loads the app onto your device.
```
### Overview
* I wanted to make this app as user friendly as possible. To do that, I wrote as much "behind the screen" as I could. Thanks to Apple's core functionality kits, and Firebase's DB capabilities, user interaction is minimal.
* When the user opens the app, Location Services begin determining your current location. This eliminates the need for the user to waste time entering their current zip code.
* On the home screen, the user can pick from a list of search queries that they have previously saved. This extends to functionality of the app to apply to virtually any common search parameter. Press the "plus" button to add a new search, or click on any from the list.
* After a search button is pressed, for this example I searched for "Places to Eat", the app brings you to the stack of cards. Each card is a result from the search, with the closest results showing first.
* If you do not want to patron the current result, simply Swipe the card Left. If the particular search result suits your fancy, then Swipe the card Right!
* If swiping cards has tired you out, click on the "Search" navigation button on the bottom right to bring up a traditional list view. This view is also useful if the user wants to search within the results found.
* Once a card is Swiped Right, or a list item is selected from the table view, the app is directed to a full screen Map, ready to navigate the user to their requested destination.

## Built With

* ![Xcode](images/xcode-icon.png) - Xcode 9
* ![Swift](images/swift.png) - Xcode 9
* ![Firebase](images/firebase.png) - Xcode 9
* ![google](images/google.png) - Xcode 9


## Built by:

* **Weston Gibler** [Portfolio](https://westongibler.com)

## License
![License](https://img.shields.io/badge/license-MIT-blue.svg)
This project is licensed under the MIT License
