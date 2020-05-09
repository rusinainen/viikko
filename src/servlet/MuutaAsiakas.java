/*package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Asiakas;


@WebServlet("/MuutaAsiakas")
public class MuutaAsiakas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MuutaAsiakas() {
        super();
        System.out.println("MuutaAsiakas.MuutaAsiakas()");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MuutaAsiakas.doGet()");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MuutaAsiakas.doPost()");
		int uusiasiakas_id = Integer.parseInt(request.getParameter("uusiasiakas_id"));
		int vanhaasiakas_id = Integer.parseInt(request.getParameter("vanhaasiakas_id"));
		String etunimi = request.getParameter("etunimi");
		String sukunimi = request.getParameter("sukunimi");
		String puhelin = request.getParameter("puhelin");
		String sposti = request.getParameter("sposti");
		PrintWriter out = response.getWriter(  );
	    response.setContentType("text/html"); 
		try {
			Asiakas asiakas = new Asiakas(uusiasiakas_id, etunimi, sukunimi, puhelin, sposti);
			Dao dao = new Dao();			
			if(dao.muutaAsiakas(asiakas, vanhaasiakas_id)) {
				 out.println(1);  //Päivitys onnistui	
			}else {
				 out.println(0);  //Päivitys epäonnistui	
			}   
		} catch (Exception e) {
			out.println(0);		  //Päivitys epäonnistui, koska vuosi ei ollut luku
		}
		
	}
}

*/
