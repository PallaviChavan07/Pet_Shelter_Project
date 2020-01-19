package model;

public class Person {

	private int person_id;
	private String person_password;
	private String first_name;
	private String last_name;
	private String email_id;
	private String phone_number;
	private String street_address;
	private String city;
	private String state;
	private String zip;
	private String driver_license;
	private String state_issuance;
	private String license_expiry_date;
	
	
	public Person(String person_password, String first_name, String last_name, String email_id, String phone_number,
			String street_address, String city, String state, String zip, String driver_license, String state_issuance,
			String license_expiry_date) {
		super();
		this.person_password = person_password;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email_id = email_id;
		this.phone_number = phone_number;
		this.street_address = street_address;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.driver_license = driver_license;
		this.state_issuance = state_issuance;
		this.license_expiry_date = license_expiry_date;
	}
	public Person(int person_id, String person_password, String first_name, String last_name, String email_id,
			String phone_number, String street_address, String city, String state, String zip, String driver_license,
			String state_issuance, String license_expiry_date) {
		super();
		this.person_id = person_id;
		this.person_password = person_password;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email_id = email_id;
		this.phone_number = phone_number;
		this.street_address = street_address;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.driver_license = driver_license;
		this.state_issuance = state_issuance;
		this.license_expiry_date = license_expiry_date;
	}
	public int getPerson_id() {
		return person_id;
	}
	public void setPerson_id(int person_id) {
		this.person_id = person_id;
	}
	public String getPerson_password() {
		return person_password;
	}
	public void setPerson_password(String person_password) {
		this.person_password = person_password;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getStreet_address() {
		return street_address;
	}
	public void setStreet_address(String street_address) {
		this.street_address = street_address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getDriver_license() {
		return driver_license;
	}
	public void setDriver_license(String driver_license) {
		this.driver_license = driver_license;
	}
	public String getState_issuance() {
		return state_issuance;
	}
	public void setState_issuance(String state_issuance) {
		this.state_issuance = state_issuance;
	}
	public String getLicense_expiry_date() {
		return license_expiry_date;
	}
	public void setLicense_expiry_date(String license_expiry_date) {
		this.license_expiry_date = license_expiry_date;
	}
	
	
}
