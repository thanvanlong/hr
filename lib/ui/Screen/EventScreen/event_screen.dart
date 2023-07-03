import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:untitled/api/ServiceBuilder.dart';
import 'package:untitled/model/Event.dart';
import 'package:untitled/ui/Components/drop_down.dart';

import '../../../api/HrService.dart';


class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<String> listFilterYear = <String> ["2022", "2023"];
  String curYear = "2023";

  List<String> listFilterMonth = <String> ['1', '2','3','4', '5', '6', '7', '8', '9','10', '11', '12'];
  String curMonth = '4';
  bool isRendered = false;

  Dio _dio = new ServiceBuilder().getService();

  Future<List<Event>> getEvent() async{
    ResponseDTO<List<Event>> data = await RestClient(_dio).getEvent("-startDate");
    return data.data!;
  }

  void handleChangeFilter(String val, String type) {
    switch(type) {
      case "Year":
        setState(() {
          curYear = val;
        });
        break;
      case "Month":
        setState(() {
          curMonth = val;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(241, 242, 245, 1),
        child: Flexible(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: new Dropdown(list: listFilterYear, currVal: curYear, handleChange: () {}, id: ""),
                      )
                  ),
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: new Dropdown(list: listFilterMonth, currVal: curMonth, handleChange: () {}, id: "id"),
                      )
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
                  child: FutureBuilder(
                    future: getEvent(),
                    builder: (context, data) {
                      if (data.hasData && data.data!.length > 0) {
                        return SfCalendar(
                          view: CalendarView.month,
                          dataSource: EventDataSource(data.data!),
                          cellEndPadding: 10,
                          onViewChanged: (ViewChangedDetails details) {
                            List<DateTime> dates = details.visibleDates;
                            if (isRendered) {
                              setState(() {
                                curMonth = dates[(dates.length / 2).round()].month.toString();
                                curYear = dates[(dates.length / 2).round()].year.toString();
                                print(curMonth + " long check nhe");
                              });
                            } else {
                              isRendered = true;
                            }
                          },
                          monthViewSettings: const MonthViewSettings(appointmentDisplayMode: MonthAppointmentDisplayMode.indicator),
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircularProgressIndicator()
                          ],
                        );
                      }
                    },
                  )
              )
            ],
          ),
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

