/* UFO Invasions or not? Last week, four UFO enthusiasts made sightings 
 * of unidentified flying objects in their neighborhood. Each of the four 
 * reported his or her sightings on a different day, and soon the neighborhood 
 * was abuzz with rumors of  little green men. By the weekend, though, the 
 * government stepped in and was able to give each person a different, 
 * plausible explanation of what he or she had "really" seen. Can you 
 * determine the day ( Tuesday through Friday ) each person sighted a UFO, 
 * as well as the object that it turned out to be?

1. Ms. Langone made her sighting at some point earlier in the week 
    than the one who saw the balloon, but at some point later in 
    the week, than the one who spotted the Frisbee (who isn't Mr. Hugh).
2. Friday's sighting was made by either Mr. Barnes or the one who 
    saw a clothesline ( or both ).
3. Ms. Demetri did not make her sighting on Tuesday.
4. Ms. Langone isn't the one whose object turned out to be a water tower.

Represent this puzzle in Prolog, SWI Prolog is recommended. 
State the day of each sighting. the person doing the sighting, 
and the object allegedly sighted and what that object actually 
was ( or at least what the government claimed it was ).
*/

% Render the output as a nice table.
:- use_rendering(table,
          [header(h('Name', 'Day', 'Object Sighted'))]).

sightings(People) :-
    length(People, 4),
    /* Give the known names, days, and the possible objects sighted as facts */
    member(h(mr.hugh,_,_),People),
    member(h(mr.barnes,_,_),People),
    member(h(ms.demetri,_,_),People),
    member(h(ms.langone,_,_),People),
    member(h(_,tuesday,_),People),
    member(h(_,wednesday,_),People),
    member(h(_,thursday,_),People),
    member(h(_,friday,_),People),
    member(h(_,_,balloon),People),
    member(h(_,_,clothesline),People),
    member(h(_,_,watertower),People),
    member(h(_,_,frisbee),People),
    
    (   (member(h(_,tuesday,frisbee),People) , member(h(ms.langone,wednesday,_),People) , member(h(_,thursday,balloon),People));
        (member(h(_,tuesday,frisbee),People) , member(h(ms.langone,wednesday,_),People) , member(h(_,friday,balloon),People));
        (member(h(_,tuesday,frisbee),People) , member(h(ms.langone,thursday,_),People) , member(h(_,friday,balloon),People));
        (member(h(_,wednesday,frisbee),People) , member(h(ms.langone,thursday,_),People) , member(h(_,friday,balloon),People))  ),
    (member(h(mr.hugh,_,balloon),People) ; member(h(mr.hugh,_,clothesline),People) ; member(h(mr.hugh,_,watertower),People)),
    (member(h(mr.barnes,friday,_),People) ; member(h(_,friday,clothesline),People)),
    (member(h(ms.demetri,wednesday,_),People) ; member(h(ms.demetri,thursday,_),People) ; member(h(ms.demetri,friday,_),People)),
    (member(h(ms.langone,_,frisbee),People) ; member(h(ms.langone,_,clothesline),People) ; member(h(ms.langone,_,balloon),People)).