import java.util.*; public class EmployeeHours { private Map
<String , Integer> dailyHours = new LinkedHashMap<>(); private
Map<String , Integer> weeklyHours = new LinkedHashMap<>();
private Map<String , Integer> monthlyHours = new
LinkedHashMap<>(); public void addTaskHours(Date taskDate, int hours) {
Calendar cal = Calendar.getInstance(); cal.setTime(taskDate); // Format
date parts String dayKey = String.format("%d-%d-%d",
cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1,
cal.get(Calendar.DAY_OF_MONTH)); String weekKey =
String.format("%d-W%d", cal.get(Calendar.YEAR),
cal.get(Calendar.WEEK_OF_YEAR)); String monthKey =
String.format("%d-%d", cal.get(Calendar.YEAR),
cal.get(Calendar.MONTH)+1); dailyHours.put(dayKey,
dailyHours.getOrDefault(dayKey, 0) + hours); weeklyHours.put(weekKey,
weeklyHours.getOrDefault(weekKey, 0) + hours);
monthlyHours.put(monthKey, monthlyHours.getOrDefault(monthKey, 0) +
hours); } public Map<String , Integer> getDailyHours() { return
dailyHours; } public Map<String , Integer> getWeeklyHours() {
return weeklyHours; } public Map<String , Integer>
getMonthlyHours() { return monthlyHours; } } 