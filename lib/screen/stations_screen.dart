import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../constant.dart';

class StationsScreen extends StatefulWidget {
  const StationsScreen({Key? key}) : super(key: key);

  @override
  State<StationsScreen> createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  // List categoriesSelector = ['Trending', 'Dancing', 'Hip-Hop', 'Jazz', 'Rock'];
  var selectedPage = 0;
  // var isSelected = false;
  @override
  void initState() {
    _tabController = TabController(length: 7, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController!.addListener(() {
      setState(() {
        selectedPage = _tabController!.index;
      });
    });
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, /*right: 20,*/ top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a genre \nyou like or a radio station',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: kDefaultSpace),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: TabBar(
                  // onTap: (index) {
                  //   _tabController!.index == index;
                  // },
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: selectedPage == 0
                                  ? kAccentColor
                                  : kScaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: selectedPage == 0
                                      ? kAccentColor
                                      : kPrimaryColor,
                                  width: 1.0)),
                          child: Center(
                            child: Text(
                              'Trending',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: selectedPage == 0
                                        ? kScaffoldBackgroundColor
                                        : kPrimaryColor,
                                  ),
                            ),
                          )),
                    ),
                    Tab(
                      child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: selectedPage == 1
                                  ? kAccentColor
                                  : kScaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: selectedPage == 1
                                      ? kAccentColor
                                      : kPrimaryColor,
                                  width: 1.0)),
                          child: Center(
                            child: Text(
                              'Dancing',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: selectedPage == 1
                                        ? kScaffoldBackgroundColor
                                        : kPrimaryColor,
                                  ),
                            ),
                          )),
                    ),
                    Tab(
                      child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: selectedPage == 2
                                  ? kAccentColor
                                  : kScaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: selectedPage == 2
                                      ? kAccentColor
                                      : kPrimaryColor,
                                  width: 1.0)),
                          child: Center(
                            child: Text(
                              'Hip-Hop',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: selectedPage == 2
                                        ? kScaffoldBackgroundColor
                                        : kPrimaryColor,
                                  ),
                            ),
                          )),
                    ),
                    Tab(
                      child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: selectedPage == 3
                                  ? kAccentColor
                                  : kScaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: selectedPage == 3
                                      ? kAccentColor
                                      : kPrimaryColor,
                                  width: 1.0)),
                          child: Center(
                            child: Text(
                              'Rock',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: selectedPage == 3
                                        ? kScaffoldBackgroundColor
                                        : kPrimaryColor,
                                  ),
                            ),
                          )),
                    ),
                    Tab(
                      child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: selectedPage == 4
                                  ? kAccentColor
                                  : kScaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: selectedPage == 4
                                      ? kAccentColor
                                      : kPrimaryColor,
                                  width: 1.0)),
                          child: Center(
                            child: Text(
                              'Jazz',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: selectedPage == 4
                                        ? kScaffoldBackgroundColor
                                        : kPrimaryColor,
                                  ),
                            ),
                          )),
                    ),
                    Tab(
                      child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: selectedPage == 5
                                  ? kAccentColor
                                  : kScaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: selectedPage == 5
                                      ? kAccentColor
                                      : kPrimaryColor,
                                  width: 1.0)),
                          child: Center(
                            child: Text(
                              'Rap',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: selectedPage == 5
                                        ? kScaffoldBackgroundColor
                                        : kPrimaryColor,
                                  ),
                            ),
                          )),
                    ),
                    Tab(
                      child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: selectedPage == 6
                                  ? kAccentColor
                                  : kScaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: selectedPage == 6
                                      ? kAccentColor
                                      : kPrimaryColor,
                                  width: 1.0)),
                          child: Center(
                            child: Text(
                              'Sport',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: selectedPage == 6
                                        ? kScaffoldBackgroundColor
                                        : kPrimaryColor,
                                  ),
                            ),
                          )),
                    ),
                  ]),
            ),
            const SizedBox(height: kDefaultSpace),
            Text(
              'Trending Online Radio',
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: kDefaultSpace),
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(controller: _tabController, children: const [
                  TrendingGrid(),
                  DancingGrid(),
                  HipHopGrid(),
                  RockGrid(),
                  JazzGrid(),
                  RapGrid(),
                  SportGrid(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
