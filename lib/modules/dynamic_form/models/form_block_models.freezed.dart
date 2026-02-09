// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_block_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FormBlock {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String caption, String value, String? iconSrc)
    statCard,
    required TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )
    chart,
    required TResult Function(List<String> headers, List<List<dynamic>> rows)
    table,
    required TResult Function(String label, bool value, String? name)
    switchField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    cronField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    textField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )
    textArea,
    required TResult Function(String type, String text) alert,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String caption, String value, String? iconSrc)? statCard,
    TResult? Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult? Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult? Function(String label, bool value, String? name)? switchField,
    TResult? Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult? Function(String label, String value, String? name, String? hint)?
    textField,
    TResult? Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult? Function(String type, String text)? alert,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String caption, String value, String? iconSrc)? statCard,
    TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult Function(String label, bool value, String? name)? switchField,
    TResult Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult Function(String label, String value, String? name, String? hint)?
    textField,
    TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult Function(String type, String text)? alert,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatCardBlock value) statCard,
    required TResult Function(ChartBlock value) chart,
    required TResult Function(TableBlock value) table,
    required TResult Function(SwitchFieldBlock value) switchField,
    required TResult Function(CronFieldBlock value) cronField,
    required TResult Function(TextFieldBlock value) textField,
    required TResult Function(TextAreaBlock value) textArea,
    required TResult Function(AlertBlock value) alert,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatCardBlock value)? statCard,
    TResult? Function(ChartBlock value)? chart,
    TResult? Function(TableBlock value)? table,
    TResult? Function(SwitchFieldBlock value)? switchField,
    TResult? Function(CronFieldBlock value)? cronField,
    TResult? Function(TextFieldBlock value)? textField,
    TResult? Function(TextAreaBlock value)? textArea,
    TResult? Function(AlertBlock value)? alert,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatCardBlock value)? statCard,
    TResult Function(ChartBlock value)? chart,
    TResult Function(TableBlock value)? table,
    TResult Function(SwitchFieldBlock value)? switchField,
    TResult Function(CronFieldBlock value)? cronField,
    TResult Function(TextFieldBlock value)? textField,
    TResult Function(TextAreaBlock value)? textArea,
    TResult Function(AlertBlock value)? alert,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormBlockCopyWith<$Res> {
  factory $FormBlockCopyWith(FormBlock value, $Res Function(FormBlock) then) =
      _$FormBlockCopyWithImpl<$Res, FormBlock>;
}

/// @nodoc
class _$FormBlockCopyWithImpl<$Res, $Val extends FormBlock>
    implements $FormBlockCopyWith<$Res> {
  _$FormBlockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StatCardBlockImplCopyWith<$Res> {
  factory _$$StatCardBlockImplCopyWith(
    _$StatCardBlockImpl value,
    $Res Function(_$StatCardBlockImpl) then,
  ) = __$$StatCardBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String caption, String value, String? iconSrc});
}

/// @nodoc
class __$$StatCardBlockImplCopyWithImpl<$Res>
    extends _$FormBlockCopyWithImpl<$Res, _$StatCardBlockImpl>
    implements _$$StatCardBlockImplCopyWith<$Res> {
  __$$StatCardBlockImplCopyWithImpl(
    _$StatCardBlockImpl _value,
    $Res Function(_$StatCardBlockImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caption = null,
    Object? value = null,
    Object? iconSrc = freezed,
  }) {
    return _then(
      _$StatCardBlockImpl(
        caption: null == caption
            ? _value.caption
            : caption // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        iconSrc: freezed == iconSrc
            ? _value.iconSrc
            : iconSrc // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$StatCardBlockImpl extends StatCardBlock {
  const _$StatCardBlockImpl({
    required this.caption,
    required this.value,
    this.iconSrc,
  }) : super._();

  @override
  final String caption;
  @override
  final String value;
  @override
  final String? iconSrc;

  @override
  String toString() {
    return 'FormBlock.statCard(caption: $caption, value: $value, iconSrc: $iconSrc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatCardBlockImpl &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.iconSrc, iconSrc) || other.iconSrc == iconSrc));
  }

  @override
  int get hashCode => Object.hash(runtimeType, caption, value, iconSrc);

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatCardBlockImplCopyWith<_$StatCardBlockImpl> get copyWith =>
      __$$StatCardBlockImplCopyWithImpl<_$StatCardBlockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String caption, String value, String? iconSrc)
    statCard,
    required TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )
    chart,
    required TResult Function(List<String> headers, List<List<dynamic>> rows)
    table,
    required TResult Function(String label, bool value, String? name)
    switchField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    cronField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    textField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )
    textArea,
    required TResult Function(String type, String text) alert,
  }) {
    return statCard(caption, value, iconSrc);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String caption, String value, String? iconSrc)? statCard,
    TResult? Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult? Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult? Function(String label, bool value, String? name)? switchField,
    TResult? Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult? Function(String label, String value, String? name, String? hint)?
    textField,
    TResult? Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult? Function(String type, String text)? alert,
  }) {
    return statCard?.call(caption, value, iconSrc);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String caption, String value, String? iconSrc)? statCard,
    TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult Function(String label, bool value, String? name)? switchField,
    TResult Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult Function(String label, String value, String? name, String? hint)?
    textField,
    TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult Function(String type, String text)? alert,
    required TResult orElse(),
  }) {
    if (statCard != null) {
      return statCard(caption, value, iconSrc);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatCardBlock value) statCard,
    required TResult Function(ChartBlock value) chart,
    required TResult Function(TableBlock value) table,
    required TResult Function(SwitchFieldBlock value) switchField,
    required TResult Function(CronFieldBlock value) cronField,
    required TResult Function(TextFieldBlock value) textField,
    required TResult Function(TextAreaBlock value) textArea,
    required TResult Function(AlertBlock value) alert,
  }) {
    return statCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatCardBlock value)? statCard,
    TResult? Function(ChartBlock value)? chart,
    TResult? Function(TableBlock value)? table,
    TResult? Function(SwitchFieldBlock value)? switchField,
    TResult? Function(CronFieldBlock value)? cronField,
    TResult? Function(TextFieldBlock value)? textField,
    TResult? Function(TextAreaBlock value)? textArea,
    TResult? Function(AlertBlock value)? alert,
  }) {
    return statCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatCardBlock value)? statCard,
    TResult Function(ChartBlock value)? chart,
    TResult Function(TableBlock value)? table,
    TResult Function(SwitchFieldBlock value)? switchField,
    TResult Function(CronFieldBlock value)? cronField,
    TResult Function(TextFieldBlock value)? textField,
    TResult Function(TextAreaBlock value)? textArea,
    TResult Function(AlertBlock value)? alert,
    required TResult orElse(),
  }) {
    if (statCard != null) {
      return statCard(this);
    }
    return orElse();
  }
}

