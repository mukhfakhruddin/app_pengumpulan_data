import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Daftar pilihan kecamatan
  List<String> _kecamatanOptions = [
    'Kecamatan 1',
    'Kecamatan 2',
    'Kecamatan 3',
    // Tambahkan lebih banyak kecamatan sesuai kebutuhan.
  ];

  // Deklarasi selected kecamatan di sini
  String? _selectedKecamatan = 'Kecamatan 1'; // Tandai dengan operator '!'

  List<String> _desaOptions = [
    'Desa 1',
    'Desa 2',
    'Desa 3',
    // Tambahkan lebih banyak kecamatan sesuai kebutuhan.
  ];

  // Deklarasi selected kecamatan di sini
  String? _selectedDesa = 'Desa 1'; // Tandai dengan operator '!'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Registrasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'No HP'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            DropdownButtonFormField(
              value: _selectedKecamatan,
              items: _kecamatanOptions.map((kecamatan) {
                return DropdownMenuItem(
                  value: kecamatan,
                  child: Text(kecamatan),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedKecamatan = _kecamatanOptions as String;
                });
              },
              decoration: InputDecoration(
                labelText: 'Kecamatan',
                border:
                    OutlineInputBorder(), // Opsi tambahan: Tambahkan border pada DropdownButtonFormField.
              ),
              validator: (value) {
                if (_selectedKecamatan == null) {
                  return 'Silakan pilih kecamatan';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField(
              value: _selectedDesa,
              items: _desaOptions.map((desa) {
                return DropdownMenuItem(
                  value: desa,
                  child: Text(desa),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDesa = _desaOptions as String;
                });
              },
              decoration: InputDecoration(
                labelText: 'Desa',
                border:
                    OutlineInputBorder(), // Opsi tambahan: Tambahkan border pada DropdownButtonFormField.
              ),
              validator: (value) {
                if (_selectedKecamatan == null) {
                  return 'Silakan pilih Desa';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Dusun'),
              obscureText: true,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Validasi form sebelum meneruskan pendaftaran.
                if (validateForm()) {
                  // Lakukan tindakan pendaftaran di sini (misalnya, kirim data ke server).
                  // Anda dapat menambahkan logika Anda sendiri di sini.
                  String name = _nameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  // Tampilkan pesan sukses atau navigasikan ke layar selanjutnya.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Pendaftaran berhasil!'),
                    ),
                  );
                }
              },
              child: Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk validasi form.
  bool validateForm() {
    return _nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }
}
