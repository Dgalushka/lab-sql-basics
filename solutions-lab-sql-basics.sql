use bank;

-- query 1
select client_id from client
where district_id = 1
order by client_id asc
limit 5;

-- query 2
select max(client_id) from client
where district_id = 72;

-- query 3
select amount from loan
order by amount asc
limit 3;

-- query 4
select distinct(status) from loan
order by status asc;

-- query 5
select loan_id from loan
order by payments desc
limit 1;

-- query 6
select account_id,  amount from loan
order by account_id asc
limit 5;

-- query 7
select account_id from loan
where duration = 60
order by amount asc
limit 5;

-- query 8
select distinct(k_symbol) from bank.order
order by k_symbol asc;

-- query 9
select order_id from bank.order
where account_id = 34;

-- query 10
select account_id from bank.order
where order_id between 29540 and 29560;

-- query 11
select amount from bank.order
where account_to = 30067122;

-- query 12
select trans_id, date, type, account_id, amount from trans
where account_id = 793
order by date desc
limit 10;

-- query 13
select district_id, count(distinct(client_id)) as client_id_per_district from client
where district_id < 10
group by district_id
order by district_id asc;

-- query 14
select type, count(distinct(card_id)) as cards_per_type from card
group by type
order by count(distinct(card_id)) desc;

-- query 15
select * from loan;
select account_id, amount from loan
order by amount desc
limit 10;

-- query 16
select date, count(distinct(loan_id)) as loan_issued from loan
where date < 930907
group by date
order by date desc;

-- query 17 
select date, duration, count(distinct(loan_id)) from loan
where date > 971200 and date < 980000
group by date, duration
order by date, duration asc;

-- query 18
select * from trans;
select account_id, type, sum(amount) as sum_per_type from trans
where account_id = 396
group by type;

-- query 19
select account_id, 
case
	when type = 'PRIJEM' then 'INCOMING'
	when type = 'VYDAJ' then 'OUTCOMING'
end
as type, 
round(sum(amount), '.') as sum_per_type from trans

where account_id = 396
group by type;

-- task 20
SELECT distinct account_id,
(SELECT SUM(amount) FROM trans WHERE account_id = 396 AND type = 'PRIJEM' group by type) as 'INCOMING',
(SELECT SUM(amount) FROM trans WHERE account_id = 396 AND type = 'VYDAJ' group by type) as 'OUTCOMING',
(SELECT SUM(amount) FROM trans WHERE account_id = 396 AND type = 'PRIJEM' group by type) - (SELECT SUM(amount) FROM trans WHERE account_id = 396 AND type = 'VYDAJ' group by type) AS COUNT
from trans 
where account_id = 396;















