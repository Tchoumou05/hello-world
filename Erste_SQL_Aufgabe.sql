
 

--Wie alt ist John Doe?

SELECT age
FROM Customers
where first_name = 'John' and last_name = 'Doe';

--Wie viele Kunden gibt es in der Datenbank?

select count(customer_id)
from Customers;
oder
select count(distinct(customer_id))
from Customers;

--Welcher Kunde ist der älteste? Oder function max()

SELECT first_name, last_name, age
FROM Customers
order by age desc
limit(1);
oder
SELECT first_name, last_name, max(age)
FROM Customers;


--Wie viele Kunde haben denselben Vornamen John?

SELECT count(first_name) oder count(customer_id)
FROM Customers
where first_name = 'John';

oder
SELECT count(customer_id) 
FROM Customers
where first_name = 'John';


-- Welcher Kunde hat die höchste Bestellung? John Reinhardt

select Customers.first_name, Customers.last_name, count (Orders.item) as total_orders
from Customers
inner Join Orders on Customers.customer_id = Orders.customer_id
group by (last_name)
order by total_orders desc;

-- Welcher Kunde hat am meisten ausgegeben? David Robinson 

select Customers.first_name, Customers.last_name, sum(Orders.amount)
from Customers
inner Join Orders on Customers.customer_id = Orders.customer_id
group by 1,2;

--Welcher Kunde hat keine Bestellung gemacht? Betty Doe

select Customers.first_name, Customers.last_name, Orders.item
from Customers
left OUTER JOIN Orders on Customers.customer_id = Orders.customer_id
where item is null;

--Wie viele Bestellungen gibt es?

select count(item)
from orders;

-- was ist die Gesamtsumme aller Bestellungen? 

select sum (amount) as Total_amount
from Orders;

--Welche Kunden haben eine Tastatur(Keyboard) bestellt und wie viel hat die Tastatur/das Keyboard gekostet?

select Customers.first_name, Customers.last_name, Orders.item, Orders.amount
from Customers
left OUTER JOIN Orders on Customers.customer_id = Orders.customer_id
where item = 'Keyboard';

--wie viele Kunden mehr als drei Bestellungen gemacht haben? Having ()

select Customers.first_name, Customers.last_name , count (Orders.item) as total_orders
from Customers
inner Join Orders on Customers.customer_id = Orders.customer_id
group by 1,2
having count(Orders.item)>3;
