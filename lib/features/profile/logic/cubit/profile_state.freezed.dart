// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState()';
}


}

/// @nodoc
class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProfileInitial value)?  profileInitial,TResult Function( ProfileLoading value)?  profileLoading,TResult Function( ProfileLoaded value)?  profileLoaded,TResult Function( ProfileError value)?  profileError,TResult Function( ProfileLogoutSuccess value)?  profileLogoutSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProfileInitial() when profileInitial != null:
return profileInitial(_that);case ProfileLoading() when profileLoading != null:
return profileLoading(_that);case ProfileLoaded() when profileLoaded != null:
return profileLoaded(_that);case ProfileError() when profileError != null:
return profileError(_that);case ProfileLogoutSuccess() when profileLogoutSuccess != null:
return profileLogoutSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProfileInitial value)  profileInitial,required TResult Function( ProfileLoading value)  profileLoading,required TResult Function( ProfileLoaded value)  profileLoaded,required TResult Function( ProfileError value)  profileError,required TResult Function( ProfileLogoutSuccess value)  profileLogoutSuccess,}){
final _that = this;
switch (_that) {
case ProfileInitial():
return profileInitial(_that);case ProfileLoading():
return profileLoading(_that);case ProfileLoaded():
return profileLoaded(_that);case ProfileError():
return profileError(_that);case ProfileLogoutSuccess():
return profileLogoutSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProfileInitial value)?  profileInitial,TResult? Function( ProfileLoading value)?  profileLoading,TResult? Function( ProfileLoaded value)?  profileLoaded,TResult? Function( ProfileError value)?  profileError,TResult? Function( ProfileLogoutSuccess value)?  profileLogoutSuccess,}){
final _that = this;
switch (_that) {
case ProfileInitial() when profileInitial != null:
return profileInitial(_that);case ProfileLoading() when profileLoading != null:
return profileLoading(_that);case ProfileLoaded() when profileLoaded != null:
return profileLoaded(_that);case ProfileError() when profileError != null:
return profileError(_that);case ProfileLogoutSuccess() when profileLogoutSuccess != null:
return profileLogoutSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  profileInitial,TResult Function()?  profileLoading,TResult Function( UserProfileModel user)?  profileLoaded,TResult Function( ApiErrorModel apiErrorModel)?  profileError,TResult Function()?  profileLogoutSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProfileInitial() when profileInitial != null:
return profileInitial();case ProfileLoading() when profileLoading != null:
return profileLoading();case ProfileLoaded() when profileLoaded != null:
return profileLoaded(_that.user);case ProfileError() when profileError != null:
return profileError(_that.apiErrorModel);case ProfileLogoutSuccess() when profileLogoutSuccess != null:
return profileLogoutSuccess();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  profileInitial,required TResult Function()  profileLoading,required TResult Function( UserProfileModel user)  profileLoaded,required TResult Function( ApiErrorModel apiErrorModel)  profileError,required TResult Function()  profileLogoutSuccess,}) {final _that = this;
switch (_that) {
case ProfileInitial():
return profileInitial();case ProfileLoading():
return profileLoading();case ProfileLoaded():
return profileLoaded(_that.user);case ProfileError():
return profileError(_that.apiErrorModel);case ProfileLogoutSuccess():
return profileLogoutSuccess();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  profileInitial,TResult? Function()?  profileLoading,TResult? Function( UserProfileModel user)?  profileLoaded,TResult? Function( ApiErrorModel apiErrorModel)?  profileError,TResult? Function()?  profileLogoutSuccess,}) {final _that = this;
switch (_that) {
case ProfileInitial() when profileInitial != null:
return profileInitial();case ProfileLoading() when profileLoading != null:
return profileLoading();case ProfileLoaded() when profileLoaded != null:
return profileLoaded(_that.user);case ProfileError() when profileError != null:
return profileError(_that.apiErrorModel);case ProfileLogoutSuccess() when profileLogoutSuccess != null:
return profileLogoutSuccess();case _:
  return null;

}
}

}

/// @nodoc


class ProfileInitial implements ProfileState {
  const ProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.profileInitial()';
}


}




/// @nodoc


class ProfileLoading implements ProfileState {
  const ProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.profileLoading()';
}


}




/// @nodoc


class ProfileLoaded implements ProfileState {
  const ProfileLoaded({required this.user});
  

 final  UserProfileModel user;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileLoadedCopyWith<ProfileLoaded> get copyWith => _$ProfileLoadedCopyWithImpl<ProfileLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileLoaded&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'ProfileState.profileLoaded(user: $user)';
}


}

/// @nodoc
abstract mixin class $ProfileLoadedCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ProfileLoadedCopyWith(ProfileLoaded value, $Res Function(ProfileLoaded) _then) = _$ProfileLoadedCopyWithImpl;
@useResult
$Res call({
 UserProfileModel user
});




}
/// @nodoc
class _$ProfileLoadedCopyWithImpl<$Res>
    implements $ProfileLoadedCopyWith<$Res> {
  _$ProfileLoadedCopyWithImpl(this._self, this._then);

  final ProfileLoaded _self;
  final $Res Function(ProfileLoaded) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(ProfileLoaded(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserProfileModel,
  ));
}


}

/// @nodoc


class ProfileError implements ProfileState {
  const ProfileError({required this.apiErrorModel});
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileErrorCopyWith<ProfileError> get copyWith => _$ProfileErrorCopyWithImpl<ProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'ProfileState.profileError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $ProfileErrorCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ProfileErrorCopyWith(ProfileError value, $Res Function(ProfileError) _then) = _$ProfileErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$ProfileErrorCopyWithImpl<$Res>
    implements $ProfileErrorCopyWith<$Res> {
  _$ProfileErrorCopyWithImpl(this._self, this._then);

  final ProfileError _self;
  final $Res Function(ProfileError) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(ProfileError(
apiErrorModel: null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class ProfileLogoutSuccess implements ProfileState {
  const ProfileLogoutSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileLogoutSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.profileLogoutSuccess()';
}


}




// dart format on
