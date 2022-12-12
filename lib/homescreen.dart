import 'package:code_comments_flutter/Calendar/calendarExamples.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:manage_calendar_events/manage_calendar_events.dart';
import 'package:table_calendar/table_calendar.dart';

import 'Messaging/messages.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalendarPlugin plugin = CalendarPlugin();

  // Have to do with obtaining all user events frm calendar
  int areCalendarsLoaded = 0;
  List<CalendarEvent> listOfEvents = [];
  List<Widget> listOfCardWidgets = [];
  bool lockHeld = false;

  DateTime selectedCalViewDay = DateTime.now();
  DateTime focusedCalViewDay = DateTime.now();

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
      appBar: AppBar(title: Text("Home")),
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
                headerStyle: const HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                calendarFormat: CalendarFormat.week,
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
                    },
                  );
                  areCalendarsLoaded = 0;
                  getCals(selected);
                },
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: areCalendarsLoaded == 0
                    ? const Center(child: CircularProgressIndicator())
                    : listOfCardWidgets.isEmpty && areCalendarsLoaded != 0
                        // TODO: Need to implement view to tell users that there is nothing in their calendars
                        ? Center(
                            child: Column(children: const [
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
                            child: Column(children: [...listOfCardWidgets!])),
              ),
              Divider(
                thickness: 1,
                color: brightness == Brightness.dark
                    ? Color.fromRGBO(104, 102, 102, 1.0)
                    : Color.fromRGBO(77, 75, 75, 1.0),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: ListView.builder(
                    shrinkWrap: false,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) => InkWell(
                          child: Card(child: chatsDataView(index)),
                          onTap: () {
                            var navigator = Navigator.of(context);
                            navigator.push(CupertinoPageRoute(
                                builder: (context) => const ChatsInterface()));
                          },
                        ),
                    itemCount: 3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget chatsDataView(int index) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListTile(
        title: Row(
          children: [
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.zero,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    "https://media-exp1.licdn.com/dms/image/C5603AQHf-tyMIg6VdQ/profile-displayphoto-shrink_800_800/0/1644684573336?e=2147483647&v=beta&t=fBigrt6W2MFOghS9uEY3WaatzuQtmJnr3yY9dSxs4_Y",
                    height: 50,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(padding: EdgeInsets.zero, child: Container()),
            ),
            Flexible(
              flex: 20,
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Wavin Wagpal $index",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "last message sent",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getCals([DateTime? date]) {
    List<CalendarEvent> tempCalEvents = [];
    setState(() {
      areCalendarsLoaded = 0;
    });

    if (!lockHeld) {
      lockHeld = true;
      date = date ?? DateTime.now();
      fetchCalendars(plugin).whenComplete(() {
        lockHeld = false;
      }).then(
        (value) {
          for (Calendar i in value!) {
            fetchEvents(plugin, i.id).then(
              (value) {
                for (CalendarEvent k in value!) {
                  if (k.startDate!.year == date!.year &&
                      k.startDate!.month == date.month &&
                      k.startDate!.day == date.day) {
                    tempCalEvents.add(k);
                  }
                }

                listOfCardWidgets.clear();

                for (CalendarEvent k in tempCalEvents) {
                  listOfCardWidgets.add(
                    Card(
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
                    ),
                  );
                }

                setState(() {
                  areCalendarsLoaded += 1;
                });
                listOfEvents = tempCalEvents;
              },
            );
          }
        },
      );
    }
  }
}
