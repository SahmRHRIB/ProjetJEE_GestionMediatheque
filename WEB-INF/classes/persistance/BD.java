package persistance;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mediatheque.EmpruntException;

public class BD {
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static String login = "system";
	private static String mdp = "test";
	private static Connection con = null;
	private static PreparedStatement listdocs, GetUser, getDocument, nouveaudoc, retournerdoc, emprunterDoc, estBiblio,
			numDocsuivant, estEmp;
	@SuppressWarnings("unused")
	private static BD acc = null;

	static {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, login, mdp);
			retournerdoc = con.prepareStatement("UPDATE DOCUMENT SET Emprunte=0 WHERE NumDoc = ? ");
			estEmp = con.prepareStatement("Select Emprunte from document where NumDoc = ?");
			listdocs = con.prepareStatement("SELECT * FROM Document");
			GetUser = con.prepareStatement("SELECT * FROM users where login = ? AND password = ?");
			getDocument = con.prepareStatement("SELECT * FROM Document where NumDoc = ? ");
			nouveaudoc = con
					.prepareStatement("INSERT INTO Document(NumDoc,TypeDoc,Titre,Auteur,Emprunte) VALUES (?,?,?,?,?)");
			estBiblio = con.prepareStatement("Select typeuser from users where login =? and password=? ");
			numDocsuivant = con.prepareStatement("select seq_document.NEXTVAL from dual");// Acceder a la valeur nextVal
																							// de la sequence SQL
			emprunterDoc = con.prepareStatement("UPDATE DOCUMENT SET Emprunte=1 WHERE NumDoc = ? ");

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	private BD() {
	}

	public static BD getInstance() {
		return acc = new BD();
	}

	public ResultSet getlistdocs() {
		try {
			return listdocs.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public ResultSet getUser(String login, String password) {
		try {
			GetUser.setString(1, login);
			GetUser.setString(2, password);
			return GetUser.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public ResultSet getDoc(int i) {
		try {
			getDocument.setInt(1, i);
			return getDocument.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	private static int nextvalDoc() throws SQLException {
		int numdoc = 0;
		ResultSet num = numDocsuivant.executeQuery();
		if (num.next()) {
			numdoc = num.getInt("NEXTVAL");
		}
		return numdoc;
	}

	public static void newDoc(int i, Object[] args) {
		try {
			int numdoc = nextvalDoc();
			nouveaudoc.setInt(1, numdoc);
			nouveaudoc.setInt(2, i);
			nouveaudoc.setString(3, (String) args[0]);
			nouveaudoc.setString(4, (String) args[1]);
			nouveaudoc.setString(5, "1");
			nouveaudoc.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void emprunter(int numDoc) throws EmpruntException {
		try {
			estEmp.setInt(1, numDoc);
			ResultSet res = estEmp.executeQuery();
			int bool = 0;
			if (res.next()) {
				bool = Integer.parseInt(res.getString("Emprunte"));
			}
			if (bool == 1) {
				throw new EmpruntException();
			}
			emprunterDoc.setInt(1, numDoc);
			emprunterDoc.executeUpdate();
		} catch (SQLException e) {
			throw new EmpruntException();
		}
	}

	public static boolean estBiblio(String login, String password) throws Exception {
		try {
			estBiblio.setString(1, login);
			estBiblio.setString(2, password);
			ResultSet res = estBiblio.executeQuery();
			Integer type = null;
			boolean biblio;
			if (res.next()) {
				type = res.getInt("typeuser");
			}
			switch (type) {
			case 0:
				biblio = false;
				break;
			case 1:
				biblio = true;
				break;
			default:
				throw new Exception("Problem null isBiblio");
			}
			return biblio;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static void retour(int numDoc) {
		try {
			retournerdoc.setInt(1, numDoc);
			retournerdoc.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void finalize() throws Throwable {
		con.close();
		super.finalize();
	}

}
