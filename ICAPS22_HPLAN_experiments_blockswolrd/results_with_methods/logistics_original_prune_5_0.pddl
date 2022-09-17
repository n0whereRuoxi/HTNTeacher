( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_215650 - OBJ
      ?auto_215649 - LOCATION
    )
    :vars
    (
      ?auto_215651 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_215651 ?auto_215649 ) ( IN-TRUCK ?auto_215650 ?auto_215651 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_215650 ?auto_215651 ?auto_215649 )
      ( DELIVER-1PKG-VERIFY ?auto_215650 ?auto_215649 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_215675 - OBJ
      ?auto_215674 - LOCATION
    )
    :vars
    (
      ?auto_215676 - TRUCK
      ?auto_215677 - LOCATION
      ?auto_215678 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_215675 ?auto_215676 ) ( TRUCK-AT ?auto_215676 ?auto_215677 ) ( IN-CITY ?auto_215677 ?auto_215678 ) ( IN-CITY ?auto_215674 ?auto_215678 ) ( not ( = ?auto_215674 ?auto_215677 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_215676 ?auto_215677 ?auto_215674 ?auto_215678 )
      ( DELIVER-1PKG ?auto_215675 ?auto_215674 )
      ( DELIVER-1PKG-VERIFY ?auto_215675 ?auto_215674 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_215710 - OBJ
      ?auto_215709 - LOCATION
    )
    :vars
    (
      ?auto_215713 - TRUCK
      ?auto_215711 - LOCATION
      ?auto_215712 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_215713 ?auto_215711 ) ( IN-CITY ?auto_215711 ?auto_215712 ) ( IN-CITY ?auto_215709 ?auto_215712 ) ( not ( = ?auto_215709 ?auto_215711 ) ) ( OBJ-AT ?auto_215710 ?auto_215711 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_215710 ?auto_215713 ?auto_215711 )
      ( DELIVER-1PKG ?auto_215710 ?auto_215709 )
      ( DELIVER-1PKG-VERIFY ?auto_215710 ?auto_215709 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_215745 - OBJ
      ?auto_215744 - LOCATION
    )
    :vars
    (
      ?auto_215748 - LOCATION
      ?auto_215746 - CITY
      ?auto_215747 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215748 ?auto_215746 ) ( IN-CITY ?auto_215744 ?auto_215746 ) ( not ( = ?auto_215744 ?auto_215748 ) ) ( OBJ-AT ?auto_215745 ?auto_215748 ) ( TRUCK-AT ?auto_215747 ?auto_215744 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_215747 ?auto_215744 ?auto_215748 ?auto_215746 )
      ( DELIVER-1PKG ?auto_215745 ?auto_215744 )
      ( DELIVER-1PKG-VERIFY ?auto_215745 ?auto_215744 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216083 - OBJ
      ?auto_216084 - OBJ
      ?auto_216082 - LOCATION
    )
    :vars
    (
      ?auto_216085 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216085 ?auto_216082 ) ( IN-TRUCK ?auto_216084 ?auto_216085 ) ( OBJ-AT ?auto_216083 ?auto_216082 ) ( not ( = ?auto_216083 ?auto_216084 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216084 ?auto_216082 )
      ( DELIVER-2PKG-VERIFY ?auto_216083 ?auto_216084 ?auto_216082 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216087 - OBJ
      ?auto_216088 - OBJ
      ?auto_216086 - LOCATION
    )
    :vars
    (
      ?auto_216089 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216089 ?auto_216086 ) ( IN-TRUCK ?auto_216087 ?auto_216089 ) ( OBJ-AT ?auto_216088 ?auto_216086 ) ( not ( = ?auto_216087 ?auto_216088 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216087 ?auto_216086 )
      ( DELIVER-2PKG-VERIFY ?auto_216087 ?auto_216088 ?auto_216086 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216095 - OBJ
      ?auto_216096 - OBJ
      ?auto_216097 - OBJ
      ?auto_216094 - LOCATION
    )
    :vars
    (
      ?auto_216098 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216098 ?auto_216094 ) ( IN-TRUCK ?auto_216097 ?auto_216098 ) ( OBJ-AT ?auto_216095 ?auto_216094 ) ( OBJ-AT ?auto_216096 ?auto_216094 ) ( not ( = ?auto_216095 ?auto_216096 ) ) ( not ( = ?auto_216095 ?auto_216097 ) ) ( not ( = ?auto_216096 ?auto_216097 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216097 ?auto_216094 )
      ( DELIVER-3PKG-VERIFY ?auto_216095 ?auto_216096 ?auto_216097 ?auto_216094 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216100 - OBJ
      ?auto_216101 - OBJ
      ?auto_216102 - OBJ
      ?auto_216099 - LOCATION
    )
    :vars
    (
      ?auto_216103 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216103 ?auto_216099 ) ( IN-TRUCK ?auto_216101 ?auto_216103 ) ( OBJ-AT ?auto_216100 ?auto_216099 ) ( OBJ-AT ?auto_216102 ?auto_216099 ) ( not ( = ?auto_216100 ?auto_216101 ) ) ( not ( = ?auto_216100 ?auto_216102 ) ) ( not ( = ?auto_216101 ?auto_216102 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216101 ?auto_216099 )
      ( DELIVER-3PKG-VERIFY ?auto_216100 ?auto_216101 ?auto_216102 ?auto_216099 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216110 - OBJ
      ?auto_216111 - OBJ
      ?auto_216112 - OBJ
      ?auto_216109 - LOCATION
    )
    :vars
    (
      ?auto_216113 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216113 ?auto_216109 ) ( IN-TRUCK ?auto_216110 ?auto_216113 ) ( OBJ-AT ?auto_216111 ?auto_216109 ) ( OBJ-AT ?auto_216112 ?auto_216109 ) ( not ( = ?auto_216110 ?auto_216111 ) ) ( not ( = ?auto_216110 ?auto_216112 ) ) ( not ( = ?auto_216111 ?auto_216112 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216110 ?auto_216109 )
      ( DELIVER-3PKG-VERIFY ?auto_216110 ?auto_216111 ?auto_216112 ?auto_216109 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216130 - OBJ
      ?auto_216131 - OBJ
      ?auto_216132 - OBJ
      ?auto_216133 - OBJ
      ?auto_216129 - LOCATION
    )
    :vars
    (
      ?auto_216134 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216134 ?auto_216129 ) ( IN-TRUCK ?auto_216133 ?auto_216134 ) ( OBJ-AT ?auto_216130 ?auto_216129 ) ( OBJ-AT ?auto_216131 ?auto_216129 ) ( OBJ-AT ?auto_216132 ?auto_216129 ) ( not ( = ?auto_216130 ?auto_216131 ) ) ( not ( = ?auto_216130 ?auto_216132 ) ) ( not ( = ?auto_216130 ?auto_216133 ) ) ( not ( = ?auto_216131 ?auto_216132 ) ) ( not ( = ?auto_216131 ?auto_216133 ) ) ( not ( = ?auto_216132 ?auto_216133 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216133 ?auto_216129 )
      ( DELIVER-4PKG-VERIFY ?auto_216130 ?auto_216131 ?auto_216132 ?auto_216133 ?auto_216129 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216136 - OBJ
      ?auto_216137 - OBJ
      ?auto_216138 - OBJ
      ?auto_216139 - OBJ
      ?auto_216135 - LOCATION
    )
    :vars
    (
      ?auto_216140 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216140 ?auto_216135 ) ( IN-TRUCK ?auto_216138 ?auto_216140 ) ( OBJ-AT ?auto_216136 ?auto_216135 ) ( OBJ-AT ?auto_216137 ?auto_216135 ) ( OBJ-AT ?auto_216139 ?auto_216135 ) ( not ( = ?auto_216136 ?auto_216137 ) ) ( not ( = ?auto_216136 ?auto_216138 ) ) ( not ( = ?auto_216136 ?auto_216139 ) ) ( not ( = ?auto_216137 ?auto_216138 ) ) ( not ( = ?auto_216137 ?auto_216139 ) ) ( not ( = ?auto_216138 ?auto_216139 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216138 ?auto_216135 )
      ( DELIVER-4PKG-VERIFY ?auto_216136 ?auto_216137 ?auto_216138 ?auto_216139 ?auto_216135 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216148 - OBJ
      ?auto_216149 - OBJ
      ?auto_216150 - OBJ
      ?auto_216151 - OBJ
      ?auto_216147 - LOCATION
    )
    :vars
    (
      ?auto_216152 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216152 ?auto_216147 ) ( IN-TRUCK ?auto_216149 ?auto_216152 ) ( OBJ-AT ?auto_216148 ?auto_216147 ) ( OBJ-AT ?auto_216150 ?auto_216147 ) ( OBJ-AT ?auto_216151 ?auto_216147 ) ( not ( = ?auto_216148 ?auto_216149 ) ) ( not ( = ?auto_216148 ?auto_216150 ) ) ( not ( = ?auto_216148 ?auto_216151 ) ) ( not ( = ?auto_216149 ?auto_216150 ) ) ( not ( = ?auto_216149 ?auto_216151 ) ) ( not ( = ?auto_216150 ?auto_216151 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216149 ?auto_216147 )
      ( DELIVER-4PKG-VERIFY ?auto_216148 ?auto_216149 ?auto_216150 ?auto_216151 ?auto_216147 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216172 - OBJ
      ?auto_216173 - OBJ
      ?auto_216174 - OBJ
      ?auto_216175 - OBJ
      ?auto_216171 - LOCATION
    )
    :vars
    (
      ?auto_216176 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216176 ?auto_216171 ) ( IN-TRUCK ?auto_216172 ?auto_216176 ) ( OBJ-AT ?auto_216173 ?auto_216171 ) ( OBJ-AT ?auto_216174 ?auto_216171 ) ( OBJ-AT ?auto_216175 ?auto_216171 ) ( not ( = ?auto_216172 ?auto_216173 ) ) ( not ( = ?auto_216172 ?auto_216174 ) ) ( not ( = ?auto_216172 ?auto_216175 ) ) ( not ( = ?auto_216173 ?auto_216174 ) ) ( not ( = ?auto_216173 ?auto_216175 ) ) ( not ( = ?auto_216174 ?auto_216175 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216172 ?auto_216171 )
      ( DELIVER-4PKG-VERIFY ?auto_216172 ?auto_216173 ?auto_216174 ?auto_216175 ?auto_216171 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216220 - OBJ
      ?auto_216221 - OBJ
      ?auto_216222 - OBJ
      ?auto_216223 - OBJ
      ?auto_216224 - OBJ
      ?auto_216219 - LOCATION
    )
    :vars
    (
      ?auto_216225 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216225 ?auto_216219 ) ( IN-TRUCK ?auto_216224 ?auto_216225 ) ( OBJ-AT ?auto_216220 ?auto_216219 ) ( OBJ-AT ?auto_216221 ?auto_216219 ) ( OBJ-AT ?auto_216222 ?auto_216219 ) ( OBJ-AT ?auto_216223 ?auto_216219 ) ( not ( = ?auto_216220 ?auto_216221 ) ) ( not ( = ?auto_216220 ?auto_216222 ) ) ( not ( = ?auto_216220 ?auto_216223 ) ) ( not ( = ?auto_216220 ?auto_216224 ) ) ( not ( = ?auto_216221 ?auto_216222 ) ) ( not ( = ?auto_216221 ?auto_216223 ) ) ( not ( = ?auto_216221 ?auto_216224 ) ) ( not ( = ?auto_216222 ?auto_216223 ) ) ( not ( = ?auto_216222 ?auto_216224 ) ) ( not ( = ?auto_216223 ?auto_216224 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216224 ?auto_216219 )
      ( DELIVER-5PKG-VERIFY ?auto_216220 ?auto_216221 ?auto_216222 ?auto_216223 ?auto_216224 ?auto_216219 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216227 - OBJ
      ?auto_216228 - OBJ
      ?auto_216229 - OBJ
      ?auto_216230 - OBJ
      ?auto_216231 - OBJ
      ?auto_216226 - LOCATION
    )
    :vars
    (
      ?auto_216232 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216232 ?auto_216226 ) ( IN-TRUCK ?auto_216230 ?auto_216232 ) ( OBJ-AT ?auto_216227 ?auto_216226 ) ( OBJ-AT ?auto_216228 ?auto_216226 ) ( OBJ-AT ?auto_216229 ?auto_216226 ) ( OBJ-AT ?auto_216231 ?auto_216226 ) ( not ( = ?auto_216227 ?auto_216228 ) ) ( not ( = ?auto_216227 ?auto_216229 ) ) ( not ( = ?auto_216227 ?auto_216230 ) ) ( not ( = ?auto_216227 ?auto_216231 ) ) ( not ( = ?auto_216228 ?auto_216229 ) ) ( not ( = ?auto_216228 ?auto_216230 ) ) ( not ( = ?auto_216228 ?auto_216231 ) ) ( not ( = ?auto_216229 ?auto_216230 ) ) ( not ( = ?auto_216229 ?auto_216231 ) ) ( not ( = ?auto_216230 ?auto_216231 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216230 ?auto_216226 )
      ( DELIVER-5PKG-VERIFY ?auto_216227 ?auto_216228 ?auto_216229 ?auto_216230 ?auto_216231 ?auto_216226 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216241 - OBJ
      ?auto_216242 - OBJ
      ?auto_216243 - OBJ
      ?auto_216244 - OBJ
      ?auto_216245 - OBJ
      ?auto_216240 - LOCATION
    )
    :vars
    (
      ?auto_216246 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216246 ?auto_216240 ) ( IN-TRUCK ?auto_216243 ?auto_216246 ) ( OBJ-AT ?auto_216241 ?auto_216240 ) ( OBJ-AT ?auto_216242 ?auto_216240 ) ( OBJ-AT ?auto_216244 ?auto_216240 ) ( OBJ-AT ?auto_216245 ?auto_216240 ) ( not ( = ?auto_216241 ?auto_216242 ) ) ( not ( = ?auto_216241 ?auto_216243 ) ) ( not ( = ?auto_216241 ?auto_216244 ) ) ( not ( = ?auto_216241 ?auto_216245 ) ) ( not ( = ?auto_216242 ?auto_216243 ) ) ( not ( = ?auto_216242 ?auto_216244 ) ) ( not ( = ?auto_216242 ?auto_216245 ) ) ( not ( = ?auto_216243 ?auto_216244 ) ) ( not ( = ?auto_216243 ?auto_216245 ) ) ( not ( = ?auto_216244 ?auto_216245 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216243 ?auto_216240 )
      ( DELIVER-5PKG-VERIFY ?auto_216241 ?auto_216242 ?auto_216243 ?auto_216244 ?auto_216245 ?auto_216240 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216269 - OBJ
      ?auto_216270 - OBJ
      ?auto_216271 - OBJ
      ?auto_216272 - OBJ
      ?auto_216273 - OBJ
      ?auto_216268 - LOCATION
    )
    :vars
    (
      ?auto_216274 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216274 ?auto_216268 ) ( IN-TRUCK ?auto_216270 ?auto_216274 ) ( OBJ-AT ?auto_216269 ?auto_216268 ) ( OBJ-AT ?auto_216271 ?auto_216268 ) ( OBJ-AT ?auto_216272 ?auto_216268 ) ( OBJ-AT ?auto_216273 ?auto_216268 ) ( not ( = ?auto_216269 ?auto_216270 ) ) ( not ( = ?auto_216269 ?auto_216271 ) ) ( not ( = ?auto_216269 ?auto_216272 ) ) ( not ( = ?auto_216269 ?auto_216273 ) ) ( not ( = ?auto_216270 ?auto_216271 ) ) ( not ( = ?auto_216270 ?auto_216272 ) ) ( not ( = ?auto_216270 ?auto_216273 ) ) ( not ( = ?auto_216271 ?auto_216272 ) ) ( not ( = ?auto_216271 ?auto_216273 ) ) ( not ( = ?auto_216272 ?auto_216273 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216270 ?auto_216268 )
      ( DELIVER-5PKG-VERIFY ?auto_216269 ?auto_216270 ?auto_216271 ?auto_216272 ?auto_216273 ?auto_216268 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216325 - OBJ
      ?auto_216326 - OBJ
      ?auto_216327 - OBJ
      ?auto_216328 - OBJ
      ?auto_216329 - OBJ
      ?auto_216324 - LOCATION
    )
    :vars
    (
      ?auto_216330 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216330 ?auto_216324 ) ( IN-TRUCK ?auto_216325 ?auto_216330 ) ( OBJ-AT ?auto_216326 ?auto_216324 ) ( OBJ-AT ?auto_216327 ?auto_216324 ) ( OBJ-AT ?auto_216328 ?auto_216324 ) ( OBJ-AT ?auto_216329 ?auto_216324 ) ( not ( = ?auto_216325 ?auto_216326 ) ) ( not ( = ?auto_216325 ?auto_216327 ) ) ( not ( = ?auto_216325 ?auto_216328 ) ) ( not ( = ?auto_216325 ?auto_216329 ) ) ( not ( = ?auto_216326 ?auto_216327 ) ) ( not ( = ?auto_216326 ?auto_216328 ) ) ( not ( = ?auto_216326 ?auto_216329 ) ) ( not ( = ?auto_216327 ?auto_216328 ) ) ( not ( = ?auto_216327 ?auto_216329 ) ) ( not ( = ?auto_216328 ?auto_216329 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216325 ?auto_216324 )
      ( DELIVER-5PKG-VERIFY ?auto_216325 ?auto_216326 ?auto_216327 ?auto_216328 ?auto_216329 ?auto_216324 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216442 - OBJ
      ?auto_216443 - OBJ
      ?auto_216441 - LOCATION
    )
    :vars
    (
      ?auto_216445 - TRUCK
      ?auto_216446 - LOCATION
      ?auto_216444 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216443 ?auto_216445 ) ( TRUCK-AT ?auto_216445 ?auto_216446 ) ( IN-CITY ?auto_216446 ?auto_216444 ) ( IN-CITY ?auto_216441 ?auto_216444 ) ( not ( = ?auto_216441 ?auto_216446 ) ) ( OBJ-AT ?auto_216442 ?auto_216441 ) ( not ( = ?auto_216442 ?auto_216443 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216443 ?auto_216441 )
      ( DELIVER-2PKG-VERIFY ?auto_216442 ?auto_216443 ?auto_216441 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216448 - OBJ
      ?auto_216449 - OBJ
      ?auto_216447 - LOCATION
    )
    :vars
    (
      ?auto_216452 - TRUCK
      ?auto_216451 - LOCATION
      ?auto_216450 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216448 ?auto_216452 ) ( TRUCK-AT ?auto_216452 ?auto_216451 ) ( IN-CITY ?auto_216451 ?auto_216450 ) ( IN-CITY ?auto_216447 ?auto_216450 ) ( not ( = ?auto_216447 ?auto_216451 ) ) ( OBJ-AT ?auto_216449 ?auto_216447 ) ( not ( = ?auto_216449 ?auto_216448 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216449 ?auto_216448 ?auto_216447 )
      ( DELIVER-2PKG-VERIFY ?auto_216448 ?auto_216449 ?auto_216447 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216461 - OBJ
      ?auto_216462 - OBJ
      ?auto_216463 - OBJ
      ?auto_216460 - LOCATION
    )
    :vars
    (
      ?auto_216466 - TRUCK
      ?auto_216465 - LOCATION
      ?auto_216464 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216463 ?auto_216466 ) ( TRUCK-AT ?auto_216466 ?auto_216465 ) ( IN-CITY ?auto_216465 ?auto_216464 ) ( IN-CITY ?auto_216460 ?auto_216464 ) ( not ( = ?auto_216460 ?auto_216465 ) ) ( OBJ-AT ?auto_216461 ?auto_216460 ) ( not ( = ?auto_216461 ?auto_216463 ) ) ( OBJ-AT ?auto_216462 ?auto_216460 ) ( not ( = ?auto_216461 ?auto_216462 ) ) ( not ( = ?auto_216462 ?auto_216463 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216461 ?auto_216463 ?auto_216460 )
      ( DELIVER-3PKG-VERIFY ?auto_216461 ?auto_216462 ?auto_216463 ?auto_216460 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216468 - OBJ
      ?auto_216469 - OBJ
      ?auto_216470 - OBJ
      ?auto_216467 - LOCATION
    )
    :vars
    (
      ?auto_216473 - TRUCK
      ?auto_216472 - LOCATION
      ?auto_216471 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216469 ?auto_216473 ) ( TRUCK-AT ?auto_216473 ?auto_216472 ) ( IN-CITY ?auto_216472 ?auto_216471 ) ( IN-CITY ?auto_216467 ?auto_216471 ) ( not ( = ?auto_216467 ?auto_216472 ) ) ( OBJ-AT ?auto_216470 ?auto_216467 ) ( not ( = ?auto_216470 ?auto_216469 ) ) ( OBJ-AT ?auto_216468 ?auto_216467 ) ( not ( = ?auto_216468 ?auto_216469 ) ) ( not ( = ?auto_216468 ?auto_216470 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216470 ?auto_216469 ?auto_216467 )
      ( DELIVER-3PKG-VERIFY ?auto_216468 ?auto_216469 ?auto_216470 ?auto_216467 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216482 - OBJ
      ?auto_216483 - OBJ
      ?auto_216484 - OBJ
      ?auto_216481 - LOCATION
    )
    :vars
    (
      ?auto_216487 - TRUCK
      ?auto_216486 - LOCATION
      ?auto_216485 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216482 ?auto_216487 ) ( TRUCK-AT ?auto_216487 ?auto_216486 ) ( IN-CITY ?auto_216486 ?auto_216485 ) ( IN-CITY ?auto_216481 ?auto_216485 ) ( not ( = ?auto_216481 ?auto_216486 ) ) ( OBJ-AT ?auto_216484 ?auto_216481 ) ( not ( = ?auto_216484 ?auto_216482 ) ) ( OBJ-AT ?auto_216483 ?auto_216481 ) ( not ( = ?auto_216482 ?auto_216483 ) ) ( not ( = ?auto_216483 ?auto_216484 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216484 ?auto_216482 ?auto_216481 )
      ( DELIVER-3PKG-VERIFY ?auto_216482 ?auto_216483 ?auto_216484 ?auto_216481 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216511 - OBJ
      ?auto_216512 - OBJ
      ?auto_216513 - OBJ
      ?auto_216514 - OBJ
      ?auto_216510 - LOCATION
    )
    :vars
    (
      ?auto_216517 - TRUCK
      ?auto_216516 - LOCATION
      ?auto_216515 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216514 ?auto_216517 ) ( TRUCK-AT ?auto_216517 ?auto_216516 ) ( IN-CITY ?auto_216516 ?auto_216515 ) ( IN-CITY ?auto_216510 ?auto_216515 ) ( not ( = ?auto_216510 ?auto_216516 ) ) ( OBJ-AT ?auto_216511 ?auto_216510 ) ( not ( = ?auto_216511 ?auto_216514 ) ) ( OBJ-AT ?auto_216512 ?auto_216510 ) ( OBJ-AT ?auto_216513 ?auto_216510 ) ( not ( = ?auto_216511 ?auto_216512 ) ) ( not ( = ?auto_216511 ?auto_216513 ) ) ( not ( = ?auto_216512 ?auto_216513 ) ) ( not ( = ?auto_216512 ?auto_216514 ) ) ( not ( = ?auto_216513 ?auto_216514 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216511 ?auto_216514 ?auto_216510 )
      ( DELIVER-4PKG-VERIFY ?auto_216511 ?auto_216512 ?auto_216513 ?auto_216514 ?auto_216510 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216519 - OBJ
      ?auto_216520 - OBJ
      ?auto_216521 - OBJ
      ?auto_216522 - OBJ
      ?auto_216518 - LOCATION
    )
    :vars
    (
      ?auto_216525 - TRUCK
      ?auto_216524 - LOCATION
      ?auto_216523 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216521 ?auto_216525 ) ( TRUCK-AT ?auto_216525 ?auto_216524 ) ( IN-CITY ?auto_216524 ?auto_216523 ) ( IN-CITY ?auto_216518 ?auto_216523 ) ( not ( = ?auto_216518 ?auto_216524 ) ) ( OBJ-AT ?auto_216522 ?auto_216518 ) ( not ( = ?auto_216522 ?auto_216521 ) ) ( OBJ-AT ?auto_216519 ?auto_216518 ) ( OBJ-AT ?auto_216520 ?auto_216518 ) ( not ( = ?auto_216519 ?auto_216520 ) ) ( not ( = ?auto_216519 ?auto_216521 ) ) ( not ( = ?auto_216519 ?auto_216522 ) ) ( not ( = ?auto_216520 ?auto_216521 ) ) ( not ( = ?auto_216520 ?auto_216522 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216522 ?auto_216521 ?auto_216518 )
      ( DELIVER-4PKG-VERIFY ?auto_216519 ?auto_216520 ?auto_216521 ?auto_216522 ?auto_216518 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216535 - OBJ
      ?auto_216536 - OBJ
      ?auto_216537 - OBJ
      ?auto_216538 - OBJ
      ?auto_216534 - LOCATION
    )
    :vars
    (
      ?auto_216541 - TRUCK
      ?auto_216540 - LOCATION
      ?auto_216539 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216536 ?auto_216541 ) ( TRUCK-AT ?auto_216541 ?auto_216540 ) ( IN-CITY ?auto_216540 ?auto_216539 ) ( IN-CITY ?auto_216534 ?auto_216539 ) ( not ( = ?auto_216534 ?auto_216540 ) ) ( OBJ-AT ?auto_216535 ?auto_216534 ) ( not ( = ?auto_216535 ?auto_216536 ) ) ( OBJ-AT ?auto_216537 ?auto_216534 ) ( OBJ-AT ?auto_216538 ?auto_216534 ) ( not ( = ?auto_216535 ?auto_216537 ) ) ( not ( = ?auto_216535 ?auto_216538 ) ) ( not ( = ?auto_216536 ?auto_216537 ) ) ( not ( = ?auto_216536 ?auto_216538 ) ) ( not ( = ?auto_216537 ?auto_216538 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216535 ?auto_216536 ?auto_216534 )
      ( DELIVER-4PKG-VERIFY ?auto_216535 ?auto_216536 ?auto_216537 ?auto_216538 ?auto_216534 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216567 - OBJ
      ?auto_216568 - OBJ
      ?auto_216569 - OBJ
      ?auto_216570 - OBJ
      ?auto_216566 - LOCATION
    )
    :vars
    (
      ?auto_216573 - TRUCK
      ?auto_216572 - LOCATION
      ?auto_216571 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216567 ?auto_216573 ) ( TRUCK-AT ?auto_216573 ?auto_216572 ) ( IN-CITY ?auto_216572 ?auto_216571 ) ( IN-CITY ?auto_216566 ?auto_216571 ) ( not ( = ?auto_216566 ?auto_216572 ) ) ( OBJ-AT ?auto_216570 ?auto_216566 ) ( not ( = ?auto_216570 ?auto_216567 ) ) ( OBJ-AT ?auto_216568 ?auto_216566 ) ( OBJ-AT ?auto_216569 ?auto_216566 ) ( not ( = ?auto_216567 ?auto_216568 ) ) ( not ( = ?auto_216567 ?auto_216569 ) ) ( not ( = ?auto_216568 ?auto_216569 ) ) ( not ( = ?auto_216568 ?auto_216570 ) ) ( not ( = ?auto_216569 ?auto_216570 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216570 ?auto_216567 ?auto_216566 )
      ( DELIVER-4PKG-VERIFY ?auto_216567 ?auto_216568 ?auto_216569 ?auto_216570 ?auto_216566 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216632 - OBJ
      ?auto_216633 - OBJ
      ?auto_216634 - OBJ
      ?auto_216635 - OBJ
      ?auto_216636 - OBJ
      ?auto_216631 - LOCATION
    )
    :vars
    (
      ?auto_216639 - TRUCK
      ?auto_216638 - LOCATION
      ?auto_216637 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216636 ?auto_216639 ) ( TRUCK-AT ?auto_216639 ?auto_216638 ) ( IN-CITY ?auto_216638 ?auto_216637 ) ( IN-CITY ?auto_216631 ?auto_216637 ) ( not ( = ?auto_216631 ?auto_216638 ) ) ( OBJ-AT ?auto_216632 ?auto_216631 ) ( not ( = ?auto_216632 ?auto_216636 ) ) ( OBJ-AT ?auto_216633 ?auto_216631 ) ( OBJ-AT ?auto_216634 ?auto_216631 ) ( OBJ-AT ?auto_216635 ?auto_216631 ) ( not ( = ?auto_216632 ?auto_216633 ) ) ( not ( = ?auto_216632 ?auto_216634 ) ) ( not ( = ?auto_216632 ?auto_216635 ) ) ( not ( = ?auto_216633 ?auto_216634 ) ) ( not ( = ?auto_216633 ?auto_216635 ) ) ( not ( = ?auto_216633 ?auto_216636 ) ) ( not ( = ?auto_216634 ?auto_216635 ) ) ( not ( = ?auto_216634 ?auto_216636 ) ) ( not ( = ?auto_216635 ?auto_216636 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216632 ?auto_216636 ?auto_216631 )
      ( DELIVER-5PKG-VERIFY ?auto_216632 ?auto_216633 ?auto_216634 ?auto_216635 ?auto_216636 ?auto_216631 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216641 - OBJ
      ?auto_216642 - OBJ
      ?auto_216643 - OBJ
      ?auto_216644 - OBJ
      ?auto_216645 - OBJ
      ?auto_216640 - LOCATION
    )
    :vars
    (
      ?auto_216648 - TRUCK
      ?auto_216647 - LOCATION
      ?auto_216646 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216644 ?auto_216648 ) ( TRUCK-AT ?auto_216648 ?auto_216647 ) ( IN-CITY ?auto_216647 ?auto_216646 ) ( IN-CITY ?auto_216640 ?auto_216646 ) ( not ( = ?auto_216640 ?auto_216647 ) ) ( OBJ-AT ?auto_216641 ?auto_216640 ) ( not ( = ?auto_216641 ?auto_216644 ) ) ( OBJ-AT ?auto_216642 ?auto_216640 ) ( OBJ-AT ?auto_216643 ?auto_216640 ) ( OBJ-AT ?auto_216645 ?auto_216640 ) ( not ( = ?auto_216641 ?auto_216642 ) ) ( not ( = ?auto_216641 ?auto_216643 ) ) ( not ( = ?auto_216641 ?auto_216645 ) ) ( not ( = ?auto_216642 ?auto_216643 ) ) ( not ( = ?auto_216642 ?auto_216644 ) ) ( not ( = ?auto_216642 ?auto_216645 ) ) ( not ( = ?auto_216643 ?auto_216644 ) ) ( not ( = ?auto_216643 ?auto_216645 ) ) ( not ( = ?auto_216644 ?auto_216645 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216641 ?auto_216644 ?auto_216640 )
      ( DELIVER-5PKG-VERIFY ?auto_216641 ?auto_216642 ?auto_216643 ?auto_216644 ?auto_216645 ?auto_216640 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216659 - OBJ
      ?auto_216660 - OBJ
      ?auto_216661 - OBJ
      ?auto_216662 - OBJ
      ?auto_216663 - OBJ
      ?auto_216658 - LOCATION
    )
    :vars
    (
      ?auto_216666 - TRUCK
      ?auto_216665 - LOCATION
      ?auto_216664 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216661 ?auto_216666 ) ( TRUCK-AT ?auto_216666 ?auto_216665 ) ( IN-CITY ?auto_216665 ?auto_216664 ) ( IN-CITY ?auto_216658 ?auto_216664 ) ( not ( = ?auto_216658 ?auto_216665 ) ) ( OBJ-AT ?auto_216663 ?auto_216658 ) ( not ( = ?auto_216663 ?auto_216661 ) ) ( OBJ-AT ?auto_216659 ?auto_216658 ) ( OBJ-AT ?auto_216660 ?auto_216658 ) ( OBJ-AT ?auto_216662 ?auto_216658 ) ( not ( = ?auto_216659 ?auto_216660 ) ) ( not ( = ?auto_216659 ?auto_216661 ) ) ( not ( = ?auto_216659 ?auto_216662 ) ) ( not ( = ?auto_216659 ?auto_216663 ) ) ( not ( = ?auto_216660 ?auto_216661 ) ) ( not ( = ?auto_216660 ?auto_216662 ) ) ( not ( = ?auto_216660 ?auto_216663 ) ) ( not ( = ?auto_216661 ?auto_216662 ) ) ( not ( = ?auto_216662 ?auto_216663 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216663 ?auto_216661 ?auto_216658 )
      ( DELIVER-5PKG-VERIFY ?auto_216659 ?auto_216660 ?auto_216661 ?auto_216662 ?auto_216663 ?auto_216658 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216695 - OBJ
      ?auto_216696 - OBJ
      ?auto_216697 - OBJ
      ?auto_216698 - OBJ
      ?auto_216699 - OBJ
      ?auto_216694 - LOCATION
    )
    :vars
    (
      ?auto_216702 - TRUCK
      ?auto_216701 - LOCATION
      ?auto_216700 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216696 ?auto_216702 ) ( TRUCK-AT ?auto_216702 ?auto_216701 ) ( IN-CITY ?auto_216701 ?auto_216700 ) ( IN-CITY ?auto_216694 ?auto_216700 ) ( not ( = ?auto_216694 ?auto_216701 ) ) ( OBJ-AT ?auto_216699 ?auto_216694 ) ( not ( = ?auto_216699 ?auto_216696 ) ) ( OBJ-AT ?auto_216695 ?auto_216694 ) ( OBJ-AT ?auto_216697 ?auto_216694 ) ( OBJ-AT ?auto_216698 ?auto_216694 ) ( not ( = ?auto_216695 ?auto_216696 ) ) ( not ( = ?auto_216695 ?auto_216697 ) ) ( not ( = ?auto_216695 ?auto_216698 ) ) ( not ( = ?auto_216695 ?auto_216699 ) ) ( not ( = ?auto_216696 ?auto_216697 ) ) ( not ( = ?auto_216696 ?auto_216698 ) ) ( not ( = ?auto_216697 ?auto_216698 ) ) ( not ( = ?auto_216697 ?auto_216699 ) ) ( not ( = ?auto_216698 ?auto_216699 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216699 ?auto_216696 ?auto_216694 )
      ( DELIVER-5PKG-VERIFY ?auto_216695 ?auto_216696 ?auto_216697 ?auto_216698 ?auto_216699 ?auto_216694 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216767 - OBJ
      ?auto_216768 - OBJ
      ?auto_216769 - OBJ
      ?auto_216770 - OBJ
      ?auto_216771 - OBJ
      ?auto_216766 - LOCATION
    )
    :vars
    (
      ?auto_216774 - TRUCK
      ?auto_216773 - LOCATION
      ?auto_216772 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216767 ?auto_216774 ) ( TRUCK-AT ?auto_216774 ?auto_216773 ) ( IN-CITY ?auto_216773 ?auto_216772 ) ( IN-CITY ?auto_216766 ?auto_216772 ) ( not ( = ?auto_216766 ?auto_216773 ) ) ( OBJ-AT ?auto_216768 ?auto_216766 ) ( not ( = ?auto_216768 ?auto_216767 ) ) ( OBJ-AT ?auto_216769 ?auto_216766 ) ( OBJ-AT ?auto_216770 ?auto_216766 ) ( OBJ-AT ?auto_216771 ?auto_216766 ) ( not ( = ?auto_216767 ?auto_216769 ) ) ( not ( = ?auto_216767 ?auto_216770 ) ) ( not ( = ?auto_216767 ?auto_216771 ) ) ( not ( = ?auto_216768 ?auto_216769 ) ) ( not ( = ?auto_216768 ?auto_216770 ) ) ( not ( = ?auto_216768 ?auto_216771 ) ) ( not ( = ?auto_216769 ?auto_216770 ) ) ( not ( = ?auto_216769 ?auto_216771 ) ) ( not ( = ?auto_216770 ?auto_216771 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216768 ?auto_216767 ?auto_216766 )
      ( DELIVER-5PKG-VERIFY ?auto_216767 ?auto_216768 ?auto_216769 ?auto_216770 ?auto_216771 ?auto_216766 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_216912 - OBJ
      ?auto_216911 - LOCATION
    )
    :vars
    (
      ?auto_216915 - TRUCK
      ?auto_216914 - LOCATION
      ?auto_216913 - CITY
      ?auto_216916 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216915 ?auto_216914 ) ( IN-CITY ?auto_216914 ?auto_216913 ) ( IN-CITY ?auto_216911 ?auto_216913 ) ( not ( = ?auto_216911 ?auto_216914 ) ) ( OBJ-AT ?auto_216916 ?auto_216911 ) ( not ( = ?auto_216916 ?auto_216912 ) ) ( OBJ-AT ?auto_216912 ?auto_216914 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_216912 ?auto_216915 ?auto_216914 )
      ( DELIVER-2PKG ?auto_216916 ?auto_216912 ?auto_216911 )
      ( DELIVER-1PKG-VERIFY ?auto_216912 ?auto_216911 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216918 - OBJ
      ?auto_216919 - OBJ
      ?auto_216917 - LOCATION
    )
    :vars
    (
      ?auto_216920 - TRUCK
      ?auto_216921 - LOCATION
      ?auto_216922 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216920 ?auto_216921 ) ( IN-CITY ?auto_216921 ?auto_216922 ) ( IN-CITY ?auto_216917 ?auto_216922 ) ( not ( = ?auto_216917 ?auto_216921 ) ) ( OBJ-AT ?auto_216918 ?auto_216917 ) ( not ( = ?auto_216918 ?auto_216919 ) ) ( OBJ-AT ?auto_216919 ?auto_216921 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216919 ?auto_216917 )
      ( DELIVER-2PKG-VERIFY ?auto_216918 ?auto_216919 ?auto_216917 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216924 - OBJ
      ?auto_216925 - OBJ
      ?auto_216923 - LOCATION
    )
    :vars
    (
      ?auto_216926 - TRUCK
      ?auto_216927 - LOCATION
      ?auto_216928 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216926 ?auto_216927 ) ( IN-CITY ?auto_216927 ?auto_216928 ) ( IN-CITY ?auto_216923 ?auto_216928 ) ( not ( = ?auto_216923 ?auto_216927 ) ) ( OBJ-AT ?auto_216925 ?auto_216923 ) ( not ( = ?auto_216925 ?auto_216924 ) ) ( OBJ-AT ?auto_216924 ?auto_216927 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216925 ?auto_216924 ?auto_216923 )
      ( DELIVER-2PKG-VERIFY ?auto_216924 ?auto_216925 ?auto_216923 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216937 - OBJ
      ?auto_216938 - OBJ
      ?auto_216939 - OBJ
      ?auto_216936 - LOCATION
    )
    :vars
    (
      ?auto_216940 - TRUCK
      ?auto_216941 - LOCATION
      ?auto_216942 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216940 ?auto_216941 ) ( IN-CITY ?auto_216941 ?auto_216942 ) ( IN-CITY ?auto_216936 ?auto_216942 ) ( not ( = ?auto_216936 ?auto_216941 ) ) ( OBJ-AT ?auto_216938 ?auto_216936 ) ( not ( = ?auto_216938 ?auto_216939 ) ) ( OBJ-AT ?auto_216939 ?auto_216941 ) ( OBJ-AT ?auto_216937 ?auto_216936 ) ( not ( = ?auto_216937 ?auto_216938 ) ) ( not ( = ?auto_216937 ?auto_216939 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216938 ?auto_216939 ?auto_216936 )
      ( DELIVER-3PKG-VERIFY ?auto_216937 ?auto_216938 ?auto_216939 ?auto_216936 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216944 - OBJ
      ?auto_216945 - OBJ
      ?auto_216946 - OBJ
      ?auto_216943 - LOCATION
    )
    :vars
    (
      ?auto_216947 - TRUCK
      ?auto_216948 - LOCATION
      ?auto_216949 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216947 ?auto_216948 ) ( IN-CITY ?auto_216948 ?auto_216949 ) ( IN-CITY ?auto_216943 ?auto_216949 ) ( not ( = ?auto_216943 ?auto_216948 ) ) ( OBJ-AT ?auto_216946 ?auto_216943 ) ( not ( = ?auto_216946 ?auto_216945 ) ) ( OBJ-AT ?auto_216945 ?auto_216948 ) ( OBJ-AT ?auto_216944 ?auto_216943 ) ( not ( = ?auto_216944 ?auto_216945 ) ) ( not ( = ?auto_216944 ?auto_216946 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216946 ?auto_216945 ?auto_216943 )
      ( DELIVER-3PKG-VERIFY ?auto_216944 ?auto_216945 ?auto_216946 ?auto_216943 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216958 - OBJ
      ?auto_216959 - OBJ
      ?auto_216960 - OBJ
      ?auto_216957 - LOCATION
    )
    :vars
    (
      ?auto_216961 - TRUCK
      ?auto_216962 - LOCATION
      ?auto_216963 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216961 ?auto_216962 ) ( IN-CITY ?auto_216962 ?auto_216963 ) ( IN-CITY ?auto_216957 ?auto_216963 ) ( not ( = ?auto_216957 ?auto_216962 ) ) ( OBJ-AT ?auto_216960 ?auto_216957 ) ( not ( = ?auto_216960 ?auto_216958 ) ) ( OBJ-AT ?auto_216958 ?auto_216962 ) ( OBJ-AT ?auto_216959 ?auto_216957 ) ( not ( = ?auto_216958 ?auto_216959 ) ) ( not ( = ?auto_216959 ?auto_216960 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216960 ?auto_216958 ?auto_216957 )
      ( DELIVER-3PKG-VERIFY ?auto_216958 ?auto_216959 ?auto_216960 ?auto_216957 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216987 - OBJ
      ?auto_216988 - OBJ
      ?auto_216989 - OBJ
      ?auto_216990 - OBJ
      ?auto_216986 - LOCATION
    )
    :vars
    (
      ?auto_216991 - TRUCK
      ?auto_216992 - LOCATION
      ?auto_216993 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216991 ?auto_216992 ) ( IN-CITY ?auto_216992 ?auto_216993 ) ( IN-CITY ?auto_216986 ?auto_216993 ) ( not ( = ?auto_216986 ?auto_216992 ) ) ( OBJ-AT ?auto_216989 ?auto_216986 ) ( not ( = ?auto_216989 ?auto_216990 ) ) ( OBJ-AT ?auto_216990 ?auto_216992 ) ( OBJ-AT ?auto_216987 ?auto_216986 ) ( OBJ-AT ?auto_216988 ?auto_216986 ) ( not ( = ?auto_216987 ?auto_216988 ) ) ( not ( = ?auto_216987 ?auto_216989 ) ) ( not ( = ?auto_216987 ?auto_216990 ) ) ( not ( = ?auto_216988 ?auto_216989 ) ) ( not ( = ?auto_216988 ?auto_216990 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216989 ?auto_216990 ?auto_216986 )
      ( DELIVER-4PKG-VERIFY ?auto_216987 ?auto_216988 ?auto_216989 ?auto_216990 ?auto_216986 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216995 - OBJ
      ?auto_216996 - OBJ
      ?auto_216997 - OBJ
      ?auto_216998 - OBJ
      ?auto_216994 - LOCATION
    )
    :vars
    (
      ?auto_216999 - TRUCK
      ?auto_217000 - LOCATION
      ?auto_217001 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216999 ?auto_217000 ) ( IN-CITY ?auto_217000 ?auto_217001 ) ( IN-CITY ?auto_216994 ?auto_217001 ) ( not ( = ?auto_216994 ?auto_217000 ) ) ( OBJ-AT ?auto_216995 ?auto_216994 ) ( not ( = ?auto_216995 ?auto_216997 ) ) ( OBJ-AT ?auto_216997 ?auto_217000 ) ( OBJ-AT ?auto_216996 ?auto_216994 ) ( OBJ-AT ?auto_216998 ?auto_216994 ) ( not ( = ?auto_216995 ?auto_216996 ) ) ( not ( = ?auto_216995 ?auto_216998 ) ) ( not ( = ?auto_216996 ?auto_216997 ) ) ( not ( = ?auto_216996 ?auto_216998 ) ) ( not ( = ?auto_216997 ?auto_216998 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216995 ?auto_216997 ?auto_216994 )
      ( DELIVER-4PKG-VERIFY ?auto_216995 ?auto_216996 ?auto_216997 ?auto_216998 ?auto_216994 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217011 - OBJ
      ?auto_217012 - OBJ
      ?auto_217013 - OBJ
      ?auto_217014 - OBJ
      ?auto_217010 - LOCATION
    )
    :vars
    (
      ?auto_217015 - TRUCK
      ?auto_217016 - LOCATION
      ?auto_217017 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217015 ?auto_217016 ) ( IN-CITY ?auto_217016 ?auto_217017 ) ( IN-CITY ?auto_217010 ?auto_217017 ) ( not ( = ?auto_217010 ?auto_217016 ) ) ( OBJ-AT ?auto_217014 ?auto_217010 ) ( not ( = ?auto_217014 ?auto_217012 ) ) ( OBJ-AT ?auto_217012 ?auto_217016 ) ( OBJ-AT ?auto_217011 ?auto_217010 ) ( OBJ-AT ?auto_217013 ?auto_217010 ) ( not ( = ?auto_217011 ?auto_217012 ) ) ( not ( = ?auto_217011 ?auto_217013 ) ) ( not ( = ?auto_217011 ?auto_217014 ) ) ( not ( = ?auto_217012 ?auto_217013 ) ) ( not ( = ?auto_217013 ?auto_217014 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217014 ?auto_217012 ?auto_217010 )
      ( DELIVER-4PKG-VERIFY ?auto_217011 ?auto_217012 ?auto_217013 ?auto_217014 ?auto_217010 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217043 - OBJ
      ?auto_217044 - OBJ
      ?auto_217045 - OBJ
      ?auto_217046 - OBJ
      ?auto_217042 - LOCATION
    )
    :vars
    (
      ?auto_217047 - TRUCK
      ?auto_217048 - LOCATION
      ?auto_217049 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217047 ?auto_217048 ) ( IN-CITY ?auto_217048 ?auto_217049 ) ( IN-CITY ?auto_217042 ?auto_217049 ) ( not ( = ?auto_217042 ?auto_217048 ) ) ( OBJ-AT ?auto_217044 ?auto_217042 ) ( not ( = ?auto_217044 ?auto_217043 ) ) ( OBJ-AT ?auto_217043 ?auto_217048 ) ( OBJ-AT ?auto_217045 ?auto_217042 ) ( OBJ-AT ?auto_217046 ?auto_217042 ) ( not ( = ?auto_217043 ?auto_217045 ) ) ( not ( = ?auto_217043 ?auto_217046 ) ) ( not ( = ?auto_217044 ?auto_217045 ) ) ( not ( = ?auto_217044 ?auto_217046 ) ) ( not ( = ?auto_217045 ?auto_217046 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217044 ?auto_217043 ?auto_217042 )
      ( DELIVER-4PKG-VERIFY ?auto_217043 ?auto_217044 ?auto_217045 ?auto_217046 ?auto_217042 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217108 - OBJ
      ?auto_217109 - OBJ
      ?auto_217110 - OBJ
      ?auto_217111 - OBJ
      ?auto_217112 - OBJ
      ?auto_217107 - LOCATION
    )
    :vars
    (
      ?auto_217113 - TRUCK
      ?auto_217114 - LOCATION
      ?auto_217115 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217113 ?auto_217114 ) ( IN-CITY ?auto_217114 ?auto_217115 ) ( IN-CITY ?auto_217107 ?auto_217115 ) ( not ( = ?auto_217107 ?auto_217114 ) ) ( OBJ-AT ?auto_217108 ?auto_217107 ) ( not ( = ?auto_217108 ?auto_217112 ) ) ( OBJ-AT ?auto_217112 ?auto_217114 ) ( OBJ-AT ?auto_217109 ?auto_217107 ) ( OBJ-AT ?auto_217110 ?auto_217107 ) ( OBJ-AT ?auto_217111 ?auto_217107 ) ( not ( = ?auto_217108 ?auto_217109 ) ) ( not ( = ?auto_217108 ?auto_217110 ) ) ( not ( = ?auto_217108 ?auto_217111 ) ) ( not ( = ?auto_217109 ?auto_217110 ) ) ( not ( = ?auto_217109 ?auto_217111 ) ) ( not ( = ?auto_217109 ?auto_217112 ) ) ( not ( = ?auto_217110 ?auto_217111 ) ) ( not ( = ?auto_217110 ?auto_217112 ) ) ( not ( = ?auto_217111 ?auto_217112 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217108 ?auto_217112 ?auto_217107 )
      ( DELIVER-5PKG-VERIFY ?auto_217108 ?auto_217109 ?auto_217110 ?auto_217111 ?auto_217112 ?auto_217107 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217117 - OBJ
      ?auto_217118 - OBJ
      ?auto_217119 - OBJ
      ?auto_217120 - OBJ
      ?auto_217121 - OBJ
      ?auto_217116 - LOCATION
    )
    :vars
    (
      ?auto_217122 - TRUCK
      ?auto_217123 - LOCATION
      ?auto_217124 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217122 ?auto_217123 ) ( IN-CITY ?auto_217123 ?auto_217124 ) ( IN-CITY ?auto_217116 ?auto_217124 ) ( not ( = ?auto_217116 ?auto_217123 ) ) ( OBJ-AT ?auto_217119 ?auto_217116 ) ( not ( = ?auto_217119 ?auto_217120 ) ) ( OBJ-AT ?auto_217120 ?auto_217123 ) ( OBJ-AT ?auto_217117 ?auto_217116 ) ( OBJ-AT ?auto_217118 ?auto_217116 ) ( OBJ-AT ?auto_217121 ?auto_217116 ) ( not ( = ?auto_217117 ?auto_217118 ) ) ( not ( = ?auto_217117 ?auto_217119 ) ) ( not ( = ?auto_217117 ?auto_217120 ) ) ( not ( = ?auto_217117 ?auto_217121 ) ) ( not ( = ?auto_217118 ?auto_217119 ) ) ( not ( = ?auto_217118 ?auto_217120 ) ) ( not ( = ?auto_217118 ?auto_217121 ) ) ( not ( = ?auto_217119 ?auto_217121 ) ) ( not ( = ?auto_217120 ?auto_217121 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217119 ?auto_217120 ?auto_217116 )
      ( DELIVER-5PKG-VERIFY ?auto_217117 ?auto_217118 ?auto_217119 ?auto_217120 ?auto_217121 ?auto_217116 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217135 - OBJ
      ?auto_217136 - OBJ
      ?auto_217137 - OBJ
      ?auto_217138 - OBJ
      ?auto_217139 - OBJ
      ?auto_217134 - LOCATION
    )
    :vars
    (
      ?auto_217140 - TRUCK
      ?auto_217141 - LOCATION
      ?auto_217142 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217140 ?auto_217141 ) ( IN-CITY ?auto_217141 ?auto_217142 ) ( IN-CITY ?auto_217134 ?auto_217142 ) ( not ( = ?auto_217134 ?auto_217141 ) ) ( OBJ-AT ?auto_217135 ?auto_217134 ) ( not ( = ?auto_217135 ?auto_217137 ) ) ( OBJ-AT ?auto_217137 ?auto_217141 ) ( OBJ-AT ?auto_217136 ?auto_217134 ) ( OBJ-AT ?auto_217138 ?auto_217134 ) ( OBJ-AT ?auto_217139 ?auto_217134 ) ( not ( = ?auto_217135 ?auto_217136 ) ) ( not ( = ?auto_217135 ?auto_217138 ) ) ( not ( = ?auto_217135 ?auto_217139 ) ) ( not ( = ?auto_217136 ?auto_217137 ) ) ( not ( = ?auto_217136 ?auto_217138 ) ) ( not ( = ?auto_217136 ?auto_217139 ) ) ( not ( = ?auto_217137 ?auto_217138 ) ) ( not ( = ?auto_217137 ?auto_217139 ) ) ( not ( = ?auto_217138 ?auto_217139 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217135 ?auto_217137 ?auto_217134 )
      ( DELIVER-5PKG-VERIFY ?auto_217135 ?auto_217136 ?auto_217137 ?auto_217138 ?auto_217139 ?auto_217134 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217171 - OBJ
      ?auto_217172 - OBJ
      ?auto_217173 - OBJ
      ?auto_217174 - OBJ
      ?auto_217175 - OBJ
      ?auto_217170 - LOCATION
    )
    :vars
    (
      ?auto_217176 - TRUCK
      ?auto_217177 - LOCATION
      ?auto_217178 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217176 ?auto_217177 ) ( IN-CITY ?auto_217177 ?auto_217178 ) ( IN-CITY ?auto_217170 ?auto_217178 ) ( not ( = ?auto_217170 ?auto_217177 ) ) ( OBJ-AT ?auto_217171 ?auto_217170 ) ( not ( = ?auto_217171 ?auto_217172 ) ) ( OBJ-AT ?auto_217172 ?auto_217177 ) ( OBJ-AT ?auto_217173 ?auto_217170 ) ( OBJ-AT ?auto_217174 ?auto_217170 ) ( OBJ-AT ?auto_217175 ?auto_217170 ) ( not ( = ?auto_217171 ?auto_217173 ) ) ( not ( = ?auto_217171 ?auto_217174 ) ) ( not ( = ?auto_217171 ?auto_217175 ) ) ( not ( = ?auto_217172 ?auto_217173 ) ) ( not ( = ?auto_217172 ?auto_217174 ) ) ( not ( = ?auto_217172 ?auto_217175 ) ) ( not ( = ?auto_217173 ?auto_217174 ) ) ( not ( = ?auto_217173 ?auto_217175 ) ) ( not ( = ?auto_217174 ?auto_217175 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217171 ?auto_217172 ?auto_217170 )
      ( DELIVER-5PKG-VERIFY ?auto_217171 ?auto_217172 ?auto_217173 ?auto_217174 ?auto_217175 ?auto_217170 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217243 - OBJ
      ?auto_217244 - OBJ
      ?auto_217245 - OBJ
      ?auto_217246 - OBJ
      ?auto_217247 - OBJ
      ?auto_217242 - LOCATION
    )
    :vars
    (
      ?auto_217248 - TRUCK
      ?auto_217249 - LOCATION
      ?auto_217250 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217248 ?auto_217249 ) ( IN-CITY ?auto_217249 ?auto_217250 ) ( IN-CITY ?auto_217242 ?auto_217250 ) ( not ( = ?auto_217242 ?auto_217249 ) ) ( OBJ-AT ?auto_217247 ?auto_217242 ) ( not ( = ?auto_217247 ?auto_217243 ) ) ( OBJ-AT ?auto_217243 ?auto_217249 ) ( OBJ-AT ?auto_217244 ?auto_217242 ) ( OBJ-AT ?auto_217245 ?auto_217242 ) ( OBJ-AT ?auto_217246 ?auto_217242 ) ( not ( = ?auto_217243 ?auto_217244 ) ) ( not ( = ?auto_217243 ?auto_217245 ) ) ( not ( = ?auto_217243 ?auto_217246 ) ) ( not ( = ?auto_217244 ?auto_217245 ) ) ( not ( = ?auto_217244 ?auto_217246 ) ) ( not ( = ?auto_217244 ?auto_217247 ) ) ( not ( = ?auto_217245 ?auto_217246 ) ) ( not ( = ?auto_217245 ?auto_217247 ) ) ( not ( = ?auto_217246 ?auto_217247 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217247 ?auto_217243 ?auto_217242 )
      ( DELIVER-5PKG-VERIFY ?auto_217243 ?auto_217244 ?auto_217245 ?auto_217246 ?auto_217247 ?auto_217242 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_217388 - OBJ
      ?auto_217387 - LOCATION
    )
    :vars
    (
      ?auto_217391 - LOCATION
      ?auto_217392 - CITY
      ?auto_217390 - OBJ
      ?auto_217389 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217391 ?auto_217392 ) ( IN-CITY ?auto_217387 ?auto_217392 ) ( not ( = ?auto_217387 ?auto_217391 ) ) ( OBJ-AT ?auto_217390 ?auto_217387 ) ( not ( = ?auto_217390 ?auto_217388 ) ) ( OBJ-AT ?auto_217388 ?auto_217391 ) ( TRUCK-AT ?auto_217389 ?auto_217387 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_217389 ?auto_217387 ?auto_217391 ?auto_217392 )
      ( DELIVER-2PKG ?auto_217390 ?auto_217388 ?auto_217387 )
      ( DELIVER-1PKG-VERIFY ?auto_217388 ?auto_217387 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217394 - OBJ
      ?auto_217395 - OBJ
      ?auto_217393 - LOCATION
    )
    :vars
    (
      ?auto_217396 - LOCATION
      ?auto_217397 - CITY
      ?auto_217398 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217396 ?auto_217397 ) ( IN-CITY ?auto_217393 ?auto_217397 ) ( not ( = ?auto_217393 ?auto_217396 ) ) ( OBJ-AT ?auto_217394 ?auto_217393 ) ( not ( = ?auto_217394 ?auto_217395 ) ) ( OBJ-AT ?auto_217395 ?auto_217396 ) ( TRUCK-AT ?auto_217398 ?auto_217393 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_217395 ?auto_217393 )
      ( DELIVER-2PKG-VERIFY ?auto_217394 ?auto_217395 ?auto_217393 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217400 - OBJ
      ?auto_217401 - OBJ
      ?auto_217399 - LOCATION
    )
    :vars
    (
      ?auto_217402 - LOCATION
      ?auto_217404 - CITY
      ?auto_217403 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217402 ?auto_217404 ) ( IN-CITY ?auto_217399 ?auto_217404 ) ( not ( = ?auto_217399 ?auto_217402 ) ) ( OBJ-AT ?auto_217401 ?auto_217399 ) ( not ( = ?auto_217401 ?auto_217400 ) ) ( OBJ-AT ?auto_217400 ?auto_217402 ) ( TRUCK-AT ?auto_217403 ?auto_217399 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217401 ?auto_217400 ?auto_217399 )
      ( DELIVER-2PKG-VERIFY ?auto_217400 ?auto_217401 ?auto_217399 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_217413 - OBJ
      ?auto_217414 - OBJ
      ?auto_217415 - OBJ
      ?auto_217412 - LOCATION
    )
    :vars
    (
      ?auto_217416 - LOCATION
      ?auto_217418 - CITY
      ?auto_217417 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217416 ?auto_217418 ) ( IN-CITY ?auto_217412 ?auto_217418 ) ( not ( = ?auto_217412 ?auto_217416 ) ) ( OBJ-AT ?auto_217414 ?auto_217412 ) ( not ( = ?auto_217414 ?auto_217415 ) ) ( OBJ-AT ?auto_217415 ?auto_217416 ) ( TRUCK-AT ?auto_217417 ?auto_217412 ) ( OBJ-AT ?auto_217413 ?auto_217412 ) ( not ( = ?auto_217413 ?auto_217414 ) ) ( not ( = ?auto_217413 ?auto_217415 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217414 ?auto_217415 ?auto_217412 )
      ( DELIVER-3PKG-VERIFY ?auto_217413 ?auto_217414 ?auto_217415 ?auto_217412 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_217420 - OBJ
      ?auto_217421 - OBJ
      ?auto_217422 - OBJ
      ?auto_217419 - LOCATION
    )
    :vars
    (
      ?auto_217423 - LOCATION
      ?auto_217425 - CITY
      ?auto_217424 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217423 ?auto_217425 ) ( IN-CITY ?auto_217419 ?auto_217425 ) ( not ( = ?auto_217419 ?auto_217423 ) ) ( OBJ-AT ?auto_217420 ?auto_217419 ) ( not ( = ?auto_217420 ?auto_217421 ) ) ( OBJ-AT ?auto_217421 ?auto_217423 ) ( TRUCK-AT ?auto_217424 ?auto_217419 ) ( OBJ-AT ?auto_217422 ?auto_217419 ) ( not ( = ?auto_217420 ?auto_217422 ) ) ( not ( = ?auto_217421 ?auto_217422 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217420 ?auto_217421 ?auto_217419 )
      ( DELIVER-3PKG-VERIFY ?auto_217420 ?auto_217421 ?auto_217422 ?auto_217419 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_217434 - OBJ
      ?auto_217435 - OBJ
      ?auto_217436 - OBJ
      ?auto_217433 - LOCATION
    )
    :vars
    (
      ?auto_217437 - LOCATION
      ?auto_217439 - CITY
      ?auto_217438 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217437 ?auto_217439 ) ( IN-CITY ?auto_217433 ?auto_217439 ) ( not ( = ?auto_217433 ?auto_217437 ) ) ( OBJ-AT ?auto_217435 ?auto_217433 ) ( not ( = ?auto_217435 ?auto_217434 ) ) ( OBJ-AT ?auto_217434 ?auto_217437 ) ( TRUCK-AT ?auto_217438 ?auto_217433 ) ( OBJ-AT ?auto_217436 ?auto_217433 ) ( not ( = ?auto_217434 ?auto_217436 ) ) ( not ( = ?auto_217435 ?auto_217436 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217435 ?auto_217434 ?auto_217433 )
      ( DELIVER-3PKG-VERIFY ?auto_217434 ?auto_217435 ?auto_217436 ?auto_217433 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217463 - OBJ
      ?auto_217464 - OBJ
      ?auto_217465 - OBJ
      ?auto_217466 - OBJ
      ?auto_217462 - LOCATION
    )
    :vars
    (
      ?auto_217467 - LOCATION
      ?auto_217469 - CITY
      ?auto_217468 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217467 ?auto_217469 ) ( IN-CITY ?auto_217462 ?auto_217469 ) ( not ( = ?auto_217462 ?auto_217467 ) ) ( OBJ-AT ?auto_217464 ?auto_217462 ) ( not ( = ?auto_217464 ?auto_217466 ) ) ( OBJ-AT ?auto_217466 ?auto_217467 ) ( TRUCK-AT ?auto_217468 ?auto_217462 ) ( OBJ-AT ?auto_217463 ?auto_217462 ) ( OBJ-AT ?auto_217465 ?auto_217462 ) ( not ( = ?auto_217463 ?auto_217464 ) ) ( not ( = ?auto_217463 ?auto_217465 ) ) ( not ( = ?auto_217463 ?auto_217466 ) ) ( not ( = ?auto_217464 ?auto_217465 ) ) ( not ( = ?auto_217465 ?auto_217466 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217464 ?auto_217466 ?auto_217462 )
      ( DELIVER-4PKG-VERIFY ?auto_217463 ?auto_217464 ?auto_217465 ?auto_217466 ?auto_217462 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217471 - OBJ
      ?auto_217472 - OBJ
      ?auto_217473 - OBJ
      ?auto_217474 - OBJ
      ?auto_217470 - LOCATION
    )
    :vars
    (
      ?auto_217475 - LOCATION
      ?auto_217477 - CITY
      ?auto_217476 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217475 ?auto_217477 ) ( IN-CITY ?auto_217470 ?auto_217477 ) ( not ( = ?auto_217470 ?auto_217475 ) ) ( OBJ-AT ?auto_217474 ?auto_217470 ) ( not ( = ?auto_217474 ?auto_217473 ) ) ( OBJ-AT ?auto_217473 ?auto_217475 ) ( TRUCK-AT ?auto_217476 ?auto_217470 ) ( OBJ-AT ?auto_217471 ?auto_217470 ) ( OBJ-AT ?auto_217472 ?auto_217470 ) ( not ( = ?auto_217471 ?auto_217472 ) ) ( not ( = ?auto_217471 ?auto_217473 ) ) ( not ( = ?auto_217471 ?auto_217474 ) ) ( not ( = ?auto_217472 ?auto_217473 ) ) ( not ( = ?auto_217472 ?auto_217474 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217474 ?auto_217473 ?auto_217470 )
      ( DELIVER-4PKG-VERIFY ?auto_217471 ?auto_217472 ?auto_217473 ?auto_217474 ?auto_217470 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217487 - OBJ
      ?auto_217488 - OBJ
      ?auto_217489 - OBJ
      ?auto_217490 - OBJ
      ?auto_217486 - LOCATION
    )
    :vars
    (
      ?auto_217491 - LOCATION
      ?auto_217493 - CITY
      ?auto_217492 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217491 ?auto_217493 ) ( IN-CITY ?auto_217486 ?auto_217493 ) ( not ( = ?auto_217486 ?auto_217491 ) ) ( OBJ-AT ?auto_217489 ?auto_217486 ) ( not ( = ?auto_217489 ?auto_217488 ) ) ( OBJ-AT ?auto_217488 ?auto_217491 ) ( TRUCK-AT ?auto_217492 ?auto_217486 ) ( OBJ-AT ?auto_217487 ?auto_217486 ) ( OBJ-AT ?auto_217490 ?auto_217486 ) ( not ( = ?auto_217487 ?auto_217488 ) ) ( not ( = ?auto_217487 ?auto_217489 ) ) ( not ( = ?auto_217487 ?auto_217490 ) ) ( not ( = ?auto_217488 ?auto_217490 ) ) ( not ( = ?auto_217489 ?auto_217490 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217489 ?auto_217488 ?auto_217486 )
      ( DELIVER-4PKG-VERIFY ?auto_217487 ?auto_217488 ?auto_217489 ?auto_217490 ?auto_217486 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217519 - OBJ
      ?auto_217520 - OBJ
      ?auto_217521 - OBJ
      ?auto_217522 - OBJ
      ?auto_217518 - LOCATION
    )
    :vars
    (
      ?auto_217523 - LOCATION
      ?auto_217525 - CITY
      ?auto_217524 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217523 ?auto_217525 ) ( IN-CITY ?auto_217518 ?auto_217525 ) ( not ( = ?auto_217518 ?auto_217523 ) ) ( OBJ-AT ?auto_217522 ?auto_217518 ) ( not ( = ?auto_217522 ?auto_217519 ) ) ( OBJ-AT ?auto_217519 ?auto_217523 ) ( TRUCK-AT ?auto_217524 ?auto_217518 ) ( OBJ-AT ?auto_217520 ?auto_217518 ) ( OBJ-AT ?auto_217521 ?auto_217518 ) ( not ( = ?auto_217519 ?auto_217520 ) ) ( not ( = ?auto_217519 ?auto_217521 ) ) ( not ( = ?auto_217520 ?auto_217521 ) ) ( not ( = ?auto_217520 ?auto_217522 ) ) ( not ( = ?auto_217521 ?auto_217522 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217522 ?auto_217519 ?auto_217518 )
      ( DELIVER-4PKG-VERIFY ?auto_217519 ?auto_217520 ?auto_217521 ?auto_217522 ?auto_217518 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217584 - OBJ
      ?auto_217585 - OBJ
      ?auto_217586 - OBJ
      ?auto_217587 - OBJ
      ?auto_217588 - OBJ
      ?auto_217583 - LOCATION
    )
    :vars
    (
      ?auto_217589 - LOCATION
      ?auto_217591 - CITY
      ?auto_217590 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217589 ?auto_217591 ) ( IN-CITY ?auto_217583 ?auto_217591 ) ( not ( = ?auto_217583 ?auto_217589 ) ) ( OBJ-AT ?auto_217587 ?auto_217583 ) ( not ( = ?auto_217587 ?auto_217588 ) ) ( OBJ-AT ?auto_217588 ?auto_217589 ) ( TRUCK-AT ?auto_217590 ?auto_217583 ) ( OBJ-AT ?auto_217584 ?auto_217583 ) ( OBJ-AT ?auto_217585 ?auto_217583 ) ( OBJ-AT ?auto_217586 ?auto_217583 ) ( not ( = ?auto_217584 ?auto_217585 ) ) ( not ( = ?auto_217584 ?auto_217586 ) ) ( not ( = ?auto_217584 ?auto_217587 ) ) ( not ( = ?auto_217584 ?auto_217588 ) ) ( not ( = ?auto_217585 ?auto_217586 ) ) ( not ( = ?auto_217585 ?auto_217587 ) ) ( not ( = ?auto_217585 ?auto_217588 ) ) ( not ( = ?auto_217586 ?auto_217587 ) ) ( not ( = ?auto_217586 ?auto_217588 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217587 ?auto_217588 ?auto_217583 )
      ( DELIVER-5PKG-VERIFY ?auto_217584 ?auto_217585 ?auto_217586 ?auto_217587 ?auto_217588 ?auto_217583 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217593 - OBJ
      ?auto_217594 - OBJ
      ?auto_217595 - OBJ
      ?auto_217596 - OBJ
      ?auto_217597 - OBJ
      ?auto_217592 - LOCATION
    )
    :vars
    (
      ?auto_217598 - LOCATION
      ?auto_217600 - CITY
      ?auto_217599 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217598 ?auto_217600 ) ( IN-CITY ?auto_217592 ?auto_217600 ) ( not ( = ?auto_217592 ?auto_217598 ) ) ( OBJ-AT ?auto_217597 ?auto_217592 ) ( not ( = ?auto_217597 ?auto_217596 ) ) ( OBJ-AT ?auto_217596 ?auto_217598 ) ( TRUCK-AT ?auto_217599 ?auto_217592 ) ( OBJ-AT ?auto_217593 ?auto_217592 ) ( OBJ-AT ?auto_217594 ?auto_217592 ) ( OBJ-AT ?auto_217595 ?auto_217592 ) ( not ( = ?auto_217593 ?auto_217594 ) ) ( not ( = ?auto_217593 ?auto_217595 ) ) ( not ( = ?auto_217593 ?auto_217596 ) ) ( not ( = ?auto_217593 ?auto_217597 ) ) ( not ( = ?auto_217594 ?auto_217595 ) ) ( not ( = ?auto_217594 ?auto_217596 ) ) ( not ( = ?auto_217594 ?auto_217597 ) ) ( not ( = ?auto_217595 ?auto_217596 ) ) ( not ( = ?auto_217595 ?auto_217597 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217597 ?auto_217596 ?auto_217592 )
      ( DELIVER-5PKG-VERIFY ?auto_217593 ?auto_217594 ?auto_217595 ?auto_217596 ?auto_217597 ?auto_217592 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217611 - OBJ
      ?auto_217612 - OBJ
      ?auto_217613 - OBJ
      ?auto_217614 - OBJ
      ?auto_217615 - OBJ
      ?auto_217610 - LOCATION
    )
    :vars
    (
      ?auto_217616 - LOCATION
      ?auto_217618 - CITY
      ?auto_217617 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217616 ?auto_217618 ) ( IN-CITY ?auto_217610 ?auto_217618 ) ( not ( = ?auto_217610 ?auto_217616 ) ) ( OBJ-AT ?auto_217611 ?auto_217610 ) ( not ( = ?auto_217611 ?auto_217613 ) ) ( OBJ-AT ?auto_217613 ?auto_217616 ) ( TRUCK-AT ?auto_217617 ?auto_217610 ) ( OBJ-AT ?auto_217612 ?auto_217610 ) ( OBJ-AT ?auto_217614 ?auto_217610 ) ( OBJ-AT ?auto_217615 ?auto_217610 ) ( not ( = ?auto_217611 ?auto_217612 ) ) ( not ( = ?auto_217611 ?auto_217614 ) ) ( not ( = ?auto_217611 ?auto_217615 ) ) ( not ( = ?auto_217612 ?auto_217613 ) ) ( not ( = ?auto_217612 ?auto_217614 ) ) ( not ( = ?auto_217612 ?auto_217615 ) ) ( not ( = ?auto_217613 ?auto_217614 ) ) ( not ( = ?auto_217613 ?auto_217615 ) ) ( not ( = ?auto_217614 ?auto_217615 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217611 ?auto_217613 ?auto_217610 )
      ( DELIVER-5PKG-VERIFY ?auto_217611 ?auto_217612 ?auto_217613 ?auto_217614 ?auto_217615 ?auto_217610 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217647 - OBJ
      ?auto_217648 - OBJ
      ?auto_217649 - OBJ
      ?auto_217650 - OBJ
      ?auto_217651 - OBJ
      ?auto_217646 - LOCATION
    )
    :vars
    (
      ?auto_217652 - LOCATION
      ?auto_217654 - CITY
      ?auto_217653 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217652 ?auto_217654 ) ( IN-CITY ?auto_217646 ?auto_217654 ) ( not ( = ?auto_217646 ?auto_217652 ) ) ( OBJ-AT ?auto_217651 ?auto_217646 ) ( not ( = ?auto_217651 ?auto_217648 ) ) ( OBJ-AT ?auto_217648 ?auto_217652 ) ( TRUCK-AT ?auto_217653 ?auto_217646 ) ( OBJ-AT ?auto_217647 ?auto_217646 ) ( OBJ-AT ?auto_217649 ?auto_217646 ) ( OBJ-AT ?auto_217650 ?auto_217646 ) ( not ( = ?auto_217647 ?auto_217648 ) ) ( not ( = ?auto_217647 ?auto_217649 ) ) ( not ( = ?auto_217647 ?auto_217650 ) ) ( not ( = ?auto_217647 ?auto_217651 ) ) ( not ( = ?auto_217648 ?auto_217649 ) ) ( not ( = ?auto_217648 ?auto_217650 ) ) ( not ( = ?auto_217649 ?auto_217650 ) ) ( not ( = ?auto_217649 ?auto_217651 ) ) ( not ( = ?auto_217650 ?auto_217651 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217651 ?auto_217648 ?auto_217646 )
      ( DELIVER-5PKG-VERIFY ?auto_217647 ?auto_217648 ?auto_217649 ?auto_217650 ?auto_217651 ?auto_217646 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217719 - OBJ
      ?auto_217720 - OBJ
      ?auto_217721 - OBJ
      ?auto_217722 - OBJ
      ?auto_217723 - OBJ
      ?auto_217718 - LOCATION
    )
    :vars
    (
      ?auto_217724 - LOCATION
      ?auto_217726 - CITY
      ?auto_217725 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217724 ?auto_217726 ) ( IN-CITY ?auto_217718 ?auto_217726 ) ( not ( = ?auto_217718 ?auto_217724 ) ) ( OBJ-AT ?auto_217723 ?auto_217718 ) ( not ( = ?auto_217723 ?auto_217719 ) ) ( OBJ-AT ?auto_217719 ?auto_217724 ) ( TRUCK-AT ?auto_217725 ?auto_217718 ) ( OBJ-AT ?auto_217720 ?auto_217718 ) ( OBJ-AT ?auto_217721 ?auto_217718 ) ( OBJ-AT ?auto_217722 ?auto_217718 ) ( not ( = ?auto_217719 ?auto_217720 ) ) ( not ( = ?auto_217719 ?auto_217721 ) ) ( not ( = ?auto_217719 ?auto_217722 ) ) ( not ( = ?auto_217720 ?auto_217721 ) ) ( not ( = ?auto_217720 ?auto_217722 ) ) ( not ( = ?auto_217720 ?auto_217723 ) ) ( not ( = ?auto_217721 ?auto_217722 ) ) ( not ( = ?auto_217721 ?auto_217723 ) ) ( not ( = ?auto_217722 ?auto_217723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217723 ?auto_217719 ?auto_217718 )
      ( DELIVER-5PKG-VERIFY ?auto_217719 ?auto_217720 ?auto_217721 ?auto_217722 ?auto_217723 ?auto_217718 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_217864 - OBJ
      ?auto_217863 - LOCATION
    )
    :vars
    (
      ?auto_217865 - LOCATION
      ?auto_217867 - CITY
      ?auto_217868 - OBJ
      ?auto_217866 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217865 ?auto_217867 ) ( IN-CITY ?auto_217863 ?auto_217867 ) ( not ( = ?auto_217863 ?auto_217865 ) ) ( not ( = ?auto_217868 ?auto_217864 ) ) ( OBJ-AT ?auto_217864 ?auto_217865 ) ( TRUCK-AT ?auto_217866 ?auto_217863 ) ( IN-TRUCK ?auto_217868 ?auto_217866 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_217868 ?auto_217863 )
      ( DELIVER-2PKG ?auto_217868 ?auto_217864 ?auto_217863 )
      ( DELIVER-1PKG-VERIFY ?auto_217864 ?auto_217863 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217870 - OBJ
      ?auto_217871 - OBJ
      ?auto_217869 - LOCATION
    )
    :vars
    (
      ?auto_217872 - LOCATION
      ?auto_217873 - CITY
      ?auto_217874 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217872 ?auto_217873 ) ( IN-CITY ?auto_217869 ?auto_217873 ) ( not ( = ?auto_217869 ?auto_217872 ) ) ( not ( = ?auto_217870 ?auto_217871 ) ) ( OBJ-AT ?auto_217871 ?auto_217872 ) ( TRUCK-AT ?auto_217874 ?auto_217869 ) ( IN-TRUCK ?auto_217870 ?auto_217874 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_217871 ?auto_217869 )
      ( DELIVER-2PKG-VERIFY ?auto_217870 ?auto_217871 ?auto_217869 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217876 - OBJ
      ?auto_217877 - OBJ
      ?auto_217875 - LOCATION
    )
    :vars
    (
      ?auto_217878 - LOCATION
      ?auto_217880 - CITY
      ?auto_217879 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217878 ?auto_217880 ) ( IN-CITY ?auto_217875 ?auto_217880 ) ( not ( = ?auto_217875 ?auto_217878 ) ) ( not ( = ?auto_217877 ?auto_217876 ) ) ( OBJ-AT ?auto_217876 ?auto_217878 ) ( TRUCK-AT ?auto_217879 ?auto_217875 ) ( IN-TRUCK ?auto_217877 ?auto_217879 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217877 ?auto_217876 ?auto_217875 )
      ( DELIVER-2PKG-VERIFY ?auto_217876 ?auto_217877 ?auto_217875 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_218340 - OBJ
      ?auto_218339 - LOCATION
    )
    :vars
    (
      ?auto_218342 - LOCATION
      ?auto_218344 - CITY
      ?auto_218341 - OBJ
      ?auto_218343 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218342 ?auto_218344 ) ( IN-CITY ?auto_218339 ?auto_218344 ) ( not ( = ?auto_218339 ?auto_218342 ) ) ( not ( = ?auto_218341 ?auto_218340 ) ) ( OBJ-AT ?auto_218340 ?auto_218342 ) ( IN-TRUCK ?auto_218341 ?auto_218343 ) ( TRUCK-AT ?auto_218343 ?auto_218342 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_218343 ?auto_218342 ?auto_218339 ?auto_218344 )
      ( DELIVER-2PKG ?auto_218341 ?auto_218340 ?auto_218339 )
      ( DELIVER-1PKG-VERIFY ?auto_218340 ?auto_218339 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_218346 - OBJ
      ?auto_218347 - OBJ
      ?auto_218345 - LOCATION
    )
    :vars
    (
      ?auto_218349 - LOCATION
      ?auto_218348 - CITY
      ?auto_218350 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218349 ?auto_218348 ) ( IN-CITY ?auto_218345 ?auto_218348 ) ( not ( = ?auto_218345 ?auto_218349 ) ) ( not ( = ?auto_218346 ?auto_218347 ) ) ( OBJ-AT ?auto_218347 ?auto_218349 ) ( IN-TRUCK ?auto_218346 ?auto_218350 ) ( TRUCK-AT ?auto_218350 ?auto_218349 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_218347 ?auto_218345 )
      ( DELIVER-2PKG-VERIFY ?auto_218346 ?auto_218347 ?auto_218345 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_218352 - OBJ
      ?auto_218353 - OBJ
      ?auto_218351 - LOCATION
    )
    :vars
    (
      ?auto_218354 - LOCATION
      ?auto_218356 - CITY
      ?auto_218355 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218354 ?auto_218356 ) ( IN-CITY ?auto_218351 ?auto_218356 ) ( not ( = ?auto_218351 ?auto_218354 ) ) ( not ( = ?auto_218353 ?auto_218352 ) ) ( OBJ-AT ?auto_218352 ?auto_218354 ) ( IN-TRUCK ?auto_218353 ?auto_218355 ) ( TRUCK-AT ?auto_218355 ?auto_218354 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_218353 ?auto_218352 ?auto_218351 )
      ( DELIVER-2PKG-VERIFY ?auto_218352 ?auto_218353 ?auto_218351 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_223443 - OBJ
      ?auto_223444 - OBJ
      ?auto_223445 - OBJ
      ?auto_223442 - LOCATION
    )
    :vars
    (
      ?auto_223447 - TRUCK
      ?auto_223446 - LOCATION
      ?auto_223448 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223445 ?auto_223447 ) ( TRUCK-AT ?auto_223447 ?auto_223446 ) ( IN-CITY ?auto_223446 ?auto_223448 ) ( IN-CITY ?auto_223442 ?auto_223448 ) ( not ( = ?auto_223442 ?auto_223446 ) ) ( OBJ-AT ?auto_223444 ?auto_223442 ) ( not ( = ?auto_223444 ?auto_223445 ) ) ( OBJ-AT ?auto_223443 ?auto_223442 ) ( not ( = ?auto_223443 ?auto_223444 ) ) ( not ( = ?auto_223443 ?auto_223445 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223444 ?auto_223445 ?auto_223442 )
      ( DELIVER-3PKG-VERIFY ?auto_223443 ?auto_223444 ?auto_223445 ?auto_223442 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_223454 - OBJ
      ?auto_223455 - OBJ
      ?auto_223456 - OBJ
      ?auto_223453 - LOCATION
    )
    :vars
    (
      ?auto_223458 - TRUCK
      ?auto_223457 - LOCATION
      ?auto_223459 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223455 ?auto_223458 ) ( TRUCK-AT ?auto_223458 ?auto_223457 ) ( IN-CITY ?auto_223457 ?auto_223459 ) ( IN-CITY ?auto_223453 ?auto_223459 ) ( not ( = ?auto_223453 ?auto_223457 ) ) ( OBJ-AT ?auto_223454 ?auto_223453 ) ( not ( = ?auto_223454 ?auto_223455 ) ) ( OBJ-AT ?auto_223456 ?auto_223453 ) ( not ( = ?auto_223454 ?auto_223456 ) ) ( not ( = ?auto_223455 ?auto_223456 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223454 ?auto_223455 ?auto_223453 )
      ( DELIVER-3PKG-VERIFY ?auto_223454 ?auto_223455 ?auto_223456 ?auto_223453 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_223476 - OBJ
      ?auto_223477 - OBJ
      ?auto_223478 - OBJ
      ?auto_223475 - LOCATION
    )
    :vars
    (
      ?auto_223481 - TRUCK
      ?auto_223480 - LOCATION
      ?auto_223482 - CITY
      ?auto_223479 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223478 ?auto_223481 ) ( TRUCK-AT ?auto_223481 ?auto_223480 ) ( IN-CITY ?auto_223480 ?auto_223482 ) ( IN-CITY ?auto_223475 ?auto_223482 ) ( not ( = ?auto_223475 ?auto_223480 ) ) ( OBJ-AT ?auto_223479 ?auto_223475 ) ( not ( = ?auto_223479 ?auto_223478 ) ) ( OBJ-AT ?auto_223476 ?auto_223475 ) ( OBJ-AT ?auto_223477 ?auto_223475 ) ( not ( = ?auto_223476 ?auto_223477 ) ) ( not ( = ?auto_223476 ?auto_223478 ) ) ( not ( = ?auto_223476 ?auto_223479 ) ) ( not ( = ?auto_223477 ?auto_223478 ) ) ( not ( = ?auto_223477 ?auto_223479 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223479 ?auto_223478 ?auto_223475 )
      ( DELIVER-3PKG-VERIFY ?auto_223476 ?auto_223477 ?auto_223478 ?auto_223475 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_223488 - OBJ
      ?auto_223489 - OBJ
      ?auto_223490 - OBJ
      ?auto_223487 - LOCATION
    )
    :vars
    (
      ?auto_223493 - TRUCK
      ?auto_223492 - LOCATION
      ?auto_223494 - CITY
      ?auto_223491 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223489 ?auto_223493 ) ( TRUCK-AT ?auto_223493 ?auto_223492 ) ( IN-CITY ?auto_223492 ?auto_223494 ) ( IN-CITY ?auto_223487 ?auto_223494 ) ( not ( = ?auto_223487 ?auto_223492 ) ) ( OBJ-AT ?auto_223491 ?auto_223487 ) ( not ( = ?auto_223491 ?auto_223489 ) ) ( OBJ-AT ?auto_223488 ?auto_223487 ) ( OBJ-AT ?auto_223490 ?auto_223487 ) ( not ( = ?auto_223488 ?auto_223489 ) ) ( not ( = ?auto_223488 ?auto_223490 ) ) ( not ( = ?auto_223488 ?auto_223491 ) ) ( not ( = ?auto_223489 ?auto_223490 ) ) ( not ( = ?auto_223490 ?auto_223491 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223491 ?auto_223489 ?auto_223487 )
      ( DELIVER-3PKG-VERIFY ?auto_223488 ?auto_223489 ?auto_223490 ?auto_223487 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_223504 - OBJ
      ?auto_223505 - OBJ
      ?auto_223506 - OBJ
      ?auto_223503 - LOCATION
    )
    :vars
    (
      ?auto_223508 - TRUCK
      ?auto_223507 - LOCATION
      ?auto_223509 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223504 ?auto_223508 ) ( TRUCK-AT ?auto_223508 ?auto_223507 ) ( IN-CITY ?auto_223507 ?auto_223509 ) ( IN-CITY ?auto_223503 ?auto_223509 ) ( not ( = ?auto_223503 ?auto_223507 ) ) ( OBJ-AT ?auto_223505 ?auto_223503 ) ( not ( = ?auto_223505 ?auto_223504 ) ) ( OBJ-AT ?auto_223506 ?auto_223503 ) ( not ( = ?auto_223504 ?auto_223506 ) ) ( not ( = ?auto_223505 ?auto_223506 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223505 ?auto_223504 ?auto_223503 )
      ( DELIVER-3PKG-VERIFY ?auto_223504 ?auto_223505 ?auto_223506 ?auto_223503 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_223526 - OBJ
      ?auto_223527 - OBJ
      ?auto_223528 - OBJ
      ?auto_223525 - LOCATION
    )
    :vars
    (
      ?auto_223531 - TRUCK
      ?auto_223530 - LOCATION
      ?auto_223532 - CITY
      ?auto_223529 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223526 ?auto_223531 ) ( TRUCK-AT ?auto_223531 ?auto_223530 ) ( IN-CITY ?auto_223530 ?auto_223532 ) ( IN-CITY ?auto_223525 ?auto_223532 ) ( not ( = ?auto_223525 ?auto_223530 ) ) ( OBJ-AT ?auto_223529 ?auto_223525 ) ( not ( = ?auto_223529 ?auto_223526 ) ) ( OBJ-AT ?auto_223527 ?auto_223525 ) ( OBJ-AT ?auto_223528 ?auto_223525 ) ( not ( = ?auto_223526 ?auto_223527 ) ) ( not ( = ?auto_223526 ?auto_223528 ) ) ( not ( = ?auto_223527 ?auto_223528 ) ) ( not ( = ?auto_223527 ?auto_223529 ) ) ( not ( = ?auto_223528 ?auto_223529 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223529 ?auto_223526 ?auto_223525 )
      ( DELIVER-3PKG-VERIFY ?auto_223526 ?auto_223527 ?auto_223528 ?auto_223525 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223565 - OBJ
      ?auto_223566 - OBJ
      ?auto_223567 - OBJ
      ?auto_223568 - OBJ
      ?auto_223564 - LOCATION
    )
    :vars
    (
      ?auto_223570 - TRUCK
      ?auto_223569 - LOCATION
      ?auto_223571 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223568 ?auto_223570 ) ( TRUCK-AT ?auto_223570 ?auto_223569 ) ( IN-CITY ?auto_223569 ?auto_223571 ) ( IN-CITY ?auto_223564 ?auto_223571 ) ( not ( = ?auto_223564 ?auto_223569 ) ) ( OBJ-AT ?auto_223567 ?auto_223564 ) ( not ( = ?auto_223567 ?auto_223568 ) ) ( OBJ-AT ?auto_223565 ?auto_223564 ) ( OBJ-AT ?auto_223566 ?auto_223564 ) ( not ( = ?auto_223565 ?auto_223566 ) ) ( not ( = ?auto_223565 ?auto_223567 ) ) ( not ( = ?auto_223565 ?auto_223568 ) ) ( not ( = ?auto_223566 ?auto_223567 ) ) ( not ( = ?auto_223566 ?auto_223568 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223567 ?auto_223568 ?auto_223564 )
      ( DELIVER-4PKG-VERIFY ?auto_223565 ?auto_223566 ?auto_223567 ?auto_223568 ?auto_223564 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223581 - OBJ
      ?auto_223582 - OBJ
      ?auto_223583 - OBJ
      ?auto_223584 - OBJ
      ?auto_223580 - LOCATION
    )
    :vars
    (
      ?auto_223586 - TRUCK
      ?auto_223585 - LOCATION
      ?auto_223587 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223583 ?auto_223586 ) ( TRUCK-AT ?auto_223586 ?auto_223585 ) ( IN-CITY ?auto_223585 ?auto_223587 ) ( IN-CITY ?auto_223580 ?auto_223587 ) ( not ( = ?auto_223580 ?auto_223585 ) ) ( OBJ-AT ?auto_223582 ?auto_223580 ) ( not ( = ?auto_223582 ?auto_223583 ) ) ( OBJ-AT ?auto_223581 ?auto_223580 ) ( OBJ-AT ?auto_223584 ?auto_223580 ) ( not ( = ?auto_223581 ?auto_223582 ) ) ( not ( = ?auto_223581 ?auto_223583 ) ) ( not ( = ?auto_223581 ?auto_223584 ) ) ( not ( = ?auto_223582 ?auto_223584 ) ) ( not ( = ?auto_223583 ?auto_223584 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223582 ?auto_223583 ?auto_223580 )
      ( DELIVER-4PKG-VERIFY ?auto_223581 ?auto_223582 ?auto_223583 ?auto_223584 ?auto_223580 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223589 - OBJ
      ?auto_223590 - OBJ
      ?auto_223591 - OBJ
      ?auto_223592 - OBJ
      ?auto_223588 - LOCATION
    )
    :vars
    (
      ?auto_223594 - TRUCK
      ?auto_223593 - LOCATION
      ?auto_223595 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223591 ?auto_223594 ) ( TRUCK-AT ?auto_223594 ?auto_223593 ) ( IN-CITY ?auto_223593 ?auto_223595 ) ( IN-CITY ?auto_223588 ?auto_223595 ) ( not ( = ?auto_223588 ?auto_223593 ) ) ( OBJ-AT ?auto_223589 ?auto_223588 ) ( not ( = ?auto_223589 ?auto_223591 ) ) ( OBJ-AT ?auto_223590 ?auto_223588 ) ( OBJ-AT ?auto_223592 ?auto_223588 ) ( not ( = ?auto_223589 ?auto_223590 ) ) ( not ( = ?auto_223589 ?auto_223592 ) ) ( not ( = ?auto_223590 ?auto_223591 ) ) ( not ( = ?auto_223590 ?auto_223592 ) ) ( not ( = ?auto_223591 ?auto_223592 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223589 ?auto_223591 ?auto_223588 )
      ( DELIVER-4PKG-VERIFY ?auto_223589 ?auto_223590 ?auto_223591 ?auto_223592 ?auto_223588 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223645 - OBJ
      ?auto_223646 - OBJ
      ?auto_223647 - OBJ
      ?auto_223648 - OBJ
      ?auto_223644 - LOCATION
    )
    :vars
    (
      ?auto_223650 - TRUCK
      ?auto_223649 - LOCATION
      ?auto_223651 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223646 ?auto_223650 ) ( TRUCK-AT ?auto_223650 ?auto_223649 ) ( IN-CITY ?auto_223649 ?auto_223651 ) ( IN-CITY ?auto_223644 ?auto_223651 ) ( not ( = ?auto_223644 ?auto_223649 ) ) ( OBJ-AT ?auto_223648 ?auto_223644 ) ( not ( = ?auto_223648 ?auto_223646 ) ) ( OBJ-AT ?auto_223645 ?auto_223644 ) ( OBJ-AT ?auto_223647 ?auto_223644 ) ( not ( = ?auto_223645 ?auto_223646 ) ) ( not ( = ?auto_223645 ?auto_223647 ) ) ( not ( = ?auto_223645 ?auto_223648 ) ) ( not ( = ?auto_223646 ?auto_223647 ) ) ( not ( = ?auto_223647 ?auto_223648 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223648 ?auto_223646 ?auto_223644 )
      ( DELIVER-4PKG-VERIFY ?auto_223645 ?auto_223646 ?auto_223647 ?auto_223648 ?auto_223644 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223653 - OBJ
      ?auto_223654 - OBJ
      ?auto_223655 - OBJ
      ?auto_223656 - OBJ
      ?auto_223652 - LOCATION
    )
    :vars
    (
      ?auto_223658 - TRUCK
      ?auto_223657 - LOCATION
      ?auto_223659 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223654 ?auto_223658 ) ( TRUCK-AT ?auto_223658 ?auto_223657 ) ( IN-CITY ?auto_223657 ?auto_223659 ) ( IN-CITY ?auto_223652 ?auto_223659 ) ( not ( = ?auto_223652 ?auto_223657 ) ) ( OBJ-AT ?auto_223655 ?auto_223652 ) ( not ( = ?auto_223655 ?auto_223654 ) ) ( OBJ-AT ?auto_223653 ?auto_223652 ) ( OBJ-AT ?auto_223656 ?auto_223652 ) ( not ( = ?auto_223653 ?auto_223654 ) ) ( not ( = ?auto_223653 ?auto_223655 ) ) ( not ( = ?auto_223653 ?auto_223656 ) ) ( not ( = ?auto_223654 ?auto_223656 ) ) ( not ( = ?auto_223655 ?auto_223656 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223655 ?auto_223654 ?auto_223652 )
      ( DELIVER-4PKG-VERIFY ?auto_223653 ?auto_223654 ?auto_223655 ?auto_223656 ?auto_223652 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223717 - OBJ
      ?auto_223718 - OBJ
      ?auto_223719 - OBJ
      ?auto_223720 - OBJ
      ?auto_223716 - LOCATION
    )
    :vars
    (
      ?auto_223722 - TRUCK
      ?auto_223721 - LOCATION
      ?auto_223723 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223720 ?auto_223722 ) ( TRUCK-AT ?auto_223722 ?auto_223721 ) ( IN-CITY ?auto_223721 ?auto_223723 ) ( IN-CITY ?auto_223716 ?auto_223723 ) ( not ( = ?auto_223716 ?auto_223721 ) ) ( OBJ-AT ?auto_223718 ?auto_223716 ) ( not ( = ?auto_223718 ?auto_223720 ) ) ( OBJ-AT ?auto_223717 ?auto_223716 ) ( OBJ-AT ?auto_223719 ?auto_223716 ) ( not ( = ?auto_223717 ?auto_223718 ) ) ( not ( = ?auto_223717 ?auto_223719 ) ) ( not ( = ?auto_223717 ?auto_223720 ) ) ( not ( = ?auto_223718 ?auto_223719 ) ) ( not ( = ?auto_223719 ?auto_223720 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223718 ?auto_223720 ?auto_223716 )
      ( DELIVER-4PKG-VERIFY ?auto_223717 ?auto_223718 ?auto_223719 ?auto_223720 ?auto_223716 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223765 - OBJ
      ?auto_223766 - OBJ
      ?auto_223767 - OBJ
      ?auto_223768 - OBJ
      ?auto_223764 - LOCATION
    )
    :vars
    (
      ?auto_223771 - TRUCK
      ?auto_223770 - LOCATION
      ?auto_223772 - CITY
      ?auto_223769 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223768 ?auto_223771 ) ( TRUCK-AT ?auto_223771 ?auto_223770 ) ( IN-CITY ?auto_223770 ?auto_223772 ) ( IN-CITY ?auto_223764 ?auto_223772 ) ( not ( = ?auto_223764 ?auto_223770 ) ) ( OBJ-AT ?auto_223769 ?auto_223764 ) ( not ( = ?auto_223769 ?auto_223768 ) ) ( OBJ-AT ?auto_223765 ?auto_223764 ) ( OBJ-AT ?auto_223766 ?auto_223764 ) ( OBJ-AT ?auto_223767 ?auto_223764 ) ( not ( = ?auto_223765 ?auto_223766 ) ) ( not ( = ?auto_223765 ?auto_223767 ) ) ( not ( = ?auto_223765 ?auto_223768 ) ) ( not ( = ?auto_223765 ?auto_223769 ) ) ( not ( = ?auto_223766 ?auto_223767 ) ) ( not ( = ?auto_223766 ?auto_223768 ) ) ( not ( = ?auto_223766 ?auto_223769 ) ) ( not ( = ?auto_223767 ?auto_223768 ) ) ( not ( = ?auto_223767 ?auto_223769 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223769 ?auto_223768 ?auto_223764 )
      ( DELIVER-4PKG-VERIFY ?auto_223765 ?auto_223766 ?auto_223767 ?auto_223768 ?auto_223764 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223782 - OBJ
      ?auto_223783 - OBJ
      ?auto_223784 - OBJ
      ?auto_223785 - OBJ
      ?auto_223781 - LOCATION
    )
    :vars
    (
      ?auto_223788 - TRUCK
      ?auto_223787 - LOCATION
      ?auto_223789 - CITY
      ?auto_223786 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223784 ?auto_223788 ) ( TRUCK-AT ?auto_223788 ?auto_223787 ) ( IN-CITY ?auto_223787 ?auto_223789 ) ( IN-CITY ?auto_223781 ?auto_223789 ) ( not ( = ?auto_223781 ?auto_223787 ) ) ( OBJ-AT ?auto_223786 ?auto_223781 ) ( not ( = ?auto_223786 ?auto_223784 ) ) ( OBJ-AT ?auto_223782 ?auto_223781 ) ( OBJ-AT ?auto_223783 ?auto_223781 ) ( OBJ-AT ?auto_223785 ?auto_223781 ) ( not ( = ?auto_223782 ?auto_223783 ) ) ( not ( = ?auto_223782 ?auto_223784 ) ) ( not ( = ?auto_223782 ?auto_223785 ) ) ( not ( = ?auto_223782 ?auto_223786 ) ) ( not ( = ?auto_223783 ?auto_223784 ) ) ( not ( = ?auto_223783 ?auto_223785 ) ) ( not ( = ?auto_223783 ?auto_223786 ) ) ( not ( = ?auto_223784 ?auto_223785 ) ) ( not ( = ?auto_223785 ?auto_223786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223786 ?auto_223784 ?auto_223781 )
      ( DELIVER-4PKG-VERIFY ?auto_223782 ?auto_223783 ?auto_223784 ?auto_223785 ?auto_223781 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223832 - OBJ
      ?auto_223833 - OBJ
      ?auto_223834 - OBJ
      ?auto_223835 - OBJ
      ?auto_223831 - LOCATION
    )
    :vars
    (
      ?auto_223838 - TRUCK
      ?auto_223837 - LOCATION
      ?auto_223839 - CITY
      ?auto_223836 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223833 ?auto_223838 ) ( TRUCK-AT ?auto_223838 ?auto_223837 ) ( IN-CITY ?auto_223837 ?auto_223839 ) ( IN-CITY ?auto_223831 ?auto_223839 ) ( not ( = ?auto_223831 ?auto_223837 ) ) ( OBJ-AT ?auto_223836 ?auto_223831 ) ( not ( = ?auto_223836 ?auto_223833 ) ) ( OBJ-AT ?auto_223832 ?auto_223831 ) ( OBJ-AT ?auto_223834 ?auto_223831 ) ( OBJ-AT ?auto_223835 ?auto_223831 ) ( not ( = ?auto_223832 ?auto_223833 ) ) ( not ( = ?auto_223832 ?auto_223834 ) ) ( not ( = ?auto_223832 ?auto_223835 ) ) ( not ( = ?auto_223832 ?auto_223836 ) ) ( not ( = ?auto_223833 ?auto_223834 ) ) ( not ( = ?auto_223833 ?auto_223835 ) ) ( not ( = ?auto_223834 ?auto_223835 ) ) ( not ( = ?auto_223834 ?auto_223836 ) ) ( not ( = ?auto_223835 ?auto_223836 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223836 ?auto_223833 ?auto_223831 )
      ( DELIVER-4PKG-VERIFY ?auto_223832 ?auto_223833 ?auto_223834 ?auto_223835 ?auto_223831 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223884 - OBJ
      ?auto_223885 - OBJ
      ?auto_223886 - OBJ
      ?auto_223887 - OBJ
      ?auto_223883 - LOCATION
    )
    :vars
    (
      ?auto_223889 - TRUCK
      ?auto_223888 - LOCATION
      ?auto_223890 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223884 ?auto_223889 ) ( TRUCK-AT ?auto_223889 ?auto_223888 ) ( IN-CITY ?auto_223888 ?auto_223890 ) ( IN-CITY ?auto_223883 ?auto_223890 ) ( not ( = ?auto_223883 ?auto_223888 ) ) ( OBJ-AT ?auto_223885 ?auto_223883 ) ( not ( = ?auto_223885 ?auto_223884 ) ) ( OBJ-AT ?auto_223886 ?auto_223883 ) ( OBJ-AT ?auto_223887 ?auto_223883 ) ( not ( = ?auto_223884 ?auto_223886 ) ) ( not ( = ?auto_223884 ?auto_223887 ) ) ( not ( = ?auto_223885 ?auto_223886 ) ) ( not ( = ?auto_223885 ?auto_223887 ) ) ( not ( = ?auto_223886 ?auto_223887 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223885 ?auto_223884 ?auto_223883 )
      ( DELIVER-4PKG-VERIFY ?auto_223884 ?auto_223885 ?auto_223886 ?auto_223887 ?auto_223883 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223956 - OBJ
      ?auto_223957 - OBJ
      ?auto_223958 - OBJ
      ?auto_223959 - OBJ
      ?auto_223955 - LOCATION
    )
    :vars
    (
      ?auto_223961 - TRUCK
      ?auto_223960 - LOCATION
      ?auto_223962 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223956 ?auto_223961 ) ( TRUCK-AT ?auto_223961 ?auto_223960 ) ( IN-CITY ?auto_223960 ?auto_223962 ) ( IN-CITY ?auto_223955 ?auto_223962 ) ( not ( = ?auto_223955 ?auto_223960 ) ) ( OBJ-AT ?auto_223958 ?auto_223955 ) ( not ( = ?auto_223958 ?auto_223956 ) ) ( OBJ-AT ?auto_223957 ?auto_223955 ) ( OBJ-AT ?auto_223959 ?auto_223955 ) ( not ( = ?auto_223956 ?auto_223957 ) ) ( not ( = ?auto_223956 ?auto_223959 ) ) ( not ( = ?auto_223957 ?auto_223958 ) ) ( not ( = ?auto_223957 ?auto_223959 ) ) ( not ( = ?auto_223958 ?auto_223959 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223958 ?auto_223956 ?auto_223955 )
      ( DELIVER-4PKG-VERIFY ?auto_223956 ?auto_223957 ?auto_223958 ?auto_223959 ?auto_223955 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223980 - OBJ
      ?auto_223981 - OBJ
      ?auto_223982 - OBJ
      ?auto_223983 - OBJ
      ?auto_223979 - LOCATION
    )
    :vars
    (
      ?auto_223986 - TRUCK
      ?auto_223985 - LOCATION
      ?auto_223987 - CITY
      ?auto_223984 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223980 ?auto_223986 ) ( TRUCK-AT ?auto_223986 ?auto_223985 ) ( IN-CITY ?auto_223985 ?auto_223987 ) ( IN-CITY ?auto_223979 ?auto_223987 ) ( not ( = ?auto_223979 ?auto_223985 ) ) ( OBJ-AT ?auto_223984 ?auto_223979 ) ( not ( = ?auto_223984 ?auto_223980 ) ) ( OBJ-AT ?auto_223981 ?auto_223979 ) ( OBJ-AT ?auto_223982 ?auto_223979 ) ( OBJ-AT ?auto_223983 ?auto_223979 ) ( not ( = ?auto_223980 ?auto_223981 ) ) ( not ( = ?auto_223980 ?auto_223982 ) ) ( not ( = ?auto_223980 ?auto_223983 ) ) ( not ( = ?auto_223981 ?auto_223982 ) ) ( not ( = ?auto_223981 ?auto_223983 ) ) ( not ( = ?auto_223981 ?auto_223984 ) ) ( not ( = ?auto_223982 ?auto_223983 ) ) ( not ( = ?auto_223982 ?auto_223984 ) ) ( not ( = ?auto_223983 ?auto_223984 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223984 ?auto_223980 ?auto_223979 )
      ( DELIVER-4PKG-VERIFY ?auto_223980 ?auto_223981 ?auto_223982 ?auto_223983 ?auto_223979 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224100 - OBJ
      ?auto_224101 - OBJ
      ?auto_224102 - OBJ
      ?auto_224103 - OBJ
      ?auto_224104 - OBJ
      ?auto_224099 - LOCATION
    )
    :vars
    (
      ?auto_224106 - TRUCK
      ?auto_224105 - LOCATION
      ?auto_224107 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224104 ?auto_224106 ) ( TRUCK-AT ?auto_224106 ?auto_224105 ) ( IN-CITY ?auto_224105 ?auto_224107 ) ( IN-CITY ?auto_224099 ?auto_224107 ) ( not ( = ?auto_224099 ?auto_224105 ) ) ( OBJ-AT ?auto_224101 ?auto_224099 ) ( not ( = ?auto_224101 ?auto_224104 ) ) ( OBJ-AT ?auto_224100 ?auto_224099 ) ( OBJ-AT ?auto_224102 ?auto_224099 ) ( OBJ-AT ?auto_224103 ?auto_224099 ) ( not ( = ?auto_224100 ?auto_224101 ) ) ( not ( = ?auto_224100 ?auto_224102 ) ) ( not ( = ?auto_224100 ?auto_224103 ) ) ( not ( = ?auto_224100 ?auto_224104 ) ) ( not ( = ?auto_224101 ?auto_224102 ) ) ( not ( = ?auto_224101 ?auto_224103 ) ) ( not ( = ?auto_224102 ?auto_224103 ) ) ( not ( = ?auto_224102 ?auto_224104 ) ) ( not ( = ?auto_224103 ?auto_224104 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224101 ?auto_224104 ?auto_224099 )
      ( DELIVER-5PKG-VERIFY ?auto_224100 ?auto_224101 ?auto_224102 ?auto_224103 ?auto_224104 ?auto_224099 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224109 - OBJ
      ?auto_224110 - OBJ
      ?auto_224111 - OBJ
      ?auto_224112 - OBJ
      ?auto_224113 - OBJ
      ?auto_224108 - LOCATION
    )
    :vars
    (
      ?auto_224115 - TRUCK
      ?auto_224114 - LOCATION
      ?auto_224116 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224113 ?auto_224115 ) ( TRUCK-AT ?auto_224115 ?auto_224114 ) ( IN-CITY ?auto_224114 ?auto_224116 ) ( IN-CITY ?auto_224108 ?auto_224116 ) ( not ( = ?auto_224108 ?auto_224114 ) ) ( OBJ-AT ?auto_224111 ?auto_224108 ) ( not ( = ?auto_224111 ?auto_224113 ) ) ( OBJ-AT ?auto_224109 ?auto_224108 ) ( OBJ-AT ?auto_224110 ?auto_224108 ) ( OBJ-AT ?auto_224112 ?auto_224108 ) ( not ( = ?auto_224109 ?auto_224110 ) ) ( not ( = ?auto_224109 ?auto_224111 ) ) ( not ( = ?auto_224109 ?auto_224112 ) ) ( not ( = ?auto_224109 ?auto_224113 ) ) ( not ( = ?auto_224110 ?auto_224111 ) ) ( not ( = ?auto_224110 ?auto_224112 ) ) ( not ( = ?auto_224110 ?auto_224113 ) ) ( not ( = ?auto_224111 ?auto_224112 ) ) ( not ( = ?auto_224112 ?auto_224113 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224111 ?auto_224113 ?auto_224108 )
      ( DELIVER-5PKG-VERIFY ?auto_224109 ?auto_224110 ?auto_224111 ?auto_224112 ?auto_224113 ?auto_224108 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224118 - OBJ
      ?auto_224119 - OBJ
      ?auto_224120 - OBJ
      ?auto_224121 - OBJ
      ?auto_224122 - OBJ
      ?auto_224117 - LOCATION
    )
    :vars
    (
      ?auto_224124 - TRUCK
      ?auto_224123 - LOCATION
      ?auto_224125 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224121 ?auto_224124 ) ( TRUCK-AT ?auto_224124 ?auto_224123 ) ( IN-CITY ?auto_224123 ?auto_224125 ) ( IN-CITY ?auto_224117 ?auto_224125 ) ( not ( = ?auto_224117 ?auto_224123 ) ) ( OBJ-AT ?auto_224122 ?auto_224117 ) ( not ( = ?auto_224122 ?auto_224121 ) ) ( OBJ-AT ?auto_224118 ?auto_224117 ) ( OBJ-AT ?auto_224119 ?auto_224117 ) ( OBJ-AT ?auto_224120 ?auto_224117 ) ( not ( = ?auto_224118 ?auto_224119 ) ) ( not ( = ?auto_224118 ?auto_224120 ) ) ( not ( = ?auto_224118 ?auto_224121 ) ) ( not ( = ?auto_224118 ?auto_224122 ) ) ( not ( = ?auto_224119 ?auto_224120 ) ) ( not ( = ?auto_224119 ?auto_224121 ) ) ( not ( = ?auto_224119 ?auto_224122 ) ) ( not ( = ?auto_224120 ?auto_224121 ) ) ( not ( = ?auto_224120 ?auto_224122 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224122 ?auto_224121 ?auto_224117 )
      ( DELIVER-5PKG-VERIFY ?auto_224118 ?auto_224119 ?auto_224120 ?auto_224121 ?auto_224122 ?auto_224117 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224127 - OBJ
      ?auto_224128 - OBJ
      ?auto_224129 - OBJ
      ?auto_224130 - OBJ
      ?auto_224131 - OBJ
      ?auto_224126 - LOCATION
    )
    :vars
    (
      ?auto_224133 - TRUCK
      ?auto_224132 - LOCATION
      ?auto_224134 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224130 ?auto_224133 ) ( TRUCK-AT ?auto_224133 ?auto_224132 ) ( IN-CITY ?auto_224132 ?auto_224134 ) ( IN-CITY ?auto_224126 ?auto_224134 ) ( not ( = ?auto_224126 ?auto_224132 ) ) ( OBJ-AT ?auto_224129 ?auto_224126 ) ( not ( = ?auto_224129 ?auto_224130 ) ) ( OBJ-AT ?auto_224127 ?auto_224126 ) ( OBJ-AT ?auto_224128 ?auto_224126 ) ( OBJ-AT ?auto_224131 ?auto_224126 ) ( not ( = ?auto_224127 ?auto_224128 ) ) ( not ( = ?auto_224127 ?auto_224129 ) ) ( not ( = ?auto_224127 ?auto_224130 ) ) ( not ( = ?auto_224127 ?auto_224131 ) ) ( not ( = ?auto_224128 ?auto_224129 ) ) ( not ( = ?auto_224128 ?auto_224130 ) ) ( not ( = ?auto_224128 ?auto_224131 ) ) ( not ( = ?auto_224129 ?auto_224131 ) ) ( not ( = ?auto_224130 ?auto_224131 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224129 ?auto_224130 ?auto_224126 )
      ( DELIVER-5PKG-VERIFY ?auto_224127 ?auto_224128 ?auto_224129 ?auto_224130 ?auto_224131 ?auto_224126 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224163 - OBJ
      ?auto_224164 - OBJ
      ?auto_224165 - OBJ
      ?auto_224166 - OBJ
      ?auto_224167 - OBJ
      ?auto_224162 - LOCATION
    )
    :vars
    (
      ?auto_224169 - TRUCK
      ?auto_224168 - LOCATION
      ?auto_224170 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224166 ?auto_224169 ) ( TRUCK-AT ?auto_224169 ?auto_224168 ) ( IN-CITY ?auto_224168 ?auto_224170 ) ( IN-CITY ?auto_224162 ?auto_224170 ) ( not ( = ?auto_224162 ?auto_224168 ) ) ( OBJ-AT ?auto_224164 ?auto_224162 ) ( not ( = ?auto_224164 ?auto_224166 ) ) ( OBJ-AT ?auto_224163 ?auto_224162 ) ( OBJ-AT ?auto_224165 ?auto_224162 ) ( OBJ-AT ?auto_224167 ?auto_224162 ) ( not ( = ?auto_224163 ?auto_224164 ) ) ( not ( = ?auto_224163 ?auto_224165 ) ) ( not ( = ?auto_224163 ?auto_224166 ) ) ( not ( = ?auto_224163 ?auto_224167 ) ) ( not ( = ?auto_224164 ?auto_224165 ) ) ( not ( = ?auto_224164 ?auto_224167 ) ) ( not ( = ?auto_224165 ?auto_224166 ) ) ( not ( = ?auto_224165 ?auto_224167 ) ) ( not ( = ?auto_224166 ?auto_224167 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224164 ?auto_224166 ?auto_224162 )
      ( DELIVER-5PKG-VERIFY ?auto_224163 ?auto_224164 ?auto_224165 ?auto_224166 ?auto_224167 ?auto_224162 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224190 - OBJ
      ?auto_224191 - OBJ
      ?auto_224192 - OBJ
      ?auto_224193 - OBJ
      ?auto_224194 - OBJ
      ?auto_224189 - LOCATION
    )
    :vars
    (
      ?auto_224196 - TRUCK
      ?auto_224195 - LOCATION
      ?auto_224197 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224192 ?auto_224196 ) ( TRUCK-AT ?auto_224196 ?auto_224195 ) ( IN-CITY ?auto_224195 ?auto_224197 ) ( IN-CITY ?auto_224189 ?auto_224197 ) ( not ( = ?auto_224189 ?auto_224195 ) ) ( OBJ-AT ?auto_224190 ?auto_224189 ) ( not ( = ?auto_224190 ?auto_224192 ) ) ( OBJ-AT ?auto_224191 ?auto_224189 ) ( OBJ-AT ?auto_224193 ?auto_224189 ) ( OBJ-AT ?auto_224194 ?auto_224189 ) ( not ( = ?auto_224190 ?auto_224191 ) ) ( not ( = ?auto_224190 ?auto_224193 ) ) ( not ( = ?auto_224190 ?auto_224194 ) ) ( not ( = ?auto_224191 ?auto_224192 ) ) ( not ( = ?auto_224191 ?auto_224193 ) ) ( not ( = ?auto_224191 ?auto_224194 ) ) ( not ( = ?auto_224192 ?auto_224193 ) ) ( not ( = ?auto_224192 ?auto_224194 ) ) ( not ( = ?auto_224193 ?auto_224194 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224190 ?auto_224192 ?auto_224189 )
      ( DELIVER-5PKG-VERIFY ?auto_224190 ?auto_224191 ?auto_224192 ?auto_224193 ?auto_224194 ?auto_224189 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224199 - OBJ
      ?auto_224200 - OBJ
      ?auto_224201 - OBJ
      ?auto_224202 - OBJ
      ?auto_224203 - OBJ
      ?auto_224198 - LOCATION
    )
    :vars
    (
      ?auto_224205 - TRUCK
      ?auto_224204 - LOCATION
      ?auto_224206 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224201 ?auto_224205 ) ( TRUCK-AT ?auto_224205 ?auto_224204 ) ( IN-CITY ?auto_224204 ?auto_224206 ) ( IN-CITY ?auto_224198 ?auto_224206 ) ( not ( = ?auto_224198 ?auto_224204 ) ) ( OBJ-AT ?auto_224202 ?auto_224198 ) ( not ( = ?auto_224202 ?auto_224201 ) ) ( OBJ-AT ?auto_224199 ?auto_224198 ) ( OBJ-AT ?auto_224200 ?auto_224198 ) ( OBJ-AT ?auto_224203 ?auto_224198 ) ( not ( = ?auto_224199 ?auto_224200 ) ) ( not ( = ?auto_224199 ?auto_224201 ) ) ( not ( = ?auto_224199 ?auto_224202 ) ) ( not ( = ?auto_224199 ?auto_224203 ) ) ( not ( = ?auto_224200 ?auto_224201 ) ) ( not ( = ?auto_224200 ?auto_224202 ) ) ( not ( = ?auto_224200 ?auto_224203 ) ) ( not ( = ?auto_224201 ?auto_224203 ) ) ( not ( = ?auto_224202 ?auto_224203 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224202 ?auto_224201 ?auto_224198 )
      ( DELIVER-5PKG-VERIFY ?auto_224199 ?auto_224200 ?auto_224201 ?auto_224202 ?auto_224203 ?auto_224198 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224217 - OBJ
      ?auto_224218 - OBJ
      ?auto_224219 - OBJ
      ?auto_224220 - OBJ
      ?auto_224221 - OBJ
      ?auto_224216 - LOCATION
    )
    :vars
    (
      ?auto_224223 - TRUCK
      ?auto_224222 - LOCATION
      ?auto_224224 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224219 ?auto_224223 ) ( TRUCK-AT ?auto_224223 ?auto_224222 ) ( IN-CITY ?auto_224222 ?auto_224224 ) ( IN-CITY ?auto_224216 ?auto_224224 ) ( not ( = ?auto_224216 ?auto_224222 ) ) ( OBJ-AT ?auto_224218 ?auto_224216 ) ( not ( = ?auto_224218 ?auto_224219 ) ) ( OBJ-AT ?auto_224217 ?auto_224216 ) ( OBJ-AT ?auto_224220 ?auto_224216 ) ( OBJ-AT ?auto_224221 ?auto_224216 ) ( not ( = ?auto_224217 ?auto_224218 ) ) ( not ( = ?auto_224217 ?auto_224219 ) ) ( not ( = ?auto_224217 ?auto_224220 ) ) ( not ( = ?auto_224217 ?auto_224221 ) ) ( not ( = ?auto_224218 ?auto_224220 ) ) ( not ( = ?auto_224218 ?auto_224221 ) ) ( not ( = ?auto_224219 ?auto_224220 ) ) ( not ( = ?auto_224219 ?auto_224221 ) ) ( not ( = ?auto_224220 ?auto_224221 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224218 ?auto_224219 ?auto_224216 )
      ( DELIVER-5PKG-VERIFY ?auto_224217 ?auto_224218 ?auto_224219 ?auto_224220 ?auto_224221 ?auto_224216 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224442 - OBJ
      ?auto_224443 - OBJ
      ?auto_224444 - OBJ
      ?auto_224445 - OBJ
      ?auto_224446 - OBJ
      ?auto_224441 - LOCATION
    )
    :vars
    (
      ?auto_224448 - TRUCK
      ?auto_224447 - LOCATION
      ?auto_224449 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224443 ?auto_224448 ) ( TRUCK-AT ?auto_224448 ?auto_224447 ) ( IN-CITY ?auto_224447 ?auto_224449 ) ( IN-CITY ?auto_224441 ?auto_224449 ) ( not ( = ?auto_224441 ?auto_224447 ) ) ( OBJ-AT ?auto_224445 ?auto_224441 ) ( not ( = ?auto_224445 ?auto_224443 ) ) ( OBJ-AT ?auto_224442 ?auto_224441 ) ( OBJ-AT ?auto_224444 ?auto_224441 ) ( OBJ-AT ?auto_224446 ?auto_224441 ) ( not ( = ?auto_224442 ?auto_224443 ) ) ( not ( = ?auto_224442 ?auto_224444 ) ) ( not ( = ?auto_224442 ?auto_224445 ) ) ( not ( = ?auto_224442 ?auto_224446 ) ) ( not ( = ?auto_224443 ?auto_224444 ) ) ( not ( = ?auto_224443 ?auto_224446 ) ) ( not ( = ?auto_224444 ?auto_224445 ) ) ( not ( = ?auto_224444 ?auto_224446 ) ) ( not ( = ?auto_224445 ?auto_224446 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224445 ?auto_224443 ?auto_224441 )
      ( DELIVER-5PKG-VERIFY ?auto_224442 ?auto_224443 ?auto_224444 ?auto_224445 ?auto_224446 ?auto_224441 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224469 - OBJ
      ?auto_224470 - OBJ
      ?auto_224471 - OBJ
      ?auto_224472 - OBJ
      ?auto_224473 - OBJ
      ?auto_224468 - LOCATION
    )
    :vars
    (
      ?auto_224475 - TRUCK
      ?auto_224474 - LOCATION
      ?auto_224476 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224470 ?auto_224475 ) ( TRUCK-AT ?auto_224475 ?auto_224474 ) ( IN-CITY ?auto_224474 ?auto_224476 ) ( IN-CITY ?auto_224468 ?auto_224476 ) ( not ( = ?auto_224468 ?auto_224474 ) ) ( OBJ-AT ?auto_224469 ?auto_224468 ) ( not ( = ?auto_224469 ?auto_224470 ) ) ( OBJ-AT ?auto_224471 ?auto_224468 ) ( OBJ-AT ?auto_224472 ?auto_224468 ) ( OBJ-AT ?auto_224473 ?auto_224468 ) ( not ( = ?auto_224469 ?auto_224471 ) ) ( not ( = ?auto_224469 ?auto_224472 ) ) ( not ( = ?auto_224469 ?auto_224473 ) ) ( not ( = ?auto_224470 ?auto_224471 ) ) ( not ( = ?auto_224470 ?auto_224472 ) ) ( not ( = ?auto_224470 ?auto_224473 ) ) ( not ( = ?auto_224471 ?auto_224472 ) ) ( not ( = ?auto_224471 ?auto_224473 ) ) ( not ( = ?auto_224472 ?auto_224473 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224469 ?auto_224470 ?auto_224468 )
      ( DELIVER-5PKG-VERIFY ?auto_224469 ?auto_224470 ?auto_224471 ?auto_224472 ?auto_224473 ?auto_224468 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224478 - OBJ
      ?auto_224479 - OBJ
      ?auto_224480 - OBJ
      ?auto_224481 - OBJ
      ?auto_224482 - OBJ
      ?auto_224477 - LOCATION
    )
    :vars
    (
      ?auto_224484 - TRUCK
      ?auto_224483 - LOCATION
      ?auto_224485 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224479 ?auto_224484 ) ( TRUCK-AT ?auto_224484 ?auto_224483 ) ( IN-CITY ?auto_224483 ?auto_224485 ) ( IN-CITY ?auto_224477 ?auto_224485 ) ( not ( = ?auto_224477 ?auto_224483 ) ) ( OBJ-AT ?auto_224480 ?auto_224477 ) ( not ( = ?auto_224480 ?auto_224479 ) ) ( OBJ-AT ?auto_224478 ?auto_224477 ) ( OBJ-AT ?auto_224481 ?auto_224477 ) ( OBJ-AT ?auto_224482 ?auto_224477 ) ( not ( = ?auto_224478 ?auto_224479 ) ) ( not ( = ?auto_224478 ?auto_224480 ) ) ( not ( = ?auto_224478 ?auto_224481 ) ) ( not ( = ?auto_224478 ?auto_224482 ) ) ( not ( = ?auto_224479 ?auto_224481 ) ) ( not ( = ?auto_224479 ?auto_224482 ) ) ( not ( = ?auto_224480 ?auto_224481 ) ) ( not ( = ?auto_224480 ?auto_224482 ) ) ( not ( = ?auto_224481 ?auto_224482 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224480 ?auto_224479 ?auto_224477 )
      ( DELIVER-5PKG-VERIFY ?auto_224478 ?auto_224479 ?auto_224480 ?auto_224481 ?auto_224482 ?auto_224477 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224856 - OBJ
      ?auto_224857 - OBJ
      ?auto_224858 - OBJ
      ?auto_224859 - OBJ
      ?auto_224860 - OBJ
      ?auto_224855 - LOCATION
    )
    :vars
    (
      ?auto_224862 - TRUCK
      ?auto_224861 - LOCATION
      ?auto_224863 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224860 ?auto_224862 ) ( TRUCK-AT ?auto_224862 ?auto_224861 ) ( IN-CITY ?auto_224861 ?auto_224863 ) ( IN-CITY ?auto_224855 ?auto_224863 ) ( not ( = ?auto_224855 ?auto_224861 ) ) ( OBJ-AT ?auto_224859 ?auto_224855 ) ( not ( = ?auto_224859 ?auto_224860 ) ) ( OBJ-AT ?auto_224856 ?auto_224855 ) ( OBJ-AT ?auto_224857 ?auto_224855 ) ( OBJ-AT ?auto_224858 ?auto_224855 ) ( not ( = ?auto_224856 ?auto_224857 ) ) ( not ( = ?auto_224856 ?auto_224858 ) ) ( not ( = ?auto_224856 ?auto_224859 ) ) ( not ( = ?auto_224856 ?auto_224860 ) ) ( not ( = ?auto_224857 ?auto_224858 ) ) ( not ( = ?auto_224857 ?auto_224859 ) ) ( not ( = ?auto_224857 ?auto_224860 ) ) ( not ( = ?auto_224858 ?auto_224859 ) ) ( not ( = ?auto_224858 ?auto_224860 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224859 ?auto_224860 ?auto_224855 )
      ( DELIVER-5PKG-VERIFY ?auto_224856 ?auto_224857 ?auto_224858 ?auto_224859 ?auto_224860 ?auto_224855 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224910 - OBJ
      ?auto_224911 - OBJ
      ?auto_224912 - OBJ
      ?auto_224913 - OBJ
      ?auto_224914 - OBJ
      ?auto_224909 - LOCATION
    )
    :vars
    (
      ?auto_224917 - TRUCK
      ?auto_224916 - LOCATION
      ?auto_224918 - CITY
      ?auto_224915 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224914 ?auto_224917 ) ( TRUCK-AT ?auto_224917 ?auto_224916 ) ( IN-CITY ?auto_224916 ?auto_224918 ) ( IN-CITY ?auto_224909 ?auto_224918 ) ( not ( = ?auto_224909 ?auto_224916 ) ) ( OBJ-AT ?auto_224915 ?auto_224909 ) ( not ( = ?auto_224915 ?auto_224914 ) ) ( OBJ-AT ?auto_224910 ?auto_224909 ) ( OBJ-AT ?auto_224911 ?auto_224909 ) ( OBJ-AT ?auto_224912 ?auto_224909 ) ( OBJ-AT ?auto_224913 ?auto_224909 ) ( not ( = ?auto_224910 ?auto_224911 ) ) ( not ( = ?auto_224910 ?auto_224912 ) ) ( not ( = ?auto_224910 ?auto_224913 ) ) ( not ( = ?auto_224910 ?auto_224914 ) ) ( not ( = ?auto_224910 ?auto_224915 ) ) ( not ( = ?auto_224911 ?auto_224912 ) ) ( not ( = ?auto_224911 ?auto_224913 ) ) ( not ( = ?auto_224911 ?auto_224914 ) ) ( not ( = ?auto_224911 ?auto_224915 ) ) ( not ( = ?auto_224912 ?auto_224913 ) ) ( not ( = ?auto_224912 ?auto_224914 ) ) ( not ( = ?auto_224912 ?auto_224915 ) ) ( not ( = ?auto_224913 ?auto_224914 ) ) ( not ( = ?auto_224913 ?auto_224915 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224915 ?auto_224914 ?auto_224909 )
      ( DELIVER-5PKG-VERIFY ?auto_224910 ?auto_224911 ?auto_224912 ?auto_224913 ?auto_224914 ?auto_224909 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224929 - OBJ
      ?auto_224930 - OBJ
      ?auto_224931 - OBJ
      ?auto_224932 - OBJ
      ?auto_224933 - OBJ
      ?auto_224928 - LOCATION
    )
    :vars
    (
      ?auto_224936 - TRUCK
      ?auto_224935 - LOCATION
      ?auto_224937 - CITY
      ?auto_224934 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224932 ?auto_224936 ) ( TRUCK-AT ?auto_224936 ?auto_224935 ) ( IN-CITY ?auto_224935 ?auto_224937 ) ( IN-CITY ?auto_224928 ?auto_224937 ) ( not ( = ?auto_224928 ?auto_224935 ) ) ( OBJ-AT ?auto_224934 ?auto_224928 ) ( not ( = ?auto_224934 ?auto_224932 ) ) ( OBJ-AT ?auto_224929 ?auto_224928 ) ( OBJ-AT ?auto_224930 ?auto_224928 ) ( OBJ-AT ?auto_224931 ?auto_224928 ) ( OBJ-AT ?auto_224933 ?auto_224928 ) ( not ( = ?auto_224929 ?auto_224930 ) ) ( not ( = ?auto_224929 ?auto_224931 ) ) ( not ( = ?auto_224929 ?auto_224932 ) ) ( not ( = ?auto_224929 ?auto_224933 ) ) ( not ( = ?auto_224929 ?auto_224934 ) ) ( not ( = ?auto_224930 ?auto_224931 ) ) ( not ( = ?auto_224930 ?auto_224932 ) ) ( not ( = ?auto_224930 ?auto_224933 ) ) ( not ( = ?auto_224930 ?auto_224934 ) ) ( not ( = ?auto_224931 ?auto_224932 ) ) ( not ( = ?auto_224931 ?auto_224933 ) ) ( not ( = ?auto_224931 ?auto_224934 ) ) ( not ( = ?auto_224932 ?auto_224933 ) ) ( not ( = ?auto_224933 ?auto_224934 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224934 ?auto_224932 ?auto_224928 )
      ( DELIVER-5PKG-VERIFY ?auto_224929 ?auto_224930 ?auto_224931 ?auto_224932 ?auto_224933 ?auto_224928 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224985 - OBJ
      ?auto_224986 - OBJ
      ?auto_224987 - OBJ
      ?auto_224988 - OBJ
      ?auto_224989 - OBJ
      ?auto_224984 - LOCATION
    )
    :vars
    (
      ?auto_224992 - TRUCK
      ?auto_224991 - LOCATION
      ?auto_224993 - CITY
      ?auto_224990 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224987 ?auto_224992 ) ( TRUCK-AT ?auto_224992 ?auto_224991 ) ( IN-CITY ?auto_224991 ?auto_224993 ) ( IN-CITY ?auto_224984 ?auto_224993 ) ( not ( = ?auto_224984 ?auto_224991 ) ) ( OBJ-AT ?auto_224990 ?auto_224984 ) ( not ( = ?auto_224990 ?auto_224987 ) ) ( OBJ-AT ?auto_224985 ?auto_224984 ) ( OBJ-AT ?auto_224986 ?auto_224984 ) ( OBJ-AT ?auto_224988 ?auto_224984 ) ( OBJ-AT ?auto_224989 ?auto_224984 ) ( not ( = ?auto_224985 ?auto_224986 ) ) ( not ( = ?auto_224985 ?auto_224987 ) ) ( not ( = ?auto_224985 ?auto_224988 ) ) ( not ( = ?auto_224985 ?auto_224989 ) ) ( not ( = ?auto_224985 ?auto_224990 ) ) ( not ( = ?auto_224986 ?auto_224987 ) ) ( not ( = ?auto_224986 ?auto_224988 ) ) ( not ( = ?auto_224986 ?auto_224989 ) ) ( not ( = ?auto_224986 ?auto_224990 ) ) ( not ( = ?auto_224987 ?auto_224988 ) ) ( not ( = ?auto_224987 ?auto_224989 ) ) ( not ( = ?auto_224988 ?auto_224989 ) ) ( not ( = ?auto_224988 ?auto_224990 ) ) ( not ( = ?auto_224989 ?auto_224990 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224990 ?auto_224987 ?auto_224984 )
      ( DELIVER-5PKG-VERIFY ?auto_224985 ?auto_224986 ?auto_224987 ?auto_224988 ?auto_224989 ?auto_224984 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225151 - OBJ
      ?auto_225152 - OBJ
      ?auto_225153 - OBJ
      ?auto_225154 - OBJ
      ?auto_225155 - OBJ
      ?auto_225150 - LOCATION
    )
    :vars
    (
      ?auto_225158 - TRUCK
      ?auto_225157 - LOCATION
      ?auto_225159 - CITY
      ?auto_225156 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225152 ?auto_225158 ) ( TRUCK-AT ?auto_225158 ?auto_225157 ) ( IN-CITY ?auto_225157 ?auto_225159 ) ( IN-CITY ?auto_225150 ?auto_225159 ) ( not ( = ?auto_225150 ?auto_225157 ) ) ( OBJ-AT ?auto_225156 ?auto_225150 ) ( not ( = ?auto_225156 ?auto_225152 ) ) ( OBJ-AT ?auto_225151 ?auto_225150 ) ( OBJ-AT ?auto_225153 ?auto_225150 ) ( OBJ-AT ?auto_225154 ?auto_225150 ) ( OBJ-AT ?auto_225155 ?auto_225150 ) ( not ( = ?auto_225151 ?auto_225152 ) ) ( not ( = ?auto_225151 ?auto_225153 ) ) ( not ( = ?auto_225151 ?auto_225154 ) ) ( not ( = ?auto_225151 ?auto_225155 ) ) ( not ( = ?auto_225151 ?auto_225156 ) ) ( not ( = ?auto_225152 ?auto_225153 ) ) ( not ( = ?auto_225152 ?auto_225154 ) ) ( not ( = ?auto_225152 ?auto_225155 ) ) ( not ( = ?auto_225153 ?auto_225154 ) ) ( not ( = ?auto_225153 ?auto_225155 ) ) ( not ( = ?auto_225153 ?auto_225156 ) ) ( not ( = ?auto_225154 ?auto_225155 ) ) ( not ( = ?auto_225154 ?auto_225156 ) ) ( not ( = ?auto_225155 ?auto_225156 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225156 ?auto_225152 ?auto_225150 )
      ( DELIVER-5PKG-VERIFY ?auto_225151 ?auto_225152 ?auto_225153 ?auto_225154 ?auto_225155 ?auto_225150 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225285 - OBJ
      ?auto_225286 - OBJ
      ?auto_225287 - OBJ
      ?auto_225288 - OBJ
      ?auto_225289 - OBJ
      ?auto_225284 - LOCATION
    )
    :vars
    (
      ?auto_225291 - TRUCK
      ?auto_225290 - LOCATION
      ?auto_225292 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225285 ?auto_225291 ) ( TRUCK-AT ?auto_225291 ?auto_225290 ) ( IN-CITY ?auto_225290 ?auto_225292 ) ( IN-CITY ?auto_225284 ?auto_225292 ) ( not ( = ?auto_225284 ?auto_225290 ) ) ( OBJ-AT ?auto_225287 ?auto_225284 ) ( not ( = ?auto_225287 ?auto_225285 ) ) ( OBJ-AT ?auto_225286 ?auto_225284 ) ( OBJ-AT ?auto_225288 ?auto_225284 ) ( OBJ-AT ?auto_225289 ?auto_225284 ) ( not ( = ?auto_225285 ?auto_225286 ) ) ( not ( = ?auto_225285 ?auto_225288 ) ) ( not ( = ?auto_225285 ?auto_225289 ) ) ( not ( = ?auto_225286 ?auto_225287 ) ) ( not ( = ?auto_225286 ?auto_225288 ) ) ( not ( = ?auto_225286 ?auto_225289 ) ) ( not ( = ?auto_225287 ?auto_225288 ) ) ( not ( = ?auto_225287 ?auto_225289 ) ) ( not ( = ?auto_225288 ?auto_225289 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225287 ?auto_225285 ?auto_225284 )
      ( DELIVER-5PKG-VERIFY ?auto_225285 ?auto_225286 ?auto_225287 ?auto_225288 ?auto_225289 ?auto_225284 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225294 - OBJ
      ?auto_225295 - OBJ
      ?auto_225296 - OBJ
      ?auto_225297 - OBJ
      ?auto_225298 - OBJ
      ?auto_225293 - LOCATION
    )
    :vars
    (
      ?auto_225300 - TRUCK
      ?auto_225299 - LOCATION
      ?auto_225301 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225294 ?auto_225300 ) ( TRUCK-AT ?auto_225300 ?auto_225299 ) ( IN-CITY ?auto_225299 ?auto_225301 ) ( IN-CITY ?auto_225293 ?auto_225301 ) ( not ( = ?auto_225293 ?auto_225299 ) ) ( OBJ-AT ?auto_225297 ?auto_225293 ) ( not ( = ?auto_225297 ?auto_225294 ) ) ( OBJ-AT ?auto_225295 ?auto_225293 ) ( OBJ-AT ?auto_225296 ?auto_225293 ) ( OBJ-AT ?auto_225298 ?auto_225293 ) ( not ( = ?auto_225294 ?auto_225295 ) ) ( not ( = ?auto_225294 ?auto_225296 ) ) ( not ( = ?auto_225294 ?auto_225298 ) ) ( not ( = ?auto_225295 ?auto_225296 ) ) ( not ( = ?auto_225295 ?auto_225297 ) ) ( not ( = ?auto_225295 ?auto_225298 ) ) ( not ( = ?auto_225296 ?auto_225297 ) ) ( not ( = ?auto_225296 ?auto_225298 ) ) ( not ( = ?auto_225297 ?auto_225298 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225297 ?auto_225294 ?auto_225293 )
      ( DELIVER-5PKG-VERIFY ?auto_225294 ?auto_225295 ?auto_225296 ?auto_225297 ?auto_225298 ?auto_225293 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225366 - OBJ
      ?auto_225367 - OBJ
      ?auto_225368 - OBJ
      ?auto_225369 - OBJ
      ?auto_225370 - OBJ
      ?auto_225365 - LOCATION
    )
    :vars
    (
      ?auto_225372 - TRUCK
      ?auto_225371 - LOCATION
      ?auto_225373 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225366 ?auto_225372 ) ( TRUCK-AT ?auto_225372 ?auto_225371 ) ( IN-CITY ?auto_225371 ?auto_225373 ) ( IN-CITY ?auto_225365 ?auto_225373 ) ( not ( = ?auto_225365 ?auto_225371 ) ) ( OBJ-AT ?auto_225370 ?auto_225365 ) ( not ( = ?auto_225370 ?auto_225366 ) ) ( OBJ-AT ?auto_225367 ?auto_225365 ) ( OBJ-AT ?auto_225368 ?auto_225365 ) ( OBJ-AT ?auto_225369 ?auto_225365 ) ( not ( = ?auto_225366 ?auto_225367 ) ) ( not ( = ?auto_225366 ?auto_225368 ) ) ( not ( = ?auto_225366 ?auto_225369 ) ) ( not ( = ?auto_225367 ?auto_225368 ) ) ( not ( = ?auto_225367 ?auto_225369 ) ) ( not ( = ?auto_225367 ?auto_225370 ) ) ( not ( = ?auto_225368 ?auto_225369 ) ) ( not ( = ?auto_225368 ?auto_225370 ) ) ( not ( = ?auto_225369 ?auto_225370 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225370 ?auto_225366 ?auto_225365 )
      ( DELIVER-5PKG-VERIFY ?auto_225366 ?auto_225367 ?auto_225368 ?auto_225369 ?auto_225370 ?auto_225365 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225645 - OBJ
      ?auto_225646 - OBJ
      ?auto_225647 - OBJ
      ?auto_225648 - OBJ
      ?auto_225649 - OBJ
      ?auto_225644 - LOCATION
    )
    :vars
    (
      ?auto_225652 - TRUCK
      ?auto_225651 - LOCATION
      ?auto_225653 - CITY
      ?auto_225650 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225645 ?auto_225652 ) ( TRUCK-AT ?auto_225652 ?auto_225651 ) ( IN-CITY ?auto_225651 ?auto_225653 ) ( IN-CITY ?auto_225644 ?auto_225653 ) ( not ( = ?auto_225644 ?auto_225651 ) ) ( OBJ-AT ?auto_225650 ?auto_225644 ) ( not ( = ?auto_225650 ?auto_225645 ) ) ( OBJ-AT ?auto_225646 ?auto_225644 ) ( OBJ-AT ?auto_225647 ?auto_225644 ) ( OBJ-AT ?auto_225648 ?auto_225644 ) ( OBJ-AT ?auto_225649 ?auto_225644 ) ( not ( = ?auto_225645 ?auto_225646 ) ) ( not ( = ?auto_225645 ?auto_225647 ) ) ( not ( = ?auto_225645 ?auto_225648 ) ) ( not ( = ?auto_225645 ?auto_225649 ) ) ( not ( = ?auto_225646 ?auto_225647 ) ) ( not ( = ?auto_225646 ?auto_225648 ) ) ( not ( = ?auto_225646 ?auto_225649 ) ) ( not ( = ?auto_225646 ?auto_225650 ) ) ( not ( = ?auto_225647 ?auto_225648 ) ) ( not ( = ?auto_225647 ?auto_225649 ) ) ( not ( = ?auto_225647 ?auto_225650 ) ) ( not ( = ?auto_225648 ?auto_225649 ) ) ( not ( = ?auto_225648 ?auto_225650 ) ) ( not ( = ?auto_225649 ?auto_225650 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225650 ?auto_225645 ?auto_225644 )
      ( DELIVER-5PKG-VERIFY ?auto_225645 ?auto_225646 ?auto_225647 ?auto_225648 ?auto_225649 ?auto_225644 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226072 - OBJ
      ?auto_226073 - OBJ
      ?auto_226074 - OBJ
      ?auto_226071 - LOCATION
    )
    :vars
    (
      ?auto_226076 - TRUCK
      ?auto_226075 - LOCATION
      ?auto_226077 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226076 ?auto_226075 ) ( IN-CITY ?auto_226075 ?auto_226077 ) ( IN-CITY ?auto_226071 ?auto_226077 ) ( not ( = ?auto_226071 ?auto_226075 ) ) ( OBJ-AT ?auto_226072 ?auto_226071 ) ( not ( = ?auto_226072 ?auto_226073 ) ) ( OBJ-AT ?auto_226073 ?auto_226075 ) ( OBJ-AT ?auto_226074 ?auto_226071 ) ( not ( = ?auto_226072 ?auto_226074 ) ) ( not ( = ?auto_226073 ?auto_226074 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226072 ?auto_226073 ?auto_226071 )
      ( DELIVER-3PKG-VERIFY ?auto_226072 ?auto_226073 ?auto_226074 ?auto_226071 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226094 - OBJ
      ?auto_226095 - OBJ
      ?auto_226096 - OBJ
      ?auto_226093 - LOCATION
    )
    :vars
    (
      ?auto_226099 - TRUCK
      ?auto_226097 - LOCATION
      ?auto_226100 - CITY
      ?auto_226098 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226099 ?auto_226097 ) ( IN-CITY ?auto_226097 ?auto_226100 ) ( IN-CITY ?auto_226093 ?auto_226100 ) ( not ( = ?auto_226093 ?auto_226097 ) ) ( OBJ-AT ?auto_226098 ?auto_226093 ) ( not ( = ?auto_226098 ?auto_226096 ) ) ( OBJ-AT ?auto_226096 ?auto_226097 ) ( OBJ-AT ?auto_226094 ?auto_226093 ) ( OBJ-AT ?auto_226095 ?auto_226093 ) ( not ( = ?auto_226094 ?auto_226095 ) ) ( not ( = ?auto_226094 ?auto_226096 ) ) ( not ( = ?auto_226094 ?auto_226098 ) ) ( not ( = ?auto_226095 ?auto_226096 ) ) ( not ( = ?auto_226095 ?auto_226098 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226098 ?auto_226096 ?auto_226093 )
      ( DELIVER-3PKG-VERIFY ?auto_226094 ?auto_226095 ?auto_226096 ?auto_226093 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226106 - OBJ
      ?auto_226107 - OBJ
      ?auto_226108 - OBJ
      ?auto_226105 - LOCATION
    )
    :vars
    (
      ?auto_226111 - TRUCK
      ?auto_226109 - LOCATION
      ?auto_226112 - CITY
      ?auto_226110 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226111 ?auto_226109 ) ( IN-CITY ?auto_226109 ?auto_226112 ) ( IN-CITY ?auto_226105 ?auto_226112 ) ( not ( = ?auto_226105 ?auto_226109 ) ) ( OBJ-AT ?auto_226110 ?auto_226105 ) ( not ( = ?auto_226110 ?auto_226107 ) ) ( OBJ-AT ?auto_226107 ?auto_226109 ) ( OBJ-AT ?auto_226106 ?auto_226105 ) ( OBJ-AT ?auto_226108 ?auto_226105 ) ( not ( = ?auto_226106 ?auto_226107 ) ) ( not ( = ?auto_226106 ?auto_226108 ) ) ( not ( = ?auto_226106 ?auto_226110 ) ) ( not ( = ?auto_226107 ?auto_226108 ) ) ( not ( = ?auto_226108 ?auto_226110 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226110 ?auto_226107 ?auto_226105 )
      ( DELIVER-3PKG-VERIFY ?auto_226106 ?auto_226107 ?auto_226108 ?auto_226105 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226122 - OBJ
      ?auto_226123 - OBJ
      ?auto_226124 - OBJ
      ?auto_226121 - LOCATION
    )
    :vars
    (
      ?auto_226126 - TRUCK
      ?auto_226125 - LOCATION
      ?auto_226127 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226126 ?auto_226125 ) ( IN-CITY ?auto_226125 ?auto_226127 ) ( IN-CITY ?auto_226121 ?auto_226127 ) ( not ( = ?auto_226121 ?auto_226125 ) ) ( OBJ-AT ?auto_226123 ?auto_226121 ) ( not ( = ?auto_226123 ?auto_226122 ) ) ( OBJ-AT ?auto_226122 ?auto_226125 ) ( OBJ-AT ?auto_226124 ?auto_226121 ) ( not ( = ?auto_226122 ?auto_226124 ) ) ( not ( = ?auto_226123 ?auto_226124 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226123 ?auto_226122 ?auto_226121 )
      ( DELIVER-3PKG-VERIFY ?auto_226122 ?auto_226123 ?auto_226124 ?auto_226121 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226144 - OBJ
      ?auto_226145 - OBJ
      ?auto_226146 - OBJ
      ?auto_226143 - LOCATION
    )
    :vars
    (
      ?auto_226149 - TRUCK
      ?auto_226147 - LOCATION
      ?auto_226150 - CITY
      ?auto_226148 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226149 ?auto_226147 ) ( IN-CITY ?auto_226147 ?auto_226150 ) ( IN-CITY ?auto_226143 ?auto_226150 ) ( not ( = ?auto_226143 ?auto_226147 ) ) ( OBJ-AT ?auto_226148 ?auto_226143 ) ( not ( = ?auto_226148 ?auto_226144 ) ) ( OBJ-AT ?auto_226144 ?auto_226147 ) ( OBJ-AT ?auto_226145 ?auto_226143 ) ( OBJ-AT ?auto_226146 ?auto_226143 ) ( not ( = ?auto_226144 ?auto_226145 ) ) ( not ( = ?auto_226144 ?auto_226146 ) ) ( not ( = ?auto_226145 ?auto_226146 ) ) ( not ( = ?auto_226145 ?auto_226148 ) ) ( not ( = ?auto_226146 ?auto_226148 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226148 ?auto_226144 ?auto_226143 )
      ( DELIVER-3PKG-VERIFY ?auto_226144 ?auto_226145 ?auto_226146 ?auto_226143 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226183 - OBJ
      ?auto_226184 - OBJ
      ?auto_226185 - OBJ
      ?auto_226186 - OBJ
      ?auto_226182 - LOCATION
    )
    :vars
    (
      ?auto_226188 - TRUCK
      ?auto_226187 - LOCATION
      ?auto_226189 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226188 ?auto_226187 ) ( IN-CITY ?auto_226187 ?auto_226189 ) ( IN-CITY ?auto_226182 ?auto_226189 ) ( not ( = ?auto_226182 ?auto_226187 ) ) ( OBJ-AT ?auto_226184 ?auto_226182 ) ( not ( = ?auto_226184 ?auto_226186 ) ) ( OBJ-AT ?auto_226186 ?auto_226187 ) ( OBJ-AT ?auto_226183 ?auto_226182 ) ( OBJ-AT ?auto_226185 ?auto_226182 ) ( not ( = ?auto_226183 ?auto_226184 ) ) ( not ( = ?auto_226183 ?auto_226185 ) ) ( not ( = ?auto_226183 ?auto_226186 ) ) ( not ( = ?auto_226184 ?auto_226185 ) ) ( not ( = ?auto_226185 ?auto_226186 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226184 ?auto_226186 ?auto_226182 )
      ( DELIVER-4PKG-VERIFY ?auto_226183 ?auto_226184 ?auto_226185 ?auto_226186 ?auto_226182 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226191 - OBJ
      ?auto_226192 - OBJ
      ?auto_226193 - OBJ
      ?auto_226194 - OBJ
      ?auto_226190 - LOCATION
    )
    :vars
    (
      ?auto_226196 - TRUCK
      ?auto_226195 - LOCATION
      ?auto_226197 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226196 ?auto_226195 ) ( IN-CITY ?auto_226195 ?auto_226197 ) ( IN-CITY ?auto_226190 ?auto_226197 ) ( not ( = ?auto_226190 ?auto_226195 ) ) ( OBJ-AT ?auto_226191 ?auto_226190 ) ( not ( = ?auto_226191 ?auto_226194 ) ) ( OBJ-AT ?auto_226194 ?auto_226195 ) ( OBJ-AT ?auto_226192 ?auto_226190 ) ( OBJ-AT ?auto_226193 ?auto_226190 ) ( not ( = ?auto_226191 ?auto_226192 ) ) ( not ( = ?auto_226191 ?auto_226193 ) ) ( not ( = ?auto_226192 ?auto_226193 ) ) ( not ( = ?auto_226192 ?auto_226194 ) ) ( not ( = ?auto_226193 ?auto_226194 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226191 ?auto_226194 ?auto_226190 )
      ( DELIVER-4PKG-VERIFY ?auto_226191 ?auto_226192 ?auto_226193 ?auto_226194 ?auto_226190 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226199 - OBJ
      ?auto_226200 - OBJ
      ?auto_226201 - OBJ
      ?auto_226202 - OBJ
      ?auto_226198 - LOCATION
    )
    :vars
    (
      ?auto_226204 - TRUCK
      ?auto_226203 - LOCATION
      ?auto_226205 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226204 ?auto_226203 ) ( IN-CITY ?auto_226203 ?auto_226205 ) ( IN-CITY ?auto_226198 ?auto_226205 ) ( not ( = ?auto_226198 ?auto_226203 ) ) ( OBJ-AT ?auto_226202 ?auto_226198 ) ( not ( = ?auto_226202 ?auto_226201 ) ) ( OBJ-AT ?auto_226201 ?auto_226203 ) ( OBJ-AT ?auto_226199 ?auto_226198 ) ( OBJ-AT ?auto_226200 ?auto_226198 ) ( not ( = ?auto_226199 ?auto_226200 ) ) ( not ( = ?auto_226199 ?auto_226201 ) ) ( not ( = ?auto_226199 ?auto_226202 ) ) ( not ( = ?auto_226200 ?auto_226201 ) ) ( not ( = ?auto_226200 ?auto_226202 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226202 ?auto_226201 ?auto_226198 )
      ( DELIVER-4PKG-VERIFY ?auto_226199 ?auto_226200 ?auto_226201 ?auto_226202 ?auto_226198 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226263 - OBJ
      ?auto_226264 - OBJ
      ?auto_226265 - OBJ
      ?auto_226266 - OBJ
      ?auto_226262 - LOCATION
    )
    :vars
    (
      ?auto_226268 - TRUCK
      ?auto_226267 - LOCATION
      ?auto_226269 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226268 ?auto_226267 ) ( IN-CITY ?auto_226267 ?auto_226269 ) ( IN-CITY ?auto_226262 ?auto_226269 ) ( not ( = ?auto_226262 ?auto_226267 ) ) ( OBJ-AT ?auto_226263 ?auto_226262 ) ( not ( = ?auto_226263 ?auto_226264 ) ) ( OBJ-AT ?auto_226264 ?auto_226267 ) ( OBJ-AT ?auto_226265 ?auto_226262 ) ( OBJ-AT ?auto_226266 ?auto_226262 ) ( not ( = ?auto_226263 ?auto_226265 ) ) ( not ( = ?auto_226263 ?auto_226266 ) ) ( not ( = ?auto_226264 ?auto_226265 ) ) ( not ( = ?auto_226264 ?auto_226266 ) ) ( not ( = ?auto_226265 ?auto_226266 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226263 ?auto_226264 ?auto_226262 )
      ( DELIVER-4PKG-VERIFY ?auto_226263 ?auto_226264 ?auto_226265 ?auto_226266 ?auto_226262 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226271 - OBJ
      ?auto_226272 - OBJ
      ?auto_226273 - OBJ
      ?auto_226274 - OBJ
      ?auto_226270 - LOCATION
    )
    :vars
    (
      ?auto_226276 - TRUCK
      ?auto_226275 - LOCATION
      ?auto_226277 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226276 ?auto_226275 ) ( IN-CITY ?auto_226275 ?auto_226277 ) ( IN-CITY ?auto_226270 ?auto_226277 ) ( not ( = ?auto_226270 ?auto_226275 ) ) ( OBJ-AT ?auto_226273 ?auto_226270 ) ( not ( = ?auto_226273 ?auto_226272 ) ) ( OBJ-AT ?auto_226272 ?auto_226275 ) ( OBJ-AT ?auto_226271 ?auto_226270 ) ( OBJ-AT ?auto_226274 ?auto_226270 ) ( not ( = ?auto_226271 ?auto_226272 ) ) ( not ( = ?auto_226271 ?auto_226273 ) ) ( not ( = ?auto_226271 ?auto_226274 ) ) ( not ( = ?auto_226272 ?auto_226274 ) ) ( not ( = ?auto_226273 ?auto_226274 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226273 ?auto_226272 ?auto_226270 )
      ( DELIVER-4PKG-VERIFY ?auto_226271 ?auto_226272 ?auto_226273 ?auto_226274 ?auto_226270 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226351 - OBJ
      ?auto_226352 - OBJ
      ?auto_226353 - OBJ
      ?auto_226354 - OBJ
      ?auto_226350 - LOCATION
    )
    :vars
    (
      ?auto_226356 - TRUCK
      ?auto_226355 - LOCATION
      ?auto_226357 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226356 ?auto_226355 ) ( IN-CITY ?auto_226355 ?auto_226357 ) ( IN-CITY ?auto_226350 ?auto_226357 ) ( not ( = ?auto_226350 ?auto_226355 ) ) ( OBJ-AT ?auto_226352 ?auto_226350 ) ( not ( = ?auto_226352 ?auto_226353 ) ) ( OBJ-AT ?auto_226353 ?auto_226355 ) ( OBJ-AT ?auto_226351 ?auto_226350 ) ( OBJ-AT ?auto_226354 ?auto_226350 ) ( not ( = ?auto_226351 ?auto_226352 ) ) ( not ( = ?auto_226351 ?auto_226353 ) ) ( not ( = ?auto_226351 ?auto_226354 ) ) ( not ( = ?auto_226352 ?auto_226354 ) ) ( not ( = ?auto_226353 ?auto_226354 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226352 ?auto_226353 ?auto_226350 )
      ( DELIVER-4PKG-VERIFY ?auto_226351 ?auto_226352 ?auto_226353 ?auto_226354 ?auto_226350 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226383 - OBJ
      ?auto_226384 - OBJ
      ?auto_226385 - OBJ
      ?auto_226386 - OBJ
      ?auto_226382 - LOCATION
    )
    :vars
    (
      ?auto_226389 - TRUCK
      ?auto_226387 - LOCATION
      ?auto_226390 - CITY
      ?auto_226388 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226389 ?auto_226387 ) ( IN-CITY ?auto_226387 ?auto_226390 ) ( IN-CITY ?auto_226382 ?auto_226390 ) ( not ( = ?auto_226382 ?auto_226387 ) ) ( OBJ-AT ?auto_226388 ?auto_226382 ) ( not ( = ?auto_226388 ?auto_226386 ) ) ( OBJ-AT ?auto_226386 ?auto_226387 ) ( OBJ-AT ?auto_226383 ?auto_226382 ) ( OBJ-AT ?auto_226384 ?auto_226382 ) ( OBJ-AT ?auto_226385 ?auto_226382 ) ( not ( = ?auto_226383 ?auto_226384 ) ) ( not ( = ?auto_226383 ?auto_226385 ) ) ( not ( = ?auto_226383 ?auto_226386 ) ) ( not ( = ?auto_226383 ?auto_226388 ) ) ( not ( = ?auto_226384 ?auto_226385 ) ) ( not ( = ?auto_226384 ?auto_226386 ) ) ( not ( = ?auto_226384 ?auto_226388 ) ) ( not ( = ?auto_226385 ?auto_226386 ) ) ( not ( = ?auto_226385 ?auto_226388 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226388 ?auto_226386 ?auto_226382 )
      ( DELIVER-4PKG-VERIFY ?auto_226383 ?auto_226384 ?auto_226385 ?auto_226386 ?auto_226382 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226400 - OBJ
      ?auto_226401 - OBJ
      ?auto_226402 - OBJ
      ?auto_226403 - OBJ
      ?auto_226399 - LOCATION
    )
    :vars
    (
      ?auto_226406 - TRUCK
      ?auto_226404 - LOCATION
      ?auto_226407 - CITY
      ?auto_226405 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226406 ?auto_226404 ) ( IN-CITY ?auto_226404 ?auto_226407 ) ( IN-CITY ?auto_226399 ?auto_226407 ) ( not ( = ?auto_226399 ?auto_226404 ) ) ( OBJ-AT ?auto_226405 ?auto_226399 ) ( not ( = ?auto_226405 ?auto_226402 ) ) ( OBJ-AT ?auto_226402 ?auto_226404 ) ( OBJ-AT ?auto_226400 ?auto_226399 ) ( OBJ-AT ?auto_226401 ?auto_226399 ) ( OBJ-AT ?auto_226403 ?auto_226399 ) ( not ( = ?auto_226400 ?auto_226401 ) ) ( not ( = ?auto_226400 ?auto_226402 ) ) ( not ( = ?auto_226400 ?auto_226403 ) ) ( not ( = ?auto_226400 ?auto_226405 ) ) ( not ( = ?auto_226401 ?auto_226402 ) ) ( not ( = ?auto_226401 ?auto_226403 ) ) ( not ( = ?auto_226401 ?auto_226405 ) ) ( not ( = ?auto_226402 ?auto_226403 ) ) ( not ( = ?auto_226403 ?auto_226405 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226405 ?auto_226402 ?auto_226399 )
      ( DELIVER-4PKG-VERIFY ?auto_226400 ?auto_226401 ?auto_226402 ?auto_226403 ?auto_226399 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226450 - OBJ
      ?auto_226451 - OBJ
      ?auto_226452 - OBJ
      ?auto_226453 - OBJ
      ?auto_226449 - LOCATION
    )
    :vars
    (
      ?auto_226456 - TRUCK
      ?auto_226454 - LOCATION
      ?auto_226457 - CITY
      ?auto_226455 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226456 ?auto_226454 ) ( IN-CITY ?auto_226454 ?auto_226457 ) ( IN-CITY ?auto_226449 ?auto_226457 ) ( not ( = ?auto_226449 ?auto_226454 ) ) ( OBJ-AT ?auto_226455 ?auto_226449 ) ( not ( = ?auto_226455 ?auto_226451 ) ) ( OBJ-AT ?auto_226451 ?auto_226454 ) ( OBJ-AT ?auto_226450 ?auto_226449 ) ( OBJ-AT ?auto_226452 ?auto_226449 ) ( OBJ-AT ?auto_226453 ?auto_226449 ) ( not ( = ?auto_226450 ?auto_226451 ) ) ( not ( = ?auto_226450 ?auto_226452 ) ) ( not ( = ?auto_226450 ?auto_226453 ) ) ( not ( = ?auto_226450 ?auto_226455 ) ) ( not ( = ?auto_226451 ?auto_226452 ) ) ( not ( = ?auto_226451 ?auto_226453 ) ) ( not ( = ?auto_226452 ?auto_226453 ) ) ( not ( = ?auto_226452 ?auto_226455 ) ) ( not ( = ?auto_226453 ?auto_226455 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226455 ?auto_226451 ?auto_226449 )
      ( DELIVER-4PKG-VERIFY ?auto_226450 ?auto_226451 ?auto_226452 ?auto_226453 ?auto_226449 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226494 - OBJ
      ?auto_226495 - OBJ
      ?auto_226496 - OBJ
      ?auto_226497 - OBJ
      ?auto_226493 - LOCATION
    )
    :vars
    (
      ?auto_226499 - TRUCK
      ?auto_226498 - LOCATION
      ?auto_226500 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226499 ?auto_226498 ) ( IN-CITY ?auto_226498 ?auto_226500 ) ( IN-CITY ?auto_226493 ?auto_226500 ) ( not ( = ?auto_226493 ?auto_226498 ) ) ( OBJ-AT ?auto_226496 ?auto_226493 ) ( not ( = ?auto_226496 ?auto_226494 ) ) ( OBJ-AT ?auto_226494 ?auto_226498 ) ( OBJ-AT ?auto_226495 ?auto_226493 ) ( OBJ-AT ?auto_226497 ?auto_226493 ) ( not ( = ?auto_226494 ?auto_226495 ) ) ( not ( = ?auto_226494 ?auto_226497 ) ) ( not ( = ?auto_226495 ?auto_226496 ) ) ( not ( = ?auto_226495 ?auto_226497 ) ) ( not ( = ?auto_226496 ?auto_226497 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226496 ?auto_226494 ?auto_226493 )
      ( DELIVER-4PKG-VERIFY ?auto_226494 ?auto_226495 ?auto_226496 ?auto_226497 ?auto_226493 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226566 - OBJ
      ?auto_226567 - OBJ
      ?auto_226568 - OBJ
      ?auto_226569 - OBJ
      ?auto_226565 - LOCATION
    )
    :vars
    (
      ?auto_226571 - TRUCK
      ?auto_226570 - LOCATION
      ?auto_226572 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226571 ?auto_226570 ) ( IN-CITY ?auto_226570 ?auto_226572 ) ( IN-CITY ?auto_226565 ?auto_226572 ) ( not ( = ?auto_226565 ?auto_226570 ) ) ( OBJ-AT ?auto_226569 ?auto_226565 ) ( not ( = ?auto_226569 ?auto_226566 ) ) ( OBJ-AT ?auto_226566 ?auto_226570 ) ( OBJ-AT ?auto_226567 ?auto_226565 ) ( OBJ-AT ?auto_226568 ?auto_226565 ) ( not ( = ?auto_226566 ?auto_226567 ) ) ( not ( = ?auto_226566 ?auto_226568 ) ) ( not ( = ?auto_226567 ?auto_226568 ) ) ( not ( = ?auto_226567 ?auto_226569 ) ) ( not ( = ?auto_226568 ?auto_226569 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226569 ?auto_226566 ?auto_226565 )
      ( DELIVER-4PKG-VERIFY ?auto_226566 ?auto_226567 ?auto_226568 ?auto_226569 ?auto_226565 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226598 - OBJ
      ?auto_226599 - OBJ
      ?auto_226600 - OBJ
      ?auto_226601 - OBJ
      ?auto_226597 - LOCATION
    )
    :vars
    (
      ?auto_226604 - TRUCK
      ?auto_226602 - LOCATION
      ?auto_226605 - CITY
      ?auto_226603 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226604 ?auto_226602 ) ( IN-CITY ?auto_226602 ?auto_226605 ) ( IN-CITY ?auto_226597 ?auto_226605 ) ( not ( = ?auto_226597 ?auto_226602 ) ) ( OBJ-AT ?auto_226603 ?auto_226597 ) ( not ( = ?auto_226603 ?auto_226598 ) ) ( OBJ-AT ?auto_226598 ?auto_226602 ) ( OBJ-AT ?auto_226599 ?auto_226597 ) ( OBJ-AT ?auto_226600 ?auto_226597 ) ( OBJ-AT ?auto_226601 ?auto_226597 ) ( not ( = ?auto_226598 ?auto_226599 ) ) ( not ( = ?auto_226598 ?auto_226600 ) ) ( not ( = ?auto_226598 ?auto_226601 ) ) ( not ( = ?auto_226599 ?auto_226600 ) ) ( not ( = ?auto_226599 ?auto_226601 ) ) ( not ( = ?auto_226599 ?auto_226603 ) ) ( not ( = ?auto_226600 ?auto_226601 ) ) ( not ( = ?auto_226600 ?auto_226603 ) ) ( not ( = ?auto_226601 ?auto_226603 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226603 ?auto_226598 ?auto_226597 )
      ( DELIVER-4PKG-VERIFY ?auto_226598 ?auto_226599 ?auto_226600 ?auto_226601 ?auto_226597 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226736 - OBJ
      ?auto_226737 - OBJ
      ?auto_226738 - OBJ
      ?auto_226739 - OBJ
      ?auto_226740 - OBJ
      ?auto_226735 - LOCATION
    )
    :vars
    (
      ?auto_226742 - TRUCK
      ?auto_226741 - LOCATION
      ?auto_226743 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226742 ?auto_226741 ) ( IN-CITY ?auto_226741 ?auto_226743 ) ( IN-CITY ?auto_226735 ?auto_226743 ) ( not ( = ?auto_226735 ?auto_226741 ) ) ( OBJ-AT ?auto_226736 ?auto_226735 ) ( not ( = ?auto_226736 ?auto_226739 ) ) ( OBJ-AT ?auto_226739 ?auto_226741 ) ( OBJ-AT ?auto_226737 ?auto_226735 ) ( OBJ-AT ?auto_226738 ?auto_226735 ) ( OBJ-AT ?auto_226740 ?auto_226735 ) ( not ( = ?auto_226736 ?auto_226737 ) ) ( not ( = ?auto_226736 ?auto_226738 ) ) ( not ( = ?auto_226736 ?auto_226740 ) ) ( not ( = ?auto_226737 ?auto_226738 ) ) ( not ( = ?auto_226737 ?auto_226739 ) ) ( not ( = ?auto_226737 ?auto_226740 ) ) ( not ( = ?auto_226738 ?auto_226739 ) ) ( not ( = ?auto_226738 ?auto_226740 ) ) ( not ( = ?auto_226739 ?auto_226740 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226736 ?auto_226739 ?auto_226735 )
      ( DELIVER-5PKG-VERIFY ?auto_226736 ?auto_226737 ?auto_226738 ?auto_226739 ?auto_226740 ?auto_226735 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226763 - OBJ
      ?auto_226764 - OBJ
      ?auto_226765 - OBJ
      ?auto_226766 - OBJ
      ?auto_226767 - OBJ
      ?auto_226762 - LOCATION
    )
    :vars
    (
      ?auto_226769 - TRUCK
      ?auto_226768 - LOCATION
      ?auto_226770 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226769 ?auto_226768 ) ( IN-CITY ?auto_226768 ?auto_226770 ) ( IN-CITY ?auto_226762 ?auto_226770 ) ( not ( = ?auto_226762 ?auto_226768 ) ) ( OBJ-AT ?auto_226766 ?auto_226762 ) ( not ( = ?auto_226766 ?auto_226767 ) ) ( OBJ-AT ?auto_226767 ?auto_226768 ) ( OBJ-AT ?auto_226763 ?auto_226762 ) ( OBJ-AT ?auto_226764 ?auto_226762 ) ( OBJ-AT ?auto_226765 ?auto_226762 ) ( not ( = ?auto_226763 ?auto_226764 ) ) ( not ( = ?auto_226763 ?auto_226765 ) ) ( not ( = ?auto_226763 ?auto_226766 ) ) ( not ( = ?auto_226763 ?auto_226767 ) ) ( not ( = ?auto_226764 ?auto_226765 ) ) ( not ( = ?auto_226764 ?auto_226766 ) ) ( not ( = ?auto_226764 ?auto_226767 ) ) ( not ( = ?auto_226765 ?auto_226766 ) ) ( not ( = ?auto_226765 ?auto_226767 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226766 ?auto_226767 ?auto_226762 )
      ( DELIVER-5PKG-VERIFY ?auto_226763 ?auto_226764 ?auto_226765 ?auto_226766 ?auto_226767 ?auto_226762 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226808 - OBJ
      ?auto_226809 - OBJ
      ?auto_226810 - OBJ
      ?auto_226811 - OBJ
      ?auto_226812 - OBJ
      ?auto_226807 - LOCATION
    )
    :vars
    (
      ?auto_226814 - TRUCK
      ?auto_226813 - LOCATION
      ?auto_226815 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226814 ?auto_226813 ) ( IN-CITY ?auto_226813 ?auto_226815 ) ( IN-CITY ?auto_226807 ?auto_226815 ) ( not ( = ?auto_226807 ?auto_226813 ) ) ( OBJ-AT ?auto_226811 ?auto_226807 ) ( not ( = ?auto_226811 ?auto_226810 ) ) ( OBJ-AT ?auto_226810 ?auto_226813 ) ( OBJ-AT ?auto_226808 ?auto_226807 ) ( OBJ-AT ?auto_226809 ?auto_226807 ) ( OBJ-AT ?auto_226812 ?auto_226807 ) ( not ( = ?auto_226808 ?auto_226809 ) ) ( not ( = ?auto_226808 ?auto_226810 ) ) ( not ( = ?auto_226808 ?auto_226811 ) ) ( not ( = ?auto_226808 ?auto_226812 ) ) ( not ( = ?auto_226809 ?auto_226810 ) ) ( not ( = ?auto_226809 ?auto_226811 ) ) ( not ( = ?auto_226809 ?auto_226812 ) ) ( not ( = ?auto_226810 ?auto_226812 ) ) ( not ( = ?auto_226811 ?auto_226812 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226811 ?auto_226810 ?auto_226807 )
      ( DELIVER-5PKG-VERIFY ?auto_226808 ?auto_226809 ?auto_226810 ?auto_226811 ?auto_226812 ?auto_226807 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226979 - OBJ
      ?auto_226980 - OBJ
      ?auto_226981 - OBJ
      ?auto_226982 - OBJ
      ?auto_226983 - OBJ
      ?auto_226978 - LOCATION
    )
    :vars
    (
      ?auto_226985 - TRUCK
      ?auto_226984 - LOCATION
      ?auto_226986 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226985 ?auto_226984 ) ( IN-CITY ?auto_226984 ?auto_226986 ) ( IN-CITY ?auto_226978 ?auto_226986 ) ( not ( = ?auto_226978 ?auto_226984 ) ) ( OBJ-AT ?auto_226983 ?auto_226978 ) ( not ( = ?auto_226983 ?auto_226981 ) ) ( OBJ-AT ?auto_226981 ?auto_226984 ) ( OBJ-AT ?auto_226979 ?auto_226978 ) ( OBJ-AT ?auto_226980 ?auto_226978 ) ( OBJ-AT ?auto_226982 ?auto_226978 ) ( not ( = ?auto_226979 ?auto_226980 ) ) ( not ( = ?auto_226979 ?auto_226981 ) ) ( not ( = ?auto_226979 ?auto_226982 ) ) ( not ( = ?auto_226979 ?auto_226983 ) ) ( not ( = ?auto_226980 ?auto_226981 ) ) ( not ( = ?auto_226980 ?auto_226982 ) ) ( not ( = ?auto_226980 ?auto_226983 ) ) ( not ( = ?auto_226981 ?auto_226982 ) ) ( not ( = ?auto_226982 ?auto_226983 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226983 ?auto_226981 ?auto_226978 )
      ( DELIVER-5PKG-VERIFY ?auto_226979 ?auto_226980 ?auto_226981 ?auto_226982 ?auto_226983 ?auto_226978 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227060 - OBJ
      ?auto_227061 - OBJ
      ?auto_227062 - OBJ
      ?auto_227063 - OBJ
      ?auto_227064 - OBJ
      ?auto_227059 - LOCATION
    )
    :vars
    (
      ?auto_227066 - TRUCK
      ?auto_227065 - LOCATION
      ?auto_227067 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227066 ?auto_227065 ) ( IN-CITY ?auto_227065 ?auto_227067 ) ( IN-CITY ?auto_227059 ?auto_227067 ) ( not ( = ?auto_227059 ?auto_227065 ) ) ( OBJ-AT ?auto_227062 ?auto_227059 ) ( not ( = ?auto_227062 ?auto_227061 ) ) ( OBJ-AT ?auto_227061 ?auto_227065 ) ( OBJ-AT ?auto_227060 ?auto_227059 ) ( OBJ-AT ?auto_227063 ?auto_227059 ) ( OBJ-AT ?auto_227064 ?auto_227059 ) ( not ( = ?auto_227060 ?auto_227061 ) ) ( not ( = ?auto_227060 ?auto_227062 ) ) ( not ( = ?auto_227060 ?auto_227063 ) ) ( not ( = ?auto_227060 ?auto_227064 ) ) ( not ( = ?auto_227061 ?auto_227063 ) ) ( not ( = ?auto_227061 ?auto_227064 ) ) ( not ( = ?auto_227062 ?auto_227063 ) ) ( not ( = ?auto_227062 ?auto_227064 ) ) ( not ( = ?auto_227063 ?auto_227064 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227062 ?auto_227061 ?auto_227059 )
      ( DELIVER-5PKG-VERIFY ?auto_227060 ?auto_227061 ?auto_227062 ?auto_227063 ?auto_227064 ?auto_227059 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227069 - OBJ
      ?auto_227070 - OBJ
      ?auto_227071 - OBJ
      ?auto_227072 - OBJ
      ?auto_227073 - OBJ
      ?auto_227068 - LOCATION
    )
    :vars
    (
      ?auto_227075 - TRUCK
      ?auto_227074 - LOCATION
      ?auto_227076 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227075 ?auto_227074 ) ( IN-CITY ?auto_227074 ?auto_227076 ) ( IN-CITY ?auto_227068 ?auto_227076 ) ( not ( = ?auto_227068 ?auto_227074 ) ) ( OBJ-AT ?auto_227072 ?auto_227068 ) ( not ( = ?auto_227072 ?auto_227070 ) ) ( OBJ-AT ?auto_227070 ?auto_227074 ) ( OBJ-AT ?auto_227069 ?auto_227068 ) ( OBJ-AT ?auto_227071 ?auto_227068 ) ( OBJ-AT ?auto_227073 ?auto_227068 ) ( not ( = ?auto_227069 ?auto_227070 ) ) ( not ( = ?auto_227069 ?auto_227071 ) ) ( not ( = ?auto_227069 ?auto_227072 ) ) ( not ( = ?auto_227069 ?auto_227073 ) ) ( not ( = ?auto_227070 ?auto_227071 ) ) ( not ( = ?auto_227070 ?auto_227073 ) ) ( not ( = ?auto_227071 ?auto_227072 ) ) ( not ( = ?auto_227071 ?auto_227073 ) ) ( not ( = ?auto_227072 ?auto_227073 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227072 ?auto_227070 ?auto_227068 )
      ( DELIVER-5PKG-VERIFY ?auto_227069 ?auto_227070 ?auto_227071 ?auto_227072 ?auto_227073 ?auto_227068 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227303 - OBJ
      ?auto_227304 - OBJ
      ?auto_227305 - OBJ
      ?auto_227306 - OBJ
      ?auto_227307 - OBJ
      ?auto_227302 - LOCATION
    )
    :vars
    (
      ?auto_227309 - TRUCK
      ?auto_227308 - LOCATION
      ?auto_227310 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227309 ?auto_227308 ) ( IN-CITY ?auto_227308 ?auto_227310 ) ( IN-CITY ?auto_227302 ?auto_227310 ) ( not ( = ?auto_227302 ?auto_227308 ) ) ( OBJ-AT ?auto_227304 ?auto_227302 ) ( not ( = ?auto_227304 ?auto_227307 ) ) ( OBJ-AT ?auto_227307 ?auto_227308 ) ( OBJ-AT ?auto_227303 ?auto_227302 ) ( OBJ-AT ?auto_227305 ?auto_227302 ) ( OBJ-AT ?auto_227306 ?auto_227302 ) ( not ( = ?auto_227303 ?auto_227304 ) ) ( not ( = ?auto_227303 ?auto_227305 ) ) ( not ( = ?auto_227303 ?auto_227306 ) ) ( not ( = ?auto_227303 ?auto_227307 ) ) ( not ( = ?auto_227304 ?auto_227305 ) ) ( not ( = ?auto_227304 ?auto_227306 ) ) ( not ( = ?auto_227305 ?auto_227306 ) ) ( not ( = ?auto_227305 ?auto_227307 ) ) ( not ( = ?auto_227306 ?auto_227307 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227304 ?auto_227307 ?auto_227302 )
      ( DELIVER-5PKG-VERIFY ?auto_227303 ?auto_227304 ?auto_227305 ?auto_227306 ?auto_227307 ?auto_227302 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227312 - OBJ
      ?auto_227313 - OBJ
      ?auto_227314 - OBJ
      ?auto_227315 - OBJ
      ?auto_227316 - OBJ
      ?auto_227311 - LOCATION
    )
    :vars
    (
      ?auto_227318 - TRUCK
      ?auto_227317 - LOCATION
      ?auto_227319 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227318 ?auto_227317 ) ( IN-CITY ?auto_227317 ?auto_227319 ) ( IN-CITY ?auto_227311 ?auto_227319 ) ( not ( = ?auto_227311 ?auto_227317 ) ) ( OBJ-AT ?auto_227314 ?auto_227311 ) ( not ( = ?auto_227314 ?auto_227316 ) ) ( OBJ-AT ?auto_227316 ?auto_227317 ) ( OBJ-AT ?auto_227312 ?auto_227311 ) ( OBJ-AT ?auto_227313 ?auto_227311 ) ( OBJ-AT ?auto_227315 ?auto_227311 ) ( not ( = ?auto_227312 ?auto_227313 ) ) ( not ( = ?auto_227312 ?auto_227314 ) ) ( not ( = ?auto_227312 ?auto_227315 ) ) ( not ( = ?auto_227312 ?auto_227316 ) ) ( not ( = ?auto_227313 ?auto_227314 ) ) ( not ( = ?auto_227313 ?auto_227315 ) ) ( not ( = ?auto_227313 ?auto_227316 ) ) ( not ( = ?auto_227314 ?auto_227315 ) ) ( not ( = ?auto_227315 ?auto_227316 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227314 ?auto_227316 ?auto_227311 )
      ( DELIVER-5PKG-VERIFY ?auto_227312 ?auto_227313 ?auto_227314 ?auto_227315 ?auto_227316 ?auto_227311 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227321 - OBJ
      ?auto_227322 - OBJ
      ?auto_227323 - OBJ
      ?auto_227324 - OBJ
      ?auto_227325 - OBJ
      ?auto_227320 - LOCATION
    )
    :vars
    (
      ?auto_227327 - TRUCK
      ?auto_227326 - LOCATION
      ?auto_227328 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227327 ?auto_227326 ) ( IN-CITY ?auto_227326 ?auto_227328 ) ( IN-CITY ?auto_227320 ?auto_227328 ) ( not ( = ?auto_227320 ?auto_227326 ) ) ( OBJ-AT ?auto_227325 ?auto_227320 ) ( not ( = ?auto_227325 ?auto_227324 ) ) ( OBJ-AT ?auto_227324 ?auto_227326 ) ( OBJ-AT ?auto_227321 ?auto_227320 ) ( OBJ-AT ?auto_227322 ?auto_227320 ) ( OBJ-AT ?auto_227323 ?auto_227320 ) ( not ( = ?auto_227321 ?auto_227322 ) ) ( not ( = ?auto_227321 ?auto_227323 ) ) ( not ( = ?auto_227321 ?auto_227324 ) ) ( not ( = ?auto_227321 ?auto_227325 ) ) ( not ( = ?auto_227322 ?auto_227323 ) ) ( not ( = ?auto_227322 ?auto_227324 ) ) ( not ( = ?auto_227322 ?auto_227325 ) ) ( not ( = ?auto_227323 ?auto_227324 ) ) ( not ( = ?auto_227323 ?auto_227325 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227325 ?auto_227324 ?auto_227320 )
      ( DELIVER-5PKG-VERIFY ?auto_227321 ?auto_227322 ?auto_227323 ?auto_227324 ?auto_227325 ?auto_227320 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227366 - OBJ
      ?auto_227367 - OBJ
      ?auto_227368 - OBJ
      ?auto_227369 - OBJ
      ?auto_227370 - OBJ
      ?auto_227365 - LOCATION
    )
    :vars
    (
      ?auto_227372 - TRUCK
      ?auto_227371 - LOCATION
      ?auto_227373 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227372 ?auto_227371 ) ( IN-CITY ?auto_227371 ?auto_227373 ) ( IN-CITY ?auto_227365 ?auto_227373 ) ( not ( = ?auto_227365 ?auto_227371 ) ) ( OBJ-AT ?auto_227367 ?auto_227365 ) ( not ( = ?auto_227367 ?auto_227369 ) ) ( OBJ-AT ?auto_227369 ?auto_227371 ) ( OBJ-AT ?auto_227366 ?auto_227365 ) ( OBJ-AT ?auto_227368 ?auto_227365 ) ( OBJ-AT ?auto_227370 ?auto_227365 ) ( not ( = ?auto_227366 ?auto_227367 ) ) ( not ( = ?auto_227366 ?auto_227368 ) ) ( not ( = ?auto_227366 ?auto_227369 ) ) ( not ( = ?auto_227366 ?auto_227370 ) ) ( not ( = ?auto_227367 ?auto_227368 ) ) ( not ( = ?auto_227367 ?auto_227370 ) ) ( not ( = ?auto_227368 ?auto_227369 ) ) ( not ( = ?auto_227368 ?auto_227370 ) ) ( not ( = ?auto_227369 ?auto_227370 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227367 ?auto_227369 ?auto_227365 )
      ( DELIVER-5PKG-VERIFY ?auto_227366 ?auto_227367 ?auto_227368 ?auto_227369 ?auto_227370 ?auto_227365 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227402 - OBJ
      ?auto_227403 - OBJ
      ?auto_227404 - OBJ
      ?auto_227405 - OBJ
      ?auto_227406 - OBJ
      ?auto_227401 - LOCATION
    )
    :vars
    (
      ?auto_227408 - TRUCK
      ?auto_227407 - LOCATION
      ?auto_227409 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227408 ?auto_227407 ) ( IN-CITY ?auto_227407 ?auto_227409 ) ( IN-CITY ?auto_227401 ?auto_227409 ) ( not ( = ?auto_227401 ?auto_227407 ) ) ( OBJ-AT ?auto_227403 ?auto_227401 ) ( not ( = ?auto_227403 ?auto_227404 ) ) ( OBJ-AT ?auto_227404 ?auto_227407 ) ( OBJ-AT ?auto_227402 ?auto_227401 ) ( OBJ-AT ?auto_227405 ?auto_227401 ) ( OBJ-AT ?auto_227406 ?auto_227401 ) ( not ( = ?auto_227402 ?auto_227403 ) ) ( not ( = ?auto_227402 ?auto_227404 ) ) ( not ( = ?auto_227402 ?auto_227405 ) ) ( not ( = ?auto_227402 ?auto_227406 ) ) ( not ( = ?auto_227403 ?auto_227405 ) ) ( not ( = ?auto_227403 ?auto_227406 ) ) ( not ( = ?auto_227404 ?auto_227405 ) ) ( not ( = ?auto_227404 ?auto_227406 ) ) ( not ( = ?auto_227405 ?auto_227406 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227403 ?auto_227404 ?auto_227401 )
      ( DELIVER-5PKG-VERIFY ?auto_227402 ?auto_227403 ?auto_227404 ?auto_227405 ?auto_227406 ?auto_227401 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227528 - OBJ
      ?auto_227529 - OBJ
      ?auto_227530 - OBJ
      ?auto_227531 - OBJ
      ?auto_227532 - OBJ
      ?auto_227527 - LOCATION
    )
    :vars
    (
      ?auto_227535 - TRUCK
      ?auto_227533 - LOCATION
      ?auto_227536 - CITY
      ?auto_227534 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227535 ?auto_227533 ) ( IN-CITY ?auto_227533 ?auto_227536 ) ( IN-CITY ?auto_227527 ?auto_227536 ) ( not ( = ?auto_227527 ?auto_227533 ) ) ( OBJ-AT ?auto_227534 ?auto_227527 ) ( not ( = ?auto_227534 ?auto_227532 ) ) ( OBJ-AT ?auto_227532 ?auto_227533 ) ( OBJ-AT ?auto_227528 ?auto_227527 ) ( OBJ-AT ?auto_227529 ?auto_227527 ) ( OBJ-AT ?auto_227530 ?auto_227527 ) ( OBJ-AT ?auto_227531 ?auto_227527 ) ( not ( = ?auto_227528 ?auto_227529 ) ) ( not ( = ?auto_227528 ?auto_227530 ) ) ( not ( = ?auto_227528 ?auto_227531 ) ) ( not ( = ?auto_227528 ?auto_227532 ) ) ( not ( = ?auto_227528 ?auto_227534 ) ) ( not ( = ?auto_227529 ?auto_227530 ) ) ( not ( = ?auto_227529 ?auto_227531 ) ) ( not ( = ?auto_227529 ?auto_227532 ) ) ( not ( = ?auto_227529 ?auto_227534 ) ) ( not ( = ?auto_227530 ?auto_227531 ) ) ( not ( = ?auto_227530 ?auto_227532 ) ) ( not ( = ?auto_227530 ?auto_227534 ) ) ( not ( = ?auto_227531 ?auto_227532 ) ) ( not ( = ?auto_227531 ?auto_227534 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227534 ?auto_227532 ?auto_227527 )
      ( DELIVER-5PKG-VERIFY ?auto_227528 ?auto_227529 ?auto_227530 ?auto_227531 ?auto_227532 ?auto_227527 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227547 - OBJ
      ?auto_227548 - OBJ
      ?auto_227549 - OBJ
      ?auto_227550 - OBJ
      ?auto_227551 - OBJ
      ?auto_227546 - LOCATION
    )
    :vars
    (
      ?auto_227554 - TRUCK
      ?auto_227552 - LOCATION
      ?auto_227555 - CITY
      ?auto_227553 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227554 ?auto_227552 ) ( IN-CITY ?auto_227552 ?auto_227555 ) ( IN-CITY ?auto_227546 ?auto_227555 ) ( not ( = ?auto_227546 ?auto_227552 ) ) ( OBJ-AT ?auto_227553 ?auto_227546 ) ( not ( = ?auto_227553 ?auto_227550 ) ) ( OBJ-AT ?auto_227550 ?auto_227552 ) ( OBJ-AT ?auto_227547 ?auto_227546 ) ( OBJ-AT ?auto_227548 ?auto_227546 ) ( OBJ-AT ?auto_227549 ?auto_227546 ) ( OBJ-AT ?auto_227551 ?auto_227546 ) ( not ( = ?auto_227547 ?auto_227548 ) ) ( not ( = ?auto_227547 ?auto_227549 ) ) ( not ( = ?auto_227547 ?auto_227550 ) ) ( not ( = ?auto_227547 ?auto_227551 ) ) ( not ( = ?auto_227547 ?auto_227553 ) ) ( not ( = ?auto_227548 ?auto_227549 ) ) ( not ( = ?auto_227548 ?auto_227550 ) ) ( not ( = ?auto_227548 ?auto_227551 ) ) ( not ( = ?auto_227548 ?auto_227553 ) ) ( not ( = ?auto_227549 ?auto_227550 ) ) ( not ( = ?auto_227549 ?auto_227551 ) ) ( not ( = ?auto_227549 ?auto_227553 ) ) ( not ( = ?auto_227550 ?auto_227551 ) ) ( not ( = ?auto_227551 ?auto_227553 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227553 ?auto_227550 ?auto_227546 )
      ( DELIVER-5PKG-VERIFY ?auto_227547 ?auto_227548 ?auto_227549 ?auto_227550 ?auto_227551 ?auto_227546 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227603 - OBJ
      ?auto_227604 - OBJ
      ?auto_227605 - OBJ
      ?auto_227606 - OBJ
      ?auto_227607 - OBJ
      ?auto_227602 - LOCATION
    )
    :vars
    (
      ?auto_227610 - TRUCK
      ?auto_227608 - LOCATION
      ?auto_227611 - CITY
      ?auto_227609 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227610 ?auto_227608 ) ( IN-CITY ?auto_227608 ?auto_227611 ) ( IN-CITY ?auto_227602 ?auto_227611 ) ( not ( = ?auto_227602 ?auto_227608 ) ) ( OBJ-AT ?auto_227609 ?auto_227602 ) ( not ( = ?auto_227609 ?auto_227605 ) ) ( OBJ-AT ?auto_227605 ?auto_227608 ) ( OBJ-AT ?auto_227603 ?auto_227602 ) ( OBJ-AT ?auto_227604 ?auto_227602 ) ( OBJ-AT ?auto_227606 ?auto_227602 ) ( OBJ-AT ?auto_227607 ?auto_227602 ) ( not ( = ?auto_227603 ?auto_227604 ) ) ( not ( = ?auto_227603 ?auto_227605 ) ) ( not ( = ?auto_227603 ?auto_227606 ) ) ( not ( = ?auto_227603 ?auto_227607 ) ) ( not ( = ?auto_227603 ?auto_227609 ) ) ( not ( = ?auto_227604 ?auto_227605 ) ) ( not ( = ?auto_227604 ?auto_227606 ) ) ( not ( = ?auto_227604 ?auto_227607 ) ) ( not ( = ?auto_227604 ?auto_227609 ) ) ( not ( = ?auto_227605 ?auto_227606 ) ) ( not ( = ?auto_227605 ?auto_227607 ) ) ( not ( = ?auto_227606 ?auto_227607 ) ) ( not ( = ?auto_227606 ?auto_227609 ) ) ( not ( = ?auto_227607 ?auto_227609 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227609 ?auto_227605 ?auto_227602 )
      ( DELIVER-5PKG-VERIFY ?auto_227603 ?auto_227604 ?auto_227605 ?auto_227606 ?auto_227607 ?auto_227602 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227652 - OBJ
      ?auto_227653 - OBJ
      ?auto_227654 - OBJ
      ?auto_227655 - OBJ
      ?auto_227656 - OBJ
      ?auto_227651 - LOCATION
    )
    :vars
    (
      ?auto_227658 - TRUCK
      ?auto_227657 - LOCATION
      ?auto_227659 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227658 ?auto_227657 ) ( IN-CITY ?auto_227657 ?auto_227659 ) ( IN-CITY ?auto_227651 ?auto_227659 ) ( not ( = ?auto_227651 ?auto_227657 ) ) ( OBJ-AT ?auto_227656 ?auto_227651 ) ( not ( = ?auto_227656 ?auto_227653 ) ) ( OBJ-AT ?auto_227653 ?auto_227657 ) ( OBJ-AT ?auto_227652 ?auto_227651 ) ( OBJ-AT ?auto_227654 ?auto_227651 ) ( OBJ-AT ?auto_227655 ?auto_227651 ) ( not ( = ?auto_227652 ?auto_227653 ) ) ( not ( = ?auto_227652 ?auto_227654 ) ) ( not ( = ?auto_227652 ?auto_227655 ) ) ( not ( = ?auto_227652 ?auto_227656 ) ) ( not ( = ?auto_227653 ?auto_227654 ) ) ( not ( = ?auto_227653 ?auto_227655 ) ) ( not ( = ?auto_227654 ?auto_227655 ) ) ( not ( = ?auto_227654 ?auto_227656 ) ) ( not ( = ?auto_227655 ?auto_227656 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227656 ?auto_227653 ?auto_227651 )
      ( DELIVER-5PKG-VERIFY ?auto_227652 ?auto_227653 ?auto_227654 ?auto_227655 ?auto_227656 ?auto_227651 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227769 - OBJ
      ?auto_227770 - OBJ
      ?auto_227771 - OBJ
      ?auto_227772 - OBJ
      ?auto_227773 - OBJ
      ?auto_227768 - LOCATION
    )
    :vars
    (
      ?auto_227776 - TRUCK
      ?auto_227774 - LOCATION
      ?auto_227777 - CITY
      ?auto_227775 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227776 ?auto_227774 ) ( IN-CITY ?auto_227774 ?auto_227777 ) ( IN-CITY ?auto_227768 ?auto_227777 ) ( not ( = ?auto_227768 ?auto_227774 ) ) ( OBJ-AT ?auto_227775 ?auto_227768 ) ( not ( = ?auto_227775 ?auto_227770 ) ) ( OBJ-AT ?auto_227770 ?auto_227774 ) ( OBJ-AT ?auto_227769 ?auto_227768 ) ( OBJ-AT ?auto_227771 ?auto_227768 ) ( OBJ-AT ?auto_227772 ?auto_227768 ) ( OBJ-AT ?auto_227773 ?auto_227768 ) ( not ( = ?auto_227769 ?auto_227770 ) ) ( not ( = ?auto_227769 ?auto_227771 ) ) ( not ( = ?auto_227769 ?auto_227772 ) ) ( not ( = ?auto_227769 ?auto_227773 ) ) ( not ( = ?auto_227769 ?auto_227775 ) ) ( not ( = ?auto_227770 ?auto_227771 ) ) ( not ( = ?auto_227770 ?auto_227772 ) ) ( not ( = ?auto_227770 ?auto_227773 ) ) ( not ( = ?auto_227771 ?auto_227772 ) ) ( not ( = ?auto_227771 ?auto_227773 ) ) ( not ( = ?auto_227771 ?auto_227775 ) ) ( not ( = ?auto_227772 ?auto_227773 ) ) ( not ( = ?auto_227772 ?auto_227775 ) ) ( not ( = ?auto_227773 ?auto_227775 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227775 ?auto_227770 ?auto_227768 )
      ( DELIVER-5PKG-VERIFY ?auto_227769 ?auto_227770 ?auto_227771 ?auto_227772 ?auto_227773 ?auto_227768 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227903 - OBJ
      ?auto_227904 - OBJ
      ?auto_227905 - OBJ
      ?auto_227906 - OBJ
      ?auto_227907 - OBJ
      ?auto_227902 - LOCATION
    )
    :vars
    (
      ?auto_227909 - TRUCK
      ?auto_227908 - LOCATION
      ?auto_227910 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227909 ?auto_227908 ) ( IN-CITY ?auto_227908 ?auto_227910 ) ( IN-CITY ?auto_227902 ?auto_227910 ) ( not ( = ?auto_227902 ?auto_227908 ) ) ( OBJ-AT ?auto_227906 ?auto_227902 ) ( not ( = ?auto_227906 ?auto_227903 ) ) ( OBJ-AT ?auto_227903 ?auto_227908 ) ( OBJ-AT ?auto_227904 ?auto_227902 ) ( OBJ-AT ?auto_227905 ?auto_227902 ) ( OBJ-AT ?auto_227907 ?auto_227902 ) ( not ( = ?auto_227903 ?auto_227904 ) ) ( not ( = ?auto_227903 ?auto_227905 ) ) ( not ( = ?auto_227903 ?auto_227907 ) ) ( not ( = ?auto_227904 ?auto_227905 ) ) ( not ( = ?auto_227904 ?auto_227906 ) ) ( not ( = ?auto_227904 ?auto_227907 ) ) ( not ( = ?auto_227905 ?auto_227906 ) ) ( not ( = ?auto_227905 ?auto_227907 ) ) ( not ( = ?auto_227906 ?auto_227907 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227906 ?auto_227903 ?auto_227902 )
      ( DELIVER-5PKG-VERIFY ?auto_227903 ?auto_227904 ?auto_227905 ?auto_227906 ?auto_227907 ?auto_227902 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227930 - OBJ
      ?auto_227931 - OBJ
      ?auto_227932 - OBJ
      ?auto_227933 - OBJ
      ?auto_227934 - OBJ
      ?auto_227929 - LOCATION
    )
    :vars
    (
      ?auto_227936 - TRUCK
      ?auto_227935 - LOCATION
      ?auto_227937 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227936 ?auto_227935 ) ( IN-CITY ?auto_227935 ?auto_227937 ) ( IN-CITY ?auto_227929 ?auto_227937 ) ( not ( = ?auto_227929 ?auto_227935 ) ) ( OBJ-AT ?auto_227932 ?auto_227929 ) ( not ( = ?auto_227932 ?auto_227930 ) ) ( OBJ-AT ?auto_227930 ?auto_227935 ) ( OBJ-AT ?auto_227931 ?auto_227929 ) ( OBJ-AT ?auto_227933 ?auto_227929 ) ( OBJ-AT ?auto_227934 ?auto_227929 ) ( not ( = ?auto_227930 ?auto_227931 ) ) ( not ( = ?auto_227930 ?auto_227933 ) ) ( not ( = ?auto_227930 ?auto_227934 ) ) ( not ( = ?auto_227931 ?auto_227932 ) ) ( not ( = ?auto_227931 ?auto_227933 ) ) ( not ( = ?auto_227931 ?auto_227934 ) ) ( not ( = ?auto_227932 ?auto_227933 ) ) ( not ( = ?auto_227932 ?auto_227934 ) ) ( not ( = ?auto_227933 ?auto_227934 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227932 ?auto_227930 ?auto_227929 )
      ( DELIVER-5PKG-VERIFY ?auto_227930 ?auto_227931 ?auto_227932 ?auto_227933 ?auto_227934 ?auto_227929 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227984 - OBJ
      ?auto_227985 - OBJ
      ?auto_227986 - OBJ
      ?auto_227987 - OBJ
      ?auto_227988 - OBJ
      ?auto_227983 - LOCATION
    )
    :vars
    (
      ?auto_227990 - TRUCK
      ?auto_227989 - LOCATION
      ?auto_227991 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227990 ?auto_227989 ) ( IN-CITY ?auto_227989 ?auto_227991 ) ( IN-CITY ?auto_227983 ?auto_227991 ) ( not ( = ?auto_227983 ?auto_227989 ) ) ( OBJ-AT ?auto_227985 ?auto_227983 ) ( not ( = ?auto_227985 ?auto_227984 ) ) ( OBJ-AT ?auto_227984 ?auto_227989 ) ( OBJ-AT ?auto_227986 ?auto_227983 ) ( OBJ-AT ?auto_227987 ?auto_227983 ) ( OBJ-AT ?auto_227988 ?auto_227983 ) ( not ( = ?auto_227984 ?auto_227986 ) ) ( not ( = ?auto_227984 ?auto_227987 ) ) ( not ( = ?auto_227984 ?auto_227988 ) ) ( not ( = ?auto_227985 ?auto_227986 ) ) ( not ( = ?auto_227985 ?auto_227987 ) ) ( not ( = ?auto_227985 ?auto_227988 ) ) ( not ( = ?auto_227986 ?auto_227987 ) ) ( not ( = ?auto_227986 ?auto_227988 ) ) ( not ( = ?auto_227987 ?auto_227988 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227985 ?auto_227984 ?auto_227983 )
      ( DELIVER-5PKG-VERIFY ?auto_227984 ?auto_227985 ?auto_227986 ?auto_227987 ?auto_227988 ?auto_227983 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_228263 - OBJ
      ?auto_228264 - OBJ
      ?auto_228265 - OBJ
      ?auto_228266 - OBJ
      ?auto_228267 - OBJ
      ?auto_228262 - LOCATION
    )
    :vars
    (
      ?auto_228270 - TRUCK
      ?auto_228268 - LOCATION
      ?auto_228271 - CITY
      ?auto_228269 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_228270 ?auto_228268 ) ( IN-CITY ?auto_228268 ?auto_228271 ) ( IN-CITY ?auto_228262 ?auto_228271 ) ( not ( = ?auto_228262 ?auto_228268 ) ) ( OBJ-AT ?auto_228269 ?auto_228262 ) ( not ( = ?auto_228269 ?auto_228263 ) ) ( OBJ-AT ?auto_228263 ?auto_228268 ) ( OBJ-AT ?auto_228264 ?auto_228262 ) ( OBJ-AT ?auto_228265 ?auto_228262 ) ( OBJ-AT ?auto_228266 ?auto_228262 ) ( OBJ-AT ?auto_228267 ?auto_228262 ) ( not ( = ?auto_228263 ?auto_228264 ) ) ( not ( = ?auto_228263 ?auto_228265 ) ) ( not ( = ?auto_228263 ?auto_228266 ) ) ( not ( = ?auto_228263 ?auto_228267 ) ) ( not ( = ?auto_228264 ?auto_228265 ) ) ( not ( = ?auto_228264 ?auto_228266 ) ) ( not ( = ?auto_228264 ?auto_228267 ) ) ( not ( = ?auto_228264 ?auto_228269 ) ) ( not ( = ?auto_228265 ?auto_228266 ) ) ( not ( = ?auto_228265 ?auto_228267 ) ) ( not ( = ?auto_228265 ?auto_228269 ) ) ( not ( = ?auto_228266 ?auto_228267 ) ) ( not ( = ?auto_228266 ?auto_228269 ) ) ( not ( = ?auto_228267 ?auto_228269 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228269 ?auto_228263 ?auto_228262 )
      ( DELIVER-5PKG-VERIFY ?auto_228263 ?auto_228264 ?auto_228265 ?auto_228266 ?auto_228267 ?auto_228262 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_228712 - OBJ
      ?auto_228713 - OBJ
      ?auto_228714 - OBJ
      ?auto_228711 - LOCATION
    )
    :vars
    (
      ?auto_228717 - LOCATION
      ?auto_228715 - CITY
      ?auto_228718 - OBJ
      ?auto_228716 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228717 ?auto_228715 ) ( IN-CITY ?auto_228711 ?auto_228715 ) ( not ( = ?auto_228711 ?auto_228717 ) ) ( OBJ-AT ?auto_228718 ?auto_228711 ) ( not ( = ?auto_228718 ?auto_228714 ) ) ( OBJ-AT ?auto_228714 ?auto_228717 ) ( TRUCK-AT ?auto_228716 ?auto_228711 ) ( OBJ-AT ?auto_228712 ?auto_228711 ) ( OBJ-AT ?auto_228713 ?auto_228711 ) ( not ( = ?auto_228712 ?auto_228713 ) ) ( not ( = ?auto_228712 ?auto_228714 ) ) ( not ( = ?auto_228712 ?auto_228718 ) ) ( not ( = ?auto_228713 ?auto_228714 ) ) ( not ( = ?auto_228713 ?auto_228718 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228718 ?auto_228714 ?auto_228711 )
      ( DELIVER-3PKG-VERIFY ?auto_228712 ?auto_228713 ?auto_228714 ?auto_228711 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_228724 - OBJ
      ?auto_228725 - OBJ
      ?auto_228726 - OBJ
      ?auto_228723 - LOCATION
    )
    :vars
    (
      ?auto_228729 - LOCATION
      ?auto_228727 - CITY
      ?auto_228730 - OBJ
      ?auto_228728 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228729 ?auto_228727 ) ( IN-CITY ?auto_228723 ?auto_228727 ) ( not ( = ?auto_228723 ?auto_228729 ) ) ( OBJ-AT ?auto_228730 ?auto_228723 ) ( not ( = ?auto_228730 ?auto_228725 ) ) ( OBJ-AT ?auto_228725 ?auto_228729 ) ( TRUCK-AT ?auto_228728 ?auto_228723 ) ( OBJ-AT ?auto_228724 ?auto_228723 ) ( OBJ-AT ?auto_228726 ?auto_228723 ) ( not ( = ?auto_228724 ?auto_228725 ) ) ( not ( = ?auto_228724 ?auto_228726 ) ) ( not ( = ?auto_228724 ?auto_228730 ) ) ( not ( = ?auto_228725 ?auto_228726 ) ) ( not ( = ?auto_228726 ?auto_228730 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228730 ?auto_228725 ?auto_228723 )
      ( DELIVER-3PKG-VERIFY ?auto_228724 ?auto_228725 ?auto_228726 ?auto_228723 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_228740 - OBJ
      ?auto_228741 - OBJ
      ?auto_228742 - OBJ
      ?auto_228739 - LOCATION
    )
    :vars
    (
      ?auto_228745 - LOCATION
      ?auto_228743 - CITY
      ?auto_228744 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228745 ?auto_228743 ) ( IN-CITY ?auto_228739 ?auto_228743 ) ( not ( = ?auto_228739 ?auto_228745 ) ) ( OBJ-AT ?auto_228742 ?auto_228739 ) ( not ( = ?auto_228742 ?auto_228740 ) ) ( OBJ-AT ?auto_228740 ?auto_228745 ) ( TRUCK-AT ?auto_228744 ?auto_228739 ) ( OBJ-AT ?auto_228741 ?auto_228739 ) ( not ( = ?auto_228740 ?auto_228741 ) ) ( not ( = ?auto_228741 ?auto_228742 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228742 ?auto_228740 ?auto_228739 )
      ( DELIVER-3PKG-VERIFY ?auto_228740 ?auto_228741 ?auto_228742 ?auto_228739 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_228762 - OBJ
      ?auto_228763 - OBJ
      ?auto_228764 - OBJ
      ?auto_228761 - LOCATION
    )
    :vars
    (
      ?auto_228767 - LOCATION
      ?auto_228765 - CITY
      ?auto_228768 - OBJ
      ?auto_228766 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228767 ?auto_228765 ) ( IN-CITY ?auto_228761 ?auto_228765 ) ( not ( = ?auto_228761 ?auto_228767 ) ) ( OBJ-AT ?auto_228768 ?auto_228761 ) ( not ( = ?auto_228768 ?auto_228762 ) ) ( OBJ-AT ?auto_228762 ?auto_228767 ) ( TRUCK-AT ?auto_228766 ?auto_228761 ) ( OBJ-AT ?auto_228763 ?auto_228761 ) ( OBJ-AT ?auto_228764 ?auto_228761 ) ( not ( = ?auto_228762 ?auto_228763 ) ) ( not ( = ?auto_228762 ?auto_228764 ) ) ( not ( = ?auto_228763 ?auto_228764 ) ) ( not ( = ?auto_228763 ?auto_228768 ) ) ( not ( = ?auto_228764 ?auto_228768 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228768 ?auto_228762 ?auto_228761 )
      ( DELIVER-3PKG-VERIFY ?auto_228762 ?auto_228763 ?auto_228764 ?auto_228761 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_228809 - OBJ
      ?auto_228810 - OBJ
      ?auto_228811 - OBJ
      ?auto_228812 - OBJ
      ?auto_228808 - LOCATION
    )
    :vars
    (
      ?auto_228815 - LOCATION
      ?auto_228813 - CITY
      ?auto_228814 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228815 ?auto_228813 ) ( IN-CITY ?auto_228808 ?auto_228813 ) ( not ( = ?auto_228808 ?auto_228815 ) ) ( OBJ-AT ?auto_228809 ?auto_228808 ) ( not ( = ?auto_228809 ?auto_228812 ) ) ( OBJ-AT ?auto_228812 ?auto_228815 ) ( TRUCK-AT ?auto_228814 ?auto_228808 ) ( OBJ-AT ?auto_228810 ?auto_228808 ) ( OBJ-AT ?auto_228811 ?auto_228808 ) ( not ( = ?auto_228809 ?auto_228810 ) ) ( not ( = ?auto_228809 ?auto_228811 ) ) ( not ( = ?auto_228810 ?auto_228811 ) ) ( not ( = ?auto_228810 ?auto_228812 ) ) ( not ( = ?auto_228811 ?auto_228812 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228809 ?auto_228812 ?auto_228808 )
      ( DELIVER-4PKG-VERIFY ?auto_228809 ?auto_228810 ?auto_228811 ?auto_228812 ?auto_228808 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_228817 - OBJ
      ?auto_228818 - OBJ
      ?auto_228819 - OBJ
      ?auto_228820 - OBJ
      ?auto_228816 - LOCATION
    )
    :vars
    (
      ?auto_228823 - LOCATION
      ?auto_228821 - CITY
      ?auto_228822 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228823 ?auto_228821 ) ( IN-CITY ?auto_228816 ?auto_228821 ) ( not ( = ?auto_228816 ?auto_228823 ) ) ( OBJ-AT ?auto_228817 ?auto_228816 ) ( not ( = ?auto_228817 ?auto_228819 ) ) ( OBJ-AT ?auto_228819 ?auto_228823 ) ( TRUCK-AT ?auto_228822 ?auto_228816 ) ( OBJ-AT ?auto_228818 ?auto_228816 ) ( OBJ-AT ?auto_228820 ?auto_228816 ) ( not ( = ?auto_228817 ?auto_228818 ) ) ( not ( = ?auto_228817 ?auto_228820 ) ) ( not ( = ?auto_228818 ?auto_228819 ) ) ( not ( = ?auto_228818 ?auto_228820 ) ) ( not ( = ?auto_228819 ?auto_228820 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228817 ?auto_228819 ?auto_228816 )
      ( DELIVER-4PKG-VERIFY ?auto_228817 ?auto_228818 ?auto_228819 ?auto_228820 ?auto_228816 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_228881 - OBJ
      ?auto_228882 - OBJ
      ?auto_228883 - OBJ
      ?auto_228884 - OBJ
      ?auto_228880 - LOCATION
    )
    :vars
    (
      ?auto_228887 - LOCATION
      ?auto_228885 - CITY
      ?auto_228886 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228887 ?auto_228885 ) ( IN-CITY ?auto_228880 ?auto_228885 ) ( not ( = ?auto_228880 ?auto_228887 ) ) ( OBJ-AT ?auto_228884 ?auto_228880 ) ( not ( = ?auto_228884 ?auto_228882 ) ) ( OBJ-AT ?auto_228882 ?auto_228887 ) ( TRUCK-AT ?auto_228886 ?auto_228880 ) ( OBJ-AT ?auto_228881 ?auto_228880 ) ( OBJ-AT ?auto_228883 ?auto_228880 ) ( not ( = ?auto_228881 ?auto_228882 ) ) ( not ( = ?auto_228881 ?auto_228883 ) ) ( not ( = ?auto_228881 ?auto_228884 ) ) ( not ( = ?auto_228882 ?auto_228883 ) ) ( not ( = ?auto_228883 ?auto_228884 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228884 ?auto_228882 ?auto_228880 )
      ( DELIVER-4PKG-VERIFY ?auto_228881 ?auto_228882 ?auto_228883 ?auto_228884 ?auto_228880 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_228905 - OBJ
      ?auto_228906 - OBJ
      ?auto_228907 - OBJ
      ?auto_228908 - OBJ
      ?auto_228904 - LOCATION
    )
    :vars
    (
      ?auto_228911 - LOCATION
      ?auto_228909 - CITY
      ?auto_228910 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228911 ?auto_228909 ) ( IN-CITY ?auto_228904 ?auto_228909 ) ( not ( = ?auto_228904 ?auto_228911 ) ) ( OBJ-AT ?auto_228905 ?auto_228904 ) ( not ( = ?auto_228905 ?auto_228906 ) ) ( OBJ-AT ?auto_228906 ?auto_228911 ) ( TRUCK-AT ?auto_228910 ?auto_228904 ) ( OBJ-AT ?auto_228907 ?auto_228904 ) ( OBJ-AT ?auto_228908 ?auto_228904 ) ( not ( = ?auto_228905 ?auto_228907 ) ) ( not ( = ?auto_228905 ?auto_228908 ) ) ( not ( = ?auto_228906 ?auto_228907 ) ) ( not ( = ?auto_228906 ?auto_228908 ) ) ( not ( = ?auto_228907 ?auto_228908 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228905 ?auto_228906 ?auto_228904 )
      ( DELIVER-4PKG-VERIFY ?auto_228905 ?auto_228906 ?auto_228907 ?auto_228908 ?auto_228904 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_228969 - OBJ
      ?auto_228970 - OBJ
      ?auto_228971 - OBJ
      ?auto_228972 - OBJ
      ?auto_228968 - LOCATION
    )
    :vars
    (
      ?auto_228975 - LOCATION
      ?auto_228973 - CITY
      ?auto_228974 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228975 ?auto_228973 ) ( IN-CITY ?auto_228968 ?auto_228973 ) ( not ( = ?auto_228968 ?auto_228975 ) ) ( OBJ-AT ?auto_228970 ?auto_228968 ) ( not ( = ?auto_228970 ?auto_228971 ) ) ( OBJ-AT ?auto_228971 ?auto_228975 ) ( TRUCK-AT ?auto_228974 ?auto_228968 ) ( OBJ-AT ?auto_228969 ?auto_228968 ) ( OBJ-AT ?auto_228972 ?auto_228968 ) ( not ( = ?auto_228969 ?auto_228970 ) ) ( not ( = ?auto_228969 ?auto_228971 ) ) ( not ( = ?auto_228969 ?auto_228972 ) ) ( not ( = ?auto_228970 ?auto_228972 ) ) ( not ( = ?auto_228971 ?auto_228972 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228970 ?auto_228971 ?auto_228968 )
      ( DELIVER-4PKG-VERIFY ?auto_228969 ?auto_228970 ?auto_228971 ?auto_228972 ?auto_228968 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_228993 - OBJ
      ?auto_228994 - OBJ
      ?auto_228995 - OBJ
      ?auto_228996 - OBJ
      ?auto_228992 - LOCATION
    )
    :vars
    (
      ?auto_228999 - LOCATION
      ?auto_228997 - CITY
      ?auto_228998 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228999 ?auto_228997 ) ( IN-CITY ?auto_228992 ?auto_228997 ) ( not ( = ?auto_228992 ?auto_228999 ) ) ( OBJ-AT ?auto_228995 ?auto_228992 ) ( not ( = ?auto_228995 ?auto_228996 ) ) ( OBJ-AT ?auto_228996 ?auto_228999 ) ( TRUCK-AT ?auto_228998 ?auto_228992 ) ( OBJ-AT ?auto_228993 ?auto_228992 ) ( OBJ-AT ?auto_228994 ?auto_228992 ) ( not ( = ?auto_228993 ?auto_228994 ) ) ( not ( = ?auto_228993 ?auto_228995 ) ) ( not ( = ?auto_228993 ?auto_228996 ) ) ( not ( = ?auto_228994 ?auto_228995 ) ) ( not ( = ?auto_228994 ?auto_228996 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228995 ?auto_228996 ?auto_228992 )
      ( DELIVER-4PKG-VERIFY ?auto_228993 ?auto_228994 ?auto_228995 ?auto_228996 ?auto_228992 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229001 - OBJ
      ?auto_229002 - OBJ
      ?auto_229003 - OBJ
      ?auto_229004 - OBJ
      ?auto_229000 - LOCATION
    )
    :vars
    (
      ?auto_229007 - LOCATION
      ?auto_229005 - CITY
      ?auto_229008 - OBJ
      ?auto_229006 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229007 ?auto_229005 ) ( IN-CITY ?auto_229000 ?auto_229005 ) ( not ( = ?auto_229000 ?auto_229007 ) ) ( OBJ-AT ?auto_229008 ?auto_229000 ) ( not ( = ?auto_229008 ?auto_229004 ) ) ( OBJ-AT ?auto_229004 ?auto_229007 ) ( TRUCK-AT ?auto_229006 ?auto_229000 ) ( OBJ-AT ?auto_229001 ?auto_229000 ) ( OBJ-AT ?auto_229002 ?auto_229000 ) ( OBJ-AT ?auto_229003 ?auto_229000 ) ( not ( = ?auto_229001 ?auto_229002 ) ) ( not ( = ?auto_229001 ?auto_229003 ) ) ( not ( = ?auto_229001 ?auto_229004 ) ) ( not ( = ?auto_229001 ?auto_229008 ) ) ( not ( = ?auto_229002 ?auto_229003 ) ) ( not ( = ?auto_229002 ?auto_229004 ) ) ( not ( = ?auto_229002 ?auto_229008 ) ) ( not ( = ?auto_229003 ?auto_229004 ) ) ( not ( = ?auto_229003 ?auto_229008 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229008 ?auto_229004 ?auto_229000 )
      ( DELIVER-4PKG-VERIFY ?auto_229001 ?auto_229002 ?auto_229003 ?auto_229004 ?auto_229000 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229018 - OBJ
      ?auto_229019 - OBJ
      ?auto_229020 - OBJ
      ?auto_229021 - OBJ
      ?auto_229017 - LOCATION
    )
    :vars
    (
      ?auto_229024 - LOCATION
      ?auto_229022 - CITY
      ?auto_229025 - OBJ
      ?auto_229023 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229024 ?auto_229022 ) ( IN-CITY ?auto_229017 ?auto_229022 ) ( not ( = ?auto_229017 ?auto_229024 ) ) ( OBJ-AT ?auto_229025 ?auto_229017 ) ( not ( = ?auto_229025 ?auto_229020 ) ) ( OBJ-AT ?auto_229020 ?auto_229024 ) ( TRUCK-AT ?auto_229023 ?auto_229017 ) ( OBJ-AT ?auto_229018 ?auto_229017 ) ( OBJ-AT ?auto_229019 ?auto_229017 ) ( OBJ-AT ?auto_229021 ?auto_229017 ) ( not ( = ?auto_229018 ?auto_229019 ) ) ( not ( = ?auto_229018 ?auto_229020 ) ) ( not ( = ?auto_229018 ?auto_229021 ) ) ( not ( = ?auto_229018 ?auto_229025 ) ) ( not ( = ?auto_229019 ?auto_229020 ) ) ( not ( = ?auto_229019 ?auto_229021 ) ) ( not ( = ?auto_229019 ?auto_229025 ) ) ( not ( = ?auto_229020 ?auto_229021 ) ) ( not ( = ?auto_229021 ?auto_229025 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229025 ?auto_229020 ?auto_229017 )
      ( DELIVER-4PKG-VERIFY ?auto_229018 ?auto_229019 ?auto_229020 ?auto_229021 ?auto_229017 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229068 - OBJ
      ?auto_229069 - OBJ
      ?auto_229070 - OBJ
      ?auto_229071 - OBJ
      ?auto_229067 - LOCATION
    )
    :vars
    (
      ?auto_229074 - LOCATION
      ?auto_229072 - CITY
      ?auto_229075 - OBJ
      ?auto_229073 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229074 ?auto_229072 ) ( IN-CITY ?auto_229067 ?auto_229072 ) ( not ( = ?auto_229067 ?auto_229074 ) ) ( OBJ-AT ?auto_229075 ?auto_229067 ) ( not ( = ?auto_229075 ?auto_229069 ) ) ( OBJ-AT ?auto_229069 ?auto_229074 ) ( TRUCK-AT ?auto_229073 ?auto_229067 ) ( OBJ-AT ?auto_229068 ?auto_229067 ) ( OBJ-AT ?auto_229070 ?auto_229067 ) ( OBJ-AT ?auto_229071 ?auto_229067 ) ( not ( = ?auto_229068 ?auto_229069 ) ) ( not ( = ?auto_229068 ?auto_229070 ) ) ( not ( = ?auto_229068 ?auto_229071 ) ) ( not ( = ?auto_229068 ?auto_229075 ) ) ( not ( = ?auto_229069 ?auto_229070 ) ) ( not ( = ?auto_229069 ?auto_229071 ) ) ( not ( = ?auto_229070 ?auto_229071 ) ) ( not ( = ?auto_229070 ?auto_229075 ) ) ( not ( = ?auto_229071 ?auto_229075 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229075 ?auto_229069 ?auto_229067 )
      ( DELIVER-4PKG-VERIFY ?auto_229068 ?auto_229069 ?auto_229070 ?auto_229071 ?auto_229067 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229112 - OBJ
      ?auto_229113 - OBJ
      ?auto_229114 - OBJ
      ?auto_229115 - OBJ
      ?auto_229111 - LOCATION
    )
    :vars
    (
      ?auto_229118 - LOCATION
      ?auto_229116 - CITY
      ?auto_229117 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229118 ?auto_229116 ) ( IN-CITY ?auto_229111 ?auto_229116 ) ( not ( = ?auto_229111 ?auto_229118 ) ) ( OBJ-AT ?auto_229113 ?auto_229111 ) ( not ( = ?auto_229113 ?auto_229112 ) ) ( OBJ-AT ?auto_229112 ?auto_229118 ) ( TRUCK-AT ?auto_229117 ?auto_229111 ) ( OBJ-AT ?auto_229114 ?auto_229111 ) ( OBJ-AT ?auto_229115 ?auto_229111 ) ( not ( = ?auto_229112 ?auto_229114 ) ) ( not ( = ?auto_229112 ?auto_229115 ) ) ( not ( = ?auto_229113 ?auto_229114 ) ) ( not ( = ?auto_229113 ?auto_229115 ) ) ( not ( = ?auto_229114 ?auto_229115 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229113 ?auto_229112 ?auto_229111 )
      ( DELIVER-4PKG-VERIFY ?auto_229112 ?auto_229113 ?auto_229114 ?auto_229115 ?auto_229111 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229120 - OBJ
      ?auto_229121 - OBJ
      ?auto_229122 - OBJ
      ?auto_229123 - OBJ
      ?auto_229119 - LOCATION
    )
    :vars
    (
      ?auto_229126 - LOCATION
      ?auto_229124 - CITY
      ?auto_229125 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229126 ?auto_229124 ) ( IN-CITY ?auto_229119 ?auto_229124 ) ( not ( = ?auto_229119 ?auto_229126 ) ) ( OBJ-AT ?auto_229122 ?auto_229119 ) ( not ( = ?auto_229122 ?auto_229120 ) ) ( OBJ-AT ?auto_229120 ?auto_229126 ) ( TRUCK-AT ?auto_229125 ?auto_229119 ) ( OBJ-AT ?auto_229121 ?auto_229119 ) ( OBJ-AT ?auto_229123 ?auto_229119 ) ( not ( = ?auto_229120 ?auto_229121 ) ) ( not ( = ?auto_229120 ?auto_229123 ) ) ( not ( = ?auto_229121 ?auto_229122 ) ) ( not ( = ?auto_229121 ?auto_229123 ) ) ( not ( = ?auto_229122 ?auto_229123 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229122 ?auto_229120 ?auto_229119 )
      ( DELIVER-4PKG-VERIFY ?auto_229120 ?auto_229121 ?auto_229122 ?auto_229123 ?auto_229119 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229216 - OBJ
      ?auto_229217 - OBJ
      ?auto_229218 - OBJ
      ?auto_229219 - OBJ
      ?auto_229215 - LOCATION
    )
    :vars
    (
      ?auto_229222 - LOCATION
      ?auto_229220 - CITY
      ?auto_229223 - OBJ
      ?auto_229221 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229222 ?auto_229220 ) ( IN-CITY ?auto_229215 ?auto_229220 ) ( not ( = ?auto_229215 ?auto_229222 ) ) ( OBJ-AT ?auto_229223 ?auto_229215 ) ( not ( = ?auto_229223 ?auto_229216 ) ) ( OBJ-AT ?auto_229216 ?auto_229222 ) ( TRUCK-AT ?auto_229221 ?auto_229215 ) ( OBJ-AT ?auto_229217 ?auto_229215 ) ( OBJ-AT ?auto_229218 ?auto_229215 ) ( OBJ-AT ?auto_229219 ?auto_229215 ) ( not ( = ?auto_229216 ?auto_229217 ) ) ( not ( = ?auto_229216 ?auto_229218 ) ) ( not ( = ?auto_229216 ?auto_229219 ) ) ( not ( = ?auto_229217 ?auto_229218 ) ) ( not ( = ?auto_229217 ?auto_229219 ) ) ( not ( = ?auto_229217 ?auto_229223 ) ) ( not ( = ?auto_229218 ?auto_229219 ) ) ( not ( = ?auto_229218 ?auto_229223 ) ) ( not ( = ?auto_229219 ?auto_229223 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229223 ?auto_229216 ?auto_229215 )
      ( DELIVER-4PKG-VERIFY ?auto_229216 ?auto_229217 ?auto_229218 ?auto_229219 ?auto_229215 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229345 - OBJ
      ?auto_229346 - OBJ
      ?auto_229347 - OBJ
      ?auto_229348 - OBJ
      ?auto_229349 - OBJ
      ?auto_229344 - LOCATION
    )
    :vars
    (
      ?auto_229352 - LOCATION
      ?auto_229350 - CITY
      ?auto_229351 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229352 ?auto_229350 ) ( IN-CITY ?auto_229344 ?auto_229350 ) ( not ( = ?auto_229344 ?auto_229352 ) ) ( OBJ-AT ?auto_229345 ?auto_229344 ) ( not ( = ?auto_229345 ?auto_229349 ) ) ( OBJ-AT ?auto_229349 ?auto_229352 ) ( TRUCK-AT ?auto_229351 ?auto_229344 ) ( OBJ-AT ?auto_229346 ?auto_229344 ) ( OBJ-AT ?auto_229347 ?auto_229344 ) ( OBJ-AT ?auto_229348 ?auto_229344 ) ( not ( = ?auto_229345 ?auto_229346 ) ) ( not ( = ?auto_229345 ?auto_229347 ) ) ( not ( = ?auto_229345 ?auto_229348 ) ) ( not ( = ?auto_229346 ?auto_229347 ) ) ( not ( = ?auto_229346 ?auto_229348 ) ) ( not ( = ?auto_229346 ?auto_229349 ) ) ( not ( = ?auto_229347 ?auto_229348 ) ) ( not ( = ?auto_229347 ?auto_229349 ) ) ( not ( = ?auto_229348 ?auto_229349 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229345 ?auto_229349 ?auto_229344 )
      ( DELIVER-5PKG-VERIFY ?auto_229345 ?auto_229346 ?auto_229347 ?auto_229348 ?auto_229349 ?auto_229344 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229354 - OBJ
      ?auto_229355 - OBJ
      ?auto_229356 - OBJ
      ?auto_229357 - OBJ
      ?auto_229358 - OBJ
      ?auto_229353 - LOCATION
    )
    :vars
    (
      ?auto_229361 - LOCATION
      ?auto_229359 - CITY
      ?auto_229360 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229361 ?auto_229359 ) ( IN-CITY ?auto_229353 ?auto_229359 ) ( not ( = ?auto_229353 ?auto_229361 ) ) ( OBJ-AT ?auto_229355 ?auto_229353 ) ( not ( = ?auto_229355 ?auto_229357 ) ) ( OBJ-AT ?auto_229357 ?auto_229361 ) ( TRUCK-AT ?auto_229360 ?auto_229353 ) ( OBJ-AT ?auto_229354 ?auto_229353 ) ( OBJ-AT ?auto_229356 ?auto_229353 ) ( OBJ-AT ?auto_229358 ?auto_229353 ) ( not ( = ?auto_229354 ?auto_229355 ) ) ( not ( = ?auto_229354 ?auto_229356 ) ) ( not ( = ?auto_229354 ?auto_229357 ) ) ( not ( = ?auto_229354 ?auto_229358 ) ) ( not ( = ?auto_229355 ?auto_229356 ) ) ( not ( = ?auto_229355 ?auto_229358 ) ) ( not ( = ?auto_229356 ?auto_229357 ) ) ( not ( = ?auto_229356 ?auto_229358 ) ) ( not ( = ?auto_229357 ?auto_229358 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229355 ?auto_229357 ?auto_229353 )
      ( DELIVER-5PKG-VERIFY ?auto_229354 ?auto_229355 ?auto_229356 ?auto_229357 ?auto_229358 ?auto_229353 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229363 - OBJ
      ?auto_229364 - OBJ
      ?auto_229365 - OBJ
      ?auto_229366 - OBJ
      ?auto_229367 - OBJ
      ?auto_229362 - LOCATION
    )
    :vars
    (
      ?auto_229370 - LOCATION
      ?auto_229368 - CITY
      ?auto_229369 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229370 ?auto_229368 ) ( IN-CITY ?auto_229362 ?auto_229368 ) ( not ( = ?auto_229362 ?auto_229370 ) ) ( OBJ-AT ?auto_229365 ?auto_229362 ) ( not ( = ?auto_229365 ?auto_229366 ) ) ( OBJ-AT ?auto_229366 ?auto_229370 ) ( TRUCK-AT ?auto_229369 ?auto_229362 ) ( OBJ-AT ?auto_229363 ?auto_229362 ) ( OBJ-AT ?auto_229364 ?auto_229362 ) ( OBJ-AT ?auto_229367 ?auto_229362 ) ( not ( = ?auto_229363 ?auto_229364 ) ) ( not ( = ?auto_229363 ?auto_229365 ) ) ( not ( = ?auto_229363 ?auto_229366 ) ) ( not ( = ?auto_229363 ?auto_229367 ) ) ( not ( = ?auto_229364 ?auto_229365 ) ) ( not ( = ?auto_229364 ?auto_229366 ) ) ( not ( = ?auto_229364 ?auto_229367 ) ) ( not ( = ?auto_229365 ?auto_229367 ) ) ( not ( = ?auto_229366 ?auto_229367 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229365 ?auto_229366 ?auto_229362 )
      ( DELIVER-5PKG-VERIFY ?auto_229363 ?auto_229364 ?auto_229365 ?auto_229366 ?auto_229367 ?auto_229362 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229399 - OBJ
      ?auto_229400 - OBJ
      ?auto_229401 - OBJ
      ?auto_229402 - OBJ
      ?auto_229403 - OBJ
      ?auto_229398 - LOCATION
    )
    :vars
    (
      ?auto_229406 - LOCATION
      ?auto_229404 - CITY
      ?auto_229405 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229406 ?auto_229404 ) ( IN-CITY ?auto_229398 ?auto_229404 ) ( not ( = ?auto_229398 ?auto_229406 ) ) ( OBJ-AT ?auto_229399 ?auto_229398 ) ( not ( = ?auto_229399 ?auto_229402 ) ) ( OBJ-AT ?auto_229402 ?auto_229406 ) ( TRUCK-AT ?auto_229405 ?auto_229398 ) ( OBJ-AT ?auto_229400 ?auto_229398 ) ( OBJ-AT ?auto_229401 ?auto_229398 ) ( OBJ-AT ?auto_229403 ?auto_229398 ) ( not ( = ?auto_229399 ?auto_229400 ) ) ( not ( = ?auto_229399 ?auto_229401 ) ) ( not ( = ?auto_229399 ?auto_229403 ) ) ( not ( = ?auto_229400 ?auto_229401 ) ) ( not ( = ?auto_229400 ?auto_229402 ) ) ( not ( = ?auto_229400 ?auto_229403 ) ) ( not ( = ?auto_229401 ?auto_229402 ) ) ( not ( = ?auto_229401 ?auto_229403 ) ) ( not ( = ?auto_229402 ?auto_229403 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229399 ?auto_229402 ?auto_229398 )
      ( DELIVER-5PKG-VERIFY ?auto_229399 ?auto_229400 ?auto_229401 ?auto_229402 ?auto_229403 ?auto_229398 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229426 - OBJ
      ?auto_229427 - OBJ
      ?auto_229428 - OBJ
      ?auto_229429 - OBJ
      ?auto_229430 - OBJ
      ?auto_229425 - LOCATION
    )
    :vars
    (
      ?auto_229433 - LOCATION
      ?auto_229431 - CITY
      ?auto_229432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229433 ?auto_229431 ) ( IN-CITY ?auto_229425 ?auto_229431 ) ( not ( = ?auto_229425 ?auto_229433 ) ) ( OBJ-AT ?auto_229430 ?auto_229425 ) ( not ( = ?auto_229430 ?auto_229428 ) ) ( OBJ-AT ?auto_229428 ?auto_229433 ) ( TRUCK-AT ?auto_229432 ?auto_229425 ) ( OBJ-AT ?auto_229426 ?auto_229425 ) ( OBJ-AT ?auto_229427 ?auto_229425 ) ( OBJ-AT ?auto_229429 ?auto_229425 ) ( not ( = ?auto_229426 ?auto_229427 ) ) ( not ( = ?auto_229426 ?auto_229428 ) ) ( not ( = ?auto_229426 ?auto_229429 ) ) ( not ( = ?auto_229426 ?auto_229430 ) ) ( not ( = ?auto_229427 ?auto_229428 ) ) ( not ( = ?auto_229427 ?auto_229429 ) ) ( not ( = ?auto_229427 ?auto_229430 ) ) ( not ( = ?auto_229428 ?auto_229429 ) ) ( not ( = ?auto_229429 ?auto_229430 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229430 ?auto_229428 ?auto_229425 )
      ( DELIVER-5PKG-VERIFY ?auto_229426 ?auto_229427 ?auto_229428 ?auto_229429 ?auto_229430 ?auto_229425 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229435 - OBJ
      ?auto_229436 - OBJ
      ?auto_229437 - OBJ
      ?auto_229438 - OBJ
      ?auto_229439 - OBJ
      ?auto_229434 - LOCATION
    )
    :vars
    (
      ?auto_229442 - LOCATION
      ?auto_229440 - CITY
      ?auto_229441 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229442 ?auto_229440 ) ( IN-CITY ?auto_229434 ?auto_229440 ) ( not ( = ?auto_229434 ?auto_229442 ) ) ( OBJ-AT ?auto_229438 ?auto_229434 ) ( not ( = ?auto_229438 ?auto_229437 ) ) ( OBJ-AT ?auto_229437 ?auto_229442 ) ( TRUCK-AT ?auto_229441 ?auto_229434 ) ( OBJ-AT ?auto_229435 ?auto_229434 ) ( OBJ-AT ?auto_229436 ?auto_229434 ) ( OBJ-AT ?auto_229439 ?auto_229434 ) ( not ( = ?auto_229435 ?auto_229436 ) ) ( not ( = ?auto_229435 ?auto_229437 ) ) ( not ( = ?auto_229435 ?auto_229438 ) ) ( not ( = ?auto_229435 ?auto_229439 ) ) ( not ( = ?auto_229436 ?auto_229437 ) ) ( not ( = ?auto_229436 ?auto_229438 ) ) ( not ( = ?auto_229436 ?auto_229439 ) ) ( not ( = ?auto_229437 ?auto_229439 ) ) ( not ( = ?auto_229438 ?auto_229439 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229438 ?auto_229437 ?auto_229434 )
      ( DELIVER-5PKG-VERIFY ?auto_229435 ?auto_229436 ?auto_229437 ?auto_229438 ?auto_229439 ?auto_229434 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229453 - OBJ
      ?auto_229454 - OBJ
      ?auto_229455 - OBJ
      ?auto_229456 - OBJ
      ?auto_229457 - OBJ
      ?auto_229452 - LOCATION
    )
    :vars
    (
      ?auto_229460 - LOCATION
      ?auto_229458 - CITY
      ?auto_229459 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229460 ?auto_229458 ) ( IN-CITY ?auto_229452 ?auto_229458 ) ( not ( = ?auto_229452 ?auto_229460 ) ) ( OBJ-AT ?auto_229454 ?auto_229452 ) ( not ( = ?auto_229454 ?auto_229455 ) ) ( OBJ-AT ?auto_229455 ?auto_229460 ) ( TRUCK-AT ?auto_229459 ?auto_229452 ) ( OBJ-AT ?auto_229453 ?auto_229452 ) ( OBJ-AT ?auto_229456 ?auto_229452 ) ( OBJ-AT ?auto_229457 ?auto_229452 ) ( not ( = ?auto_229453 ?auto_229454 ) ) ( not ( = ?auto_229453 ?auto_229455 ) ) ( not ( = ?auto_229453 ?auto_229456 ) ) ( not ( = ?auto_229453 ?auto_229457 ) ) ( not ( = ?auto_229454 ?auto_229456 ) ) ( not ( = ?auto_229454 ?auto_229457 ) ) ( not ( = ?auto_229455 ?auto_229456 ) ) ( not ( = ?auto_229455 ?auto_229457 ) ) ( not ( = ?auto_229456 ?auto_229457 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229454 ?auto_229455 ?auto_229452 )
      ( DELIVER-5PKG-VERIFY ?auto_229453 ?auto_229454 ?auto_229455 ?auto_229456 ?auto_229457 ?auto_229452 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229507 - OBJ
      ?auto_229508 - OBJ
      ?auto_229509 - OBJ
      ?auto_229510 - OBJ
      ?auto_229511 - OBJ
      ?auto_229506 - LOCATION
    )
    :vars
    (
      ?auto_229514 - LOCATION
      ?auto_229512 - CITY
      ?auto_229513 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229514 ?auto_229512 ) ( IN-CITY ?auto_229506 ?auto_229512 ) ( not ( = ?auto_229506 ?auto_229514 ) ) ( OBJ-AT ?auto_229509 ?auto_229506 ) ( not ( = ?auto_229509 ?auto_229511 ) ) ( OBJ-AT ?auto_229511 ?auto_229514 ) ( TRUCK-AT ?auto_229513 ?auto_229506 ) ( OBJ-AT ?auto_229507 ?auto_229506 ) ( OBJ-AT ?auto_229508 ?auto_229506 ) ( OBJ-AT ?auto_229510 ?auto_229506 ) ( not ( = ?auto_229507 ?auto_229508 ) ) ( not ( = ?auto_229507 ?auto_229509 ) ) ( not ( = ?auto_229507 ?auto_229510 ) ) ( not ( = ?auto_229507 ?auto_229511 ) ) ( not ( = ?auto_229508 ?auto_229509 ) ) ( not ( = ?auto_229508 ?auto_229510 ) ) ( not ( = ?auto_229508 ?auto_229511 ) ) ( not ( = ?auto_229509 ?auto_229510 ) ) ( not ( = ?auto_229510 ?auto_229511 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229509 ?auto_229511 ?auto_229506 )
      ( DELIVER-5PKG-VERIFY ?auto_229507 ?auto_229508 ?auto_229509 ?auto_229510 ?auto_229511 ?auto_229506 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229678 - OBJ
      ?auto_229679 - OBJ
      ?auto_229680 - OBJ
      ?auto_229681 - OBJ
      ?auto_229682 - OBJ
      ?auto_229677 - LOCATION
    )
    :vars
    (
      ?auto_229685 - LOCATION
      ?auto_229683 - CITY
      ?auto_229684 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229685 ?auto_229683 ) ( IN-CITY ?auto_229677 ?auto_229683 ) ( not ( = ?auto_229677 ?auto_229685 ) ) ( OBJ-AT ?auto_229680 ?auto_229677 ) ( not ( = ?auto_229680 ?auto_229679 ) ) ( OBJ-AT ?auto_229679 ?auto_229685 ) ( TRUCK-AT ?auto_229684 ?auto_229677 ) ( OBJ-AT ?auto_229678 ?auto_229677 ) ( OBJ-AT ?auto_229681 ?auto_229677 ) ( OBJ-AT ?auto_229682 ?auto_229677 ) ( not ( = ?auto_229678 ?auto_229679 ) ) ( not ( = ?auto_229678 ?auto_229680 ) ) ( not ( = ?auto_229678 ?auto_229681 ) ) ( not ( = ?auto_229678 ?auto_229682 ) ) ( not ( = ?auto_229679 ?auto_229681 ) ) ( not ( = ?auto_229679 ?auto_229682 ) ) ( not ( = ?auto_229680 ?auto_229681 ) ) ( not ( = ?auto_229680 ?auto_229682 ) ) ( not ( = ?auto_229681 ?auto_229682 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229680 ?auto_229679 ?auto_229677 )
      ( DELIVER-5PKG-VERIFY ?auto_229678 ?auto_229679 ?auto_229680 ?auto_229681 ?auto_229682 ?auto_229677 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229714 - OBJ
      ?auto_229715 - OBJ
      ?auto_229716 - OBJ
      ?auto_229717 - OBJ
      ?auto_229718 - OBJ
      ?auto_229713 - LOCATION
    )
    :vars
    (
      ?auto_229721 - LOCATION
      ?auto_229719 - CITY
      ?auto_229720 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229721 ?auto_229719 ) ( IN-CITY ?auto_229713 ?auto_229719 ) ( not ( = ?auto_229713 ?auto_229721 ) ) ( OBJ-AT ?auto_229714 ?auto_229713 ) ( not ( = ?auto_229714 ?auto_229715 ) ) ( OBJ-AT ?auto_229715 ?auto_229721 ) ( TRUCK-AT ?auto_229720 ?auto_229713 ) ( OBJ-AT ?auto_229716 ?auto_229713 ) ( OBJ-AT ?auto_229717 ?auto_229713 ) ( OBJ-AT ?auto_229718 ?auto_229713 ) ( not ( = ?auto_229714 ?auto_229716 ) ) ( not ( = ?auto_229714 ?auto_229717 ) ) ( not ( = ?auto_229714 ?auto_229718 ) ) ( not ( = ?auto_229715 ?auto_229716 ) ) ( not ( = ?auto_229715 ?auto_229717 ) ) ( not ( = ?auto_229715 ?auto_229718 ) ) ( not ( = ?auto_229716 ?auto_229717 ) ) ( not ( = ?auto_229716 ?auto_229718 ) ) ( not ( = ?auto_229717 ?auto_229718 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229714 ?auto_229715 ?auto_229713 )
      ( DELIVER-5PKG-VERIFY ?auto_229714 ?auto_229715 ?auto_229716 ?auto_229717 ?auto_229718 ?auto_229713 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229759 - OBJ
      ?auto_229760 - OBJ
      ?auto_229761 - OBJ
      ?auto_229762 - OBJ
      ?auto_229763 - OBJ
      ?auto_229758 - LOCATION
    )
    :vars
    (
      ?auto_229766 - LOCATION
      ?auto_229764 - CITY
      ?auto_229765 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229766 ?auto_229764 ) ( IN-CITY ?auto_229758 ?auto_229764 ) ( not ( = ?auto_229758 ?auto_229766 ) ) ( OBJ-AT ?auto_229762 ?auto_229758 ) ( not ( = ?auto_229762 ?auto_229760 ) ) ( OBJ-AT ?auto_229760 ?auto_229766 ) ( TRUCK-AT ?auto_229765 ?auto_229758 ) ( OBJ-AT ?auto_229759 ?auto_229758 ) ( OBJ-AT ?auto_229761 ?auto_229758 ) ( OBJ-AT ?auto_229763 ?auto_229758 ) ( not ( = ?auto_229759 ?auto_229760 ) ) ( not ( = ?auto_229759 ?auto_229761 ) ) ( not ( = ?auto_229759 ?auto_229762 ) ) ( not ( = ?auto_229759 ?auto_229763 ) ) ( not ( = ?auto_229760 ?auto_229761 ) ) ( not ( = ?auto_229760 ?auto_229763 ) ) ( not ( = ?auto_229761 ?auto_229762 ) ) ( not ( = ?auto_229761 ?auto_229763 ) ) ( not ( = ?auto_229762 ?auto_229763 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229762 ?auto_229760 ?auto_229758 )
      ( DELIVER-5PKG-VERIFY ?auto_229759 ?auto_229760 ?auto_229761 ?auto_229762 ?auto_229763 ?auto_229758 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229930 - OBJ
      ?auto_229931 - OBJ
      ?auto_229932 - OBJ
      ?auto_229933 - OBJ
      ?auto_229934 - OBJ
      ?auto_229929 - LOCATION
    )
    :vars
    (
      ?auto_229937 - LOCATION
      ?auto_229935 - CITY
      ?auto_229936 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229937 ?auto_229935 ) ( IN-CITY ?auto_229929 ?auto_229935 ) ( not ( = ?auto_229929 ?auto_229937 ) ) ( OBJ-AT ?auto_229931 ?auto_229929 ) ( not ( = ?auto_229931 ?auto_229934 ) ) ( OBJ-AT ?auto_229934 ?auto_229937 ) ( TRUCK-AT ?auto_229936 ?auto_229929 ) ( OBJ-AT ?auto_229930 ?auto_229929 ) ( OBJ-AT ?auto_229932 ?auto_229929 ) ( OBJ-AT ?auto_229933 ?auto_229929 ) ( not ( = ?auto_229930 ?auto_229931 ) ) ( not ( = ?auto_229930 ?auto_229932 ) ) ( not ( = ?auto_229930 ?auto_229933 ) ) ( not ( = ?auto_229930 ?auto_229934 ) ) ( not ( = ?auto_229931 ?auto_229932 ) ) ( not ( = ?auto_229931 ?auto_229933 ) ) ( not ( = ?auto_229932 ?auto_229933 ) ) ( not ( = ?auto_229932 ?auto_229934 ) ) ( not ( = ?auto_229933 ?auto_229934 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229931 ?auto_229934 ?auto_229929 )
      ( DELIVER-5PKG-VERIFY ?auto_229930 ?auto_229931 ?auto_229932 ?auto_229933 ?auto_229934 ?auto_229929 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230146 - OBJ
      ?auto_230147 - OBJ
      ?auto_230148 - OBJ
      ?auto_230149 - OBJ
      ?auto_230150 - OBJ
      ?auto_230145 - LOCATION
    )
    :vars
    (
      ?auto_230153 - LOCATION
      ?auto_230151 - CITY
      ?auto_230154 - OBJ
      ?auto_230152 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230153 ?auto_230151 ) ( IN-CITY ?auto_230145 ?auto_230151 ) ( not ( = ?auto_230145 ?auto_230153 ) ) ( OBJ-AT ?auto_230154 ?auto_230145 ) ( not ( = ?auto_230154 ?auto_230150 ) ) ( OBJ-AT ?auto_230150 ?auto_230153 ) ( TRUCK-AT ?auto_230152 ?auto_230145 ) ( OBJ-AT ?auto_230146 ?auto_230145 ) ( OBJ-AT ?auto_230147 ?auto_230145 ) ( OBJ-AT ?auto_230148 ?auto_230145 ) ( OBJ-AT ?auto_230149 ?auto_230145 ) ( not ( = ?auto_230146 ?auto_230147 ) ) ( not ( = ?auto_230146 ?auto_230148 ) ) ( not ( = ?auto_230146 ?auto_230149 ) ) ( not ( = ?auto_230146 ?auto_230150 ) ) ( not ( = ?auto_230146 ?auto_230154 ) ) ( not ( = ?auto_230147 ?auto_230148 ) ) ( not ( = ?auto_230147 ?auto_230149 ) ) ( not ( = ?auto_230147 ?auto_230150 ) ) ( not ( = ?auto_230147 ?auto_230154 ) ) ( not ( = ?auto_230148 ?auto_230149 ) ) ( not ( = ?auto_230148 ?auto_230150 ) ) ( not ( = ?auto_230148 ?auto_230154 ) ) ( not ( = ?auto_230149 ?auto_230150 ) ) ( not ( = ?auto_230149 ?auto_230154 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230154 ?auto_230150 ?auto_230145 )
      ( DELIVER-5PKG-VERIFY ?auto_230146 ?auto_230147 ?auto_230148 ?auto_230149 ?auto_230150 ?auto_230145 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230165 - OBJ
      ?auto_230166 - OBJ
      ?auto_230167 - OBJ
      ?auto_230168 - OBJ
      ?auto_230169 - OBJ
      ?auto_230164 - LOCATION
    )
    :vars
    (
      ?auto_230172 - LOCATION
      ?auto_230170 - CITY
      ?auto_230173 - OBJ
      ?auto_230171 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230172 ?auto_230170 ) ( IN-CITY ?auto_230164 ?auto_230170 ) ( not ( = ?auto_230164 ?auto_230172 ) ) ( OBJ-AT ?auto_230173 ?auto_230164 ) ( not ( = ?auto_230173 ?auto_230168 ) ) ( OBJ-AT ?auto_230168 ?auto_230172 ) ( TRUCK-AT ?auto_230171 ?auto_230164 ) ( OBJ-AT ?auto_230165 ?auto_230164 ) ( OBJ-AT ?auto_230166 ?auto_230164 ) ( OBJ-AT ?auto_230167 ?auto_230164 ) ( OBJ-AT ?auto_230169 ?auto_230164 ) ( not ( = ?auto_230165 ?auto_230166 ) ) ( not ( = ?auto_230165 ?auto_230167 ) ) ( not ( = ?auto_230165 ?auto_230168 ) ) ( not ( = ?auto_230165 ?auto_230169 ) ) ( not ( = ?auto_230165 ?auto_230173 ) ) ( not ( = ?auto_230166 ?auto_230167 ) ) ( not ( = ?auto_230166 ?auto_230168 ) ) ( not ( = ?auto_230166 ?auto_230169 ) ) ( not ( = ?auto_230166 ?auto_230173 ) ) ( not ( = ?auto_230167 ?auto_230168 ) ) ( not ( = ?auto_230167 ?auto_230169 ) ) ( not ( = ?auto_230167 ?auto_230173 ) ) ( not ( = ?auto_230168 ?auto_230169 ) ) ( not ( = ?auto_230169 ?auto_230173 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230173 ?auto_230168 ?auto_230164 )
      ( DELIVER-5PKG-VERIFY ?auto_230165 ?auto_230166 ?auto_230167 ?auto_230168 ?auto_230169 ?auto_230164 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230221 - OBJ
      ?auto_230222 - OBJ
      ?auto_230223 - OBJ
      ?auto_230224 - OBJ
      ?auto_230225 - OBJ
      ?auto_230220 - LOCATION
    )
    :vars
    (
      ?auto_230228 - LOCATION
      ?auto_230226 - CITY
      ?auto_230229 - OBJ
      ?auto_230227 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230228 ?auto_230226 ) ( IN-CITY ?auto_230220 ?auto_230226 ) ( not ( = ?auto_230220 ?auto_230228 ) ) ( OBJ-AT ?auto_230229 ?auto_230220 ) ( not ( = ?auto_230229 ?auto_230223 ) ) ( OBJ-AT ?auto_230223 ?auto_230228 ) ( TRUCK-AT ?auto_230227 ?auto_230220 ) ( OBJ-AT ?auto_230221 ?auto_230220 ) ( OBJ-AT ?auto_230222 ?auto_230220 ) ( OBJ-AT ?auto_230224 ?auto_230220 ) ( OBJ-AT ?auto_230225 ?auto_230220 ) ( not ( = ?auto_230221 ?auto_230222 ) ) ( not ( = ?auto_230221 ?auto_230223 ) ) ( not ( = ?auto_230221 ?auto_230224 ) ) ( not ( = ?auto_230221 ?auto_230225 ) ) ( not ( = ?auto_230221 ?auto_230229 ) ) ( not ( = ?auto_230222 ?auto_230223 ) ) ( not ( = ?auto_230222 ?auto_230224 ) ) ( not ( = ?auto_230222 ?auto_230225 ) ) ( not ( = ?auto_230222 ?auto_230229 ) ) ( not ( = ?auto_230223 ?auto_230224 ) ) ( not ( = ?auto_230223 ?auto_230225 ) ) ( not ( = ?auto_230224 ?auto_230225 ) ) ( not ( = ?auto_230224 ?auto_230229 ) ) ( not ( = ?auto_230225 ?auto_230229 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230229 ?auto_230223 ?auto_230220 )
      ( DELIVER-5PKG-VERIFY ?auto_230221 ?auto_230222 ?auto_230223 ?auto_230224 ?auto_230225 ?auto_230220 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230387 - OBJ
      ?auto_230388 - OBJ
      ?auto_230389 - OBJ
      ?auto_230390 - OBJ
      ?auto_230391 - OBJ
      ?auto_230386 - LOCATION
    )
    :vars
    (
      ?auto_230394 - LOCATION
      ?auto_230392 - CITY
      ?auto_230395 - OBJ
      ?auto_230393 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230394 ?auto_230392 ) ( IN-CITY ?auto_230386 ?auto_230392 ) ( not ( = ?auto_230386 ?auto_230394 ) ) ( OBJ-AT ?auto_230395 ?auto_230386 ) ( not ( = ?auto_230395 ?auto_230388 ) ) ( OBJ-AT ?auto_230388 ?auto_230394 ) ( TRUCK-AT ?auto_230393 ?auto_230386 ) ( OBJ-AT ?auto_230387 ?auto_230386 ) ( OBJ-AT ?auto_230389 ?auto_230386 ) ( OBJ-AT ?auto_230390 ?auto_230386 ) ( OBJ-AT ?auto_230391 ?auto_230386 ) ( not ( = ?auto_230387 ?auto_230388 ) ) ( not ( = ?auto_230387 ?auto_230389 ) ) ( not ( = ?auto_230387 ?auto_230390 ) ) ( not ( = ?auto_230387 ?auto_230391 ) ) ( not ( = ?auto_230387 ?auto_230395 ) ) ( not ( = ?auto_230388 ?auto_230389 ) ) ( not ( = ?auto_230388 ?auto_230390 ) ) ( not ( = ?auto_230388 ?auto_230391 ) ) ( not ( = ?auto_230389 ?auto_230390 ) ) ( not ( = ?auto_230389 ?auto_230391 ) ) ( not ( = ?auto_230389 ?auto_230395 ) ) ( not ( = ?auto_230390 ?auto_230391 ) ) ( not ( = ?auto_230390 ?auto_230395 ) ) ( not ( = ?auto_230391 ?auto_230395 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230395 ?auto_230388 ?auto_230386 )
      ( DELIVER-5PKG-VERIFY ?auto_230387 ?auto_230388 ?auto_230389 ?auto_230390 ?auto_230391 ?auto_230386 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230521 - OBJ
      ?auto_230522 - OBJ
      ?auto_230523 - OBJ
      ?auto_230524 - OBJ
      ?auto_230525 - OBJ
      ?auto_230520 - LOCATION
    )
    :vars
    (
      ?auto_230528 - LOCATION
      ?auto_230526 - CITY
      ?auto_230527 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230528 ?auto_230526 ) ( IN-CITY ?auto_230520 ?auto_230526 ) ( not ( = ?auto_230520 ?auto_230528 ) ) ( OBJ-AT ?auto_230523 ?auto_230520 ) ( not ( = ?auto_230523 ?auto_230521 ) ) ( OBJ-AT ?auto_230521 ?auto_230528 ) ( TRUCK-AT ?auto_230527 ?auto_230520 ) ( OBJ-AT ?auto_230522 ?auto_230520 ) ( OBJ-AT ?auto_230524 ?auto_230520 ) ( OBJ-AT ?auto_230525 ?auto_230520 ) ( not ( = ?auto_230521 ?auto_230522 ) ) ( not ( = ?auto_230521 ?auto_230524 ) ) ( not ( = ?auto_230521 ?auto_230525 ) ) ( not ( = ?auto_230522 ?auto_230523 ) ) ( not ( = ?auto_230522 ?auto_230524 ) ) ( not ( = ?auto_230522 ?auto_230525 ) ) ( not ( = ?auto_230523 ?auto_230524 ) ) ( not ( = ?auto_230523 ?auto_230525 ) ) ( not ( = ?auto_230524 ?auto_230525 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230523 ?auto_230521 ?auto_230520 )
      ( DELIVER-5PKG-VERIFY ?auto_230521 ?auto_230522 ?auto_230523 ?auto_230524 ?auto_230525 ?auto_230520 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230530 - OBJ
      ?auto_230531 - OBJ
      ?auto_230532 - OBJ
      ?auto_230533 - OBJ
      ?auto_230534 - OBJ
      ?auto_230529 - LOCATION
    )
    :vars
    (
      ?auto_230537 - LOCATION
      ?auto_230535 - CITY
      ?auto_230536 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230537 ?auto_230535 ) ( IN-CITY ?auto_230529 ?auto_230535 ) ( not ( = ?auto_230529 ?auto_230537 ) ) ( OBJ-AT ?auto_230533 ?auto_230529 ) ( not ( = ?auto_230533 ?auto_230530 ) ) ( OBJ-AT ?auto_230530 ?auto_230537 ) ( TRUCK-AT ?auto_230536 ?auto_230529 ) ( OBJ-AT ?auto_230531 ?auto_230529 ) ( OBJ-AT ?auto_230532 ?auto_230529 ) ( OBJ-AT ?auto_230534 ?auto_230529 ) ( not ( = ?auto_230530 ?auto_230531 ) ) ( not ( = ?auto_230530 ?auto_230532 ) ) ( not ( = ?auto_230530 ?auto_230534 ) ) ( not ( = ?auto_230531 ?auto_230532 ) ) ( not ( = ?auto_230531 ?auto_230533 ) ) ( not ( = ?auto_230531 ?auto_230534 ) ) ( not ( = ?auto_230532 ?auto_230533 ) ) ( not ( = ?auto_230532 ?auto_230534 ) ) ( not ( = ?auto_230533 ?auto_230534 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230533 ?auto_230530 ?auto_230529 )
      ( DELIVER-5PKG-VERIFY ?auto_230530 ?auto_230531 ?auto_230532 ?auto_230533 ?auto_230534 ?auto_230529 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230557 - OBJ
      ?auto_230558 - OBJ
      ?auto_230559 - OBJ
      ?auto_230560 - OBJ
      ?auto_230561 - OBJ
      ?auto_230556 - LOCATION
    )
    :vars
    (
      ?auto_230564 - LOCATION
      ?auto_230562 - CITY
      ?auto_230563 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230564 ?auto_230562 ) ( IN-CITY ?auto_230556 ?auto_230562 ) ( not ( = ?auto_230556 ?auto_230564 ) ) ( OBJ-AT ?auto_230558 ?auto_230556 ) ( not ( = ?auto_230558 ?auto_230557 ) ) ( OBJ-AT ?auto_230557 ?auto_230564 ) ( TRUCK-AT ?auto_230563 ?auto_230556 ) ( OBJ-AT ?auto_230559 ?auto_230556 ) ( OBJ-AT ?auto_230560 ?auto_230556 ) ( OBJ-AT ?auto_230561 ?auto_230556 ) ( not ( = ?auto_230557 ?auto_230559 ) ) ( not ( = ?auto_230557 ?auto_230560 ) ) ( not ( = ?auto_230557 ?auto_230561 ) ) ( not ( = ?auto_230558 ?auto_230559 ) ) ( not ( = ?auto_230558 ?auto_230560 ) ) ( not ( = ?auto_230558 ?auto_230561 ) ) ( not ( = ?auto_230559 ?auto_230560 ) ) ( not ( = ?auto_230559 ?auto_230561 ) ) ( not ( = ?auto_230560 ?auto_230561 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230558 ?auto_230557 ?auto_230556 )
      ( DELIVER-5PKG-VERIFY ?auto_230557 ?auto_230558 ?auto_230559 ?auto_230560 ?auto_230561 ?auto_230556 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230881 - OBJ
      ?auto_230882 - OBJ
      ?auto_230883 - OBJ
      ?auto_230884 - OBJ
      ?auto_230885 - OBJ
      ?auto_230880 - LOCATION
    )
    :vars
    (
      ?auto_230888 - LOCATION
      ?auto_230886 - CITY
      ?auto_230889 - OBJ
      ?auto_230887 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230888 ?auto_230886 ) ( IN-CITY ?auto_230880 ?auto_230886 ) ( not ( = ?auto_230880 ?auto_230888 ) ) ( OBJ-AT ?auto_230889 ?auto_230880 ) ( not ( = ?auto_230889 ?auto_230881 ) ) ( OBJ-AT ?auto_230881 ?auto_230888 ) ( TRUCK-AT ?auto_230887 ?auto_230880 ) ( OBJ-AT ?auto_230882 ?auto_230880 ) ( OBJ-AT ?auto_230883 ?auto_230880 ) ( OBJ-AT ?auto_230884 ?auto_230880 ) ( OBJ-AT ?auto_230885 ?auto_230880 ) ( not ( = ?auto_230881 ?auto_230882 ) ) ( not ( = ?auto_230881 ?auto_230883 ) ) ( not ( = ?auto_230881 ?auto_230884 ) ) ( not ( = ?auto_230881 ?auto_230885 ) ) ( not ( = ?auto_230882 ?auto_230883 ) ) ( not ( = ?auto_230882 ?auto_230884 ) ) ( not ( = ?auto_230882 ?auto_230885 ) ) ( not ( = ?auto_230882 ?auto_230889 ) ) ( not ( = ?auto_230883 ?auto_230884 ) ) ( not ( = ?auto_230883 ?auto_230885 ) ) ( not ( = ?auto_230883 ?auto_230889 ) ) ( not ( = ?auto_230884 ?auto_230885 ) ) ( not ( = ?auto_230884 ?auto_230889 ) ) ( not ( = ?auto_230885 ?auto_230889 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230889 ?auto_230881 ?auto_230880 )
      ( DELIVER-5PKG-VERIFY ?auto_230881 ?auto_230882 ?auto_230883 ?auto_230884 ?auto_230885 ?auto_230880 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_231295 - OBJ
      ?auto_231296 - OBJ
      ?auto_231297 - OBJ
      ?auto_231294 - LOCATION
    )
    :vars
    (
      ?auto_231299 - LOCATION
      ?auto_231300 - CITY
      ?auto_231298 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_231299 ?auto_231300 ) ( IN-CITY ?auto_231294 ?auto_231300 ) ( not ( = ?auto_231294 ?auto_231299 ) ) ( OBJ-AT ?auto_231295 ?auto_231294 ) ( not ( = ?auto_231295 ?auto_231297 ) ) ( OBJ-AT ?auto_231297 ?auto_231299 ) ( TRUCK-AT ?auto_231298 ?auto_231294 ) ( OBJ-AT ?auto_231296 ?auto_231294 ) ( not ( = ?auto_231295 ?auto_231296 ) ) ( not ( = ?auto_231296 ?auto_231297 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_231295 ?auto_231297 ?auto_231294 )
      ( DELIVER-3PKG-VERIFY ?auto_231295 ?auto_231296 ?auto_231297 ?auto_231294 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_233900 - OBJ
      ?auto_233899 - LOCATION
    )
    :vars
    (
      ?auto_233902 - LOCATION
      ?auto_233903 - CITY
      ?auto_233904 - OBJ
      ?auto_233901 - TRUCK
      ?auto_233905 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_233902 ?auto_233903 ) ( IN-CITY ?auto_233899 ?auto_233903 ) ( not ( = ?auto_233899 ?auto_233902 ) ) ( OBJ-AT ?auto_233904 ?auto_233899 ) ( not ( = ?auto_233904 ?auto_233900 ) ) ( OBJ-AT ?auto_233900 ?auto_233902 ) ( TRUCK-AT ?auto_233901 ?auto_233905 ) ( IN-CITY ?auto_233905 ?auto_233903 ) ( not ( = ?auto_233899 ?auto_233905 ) ) ( not ( = ?auto_233902 ?auto_233905 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_233901 ?auto_233905 ?auto_233899 ?auto_233903 )
      ( DELIVER-2PKG ?auto_233904 ?auto_233900 ?auto_233899 )
      ( DELIVER-1PKG-VERIFY ?auto_233900 ?auto_233899 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_233907 - OBJ
      ?auto_233908 - OBJ
      ?auto_233906 - LOCATION
    )
    :vars
    (
      ?auto_233909 - LOCATION
      ?auto_233912 - CITY
      ?auto_233911 - TRUCK
      ?auto_233910 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_233909 ?auto_233912 ) ( IN-CITY ?auto_233906 ?auto_233912 ) ( not ( = ?auto_233906 ?auto_233909 ) ) ( OBJ-AT ?auto_233907 ?auto_233906 ) ( not ( = ?auto_233907 ?auto_233908 ) ) ( OBJ-AT ?auto_233908 ?auto_233909 ) ( TRUCK-AT ?auto_233911 ?auto_233910 ) ( IN-CITY ?auto_233910 ?auto_233912 ) ( not ( = ?auto_233906 ?auto_233910 ) ) ( not ( = ?auto_233909 ?auto_233910 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_233908 ?auto_233906 )
      ( DELIVER-2PKG-VERIFY ?auto_233907 ?auto_233908 ?auto_233906 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_233922 - OBJ
      ?auto_233923 - OBJ
      ?auto_233921 - LOCATION
    )
    :vars
    (
      ?auto_233925 - LOCATION
      ?auto_233924 - CITY
      ?auto_233927 - TRUCK
      ?auto_233926 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_233925 ?auto_233924 ) ( IN-CITY ?auto_233921 ?auto_233924 ) ( not ( = ?auto_233921 ?auto_233925 ) ) ( OBJ-AT ?auto_233923 ?auto_233921 ) ( not ( = ?auto_233923 ?auto_233922 ) ) ( OBJ-AT ?auto_233922 ?auto_233925 ) ( TRUCK-AT ?auto_233927 ?auto_233926 ) ( IN-CITY ?auto_233926 ?auto_233924 ) ( not ( = ?auto_233921 ?auto_233926 ) ) ( not ( = ?auto_233925 ?auto_233926 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_233923 ?auto_233922 ?auto_233921 )
      ( DELIVER-2PKG-VERIFY ?auto_233922 ?auto_233923 ?auto_233921 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_233945 - OBJ
      ?auto_233946 - OBJ
      ?auto_233947 - OBJ
      ?auto_233944 - LOCATION
    )
    :vars
    (
      ?auto_233949 - LOCATION
      ?auto_233948 - CITY
      ?auto_233951 - TRUCK
      ?auto_233950 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_233949 ?auto_233948 ) ( IN-CITY ?auto_233944 ?auto_233948 ) ( not ( = ?auto_233944 ?auto_233949 ) ) ( OBJ-AT ?auto_233946 ?auto_233944 ) ( not ( = ?auto_233946 ?auto_233947 ) ) ( OBJ-AT ?auto_233947 ?auto_233949 ) ( TRUCK-AT ?auto_233951 ?auto_233950 ) ( IN-CITY ?auto_233950 ?auto_233948 ) ( not ( = ?auto_233944 ?auto_233950 ) ) ( not ( = ?auto_233949 ?auto_233950 ) ) ( OBJ-AT ?auto_233945 ?auto_233944 ) ( not ( = ?auto_233945 ?auto_233946 ) ) ( not ( = ?auto_233945 ?auto_233947 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_233946 ?auto_233947 ?auto_233944 )
      ( DELIVER-3PKG-VERIFY ?auto_233945 ?auto_233946 ?auto_233947 ?auto_233944 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_233961 - OBJ
      ?auto_233962 - OBJ
      ?auto_233963 - OBJ
      ?auto_233960 - LOCATION
    )
    :vars
    (
      ?auto_233965 - LOCATION
      ?auto_233964 - CITY
      ?auto_233967 - TRUCK
      ?auto_233966 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_233965 ?auto_233964 ) ( IN-CITY ?auto_233960 ?auto_233964 ) ( not ( = ?auto_233960 ?auto_233965 ) ) ( OBJ-AT ?auto_233963 ?auto_233960 ) ( not ( = ?auto_233963 ?auto_233962 ) ) ( OBJ-AT ?auto_233962 ?auto_233965 ) ( TRUCK-AT ?auto_233967 ?auto_233966 ) ( IN-CITY ?auto_233966 ?auto_233964 ) ( not ( = ?auto_233960 ?auto_233966 ) ) ( not ( = ?auto_233965 ?auto_233966 ) ) ( OBJ-AT ?auto_233961 ?auto_233960 ) ( not ( = ?auto_233961 ?auto_233962 ) ) ( not ( = ?auto_233961 ?auto_233963 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_233963 ?auto_233962 ?auto_233960 )
      ( DELIVER-3PKG-VERIFY ?auto_233961 ?auto_233962 ?auto_233963 ?auto_233960 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_234028 - OBJ
      ?auto_234029 - OBJ
      ?auto_234030 - OBJ
      ?auto_234027 - LOCATION
    )
    :vars
    (
      ?auto_234032 - LOCATION
      ?auto_234031 - CITY
      ?auto_234034 - TRUCK
      ?auto_234033 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234032 ?auto_234031 ) ( IN-CITY ?auto_234027 ?auto_234031 ) ( not ( = ?auto_234027 ?auto_234032 ) ) ( OBJ-AT ?auto_234030 ?auto_234027 ) ( not ( = ?auto_234030 ?auto_234028 ) ) ( OBJ-AT ?auto_234028 ?auto_234032 ) ( TRUCK-AT ?auto_234034 ?auto_234033 ) ( IN-CITY ?auto_234033 ?auto_234031 ) ( not ( = ?auto_234027 ?auto_234033 ) ) ( not ( = ?auto_234032 ?auto_234033 ) ) ( OBJ-AT ?auto_234029 ?auto_234027 ) ( not ( = ?auto_234028 ?auto_234029 ) ) ( not ( = ?auto_234029 ?auto_234030 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234030 ?auto_234028 ?auto_234027 )
      ( DELIVER-3PKG-VERIFY ?auto_234028 ?auto_234029 ?auto_234030 ?auto_234027 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234104 - OBJ
      ?auto_234105 - OBJ
      ?auto_234106 - OBJ
      ?auto_234107 - OBJ
      ?auto_234103 - LOCATION
    )
    :vars
    (
      ?auto_234109 - LOCATION
      ?auto_234108 - CITY
      ?auto_234111 - TRUCK
      ?auto_234110 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234109 ?auto_234108 ) ( IN-CITY ?auto_234103 ?auto_234108 ) ( not ( = ?auto_234103 ?auto_234109 ) ) ( OBJ-AT ?auto_234104 ?auto_234103 ) ( not ( = ?auto_234104 ?auto_234107 ) ) ( OBJ-AT ?auto_234107 ?auto_234109 ) ( TRUCK-AT ?auto_234111 ?auto_234110 ) ( IN-CITY ?auto_234110 ?auto_234108 ) ( not ( = ?auto_234103 ?auto_234110 ) ) ( not ( = ?auto_234109 ?auto_234110 ) ) ( OBJ-AT ?auto_234105 ?auto_234103 ) ( OBJ-AT ?auto_234106 ?auto_234103 ) ( not ( = ?auto_234104 ?auto_234105 ) ) ( not ( = ?auto_234104 ?auto_234106 ) ) ( not ( = ?auto_234105 ?auto_234106 ) ) ( not ( = ?auto_234105 ?auto_234107 ) ) ( not ( = ?auto_234106 ?auto_234107 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234104 ?auto_234107 ?auto_234103 )
      ( DELIVER-4PKG-VERIFY ?auto_234104 ?auto_234105 ?auto_234106 ?auto_234107 ?auto_234103 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234122 - OBJ
      ?auto_234123 - OBJ
      ?auto_234124 - OBJ
      ?auto_234125 - OBJ
      ?auto_234121 - LOCATION
    )
    :vars
    (
      ?auto_234127 - LOCATION
      ?auto_234126 - CITY
      ?auto_234129 - TRUCK
      ?auto_234128 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234127 ?auto_234126 ) ( IN-CITY ?auto_234121 ?auto_234126 ) ( not ( = ?auto_234121 ?auto_234127 ) ) ( OBJ-AT ?auto_234122 ?auto_234121 ) ( not ( = ?auto_234122 ?auto_234124 ) ) ( OBJ-AT ?auto_234124 ?auto_234127 ) ( TRUCK-AT ?auto_234129 ?auto_234128 ) ( IN-CITY ?auto_234128 ?auto_234126 ) ( not ( = ?auto_234121 ?auto_234128 ) ) ( not ( = ?auto_234127 ?auto_234128 ) ) ( OBJ-AT ?auto_234123 ?auto_234121 ) ( OBJ-AT ?auto_234125 ?auto_234121 ) ( not ( = ?auto_234122 ?auto_234123 ) ) ( not ( = ?auto_234122 ?auto_234125 ) ) ( not ( = ?auto_234123 ?auto_234124 ) ) ( not ( = ?auto_234123 ?auto_234125 ) ) ( not ( = ?auto_234124 ?auto_234125 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234122 ?auto_234124 ?auto_234121 )
      ( DELIVER-4PKG-VERIFY ?auto_234122 ?auto_234123 ?auto_234124 ?auto_234125 ?auto_234121 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234194 - OBJ
      ?auto_234195 - OBJ
      ?auto_234196 - OBJ
      ?auto_234197 - OBJ
      ?auto_234193 - LOCATION
    )
    :vars
    (
      ?auto_234199 - LOCATION
      ?auto_234198 - CITY
      ?auto_234201 - TRUCK
      ?auto_234200 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234199 ?auto_234198 ) ( IN-CITY ?auto_234193 ?auto_234198 ) ( not ( = ?auto_234193 ?auto_234199 ) ) ( OBJ-AT ?auto_234194 ?auto_234193 ) ( not ( = ?auto_234194 ?auto_234195 ) ) ( OBJ-AT ?auto_234195 ?auto_234199 ) ( TRUCK-AT ?auto_234201 ?auto_234200 ) ( IN-CITY ?auto_234200 ?auto_234198 ) ( not ( = ?auto_234193 ?auto_234200 ) ) ( not ( = ?auto_234199 ?auto_234200 ) ) ( OBJ-AT ?auto_234196 ?auto_234193 ) ( OBJ-AT ?auto_234197 ?auto_234193 ) ( not ( = ?auto_234194 ?auto_234196 ) ) ( not ( = ?auto_234194 ?auto_234197 ) ) ( not ( = ?auto_234195 ?auto_234196 ) ) ( not ( = ?auto_234195 ?auto_234197 ) ) ( not ( = ?auto_234196 ?auto_234197 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234194 ?auto_234195 ?auto_234193 )
      ( DELIVER-4PKG-VERIFY ?auto_234194 ?auto_234195 ?auto_234196 ?auto_234197 ?auto_234193 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234453 - OBJ
      ?auto_234454 - OBJ
      ?auto_234455 - OBJ
      ?auto_234456 - OBJ
      ?auto_234452 - LOCATION
    )
    :vars
    (
      ?auto_234458 - LOCATION
      ?auto_234457 - CITY
      ?auto_234460 - TRUCK
      ?auto_234459 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234458 ?auto_234457 ) ( IN-CITY ?auto_234452 ?auto_234457 ) ( not ( = ?auto_234452 ?auto_234458 ) ) ( OBJ-AT ?auto_234455 ?auto_234452 ) ( not ( = ?auto_234455 ?auto_234453 ) ) ( OBJ-AT ?auto_234453 ?auto_234458 ) ( TRUCK-AT ?auto_234460 ?auto_234459 ) ( IN-CITY ?auto_234459 ?auto_234457 ) ( not ( = ?auto_234452 ?auto_234459 ) ) ( not ( = ?auto_234458 ?auto_234459 ) ) ( OBJ-AT ?auto_234454 ?auto_234452 ) ( OBJ-AT ?auto_234456 ?auto_234452 ) ( not ( = ?auto_234453 ?auto_234454 ) ) ( not ( = ?auto_234453 ?auto_234456 ) ) ( not ( = ?auto_234454 ?auto_234455 ) ) ( not ( = ?auto_234454 ?auto_234456 ) ) ( not ( = ?auto_234455 ?auto_234456 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234455 ?auto_234453 ?auto_234452 )
      ( DELIVER-4PKG-VERIFY ?auto_234453 ?auto_234454 ?auto_234455 ?auto_234456 ?auto_234452 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_234704 - OBJ
      ?auto_234705 - OBJ
      ?auto_234706 - OBJ
      ?auto_234707 - OBJ
      ?auto_234708 - OBJ
      ?auto_234703 - LOCATION
    )
    :vars
    (
      ?auto_234710 - LOCATION
      ?auto_234709 - CITY
      ?auto_234712 - TRUCK
      ?auto_234711 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234710 ?auto_234709 ) ( IN-CITY ?auto_234703 ?auto_234709 ) ( not ( = ?auto_234703 ?auto_234710 ) ) ( OBJ-AT ?auto_234704 ?auto_234703 ) ( not ( = ?auto_234704 ?auto_234708 ) ) ( OBJ-AT ?auto_234708 ?auto_234710 ) ( TRUCK-AT ?auto_234712 ?auto_234711 ) ( IN-CITY ?auto_234711 ?auto_234709 ) ( not ( = ?auto_234703 ?auto_234711 ) ) ( not ( = ?auto_234710 ?auto_234711 ) ) ( OBJ-AT ?auto_234705 ?auto_234703 ) ( OBJ-AT ?auto_234706 ?auto_234703 ) ( OBJ-AT ?auto_234707 ?auto_234703 ) ( not ( = ?auto_234704 ?auto_234705 ) ) ( not ( = ?auto_234704 ?auto_234706 ) ) ( not ( = ?auto_234704 ?auto_234707 ) ) ( not ( = ?auto_234705 ?auto_234706 ) ) ( not ( = ?auto_234705 ?auto_234707 ) ) ( not ( = ?auto_234705 ?auto_234708 ) ) ( not ( = ?auto_234706 ?auto_234707 ) ) ( not ( = ?auto_234706 ?auto_234708 ) ) ( not ( = ?auto_234707 ?auto_234708 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234704 ?auto_234708 ?auto_234703 )
      ( DELIVER-5PKG-VERIFY ?auto_234704 ?auto_234705 ?auto_234706 ?auto_234707 ?auto_234708 ?auto_234703 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_234724 - OBJ
      ?auto_234725 - OBJ
      ?auto_234726 - OBJ
      ?auto_234727 - OBJ
      ?auto_234728 - OBJ
      ?auto_234723 - LOCATION
    )
    :vars
    (
      ?auto_234730 - LOCATION
      ?auto_234729 - CITY
      ?auto_234732 - TRUCK
      ?auto_234731 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234730 ?auto_234729 ) ( IN-CITY ?auto_234723 ?auto_234729 ) ( not ( = ?auto_234723 ?auto_234730 ) ) ( OBJ-AT ?auto_234724 ?auto_234723 ) ( not ( = ?auto_234724 ?auto_234727 ) ) ( OBJ-AT ?auto_234727 ?auto_234730 ) ( TRUCK-AT ?auto_234732 ?auto_234731 ) ( IN-CITY ?auto_234731 ?auto_234729 ) ( not ( = ?auto_234723 ?auto_234731 ) ) ( not ( = ?auto_234730 ?auto_234731 ) ) ( OBJ-AT ?auto_234725 ?auto_234723 ) ( OBJ-AT ?auto_234726 ?auto_234723 ) ( OBJ-AT ?auto_234728 ?auto_234723 ) ( not ( = ?auto_234724 ?auto_234725 ) ) ( not ( = ?auto_234724 ?auto_234726 ) ) ( not ( = ?auto_234724 ?auto_234728 ) ) ( not ( = ?auto_234725 ?auto_234726 ) ) ( not ( = ?auto_234725 ?auto_234727 ) ) ( not ( = ?auto_234725 ?auto_234728 ) ) ( not ( = ?auto_234726 ?auto_234727 ) ) ( not ( = ?auto_234726 ?auto_234728 ) ) ( not ( = ?auto_234727 ?auto_234728 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234724 ?auto_234727 ?auto_234723 )
      ( DELIVER-5PKG-VERIFY ?auto_234724 ?auto_234725 ?auto_234726 ?auto_234727 ?auto_234728 ?auto_234723 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_234804 - OBJ
      ?auto_234805 - OBJ
      ?auto_234806 - OBJ
      ?auto_234807 - OBJ
      ?auto_234808 - OBJ
      ?auto_234803 - LOCATION
    )
    :vars
    (
      ?auto_234810 - LOCATION
      ?auto_234809 - CITY
      ?auto_234812 - TRUCK
      ?auto_234811 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234810 ?auto_234809 ) ( IN-CITY ?auto_234803 ?auto_234809 ) ( not ( = ?auto_234803 ?auto_234810 ) ) ( OBJ-AT ?auto_234804 ?auto_234803 ) ( not ( = ?auto_234804 ?auto_234806 ) ) ( OBJ-AT ?auto_234806 ?auto_234810 ) ( TRUCK-AT ?auto_234812 ?auto_234811 ) ( IN-CITY ?auto_234811 ?auto_234809 ) ( not ( = ?auto_234803 ?auto_234811 ) ) ( not ( = ?auto_234810 ?auto_234811 ) ) ( OBJ-AT ?auto_234805 ?auto_234803 ) ( OBJ-AT ?auto_234807 ?auto_234803 ) ( OBJ-AT ?auto_234808 ?auto_234803 ) ( not ( = ?auto_234804 ?auto_234805 ) ) ( not ( = ?auto_234804 ?auto_234807 ) ) ( not ( = ?auto_234804 ?auto_234808 ) ) ( not ( = ?auto_234805 ?auto_234806 ) ) ( not ( = ?auto_234805 ?auto_234807 ) ) ( not ( = ?auto_234805 ?auto_234808 ) ) ( not ( = ?auto_234806 ?auto_234807 ) ) ( not ( = ?auto_234806 ?auto_234808 ) ) ( not ( = ?auto_234807 ?auto_234808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234804 ?auto_234806 ?auto_234803 )
      ( DELIVER-5PKG-VERIFY ?auto_234804 ?auto_234805 ?auto_234806 ?auto_234807 ?auto_234808 ?auto_234803 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_235084 - OBJ
      ?auto_235085 - OBJ
      ?auto_235086 - OBJ
      ?auto_235087 - OBJ
      ?auto_235088 - OBJ
      ?auto_235083 - LOCATION
    )
    :vars
    (
      ?auto_235090 - LOCATION
      ?auto_235089 - CITY
      ?auto_235092 - TRUCK
      ?auto_235091 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_235090 ?auto_235089 ) ( IN-CITY ?auto_235083 ?auto_235089 ) ( not ( = ?auto_235083 ?auto_235090 ) ) ( OBJ-AT ?auto_235084 ?auto_235083 ) ( not ( = ?auto_235084 ?auto_235085 ) ) ( OBJ-AT ?auto_235085 ?auto_235090 ) ( TRUCK-AT ?auto_235092 ?auto_235091 ) ( IN-CITY ?auto_235091 ?auto_235089 ) ( not ( = ?auto_235083 ?auto_235091 ) ) ( not ( = ?auto_235090 ?auto_235091 ) ) ( OBJ-AT ?auto_235086 ?auto_235083 ) ( OBJ-AT ?auto_235087 ?auto_235083 ) ( OBJ-AT ?auto_235088 ?auto_235083 ) ( not ( = ?auto_235084 ?auto_235086 ) ) ( not ( = ?auto_235084 ?auto_235087 ) ) ( not ( = ?auto_235084 ?auto_235088 ) ) ( not ( = ?auto_235085 ?auto_235086 ) ) ( not ( = ?auto_235085 ?auto_235087 ) ) ( not ( = ?auto_235085 ?auto_235088 ) ) ( not ( = ?auto_235086 ?auto_235087 ) ) ( not ( = ?auto_235086 ?auto_235088 ) ) ( not ( = ?auto_235087 ?auto_235088 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_235084 ?auto_235085 ?auto_235083 )
      ( DELIVER-5PKG-VERIFY ?auto_235084 ?auto_235085 ?auto_235086 ?auto_235087 ?auto_235088 ?auto_235083 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_236019 - OBJ
      ?auto_236020 - OBJ
      ?auto_236021 - OBJ
      ?auto_236022 - OBJ
      ?auto_236023 - OBJ
      ?auto_236018 - LOCATION
    )
    :vars
    (
      ?auto_236025 - LOCATION
      ?auto_236024 - CITY
      ?auto_236027 - TRUCK
      ?auto_236026 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_236025 ?auto_236024 ) ( IN-CITY ?auto_236018 ?auto_236024 ) ( not ( = ?auto_236018 ?auto_236025 ) ) ( OBJ-AT ?auto_236021 ?auto_236018 ) ( not ( = ?auto_236021 ?auto_236019 ) ) ( OBJ-AT ?auto_236019 ?auto_236025 ) ( TRUCK-AT ?auto_236027 ?auto_236026 ) ( IN-CITY ?auto_236026 ?auto_236024 ) ( not ( = ?auto_236018 ?auto_236026 ) ) ( not ( = ?auto_236025 ?auto_236026 ) ) ( OBJ-AT ?auto_236020 ?auto_236018 ) ( OBJ-AT ?auto_236022 ?auto_236018 ) ( OBJ-AT ?auto_236023 ?auto_236018 ) ( not ( = ?auto_236019 ?auto_236020 ) ) ( not ( = ?auto_236019 ?auto_236022 ) ) ( not ( = ?auto_236019 ?auto_236023 ) ) ( not ( = ?auto_236020 ?auto_236021 ) ) ( not ( = ?auto_236020 ?auto_236022 ) ) ( not ( = ?auto_236020 ?auto_236023 ) ) ( not ( = ?auto_236021 ?auto_236022 ) ) ( not ( = ?auto_236021 ?auto_236023 ) ) ( not ( = ?auto_236022 ?auto_236023 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_236021 ?auto_236019 ?auto_236018 )
      ( DELIVER-5PKG-VERIFY ?auto_236019 ?auto_236020 ?auto_236021 ?auto_236022 ?auto_236023 ?auto_236018 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_236877 - OBJ
      ?auto_236878 - OBJ
      ?auto_236879 - OBJ
      ?auto_236876 - LOCATION
    )
    :vars
    (
      ?auto_236880 - LOCATION
      ?auto_236881 - CITY
      ?auto_236883 - TRUCK
      ?auto_236882 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_236880 ?auto_236881 ) ( IN-CITY ?auto_236876 ?auto_236881 ) ( not ( = ?auto_236876 ?auto_236880 ) ) ( OBJ-AT ?auto_236877 ?auto_236876 ) ( not ( = ?auto_236877 ?auto_236879 ) ) ( OBJ-AT ?auto_236879 ?auto_236880 ) ( TRUCK-AT ?auto_236883 ?auto_236882 ) ( IN-CITY ?auto_236882 ?auto_236881 ) ( not ( = ?auto_236876 ?auto_236882 ) ) ( not ( = ?auto_236880 ?auto_236882 ) ) ( OBJ-AT ?auto_236878 ?auto_236876 ) ( not ( = ?auto_236877 ?auto_236878 ) ) ( not ( = ?auto_236878 ?auto_236879 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_236877 ?auto_236879 ?auto_236876 )
      ( DELIVER-3PKG-VERIFY ?auto_236877 ?auto_236878 ?auto_236879 ?auto_236876 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_236960 - OBJ
      ?auto_236961 - OBJ
      ?auto_236962 - OBJ
      ?auto_236959 - LOCATION
    )
    :vars
    (
      ?auto_236963 - LOCATION
      ?auto_236964 - CITY
      ?auto_236966 - TRUCK
      ?auto_236965 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_236963 ?auto_236964 ) ( IN-CITY ?auto_236959 ?auto_236964 ) ( not ( = ?auto_236959 ?auto_236963 ) ) ( OBJ-AT ?auto_236961 ?auto_236959 ) ( not ( = ?auto_236961 ?auto_236960 ) ) ( OBJ-AT ?auto_236960 ?auto_236963 ) ( TRUCK-AT ?auto_236966 ?auto_236965 ) ( IN-CITY ?auto_236965 ?auto_236964 ) ( not ( = ?auto_236959 ?auto_236965 ) ) ( not ( = ?auto_236963 ?auto_236965 ) ) ( OBJ-AT ?auto_236962 ?auto_236959 ) ( not ( = ?auto_236960 ?auto_236962 ) ) ( not ( = ?auto_236961 ?auto_236962 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_236961 ?auto_236960 ?auto_236959 )
      ( DELIVER-3PKG-VERIFY ?auto_236960 ?auto_236961 ?auto_236962 ?auto_236959 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_237126 - OBJ
      ?auto_237127 - OBJ
      ?auto_237128 - OBJ
      ?auto_237129 - OBJ
      ?auto_237125 - LOCATION
    )
    :vars
    (
      ?auto_237130 - LOCATION
      ?auto_237131 - CITY
      ?auto_237133 - TRUCK
      ?auto_237132 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_237130 ?auto_237131 ) ( IN-CITY ?auto_237125 ?auto_237131 ) ( not ( = ?auto_237125 ?auto_237130 ) ) ( OBJ-AT ?auto_237129 ?auto_237125 ) ( not ( = ?auto_237129 ?auto_237127 ) ) ( OBJ-AT ?auto_237127 ?auto_237130 ) ( TRUCK-AT ?auto_237133 ?auto_237132 ) ( IN-CITY ?auto_237132 ?auto_237131 ) ( not ( = ?auto_237125 ?auto_237132 ) ) ( not ( = ?auto_237130 ?auto_237132 ) ) ( OBJ-AT ?auto_237126 ?auto_237125 ) ( OBJ-AT ?auto_237128 ?auto_237125 ) ( not ( = ?auto_237126 ?auto_237127 ) ) ( not ( = ?auto_237126 ?auto_237128 ) ) ( not ( = ?auto_237126 ?auto_237129 ) ) ( not ( = ?auto_237127 ?auto_237128 ) ) ( not ( = ?auto_237128 ?auto_237129 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_237129 ?auto_237127 ?auto_237125 )
      ( DELIVER-4PKG-VERIFY ?auto_237126 ?auto_237127 ?auto_237128 ?auto_237129 ?auto_237125 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_237736 - OBJ
      ?auto_237737 - OBJ
      ?auto_237738 - OBJ
      ?auto_237739 - OBJ
      ?auto_237740 - OBJ
      ?auto_237735 - LOCATION
    )
    :vars
    (
      ?auto_237741 - LOCATION
      ?auto_237742 - CITY
      ?auto_237744 - TRUCK
      ?auto_237743 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_237741 ?auto_237742 ) ( IN-CITY ?auto_237735 ?auto_237742 ) ( not ( = ?auto_237735 ?auto_237741 ) ) ( OBJ-AT ?auto_237737 ?auto_237735 ) ( not ( = ?auto_237737 ?auto_237738 ) ) ( OBJ-AT ?auto_237738 ?auto_237741 ) ( TRUCK-AT ?auto_237744 ?auto_237743 ) ( IN-CITY ?auto_237743 ?auto_237742 ) ( not ( = ?auto_237735 ?auto_237743 ) ) ( not ( = ?auto_237741 ?auto_237743 ) ) ( OBJ-AT ?auto_237736 ?auto_237735 ) ( OBJ-AT ?auto_237739 ?auto_237735 ) ( OBJ-AT ?auto_237740 ?auto_237735 ) ( not ( = ?auto_237736 ?auto_237737 ) ) ( not ( = ?auto_237736 ?auto_237738 ) ) ( not ( = ?auto_237736 ?auto_237739 ) ) ( not ( = ?auto_237736 ?auto_237740 ) ) ( not ( = ?auto_237737 ?auto_237739 ) ) ( not ( = ?auto_237737 ?auto_237740 ) ) ( not ( = ?auto_237738 ?auto_237739 ) ) ( not ( = ?auto_237738 ?auto_237740 ) ) ( not ( = ?auto_237739 ?auto_237740 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_237737 ?auto_237738 ?auto_237735 )
      ( DELIVER-5PKG-VERIFY ?auto_237736 ?auto_237737 ?auto_237738 ?auto_237739 ?auto_237740 ?auto_237735 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_245045 - OBJ
      ?auto_245044 - LOCATION
    )
    :vars
    (
      ?auto_245046 - LOCATION
      ?auto_245049 - CITY
      ?auto_245047 - OBJ
      ?auto_245048 - TRUCK
      ?auto_245050 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_245046 ?auto_245049 ) ( IN-CITY ?auto_245044 ?auto_245049 ) ( not ( = ?auto_245044 ?auto_245046 ) ) ( not ( = ?auto_245047 ?auto_245045 ) ) ( OBJ-AT ?auto_245045 ?auto_245046 ) ( IN-TRUCK ?auto_245047 ?auto_245048 ) ( TRUCK-AT ?auto_245048 ?auto_245050 ) ( IN-CITY ?auto_245050 ?auto_245049 ) ( not ( = ?auto_245044 ?auto_245050 ) ) ( not ( = ?auto_245046 ?auto_245050 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_245048 ?auto_245050 ?auto_245044 ?auto_245049 )
      ( DELIVER-2PKG ?auto_245047 ?auto_245045 ?auto_245044 )
      ( DELIVER-1PKG-VERIFY ?auto_245045 ?auto_245044 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_245052 - OBJ
      ?auto_245053 - OBJ
      ?auto_245051 - LOCATION
    )
    :vars
    (
      ?auto_245054 - LOCATION
      ?auto_245057 - CITY
      ?auto_245055 - TRUCK
      ?auto_245056 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_245054 ?auto_245057 ) ( IN-CITY ?auto_245051 ?auto_245057 ) ( not ( = ?auto_245051 ?auto_245054 ) ) ( not ( = ?auto_245052 ?auto_245053 ) ) ( OBJ-AT ?auto_245053 ?auto_245054 ) ( IN-TRUCK ?auto_245052 ?auto_245055 ) ( TRUCK-AT ?auto_245055 ?auto_245056 ) ( IN-CITY ?auto_245056 ?auto_245057 ) ( not ( = ?auto_245051 ?auto_245056 ) ) ( not ( = ?auto_245054 ?auto_245056 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_245053 ?auto_245051 )
      ( DELIVER-2PKG-VERIFY ?auto_245052 ?auto_245053 ?auto_245051 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_245067 - OBJ
      ?auto_245068 - OBJ
      ?auto_245066 - LOCATION
    )
    :vars
    (
      ?auto_245071 - LOCATION
      ?auto_245070 - CITY
      ?auto_245072 - TRUCK
      ?auto_245069 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_245071 ?auto_245070 ) ( IN-CITY ?auto_245066 ?auto_245070 ) ( not ( = ?auto_245066 ?auto_245071 ) ) ( not ( = ?auto_245068 ?auto_245067 ) ) ( OBJ-AT ?auto_245067 ?auto_245071 ) ( IN-TRUCK ?auto_245068 ?auto_245072 ) ( TRUCK-AT ?auto_245072 ?auto_245069 ) ( IN-CITY ?auto_245069 ?auto_245070 ) ( not ( = ?auto_245066 ?auto_245069 ) ) ( not ( = ?auto_245071 ?auto_245069 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_245068 ?auto_245067 ?auto_245066 )
      ( DELIVER-2PKG-VERIFY ?auto_245067 ?auto_245068 ?auto_245066 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_247990 - OBJ
      ?auto_247989 - LOCATION
    )
    :vars
    (
      ?auto_247994 - LOCATION
      ?auto_247992 - CITY
      ?auto_247993 - OBJ
      ?auto_247995 - TRUCK
      ?auto_247991 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_247994 ?auto_247992 ) ( IN-CITY ?auto_247989 ?auto_247992 ) ( not ( = ?auto_247989 ?auto_247994 ) ) ( not ( = ?auto_247993 ?auto_247990 ) ) ( OBJ-AT ?auto_247990 ?auto_247994 ) ( TRUCK-AT ?auto_247995 ?auto_247991 ) ( IN-CITY ?auto_247991 ?auto_247992 ) ( not ( = ?auto_247989 ?auto_247991 ) ) ( not ( = ?auto_247994 ?auto_247991 ) ) ( OBJ-AT ?auto_247993 ?auto_247991 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_247993 ?auto_247995 ?auto_247991 )
      ( DELIVER-2PKG ?auto_247993 ?auto_247990 ?auto_247989 )
      ( DELIVER-1PKG-VERIFY ?auto_247990 ?auto_247989 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_247997 - OBJ
      ?auto_247998 - OBJ
      ?auto_247996 - LOCATION
    )
    :vars
    (
      ?auto_248002 - LOCATION
      ?auto_248000 - CITY
      ?auto_247999 - TRUCK
      ?auto_248001 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_248002 ?auto_248000 ) ( IN-CITY ?auto_247996 ?auto_248000 ) ( not ( = ?auto_247996 ?auto_248002 ) ) ( not ( = ?auto_247997 ?auto_247998 ) ) ( OBJ-AT ?auto_247998 ?auto_248002 ) ( TRUCK-AT ?auto_247999 ?auto_248001 ) ( IN-CITY ?auto_248001 ?auto_248000 ) ( not ( = ?auto_247996 ?auto_248001 ) ) ( not ( = ?auto_248002 ?auto_248001 ) ) ( OBJ-AT ?auto_247997 ?auto_248001 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_247998 ?auto_247996 )
      ( DELIVER-2PKG-VERIFY ?auto_247997 ?auto_247998 ?auto_247996 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_248007 - OBJ
      ?auto_248008 - OBJ
      ?auto_248006 - LOCATION
    )
    :vars
    (
      ?auto_248010 - LOCATION
      ?auto_248012 - CITY
      ?auto_248011 - TRUCK
      ?auto_248009 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_248010 ?auto_248012 ) ( IN-CITY ?auto_248006 ?auto_248012 ) ( not ( = ?auto_248006 ?auto_248010 ) ) ( not ( = ?auto_248008 ?auto_248007 ) ) ( OBJ-AT ?auto_248007 ?auto_248010 ) ( TRUCK-AT ?auto_248011 ?auto_248009 ) ( IN-CITY ?auto_248009 ?auto_248012 ) ( not ( = ?auto_248006 ?auto_248009 ) ) ( not ( = ?auto_248010 ?auto_248009 ) ) ( OBJ-AT ?auto_248008 ?auto_248009 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_248008 ?auto_248007 ?auto_248006 )
      ( DELIVER-2PKG-VERIFY ?auto_248007 ?auto_248008 ?auto_248006 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_274852 - OBJ
      ?auto_274853 - OBJ
      ?auto_274854 - OBJ
      ?auto_274851 - LOCATION
    )
    :vars
    (
      ?auto_274856 - TRUCK
      ?auto_274855 - LOCATION
      ?auto_274857 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_274856 ?auto_274855 ) ( IN-CITY ?auto_274855 ?auto_274857 ) ( IN-CITY ?auto_274851 ?auto_274857 ) ( not ( = ?auto_274851 ?auto_274855 ) ) ( OBJ-AT ?auto_274852 ?auto_274851 ) ( not ( = ?auto_274852 ?auto_274854 ) ) ( OBJ-AT ?auto_274854 ?auto_274855 ) ( OBJ-AT ?auto_274853 ?auto_274851 ) ( not ( = ?auto_274852 ?auto_274853 ) ) ( not ( = ?auto_274853 ?auto_274854 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_274852 ?auto_274854 ?auto_274851 )
      ( DELIVER-3PKG-VERIFY ?auto_274852 ?auto_274853 ?auto_274854 ?auto_274851 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_283755 - OBJ
      ?auto_283756 - OBJ
      ?auto_283757 - OBJ
      ?auto_283754 - LOCATION
    )
    :vars
    (
      ?auto_283759 - LOCATION
      ?auto_283760 - CITY
      ?auto_283758 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_283759 ?auto_283760 ) ( IN-CITY ?auto_283754 ?auto_283760 ) ( not ( = ?auto_283754 ?auto_283759 ) ) ( OBJ-AT ?auto_283757 ?auto_283754 ) ( not ( = ?auto_283757 ?auto_283756 ) ) ( OBJ-AT ?auto_283756 ?auto_283759 ) ( TRUCK-AT ?auto_283758 ?auto_283754 ) ( OBJ-AT ?auto_283755 ?auto_283754 ) ( not ( = ?auto_283755 ?auto_283756 ) ) ( not ( = ?auto_283755 ?auto_283757 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_283757 ?auto_283756 ?auto_283754 )
      ( DELIVER-3PKG-VERIFY ?auto_283755 ?auto_283756 ?auto_283757 ?auto_283754 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_301662 - OBJ
      ?auto_301663 - OBJ
      ?auto_301664 - OBJ
      ?auto_301661 - LOCATION
    )
    :vars
    (
      ?auto_301667 - LOCATION
      ?auto_301665 - CITY
      ?auto_301666 - TRUCK
      ?auto_301668 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_301667 ?auto_301665 ) ( IN-CITY ?auto_301661 ?auto_301665 ) ( not ( = ?auto_301661 ?auto_301667 ) ) ( OBJ-AT ?auto_301662 ?auto_301661 ) ( not ( = ?auto_301662 ?auto_301663 ) ) ( OBJ-AT ?auto_301663 ?auto_301667 ) ( TRUCK-AT ?auto_301666 ?auto_301668 ) ( IN-CITY ?auto_301668 ?auto_301665 ) ( not ( = ?auto_301661 ?auto_301668 ) ) ( not ( = ?auto_301667 ?auto_301668 ) ) ( OBJ-AT ?auto_301664 ?auto_301661 ) ( not ( = ?auto_301662 ?auto_301664 ) ) ( not ( = ?auto_301663 ?auto_301664 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_301662 ?auto_301663 ?auto_301661 )
      ( DELIVER-3PKG-VERIFY ?auto_301662 ?auto_301663 ?auto_301664 ?auto_301661 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_301694 - OBJ
      ?auto_301695 - OBJ
      ?auto_301696 - OBJ
      ?auto_301693 - LOCATION
    )
    :vars
    (
      ?auto_301700 - LOCATION
      ?auto_301698 - CITY
      ?auto_301697 - OBJ
      ?auto_301699 - TRUCK
      ?auto_301701 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_301700 ?auto_301698 ) ( IN-CITY ?auto_301693 ?auto_301698 ) ( not ( = ?auto_301693 ?auto_301700 ) ) ( OBJ-AT ?auto_301697 ?auto_301693 ) ( not ( = ?auto_301697 ?auto_301696 ) ) ( OBJ-AT ?auto_301696 ?auto_301700 ) ( TRUCK-AT ?auto_301699 ?auto_301701 ) ( IN-CITY ?auto_301701 ?auto_301698 ) ( not ( = ?auto_301693 ?auto_301701 ) ) ( not ( = ?auto_301700 ?auto_301701 ) ) ( OBJ-AT ?auto_301694 ?auto_301693 ) ( OBJ-AT ?auto_301695 ?auto_301693 ) ( not ( = ?auto_301694 ?auto_301695 ) ) ( not ( = ?auto_301694 ?auto_301696 ) ) ( not ( = ?auto_301694 ?auto_301697 ) ) ( not ( = ?auto_301695 ?auto_301696 ) ) ( not ( = ?auto_301695 ?auto_301697 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_301697 ?auto_301696 ?auto_301693 )
      ( DELIVER-3PKG-VERIFY ?auto_301694 ?auto_301695 ?auto_301696 ?auto_301693 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_301716 - OBJ
      ?auto_301717 - OBJ
      ?auto_301718 - OBJ
      ?auto_301715 - LOCATION
    )
    :vars
    (
      ?auto_301722 - LOCATION
      ?auto_301720 - CITY
      ?auto_301719 - OBJ
      ?auto_301721 - TRUCK
      ?auto_301723 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_301722 ?auto_301720 ) ( IN-CITY ?auto_301715 ?auto_301720 ) ( not ( = ?auto_301715 ?auto_301722 ) ) ( OBJ-AT ?auto_301719 ?auto_301715 ) ( not ( = ?auto_301719 ?auto_301717 ) ) ( OBJ-AT ?auto_301717 ?auto_301722 ) ( TRUCK-AT ?auto_301721 ?auto_301723 ) ( IN-CITY ?auto_301723 ?auto_301720 ) ( not ( = ?auto_301715 ?auto_301723 ) ) ( not ( = ?auto_301722 ?auto_301723 ) ) ( OBJ-AT ?auto_301716 ?auto_301715 ) ( OBJ-AT ?auto_301718 ?auto_301715 ) ( not ( = ?auto_301716 ?auto_301717 ) ) ( not ( = ?auto_301716 ?auto_301718 ) ) ( not ( = ?auto_301716 ?auto_301719 ) ) ( not ( = ?auto_301717 ?auto_301718 ) ) ( not ( = ?auto_301718 ?auto_301719 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_301719 ?auto_301717 ?auto_301715 )
      ( DELIVER-3PKG-VERIFY ?auto_301716 ?auto_301717 ?auto_301718 ?auto_301715 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_301836 - OBJ
      ?auto_301837 - OBJ
      ?auto_301838 - OBJ
      ?auto_301835 - LOCATION
    )
    :vars
    (
      ?auto_301842 - LOCATION
      ?auto_301840 - CITY
      ?auto_301839 - OBJ
      ?auto_301841 - TRUCK
      ?auto_301843 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_301842 ?auto_301840 ) ( IN-CITY ?auto_301835 ?auto_301840 ) ( not ( = ?auto_301835 ?auto_301842 ) ) ( OBJ-AT ?auto_301839 ?auto_301835 ) ( not ( = ?auto_301839 ?auto_301836 ) ) ( OBJ-AT ?auto_301836 ?auto_301842 ) ( TRUCK-AT ?auto_301841 ?auto_301843 ) ( IN-CITY ?auto_301843 ?auto_301840 ) ( not ( = ?auto_301835 ?auto_301843 ) ) ( not ( = ?auto_301842 ?auto_301843 ) ) ( OBJ-AT ?auto_301837 ?auto_301835 ) ( OBJ-AT ?auto_301838 ?auto_301835 ) ( not ( = ?auto_301836 ?auto_301837 ) ) ( not ( = ?auto_301836 ?auto_301838 ) ) ( not ( = ?auto_301837 ?auto_301838 ) ) ( not ( = ?auto_301837 ?auto_301839 ) ) ( not ( = ?auto_301838 ?auto_301839 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_301839 ?auto_301836 ?auto_301835 )
      ( DELIVER-3PKG-VERIFY ?auto_301836 ?auto_301837 ?auto_301838 ?auto_301835 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_301942 - OBJ
      ?auto_301943 - OBJ
      ?auto_301944 - OBJ
      ?auto_301945 - OBJ
      ?auto_301941 - LOCATION
    )
    :vars
    (
      ?auto_301948 - LOCATION
      ?auto_301946 - CITY
      ?auto_301947 - TRUCK
      ?auto_301949 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_301948 ?auto_301946 ) ( IN-CITY ?auto_301941 ?auto_301946 ) ( not ( = ?auto_301941 ?auto_301948 ) ) ( OBJ-AT ?auto_301943 ?auto_301941 ) ( not ( = ?auto_301943 ?auto_301945 ) ) ( OBJ-AT ?auto_301945 ?auto_301948 ) ( TRUCK-AT ?auto_301947 ?auto_301949 ) ( IN-CITY ?auto_301949 ?auto_301946 ) ( not ( = ?auto_301941 ?auto_301949 ) ) ( not ( = ?auto_301948 ?auto_301949 ) ) ( OBJ-AT ?auto_301942 ?auto_301941 ) ( OBJ-AT ?auto_301944 ?auto_301941 ) ( not ( = ?auto_301942 ?auto_301943 ) ) ( not ( = ?auto_301942 ?auto_301944 ) ) ( not ( = ?auto_301942 ?auto_301945 ) ) ( not ( = ?auto_301943 ?auto_301944 ) ) ( not ( = ?auto_301944 ?auto_301945 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_301943 ?auto_301945 ?auto_301941 )
      ( DELIVER-4PKG-VERIFY ?auto_301942 ?auto_301943 ?auto_301944 ?auto_301945 ?auto_301941 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_301969 - OBJ
      ?auto_301970 - OBJ
      ?auto_301971 - OBJ
      ?auto_301972 - OBJ
      ?auto_301968 - LOCATION
    )
    :vars
    (
      ?auto_301975 - LOCATION
      ?auto_301973 - CITY
      ?auto_301974 - TRUCK
      ?auto_301976 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_301975 ?auto_301973 ) ( IN-CITY ?auto_301968 ?auto_301973 ) ( not ( = ?auto_301968 ?auto_301975 ) ) ( OBJ-AT ?auto_301970 ?auto_301968 ) ( not ( = ?auto_301970 ?auto_301971 ) ) ( OBJ-AT ?auto_301971 ?auto_301975 ) ( TRUCK-AT ?auto_301974 ?auto_301976 ) ( IN-CITY ?auto_301976 ?auto_301973 ) ( not ( = ?auto_301968 ?auto_301976 ) ) ( not ( = ?auto_301975 ?auto_301976 ) ) ( OBJ-AT ?auto_301969 ?auto_301968 ) ( OBJ-AT ?auto_301972 ?auto_301968 ) ( not ( = ?auto_301969 ?auto_301970 ) ) ( not ( = ?auto_301969 ?auto_301971 ) ) ( not ( = ?auto_301969 ?auto_301972 ) ) ( not ( = ?auto_301970 ?auto_301972 ) ) ( not ( = ?auto_301971 ?auto_301972 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_301970 ?auto_301971 ?auto_301968 )
      ( DELIVER-4PKG-VERIFY ?auto_301969 ?auto_301970 ?auto_301971 ?auto_301972 ?auto_301968 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302122 - OBJ
      ?auto_302123 - OBJ
      ?auto_302124 - OBJ
      ?auto_302125 - OBJ
      ?auto_302121 - LOCATION
    )
    :vars
    (
      ?auto_302128 - LOCATION
      ?auto_302126 - CITY
      ?auto_302127 - TRUCK
      ?auto_302129 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302128 ?auto_302126 ) ( IN-CITY ?auto_302121 ?auto_302126 ) ( not ( = ?auto_302121 ?auto_302128 ) ) ( OBJ-AT ?auto_302124 ?auto_302121 ) ( not ( = ?auto_302124 ?auto_302123 ) ) ( OBJ-AT ?auto_302123 ?auto_302128 ) ( TRUCK-AT ?auto_302127 ?auto_302129 ) ( IN-CITY ?auto_302129 ?auto_302126 ) ( not ( = ?auto_302121 ?auto_302129 ) ) ( not ( = ?auto_302128 ?auto_302129 ) ) ( OBJ-AT ?auto_302122 ?auto_302121 ) ( OBJ-AT ?auto_302125 ?auto_302121 ) ( not ( = ?auto_302122 ?auto_302123 ) ) ( not ( = ?auto_302122 ?auto_302124 ) ) ( not ( = ?auto_302122 ?auto_302125 ) ) ( not ( = ?auto_302123 ?auto_302125 ) ) ( not ( = ?auto_302124 ?auto_302125 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302124 ?auto_302123 ?auto_302121 )
      ( DELIVER-4PKG-VERIFY ?auto_302122 ?auto_302123 ?auto_302124 ?auto_302125 ?auto_302121 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302266 - OBJ
      ?auto_302267 - OBJ
      ?auto_302268 - OBJ
      ?auto_302269 - OBJ
      ?auto_302265 - LOCATION
    )
    :vars
    (
      ?auto_302272 - LOCATION
      ?auto_302270 - CITY
      ?auto_302271 - TRUCK
      ?auto_302273 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302272 ?auto_302270 ) ( IN-CITY ?auto_302265 ?auto_302270 ) ( not ( = ?auto_302265 ?auto_302272 ) ) ( OBJ-AT ?auto_302268 ?auto_302265 ) ( not ( = ?auto_302268 ?auto_302269 ) ) ( OBJ-AT ?auto_302269 ?auto_302272 ) ( TRUCK-AT ?auto_302271 ?auto_302273 ) ( IN-CITY ?auto_302273 ?auto_302270 ) ( not ( = ?auto_302265 ?auto_302273 ) ) ( not ( = ?auto_302272 ?auto_302273 ) ) ( OBJ-AT ?auto_302266 ?auto_302265 ) ( OBJ-AT ?auto_302267 ?auto_302265 ) ( not ( = ?auto_302266 ?auto_302267 ) ) ( not ( = ?auto_302266 ?auto_302268 ) ) ( not ( = ?auto_302266 ?auto_302269 ) ) ( not ( = ?auto_302267 ?auto_302268 ) ) ( not ( = ?auto_302267 ?auto_302269 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302268 ?auto_302269 ?auto_302265 )
      ( DELIVER-4PKG-VERIFY ?auto_302266 ?auto_302267 ?auto_302268 ?auto_302269 ?auto_302265 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302338 - OBJ
      ?auto_302339 - OBJ
      ?auto_302340 - OBJ
      ?auto_302341 - OBJ
      ?auto_302337 - LOCATION
    )
    :vars
    (
      ?auto_302345 - LOCATION
      ?auto_302343 - CITY
      ?auto_302342 - OBJ
      ?auto_302344 - TRUCK
      ?auto_302346 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302345 ?auto_302343 ) ( IN-CITY ?auto_302337 ?auto_302343 ) ( not ( = ?auto_302337 ?auto_302345 ) ) ( OBJ-AT ?auto_302342 ?auto_302337 ) ( not ( = ?auto_302342 ?auto_302341 ) ) ( OBJ-AT ?auto_302341 ?auto_302345 ) ( TRUCK-AT ?auto_302344 ?auto_302346 ) ( IN-CITY ?auto_302346 ?auto_302343 ) ( not ( = ?auto_302337 ?auto_302346 ) ) ( not ( = ?auto_302345 ?auto_302346 ) ) ( OBJ-AT ?auto_302338 ?auto_302337 ) ( OBJ-AT ?auto_302339 ?auto_302337 ) ( OBJ-AT ?auto_302340 ?auto_302337 ) ( not ( = ?auto_302338 ?auto_302339 ) ) ( not ( = ?auto_302338 ?auto_302340 ) ) ( not ( = ?auto_302338 ?auto_302341 ) ) ( not ( = ?auto_302338 ?auto_302342 ) ) ( not ( = ?auto_302339 ?auto_302340 ) ) ( not ( = ?auto_302339 ?auto_302341 ) ) ( not ( = ?auto_302339 ?auto_302342 ) ) ( not ( = ?auto_302340 ?auto_302341 ) ) ( not ( = ?auto_302340 ?auto_302342 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302342 ?auto_302341 ?auto_302337 )
      ( DELIVER-4PKG-VERIFY ?auto_302338 ?auto_302339 ?auto_302340 ?auto_302341 ?auto_302337 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302358 - OBJ
      ?auto_302359 - OBJ
      ?auto_302360 - OBJ
      ?auto_302361 - OBJ
      ?auto_302357 - LOCATION
    )
    :vars
    (
      ?auto_302364 - LOCATION
      ?auto_302362 - CITY
      ?auto_302363 - TRUCK
      ?auto_302365 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302364 ?auto_302362 ) ( IN-CITY ?auto_302357 ?auto_302362 ) ( not ( = ?auto_302357 ?auto_302364 ) ) ( OBJ-AT ?auto_302361 ?auto_302357 ) ( not ( = ?auto_302361 ?auto_302360 ) ) ( OBJ-AT ?auto_302360 ?auto_302364 ) ( TRUCK-AT ?auto_302363 ?auto_302365 ) ( IN-CITY ?auto_302365 ?auto_302362 ) ( not ( = ?auto_302357 ?auto_302365 ) ) ( not ( = ?auto_302364 ?auto_302365 ) ) ( OBJ-AT ?auto_302358 ?auto_302357 ) ( OBJ-AT ?auto_302359 ?auto_302357 ) ( not ( = ?auto_302358 ?auto_302359 ) ) ( not ( = ?auto_302358 ?auto_302360 ) ) ( not ( = ?auto_302358 ?auto_302361 ) ) ( not ( = ?auto_302359 ?auto_302360 ) ) ( not ( = ?auto_302359 ?auto_302361 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302361 ?auto_302360 ?auto_302357 )
      ( DELIVER-4PKG-VERIFY ?auto_302358 ?auto_302359 ?auto_302360 ?auto_302361 ?auto_302357 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302367 - OBJ
      ?auto_302368 - OBJ
      ?auto_302369 - OBJ
      ?auto_302370 - OBJ
      ?auto_302366 - LOCATION
    )
    :vars
    (
      ?auto_302374 - LOCATION
      ?auto_302372 - CITY
      ?auto_302371 - OBJ
      ?auto_302373 - TRUCK
      ?auto_302375 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302374 ?auto_302372 ) ( IN-CITY ?auto_302366 ?auto_302372 ) ( not ( = ?auto_302366 ?auto_302374 ) ) ( OBJ-AT ?auto_302371 ?auto_302366 ) ( not ( = ?auto_302371 ?auto_302369 ) ) ( OBJ-AT ?auto_302369 ?auto_302374 ) ( TRUCK-AT ?auto_302373 ?auto_302375 ) ( IN-CITY ?auto_302375 ?auto_302372 ) ( not ( = ?auto_302366 ?auto_302375 ) ) ( not ( = ?auto_302374 ?auto_302375 ) ) ( OBJ-AT ?auto_302367 ?auto_302366 ) ( OBJ-AT ?auto_302368 ?auto_302366 ) ( OBJ-AT ?auto_302370 ?auto_302366 ) ( not ( = ?auto_302367 ?auto_302368 ) ) ( not ( = ?auto_302367 ?auto_302369 ) ) ( not ( = ?auto_302367 ?auto_302370 ) ) ( not ( = ?auto_302367 ?auto_302371 ) ) ( not ( = ?auto_302368 ?auto_302369 ) ) ( not ( = ?auto_302368 ?auto_302370 ) ) ( not ( = ?auto_302368 ?auto_302371 ) ) ( not ( = ?auto_302369 ?auto_302370 ) ) ( not ( = ?auto_302370 ?auto_302371 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302371 ?auto_302369 ?auto_302366 )
      ( DELIVER-4PKG-VERIFY ?auto_302367 ?auto_302368 ?auto_302369 ?auto_302370 ?auto_302366 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302510 - OBJ
      ?auto_302511 - OBJ
      ?auto_302512 - OBJ
      ?auto_302513 - OBJ
      ?auto_302509 - LOCATION
    )
    :vars
    (
      ?auto_302517 - LOCATION
      ?auto_302515 - CITY
      ?auto_302514 - OBJ
      ?auto_302516 - TRUCK
      ?auto_302518 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302517 ?auto_302515 ) ( IN-CITY ?auto_302509 ?auto_302515 ) ( not ( = ?auto_302509 ?auto_302517 ) ) ( OBJ-AT ?auto_302514 ?auto_302509 ) ( not ( = ?auto_302514 ?auto_302511 ) ) ( OBJ-AT ?auto_302511 ?auto_302517 ) ( TRUCK-AT ?auto_302516 ?auto_302518 ) ( IN-CITY ?auto_302518 ?auto_302515 ) ( not ( = ?auto_302509 ?auto_302518 ) ) ( not ( = ?auto_302517 ?auto_302518 ) ) ( OBJ-AT ?auto_302510 ?auto_302509 ) ( OBJ-AT ?auto_302512 ?auto_302509 ) ( OBJ-AT ?auto_302513 ?auto_302509 ) ( not ( = ?auto_302510 ?auto_302511 ) ) ( not ( = ?auto_302510 ?auto_302512 ) ) ( not ( = ?auto_302510 ?auto_302513 ) ) ( not ( = ?auto_302510 ?auto_302514 ) ) ( not ( = ?auto_302511 ?auto_302512 ) ) ( not ( = ?auto_302511 ?auto_302513 ) ) ( not ( = ?auto_302512 ?auto_302513 ) ) ( not ( = ?auto_302512 ?auto_302514 ) ) ( not ( = ?auto_302513 ?auto_302514 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302514 ?auto_302511 ?auto_302509 )
      ( DELIVER-4PKG-VERIFY ?auto_302510 ?auto_302511 ?auto_302512 ?auto_302513 ?auto_302509 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_303006 - OBJ
      ?auto_303007 - OBJ
      ?auto_303008 - OBJ
      ?auto_303009 - OBJ
      ?auto_303005 - LOCATION
    )
    :vars
    (
      ?auto_303012 - LOCATION
      ?auto_303010 - CITY
      ?auto_303011 - TRUCK
      ?auto_303013 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303012 ?auto_303010 ) ( IN-CITY ?auto_303005 ?auto_303010 ) ( not ( = ?auto_303005 ?auto_303012 ) ) ( OBJ-AT ?auto_303007 ?auto_303005 ) ( not ( = ?auto_303007 ?auto_303006 ) ) ( OBJ-AT ?auto_303006 ?auto_303012 ) ( TRUCK-AT ?auto_303011 ?auto_303013 ) ( IN-CITY ?auto_303013 ?auto_303010 ) ( not ( = ?auto_303005 ?auto_303013 ) ) ( not ( = ?auto_303012 ?auto_303013 ) ) ( OBJ-AT ?auto_303008 ?auto_303005 ) ( OBJ-AT ?auto_303009 ?auto_303005 ) ( not ( = ?auto_303006 ?auto_303008 ) ) ( not ( = ?auto_303006 ?auto_303009 ) ) ( not ( = ?auto_303007 ?auto_303008 ) ) ( not ( = ?auto_303007 ?auto_303009 ) ) ( not ( = ?auto_303008 ?auto_303009 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303007 ?auto_303006 ?auto_303005 )
      ( DELIVER-4PKG-VERIFY ?auto_303006 ?auto_303007 ?auto_303008 ?auto_303009 ?auto_303005 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_303114 - OBJ
      ?auto_303115 - OBJ
      ?auto_303116 - OBJ
      ?auto_303117 - OBJ
      ?auto_303113 - LOCATION
    )
    :vars
    (
      ?auto_303120 - LOCATION
      ?auto_303118 - CITY
      ?auto_303119 - TRUCK
      ?auto_303121 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303120 ?auto_303118 ) ( IN-CITY ?auto_303113 ?auto_303118 ) ( not ( = ?auto_303113 ?auto_303120 ) ) ( OBJ-AT ?auto_303117 ?auto_303113 ) ( not ( = ?auto_303117 ?auto_303114 ) ) ( OBJ-AT ?auto_303114 ?auto_303120 ) ( TRUCK-AT ?auto_303119 ?auto_303121 ) ( IN-CITY ?auto_303121 ?auto_303118 ) ( not ( = ?auto_303113 ?auto_303121 ) ) ( not ( = ?auto_303120 ?auto_303121 ) ) ( OBJ-AT ?auto_303115 ?auto_303113 ) ( OBJ-AT ?auto_303116 ?auto_303113 ) ( not ( = ?auto_303114 ?auto_303115 ) ) ( not ( = ?auto_303114 ?auto_303116 ) ) ( not ( = ?auto_303115 ?auto_303116 ) ) ( not ( = ?auto_303115 ?auto_303117 ) ) ( not ( = ?auto_303116 ?auto_303117 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303117 ?auto_303114 ?auto_303113 )
      ( DELIVER-4PKG-VERIFY ?auto_303114 ?auto_303115 ?auto_303116 ?auto_303117 ?auto_303113 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_303159 - OBJ
      ?auto_303160 - OBJ
      ?auto_303161 - OBJ
      ?auto_303162 - OBJ
      ?auto_303158 - LOCATION
    )
    :vars
    (
      ?auto_303166 - LOCATION
      ?auto_303164 - CITY
      ?auto_303163 - OBJ
      ?auto_303165 - TRUCK
      ?auto_303167 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303166 ?auto_303164 ) ( IN-CITY ?auto_303158 ?auto_303164 ) ( not ( = ?auto_303158 ?auto_303166 ) ) ( OBJ-AT ?auto_303163 ?auto_303158 ) ( not ( = ?auto_303163 ?auto_303159 ) ) ( OBJ-AT ?auto_303159 ?auto_303166 ) ( TRUCK-AT ?auto_303165 ?auto_303167 ) ( IN-CITY ?auto_303167 ?auto_303164 ) ( not ( = ?auto_303158 ?auto_303167 ) ) ( not ( = ?auto_303166 ?auto_303167 ) ) ( OBJ-AT ?auto_303160 ?auto_303158 ) ( OBJ-AT ?auto_303161 ?auto_303158 ) ( OBJ-AT ?auto_303162 ?auto_303158 ) ( not ( = ?auto_303159 ?auto_303160 ) ) ( not ( = ?auto_303159 ?auto_303161 ) ) ( not ( = ?auto_303159 ?auto_303162 ) ) ( not ( = ?auto_303160 ?auto_303161 ) ) ( not ( = ?auto_303160 ?auto_303162 ) ) ( not ( = ?auto_303160 ?auto_303163 ) ) ( not ( = ?auto_303161 ?auto_303162 ) ) ( not ( = ?auto_303161 ?auto_303163 ) ) ( not ( = ?auto_303162 ?auto_303163 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303163 ?auto_303159 ?auto_303158 )
      ( DELIVER-4PKG-VERIFY ?auto_303159 ?auto_303160 ?auto_303161 ?auto_303162 ?auto_303158 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_303583 - OBJ
      ?auto_303584 - OBJ
      ?auto_303585 - OBJ
      ?auto_303586 - OBJ
      ?auto_303587 - OBJ
      ?auto_303582 - LOCATION
    )
    :vars
    (
      ?auto_303590 - LOCATION
      ?auto_303588 - CITY
      ?auto_303589 - TRUCK
      ?auto_303591 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303590 ?auto_303588 ) ( IN-CITY ?auto_303582 ?auto_303588 ) ( not ( = ?auto_303582 ?auto_303590 ) ) ( OBJ-AT ?auto_303585 ?auto_303582 ) ( not ( = ?auto_303585 ?auto_303587 ) ) ( OBJ-AT ?auto_303587 ?auto_303590 ) ( TRUCK-AT ?auto_303589 ?auto_303591 ) ( IN-CITY ?auto_303591 ?auto_303588 ) ( not ( = ?auto_303582 ?auto_303591 ) ) ( not ( = ?auto_303590 ?auto_303591 ) ) ( OBJ-AT ?auto_303583 ?auto_303582 ) ( OBJ-AT ?auto_303584 ?auto_303582 ) ( OBJ-AT ?auto_303586 ?auto_303582 ) ( not ( = ?auto_303583 ?auto_303584 ) ) ( not ( = ?auto_303583 ?auto_303585 ) ) ( not ( = ?auto_303583 ?auto_303586 ) ) ( not ( = ?auto_303583 ?auto_303587 ) ) ( not ( = ?auto_303584 ?auto_303585 ) ) ( not ( = ?auto_303584 ?auto_303586 ) ) ( not ( = ?auto_303584 ?auto_303587 ) ) ( not ( = ?auto_303585 ?auto_303586 ) ) ( not ( = ?auto_303586 ?auto_303587 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303585 ?auto_303587 ?auto_303582 )
      ( DELIVER-5PKG-VERIFY ?auto_303583 ?auto_303584 ?auto_303585 ?auto_303586 ?auto_303587 ?auto_303582 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_303613 - OBJ
      ?auto_303614 - OBJ
      ?auto_303615 - OBJ
      ?auto_303616 - OBJ
      ?auto_303617 - OBJ
      ?auto_303612 - LOCATION
    )
    :vars
    (
      ?auto_303620 - LOCATION
      ?auto_303618 - CITY
      ?auto_303619 - TRUCK
      ?auto_303621 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303620 ?auto_303618 ) ( IN-CITY ?auto_303612 ?auto_303618 ) ( not ( = ?auto_303612 ?auto_303620 ) ) ( OBJ-AT ?auto_303615 ?auto_303612 ) ( not ( = ?auto_303615 ?auto_303616 ) ) ( OBJ-AT ?auto_303616 ?auto_303620 ) ( TRUCK-AT ?auto_303619 ?auto_303621 ) ( IN-CITY ?auto_303621 ?auto_303618 ) ( not ( = ?auto_303612 ?auto_303621 ) ) ( not ( = ?auto_303620 ?auto_303621 ) ) ( OBJ-AT ?auto_303613 ?auto_303612 ) ( OBJ-AT ?auto_303614 ?auto_303612 ) ( OBJ-AT ?auto_303617 ?auto_303612 ) ( not ( = ?auto_303613 ?auto_303614 ) ) ( not ( = ?auto_303613 ?auto_303615 ) ) ( not ( = ?auto_303613 ?auto_303616 ) ) ( not ( = ?auto_303613 ?auto_303617 ) ) ( not ( = ?auto_303614 ?auto_303615 ) ) ( not ( = ?auto_303614 ?auto_303616 ) ) ( not ( = ?auto_303614 ?auto_303617 ) ) ( not ( = ?auto_303615 ?auto_303617 ) ) ( not ( = ?auto_303616 ?auto_303617 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303615 ?auto_303616 ?auto_303612 )
      ( DELIVER-5PKG-VERIFY ?auto_303613 ?auto_303614 ?auto_303615 ?auto_303616 ?auto_303617 ?auto_303612 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_303653 - OBJ
      ?auto_303654 - OBJ
      ?auto_303655 - OBJ
      ?auto_303656 - OBJ
      ?auto_303657 - OBJ
      ?auto_303652 - LOCATION
    )
    :vars
    (
      ?auto_303660 - LOCATION
      ?auto_303658 - CITY
      ?auto_303659 - TRUCK
      ?auto_303661 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303660 ?auto_303658 ) ( IN-CITY ?auto_303652 ?auto_303658 ) ( not ( = ?auto_303652 ?auto_303660 ) ) ( OBJ-AT ?auto_303654 ?auto_303652 ) ( not ( = ?auto_303654 ?auto_303657 ) ) ( OBJ-AT ?auto_303657 ?auto_303660 ) ( TRUCK-AT ?auto_303659 ?auto_303661 ) ( IN-CITY ?auto_303661 ?auto_303658 ) ( not ( = ?auto_303652 ?auto_303661 ) ) ( not ( = ?auto_303660 ?auto_303661 ) ) ( OBJ-AT ?auto_303653 ?auto_303652 ) ( OBJ-AT ?auto_303655 ?auto_303652 ) ( OBJ-AT ?auto_303656 ?auto_303652 ) ( not ( = ?auto_303653 ?auto_303654 ) ) ( not ( = ?auto_303653 ?auto_303655 ) ) ( not ( = ?auto_303653 ?auto_303656 ) ) ( not ( = ?auto_303653 ?auto_303657 ) ) ( not ( = ?auto_303654 ?auto_303655 ) ) ( not ( = ?auto_303654 ?auto_303656 ) ) ( not ( = ?auto_303655 ?auto_303656 ) ) ( not ( = ?auto_303655 ?auto_303657 ) ) ( not ( = ?auto_303656 ?auto_303657 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303654 ?auto_303657 ?auto_303652 )
      ( DELIVER-5PKG-VERIFY ?auto_303653 ?auto_303654 ?auto_303655 ?auto_303656 ?auto_303657 ?auto_303652 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_303683 - OBJ
      ?auto_303684 - OBJ
      ?auto_303685 - OBJ
      ?auto_303686 - OBJ
      ?auto_303687 - OBJ
      ?auto_303682 - LOCATION
    )
    :vars
    (
      ?auto_303690 - LOCATION
      ?auto_303688 - CITY
      ?auto_303689 - TRUCK
      ?auto_303691 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303690 ?auto_303688 ) ( IN-CITY ?auto_303682 ?auto_303688 ) ( not ( = ?auto_303682 ?auto_303690 ) ) ( OBJ-AT ?auto_303684 ?auto_303682 ) ( not ( = ?auto_303684 ?auto_303686 ) ) ( OBJ-AT ?auto_303686 ?auto_303690 ) ( TRUCK-AT ?auto_303689 ?auto_303691 ) ( IN-CITY ?auto_303691 ?auto_303688 ) ( not ( = ?auto_303682 ?auto_303691 ) ) ( not ( = ?auto_303690 ?auto_303691 ) ) ( OBJ-AT ?auto_303683 ?auto_303682 ) ( OBJ-AT ?auto_303685 ?auto_303682 ) ( OBJ-AT ?auto_303687 ?auto_303682 ) ( not ( = ?auto_303683 ?auto_303684 ) ) ( not ( = ?auto_303683 ?auto_303685 ) ) ( not ( = ?auto_303683 ?auto_303686 ) ) ( not ( = ?auto_303683 ?auto_303687 ) ) ( not ( = ?auto_303684 ?auto_303685 ) ) ( not ( = ?auto_303684 ?auto_303687 ) ) ( not ( = ?auto_303685 ?auto_303686 ) ) ( not ( = ?auto_303685 ?auto_303687 ) ) ( not ( = ?auto_303686 ?auto_303687 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303684 ?auto_303686 ?auto_303682 )
      ( DELIVER-5PKG-VERIFY ?auto_303683 ?auto_303684 ?auto_303685 ?auto_303686 ?auto_303687 ?auto_303682 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_303793 - OBJ
      ?auto_303794 - OBJ
      ?auto_303795 - OBJ
      ?auto_303796 - OBJ
      ?auto_303797 - OBJ
      ?auto_303792 - LOCATION
    )
    :vars
    (
      ?auto_303800 - LOCATION
      ?auto_303798 - CITY
      ?auto_303799 - TRUCK
      ?auto_303801 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303800 ?auto_303798 ) ( IN-CITY ?auto_303792 ?auto_303798 ) ( not ( = ?auto_303792 ?auto_303800 ) ) ( OBJ-AT ?auto_303796 ?auto_303792 ) ( not ( = ?auto_303796 ?auto_303795 ) ) ( OBJ-AT ?auto_303795 ?auto_303800 ) ( TRUCK-AT ?auto_303799 ?auto_303801 ) ( IN-CITY ?auto_303801 ?auto_303798 ) ( not ( = ?auto_303792 ?auto_303801 ) ) ( not ( = ?auto_303800 ?auto_303801 ) ) ( OBJ-AT ?auto_303793 ?auto_303792 ) ( OBJ-AT ?auto_303794 ?auto_303792 ) ( OBJ-AT ?auto_303797 ?auto_303792 ) ( not ( = ?auto_303793 ?auto_303794 ) ) ( not ( = ?auto_303793 ?auto_303795 ) ) ( not ( = ?auto_303793 ?auto_303796 ) ) ( not ( = ?auto_303793 ?auto_303797 ) ) ( not ( = ?auto_303794 ?auto_303795 ) ) ( not ( = ?auto_303794 ?auto_303796 ) ) ( not ( = ?auto_303794 ?auto_303797 ) ) ( not ( = ?auto_303795 ?auto_303797 ) ) ( not ( = ?auto_303796 ?auto_303797 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303796 ?auto_303795 ?auto_303792 )
      ( DELIVER-5PKG-VERIFY ?auto_303793 ?auto_303794 ?auto_303795 ?auto_303796 ?auto_303797 ?auto_303792 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_303823 - OBJ
      ?auto_303824 - OBJ
      ?auto_303825 - OBJ
      ?auto_303826 - OBJ
      ?auto_303827 - OBJ
      ?auto_303822 - LOCATION
    )
    :vars
    (
      ?auto_303830 - LOCATION
      ?auto_303828 - CITY
      ?auto_303829 - TRUCK
      ?auto_303831 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303830 ?auto_303828 ) ( IN-CITY ?auto_303822 ?auto_303828 ) ( not ( = ?auto_303822 ?auto_303830 ) ) ( OBJ-AT ?auto_303827 ?auto_303822 ) ( not ( = ?auto_303827 ?auto_303825 ) ) ( OBJ-AT ?auto_303825 ?auto_303830 ) ( TRUCK-AT ?auto_303829 ?auto_303831 ) ( IN-CITY ?auto_303831 ?auto_303828 ) ( not ( = ?auto_303822 ?auto_303831 ) ) ( not ( = ?auto_303830 ?auto_303831 ) ) ( OBJ-AT ?auto_303823 ?auto_303822 ) ( OBJ-AT ?auto_303824 ?auto_303822 ) ( OBJ-AT ?auto_303826 ?auto_303822 ) ( not ( = ?auto_303823 ?auto_303824 ) ) ( not ( = ?auto_303823 ?auto_303825 ) ) ( not ( = ?auto_303823 ?auto_303826 ) ) ( not ( = ?auto_303823 ?auto_303827 ) ) ( not ( = ?auto_303824 ?auto_303825 ) ) ( not ( = ?auto_303824 ?auto_303826 ) ) ( not ( = ?auto_303824 ?auto_303827 ) ) ( not ( = ?auto_303825 ?auto_303826 ) ) ( not ( = ?auto_303826 ?auto_303827 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303827 ?auto_303825 ?auto_303822 )
      ( DELIVER-5PKG-VERIFY ?auto_303823 ?auto_303824 ?auto_303825 ?auto_303826 ?auto_303827 ?auto_303822 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_303973 - OBJ
      ?auto_303974 - OBJ
      ?auto_303975 - OBJ
      ?auto_303976 - OBJ
      ?auto_303977 - OBJ
      ?auto_303972 - LOCATION
    )
    :vars
    (
      ?auto_303980 - LOCATION
      ?auto_303978 - CITY
      ?auto_303979 - TRUCK
      ?auto_303981 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303980 ?auto_303978 ) ( IN-CITY ?auto_303972 ?auto_303978 ) ( not ( = ?auto_303972 ?auto_303980 ) ) ( OBJ-AT ?auto_303977 ?auto_303972 ) ( not ( = ?auto_303977 ?auto_303976 ) ) ( OBJ-AT ?auto_303976 ?auto_303980 ) ( TRUCK-AT ?auto_303979 ?auto_303981 ) ( IN-CITY ?auto_303981 ?auto_303978 ) ( not ( = ?auto_303972 ?auto_303981 ) ) ( not ( = ?auto_303980 ?auto_303981 ) ) ( OBJ-AT ?auto_303973 ?auto_303972 ) ( OBJ-AT ?auto_303974 ?auto_303972 ) ( OBJ-AT ?auto_303975 ?auto_303972 ) ( not ( = ?auto_303973 ?auto_303974 ) ) ( not ( = ?auto_303973 ?auto_303975 ) ) ( not ( = ?auto_303973 ?auto_303976 ) ) ( not ( = ?auto_303973 ?auto_303977 ) ) ( not ( = ?auto_303974 ?auto_303975 ) ) ( not ( = ?auto_303974 ?auto_303976 ) ) ( not ( = ?auto_303974 ?auto_303977 ) ) ( not ( = ?auto_303975 ?auto_303976 ) ) ( not ( = ?auto_303975 ?auto_303977 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303977 ?auto_303976 ?auto_303972 )
      ( DELIVER-5PKG-VERIFY ?auto_303973 ?auto_303974 ?auto_303975 ?auto_303976 ?auto_303977 ?auto_303972 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_304013 - OBJ
      ?auto_304014 - OBJ
      ?auto_304015 - OBJ
      ?auto_304016 - OBJ
      ?auto_304017 - OBJ
      ?auto_304012 - LOCATION
    )
    :vars
    (
      ?auto_304020 - LOCATION
      ?auto_304018 - CITY
      ?auto_304019 - TRUCK
      ?auto_304021 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_304020 ?auto_304018 ) ( IN-CITY ?auto_304012 ?auto_304018 ) ( not ( = ?auto_304012 ?auto_304020 ) ) ( OBJ-AT ?auto_304016 ?auto_304012 ) ( not ( = ?auto_304016 ?auto_304017 ) ) ( OBJ-AT ?auto_304017 ?auto_304020 ) ( TRUCK-AT ?auto_304019 ?auto_304021 ) ( IN-CITY ?auto_304021 ?auto_304018 ) ( not ( = ?auto_304012 ?auto_304021 ) ) ( not ( = ?auto_304020 ?auto_304021 ) ) ( OBJ-AT ?auto_304013 ?auto_304012 ) ( OBJ-AT ?auto_304014 ?auto_304012 ) ( OBJ-AT ?auto_304015 ?auto_304012 ) ( not ( = ?auto_304013 ?auto_304014 ) ) ( not ( = ?auto_304013 ?auto_304015 ) ) ( not ( = ?auto_304013 ?auto_304016 ) ) ( not ( = ?auto_304013 ?auto_304017 ) ) ( not ( = ?auto_304014 ?auto_304015 ) ) ( not ( = ?auto_304014 ?auto_304016 ) ) ( not ( = ?auto_304014 ?auto_304017 ) ) ( not ( = ?auto_304015 ?auto_304016 ) ) ( not ( = ?auto_304015 ?auto_304017 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_304016 ?auto_304017 ?auto_304012 )
      ( DELIVER-5PKG-VERIFY ?auto_304013 ?auto_304014 ?auto_304015 ?auto_304016 ?auto_304017 ?auto_304012 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_304693 - OBJ
      ?auto_304694 - OBJ
      ?auto_304695 - OBJ
      ?auto_304696 - OBJ
      ?auto_304697 - OBJ
      ?auto_304692 - LOCATION
    )
    :vars
    (
      ?auto_304700 - LOCATION
      ?auto_304698 - CITY
      ?auto_304699 - TRUCK
      ?auto_304701 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_304700 ?auto_304698 ) ( IN-CITY ?auto_304692 ?auto_304698 ) ( not ( = ?auto_304692 ?auto_304700 ) ) ( OBJ-AT ?auto_304695 ?auto_304692 ) ( not ( = ?auto_304695 ?auto_304694 ) ) ( OBJ-AT ?auto_304694 ?auto_304700 ) ( TRUCK-AT ?auto_304699 ?auto_304701 ) ( IN-CITY ?auto_304701 ?auto_304698 ) ( not ( = ?auto_304692 ?auto_304701 ) ) ( not ( = ?auto_304700 ?auto_304701 ) ) ( OBJ-AT ?auto_304693 ?auto_304692 ) ( OBJ-AT ?auto_304696 ?auto_304692 ) ( OBJ-AT ?auto_304697 ?auto_304692 ) ( not ( = ?auto_304693 ?auto_304694 ) ) ( not ( = ?auto_304693 ?auto_304695 ) ) ( not ( = ?auto_304693 ?auto_304696 ) ) ( not ( = ?auto_304693 ?auto_304697 ) ) ( not ( = ?auto_304694 ?auto_304696 ) ) ( not ( = ?auto_304694 ?auto_304697 ) ) ( not ( = ?auto_304695 ?auto_304696 ) ) ( not ( = ?auto_304695 ?auto_304697 ) ) ( not ( = ?auto_304696 ?auto_304697 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_304695 ?auto_304694 ?auto_304692 )
      ( DELIVER-5PKG-VERIFY ?auto_304693 ?auto_304694 ?auto_304695 ?auto_304696 ?auto_304697 ?auto_304692 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_304843 - OBJ
      ?auto_304844 - OBJ
      ?auto_304845 - OBJ
      ?auto_304846 - OBJ
      ?auto_304847 - OBJ
      ?auto_304842 - LOCATION
    )
    :vars
    (
      ?auto_304850 - LOCATION
      ?auto_304848 - CITY
      ?auto_304849 - TRUCK
      ?auto_304851 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_304850 ?auto_304848 ) ( IN-CITY ?auto_304842 ?auto_304848 ) ( not ( = ?auto_304842 ?auto_304850 ) ) ( OBJ-AT ?auto_304847 ?auto_304842 ) ( not ( = ?auto_304847 ?auto_304844 ) ) ( OBJ-AT ?auto_304844 ?auto_304850 ) ( TRUCK-AT ?auto_304849 ?auto_304851 ) ( IN-CITY ?auto_304851 ?auto_304848 ) ( not ( = ?auto_304842 ?auto_304851 ) ) ( not ( = ?auto_304850 ?auto_304851 ) ) ( OBJ-AT ?auto_304843 ?auto_304842 ) ( OBJ-AT ?auto_304845 ?auto_304842 ) ( OBJ-AT ?auto_304846 ?auto_304842 ) ( not ( = ?auto_304843 ?auto_304844 ) ) ( not ( = ?auto_304843 ?auto_304845 ) ) ( not ( = ?auto_304843 ?auto_304846 ) ) ( not ( = ?auto_304843 ?auto_304847 ) ) ( not ( = ?auto_304844 ?auto_304845 ) ) ( not ( = ?auto_304844 ?auto_304846 ) ) ( not ( = ?auto_304845 ?auto_304846 ) ) ( not ( = ?auto_304845 ?auto_304847 ) ) ( not ( = ?auto_304846 ?auto_304847 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_304847 ?auto_304844 ?auto_304842 )
      ( DELIVER-5PKG-VERIFY ?auto_304843 ?auto_304844 ?auto_304845 ?auto_304846 ?auto_304847 ?auto_304842 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_304853 - OBJ
      ?auto_304854 - OBJ
      ?auto_304855 - OBJ
      ?auto_304856 - OBJ
      ?auto_304857 - OBJ
      ?auto_304852 - LOCATION
    )
    :vars
    (
      ?auto_304860 - LOCATION
      ?auto_304858 - CITY
      ?auto_304859 - TRUCK
      ?auto_304861 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_304860 ?auto_304858 ) ( IN-CITY ?auto_304852 ?auto_304858 ) ( not ( = ?auto_304852 ?auto_304860 ) ) ( OBJ-AT ?auto_304856 ?auto_304852 ) ( not ( = ?auto_304856 ?auto_304854 ) ) ( OBJ-AT ?auto_304854 ?auto_304860 ) ( TRUCK-AT ?auto_304859 ?auto_304861 ) ( IN-CITY ?auto_304861 ?auto_304858 ) ( not ( = ?auto_304852 ?auto_304861 ) ) ( not ( = ?auto_304860 ?auto_304861 ) ) ( OBJ-AT ?auto_304853 ?auto_304852 ) ( OBJ-AT ?auto_304855 ?auto_304852 ) ( OBJ-AT ?auto_304857 ?auto_304852 ) ( not ( = ?auto_304853 ?auto_304854 ) ) ( not ( = ?auto_304853 ?auto_304855 ) ) ( not ( = ?auto_304853 ?auto_304856 ) ) ( not ( = ?auto_304853 ?auto_304857 ) ) ( not ( = ?auto_304854 ?auto_304855 ) ) ( not ( = ?auto_304854 ?auto_304857 ) ) ( not ( = ?auto_304855 ?auto_304856 ) ) ( not ( = ?auto_304855 ?auto_304857 ) ) ( not ( = ?auto_304856 ?auto_304857 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_304856 ?auto_304854 ?auto_304852 )
      ( DELIVER-5PKG-VERIFY ?auto_304853 ?auto_304854 ?auto_304855 ?auto_304856 ?auto_304857 ?auto_304852 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_305773 - OBJ
      ?auto_305774 - OBJ
      ?auto_305775 - OBJ
      ?auto_305776 - OBJ
      ?auto_305777 - OBJ
      ?auto_305772 - LOCATION
    )
    :vars
    (
      ?auto_305781 - LOCATION
      ?auto_305779 - CITY
      ?auto_305778 - OBJ
      ?auto_305780 - TRUCK
      ?auto_305782 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_305781 ?auto_305779 ) ( IN-CITY ?auto_305772 ?auto_305779 ) ( not ( = ?auto_305772 ?auto_305781 ) ) ( OBJ-AT ?auto_305778 ?auto_305772 ) ( not ( = ?auto_305778 ?auto_305777 ) ) ( OBJ-AT ?auto_305777 ?auto_305781 ) ( TRUCK-AT ?auto_305780 ?auto_305782 ) ( IN-CITY ?auto_305782 ?auto_305779 ) ( not ( = ?auto_305772 ?auto_305782 ) ) ( not ( = ?auto_305781 ?auto_305782 ) ) ( OBJ-AT ?auto_305773 ?auto_305772 ) ( OBJ-AT ?auto_305774 ?auto_305772 ) ( OBJ-AT ?auto_305775 ?auto_305772 ) ( OBJ-AT ?auto_305776 ?auto_305772 ) ( not ( = ?auto_305773 ?auto_305774 ) ) ( not ( = ?auto_305773 ?auto_305775 ) ) ( not ( = ?auto_305773 ?auto_305776 ) ) ( not ( = ?auto_305773 ?auto_305777 ) ) ( not ( = ?auto_305773 ?auto_305778 ) ) ( not ( = ?auto_305774 ?auto_305775 ) ) ( not ( = ?auto_305774 ?auto_305776 ) ) ( not ( = ?auto_305774 ?auto_305777 ) ) ( not ( = ?auto_305774 ?auto_305778 ) ) ( not ( = ?auto_305775 ?auto_305776 ) ) ( not ( = ?auto_305775 ?auto_305777 ) ) ( not ( = ?auto_305775 ?auto_305778 ) ) ( not ( = ?auto_305776 ?auto_305777 ) ) ( not ( = ?auto_305776 ?auto_305778 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_305778 ?auto_305777 ?auto_305772 )
      ( DELIVER-5PKG-VERIFY ?auto_305773 ?auto_305774 ?auto_305775 ?auto_305776 ?auto_305777 ?auto_305772 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_305805 - OBJ
      ?auto_305806 - OBJ
      ?auto_305807 - OBJ
      ?auto_305808 - OBJ
      ?auto_305809 - OBJ
      ?auto_305804 - LOCATION
    )
    :vars
    (
      ?auto_305813 - LOCATION
      ?auto_305811 - CITY
      ?auto_305810 - OBJ
      ?auto_305812 - TRUCK
      ?auto_305814 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_305813 ?auto_305811 ) ( IN-CITY ?auto_305804 ?auto_305811 ) ( not ( = ?auto_305804 ?auto_305813 ) ) ( OBJ-AT ?auto_305810 ?auto_305804 ) ( not ( = ?auto_305810 ?auto_305808 ) ) ( OBJ-AT ?auto_305808 ?auto_305813 ) ( TRUCK-AT ?auto_305812 ?auto_305814 ) ( IN-CITY ?auto_305814 ?auto_305811 ) ( not ( = ?auto_305804 ?auto_305814 ) ) ( not ( = ?auto_305813 ?auto_305814 ) ) ( OBJ-AT ?auto_305805 ?auto_305804 ) ( OBJ-AT ?auto_305806 ?auto_305804 ) ( OBJ-AT ?auto_305807 ?auto_305804 ) ( OBJ-AT ?auto_305809 ?auto_305804 ) ( not ( = ?auto_305805 ?auto_305806 ) ) ( not ( = ?auto_305805 ?auto_305807 ) ) ( not ( = ?auto_305805 ?auto_305808 ) ) ( not ( = ?auto_305805 ?auto_305809 ) ) ( not ( = ?auto_305805 ?auto_305810 ) ) ( not ( = ?auto_305806 ?auto_305807 ) ) ( not ( = ?auto_305806 ?auto_305808 ) ) ( not ( = ?auto_305806 ?auto_305809 ) ) ( not ( = ?auto_305806 ?auto_305810 ) ) ( not ( = ?auto_305807 ?auto_305808 ) ) ( not ( = ?auto_305807 ?auto_305809 ) ) ( not ( = ?auto_305807 ?auto_305810 ) ) ( not ( = ?auto_305808 ?auto_305809 ) ) ( not ( = ?auto_305809 ?auto_305810 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_305810 ?auto_305808 ?auto_305804 )
      ( DELIVER-5PKG-VERIFY ?auto_305805 ?auto_305806 ?auto_305807 ?auto_305808 ?auto_305809 ?auto_305804 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_305963 - OBJ
      ?auto_305964 - OBJ
      ?auto_305965 - OBJ
      ?auto_305966 - OBJ
      ?auto_305967 - OBJ
      ?auto_305962 - LOCATION
    )
    :vars
    (
      ?auto_305971 - LOCATION
      ?auto_305969 - CITY
      ?auto_305968 - OBJ
      ?auto_305970 - TRUCK
      ?auto_305972 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_305971 ?auto_305969 ) ( IN-CITY ?auto_305962 ?auto_305969 ) ( not ( = ?auto_305962 ?auto_305971 ) ) ( OBJ-AT ?auto_305968 ?auto_305962 ) ( not ( = ?auto_305968 ?auto_305965 ) ) ( OBJ-AT ?auto_305965 ?auto_305971 ) ( TRUCK-AT ?auto_305970 ?auto_305972 ) ( IN-CITY ?auto_305972 ?auto_305969 ) ( not ( = ?auto_305962 ?auto_305972 ) ) ( not ( = ?auto_305971 ?auto_305972 ) ) ( OBJ-AT ?auto_305963 ?auto_305962 ) ( OBJ-AT ?auto_305964 ?auto_305962 ) ( OBJ-AT ?auto_305966 ?auto_305962 ) ( OBJ-AT ?auto_305967 ?auto_305962 ) ( not ( = ?auto_305963 ?auto_305964 ) ) ( not ( = ?auto_305963 ?auto_305965 ) ) ( not ( = ?auto_305963 ?auto_305966 ) ) ( not ( = ?auto_305963 ?auto_305967 ) ) ( not ( = ?auto_305963 ?auto_305968 ) ) ( not ( = ?auto_305964 ?auto_305965 ) ) ( not ( = ?auto_305964 ?auto_305966 ) ) ( not ( = ?auto_305964 ?auto_305967 ) ) ( not ( = ?auto_305964 ?auto_305968 ) ) ( not ( = ?auto_305965 ?auto_305966 ) ) ( not ( = ?auto_305965 ?auto_305967 ) ) ( not ( = ?auto_305966 ?auto_305967 ) ) ( not ( = ?auto_305966 ?auto_305968 ) ) ( not ( = ?auto_305967 ?auto_305968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_305968 ?auto_305965 ?auto_305962 )
      ( DELIVER-5PKG-VERIFY ?auto_305963 ?auto_305964 ?auto_305965 ?auto_305966 ?auto_305967 ?auto_305962 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_306681 - OBJ
      ?auto_306682 - OBJ
      ?auto_306683 - OBJ
      ?auto_306684 - OBJ
      ?auto_306685 - OBJ
      ?auto_306680 - LOCATION
    )
    :vars
    (
      ?auto_306689 - LOCATION
      ?auto_306687 - CITY
      ?auto_306686 - OBJ
      ?auto_306688 - TRUCK
      ?auto_306690 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_306689 ?auto_306687 ) ( IN-CITY ?auto_306680 ?auto_306687 ) ( not ( = ?auto_306680 ?auto_306689 ) ) ( OBJ-AT ?auto_306686 ?auto_306680 ) ( not ( = ?auto_306686 ?auto_306682 ) ) ( OBJ-AT ?auto_306682 ?auto_306689 ) ( TRUCK-AT ?auto_306688 ?auto_306690 ) ( IN-CITY ?auto_306690 ?auto_306687 ) ( not ( = ?auto_306680 ?auto_306690 ) ) ( not ( = ?auto_306689 ?auto_306690 ) ) ( OBJ-AT ?auto_306681 ?auto_306680 ) ( OBJ-AT ?auto_306683 ?auto_306680 ) ( OBJ-AT ?auto_306684 ?auto_306680 ) ( OBJ-AT ?auto_306685 ?auto_306680 ) ( not ( = ?auto_306681 ?auto_306682 ) ) ( not ( = ?auto_306681 ?auto_306683 ) ) ( not ( = ?auto_306681 ?auto_306684 ) ) ( not ( = ?auto_306681 ?auto_306685 ) ) ( not ( = ?auto_306681 ?auto_306686 ) ) ( not ( = ?auto_306682 ?auto_306683 ) ) ( not ( = ?auto_306682 ?auto_306684 ) ) ( not ( = ?auto_306682 ?auto_306685 ) ) ( not ( = ?auto_306683 ?auto_306684 ) ) ( not ( = ?auto_306683 ?auto_306685 ) ) ( not ( = ?auto_306683 ?auto_306686 ) ) ( not ( = ?auto_306684 ?auto_306685 ) ) ( not ( = ?auto_306684 ?auto_306686 ) ) ( not ( = ?auto_306685 ?auto_306686 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_306686 ?auto_306682 ?auto_306680 )
      ( DELIVER-5PKG-VERIFY ?auto_306681 ?auto_306682 ?auto_306683 ?auto_306684 ?auto_306685 ?auto_306680 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_308993 - OBJ
      ?auto_308994 - OBJ
      ?auto_308995 - OBJ
      ?auto_308996 - OBJ
      ?auto_308997 - OBJ
      ?auto_308992 - LOCATION
    )
    :vars
    (
      ?auto_309000 - LOCATION
      ?auto_308998 - CITY
      ?auto_308999 - TRUCK
      ?auto_309001 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_309000 ?auto_308998 ) ( IN-CITY ?auto_308992 ?auto_308998 ) ( not ( = ?auto_308992 ?auto_309000 ) ) ( OBJ-AT ?auto_308994 ?auto_308992 ) ( not ( = ?auto_308994 ?auto_308993 ) ) ( OBJ-AT ?auto_308993 ?auto_309000 ) ( TRUCK-AT ?auto_308999 ?auto_309001 ) ( IN-CITY ?auto_309001 ?auto_308998 ) ( not ( = ?auto_308992 ?auto_309001 ) ) ( not ( = ?auto_309000 ?auto_309001 ) ) ( OBJ-AT ?auto_308995 ?auto_308992 ) ( OBJ-AT ?auto_308996 ?auto_308992 ) ( OBJ-AT ?auto_308997 ?auto_308992 ) ( not ( = ?auto_308993 ?auto_308995 ) ) ( not ( = ?auto_308993 ?auto_308996 ) ) ( not ( = ?auto_308993 ?auto_308997 ) ) ( not ( = ?auto_308994 ?auto_308995 ) ) ( not ( = ?auto_308994 ?auto_308996 ) ) ( not ( = ?auto_308994 ?auto_308997 ) ) ( not ( = ?auto_308995 ?auto_308996 ) ) ( not ( = ?auto_308995 ?auto_308997 ) ) ( not ( = ?auto_308996 ?auto_308997 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_308994 ?auto_308993 ?auto_308992 )
      ( DELIVER-5PKG-VERIFY ?auto_308993 ?auto_308994 ?auto_308995 ?auto_308996 ?auto_308997 ?auto_308992 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_309113 - OBJ
      ?auto_309114 - OBJ
      ?auto_309115 - OBJ
      ?auto_309116 - OBJ
      ?auto_309117 - OBJ
      ?auto_309112 - LOCATION
    )
    :vars
    (
      ?auto_309120 - LOCATION
      ?auto_309118 - CITY
      ?auto_309119 - TRUCK
      ?auto_309121 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_309120 ?auto_309118 ) ( IN-CITY ?auto_309112 ?auto_309118 ) ( not ( = ?auto_309112 ?auto_309120 ) ) ( OBJ-AT ?auto_309117 ?auto_309112 ) ( not ( = ?auto_309117 ?auto_309113 ) ) ( OBJ-AT ?auto_309113 ?auto_309120 ) ( TRUCK-AT ?auto_309119 ?auto_309121 ) ( IN-CITY ?auto_309121 ?auto_309118 ) ( not ( = ?auto_309112 ?auto_309121 ) ) ( not ( = ?auto_309120 ?auto_309121 ) ) ( OBJ-AT ?auto_309114 ?auto_309112 ) ( OBJ-AT ?auto_309115 ?auto_309112 ) ( OBJ-AT ?auto_309116 ?auto_309112 ) ( not ( = ?auto_309113 ?auto_309114 ) ) ( not ( = ?auto_309113 ?auto_309115 ) ) ( not ( = ?auto_309113 ?auto_309116 ) ) ( not ( = ?auto_309114 ?auto_309115 ) ) ( not ( = ?auto_309114 ?auto_309116 ) ) ( not ( = ?auto_309114 ?auto_309117 ) ) ( not ( = ?auto_309115 ?auto_309116 ) ) ( not ( = ?auto_309115 ?auto_309117 ) ) ( not ( = ?auto_309116 ?auto_309117 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_309117 ?auto_309113 ?auto_309112 )
      ( DELIVER-5PKG-VERIFY ?auto_309113 ?auto_309114 ?auto_309115 ?auto_309116 ?auto_309117 ?auto_309112 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_309763 - OBJ
      ?auto_309764 - OBJ
      ?auto_309765 - OBJ
      ?auto_309766 - OBJ
      ?auto_309767 - OBJ
      ?auto_309762 - LOCATION
    )
    :vars
    (
      ?auto_309770 - LOCATION
      ?auto_309768 - CITY
      ?auto_309769 - TRUCK
      ?auto_309771 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_309770 ?auto_309768 ) ( IN-CITY ?auto_309762 ?auto_309768 ) ( not ( = ?auto_309762 ?auto_309770 ) ) ( OBJ-AT ?auto_309766 ?auto_309762 ) ( not ( = ?auto_309766 ?auto_309763 ) ) ( OBJ-AT ?auto_309763 ?auto_309770 ) ( TRUCK-AT ?auto_309769 ?auto_309771 ) ( IN-CITY ?auto_309771 ?auto_309768 ) ( not ( = ?auto_309762 ?auto_309771 ) ) ( not ( = ?auto_309770 ?auto_309771 ) ) ( OBJ-AT ?auto_309764 ?auto_309762 ) ( OBJ-AT ?auto_309765 ?auto_309762 ) ( OBJ-AT ?auto_309767 ?auto_309762 ) ( not ( = ?auto_309763 ?auto_309764 ) ) ( not ( = ?auto_309763 ?auto_309765 ) ) ( not ( = ?auto_309763 ?auto_309767 ) ) ( not ( = ?auto_309764 ?auto_309765 ) ) ( not ( = ?auto_309764 ?auto_309766 ) ) ( not ( = ?auto_309764 ?auto_309767 ) ) ( not ( = ?auto_309765 ?auto_309766 ) ) ( not ( = ?auto_309765 ?auto_309767 ) ) ( not ( = ?auto_309766 ?auto_309767 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_309766 ?auto_309763 ?auto_309762 )
      ( DELIVER-5PKG-VERIFY ?auto_309763 ?auto_309764 ?auto_309765 ?auto_309766 ?auto_309767 ?auto_309762 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_309803 - OBJ
      ?auto_309804 - OBJ
      ?auto_309805 - OBJ
      ?auto_309806 - OBJ
      ?auto_309807 - OBJ
      ?auto_309802 - LOCATION
    )
    :vars
    (
      ?auto_309811 - LOCATION
      ?auto_309809 - CITY
      ?auto_309808 - OBJ
      ?auto_309810 - TRUCK
      ?auto_309812 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_309811 ?auto_309809 ) ( IN-CITY ?auto_309802 ?auto_309809 ) ( not ( = ?auto_309802 ?auto_309811 ) ) ( OBJ-AT ?auto_309808 ?auto_309802 ) ( not ( = ?auto_309808 ?auto_309803 ) ) ( OBJ-AT ?auto_309803 ?auto_309811 ) ( TRUCK-AT ?auto_309810 ?auto_309812 ) ( IN-CITY ?auto_309812 ?auto_309809 ) ( not ( = ?auto_309802 ?auto_309812 ) ) ( not ( = ?auto_309811 ?auto_309812 ) ) ( OBJ-AT ?auto_309804 ?auto_309802 ) ( OBJ-AT ?auto_309805 ?auto_309802 ) ( OBJ-AT ?auto_309806 ?auto_309802 ) ( OBJ-AT ?auto_309807 ?auto_309802 ) ( not ( = ?auto_309803 ?auto_309804 ) ) ( not ( = ?auto_309803 ?auto_309805 ) ) ( not ( = ?auto_309803 ?auto_309806 ) ) ( not ( = ?auto_309803 ?auto_309807 ) ) ( not ( = ?auto_309804 ?auto_309805 ) ) ( not ( = ?auto_309804 ?auto_309806 ) ) ( not ( = ?auto_309804 ?auto_309807 ) ) ( not ( = ?auto_309804 ?auto_309808 ) ) ( not ( = ?auto_309805 ?auto_309806 ) ) ( not ( = ?auto_309805 ?auto_309807 ) ) ( not ( = ?auto_309805 ?auto_309808 ) ) ( not ( = ?auto_309806 ?auto_309807 ) ) ( not ( = ?auto_309806 ?auto_309808 ) ) ( not ( = ?auto_309807 ?auto_309808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_309808 ?auto_309803 ?auto_309802 )
      ( DELIVER-5PKG-VERIFY ?auto_309803 ?auto_309804 ?auto_309805 ?auto_309806 ?auto_309807 ?auto_309802 ) )
  )

)

