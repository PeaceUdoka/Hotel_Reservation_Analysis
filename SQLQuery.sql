
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
SELECT is_canceled, MIN(lead_time) AS min_lead_time,
MAX(lead_time) AS max_lead_time,
AVG(lead_time) AS avg_lead_time
FROM HOTELRESERVATIONS
GROUP BY is_canceled

-- cancellations by distribution channel
SELECT distribution_channel, COUNT(*) AS cancellations
FROM HOTELRESERVATIONS
WHERE is_canceled = 1 
GROUP BY distribution_channel
ORDER BY cancellations DESC

-- cancellations by assigned room type
SELECT assigned_room_type, COUNT(*) AS cancellations
FROM HOTELRESERVATIONS
WHERE is_canceled = 1 
GROUP BY assigned_room_type
ORDER BY cancellations DESC

-- impact of number of days in waiting list
SELECT is_canceled, AVG(days_in_waiting_list) AS avg_days_in_waiting_list
FROM HOTELRESERVATIONS
GROUP BY is_canceled

-- impact of adr
SELECT is_canceled, AVG(adr) AS avg_adr
FROM HOTELRESERVATIONS
GROUP BY is_canceled

-- impact of previous cancellations 
SELECT is_canceled, COUNT(previous_cancellations) AS previous_cancellations
FROM HOTELRESERVATIONS
GROUP BY is_canceled

-- MULTIVARIATE ANALYSIS
-- does assigning a different room affect cancellation
SELECT is_canceled, COUNT(*) AS cancellations
FROM HOTELRESERVATIONS
WHERE reserved_room_type != assigned_room_type
GROUP BY is_canceled

