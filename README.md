# 🇮🇪 Raksha Ireland - Emergency SOS App

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/import/project?template=https://github.com/ANSHU-Ireland/raksha-v0)

A comprehensive emergency SOS application designed specifically for immigrants and residents in Ireland. Raksha (Sanskrit for "protection") provides instant access to emergency services, location-based alerts, and community safety features.

## 🚨 Live Demo

🌐 **[Try the Live App](https://your-app-url.vercel.app)**

**Demo Credentials:**
- Email: `demo@test.com`
- Password: `password123`
- Admin Email: `admin@raksha.ie` (for admin dashboard)

## ✨ Features

### 🆘 Emergency Services
- **One-Touch SOS**: Red emergency button for instant alerts
- **Voice Messages**: Record voice SOS messages for emergency contacts
- **Location Tracking**: GPS-based emergency location sharing
- **Proximity Alerts**: 3km radius emergency detection
- **Text Alerts**: Send emergency text messages with location

### 👤 User Management
- **GDPR Compliant Registration**: Secure user registration with data protection
- **Irish Mobile Integration**: Optimized for Irish phone number formats
- **Profile Management**: Manage emergency contacts and personal information

### 👨‍💼 Admin Dashboard
- **Emergency Management**: Real-time SOS alert monitoring
- **User Administration**: Manage user accounts and permissions
- **Analytics**: Emergency response statistics and reporting

### 📱 Mobile-First Design
- **Responsive UI**: Works perfectly on phones, tablets, and desktop
- **PWA Ready**: Add to home screen for native app experience
- **Offline Capable**: Core functionality works without internet

## 🛠️ Technology Stack

- **Frontend**: Flutter 3.35.6 (Web)
- **State Management**: Built-in Flutter state management
- **UI Framework**: Material Design 3
- **Typography**: Google Fonts
- **Responsive Design**: Flutter ScreenUtil
- **Deployment**: Vercel (Static hosting)

## 🚀 Quick Start

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/ANSHU-Ireland/raksha-v0.git
   cd raksha-v0
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the development server**
   ```bash
   flutter run -d chrome
   ```

4. **Build for production**
   ```bash
   flutter build web
   ```

### Deploy to Vercel

1. **Fork this repository**
2. **Connect to Vercel**
   - Go to [vercel.com](https://vercel.com)
   - Import your forked repository
   - Vercel will auto-detect Flutter and deploy

3. **Configure Build Settings** (if needed)
   - Build Command: `flutter build web`
   - Output Directory: `build/web`

## 📱 Testing the App

### Web Testing
1. Open the deployed Vercel URL
2. Use demo credentials to log in
3. Test all SOS features:
   - Emergency button activation
   - Voice recording (browser permission required)
   - Location services (browser permission required)
   - Admin dashboard access

### Mobile Testing
1. Open the Vercel URL on your phone's browser
2. Add to home screen for native app experience
3. Grant location and microphone permissions
4. Test emergency features

## 🏗️ Project Structure

```
lib/
├── main.dart                     # App entry point
├── models/                       # Data models
│   ├── user_model.dart          # User data structure
│   └── sos_alert.dart           # Emergency alert model
├── screens/                      # UI screens
│   ├── demo_splash_screen.dart  # App splash screen
│   ├── demo_auth_screen.dart    # Login/Register screen
│   ├── demo_home_screen.dart    # Main dashboard
│   └── demo_admin_screen.dart   # Admin panel
└── widgets/                      # Reusable UI components
    ├── custom_button.dart       # Custom button widget
    └── custom_text_field.dart   # Custom input field
```

## 🔧 Configuration

The app is configured for demo purposes with:
- Mock authentication system
- Simulated emergency services
- Test data for all features
- GDPR-compliant user registration flow

For production deployment, integrate with:
- Real authentication service (Firebase Auth, Auth0, etc.)
- Irish emergency services API
- SMS gateway for alerts
- Real-time database for emergency coordination

## 🌍 Localization

Currently supports:
- English (Primary)
- Irish emergency service integration
- EU GDPR compliance

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Irish Emergency Services**: For providing guidelines on emergency app development
- **Flutter Community**: For the amazing framework and packages
- **Immigrants in Ireland**: For inspiring this safety-focused application

## 📞 Support

For support or questions:
- 📧 Email: support@raksha.ie
- 🐛 Issues: [GitHub Issues](https://github.com/ANSHU-Ireland/raksha-v0/issues)
- 📖 Documentation: [Project Wiki](https://github.com/ANSHU-Ireland/raksha-v0/wiki)

---

**Made with ❤️ for the safety of immigrants and residents in Ireland 🇮🇪**