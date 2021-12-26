import 'package:flutter/material.dart';
import '../constant.dart';
import 'package:live_online_radio/respository/respositories.dart';

import 'grid_widget.dart';

class SportGrid extends StatefulWidget {
  const SportGrid({Key? key}) : super(key: key);

  @override
  State<SportGrid> createState() => _SportGrid();
}

class _SportGrid extends State<SportGrid> with AutomaticKeepAliveClientMixin {
  late Future _futureSportRadio;
  late RadioRespository respository;

  @override
  void initState() {
    respository = RadioRespository();
    _futureSportRadio = respository.sportRadioApi();
    super.initState();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _futureSportRadio = respository.trendingRadioApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: double.maxFinite,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
          future: _futureSportRadio,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var radioData = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.error != null) {
                return Center(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _futureSportRadio = respository.trendingRadioApi();
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
