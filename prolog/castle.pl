nouvelle_cité( (Or, Blé, Population, Armée, Santé) ) :-
	       Or = 5,
	       Blé = 5,
	       Population = 5,
	       Armée = 5,
	       Santé = 5.

face_de_dé(0, recolte).
face_de_dé(1, commerce).
face_de_dé(2, peste).
face_de_dé(3, peste).
face_de_dé(4, grele).
face_de_dé(5, medicaments).


appliquer_dé( Face, _, _) :-
	not(face_de_dé(_, Face)),
	writeln(Face + " n'est pas une face valide"),
	!, fail.
appliquer_dé( recolte , (Or, 10, Population, Armée, Santé),  (Or, 10, Population, Armée, Santé) ) :-
	!.
appliquer_dé( recolte , (Or, Blé, Population, Armée, Santé),  (Or, Nouveau_Blé, Population, Armée, Santé) ) :-
	Nouveau_Blé is Blé + 1.

appliquer_dé( commerce , (10, Blé, Population, Armée, Santé),  (10, Blé, Population, Armée, Santé) ) :-
	!.
appliquer_dé( commerce , (Or, Blé, Population, Armée, Santé),  (Nouveau_Or, Blé, Population, Armée, Santé) ) :-
	Nouveau_Or is Or + 1.

appliquer_dé( peste , (Or, Blé, Population, Armée, 0),  (Or, Blé, Population, Armée, 0) ) :-
	!.
appliquer_dé( peste , (Or, Blé, Population, Armée, Santé),  (Or, Blé, Population, Armée, Nouvelle_Santé) ) :-
	Nouvelle_Santé is Santé - 1.

appliquer_dé( grele , (Or, 0, Population, Armée, Santé),  (Or, 0, Population, Armée, Santé) ) :-
	!.
appliquer_dé( grele , (Or, Blé, Population, Armée, Santé),  (Or, Nouveau_Blé, Population, Armée, Santé) ) :-
	Nouveau_Blé is Blé - 1.

appliquer_dé( medicaments , (Or, Blé, Population, Armée, 10),  (Or, Blé, Population, Armée, 10) ) :-
	!.
appliquer_dé( medicaments , (Or, Blé, Population, Armée, Santé),  (Or, Blé, Population, Armée, Nouvelle_Santé) ) :-
	Nouvelle_Santé is Santé + 1.

demarrer_le_tour_de_jeu( (Or, Blé, Population, Armée, Santé) ,  (Or, Blé, Nouvelle_Population, Armée, Nouvelle_Santé) ) :-
	controler_le_blé(Blé, Santé, Nouvelle_Santé),
	controler_la_santé(Santé, Population, Nouvelle_Population).

controler_le_blé(Blé, 1, Nouvelle_Santé) :-
	Blé < 1,
	!,
	Nouvelle_Santé is 0.
controler_le_blé(Blé, 0, Nouvelle_Santé) :-
	Blé < 3,
	!,
	Nouvelle_Santé is 0.
controler_le_blé(Blé, Santé, Nouvelle_Santé) :-
	Blé < 1,
	!,
	Nouvelle_Santé is Santé - 2.
controler_le_blé(Blé, Santé, Nouvelle_Santé) :-
	Blé < 3,
	!,
	Nouvelle_Santé is Santé - 1.
controler_le_blé(Blé, 10, Nouvelle_Santé) :-
	Blé >= 8,
	!,
	Nouvelle_Santé is 10.
controler_le_blé(Blé, Santé, Nouvelle_Santé) :-
	Blé >= 8,
	!,
	Nouvelle_Santé is Santé + 1.
controler_le_blé(_, Santé, Santé).

controler_la_santé(Santé, 1, Nouvelle_Population) :-
	Santé < 2,
	!,
	Nouvelle_Population is 0.
controler_la_santé(Santé, 0, Nouvelle_Population) :-
	Santé < 4,
	!,
	Nouvelle_Population is 0.
controler_la_santé(Santé, Population, Nouvelle_Population) :-
	Santé < 2,
	!,
	Nouvelle_Population is Population - 2.
controler_la_santé(Santé, Population, Nouvelle_Population) :-
	Santé < 4,
	!,
	Nouvelle_Population is Population - 1.
controler_la_santé(Santé, 10, Nouvelle_Population) :-
	Santé > 8,
	!,
	Nouvelle_Population is 10.
controler_la_santé(Santé, Population, Nouvelle_Population) :-
	Santé > 8,
	!,
	Nouvelle_Population is Population + 1.
controler_la_santé(_, Population, Population).

la_cite_tombe((_, _, Population, _, _)) :-
	Population >= 10,
	writeln("Insurrection").
la_cite_tombe((_, _, Population, _, _)) :-
	Population =< 0,
	writeln("Il n'y a plus d'habitants").
la_cite_tombe((_, _, _, Armée, _)) :-
	Armée >= 10,
	writeln("Coup d'état!").

demarrer_le_jeu :-
	nouvelle_cité(MaCité),
	writeln(MaCité),
	jouer(MaCité).

jouer(Cité) :-
	demarrer_le_tour_de_jeu(Cité, Nouvelle_Cité),
	la_cite_tombe(Nouvelle_Cité),
	!,
	writeln(Nouvelle_Cité),
	writeln("GAME OVER").
jouer(Cité) :-
	demarrer_le_tour_de_jeu(Cité, Cité2),
	Resultat is random(6),
	face_de_dé(Resultat, Face),
	writeln(Face),
	appliquer_dé(Face, Cité2, Nouvelle_Cité),
	writeln(Nouvelle_Cité),
	jouer(Nouvelle_Cité).




