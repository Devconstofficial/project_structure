import 'package:flutter/material.dart';

enum GradientOrientation { vertical, horizontal }

class Button3d extends StatefulWidget {
  final Color startColor;
  final Color endColor;
  final Color borderColor;
  final Color progressColor;
  final double progressSize;
  final GradientOrientation gradientOrientation;
  final double borderThickness;
  final double height;
  final double borderRadius;
  final bool stretch;
  final double width;
  final bool progress;
  final bool disabled;
  final Function onTap;
  final Widget child;

  const Button3d({
    super.key,
    required this.onTap,
    required this.child,
    this.startColor = const Color(0xFF2ec8ff),
    this.endColor = const Color(0xFF529fff),
    this.borderColor = const Color(0xFF3489e9),
    this.progressColor = Colors.white,
    this.progressSize = 20,
    this.borderRadius = 20,
    this.borderThickness = 5,
    this.height = 60,
    this.width = 200,
    this.gradientOrientation = GradientOrientation.vertical,
    this.stretch = true,
    this.progress = false,
    this.disabled = false,
  });

  @override
  _Button3dState createState() => _Button3dState();
}

class _Button3dState extends State<Button3d> with TickerProviderStateMixin {
  late double _borderThickness;
  bool _showProgress = false;
  bool _tapped = false;
  bool _processing = false;

  @override
  void initState() {
    super.initState();
    _borderThickness = widget.borderThickness;
  }

  Widget _buildBackLayout() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.borderColor,
      ),
    );
  }

  Widget _buildFrontLayout() {
    return AnimatedContainer(
      onEnd: _resetState,
      //margin: EdgeInsets.only(top: _moveMargin),
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        gradient: LinearGradient(
          begin: widget.gradientOrientation == GradientOrientation.vertical
              ? Alignment.topCenter
              : Alignment.centerLeft,
          end: widget.gradientOrientation == GradientOrientation.vertical
              ? Alignment.bottomCenter
              : Alignment.centerRight,
          colors: [widget.startColor, widget.endColor],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: _buildUserChild(),
      ),
    );
  }



  Widget _buildUserChild() {
    return Center(child: widget.child);
  }

  void _resetState() {
    setState(() {
      if (widget.progress && !_showProgress && _tapped) {
        _showProgress = true;
        _processing = true;
      }
      _tapped = false;
    });
  }

  void _onTap() {
    setState(() {
      _tapped = true;
    });
    widget.onTap(_finish);
  }

  void _finish() {
    setState(() {
      _showProgress = false;
      _processing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.disabled || _processing ? null : _onTap,
      child: SizedBox(
        width: widget.stretch ? double.infinity : widget.width,
        height: widget.height,
        child: Stack(
          children: [
            _buildBackLayout(),
            _buildFrontLayout(),
          ],
        ),
      ),
    );
  }
}
