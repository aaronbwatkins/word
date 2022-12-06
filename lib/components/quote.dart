class Quote {
  Quote({required this.author, required this.quote});

  final String quote;
  final String author;

  Quote.fromSnapshot(snapshot)
      : quote = snapshot.data()['quoteText'],
        author = snapshot.data()['author'];
}
