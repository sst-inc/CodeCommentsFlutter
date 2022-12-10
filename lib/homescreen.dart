import 'package:code_comments_flutter/Calendar/calendarExamples.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:manage_calendar_events/manage_calendar_events.dart';

import 'Messaging/messages.dart';

var brightness = SchedulerBinding.instance.window.platformBrightness;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalendarPlugin plugin = CalendarPlugin();
  bool areCalendarsLoaded = false;
  List<CalendarEvent> listOfEvents = [];
  List<Calendar> listOfCals = [];
  List<Widget> listOfCardWidgets = [];

  @override
  Widget build(BuildContext context) {
    getCals();

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: areCalendarsLoaded != true
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                    children: [...listOfCardWidgets],
                  )),
          ),
          const Divider(
            thickness: 1,
            color: Colors.white,
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) => InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  "https://media-exp1.licdn.com/dms/image/C5603AQHf-tyMIg6VdQ/profile-displayphoto-shrink_800_800/0/1644684573336?e=2147483647&v=beta&t=fBigrt6W2MFOghS9uEY3WaatzuQtmJnr3yY9dSxs4_Y",
                                  height: 50,
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Wavin Wagpal $index",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      "last message sent",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        var navigator = Navigator.of(context);
                        navigator.push(MaterialPageRoute(
                            builder: (context) => const ChatsInterface()));
                      },
                    ),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                      color: Colors.black,
                    ),
                itemCount: 3),
          ),
        ],
      ),
    ));
  }

  void getCals() {
    fetchCalendars(plugin).whenComplete(() {
      areCalendarsLoaded = true;
      print("loaded");
    }).then((value) {
      print(value![0].name);
      for (Calendar i in value) {
        fetchEvents(plugin, i.id).then((value) {
          for (CalendarEvent k in value!) {
            if (k.startDate!.year == DateTime.now().year &&
                k.startDate!.month == DateTime.now().month &&
                k.startDate!.day == DateTime.now().day) {
              listOfEvents.add(k);
            }
            ;
          }

          listOfCardWidgets.clear();

          for (CalendarEvent k in listOfEvents) {
            listOfCardWidgets.add(ListTile(
              title: Text(k.title!),
              trailing:
                  Text(DateFormat("dd/MM/yyyy HH:mm").format(k.startDate!)),
            ));
          }
          ;
        });
      }
      areCalendarsLoaded = true;
    });
  }
}
