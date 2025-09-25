import 'package:animated_button/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart'
    show FlutterCarousel, FlutterCarouselOptions, CircularSlideIndicator;
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../add_card/presentation/add_card_screen.dart';




class BalaceScreen extends StatefulWidget {
  const BalaceScreen({super.key});

  @override
  State<StatefulWidget> createState() => BalaceScreenState();
}

class BalaceScreenState extends State<BalaceScreen> {
  bool isLightTheme = true;
  String cardNumber = '5555555555554444';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = true;
  bool useFloatingAnimation = false;
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.7), width: 2.0),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      isLightTheme ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
    );
    return Scaffold(
      appBar: AppBar(title: Text("Payment")),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(
              isLightTheme
                  ? 'assets/images/bg-light.png'
                  : 'assets/images/bg-dark.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: AlignmentGeometry.topLeft,
                  end: AlignmentGeometry.bottomRight,
                  colors: [Color(0xFF059669), Color(0xFF10b981)],
                ),
              ),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hisobdagi balans",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "\$ 1 305",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: "nothing",
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white54),
                    ),
                    icon: Icon(
                      CupertinoIcons.money_dollar,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            FlutterCarousel(
              options: FlutterCarouselOptions(
                height: 250.0,
                viewportFraction: 0.89,
                showIndicator: false,
                slideIndicator: CircularSlideIndicator(),
              ),
              items: [1, 2, 3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return CreditCardWidget(
                      height: 250,
                      enableFloatingCard: useFloatingAnimation,
                      glassmorphismConfig: _getGlassmorphismConfig(),
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      bankName: 'Anor Bank',
                      frontCardBorder: useGlassMorphism
                          ? null
                          : Border.all(color: Colors.grey),
                      backCardBorder: useGlassMorphism
                          ? null
                          : Border.all(color: Colors.grey),
                      showBackView: isCvvFocused,
                      obscureCardNumber: true,
                      obscureCardCvv: false,
                      isHolderNameVisible: true,
                      cardBgColor: isLightTheme
                          ? AppColors.cardBgLightColor
                          : AppColors.cardBgColor,
                      backgroundImage: useBackgroundImage
                          ? 'assets/images/card_bg$i.png'
                          : null,
                      isSwipeGestureEnabled: false,
                      onCreditCardWidgetChange:
                          (CreditCardBrand creditCardBrand) {},
                      customCardTypeIcons: [
                        CustomCardTypeIcon(
                          cardType: CardType.mastercard,
                          cardImage: Image.asset(
                            'assets/images/money.png',
                            height: 50,
                            width: 70,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Center(
              child: AnimatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddCardScreen()),
                  );
                },
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(.8),
                enabled: true,
                disabledColor: Colors.grey,
                shadowDegree: ShadowDegree.light,
                borderRadius: 12,
                duration: 85,
                height: 50,
                width: MediaQuery.of(context).size.width - 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.add, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Add Card',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Glassmorphism? _getGlassmorphismConfig() {
    if (!useGlassMorphism) {
      return null;
    }

    final LinearGradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[Colors.grey.withAlpha(50), Colors.grey.withAlpha(50)],
      stops: const <double>[0.3, 0],
    );

    return isLightTheme
        ? Glassmorphism(blurX: 8.0, blurY: 16.0, gradient: gradient)
        : Glassmorphism.defaultConfig();
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

class AppColors {
  AppColors._();

  static const Color cardBgColor = Color(0xff363636);
  static const Color cardBgLightColor = Color(0xff999999);
  static const Color colorB58D67 = Color(0xffB58D67);
  static const Color colorE5D1B2 = Color(0xffE5D1B2);
  static const Color colorF9EED2 = Color(0xffF9EED2);
  static const Color colorEFEFED = Color(0xffEFEFED);
}
