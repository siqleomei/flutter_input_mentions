part of flutter_input_mentions;

/// A widget to use when need to show a loading state to user.
class LoadindBuilder extends StatelessWidget {
  const LoadindBuilder({super.key, required this.show, this.loading});

  // Required attribute to determine when should show the loading indicator
  final bool show;

  // A widget to display the loading indicator
  final Widget? loading;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return show
        ? loading != null
            ? loading!
            : Container(
                width: size.width,
                height: 20,
                color: Colors.white,
                child: Center(child: LinearProgressIndicator()),
              )
        : Container();
  }
}
