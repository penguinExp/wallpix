import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../designs/designs.e.dart';
import '../../blocs/imagesBloc/images_bloc.dart';

class AppBarWidget extends StatefulWidget {
  final TextEditingController textController;
  final int page;
  const AppBarWidget({
    Key? key,
    required this.textController,
    required this.page,
  }) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool isFocused = false;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    focusNode.addListener(focusNodeListener);
    super.initState();
  }

  void focusNodeListener() {
    if (focusNode.hasFocus) {
      setState(() {
        isFocused = true;
      });
    } else {
      setState(() {
        isFocused = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagesBloc, ImagesState>(
      builder: (context, state) {
        if (state.isSearching) {
          return _searchField(
            context,
            DesignIcon.crossIcon(
              color: Theme.of(context).primaryColor,
            ),
            state,
          );
        } else if (!state.isSearching) {
          return _searchField(
            context,
            DesignIcon.searchIcon(
              color: Theme.of(context).primaryColor,
            ),
            state,
          );
        } else {
          return _searchField(
            context,
            DesignIcon.searchIcon(
              color: Theme.of(context).primaryColor,
            ),
            state,
          );
        }
      },
    );
  }

  DesignTextField _searchField(
    BuildContext context,
    Widget suffixIcon,
    ImagesState state,
  ) {
    return DesignTextField(
      focusNode: focusNode,
      isFocused: isFocused,
      textEditingController: widget.textController,
      hintTxt: 'Search WallPix',
      highLightColor: Theme.of(context).colorScheme.onPrimary,
      secBgColor: Theme.of(context).colorScheme.onBackground,
      suffixIcon: suffixIcon,
      onIconTap: () {
        if (state.isSearching) {
          widget.textController.text = '';
          context.read<ImagesBloc>().add(
                const ImagesFetched(query: ''),
              );
        } else if (!state.isSearching) {
          final _text = widget.textController.text.trimRight();
          context.read<ImagesBloc>().add(
                ImagesFetched(
                  query: _text,
                  page: widget.page,
                ),
              );
        }
      },
    );
  }
}
