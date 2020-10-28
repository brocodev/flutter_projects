import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/find_out/ui/clippers/inverted_top_border.dart';
import 'package:flutter_projects/find_out/ui/home_page.dart';
import 'package:flutter_projects/find_out/ui/widgets/common_widgets.dart';
import 'package:flutter_projects/find_out/ui/widgets/text_input_find_out.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final resizeNotifier = ValueNotifier(false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!resizeNotifier.value) resizeNotifier.value = true;
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta > 10) {
            resizeNotifier.value = false;
            Navigator.pop(context);
          }
        },
        child: Stack(
          children: <Widget>[
            ValueListenableBuilder(
              valueListenable: resizeNotifier,
              builder: (context, value, child) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.fastOutSlowIn,
                  bottom: value ? 0 : -size.height * .5,
                  left: 0,
                  right: 0,
                  child: child,
                );
              },
              child: SizedBox(
                height: size.height,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: size.height * .1),
                    Center(
                      child: FindOutLogo(
                        fontSize: size.height * .065,
                      ),
                    ),
                    const Spacer(),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: _DragDownIndication(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 55),
                          child: ClipPath(
                            clipper: InvertedTopBorder(circularRadius: 40),
                            child: Container(
                              height: 340,
                              width: double.infinity,
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const SizedBox(height: 60),
                                  TextInputFindOut(
                                    label: 'Nombre de usuario',
                                    iconData: FontAwesome.user,
                                    textInputType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(height: 20),
                                  TextInputFindOut(
                                    label: 'Constraseña',
                                    iconData: Icons.lock_outline,
                                    textInputType: TextInputType.visiblePassword,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "¿Olvidaste tu contraseña?",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: size.width * .65,
                                    child: FlatButton(
                                      onPressed: () {
                                        resizeNotifier.value = false;
                                        return _openHomePage(context);
                                      },
                                      padding: const EdgeInsets.all(12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Colors.pinkAccent,
                                      child: Text(
                                        "Iniciar sesión",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _openHomePage(BuildContext context) {
    final newRoute = PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: HomePageFindOut(),
        );
      },
    );
    Navigator.pushAndRemoveUntil(context, newRoute, ModalRoute.withName(''));
  }
}

class _DragDownIndication extends StatelessWidget {
  const _DragDownIndication({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Inicia sesión',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Desliza para ir hacia atras',
          style: TextStyle(
              height: 2, fontSize: 14, color: Colors.white.withOpacity(.9)),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white.withOpacity(.8),
          size: 35,
        ),
      ],
    );
  }
}