abstract class StatCardBlock extends FormBlock {
  const factory StatCardBlock({
    required final String caption,
    required final String value,
    final String? iconSrc,
  }) = _$StatCardBlockImpl;
  const StatCardBlock._() : super._();

  String get caption;
  String get value;
  String? get iconSrc;

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatCardBlockImplCopyWith<_$StatCardBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChartBlockImplCopyWith<$Res> {
  factory _$$ChartBlockImplCopyWith(
    _$ChartBlockImpl value,
    $Res Function(_$ChartBlockImpl) then,
  ) = __$$ChartBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String? title,
    List<String> labels,
    List<num> series,
    String chartType,
  });
}

/// @nodoc
class __$$ChartBlockImplCopyWithImpl<$Res>
    extends _$FormBlockCopyWithImpl<$Res, _$ChartBlockImpl>
    implements _$$ChartBlockImplCopyWith<$Res> {
  __$$ChartBlockImplCopyWithImpl(
    _$ChartBlockImpl _value,
    $Res Function(_$ChartBlockImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? labels = null,
    Object? series = null,
    Object? chartType = null,
  }) {
    return _then(
      _$ChartBlockImpl(
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        labels: null == labels
            ? _value._labels
            : labels // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        series: null == series
            ? _value._series
            : series // ignore: cast_nullable_to_non_nullable
                  as List<num>,
        chartType: null == chartType
            ? _value.chartType
            : chartType // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ChartBlockImpl extends ChartBlock {
  const _$ChartBlockImpl({
    this.title,
    final List<String> labels = const [],
    final List<num> series = const [],
    this.chartType = 'pie',
  }) : _labels = labels,
       _series = series,
       super._();

  @override
  final String? title;
  final List<String> _labels;
  @override
  @JsonKey()
  List<String> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  final List<num> _series;
  @override
  @JsonKey()
  List<num> get series {
    if (_series is EqualUnmodifiableListView) return _series;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_series);
  }

  @override
  @JsonKey()
  final String chartType;

  @override
  String toString() {
    return 'FormBlock.chart(title: $title, labels: $labels, series: $series, chartType: $chartType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartBlockImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            const DeepCollectionEquality().equals(other._series, _series) &&
            (identical(other.chartType, chartType) ||
                other.chartType == chartType));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    const DeepCollectionEquality().hash(_labels),
    const DeepCollectionEquality().hash(_series),
    chartType,
  );

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartBlockImplCopyWith<_$ChartBlockImpl> get copyWith =>
      __$$ChartBlockImplCopyWithImpl<_$ChartBlockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String caption, String value, String? iconSrc)
    statCard,
    required TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )
    chart,
    required TResult Function(List<String> headers, List<List<dynamic>> rows)
    table,
    required TResult Function(String label, bool value, String? name)
    switchField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    cronField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    textField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )
    textArea,
    required TResult Function(String type, String text) alert,
  }) {
    return chart(title, labels, series, chartType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String caption, String value, String? iconSrc)? statCard,
    TResult? Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult? Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult? Function(String label, bool value, String? name)? switchField,
    TResult? Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult? Function(String label, String value, String? name, String? hint)?
    textField,
    TResult? Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult? Function(String type, String text)? alert,
  }) {
    return chart?.call(title, labels, series, chartType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String caption, String value, String? iconSrc)? statCard,
    TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult Function(String label, bool value, String? name)? switchField,
    TResult Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult Function(String label, String value, String? name, String? hint)?
    textField,
    TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult Function(String type, String text)? alert,
    required TResult orElse(),
  }) {
    if (chart != null) {
      return chart(title, labels, series, chartType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatCardBlock value) statCard,
    required TResult Function(ChartBlock value) chart,
    required TResult Function(TableBlock value) table,
    required TResult Function(SwitchFieldBlock value) switchField,
    required TResult Function(CronFieldBlock value) cronField,
    required TResult Function(TextFieldBlock value) textField,
    required TResult Function(TextAreaBlock value) textArea,
    required TResult Function(AlertBlock value) alert,
  }) {
    return chart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatCardBlock value)? statCard,
    TResult? Function(ChartBlock value)? chart,
    TResult? Function(TableBlock value)? table,
    TResult? Function(SwitchFieldBlock value)? switchField,
    TResult? Function(CronFieldBlock value)? cronField,
    TResult? Function(TextFieldBlock value)? textField,
    TResult? Function(TextAreaBlock value)? textArea,
    TResult? Function(AlertBlock value)? alert,
  }) {
    return chart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatCardBlock value)? statCard,
    TResult Function(ChartBlock value)? chart,
    TResult Function(TableBlock value)? table,
    TResult Function(SwitchFieldBlock value)? switchField,
    TResult Function(CronFieldBlock value)? cronField,
    TResult Function(TextFieldBlock value)? textField,
    TResult Function(TextAreaBlock value)? textArea,
    TResult Function(AlertBlock value)? alert,
    required TResult orElse(),
  }) {
    if (chart != null) {
      return chart(this);
    }
    return orElse();
  }
}

