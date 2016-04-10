# Irish Constituencies Neo4j Database
###### Maciej Drabik, G00277045

## Introduction
This is a graph database which is representing the constituencies of Ireland and all candidates who run in them. This is a project for a module Graph Theory.  

## Database
Explain how you created your database, and how information is represented in it.

I have created this database using different methods such as creating nodes using cypher queries and loading data from a csv file  to demonstrate possible techniques that neo4j provide and they can be found in the [Neo4JDocumentation](http://neo4j.com/docs/).

| Nodes         | Description|
| ------------- |------------|
| Constituency  |This node displays the name of the constituency but also stores information such as population and number of seats|
| Candidate     | It is a node that stores a information about candidate such as Firstname , Party, Constituency and Gender |
| Party ( OPTIONAL ) | I have made some mistakes when I was designing this database and when you create a relationship between candidate and party,database works slow and nodes are all over the place. Can be added to database by using a query which is in supports folder|                 

This data base also contains two different types of relationships : [:RAN_IN] and :[IS_IN].
First relationship :[RAN_IN] is representing a candidate who run in a constituency and second relationships represents a candidate that belongs to some party.(it only works when a Party node is created)


## Queries
Summarise your three queries here.
Then explain them one by one in the following sections.

#### Query one title
This query retrives all the male candidates
```cypher
start candidate=node(*)
match candidate
where has(candidate.gender) AND candidate.gender = 'Male'
return candidate
```

#### Query two title
This query retreives the constituencies with the number of seats 
```cypher
MATCH (cons:Constituency)
WHERE cons.seats='3'
RETURN cons
```

#### Query three title
This query retreives the three constituencies with the most candidates 
```cypher
start cons=node(*)
WHERE(cons:Constituency)
return cons, length(cons--()) as RUNIN
order by RUNIN desc
limit 3
```

## References
1. [Neo4J website](http://neo4j.com/), the website of the Neo4j database.
2. [Irish Political Map](http://irishpoliticalmaps.blogspot.ie/2015/06/confirmed-candidates-for-next-general_3.html), constituencies + candidates 
3. [Neo4J Docs](http://neo4j.com/docs/stable/query-load-csv.html) - How to load a csv file
4. [Wikipedia List of Parliamentary constituencies of Republic of Ireland](https://en.wikipedia.org/wiki/Parliamentary_constituencies_in_the_Republic_of_Ireland)
