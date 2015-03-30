INSERT INTO fursuiter_users
	(username,password,email,realname)
VALUES
	('copperbadger','$2a$04$XzRubrJWCj/pgAIk7.33TeRitB82GeAb7dBMvXxKLzvyL9iKMzYui','badger@fursuiter.net','Copper Badger'),
	('rechner','$2a$04$XzRubrJWCj/pgAIk7.33TeRitB82GeAb7dBMvXxKLzvyL9iKMzYui','fox@fursuiter.net','Rechner Fox'),
	('jacktail','$2a$04$XzRubrJWCj/pgAIk7.33TeRitB82GeAb7dBMvXxKLzvyL9iKMzYui','jack@fursuiter.net','Jack Tail'),
	('dreae','$2a$04$XzRubrJWCj/pgAIk7.33TeRitB82GeAb7dBMvXxKLzvyL9iKMzYui','otter@fursuiter.net','Dreae Otter'),
	('mankeulv','$2a$04$XzRubrJWCj/pgAIk7.33TeRitB82GeAb7dBMvXxKLzvyL9iKMzYui','yote@fursuiter.net','Mankelv Coyote'),
	('insomnicon','$2a$04$XzRubrJWCj/pgAIk7.33TeRitB82GeAb7dBMvXxKLzvyL9iKMzYui','insomnicon@fursuiter.net','Insomnicon Fuzzy'),
	('testuser','$2a$04$XzRubrJWCj/pgAIk7.33TeRitB82GeAb7dBMvXxKLzvyL9iKMzYui','test@fursuiter.net','Test User');

INSERT INTO fursuiter_characters
	(user_id,name,gender,species)
VALUES
	(1,'Copper','Male','Badgerdog'),
	(2,'Rechner','Male','Red Fox'),
	(3,'Jacktail','Male','Cheetah'),
	(4,'Dreae','Male','Otter'),
	(7,'Oakley','Female','Husky');

INSERT INTO fursuiter_galleries
	(user_id,name,description)
VALUES
	(4,'Otter Stuff','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta fugiat, qui praesentium voluptate omnis possimus, vero necessitatibus consequatur ab nobis commodi libero minus soluta vel provident rerum saepe. Recusandae, sunt?'),
	(5,'Yote Pics','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint, consectetur accusamus soluta corporis iusto repudiandae possimus vero minima, obcaecati facere omnis consequuntur similique, optio voluptatum esse quae quisquam. Et, libero?');

INSERT INTO fursuiter_groups
	(name,description)
VALUES
	('The Programmers Guild','Are you a programming furry? Join today!'),
	('EEFF: Electrical Engineers of the Furry Fandom','Official home of the electrical engineers within the fandom!'),
	('Cool Cats','Felines of all sorts! Come one, come all!'),
	('Badgers','For badgers by badgers!'),
	('Makers','The original and official group for fursuit makers on Fursuiter.net.'),
	('Canines','All canines of Fursuiter.net!');

INSERT INTO fursuiter_groupmembers
	(user_id,group_id)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(2,2),
	(3,2),
	(3,3),
	(1,4),
	(1,6),
	(2,6),
	(5,6),
	(6,6);