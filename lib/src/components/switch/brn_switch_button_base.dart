import 'package:flutter/material.dart';

const double _borderWidth = 1.5;

class BrnBaseSwitchButton extends StatefulWidget {
  final Size size;

  /// Whether this switch is on or off.
  ///
  /// This property must not be null.
  final bool value;

  /// can click
  final bool enabled;

  /// Called when the user toggles the switch on or off.
  final ValueChanged<bool>? onChanged;

  /// The color to use when this switch is off.
  final Color borderColor;

  /// The color to use on the track.
  final Color? trackColor;

  /// The color to use on the thumb.
  final Color thumbColor;

  /// Animation duration for the switch toggle
  final Duration animationDuration;

  const BrnBaseSwitchButton({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.size,
    this.thumbColor = Colors.white,
    this.trackColor,
    this.borderColor = const Color(0xffeeeeee),
    this.enabled = false,
    this.animationDuration = const Duration(milliseconds: 200),
  }) : super(key: key);

  @override
  _BrnBaseSwitchButtonState createState() => _BrnBaseSwitchButtonState();
}

class _BrnBaseSwitchButtonState extends State<BrnBaseSwitchButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _thumbPositionAnimation;
  late Animation<double> _thumbScaleAnimation;
  late Animation<Color?> _trackColorAnimation;
  late Animation<Color?> _borderColorAnimation;

  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    // 拇指位置动画：从0（左）到1（右）
    _thumbPositionAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // 拇指缩放动画：增加按压感
    _thumbScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 0.3, curve: Curves.easeOut),
    ));

    // 初始化动画状态
    if (widget.value) {
      _animationController.value = 1.0;
    } else {
      _animationController.value = 0.0;
    }

    _updateColorAnimations();
  }

  @override
  void didUpdateWidget(BrnBaseSwitchButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }

    if (oldWidget.trackColor != widget.trackColor ||
        oldWidget.borderColor != widget.borderColor) {
      _updateColorAnimations();
    }
  }

  void _updateColorAnimations() {
    // 轨道颜色动画
    _trackColorAnimation = ColorTween(
      begin: Colors.transparent, // 关闭状态时透明
      end: widget.trackColor, // 开启状态时使用指定颜色
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // 边框颜色动画
    _borderColorAnimation = ColorTween(
      begin: widget.borderColor, // 关闭状态时显示边框
      end: Colors.transparent, // 开启状态时边框透明
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.enabled
          ? (_) {
              setState(() {
                _isPressed = true;
              });
            }
          : null,
      onTapUp: widget.enabled
          ? (_) {
              setState(() {
                _isPressed = false;
              });
            }
          : null,
      onTapCancel: widget.enabled
          ? () {
              setState(() {
                _isPressed = false;
              });
            }
          : null,
      onTap: () {
        if (widget.enabled) {
          widget.onChanged?.call(!widget.value);
        }
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          final double thumbSize = widget.size.height - 4 * _borderWidth;
          final double trackPadding = 2 * _borderWidth;
          final double maxThumbOffset =
              widget.size.width - thumbSize - 2 * trackPadding;

          return Stack(
            children: [
              // 轨道背景
              Container(
                height: widget.size.height,
                width: widget.size.width,
                decoration: BoxDecoration(
                  color: _trackColorAnimation.value ?? widget.trackColor,
                  border: Border.all(
                    color: _borderColorAnimation.value ?? widget.borderColor,
                    width: _borderWidth,
                  ),
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.size.height / 2)),
                ),
              ),
              // 拇指
              Positioned(
                left: trackPadding +
                    (_thumbPositionAnimation.value * maxThumbOffset),
                top: trackPadding,
                child: Transform.scale(
                  scale: _thumbScaleAnimation.value * (_isPressed ? 1.1 : 1.0),
                  child: _buildThumb(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildThumb() {
    final double thumbSize = widget.size.height - 4 * _borderWidth;
    return Container(
      height: thumbSize,
      width: thumbSize,
      decoration: BoxDecoration(
        color: widget.thumbColor,
        borderRadius: BorderRadius.all(
          Radius.circular(thumbSize / 2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
