import 'package:flutter/material.dart';

class ScrollColumnExpandable extends StatelessWidget {
  final List<Widget>? children;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  final TextDirection? textDirection;
  final TextBaseline? textBaseline;

  const ScrollColumnExpandable({
    super.key,
    this.children,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.textDirection,
    this.textBaseline,
  });

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[const SizedBox(width: double.infinity)];

    if (this.children != null) children.addAll(this.children!);
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight - 15),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment:
                    crossAxisAlignment ?? CrossAxisAlignment.center,
                mainAxisAlignment:
                    mainAxisAlignment ?? MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                textBaseline: textBaseline,
                textDirection: textDirection,
                children: children,
              ),
            ),
          ),
        );
      },
    );
  }
}
