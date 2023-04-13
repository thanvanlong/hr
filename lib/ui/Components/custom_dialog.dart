import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key, required this.title, required this.message, this.handleCancel, this.handleAccpt}) : super(key: key);
  final String title;
  final String message;
  final Function? handleCancel;
  final Function? handleAccpt;
  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Wrap(
          children: [
            Row(
              children: [
                Icon(Icons.warning_amber, color: Colors.yellow, size: 20,),
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(widget.title, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                    )
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {
                      Navigator.pop(context);
                    },
                  icon: Icon(Icons.close, color: Colors.black26, size: 15,),
                )

              ],
            ),
            Expanded(
              child: Wrap(
                children: [
                  Center(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text("This practice lesson consists of short paragraphs about interesting subjects. Find fun keyboard typing practice—and learn something new! Our paragraph practice is great typing practice for writing essays, reports, emails, and more for school and work."),
                      )
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                    onPressed: () {},
                    child: Text("Huỷ", style: TextStyle(color: Colors.black26),),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                    onPressed: (){
                      print("delete 2222");
                      widget.handleAccpt!();
                      },
                    child: Text("Xác nhận")
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
