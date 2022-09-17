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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4438 - OBJ
      ?auto_4437 - LOCATION
    )
    :vars
    (
      ?auto_4440 - LOCATION
      ?auto_4441 - CITY
      ?auto_4439 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4440 ?auto_4441 ) ( IN-CITY ?auto_4437 ?auto_4441 ) ( not ( = ?auto_4437 ?auto_4440 ) ) ( OBJ-AT ?auto_4438 ?auto_4440 ) ( TRUCK-AT ?auto_4439 ?auto_4437 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4439 ?auto_4437 ?auto_4440 ?auto_4441 )
      ( !LOAD-TRUCK ?auto_4438 ?auto_4439 ?auto_4440 )
      ( !DRIVE-TRUCK ?auto_4439 ?auto_4440 ?auto_4437 ?auto_4441 )
      ( !UNLOAD-TRUCK ?auto_4438 ?auto_4439 ?auto_4437 )
      ( DELIVER-1PKG-VERIFY ?auto_4438 ?auto_4437 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4459 - OBJ
      ?auto_4460 - OBJ
      ?auto_4458 - LOCATION
    )
    :vars
    (
      ?auto_4461 - LOCATION
      ?auto_4463 - CITY
      ?auto_4464 - LOCATION
      ?auto_4462 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4461 ?auto_4463 ) ( IN-CITY ?auto_4458 ?auto_4463 ) ( not ( = ?auto_4458 ?auto_4461 ) ) ( OBJ-AT ?auto_4460 ?auto_4461 ) ( IN-CITY ?auto_4464 ?auto_4463 ) ( not ( = ?auto_4458 ?auto_4464 ) ) ( OBJ-AT ?auto_4459 ?auto_4464 ) ( TRUCK-AT ?auto_4462 ?auto_4458 ) ( not ( = ?auto_4459 ?auto_4460 ) ) ( not ( = ?auto_4461 ?auto_4464 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4459 ?auto_4458 )
      ( DELIVER-1PKG ?auto_4460 ?auto_4458 )
      ( DELIVER-2PKG-VERIFY ?auto_4459 ?auto_4460 ?auto_4458 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4570 - OBJ
      ?auto_4571 - OBJ
      ?auto_4572 - OBJ
      ?auto_4569 - LOCATION
    )
    :vars
    (
      ?auto_4573 - LOCATION
      ?auto_4574 - CITY
      ?auto_4576 - LOCATION
      ?auto_4577 - LOCATION
      ?auto_4575 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4573 ?auto_4574 ) ( IN-CITY ?auto_4569 ?auto_4574 ) ( not ( = ?auto_4569 ?auto_4573 ) ) ( OBJ-AT ?auto_4572 ?auto_4573 ) ( IN-CITY ?auto_4576 ?auto_4574 ) ( not ( = ?auto_4569 ?auto_4576 ) ) ( OBJ-AT ?auto_4571 ?auto_4576 ) ( IN-CITY ?auto_4577 ?auto_4574 ) ( not ( = ?auto_4569 ?auto_4577 ) ) ( OBJ-AT ?auto_4570 ?auto_4577 ) ( TRUCK-AT ?auto_4575 ?auto_4569 ) ( not ( = ?auto_4570 ?auto_4571 ) ) ( not ( = ?auto_4576 ?auto_4577 ) ) ( not ( = ?auto_4570 ?auto_4572 ) ) ( not ( = ?auto_4571 ?auto_4572 ) ) ( not ( = ?auto_4573 ?auto_4576 ) ) ( not ( = ?auto_4573 ?auto_4577 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4570 ?auto_4571 ?auto_4569 )
      ( DELIVER-1PKG ?auto_4572 ?auto_4569 )
      ( DELIVER-3PKG-VERIFY ?auto_4570 ?auto_4571 ?auto_4572 ?auto_4569 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5704 - OBJ
      ?auto_5705 - OBJ
      ?auto_5706 - OBJ
      ?auto_5707 - OBJ
      ?auto_5703 - LOCATION
    )
    :vars
    (
      ?auto_5709 - LOCATION
      ?auto_5710 - CITY
      ?auto_5711 - LOCATION
      ?auto_5712 - LOCATION
      ?auto_5708 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5709 ?auto_5710 ) ( IN-CITY ?auto_5703 ?auto_5710 ) ( not ( = ?auto_5703 ?auto_5709 ) ) ( OBJ-AT ?auto_5707 ?auto_5709 ) ( IN-CITY ?auto_5711 ?auto_5710 ) ( not ( = ?auto_5703 ?auto_5711 ) ) ( OBJ-AT ?auto_5706 ?auto_5711 ) ( OBJ-AT ?auto_5705 ?auto_5709 ) ( IN-CITY ?auto_5712 ?auto_5710 ) ( not ( = ?auto_5703 ?auto_5712 ) ) ( OBJ-AT ?auto_5704 ?auto_5712 ) ( TRUCK-AT ?auto_5708 ?auto_5703 ) ( not ( = ?auto_5704 ?auto_5705 ) ) ( not ( = ?auto_5709 ?auto_5712 ) ) ( not ( = ?auto_5704 ?auto_5706 ) ) ( not ( = ?auto_5705 ?auto_5706 ) ) ( not ( = ?auto_5711 ?auto_5709 ) ) ( not ( = ?auto_5711 ?auto_5712 ) ) ( not ( = ?auto_5704 ?auto_5707 ) ) ( not ( = ?auto_5705 ?auto_5707 ) ) ( not ( = ?auto_5706 ?auto_5707 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_5704 ?auto_5705 ?auto_5706 ?auto_5703 )
      ( DELIVER-1PKG ?auto_5707 ?auto_5703 )
      ( DELIVER-4PKG-VERIFY ?auto_5704 ?auto_5705 ?auto_5706 ?auto_5707 ?auto_5703 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5736 - OBJ
      ?auto_5737 - OBJ
      ?auto_5738 - OBJ
      ?auto_5739 - OBJ
      ?auto_5735 - LOCATION
    )
    :vars
    (
      ?auto_5741 - LOCATION
      ?auto_5740 - CITY
      ?auto_5742 - LOCATION
      ?auto_5743 - LOCATION
      ?auto_5744 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5741 ?auto_5740 ) ( IN-CITY ?auto_5735 ?auto_5740 ) ( not ( = ?auto_5735 ?auto_5741 ) ) ( OBJ-AT ?auto_5738 ?auto_5741 ) ( IN-CITY ?auto_5742 ?auto_5740 ) ( not ( = ?auto_5735 ?auto_5742 ) ) ( OBJ-AT ?auto_5739 ?auto_5742 ) ( OBJ-AT ?auto_5737 ?auto_5741 ) ( IN-CITY ?auto_5743 ?auto_5740 ) ( not ( = ?auto_5735 ?auto_5743 ) ) ( OBJ-AT ?auto_5736 ?auto_5743 ) ( TRUCK-AT ?auto_5744 ?auto_5735 ) ( not ( = ?auto_5736 ?auto_5737 ) ) ( not ( = ?auto_5741 ?auto_5743 ) ) ( not ( = ?auto_5736 ?auto_5739 ) ) ( not ( = ?auto_5737 ?auto_5739 ) ) ( not ( = ?auto_5742 ?auto_5741 ) ) ( not ( = ?auto_5742 ?auto_5743 ) ) ( not ( = ?auto_5736 ?auto_5738 ) ) ( not ( = ?auto_5737 ?auto_5738 ) ) ( not ( = ?auto_5739 ?auto_5738 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_5736 ?auto_5737 ?auto_5739 ?auto_5738 ?auto_5735 )
      ( DELIVER-4PKG-VERIFY ?auto_5736 ?auto_5737 ?auto_5738 ?auto_5739 ?auto_5735 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_5768 - OBJ
      ?auto_5769 - OBJ
      ?auto_5770 - OBJ
      ?auto_5771 - OBJ
      ?auto_5767 - LOCATION
    )
    :vars
    (
      ?auto_5773 - LOCATION
      ?auto_5775 - CITY
      ?auto_5776 - LOCATION
      ?auto_5774 - LOCATION
      ?auto_5772 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5773 ?auto_5775 ) ( IN-CITY ?auto_5767 ?auto_5775 ) ( not ( = ?auto_5767 ?auto_5773 ) ) ( OBJ-AT ?auto_5771 ?auto_5773 ) ( IN-CITY ?auto_5776 ?auto_5775 ) ( not ( = ?auto_5767 ?auto_5776 ) ) ( OBJ-AT ?auto_5769 ?auto_5776 ) ( OBJ-AT ?auto_5770 ?auto_5773 ) ( IN-CITY ?auto_5774 ?auto_5775 ) ( not ( = ?auto_5767 ?auto_5774 ) ) ( OBJ-AT ?auto_5768 ?auto_5774 ) ( TRUCK-AT ?auto_5772 ?auto_5767 ) ( not ( = ?auto_5768 ?auto_5770 ) ) ( not ( = ?auto_5773 ?auto_5774 ) ) ( not ( = ?auto_5768 ?auto_5769 ) ) ( not ( = ?auto_5770 ?auto_5769 ) ) ( not ( = ?auto_5776 ?auto_5773 ) ) ( not ( = ?auto_5776 ?auto_5774 ) ) ( not ( = ?auto_5768 ?auto_5771 ) ) ( not ( = ?auto_5770 ?auto_5771 ) ) ( not ( = ?auto_5769 ?auto_5771 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_5768 ?auto_5770 ?auto_5771 ?auto_5769 ?auto_5767 )
      ( DELIVER-4PKG-VERIFY ?auto_5768 ?auto_5769 ?auto_5770 ?auto_5771 ?auto_5767 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6017 - OBJ
      ?auto_6018 - OBJ
      ?auto_6019 - OBJ
      ?auto_6020 - OBJ
      ?auto_6016 - LOCATION
    )
    :vars
    (
      ?auto_6022 - LOCATION
      ?auto_6024 - CITY
      ?auto_6025 - LOCATION
      ?auto_6023 - LOCATION
      ?auto_6021 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6022 ?auto_6024 ) ( IN-CITY ?auto_6016 ?auto_6024 ) ( not ( = ?auto_6016 ?auto_6022 ) ) ( OBJ-AT ?auto_6020 ?auto_6022 ) ( IN-CITY ?auto_6025 ?auto_6024 ) ( not ( = ?auto_6016 ?auto_6025 ) ) ( OBJ-AT ?auto_6019 ?auto_6025 ) ( OBJ-AT ?auto_6017 ?auto_6022 ) ( IN-CITY ?auto_6023 ?auto_6024 ) ( not ( = ?auto_6016 ?auto_6023 ) ) ( OBJ-AT ?auto_6018 ?auto_6023 ) ( TRUCK-AT ?auto_6021 ?auto_6016 ) ( not ( = ?auto_6018 ?auto_6017 ) ) ( not ( = ?auto_6022 ?auto_6023 ) ) ( not ( = ?auto_6018 ?auto_6019 ) ) ( not ( = ?auto_6017 ?auto_6019 ) ) ( not ( = ?auto_6025 ?auto_6022 ) ) ( not ( = ?auto_6025 ?auto_6023 ) ) ( not ( = ?auto_6018 ?auto_6020 ) ) ( not ( = ?auto_6017 ?auto_6020 ) ) ( not ( = ?auto_6019 ?auto_6020 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6018 ?auto_6017 ?auto_6020 ?auto_6019 ?auto_6016 )
      ( DELIVER-4PKG-VERIFY ?auto_6017 ?auto_6018 ?auto_6019 ?auto_6020 ?auto_6016 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6049 - OBJ
      ?auto_6050 - OBJ
      ?auto_6051 - OBJ
      ?auto_6052 - OBJ
      ?auto_6048 - LOCATION
    )
    :vars
    (
      ?auto_6054 - LOCATION
      ?auto_6056 - CITY
      ?auto_6057 - LOCATION
      ?auto_6055 - LOCATION
      ?auto_6053 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6054 ?auto_6056 ) ( IN-CITY ?auto_6048 ?auto_6056 ) ( not ( = ?auto_6048 ?auto_6054 ) ) ( OBJ-AT ?auto_6051 ?auto_6054 ) ( IN-CITY ?auto_6057 ?auto_6056 ) ( not ( = ?auto_6048 ?auto_6057 ) ) ( OBJ-AT ?auto_6052 ?auto_6057 ) ( OBJ-AT ?auto_6049 ?auto_6054 ) ( IN-CITY ?auto_6055 ?auto_6056 ) ( not ( = ?auto_6048 ?auto_6055 ) ) ( OBJ-AT ?auto_6050 ?auto_6055 ) ( TRUCK-AT ?auto_6053 ?auto_6048 ) ( not ( = ?auto_6050 ?auto_6049 ) ) ( not ( = ?auto_6054 ?auto_6055 ) ) ( not ( = ?auto_6050 ?auto_6052 ) ) ( not ( = ?auto_6049 ?auto_6052 ) ) ( not ( = ?auto_6057 ?auto_6054 ) ) ( not ( = ?auto_6057 ?auto_6055 ) ) ( not ( = ?auto_6050 ?auto_6051 ) ) ( not ( = ?auto_6049 ?auto_6051 ) ) ( not ( = ?auto_6052 ?auto_6051 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6050 ?auto_6049 ?auto_6051 ?auto_6052 ?auto_6048 )
      ( DELIVER-4PKG-VERIFY ?auto_6049 ?auto_6050 ?auto_6051 ?auto_6052 ?auto_6048 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_6237 - OBJ
      ?auto_6238 - OBJ
      ?auto_6239 - OBJ
      ?auto_6240 - OBJ
      ?auto_6236 - LOCATION
    )
    :vars
    (
      ?auto_6242 - LOCATION
      ?auto_6244 - CITY
      ?auto_6245 - LOCATION
      ?auto_6243 - LOCATION
      ?auto_6241 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6242 ?auto_6244 ) ( IN-CITY ?auto_6236 ?auto_6244 ) ( not ( = ?auto_6236 ?auto_6242 ) ) ( OBJ-AT ?auto_6238 ?auto_6242 ) ( IN-CITY ?auto_6245 ?auto_6244 ) ( not ( = ?auto_6236 ?auto_6245 ) ) ( OBJ-AT ?auto_6240 ?auto_6245 ) ( OBJ-AT ?auto_6237 ?auto_6242 ) ( IN-CITY ?auto_6243 ?auto_6244 ) ( not ( = ?auto_6236 ?auto_6243 ) ) ( OBJ-AT ?auto_6239 ?auto_6243 ) ( TRUCK-AT ?auto_6241 ?auto_6236 ) ( not ( = ?auto_6239 ?auto_6237 ) ) ( not ( = ?auto_6242 ?auto_6243 ) ) ( not ( = ?auto_6239 ?auto_6240 ) ) ( not ( = ?auto_6237 ?auto_6240 ) ) ( not ( = ?auto_6245 ?auto_6242 ) ) ( not ( = ?auto_6245 ?auto_6243 ) ) ( not ( = ?auto_6239 ?auto_6238 ) ) ( not ( = ?auto_6237 ?auto_6238 ) ) ( not ( = ?auto_6240 ?auto_6238 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_6239 ?auto_6237 ?auto_6238 ?auto_6240 ?auto_6236 )
      ( DELIVER-4PKG-VERIFY ?auto_6237 ?auto_6238 ?auto_6239 ?auto_6240 ?auto_6236 ) )
  )

)

