import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/find_out/ui/widgets/common_widgets.dart';
import 'package:flutter_projects/projects/find_out/ui/widgets/inverted_top_border_clipper.dart';
import 'package:flutter_projects/projects/find_out/ui/widgets/text_input_find_out.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final resizeNotifier = ValueNotifier<bool>(false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!resizeNotifier.value) resizeNotifier.value = true;
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! > 3) {
            resizeNotifier.value = false;
            Navigator.pop(context);
          }
        },
        child: Stack(
          children: <Widget>[
            ValueListenableBuilder<bool>(
              valueListenable: resizeNotifier,
              builder: (_, value, child) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.fastOutSlowIn,
                  bottom: value ? 0 : -size.height * .5,
                  left: 0,
                  right: 0,
                  child: child!,
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
                        const Center(child: _DragDownIndication()),
                        Padding(
                          padding: const EdgeInsets.only(top: 55),
                          child: ClipPath(
                            clipper: InvertedTopBorderClipper(
                              circularRadius: 40,
                            ),
                            child: Container(
                              height: 440,
                              width: double.infinity,
                              color: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: const _FormInputsColumn(),
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

class _FormInputsColumn extends StatelessWidget {
  const _FormInputsColumn();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(height: 60),
        const TextInputFindOut(
          label: 'Nombre de usuario',
          iconData: FontAwesome.user,
          textInputType: TextInputType.text,
        ),
        const SizedBox(height: 20),
        const TextInputFindOut(
          label: 'Correo electronico',
          iconData: Icons.alternate_email,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        const TextInputFindOut(
          label: 'Constraseña',
          iconData: Icons.lock_outline,
          textInputType: TextInputType.visiblePassword,
        ),
        const SizedBox(height: 5),
        const _AcceptTerms(),
        const SizedBox(height: 10),
        SizedBox(
          width: size.width * .65,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.pinkAccent,
            ),
            child: const Text(
              'Crear cuenta',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _DragDownIndication extends StatelessWidget {
  const _DragDownIndication();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Registro',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Desliza para ir hacia atras',
          style: TextStyle(
            height: 2,
            fontSize: 12,
            color: Colors.white.withOpacity(.9),
          ),
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
  const _AcceptTerms();

  @override
  Widget build(BuildContext context) {
    final valueNotifier = ValueNotifier(false);
    return InkWell(
      onTap: () => valueNotifier.value = !valueNotifier.value,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ValueListenableBuilder<bool>(
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
            'Acepto',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const Text(
            ' terminos y condiciones',
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
