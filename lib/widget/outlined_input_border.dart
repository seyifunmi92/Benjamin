import 'package:flutter/material.dart';

class OutlinedInputBorder extends InputBorder {
  /// Creates a rounded rectangle outline border for an [InputDecorator].
  ///
  /// If the [borderSide] parameter is [BorderSide.none], it will not draw a
  /// border. However, it will still define a shape (which you can see if
  /// [InputDecoration.filled] is true).
  ///
  /// If an application does not specify a [borderSide] parameter of
  /// value [BorderSide.none], the input decorator substitutes its own, using
  /// [copyWith], based on the current theme and [InputDecorator.isFocused].
  ///
  /// The [borderRadius] parameter defaults to a value where all four
  /// corners have a circular radius of 4.0. The [borderRadius] parameter
  /// must not be null and the corner radii must be circular, i.e. their
  /// [Radius.x] and [Radius.y] values must be the same.
  ///
  /// See also:
  ///
  ///  * [InputDecoration.floatingLabelBehavior], which should be set to
  ///    [FloatingLabelBehavior.never] when the [borderSide] is
  ///    [BorderSide.none]. If let as [FloatingLabelBehavior.auto], the label
  ///    will extend beyond the container as if the border were still being
  ///    drawn.
  const OutlinedInputBorder({
    super.borderSide = const BorderSide(),
    this.innerBorderSide = const BorderSide(color: Colors.transparent),
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
  });

  /// The radii of the border's rounded rectangle corners.
  ///
  /// The corner radii must be circular, i.e. their [Radius.x] and [Radius.y]
  /// values must be the same.
  final BorderRadius borderRadius;

  final BorderSide innerBorderSide;

  @override
  bool get isOutline => false;

  @override
  OutlinedInputBorder copyWith({
    BorderSide? borderSide,
    BorderSide? innerBorderSide,
    BorderRadius? borderRadius,
  }) {
    return OutlinedInputBorder(
      borderSide: borderSide ?? this.borderSide,
      innerBorderSide: innerBorderSide ?? this.innerBorderSide,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(borderSide.width);
  }

  @override
  OutlinedInputBorder scale(double t) {
    return OutlinedInputBorder(
      borderSide: borderSide.scale(t),
      innerBorderSide: innerBorderSide.scale(t),
      borderRadius: borderRadius * t,
    );
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is OutlinedInputBorder) {
      final OutlinedInputBorder outline = a;
      return OutlinedInputBorder(
        borderRadius: BorderRadius.lerp(outline.borderRadius, borderRadius, t)!,
        borderSide: BorderSide.lerp(outline.borderSide, borderSide, t),
        innerBorderSide:
            BorderSide.lerp(outline.innerBorderSide, innerBorderSide, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is OutlinedInputBorder) {
      final OutlinedInputBorder outline = b;
      return OutlinedInputBorder(
        borderRadius: BorderRadius.lerp(borderRadius, outline.borderRadius, t)!,
        borderSide: BorderSide.lerp(borderSide, outline.borderSide, t),
        innerBorderSide:
            BorderSide.lerp(innerBorderSide, outline.innerBorderSide, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(borderRadius
          .resolve(textDirection)
          .toRRect(rect)
          .deflate(borderSide.width));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  void paintInterior(Canvas canvas, Rect rect, Paint paint,
      {TextDirection? textDirection}) {
    canvas.drawRRect(borderRadius.resolve(textDirection).toRRect(rect), paint);
  }

  @override
  bool get preferPaintInterior => true;

  /// Draw a rounded rectangle around [rect] using [borderRadius].
  ///
  /// The [borderSide] defines the line's color and weight.
  /// The [innerBorderSide] defines the inner line's color and weight.
  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    final Paint paint = borderSide.toPaint();
    final RRect outer = borderRadius.toRRect(rect);
    final RRect center = outer.deflate(borderSide.width / 2.0);
    canvas.drawRRect(center, paint);

    final innerPaint = innerBorderSide.toPaint();
    canvas.drawRRect(center.deflate(borderSide.width / 2.0), innerPaint);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is OutlinedInputBorder &&
        other.borderSide == borderSide &&
        other.innerBorderSide == innerBorderSide &&
        other.borderRadius == borderRadius;
  }

  @override
  int get hashCode => Object.hash(borderSide, innerBorderSide, borderRadius);
}

abstract class MaterialStateOutlinedInputBorder extends OutlinedInputBorder
    implements MaterialStateProperty<InputBorder> {
  /// Abstract const constructor. This constructor enables subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const MaterialStateOutlinedInputBorder();

  /// Creates a [MaterialStateOutlinedInputBorder] from a [MaterialPropertyResolver<InputBorder>]
  /// callback function.
  ///
  /// If used as a regular input border, the border resolved in the default state (the
  /// empty set of states) will be used.
  ///
  /// The given callback parameter must return a non-null text style in the default
  /// state.
  static MaterialStateOutlinedInputBorder resolveWith(
          MaterialPropertyResolver<InputBorder> callback) =>
      _MaterialStateOutlinedInputBorder(callback);

  /// Returns a [InputBorder] that's to be used when a Material component is in the
  /// specified state.
  @override
  InputBorder resolve(Set<MaterialState> states);
}

/// A [MaterialStateOutlinedInputBorder] created from a [MaterialPropertyResolver<OutlinedInputBorder>]
/// callback alone.
///
/// If used as a regular input border, the border resolved in the default state will
/// be used.
///
/// Used by [MaterialStateTextStyle.resolveWith].
class _MaterialStateOutlinedInputBorder
    extends MaterialStateOutlinedInputBorder {
  const _MaterialStateOutlinedInputBorder(this._resolve);

  final MaterialPropertyResolver<InputBorder> _resolve;

  @override
  InputBorder resolve(Set<MaterialState> states) => _resolve(states);
}
