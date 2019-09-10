import 'package:flutter/material.dart';
class EventModel {

  String eventTitle;
  String shortDecription;
  String descriptions;
  String RulesAndRegulations;
  String rules;
  List<String> Heads;
  List<String> HeadContacts;
  String venue;
  String PrizeMoney;
  String regFee;
  int eventId;
  String heroTag;
  AssetImage eventImage;
  bool favorited=false;
  String eventDate;
  String eventTime;
  EventModel(
      {
        this.heroTag,
        this.eventId,
      this.eventTitle,
      this.shortDecription,
      this.descriptions,
        this.RulesAndRegulations,
      this.PrizeMoney,
        this.regFee,
      this.Heads,
      this.HeadContacts,
      this.rules,
      this.venue,
      this.eventImage,
      this.favorited,
      this.eventDate,
      this.eventTime});
}


List<EventModel> Events =[starOfAscend,fifaAuction,ctf,codemate,blindtyping,networkgaming,csmash, gajetto,technovanza];
List<EventModel> Workshops =[aiWorkshop,droneWorkshop];



EventModel starOfAscend = EventModel(
  heroTag: "1101",
    eventTitle: "Lone Survivor",
    eventId: 1101,
    descriptions:
        '''This event comprises of 4 funfilled rounds namely prelims,jam or gd,stress interview....
    Prelims is that round which is used to test your gk and aptitude test.
Another exciting and equally vibrant round is jam or GD which is used to test your communication skills.
Last but not the least which is stress interview.
#BE THERE!AND GET TO BE THE LONE SURVIVOR''',
    RulesAndRegulations: '''• The event comprises of 4 funfilled rounds namely the prelims,JAM/GD and a stress interview.

• The preliminary round tests the participant's general knowledge and aptitude.

• The next stage will have  the GD/JAM, which aims to test your communication skills.

• The Creativity round will push your imagination to the limits, the perfect opportunity to reveal your true potential. 

• Finally, the Stress Interview round will test your ability to remain calm and perform, under pressure. ''',
    PrizeMoney: "6.5 K",
    shortDecription: "The mind of the unstoppable never quits",
    venue: "RB 201",
  rules: "",
  HeadContacts: ["9061955493","9562887453"],
  Heads: ["Ann Mary","Liza George"],
  favorited: false,
  eventDate:"Day 1",
  eventImage: AssetImage("assets/1101.jpg"),
      eventTime:"11:00 am",
  regFee: " Rs. 50/-"

);


EventModel fifaAuction = EventModel(
    heroTag: "1102",
    eventTitle: "Auction Manager",
    eventId: 1102,
    descriptions:
    '''Are you a true football fan?⚽

Got the confidence to bring out the master tactician in you? 
Do you know the players better than themselves and have the courage to go after what your team needs?
We bring you the best opportunity to show your skills of management and tactics 
🔥FIFA MANAGER🔥''',
    RulesAndRegulations: '''▪Each team includes two members.
▪The game consists of three rounds.
• FIRST ROUND:-
If more than 10 teams register, a preliminary test is conducted to filter out the best teams based on their knowledge on football and it's team management.
This test includes questions on International football and club football.A total of 25 questions each carrying a point.
Teams that score more than 20 points are qualified for the next round. 
• SECOND ROUND:- The second stage will be considered as finals if only less than 6 teams make it to this round from the preliminary round.
If more than 6 teams qualify from the preliminary round, a minor auction bidding is held, where players whose overall ratings are above 70 and less than or equal to 80 are considered, teams that get the most overall gets into the next round which is the top 6 of the minor auction.
Incase of a tie in overall, team chemistry of each team is considered to decide the finalists.
• THIRD AND FINAL ROUND :- The finalists are presented with the actual bidding, which includes players from the range of overall 80-95.
They will be given a budget and each player is given their starting bid price. The team has to bid carefully so that they will have enough budget to have all the 11 main players in the team in the formation 4-3-3.
This will be the same for the second stage also.
Teams are ranked according to their overall and prize is distributed accordingly.''',
    PrizeMoney: "5.0 K",
    shortDecription: "Life is full of auctions, Lead it, Bid it and Buy it!",
    venue: "RB 307",
    rules: "",
    HeadContacts: ["9048254621","9946166081"],
    Heads: ["Siddharth S ","Gautham G"],
    favorited: false,
    eventDate:"Day 1",
    eventImage: AssetImage("assets/1102.jpg"),
    eventTime:"11:00 am",
    regFee: " Rs. 90/- per team"

);


