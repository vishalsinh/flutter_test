import 'package:flutter/material.dart';
import 'package:untitled/packages/simple_animations-4.2.0/lib/simple_animations.dart';

import '../../packages/simple_animations-4.2.0/lib/multi_tween/multi_tween.dart';

enum AniProps { opacity, translateY }

class SlideInToastMessageAnimation extends StatefulWidget {

  final Widget child;

  const SlideInToastMessageAnimation(this.child, {Key? key}) : super(key: key);

  @override
  State<SlideInToastMessageAnimation> createState() => _SlideInToastMessageAnimationState();
}

class _SlideInToastMessageAnimationState extends State<SlideInToastMessageAnimation> {

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniProps>()

      ..add(AniProps.translateY, Tween(begin: -100.0, end: 0.0), const Duration(milliseconds: 250), Curves.easeOut)

      ..add(AniProps.translateY, Tween(begin: 0.0, end: 0.0), const Duration(seconds: 2, milliseconds: 250))

      ..add(AniProps.translateY, Tween(begin: 0.0, end: -100.0), const Duration(milliseconds: 250), Curves.easeOut)

      ..add(AniProps.opacity, Tween(begin: 0.0, end: 1.0), (const Duration(milliseconds: 500)))

      ..add(AniProps.opacity,  Tween(begin: 1.0, end: 1.0), (const Duration(seconds: 2)))

      ..add(AniProps.opacity,  Tween(begin: 1.0, end: 0.0), (const Duration(milliseconds: 500)));

    return PlayAnimation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (500 * 1).round()),
      duration: tween.duration,
      tween: tween,
      child: widget.child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniProps.opacity),
        child: Transform.translate(offset: Offset(0, value.get(AniProps.translateY)), child: child),
      ),
    );

  }
}


class BottomSlideInToastMessageAnimation extends StatelessWidget {
  final Widget child;

  BottomSlideInToastMessageAnimation(this.child);

  @override
  Widget build(BuildContext context) {

    final tween = MultiTween<AniProps>()
      ..add(AniProps.translateY, Tween(begin: 100.0, end: 0.0), const Duration(milliseconds: 250),Curves.easeOut)

      ..add(AniProps.translateY, Tween(begin: 0.0, end: 0.0), const Duration(seconds: 2, milliseconds: 250))

      ..add(AniProps.translateY, Tween(begin: 0.0, end: 100.0), const Duration(milliseconds: 250), Curves.easeIn)

      ..add(AniProps.opacity, Tween(begin: 0.0, end: 1.0), (const Duration(milliseconds: 500)))

      ..add(AniProps.opacity,  Tween(begin: 1.0, end: 1.0), (const Duration(seconds: 2)))

      ..add(AniProps.opacity,  Tween(begin: 1.0, end: 0.0), (const Duration(milliseconds: 500)));



    return PlayAnimation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (500 * 1).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniProps.opacity),
        child: Transform.translate(
            offset: Offset(0, value.get(AniProps.translateY)),
            child: child),
      ),
    );
  }
}