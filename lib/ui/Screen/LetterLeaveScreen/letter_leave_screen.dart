import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/api/HrService.dart';
import 'package:untitled/api/ServiceBuilder.dart';
import 'package:untitled/model/LetterLeave.dart';
import 'package:untitled/ui/Components/custom_dialog.dart';
import 'package:untitled/ui/Components/drop_down.dart';
import 'package:untitled/ui/Screen/LetterLeaveScreen/letter_leave_box.dart';
import 'package:untitled/utils/DialogUtils.dart';

import '../../AccountManager/accountDetail.dart';
import 'create_letter_leave_screen.dart';

class LetterLeaveScreen extends StatefulWidget {
  const LetterLeaveScreen({Key? key}) : super(key: key);

  @override
  State<LetterLeaveScreen> createState() => _LetterLeaveScreenState();
}

class _LetterLeaveScreenState extends State<LetterLeaveScreen> {
  Dio _dio = new ServiceBuilder().getService();
  late ScrollController _scrollController;
  int totalPages = -1;
  bool isSelectAll = false;
  List<String> listFilterStatus = <String>[
    "Tất cả",
    "Đang chờ duyệt",
    "Đã chấp nhận",
    "Bị từ chối"
  ];



  String curStatus = "Tất cả";
  List<LetterLeave> dataLetterLeave = [];

  List<String> listFilterYear = <String> ["2022", "2023"];
  String curYear = "2023";

  List<String> listFilterMonth = <String> ['1', '2',  '3','4', '5', '6'];
  String curMonth = '3';
  bool changeFilter = false;
  void handleChangeFilter(String val, String type) {
    switch(type) {
      case "Status":
        setState(() {
          curStatus = val;
        });
        break;
      case "Year":
        setState(() {
          curYear = val;
        });
        break;
      case "Month":
        setState(() {
          curMonth: val;
        });
        break;
    }

    changeFilter = true;
    pageNumber = 1;
  }

  List<int> convertState(String state) {
    switch(state) {
      case "Tất cả":
        return [0, 1, 2];
      case "Đang chờ duyệt":
        return [0];
      case "Đã chấp nhận":
        return [1];
      case "Bị từ chối":
        return [2];
    }
    return [0, 1, 2];
  }

  int pageNumber = 1;


  Future<List<LetterLeave>> getLetterLeaveMe() async {

    ResponseDTO<List<LetterLeave>> responseDTO = await RestClient(_dio).getLetterLeaveMe(
        {"state_IN": convertState(curStatus).toList(),}, pageNumber, 10);

    if (responseDTO.success) {
      List<LetterLeave> listData = responseDTO.data!;
      if (totalPages < 0) {
        totalPages = responseDTO.meta.totalPages;
      }
      if (changeFilter) {
        dataLetterLeave.clear();
      }

      dataLetterLeave.addAll(listData);
      return listData;
    }

    return [];
  }





  void handleDelete() {
    showDialog(
        context: context,
        builder: (context) => CustomDialog(title: "Thông báo", message: "Check dialog", handleAccpt: deleteLetterLeave, handleCancel: () {Navigator.pop(context);},)
    );
  }

  Future<void> deleteLetterLeave() async {
    ResponseDTO<LetterLeave> data = await RestClient(_dio).deleteLetterLeave(2);
    final DialogUtils dialogUtils = new DialogUtils();
    dialogUtils.showToast(data.message);
    Navigator.pop(context);
  }

  void handleCheckBox(bool isCheck, int id) {
    for (var value in dataLetterLeave) {
      if (value.id == id) {
        value.isCheck = isCheck;
      }
    }
  }

  void handleSelectAll(bool val) {
    dataLetterLeave.forEach((element) {
      element.isCheck = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController()..addListener(scrollListener);
  }

  void scrollListener() {
    if (pageNumber >= totalPages) {
      return;
    }

    if (_scrollController.position.extentAfter < 500) {
      setState(() {
        changeFilter = false;
        pageNumber ++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.black26;
    }
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(241, 242, 245, 1),
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Flexible(
                    child: Container(
                      child: new Dropdown(list: listFilterStatus, currVal: curStatus, handleChange: handleChangeFilter, id: "Status",),
                    ),
                    flex: 3,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Flexible(
                    child: Container(
                      child: new Dropdown(list: listFilterYear, currVal: curYear, handleChange: handleChangeFilter, id: "Year",),
                    ),
                    flex: 3,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Flexible(
                    child: Container(
                      child: new Dropdown(list: listFilterMonth, currVal: curMonth, handleChange: handleChangeFilter, id: "Month",),
                    ),
                    flex: 2,),
                )
              ],
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Đơn xin nghỉ phép", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CreateLetterLeaveScreen()));
                    },
                    icon: const Icon(Icons.add_circle_outline),
                    color: Color.fromRGBO(0, 146, 255, 1),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3), color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                      value: isSelectAll,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (bool? val) {
                        setState(() {
                          isSelectAll = val!;
                        });
                        handleSelectAll(val!);
                      }
                  ),
                  IconButton(
                    onPressed: handleDelete,
                    icon: Icon(Icons.delete_outlined),
                    color: Color.fromRGBO(0, 146, 255, 1),
                  )
                ],
              ),
            ),
            FutureBuilder(
                future: getLetterLeaveMe(),
                builder: (context, data) {
                  if (data.hasData) {
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: getLetterLeaveMe,
                        child: ListView.separated(
                            controller: _scrollController,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => LetterLeaveBox(letterLeave: dataLetterLeave.elementAt(index), handleChange: handleCheckBox,),
                            separatorBuilder: (context, index) => new Container(height: 10,),
                            itemCount: dataLetterLeave.length),
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }
            )
          ],
        ),
      )
    );
  }
}
