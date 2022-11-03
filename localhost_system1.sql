CREATE USER hej identified BY 1234;
ALTER USER hej identified BY 1234;
GRANT resource, CONNECT TO hej;
COMMIT;

ALTER USER hej identified BY hej account unlock;

ALTER USER hr identified BY 1234;
GRANT resource, CONNECT TO hr;
COMMIT;
ALTER USER hr identified BY hr account unlock;