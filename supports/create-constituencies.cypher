// This query creates nodes representing all constituencies in Ireland.


CREATE (:Constituency {region:'Carlow-Kilkenny', population:'145,659', seats:'5'})
CREATE (:Constituency {region:'Cavan-Monaghan', population:'120,483', seats:'4'})
CREATE (:Constituency {region:'Clare', population:'111,336', seats:'4'})
CREATE (:Constituency {region:'Cork East', population:'114,365', seats:'4'})
CREATE (:Constituency {region:'Cork North Central', population:'117,170', seats:'4'})
CREATE (:Constituency {region:'Cork North West', population:'86,593', seats:'3'})
CREATE (:Constituency {region:'Cork South Central', population:'117,952', seats:'4'})
CREATE (:Constituency {region:'Cork South West', population:'82,952', seats:'3'})
CREATE (:Constituency {region:'Donegal', population:'152,358', seats:'5'})
CREATE (:Constituency {region:'Dublin Bay North', population:'146,512', seats:'5'})
CREATE (:Constituency {region:'Dublin Bay South', population:'116,396', seats:'4'})
CREATE (:Constituency {region:'Dublin Central', population:'89,030', seats:'3'})
CREATE (:Constituency {region:'Dublin Fingal', population:'141,162', seats:'5'})
CREATE (:Constituency {region:'Dublin Mid West', population:'110,427', seats:'4'})
CREATE (:Constituency {region:'Dublin North West', population: '90,534', seats:'3'})
CREATE (:Constituency {region:'Dublin Rathdown', population:'87,470', seats:'3'})
CREATE (:Constituency {region:'Dublin South Central', population:'114,660', seats:'4'})
CREATE (:Constituency {region:'Dublin South West', population:'144,908', seats:'5'})
CREATE (:Constituency {region:'Dublin West', population:'113,179', seats:'4'})
CREATE (:Constituency {region:'Dun Laoghaire', population:'118,791', seats:'4'})
CREATE (:Constituency {region:'Galway East', population:'89,564', seats:'3'})
CREATE (:Constituency {region:'Galway West', population:'150,874', seats:'5'})
CREATE (:Constituency {region:'Kerry', population:'145,502', seats:'5'})
CREATE (:Constituency {region:'Kildare North', population:'115,350'	, seats:'4'})
CREATE (:Constituency {region:'Kildare South', population:'115,350', seats:'3'})
CREATE (:Constituency {region:'Laois', population:'87,745', seats:'3'})
CREATE (:Constituency {region:'Limerick City', population:'113,835', seats:'4'})
CREATE (:Constituency {region:'Limerick County', population:'83,834', seats:'3'})
CREATE (:Constituency {region:'Longford-Westmeath', population:'116,802', seats:'4'})
CREATE (:Constituency {region:'Louth', population:'143,272', seats:'5'})
CREATE (:Constituency {region:'Mayo', population:'120,332', seats:'4'})
CREATE (:Constituency {region:'Meath East' , population:'86,572', seats:'3'})
CREATE (:Constituency {region:'Meath West', population:'85,550', seats:'3'})
CREATE (:Constituency {region:'Offaly', population:'87,640', seats:'3'})
CREATE (:Constituency {region:'Roscommon-Galway', population:'84,586', seats:'3'})
CREATE (:Constituency {region:'Sligo-Leitrim', population:'119,153', seats:'4'})
CREATE (:Constituency {region:'Tipperary', population:'147,801', seats:'5'})
CREATE (:Constituency {region:'Waterford', population:'113,795', seats:'4'})
CREATE (:Constituency {region:'Wexford', population:'145,320', seats:'5'})
CREATE (:Constituency {region:'Wicklow', population:'141,012', seats:'5'})



------------------------------------------------------------------------------
QUERY TO LOAD Candidates from csv which is located in repository candidatesList.csv
LOAD CSV WITH HEADERS FROM 'file:///C:\\Users\\Maciej\\Desktop\\candidatesList.csv' AS line
CREATE(:Candidate {firstname: line.Firstname, lastname: line.Lastname, party: line.Party, constituency: line.Constituency ,gender: line.Gender})
------------------------------------------------------------------------------ 
QUERY TO CREATE A RELATIONSHIP between candidates and constituencies 

MATCH (x:Candidate),(y:Constituency) WHERE HAS (x.constituency) AND HAS (y.region) AND x.constituency = y.region CREATE (x)-[:RUN_IN]->(y)
------------------------------------------------------------------------------
OPTIONAL QUERY TO CREATE A Party node 

CREATE (:Party {name: 'Fine Gael'}) 
CREATE (:Party {name: 'Labour'}) 
CREATE (:Party {name: 'Fianna Fail'}) 
CREATE (:Party {name: 'Sinn Fein'}) 
CREATE (:Party {name: 'Anti-Austerity'}) 
CREATE (:Party {name: 'Renua Ireland'}) 
CREATE (:Party {name: 'Social Democrats'}) 
CREATE (:Party {name: 'WUAG'}) 
CREATE (:Party {name: 'Independents'})
CREATE (:Party {name: 'Green Party'})
CREATE (:Party {name: 'Irish Democratic Party'}) 
CREATE (:Party {name: 'Workers Party'})

--------------------------------------------------------------------------------
and Optional query to create a relationship between a Party and candidates that contains the name of the party in the property.

MATCH (x:Candidate),(y:Party) WHERE HAS (x.party) AND HAS (y.name) AND x.party = y.name CREATE (x)-[:IS_IN]->(y)

and this is a query to display candidates from a party , in this example all the members will be displayed from the Labour party.
MATCH (p:Party {name: 'Labour'})
OPTIONAL MATCH (cand:Candidate)-[:IS_IN]->(p:Party)
RETURN cand,p
