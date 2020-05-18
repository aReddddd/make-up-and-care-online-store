package xmum.util;

import java.sql.Timestamp;
import java.util.Date;
/**
* In order to save time information in the date format in MySQL,
* fields of type datetime must be used,
* while for JDBC to obtain information of type datetime,
*  java.sql.timestamp is needed, otherwise,
*  only date information will be retained and time
* information will be lost
* */

public class DateUtil {

	public static Timestamp d2t(Date d) {
		if (null == d)
			return null;
		return new Timestamp(d.getTime());
	}

	public static Date t2d(Timestamp t) {
		if (null == t)
			return null;
		return new Date(t.getTime());
	}
}

