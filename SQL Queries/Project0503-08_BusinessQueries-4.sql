--1. How any properties that were facilitated by agents have successsfully translated into 
--leases and what were the incomes earned by the agents for facilitating the properties?
SELECT a.*, COUNT(p.pID) AS 'Properties Facilitated', (p.pRent + 0.5*l.leaseSecurityDeposit) AS 'Agent Commission'
FROM [Studomes.Agent] a, [Studomes.Property] p, [Studomes.Lease] l
WHERE p.agID = a.agID AND p.pID = l.pID
GROUP BY a.agID, a.agName, a.agContact, a.agEmail, p.pId, p.pRent, l.leaseSecurityDeposit


-----2. What are the number of properties on each type(catgory) along with average rent?
SELECT t.tCategory, count(p.pID) as 'Number of Properties', AVG(p.pRent) AS 'Avg Rent' 
FROM [Studomes.Property] p,[Studomes.Type] t
WHERE p.tID=t.tID 
GROUP BY t.tCategory

---3. What are the total amenities on each property
SELECT p.pID ,COUNT(i.amyID) AS 'No. of amenities'
FROM [Studomes.Amenity] a, [Studomes.Property] p, [Studomes.Include] i
WHERE p.pID = i.pID AND a.amyID = i.amyID
GROUP BY p.pID 

--4. What is the count of customers for each type of housing options?

SELECT t.tCategory, COUNT(l.cID) AS 'Number of Customers'
FROM [Studomes.Lease] l, [Studomes.Property] p, [Studomes.Type] t
WHERE p.tID = t.tID AND l.pID = p.pId
GROUP BY t.tCategory, l.cID
