import 'package:dartz/dartz.dart';
import 'package:edutime/core/usecases/usecase.dart';

import '../../../../core/errors/failures.dart';
import '../entities/event.dart';
import '../repositories/event_repository.dart';

class GetTodayEvents extends UseCaseWithoutParams<List<Event>> {
  final EventRepository repository;

  GetTodayEvents(this.repository);

  @override
  Future<Either<Failure, List<Event>>> call(NoParams params) async {
    return await repository.getTodayEvents();
  }
}