import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key, required this.type, required this.label, required this.required, required this.hint, required this.controller}) : super(key: key);
  final String type;
  final String label;
  final bool required;
  final String hint;
  final TextEditingController controller;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool focusMode = false;


  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case "date":
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(widget.label, style: TextStyle(color: Colors.black),),
                    (widget.required ? Text(" *", style: TextStyle(color: Colors.red),) : Text(""))
                  ],
                ),
              ),
              TextField(
                controller: widget.controller,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: InkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context, initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101)
                        );

                        if(pickedDate != null ){
                          print(pickedDate);
                          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

                          setState(() {
                            widget.controller.text = formattedDate;
                          });
                        }
                      },
                      child: Icon(Icons.calendar_month_sharp),
                    ),
                    hintText: widget.hint,
                    hintStyle: TextStyle(fontSize: 13)
                ),
              )
            ],
          ),
        );
      case "number":
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(widget.label, style: TextStyle(color: Colors.black),),
                    (widget.required ? Text(" *", style: TextStyle(color: Colors.red),) : Text(""))
                  ],
                ),
              ),
              TextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                controller: widget.controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: widget.hint,
                  hintStyle: TextStyle(fontSize: 12)
                ),
              )
            ],
          ),
        );

      case "text":
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(widget.label, style: TextStyle(color: Colors.black),),
                    (widget.required ? Text(" *", style: TextStyle(color: Colors.red),) : Text(""))
                  ],
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: widget.controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: widget.hint,
                    hintStyle: TextStyle(fontSize: 12)
                ),
              )
            ],
          ),
        );

      case "paragraph":
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(widget.label, style: TextStyle(color: Colors.black),),
                    (widget.required ? Text(" *", style: TextStyle(color: Colors.red),) : Text(""))
                  ],
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                maxLines: 5,
                controller: widget.controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: widget.hint,
                    hintStyle: TextStyle(fontSize: 12)
                ),
              )
            ],
          ),
        );
    }

    return Container();
  }
}
