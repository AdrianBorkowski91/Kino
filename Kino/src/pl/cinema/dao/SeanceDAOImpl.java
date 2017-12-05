package pl.cinema.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import pl.cinema.model.Seance;
import pl.cinema.util.ConnectionProvider;

public class SeanceDAOImpl implements SeanceDAO {

	
    private static String READ_SEANCES = 
    		"SELECT id_seance, id_film, day, start_time FROM seance;";
    

	private NamedParameterJdbcTemplate template;
		     
    public SeanceDAOImpl() {
        template = new NamedParameterJdbcTemplate(ConnectionProvider.getDataSource());
        getAll();
    }
   
	@Override
	public List<Seance> getAll() {
		List<Seance> seance = template.query(READ_SEANCES, new SeanceRowMapper());
		return seance;
	}
	
    private class SeanceRowMapper implements RowMapper<Seance> {
        @Override
        public Seance mapRow(ResultSet resultSet, int row) throws SQLException {
        	Seance seance= new Seance(); 	
        	seance.setIdSeance(resultSet.getLong("id_seance"));
        	seance.setIdFilm(resultSet.getLong("id_film"));
        	seance.setDay(resultSet.getShort("day"));
        	seance.setTimeStart(resultSet.getTime("start_time"));
        	
        	return seance;
        }

    }


}
