import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kettu/data/theme/my_theme.dart';
import 'package:kettu/ui/home/presentation/widgets/famous_places.dart';
import 'package:kettu/ui/home/presentation/widgets/ticket_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //avatar & pay
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            //avatar
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(image: AssetImage("assets/images/avatar.png",),fit: BoxFit.cover)
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("\$0.00",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
                                InkWell(
                                  onTap: () {
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(Iconsax.card_add_outline,color: Theme.of(context).colorScheme.onPrimary,),
                                      SizedBox(width: 6,),
                                      Text("To'ldirish",style: MyTheme.bodySmallGR,)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text("Welcome to",style: MyTheme.bodyLarge,),
                        Text("Kettu",style: MyTheme.bodyLargeGR,),
                      ],
                    ),
                    Image.asset("assets/images/auto.png",height: 110,)
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        blurRadius: 3,
                        spreadRadius: 1
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadiusGeometry.circular(25)
                  ),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          cursorColor: Colors.black,
                          style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Iconsax.search_normal_outline,size: 20,),
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 13),
                              hintText: "Enter the destination"
                          ),
                        ),
                      ),
                      Container(
                        width: 70,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(17),
                        ),
                        child: Image.asset("assets/images/map.png",fit: BoxFit.cover,),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text("Your ticket",style: MyTheme.bodyMedium,),
                SizedBox(height: 20,),
                TicketCard(),
                FamousPlaces()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
