package pl.cinema.model;

public class Ticket {
	
	private String name;
	private String price;
	private String row;
	private String seat;
	
	public Ticket(){}
	
	public Ticket(String name, String price, String row, String seat) {
		this.name = name;
		this.price = price;
		this.row = row;
		this.seat = seat;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getRow() {
		return row;
	}

	public void setRow(String row) {
		this.row = row;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	@Override
	public String toString() {
		return "Ticket [name=" + name + ", price=" + price + ", row=" + row + ", seat=" + seat + "]";
	}
}
