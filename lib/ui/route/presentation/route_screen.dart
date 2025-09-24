import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kettu/ui/route/presentation/widgets/plan_route.dart';
import 'package:kettu/ui/route/presentation/widgets/route_filters.dart';
import 'package:kettu/widgets/build_text_field.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({super.key});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kettu",style: TextStyle(color: Color(0xFF10B981)),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlanRoute(),
            RouteFilters()
          ],
        ),
      )
    );
  }
}
