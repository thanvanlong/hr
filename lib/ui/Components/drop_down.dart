import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({Key? key, required this.list, required this.currVal, required this.handleChange, required this.id}) : super(key: key);

  final List<String> list;
  final String currVal;
  final Function handleChange;
  final String id;

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String crValue = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.275,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
            Radius.circular(3.0)),
      ),
      child: DropdownButton<String>(
          value: crValue.isEmpty ? widget.currVal : crValue,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down_outlined),
          elevation: 1,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 0,
          ),
          onChanged: (String? value) {
            setState(() {
              crValue = value!;
              widget.handleChange(value, widget.id);
            });
          },
          items: widget.list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  child: Text(value, style: TextStyle(fontSize: 10),),
                ),
              ),
            );
          }).toList()
      ),
    );
  }
}
