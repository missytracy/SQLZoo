SELECT SUM(extras_amount + rate.amount*booking.nights)
FROM booking
JOIN
  (
  SELECT booking_id, SUM(amount) as extras_amount
  FROM extra
  WHERE booking_id = 5128
  GROUP BY booking_id) e
ON e.booking_id = booking.booking_id
JOIN rate
ON booking.room_type_requested = rate.room_type
AND rate.occupancy = booking.occupants