EventModel ctf = EventModel(
    heroTag: "1108",
    eventTitle: "HALIEUTICS",
    eventId: 1108,
    descriptions:
    '''One of the biggest and most famous hacking competitions held across the globe with brimming hackers and cryptographers. Bring out the hacker in you''',
    RulesAndRegulations: '''CTF is a 3 hours hacking competition.
• Bring your laptops and start decrypting. 
• Maximum number of flags should be captured in the stipulated time.
• Those who capture the most flags in record time bags the prize!
• Clues will be given. ''',
    PrizeMoney: "4.5 K",
    shortDecription: "Bring Out The Hacker In You.",
    venue: "RB 303",
    rules: "",
    HeadContacts: ["8301037127","8281818614"],
    Heads: ["Esther Mary ","Nikitha Elsa"],
    favorited: false,
    eventDate:"Day 1",
    eventImage: AssetImage("assets/1108.jpg"),
    eventTime:"10:30 am",
    regFee: " Rs. 20/-"

);

EventModel codemate = EventModel(
    heroTag: "1109",
    eventTitle: "Synchro Coder",
    eventId: 1109,
    descriptions:
    '''Codes have always remained a mystery to the average. The one who solves mysteries is regarded as one in a million gem. Do you have what it takes to become an epitome of a coding genius.
Then do it.... *"Perfection in coding is achieved not when there is nothing more to add, but rather when there is nothing more to add away''',
    RulesAndRegulations: '''• A team should comprise of exactly 2 members.
• Each team will be asked to give a solution to a problem using languages C, Java,Python.
• The total time limit will be 30 minutes.
• A small SURPRISE can be expected in the coding procedure.
• Prelims will be conducted as per the number of participants. 
• The use of internet and other activities will be considered as malpractices which can lead to disqualification. ''',
    PrizeMoney: "4.5 K",
    shortDecription: "Perfection in coding is achieved when there is nothing more to add away",
    venue: "RB 304",
    rules: "",
    HeadContacts: ["9745226243 ","9495872568 "],
    Heads: ["Christo Daniel ","Siya Elizabeth"],
    favorited: false,
    eventDate:"Day 1",
    eventImage: AssetImage("assets/1109.jpg"),
    eventTime:"10:30 am",
    regFee: " Rs. 40/- per team"

);


EventModel blindtyping = EventModel(
    heroTag: "1106",
    eventTitle: "Blind Typing",
    eventId: 1106,
    descriptions:
    '''Codes have always remained a mystery till date. The one who solves mystery is regarded as a genius. Do you have what it takes to become a genius.
Then do it.... "Rise from the darkness and light up ur excellence..Be blind and be smart..r u ready?. BLIND TYPING (off-screen typing) This is well a platform to showcase your typing spirit
*Screen will be off ‼And candidate would be asked to type a paragraph been provided. Show everyone how good you are with your fingers. Stream doesn't matter👈. Only talent matters''',
    RulesAndRegulations: '''• This is an individual event where your skills lies in your typing speed and timing.
• Participants would be provided with a paragraph and they have to type the exact content been given in the shortest time as possible.
• Any stream students can participate .
• Evaluation would be based on accuracy and perfection.''',
    PrizeMoney: "2.5 K",
    shortDecription: "GO DARK☜.. GO BLIND",
    venue: "RB 404",
    rules: "",
    HeadContacts: ["7034621326 ","9495889858"],
    Heads: ["Shimil S Babu","Anupriya S"],
    favorited: false,
    eventDate:"Day 1",
    eventImage: AssetImage("assets/1106.jpg"),
    eventTime:" 09:30 am",
    regFee: " Rs. 20/- per head"

);


