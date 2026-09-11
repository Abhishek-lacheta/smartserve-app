# LuxeLoft (SmartServe)

A professional, cross-platform e-commerce Flutter application designed to provide a seamless shopping experience. It features user authentication, product categorization, dynamic data loading from Firebase, and a clean, responsive UI built with **Clean Architecture** principles.

## Overview

LuxeLoft is a production-oriented mobile application that demonstrates modern Flutter development practices. It implements a scalable layered architecture using the Repository pattern, relies on `flutter_bloc` for robust state management, and integrates seamlessly with Firebase for backend services. The application is structured to separate business logic from UI, making it highly maintainable and testable—a perfect showcase of a solid engineering foundation.

## 🚀 Key Features

* 🔐 **Authentication & User Management**: Secure Google Sign-In integration, Phone/OTP, and User Data storage.
* 📱 **Custom UI System**: Scalable, reusable, and responsive UI components (`ProductCard`, `CustomButton`, etc.).
* 🔥 **Firebase Integration**: Real-time Cloud Firestore & Firebase Auth.
* 🔄 **Predictable State Management**: Event-driven BLoC Pattern.
* 🛒 **Dynamic Home Feed**: Top categories, product listings, and promotional banners.
* 🚀 **Splash and Onboarding**: Engaging first-time user experiences.
* 📦 **Automated Data Seeding**: Firestore seeding mechanism for initial setup.
* 🛡️ **Graceful Error Handling**: Functional programming paradigms (using `fpdart`) to manage errors elegantly without relying on try-catch in the UI layer.

## 📸 Screenshots

*(Add your screenshots to the `screenshots` folder)*

| Splash Screen | Login | OTP Verification | Home Dashboard |
|:---:|:---:|:---:|:---:|
| ![Splash](screenshots/splash.png) | ![Login](screenshots/login.png) | ![OTP Verification](screenshots/otp.png) | ![Home Dashboard](screenshots/home.png) |

## 🛠️ Tech Stack

| Technology | Usage |
| --- | --- |
| **Flutter / Dart** | Cross-platform application development |
| **`flutter_bloc`** | Predictable state management |
| **`get_it` & `injectable`** | Dependency Injection for decoupling layers |
| **`fpdart`** | Functional programming paradigms (`Either` for error handling) |
| **`equatable`** | Efficient value equality for State/Entity comparisons |
| **Firebase Auth** | Secure user authentication |
| **Cloud Firestore** | NoSQL cloud database for products, categories, and users |

## 🏗️ Architecture

The project strictly follows **Clean Architecture** utilizing the **Repository Pattern** and **Dependency Injection**. This ensures a clean separation of concerns:

* **Presentation Layer**: UI screens and BLoCs for handling user interactions and state changes.
* **Domain Layer**: Core business logic (Usecases) and entities, entirely independent of the outer layers.
* **Data Layer**: Repositories abstracting the data sources (Firebase vs Mock), keeping the UI agnostic of data origins.
* **Core**: App-wide constants, theming, DI configuration, and shared utilities.

### Folder Structure Overview

```text
lib/
├── core/           # App theme, core utilities, base usecases, and DI setup
├── data/           # Models, Repositories implementations, and DataSources
├── domain/         # Entities, repository interfaces, and business logic (Usecases)
├── presentation/   # BLoC state management for Auth, Home, etc.
├── screens/        # UI screens (Splash, Onboarding, Auth, Home)
└── widgets/        # Reusable UI components (Buttons, Cards, TextFields)
```

## 🧩 Application Modules

* **Authentication Module**: Manages user login state, securely handling Google Sign-In and persisting user sessions and profiles in Firestore.
* **Home Module**: Fetches and displays dynamic content including top categories, product listings, and promotional banners.
* **Onboarding Module**: Guides new users through the app's value proposition.
* **Core UI/Theme**: Provides a consistent design language across the application using custom themes and reusable widget components.

## 💻 Setup & Installation

### Prerequisites
- Flutter SDK (latest stable)
- Dart SDK

1. **Clone repository**
   ```bash
   git clone https://github.com/Abhishek-lacheta/smartserve.git
   cd smartserve
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the Code Generator** (for Dependency Injection)
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Firebase Configuration**
   This project relies on Firebase. Ensure the `firebase_options.dart` and native platform configurations (like `google-services.json` or `GoogleService-Info.plist`) are configured to connect to your Firebase project.

5. **Run the application**
   ```bash
   flutter run
   ```

## 🏗️ Build

To build a release APK for Android:

```bash
flutter build apk --release
```

## 👨‍💻 Developer Notes & Highlights

* **Production-Ready**: Demonstrates an understanding of mid-to-senior level separation of concerns.
* **Clean Code**: Adheres to SOLID principles with easily mockable interfaces and injected dependencies.
* **Scalable State**: `flutter_bloc` ensures the app can scale without performance bottlenecks.
* **Functional Error Handling**: Usage of `Either` eliminates hidden exceptions and forces handling of failure states.

## Disclaimer

> This repository is provided for portfolio and technical demonstration purposes. Proprietary source code, credentials, private APIs, and confidential business logic are excluded.

---

**Author:** Abhishek Lacheta  
[GitHub Profile](https://github.com/Abhishek-lacheta)
