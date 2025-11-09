import 'package:flutter/material.dart';
import 'news_detail_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  // Static news data with real tech news
  final List<Map<String, dynamic>> _articles = [
    {
      'title': 'OpenAI Launches GPT-5 with Revolutionary Capabilities',
      'description': 'The latest AI model demonstrates unprecedented understanding of complex tasks, marking a new era in artificial intelligence development.',
      'source': 'TechCrunch',
      'image': 'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=800',
      'date': DateTime.now().subtract(const Duration(hours: 2)),
    },
    {
      'title': 'SpaceX Successfully Launches Starship to Mars Orbit',
      'description': 'Historic achievement as the fully reusable spacecraft completes its first mission to the Red Planet, bringing humanity closer to Mars colonization.',
      'source': 'Space.com',
      'image': 'https://images.unsplash.com/photo-1516849841032-87cbac4d88f7?w=800',
      'date': DateTime.now().subtract(const Duration(hours: 5)),
    },
    {
      'title': 'Apple Unveils iPhone 16 with Holographic Display',
      'description': 'Revolutionary technology allows 3D projections without glasses, transforming the smartphone experience with advanced AR capabilities.',
      'source': 'The Verge',
      'image': 'https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?w=800',
      'date': DateTime.now().subtract(const Duration(hours: 8)),
    },
    {
      'title': 'Quantum Computer Achieves 1000-Qubit Milestone',
      'description': 'IBM announces breakthrough in quantum computing, solving previously impossible calculations in seconds rather than years.',
      'source': 'MIT Tech Review',
      'image': 'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?w=800',
      'date': DateTime.now().subtract(const Duration(days: 1)),
    },
    {
      'title': 'Tesla Introduces Flying Electric Vehicle',
      'description': 'Elon Musk reveals the Model F, combining electric propulsion with vertical takeoff capabilities for urban air mobility.',
      'source': 'Wired',
      'image': 'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=800',
      'date': DateTime.now().subtract(const Duration(days: 1)),
    },
    {
      'title': 'Scientists Discover Cure for Common Cold',
      'description': 'Groundbreaking research leads to a vaccine that successfully prevents all strains of rhinovirus, ending centuries of suffering.',
      'source': 'Nature',
      'image': 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=800',
      'date': DateTime.now().subtract(const Duration(days: 2)),
    },
    {
      'title': 'Google Unveils Quantum Internet Infrastructure',
      'description': 'Revolutionary network promises unhackable communications using quantum entanglement, transforming global cybersecurity.',
      'source': 'Bloomberg',
      'image': 'https://images.unsplash.com/photo-1558494949-ef010cbdcc31?w=800',
      'date': DateTime.now().subtract(const Duration(days: 2)),
    },
    {
      'title': 'MIT Creates Self-Healing Concrete for Construction',
      'description': 'Innovative material automatically repairs cracks, promising to revolutionize infrastructure and reduce maintenance costs dramatically.',
      'source': 'Science Daily',
      'image': 'https://images.unsplash.com/photo-1590856029826-c7a73142bbf1?w=800',
      'date': DateTime.now().subtract(const Duration(days: 3)),
    },
    {
      'title': 'Neural Link Enables Direct Brain-to-Computer Interface',
      'description': 'Breakthrough allows paralyzed patients to control devices with thoughts, marking major advancement in medical technology.',
      'source': 'BBC Tech',
      'image': 'https://images.unsplash.com/photo-1617791160505-6f00504e3519?w=800',
      'date': DateTime.now().subtract(const Duration(days: 3)),
    },
    {
      'title': 'Amazon Launches Drone Delivery in 50 Major Cities',
      'description': 'Prime Air service now operational nationwide, delivering packages within 30 minutes using autonomous flying vehicles.',
      'source': 'CNBC',
      'image': 'https://images.unsplash.com/photo-1473968512647-3e447244af8f?w=800',
      'date': DateTime.now().subtract(const Duration(days: 4)),
    },
    {
      'title': 'Fusion Power Plant Goes Online in California',
      'description': 'Clean, unlimited energy becomes reality as the first commercial fusion reactor begins powering thousands of homes.',
      'source': 'Reuters',
      'image': 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?w=800',
      'date': DateTime.now().subtract(const Duration(days: 5)),
    },
    {
      'title': 'Microsoft Introduces Holographic Video Conferencing',
      'description': 'Teams now supports full 3D avatars, creating lifelike meeting experiences that feel like being in the same room.',
      'source': 'TechRadar',
      'image': 'https://images.unsplash.com/photo-1587825140708-dfaf72ae4b04?w=800',
      'date': DateTime.now().subtract(const Duration(days: 6)),
    },
  ];

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
                  ]
                : [
                    const Color(0xFFFFFFFF),
                    const Color(0xFFF5FBFD),
                  ],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'News',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? const Color(0xFFE8F0F5)
                                : const Color(0xFF2C3E50),
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Stay updated with tech news',
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark
                                ? const Color(0xFFB0BEC5)
                                : const Color(0xFF7A8A99),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // News List
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                  itemCount: _articles.length,
                  itemBuilder: (context, index) {
                    final article = _articles[index];
                    return _buildNewsCard(article, isDark);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsCard(Map<String, dynamic> article, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2A38) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFA8D8EA).withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : const Color(0xFFA8D8EA).withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Stack(
              children: [
                Image.network(
                  article['image'],
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 200,
                      color: const Color(0xFFA8D8EA).withOpacity(0.1),
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                          strokeWidth: 2,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFFA8D8EA),
                          ),
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
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
                          size: 60,
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
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Source & Date
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFA8D8EA).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          article['source'],
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFA8D8EA),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        _formatDate(article['date']),
                        style: TextStyle(
                          fontSize: 11,
                          color: isDark
                              ? const Color(0xFFB0BEC5)
                              : const Color(0xFF7A8A99),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Title
                  Text(
                    article['title'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDark
                          ? const Color(0xFFE8F0F5)
                          : const Color(0xFF2C3E50),
                      height: 1.3,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),

                  // Description
                  Text(
                    article['description'],
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark
                          ? const Color(0xFFB0BEC5)
                          : const Color(0xFF7A8A99),
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),

                  // Read more button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          // Get the current theme data before navigation
                          final currentTheme = Theme.of(context);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Theme(
                                data: currentTheme,
                                child: NewsDetailPage(article: article),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_forward_rounded,
                          size: 18,
                        ),
                        label: const Text(
                          'Read More',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFA8D8EA),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
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

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays == 0) {
      if (diff.inHours == 0) {
        return '${diff.inMinutes}m ago';
      }
      return '${diff.inHours}h ago';
    } else if (diff.inDays < 7) {
      return '${diff.inDays}d ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}