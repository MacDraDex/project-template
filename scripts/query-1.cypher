This query is starting at the node candidate which the type of Candidate, then the property gender from Candidate 
is retrived and if its equal to Male it will return all the male candidates from the database.


start candidate=node(*)
match candidate
where has(candidate.gender) AND candidate.gender = 'Male'
return candidate
