musician(gaahl, black_metal).
musician(thomas_bangalter, electronic_music).
musician(vindsval, avant_garde).
musician(james_hetfield, thrash_metal).
musician(jon_oliva, heavy_metal).

instrument(voice, gaahl).
instrument(voice, vindsval).
instrument(voice, james_hetfield).
instrument(voice, jon_oliva).
instrument(keyboard, thomas_bangalter).
instrument(guitar, thomas_bangalter).
instrument(guitar, vindsval).
instrument(guitar, james_hetfield).

genre_instrument(Genre, Instrument) :- instrument(Instrument, Musician), musician(Musician, Genre).

guitar_musicians :-
  instrument(guitar, Musician),
  write(Musician).

guitar_genres :-
  genre_instrument(Genre, guitar),
  write(Genre).