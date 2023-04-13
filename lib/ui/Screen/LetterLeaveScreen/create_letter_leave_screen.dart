import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/api/HrService.dart';
import 'package:untitled/api/ServiceBuilder.dart';
import 'package:untitled/model/LetterLeave.dart';
import 'package:untitled/ui/Components/custom_text_field.dart';

class CreateLetterLeaveScreen extends StatefulWidget {
  const CreateLetterLeaveScreen({Key? key}) : super(key: key);

  @override
  State<CreateLetterLeaveScreen> createState() => _CreateLetterLeaveScreenState();
}

class _CreateLetterLeaveScreenState extends State<CreateLetterLeaveScreen> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _dayOffController = TextEditingController();
  TextEditingController _reasonController = TextEditingController();
  Dio _dio = new ServiceBuilder().getService();

  Future<void> handleCreateLetterLeave() async {
    ResponseDTO<LetterLeave> responseDTO = await  RestClient(_dio).createLetterLeave({
      "startDate": _dateController.text,
      "reason": _reasonController.text,
      "quantity": int.parse(_dayOffController.text)
    });

    if (responseDTO.success) {
      _showToast("Tạo đơn xin nghỉ thành công");
    } else {
      _showToast(responseDTO.message);
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 12.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo đơn xin nghỉ phép',style: TextStyle(color: Colors.black, fontSize: 17),),
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 10,
              color: Colors.black12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(type: "date", label: "Start Date", required: true, hint: "Select date", controller: _dateController,),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(type: "number", label: "Số ngày nghỉ", required: true, hint: "Số ngày nghỉ", controller: _dayOffController,),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(type: "paragraph", label: "Lý do", required: true, hint: "Lý do", controller: _reasonController,),
            ),

            Container(
              margin: EdgeInsets.only(top: 30),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    handleCreateLetterLeave();
                  },
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
                        child: Text('Xác nhận',
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02),
                        ),
                      )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
