// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeInitial value)?  homeInitial,TResult Function( HomeLoading value)?  homeLoading,TResult Function( HomeSuccess value)?  homeSuccess,TResult Function( HomeError value)?  homeError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeInitial() when homeInitial != null:
return homeInitial(_that);case HomeLoading() when homeLoading != null:
return homeLoading(_that);case HomeSuccess() when homeSuccess != null:
return homeSuccess(_that);case HomeError() when homeError != null:
return homeError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeInitial value)  homeInitial,required TResult Function( HomeLoading value)  homeLoading,required TResult Function( HomeSuccess value)  homeSuccess,required TResult Function( HomeError value)  homeError,}){
final _that = this;
switch (_that) {
case HomeInitial():
return homeInitial(_that);case HomeLoading():
return homeLoading(_that);case HomeSuccess():
return homeSuccess(_that);case HomeError():
return homeError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeInitial value)?  homeInitial,TResult? Function( HomeLoading value)?  homeLoading,TResult? Function( HomeSuccess value)?  homeSuccess,TResult? Function( HomeError value)?  homeError,}){
final _that = this;
switch (_that) {
case HomeInitial() when homeInitial != null:
return homeInitial(_that);case HomeLoading() when homeLoading != null:
return homeLoading(_that);case HomeSuccess() when homeSuccess != null:
return homeSuccess(_that);case HomeError() when homeError != null:
return homeError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  homeInitial,TResult Function()?  homeLoading,TResult Function( List<ProductModel> products,  int total)?  homeSuccess,TResult Function( ApiErrorModel apiErrorModel)?  homeError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeInitial() when homeInitial != null:
return homeInitial();case HomeLoading() when homeLoading != null:
return homeLoading();case HomeSuccess() when homeSuccess != null:
return homeSuccess(_that.products,_that.total);case HomeError() when homeError != null:
return homeError(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  homeInitial,required TResult Function()  homeLoading,required TResult Function( List<ProductModel> products,  int total)  homeSuccess,required TResult Function( ApiErrorModel apiErrorModel)  homeError,}) {final _that = this;
switch (_that) {
case HomeInitial():
return homeInitial();case HomeLoading():
return homeLoading();case HomeSuccess():
return homeSuccess(_that.products,_that.total);case HomeError():
return homeError(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  homeInitial,TResult? Function()?  homeLoading,TResult? Function( List<ProductModel> products,  int total)?  homeSuccess,TResult? Function( ApiErrorModel apiErrorModel)?  homeError,}) {final _that = this;
switch (_that) {
case HomeInitial() when homeInitial != null:
return homeInitial();case HomeLoading() when homeLoading != null:
return homeLoading();case HomeSuccess() when homeSuccess != null:
return homeSuccess(_that.products,_that.total);case HomeError() when homeError != null:
return homeError(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class HomeInitial implements HomeState {
  const HomeInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.homeInitial()';
}


}




/// @nodoc


class HomeLoading implements HomeState {
  const HomeLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.homeLoading()';
}


}




/// @nodoc


class HomeSuccess implements HomeState {
  const HomeSuccess({required final  List<ProductModel> products, required this.total}): _products = products;
  

 final  List<ProductModel> _products;
 List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  int total;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeSuccessCopyWith<HomeSuccess> get copyWith => _$HomeSuccessCopyWithImpl<HomeSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSuccess&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),total);

@override
String toString() {
  return 'HomeState.homeSuccess(products: $products, total: $total)';
}


}

/// @nodoc
abstract mixin class $HomeSuccessCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeSuccessCopyWith(HomeSuccess value, $Res Function(HomeSuccess) _then) = _$HomeSuccessCopyWithImpl;
@useResult
$Res call({
 List<ProductModel> products, int total
});




}
/// @nodoc
class _$HomeSuccessCopyWithImpl<$Res>
    implements $HomeSuccessCopyWith<$Res> {
  _$HomeSuccessCopyWithImpl(this._self, this._then);

  final HomeSuccess _self;
  final $Res Function(HomeSuccess) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,Object? total = null,}) {
  return _then(HomeSuccess(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class HomeError implements HomeState {
  const HomeError({required this.apiErrorModel});
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeErrorCopyWith<HomeError> get copyWith => _$HomeErrorCopyWithImpl<HomeError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'HomeState.homeError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $HomeErrorCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeErrorCopyWith(HomeError value, $Res Function(HomeError) _then) = _$HomeErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$HomeErrorCopyWithImpl<$Res>
    implements $HomeErrorCopyWith<$Res> {
  _$HomeErrorCopyWithImpl(this._self, this._then);

  final HomeError _self;
  final $Res Function(HomeError) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(HomeError(
apiErrorModel: null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
