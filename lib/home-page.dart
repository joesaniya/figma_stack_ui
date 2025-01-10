import 'package:figma_ui/card_widgets.dart';
import 'package:figma_ui/upcoming_events_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.purple.shade400,
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    'Invest',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Expanded(child: SizedBox())
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Live Deals',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 22),
                  ),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            //upcoming Evens

            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming Events',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 22),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                        color: Colors.purple.shade400,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            UpcomingEventsCard(),
            SizedBox(
              height: 10,
            ),
            Expanded(child: CardWidgets())
          ],
        ),
      ),
    );
  }
}
