# kitliy - Mobile App

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
- 🌤️ **Cuaca** - Informasi cuaca real-time Kota Bandung dari API BMKG
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
![Splash Screen](assets/images/screenshots/1.%20SplashScreen.png)

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
![Dashboard Light](assets/images/screenshots/2.%20Dashboard%20-%20LightTheme.png)

**Dark Theme:**
![Dashboard Dark](assets/images/screenshots/2.%20Dashboard%20-%20DarkTheme.png)

---

### 3. **Halaman Kontak**

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
![Contact Light](assets/images/screenshots/4.%20ContactPage%20-%20LightTheme.png)
![Add Contact Light](assets/images/screenshots/4.%20ContactPage_AddContact%20-%20LightTheme.png)
![Detail Contact Light](assets/images/screenshots/4.%20ContactPage_DetailContact%20-%20LightTheme.png)

**Dark Theme:**
![Contact Dark](assets/images/screenshots/4.%20ContactPage%20-%20DarkTheme.png)
![Add Contact Dark](assets/images/screenshots/4.%20ContactPage_AddContact%20-%20DarkTheme.png)
![Detail Contact Dark](assets/images/screenshots/4.%20ContactPage_DetailContact%20-%20DarkTheme.png)

---

### 4. **Halaman Kalkulator**

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
![Calculator Light](assets/images/screenshots/5.%20Calculator%20Page%20-%20Light%20Theme.png)

**Dark Theme:**
![Calculator Dark](assets/images/screenshots/5.%20CalculatorPage%20-%20DarkTheme.png)

---


### 5. **Halaman Cuaca**


### 6. **Halaman Berita**


### 7. **Halaman Biodata**

---

## 🎨 Design & UI/UX

- **Main Color**: #A8D8EA (Baby Blue)
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
  - `http: ^1.1.0`
  - HTTP requests
  - Material Design 3

---

## 📦 Instalasi

1. Clone repository:
```bash
git clone https://github.com/aliyyarahma20/kitliy.git
cd
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
    ├── news_detail_page.dart # Halaman detail berita
    └── profile_page.dart     # Halaman biodata
```

---

## 🎯 Jawaban Soal UTS

### SubCPMK 2: Layout & Widget Implementation
- **Splash Screen** - Implementasi dengan AnimationController, Timer, dan gradient background
- **Bottom Navigation** - Custom elevated navigation bar dengan 5 menu
- **Fragment Concept** - Menggunakan setState untuk switch page
- **Biodata Form** - Lengkap dengan dropdown, radio button, text field, dan calendar
- **Kontak List** - ListView dengan 15+ kontak, search, dan add function
- **Kalkulator** - Fully functional dengan operasi matematik
- **Cuaca** - Real-time API integration dengan BMKG
- **Berita** - List layout dengan card design

**Semua requirement terpenuhi!** ✨

---

## 📝 Catatan

- Data kontak disimpan **in-memory** (tidak persistent)
- Data biodata **tidak disimpan ke database** (sesuai instruksi soal)
- Cuaca menggunakan **API BMKG real-time** untuk beberapa kota yang dimuat
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
