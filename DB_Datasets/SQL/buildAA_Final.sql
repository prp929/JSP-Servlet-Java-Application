drop table if exists users;
drop table if exists entries;


CREATE TABLE users (
  id int NOT NULL AUTO_INCREMENT,
  first_name varchar(20) DEFAULT NULL,
  last_name varchar(20) DEFAULT NULL,
  username varchar(250) DEFAULT NULL,
  password varchar(20) DEFAULT NULL,
  PRIMARY KEY (id)
);

create table entries(
id int primary key NOT NULL AUTO_INCREMENT,
title varchar(255),
description varchar(255), 
contents longtext,
username varchar(250),
entry_date date,
isBookmarked boolean
);

insert into users values(2, "paul", "pezold", "prp01", "0000");
insert into users values(1, "paul", "pezold", "tiny_pp", "0000");
 
insert into entries values ( 1, "Happy", "First Entry", "
Dear Diary, today was a fantastic day! I finally finished that big project I've been working on for months. 
I'm proud of myself for pushing through and getting it done. I treated myself to a nice dinner to celebrate. 
Life is good.
", "tiny_pp", "2023-04-16", false);
insert into entries values ( 2, "Boss", "Second Entry", "
Dear Diary, I had a frustrating conversation with my boss today. 
He's been critical of my work lately, and it's starting to get to me. 
I need to find a way to improve my performance and prove him wrong.
", "tiny_pp", "2023-04-01", false);
insert into entries values ( 3, "Nature", "Third Entry", "
Dear Diary, I had a great time with my friends today. We went on a hike in the mountains and had a picnic at the top.
 It was nice to get away from the city and spend some time in nature. I feel refreshed and energized.
", "tiny_pp", "2023-04-26", false);
insert into entries values ( 4, "Rough", "Fourth Entry", "
Dear Diary, I had a rough day today. My car broke down on the way to work, and I was late for an important meeting. 
It feels like everything is going wrong lately. I hope tomorrow is better.
", "tiny_pp", "2023-04-12", false);
insert into entries values ( 5, "Money", "Fifth Entry", "
Dear Diary, I'm feeling anxious about the future. I'm not sure where my career is headed, and I'm worried about money.
 I need to start making a plan and taking action to get back on track. I hope I can figure it out.
", "tiny_pp", "2023-04-30", false);
INSERT INTO entries VALUES (6, "Love", "Sixth Entry", 
"Dear Diary, I think I'm falling in love. I feel so happy and excited but also a 
bit nervous. I hope things work out!", "tiny_pp", "2023-05-01", false);

INSERT INTO entries VALUES (7, "Health", "Seventh Entry", "Dear Diary, I need to 
start taking better care of my health. I've been feeling tired and sluggish lately, 
and I think it's because I haven't been eating well or exercising enough. I'm going to 
make some changes starting today.", "tiny_pp", "2023-05-02", false);

INSERT INTO entries VALUES (8, "Friendship", "Eighth Entry", "Dear Diary, I 
had a great time with my friends today. It's been a while since we hung out, 
and it was so good to catch up and have some laughs. I'm grateful for their support
 and friendship.", "tiny_pp", "2023-05-03", false);

INSERT INTO entries VALUES (9, "Career", "Ninth Entry", "Dear Diary, I'm starting 
to feel burnt out at work. I'm not sure if I'm in the right job or if I need to make 
a change. I'm going to start exploring my options and see what else is out there.", 
"tiny_pp", "2023-05-04", false);

INSERT INTO entries VALUES (10, "Goals", "Tenth Entry", "Dear Diary, I've been feeling 
a bit lost lately, like I don't have a clear direction in life. I need to start setting 
some goals and working towards them. I'm going to start by making a list of things I want 
to achieve.", "tiny_pp", "2023-05-05", false);

INSERT INTO entries VALUES (11, "Family", "Eleventh Entry", "Dear Diary, I had a nice chat
 with my mom today. We don't talk as often as we used to, and it was good to catch up and hear 
 about what's been going on in her life. I'm going to make an effort to stay in touch more.", 
 "tiny_pp", "2023-05-06", false);

INSERT INTO entries VALUES (12, "Creativity", "Twelfth Entry", "Dear Diary, I've been feeling 
stuck creatively lately. I need to start making time for my hobbies and passions again. I'm going
 to set aside some time each week to work on my art and writing.", "tiny_pp", "2023-05-07", false);

INSERT INTO entries VALUES (13, "Gratitude", "Thirteenth Entry", "Dear Diary, I'm feeling grateful
 for my health, my home, my job, and my relationships. Sometimes it's easy to focus on what's wrong,
 
 but I want to remember to appreciate what's right in my life.", "tiny_pp", "2023-05-08", false);

INSERT INTO entries VALUES (14, "Travel", "Fourteenth Entry", "Dear Diary, I've been itching
 to travel again. I miss exploring new places and meeting new people. I'm going to start saving up 
 for my next adventure and planning where I want to go.", "tiny_pp", "2023-05-09", false);

INSERT INTO entries VALUES (15, "Education", "Fifteenth Entry", "Dear Diary, I've been wanting to learn
 a new skill or take a course to improve my knowledge. I'm going to start researching some options and see
 what's available!", "tiny_pp", "2023-05-09", false);
 
 -- PRP01 entries
 
 -- DUmmy data entry

insert into entries values (100, "Happy", "First Entry", "Dear Diary, today was a fantastic day! I finally finished that big project I've been working on for months. I'm proud of myself for pushing through and getting it done. I treated myself to a nice dinner to celebrate. Life is good.", "prp01", "2023-04-16", false);

insert into entries values (200, "Nervous", "Second Entry", "Dear Diary, the stock market has been so volatile lately, and I'm feeling nervous about making the right trades. I've been doing my research, but it's hard to predict what's going to happen next. I need to stay focused and make smart decisions.", "prp01", "2023-04-17", false);

insert into entries values (300, "Frustrated", "Third Entry", "Dear Diary, I had a frustrating day today. I made a trade that didn't go the way I expected, and I lost some money. I know I need to learn from my mistakes, but it's hard not to feel discouraged. I need to regroup and come up with a new strategy.", "prp01", "2023-04-18", false);

insert into entries values (400, "Excited", "Fourth Entry", "Dear Diary, I just heard some great news about a company I've been investing in. They announced a new product that's getting a lot of buzz, and the stock is soaring. I'm excited to see where this goes and hopeful that I'll make a profit.", "prp01", "2023-04-19", false);

insert into entries values (500, "Stressed", "Fifth Entry", "Dear Diary, the market is so unpredictable right now, and I'm feeling really stressed about making the right moves. I'm trying to stay calm and think logically, but it's not easy. I need to remind myself that this is just part of the job and keep pushing forward.", "prp01", "2023-04-20", false);

insert into entries values (600, "Disappointed", "Sixth Entry", "Dear Diary, I made a bad trade today and lost a significant amount of money. I'm disappointed in myself for not doing better research and making a more informed decision. I know I need to learn from this and be more careful in the future.", "prp01", "2023-04-21", false);

insert into entries values (700, "Hopeful", "Seventh Entry", "Dear Diary, I've been doing a lot of research on a new company, and I'm feeling really hopeful about their potential. They have some exciting projects in the works, and I think they could be a great investment opportunity. I'm looking forward to seeing where this goes.", "prp01", "2023-04-22", false);

insert into entries values (800, "Energetic", "Eighth Entry", "Dear Diary, I woke up feeling really energized and ready to take on the day. I have a lot of work to do, but I'm excited about the potential profits I could make. I'm going to stay focused and make smart decisions.", "prp01", "2023-04-23", false);

insert into entries values (900, "Optimistic", "Ninth Entry", "Dear Diary, I just got some great news about a stock I've been watching. They just announced a big partnership that's going to be a game-changer. I'm optimistic that this will lead to some big profits.", "prp01", "2023-04-24", false);

insert into entries values (1000, "Anxious", "Tenth Entry", "Dear Diary, the market has been really volatile lately, and I'm feeling anxious about making the right trades. I've been trying to stay on top of my research and keep a level head, but it's not easy. I need to stay focused and make smart decisions.", "prp01", "2023-04-24", false);

insert into entries values (110, "Proud", "Eleventh Entry", "Dear Diary, I made a big trade today, and it paid off. I'm proud of myself for taking a calculated risk and making a profit. It's moments like these that make all the hard work and stress worth it.", "prp01", "2023-04-25", false);

insert into entries values (120, "Motivated", "Twelfth Entry", "Dear Diary, I've been feeling really motivated lately. I have some big investment goals, and I'm determined to achieve them. I'm going to keep doing my research and making smart trades, and I know I can make it happen.", "prp01", "2023-04-26", false);

insert into entries values (130, "Frustrated", "Thirteenth Entry", "Dear Diary, I had a frustrating day today. I made a trade that I thought was a sure thing, but it ended up going south. I'm frustrated with myself for not seeing the warning signs and making a better decision. I need to regroup and come up with a new plan.", "prp01", "2023-04-27", false);

insert into entries values (140, "Confident", "Fourteenth Entry", "Dear Diary, I just closed a big deal, and I'm feeling really confident about my investment strategy. I've been putting in a lot of work and research, and it's paying off. I know there will be bumps in the road, but I feel ready to face them head-on.", "prp01", "2023-04-28", false);

insert into entries values (150, "Grateful", "Fifteenth Entry", "Dear Diary, I'm feeling grateful today. I have a job that challenges me and allows me to learn and grow every day. I'm also grateful for the support of my family and friends, who are always there to cheer me on and pick me up when I fall.", "prp01", "2023-04-29", false);
