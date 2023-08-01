import 'package:flutter/material.dart';
import 'package:my_website/model/eventModel.dart';

class EventPage extends StatelessWidget {
  final List<Event> events;
  final String organization;

  EventPage({required this.events, required this.organization});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return ListTile(
            title: Text(
              event.eventName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  event.eventDescription,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Date: ${event.eventDate}',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 4),
                Text(
                  'Time: ${event.eventStartTime} - ${event.eventEndTime}',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 4),
                Text(
                  'Location: ${event.eventLocation}',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 8),
                Text(
                  'Organizer: ${event.eventOrganizer}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'No. of Tickets: ${event.noOfTickets}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Divider(height: 20, color: Colors.grey),
              ],
            ),
          );
        },
      ),
    );
  }
}
