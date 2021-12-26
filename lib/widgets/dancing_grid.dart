import 'package:flutter/material.dart';
import 'package:live_online_radio/respository/respositories.dart';

import '../constant.dart';
import 'widgets.dart';

class DancingGrid extends StatefulWidget {
  const DancingGrid({Key? key}) : super(key: key);

  @override
  State<DancingGrid> createState() => _DancingGridState();
}

class _DancingGridState extends State<DancingGrid>
    with AutomaticKeepAliveClientMixin {
  late Future _futuredancingRadio;
  late RadioRespository respository;

  @override
  void initState() {
    respository = RadioRespository();
    _futuredancingRadio = respository.dancingRadioApi();
    super.initState();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _futuredancingRadio = respository.trendingRadioApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: double.maxFinite,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
          future: _futuredancingRadio,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var radioData = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.error != null) {
                return Center(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _futuredancingRadio = respository.trendingRadioApi();
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
