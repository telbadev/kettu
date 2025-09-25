import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kettu/ui/route/presentation/route_detail.dart';
import 'package:provider/provider.dart';
import 'package:kettu/ui/route/provider/route_view_model.dart';

class AlternativeRoutes extends StatelessWidget {
  const AlternativeRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Alternative Routes",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10,),
          _myCart(
            icons: [Icons.train],
            price: 120,
            time: "3h 30m",
              context: context,
            index: 0
          ),
          SizedBox(height: 20,),
          _myCart(
              icons: [Icons.flight],
              price: 229,
              time: "5h 30m",
              context: context,
            index: 1
          ),
          SizedBox(height: 20,),
          _myCart(
              icons: [Icons.directions_bus, Icons.flight],
              price: 567,
              time: "8h 10m",
            context: context,
            index: 2
          ),


        ],
      ),
    );
  }


  Widget _myCart({required List<IconData?> icons, required String time, required int price,required BuildContext context, required int index}) {
    return Consumer<RouteViewModel>(
      builder: (context, value, child) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.read<RouteViewModel>().selectRoute(index);
              Navigator.push(context, MaterialPageRoute(builder: (context) => RouteDetail(),));
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: context.read<RouteViewModel>().routeItemIndex==index?
                  Border.all(width: 2,color: Theme.of(context).colorScheme.onPrimary):
                  Border.all(width: 2,color: Colors.grey.shade300)
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      ...List.generate(icons.length, (index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(icons[index],size: 18,),
                            if(index < icons.length-1) Icon(Icons.arrow_right_alt_outlined,color: Colors.grey,),
                          ],
                        );

                      },),
                      Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        clipBehavior: Clip.hardEdge,
                        child: ColoredBox(
                          color: Colors.grey.shade200,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text("229\$",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Icon(Iconsax.clock_outline,size: 18,color: Colors.grey,),
                      SizedBox(width: 10,),
                      Text(time,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 13),),
                      Spacer(),
                      Text(icons.length>1?"${icons.length} steps": "1 step",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 13),),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
