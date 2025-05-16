# PHASE 1: Project Setup & Planning (2–3 days) 🧱🕒🗂️

### 1.1 Define App Features 📝🌡️📍
Recommended starting features:
- Current weather based on location
- Weather description (e.g., "Cloudy")
- Temperature in Celsius
- Matching weather icon (from Google's set)
- Refresh button or auto-refresh functionality

Optional future features:
- 7-day forecast
- City search capability
- Ability to save locations

### 1.2 Environment Setup 🖥️⚙️📦
- Install Flutter SDK: https://flutter.dev/docs/get-started/install
- Install Android Studio with Flutter and Dart plugins
- Set up an Android emulator or connect a physical device

**Create your Flutter project:** 🚀📁🧪
```bash
flutter create weather_app
cd weather_app
```

### 1.3 Folder Structure (Recommended) 📂🏗️🧭
```
/lib
  ├── main.dart
  ├── models/
  ├── services/
  ├── screens/
  ├── widgets/
  ├── utils/
  └── constants/
assets/
  └── icons/ (Google’s weather icons here)
```

### 1.4 Dependencies (pubspec.yaml) 📜🔧📚
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.0.0
  provider: ^6.1.0
  geolocator: ^10.0.0
  geocoding: ^2.1.0
  flutter_svg: ^2.0.0
```

**Add asset path:** 🗺️🖼️📄
```yaml
flutter:
  assets:
    - assets/icons/
```

---

# PHASE 2: UI Structure & Layout (3–5 days) 🎨🧩📱

### 2.1 Home Screen Layout 🏠🌥️🧱
- Use `Scaffold` as the base
- Add an `AppBar` with the app title
- Structure the layout using `Column` or `ListView`:
  - City Name
  - Temperature
  - Weather Description
  - Weather Icon (use `Image.asset`)
  - Last updated time
  - Refresh button (`IconButton`)

### 2.2 Custom Widgets 🧱🧠🎛️
- `WeatherCard`: Displays weather details
- `ErrorMessage`: Shown for API/location errors
- `LoadingIndicator`: Indicates data fetching

### 2.3 Responsive Design 🖼️📐📲
- Use `MediaQuery` for screen sizing
- Apply spacing with `EdgeInsets` or `SizedBox`
- Utilize `Flexible`, `Expanded`, and alignment widgets

---

# PHASE 3: API Integration (5–7 days) 🌐🔌📦

### 3.1 Choose an API 🔍📡💻
Use OpenWeatherMap:
```plaintext
Endpoint: https://api.openweathermap.org/data/2.5/weather
Params: ?lat={lat}&lon={lon}&units=metric&appid={API_KEY}
```

### 3.2 Set Up HTTP Requests 🛠️🌍📤
- Use the `http` package for REST calls
- Create `WeatherService` in `/services`
- Include timeout and error handling

### 3.3 Create Data Models 🧬📊🗃️
- Parse JSON manually or with `json_serializable`
- Define a `WeatherData` class in `/models`

### 3.4 Connect with Provider 🔁📲🧠
- Implement a `WeatherProvider` for state handling
- Store fetched weather data
- Notify UI components using `notifyListeners()`

---

# PHASE 4: Location Services (4–6 days) 📍📡🗺️

### 4.1 Permissions 🔐📃📲
Add to `AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
```

### 4.2 Get Location 🌍📌🛰️
- Use `geolocator` to get coordinates
- Optionally convert coordinates to a city name with `geocoding`

### 4.3 Error Handling ⚠️🛑💬
- Handle denied permissions
- Display fallback messages or manual entry UI

---

# PHASE 5: Icon Mapping Logic (2 days) 🎭📷🔄

### 5.1 Map Weather Codes 🌦️🔢🗂️
OpenWeatherMap returns codes like "01d" or "03n". Example mapping:
```dart
String getIconForCode(String code) {
  switch (code) {
    case "01d": return "assets/icons/clear_day.png";
    case "01n": return "assets/icons/clear_night.png";
    case "02d": return "assets/icons/partly_cloudy_day.png";
    default: return "assets/icons/default.png";
  }
}
```

### 5.2 Use Icon in UI 🖼️🧾🎯
```dart
Image.asset(getIconForCode(weatherData.iconCode))
```

---

# PHASE 6: App Behavior & Features (4–5 days) ⚙️📱🔄

### 6.1 State Management 📈🔧🔁
- Use `Provider` for reactive state handling
- Expose weather data and loading/error states

### 6.2 Refresh Mechanism 🔄🔘📲
- Use `RefreshIndicator`
- Add manual refresh via a button

### 6.3 UI States 🖼️✅❌
- Loading: Show a spinner
- Error: Display an error message
- Success: Render weather data

---

# PHASE 7: Styling and Polish (3–5 days) ✨🎨🧼

### 7.1 Theming 🎭🎨🗂️
- Use `ThemeData` for global styles
- Customize fonts, colors, and spacing

### 7.2 Animations 🎞️🌀🧊
- Add subtle fade or slide animations
- Animate data updates if desired

### 7.3 Dark Mode 🌙🌓⚫
- Use `ThemeMode.system`
- Provide dark variants in `main.dart`

---

# PHASE 8: Testing & Debugging (3–4 days) 🧪🛠️🐞

### 8.1 Manual Testing 🧾🔍📲
- Test across screen sizes
- Simulate offline and denied permissions

### 8.2 Debugging Tools 🪛🧰🧠
- Use `print()` or `debugPrint()`
- Review logs via Android Studio Logcat

### 8.3 Unit Testing (optional) 🔬🧪📘
- Test model parsing and error handling
- Use mocks to simulate API calls

---

# PHASE 9: Build & Deployment (3–5 days) 🚀📦📤

### 9.1 Prepare Release Build 🔧🏗️📱
- Run: `flutter build apk`
- Install and test on a real Android device

### 9.2 App Signing 🔐📄✍️
- Create a keystore
- Configure `key.properties` and `build.gradle`

### 9.3 Distribute APK 🌐📤📲
- Share APK directly
- Optionally publish to Google Play

From this [canvas](https://chatgpt.com/canvas/shared/68243410ce808191b5a36aaf07066b62).