abstract class ChartBlock extends FormBlock {
  const factory ChartBlock({
    final String? title,
    final List<String> labels,
    final List<num> series,
    final String chartType,
  }) = _$ChartBlockImpl;
  const ChartBlock._() : super._();

  String? get title;
  List<String> get labels;
  List<num> get series;
  String get chartType;

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartBlockImplCopyWith<_$ChartBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TableBlockImplCopyWith<$Res> {
  factory _$$TableBlockImplCopyWith(
    _$TableBlockImpl value,
    $Res Function(_$TableBlockImpl) then,
  ) = __$$TableBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> headers, List<List<dynamic>> rows});
}

/// @nodoc
class __$$TableBlockImplCopyWithImpl<$Res>
    extends _$FormBlockCopyWithImpl<$Res, _$TableBlockImpl>
    implements _$$TableBlockImplCopyWith<$Res> {
  __$$TableBlockImplCopyWithImpl(
    _$TableBlockImpl _value,
    $Res Function(_$TableBlockImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? headers = null, Object? rows = null}) {
    return _then(
      _$TableBlockImpl(
        headers: null == headers
            ? _value._headers
            : headers // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        rows: null == rows
            ? _value._rows
            : rows // ignore: cast_nullable_to_non_nullable
                  as List<List<dynamic>>,
      ),
    );
  }
}

/// @nodoc

class _$TableBlockImpl extends TableBlock {
  const _$TableBlockImpl({
    final List<String> headers = const [],
    final List<List<dynamic>> rows = const [],
  }) : _headers = headers,
       _rows = rows,
       super._();

  final List<String> _headers;
  @override
  @JsonKey()
  List<String> get headers {
    if (_headers is EqualUnmodifiableListView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_headers);
  }

