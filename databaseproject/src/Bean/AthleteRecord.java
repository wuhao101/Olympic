package Bean;

public class AthleteRecord {
	private int _rid;
	private int _aid;
	private String _athName;
	private int _year;
	private String _gametype;
	private int _age;
	private String _city;
	private String _sport;
	private String _event;
	private String _country;
	private String _rank;
	private String _medal;
	
	public AthleteRecord() {
		
	}
	
	public AthleteRecord(int aid, int rid, String athName, int year, String gametype, int age, String city, 
			String sport, String event, String country, String rank, String medal) {
		_aid = aid;
		_rid = rid;
		_athName = athName;
		_year = year;
		_gametype = gametype;
		_age = age;
		_city = city;
		_sport = sport;
		_event = event;
		_country = country;
		 _rank = rank;
		 _medal = medal;
		
	}
	
	public void setRid(int rid) {
		_rid = rid;
	}
	
	public void setAid(int aid) {
		_aid = aid;
	}
	
	public void setAthName(String athName) {
		_athName = athName;
	}
	
	public void setYear(int year) {
		_year = year;
	}
	
	public void setGameType(String gametype) {
		_gametype = gametype;
	}
	
	public void setAge(int age) {
		_age = age;
	}
	
	public void setCity(String city) {
		_city = city;
	}
	
	public void setSport(String sport) {
		_sport = sport;
	}
	
	public void setEvent(String event) {
		_event = event;
	}
	
	public void setCountry(String country) {
		_country = country;
	}
	
	public void setRank(String rank) {
		_rank = rank;
	}

	public void setMedal(String medal) {
		_medal = medal;
	}
	
	public int getRid() {
		return _rid;
	}
	
	public int getAid() {
		return _aid;
	}
	
	public String getAthName() {
		return _athName;
	}
	
	public int getYear() {
		return _year;
	}
	
	public String getGameType() {
		return _gametype;
	}
	
	public int getAge() {
		return _age;
	}
	
	public String getCity() {
		return _city;
	}
	
	public String getSport() {
		return _sport;
	}
	
	public String getEvent() {
		return _event;
	}
	
	public String getCountry() {
		return _country;
	}
	
	public String getRank() {
		return _rank;
	}

	public String getMedal() {
		return _medal;
	}
}
