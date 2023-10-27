# Dog API Deliveristo Test Project

Introducing Dog API Deliveristo App: Your iOS/Android app to fetch the latest breed from an API. Crafted with Flutter, this app, built on the MVVM architecture, empowers you with to fetch Dog pictures according to breed and sub-breed. Explore an array of features, select breed or sub-breed and get your respective images displayed in a cached network image.

## Demo Video
[https://github.com/MrJai/Deliveristo-Flutter-App/issues/1#issue-1965106740](https://github.com/MrJai/Deliveristo-Flutter-App/assets/3047049/d2be84eb-c351-4a34-813b-21bbd05a9a28
)

## Requirements
Flutter & Dart

## Architecture

The app is built using the Model-View-ViewModel (MVVM) architecture pattern. Here's a brief overview of the different layers:

- Model: The data layer that represents the app's data and business logic. In this app, the models are the API Response, PhotosModel and AllBreedsModel.
- View: The UI layer that displays the data to the user and handles user input. In this app, the views are implemented using Stacked Views which inturn use Provider.
- ViewModel: The glue layer that connects the view and the model. The view model handles the business logic and provides the data to the view. The viewmodel access the services such as API Service and Photo Service.
- Services: Services are used to access other services. In this app, the api_service calls the dio_service.


## Usage

1. Clone the repository locally or use the template for your own projects:

2. Install dependencies using the following command:

```bash
flutter pub get
```

3. Generate files with `build_runner`:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app on your emulator of choice (simulator in case of iOS):

```
flutter run
```

## Folder Structure

```
lib/
|- api/
|- app/
|- constants/
|- enums/
|- exceptions/
|- models/
|- services
|- ui
  |- [screen_name]/
  |- shared/
|- utils
|- main.dart
```


## Custom Features
- Error handling to handle exceptions in case of API failure.
- Fetching data from an API server directly and displaying it in a cached format.
- Refresh handlers to call the API.
- Built in navigation service. No custom handlers required.
