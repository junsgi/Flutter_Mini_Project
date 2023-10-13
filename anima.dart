import 'package:flutter/material.dart';

class FadeOutAnimation extends StatefulWidget {
  @override
  _FadeOutAnimationState createState() => _FadeOutAnimationState();
}

class _FadeOutAnimationState extends State<FadeOutAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // 애니메이션 지속 시간 설정
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_animationController); // 투명도 애니메이션 설정

    // 애니메이션 완료 후 상태 업데이트
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          // 애니메이션이 완료되면 상태를 업데이트하여 위젯을 제거하거나 다른 작업을 수행할 수 있습니다.
        });
      }
    });

    // 애니메이션 시작
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacityAnimation.value, // 애니메이션의 현재 투명도 값을 사용하여 위젯을 렌더링합니다.
      duration: Duration.zero, // AnimatedOpacity의 duration은 0으로 설정하여 부드러운 애니메이션을 만듭니다.
      child: YourWidget(), // 천천히 사라질 위젯을 여기에 추가하세요.
    );
  }
}

// 천천히 사라질 위젯을 나타내는 예시 위젯입니다.
class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue,
      child: Center(
        child: Text(
          'Your Widget',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}