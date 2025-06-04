import 'package:cardiweb/layouts/red_circle.dart';
import 'package:flutter/material.dart';

class LayoutsScreen extends StatelessWidget {
  const LayoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final smallWidth = size.width < 600;

    return SafeArea(
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              color: smallWidth ? Colors.green : Colors.blue,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.pink,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.blue,
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(40, (index) {
                          return RedCircle(index: index);
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 40,
            color: Colors.blue,
            child: Row(
              children: [
                RedCircle(index: 0,),
                RedCircle(index: 1,),
                Spacer(),
                RedCircle(index: 2,),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  color: Colors.orange,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: MyResponsiveButton(),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: .3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyResponsiveButton extends StatelessWidget {
  const MyResponsiveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final icon = Icon(Icons.add);
        final text = Text('Salut');
        final small = maxWidth < 200;

        if (small) {
          return SizedBox(
            width: double.infinity,
            child: icon,
          );
        }

        return Row(
          spacing: 10,
          children: [
            icon,
            text,
          ],
        );
      },
    );
  }
}
