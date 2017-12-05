package pl.cinema.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import pl.cinema.model.Film;
import pl.cinema.model.Seance;
import pl.cinema.model.Seats;
import pl.cinema.seats.SeatsCreator;
import pl.cinema.service.FilmService;
import pl.cinema.service.SeanceService;

@WebFilter("/*")
public class Filter implements javax.servlet.Filter {

    public Filter() {
  
    }

	public void destroy() {
	
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	
    	HttpServletRequest req=(HttpServletRequest)request;
    	
    	if(req.getSession().getAttribute("listFilm")==null && req.getSession().getAttribute("listSeance")==null){
    		
    		List<Film> listFilm= FilmService.getAllFilms();
    		req.getSession().setAttribute("listFilm", listFilm);
    		List<Seance> listSeance= SeanceService.getAllSeances();
    		req.getSession().setAttribute("listSeance", listSeance);
    		
    		List<Seats> listSeat= SeatsCreator.getAllSeats(listSeance);
    		req.getSession().setAttribute("listSeat", listSeat);
    		
    		System.out.println("Sesja została utworzona. Lista filmów została sporządzona.");
    	}
    	chain.doFilter(request, response);
        	
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
