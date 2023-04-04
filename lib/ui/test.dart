import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Test extends StatefulWidget {
  const Test({Key? key, required this.isOt}) : super(key: key);

  final bool isOt;

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List<Widget> _buildCellsHeader(List<String> ls) {
    return List.generate(
      ls.length,
          (index) => Container(
        alignment: Alignment.center,
        width: 120.0,
        height: 60.0,
            decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
              border: Border.all(color: Colors.grey),
            ),
        child: Text(ls[index]),
      ),
    );
  }

  List<Widget> _buildCells(List<String> ls) {
    return List.generate(
      ls.length,
          (index) =>  Container(
        alignment: Alignment.center,
        width: 120.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: ls[index] == 'check' ? Icon(Icons.check, color: Colors.blue,) : Text(ls[index]),
      ),
    );
  }

  List<Widget> _buildRows(List<String> ls) {
    var now = DateTime.now();
    var totalDays = daysInMonth(now);
    

    var listOfDates = new List<String>.generate(totalDays, (i) => (i + 1).toString());
      return List.generate(
        ls.length,
            (index) {
              if (ls[index] == "Ngày") {
                return Row(
                  children: _buildCells(listOfDates),
                );
              } else if (ls[index] == "Thứ") {
                return Row(
                  children: _buildCells(daysNameInMonth(listOfDates)),
                );
              } else if (ls[index] == "Tên dự án") {
                return Row(
                  children: _buildCells(['Easy1', 'Easy1', 'Easy1', 'Easy1','Easy1', 'Easy1', 'Easy1', 'Easy1','Easy1', 'Easy1', 'Easy1', 'Easy1']),
                );
              } else if (ls[index] == "Địa điểm Onsite") {
                return Row(
                  children: _buildCells(['Easy1', 'Easy1', 'Easy1', 'Easy1','Easy1', 'Easy1', 'Easy1', 'Easy1','Easy1', 'Easy1', 'Easy1', 'Easy1']),
                );
              } else if (ls[index] == "Số giờ OT") {
                return Row(
                  children: _buildCells(['1', '', '', '','', '', '', '','', '', '', '2']),
                );
              } else if (ls[index] == "Duyệt") {
                return Row(
                  children: _buildCells(['check', '', '', '','', '', '', '','', '', '', 'check']),
                );
              } else {
                return Row(
                  children: _buildCells(['3', '', '', '','', '', '', '','', '', '', '2']),
                );;
              }
            }
      );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                children: [
                Text('Lương OverTime:',style: TextStyle(color: Colors.blue),),
                Text('300,000 VND'),
                Spacer(),
                Icon(Icons.edit_calendar_outlined,color: Colors.blue,)
                ],
          ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.isOt ? _buildCellsHeader(['Ngày','Thứ','Tên dự án','Số giờ OT','Duyệt']) :_buildCellsHeader(['Ngày','Thứ','Địa điểm Onsite','Duyệt'])
                ),
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:widget.isOt ?  _buildRows(['Ngày','Thứ','Tên dự án','Số giờ OT','Duyệt']) : _buildRows(['Ngày','Thứ','Địa điểm Onsite','Duyệt']),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

int daysInMonth(DateTime date){
  var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
  var firstDayNextMonth = new DateTime(firstDayThisMonth.year, firstDayThisMonth.month + 1, firstDayThisMonth.day);
  return firstDayNextMonth.difference(firstDayThisMonth).inDays;
}

List<String> daysNameInMonth(List<String> daysInMonth) {
  List<String> result = [] ;
  var noww = DateTime.now();
  for (int i = 0; i<daysInMonth.length; i++) {
    var date = new DateTime(noww.year,noww.month,int.parse(daysInMonth[i]));
    String dayName = DateFormat('EEEE').format(date);
    switch(dayName){
      case 'Monday':
        dayName = 'Thứ 2';
        break;
      case 'Tuesday':
        dayName = 'Thứ 3';
        break;
      case 'Wednesday':
        dayName = 'Thứ 4';
        break;
      case 'Thursday':
        dayName = 'Thứ 5';
        break;
      case 'Friday':
        dayName = 'Thứ 6';
        break;
      case 'Saturday':
        dayName = 'Thứ 7';
        break;
      case 'Sunday':
        dayName = 'CN';
        break;
    }
    result.add(dayName);
  }
  return result;
}
