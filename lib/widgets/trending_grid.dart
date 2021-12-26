import 'package:flutter/material.dart';
import '../constant.dart';
import '../respository/respositories.dart';
import 'widgets.dart';

class TrendingGrid extends StatefulWidget {
  const TrendingGrid({Key? key}) : super(key: key);

  @override
  State<TrendingGrid> createState() => _TrendingGridState();
}

class _TrendingGridState extends State<TrendingGrid>
    with AutomaticKeepAliveClientMixin {
  late Future _futureTrendingRadio;
  late RadioRespository respository;

  @override
  void initState() {
    respository = RadioRespository();
    _futureTrendingRadio = respository.trendingRadioApi();
    super.initState();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _futureTrendingRadio = respository.trendingRadioApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: double.infinity,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
          future: _futureTrendingRadio,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var radioData = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.error != null) {
                return Center(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _futureTrendingRadio = respository.trendingRadioApi();
                    }),
                    child: Text(
                      'No station available, Click to refresh',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                );
              }
              // YOUR CUSTOM CODE GOES HERE
              return RefreshIndicator(
                onRefresh: _onRefresh,
                backgroundColor: kScaffoldBackgroundColor,
                color: kPrimaryColor,
                child: GridWidget(
                  radioData: radioData,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: kPrimaryColor,
                  color: kAccentColor,
                ),
              );
            }
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
