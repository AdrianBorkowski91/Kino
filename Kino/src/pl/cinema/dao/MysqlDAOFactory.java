package pl.cinema.dao;

public class MysqlDAOFactory extends DAOFactory {

	@Override
	public FilmDAO getFilmDAO() {
		return new FilmDAOImpl();
	}

	@Override
	public SeanceDAO getSeanceDAO() {
		return new SeanceDAOImpl();
	}
 

}