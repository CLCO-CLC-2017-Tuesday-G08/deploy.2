package dao;

import java.util.List;

import model.Newcontent;;

public interface NewsDao {
	Newcontent findById(int id);
	
	void save(Newcontent news);

	void deleteById(String id);

	List<Newcontent> findAllNews();
}