  final List<List<dynamic>> _rows;
  @override
  @JsonKey()
  List<List<dynamic>> get rows {
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rows);
  }

  @override
  String toString() {
    return 'FormBlock.table(headers: $headers, rows: $rows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableBlockImpl &&
            const DeepCollectionEquality().equals(other._headers, _headers) &&
            const DeepCollectionEquality().equals(other._rows, _rows));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_headers),
    const DeepCollectionEquality().hash(_rows),
  );

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableBlockImplCopyWith<_$TableBlockImpl> get copyWith =>
      __$$TableBlockImplCopyWithImpl<_$TableBlockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String caption, String value, String? iconSrc)
    statCard,
    required TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )
    chart,
    required TResult Function(List<String> headers, List<List<dynamic>> rows)
    table,
    required TResult Function(String label, bool value, String? name)
    switchField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    cronField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    textField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )
    textArea,
    required TResult Function(String type, String text) alert,
  }) {
    return table(headers, rows);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String caption, String value, String? iconSrc)? statCard,
    TResult? Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult? Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult? Function(String label, bool value, String? name)? switchField,
    TResult? Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult? Function(String label, String value, String? name, String? hint)?
    textField,
    TResult? Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult? Function(String type, String text)? alert,
  }) {
    return table?.call(headers, rows);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String caption, String value, String? iconSrc)? statCard,
    TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult Function(String label, bool value, String? name)? switchField,
    TResult Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult Function(String label, String value, String? name, String? hint)?
    textField,
    TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult Function(String type, String text)? alert,
    required TResult orElse(),
  }) {
    if (table != null) {
      return table(headers, rows);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatCardBlock value) statCard,
    required TResult Function(ChartBlock value) chart,
    required TResult Function(TableBlock value) table,
    required TResult Function(SwitchFieldBlock value) switchField,
    required TResult Function(CronFieldBlock value) cronField,
    required TResult Function(TextFieldBlock value) textField,
    required TResult Function(TextAreaBlock value) textArea,
    required TResult Function(AlertBlock value) alert,
  }) {
    return table(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatCardBlock value)? statCard,
    TResult? Function(ChartBlock value)? chart,
    TResult? Function(TableBlock value)? table,
    TResult? Function(SwitchFieldBlock value)? switchField,
    TResult? Function(CronFieldBlock value)? cronField,
    TResult? Function(TextFieldBlock value)? textField,
    TResult? Function(TextAreaBlock value)? textArea,
    TResult? Function(AlertBlock value)? alert,
  }) {
    return table?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatCardBlock value)? statCard,
    TResult Function(ChartBlock value)? chart,
    TResult Function(TableBlock value)? table,
    TResult Function(SwitchFieldBlock value)? switchField,
    TResult Function(CronFieldBlock value)? cronField,
    TResult Function(TextFieldBlock value)? textField,
    TResult Function(TextAreaBlock value)? textArea,
    TResult Function(AlertBlock value)? alert,
    required TResult orElse(),
  }) {
    if (table != null) {
      return table(this);
    }
    return orElse();
  }
}

abstract class TableBlock extends FormBlock {
  const factory TableBlock({
    final List<String> headers,
    final List<List<dynamic>> rows,
  }) = _$TableBlockImpl;
  const TableBlock._() : super._();

  List<String> get headers;
  List<List<dynamic>> get rows;

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableBlockImplCopyWith<_$TableBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SwitchFieldBlockImplCopyWith<$Res> {
  factory _$$SwitchFieldBlockImplCopyWith(
    _$SwitchFieldBlockImpl value,
    $Res Function(_$SwitchFieldBlockImpl) then,
  ) = __$$SwitchFieldBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String label, bool value, String? name});
}

/// @nodoc
class __$$SwitchFieldBlockImplCopyWithImpl<$Res>
    extends _$FormBlockCopyWithImpl<$Res, _$SwitchFieldBlockImpl>
    implements _$$SwitchFieldBlockImplCopyWith<$Res> {
  __$$SwitchFieldBlockImplCopyWithImpl(
    _$SwitchFieldBlockImpl _value,
    $Res Function(_$SwitchFieldBlockImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? name = freezed,
  }) {
    return _then(
      _$SwitchFieldBlockImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as bool,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SwitchFieldBlockImpl extends SwitchFieldBlock {
  const _$SwitchFieldBlockImpl({
    required this.label,
    this.value = false,
    this.name,
  }) : super._();

  @override
  final String label;
  @override
  @JsonKey()
  final bool value;
  @override
  final String? name;

  @override
  String toString() {
    return 'FormBlock.switchField(label: $label, value: $value, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchFieldBlockImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, value, name);

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwitchFieldBlockImplCopyWith<_$SwitchFieldBlockImpl> get copyWith =>
      __$$SwitchFieldBlockImplCopyWithImpl<_$SwitchFieldBlockImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String caption, String value, String? iconSrc)
    statCard,
    required TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )
    chart,
    required TResult Function(List<String> headers, List<List<dynamic>> rows)
    table,
    required TResult Function(String label, bool value, String? name)
    switchField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    cronField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    textField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )
    textArea,
    required TResult Function(String type, String text) alert,
  }) {
    return switchField(label, value, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String caption, String value, String? iconSrc)? statCard,
    TResult? Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult? Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult? Function(String label, bool value, String? name)? switchField,
    TResult? Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult? Function(String label, String value, String? name, String? hint)?
    textField,
    TResult? Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult? Function(String type, String text)? alert,
  }) {
    return switchField?.call(label, value, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String caption, String value, String? iconSrc)? statCard,
    TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult Function(String label, bool value, String? name)? switchField,
    TResult Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult Function(String label, String value, String? name, String? hint)?
    textField,
    TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult Function(String type, String text)? alert,
    required TResult orElse(),
  }) {
    if (switchField != null) {
      return switchField(label, value, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatCardBlock value) statCard,
    required TResult Function(ChartBlock value) chart,
    required TResult Function(TableBlock value) table,
    required TResult Function(SwitchFieldBlock value) switchField,
    required TResult Function(CronFieldBlock value) cronField,
    required TResult Function(TextFieldBlock value) textField,
    required TResult Function(TextAreaBlock value) textArea,
    required TResult Function(AlertBlock value) alert,
  }) {
    return switchField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatCardBlock value)? statCard,
    TResult? Function(ChartBlock value)? chart,
    TResult? Function(TableBlock value)? table,
    TResult? Function(SwitchFieldBlock value)? switchField,
    TResult? Function(CronFieldBlock value)? cronField,
    TResult? Function(TextFieldBlock value)? textField,
    TResult? Function(TextAreaBlock value)? textArea,
    TResult? Function(AlertBlock value)? alert,
  }) {
    return switchField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatCardBlock value)? statCard,
    TResult Function(ChartBlock value)? chart,
    TResult Function(TableBlock value)? table,
    TResult Function(SwitchFieldBlock value)? switchField,
    TResult Function(CronFieldBlock value)? cronField,
    TResult Function(TextFieldBlock value)? textField,
    TResult Function(TextAreaBlock value)? textArea,
    TResult Function(AlertBlock value)? alert,
    required TResult orElse(),
  }) {
    if (switchField != null) {
      return switchField(this);
    }
    return orElse();
  }
}

