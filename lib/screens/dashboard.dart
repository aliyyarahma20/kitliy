// dashboard.dart
import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'contact_page.dart';
import 'calculator_page.dart';
import 'weather_page.dart';
import 'news_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 2; // Start at Home (center)
  ThemeMode _themeMode = ThemeMode.light;

  // Bottom Navigation Menu items (5 items: Contacts, Calculator, Home, Weather, News)
  final List<Map<String, dynamic>> _navItems = [
    {
      'title': 'Contacts',
      'icon': Icons.contacts_rounded,
      'activeIcon': Icons.contacts_rounded,
    },
    {
      'title': 'Calculator',
      'icon': Icons.calculate_rounded,
      'activeIcon': Icons.calculate_rounded,
    },
    {
      'title': 'Home',
      'icon': Icons.home_rounded,
      'activeIcon': Icons.home_rounded,
    },
    {
      'title': 'Weather',
      'icon': Icons.wb_sunny_rounded,
      'activeIcon': Icons.wb_sunny_rounded,
    },
    {
      'title': 'News',
      'icon': Icons.article_rounded,
      'activeIcon': Icons.article_rounded,
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  void _navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(isDarkMode: _themeMode == ThemeMode.dark),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _themeMode == ThemeMode.light
          ? ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(primary: Color(0xFFA8D8EA)),
            )
          : ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Color(0xFF6B9FB5),
                surface: Color(0xFF1A1F25),
              ),
            ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        body: _buildCurrentPage(),
        bottomNavigationBar: _buildElevatedBottomNavBar(),
      ),
    );
  }

  Widget _buildCurrentPage() {
    switch (_selectedIndex) {
      case 0:
        return Theme(
          data: _themeMode == ThemeMode.light
              ? ThemeData.light().copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: Color(0xFFA8D8EA),
                  ),
                )
              : ThemeData.dark().copyWith(
                  colorScheme: const ColorScheme.dark(
                    primary: Color(0xFF6B9FB5),
                    surface: Color(0xFF1A1F25),
                  ),
                ),
          child: const ContactPage(),
        );
      case 1:
        return const CalculatorPage();
      case 2:
        return _buildDashboardHome();
      case 3:
        return const WeatherPage();
      case 4:
        return const NewsPage();
      default:
        return _buildDashboardHome();
    }
  }

  // Dashboard Home with Widget Cards
  Widget _buildDashboardHome() {
    final isDark = _themeMode == ThemeMode.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [
                  const Color(0xFF12161B),
                  const Color(0xFF151A20),
                  const Color(0xFF1A1F25),
                ]
              : [
                  const Color(0xFFFFFFFF),
                  const Color(0xFFF5FBFD),
                  const Color(0xFFE6F4F9),
                ],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Custom App Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Greeting
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Hello, Aliy!',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: isDark
                                      ? const Color(0xFFD5E3E9)
                                      : const Color(0xFF2C3E50),
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'What would you like to do today?',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: isDark
                                  ? const Color(0xFF9BA7B0)
                                  : const Color(0xFF7A8A99),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Right side buttons (Theme Toggle & Profile)
                    Row(
                      children: [
                        // Theme Toggle Button
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(0xFF1A1F25)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isDark
                                  ? const Color(0xFF6B9FB5).withOpacity(0.3)
                                  : const Color(0xFFA8D8EA).withOpacity(0.3),
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: isDark
                                    ? Colors.black.withOpacity(0.2)
                                    : const Color(0xFFA8D8EA).withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: _toggleTheme,
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Icon(
                                  isDark
                                      ? Icons.light_mode_rounded
                                      : Icons.dark_mode_rounded,
                                  color: isDark
                                      ? const Color(0xFF6B9FB5)
                                      : const Color(0xFFA8D8EA),
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Profile Button
                        Container(
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: isDark
                                  ? [const Color(0xFF6B9FB5), const Color(0xFF5A8A9E)]
                                  : [const Color(0xFFA8D8EA), const Color(0xFF8FC7DD)],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: isDark
                                    ? const Color(0xFF6B9FB5).withOpacity(0.2)
                                    : const Color(0xFFA8D8EA).withOpacity(0.25),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: _navigateToProfile,
                              child: Container(
                                width: 50,
                                height: 50,
                                padding: const EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.asset(
                                    'assets/images/aliyyarahma.png',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 28,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Quick Access Section Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
                child: Text(
                  'Quick Access',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? const Color(0xFFD5E3E9)
                        : const Color(0xFF2C3E50),
                  ),
                ),
              ),
            ),

            // 4 Square Cards (2x2 grid)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildListDelegate([
                  _buildSquareCard(
                    'Weather',
                    '28°C',
                    'Bandung',
                    Icons.wb_sunny_rounded,
                    isDark
                        ? [const Color(0xFF6B9FB5), const Color(0xFF5A8A9E)]
                        : [const Color(0xFFA8D8EA), const Color(0xFF8FC7DD)],
                    3,
                    isDark,
                  ),
                  _buildSquareCard(
                    'Contacts',
                    '15',
                    'Saved',
                    Icons.contacts_rounded,
                    isDark
                        ? [const Color(0xFF5A8A9E), const Color(0xFF4A7588)]
                        : [const Color(0xFF8FC7DD), const Color(0xFF7AB8CE)],
                    0,
                    isDark,
                  ),
                  _buildSquareCard(
                    'Calculator',
                    'Ready',
                    'to Calculate',
                    Icons.calculate_rounded,
                    isDark
                        ? [const Color(0xFF5A8A9E), const Color(0xFF4A7588)]
                        : [const Color(0xFF8FC7DD), const Color(0xFF7AB8CE)],
                    1,
                    isDark,
                  ),
                  _buildSquareCard(
                    'Profile',
                    'View',
                    'My Info',
                    Icons.person_rounded,
                    isDark
                        ? [const Color(0xFF6B9FB5), const Color(0xFF5A8A9E)]
                        : [const Color(0xFFA8D8EA), const Color(0xFF8FC7DD)],
                    -1, // Special: navigate to profile page
                    isDark,
                  ),
                ]),
              ),
            ),

            // Spacing
            const SliverToBoxAdapter(child: SizedBox(height: 24)),

            // Rectangle News Card (Full Width)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: _buildNewsCard(isDark),
              ),
            ),

            // Bottom Spacing for nav bar
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  // Square Card
  Widget _buildSquareCard(
    String title,
    String mainText,
    String subText,
    IconData icon,
    List<Color> gradient,
    int route,
    bool isDark,
  ) {
    return GestureDetector(
      onTap: () {
        if (route == -1) {
          _navigateToProfile();
        } else {
          setState(() => _selectedIndex = route);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradient,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: gradient[0].withOpacity(isDark ? 0.2 : 0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withOpacity(isDark ? 0.1 : 0.3),
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon with background
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(isDark ? 0.15 : 0.25),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              const Spacer(),

              // Title
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : const Color(0xFF2C3E50),
                  letterSpacing: 0.3,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),

              // Main Text (big)
              Text(
                mainText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1.1,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),

              // Sub Text
              Text(
                subText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.9),
                  letterSpacing: 0.2,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Rectangle News Card
  Widget _buildNewsCard(bool isDark) {
    return GestureDetector(
      onTap: () {
        setState(() => _selectedIndex = 4); // Navigate to News page
      },
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [const Color(0xFF6B9FB5), const Color(0xFF5A8A9E)]
                : [const Color(0xFFA8D8EA), const Color(0xFF8FC7DD)],
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? const Color(0xFF6B9FB5).withOpacity(0.2)
                  : const Color(0xFFA8D8EA).withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background pattern/image
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.white.withOpacity(isDark ? 0.05 : 0.1),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Content
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.white.withOpacity(isDark ? 0.1 : 0.3),
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(isDark ? 0.15 : 0.25),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.article_rounded,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),

                  // Bottom content
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        'News',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.white : const Color(0xFF2C3E50),
                          letterSpacing: 0.3,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),

                      // Description
                      Text(
                        'Stay updated with tech headlines',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.9),
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),

                      // Read more indicator
                      Row(
                        children: [
                          Text(
                            'Read More',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color:Colors.white.withOpacity(0.95),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color:Colors.white.withOpacity(0.95),
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Elevated Bottom Navigation Bar
  Widget _buildElevatedBottomNavBar() {
    final isDark = _themeMode == ThemeMode.dark;

    return Container(
      height: 105,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1F25) : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : const Color(0xFFA8D8EA).withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _navItems.length,
              (index) => _buildElevatedNavItem(
                _navItems[index]['icon'],
                _navItems[index]['activeIcon'],
                _navItems[index]['title'],
                index,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Elevated Nav Item
  Widget _buildElevatedNavItem(
    IconData icon,
    IconData activeIcon,
    String label,
    int index,
  ) {
    final isDark = _themeMode == ThemeMode.dark;
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutBack,
        transform: Matrix4.translationValues(0, isSelected ? -35 : 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Circle Icon
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                gradient: isSelected
                    ? LinearGradient(
                        colors: isDark
                            ? [const Color(0xFF6B9FB5), const Color(0xFF5A8A9E)]
                            : [const Color(0xFFA8D8EA), const Color(0xFF8FC7DD)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                color: isSelected ? null : Colors.transparent,
                shape: BoxShape.circle,
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: isDark
                              ? const Color(0xFF6B9FB5).withOpacity(0.3)
                              : const Color(0xFFA8D8EA).withOpacity(0.4),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Icon(
                  isSelected ? activeIcon : icon,
                  color: isSelected
                      ? Colors.white
                      : (isDark
                          ? const Color(0xFF6B7C88)
                          : const Color(0xFF9BA5B0)),
                  size: isSelected ? 28 : 24,
                ),
              ),
            ),

            // Title
            if (isSelected) ...[
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? const Color(0xFFD5E3E9)
                      : const Color(0xFF2C3E50),
                  letterSpacing: 0.2,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }
}