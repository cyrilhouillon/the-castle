package castle.cite;

public abstract class Modificateur_de_Jauges {

	protected CheckMin il_n_y_a_pas_assez_de(Jauge jauge) {
		return new CheckMin(jauge.valeur);
	}

	protected void plus_un_de(Jauge jauge) {
		jauge.plus_un();
	}

	protected void moins_un_de(Jauge jauge) {
		jauge.moins_un();
	}

	protected class CheckMin {

		private int valeur;

		public CheckMin(int valeur) {
			this.valeur = valeur;
		}

		public boolean pour_enroler() {
			return checkValeurInferieureA(1);
		}

		private boolean checkValeurInferieureA(int seuil) {
			return valeur < seuil;
		}

	}

}
