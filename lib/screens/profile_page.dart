// profile_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  final bool isDarkMode;

  const ProfilePage({Key? key, this.isDarkMode = false}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  // Dropdown value
  String _selectedOccupation = 'Software Developer';
  final List<String> _occupations = [
    'Software Developer',
    'UI/UX Designer',
    'Data Scientist',
    'Project Manager',
    'Student',
    'Other',
  ];

  // Radio button value
  String _selectedGender = 'Female';

  // Date picker value
  DateTime? _selectedBirthDate = DateTime(2005, 8, 20);

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  // Load profile data from SharedPreferences
  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _nameController.text =
          prefs.getString('name') ?? 'Aliyya Rahmawati Putri';
      _emailController.text =
          prefs.getString('email') ?? 'aliyya.rahmawati@mhs.itenas.ac.id';
      _phoneController.text = prefs.getString('phone') ?? '+62 812-3456-7890';
      _addressController.text =
          prefs.getString('address') ?? 'Bandung, Indonesia';
      _bioController.text =
          prefs.getString('bio') ?? 'Flutter Developer & UI/UX Enthusiast';
      _selectedOccupation =
          prefs.getString('occupation') ?? 'Software Developer';
      _selectedGender = prefs.getString('gender') ?? 'Female';

      final birthDateString = prefs.getString('birthDate');
      if (birthDateString != null) {
        _selectedBirthDate = DateTime.parse(birthDateString);
      }

      _isLoading = false;
    });
  }

  // Save profile data to SharedPreferences
  Future<void> _saveProfile() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', _nameController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('phone', _phoneController.text);
    await prefs.setString('address', _addressController.text);
    await prefs.setString('bio', _bioController.text);
    await prefs.setString('occupation', _selectedOccupation);
    await prefs.setString('gender', _selectedGender);

    if (_selectedBirthDate != null) {
      await prefs.setString('birthDate', _selectedBirthDate!.toIso8601String());
    }

    if (!mounted) return;

    final isDark = widget.isDarkMode;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white, size: 20),
            const SizedBox(width: 12),
            const Text(
              'Profile saved successfully!',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        backgroundColor: isDark
            ? const Color(0xFF6B9FB5)
            : const Color(0xFF7FC4DD),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final isDark = widget.isDarkMode;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedBirthDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: isDark
                  ? const Color(0xFF6B9FB5)
                  : const Color(0xFFA8D8EA),
              onPrimary: Colors.white,
              surface: isDark ? const Color(0xFF1A1F25) : Colors.white,
              onSurface: isDark
                  ? const Color(0xFFD5E3E9)
                  : const Color(0xFF2C3E50),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedBirthDate) {
      setState(() {
        _selectedBirthDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDarkMode;

    if (_isLoading) {
      return Scaffold(
        backgroundColor: isDark ? const Color(0xFF12161B) : Colors.white,
        body: Center(
          child: CircularProgressIndicator(
            color: isDark ? const Color(0xFF6B9FB5) : const Color(0xFFA8D8EA),
          ),
        ),
      );
    }

    return Theme(
      data: isDark
          ? ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Color(0xFF6B9FB5),
                surface: Color(0xFF1A1F25),
              ),
            )
          : ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(primary: Color(0xFFA8D8EA)),
            ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: Container(
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
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // Custom App Bar with Back Button
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Row(
                      children: [
                        // Back Button
                        Container(
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
                                    ? Colors.black.withOpacity(0.3)
                                    : const Color(0xFFA8D8EA).withOpacity(0.15),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () => Navigator.pop(context),
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: isDark
                                      ? const Color(0xFF6B9FB5)
                                      : const Color(0xFFA8D8EA),
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Title (Centered)
                        Expanded(
                          child: Center(
                            child: Text(
                              'My Profile',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: isDark
                                    ? const Color(0xFFD5E3E9)
                                    : const Color(0xFF2C3E50),
                              ),
                            ),
                          ),
                        ),

                        // Spacer to balance the back button
                        const SizedBox(width: 50),
                      ],
                    ),
                  ),
                ),

                // Profile Picture Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Column(
                      children: [
                        // Profile Picture with Gradient Border
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: isDark
                                  ? [
                                      const Color(0xFF6B9FB5),
                                      const Color(0xFF5A8A9E),
                                    ]
                                  : [
                                      const Color(0xFFA8D8EA),
                                      const Color(0xFF7FC4DD),
                                    ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: isDark
                                    ? const Color(0xFF6B9FB5).withOpacity(0.3)
                                    : const Color(0xFFA8D8EA).withOpacity(0.4),
                                blurRadius: 30,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isDark
                                  ? const Color(0xFF1A1F25)
                                  : Colors.white,
                            ),
                            padding: const EdgeInsets.all(4),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/aliyyarahma.png',
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 140,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: isDark
                                            ? [
                                                const Color(0xFF6B9FB5),
                                                const Color(0xFF5A8A9E),
                                              ]
                                            : [
                                                const Color(0xFFA8D8EA),
                                                const Color(0xFF7FC4DD),
                                              ],
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.person,
                                      size: 70,
                                      color: Colors.white,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Name
                        Text(
                          'aliyyarahma',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? const Color(0xFFD5E3E9)
                                : const Color(0xFF2C3E50),
                          ),
                        ),
                        const SizedBox(height: 6),

                        // Role/Bio
                        Text(
                          '15-2023-093',
                          style: TextStyle(
                            fontSize: 16,
                            color: isDark
                                ? const Color(0xFF9BA7B0)
                                : const Color(0xFF7A8A99),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Profile Form
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Personal Information Section
                        _buildSectionTitle('Personal Information', isDark),
                        const SizedBox(height: 16),

                        // Full Name
                        _buildTextField(
                          controller: _nameController,
                          label: 'Full Name',
                          icon: Icons.person_outline_rounded,
                          isDark: isDark,
                        ),
                        const SizedBox(height: 16),

                        // Email
                        _buildTextField(
                          controller: _emailController,
                          label: 'Email',
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          isDark: isDark,
                        ),
                        const SizedBox(height: 16),

                        // Phone
                        _buildTextField(
                          controller: _phoneController,
                          label: 'Phone Number',
                          icon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                          isDark: isDark,
                        ),
                        const SizedBox(height: 16),

                        // Address
                        _buildTextField(
                          controller: _addressController,
                          label: 'Address',
                          icon: Icons.location_on_outlined,
                          isDark: isDark,
                        ),
                        const SizedBox(height: 24),

                        // Gender (Radio Button)
                        _buildSectionTitle('Gender', isDark),
                        const SizedBox(height: 12),
                        _buildGenderSelector(isDark),
                        const SizedBox(height: 24),

                        // Birth Date (Calendar Picker)
                        _buildSectionTitle('Date of Birth', isDark),
                        const SizedBox(height: 12),
                        _buildDatePicker(isDark),
                        const SizedBox(height: 24),

                        // Occupation (Dropdown)
                        _buildSectionTitle('Occupation', isDark),
                        const SizedBox(height: 12),
                        _buildDropdown(isDark),
                        const SizedBox(height: 24),

                        // Bio
                        _buildSectionTitle('Bio', isDark),
                        const SizedBox(height: 12),
                        _buildTextField(
                          controller: _bioController,
                          label: 'Tell us about yourself',
                          icon: Icons.edit_outlined,
                          maxLines: 4,
                          isDark: isDark,
                        ),
                        const SizedBox(height: 32),

                        // Save Button
                        _buildSaveButton(isDark),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: isDark ? const Color(0xFFD5E3E9) : const Color(0xFF2C3E50),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool isDark,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1F25) : Colors.white,
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
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: 16,
          color: isDark ? const Color(0xFFD5E3E9) : const Color(0xFF2C3E50),
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: isDark ? const Color(0xFF9BA7B0) : const Color(0xFF7A8A99),
          ),
          prefixIcon: Icon(
            icon,
            color: isDark ? const Color(0xFF6B9FB5) : const Color(0xFFA8D8EA),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildGenderSelector(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1F25) : Colors.white,
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
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: RadioListTile<String>(
              title: Text(
                'Male',
                style: TextStyle(
                  color: isDark
                      ? const Color(0xFFD5E3E9)
                      : const Color(0xFF2C3E50),
                ),
              ),
              value: 'Male',
              groupValue: _selectedGender,
              activeColor: isDark
                  ? const Color(0xFF6B9FB5)
                  : const Color(0xFFA8D8EA),
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
            ),
          ),
          Expanded(
            child: RadioListTile<String>(
              title: Text(
                'Female',
                style: TextStyle(
                  color: isDark
                      ? const Color(0xFFD5E3E9)
                      : const Color(0xFF2C3E50),
                ),
              ),
              value: 'Female',
              groupValue: _selectedGender,
              activeColor: isDark
                  ? const Color(0xFF6B9FB5)
                  : const Color(0xFFA8D8EA),
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDatePicker(bool isDark) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1A1F25) : Colors.white,
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
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              color: isDark ? const Color(0xFF6B9FB5) : const Color(0xFFA8D8EA),
              size: 22,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                _selectedBirthDate != null
                    ? '${_selectedBirthDate!.day}/${_selectedBirthDate!.month}/${_selectedBirthDate!.year}'
                    : 'Select your birth date',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark
                      ? const Color(0xFFD5E3E9)
                      : const Color(0xFF2C3E50),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: isDark ? const Color(0xFF6B9FB5) : const Color(0xFFA8D8EA),
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1F25) : Colors.white,
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
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedOccupation,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: isDark ? const Color(0xFF6B9FB5) : const Color(0xFFA8D8EA),
          ),
          style: TextStyle(
            fontSize: 16,
            color: isDark ? const Color(0xFFD5E3E9) : const Color(0xFF2C3E50),
          ),
          dropdownColor: isDark ? const Color(0xFF1A1F25) : Colors.white,
          items: _occupations.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  Icon(
                    Icons.work_outline_rounded,
                    color: isDark
                        ? const Color(0xFF6B9FB5)
                        : const Color(0xFFA8D8EA),
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(value),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedOccupation = newValue!;
            });
          },
        ),
      ),
    );
  }

  Widget _buildSaveButton(bool isDark) {
    return GestureDetector(
      onTap: _saveProfile,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [const Color(0xFF6B9FB5), const Color(0xFF5A8A9E)]
                : [const Color(0xFFA8D8EA), const Color(0xFF7FC4DD)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? const Color(0xFF6B9FB5).withOpacity(0.3)
                  : const Color(0xFFA8D8EA).withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: const Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.save_rounded, color: Colors.white, size: 22),
              SizedBox(width: 10),
              Text(
                'Save Profile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
