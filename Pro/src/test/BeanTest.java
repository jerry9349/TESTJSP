package test;

public class BeanTest {

	//property ����, db�� �Ӽ� ����
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
