import 'package:flutter/material.dart';

class ExerciseOne extends StatelessWidget {
  const ExerciseOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppButton(
          colors: [
            Colors.orange,
            Colors.purple,
          ],
          onTap: () {
            print('Salut je suis cliqué');
          },
        ),
      ),
    );
  }
}

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.colors,
    this.onTap,
  });

  final List<Color> colors;
  final VoidCallback? onTap;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: _selected ? 150 : 100,
        width: 200,
        decoration: BoxDecoration(
          color: _selected ? widget.colors.first : widget.colors.last,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_selected ? 20 : 0),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    setState(() {
      _selected = !_selected;
    });

    widget.onTap?.call();
  }
}
