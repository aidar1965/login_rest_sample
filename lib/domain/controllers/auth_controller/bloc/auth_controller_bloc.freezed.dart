// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_controller_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthControllerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authStatusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventAuthStatusChanged value) authStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventAuthStatusChanged value)? authStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventAuthStatusChanged value)? authStatusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthControllerEventCopyWith<$Res> {
  factory $AuthControllerEventCopyWith(
          AuthControllerEvent value, $Res Function(AuthControllerEvent) then) =
      _$AuthControllerEventCopyWithImpl<$Res, AuthControllerEvent>;
}

/// @nodoc
class _$AuthControllerEventCopyWithImpl<$Res, $Val extends AuthControllerEvent>
    implements $AuthControllerEventCopyWith<$Res> {
  _$AuthControllerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_EventAuthStatusChangedCopyWith<$Res> {
  factory _$$_EventAuthStatusChangedCopyWith(_$_EventAuthStatusChanged value,
          $Res Function(_$_EventAuthStatusChanged) then) =
      __$$_EventAuthStatusChangedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EventAuthStatusChangedCopyWithImpl<$Res>
    extends _$AuthControllerEventCopyWithImpl<$Res, _$_EventAuthStatusChanged>
    implements _$$_EventAuthStatusChangedCopyWith<$Res> {
  __$$_EventAuthStatusChangedCopyWithImpl(_$_EventAuthStatusChanged _value,
      $Res Function(_$_EventAuthStatusChanged) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_EventAuthStatusChanged implements _EventAuthStatusChanged {
  const _$_EventAuthStatusChanged();

  @override
  String toString() {
    return 'AuthControllerEvent.authStatusChanged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EventAuthStatusChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authStatusChanged,
  }) {
    return authStatusChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authStatusChanged,
  }) {
    return authStatusChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authStatusChanged,
    required TResult orElse(),
  }) {
    if (authStatusChanged != null) {
      return authStatusChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventAuthStatusChanged value) authStatusChanged,
  }) {
    return authStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventAuthStatusChanged value)? authStatusChanged,
  }) {
    return authStatusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventAuthStatusChanged value)? authStatusChanged,
    required TResult orElse(),
  }) {
    if (authStatusChanged != null) {
      return authStatusChanged(this);
    }
    return orElse();
  }
}

abstract class _EventAuthStatusChanged implements AuthControllerEvent {
  const factory _EventAuthStatusChanged() = _$_EventAuthStatusChanged;
}

/// @nodoc
mixin _$AuthControllerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authenticated,
    required TResult Function() notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authenticated,
    TResult? Function()? notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StateAuthenticated value) authenticated,
    required TResult Function(_StateNotAuthenticated value) notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StateAuthenticated value)? authenticated,
    TResult? Function(_StateNotAuthenticated value)? notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StateAuthenticated value)? authenticated,
    TResult Function(_StateNotAuthenticated value)? notAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthControllerStateCopyWith<$Res> {
  factory $AuthControllerStateCopyWith(
          AuthControllerState value, $Res Function(AuthControllerState) then) =
      _$AuthControllerStateCopyWithImpl<$Res, AuthControllerState>;
}

/// @nodoc
class _$AuthControllerStateCopyWithImpl<$Res, $Val extends AuthControllerState>
    implements $AuthControllerStateCopyWith<$Res> {
  _$AuthControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StateAuthenticatedCopyWith<$Res> {
  factory _$$_StateAuthenticatedCopyWith(_$_StateAuthenticated value,
          $Res Function(_$_StateAuthenticated) then) =
      __$$_StateAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StateAuthenticatedCopyWithImpl<$Res>
    extends _$AuthControllerStateCopyWithImpl<$Res, _$_StateAuthenticated>
    implements _$$_StateAuthenticatedCopyWith<$Res> {
  __$$_StateAuthenticatedCopyWithImpl(
      _$_StateAuthenticated _value, $Res Function(_$_StateAuthenticated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_StateAuthenticated implements _StateAuthenticated {
  const _$_StateAuthenticated();

  @override
  String toString() {
    return 'AuthControllerState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_StateAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authenticated,
    required TResult Function() notAuthenticated,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authenticated,
    TResult? Function()? notAuthenticated,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StateAuthenticated value) authenticated,
    required TResult Function(_StateNotAuthenticated value) notAuthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StateAuthenticated value)? authenticated,
    TResult? Function(_StateNotAuthenticated value)? notAuthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StateAuthenticated value)? authenticated,
    TResult Function(_StateNotAuthenticated value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _StateAuthenticated implements AuthControllerState {
  const factory _StateAuthenticated() = _$_StateAuthenticated;
}

/// @nodoc
abstract class _$$_StateNotAuthenticatedCopyWith<$Res> {
  factory _$$_StateNotAuthenticatedCopyWith(_$_StateNotAuthenticated value,
          $Res Function(_$_StateNotAuthenticated) then) =
      __$$_StateNotAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StateNotAuthenticatedCopyWithImpl<$Res>
    extends _$AuthControllerStateCopyWithImpl<$Res, _$_StateNotAuthenticated>
    implements _$$_StateNotAuthenticatedCopyWith<$Res> {
  __$$_StateNotAuthenticatedCopyWithImpl(_$_StateNotAuthenticated _value,
      $Res Function(_$_StateNotAuthenticated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_StateNotAuthenticated implements _StateNotAuthenticated {
  const _$_StateNotAuthenticated();

  @override
  String toString() {
    return 'AuthControllerState.notAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_StateNotAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authenticated,
    required TResult Function() notAuthenticated,
  }) {
    return notAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authenticated,
    TResult? Function()? notAuthenticated,
  }) {
    return notAuthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StateAuthenticated value) authenticated,
    required TResult Function(_StateNotAuthenticated value) notAuthenticated,
  }) {
    return notAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StateAuthenticated value)? authenticated,
    TResult? Function(_StateNotAuthenticated value)? notAuthenticated,
  }) {
    return notAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StateAuthenticated value)? authenticated,
    TResult Function(_StateNotAuthenticated value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _StateNotAuthenticated implements AuthControllerState {
  const factory _StateNotAuthenticated() = _$_StateNotAuthenticated;
}
