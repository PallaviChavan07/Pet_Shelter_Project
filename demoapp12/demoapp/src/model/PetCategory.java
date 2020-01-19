package model;

public class PetCategory {
	private int animal_category_id;
	private String animal_category;
	
	
	public PetCategory(int id, String category) {
		super();
		this.animal_category_id = id;
		this.animal_category = category;
	}


	public int getAnimal_category_id() {
		return animal_category_id;
	}


	public void setAnimal_category_id(int animal_category_id) {
		this.animal_category_id = animal_category_id;
	}


	public String getAnimal_category() {
		return animal_category;
	}


	public void setAnimal_category(String animal_category) {
		this.animal_category = animal_category;
	}
	
	
	

}
