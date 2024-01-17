// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpensesModelImpl _$$ExpensesModelImplFromJson(Map<String, dynamic> json) =>
    _$ExpensesModelImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      expensesMethod: json['expensesMethod'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$ExpensesModelImplToJson(_$ExpensesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'expensesMethod': instance.expensesMethod,
      'description': instance.description,
    };
