import 'package:flutter/material.dart';
import 'package:flutter_projects/projects/boats_app/models/boat.dart';
import 'package:flutter_projects/projects/boats_app/ui/screens/boat_specs_screen.dart';
import 'package:flutter_projects/projects/boats_app/ui/widgets/boat_card.dart';

class BoatListPage extends StatefulWidget {
  const BoatListPage({Key? key}) : super(key: key);

  @override
  BoatListPageState createState() => BoatListPageState();
}

class BoatListPageState extends State<BoatListPage> {
  late PageController _pageController;
  late ValueNotifier<double> _pageNotifier;
  late ValueNotifier<bool> _hideAppBarNotifier;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: .7);
    _pageController.addListener(_pageListener);
    _pageNotifier = ValueNotifier(0.0);
    _hideAppBarNotifier = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    _pageNotifier.value = _pageController.page!;
  }

  //------------------------------------
  // Open Specs Boat Page
  //------------------------------------
  void _openSpecsPage(BuildContext context, Boat boat) async {
    _hideAppBarNotifier.value = true;
    await Navigator.push(
        context,
        PageRouteBuilder(
          reverseTransitionDuration: const Duration(milliseconds: 600),
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: BoatSpecsScreen(boat: boat),
            );
          },
        ));
    _hideAppBarNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //-----------------------------------
          // Custom App Bar
          //-----------------------------------
          SafeArea(
            child: ValueListenableBuilder<bool>(
                valueListenable: _hideAppBarNotifier,
                builder: (context, value, _) {
                  return _AnimatedCustomAppBar(animate: value);
                }),
          ),
          const SizedBox(height: 20),
          //------------------------------------
          // Boat Page View
          //------------------------------------
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: Boat.listBoats.length,
                itemBuilder: (context, index) {
                  final boat = Boat.listBoats[index];
                  return ValueListenableBuilder<double>(
                      valueListenable: _pageNotifier,
                      builder: (context, value, _) {
                        final factorChange = (value - index).abs();
                        return BoatCard(
                          boat: boat,
                          onTapSpec: () => _openSpecsPage(context, boat),
                          factorChange: factorChange,
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}

class _AnimatedCustomAppBar extends StatelessWidget {
  const _AnimatedCustomAppBar({
    Key? key,
    required this.animate,
  }) : super(key: key);

  final bool animate;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 600),
      transform: Matrix4.translationValues(0, animate ? -100 : 0, 0),
      child: AnimatedOpacity(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 600),
        opacity: animate ? 0 : 1,
        child: SizedBox(
          height: kToolbarHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Boats',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                  color: Colors.grey[800],
                  iconSize: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
