// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpensesImpl _$$ExpensesImplFromJson(Map<String, dynamic> json) =>
    _$ExpensesImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      expensesMethod: json['expensesMethod'] as String,
      description: json['description'] as String,
      isExpenses: json['isExpenses'] as int?,
    );

Map<String, dynamic> _$$ExpensesImplToJson(_$ExpensesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'expensesMethod': instance.expensesMethod,
      'description': instance.description,
      'isExpenses': instance.isExpenses,
    };
