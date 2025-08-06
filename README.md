# 📝 Notes App with Firebase

A modern, feature-rich notes application built with Flutter and Firebase, featuring real-time synchronization, push notifications, and a clean user interface.

## 🚀 Features

- **User Authentication**: Secure login and signup with Firebase Auth
- **Real-time Notes**: Create, read, update, and delete notes with Cloud Firestore
- **Push Notifications**: Firebase Cloud Messaging for real-time notifications
- **Local Notifications**: Periodic reminders using flutter_local_notifications
- **State Management**: BLoC pattern for clean architecture
- **Cross-platform**: Works on Android, iOS, Web, Windows, macOS, and Linux
- **Modern UI**: Material Design with custom color scheme

## 🛠️ Technologies Used

### Core Framework
- **Flutter** (v3.7.0+) - Cross-platform UI framework
- **Dart** - Programming language

### State Management
- **flutter_bloc** (v9.1.1) - BLoC pattern implementation
- **bloc** (v9.0.0) - Core BLoC library
- **equatable** (v2.0.7) - Value equality for Dart objects

### Backend & Database
- **Firebase Core** (v3.15.1) - Firebase initialization
- **Firebase Auth** (v5.6.2) - User authentication
- **Cloud Firestore** (v5.6.12) - NoSQL cloud database
- **Firebase Messaging** (v15.2.10) - Push notifications

### Notifications
- **flutter_local_notifications** (v19.4.0) - Local notification system

### UI Components
- **Cupertino Icons** (v1.0.8) - iOS-style icons
- **Material Design** - Google's design system

## 📱 Screens & Features

### Authentication Screens
- **Login Screen** (`lib/ui/screens/login_screen.dart`)
- **Signup Screen** (`lib/ui/screens/signup_screen.dart`)

### Notes Management
- **Notes Screen** (`lib/ui/screens/notes_screen.dart`) - Display all notes
- **New Note Screen** (`lib/ui/screens/new_note.dart`) - Create new notes
- **Update Note Screen** (`lib/ui/screens/update_note.dart`) - Edit existing notes

## 🏗️ Architecture

### Project Structure
```
lib/
├── core/
│   └── color_manager.dart          # Color management
├── logic/                          # BLoC state management
│   ├── create_note/               # Note creation logic
│   ├── get_note/                  # Note retrieval logic
│   ├── login/                     # Authentication logic
│   └── signup/                    # Registration logic
├── models/
│   └── notes_model.dart           # Note data model
├── ui/
│   ├── screens/                   # App screens
│   └── widgets/                   # Reusable widgets
├── firebase_options.dart          # Firebase configuration
├── main.dart                      # App entry point
└── notification_settings.dart     # Notification configuration
```

### State Management (BLoC Pattern)
- **Login BLoC**: Handles authentication state
- **Signup BLoC**: Manages user registration
- **Create Note BLoC**: Handles note creation
- **Get Note BLoC**: Manages note retrieval and display

### Data Model
```dart
class Note {
  final String? id;
  final String title;
  final String content;
  final Timestamp createdAt;
  final String? userId;
}
```

## 🔧 Setup & Installation

### Prerequisites
- Flutter SDK (v3.7.0 or higher)
- Dart SDK
- Firebase project setup
- Android Studio / VS Code

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd notes_app_firebase
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a Firebase project
   - Enable Authentication and Firestore
   - Download `google-services.json` for Android
   - Configure Firebase options

4. **Run the app**
   ```bash
   flutter run
   ```

## 📋 Dependencies

### Production Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  bloc: ^9.0.0
  firebase_auth: ^5.6.2
  flutter_bloc: ^9.1.1
  equatable: ^2.0.7
  cloud_firestore: ^5.6.12
  firebase_messaging: ^15.2.10
  flutter_local_notifications: ^19.4.0
```

### Development Dependencies
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  integration_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  firebase_core: ^3.15.1
```

## 🔐 Firebase Configuration

### Services Used
- **Firebase Authentication**: Email/password authentication
- **Cloud Firestore**: Real-time database for notes
- **Firebase Cloud Messaging**: Push notifications
- **Firebase Core**: App initialization

### Security Rules
Ensure proper Firestore security rules for user data protection.

## 📱 Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🎨 UI/UX Design

The app follows Material Design principles with:
- Clean and intuitive interface
- Responsive design
- Custom color scheme
- Smooth animations
- User-friendly navigation

## 🔔 Notification System

### Features
- **Push Notifications**: Real-time updates via Firebase Cloud Messaging
- **Local Notifications**: Periodic reminders every 2 minutes
- **Permission Handling**: Automatic permission requests

### Configuration
- FCM token generation and management
- Local notification scheduling
- Background message handling

## 🚀 Key Features Implementation

### Authentication Flow
1. User registration with email/password
2. Secure login with Firebase Auth
3. Session management
4. User-specific data isolation

### Notes Management
1. **CRUD Operations**:
   - Create new notes with title and content
   - Read and display all user notes
   - Update existing notes
   - Delete notes

2. **Real-time Sync**: Changes reflect immediately across devices
3. **User Isolation**: Each user sees only their own notes
4. **Timestamp Tracking**: Automatic creation time tracking

### State Management
- **BLoC Pattern**: Clean separation of business logic and UI
- **Event-Driven**: User actions trigger state changes
- **Reactive UI**: UI updates automatically with state changes

## 🧪 Testing

The project includes:
- **Widget Tests**: UI component testing
- **Integration Tests**: End-to-end testing
- **Unit Tests**: Business logic testing

## 📦 Build & Deployment

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 👨‍💻 Developer

Built with ❤️ using Flutter and Firebase.

---

**Note**: This project demonstrates modern Flutter development practices with Firebase integration, state management using BLoC pattern, and comprehensive notification systems.
