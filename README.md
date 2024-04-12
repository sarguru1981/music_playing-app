# Music Streaming App

A music streaming app that allows users to browse a collection of songs, play them, and favorite their favorites.

## Screens

### Pages

1. Splash page
2. Login Page
3. Home Page
4. Details Page

### 1. Splash Page

The Splash page displays for 2 seconds and automatically move to registration page if user is not registered. Else move to the home page.

| <img src="assets/screenshots/splash.png" alt="Splash" width="170" height="300"> |
|:-------------------------------------------------------------------------------:|
|                                  Splash Screen                                  |

### 2. Login Page

The login page allows users to sign up or log in using their email and password. Firebase Authentication is used for secure user authentication, enabling simultaneous login from multiple devices.


| <img src="assets/screenshots/signup.png" alt="Signup" width="170" height="300"> | <img src="assets/screenshots/login.png" alt="Login" width="170" height="300"> |
|:-------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------:|
|                                   Signup Page                                   |                                  Login Page                                   |


| <img src="assets/screenshots/registering.png" alt="registering" width="170" height="300"> | <img src="assets/screenshots/firebase_authentication.png" alt="Auth" width="170" height="300"> |
|:-----------------------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------:|
|                                        Registering                                        |                                    Firebase Authentication                                     |


### 3. Home Page

The home page displays a list of songs fetched from local assets, along with a search bar. It presents more than 10 songs and supports searching by song names or descriptions. Users can navigate to the details page by selecting a song and also favorite songs directly from this page. Data caching is implemented using Shared Preferences.

| <img src="assets/screenshots/home_page.png" alt="Home" width="170" height="300"> | <img src="assets/screenshots/search.png" alt="search" width="170" height="300"> |
|:--------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------:|
|                                    Home Page                                     |                               Search in Home page                               |



### 4. Details Page

The details page provides information about a selected song, including its name, movie name (if applicable), and controls for playing and favoriting the song. Clicking the play button initiates playback, changing to a pause button during playback, and to a retry button upon completion.

| <img src="assets/screenshots/detail_page.png" alt="Detail" width="170" height="300"> |
|:------------------------------------------------------------------------------------:|
|                                     Detail Page                                      |

## Favoriting and Syncing Requirements

The app ensures that favorited songs remain consistent across multiple devices when a user is logged in. Firebase Realtime Database is used for syncing favorited songs, allowing offline changes to be saved and synced when the user goes online.

| <img src="assets/screenshots/home_favorite.png" alt="home favorite" width="170" height="300"> | <img src="assets/screenshots/detail_favorite.png" alt="detail favorite" width="170" height="300"> |
|:---------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------------------:|
|                                     Favorite in Home Page                                     |                                      Favorite in Detail Page                                      |


| <img src="assets/screenshots/firebase_realtime_db_favoritelist.png" alt="db" width="170" height="300"> |
|:------------------------------------------------------------------------------------------------------:|
|                                   Firebase Realtime DB Favorite List                                   |

## General Requirements

1. The app incorporates hero animation for smooth transitions between the list and details screens.
2. It boasts an attractive and interactive UI design, with support for dark theme.
3. Code follows SOLID design principles and adheres to clean code guidelines, emphasizing readability and maintainability. Both BLoC and Provider patterns are utilized for state management.


| <img src="assets/screenshots/drawer_setting.png" alt="drawer" width="170" height="300"> |
|:---------------------------------------------------------------------------------------:|
|                                        Settings                                         |


| <img src="assets/screenshots/settings_lightmode.png" alt="light mode" width="170" height="300"> | <img src="assets/screenshots/settings_darkmode.png" alt="dark mode" width="170" height="300"> |
|:-----------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------:|
|                                        Light Mode Theme                                         |                                        Dark Mode Theme                                        |
