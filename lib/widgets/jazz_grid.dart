import 'package:flutter/material.dart';
import '../constant.dart';
import 'package:live_online_radio/respository/respositories.dart';

import 'grid_widget.dart';

class JazzGrid extends StatefulWidget {
  const JazzGrid({Key? key}) : super(key: key);

  @override
  State<JazzGrid> createState() => _JazzGridState();
}

class _JazzGridState extends State<JazzGrid>
    with AutomaticKeepAliveClientMixin {
  late Future _futureJazzRadio;
  late RadioRespository respository;

  @override
  void initState() {
    respository = RadioRespository();
    _futureJazzRadio = respository.jazzRadioApi();
    super.initState();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _futureJazzRadio = respository.trendingRadioApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: double.maxFinite,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
          future: _futureJazzRadio,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var radioData = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.error != null) {
                return Center(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _futureJazzRadio = respository.trendingRadioApi();
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
