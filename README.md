# Excelerate — Flutter Learning App
![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?logo=ios&logoColor=white)

Excelerate is a modern Flutter app that helps learners discover courses, browse programs, and track progress with a clean, mobile-first UI. It includes a polished splash, login/signup, a home dashboard with “Popular Courses,” a program list with filters, and a course details screen with a persistent Enroll CTA.

## Features

- Splash → Login/Signup flow
- Home dashboard with search, hero banner, and popular courses
- Program list with chips, search, and colorful cards
- Course details with badges and bottom “Enroll Now” bar
- Bottom navigation: Home, Events, Community (chat concept), Profile
- Reusable widgets (CourseCard, PrimaryButton, StatBadge) and theming

## Tech Stack

- Flutter
- Dart
- Clean widget structure with reusable components

## Screenshots
| Splash | Login | Home |
|--------|-------|------|
| <img src="screenshots/splash.png" width="220"> | <img src="screenshots/login.png" width="220"> | <img src="screenshots/home.png" width="220"> |

| Program List | Course Details | Community | Profile |
|--------------|----------------|-----------|--------|
| <img src="screenshots/search.png" width="220"> | <img src="screenshots/overview.png" width="220"> | <img src="screenshots/community.png" width="220"> | <img src="screenshots/profile.png" width="220"> |

| Updated Homepage with API Integration | API Course Details | Feedback System | Feedback Success |
|--------------|----------------|-----------|--------|
| <img src="screenshots/api_home.png" width="220"> | <img src="screenshots/api_course_detail.png" width="220"> | <img src="screenshots/feedback.png" width="220"> | <img src="screenshots/feedback_success.png" width="220"> |

## Getting Started

1. Install Flutter
2. Fetch dependencies:
```bash
 flutter pub get
```
3. Run:
```bash
 flutter run
```
## Project Structure
```
lib/
├── main.dart
├── theme.dart
├── widgets/
│   ├── primary_button.dart
│   ├── stat_badge.dart
│   ├── course_card.dart
│   └── section_header.dart
└── screens/
    ├── splash_screen.dart
    ├── login_screen.dart
    ├── signup_screen.dart
    ├── home_shell.dart
    ├── home_dashboard.dart
    ├── program_list_screen.dart
    ├── program_details_screen.dart
    ├── events_screen.dart
    ├── community_screen.dart
    └── profile_screen.dart
```
## Author
**Vetriselvan Karunanithi**  
GitHub: [vetrikarunanithi](https://github.com/vetrikarunanithi)  
LinkedIn: [Vetriselvan Karunanithi](https://www.linkedin.com/in/vetriselvank)
