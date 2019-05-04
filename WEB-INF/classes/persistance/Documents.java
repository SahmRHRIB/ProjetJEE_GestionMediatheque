package persistance;

import mediatheque.Document;
import mediatheque.EmpruntException;
import mediatheque.Utilisateur;

public abstract class Documents implements Document {
	private Object[] args;
	private int id;

	public Documents(int id, Object[] args) {
		this.args = args;
		this.id = id;
	}

	@Override
	public Object[] affiche() {
		Object[] arg = { id, this.getClass().getSimpleName(), args[0], args[1] };// Ajouter arguments ici
		return arg;
	}

	public int getId() {
		return id;
	}

	@Override
	public void retour() {
		BD.retour(this.id);
	}

	@Override
	public void emprunter(Utilisateur arg0) throws EmpruntException {
		BD.emprunter(this.id);
	}

	@Override
	public String toString() {
		String s = "";
		for (Object o : args) {
			s += o + "\t";
		}
		return s;
	}

}
