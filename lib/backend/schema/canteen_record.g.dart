// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canteen_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CanteenRecord> _$canteenRecordSerializer =
    new _$CanteenRecordSerializer();

class _$CanteenRecordSerializer implements StructuredSerializer<CanteenRecord> {
  @override
  final Iterable<Type> types = const [CanteenRecord, _$CanteenRecord];
  @override
  final String wireName = 'CanteenRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CanteenRecord object,
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
    value = object.cantLocation;
    if (value != null) {
      result
        ..add('cant_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cantName;
    if (value != null) {
      result
        ..add('cant_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.review;
    if (value != null) {
      result
        ..add('review')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.revenue;
    if (value != null) {
      result
        ..add('revenue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.numOrder;
    if (value != null) {
      result
        ..add('num_order')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  CanteenRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CanteenRecordBuilder();

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
        case 'cant_location':
          result.cantLocation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cant_name':
          result.cantName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'review':
          result.review = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'revenue':
          result.revenue = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'num_order':
          result.numOrder = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$CanteenRecord extends CanteenRecord {
  @override
  final String uid;
  @override
  final String cantLocation;
  @override
  final String cantName;
  @override
  final double rating;
  @override
  final String review;
  @override
  final double revenue;
  @override
  final int numOrder;
  @override
  final DocumentReference<Object> reference;

  factory _$CanteenRecord([void Function(CanteenRecordBuilder) updates]) =>
      (new CanteenRecordBuilder()..update(updates)).build();

  _$CanteenRecord._(
      {this.uid,
      this.cantLocation,
      this.cantName,
      this.rating,
      this.review,
      this.revenue,
      this.numOrder,
      this.reference})
      : super._();

  @override
  CanteenRecord rebuild(void Function(CanteenRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CanteenRecordBuilder toBuilder() => new CanteenRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CanteenRecord &&
        uid == other.uid &&
        cantLocation == other.cantLocation &&
        cantName == other.cantName &&
        rating == other.rating &&
        review == other.review &&
        revenue == other.revenue &&
        numOrder == other.numOrder &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, uid.hashCode), cantLocation.hashCode),
                            cantName.hashCode),
                        rating.hashCode),
                    review.hashCode),
                revenue.hashCode),
            numOrder.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CanteenRecord')
          ..add('uid', uid)
          ..add('cantLocation', cantLocation)
          ..add('cantName', cantName)
          ..add('rating', rating)
          ..add('review', review)
          ..add('revenue', revenue)
          ..add('numOrder', numOrder)
          ..add('reference', reference))
        .toString();
  }
}

class CanteenRecordBuilder
    implements Builder<CanteenRecord, CanteenRecordBuilder> {
  _$CanteenRecord _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _cantLocation;
  String get cantLocation => _$this._cantLocation;
  set cantLocation(String cantLocation) => _$this._cantLocation = cantLocation;

  String _cantName;
  String get cantName => _$this._cantName;
  set cantName(String cantName) => _$this._cantName = cantName;

  double _rating;
  double get rating => _$this._rating;
  set rating(double rating) => _$this._rating = rating;

  String _review;
  String get review => _$this._review;
  set review(String review) => _$this._review = review;

  double _revenue;
  double get revenue => _$this._revenue;
  set revenue(double revenue) => _$this._revenue = revenue;

  int _numOrder;
  int get numOrder => _$this._numOrder;
  set numOrder(int numOrder) => _$this._numOrder = numOrder;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CanteenRecordBuilder() {
    CanteenRecord._initializeBuilder(this);
  }

  CanteenRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _cantLocation = $v.cantLocation;
      _cantName = $v.cantName;
      _rating = $v.rating;
      _review = $v.review;
      _revenue = $v.revenue;
      _numOrder = $v.numOrder;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CanteenRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CanteenRecord;
  }

  @override
  void update(void Function(CanteenRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CanteenRecord build() {
    final _$result = _$v ??
        new _$CanteenRecord._(
            uid: uid,
            cantLocation: cantLocation,
            cantName: cantName,
            rating: rating,
            review: review,
            revenue: revenue,
            numOrder: numOrder,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
