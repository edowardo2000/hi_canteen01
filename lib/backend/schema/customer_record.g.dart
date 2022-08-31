// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CustomerRecord> _$customerRecordSerializer =
    new _$CustomerRecordSerializer();

class _$CustomerRecordSerializer
    implements StructuredSerializer<CustomerRecord> {
  @override
  final Iterable<Type> types = const [CustomerRecord, _$CustomerRecord];
  @override
  final String wireName = 'CustomerRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CustomerRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.custLocation;
    if (value != null) {
      result
        ..add('cust_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.custUniv;
    if (value != null) {
      result
        ..add('cust_univ')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.custBalance;
    if (value != null) {
      result
        ..add('cust_balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  CustomerRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomerRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cust_location':
          result.custLocation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cust_univ':
          result.custUniv = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cust_balance':
          result.custBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$CustomerRecord extends CustomerRecord {
  @override
  final String uid;
  @override
  final String custLocation;
  @override
  final String custUniv;
  @override
  final double custBalance;
  @override
  final DocumentReference<Object> reference;

  factory _$CustomerRecord([void Function(CustomerRecordBuilder) updates]) =>
      (new CustomerRecordBuilder()..update(updates)).build();

  _$CustomerRecord._(
      {this.uid,
      this.custLocation,
      this.custUniv,
      this.custBalance,
      this.reference})
      : super._();

  @override
  CustomerRecord rebuild(void Function(CustomerRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerRecordBuilder toBuilder() =>
      new CustomerRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomerRecord &&
        uid == other.uid &&
        custLocation == other.custLocation &&
        custUniv == other.custUniv &&
        custBalance == other.custBalance &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, uid.hashCode), custLocation.hashCode),
                custUniv.hashCode),
            custBalance.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CustomerRecord')
          ..add('uid', uid)
          ..add('custLocation', custLocation)
          ..add('custUniv', custUniv)
          ..add('custBalance', custBalance)
          ..add('reference', reference))
        .toString();
  }
}

class CustomerRecordBuilder
    implements Builder<CustomerRecord, CustomerRecordBuilder> {
  _$CustomerRecord _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _custLocation;
  String get custLocation => _$this._custLocation;
  set custLocation(String custLocation) => _$this._custLocation = custLocation;

  String _custUniv;
  String get custUniv => _$this._custUniv;
  set custUniv(String custUniv) => _$this._custUniv = custUniv;

  double _custBalance;
  double get custBalance => _$this._custBalance;
  set custBalance(double custBalance) => _$this._custBalance = custBalance;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CustomerRecordBuilder() {
    CustomerRecord._initializeBuilder(this);
  }

  CustomerRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _custLocation = $v.custLocation;
      _custUniv = $v.custUniv;
      _custBalance = $v.custBalance;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomerRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CustomerRecord;
  }

  @override
  void update(void Function(CustomerRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CustomerRecord build() {
    final _$result = _$v ??
        new _$CustomerRecord._(
            uid: uid,
            custLocation: custLocation,
            custUniv: custUniv,
            custBalance: custBalance,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
