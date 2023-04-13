import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:untitled/api/ServiceBuilder.dart';
import 'package:untitled/model/Event.dart';
import 'package:untitled/ui/Components/drop_down.dart';


class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<String> listFilterYear = <String> ["2022", "2023"];
  String curYear = "2023";

  List<String> listFilterMonth = <String> ['1', '2',  '3','4', '5', '6'];
  String curMonth = '3';

  Dio _dio = new ServiceBuilder().getService();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(241, 242, 245, 1),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: new Dropdown(list: listFilterYear, currVal: curYear, handleChange: () {}, id: ""),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: new Dropdown(list: listFilterMonth, currVal: curMonth, handleChange: () {}, id: "id"),
                ),
                Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child:  IconButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => const CreateLetterLeaveScreen()));
                            },
                            icon: const Icon(Icons.add_circle_outline),
                            color: Color.fromRGBO(0, 146, 255, 1),
                          ),
                        )
                      ],
                    )
                )
              ],
            ),
            Expanded(
                child: SfCalendar(
                  view: CalendarView.month,
                  // dataSource: EventDataSource(_getDataSource()),
                  cellEndPadding: 10,
                  monthViewSettings: const MonthViewSettings(appointmentDisplayMode: MonthAppointmentDisplayMode.indicator),
                )
            )
          ],
        ),
      ),
    );
  }
}

class EventDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  EventDataSource(List<Event> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).startDate;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).endDate;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).content;
  }

  @override
  Color getColor(int index) {
    return Color.fromRGBO(0, 146, 255, 1);
  }


  Event _getMeetingData(int index) {
    final dynamic event = appointments![index];
    late final Event eventData;
    if (event is Event) {
      eventData = event;
    }

    return eventData;
  }
}

