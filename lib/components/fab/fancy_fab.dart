import 'package:flutter/material.dart';
import 'package:trabalho_final_dadm/pages/check_plastic_page.dart';
import 'package:trabalho_final_dadm/pages/collaborate_page.dart';
import 'package:trabalho_final_dadm/pages/collect_page.dart';
import 'package:trabalho_final_dadm/pages/send_photo.dart';
import 'package:trabalho_final_dadm/themes/app_colors.dart';

class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FancyFab({this.onPressed, this.tooltip, this.icon});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: AppColors.primary,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  // Widget sendPic() {
  //   return Container(
  //     child: FloatingActionButton(
  //       heroTag: "btn1",
  //       onPressed: () {
  //         animate();
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) {
  //             return SendPhotoPage();
  //           }),
  //         );
  //       },
  //       tooltip: 'Enviar uma foto',
  //       child: Icon(Icons.camera_alt),
  //       backgroundColor: AppColors.sendPictureColor,
  //     ),
  //   );
  // }

  Widget checkPlastic() {
    return Container(
      child: FloatingActionButton(
        heroTag: "btn1",
        onPressed: () {
          animate();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return CheckPlasticPage();
            }),
          );
        },
        tooltip: 'Checar o tipo do plástico',
        child: Icon(Icons.search),
        backgroundColor: AppColors.checkPlasticColor,
      ),
    );
  }

  Widget findPlaces() {
    return Container(
      child: FloatingActionButton(
        heroTag: "btn2",
        onPressed: () {
          animate();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return CollectPage();
            }),
          );
        },
        tooltip: 'Encontrar um posto de coleta',
        child: Icon(Icons.location_on_outlined),
        backgroundColor: AppColors.findCollectionPlacesColor,
      ),
    );
  }

  // Widget collaborate() {
  //   return Container(
  //     child: FloatingActionButton(
  //       heroTag: "btn4",
  //       onPressed: () {
  //         animate();
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) {
  //             return CollaboratePage();
  //           }),
  //         );
  //       },
  //       tooltip: 'Colaborar com o projeto',
  //       child: Icon(Icons.sentiment_very_satisfied),
  //       backgroundColor: AppColors.colaborateColor,
  //     ),
  //   );
  // }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        heroTag: "btn3",
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // Transform(
        //   transform: Matrix4.translationValues(
        //     0.0,
        //     _translateButton.value * 4.0,
        //     0.0,
        //   ),
        //   // child: sendPic(),
        // ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: checkPlastic(),
        ),
        // Transform(
        //   transform: Matrix4.translationValues(
        //     0.0,
        //     _translateButton.value * 2.0,
        //     0.0,
        //   ),
        //   //child: collaborate(),
        // ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: findPlaces(),
        ),
        toggle(),
      ],
    );
  }
}