CREATE USER IF NOT EXISTS 'public_access' IDENTIFIED BY '0000';
CREATE USER IF NOT EXISTS 'staff' IDENTIFIED BY '1111';
CREATE USER IF NOT EXISTS 'courier_side' IDENTIFIED BY '2222';
CREATE USER IF NOT EXISTS 'admin' IDENTIFIED BY '3333';


GRANT SELECT,INSERT,DELETE,UPDATE ON angaadi.cart TO public_access;
GRANT SELECT,INSERT,DELETE,UPDATE ON angaadi_users.users TO public_access;
GRANT SELECT,INSERT,DELETE,UPDATE ON angaadi.Product_Variant TO public_access;
GRANT SELECT ON angaadi.main_city TO public_access;
GRANT SELECT,INSERT,DELETE,UPDATE ON angaadi.variant_detail TO public_access;
GRANT SELECT,INSERT,DELETE,UPDATE ON angaadi.Product TO public_access;
GRANT SELECT,INSERT,DELETE,UPDATE ON angaadi.category TO public_access;
GRANT SELECT,INSERT,DELETE,UPDATE ON angaadi.category_products TO public_access;
GRANT SELECT,INSERT,DELETE,UPDATE ON angaadi.customer TO public_access;
GRANT SELECT,INSERT,DELETE,UPDATE ON angaadi.guest TO public_access;
GRANT SELECT,INSERT,DELETE,UPDATE ON angaadi.orders TO public_access;
GRANT SELECT,INSERT,DELETE,UPDATE ON angaadi.payment TO public_access;
GRANT SELECT,INSERT,DELETE,UPDATE ON angaadi.shipping_address TO public_access;

GRANT SELECT,INSERT,DELETE,UPDATE ON *.* TO staff;
GRANT SELECT,INSERT,DELETE,UPDATE ON *.* TO admin;

GRANT SELECT,INSERT,UPDATE ON angaadi.freight_details TO courier_side;
GRANT SELECT,UPDATE ON angaadi.orders TO courier_side;




