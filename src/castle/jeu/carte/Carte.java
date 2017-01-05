package castle.jeu.carte;

import java.util.function.Function;

import castle.cite.Cite;

public enum Carte {

	GRENIER(cite -> {
		cite.ble = new Grenier(cite.ble);
		return cite;
	}), //
	UNE_BONNE_GUERRE(cite -> {

		return cite;
	}), //
	POSTE_AVANCE(cite -> {

		return cite;
	}), //
	ALLEGEANCE(cite -> {

		return cite;
	}), //
	HOPITAL(cite -> {

		return cite;
	}), //
	INCENDIE(cite -> {

		return cite;
	}), //
	INVASION_BARBARE(cite -> {

		return cite;
	}), //
	GUERRE_CIVILE(cite -> {

		return cite;
	}), //
	TERRE_D_ACCUEIL(cite -> {

		return cite;
	});

	private Function<Cite, Cite> action;

	private Carte(Function<Cite, Cite> action) {
		this.action = action;
	}
}
