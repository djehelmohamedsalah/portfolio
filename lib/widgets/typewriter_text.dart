import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
  final List<String> phrases;
  final String prefixText;
  final TextStyle style;
  final TextStyle? prefixStyle;
  final TextStyle? animatedStyle;
  final Color cursorColor;
  final double? fixedAnimatedWidth;
  final Duration typingSpeed;
  final Duration erasingSpeed;
  final Duration pauseAfterTyping;
  final Duration pauseAfterErasing;

  const TypewriterText({
    super.key,
    required this.phrases,
    this.prefixText = '',
    required this.style,
    this.prefixStyle,
    this.animatedStyle,
    required this.cursorColor,
    this.fixedAnimatedWidth,
    this.typingSpeed = const Duration(milliseconds: 70),
    this.erasingSpeed = const Duration(milliseconds: 90),
    this.pauseAfterTyping = const Duration(milliseconds: 900),
    this.pauseAfterErasing = const Duration(milliseconds: 400),
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  int _phraseIndex = 0;
  int _charIndex = 0;
  bool _isErasing = false;
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    _tick();
  }

  @override
  void didUpdateWidget(covariant TypewriterText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.phrases != widget.phrases) {
      _phraseIndex = 0;
      _charIndex = 0;
      _isErasing = false;
    }
  }

  @override
  void dispose() {
    _isActive = false;
    super.dispose();
  }

  Future<void> _tick() async {
    while (_isActive) {
      final current = widget.phrases[_phraseIndex];
      final isComplete = _charIndex >= current.length;

      if (!_isErasing && isComplete) {
        await Future.delayed(widget.pauseAfterTyping);
        _isErasing = true;
      } else if (_isErasing && _charIndex == 0) {
        await Future.delayed(widget.pauseAfterErasing);
        _isErasing = false;
        _phraseIndex = (_phraseIndex + 1) % widget.phrases.length;
      } else {
        setState(() {
          _charIndex += _isErasing ? -1 : 1;
        });
        await Future.delayed(
          _isErasing ? widget.erasingSpeed : widget.typingSpeed,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final current = widget.phrases[_phraseIndex];
    final text = current.substring(0, _charIndex);
    final prefixStyle = widget.prefixStyle ?? widget.style;
    final animatedStyle = widget.animatedStyle ?? widget.style;
    final animatedContent = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            text,
            style: animatedStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text('_', style: animatedStyle.copyWith(color: widget.cursorColor)),
      ],
    );

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (widget.prefixText.isNotEmpty)
          Text(widget.prefixText, style: prefixStyle),
        if (widget.fixedAnimatedWidth != null)
          Flexible(
            child: SizedBox(
              width: widget.fixedAnimatedWidth,
              child: Align(
                alignment: Alignment.centerLeft,
                child: animatedContent,
              ),
            ),
          )
        else
          Flexible(child: animatedContent),
      ],
    );
  }
}
