Q1.How would you fetch details fo the customers who cancelled 

orders?

Select * from customers left join orders on 

orders.customer_id=customers.customer_id where 

orders.status="Cancelled";



Q2. Fetch the details of customers who have done payments 

between the amount 5,000 and 35,000?

select * from customers left join payments on 

payments.customer_id=customers.customer_id where 

payments.amount between 5000 and 35000 order by 

payments.amount;




Q3.Add new employee/salesman with following details

insert into employees

(employee_id,last_name,first_name,extension,email,office_code,r

eports_to,job_title)values

(15657,"Roy","Lakshmi","x4065","lakshmiroy1@lcomotors.com",4,10

88,"Sales Rep");


Q4. Assign the newemployee to the customer whose phone is 

2125557413.

update customers set customers.sales_employee_id=15657 where 

customers.phone=2125557413;

Q5.write sql query to fetch shipped motorcycles.

select * from orders left join orderdetails on 

orderdetails._order_id=orders.order_id left join products on 

orderdetails.product_code=products.product_code where 

products.product_line="Motorcycles" and orders.status="Shipped" 

;

Q6.write sql query o get details of all employees/salesmen in 

the office located in Sydney.

select 

employees.employee_id,employees.first_name,employees.last_name,

employees.email,employees.extension,employees.job_title,employe

es.office_code from employees left join ofices on 

employees.office_code=offices.office_code where 

offices.city="Sydney";


Q7. How would fetch the details of customers whose ordrs are in 

process?
select 

customers.customer_id,customers.first_name,customers.last_name, 

customers.phone,customers.address_line1,customers.address_line2 

,customers.city,customers.state,customers.postal_code,customers 

.country,customers.credit_limit,orders.order_id,orders.status 

from customers left join orders on 

orders.customer_id=customers.customer_id where 

orders.status="In Process"


Q8.how would you fetch the details of products with less than 

30 orders?

select *,productlines.product_line,productlines.description as 

productline_description,orderdetails.quantity_ordered,orderdeta

ils.order_id from products right join productlines on 

productlines.product_line=products.product_line left join 

orderdetails on orderdetails.product_code=products.product_code 

where orderdetails.quantity_ordered<30



q9.It is noted that the payment (check number OM314933) WAS 

actually 2575. update the record.

update payments set amount=2575 where 

payments.check_number="om314933";


q10.fetch the details of salesmen/employees dealing with 

customers whose orders are resolved.

select distinct employees.employee_id, 

employees.first_name,employees.last_name,employees.email,employ

ees.job_title,employees.extension,customers.customer_id,orders.

order_id,orders.status from employees left join customers on 

customers.sales_employee_id=employees.employee_id right join 

orders on orders.customer_id=customers.customer_id where 

orders.status="Resolved"


Q11.get the details of the customer who made the maximum 

payment.


select * from customers right join payments on 

customers.customer_id=payments.customer_id where 

payments.amount=(select max(amount) from payments);

q12.fetch list of orders shipped to france.


select 

orders.order_id,orders.order_date,orders.required_date,orders.s

hipped_date,orders.status,orders.comments,orders.customer_id,cu

stomers.country from orders left join customers on 

customers.customer_id=orders.customer_id where 

customers.country="France" and orders.status="shipped";



q13.how many customers are from finland who placed orders.


select customers.customer_id,orders.order_id,count

(customers.customer_id)from customers right join orders on 

orders.customer_id=customers.customer_id where 

customers.country="Finland";


q14.get the details of the customer who made the maximum 

payment.

select * from customers right join payments on 

customers.customer_id=payments.customer_id where 

payments.amount=(select max(amount)from payments)
;




q15. Get the detailsof the customer and payments they mad 

between may 2019 and june 2019.

select 

customers.customer_id,customers.first_name,customers.last_name,

customers.phone,customers.address_line1,customers.address_line2

,customers.city,customers.state,customers.postal_code,customers

.country,customers.credit_limit,payments.payment_date from 

customers left join payments on 

payments.customer_id=customers.customer_id where 

