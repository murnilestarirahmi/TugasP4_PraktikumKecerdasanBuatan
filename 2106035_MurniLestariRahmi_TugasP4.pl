perempuan(amy).
perempuan(liza).
perempuan(karen).
perempuan(susan).
perempuan(mary).
lakilaki(david).
lakilaki(john).
lakilaki(jack).
lakilaki(ray).
lakilaki(peter).

menikah(amy,david).
menikah(karen,jack).
menikah(susan,john).

ayah(david,liza).
ayah(david,john).
ayah(jack,susan).
ayah(jack,ray).
ayah(john,peter).
ayah(john,mary).

ibu(amy,liza).
ibu(amy,john).
ibu(karen,susan).
ibu(karen,ray).
ibu(susan,peter).
ibu(susan,mary).

keponakan(peter,liza).
keponakan(peter,ray).
keponakan(mary,liza).
keponakan(mary,ray).

mertua(david,susan).
mertua(amy,susan).
mertua(jack,john).
mertua(karen,john).

besan(david,jack).
besan(david,karen).
besan(amy,jack).
besan(amy,karen).

ipar(liza,susan).
ipar(ray,john).

is_istri(W,X) :- menikah(W,X).
is_suami(X,W) :- menikah(W,X).
is_ayah(X,Y) :- ayah(X,Y).
is_anak_tuan(Y,X) :- ayah(X,Y).
is_anak_lakilaki_tuan(Y,X) :- ayah(X,Y), lakilaki(Y).
is_anak_perempuan_tuan(Y,X) :- ayah(X,Y), perempuan(Y).
is_ibu(W,Y) :- ibu(W,Y).
is_anak_nyonya(Y,W) :- ibu(W,Y).
is_anak_lakilaki_nyonya(Y,W) :- ibu(W,Y), lakilaki(Y).
is_anak_perempuan_nyonya(Y,W) :- ibu(W,Y), perempuan(Y).
is_saudara(Y,Z) :- ayah(X,Y), ayah(X,Z).
is_kakek(X,Z) :- ayah(X,Y), is_ayah(Y,Z).
is_kakek(X,Z) :- ayah(X,Y), is_ibu(Y,Z).
is_nenek(W,Z) :- ibu(W,Y), is_ayah(Y,Z).
is_nenek(W,Z) :- ibu(W,Y), is_ibu(Y,Z).
is_keponakan(Z,Y) :- keponakan(Z,Y).
is_paman(Y,Z) :- keponakan(Z,Y), lakilaki(Y).
is_tante(Y,Z) :- keponakan(Z,Y), perempuan(Y).
is_mertua(S,T) :- mertua(S,T).
is_menantu(T,S) :- mertua(S,T).
is_ibu_mertua(S,T) :- mertua(S,T), perempuan(S).
is_ayah_mertua(S,T) :- mertua(S,T), lakilaki(S).
is_besan(W,X) :- besan(W,X).
is_besan(X,W) :- besan(W,X).
is_saudara_ipar(U,V) :- ipar(U,V).
is_saudara_ipar(V,U) :- ipar(U,V).
not(halal(menikah(Z,Y))) :-
    keponakan(Z,Y), lakilaki(Z), perempuan(Y).
not(halal(menikah(Z,Y))) :-
    keponakan(Z,Y), perempuan(Z), lakilaki(Y).
