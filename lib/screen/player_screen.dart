import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:live_online_radio/Models/models.dart';
import 'package:live_online_radio/constant.dart';

import 'package:live_online_radio/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({
    Key? key,
    required this.radioData,
    required this.currentIndex,
    required this.radioPlayer,
  }) : super(key: key);

  final List<RadioModel> radioData;
  final int currentIndex;
  final AudioPlayer radioPlayer;

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late PageController _pageController;
  late int currentPage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentIndex);
    currentPage = widget.currentIndex;
  }

  double value = 50;
  IconData btnIcon = Icons.pause;
  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    Duration? duration = const Duration();
    Duration position = const Duration();
    Duration minPosition = const Duration();

    widget.radioPlayer.bufferedPositionStream.listen((event) {
      minPosition = event;
    });

    widget.radioPlayer.positionStream.listen((event) {
      position = event;
    });
    widget.radioPlayer.durationStream.listen((event) {
      duration = event;
    });
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 30,
          ),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 25,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: kPrimaryColor,
                  )),
              const SizedBox(
                width: 105,
              ),
              Text(
                'Playing',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 500,
          width: double.infinity,
          child: FractionallySizedBox(
            heightFactor: 0.90,
            // width: double.infinity,
            child: PageView.builder(
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });

                widget.radioPlayer.setUrl(widget.radioData[currentPage].url);
              },
              itemCount: widget.radioData.length,
              reverse: false,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemBuilder: (context, index) {
                var radioData = widget.radioData[index];
                return RadioListPlayView(radioData: radioData);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            widget.radioData[currentPage].name,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: kAccentColor,
                ),
          ),
        ),
        Center(
          child: Text(
            widget.radioData[currentPage].country,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 15,
                ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Slider(
          value: position.inSeconds.toDouble(),
          max: duration!.inSeconds.toDouble(),
          min: minPosition.inSeconds.toDouble(),
          activeColor: kAccentColor,
          inactiveColor: kPrimaryColor,
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlayerFunctionButton(
                  icon: Icons.fast_rewind,
                  color: kAccentColor,
                  size: 40,
                  onPressed: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.ease);
                    widget.radioPlayer.previousIndex;
                    widget.radioPlayer
                        .setUrl(widget.radioData[currentPage].url);
                  },
                ),
                Text(
                  'Prev station',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 10,
                      ),
                )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                gradient: kLinearGradient,
              ),
              child: PlayerFunctionButton(
                icon: btnIcon,
                color: kNavBackgroundColor,
                size: 40,
                onPressed: () {
                  if (isPlaying) {
                    widget.radioPlayer.pause();
                    setState(() {
                      btnIcon = Icons.play_arrow;
                      isPlaying = false;
                    });
                  } else {
                    widget.radioPlayer.play();
                    setState(() {
                      btnIcon = Icons.pause;
                      isPlaying = true;
                    });
                  }
                },
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PlayerFunctionButton(
                  icon: Icons.fast_forward,
                  color: kAccentColor,
                  size: 40,
                  onPressed: () {
                    widget.radioPlayer.nextIndex;
                    widget.radioPlayer
                        .setUrl(widget.radioData[currentPage].url);
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.ease);
                  },
                ),
                Text(
                  'Next station',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 10,
                      ),
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}

class PlayerFunctionButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  final double size;
  final Color color;
  const PlayerFunctionButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.size,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(minHeight: 100),
      iconSize: size,
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}
