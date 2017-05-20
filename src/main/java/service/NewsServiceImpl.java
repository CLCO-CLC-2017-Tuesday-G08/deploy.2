package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.NewsDao;
import model.Newcontent;


@Service("newsService")
@Transactional
public class NewsServiceImpl implements NewsService{

	@Autowired
	private NewsDao dao;

	public Newcontent findById(int id) {
		return dao.findById(id);
	}

	@Override
	public void saveNews(Newcontent news) {
		dao.save(news);
		
	}

	@Override
	public void updateNews(Newcontent news) {
		Newcontent entity = dao.findById(news.getId());
		if(entity!=null){
			entity.setTitle(news.getTitle());
			entity.setContent(news.getContent());
		}
		
	}

	@Override
	public void deleteNewByID(String ID) {
		dao.deleteById(ID);
		
	}

	@Override
	public boolean isNewIDUnique(Integer id) {
		Newcontent content = findById(id);
		return ( content == null || ((id != null) && (content.getId() == id)));
	}

	@Override
	public List<Newcontent> findAllNews() {
		return dao.findAllNews();
	}
	
}
