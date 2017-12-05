package pl.cinema.seats;

import java.util.ArrayList;
import java.util.List;

import pl.cinema.model.Seance;
import pl.cinema.model.Seat;
import pl.cinema.model.Seats;

public class SeatsCreator {

	public static List<Seats> getAllSeats(List<Seance> listSeance){
		List<Seats> seatAllReserved= new ArrayList<Seats>();
		
		for (Seance seance : listSeance) {
			long idSeance= seance.getIdSeance();
			
			List<Seat> seatAllOption= getAllSeatOption();
			List<Seat> seatAll= new ArrayList<Seat>();
			
			int maxIndex= seatAllOption.size()-1;			
			int quantity= (int)(Math.random()*maxIndex);

			for(int i=1; i<=quantity; i++){
				int drawSeat= (int)(Math.random()*maxIndex);
				seatAll.add(seatAllOption.get(drawSeat));
				
				seatAllOption.remove(drawSeat);
				maxIndex--;
			}
			Seats seats= new Seats(idSeance, seatAll);
			seatAllReserved.add(seats);
		}
		
		return seatAllReserved;
	}

	private static List<Seat> getAllSeatOption(){
		List<Seat> seatAll= new ArrayList<Seat>();
		
		for (int row=1; row<=10; row++){
			for (int seat=1; seat<=25; seat++){
				Seat s= new Seat(row, seat);
				seatAll.add(s);
			}
		}	
		return seatAll;
	}
	
}
