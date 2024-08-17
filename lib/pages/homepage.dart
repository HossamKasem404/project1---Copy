import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/providers/balanceprovider.dart';
import 'package:project1univ/service/drawerfuturebuilder.dart';
import 'package:project1univ/widgets/bottomnavigatorbar.dart';
import 'package:project1univ/widgets/tabbarviewhomepage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static String id = "HomePage";

  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<BalanceProvider>().fetchBalanceData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BalanceProvider>(
      builder: (context, balanceProvider, child) {
        if (balanceProvider.balanceData == null) {
        
          return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          
        }

        final balance = balanceProvider.balanceData?.isNotEmpty == true
            ? balanceProvider.balanceData![0].balancee
            : 0;

        return DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor:Color.fromARGB(255, 11, 173, 176),
              title: Center(child: const Text('Home')),
              bottom: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    icon: Icon(
                      FontAwesomeIcons.airbnb,
                      color: Colors.black.withOpacity(1),
                    ),
                    text: S.of(context).Trips,
                  ),
                  Tab(
                    icon: Icon(
                      Icons.food_bank,
                      color: Colors.black.withOpacity(1),
                    ),
                    text: S.of(context).Resturants,
                  ),
                  Tab(
                    icon: Icon(
                      FontAwesomeIcons.hotel,
                      color: Colors.black.withOpacity(1),
                    ),
                    text: S.of(context).Hotels,
                  ),
                  Tab(
                    icon: Icon(
                      FontAwesomeIcons.fly,
                      color: Colors.black.withOpacity(1),
                    ),
                    text:S.of(context).Airlines,
                  ),
                  Tab(
                    icon: Icon(
                      FontAwesomeIcons.mountain,
                      color: Colors.black.withOpacity(1),
                    ),
                    text:S.of(context).Countries,
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    ' ${balance}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            drawer: const DrawerFutureBuilder(),
            body: const TabBarViewHomePage(),
            bottomNavigationBar: const BottomnavigationBar(),
          ),
        );
      },
    );
  }
}
