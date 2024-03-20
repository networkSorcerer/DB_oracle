create user boarduser identified by board1234;

grant create session to boarduser;

grant connect, resource to boarduser;

alter user boarduser
default tablespace users quota unlimited on users;