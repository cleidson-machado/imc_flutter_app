import 'package:flutter/material.dart';

class InfinityScrollComponent<T> extends StatefulWidget {
  final Future<void> Function() fetchData;
  final Widget Function(T item, int index) itemBuilder;
  final Function(T, int)? onItemTap;
  final Widget loadingIndicator;
  final String loadingText;
  final String noMoreDataText;
  final List<T> items;
  final bool hasMore;

  const InfinityScrollComponent({
    super.key,
    required this.fetchData,
    required this.itemBuilder,
    required this.hasMore,
    required this.noMoreDataText,
    this.onItemTap,
    this.loadingText = 'Loading...',
    this.loadingIndicator = const CircularProgressIndicator.adaptive(),
    this.items = const [],
  });

  @override
  InfiniteScrollListState<T> createState() => InfiniteScrollListState<T>();
}

class InfiniteScrollListState<T> extends State<InfinityScrollComponent<T>> {
  late ScrollController _scrollController;
  bool _isFetchingData = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    var maxScroll = _scrollController.position.maxScrollExtent;
    var currentScroll = _scrollController.position.pixels;

    if (currentScroll >= maxScroll && widget.hasMore && !_isFetchingData) {
      setState(() => _isFetchingData = true);
      widget.fetchData().then((_) {
        setState(() => _isFetchingData = false);
      }).catchError((e) {
        setState(() => _isFetchingData = false);
        debugPrint("Error fetching data: $e");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.items.length + 1,
      itemBuilder: (context, index) {
        if (index < widget.items.length) {
          return InkWell(
            onTap: widget.onItemTap != null
                ? () => widget.onItemTap!(widget.items[index], index)
                : null,
            child: widget.itemBuilder(widget.items[index], index),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Center(
              child: widget.hasMore
                  ? buildLoadingContainer()
                  : buildNoMoreData(),
            ),
          );
        }
      },
    );
  }

  Widget buildLoadingContainer() {
    return Column(
      children: [
        Text(widget.loadingText),
        const SizedBox(height: 2),
        widget.loadingIndicator,
      ],
    );
  }

  Widget buildNoMoreData() {
    return Text(widget.noMoreDataText);
  }
}
