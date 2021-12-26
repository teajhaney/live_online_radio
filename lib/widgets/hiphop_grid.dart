import 'package:flutter/material.dart';
import 'package:live_online_radio/respository/respositories.dart';

import '../constant.dart';
import 'widgets.dart';

class HipHopGrid extends StatefulWidget {
  const HipHopGrid({Key? key}) : super(key: key);

  @override
  State<HipHopGrid> createState() => _HipHopGridState();
}

class _HipHopGridState extends State<HipHopGrid>
    with AutomaticKeepAliveClientMixin {
  late Future _futureHipHopRadio;
  late RadioRespository respository;

  @override
  void initState() {
    respository = RadioRespository();
    _futureHipHopRadio = respository.hipHopRadioApi();
    super.initState();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _futureHipHopRadio = respository.trendingRadioApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: double.maxFinite,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
          future: _futureHipHopRadio,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var radioData = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.error != null) {
                return Center(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _futureHipHopRadio = respository.trendingRadioApi();
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
