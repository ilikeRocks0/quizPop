## Overview

QuizPop follows a **3-tier** architecture.

- **Presentation / UI Layer**
- **Logic / Business Layer**
- **Persistence Layer**
- **Domain-Specific Objects (DSOs)**



## File Structure

lib/
├── src/
│   ├── presentation/                  # UI controllers (presentation layer)
│   │   ├── WordInputScreen.flutter
│   │   ├── WordListScreen.flutter
│   │   ├── WordDetailView.flutter
│   ├── logic/
│   │   ├── StateManagement.dart
│   │   ├── DailyWordSelector.dart
│   │   ├── NotificationHandler.dart
│   ├── persistence/
│   │   ├── localWordStorage.dart
│   ├── notification/
│   │   ├── NotificationSys.dart
│   ├── objects/
│   │   ├── CueCard.dart