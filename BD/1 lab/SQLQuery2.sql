SELECT Дата_поставки
FROM     ЗАКАЗЫ
WHERE  (Дата_поставки > CONVERT(DATETIME, '2022-10-10 00:00:00', 102))