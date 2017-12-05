package pl.cinema.model;

public class ObjectFilm {
	
	private long idFilm;
	private String name;
	
	public ObjectFilm(){}
	
	public ObjectFilm(long idFilm, String name) {
		this.idFilm = idFilm;
		this.name = name;
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

	@Override
	public String toString() {
		return "ObjectFilm [idFilm=" + idFilm + ", name=" + name + "]";
	}


}
