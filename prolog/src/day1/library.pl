book(adopting_elixir, bruce_tate).
book(better_faster_lighter_java, bruce_tate).
book(beyond_java, bruce_tate).
book(the_lord_of_the_rings, jrr_tolkien).

books_written_by_bruce_tate :-
  book(Book, bruce_tate),
  write(Book).

books_written_by_jrr_tolkien :-
  book(Book, jrr_tolkien),
  write(Book).