abstract class SwitchFieldBlock extends FormBlock {
  const factory SwitchFieldBlock({
    required final String label,
    final bool value,
    final String? name,
  }) = _$SwitchFieldBlockImpl;
  const SwitchFieldBlock._() : super._();

  String get label;
  bool get value;
  String? get name;

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwitchFieldBlockImplCopyWith<_$SwitchFieldBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CronFieldBlockImplCopyWith<$Res> {
  factory _$$CronFieldBlockImplCopyWith(
    _$CronFieldBlockImpl value,
    $Res Function(_$CronFieldBlockImpl) then,
  ) = __$$CronFieldBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String label, String value, String? name, String? hint});
}

/// @nodoc
class __$$CronFieldBlockImplCopyWithImpl<$Res>
    extends _$FormBlockCopyWithImpl<$Res, _$CronFieldBlockImpl>
    implements _$$CronFieldBlockImplCopyWith<$Res> {
  __$$CronFieldBlockImplCopyWithImpl(
    _$CronFieldBlockImpl _value,
    $Res Function(_$CronFieldBlockImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? name = freezed,
    Object? hint = freezed,
  }) {
    return _then(
      _$CronFieldBlockImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        hint: freezed == hint
            ? _value.hint
            : hint // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$CronFieldBlockImpl extends CronFieldBlock {
  const _$CronFieldBlockImpl({
    required this.label,
    this.value = '',
    this.name,
    this.hint,
  }) : super._();

  @override
  final String label;
  @override
  @JsonKey()
  final String value;
  @override
  final String? name;
  @override
  final String? hint;

  @override
  String toString() {
    return 'FormBlock.cronField(label: $label, value: $value, name: $name, hint: $hint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CronFieldBlockImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hint, hint) || other.hint == hint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, value, name, hint);

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CronFieldBlockImplCopyWith<_$CronFieldBlockImpl> get copyWith =>
      __$$CronFieldBlockImplCopyWithImpl<_$CronFieldBlockImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String caption, String value, String? iconSrc)
    statCard,
    required TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )
    chart,
    required TResult Function(List<String> headers, List<List<dynamic>> rows)
    table,
    required TResult Function(String label, bool value, String? name)
    switchField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    cronField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    textField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )
    textArea,
    required TResult Function(String type, String text) alert,
  }) {
    return cronField(label, value, name, hint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String caption, String value, String? iconSrc)? statCard,
    TResult? Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult? Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult? Function(String label, bool value, String? name)? switchField,
    TResult? Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult? Function(String label, String value, String? name, String? hint)?
    textField,
    TResult? Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult? Function(String type, String text)? alert,
  }) {
    return cronField?.call(label, value, name, hint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String caption, String value, String? iconSrc)? statCard,
    TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult Function(String label, bool value, String? name)? switchField,
    TResult Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult Function(String label, String value, String? name, String? hint)?
    textField,
    TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult Function(String type, String text)? alert,
    required TResult orElse(),
  }) {
    if (cronField != null) {
      return cronField(label, value, name, hint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatCardBlock value) statCard,
    required TResult Function(ChartBlock value) chart,
    required TResult Function(TableBlock value) table,
    required TResult Function(SwitchFieldBlock value) switchField,
    required TResult Function(CronFieldBlock value) cronField,
    required TResult Function(TextFieldBlock value) textField,
    required TResult Function(TextAreaBlock value) textArea,
    required TResult Function(AlertBlock value) alert,
  }) {
    return cronField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatCardBlock value)? statCard,
    TResult? Function(ChartBlock value)? chart,
    TResult? Function(TableBlock value)? table,
    TResult? Function(SwitchFieldBlock value)? switchField,
    TResult? Function(CronFieldBlock value)? cronField,
    TResult? Function(TextFieldBlock value)? textField,
    TResult? Function(TextAreaBlock value)? textArea,
    TResult? Function(AlertBlock value)? alert,
  }) {
    return cronField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatCardBlock value)? statCard,
    TResult Function(ChartBlock value)? chart,
    TResult Function(TableBlock value)? table,
    TResult Function(SwitchFieldBlock value)? switchField,
    TResult Function(CronFieldBlock value)? cronField,
    TResult Function(TextFieldBlock value)? textField,
    TResult Function(TextAreaBlock value)? textArea,
    TResult Function(AlertBlock value)? alert,
    required TResult orElse(),
  }) {
    if (cronField != null) {
      return cronField(this);
    }
    return orElse();
  }
}

