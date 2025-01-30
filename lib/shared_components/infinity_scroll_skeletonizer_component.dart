import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class InfinityScrollSkeletonizerComponent<T> extends StatefulWidget {
  final Future<void> Function() fetchData;
  final Widget Function(T item, int index) itemBuilder;
  final Function(T, int)? onItemTap;
  final String loadingText;
  final String noMoreDataText;
  final List<T> items;
  final bool hasMore;

  const InfinityScrollSkeletonizerComponent({
    super.key,
    required this.fetchData,
    required this.itemBuilder,
    required this.hasMore,
    required this.noMoreDataText,
    this.onItemTap,
    this.loadingText = 'Loading...',
    this.items = const [],
  });

  @override
  InfiniteScrollListState<T> createState() => InfiniteScrollListState<T>();
}

class InfiniteScrollListState<T> extends State<InfinityScrollSkeletonizerComponent<T>> {
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
      itemCount: widget.items.length + (widget.hasMore ? 5 : 0), // Add skeleton placeholders
      itemBuilder: (context, index) {
        if (index < widget.items.length) {
          return InkWell(
            onTap: widget.onItemTap != null
                ? () => widget.onItemTap!(widget.items[index], index)
                : null,
            child: widget.itemBuilder(widget.items[index], index),
          );
        } else {
          // Instead of CircularProgressIndicator, show skeleton placeholders
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _buildSkeletonPlaceholder(),
          );
        }
      },
    );
  }

  Widget _buildSkeletonPlaceholder() {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(2, (index) => _skeletonCard()), // Show multiple skeletons
      ),
    );
  }

  Widget _skeletonCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        child: ListTile(
          leading: Container(width: 40, height: 40, color: Colors.grey),
          title: Container(height: 16, width: 100, color: Colors.grey),
          subtitle: Container(height: 12, width: 150, color: Colors.grey),
        ),
      ),
    );
  }
}
