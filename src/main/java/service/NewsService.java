package service;

import java.util.List;

import model.Newcontent;


public interface NewsService {
	
	Newcontent findById(int id);
	
	void saveNews(Newcontent news);
	
	void updateNews(Newcontent news);
	
	void deleteNewByID(String ID);

	List<Newcontent> findAllNews(); 
	
	boolean isNewIDUnique(Integer id);

}