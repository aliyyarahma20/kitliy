# 🌸 kitliy - Mobile App

**Develop Better, Build Faster**

Aplikasi mobile all-in-one untuk produktivitas dan kebutuhan sehari-hari.

---

## 👤 Identitas

- **Nama**: Aliyya Rahmawati Putri
- **NIM**: 15-2023-093
- **Mata Kuliah**: Pemrograman Mobile
- **Dosen**: Galih Ashari R., S.Si., MT
- **Kelas**: BB

---

## 📝 Deskripsi Aplikasi

**kitliy** (toolkit by aliyya) adalah aplikasi mobile yang menyediakan berbagai fitur untuk memudahkan aktivitas sehari-hari, meliputi:

- 📞 **Kontak** - Manajemen kontak dengan fitur search dan add contact
- 🔢 **Kalkulator** - Kalkulator sederhana dengan operasi matematika dasar
- 🌤️ **Cuaca** - Informasi cuaca real-time dari API BMKG
- 📰 **Berita** - Daftar berita terkini (static)
- 👤 **Biodata** - Halaman profil pengguna

---

## ✨ Fitur Utama

### 1. **Splash Screen (5 detik)**

Halaman pembuka aplikasi dengan countdown 5 detik sebelum masuk ke Dashboard.

**Memuat:**
- Opening "kitliy" dilengkapi dengan gradient effect
- Foto profil developer (circle avatar)
- Info: NIM (15-2023-093) dan Username (aliyyarahma)
- Countdown timer dengan progress indicator
- Animasi fade-in, slide-up, dan scale
- Auto-navigate ke Dashboard

**Screenshot:**
![Splash Screen](assets/images/screenshoots/1.%20SplashScreen.png)

---

### 2. **Dashboard**

Halaman utama aplikasi dengan Quick Access menu untuk navigasi cepat ke berbagai fitur.

**Memuat:**
- Header dengan greeting "Hello, Aliy! 👋"
- Theme toggle button (Light/Dark mode)
- Profile picture button
- Quick Access section dengan 5 cards:
  - 4 Square Cards (Weather, Contacts, Calculator, Profile)
  - 1 Rectangle Card (Latest News)
- Bottom Navigation Bar dengan 5 menu
- Smooth animations dan transitions

**Screenshots:**

**Light Theme:**
![Dashboard Light](assets/images/screenshoots/2.%20Dashboard%20-%20LightTheme.png)

**Dark Theme:**
![Dashboard Dark](assets/images/screenshoots/2.%20Dashboard%20-%20DarkTheme.png)

---

### 3. **Halaman Biodata (Profile)**

Halaman profil pengguna dengan form input biodata lengkap dan fitur save data.

**Memuat:**
- Back button untuk kembali ke dashboard
- Profile picture dengan gradient border
- Username "aliyyarahma" dan NIM "15-2023-093"
- Form input lengkap dengan sections:
  - Personal Information (Name, Email, Phone, Address)
  - Gender selector (Radio button: Male/Female)
  - Date of Birth (Calendar picker)
  - Occupation (Dropdown: Software Developer, UI/UX Designer, dll)
  - Bio (Multiline text field)
- Save Profile button dengan gradient dan icon
- Data persistence menggunakan SharedPreferences
- Loading state saat load data
- Success notification setelah save
- Smooth scrolling dengan BouncingScrollPhysics

**Screenshots:**

**Light Theme:**
![Profile Light 1](assets/images/screenshoots/3.%20ProfilePage%20-%20LightTheme.png)
![Profile Light 2](assets/images/screenshoots/3.%20ProfilePage%20-%20LightTheme_2.png)

**Dark Theme:**
![Profile Dark 1](assets/images/screenshoots/3.%20ProfilePage%20-%20DarkTheme.png)
![Profile Dark 2](assets/images/screenshoots/3.%20ProfilePage%20-%20DarkTheme_2.png)

---

### 4. **Halaman Kontak**

Manajemen kontak dengan fitur search dan add contact.

**Memuat:**
- Header dengan title "Contacts"
- Contact counter badge (jumlah kontak)
- Add contact button (gradient button)
- Search bar dengan clear button
- List 15 kontak dengan circle avatar
- Tap kontak untuk lihat detail (bottom sheet modal)
- Action buttons: Call & Message
- Add contact dialog dengan form input
- Empty state saat pencarian tidak ditemukan

**Screenshots:**

**Light Theme:**
![Contact Light](assets/images/screenshoots/4.%20ContactPage%20-%20LightTheme.png)
![Add Contact Light](assets/images/screenshoots/4.%20ContactPage_AddContact%20-%20LightTheme.png)
![Detail Contact Light](assets/images/screenshoots/4.%20ContactPage_DetailContact%20-%20LightTheme.png)

**Dark Theme:**
![Contact Dark](assets/images/screenshoots/4.%20ContactPage%20-%20DarkTheme.png)
![Add Contact Dark](assets/images/screenshoots/4.%20ContactPage_AddContact%20-%20DarkTheme.png)
![Detail Contact Dark](assets/images/screenshoots/4.%20ContactPage_DetailContact%20-%20DarkTheme.png)

---

### 5. **Halaman Kalkulator**

Kalkulator sederhana dengan operasi matematika lengkap.

**Memuat:**
- Header dengan title "Calculator"
- Display area dengan input expression dan result
- Button grid 4x5 dengan operasi lengkap
- Dynamic AC/⌫ button (berganti otomatis)
- Operasi: tambah (+), kurang (-), kali (×), bagi (÷)
- Fungsi tambahan: persen (%), akar kuadrat (√), pangkat (^)
- Error handling untuk operasi tidak valid
- Smart behavior: auto-clear setelah hasil

