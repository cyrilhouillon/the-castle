package castle.cite;

import castle.PasAssezDOr;
import castle.PasAssezDePopulation;

// impacts 

public class Cite extends Modificateur_de_Jauges {

	private static final boolean LA_CITE_NE_TOMBE_PAS = false;
	private static final boolean LA_CITE_TOMBE = true;
	
	public Jauge or = new Jauge();
	public Jauge ble = new Jauge();
	public Jauge sante = new Jauge();
	public Jauge population_civile = Jauge.necessaire_et_sensible();
	public Jauge armee = Jauge.sensible();

	public void recolte() {
		plus_un_de(ble);
	}

	public void commerce() {
		plus_un_de(or);
	}

	public void peste() {
		moins_un_de(sante);
	}

	public void grele() {
		moins_un_de(ble);
	}

	public void medicaments() {
		plus_un_de(sante);
	}

	public void enroler() throws PasAssezDOr, PasAssezDePopulation {
		if (il_n_y_a_pas_assez_de(or).pour_enroler()) {
			throw new PasAssezDOr();
		}
		if (pour_enroler_il_n_y_a_pas_assez_de(population_civile)) {
			throw new PasAssezDePopulation();
		}
		moins_un_de(or);
		moins_un_de(population_civile);
		plus_un_de(armee);
	}

	public void demarrer_le_tour_de_jeu(){
		if(sante.valeur < 4){
			moins_un_de(population_civile);
		}
		if(sante.valeur < 2){
			moins_un_de(population_civile);
		}
		if(ble.valeur < 3){
			moins_un_de(sante);
		}
		if(ble.valeur < 1){
			moins_un_de(sante);
		}
		if(ble.valeur >= 8){
			plus_un_de(sante);
		}
		if(sante.valeur > 8){
			plus_un_de(population_civile);
		}
	}
	
	public boolean la_cite_tombe() {
		if(il_n_y_a_plus_de(population_civile)){
			return LA_CITE_TOMBE;
		}
		if(il_a_une_insurrection_par(population_civile)){
			return LA_CITE_TOMBE;
		}
		if(il_a_une_insurrection_par(armee)){
			return LA_CITE_TOMBE;
		}
		return LA_CITE_NE_TOMBE_PAS;
	}

	private boolean il_a_une_insurrection_par(Jauge jauge) {
		return jauge.est_au_maximum();
	}

	private boolean il_n_y_a_plus_de(Jauge jauge) {
		return jauge.est_au_minimum();
	}

	private boolean pour_enroler_il_n_y_a_pas_assez_de(Jauge jauge) {
		return jauge.valeur < 1;
	}

}