abstract class CronFieldBlock extends FormBlock {
  const factory CronFieldBlock({
    required final String label,
    final String value,
    final String? name,
    final String? hint,
  }) = _$CronFieldBlockImpl;
  const CronFieldBlock._() : super._();

  String get label;
  String get value;
  String? get name;
  String? get hint;

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CronFieldBlockImplCopyWith<_$CronFieldBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TextFieldBlockImplCopyWith<$Res> {
  factory _$$TextFieldBlockImplCopyWith(
    _$TextFieldBlockImpl value,
    $Res Function(_$TextFieldBlockImpl) then,
  ) = __$$TextFieldBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String label, String value, String? name, String? hint});
}

/// @nodoc
class __$$TextFieldBlockImplCopyWithImpl<$Res>
    extends _$FormBlockCopyWithImpl<$Res, _$TextFieldBlockImpl>
    implements _$$TextFieldBlockImplCopyWith<$Res> {
  __$$TextFieldBlockImplCopyWithImpl(
    _$TextFieldBlockImpl _value,
    $Res Function(_$TextFieldBlockImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? name = freezed,
    Object? hint = freezed,
  }) {
    return _then(
      _$TextFieldBlockImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        hint: freezed == hint
            ? _value.hint
            : hint // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$TextFieldBlockImpl extends TextFieldBlock {
  const _$TextFieldBlockImpl({
    required this.label,
    this.value = '',
    this.name,
    this.hint,
  }) : super._();

  @override
  final String label;
  @override
  @JsonKey()
  final String value;
  @override
  final String? name;
  @override
  final String? hint;

  @override
  String toString() {
    return 'FormBlock.textField(label: $label, value: $value, name: $name, hint: $hint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextFieldBlockImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hint, hint) || other.hint == hint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, value, name, hint);

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextFieldBlockImplCopyWith<_$TextFieldBlockImpl> get copyWith =>
      __$$TextFieldBlockImplCopyWithImpl<_$TextFieldBlockImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String caption, String value, String? iconSrc)
    statCard,
    required TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )
    chart,
    required TResult Function(List<String> headers, List<List<dynamic>> rows)
    table,
    required TResult Function(String label, bool value, String? name)
    switchField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    cronField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    textField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )
    textArea,
    required TResult Function(String type, String text) alert,
  }) {
    return textField(label, value, name, hint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String caption, String value, String? iconSrc)? statCard,
    TResult? Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult? Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult? Function(String label, bool value, String? name)? switchField,
    TResult? Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult? Function(String label, String value, String? name, String? hint)?
    textField,
    TResult? Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult? Function(String type, String text)? alert,
  }) {
    return textField?.call(label, value, name, hint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String caption, String value, String? iconSrc)? statCard,
    TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult Function(String label, bool value, String? name)? switchField,
    TResult Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult Function(String label, String value, String? name, String? hint)?
    textField,
    TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult Function(String type, String text)? alert,
    required TResult orElse(),
  }) {
    if (textField != null) {
      return textField(label, value, name, hint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatCardBlock value) statCard,
    required TResult Function(ChartBlock value) chart,
    required TResult Function(TableBlock value) table,
    required TResult Function(SwitchFieldBlock value) switchField,
    required TResult Function(CronFieldBlock value) cronField,
    required TResult Function(TextFieldBlock value) textField,
    required TResult Function(TextAreaBlock value) textArea,
    required TResult Function(AlertBlock value) alert,
  }) {
    return textField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatCardBlock value)? statCard,
    TResult? Function(ChartBlock value)? chart,
    TResult? Function(TableBlock value)? table,
    TResult? Function(SwitchFieldBlock value)? switchField,
    TResult? Function(CronFieldBlock value)? cronField,
    TResult? Function(TextFieldBlock value)? textField,
    TResult? Function(TextAreaBlock value)? textArea,
    TResult? Function(AlertBlock value)? alert,
  }) {
    return textField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatCardBlock value)? statCard,
    TResult Function(ChartBlock value)? chart,
    TResult Function(TableBlock value)? table,
    TResult Function(SwitchFieldBlock value)? switchField,
    TResult Function(CronFieldBlock value)? cronField,
    TResult Function(TextFieldBlock value)? textField,
    TResult Function(TextAreaBlock value)? textArea,
    TResult Function(AlertBlock value)? alert,
    required TResult orElse(),
  }) {
    if (textField != null) {
      return textField(this);
    }
    return orElse();
  }
}