**Screenshots:**

**Light Theme:**
![Calculator Light](assets/images/screenshoots/5.%20Calculator%20Page%20-%20Light%20Theme.png)

**Dark Theme:**
![Calculator Dark](assets/images/screenshoots/5.%20CalculatorPage%20-%20DarkTheme.png)

---

### 6. **Halaman Cuaca**

Informasi cuaca real-time dari API BMKG dengan tampilan yang sangat menarik.

**Memuat:**
- Location selector untuk 7 kota (Bandung, Jakarta, Surabaya, Yogyakarta, Semarang, Medan, Makassar)
- Current weather display dengan suhu besar dan icon cuaca
- Parallax scroll effect pada header
- 4 Info cards: Humidity, Feels Like, Wind, Visibility
- Hourly forecast (12 jam ke depan) dengan horizontal scroll
- 5-Day forecast dengan high/low temperature
- Weather icons yang dinamis (Sunny, Mostly Clear, Cloudy, Rainy, Thunderstorm)
- Loading state dan error handling dengan retry button
- Real-time data dari BMKG API
- Attribution "Data by BMKG"

**Screenshots:**

**Light Theme:**
![Weather Light](assets/images/screenshoots/6.%20WeatherPage%20-%20Light%20Theme.png)

**Dark Theme:**
![Weather Dark](assets/images/screenshoots/6.%20WeatherPage%20-%20DarkTheme.png)

---

### 7. **Halaman Berita**

Daftar berita teknologi terkini dengan card design yang modern.

**Memuat:**
- Header dengan title "News" dan subtitle
- List 12 artikel tech news dengan scroll
- Featured image dengan gradient overlay
- Source badge dan timestamp (2h ago, 1d ago, dll)
- Article title dan description preview
- "Read More" button untuk navigasi ke detail
- Loading indicator saat fetch image
- Fallback icon jika gambar gagal load
- Navigate ke News Detail Page saat tap
- Static data dengan realistic timestamps

**Screenshots:**

**Light Theme:**
![News Light 1](assets/images/screenshoots/7.%20NewsPage%20-%20LightTheme.png)
![News Light 2](assets/images/screenshoots/7.%20NewsPage%20-%20LightTheme_2.png)
![News Light 3](assets/images/screenshoots/7.%20NewsPage%20-%20LightTheme_3.png)

**Dark Theme:**
![News Dark 1](assets/images/screenshoots/7.%20NewsPage%20-%20DarkTheme.png)
![News Dark 2](assets/images/screenshoots/7.%20NewsPage%20-%20DarkTheme_2.png)
![News Dark 3](assets/images/screenshoots/7.%20NewsPage%20-%20DarkTheme_3.png)

---

## 🎨 Design & UI/UX

- **Main Color**: #B8E2F2 (Baby Blue)
- **Theme**: Light & Dark mode support
- **Typography**: Clean & modern
- **Navigation**: Bottom Navigation Bar dengan elevated active state
- **Animations**: Smooth transitions & micro-interactions

---

## 🛠️ Teknologi

- **Framework**: Flutter 3.35.5
- **Language**: Dart
- **State Management**: setState (StatefulWidget)
- **API**: BMKG Weather API
- **Dependencies**:
  - `http: ^1.1.0` - HTTP requests
  - `shared_preferences: ^2.2.2` - Local data storage
  - Material Design 3

---

## 📦 Instalasi

1. Clone repository:
```bash
git clone https://github.com/aliyyarahma20/kitliy.git
cd kitliy
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run aplikasi:
```bash
flutter run
```

---

## 📂 Struktur Project
```
lib/
├── main.dart                 # Entry point
└── screens/
    ├── splash_screen.dart    # Splash screen
    ├── dashboard.dart        # Main dashboard
    ├── profile_page.dart     # Halaman biodata
    ├── contact_page.dart     # Halaman kontak
    ├── calculator_page.dart  # Halaman kalkulator
    ├── weather_page.dart     # Halaman cuaca
    ├── news_page.dart        # Halaman berita
    └── news_detail_page.dart # Halaman detail berita
```

---

## 🎯 Jawaban Soal UTS

### SubCPMK 2: Layout & Widget Implementation

✅ **Splash Screen** - Implementasi dengan AnimationController, Timer, dan gradient background
✅ **Bottom Navigation** - Custom elevated navigation bar dengan 5 menu
✅ **Fragment Concept** - Menggunakan setState untuk switch page
✅ **Biodata Form** - Lengkap dengan dropdown, radio button, text field, dan calendar
✅ **Kontak List** - ListView dengan 15+ kontak, search, dan add function
✅ **Kalkulator** - Fully functional dengan operasi matematika
✅ **Cuaca** - Real-time API integration dengan BMKG
✅ **Berita** - List layout dengan card design

**Semua requirement terpenuhi!** ✨

---

## 📝 Catatan

- Data kontak disimpan **in-memory** (tidak persistent)
- Data biodata **disimpan menggunakan SharedPreferences**
- Cuaca menggunakan **API BMKG real-time** untuk 7 kota
- Berita masih **static data** (belum API integration)

---

## 👨‍💻 Developer

**Aliyya Rahmawati Putri** - [NIM: 15-2023-093]

*"Develop Better, Build Faster"* 💙

---

## 📄 License

Project ini dibuat untuk keperluan UTS Pemrograman Mobile - Institut Teknologi Nasional Bandung

---

**© 2025 kitliy - All Rights Reserved**