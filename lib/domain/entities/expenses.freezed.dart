// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Expenses _$ExpensesFromJson(Map<String, dynamic> json) {
  return _Expenses.fromJson(json);
}

/// @nodoc
mixin _$Expenses {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get expensesMethod => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpensesCopyWith<Expenses> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpensesCopyWith<$Res> {
  factory $ExpensesCopyWith(Expenses value, $Res Function(Expenses) then) =
      _$ExpensesCopyWithImpl<$Res, Expenses>;
  @useResult
  $Res call(
      {String id,
      double amount,
      DateTime date,
      String expensesMethod,
      String description});
}

/// @nodoc
class _$ExpensesCopyWithImpl<$Res, $Val extends Expenses>
    implements $ExpensesCopyWith<$Res> {
  _$ExpensesCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpensesImplCopyWith<$Res>
    implements $ExpensesCopyWith<$Res> {
  factory _$$ExpensesImplCopyWith(
          _$ExpensesImpl value, $Res Function(_$ExpensesImpl) then) =
      __$$ExpensesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double amount,
      DateTime date,
      String expensesMethod,
      String description});
}

/// @nodoc
class __$$ExpensesImplCopyWithImpl<$Res>
    extends _$ExpensesCopyWithImpl<$Res, _$ExpensesImpl>
    implements _$$ExpensesImplCopyWith<$Res> {
  __$$ExpensesImplCopyWithImpl(
      _$ExpensesImpl _value, $Res Function(_$ExpensesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? date = null,
    Object? expensesMethod = null,
    Object? description = null,
  }) {
    return _then(_$ExpensesImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpensesImpl implements _Expenses {
  _$ExpensesImpl(
      {required this.id,
      required this.amount,
      required this.date,
      required this.expensesMethod,
      required this.description});

  factory _$ExpensesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpensesImplFromJson(json);

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
  String toString() {
    return 'Expenses(id: $id, amount: $amount, date: $date, expensesMethod: $expensesMethod, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpensesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.expensesMethod, expensesMethod) ||
                other.expensesMethod == expensesMethod) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, amount, date, expensesMethod, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpensesImplCopyWith<_$ExpensesImpl> get copyWith =>
      __$$ExpensesImplCopyWithImpl<_$ExpensesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpensesImplToJson(
      this,
    );
  }
}

abstract class _Expenses implements Expenses {
  factory _Expenses(
      {required final String id,
      required final double amount,
      required final DateTime date,
      required final String expensesMethod,
      required final String description}) = _$ExpensesImpl;

  factory _Expenses.fromJson(Map<String, dynamic> json) =
      _$ExpensesImpl.fromJson;

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
  @JsonKey(ignore: true)
  _$$ExpensesImplCopyWith<_$ExpensesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
