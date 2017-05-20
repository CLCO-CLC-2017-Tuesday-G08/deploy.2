package service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.IUserDocumentDao;
import model.UserDocument;

@Service("userDocumentService")
@Transactional
public class UserDocumentServiceImpl implements IUserDocumentService{

   @Autowired
   IUserDocumentDao dao;

   public UserDocument findById(int id) {
       return dao.findById(id);
   }

   public List<UserDocument> findAll() {
       return dao.findAll();
   }

   public List<UserDocument> findAllByUserId(int userId) {
       return dao.findAllByUserId(userId);
   }
    
   public void saveDocument(UserDocument document){
       dao.save(document);
   }

   public void deleteById(int id){
       dao.deleteById(id);
   }
    
}