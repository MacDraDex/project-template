This query display 3 constituencies with the most people that [:RUN_IN] them.
Query starts at node Constituency and it returns a constituencies with the most candidates connected to them in descending order. 
If you want to display more than 3 constituencies just change limit to any number.

start cons=node(*)
return cons, length(cons--()) as RUN_IN
order by RUN_IN desc
limit 3
