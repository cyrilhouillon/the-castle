package castle.jeu.de;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

public class De {
	
	private final List<FaceDeDe> faces;
	private final Random r;

	public De(Random random) {
		r = random;
		faces = Arrays.asList(FaceDeDe.values());
		faces.add(FaceDeDe.PESTE);
	}

	public FaceDeDe lancerLeDe(){
		return faces.get(face_au_hasard());
	}

	private int face_au_hasard() {
		return r.nextInt(6);
	}
}
