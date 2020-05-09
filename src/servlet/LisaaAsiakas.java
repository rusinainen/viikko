package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.Dao;
import model.Asiakas;

@WebServlet ("/LisaaAsiakas")
public class LisaaAsiakas extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public LisaaAsiakas() {
		super();
		System.out.println("LisaaAsiakas.LisaaAsiakas()");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LisaaAsiakas.doGet()");
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LisaaAsiakas.doPost()");
		Asiakas asiakas = new Asiakas();
		asiakas.setAsiakas_id(Integer.parseInt(request.getParameter("asiakas_id")));
		asiakas.setEtunimi(request.getParameter("etunimi"));
		asiakas.setSukunimi(request.getParameter("sukunimi"));
		asiakas.setPuhelin(request.getParameter("puhelin"));
		asiakas.setSposti(request.getParameter("sposti"));
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			Dao dao = new Dao();
			if (dao.lisaaAsiakas(asiakas)) {
				out.print(1); //Asiakkaan lis‰‰minen onnistui
			}else{
				out.print(0); //Ep‰onnistui
			}
		
		} catch (Exception e) {
			out.print(0); //Asiakkaan lis‰‰minen ep‰onnistui, koska asiakas_id ei ollut luku
		}
	}
}
