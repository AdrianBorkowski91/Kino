package pl.cinema.service;

import java.util.List;

import pl.cinema.dao.DAOFactory;
import pl.cinema.dao.SeanceDAO;
import pl.cinema.model.Seance;

public class SeanceService {
	
	   public static List<Seance> getAllSeances() {
	       DAOFactory factory = DAOFactory.getDAOFactory();
	       SeanceDAO seanceDao = factory.getSeanceDAO();
	       List<Seance> seances = seanceDao.getAll();
	       return seances;
	   }	
}
