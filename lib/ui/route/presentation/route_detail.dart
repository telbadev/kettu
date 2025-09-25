import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class RouteDetail extends StatelessWidget {
  const RouteDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Route"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: .8,color: Colors.black45),
                gradient: LinearGradient(
                  begin: AlignmentGeometry.topLeft,
                  end: AlignmentGeometry.bottomRight,
                    colors: [
                    activeDayColor.withOpacity(.2),
                    activeDayColor.withOpacity(.4),
                  ]
                )
              ),
              padding: EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 4,color: Color(0xFF475569))
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("Your location",style: TextStyle(color: Color(0xFF475569),fontWeight: FontWeight.normal),),
                        ],
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                            begin: AlignmentGeometry.topCenter,
                            end: AlignmentGeometry.bottomCenter,
                            colors: [
                              Color(0xFF475569),
                              Colors.blueAccent
                            ]
                          )
                        ),
                        width: 4,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 4,color: Colors.blueAccent)
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("Toshkent, Sergeli",style: TextStyle(color: CupertinoColors.black,fontWeight: FontWeight.normal),),
                        ],
                      )
                    ],
                  ),

                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    _buildItem(
                      icon: Icons.local_taxi,
                      title: "Taxi",
                      subtitle: "To-capital city",
                      price: "\$50",
                      time: "",
                    ),
                    _buildDivider(),
                    _buildItem(
                      icon: Icons.flight,
                      title: "Flight",
                      bgColor: Colors.blueAccent.withOpacity(.7),
                      subtitle: "11:20  •  Lufthansa",
                      price: "\$220",
                      time: "1 hr 45 min",
                      iconColor: Colors.white,
                    ),
                    _buildDivider(),
                    _buildItem(
                      icon: Icons.train,
                      bgColor: Theme.of(context).colorScheme.onPrimary.withOpacity(.6),
                      title: "Train",
                      subtitle: "To Numberg",
                      price: "\$35",
                      time: "1 hr 28 min",
                      iconColor: Colors.white,
                    ),
                    _buildDivider(),
                    _buildItem(
                      icon: Icons.local_taxi,
                      title: "Taxi",
                      subtitle: "Final stop",
                      price: "\$18",
                      time: "",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildTotalRow("Total time", "3 hr 30 min"),
                    const SizedBox(height: 8),
                    _buildTotalRow("Total price", "\$323"),
                    const SizedBox(height: 16),
                    MaterialButton(
                      minWidth: double.infinity,
                      color: Theme.of(context).colorScheme.onPrimary.withOpacity(.8),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text("Book Now",style: TextStyle(color: Colors.white),),
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

  Widget _buildItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String price,
    String? time,
    Color iconColor = Colors.black,
    Color bgColor = Colors.grey,
  }) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor==Colors.grey? Colors.grey[200]:bgColor, // ichki fon rangi
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(subtitle,style: TextStyle(color: Colors.grey[600], fontSize: 14,fontWeight: FontWeight.normal)),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(price,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16)),
            if (time != null && time.isNotEmpty)
              Text(time,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13,fontWeight: FontWeight.normal)),
          ],
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Divider(color: Colors.grey[300], height: 1),
    );
  }

  Widget _buildTotalRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(color: Colors.grey[700], fontSize: 15)),
        Text(value,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}
