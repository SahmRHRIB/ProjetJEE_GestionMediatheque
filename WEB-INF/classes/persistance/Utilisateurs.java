package persistance;

import mediatheque.Utilisateur;

public class Utilisateurs implements Utilisateur {

	private String login;
	private String password;

	public Utilisateurs(String login, String password) {
		this.login = login;
		this.password = password;
	}

	@Override
	public boolean isBibliothecaire() {
		try {
			return BD.estBiblio(this.login, this.password);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
