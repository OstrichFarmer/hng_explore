
![2022-11-14 11-12-47 High Res Screenshot](https://user-images.githubusercontent.com/21319483/201634205-92ab1b98-c176-42a0-8145-a50f05f40769.png)
![2022-11-14 11-12-37 High Res Screenshot](https://user-images.githubusercontent.com/21319483/201634215-54cc3c51-ad62-4e24-98c6-f6f16a044298.png)
![2022-11-14 11-12-32 High Res Screenshot](https://user-images.githubusercontent.com/21319483/201634219-ae9bb1d0-29ba-4d0f-addc-b11a0d24966b.png)
![2022-11-14 11-12-25 High Res Screenshot](https://user-images.githubusercontent.com/21319483/201634221-0dd0446c-920c-4e4d-8372-dbeabfe0a417.png)
![2022-11-14 11-12-16 High Res Screenshot](https://user-images.githubusercontent.com/21319483/201634223-43654b77-8010-4f56-8d75-d8dd74ad3aca.png)

APP DESCRIPTION
HNG Explore is a mobile app that shows a list of countries and the details about them. 
On launch the app goes straight to the page that shows a list of all the countries.
The app supports dark mode and light mode with a  button on the top left where you can toggle between the dark and light mode.
This application allows user to be able to search through the list for any particular country of their choice 
This app arranges the acountries in an alphabetical order

PLUGIN USED
carousel_slider: I used it to make the image in the details screen slidable
http: this was used to fetch data from the API
flutter_screenutil:Used for dynamic response 
shared_preferences: used to store local data to avoid clearing it from memory on closing the app. I used it to hold the language setting
provider: used the provider state management to pass data across the app.
flutter_svg: for displaying .svg images
get: I used GetX for navigation and also for dynamic rendering of widget
GoogleFonts: I used it to fetch fonts from google fonts

The font used was 'Axiforma' and Montserrat,
consts.dart: contains the constant apiURL
styles.dart: contains the Textstyling used in the app
lang.dart: the localization class used to change languages


network_service: this is where the apiUrl gets parsed and http.Get or other requestType (Put, Post) are called
network_enum.dart: this has the enum for network error types too help in handling errors
network_helper: this helps identifying and filtering the type of error from the correct response to aid error debugging

The provider folder contains the countryProvider and themeNotifier provider, here the country data gotten from the network call is called so the data is accessible throughout the app.

Thw screens folder contains the screens 
The repository folder contains the countrylistrepo which fetches the data and handle the sorting alphabetically 
The widgets folder contains reusable widgets

CHALLENGES
The first challenge I had was the deadline that was shifted forward. I panicked and it resulted to making a couple of mistakes which I later fixed after the deadline was extended
I had a couple of challenges while trying to fetch data from the API and I tried to resolve it by going online and reading almost all flutter notes and watching video tutorials out there. 
If I had a little more time I'd have implemented the automatic switching to dark mode and also finish up the funcionality of the filter by continents. 

Appetize Link: https://appetize.io/app/j4p4atuv2pmpzxjmfbuaaijlzq?device=pixel4&osVersion=11.0&scale=75
Google drive Link: https://drive.google.com/drive/folders/1soVmk7bOlP0cqIoun2Kq3_ZcHmCaIRZy?usp=share_link
