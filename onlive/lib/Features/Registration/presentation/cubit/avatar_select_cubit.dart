import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/avatar.dart';

import '../../domain/usecases/get_avatars.dart';
import '../../../../core/usecases/usecase.dart';

part 'avatar_select_state.dart';

class AvatarSelectCubit extends Cubit<AvatarSelectState> {
  final GetAvatars getAvatars;
  AvatarSelectCubit(
    this.getAvatars,
  ) : super(AvatarSelectInitial());

  void loadAvatars() async {
    emit(Loading());
    final response = await getAvatars(NoParams());
    response.fold(
        (failure) => emit(Error()), (avatars) => Loaded(avatars: avatars));
  }
}