abstract class TextFieldBlock extends FormBlock {
  const factory TextFieldBlock({
    required final String label,
    final String value,
    final String? name,
    final String? hint,
  }) = _$TextFieldBlockImpl;
  const TextFieldBlock._() : super._();

  String get label;
  String get value;
  String? get name;
  String? get hint;

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextFieldBlockImplCopyWith<_$TextFieldBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TextAreaBlockImplCopyWith<$Res> {
  factory _$$TextAreaBlockImplCopyWith(
    _$TextAreaBlockImpl value,
    $Res Function(_$TextAreaBlockImpl) then,
  ) = __$$TextAreaBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String label, String value, String? name, String? hint, int rows});
}

/// @nodoc
class __$$TextAreaBlockImplCopyWithImpl<$Res>
    extends _$FormBlockCopyWithImpl<$Res, _$TextAreaBlockImpl>
    implements _$$TextAreaBlockImplCopyWith<$Res> {
  __$$TextAreaBlockImplCopyWithImpl(
    _$TextAreaBlockImpl _value,
    $Res Function(_$TextAreaBlockImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? name = freezed,
    Object? hint = freezed,
    Object? rows = null,
  }) {
    return _then(
      _$TextAreaBlockImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        hint: freezed == hint
            ? _value.hint
            : hint // ignore: cast_nullable_to_non_nullable
                  as String?,
        rows: null == rows
            ? _value.rows
            : rows // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$TextAreaBlockImpl extends TextAreaBlock {
  const _$TextAreaBlockImpl({
    required this.label,
    this.value = '',
    this.name,
    this.hint,
    this.rows = 3,
  }) : super._();

  @override
  final String label;
  @override
  @JsonKey()
  final String value;
  @override
  final String? name;
  @override
  final String? hint;
  @override
  @JsonKey()
  final int rows;

  @override
  String toString() {
    return 'FormBlock.textArea(label: $label, value: $value, name: $name, hint: $hint, rows: $rows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextAreaBlockImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hint, hint) || other.hint == hint) &&
            (identical(other.rows, rows) || other.rows == rows));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, value, name, hint, rows);

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextAreaBlockImplCopyWith<_$TextAreaBlockImpl> get copyWith =>
      __$$TextAreaBlockImplCopyWithImpl<_$TextAreaBlockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String caption, String value, String? iconSrc)
    statCard,
    required TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )
    chart,
    required TResult Function(List<String> headers, List<List<dynamic>> rows)
    table,
    required TResult Function(String label, bool value, String? name)
    switchField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    cronField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    textField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )
    textArea,
    required TResult Function(String type, String text) alert,
  }) {
    return textArea(label, value, name, hint, rows);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String caption, String value, String? iconSrc)? statCard,
    TResult? Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult? Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult? Function(String label, bool value, String? name)? switchField,
    TResult? Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult? Function(String label, String value, String? name, String? hint)?
    textField,
    TResult? Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult? Function(String type, String text)? alert,
  }) {
    return textArea?.call(label, value, name, hint, rows);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String caption, String value, String? iconSrc)? statCard,
    TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult Function(String label, bool value, String? name)? switchField,
    TResult Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult Function(String label, String value, String? name, String? hint)?
    textField,
    TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult Function(String type, String text)? alert,
    required TResult orElse(),
  }) {
    if (textArea != null) {
      return textArea(label, value, name, hint, rows);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatCardBlock value) statCard,
    required TResult Function(ChartBlock value) chart,
    required TResult Function(TableBlock value) table,
    required TResult Function(SwitchFieldBlock value) switchField,
    required TResult Function(CronFieldBlock value) cronField,
    required TResult Function(TextFieldBlock value) textField,
    required TResult Function(TextAreaBlock value) textArea,
    required TResult Function(AlertBlock value) alert,
  }) {
    return textArea(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatCardBlock value)? statCard,
    TResult? Function(ChartBlock value)? chart,
    TResult? Function(TableBlock value)? table,
    TResult? Function(SwitchFieldBlock value)? switchField,
    TResult? Function(CronFieldBlock value)? cronField,
    TResult? Function(TextFieldBlock value)? textField,
    TResult? Function(TextAreaBlock value)? textArea,
    TResult? Function(AlertBlock value)? alert,
  }) {
    return textArea?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatCardBlock value)? statCard,
    TResult Function(ChartBlock value)? chart,
    TResult Function(TableBlock value)? table,
    TResult Function(SwitchFieldBlock value)? switchField,
    TResult Function(CronFieldBlock value)? cronField,
    TResult Function(TextFieldBlock value)? textField,
    TResult Function(TextAreaBlock value)? textArea,
    TResult Function(AlertBlock value)? alert,
    required TResult orElse(),
  }) {
    if (textArea != null) {
      return textArea(this);
    }
    return orElse();
  }
}

