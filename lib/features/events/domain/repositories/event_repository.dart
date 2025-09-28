import 'package:dartz/dartz.dart';
import 'package:edutime/features/events/domain/entities/create_event_request.dart';

import '../../../../core/errors/failures.dart';
import '../entities/event.dart';

abstract class EventRepository {
  Future<Either<Failure, List<Event>>> getTodayEvents();
  Future<Either<Failure, List<Event>>> getUpcomingEvents({
    int limit = 5,
  });
  Future<Either<Failure, List<Event>>> getEventsByDate(DateTime date);
  Future<Either<Failure, List<Event>>> getEventByDateRange({
    required DateTime startDate,
    required DateTime endDate,
  });
  Future<Either<Failure, Event>> getEventById(String eventId);
  Future<Either<Failure, Event>> createEvent(CreateEventRequest request);
  Future<Either<Failure, Event>> updateEvent(String eventId,CreateEventRequest request);
  Future<Either<Failure, void>> deleteEvent(String eventId);
  Future<Either<Failure, void>> cancelEvent(String eventId);
  Future<Either<Failure, List<Event>>> searchEvents(String query);
}