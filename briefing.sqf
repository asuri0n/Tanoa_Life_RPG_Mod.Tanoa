waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["involvedgaming","Vacation-Gaming"];

/*  Example
        player createDiaryRecord ["", //Container
                [
                        "", //Subsection
                                "
                                TEXT HERE<br/><br/>
                                "
                ]
        ];
*/

// Vacation Gaming Gaming Section

player createDiaryRecord ["Vacation Gaming",
[
"Teamspeak",
"
<br/>
Vous pouvez nous retrouver sur notre teamspeak :<br/>
ts.vacationgaming.fr<br/><br/>
"
]
];

player createDiaryRecord ["involvedgaming",
[
"Site",
"
<br/>
Voici l'adresse du site :<br/>
http://www.vacationgaming.fr/ <br/><br/>
N'hésitez pas à le visiter pour plus d'informations !<br/><br/>
"
]
];