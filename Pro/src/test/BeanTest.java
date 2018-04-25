package test;

public class BeanTest {

	//property 지정, db의 속성 지정
	private String name;
	private int tel;
	
	public BeanTest() {
		name="jerry";
		tel = 2;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}

}