payments.payment_date between '2019-05-01' and '2019-06-30';

q16.how many orders shipped tobelgium in 2018?


select count(orders.order_id)from orders inner join customers 

on customers.customer_id=orders.customer_id where 

customers.country="Belgium" And orders.shipped_date between 

'2019-01-01' and '2019-12-31';

Q17.get the details of the salesman/employee with offices 

dealing with customers in germany.
select * ,customers.customer_id,* from employees cross join 

offices on offices.office_code=employees.office_code left join 

customers on customers.sales_employee_id=employees.employee_id 

where customers.country="Germany";





q18.the customer id:496 made a new order today.


insert into orders

(order_id,order_date,required_date,status,customer_id)values

(10426,current_date(),(current_date()+interval 10 day),"In 

Process",496);



insert into order_details

(order_id,product_code,quantity_orderd,each_price,order_line_nu

mber)values(10426,"S12_3148",41,151,11);


q19.fetch details of employees who were reported for the 

payments made by the customers between june2018 and july2018.


select 

reported_emp.employee_id,reported_emp.first_name,reported_emp.l

ast_name,reported_emp.email,reported_emp.job_title,reported_emp

.extension,employees.employee_id as 

reported_by_employee,customers.customer_id from employees join 

employees reported_emp on 

reported_emp.employee_id=employees.reports_to left join 

customers on customers.sales_employee_id=employees.employee_id 

right join payments on 

payments.customer_id=customers.customer_id where 

payments.payment_date between '2018-06-01' and '2018-07-31';



q20.

insert into payments

(customer_id,check_number,payment_date,amount)values

(119,"OM314944",current_date(),33789.55);





q21.get the address of the office of the employees that reports 

to the employee whose id is 1102.

select * from employees join reports_emp on 

reports_emp.employee_id=employees.reports_to right join offices 

on offices.office_code=employees.office_code where 

employees.reports_to=""1102;




q22.Get the details of the payments of classic cars.



select *,customers.customer_id as done_by from payments left 

join customers on customers.customer_id=payments.customer_id 

right join orders on orders.customer_id=customers.customer_id 

left join orderdetails on orderdetails.order_id=orders.order_id 

left join products on 

products.product_code=orderdetails.product_code where 

products.product_line="Classic Cars";


q23.

how many customers ordered from the usa?


select count(*)from customers left join orders on 

orders.customer_id=customers.customer_id where 

customers.country="USA";


q24.get the comments regarding resolved orders.

select orders.comments,orders.customer_id from orders where 

orders.status="Resolved";

25.fetch the details of employees/salesmen in the usa with 

office addresses.


select 

*,offices.office_code,offices.addressline1,offices.addressline2

,offices.phone,offices.city,offices.state,offices.country,offic

es.postal_code,offices.territory from employees left join 

offices on offices.office_code=employees.office_code where 

offices.country="USA";


26.fetch total price of each order of motorcycles


select 

orderdetails.product_code,products.product_name,product.product

_line,orderdetails.quantity_orderd,orderdetails.each_price,orde

rdetails.quantity_orderd*orderdetails.each_price as total_price 

from orderdetails left join products on 

products.product_code=orderdetails.product_code where 

products.product_line="Motorcycles";


27.get the total worth of all planes ordered.


select sum

(orderdetails.quantity_ordered*orderdetails.each_price)as 

total_price from orderdetails left join products on 

products.product_code=orderdetails.product_code where 

products.product_line="Planes";


28.how many customers belong to France?

select count(*) from customers where 

customers.country="France";


29.get the payments of customers living in france.


select 

*,payments.payment_date,payments.amount,payments.check_number 

from customers inner join payments on 

payments.customer_id=customers.customer_id where 

customers.country="France";

q30.Get the office address of the employees / salesmen who 

report to employee 1143.

select distinct offices.office_code,
offices.address_line1,offices.address_line2,offices.city,office

s.phone,offices.state,offices.country,offices.postal_code,offic

es.territory,employees.employee_id from offices left join 

employees on offices.office_code=employees.office_code where 

employees.reports_to=1143;