EventModel networkgaming = EventModel(
    heroTag: "1107",
    eventTitle: "Counter Attack",
    eventId: 1107,
    descriptions:
    '''This game requires skill and concentration . It is time to use your skills. Play either as a terrorist and plant bombs and defend it or as counter terrorist and defuse them.
    1st Stage: Qualifiers will be conducted for the respective teams
2nd Stage: Semi Finals-Losing teams will have a chance to prosper and teams with most wins in semi finals will move to final(depending on number of teams) ''',
    RulesAndRegulations: '''1. The participating teams must have a maximum of 5 members.
2. Students can also bring their own gaming gear.
3. Participants must have to arrive by 9:30 am.
4. A one minute knife round will decide the side for the respective teams.
5. Sides will be switched after 5 rounds into the game.
6. The maps for the tournament can be anyone of the following: (1) Inferno (2) Train (3) Mirage (4) Nuke (5) Overpass (6) Dust II (7) Vertigo
7. If any team is found using a hack or cheat, the team will be disqualified without further notice.
8. Decisions taken by the organisers will be final. 
Rounds: 10 Rounds (5 C & 5 CT)''',
    PrizeMoney: "4.0 K",
    shortDecription: "Talent wins games, but teamwork wins championships",
    venue: "RB 403",
    rules: "",
    HeadContacts: ["9846584300  ","8943565183"],
    Heads: ["Jojo Josy","Kevin Thomas"],
    favorited: false,
    eventDate:"Day 1",
    eventImage: AssetImage("assets/1107.jpg"),
    eventTime:"09:30 am",
    regFee: "Rs. 100/- per team"

);


EventModel csmash = EventModel(
    heroTag: "1103",
    eventTitle: "C SMASH",
    eventId: 1103,
    descriptions:
    '''The main aim of the event is to provide a platform for talented minds to bring out their best to crack the given code.''',
    RulesAndRegulations: '''🔺A team must contain only 2 members.
🔺 Any case of malpractices will result in immediate disqualification.
🔺 decisions made by the event incharge will be the final.
🔺Use of mobile phones during the event is strictly prohibited.
*There will be mainly 2 rounds*

ROUND 1☝🏻
The prelims round, where few basic MCQ questions will be given to check the contestant's knowledge about the subject. No negative marking for wrong answers
 
ROUND 2✌🏻 The selected contestants   from round 1 will be informed and they can take part in round 2.Selection will be based on the marks secured in the 1st round. In round 2 few erroneous codes will be given. and the contests have to fix the code and run it. The contestents who completes correcting the maximum number codes will be awarded by 1st place or 2nd place based on time taken to complete it🔥''',
    PrizeMoney: "4.0 K",
    shortDecription: "LET'S CRACK THAT CODE!!",
    venue: "RB Lang. Lab",
    rules: "",
    HeadContacts: ["9400932750","8547999613"],
    Heads: ["Abey K Rajan","Punnoose K Thomas"],
    favorited: false,
    eventDate:"Day 1",
    eventImage: AssetImage("assets/1103.jpg"),
    eventTime:"09:30 am",
    regFee: "Rs. 40/- per team"

);


EventModel gajetto = EventModel(
    heroTag: "1104",
    eventTitle: "Gajetto",
    eventId: 1104,
    descriptions:
    '''This is an individual event where participants can showcase their technical knowledge and presentation skill. The event consists of 2 rounds, both of which involve reviewing gadgets. Participants will have to elaborate on the features of the gadget and provide review on the same.The participant who scores the maximum points will be declared as the winner.''',
    RulesAndRegulations: '''• This is an individual event.
• Participants will be allowed to handle the gadgets for 3 minutes
• Participants will have to speak for 2-5 minutes.
• Participants who qualify 1st round will only be eligible for 2nd round 
• Participants are not allowed to use mobile phone or any other devices for reference.
• Judges decision will be final ‼ 
''',
    PrizeMoney: "3.5 K",
    shortDecription: "An opportunity to parade your mastery in gadgets and flaunt your tech savvy skills",
    venue: "RB 302",
    rules: "",
    HeadContacts: ["9605287125","7034684107"],
    Heads: ["Jemia Jacob","Sharon Markose"],
    favorited: false,
    eventDate:"Day 1",
    eventImage: AssetImage("assets/1104.jpg"),
    eventTime:"10:00 am",
    regFee: "Rs. 30/-"

);


