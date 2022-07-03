// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:teemee/data/Repository/Repository.dart';
//
// part 'login_event.dart';
// part 'login_state.dart';
//
// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc(this.repository) : super(LoginInitial());
//   final Repository repository;
//   @override
//   Stream<LoginState> mapEventToState(
//     LoginEvent event,
//   ) async* {
//     if (event is TryLogin) {
//       yield LoadingLogging();
//       String error;
//       await repository.login(event.phone, event.password).catchError((onError) {
//         error = onError;
//       });
//       if (error == null) {
//         yield LoginSuccess();
//       } else {
//         yield ErrorInLogin(error);
//       }
//     }
//   }
// }
