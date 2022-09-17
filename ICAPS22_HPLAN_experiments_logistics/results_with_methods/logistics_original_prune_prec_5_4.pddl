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
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
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
      ?auto_2940894 - OBJ
      ?auto_2940895 - LOCATION
    )
    :vars
    (
      ?auto_2940896 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2940896 ?auto_2940895 ) ( IN-TRUCK ?auto_2940894 ?auto_2940896 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2940894 ?auto_2940896 ?auto_2940895 )
      ( DELIVER-1PKG-VERIFY ?auto_2940894 ?auto_2940895 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2940919 - OBJ
      ?auto_2940920 - LOCATION
    )
    :vars
    (
      ?auto_2940921 - TRUCK
      ?auto_2940922 - LOCATION
      ?auto_2940923 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2940919 ?auto_2940921 ) ( TRUCK-AT ?auto_2940921 ?auto_2940922 ) ( IN-CITY ?auto_2940922 ?auto_2940923 ) ( IN-CITY ?auto_2940920 ?auto_2940923 ) ( not ( = ?auto_2940920 ?auto_2940922 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2940921 ?auto_2940922 ?auto_2940920 ?auto_2940923 )
      ( DELIVER-1PKG ?auto_2940919 ?auto_2940920 )
      ( DELIVER-1PKG-VERIFY ?auto_2940919 ?auto_2940920 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2940954 - OBJ
      ?auto_2940955 - LOCATION
    )
    :vars
    (
      ?auto_2940957 - TRUCK
      ?auto_2940958 - LOCATION
      ?auto_2940956 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2940957 ?auto_2940958 ) ( IN-CITY ?auto_2940958 ?auto_2940956 ) ( IN-CITY ?auto_2940955 ?auto_2940956 ) ( not ( = ?auto_2940955 ?auto_2940958 ) ) ( OBJ-AT ?auto_2940954 ?auto_2940958 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2940954 ?auto_2940957 ?auto_2940958 )
      ( DELIVER-1PKG ?auto_2940954 ?auto_2940955 )
      ( DELIVER-1PKG-VERIFY ?auto_2940954 ?auto_2940955 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2940989 - OBJ
      ?auto_2940990 - LOCATION
    )
    :vars
    (
      ?auto_2940991 - LOCATION
      ?auto_2940992 - CITY
      ?auto_2940993 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2940991 ?auto_2940992 ) ( IN-CITY ?auto_2940990 ?auto_2940992 ) ( not ( = ?auto_2940990 ?auto_2940991 ) ) ( OBJ-AT ?auto_2940989 ?auto_2940991 ) ( TRUCK-AT ?auto_2940993 ?auto_2940990 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2940993 ?auto_2940990 ?auto_2940991 ?auto_2940992 )
      ( DELIVER-1PKG ?auto_2940989 ?auto_2940990 )
      ( DELIVER-1PKG-VERIFY ?auto_2940989 ?auto_2940990 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2941327 - OBJ
      ?auto_2941329 - OBJ
      ?auto_2941328 - LOCATION
    )
    :vars
    (
      ?auto_2941330 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2941329 ?auto_2941327 ) ( TRUCK-AT ?auto_2941330 ?auto_2941328 ) ( IN-TRUCK ?auto_2941329 ?auto_2941330 ) ( OBJ-AT ?auto_2941327 ?auto_2941328 ) ( not ( = ?auto_2941327 ?auto_2941329 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2941329 ?auto_2941328 )
      ( DELIVER-2PKG-VERIFY ?auto_2941327 ?auto_2941329 ?auto_2941328 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2941686 - OBJ
      ?auto_2941688 - OBJ
      ?auto_2941687 - LOCATION
    )
    :vars
    (
      ?auto_2941691 - TRUCK
      ?auto_2941690 - LOCATION
      ?auto_2941689 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2941688 ?auto_2941686 ) ( IN-TRUCK ?auto_2941688 ?auto_2941691 ) ( TRUCK-AT ?auto_2941691 ?auto_2941690 ) ( IN-CITY ?auto_2941690 ?auto_2941689 ) ( IN-CITY ?auto_2941687 ?auto_2941689 ) ( not ( = ?auto_2941687 ?auto_2941690 ) ) ( OBJ-AT ?auto_2941686 ?auto_2941687 ) ( not ( = ?auto_2941686 ?auto_2941688 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2941688 ?auto_2941687 )
      ( DELIVER-2PKG-VERIFY ?auto_2941686 ?auto_2941688 ?auto_2941687 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2942156 - OBJ
      ?auto_2942157 - LOCATION
    )
    :vars
    (
      ?auto_2942158 - OBJ
      ?auto_2942159 - TRUCK
      ?auto_2942160 - LOCATION
      ?auto_2942161 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2942156 ?auto_2942158 ) ( TRUCK-AT ?auto_2942159 ?auto_2942160 ) ( IN-CITY ?auto_2942160 ?auto_2942161 ) ( IN-CITY ?auto_2942157 ?auto_2942161 ) ( not ( = ?auto_2942157 ?auto_2942160 ) ) ( OBJ-AT ?auto_2942158 ?auto_2942157 ) ( not ( = ?auto_2942158 ?auto_2942156 ) ) ( OBJ-AT ?auto_2942156 ?auto_2942160 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2942156 ?auto_2942159 ?auto_2942160 )
      ( DELIVER-2PKG ?auto_2942158 ?auto_2942156 ?auto_2942157 )
      ( DELIVER-1PKG-VERIFY ?auto_2942156 ?auto_2942157 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2942162 - OBJ
      ?auto_2942164 - OBJ
      ?auto_2942163 - LOCATION
    )
    :vars
    (
      ?auto_2942165 - TRUCK
      ?auto_2942166 - LOCATION
      ?auto_2942167 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2942164 ?auto_2942162 ) ( TRUCK-AT ?auto_2942165 ?auto_2942166 ) ( IN-CITY ?auto_2942166 ?auto_2942167 ) ( IN-CITY ?auto_2942163 ?auto_2942167 ) ( not ( = ?auto_2942163 ?auto_2942166 ) ) ( OBJ-AT ?auto_2942162 ?auto_2942163 ) ( not ( = ?auto_2942162 ?auto_2942164 ) ) ( OBJ-AT ?auto_2942164 ?auto_2942166 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2942164 ?auto_2942163 )
      ( DELIVER-2PKG-VERIFY ?auto_2942162 ?auto_2942164 ?auto_2942163 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2942632 - OBJ
      ?auto_2942633 - LOCATION
    )
    :vars
    (
      ?auto_2942635 - OBJ
      ?auto_2942636 - LOCATION
      ?auto_2942637 - CITY
      ?auto_2942634 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2942632 ?auto_2942635 ) ( IN-CITY ?auto_2942636 ?auto_2942637 ) ( IN-CITY ?auto_2942633 ?auto_2942637 ) ( not ( = ?auto_2942633 ?auto_2942636 ) ) ( OBJ-AT ?auto_2942635 ?auto_2942633 ) ( not ( = ?auto_2942635 ?auto_2942632 ) ) ( OBJ-AT ?auto_2942632 ?auto_2942636 ) ( TRUCK-AT ?auto_2942634 ?auto_2942633 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2942634 ?auto_2942633 ?auto_2942636 ?auto_2942637 )
      ( DELIVER-2PKG ?auto_2942635 ?auto_2942632 ?auto_2942633 )
      ( DELIVER-1PKG-VERIFY ?auto_2942632 ?auto_2942633 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2942638 - OBJ
      ?auto_2942640 - OBJ
      ?auto_2942639 - LOCATION
    )
    :vars
    (
      ?auto_2942641 - LOCATION
      ?auto_2942642 - CITY
      ?auto_2942643 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2942640 ?auto_2942638 ) ( IN-CITY ?auto_2942641 ?auto_2942642 ) ( IN-CITY ?auto_2942639 ?auto_2942642 ) ( not ( = ?auto_2942639 ?auto_2942641 ) ) ( OBJ-AT ?auto_2942638 ?auto_2942639 ) ( not ( = ?auto_2942638 ?auto_2942640 ) ) ( OBJ-AT ?auto_2942640 ?auto_2942641 ) ( TRUCK-AT ?auto_2942643 ?auto_2942639 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2942640 ?auto_2942639 )
      ( DELIVER-2PKG-VERIFY ?auto_2942638 ?auto_2942640 ?auto_2942639 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2943108 - OBJ
      ?auto_2943109 - LOCATION
    )
    :vars
    (
      ?auto_2943113 - OBJ
      ?auto_2943112 - LOCATION
      ?auto_2943111 - CITY
      ?auto_2943110 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2943108 ?auto_2943113 ) ( IN-CITY ?auto_2943112 ?auto_2943111 ) ( IN-CITY ?auto_2943109 ?auto_2943111 ) ( not ( = ?auto_2943109 ?auto_2943112 ) ) ( not ( = ?auto_2943113 ?auto_2943108 ) ) ( OBJ-AT ?auto_2943108 ?auto_2943112 ) ( TRUCK-AT ?auto_2943110 ?auto_2943109 ) ( IN-TRUCK ?auto_2943113 ?auto_2943110 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2943113 ?auto_2943109 )
      ( DELIVER-2PKG ?auto_2943113 ?auto_2943108 ?auto_2943109 )
      ( DELIVER-1PKG-VERIFY ?auto_2943108 ?auto_2943109 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2943114 - OBJ
      ?auto_2943116 - OBJ
      ?auto_2943115 - LOCATION
    )
    :vars
    (
      ?auto_2943117 - LOCATION
      ?auto_2943118 - CITY
      ?auto_2943119 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2943116 ?auto_2943114 ) ( IN-CITY ?auto_2943117 ?auto_2943118 ) ( IN-CITY ?auto_2943115 ?auto_2943118 ) ( not ( = ?auto_2943115 ?auto_2943117 ) ) ( not ( = ?auto_2943114 ?auto_2943116 ) ) ( OBJ-AT ?auto_2943116 ?auto_2943117 ) ( TRUCK-AT ?auto_2943119 ?auto_2943115 ) ( IN-TRUCK ?auto_2943114 ?auto_2943119 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2943116 ?auto_2943115 )
      ( DELIVER-2PKG-VERIFY ?auto_2943114 ?auto_2943116 ?auto_2943115 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2943584 - OBJ
      ?auto_2943585 - LOCATION
    )
    :vars
    (
      ?auto_2943589 - OBJ
      ?auto_2943586 - LOCATION
      ?auto_2943587 - CITY
      ?auto_2943588 - TRUCK
      ?auto_2943590 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2943584 ?auto_2943589 ) ( IN-CITY ?auto_2943586 ?auto_2943587 ) ( IN-CITY ?auto_2943585 ?auto_2943587 ) ( not ( = ?auto_2943585 ?auto_2943586 ) ) ( not ( = ?auto_2943589 ?auto_2943584 ) ) ( OBJ-AT ?auto_2943584 ?auto_2943586 ) ( IN-TRUCK ?auto_2943589 ?auto_2943588 ) ( TRUCK-AT ?auto_2943588 ?auto_2943590 ) ( IN-CITY ?auto_2943590 ?auto_2943587 ) ( not ( = ?auto_2943585 ?auto_2943590 ) ) ( not ( = ?auto_2943586 ?auto_2943590 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2943588 ?auto_2943590 ?auto_2943585 ?auto_2943587 )
      ( DELIVER-2PKG ?auto_2943589 ?auto_2943584 ?auto_2943585 )
      ( DELIVER-1PKG-VERIFY ?auto_2943584 ?auto_2943585 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2943591 - OBJ
      ?auto_2943593 - OBJ
      ?auto_2943592 - LOCATION
    )
    :vars
    (
      ?auto_2943597 - LOCATION
      ?auto_2943595 - CITY
      ?auto_2943596 - TRUCK
      ?auto_2943594 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2943593 ?auto_2943591 ) ( IN-CITY ?auto_2943597 ?auto_2943595 ) ( IN-CITY ?auto_2943592 ?auto_2943595 ) ( not ( = ?auto_2943592 ?auto_2943597 ) ) ( not ( = ?auto_2943591 ?auto_2943593 ) ) ( OBJ-AT ?auto_2943593 ?auto_2943597 ) ( IN-TRUCK ?auto_2943591 ?auto_2943596 ) ( TRUCK-AT ?auto_2943596 ?auto_2943594 ) ( IN-CITY ?auto_2943594 ?auto_2943595 ) ( not ( = ?auto_2943592 ?auto_2943594 ) ) ( not ( = ?auto_2943597 ?auto_2943594 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2943593 ?auto_2943592 )
      ( DELIVER-2PKG-VERIFY ?auto_2943591 ?auto_2943593 ?auto_2943592 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2944117 - OBJ
      ?auto_2944118 - LOCATION
    )
    :vars
    (
      ?auto_2944123 - OBJ
      ?auto_2944120 - LOCATION
      ?auto_2944122 - CITY
      ?auto_2944119 - TRUCK
      ?auto_2944121 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2944117 ?auto_2944123 ) ( IN-CITY ?auto_2944120 ?auto_2944122 ) ( IN-CITY ?auto_2944118 ?auto_2944122 ) ( not ( = ?auto_2944118 ?auto_2944120 ) ) ( not ( = ?auto_2944123 ?auto_2944117 ) ) ( OBJ-AT ?auto_2944117 ?auto_2944120 ) ( TRUCK-AT ?auto_2944119 ?auto_2944121 ) ( IN-CITY ?auto_2944121 ?auto_2944122 ) ( not ( = ?auto_2944118 ?auto_2944121 ) ) ( not ( = ?auto_2944120 ?auto_2944121 ) ) ( OBJ-AT ?auto_2944123 ?auto_2944121 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2944123 ?auto_2944119 ?auto_2944121 )
      ( DELIVER-2PKG ?auto_2944123 ?auto_2944117 ?auto_2944118 )
      ( DELIVER-1PKG-VERIFY ?auto_2944117 ?auto_2944118 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2944124 - OBJ
      ?auto_2944126 - OBJ
      ?auto_2944125 - LOCATION
    )
    :vars
    (
      ?auto_2944130 - LOCATION
      ?auto_2944127 - CITY
      ?auto_2944128 - TRUCK
      ?auto_2944129 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2944126 ?auto_2944124 ) ( IN-CITY ?auto_2944130 ?auto_2944127 ) ( IN-CITY ?auto_2944125 ?auto_2944127 ) ( not ( = ?auto_2944125 ?auto_2944130 ) ) ( not ( = ?auto_2944124 ?auto_2944126 ) ) ( OBJ-AT ?auto_2944126 ?auto_2944130 ) ( TRUCK-AT ?auto_2944128 ?auto_2944129 ) ( IN-CITY ?auto_2944129 ?auto_2944127 ) ( not ( = ?auto_2944125 ?auto_2944129 ) ) ( not ( = ?auto_2944130 ?auto_2944129 ) ) ( OBJ-AT ?auto_2944124 ?auto_2944129 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2944126 ?auto_2944125 )
      ( DELIVER-2PKG-VERIFY ?auto_2944124 ?auto_2944126 ?auto_2944125 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2946829 - OBJ
      ?auto_2946831 - OBJ
      ?auto_2946832 - OBJ
      ?auto_2946830 - LOCATION
    )
    :vars
    (
      ?auto_2946833 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2946831 ?auto_2946829 ) ( GREATER-THAN ?auto_2946832 ?auto_2946829 ) ( GREATER-THAN ?auto_2946832 ?auto_2946831 ) ( TRUCK-AT ?auto_2946833 ?auto_2946830 ) ( IN-TRUCK ?auto_2946832 ?auto_2946833 ) ( OBJ-AT ?auto_2946829 ?auto_2946830 ) ( OBJ-AT ?auto_2946831 ?auto_2946830 ) ( not ( = ?auto_2946829 ?auto_2946831 ) ) ( not ( = ?auto_2946829 ?auto_2946832 ) ) ( not ( = ?auto_2946831 ?auto_2946832 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2946832 ?auto_2946830 )
      ( DELIVER-3PKG-VERIFY ?auto_2946829 ?auto_2946831 ?auto_2946832 ?auto_2946830 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2948827 - OBJ
      ?auto_2948829 - OBJ
      ?auto_2948830 - OBJ
      ?auto_2948828 - LOCATION
    )
    :vars
    (
      ?auto_2948832 - TRUCK
      ?auto_2948833 - LOCATION
      ?auto_2948831 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2948829 ?auto_2948827 ) ( GREATER-THAN ?auto_2948830 ?auto_2948827 ) ( GREATER-THAN ?auto_2948830 ?auto_2948829 ) ( IN-TRUCK ?auto_2948830 ?auto_2948832 ) ( TRUCK-AT ?auto_2948832 ?auto_2948833 ) ( IN-CITY ?auto_2948833 ?auto_2948831 ) ( IN-CITY ?auto_2948828 ?auto_2948831 ) ( not ( = ?auto_2948828 ?auto_2948833 ) ) ( OBJ-AT ?auto_2948827 ?auto_2948828 ) ( not ( = ?auto_2948827 ?auto_2948830 ) ) ( OBJ-AT ?auto_2948829 ?auto_2948828 ) ( not ( = ?auto_2948827 ?auto_2948829 ) ) ( not ( = ?auto_2948829 ?auto_2948830 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2948827 ?auto_2948830 ?auto_2948828 )
      ( DELIVER-3PKG-VERIFY ?auto_2948827 ?auto_2948829 ?auto_2948830 ?auto_2948828 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2951467 - OBJ
      ?auto_2951469 - OBJ
      ?auto_2951470 - OBJ
      ?auto_2951468 - LOCATION
    )
    :vars
    (
      ?auto_2951472 - TRUCK
      ?auto_2951471 - LOCATION
      ?auto_2951473 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2951469 ?auto_2951467 ) ( GREATER-THAN ?auto_2951470 ?auto_2951467 ) ( GREATER-THAN ?auto_2951470 ?auto_2951469 ) ( TRUCK-AT ?auto_2951472 ?auto_2951471 ) ( IN-CITY ?auto_2951471 ?auto_2951473 ) ( IN-CITY ?auto_2951468 ?auto_2951473 ) ( not ( = ?auto_2951468 ?auto_2951471 ) ) ( OBJ-AT ?auto_2951467 ?auto_2951468 ) ( not ( = ?auto_2951467 ?auto_2951470 ) ) ( OBJ-AT ?auto_2951470 ?auto_2951471 ) ( OBJ-AT ?auto_2951469 ?auto_2951468 ) ( not ( = ?auto_2951467 ?auto_2951469 ) ) ( not ( = ?auto_2951469 ?auto_2951470 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2951467 ?auto_2951470 ?auto_2951468 )
      ( DELIVER-3PKG-VERIFY ?auto_2951467 ?auto_2951469 ?auto_2951470 ?auto_2951468 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2954107 - OBJ
      ?auto_2954109 - OBJ
      ?auto_2954110 - OBJ
      ?auto_2954108 - LOCATION
    )
    :vars
    (
      ?auto_2954113 - LOCATION
      ?auto_2954111 - CITY
      ?auto_2954112 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2954109 ?auto_2954107 ) ( GREATER-THAN ?auto_2954110 ?auto_2954107 ) ( GREATER-THAN ?auto_2954110 ?auto_2954109 ) ( IN-CITY ?auto_2954113 ?auto_2954111 ) ( IN-CITY ?auto_2954108 ?auto_2954111 ) ( not ( = ?auto_2954108 ?auto_2954113 ) ) ( OBJ-AT ?auto_2954107 ?auto_2954108 ) ( not ( = ?auto_2954107 ?auto_2954110 ) ) ( OBJ-AT ?auto_2954110 ?auto_2954113 ) ( TRUCK-AT ?auto_2954112 ?auto_2954108 ) ( OBJ-AT ?auto_2954109 ?auto_2954108 ) ( not ( = ?auto_2954107 ?auto_2954109 ) ) ( not ( = ?auto_2954109 ?auto_2954110 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2954107 ?auto_2954110 ?auto_2954108 )
      ( DELIVER-3PKG-VERIFY ?auto_2954107 ?auto_2954109 ?auto_2954110 ?auto_2954108 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2959342 - OBJ
      ?auto_2959343 - LOCATION
    )
    :vars
    (
      ?auto_2959345 - OBJ
      ?auto_2959344 - LOCATION
      ?auto_2959347 - CITY
      ?auto_2959346 - TRUCK
      ?auto_2959348 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2959342 ?auto_2959345 ) ( IN-CITY ?auto_2959344 ?auto_2959347 ) ( IN-CITY ?auto_2959343 ?auto_2959347 ) ( not ( = ?auto_2959343 ?auto_2959344 ) ) ( OBJ-AT ?auto_2959345 ?auto_2959343 ) ( not ( = ?auto_2959345 ?auto_2959342 ) ) ( OBJ-AT ?auto_2959342 ?auto_2959344 ) ( TRUCK-AT ?auto_2959346 ?auto_2959348 ) ( IN-CITY ?auto_2959348 ?auto_2959347 ) ( not ( = ?auto_2959343 ?auto_2959348 ) ) ( not ( = ?auto_2959344 ?auto_2959348 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2959346 ?auto_2959348 ?auto_2959343 ?auto_2959347 )
      ( DELIVER-2PKG ?auto_2959345 ?auto_2959342 ?auto_2959343 )
      ( DELIVER-1PKG-VERIFY ?auto_2959342 ?auto_2959343 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2959349 - OBJ
      ?auto_2959351 - OBJ
      ?auto_2959350 - LOCATION
    )
    :vars
    (
      ?auto_2959352 - LOCATION
      ?auto_2959353 - CITY
      ?auto_2959354 - TRUCK
      ?auto_2959355 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2959351 ?auto_2959349 ) ( IN-CITY ?auto_2959352 ?auto_2959353 ) ( IN-CITY ?auto_2959350 ?auto_2959353 ) ( not ( = ?auto_2959350 ?auto_2959352 ) ) ( OBJ-AT ?auto_2959349 ?auto_2959350 ) ( not ( = ?auto_2959349 ?auto_2959351 ) ) ( OBJ-AT ?auto_2959351 ?auto_2959352 ) ( TRUCK-AT ?auto_2959354 ?auto_2959355 ) ( IN-CITY ?auto_2959355 ?auto_2959353 ) ( not ( = ?auto_2959350 ?auto_2959355 ) ) ( not ( = ?auto_2959352 ?auto_2959355 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2959351 ?auto_2959350 )
      ( DELIVER-2PKG-VERIFY ?auto_2959349 ?auto_2959351 ?auto_2959350 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2984951 - OBJ
      ?auto_2984953 - OBJ
      ?auto_2984954 - OBJ
      ?auto_2984955 - OBJ
      ?auto_2984952 - LOCATION
    )
    :vars
    (
      ?auto_2984956 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2984953 ?auto_2984951 ) ( GREATER-THAN ?auto_2984954 ?auto_2984951 ) ( GREATER-THAN ?auto_2984954 ?auto_2984953 ) ( GREATER-THAN ?auto_2984955 ?auto_2984951 ) ( GREATER-THAN ?auto_2984955 ?auto_2984953 ) ( GREATER-THAN ?auto_2984955 ?auto_2984954 ) ( TRUCK-AT ?auto_2984956 ?auto_2984952 ) ( IN-TRUCK ?auto_2984955 ?auto_2984956 ) ( OBJ-AT ?auto_2984951 ?auto_2984952 ) ( OBJ-AT ?auto_2984953 ?auto_2984952 ) ( OBJ-AT ?auto_2984954 ?auto_2984952 ) ( not ( = ?auto_2984951 ?auto_2984953 ) ) ( not ( = ?auto_2984951 ?auto_2984954 ) ) ( not ( = ?auto_2984951 ?auto_2984955 ) ) ( not ( = ?auto_2984953 ?auto_2984954 ) ) ( not ( = ?auto_2984953 ?auto_2984955 ) ) ( not ( = ?auto_2984954 ?auto_2984955 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2984955 ?auto_2984952 )
      ( DELIVER-4PKG-VERIFY ?auto_2984951 ?auto_2984953 ?auto_2984954 ?auto_2984955 ?auto_2984952 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2991801 - OBJ
      ?auto_2991803 - OBJ
      ?auto_2991804 - OBJ
      ?auto_2991805 - OBJ
      ?auto_2991802 - LOCATION
    )
    :vars
    (
      ?auto_2991808 - TRUCK
      ?auto_2991806 - LOCATION
      ?auto_2991807 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2991803 ?auto_2991801 ) ( GREATER-THAN ?auto_2991804 ?auto_2991801 ) ( GREATER-THAN ?auto_2991804 ?auto_2991803 ) ( GREATER-THAN ?auto_2991805 ?auto_2991801 ) ( GREATER-THAN ?auto_2991805 ?auto_2991803 ) ( GREATER-THAN ?auto_2991805 ?auto_2991804 ) ( IN-TRUCK ?auto_2991805 ?auto_2991808 ) ( TRUCK-AT ?auto_2991808 ?auto_2991806 ) ( IN-CITY ?auto_2991806 ?auto_2991807 ) ( IN-CITY ?auto_2991802 ?auto_2991807 ) ( not ( = ?auto_2991802 ?auto_2991806 ) ) ( OBJ-AT ?auto_2991801 ?auto_2991802 ) ( not ( = ?auto_2991801 ?auto_2991805 ) ) ( OBJ-AT ?auto_2991803 ?auto_2991802 ) ( OBJ-AT ?auto_2991804 ?auto_2991802 ) ( not ( = ?auto_2991801 ?auto_2991803 ) ) ( not ( = ?auto_2991801 ?auto_2991804 ) ) ( not ( = ?auto_2991803 ?auto_2991804 ) ) ( not ( = ?auto_2991803 ?auto_2991805 ) ) ( not ( = ?auto_2991804 ?auto_2991805 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2991801 ?auto_2991805 ?auto_2991802 )
      ( DELIVER-4PKG-VERIFY ?auto_2991801 ?auto_2991803 ?auto_2991804 ?auto_2991805 ?auto_2991802 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3000822 - OBJ
      ?auto_3000824 - OBJ
      ?auto_3000825 - OBJ
      ?auto_3000826 - OBJ
      ?auto_3000823 - LOCATION
    )
    :vars
    (
      ?auto_3000827 - TRUCK
      ?auto_3000829 - LOCATION
      ?auto_3000828 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3000824 ?auto_3000822 ) ( GREATER-THAN ?auto_3000825 ?auto_3000822 ) ( GREATER-THAN ?auto_3000825 ?auto_3000824 ) ( GREATER-THAN ?auto_3000826 ?auto_3000822 ) ( GREATER-THAN ?auto_3000826 ?auto_3000824 ) ( GREATER-THAN ?auto_3000826 ?auto_3000825 ) ( TRUCK-AT ?auto_3000827 ?auto_3000829 ) ( IN-CITY ?auto_3000829 ?auto_3000828 ) ( IN-CITY ?auto_3000823 ?auto_3000828 ) ( not ( = ?auto_3000823 ?auto_3000829 ) ) ( OBJ-AT ?auto_3000822 ?auto_3000823 ) ( not ( = ?auto_3000822 ?auto_3000826 ) ) ( OBJ-AT ?auto_3000826 ?auto_3000829 ) ( OBJ-AT ?auto_3000824 ?auto_3000823 ) ( OBJ-AT ?auto_3000825 ?auto_3000823 ) ( not ( = ?auto_3000822 ?auto_3000824 ) ) ( not ( = ?auto_3000822 ?auto_3000825 ) ) ( not ( = ?auto_3000824 ?auto_3000825 ) ) ( not ( = ?auto_3000824 ?auto_3000826 ) ) ( not ( = ?auto_3000825 ?auto_3000826 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3000822 ?auto_3000826 ?auto_3000823 )
      ( DELIVER-4PKG-VERIFY ?auto_3000822 ?auto_3000824 ?auto_3000825 ?auto_3000826 ?auto_3000823 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3009843 - OBJ
      ?auto_3009845 - OBJ
      ?auto_3009846 - OBJ
      ?auto_3009847 - OBJ
      ?auto_3009844 - LOCATION
    )
    :vars
    (
      ?auto_3009849 - LOCATION
      ?auto_3009848 - CITY
      ?auto_3009850 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3009845 ?auto_3009843 ) ( GREATER-THAN ?auto_3009846 ?auto_3009843 ) ( GREATER-THAN ?auto_3009846 ?auto_3009845 ) ( GREATER-THAN ?auto_3009847 ?auto_3009843 ) ( GREATER-THAN ?auto_3009847 ?auto_3009845 ) ( GREATER-THAN ?auto_3009847 ?auto_3009846 ) ( IN-CITY ?auto_3009849 ?auto_3009848 ) ( IN-CITY ?auto_3009844 ?auto_3009848 ) ( not ( = ?auto_3009844 ?auto_3009849 ) ) ( OBJ-AT ?auto_3009843 ?auto_3009844 ) ( not ( = ?auto_3009843 ?auto_3009847 ) ) ( OBJ-AT ?auto_3009847 ?auto_3009849 ) ( TRUCK-AT ?auto_3009850 ?auto_3009844 ) ( OBJ-AT ?auto_3009845 ?auto_3009844 ) ( OBJ-AT ?auto_3009846 ?auto_3009844 ) ( not ( = ?auto_3009843 ?auto_3009845 ) ) ( not ( = ?auto_3009843 ?auto_3009846 ) ) ( not ( = ?auto_3009845 ?auto_3009846 ) ) ( not ( = ?auto_3009845 ?auto_3009847 ) ) ( not ( = ?auto_3009846 ?auto_3009847 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3009843 ?auto_3009847 ?auto_3009844 )
      ( DELIVER-4PKG-VERIFY ?auto_3009843 ?auto_3009845 ?auto_3009846 ?auto_3009847 ?auto_3009844 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3027562 - OBJ
      ?auto_3027564 - OBJ
      ?auto_3027565 - OBJ
      ?auto_3027563 - LOCATION
    )
    :vars
    (
      ?auto_3027568 - LOCATION
      ?auto_3027567 - CITY
      ?auto_3027569 - TRUCK
      ?auto_3027566 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3027564 ?auto_3027562 ) ( GREATER-THAN ?auto_3027565 ?auto_3027562 ) ( GREATER-THAN ?auto_3027565 ?auto_3027564 ) ( IN-CITY ?auto_3027568 ?auto_3027567 ) ( IN-CITY ?auto_3027563 ?auto_3027567 ) ( not ( = ?auto_3027563 ?auto_3027568 ) ) ( OBJ-AT ?auto_3027562 ?auto_3027563 ) ( not ( = ?auto_3027562 ?auto_3027565 ) ) ( OBJ-AT ?auto_3027565 ?auto_3027568 ) ( TRUCK-AT ?auto_3027569 ?auto_3027566 ) ( IN-CITY ?auto_3027566 ?auto_3027567 ) ( not ( = ?auto_3027563 ?auto_3027566 ) ) ( not ( = ?auto_3027568 ?auto_3027566 ) ) ( OBJ-AT ?auto_3027564 ?auto_3027563 ) ( not ( = ?auto_3027562 ?auto_3027564 ) ) ( not ( = ?auto_3027564 ?auto_3027565 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3027562 ?auto_3027565 ?auto_3027563 )
      ( DELIVER-3PKG-VERIFY ?auto_3027562 ?auto_3027564 ?auto_3027565 ?auto_3027563 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3150347 - OBJ
      ?auto_3150349 - OBJ
      ?auto_3150350 - OBJ
      ?auto_3150351 - OBJ
      ?auto_3150352 - OBJ
      ?auto_3150348 - LOCATION
    )
    :vars
    (
      ?auto_3150353 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3150349 ?auto_3150347 ) ( GREATER-THAN ?auto_3150350 ?auto_3150347 ) ( GREATER-THAN ?auto_3150350 ?auto_3150349 ) ( GREATER-THAN ?auto_3150351 ?auto_3150347 ) ( GREATER-THAN ?auto_3150351 ?auto_3150349 ) ( GREATER-THAN ?auto_3150351 ?auto_3150350 ) ( GREATER-THAN ?auto_3150352 ?auto_3150347 ) ( GREATER-THAN ?auto_3150352 ?auto_3150349 ) ( GREATER-THAN ?auto_3150352 ?auto_3150350 ) ( GREATER-THAN ?auto_3150352 ?auto_3150351 ) ( TRUCK-AT ?auto_3150353 ?auto_3150348 ) ( IN-TRUCK ?auto_3150352 ?auto_3150353 ) ( OBJ-AT ?auto_3150347 ?auto_3150348 ) ( OBJ-AT ?auto_3150349 ?auto_3150348 ) ( OBJ-AT ?auto_3150350 ?auto_3150348 ) ( OBJ-AT ?auto_3150351 ?auto_3150348 ) ( not ( = ?auto_3150347 ?auto_3150349 ) ) ( not ( = ?auto_3150347 ?auto_3150350 ) ) ( not ( = ?auto_3150347 ?auto_3150351 ) ) ( not ( = ?auto_3150347 ?auto_3150352 ) ) ( not ( = ?auto_3150349 ?auto_3150350 ) ) ( not ( = ?auto_3150349 ?auto_3150351 ) ) ( not ( = ?auto_3150349 ?auto_3150352 ) ) ( not ( = ?auto_3150350 ?auto_3150351 ) ) ( not ( = ?auto_3150350 ?auto_3150352 ) ) ( not ( = ?auto_3150351 ?auto_3150352 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3150352 ?auto_3150348 )
      ( DELIVER-5PKG-VERIFY ?auto_3150347 ?auto_3150349 ?auto_3150350 ?auto_3150351 ?auto_3150352 ?auto_3150348 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3168835 - OBJ
      ?auto_3168837 - OBJ
      ?auto_3168838 - OBJ
      ?auto_3168839 - OBJ
      ?auto_3168840 - OBJ
      ?auto_3168836 - LOCATION
    )
    :vars
    (
      ?auto_3168843 - TRUCK
      ?auto_3168841 - LOCATION
      ?auto_3168842 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3168837 ?auto_3168835 ) ( GREATER-THAN ?auto_3168838 ?auto_3168835 ) ( GREATER-THAN ?auto_3168838 ?auto_3168837 ) ( GREATER-THAN ?auto_3168839 ?auto_3168835 ) ( GREATER-THAN ?auto_3168839 ?auto_3168837 ) ( GREATER-THAN ?auto_3168839 ?auto_3168838 ) ( GREATER-THAN ?auto_3168840 ?auto_3168835 ) ( GREATER-THAN ?auto_3168840 ?auto_3168837 ) ( GREATER-THAN ?auto_3168840 ?auto_3168838 ) ( GREATER-THAN ?auto_3168840 ?auto_3168839 ) ( IN-TRUCK ?auto_3168840 ?auto_3168843 ) ( TRUCK-AT ?auto_3168843 ?auto_3168841 ) ( IN-CITY ?auto_3168841 ?auto_3168842 ) ( IN-CITY ?auto_3168836 ?auto_3168842 ) ( not ( = ?auto_3168836 ?auto_3168841 ) ) ( OBJ-AT ?auto_3168835 ?auto_3168836 ) ( not ( = ?auto_3168835 ?auto_3168840 ) ) ( OBJ-AT ?auto_3168837 ?auto_3168836 ) ( OBJ-AT ?auto_3168838 ?auto_3168836 ) ( OBJ-AT ?auto_3168839 ?auto_3168836 ) ( not ( = ?auto_3168835 ?auto_3168837 ) ) ( not ( = ?auto_3168835 ?auto_3168838 ) ) ( not ( = ?auto_3168835 ?auto_3168839 ) ) ( not ( = ?auto_3168837 ?auto_3168838 ) ) ( not ( = ?auto_3168837 ?auto_3168839 ) ) ( not ( = ?auto_3168837 ?auto_3168840 ) ) ( not ( = ?auto_3168838 ?auto_3168839 ) ) ( not ( = ?auto_3168838 ?auto_3168840 ) ) ( not ( = ?auto_3168839 ?auto_3168840 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3168835 ?auto_3168840 ?auto_3168836 )
      ( DELIVER-5PKG-VERIFY ?auto_3168835 ?auto_3168837 ?auto_3168838 ?auto_3168839 ?auto_3168840 ?auto_3168836 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3192143 - OBJ
      ?auto_3192145 - OBJ
      ?auto_3192146 - OBJ
      ?auto_3192147 - OBJ
      ?auto_3192148 - OBJ
      ?auto_3192144 - LOCATION
    )
    :vars
    (
      ?auto_3192149 - TRUCK
      ?auto_3192151 - LOCATION
      ?auto_3192150 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3192145 ?auto_3192143 ) ( GREATER-THAN ?auto_3192146 ?auto_3192143 ) ( GREATER-THAN ?auto_3192146 ?auto_3192145 ) ( GREATER-THAN ?auto_3192147 ?auto_3192143 ) ( GREATER-THAN ?auto_3192147 ?auto_3192145 ) ( GREATER-THAN ?auto_3192147 ?auto_3192146 ) ( GREATER-THAN ?auto_3192148 ?auto_3192143 ) ( GREATER-THAN ?auto_3192148 ?auto_3192145 ) ( GREATER-THAN ?auto_3192148 ?auto_3192146 ) ( GREATER-THAN ?auto_3192148 ?auto_3192147 ) ( TRUCK-AT ?auto_3192149 ?auto_3192151 ) ( IN-CITY ?auto_3192151 ?auto_3192150 ) ( IN-CITY ?auto_3192144 ?auto_3192150 ) ( not ( = ?auto_3192144 ?auto_3192151 ) ) ( OBJ-AT ?auto_3192143 ?auto_3192144 ) ( not ( = ?auto_3192143 ?auto_3192148 ) ) ( OBJ-AT ?auto_3192148 ?auto_3192151 ) ( OBJ-AT ?auto_3192145 ?auto_3192144 ) ( OBJ-AT ?auto_3192146 ?auto_3192144 ) ( OBJ-AT ?auto_3192147 ?auto_3192144 ) ( not ( = ?auto_3192143 ?auto_3192145 ) ) ( not ( = ?auto_3192143 ?auto_3192146 ) ) ( not ( = ?auto_3192143 ?auto_3192147 ) ) ( not ( = ?auto_3192145 ?auto_3192146 ) ) ( not ( = ?auto_3192145 ?auto_3192147 ) ) ( not ( = ?auto_3192145 ?auto_3192148 ) ) ( not ( = ?auto_3192146 ?auto_3192147 ) ) ( not ( = ?auto_3192146 ?auto_3192148 ) ) ( not ( = ?auto_3192147 ?auto_3192148 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3192143 ?auto_3192148 ?auto_3192144 )
      ( DELIVER-5PKG-VERIFY ?auto_3192143 ?auto_3192145 ?auto_3192146 ?auto_3192147 ?auto_3192148 ?auto_3192144 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3215451 - OBJ
      ?auto_3215453 - OBJ
      ?auto_3215454 - OBJ
      ?auto_3215455 - OBJ
      ?auto_3215456 - OBJ
      ?auto_3215452 - LOCATION
    )
    :vars
    (
      ?auto_3215457 - LOCATION
      ?auto_3215459 - CITY
      ?auto_3215458 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3215453 ?auto_3215451 ) ( GREATER-THAN ?auto_3215454 ?auto_3215451 ) ( GREATER-THAN ?auto_3215454 ?auto_3215453 ) ( GREATER-THAN ?auto_3215455 ?auto_3215451 ) ( GREATER-THAN ?auto_3215455 ?auto_3215453 ) ( GREATER-THAN ?auto_3215455 ?auto_3215454 ) ( GREATER-THAN ?auto_3215456 ?auto_3215451 ) ( GREATER-THAN ?auto_3215456 ?auto_3215453 ) ( GREATER-THAN ?auto_3215456 ?auto_3215454 ) ( GREATER-THAN ?auto_3215456 ?auto_3215455 ) ( IN-CITY ?auto_3215457 ?auto_3215459 ) ( IN-CITY ?auto_3215452 ?auto_3215459 ) ( not ( = ?auto_3215452 ?auto_3215457 ) ) ( OBJ-AT ?auto_3215451 ?auto_3215452 ) ( not ( = ?auto_3215451 ?auto_3215456 ) ) ( OBJ-AT ?auto_3215456 ?auto_3215457 ) ( TRUCK-AT ?auto_3215458 ?auto_3215452 ) ( OBJ-AT ?auto_3215453 ?auto_3215452 ) ( OBJ-AT ?auto_3215454 ?auto_3215452 ) ( OBJ-AT ?auto_3215455 ?auto_3215452 ) ( not ( = ?auto_3215451 ?auto_3215453 ) ) ( not ( = ?auto_3215451 ?auto_3215454 ) ) ( not ( = ?auto_3215451 ?auto_3215455 ) ) ( not ( = ?auto_3215453 ?auto_3215454 ) ) ( not ( = ?auto_3215453 ?auto_3215455 ) ) ( not ( = ?auto_3215453 ?auto_3215456 ) ) ( not ( = ?auto_3215454 ?auto_3215455 ) ) ( not ( = ?auto_3215454 ?auto_3215456 ) ) ( not ( = ?auto_3215455 ?auto_3215456 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3215451 ?auto_3215456 ?auto_3215452 )
      ( DELIVER-5PKG-VERIFY ?auto_3215451 ?auto_3215453 ?auto_3215454 ?auto_3215455 ?auto_3215456 ?auto_3215452 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3258405 - OBJ
      ?auto_3258407 - OBJ
      ?auto_3258408 - OBJ
      ?auto_3258409 - OBJ
      ?auto_3258406 - LOCATION
    )
    :vars
    (
      ?auto_3258413 - LOCATION
      ?auto_3258412 - CITY
      ?auto_3258410 - TRUCK
      ?auto_3258411 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_3258407 ?auto_3258405 ) ( GREATER-THAN ?auto_3258408 ?auto_3258405 ) ( GREATER-THAN ?auto_3258408 ?auto_3258407 ) ( GREATER-THAN ?auto_3258409 ?auto_3258405 ) ( GREATER-THAN ?auto_3258409 ?auto_3258407 ) ( GREATER-THAN ?auto_3258409 ?auto_3258408 ) ( IN-CITY ?auto_3258413 ?auto_3258412 ) ( IN-CITY ?auto_3258406 ?auto_3258412 ) ( not ( = ?auto_3258406 ?auto_3258413 ) ) ( OBJ-AT ?auto_3258405 ?auto_3258406 ) ( not ( = ?auto_3258405 ?auto_3258409 ) ) ( OBJ-AT ?auto_3258409 ?auto_3258413 ) ( TRUCK-AT ?auto_3258410 ?auto_3258411 ) ( IN-CITY ?auto_3258411 ?auto_3258412 ) ( not ( = ?auto_3258406 ?auto_3258411 ) ) ( not ( = ?auto_3258413 ?auto_3258411 ) ) ( OBJ-AT ?auto_3258407 ?auto_3258406 ) ( OBJ-AT ?auto_3258408 ?auto_3258406 ) ( not ( = ?auto_3258405 ?auto_3258407 ) ) ( not ( = ?auto_3258405 ?auto_3258408 ) ) ( not ( = ?auto_3258407 ?auto_3258408 ) ) ( not ( = ?auto_3258407 ?auto_3258409 ) ) ( not ( = ?auto_3258408 ?auto_3258409 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3258405 ?auto_3258409 ?auto_3258406 )
      ( DELIVER-4PKG-VERIFY ?auto_3258405 ?auto_3258407 ?auto_3258408 ?auto_3258409 ?auto_3258406 ) )
  )

)

