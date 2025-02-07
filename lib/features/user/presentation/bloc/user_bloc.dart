import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(Initial()) {
    on<Started>(
      (event, emit) async {
        final result = await _userRepository.getUser();

        emit(Loaded(result.data ?? []));
      },
    );
  }
}
