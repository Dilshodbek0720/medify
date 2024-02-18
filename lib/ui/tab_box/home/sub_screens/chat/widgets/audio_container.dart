import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/tab_box/home/widgets/date_formatter.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class AudioContainer extends StatefulWidget {
  const AudioContainer({super.key, required this.audioPath, required this.dateTime});
  final String audioPath;
  final String dateTime;

  @override
  State<AudioContainer> createState() => _AudioContainerState();
}

class _AudioContainerState extends State<AudioContainer> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration currentDuration = Duration.zero;

  _init() async {
    if (widget.audioPath.isNotEmpty) {
      await player.setSourceUrl(widget.audioPath);
    }
    player.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });

    player.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        duration = Duration.zero;
        currentDuration = Duration.zero;
      });
      // print("SONG COMPLETED");
    });

    player.onPositionChanged.listen((Duration d) {
      currentDuration = d;
      setState(() {});
      debugPrint("DURATION: ${d.inSeconds}");
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
          color: AppColors.audioBackground, borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              6.pw,
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.green.withOpacity(0.8)
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (!isPlaying) {
                          player.play(DeviceFileSource(widget.audioPath));
                          isPlaying = true;
                        } else {
                          player.pause();
                          isPlaying = false;
                        }
                      });
                    },
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 24.w,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Slider(
                    thumbColor: AppColors.green.withOpacity(0.5), inactiveColor: AppColors.c_200,
                    activeColor: AppColors.green.withOpacity(0.8),
                    value: currentDuration.inSeconds.toDouble(),
                    max: duration.inSeconds.toDouble(),
                    divisions: 100,
                    onChanged: (double value) async {
                      await player.seek(Duration(seconds: value.toInt()));
                      setState(() {});
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          12.pw,
                          Text("${formatSeconds(currentDuration.inSeconds)} | ", style: TextStyle(
                              fontSize: 12.sp
                          ),),
                          Text(formatSeconds(duration.inSeconds), style: TextStyle(
                              fontSize: 12.sp
                          ),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          4.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.dateTime.substring(10, 16),
                style: TextStyle(
                    fontSize: 12.sp
                ),
              ),
              8.pw
            ],
          )
        ],
      ),
    );
  }
}
