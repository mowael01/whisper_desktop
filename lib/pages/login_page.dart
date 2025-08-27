// login.dart

import 'package:flutter/material.dart';
import 'package:whisper_desktop/layouts/main.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _id = '';
  String _password = '';
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    // Simulate a login process
    await Future.delayed(Duration(seconds: 2));
    debugPrint('User ID: $_id');
    debugPrint('Password: $_password');
    setState(() {
      _isLoading = false;
    });
    // Navigate to the next page or show a success message
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainLayout()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 15, 25, 49),
              Color.fromARGB(255, 27, 56, 140),
              Color.fromARGB(255, 15, 25, 49),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color.fromARGB(255, 21, 93, 252),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.shield_outlined,
                  size: 70,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'بوابة التقارير الآمنة',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: GoogleFonts.cairo().fontFamily,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'إنفاذ القانون والوصول إلى الأمن',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: GoogleFonts.cairo().fontFamily,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: GoogleFonts.cairo().fontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'الوصول يقتصر على الموظفين المعتمدين فقط',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: GoogleFonts.cairo().fontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 40),
                          SizedBox(
                            width: 500,

                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'الرقم التعريفي',

                                labelStyle: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: GoogleFonts.cairo().fontFamily,
                                  textBaseline: TextBaseline.alphabetic,
                                ),
                                border: OutlineInputBorder(),
                              ),
                              style: TextStyle(color: Colors.black),
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'الرجاء إدخال الرقم التعريفي';
                                }
                                return null;
                              },
                              onSaved: (value) => _id = value!,
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'كلمة المرور',
                                labelStyle: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: GoogleFonts.cairo().fontFamily,
                                  textBaseline: TextBaseline.alphabetic,
                                ),
                                border: OutlineInputBorder(),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'الرجاء إدخال كلمة المرور';
                                }
                                return null;
                              },
                              onSaved: (value) => _password = value!,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 251, 235),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'هذا النظام مخصص للاستخدام المعتمد فقط. تتم مراقبة جميع الأنشطة وتسجيلها',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 13,
                                  fontFamily: GoogleFonts.cairo().fontFamily,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 21, 93, 252),
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 15,
                              ),
                              fixedSize: Size(200, 50),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate() &&
                                  !_isLoading) {
                                _formKey.currentState!.save();
                                _login();
                              }
                            },

                            child: _isLoading
                                ? SizedBox(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : Text(
                                    'تسجيل الدخول',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,

                                      fontFamily:
                                          GoogleFonts.cairo().fontFamily,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
