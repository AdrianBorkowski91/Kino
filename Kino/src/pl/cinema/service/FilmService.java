package pl.cinema.service;

import java.util.List;

import pl.cinema.model.Film;
import pl.cinema.dao.DAOFactory;
import pl.cinema.dao.FilmDAO;

public class FilmService {
	
	   public static List<Film> getAllFilms() {
	       DAOFactory factory = DAOFactory.getDAOFactory();
	       FilmDAO filmDao = factory.getFilmDAO();
	       List<Film> films = filmDao.getAll();
	       return films;
	   }	

}
