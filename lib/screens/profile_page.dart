import 'package:flutter/material.dart';
import '../widgets/glass_container.dart';
import 'login_page.dart';

/// Halaman Profile pengguna
/// Menampilkan info pengguna dan menu pengaturan
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
              // Header dengan tombol back
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    GlassContainer(
                      blur: 10,
                      opacity: 0.15,
                      borderRadius: BorderRadius.circular(15),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
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

              SizedBox(height: 20),

              // Avatar pengguna dari asset image
              GlassContainer(
                blur: 15,
                opacity: 0.2,
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/profilee.jpg'),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Nama pengguna
              Text(
                'Fuad Abdul Baqi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 5),

              // Email pengguna
              Text(
                'fuadbaqi910@gmail.com',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 30),

              // Menu pengaturan
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    padding: EdgeInsets.all(20),
                    children: [
                      _buildMenuItem(
                        context,
                        Icons.person_outline,
                        'Edit Profile',
                        'Update your personal information',
                      ),
                      _buildMenuItem(
                        context,
                        Icons.security,
                        'Security',
                        'Change password and PIN',
                      ),
                      _buildMenuItem(
                        context,
                        Icons.notifications_outlined,
                        'Notifications',
                        'Manage notification preferences',
                      ),
                      _buildMenuItem(
                        context,
                        Icons.help_outline,
                        'Help Center',
                        'Get help and support',
                      ),
                      _buildMenuItem(
                        context,
                        Icons.info_outline,
                        'About',
                        'Version 1.0.0',
                      ),
                      SizedBox(height: 20),

                      // Tombol Logout
                      Container(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // Kembali ke halaman login dan hapus semua route
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                              (route) => false,
                            );
                          },
                          icon: Icon(Icons.logout),
                          label: Text('Logout'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            side: BorderSide(color: Colors.red, width: 2),
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
    );
  }

  /// Widget untuk membuat item menu di profile
  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFF1E88E5).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Color(0xFF1E88E5),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey[400],
        ),
        onTap: () {},
      ),
    );
  }
}
