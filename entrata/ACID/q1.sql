

-- function 

CREATE FUNCTION claculate_late_rate(
    rent_amount DECIMAL(10,2),
    late_days INT
)

SELECT tenent_id, rent, claculate_late_rate(rent_amount, late_days) as late_fee
FROM tenant_rent;
