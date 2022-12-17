import 'dart:math';

import 'package:flutter/scheduler.dart';
import 'package:manage_calendar_events/manage_calendar_events.dart';

var brightness = SchedulerBinding.instance.window.platformBrightness;

//
// FutureBuilder<List<CalendarEvent>?>(
//         future: _fetchEvents(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: Text('No Events found'));
//           }
//           List<CalendarEvent> events = snapshot.data!;
//           return ListView.builder(
//             itemCount: events.length,
//             itemBuilder: (context, index) {
//               CalendarEvent event = events.elementAt(index);
//               return Dismissible(
//                 key: Key(event.eventId!),
//                 confirmDismiss: (direction) async {
//                   if (DismissDirection.startToEnd == direction) {
//                     setState(() {
//                       _deleteEvent(event.eventId!);
//                     });
//
//                     return true;
//                   } else {
//                     setState(() {
//                       _updateEvent(event);
//                     });
//
//                     return false;
//                   }
//                 },
//
//                 // delete option
//                 background: Container(
//                   color: Colors.red,
//                   alignment: Alignment.centerLeft,
//                   padding: EdgeInsets.only(left: 20.0),
//                   child: Icon(
//                     Icons.delete,
//                     color: Colors.white,
//                   ),
//                 ),
//                 // update the event
//                 secondaryBackground: Container(
//                   color: Colors.blue,
//                   alignment: Alignment.centerRight,
//                   padding: EdgeInsets.only(right: 20.0),
//                   child: Icon(
//                     Icons.edit,
//                     color: Colors.white,
//                   ),
//                 ),
//                 child: ListTile(
//                   title: Text(event.title!),
//                   subtitle: Text(event.startDate!.toIso8601String()),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return EventDetails(
//                             activeEvent: event,
//                             calendarPlugin: _myPlugin,
//                           );
//                         },
//                       ),
//                     );
//                   },
//                   onLongPress: () {
//                     _deleteReminder(event.eventId!);
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       )

Future<List<Calendar>?> fetchCalendars(CalendarPlugin plugin) async {
  plugin.hasPermissions().then((value) {
    if (!value!) {
      plugin.requestPermissions();
    }
  });

  return plugin.getCalendars();
}

Future<List<CalendarEvent>?> fetchEvents(
    CalendarPlugin plugin, dynamic calendarId) async {
  return plugin.getEvents(calendarId: calendarId);
}

Future<List<CalendarEvent>?> fetchEventsByDateRange(CalendarPlugin plugin,
    dynamic calendarId, DateTime startDate, DateTime endDate) async {
  return plugin.getEventsByDateRange(
    calendarId: calendarId,
    startDate: startDate,
    endDate: endDate,
  );
}

void addEvent(CalendarPlugin plugin, dynamic calendarId,
    CalendarEvent calendarEvent, Function getEventId) async {
  DateTime startDate = DateTime.now();
  DateTime endDate = startDate.add(Duration(hours: 3));
  plugin
      .createEvent(calendarId: calendarId, event: calendarEvent)
      .then((evenId) {
    getEventId(evenId);
  });
}

void deleteEvent(CalendarPlugin plugin, dynamic calendarId, String eventId,
    Function checkIfDeleted) async {
  plugin
      .deleteEvent(calendarId: calendarId, eventId: eventId)
      .then((isDeleted) {
    checkIfDeleted(isDeleted);
  });
}

void updateEvent(CalendarPlugin plugin, dynamic calendarId, CalendarEvent event,
    Function getEventId) async {
  event.title = 'Updated from Event';
  event.description = 'Test description is updated now';
  event.attendees = Attendees(
    attendees: [
      Attendee(emailAddress: 'updatetest@gmail.com', name: 'Update Test'),
    ],
  );
  plugin.updateEvent(calendarId: calendarId, event: event).then((eventId) {
    getEventId(eventId);
  });

  if (event.hasAlarm!) {
    updateReminder(plugin, calendarId, event.eventId!, 65);
  } else {
    addReminder(plugin, calendarId, event.eventId!, -30);
  }
}

void addReminder(CalendarPlugin plugin, dynamic calendarId, String eventId,
    int minutes) async {
  plugin.addReminder(
      calendarId: calendarId, eventId: eventId, minutes: minutes);
}

void updateReminder(CalendarPlugin plugin, dynamic calendarId, String eventId,
    int minutes) async {
  plugin.updateReminder(
      calendarId: calendarId, eventId: eventId, minutes: minutes);
}

void deleteReminder(CalendarPlugin plugin, String eventId) async {
  plugin.deleteReminder(eventId: eventId);
}

Future<List<Attendee>?> getAttendees(
    CalendarPlugin plugin, String eventId) async {
  return await plugin.getAttendees(eventId: eventId);
}

addAttendee(CalendarPlugin plugin, String eventId) async {
  var number = Random().nextInt(100);
  var newAttendee = Attendee(
      emailAddress: 'attendee$number@gmail.com', name: 'Attendee$number');
  await plugin.addAttendees(eventId: eventId, newAttendees: [newAttendee]);
}
