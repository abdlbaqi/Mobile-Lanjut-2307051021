import 'package:flutter/material.dart';
import '../widgets/glass_container.dart';
import 'profile_page.dart';
import 'login_page.dart'; // ✅ ubah sesuai nama file login kamu

/// Halaman Dashboard utama aplikasi
/// Menampilkan saldo, quick actions, dan riwayat transaksi
class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  // Data transaksi contoh
  final List<Map<String, dynamic>> _transactions = [
    {
      'title': 'Top Up',
      'amount': '+Rp 500.000',
      'date': '10 Oct 2025',
      'icon': Icons.arrow_downward,
      'color': Colors.green
    },
    {
      'title': 'Transfer to John',
      'amount': '-Rp 150.000',
      'date': '09 Oct 2025',
      'icon': Icons.arrow_upward,
      'color': Colors.red
    },
    {
      'title': 'Pulsa',
      'amount': '-Rp 50.000',
      'date': '08 Oct 2025',
      'icon': Icons.phone_android,
      'color': Colors.orange
    },
    {
      'title': 'Listrik PLN',
      'amount': '-Rp 200.000',
      'date': '07 Oct 2025',
      'icon': Icons.flash_on,
      'color': Colors.amber
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background gradient
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1E88E5),
              Color(0xFF42A5F5),
              Color(0xFF64B5F6),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header dengan greeting dan tombol logout
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Fuad Abdul Baqi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // 🔥 Tombol logout menggantikan notifikasi
                    GlassContainer(
                      blur: 10,
                      opacity: 0.15,
                      borderRadius: BorderRadius.circular(15),
                      child: IconButton(
                        icon: Icon(Icons.logout, color: Colors.white),
                        onPressed: () {
                          // Arahkan ke halaman login_page
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              
              // Card Saldo dengan glass effect
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GlassContainer(
                  blur: 15,
                  opacity: 0.2,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Saldo',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            Icon(Icons.visibility, color: Colors.white70, size: 20),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Rp 9.500.000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        
                        // Tombol Top Up dan Transfer
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.add, size: 18),
                                label: Text('Top Up'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Color(0xFF1E88E5),
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.send, size: 18),
                                label: Text('Transfer'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  side: BorderSide(color: Colors.white, width: 2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
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
              ),
              
              SizedBox(height: 20),
              
              // Quick Actions (Pulsa, Listrik, dll)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildQuickAction(Icons.phone_android, 'Pulsa'),
                    _buildQuickAction(Icons.flash_on, 'Listrik'),
                    _buildQuickAction(Icons.wifi, 'Internet'),
                    _buildQuickAction(Icons.more_horiz, 'More'),
                  ],
                ),
              ),
              
              SizedBox(height: 20),
              
              // Section Riwayat Transaksi
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transaksi Terbaru',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('See All'),
                            ),
                          ],
                        ),
                      ),
                      
                      // List Transaksi
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          itemCount: _transactions.length,
                          itemBuilder: (context, index) {
                            final transaction = _transactions[index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 15),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  // Icon transaksi
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: transaction['color'].withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      transaction['icon'],
                                      color: transaction['color'],
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  
                                  // Detail transaksi
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          transaction['title'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          transaction['date'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  // Jumlah transaksi
                                  Text(
                                    transaction['amount'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: transaction['amount'].startsWith('+')
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            // Navigasi ke Profile page
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }
          },
          selectedItemColor: Color(0xFF1E88E5),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  /// Widget untuk membuat quick action button
  Widget _buildQuickAction(IconData icon, String label) {
    return GlassContainer(
      blur: 10,
      opacity: 0.15,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 70,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
