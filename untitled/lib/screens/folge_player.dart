import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as boxInset;
import 'package:flutter_svg/flutter_svg.dart';

import '../../../themes/app_theme.dart';
import '../../../widgets/custom_toast/toast.dart';

class FolgePlayer extends StatefulWidget {

  FolgePlayer({Key? key}) : super(key: key);

  @override
  _FolgePlayerState createState() {
    return _FolgePlayerState();
  }
}

class _FolgePlayerState extends State<FolgePlayer> {

  final AudioPlayer player = AudioPlayer();
  final AudioPlayer bgMusicPlayer = AudioPlayer();

  PlayerState? _playerState;
  Duration? _duration;
  Duration? _position;

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  bool get _isPlaying => _playerState == PlayerState.playing;

  bool get _isPaused => _playerState == PlayerState.paused;

  String get _durationText => _durationFormat(_duration!).toString().split('.').first ?? '';

  String get _positionText => _durationFormat(_position!).toString().split('.').first ?? '';


  double volume = 1;

  bool loadSource = false;




  @override
  void initState() {
    super.initState();
    // Use initial values from player
    setSource().whenComplete(() {
      setState(() {
        loadSource = true;
      });
    });

    // player.setAudioContext(audioContext);
    // bgMusicPlayer.setAudioContext(audioContext);

    _playerState = player.state;
    player.getDuration().then(
          (value) => setState(() {
        _duration = value;
      }),
    );
    player.getCurrentPosition().then(
          (value) => setState(() {
        _position = value;
      }),
    );
    _initStreams();


  }

