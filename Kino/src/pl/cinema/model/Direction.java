package pl.cinema.model;

public class Direction {
	
	private long idDirection;
	private String name;
	
	public Direction(){}
	
	public Direction(long idDirection, String name) {
		this.idDirection = idDirection;
		this.name = name;
	}

	public long getIdDirection() {
		return idDirection;
	}

	public void setIdDirection(long idDirection) {
		this.idDirection = idDirection;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Direction [idDirection=" + idDirection + ", name=" + name + "]";
	}
	
	
}
