# FakeStore E-Commerce App (Flutter Training Project)

A fake e-commerce mobile app built with Flutter for training and learning purposes.
This project integrates modern Flutter best practices such as Clean Architecture, SOLID principles, BLoC State Management, Dependency Injection, Code Generation, and reusable UI components.

The app uses data from the [Fake Store API](https://fakestoreapi.com/) to simulate a real shopping experience, dessign is inspired by this [Figma Design](https://www.figma.com/design/YcM0d8j6JlbGpUWObkWEx4/Mobile-eCommerce-Clothing-Store-App-Design--Community-?node-id=1-3&p=f&t=mCIYC4uqNMsoXTD8-0).

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
* 💳 **PayMob for Payment** Implementation with card and wallet payments.
* 🚀 **Deployed [Web Preview](https://moazsalem.github.io/FakeStore_E-Commerce/) & Precompiled APKs** in [Releases](https://github.com/MoazSalem/FakeStore_E-Commerce/releases) for quick access

---

## 🧪 PayMob Test Credentials

| Type   | Number / PIN        | Expiry | CVV | OTP    |
| ------ | ------------------- | ------ | --- | ------ |
| Card   | 5123 4567 8901 2346 | 12/25  | 123 | -      |
| Wallet | 01010101010         | -      | -   | 123456 |

---

## 🛠 Tech Stack

* **Framework:** [Flutter](https://flutter.dev/)
* **State Management:** [flutter\_bloc](https://pub.dev/packages/flutter_bloc)
* **Networking:** [Dio](https://pub.dev/packages/dio)
* **Code Generation:** [Freezed](https://pub.dev/packages/freezed), [json\_serializable](https://pub.dev/packages/json_serializable), [retrofit](https://pub.dev/packages/retrofit), [injectable](https://pub.dev/packages/injectable), [build\_runner](https://pub.dev/packages/build_runner)
* **Storage:** [shared\_preferences](https://pub.dev/packages/shared_preferences)
* **UI/UX:** [cached\_network\_image](https://pub.dev/packages/cached_network_image), [flutter\_svg](https://pub.dev/packages/flutter_svg), [skeletonizer](https://pub.dev/packages/skeletonizer)
* **Payment:** [flutter_paymob](https://pub.dev/packages/flutter_paymob)

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
<img width="300" alt="Home" src="https://github.com/user-attachments/assets/4d4f86fb-9002-4b93-b935-a4d802b2c6dc" />
<img width="300" alt="Cart" src="https://github.com/user-attachments/assets/95818759-4bc3-4698-aa1e-ec6c4a2f6682" />
<img width="300" alt="Saved" src="https://github.com/user-attachments/assets/62db3167-9344-422d-9b79-8c7b7357f145" />
<img width="300" alt="Profile" src="https://github.com/user-attachments/assets/73122325-00a8-4b3d-abab-10d1109c7dc6" />
<img width="300" alt="Product Details" src="https://github.com/user-attachments/assets/d77a2b1f-5c2d-4338-a051-8dfb2fbd60eb" />
<img width="300" alt="Checkout" src="https://github.com/user-attachments/assets/b24867c3-8b37-4582-9698-7e67f24dd942" />
<img width="300" alt="Payment Options" src="https://github.com/user-attachments/assets/bd6bd47c-41bb-465e-a30e-4edaaf3d14a5" />
<img width="300" alt="Pay with card" src="https://github.com/user-attachments/assets/e4ed6d4f-61fb-450a-9882-829c9b6b3970" />
</div>

---

## 📦 Previews

Try the [Web Preview Version with Device Preview](https://moazsalem.github.io/FakeStore_E-Commerce/) 

Or you can download [The Latest APK builds from Releases](https://github.com/MoazSalem/FakeStore_E-Commerce/releases) section.

Also there is an unsigned ipa included in the releases for ios testing.

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

5. **Paymob Details**
 
   to make PayMob work, you need to add a json file in the project root folder with this format:
```
{
  "API_KEY": "", 
  "CARD_ID": "",
  "WALLET_ID": "",
  "IFRAME_ID": ""
}
```
you will need to inject the file into your run with these args: --dart-define-from-file=keys.json (add them to your run configuration)

---

## 🎯 Learning Goals

This project is designed to practice and showcase:

* Applying **Clean Architecture + SOLID** principles in Flutter apps.
* Using **BLoC** effectively for state management.
* Handling **API calls, caching, error handling** in a robust way.
* Building **scalable and maintainable codebases** with code generation.
* Improving **UI/UX** with shimmer, reusable components, and SVGs.
* Implementing payment solutions like *PayMob*.

---

## 📜 License

This project is for **educational purposes only**. Feel free to fork and experiment.
