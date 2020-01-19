package com.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import Dao.PetDao;
import model.*;
import utils.*;

/**
 * Servlet implementation class PetServlet
 */
@WebServlet("/PetServlet")
@MultipartConfig(maxFileSize = 16177215)

public class PetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PetServlet get called");
		HttpSession session = request.getSession();
		String JSPPageName = request.getParameter("param");
		String task = request.getParameter("task");
		System.out.println("JSPPageName = "+JSPPageName+ "task = "+task);
		PetDao petDao = new PetDao();
		
		// get all parameters from add_pet page
		if(JSPPageName != null && JSPPageName.equals(Constants.ADD_PET_JSP) ) {
			//int animal_id = 9999;
			/*int entryReasonID = Integer.parseInt(request.getParameter("entryreason"));
			int breedID = Integer.parseInt(request.getParameter("breed"));
			Animal pet = new Animal(request.getParameter("petname"), request.getParameter("agegroup"), 0, request.getParameter("arrivaldate"), Double.parseDouble(request.getParameter("weight")), request.getParameter("color"), Boolean.parseBoolean(request.getParameter("neutered")), 0, request.getParameter("description"), false, Boolean.parseBoolean(request.getParameter("kidsfriendly")), Boolean.parseBoolean(request.getParameter("catsfriendly")), Boolean.parseBoolean(request.getParameter("dogsfriendly")), request.getParameter("gender"), Integer.parseInt(request.getParameter("size")), Integer.parseInt(request.getParameter("category")));
			int result = petDao.addAnimalInformation(pet, entryReasonID, breedID);
			System.out.println("Animal added result = "+result);
			if(result >= 0 ) {
				int result1 = petDao.addAnimalBreed(pet.getAnimal_id(), breedID);
				int result2 = petDao.addAnimalEntryReason(pet.getAnimal_id(), entryReasonID);
				int result3 = petDao.addCageOccupancy(pet.getAnimal_id());
				
				if(result1 >= 0  && result2 >= 0 && result3 >= 0) {
					session.setAttribute("animalName", pet.getAnimal_name());
					session.setAttribute("breedID", breedID);
					session.setAttribute("entryReasonID", entryReasonID);
					response.sendRedirect("jsp/add_pet_success.jsp");
				}
				
			}*/
		}else if(JSPPageName != null && JSPPageName.equals(Constants.HOME_JSP))  {
			List<PetCategory> listCatagory = petDao.getPetCategoryList();
	        List<AnimalSize> listSize = petDao.getAnimalSizeList();
	        List<Breed> listBreed = petDao.getAnimalBreedList();
	        List<EntryReason> listEntryReason = petDao.getEntryReasonList();
	        
			switch(task) {
			case Constants.ADD_PET:
				System.out.println("In add pet switch case");
			    // to access dropdown lists in add_pet page
		        session.setAttribute("listCategory", listCatagory);
		        session.setAttribute("listSize", listSize);
		        session.setAttribute("listBreed", listBreed);
		        session.setAttribute("listEntryReason", listEntryReason);
				response.sendRedirect("jsp/"+Constants.ADD_PET_JSP);
				break;
				
			case Constants.ADD_ADOPTER:	
				response.sendRedirect("jsp/"+Constants.ADD_ADOPTER_JSP);
				break;
			case Constants.PET_SEARCH:	
				session.setAttribute("listCategory", listCatagory);
		        session.setAttribute("listSize", listSize);
		        session.setAttribute("listBreed", listBreed);
				response.sendRedirect("jsp/"+Constants.PET_SEARCH_JSP);
				break;
			case Constants.REPORTS:
				response.sendRedirect("jsp/"+Constants.REPORTS_JSP);
				break;
			}
			
			
		}else if (JSPPageName != null && JSPPageName.equals(Constants.ADD_ADOPTER_JSP))  {
			//int person_id = petDao.getMaxPersonId()+1;
			Person person = new Person("demopswd", request.getParameter("firstname"), request.getParameter("lastname"), request.getParameter("emailid"), request.getParameter("phonenumber"), request.getParameter("streetaddress"), request.getParameter("city"), request.getParameter("state"), request.getParameter("zip"), request.getParameter("driverlicense"), request.getParameter("stateissuance"), request.getParameter("licenseexpirydate"));
			int result = petDao.addPerson(person);
			System.out.println("Person added result = "+result);
			if(result >= 0 ) { 
				session.setAttribute("adopter", person);
				session.setAttribute("firstname", person.getFirst_name());
				response.sendRedirect("jsp/add_person_success.jsp");
			}
			
		}else if (JSPPageName != null && JSPPageName.equals(Constants.REPORTS_JSP))  {
			//int person_id = petDao.getMaxPersonId()+1;
			String reportName = request.getParameter("report");
			ResultSet resultset = null;
			switch(reportName) {
			case Constants.LONG_TERM_PET_REPORT:
				System.out.println("In case = "+Constants.LONG_TERM_PET_REPORT);
				int months = Integer.parseInt(request.getParameter("months"));
				resultset = petDao.getLongTermAnimalsByMonths(months);
				session.setAttribute("resultset", resultset);
				session.setAttribute("graphreport", 0);
				response.sendRedirect("jsp/"+Constants.REPORTS_JSP);
				break;
			case Constants.SHELTER_ENTRY_REASON_REPORT:
				System.out.println("In case = "+Constants.SHELTER_ENTRY_REASON_REPORT);
				resultset = petDao.getShelterEntryReasonReport();
				session.setAttribute("resultset", resultset);
				session.setAttribute("graphreport", 0);
				response.sendRedirect("jsp/"+Constants.REPORTS_JSP);
				break;
			case Constants.MONTHLY_IN_OUT_REPORT:
				System.out.println("In case = "+Constants.MONTHLY_IN_OUT_REPORT);
				//
				HashMap<String, Integer> inMap = petDao.getMPetIntakeFlow();
				HashMap<String, Integer> outMap = petDao.getPetAdoptionFlow();
				session.setAttribute("outMap", outMap);
				session.setAttribute("inMap", inMap);
				session.setAttribute("graphreport", 1);
				response.sendRedirect("jsp/"+Constants.REPORTS_JSP);
				break;
			default:
				break;
			}
			
			
		}
		else if (JSPPageName != null && JSPPageName.equals(Constants.PET_SEARCH_JSP))  {
			
			Boolean seeprofile = Boolean.parseBoolean(request.getParameter("seeprofile"));
			Boolean search = Boolean.parseBoolean(request.getParameter("search"));
			if(search) {
				String agegroup = request.getParameter("agegroup");
				String gender = request.getParameter("gender");
				int category_id = Integer.parseInt(request.getParameter("category"));
				List<Animal> animalList = petDao.searchForAnimal(agegroup, gender, category_id);
				session.setAttribute("display", 1);
				session.setAttribute("animalList", animalList);
				response.sendRedirect("jsp/pet_search.jsp");
			}
			if(seeprofile) {
				int animal_id = Integer.parseInt(request.getParameter("id"));
				Animal animal = null;
				animal = petDao.getPetDetails(animal_id);
				session.setAttribute("animal", animal);
				//session.setAttribute("animal_id", animal_id);			
				response.sendRedirect("jsp/"+Constants.PET_DETAILS_JSP);
			}
			
		}
		else if (JSPPageName != null && JSPPageName.equals(Constants.PET_DETAILS_JSP))  {
			Animal animal = (Animal)request.getSession().getAttribute("animal");
			Person adopter = (Person) request.getSession().getAttribute("adopter");
			int result = petDao.setAdoptionRequest(adopter.getPerson_id(), animal.getAnimal_id(), animal.getAnimal_category_id(), animal.getAnimal_age_group(), animal.getAnimal_gender());
			System.out.println("Add Adoption Request Result = "+result);
			if(adopter != null) {
				System.out.println("In Adoption Process JSp = adopter is not null getting value from session");
				System.out.println(adopter.getPerson_id());
				System.out.println(adopter.getFirst_name());
			}else {
				System.out.println("In Adoption Process JSp =  Value for adopter is not getting from session");
			}
			
			//session.setAttribute("animal_id", animal_id);			
			response.sendRedirect("jsp/"+Constants.ADOPTION_PROCESS_JSP);
			
		}else if (JSPPageName != null && JSPPageName.equals(Constants.ADOPTION_PROCESS_JSP))  {
			int empId = (Integer)request.getSession().getAttribute("empId");
			Animal animal = (Animal)request.getSession().getAttribute("animal");
			Person adopter = (Person) request.getSession().getAttribute("adopter");
			int result = petDao.confirmAdoptionProcess(animal, adopter,empId );
			System.out.println(" confirmAdoptionProcess result = "+result);
			if(result >= 0) {
				response.sendRedirect("jsp/"+Constants.ADOPTION_PROCESS_SUCC_JSP);
			}
			
		}
		else {
			System.out.println("In else part == JSPPageName == "+JSPPageName);
		}
		
		 
		
		
		
		
        

	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(request, response);
		System.out.println("PetServlet doPost get called");
		
		HttpSession session = request.getSession();
		PetDao petDao = new PetDao();		
		InputStream inputStream = null; // input stream of the upload file	
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("addphoto");
        
        if (filePart != null) {
            //prints out some information for debugging
            //System.out.println(filePart.getName());
            //System.out.println(filePart.getSize());
             
            //obtains input stream of the upload file
            inputStream = filePart.getInputStream();	            
        }
    	
        int entryReasonID = Integer.parseInt(request.getParameter("entryreason"));
    	int breedID = Integer.parseInt(request.getParameter("breed"));
    	Animal pet = new Animal(request.getParameter("petname"), request.getParameter("agegroup"), 0, request.getParameter("arrivaldate"), Double.parseDouble(request.getParameter("weight")), request.getParameter("color"), Boolean.parseBoolean(request.getParameter("neutered")), 0, request.getParameter("description"), false, Boolean.parseBoolean(request.getParameter("kidsfriendly")), Boolean.parseBoolean(request.getParameter("catsfriendly")), Boolean.parseBoolean(request.getParameter("dogsfriendly")), request.getParameter("gender"), Integer.parseInt(request.getParameter("size")), Integer.parseInt(request.getParameter("category")));
    	int result = petDao.addAnimalInformation(pet, entryReasonID, breedID, inputStream);
    	System.out.println("Animal added result = "+result);    	
    	if(result >= 0 ) {			
			int result1 = petDao.addAnimalBreed(pet.getAnimal_id(), breedID);
			int result2 = petDao.addAnimalEntryReason(pet.getAnimal_id(), entryReasonID);
			int result3 = petDao.addCageOccupancy(pet.getAnimal_id());
			if(result1 >= 0  && result2 >= 0 && result3 >= 0) {
				session.setAttribute("animalName", pet.getAnimal_name());
				session.setAttribute("breedID", breedID);
				session.setAttribute("entryReasonID", entryReasonID);					
			}
		}
    	
        request.getRequestDispatcher("/jsp/add_pet_success.jsp").forward(request,response);
	}


}
