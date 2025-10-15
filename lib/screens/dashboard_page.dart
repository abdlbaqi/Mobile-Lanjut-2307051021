import 'package:flutter/material.dart';
import '../widgets/glass_container.dart';
import 'profile_page.dart';
import 'login_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  // data dummy transaksi
  final List<Map<String, dynamic>> _transactions = [
    {
      'title': 'Top Up',
      'amount': '+Rp 500.000',
      'date': '10 Oct 2025',
      'icon': Icons.arrow_downward,
      'color': Colors.green
    },
  ];

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF1E88E5), Color(0xFF42A5F5), Color(0xFF64B5F6)],
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GlassContainer(
                  blur: 15,
                  opacity: 0.2,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSaldoHeader(),
                        const SizedBox(height: 10),
                        const Text(
                          'Rp 9.500.000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildSaldoButtons(),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
              const SizedBox(height: 20),
              _buildTransactionSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildHeader(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello,', style: TextStyle(color: Colors.white70, fontSize: 16)),
                Text('Fuad Abdul Baqi',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
            GlassContainer(
              blur: 10,
              opacity: 0.15,
              borderRadius: BorderRadius.circular(15),
              child: IconButton(
                icon: const Icon(Icons.logout, color: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
              ),
            ),
          ],
        ),
      );

  Widget _buildSaldoHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Total Saldo', style: TextStyle(color: Colors.white70, fontSize: 14)),
          Icon(Icons.visibility, color: Colors.white70, size: 20),
        ],
      );

  Widget _buildSaldoButtons() => Row(
        children: [
          _buildButton(onPressed: () {}, label: 'Top Up', icon: Icons.add, filled: true),
          const SizedBox(width: 10),
          _buildButton(onPressed: () {}, label: 'Transfer', icon: Icons.send),
        ],
      );

  Widget _buildButton({
    required VoidCallback onPressed,
    required String label,
    required IconData icon,
    bool filled = false,
  }) {
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));
    return Expanded(
      child: filled
          ? ElevatedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon, size: 18),
              label: Text(label),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF1E88E5),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: shape,
              ),
            )
          : OutlinedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon, size: 18),
              label: Text(label),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white, width: 2),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: shape,
              ),
            ),
    );
  }

  Widget _buildTransactionSection() => Expanded(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Transaksi Terbaru',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
                    TextButton(onPressed: () {}, child: const Text('Lihat Semua')),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: _transactions.length,
                  itemBuilder: (_, i) => _buildTransactionItem(_transactions[i]),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildTransactionItem(Map<String, dynamic> t) => Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: t['color'].withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(t['icon'], color: t['color']),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t['title'],
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87)),
                  const SizedBox(height: 4),
                  Text(t['date'], style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                ],
              ),
            ),
            Text(
              t['amount'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: t['amount'].startsWith('+') ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      );

  Widget _buildQuickAction(IconData icon, String label) => GlassContainer(
        blur: 10,
        opacity: 0.15,
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          width: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Icon(icon, color: Colors.white, size: 28),
                const SizedBox(height: 8),
                Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ),
        ),
      );

  Widget _buildBottomNav(BuildContext context) => BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          if (i == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfilePage()),
            );
          }
          setState(() => _currentIndex = i);
        },
        selectedItemColor: const Color(0xFF1E88E5),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      );
}
