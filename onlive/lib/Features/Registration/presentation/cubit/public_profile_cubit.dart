import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/interest.dart';
import '../../../../core/usecases/usecase.dart';

import '../../domain/usecases/get_interests.dart';

part 'public_profile_state.dart';

class PublicProfileCubit extends Cubit<PublicProfileState> {
  final GetInterests getInterests;
  PublicProfileCubit(
    this.getInterests,
  ) : super(Initial());

  void loadInterests() async {
    emit(Loading());
    final response = await getInterests(NoParams());
    response.fold((failure) => emit(Error()),
        (interests) => emit(Loaded(interests: interests)));
  }
}
