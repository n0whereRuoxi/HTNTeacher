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
      ?auto_13453 - OBJ
      ?auto_13452 - LOCATION
    )
    :vars
    (
      ?auto_13455 - LOCATION
      ?auto_13456 - CITY
      ?auto_13454 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13455 ?auto_13456 ) ( IN-CITY ?auto_13452 ?auto_13456 ) ( not ( = ?auto_13452 ?auto_13455 ) ) ( OBJ-AT ?auto_13453 ?auto_13455 ) ( TRUCK-AT ?auto_13454 ?auto_13452 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13454 ?auto_13452 ?auto_13455 ?auto_13456 )
      ( !LOAD-TRUCK ?auto_13453 ?auto_13454 ?auto_13455 )
      ( !DRIVE-TRUCK ?auto_13454 ?auto_13455 ?auto_13452 ?auto_13456 )
      ( !UNLOAD-TRUCK ?auto_13453 ?auto_13454 ?auto_13452 )
      ( DELIVER-1PKG-VERIFY ?auto_13453 ?auto_13452 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13474 - OBJ
      ?auto_13475 - OBJ
      ?auto_13473 - LOCATION
    )
    :vars
    (
      ?auto_13476 - LOCATION
      ?auto_13478 - CITY
      ?auto_13479 - LOCATION
      ?auto_13477 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13476 ?auto_13478 ) ( IN-CITY ?auto_13473 ?auto_13478 ) ( not ( = ?auto_13473 ?auto_13476 ) ) ( OBJ-AT ?auto_13475 ?auto_13476 ) ( IN-CITY ?auto_13479 ?auto_13478 ) ( not ( = ?auto_13473 ?auto_13479 ) ) ( OBJ-AT ?auto_13474 ?auto_13479 ) ( TRUCK-AT ?auto_13477 ?auto_13473 ) ( not ( = ?auto_13474 ?auto_13475 ) ) ( not ( = ?auto_13476 ?auto_13479 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13474 ?auto_13473 )
      ( DELIVER-1PKG ?auto_13475 ?auto_13473 )
      ( DELIVER-2PKG-VERIFY ?auto_13474 ?auto_13475 ?auto_13473 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13585 - OBJ
      ?auto_13586 - OBJ
      ?auto_13587 - OBJ
      ?auto_13584 - LOCATION
    )
    :vars
    (
      ?auto_13590 - LOCATION
      ?auto_13588 - CITY
      ?auto_13592 - LOCATION
      ?auto_13591 - LOCATION
      ?auto_13589 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13590 ?auto_13588 ) ( IN-CITY ?auto_13584 ?auto_13588 ) ( not ( = ?auto_13584 ?auto_13590 ) ) ( OBJ-AT ?auto_13587 ?auto_13590 ) ( IN-CITY ?auto_13592 ?auto_13588 ) ( not ( = ?auto_13584 ?auto_13592 ) ) ( OBJ-AT ?auto_13586 ?auto_13592 ) ( IN-CITY ?auto_13591 ?auto_13588 ) ( not ( = ?auto_13584 ?auto_13591 ) ) ( OBJ-AT ?auto_13585 ?auto_13591 ) ( TRUCK-AT ?auto_13589 ?auto_13584 ) ( not ( = ?auto_13585 ?auto_13586 ) ) ( not ( = ?auto_13592 ?auto_13591 ) ) ( not ( = ?auto_13585 ?auto_13587 ) ) ( not ( = ?auto_13586 ?auto_13587 ) ) ( not ( = ?auto_13590 ?auto_13592 ) ) ( not ( = ?auto_13590 ?auto_13591 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13585 ?auto_13586 ?auto_13584 )
      ( DELIVER-1PKG ?auto_13587 ?auto_13584 )
      ( DELIVER-3PKG-VERIFY ?auto_13585 ?auto_13586 ?auto_13587 ?auto_13584 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14719 - OBJ
      ?auto_14720 - OBJ
      ?auto_14721 - OBJ
      ?auto_14722 - OBJ
      ?auto_14718 - LOCATION
    )
    :vars
    (
      ?auto_14723 - LOCATION
      ?auto_14725 - CITY
      ?auto_14727 - LOCATION
      ?auto_14726 - LOCATION
      ?auto_14724 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14723 ?auto_14725 ) ( IN-CITY ?auto_14718 ?auto_14725 ) ( not ( = ?auto_14718 ?auto_14723 ) ) ( OBJ-AT ?auto_14722 ?auto_14723 ) ( IN-CITY ?auto_14727 ?auto_14725 ) ( not ( = ?auto_14718 ?auto_14727 ) ) ( OBJ-AT ?auto_14721 ?auto_14727 ) ( IN-CITY ?auto_14726 ?auto_14725 ) ( not ( = ?auto_14718 ?auto_14726 ) ) ( OBJ-AT ?auto_14720 ?auto_14726 ) ( OBJ-AT ?auto_14719 ?auto_14723 ) ( TRUCK-AT ?auto_14724 ?auto_14718 ) ( not ( = ?auto_14719 ?auto_14720 ) ) ( not ( = ?auto_14726 ?auto_14723 ) ) ( not ( = ?auto_14719 ?auto_14721 ) ) ( not ( = ?auto_14720 ?auto_14721 ) ) ( not ( = ?auto_14727 ?auto_14726 ) ) ( not ( = ?auto_14727 ?auto_14723 ) ) ( not ( = ?auto_14719 ?auto_14722 ) ) ( not ( = ?auto_14720 ?auto_14722 ) ) ( not ( = ?auto_14721 ?auto_14722 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_14719 ?auto_14720 ?auto_14721 ?auto_14718 )
      ( DELIVER-1PKG ?auto_14722 ?auto_14718 )
      ( DELIVER-4PKG-VERIFY ?auto_14719 ?auto_14720 ?auto_14721 ?auto_14722 ?auto_14718 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14751 - OBJ
      ?auto_14752 - OBJ
      ?auto_14753 - OBJ
      ?auto_14754 - OBJ
      ?auto_14750 - LOCATION
    )
    :vars
    (
      ?auto_14758 - LOCATION
      ?auto_14756 - CITY
      ?auto_14757 - LOCATION
      ?auto_14759 - LOCATION
      ?auto_14755 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14758 ?auto_14756 ) ( IN-CITY ?auto_14750 ?auto_14756 ) ( not ( = ?auto_14750 ?auto_14758 ) ) ( OBJ-AT ?auto_14753 ?auto_14758 ) ( IN-CITY ?auto_14757 ?auto_14756 ) ( not ( = ?auto_14750 ?auto_14757 ) ) ( OBJ-AT ?auto_14754 ?auto_14757 ) ( IN-CITY ?auto_14759 ?auto_14756 ) ( not ( = ?auto_14750 ?auto_14759 ) ) ( OBJ-AT ?auto_14752 ?auto_14759 ) ( OBJ-AT ?auto_14751 ?auto_14758 ) ( TRUCK-AT ?auto_14755 ?auto_14750 ) ( not ( = ?auto_14751 ?auto_14752 ) ) ( not ( = ?auto_14759 ?auto_14758 ) ) ( not ( = ?auto_14751 ?auto_14754 ) ) ( not ( = ?auto_14752 ?auto_14754 ) ) ( not ( = ?auto_14757 ?auto_14759 ) ) ( not ( = ?auto_14757 ?auto_14758 ) ) ( not ( = ?auto_14751 ?auto_14753 ) ) ( not ( = ?auto_14752 ?auto_14753 ) ) ( not ( = ?auto_14754 ?auto_14753 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_14751 ?auto_14752 ?auto_14754 ?auto_14753 ?auto_14750 )
      ( DELIVER-4PKG-VERIFY ?auto_14751 ?auto_14752 ?auto_14753 ?auto_14754 ?auto_14750 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14905 - OBJ
      ?auto_14906 - OBJ
      ?auto_14907 - OBJ
      ?auto_14908 - OBJ
      ?auto_14904 - LOCATION
    )
    :vars
    (
      ?auto_14913 - LOCATION
      ?auto_14911 - CITY
      ?auto_14912 - LOCATION
      ?auto_14910 - LOCATION
      ?auto_14909 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14913 ?auto_14911 ) ( IN-CITY ?auto_14904 ?auto_14911 ) ( not ( = ?auto_14904 ?auto_14913 ) ) ( OBJ-AT ?auto_14906 ?auto_14913 ) ( IN-CITY ?auto_14912 ?auto_14911 ) ( not ( = ?auto_14904 ?auto_14912 ) ) ( OBJ-AT ?auto_14908 ?auto_14912 ) ( IN-CITY ?auto_14910 ?auto_14911 ) ( not ( = ?auto_14904 ?auto_14910 ) ) ( OBJ-AT ?auto_14907 ?auto_14910 ) ( OBJ-AT ?auto_14905 ?auto_14913 ) ( TRUCK-AT ?auto_14909 ?auto_14904 ) ( not ( = ?auto_14905 ?auto_14907 ) ) ( not ( = ?auto_14910 ?auto_14913 ) ) ( not ( = ?auto_14905 ?auto_14908 ) ) ( not ( = ?auto_14907 ?auto_14908 ) ) ( not ( = ?auto_14912 ?auto_14910 ) ) ( not ( = ?auto_14912 ?auto_14913 ) ) ( not ( = ?auto_14905 ?auto_14906 ) ) ( not ( = ?auto_14907 ?auto_14906 ) ) ( not ( = ?auto_14908 ?auto_14906 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_14905 ?auto_14907 ?auto_14906 ?auto_14908 ?auto_14904 )
      ( DELIVER-4PKG-VERIFY ?auto_14905 ?auto_14906 ?auto_14907 ?auto_14908 ?auto_14904 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15032 - OBJ
      ?auto_15033 - OBJ
      ?auto_15034 - OBJ
      ?auto_15035 - OBJ
      ?auto_15031 - LOCATION
    )
    :vars
    (
      ?auto_15040 - LOCATION
      ?auto_15038 - CITY
      ?auto_15039 - LOCATION
      ?auto_15037 - LOCATION
      ?auto_15036 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15040 ?auto_15038 ) ( IN-CITY ?auto_15031 ?auto_15038 ) ( not ( = ?auto_15031 ?auto_15040 ) ) ( OBJ-AT ?auto_15035 ?auto_15040 ) ( IN-CITY ?auto_15039 ?auto_15038 ) ( not ( = ?auto_15031 ?auto_15039 ) ) ( OBJ-AT ?auto_15034 ?auto_15039 ) ( IN-CITY ?auto_15037 ?auto_15038 ) ( not ( = ?auto_15031 ?auto_15037 ) ) ( OBJ-AT ?auto_15032 ?auto_15037 ) ( OBJ-AT ?auto_15033 ?auto_15040 ) ( TRUCK-AT ?auto_15036 ?auto_15031 ) ( not ( = ?auto_15033 ?auto_15032 ) ) ( not ( = ?auto_15037 ?auto_15040 ) ) ( not ( = ?auto_15033 ?auto_15034 ) ) ( not ( = ?auto_15032 ?auto_15034 ) ) ( not ( = ?auto_15039 ?auto_15037 ) ) ( not ( = ?auto_15039 ?auto_15040 ) ) ( not ( = ?auto_15033 ?auto_15035 ) ) ( not ( = ?auto_15032 ?auto_15035 ) ) ( not ( = ?auto_15034 ?auto_15035 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15033 ?auto_15032 ?auto_15035 ?auto_15034 ?auto_15031 )
      ( DELIVER-4PKG-VERIFY ?auto_15032 ?auto_15033 ?auto_15034 ?auto_15035 ?auto_15031 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15064 - OBJ
      ?auto_15065 - OBJ
      ?auto_15066 - OBJ
      ?auto_15067 - OBJ
      ?auto_15063 - LOCATION
    )
    :vars
    (
      ?auto_15072 - LOCATION
      ?auto_15070 - CITY
      ?auto_15071 - LOCATION
      ?auto_15069 - LOCATION
      ?auto_15068 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15072 ?auto_15070 ) ( IN-CITY ?auto_15063 ?auto_15070 ) ( not ( = ?auto_15063 ?auto_15072 ) ) ( OBJ-AT ?auto_15066 ?auto_15072 ) ( IN-CITY ?auto_15071 ?auto_15070 ) ( not ( = ?auto_15063 ?auto_15071 ) ) ( OBJ-AT ?auto_15067 ?auto_15071 ) ( IN-CITY ?auto_15069 ?auto_15070 ) ( not ( = ?auto_15063 ?auto_15069 ) ) ( OBJ-AT ?auto_15064 ?auto_15069 ) ( OBJ-AT ?auto_15065 ?auto_15072 ) ( TRUCK-AT ?auto_15068 ?auto_15063 ) ( not ( = ?auto_15065 ?auto_15064 ) ) ( not ( = ?auto_15069 ?auto_15072 ) ) ( not ( = ?auto_15065 ?auto_15067 ) ) ( not ( = ?auto_15064 ?auto_15067 ) ) ( not ( = ?auto_15071 ?auto_15069 ) ) ( not ( = ?auto_15071 ?auto_15072 ) ) ( not ( = ?auto_15065 ?auto_15066 ) ) ( not ( = ?auto_15064 ?auto_15066 ) ) ( not ( = ?auto_15067 ?auto_15066 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15065 ?auto_15064 ?auto_15066 ?auto_15067 ?auto_15063 )
      ( DELIVER-4PKG-VERIFY ?auto_15064 ?auto_15065 ?auto_15066 ?auto_15067 ?auto_15063 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15165 - OBJ
      ?auto_15166 - OBJ
      ?auto_15167 - OBJ
      ?auto_15168 - OBJ
      ?auto_15164 - LOCATION
    )
    :vars
    (
      ?auto_15173 - LOCATION
      ?auto_15171 - CITY
      ?auto_15172 - LOCATION
      ?auto_15170 - LOCATION
      ?auto_15169 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15173 ?auto_15171 ) ( IN-CITY ?auto_15164 ?auto_15171 ) ( not ( = ?auto_15164 ?auto_15173 ) ) ( OBJ-AT ?auto_15168 ?auto_15173 ) ( IN-CITY ?auto_15172 ?auto_15171 ) ( not ( = ?auto_15164 ?auto_15172 ) ) ( OBJ-AT ?auto_15166 ?auto_15172 ) ( IN-CITY ?auto_15170 ?auto_15171 ) ( not ( = ?auto_15164 ?auto_15170 ) ) ( OBJ-AT ?auto_15165 ?auto_15170 ) ( OBJ-AT ?auto_15167 ?auto_15173 ) ( TRUCK-AT ?auto_15169 ?auto_15164 ) ( not ( = ?auto_15167 ?auto_15165 ) ) ( not ( = ?auto_15170 ?auto_15173 ) ) ( not ( = ?auto_15167 ?auto_15166 ) ) ( not ( = ?auto_15165 ?auto_15166 ) ) ( not ( = ?auto_15172 ?auto_15170 ) ) ( not ( = ?auto_15172 ?auto_15173 ) ) ( not ( = ?auto_15167 ?auto_15168 ) ) ( not ( = ?auto_15165 ?auto_15168 ) ) ( not ( = ?auto_15166 ?auto_15168 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15167 ?auto_15165 ?auto_15168 ?auto_15166 ?auto_15164 )
      ( DELIVER-4PKG-VERIFY ?auto_15165 ?auto_15166 ?auto_15167 ?auto_15168 ?auto_15164 ) )
  )

)

