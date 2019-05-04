package services;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

@SuppressWarnings("serial")
public class LoadBD extends HttpServlet {

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println(
				"**************************************************************************\n*****************************************");
		try {
			Class.forName("persistance.MediathequeData");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		super.init(config);
	}
}
