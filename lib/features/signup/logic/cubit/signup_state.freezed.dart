// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupState()';
}


}

/// @nodoc
class $SignupStateCopyWith<$Res>  {
$SignupStateCopyWith(SignupState _, $Res Function(SignupState) __);
}


/// Adds pattern-matching-related methods to [SignupState].
extension SignupStatePatterns on SignupState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignupInitial value)?  signupInitial,TResult Function( SignupLoading value)?  signupLoading,TResult Function( SignupSuccess value)?  signupSuccess,TResult Function( SignupError value)?  signupError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignupInitial() when signupInitial != null:
return signupInitial(_that);case SignupLoading() when signupLoading != null:
return signupLoading(_that);case SignupSuccess() when signupSuccess != null:
return signupSuccess(_that);case SignupError() when signupError != null:
return signupError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignupInitial value)  signupInitial,required TResult Function( SignupLoading value)  signupLoading,required TResult Function( SignupSuccess value)  signupSuccess,required TResult Function( SignupError value)  signupError,}){
final _that = this;
switch (_that) {
case SignupInitial():
return signupInitial(_that);case SignupLoading():
return signupLoading(_that);case SignupSuccess():
return signupSuccess(_that);case SignupError():
return signupError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignupInitial value)?  signupInitial,TResult? Function( SignupLoading value)?  signupLoading,TResult? Function( SignupSuccess value)?  signupSuccess,TResult? Function( SignupError value)?  signupError,}){
final _that = this;
switch (_that) {
case SignupInitial() when signupInitial != null:
return signupInitial(_that);case SignupLoading() when signupLoading != null:
return signupLoading(_that);case SignupSuccess() when signupSuccess != null:
return signupSuccess(_that);case SignupError() when signupError != null:
return signupError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  signupInitial,TResult Function()?  signupLoading,TResult Function( SignupResponseBody data)?  signupSuccess,TResult Function( ApiErrorModel apiErrorModel)?  signupError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SignupInitial() when signupInitial != null:
return signupInitial();case SignupLoading() when signupLoading != null:
return signupLoading();case SignupSuccess() when signupSuccess != null:
return signupSuccess(_that.data);case SignupError() when signupError != null:
return signupError(_that.apiErrorModel);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  signupInitial,required TResult Function()  signupLoading,required TResult Function( SignupResponseBody data)  signupSuccess,required TResult Function( ApiErrorModel apiErrorModel)  signupError,}) {final _that = this;
switch (_that) {
case SignupInitial():
return signupInitial();case SignupLoading():
return signupLoading();case SignupSuccess():
return signupSuccess(_that.data);case SignupError():
return signupError(_that.apiErrorModel);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  signupInitial,TResult? Function()?  signupLoading,TResult? Function( SignupResponseBody data)?  signupSuccess,TResult? Function( ApiErrorModel apiErrorModel)?  signupError,}) {final _that = this;
switch (_that) {
case SignupInitial() when signupInitial != null:
return signupInitial();case SignupLoading() when signupLoading != null:
return signupLoading();case SignupSuccess() when signupSuccess != null:
return signupSuccess(_that.data);case SignupError() when signupError != null:
return signupError(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class SignupInitial implements SignupState {
  const SignupInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupState.signupInitial()';
}


}




/// @nodoc


class SignupLoading implements SignupState {
  const SignupLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupState.signupLoading()';
}


}




/// @nodoc


class SignupSuccess implements SignupState {
  const SignupSuccess({required this.data});
  

 final  SignupResponseBody data;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupSuccessCopyWith<SignupSuccess> get copyWith => _$SignupSuccessCopyWithImpl<SignupSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'SignupState.signupSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $SignupSuccessCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory $SignupSuccessCopyWith(SignupSuccess value, $Res Function(SignupSuccess) _then) = _$SignupSuccessCopyWithImpl;
@useResult
$Res call({
 SignupResponseBody data
});




}
/// @nodoc
class _$SignupSuccessCopyWithImpl<$Res>
    implements $SignupSuccessCopyWith<$Res> {
  _$SignupSuccessCopyWithImpl(this._self, this._then);

  final SignupSuccess _self;
  final $Res Function(SignupSuccess) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(SignupSuccess(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SignupResponseBody,
  ));
}


}

/// @nodoc


class SignupError implements SignupState {
  const SignupError({required this.apiErrorModel});
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupErrorCopyWith<SignupError> get copyWith => _$SignupErrorCopyWithImpl<SignupError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'SignupState.signupError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $SignupErrorCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory $SignupErrorCopyWith(SignupError value, $Res Function(SignupError) _then) = _$SignupErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$SignupErrorCopyWithImpl<$Res>
    implements $SignupErrorCopyWith<$Res> {
  _$SignupErrorCopyWithImpl(this._self, this._then);

  final SignupError _self;
  final $Res Function(SignupError) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(SignupError(
apiErrorModel: null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
