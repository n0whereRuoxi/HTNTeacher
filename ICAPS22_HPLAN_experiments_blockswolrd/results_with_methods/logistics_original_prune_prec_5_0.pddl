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
      ?auto_216348 - OBJ
      ?auto_216347 - LOCATION
    )
    :vars
    (
      ?auto_216349 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216349 ?auto_216347 ) ( IN-TRUCK ?auto_216348 ?auto_216349 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_216348 ?auto_216349 ?auto_216347 )
      ( DELIVER-1PKG-VERIFY ?auto_216348 ?auto_216347 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_216373 - OBJ
      ?auto_216372 - LOCATION
    )
    :vars
    (
      ?auto_216374 - TRUCK
      ?auto_216375 - LOCATION
      ?auto_216376 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216373 ?auto_216374 ) ( TRUCK-AT ?auto_216374 ?auto_216375 ) ( IN-CITY ?auto_216375 ?auto_216376 ) ( IN-CITY ?auto_216372 ?auto_216376 ) ( not ( = ?auto_216372 ?auto_216375 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_216374 ?auto_216375 ?auto_216372 ?auto_216376 )
      ( DELIVER-1PKG ?auto_216373 ?auto_216372 )
      ( DELIVER-1PKG-VERIFY ?auto_216373 ?auto_216372 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_216408 - OBJ
      ?auto_216407 - LOCATION
    )
    :vars
    (
      ?auto_216409 - TRUCK
      ?auto_216411 - LOCATION
      ?auto_216410 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216409 ?auto_216411 ) ( IN-CITY ?auto_216411 ?auto_216410 ) ( IN-CITY ?auto_216407 ?auto_216410 ) ( not ( = ?auto_216407 ?auto_216411 ) ) ( OBJ-AT ?auto_216408 ?auto_216411 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_216408 ?auto_216409 ?auto_216411 )
      ( DELIVER-1PKG ?auto_216408 ?auto_216407 )
      ( DELIVER-1PKG-VERIFY ?auto_216408 ?auto_216407 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_216443 - OBJ
      ?auto_216442 - LOCATION
    )
    :vars
    (
      ?auto_216446 - LOCATION
      ?auto_216444 - CITY
      ?auto_216445 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216446 ?auto_216444 ) ( IN-CITY ?auto_216442 ?auto_216444 ) ( not ( = ?auto_216442 ?auto_216446 ) ) ( OBJ-AT ?auto_216443 ?auto_216446 ) ( TRUCK-AT ?auto_216445 ?auto_216442 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_216445 ?auto_216442 ?auto_216446 ?auto_216444 )
      ( DELIVER-1PKG ?auto_216443 ?auto_216442 )
      ( DELIVER-1PKG-VERIFY ?auto_216443 ?auto_216442 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216781 - OBJ
      ?auto_216782 - OBJ
      ?auto_216780 - LOCATION
    )
    :vars
    (
      ?auto_216783 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_216782 ?auto_216781 ) ) ( TRUCK-AT ?auto_216783 ?auto_216780 ) ( IN-TRUCK ?auto_216782 ?auto_216783 ) ( OBJ-AT ?auto_216781 ?auto_216780 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216782 ?auto_216780 )
      ( DELIVER-2PKG-VERIFY ?auto_216781 ?auto_216782 ?auto_216780 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216785 - OBJ
      ?auto_216786 - OBJ
      ?auto_216784 - LOCATION
    )
    :vars
    (
      ?auto_216787 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_216786 ?auto_216785 ) ) ( TRUCK-AT ?auto_216787 ?auto_216784 ) ( IN-TRUCK ?auto_216785 ?auto_216787 ) ( OBJ-AT ?auto_216786 ?auto_216784 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216785 ?auto_216784 )
      ( DELIVER-2PKG-VERIFY ?auto_216785 ?auto_216786 ?auto_216784 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217140 - OBJ
      ?auto_217141 - OBJ
      ?auto_217139 - LOCATION
    )
    :vars
    (
      ?auto_217142 - TRUCK
      ?auto_217144 - LOCATION
      ?auto_217143 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_217141 ?auto_217140 ) ) ( IN-TRUCK ?auto_217141 ?auto_217142 ) ( TRUCK-AT ?auto_217142 ?auto_217144 ) ( IN-CITY ?auto_217144 ?auto_217143 ) ( IN-CITY ?auto_217139 ?auto_217143 ) ( not ( = ?auto_217139 ?auto_217144 ) ) ( OBJ-AT ?auto_217140 ?auto_217139 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_217141 ?auto_217139 )
      ( DELIVER-2PKG-VERIFY ?auto_217140 ?auto_217141 ?auto_217139 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217146 - OBJ
      ?auto_217147 - OBJ
      ?auto_217145 - LOCATION
    )
    :vars
    (
      ?auto_217150 - TRUCK
      ?auto_217149 - LOCATION
      ?auto_217148 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_217147 ?auto_217146 ) ) ( IN-TRUCK ?auto_217146 ?auto_217150 ) ( TRUCK-AT ?auto_217150 ?auto_217149 ) ( IN-CITY ?auto_217149 ?auto_217148 ) ( IN-CITY ?auto_217145 ?auto_217148 ) ( not ( = ?auto_217145 ?auto_217149 ) ) ( OBJ-AT ?auto_217147 ?auto_217145 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217147 ?auto_217146 ?auto_217145 )
      ( DELIVER-2PKG-VERIFY ?auto_217146 ?auto_217147 ?auto_217145 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_217610 - OBJ
      ?auto_217609 - LOCATION
    )
    :vars
    (
      ?auto_217611 - OBJ
      ?auto_217614 - TRUCK
      ?auto_217613 - LOCATION
      ?auto_217612 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_217610 ?auto_217611 ) ) ( TRUCK-AT ?auto_217614 ?auto_217613 ) ( IN-CITY ?auto_217613 ?auto_217612 ) ( IN-CITY ?auto_217609 ?auto_217612 ) ( not ( = ?auto_217609 ?auto_217613 ) ) ( OBJ-AT ?auto_217611 ?auto_217609 ) ( OBJ-AT ?auto_217610 ?auto_217613 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_217610 ?auto_217614 ?auto_217613 )
      ( DELIVER-2PKG ?auto_217611 ?auto_217610 ?auto_217609 )
      ( DELIVER-1PKG-VERIFY ?auto_217610 ?auto_217609 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217616 - OBJ
      ?auto_217617 - OBJ
      ?auto_217615 - LOCATION
    )
    :vars
    (
      ?auto_217618 - TRUCK
      ?auto_217619 - LOCATION
      ?auto_217620 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_217617 ?auto_217616 ) ) ( TRUCK-AT ?auto_217618 ?auto_217619 ) ( IN-CITY ?auto_217619 ?auto_217620 ) ( IN-CITY ?auto_217615 ?auto_217620 ) ( not ( = ?auto_217615 ?auto_217619 ) ) ( OBJ-AT ?auto_217616 ?auto_217615 ) ( OBJ-AT ?auto_217617 ?auto_217619 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_217617 ?auto_217615 )
      ( DELIVER-2PKG-VERIFY ?auto_217616 ?auto_217617 ?auto_217615 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217622 - OBJ
      ?auto_217623 - OBJ
      ?auto_217621 - LOCATION
    )
    :vars
    (
      ?auto_217626 - TRUCK
      ?auto_217625 - LOCATION
      ?auto_217624 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_217623 ?auto_217622 ) ) ( TRUCK-AT ?auto_217626 ?auto_217625 ) ( IN-CITY ?auto_217625 ?auto_217624 ) ( IN-CITY ?auto_217621 ?auto_217624 ) ( not ( = ?auto_217621 ?auto_217625 ) ) ( OBJ-AT ?auto_217623 ?auto_217621 ) ( OBJ-AT ?auto_217622 ?auto_217625 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217623 ?auto_217622 ?auto_217621 )
      ( DELIVER-2PKG-VERIFY ?auto_217622 ?auto_217623 ?auto_217621 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_218086 - OBJ
      ?auto_218085 - LOCATION
    )
    :vars
    (
      ?auto_218087 - OBJ
      ?auto_218089 - LOCATION
      ?auto_218088 - CITY
      ?auto_218090 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_218086 ?auto_218087 ) ) ( IN-CITY ?auto_218089 ?auto_218088 ) ( IN-CITY ?auto_218085 ?auto_218088 ) ( not ( = ?auto_218085 ?auto_218089 ) ) ( OBJ-AT ?auto_218087 ?auto_218085 ) ( OBJ-AT ?auto_218086 ?auto_218089 ) ( TRUCK-AT ?auto_218090 ?auto_218085 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_218090 ?auto_218085 ?auto_218089 ?auto_218088 )
      ( DELIVER-2PKG ?auto_218087 ?auto_218086 ?auto_218085 )
      ( DELIVER-1PKG-VERIFY ?auto_218086 ?auto_218085 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_218092 - OBJ
      ?auto_218093 - OBJ
      ?auto_218091 - LOCATION
    )
    :vars
    (
      ?auto_218094 - LOCATION
      ?auto_218096 - CITY
      ?auto_218095 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_218093 ?auto_218092 ) ) ( IN-CITY ?auto_218094 ?auto_218096 ) ( IN-CITY ?auto_218091 ?auto_218096 ) ( not ( = ?auto_218091 ?auto_218094 ) ) ( OBJ-AT ?auto_218092 ?auto_218091 ) ( OBJ-AT ?auto_218093 ?auto_218094 ) ( TRUCK-AT ?auto_218095 ?auto_218091 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_218093 ?auto_218091 )
      ( DELIVER-2PKG-VERIFY ?auto_218092 ?auto_218093 ?auto_218091 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_218098 - OBJ
      ?auto_218099 - OBJ
      ?auto_218097 - LOCATION
    )
    :vars
    (
      ?auto_218101 - LOCATION
      ?auto_218102 - CITY
      ?auto_218100 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_218099 ?auto_218098 ) ) ( IN-CITY ?auto_218101 ?auto_218102 ) ( IN-CITY ?auto_218097 ?auto_218102 ) ( not ( = ?auto_218097 ?auto_218101 ) ) ( OBJ-AT ?auto_218099 ?auto_218097 ) ( OBJ-AT ?auto_218098 ?auto_218101 ) ( TRUCK-AT ?auto_218100 ?auto_218097 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_218099 ?auto_218098 ?auto_218097 )
      ( DELIVER-2PKG-VERIFY ?auto_218098 ?auto_218099 ?auto_218097 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_218562 - OBJ
      ?auto_218561 - LOCATION
    )
    :vars
    (
      ?auto_218563 - OBJ
      ?auto_218565 - LOCATION
      ?auto_218566 - CITY
      ?auto_218564 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_218562 ?auto_218563 ) ) ( IN-CITY ?auto_218565 ?auto_218566 ) ( IN-CITY ?auto_218561 ?auto_218566 ) ( not ( = ?auto_218561 ?auto_218565 ) ) ( OBJ-AT ?auto_218562 ?auto_218565 ) ( TRUCK-AT ?auto_218564 ?auto_218561 ) ( IN-TRUCK ?auto_218563 ?auto_218564 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_218563 ?auto_218561 )
      ( DELIVER-2PKG ?auto_218563 ?auto_218562 ?auto_218561 )
      ( DELIVER-1PKG-VERIFY ?auto_218562 ?auto_218561 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_218568 - OBJ
      ?auto_218569 - OBJ
      ?auto_218567 - LOCATION
    )
    :vars
    (
      ?auto_218570 - LOCATION
      ?auto_218571 - CITY
      ?auto_218572 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_218569 ?auto_218568 ) ) ( IN-CITY ?auto_218570 ?auto_218571 ) ( IN-CITY ?auto_218567 ?auto_218571 ) ( not ( = ?auto_218567 ?auto_218570 ) ) ( OBJ-AT ?auto_218569 ?auto_218570 ) ( TRUCK-AT ?auto_218572 ?auto_218567 ) ( IN-TRUCK ?auto_218568 ?auto_218572 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_218569 ?auto_218567 )
      ( DELIVER-2PKG-VERIFY ?auto_218568 ?auto_218569 ?auto_218567 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_218574 - OBJ
      ?auto_218575 - OBJ
      ?auto_218573 - LOCATION
    )
    :vars
    (
      ?auto_218576 - LOCATION
      ?auto_218577 - CITY
      ?auto_218578 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_218575 ?auto_218574 ) ) ( IN-CITY ?auto_218576 ?auto_218577 ) ( IN-CITY ?auto_218573 ?auto_218577 ) ( not ( = ?auto_218573 ?auto_218576 ) ) ( OBJ-AT ?auto_218574 ?auto_218576 ) ( TRUCK-AT ?auto_218578 ?auto_218573 ) ( IN-TRUCK ?auto_218575 ?auto_218578 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_218575 ?auto_218574 ?auto_218573 )
      ( DELIVER-2PKG-VERIFY ?auto_218574 ?auto_218575 ?auto_218573 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_219038 - OBJ
      ?auto_219037 - LOCATION
    )
    :vars
    (
      ?auto_219041 - OBJ
      ?auto_219039 - LOCATION
      ?auto_219040 - CITY
      ?auto_219042 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_219038 ?auto_219041 ) ) ( IN-CITY ?auto_219039 ?auto_219040 ) ( IN-CITY ?auto_219037 ?auto_219040 ) ( not ( = ?auto_219037 ?auto_219039 ) ) ( OBJ-AT ?auto_219038 ?auto_219039 ) ( IN-TRUCK ?auto_219041 ?auto_219042 ) ( TRUCK-AT ?auto_219042 ?auto_219039 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_219042 ?auto_219039 ?auto_219037 ?auto_219040 )
      ( DELIVER-2PKG ?auto_219041 ?auto_219038 ?auto_219037 )
      ( DELIVER-1PKG-VERIFY ?auto_219038 ?auto_219037 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_219044 - OBJ
      ?auto_219045 - OBJ
      ?auto_219043 - LOCATION
    )
    :vars
    (
      ?auto_219047 - LOCATION
      ?auto_219048 - CITY
      ?auto_219046 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_219045 ?auto_219044 ) ) ( IN-CITY ?auto_219047 ?auto_219048 ) ( IN-CITY ?auto_219043 ?auto_219048 ) ( not ( = ?auto_219043 ?auto_219047 ) ) ( OBJ-AT ?auto_219045 ?auto_219047 ) ( IN-TRUCK ?auto_219044 ?auto_219046 ) ( TRUCK-AT ?auto_219046 ?auto_219047 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_219045 ?auto_219043 )
      ( DELIVER-2PKG-VERIFY ?auto_219044 ?auto_219045 ?auto_219043 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_219050 - OBJ
      ?auto_219051 - OBJ
      ?auto_219049 - LOCATION
    )
    :vars
    (
      ?auto_219053 - LOCATION
      ?auto_219054 - CITY
      ?auto_219052 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_219051 ?auto_219050 ) ) ( IN-CITY ?auto_219053 ?auto_219054 ) ( IN-CITY ?auto_219049 ?auto_219054 ) ( not ( = ?auto_219049 ?auto_219053 ) ) ( OBJ-AT ?auto_219050 ?auto_219053 ) ( IN-TRUCK ?auto_219051 ?auto_219052 ) ( TRUCK-AT ?auto_219052 ?auto_219053 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_219051 ?auto_219050 ?auto_219049 )
      ( DELIVER-2PKG-VERIFY ?auto_219050 ?auto_219051 ?auto_219049 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_222160 - OBJ
      ?auto_222161 - OBJ
      ?auto_222162 - OBJ
      ?auto_222159 - LOCATION
    )
    :vars
    (
      ?auto_222163 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_222161 ?auto_222160 ) ) ( not ( = ?auto_222162 ?auto_222160 ) ) ( not ( = ?auto_222162 ?auto_222161 ) ) ( TRUCK-AT ?auto_222163 ?auto_222159 ) ( IN-TRUCK ?auto_222162 ?auto_222163 ) ( OBJ-AT ?auto_222160 ?auto_222159 ) ( OBJ-AT ?auto_222161 ?auto_222159 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_222162 ?auto_222159 )
      ( DELIVER-3PKG-VERIFY ?auto_222160 ?auto_222161 ?auto_222162 ?auto_222159 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_222170 - OBJ
      ?auto_222171 - OBJ
      ?auto_222172 - OBJ
      ?auto_222169 - LOCATION
    )
    :vars
    (
      ?auto_222173 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_222171 ?auto_222170 ) ) ( not ( = ?auto_222172 ?auto_222170 ) ) ( not ( = ?auto_222172 ?auto_222171 ) ) ( TRUCK-AT ?auto_222173 ?auto_222169 ) ( IN-TRUCK ?auto_222171 ?auto_222173 ) ( OBJ-AT ?auto_222170 ?auto_222169 ) ( OBJ-AT ?auto_222172 ?auto_222169 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_222171 ?auto_222169 )
      ( DELIVER-3PKG-VERIFY ?auto_222170 ?auto_222171 ?auto_222172 ?auto_222169 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_222208 - OBJ
      ?auto_222209 - OBJ
      ?auto_222210 - OBJ
      ?auto_222207 - LOCATION
    )
    :vars
    (
      ?auto_222211 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_222209 ?auto_222208 ) ) ( not ( = ?auto_222210 ?auto_222208 ) ) ( not ( = ?auto_222210 ?auto_222209 ) ) ( TRUCK-AT ?auto_222211 ?auto_222207 ) ( IN-TRUCK ?auto_222208 ?auto_222211 ) ( OBJ-AT ?auto_222209 ?auto_222207 ) ( OBJ-AT ?auto_222210 ?auto_222207 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_222208 ?auto_222207 )
      ( DELIVER-3PKG-VERIFY ?auto_222208 ?auto_222209 ?auto_222210 ?auto_222207 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_224151 - OBJ
      ?auto_224152 - OBJ
      ?auto_224153 - OBJ
      ?auto_224150 - LOCATION
    )
    :vars
    (
      ?auto_224155 - TRUCK
      ?auto_224154 - LOCATION
      ?auto_224156 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_224152 ?auto_224151 ) ) ( not ( = ?auto_224153 ?auto_224151 ) ) ( not ( = ?auto_224153 ?auto_224152 ) ) ( IN-TRUCK ?auto_224153 ?auto_224155 ) ( TRUCK-AT ?auto_224155 ?auto_224154 ) ( IN-CITY ?auto_224154 ?auto_224156 ) ( IN-CITY ?auto_224150 ?auto_224156 ) ( not ( = ?auto_224150 ?auto_224154 ) ) ( OBJ-AT ?auto_224151 ?auto_224150 ) ( OBJ-AT ?auto_224152 ?auto_224150 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224151 ?auto_224153 ?auto_224150 )
      ( DELIVER-3PKG-VERIFY ?auto_224151 ?auto_224152 ?auto_224153 ?auto_224150 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_224165 - OBJ
      ?auto_224166 - OBJ
      ?auto_224167 - OBJ
      ?auto_224164 - LOCATION
    )
    :vars
    (
      ?auto_224169 - TRUCK
      ?auto_224168 - LOCATION
      ?auto_224170 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_224166 ?auto_224165 ) ) ( not ( = ?auto_224167 ?auto_224165 ) ) ( not ( = ?auto_224167 ?auto_224166 ) ) ( IN-TRUCK ?auto_224166 ?auto_224169 ) ( TRUCK-AT ?auto_224169 ?auto_224168 ) ( IN-CITY ?auto_224168 ?auto_224170 ) ( IN-CITY ?auto_224164 ?auto_224170 ) ( not ( = ?auto_224164 ?auto_224168 ) ) ( OBJ-AT ?auto_224165 ?auto_224164 ) ( OBJ-AT ?auto_224167 ?auto_224164 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224165 ?auto_224166 ?auto_224164 )
      ( DELIVER-3PKG-VERIFY ?auto_224165 ?auto_224166 ?auto_224167 ?auto_224164 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_224218 - OBJ
      ?auto_224219 - OBJ
      ?auto_224220 - OBJ
      ?auto_224217 - LOCATION
    )
    :vars
    (
      ?auto_224222 - TRUCK
      ?auto_224221 - LOCATION
      ?auto_224223 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_224219 ?auto_224218 ) ) ( not ( = ?auto_224220 ?auto_224218 ) ) ( not ( = ?auto_224220 ?auto_224219 ) ) ( IN-TRUCK ?auto_224218 ?auto_224222 ) ( TRUCK-AT ?auto_224222 ?auto_224221 ) ( IN-CITY ?auto_224221 ?auto_224223 ) ( IN-CITY ?auto_224217 ?auto_224223 ) ( not ( = ?auto_224217 ?auto_224221 ) ) ( OBJ-AT ?auto_224219 ?auto_224217 ) ( OBJ-AT ?auto_224220 ?auto_224217 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224219 ?auto_224218 ?auto_224217 )
      ( DELIVER-3PKG-VERIFY ?auto_224218 ?auto_224219 ?auto_224220 ?auto_224217 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226778 - OBJ
      ?auto_226779 - OBJ
      ?auto_226780 - OBJ
      ?auto_226777 - LOCATION
    )
    :vars
    (
      ?auto_226781 - TRUCK
      ?auto_226783 - LOCATION
      ?auto_226782 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_226779 ?auto_226778 ) ) ( not ( = ?auto_226780 ?auto_226778 ) ) ( not ( = ?auto_226780 ?auto_226779 ) ) ( TRUCK-AT ?auto_226781 ?auto_226783 ) ( IN-CITY ?auto_226783 ?auto_226782 ) ( IN-CITY ?auto_226777 ?auto_226782 ) ( not ( = ?auto_226777 ?auto_226783 ) ) ( OBJ-AT ?auto_226778 ?auto_226777 ) ( OBJ-AT ?auto_226780 ?auto_226783 ) ( OBJ-AT ?auto_226779 ?auto_226777 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226778 ?auto_226780 ?auto_226777 )
      ( DELIVER-3PKG-VERIFY ?auto_226778 ?auto_226779 ?auto_226780 ?auto_226777 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226792 - OBJ
      ?auto_226793 - OBJ
      ?auto_226794 - OBJ
      ?auto_226791 - LOCATION
    )
    :vars
    (
      ?auto_226795 - TRUCK
      ?auto_226797 - LOCATION
      ?auto_226796 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_226793 ?auto_226792 ) ) ( not ( = ?auto_226794 ?auto_226792 ) ) ( not ( = ?auto_226794 ?auto_226793 ) ) ( TRUCK-AT ?auto_226795 ?auto_226797 ) ( IN-CITY ?auto_226797 ?auto_226796 ) ( IN-CITY ?auto_226791 ?auto_226796 ) ( not ( = ?auto_226791 ?auto_226797 ) ) ( OBJ-AT ?auto_226792 ?auto_226791 ) ( OBJ-AT ?auto_226793 ?auto_226797 ) ( OBJ-AT ?auto_226794 ?auto_226791 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226792 ?auto_226793 ?auto_226791 )
      ( DELIVER-3PKG-VERIFY ?auto_226792 ?auto_226793 ?auto_226794 ?auto_226791 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226845 - OBJ
      ?auto_226846 - OBJ
      ?auto_226847 - OBJ
      ?auto_226844 - LOCATION
    )
    :vars
    (
      ?auto_226848 - TRUCK
      ?auto_226850 - LOCATION
      ?auto_226849 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_226846 ?auto_226845 ) ) ( not ( = ?auto_226847 ?auto_226845 ) ) ( not ( = ?auto_226847 ?auto_226846 ) ) ( TRUCK-AT ?auto_226848 ?auto_226850 ) ( IN-CITY ?auto_226850 ?auto_226849 ) ( IN-CITY ?auto_226844 ?auto_226849 ) ( not ( = ?auto_226844 ?auto_226850 ) ) ( OBJ-AT ?auto_226846 ?auto_226844 ) ( OBJ-AT ?auto_226845 ?auto_226850 ) ( OBJ-AT ?auto_226847 ?auto_226844 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226846 ?auto_226845 ?auto_226844 )
      ( DELIVER-3PKG-VERIFY ?auto_226845 ?auto_226846 ?auto_226847 ?auto_226844 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_229405 - OBJ
      ?auto_229406 - OBJ
      ?auto_229407 - OBJ
      ?auto_229404 - LOCATION
    )
    :vars
    (
      ?auto_229410 - LOCATION
      ?auto_229408 - CITY
      ?auto_229409 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_229406 ?auto_229405 ) ) ( not ( = ?auto_229407 ?auto_229405 ) ) ( not ( = ?auto_229407 ?auto_229406 ) ) ( IN-CITY ?auto_229410 ?auto_229408 ) ( IN-CITY ?auto_229404 ?auto_229408 ) ( not ( = ?auto_229404 ?auto_229410 ) ) ( OBJ-AT ?auto_229405 ?auto_229404 ) ( OBJ-AT ?auto_229407 ?auto_229410 ) ( TRUCK-AT ?auto_229409 ?auto_229404 ) ( OBJ-AT ?auto_229406 ?auto_229404 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229405 ?auto_229407 ?auto_229404 )
      ( DELIVER-3PKG-VERIFY ?auto_229405 ?auto_229406 ?auto_229407 ?auto_229404 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_229419 - OBJ
      ?auto_229420 - OBJ
      ?auto_229421 - OBJ
      ?auto_229418 - LOCATION
    )
    :vars
    (
      ?auto_229424 - LOCATION
      ?auto_229422 - CITY
      ?auto_229423 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_229420 ?auto_229419 ) ) ( not ( = ?auto_229421 ?auto_229419 ) ) ( not ( = ?auto_229421 ?auto_229420 ) ) ( IN-CITY ?auto_229424 ?auto_229422 ) ( IN-CITY ?auto_229418 ?auto_229422 ) ( not ( = ?auto_229418 ?auto_229424 ) ) ( OBJ-AT ?auto_229419 ?auto_229418 ) ( OBJ-AT ?auto_229420 ?auto_229424 ) ( TRUCK-AT ?auto_229423 ?auto_229418 ) ( OBJ-AT ?auto_229421 ?auto_229418 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229419 ?auto_229420 ?auto_229418 )
      ( DELIVER-3PKG-VERIFY ?auto_229419 ?auto_229420 ?auto_229421 ?auto_229418 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_229472 - OBJ
      ?auto_229473 - OBJ
      ?auto_229474 - OBJ
      ?auto_229471 - LOCATION
    )
    :vars
    (
      ?auto_229477 - LOCATION
      ?auto_229475 - CITY
      ?auto_229476 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_229473 ?auto_229472 ) ) ( not ( = ?auto_229474 ?auto_229472 ) ) ( not ( = ?auto_229474 ?auto_229473 ) ) ( IN-CITY ?auto_229477 ?auto_229475 ) ( IN-CITY ?auto_229471 ?auto_229475 ) ( not ( = ?auto_229471 ?auto_229477 ) ) ( OBJ-AT ?auto_229473 ?auto_229471 ) ( OBJ-AT ?auto_229472 ?auto_229477 ) ( TRUCK-AT ?auto_229476 ?auto_229471 ) ( OBJ-AT ?auto_229474 ?auto_229471 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229473 ?auto_229472 ?auto_229471 )
      ( DELIVER-3PKG-VERIFY ?auto_229472 ?auto_229473 ?auto_229474 ?auto_229471 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_234628 - OBJ
      ?auto_234627 - LOCATION
    )
    :vars
    (
      ?auto_234629 - OBJ
      ?auto_234630 - LOCATION
      ?auto_234632 - CITY
      ?auto_234631 - TRUCK
      ?auto_234633 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_234628 ?auto_234629 ) ) ( IN-CITY ?auto_234630 ?auto_234632 ) ( IN-CITY ?auto_234627 ?auto_234632 ) ( not ( = ?auto_234627 ?auto_234630 ) ) ( OBJ-AT ?auto_234629 ?auto_234627 ) ( OBJ-AT ?auto_234628 ?auto_234630 ) ( TRUCK-AT ?auto_234631 ?auto_234633 ) ( IN-CITY ?auto_234633 ?auto_234632 ) ( not ( = ?auto_234627 ?auto_234633 ) ) ( not ( = ?auto_234630 ?auto_234633 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_234631 ?auto_234633 ?auto_234627 ?auto_234632 )
      ( DELIVER-2PKG ?auto_234629 ?auto_234628 ?auto_234627 )
      ( DELIVER-1PKG-VERIFY ?auto_234628 ?auto_234627 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_234635 - OBJ
      ?auto_234636 - OBJ
      ?auto_234634 - LOCATION
    )
    :vars
    (
      ?auto_234640 - LOCATION
      ?auto_234638 - CITY
      ?auto_234639 - TRUCK
      ?auto_234637 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_234636 ?auto_234635 ) ) ( IN-CITY ?auto_234640 ?auto_234638 ) ( IN-CITY ?auto_234634 ?auto_234638 ) ( not ( = ?auto_234634 ?auto_234640 ) ) ( OBJ-AT ?auto_234635 ?auto_234634 ) ( OBJ-AT ?auto_234636 ?auto_234640 ) ( TRUCK-AT ?auto_234639 ?auto_234637 ) ( IN-CITY ?auto_234637 ?auto_234638 ) ( not ( = ?auto_234634 ?auto_234637 ) ) ( not ( = ?auto_234640 ?auto_234637 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_234636 ?auto_234634 )
      ( DELIVER-2PKG-VERIFY ?auto_234635 ?auto_234636 ?auto_234634 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_234650 - OBJ
      ?auto_234651 - OBJ
      ?auto_234649 - LOCATION
    )
    :vars
    (
      ?auto_234654 - LOCATION
      ?auto_234652 - CITY
      ?auto_234653 - TRUCK
      ?auto_234655 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_234651 ?auto_234650 ) ) ( IN-CITY ?auto_234654 ?auto_234652 ) ( IN-CITY ?auto_234649 ?auto_234652 ) ( not ( = ?auto_234649 ?auto_234654 ) ) ( OBJ-AT ?auto_234651 ?auto_234649 ) ( OBJ-AT ?auto_234650 ?auto_234654 ) ( TRUCK-AT ?auto_234653 ?auto_234655 ) ( IN-CITY ?auto_234655 ?auto_234652 ) ( not ( = ?auto_234649 ?auto_234655 ) ) ( not ( = ?auto_234654 ?auto_234655 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234651 ?auto_234650 ?auto_234649 )
      ( DELIVER-2PKG-VERIFY ?auto_234650 ?auto_234651 ?auto_234649 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_245773 - OBJ
      ?auto_245772 - LOCATION
    )
    :vars
    (
      ?auto_245776 - OBJ
      ?auto_245775 - LOCATION
      ?auto_245774 - CITY
      ?auto_245777 - TRUCK
      ?auto_245778 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_245773 ?auto_245776 ) ) ( IN-CITY ?auto_245775 ?auto_245774 ) ( IN-CITY ?auto_245772 ?auto_245774 ) ( not ( = ?auto_245772 ?auto_245775 ) ) ( OBJ-AT ?auto_245773 ?auto_245775 ) ( IN-TRUCK ?auto_245776 ?auto_245777 ) ( TRUCK-AT ?auto_245777 ?auto_245778 ) ( IN-CITY ?auto_245778 ?auto_245774 ) ( not ( = ?auto_245772 ?auto_245778 ) ) ( not ( = ?auto_245775 ?auto_245778 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_245777 ?auto_245778 ?auto_245772 ?auto_245774 )
      ( DELIVER-2PKG ?auto_245776 ?auto_245773 ?auto_245772 )
      ( DELIVER-1PKG-VERIFY ?auto_245773 ?auto_245772 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_245780 - OBJ
      ?auto_245781 - OBJ
      ?auto_245779 - LOCATION
    )
    :vars
    (
      ?auto_245785 - LOCATION
      ?auto_245782 - CITY
      ?auto_245784 - TRUCK
      ?auto_245783 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_245781 ?auto_245780 ) ) ( IN-CITY ?auto_245785 ?auto_245782 ) ( IN-CITY ?auto_245779 ?auto_245782 ) ( not ( = ?auto_245779 ?auto_245785 ) ) ( OBJ-AT ?auto_245781 ?auto_245785 ) ( IN-TRUCK ?auto_245780 ?auto_245784 ) ( TRUCK-AT ?auto_245784 ?auto_245783 ) ( IN-CITY ?auto_245783 ?auto_245782 ) ( not ( = ?auto_245779 ?auto_245783 ) ) ( not ( = ?auto_245785 ?auto_245783 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_245781 ?auto_245779 )
      ( DELIVER-2PKG-VERIFY ?auto_245780 ?auto_245781 ?auto_245779 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_245795 - OBJ
      ?auto_245796 - OBJ
      ?auto_245794 - LOCATION
    )
    :vars
    (
      ?auto_245798 - LOCATION
      ?auto_245797 - CITY
      ?auto_245800 - TRUCK
      ?auto_245799 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_245796 ?auto_245795 ) ) ( IN-CITY ?auto_245798 ?auto_245797 ) ( IN-CITY ?auto_245794 ?auto_245797 ) ( not ( = ?auto_245794 ?auto_245798 ) ) ( OBJ-AT ?auto_245795 ?auto_245798 ) ( IN-TRUCK ?auto_245796 ?auto_245800 ) ( TRUCK-AT ?auto_245800 ?auto_245799 ) ( IN-CITY ?auto_245799 ?auto_245797 ) ( not ( = ?auto_245794 ?auto_245799 ) ) ( not ( = ?auto_245798 ?auto_245799 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_245796 ?auto_245795 ?auto_245794 )
      ( DELIVER-2PKG-VERIFY ?auto_245795 ?auto_245796 ?auto_245794 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_248718 - OBJ
      ?auto_248717 - LOCATION
    )
    :vars
    (
      ?auto_248721 - OBJ
      ?auto_248720 - LOCATION
      ?auto_248719 - CITY
      ?auto_248723 - TRUCK
      ?auto_248722 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_248718 ?auto_248721 ) ) ( IN-CITY ?auto_248720 ?auto_248719 ) ( IN-CITY ?auto_248717 ?auto_248719 ) ( not ( = ?auto_248717 ?auto_248720 ) ) ( OBJ-AT ?auto_248718 ?auto_248720 ) ( TRUCK-AT ?auto_248723 ?auto_248722 ) ( IN-CITY ?auto_248722 ?auto_248719 ) ( not ( = ?auto_248717 ?auto_248722 ) ) ( not ( = ?auto_248720 ?auto_248722 ) ) ( OBJ-AT ?auto_248721 ?auto_248722 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_248721 ?auto_248723 ?auto_248722 )
      ( DELIVER-2PKG ?auto_248721 ?auto_248718 ?auto_248717 )
      ( DELIVER-1PKG-VERIFY ?auto_248718 ?auto_248717 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_248725 - OBJ
      ?auto_248726 - OBJ
      ?auto_248724 - LOCATION
    )
    :vars
    (
      ?auto_248730 - LOCATION
      ?auto_248727 - CITY
      ?auto_248729 - TRUCK
      ?auto_248728 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_248726 ?auto_248725 ) ) ( IN-CITY ?auto_248730 ?auto_248727 ) ( IN-CITY ?auto_248724 ?auto_248727 ) ( not ( = ?auto_248724 ?auto_248730 ) ) ( OBJ-AT ?auto_248726 ?auto_248730 ) ( TRUCK-AT ?auto_248729 ?auto_248728 ) ( IN-CITY ?auto_248728 ?auto_248727 ) ( not ( = ?auto_248724 ?auto_248728 ) ) ( not ( = ?auto_248730 ?auto_248728 ) ) ( OBJ-AT ?auto_248725 ?auto_248728 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_248726 ?auto_248724 )
      ( DELIVER-2PKG-VERIFY ?auto_248725 ?auto_248726 ?auto_248724 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_248735 - OBJ
      ?auto_248736 - OBJ
      ?auto_248734 - LOCATION
    )
    :vars
    (
      ?auto_248738 - LOCATION
      ?auto_248737 - CITY
      ?auto_248739 - TRUCK
      ?auto_248740 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_248736 ?auto_248735 ) ) ( IN-CITY ?auto_248738 ?auto_248737 ) ( IN-CITY ?auto_248734 ?auto_248737 ) ( not ( = ?auto_248734 ?auto_248738 ) ) ( OBJ-AT ?auto_248735 ?auto_248738 ) ( TRUCK-AT ?auto_248739 ?auto_248740 ) ( IN-CITY ?auto_248740 ?auto_248737 ) ( not ( = ?auto_248734 ?auto_248740 ) ) ( not ( = ?auto_248738 ?auto_248740 ) ) ( OBJ-AT ?auto_248736 ?auto_248740 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_248736 ?auto_248735 ?auto_248734 )
      ( DELIVER-2PKG-VERIFY ?auto_248735 ?auto_248736 ?auto_248734 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_260220 - OBJ
      ?auto_260221 - OBJ
      ?auto_260222 - OBJ
      ?auto_260223 - OBJ
      ?auto_260219 - LOCATION
    )
    :vars
    (
      ?auto_260224 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_260221 ?auto_260220 ) ) ( not ( = ?auto_260222 ?auto_260220 ) ) ( not ( = ?auto_260222 ?auto_260221 ) ) ( not ( = ?auto_260223 ?auto_260220 ) ) ( not ( = ?auto_260223 ?auto_260221 ) ) ( not ( = ?auto_260223 ?auto_260222 ) ) ( TRUCK-AT ?auto_260224 ?auto_260219 ) ( IN-TRUCK ?auto_260223 ?auto_260224 ) ( OBJ-AT ?auto_260220 ?auto_260219 ) ( OBJ-AT ?auto_260221 ?auto_260219 ) ( OBJ-AT ?auto_260222 ?auto_260219 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_260223 ?auto_260219 )
      ( DELIVER-4PKG-VERIFY ?auto_260220 ?auto_260221 ?auto_260222 ?auto_260223 ?auto_260219 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_260238 - OBJ
      ?auto_260239 - OBJ
      ?auto_260240 - OBJ
      ?auto_260241 - OBJ
      ?auto_260237 - LOCATION
    )
    :vars
    (
      ?auto_260242 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_260239 ?auto_260238 ) ) ( not ( = ?auto_260240 ?auto_260238 ) ) ( not ( = ?auto_260240 ?auto_260239 ) ) ( not ( = ?auto_260241 ?auto_260238 ) ) ( not ( = ?auto_260241 ?auto_260239 ) ) ( not ( = ?auto_260241 ?auto_260240 ) ) ( TRUCK-AT ?auto_260242 ?auto_260237 ) ( IN-TRUCK ?auto_260240 ?auto_260242 ) ( OBJ-AT ?auto_260238 ?auto_260237 ) ( OBJ-AT ?auto_260239 ?auto_260237 ) ( OBJ-AT ?auto_260241 ?auto_260237 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_260240 ?auto_260237 )
      ( DELIVER-4PKG-VERIFY ?auto_260238 ?auto_260239 ?auto_260240 ?auto_260241 ?auto_260237 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_260326 - OBJ
      ?auto_260327 - OBJ
      ?auto_260328 - OBJ
      ?auto_260329 - OBJ
      ?auto_260325 - LOCATION
    )
    :vars
    (
      ?auto_260330 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_260327 ?auto_260326 ) ) ( not ( = ?auto_260328 ?auto_260326 ) ) ( not ( = ?auto_260328 ?auto_260327 ) ) ( not ( = ?auto_260329 ?auto_260326 ) ) ( not ( = ?auto_260329 ?auto_260327 ) ) ( not ( = ?auto_260329 ?auto_260328 ) ) ( TRUCK-AT ?auto_260330 ?auto_260325 ) ( IN-TRUCK ?auto_260327 ?auto_260330 ) ( OBJ-AT ?auto_260326 ?auto_260325 ) ( OBJ-AT ?auto_260328 ?auto_260325 ) ( OBJ-AT ?auto_260329 ?auto_260325 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_260327 ?auto_260325 )
      ( DELIVER-4PKG-VERIFY ?auto_260326 ?auto_260327 ?auto_260328 ?auto_260329 ?auto_260325 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_260853 - OBJ
      ?auto_260854 - OBJ
      ?auto_260855 - OBJ
      ?auto_260856 - OBJ
      ?auto_260852 - LOCATION
    )
    :vars
    (
      ?auto_260857 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_260854 ?auto_260853 ) ) ( not ( = ?auto_260855 ?auto_260853 ) ) ( not ( = ?auto_260855 ?auto_260854 ) ) ( not ( = ?auto_260856 ?auto_260853 ) ) ( not ( = ?auto_260856 ?auto_260854 ) ) ( not ( = ?auto_260856 ?auto_260855 ) ) ( TRUCK-AT ?auto_260857 ?auto_260852 ) ( IN-TRUCK ?auto_260853 ?auto_260857 ) ( OBJ-AT ?auto_260854 ?auto_260852 ) ( OBJ-AT ?auto_260855 ?auto_260852 ) ( OBJ-AT ?auto_260856 ?auto_260852 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_260853 ?auto_260852 )
      ( DELIVER-4PKG-VERIFY ?auto_260853 ?auto_260854 ?auto_260855 ?auto_260856 ?auto_260852 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_266998 - OBJ
      ?auto_266999 - OBJ
      ?auto_267000 - OBJ
      ?auto_267001 - OBJ
      ?auto_266997 - LOCATION
    )
    :vars
    (
      ?auto_267002 - TRUCK
      ?auto_267003 - LOCATION
      ?auto_267004 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_266999 ?auto_266998 ) ) ( not ( = ?auto_267000 ?auto_266998 ) ) ( not ( = ?auto_267000 ?auto_266999 ) ) ( not ( = ?auto_267001 ?auto_266998 ) ) ( not ( = ?auto_267001 ?auto_266999 ) ) ( not ( = ?auto_267001 ?auto_267000 ) ) ( IN-TRUCK ?auto_267001 ?auto_267002 ) ( TRUCK-AT ?auto_267002 ?auto_267003 ) ( IN-CITY ?auto_267003 ?auto_267004 ) ( IN-CITY ?auto_266997 ?auto_267004 ) ( not ( = ?auto_266997 ?auto_267003 ) ) ( OBJ-AT ?auto_266998 ?auto_266997 ) ( OBJ-AT ?auto_266999 ?auto_266997 ) ( OBJ-AT ?auto_267000 ?auto_266997 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_266998 ?auto_267001 ?auto_266997 )
      ( DELIVER-4PKG-VERIFY ?auto_266998 ?auto_266999 ?auto_267000 ?auto_267001 ?auto_266997 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_267022 - OBJ
      ?auto_267023 - OBJ
      ?auto_267024 - OBJ
      ?auto_267025 - OBJ
      ?auto_267021 - LOCATION
    )
    :vars
    (
      ?auto_267026 - TRUCK
      ?auto_267027 - LOCATION
      ?auto_267028 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_267023 ?auto_267022 ) ) ( not ( = ?auto_267024 ?auto_267022 ) ) ( not ( = ?auto_267024 ?auto_267023 ) ) ( not ( = ?auto_267025 ?auto_267022 ) ) ( not ( = ?auto_267025 ?auto_267023 ) ) ( not ( = ?auto_267025 ?auto_267024 ) ) ( IN-TRUCK ?auto_267024 ?auto_267026 ) ( TRUCK-AT ?auto_267026 ?auto_267027 ) ( IN-CITY ?auto_267027 ?auto_267028 ) ( IN-CITY ?auto_267021 ?auto_267028 ) ( not ( = ?auto_267021 ?auto_267027 ) ) ( OBJ-AT ?auto_267022 ?auto_267021 ) ( OBJ-AT ?auto_267023 ?auto_267021 ) ( OBJ-AT ?auto_267025 ?auto_267021 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_267022 ?auto_267024 ?auto_267021 )
      ( DELIVER-4PKG-VERIFY ?auto_267022 ?auto_267023 ?auto_267024 ?auto_267025 ?auto_267021 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_267136 - OBJ
      ?auto_267137 - OBJ
      ?auto_267138 - OBJ
      ?auto_267139 - OBJ
      ?auto_267135 - LOCATION
    )
    :vars
    (
      ?auto_267140 - TRUCK
      ?auto_267141 - LOCATION
      ?auto_267142 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_267137 ?auto_267136 ) ) ( not ( = ?auto_267138 ?auto_267136 ) ) ( not ( = ?auto_267138 ?auto_267137 ) ) ( not ( = ?auto_267139 ?auto_267136 ) ) ( not ( = ?auto_267139 ?auto_267137 ) ) ( not ( = ?auto_267139 ?auto_267138 ) ) ( IN-TRUCK ?auto_267137 ?auto_267140 ) ( TRUCK-AT ?auto_267140 ?auto_267141 ) ( IN-CITY ?auto_267141 ?auto_267142 ) ( IN-CITY ?auto_267135 ?auto_267142 ) ( not ( = ?auto_267135 ?auto_267141 ) ) ( OBJ-AT ?auto_267136 ?auto_267135 ) ( OBJ-AT ?auto_267138 ?auto_267135 ) ( OBJ-AT ?auto_267139 ?auto_267135 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_267136 ?auto_267137 ?auto_267135 )
      ( DELIVER-4PKG-VERIFY ?auto_267136 ?auto_267137 ?auto_267138 ?auto_267139 ?auto_267135 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_267855 - OBJ
      ?auto_267856 - OBJ
      ?auto_267857 - OBJ
      ?auto_267858 - OBJ
      ?auto_267854 - LOCATION
    )
    :vars
    (
      ?auto_267859 - TRUCK
      ?auto_267860 - LOCATION
      ?auto_267861 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_267856 ?auto_267855 ) ) ( not ( = ?auto_267857 ?auto_267855 ) ) ( not ( = ?auto_267857 ?auto_267856 ) ) ( not ( = ?auto_267858 ?auto_267855 ) ) ( not ( = ?auto_267858 ?auto_267856 ) ) ( not ( = ?auto_267858 ?auto_267857 ) ) ( IN-TRUCK ?auto_267855 ?auto_267859 ) ( TRUCK-AT ?auto_267859 ?auto_267860 ) ( IN-CITY ?auto_267860 ?auto_267861 ) ( IN-CITY ?auto_267854 ?auto_267861 ) ( not ( = ?auto_267854 ?auto_267860 ) ) ( OBJ-AT ?auto_267856 ?auto_267854 ) ( OBJ-AT ?auto_267857 ?auto_267854 ) ( OBJ-AT ?auto_267858 ?auto_267854 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_267856 ?auto_267855 ?auto_267854 )
      ( DELIVER-4PKG-VERIFY ?auto_267855 ?auto_267856 ?auto_267857 ?auto_267858 ?auto_267854 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_275907 - OBJ
      ?auto_275908 - OBJ
      ?auto_275909 - OBJ
      ?auto_275910 - OBJ
      ?auto_275906 - LOCATION
    )
    :vars
    (
      ?auto_275912 - TRUCK
      ?auto_275913 - LOCATION
      ?auto_275911 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_275908 ?auto_275907 ) ) ( not ( = ?auto_275909 ?auto_275907 ) ) ( not ( = ?auto_275909 ?auto_275908 ) ) ( not ( = ?auto_275910 ?auto_275907 ) ) ( not ( = ?auto_275910 ?auto_275908 ) ) ( not ( = ?auto_275910 ?auto_275909 ) ) ( TRUCK-AT ?auto_275912 ?auto_275913 ) ( IN-CITY ?auto_275913 ?auto_275911 ) ( IN-CITY ?auto_275906 ?auto_275911 ) ( not ( = ?auto_275906 ?auto_275913 ) ) ( OBJ-AT ?auto_275907 ?auto_275906 ) ( OBJ-AT ?auto_275910 ?auto_275913 ) ( OBJ-AT ?auto_275908 ?auto_275906 ) ( OBJ-AT ?auto_275909 ?auto_275906 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_275907 ?auto_275910 ?auto_275906 )
      ( DELIVER-4PKG-VERIFY ?auto_275907 ?auto_275908 ?auto_275909 ?auto_275910 ?auto_275906 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_275931 - OBJ
      ?auto_275932 - OBJ
      ?auto_275933 - OBJ
      ?auto_275934 - OBJ
      ?auto_275930 - LOCATION
    )
    :vars
    (
      ?auto_275936 - TRUCK
      ?auto_275937 - LOCATION
      ?auto_275935 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_275932 ?auto_275931 ) ) ( not ( = ?auto_275933 ?auto_275931 ) ) ( not ( = ?auto_275933 ?auto_275932 ) ) ( not ( = ?auto_275934 ?auto_275931 ) ) ( not ( = ?auto_275934 ?auto_275932 ) ) ( not ( = ?auto_275934 ?auto_275933 ) ) ( TRUCK-AT ?auto_275936 ?auto_275937 ) ( IN-CITY ?auto_275937 ?auto_275935 ) ( IN-CITY ?auto_275930 ?auto_275935 ) ( not ( = ?auto_275930 ?auto_275937 ) ) ( OBJ-AT ?auto_275931 ?auto_275930 ) ( OBJ-AT ?auto_275933 ?auto_275937 ) ( OBJ-AT ?auto_275932 ?auto_275930 ) ( OBJ-AT ?auto_275934 ?auto_275930 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_275931 ?auto_275933 ?auto_275930 )
      ( DELIVER-4PKG-VERIFY ?auto_275931 ?auto_275932 ?auto_275933 ?auto_275934 ?auto_275930 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_276045 - OBJ
      ?auto_276046 - OBJ
      ?auto_276047 - OBJ
      ?auto_276048 - OBJ
      ?auto_276044 - LOCATION
    )
    :vars
    (
      ?auto_276050 - TRUCK
      ?auto_276051 - LOCATION
      ?auto_276049 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_276046 ?auto_276045 ) ) ( not ( = ?auto_276047 ?auto_276045 ) ) ( not ( = ?auto_276047 ?auto_276046 ) ) ( not ( = ?auto_276048 ?auto_276045 ) ) ( not ( = ?auto_276048 ?auto_276046 ) ) ( not ( = ?auto_276048 ?auto_276047 ) ) ( TRUCK-AT ?auto_276050 ?auto_276051 ) ( IN-CITY ?auto_276051 ?auto_276049 ) ( IN-CITY ?auto_276044 ?auto_276049 ) ( not ( = ?auto_276044 ?auto_276051 ) ) ( OBJ-AT ?auto_276045 ?auto_276044 ) ( OBJ-AT ?auto_276046 ?auto_276051 ) ( OBJ-AT ?auto_276047 ?auto_276044 ) ( OBJ-AT ?auto_276048 ?auto_276044 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_276045 ?auto_276046 ?auto_276044 )
      ( DELIVER-4PKG-VERIFY ?auto_276045 ?auto_276046 ?auto_276047 ?auto_276048 ?auto_276044 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_276764 - OBJ
      ?auto_276765 - OBJ
      ?auto_276766 - OBJ
      ?auto_276767 - OBJ
      ?auto_276763 - LOCATION
    )
    :vars
    (
      ?auto_276769 - TRUCK
      ?auto_276770 - LOCATION
      ?auto_276768 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_276765 ?auto_276764 ) ) ( not ( = ?auto_276766 ?auto_276764 ) ) ( not ( = ?auto_276766 ?auto_276765 ) ) ( not ( = ?auto_276767 ?auto_276764 ) ) ( not ( = ?auto_276767 ?auto_276765 ) ) ( not ( = ?auto_276767 ?auto_276766 ) ) ( TRUCK-AT ?auto_276769 ?auto_276770 ) ( IN-CITY ?auto_276770 ?auto_276768 ) ( IN-CITY ?auto_276763 ?auto_276768 ) ( not ( = ?auto_276763 ?auto_276770 ) ) ( OBJ-AT ?auto_276765 ?auto_276763 ) ( OBJ-AT ?auto_276764 ?auto_276770 ) ( OBJ-AT ?auto_276766 ?auto_276763 ) ( OBJ-AT ?auto_276767 ?auto_276763 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_276765 ?auto_276764 ?auto_276763 )
      ( DELIVER-4PKG-VERIFY ?auto_276764 ?auto_276765 ?auto_276766 ?auto_276767 ?auto_276763 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_284816 - OBJ
      ?auto_284817 - OBJ
      ?auto_284818 - OBJ
      ?auto_284819 - OBJ
      ?auto_284815 - LOCATION
    )
    :vars
    (
      ?auto_284822 - LOCATION
      ?auto_284820 - CITY
      ?auto_284821 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_284817 ?auto_284816 ) ) ( not ( = ?auto_284818 ?auto_284816 ) ) ( not ( = ?auto_284818 ?auto_284817 ) ) ( not ( = ?auto_284819 ?auto_284816 ) ) ( not ( = ?auto_284819 ?auto_284817 ) ) ( not ( = ?auto_284819 ?auto_284818 ) ) ( IN-CITY ?auto_284822 ?auto_284820 ) ( IN-CITY ?auto_284815 ?auto_284820 ) ( not ( = ?auto_284815 ?auto_284822 ) ) ( OBJ-AT ?auto_284816 ?auto_284815 ) ( OBJ-AT ?auto_284819 ?auto_284822 ) ( TRUCK-AT ?auto_284821 ?auto_284815 ) ( OBJ-AT ?auto_284817 ?auto_284815 ) ( OBJ-AT ?auto_284818 ?auto_284815 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_284816 ?auto_284819 ?auto_284815 )
      ( DELIVER-4PKG-VERIFY ?auto_284816 ?auto_284817 ?auto_284818 ?auto_284819 ?auto_284815 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_284840 - OBJ
      ?auto_284841 - OBJ
      ?auto_284842 - OBJ
      ?auto_284843 - OBJ
      ?auto_284839 - LOCATION
    )
    :vars
    (
      ?auto_284846 - LOCATION
      ?auto_284844 - CITY
      ?auto_284845 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_284841 ?auto_284840 ) ) ( not ( = ?auto_284842 ?auto_284840 ) ) ( not ( = ?auto_284842 ?auto_284841 ) ) ( not ( = ?auto_284843 ?auto_284840 ) ) ( not ( = ?auto_284843 ?auto_284841 ) ) ( not ( = ?auto_284843 ?auto_284842 ) ) ( IN-CITY ?auto_284846 ?auto_284844 ) ( IN-CITY ?auto_284839 ?auto_284844 ) ( not ( = ?auto_284839 ?auto_284846 ) ) ( OBJ-AT ?auto_284840 ?auto_284839 ) ( OBJ-AT ?auto_284842 ?auto_284846 ) ( TRUCK-AT ?auto_284845 ?auto_284839 ) ( OBJ-AT ?auto_284841 ?auto_284839 ) ( OBJ-AT ?auto_284843 ?auto_284839 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_284840 ?auto_284842 ?auto_284839 )
      ( DELIVER-4PKG-VERIFY ?auto_284840 ?auto_284841 ?auto_284842 ?auto_284843 ?auto_284839 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_284954 - OBJ
      ?auto_284955 - OBJ
      ?auto_284956 - OBJ
      ?auto_284957 - OBJ
      ?auto_284953 - LOCATION
    )
    :vars
    (
      ?auto_284960 - LOCATION
      ?auto_284958 - CITY
      ?auto_284959 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_284955 ?auto_284954 ) ) ( not ( = ?auto_284956 ?auto_284954 ) ) ( not ( = ?auto_284956 ?auto_284955 ) ) ( not ( = ?auto_284957 ?auto_284954 ) ) ( not ( = ?auto_284957 ?auto_284955 ) ) ( not ( = ?auto_284957 ?auto_284956 ) ) ( IN-CITY ?auto_284960 ?auto_284958 ) ( IN-CITY ?auto_284953 ?auto_284958 ) ( not ( = ?auto_284953 ?auto_284960 ) ) ( OBJ-AT ?auto_284954 ?auto_284953 ) ( OBJ-AT ?auto_284955 ?auto_284960 ) ( TRUCK-AT ?auto_284959 ?auto_284953 ) ( OBJ-AT ?auto_284956 ?auto_284953 ) ( OBJ-AT ?auto_284957 ?auto_284953 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_284954 ?auto_284955 ?auto_284953 )
      ( DELIVER-4PKG-VERIFY ?auto_284954 ?auto_284955 ?auto_284956 ?auto_284957 ?auto_284953 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_285673 - OBJ
      ?auto_285674 - OBJ
      ?auto_285675 - OBJ
      ?auto_285676 - OBJ
      ?auto_285672 - LOCATION
    )
    :vars
    (
      ?auto_285679 - LOCATION
      ?auto_285677 - CITY
      ?auto_285678 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_285674 ?auto_285673 ) ) ( not ( = ?auto_285675 ?auto_285673 ) ) ( not ( = ?auto_285675 ?auto_285674 ) ) ( not ( = ?auto_285676 ?auto_285673 ) ) ( not ( = ?auto_285676 ?auto_285674 ) ) ( not ( = ?auto_285676 ?auto_285675 ) ) ( IN-CITY ?auto_285679 ?auto_285677 ) ( IN-CITY ?auto_285672 ?auto_285677 ) ( not ( = ?auto_285672 ?auto_285679 ) ) ( OBJ-AT ?auto_285674 ?auto_285672 ) ( OBJ-AT ?auto_285673 ?auto_285679 ) ( TRUCK-AT ?auto_285678 ?auto_285672 ) ( OBJ-AT ?auto_285675 ?auto_285672 ) ( OBJ-AT ?auto_285676 ?auto_285672 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_285674 ?auto_285673 ?auto_285672 )
      ( DELIVER-4PKG-VERIFY ?auto_285673 ?auto_285674 ?auto_285675 ?auto_285676 ?auto_285672 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_302448 - OBJ
      ?auto_302449 - OBJ
      ?auto_302450 - OBJ
      ?auto_302447 - LOCATION
    )
    :vars
    (
      ?auto_302451 - LOCATION
      ?auto_302452 - CITY
      ?auto_302454 - TRUCK
      ?auto_302453 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_302449 ?auto_302448 ) ) ( not ( = ?auto_302450 ?auto_302448 ) ) ( not ( = ?auto_302450 ?auto_302449 ) ) ( IN-CITY ?auto_302451 ?auto_302452 ) ( IN-CITY ?auto_302447 ?auto_302452 ) ( not ( = ?auto_302447 ?auto_302451 ) ) ( OBJ-AT ?auto_302448 ?auto_302447 ) ( OBJ-AT ?auto_302450 ?auto_302451 ) ( TRUCK-AT ?auto_302454 ?auto_302453 ) ( IN-CITY ?auto_302453 ?auto_302452 ) ( not ( = ?auto_302447 ?auto_302453 ) ) ( not ( = ?auto_302451 ?auto_302453 ) ) ( OBJ-AT ?auto_302449 ?auto_302447 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302448 ?auto_302450 ?auto_302447 )
      ( DELIVER-3PKG-VERIFY ?auto_302448 ?auto_302449 ?auto_302450 ?auto_302447 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_302472 - OBJ
      ?auto_302473 - OBJ
      ?auto_302474 - OBJ
      ?auto_302471 - LOCATION
    )
    :vars
    (
      ?auto_302475 - LOCATION
      ?auto_302476 - CITY
      ?auto_302478 - TRUCK
      ?auto_302477 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_302473 ?auto_302472 ) ) ( not ( = ?auto_302474 ?auto_302472 ) ) ( not ( = ?auto_302474 ?auto_302473 ) ) ( IN-CITY ?auto_302475 ?auto_302476 ) ( IN-CITY ?auto_302471 ?auto_302476 ) ( not ( = ?auto_302471 ?auto_302475 ) ) ( OBJ-AT ?auto_302472 ?auto_302471 ) ( OBJ-AT ?auto_302473 ?auto_302475 ) ( TRUCK-AT ?auto_302478 ?auto_302477 ) ( IN-CITY ?auto_302477 ?auto_302476 ) ( not ( = ?auto_302471 ?auto_302477 ) ) ( not ( = ?auto_302475 ?auto_302477 ) ) ( OBJ-AT ?auto_302474 ?auto_302471 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302472 ?auto_302473 ?auto_302471 )
      ( DELIVER-3PKG-VERIFY ?auto_302472 ?auto_302473 ?auto_302474 ?auto_302471 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_302618 - OBJ
      ?auto_302619 - OBJ
      ?auto_302620 - OBJ
      ?auto_302617 - LOCATION
    )
    :vars
    (
      ?auto_302621 - LOCATION
      ?auto_302622 - CITY
      ?auto_302624 - TRUCK
      ?auto_302623 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_302619 ?auto_302618 ) ) ( not ( = ?auto_302620 ?auto_302618 ) ) ( not ( = ?auto_302620 ?auto_302619 ) ) ( IN-CITY ?auto_302621 ?auto_302622 ) ( IN-CITY ?auto_302617 ?auto_302622 ) ( not ( = ?auto_302617 ?auto_302621 ) ) ( OBJ-AT ?auto_302619 ?auto_302617 ) ( OBJ-AT ?auto_302618 ?auto_302621 ) ( TRUCK-AT ?auto_302624 ?auto_302623 ) ( IN-CITY ?auto_302623 ?auto_302622 ) ( not ( = ?auto_302617 ?auto_302623 ) ) ( not ( = ?auto_302621 ?auto_302623 ) ) ( OBJ-AT ?auto_302620 ?auto_302617 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302619 ?auto_302618 ?auto_302617 )
      ( DELIVER-3PKG-VERIFY ?auto_302618 ?auto_302619 ?auto_302620 ?auto_302617 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_425015 - OBJ
      ?auto_425016 - OBJ
      ?auto_425017 - OBJ
      ?auto_425018 - OBJ
      ?auto_425019 - OBJ
      ?auto_425014 - LOCATION
    )
    :vars
    (
      ?auto_425020 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_425016 ?auto_425015 ) ) ( not ( = ?auto_425017 ?auto_425015 ) ) ( not ( = ?auto_425017 ?auto_425016 ) ) ( not ( = ?auto_425018 ?auto_425015 ) ) ( not ( = ?auto_425018 ?auto_425016 ) ) ( not ( = ?auto_425018 ?auto_425017 ) ) ( not ( = ?auto_425019 ?auto_425015 ) ) ( not ( = ?auto_425019 ?auto_425016 ) ) ( not ( = ?auto_425019 ?auto_425017 ) ) ( not ( = ?auto_425019 ?auto_425018 ) ) ( TRUCK-AT ?auto_425020 ?auto_425014 ) ( IN-TRUCK ?auto_425019 ?auto_425020 ) ( OBJ-AT ?auto_425015 ?auto_425014 ) ( OBJ-AT ?auto_425016 ?auto_425014 ) ( OBJ-AT ?auto_425017 ?auto_425014 ) ( OBJ-AT ?auto_425018 ?auto_425014 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_425019 ?auto_425014 )
      ( DELIVER-5PKG-VERIFY ?auto_425015 ?auto_425016 ?auto_425017 ?auto_425018 ?auto_425019 ?auto_425014 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_425043 - OBJ
      ?auto_425044 - OBJ
      ?auto_425045 - OBJ
      ?auto_425046 - OBJ
      ?auto_425047 - OBJ
      ?auto_425042 - LOCATION
    )
    :vars
    (
      ?auto_425048 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_425044 ?auto_425043 ) ) ( not ( = ?auto_425045 ?auto_425043 ) ) ( not ( = ?auto_425045 ?auto_425044 ) ) ( not ( = ?auto_425046 ?auto_425043 ) ) ( not ( = ?auto_425046 ?auto_425044 ) ) ( not ( = ?auto_425046 ?auto_425045 ) ) ( not ( = ?auto_425047 ?auto_425043 ) ) ( not ( = ?auto_425047 ?auto_425044 ) ) ( not ( = ?auto_425047 ?auto_425045 ) ) ( not ( = ?auto_425047 ?auto_425046 ) ) ( TRUCK-AT ?auto_425048 ?auto_425042 ) ( IN-TRUCK ?auto_425046 ?auto_425048 ) ( OBJ-AT ?auto_425043 ?auto_425042 ) ( OBJ-AT ?auto_425044 ?auto_425042 ) ( OBJ-AT ?auto_425045 ?auto_425042 ) ( OBJ-AT ?auto_425047 ?auto_425042 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_425046 ?auto_425042 )
      ( DELIVER-5PKG-VERIFY ?auto_425043 ?auto_425044 ?auto_425045 ?auto_425046 ?auto_425047 ?auto_425042 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_425209 - OBJ
      ?auto_425210 - OBJ
      ?auto_425211 - OBJ
      ?auto_425212 - OBJ
      ?auto_425213 - OBJ
      ?auto_425208 - LOCATION
    )
    :vars
    (
      ?auto_425214 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_425210 ?auto_425209 ) ) ( not ( = ?auto_425211 ?auto_425209 ) ) ( not ( = ?auto_425211 ?auto_425210 ) ) ( not ( = ?auto_425212 ?auto_425209 ) ) ( not ( = ?auto_425212 ?auto_425210 ) ) ( not ( = ?auto_425212 ?auto_425211 ) ) ( not ( = ?auto_425213 ?auto_425209 ) ) ( not ( = ?auto_425213 ?auto_425210 ) ) ( not ( = ?auto_425213 ?auto_425211 ) ) ( not ( = ?auto_425213 ?auto_425212 ) ) ( TRUCK-AT ?auto_425214 ?auto_425208 ) ( IN-TRUCK ?auto_425211 ?auto_425214 ) ( OBJ-AT ?auto_425209 ?auto_425208 ) ( OBJ-AT ?auto_425210 ?auto_425208 ) ( OBJ-AT ?auto_425212 ?auto_425208 ) ( OBJ-AT ?auto_425213 ?auto_425208 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_425211 ?auto_425208 )
      ( DELIVER-5PKG-VERIFY ?auto_425209 ?auto_425210 ?auto_425211 ?auto_425212 ?auto_425213 ?auto_425208 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_426400 - OBJ
      ?auto_426401 - OBJ
      ?auto_426402 - OBJ
      ?auto_426403 - OBJ
      ?auto_426404 - OBJ
      ?auto_426399 - LOCATION
    )
    :vars
    (
      ?auto_426405 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_426401 ?auto_426400 ) ) ( not ( = ?auto_426402 ?auto_426400 ) ) ( not ( = ?auto_426402 ?auto_426401 ) ) ( not ( = ?auto_426403 ?auto_426400 ) ) ( not ( = ?auto_426403 ?auto_426401 ) ) ( not ( = ?auto_426403 ?auto_426402 ) ) ( not ( = ?auto_426404 ?auto_426400 ) ) ( not ( = ?auto_426404 ?auto_426401 ) ) ( not ( = ?auto_426404 ?auto_426402 ) ) ( not ( = ?auto_426404 ?auto_426403 ) ) ( TRUCK-AT ?auto_426405 ?auto_426399 ) ( IN-TRUCK ?auto_426401 ?auto_426405 ) ( OBJ-AT ?auto_426400 ?auto_426399 ) ( OBJ-AT ?auto_426402 ?auto_426399 ) ( OBJ-AT ?auto_426403 ?auto_426399 ) ( OBJ-AT ?auto_426404 ?auto_426399 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_426401 ?auto_426399 )
      ( DELIVER-5PKG-VERIFY ?auto_426400 ?auto_426401 ?auto_426402 ?auto_426403 ?auto_426404 ?auto_426399 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_434947 - OBJ
      ?auto_434948 - OBJ
      ?auto_434949 - OBJ
      ?auto_434950 - OBJ
      ?auto_434951 - OBJ
      ?auto_434946 - LOCATION
    )
    :vars
    (
      ?auto_434952 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_434948 ?auto_434947 ) ) ( not ( = ?auto_434949 ?auto_434947 ) ) ( not ( = ?auto_434949 ?auto_434948 ) ) ( not ( = ?auto_434950 ?auto_434947 ) ) ( not ( = ?auto_434950 ?auto_434948 ) ) ( not ( = ?auto_434950 ?auto_434949 ) ) ( not ( = ?auto_434951 ?auto_434947 ) ) ( not ( = ?auto_434951 ?auto_434948 ) ) ( not ( = ?auto_434951 ?auto_434949 ) ) ( not ( = ?auto_434951 ?auto_434950 ) ) ( TRUCK-AT ?auto_434952 ?auto_434946 ) ( IN-TRUCK ?auto_434947 ?auto_434952 ) ( OBJ-AT ?auto_434948 ?auto_434946 ) ( OBJ-AT ?auto_434949 ?auto_434946 ) ( OBJ-AT ?auto_434950 ?auto_434946 ) ( OBJ-AT ?auto_434951 ?auto_434946 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_434947 ?auto_434946 )
      ( DELIVER-5PKG-VERIFY ?auto_434947 ?auto_434948 ?auto_434949 ?auto_434950 ?auto_434951 ?auto_434946 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_442987 - OBJ
      ?auto_442988 - OBJ
      ?auto_442989 - OBJ
      ?auto_442990 - OBJ
      ?auto_442991 - OBJ
      ?auto_442986 - LOCATION
    )
    :vars
    (
      ?auto_442992 - TRUCK
      ?auto_442993 - LOCATION
      ?auto_442994 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_442988 ?auto_442987 ) ) ( not ( = ?auto_442989 ?auto_442987 ) ) ( not ( = ?auto_442989 ?auto_442988 ) ) ( not ( = ?auto_442990 ?auto_442987 ) ) ( not ( = ?auto_442990 ?auto_442988 ) ) ( not ( = ?auto_442990 ?auto_442989 ) ) ( not ( = ?auto_442991 ?auto_442987 ) ) ( not ( = ?auto_442991 ?auto_442988 ) ) ( not ( = ?auto_442991 ?auto_442989 ) ) ( not ( = ?auto_442991 ?auto_442990 ) ) ( IN-TRUCK ?auto_442991 ?auto_442992 ) ( TRUCK-AT ?auto_442992 ?auto_442993 ) ( IN-CITY ?auto_442993 ?auto_442994 ) ( IN-CITY ?auto_442986 ?auto_442994 ) ( not ( = ?auto_442986 ?auto_442993 ) ) ( OBJ-AT ?auto_442987 ?auto_442986 ) ( OBJ-AT ?auto_442988 ?auto_442986 ) ( OBJ-AT ?auto_442989 ?auto_442986 ) ( OBJ-AT ?auto_442990 ?auto_442986 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_442987 ?auto_442991 ?auto_442986 )
      ( DELIVER-5PKG-VERIFY ?auto_442987 ?auto_442988 ?auto_442989 ?auto_442990 ?auto_442991 ?auto_442986 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_443023 - OBJ
      ?auto_443024 - OBJ
      ?auto_443025 - OBJ
      ?auto_443026 - OBJ
      ?auto_443027 - OBJ
      ?auto_443022 - LOCATION
    )
    :vars
    (
      ?auto_443028 - TRUCK
      ?auto_443029 - LOCATION
      ?auto_443030 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_443024 ?auto_443023 ) ) ( not ( = ?auto_443025 ?auto_443023 ) ) ( not ( = ?auto_443025 ?auto_443024 ) ) ( not ( = ?auto_443026 ?auto_443023 ) ) ( not ( = ?auto_443026 ?auto_443024 ) ) ( not ( = ?auto_443026 ?auto_443025 ) ) ( not ( = ?auto_443027 ?auto_443023 ) ) ( not ( = ?auto_443027 ?auto_443024 ) ) ( not ( = ?auto_443027 ?auto_443025 ) ) ( not ( = ?auto_443027 ?auto_443026 ) ) ( IN-TRUCK ?auto_443026 ?auto_443028 ) ( TRUCK-AT ?auto_443028 ?auto_443029 ) ( IN-CITY ?auto_443029 ?auto_443030 ) ( IN-CITY ?auto_443022 ?auto_443030 ) ( not ( = ?auto_443022 ?auto_443029 ) ) ( OBJ-AT ?auto_443023 ?auto_443022 ) ( OBJ-AT ?auto_443024 ?auto_443022 ) ( OBJ-AT ?auto_443025 ?auto_443022 ) ( OBJ-AT ?auto_443027 ?auto_443022 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_443023 ?auto_443026 ?auto_443022 )
      ( DELIVER-5PKG-VERIFY ?auto_443023 ?auto_443024 ?auto_443025 ?auto_443026 ?auto_443027 ?auto_443022 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_443233 - OBJ
      ?auto_443234 - OBJ
      ?auto_443235 - OBJ
      ?auto_443236 - OBJ
      ?auto_443237 - OBJ
      ?auto_443232 - LOCATION
    )
    :vars
    (
      ?auto_443238 - TRUCK
      ?auto_443239 - LOCATION
      ?auto_443240 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_443234 ?auto_443233 ) ) ( not ( = ?auto_443235 ?auto_443233 ) ) ( not ( = ?auto_443235 ?auto_443234 ) ) ( not ( = ?auto_443236 ?auto_443233 ) ) ( not ( = ?auto_443236 ?auto_443234 ) ) ( not ( = ?auto_443236 ?auto_443235 ) ) ( not ( = ?auto_443237 ?auto_443233 ) ) ( not ( = ?auto_443237 ?auto_443234 ) ) ( not ( = ?auto_443237 ?auto_443235 ) ) ( not ( = ?auto_443237 ?auto_443236 ) ) ( IN-TRUCK ?auto_443235 ?auto_443238 ) ( TRUCK-AT ?auto_443238 ?auto_443239 ) ( IN-CITY ?auto_443239 ?auto_443240 ) ( IN-CITY ?auto_443232 ?auto_443240 ) ( not ( = ?auto_443232 ?auto_443239 ) ) ( OBJ-AT ?auto_443233 ?auto_443232 ) ( OBJ-AT ?auto_443234 ?auto_443232 ) ( OBJ-AT ?auto_443236 ?auto_443232 ) ( OBJ-AT ?auto_443237 ?auto_443232 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_443233 ?auto_443235 ?auto_443232 )
      ( DELIVER-5PKG-VERIFY ?auto_443233 ?auto_443234 ?auto_443235 ?auto_443236 ?auto_443237 ?auto_443232 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_444742 - OBJ
      ?auto_444743 - OBJ
      ?auto_444744 - OBJ
      ?auto_444745 - OBJ
      ?auto_444746 - OBJ
      ?auto_444741 - LOCATION
    )
    :vars
    (
      ?auto_444747 - TRUCK
      ?auto_444748 - LOCATION
      ?auto_444749 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_444743 ?auto_444742 ) ) ( not ( = ?auto_444744 ?auto_444742 ) ) ( not ( = ?auto_444744 ?auto_444743 ) ) ( not ( = ?auto_444745 ?auto_444742 ) ) ( not ( = ?auto_444745 ?auto_444743 ) ) ( not ( = ?auto_444745 ?auto_444744 ) ) ( not ( = ?auto_444746 ?auto_444742 ) ) ( not ( = ?auto_444746 ?auto_444743 ) ) ( not ( = ?auto_444746 ?auto_444744 ) ) ( not ( = ?auto_444746 ?auto_444745 ) ) ( IN-TRUCK ?auto_444743 ?auto_444747 ) ( TRUCK-AT ?auto_444747 ?auto_444748 ) ( IN-CITY ?auto_444748 ?auto_444749 ) ( IN-CITY ?auto_444741 ?auto_444749 ) ( not ( = ?auto_444741 ?auto_444748 ) ) ( OBJ-AT ?auto_444742 ?auto_444741 ) ( OBJ-AT ?auto_444744 ?auto_444741 ) ( OBJ-AT ?auto_444745 ?auto_444741 ) ( OBJ-AT ?auto_444746 ?auto_444741 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_444742 ?auto_444743 ?auto_444741 )
      ( DELIVER-5PKG-VERIFY ?auto_444742 ?auto_444743 ?auto_444744 ?auto_444745 ?auto_444746 ?auto_444741 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_456124 - OBJ
      ?auto_456125 - OBJ
      ?auto_456126 - OBJ
      ?auto_456127 - OBJ
      ?auto_456128 - OBJ
      ?auto_456123 - LOCATION
    )
    :vars
    (
      ?auto_456129 - TRUCK
      ?auto_456130 - LOCATION
      ?auto_456131 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_456125 ?auto_456124 ) ) ( not ( = ?auto_456126 ?auto_456124 ) ) ( not ( = ?auto_456126 ?auto_456125 ) ) ( not ( = ?auto_456127 ?auto_456124 ) ) ( not ( = ?auto_456127 ?auto_456125 ) ) ( not ( = ?auto_456127 ?auto_456126 ) ) ( not ( = ?auto_456128 ?auto_456124 ) ) ( not ( = ?auto_456128 ?auto_456125 ) ) ( not ( = ?auto_456128 ?auto_456126 ) ) ( not ( = ?auto_456128 ?auto_456127 ) ) ( IN-TRUCK ?auto_456124 ?auto_456129 ) ( TRUCK-AT ?auto_456129 ?auto_456130 ) ( IN-CITY ?auto_456130 ?auto_456131 ) ( IN-CITY ?auto_456123 ?auto_456131 ) ( not ( = ?auto_456123 ?auto_456130 ) ) ( OBJ-AT ?auto_456125 ?auto_456123 ) ( OBJ-AT ?auto_456126 ?auto_456123 ) ( OBJ-AT ?auto_456127 ?auto_456123 ) ( OBJ-AT ?auto_456128 ?auto_456123 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_456125 ?auto_456124 ?auto_456123 )
      ( DELIVER-5PKG-VERIFY ?auto_456124 ?auto_456125 ?auto_456126 ?auto_456127 ?auto_456128 ?auto_456123 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_465549 - OBJ
      ?auto_465550 - OBJ
      ?auto_465551 - OBJ
      ?auto_465552 - OBJ
      ?auto_465553 - OBJ
      ?auto_465548 - LOCATION
    )
    :vars
    (
      ?auto_465554 - TRUCK
      ?auto_465555 - LOCATION
      ?auto_465556 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_465550 ?auto_465549 ) ) ( not ( = ?auto_465551 ?auto_465549 ) ) ( not ( = ?auto_465551 ?auto_465550 ) ) ( not ( = ?auto_465552 ?auto_465549 ) ) ( not ( = ?auto_465552 ?auto_465550 ) ) ( not ( = ?auto_465552 ?auto_465551 ) ) ( not ( = ?auto_465553 ?auto_465549 ) ) ( not ( = ?auto_465553 ?auto_465550 ) ) ( not ( = ?auto_465553 ?auto_465551 ) ) ( not ( = ?auto_465553 ?auto_465552 ) ) ( TRUCK-AT ?auto_465554 ?auto_465555 ) ( IN-CITY ?auto_465555 ?auto_465556 ) ( IN-CITY ?auto_465548 ?auto_465556 ) ( not ( = ?auto_465548 ?auto_465555 ) ) ( OBJ-AT ?auto_465549 ?auto_465548 ) ( OBJ-AT ?auto_465553 ?auto_465555 ) ( OBJ-AT ?auto_465550 ?auto_465548 ) ( OBJ-AT ?auto_465551 ?auto_465548 ) ( OBJ-AT ?auto_465552 ?auto_465548 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_465549 ?auto_465553 ?auto_465548 )
      ( DELIVER-5PKG-VERIFY ?auto_465549 ?auto_465550 ?auto_465551 ?auto_465552 ?auto_465553 ?auto_465548 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_465585 - OBJ
      ?auto_465586 - OBJ
      ?auto_465587 - OBJ
      ?auto_465588 - OBJ
      ?auto_465589 - OBJ
      ?auto_465584 - LOCATION
    )
    :vars
    (
      ?auto_465590 - TRUCK
      ?auto_465591 - LOCATION
      ?auto_465592 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_465586 ?auto_465585 ) ) ( not ( = ?auto_465587 ?auto_465585 ) ) ( not ( = ?auto_465587 ?auto_465586 ) ) ( not ( = ?auto_465588 ?auto_465585 ) ) ( not ( = ?auto_465588 ?auto_465586 ) ) ( not ( = ?auto_465588 ?auto_465587 ) ) ( not ( = ?auto_465589 ?auto_465585 ) ) ( not ( = ?auto_465589 ?auto_465586 ) ) ( not ( = ?auto_465589 ?auto_465587 ) ) ( not ( = ?auto_465589 ?auto_465588 ) ) ( TRUCK-AT ?auto_465590 ?auto_465591 ) ( IN-CITY ?auto_465591 ?auto_465592 ) ( IN-CITY ?auto_465584 ?auto_465592 ) ( not ( = ?auto_465584 ?auto_465591 ) ) ( OBJ-AT ?auto_465585 ?auto_465584 ) ( OBJ-AT ?auto_465588 ?auto_465591 ) ( OBJ-AT ?auto_465586 ?auto_465584 ) ( OBJ-AT ?auto_465587 ?auto_465584 ) ( OBJ-AT ?auto_465589 ?auto_465584 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_465585 ?auto_465588 ?auto_465584 )
      ( DELIVER-5PKG-VERIFY ?auto_465585 ?auto_465586 ?auto_465587 ?auto_465588 ?auto_465589 ?auto_465584 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_465795 - OBJ
      ?auto_465796 - OBJ
      ?auto_465797 - OBJ
      ?auto_465798 - OBJ
      ?auto_465799 - OBJ
      ?auto_465794 - LOCATION
    )
    :vars
    (
      ?auto_465800 - TRUCK
      ?auto_465801 - LOCATION
      ?auto_465802 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_465796 ?auto_465795 ) ) ( not ( = ?auto_465797 ?auto_465795 ) ) ( not ( = ?auto_465797 ?auto_465796 ) ) ( not ( = ?auto_465798 ?auto_465795 ) ) ( not ( = ?auto_465798 ?auto_465796 ) ) ( not ( = ?auto_465798 ?auto_465797 ) ) ( not ( = ?auto_465799 ?auto_465795 ) ) ( not ( = ?auto_465799 ?auto_465796 ) ) ( not ( = ?auto_465799 ?auto_465797 ) ) ( not ( = ?auto_465799 ?auto_465798 ) ) ( TRUCK-AT ?auto_465800 ?auto_465801 ) ( IN-CITY ?auto_465801 ?auto_465802 ) ( IN-CITY ?auto_465794 ?auto_465802 ) ( not ( = ?auto_465794 ?auto_465801 ) ) ( OBJ-AT ?auto_465795 ?auto_465794 ) ( OBJ-AT ?auto_465797 ?auto_465801 ) ( OBJ-AT ?auto_465796 ?auto_465794 ) ( OBJ-AT ?auto_465798 ?auto_465794 ) ( OBJ-AT ?auto_465799 ?auto_465794 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_465795 ?auto_465797 ?auto_465794 )
      ( DELIVER-5PKG-VERIFY ?auto_465795 ?auto_465796 ?auto_465797 ?auto_465798 ?auto_465799 ?auto_465794 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_467304 - OBJ
      ?auto_467305 - OBJ
      ?auto_467306 - OBJ
      ?auto_467307 - OBJ
      ?auto_467308 - OBJ
      ?auto_467303 - LOCATION
    )
    :vars
    (
      ?auto_467309 - TRUCK
      ?auto_467310 - LOCATION
      ?auto_467311 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_467305 ?auto_467304 ) ) ( not ( = ?auto_467306 ?auto_467304 ) ) ( not ( = ?auto_467306 ?auto_467305 ) ) ( not ( = ?auto_467307 ?auto_467304 ) ) ( not ( = ?auto_467307 ?auto_467305 ) ) ( not ( = ?auto_467307 ?auto_467306 ) ) ( not ( = ?auto_467308 ?auto_467304 ) ) ( not ( = ?auto_467308 ?auto_467305 ) ) ( not ( = ?auto_467308 ?auto_467306 ) ) ( not ( = ?auto_467308 ?auto_467307 ) ) ( TRUCK-AT ?auto_467309 ?auto_467310 ) ( IN-CITY ?auto_467310 ?auto_467311 ) ( IN-CITY ?auto_467303 ?auto_467311 ) ( not ( = ?auto_467303 ?auto_467310 ) ) ( OBJ-AT ?auto_467304 ?auto_467303 ) ( OBJ-AT ?auto_467305 ?auto_467310 ) ( OBJ-AT ?auto_467306 ?auto_467303 ) ( OBJ-AT ?auto_467307 ?auto_467303 ) ( OBJ-AT ?auto_467308 ?auto_467303 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_467304 ?auto_467305 ?auto_467303 )
      ( DELIVER-5PKG-VERIFY ?auto_467304 ?auto_467305 ?auto_467306 ?auto_467307 ?auto_467308 ?auto_467303 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_478686 - OBJ
      ?auto_478687 - OBJ
      ?auto_478688 - OBJ
      ?auto_478689 - OBJ
      ?auto_478690 - OBJ
      ?auto_478685 - LOCATION
    )
    :vars
    (
      ?auto_478691 - TRUCK
      ?auto_478692 - LOCATION
      ?auto_478693 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_478687 ?auto_478686 ) ) ( not ( = ?auto_478688 ?auto_478686 ) ) ( not ( = ?auto_478688 ?auto_478687 ) ) ( not ( = ?auto_478689 ?auto_478686 ) ) ( not ( = ?auto_478689 ?auto_478687 ) ) ( not ( = ?auto_478689 ?auto_478688 ) ) ( not ( = ?auto_478690 ?auto_478686 ) ) ( not ( = ?auto_478690 ?auto_478687 ) ) ( not ( = ?auto_478690 ?auto_478688 ) ) ( not ( = ?auto_478690 ?auto_478689 ) ) ( TRUCK-AT ?auto_478691 ?auto_478692 ) ( IN-CITY ?auto_478692 ?auto_478693 ) ( IN-CITY ?auto_478685 ?auto_478693 ) ( not ( = ?auto_478685 ?auto_478692 ) ) ( OBJ-AT ?auto_478687 ?auto_478685 ) ( OBJ-AT ?auto_478686 ?auto_478692 ) ( OBJ-AT ?auto_478688 ?auto_478685 ) ( OBJ-AT ?auto_478689 ?auto_478685 ) ( OBJ-AT ?auto_478690 ?auto_478685 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_478687 ?auto_478686 ?auto_478685 )
      ( DELIVER-5PKG-VERIFY ?auto_478686 ?auto_478687 ?auto_478688 ?auto_478689 ?auto_478690 ?auto_478685 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_488111 - OBJ
      ?auto_488112 - OBJ
      ?auto_488113 - OBJ
      ?auto_488114 - OBJ
      ?auto_488115 - OBJ
      ?auto_488110 - LOCATION
    )
    :vars
    (
      ?auto_488117 - LOCATION
      ?auto_488118 - CITY
      ?auto_488116 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_488112 ?auto_488111 ) ) ( not ( = ?auto_488113 ?auto_488111 ) ) ( not ( = ?auto_488113 ?auto_488112 ) ) ( not ( = ?auto_488114 ?auto_488111 ) ) ( not ( = ?auto_488114 ?auto_488112 ) ) ( not ( = ?auto_488114 ?auto_488113 ) ) ( not ( = ?auto_488115 ?auto_488111 ) ) ( not ( = ?auto_488115 ?auto_488112 ) ) ( not ( = ?auto_488115 ?auto_488113 ) ) ( not ( = ?auto_488115 ?auto_488114 ) ) ( IN-CITY ?auto_488117 ?auto_488118 ) ( IN-CITY ?auto_488110 ?auto_488118 ) ( not ( = ?auto_488110 ?auto_488117 ) ) ( OBJ-AT ?auto_488111 ?auto_488110 ) ( OBJ-AT ?auto_488115 ?auto_488117 ) ( TRUCK-AT ?auto_488116 ?auto_488110 ) ( OBJ-AT ?auto_488112 ?auto_488110 ) ( OBJ-AT ?auto_488113 ?auto_488110 ) ( OBJ-AT ?auto_488114 ?auto_488110 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_488111 ?auto_488115 ?auto_488110 )
      ( DELIVER-5PKG-VERIFY ?auto_488111 ?auto_488112 ?auto_488113 ?auto_488114 ?auto_488115 ?auto_488110 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_488147 - OBJ
      ?auto_488148 - OBJ
      ?auto_488149 - OBJ
      ?auto_488150 - OBJ
      ?auto_488151 - OBJ
      ?auto_488146 - LOCATION
    )
    :vars
    (
      ?auto_488153 - LOCATION
      ?auto_488154 - CITY
      ?auto_488152 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_488148 ?auto_488147 ) ) ( not ( = ?auto_488149 ?auto_488147 ) ) ( not ( = ?auto_488149 ?auto_488148 ) ) ( not ( = ?auto_488150 ?auto_488147 ) ) ( not ( = ?auto_488150 ?auto_488148 ) ) ( not ( = ?auto_488150 ?auto_488149 ) ) ( not ( = ?auto_488151 ?auto_488147 ) ) ( not ( = ?auto_488151 ?auto_488148 ) ) ( not ( = ?auto_488151 ?auto_488149 ) ) ( not ( = ?auto_488151 ?auto_488150 ) ) ( IN-CITY ?auto_488153 ?auto_488154 ) ( IN-CITY ?auto_488146 ?auto_488154 ) ( not ( = ?auto_488146 ?auto_488153 ) ) ( OBJ-AT ?auto_488147 ?auto_488146 ) ( OBJ-AT ?auto_488150 ?auto_488153 ) ( TRUCK-AT ?auto_488152 ?auto_488146 ) ( OBJ-AT ?auto_488148 ?auto_488146 ) ( OBJ-AT ?auto_488149 ?auto_488146 ) ( OBJ-AT ?auto_488151 ?auto_488146 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_488147 ?auto_488150 ?auto_488146 )
      ( DELIVER-5PKG-VERIFY ?auto_488147 ?auto_488148 ?auto_488149 ?auto_488150 ?auto_488151 ?auto_488146 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_488357 - OBJ
      ?auto_488358 - OBJ
      ?auto_488359 - OBJ
      ?auto_488360 - OBJ
      ?auto_488361 - OBJ
      ?auto_488356 - LOCATION
    )
    :vars
    (
      ?auto_488363 - LOCATION
      ?auto_488364 - CITY
      ?auto_488362 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_488358 ?auto_488357 ) ) ( not ( = ?auto_488359 ?auto_488357 ) ) ( not ( = ?auto_488359 ?auto_488358 ) ) ( not ( = ?auto_488360 ?auto_488357 ) ) ( not ( = ?auto_488360 ?auto_488358 ) ) ( not ( = ?auto_488360 ?auto_488359 ) ) ( not ( = ?auto_488361 ?auto_488357 ) ) ( not ( = ?auto_488361 ?auto_488358 ) ) ( not ( = ?auto_488361 ?auto_488359 ) ) ( not ( = ?auto_488361 ?auto_488360 ) ) ( IN-CITY ?auto_488363 ?auto_488364 ) ( IN-CITY ?auto_488356 ?auto_488364 ) ( not ( = ?auto_488356 ?auto_488363 ) ) ( OBJ-AT ?auto_488357 ?auto_488356 ) ( OBJ-AT ?auto_488359 ?auto_488363 ) ( TRUCK-AT ?auto_488362 ?auto_488356 ) ( OBJ-AT ?auto_488358 ?auto_488356 ) ( OBJ-AT ?auto_488360 ?auto_488356 ) ( OBJ-AT ?auto_488361 ?auto_488356 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_488357 ?auto_488359 ?auto_488356 )
      ( DELIVER-5PKG-VERIFY ?auto_488357 ?auto_488358 ?auto_488359 ?auto_488360 ?auto_488361 ?auto_488356 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_489866 - OBJ
      ?auto_489867 - OBJ
      ?auto_489868 - OBJ
      ?auto_489869 - OBJ
      ?auto_489870 - OBJ
      ?auto_489865 - LOCATION
    )
    :vars
    (
      ?auto_489872 - LOCATION
      ?auto_489873 - CITY
      ?auto_489871 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_489867 ?auto_489866 ) ) ( not ( = ?auto_489868 ?auto_489866 ) ) ( not ( = ?auto_489868 ?auto_489867 ) ) ( not ( = ?auto_489869 ?auto_489866 ) ) ( not ( = ?auto_489869 ?auto_489867 ) ) ( not ( = ?auto_489869 ?auto_489868 ) ) ( not ( = ?auto_489870 ?auto_489866 ) ) ( not ( = ?auto_489870 ?auto_489867 ) ) ( not ( = ?auto_489870 ?auto_489868 ) ) ( not ( = ?auto_489870 ?auto_489869 ) ) ( IN-CITY ?auto_489872 ?auto_489873 ) ( IN-CITY ?auto_489865 ?auto_489873 ) ( not ( = ?auto_489865 ?auto_489872 ) ) ( OBJ-AT ?auto_489866 ?auto_489865 ) ( OBJ-AT ?auto_489867 ?auto_489872 ) ( TRUCK-AT ?auto_489871 ?auto_489865 ) ( OBJ-AT ?auto_489868 ?auto_489865 ) ( OBJ-AT ?auto_489869 ?auto_489865 ) ( OBJ-AT ?auto_489870 ?auto_489865 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_489866 ?auto_489867 ?auto_489865 )
      ( DELIVER-5PKG-VERIFY ?auto_489866 ?auto_489867 ?auto_489868 ?auto_489869 ?auto_489870 ?auto_489865 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_501248 - OBJ
      ?auto_501249 - OBJ
      ?auto_501250 - OBJ
      ?auto_501251 - OBJ
      ?auto_501252 - OBJ
      ?auto_501247 - LOCATION
    )
    :vars
    (
      ?auto_501254 - LOCATION
      ?auto_501255 - CITY
      ?auto_501253 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_501249 ?auto_501248 ) ) ( not ( = ?auto_501250 ?auto_501248 ) ) ( not ( = ?auto_501250 ?auto_501249 ) ) ( not ( = ?auto_501251 ?auto_501248 ) ) ( not ( = ?auto_501251 ?auto_501249 ) ) ( not ( = ?auto_501251 ?auto_501250 ) ) ( not ( = ?auto_501252 ?auto_501248 ) ) ( not ( = ?auto_501252 ?auto_501249 ) ) ( not ( = ?auto_501252 ?auto_501250 ) ) ( not ( = ?auto_501252 ?auto_501251 ) ) ( IN-CITY ?auto_501254 ?auto_501255 ) ( IN-CITY ?auto_501247 ?auto_501255 ) ( not ( = ?auto_501247 ?auto_501254 ) ) ( OBJ-AT ?auto_501249 ?auto_501247 ) ( OBJ-AT ?auto_501248 ?auto_501254 ) ( TRUCK-AT ?auto_501253 ?auto_501247 ) ( OBJ-AT ?auto_501250 ?auto_501247 ) ( OBJ-AT ?auto_501251 ?auto_501247 ) ( OBJ-AT ?auto_501252 ?auto_501247 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_501249 ?auto_501248 ?auto_501247 )
      ( DELIVER-5PKG-VERIFY ?auto_501248 ?auto_501249 ?auto_501250 ?auto_501251 ?auto_501252 ?auto_501247 ) )
  )

)

