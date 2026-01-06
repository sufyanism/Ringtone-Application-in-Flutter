## 🎵 Flutter Ringtone App
A simple and modern Flutter Ringtone Application built using GetX and MVC architecture. This app allows users to browse, play, auto-stop, and download ringtones from assets to local storage with a clean and reactive UI.

## 🚀 Features
- Play ringtones from app assets
- Auto-stop ringtone after fixed duration (5s / 22s)
- Stop currently playing ringtone
- Download ringtones to local storage
- Ringtones grouped by duration
- Reactive UI using GetX (Obx)
- Clean MVC architecture

## 🛠 Tech Stack
- Flutter (UI framework)
- GetX (State management & dependency injection)
- audioplayers (Audio playback)
- path_provider (Access local storage)

## 📁 Project Structure
```plaintext
lib/
 ├── main.dart
 ├── model/
 │    └── ringtone_model.dart
 ├── service/
 │    └── ringtone_service.dart
 ├── controller/
 │    └── ringtone_controller.dart
 └── view/
      └── home_view.dart
assets/
 └── ringtones/
      ├── ring1.mp3
      ├── ring2.mp3
      └── ...
```


## 📦 Dependencies
Add the following dependencies in pubspec.yaml:
-  get: ^4.6.6
-  audioplayers: ^5.2.1
-  path_provider: ^2.1.2


### Add ringtone assets:
flutter:
  assets:
    - assets/ringtones/



### Getting Started
- Clone the Repository
git clone https://github.com/your-username/flutter-ringtone-app.git
cd flutter-ringtone-app
- Install Dependencies
flutter pub get
- Run the App
flutter run


## 🧠 Architecture (MVC)
- Model, Defines ringtone data (Ringtone)
- Service, Provides ringtone list
- Controller, Handles audio logic, timers, and downloads
- View, Displays UI and reacts to state changes
This separation keeps the app clean, scalable, and maintainable.






## About Me 
✨ I’m **Sufyan bin Uzayr**, an open-source developer passionate about building and sharing meaningful projects.
You can learn more about me and my work at [sufyanism.com](https://sufyanism.com/) or connect with me on [Linkedin](https://www.linkedin.com/in/sufyanism)

## Your all-in-one learning hub! 
🚀 Explore courses and resources in coding, tech, and development at **zeba.academy** and **code.zeba.academy**. Empower yourself with practical skills through curated tutorials, real-world projects, and hands-on experience. Level up your tech game today! 💻✨

**Zeba Academy**  is a learning platform dedicated to **coding**, **technology**, and **development**.  
➡ Visit our main site: [zeba.academy](https://zeba.academy)   </br>
➡ Explore hands-on courses and resources at: [code.zeba.academy](https://code.zeba.academy)   </br>
➡ Check out our YouTube for more tutorials: [zeba.academy](https://www.youtube.com/@zeba.academy)  </br>
➡ Follow us on Instagram: [zeba.academy](https://www.instagram.com/zeba.academy/)  </br>

**Thank you for visiting!**
