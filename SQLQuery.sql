
-- confirm all rows were imported
SELECT COUNT(*) FROM HOTELRESERVATIONS 

-- UNIVARIATE ANALYSIS
-- check cancelation rate
SELECT is_canceled, COUNT(*) AS cancellation_count
FROM HOTELRESERVATIONS
GROUP BY is_canceled

-- lead time statistics
SELECT MIN(lead_time) AS min_lead_time,
MAX(lead_time) AS max_lead_time,
AVG(lead_time) AS avg_lead_time
FROM HOTELRESERVATIONS

-- check busiest months
SELECT arrival_date_month, COUNT(*) AS reservations_count
FROM HOTELRESERVATIONS 
GROUP BY arrival_date_month
ORDER BY reservations_count DESC

-- meal type preferences
SELECT meal, COUNT(*) AS count
FROM HOTELRESERVATIONS
GROUP BY meal
ORDER BY count DESC

-- evaluate repeated guests 
SELECT is_repeated_guest, COUNT(*) AS guests_count 
FROM HOTELRESERVATIONS 
GROUP BY is_repeated_guest

-- room type preferences
SELECT reserved_room_type, COUNT(*) AS count
FROM HOTELRESERVATIONS
GROUP BY reserved_room_type
ORDER BY count DESC

-- deposit type preferences
SELECT deposit_type, COUNT(*) AS count
FROM HOTELRESERVATIONS
GROUP BY deposit_type
ORDER BY count DESC

-- highest performing agents
SELECT TOP 1 agent, COUNT(*) AS count
FROM HOTELRESERVATIONS
GROUP BY agent
ORDER BY count DESC

-- customer type statistics
SELECT customer_type, COUNT(*) AS count
FROM HOTELRESERVATIONS
GROUP BY customer_type
ORDER BY count DESC

-- adr statistics
SELECT MIN(adr) AS min_adr,
MAX(adr) AS max_adr,
AVG(adr) AS avg_adr
FROM HOTELRESERVATIONS 

-- BIVARIATE ANALYSIS
-- impact of lead time on cancellation