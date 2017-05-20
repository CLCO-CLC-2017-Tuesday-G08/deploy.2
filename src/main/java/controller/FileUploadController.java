package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.boot.autoconfigure.condition.ConditionalOnResource;
import org.springframework.context.MessageSource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.NewsService;
import service.NewsServiceImpl;
import service.IUserDocumentService;
import service.IUserService;
import model.FileBucket;
import model.UserDocument;
import util.FileValidator;
import model.User;
import model.Newcontent;
import hello.StorageFileNotFoundException;
import hello.StorageService;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
public class FileUploadController {

   private final StorageService storageService;
	@Autowired
	NewsService newsService;
	@Autowired
	IUserService userService;
	
	@Autowired
	IUserDocumentService userDocumentService;
	
	@Autowired
	MessageSource messageSource;

	@Autowired
	FileValidator fileValidator; 
	
    @Autowired
    public FileUploadController( StorageService storageService) {
        this.storageService = storageService;
    }
    @InitBinder("fileBucket")
	protected void initBinder(WebDataBinder binder) {
	   binder.setValidator(fileValidator);
	}
    

    @GetMapping("/up")
    public String listUploaded(Model model) throws IOException {
    	  model.addAttribute("files", storageService
                  .loadAll()
                  .map(path ->
                          MvcUriComponentsBuilder
                                  .fromMethodName(FileUploadController.class, "serveFile", path.getFileName().toString())
                                  .build().toString())
                  .collect(Collectors.toList()));

          return "thymeleaf/uploadForm";
    }
   
/*    @GetMapping("/sub")
    public String showHcmute(Model model) throws IOException {
        return "hcmute";
    }   */
       
