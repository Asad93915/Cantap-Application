
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/helper_services/custom_loader.dart';
import 'package:school_management_system/helper_services/navigation_services.dart';
import 'package:school_management_system/helper_widgets/custom_button.dart';
import 'package:school_management_system/models/chpter_Model.dart';
import 'package:school_management_system/providers/get_tutorials_provider.dart';
import 'package:school_management_system/services/Admin_Services/get_tutorials_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../configs/colors.dart';
import '../../../configs/text_styles.dart';
import '../../../helper_widgets/custom_drop_down.dart';
import '../../../helper_widgets/custom_drop_down_text.dart';
import '../../../providers/get_booklist_provider.dart';
import '../../../providers/get_chapterlist_provider.dart';
import '../../../providers/get_classes_provider.dart';
import '../../../services/Admin_Services/books_list_service.dart';
import '../../../services/Admin_Services/chapter_list_service.dart';
import '../../../utils/custom_handlers.dart';
import '../admin_drawer_screen.dart';

class ViewTutorials extends StatefulWidget {
  const ViewTutorials({Key? key}) : super(key: key);

  @override
  State<ViewTutorials> createState() => _ViewTutorialsState();
}

class _ViewTutorialsState extends State<ViewTutorials> {
  int ?selectedClass;
  String selectedSeries="";
  int? selectedSubject;
  int? selectedChapter;
  int ?selectesSlos;






  bool slo=false;
  List multipleSelected = [];

 List<SlOs>slos=[];

