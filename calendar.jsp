<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    import="java.util.Calendar"
    import="java.text.SimpleDateFormat"
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カレンダーアプリ</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<p>
<%
        int inputYear = Integer.parseInt(request.getParameter("year"));
        int inputMonth = Integer.parseInt(request.getParameter("month")); //入力値をintに変換して代入
        Calendar calendar = Calendar.getInstance();
        calendar.clear();
        calendar.set(Calendar.YEAR,inputYear);
        calendar.set(Calendar.MONTH,inputMonth-1);

        Calendar calendarStart = Calendar.getInstance();
        calendarStart.clear();
        calendarStart.set(Calendar.YEAR,calendar.get(Calendar.YEAR));
        calendarStart.set(Calendar.MONTH,calendar.get(Calendar.MONTH));
        calendarStart.set(Calendar.DATE,1);
        
        Calendar calendarEnd = Calendar.getInstance();
        calendarEnd.clear();
        calendarEnd.set(Calendar.YEAR,calendar.get(Calendar.YEAR));
        calendarEnd.set(Calendar.MONTH,calendar.get(Calendar.MONTH));
        calendarEnd.set(Calendar.DATE,calendarEnd.getActualMaximum(Calendar.DATE));

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月");
        out.print(simpleDateFormat.format(calendarStart.getTime()) + "のカレンダー");
                
        SimpleDateFormat dateDisp = new SimpleDateFormat("dd日");
        SimpleDateFormat weekDisp = new SimpleDateFormat("E");
        
        Calendar weekdayCount = Calendar.getInstance();
        weekdayCount.clear();
        weekdayCount.set(Calendar.DAY_OF_WEEK,1);
        boolean calendarHeight = true; //カレンダー縦ループ有無
        boolean disp= true; //月末空欄
        %>
        </p>
        <table id="calendar">
        <tr class="week">
        <%
        for (int i = 0; i < 7;i++) {
            %><td> <%= weekDisp.format(weekdayCount.getTime())%> </td>
            <% weekdayCount.set(Calendar.DAY_OF_WEEK,weekdayCount.get(Calendar.DAY_OF_WEEK)+1); // 曜日を加算 %>
        <%
        }
        %>
        </tr>
        <%
        while(calendarHeight) {
            %><tr> <%
            for (int j=0;j<7;j++) {
                %><td> <%
                if (calendarStart.get(Calendar.DAY_OF_WEEK) == weekdayCount.get(Calendar.DAY_OF_WEEK) && disp) { //曜日と一致確認
                    out.print(dateDisp.format(calendarStart.getTime()) + "\t"); //曜日と一致すれば表示
                    if (calendarStart.getTime().compareTo(calendarEnd.getTime())==0) { //表示後月末と一致確認
                        calendarHeight = false; //月末一致で縦ループと空欄有無変更
                        disp = false;
                    }else { // 月末でなければ日にちと曜日を加算
                        calendarStart.set(Calendar.DATE,calendarStart.get(Calendar.DATE)+1); /// 日にちを加算
                        weekdayCount.set(Calendar.DAY_OF_WEEK,weekdayCount.get(Calendar.DAY_OF_WEEK)+1); // 曜日を加算
                    }
                }  else { //日曜一致なければ空欄
                    out.print("/");
                    weekdayCount.set(Calendar.DAY_OF_WEEK,weekdayCount.get(Calendar.DAY_OF_WEEK)+1);
                }
                %></td> <%
            }
            %></tr> <%
        }
        %>
        </table>

</body>
</html>