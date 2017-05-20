package dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import model.Newcontent;
import model.UserDocument;;

@Repository("newsDao")
public class NewsDaoImpl extends AbstractDao<Integer, Newcontent> implements NewsDao {

	public Newcontent findById(int id) {
		Newcontent conten= getByKey(id);
		return conten;
	}

	public Newcontent findByID(String id) {
		System.out.println("id : "+id);
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("id", id));
		Newcontent content = (Newcontent)crit.uniqueResult();
		return content;
	}

	@SuppressWarnings("unchecked")
	public List<Newcontent> findAllNews() {
	    Criteria crit = createEntityCriteria();
        return (List<Newcontent>)crit.list();
	}

	public void save(Newcontent content) {
		persist(content);
	}

	public void deleteById(String id) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("id", id));
		Newcontent content = (Newcontent)crit.uniqueResult();
		delete(content);
	}
}