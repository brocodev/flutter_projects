import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_projects/find_out/ui/clippers/inverted_top_border.dart';
import 'package:flutter_projects/find_out/ui/widgets/common_widgets.dart';
import 'package:flutter_projects/find_out/ui/widgets/text_input_find_out.dart';

class RegisterPage extends StatelessWidget {
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
                        Center(child: _DragDownIndication()),
                        Padding(
                          padding: const EdgeInsets.only(top: 55),
                          child: ClipPath(
                            clipper: InvertedTopBorder(circularRadius: 40),
                            child: Container(
                              height: 440,
                              width: double.infinity,
                              color: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const SizedBox(height: 60),
                                  TextInputFindOut(
                                    label: 'Nombre de usuario',
                                    iconData: FontAwesome.user,
                                    textInputType: TextInputType.text,
                                  ),
                                  const SizedBox(height: 20),
                                  TextInputFindOut(
                                    label: 'Correo electronico',
                                    iconData: Icons.alternate_email,
                                    textInputType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(height: 20),
                                  TextInputFindOut(
                                    label: 'Constraseña',
                                    iconData: Icons.lock_outline,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                  ),
                                  const SizedBox(height: 5),
                                  _AcceptTerms(),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: size.width * .65,
                                    child: FlatButton(
                                      onPressed: () {},
                                      padding: const EdgeInsets.all(12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Colors.pinkAccent,
                                      child: Text(
                                        "Crear cuenta",
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
          'Registro',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Desliza para ir hacia atras',
          style: TextStyle(
              height: 2, fontSize: 12, color: Colors.white.withOpacity(.9)),
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

class _AcceptTerms extends StatelessWidget {
  const _AcceptTerms({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final valueNotifier = ValueNotifier(false);
    return InkWell(
      onTap: () => valueNotifier.value = !valueNotifier.value,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (context, value, child) {
              return Checkbox(
                value: value,
                onChanged: (val) {},
                checkColor: Colors.white,
                activeColor: Colors.pinkAccent,
              );
            },
          ),
          Text(
            "Acepto",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          Text(
            " terminos y condiciones",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.pinkAccent,
            ),
          ),
        ],
      ),
    );
  }
}