  @override
  void dispose() {
    _stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.bgColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.sp),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover
            ),
          ),
          child: Column(
            children: [


              Container(
                margin: EdgeInsets.only(top: 86.sp),
                child: Text(
                  'audio title',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.blue50,
                    fontFamily: AppTheme.poppins,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 1.sp, bottom: 50.sp),
                child: Text(
                  'S1 title',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.white.withOpacity(.8),
                    fontFamily: AppTheme.poppins,
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.sp),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        volume = 0;
                        bgMusicPlayer.setVolume(0);
                      }),
                      child: SvgPicture.asset('assets/icons/volume_off.svg', height: 32.sp, width: 32.sp),
                    ),

                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: const Color(0xffE3E3E3),
                            activeTrackColor: AppTheme.blue50,
                            trackShape: RectangularSliderTrackShape(),
                            trackHeight: 3.sp,
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                            overlayShape: SliderComponentShape.noOverlay,
                          ),
                          child: Slider(
                            value: volume,
                            label: volume.round().toString(),
                            activeColor: AppTheme.blue50,
                            onChanged: (double value) {
                              setState(() {
                                volume = double.parse(value.toStringAsFixed(1));
                                bgMusicPlayer.setVolume(volume);
                              });
                            },
                          ),
                        ),
                      ),
                    ),

                    SvgPicture.asset('assets/icons/volume_up.svg', height: 32.sp, width: 32.sp)
                  ],
                ),
              ),


              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: _duration != null ? _isPlaying ? _pause : _play : (){},
                      child: Container(
                        padding: EdgeInsets.all(5.7.sp),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff0A2542).withOpacity(.33),
                        ),
                        child: Container(
                          height: 123.sp,
                          width: 123.sp,
                          padding: EdgeInsets.all(11.4.sp),
                          decoration: boxInset.BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xff102C4A),
                            boxShadow: [
                              boxInset.BoxShadow(
                                offset: Offset(3.sp, 3.sp),
                                blurRadius: 6.sp,
                                color: Colors.white.withOpacity(0.051),
                                inset: true,
                              ),
                              boxInset.BoxShadow(
                                offset: Offset(3.sp, 3.sp),
                                blurRadius: 6.sp,
                                color: Colors.black.withOpacity(0.16),
                              ),
                            ],
                          ),

                          child: _duration != null && loadSource ? Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xff174171).withOpacity(0.5),
                                border: Border.all(color: Color(0xff34A8FF).withOpacity(0.4), width: 2.sp)
                            ),

                            child: SvgPicture.asset(
                              _isPlaying ? 'assets/icons/pause.svg' : 'assets/icons/play.svg',
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.white,
                            ),
                          ) : loader(),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.sp),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        SliderTheme(
                          data: SliderThemeData(
                              thumbColor: Colors.white,
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14.sp),
                              activeTrackColor: AppTheme.blue50,
                              trackHeight: 3.sp,
                              inactiveTrackColor: const Color(0xffE3E3E3)
                          ),
                          child: Slider(
                            onChanged: (v) {
                              final duration = _duration;
                              if (duration == null) {
                                return;
                              }
                              final position = v * duration.inMilliseconds;
                              bgMusicPlayer.seek(Duration(milliseconds: position.round() + 500));
                              player.seek(Duration(milliseconds: position.round()));
                            },
                            value: (_position != null &&
                                _duration != null &&
                                _position!.inMilliseconds > 0 &&
                                _position!.inMilliseconds < _duration!.inMilliseconds)
                                ? _position!.inMilliseconds / _duration!.inMilliseconds
                                : 0.0,
                          ),
                        ),



                        Container(
                          margin: EdgeInsets.only(left: 40.sp, right: 40.sp, top: 8.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              InkWell(
                                onTap: () {
                                  final position = _position!.inSeconds - 20;
                                  bgMusicPlayer.seek(Duration(seconds: position.round() - 500));
                                  player.seek(Duration(seconds: position.round()));
                                },
                                child: SizedBox(
                                  width: 46.sp,
                                  height: 46.sp,
                                  child: SvgPicture.asset(
                                    'assets/icons/20SecLeft.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: _position != null ? '${_positionText}' : '00:00',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppTheme.blue50,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:  _duration != null ? ' / $_durationText' : '',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),




                              InkWell(
                                onTap: () {
                                  final position = _position!.inSeconds + 20;
                                  bgMusicPlayer.seek(Duration(seconds: position.round() + 500));
                                  player.seek(Duration(seconds: position.round()));
                                },
                                child: SizedBox(
                                  width: 46.sp,
                                  height: 46.sp,
                                  child: SvgPicture.asset(
                                    'assets/icons/20SecRight.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),



              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 60.sp),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
                      child: Text(
                        'zurück',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 17.sp,
                          height: 1.5,
                          color: AppTheme.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppTheme.poppins,
                        ),
                      ),
                    ),
                  ),
                ],
              ),



            ],
          ),
        ),
    );
  }





  Future<void> _play() async {
    if(player.source == null){
      await bgMusicPlayer.play(UrlSource('url'));
      await Future.delayed(Duration(seconds: 5), () async  =>  await player.play(UrlSource('url')),);
    } else{
      final position = _position;
      if (position != null && position.inMilliseconds > 0) {
        await player.seek(position);
        await player.resume();
        await bgMusicPlayer.resume();

      } else{
        setState(() => _playerState = PlayerState.playing);
        await bgMusicPlayer.resume();
        await Future.delayed(Duration(seconds: 5), () async  =>  await player.resume());
      }

      setState(() => _playerState = PlayerState.playing);
    }
  }

  Future<void> _pause() async {
    await player.pause();
    await bgMusicPlayer.pause();
    setState(() => _playerState = PlayerState.paused);
  }

  Future<void> _stop() async {
    await player.stop();
    await bgMusicPlayer.stop();
    print('======>>>>>>>>>>${player.state}');
    print('======>>>>>>>>>>${bgMusicPlayer.state}');
    setState(() {
      _playerState = PlayerState.stopped;
      _position = Duration.zero;
    });
  }

  void _initStreams() {
    _durationSubscription = player.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });

    _positionSubscription = player.onPositionChanged.listen(
            (p) {
          // When enyones call than audio player auto starts player
          setState(() => _position = p);
        }
    );

    _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration.zero;
      });
    });

    _playerStateChangeSubscription =
        player.onPlayerStateChanged.listen((state) {
          setState(() {
            _playerState = state;
          });
          if(state == PlayerState.completed){
            print('---------------------<<<<<<<<<<<<<<<< done');

          }
        });
  }

  // demo
  String _durationFormat(Duration duration) {
    String negativeSign = duration.isNegative ? '-' : '';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  Future<void> setSource() async{
    await player.setSource(UrlSource('url'));
    await bgMusicPlayer.setSource(UrlSource('url'));
  }

  Widget loader() {
    return Stack(
      children: [
        Container(
          height: 123.sp,
          width: 123.sp,
          child: CircularProgressIndicator(
            backgroundColor: Color(0xff34A8FF).withOpacity(0.2),
            strokeWidth: 2.sp,
            color: Color(0xff34A8FF).withOpacity(0.4),
            semanticsLabel: 'Circular progress indicator',
          ),
        ),
        SvgPicture.asset(
          _isPlaying ? 'assets/icons/pause.svg' : 'assets/icons/play.svg',
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
        )
      ],
    );
  }


}

// Navigator.push(
// context, MaterialPageRoute(builder: (context) =>
// FolgePlayer(
//
// episode: getStoriesResModel.data![widget.index ?? 0].episodes![index].audio!,
// bgMusic: getStoriesResModel.data![widget.index ?? 0].bgMusic!,
// storyId: getStoriesResModel.data![widget.index ?? 0].sId!,
// episodeId: getStoriesResModel.data![widget.index ?? 0].episodes![index].sId!,
// ), fullscreenDialog: true,));