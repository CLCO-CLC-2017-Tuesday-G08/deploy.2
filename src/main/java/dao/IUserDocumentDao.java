package dao;

import java.util.List;

import model.UserDocument;

public interface IUserDocumentDao {
	 
    List<UserDocument> findAll();
     
    UserDocument findById(int id);
     
    void save(UserDocument document);
     
    List<UserDocument> findAllByUserId(int userId);
     
    void deleteById(int id);
}