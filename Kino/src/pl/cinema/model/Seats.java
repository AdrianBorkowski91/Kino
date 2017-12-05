package pl.cinema.model;

import java.util.List;

public class Seats {

	private long idSeance;
	private List<Seat> listSeats;
	
	public Seats(){}

	public Seats(long idSeance, List<Seat> listSeats) {
		this.idSeance = idSeance;
		this.listSeats = listSeats;
	}

	public long getIdSeance() {
		return idSeance;
	}

	public void setIdSeance(long idSeance) {
		this.idSeance = idSeance;
	}

	public List<Seat> getListSeats() {
		return listSeats;
	}

	public void setListSeats(List<Seat> listSeats) {
		this.listSeats = listSeats;
	}

	@Override
	public String toString() {
		return "Seats [idSeance=" + idSeance + ", listSeats=" + listSeats + "]";
	}
	
}
