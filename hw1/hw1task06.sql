select dt, high_price, vol from coins where (avg_price > 0.001 and symbol = 'DOGE' and left(dt, 4) = '2018');
