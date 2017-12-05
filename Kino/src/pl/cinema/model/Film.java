package pl.cinema.model;

public class Film {

	private long idFilm;
	private String name;
	private short duration;
	private String direction;
	private String scenario;
	private String gentres;
	private String countries;
	private String description;
	private String trailer;
	private String picture;
	
	public Film(){}

	public Film(long idFilm, String name, short duration, String direction, String scenario, String gentres,
			String countries, String description, String trailer, String picture) {
		this.idFilm = idFilm;
		this.name = name;
		this.duration = duration;
		this.direction = direction;
		this.scenario = scenario;
		this.gentres = gentres;
		this.countries = countries;
		this.description = description;
		this.trailer = trailer;
		this.picture = picture;
	}

	public long getIdFilm() {
		return idFilm;
	}

	public void setIdFilm(long idFilm) {
		this.idFilm = idFilm;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public short getDuration() {
		return duration;
	}

	public void setDuration(short duration) {
		this.duration = duration;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getScenario() {
		return scenario;
	}

	public void setScenario(String scenario) {
		this.scenario = scenario;
	}

	public String getGentres() {
		return gentres;
	}

	public void setGentres(String gentres) {
		this.gentres = gentres;
	}

	public String getCountries() {
		return countries;
	}

	public void setCountries(String countries) {
		this.countries = countries;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTrailer() {
		return trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Override
	public String toString() {
		return "Film [idFilm=" + idFilm + ", name=" + name + ", duration=" + duration + ", direction=" + direction
				+ ", scenario=" + scenario + ", gentres=" + gentres + ", countries=" + countries + ", description="
				+ description + ", trailer=" + trailer + ", picture=" + picture + "]";
	}

}
