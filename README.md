# LuxeLoft (SmartServe)

A professional, cross-platform e-commerce Flutter application designed to provide a seamless shopping experience. It features user authentication, product categorization, dynamic data loading from Firebase, and a clean, responsive UI.

## Overview

LuxeLoft is a production-oriented mobile application that demonstrates modern Flutter development practices. It implements a scalable layered architecture using the Repository pattern, relies on `flutter_bloc` for robust state management, and integrates seamlessly with Firebase for backend services. The application is structured to separate business logic from UI, making it highly maintainable and testable.

## Key Features

* 🔐 Authentication & user management (Google Sign-In integration & User Data storage)
* 📱 Responsive and custom Flutter UI (Reusable widgets, custom theming)
* 🔥 Firebase Integration (Firebase Auth & Cloud Firestore)
* 🔄 Robust State Management (BLoC Pattern)
* 🛒 Dynamic Home Feed (Top categories, product listings)
* 🚀 Splash and Onboarding experiences
* 📦 Automated Firestore Data Seeding (for initial setup)

## 📸 Screenshots

| Splash Screen | Welcome | Login | OTP Verification | Home Dashboard |
|:---:|:---:|:---:|:---:|:---:|
| ![Splash](lib/screenshots/splash.jpg) | ![Welcome](lib/screenshots/onboarding.jpg) | ![Login](lib/screenshots/login.jpg) | ![OTP Verification](lib/screenshots/otp.jpg) | ![Home Dashboard](lib/screenshots/Home.jpg) |

## Tech Stack

| Technology | Usage |
| --- | --- |
| Flutter | Cross-platform mobile application development |
| Dart | Application programming language |
| `flutter_bloc` | Predictable state management |
| Firebase Auth | Secure user authentication (Google Sign-In) |
| Cloud Firestore | NoSQL cloud database for products, categories, and users |
| Git | Version control |

## Architecture

The project follows a layered architecture utilizing the **Repository Pattern** and **Dependency Injection** (via `flutter_bloc` providers). This ensures a clean separation of concerns:

* **Presentation Layer**: UI screens and BLoCs for handling user interactions and state changes.
* **Domain/Data Layer**: Repositories abstracting the data sources, and models defining the data structure.
* **Data Sources**: Firebase integration for remote data, and mock data for fallback/testing.
* **Core**: App-wide constants, theming, and shared utilities.

```text
lib/
├── core/           # App theme and shared configurations
├── data/           # Models, Repositories, and DataSources (Firestore, Auth)
├── mock_data/      # Fallback/Seed data for development
├── presentation/   # BLoC state management for Auth and Home features
├── screens/        # UI screens (Splash, Onboarding, Auth, Home)
├── widgets/        # Reusable UI components (Buttons, Cards, TextFields)
└── main.dart       # App entry point & Dependency Injection setup
```

## Application Modules

* **Authentication Module**: Manages user login state, securely handling Google Sign-In and persisting user sessions and profiles in Firestore.
* **Home Module**: Fetches and displays dynamic content including top categories, product listings, and promotional banners.
* **Onboarding Module**: Guides new users through the app's value proposition.
* **Core UI/Theme**: Provides a consistent design language across the application using custom themes and reusable widget components.

## Technical Highlights

* **State Management**: Implemented `flutter_bloc` for predictable, event-driven state transitions.
* **Repository Pattern**: Abstracted data fetching (Firestore vs. Mock) behind Repositories, keeping the UI agnostic of data origins.
* **Dependency Injection**: Used `RepositoryProvider` and `BlocProvider` at the app root for clean dependency management.
* **Firebase Integration**: Secure Google Authentication and real-time Firestore data access.
* **Data Seeding Logic**: Includes an automatic seeding mechanism (`seedFirestoreIfEmpty`) to populate Firestore with initial product and category data.
* **Reusable Components**: Extracted UI elements into highly reusable widgets (e.g., `SocialLoginButton`, `ProductCard`, `CustomTextField`).
* **Error Handling**: Graceful error capturing in repositories and state updates for UI feedback.

## Setup & Installation

1. **Clone repository**
   ```bash
   git clone https://github.com/Abhishek-lacheta/smartserve.git
   cd smartserve
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Configuration**
   This project relies on Firebase. The `firebase_options.dart` and native platform configurations (like `google-services.json` or `GoogleService-Info.plist`) are required for the app to connect to your Firebase project.

4. **Run the application**
   ```bash
   flutter run
   ```

## Build

To build a release APK for Android:

```bash
flutter build apk --release
```

## Project Highlights

* Production-oriented Flutter development
* Clean separation of responsibilities
* Scalable state management using BLoC
* Real-world API/Backend integration with Firebase
* Reusable and modular UI components

## Disclaimer

> This repository is provided for portfolio and technical demonstration purposes. Proprietary source code, credentials, private APIs, and confidential business logic are excluded.

---

**Author:** Abhishek Lacheta  
[GitHub Profile](https://github.com/Abhishek-lacheta)
