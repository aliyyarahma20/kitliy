// weather_page.dart
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Map<String, dynamic>? weatherData;
  bool isLoading = true;
  String errorMessage = '';
  final ScrollController _scrollController = ScrollController();
  double _headerOpacity = 1.0;

  final Map<String, String> locations = {
    'Bandung': '32.73.19.1001',
    'Jakarta': '31.71.04.1001',
    'Surabaya': '35.78.13.1001',
    'Yogyakarta': '34.71.05.1001',
    'Semarang': '33.74.09.1001',
    'Medan': '12.71.10.1001',
    'Makassar': '73.71.10.1001',
  };

  String selectedCity = 'Bandung';
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      final offset = _scrollController.offset;
      setState(() {
        _headerOpacity = (1.0 - (offset / 200)).clamp(0.0, 1.0);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchWeatherData() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final adm4Code = locations[selectedCity]!;
      final response = await http.get(
        Uri.parse('https://api.bmkg.go.id/publik/prakiraan-cuaca?adm4=$adm4Code'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          weatherData = data;
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load data (${response.statusCode})';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Unable to connect to server';
        isLoading = false;
      });
    }
  }

  void _showLocationPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: _isDarkMode ? const Color(0xFF1E2A38) : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFF7A8A99).withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Select Location',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _isDarkMode ? const Color(0xFFE8F0F5) : const Color(0xFF2C3E50),
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  final city = locations.keys.elementAt(index);
                  final isSelected = city == selectedCity;
                  return ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: isSelected ? const Color(0xFFA8D8EA) : const Color(0xFF7A8A99),
                    ),
                    title: Text(
                      city,
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? const Color(0xFFA8D8EA) : null,
                      ),
                    ),
                    trailing: isSelected ? const Icon(Icons.check, color: Color(0xFFA8D8EA)) : null,
                    onTap: () {
                      setState(() {
                        selectedCity = city;
                      });
                      Navigator.pop(context);
                      fetchWeatherData();
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget buat icon cuaca dengan matahari untuk Mostly Clear
  Widget getWeatherIconWidget(int? code, {double size = 44}) {
    if (code == null) return Icon(Icons.cloud, size: size, color: const Color(0xFFA8D8EA));

    // Mostly Clear - Matahari dengan awan kecil ⛅
    if (code == 1) {
      return SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              top: size * 0.1,
              child: Icon(
                Icons.wb_sunny,
                size: size * 0.7,
                color: const Color(0xFFFDB813),
              ),
            ),
            Positioned(
              right: 0,
              bottom: size * 0.1,
              child: Icon(
                Icons.cloud,
                size: size * 0.5,
                color: const Color(0xFFA8D8EA),
              ),
            ),
          ],
        ),
      );
    }

    // Icon lainnya
    IconData iconData;
    Color iconColor = const Color(0xFFA8D8EA);

    if (code == 0) {
      iconData = Icons.wb_sunny; // ☀️ Sunny
      iconColor = const Color(0xFFFDB813);
    } else if (code == 2) {
      iconData = Icons.cloud_queue; // ⛅ Partly Cloudy
    } else if (code == 3) {
      iconData = Icons.cloud; // ☁️ Cloudy
    } else if (code == 4) {
      iconData = Icons.cloud; // ☁️ Overcast
    } else if (code >= 60 && code <= 63) {
      iconData = Icons.cloudy_snowing; // 🌧️ Rainy
    } else if (code >= 95 && code <= 97) {
      iconData = Icons.thunderstorm; // ⛈️ Thunderstorm
    } else {
      iconData = Icons.cloud;
    }

    return Icon(iconData, size: size, color: iconColor);
  }

  IconData getWeatherIcon(int? code) {
    if (code == null) return Icons.cloud;
    if (code == 0) return Icons.wb_sunny;
    if (code == 1) return Icons.wb_cloudy;
    if (code == 2) return Icons.cloud_queue;
    if (code == 3) return Icons.cloud;
    if (code == 4) return Icons.cloud;
    if (code >= 60 && code <= 63) return Icons.cloudy_snowing;
    if (code >= 95 && code <= 97) return Icons.thunderstorm;
    return Icons.cloud;
  }

  String getWeatherDescription(int? code, String? desc) {
    if (code == null) return 'Unknown';
    if (code == 0) return 'Sunny';
    if (code == 1) return 'Mostly Clear';
    if (code == 2) return 'Partly Cloudy';
    if (code == 3) return 'Cloudy';
    if (code == 4) return 'Overcast';
    if (code >= 60 && code <= 63) return 'Rainy';
    if (code >= 95 && code <= 97) return 'Thunderstorm';
    return 'Cloudy';
  }

  String getMonthName(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }

  String getDayName(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    _isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        color: _isDarkMode ? const Color(0xFF151E28) : Colors.white,
        child: SafeArea(
          bottom: false,
          child: isLoading
              ? _buildLoadingState()
              : errorMessage.isNotEmpty
                  ? _buildErrorState()
                  : _buildWeatherContent(),
        ),
      ),
    );
  }

  int? _getCurrentWeatherCode() {
    if (weatherData == null) return null;
    final data = weatherData!['data'];
    if (data == null || data.isEmpty) return null;
    final cuacaList = data[0]['cuaca'] ?? [];
    if (cuacaList.isEmpty || cuacaList[0].isEmpty) return null;
    return cuacaList[0][0]['weather'] as int?;
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFA8D8EA).withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const CircularProgressIndicator(
              color: Color(0xFFA8D8EA),
              strokeWidth: 3,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Loading Weather...',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: _isDarkMode ? const Color(0xFFE8F0F5) : const Color(0xFF2C3E50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_off,
              size: 80,
              color: _isDarkMode ? const Color(0xFF7A8A99) : const Color(0xFFA8D8EA),
            ),
            const SizedBox(height: 24),
            Text(
              'Unable to Load',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: _isDarkMode ? const Color(0xFFE8F0F5) : const Color(0xFF2C3E50),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: _isDarkMode ? const Color(0xFFB0BEC5) : const Color(0xFF7A8A99),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: fetchWeatherData,
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA8D8EA),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherContent() {
    if (weatherData == null) return const SizedBox();

    final data = weatherData!['data'];
    if (data == null || data.isEmpty) return const SizedBox();

    final location = data[0];
    final cuacaList = location['cuaca'] ?? [];

    if (cuacaList.isEmpty || cuacaList[0].isEmpty) return const SizedBox();

    final currentWeather = cuacaList[0][0];
    final weatherCode = _getCurrentWeatherCode();

    // Flatten all forecasts for hourly
    List<Map<String, dynamic>> allForecasts = [];
    for (var dayData in cuacaList) {
      if (dayData is List) {
        for (var item in dayData) {
          if (item is Map<String, dynamic>) {
            allForecasts.add(item);
          }
        }
      }
    }

    // Get daily forecasts
    Map<String, List<Map<String, dynamic>>> dailyForecasts = {};
    for (var forecast in allForecasts) {
      final datetime = forecast['local_datetime'] as String?;
      if (datetime != null) {
        final date = datetime.split(' ')[0];
        if (!dailyForecasts.containsKey(date)) {
          dailyForecasts[date] = [];
        }
        dailyForecasts[date]!.add(forecast);
      }
    }

    // Ensure minimum 5 days
    final now = DateTime.now();
    for (int i = 0; i < 5; i++) {
      final futureDate = now.add(Duration(days: i));
      final dateKey = '${futureDate.year}-${futureDate.month.toString().padLeft(2, '0')}-${futureDate.day.toString().padLeft(2, '0')}';
      if (!dailyForecasts.containsKey(dateKey)) {
        dailyForecasts[dateKey] = [];
      }
    }

    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Sticky Header - FIX OVERFLOW: Tinggi dan spacing minimal
        SliverAppBar(
          expandedHeight: 170,
          floating: false,
          pinned: true,
          backgroundColor: _isDarkMode ? const Color(0xFF151E28) : Colors.white,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            background: Opacity(
              opacity: _headerOpacity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: _showLocationPicker,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: _isDarkMode
                            ? const Color(0xFF1E2A38).withOpacity(0.6)
                            : const Color(0xFFF5FBFD),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFA8D8EA).withOpacity(0.3),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.location_on, color: Color(0xFFA8D8EA), size: 14),
                          const SizedBox(width: 5),
                          Text(
                            selectedCity,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: _isDarkMode ? const Color(0xFFE8F0F5) : const Color(0xFF2C3E50),
                            ),
                          ),
                          const SizedBox(width: 3),
                          Icon(
                            Icons.expand_more,
                            color: _isDarkMode ? const Color(0xFFE8F0F5) : const Color(0xFF2C3E50),
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${currentWeather['t'] ?? '--'}°',
                    style: TextStyle(
                      fontSize: 58,
                      fontWeight: FontWeight.w200,
                      color: _isDarkMode ? const Color(0xFFE8F0F5) : const Color(0xFF2C3E50),
                      height: 0.95,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    getWeatherDescription(weatherCode, null),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: _isDarkMode ? const Color(0xFFB0BEC5) : const Color(0xFF7A8A99),
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            title: _headerOpacity < 0.5
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      getWeatherIconWidget(weatherCode, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        '${currentWeather['t'] ?? '--'}°',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _isDarkMode ? const Color(0xFFE8F0F5) : const Color(0xFF2C3E50),
                        ),
                      ),
                    ],
                  )
                : null,
          ),
        ),

        // Info Cards - ULTRA COMPACT VERSION
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoCard(
                        'Humidity',
                        '${currentWeather['hu'] ?? '--'}%',
                        Icons.water_drop,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildInfoCard(
                        'Feels Like',
                        '${currentWeather['t'] ?? '--'}°',
                        Icons.thermostat,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoCard(
                        'Wind',
                        '${currentWeather['ws'] ?? '--'}',
                        Icons.air,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildInfoCard(
                        'Visibility',
                        '${currentWeather['vs_text'] ?? '--'}',
                        Icons.visibility,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Hourly Forecast
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hourly Forecast',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: _isDarkMode ? const Color(0xFFE8F0F5) : const Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                    color: _isDarkMode
                        ? const Color(0xFF1E2A38).withOpacity(0.6)
                        : const Color(0xFFF5FBFD),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: const Color(0xFFA8D8EA).withOpacity(0.3),
                      width: 1.5,
                    ),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    itemCount: allForecasts.length > 12 ? 12 : allForecasts.length,
                    itemBuilder: (context, index) {
                      final forecast = allForecasts[index];
                      final time = forecast['local_datetime'] as String?;
                      final hour = time != null ? time.split(' ')[1].substring(0, 5) : '--';
                      return _buildHourlyItem(
                        hour,
                        forecast['weather'] as int?,
                        forecast['t'] ?? '--',
                        index == 0,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        // Daily Forecast Header
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, color: Color(0xFFA8D8EA), size: 16),
                const SizedBox(width: 8),
                Text(
                  'Daily Forecast',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: _isDarkMode ? const Color(0xFFE8F0F5) : const Color(0xFF2C3E50),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Daily Forecast List (minimum 5 days)
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final sortedEntries = dailyForecasts.entries.toList()
                  ..sort((a, b) => a.key.compareTo(b.key));
                final entry = sortedEntries[index];
                return _buildDailyForecastCard(entry.key, entry.value);
              },
              childCount: dailyForecasts.length >= 5 ? dailyForecasts.length : 5,
            ),
          ),
        ),

        // BMKG Attribution
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Center(
              child: Text(
                'Data by BMKG',
                style: TextStyle(
                  fontSize: 11,
                  color: _isDarkMode ? const Color(0xFF7A8A99) : const Color(0xFFB0BEC5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // PERBAIKAN FINAL: Padding minimal dan layout lebih ketat
  Widget _buildInfoCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: _isDarkMode
            ? const Color(0xFF1E2A38).withOpacity(0.6)
            : const Color(0xFFF5FBFD),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFA8D8EA).withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFFA8D8EA), size: 18),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: _isDarkMode ? const Color(0xFFE8F0F5) : const Color(0xFF2C3E50),
              height: 1.1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 1),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: _isDarkMode ? const Color(0xFFB0BEC5) : const Color(0xFF7A8A99),
              height: 1.1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildHourlyItem(String time, int? weatherCode, dynamic temp, bool isNow) {
    return Container(
      width: 60,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isNow ? 'Now' : time,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isNow
                  ? const Color(0xFFA8D8EA)
                  : (_isDarkMode ? const Color(0xFFB0BEC5) : const Color(0xFF7A8A99)),
            ),
          ),
          getWeatherIconWidget(weatherCode, size: 28),
          Text(
            '$temp°',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _isDarkMode ? const Color(0xFFE8F0F5) : const Color(0xFF2C3E50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyForecastCard(String date, List<Map<String, dynamic>> forecasts) {
    int maxTemp = 25;
    int minTemp = 18;
    int? weatherCode = 1;

    if (forecasts.isNotEmpty) {
      maxTemp = forecasts[0]['t'] ?? 25;
      minTemp = forecasts[0]['t'] ?? 18;

      for (var f in forecasts) {
        int temp = f['t'] ?? 0;
        if (temp > maxTemp) maxTemp = temp;
        if (temp < minTemp) minTemp = temp;

        final time = f['local_datetime'] as String?;
        if (time != null && time.contains('12:')) {
          weatherCode = f['weather'] as int?;
        }
      }
      weatherCode ??= forecasts[0]['weather'] as int?;
    }

    final dateTime = DateTime.parse(date);
    final dayName = getDayName(dateTime.weekday);
    final monthName = getMonthName(dateTime.month);
    final dayLabel = '$dayName, $monthName ${dateTime.day}';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: _isDarkMode
            ? const Color(0xFF1E2A38).withOpacity(0.6)
            : const Color(0xFFF5FBFD),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFA8D8EA).withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 85,
            child: Text(
              dayLabel,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: _isDarkMode ? const Color(0xFFE8F0F5) : const Color(0xFF2C3E50),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          getWeatherIconWidget(weatherCode, size: 24),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              getWeatherDescription(weatherCode, null),
              style: TextStyle(
                fontSize: 11,
                color: _isDarkMode ? const Color(0xFFB0BEC5) : const Color(0xFF7A8A99),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(width: 6),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$minTemp°',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: _isDarkMode
                      ? const Color(0xFFB0BEC5)
                      : const Color(0xFF7A8A99),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: 25,
                height: 2,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF7FC4DD), Color(0xFFA8D8EA)],
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '$maxTemp°',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: _isDarkMode ? const Color(0xFFE8F0F5) : const Color(0xFF2C3E50),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}