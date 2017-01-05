package castle.cite;

import castle.ValeurMaximaleAtteinte;
import castle.ValeurMinimaleAtteinte;

public class Jauge {
	
	protected final int valeur_minimale = 0;
	protected final int valeur_maximale = 10;
	protected final int valeur_initiale = 5;

	private final boolean est_necessaire;
	private final boolean est_limite;
	protected int valeur;
	
	public static Jauge necessaire() {
		return new Jauge(true, false);
	}

	public static Jauge sensible() {
		return new Jauge(false, true);
	}

	public static Jauge necessaire_et_sensible() {
		return new Jauge(true, true);
	}

	public Jauge() {
		this(false, false);
	}

	public Jauge(boolean est_necessaire, boolean est_limite) {
		valeur = valeur_initiale;
		this.est_necessaire=est_necessaire;
		this.est_limite=est_limite;
	}

	public void plus_un() {
		if(valeur < valeur_maximale){
			valeur = valeur + 1;
		}
		if(est_limite && est_au_maximum()){
			throw new ValeurMaximaleAtteinte();
		}
	}

	public void moins_un() {
		if(valeur > valeur_minimale){
			valeur = valeur - 1;
		}
		if(est_necessaire && est_au_minimum()){
			throw new ValeurMinimaleAtteinte();
		}
	}

	public boolean est_au_maximum() {
		return valeur == valeur_maximale;
	}

	public boolean est_au_minimum() {
		return valeur == valeur_minimale;
	}

}
