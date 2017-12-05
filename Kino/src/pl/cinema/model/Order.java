package pl.cinema.model;

import java.util.ArrayList;
import java.util.List;

public class Order {

	private String filmTitle;
	private String timeStart;
	private String date;
	private String clientFirstname;
	private String clientLastname;
	private String clientEmail;
	private String clientNumberPhone;
	private List<Ticket> listTickets;
	
	public Order(String filmTitle, String timeStart, String date, String clientFirstname, String clientLastname,
			String clientEmail, String clientNumberPhone) {
		this.filmTitle = filmTitle;
		this.timeStart = timeStart;
		this.date = date;
		this.clientFirstname = clientFirstname;
		this.clientLastname = clientLastname;
		this.clientEmail = clientEmail;
		this.clientNumberPhone = clientNumberPhone;
		listTickets= new ArrayList<Ticket>();
	}

	public String getFilmTitle() {
		return filmTitle;
	}

	public void setFilmTitle(String filmTitle) {
		this.filmTitle = filmTitle;
	}

	public String getTimeStart() {
		return timeStart;
	}

	public void setTimeStart(String timeStart) {
		this.timeStart = timeStart;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getClientFirstname() {
		return clientFirstname;
	}

	public void setClientFirstname(String clientFirstname) {
		this.clientFirstname = clientFirstname;
	}

	public String getClientLastname() {
		return clientLastname;
	}

	public void setClientLastname(String clientLastname) {
		this.clientLastname = clientLastname;
	}

	public String getClientEmail() {
		return clientEmail;
	}

	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}

	public String getClientNumberPhone() {
		return clientNumberPhone;
	}

	public void setClientNumberPhone(String clientNumberPhone) {
		this.clientNumberPhone = clientNumberPhone;
	}

	public List<Ticket> getListTickets() {
		return listTickets;
	}

	public void setTicket(Ticket ticket) {
		listTickets.add(ticket);
	}

	@Override
	public String toString() {
		return "Order [filmTitle=" + filmTitle + ", timeStart=" + timeStart + ", date=" + date + ", clientFirstname="
				+ clientFirstname + ", clientLastname=" + clientLastname + ", clientEmail=" + clientEmail
				+ ", clientNumberPhone=" + clientNumberPhone + ", listTickets=" + listTickets + "]";
	}
	
}
