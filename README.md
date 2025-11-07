# 📱 kitliy - Mobile App

**Develop Better, Build Faster**

Aplikasi mobile all-in-one untuk produktivitas dan kebutuhan sehari-hari.

---

## 👤 Identitas

- **Nama**: Aliyyarahma
- **NIM**: 15-2023-093
- **Mata Kuliah**: Pemrograman Mobile
- **Dosen**: Galih Ashari R., S.Si., MT
- **Kelas**: AA/BB
- **Semester**: Ganjil 2024/2025

---

## 📝 Deskripsi Aplikasi

**kitliy** (toolkit by aliy) adalah aplikasi mobile yang menyediakan berbagai fitur untuk memudahkan aktivitas sehari-hari, meliputi:

- 📞 **Kontak** - Manajemen kontak dengan fitur search dan add contact
- 🔢 **Kalkulator** - Kalkulator sederhana dengan operasi matematika dasar
- 🌤️ **Cuaca** - Informasi cuaca real-time Kota Bandung dari API BMKG
- 📰 **Berita** - Daftar berita terkini (static)
- 👤 **Biodata** - Halaman profil pengguna

---

## ✨ Fitur Utama

### 1. **Splash Screen (5 detik)**
- Menampilkan logo aplikasi
- Foto profil developer
- NIM dan nama
- Countdown timer dengan animasi

### 2. **Dashboard**
- Bottom Navigation Bar dengan 5 menu
- Quick Access cards untuk akses cepat
- Light/Dark mode toggle
- Greeting personalized

### 3. **Halaman Kontak**
- List 15+ kontak dengan search
- Tambah kontak baru (in-memory)
- Detail kontak dengan modal
- Sorting alphabetical otomatis

### 4. **Halaman Kalkulator**
- Operasi: +, -, ×, ÷
- Operasi tambahan: x², √, ^
- Clear dan backspace
- Responsive design

### 5. **Halaman Cuaca**
- Data real-time dari API BMKG
- Informasi suhu, kelembaban, wind speed
- Forecast per jam
- Location: Bandung, West Java

### 6. **Halaman Berita**
- List berita static
- Card design dengan thumbnail
- Coming soon: API integration

### 7. **Halaman Biodata**
- Form input data
- Dropdown, radio button, calendar
- Upload foto profil
- Data tidak disimpan ke database (sesuai soal)

---

## 🎨 Design & UI/UX

- **Main Color**: #A8D8EA (Baby Blue)
- **Theme**: Light & Dark mode support
- **Typography**: Clean & modern
- **Layout**: Material Design 3
- **Navigation**: Bottom Navigation Bar dengan elevated active state
- **Animations**: Smooth transitions & micro-interactions

---

## 📸 Screenshots

### Splash Screen
![Splash Screen](screenshots/splash.png)
*Splash screen dengan countdown 5 detik*

### Dashboard (Light Mode)
![Dashboard Light](screenshots/dashboard_light.png)
*Dashboard dengan quick access cards*

### Dashboard (Dark Mode)
![Dashboard Dark](screenshots/dashboard_dark.png)
*Dark mode dengan warna yang nyaman di mata*

### Halaman Kontak
![Kontak](screenshots/contact.png)
*List kontak dengan search dan add button*

### Halaman Kalkulator
![Kalkulator](screenshots/calculator.png)
*Kalkulator dengan operasi lengkap*

### Halaman Cuaca
![Cuaca](screenshots/weather.png)
*Data cuaca real-time Bandung*

### Halaman Berita
![Berita](screenshots/news.png)
*List berita terkini*

### Halaman Biodata
![Biodata](screenshots/profile.png)
*Form biodata lengkap*

---

## 🛠️ Teknologi

- **Framework**: Flutter 3.35.5
- **Language**: Dart
- **State Management**: setState (StatefulWidget)
- **API**: BMKG Weather API
- **Dependencies**:
  - `http: ^1.1.0` - HTTP requests
  - Material Design 3

---

## 📦 Instalasi

1. Clone repository:
```bash
git clone https://github.com/username-kamu/devliy-mobile-app.git
cd devliy-mobile-app
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
    ├── contact_page.dart     # Halaman kontak
    ├── calculator_page.dart  # Halaman kalkulator
    ├── weather_page.dart     # Halaman cuaca
    ├── news_page.dart        # Halaman berita
    └── profile_page.dart     # Halaman biodata
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
- Data biodata **tidak disimpan ke database** (sesuai instruksi soal)
- Cuaca menggunakan **API BMKG real-time** untuk Kota Bandung
- Berita masih **static data** (belum API integration)

---

## 👨‍💻 Developer

**Aliyya Rahmawati Putri** - [NIM: 15-2023-093]

*"Develop Better, Build Faster"* 💙

---

## 📄 License

Project ini dibuat untuk keperluan UTS Pemrograman Mobile - Institut Teknologi Nasional Bandung

---

**© 2025 devliy - All Rights Reserved**
