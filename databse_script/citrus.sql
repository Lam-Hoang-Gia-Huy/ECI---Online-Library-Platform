USE [master]
GO
/****** Object:  Database [Citrus]    Script Date: 12/5/2023 11:46:48 PM ******/
CREATE DATABASE [Citrus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Citrus', FILENAME = N'E:\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\Citrus.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Citrus_log', FILENAME = N'E:\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\Citrus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Citrus] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Citrus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Citrus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Citrus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Citrus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Citrus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Citrus] SET ARITHABORT OFF 
GO
ALTER DATABASE [Citrus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Citrus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Citrus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Citrus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Citrus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Citrus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Citrus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Citrus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Citrus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Citrus] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Citrus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Citrus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Citrus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Citrus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Citrus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Citrus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Citrus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Citrus] SET RECOVERY FULL 
GO
ALTER DATABASE [Citrus] SET  MULTI_USER 
GO
ALTER DATABASE [Citrus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Citrus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Citrus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Citrus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Citrus] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Citrus] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Citrus', N'ON'
GO
ALTER DATABASE [Citrus] SET QUERY_STORE = OFF
GO
USE [Citrus]
GO
/****** Object:  User [LAPTOP-8PIJN07A\legion]    Script Date: 12/5/2023 11:46:49 PM ******/
CREATE USER [LAPTOP-8PIJN07A\legion] FOR LOGIN [LAPTOP-8PIJN07A\legion] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 12/5/2023 11:46:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[book_id] [int] NOT NULL,
	[book_name] [varchar](255) NULL,
	[genre] [varchar](255) NULL,
	[author] [varchar](255) NULL,
	[cover] [nvarchar](255) NULL,
	[book_content] [nvarchar](255) NULL,
	[score] [float] NULL,
	[summary] [nvarchar](max) NULL,
	[uploader_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookmark]    Script Date: 12/5/2023 11:46:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookmark](
	[book_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[book_id] ASC,
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/5/2023 11:46:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] NOT NULL,
	[customer_name] [varchar](255) NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 12/5/2023 11:46:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 12/5/2023 11:46:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[review_id] [int] NOT NULL,
	[review_content] [varchar](255) NULL,
	[review_score] [int] NULL,
	[owner_id] [int] NULL,
	[book_id] [int] NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (1, N'Harry Potter and the Philosopher''s Stone	', N'Fantasy', N'J. K. Rowling	', N'https://upload.wikimedia.org/wikipedia/en/6/6b/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg', N'https://docenti.unimc.it/antonella.pascali/teaching/2018/19055/files/ultima-lezione/harry-potter-and-the-philosophers-stone', 7.5999999046325684, N'Harry Potter has never been the star of a Quidditch team, scoring points while riding a broom far above the ground. He knows no spells, has never helped to hatch a dragon, and has never worn a cloak of invisibility.All he knows is a miserable life with the Dursleys, his horrible aunt and uncle, and their abominable son, Dudley - a great big swollen spoiled bully. Harry''s room is a tiny closet at the foot of the stairs, and he hasn''t had a birthday party in eleven years.But all that is about to change when a mysterious letter arrives by owl messenger: a letter with an invitation to an incredible place that Harry - and anyone who reads about him - will find unforgettable.', 2)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (2, N'The Hobbit	', N'Fantasy', N'J. R. R. Tolkien	', N'https://m.media-amazon.com/images/I/710+HcoP38L._AC_UF1000,1000_QL80_.jpg', N'https://ia903100.us.archive.org/7/items/TheHobbitEnhancedEditionJ.R.R.Tolkien/The%20Hobbit%20%28Enhanced%20Edition%29%20-%20J.%20R.%20R.%20Tolkien.pdf', 8.6700000762939453, N'In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort.
Written for J.R.R. Tolkien’s own children, The Hobbit met with instant critical acclaim when it was first published in 1937. Now recognized as a timeless classic, this introduction to the hobbit Bilbo Baggins, the wizard Gandalf, Gollum, and the spectacular world of Middle-earth recounts of the adventures of a reluctant hero, a powerful and dangerous ring, and the cruel dragon Smaug the Magnificent. The text in this 372-page paperback edition is based on that first published in Great Britain by Collins Modern Classics (1998), and includes a note on the text by Douglas A. Anderson (2001).', 2)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (3, N'The Da Vinci Code	', N'Thriller', N'Dan Brown	', N'https://www.thoughtco.com/thmb/dbFTerm-8CCGlvFHiV9_yq58h_w=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/the-da-vinci-code-589f9cee3df78c4758a2d9e7.jpg', N'https://ia800404.us.archive.org/9/items/TheDaVinciCode_201308/The%20Da%20Vinci%20Code.pdf', 7.25, N'While in Paris, Harvard symbologist Robert Langdon is awakened by a phone call in the dead of the night. The elderly curator of the Louvre has been murdered inside the museum, his body covered in baffling symbols. As Langdon and gifted French cryptologist Sophie Neveu sort through the bizarre riddles, they are stunned to discover a trail of clues hidden in the works of Leonardo da Vinci—clues visible for all to see and yet ingeniously disguised by the painter.

Even more startling, the late curator was involved in the Priory of Sion—a secret society whose members included Sir Isaac Newton, Victor Hugo, and Da Vinci—and he guarded a breathtaking historical secret. Unless Langdon and Neveu can decipher the labyrinthine puzzle—while avoiding the faceless adversary who shadows their every move—the explosive, ancient truth will be lost forever.', 3)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (4, N'The Bridges of Madison County	', N'Romance
', N'Robert James Waller	', N'https://upload.wikimedia.org/wikipedia/en/c/c8/BridgesOfMadisonCounty.jpg', N'https://books-library.net/files/books-library.online-01080840Ul4O9.pdf', 8, N'The story of Robert Kincaid, the photographer and free spirit searching for the covered bridges of Madison County, and Francesca Johnson, the farm wife waiting for the fulfillment of a girlhood dream, THE BRIDGES OF MADISON COUNTY gives voice to the longings of men and women everywhere-and shows us what it is to love and be loved so intensely that life is never the same again.', 4)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (5, N'You Can Heal Your Life	', N'Self-help', N'Louise Hay', N'https://m.media-amazon.com/images/I/81-fxaNGDML._AC_UF1000,1000_QL80_.jpg', N'https://ia801309.us.archive.org/25/items/YouCanHealYourLifeLouiseL.Hay/You%20Can%20Heal%20your%20Life%20-%20Louise%20L.%20Hay.pdf', 7, N'You Can Heal Your Life has transformed the lives of millions of people. This is a book that people credit with profoundly altering their awareness of the impact that the mind has on  health and wellbeing. In this inspirational book by the late world-renowned bestselling author and self-help pioneer Louise Hay, youÃ¢ÂÂll find profound insight into the relationship between the mind and the body. Exploring the way that limiting thoughts and ideas control and constrict us, she offers us a powerful key to understanding the roots of our physical dis-eases and discomforts. Full of positive affirmations, this practical guidebook will change the way you think forever!', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (6, N'The Eagle Has Landed	', N'Thriller', N'Jack Higgins	', N'https://cdn2.penguin.com.au/covers/original/9780141959122.jpg', N'https://pdfexist.com/download/3049782-The%20Eagle%20Has%20Landed%20English%20Edition.pdf', 8.3299999237060547, N'In November of 1943, an elite team of Nazi paratroopers descends on British soil with a diabolical goal: to abduct Winston Churchill and cripple the Allied war effort. The mission, ordered by Hitler himself and planned by Heinrich Himmler, is led by ace agent Kurt Steiner and aided on the ground by IRA gunman Liam Devlin.

As the deadly duo executes Hitler’s harrowing plot, only the quiet town of Studley Constable stands in their way. Its residents are the lone souls aware of the impending Nazi plan, and they must become the most unlikely of heroes as the fate of the war hangs in the balance.', 5)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (7, N'Love Story	', N'Romance', N'Erich Segal	', N'https://upload.wikimedia.org/wikipedia/en/d/d1/Love_Story_%28Erich_Segal_novel%29_cover.jpg', N'https://www.kkoworld.com/kitablar/erik_siqal_mehebbet_hekayesi-eng.pdf', 8.3299999237060547, N'Oliver Barrett IV, a wealthy jock from a stuffy WASP family on his way to a Harvard degree and a career in law . . . Jenny Cavilleri, a sharp-tongued, working-class beauty studying music at Radcliffe . . .

Opposites in nearly every way, Oliver and Jenny are kindred spirits from vastly different worlds. Falling deeply and powerfully, their attraction to one another defies everything they have ever believed—as they share a passion far greater than anything they dreamed possible . . . and explore the wonder of a love that must end too soon.

One of the most adored novels of our time, this is the book that defined a generation—a story of uncompromising devotion, of life as it really is . . . and love that changes everything.', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (8, N'Jonathan Livingston Seagull	', N'Self-help', N'Richard Bach	', N'https://upload.wikimedia.org/wikipedia/en/7/7b/Johnathan_Livingston_Seagull.jpg', N'https://www.crisrieder.org/thejourney/wp-content/uploads/2021/02/Jonathan-Livingston-Seagull.pdf', 8.3999996185302734, N'Experience Jonathan Livingston Seagull''s timeless and inspirational message like never before in the new complete edition of this philosophical classic, perfect for readers of all ages--now with a fourth part of Jonathan''s journey, as well as last words from author Richard Bach.

This is the story for people who follow their hearts and make their own who get special pleasure out of doing something well, even if only for who know there''s more to this living than meets the eye: they''ll be right there with Jonathan, flying higher and faster than they ever dreamed.

A pioneering work that wed graphics with words, Jonathan Livingston Seagull now enjoys a whole new life.', 5)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (9, N'Cosmos	', N'Science Fiction', N'Carl Sagan	', N'https://images.penguinrandomhouse.com/cover/9780345539434', N'https://ia903102.us.archive.org/0/items/cosmos_201910/Carl%20Sagan%20-%20Cosmos%20%281980%29%20%5BFull%20Color%20Illustrated%5D.pdf', 8.5, N'In clear-eyed prose, Sagan reveals a jewel-like blue world inhabited by a life form that is just beginning to discover its own identity and to venture into the vast ocean of space. Featuring a new Introduction by Sagan’s collaborator, Ann Druyan, full color illustrations, and a new Foreword by astrophysicist Neil deGrasse Tyson, Cosmos retraces the fourteen billion years of cosmic evolution that have transformed matter into consciousness, exploring such topics as the origin of life, the human brain, Egyptian hieroglyphics, spacecraft missions, the death of the Sun, the evolution of galaxies, and the forces and individuals who helped to shape modern science.', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (10, N'Nineteen Eighty-Four	', N'Science Fiction', N'George Orwell	', N'https://m.media-amazon.com/images/I/519zR2oIlmL._AC_UF894,1000_QL80_.jpg', N'https://rauterberg.employee.id.tue.nl/lecturenotes/DDM110%20CAS/Orwell-1949%201984.pdf', 8.5, N'Winston Smith toes the Party line, rewriting history to satisfy the demands of the Ministry of Truth. With each lie he writes, Winston grows to hate the Party that seeks power for its own sake and persecutes those who dare to commit thoughtcrimes. But as he starts to think for himself, Winston can’t escape the fact that Big Brother is always watching...

A startling and haunting novel, 1984 creates an imaginary world that is completely convincing from start to finish. No one can deny the novel’s hold on the imaginations of whole generations, or the power of its admonitions—a power that seems to grow, not lessen, with the passage of time.', 2)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (11, N'A Game of Thrones	', N'Fantasy', N'George R. R. Martin', N'https://i.imgur.com/IibDqjf.jpg', N'https://books-library.net/files/books-library.online-01052042Lx2L3.pdf', 9.5, N'Sweeping from a harsh land of cold to a summertime kingdom of epicurean plenty, A Game of Thrones tells a tale of lords and ladies, soldiers and sorcerers, assassins and bastards, who come together in a time of grim omens. Here an enigmatic band of warriors bear swords of no human metal; a tribe of fierce wildlings carry men off into madness; a cruel young dragon prince barters his sister to win back his throne; a child is lost in the twilight between life and death; and a determined woman undertakes a treacherous journey to protect all she holds dear. Amid plots and counter-plots, tragedy and betrayal, victory and terror, allies and enemies, the fate of the Starks hangs perilously in the balance, as each side endeavors to win that deadliest of conflicts: the game of thrones.', 6)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (12, N'A Feast for Crows	', N'Fantasy', N'George R. R. Martin', N'https://m.media-amazon.com/images/I/81MylCMYnVL._AC_UF1000,1000_QL80_.jpg', N'https://ztcprep.com/library/story/A_Feast_for_Crows/A_Feast_for_Crows_(www.ztcprep.com).pdf', 8.5, N'Bloodthirsty, treacherous and cunning, the Lannisters are in power on the Iron Throne in the name of the boy-king Tommen. The war in the Seven Kingdoms has burned itself out, but in its bitter aftermath new conflicts spark to life.

The Martells of Dorne and the Starks of Winterfell seek vengeance for their dead. Euron Crow''s Eye, as black a pirate as ever raised a sail, returns from the smoking ruins of Valyria to claim the Iron Isles. From the icy north, where Others threaten the Wall, apprentice Maester Samwell Tarly brings a mysterious babe in arms to the Citadel.

Against a backdrop of incest and fratricide, alchemy and murder, victory will go to the men and women possessed of the coldest steel and the coldest hearts.', 3)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (13, N'The Girl on the Train	', N'Thriller
', N'Paula Hawkins	', N'https://upload.wikimedia.org/wikipedia/en/5/50/The_Girl_On_The_Train_%28US_cover_2015%29.png', N'https://bayanebartar.org/file-dl/library/story/The_Girl_on_the_Train_-_Paula_Hawkins.pdf', 7, N'Rachel catches the same commuter train every morning. She knows it will wait at the same signal each time, overlooking a row of back gardens. She’s even started to feel like she knows the people who live in one of the houses. “Jess and Jason,” she calls them. Their life—as she sees it—is perfect. If only Rachel could be that happy. And then she sees something shocking. It’s only a minute until the train moves on, but it’s enough. Now everything’s changed. Now Rachel has a chance to become a part of the lives she’s only watched from afar. Now they’ll see; she’s much more than just the girl on the train...', 7)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (14, N'Harry Potter and the Chamber of Secrets', N'Fantasy', N'J. K. Rowling', N'https://m.media-amazon.com/images/I/81THMAxo+pL._AC_UF1000,1000_QL80_.jpg', N'https://www.ircambridge.com/books/Book2-Harry-Potter-and-the-Chamber-of-Secrets.pdf', 8.5, N'The plot follows Harry''s second year at Hogwarts School of Witchcraft and Wizardry, during which a series of messages on the walls of the school''s corridors warn that the "Chamber of Secrets" has been opened and that the "heir of Slytherin" would kill all pupils who do not come from all-magical families. These threats are found after attacks that leave residents of the school petrified. Throughout the year, Harry and his friends Ron and Hermione investigate the attacks.', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (15, N'Harry Potter and the Half-Blood Prince', N'Fantasy', N'J. K. Rowling', N'https://upload.wikimedia.org/wikipedia/en/b/b5/Harry_Potter_and_the_Half-Blood_Prince_cover.png', N'https://img1.wsimg.com/blobby/go/d65a7400-ce70-476c-a7a1-cd6f7a422e94/downloads/06%20Harry%20Potter%20and%20the%20Half-Blood%20Prince%20-%20J..pdf?ver=1601098690432', 8.5, N'It is the middle of the summer, but there is an unseasonal mist pressing against the windowpanes. Harry Potter is waiting nervously in his bedroom at the Dursleys'' house in Privet Drive for a visit from Professor Dumbledore himself. One of the last times he saw the Headmaster was in a fierce one-to-one duel with Lord Voldemort, and Harry can''t quite believe that Professor Dumbledore will actually appear at the Dursleys'' of all places. Why is the Professor coming to visit him now? What is it that cannot wait until Harry returns to Hogwarts in a few weeks'' time? Harry''s sixth year at Hogwarts has already got off to an unusual start, as the worlds of Muggle and magic start to intertwine...', 3)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (16, N'Andromeda: A Space-Age Tale', N'Science Fiction', N'Ivan Yefremov', N'https://m.media-amazon.com/images/I/41r3Xm1vIOL.jpg', N'http://zaytsev.com/Efremov%20Andromeda.pdf', 7.5, N'Ivan Yefremov (1907-1972) was a well-known Soviet scientist, a professor of paleontology and a talented writer of science fiction. "No writer did as much as Yefremov for science," wrote one reader, "and no scientist did as much as Yefremov for literature." Andromeda is a novel about the future of mankind. It depicts with truly fantastic scope the unparalleled bloom of science and technology and the rise of a new social order, and portrays the Universe in the so-called Era of the Great Circle, when Earth will have constant communication with space. Written in 1956, on the eve of the first attempts at space exploration - when the word "cosmonaut" still belonged exclusively to the domain of science fiction - the novel has long since become widely known throughout the world. It is symbolic that, on the day of the launching of the first Earth satellite, readers congratulated Yefremov on the dawning of the Era of the Great Circle.', 2)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (17, N'Pride and Prejudice', N'Romance', N'Jane Austen', N'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/PrideAndPrejudiceTitlePage.jpg/800px-PrideAndPrejudiceTitlePage.jpg', N'https://www.gutenberg.org/files/1342/old/pandp12p.pdf', 8, N'Pride and Prejudice is an 1813 novel of manners by Jane Austen. The novel follows the character development of Elizabeth Bennet, the protagonist of the book, who learns about the repercussions of hasty judgments and comes to appreciate the difference between superficial goodness and actual goodness. Mr Bennet, owner of the Longbourn estate in Hertfordshire, has five daughters, but his property is entailed and can only be passed to a male heir. His wife also lacks an inheritance, so his family faces becoming poor upon his death. Thus, it is imperative that at least one of the daughters marry well to support the others, which is a motivation that drives the plot.', 2)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (18, N'Gone Girl', N'Thriller', N'Gillian Flynn', N'https://upload.wikimedia.org/wikipedia/en/7/7e/Gone_Girl_%28Flynn_novel%29.jpg', N'https://icrrd.com/media/15-05-2021-082725Gone-Girl-Gillian-Flynn.pdf', 7.5, N'Gone Girl is a 2012 crime thriller novel by American writer Gillian Flynn. It was published by Crown Publishing Group in June 2012. The novel was popular and made the New York Times Best Seller list. The sense of suspense in the novel comes from whether Nick Dunne is responsible for the disappearance of his wife Amy.

Critics in the United States positively received and reviewed the novel, noting the author''s use of unreliable narration, plot twists, and suspense.', 2)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (19, N'The Power of Positive Thinking', N'Self-help', N'Norman Vincent Peale', N'https://upload.wikimedia.org/wikipedia/en/8/86/The_Power_of_Positive_Thinking_%28Norman_Vincent_Peale%29.png', N'https://www.law-of-attraction-haven.com/support-files/the-power-of-positive-thinking.pdf', 7.5, N'The Power of Positive Thinking: A Practical Guide to Mastering the Problems of Everyday Living is a 1952 self-help book by American minister Norman Vincent Peale. It provides anecdotal "case histories" of positive thinking using a biblical approach, and practical instructions which were designed to help the reader achieve a permanent and optimistic attitude. These techniques usually involved affirmations and visualizations. Peale claimed that such techniques would give the reader a higher satisfaction and quality of life. The book was negatively reviewed by scholars and health experts, but was popular among the general public and has sold well.', 2)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (20, N'The Secret', N'Self-help', N'Rhonda Byrne', N'https://upload.wikimedia.org/wikipedia/en/0/02/TheSecretLogo.jpg', N'https://mujihanani.files.wordpress.com/2018/01/the-power-rhonda-byrne.pdf', 8, N'Byrne re-introduces a notion originally popularized by persons such as Madame Blavatsky and Norman Vincent Peale that thinking about certain things will make them appear in one''s life. Byrne provides examples of historical persons who have allegedly achieved this. Byrne cites a three-step process: ask, believe, and receive. This is based on a quotation from the Bible''s Matthew 21:22: "And all things, whatsoever ye shall ask in prayer, believing, ye shall receive." Byrne highlights the importance of gratitude and visualization in achieving one''s desires, along with alleged examples. Later chapters describe how to improve one''s prosperity, relationships, and health, with more general thoughts about the universe.', 9)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (21, N'Harry Potter and the Deathly Hallows', N'Fantasy', N'J. K. Rowling', N'https://upload.wikimedia.org/wikipedia/en/a/a9/Harry_Potter_and_the_Deathly_Hallows.jpg', N'https://vidyaprabodhinicollege.edu.in/VPCCECM/ebooks/ENGLISH%20LITERATURE/Harry%20potter/(Book%207)%20Harry%20Potter%20And%20The%20Deathly%20Hallows.pdf', 9, N'Harry Potter and the Deathly Hallows is a fantasy novel written by British author J. K. Rowling and the seventh and final novel in the Harry Potter series. It was released on 21 July 2007 in the United Kingdom by Bloomsbury Publishing, in the United States by Scholastic, and in Canada by Raincoast Books. The novel chronicles the events directly following Harry Potter and the Half-Blood Prince (2005) and the final confrontation between the wizards Harry Potter and Lord Voldemort.', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (22, N'The call of the wild', N'Fantasy', N'J. K. Rowling', N'https://upload.wikimedia.org/wikipedia/en/a/a0/Harry_Potter_and_the_Prisoner_of_Azkaban.jpg', N'http://vidyaprabodhinicollege.edu.in/VPCCECM/ebooks/ENGLISH%20LITERATURE/Harry%20potter/(Book%203)%20Harry%20Potter%20And%20The%20Prisoner%20Of%20Azkaban_001.pdf', 7.5, N'fbkasjdalsjdhakd', 16)
INSERT [dbo].[Book] ([book_id], [book_name], [genre], [author], [cover], [book_content], [score], [summary], [uploader_id]) VALUES (23, N'Harry Potter and the Order1 of the Phoenix', N'Fantasy', N'J. K. Rowling123', N'https://upload.wikimedia.org/wikipedia/en/7/70/Harry_Potter_and_the_Order_of_the_Phoenix.jpg', N'https://www.oasisacademysouthbank.org/uploaded/South_Bank/Curriculum/Student_Learning/Online_Library/KS3/Harry_potter/05_Harry_Potter_and_the_Order_of_the_Phoenix_by_J.K._Rowling.pdf', 8.3299999237060547, N'Harry Potter and the Order of the Phoenix is a fantasy novel written by British author J. K. Rowling and the fifth novel in the Harry Potter series. It follows Harry Potter''s struggles through his fifth year at Hogwarts School of Witchcraft and Wizardry, including the surreptitious return of the antagonist Lord Voldemort, O.W.L. exams, and an obstructive Ministry of Magic. The novel was published on 21 June 2003 by Bloomsbury in the United Kingdom, Scholastic in the United States, and Raincoast in Canada. It sold five million copies in the first 24 hours of publication.[1]', 17)
GO
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (1, 3)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (2, 2)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (2, 5)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (2, 7)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (2, 9)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (2, 11)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (2, 15)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (2, 17)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (3, 2)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (6, 4)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (7, 1)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (7, 2)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (7, 3)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (7, 6)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (7, 7)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (7, 11)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (8, 1)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (8, 4)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (8, 7)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (9, 1)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (9, 5)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (9, 15)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (10, 5)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (10, 16)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (11, 2)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (11, 3)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (11, 6)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (11, 7)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (11, 9)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (12, 1)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (12, 2)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (12, 6)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (14, 15)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (15, 1)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (15, 3)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (15, 16)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (19, 16)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (20, 15)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (20, 16)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (20, 17)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (21, 1)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (21, 17)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (21, 18)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (22, 17)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (22, 18)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (23, 17)
INSERT [dbo].[Bookmark] ([book_id], [customer_id]) VALUES (23, 18)
GO
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (1, N'Nguyen Gia Huy', N'user1')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (2, N'Nguyen Huy Hoang', N'user2')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (3, N'Tran Binh Minh', N'user3')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (4, N'Nguyen Ngoc Hoa', N'user4')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (5, N'Tran Thanh Tung', N'user5')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (6, N'Vo Thi Yen Nhi', N'user6')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (7, N'Vo Ngoc Huy', N'user7')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (8, N'Ngoc Anh', N'user8')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (9, N'Ngoc Anh Ha', N'user9')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (10, N'Nguyen Hanh Nhan', N'user10')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (11, N'Lam Hoang Gia Huy', N'giahuy123')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (12, N'Lam Hoang Gia Huy', N'giahuy1234')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (13, N'sqsq', N'sqs')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (14, N'LÃ¢m HoÃ ng Gia Huy', N'wafdw')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (15, N'Nguyen Van A', N'nguyenvana')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (16, N'Dung123', N'Dung')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (17, N'Lam Hoang Gia Huy', N'huy123')
INSERT [dbo].[Customer] ([customer_id], [customer_name], [username]) VALUES (18, N'Lam Hoang Gia Huy', N'user13')
GO
INSERT [dbo].[Login] ([username], [password]) VALUES (N'Dung', N'Dung')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'giahuy123', N'123456')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'giahuy1234', N'123456')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'huy123', N'1234')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'nguyenvana', N'123456')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'sqs', N'sq')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'user1', N'password1')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'user10', N'password10')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'user13', N'user13')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'user2', N'password2')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'user3', N'password3')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'user4', N'password4')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'user5', N'password5')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'user6', N'password6')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'user7', N'password7')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'user8', N'1234')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'user9', N'1234')
INSERT [dbo].[Login] ([username], [password]) VALUES (N'wafdw', N'fqw')
GO
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (1, N'Sieu hay', 9, 4, 1)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (2, N'Do', 3, 2, 1)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (3, N'Kha hay', 7, 1, 1)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (4, N'Cuc ki cay can', 9, 5, 2)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (5, N'Rat Hayyy', 10, 6, 4)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (6, N'Tuyet tac', 10, 4, 7)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (7, N'khá', 8, 7, 5)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (8, N'Rat Hayyy', 9, 1, 1)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (9, N'Rat gay can', 8, 6, 6)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (10, N'Amazing book', 10, 1, 6)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (11, N'it''s ok', 7, 5, 6)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (12, N'this is the best book that i have ever read', 10, 2, 3)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (13, N'it''s gooddd', 7, 1, 3)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (14, N'I do not like it', 7, 6, 8)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (15, N'this book is nice', 9, 3, 8)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (16, N'Love this book', 10, 4, 8)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (17, N'It''s niceeeee', 8, 2, 8)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (18, N'It''s niceeee', 8, 2, 4)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (19, N'i don''t like the book that much', 6, 3, 4)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (20, N'Amazing', 9, 1, 9)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (21, N'Interesting book', 9, 1, 10)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (22, N'Masterpiece', 10, 2, 11)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (23, N'Amazing book', 9, 3, 12)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (24, N'Nice one', 7, 1, 13)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (25, N'Good book', 8, 1, 14)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (26, N'mediocre', 6, 1, 5)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (27, N'Hay', 8, 3, 2)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (28, N'Very nice book', 9, 3, 3)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (29, N'Masterpiece', 10, 3, 1)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (30, N'Amazing book', 9, 3, 15)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (31, N'Good read', 8, 1, 15)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (32, N'Nice one', 8, 2, 17)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (33, N'Goood', 7, 2, 16)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (34, N'Very gooodd', 9, 2, 11)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (35, N'Good', 7, 2, 18)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (36, N'i don''t like it', 6, 2, 19)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (37, N'Amazing read', 9, 1, 19)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (38, N'Quite interesting', 8, 1, 18)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (39, N'Interesting book', 8, 1, 16)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (40, N'i don''t like the book that much...', 7, 1, 7)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (41, N'Goood', 9, 1, 2)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (42, N'Nice book', 8, 1, 8)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (43, N'Good book', 8, 1, 12)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (44, N'fsfsef', 3, 1, 3)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (45, N'Amazing book', 8, 1, 10)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (46, N'Gud one', 8, 2, 9)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (47, N'Nice read!!!', 8, 11, 7)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (48, N'Nice', 8, 2, 20)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (49, N'Nice book!', 9, 15, 14)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (50, N'Amazing book', 9, 1, 21)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (51, N'Fun', 7, 1, 22)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (52, N'Tuyet voi', 9, 17, 23)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (53, N'Sach rat hay', 8, 17, 23)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (54, N'Sieu hay', 8, 1, 23)
INSERT [dbo].[Review] ([review_id], [review_content], [review_score], [owner_id], [book_id]) VALUES (55, N'Rat Hayyy', 8, 18, 22)
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([uploader_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Bookmark]  WITH CHECK ADD FOREIGN KEY([book_id])
REFERENCES [dbo].[Book] ([book_id])
GO
ALTER TABLE [dbo].[Bookmark]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Login] ([username])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([book_id])
REFERENCES [dbo].[Book] ([book_id])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([owner_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
USE [master]
GO
ALTER DATABASE [Citrus] SET  READ_WRITE 
GO
