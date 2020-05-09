/*package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;

@WebServlet("/PoistaAsiakas")
public class PoistaAsiakas extends HttpServlet {
	private static final long serialVersionUID = 1L;
          
    public PoistaAsiakas() {
        super();
        System.out.println("PoistaAsiakas.PoistaAsiakas()");
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PoistaAsiakas.doGet()");		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PoistaAsiakas.doPost()");
		String asiakas_id = request.getParameter("asiakas_id");
		int asiakas = Integer.parseInt(asiakas_id);
		Dao dao = new Dao();
		PrintWriter out = response.getWriter(  );
	    response.setContentType("text/html"); 
		if(dao.poistaAsiakas(asiakas)) {
			out.println(1); // onnistui
		}else {
			out.println(0); //epäonnistui
		}
	}
}
*/