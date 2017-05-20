package dao;

import java.util.List;

import model.User;

public interface IUserDao {
	User findById(int id);

	User findBySSO(String sso);

	void save(User user);

	void deleteBySSO(String sso);

	List<User> findAllUsers();
}
