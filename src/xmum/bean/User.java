package xmum.bean;

public class User {
	private String password;
	private String name;
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	//Turns the user's username into an anonymous form with an asterisk
	public String getAnonymousName(){
		if(null==name)
			return null;
		
		if(name.length()<=1)
			return "*";
		
		if(name.length()==2)
			return name.substring(0,1) +"*";
		
		char[] anonymous =name.toCharArray();
		for (int i = 1; i < anonymous.length-1; i++) {
			anonymous[i]='*';
		}
		return new String(anonymous);
	}
	
}
