package castle.jeu;

import java.util.List;

import castle.PasAssezDOr;
import castle.PasAssezDePopulation;
import castle.cite.Cite;
import castle.jeu.carte.Carte;
import castle.jeu.de.De;
import castle.jeu.de.FaceDeDe;

public class TourDeJeu {
	
	private final Cite cite_du_joueur;
	private final De de;
	private final int nombre_de_joueurs;
	private List<Carte> cartes_piochees;

	public TourDeJeu(Cite cite_du_joueur, De de, int nombre_de_joueurs) {
		this.cite_du_joueur = cite_du_joueur;
		this.de = de;
		this.nombre_de_joueurs = nombre_de_joueurs;
		
		this.cite_du_joueur.demarrer_le_tour_de_jeu();
	}
	
	public void lancer_le_de(){
		FaceDeDe resultat_du_de = de.lancerLeDe();
		switch (resultat_du_de) {
		case COMMERCE:
			cite_du_joueur.commerce();
			break;
		case GRELE:
			cite_du_joueur.grele();
			break;
		case MEDICAMENTS:
			cite_du_joueur.medicaments();
			break;
		case PESTE:
			cite_du_joueur.peste();
			break;
		case RECOLTE:
			cite_du_joueur.recolte();
			break;
		default:
			break;
		}
	}
	
	public void enroler(boolean le_joueur_veut_enroler) throws PasAssezDOr, PasAssezDePopulation{
		if(le_joueur_veut_enroler){
			cite_du_joueur.enroler();
		}
	}
	
	public void piocher_les_cartes(){
		
	}

}
