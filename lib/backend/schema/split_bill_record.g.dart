// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'split_bill_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SplitBillRecord> _$splitBillRecordSerializer =
    new _$SplitBillRecordSerializer();

class _$SplitBillRecordSerializer
    implements StructuredSerializer<SplitBillRecord> {
  @override
  final Iterable<Type> types = const [SplitBillRecord, _$SplitBillRecord];
  @override
  final String wireName = 'SplitBillRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SplitBillRecord object,
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
    value = object.oriPrice;
    if (value != null) {
      result
        ..add('oriPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.splitPrice;
    if (value != null) {
      result
        ..add('splitPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.emailReq;
    if (value != null) {
      result
        ..add('emailReq')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.emailAcc;
    if (value != null) {
      result
        ..add('emailAcc')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.reqReq;
    if (value != null) {
      result
        ..add('reqReq')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.accReq;
    if (value != null) {
      result
        ..add('accReq')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.rejReq;
    if (value != null) {
      result
        ..add('rejReq')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.nameReq;
    if (value != null) {
      result
        ..add('nameReq')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  SplitBillRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SplitBillRecordBuilder();

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
        case 'oriPrice':
          result.oriPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'splitPrice':
          result.splitPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'emailReq':
          result.emailReq = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'emailAcc':
          result.emailAcc.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'reqReq':
          result.reqReq = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'accReq':
          result.accReq = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'rejReq':
          result.rejReq = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'nameReq':
          result.nameReq = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$SplitBillRecord extends SplitBillRecord {
  @override
  final String uid;
  @override
  final double oriPrice;
  @override
  final double splitPrice;
  @override
  final String emailReq;
  @override
  final BuiltList<String> emailAcc;
  @override
  final bool reqReq;
  @override
  final bool accReq;
  @override
  final bool rejReq;
  @override
  final DateTime timestamp;
  @override
  final String nameReq;
  @override
  final DocumentReference<Object> reference;

  factory _$SplitBillRecord([void Function(SplitBillRecordBuilder) updates]) =>
      (new SplitBillRecordBuilder()..update(updates)).build();

  _$SplitBillRecord._(
      {this.uid,
      this.oriPrice,
      this.splitPrice,
      this.emailReq,
      this.emailAcc,
      this.reqReq,
      this.accReq,
      this.rejReq,
      this.timestamp,
      this.nameReq,
      this.reference})
      : super._();

  @override
  SplitBillRecord rebuild(void Function(SplitBillRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SplitBillRecordBuilder toBuilder() =>
      new SplitBillRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SplitBillRecord &&
        uid == other.uid &&
        oriPrice == other.oriPrice &&
        splitPrice == other.splitPrice &&
        emailReq == other.emailReq &&
        emailAcc == other.emailAcc &&
        reqReq == other.reqReq &&
        accReq == other.accReq &&
        rejReq == other.rejReq &&
        timestamp == other.timestamp &&
        nameReq == other.nameReq &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, uid.hashCode),
                                            oriPrice.hashCode),
                                        splitPrice.hashCode),
                                    emailReq.hashCode),
                                emailAcc.hashCode),
                            reqReq.hashCode),
                        accReq.hashCode),
                    rejReq.hashCode),
                timestamp.hashCode),
            nameReq.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SplitBillRecord')
          ..add('uid', uid)
          ..add('oriPrice', oriPrice)
          ..add('splitPrice', splitPrice)
          ..add('emailReq', emailReq)
          ..add('emailAcc', emailAcc)
          ..add('reqReq', reqReq)
          ..add('accReq', accReq)
          ..add('rejReq', rejReq)
          ..add('timestamp', timestamp)
          ..add('nameReq', nameReq)
          ..add('reference', reference))
        .toString();
  }
}

class SplitBillRecordBuilder
    implements Builder<SplitBillRecord, SplitBillRecordBuilder> {
  _$SplitBillRecord _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  double _oriPrice;
  double get oriPrice => _$this._oriPrice;
  set oriPrice(double oriPrice) => _$this._oriPrice = oriPrice;

  double _splitPrice;
  double get splitPrice => _$this._splitPrice;
  set splitPrice(double splitPrice) => _$this._splitPrice = splitPrice;

  String _emailReq;
  String get emailReq => _$this._emailReq;
  set emailReq(String emailReq) => _$this._emailReq = emailReq;

  ListBuilder<String> _emailAcc;
  ListBuilder<String> get emailAcc =>
      _$this._emailAcc ??= new ListBuilder<String>();
  set emailAcc(ListBuilder<String> emailAcc) => _$this._emailAcc = emailAcc;

  bool _reqReq;
  bool get reqReq => _$this._reqReq;
  set reqReq(bool reqReq) => _$this._reqReq = reqReq;

  bool _accReq;
  bool get accReq => _$this._accReq;
  set accReq(bool accReq) => _$this._accReq = accReq;

  bool _rejReq;
  bool get rejReq => _$this._rejReq;
  set rejReq(bool rejReq) => _$this._rejReq = rejReq;

  DateTime _timestamp;
  DateTime get timestamp => _$this._timestamp;
  set timestamp(DateTime timestamp) => _$this._timestamp = timestamp;

  String _nameReq;
  String get nameReq => _$this._nameReq;
  set nameReq(String nameReq) => _$this._nameReq = nameReq;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SplitBillRecordBuilder() {
    SplitBillRecord._initializeBuilder(this);
  }

  SplitBillRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _oriPrice = $v.oriPrice;
      _splitPrice = $v.splitPrice;
      _emailReq = $v.emailReq;
      _emailAcc = $v.emailAcc?.toBuilder();
      _reqReq = $v.reqReq;
      _accReq = $v.accReq;
      _rejReq = $v.rejReq;
      _timestamp = $v.timestamp;
      _nameReq = $v.nameReq;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SplitBillRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SplitBillRecord;
  }

  @override
  void update(void Function(SplitBillRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SplitBillRecord build() {
    _$SplitBillRecord _$result;
    try {
      _$result = _$v ??
          new _$SplitBillRecord._(
              uid: uid,
              oriPrice: oriPrice,
              splitPrice: splitPrice,
              emailReq: emailReq,
              emailAcc: _emailAcc?.build(),
              reqReq: reqReq,
              accReq: accReq,
              rejReq: rejReq,
              timestamp: timestamp,
              nameReq: nameReq,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'emailAcc';
        _emailAcc?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SplitBillRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
