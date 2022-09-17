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
      ?auto_2928884 - OBJ
      ?auto_2928883 - LOCATION
    )
    :vars
    (
      ?auto_2928885 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2928885 ?auto_2928883 ) ( IN-TRUCK ?auto_2928884 ?auto_2928885 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2928884 ?auto_2928885 ?auto_2928883 )
      ( DELIVER-1PKG-VERIFY ?auto_2928884 ?auto_2928883 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2928909 - OBJ
      ?auto_2928908 - LOCATION
    )
    :vars
    (
      ?auto_2928910 - TRUCK
      ?auto_2928911 - LOCATION
      ?auto_2928912 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2928909 ?auto_2928910 ) ( TRUCK-AT ?auto_2928910 ?auto_2928911 ) ( IN-CITY ?auto_2928911 ?auto_2928912 ) ( IN-CITY ?auto_2928908 ?auto_2928912 ) ( not ( = ?auto_2928908 ?auto_2928911 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2928910 ?auto_2928911 ?auto_2928908 ?auto_2928912 )
      ( DELIVER-1PKG ?auto_2928909 ?auto_2928908 )
      ( DELIVER-1PKG-VERIFY ?auto_2928909 ?auto_2928908 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2928944 - OBJ
      ?auto_2928943 - LOCATION
    )
    :vars
    (
      ?auto_2928945 - TRUCK
      ?auto_2928946 - LOCATION
      ?auto_2928947 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2928945 ?auto_2928946 ) ( IN-CITY ?auto_2928946 ?auto_2928947 ) ( IN-CITY ?auto_2928943 ?auto_2928947 ) ( not ( = ?auto_2928943 ?auto_2928946 ) ) ( OBJ-AT ?auto_2928944 ?auto_2928946 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2928944 ?auto_2928945 ?auto_2928946 )
      ( DELIVER-1PKG ?auto_2928944 ?auto_2928943 )
      ( DELIVER-1PKG-VERIFY ?auto_2928944 ?auto_2928943 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2928979 - OBJ
      ?auto_2928978 - LOCATION
    )
    :vars
    (
      ?auto_2928981 - LOCATION
      ?auto_2928982 - CITY
      ?auto_2928980 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2928981 ?auto_2928982 ) ( IN-CITY ?auto_2928978 ?auto_2928982 ) ( not ( = ?auto_2928978 ?auto_2928981 ) ) ( OBJ-AT ?auto_2928979 ?auto_2928981 ) ( TRUCK-AT ?auto_2928980 ?auto_2928978 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2928980 ?auto_2928978 ?auto_2928981 ?auto_2928982 )
      ( DELIVER-1PKG ?auto_2928979 ?auto_2928978 )
      ( DELIVER-1PKG-VERIFY ?auto_2928979 ?auto_2928978 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2929317 - OBJ
      ?auto_2929318 - OBJ
      ?auto_2929316 - LOCATION
    )
    :vars
    (
      ?auto_2929319 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2929318 ?auto_2929317 ) ) ( TRUCK-AT ?auto_2929319 ?auto_2929316 ) ( IN-TRUCK ?auto_2929318 ?auto_2929319 ) ( OBJ-AT ?auto_2929317 ?auto_2929316 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2929318 ?auto_2929316 )
      ( DELIVER-2PKG-VERIFY ?auto_2929317 ?auto_2929318 ?auto_2929316 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2929321 - OBJ
      ?auto_2929322 - OBJ
      ?auto_2929320 - LOCATION
    )
    :vars
    (
      ?auto_2929323 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2929322 ?auto_2929321 ) ) ( TRUCK-AT ?auto_2929323 ?auto_2929320 ) ( IN-TRUCK ?auto_2929321 ?auto_2929323 ) ( OBJ-AT ?auto_2929322 ?auto_2929320 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2929321 ?auto_2929320 )
      ( DELIVER-2PKG-VERIFY ?auto_2929321 ?auto_2929322 ?auto_2929320 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2929676 - OBJ
      ?auto_2929677 - OBJ
      ?auto_2929675 - LOCATION
    )
    :vars
    (
      ?auto_2929679 - TRUCK
      ?auto_2929678 - LOCATION
      ?auto_2929680 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2929677 ?auto_2929676 ) ) ( IN-TRUCK ?auto_2929677 ?auto_2929679 ) ( TRUCK-AT ?auto_2929679 ?auto_2929678 ) ( IN-CITY ?auto_2929678 ?auto_2929680 ) ( IN-CITY ?auto_2929675 ?auto_2929680 ) ( not ( = ?auto_2929675 ?auto_2929678 ) ) ( OBJ-AT ?auto_2929676 ?auto_2929675 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2929677 ?auto_2929675 )
      ( DELIVER-2PKG-VERIFY ?auto_2929676 ?auto_2929677 ?auto_2929675 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2929682 - OBJ
      ?auto_2929683 - OBJ
      ?auto_2929681 - LOCATION
    )
    :vars
    (
      ?auto_2929685 - TRUCK
      ?auto_2929686 - LOCATION
      ?auto_2929684 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2929683 ?auto_2929682 ) ) ( IN-TRUCK ?auto_2929682 ?auto_2929685 ) ( TRUCK-AT ?auto_2929685 ?auto_2929686 ) ( IN-CITY ?auto_2929686 ?auto_2929684 ) ( IN-CITY ?auto_2929681 ?auto_2929684 ) ( not ( = ?auto_2929681 ?auto_2929686 ) ) ( OBJ-AT ?auto_2929683 ?auto_2929681 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2929683 ?auto_2929682 ?auto_2929681 )
      ( DELIVER-2PKG-VERIFY ?auto_2929682 ?auto_2929683 ?auto_2929681 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2930146 - OBJ
      ?auto_2930145 - LOCATION
    )
    :vars
    (
      ?auto_2930149 - OBJ
      ?auto_2930148 - TRUCK
      ?auto_2930150 - LOCATION
      ?auto_2930147 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2930146 ?auto_2930149 ) ) ( TRUCK-AT ?auto_2930148 ?auto_2930150 ) ( IN-CITY ?auto_2930150 ?auto_2930147 ) ( IN-CITY ?auto_2930145 ?auto_2930147 ) ( not ( = ?auto_2930145 ?auto_2930150 ) ) ( OBJ-AT ?auto_2930149 ?auto_2930145 ) ( OBJ-AT ?auto_2930146 ?auto_2930150 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2930146 ?auto_2930148 ?auto_2930150 )
      ( DELIVER-2PKG ?auto_2930149 ?auto_2930146 ?auto_2930145 )
      ( DELIVER-1PKG-VERIFY ?auto_2930146 ?auto_2930145 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2930152 - OBJ
      ?auto_2930153 - OBJ
      ?auto_2930151 - LOCATION
    )
    :vars
    (
      ?auto_2930154 - TRUCK
      ?auto_2930156 - LOCATION
      ?auto_2930155 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2930153 ?auto_2930152 ) ) ( TRUCK-AT ?auto_2930154 ?auto_2930156 ) ( IN-CITY ?auto_2930156 ?auto_2930155 ) ( IN-CITY ?auto_2930151 ?auto_2930155 ) ( not ( = ?auto_2930151 ?auto_2930156 ) ) ( OBJ-AT ?auto_2930152 ?auto_2930151 ) ( OBJ-AT ?auto_2930153 ?auto_2930156 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2930153 ?auto_2930151 )
      ( DELIVER-2PKG-VERIFY ?auto_2930152 ?auto_2930153 ?auto_2930151 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2930158 - OBJ
      ?auto_2930159 - OBJ
      ?auto_2930157 - LOCATION
    )
    :vars
    (
      ?auto_2930161 - TRUCK
      ?auto_2930162 - LOCATION
      ?auto_2930160 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2930159 ?auto_2930158 ) ) ( TRUCK-AT ?auto_2930161 ?auto_2930162 ) ( IN-CITY ?auto_2930162 ?auto_2930160 ) ( IN-CITY ?auto_2930157 ?auto_2930160 ) ( not ( = ?auto_2930157 ?auto_2930162 ) ) ( OBJ-AT ?auto_2930159 ?auto_2930157 ) ( OBJ-AT ?auto_2930158 ?auto_2930162 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2930159 ?auto_2930158 ?auto_2930157 )
      ( DELIVER-2PKG-VERIFY ?auto_2930158 ?auto_2930159 ?auto_2930157 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2930622 - OBJ
      ?auto_2930621 - LOCATION
    )
    :vars
    (
      ?auto_2930625 - OBJ
      ?auto_2930626 - LOCATION
      ?auto_2930623 - CITY
      ?auto_2930624 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2930622 ?auto_2930625 ) ) ( IN-CITY ?auto_2930626 ?auto_2930623 ) ( IN-CITY ?auto_2930621 ?auto_2930623 ) ( not ( = ?auto_2930621 ?auto_2930626 ) ) ( OBJ-AT ?auto_2930625 ?auto_2930621 ) ( OBJ-AT ?auto_2930622 ?auto_2930626 ) ( TRUCK-AT ?auto_2930624 ?auto_2930621 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2930624 ?auto_2930621 ?auto_2930626 ?auto_2930623 )
      ( DELIVER-2PKG ?auto_2930625 ?auto_2930622 ?auto_2930621 )
      ( DELIVER-1PKG-VERIFY ?auto_2930622 ?auto_2930621 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2930628 - OBJ
      ?auto_2930629 - OBJ
      ?auto_2930627 - LOCATION
    )
    :vars
    (
      ?auto_2930631 - LOCATION
      ?auto_2930632 - CITY
      ?auto_2930630 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2930629 ?auto_2930628 ) ) ( IN-CITY ?auto_2930631 ?auto_2930632 ) ( IN-CITY ?auto_2930627 ?auto_2930632 ) ( not ( = ?auto_2930627 ?auto_2930631 ) ) ( OBJ-AT ?auto_2930628 ?auto_2930627 ) ( OBJ-AT ?auto_2930629 ?auto_2930631 ) ( TRUCK-AT ?auto_2930630 ?auto_2930627 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2930629 ?auto_2930627 )
      ( DELIVER-2PKG-VERIFY ?auto_2930628 ?auto_2930629 ?auto_2930627 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2930634 - OBJ
      ?auto_2930635 - OBJ
      ?auto_2930633 - LOCATION
    )
    :vars
    (
      ?auto_2930638 - LOCATION
      ?auto_2930636 - CITY
      ?auto_2930637 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2930635 ?auto_2930634 ) ) ( IN-CITY ?auto_2930638 ?auto_2930636 ) ( IN-CITY ?auto_2930633 ?auto_2930636 ) ( not ( = ?auto_2930633 ?auto_2930638 ) ) ( OBJ-AT ?auto_2930635 ?auto_2930633 ) ( OBJ-AT ?auto_2930634 ?auto_2930638 ) ( TRUCK-AT ?auto_2930637 ?auto_2930633 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2930635 ?auto_2930634 ?auto_2930633 )
      ( DELIVER-2PKG-VERIFY ?auto_2930634 ?auto_2930635 ?auto_2930633 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2931098 - OBJ
      ?auto_2931097 - LOCATION
    )
    :vars
    (
      ?auto_2931099 - OBJ
      ?auto_2931102 - LOCATION
      ?auto_2931100 - CITY
      ?auto_2931101 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2931098 ?auto_2931099 ) ) ( IN-CITY ?auto_2931102 ?auto_2931100 ) ( IN-CITY ?auto_2931097 ?auto_2931100 ) ( not ( = ?auto_2931097 ?auto_2931102 ) ) ( OBJ-AT ?auto_2931098 ?auto_2931102 ) ( TRUCK-AT ?auto_2931101 ?auto_2931097 ) ( IN-TRUCK ?auto_2931099 ?auto_2931101 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2931099 ?auto_2931097 )
      ( DELIVER-2PKG ?auto_2931099 ?auto_2931098 ?auto_2931097 )
      ( DELIVER-1PKG-VERIFY ?auto_2931098 ?auto_2931097 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2931104 - OBJ
      ?auto_2931105 - OBJ
      ?auto_2931103 - LOCATION
    )
    :vars
    (
      ?auto_2931106 - LOCATION
      ?auto_2931107 - CITY
      ?auto_2931108 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2931105 ?auto_2931104 ) ) ( IN-CITY ?auto_2931106 ?auto_2931107 ) ( IN-CITY ?auto_2931103 ?auto_2931107 ) ( not ( = ?auto_2931103 ?auto_2931106 ) ) ( OBJ-AT ?auto_2931105 ?auto_2931106 ) ( TRUCK-AT ?auto_2931108 ?auto_2931103 ) ( IN-TRUCK ?auto_2931104 ?auto_2931108 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2931105 ?auto_2931103 )
      ( DELIVER-2PKG-VERIFY ?auto_2931104 ?auto_2931105 ?auto_2931103 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2931110 - OBJ
      ?auto_2931111 - OBJ
      ?auto_2931109 - LOCATION
    )
    :vars
    (
      ?auto_2931114 - LOCATION
      ?auto_2931113 - CITY
      ?auto_2931112 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2931111 ?auto_2931110 ) ) ( IN-CITY ?auto_2931114 ?auto_2931113 ) ( IN-CITY ?auto_2931109 ?auto_2931113 ) ( not ( = ?auto_2931109 ?auto_2931114 ) ) ( OBJ-AT ?auto_2931110 ?auto_2931114 ) ( TRUCK-AT ?auto_2931112 ?auto_2931109 ) ( IN-TRUCK ?auto_2931111 ?auto_2931112 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2931111 ?auto_2931110 ?auto_2931109 )
      ( DELIVER-2PKG-VERIFY ?auto_2931110 ?auto_2931111 ?auto_2931109 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2931574 - OBJ
      ?auto_2931573 - LOCATION
    )
    :vars
    (
      ?auto_2931576 - OBJ
      ?auto_2931578 - LOCATION
      ?auto_2931577 - CITY
      ?auto_2931575 - TRUCK
      ?auto_2931579 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2931574 ?auto_2931576 ) ) ( IN-CITY ?auto_2931578 ?auto_2931577 ) ( IN-CITY ?auto_2931573 ?auto_2931577 ) ( not ( = ?auto_2931573 ?auto_2931578 ) ) ( OBJ-AT ?auto_2931574 ?auto_2931578 ) ( IN-TRUCK ?auto_2931576 ?auto_2931575 ) ( TRUCK-AT ?auto_2931575 ?auto_2931579 ) ( IN-CITY ?auto_2931579 ?auto_2931577 ) ( not ( = ?auto_2931573 ?auto_2931579 ) ) ( not ( = ?auto_2931578 ?auto_2931579 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2931575 ?auto_2931579 ?auto_2931573 ?auto_2931577 )
      ( DELIVER-2PKG ?auto_2931576 ?auto_2931574 ?auto_2931573 )
      ( DELIVER-1PKG-VERIFY ?auto_2931574 ?auto_2931573 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2931581 - OBJ
      ?auto_2931582 - OBJ
      ?auto_2931580 - LOCATION
    )
    :vars
    (
      ?auto_2931584 - LOCATION
      ?auto_2931585 - CITY
      ?auto_2931586 - TRUCK
      ?auto_2931583 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2931582 ?auto_2931581 ) ) ( IN-CITY ?auto_2931584 ?auto_2931585 ) ( IN-CITY ?auto_2931580 ?auto_2931585 ) ( not ( = ?auto_2931580 ?auto_2931584 ) ) ( OBJ-AT ?auto_2931582 ?auto_2931584 ) ( IN-TRUCK ?auto_2931581 ?auto_2931586 ) ( TRUCK-AT ?auto_2931586 ?auto_2931583 ) ( IN-CITY ?auto_2931583 ?auto_2931585 ) ( not ( = ?auto_2931580 ?auto_2931583 ) ) ( not ( = ?auto_2931584 ?auto_2931583 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2931582 ?auto_2931580 )
      ( DELIVER-2PKG-VERIFY ?auto_2931581 ?auto_2931582 ?auto_2931580 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2931588 - OBJ
      ?auto_2931589 - OBJ
      ?auto_2931587 - LOCATION
    )
    :vars
    (
      ?auto_2931593 - LOCATION
      ?auto_2931591 - CITY
      ?auto_2931590 - TRUCK
      ?auto_2931592 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2931589 ?auto_2931588 ) ) ( IN-CITY ?auto_2931593 ?auto_2931591 ) ( IN-CITY ?auto_2931587 ?auto_2931591 ) ( not ( = ?auto_2931587 ?auto_2931593 ) ) ( OBJ-AT ?auto_2931588 ?auto_2931593 ) ( IN-TRUCK ?auto_2931589 ?auto_2931590 ) ( TRUCK-AT ?auto_2931590 ?auto_2931592 ) ( IN-CITY ?auto_2931592 ?auto_2931591 ) ( not ( = ?auto_2931587 ?auto_2931592 ) ) ( not ( = ?auto_2931593 ?auto_2931592 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2931589 ?auto_2931588 ?auto_2931587 )
      ( DELIVER-2PKG-VERIFY ?auto_2931588 ?auto_2931589 ?auto_2931587 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2932107 - OBJ
      ?auto_2932106 - LOCATION
    )
    :vars
    (
      ?auto_2932109 - OBJ
      ?auto_2932112 - LOCATION
      ?auto_2932110 - CITY
      ?auto_2932108 - TRUCK
      ?auto_2932111 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2932107 ?auto_2932109 ) ) ( IN-CITY ?auto_2932112 ?auto_2932110 ) ( IN-CITY ?auto_2932106 ?auto_2932110 ) ( not ( = ?auto_2932106 ?auto_2932112 ) ) ( OBJ-AT ?auto_2932107 ?auto_2932112 ) ( TRUCK-AT ?auto_2932108 ?auto_2932111 ) ( IN-CITY ?auto_2932111 ?auto_2932110 ) ( not ( = ?auto_2932106 ?auto_2932111 ) ) ( not ( = ?auto_2932112 ?auto_2932111 ) ) ( OBJ-AT ?auto_2932109 ?auto_2932111 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2932109 ?auto_2932108 ?auto_2932111 )
      ( DELIVER-2PKG ?auto_2932109 ?auto_2932107 ?auto_2932106 )
      ( DELIVER-1PKG-VERIFY ?auto_2932107 ?auto_2932106 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2932114 - OBJ
      ?auto_2932115 - OBJ
      ?auto_2932113 - LOCATION
    )
    :vars
    (
      ?auto_2932117 - LOCATION
      ?auto_2932119 - CITY
      ?auto_2932116 - TRUCK
      ?auto_2932118 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2932115 ?auto_2932114 ) ) ( IN-CITY ?auto_2932117 ?auto_2932119 ) ( IN-CITY ?auto_2932113 ?auto_2932119 ) ( not ( = ?auto_2932113 ?auto_2932117 ) ) ( OBJ-AT ?auto_2932115 ?auto_2932117 ) ( TRUCK-AT ?auto_2932116 ?auto_2932118 ) ( IN-CITY ?auto_2932118 ?auto_2932119 ) ( not ( = ?auto_2932113 ?auto_2932118 ) ) ( not ( = ?auto_2932117 ?auto_2932118 ) ) ( OBJ-AT ?auto_2932114 ?auto_2932118 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2932115 ?auto_2932113 )
      ( DELIVER-2PKG-VERIFY ?auto_2932114 ?auto_2932115 ?auto_2932113 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2932121 - OBJ
      ?auto_2932122 - OBJ
      ?auto_2932120 - LOCATION
    )
    :vars
    (
      ?auto_2932126 - LOCATION
      ?auto_2932123 - CITY
      ?auto_2932125 - TRUCK
      ?auto_2932124 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2932122 ?auto_2932121 ) ) ( IN-CITY ?auto_2932126 ?auto_2932123 ) ( IN-CITY ?auto_2932120 ?auto_2932123 ) ( not ( = ?auto_2932120 ?auto_2932126 ) ) ( OBJ-AT ?auto_2932121 ?auto_2932126 ) ( TRUCK-AT ?auto_2932125 ?auto_2932124 ) ( IN-CITY ?auto_2932124 ?auto_2932123 ) ( not ( = ?auto_2932120 ?auto_2932124 ) ) ( not ( = ?auto_2932126 ?auto_2932124 ) ) ( OBJ-AT ?auto_2932122 ?auto_2932124 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2932122 ?auto_2932121 ?auto_2932120 )
      ( DELIVER-2PKG-VERIFY ?auto_2932121 ?auto_2932122 ?auto_2932120 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2934818 - OBJ
      ?auto_2934819 - OBJ
      ?auto_2934820 - OBJ
      ?auto_2934817 - LOCATION
    )
    :vars
    (
      ?auto_2934821 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2934819 ?auto_2934818 ) ) ( not ( = ?auto_2934820 ?auto_2934818 ) ) ( not ( = ?auto_2934820 ?auto_2934819 ) ) ( TRUCK-AT ?auto_2934821 ?auto_2934817 ) ( IN-TRUCK ?auto_2934820 ?auto_2934821 ) ( OBJ-AT ?auto_2934818 ?auto_2934817 ) ( OBJ-AT ?auto_2934819 ?auto_2934817 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2934820 ?auto_2934817 )
      ( DELIVER-3PKG-VERIFY ?auto_2934818 ?auto_2934819 ?auto_2934820 ?auto_2934817 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2934828 - OBJ
      ?auto_2934829 - OBJ
      ?auto_2934830 - OBJ
      ?auto_2934827 - LOCATION
    )
    :vars
    (
      ?auto_2934831 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2934829 ?auto_2934828 ) ) ( not ( = ?auto_2934830 ?auto_2934828 ) ) ( not ( = ?auto_2934830 ?auto_2934829 ) ) ( TRUCK-AT ?auto_2934831 ?auto_2934827 ) ( IN-TRUCK ?auto_2934829 ?auto_2934831 ) ( OBJ-AT ?auto_2934828 ?auto_2934827 ) ( OBJ-AT ?auto_2934830 ?auto_2934827 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2934829 ?auto_2934827 )
      ( DELIVER-3PKG-VERIFY ?auto_2934828 ?auto_2934829 ?auto_2934830 ?auto_2934827 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2934866 - OBJ
      ?auto_2934867 - OBJ
      ?auto_2934868 - OBJ
      ?auto_2934865 - LOCATION
    )
    :vars
    (
      ?auto_2934869 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2934867 ?auto_2934866 ) ) ( not ( = ?auto_2934868 ?auto_2934866 ) ) ( not ( = ?auto_2934868 ?auto_2934867 ) ) ( TRUCK-AT ?auto_2934869 ?auto_2934865 ) ( IN-TRUCK ?auto_2934866 ?auto_2934869 ) ( OBJ-AT ?auto_2934867 ?auto_2934865 ) ( OBJ-AT ?auto_2934868 ?auto_2934865 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2934866 ?auto_2934865 )
      ( DELIVER-3PKG-VERIFY ?auto_2934866 ?auto_2934867 ?auto_2934868 ?auto_2934865 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2936809 - OBJ
      ?auto_2936810 - OBJ
      ?auto_2936811 - OBJ
      ?auto_2936808 - LOCATION
    )
    :vars
    (
      ?auto_2936812 - TRUCK
      ?auto_2936813 - LOCATION
      ?auto_2936814 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2936810 ?auto_2936809 ) ) ( not ( = ?auto_2936811 ?auto_2936809 ) ) ( not ( = ?auto_2936811 ?auto_2936810 ) ) ( IN-TRUCK ?auto_2936811 ?auto_2936812 ) ( TRUCK-AT ?auto_2936812 ?auto_2936813 ) ( IN-CITY ?auto_2936813 ?auto_2936814 ) ( IN-CITY ?auto_2936808 ?auto_2936814 ) ( not ( = ?auto_2936808 ?auto_2936813 ) ) ( OBJ-AT ?auto_2936809 ?auto_2936808 ) ( OBJ-AT ?auto_2936810 ?auto_2936808 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2936809 ?auto_2936811 ?auto_2936808 )
      ( DELIVER-3PKG-VERIFY ?auto_2936809 ?auto_2936810 ?auto_2936811 ?auto_2936808 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2936823 - OBJ
      ?auto_2936824 - OBJ
      ?auto_2936825 - OBJ
      ?auto_2936822 - LOCATION
    )
    :vars
    (
      ?auto_2936826 - TRUCK
      ?auto_2936827 - LOCATION
      ?auto_2936828 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2936824 ?auto_2936823 ) ) ( not ( = ?auto_2936825 ?auto_2936823 ) ) ( not ( = ?auto_2936825 ?auto_2936824 ) ) ( IN-TRUCK ?auto_2936824 ?auto_2936826 ) ( TRUCK-AT ?auto_2936826 ?auto_2936827 ) ( IN-CITY ?auto_2936827 ?auto_2936828 ) ( IN-CITY ?auto_2936822 ?auto_2936828 ) ( not ( = ?auto_2936822 ?auto_2936827 ) ) ( OBJ-AT ?auto_2936823 ?auto_2936822 ) ( OBJ-AT ?auto_2936825 ?auto_2936822 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2936823 ?auto_2936824 ?auto_2936822 )
      ( DELIVER-3PKG-VERIFY ?auto_2936823 ?auto_2936824 ?auto_2936825 ?auto_2936822 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2936876 - OBJ
      ?auto_2936877 - OBJ
      ?auto_2936878 - OBJ
      ?auto_2936875 - LOCATION
    )
    :vars
    (
      ?auto_2936879 - TRUCK
      ?auto_2936880 - LOCATION
      ?auto_2936881 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2936877 ?auto_2936876 ) ) ( not ( = ?auto_2936878 ?auto_2936876 ) ) ( not ( = ?auto_2936878 ?auto_2936877 ) ) ( IN-TRUCK ?auto_2936876 ?auto_2936879 ) ( TRUCK-AT ?auto_2936879 ?auto_2936880 ) ( IN-CITY ?auto_2936880 ?auto_2936881 ) ( IN-CITY ?auto_2936875 ?auto_2936881 ) ( not ( = ?auto_2936875 ?auto_2936880 ) ) ( OBJ-AT ?auto_2936877 ?auto_2936875 ) ( OBJ-AT ?auto_2936878 ?auto_2936875 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2936877 ?auto_2936876 ?auto_2936875 )
      ( DELIVER-3PKG-VERIFY ?auto_2936876 ?auto_2936877 ?auto_2936878 ?auto_2936875 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2939436 - OBJ
      ?auto_2939437 - OBJ
      ?auto_2939438 - OBJ
      ?auto_2939435 - LOCATION
    )
    :vars
    (
      ?auto_2939441 - TRUCK
      ?auto_2939440 - LOCATION
      ?auto_2939439 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2939437 ?auto_2939436 ) ) ( not ( = ?auto_2939438 ?auto_2939436 ) ) ( not ( = ?auto_2939438 ?auto_2939437 ) ) ( TRUCK-AT ?auto_2939441 ?auto_2939440 ) ( IN-CITY ?auto_2939440 ?auto_2939439 ) ( IN-CITY ?auto_2939435 ?auto_2939439 ) ( not ( = ?auto_2939435 ?auto_2939440 ) ) ( OBJ-AT ?auto_2939436 ?auto_2939435 ) ( OBJ-AT ?auto_2939438 ?auto_2939440 ) ( OBJ-AT ?auto_2939437 ?auto_2939435 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2939436 ?auto_2939438 ?auto_2939435 )
      ( DELIVER-3PKG-VERIFY ?auto_2939436 ?auto_2939437 ?auto_2939438 ?auto_2939435 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2939450 - OBJ
      ?auto_2939451 - OBJ
      ?auto_2939452 - OBJ
      ?auto_2939449 - LOCATION
    )
    :vars
    (
      ?auto_2939455 - TRUCK
      ?auto_2939454 - LOCATION
      ?auto_2939453 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2939451 ?auto_2939450 ) ) ( not ( = ?auto_2939452 ?auto_2939450 ) ) ( not ( = ?auto_2939452 ?auto_2939451 ) ) ( TRUCK-AT ?auto_2939455 ?auto_2939454 ) ( IN-CITY ?auto_2939454 ?auto_2939453 ) ( IN-CITY ?auto_2939449 ?auto_2939453 ) ( not ( = ?auto_2939449 ?auto_2939454 ) ) ( OBJ-AT ?auto_2939450 ?auto_2939449 ) ( OBJ-AT ?auto_2939451 ?auto_2939454 ) ( OBJ-AT ?auto_2939452 ?auto_2939449 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2939450 ?auto_2939451 ?auto_2939449 )
      ( DELIVER-3PKG-VERIFY ?auto_2939450 ?auto_2939451 ?auto_2939452 ?auto_2939449 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2939503 - OBJ
      ?auto_2939504 - OBJ
      ?auto_2939505 - OBJ
      ?auto_2939502 - LOCATION
    )
    :vars
    (
      ?auto_2939508 - TRUCK
      ?auto_2939507 - LOCATION
      ?auto_2939506 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2939504 ?auto_2939503 ) ) ( not ( = ?auto_2939505 ?auto_2939503 ) ) ( not ( = ?auto_2939505 ?auto_2939504 ) ) ( TRUCK-AT ?auto_2939508 ?auto_2939507 ) ( IN-CITY ?auto_2939507 ?auto_2939506 ) ( IN-CITY ?auto_2939502 ?auto_2939506 ) ( not ( = ?auto_2939502 ?auto_2939507 ) ) ( OBJ-AT ?auto_2939504 ?auto_2939502 ) ( OBJ-AT ?auto_2939503 ?auto_2939507 ) ( OBJ-AT ?auto_2939505 ?auto_2939502 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2939504 ?auto_2939503 ?auto_2939502 )
      ( DELIVER-3PKG-VERIFY ?auto_2939503 ?auto_2939504 ?auto_2939505 ?auto_2939502 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2942063 - OBJ
      ?auto_2942064 - OBJ
      ?auto_2942065 - OBJ
      ?auto_2942062 - LOCATION
    )
    :vars
    (
      ?auto_2942068 - LOCATION
      ?auto_2942067 - CITY
      ?auto_2942066 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2942064 ?auto_2942063 ) ) ( not ( = ?auto_2942065 ?auto_2942063 ) ) ( not ( = ?auto_2942065 ?auto_2942064 ) ) ( IN-CITY ?auto_2942068 ?auto_2942067 ) ( IN-CITY ?auto_2942062 ?auto_2942067 ) ( not ( = ?auto_2942062 ?auto_2942068 ) ) ( OBJ-AT ?auto_2942063 ?auto_2942062 ) ( OBJ-AT ?auto_2942065 ?auto_2942068 ) ( TRUCK-AT ?auto_2942066 ?auto_2942062 ) ( OBJ-AT ?auto_2942064 ?auto_2942062 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2942063 ?auto_2942065 ?auto_2942062 )
      ( DELIVER-3PKG-VERIFY ?auto_2942063 ?auto_2942064 ?auto_2942065 ?auto_2942062 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2942077 - OBJ
      ?auto_2942078 - OBJ
      ?auto_2942079 - OBJ
      ?auto_2942076 - LOCATION
    )
    :vars
    (
      ?auto_2942082 - LOCATION
      ?auto_2942081 - CITY
      ?auto_2942080 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2942078 ?auto_2942077 ) ) ( not ( = ?auto_2942079 ?auto_2942077 ) ) ( not ( = ?auto_2942079 ?auto_2942078 ) ) ( IN-CITY ?auto_2942082 ?auto_2942081 ) ( IN-CITY ?auto_2942076 ?auto_2942081 ) ( not ( = ?auto_2942076 ?auto_2942082 ) ) ( OBJ-AT ?auto_2942077 ?auto_2942076 ) ( OBJ-AT ?auto_2942078 ?auto_2942082 ) ( TRUCK-AT ?auto_2942080 ?auto_2942076 ) ( OBJ-AT ?auto_2942079 ?auto_2942076 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2942077 ?auto_2942078 ?auto_2942076 )
      ( DELIVER-3PKG-VERIFY ?auto_2942077 ?auto_2942078 ?auto_2942079 ?auto_2942076 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2942130 - OBJ
      ?auto_2942131 - OBJ
      ?auto_2942132 - OBJ
      ?auto_2942129 - LOCATION
    )
    :vars
    (
      ?auto_2942135 - LOCATION
      ?auto_2942134 - CITY
      ?auto_2942133 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2942131 ?auto_2942130 ) ) ( not ( = ?auto_2942132 ?auto_2942130 ) ) ( not ( = ?auto_2942132 ?auto_2942131 ) ) ( IN-CITY ?auto_2942135 ?auto_2942134 ) ( IN-CITY ?auto_2942129 ?auto_2942134 ) ( not ( = ?auto_2942129 ?auto_2942135 ) ) ( OBJ-AT ?auto_2942131 ?auto_2942129 ) ( OBJ-AT ?auto_2942130 ?auto_2942135 ) ( TRUCK-AT ?auto_2942133 ?auto_2942129 ) ( OBJ-AT ?auto_2942132 ?auto_2942129 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2942131 ?auto_2942130 ?auto_2942129 )
      ( DELIVER-3PKG-VERIFY ?auto_2942130 ?auto_2942131 ?auto_2942132 ?auto_2942129 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2947286 - OBJ
      ?auto_2947285 - LOCATION
    )
    :vars
    (
      ?auto_2947289 - OBJ
      ?auto_2947287 - LOCATION
      ?auto_2947290 - CITY
      ?auto_2947288 - TRUCK
      ?auto_2947291 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2947286 ?auto_2947289 ) ) ( IN-CITY ?auto_2947287 ?auto_2947290 ) ( IN-CITY ?auto_2947285 ?auto_2947290 ) ( not ( = ?auto_2947285 ?auto_2947287 ) ) ( OBJ-AT ?auto_2947289 ?auto_2947285 ) ( OBJ-AT ?auto_2947286 ?auto_2947287 ) ( TRUCK-AT ?auto_2947288 ?auto_2947291 ) ( IN-CITY ?auto_2947291 ?auto_2947290 ) ( not ( = ?auto_2947285 ?auto_2947291 ) ) ( not ( = ?auto_2947287 ?auto_2947291 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2947288 ?auto_2947291 ?auto_2947285 ?auto_2947290 )
      ( DELIVER-2PKG ?auto_2947289 ?auto_2947286 ?auto_2947285 )
      ( DELIVER-1PKG-VERIFY ?auto_2947286 ?auto_2947285 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2947293 - OBJ
      ?auto_2947294 - OBJ
      ?auto_2947292 - LOCATION
    )
    :vars
    (
      ?auto_2947295 - LOCATION
      ?auto_2947296 - CITY
      ?auto_2947297 - TRUCK
      ?auto_2947298 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2947294 ?auto_2947293 ) ) ( IN-CITY ?auto_2947295 ?auto_2947296 ) ( IN-CITY ?auto_2947292 ?auto_2947296 ) ( not ( = ?auto_2947292 ?auto_2947295 ) ) ( OBJ-AT ?auto_2947293 ?auto_2947292 ) ( OBJ-AT ?auto_2947294 ?auto_2947295 ) ( TRUCK-AT ?auto_2947297 ?auto_2947298 ) ( IN-CITY ?auto_2947298 ?auto_2947296 ) ( not ( = ?auto_2947292 ?auto_2947298 ) ) ( not ( = ?auto_2947295 ?auto_2947298 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2947294 ?auto_2947292 )
      ( DELIVER-2PKG-VERIFY ?auto_2947293 ?auto_2947294 ?auto_2947292 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2947308 - OBJ
      ?auto_2947309 - OBJ
      ?auto_2947307 - LOCATION
    )
    :vars
    (
      ?auto_2947312 - LOCATION
      ?auto_2947310 - CITY
      ?auto_2947313 - TRUCK
      ?auto_2947311 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_2947309 ?auto_2947308 ) ) ( IN-CITY ?auto_2947312 ?auto_2947310 ) ( IN-CITY ?auto_2947307 ?auto_2947310 ) ( not ( = ?auto_2947307 ?auto_2947312 ) ) ( OBJ-AT ?auto_2947309 ?auto_2947307 ) ( OBJ-AT ?auto_2947308 ?auto_2947312 ) ( TRUCK-AT ?auto_2947313 ?auto_2947311 ) ( IN-CITY ?auto_2947311 ?auto_2947310 ) ( not ( = ?auto_2947307 ?auto_2947311 ) ) ( not ( = ?auto_2947312 ?auto_2947311 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2947309 ?auto_2947308 ?auto_2947307 )
      ( DELIVER-2PKG-VERIFY ?auto_2947308 ?auto_2947309 ?auto_2947307 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2972862 - OBJ
      ?auto_2972863 - OBJ
      ?auto_2972864 - OBJ
      ?auto_2972865 - OBJ
      ?auto_2972861 - LOCATION
    )
    :vars
    (
      ?auto_2972866 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2972863 ?auto_2972862 ) ) ( not ( = ?auto_2972864 ?auto_2972862 ) ) ( not ( = ?auto_2972864 ?auto_2972863 ) ) ( not ( = ?auto_2972865 ?auto_2972862 ) ) ( not ( = ?auto_2972865 ?auto_2972863 ) ) ( not ( = ?auto_2972865 ?auto_2972864 ) ) ( TRUCK-AT ?auto_2972866 ?auto_2972861 ) ( IN-TRUCK ?auto_2972865 ?auto_2972866 ) ( OBJ-AT ?auto_2972862 ?auto_2972861 ) ( OBJ-AT ?auto_2972863 ?auto_2972861 ) ( OBJ-AT ?auto_2972864 ?auto_2972861 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2972865 ?auto_2972861 )
      ( DELIVER-4PKG-VERIFY ?auto_2972862 ?auto_2972863 ?auto_2972864 ?auto_2972865 ?auto_2972861 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2972880 - OBJ
      ?auto_2972881 - OBJ
      ?auto_2972882 - OBJ
      ?auto_2972883 - OBJ
      ?auto_2972879 - LOCATION
    )
    :vars
    (
      ?auto_2972884 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2972881 ?auto_2972880 ) ) ( not ( = ?auto_2972882 ?auto_2972880 ) ) ( not ( = ?auto_2972882 ?auto_2972881 ) ) ( not ( = ?auto_2972883 ?auto_2972880 ) ) ( not ( = ?auto_2972883 ?auto_2972881 ) ) ( not ( = ?auto_2972883 ?auto_2972882 ) ) ( TRUCK-AT ?auto_2972884 ?auto_2972879 ) ( IN-TRUCK ?auto_2972882 ?auto_2972884 ) ( OBJ-AT ?auto_2972880 ?auto_2972879 ) ( OBJ-AT ?auto_2972881 ?auto_2972879 ) ( OBJ-AT ?auto_2972883 ?auto_2972879 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2972882 ?auto_2972879 )
      ( DELIVER-4PKG-VERIFY ?auto_2972880 ?auto_2972881 ?auto_2972882 ?auto_2972883 ?auto_2972879 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2972968 - OBJ
      ?auto_2972969 - OBJ
      ?auto_2972970 - OBJ
      ?auto_2972971 - OBJ
      ?auto_2972967 - LOCATION
    )
    :vars
    (
      ?auto_2972972 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2972969 ?auto_2972968 ) ) ( not ( = ?auto_2972970 ?auto_2972968 ) ) ( not ( = ?auto_2972970 ?auto_2972969 ) ) ( not ( = ?auto_2972971 ?auto_2972968 ) ) ( not ( = ?auto_2972971 ?auto_2972969 ) ) ( not ( = ?auto_2972971 ?auto_2972970 ) ) ( TRUCK-AT ?auto_2972972 ?auto_2972967 ) ( IN-TRUCK ?auto_2972969 ?auto_2972972 ) ( OBJ-AT ?auto_2972968 ?auto_2972967 ) ( OBJ-AT ?auto_2972970 ?auto_2972967 ) ( OBJ-AT ?auto_2972971 ?auto_2972967 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2972969 ?auto_2972967 )
      ( DELIVER-4PKG-VERIFY ?auto_2972968 ?auto_2972969 ?auto_2972970 ?auto_2972971 ?auto_2972967 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2973495 - OBJ
      ?auto_2973496 - OBJ
      ?auto_2973497 - OBJ
      ?auto_2973498 - OBJ
      ?auto_2973494 - LOCATION
    )
    :vars
    (
      ?auto_2973499 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2973496 ?auto_2973495 ) ) ( not ( = ?auto_2973497 ?auto_2973495 ) ) ( not ( = ?auto_2973497 ?auto_2973496 ) ) ( not ( = ?auto_2973498 ?auto_2973495 ) ) ( not ( = ?auto_2973498 ?auto_2973496 ) ) ( not ( = ?auto_2973498 ?auto_2973497 ) ) ( TRUCK-AT ?auto_2973499 ?auto_2973494 ) ( IN-TRUCK ?auto_2973495 ?auto_2973499 ) ( OBJ-AT ?auto_2973496 ?auto_2973494 ) ( OBJ-AT ?auto_2973497 ?auto_2973494 ) ( OBJ-AT ?auto_2973498 ?auto_2973494 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2973495 ?auto_2973494 )
      ( DELIVER-4PKG-VERIFY ?auto_2973495 ?auto_2973496 ?auto_2973497 ?auto_2973498 ?auto_2973494 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2979640 - OBJ
      ?auto_2979641 - OBJ
      ?auto_2979642 - OBJ
      ?auto_2979643 - OBJ
      ?auto_2979639 - LOCATION
    )
    :vars
    (
      ?auto_2979646 - TRUCK
      ?auto_2979645 - LOCATION
      ?auto_2979644 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2979641 ?auto_2979640 ) ) ( not ( = ?auto_2979642 ?auto_2979640 ) ) ( not ( = ?auto_2979642 ?auto_2979641 ) ) ( not ( = ?auto_2979643 ?auto_2979640 ) ) ( not ( = ?auto_2979643 ?auto_2979641 ) ) ( not ( = ?auto_2979643 ?auto_2979642 ) ) ( IN-TRUCK ?auto_2979643 ?auto_2979646 ) ( TRUCK-AT ?auto_2979646 ?auto_2979645 ) ( IN-CITY ?auto_2979645 ?auto_2979644 ) ( IN-CITY ?auto_2979639 ?auto_2979644 ) ( not ( = ?auto_2979639 ?auto_2979645 ) ) ( OBJ-AT ?auto_2979640 ?auto_2979639 ) ( OBJ-AT ?auto_2979641 ?auto_2979639 ) ( OBJ-AT ?auto_2979642 ?auto_2979639 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2979640 ?auto_2979643 ?auto_2979639 )
      ( DELIVER-4PKG-VERIFY ?auto_2979640 ?auto_2979641 ?auto_2979642 ?auto_2979643 ?auto_2979639 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2979664 - OBJ
      ?auto_2979665 - OBJ
      ?auto_2979666 - OBJ
      ?auto_2979667 - OBJ
      ?auto_2979663 - LOCATION
    )
    :vars
    (
      ?auto_2979670 - TRUCK
      ?auto_2979669 - LOCATION
      ?auto_2979668 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2979665 ?auto_2979664 ) ) ( not ( = ?auto_2979666 ?auto_2979664 ) ) ( not ( = ?auto_2979666 ?auto_2979665 ) ) ( not ( = ?auto_2979667 ?auto_2979664 ) ) ( not ( = ?auto_2979667 ?auto_2979665 ) ) ( not ( = ?auto_2979667 ?auto_2979666 ) ) ( IN-TRUCK ?auto_2979666 ?auto_2979670 ) ( TRUCK-AT ?auto_2979670 ?auto_2979669 ) ( IN-CITY ?auto_2979669 ?auto_2979668 ) ( IN-CITY ?auto_2979663 ?auto_2979668 ) ( not ( = ?auto_2979663 ?auto_2979669 ) ) ( OBJ-AT ?auto_2979664 ?auto_2979663 ) ( OBJ-AT ?auto_2979665 ?auto_2979663 ) ( OBJ-AT ?auto_2979667 ?auto_2979663 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2979664 ?auto_2979666 ?auto_2979663 )
      ( DELIVER-4PKG-VERIFY ?auto_2979664 ?auto_2979665 ?auto_2979666 ?auto_2979667 ?auto_2979663 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2979778 - OBJ
      ?auto_2979779 - OBJ
      ?auto_2979780 - OBJ
      ?auto_2979781 - OBJ
      ?auto_2979777 - LOCATION
    )
    :vars
    (
      ?auto_2979784 - TRUCK
      ?auto_2979783 - LOCATION
      ?auto_2979782 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2979779 ?auto_2979778 ) ) ( not ( = ?auto_2979780 ?auto_2979778 ) ) ( not ( = ?auto_2979780 ?auto_2979779 ) ) ( not ( = ?auto_2979781 ?auto_2979778 ) ) ( not ( = ?auto_2979781 ?auto_2979779 ) ) ( not ( = ?auto_2979781 ?auto_2979780 ) ) ( IN-TRUCK ?auto_2979779 ?auto_2979784 ) ( TRUCK-AT ?auto_2979784 ?auto_2979783 ) ( IN-CITY ?auto_2979783 ?auto_2979782 ) ( IN-CITY ?auto_2979777 ?auto_2979782 ) ( not ( = ?auto_2979777 ?auto_2979783 ) ) ( OBJ-AT ?auto_2979778 ?auto_2979777 ) ( OBJ-AT ?auto_2979780 ?auto_2979777 ) ( OBJ-AT ?auto_2979781 ?auto_2979777 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2979778 ?auto_2979779 ?auto_2979777 )
      ( DELIVER-4PKG-VERIFY ?auto_2979778 ?auto_2979779 ?auto_2979780 ?auto_2979781 ?auto_2979777 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2980497 - OBJ
      ?auto_2980498 - OBJ
      ?auto_2980499 - OBJ
      ?auto_2980500 - OBJ
      ?auto_2980496 - LOCATION
    )
    :vars
    (
      ?auto_2980503 - TRUCK
      ?auto_2980502 - LOCATION
      ?auto_2980501 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2980498 ?auto_2980497 ) ) ( not ( = ?auto_2980499 ?auto_2980497 ) ) ( not ( = ?auto_2980499 ?auto_2980498 ) ) ( not ( = ?auto_2980500 ?auto_2980497 ) ) ( not ( = ?auto_2980500 ?auto_2980498 ) ) ( not ( = ?auto_2980500 ?auto_2980499 ) ) ( IN-TRUCK ?auto_2980497 ?auto_2980503 ) ( TRUCK-AT ?auto_2980503 ?auto_2980502 ) ( IN-CITY ?auto_2980502 ?auto_2980501 ) ( IN-CITY ?auto_2980496 ?auto_2980501 ) ( not ( = ?auto_2980496 ?auto_2980502 ) ) ( OBJ-AT ?auto_2980498 ?auto_2980496 ) ( OBJ-AT ?auto_2980499 ?auto_2980496 ) ( OBJ-AT ?auto_2980500 ?auto_2980496 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2980498 ?auto_2980497 ?auto_2980496 )
      ( DELIVER-4PKG-VERIFY ?auto_2980497 ?auto_2980498 ?auto_2980499 ?auto_2980500 ?auto_2980496 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2988549 - OBJ
      ?auto_2988550 - OBJ
      ?auto_2988551 - OBJ
      ?auto_2988552 - OBJ
      ?auto_2988548 - LOCATION
    )
    :vars
    (
      ?auto_2988555 - TRUCK
      ?auto_2988553 - LOCATION
      ?auto_2988554 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2988550 ?auto_2988549 ) ) ( not ( = ?auto_2988551 ?auto_2988549 ) ) ( not ( = ?auto_2988551 ?auto_2988550 ) ) ( not ( = ?auto_2988552 ?auto_2988549 ) ) ( not ( = ?auto_2988552 ?auto_2988550 ) ) ( not ( = ?auto_2988552 ?auto_2988551 ) ) ( TRUCK-AT ?auto_2988555 ?auto_2988553 ) ( IN-CITY ?auto_2988553 ?auto_2988554 ) ( IN-CITY ?auto_2988548 ?auto_2988554 ) ( not ( = ?auto_2988548 ?auto_2988553 ) ) ( OBJ-AT ?auto_2988549 ?auto_2988548 ) ( OBJ-AT ?auto_2988552 ?auto_2988553 ) ( OBJ-AT ?auto_2988550 ?auto_2988548 ) ( OBJ-AT ?auto_2988551 ?auto_2988548 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2988549 ?auto_2988552 ?auto_2988548 )
      ( DELIVER-4PKG-VERIFY ?auto_2988549 ?auto_2988550 ?auto_2988551 ?auto_2988552 ?auto_2988548 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2988573 - OBJ
      ?auto_2988574 - OBJ
      ?auto_2988575 - OBJ
      ?auto_2988576 - OBJ
      ?auto_2988572 - LOCATION
    )
    :vars
    (
      ?auto_2988579 - TRUCK
      ?auto_2988577 - LOCATION
      ?auto_2988578 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2988574 ?auto_2988573 ) ) ( not ( = ?auto_2988575 ?auto_2988573 ) ) ( not ( = ?auto_2988575 ?auto_2988574 ) ) ( not ( = ?auto_2988576 ?auto_2988573 ) ) ( not ( = ?auto_2988576 ?auto_2988574 ) ) ( not ( = ?auto_2988576 ?auto_2988575 ) ) ( TRUCK-AT ?auto_2988579 ?auto_2988577 ) ( IN-CITY ?auto_2988577 ?auto_2988578 ) ( IN-CITY ?auto_2988572 ?auto_2988578 ) ( not ( = ?auto_2988572 ?auto_2988577 ) ) ( OBJ-AT ?auto_2988573 ?auto_2988572 ) ( OBJ-AT ?auto_2988575 ?auto_2988577 ) ( OBJ-AT ?auto_2988574 ?auto_2988572 ) ( OBJ-AT ?auto_2988576 ?auto_2988572 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2988573 ?auto_2988575 ?auto_2988572 )
      ( DELIVER-4PKG-VERIFY ?auto_2988573 ?auto_2988574 ?auto_2988575 ?auto_2988576 ?auto_2988572 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2988687 - OBJ
      ?auto_2988688 - OBJ
      ?auto_2988689 - OBJ
      ?auto_2988690 - OBJ
      ?auto_2988686 - LOCATION
    )
    :vars
    (
      ?auto_2988693 - TRUCK
      ?auto_2988691 - LOCATION
      ?auto_2988692 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2988688 ?auto_2988687 ) ) ( not ( = ?auto_2988689 ?auto_2988687 ) ) ( not ( = ?auto_2988689 ?auto_2988688 ) ) ( not ( = ?auto_2988690 ?auto_2988687 ) ) ( not ( = ?auto_2988690 ?auto_2988688 ) ) ( not ( = ?auto_2988690 ?auto_2988689 ) ) ( TRUCK-AT ?auto_2988693 ?auto_2988691 ) ( IN-CITY ?auto_2988691 ?auto_2988692 ) ( IN-CITY ?auto_2988686 ?auto_2988692 ) ( not ( = ?auto_2988686 ?auto_2988691 ) ) ( OBJ-AT ?auto_2988687 ?auto_2988686 ) ( OBJ-AT ?auto_2988688 ?auto_2988691 ) ( OBJ-AT ?auto_2988689 ?auto_2988686 ) ( OBJ-AT ?auto_2988690 ?auto_2988686 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2988687 ?auto_2988688 ?auto_2988686 )
      ( DELIVER-4PKG-VERIFY ?auto_2988687 ?auto_2988688 ?auto_2988689 ?auto_2988690 ?auto_2988686 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2989406 - OBJ
      ?auto_2989407 - OBJ
      ?auto_2989408 - OBJ
      ?auto_2989409 - OBJ
      ?auto_2989405 - LOCATION
    )
    :vars
    (
      ?auto_2989412 - TRUCK
      ?auto_2989410 - LOCATION
      ?auto_2989411 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_2989407 ?auto_2989406 ) ) ( not ( = ?auto_2989408 ?auto_2989406 ) ) ( not ( = ?auto_2989408 ?auto_2989407 ) ) ( not ( = ?auto_2989409 ?auto_2989406 ) ) ( not ( = ?auto_2989409 ?auto_2989407 ) ) ( not ( = ?auto_2989409 ?auto_2989408 ) ) ( TRUCK-AT ?auto_2989412 ?auto_2989410 ) ( IN-CITY ?auto_2989410 ?auto_2989411 ) ( IN-CITY ?auto_2989405 ?auto_2989411 ) ( not ( = ?auto_2989405 ?auto_2989410 ) ) ( OBJ-AT ?auto_2989407 ?auto_2989405 ) ( OBJ-AT ?auto_2989406 ?auto_2989410 ) ( OBJ-AT ?auto_2989408 ?auto_2989405 ) ( OBJ-AT ?auto_2989409 ?auto_2989405 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2989407 ?auto_2989406 ?auto_2989405 )
      ( DELIVER-4PKG-VERIFY ?auto_2989406 ?auto_2989407 ?auto_2989408 ?auto_2989409 ?auto_2989405 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2997458 - OBJ
      ?auto_2997459 - OBJ
      ?auto_2997460 - OBJ
      ?auto_2997461 - OBJ
      ?auto_2997457 - LOCATION
    )
    :vars
    (
      ?auto_2997464 - LOCATION
      ?auto_2997463 - CITY
      ?auto_2997462 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2997459 ?auto_2997458 ) ) ( not ( = ?auto_2997460 ?auto_2997458 ) ) ( not ( = ?auto_2997460 ?auto_2997459 ) ) ( not ( = ?auto_2997461 ?auto_2997458 ) ) ( not ( = ?auto_2997461 ?auto_2997459 ) ) ( not ( = ?auto_2997461 ?auto_2997460 ) ) ( IN-CITY ?auto_2997464 ?auto_2997463 ) ( IN-CITY ?auto_2997457 ?auto_2997463 ) ( not ( = ?auto_2997457 ?auto_2997464 ) ) ( OBJ-AT ?auto_2997458 ?auto_2997457 ) ( OBJ-AT ?auto_2997461 ?auto_2997464 ) ( TRUCK-AT ?auto_2997462 ?auto_2997457 ) ( OBJ-AT ?auto_2997459 ?auto_2997457 ) ( OBJ-AT ?auto_2997460 ?auto_2997457 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2997458 ?auto_2997461 ?auto_2997457 )
      ( DELIVER-4PKG-VERIFY ?auto_2997458 ?auto_2997459 ?auto_2997460 ?auto_2997461 ?auto_2997457 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2997482 - OBJ
      ?auto_2997483 - OBJ
      ?auto_2997484 - OBJ
      ?auto_2997485 - OBJ
      ?auto_2997481 - LOCATION
    )
    :vars
    (
      ?auto_2997488 - LOCATION
      ?auto_2997487 - CITY
      ?auto_2997486 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2997483 ?auto_2997482 ) ) ( not ( = ?auto_2997484 ?auto_2997482 ) ) ( not ( = ?auto_2997484 ?auto_2997483 ) ) ( not ( = ?auto_2997485 ?auto_2997482 ) ) ( not ( = ?auto_2997485 ?auto_2997483 ) ) ( not ( = ?auto_2997485 ?auto_2997484 ) ) ( IN-CITY ?auto_2997488 ?auto_2997487 ) ( IN-CITY ?auto_2997481 ?auto_2997487 ) ( not ( = ?auto_2997481 ?auto_2997488 ) ) ( OBJ-AT ?auto_2997482 ?auto_2997481 ) ( OBJ-AT ?auto_2997484 ?auto_2997488 ) ( TRUCK-AT ?auto_2997486 ?auto_2997481 ) ( OBJ-AT ?auto_2997483 ?auto_2997481 ) ( OBJ-AT ?auto_2997485 ?auto_2997481 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2997482 ?auto_2997484 ?auto_2997481 )
      ( DELIVER-4PKG-VERIFY ?auto_2997482 ?auto_2997483 ?auto_2997484 ?auto_2997485 ?auto_2997481 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2997596 - OBJ
      ?auto_2997597 - OBJ
      ?auto_2997598 - OBJ
      ?auto_2997599 - OBJ
      ?auto_2997595 - LOCATION
    )
    :vars
    (
      ?auto_2997602 - LOCATION
      ?auto_2997601 - CITY
      ?auto_2997600 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2997597 ?auto_2997596 ) ) ( not ( = ?auto_2997598 ?auto_2997596 ) ) ( not ( = ?auto_2997598 ?auto_2997597 ) ) ( not ( = ?auto_2997599 ?auto_2997596 ) ) ( not ( = ?auto_2997599 ?auto_2997597 ) ) ( not ( = ?auto_2997599 ?auto_2997598 ) ) ( IN-CITY ?auto_2997602 ?auto_2997601 ) ( IN-CITY ?auto_2997595 ?auto_2997601 ) ( not ( = ?auto_2997595 ?auto_2997602 ) ) ( OBJ-AT ?auto_2997596 ?auto_2997595 ) ( OBJ-AT ?auto_2997597 ?auto_2997602 ) ( TRUCK-AT ?auto_2997600 ?auto_2997595 ) ( OBJ-AT ?auto_2997598 ?auto_2997595 ) ( OBJ-AT ?auto_2997599 ?auto_2997595 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2997596 ?auto_2997597 ?auto_2997595 )
      ( DELIVER-4PKG-VERIFY ?auto_2997596 ?auto_2997597 ?auto_2997598 ?auto_2997599 ?auto_2997595 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2998315 - OBJ
      ?auto_2998316 - OBJ
      ?auto_2998317 - OBJ
      ?auto_2998318 - OBJ
      ?auto_2998314 - LOCATION
    )
    :vars
    (
      ?auto_2998321 - LOCATION
      ?auto_2998320 - CITY
      ?auto_2998319 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_2998316 ?auto_2998315 ) ) ( not ( = ?auto_2998317 ?auto_2998315 ) ) ( not ( = ?auto_2998317 ?auto_2998316 ) ) ( not ( = ?auto_2998318 ?auto_2998315 ) ) ( not ( = ?auto_2998318 ?auto_2998316 ) ) ( not ( = ?auto_2998318 ?auto_2998317 ) ) ( IN-CITY ?auto_2998321 ?auto_2998320 ) ( IN-CITY ?auto_2998314 ?auto_2998320 ) ( not ( = ?auto_2998314 ?auto_2998321 ) ) ( OBJ-AT ?auto_2998316 ?auto_2998314 ) ( OBJ-AT ?auto_2998315 ?auto_2998321 ) ( TRUCK-AT ?auto_2998319 ?auto_2998314 ) ( OBJ-AT ?auto_2998317 ?auto_2998314 ) ( OBJ-AT ?auto_2998318 ?auto_2998314 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2998316 ?auto_2998315 ?auto_2998314 )
      ( DELIVER-4PKG-VERIFY ?auto_2998315 ?auto_2998316 ?auto_2998317 ?auto_2998318 ?auto_2998314 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3015090 - OBJ
      ?auto_3015091 - OBJ
      ?auto_3015092 - OBJ
      ?auto_3015089 - LOCATION
    )
    :vars
    (
      ?auto_3015096 - LOCATION
      ?auto_3015094 - CITY
      ?auto_3015095 - TRUCK
      ?auto_3015093 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3015091 ?auto_3015090 ) ) ( not ( = ?auto_3015092 ?auto_3015090 ) ) ( not ( = ?auto_3015092 ?auto_3015091 ) ) ( IN-CITY ?auto_3015096 ?auto_3015094 ) ( IN-CITY ?auto_3015089 ?auto_3015094 ) ( not ( = ?auto_3015089 ?auto_3015096 ) ) ( OBJ-AT ?auto_3015090 ?auto_3015089 ) ( OBJ-AT ?auto_3015092 ?auto_3015096 ) ( TRUCK-AT ?auto_3015095 ?auto_3015093 ) ( IN-CITY ?auto_3015093 ?auto_3015094 ) ( not ( = ?auto_3015089 ?auto_3015093 ) ) ( not ( = ?auto_3015096 ?auto_3015093 ) ) ( OBJ-AT ?auto_3015091 ?auto_3015089 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3015090 ?auto_3015092 ?auto_3015089 )
      ( DELIVER-3PKG-VERIFY ?auto_3015090 ?auto_3015091 ?auto_3015092 ?auto_3015089 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3015114 - OBJ
      ?auto_3015115 - OBJ
      ?auto_3015116 - OBJ
      ?auto_3015113 - LOCATION
    )
    :vars
    (
      ?auto_3015120 - LOCATION
      ?auto_3015118 - CITY
      ?auto_3015119 - TRUCK
      ?auto_3015117 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3015115 ?auto_3015114 ) ) ( not ( = ?auto_3015116 ?auto_3015114 ) ) ( not ( = ?auto_3015116 ?auto_3015115 ) ) ( IN-CITY ?auto_3015120 ?auto_3015118 ) ( IN-CITY ?auto_3015113 ?auto_3015118 ) ( not ( = ?auto_3015113 ?auto_3015120 ) ) ( OBJ-AT ?auto_3015114 ?auto_3015113 ) ( OBJ-AT ?auto_3015115 ?auto_3015120 ) ( TRUCK-AT ?auto_3015119 ?auto_3015117 ) ( IN-CITY ?auto_3015117 ?auto_3015118 ) ( not ( = ?auto_3015113 ?auto_3015117 ) ) ( not ( = ?auto_3015120 ?auto_3015117 ) ) ( OBJ-AT ?auto_3015116 ?auto_3015113 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3015114 ?auto_3015115 ?auto_3015113 )
      ( DELIVER-3PKG-VERIFY ?auto_3015114 ?auto_3015115 ?auto_3015116 ?auto_3015113 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3015260 - OBJ
      ?auto_3015261 - OBJ
      ?auto_3015262 - OBJ
      ?auto_3015259 - LOCATION
    )
    :vars
    (
      ?auto_3015266 - LOCATION
      ?auto_3015264 - CITY
      ?auto_3015265 - TRUCK
      ?auto_3015263 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3015261 ?auto_3015260 ) ) ( not ( = ?auto_3015262 ?auto_3015260 ) ) ( not ( = ?auto_3015262 ?auto_3015261 ) ) ( IN-CITY ?auto_3015266 ?auto_3015264 ) ( IN-CITY ?auto_3015259 ?auto_3015264 ) ( not ( = ?auto_3015259 ?auto_3015266 ) ) ( OBJ-AT ?auto_3015261 ?auto_3015259 ) ( OBJ-AT ?auto_3015260 ?auto_3015266 ) ( TRUCK-AT ?auto_3015265 ?auto_3015263 ) ( IN-CITY ?auto_3015263 ?auto_3015264 ) ( not ( = ?auto_3015259 ?auto_3015263 ) ) ( not ( = ?auto_3015266 ?auto_3015263 ) ) ( OBJ-AT ?auto_3015262 ?auto_3015259 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3015261 ?auto_3015260 ?auto_3015259 )
      ( DELIVER-3PKG-VERIFY ?auto_3015260 ?auto_3015261 ?auto_3015262 ?auto_3015259 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3137667 - OBJ
      ?auto_3137668 - OBJ
      ?auto_3137669 - OBJ
      ?auto_3137670 - OBJ
      ?auto_3137671 - OBJ
      ?auto_3137666 - LOCATION
    )
    :vars
    (
      ?auto_3137672 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3137668 ?auto_3137667 ) ) ( not ( = ?auto_3137669 ?auto_3137667 ) ) ( not ( = ?auto_3137669 ?auto_3137668 ) ) ( not ( = ?auto_3137670 ?auto_3137667 ) ) ( not ( = ?auto_3137670 ?auto_3137668 ) ) ( not ( = ?auto_3137670 ?auto_3137669 ) ) ( not ( = ?auto_3137671 ?auto_3137667 ) ) ( not ( = ?auto_3137671 ?auto_3137668 ) ) ( not ( = ?auto_3137671 ?auto_3137669 ) ) ( not ( = ?auto_3137671 ?auto_3137670 ) ) ( TRUCK-AT ?auto_3137672 ?auto_3137666 ) ( IN-TRUCK ?auto_3137671 ?auto_3137672 ) ( OBJ-AT ?auto_3137667 ?auto_3137666 ) ( OBJ-AT ?auto_3137668 ?auto_3137666 ) ( OBJ-AT ?auto_3137669 ?auto_3137666 ) ( OBJ-AT ?auto_3137670 ?auto_3137666 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3137671 ?auto_3137666 )
      ( DELIVER-5PKG-VERIFY ?auto_3137667 ?auto_3137668 ?auto_3137669 ?auto_3137670 ?auto_3137671 ?auto_3137666 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3137695 - OBJ
      ?auto_3137696 - OBJ
      ?auto_3137697 - OBJ
      ?auto_3137698 - OBJ
      ?auto_3137699 - OBJ
      ?auto_3137694 - LOCATION
    )
    :vars
    (
      ?auto_3137700 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3137696 ?auto_3137695 ) ) ( not ( = ?auto_3137697 ?auto_3137695 ) ) ( not ( = ?auto_3137697 ?auto_3137696 ) ) ( not ( = ?auto_3137698 ?auto_3137695 ) ) ( not ( = ?auto_3137698 ?auto_3137696 ) ) ( not ( = ?auto_3137698 ?auto_3137697 ) ) ( not ( = ?auto_3137699 ?auto_3137695 ) ) ( not ( = ?auto_3137699 ?auto_3137696 ) ) ( not ( = ?auto_3137699 ?auto_3137697 ) ) ( not ( = ?auto_3137699 ?auto_3137698 ) ) ( TRUCK-AT ?auto_3137700 ?auto_3137694 ) ( IN-TRUCK ?auto_3137698 ?auto_3137700 ) ( OBJ-AT ?auto_3137695 ?auto_3137694 ) ( OBJ-AT ?auto_3137696 ?auto_3137694 ) ( OBJ-AT ?auto_3137697 ?auto_3137694 ) ( OBJ-AT ?auto_3137699 ?auto_3137694 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3137698 ?auto_3137694 )
      ( DELIVER-5PKG-VERIFY ?auto_3137695 ?auto_3137696 ?auto_3137697 ?auto_3137698 ?auto_3137699 ?auto_3137694 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3137861 - OBJ
      ?auto_3137862 - OBJ
      ?auto_3137863 - OBJ
      ?auto_3137864 - OBJ
      ?auto_3137865 - OBJ
      ?auto_3137860 - LOCATION
    )
    :vars
    (
      ?auto_3137866 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3137862 ?auto_3137861 ) ) ( not ( = ?auto_3137863 ?auto_3137861 ) ) ( not ( = ?auto_3137863 ?auto_3137862 ) ) ( not ( = ?auto_3137864 ?auto_3137861 ) ) ( not ( = ?auto_3137864 ?auto_3137862 ) ) ( not ( = ?auto_3137864 ?auto_3137863 ) ) ( not ( = ?auto_3137865 ?auto_3137861 ) ) ( not ( = ?auto_3137865 ?auto_3137862 ) ) ( not ( = ?auto_3137865 ?auto_3137863 ) ) ( not ( = ?auto_3137865 ?auto_3137864 ) ) ( TRUCK-AT ?auto_3137866 ?auto_3137860 ) ( IN-TRUCK ?auto_3137863 ?auto_3137866 ) ( OBJ-AT ?auto_3137861 ?auto_3137860 ) ( OBJ-AT ?auto_3137862 ?auto_3137860 ) ( OBJ-AT ?auto_3137864 ?auto_3137860 ) ( OBJ-AT ?auto_3137865 ?auto_3137860 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3137863 ?auto_3137860 )
      ( DELIVER-5PKG-VERIFY ?auto_3137861 ?auto_3137862 ?auto_3137863 ?auto_3137864 ?auto_3137865 ?auto_3137860 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3139052 - OBJ
      ?auto_3139053 - OBJ
      ?auto_3139054 - OBJ
      ?auto_3139055 - OBJ
      ?auto_3139056 - OBJ
      ?auto_3139051 - LOCATION
    )
    :vars
    (
      ?auto_3139057 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3139053 ?auto_3139052 ) ) ( not ( = ?auto_3139054 ?auto_3139052 ) ) ( not ( = ?auto_3139054 ?auto_3139053 ) ) ( not ( = ?auto_3139055 ?auto_3139052 ) ) ( not ( = ?auto_3139055 ?auto_3139053 ) ) ( not ( = ?auto_3139055 ?auto_3139054 ) ) ( not ( = ?auto_3139056 ?auto_3139052 ) ) ( not ( = ?auto_3139056 ?auto_3139053 ) ) ( not ( = ?auto_3139056 ?auto_3139054 ) ) ( not ( = ?auto_3139056 ?auto_3139055 ) ) ( TRUCK-AT ?auto_3139057 ?auto_3139051 ) ( IN-TRUCK ?auto_3139053 ?auto_3139057 ) ( OBJ-AT ?auto_3139052 ?auto_3139051 ) ( OBJ-AT ?auto_3139054 ?auto_3139051 ) ( OBJ-AT ?auto_3139055 ?auto_3139051 ) ( OBJ-AT ?auto_3139056 ?auto_3139051 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3139053 ?auto_3139051 )
      ( DELIVER-5PKG-VERIFY ?auto_3139052 ?auto_3139053 ?auto_3139054 ?auto_3139055 ?auto_3139056 ?auto_3139051 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3147599 - OBJ
      ?auto_3147600 - OBJ
      ?auto_3147601 - OBJ
      ?auto_3147602 - OBJ
      ?auto_3147603 - OBJ
      ?auto_3147598 - LOCATION
    )
    :vars
    (
      ?auto_3147604 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3147600 ?auto_3147599 ) ) ( not ( = ?auto_3147601 ?auto_3147599 ) ) ( not ( = ?auto_3147601 ?auto_3147600 ) ) ( not ( = ?auto_3147602 ?auto_3147599 ) ) ( not ( = ?auto_3147602 ?auto_3147600 ) ) ( not ( = ?auto_3147602 ?auto_3147601 ) ) ( not ( = ?auto_3147603 ?auto_3147599 ) ) ( not ( = ?auto_3147603 ?auto_3147600 ) ) ( not ( = ?auto_3147603 ?auto_3147601 ) ) ( not ( = ?auto_3147603 ?auto_3147602 ) ) ( TRUCK-AT ?auto_3147604 ?auto_3147598 ) ( IN-TRUCK ?auto_3147599 ?auto_3147604 ) ( OBJ-AT ?auto_3147600 ?auto_3147598 ) ( OBJ-AT ?auto_3147601 ?auto_3147598 ) ( OBJ-AT ?auto_3147602 ?auto_3147598 ) ( OBJ-AT ?auto_3147603 ?auto_3147598 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3147599 ?auto_3147598 )
      ( DELIVER-5PKG-VERIFY ?auto_3147599 ?auto_3147600 ?auto_3147601 ?auto_3147602 ?auto_3147603 ?auto_3147598 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3155639 - OBJ
      ?auto_3155640 - OBJ
      ?auto_3155641 - OBJ
      ?auto_3155642 - OBJ
      ?auto_3155643 - OBJ
      ?auto_3155638 - LOCATION
    )
    :vars
    (
      ?auto_3155644 - TRUCK
      ?auto_3155645 - LOCATION
      ?auto_3155646 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_3155640 ?auto_3155639 ) ) ( not ( = ?auto_3155641 ?auto_3155639 ) ) ( not ( = ?auto_3155641 ?auto_3155640 ) ) ( not ( = ?auto_3155642 ?auto_3155639 ) ) ( not ( = ?auto_3155642 ?auto_3155640 ) ) ( not ( = ?auto_3155642 ?auto_3155641 ) ) ( not ( = ?auto_3155643 ?auto_3155639 ) ) ( not ( = ?auto_3155643 ?auto_3155640 ) ) ( not ( = ?auto_3155643 ?auto_3155641 ) ) ( not ( = ?auto_3155643 ?auto_3155642 ) ) ( IN-TRUCK ?auto_3155643 ?auto_3155644 ) ( TRUCK-AT ?auto_3155644 ?auto_3155645 ) ( IN-CITY ?auto_3155645 ?auto_3155646 ) ( IN-CITY ?auto_3155638 ?auto_3155646 ) ( not ( = ?auto_3155638 ?auto_3155645 ) ) ( OBJ-AT ?auto_3155639 ?auto_3155638 ) ( OBJ-AT ?auto_3155640 ?auto_3155638 ) ( OBJ-AT ?auto_3155641 ?auto_3155638 ) ( OBJ-AT ?auto_3155642 ?auto_3155638 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3155639 ?auto_3155643 ?auto_3155638 )
      ( DELIVER-5PKG-VERIFY ?auto_3155639 ?auto_3155640 ?auto_3155641 ?auto_3155642 ?auto_3155643 ?auto_3155638 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3155675 - OBJ
      ?auto_3155676 - OBJ
      ?auto_3155677 - OBJ
      ?auto_3155678 - OBJ
      ?auto_3155679 - OBJ
      ?auto_3155674 - LOCATION
    )
    :vars
    (
      ?auto_3155680 - TRUCK
      ?auto_3155681 - LOCATION
      ?auto_3155682 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_3155676 ?auto_3155675 ) ) ( not ( = ?auto_3155677 ?auto_3155675 ) ) ( not ( = ?auto_3155677 ?auto_3155676 ) ) ( not ( = ?auto_3155678 ?auto_3155675 ) ) ( not ( = ?auto_3155678 ?auto_3155676 ) ) ( not ( = ?auto_3155678 ?auto_3155677 ) ) ( not ( = ?auto_3155679 ?auto_3155675 ) ) ( not ( = ?auto_3155679 ?auto_3155676 ) ) ( not ( = ?auto_3155679 ?auto_3155677 ) ) ( not ( = ?auto_3155679 ?auto_3155678 ) ) ( IN-TRUCK ?auto_3155678 ?auto_3155680 ) ( TRUCK-AT ?auto_3155680 ?auto_3155681 ) ( IN-CITY ?auto_3155681 ?auto_3155682 ) ( IN-CITY ?auto_3155674 ?auto_3155682 ) ( not ( = ?auto_3155674 ?auto_3155681 ) ) ( OBJ-AT ?auto_3155675 ?auto_3155674 ) ( OBJ-AT ?auto_3155676 ?auto_3155674 ) ( OBJ-AT ?auto_3155677 ?auto_3155674 ) ( OBJ-AT ?auto_3155679 ?auto_3155674 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3155675 ?auto_3155678 ?auto_3155674 )
      ( DELIVER-5PKG-VERIFY ?auto_3155675 ?auto_3155676 ?auto_3155677 ?auto_3155678 ?auto_3155679 ?auto_3155674 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3155885 - OBJ
      ?auto_3155886 - OBJ
      ?auto_3155887 - OBJ
      ?auto_3155888 - OBJ
      ?auto_3155889 - OBJ
      ?auto_3155884 - LOCATION
    )
    :vars
    (
      ?auto_3155890 - TRUCK
      ?auto_3155891 - LOCATION
      ?auto_3155892 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_3155886 ?auto_3155885 ) ) ( not ( = ?auto_3155887 ?auto_3155885 ) ) ( not ( = ?auto_3155887 ?auto_3155886 ) ) ( not ( = ?auto_3155888 ?auto_3155885 ) ) ( not ( = ?auto_3155888 ?auto_3155886 ) ) ( not ( = ?auto_3155888 ?auto_3155887 ) ) ( not ( = ?auto_3155889 ?auto_3155885 ) ) ( not ( = ?auto_3155889 ?auto_3155886 ) ) ( not ( = ?auto_3155889 ?auto_3155887 ) ) ( not ( = ?auto_3155889 ?auto_3155888 ) ) ( IN-TRUCK ?auto_3155887 ?auto_3155890 ) ( TRUCK-AT ?auto_3155890 ?auto_3155891 ) ( IN-CITY ?auto_3155891 ?auto_3155892 ) ( IN-CITY ?auto_3155884 ?auto_3155892 ) ( not ( = ?auto_3155884 ?auto_3155891 ) ) ( OBJ-AT ?auto_3155885 ?auto_3155884 ) ( OBJ-AT ?auto_3155886 ?auto_3155884 ) ( OBJ-AT ?auto_3155888 ?auto_3155884 ) ( OBJ-AT ?auto_3155889 ?auto_3155884 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3155885 ?auto_3155887 ?auto_3155884 )
      ( DELIVER-5PKG-VERIFY ?auto_3155885 ?auto_3155886 ?auto_3155887 ?auto_3155888 ?auto_3155889 ?auto_3155884 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3157394 - OBJ
      ?auto_3157395 - OBJ
      ?auto_3157396 - OBJ
      ?auto_3157397 - OBJ
      ?auto_3157398 - OBJ
      ?auto_3157393 - LOCATION
    )
    :vars
    (
      ?auto_3157399 - TRUCK
      ?auto_3157400 - LOCATION
      ?auto_3157401 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_3157395 ?auto_3157394 ) ) ( not ( = ?auto_3157396 ?auto_3157394 ) ) ( not ( = ?auto_3157396 ?auto_3157395 ) ) ( not ( = ?auto_3157397 ?auto_3157394 ) ) ( not ( = ?auto_3157397 ?auto_3157395 ) ) ( not ( = ?auto_3157397 ?auto_3157396 ) ) ( not ( = ?auto_3157398 ?auto_3157394 ) ) ( not ( = ?auto_3157398 ?auto_3157395 ) ) ( not ( = ?auto_3157398 ?auto_3157396 ) ) ( not ( = ?auto_3157398 ?auto_3157397 ) ) ( IN-TRUCK ?auto_3157395 ?auto_3157399 ) ( TRUCK-AT ?auto_3157399 ?auto_3157400 ) ( IN-CITY ?auto_3157400 ?auto_3157401 ) ( IN-CITY ?auto_3157393 ?auto_3157401 ) ( not ( = ?auto_3157393 ?auto_3157400 ) ) ( OBJ-AT ?auto_3157394 ?auto_3157393 ) ( OBJ-AT ?auto_3157396 ?auto_3157393 ) ( OBJ-AT ?auto_3157397 ?auto_3157393 ) ( OBJ-AT ?auto_3157398 ?auto_3157393 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3157394 ?auto_3157395 ?auto_3157393 )
      ( DELIVER-5PKG-VERIFY ?auto_3157394 ?auto_3157395 ?auto_3157396 ?auto_3157397 ?auto_3157398 ?auto_3157393 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3168776 - OBJ
      ?auto_3168777 - OBJ
      ?auto_3168778 - OBJ
      ?auto_3168779 - OBJ
      ?auto_3168780 - OBJ
      ?auto_3168775 - LOCATION
    )
    :vars
    (
      ?auto_3168781 - TRUCK
      ?auto_3168782 - LOCATION
      ?auto_3168783 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_3168777 ?auto_3168776 ) ) ( not ( = ?auto_3168778 ?auto_3168776 ) ) ( not ( = ?auto_3168778 ?auto_3168777 ) ) ( not ( = ?auto_3168779 ?auto_3168776 ) ) ( not ( = ?auto_3168779 ?auto_3168777 ) ) ( not ( = ?auto_3168779 ?auto_3168778 ) ) ( not ( = ?auto_3168780 ?auto_3168776 ) ) ( not ( = ?auto_3168780 ?auto_3168777 ) ) ( not ( = ?auto_3168780 ?auto_3168778 ) ) ( not ( = ?auto_3168780 ?auto_3168779 ) ) ( IN-TRUCK ?auto_3168776 ?auto_3168781 ) ( TRUCK-AT ?auto_3168781 ?auto_3168782 ) ( IN-CITY ?auto_3168782 ?auto_3168783 ) ( IN-CITY ?auto_3168775 ?auto_3168783 ) ( not ( = ?auto_3168775 ?auto_3168782 ) ) ( OBJ-AT ?auto_3168777 ?auto_3168775 ) ( OBJ-AT ?auto_3168778 ?auto_3168775 ) ( OBJ-AT ?auto_3168779 ?auto_3168775 ) ( OBJ-AT ?auto_3168780 ?auto_3168775 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3168777 ?auto_3168776 ?auto_3168775 )
      ( DELIVER-5PKG-VERIFY ?auto_3168776 ?auto_3168777 ?auto_3168778 ?auto_3168779 ?auto_3168780 ?auto_3168775 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3178201 - OBJ
      ?auto_3178202 - OBJ
      ?auto_3178203 - OBJ
      ?auto_3178204 - OBJ
      ?auto_3178205 - OBJ
      ?auto_3178200 - LOCATION
    )
    :vars
    (
      ?auto_3178206 - TRUCK
      ?auto_3178207 - LOCATION
      ?auto_3178208 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_3178202 ?auto_3178201 ) ) ( not ( = ?auto_3178203 ?auto_3178201 ) ) ( not ( = ?auto_3178203 ?auto_3178202 ) ) ( not ( = ?auto_3178204 ?auto_3178201 ) ) ( not ( = ?auto_3178204 ?auto_3178202 ) ) ( not ( = ?auto_3178204 ?auto_3178203 ) ) ( not ( = ?auto_3178205 ?auto_3178201 ) ) ( not ( = ?auto_3178205 ?auto_3178202 ) ) ( not ( = ?auto_3178205 ?auto_3178203 ) ) ( not ( = ?auto_3178205 ?auto_3178204 ) ) ( TRUCK-AT ?auto_3178206 ?auto_3178207 ) ( IN-CITY ?auto_3178207 ?auto_3178208 ) ( IN-CITY ?auto_3178200 ?auto_3178208 ) ( not ( = ?auto_3178200 ?auto_3178207 ) ) ( OBJ-AT ?auto_3178201 ?auto_3178200 ) ( OBJ-AT ?auto_3178205 ?auto_3178207 ) ( OBJ-AT ?auto_3178202 ?auto_3178200 ) ( OBJ-AT ?auto_3178203 ?auto_3178200 ) ( OBJ-AT ?auto_3178204 ?auto_3178200 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3178201 ?auto_3178205 ?auto_3178200 )
      ( DELIVER-5PKG-VERIFY ?auto_3178201 ?auto_3178202 ?auto_3178203 ?auto_3178204 ?auto_3178205 ?auto_3178200 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3178237 - OBJ
      ?auto_3178238 - OBJ
      ?auto_3178239 - OBJ
      ?auto_3178240 - OBJ
      ?auto_3178241 - OBJ
      ?auto_3178236 - LOCATION
    )
    :vars
    (
      ?auto_3178242 - TRUCK
      ?auto_3178243 - LOCATION
      ?auto_3178244 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_3178238 ?auto_3178237 ) ) ( not ( = ?auto_3178239 ?auto_3178237 ) ) ( not ( = ?auto_3178239 ?auto_3178238 ) ) ( not ( = ?auto_3178240 ?auto_3178237 ) ) ( not ( = ?auto_3178240 ?auto_3178238 ) ) ( not ( = ?auto_3178240 ?auto_3178239 ) ) ( not ( = ?auto_3178241 ?auto_3178237 ) ) ( not ( = ?auto_3178241 ?auto_3178238 ) ) ( not ( = ?auto_3178241 ?auto_3178239 ) ) ( not ( = ?auto_3178241 ?auto_3178240 ) ) ( TRUCK-AT ?auto_3178242 ?auto_3178243 ) ( IN-CITY ?auto_3178243 ?auto_3178244 ) ( IN-CITY ?auto_3178236 ?auto_3178244 ) ( not ( = ?auto_3178236 ?auto_3178243 ) ) ( OBJ-AT ?auto_3178237 ?auto_3178236 ) ( OBJ-AT ?auto_3178240 ?auto_3178243 ) ( OBJ-AT ?auto_3178238 ?auto_3178236 ) ( OBJ-AT ?auto_3178239 ?auto_3178236 ) ( OBJ-AT ?auto_3178241 ?auto_3178236 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3178237 ?auto_3178240 ?auto_3178236 )
      ( DELIVER-5PKG-VERIFY ?auto_3178237 ?auto_3178238 ?auto_3178239 ?auto_3178240 ?auto_3178241 ?auto_3178236 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3178447 - OBJ
      ?auto_3178448 - OBJ
      ?auto_3178449 - OBJ
      ?auto_3178450 - OBJ
      ?auto_3178451 - OBJ
      ?auto_3178446 - LOCATION
    )
    :vars
    (
      ?auto_3178452 - TRUCK
      ?auto_3178453 - LOCATION
      ?auto_3178454 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_3178448 ?auto_3178447 ) ) ( not ( = ?auto_3178449 ?auto_3178447 ) ) ( not ( = ?auto_3178449 ?auto_3178448 ) ) ( not ( = ?auto_3178450 ?auto_3178447 ) ) ( not ( = ?auto_3178450 ?auto_3178448 ) ) ( not ( = ?auto_3178450 ?auto_3178449 ) ) ( not ( = ?auto_3178451 ?auto_3178447 ) ) ( not ( = ?auto_3178451 ?auto_3178448 ) ) ( not ( = ?auto_3178451 ?auto_3178449 ) ) ( not ( = ?auto_3178451 ?auto_3178450 ) ) ( TRUCK-AT ?auto_3178452 ?auto_3178453 ) ( IN-CITY ?auto_3178453 ?auto_3178454 ) ( IN-CITY ?auto_3178446 ?auto_3178454 ) ( not ( = ?auto_3178446 ?auto_3178453 ) ) ( OBJ-AT ?auto_3178447 ?auto_3178446 ) ( OBJ-AT ?auto_3178449 ?auto_3178453 ) ( OBJ-AT ?auto_3178448 ?auto_3178446 ) ( OBJ-AT ?auto_3178450 ?auto_3178446 ) ( OBJ-AT ?auto_3178451 ?auto_3178446 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3178447 ?auto_3178449 ?auto_3178446 )
      ( DELIVER-5PKG-VERIFY ?auto_3178447 ?auto_3178448 ?auto_3178449 ?auto_3178450 ?auto_3178451 ?auto_3178446 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3179956 - OBJ
      ?auto_3179957 - OBJ
      ?auto_3179958 - OBJ
      ?auto_3179959 - OBJ
      ?auto_3179960 - OBJ
      ?auto_3179955 - LOCATION
    )
    :vars
    (
      ?auto_3179961 - TRUCK
      ?auto_3179962 - LOCATION
      ?auto_3179963 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_3179957 ?auto_3179956 ) ) ( not ( = ?auto_3179958 ?auto_3179956 ) ) ( not ( = ?auto_3179958 ?auto_3179957 ) ) ( not ( = ?auto_3179959 ?auto_3179956 ) ) ( not ( = ?auto_3179959 ?auto_3179957 ) ) ( not ( = ?auto_3179959 ?auto_3179958 ) ) ( not ( = ?auto_3179960 ?auto_3179956 ) ) ( not ( = ?auto_3179960 ?auto_3179957 ) ) ( not ( = ?auto_3179960 ?auto_3179958 ) ) ( not ( = ?auto_3179960 ?auto_3179959 ) ) ( TRUCK-AT ?auto_3179961 ?auto_3179962 ) ( IN-CITY ?auto_3179962 ?auto_3179963 ) ( IN-CITY ?auto_3179955 ?auto_3179963 ) ( not ( = ?auto_3179955 ?auto_3179962 ) ) ( OBJ-AT ?auto_3179956 ?auto_3179955 ) ( OBJ-AT ?auto_3179957 ?auto_3179962 ) ( OBJ-AT ?auto_3179958 ?auto_3179955 ) ( OBJ-AT ?auto_3179959 ?auto_3179955 ) ( OBJ-AT ?auto_3179960 ?auto_3179955 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3179956 ?auto_3179957 ?auto_3179955 )
      ( DELIVER-5PKG-VERIFY ?auto_3179956 ?auto_3179957 ?auto_3179958 ?auto_3179959 ?auto_3179960 ?auto_3179955 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3191338 - OBJ
      ?auto_3191339 - OBJ
      ?auto_3191340 - OBJ
      ?auto_3191341 - OBJ
      ?auto_3191342 - OBJ
      ?auto_3191337 - LOCATION
    )
    :vars
    (
      ?auto_3191343 - TRUCK
      ?auto_3191344 - LOCATION
      ?auto_3191345 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_3191339 ?auto_3191338 ) ) ( not ( = ?auto_3191340 ?auto_3191338 ) ) ( not ( = ?auto_3191340 ?auto_3191339 ) ) ( not ( = ?auto_3191341 ?auto_3191338 ) ) ( not ( = ?auto_3191341 ?auto_3191339 ) ) ( not ( = ?auto_3191341 ?auto_3191340 ) ) ( not ( = ?auto_3191342 ?auto_3191338 ) ) ( not ( = ?auto_3191342 ?auto_3191339 ) ) ( not ( = ?auto_3191342 ?auto_3191340 ) ) ( not ( = ?auto_3191342 ?auto_3191341 ) ) ( TRUCK-AT ?auto_3191343 ?auto_3191344 ) ( IN-CITY ?auto_3191344 ?auto_3191345 ) ( IN-CITY ?auto_3191337 ?auto_3191345 ) ( not ( = ?auto_3191337 ?auto_3191344 ) ) ( OBJ-AT ?auto_3191339 ?auto_3191337 ) ( OBJ-AT ?auto_3191338 ?auto_3191344 ) ( OBJ-AT ?auto_3191340 ?auto_3191337 ) ( OBJ-AT ?auto_3191341 ?auto_3191337 ) ( OBJ-AT ?auto_3191342 ?auto_3191337 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3191339 ?auto_3191338 ?auto_3191337 )
      ( DELIVER-5PKG-VERIFY ?auto_3191338 ?auto_3191339 ?auto_3191340 ?auto_3191341 ?auto_3191342 ?auto_3191337 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3200763 - OBJ
      ?auto_3200764 - OBJ
      ?auto_3200765 - OBJ
      ?auto_3200766 - OBJ
      ?auto_3200767 - OBJ
      ?auto_3200762 - LOCATION
    )
    :vars
    (
      ?auto_3200769 - LOCATION
      ?auto_3200770 - CITY
      ?auto_3200768 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3200764 ?auto_3200763 ) ) ( not ( = ?auto_3200765 ?auto_3200763 ) ) ( not ( = ?auto_3200765 ?auto_3200764 ) ) ( not ( = ?auto_3200766 ?auto_3200763 ) ) ( not ( = ?auto_3200766 ?auto_3200764 ) ) ( not ( = ?auto_3200766 ?auto_3200765 ) ) ( not ( = ?auto_3200767 ?auto_3200763 ) ) ( not ( = ?auto_3200767 ?auto_3200764 ) ) ( not ( = ?auto_3200767 ?auto_3200765 ) ) ( not ( = ?auto_3200767 ?auto_3200766 ) ) ( IN-CITY ?auto_3200769 ?auto_3200770 ) ( IN-CITY ?auto_3200762 ?auto_3200770 ) ( not ( = ?auto_3200762 ?auto_3200769 ) ) ( OBJ-AT ?auto_3200763 ?auto_3200762 ) ( OBJ-AT ?auto_3200767 ?auto_3200769 ) ( TRUCK-AT ?auto_3200768 ?auto_3200762 ) ( OBJ-AT ?auto_3200764 ?auto_3200762 ) ( OBJ-AT ?auto_3200765 ?auto_3200762 ) ( OBJ-AT ?auto_3200766 ?auto_3200762 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3200763 ?auto_3200767 ?auto_3200762 )
      ( DELIVER-5PKG-VERIFY ?auto_3200763 ?auto_3200764 ?auto_3200765 ?auto_3200766 ?auto_3200767 ?auto_3200762 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3200799 - OBJ
      ?auto_3200800 - OBJ
      ?auto_3200801 - OBJ
      ?auto_3200802 - OBJ
      ?auto_3200803 - OBJ
      ?auto_3200798 - LOCATION
    )
    :vars
    (
      ?auto_3200805 - LOCATION
      ?auto_3200806 - CITY
      ?auto_3200804 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3200800 ?auto_3200799 ) ) ( not ( = ?auto_3200801 ?auto_3200799 ) ) ( not ( = ?auto_3200801 ?auto_3200800 ) ) ( not ( = ?auto_3200802 ?auto_3200799 ) ) ( not ( = ?auto_3200802 ?auto_3200800 ) ) ( not ( = ?auto_3200802 ?auto_3200801 ) ) ( not ( = ?auto_3200803 ?auto_3200799 ) ) ( not ( = ?auto_3200803 ?auto_3200800 ) ) ( not ( = ?auto_3200803 ?auto_3200801 ) ) ( not ( = ?auto_3200803 ?auto_3200802 ) ) ( IN-CITY ?auto_3200805 ?auto_3200806 ) ( IN-CITY ?auto_3200798 ?auto_3200806 ) ( not ( = ?auto_3200798 ?auto_3200805 ) ) ( OBJ-AT ?auto_3200799 ?auto_3200798 ) ( OBJ-AT ?auto_3200802 ?auto_3200805 ) ( TRUCK-AT ?auto_3200804 ?auto_3200798 ) ( OBJ-AT ?auto_3200800 ?auto_3200798 ) ( OBJ-AT ?auto_3200801 ?auto_3200798 ) ( OBJ-AT ?auto_3200803 ?auto_3200798 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3200799 ?auto_3200802 ?auto_3200798 )
      ( DELIVER-5PKG-VERIFY ?auto_3200799 ?auto_3200800 ?auto_3200801 ?auto_3200802 ?auto_3200803 ?auto_3200798 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3201009 - OBJ
      ?auto_3201010 - OBJ
      ?auto_3201011 - OBJ
      ?auto_3201012 - OBJ
      ?auto_3201013 - OBJ
      ?auto_3201008 - LOCATION
    )
    :vars
    (
      ?auto_3201015 - LOCATION
      ?auto_3201016 - CITY
      ?auto_3201014 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3201010 ?auto_3201009 ) ) ( not ( = ?auto_3201011 ?auto_3201009 ) ) ( not ( = ?auto_3201011 ?auto_3201010 ) ) ( not ( = ?auto_3201012 ?auto_3201009 ) ) ( not ( = ?auto_3201012 ?auto_3201010 ) ) ( not ( = ?auto_3201012 ?auto_3201011 ) ) ( not ( = ?auto_3201013 ?auto_3201009 ) ) ( not ( = ?auto_3201013 ?auto_3201010 ) ) ( not ( = ?auto_3201013 ?auto_3201011 ) ) ( not ( = ?auto_3201013 ?auto_3201012 ) ) ( IN-CITY ?auto_3201015 ?auto_3201016 ) ( IN-CITY ?auto_3201008 ?auto_3201016 ) ( not ( = ?auto_3201008 ?auto_3201015 ) ) ( OBJ-AT ?auto_3201009 ?auto_3201008 ) ( OBJ-AT ?auto_3201011 ?auto_3201015 ) ( TRUCK-AT ?auto_3201014 ?auto_3201008 ) ( OBJ-AT ?auto_3201010 ?auto_3201008 ) ( OBJ-AT ?auto_3201012 ?auto_3201008 ) ( OBJ-AT ?auto_3201013 ?auto_3201008 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3201009 ?auto_3201011 ?auto_3201008 )
      ( DELIVER-5PKG-VERIFY ?auto_3201009 ?auto_3201010 ?auto_3201011 ?auto_3201012 ?auto_3201013 ?auto_3201008 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3202518 - OBJ
      ?auto_3202519 - OBJ
      ?auto_3202520 - OBJ
      ?auto_3202521 - OBJ
      ?auto_3202522 - OBJ
      ?auto_3202517 - LOCATION
    )
    :vars
    (
      ?auto_3202524 - LOCATION
      ?auto_3202525 - CITY
      ?auto_3202523 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3202519 ?auto_3202518 ) ) ( not ( = ?auto_3202520 ?auto_3202518 ) ) ( not ( = ?auto_3202520 ?auto_3202519 ) ) ( not ( = ?auto_3202521 ?auto_3202518 ) ) ( not ( = ?auto_3202521 ?auto_3202519 ) ) ( not ( = ?auto_3202521 ?auto_3202520 ) ) ( not ( = ?auto_3202522 ?auto_3202518 ) ) ( not ( = ?auto_3202522 ?auto_3202519 ) ) ( not ( = ?auto_3202522 ?auto_3202520 ) ) ( not ( = ?auto_3202522 ?auto_3202521 ) ) ( IN-CITY ?auto_3202524 ?auto_3202525 ) ( IN-CITY ?auto_3202517 ?auto_3202525 ) ( not ( = ?auto_3202517 ?auto_3202524 ) ) ( OBJ-AT ?auto_3202518 ?auto_3202517 ) ( OBJ-AT ?auto_3202519 ?auto_3202524 ) ( TRUCK-AT ?auto_3202523 ?auto_3202517 ) ( OBJ-AT ?auto_3202520 ?auto_3202517 ) ( OBJ-AT ?auto_3202521 ?auto_3202517 ) ( OBJ-AT ?auto_3202522 ?auto_3202517 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3202518 ?auto_3202519 ?auto_3202517 )
      ( DELIVER-5PKG-VERIFY ?auto_3202518 ?auto_3202519 ?auto_3202520 ?auto_3202521 ?auto_3202522 ?auto_3202517 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3213900 - OBJ
      ?auto_3213901 - OBJ
      ?auto_3213902 - OBJ
      ?auto_3213903 - OBJ
      ?auto_3213904 - OBJ
      ?auto_3213899 - LOCATION
    )
    :vars
    (
      ?auto_3213906 - LOCATION
      ?auto_3213907 - CITY
      ?auto_3213905 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_3213901 ?auto_3213900 ) ) ( not ( = ?auto_3213902 ?auto_3213900 ) ) ( not ( = ?auto_3213902 ?auto_3213901 ) ) ( not ( = ?auto_3213903 ?auto_3213900 ) ) ( not ( = ?auto_3213903 ?auto_3213901 ) ) ( not ( = ?auto_3213903 ?auto_3213902 ) ) ( not ( = ?auto_3213904 ?auto_3213900 ) ) ( not ( = ?auto_3213904 ?auto_3213901 ) ) ( not ( = ?auto_3213904 ?auto_3213902 ) ) ( not ( = ?auto_3213904 ?auto_3213903 ) ) ( IN-CITY ?auto_3213906 ?auto_3213907 ) ( IN-CITY ?auto_3213899 ?auto_3213907 ) ( not ( = ?auto_3213899 ?auto_3213906 ) ) ( OBJ-AT ?auto_3213901 ?auto_3213899 ) ( OBJ-AT ?auto_3213900 ?auto_3213906 ) ( TRUCK-AT ?auto_3213905 ?auto_3213899 ) ( OBJ-AT ?auto_3213902 ?auto_3213899 ) ( OBJ-AT ?auto_3213903 ?auto_3213899 ) ( OBJ-AT ?auto_3213904 ?auto_3213899 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3213901 ?auto_3213900 ?auto_3213899 )
      ( DELIVER-5PKG-VERIFY ?auto_3213900 ?auto_3213901 ?auto_3213902 ?auto_3213903 ?auto_3213904 ?auto_3213899 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3243175 - OBJ
      ?auto_3243176 - OBJ
      ?auto_3243177 - OBJ
      ?auto_3243178 - OBJ
      ?auto_3243174 - LOCATION
    )
    :vars
    (
      ?auto_3243179 - LOCATION
      ?auto_3243181 - CITY
      ?auto_3243182 - TRUCK
      ?auto_3243180 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3243176 ?auto_3243175 ) ) ( not ( = ?auto_3243177 ?auto_3243175 ) ) ( not ( = ?auto_3243177 ?auto_3243176 ) ) ( not ( = ?auto_3243178 ?auto_3243175 ) ) ( not ( = ?auto_3243178 ?auto_3243176 ) ) ( not ( = ?auto_3243178 ?auto_3243177 ) ) ( IN-CITY ?auto_3243179 ?auto_3243181 ) ( IN-CITY ?auto_3243174 ?auto_3243181 ) ( not ( = ?auto_3243174 ?auto_3243179 ) ) ( OBJ-AT ?auto_3243175 ?auto_3243174 ) ( OBJ-AT ?auto_3243178 ?auto_3243179 ) ( TRUCK-AT ?auto_3243182 ?auto_3243180 ) ( IN-CITY ?auto_3243180 ?auto_3243181 ) ( not ( = ?auto_3243174 ?auto_3243180 ) ) ( not ( = ?auto_3243179 ?auto_3243180 ) ) ( OBJ-AT ?auto_3243176 ?auto_3243174 ) ( OBJ-AT ?auto_3243177 ?auto_3243174 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3243175 ?auto_3243178 ?auto_3243174 )
      ( DELIVER-4PKG-VERIFY ?auto_3243175 ?auto_3243176 ?auto_3243177 ?auto_3243178 ?auto_3243174 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3243211 - OBJ
      ?auto_3243212 - OBJ
      ?auto_3243213 - OBJ
      ?auto_3243214 - OBJ
      ?auto_3243210 - LOCATION
    )
    :vars
    (
      ?auto_3243215 - LOCATION
      ?auto_3243217 - CITY
      ?auto_3243218 - TRUCK
      ?auto_3243216 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3243212 ?auto_3243211 ) ) ( not ( = ?auto_3243213 ?auto_3243211 ) ) ( not ( = ?auto_3243213 ?auto_3243212 ) ) ( not ( = ?auto_3243214 ?auto_3243211 ) ) ( not ( = ?auto_3243214 ?auto_3243212 ) ) ( not ( = ?auto_3243214 ?auto_3243213 ) ) ( IN-CITY ?auto_3243215 ?auto_3243217 ) ( IN-CITY ?auto_3243210 ?auto_3243217 ) ( not ( = ?auto_3243210 ?auto_3243215 ) ) ( OBJ-AT ?auto_3243211 ?auto_3243210 ) ( OBJ-AT ?auto_3243213 ?auto_3243215 ) ( TRUCK-AT ?auto_3243218 ?auto_3243216 ) ( IN-CITY ?auto_3243216 ?auto_3243217 ) ( not ( = ?auto_3243210 ?auto_3243216 ) ) ( not ( = ?auto_3243215 ?auto_3243216 ) ) ( OBJ-AT ?auto_3243212 ?auto_3243210 ) ( OBJ-AT ?auto_3243214 ?auto_3243210 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3243211 ?auto_3243213 ?auto_3243210 )
      ( DELIVER-4PKG-VERIFY ?auto_3243211 ?auto_3243212 ?auto_3243213 ?auto_3243214 ?auto_3243210 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3243455 - OBJ
      ?auto_3243456 - OBJ
      ?auto_3243457 - OBJ
      ?auto_3243458 - OBJ
      ?auto_3243454 - LOCATION
    )
    :vars
    (
      ?auto_3243459 - LOCATION
      ?auto_3243461 - CITY
      ?auto_3243462 - TRUCK
      ?auto_3243460 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3243456 ?auto_3243455 ) ) ( not ( = ?auto_3243457 ?auto_3243455 ) ) ( not ( = ?auto_3243457 ?auto_3243456 ) ) ( not ( = ?auto_3243458 ?auto_3243455 ) ) ( not ( = ?auto_3243458 ?auto_3243456 ) ) ( not ( = ?auto_3243458 ?auto_3243457 ) ) ( IN-CITY ?auto_3243459 ?auto_3243461 ) ( IN-CITY ?auto_3243454 ?auto_3243461 ) ( not ( = ?auto_3243454 ?auto_3243459 ) ) ( OBJ-AT ?auto_3243455 ?auto_3243454 ) ( OBJ-AT ?auto_3243456 ?auto_3243459 ) ( TRUCK-AT ?auto_3243462 ?auto_3243460 ) ( IN-CITY ?auto_3243460 ?auto_3243461 ) ( not ( = ?auto_3243454 ?auto_3243460 ) ) ( not ( = ?auto_3243459 ?auto_3243460 ) ) ( OBJ-AT ?auto_3243457 ?auto_3243454 ) ( OBJ-AT ?auto_3243458 ?auto_3243454 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3243455 ?auto_3243456 ?auto_3243454 )
      ( DELIVER-4PKG-VERIFY ?auto_3243455 ?auto_3243456 ?auto_3243457 ?auto_3243458 ?auto_3243454 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3245386 - OBJ
      ?auto_3245387 - OBJ
      ?auto_3245388 - OBJ
      ?auto_3245389 - OBJ
      ?auto_3245385 - LOCATION
    )
    :vars
    (
      ?auto_3245390 - LOCATION
      ?auto_3245392 - CITY
      ?auto_3245393 - TRUCK
      ?auto_3245391 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_3245387 ?auto_3245386 ) ) ( not ( = ?auto_3245388 ?auto_3245386 ) ) ( not ( = ?auto_3245388 ?auto_3245387 ) ) ( not ( = ?auto_3245389 ?auto_3245386 ) ) ( not ( = ?auto_3245389 ?auto_3245387 ) ) ( not ( = ?auto_3245389 ?auto_3245388 ) ) ( IN-CITY ?auto_3245390 ?auto_3245392 ) ( IN-CITY ?auto_3245385 ?auto_3245392 ) ( not ( = ?auto_3245385 ?auto_3245390 ) ) ( OBJ-AT ?auto_3245387 ?auto_3245385 ) ( OBJ-AT ?auto_3245386 ?auto_3245390 ) ( TRUCK-AT ?auto_3245393 ?auto_3245391 ) ( IN-CITY ?auto_3245391 ?auto_3245392 ) ( not ( = ?auto_3245385 ?auto_3245391 ) ) ( not ( = ?auto_3245390 ?auto_3245391 ) ) ( OBJ-AT ?auto_3245388 ?auto_3245385 ) ( OBJ-AT ?auto_3245389 ?auto_3245385 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3245387 ?auto_3245386 ?auto_3245385 )
      ( DELIVER-4PKG-VERIFY ?auto_3245386 ?auto_3245387 ?auto_3245388 ?auto_3245389 ?auto_3245385 ) )
  )

)

