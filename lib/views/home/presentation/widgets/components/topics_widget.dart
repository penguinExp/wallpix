import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpix/designs/designs.e.dart';
import 'package:wallpix/views/home/domain/domain.e.dart';
import 'package:wallpix/views/home/presentation/blocs/imagesBloc/images_bloc.dart';

class TopicsWidget extends StatefulWidget {
  final TextEditingController controller;
  const TopicsWidget({Key? key, required this.controller}) : super(key: key);

  @override
  State<TopicsWidget> createState() => _TopicsWidgetState();
}

class _TopicsWidgetState extends State<TopicsWidget> {
  late PageController _pageController;
  double page = 0.0;

  @override
  void dispose() {
    super.dispose();
    _pageController
      ..removeListener(_pageListener)
      ..dispose();
  }

  void _pageListener() {
    setState(() {
      page = _pageController.page!;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.6,
    );
    _pageController.addListener(_pageListener);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      dragStartBehavior: DragStartBehavior.start,
      itemCount: topicsList.length,
      controller: _pageController,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            widget.controller.text = topicsList[index].id;
            context.read<ImagesBloc>().add(
                  ImagesFetched(
                    query: topicsList[index].id,
                  ),
                );
          },
          child: Padding(
            padding: EdgeInsets.only(
              right: 20.w,
            ),
            child: Stack(
              // fit: StackFit.loose,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: DesignImage(
                    blurHash: topicsList[index].blurHash,
                    imageUrl: topicsList[index].urls.regular,
                    horizontalSlide: (index - page).clamp(-1, 1).toDouble(),
                  ),
                ),
                Center(
                  child: DesignText.headingThreeBig(
                    text: topicsList[index].id,
                    color: LightThemeColors.secPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final List<ImgEntity> topicsList = <ImgEntity>[
    const ImgEntity(
      urls: ImgUrlsEntity(
        full: '',
        regular:
            'https://images.unsplash.com/photo-1520637438573-ee1ba80b2a7f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDUzMjR8MHwxfGFsbHx8fHx8fHx8fDE2NDk3NzcyOTU&ixlib=rb-1.2.1&q=80&w=1080',
        small: '',
      ),
      links: ImgLinksEntity(download: ''),
      id: 'Penguin',
      blurHash: 'LRHCNGNMWXt7%%InM|oeR5s-Rjoe',
    ),
    const ImgEntity(
      urls: ImgUrlsEntity(
        full: '',
        regular:
            'https://images.unsplash.com/photo-1592817797597-392e3b878e1c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDUzMjR8MHwxfGFsbHx8fHx8fHx8fDE2NDk3Nzc2Njk&ixlib=rb-1.2.1&q=80&w=1080',
        small: '',
      ),
      links: ImgLinksEntity(download: ''),
      id: 'Puppy',
      blurHash: 'LVG[=LHU%Ft8-AK5%LkCE2wMxbjH',
    ),
    const ImgEntity(
      urls: ImgUrlsEntity(
        full: '',
        regular:
            'https://images.unsplash.com/photo-1591871937573-74dbba515c4c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDUzMjR8MHwxfGFsbHx8fHx8fHx8fDE2NDk3Nzc3OTA&ixlib=rb-1.2.1&q=80&w=1080',
        small: '',
      ),
      links: ImgLinksEntity(download: ''),
      id: 'Kitten',
      blurHash: 'LHGIo=5701?b8{R+%LIoI]%L-pE1',
    ),
    const ImgEntity(
      urls: ImgUrlsEntity(
        full: '',
        regular:
            'https://images.unsplash.com/photo-1509343256512-d77a5cb3791b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDUzMjR8MHwxfGFsbHx8fHx8fHx8fDE2NDk3Nzc5NTQ&ixlib=rb-1.2.1&q=80&w=1080',
        small: '',
      ),
      links: ImgLinksEntity(download: ''),
      id: 'Abstract',
      blurHash: "LDFr315G~lNO%M4;jCx]AJr;\$O%e",
    ),
    const ImgEntity(
      urls: ImgUrlsEntity(
        full: '',
        regular:
            'https://images.unsplash.com/photo-1581850518616-bcb8077a2336?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDUzMjR8MHwxfGFsbHx8fHx8fHx8fDE2NDk3Nzg0NDk&ixlib=rb-1.2.1&q=80&w=1080',
        small: '',
      ),
      links: ImgLinksEntity(download: ''),
      id: 'Art',
      blurHash: 'L7D0M=-?Hs.rYh3Z9IX6:Q*_%dI@',
    ),
    const ImgEntity(
      urls: ImgUrlsEntity(
        full: '',
        regular:
            'https://images.unsplash.com/photo-1604391659919-0cb8c6bb0966?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDUzMjR8MHwxfGFsbHx8fHx8fHx8fDE2NDk3Nzg1Mzc&ixlib=rb-1.2.1&q=80&w=1080',
        small: '',
      ),
      links: ImgLinksEntity(download: ''),
      id: 'Flower',
      blurHash: 'LEQ0R1~qyX%3^+xuNtWAXmofMdWU',
    ),
    const ImgEntity(
      urls: ImgUrlsEntity(
        full: '',
        regular:
            'https://images.unsplash.com/photo-1475924156734-496f6cac6ec1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDUzMjR8MHwxfGFsbHx8fHx8fHx8fDE2NDk3Nzg2MTQ&ixlib=rb-1.2.1&q=80&w=1080',
        small: '',
      ),
      links: ImgLinksEntity(download: ''),
      id: 'Nature',
      blurHash: 'LyGlub9tRiofcuw|WBWBOYxZn%WC',
    ),
    const ImgEntity(
      urls: ImgUrlsEntity(
        full: '',
        regular:
            'https://images.unsplash.com/photo-1422493757035-1e5e03968f95?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDUzMjR8MHwxfGFsbHx8fHx8fHx8fDE2NDk3Nzg2ODQ&ixlib=rb-1.2.1&q=80&w=1080',
        small: '',
      ),
      links: ImgLinksEntity(download: ''),
      id: 'Sunrise',
      blurHash: 'LyJ\$tY=wn~aypMX7jray5XNLoLaz',
    ),
    const ImgEntity(
      urls: ImgUrlsEntity(
        full: '',
        regular:
            'https://images.unsplash.com/photo-1506863530036-1efeddceb993?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDUzMjR8MHwxfGFsbHx8fHx8fHx8fDE2NDk3Nzg4OTQ&ixlib=rb-1.2.1&q=80&w=1080',
        small: '',
      ),
      links: ImgLinksEntity(download: ''),
      id: 'Portrait',
      blurHash: 'LA7UI{t700IUD%WB-;t7M{WBxut7',
    ),
    const ImgEntity(
      urls: ImgUrlsEntity(
        full: '',
        regular:
            'https://images.unsplash.com/photo-1531156992292-d36397ee9184?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDUzMjR8MHwxfGFsbHx8fHx8fHx8fDE2NDk3Nzg5Nzk&ixlib=rb-1.2.1&q=80&w=1080',
        small: '',
      ),
      links: ImgLinksEntity(download: ''),
      id: 'Plant',
      blurHash: 'L239lMQ;M2tij=VtaypGQppGpFR8',
    ),
    const ImgEntity(
      urls: ImgUrlsEntity(
        full: '',
        regular:
            'https://images.unsplash.com/photo-1494022299300-899b96e49893?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDUzMjR8MHwxfGFsbHx8fHx8fHx8fDE2NDk3NzkwNTQ&ixlib=rb-1.2.1&q=80&w=1080',
        small: '',
      ),
      links: ImgLinksEntity(download: ''),
      id: 'Space',
      blurHash: 'L84eyloM8^R*xuaxRPkCDgWB%ht7',
    ),
    const ImgEntity(
      urls: ImgUrlsEntity(
        full: '',
        regular:
            'https://images.unsplash.com/photo-1496412705862-e0088f16f791?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDUzMjR8MHwxfGFsbHx8fHx8fHx8fDE2NDk3NzkxNTM&ixlib=rb-1.2.1&q=80&w=1080',
        small: '',
      ),
      links: ImgLinksEntity(download: ''),
      id: 'Food',
      blurHash: 'LLAdAqnN4:R%V@X9a{nN0gXT=_nO',
    ),
  ];
}
