// ignore_for_file: must_be_immutable

part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  UserState(this.allUser);

  List<UserModel> allUser;

  @override
  List<Object> get props => [allUser];
}

class UserInitial extends UserState {
  UserInitial(super.allUser);
}

class UserLoading extends UserState {
  UserLoading(super.allUser);
}

class UserSuccess extends UserState {
  UserSuccess(super.allUser);
}

class UserEror extends UserState {
  UserEror(super.allUser);
}
