package test;

public class BeanClassName implements java.io.Serializable{

	//���� �����ϴ� �ʵ�
	private String value;

	//BeanClassName�� �⺻ ������
	public BeanClassName() {

	}

	//�ʵ��� ���� �о���� ��
	public String getValue() {
		return value;
	}

	//�ʵ��� ���� �����ϴ� ��
	public void setValue(String value) {
		this.value = value;
	}
}

