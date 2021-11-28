package jdbc.util.CompositeQuery;
import java.util.*;
public class jdbcUtil_CompositeQuery_Apartment {

	public static String get_aCondition_For_myDB(String columnName, String value) {

		String aCondition = null;
		if ("member_no".equals(columnName)) 
			aCondition = columnName + "=" + value;
		else if ("ap_name".equals(columnName) )
			aCondition = getDisassembledCondition(columnName, value);
		
		return aCondition + " ";
	}

	public static String get_WhereCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0	&& !"action".equals(key)) {
				count++;
				String aCondition = get_aCondition_For_myDB(key, value.trim());

				if (count == 1)
					whereCondition.append(" where " + aCondition);
				else
					whereCondition.append(" and " + aCondition);

				System.out.println("Query count = " + count);
			}
		}
		
		return whereCondition.toString();
	}

	public static String getDisassembledCondition(String columnName, String str) {
		String tmpStr = "(";
		
		for (int i = 0 ; i < str.length(); i++) {
			tmpStr +=  columnName + " like '%" + str.charAt(i) + "%'";
			tmpStr = ( i == (str.length()-1) )? tmpStr : tmpStr+" or ";
			System.out.println("tmpStr = " + tmpStr);
		}
		tmpStr += ")";
		return tmpStr;
	}
	public static void main(String argv[]) {

		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("ap_name", new String[] { "UWM" });

		String finalSQL = "select * from `apartment` "
				          + jdbcUtil_CompositeQuery_Apartment.get_WhereCondition(map)
				          + "order by ap_no";
		System.out.println("¡´¡´finalSQL = " + finalSQL);

	}
}