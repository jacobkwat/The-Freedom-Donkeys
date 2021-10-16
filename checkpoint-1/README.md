# The-Freedom-Donkeys

To run this SQL code, simply load the postgres remote version of the CPDB and 
execute the SQL queries. There is no additional data needed outside of this.

CP1: 
What is the number of reprimands for each allegation category?

To answer this question, run the query CP1_Q1.sql. This query gives us the 
counts of disciplines for each allegation category.

Which categories have seen the largest percentage increase in reprimands as time has gone on?

We explored the the difference in percent reprimands for each category over a period
of ten years (between 2000-2010).

In CP1_Q2.sql there is a commented out block of code at the beginning which gives the number of 
reprimands for each allegation for each year. This can be used as a master table to find the difference 
over any given time period. Meanwhile, the actual un-commented code will give the 
percent change between 2000 and 2010, where 2000 and 2010 can be replaced with 
whatever timeframe we are trying to analyze.

How has the difference between the number of department and civilian complaints 
changed for different categories over time?

To run this, just execute the top SQL query in CP1_Q3.sql. This will give the 
difference between civilian and officer complaints for a given category each year.
However, because we are joining on matching year and category, there will be missing
information on complaints that happened for one group and not the other. For example,
if there was a civilian complaint for drug use in 2010 but no officer complaint for 
drug use that year, then that category would not appear. This will need to be added in
the future to this query. 


How have the number of civilian/police reprimands changed in relation to the number
 of allegations for specific “problem areas”?

This question can be answered by running the SQL queries in CP1_Q4.sql. First,
 run the top query to get number of civilian complaints for a given beat. Then, run
the bottom query to get the number of officer complaints for a given beat(area).
Finally, we still need to analyze these beats to find out which ones correspond to areas
of high crime, and see how many complaints exist for those areas.  
