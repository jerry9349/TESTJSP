package test;

public class BeanClassName implements java.io.Serializable{

	//값을 저장하는 필드
	private String value;

	//BeanClassName의 기본 생성자
	public BeanClassName() {

	}

	//필드의 값을 읽어오는 값
	public String getValue() {
		return value;
	}

	//필드의 값을 변경하는 값
	public void setValue(String value) {
		this.value = value;
	}
}

