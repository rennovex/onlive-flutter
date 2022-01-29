import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reg_user_state.dart';

class RegUserCubit extends Cubit<RegUserState> {
  RegUserCubit()
      : super(RegUserState(
            age: -1,
            email: '',
            fullName: '',
            gender: '',
            image: '',
            imageUrl: '',
            interest: '',
            nickname: '',
            college: '',
            domain: ''));

  void setPublicProfile(String nickname, String interest) =>
      emit(state.copyWith(nickname: nickname, interest: interest));

  void setAvatar(String imageUrl, String image) =>
      emit(state.copyWith(imageUrl: imageUrl, image: image));

  void setProfileDetails(
          String fullName, int age, String email, String gender) =>
      emit(state.copyWith(
          fullName: fullName, age: age, email: email, gender: gender));

  void setDomain(String domain) => emit(state.copyWith(domain: domain));

  void setCollege(String college) => emit(state.copyWith(college: college));
}
