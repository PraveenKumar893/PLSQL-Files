CREATE OR REPLACE PACKAGE sales IS
	PROCEDURE  insertorders(ordid in orders.order_id%type , cusid in orders.customer_id%TYPE , status in orders.status%type , salesid in orders.salesman_id%type,
    orddate in orders.order_date%type);
    PROCEDURE  insertorderitems(ordid in order_items.order_id%type , itid in order_items.Item_id%TYPE , proid in order_items.product_id%type , quan in order_items.quantity%type,
    unitprice in order_items.unit_price%type);
    	PROCEDURE  updateorders(prodid  product_value.product_id%TYPE);
        	PROCEDURE deleteRecord(cusid orders.customer_id%type);
            




    
END sales;
/

CREATE OR REPLACE PACKAGE BODY sales AS
	PROCEDURE insertorders(ordid in orders.order_id%type , cusid in orders.customer_id%TYPE , status in orders.status%type , salesid in orders.salesman_id%type,
    orddate in orders.order_date%type)
    IS
		BEGIN
			insert into  orders  (Order_id,Customer_id,Status,salesman_id,order_date) 
            values (ordid,cusid,status,salesid,orddate);

 
            
            IF  SQL%FOUND THEN
				dbms_output.put_line('RECORD INSERTED');
			ELSE
				dbms_output.put_line('RECORD NOT FOUND');
			END IF;
            commit;
		END insertorders;
        	    PROCEDURE  insertorderitems(ordid in order_items.order_id%type , itid in order_items.Item_id%TYPE , proid in order_items.product_id%type , quan in order_items.quantity%type,
    unitprice in order_items.unit_price%type)
  IS
		BEGIN
			insert into  order_items  (Order_id,item_id,product_id,quantity,unit_price) 
            values (ordid,itid,proid,quan,unitprice);

 
            
            IF  SQL%FOUND THEN
				dbms_output.put_line('RECORD INSERTED');
			ELSE
				dbms_output.put_line('RECORD NOT FOUND');
			END IF;
            commit;
		END insertorderitems;
        
        PROCEDURE updateorders(prodid  product_value.product_id%TYPE)
        IS
		BEGIN
			Update product_value set Product_name = 'Air Buds'  where product_id = prodid;
			IF  SQL%FOUND THEN
				dbms_output.put_line('RECORD UPDATED');
			ELSE
				dbms_output.put_line('RECORD NOT FOUND');
			END IF;
		END updateorders;
        
        	PROCEDURE deleteRecord(cusid orders.customer_id%type) 
            IS
		BEGIN
			Delete from orders where customer_id = cusid ;
			IF  SQL%FOUND THEN
				dbms_output.put_line('RECORD UPDATED');
			ELSE
				dbms_output.put_line('RECORD NOT FOUND');
			END IF;
		END deleteRecord;


        

END sales;
/


Declare
Order_id Number(38);
CUSTOMER_ID  NUMBER(38);
STATUS       VARCHAR2(10); 
SALESMAN_ID  NUMBER(38);   
ORDER_DATE   VARCHAR2(20);
Order_id Number(38);
ITEM_ID     NUMBER(38);
PRODUCT_ID  NUMBER(38) ;
QUANTITY   NUMBER(38) ;
UNIT_PRICE  NUMBER(38) ;
PRODUCT_ID  NUMBER(38) ;
ccustomer_id Number(38);
begin
sales.insertorders(6879,9,'Packed',5,'31-12-2021');
sales.insertorderitems(6879,513,113,5,7000);
sales.updateorders(107);
sales.deleteRecord(1);

end;
/

select * from order_items;
select * from  orders;
select * from product_value;





