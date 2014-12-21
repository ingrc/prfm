create table menu_master(id int GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL, url varchar(255), displayname varchar(50) not null, description varchar(255), type varchar(100) not null);

create table menu_position(menuid int, isleft int, istop int, foreign key (menuid) references menu_master(id));

insert into menu_master(url, displayname, type) values ('/riskmaintenance.html', 'Risk Maintenance', 'Risk Management');
insert into menu_master(url, displayname, type) values ('/controlmaintenance.html', 'Control Maintenance', 'Risk Management');
insert into menu_master(url, displayname, type) values ('/policymaintenance.html', 'Policy Maintenance', 'Risk Management');
insert into menu_master(url, displayname, type) values ('/controlsummaryreport.html', 'Control Summary Report', 'Risk Management');
insert into menu_master(url, displayname, type) values ('/risksummaryreport.html', 'Risk Summary Report', 'Risk Management');

insert into menu_master(url, displayname, type) values ('/useranalysis.html', 'User Analysis', 'Access Review');
insert into menu_master(url, displayname, type) values ('/singleroleanalysis.html', 'Single Role Analysis', 'Access Review');
insert into menu_master(url, displayname, type) values ('/compositeroleanalysis.html', 'Composite Role Analysis', 'Access Review');

insert into menu_master(url, displayname, type) values ('/heuristicchart.html', 'Heuristic', 'Heuristic Mining Algorithm');


insert into menu_position values(1, 1, 1);
insert into menu_position values(2, 1, 1);
insert into menu_position values(3, 1, 1);
insert into menu_position values(6, 0, 1);
insert into menu_position values(7, 0, 1);
insert into menu_position values(8, 0, 1);
