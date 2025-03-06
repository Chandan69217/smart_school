import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_school/screens/dashboard.dart';
import 'package:smart_school/utilities/cust_colors.dart';
import 'package:smart_school/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberChecked = false;
  bool _obscureText = true;
  TextEditingController _mobileTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.25,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: CustColor.primary,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70.0),
                  // bottomLeft: Radius.circular(10.0)
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.07,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Sign in and get started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      _buildTextField(
                        "Mobile No",
                        Icons.person,
                        textInputType: TextInputType.phone,
                        false,
                        controller: _mobileTextController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your mobile no";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      _buildTextField(
                        "Password",
                        Icons.lock,
                        textInputType: TextInputType.visiblePassword,
                        _obscureText,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  _obscureText = !_obscureText;
                                },
                              );
                            },
                            icon: Icon(_obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                        controller: _passwordTextController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isRememberChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isRememberChecked = !isRememberChecked;
                                  });
                                },
                                activeColor: CustColor.primary,
                              ),
                              Text("Remember me"),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: CustColor.deep_blue,
                                      fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustColor.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0)),
                          minimumSize: Size(double.infinity, screenHeight * 0.05),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> Dashboard()), (route)=> false);
                            print('Login Successful');
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: (screenHeight * 0.05) * 0.4,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Text("Don't have an account? Sign Up"),
                      // ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, bool isPassword,
      {TextInputType textInputType = TextInputType.text,
      Widget? suffixIcon,
      required TextEditingController controller,
      String? Function(String? value)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextFieldForm(
          prefixIcon: Icon(icon),
          obscureText: isPassword,
          suffixIcon: suffixIcon,
          controller: controller,
          validator: validator,
          keyboardType: textInputType,
        )
      ],
    );
  }
}
