package model;

public class Animal {
	private int animal_id;
	private String animal_name;
	private String animal_breed;
	private String animal_image;
	private String animal_age_group     ;
	private int animal_age_in_weeks  ;
	private String animal_arrival_date  ;
	private double animal_weight        ;
	private String animal_color         ;
	private boolean is_neutered         ;
	private double animal_cost          ;
	private String animal_description   ;
	private boolean is_adopted          ;
	private boolean is_children_friendly;
	private boolean is_cat_friendly     ;
	private boolean is_dog_friendly     ;
	private String animal_gender        ;
	private int animal_size_id          ;
	private int animal_category_id      ;
	private String animal_category;
	private String animal_size;
	private String animal_entry_reason;
	public Animal(String animal_name, String animal_age_group, int animal_age_in_weeks,
			String animal_arrival_date, double animal_weight, String animal_color, boolean is_neutered,
			double animal_cost, String animal_description, boolean is_adopted, boolean is_children_friendly,
			boolean is_cat_friendly, boolean is_dog_friendly, String animal_gender, int animal_size_id,
			int animal_category_id) {
		super();
		this.animal_name = animal_name;
		this.animal_age_group = animal_age_group;
		this.animal_age_in_weeks = animal_age_in_weeks;
		this.animal_arrival_date = animal_arrival_date;
		this.animal_weight = animal_weight;
		this.animal_color = animal_color;
		this.is_neutered = is_neutered;
		this.animal_cost = animal_cost;
		this.animal_description = animal_description;
		this.is_adopted = is_adopted;
		this.is_children_friendly = is_children_friendly;
		this.is_cat_friendly = is_cat_friendly;
		this.is_dog_friendly = is_dog_friendly;
		this.animal_gender = animal_gender;
		this.animal_size_id = animal_size_id;
		this.animal_category_id = animal_category_id;
	}
	
	public Animal(int animal_id, String animal_name, String animal_age_group, int animal_age_in_weeks,
			String animal_arrival_date, double animal_weight, String animal_color, boolean is_neutered,
			double animal_cost, String animal_description, boolean is_adopted, boolean is_children_friendly,
			boolean is_cat_friendly, boolean is_dog_friendly, String animal_gender, int animal_size_id,
			int animal_category_id) {
		super();
		this.animal_id = animal_id;
		this.animal_name = animal_name;
		this.animal_age_group = animal_age_group;
		this.animal_age_in_weeks = animal_age_in_weeks;
		this.animal_arrival_date = animal_arrival_date;
		this.animal_weight = animal_weight;
		this.animal_color = animal_color;
		this.is_neutered = is_neutered;
		this.animal_cost = animal_cost;
		this.animal_description = animal_description;
		this.is_adopted = is_adopted;
		this.is_children_friendly = is_children_friendly;
		this.is_cat_friendly = is_cat_friendly;
		this.is_dog_friendly = is_dog_friendly;
		this.animal_gender = animal_gender;
		this.animal_size_id = animal_size_id;
		this.animal_category_id = animal_category_id;
	}

	public Animal() {
		// TODO Auto-generated constructor stub
	}

	public int getAnimal_id() {
		return animal_id;
	}
	public void setAnimal_id(int animal_id) {
		this.animal_id = animal_id;
	}
	public String getAnimal_name() {
		return animal_name;
	}
	public void setAnimal_name(String animal_name) {
		this.animal_name = animal_name;
	}
	public String getAnimal_breed() {
		return animal_breed;
	}
	public void setAnimal_breed(String animal_breed) {
		this.animal_breed = animal_breed;
	}
	public String getAnimal_image() {
		return animal_image;
	}
	public void setAnimal_image(String animal_image) {
		this.animal_image = animal_image;
	}
	public String getAnimal_age_group() {
		return animal_age_group;
	}
	public void setAnimal_age_group(String animal_age_group) {
		this.animal_age_group = animal_age_group;
	}
	public int getAnimal_age_in_weeks() {
		return animal_age_in_weeks;
	}
	public void setAnimal_age_in_weeks(int animal_age_in_weeks) {
		this.animal_age_in_weeks = animal_age_in_weeks;
	}
	public String getAnimal_arrival_date() {
		return animal_arrival_date;
	}
	public void setAnimal_arrival_date(String animal_arrival_date) {
		this.animal_arrival_date = animal_arrival_date;
	}
	public double getAnimal_weight() {
		return animal_weight;
	}
	public void setAnimal_weight(double animal_weight) {
		this.animal_weight = animal_weight;
	}
	public String getAnimal_color() {
		return animal_color;
	}
	public void setAnimal_color(String animal_color) {
		this.animal_color = animal_color;
	}
	public boolean isIs_neutered() {
		return is_neutered;
	}
	public void setIs_neutered(boolean is_neutered) {
		this.is_neutered = is_neutered;
	}
	public double getAnimal_cost() {
		return animal_cost;
	}
	public void setAnimal_cost(double animal_cost) {
		this.animal_cost = animal_cost;
	}
	public String getAnimal_description() {
		return animal_description;
	}
	public void setAnimal_description(String animal_description) {
		this.animal_description = animal_description;
	}
	public boolean isIs_adopted() {
		return is_adopted;
	}
	public void setIs_adopted(boolean is_adopted) {
		this.is_adopted = is_adopted;
	}
	public boolean isIs_children_friendly() {
		return is_children_friendly;
	}
	public void setIs_children_friendly(boolean is_children_friendly) {
		this.is_children_friendly = is_children_friendly;
	}
	public boolean isIs_cat_friendly() {
		return is_cat_friendly;
	}
	public void setIs_cat_friendly(boolean is_cat_friendly) {
		this.is_cat_friendly = is_cat_friendly;
	}
	public boolean isIs_dog_friendly() {
		return is_dog_friendly;
	}
	public void setIs_dog_friendly(boolean is_dog_friendly) {
		this.is_dog_friendly = is_dog_friendly;
	}
	public String getAnimal_gender() {
		return animal_gender;
	}
	public void setAnimal_gender(String animal_gender) {
		this.animal_gender = animal_gender;
	}
	public int getAnimal_size_id() {
		return animal_size_id;
	}
	public void setAnimal_size_id(int animal_size_id) {
		this.animal_size_id = animal_size_id;
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

	public String getAnimal_size() {
		return animal_size;
	}

	public void setAnimal_size(String animal_size) {
		this.animal_size = animal_size;
	}

	public String getAnimal_entry_reason() {
		return animal_entry_reason;
	}

	public void setAnimal_entry_reason(String animal_entry_reason) {
		this.animal_entry_reason = animal_entry_reason;
	}

	
	

}
