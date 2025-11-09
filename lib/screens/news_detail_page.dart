// news_detail_page.dart
import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  final Map<String, dynamic> article;

  const NewsDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [
                      const Color(0xFF151E28),
                      const Color(0xFF1A2332),
                    ]
                  : [
                      const Color(0xFFFFFFFF),
                      const Color(0xFFF5FBFD),
                    ],
            ),
          ),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // App Bar with Image
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                backgroundColor: isDark ? const Color(0xFF1A2332) : Colors.white,
                leading: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF1E2A38).withOpacity(0.9)
                        : Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: isDark ? const Color(0xFFE8F0F5) : const Color(0xFF2C3E50),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Image
                      Image.network(
                        article['image'],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFFA8D8EA).withOpacity(0.3),
                                  const Color(0xFF7FC4DD).withOpacity(0.2),
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.article_rounded,
                                size: 80,
                                color: Color(0xFFA8D8EA),
                              ),
                            ),
                          );
                        },
                      ),
                      // Gradient overlay
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                isDark
                                    ? const Color(0xFF151E28)
                                    : Colors.white,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Content
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Source & Date
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFA8D8EA).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFFA8D8EA).withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.source_rounded,
                                  size: 14,
                                  color: Color(0xFFA8D8EA),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  article['source'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFA8D8EA),
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.access_time_rounded,
                            size: 14,
                            color: isDark
                                ? const Color(0xFFB0BEC5)
                                : const Color(0xFF7A8A99),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            _formatDate(article['date']),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: isDark
                                  ? const Color(0xFFB0BEC5)
                                  : const Color(0xFF7A8A99),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Title
                      Text(
                        article['title'],
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? const Color(0xFFE8F0F5)
                              : const Color(0xFF2C3E50),
                          height: 1.3,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Description
                      Text(
                        article['description'],
                        style: TextStyle(
                          fontSize: 16,
                          color: isDark
                              ? const Color(0xFFB0BEC5)
                              : const Color(0xFF7A8A99),
                          height: 1.6,
                          letterSpacing: 0.2,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Full Article Content (Dummy)
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF1E2A38).withOpacity(0.5)
                              : const Color(0xFFF5FBFD),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFA8D8EA).withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.article_outlined,
                                  size: 20,
                                  color: isDark
                                      ? const Color(0xFFA8D8EA)
                                      : const Color(0xFF7A8A99),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Full Article',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: isDark
                                        ? const Color(0xFFE8F0F5)
                                        : const Color(0xFF2C3E50),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _generateFullContent(article['title']),
                              style: TextStyle(
                                fontSize: 15,
                                color: isDark
                                    ? const Color(0xFFB0BEC5)
                                    : const Color(0xFF7A8A99),
                                height: 1.7,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Share & Bookmark Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Article shared!'),
                                    backgroundColor: const Color(0xFFA8D8EA),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    margin: const EdgeInsets.all(16),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.share_rounded, size: 20),
                              label: const Text(
                                'Share',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFA8D8EA),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            decoration: BoxDecoration(
                              color: isDark
                                  ? const Color(0xFF1E2A38)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFFA8D8EA).withOpacity(0.3),
                                width: 1.5,
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Bookmarked!'),
                                    backgroundColor: const Color(0xFFA8D8EA),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    margin: const EdgeInsets.all(16),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.bookmark_border_rounded),
                              color: const Color(0xFFA8D8EA),
                              iconSize: 24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays == 0) {
      if (diff.inHours == 0) {
        return '${diff.inMinutes} minutes ago';
      }
      return '${diff.inHours} hours ago';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  String _generateFullContent(String title) {
    // Generate dummy full article content based on title
    return '''In a groundbreaking development that has captured the attention of the global technology community, $title

This remarkable achievement represents a significant milestone in the ongoing evolution of modern technology. Industry experts have praised the innovation for its potential to transform the way we interact with technology in our daily lives.

The development team behind this breakthrough has been working tirelessly for several years, overcoming numerous technical challenges and pushing the boundaries of what was previously thought possible. Their dedication and expertise have finally paid off with this historic announcement.

Key Highlights:
• Revolutionary approach to solving complex problems
• Significant improvements in efficiency and performance
• Potential applications across multiple industries
• Strong support from leading technology companies
• Expected to influence future developments in the field

Looking ahead, this innovation is expected to pave the way for even more exciting developments in the near future. Researchers and developers around the world are already exploring ways to build upon this foundation and create new applications that could benefit millions of people.

The implications of this breakthrough extend far beyond the immediate technical achievements. It represents a fundamental shift in how we think about technology and its role in shaping our future. As we continue to push the boundaries of innovation, developments like this remind us of the incredible potential that lies ahead.

Industry analysts predict that this will be remembered as a defining moment in the history of technology, one that will be studied and celebrated for years to come.''';
  }
}