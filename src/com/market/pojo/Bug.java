package com.market.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Bug implements Serializable{
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer bug_id;
	
	private Integer pon_id;
	private Integer result_id;

    private String priority;
	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	private String summary;

    private Ponderance ponderance;
    private result result;

    public Integer getResult_id() {
		return result_id;
	}

	public void setResult_id(Integer result_id) {
		this.result_id = result_id;
	}

	public result getResult() {
		return result;
	}

	public void setResult(result result) {
		this.result = result;
	}

	private Integer bug_status;

    private User reporter;

    private Project project;//.............

    private User handler;

    private String bug_comment;

    private String bug_os;

    private String bug_description;
    
    @Override
	public String toString() {
		return "Bug [bug_id=" + bug_id + ", pon_id=" + pon_id + ", result_id=" + result_id + ", priority=" + priority
				+ ", summary=" + summary + ", ponderance=" + ponderance + ", result=" + result + ", bug_status="
				+ bug_status + ", reporter=" + reporter + ", project=" + project + ", handler=" + handler
				+ ", bug_comment=" + bug_comment + ", bug_os=" + bug_os + ", bug_description=" + bug_description
				+ ", bug_result=" + bug_result + ", submite_time=" + submite_time + ", handler_id=" + handler_id
				+ ", reporter_id=" + reporter_id + "]";
	}

	private Integer bug_result;

    private Date submite_time;
    
    private Integer handler_id;
    private Integer reporter_id;

	public Integer getHandler_id() {
		return handler_id;
	}

	public void setHandler_id(Integer handler_id) {
		this.handler_id = handler_id;
	}

	public Integer getReporter_id() {
		return reporter_id;
	}

	public void setReporter_id(Integer reporter_id) {
		this.reporter_id = reporter_id;
	}

	public Integer getBug_id() {
		return bug_id;
	}

	public void setBug_id(Integer bug_id) {
		this.bug_id = bug_id;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}


	public Ponderance getPonderance() {
		return ponderance;
	}

	public void setPonderance(Ponderance ponderance) {
		this.ponderance = ponderance;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Integer getBug_status() {
		return bug_status;
	}

	public void setBug_status(Integer bug_status) {
		this.bug_status = bug_status;
	}

	public User getReporter() {
		return reporter;
	}
	   public Integer getPon_id() {
			return pon_id;
		}

		public void setPon_id(Integer pon_id) {
			this.pon_id = pon_id;
		}

	
	public void setReporter(User reporter) {
		this.reporter = reporter;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public User getHandler() {
		return handler;
	}

	public void setHandler(User handler) {
		this.handler = handler;
	}

	public String getBug_comment() {
		return bug_comment;
	}

	public void setBug_comment(String bug_comment) {
		this.bug_comment = bug_comment;
	}

	public String getBug_os() {
		return bug_os;
	}

	public void setBug_os(String bug_os) {
		this.bug_os = bug_os;
	}

	public String getBug_description() {
		return bug_description;
	}

	public void setBug_description(String bug_description) {
		this.bug_description = bug_description;
	}

	public Integer getBug_result() {
		return bug_result;
	}

	public void setBug_result(Integer bug_result) {
		this.bug_result = bug_result;
	}

	public Date getSubmite_time() {
		return submite_time;
	}

	public void setSubmite_time(Date submite_time) {
		this.submite_time = submite_time;
	}


    
    
}