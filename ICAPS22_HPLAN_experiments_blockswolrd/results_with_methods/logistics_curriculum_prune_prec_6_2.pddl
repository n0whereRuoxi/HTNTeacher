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

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1633666 - OBJ
      ?auto_1633665 - LOCATION
    )
    :vars
    (
      ?auto_1633668 - LOCATION
      ?auto_1633669 - CITY
      ?auto_1633667 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1633668 ?auto_1633669 ) ( IN-CITY ?auto_1633665 ?auto_1633669 ) ( not ( = ?auto_1633665 ?auto_1633668 ) ) ( OBJ-AT ?auto_1633666 ?auto_1633668 ) ( TRUCK-AT ?auto_1633667 ?auto_1633665 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1633667 ?auto_1633665 ?auto_1633668 ?auto_1633669 )
      ( !LOAD-TRUCK ?auto_1633666 ?auto_1633667 ?auto_1633668 )
      ( !DRIVE-TRUCK ?auto_1633667 ?auto_1633668 ?auto_1633665 ?auto_1633669 )
      ( !UNLOAD-TRUCK ?auto_1633666 ?auto_1633667 ?auto_1633665 )
      ( DELIVER-1PKG-VERIFY ?auto_1633666 ?auto_1633665 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1633687 - OBJ
      ?auto_1633688 - OBJ
      ?auto_1633686 - LOCATION
    )
    :vars
    (
      ?auto_1633690 - LOCATION
      ?auto_1633691 - CITY
      ?auto_1633692 - LOCATION
      ?auto_1633689 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1633690 ?auto_1633691 ) ( IN-CITY ?auto_1633686 ?auto_1633691 ) ( not ( = ?auto_1633686 ?auto_1633690 ) ) ( OBJ-AT ?auto_1633688 ?auto_1633690 ) ( IN-CITY ?auto_1633692 ?auto_1633691 ) ( not ( = ?auto_1633686 ?auto_1633692 ) ) ( OBJ-AT ?auto_1633687 ?auto_1633692 ) ( TRUCK-AT ?auto_1633689 ?auto_1633686 ) ( not ( = ?auto_1633687 ?auto_1633688 ) ) ( not ( = ?auto_1633690 ?auto_1633692 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1633687 ?auto_1633686 )
      ( DELIVER-1PKG ?auto_1633688 ?auto_1633686 )
      ( DELIVER-2PKG-VERIFY ?auto_1633687 ?auto_1633688 ?auto_1633686 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1633798 - OBJ
      ?auto_1633799 - OBJ
      ?auto_1633800 - OBJ
      ?auto_1633797 - LOCATION
    )
    :vars
    (
      ?auto_1633803 - LOCATION
      ?auto_1633801 - CITY
      ?auto_1633805 - LOCATION
      ?auto_1633804 - LOCATION
      ?auto_1633802 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1633803 ?auto_1633801 ) ( IN-CITY ?auto_1633797 ?auto_1633801 ) ( not ( = ?auto_1633797 ?auto_1633803 ) ) ( OBJ-AT ?auto_1633800 ?auto_1633803 ) ( IN-CITY ?auto_1633805 ?auto_1633801 ) ( not ( = ?auto_1633797 ?auto_1633805 ) ) ( OBJ-AT ?auto_1633799 ?auto_1633805 ) ( IN-CITY ?auto_1633804 ?auto_1633801 ) ( not ( = ?auto_1633797 ?auto_1633804 ) ) ( OBJ-AT ?auto_1633798 ?auto_1633804 ) ( TRUCK-AT ?auto_1633802 ?auto_1633797 ) ( not ( = ?auto_1633798 ?auto_1633799 ) ) ( not ( = ?auto_1633805 ?auto_1633804 ) ) ( not ( = ?auto_1633798 ?auto_1633800 ) ) ( not ( = ?auto_1633799 ?auto_1633800 ) ) ( not ( = ?auto_1633803 ?auto_1633805 ) ) ( not ( = ?auto_1633803 ?auto_1633804 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1633798 ?auto_1633799 ?auto_1633797 )
      ( DELIVER-1PKG ?auto_1633800 ?auto_1633797 )
      ( DELIVER-3PKG-VERIFY ?auto_1633798 ?auto_1633799 ?auto_1633800 ?auto_1633797 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1634941 - OBJ
      ?auto_1634942 - OBJ
      ?auto_1634943 - OBJ
      ?auto_1634944 - OBJ
      ?auto_1634940 - LOCATION
    )
    :vars
    (
      ?auto_1634946 - LOCATION
      ?auto_1634945 - CITY
      ?auto_1634949 - LOCATION
      ?auto_1634950 - LOCATION
      ?auto_1634948 - LOCATION
      ?auto_1634947 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1634946 ?auto_1634945 ) ( IN-CITY ?auto_1634940 ?auto_1634945 ) ( not ( = ?auto_1634940 ?auto_1634946 ) ) ( OBJ-AT ?auto_1634944 ?auto_1634946 ) ( IN-CITY ?auto_1634949 ?auto_1634945 ) ( not ( = ?auto_1634940 ?auto_1634949 ) ) ( OBJ-AT ?auto_1634943 ?auto_1634949 ) ( IN-CITY ?auto_1634950 ?auto_1634945 ) ( not ( = ?auto_1634940 ?auto_1634950 ) ) ( OBJ-AT ?auto_1634942 ?auto_1634950 ) ( IN-CITY ?auto_1634948 ?auto_1634945 ) ( not ( = ?auto_1634940 ?auto_1634948 ) ) ( OBJ-AT ?auto_1634941 ?auto_1634948 ) ( TRUCK-AT ?auto_1634947 ?auto_1634940 ) ( not ( = ?auto_1634941 ?auto_1634942 ) ) ( not ( = ?auto_1634950 ?auto_1634948 ) ) ( not ( = ?auto_1634941 ?auto_1634943 ) ) ( not ( = ?auto_1634942 ?auto_1634943 ) ) ( not ( = ?auto_1634949 ?auto_1634950 ) ) ( not ( = ?auto_1634949 ?auto_1634948 ) ) ( not ( = ?auto_1634941 ?auto_1634944 ) ) ( not ( = ?auto_1634942 ?auto_1634944 ) ) ( not ( = ?auto_1634943 ?auto_1634944 ) ) ( not ( = ?auto_1634946 ?auto_1634949 ) ) ( not ( = ?auto_1634946 ?auto_1634950 ) ) ( not ( = ?auto_1634946 ?auto_1634948 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1634941 ?auto_1634942 ?auto_1634943 ?auto_1634940 )
      ( DELIVER-1PKG ?auto_1634944 ?auto_1634940 )
      ( DELIVER-4PKG-VERIFY ?auto_1634941 ?auto_1634942 ?auto_1634943 ?auto_1634944 ?auto_1634940 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1650551 - OBJ
      ?auto_1650552 - OBJ
      ?auto_1650553 - OBJ
      ?auto_1650554 - OBJ
      ?auto_1650555 - OBJ
      ?auto_1650550 - LOCATION
    )
    :vars
    (
      ?auto_1650556 - LOCATION
      ?auto_1650557 - CITY
      ?auto_1650561 - LOCATION
      ?auto_1650560 - LOCATION
      ?auto_1650559 - LOCATION
      ?auto_1650558 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1650556 ?auto_1650557 ) ( IN-CITY ?auto_1650550 ?auto_1650557 ) ( not ( = ?auto_1650550 ?auto_1650556 ) ) ( OBJ-AT ?auto_1650555 ?auto_1650556 ) ( OBJ-AT ?auto_1650554 ?auto_1650556 ) ( IN-CITY ?auto_1650561 ?auto_1650557 ) ( not ( = ?auto_1650550 ?auto_1650561 ) ) ( OBJ-AT ?auto_1650553 ?auto_1650561 ) ( IN-CITY ?auto_1650560 ?auto_1650557 ) ( not ( = ?auto_1650550 ?auto_1650560 ) ) ( OBJ-AT ?auto_1650552 ?auto_1650560 ) ( IN-CITY ?auto_1650559 ?auto_1650557 ) ( not ( = ?auto_1650550 ?auto_1650559 ) ) ( OBJ-AT ?auto_1650551 ?auto_1650559 ) ( TRUCK-AT ?auto_1650558 ?auto_1650550 ) ( not ( = ?auto_1650551 ?auto_1650552 ) ) ( not ( = ?auto_1650560 ?auto_1650559 ) ) ( not ( = ?auto_1650551 ?auto_1650553 ) ) ( not ( = ?auto_1650552 ?auto_1650553 ) ) ( not ( = ?auto_1650561 ?auto_1650560 ) ) ( not ( = ?auto_1650561 ?auto_1650559 ) ) ( not ( = ?auto_1650551 ?auto_1650554 ) ) ( not ( = ?auto_1650552 ?auto_1650554 ) ) ( not ( = ?auto_1650553 ?auto_1650554 ) ) ( not ( = ?auto_1650556 ?auto_1650561 ) ) ( not ( = ?auto_1650556 ?auto_1650560 ) ) ( not ( = ?auto_1650556 ?auto_1650559 ) ) ( not ( = ?auto_1650551 ?auto_1650555 ) ) ( not ( = ?auto_1650552 ?auto_1650555 ) ) ( not ( = ?auto_1650553 ?auto_1650555 ) ) ( not ( = ?auto_1650554 ?auto_1650555 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1650551 ?auto_1650552 ?auto_1650553 ?auto_1650554 ?auto_1650550 )
      ( DELIVER-1PKG ?auto_1650555 ?auto_1650550 )
      ( DELIVER-5PKG-VERIFY ?auto_1650551 ?auto_1650552 ?auto_1650553 ?auto_1650554 ?auto_1650555 ?auto_1650550 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1650647 - OBJ
      ?auto_1650648 - OBJ
      ?auto_1650649 - OBJ
      ?auto_1650650 - OBJ
      ?auto_1650651 - OBJ
      ?auto_1650646 - LOCATION
    )
    :vars
    (
      ?auto_1650656 - LOCATION
      ?auto_1650655 - CITY
      ?auto_1650653 - LOCATION
      ?auto_1650652 - LOCATION
      ?auto_1650657 - LOCATION
      ?auto_1650654 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1650656 ?auto_1650655 ) ( IN-CITY ?auto_1650646 ?auto_1650655 ) ( not ( = ?auto_1650646 ?auto_1650656 ) ) ( OBJ-AT ?auto_1650651 ?auto_1650656 ) ( OBJ-AT ?auto_1650649 ?auto_1650656 ) ( IN-CITY ?auto_1650653 ?auto_1650655 ) ( not ( = ?auto_1650646 ?auto_1650653 ) ) ( OBJ-AT ?auto_1650650 ?auto_1650653 ) ( IN-CITY ?auto_1650652 ?auto_1650655 ) ( not ( = ?auto_1650646 ?auto_1650652 ) ) ( OBJ-AT ?auto_1650648 ?auto_1650652 ) ( IN-CITY ?auto_1650657 ?auto_1650655 ) ( not ( = ?auto_1650646 ?auto_1650657 ) ) ( OBJ-AT ?auto_1650647 ?auto_1650657 ) ( TRUCK-AT ?auto_1650654 ?auto_1650646 ) ( not ( = ?auto_1650647 ?auto_1650648 ) ) ( not ( = ?auto_1650652 ?auto_1650657 ) ) ( not ( = ?auto_1650647 ?auto_1650650 ) ) ( not ( = ?auto_1650648 ?auto_1650650 ) ) ( not ( = ?auto_1650653 ?auto_1650652 ) ) ( not ( = ?auto_1650653 ?auto_1650657 ) ) ( not ( = ?auto_1650647 ?auto_1650649 ) ) ( not ( = ?auto_1650648 ?auto_1650649 ) ) ( not ( = ?auto_1650650 ?auto_1650649 ) ) ( not ( = ?auto_1650656 ?auto_1650653 ) ) ( not ( = ?auto_1650656 ?auto_1650652 ) ) ( not ( = ?auto_1650656 ?auto_1650657 ) ) ( not ( = ?auto_1650647 ?auto_1650651 ) ) ( not ( = ?auto_1650648 ?auto_1650651 ) ) ( not ( = ?auto_1650650 ?auto_1650651 ) ) ( not ( = ?auto_1650649 ?auto_1650651 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1650647 ?auto_1650648 ?auto_1650650 ?auto_1650649 ?auto_1650651 ?auto_1650646 )
      ( DELIVER-5PKG-VERIFY ?auto_1650647 ?auto_1650648 ?auto_1650649 ?auto_1650650 ?auto_1650651 ?auto_1650646 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1650698 - OBJ
      ?auto_1650699 - OBJ
      ?auto_1650700 - OBJ
      ?auto_1650701 - OBJ
      ?auto_1650702 - OBJ
      ?auto_1650697 - LOCATION
    )
    :vars
    (
      ?auto_1650708 - LOCATION
      ?auto_1650706 - CITY
      ?auto_1650704 - LOCATION
      ?auto_1650707 - LOCATION
      ?auto_1650703 - LOCATION
      ?auto_1650705 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1650708 ?auto_1650706 ) ( IN-CITY ?auto_1650697 ?auto_1650706 ) ( not ( = ?auto_1650697 ?auto_1650708 ) ) ( OBJ-AT ?auto_1650701 ?auto_1650708 ) ( OBJ-AT ?auto_1650700 ?auto_1650708 ) ( IN-CITY ?auto_1650704 ?auto_1650706 ) ( not ( = ?auto_1650697 ?auto_1650704 ) ) ( OBJ-AT ?auto_1650702 ?auto_1650704 ) ( IN-CITY ?auto_1650707 ?auto_1650706 ) ( not ( = ?auto_1650697 ?auto_1650707 ) ) ( OBJ-AT ?auto_1650699 ?auto_1650707 ) ( IN-CITY ?auto_1650703 ?auto_1650706 ) ( not ( = ?auto_1650697 ?auto_1650703 ) ) ( OBJ-AT ?auto_1650698 ?auto_1650703 ) ( TRUCK-AT ?auto_1650705 ?auto_1650697 ) ( not ( = ?auto_1650698 ?auto_1650699 ) ) ( not ( = ?auto_1650707 ?auto_1650703 ) ) ( not ( = ?auto_1650698 ?auto_1650702 ) ) ( not ( = ?auto_1650699 ?auto_1650702 ) ) ( not ( = ?auto_1650704 ?auto_1650707 ) ) ( not ( = ?auto_1650704 ?auto_1650703 ) ) ( not ( = ?auto_1650698 ?auto_1650700 ) ) ( not ( = ?auto_1650699 ?auto_1650700 ) ) ( not ( = ?auto_1650702 ?auto_1650700 ) ) ( not ( = ?auto_1650708 ?auto_1650704 ) ) ( not ( = ?auto_1650708 ?auto_1650707 ) ) ( not ( = ?auto_1650708 ?auto_1650703 ) ) ( not ( = ?auto_1650698 ?auto_1650701 ) ) ( not ( = ?auto_1650699 ?auto_1650701 ) ) ( not ( = ?auto_1650702 ?auto_1650701 ) ) ( not ( = ?auto_1650700 ?auto_1650701 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1650698 ?auto_1650699 ?auto_1650700 ?auto_1650702 ?auto_1650701 ?auto_1650697 )
      ( DELIVER-5PKG-VERIFY ?auto_1650698 ?auto_1650699 ?auto_1650700 ?auto_1650701 ?auto_1650702 ?auto_1650697 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1651974 - OBJ
      ?auto_1651975 - OBJ
      ?auto_1651976 - OBJ
      ?auto_1651977 - OBJ
      ?auto_1651978 - OBJ
      ?auto_1651973 - LOCATION
    )
    :vars
    (
      ?auto_1651984 - LOCATION
      ?auto_1651982 - CITY
      ?auto_1651980 - LOCATION
      ?auto_1651983 - LOCATION
      ?auto_1651979 - LOCATION
      ?auto_1651981 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1651984 ?auto_1651982 ) ( IN-CITY ?auto_1651973 ?auto_1651982 ) ( not ( = ?auto_1651973 ?auto_1651984 ) ) ( OBJ-AT ?auto_1651978 ?auto_1651984 ) ( OBJ-AT ?auto_1651975 ?auto_1651984 ) ( IN-CITY ?auto_1651980 ?auto_1651982 ) ( not ( = ?auto_1651973 ?auto_1651980 ) ) ( OBJ-AT ?auto_1651977 ?auto_1651980 ) ( IN-CITY ?auto_1651983 ?auto_1651982 ) ( not ( = ?auto_1651973 ?auto_1651983 ) ) ( OBJ-AT ?auto_1651976 ?auto_1651983 ) ( IN-CITY ?auto_1651979 ?auto_1651982 ) ( not ( = ?auto_1651973 ?auto_1651979 ) ) ( OBJ-AT ?auto_1651974 ?auto_1651979 ) ( TRUCK-AT ?auto_1651981 ?auto_1651973 ) ( not ( = ?auto_1651974 ?auto_1651976 ) ) ( not ( = ?auto_1651983 ?auto_1651979 ) ) ( not ( = ?auto_1651974 ?auto_1651977 ) ) ( not ( = ?auto_1651976 ?auto_1651977 ) ) ( not ( = ?auto_1651980 ?auto_1651983 ) ) ( not ( = ?auto_1651980 ?auto_1651979 ) ) ( not ( = ?auto_1651974 ?auto_1651975 ) ) ( not ( = ?auto_1651976 ?auto_1651975 ) ) ( not ( = ?auto_1651977 ?auto_1651975 ) ) ( not ( = ?auto_1651984 ?auto_1651980 ) ) ( not ( = ?auto_1651984 ?auto_1651983 ) ) ( not ( = ?auto_1651984 ?auto_1651979 ) ) ( not ( = ?auto_1651974 ?auto_1651978 ) ) ( not ( = ?auto_1651976 ?auto_1651978 ) ) ( not ( = ?auto_1651977 ?auto_1651978 ) ) ( not ( = ?auto_1651975 ?auto_1651978 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1651974 ?auto_1651976 ?auto_1651975 ?auto_1651977 ?auto_1651978 ?auto_1651973 )
      ( DELIVER-5PKG-VERIFY ?auto_1651974 ?auto_1651975 ?auto_1651976 ?auto_1651977 ?auto_1651978 ?auto_1651973 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1652025 - OBJ
      ?auto_1652026 - OBJ
      ?auto_1652027 - OBJ
      ?auto_1652028 - OBJ
      ?auto_1652029 - OBJ
      ?auto_1652024 - LOCATION
    )
    :vars
    (
      ?auto_1652035 - LOCATION
      ?auto_1652033 - CITY
      ?auto_1652031 - LOCATION
      ?auto_1652034 - LOCATION
      ?auto_1652030 - LOCATION
      ?auto_1652032 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1652035 ?auto_1652033 ) ( IN-CITY ?auto_1652024 ?auto_1652033 ) ( not ( = ?auto_1652024 ?auto_1652035 ) ) ( OBJ-AT ?auto_1652028 ?auto_1652035 ) ( OBJ-AT ?auto_1652026 ?auto_1652035 ) ( IN-CITY ?auto_1652031 ?auto_1652033 ) ( not ( = ?auto_1652024 ?auto_1652031 ) ) ( OBJ-AT ?auto_1652029 ?auto_1652031 ) ( IN-CITY ?auto_1652034 ?auto_1652033 ) ( not ( = ?auto_1652024 ?auto_1652034 ) ) ( OBJ-AT ?auto_1652027 ?auto_1652034 ) ( IN-CITY ?auto_1652030 ?auto_1652033 ) ( not ( = ?auto_1652024 ?auto_1652030 ) ) ( OBJ-AT ?auto_1652025 ?auto_1652030 ) ( TRUCK-AT ?auto_1652032 ?auto_1652024 ) ( not ( = ?auto_1652025 ?auto_1652027 ) ) ( not ( = ?auto_1652034 ?auto_1652030 ) ) ( not ( = ?auto_1652025 ?auto_1652029 ) ) ( not ( = ?auto_1652027 ?auto_1652029 ) ) ( not ( = ?auto_1652031 ?auto_1652034 ) ) ( not ( = ?auto_1652031 ?auto_1652030 ) ) ( not ( = ?auto_1652025 ?auto_1652026 ) ) ( not ( = ?auto_1652027 ?auto_1652026 ) ) ( not ( = ?auto_1652029 ?auto_1652026 ) ) ( not ( = ?auto_1652035 ?auto_1652031 ) ) ( not ( = ?auto_1652035 ?auto_1652034 ) ) ( not ( = ?auto_1652035 ?auto_1652030 ) ) ( not ( = ?auto_1652025 ?auto_1652028 ) ) ( not ( = ?auto_1652027 ?auto_1652028 ) ) ( not ( = ?auto_1652029 ?auto_1652028 ) ) ( not ( = ?auto_1652026 ?auto_1652028 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1652025 ?auto_1652027 ?auto_1652026 ?auto_1652029 ?auto_1652028 ?auto_1652024 )
      ( DELIVER-5PKG-VERIFY ?auto_1652025 ?auto_1652026 ?auto_1652027 ?auto_1652028 ?auto_1652029 ?auto_1652024 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1652382 - OBJ
      ?auto_1652383 - OBJ
      ?auto_1652384 - OBJ
      ?auto_1652385 - OBJ
      ?auto_1652386 - OBJ
      ?auto_1652381 - LOCATION
    )
    :vars
    (
      ?auto_1652392 - LOCATION
      ?auto_1652390 - CITY
      ?auto_1652388 - LOCATION
      ?auto_1652391 - LOCATION
      ?auto_1652387 - LOCATION
      ?auto_1652389 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1652392 ?auto_1652390 ) ( IN-CITY ?auto_1652381 ?auto_1652390 ) ( not ( = ?auto_1652381 ?auto_1652392 ) ) ( OBJ-AT ?auto_1652384 ?auto_1652392 ) ( OBJ-AT ?auto_1652383 ?auto_1652392 ) ( IN-CITY ?auto_1652388 ?auto_1652390 ) ( not ( = ?auto_1652381 ?auto_1652388 ) ) ( OBJ-AT ?auto_1652386 ?auto_1652388 ) ( IN-CITY ?auto_1652391 ?auto_1652390 ) ( not ( = ?auto_1652381 ?auto_1652391 ) ) ( OBJ-AT ?auto_1652385 ?auto_1652391 ) ( IN-CITY ?auto_1652387 ?auto_1652390 ) ( not ( = ?auto_1652381 ?auto_1652387 ) ) ( OBJ-AT ?auto_1652382 ?auto_1652387 ) ( TRUCK-AT ?auto_1652389 ?auto_1652381 ) ( not ( = ?auto_1652382 ?auto_1652385 ) ) ( not ( = ?auto_1652391 ?auto_1652387 ) ) ( not ( = ?auto_1652382 ?auto_1652386 ) ) ( not ( = ?auto_1652385 ?auto_1652386 ) ) ( not ( = ?auto_1652388 ?auto_1652391 ) ) ( not ( = ?auto_1652388 ?auto_1652387 ) ) ( not ( = ?auto_1652382 ?auto_1652383 ) ) ( not ( = ?auto_1652385 ?auto_1652383 ) ) ( not ( = ?auto_1652386 ?auto_1652383 ) ) ( not ( = ?auto_1652392 ?auto_1652388 ) ) ( not ( = ?auto_1652392 ?auto_1652391 ) ) ( not ( = ?auto_1652392 ?auto_1652387 ) ) ( not ( = ?auto_1652382 ?auto_1652384 ) ) ( not ( = ?auto_1652385 ?auto_1652384 ) ) ( not ( = ?auto_1652386 ?auto_1652384 ) ) ( not ( = ?auto_1652383 ?auto_1652384 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1652382 ?auto_1652385 ?auto_1652383 ?auto_1652386 ?auto_1652384 ?auto_1652381 )
      ( DELIVER-5PKG-VERIFY ?auto_1652382 ?auto_1652383 ?auto_1652384 ?auto_1652385 ?auto_1652386 ?auto_1652381 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1664036 - OBJ
      ?auto_1664037 - OBJ
      ?auto_1664038 - OBJ
      ?auto_1664039 - OBJ
      ?auto_1664040 - OBJ
      ?auto_1664035 - LOCATION
    )
    :vars
    (
      ?auto_1664046 - LOCATION
      ?auto_1664044 - CITY
      ?auto_1664042 - LOCATION
      ?auto_1664045 - LOCATION
      ?auto_1664041 - LOCATION
      ?auto_1664043 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1664046 ?auto_1664044 ) ( IN-CITY ?auto_1664035 ?auto_1664044 ) ( not ( = ?auto_1664035 ?auto_1664046 ) ) ( OBJ-AT ?auto_1664040 ?auto_1664046 ) ( OBJ-AT ?auto_1664036 ?auto_1664046 ) ( IN-CITY ?auto_1664042 ?auto_1664044 ) ( not ( = ?auto_1664035 ?auto_1664042 ) ) ( OBJ-AT ?auto_1664039 ?auto_1664042 ) ( IN-CITY ?auto_1664045 ?auto_1664044 ) ( not ( = ?auto_1664035 ?auto_1664045 ) ) ( OBJ-AT ?auto_1664038 ?auto_1664045 ) ( IN-CITY ?auto_1664041 ?auto_1664044 ) ( not ( = ?auto_1664035 ?auto_1664041 ) ) ( OBJ-AT ?auto_1664037 ?auto_1664041 ) ( TRUCK-AT ?auto_1664043 ?auto_1664035 ) ( not ( = ?auto_1664037 ?auto_1664038 ) ) ( not ( = ?auto_1664045 ?auto_1664041 ) ) ( not ( = ?auto_1664037 ?auto_1664039 ) ) ( not ( = ?auto_1664038 ?auto_1664039 ) ) ( not ( = ?auto_1664042 ?auto_1664045 ) ) ( not ( = ?auto_1664042 ?auto_1664041 ) ) ( not ( = ?auto_1664037 ?auto_1664036 ) ) ( not ( = ?auto_1664038 ?auto_1664036 ) ) ( not ( = ?auto_1664039 ?auto_1664036 ) ) ( not ( = ?auto_1664046 ?auto_1664042 ) ) ( not ( = ?auto_1664046 ?auto_1664045 ) ) ( not ( = ?auto_1664046 ?auto_1664041 ) ) ( not ( = ?auto_1664037 ?auto_1664040 ) ) ( not ( = ?auto_1664038 ?auto_1664040 ) ) ( not ( = ?auto_1664039 ?auto_1664040 ) ) ( not ( = ?auto_1664036 ?auto_1664040 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1664037 ?auto_1664038 ?auto_1664036 ?auto_1664039 ?auto_1664040 ?auto_1664035 )
      ( DELIVER-5PKG-VERIFY ?auto_1664036 ?auto_1664037 ?auto_1664038 ?auto_1664039 ?auto_1664040 ?auto_1664035 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1664087 - OBJ
      ?auto_1664088 - OBJ
      ?auto_1664089 - OBJ
      ?auto_1664090 - OBJ
      ?auto_1664091 - OBJ
      ?auto_1664086 - LOCATION
    )
    :vars
    (
      ?auto_1664097 - LOCATION
      ?auto_1664095 - CITY
      ?auto_1664093 - LOCATION
      ?auto_1664096 - LOCATION
      ?auto_1664092 - LOCATION
      ?auto_1664094 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1664097 ?auto_1664095 ) ( IN-CITY ?auto_1664086 ?auto_1664095 ) ( not ( = ?auto_1664086 ?auto_1664097 ) ) ( OBJ-AT ?auto_1664090 ?auto_1664097 ) ( OBJ-AT ?auto_1664087 ?auto_1664097 ) ( IN-CITY ?auto_1664093 ?auto_1664095 ) ( not ( = ?auto_1664086 ?auto_1664093 ) ) ( OBJ-AT ?auto_1664091 ?auto_1664093 ) ( IN-CITY ?auto_1664096 ?auto_1664095 ) ( not ( = ?auto_1664086 ?auto_1664096 ) ) ( OBJ-AT ?auto_1664089 ?auto_1664096 ) ( IN-CITY ?auto_1664092 ?auto_1664095 ) ( not ( = ?auto_1664086 ?auto_1664092 ) ) ( OBJ-AT ?auto_1664088 ?auto_1664092 ) ( TRUCK-AT ?auto_1664094 ?auto_1664086 ) ( not ( = ?auto_1664088 ?auto_1664089 ) ) ( not ( = ?auto_1664096 ?auto_1664092 ) ) ( not ( = ?auto_1664088 ?auto_1664091 ) ) ( not ( = ?auto_1664089 ?auto_1664091 ) ) ( not ( = ?auto_1664093 ?auto_1664096 ) ) ( not ( = ?auto_1664093 ?auto_1664092 ) ) ( not ( = ?auto_1664088 ?auto_1664087 ) ) ( not ( = ?auto_1664089 ?auto_1664087 ) ) ( not ( = ?auto_1664091 ?auto_1664087 ) ) ( not ( = ?auto_1664097 ?auto_1664093 ) ) ( not ( = ?auto_1664097 ?auto_1664096 ) ) ( not ( = ?auto_1664097 ?auto_1664092 ) ) ( not ( = ?auto_1664088 ?auto_1664090 ) ) ( not ( = ?auto_1664089 ?auto_1664090 ) ) ( not ( = ?auto_1664091 ?auto_1664090 ) ) ( not ( = ?auto_1664087 ?auto_1664090 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1664088 ?auto_1664089 ?auto_1664087 ?auto_1664091 ?auto_1664090 ?auto_1664086 )
      ( DELIVER-5PKG-VERIFY ?auto_1664087 ?auto_1664088 ?auto_1664089 ?auto_1664090 ?auto_1664091 ?auto_1664086 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1664444 - OBJ
      ?auto_1664445 - OBJ
      ?auto_1664446 - OBJ
      ?auto_1664447 - OBJ
      ?auto_1664448 - OBJ
      ?auto_1664443 - LOCATION
    )
    :vars
    (
      ?auto_1664454 - LOCATION
      ?auto_1664452 - CITY
      ?auto_1664450 - LOCATION
      ?auto_1664453 - LOCATION
      ?auto_1664449 - LOCATION
      ?auto_1664451 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1664454 ?auto_1664452 ) ( IN-CITY ?auto_1664443 ?auto_1664452 ) ( not ( = ?auto_1664443 ?auto_1664454 ) ) ( OBJ-AT ?auto_1664446 ?auto_1664454 ) ( OBJ-AT ?auto_1664444 ?auto_1664454 ) ( IN-CITY ?auto_1664450 ?auto_1664452 ) ( not ( = ?auto_1664443 ?auto_1664450 ) ) ( OBJ-AT ?auto_1664448 ?auto_1664450 ) ( IN-CITY ?auto_1664453 ?auto_1664452 ) ( not ( = ?auto_1664443 ?auto_1664453 ) ) ( OBJ-AT ?auto_1664447 ?auto_1664453 ) ( IN-CITY ?auto_1664449 ?auto_1664452 ) ( not ( = ?auto_1664443 ?auto_1664449 ) ) ( OBJ-AT ?auto_1664445 ?auto_1664449 ) ( TRUCK-AT ?auto_1664451 ?auto_1664443 ) ( not ( = ?auto_1664445 ?auto_1664447 ) ) ( not ( = ?auto_1664453 ?auto_1664449 ) ) ( not ( = ?auto_1664445 ?auto_1664448 ) ) ( not ( = ?auto_1664447 ?auto_1664448 ) ) ( not ( = ?auto_1664450 ?auto_1664453 ) ) ( not ( = ?auto_1664450 ?auto_1664449 ) ) ( not ( = ?auto_1664445 ?auto_1664444 ) ) ( not ( = ?auto_1664447 ?auto_1664444 ) ) ( not ( = ?auto_1664448 ?auto_1664444 ) ) ( not ( = ?auto_1664454 ?auto_1664450 ) ) ( not ( = ?auto_1664454 ?auto_1664453 ) ) ( not ( = ?auto_1664454 ?auto_1664449 ) ) ( not ( = ?auto_1664445 ?auto_1664446 ) ) ( not ( = ?auto_1664447 ?auto_1664446 ) ) ( not ( = ?auto_1664448 ?auto_1664446 ) ) ( not ( = ?auto_1664444 ?auto_1664446 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1664445 ?auto_1664447 ?auto_1664444 ?auto_1664448 ?auto_1664446 ?auto_1664443 )
      ( DELIVER-5PKG-VERIFY ?auto_1664444 ?auto_1664445 ?auto_1664446 ?auto_1664447 ?auto_1664448 ?auto_1664443 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1667153 - OBJ
      ?auto_1667154 - OBJ
      ?auto_1667155 - OBJ
      ?auto_1667156 - OBJ
      ?auto_1667157 - OBJ
      ?auto_1667152 - LOCATION
    )
    :vars
    (
      ?auto_1667163 - LOCATION
      ?auto_1667161 - CITY
      ?auto_1667159 - LOCATION
      ?auto_1667162 - LOCATION
      ?auto_1667158 - LOCATION
      ?auto_1667160 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1667163 ?auto_1667161 ) ( IN-CITY ?auto_1667152 ?auto_1667161 ) ( not ( = ?auto_1667152 ?auto_1667163 ) ) ( OBJ-AT ?auto_1667154 ?auto_1667163 ) ( OBJ-AT ?auto_1667153 ?auto_1667163 ) ( IN-CITY ?auto_1667159 ?auto_1667161 ) ( not ( = ?auto_1667152 ?auto_1667159 ) ) ( OBJ-AT ?auto_1667157 ?auto_1667159 ) ( IN-CITY ?auto_1667162 ?auto_1667161 ) ( not ( = ?auto_1667152 ?auto_1667162 ) ) ( OBJ-AT ?auto_1667156 ?auto_1667162 ) ( IN-CITY ?auto_1667158 ?auto_1667161 ) ( not ( = ?auto_1667152 ?auto_1667158 ) ) ( OBJ-AT ?auto_1667155 ?auto_1667158 ) ( TRUCK-AT ?auto_1667160 ?auto_1667152 ) ( not ( = ?auto_1667155 ?auto_1667156 ) ) ( not ( = ?auto_1667162 ?auto_1667158 ) ) ( not ( = ?auto_1667155 ?auto_1667157 ) ) ( not ( = ?auto_1667156 ?auto_1667157 ) ) ( not ( = ?auto_1667159 ?auto_1667162 ) ) ( not ( = ?auto_1667159 ?auto_1667158 ) ) ( not ( = ?auto_1667155 ?auto_1667153 ) ) ( not ( = ?auto_1667156 ?auto_1667153 ) ) ( not ( = ?auto_1667157 ?auto_1667153 ) ) ( not ( = ?auto_1667163 ?auto_1667159 ) ) ( not ( = ?auto_1667163 ?auto_1667162 ) ) ( not ( = ?auto_1667163 ?auto_1667158 ) ) ( not ( = ?auto_1667155 ?auto_1667154 ) ) ( not ( = ?auto_1667156 ?auto_1667154 ) ) ( not ( = ?auto_1667157 ?auto_1667154 ) ) ( not ( = ?auto_1667153 ?auto_1667154 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1667155 ?auto_1667156 ?auto_1667153 ?auto_1667157 ?auto_1667154 ?auto_1667152 )
      ( DELIVER-5PKG-VERIFY ?auto_1667153 ?auto_1667154 ?auto_1667155 ?auto_1667156 ?auto_1667157 ?auto_1667152 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1907795 - OBJ
      ?auto_1907796 - OBJ
      ?auto_1907797 - OBJ
      ?auto_1907798 - OBJ
      ?auto_1907799 - OBJ
      ?auto_1907800 - OBJ
      ?auto_1907794 - LOCATION
    )
    :vars
    (
      ?auto_1907803 - LOCATION
      ?auto_1907802 - CITY
      ?auto_1907806 - LOCATION
      ?auto_1907804 - LOCATION
      ?auto_1907805 - LOCATION
      ?auto_1907801 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1907803 ?auto_1907802 ) ( IN-CITY ?auto_1907794 ?auto_1907802 ) ( not ( = ?auto_1907794 ?auto_1907803 ) ) ( OBJ-AT ?auto_1907800 ?auto_1907803 ) ( IN-CITY ?auto_1907806 ?auto_1907802 ) ( not ( = ?auto_1907794 ?auto_1907806 ) ) ( OBJ-AT ?auto_1907799 ?auto_1907806 ) ( OBJ-AT ?auto_1907798 ?auto_1907806 ) ( IN-CITY ?auto_1907804 ?auto_1907802 ) ( not ( = ?auto_1907794 ?auto_1907804 ) ) ( OBJ-AT ?auto_1907797 ?auto_1907804 ) ( IN-CITY ?auto_1907805 ?auto_1907802 ) ( not ( = ?auto_1907794 ?auto_1907805 ) ) ( OBJ-AT ?auto_1907796 ?auto_1907805 ) ( OBJ-AT ?auto_1907795 ?auto_1907803 ) ( TRUCK-AT ?auto_1907801 ?auto_1907794 ) ( not ( = ?auto_1907795 ?auto_1907796 ) ) ( not ( = ?auto_1907805 ?auto_1907803 ) ) ( not ( = ?auto_1907795 ?auto_1907797 ) ) ( not ( = ?auto_1907796 ?auto_1907797 ) ) ( not ( = ?auto_1907804 ?auto_1907805 ) ) ( not ( = ?auto_1907804 ?auto_1907803 ) ) ( not ( = ?auto_1907795 ?auto_1907798 ) ) ( not ( = ?auto_1907796 ?auto_1907798 ) ) ( not ( = ?auto_1907797 ?auto_1907798 ) ) ( not ( = ?auto_1907806 ?auto_1907804 ) ) ( not ( = ?auto_1907806 ?auto_1907805 ) ) ( not ( = ?auto_1907806 ?auto_1907803 ) ) ( not ( = ?auto_1907795 ?auto_1907799 ) ) ( not ( = ?auto_1907796 ?auto_1907799 ) ) ( not ( = ?auto_1907797 ?auto_1907799 ) ) ( not ( = ?auto_1907798 ?auto_1907799 ) ) ( not ( = ?auto_1907795 ?auto_1907800 ) ) ( not ( = ?auto_1907796 ?auto_1907800 ) ) ( not ( = ?auto_1907797 ?auto_1907800 ) ) ( not ( = ?auto_1907798 ?auto_1907800 ) ) ( not ( = ?auto_1907799 ?auto_1907800 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1907795 ?auto_1907796 ?auto_1907798 ?auto_1907797 ?auto_1907799 ?auto_1907794 )
      ( DELIVER-1PKG ?auto_1907800 ?auto_1907794 )
      ( DELIVER-6PKG-VERIFY ?auto_1907795 ?auto_1907796 ?auto_1907797 ?auto_1907798 ?auto_1907799 ?auto_1907800 ?auto_1907794 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1907864 - OBJ
      ?auto_1907865 - OBJ
      ?auto_1907866 - OBJ
      ?auto_1907867 - OBJ
      ?auto_1907868 - OBJ
      ?auto_1907869 - OBJ
      ?auto_1907863 - LOCATION
    )
    :vars
    (
      ?auto_1907870 - LOCATION
      ?auto_1907875 - CITY
      ?auto_1907871 - LOCATION
      ?auto_1907872 - LOCATION
      ?auto_1907874 - LOCATION
      ?auto_1907873 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1907870 ?auto_1907875 ) ( IN-CITY ?auto_1907863 ?auto_1907875 ) ( not ( = ?auto_1907863 ?auto_1907870 ) ) ( OBJ-AT ?auto_1907868 ?auto_1907870 ) ( IN-CITY ?auto_1907871 ?auto_1907875 ) ( not ( = ?auto_1907863 ?auto_1907871 ) ) ( OBJ-AT ?auto_1907869 ?auto_1907871 ) ( OBJ-AT ?auto_1907867 ?auto_1907871 ) ( IN-CITY ?auto_1907872 ?auto_1907875 ) ( not ( = ?auto_1907863 ?auto_1907872 ) ) ( OBJ-AT ?auto_1907866 ?auto_1907872 ) ( IN-CITY ?auto_1907874 ?auto_1907875 ) ( not ( = ?auto_1907863 ?auto_1907874 ) ) ( OBJ-AT ?auto_1907865 ?auto_1907874 ) ( OBJ-AT ?auto_1907864 ?auto_1907870 ) ( TRUCK-AT ?auto_1907873 ?auto_1907863 ) ( not ( = ?auto_1907864 ?auto_1907865 ) ) ( not ( = ?auto_1907874 ?auto_1907870 ) ) ( not ( = ?auto_1907864 ?auto_1907866 ) ) ( not ( = ?auto_1907865 ?auto_1907866 ) ) ( not ( = ?auto_1907872 ?auto_1907874 ) ) ( not ( = ?auto_1907872 ?auto_1907870 ) ) ( not ( = ?auto_1907864 ?auto_1907867 ) ) ( not ( = ?auto_1907865 ?auto_1907867 ) ) ( not ( = ?auto_1907866 ?auto_1907867 ) ) ( not ( = ?auto_1907871 ?auto_1907872 ) ) ( not ( = ?auto_1907871 ?auto_1907874 ) ) ( not ( = ?auto_1907871 ?auto_1907870 ) ) ( not ( = ?auto_1907864 ?auto_1907869 ) ) ( not ( = ?auto_1907865 ?auto_1907869 ) ) ( not ( = ?auto_1907866 ?auto_1907869 ) ) ( not ( = ?auto_1907867 ?auto_1907869 ) ) ( not ( = ?auto_1907864 ?auto_1907868 ) ) ( not ( = ?auto_1907865 ?auto_1907868 ) ) ( not ( = ?auto_1907866 ?auto_1907868 ) ) ( not ( = ?auto_1907867 ?auto_1907868 ) ) ( not ( = ?auto_1907869 ?auto_1907868 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1907864 ?auto_1907865 ?auto_1907866 ?auto_1907867 ?auto_1907869 ?auto_1907868 ?auto_1907863 )
      ( DELIVER-6PKG-VERIFY ?auto_1907864 ?auto_1907865 ?auto_1907866 ?auto_1907867 ?auto_1907868 ?auto_1907869 ?auto_1907863 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1908351 - OBJ
      ?auto_1908352 - OBJ
      ?auto_1908353 - OBJ
      ?auto_1908354 - OBJ
      ?auto_1908355 - OBJ
      ?auto_1908356 - OBJ
      ?auto_1908350 - LOCATION
    )
    :vars
    (
      ?auto_1908357 - LOCATION
      ?auto_1908359 - CITY
      ?auto_1908360 - LOCATION
      ?auto_1908361 - LOCATION
      ?auto_1908358 - LOCATION
      ?auto_1908362 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1908357 ?auto_1908359 ) ( IN-CITY ?auto_1908350 ?auto_1908359 ) ( not ( = ?auto_1908350 ?auto_1908357 ) ) ( OBJ-AT ?auto_1908354 ?auto_1908357 ) ( IN-CITY ?auto_1908360 ?auto_1908359 ) ( not ( = ?auto_1908350 ?auto_1908360 ) ) ( OBJ-AT ?auto_1908356 ?auto_1908360 ) ( OBJ-AT ?auto_1908355 ?auto_1908360 ) ( IN-CITY ?auto_1908361 ?auto_1908359 ) ( not ( = ?auto_1908350 ?auto_1908361 ) ) ( OBJ-AT ?auto_1908353 ?auto_1908361 ) ( IN-CITY ?auto_1908358 ?auto_1908359 ) ( not ( = ?auto_1908350 ?auto_1908358 ) ) ( OBJ-AT ?auto_1908352 ?auto_1908358 ) ( OBJ-AT ?auto_1908351 ?auto_1908357 ) ( TRUCK-AT ?auto_1908362 ?auto_1908350 ) ( not ( = ?auto_1908351 ?auto_1908352 ) ) ( not ( = ?auto_1908358 ?auto_1908357 ) ) ( not ( = ?auto_1908351 ?auto_1908353 ) ) ( not ( = ?auto_1908352 ?auto_1908353 ) ) ( not ( = ?auto_1908361 ?auto_1908358 ) ) ( not ( = ?auto_1908361 ?auto_1908357 ) ) ( not ( = ?auto_1908351 ?auto_1908355 ) ) ( not ( = ?auto_1908352 ?auto_1908355 ) ) ( not ( = ?auto_1908353 ?auto_1908355 ) ) ( not ( = ?auto_1908360 ?auto_1908361 ) ) ( not ( = ?auto_1908360 ?auto_1908358 ) ) ( not ( = ?auto_1908360 ?auto_1908357 ) ) ( not ( = ?auto_1908351 ?auto_1908356 ) ) ( not ( = ?auto_1908352 ?auto_1908356 ) ) ( not ( = ?auto_1908353 ?auto_1908356 ) ) ( not ( = ?auto_1908355 ?auto_1908356 ) ) ( not ( = ?auto_1908351 ?auto_1908354 ) ) ( not ( = ?auto_1908352 ?auto_1908354 ) ) ( not ( = ?auto_1908353 ?auto_1908354 ) ) ( not ( = ?auto_1908355 ?auto_1908354 ) ) ( not ( = ?auto_1908356 ?auto_1908354 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1908351 ?auto_1908352 ?auto_1908353 ?auto_1908355 ?auto_1908354 ?auto_1908356 ?auto_1908350 )
      ( DELIVER-6PKG-VERIFY ?auto_1908351 ?auto_1908352 ?auto_1908353 ?auto_1908354 ?auto_1908355 ?auto_1908356 ?auto_1908350 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1908921 - OBJ
      ?auto_1908922 - OBJ
      ?auto_1908923 - OBJ
      ?auto_1908924 - OBJ
      ?auto_1908925 - OBJ
      ?auto_1908926 - OBJ
      ?auto_1908920 - LOCATION
    )
    :vars
    (
      ?auto_1908927 - LOCATION
      ?auto_1908929 - CITY
      ?auto_1908930 - LOCATION
      ?auto_1908931 - LOCATION
      ?auto_1908928 - LOCATION
      ?auto_1908932 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1908927 ?auto_1908929 ) ( IN-CITY ?auto_1908920 ?auto_1908929 ) ( not ( = ?auto_1908920 ?auto_1908927 ) ) ( OBJ-AT ?auto_1908926 ?auto_1908927 ) ( IN-CITY ?auto_1908930 ?auto_1908929 ) ( not ( = ?auto_1908920 ?auto_1908930 ) ) ( OBJ-AT ?auto_1908925 ?auto_1908930 ) ( OBJ-AT ?auto_1908923 ?auto_1908930 ) ( IN-CITY ?auto_1908931 ?auto_1908929 ) ( not ( = ?auto_1908920 ?auto_1908931 ) ) ( OBJ-AT ?auto_1908924 ?auto_1908931 ) ( IN-CITY ?auto_1908928 ?auto_1908929 ) ( not ( = ?auto_1908920 ?auto_1908928 ) ) ( OBJ-AT ?auto_1908922 ?auto_1908928 ) ( OBJ-AT ?auto_1908921 ?auto_1908927 ) ( TRUCK-AT ?auto_1908932 ?auto_1908920 ) ( not ( = ?auto_1908921 ?auto_1908922 ) ) ( not ( = ?auto_1908928 ?auto_1908927 ) ) ( not ( = ?auto_1908921 ?auto_1908924 ) ) ( not ( = ?auto_1908922 ?auto_1908924 ) ) ( not ( = ?auto_1908931 ?auto_1908928 ) ) ( not ( = ?auto_1908931 ?auto_1908927 ) ) ( not ( = ?auto_1908921 ?auto_1908923 ) ) ( not ( = ?auto_1908922 ?auto_1908923 ) ) ( not ( = ?auto_1908924 ?auto_1908923 ) ) ( not ( = ?auto_1908930 ?auto_1908931 ) ) ( not ( = ?auto_1908930 ?auto_1908928 ) ) ( not ( = ?auto_1908930 ?auto_1908927 ) ) ( not ( = ?auto_1908921 ?auto_1908925 ) ) ( not ( = ?auto_1908922 ?auto_1908925 ) ) ( not ( = ?auto_1908924 ?auto_1908925 ) ) ( not ( = ?auto_1908923 ?auto_1908925 ) ) ( not ( = ?auto_1908921 ?auto_1908926 ) ) ( not ( = ?auto_1908922 ?auto_1908926 ) ) ( not ( = ?auto_1908924 ?auto_1908926 ) ) ( not ( = ?auto_1908923 ?auto_1908926 ) ) ( not ( = ?auto_1908925 ?auto_1908926 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1908921 ?auto_1908922 ?auto_1908924 ?auto_1908923 ?auto_1908926 ?auto_1908925 ?auto_1908920 )
      ( DELIVER-6PKG-VERIFY ?auto_1908921 ?auto_1908922 ?auto_1908923 ?auto_1908924 ?auto_1908925 ?auto_1908926 ?auto_1908920 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1908990 - OBJ
      ?auto_1908991 - OBJ
      ?auto_1908992 - OBJ
      ?auto_1908993 - OBJ
      ?auto_1908994 - OBJ
      ?auto_1908995 - OBJ
      ?auto_1908989 - LOCATION
    )
    :vars
    (
      ?auto_1908996 - LOCATION
      ?auto_1908998 - CITY
      ?auto_1908999 - LOCATION
      ?auto_1909000 - LOCATION
      ?auto_1908997 - LOCATION
      ?auto_1909001 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1908996 ?auto_1908998 ) ( IN-CITY ?auto_1908989 ?auto_1908998 ) ( not ( = ?auto_1908989 ?auto_1908996 ) ) ( OBJ-AT ?auto_1908994 ?auto_1908996 ) ( IN-CITY ?auto_1908999 ?auto_1908998 ) ( not ( = ?auto_1908989 ?auto_1908999 ) ) ( OBJ-AT ?auto_1908995 ?auto_1908999 ) ( OBJ-AT ?auto_1908992 ?auto_1908999 ) ( IN-CITY ?auto_1909000 ?auto_1908998 ) ( not ( = ?auto_1908989 ?auto_1909000 ) ) ( OBJ-AT ?auto_1908993 ?auto_1909000 ) ( IN-CITY ?auto_1908997 ?auto_1908998 ) ( not ( = ?auto_1908989 ?auto_1908997 ) ) ( OBJ-AT ?auto_1908991 ?auto_1908997 ) ( OBJ-AT ?auto_1908990 ?auto_1908996 ) ( TRUCK-AT ?auto_1909001 ?auto_1908989 ) ( not ( = ?auto_1908990 ?auto_1908991 ) ) ( not ( = ?auto_1908997 ?auto_1908996 ) ) ( not ( = ?auto_1908990 ?auto_1908993 ) ) ( not ( = ?auto_1908991 ?auto_1908993 ) ) ( not ( = ?auto_1909000 ?auto_1908997 ) ) ( not ( = ?auto_1909000 ?auto_1908996 ) ) ( not ( = ?auto_1908990 ?auto_1908992 ) ) ( not ( = ?auto_1908991 ?auto_1908992 ) ) ( not ( = ?auto_1908993 ?auto_1908992 ) ) ( not ( = ?auto_1908999 ?auto_1909000 ) ) ( not ( = ?auto_1908999 ?auto_1908997 ) ) ( not ( = ?auto_1908999 ?auto_1908996 ) ) ( not ( = ?auto_1908990 ?auto_1908995 ) ) ( not ( = ?auto_1908991 ?auto_1908995 ) ) ( not ( = ?auto_1908993 ?auto_1908995 ) ) ( not ( = ?auto_1908992 ?auto_1908995 ) ) ( not ( = ?auto_1908990 ?auto_1908994 ) ) ( not ( = ?auto_1908991 ?auto_1908994 ) ) ( not ( = ?auto_1908993 ?auto_1908994 ) ) ( not ( = ?auto_1908992 ?auto_1908994 ) ) ( not ( = ?auto_1908995 ?auto_1908994 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1908990 ?auto_1908991 ?auto_1908993 ?auto_1908992 ?auto_1908994 ?auto_1908995 ?auto_1908989 )
      ( DELIVER-6PKG-VERIFY ?auto_1908990 ?auto_1908991 ?auto_1908992 ?auto_1908993 ?auto_1908994 ?auto_1908995 ?auto_1908989 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1909206 - OBJ
      ?auto_1909207 - OBJ
      ?auto_1909208 - OBJ
      ?auto_1909209 - OBJ
      ?auto_1909210 - OBJ
      ?auto_1909211 - OBJ
      ?auto_1909205 - LOCATION
    )
    :vars
    (
      ?auto_1909212 - LOCATION
      ?auto_1909214 - CITY
      ?auto_1909215 - LOCATION
      ?auto_1909216 - LOCATION
      ?auto_1909213 - LOCATION
      ?auto_1909217 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1909212 ?auto_1909214 ) ( IN-CITY ?auto_1909205 ?auto_1909214 ) ( not ( = ?auto_1909205 ?auto_1909212 ) ) ( OBJ-AT ?auto_1909211 ?auto_1909212 ) ( IN-CITY ?auto_1909215 ?auto_1909214 ) ( not ( = ?auto_1909205 ?auto_1909215 ) ) ( OBJ-AT ?auto_1909209 ?auto_1909215 ) ( OBJ-AT ?auto_1909208 ?auto_1909215 ) ( IN-CITY ?auto_1909216 ?auto_1909214 ) ( not ( = ?auto_1909205 ?auto_1909216 ) ) ( OBJ-AT ?auto_1909210 ?auto_1909216 ) ( IN-CITY ?auto_1909213 ?auto_1909214 ) ( not ( = ?auto_1909205 ?auto_1909213 ) ) ( OBJ-AT ?auto_1909207 ?auto_1909213 ) ( OBJ-AT ?auto_1909206 ?auto_1909212 ) ( TRUCK-AT ?auto_1909217 ?auto_1909205 ) ( not ( = ?auto_1909206 ?auto_1909207 ) ) ( not ( = ?auto_1909213 ?auto_1909212 ) ) ( not ( = ?auto_1909206 ?auto_1909210 ) ) ( not ( = ?auto_1909207 ?auto_1909210 ) ) ( not ( = ?auto_1909216 ?auto_1909213 ) ) ( not ( = ?auto_1909216 ?auto_1909212 ) ) ( not ( = ?auto_1909206 ?auto_1909208 ) ) ( not ( = ?auto_1909207 ?auto_1909208 ) ) ( not ( = ?auto_1909210 ?auto_1909208 ) ) ( not ( = ?auto_1909215 ?auto_1909216 ) ) ( not ( = ?auto_1909215 ?auto_1909213 ) ) ( not ( = ?auto_1909215 ?auto_1909212 ) ) ( not ( = ?auto_1909206 ?auto_1909209 ) ) ( not ( = ?auto_1909207 ?auto_1909209 ) ) ( not ( = ?auto_1909210 ?auto_1909209 ) ) ( not ( = ?auto_1909208 ?auto_1909209 ) ) ( not ( = ?auto_1909206 ?auto_1909211 ) ) ( not ( = ?auto_1909207 ?auto_1909211 ) ) ( not ( = ?auto_1909210 ?auto_1909211 ) ) ( not ( = ?auto_1909208 ?auto_1909211 ) ) ( not ( = ?auto_1909209 ?auto_1909211 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1909206 ?auto_1909207 ?auto_1909210 ?auto_1909208 ?auto_1909211 ?auto_1909209 ?auto_1909205 )
      ( DELIVER-6PKG-VERIFY ?auto_1909206 ?auto_1909207 ?auto_1909208 ?auto_1909209 ?auto_1909210 ?auto_1909211 ?auto_1909205 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1909275 - OBJ
      ?auto_1909276 - OBJ
      ?auto_1909277 - OBJ
      ?auto_1909278 - OBJ
      ?auto_1909279 - OBJ
      ?auto_1909280 - OBJ
      ?auto_1909274 - LOCATION
    )
    :vars
    (
      ?auto_1909281 - LOCATION
      ?auto_1909283 - CITY
      ?auto_1909284 - LOCATION
      ?auto_1909285 - LOCATION
      ?auto_1909282 - LOCATION
      ?auto_1909286 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1909281 ?auto_1909283 ) ( IN-CITY ?auto_1909274 ?auto_1909283 ) ( not ( = ?auto_1909274 ?auto_1909281 ) ) ( OBJ-AT ?auto_1909279 ?auto_1909281 ) ( IN-CITY ?auto_1909284 ?auto_1909283 ) ( not ( = ?auto_1909274 ?auto_1909284 ) ) ( OBJ-AT ?auto_1909278 ?auto_1909284 ) ( OBJ-AT ?auto_1909277 ?auto_1909284 ) ( IN-CITY ?auto_1909285 ?auto_1909283 ) ( not ( = ?auto_1909274 ?auto_1909285 ) ) ( OBJ-AT ?auto_1909280 ?auto_1909285 ) ( IN-CITY ?auto_1909282 ?auto_1909283 ) ( not ( = ?auto_1909274 ?auto_1909282 ) ) ( OBJ-AT ?auto_1909276 ?auto_1909282 ) ( OBJ-AT ?auto_1909275 ?auto_1909281 ) ( TRUCK-AT ?auto_1909286 ?auto_1909274 ) ( not ( = ?auto_1909275 ?auto_1909276 ) ) ( not ( = ?auto_1909282 ?auto_1909281 ) ) ( not ( = ?auto_1909275 ?auto_1909280 ) ) ( not ( = ?auto_1909276 ?auto_1909280 ) ) ( not ( = ?auto_1909285 ?auto_1909282 ) ) ( not ( = ?auto_1909285 ?auto_1909281 ) ) ( not ( = ?auto_1909275 ?auto_1909277 ) ) ( not ( = ?auto_1909276 ?auto_1909277 ) ) ( not ( = ?auto_1909280 ?auto_1909277 ) ) ( not ( = ?auto_1909284 ?auto_1909285 ) ) ( not ( = ?auto_1909284 ?auto_1909282 ) ) ( not ( = ?auto_1909284 ?auto_1909281 ) ) ( not ( = ?auto_1909275 ?auto_1909278 ) ) ( not ( = ?auto_1909276 ?auto_1909278 ) ) ( not ( = ?auto_1909280 ?auto_1909278 ) ) ( not ( = ?auto_1909277 ?auto_1909278 ) ) ( not ( = ?auto_1909275 ?auto_1909279 ) ) ( not ( = ?auto_1909276 ?auto_1909279 ) ) ( not ( = ?auto_1909280 ?auto_1909279 ) ) ( not ( = ?auto_1909277 ?auto_1909279 ) ) ( not ( = ?auto_1909278 ?auto_1909279 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1909275 ?auto_1909276 ?auto_1909280 ?auto_1909277 ?auto_1909279 ?auto_1909278 ?auto_1909274 )
      ( DELIVER-6PKG-VERIFY ?auto_1909275 ?auto_1909276 ?auto_1909277 ?auto_1909278 ?auto_1909279 ?auto_1909280 ?auto_1909274 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1909562 - OBJ
      ?auto_1909563 - OBJ
      ?auto_1909564 - OBJ
      ?auto_1909565 - OBJ
      ?auto_1909566 - OBJ
      ?auto_1909567 - OBJ
      ?auto_1909561 - LOCATION
    )
    :vars
    (
      ?auto_1909568 - LOCATION
      ?auto_1909570 - CITY
      ?auto_1909571 - LOCATION
      ?auto_1909572 - LOCATION
      ?auto_1909569 - LOCATION
      ?auto_1909573 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1909568 ?auto_1909570 ) ( IN-CITY ?auto_1909561 ?auto_1909570 ) ( not ( = ?auto_1909561 ?auto_1909568 ) ) ( OBJ-AT ?auto_1909565 ?auto_1909568 ) ( IN-CITY ?auto_1909571 ?auto_1909570 ) ( not ( = ?auto_1909561 ?auto_1909571 ) ) ( OBJ-AT ?auto_1909567 ?auto_1909571 ) ( OBJ-AT ?auto_1909564 ?auto_1909571 ) ( IN-CITY ?auto_1909572 ?auto_1909570 ) ( not ( = ?auto_1909561 ?auto_1909572 ) ) ( OBJ-AT ?auto_1909566 ?auto_1909572 ) ( IN-CITY ?auto_1909569 ?auto_1909570 ) ( not ( = ?auto_1909561 ?auto_1909569 ) ) ( OBJ-AT ?auto_1909563 ?auto_1909569 ) ( OBJ-AT ?auto_1909562 ?auto_1909568 ) ( TRUCK-AT ?auto_1909573 ?auto_1909561 ) ( not ( = ?auto_1909562 ?auto_1909563 ) ) ( not ( = ?auto_1909569 ?auto_1909568 ) ) ( not ( = ?auto_1909562 ?auto_1909566 ) ) ( not ( = ?auto_1909563 ?auto_1909566 ) ) ( not ( = ?auto_1909572 ?auto_1909569 ) ) ( not ( = ?auto_1909572 ?auto_1909568 ) ) ( not ( = ?auto_1909562 ?auto_1909564 ) ) ( not ( = ?auto_1909563 ?auto_1909564 ) ) ( not ( = ?auto_1909566 ?auto_1909564 ) ) ( not ( = ?auto_1909571 ?auto_1909572 ) ) ( not ( = ?auto_1909571 ?auto_1909569 ) ) ( not ( = ?auto_1909571 ?auto_1909568 ) ) ( not ( = ?auto_1909562 ?auto_1909567 ) ) ( not ( = ?auto_1909563 ?auto_1909567 ) ) ( not ( = ?auto_1909566 ?auto_1909567 ) ) ( not ( = ?auto_1909564 ?auto_1909567 ) ) ( not ( = ?auto_1909562 ?auto_1909565 ) ) ( not ( = ?auto_1909563 ?auto_1909565 ) ) ( not ( = ?auto_1909566 ?auto_1909565 ) ) ( not ( = ?auto_1909564 ?auto_1909565 ) ) ( not ( = ?auto_1909567 ?auto_1909565 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1909562 ?auto_1909563 ?auto_1909566 ?auto_1909564 ?auto_1909565 ?auto_1909567 ?auto_1909561 )
      ( DELIVER-6PKG-VERIFY ?auto_1909562 ?auto_1909563 ?auto_1909564 ?auto_1909565 ?auto_1909566 ?auto_1909567 ?auto_1909561 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1909705 - OBJ
      ?auto_1909706 - OBJ
      ?auto_1909707 - OBJ
      ?auto_1909708 - OBJ
      ?auto_1909709 - OBJ
      ?auto_1909710 - OBJ
      ?auto_1909704 - LOCATION
    )
    :vars
    (
      ?auto_1909711 - LOCATION
      ?auto_1909713 - CITY
      ?auto_1909714 - LOCATION
      ?auto_1909715 - LOCATION
      ?auto_1909712 - LOCATION
      ?auto_1909716 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1909711 ?auto_1909713 ) ( IN-CITY ?auto_1909704 ?auto_1909713 ) ( not ( = ?auto_1909704 ?auto_1909711 ) ) ( OBJ-AT ?auto_1909708 ?auto_1909711 ) ( IN-CITY ?auto_1909714 ?auto_1909713 ) ( not ( = ?auto_1909704 ?auto_1909714 ) ) ( OBJ-AT ?auto_1909709 ?auto_1909714 ) ( OBJ-AT ?auto_1909707 ?auto_1909714 ) ( IN-CITY ?auto_1909715 ?auto_1909713 ) ( not ( = ?auto_1909704 ?auto_1909715 ) ) ( OBJ-AT ?auto_1909710 ?auto_1909715 ) ( IN-CITY ?auto_1909712 ?auto_1909713 ) ( not ( = ?auto_1909704 ?auto_1909712 ) ) ( OBJ-AT ?auto_1909706 ?auto_1909712 ) ( OBJ-AT ?auto_1909705 ?auto_1909711 ) ( TRUCK-AT ?auto_1909716 ?auto_1909704 ) ( not ( = ?auto_1909705 ?auto_1909706 ) ) ( not ( = ?auto_1909712 ?auto_1909711 ) ) ( not ( = ?auto_1909705 ?auto_1909710 ) ) ( not ( = ?auto_1909706 ?auto_1909710 ) ) ( not ( = ?auto_1909715 ?auto_1909712 ) ) ( not ( = ?auto_1909715 ?auto_1909711 ) ) ( not ( = ?auto_1909705 ?auto_1909707 ) ) ( not ( = ?auto_1909706 ?auto_1909707 ) ) ( not ( = ?auto_1909710 ?auto_1909707 ) ) ( not ( = ?auto_1909714 ?auto_1909715 ) ) ( not ( = ?auto_1909714 ?auto_1909712 ) ) ( not ( = ?auto_1909714 ?auto_1909711 ) ) ( not ( = ?auto_1909705 ?auto_1909709 ) ) ( not ( = ?auto_1909706 ?auto_1909709 ) ) ( not ( = ?auto_1909710 ?auto_1909709 ) ) ( not ( = ?auto_1909707 ?auto_1909709 ) ) ( not ( = ?auto_1909705 ?auto_1909708 ) ) ( not ( = ?auto_1909706 ?auto_1909708 ) ) ( not ( = ?auto_1909710 ?auto_1909708 ) ) ( not ( = ?auto_1909707 ?auto_1909708 ) ) ( not ( = ?auto_1909709 ?auto_1909708 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1909705 ?auto_1909706 ?auto_1909710 ?auto_1909707 ?auto_1909708 ?auto_1909709 ?auto_1909704 )
      ( DELIVER-6PKG-VERIFY ?auto_1909705 ?auto_1909706 ?auto_1909707 ?auto_1909708 ?auto_1909709 ?auto_1909710 ?auto_1909704 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1912523 - OBJ
      ?auto_1912524 - OBJ
      ?auto_1912525 - OBJ
      ?auto_1912526 - OBJ
      ?auto_1912527 - OBJ
      ?auto_1912528 - OBJ
      ?auto_1912522 - LOCATION
    )
    :vars
    (
      ?auto_1912529 - LOCATION
      ?auto_1912531 - CITY
      ?auto_1912532 - LOCATION
      ?auto_1912533 - LOCATION
      ?auto_1912530 - LOCATION
      ?auto_1912534 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1912529 ?auto_1912531 ) ( IN-CITY ?auto_1912522 ?auto_1912531 ) ( not ( = ?auto_1912522 ?auto_1912529 ) ) ( OBJ-AT ?auto_1912525 ?auto_1912529 ) ( IN-CITY ?auto_1912532 ?auto_1912531 ) ( not ( = ?auto_1912522 ?auto_1912532 ) ) ( OBJ-AT ?auto_1912528 ?auto_1912532 ) ( OBJ-AT ?auto_1912527 ?auto_1912532 ) ( IN-CITY ?auto_1912533 ?auto_1912531 ) ( not ( = ?auto_1912522 ?auto_1912533 ) ) ( OBJ-AT ?auto_1912526 ?auto_1912533 ) ( IN-CITY ?auto_1912530 ?auto_1912531 ) ( not ( = ?auto_1912522 ?auto_1912530 ) ) ( OBJ-AT ?auto_1912524 ?auto_1912530 ) ( OBJ-AT ?auto_1912523 ?auto_1912529 ) ( TRUCK-AT ?auto_1912534 ?auto_1912522 ) ( not ( = ?auto_1912523 ?auto_1912524 ) ) ( not ( = ?auto_1912530 ?auto_1912529 ) ) ( not ( = ?auto_1912523 ?auto_1912526 ) ) ( not ( = ?auto_1912524 ?auto_1912526 ) ) ( not ( = ?auto_1912533 ?auto_1912530 ) ) ( not ( = ?auto_1912533 ?auto_1912529 ) ) ( not ( = ?auto_1912523 ?auto_1912527 ) ) ( not ( = ?auto_1912524 ?auto_1912527 ) ) ( not ( = ?auto_1912526 ?auto_1912527 ) ) ( not ( = ?auto_1912532 ?auto_1912533 ) ) ( not ( = ?auto_1912532 ?auto_1912530 ) ) ( not ( = ?auto_1912532 ?auto_1912529 ) ) ( not ( = ?auto_1912523 ?auto_1912528 ) ) ( not ( = ?auto_1912524 ?auto_1912528 ) ) ( not ( = ?auto_1912526 ?auto_1912528 ) ) ( not ( = ?auto_1912527 ?auto_1912528 ) ) ( not ( = ?auto_1912523 ?auto_1912525 ) ) ( not ( = ?auto_1912524 ?auto_1912525 ) ) ( not ( = ?auto_1912526 ?auto_1912525 ) ) ( not ( = ?auto_1912527 ?auto_1912525 ) ) ( not ( = ?auto_1912528 ?auto_1912525 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1912523 ?auto_1912524 ?auto_1912526 ?auto_1912527 ?auto_1912525 ?auto_1912528 ?auto_1912522 )
      ( DELIVER-6PKG-VERIFY ?auto_1912523 ?auto_1912524 ?auto_1912525 ?auto_1912526 ?auto_1912527 ?auto_1912528 ?auto_1912522 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1912947 - OBJ
      ?auto_1912948 - OBJ
      ?auto_1912949 - OBJ
      ?auto_1912950 - OBJ
      ?auto_1912951 - OBJ
      ?auto_1912952 - OBJ
      ?auto_1912946 - LOCATION
    )
    :vars
    (
      ?auto_1912953 - LOCATION
      ?auto_1912955 - CITY
      ?auto_1912956 - LOCATION
      ?auto_1912957 - LOCATION
      ?auto_1912954 - LOCATION
      ?auto_1912958 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1912953 ?auto_1912955 ) ( IN-CITY ?auto_1912946 ?auto_1912955 ) ( not ( = ?auto_1912946 ?auto_1912953 ) ) ( OBJ-AT ?auto_1912949 ?auto_1912953 ) ( IN-CITY ?auto_1912956 ?auto_1912955 ) ( not ( = ?auto_1912946 ?auto_1912956 ) ) ( OBJ-AT ?auto_1912952 ?auto_1912956 ) ( OBJ-AT ?auto_1912950 ?auto_1912956 ) ( IN-CITY ?auto_1912957 ?auto_1912955 ) ( not ( = ?auto_1912946 ?auto_1912957 ) ) ( OBJ-AT ?auto_1912951 ?auto_1912957 ) ( IN-CITY ?auto_1912954 ?auto_1912955 ) ( not ( = ?auto_1912946 ?auto_1912954 ) ) ( OBJ-AT ?auto_1912948 ?auto_1912954 ) ( OBJ-AT ?auto_1912947 ?auto_1912953 ) ( TRUCK-AT ?auto_1912958 ?auto_1912946 ) ( not ( = ?auto_1912947 ?auto_1912948 ) ) ( not ( = ?auto_1912954 ?auto_1912953 ) ) ( not ( = ?auto_1912947 ?auto_1912951 ) ) ( not ( = ?auto_1912948 ?auto_1912951 ) ) ( not ( = ?auto_1912957 ?auto_1912954 ) ) ( not ( = ?auto_1912957 ?auto_1912953 ) ) ( not ( = ?auto_1912947 ?auto_1912950 ) ) ( not ( = ?auto_1912948 ?auto_1912950 ) ) ( not ( = ?auto_1912951 ?auto_1912950 ) ) ( not ( = ?auto_1912956 ?auto_1912957 ) ) ( not ( = ?auto_1912956 ?auto_1912954 ) ) ( not ( = ?auto_1912956 ?auto_1912953 ) ) ( not ( = ?auto_1912947 ?auto_1912952 ) ) ( not ( = ?auto_1912948 ?auto_1912952 ) ) ( not ( = ?auto_1912951 ?auto_1912952 ) ) ( not ( = ?auto_1912950 ?auto_1912952 ) ) ( not ( = ?auto_1912947 ?auto_1912949 ) ) ( not ( = ?auto_1912948 ?auto_1912949 ) ) ( not ( = ?auto_1912951 ?auto_1912949 ) ) ( not ( = ?auto_1912950 ?auto_1912949 ) ) ( not ( = ?auto_1912952 ?auto_1912949 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1912947 ?auto_1912948 ?auto_1912951 ?auto_1912950 ?auto_1912949 ?auto_1912952 ?auto_1912946 )
      ( DELIVER-6PKG-VERIFY ?auto_1912947 ?auto_1912948 ?auto_1912949 ?auto_1912950 ?auto_1912951 ?auto_1912952 ?auto_1912946 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1913090 - OBJ
      ?auto_1913091 - OBJ
      ?auto_1913092 - OBJ
      ?auto_1913093 - OBJ
      ?auto_1913094 - OBJ
      ?auto_1913095 - OBJ
      ?auto_1913089 - LOCATION
    )
    :vars
    (
      ?auto_1913096 - LOCATION
      ?auto_1913098 - CITY
      ?auto_1913099 - LOCATION
      ?auto_1913100 - LOCATION
      ?auto_1913097 - LOCATION
      ?auto_1913101 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1913096 ?auto_1913098 ) ( IN-CITY ?auto_1913089 ?auto_1913098 ) ( not ( = ?auto_1913089 ?auto_1913096 ) ) ( OBJ-AT ?auto_1913092 ?auto_1913096 ) ( IN-CITY ?auto_1913099 ?auto_1913098 ) ( not ( = ?auto_1913089 ?auto_1913099 ) ) ( OBJ-AT ?auto_1913094 ?auto_1913099 ) ( OBJ-AT ?auto_1913093 ?auto_1913099 ) ( IN-CITY ?auto_1913100 ?auto_1913098 ) ( not ( = ?auto_1913089 ?auto_1913100 ) ) ( OBJ-AT ?auto_1913095 ?auto_1913100 ) ( IN-CITY ?auto_1913097 ?auto_1913098 ) ( not ( = ?auto_1913089 ?auto_1913097 ) ) ( OBJ-AT ?auto_1913091 ?auto_1913097 ) ( OBJ-AT ?auto_1913090 ?auto_1913096 ) ( TRUCK-AT ?auto_1913101 ?auto_1913089 ) ( not ( = ?auto_1913090 ?auto_1913091 ) ) ( not ( = ?auto_1913097 ?auto_1913096 ) ) ( not ( = ?auto_1913090 ?auto_1913095 ) ) ( not ( = ?auto_1913091 ?auto_1913095 ) ) ( not ( = ?auto_1913100 ?auto_1913097 ) ) ( not ( = ?auto_1913100 ?auto_1913096 ) ) ( not ( = ?auto_1913090 ?auto_1913093 ) ) ( not ( = ?auto_1913091 ?auto_1913093 ) ) ( not ( = ?auto_1913095 ?auto_1913093 ) ) ( not ( = ?auto_1913099 ?auto_1913100 ) ) ( not ( = ?auto_1913099 ?auto_1913097 ) ) ( not ( = ?auto_1913099 ?auto_1913096 ) ) ( not ( = ?auto_1913090 ?auto_1913094 ) ) ( not ( = ?auto_1913091 ?auto_1913094 ) ) ( not ( = ?auto_1913095 ?auto_1913094 ) ) ( not ( = ?auto_1913093 ?auto_1913094 ) ) ( not ( = ?auto_1913090 ?auto_1913092 ) ) ( not ( = ?auto_1913091 ?auto_1913092 ) ) ( not ( = ?auto_1913095 ?auto_1913092 ) ) ( not ( = ?auto_1913093 ?auto_1913092 ) ) ( not ( = ?auto_1913094 ?auto_1913092 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1913090 ?auto_1913091 ?auto_1913095 ?auto_1913093 ?auto_1913092 ?auto_1913094 ?auto_1913089 )
      ( DELIVER-6PKG-VERIFY ?auto_1913090 ?auto_1913091 ?auto_1913092 ?auto_1913093 ?auto_1913094 ?auto_1913095 ?auto_1913089 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1925712 - OBJ
      ?auto_1925713 - OBJ
      ?auto_1925714 - OBJ
      ?auto_1925715 - OBJ
      ?auto_1925716 - OBJ
      ?auto_1925717 - OBJ
      ?auto_1925711 - LOCATION
    )
    :vars
    (
      ?auto_1925718 - LOCATION
      ?auto_1925720 - CITY
      ?auto_1925721 - LOCATION
      ?auto_1925722 - LOCATION
      ?auto_1925719 - LOCATION
      ?auto_1925723 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1925718 ?auto_1925720 ) ( IN-CITY ?auto_1925711 ?auto_1925720 ) ( not ( = ?auto_1925711 ?auto_1925718 ) ) ( OBJ-AT ?auto_1925717 ?auto_1925718 ) ( IN-CITY ?auto_1925721 ?auto_1925720 ) ( not ( = ?auto_1925711 ?auto_1925721 ) ) ( OBJ-AT ?auto_1925716 ?auto_1925721 ) ( OBJ-AT ?auto_1925713 ?auto_1925721 ) ( IN-CITY ?auto_1925722 ?auto_1925720 ) ( not ( = ?auto_1925711 ?auto_1925722 ) ) ( OBJ-AT ?auto_1925715 ?auto_1925722 ) ( IN-CITY ?auto_1925719 ?auto_1925720 ) ( not ( = ?auto_1925711 ?auto_1925719 ) ) ( OBJ-AT ?auto_1925714 ?auto_1925719 ) ( OBJ-AT ?auto_1925712 ?auto_1925718 ) ( TRUCK-AT ?auto_1925723 ?auto_1925711 ) ( not ( = ?auto_1925712 ?auto_1925714 ) ) ( not ( = ?auto_1925719 ?auto_1925718 ) ) ( not ( = ?auto_1925712 ?auto_1925715 ) ) ( not ( = ?auto_1925714 ?auto_1925715 ) ) ( not ( = ?auto_1925722 ?auto_1925719 ) ) ( not ( = ?auto_1925722 ?auto_1925718 ) ) ( not ( = ?auto_1925712 ?auto_1925713 ) ) ( not ( = ?auto_1925714 ?auto_1925713 ) ) ( not ( = ?auto_1925715 ?auto_1925713 ) ) ( not ( = ?auto_1925721 ?auto_1925722 ) ) ( not ( = ?auto_1925721 ?auto_1925719 ) ) ( not ( = ?auto_1925721 ?auto_1925718 ) ) ( not ( = ?auto_1925712 ?auto_1925716 ) ) ( not ( = ?auto_1925714 ?auto_1925716 ) ) ( not ( = ?auto_1925715 ?auto_1925716 ) ) ( not ( = ?auto_1925713 ?auto_1925716 ) ) ( not ( = ?auto_1925712 ?auto_1925717 ) ) ( not ( = ?auto_1925714 ?auto_1925717 ) ) ( not ( = ?auto_1925715 ?auto_1925717 ) ) ( not ( = ?auto_1925713 ?auto_1925717 ) ) ( not ( = ?auto_1925716 ?auto_1925717 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1925712 ?auto_1925714 ?auto_1925715 ?auto_1925713 ?auto_1925717 ?auto_1925716 ?auto_1925711 )
      ( DELIVER-6PKG-VERIFY ?auto_1925712 ?auto_1925713 ?auto_1925714 ?auto_1925715 ?auto_1925716 ?auto_1925717 ?auto_1925711 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1925781 - OBJ
      ?auto_1925782 - OBJ
      ?auto_1925783 - OBJ
      ?auto_1925784 - OBJ
      ?auto_1925785 - OBJ
      ?auto_1925786 - OBJ
      ?auto_1925780 - LOCATION
    )
    :vars
    (
      ?auto_1925787 - LOCATION
      ?auto_1925789 - CITY
      ?auto_1925790 - LOCATION
      ?auto_1925791 - LOCATION
      ?auto_1925788 - LOCATION
      ?auto_1925792 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1925787 ?auto_1925789 ) ( IN-CITY ?auto_1925780 ?auto_1925789 ) ( not ( = ?auto_1925780 ?auto_1925787 ) ) ( OBJ-AT ?auto_1925785 ?auto_1925787 ) ( IN-CITY ?auto_1925790 ?auto_1925789 ) ( not ( = ?auto_1925780 ?auto_1925790 ) ) ( OBJ-AT ?auto_1925786 ?auto_1925790 ) ( OBJ-AT ?auto_1925782 ?auto_1925790 ) ( IN-CITY ?auto_1925791 ?auto_1925789 ) ( not ( = ?auto_1925780 ?auto_1925791 ) ) ( OBJ-AT ?auto_1925784 ?auto_1925791 ) ( IN-CITY ?auto_1925788 ?auto_1925789 ) ( not ( = ?auto_1925780 ?auto_1925788 ) ) ( OBJ-AT ?auto_1925783 ?auto_1925788 ) ( OBJ-AT ?auto_1925781 ?auto_1925787 ) ( TRUCK-AT ?auto_1925792 ?auto_1925780 ) ( not ( = ?auto_1925781 ?auto_1925783 ) ) ( not ( = ?auto_1925788 ?auto_1925787 ) ) ( not ( = ?auto_1925781 ?auto_1925784 ) ) ( not ( = ?auto_1925783 ?auto_1925784 ) ) ( not ( = ?auto_1925791 ?auto_1925788 ) ) ( not ( = ?auto_1925791 ?auto_1925787 ) ) ( not ( = ?auto_1925781 ?auto_1925782 ) ) ( not ( = ?auto_1925783 ?auto_1925782 ) ) ( not ( = ?auto_1925784 ?auto_1925782 ) ) ( not ( = ?auto_1925790 ?auto_1925791 ) ) ( not ( = ?auto_1925790 ?auto_1925788 ) ) ( not ( = ?auto_1925790 ?auto_1925787 ) ) ( not ( = ?auto_1925781 ?auto_1925786 ) ) ( not ( = ?auto_1925783 ?auto_1925786 ) ) ( not ( = ?auto_1925784 ?auto_1925786 ) ) ( not ( = ?auto_1925782 ?auto_1925786 ) ) ( not ( = ?auto_1925781 ?auto_1925785 ) ) ( not ( = ?auto_1925783 ?auto_1925785 ) ) ( not ( = ?auto_1925784 ?auto_1925785 ) ) ( not ( = ?auto_1925782 ?auto_1925785 ) ) ( not ( = ?auto_1925786 ?auto_1925785 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1925781 ?auto_1925783 ?auto_1925784 ?auto_1925782 ?auto_1925785 ?auto_1925786 ?auto_1925780 )
      ( DELIVER-6PKG-VERIFY ?auto_1925781 ?auto_1925782 ?auto_1925783 ?auto_1925784 ?auto_1925785 ?auto_1925786 ?auto_1925780 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1925997 - OBJ
      ?auto_1925998 - OBJ
      ?auto_1925999 - OBJ
      ?auto_1926000 - OBJ
      ?auto_1926001 - OBJ
      ?auto_1926002 - OBJ
      ?auto_1925996 - LOCATION
    )
    :vars
    (
      ?auto_1926003 - LOCATION
      ?auto_1926005 - CITY
      ?auto_1926006 - LOCATION
      ?auto_1926007 - LOCATION
      ?auto_1926004 - LOCATION
      ?auto_1926008 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1926003 ?auto_1926005 ) ( IN-CITY ?auto_1925996 ?auto_1926005 ) ( not ( = ?auto_1925996 ?auto_1926003 ) ) ( OBJ-AT ?auto_1926002 ?auto_1926003 ) ( IN-CITY ?auto_1926006 ?auto_1926005 ) ( not ( = ?auto_1925996 ?auto_1926006 ) ) ( OBJ-AT ?auto_1926000 ?auto_1926006 ) ( OBJ-AT ?auto_1925998 ?auto_1926006 ) ( IN-CITY ?auto_1926007 ?auto_1926005 ) ( not ( = ?auto_1925996 ?auto_1926007 ) ) ( OBJ-AT ?auto_1926001 ?auto_1926007 ) ( IN-CITY ?auto_1926004 ?auto_1926005 ) ( not ( = ?auto_1925996 ?auto_1926004 ) ) ( OBJ-AT ?auto_1925999 ?auto_1926004 ) ( OBJ-AT ?auto_1925997 ?auto_1926003 ) ( TRUCK-AT ?auto_1926008 ?auto_1925996 ) ( not ( = ?auto_1925997 ?auto_1925999 ) ) ( not ( = ?auto_1926004 ?auto_1926003 ) ) ( not ( = ?auto_1925997 ?auto_1926001 ) ) ( not ( = ?auto_1925999 ?auto_1926001 ) ) ( not ( = ?auto_1926007 ?auto_1926004 ) ) ( not ( = ?auto_1926007 ?auto_1926003 ) ) ( not ( = ?auto_1925997 ?auto_1925998 ) ) ( not ( = ?auto_1925999 ?auto_1925998 ) ) ( not ( = ?auto_1926001 ?auto_1925998 ) ) ( not ( = ?auto_1926006 ?auto_1926007 ) ) ( not ( = ?auto_1926006 ?auto_1926004 ) ) ( not ( = ?auto_1926006 ?auto_1926003 ) ) ( not ( = ?auto_1925997 ?auto_1926000 ) ) ( not ( = ?auto_1925999 ?auto_1926000 ) ) ( not ( = ?auto_1926001 ?auto_1926000 ) ) ( not ( = ?auto_1925998 ?auto_1926000 ) ) ( not ( = ?auto_1925997 ?auto_1926002 ) ) ( not ( = ?auto_1925999 ?auto_1926002 ) ) ( not ( = ?auto_1926001 ?auto_1926002 ) ) ( not ( = ?auto_1925998 ?auto_1926002 ) ) ( not ( = ?auto_1926000 ?auto_1926002 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1925997 ?auto_1925999 ?auto_1926001 ?auto_1925998 ?auto_1926002 ?auto_1926000 ?auto_1925996 )
      ( DELIVER-6PKG-VERIFY ?auto_1925997 ?auto_1925998 ?auto_1925999 ?auto_1926000 ?auto_1926001 ?auto_1926002 ?auto_1925996 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1926066 - OBJ
      ?auto_1926067 - OBJ
      ?auto_1926068 - OBJ
      ?auto_1926069 - OBJ
      ?auto_1926070 - OBJ
      ?auto_1926071 - OBJ
      ?auto_1926065 - LOCATION
    )
    :vars
    (
      ?auto_1926072 - LOCATION
      ?auto_1926074 - CITY
      ?auto_1926075 - LOCATION
      ?auto_1926076 - LOCATION
      ?auto_1926073 - LOCATION
      ?auto_1926077 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1926072 ?auto_1926074 ) ( IN-CITY ?auto_1926065 ?auto_1926074 ) ( not ( = ?auto_1926065 ?auto_1926072 ) ) ( OBJ-AT ?auto_1926070 ?auto_1926072 ) ( IN-CITY ?auto_1926075 ?auto_1926074 ) ( not ( = ?auto_1926065 ?auto_1926075 ) ) ( OBJ-AT ?auto_1926069 ?auto_1926075 ) ( OBJ-AT ?auto_1926067 ?auto_1926075 ) ( IN-CITY ?auto_1926076 ?auto_1926074 ) ( not ( = ?auto_1926065 ?auto_1926076 ) ) ( OBJ-AT ?auto_1926071 ?auto_1926076 ) ( IN-CITY ?auto_1926073 ?auto_1926074 ) ( not ( = ?auto_1926065 ?auto_1926073 ) ) ( OBJ-AT ?auto_1926068 ?auto_1926073 ) ( OBJ-AT ?auto_1926066 ?auto_1926072 ) ( TRUCK-AT ?auto_1926077 ?auto_1926065 ) ( not ( = ?auto_1926066 ?auto_1926068 ) ) ( not ( = ?auto_1926073 ?auto_1926072 ) ) ( not ( = ?auto_1926066 ?auto_1926071 ) ) ( not ( = ?auto_1926068 ?auto_1926071 ) ) ( not ( = ?auto_1926076 ?auto_1926073 ) ) ( not ( = ?auto_1926076 ?auto_1926072 ) ) ( not ( = ?auto_1926066 ?auto_1926067 ) ) ( not ( = ?auto_1926068 ?auto_1926067 ) ) ( not ( = ?auto_1926071 ?auto_1926067 ) ) ( not ( = ?auto_1926075 ?auto_1926076 ) ) ( not ( = ?auto_1926075 ?auto_1926073 ) ) ( not ( = ?auto_1926075 ?auto_1926072 ) ) ( not ( = ?auto_1926066 ?auto_1926069 ) ) ( not ( = ?auto_1926068 ?auto_1926069 ) ) ( not ( = ?auto_1926071 ?auto_1926069 ) ) ( not ( = ?auto_1926067 ?auto_1926069 ) ) ( not ( = ?auto_1926066 ?auto_1926070 ) ) ( not ( = ?auto_1926068 ?auto_1926070 ) ) ( not ( = ?auto_1926071 ?auto_1926070 ) ) ( not ( = ?auto_1926067 ?auto_1926070 ) ) ( not ( = ?auto_1926069 ?auto_1926070 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1926066 ?auto_1926068 ?auto_1926071 ?auto_1926067 ?auto_1926070 ?auto_1926069 ?auto_1926065 )
      ( DELIVER-6PKG-VERIFY ?auto_1926066 ?auto_1926067 ?auto_1926068 ?auto_1926069 ?auto_1926070 ?auto_1926071 ?auto_1926065 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1926353 - OBJ
      ?auto_1926354 - OBJ
      ?auto_1926355 - OBJ
      ?auto_1926356 - OBJ
      ?auto_1926357 - OBJ
      ?auto_1926358 - OBJ
      ?auto_1926352 - LOCATION
    )
    :vars
    (
      ?auto_1926359 - LOCATION
      ?auto_1926361 - CITY
      ?auto_1926362 - LOCATION
      ?auto_1926363 - LOCATION
      ?auto_1926360 - LOCATION
      ?auto_1926364 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1926359 ?auto_1926361 ) ( IN-CITY ?auto_1926352 ?auto_1926361 ) ( not ( = ?auto_1926352 ?auto_1926359 ) ) ( OBJ-AT ?auto_1926356 ?auto_1926359 ) ( IN-CITY ?auto_1926362 ?auto_1926361 ) ( not ( = ?auto_1926352 ?auto_1926362 ) ) ( OBJ-AT ?auto_1926358 ?auto_1926362 ) ( OBJ-AT ?auto_1926354 ?auto_1926362 ) ( IN-CITY ?auto_1926363 ?auto_1926361 ) ( not ( = ?auto_1926352 ?auto_1926363 ) ) ( OBJ-AT ?auto_1926357 ?auto_1926363 ) ( IN-CITY ?auto_1926360 ?auto_1926361 ) ( not ( = ?auto_1926352 ?auto_1926360 ) ) ( OBJ-AT ?auto_1926355 ?auto_1926360 ) ( OBJ-AT ?auto_1926353 ?auto_1926359 ) ( TRUCK-AT ?auto_1926364 ?auto_1926352 ) ( not ( = ?auto_1926353 ?auto_1926355 ) ) ( not ( = ?auto_1926360 ?auto_1926359 ) ) ( not ( = ?auto_1926353 ?auto_1926357 ) ) ( not ( = ?auto_1926355 ?auto_1926357 ) ) ( not ( = ?auto_1926363 ?auto_1926360 ) ) ( not ( = ?auto_1926363 ?auto_1926359 ) ) ( not ( = ?auto_1926353 ?auto_1926354 ) ) ( not ( = ?auto_1926355 ?auto_1926354 ) ) ( not ( = ?auto_1926357 ?auto_1926354 ) ) ( not ( = ?auto_1926362 ?auto_1926363 ) ) ( not ( = ?auto_1926362 ?auto_1926360 ) ) ( not ( = ?auto_1926362 ?auto_1926359 ) ) ( not ( = ?auto_1926353 ?auto_1926358 ) ) ( not ( = ?auto_1926355 ?auto_1926358 ) ) ( not ( = ?auto_1926357 ?auto_1926358 ) ) ( not ( = ?auto_1926354 ?auto_1926358 ) ) ( not ( = ?auto_1926353 ?auto_1926356 ) ) ( not ( = ?auto_1926355 ?auto_1926356 ) ) ( not ( = ?auto_1926357 ?auto_1926356 ) ) ( not ( = ?auto_1926354 ?auto_1926356 ) ) ( not ( = ?auto_1926358 ?auto_1926356 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1926353 ?auto_1926355 ?auto_1926357 ?auto_1926354 ?auto_1926356 ?auto_1926358 ?auto_1926352 )
      ( DELIVER-6PKG-VERIFY ?auto_1926353 ?auto_1926354 ?auto_1926355 ?auto_1926356 ?auto_1926357 ?auto_1926358 ?auto_1926352 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1926496 - OBJ
      ?auto_1926497 - OBJ
      ?auto_1926498 - OBJ
      ?auto_1926499 - OBJ
      ?auto_1926500 - OBJ
      ?auto_1926501 - OBJ
      ?auto_1926495 - LOCATION
    )
    :vars
    (
      ?auto_1926502 - LOCATION
      ?auto_1926504 - CITY
      ?auto_1926505 - LOCATION
      ?auto_1926506 - LOCATION
      ?auto_1926503 - LOCATION
      ?auto_1926507 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1926502 ?auto_1926504 ) ( IN-CITY ?auto_1926495 ?auto_1926504 ) ( not ( = ?auto_1926495 ?auto_1926502 ) ) ( OBJ-AT ?auto_1926499 ?auto_1926502 ) ( IN-CITY ?auto_1926505 ?auto_1926504 ) ( not ( = ?auto_1926495 ?auto_1926505 ) ) ( OBJ-AT ?auto_1926500 ?auto_1926505 ) ( OBJ-AT ?auto_1926497 ?auto_1926505 ) ( IN-CITY ?auto_1926506 ?auto_1926504 ) ( not ( = ?auto_1926495 ?auto_1926506 ) ) ( OBJ-AT ?auto_1926501 ?auto_1926506 ) ( IN-CITY ?auto_1926503 ?auto_1926504 ) ( not ( = ?auto_1926495 ?auto_1926503 ) ) ( OBJ-AT ?auto_1926498 ?auto_1926503 ) ( OBJ-AT ?auto_1926496 ?auto_1926502 ) ( TRUCK-AT ?auto_1926507 ?auto_1926495 ) ( not ( = ?auto_1926496 ?auto_1926498 ) ) ( not ( = ?auto_1926503 ?auto_1926502 ) ) ( not ( = ?auto_1926496 ?auto_1926501 ) ) ( not ( = ?auto_1926498 ?auto_1926501 ) ) ( not ( = ?auto_1926506 ?auto_1926503 ) ) ( not ( = ?auto_1926506 ?auto_1926502 ) ) ( not ( = ?auto_1926496 ?auto_1926497 ) ) ( not ( = ?auto_1926498 ?auto_1926497 ) ) ( not ( = ?auto_1926501 ?auto_1926497 ) ) ( not ( = ?auto_1926505 ?auto_1926506 ) ) ( not ( = ?auto_1926505 ?auto_1926503 ) ) ( not ( = ?auto_1926505 ?auto_1926502 ) ) ( not ( = ?auto_1926496 ?auto_1926500 ) ) ( not ( = ?auto_1926498 ?auto_1926500 ) ) ( not ( = ?auto_1926501 ?auto_1926500 ) ) ( not ( = ?auto_1926497 ?auto_1926500 ) ) ( not ( = ?auto_1926496 ?auto_1926499 ) ) ( not ( = ?auto_1926498 ?auto_1926499 ) ) ( not ( = ?auto_1926501 ?auto_1926499 ) ) ( not ( = ?auto_1926497 ?auto_1926499 ) ) ( not ( = ?auto_1926500 ?auto_1926499 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1926496 ?auto_1926498 ?auto_1926501 ?auto_1926497 ?auto_1926499 ?auto_1926500 ?auto_1926495 )
      ( DELIVER-6PKG-VERIFY ?auto_1926496 ?auto_1926497 ?auto_1926498 ?auto_1926499 ?auto_1926500 ?auto_1926501 ?auto_1926495 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1929463 - OBJ
      ?auto_1929464 - OBJ
      ?auto_1929465 - OBJ
      ?auto_1929466 - OBJ
      ?auto_1929467 - OBJ
      ?auto_1929468 - OBJ
      ?auto_1929462 - LOCATION
    )
    :vars
    (
      ?auto_1929469 - LOCATION
      ?auto_1929471 - CITY
      ?auto_1929472 - LOCATION
      ?auto_1929473 - LOCATION
      ?auto_1929470 - LOCATION
      ?auto_1929474 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1929469 ?auto_1929471 ) ( IN-CITY ?auto_1929462 ?auto_1929471 ) ( not ( = ?auto_1929462 ?auto_1929469 ) ) ( OBJ-AT ?auto_1929468 ?auto_1929469 ) ( IN-CITY ?auto_1929472 ?auto_1929471 ) ( not ( = ?auto_1929462 ?auto_1929472 ) ) ( OBJ-AT ?auto_1929465 ?auto_1929472 ) ( OBJ-AT ?auto_1929464 ?auto_1929472 ) ( IN-CITY ?auto_1929473 ?auto_1929471 ) ( not ( = ?auto_1929462 ?auto_1929473 ) ) ( OBJ-AT ?auto_1929467 ?auto_1929473 ) ( IN-CITY ?auto_1929470 ?auto_1929471 ) ( not ( = ?auto_1929462 ?auto_1929470 ) ) ( OBJ-AT ?auto_1929466 ?auto_1929470 ) ( OBJ-AT ?auto_1929463 ?auto_1929469 ) ( TRUCK-AT ?auto_1929474 ?auto_1929462 ) ( not ( = ?auto_1929463 ?auto_1929466 ) ) ( not ( = ?auto_1929470 ?auto_1929469 ) ) ( not ( = ?auto_1929463 ?auto_1929467 ) ) ( not ( = ?auto_1929466 ?auto_1929467 ) ) ( not ( = ?auto_1929473 ?auto_1929470 ) ) ( not ( = ?auto_1929473 ?auto_1929469 ) ) ( not ( = ?auto_1929463 ?auto_1929464 ) ) ( not ( = ?auto_1929466 ?auto_1929464 ) ) ( not ( = ?auto_1929467 ?auto_1929464 ) ) ( not ( = ?auto_1929472 ?auto_1929473 ) ) ( not ( = ?auto_1929472 ?auto_1929470 ) ) ( not ( = ?auto_1929472 ?auto_1929469 ) ) ( not ( = ?auto_1929463 ?auto_1929465 ) ) ( not ( = ?auto_1929466 ?auto_1929465 ) ) ( not ( = ?auto_1929467 ?auto_1929465 ) ) ( not ( = ?auto_1929464 ?auto_1929465 ) ) ( not ( = ?auto_1929463 ?auto_1929468 ) ) ( not ( = ?auto_1929466 ?auto_1929468 ) ) ( not ( = ?auto_1929467 ?auto_1929468 ) ) ( not ( = ?auto_1929464 ?auto_1929468 ) ) ( not ( = ?auto_1929465 ?auto_1929468 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1929463 ?auto_1929466 ?auto_1929467 ?auto_1929464 ?auto_1929468 ?auto_1929465 ?auto_1929462 )
      ( DELIVER-6PKG-VERIFY ?auto_1929463 ?auto_1929464 ?auto_1929465 ?auto_1929466 ?auto_1929467 ?auto_1929468 ?auto_1929462 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1929532 - OBJ
      ?auto_1929533 - OBJ
      ?auto_1929534 - OBJ
      ?auto_1929535 - OBJ
      ?auto_1929536 - OBJ
      ?auto_1929537 - OBJ
      ?auto_1929531 - LOCATION
    )
    :vars
    (
      ?auto_1929538 - LOCATION
      ?auto_1929540 - CITY
      ?auto_1929541 - LOCATION
      ?auto_1929542 - LOCATION
      ?auto_1929539 - LOCATION
      ?auto_1929543 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1929538 ?auto_1929540 ) ( IN-CITY ?auto_1929531 ?auto_1929540 ) ( not ( = ?auto_1929531 ?auto_1929538 ) ) ( OBJ-AT ?auto_1929536 ?auto_1929538 ) ( IN-CITY ?auto_1929541 ?auto_1929540 ) ( not ( = ?auto_1929531 ?auto_1929541 ) ) ( OBJ-AT ?auto_1929534 ?auto_1929541 ) ( OBJ-AT ?auto_1929533 ?auto_1929541 ) ( IN-CITY ?auto_1929542 ?auto_1929540 ) ( not ( = ?auto_1929531 ?auto_1929542 ) ) ( OBJ-AT ?auto_1929537 ?auto_1929542 ) ( IN-CITY ?auto_1929539 ?auto_1929540 ) ( not ( = ?auto_1929531 ?auto_1929539 ) ) ( OBJ-AT ?auto_1929535 ?auto_1929539 ) ( OBJ-AT ?auto_1929532 ?auto_1929538 ) ( TRUCK-AT ?auto_1929543 ?auto_1929531 ) ( not ( = ?auto_1929532 ?auto_1929535 ) ) ( not ( = ?auto_1929539 ?auto_1929538 ) ) ( not ( = ?auto_1929532 ?auto_1929537 ) ) ( not ( = ?auto_1929535 ?auto_1929537 ) ) ( not ( = ?auto_1929542 ?auto_1929539 ) ) ( not ( = ?auto_1929542 ?auto_1929538 ) ) ( not ( = ?auto_1929532 ?auto_1929533 ) ) ( not ( = ?auto_1929535 ?auto_1929533 ) ) ( not ( = ?auto_1929537 ?auto_1929533 ) ) ( not ( = ?auto_1929541 ?auto_1929542 ) ) ( not ( = ?auto_1929541 ?auto_1929539 ) ) ( not ( = ?auto_1929541 ?auto_1929538 ) ) ( not ( = ?auto_1929532 ?auto_1929534 ) ) ( not ( = ?auto_1929535 ?auto_1929534 ) ) ( not ( = ?auto_1929537 ?auto_1929534 ) ) ( not ( = ?auto_1929533 ?auto_1929534 ) ) ( not ( = ?auto_1929532 ?auto_1929536 ) ) ( not ( = ?auto_1929535 ?auto_1929536 ) ) ( not ( = ?auto_1929537 ?auto_1929536 ) ) ( not ( = ?auto_1929533 ?auto_1929536 ) ) ( not ( = ?auto_1929534 ?auto_1929536 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1929532 ?auto_1929535 ?auto_1929537 ?auto_1929533 ?auto_1929536 ?auto_1929534 ?auto_1929531 )
      ( DELIVER-6PKG-VERIFY ?auto_1929532 ?auto_1929533 ?auto_1929534 ?auto_1929535 ?auto_1929536 ?auto_1929537 ?auto_1929531 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1930165 - OBJ
      ?auto_1930166 - OBJ
      ?auto_1930167 - OBJ
      ?auto_1930168 - OBJ
      ?auto_1930169 - OBJ
      ?auto_1930170 - OBJ
      ?auto_1930164 - LOCATION
    )
    :vars
    (
      ?auto_1930171 - LOCATION
      ?auto_1930173 - CITY
      ?auto_1930174 - LOCATION
      ?auto_1930175 - LOCATION
      ?auto_1930172 - LOCATION
      ?auto_1930176 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1930171 ?auto_1930173 ) ( IN-CITY ?auto_1930164 ?auto_1930173 ) ( not ( = ?auto_1930164 ?auto_1930171 ) ) ( OBJ-AT ?auto_1930168 ?auto_1930171 ) ( IN-CITY ?auto_1930174 ?auto_1930173 ) ( not ( = ?auto_1930164 ?auto_1930174 ) ) ( OBJ-AT ?auto_1930167 ?auto_1930174 ) ( OBJ-AT ?auto_1930166 ?auto_1930174 ) ( IN-CITY ?auto_1930175 ?auto_1930173 ) ( not ( = ?auto_1930164 ?auto_1930175 ) ) ( OBJ-AT ?auto_1930170 ?auto_1930175 ) ( IN-CITY ?auto_1930172 ?auto_1930173 ) ( not ( = ?auto_1930164 ?auto_1930172 ) ) ( OBJ-AT ?auto_1930169 ?auto_1930172 ) ( OBJ-AT ?auto_1930165 ?auto_1930171 ) ( TRUCK-AT ?auto_1930176 ?auto_1930164 ) ( not ( = ?auto_1930165 ?auto_1930169 ) ) ( not ( = ?auto_1930172 ?auto_1930171 ) ) ( not ( = ?auto_1930165 ?auto_1930170 ) ) ( not ( = ?auto_1930169 ?auto_1930170 ) ) ( not ( = ?auto_1930175 ?auto_1930172 ) ) ( not ( = ?auto_1930175 ?auto_1930171 ) ) ( not ( = ?auto_1930165 ?auto_1930166 ) ) ( not ( = ?auto_1930169 ?auto_1930166 ) ) ( not ( = ?auto_1930170 ?auto_1930166 ) ) ( not ( = ?auto_1930174 ?auto_1930175 ) ) ( not ( = ?auto_1930174 ?auto_1930172 ) ) ( not ( = ?auto_1930174 ?auto_1930171 ) ) ( not ( = ?auto_1930165 ?auto_1930167 ) ) ( not ( = ?auto_1930169 ?auto_1930167 ) ) ( not ( = ?auto_1930170 ?auto_1930167 ) ) ( not ( = ?auto_1930166 ?auto_1930167 ) ) ( not ( = ?auto_1930165 ?auto_1930168 ) ) ( not ( = ?auto_1930169 ?auto_1930168 ) ) ( not ( = ?auto_1930170 ?auto_1930168 ) ) ( not ( = ?auto_1930166 ?auto_1930168 ) ) ( not ( = ?auto_1930167 ?auto_1930168 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1930165 ?auto_1930169 ?auto_1930170 ?auto_1930166 ?auto_1930168 ?auto_1930167 ?auto_1930164 )
      ( DELIVER-6PKG-VERIFY ?auto_1930165 ?auto_1930166 ?auto_1930167 ?auto_1930168 ?auto_1930169 ?auto_1930170 ?auto_1930164 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1931336 - OBJ
      ?auto_1931337 - OBJ
      ?auto_1931338 - OBJ
      ?auto_1931339 - OBJ
      ?auto_1931340 - OBJ
      ?auto_1931341 - OBJ
      ?auto_1931335 - LOCATION
    )
    :vars
    (
      ?auto_1931342 - LOCATION
      ?auto_1931344 - CITY
      ?auto_1931345 - LOCATION
      ?auto_1931346 - LOCATION
      ?auto_1931343 - LOCATION
      ?auto_1931347 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1931342 ?auto_1931344 ) ( IN-CITY ?auto_1931335 ?auto_1931344 ) ( not ( = ?auto_1931335 ?auto_1931342 ) ) ( OBJ-AT ?auto_1931338 ?auto_1931342 ) ( IN-CITY ?auto_1931345 ?auto_1931344 ) ( not ( = ?auto_1931335 ?auto_1931345 ) ) ( OBJ-AT ?auto_1931341 ?auto_1931345 ) ( OBJ-AT ?auto_1931337 ?auto_1931345 ) ( IN-CITY ?auto_1931346 ?auto_1931344 ) ( not ( = ?auto_1931335 ?auto_1931346 ) ) ( OBJ-AT ?auto_1931340 ?auto_1931346 ) ( IN-CITY ?auto_1931343 ?auto_1931344 ) ( not ( = ?auto_1931335 ?auto_1931343 ) ) ( OBJ-AT ?auto_1931339 ?auto_1931343 ) ( OBJ-AT ?auto_1931336 ?auto_1931342 ) ( TRUCK-AT ?auto_1931347 ?auto_1931335 ) ( not ( = ?auto_1931336 ?auto_1931339 ) ) ( not ( = ?auto_1931343 ?auto_1931342 ) ) ( not ( = ?auto_1931336 ?auto_1931340 ) ) ( not ( = ?auto_1931339 ?auto_1931340 ) ) ( not ( = ?auto_1931346 ?auto_1931343 ) ) ( not ( = ?auto_1931346 ?auto_1931342 ) ) ( not ( = ?auto_1931336 ?auto_1931337 ) ) ( not ( = ?auto_1931339 ?auto_1931337 ) ) ( not ( = ?auto_1931340 ?auto_1931337 ) ) ( not ( = ?auto_1931345 ?auto_1931346 ) ) ( not ( = ?auto_1931345 ?auto_1931343 ) ) ( not ( = ?auto_1931345 ?auto_1931342 ) ) ( not ( = ?auto_1931336 ?auto_1931341 ) ) ( not ( = ?auto_1931339 ?auto_1931341 ) ) ( not ( = ?auto_1931340 ?auto_1931341 ) ) ( not ( = ?auto_1931337 ?auto_1931341 ) ) ( not ( = ?auto_1931336 ?auto_1931338 ) ) ( not ( = ?auto_1931339 ?auto_1931338 ) ) ( not ( = ?auto_1931340 ?auto_1931338 ) ) ( not ( = ?auto_1931337 ?auto_1931338 ) ) ( not ( = ?auto_1931341 ?auto_1931338 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1931336 ?auto_1931339 ?auto_1931340 ?auto_1931337 ?auto_1931338 ?auto_1931341 ?auto_1931335 )
      ( DELIVER-6PKG-VERIFY ?auto_1931336 ?auto_1931337 ?auto_1931338 ?auto_1931339 ?auto_1931340 ?auto_1931341 ?auto_1931335 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1931479 - OBJ
      ?auto_1931480 - OBJ
      ?auto_1931481 - OBJ
      ?auto_1931482 - OBJ
      ?auto_1931483 - OBJ
      ?auto_1931484 - OBJ
      ?auto_1931478 - LOCATION
    )
    :vars
    (
      ?auto_1931485 - LOCATION
      ?auto_1931487 - CITY
      ?auto_1931488 - LOCATION
      ?auto_1931489 - LOCATION
      ?auto_1931486 - LOCATION
      ?auto_1931490 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1931485 ?auto_1931487 ) ( IN-CITY ?auto_1931478 ?auto_1931487 ) ( not ( = ?auto_1931478 ?auto_1931485 ) ) ( OBJ-AT ?auto_1931481 ?auto_1931485 ) ( IN-CITY ?auto_1931488 ?auto_1931487 ) ( not ( = ?auto_1931478 ?auto_1931488 ) ) ( OBJ-AT ?auto_1931483 ?auto_1931488 ) ( OBJ-AT ?auto_1931480 ?auto_1931488 ) ( IN-CITY ?auto_1931489 ?auto_1931487 ) ( not ( = ?auto_1931478 ?auto_1931489 ) ) ( OBJ-AT ?auto_1931484 ?auto_1931489 ) ( IN-CITY ?auto_1931486 ?auto_1931487 ) ( not ( = ?auto_1931478 ?auto_1931486 ) ) ( OBJ-AT ?auto_1931482 ?auto_1931486 ) ( OBJ-AT ?auto_1931479 ?auto_1931485 ) ( TRUCK-AT ?auto_1931490 ?auto_1931478 ) ( not ( = ?auto_1931479 ?auto_1931482 ) ) ( not ( = ?auto_1931486 ?auto_1931485 ) ) ( not ( = ?auto_1931479 ?auto_1931484 ) ) ( not ( = ?auto_1931482 ?auto_1931484 ) ) ( not ( = ?auto_1931489 ?auto_1931486 ) ) ( not ( = ?auto_1931489 ?auto_1931485 ) ) ( not ( = ?auto_1931479 ?auto_1931480 ) ) ( not ( = ?auto_1931482 ?auto_1931480 ) ) ( not ( = ?auto_1931484 ?auto_1931480 ) ) ( not ( = ?auto_1931488 ?auto_1931489 ) ) ( not ( = ?auto_1931488 ?auto_1931486 ) ) ( not ( = ?auto_1931488 ?auto_1931485 ) ) ( not ( = ?auto_1931479 ?auto_1931483 ) ) ( not ( = ?auto_1931482 ?auto_1931483 ) ) ( not ( = ?auto_1931484 ?auto_1931483 ) ) ( not ( = ?auto_1931480 ?auto_1931483 ) ) ( not ( = ?auto_1931479 ?auto_1931481 ) ) ( not ( = ?auto_1931482 ?auto_1931481 ) ) ( not ( = ?auto_1931484 ?auto_1931481 ) ) ( not ( = ?auto_1931480 ?auto_1931481 ) ) ( not ( = ?auto_1931483 ?auto_1931481 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1931479 ?auto_1931482 ?auto_1931484 ?auto_1931480 ?auto_1931481 ?auto_1931483 ?auto_1931478 )
      ( DELIVER-6PKG-VERIFY ?auto_1931479 ?auto_1931480 ?auto_1931481 ?auto_1931482 ?auto_1931483 ?auto_1931484 ?auto_1931478 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1932787 - OBJ
      ?auto_1932788 - OBJ
      ?auto_1932789 - OBJ
      ?auto_1932790 - OBJ
      ?auto_1932791 - OBJ
      ?auto_1932792 - OBJ
      ?auto_1932786 - LOCATION
    )
    :vars
    (
      ?auto_1932793 - LOCATION
      ?auto_1932795 - CITY
      ?auto_1932796 - LOCATION
      ?auto_1932797 - LOCATION
      ?auto_1932794 - LOCATION
      ?auto_1932798 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1932793 ?auto_1932795 ) ( IN-CITY ?auto_1932786 ?auto_1932795 ) ( not ( = ?auto_1932786 ?auto_1932793 ) ) ( OBJ-AT ?auto_1932789 ?auto_1932793 ) ( IN-CITY ?auto_1932796 ?auto_1932795 ) ( not ( = ?auto_1932786 ?auto_1932796 ) ) ( OBJ-AT ?auto_1932790 ?auto_1932796 ) ( OBJ-AT ?auto_1932788 ?auto_1932796 ) ( IN-CITY ?auto_1932797 ?auto_1932795 ) ( not ( = ?auto_1932786 ?auto_1932797 ) ) ( OBJ-AT ?auto_1932792 ?auto_1932797 ) ( IN-CITY ?auto_1932794 ?auto_1932795 ) ( not ( = ?auto_1932786 ?auto_1932794 ) ) ( OBJ-AT ?auto_1932791 ?auto_1932794 ) ( OBJ-AT ?auto_1932787 ?auto_1932793 ) ( TRUCK-AT ?auto_1932798 ?auto_1932786 ) ( not ( = ?auto_1932787 ?auto_1932791 ) ) ( not ( = ?auto_1932794 ?auto_1932793 ) ) ( not ( = ?auto_1932787 ?auto_1932792 ) ) ( not ( = ?auto_1932791 ?auto_1932792 ) ) ( not ( = ?auto_1932797 ?auto_1932794 ) ) ( not ( = ?auto_1932797 ?auto_1932793 ) ) ( not ( = ?auto_1932787 ?auto_1932788 ) ) ( not ( = ?auto_1932791 ?auto_1932788 ) ) ( not ( = ?auto_1932792 ?auto_1932788 ) ) ( not ( = ?auto_1932796 ?auto_1932797 ) ) ( not ( = ?auto_1932796 ?auto_1932794 ) ) ( not ( = ?auto_1932796 ?auto_1932793 ) ) ( not ( = ?auto_1932787 ?auto_1932790 ) ) ( not ( = ?auto_1932791 ?auto_1932790 ) ) ( not ( = ?auto_1932792 ?auto_1932790 ) ) ( not ( = ?auto_1932788 ?auto_1932790 ) ) ( not ( = ?auto_1932787 ?auto_1932789 ) ) ( not ( = ?auto_1932791 ?auto_1932789 ) ) ( not ( = ?auto_1932792 ?auto_1932789 ) ) ( not ( = ?auto_1932788 ?auto_1932789 ) ) ( not ( = ?auto_1932790 ?auto_1932789 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1932787 ?auto_1932791 ?auto_1932792 ?auto_1932788 ?auto_1932789 ?auto_1932790 ?auto_1932786 )
      ( DELIVER-6PKG-VERIFY ?auto_1932787 ?auto_1932788 ?auto_1932789 ?auto_1932790 ?auto_1932791 ?auto_1932792 ?auto_1932786 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1948126 - OBJ
      ?auto_1948127 - OBJ
      ?auto_1948128 - OBJ
      ?auto_1948129 - OBJ
      ?auto_1948130 - OBJ
      ?auto_1948131 - OBJ
      ?auto_1948125 - LOCATION
    )
    :vars
    (
      ?auto_1948132 - LOCATION
      ?auto_1948134 - CITY
      ?auto_1948135 - LOCATION
      ?auto_1948136 - LOCATION
      ?auto_1948133 - LOCATION
      ?auto_1948137 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1948132 ?auto_1948134 ) ( IN-CITY ?auto_1948125 ?auto_1948134 ) ( not ( = ?auto_1948125 ?auto_1948132 ) ) ( OBJ-AT ?auto_1948127 ?auto_1948132 ) ( IN-CITY ?auto_1948135 ?auto_1948134 ) ( not ( = ?auto_1948125 ?auto_1948135 ) ) ( OBJ-AT ?auto_1948131 ?auto_1948135 ) ( OBJ-AT ?auto_1948130 ?auto_1948135 ) ( IN-CITY ?auto_1948136 ?auto_1948134 ) ( not ( = ?auto_1948125 ?auto_1948136 ) ) ( OBJ-AT ?auto_1948129 ?auto_1948136 ) ( IN-CITY ?auto_1948133 ?auto_1948134 ) ( not ( = ?auto_1948125 ?auto_1948133 ) ) ( OBJ-AT ?auto_1948128 ?auto_1948133 ) ( OBJ-AT ?auto_1948126 ?auto_1948132 ) ( TRUCK-AT ?auto_1948137 ?auto_1948125 ) ( not ( = ?auto_1948126 ?auto_1948128 ) ) ( not ( = ?auto_1948133 ?auto_1948132 ) ) ( not ( = ?auto_1948126 ?auto_1948129 ) ) ( not ( = ?auto_1948128 ?auto_1948129 ) ) ( not ( = ?auto_1948136 ?auto_1948133 ) ) ( not ( = ?auto_1948136 ?auto_1948132 ) ) ( not ( = ?auto_1948126 ?auto_1948130 ) ) ( not ( = ?auto_1948128 ?auto_1948130 ) ) ( not ( = ?auto_1948129 ?auto_1948130 ) ) ( not ( = ?auto_1948135 ?auto_1948136 ) ) ( not ( = ?auto_1948135 ?auto_1948133 ) ) ( not ( = ?auto_1948135 ?auto_1948132 ) ) ( not ( = ?auto_1948126 ?auto_1948131 ) ) ( not ( = ?auto_1948128 ?auto_1948131 ) ) ( not ( = ?auto_1948129 ?auto_1948131 ) ) ( not ( = ?auto_1948130 ?auto_1948131 ) ) ( not ( = ?auto_1948126 ?auto_1948127 ) ) ( not ( = ?auto_1948128 ?auto_1948127 ) ) ( not ( = ?auto_1948129 ?auto_1948127 ) ) ( not ( = ?auto_1948130 ?auto_1948127 ) ) ( not ( = ?auto_1948131 ?auto_1948127 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1948126 ?auto_1948128 ?auto_1948129 ?auto_1948130 ?auto_1948127 ?auto_1948131 ?auto_1948125 )
      ( DELIVER-6PKG-VERIFY ?auto_1948126 ?auto_1948127 ?auto_1948128 ?auto_1948129 ?auto_1948130 ?auto_1948131 ?auto_1948125 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1948550 - OBJ
      ?auto_1948551 - OBJ
      ?auto_1948552 - OBJ
      ?auto_1948553 - OBJ
      ?auto_1948554 - OBJ
      ?auto_1948555 - OBJ
      ?auto_1948549 - LOCATION
    )
    :vars
    (
      ?auto_1948556 - LOCATION
      ?auto_1948558 - CITY
      ?auto_1948559 - LOCATION
      ?auto_1948560 - LOCATION
      ?auto_1948557 - LOCATION
      ?auto_1948561 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1948556 ?auto_1948558 ) ( IN-CITY ?auto_1948549 ?auto_1948558 ) ( not ( = ?auto_1948549 ?auto_1948556 ) ) ( OBJ-AT ?auto_1948551 ?auto_1948556 ) ( IN-CITY ?auto_1948559 ?auto_1948558 ) ( not ( = ?auto_1948549 ?auto_1948559 ) ) ( OBJ-AT ?auto_1948555 ?auto_1948559 ) ( OBJ-AT ?auto_1948553 ?auto_1948559 ) ( IN-CITY ?auto_1948560 ?auto_1948558 ) ( not ( = ?auto_1948549 ?auto_1948560 ) ) ( OBJ-AT ?auto_1948554 ?auto_1948560 ) ( IN-CITY ?auto_1948557 ?auto_1948558 ) ( not ( = ?auto_1948549 ?auto_1948557 ) ) ( OBJ-AT ?auto_1948552 ?auto_1948557 ) ( OBJ-AT ?auto_1948550 ?auto_1948556 ) ( TRUCK-AT ?auto_1948561 ?auto_1948549 ) ( not ( = ?auto_1948550 ?auto_1948552 ) ) ( not ( = ?auto_1948557 ?auto_1948556 ) ) ( not ( = ?auto_1948550 ?auto_1948554 ) ) ( not ( = ?auto_1948552 ?auto_1948554 ) ) ( not ( = ?auto_1948560 ?auto_1948557 ) ) ( not ( = ?auto_1948560 ?auto_1948556 ) ) ( not ( = ?auto_1948550 ?auto_1948553 ) ) ( not ( = ?auto_1948552 ?auto_1948553 ) ) ( not ( = ?auto_1948554 ?auto_1948553 ) ) ( not ( = ?auto_1948559 ?auto_1948560 ) ) ( not ( = ?auto_1948559 ?auto_1948557 ) ) ( not ( = ?auto_1948559 ?auto_1948556 ) ) ( not ( = ?auto_1948550 ?auto_1948555 ) ) ( not ( = ?auto_1948552 ?auto_1948555 ) ) ( not ( = ?auto_1948554 ?auto_1948555 ) ) ( not ( = ?auto_1948553 ?auto_1948555 ) ) ( not ( = ?auto_1948550 ?auto_1948551 ) ) ( not ( = ?auto_1948552 ?auto_1948551 ) ) ( not ( = ?auto_1948554 ?auto_1948551 ) ) ( not ( = ?auto_1948553 ?auto_1948551 ) ) ( not ( = ?auto_1948555 ?auto_1948551 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1948550 ?auto_1948552 ?auto_1948554 ?auto_1948553 ?auto_1948551 ?auto_1948555 ?auto_1948549 )
      ( DELIVER-6PKG-VERIFY ?auto_1948550 ?auto_1948551 ?auto_1948552 ?auto_1948553 ?auto_1948554 ?auto_1948555 ?auto_1948549 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1948693 - OBJ
      ?auto_1948694 - OBJ
      ?auto_1948695 - OBJ
      ?auto_1948696 - OBJ
      ?auto_1948697 - OBJ
      ?auto_1948698 - OBJ
      ?auto_1948692 - LOCATION
    )
    :vars
    (
      ?auto_1948699 - LOCATION
      ?auto_1948701 - CITY
      ?auto_1948702 - LOCATION
      ?auto_1948703 - LOCATION
      ?auto_1948700 - LOCATION
      ?auto_1948704 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1948699 ?auto_1948701 ) ( IN-CITY ?auto_1948692 ?auto_1948701 ) ( not ( = ?auto_1948692 ?auto_1948699 ) ) ( OBJ-AT ?auto_1948694 ?auto_1948699 ) ( IN-CITY ?auto_1948702 ?auto_1948701 ) ( not ( = ?auto_1948692 ?auto_1948702 ) ) ( OBJ-AT ?auto_1948697 ?auto_1948702 ) ( OBJ-AT ?auto_1948696 ?auto_1948702 ) ( IN-CITY ?auto_1948703 ?auto_1948701 ) ( not ( = ?auto_1948692 ?auto_1948703 ) ) ( OBJ-AT ?auto_1948698 ?auto_1948703 ) ( IN-CITY ?auto_1948700 ?auto_1948701 ) ( not ( = ?auto_1948692 ?auto_1948700 ) ) ( OBJ-AT ?auto_1948695 ?auto_1948700 ) ( OBJ-AT ?auto_1948693 ?auto_1948699 ) ( TRUCK-AT ?auto_1948704 ?auto_1948692 ) ( not ( = ?auto_1948693 ?auto_1948695 ) ) ( not ( = ?auto_1948700 ?auto_1948699 ) ) ( not ( = ?auto_1948693 ?auto_1948698 ) ) ( not ( = ?auto_1948695 ?auto_1948698 ) ) ( not ( = ?auto_1948703 ?auto_1948700 ) ) ( not ( = ?auto_1948703 ?auto_1948699 ) ) ( not ( = ?auto_1948693 ?auto_1948696 ) ) ( not ( = ?auto_1948695 ?auto_1948696 ) ) ( not ( = ?auto_1948698 ?auto_1948696 ) ) ( not ( = ?auto_1948702 ?auto_1948703 ) ) ( not ( = ?auto_1948702 ?auto_1948700 ) ) ( not ( = ?auto_1948702 ?auto_1948699 ) ) ( not ( = ?auto_1948693 ?auto_1948697 ) ) ( not ( = ?auto_1948695 ?auto_1948697 ) ) ( not ( = ?auto_1948698 ?auto_1948697 ) ) ( not ( = ?auto_1948696 ?auto_1948697 ) ) ( not ( = ?auto_1948693 ?auto_1948694 ) ) ( not ( = ?auto_1948695 ?auto_1948694 ) ) ( not ( = ?auto_1948698 ?auto_1948694 ) ) ( not ( = ?auto_1948696 ?auto_1948694 ) ) ( not ( = ?auto_1948697 ?auto_1948694 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1948693 ?auto_1948695 ?auto_1948698 ?auto_1948696 ?auto_1948694 ?auto_1948697 ?auto_1948692 )
      ( DELIVER-6PKG-VERIFY ?auto_1948693 ?auto_1948694 ?auto_1948695 ?auto_1948696 ?auto_1948697 ?auto_1948698 ?auto_1948692 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1953807 - OBJ
      ?auto_1953808 - OBJ
      ?auto_1953809 - OBJ
      ?auto_1953810 - OBJ
      ?auto_1953811 - OBJ
      ?auto_1953812 - OBJ
      ?auto_1953806 - LOCATION
    )
    :vars
    (
      ?auto_1953813 - LOCATION
      ?auto_1953815 - CITY
      ?auto_1953816 - LOCATION
      ?auto_1953817 - LOCATION
      ?auto_1953814 - LOCATION
      ?auto_1953818 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1953813 ?auto_1953815 ) ( IN-CITY ?auto_1953806 ?auto_1953815 ) ( not ( = ?auto_1953806 ?auto_1953813 ) ) ( OBJ-AT ?auto_1953808 ?auto_1953813 ) ( IN-CITY ?auto_1953816 ?auto_1953815 ) ( not ( = ?auto_1953806 ?auto_1953816 ) ) ( OBJ-AT ?auto_1953812 ?auto_1953816 ) ( OBJ-AT ?auto_1953809 ?auto_1953816 ) ( IN-CITY ?auto_1953817 ?auto_1953815 ) ( not ( = ?auto_1953806 ?auto_1953817 ) ) ( OBJ-AT ?auto_1953811 ?auto_1953817 ) ( IN-CITY ?auto_1953814 ?auto_1953815 ) ( not ( = ?auto_1953806 ?auto_1953814 ) ) ( OBJ-AT ?auto_1953810 ?auto_1953814 ) ( OBJ-AT ?auto_1953807 ?auto_1953813 ) ( TRUCK-AT ?auto_1953818 ?auto_1953806 ) ( not ( = ?auto_1953807 ?auto_1953810 ) ) ( not ( = ?auto_1953814 ?auto_1953813 ) ) ( not ( = ?auto_1953807 ?auto_1953811 ) ) ( not ( = ?auto_1953810 ?auto_1953811 ) ) ( not ( = ?auto_1953817 ?auto_1953814 ) ) ( not ( = ?auto_1953817 ?auto_1953813 ) ) ( not ( = ?auto_1953807 ?auto_1953809 ) ) ( not ( = ?auto_1953810 ?auto_1953809 ) ) ( not ( = ?auto_1953811 ?auto_1953809 ) ) ( not ( = ?auto_1953816 ?auto_1953817 ) ) ( not ( = ?auto_1953816 ?auto_1953814 ) ) ( not ( = ?auto_1953816 ?auto_1953813 ) ) ( not ( = ?auto_1953807 ?auto_1953812 ) ) ( not ( = ?auto_1953810 ?auto_1953812 ) ) ( not ( = ?auto_1953811 ?auto_1953812 ) ) ( not ( = ?auto_1953809 ?auto_1953812 ) ) ( not ( = ?auto_1953807 ?auto_1953808 ) ) ( not ( = ?auto_1953810 ?auto_1953808 ) ) ( not ( = ?auto_1953811 ?auto_1953808 ) ) ( not ( = ?auto_1953809 ?auto_1953808 ) ) ( not ( = ?auto_1953812 ?auto_1953808 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1953807 ?auto_1953810 ?auto_1953811 ?auto_1953809 ?auto_1953808 ?auto_1953812 ?auto_1953806 )
      ( DELIVER-6PKG-VERIFY ?auto_1953807 ?auto_1953808 ?auto_1953809 ?auto_1953810 ?auto_1953811 ?auto_1953812 ?auto_1953806 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1953950 - OBJ
      ?auto_1953951 - OBJ
      ?auto_1953952 - OBJ
      ?auto_1953953 - OBJ
      ?auto_1953954 - OBJ
      ?auto_1953955 - OBJ
      ?auto_1953949 - LOCATION
    )
    :vars
    (
      ?auto_1953956 - LOCATION
      ?auto_1953958 - CITY
      ?auto_1953959 - LOCATION
      ?auto_1953960 - LOCATION
      ?auto_1953957 - LOCATION
      ?auto_1953961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1953956 ?auto_1953958 ) ( IN-CITY ?auto_1953949 ?auto_1953958 ) ( not ( = ?auto_1953949 ?auto_1953956 ) ) ( OBJ-AT ?auto_1953951 ?auto_1953956 ) ( IN-CITY ?auto_1953959 ?auto_1953958 ) ( not ( = ?auto_1953949 ?auto_1953959 ) ) ( OBJ-AT ?auto_1953954 ?auto_1953959 ) ( OBJ-AT ?auto_1953952 ?auto_1953959 ) ( IN-CITY ?auto_1953960 ?auto_1953958 ) ( not ( = ?auto_1953949 ?auto_1953960 ) ) ( OBJ-AT ?auto_1953955 ?auto_1953960 ) ( IN-CITY ?auto_1953957 ?auto_1953958 ) ( not ( = ?auto_1953949 ?auto_1953957 ) ) ( OBJ-AT ?auto_1953953 ?auto_1953957 ) ( OBJ-AT ?auto_1953950 ?auto_1953956 ) ( TRUCK-AT ?auto_1953961 ?auto_1953949 ) ( not ( = ?auto_1953950 ?auto_1953953 ) ) ( not ( = ?auto_1953957 ?auto_1953956 ) ) ( not ( = ?auto_1953950 ?auto_1953955 ) ) ( not ( = ?auto_1953953 ?auto_1953955 ) ) ( not ( = ?auto_1953960 ?auto_1953957 ) ) ( not ( = ?auto_1953960 ?auto_1953956 ) ) ( not ( = ?auto_1953950 ?auto_1953952 ) ) ( not ( = ?auto_1953953 ?auto_1953952 ) ) ( not ( = ?auto_1953955 ?auto_1953952 ) ) ( not ( = ?auto_1953959 ?auto_1953960 ) ) ( not ( = ?auto_1953959 ?auto_1953957 ) ) ( not ( = ?auto_1953959 ?auto_1953956 ) ) ( not ( = ?auto_1953950 ?auto_1953954 ) ) ( not ( = ?auto_1953953 ?auto_1953954 ) ) ( not ( = ?auto_1953955 ?auto_1953954 ) ) ( not ( = ?auto_1953952 ?auto_1953954 ) ) ( not ( = ?auto_1953950 ?auto_1953951 ) ) ( not ( = ?auto_1953953 ?auto_1953951 ) ) ( not ( = ?auto_1953955 ?auto_1953951 ) ) ( not ( = ?auto_1953952 ?auto_1953951 ) ) ( not ( = ?auto_1953954 ?auto_1953951 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1953950 ?auto_1953953 ?auto_1953955 ?auto_1953952 ?auto_1953951 ?auto_1953954 ?auto_1953949 )
      ( DELIVER-6PKG-VERIFY ?auto_1953950 ?auto_1953951 ?auto_1953952 ?auto_1953953 ?auto_1953954 ?auto_1953955 ?auto_1953949 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1955258 - OBJ
      ?auto_1955259 - OBJ
      ?auto_1955260 - OBJ
      ?auto_1955261 - OBJ
      ?auto_1955262 - OBJ
      ?auto_1955263 - OBJ
      ?auto_1955257 - LOCATION
    )
    :vars
    (
      ?auto_1955264 - LOCATION
      ?auto_1955266 - CITY
      ?auto_1955267 - LOCATION
      ?auto_1955268 - LOCATION
      ?auto_1955265 - LOCATION
      ?auto_1955269 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1955264 ?auto_1955266 ) ( IN-CITY ?auto_1955257 ?auto_1955266 ) ( not ( = ?auto_1955257 ?auto_1955264 ) ) ( OBJ-AT ?auto_1955259 ?auto_1955264 ) ( IN-CITY ?auto_1955267 ?auto_1955266 ) ( not ( = ?auto_1955257 ?auto_1955267 ) ) ( OBJ-AT ?auto_1955261 ?auto_1955267 ) ( OBJ-AT ?auto_1955260 ?auto_1955267 ) ( IN-CITY ?auto_1955268 ?auto_1955266 ) ( not ( = ?auto_1955257 ?auto_1955268 ) ) ( OBJ-AT ?auto_1955263 ?auto_1955268 ) ( IN-CITY ?auto_1955265 ?auto_1955266 ) ( not ( = ?auto_1955257 ?auto_1955265 ) ) ( OBJ-AT ?auto_1955262 ?auto_1955265 ) ( OBJ-AT ?auto_1955258 ?auto_1955264 ) ( TRUCK-AT ?auto_1955269 ?auto_1955257 ) ( not ( = ?auto_1955258 ?auto_1955262 ) ) ( not ( = ?auto_1955265 ?auto_1955264 ) ) ( not ( = ?auto_1955258 ?auto_1955263 ) ) ( not ( = ?auto_1955262 ?auto_1955263 ) ) ( not ( = ?auto_1955268 ?auto_1955265 ) ) ( not ( = ?auto_1955268 ?auto_1955264 ) ) ( not ( = ?auto_1955258 ?auto_1955260 ) ) ( not ( = ?auto_1955262 ?auto_1955260 ) ) ( not ( = ?auto_1955263 ?auto_1955260 ) ) ( not ( = ?auto_1955267 ?auto_1955268 ) ) ( not ( = ?auto_1955267 ?auto_1955265 ) ) ( not ( = ?auto_1955267 ?auto_1955264 ) ) ( not ( = ?auto_1955258 ?auto_1955261 ) ) ( not ( = ?auto_1955262 ?auto_1955261 ) ) ( not ( = ?auto_1955263 ?auto_1955261 ) ) ( not ( = ?auto_1955260 ?auto_1955261 ) ) ( not ( = ?auto_1955258 ?auto_1955259 ) ) ( not ( = ?auto_1955262 ?auto_1955259 ) ) ( not ( = ?auto_1955263 ?auto_1955259 ) ) ( not ( = ?auto_1955260 ?auto_1955259 ) ) ( not ( = ?auto_1955261 ?auto_1955259 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1955258 ?auto_1955262 ?auto_1955263 ?auto_1955260 ?auto_1955259 ?auto_1955261 ?auto_1955257 )
      ( DELIVER-6PKG-VERIFY ?auto_1955258 ?auto_1955259 ?auto_1955260 ?auto_1955261 ?auto_1955262 ?auto_1955263 ?auto_1955257 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1965923 - OBJ
      ?auto_1965924 - OBJ
      ?auto_1965925 - OBJ
      ?auto_1965926 - OBJ
      ?auto_1965927 - OBJ
      ?auto_1965928 - OBJ
      ?auto_1965922 - LOCATION
    )
    :vars
    (
      ?auto_1965929 - LOCATION
      ?auto_1965931 - CITY
      ?auto_1965932 - LOCATION
      ?auto_1965933 - LOCATION
      ?auto_1965930 - LOCATION
      ?auto_1965934 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1965929 ?auto_1965931 ) ( IN-CITY ?auto_1965922 ?auto_1965931 ) ( not ( = ?auto_1965922 ?auto_1965929 ) ) ( OBJ-AT ?auto_1965928 ?auto_1965929 ) ( IN-CITY ?auto_1965932 ?auto_1965931 ) ( not ( = ?auto_1965922 ?auto_1965932 ) ) ( OBJ-AT ?auto_1965927 ?auto_1965932 ) ( OBJ-AT ?auto_1965926 ?auto_1965932 ) ( IN-CITY ?auto_1965933 ?auto_1965931 ) ( not ( = ?auto_1965922 ?auto_1965933 ) ) ( OBJ-AT ?auto_1965925 ?auto_1965933 ) ( IN-CITY ?auto_1965930 ?auto_1965931 ) ( not ( = ?auto_1965922 ?auto_1965930 ) ) ( OBJ-AT ?auto_1965923 ?auto_1965930 ) ( OBJ-AT ?auto_1965924 ?auto_1965929 ) ( TRUCK-AT ?auto_1965934 ?auto_1965922 ) ( not ( = ?auto_1965924 ?auto_1965923 ) ) ( not ( = ?auto_1965930 ?auto_1965929 ) ) ( not ( = ?auto_1965924 ?auto_1965925 ) ) ( not ( = ?auto_1965923 ?auto_1965925 ) ) ( not ( = ?auto_1965933 ?auto_1965930 ) ) ( not ( = ?auto_1965933 ?auto_1965929 ) ) ( not ( = ?auto_1965924 ?auto_1965926 ) ) ( not ( = ?auto_1965923 ?auto_1965926 ) ) ( not ( = ?auto_1965925 ?auto_1965926 ) ) ( not ( = ?auto_1965932 ?auto_1965933 ) ) ( not ( = ?auto_1965932 ?auto_1965930 ) ) ( not ( = ?auto_1965932 ?auto_1965929 ) ) ( not ( = ?auto_1965924 ?auto_1965927 ) ) ( not ( = ?auto_1965923 ?auto_1965927 ) ) ( not ( = ?auto_1965925 ?auto_1965927 ) ) ( not ( = ?auto_1965926 ?auto_1965927 ) ) ( not ( = ?auto_1965924 ?auto_1965928 ) ) ( not ( = ?auto_1965923 ?auto_1965928 ) ) ( not ( = ?auto_1965925 ?auto_1965928 ) ) ( not ( = ?auto_1965926 ?auto_1965928 ) ) ( not ( = ?auto_1965927 ?auto_1965928 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1965924 ?auto_1965923 ?auto_1965925 ?auto_1965926 ?auto_1965928 ?auto_1965927 ?auto_1965922 )
      ( DELIVER-6PKG-VERIFY ?auto_1965923 ?auto_1965924 ?auto_1965925 ?auto_1965926 ?auto_1965927 ?auto_1965928 ?auto_1965922 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1965992 - OBJ
      ?auto_1965993 - OBJ
      ?auto_1965994 - OBJ
      ?auto_1965995 - OBJ
      ?auto_1965996 - OBJ
      ?auto_1965997 - OBJ
      ?auto_1965991 - LOCATION
    )
    :vars
    (
      ?auto_1965998 - LOCATION
      ?auto_1966000 - CITY
      ?auto_1966001 - LOCATION
      ?auto_1966002 - LOCATION
      ?auto_1965999 - LOCATION
      ?auto_1966003 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1965998 ?auto_1966000 ) ( IN-CITY ?auto_1965991 ?auto_1966000 ) ( not ( = ?auto_1965991 ?auto_1965998 ) ) ( OBJ-AT ?auto_1965996 ?auto_1965998 ) ( IN-CITY ?auto_1966001 ?auto_1966000 ) ( not ( = ?auto_1965991 ?auto_1966001 ) ) ( OBJ-AT ?auto_1965997 ?auto_1966001 ) ( OBJ-AT ?auto_1965995 ?auto_1966001 ) ( IN-CITY ?auto_1966002 ?auto_1966000 ) ( not ( = ?auto_1965991 ?auto_1966002 ) ) ( OBJ-AT ?auto_1965994 ?auto_1966002 ) ( IN-CITY ?auto_1965999 ?auto_1966000 ) ( not ( = ?auto_1965991 ?auto_1965999 ) ) ( OBJ-AT ?auto_1965992 ?auto_1965999 ) ( OBJ-AT ?auto_1965993 ?auto_1965998 ) ( TRUCK-AT ?auto_1966003 ?auto_1965991 ) ( not ( = ?auto_1965993 ?auto_1965992 ) ) ( not ( = ?auto_1965999 ?auto_1965998 ) ) ( not ( = ?auto_1965993 ?auto_1965994 ) ) ( not ( = ?auto_1965992 ?auto_1965994 ) ) ( not ( = ?auto_1966002 ?auto_1965999 ) ) ( not ( = ?auto_1966002 ?auto_1965998 ) ) ( not ( = ?auto_1965993 ?auto_1965995 ) ) ( not ( = ?auto_1965992 ?auto_1965995 ) ) ( not ( = ?auto_1965994 ?auto_1965995 ) ) ( not ( = ?auto_1966001 ?auto_1966002 ) ) ( not ( = ?auto_1966001 ?auto_1965999 ) ) ( not ( = ?auto_1966001 ?auto_1965998 ) ) ( not ( = ?auto_1965993 ?auto_1965997 ) ) ( not ( = ?auto_1965992 ?auto_1965997 ) ) ( not ( = ?auto_1965994 ?auto_1965997 ) ) ( not ( = ?auto_1965995 ?auto_1965997 ) ) ( not ( = ?auto_1965993 ?auto_1965996 ) ) ( not ( = ?auto_1965992 ?auto_1965996 ) ) ( not ( = ?auto_1965994 ?auto_1965996 ) ) ( not ( = ?auto_1965995 ?auto_1965996 ) ) ( not ( = ?auto_1965997 ?auto_1965996 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1965993 ?auto_1965992 ?auto_1965994 ?auto_1965995 ?auto_1965996 ?auto_1965997 ?auto_1965991 )
      ( DELIVER-6PKG-VERIFY ?auto_1965992 ?auto_1965993 ?auto_1965994 ?auto_1965995 ?auto_1965996 ?auto_1965997 ?auto_1965991 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1966479 - OBJ
      ?auto_1966480 - OBJ
      ?auto_1966481 - OBJ
      ?auto_1966482 - OBJ
      ?auto_1966483 - OBJ
      ?auto_1966484 - OBJ
      ?auto_1966478 - LOCATION
    )
    :vars
    (
      ?auto_1966485 - LOCATION
      ?auto_1966487 - CITY
      ?auto_1966488 - LOCATION
      ?auto_1966489 - LOCATION
      ?auto_1966486 - LOCATION
      ?auto_1966490 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1966485 ?auto_1966487 ) ( IN-CITY ?auto_1966478 ?auto_1966487 ) ( not ( = ?auto_1966478 ?auto_1966485 ) ) ( OBJ-AT ?auto_1966482 ?auto_1966485 ) ( IN-CITY ?auto_1966488 ?auto_1966487 ) ( not ( = ?auto_1966478 ?auto_1966488 ) ) ( OBJ-AT ?auto_1966484 ?auto_1966488 ) ( OBJ-AT ?auto_1966483 ?auto_1966488 ) ( IN-CITY ?auto_1966489 ?auto_1966487 ) ( not ( = ?auto_1966478 ?auto_1966489 ) ) ( OBJ-AT ?auto_1966481 ?auto_1966489 ) ( IN-CITY ?auto_1966486 ?auto_1966487 ) ( not ( = ?auto_1966478 ?auto_1966486 ) ) ( OBJ-AT ?auto_1966479 ?auto_1966486 ) ( OBJ-AT ?auto_1966480 ?auto_1966485 ) ( TRUCK-AT ?auto_1966490 ?auto_1966478 ) ( not ( = ?auto_1966480 ?auto_1966479 ) ) ( not ( = ?auto_1966486 ?auto_1966485 ) ) ( not ( = ?auto_1966480 ?auto_1966481 ) ) ( not ( = ?auto_1966479 ?auto_1966481 ) ) ( not ( = ?auto_1966489 ?auto_1966486 ) ) ( not ( = ?auto_1966489 ?auto_1966485 ) ) ( not ( = ?auto_1966480 ?auto_1966483 ) ) ( not ( = ?auto_1966479 ?auto_1966483 ) ) ( not ( = ?auto_1966481 ?auto_1966483 ) ) ( not ( = ?auto_1966488 ?auto_1966489 ) ) ( not ( = ?auto_1966488 ?auto_1966486 ) ) ( not ( = ?auto_1966488 ?auto_1966485 ) ) ( not ( = ?auto_1966480 ?auto_1966484 ) ) ( not ( = ?auto_1966479 ?auto_1966484 ) ) ( not ( = ?auto_1966481 ?auto_1966484 ) ) ( not ( = ?auto_1966483 ?auto_1966484 ) ) ( not ( = ?auto_1966480 ?auto_1966482 ) ) ( not ( = ?auto_1966479 ?auto_1966482 ) ) ( not ( = ?auto_1966481 ?auto_1966482 ) ) ( not ( = ?auto_1966483 ?auto_1966482 ) ) ( not ( = ?auto_1966484 ?auto_1966482 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1966480 ?auto_1966479 ?auto_1966481 ?auto_1966483 ?auto_1966482 ?auto_1966484 ?auto_1966478 )
      ( DELIVER-6PKG-VERIFY ?auto_1966479 ?auto_1966480 ?auto_1966481 ?auto_1966482 ?auto_1966483 ?auto_1966484 ?auto_1966478 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1967049 - OBJ
      ?auto_1967050 - OBJ
      ?auto_1967051 - OBJ
      ?auto_1967052 - OBJ
      ?auto_1967053 - OBJ
      ?auto_1967054 - OBJ
      ?auto_1967048 - LOCATION
    )
    :vars
    (
      ?auto_1967055 - LOCATION
      ?auto_1967057 - CITY
      ?auto_1967058 - LOCATION
      ?auto_1967059 - LOCATION
      ?auto_1967056 - LOCATION
      ?auto_1967060 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1967055 ?auto_1967057 ) ( IN-CITY ?auto_1967048 ?auto_1967057 ) ( not ( = ?auto_1967048 ?auto_1967055 ) ) ( OBJ-AT ?auto_1967054 ?auto_1967055 ) ( IN-CITY ?auto_1967058 ?auto_1967057 ) ( not ( = ?auto_1967048 ?auto_1967058 ) ) ( OBJ-AT ?auto_1967053 ?auto_1967058 ) ( OBJ-AT ?auto_1967051 ?auto_1967058 ) ( IN-CITY ?auto_1967059 ?auto_1967057 ) ( not ( = ?auto_1967048 ?auto_1967059 ) ) ( OBJ-AT ?auto_1967052 ?auto_1967059 ) ( IN-CITY ?auto_1967056 ?auto_1967057 ) ( not ( = ?auto_1967048 ?auto_1967056 ) ) ( OBJ-AT ?auto_1967049 ?auto_1967056 ) ( OBJ-AT ?auto_1967050 ?auto_1967055 ) ( TRUCK-AT ?auto_1967060 ?auto_1967048 ) ( not ( = ?auto_1967050 ?auto_1967049 ) ) ( not ( = ?auto_1967056 ?auto_1967055 ) ) ( not ( = ?auto_1967050 ?auto_1967052 ) ) ( not ( = ?auto_1967049 ?auto_1967052 ) ) ( not ( = ?auto_1967059 ?auto_1967056 ) ) ( not ( = ?auto_1967059 ?auto_1967055 ) ) ( not ( = ?auto_1967050 ?auto_1967051 ) ) ( not ( = ?auto_1967049 ?auto_1967051 ) ) ( not ( = ?auto_1967052 ?auto_1967051 ) ) ( not ( = ?auto_1967058 ?auto_1967059 ) ) ( not ( = ?auto_1967058 ?auto_1967056 ) ) ( not ( = ?auto_1967058 ?auto_1967055 ) ) ( not ( = ?auto_1967050 ?auto_1967053 ) ) ( not ( = ?auto_1967049 ?auto_1967053 ) ) ( not ( = ?auto_1967052 ?auto_1967053 ) ) ( not ( = ?auto_1967051 ?auto_1967053 ) ) ( not ( = ?auto_1967050 ?auto_1967054 ) ) ( not ( = ?auto_1967049 ?auto_1967054 ) ) ( not ( = ?auto_1967052 ?auto_1967054 ) ) ( not ( = ?auto_1967051 ?auto_1967054 ) ) ( not ( = ?auto_1967053 ?auto_1967054 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1967050 ?auto_1967049 ?auto_1967052 ?auto_1967051 ?auto_1967054 ?auto_1967053 ?auto_1967048 )
      ( DELIVER-6PKG-VERIFY ?auto_1967049 ?auto_1967050 ?auto_1967051 ?auto_1967052 ?auto_1967053 ?auto_1967054 ?auto_1967048 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1967118 - OBJ
      ?auto_1967119 - OBJ
      ?auto_1967120 - OBJ
      ?auto_1967121 - OBJ
      ?auto_1967122 - OBJ
      ?auto_1967123 - OBJ
      ?auto_1967117 - LOCATION
    )
    :vars
    (
      ?auto_1967124 - LOCATION
      ?auto_1967126 - CITY
      ?auto_1967127 - LOCATION
      ?auto_1967128 - LOCATION
      ?auto_1967125 - LOCATION
      ?auto_1967129 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1967124 ?auto_1967126 ) ( IN-CITY ?auto_1967117 ?auto_1967126 ) ( not ( = ?auto_1967117 ?auto_1967124 ) ) ( OBJ-AT ?auto_1967122 ?auto_1967124 ) ( IN-CITY ?auto_1967127 ?auto_1967126 ) ( not ( = ?auto_1967117 ?auto_1967127 ) ) ( OBJ-AT ?auto_1967123 ?auto_1967127 ) ( OBJ-AT ?auto_1967120 ?auto_1967127 ) ( IN-CITY ?auto_1967128 ?auto_1967126 ) ( not ( = ?auto_1967117 ?auto_1967128 ) ) ( OBJ-AT ?auto_1967121 ?auto_1967128 ) ( IN-CITY ?auto_1967125 ?auto_1967126 ) ( not ( = ?auto_1967117 ?auto_1967125 ) ) ( OBJ-AT ?auto_1967118 ?auto_1967125 ) ( OBJ-AT ?auto_1967119 ?auto_1967124 ) ( TRUCK-AT ?auto_1967129 ?auto_1967117 ) ( not ( = ?auto_1967119 ?auto_1967118 ) ) ( not ( = ?auto_1967125 ?auto_1967124 ) ) ( not ( = ?auto_1967119 ?auto_1967121 ) ) ( not ( = ?auto_1967118 ?auto_1967121 ) ) ( not ( = ?auto_1967128 ?auto_1967125 ) ) ( not ( = ?auto_1967128 ?auto_1967124 ) ) ( not ( = ?auto_1967119 ?auto_1967120 ) ) ( not ( = ?auto_1967118 ?auto_1967120 ) ) ( not ( = ?auto_1967121 ?auto_1967120 ) ) ( not ( = ?auto_1967127 ?auto_1967128 ) ) ( not ( = ?auto_1967127 ?auto_1967125 ) ) ( not ( = ?auto_1967127 ?auto_1967124 ) ) ( not ( = ?auto_1967119 ?auto_1967123 ) ) ( not ( = ?auto_1967118 ?auto_1967123 ) ) ( not ( = ?auto_1967121 ?auto_1967123 ) ) ( not ( = ?auto_1967120 ?auto_1967123 ) ) ( not ( = ?auto_1967119 ?auto_1967122 ) ) ( not ( = ?auto_1967118 ?auto_1967122 ) ) ( not ( = ?auto_1967121 ?auto_1967122 ) ) ( not ( = ?auto_1967120 ?auto_1967122 ) ) ( not ( = ?auto_1967123 ?auto_1967122 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1967119 ?auto_1967118 ?auto_1967121 ?auto_1967120 ?auto_1967122 ?auto_1967123 ?auto_1967117 )
      ( DELIVER-6PKG-VERIFY ?auto_1967118 ?auto_1967119 ?auto_1967120 ?auto_1967121 ?auto_1967122 ?auto_1967123 ?auto_1967117 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1967334 - OBJ
      ?auto_1967335 - OBJ
      ?auto_1967336 - OBJ
      ?auto_1967337 - OBJ
      ?auto_1967338 - OBJ
      ?auto_1967339 - OBJ
      ?auto_1967333 - LOCATION
    )
    :vars
    (
      ?auto_1967340 - LOCATION
      ?auto_1967342 - CITY
      ?auto_1967343 - LOCATION
      ?auto_1967344 - LOCATION
      ?auto_1967341 - LOCATION
      ?auto_1967345 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1967340 ?auto_1967342 ) ( IN-CITY ?auto_1967333 ?auto_1967342 ) ( not ( = ?auto_1967333 ?auto_1967340 ) ) ( OBJ-AT ?auto_1967339 ?auto_1967340 ) ( IN-CITY ?auto_1967343 ?auto_1967342 ) ( not ( = ?auto_1967333 ?auto_1967343 ) ) ( OBJ-AT ?auto_1967337 ?auto_1967343 ) ( OBJ-AT ?auto_1967336 ?auto_1967343 ) ( IN-CITY ?auto_1967344 ?auto_1967342 ) ( not ( = ?auto_1967333 ?auto_1967344 ) ) ( OBJ-AT ?auto_1967338 ?auto_1967344 ) ( IN-CITY ?auto_1967341 ?auto_1967342 ) ( not ( = ?auto_1967333 ?auto_1967341 ) ) ( OBJ-AT ?auto_1967334 ?auto_1967341 ) ( OBJ-AT ?auto_1967335 ?auto_1967340 ) ( TRUCK-AT ?auto_1967345 ?auto_1967333 ) ( not ( = ?auto_1967335 ?auto_1967334 ) ) ( not ( = ?auto_1967341 ?auto_1967340 ) ) ( not ( = ?auto_1967335 ?auto_1967338 ) ) ( not ( = ?auto_1967334 ?auto_1967338 ) ) ( not ( = ?auto_1967344 ?auto_1967341 ) ) ( not ( = ?auto_1967344 ?auto_1967340 ) ) ( not ( = ?auto_1967335 ?auto_1967336 ) ) ( not ( = ?auto_1967334 ?auto_1967336 ) ) ( not ( = ?auto_1967338 ?auto_1967336 ) ) ( not ( = ?auto_1967343 ?auto_1967344 ) ) ( not ( = ?auto_1967343 ?auto_1967341 ) ) ( not ( = ?auto_1967343 ?auto_1967340 ) ) ( not ( = ?auto_1967335 ?auto_1967337 ) ) ( not ( = ?auto_1967334 ?auto_1967337 ) ) ( not ( = ?auto_1967338 ?auto_1967337 ) ) ( not ( = ?auto_1967336 ?auto_1967337 ) ) ( not ( = ?auto_1967335 ?auto_1967339 ) ) ( not ( = ?auto_1967334 ?auto_1967339 ) ) ( not ( = ?auto_1967338 ?auto_1967339 ) ) ( not ( = ?auto_1967336 ?auto_1967339 ) ) ( not ( = ?auto_1967337 ?auto_1967339 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1967335 ?auto_1967334 ?auto_1967338 ?auto_1967336 ?auto_1967339 ?auto_1967337 ?auto_1967333 )
      ( DELIVER-6PKG-VERIFY ?auto_1967334 ?auto_1967335 ?auto_1967336 ?auto_1967337 ?auto_1967338 ?auto_1967339 ?auto_1967333 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1967403 - OBJ
      ?auto_1967404 - OBJ
      ?auto_1967405 - OBJ
      ?auto_1967406 - OBJ
      ?auto_1967407 - OBJ
      ?auto_1967408 - OBJ
      ?auto_1967402 - LOCATION
    )
    :vars
    (
      ?auto_1967409 - LOCATION
      ?auto_1967411 - CITY
      ?auto_1967412 - LOCATION
      ?auto_1967413 - LOCATION
      ?auto_1967410 - LOCATION
      ?auto_1967414 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1967409 ?auto_1967411 ) ( IN-CITY ?auto_1967402 ?auto_1967411 ) ( not ( = ?auto_1967402 ?auto_1967409 ) ) ( OBJ-AT ?auto_1967407 ?auto_1967409 ) ( IN-CITY ?auto_1967412 ?auto_1967411 ) ( not ( = ?auto_1967402 ?auto_1967412 ) ) ( OBJ-AT ?auto_1967406 ?auto_1967412 ) ( OBJ-AT ?auto_1967405 ?auto_1967412 ) ( IN-CITY ?auto_1967413 ?auto_1967411 ) ( not ( = ?auto_1967402 ?auto_1967413 ) ) ( OBJ-AT ?auto_1967408 ?auto_1967413 ) ( IN-CITY ?auto_1967410 ?auto_1967411 ) ( not ( = ?auto_1967402 ?auto_1967410 ) ) ( OBJ-AT ?auto_1967403 ?auto_1967410 ) ( OBJ-AT ?auto_1967404 ?auto_1967409 ) ( TRUCK-AT ?auto_1967414 ?auto_1967402 ) ( not ( = ?auto_1967404 ?auto_1967403 ) ) ( not ( = ?auto_1967410 ?auto_1967409 ) ) ( not ( = ?auto_1967404 ?auto_1967408 ) ) ( not ( = ?auto_1967403 ?auto_1967408 ) ) ( not ( = ?auto_1967413 ?auto_1967410 ) ) ( not ( = ?auto_1967413 ?auto_1967409 ) ) ( not ( = ?auto_1967404 ?auto_1967405 ) ) ( not ( = ?auto_1967403 ?auto_1967405 ) ) ( not ( = ?auto_1967408 ?auto_1967405 ) ) ( not ( = ?auto_1967412 ?auto_1967413 ) ) ( not ( = ?auto_1967412 ?auto_1967410 ) ) ( not ( = ?auto_1967412 ?auto_1967409 ) ) ( not ( = ?auto_1967404 ?auto_1967406 ) ) ( not ( = ?auto_1967403 ?auto_1967406 ) ) ( not ( = ?auto_1967408 ?auto_1967406 ) ) ( not ( = ?auto_1967405 ?auto_1967406 ) ) ( not ( = ?auto_1967404 ?auto_1967407 ) ) ( not ( = ?auto_1967403 ?auto_1967407 ) ) ( not ( = ?auto_1967408 ?auto_1967407 ) ) ( not ( = ?auto_1967405 ?auto_1967407 ) ) ( not ( = ?auto_1967406 ?auto_1967407 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1967404 ?auto_1967403 ?auto_1967408 ?auto_1967405 ?auto_1967407 ?auto_1967406 ?auto_1967402 )
      ( DELIVER-6PKG-VERIFY ?auto_1967403 ?auto_1967404 ?auto_1967405 ?auto_1967406 ?auto_1967407 ?auto_1967408 ?auto_1967402 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1967690 - OBJ
      ?auto_1967691 - OBJ
      ?auto_1967692 - OBJ
      ?auto_1967693 - OBJ
      ?auto_1967694 - OBJ
      ?auto_1967695 - OBJ
      ?auto_1967689 - LOCATION
    )
    :vars
    (
      ?auto_1967696 - LOCATION
      ?auto_1967698 - CITY
      ?auto_1967699 - LOCATION
      ?auto_1967700 - LOCATION
      ?auto_1967697 - LOCATION
      ?auto_1967701 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1967696 ?auto_1967698 ) ( IN-CITY ?auto_1967689 ?auto_1967698 ) ( not ( = ?auto_1967689 ?auto_1967696 ) ) ( OBJ-AT ?auto_1967693 ?auto_1967696 ) ( IN-CITY ?auto_1967699 ?auto_1967698 ) ( not ( = ?auto_1967689 ?auto_1967699 ) ) ( OBJ-AT ?auto_1967695 ?auto_1967699 ) ( OBJ-AT ?auto_1967692 ?auto_1967699 ) ( IN-CITY ?auto_1967700 ?auto_1967698 ) ( not ( = ?auto_1967689 ?auto_1967700 ) ) ( OBJ-AT ?auto_1967694 ?auto_1967700 ) ( IN-CITY ?auto_1967697 ?auto_1967698 ) ( not ( = ?auto_1967689 ?auto_1967697 ) ) ( OBJ-AT ?auto_1967690 ?auto_1967697 ) ( OBJ-AT ?auto_1967691 ?auto_1967696 ) ( TRUCK-AT ?auto_1967701 ?auto_1967689 ) ( not ( = ?auto_1967691 ?auto_1967690 ) ) ( not ( = ?auto_1967697 ?auto_1967696 ) ) ( not ( = ?auto_1967691 ?auto_1967694 ) ) ( not ( = ?auto_1967690 ?auto_1967694 ) ) ( not ( = ?auto_1967700 ?auto_1967697 ) ) ( not ( = ?auto_1967700 ?auto_1967696 ) ) ( not ( = ?auto_1967691 ?auto_1967692 ) ) ( not ( = ?auto_1967690 ?auto_1967692 ) ) ( not ( = ?auto_1967694 ?auto_1967692 ) ) ( not ( = ?auto_1967699 ?auto_1967700 ) ) ( not ( = ?auto_1967699 ?auto_1967697 ) ) ( not ( = ?auto_1967699 ?auto_1967696 ) ) ( not ( = ?auto_1967691 ?auto_1967695 ) ) ( not ( = ?auto_1967690 ?auto_1967695 ) ) ( not ( = ?auto_1967694 ?auto_1967695 ) ) ( not ( = ?auto_1967692 ?auto_1967695 ) ) ( not ( = ?auto_1967691 ?auto_1967693 ) ) ( not ( = ?auto_1967690 ?auto_1967693 ) ) ( not ( = ?auto_1967694 ?auto_1967693 ) ) ( not ( = ?auto_1967692 ?auto_1967693 ) ) ( not ( = ?auto_1967695 ?auto_1967693 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1967691 ?auto_1967690 ?auto_1967694 ?auto_1967692 ?auto_1967693 ?auto_1967695 ?auto_1967689 )
      ( DELIVER-6PKG-VERIFY ?auto_1967690 ?auto_1967691 ?auto_1967692 ?auto_1967693 ?auto_1967694 ?auto_1967695 ?auto_1967689 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1967833 - OBJ
      ?auto_1967834 - OBJ
      ?auto_1967835 - OBJ
      ?auto_1967836 - OBJ
      ?auto_1967837 - OBJ
      ?auto_1967838 - OBJ
      ?auto_1967832 - LOCATION
    )
    :vars
    (
      ?auto_1967839 - LOCATION
      ?auto_1967841 - CITY
      ?auto_1967842 - LOCATION
      ?auto_1967843 - LOCATION
      ?auto_1967840 - LOCATION
      ?auto_1967844 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1967839 ?auto_1967841 ) ( IN-CITY ?auto_1967832 ?auto_1967841 ) ( not ( = ?auto_1967832 ?auto_1967839 ) ) ( OBJ-AT ?auto_1967836 ?auto_1967839 ) ( IN-CITY ?auto_1967842 ?auto_1967841 ) ( not ( = ?auto_1967832 ?auto_1967842 ) ) ( OBJ-AT ?auto_1967837 ?auto_1967842 ) ( OBJ-AT ?auto_1967835 ?auto_1967842 ) ( IN-CITY ?auto_1967843 ?auto_1967841 ) ( not ( = ?auto_1967832 ?auto_1967843 ) ) ( OBJ-AT ?auto_1967838 ?auto_1967843 ) ( IN-CITY ?auto_1967840 ?auto_1967841 ) ( not ( = ?auto_1967832 ?auto_1967840 ) ) ( OBJ-AT ?auto_1967833 ?auto_1967840 ) ( OBJ-AT ?auto_1967834 ?auto_1967839 ) ( TRUCK-AT ?auto_1967844 ?auto_1967832 ) ( not ( = ?auto_1967834 ?auto_1967833 ) ) ( not ( = ?auto_1967840 ?auto_1967839 ) ) ( not ( = ?auto_1967834 ?auto_1967838 ) ) ( not ( = ?auto_1967833 ?auto_1967838 ) ) ( not ( = ?auto_1967843 ?auto_1967840 ) ) ( not ( = ?auto_1967843 ?auto_1967839 ) ) ( not ( = ?auto_1967834 ?auto_1967835 ) ) ( not ( = ?auto_1967833 ?auto_1967835 ) ) ( not ( = ?auto_1967838 ?auto_1967835 ) ) ( not ( = ?auto_1967842 ?auto_1967843 ) ) ( not ( = ?auto_1967842 ?auto_1967840 ) ) ( not ( = ?auto_1967842 ?auto_1967839 ) ) ( not ( = ?auto_1967834 ?auto_1967837 ) ) ( not ( = ?auto_1967833 ?auto_1967837 ) ) ( not ( = ?auto_1967838 ?auto_1967837 ) ) ( not ( = ?auto_1967835 ?auto_1967837 ) ) ( not ( = ?auto_1967834 ?auto_1967836 ) ) ( not ( = ?auto_1967833 ?auto_1967836 ) ) ( not ( = ?auto_1967838 ?auto_1967836 ) ) ( not ( = ?auto_1967835 ?auto_1967836 ) ) ( not ( = ?auto_1967837 ?auto_1967836 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1967834 ?auto_1967833 ?auto_1967838 ?auto_1967835 ?auto_1967836 ?auto_1967837 ?auto_1967832 )
      ( DELIVER-6PKG-VERIFY ?auto_1967833 ?auto_1967834 ?auto_1967835 ?auto_1967836 ?auto_1967837 ?auto_1967838 ?auto_1967832 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1970651 - OBJ
      ?auto_1970652 - OBJ
      ?auto_1970653 - OBJ
      ?auto_1970654 - OBJ
      ?auto_1970655 - OBJ
      ?auto_1970656 - OBJ
      ?auto_1970650 - LOCATION
    )
    :vars
    (
      ?auto_1970657 - LOCATION
      ?auto_1970659 - CITY
      ?auto_1970660 - LOCATION
      ?auto_1970661 - LOCATION
      ?auto_1970658 - LOCATION
      ?auto_1970662 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1970657 ?auto_1970659 ) ( IN-CITY ?auto_1970650 ?auto_1970659 ) ( not ( = ?auto_1970650 ?auto_1970657 ) ) ( OBJ-AT ?auto_1970653 ?auto_1970657 ) ( IN-CITY ?auto_1970660 ?auto_1970659 ) ( not ( = ?auto_1970650 ?auto_1970660 ) ) ( OBJ-AT ?auto_1970656 ?auto_1970660 ) ( OBJ-AT ?auto_1970655 ?auto_1970660 ) ( IN-CITY ?auto_1970661 ?auto_1970659 ) ( not ( = ?auto_1970650 ?auto_1970661 ) ) ( OBJ-AT ?auto_1970654 ?auto_1970661 ) ( IN-CITY ?auto_1970658 ?auto_1970659 ) ( not ( = ?auto_1970650 ?auto_1970658 ) ) ( OBJ-AT ?auto_1970651 ?auto_1970658 ) ( OBJ-AT ?auto_1970652 ?auto_1970657 ) ( TRUCK-AT ?auto_1970662 ?auto_1970650 ) ( not ( = ?auto_1970652 ?auto_1970651 ) ) ( not ( = ?auto_1970658 ?auto_1970657 ) ) ( not ( = ?auto_1970652 ?auto_1970654 ) ) ( not ( = ?auto_1970651 ?auto_1970654 ) ) ( not ( = ?auto_1970661 ?auto_1970658 ) ) ( not ( = ?auto_1970661 ?auto_1970657 ) ) ( not ( = ?auto_1970652 ?auto_1970655 ) ) ( not ( = ?auto_1970651 ?auto_1970655 ) ) ( not ( = ?auto_1970654 ?auto_1970655 ) ) ( not ( = ?auto_1970660 ?auto_1970661 ) ) ( not ( = ?auto_1970660 ?auto_1970658 ) ) ( not ( = ?auto_1970660 ?auto_1970657 ) ) ( not ( = ?auto_1970652 ?auto_1970656 ) ) ( not ( = ?auto_1970651 ?auto_1970656 ) ) ( not ( = ?auto_1970654 ?auto_1970656 ) ) ( not ( = ?auto_1970655 ?auto_1970656 ) ) ( not ( = ?auto_1970652 ?auto_1970653 ) ) ( not ( = ?auto_1970651 ?auto_1970653 ) ) ( not ( = ?auto_1970654 ?auto_1970653 ) ) ( not ( = ?auto_1970655 ?auto_1970653 ) ) ( not ( = ?auto_1970656 ?auto_1970653 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1970652 ?auto_1970651 ?auto_1970654 ?auto_1970655 ?auto_1970653 ?auto_1970656 ?auto_1970650 )
      ( DELIVER-6PKG-VERIFY ?auto_1970651 ?auto_1970652 ?auto_1970653 ?auto_1970654 ?auto_1970655 ?auto_1970656 ?auto_1970650 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1971075 - OBJ
      ?auto_1971076 - OBJ
      ?auto_1971077 - OBJ
      ?auto_1971078 - OBJ
      ?auto_1971079 - OBJ
      ?auto_1971080 - OBJ
      ?auto_1971074 - LOCATION
    )
    :vars
    (
      ?auto_1971081 - LOCATION
      ?auto_1971083 - CITY
      ?auto_1971084 - LOCATION
      ?auto_1971085 - LOCATION
      ?auto_1971082 - LOCATION
      ?auto_1971086 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1971081 ?auto_1971083 ) ( IN-CITY ?auto_1971074 ?auto_1971083 ) ( not ( = ?auto_1971074 ?auto_1971081 ) ) ( OBJ-AT ?auto_1971077 ?auto_1971081 ) ( IN-CITY ?auto_1971084 ?auto_1971083 ) ( not ( = ?auto_1971074 ?auto_1971084 ) ) ( OBJ-AT ?auto_1971080 ?auto_1971084 ) ( OBJ-AT ?auto_1971078 ?auto_1971084 ) ( IN-CITY ?auto_1971085 ?auto_1971083 ) ( not ( = ?auto_1971074 ?auto_1971085 ) ) ( OBJ-AT ?auto_1971079 ?auto_1971085 ) ( IN-CITY ?auto_1971082 ?auto_1971083 ) ( not ( = ?auto_1971074 ?auto_1971082 ) ) ( OBJ-AT ?auto_1971075 ?auto_1971082 ) ( OBJ-AT ?auto_1971076 ?auto_1971081 ) ( TRUCK-AT ?auto_1971086 ?auto_1971074 ) ( not ( = ?auto_1971076 ?auto_1971075 ) ) ( not ( = ?auto_1971082 ?auto_1971081 ) ) ( not ( = ?auto_1971076 ?auto_1971079 ) ) ( not ( = ?auto_1971075 ?auto_1971079 ) ) ( not ( = ?auto_1971085 ?auto_1971082 ) ) ( not ( = ?auto_1971085 ?auto_1971081 ) ) ( not ( = ?auto_1971076 ?auto_1971078 ) ) ( not ( = ?auto_1971075 ?auto_1971078 ) ) ( not ( = ?auto_1971079 ?auto_1971078 ) ) ( not ( = ?auto_1971084 ?auto_1971085 ) ) ( not ( = ?auto_1971084 ?auto_1971082 ) ) ( not ( = ?auto_1971084 ?auto_1971081 ) ) ( not ( = ?auto_1971076 ?auto_1971080 ) ) ( not ( = ?auto_1971075 ?auto_1971080 ) ) ( not ( = ?auto_1971079 ?auto_1971080 ) ) ( not ( = ?auto_1971078 ?auto_1971080 ) ) ( not ( = ?auto_1971076 ?auto_1971077 ) ) ( not ( = ?auto_1971075 ?auto_1971077 ) ) ( not ( = ?auto_1971079 ?auto_1971077 ) ) ( not ( = ?auto_1971078 ?auto_1971077 ) ) ( not ( = ?auto_1971080 ?auto_1971077 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1971076 ?auto_1971075 ?auto_1971079 ?auto_1971078 ?auto_1971077 ?auto_1971080 ?auto_1971074 )
      ( DELIVER-6PKG-VERIFY ?auto_1971075 ?auto_1971076 ?auto_1971077 ?auto_1971078 ?auto_1971079 ?auto_1971080 ?auto_1971074 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1971218 - OBJ
      ?auto_1971219 - OBJ
      ?auto_1971220 - OBJ
      ?auto_1971221 - OBJ
      ?auto_1971222 - OBJ
      ?auto_1971223 - OBJ
      ?auto_1971217 - LOCATION
    )
    :vars
    (
      ?auto_1971224 - LOCATION
      ?auto_1971226 - CITY
      ?auto_1971227 - LOCATION
      ?auto_1971228 - LOCATION
      ?auto_1971225 - LOCATION
      ?auto_1971229 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1971224 ?auto_1971226 ) ( IN-CITY ?auto_1971217 ?auto_1971226 ) ( not ( = ?auto_1971217 ?auto_1971224 ) ) ( OBJ-AT ?auto_1971220 ?auto_1971224 ) ( IN-CITY ?auto_1971227 ?auto_1971226 ) ( not ( = ?auto_1971217 ?auto_1971227 ) ) ( OBJ-AT ?auto_1971222 ?auto_1971227 ) ( OBJ-AT ?auto_1971221 ?auto_1971227 ) ( IN-CITY ?auto_1971228 ?auto_1971226 ) ( not ( = ?auto_1971217 ?auto_1971228 ) ) ( OBJ-AT ?auto_1971223 ?auto_1971228 ) ( IN-CITY ?auto_1971225 ?auto_1971226 ) ( not ( = ?auto_1971217 ?auto_1971225 ) ) ( OBJ-AT ?auto_1971218 ?auto_1971225 ) ( OBJ-AT ?auto_1971219 ?auto_1971224 ) ( TRUCK-AT ?auto_1971229 ?auto_1971217 ) ( not ( = ?auto_1971219 ?auto_1971218 ) ) ( not ( = ?auto_1971225 ?auto_1971224 ) ) ( not ( = ?auto_1971219 ?auto_1971223 ) ) ( not ( = ?auto_1971218 ?auto_1971223 ) ) ( not ( = ?auto_1971228 ?auto_1971225 ) ) ( not ( = ?auto_1971228 ?auto_1971224 ) ) ( not ( = ?auto_1971219 ?auto_1971221 ) ) ( not ( = ?auto_1971218 ?auto_1971221 ) ) ( not ( = ?auto_1971223 ?auto_1971221 ) ) ( not ( = ?auto_1971227 ?auto_1971228 ) ) ( not ( = ?auto_1971227 ?auto_1971225 ) ) ( not ( = ?auto_1971227 ?auto_1971224 ) ) ( not ( = ?auto_1971219 ?auto_1971222 ) ) ( not ( = ?auto_1971218 ?auto_1971222 ) ) ( not ( = ?auto_1971223 ?auto_1971222 ) ) ( not ( = ?auto_1971221 ?auto_1971222 ) ) ( not ( = ?auto_1971219 ?auto_1971220 ) ) ( not ( = ?auto_1971218 ?auto_1971220 ) ) ( not ( = ?auto_1971223 ?auto_1971220 ) ) ( not ( = ?auto_1971221 ?auto_1971220 ) ) ( not ( = ?auto_1971222 ?auto_1971220 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1971219 ?auto_1971218 ?auto_1971223 ?auto_1971221 ?auto_1971220 ?auto_1971222 ?auto_1971217 )
      ( DELIVER-6PKG-VERIFY ?auto_1971218 ?auto_1971219 ?auto_1971220 ?auto_1971221 ?auto_1971222 ?auto_1971223 ?auto_1971217 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1983148 - OBJ
      ?auto_1983149 - OBJ
      ?auto_1983150 - OBJ
      ?auto_1983151 - OBJ
      ?auto_1983152 - OBJ
      ?auto_1983153 - OBJ
      ?auto_1983147 - LOCATION
    )
    :vars
    (
      ?auto_1983154 - LOCATION
      ?auto_1983156 - CITY
      ?auto_1983157 - LOCATION
      ?auto_1983158 - LOCATION
      ?auto_1983155 - LOCATION
      ?auto_1983159 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1983154 ?auto_1983156 ) ( IN-CITY ?auto_1983147 ?auto_1983156 ) ( not ( = ?auto_1983147 ?auto_1983154 ) ) ( OBJ-AT ?auto_1983153 ?auto_1983154 ) ( IN-CITY ?auto_1983157 ?auto_1983156 ) ( not ( = ?auto_1983147 ?auto_1983157 ) ) ( OBJ-AT ?auto_1983152 ?auto_1983157 ) ( OBJ-AT ?auto_1983151 ?auto_1983157 ) ( IN-CITY ?auto_1983158 ?auto_1983156 ) ( not ( = ?auto_1983147 ?auto_1983158 ) ) ( OBJ-AT ?auto_1983149 ?auto_1983158 ) ( IN-CITY ?auto_1983155 ?auto_1983156 ) ( not ( = ?auto_1983147 ?auto_1983155 ) ) ( OBJ-AT ?auto_1983148 ?auto_1983155 ) ( OBJ-AT ?auto_1983150 ?auto_1983154 ) ( TRUCK-AT ?auto_1983159 ?auto_1983147 ) ( not ( = ?auto_1983150 ?auto_1983148 ) ) ( not ( = ?auto_1983155 ?auto_1983154 ) ) ( not ( = ?auto_1983150 ?auto_1983149 ) ) ( not ( = ?auto_1983148 ?auto_1983149 ) ) ( not ( = ?auto_1983158 ?auto_1983155 ) ) ( not ( = ?auto_1983158 ?auto_1983154 ) ) ( not ( = ?auto_1983150 ?auto_1983151 ) ) ( not ( = ?auto_1983148 ?auto_1983151 ) ) ( not ( = ?auto_1983149 ?auto_1983151 ) ) ( not ( = ?auto_1983157 ?auto_1983158 ) ) ( not ( = ?auto_1983157 ?auto_1983155 ) ) ( not ( = ?auto_1983157 ?auto_1983154 ) ) ( not ( = ?auto_1983150 ?auto_1983152 ) ) ( not ( = ?auto_1983148 ?auto_1983152 ) ) ( not ( = ?auto_1983149 ?auto_1983152 ) ) ( not ( = ?auto_1983151 ?auto_1983152 ) ) ( not ( = ?auto_1983150 ?auto_1983153 ) ) ( not ( = ?auto_1983148 ?auto_1983153 ) ) ( not ( = ?auto_1983149 ?auto_1983153 ) ) ( not ( = ?auto_1983151 ?auto_1983153 ) ) ( not ( = ?auto_1983152 ?auto_1983153 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1983150 ?auto_1983148 ?auto_1983149 ?auto_1983151 ?auto_1983153 ?auto_1983152 ?auto_1983147 )
      ( DELIVER-6PKG-VERIFY ?auto_1983148 ?auto_1983149 ?auto_1983150 ?auto_1983151 ?auto_1983152 ?auto_1983153 ?auto_1983147 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1983217 - OBJ
      ?auto_1983218 - OBJ
      ?auto_1983219 - OBJ
      ?auto_1983220 - OBJ
      ?auto_1983221 - OBJ
      ?auto_1983222 - OBJ
      ?auto_1983216 - LOCATION
    )
    :vars
    (
      ?auto_1983223 - LOCATION
      ?auto_1983225 - CITY
      ?auto_1983226 - LOCATION
      ?auto_1983227 - LOCATION
      ?auto_1983224 - LOCATION
      ?auto_1983228 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1983223 ?auto_1983225 ) ( IN-CITY ?auto_1983216 ?auto_1983225 ) ( not ( = ?auto_1983216 ?auto_1983223 ) ) ( OBJ-AT ?auto_1983221 ?auto_1983223 ) ( IN-CITY ?auto_1983226 ?auto_1983225 ) ( not ( = ?auto_1983216 ?auto_1983226 ) ) ( OBJ-AT ?auto_1983222 ?auto_1983226 ) ( OBJ-AT ?auto_1983220 ?auto_1983226 ) ( IN-CITY ?auto_1983227 ?auto_1983225 ) ( not ( = ?auto_1983216 ?auto_1983227 ) ) ( OBJ-AT ?auto_1983218 ?auto_1983227 ) ( IN-CITY ?auto_1983224 ?auto_1983225 ) ( not ( = ?auto_1983216 ?auto_1983224 ) ) ( OBJ-AT ?auto_1983217 ?auto_1983224 ) ( OBJ-AT ?auto_1983219 ?auto_1983223 ) ( TRUCK-AT ?auto_1983228 ?auto_1983216 ) ( not ( = ?auto_1983219 ?auto_1983217 ) ) ( not ( = ?auto_1983224 ?auto_1983223 ) ) ( not ( = ?auto_1983219 ?auto_1983218 ) ) ( not ( = ?auto_1983217 ?auto_1983218 ) ) ( not ( = ?auto_1983227 ?auto_1983224 ) ) ( not ( = ?auto_1983227 ?auto_1983223 ) ) ( not ( = ?auto_1983219 ?auto_1983220 ) ) ( not ( = ?auto_1983217 ?auto_1983220 ) ) ( not ( = ?auto_1983218 ?auto_1983220 ) ) ( not ( = ?auto_1983226 ?auto_1983227 ) ) ( not ( = ?auto_1983226 ?auto_1983224 ) ) ( not ( = ?auto_1983226 ?auto_1983223 ) ) ( not ( = ?auto_1983219 ?auto_1983222 ) ) ( not ( = ?auto_1983217 ?auto_1983222 ) ) ( not ( = ?auto_1983218 ?auto_1983222 ) ) ( not ( = ?auto_1983220 ?auto_1983222 ) ) ( not ( = ?auto_1983219 ?auto_1983221 ) ) ( not ( = ?auto_1983217 ?auto_1983221 ) ) ( not ( = ?auto_1983218 ?auto_1983221 ) ) ( not ( = ?auto_1983220 ?auto_1983221 ) ) ( not ( = ?auto_1983222 ?auto_1983221 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1983219 ?auto_1983217 ?auto_1983218 ?auto_1983220 ?auto_1983221 ?auto_1983222 ?auto_1983216 )
      ( DELIVER-6PKG-VERIFY ?auto_1983217 ?auto_1983218 ?auto_1983219 ?auto_1983220 ?auto_1983221 ?auto_1983222 ?auto_1983216 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1983704 - OBJ
      ?auto_1983705 - OBJ
      ?auto_1983706 - OBJ
      ?auto_1983707 - OBJ
      ?auto_1983708 - OBJ
      ?auto_1983709 - OBJ
      ?auto_1983703 - LOCATION
    )
    :vars
    (
      ?auto_1983710 - LOCATION
      ?auto_1983712 - CITY
      ?auto_1983713 - LOCATION
      ?auto_1983714 - LOCATION
      ?auto_1983711 - LOCATION
      ?auto_1983715 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1983710 ?auto_1983712 ) ( IN-CITY ?auto_1983703 ?auto_1983712 ) ( not ( = ?auto_1983703 ?auto_1983710 ) ) ( OBJ-AT ?auto_1983707 ?auto_1983710 ) ( IN-CITY ?auto_1983713 ?auto_1983712 ) ( not ( = ?auto_1983703 ?auto_1983713 ) ) ( OBJ-AT ?auto_1983709 ?auto_1983713 ) ( OBJ-AT ?auto_1983708 ?auto_1983713 ) ( IN-CITY ?auto_1983714 ?auto_1983712 ) ( not ( = ?auto_1983703 ?auto_1983714 ) ) ( OBJ-AT ?auto_1983705 ?auto_1983714 ) ( IN-CITY ?auto_1983711 ?auto_1983712 ) ( not ( = ?auto_1983703 ?auto_1983711 ) ) ( OBJ-AT ?auto_1983704 ?auto_1983711 ) ( OBJ-AT ?auto_1983706 ?auto_1983710 ) ( TRUCK-AT ?auto_1983715 ?auto_1983703 ) ( not ( = ?auto_1983706 ?auto_1983704 ) ) ( not ( = ?auto_1983711 ?auto_1983710 ) ) ( not ( = ?auto_1983706 ?auto_1983705 ) ) ( not ( = ?auto_1983704 ?auto_1983705 ) ) ( not ( = ?auto_1983714 ?auto_1983711 ) ) ( not ( = ?auto_1983714 ?auto_1983710 ) ) ( not ( = ?auto_1983706 ?auto_1983708 ) ) ( not ( = ?auto_1983704 ?auto_1983708 ) ) ( not ( = ?auto_1983705 ?auto_1983708 ) ) ( not ( = ?auto_1983713 ?auto_1983714 ) ) ( not ( = ?auto_1983713 ?auto_1983711 ) ) ( not ( = ?auto_1983713 ?auto_1983710 ) ) ( not ( = ?auto_1983706 ?auto_1983709 ) ) ( not ( = ?auto_1983704 ?auto_1983709 ) ) ( not ( = ?auto_1983705 ?auto_1983709 ) ) ( not ( = ?auto_1983708 ?auto_1983709 ) ) ( not ( = ?auto_1983706 ?auto_1983707 ) ) ( not ( = ?auto_1983704 ?auto_1983707 ) ) ( not ( = ?auto_1983705 ?auto_1983707 ) ) ( not ( = ?auto_1983708 ?auto_1983707 ) ) ( not ( = ?auto_1983709 ?auto_1983707 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1983706 ?auto_1983704 ?auto_1983705 ?auto_1983708 ?auto_1983707 ?auto_1983709 ?auto_1983703 )
      ( DELIVER-6PKG-VERIFY ?auto_1983704 ?auto_1983705 ?auto_1983706 ?auto_1983707 ?auto_1983708 ?auto_1983709 ?auto_1983703 ) )
  )

)

