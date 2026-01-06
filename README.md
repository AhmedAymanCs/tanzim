# Tanzim App

A Flutter application for managing first app launch, onboarding flow, and user preferences.

## Features

- Detects first app launch
- Shows onboarding screen for first-time users
- Stores preferences using SharedPreferences
- Implements Clean Architecture with Core Layer
- Dependency Injection using get_it

## Getting Started

### Prerequisites

- Flutter >= 3.0
- Dart SDK
- Android Studio or VS Code
- Emulator or connected device


Usage
Launch the app

If it’s your first time, the onboarding screen will appear

After finishing onboarding, preferences are stored

Subsequent launches open the Home screen directly



Folder Structure

lib/
├── core/
│   ├── di/                  # Service locator using get_it
│   └── preferences/         # AppPreferences abstraction & implementation
├── features/
│   └── splash/
│       ├── presentation/    # SplashScreen & Cubit
│       └── domain/          # (Optional) UseCases
└── main.dart



Author
Ahmed Ayman

GitHub: GitHub: [AhmedAymanCs](https://github.com/AhmedAymanCs)

License
This project is licensed under the MIT License.



### Installation

```bash
git clone https://github.com/AhmedAymanCs/tanzim.git
cd tanzim
flutter pub get
flutter run
