import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:live_online_radio/Models/models.dart';
import 'package:live_online_radio/constant.dart';
import 'package:live_online_radio/screen/player_screen.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({
    required this.radioData,
    Key? key,
  }) : super(key: key);

  final List<RadioModel> radioData;

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  AudioPlayer justPlayer = AudioPlayer();

  radioManager(String url) async {
    await justPlayer.setUrl(url);
    try {
      await justPlayer.setUrl(url);
    } on PlayerException catch (e) {
      return Overlay();
    } on PlayerInterruptedException catch (e) {
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5 / 8,
      ),
      itemCount: widget.radioData.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 20, bottom: 10),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlayerScreen(
                            radioData: widget.radioData,
                            currentIndex: index,
                            radioPlayer: justPlayer,
                          )));

              radioManager(widget.radioData[index].url);

              justPlayer.play();
            },
            child: Container(
              decoration: const BoxDecoration(
                  color: kNavBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      widget.radioData[index].favicon,
                      errorBuilder: (context, error, stackTrace) {
                        return const Image(
                          image: AssetImage(
                            'Asset/Images/radioImage.jpeg',
                          ),
                          height: double.maxFinite,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        );
                      },
                      fit: BoxFit.fill,
                      height: 500,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        widget.radioData[index].name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              // color: Colors.white,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..strokeWidth = 2
                                ..color = kAccentColor
                                ..style = PaintingStyle.stroke,
                            ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        widget.radioData[index].name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        widget.radioData[index].country,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: kAccentColor,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
