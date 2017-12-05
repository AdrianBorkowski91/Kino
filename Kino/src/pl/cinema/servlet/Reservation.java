package pl.cinema.servlet;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.cinema.email.Email;
import pl.cinema.model.Order;
import pl.cinema.model.Ticket;


@WebServlet("/Reservation")
public class Reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String name = "tickets-?-name";
	private static final String price = "tickets-?-price";
	private static final String row = "tickets-?-row";
	private static final String seat = "tickets-?-seat";

    public Reservation() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String seanceFilmTitle= request.getParameter("seance-filmTitle");
		String seanceTimeStart= request.getParameter("seance-timeStart");
		String seanceDate= request.getParameter("seance-date");
		String clientFirstname=request.getParameter("client-firstname"); 
		String clientLastname=request.getParameter("client-lastname"); 	
		String clientEmail=request.getParameter("client-email");  
		String clientNumberPhone=request.getParameter("client-numberPhone"); 
		
		Order order= new Order(seanceFilmTitle, seanceTimeStart, seanceDate, clientFirstname, clientLastname, clientEmail, clientNumberPhone); 
		
		int i=1;
		
		boolean check=true;
		
		while(check){
			String nameParam= name.replace("?", ""+i);
			String priceParam= price.replace("?", ""+i);
			String rowParam= row.replace("?", ""+i);
			String seatParam= seat.replace("?", ""+i);
			
			String name= request.getParameter(nameParam);
			String price= request.getParameter(priceParam);
			String row= request.getParameter(rowParam);
			String seat=request.getParameter(seatParam); 
			
			if(name==null && price==null && row==null && seat==null){
				check=false;
			}
			else{
				Ticket ticket = new Ticket(name, price, row, seat);
				order.setTicket(ticket);
			}
			i++;
		}

		Email em= new Email(order);
		
		try {
			em.sendFromGMail();
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("repertory.jsp");
		
	}

}
