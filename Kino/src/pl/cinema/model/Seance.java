package pl.cinema.model;

import java.sql.Time;

public class Seance {
	
	private long idSeance;
	private long idFilm;
	private short day;
	private Time timeStart;
	
	public Seance(){}

	public Seance(long idSeance, long idFilm, short day, Time timeStart) {
		this.idSeance = idSeance;
		this.idFilm = idFilm;
		this.day = day;
		this.timeStart = timeStart;
	}

	public long getIdSeance() {
		return idSeance;
	}

	public void setIdSeance(long idSeance) {
		this.idSeance = idSeance;
	}

	public long getIdFilm() {
		return idFilm;
	}

	public void setIdFilm(long idFilm) {
		this.idFilm = idFilm;
	}

	public short getDay() {
		return day;
	}

	public void setDay(short day) {
		this.day = day;
	}

	public Time getTimeStart() {
		return timeStart;
	}

	public void setTimeStart(Time timeStart) {
		this.timeStart = timeStart;
	}

	@Override
	public String toString() {
		return "Seance [idSeance=" + idSeance + ", idFilm=" + idFilm + ", day=" + day + ", timeStart=" + timeStart
				+ "]";
	}
	
}
