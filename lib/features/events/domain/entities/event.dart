import 'package:equatable/equatable.dart';

/// Represents an educational event within a course.
///
/// An Event can be a lecture, exam, or other academic activities that occur
/// at specific times and can be physical or online. Events may be one-time
/// occurrences or recurring on a regular schedule.
class Event extends Equatable {
  // Event identification
  final String id;
  final String title;
  final String subtitle;
  final String courseId;
  final String cohortId;

  // Event creator & host info
  final String createdBy;
  final String hostName;

  // Event type and mode
  final EventType eventType;
  final EventMode eventMode;

  // Timing information
  final DateTime startTime;
  final DateTime endTime;
  final RecurringType recurringType;
  final DateTime? recurringEndDate;

  // Location details
  final String? buildingId;
  final String? roomId;
  final String? onlineLink;

  // Additional information
  final String? description;
  final bool isCancelled;

  // Metadata
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Creates a new [Event] instance.
  ///
  /// Most parameters are required except for location details which depend on
  /// the [eventMode], the [description], and the [recurringEndDate] which is
  /// only needed for recurring events.
  const Event({
    // Event identification
    required this.id,
    required this.title,
    required this.subtitle,
    required this.courseId,
    required this.cohortId,

    // Event creator info
    required this.createdBy,
    required this.hostName,

    // Event type and mode
    required this.eventType,
    required this.eventMode,

    // Timing information
    required this.startTime,
    required this.endTime,
    required this.recurringType,
    this.recurringEndDate,

    // Location details
    this.buildingId,
    this.roomId,
    this.onlineLink,

    // Additional information
    this.description,
    this.isCancelled = false,

    // Metadata
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    // Event identification
    id, title, subtitle, courseId, cohortId,
    // Event creator info
    createdBy, hostName,
    // Event type and mode
    eventType, eventMode,
    // Timing information
    startTime, endTime, recurringType, recurringEndDate,
    // Location details
    buildingId, roomId, onlineLink,
    // Additional information
    description, isCancelled,
    // Metadata
    createdAt, updatedAt,
  ];
}

/// Types of educational events.
enum EventType {
  /// Regular classroom teaching session
  lecture,

  /// Continuous Assessment Test
  cat,

  /// Final examination
  exam,
}

/// Delivery modes for events.
enum EventMode {
  /// In-person events requiring physical attendance
  physical,

  /// Remote events attended via internet
  online
}

/// Frequency patterns for recurring events.
enum RecurringType {
  /// Event occurs only once
  oneTime,

  /// Event repeats every week
  weekly,

  /// Event repeats every two weeks
  biWeekly
}