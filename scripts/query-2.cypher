This query looks for a node Constituency and property seats is used 
to display all constituencies with the number of seats 3  


MATCH (cons:Constituency)
WHERE cons.seats='3'
RETURN cons
