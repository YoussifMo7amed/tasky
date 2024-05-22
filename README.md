# tasky

Tasky

![ICON (1)](https://github.com/YoussifMo7amed/tasky/assets/152876266/c85adbb8-ce20-4d74-baa5-0380bf45e8a0)
Description

A well-organized and efficient task management application built using Flutter to help users stay organized and on top of their daily tasks.

Features

Create, view, and manage tasks
Mark tasks as completed

Secure data storage using SharedPreferences
Clean architecture for better maintainability
Technologies

Flutter: Cross-platform mobile app framework
Dio/Retrofit: HTTP client libraries for making API requests (choose one)
Freezed: Code generation for data classes and serialization/deserialization
Bloc: State management pattern for predictable and reactive UIs
Clean Architecture: Separation of concerns for better testability and maintainability
SharedPreferences: Securely store user data on the device
Getting Started
1-Clone the repository:

Bash
git clone https://github.com/<your-username>/Tasky.git

2-Install dependencies:
Bash
cd Tasky
flutter pub get
Architecture
This application follows the principles of clean architecture to achieve separation of concerns, testability, and maintainability. Key components include:
Core Folder:

This folder likely holds essential application-wide components that are not feature-specific.

di (Dependency Injection): This subfolder might contain a dependency injection mechanism (not directly shown in the code snippet) for managing dependencies throughout the app.

helper (Utility Layer): This subfolder could include reusable utility functions or classes used across various features.

loading (UI Component): This subfolder might contain a loading indicator or UI element for displaying loading states.

routes (Routing Layer): This subfolder likely manages app navigation. It might contain files like app_router.dart, base_routes.dart, and routers.dart that define routes and handle routing logic.
service (Data Access Layer): This subfolder could encompass data access logic.

Api (External Data): This section might interact with an external API using Dio (or Retrofit) for fetching and processing data.

api_result.dart (Data Structure): This file could define a data structure (class) for representing API responses.

api_service.dart (API Client): This file might contain the API client implementation using Dio (or Retrofit) for making API calls.

dio_factory.dart (Dependency Injection): This file could be related to dependency injection for providing the Dio instance (assuming Dio is used).

endpoints.dart (API Endpoints): This file might define API endpoint URLs used by the API service.

shared_pref (Data Persistence Layer): This subfolder could handle local data storage using SharedPreferences.

pref_keys.dart (Configuration): This file might contain constants or keys used for storing data in SharedPreferences.

shared_pref.dart (SharedPreferences Service): This file might implement the logic for saving and retrieving data using SharedPreferences.

Features Folder:

Encapsulates functionalities specific to a particular area of the app.

 contains subfolders for further organization based on the feature's requirements.
auth (Potential Feature):

This subfolder  handles authentication-related logic.
It  contains:
bloc (State Management): Blocs manage the state and logic for user login, registration, etc. (e.g., auth_bloc.dart).

data (Data Layer):
models (Data Structures): Models define data structures representing user information (e.g., login_request_body.dart, login_response.dart).

repository (Data Abstraction): The repository abstracts data access from different sources (e.g., auth_repository.dart). It might interact with an API service (in core) or local storage (also in core).

presentation (Presentation Layer):

bloc (State Management): Bloc events and states specific to authentication (e.g., auth_event.dart, auth_state.dart).

refactors (Utility Layer): Reusable logic specific to authentication (optional, e.g., login_body.dart).

screens (UI Components): Screens for login, registration, or other authentication-related UIs (e.g., login_screen.dart).

data (Potential Feature):

This subfolder might handle core data management logic for the app (not necessarily specific to authentication).

It could contain similar subfolders as auth, depending on its functionalities:

bloc (State Management): Blocs for managing data-related state and logic.

models (Data Structures): Models representing data entities used throughout the app.

repository (Data Abstraction): Repository for abstracting data access from different sources (API, SharedPreferences).

presentation (Presentation Layer):

bloc (State Management): Bloc events and states related to data management.

screens (UI Components): Screens for displaying or managing data (optional, depending on the specific data).

To Use The App😉❤️
first you will have the onboarding 
![Screenshot 2024-05-22 131942](https://github.com/YoussifMo7amed/tasky/assets/152876266/b2920206-9b1e-40af-a5c5-28bfbcb15f0b)

Then Login You can USE This :
"username": "atuny0",
"password": "9uQFF1Lh",

![Screenshot 2024-05-22 132540](https://github.com/YoussifMo7amed/tasky/assets/152876266/52708d3e-bc93-4a77-9d26-b3fbbb8e0c15)



Then The Home Screen 
First There is the All Tasks With Limits and Skip 10 & 10

![Screenshot 2024-05-22 132629](https://github.com/YoussifMo7amed/tasky/assets/152876266/5f2deb2d-9c8c-4946-8fef-ffd428c2d145)

 

Then The Tasks OfThe user he can add or delete or Update Task To Conplete 

![Screenshot 2024-05-22 132647](https://github.com/YoussifMo7amed/tasky/assets/152876266/d6095264-50bc-4ad1-b21e-db138bbfb347)

Then The Completed Tasks

![Screenshot 2024-05-22 132654](https://github.com/YoussifMo7amed/tasky/assets/152876266/2168ccd3-c175-4505-9a63-7874d35b59d8)