EventModel technovanza = EventModel(
    heroTag: "1105",
    eventTitle: "TECHNOVANZA",
    eventId: 1105,
    descriptions:
    '''Saintgits College of Engineering is planning to conduct a one day project expo TECHNOVANZA , as part of Ascend 2K19(department of computer science and engineering) in order to bring out the hidden talents and come up with innovative ideas along with a platform to present technical skills''',
    RulesAndRegulations: '''Send your entries to cseascend@gmail.com in the format:
• Name of Contestant
• Name of College and Branch
• Contact Number
• Abstract of the project
• Photo of the prototype
Students will be selected on the basis of abstract and prototype.
Selected students will have to report at the college with their project .
Evaluation will be on the basis of
• Projects must be socially relevant
• Project title,relevance and explanation of project
• Project plot – ( Eg feasibility, technology used.. etc.)
• Conclusion
• Any further questions based on project
''',
    PrizeMoney: "5.0 K",
    shortDecription: "INNOVATION IS OUR TRADITION",
    venue: "RB 202",
    rules: "",
    HeadContacts: ["8281401903","8156915459"],
    Heads: ["Jithu George","Varsha  S"],
    favorited: false,
    eventDate:"Day 1",
    eventImage: AssetImage("assets/1105.jpg"),
    eventTime:"09:30 am",
    regFee: "Rs. 50/-"

);

//WORKSHOPS

EventModel droneWorkshop = EventModel(
    heroTag: "1111",
    eventTitle: "Drone Workshop",
    eventId: 1111,
    descriptions:
    '''Drones are definitely the speedy, noisy feature, but ones you have gotten your flighty new friend in the air and mastered the art of hovering.👇 *Ascend2k19 brings you the opportunity to build your own flying monster!* 🛰🛰🛰 As a part of Ascend 2k19,one day workshop based on *Drone development conducted by drone racers Kerala(DRK)* is organised What's next? 👇
To get ideas and operate your own drone make sure you register yourself for the drone workshop at Ascend2k19.
''',
    RulesAndRegulations: '''1. One Laptop per head.
2. Participants with a valid ID card of their respective educational institutions are eligible for the registration.
3. Certificates for attending the workshop will be issued only if the registered student has attended the whole workshop
''',
    PrizeMoney: "NIL",
    shortDecription: "The higher we fly, the more we see!",
    venue: "RB 302A",
    rules: "",
    HeadContacts: ["9946990297","9447807465"],
    Heads: ["Joel Thomas","Mariya Mathew"],
    favorited: false,
    eventDate:"Day 1",
    eventImage: AssetImage("assets/1111.jpg"),
    eventTime:"09:30 am",
    regFee: "Rs. 700/-"

);

EventModel aiWorkshop = EventModel(
    heroTag: "1110",
    eventTitle: "AI WORKSHOP",
    eventId: 1110,
    descriptions:
    '''As new technology advances, organizations increasingly depend on technology and information assets have evolved into critical components of survival.👇 So as a part of Ascend 2k19,one day workshop based on AI is organised👇
In this training of Artificial Intelligence– Learn chatbot,AI powered robot(COZMO),mavic-pro (Drone),raspberry pi (alexa) integration, pixy cam and the candidates would learn how to optimize the AI to reach its maximum potential in the real world. *HIGHLIGHTS*❗❗ 1.Chatbot
2.AI powered robot(COZMO)
3.Mavic-Pro (Drone)
4.Alexa integration using raspberry pi ''',
    RulesAndRegulations: '''1. One Laptop per head.
2. Participants with a valid ID card of their respective educational institutions are eligible for the registration.
3. Certificates for attending the workshop will be issued only if the registered student has attended the whole workshop.
''',
    PrizeMoney: "NIL",
    shortDecription: "Experience the future before it takes over!",
    venue: "SeminarHall",
    rules: "",
    HeadContacts: ["9946990297","9447807465"],
    Heads: ["Joel Thomas","Mariya Mathew"],
    favorited: false,
    eventDate:"Day 1",
    eventImage: AssetImage("assets/1110.jpg"),
    eventTime:"09:30 am",
    regFee: "Rs. 600/-"

);