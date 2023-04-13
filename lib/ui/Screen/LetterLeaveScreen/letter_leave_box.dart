import 'package:flutter/material.dart';
import 'package:untitled/model/LetterLeave.dart';

class LetterLeaveBox extends StatefulWidget {
  const LetterLeaveBox({Key? key, required this.letterLeave, required this.handleChange}) : super(key: key);
  final LetterLeave letterLeave;

  final Function handleChange;
  @override
  State<LetterLeaveBox> createState() => _LetterLeaveBoxState();
}

class _LetterLeaveBoxState extends State<LetterLeaveBox> {
  bool isCheck = false;

  MaterialColor convertState(int state) {
    switch(state){
      case 1:
        return Colors.lightBlue;
      case 2:
        return Colors.green;
      case 3:
        return Colors.red;
    }
    return Colors.red;
  }


  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
        MaterialState.selected
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.black26;
    }
    return Transform.translate(
        offset: const Offset(0, 10),
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.25,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: widget.letterLeave.isCheck == null ? false : widget.letterLeave.isCheck,
                  onChanged: (bool? val) {
                    setState(() {
                      widget.letterLeave.isCheck = val!;
                    });
                    widget.handleChange(val, widget.letterLeave.id);
                  }
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(widget.letterLeave.user.avatar),
                radius: MediaQuery.of(context).size.width * 0.07,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 5), child: Text("Ngày bắt đầu nghỉ:", style: TextStyle(fontSize: 12, color: Colors.black54),)),
                  Padding(padding: EdgeInsets.only(top: 5), child: Text("Số ngày nghỉ:", style: TextStyle(fontSize: 12, color: Colors.black54),)),
                  Padding(padding: EdgeInsets.only(top: 5), child: Text("Lý do:", style: TextStyle(fontSize: 12, color: Colors.black54),)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 5), child: Text(widget.letterLeave.startDate, style: TextStyle(fontSize: 12, color: Colors.black),)),
                  Padding(padding: EdgeInsets.only(top: 5), child: Text(widget.letterLeave.quantity.toString(), style: TextStyle(fontSize: 12, color: Colors.black),)),
                  Padding(padding: EdgeInsets.only(top: 5), child: Text(widget.letterLeave.reason.length > 50 ? widget.letterLeave.reason.substring(0, 30) : widget.letterLeave.reason, style: TextStyle(fontSize: 12, color: Colors.black),)),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.01,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: convertState(widget.letterLeave.state)
                ),
              )
            ],
          ),
        ),
    );
  }
}
