// // GENERATED CODE - DO NOT MODIFY BY HAND

// // ignore_for_file: prefer_relative_imports, directives_ordering

// import 'package:flutter/widgets.dart';

// // **************************************************************************
// // DepGen code generator
// // **************************************************************************

// import 'package:login_rest_sample/domain/controllers/auth_controller/bloc/auth_controller_bloc.dart';
// import 'package:login_rest_sample/domain/interfaces/i_api_facade.dart';
// import 'package:login_rest_sample/domain/interfaces/i_auth_controller.dart';
// import 'package:login_rest_sample/domain/interfaces/i_user_repository.dart';
// import 'package:login_rest_sample/presentation/screens/login_screen/bloc/login_bloc.dart';
// import 'package:login_rest_sample/presentation/screens/profile_screen/bloc/profile_bloc.dart';

  
// class Di extends InheritedWidget {
//   const Di({Key? key, required Widget child, required this.environment})
//       : super(key: key, child: child);
  
//   // ---------------------------------------------------------------------------  
//   final Map<Type, Object> environment;

//   // ---------------------------------------------------------------------------
//   static Di of(BuildContext context) {
//     final Di? di = context.findAncestorWidgetOfExactType<Di>();
//     if (di == null) {
//       throw UnimplementedError('Di is not initialized in context');
//     }
//     return di;
//   }

//   // ---------------------------------------------------------------------------
//   @override
//   bool updateShouldNotify(Di oldWidget) {
//     return false;
//   }

//   // ---------------------------------------------------------------------------
//   T g<T>() => environment[T] as T;

//   // ---------------------------------------------------------------------------
//   T? mayBeGet<T>() => environment.containsKey(T) ? environment[T] as T : null;

  

//   // ---------------------------------------------------------------------------
//   AuthControllerBloc buildAuthControllerBloc(
//   ) => AuthControllerBloc(
//       authController: g<IAuthController>(),
//     );


//   // ---------------------------------------------------------------------------
//   LoginBloc buildLoginBloc(
//   ) => LoginBloc(
//       api: g<IApiFacade>(),
//       authController: g<IAuthController>(),
//       userRepository: g<IUserRepository>(),
//     );


//   // ---------------------------------------------------------------------------
//   ProfileBloc buildProfileBloc(
//   ) => ProfileBloc(
//       userRepository: g<IUserRepository>(),
//     );

// }