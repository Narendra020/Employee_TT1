package com.timetracker.model;


	import java.sql.Date;
	import java.sql.Time;

	public class Task {
	    private String taskId;
	    private String employeeId;
	    private String employeeName;
	    private String role;
	    private String project;
	    private Date date;
	    private Time startTime;
	    private Time endTime;
	    private String timeDuration;
	    private String task;
	    private String description;
	    private String status;

	    // Getters and Setters
	    public String getTaskId() { return taskId; }
	    public void setTaskId(String taskId) { this.taskId = taskId; }
	    public String getEmployeeId() { return employeeId; }
	    public void setEmployeeId(String employeeId) { this.employeeId = employeeId; }
	    public String getEmployeeName() { return employeeName; }
	    public void setEmployeeName(String employeeName) { this.employeeName = employeeName; }
	    public String getRole() { return role; }
	    public void setRole(String role) { this.role = role; }
	    public String getProject() { return project; }
	    public void setProject(String project) { this.project = project; }
	    public Date getDate() { return date; }
	    public void setDate(Date date) { this.date = date; }
	    public Time getStartTime() { return startTime; }
	    public void setStartTime(Time startTime) { this.startTime = startTime; }
	    public Time getEndTime() { return endTime; }
	    public void setEndTime(Time endTime) { this.endTime = endTime; }
	    public String getTimeDuration() { return timeDuration; }
	    public void setTimeDuration(String timeDuration) { this.timeDuration = timeDuration; }
	    public String getTask() { return task; }
	    public void setTask(String task) { this.task = task; }
	    public String getDescription() { return description; }
	    public void setDescription(String description) { this.description = description; }
	    public String getStatus() { return status; }
	    public void setStatus(String status) { this.status = status; }
	}


