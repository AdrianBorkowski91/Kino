package pl.cinema.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import pl.cinema.model.Direction;
import pl.cinema.model.Film;
import pl.cinema.model.ObjectFilm;
import pl.cinema.util.ConnectionProvider;

public class FilmDAOImpl implements FilmDAO {
	
    private static String READ_FILMS = 
    		"SELECT id_film, name, duration, id_direction, description, trailer, picture FROM film;";
    
    private final static String READ_DIRECTION="SELECT id_direction, name FROM direction";
    private final static String READ_COUNTRIES="SELECT country.name, countries.id_film FROM country INNER JOIN countries ON country.id_country=countries.id_country;";
    private final static String READ_GENTRES="SELECT genre.name, genres.id_film FROM genre INNER JOIN genres ON genres.id_genre=genre.id_genre;";
    private final static String READ_SCENARIO="SELECT scenarist.name, scenario.id_film FROM scenarist INNER JOIN scenario ON scenarist.id_scenarist=scenario.id_scenarist;";
    
    private final static int COUNTRIES_METHOD=1;
    private final static int GENTRES_METHOD=2;
    private final static int SCENARIO_METHOD=3;
    
    private static List<Direction> directionList;
    private static List<ObjectFilm> countriesList;
    private static List<ObjectFilm> gentresList;
    private static List<ObjectFilm> scenarioList;

	private NamedParameterJdbcTemplate template;
		     
    public FilmDAOImpl() {
        template = new NamedParameterJdbcTemplate(ConnectionProvider.getDataSource());
        createLists();
    }
   
	@Override
	public List<Film> getAll() {
        List<Film> films = template.query(READ_FILMS, new FilmRowMapper());
        return films;
	}
	
	private void createLists(){
        directionList = template.query(READ_DIRECTION, new DirectionRowMapper());
        countriesList = template.query(READ_COUNTRIES, new ObjectFilmRowMapper());
        gentresList = template.query(READ_GENTRES, new ObjectFilmRowMapper());
        scenarioList = template.query(READ_SCENARIO, new ObjectFilmRowMapper());
	}
	
    private class DirectionRowMapper implements RowMapper<Direction> {
        public Direction mapRow(ResultSet resultSet, int rowNum) throws SQLException {
        	Direction direction= new Direction();
        	direction.setIdDirection(resultSet.getLong("id_direction"));
        	direction.setName(resultSet.getString("name"));
            return direction;
        }
    }
    
    private class ObjectFilmRowMapper implements RowMapper<ObjectFilm> {
        public ObjectFilm mapRow(ResultSet resultSet, int rowNum) throws SQLException {
        	ObjectFilm objectFilm= new ObjectFilm();
        	objectFilm.setIdFilm(resultSet.getLong("id_film"));
        	objectFilm.setName(resultSet.getString("name"));
            return objectFilm;
        }
    }
	
    private String getDirection(long idDirection){
    	String direction=null;
    	
    	for (Direction dir : directionList) {
			if(dir.getIdDirection()==idDirection)
				direction=dir.getName();
		}
    	return direction;
    }
    
    private String getObjectFilm(long idFilm, int method){
    	List<String> objectsFilm= new ArrayList<String>();

    	if(method==COUNTRIES_METHOD){
    		for (ObjectFilm object : countriesList) {
				if(object.getIdFilm()==idFilm){
					objectsFilm.add(object.getName());
				}
			}
    	}
    	else if(method==GENTRES_METHOD){
    		for (ObjectFilm object : gentresList) {
				if(object.getIdFilm()==idFilm){
					objectsFilm.add(object.getName());
				}
			}
    	}
    	else if(method==SCENARIO_METHOD){
    		for (ObjectFilm object : scenarioList) {
				if(object.getIdFilm()==idFilm){
					objectsFilm.add(object.getName());
				}
			}
    	}
    	
    	String param="";
    	for (int i=0; i<objectsFilm.size(); i++) {
			if(i!=(objectsFilm.size()-1))
				param+=objectsFilm.get(i)+", ";
			else
				param+=objectsFilm.get(i);
		}
    	
    return param;
    }
        
    private class FilmRowMapper implements RowMapper<Film> {
        @Override
        public Film mapRow(ResultSet resultSet, int row) throws SQLException {
        	Film film= new Film();
        	film.setIdFilm(resultSet.getLong("id_film"));
        	film.setName(resultSet.getString("name"));
        	film.setDuration(resultSet.getShort("duration"));
        	
        	long idDirection= resultSet.getLong("id_direction");
        	long idFilm= resultSet.getLong("id_film");
        	
        	film.setDirection(getDirection(idDirection));
        	System.out.println(film.getDirection());
        	
        	film.setCountries(getObjectFilm(idFilm, COUNTRIES_METHOD));
        	film.setGentres(getObjectFilm(idFilm, GENTRES_METHOD));
        	film.setScenario(getObjectFilm(idFilm, SCENARIO_METHOD));
        	
        	film.setDescription(resultSet.getString("description"));
        	film.setTrailer(resultSet.getString("trailer"));
        	film.setPicture(resultSet.getString("picture"));
        	return film;
        }

    }

	
}
