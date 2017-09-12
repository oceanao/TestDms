package com.market.pojo;
import java.io.Serializable;

public class result implements Serializable {

	/*@Id  
	@GeneratedValue(strategy = GenerationType.IDENTITY)  
	@Column(name = "result_id", nullable = false) */
	private Integer  result_id;
	private String  result_name;
	private String result_description;
	
	@Override
	public String toString() {
		return "result [result_id=" + result_id + ", result_name=" + result_name + ", result_description=" + result_description
				+  "]";
	}

	public int getResult_id() {
		return result_id;
	}

	public void setResult_id(int result_id) {
		this.result_id = result_id;
	}

	public String getResult_name() {
		return result_name;
	}

	public void setResult_name(String result_name) {
		this.result_name = result_name;
	}

	public String getResult_description() {
		return result_description;
	}

	public void setResult_description(String result_description) {
		this.result_description = result_description;
	}
}
