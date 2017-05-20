package service;

import java.util.List;

import model.UserDocument;

public interface IUserDocumentService {
	  UserDocument findById(int id);
	  
	    List<UserDocument> findAll();
	     
	    List<UserDocument> findAllByUserId(int id);
	     
	    void saveDocument(UserDocument document);
	     
	    void deleteById(int id);
}
