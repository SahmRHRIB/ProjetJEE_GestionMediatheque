package persistance;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mediatheque.Document;
import mediatheque.Mediatheque;
import mediatheque.PersistentMediatheque;
import mediatheque.Utilisateur;

// classe mono-instance  dont l'unique instance n'est connue que de la bibliotheque
// via une auto-déclaration dans son bloc static

public class MediathequeData implements PersistentMediatheque {
// Jean-François Brette 01/01/2018
	private static BD acc;
	static {
		Mediatheque.getInstance().setData(new MediathequeData());
		acc = BD.getInstance();
	}

	private MediathequeData() {
	}

	// renvoie la liste de tous les documents de la bibliothèque
	@Override
	public List<Document> tousLesDocuments() {
		try {
			ResultSet doc = acc.getlistdocs();
			List<Document> list = new ArrayList<Document>();
			while (doc.next()) {
				int val = doc.getInt("typedoc");
				Object[] obj = new Object[2];
				obj[0] = doc.getString("titre");
				obj[1] = doc.getString("auteur");
				switch (val) {
				case 1:
					list.add(new DVD(doc.getInt("NumDoc"), obj));
					break;
				case 2:
					list.add(new CD(doc.getInt("NumDoc"), obj));
					break;
				case 3:
					list.add(new Livre(doc.getInt("NumDoc"), obj));
					break;
				}
			}
			return list;
		} catch (Exception e) {
			return null;
		}
	}

	// va récupérer le User dans la BD et le renvoie
	// si pas trouvé, renvoie null
	@Override
	public Utilisateur getUser(String login, String password) {
		try {
			ResultSet user = acc.getUser(login, password);
			if (user.next()) {
				return new Utilisateurs(user.getString("login"), user.getString("password"));
			} else {
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	// va récupérer le document de numéro numDocument dans la BD
	// et le renvoie
	// si pas trouvé, renvoie null
	@Override
	public Document getDocument(int numDocument) {
		try {
			ResultSet res = acc.getDoc(numDocument);
			Document doc = null;
			while (res.next()) {
				int numdoc = res.getInt("NumDoc");
				int type = res.getInt("TypeDoc");
				Object[] obj = new Object[2];
				obj[0] = res.getString("titre");
				obj[1] = res.getString("auteur");
				switch (type) {
				case 1:
					doc = new CD(numdoc, obj);
					break;
				case 2:
					doc = new DVD(numdoc, obj);
					break;
				case 3:
					doc = new Livre(numdoc, obj);
					break;
				}
			}
			return doc;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void nouveauDocument(int type, Object... args) {
		BD.newDoc(type, args);
	}

}
