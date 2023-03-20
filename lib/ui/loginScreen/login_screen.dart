import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:untitled/api/HrService.dart';
import 'package:untitled/api/ServiceBuilder.dart';
import 'package:untitled/store/SharePrefs.dart';
import 'package:untitled/ui/Home/home.dart';

import '../../model/User.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);



  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

int typeInput = 0;

class _LoginScreenState extends State<LoginScreen> {
  final SharePrefs _sharePrefs = Get.find();
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _newPassController = TextEditingController();
  TextEditingController _newPassConfirmController = TextEditingController();
  TextEditingController _otpConfirmController = TextEditingController();
  Dio _dio = new ServiceBuilder().getService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Future<void> _login() async {
    ResponseDTO responseDTO = await RestClient(_dio).login(new Auth(_userController.text, _passwordController.text));
    if (responseDTO.success) {
      User user = User.fromJson(responseDTO.data);
      _sharePrefs.setAccessToken(user.accessToken);
      _sharePrefs.setUser(user);
      setState(() {
        if (typeInput == 0) {
          //Luồng đăng nhập
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        } else if (typeInput == 1) {
          //Nhập Email
          typeInput = 2;
        } else if (typeInput == 2) {
          //Đổi mật khẩu
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/backgroundImage.png"),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: typeInput == 1 || typeInput == 2 ? IconButton(
                        onPressed: () {
                          setState(() {
                            if (typeInput == 1) {
                              typeInput = 0;
                            } else if (typeInput == 2) {
                              typeInput = 1;
                            }
                          });
                        },
                        icon: Icon(Icons.arrow_back_ios_new)) : Icon(null)),
                ),
              ),
            ),
            Flexible(
              flex: 15,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Flexible(
                        flex: 4,
                        child: Column(
                          children: [
                            Flexible(
                              flex: 3,
                              child: Center(
                                child: Image(
                                  image: AssetImage('assets/logoTina.png'),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              fit: FlexFit.tight,
                              child: FractionallySizedBox(
                                alignment: Alignment.center,
                                heightFactor: 0.4,
                                widthFactor: 0.4,
                                child: FittedBox(
                                  child: Text(
                                    'Đăng nhập',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 6,
                        child: Column(
                          children: [
                            formInputType(userController: _userController,
                            passwordController: _passwordController,
                            newPassController: _newPassController,
                            newPassConfirmController: _newPassConfirmController,
                            otpConfirmController: _otpConfirmController,
                            emailController: _emailController,),
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (typeInput == 0) {
                                        typeInput = 1;
                                      } else if (typeInput == 2) {
                                        //Gửi otp
                                      }
                                    });
                                  },
                                  child: textUnder()
                                ),
                              )
                            ),
                            Flexible(
                              child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              margin: EdgeInsets.symmetric(vertical: 30),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: ElevatedButton(
                                  onPressed: _login,
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8))),
                                    elevation: MaterialStateProperty.all(0),
                                  ),
                                  child: FittedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(typeInput == 0 ? 'Đăng nhập' : 'Xác nhận',
                                          style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02),
                                        ),
                                      )
                                  ),
                                ),
                              ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}

class formInputType extends StatefulWidget {
  const formInputType({Key? key,
    required this.userController,
    required this.passwordController,
    required this.emailController,
    required this.newPassController,
    required this.newPassConfirmController,
    required this.otpConfirmController}) : super(key: key);
  final TextEditingController userController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController newPassController;
  final TextEditingController newPassConfirmController;
  final TextEditingController otpConfirmController;


  @override
  State<formInputType> createState() => _formInputTypeState();
}

class _formInputTypeState extends State<formInputType> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if (typeInput == 0) {
      return Column(
        children: [
          inputForm(textEditingController: widget.userController,isPassword: false,hideText: 'Tài khoản',label: 'Tài khoản'),
          inputForm(textEditingController: widget.passwordController,isPassword: true,hideText: 'Nhập mật khẩu',label: 'Mật khẩu',),
        ],
      );
    } else if (typeInput == 1) {
      return Column(
        children: [
          inputForm(textEditingController: widget.emailController,isPassword: false,hideText: 'Email',label: 'Nhập email'),
        ],
      );
    } else if (typeInput == 2) {
      return Column(
        children: [
          inputForm(textEditingController: widget.newPassController,isPassword: true,hideText: 'Mật khẩu mới',label: 'Nhập mật khẩu mới'),
          inputForm(textEditingController: widget.newPassConfirmController,isPassword: true,hideText: 'Xác nhận mật khẩu',label: 'Xác nhận mật khẩu',),
          inputForm(textEditingController: widget.otpConfirmController,isPassword: false,hideText: 'OTP',label: 'Nhập mã OTP',),
        ],
      );
    } else {
      return Container(
        child: Text('Không có dữ liệu'),
      );
    }
  }
}

// class textUnder extends StatefulWidget {
//   const textUnder({Key? key,}) : super(key: key);
//
//   @override
//   State<textUnder> createState() => _textUnderState();
// }
//
// class _textUnderState extends State<textUnder> {
//   @override
//   Widget build(BuildContext context) {
//     if (typeInput == 0) {
//       return Text('Quên mật khẩu?',style: TextStyle(color: Colors.blue),);
//     } else if (typeInput == 2) {
//       return Text('Gửi lại?',style: TextStyle(color: Colors.blue),);
//     } else return Text('');
//   }
// }

class textUnder extends StatelessWidget {
  const textUnder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (typeInput == 0) {
      return Text('Quên mật khẩu?',style: TextStyle(color: Colors.blue),);
    } else if (typeInput == 2) {
      return Text('Gửi lại?',style: TextStyle(color: Colors.blue),);
    } else return Text('');
  }
}







class inputForm extends StatefulWidget {
  const inputForm({Key? key,
    required this.textEditingController,
    required this.isPassword,
    required this.label,
    required this.hideText}) : super(key: key);


  final TextEditingController textEditingController;
  final bool isPassword;
  final String label;
  final String hideText;

  @override
  State<inputForm> createState() => _inputFormState();
}

class _inputFormState extends State<inputForm> {
  bool isVisiablePass = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              child: Row(
                children: [
                  Text(
                    widget.label,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextField(
              controller: widget.textEditingController,
              obscureText: widget.isPassword && isVisiablePass,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  height: 1.0,
                  color: Colors.black),
              decoration: InputDecoration(
                  label: Text(widget.hideText,style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.015,
                    height: 1
                  ),),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (widget.textEditingController.text != '') {
                        setState(() {
                          isVisiablePass = !isVisiablePass;
                        });
                      }
                    },
                    icon: widget.isPassword ? Icon( isVisiablePass ? Icons.visibility_off_sharp : Icons.visibility) : Icon(null),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}

