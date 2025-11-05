List<Map<String, dynamic>> _eventsChoiceList = [
  {
    "id": 1,
    "title": "Cold",
    "description":
        "Your nose is runny, your throat is scratchy, and you can't stop sneezing. You've definitely caught a cold.",
    "choices": [
      {
        "option": "Take some medicine.",
        "result": {"Health": 10, "Happiness": -3},
        "flavor":
            "The medicine tastes awful, but you already feel your sinuses clearing up.",
      },
      {
        "option": "Power through the day.",
        "result": {"Health": -5, "Happiness": -5},
        "flavor": "You probably should have just rested. You feel miserable.",
      },
    ],
  },
  {
    "id": 2,
    "title": "Injury",
    "description":
        "You tripped and twisted your ankle. It's swelling up and hurts to walk on.",
    "choices": [
      {
        "option": "Go to a doctor.",
        "result": {"Health": 15, "Happiness": -5},
        "flavor": "The doctor wraps your ankle. It feels much more stable now.",
      },
      {
        "option": "Rest and hope it heals.",
        "result": {"Health": -8, "Happiness": -8},
        "flavor":
            "The throbbing pain isn't going away. Maybe this was more serious than you thought.",
      },
    ],
  },
  {
    "id": 3,
    "title": "Vaccination",
    "description":
        "A clinic is offering the annual flu shot. It can prevent you from getting sick later.",
    "choices": [
      {
        "option": "Get the shot.",
        "result": {"Health": 5, "Happiness": -3},
        "flavor":
            "You barely felt the needle. Your arm is a little sore, but you feel protected.",
      },
      {
        "option": "Skip it this year.",
        "result": {"Health": -3},
        "flavor": "You wonder if you'll regret this during flu season.",
      },
    ],
  },
  {
    "id": 4,
    "title": "Waiting Game",
    "description":
        "You're stuck in an incredibly long and slow-moving line at the post office.",
    "choices": [
      {
        "option": "Wait patiently.",
        "result": {"Happiness": -8},
        "flavor": "After what felt like an eternity, it's finally your turn.",
      },
      {
        "option": "Give up and leave.",
        "result": {"Happiness": -5},
        "flavor":
            "You storm out, annoyed that you wasted so much time for nothing.",
      },
    ],
  },
  {
    "id": 5,
    "title": "Playing Game with Friend",
    "description":
        "You're in a close, competitive game with a friend. You have a clear chance to win.",
    "choices": [
      {
        "option": "Crush them and take the win.",
        "result": {"Happiness": 8},
        "flavor": "Victory is sweet! You can't help but gloat a little.",
      },
      {
        "option": "Let them win to be nice.",
        "result": {"Happiness": -5},
        "flavor":
            "Your friend is thrilled to win, but you feel a pang of disappointment.",
      },
    ],
  },
  {
    "id": 6,
    "title": "Shopping with Mom",
    "description":
        "Your mom wants you to go clothes shopping with her for hours.",
    "choices": [
      {
        "option": "Go and try to be helpful.",
        "result": {"Happiness": -8},
        "flavor":
            "Your mom appreciated the company, but you're completely drained.",
      },
      {
        "option": "Make an excuse not to go.",
        "result": {"Happiness": -5},
        "flavor":
            "You get to enjoy your free time, but you feel a little guilty.",
      },
    ],
  },
  {
    "id": 7,
    "title": "Giving Money to Friend",
    "description":
        "Your friend is complaining about their old clothes and wants to go shopping.",
    "choices": [
      {
        "option": "Offer to help them find a new style.",
        "result": {"Happiness": 5},
        "flavor": "Your friend is grateful for your fashion advice!",
      },
      {
        "option": "Say you're too busy to help.",
        "result": {"Happiness": -5},
        "flavor": "Your friend seems a bit disappointed in you.",
      },
    ],
  },
  {
    "id": 8,
    "title": "Eye Glass",
    "description":
        "You've been squinting to read things lately and getting headaches. You might need glasses.",
    "choices": [
      {
        "option": "Get an eye exam.",
        "result": {"Health": 8, "Looks": -5, "Smarts": 3},
        "flavor":
            "The world is suddenly in high definition! The new glasses look okay, I guess.",
      },
      {
        "option": "Just squint and deal with it.",
        "result": {"Health": -5, "Happiness": -5},
        "flavor":
            "Another day, another headache. You can barely read the street signs.",
      },
    ],
  },
  {
    "id": 9,
    "title": "Bully in School/College",
    "description": "A bully is consistently harassing you between classes.",
    "choices": [
      {
        "option": "Stand up to them.",
        "result": {"Health": -10, "Happiness": 10},
        "flavor":
            "It was a tough fight, but you feel proud for not backing down.",
      },
      {
        "option": "Ignore them and walk away.",
        "result": {"Happiness": -10},
        "flavor": "You avoided a fight, but you feel like a coward.",
      },
    ],
  },
  {
    "id": 10,
    "title": "Argument with Family",
    "description":
        "You're in a pointless argument with a family member over the TV remote.",
    "choices": [
      {
        "option": "Apologize to end the fight.",
        "result": {"Happiness": -10},
        "flavor":
            "The argument is over, but you're still annoyed that you had to be the bigger person.",
      },
      {
        "option": "Double down and insist you're right.",
        "result": {"Happiness": -5},
        "flavor":
            "You won the argument, but the atmosphere in the house is tense now.",
      },
    ],
  },
  {
    "id": 11,
    "title": "Argument with Friend",
    "description":
        "After a big disagreement, your friend isn't speaking to you.",
    "choices": [
      {
        "option": "Reach out to them to talk.",
        "result": {"Happiness": 5},
        "flavor":
            "It was an awkward conversation, but you're glad you cleared the air.",
      },
      {
        "option": "Wait for them to apologize.",
        "result": {"Happiness": -8},
        "flavor":
            "You stand by your principles, but the silence is starting to feel lonely.",
      },
    ],
  },
  {
    "id": 12,
    "title": "Vending Machine",
    "description":
        "You're standing in front of a vending machine, craving a snack.",
    "choices": [
      {
        "option": "Get the sugary candy bar.",
        "result": {"Happiness": 5, "Health": -3},
        "flavor": "That was a delicious, sugary rush of instant gratification.",
      },
      {
        "option": "Get the healthy granola bar.",
        "result": {"Health": 3, "Happiness": -3},
        "flavor":
            "You chew on the dry granola bar, feeling virtuous but unsatisfied.",
      },
    ],
  },
  {
    "id": 13,
    "title": "Friend's Call for Hangout",
    "description":
        "You were about to go to bed, but your friend calls asking to hang out right now.",
    "choices": [
      {
        "option": "Go hang out with them.",
        "result": {"Happiness": 10, "Health": -5},
        "flavor":
            "You had a great time, but you know you'll be exhausted tomorrow.",
      },
      {
        "option": "Say you're too tired and stay in.",
        "result": {"Health": 5, "Happiness": -5},
        "flavor":
            "You missed out on the fun, but your comfortable bed feels amazing.",
      },
    ],
  },
  {
    "id": 14,
    "title": "Phone Screen Cracked",
    "description":
        "You dropped your phone and the screen is now a web of ugly cracks.",
    "choices": [
      {
        "option": "Get it repaired.",
        "result": {"Happiness": -5},
        "flavor":
            "Your phone looks brand new again, but the experience was a hassle.",
      },
      {
        "option": "Learn to live with the cracks.",
        "result": {"Happiness": -8},
        "flavor":
            "Every time you look at your phone, the spiderweb of cracks annoys you.",
      },
    ],
  },
  {
    "id": 15,
    "title": "Forgot Friend's Birthday",
    "description":
        "You just realized that yesterday was your good friend's birthday and you forgot.",
    "choices": [
      {
        "option": "Call them immediately to apologize.",
        "result": {"Happiness": -5},
        "flavor":
            "Your friend was a little hurt, but they accepted your apology.",
      },
      {
        "option": "Just send a late text.",
        "result": {"Happiness": -10},
        "flavor": "Your friend replied with a single 'k.' That can't be good.",
      },
    ],
  },
  {
    "id": 16,
    "title": "Parents' Anniversary",
    "description": "You remembered it's your parents' anniversary today.",
    "choices": [
      {
        "option": "Make them a thoughtful card.",
        "result": {"Happiness": 8},
        "flavor":
            "Your parents loved the card and told you how thoughtful you are.",
      },
      {
        "option": "Send them a quick text message.",
        "result": {"Happiness": -3},
        "flavor":
            "Well, at least you remembered. It's the thought that counts... right?",
      },
    ],
  },
  {
    "id": 17,
    "title": "Big Exam Coming Up",
    "description":
        "You have a final exam next week that you are not prepared for.",
    "choices": [
      {
        "option": "Create a strict study schedule.",
        "result": {"Smarts": 8, "Happiness": -8},
        "flavor":
            "It was a grueling week of studying, but you feel ready for the exam.",
      },
      {
        "option": "Just cram the night before.",
        "result": {"Smarts": 2, "Health": -5},
        "flavor":
            "You're exhausted from pulling an all-nighter and can barely keep your eyes open.",
      },
    ],
  },
  {
    "id": 18,
    "title": "Form a Study Group",
    "description":
        "A classmate suggests forming a study group for the big exam.",
    "choices": [
      {
        "option": "Join the group.",
        "result": {"Smarts": 5, "Happiness": -3},
        "flavor":
            "The group got sidetracked a few times, but you learned a lot from your classmates.",
      },
      {
        "option": "Decide to study alone.",
        "result": {"Smarts": 3},
        "flavor":
            "You were able to focus without distractions. Hopefully, you covered everything.",
      },
    ],
  },
  {
    "id": 19,
    "title": "Street Vendor Selling",
    "description":
        "A street vendor is selling food that smells amazing but looks a little questionable.",
    "choices": [
      {
        "option": "Buy it and take a chance.",
        "result": {"Happiness": 8, "Health": -5},
        "flavor":
            "That was delicious! You just hope you don't regret it later.",
      },
      {
        "option": "Play it safe and walk away.",
        "result": {"Health": 1},
        "flavor":
            "You walked away, your stomach rumbling. It probably would have been fine.",
      },
    ],
  },
  {
    "id": 20,
    "title": "Shirt Has a Hole",
    "description":
        "You notice your favorite shirt has a small, noticeable hole in it.",
    "choices": [
      {
        "option": "Try to patch it up neatly.",
        "result": {"Smarts": 3, "Happiness": 3},
        "flavor":
            "Your sewing skills are better than you thought! The patch is barely visible.",
      },
      {
        "option": "Wear it with the hole.",
        "result": {"Looks": -5, "Happiness": -3},
        "flavor":
            "You spent the whole day feeling self-conscious about the hole in your shirt.",
      },
    ],
  },
  {
    "id": 21,
    "title": "Barber",
    "description":
        "You're at the barber and it's time to decide on your next haircut.",
    "choices": [
      {
        "option": "Try a bold, new hairstyle.",
        "result": {"Looks": 10, "Happiness": -5},
        "flavor":
            "The risky haircut paid off! You look amazing and feel incredibly confident.",
      },
      {
        "option": "Get your usual, safe haircut.",
        "result": {"Looks": 3},
        "flavor":
            "It's a good, clean haircut. Nothing exciting, but it gets the job done.",
      },
    ],
  },
  {
    "id": 22,
    "title": "Charity Worker Donation",
    "description":
        "A charity worker on the street asks for a moment of your time.",
    "choices": [
      {
        "option": "Stop and listen to their cause.",
        "result": {"Happiness": 5},
        "flavor":
            "You're glad you took the time to listen. It feels good to be informed.",
      },
      {
        "option": "Politely say you're in a hurry.",
        "result": {"Happiness": -3},
        "flavor": "You feel a small pang of guilt for brushing them off.",
      },
    ],
  },
  {
    "id": 23,
    "title": "Kitchen is Dirty",
    "description":
        "The kitchen is a disaster zone, with dirty dishes and food scraps everywhere.",
    "choices": [
      {
        "option": "Spend an hour cleaning it up.",
        "result": {"Happiness": 10, "Health": -3},
        "flavor":
            "It was hard work, but the sparkling clean kitchen makes you feel calm and organized.",
      },
      {
        "option": "Leave it for tomorrow.",
        "result": {"Happiness": -8, "Health": -3},
        "flavor":
            "You decide to ignore the mess, but its presence is stressing you out.",
      },
    ],
  },
  {
    "id": 24,
    "title": "High School Reunion",
    "description":
        "You received an invitation to your 10-year high school reunion.",
    "choices": [
      {
        "option": "RSVP that you will attend.",
        "result": {"Happiness": 10, "Looks": 5},
        "flavor":
            "It was great to see everyone and show them how well you're doing.",
      },
      {
        "option": "Throw the invitation away.",
        "result": {"Happiness": -5},
        "flavor":
            "You toss the invitation, but you can't help but wonder what everyone is up to.",
      },
    ],
  },
  {
    "id": 25,
    "title": "Friend's Long Story",
    "description":
        "Your friend launches into a very long and incredibly boring story.",
    "choices": [
      {
        "option": "Listen patiently until the end.",
        "result": {"Happiness": -8},
        "flavor":
            "You feel like a good friend, but your brain feels like it's melting.",
      },
      {
        "option": "Make an excuse to leave.",
        "result": {"Happiness": -3},
        "flavor": "You escaped! You feel a little bad, but mostly relieved.",
      },
    ],
  },
  {
    "id": 26,
    "title": "Free Evening Plan",
    "description": "You have a completely free evening with nothing scheduled.",
    "choices": [
      {
        "option": "Spend it learning a new skill.",
        "result": {"Smarts": 5, "Happiness": -3},
        "flavor":
            "It was challenging, but you're proud of yourself for being productive.",
      },
      {
        "option": "Binge-watch a new TV show.",
        "result": {"Happiness": 8},
        "flavor": "You spent the whole evening on the couch. It was glorious.",
      },
    ],
  },
  {
    "id": 27,
    "title": "Local Museum",
    "description":
        "The local museum is featuring a new exhibit on world history.",
    "choices": [
      {
        "option": "Spend the afternoon there.",
        "result": {"Smarts": 8, "Happiness": -3},
        "flavor": "You leave the museum feeling cultured and knowledgeable.",
      },
      {
        "option": "Decide that sounds boring.",
        "result": {"Smarts": -1},
        "flavor": "You decide to skip it. Who needs old, dusty relics anyway?",
      },
    ],
  },
  {
    "id": 28,
    "title": "Friend's Puzzle",
    "description":
        "A friend gives you a complex brain-teaser puzzle and challenges you to solve it.",
    "choices": [
      {
        "option": "Dedicate time to solving it.",
        "result": {"Smarts": 10, "Happiness": -5},
        "flavor":
            "Your brain hurts, but you finally solved it! The feeling of accomplishment is immense.",
      },
      {
        "option": "Give up after a few minutes.",
        "result": {"Smarts": -3},
        "flavor":
            "You hand the puzzle back, unsolved. It was probably impossible anyway.",
      },
    ],
  },
  {
    "id": 29,
    "title": "Learn New Language",
    "description":
        "You have an opportunity to sign up for a class to learn a new language.",
    "choices": [
      {
        "option": "Commit to the daily lessons.",
        "result": {"Smarts": 15, "Happiness": -10},
        "flavor":
            "The lessons are difficult and time-consuming, but your mind feels sharper than ever.",
      },
      {
        "option": "Decide it's too much effort.",
        "result": {"Happiness": 3},
        "flavor":
            "You decide to stick with the language you already know. Life is simpler that way.",
      },
    ],
  },

  // Negative Choice
  {
    "id": 30,
    "title": "Shady Investment Offer",
    "description": "An acquaintance offers you a 'guaranteed' high-return investment that sounds too good to be true.",
    "choices": [
      {
        "option": "Invest in it.",
        "result": {"Smarts": -10, "Happiness": -15},
        "flavor": "You lost a significant amount of money. It was, indeed, too good to be true."
      },
      {
        "option": "Politely decline.",
        "result": {"Happiness": -5},
        "flavor": "You feel a brief pang of regret, but your money is safe."
      }
    ]
  },
  {
    "id": 31,
    "title": "Cut Corners on a Project",
    "description": "You can finish a big project much faster by cutting some corners and doing a lazy job.",
    "choices": [
      {
        "option": "Do a lazy job.",
        "result": {"Smarts": -8, "Happiness": -5},
        "flavor": "You finished early and feel good about your free time, but the quality of your work is noticeably lower."
      },
      {
        "option": "Do it the right way.",
        "result": {"Happiness": -10},
        "flavor": "It took longer, and you're tired, but you're proud of your thorough work."
      }
    ]
  },
  {
    "id": 32,
    "title": "Office Gossip",
    "description": "A coworker starts telling you some juicy gossip about a mutual friend.",
    "choices": [
      {
        "option": "Listen and participate.",
        "result": {"Happiness": -8, "Smarts": -3},
        "flavor": "You got caught up in the drama, and now you feel a bit guilty."
      },
      {
        "option": "Walk away from the conversation.",
        "result": {"Happiness": -5},
        "flavor": "You avoided the gossip, but your coworker gives you a weird look."
      }
    ]
  },
  {
    "id": 33,
    "title": "Argue with Coworker",
    "description": "You and a coworker are having a heated disagreement over a work-related issue.",
    "choices": [
      {
        "option": "Escalate the argument to win.",
        "result": {"Happiness": -10},
        "flavor": "You 'won' the argument, but the tension between you and your coworker is palpable."
      },
      {
        "option": "Back down to keep the peace.",
        "result": {"Happiness": -8},
        "flavor": "You diffused the situation, but you're annoyed you didn't get your point across."
      }
    ]
  },
  {
    "id": 34,
    "title": "Cheat on Test",
    "description": "You are completely unprepared for a major exam, but you see a clear opportunity to cheat.",
    "choices": [
      {
        "option": "Risk it and cheat.",
        "result": {"Smarts": -15, "Happiness": -15},
        "flavor": "You barely passed, but the guilt and fear of getting caught weigh heavily on you."
      },
      {
        "option": "Accept your fate and fail.",
        "result": {"Smarts": -8},
        "flavor": "You failed the test, but you feel better knowing you were honest."
      }
    ]
  },
  {
    "id": 35,
    "title": "Extra Work Favor",
    "description": "Your boss asks you to stay late to help with a task that is not your responsibility.",
    "choices": [
      {
        "option": "Agree to do the favor.",
        "result": {"Happiness": -10},
        "flavor": "You stayed late, completing the extra work. You're exhausted and slightly resentful."
      },
      {
        "option": "Say you have other plans.",
        "result": {"Happiness": -8},
        "flavor": "You avoided the extra work, but your boss seemed disappointed."
      }
    ]
  },
  {
    "id": 36,
    "title": "Procrastination",
    "description": "You have an important project due tomorrow, but a new season of your favorite show just dropped.",
    "choices": [
      {
        "option": "Watch the show and relax.",
        "result": {"Smarts": -8, "Health": -5},
        "flavor": "You enjoyed the show, but now you're stressed about the impending deadline and lack of sleep."
      },
      {
        "option": "Force yourself to do the work.",
        "result": {"Happiness": -10},
        "flavor": "You finished the project on time, but missed out on relaxation and feel a bit burnt out."
      }
    ]
  },
  {
    "id": 37,
    "title": "Ex's Text",
    "description": "Your ex sends you a text late at night saying they miss you.",
    "choices": [
      {
        "option": "Reply to them.",
        "result": {"Happiness": -15},
        "flavor": "You got drawn back into old feelings and drama, leaving you feeling worse than before."
      },
      {
        "option": "Ignore the text.",
        "result": {"Happiness": -8},
        "flavor": "You resisted the urge to reply, but the text still bothered you for a while."
      }
    ]
  },
  {
    "id": 38,
    "title": "Internet Trolls",
    "description": "You post an opinion online, and a stranger starts leaving insulting comments.",
    "choices": [
      {
        "option": "Argue with the troll.",
        "result": {"Happiness": -10, "Smarts": -5},
        "flavor": "You wasted time and energy arguing with a stranger, feeling frustrated and drained."
      },
      {
        "option": "Block them and move on.",
        "result": {"Happiness": -5},
        "flavor": "You took the high road and blocked the troll, but the comments still left a sour taste."
      }
    ]
  }
];

List<Map<String, dynamic>> get eventsChoiceList => _eventsChoiceList;
