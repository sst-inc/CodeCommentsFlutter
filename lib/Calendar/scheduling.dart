import 'package:code_comments_flutter/Calendar/addEventsView.dart';
import 'package:code_comments_flutter/Calendar/calendarExamples.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:manage_calendar_events/manage_calendar_events.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulingView extends StatefulWidget {
  SchedulingView({super.key, required this.outerScaffoldKey});
  GlobalKey<ScaffoldState> outerScaffoldKey;

  @override
  State<SchedulingView> createState() => _SchedulingViewState();
}

class _SchedulingViewState extends State<SchedulingView> {
  CalendarPlugin plugin = CalendarPlugin();

  // Have to do with obtaining all user events frm calendar
  int areCalendarsLoaded = 0;
  List<CalendarEvent> listOfEvents = [];
  List<Widget> listOfCardWidgets = [];
  bool lockHeld = false;

  DateTime selectedCalViewDay = DateTime.now();
  DateTime focusedCalViewDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  Brightness brightness = SchedulerBinding.instance.window.platformBrightness;

  @override
  void initState() {
    super.initState();
    areCalendarsLoaded = 0;
    getCals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Scheduling"),
          centerTitle: false,
          leading: MaterialButton(
            onPressed: () {
              widget.outerScaffoldKey.currentState!.openDrawer();
            },
            child: Icon(Icons.menu),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.85,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("Create Calendar Event"),
                  ),
                  body: AddEventsView(),
                ),
              );
            },
          );
          /*Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateNewCalendarEvent()));*/
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 0),
          child: Column(
            children: [
              TableCalendar(
                calendarStyle: const CalendarStyle(
                  isTodayHighlighted: true,
                ),
                // headerStyle: const HeaderStyle(
                //     formatButtonVisible: false, titleCentered: true),
                calendarFormat: _calendarFormat,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                firstDay: DateTime(DateTime.now().year - 10),
                lastDay: DateTime(DateTime.now().year + 10),
                focusedDay: DateTime.now(),
                selectedDayPredicate: (day) {
                  return isSameDay(selectedCalViewDay, day);
                },
                onDaySelected: (selected, focused) {
                  setState(
                    () {
                      selectedCalViewDay = selected;
                      focusedCalViewDay = focused;
                      getCals(selected);
                    },
                  );
                },
              ),
              Expanded(
                child: areCalendarsLoaded == 0
                    ? const Center(child: CircularProgressIndicator())
                    : listOfCardWidgets.isEmpty && areCalendarsLoaded != 0
                        // TODO: Need to implement view to tell users that there is nothing in their calendars
                        ? Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                Text(
                                  "Hm.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 35),
                                ),
                                Text(
                                  "There seems to be nothing in your calendar today as of now",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ]))
                        : SingleChildScrollView(
                            child: Column(children: [...listOfCardWidgets])),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getCals([DateTime? date]) {
    List<CalendarEvent> tempCalEvents = [];

    if (!lockHeld) {
      lockHeld = true;
      date = date ?? DateTime.now();
      fetchCalendars(plugin).whenComplete(() {
        lockHeld = false;
      }).then((value) {
        for (Calendar i in value!) {
          fetchEvents(plugin, i.id).then((value) {
            for (CalendarEvent k in value!) {
              if (k.startDate!.year == date!.year &&
                  k.startDate!.month == date.month &&
                  k.startDate!.day == date.day) {
                tempCalEvents.add(k);
              }
            }

            listOfCardWidgets.clear();

            for (CalendarEvent k in tempCalEvents) {
              listOfCardWidgets.add(Card(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ListTile(
                    title: Text(k.title!),
                    trailing: k.isAllDay!
                        ? Text(
                            "${DateFormat("dd/MM/yyyy ").format(k.startDate!)}(Whole Day)")
                        : Text(DateFormat("dd/MM/yyyy HH:mm")
                            .format(k.startDate!)),
                  ),
                ),
              ));
            }

            setState(() {
              areCalendarsLoaded += 1;
            });
            listOfEvents = tempCalEvents;
          });
        }
      });
    }
  }
}