     @GetMapping("/files/{filename:.+}")
    @ResponseBody
    public ResponseEntity<Resource> serveFile(@PathVariable String filename) {

        Resource file = storageService.loadAsResource(filename);
        return ResponseEntity
                .ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\""+file.getFilename()+"\"")
                .body(file);
    }
   
    @PostMapping("/")
    public String handleFileUpload(@RequestParam("file") MultipartFile file,
                                   RedirectAttributes redirectAttributes) {

        storageService.store(file);
        redirectAttributes.addFlashAttribute("message",
                "You successfully uploaded " + file.getOriginalFilename() + "!");

        return "redirect:/";
    }

    @ExceptionHandler(StorageFileNotFoundException.class)
    public ResponseEntity handleStorageFileNotFound(StorageFileNotFoundException exc) {
        return ResponseEntity.notFound().build();
    }
    @RequestMapping(value = { "/", "/demo" }, method = RequestMethod.GET)
 	public String listNews(ModelMap model) {
		List<Newcontent> news = newsService.findAllNews();
 		model.addAttribute("news", news);
 		return "jsp/index";
 	}
    @RequestMapping(value = { "/news-{Id}" }, method = RequestMethod.GET)
   	public String ListNews(@PathVariable String Id, ModelMap model) {
   		Integer idnews = Integer.parseInt(Id);
   		Newcontent newlist = newsService.findById(idnews);
   		model.addAttribute("newlist", newlist);
   		
   		List<Newcontent> news = newsService.findAllNews();
    		model.addAttribute("news", news);
   		return "jsp/NewsIfo";
   	}
    @RequestMapping(value = { "/newscontent" }, method = RequestMethod.GET)
	public String newsContent(ModelMap model) {
		Newcontent newlist = new Newcontent();
		model.addAttribute("newlist", newlist);
		List<Newcontent> news = newsService.findAllNews();
 		model.addAttribute("news", news);
		model.addAttribute("edit", false);
		return "jsp/index2";
	}
   
	@RequestMapping(value = { "/newscontent" }, method = RequestMethod.POST)
	public String saveNews(Newcontent news, BindingResult result,
			ModelMap model) {

		if (result.hasErrors()) {
			return "jsp/index";
		}

		newsService.saveNews(news);
		
		model.addAttribute("news", news);
		model.addAttribute("success", " comit successfully");
		//return "success";
		return "jsp/index2";
	}
	 @RequestMapping(value = { "/newscontent1" }, method = RequestMethod.GET)
		public String newsContent1(ModelMap model) {
			Newcontent newlist = new Newcontent();
			model.addAttribute("newlist", newlist);
			List<Newcontent> news = newsService.findAllNews();
	 		model.addAttribute("news", news);
			model.addAttribute("edit", false);
			return "jsp/index";
		}
	   
		@RequestMapping(value = { "/newscontent1" }, method = RequestMethod.POST)
		public String saveNews1(Newcontent news, BindingResult result,
				ModelMap model) {

			if (result.hasErrors()) {
				return "jsp/index";
			}

			newsService.saveNews(news);
			
			model.addAttribute("news", news);
			model.addAttribute("success", " comit successfully");
			//return "success";
			return "jsp/index";
		}
		@RequestMapping(value = { "/newscontent2" }, method = RequestMethod.GET)
		public String newsContent2(ModelMap model) {
			Newcontent newlist = new Newcontent();
			model.addAttribute("newlist", newlist);
			List<Newcontent> news = newsService.findAllNews();
	 		model.addAttribute("news", news);
			model.addAttribute("edit", false);
			return "jsp/indexb404";
		}
	   
		@RequestMapping(value = { "/newscontent2" }, method = RequestMethod.POST)
		public String saveNews2(Newcontent news, BindingResult result,
				ModelMap model) {

			if (result.hasErrors()) {
				return "jsp/index";
			}

			newsService.saveNews(news);
			
			model.addAttribute("news", news);
			model.addAttribute("success", " comit successfully");
			//return "success";
			return "jsp/indexb404";
		}
		@RequestMapping(value = { "/newscontent3" }, method = RequestMethod.GET)
		public String newsContent3(ModelMap model) {
			Newcontent newlist = new Newcontent();
			model.addAttribute("newlist", newlist);
			List<Newcontent> news = newsService.findAllNews();
	 		model.addAttribute("news", news);
			model.addAttribute("edit", false);
			return "jsp/indexd478";
		}
	   
		@RequestMapping(value = { "/newscontent3" }, method = RequestMethod.POST)
		public String saveNews3(Newcontent news, BindingResult result,
				ModelMap model) {

			if (result.hasErrors()) {
				return "jsp/index";
			}

			newsService.saveNews(news);
			
			model.addAttribute("news", news);
			model.addAttribute("success", " comit successfully");
			//return "success";
			return "jsp/indexd478";
		}
		@RequestMapping(value = { "/newscontent4" }, method = RequestMethod.GET)
		public String newsContent4(ModelMap model) {
			Newcontent newlist = new Newcontent();
			model.addAttribute("newlist", newlist);
			List<Newcontent> news = newsService.findAllNews();
	 		model.addAttribute("news", news);
			model.addAttribute("edit", false);
			return "jsp/indexa8ef";
		}
	   
		@RequestMapping(value = { "/newscontent4" }, method = RequestMethod.POST)
		public String saveNews4(Newcontent news, BindingResult result,
				ModelMap model) {

			if (result.hasErrors()) {
				return "jsp/index";
			}

			newsService.saveNews(news);
			
			model.addAttribute("news", news);
			model.addAttribute("success", " comit successfully");
			//return "success";
			return "jsp/indexa8ef";
		}

	@RequestMapping(value = { "/edit-news-{Id}" }, method = RequestMethod.GET)
	public String editNews(@PathVariable String Id, ModelMap model) {
		Integer idnews = Integer.parseInt(Id);
		Newcontent newlist = newsService.findById(idnews);
		model.addAttribute("newlist", newlist);
		
		List<Newcontent> news = newsService.findAllNews();
 		model.addAttribute("news", news);
		model.addAttribute("edit", true);
		return "jsp/CK";
	}
	
	/**
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/edit-news-{Id}" }, method = RequestMethod.POST)
	public String updateNews(@Valid Newcontent news, BindingResult result,
				ModelMap model, @PathVariable String Id) {
	
			if (result.hasErrors()) {
				return "jsp/index";
			}
	
			newsService.updateNews(news);
	
			model.addAttribute("success", "Newcontent" + news.getTitle() + " "+ news.getContent() +" updated successfully");
			return "jsp/CK";
		}


  /*  @RequestMapping(value = { "/", "/list" }, method = RequestMethod.GET)
	public String listUsers(ModelMap model) {

		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		return "index";
	}*/
	/**
	 * This method will provide the medium to add a new user.
	 */
	@RequestMapping(value = { "/newuser" }, method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("edit", false);
		return "registration";
	}

	/**
	 * This method will be called on form submission, handling POST request for
	 * saving user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/newuser" }, method = RequestMethod.POST)
	public String saveUser(@Valid User user, BindingResult result,
			ModelMap model) {

		if (result.hasErrors()) {
			return "registration";
		}

		/*
		 * Preferred way to achieve uniqueness of field [sso] should be implementing custom @Unique annotation 
		 * and applying it on field [sso] of Model class [User].
		 * 
		 * Below mentioned peace of code [if block] is to demonstrate that you can fill custom errors outside the validation
		 * framework as well while still using internationalized messages.
		 * 
		 */
		if(!userService.isUserSSOUnique(user.getId(), user.getSsoId())){
			FieldError ssoError =new FieldError("user","ssoId",messageSource.getMessage("non.unique.ssoId", new String[]{user.getSsoId()}, Locale.getDefault()));
		    result.addError(ssoError);
			return "registration";
		}
		
		userService.saveUser(user);
		
		model.addAttribute("user", user);
		model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " registered successfully");
		//return "success";
		return "registrationsuccess";
	}


	/**
	 * This method will provide the medium to update an existing user.
	 */
	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.GET)
	public String editUser(@PathVariable String ssoId, ModelMap model) {
		User user = userService.findBySSO(ssoId);
		model.addAttribute("user", user);
		model.addAttribute("edit", true);
		return "registration";
	}
	
	/**
	 * This method will be called on form submission, handling POST request for
	 * updating user in database. It also validates the user input
	 */
	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result,
			ModelMap model, @PathVariable String ssoId) {

		if (result.hasErrors()) {
			return "registration";
		}

		userService.updateUser(user);

		model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " updated successfully");
		return "registrationsuccess";
	}

	
	/**
	 * This method will delete an user by it's SSOID value.
	 */
	@RequestMapping(value = { "/delete-user-{ssoId}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable String ssoId) {
		userService.deleteUserBySSO(ssoId);
		return "redirect:/list";
	}
	

	
	@RequestMapping(value = { "/add-document-{docId}" }, method = RequestMethod.GET)
	public String addDocuments(@PathVariable int userId, ModelMap model) {
		User user = userService.findById(userId);
		model.addAttribute("user", user);

		FileBucket fileModel = new FileBucket();
		model.addAttribute("fileBucket", fileModel);

		List<UserDocument> documents = userDocumentService.findAllByUserId(userId);
		model.addAttribute("documents", documents);
		
		return "managedocuments";
	}
	

	@RequestMapping(value = { "/download-document-{userId}-{docId}" }, method = RequestMethod.GET)
	public String downloadDocument(@PathVariable int userId, @PathVariable int docId, HttpServletResponse response) throws IOException {
		UserDocument document = userDocumentService.findById(docId);
		response.setContentType(document.getType());
        response.setContentLength(document.getContent().length);
        response.setHeader("Content-Disposition","attachment; filename=\"" + document.getName() +"\"");
 
        FileCopyUtils.copy(document.getContent(), response.getOutputStream());
 
 		return "redirect:/add-document-"+userId;
	}

	@RequestMapping(value = { "/delete-document-{userId}-{docId}" }, method = RequestMethod.GET)
	public String deleteDocument(@PathVariable int userId, @PathVariable int docId) {
		userDocumentService.deleteById(docId);
		return "redirect:/add-document-"+userId;
	}

	@RequestMapping(value = { "/add-document-{dId}" }, method = RequestMethod.POST)
	public String uploadDocument(@Valid FileBucket fileBucket, BindingResult result, ModelMap model, @PathVariable int userId) throws IOException{
		
		if (result.hasErrors()) {
			System.out.println("validation errors");
			User user = userService.findById(userId);
			model.addAttribute("user", user);

			List<UserDocument> documents = userDocumentService.findAllByUserId(userId);
			model.addAttribute("documents", documents);
			
			return "managedocuments";
		} else {
			
			System.out.println("Fetching file");
			
			User user = userService.findById(userId);
			model.addAttribute("user", user);

			saveDocument(fileBucket, user);

			return "redirect:/add-document-"+userId;
		}
	}
	
	private void saveDocument(FileBucket fileBucket, User user) throws IOException{
		
		UserDocument document = new UserDocument();
		
		MultipartFile multipartFile = fileBucket.getFile();
		
		document.setName(multipartFile.getOriginalFilename());
		document.setDescription(fileBucket.getDescription());
		document.setType(multipartFile.getContentType());
		document.setContent(multipartFile.getBytes());
		document.setUser(user);
		userDocumentService.saveDocument(document);
	}
 
}