abstract class TextAreaBlock extends FormBlock {
  const factory TextAreaBlock({
    required final String label,
    final String value,
    final String? name,
    final String? hint,
    final int rows,
  }) = _$TextAreaBlockImpl;
  const TextAreaBlock._() : super._();

  String get label;
  String get value;
  String? get name;
  String? get hint;
  int get rows;

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextAreaBlockImplCopyWith<_$TextAreaBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AlertBlockImplCopyWith<$Res> {
  factory _$$AlertBlockImplCopyWith(
    _$AlertBlockImpl value,
    $Res Function(_$AlertBlockImpl) then,
  ) = __$$AlertBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String type, String text});
}

/// @nodoc
class __$$AlertBlockImplCopyWithImpl<$Res>
    extends _$FormBlockCopyWithImpl<$Res, _$AlertBlockImpl>
    implements _$$AlertBlockImplCopyWith<$Res> {
  __$$AlertBlockImplCopyWithImpl(
    _$AlertBlockImpl _value,
    $Res Function(_$AlertBlockImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? text = null}) {
    return _then(
      _$AlertBlockImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AlertBlockImpl extends AlertBlock {
  const _$AlertBlockImpl({this.type = 'info', required this.text}) : super._();

  @override
  @JsonKey()
  final String type;
  @override
  final String text;

  @override
  String toString() {
    return 'FormBlock.alert(type: $type, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertBlockImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, text);

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertBlockImplCopyWith<_$AlertBlockImpl> get copyWith =>
      __$$AlertBlockImplCopyWithImpl<_$AlertBlockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String caption, String value, String? iconSrc)
    statCard,
    required TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )
    chart,
    required TResult Function(List<String> headers, List<List<dynamic>> rows)
    table,
    required TResult Function(String label, bool value, String? name)
    switchField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    cronField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
    )
    textField,
    required TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )
    textArea,
    required TResult Function(String type, String text) alert,
  }) {
    return alert(type, text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String caption, String value, String? iconSrc)? statCard,
    TResult? Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult? Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult? Function(String label, bool value, String? name)? switchField,
    TResult? Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult? Function(String label, String value, String? name, String? hint)?
    textField,
    TResult? Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult? Function(String type, String text)? alert,
  }) {
    return alert?.call(type, text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String caption, String value, String? iconSrc)? statCard,
    TResult Function(
      String? title,
      List<String> labels,
      List<num> series,
      String chartType,
    )?
    chart,
    TResult Function(List<String> headers, List<List<dynamic>> rows)? table,
    TResult Function(String label, bool value, String? name)? switchField,
    TResult Function(String label, String value, String? name, String? hint)?
    cronField,
    TResult Function(String label, String value, String? name, String? hint)?
    textField,
    TResult Function(
      String label,
      String value,
      String? name,
      String? hint,
      int rows,
    )?
    textArea,
    TResult Function(String type, String text)? alert,
    required TResult orElse(),
  }) {
    if (alert != null) {
      return alert(type, text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatCardBlock value) statCard,
    required TResult Function(ChartBlock value) chart,
    required TResult Function(TableBlock value) table,
    required TResult Function(SwitchFieldBlock value) switchField,
    required TResult Function(CronFieldBlock value) cronField,
    required TResult Function(TextFieldBlock value) textField,
    required TResult Function(TextAreaBlock value) textArea,
    required TResult Function(AlertBlock value) alert,
  }) {
    return alert(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatCardBlock value)? statCard,
    TResult? Function(ChartBlock value)? chart,
    TResult? Function(TableBlock value)? table,
    TResult? Function(SwitchFieldBlock value)? switchField,
    TResult? Function(CronFieldBlock value)? cronField,
    TResult? Function(TextFieldBlock value)? textField,
    TResult? Function(TextAreaBlock value)? textArea,
    TResult? Function(AlertBlock value)? alert,
  }) {
    return alert?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatCardBlock value)? statCard,
    TResult Function(ChartBlock value)? chart,
    TResult Function(TableBlock value)? table,
    TResult Function(SwitchFieldBlock value)? switchField,
    TResult Function(CronFieldBlock value)? cronField,
    TResult Function(TextFieldBlock value)? textField,
    TResult Function(TextAreaBlock value)? textArea,
    TResult Function(AlertBlock value)? alert,
    required TResult orElse(),
  }) {
    if (alert != null) {
      return alert(this);
    }
    return orElse();
  }
}

abstract class AlertBlock extends FormBlock {
  const factory AlertBlock({final String type, required final String text}) =
      _$AlertBlockImpl;
  const AlertBlock._() : super._();

  String get type;
  String get text;

  /// Create a copy of FormBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlertBlockImplCopyWith<_$AlertBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
