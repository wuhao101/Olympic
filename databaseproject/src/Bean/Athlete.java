package Bean;

import java.util.ArrayList;
import java.util.List;

public class Athlete {
	private int _aid;
	private String _name;
	private String _gender;
	private String _brithdate;
	private String _birthplace;
	private String _country;
	private String _sport;
	private List _record;
	
	public Athlete() {
		
	}
	
	public Athlete(int aid, String name, String gender, String birthdate, 
			String birthplace, String country, String sport, List record) {
		_aid = aid;
		_name = name;
		_gender = gender;
		_brithdate = birthdate;
		_birthplace = birthplace;
		_country = country;
		_sport = sport;
		 _record = new ArrayList<AthleteRecord>();
		 _record = record;		
	}
	
	public void setName(String name) {
		_name = name;
	}
	
	public void setAid(int aid) {
		_aid = aid;
	}
	
	public void setGender(String gender) {
		_gender = gender;
	}
	
	public void setBirthDtae(String birthdate) {
		_brithdate = birthdate;
	}
	
	public void setBirthPlace(String birthplace) {
		_birthplace = birthplace;
	}
	
	public void setCountry(String country) {
		_country = country;
	}
	
	public void setSport(String sport) {
		_sport = sport;
	}
	
	public void setRecord(List record) {
		_record = record;	
	}
	
	public int getAid() {
		return _aid;
	}
	
	public String getName() {
		return _name;
	}
	
	public String getGender() {
		return _gender;
	}
	
	public String getBirthDtae() {
		return _brithdate;
	}
	
	public String getBirthPlace() {
		return _birthplace;
	}
	
	public String getCountry() {
		return _country;
	}
	
	public String getSport() {
		return _sport;
	}
	
	public List getRecord() {
		return _record;	
	}
}
