import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Values(),
      builder: (context, child) => const MainApp(),
    ),
  );
}

class Values extends ChangeNotifier {
  int projectnum = 1;
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Widget> tur = [
    Image.asset("lib/assets/yellow.png"),
    Padding(padding: EdgeInsetsGeometry.all(8), child: LinePainter()),
    Image.asset("lib/assets/green.png"),
    Padding(padding: EdgeInsetsGeometry.all(8), child: LinePainter()),
    VisibilityDetector(
      key: Key('tur'),
      onVisibilityChanged: (VisibilityInfo info) {},
      child: Image.asset("lib/assets/tur1.png"),
    ),
    Padding(padding: EdgeInsetsGeometry.all(8), child: LinePainter()),
    Image.asset("lib/assets/tur2.png"),
    Padding(padding: EdgeInsetsGeometry.all(8), child: LinePainter()),
    Image.asset("lib/assets/tur3.png"),
    Padding(padding: EdgeInsetsGeometry.all(8), child: LinePainter()),
  ];

  @override
  Widget build(BuildContext context) {
    // int projectnum = context.watch<Values>().projectnum;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsetsGeometry.all(1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsetsGeometry.all(5),
                  child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      strokeWidth: 3,
                      color: Colors.white,
                      dashPattern: [25, 10],
                      radius: Radius.circular(15),
                    ),
                    child: Container(
                      constraints: BoxConstraints.expand(),
                      child: Center(child: Me()),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 3)),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: ScrollbarTheme(
                    data: ScrollbarThemeData(
                      thumbColor: WidgetStateProperty.all(Colors.deepOrange),
                      thickness: WidgetStateProperty.all(5),
                    ),
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: ListView(
                        primary: true,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: DottedBorder(
                              options: RoundedRectDottedBorderOptions(
                                strokeWidth: 1.2,
                                color: Colors.white,
                                dashPattern: [25, 10],
                                radius: Radius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Image.asset("lib/assets/tur1.png"),
                                    VisibilityDetector(
                                      key: Key('turline1'),
                                      onVisibilityChanged: (info) => setState(
                                        () {
                                          context.read<Values>().projectnum = 1;
                                        },
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsGeometry.all(8),
                                        child: LinePainter(),
                                      ),
                                    ),
                                    Image.asset("lib/assets/tur2.png"),
                                    VisibilityDetector(
                                      key: Key('turline2'),
                                      onVisibilityChanged: (info) => setState(
                                        () {
                                          context.read<Values>().projectnum = 1;
                                        },
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsGeometry.all(8),
                                        child: LinePainter(),
                                      ),
                                    ),
                                    Image.asset("lib/assets/tur3.png"),
                                    VisibilityDetector(
                                      key: Key('qarinline1'),
                                      onVisibilityChanged: (info) => setState(
                                        () {
                                          context.read<Values>().projectnum = 2;
                                        },
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsGeometry.all(8),
                                        child: LinePainter(),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsetsGeometry.all(8),
                                    //   child: LinePainter(),
                                    // ),
                                    Image.asset("lib/assets/green.png"),
                                    VisibilityDetector(
                                      key: Key('qarinline2'),
                                      onVisibilityChanged: (info) => setState(
                                        () {
                                          context.read<Values>().projectnum = 2;
                                        },
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsGeometry.all(8),
                                        child: LinePainter(),
                                      ),
                                    ),
                                    Image.asset("lib/assets/yellow.png"),
                                    Padding(
                                      padding: EdgeInsetsGeometry.all(8),
                                      child: LinePainter(),
                                    ),
                                    VisibilityDetector(
                                      key: Key('film'),
                                      onVisibilityChanged: (info) => setState(
                                        () {
                                          context.read<Values>().projectnum = 3;
                                        },
                                      ),
                                      child: Image.asset("lib/assets/film.png"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class DottedContainer extends StatefulWidget {
//   final Widget child;
//   const DottedContainer({super.key, required this.child});

//   @override
//   State<DottedContainer> createState() => _DottedContainerState();
// }

// class _DottedContainerState extends State<DottedContainer> {
//   Color c = Colors.white;

//   @override
//   Widget build(BuildContext context) {
//     var v = RoundedRectDottedBorderOptions(
//       dashPattern: [25, 10],
//       color: c,
//       radius: Radius.circular(10),
//     );

//     return MouseRegion(
//       onEnter: (event) => setState(() => c = Colors.orange),
//       onExit: (event) => setState(() => c = Colors.white),
//       child: DottedBorder(options: v, child: widget.child),
//     );
//   }
// }

class LinePainter extends StatefulWidget {
  const LinePainter({super.key});

  @override
  State<LinePainter> createState() => _LinePainterState();
}

class _LinePainterState extends State<LinePainter> {
  Color c = Colors.white;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        c = Colors.orange;
      }),
      onExit: (event) => setState(() {
        c = Colors.white;
      }),
      child: SizedBox(
        child: CustomPaint(
          painter: DottedLinePainter(c),
          size: Size(double.infinity, 2),
        ),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Color c;
  DottedLinePainter(this.c);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = c
      ..strokeWidth = 1;

    double dashWidth = 10, dashSpace = 10, startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant DottedLinePainter oldDelegate) =>
      oldDelegate.c != c;
}

class Me extends StatelessWidget {
  const Me({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion2(text: 'DIGNA', icon: false),
        MouseRegion2(
          text: "\nProjects",
          icon: true,
          uri: 'https://github.com/DIG-NA',
        ),
        Text(
          "FiLM",
          style: TextStyle(
            fontSize: 20,
            color: context.watch<Values>().projectnum == 3
                ? Colors.orange
                : Colors.white,
          ),
        ),
        Text(
          "Qarin",
          style: TextStyle(
            fontSize: 20,
            color: context.watch<Values>().projectnum == 2
                ? Colors.orange
                : Colors.white,
          ),
        ),
        Text(
          "TurJuMan",
          style: TextStyle(
            fontSize: 20,
            color: context.watch<Values>().projectnum == 1
                ? Colors.orange
                : Colors.white,
          ),
        ),
        // MouseRegion2(text: "FiLM"),
        // MouseRegion2(text: "Qarin"),
        // MouseRegion2(text: "TurJuMan"),
        MouseRegion2(text: "\nContact"),
        MouseRegion2(
          text: "@DIG_NA_",
          icon: true,
          uri: 'https://x.com/DIG_NA_',
        ),
        MouseRegion2(
          text: "xoyenterprise@gmail.com",
          uri: '',
          icon: true,
          iconData: Icons.copy,
        ),
      ],
    );
  }
}

class MouseRegion2 extends StatefulWidget {
  final String text;
  final bool icon;
  final String uri;
  final IconData iconData;

  const MouseRegion2({
    super.key,
    required this.text,
    this.icon = false,
    this.uri = '',
    this.iconData = Icons.launch_outlined,
  });

  @override
  State<MouseRegion2> createState() => _MouseRegion2State();
}

class _MouseRegion2State extends State<MouseRegion2> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        isHovering = !isHovering;
      }),
      onExit: (event) => setState(() {
        isHovering = !isHovering;
      }),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        verticalDirection: VerticalDirection.down,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              color: isHovering ? Colors.orange : Colors.white,
              fontSize: 20,
            ),
          ),
          widget.icon
              ? GestureDetector(
                  onTap: () => widget.iconData == Icons.launch_outlined
                      ? launchUrl(Uri.parse(widget.uri))
                      : Clipboard.setData(ClipboardData(text: widget.text)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Icon(
                        widget.iconData,
                        color: Colors.grey,
                        size: 13,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
