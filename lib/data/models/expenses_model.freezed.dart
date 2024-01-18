// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExpensesModel _$ExpensesModelFromJson(Map<String, dynamic> json) {
  return _ExpensesModel.fromJson(json);
}

/// @nodoc
mixin _$ExpensesModel {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get expensesMethod => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int? get isExpenses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpensesModelCopyWith<ExpensesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpensesModelCopyWith<$Res> {
  factory $ExpensesModelCopyWith(
          ExpensesModel value, $Res Function(ExpensesModel) then) =
      _$ExpensesModelCopyWithImpl<$Res, ExpensesModel>;
  @useResult
  $Res call(
      {String id,
      double amount,
      DateTime date,
      String expensesMethod,
      String description,
      int? isExpenses});
}

/// @nodoc
class _$ExpensesModelCopyWithImpl<$Res, $Val extends ExpensesModel>
    implements $ExpensesModelCopyWith<$Res> {
  _$ExpensesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? date = null,
    Object? expensesMethod = null,
    Object? description = null,
    Object? isExpenses = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expensesMethod: null == expensesMethod
          ? _value.expensesMethod
          : expensesMethod // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isExpenses: freezed == isExpenses
          ? _value.isExpenses
          : isExpenses // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpensesModelImplCopyWith<$Res>
    implements $ExpensesModelCopyWith<$Res> {
  factory _$$ExpensesModelImplCopyWith(
          _$ExpensesModelImpl value, $Res Function(_$ExpensesModelImpl) then) =
      __$$ExpensesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double amount,
      DateTime date,
      String expensesMethod,
      String description,
      int? isExpenses});
}

/// @nodoc
class __$$ExpensesModelImplCopyWithImpl<$Res>
    extends _$ExpensesModelCopyWithImpl<$Res, _$ExpensesModelImpl>
    implements _$$ExpensesModelImplCopyWith<$Res> {
  __$$ExpensesModelImplCopyWithImpl(
      _$ExpensesModelImpl _value, $Res Function(_$ExpensesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? date = null,
    Object? expensesMethod = null,
    Object? description = null,
    Object? isExpenses = freezed,
  }) {
    return _then(_$ExpensesModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expensesMethod: null == expensesMethod
          ? _value.expensesMethod
          : expensesMethod // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isExpenses: freezed == isExpenses
          ? _value.isExpenses
          : isExpenses // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpensesModelImpl implements _ExpensesModel {
  _$ExpensesModelImpl(
      {required this.id,
      required this.amount,
      required this.date,
      required this.expensesMethod,
      required this.description,
      this.isExpenses});

  factory _$ExpensesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpensesModelImplFromJson(json);

  @override
  final String id;
  @override
  final double amount;
  @override
  final DateTime date;
  @override
  final String expensesMethod;
  @override
  final String description;
  @override
  final int? isExpenses;

  @override
  String toString() {
    return 'ExpensesModel(id: $id, amount: $amount, date: $date, expensesMethod: $expensesMethod, description: $description, isExpenses: $isExpenses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpensesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.expensesMethod, expensesMethod) ||
                other.expensesMethod == expensesMethod) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isExpenses, isExpenses) ||
                other.isExpenses == isExpenses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, amount, date, expensesMethod, description, isExpenses);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpensesModelImplCopyWith<_$ExpensesModelImpl> get copyWith =>
      __$$ExpensesModelImplCopyWithImpl<_$ExpensesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpensesModelImplToJson(
      this,
    );
  }
}

abstract class _ExpensesModel implements ExpensesModel {
  factory _ExpensesModel(
      {required final String id,
      required final double amount,
      required final DateTime date,
      required final String expensesMethod,
      required final String description,
      final int? isExpenses}) = _$ExpensesModelImpl;

  factory _ExpensesModel.fromJson(Map<String, dynamic> json) =
      _$ExpensesModelImpl.fromJson;

  @override
  String get id;
  @override
  double get amount;
  @override
  DateTime get date;
  @override
  String get expensesMethod;
  @override
  String get description;
  @override
  int? get isExpenses;
  @override
  @JsonKey(ignore: true)
  _$$ExpensesModelImplCopyWith<_$ExpensesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
