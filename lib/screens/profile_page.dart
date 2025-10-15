import 'package:flutter/material.dart';
import '../widgets/glass_container.dart';
import 'dashboard_page.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 1; // posisi aktif di Profile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
              // Header dengan tombol back
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    GlassContainer(
                      blur: 10,
                      opacity: 0.15,
                      borderRadius: BorderRadius.circular(15),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const DashboardPage()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Avatar pengguna
              GlassContainer(
                blur: 15,
                opacity: 0.2,
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/profilee.jpg'),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Nama pengguna
              const Text(
                'Fuad Abdul Baqi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              // Email pengguna
              const Text(
                'fuadbaqi910@gmail.com',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              // Biodata
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      GlassContainer(
                        blur: 10,
                        opacity: 0.1,
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Biodata',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 15),
                              _BiodataItem(
                                label: 'Nama Lengkap',
                                value: 'Fuad Abdul Baqi',
                              ),
                              _BiodataItem(
                                label: 'Tempat, Tanggal Lahir',
                                value: 'Natar, 20 Mei 2006',
                              ),
                              _BiodataItem(
                                label: 'Jenis Kelamin',
                                value: 'Laki-laki',
                              ),
                              _BiodataItem(
                                label: 'Pendidikan',
                                value: 'Mahasiswa - Universitas Lampung',
                              ),
                              _BiodataItem(
                                label: 'NIM',
                                value: '2307051021',
                              ),
                              _BiodataItem(
                                label: 'Fakultas',
                                value: 'FMIPA',
                              ),
                              _BiodataItem(
                                label: 'Jurusan',
                                value: 'Ilmu Komputer',
                              ),
                              _BiodataItem(
                                label: 'Prodi',
                                value: 'D3 Manajemen Informatika',
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Tombol Logout
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginPage()),
                              (route) => false,
                            );
                          },
                          icon: const Icon(Icons.logout),
                          label: const Text('Logout'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            side:
                                const BorderSide(color: Colors.red, width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
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

      // Bottom Navigation
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  // Bottom Navigation Bar
  Widget _buildBottomNav(BuildContext context) => BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          if (i == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const DashboardPage()),
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

// Widget kecil untuk item biodata
class _BiodataItem extends StatelessWidget {
  final String label;
  final String value;

  const _BiodataItem({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 150,
              child: Text(
                '$label:',
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black87),
              )),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
