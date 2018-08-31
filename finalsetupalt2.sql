USE db_librarymanagement
GO

DROP TABLE tbl_book, tbl_book_authors, tbl_bookcopies, tbl_bookloans, tbl_borrower, tbl_library_branch, tbl_publisher;

--CREATE

CREATE TABLE tbl_publisher (
	name VARCHAR(50) PRIMARY KEY NOT NULL,
	address VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_borrower (
	cardno VARCHAR(50) NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_library_branch (
	branchID INT NOT NULL PRIMARY KEY,
	branchname VARCHAR(50),
	address VARCHAR(50)
);

CREATE TABLE tbl_book (
	bookID INT PRIMARY KEY NOT NULL,
	title VARCHAR(50) NOT NULL,
	publishername VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES tbl_publisher(name)
);

CREATE TABLE tbl_book_authors (
	bookID INT NOT NULL FOREIGN KEY REFERENCES tbl_book(bookID),
	authorname VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_bookloans (
	bookID INT NOT NULL FOREIGN KEY REFERENCES tbl_book(bookID),
	branchID INT NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(branchID), 
	cardno VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES tbl_borrower(cardno),
	dateout DATE NOT NULL,
	duedate DATE NOT NULL
);

CREATE TABLE tbl_bookcopies (
	bookID INT NOT NULL FOREIGN KEY REFERENCES tbl_book(bookID),
	branchID INT NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(branchID),
	no_of_copies INT NOT NULL
);

--POPULATE

INSERT INTO tbl_publisher
	(name, address, phone)
	VALUES
	('Publish Kings', '1224 NW Lovejoy, RuralVille TX', 4039320092),
	('Horror Publisher', '2334 SW Realroad, Placetown NY', 2039390092),
	('Lost Tribe Publishing', '2349 Streetroad, Town KY', 4039948584),
	('Farm Lords', '5936 Bay Point Dr, Lake Oswego OR', 3049548894),
	('San Antonio Publishing', '1993 Magus Ct, San Antonio TX', 3029948384),
	('Wildlife Guys', '9342 Gravelroad, Redding CA', 2034589934),
	('Arctic Publishing', '2388 Icelane, Coldtown AK', 4039948383),
	('Wordsmith Publishing', '5268 Beachroad, Islandtown HI', 1039043345)
;

INSERT INTO tbl_borrower
	(cardno, name, address, phone)
	VALUES
	(1256873497722561, 'Jim Shifty', '1234 Happy Lane', 5037625982),
	(7324996284422877, 'Sue Trusty', '5068 Jerk City', 5038444172),
	(8333299187418330, 'Eric Quail', '9361 Hog Town', 5037177222),
	(7294014709711999, 'Samantha Quail', '0021 Redding', 5038407999),
	(9744474798888722, 'Wendy Frost', '2021 Woopville', 5039432243),
	(0987745298720887, 'Jim Jean', '8046 Sanders Ave', 5034127691),
	(3434277776242697, 'Slater Crater', '9222 Glomptown', 5034401970),
	(5430072496720871, 'Joanna Jed', '2727 Higgleson Dr', 5038212716),
	(6237862473921987, 'Phil Thee', '1452 Watts St', 5031213436),
	(5320986672420092, 'Matt Crab', '5486 Westville', 5037205340),
	(9432758374662913, 'Chris Wattro', '3029 Northville', 5038412234),
	(0293849300992343, 'Monk Grickerson', '3240 South St', 5038298844),
	(2309990938432234, 'Kim Krockerston', '2304 Upperville', 5034569903),
	(1123002394539298, 'Erin Smith', '9403 Downsville', 5034458293),
	(2384182839482918, 'William Riker', '3291 Space Dr', 5034929382),
	(2310849283740192, 'Christine Smith', '3929 Well St', 50398289493),
	(9827849275742911, 'Jeremiah Bullfrog', '9837 Wine St', 5030932738),
	(1221939204039832, 'Oliver South', '4738 Kriskit Ave', 5032980093),
	(8382023494830123, 'Logan Scotch', '9321 Carpet Ave', 5034592387),
	(3728939280012001, 'Bob Ross', '9231 Stockton', 3928430203),
	(0293928398731243, 'Pam Genelais', '0992 Street St', 5039283948),
	(2311039298837234, 'Jordan Brown', '5443 Bay St', 5038234848),
	(3434583220019833, 'Anna Jefferson', '9834 Gourd Ave', 5039842390),
	(2200894123297644, 'Max Jones', '2442 Mosquito Dr', 5034592234)
;

INSERT INTO tbl_library_branch
	(branchID, branchname, address)
	VALUES
	(1, 'Wilsonville', '8383 Smith road, Wilsonville OR'),
	(2, 'Sharpstown', '2234 Rocky Trail, Sharpstown OR'),
	(3, 'Central', '1234 NW 23rd Ave, Portland OR'),
	(4, 'Crescent', '3325 High Road, Crescent Falls OR')
;

INSERT INTO tbl_book
	(bookID, title, publishername)
	VALUES
	(1, 'How To Shave a Cat', 'Publish Kings'),
	(2, 'Scary Horror Stuff', 'Horror Publisher'),
	(3, 'The Lost Tribe', 'Lost Tribe Publishing'),
	(4, 'How to Milk Anything', 'Farm Lords'),
	(5, 'Twine King of San Antonio', 'San Antonio Publishing'),
	(6, 'More Horror', 'Horror Publisher'),
	(7, 'Where is my Goat?', 'San Antonio Publishing'),
	(8, 'Microscopic Skyscrapers', 'Publish Kings'),
	(9, 'A History of Elk', 'Wildlife Guys'),
	(10, 'What are Pigs?', 'Wildlife Guys'),
	(11, 'The Secret Benefits of Disease', 'Publish Kings'),
	(12, 'Little House in Antarctica', 'Arctic Publishing'),
	(13, 'Book of Words', 'Wordsmith Publishing'),
	(14, 'Destroying Communication', 'Wordsmith Publishing'),
	(15, 'Book 345', 'San Antonio Publishing'),
	(16, 'Woop Book Time', 'Horror Publisher'),
	(17, 'The Lost Tribe 2: Lostest', 'Lost Tribe Publishing'),
	(18, 'Really Bendy Arm', 'San Antonio Publishing'),
	(19, 'Biography of Stretch Armstrong', 'Publish Kings'),
	(20, 'Astral Projection for Beginners', 'Lost Tribe Publishing')
;	

INSERT INTO tbl_book_authors
	(bookID, authorname)
	VALUES
	(1, 'Jimmy Smith'),
	(2, 'Stephen King'),
	(3, 'Laura McGillicutty'),
	(4, 'John Milkersmith'),
	(5, 'Lawrence Trabe'),
	(6, 'Stephen King'),
	(7, 'Kristen Krut'),
	(8, 'Gillian Moreno'),
	(9, 'Kristen Krut'),
	(10, 'Kristen Krut'),
	(11, 'Tragget McFlurb'),
	(12, 'Laura Ingalls Wildest'),
	(13, 'Shaker Speares'),
	(14, 'Shaker Speares'),
	(15, 'HUMAN 324'),
	(16, 'Stephen King'),
	(17, 'Laura McGillicutty'),
	(18, 'HUMAN 324'),
	(19, 'Jim Bagladucie'),
	(20, 'Kamet Mahazzerad')
;	
SELECT * FROM tbl_borrower WHERE cardno = 1256873497722561
INSERT INTO tbl_bookloans
	(BookID, BranchID, cardno, dateout, duedate)
	VALUES
	(1, 2, 1256873497722561, '2018/02/07', '2018/03/09'),
	(1, 3, 1256873497722561, '2018/02/07', '2018/03/07'),
	(5, 3, 1256873497722561, '2018/02/09', '2018/03/09'),
	(7, 3, 1256873497722561, '2018/02/10', '2018/03/10'),
	(13, 3, 1256873497722561, '2018/02/07', '2018/03/07'),
	(17, 3, 1256873497722561, '2018/02/08', '2018/03/08'),
	(2, 1, 7324996284422877, '2018/01/18', '2018/02/18'),
	(3, 1, 7324996284422877, '2018/01/18', '2018/02/18'),
	(6, 1, 7324996284422877, '2018/01/20', '2018/02/20'),
	(9, 1, 7324996284422877, '2018/01/20', '2018/02/20'),
	(10, 1, 7324996284422877, '2018/01/21', '2018/02/21'),
	(11, 2, 8333299187418330, '2018/03/03', '2018/04/03'),
	(6, 2, 8333299187418330, '2018/03/04', '2018/04/04'),
	(13, 2, 7294014709711999, '2018/03/06', '2018/04/06'),
	(10, 4, 9744474798888722, '2018/02/13', '2018/03/13'),
	(11, 4, 9744474798888722, '2018/02/15', '2018/03/15'),
	(3, 1, 0987745298720887, '2018/04/12', '2018/05/12'),
	(5, 1, 0987745298720887, '2018/04/12', '2018/05/12'),
	(7, 1, 0987745298720887, '2018/04/12', '2018/05/12'),
	(9, 1, 0987745298720887, '2018/04/14', '2018/05/14'),
	(4, 4, 3434277776242697, '2018/05/14', '2018/06/14'),
	(5, 4, 3434277776242697, '2018/05/16', '2018/06/16'),
	(6, 4, 3434277776242697, '2018/05/17', '2018/06/17'),
	(13, 4, 3434277776242697, '2018/05/17', '2018/06/17'),
	(14, 4, 3434277776242697, '2018/05/17', '2018/06/17'),
	(15, 4, 3434277776242697, '2018/05/17', '2018/06/17'),
	(2, 2, 5430072496720871, '2018/06/02', '2018/07/02'),
	(3, 2, 5430072496720871, '2018/06/03', '2018/07/03'),
	(4, 2, 5430072496720871, '2018/06/04', '2018/07/04'),
	(9, 2, 5430072496720871, '2018/06/04', '2018/07/04'),
	(11, 2, 5430072496720871, '2018/06/04', '2018/07/04'),
	(12, 2, 5430072496720871, '2018/06/07', '2018/07/07'),
	(9, 3, 6237862473921987, '2018/02/08', '2018/03/08'),
	(10, 3, 6237862473921987, '2018/02/10', '2018/03/10'),
	(11, 3, 6237862473921987, '2018/02/10', '2018/03/10'),
	(17, 3, 6237862473921987, '2018/02/12', '2018/03/12'),
	(18, 3, 6237862473921987, '2018/02/12', '2018/03/12'),
	(19, 3, 6237862473921987, '2018/02/14', '2018/03/14'),
	(18, 1, 5320986672420092, '2018/04/04', '2018/05/04'),
	(20, 1, 5320986672420092, '2018/04/04', '2018/05/04'),
	(8, 3, 9432758374662913, '2018/05/22', '2018/06/22'),
	(9, 3, 9432758374662913, '2018/05/22', '2018/06/22'),
	(10, 3, 9432758374662913, '2018/05/24', '2018/06/24'),
	(11, 3, 9432758374662913, '2018/05/24', '2018/06/24'),
	(13, 3, 9432758374662913, '2018/05/25', '2018/06/25'),
	(1, 4, 0293849300992343, '2018/03/04', '2018/04/04'),
	(4, 4, 0293849300992343, '2018/03/05', '2018/04/05'),
	(5, 4, 0293849300992343, '2018/03/06', '2018/04/06'),
	(8, 4, 0293849300992343, '2018/03/07', '2018/04/07'),
	(10, 4, 0293849300992343, '2018/03/07', '2018/04/07'),
	(11, 4, 0293849300992343, '2018/03/08', '2018/04/08'),
	(2, 2, 2309990938432234, '2018/04/23', '2018/05/23'),
	(3, 2, 2309990938432234, '2018/04/23', '2018/05/23'),
	(8, 2, 2309990938432234, '2018/04/24', '2018/05/24'),
	(11, 2, 2309990938432234, '2018/04/24', '2018/05/24'),
	(12, 2, 2309990938432234, '2018/04/26', '2018/05/26'),
	(13, 2, 2309990938432234, '2018/04/26', '2018/05/26'),
	(8, 3, 1123002394539298, '2018/06/03', '2018/06/03'),
	(9, 3, 1123002394539298, '2018/06/04', '2018/06/04'),
	(10, 3, 1123002394539298, '2018/06/04', '2018/06/04'),
	(17, 3, 1123002394539298, '2018/06/05', '2018/06/05'),
	(1, 4, 2384182839482918, '2018/04/13', '2018/05/13'),
	(7, 4, 2384182839482918, '2018/04/14', '2018/05/14'),
	(10, 4, 2384182839482918, '2018/04/17', '2018/05/17'),
	(16, 4, 2384182839482918, '2018/04/17', '2018/05/17'),
	(4, 1, 2310849283740192, '2018/02/20', '2018/03/20'),
	(17, 1, 2310849283740192, '2018/02/20', '2018/03/20'),
	(12, 2, 9827849275742911, '2018/01/14', '2018/02/14'),
	(10, 1, 1221939204039832, '2018/05/26', '2018/06/26'),
	(12, 1, 1221939204039832, '2018/05/26', '2018/06/26'),
	(17, 1, 1221939204039832, '2018/06/01', '2018/07/01'),
	(18, 1, 1221939204039832, '2018/06/02', '2018/07/02'),
	(8, 3, 8382023494830123, '2018/03/21', '2018/04/21'),
	(9, 3, 8382023494830123, '2018/03/21', '2018/04/21'),
	(14, 3, 8382023494830123, '2018/03/24', '2018/04/24'),
	(20, 3, 8382023494830123, '2018/03/24', '2018/04/24'),
	(18, 4, 3728939280012001, '2018/01/01', '2018/02/01'),
	(19, 4, 3728939280012001, '2018/01/02', '2018/02/02'),
	(20, 4, 3728939280012001, '2018/01/02', '2018/02/02'),
	(15, 4, 3728939280012001, '2018/01/05', '2018/02/05'),
	(19, 1, 0293928398731243, '2018/05/06', '2018/06/06')
;

INSERT INTO tbl_bookcopies
	(bookID, branchID, no_of_copies)
	VALUES
	(1, 1, 0),
	(1, 2, 0),
	(1, 3, 2),
	(1, 4, 4),
	(2, 1, 2),
	(2, 2, 2),
	(2, 3, 3),
	(2, 4, 0),
	(3, 1, 2),
	(3, 2, 4),
	(3, 3, 2),
	(3, 4, 0),
	(4, 1, 5),
	(4, 2, 2),
	(4, 3, 0),
	(4, 4, 2),
	(5, 1, 2),
	(5, 2, 0),
	(5, 3, 0),
	(5, 4, 6),
	(6, 1, 3),
	(6, 2, 2),
	(6, 3, 2),
	(6, 4, 2),
	(7, 1, 2),
	(7, 2, 3),
	(7, 3, 2),
	(7, 4, 2),
	(8, 1, 0),
	(8, 2, 0),
	(8, 3, 5),
	(8, 4, 7),
	(9, 1, 3),
	(9, 2, 8),
	(9, 3, 12),
	(9, 4, 0),
	(10, 1, 5),
	(10, 2, 0),
	(10, 3, 6),
	(10, 4, 8),
	(11, 1, 3),
	(11, 2, 3),
	(11, 3, 9),
	(11, 4, 2),
	(12, 1, 4),
	(12, 2, 7),
	(12, 3, 6),
	(12, 4, 0),
	(13, 1, 0),
	(13, 2, 3),
	(13, 3, 8),
	(13, 4, 2),
	(14, 1, 0),
	(14, 2, 4),
	(14, 3, 4),
	(14, 4, 5),
	(15, 1, 0),
	(15, 2, 0),
	(15, 3, 2),
	(15, 4, 3),
	(16, 1, 0),
	(16, 2, 8),
	(16, 3, 0),
	(16, 4, 7),
	(17, 1, 7),
	(17, 2, 0),
	(17, 3, 3),
	(17, 4, 2),
	(18, 1, 8),
	(18, 2, 0),
	(18, 3, 9),
	(18, 4, 3),
	(19, 1, 3),
	(19, 2, 3),
	(19, 3, 3),
	(19, 4, 3),
	(20, 1, 2),
	(20, 2, 2),
	(20, 3, 2),
	(20, 4, 2)
;

--PROCEDURES


-- 1: How many copies of "The Lost Tribe" owned by Sharpstown branch?

CREATE PROC LP_TLP_Sharp
AS
SELECT tbl_bookcopies.no_of_copies, tbl_library_branch.branchname, tbl_book.title 
FROM tbl_bookcopies
INNER JOIN tbl_book ON tbl_book.bookID = tbl_bookcopies.bookID
INNER JOIN tbl_library_branch ON tbl_bookcopies.branchID = tbl_library_branch.branchID
WHERE tbl_book.title = 'The Lost Tribe' AND tbl_library_branch.branchname = 'Sharpstown'
GO

-- 2: How many copies of "The Lost Tribe" owned by each branch?
CREATE PROC LP_The_lost_tribe
AS
SELECT tbl_bookcopies.no_of_copies, tbl_library_branch.branchname, tbl_book.title FROM tbl_bookcopies
INNER JOIN tbl_book ON tbl_book.bookID = tbl_bookcopies.bookID
INNER JOIN tbl_library_branch ON tbl_bookcopies.branchID = tbl_library_branch.branchID
WHERE tbl_book.title = 'The Lost Tribe'
GO

-- 3: Names of all borrowers with no books.

CREATE PROC LP_Borrower_no_books
AS
SELECT tbl_borrower.name 
FROM tbl_borrower
Left Join tbl_bookloans 
ON tbl_borrower.cardno = tbl_bookloans.cardno
WHERE tbl_bookloans.cardno IS NULL;
GO


-- 4: For each book that is loaned out from the "Sharpstown" branch
-- and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.

CREATE PROC LP_Borrower_due_today
AS
SELECT tbl_borrower.name, tbl_borrower.address, tbl_book.title  --tbl_book.bookID, tbl_bookloans.bookID 
FROM tbl_book
INNER JOIN tbl_bookloans ON tbl_bookloans.bookID = tbl_book.bookID
INNER JOIN tbl_library_branch ON tbl_library_branch.branchID = tbl_bookloans.branchID
INNER JOIN tbl_borrower ON tbl_borrower.cardno = tbl_bookloans.cardno
WHERE tbl_library_branch.branchname = 'Sharpstown' AND tbl_bookloans.duedate = '2018/07/04' --or GETDATE()
GO


-- 5: For each branch, display branch name and total books loaned.

CREATE PROC LP_Books_loaned_per_branch
AS
SELECT COUNT(tbl_bookloans.duedate) AS [Number of books loaned:], branchname AS [Name of branch:] FROM tbl_library_branch
INNER JOIN tbl_bookloans ON tbl_bookloans.branchID = tbl_library_branch.branchID
GROUP BY tbl_library_branch.branchname
GO



-- 6: Name, address and # of books for each borrower with more than five loaned books

CREATE PROC LP_Egregious_borrowers
AS
SELECT COUNT(tbl_bookloans.duedate), tbl_borrower.name, tbl_borrower.address FROM tbl_bookloans
INNER JOIN tbl_borrower ON tbl_borrower.cardno = tbl_bookloans.cardno
GROUP BY tbl_borrower.name, tbl_borrower.address
HAVING COUNT(tbl_bookloans.duedate) > 4
GO


-- 7: For "Central" branch, display title and no. of copies for each Stephen King book.

CREATE PROC LP_King_at_central
AS
SELECT tbl_book.title, tbl_bookcopies.no_of_copies FROM tbl_library_branch
INNER JOIN tbl_bookcopies ON tbl_bookcopies.branchID = tbl_library_branch.branchID
INNER JOIN tbl_book ON tbl_book.bookID = tbl_bookcopies.bookID
INNER JOIN tbl_book_authors ON tbl_book_authors.bookID = tbl_book.bookID
WHERE tbl_library_branch.branchname = 'Central' AND tbl_book_authors.authorname = 'Stephen King'
GO





