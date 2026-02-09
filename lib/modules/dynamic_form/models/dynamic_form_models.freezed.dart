// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dynamic_form_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DynamicFormResponse _$DynamicFormResponseFromJson(Map<String, dynamic> json) {
  return _DynamicFormResponse.fromJson(json);
}

/// @nodoc
mixin _$DynamicFormResponse {
  String? get render_mode => throw _privateConstructorUsedError;
  List<FormNode> get page => throw _privateConstructorUsedError;
  List<FormNode> get conf => throw _privateConstructorUsedError;
  Map<String, dynamic>? get model => throw _privateConstructorUsedError;

  /// Serializes this DynamicFormResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DynamicFormResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DynamicFormResponseCopyWith<DynamicFormResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynamicFormResponseCopyWith<$Res> {
  factory $DynamicFormResponseCopyWith(
    DynamicFormResponse value,
    $Res Function(DynamicFormResponse) then,
  ) = _$DynamicFormResponseCopyWithImpl<$Res, DynamicFormResponse>;
  @useResult
  $Res call({
    String? render_mode,
    List<FormNode> page,
    List<FormNode> conf,
    Map<String, dynamic>? model,
  });
}

/// @nodoc
class _$DynamicFormResponseCopyWithImpl<$Res, $Val extends DynamicFormResponse>
    implements $DynamicFormResponseCopyWith<$Res> {
  _$DynamicFormResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DynamicFormResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? render_mode = freezed,
    Object? page = null,
    Object? conf = null,
    Object? model = freezed,
  }) {
    return _then(
      _value.copyWith(
            render_mode: freezed == render_mode
                ? _value.render_mode
                : render_mode // ignore: cast_nullable_to_non_nullable
                      as String?,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as List<FormNode>,
            conf: null == conf
                ? _value.conf
                : conf // ignore: cast_nullable_to_non_nullable
                      as List<FormNode>,
            model: freezed == model
                ? _value.model
                : model // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DynamicFormResponseImplCopyWith<$Res>
    implements $DynamicFormResponseCopyWith<$Res> {
  factory _$$DynamicFormResponseImplCopyWith(
    _$DynamicFormResponseImpl value,
    $Res Function(_$DynamicFormResponseImpl) then,
  ) = __$$DynamicFormResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? render_mode,
    List<FormNode> page,
    List<FormNode> conf,
    Map<String, dynamic>? model,
  });
}

/// @nodoc
class __$$DynamicFormResponseImplCopyWithImpl<$Res>
    extends _$DynamicFormResponseCopyWithImpl<$Res, _$DynamicFormResponseImpl>
    implements _$$DynamicFormResponseImplCopyWith<$Res> {
  __$$DynamicFormResponseImplCopyWithImpl(
    _$DynamicFormResponseImpl _value,
    $Res Function(_$DynamicFormResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DynamicFormResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? render_mode = freezed,
    Object? page = null,
    Object? conf = null,
    Object? model = freezed,
  }) {
    return _then(
      _$DynamicFormResponseImpl(
        render_mode: freezed == render_mode
            ? _value.render_mode
            : render_mode // ignore: cast_nullable_to_non_nullable
                  as String?,
        page: null == page
            ? _value._page
            : page // ignore: cast_nullable_to_non_nullable
                  as List<FormNode>,
        conf: null == conf
            ? _value._conf
            : conf // ignore: cast_nullable_to_non_nullable
                  as List<FormNode>,
        model: freezed == model
            ? _value._model
            : model // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DynamicFormResponseImpl implements _DynamicFormResponse {
  const _$DynamicFormResponseImpl({
    this.render_mode,
    final List<FormNode> page = const [],
    final List<FormNode> conf = const [],
    final Map<String, dynamic>? model,
  }) : _page = page,
       _conf = conf,
       _model = model;

  factory _$DynamicFormResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DynamicFormResponseImplFromJson(json);

  @override
  final String? render_mode;
  final List<FormNode> _page;
  @override
  @JsonKey()
  List<FormNode> get page {
    if (_page is EqualUnmodifiableListView) return _page;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_page);
  }

  final List<FormNode> _conf;
  @override
  @JsonKey()
  List<FormNode> get conf {
    if (_conf is EqualUnmodifiableListView) return _conf;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conf);
  }

  final Map<String, dynamic>? _model;
  @override
  Map<String, dynamic>? get model {
    final value = _model;
    if (value == null) return null;
    if (_model is EqualUnmodifiableMapView) return _model;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DynamicFormResponse(render_mode: $render_mode, page: $page, conf: $conf, model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DynamicFormResponseImpl &&
            (identical(other.render_mode, render_mode) ||
                other.render_mode == render_mode) &&
            const DeepCollectionEquality().equals(other._page, _page) &&
            const DeepCollectionEquality().equals(other._conf, _conf) &&
            const DeepCollectionEquality().equals(other._model, _model));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    render_mode,
    const DeepCollectionEquality().hash(_page),
    const DeepCollectionEquality().hash(_conf),
    const DeepCollectionEquality().hash(_model),
  );

  /// Create a copy of DynamicFormResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DynamicFormResponseImplCopyWith<_$DynamicFormResponseImpl> get copyWith =>
      __$$DynamicFormResponseImplCopyWithImpl<_$DynamicFormResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DynamicFormResponseImplToJson(this);
  }
}

abstract class _DynamicFormResponse implements DynamicFormResponse {
  const factory _DynamicFormResponse({
    final String? render_mode,
    final List<FormNode> page,
    final List<FormNode> conf,
    final Map<String, dynamic>? model,
  }) = _$DynamicFormResponseImpl;

  factory _DynamicFormResponse.fromJson(Map<String, dynamic> json) =
      _$DynamicFormResponseImpl.fromJson;

  @override
  String? get render_mode;
  @override
  List<FormNode> get page;
  @override
  List<FormNode> get conf;
  @override
  Map<String, dynamic>? get model;

  /// Create a copy of DynamicFormResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DynamicFormResponseImplCopyWith<_$DynamicFormResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FormNode _$FormNodeFromJson(Map<String, dynamic> json) {
  return _FormNode.fromJson(json);
}

/// @nodoc
mixin _$FormNode {
  String get component => throw _privateConstructorUsedError;
  Map<String, dynamic>? get props => throw _privateConstructorUsedError;
  List<FormNode> get content => throw _privateConstructorUsedError;
  dynamic get text => throw _privateConstructorUsedError;

  /// Serializes this FormNode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FormNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormNodeCopyWith<FormNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormNodeCopyWith<$Res> {
  factory $FormNodeCopyWith(FormNode value, $Res Function(FormNode) then) =
      _$FormNodeCopyWithImpl<$Res, FormNode>;
  @useResult
  $Res call({
    String component,
    Map<String, dynamic>? props,
    List<FormNode> content,
    dynamic text,
  });
}

/// @nodoc
class _$FormNodeCopyWithImpl<$Res, $Val extends FormNode>
    implements $FormNodeCopyWith<$Res> {
  _$FormNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? component = null,
    Object? props = freezed,
    Object? content = null,
    Object? text = freezed,
  }) {
    return _then(
      _value.copyWith(
            component: null == component
                ? _value.component
                : component // ignore: cast_nullable_to_non_nullable
                      as String,
            props: freezed == props
                ? _value.props
                : props // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as List<FormNode>,
            text: freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as dynamic,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FormNodeImplCopyWith<$Res>
    implements $FormNodeCopyWith<$Res> {
  factory _$$FormNodeImplCopyWith(
    _$FormNodeImpl value,
    $Res Function(_$FormNodeImpl) then,
  ) = __$$FormNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String component,
    Map<String, dynamic>? props,
    List<FormNode> content,
    dynamic text,
  });
}

/// @nodoc
class __$$FormNodeImplCopyWithImpl<$Res>
    extends _$FormNodeCopyWithImpl<$Res, _$FormNodeImpl>
    implements _$$FormNodeImplCopyWith<$Res> {
  __$$FormNodeImplCopyWithImpl(
    _$FormNodeImpl _value,
    $Res Function(_$FormNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? component = null,
    Object? props = freezed,
    Object? content = null,
    Object? text = freezed,
  }) {
    return _then(
      _$FormNodeImpl(
        component: null == component
            ? _value.component
            : component // ignore: cast_nullable_to_non_nullable
                  as String,
        props: freezed == props
            ? _value._props
            : props // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        content: null == content
            ? _value._content
            : content // ignore: cast_nullable_to_non_nullable
                  as List<FormNode>,
        text: freezed == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as dynamic,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FormNodeImpl implements _FormNode {
  const _$FormNodeImpl({
    required this.component,
    final Map<String, dynamic>? props,
    final List<FormNode> content = const [],
    this.text,
  }) : _props = props,
       _content = content;

  factory _$FormNodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormNodeImplFromJson(json);

  @override
  final String component;
  final Map<String, dynamic>? _props;
  @override
  Map<String, dynamic>? get props {
    final value = _props;
    if (value == null) return null;
    if (_props is EqualUnmodifiableMapView) return _props;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<FormNode> _content;
  @override
  @JsonKey()
  List<FormNode> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final dynamic text;

  @override
  String toString() {
    return 'FormNode(component: $component, props: $props, content: $content, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormNodeImpl &&
            (identical(other.component, component) ||
                other.component == component) &&
            const DeepCollectionEquality().equals(other._props, _props) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    component,
    const DeepCollectionEquality().hash(_props),
    const DeepCollectionEquality().hash(_content),
    const DeepCollectionEquality().hash(text),
  );

  /// Create a copy of FormNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormNodeImplCopyWith<_$FormNodeImpl> get copyWith =>
      __$$FormNodeImplCopyWithImpl<_$FormNodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormNodeImplToJson(this);
  }
}

abstract class _FormNode implements FormNode {
  const factory _FormNode({
    required final String component,
    final Map<String, dynamic>? props,
    final List<FormNode> content,
    final dynamic text,
  }) = _$FormNodeImpl;

  factory _FormNode.fromJson(Map<String, dynamic> json) =
      _$FormNodeImpl.fromJson;

  @override
  String get component;
  @override
  Map<String, dynamic>? get props;
  @override
  List<FormNode> get content;
  @override
  dynamic get text;

  /// Create a copy of FormNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormNodeImplCopyWith<_$FormNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
