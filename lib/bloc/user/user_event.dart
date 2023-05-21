// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class AddUser extends UserEvent {
  final UserModel userModel;
  const AddUser({
    required this.userModel,
  });
  @override
  List<Object> get props => [userModel];
}

class DeleteUser extends UserEvent {
  final UserModel userModel;
  const DeleteUser({
    required this.userModel,
  });
  @override
  List<Object> get props => [userModel];
}

class EditUser extends UserEvent {
  final UserModel userModel;
  const EditUser({
    required this.userModel,
  });
  @override
  List<Object> get props => [userModel];
}