  _getBooksHandler(int classId)async{
    CustomLoader.showLoader(context: context);
   await BooksListService().getBooKs(context: context, classId:classId );
    CustomLoader.hideLoader(context);
  }
  _getChapterHandler(int bookId)async{
    CustomLoader.showLoader(context: context);
    await ChaptersListService().getChapters(context: context, bookId: bookId, skip: 0, take: 1000);
    CustomLoader.hideLoader(context);
  }
  _getTutorialsHandler()async{
    CustomLoader.showLoader(context: context);
    await GetTutorialsService().getTutorials(context: context, stdId: selectedClass??0, bookId: selectedSubject??0, chId: selectedChapter??0, sloId: selectesSlos??0);

    CustomLoader.hideLoader(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getClassesHandler(context);
      _getTutorialsHandler();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminDrawer(),
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: Builder(
          builder: (context)=>IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: Icon(Icons.menu,color: whiteColor,)),
        ),
        title: Text("View Tutorils",style: barStyle,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Class",
                style: TextStyle(
                    color: blackColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    height: 2.5),
              ),
              Consumer<GetClassProvider>(builder: (context,classList,_){
                return  CustomDropDown(
                  child: DropdownButton(
                    value: selectedClass,
                    isExpanded: true,
                    underline: SizedBox(),
                    hint: Text("Select Class"),
                    items: classList.myClass!.map((item){
                      return DropdownMenuItem(
                        child: Text(item.name??""),
                        value: item.standardId,
                      );
                    } ).toList(),
                    onChanged: (int? value) {
                      selectedClass=value!;
                      classList.myClass!.map((item) {

                        print("newValue $value");
                        if (value == item.standardId) {
                          if (selectedSubject == null) {
                            _getBooksHandler(item.standardId!);
                          } else {
                            selectedSubject = null;
                            _getBooksHandler(item.standardId!);
                          }
                          // cities.city!.clear();

                        }
                      }).toList();
                      setState(() {

                      });
                    },
                  ),
                );
              }),
              const Text(
                "Select Subject",
                style: TextStyle(
                    color: blackColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    height: 2.5),
              ),
              Consumer<BookListProvoider>(builder: (context,subj,_){
                return  CustomDropDown(
                  child: DropdownButton(
                    value: selectedSubject,
                    isExpanded: true,
                    underline: SizedBox(),
                    hint: Text("Select Subject"),
                    items: subj.booksList!.map((item){
                      return DropdownMenuItem(
                        child: Text(item.name??""),
                        value: item.bookId,
                      );
                    } ).toList(),
                    onChanged: (int? value) {
                      selectedSubject=value!;
                      subj.booksList!.map((item) {

                        print("newValue $value");
                        if (value == item.bookId) {
                          if (selectedChapter == null) {
                            _getChapterHandler(item.bookId!);
                          } else {
                            selectedChapter = null;
                            _getChapterHandler(item.bookId!);
                          }
                          // cities.city!.clear();

                        }
                      }).toList();
                      setState(() {});
                    },
                  ),
                );
              }),

               Text(
                "Select Chapter",
                style: TextStyle(
                    color: blackColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    height: 2.5),
              ),
        Consumer<ChapterListProvider>(builder: (context,ch,_){
          return       CustomDropDown(

            child: DropdownButton(
              value: selectedChapter,
                isExpanded: true,
                underline: SizedBox(),
                hint: Text( "Select Chapter"),
                items: ch.chaptersList!.toSet().map((item) {
                  return DropdownMenuItem(
                    value: item.chapterId,
                    child: Text(item.name!),
                  );
                }).toSet().toList(
                ), onChanged: (int? value){

              selectedChapter=value!;
              ch.chaptersList!.map((item){
                if (value == item.chapterId) {
                  if (selectedChapter == null) {
                    slos=item.slOs!;
                  } else {
                    slos.clear();
                    selectesSlos=null;
                    slos=item.slOs!;
                  }
                  // cities.city!.clear();

                }
              }).toList();

              setState(() {
              });
            }),
          );
        }),

              CustomDropDownText
                (
                text: "Select Sol's",
              ),
              CustomDropDown(
                child: DropdownButton(
                  value: selectesSlos,
                    isExpanded: true,
                    underline: SizedBox(),
                    hint: Text( "Select Slo's"),
                    items: slos.toSet().map((item) {
                      return DropdownMenuItem(
                        value: item.sloId,
                        child: Text(item.name??""),
                      );
                    }).toSet().toList(
                    ), onChanged: (int ? value){

                  selectesSlos=value!;
                  setState(() {
                  });
                }),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text(
                      "Vedios",
                      style: TextStyle(
                          color: bgColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          height: 2),
                    ),
                    TextButton(onPressed: (){}, child: const Text(
                      "View All",
                      style: TextStyle(
                          color: bgColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          height: 2),
                    ),)
                  ],),),

             Consumer<GetTutorialsProvider>(builder: (context,tutorial,_){
               return SizedBox(

                height: 120.0,
                 width: double.infinity,

                 child: tutorial.getTutorials!.isNotEmpty?ListView.builder(
                   itemCount: tutorial.getTutorials!.length<10?tutorial.getTutorials!.length:10,
                     scrollDirection: Axis.horizontal,
                     shrinkWrap: true,
                     primary: false,
                     physics: AlwaysScrollableScrollPhysics(),

                     itemBuilder: (BuildContext,index){
                       return InkWell(
                         onTap: (){

                           NavigationServices.goNextAndKeepHistory(context: context, widget: VideoPlayerScreen(youtubeUrl: tutorial.getTutorials![index].youtubeLink??"",));
                         },
                         child: Stack(
                           alignment: Alignment.center,
                           children: [
                             Container(
                               margin: EdgeInsets.symmetric(horizontal: 10.0),
                               alignment: Alignment.center,
                               height:MediaQuery.of(context).size.height * 0.17,
                               width: MediaQuery.of(context).size.width/1.8,
                               decoration: BoxDecoration(
                                   color: Colors.red,
                                   image: DecorationImage(
                                     image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8lJWvCdGtyLav41mHkWYZVGOyT_ZfF2nFotVKQ2zwKBu5KTvJPux2Ai2Axq3E4t90KPw&usqp=CAU",),
                                     fit: BoxFit.cover,

                                     alignment: Alignment.center,

                                   ),
                                   borderRadius: BorderRadius.circular(10.0)
                               ),
                               child: Text("gQDByCdjUXw",style: videoStyle,textAlign: TextAlign.center,),
                             ),
                             Container(
                               height:30.0,
                               width:40.0,
                               child: Icon(Icons.play_arrow,color: whiteColor,size: 25.0,),
                               decoration: BoxDecoration(
                                   color: Colors.black45,
                                   borderRadius: BorderRadius.circular(5.0)
                               ),
                             )
                           ],
                         ),
                       );
                     }):Container(
                   width: double.infinity,
                     margin: EdgeInsets.symmetric(vertical: 15.0),
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0),
                       border: Border.all(color: blackColor)
                     ),
                     child: Text("No Tutorials exsist against this Content",textAlign: TextAlign.center,style: createStyle,)),
               );
             })

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(



        decoration: BoxDecoration(
          color: black12,
          border: Border.all(color: black12)
        ),
        height: kTextTabBarHeight * 1.0,
        child: Center(
          child: CustomButton(
            verticalMargin: 5.0,
            text: "Submit",
            onTap: (){
              _getTutorialsHandler();
              setState(() {

              });
            },
          ),
        ),
      )
    );
  }
}
class VideoPlayerScreen extends StatefulWidget {
  final String youtubeUrl;
  VideoPlayerScreen({required this.youtubeUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [

  ];


  @override
  void initState() {
    super.initState();

   String? id=YoutubePlayer.convertUrlToId(widget.youtubeUrl);
    _ids.add(id!);
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              log('Settings Tapped!');
            },
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller
              .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          _showSnackBar('Next Video Started!');
        },
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
        backgroundColor: bgColor,
          title: const Text(
            "Vido Here",
            style: TextStyle(color: Colors.white),
          ),

        ),
        body: ListView(
          children: [
            player,
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       _space,
            //       _text('Title', _videoMetaData.title),
            //       _space,
            //       _text('Channel', _videoMetaData.author),
            //       _space,
            //       _text('Video Id', _videoMetaData.videoId),
            //       _space,
            //       Row(
            //         children: [
            //           _text(
            //             'Playback Quality',
            //             _controller.value.playbackQuality ?? '',
            //           ),
            //           const Spacer(),
            //           _text(
            //             'Playback Rate',
            //             '${_controller.value.playbackRate}x  ',
            //           ),
            //         ],
            //       ),
            //       _space,
            //       TextField(
            //         enabled: _isPlayerReady,
            //         controller: _idController,
            //         decoration: InputDecoration(
            //           border: InputBorder.none,
            //           hintText: 'Enter youtube \<video id\> or \<link\>',
            //           fillColor: Colors.blueAccent.withAlpha(20),
            //           filled: true,
            //           hintStyle: const TextStyle(
            //             fontWeight: FontWeight.w300,
            //             color: Colors.blueAccent,
            //           ),
            //           suffixIcon: IconButton(
            //             icon: const Icon(Icons.clear),
            //             onPressed: () => _idController.clear(),
            //           ),
            //         ),
            //       ),
            //       _space,
            //       Row(
            //         children: [
            //           _loadCueButton('LOAD'),
            //           const SizedBox(width: 10.0),
            //           _loadCueButton('CUE'),
            //         ],
            //       ),
            //       _space,
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           IconButton(
            //             icon: const Icon(Icons.skip_previous),
            //             onPressed: _isPlayerReady
            //                 ? () => _controller.load(_ids[
            //             (_ids.indexOf(_controller.metadata.videoId) -
            //                 1) %
            //                 _ids.length])
            //                 : null,
            //           ),
            //           IconButton(
            //             icon: Icon(
            //               _controller.value.isPlaying
            //                   ? Icons.pause
            //                   : Icons.play_arrow,
            //             ),
            //             onPressed: _isPlayerReady
            //                 ? () {
            //               _controller.value.isPlaying
            //                   ? _controller.pause()
            //                   : _controller.play();
            //               setState(() {});
            //             }
            //                 : null,
            //           ),
            //           IconButton(
            //             icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
            //             onPressed: _isPlayerReady
            //                 ? () {
            //               _muted
            //                   ? _controller.unMute()
            //                   : _controller.mute();
            //               setState(() {
            //                 _muted = !_muted;
            //               });
            //             }
            //                 : null,
            //           ),
            //           FullScreenButton(
            //             controller: _controller,
            //             color: Colors.blueAccent,
            //           ),
            //           IconButton(
            //             icon: const Icon(Icons.skip_next),
            //             onPressed: _isPlayerReady
            //                 ? () => _controller.load(_ids[
            //             (_ids.indexOf(_controller.metadata.videoId) +
            //                 1) %
            //                 _ids.length])
            //                 : null,
            //           ),
            //         ],
            //       ),
            //       _space,
            //       Row(
            //         children: <Widget>[
            //           const Text(
            //             "Volume",
            //             style: TextStyle(fontWeight: FontWeight.w300),
            //           ),
            //           Expanded(
            //             child: Slider(
            //               inactiveColor: Colors.transparent,
            //               value: _volume,
            //               min: 0.0,
            //               max: 100.0,
            //               divisions: 10,
            //               label: '${(_volume).round()}',
            //               onChanged: _isPlayerReady
            //                   ? (value) {
            //                 setState(() {
            //                   _volume = value;
            //                 });
            //                 _controller.setVolume(_volume.round());
            //               }
            //                   : null,
            //             ),
            //           ),
            //         ],
            //       ),
            //       _space,
            //       AnimatedContainer(
            //         duration: const Duration(milliseconds: 800),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20.0),
            //           color: _getStateColor(_playerState),
            //         ),
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text(
            //           _playerState.toString(),
            //           style: const TextStyle(
            //             fontWeight: FontWeight.w300,
            //             color: Colors.white,
            //           ),
            //           textAlign: TextAlign.center,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700]!;
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900]!;
      default:
        return Colors.blue;
    }
  }

  Widget get _space => const SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
          if (_idController.text.isNotEmpty) {
            var id = YoutubePlayer.convertUrlToId(
              _idController.text,
            ) ??
                '';
            if (action == 'LOAD') _controller.load(id);
            if (action == 'CUE') _controller.cue(id);
            FocusScope.of(context).requestFocus(FocusNode());
          } else {
            _showSnackBar('Source can\'t be empty!');
          }
        }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}