part of flutter_input_mentions;

/// A map that represents a suggestion item in option list.
typedef Suggestion = Map<String, dynamic>;

class OptionList extends StatelessWidget {
  OptionList({
    required this.data,
    required this.onTap,
    required this.suggestionListHeight,
    this.suggestionBuilder,
    this.suggestionListDecoration,
  });

  final Widget Function(Suggestion)? suggestionBuilder;

  final List<Suggestion> data;

  final Function(Suggestion) onTap;

  final double suggestionListHeight;

  final BoxDecoration? suggestionListDecoration;

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Container(
            decoration: suggestionListDecoration ?? BoxDecoration(color: Colors.white),
            constraints: BoxConstraints(
              maxHeight: suggestionListHeight,
              minHeight: 0,
            ),
            child: ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onTap(data[index]),
                  child: suggestionBuilder != null
                      ? suggestionBuilder!(data[index])
                      : Container(
                          color: Colors.blue,
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            data[index]['display'],
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                );
              },
            ),
          )
        : Container();
  }
}
