class Event {
  final String eventName;
  final String owner;
  final String eventDate;
  final String eventEndDate;
  final String eventStartTime;
  final String eventEndTime;
  final String eventLocation;
  final String eventDescription;
  final String eventOrganizer;
  final int noOfTickets;

  Event({
    required this.eventName,
    required this.owner,
    required this.eventDate,
    required this.eventEndDate,
    required this.eventStartTime,
    required this.eventEndTime,
    required this.eventLocation,
    required this.eventDescription,
    required this.eventOrganizer,
    required this.noOfTickets,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventName: json['eventName'] as String,
      owner: json['owner'] as String,
      eventDate: json['eventDate'] as String,
      eventEndDate: json['eventEndDate'] as String,
      eventStartTime: json['eventStartTime'] as String,
      eventEndTime: json['eventEndTime'] as String,
      eventLocation: json['eventLocation'] as String,
      eventDescription: json['eventDescription'] as String,
      eventOrganizer: json['eventOrganizer'] as String,
      noOfTickets: json['noOfTickets'] as int,
    );
  }
}
