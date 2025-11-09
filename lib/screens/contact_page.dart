import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Static contact data (15 contacts) - now mutable
  List<Map<String, dynamic>> _allContacts = [
    {
      'name': 'Amanda Putri',
      'phone': '+62 812-3456-7890',
      'initial': 'AP',
      'color': const Color(0xFFA8D8EA),
      'image': 'assets/images/contacts/contact1.jpg',
    },
    {
      'name': 'Budi Santoso',
      'phone': '+62 813-4567-8901',
      'initial': 'BS',
      'color': const Color(0xFF8EC5D6),
      'image': 'assets/images/contacts/contact2.jpg',
    },
    {
      'name': 'Citra Anggraini',
      'phone': '+62 814-5678-9012',
      'initial': 'CA',
      'color': const Color(0xFF7AB8CE),
      'image': 'assets/images/contacts/contact3.png',
    },
    {
      'name': 'Dimas Pratama',
      'phone': '+62 815-6789-0123',
      'initial': 'DP',
      'color': const Color(0xFF9BD5E8),
      'image': 'assets/images/contacts/contact4.jpg',
    },
    {
      'name': 'Ella Rahmawati',
      'phone': '+62 816-7890-1234',
      'initial': 'ER',
      'color': const Color(0xFF6EAEC4),
      'image': 'assets/images/contacts/contact5.jpg',
    },
    {
      'name': 'Farhan Rizki',
      'phone': '+62 817-8901-2345',
      'initial': 'FR',
      'color': const Color(0xFFA8D8EA),
      'image': 'assets/images/contacts/contact6.jpg',
    },
    {
      'name': 'Gita Sari',
      'phone': '+62 818-9012-3456',
      'initial': 'GS',
      'color': const Color(0xFF8EC5D6),
      'image': 'assets/images/contacts/contact7.jpg',
    },
    {
      'name': 'Hendra Wijaya',
      'phone': '+62 819-0123-4567',
      'initial': 'HW',
      'color': const Color(0xFF7AB8CE),
      'image': 'assets/images/contacts/contact8.jpg',
    },
    {
      'name': 'Intan Permata',
      'phone': '+62 821-1234-5678',
      'initial': 'IP',
      'color': const Color(0xFF9BD5E8),
      'image': 'assets/images/contacts/contact9.jpg',
    },
    {
      'name': 'Joko Susilo',
      'phone': '+62 822-2345-6789',
      'initial': 'JS',
      'color': const Color(0xFF6EAEC4),
      'image': 'assets/images/contacts/contact10.jpg',
    },
    {
      'name': 'Kartika Sari',
      'phone': '+62 823-3456-7890',
      'initial': 'KS',
      'color': const Color(0xFFA8D8EA),
      'image': 'assets/images/contacts/contact11.jpg',
    },
    {
      'name': 'Luthfi Rahman',
      'phone': '+62 824-4567-8901',
      'initial': 'LR',
      'color': const Color(0xFF8EC5D6),
      'image': 'assets/images/contacts/contact12.jpg',
    },
    {
      'name': 'Maya Angelina',
      'phone': '+62 825-5678-9012',
      'initial': 'MA',
      'color': const Color(0xFF7AB8CE),
      'image': 'assets/images/contacts/contact13.jpg',
    },
    {
      'name': 'Nabil Akbar',
      'phone': '+62 826-6789-0123',
      'initial': 'NA',
      'color': const Color(0xFF9BD5E8),
      'image': 'assets/images/contacts/contact14.jpg',
    },
    {
      'name': 'Olivia Tania',
      'phone': '+62 827-7890-1234',
      'initial': 'OT',
      'color': const Color(0xFF6EAEC4),
      'image': 'assets/images/contacts/contact15.jpg',
    },
  ];

  List<Map<String, dynamic>> get _filteredContacts {
    if (_searchQuery.isEmpty) {
      return _allContacts;
    }
    return _allContacts
        .where(
          (contact) =>
              contact['name'].toLowerCase().contains(
                _searchQuery.toLowerCase(),
              ) ||
              contact['phone'].contains(_searchQuery),
        )
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [
                    const Color(0xFF151E28),
                    const Color(0xFF1A2332),
                    const Color(0xFF1E2A38),
                  ]
                : [
                    const Color(0xFFFFFFFF),
                    const Color(0xFFF5FBFD),
                    const Color(0xFFEAF6FA),
                  ],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Custom App Bar
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      'Contacs',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? const Color(0xFFE8F0F5)
                            : const Color(0xFF2C3E50),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFA8D8EA).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFA8D8EA).withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        '${_filteredContacts.length} contacts',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFA8D8EA),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Add Contact Button
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFA8D8EA), Color(0xFF7FC4DD)],
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFA8D8EA).withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.person_add_rounded,
                          color: Colors.white,
                          size: 22,
                        ),
                        onPressed: () => _showAddContactDialog(context),
                        tooltip: 'Add Contact',
                      ),
                    ),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF1E2A38) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFA8D8EA).withOpacity(0.3),
                      width: 1,
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
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    style: TextStyle(
                      color: isDark
                          ? const Color(0xFFE8F0F5)
                          : const Color(0xFF2C3E50),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search contacts...',
                      hintStyle: TextStyle(
                        color: isDark
                            ? const Color(0xFF7A8A99)
                            : const Color(0xFF9BA5B0),
                      ),
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: Color(0xFFA8D8EA),
                      ),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(
                                Icons.clear_rounded,
                                color: Color(0xFFA8D8EA),
                              ),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _searchQuery = '';
                                });
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Contact List
              Expanded(
                child: _filteredContacts.isEmpty
                    ? _buildEmptyState(isDark)
                    : ListView.builder(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 100,
                        ),
                        itemCount: _filteredContacts.length,
                        itemBuilder: (context, index) {
                          return _buildContactCard(
                            _filteredContacts[index],
                            isDark,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard(Map<String, dynamic> contact, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2A38) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: contact['color'].withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : contact['color'].withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            _showContactDetail(contact, isDark);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        contact['color'],
                        contact['color'].withOpacity(0.7),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: contact['color'].withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      contact['image'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback to initial if image not found
                        return Center(
                          child: Text(
                            contact['initial'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // Contact Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: isDark
                              ? const Color(0xFFE8F0F5)
                              : const Color(0xFF2C3E50),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        contact['phone'],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isDark
                              ? const Color(0xFFB0BEC5)
                              : const Color(0xFF7A8A99),
                        ),
                      ),
                    ],
                  ),
                ),

                // Call Button
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: contact['color'].withOpacity(0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.phone_rounded,
                      color: contact['color'],
                      size: 20,
                    ),
                    onPressed: () {
                      _makeCall(contact);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFA8D8EA).withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_search_rounded,
              size: 50,
              color: Color(0xFFA8D8EA),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'No contacts found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDark ? const Color(0xFFE8F0F5) : const Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try searching with different keywords',
            style: TextStyle(
              fontSize: 14,
              color: isDark ? const Color(0xFFB0BEC5) : const Color(0xFF7A8A99),
            ),
          ),
        ],
      ),
    );
  }

  void _showContactDetail(Map<String, dynamic> contact, bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E2A38) : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFA8D8EA).withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 30),

            // Avatar
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [contact['color'], contact['color'].withOpacity(0.7)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: contact['color'].withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  contact['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text(
                        contact['initial'],
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Name
            Text(
              contact['name'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: isDark
                    ? const Color(0xFFE8F0F5)
                    : const Color(0xFF2C3E50),
              ),
            ),

            const SizedBox(height: 8),

            // Phone
            Text(
              contact['phone'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isDark
                    ? const Color(0xFFB0BEC5)
                    : const Color(0xFF7A8A99),
              ),
            ),

            const SizedBox(height: 40),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      Icons.phone_rounded,
                      'Call',
                      contact['color'],
                      () {
                        Navigator.pop(context);
                        _makeCall(contact);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildActionButton(
                      Icons.message_rounded,
                      'Message',
                      contact['color'],
                      () {
                        Navigator.pop(context);
                        _sendMessage(contact);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    IconData icon,
    String label,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        shadowColor: color.withOpacity(0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  void _makeCall(Map<String, dynamic> contact) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Calling ${contact['name']}...'),
        backgroundColor: const Color(0xFFA8D8EA),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _sendMessage(Map<String, dynamic> contact) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sending message to ${contact['name']}...'),
        backgroundColor: const Color(0xFFA8D8EA),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  // Add Contact Dialog
  void _showAddContactDialog(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final nameController = TextEditingController();
    final phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? const Color(0xFF1E2A38) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFA8D8EA).withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.person_add_rounded,
                color: Color(0xFFA8D8EA),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Add Contact',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: isDark
                    ? const Color(0xFFE8F0F5)
                    : const Color(0xFF2C3E50),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Name Field
            TextField(
              controller: nameController,
              style: TextStyle(
                color: isDark
                    ? const Color(0xFFE8F0F5)
                    : const Color(0xFF2C3E50),
              ),
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: isDark
                      ? const Color(0xFFB0BEC5)
                      : const Color(0xFF7A8A99),
                ),
                prefixIcon: const Icon(
                  Icons.person_outline,
                  color: Color(0xFFA8D8EA),
                ),
                filled: true,
                fillColor: isDark
                    ? const Color(0xFF151E28)
                    : const Color(0xFFF5FBFD),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Phone Field
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              style: TextStyle(
                color: isDark
                    ? const Color(0xFFE8F0F5)
                    : const Color(0xFF2C3E50),
              ),
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  color: isDark
                      ? const Color(0xFFB0BEC5)
                      : const Color(0xFF7A8A99),
                ),
                prefixIcon: const Icon(
                  Icons.phone_outlined,
                  color: Color(0xFFA8D8EA),
                ),
                filled: true,
                fillColor: isDark
                    ? const Color(0xFF151E28)
                    : const Color(0xFFF5FBFD),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: isDark
                    ? const Color(0xFFB0BEC5)
                    : const Color(0xFF7A8A99),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  phoneController.text.isNotEmpty) {
                _addContact(nameController.text, phoneController.text);
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFA8D8EA),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Add',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  // Add Contact Method
  void _addContact(String name, String phone) {
    final colors = [
      const Color(0xFFA8D8EA),
      const Color(0xFF8EC5D6),
      const Color(0xFF7AB8CE),
      const Color(0xFF9BD5E8),
      const Color(0xFF6EAEC4),
    ];

    setState(() {
      _allContacts.add({
        'name': name,
        'phone': phone,
        'initial': name
            .split(' ')
            .map((e) => e[0])
            .take(2)
            .join()
            .toUpperCase(),
        'color': colors[_allContacts.length % colors.length],
        'image': 'assets/images/contacts/contact${_allContacts.length + 1}.jpg',
      });

      // Sort contacts alphabetically by name
      _allContacts.sort(
        (a, b) => a['name'].toString().toLowerCase().compareTo(
          b['name'].toString().toLowerCase(),
        ),
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name added to contacts!'),
        backgroundColor: const Color(0xFFA8D8EA),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
