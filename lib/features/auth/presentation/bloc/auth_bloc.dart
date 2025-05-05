import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_proj/features/auth/domain/usecases/user_singn_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSingnUp _userSingnUp;
  AuthBloc({required UserSingnUp userSingnUp})
    : _userSingnUp = userSingnUp,
      super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final res = await _userSingnUp(
        UserSingnUpParams(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );
      res.fold(
        (l) => emit(AuthFailure(l.message)),
        (r) => emit(AuthSuccess(r)),
      );
    });
  }
}
