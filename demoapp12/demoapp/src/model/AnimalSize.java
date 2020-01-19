package model;

public class AnimalSize {
	private int animal_size_id;
	private String animal_size;
	public AnimalSize(int animal_size_id, String animal_size) {
		super();
		this.animal_size_id = animal_size_id;
		this.animal_size = animal_size;
	}
	public int getAnimal_size_id() {
		return animal_size_id;
	}
	public void setAnimal_size_id(int animal_size_id) {
		this.animal_size_id = animal_size_id;
	}
	public String getAnimal_size() {
		return animal_size;
	}
	public void setAnimal_size(String animal_size) {
		this.animal_size = animal_size;
	}
	
	

}
