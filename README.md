# FakeStore E-Commerce App (Flutter Training Project)

A fake e-commerce mobile app built with Flutter for training and learning purposes.
This project integrates modern Flutter best practices such as Clean Architecture, SOLID principles, BLoC State Management, Dependency Injection, Code Generation, and reusable UI components.

The app consumes data from the [Fake Store API](https://fakestoreapi.com/) to simulate a real shopping experience.

---

## 🚀 Features

* 🏗 **Clean Architecture + SOLID** — clear separation of concerns, testable and maintainable codebase.
* 🔄 **BLoC State Management** — predictable state handling across the app.
* 🛠 **Dependency Injection** — service locators for scalable architecture.
* 📦 **Reusable Components** — modular UI widgets and utilities.
* 🌐 **API Integration with Dio** — networking with proper **error handling**.
* 🧊 **Freezed & Json Serializable** — code generation for data classes and JSON parsing.
* 💉 **Injectable & Retrofit** — code generation for dependency injection and Dio API classes.
* 🖼 **Cached Network Images** — optimized image loading & caching.
* 💾 **Shared Preferences** — persistent local storage for user/session data.
* 🎨 **SVGs optimized as vector graphics** — sharp, scalable icons and illustrations.
* ✨ **Skeletonizer (Shimmer)** — skeleton loading animations for a smoother UX.
* 📱 **Responsive UI** — works across multiple screen sizes.

---

## 🛠 Tech Stack

* **Framework:** [Flutter](https://flutter.dev/)
* **State Management:** [flutter\_bloc](https://pub.dev/packages/flutter_bloc)
* **Networking:** [Dio](https://pub.dev/packages/dio)
* **Code Generation:** [Freezed](https://pub.dev/packages/freezed), [json\_serializable](https://pub.dev/packages/json_serializable), [retrofit](https://pub.dev/packages/retrofit), [injectable](https://pub.dev/packages/injectable), [build\_runner](https://pub.dev/packages/build_runner)
* **Storage:** [shared\_preferences](https://pub.dev/packages/shared_preferences)
* **UI/UX:** [cached\_network\_image](https://pub.dev/packages/cached_network_image), [flutter\_svg](https://pub.dev/packages/flutter_svg), [skeletonizer](https://pub.dev/packages/skeletonizer)

---

## 📂 Project Structure (Clean Architecture)

```
lib/
│── core/               # Constants, helpers, error handling, theming
│── features/           # Feature-based modules (products, cart, auth, etc.)
│   ├── data/           # Data sources (API, local storage) & models
│   ├── domain/         # Entities & use cases
│   ├── presentation/   # UI widgets & BLoC state management
│── di/                 # Dependency injection setup
│── main.dart           # App entry point
```

---

## 📷 Screenshots
<div align="center">
<img width="300" alt="Home" src="https://github.com/user-attachments/assets/15c2d27a-6049-4eea-aed8-bdb8f0d92b1d" />
<img width="300" alt="details" src="https://github.com/user-attachments/assets/82914058-fb79-45f6-9bea-be9e5b6d7f7f" />
<img width="300" alt="Cart" src="https://github.com/user-attachments/assets/e0e06231-139e-488d-acd1-f7c6aec3612e" />
<img width="300" alt="Saved" src="https://github.com/user-attachments/assets/0bce4977-9c3e-4422-b073-9543977d0689" />
</div>

---

## ⚙️ Setup & Installation

1. **Clone the repo**

   ```bash
   git clone https://github.com/your-username/fakestore-flutter.git
   cd fakestore-flutter
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run code generation**

   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**

   ```bash
   flutter run
   ```

---

## 🎯 Learning Goals

This project is designed to practice and showcase:

* Applying **Clean Architecture + SOLID** principles in Flutter apps.
* Using **BLoC** effectively for state management.
* Handling **API calls, caching, error handling** in a robust way.
* Building **scalable and maintainable codebases** with code generation.
* Improving **UI/UX** with shimmer, reusable components, and SVGs.

---

## 📜 License

This project is for **educational purposes only**. Feel free to fork and experiment.
