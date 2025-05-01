
# 📝 Flutter Supabase Blog App

A modern blog application built with **Flutter** and **Supabase**, featuring authentication, real-time updates, and CRUD operations.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.19-blue)](https://flutter.dev)
[![Supabase](https://img.shields.io/badge/Supabase-v2.0-green)](https://supabase.com)

![App Screenshot](/assets/screenshot.png) <!-- Add your screenshot path -->

## ✨ Features

- 🔐 Email/password authentication
- 📝 Create, read, update, and delete blog posts
- ⚡ Real-time post updates
- 🌈 Responsive UI with dark/light theme
- 📸 Image uploads with Supabase Storage

## 🛠️ Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Supabase (PostgreSQL, Auth, Storage)
- **State Management**: Riverpod
- **UI**: Material 3 Design

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.19.0)
- Dart (>=3.3.0)
- Supabase account

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/Nishanbhattarai498/blog_app.git
   cd blog_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Create `.env` file in root directory with your Supabase credentials:
   ```env
   SUPABASE_URL=your-supabase-url
   SUPABASE_ANON_KEY=your-anon-key
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## 📂 Project Structure

```
lib/
├── main.dart            # App entry point
├── core/                # Core utilities
├── features/            # Feature modules
│   ├── auth/            # Authentication
│   ├── posts/           # Blog posts
│   └── profile/         # User profile
├── shared/              # Shared components
└── providers/           # State providers
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:
1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

## 📧 Contact

Nishan Bhattarai - [@your_twitter](https://twitter.com/your_twitter) - your.email@example.com

Project Link: [https://github.com/Nishanbhattarai498/blog_app](https://github.com/Nishanbhattarai498/blog_app)

