// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderRecord> _$orderRecordSerializer = new _$OrderRecordSerializer();

class _$OrderRecordSerializer implements StructuredSerializer<OrderRecord> {
  @override
  final Iterable<Type> types = const [OrderRecord, _$OrderRecord];
  @override
  final String wireName = 'OrderRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, OrderRecord object,
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
    value = object.timeorder;
    if (value != null) {
      result
        ..add('timeorder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.statusorder;
    if (value != null) {
      result
        ..add('statusorder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.customername;
    if (value != null) {
      result
        ..add('customername')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.namefood;
    if (value != null) {
      result
        ..add('namefood')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photofood;
    if (value != null) {
      result
        ..add('photofood')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pricefood;
    if (value != null) {
      result
        ..add('pricefood')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.uidCust;
    if (value != null) {
      result
        ..add('uid_cust')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uidFood;
    if (value != null) {
      result
        ..add('uid_food')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uidCanteen;
    if (value != null) {
      result
        ..add('uid_canteen')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notes;
    if (value != null) {
      result
        ..add('notes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.stock;
    if (value != null) {
      result
        ..add('stock')
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
  OrderRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderRecordBuilder();

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
        case 'timeorder':
          result.timeorder = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'statusorder':
          result.statusorder = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customername':
          result.customername = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'namefood':
          result.namefood = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photofood':
          result.photofood = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pricefood':
          result.pricefood = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'uid_cust':
          result.uidCust = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid_food':
          result.uidFood = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid_canteen':
          result.uidCanteen = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'notes':
          result.notes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'stock':
          result.stock = serializers.deserialize(value,
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

class _$OrderRecord extends OrderRecord {
  @override
  final String uid;
  @override
  final DateTime timeorder;
  @override
  final String statusorder;
  @override
  final String customername;
  @override
  final String namefood;
  @override
  final String photofood;
  @override
  final double pricefood;
  @override
  final String uidCust;
  @override
  final String uidFood;
  @override
  final String uidCanteen;
  @override
  final String notes;
  @override
  final int stock;
  @override
  final DocumentReference<Object> reference;

  factory _$OrderRecord([void Function(OrderRecordBuilder) updates]) =>
      (new OrderRecordBuilder()..update(updates)).build();

  _$OrderRecord._(
      {this.uid,
      this.timeorder,
      this.statusorder,
      this.customername,
      this.namefood,
      this.photofood,
      this.pricefood,
      this.uidCust,
      this.uidFood,
      this.uidCanteen,
      this.notes,
      this.stock,
      this.reference})
      : super._();

  @override
  OrderRecord rebuild(void Function(OrderRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderRecordBuilder toBuilder() => new OrderRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderRecord &&
        uid == other.uid &&
        timeorder == other.timeorder &&
        statusorder == other.statusorder &&
        customername == other.customername &&
        namefood == other.namefood &&
        photofood == other.photofood &&
        pricefood == other.pricefood &&
        uidCust == other.uidCust &&
        uidFood == other.uidFood &&
        uidCanteen == other.uidCanteen &&
        notes == other.notes &&
        stock == other.stock &&
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
                                        $jc(
                                            $jc(
                                                $jc($jc(0, uid.hashCode),
                                                    timeorder.hashCode),
                                                statusorder.hashCode),
                                            customername.hashCode),
                                        namefood.hashCode),
                                    photofood.hashCode),
                                pricefood.hashCode),
                            uidCust.hashCode),
                        uidFood.hashCode),
                    uidCanteen.hashCode),
                notes.hashCode),
            stock.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrderRecord')
          ..add('uid', uid)
          ..add('timeorder', timeorder)
          ..add('statusorder', statusorder)
          ..add('customername', customername)
          ..add('namefood', namefood)
          ..add('photofood', photofood)
          ..add('pricefood', pricefood)
          ..add('uidCust', uidCust)
          ..add('uidFood', uidFood)
          ..add('uidCanteen', uidCanteen)
          ..add('notes', notes)
          ..add('stock', stock)
          ..add('reference', reference))
        .toString();
  }
}

class OrderRecordBuilder implements Builder<OrderRecord, OrderRecordBuilder> {
  _$OrderRecord _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  DateTime _timeorder;
  DateTime get timeorder => _$this._timeorder;
  set timeorder(DateTime timeorder) => _$this._timeorder = timeorder;

  String _statusorder;
  String get statusorder => _$this._statusorder;
  set statusorder(String statusorder) => _$this._statusorder = statusorder;

  String _customername;
  String get customername => _$this._customername;
  set customername(String customername) => _$this._customername = customername;

  String _namefood;
  String get namefood => _$this._namefood;
  set namefood(String namefood) => _$this._namefood = namefood;

  String _photofood;
  String get photofood => _$this._photofood;
  set photofood(String photofood) => _$this._photofood = photofood;

  double _pricefood;
  double get pricefood => _$this._pricefood;
  set pricefood(double pricefood) => _$this._pricefood = pricefood;

  String _uidCust;
  String get uidCust => _$this._uidCust;
  set uidCust(String uidCust) => _$this._uidCust = uidCust;

  String _uidFood;
  String get uidFood => _$this._uidFood;
  set uidFood(String uidFood) => _$this._uidFood = uidFood;

  String _uidCanteen;
  String get uidCanteen => _$this._uidCanteen;
  set uidCanteen(String uidCanteen) => _$this._uidCanteen = uidCanteen;

  String _notes;
  String get notes => _$this._notes;
  set notes(String notes) => _$this._notes = notes;

  int _stock;
  int get stock => _$this._stock;
  set stock(int stock) => _$this._stock = stock;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  OrderRecordBuilder() {
    OrderRecord._initializeBuilder(this);
  }

  OrderRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _timeorder = $v.timeorder;
      _statusorder = $v.statusorder;
      _customername = $v.customername;
      _namefood = $v.namefood;
      _photofood = $v.photofood;
      _pricefood = $v.pricefood;
      _uidCust = $v.uidCust;
      _uidFood = $v.uidFood;
      _uidCanteen = $v.uidCanteen;
      _notes = $v.notes;
      _stock = $v.stock;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderRecord;
  }

  @override
  void update(void Function(OrderRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrderRecord build() {
    final _$result = _$v ??
        new _$OrderRecord._(
            uid: uid,
            timeorder: timeorder,
            statusorder: statusorder,
            customername: customername,
            namefood: namefood,
            photofood: photofood,
            pricefood: pricefood,
            uidCust: uidCust,
            uidFood: uidFood,
            uidCanteen: uidCanteen,
            notes: notes,
            stock: stock,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
