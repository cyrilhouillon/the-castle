nouvelle_cit�( (Or, Bl�, Population, Arm�e, Sant�) ) :-
	       Or = 5,
	       Bl� = 5,
	       Population = 5,
	       Arm�e = 5,
	       Sant� = 5.

face_de_d�(0, recolte).
face_de_d�(1, commerce).
face_de_d�(2, peste).
face_de_d�(3, peste).
face_de_d�(4, grele).
face_de_d�(5, medicaments).


appliquer_d�( Face, _, _) :-
	not(face_de_d�(_, Face)),
	writeln(Face + " n'est pas une face valide"),
	!, fail.
appliquer_d�( recolte , (Or, 10, Population, Arm�e, Sant�),  (Or, 10, Population, Arm�e, Sant�) ) :-
	!.
appliquer_d�( recolte , (Or, Bl�, Population, Arm�e, Sant�),  (Or, Nouveau_Bl�, Population, Arm�e, Sant�) ) :-
	Nouveau_Bl� is Bl� + 1.

appliquer_d�( commerce , (10, Bl�, Population, Arm�e, Sant�),  (10, Bl�, Population, Arm�e, Sant�) ) :-
	!.
appliquer_d�( commerce , (Or, Bl�, Population, Arm�e, Sant�),  (Nouveau_Or, Bl�, Population, Arm�e, Sant�) ) :-
	Nouveau_Or is Or + 1.

appliquer_d�( peste , (Or, Bl�, Population, Arm�e, 0),  (Or, Bl�, Population, Arm�e, 0) ) :-
	!.
appliquer_d�( peste , (Or, Bl�, Population, Arm�e, Sant�),  (Or, Bl�, Population, Arm�e, Nouvelle_Sant�) ) :-
	Nouvelle_Sant� is Sant� - 1.

appliquer_d�( grele , (Or, 0, Population, Arm�e, Sant�),  (Or, 0, Population, Arm�e, Sant�) ) :-
	!.
appliquer_d�( grele , (Or, Bl�, Population, Arm�e, Sant�),  (Or, Nouveau_Bl�, Population, Arm�e, Sant�) ) :-
	Nouveau_Bl� is Bl� - 1.

appliquer_d�( medicaments , (Or, Bl�, Population, Arm�e, 10),  (Or, Bl�, Population, Arm�e, 10) ) :-
	!.
appliquer_d�( medicaments , (Or, Bl�, Population, Arm�e, Sant�),  (Or, Bl�, Population, Arm�e, Nouvelle_Sant�) ) :-
	Nouvelle_Sant� is Sant� + 1.

demarrer_le_tour_de_jeu( (Or, Bl�, Population, Arm�e, Sant�) ,  (Or, Bl�, Nouvelle_Population, Arm�e, Nouvelle_Sant�) ) :-
	controler_le_bl�(Bl�, Sant�, Nouvelle_Sant�),
	controler_la_sant�(Sant�, Population, Nouvelle_Population).

controler_le_bl�(Bl�, 1, Nouvelle_Sant�) :-
	Bl� < 1,
	!,
	Nouvelle_Sant� is 0.
controler_le_bl�(Bl�, 0, Nouvelle_Sant�) :-
	Bl� < 3,
	!,
	Nouvelle_Sant� is 0.
controler_le_bl�(Bl�, Sant�, Nouvelle_Sant�) :-
	Bl� < 1,
	!,
	Nouvelle_Sant� is Sant� - 2.
controler_le_bl�(Bl�, Sant�, Nouvelle_Sant�) :-
	Bl� < 3,
	!,
	Nouvelle_Sant� is Sant� - 1.
controler_le_bl�(Bl�, 10, Nouvelle_Sant�) :-
	Bl� >= 8,
	!,
	Nouvelle_Sant� is 10.
controler_le_bl�(Bl�, Sant�, Nouvelle_Sant�) :-
	Bl� >= 8,
	!,
	Nouvelle_Sant� is Sant� + 1.
controler_le_bl�(_, Sant�, Sant�).

controler_la_sant�(Sant�, 1, Nouvelle_Population) :-
	Sant� < 2,
	!,
	Nouvelle_Population is 0.
controler_la_sant�(Sant�, 0, Nouvelle_Population) :-
	Sant� < 4,
	!,
	Nouvelle_Population is 0.
controler_la_sant�(Sant�, Population, Nouvelle_Population) :-
	Sant� < 2,
	!,
	Nouvelle_Population is Population - 2.
controler_la_sant�(Sant�, Population, Nouvelle_Population) :-
	Sant� < 4,
	!,
	Nouvelle_Population is Population - 1.
controler_la_sant�(Sant�, 10, Nouvelle_Population) :-
	Sant� > 8,
	!,
	Nouvelle_Population is 10.
controler_la_sant�(Sant�, Population, Nouvelle_Population) :-
	Sant� > 8,
	!,
	Nouvelle_Population is Population + 1.
controler_la_sant�(_, Population, Population).

la_cite_tombe((_, _, Population, _, _)) :-
	Population >= 10,
	writeln("Insurrection").
la_cite_tombe((_, _, Population, _, _)) :-
	Population =< 0,
	writeln("Il n'y a plus d'habitants").
la_cite_tombe((_, _, _, Arm�e, _)) :-
	Arm�e >= 10,
	writeln("Coup d'�tat!").

demarrer_le_jeu :-
	nouvelle_cit�(MaCit�),
	writeln(MaCit�),
	jouer(MaCit�).

jouer(Cit�) :-
	demarrer_le_tour_de_jeu(Cit�, Nouvelle_Cit�),
	la_cite_tombe(Nouvelle_Cit�),
	!,
	writeln(Nouvelle_Cit�),
	writeln("GAME OVER").
jouer(Cit�) :-
	demarrer_le_tour_de_jeu(Cit�, Cit�2),
	Resultat is random(6),
	face_de_d�(Resultat, Face),
	writeln(Face),
	appliquer_d�(Face, Cit�2, Nouvelle_Cit�),
	writeln(Nouvelle_Cit�),
	jouer(Nouvelle_Cit�).




