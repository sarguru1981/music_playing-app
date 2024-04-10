
import 'package:bloc/bloc.dart';

import 'package:music_app/features/model/user.dart';

import 'package:music_app/features/data/authentication_repository.dart';


part 'authentication_event.dart';
part 'authentication_state.dart';



class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authRepository = AuthenticationRepository();

  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationEvent>((event, emit) {});

    on<SignUpUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        final UserModel? user =
        await authRepository.signUp(email: event.email, password: event.password);
        if (user != null) {
          emit(AuthenticationLoadingState(isLoading: false));
          emit(AuthenticationSuccessState(user));

        } else {
          emit(const AuthenticationFailureState('create user failed'));
        }
      } catch (e) {
        emit(const AuthenticationFailureState('create user failed'));
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });

    on<SignInUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        final UserModel? user =
        await authRepository.logIn(email: event.email, password: event.password);
        if (user != null) {
          emit(AuthenticationLoadingState(isLoading: false));
          emit(AuthenticationSuccessState(user));

        } else {
          emit(const AuthenticationFailureState('create user failed'));
        }
      } catch (e) {
        emit(const AuthenticationFailureState('create user failed'));
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });

    on<SignOut>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        authRepository.logOut();
      } catch (e) {
        emit(const AuthenticationFailureState('signout failed'));
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });
  }
}