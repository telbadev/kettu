
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../data/theme/my_theme.dart';


class FamousPlaces extends StatelessWidget {
  const FamousPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: FlutterCarouselOptions(
        height: 300.0,
        enableInfiniteScroll: true,
        showIndicator: false,
        slideIndicator: CircularSlideIndicator(),
        autoPlay: true,
        viewportFraction: .8
      ),
      items: [1,2,3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  elevation: 1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(10),
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.asset("assets/images/almaty.jpg",fit: BoxFit.cover,width: double.infinity,)
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Container(
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Iconsax.star_outline,color: Colors.white,size: 20,),
                                      Text("4.5",style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text("Almata",style: MyTheme.bodyMedium,),

                              Text("890 \$",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold,fontFamily: "nothing",fontSize: 16),),
                              Spacer(),
                              MaterialButton(
                                onPressed: () {},
                                elevation: 0,
                                color: Theme.of(context).colorScheme.onPrimary,
                                height: 35,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(CupertinoIcons.location,color: Colors.white,size: 22,),
                                    SizedBox(width: 7,),
                                    Text("View Route",style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
