import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial([])) {
    on<AddUser>((event, emit) {
      try {
        emit(UserLoading(state.allUser));
        // state.allUser.add(event.userModel);
        // emit(UserSuccess(state.allUser));
        emit(UserSuccess([...state.allUser]..add(event.userModel)));
      } catch (e) {
        emit(UserEror(state.allUser));
      }
    });
    on<DeleteUser>((event, emit) {
      try {
        emit(UserLoading(state.allUser));
        emit(UserSuccess(List.from(state.allUser)..remove(event.userModel)));
      } catch (e) {
        emit(UserEror(state.allUser));
      }
    });
    on<EditUser>((event, emit) {
      emit(UserLoading(state.allUser));
      //terdapa 2 cara untuk edit user keduanya memiliki kelebihan dan kekurangan
      //!jika menggunakan model bloc ini , secara memory akan lebih ringan karena langsung mengubah object tersebut, namun kelemahannya jika ada object tersebut digunakan di tempat lain , ini akan menyebabkan efeksamping
      // UserModel select = state.allUser
      //     .where((element) => element.id == event.userModel.id)
      //     .first;
      // select.name = event.userModel.name;
      // select.descriptions = event.userModel.descriptions;
      // emit(UserSuccess(state.allUser));
      //!jika menggunkan model bloc yang ini(spreed operator [...]) berbeda dengan yang sebelumnya ini akan jauh lebih aman jika ada object tersebut di tempat lain , namun secara memory ini tidak ramah dikarnakan membuat salinan code
      var index =
          state.allUser.indexWhere((user) => user.id == event.userModel.id);

      if (index != -1) {
        var allUser = [...state.allUser];
        allUser[index] = allUser[index].copyWith(
          name: event.userModel.name,
          descriptions: event.userModel.descriptions,
        );
        emit(UserSuccess(allUser));
      }
    });
  }
}
