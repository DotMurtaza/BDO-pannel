import 'package:flutter/material.dart';

class BDOmyButton extends StatelessWidget {
  const BDOmyButton({
    Key key,
    @required this.label,
    @required this.onTap,
    @required this.color,
    this.loading = false,
    @required this.width,
  }) : super(key: key);
  final double width;
  final String label;
  final VoidCallback onTap;
  final bool loading;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading
          ? () {
              print('button is disabled');
            }
          : onTap,
      child: Container(
        height: 46,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                blurRadius: 25,
                offset: const Offset(0, 5),
                color: color.withOpacity(0.75),
              ),
            ]),
        child: Center(
          child: loading
              ? const CircularProgressIndicator()
              : Text(
                  label,
                  style: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.white,
                      ),
                ),
        ),
      ),
    );
  }
}
