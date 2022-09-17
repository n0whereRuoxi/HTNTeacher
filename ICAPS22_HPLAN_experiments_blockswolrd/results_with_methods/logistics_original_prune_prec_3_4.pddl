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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12410 - OBJ
      ?auto_12409 - LOCATION
    )
    :vars
    (
      ?auto_12411 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12411 ?auto_12409 ) ( IN-TRUCK ?auto_12410 ?auto_12411 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_12410 ?auto_12411 ?auto_12409 )
      ( DELIVER-1PKG-VERIFY ?auto_12410 ?auto_12409 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12422 - OBJ
      ?auto_12421 - LOCATION
    )
    :vars
    (
      ?auto_12423 - TRUCK
      ?auto_12424 - LOCATION
      ?auto_12425 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12422 ?auto_12423 ) ( TRUCK-AT ?auto_12423 ?auto_12424 ) ( IN-CITY ?auto_12424 ?auto_12425 ) ( IN-CITY ?auto_12421 ?auto_12425 ) ( not ( = ?auto_12421 ?auto_12424 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12423 ?auto_12424 ?auto_12421 ?auto_12425 )
      ( DELIVER-1PKG ?auto_12422 ?auto_12421 )
      ( DELIVER-1PKG-VERIFY ?auto_12422 ?auto_12421 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12440 - OBJ
      ?auto_12439 - LOCATION
    )
    :vars
    (
      ?auto_12442 - TRUCK
      ?auto_12441 - LOCATION
      ?auto_12443 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12442 ?auto_12441 ) ( IN-CITY ?auto_12441 ?auto_12443 ) ( IN-CITY ?auto_12439 ?auto_12443 ) ( not ( = ?auto_12439 ?auto_12441 ) ) ( OBJ-AT ?auto_12440 ?auto_12441 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12440 ?auto_12442 ?auto_12441 )
      ( DELIVER-1PKG ?auto_12440 ?auto_12439 )
      ( DELIVER-1PKG-VERIFY ?auto_12440 ?auto_12439 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12458 - OBJ
      ?auto_12457 - LOCATION
    )
    :vars
    (
      ?auto_12461 - LOCATION
      ?auto_12460 - CITY
      ?auto_12459 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12461 ?auto_12460 ) ( IN-CITY ?auto_12457 ?auto_12460 ) ( not ( = ?auto_12457 ?auto_12461 ) ) ( OBJ-AT ?auto_12458 ?auto_12461 ) ( TRUCK-AT ?auto_12459 ?auto_12457 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12459 ?auto_12457 ?auto_12461 ?auto_12460 )
      ( DELIVER-1PKG ?auto_12458 ?auto_12457 )
      ( DELIVER-1PKG-VERIFY ?auto_12458 ?auto_12457 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12518 - OBJ
      ?auto_12519 - OBJ
      ?auto_12517 - LOCATION
    )
    :vars
    (
      ?auto_12520 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12519 ?auto_12518 ) ) ( TRUCK-AT ?auto_12520 ?auto_12517 ) ( IN-TRUCK ?auto_12519 ?auto_12520 ) ( OBJ-AT ?auto_12518 ?auto_12517 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12519 ?auto_12517 )
      ( DELIVER-2PKG-VERIFY ?auto_12518 ?auto_12519 ?auto_12517 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12522 - OBJ
      ?auto_12523 - OBJ
      ?auto_12521 - LOCATION
    )
    :vars
    (
      ?auto_12524 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12523 ?auto_12522 ) ) ( TRUCK-AT ?auto_12524 ?auto_12521 ) ( IN-TRUCK ?auto_12522 ?auto_12524 ) ( OBJ-AT ?auto_12523 ?auto_12521 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12522 ?auto_12521 )
      ( DELIVER-2PKG-VERIFY ?auto_12522 ?auto_12523 ?auto_12521 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12570 - OBJ
      ?auto_12571 - OBJ
      ?auto_12569 - LOCATION
    )
    :vars
    (
      ?auto_12573 - TRUCK
      ?auto_12572 - LOCATION
      ?auto_12574 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_12571 ?auto_12570 ) ) ( IN-TRUCK ?auto_12571 ?auto_12573 ) ( TRUCK-AT ?auto_12573 ?auto_12572 ) ( IN-CITY ?auto_12572 ?auto_12574 ) ( IN-CITY ?auto_12569 ?auto_12574 ) ( not ( = ?auto_12569 ?auto_12572 ) ) ( OBJ-AT ?auto_12570 ?auto_12569 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12571 ?auto_12569 )
      ( DELIVER-2PKG-VERIFY ?auto_12570 ?auto_12571 ?auto_12569 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12576 - OBJ
      ?auto_12577 - OBJ
      ?auto_12575 - LOCATION
    )
    :vars
    (
      ?auto_12579 - TRUCK
      ?auto_12580 - LOCATION
      ?auto_12578 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_12577 ?auto_12576 ) ) ( IN-TRUCK ?auto_12576 ?auto_12579 ) ( TRUCK-AT ?auto_12579 ?auto_12580 ) ( IN-CITY ?auto_12580 ?auto_12578 ) ( IN-CITY ?auto_12575 ?auto_12578 ) ( not ( = ?auto_12575 ?auto_12580 ) ) ( OBJ-AT ?auto_12577 ?auto_12575 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12577 ?auto_12576 ?auto_12575 )
      ( DELIVER-2PKG-VERIFY ?auto_12576 ?auto_12577 ?auto_12575 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12639 - OBJ
      ?auto_12638 - LOCATION
    )
    :vars
    (
      ?auto_12640 - OBJ
      ?auto_12642 - TRUCK
      ?auto_12643 - LOCATION
      ?auto_12641 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_12639 ?auto_12640 ) ) ( TRUCK-AT ?auto_12642 ?auto_12643 ) ( IN-CITY ?auto_12643 ?auto_12641 ) ( IN-CITY ?auto_12638 ?auto_12641 ) ( not ( = ?auto_12638 ?auto_12643 ) ) ( OBJ-AT ?auto_12640 ?auto_12638 ) ( OBJ-AT ?auto_12639 ?auto_12643 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12639 ?auto_12642 ?auto_12643 )
      ( DELIVER-2PKG ?auto_12640 ?auto_12639 ?auto_12638 )
      ( DELIVER-1PKG-VERIFY ?auto_12639 ?auto_12638 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12645 - OBJ
      ?auto_12646 - OBJ
      ?auto_12644 - LOCATION
    )
    :vars
    (
      ?auto_12649 - TRUCK
      ?auto_12647 - LOCATION
      ?auto_12648 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_12646 ?auto_12645 ) ) ( TRUCK-AT ?auto_12649 ?auto_12647 ) ( IN-CITY ?auto_12647 ?auto_12648 ) ( IN-CITY ?auto_12644 ?auto_12648 ) ( not ( = ?auto_12644 ?auto_12647 ) ) ( OBJ-AT ?auto_12645 ?auto_12644 ) ( OBJ-AT ?auto_12646 ?auto_12647 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12646 ?auto_12644 )
      ( DELIVER-2PKG-VERIFY ?auto_12645 ?auto_12646 ?auto_12644 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12651 - OBJ
      ?auto_12652 - OBJ
      ?auto_12650 - LOCATION
    )
    :vars
    (
      ?auto_12655 - TRUCK
      ?auto_12654 - LOCATION
      ?auto_12653 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_12652 ?auto_12651 ) ) ( TRUCK-AT ?auto_12655 ?auto_12654 ) ( IN-CITY ?auto_12654 ?auto_12653 ) ( IN-CITY ?auto_12650 ?auto_12653 ) ( not ( = ?auto_12650 ?auto_12654 ) ) ( OBJ-AT ?auto_12652 ?auto_12650 ) ( OBJ-AT ?auto_12651 ?auto_12654 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12652 ?auto_12651 ?auto_12650 )
      ( DELIVER-2PKG-VERIFY ?auto_12651 ?auto_12652 ?auto_12650 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12714 - OBJ
      ?auto_12713 - LOCATION
    )
    :vars
    (
      ?auto_12718 - OBJ
      ?auto_12716 - LOCATION
      ?auto_12715 - CITY
      ?auto_12717 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12714 ?auto_12718 ) ) ( IN-CITY ?auto_12716 ?auto_12715 ) ( IN-CITY ?auto_12713 ?auto_12715 ) ( not ( = ?auto_12713 ?auto_12716 ) ) ( OBJ-AT ?auto_12718 ?auto_12713 ) ( OBJ-AT ?auto_12714 ?auto_12716 ) ( TRUCK-AT ?auto_12717 ?auto_12713 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12717 ?auto_12713 ?auto_12716 ?auto_12715 )
      ( DELIVER-2PKG ?auto_12718 ?auto_12714 ?auto_12713 )
      ( DELIVER-1PKG-VERIFY ?auto_12714 ?auto_12713 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12720 - OBJ
      ?auto_12721 - OBJ
      ?auto_12719 - LOCATION
    )
    :vars
    (
      ?auto_12722 - LOCATION
      ?auto_12723 - CITY
      ?auto_12724 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12721 ?auto_12720 ) ) ( IN-CITY ?auto_12722 ?auto_12723 ) ( IN-CITY ?auto_12719 ?auto_12723 ) ( not ( = ?auto_12719 ?auto_12722 ) ) ( OBJ-AT ?auto_12720 ?auto_12719 ) ( OBJ-AT ?auto_12721 ?auto_12722 ) ( TRUCK-AT ?auto_12724 ?auto_12719 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12721 ?auto_12719 )
      ( DELIVER-2PKG-VERIFY ?auto_12720 ?auto_12721 ?auto_12719 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12726 - OBJ
      ?auto_12727 - OBJ
      ?auto_12725 - LOCATION
    )
    :vars
    (
      ?auto_12730 - LOCATION
      ?auto_12729 - CITY
      ?auto_12728 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12727 ?auto_12726 ) ) ( IN-CITY ?auto_12730 ?auto_12729 ) ( IN-CITY ?auto_12725 ?auto_12729 ) ( not ( = ?auto_12725 ?auto_12730 ) ) ( OBJ-AT ?auto_12727 ?auto_12725 ) ( OBJ-AT ?auto_12726 ?auto_12730 ) ( TRUCK-AT ?auto_12728 ?auto_12725 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12727 ?auto_12726 ?auto_12725 )
      ( DELIVER-2PKG-VERIFY ?auto_12726 ?auto_12727 ?auto_12725 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12789 - OBJ
      ?auto_12788 - LOCATION
    )
    :vars
    (
      ?auto_12792 - OBJ
      ?auto_12793 - LOCATION
      ?auto_12791 - CITY
      ?auto_12790 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12789 ?auto_12792 ) ) ( IN-CITY ?auto_12793 ?auto_12791 ) ( IN-CITY ?auto_12788 ?auto_12791 ) ( not ( = ?auto_12788 ?auto_12793 ) ) ( OBJ-AT ?auto_12789 ?auto_12793 ) ( TRUCK-AT ?auto_12790 ?auto_12788 ) ( IN-TRUCK ?auto_12792 ?auto_12790 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12792 ?auto_12788 )
      ( DELIVER-2PKG ?auto_12792 ?auto_12789 ?auto_12788 )
      ( DELIVER-1PKG-VERIFY ?auto_12789 ?auto_12788 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12795 - OBJ
      ?auto_12796 - OBJ
      ?auto_12794 - LOCATION
    )
    :vars
    (
      ?auto_12799 - LOCATION
      ?auto_12798 - CITY
      ?auto_12797 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12796 ?auto_12795 ) ) ( IN-CITY ?auto_12799 ?auto_12798 ) ( IN-CITY ?auto_12794 ?auto_12798 ) ( not ( = ?auto_12794 ?auto_12799 ) ) ( OBJ-AT ?auto_12796 ?auto_12799 ) ( TRUCK-AT ?auto_12797 ?auto_12794 ) ( IN-TRUCK ?auto_12795 ?auto_12797 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12796 ?auto_12794 )
      ( DELIVER-2PKG-VERIFY ?auto_12795 ?auto_12796 ?auto_12794 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12801 - OBJ
      ?auto_12802 - OBJ
      ?auto_12800 - LOCATION
    )
    :vars
    (
      ?auto_12805 - LOCATION
      ?auto_12803 - CITY
      ?auto_12804 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_12802 ?auto_12801 ) ) ( IN-CITY ?auto_12805 ?auto_12803 ) ( IN-CITY ?auto_12800 ?auto_12803 ) ( not ( = ?auto_12800 ?auto_12805 ) ) ( OBJ-AT ?auto_12801 ?auto_12805 ) ( TRUCK-AT ?auto_12804 ?auto_12800 ) ( IN-TRUCK ?auto_12802 ?auto_12804 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12802 ?auto_12801 ?auto_12800 )
      ( DELIVER-2PKG-VERIFY ?auto_12801 ?auto_12802 ?auto_12800 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12864 - OBJ
      ?auto_12863 - LOCATION
    )
    :vars
    (
      ?auto_12867 - OBJ
      ?auto_12868 - LOCATION
      ?auto_12865 - CITY
      ?auto_12866 - TRUCK
      ?auto_12869 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_12864 ?auto_12867 ) ) ( IN-CITY ?auto_12868 ?auto_12865 ) ( IN-CITY ?auto_12863 ?auto_12865 ) ( not ( = ?auto_12863 ?auto_12868 ) ) ( OBJ-AT ?auto_12864 ?auto_12868 ) ( IN-TRUCK ?auto_12867 ?auto_12866 ) ( TRUCK-AT ?auto_12866 ?auto_12869 ) ( IN-CITY ?auto_12869 ?auto_12865 ) ( not ( = ?auto_12863 ?auto_12869 ) ) ( not ( = ?auto_12868 ?auto_12869 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12866 ?auto_12869 ?auto_12863 ?auto_12865 )
      ( DELIVER-2PKG ?auto_12867 ?auto_12864 ?auto_12863 )
      ( DELIVER-1PKG-VERIFY ?auto_12864 ?auto_12863 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12871 - OBJ
      ?auto_12872 - OBJ
      ?auto_12870 - LOCATION
    )
    :vars
    (
      ?auto_12874 - LOCATION
      ?auto_12876 - CITY
      ?auto_12873 - TRUCK
      ?auto_12875 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_12872 ?auto_12871 ) ) ( IN-CITY ?auto_12874 ?auto_12876 ) ( IN-CITY ?auto_12870 ?auto_12876 ) ( not ( = ?auto_12870 ?auto_12874 ) ) ( OBJ-AT ?auto_12872 ?auto_12874 ) ( IN-TRUCK ?auto_12871 ?auto_12873 ) ( TRUCK-AT ?auto_12873 ?auto_12875 ) ( IN-CITY ?auto_12875 ?auto_12876 ) ( not ( = ?auto_12870 ?auto_12875 ) ) ( not ( = ?auto_12874 ?auto_12875 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12872 ?auto_12870 )
      ( DELIVER-2PKG-VERIFY ?auto_12871 ?auto_12872 ?auto_12870 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12878 - OBJ
      ?auto_12879 - OBJ
      ?auto_12877 - LOCATION
    )
    :vars
    (
      ?auto_12881 - LOCATION
      ?auto_12880 - CITY
      ?auto_12883 - TRUCK
      ?auto_12882 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_12879 ?auto_12878 ) ) ( IN-CITY ?auto_12881 ?auto_12880 ) ( IN-CITY ?auto_12877 ?auto_12880 ) ( not ( = ?auto_12877 ?auto_12881 ) ) ( OBJ-AT ?auto_12878 ?auto_12881 ) ( IN-TRUCK ?auto_12879 ?auto_12883 ) ( TRUCK-AT ?auto_12883 ?auto_12882 ) ( IN-CITY ?auto_12882 ?auto_12880 ) ( not ( = ?auto_12877 ?auto_12882 ) ) ( not ( = ?auto_12881 ?auto_12882 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12879 ?auto_12878 ?auto_12877 )
      ( DELIVER-2PKG-VERIFY ?auto_12878 ?auto_12879 ?auto_12877 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12950 - OBJ
      ?auto_12949 - LOCATION
    )
    :vars
    (
      ?auto_12952 - OBJ
      ?auto_12953 - LOCATION
      ?auto_12951 - CITY
      ?auto_12955 - TRUCK
      ?auto_12954 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_12950 ?auto_12952 ) ) ( IN-CITY ?auto_12953 ?auto_12951 ) ( IN-CITY ?auto_12949 ?auto_12951 ) ( not ( = ?auto_12949 ?auto_12953 ) ) ( OBJ-AT ?auto_12950 ?auto_12953 ) ( TRUCK-AT ?auto_12955 ?auto_12954 ) ( IN-CITY ?auto_12954 ?auto_12951 ) ( not ( = ?auto_12949 ?auto_12954 ) ) ( not ( = ?auto_12953 ?auto_12954 ) ) ( OBJ-AT ?auto_12952 ?auto_12954 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12952 ?auto_12955 ?auto_12954 )
      ( DELIVER-2PKG ?auto_12952 ?auto_12950 ?auto_12949 )
      ( DELIVER-1PKG-VERIFY ?auto_12950 ?auto_12949 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12957 - OBJ
      ?auto_12958 - OBJ
      ?auto_12956 - LOCATION
    )
    :vars
    (
      ?auto_12961 - LOCATION
      ?auto_12962 - CITY
      ?auto_12960 - TRUCK
      ?auto_12959 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_12958 ?auto_12957 ) ) ( IN-CITY ?auto_12961 ?auto_12962 ) ( IN-CITY ?auto_12956 ?auto_12962 ) ( not ( = ?auto_12956 ?auto_12961 ) ) ( OBJ-AT ?auto_12958 ?auto_12961 ) ( TRUCK-AT ?auto_12960 ?auto_12959 ) ( IN-CITY ?auto_12959 ?auto_12962 ) ( not ( = ?auto_12956 ?auto_12959 ) ) ( not ( = ?auto_12961 ?auto_12959 ) ) ( OBJ-AT ?auto_12957 ?auto_12959 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12958 ?auto_12956 )
      ( DELIVER-2PKG-VERIFY ?auto_12957 ?auto_12958 ?auto_12956 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12964 - OBJ
      ?auto_12965 - OBJ
      ?auto_12963 - LOCATION
    )
    :vars
    (
      ?auto_12968 - LOCATION
      ?auto_12969 - CITY
      ?auto_12967 - TRUCK
      ?auto_12966 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_12965 ?auto_12964 ) ) ( IN-CITY ?auto_12968 ?auto_12969 ) ( IN-CITY ?auto_12963 ?auto_12969 ) ( not ( = ?auto_12963 ?auto_12968 ) ) ( OBJ-AT ?auto_12964 ?auto_12968 ) ( TRUCK-AT ?auto_12967 ?auto_12966 ) ( IN-CITY ?auto_12966 ?auto_12969 ) ( not ( = ?auto_12963 ?auto_12966 ) ) ( not ( = ?auto_12968 ?auto_12966 ) ) ( OBJ-AT ?auto_12965 ?auto_12966 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12965 ?auto_12964 ?auto_12963 )
      ( DELIVER-2PKG-VERIFY ?auto_12964 ?auto_12965 ?auto_12963 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13224 - OBJ
      ?auto_13225 - OBJ
      ?auto_13226 - OBJ
      ?auto_13223 - LOCATION
    )
    :vars
    (
      ?auto_13227 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13225 ?auto_13224 ) ) ( not ( = ?auto_13226 ?auto_13224 ) ) ( not ( = ?auto_13226 ?auto_13225 ) ) ( TRUCK-AT ?auto_13227 ?auto_13223 ) ( IN-TRUCK ?auto_13226 ?auto_13227 ) ( OBJ-AT ?auto_13224 ?auto_13223 ) ( OBJ-AT ?auto_13225 ?auto_13223 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13226 ?auto_13223 )
      ( DELIVER-3PKG-VERIFY ?auto_13224 ?auto_13225 ?auto_13226 ?auto_13223 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13234 - OBJ
      ?auto_13235 - OBJ
      ?auto_13236 - OBJ
      ?auto_13233 - LOCATION
    )
    :vars
    (
      ?auto_13237 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13235 ?auto_13234 ) ) ( not ( = ?auto_13236 ?auto_13234 ) ) ( not ( = ?auto_13236 ?auto_13235 ) ) ( TRUCK-AT ?auto_13237 ?auto_13233 ) ( IN-TRUCK ?auto_13235 ?auto_13237 ) ( OBJ-AT ?auto_13234 ?auto_13233 ) ( OBJ-AT ?auto_13236 ?auto_13233 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13235 ?auto_13233 )
      ( DELIVER-3PKG-VERIFY ?auto_13234 ?auto_13235 ?auto_13236 ?auto_13233 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13272 - OBJ
      ?auto_13273 - OBJ
      ?auto_13274 - OBJ
      ?auto_13271 - LOCATION
    )
    :vars
    (
      ?auto_13275 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13273 ?auto_13272 ) ) ( not ( = ?auto_13274 ?auto_13272 ) ) ( not ( = ?auto_13274 ?auto_13273 ) ) ( TRUCK-AT ?auto_13275 ?auto_13271 ) ( IN-TRUCK ?auto_13272 ?auto_13275 ) ( OBJ-AT ?auto_13273 ?auto_13271 ) ( OBJ-AT ?auto_13274 ?auto_13271 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13272 ?auto_13271 )
      ( DELIVER-3PKG-VERIFY ?auto_13272 ?auto_13273 ?auto_13274 ?auto_13271 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13348 - OBJ
      ?auto_13349 - OBJ
      ?auto_13350 - OBJ
      ?auto_13347 - LOCATION
    )
    :vars
    (
      ?auto_13351 - TRUCK
      ?auto_13353 - LOCATION
      ?auto_13352 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_13349 ?auto_13348 ) ) ( not ( = ?auto_13350 ?auto_13348 ) ) ( not ( = ?auto_13350 ?auto_13349 ) ) ( IN-TRUCK ?auto_13350 ?auto_13351 ) ( TRUCK-AT ?auto_13351 ?auto_13353 ) ( IN-CITY ?auto_13353 ?auto_13352 ) ( IN-CITY ?auto_13347 ?auto_13352 ) ( not ( = ?auto_13347 ?auto_13353 ) ) ( OBJ-AT ?auto_13348 ?auto_13347 ) ( OBJ-AT ?auto_13349 ?auto_13347 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13348 ?auto_13350 ?auto_13347 )
      ( DELIVER-3PKG-VERIFY ?auto_13348 ?auto_13349 ?auto_13350 ?auto_13347 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13362 - OBJ
      ?auto_13363 - OBJ
      ?auto_13364 - OBJ
      ?auto_13361 - LOCATION
    )
    :vars
    (
      ?auto_13365 - TRUCK
      ?auto_13367 - LOCATION
      ?auto_13366 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_13363 ?auto_13362 ) ) ( not ( = ?auto_13364 ?auto_13362 ) ) ( not ( = ?auto_13364 ?auto_13363 ) ) ( IN-TRUCK ?auto_13363 ?auto_13365 ) ( TRUCK-AT ?auto_13365 ?auto_13367 ) ( IN-CITY ?auto_13367 ?auto_13366 ) ( IN-CITY ?auto_13361 ?auto_13366 ) ( not ( = ?auto_13361 ?auto_13367 ) ) ( OBJ-AT ?auto_13362 ?auto_13361 ) ( OBJ-AT ?auto_13364 ?auto_13361 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13362 ?auto_13363 ?auto_13361 )
      ( DELIVER-3PKG-VERIFY ?auto_13362 ?auto_13363 ?auto_13364 ?auto_13361 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13415 - OBJ
      ?auto_13416 - OBJ
      ?auto_13417 - OBJ
      ?auto_13414 - LOCATION
    )
    :vars
    (
      ?auto_13418 - TRUCK
      ?auto_13420 - LOCATION
      ?auto_13419 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_13416 ?auto_13415 ) ) ( not ( = ?auto_13417 ?auto_13415 ) ) ( not ( = ?auto_13417 ?auto_13416 ) ) ( IN-TRUCK ?auto_13415 ?auto_13418 ) ( TRUCK-AT ?auto_13418 ?auto_13420 ) ( IN-CITY ?auto_13420 ?auto_13419 ) ( IN-CITY ?auto_13414 ?auto_13419 ) ( not ( = ?auto_13414 ?auto_13420 ) ) ( OBJ-AT ?auto_13416 ?auto_13414 ) ( OBJ-AT ?auto_13417 ?auto_13414 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13416 ?auto_13415 ?auto_13414 )
      ( DELIVER-3PKG-VERIFY ?auto_13415 ?auto_13416 ?auto_13417 ?auto_13414 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13510 - OBJ
      ?auto_13511 - OBJ
      ?auto_13512 - OBJ
      ?auto_13509 - LOCATION
    )
    :vars
    (
      ?auto_13514 - TRUCK
      ?auto_13513 - LOCATION
      ?auto_13515 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_13511 ?auto_13510 ) ) ( not ( = ?auto_13512 ?auto_13510 ) ) ( not ( = ?auto_13512 ?auto_13511 ) ) ( TRUCK-AT ?auto_13514 ?auto_13513 ) ( IN-CITY ?auto_13513 ?auto_13515 ) ( IN-CITY ?auto_13509 ?auto_13515 ) ( not ( = ?auto_13509 ?auto_13513 ) ) ( OBJ-AT ?auto_13510 ?auto_13509 ) ( OBJ-AT ?auto_13512 ?auto_13513 ) ( OBJ-AT ?auto_13511 ?auto_13509 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13510 ?auto_13512 ?auto_13509 )
      ( DELIVER-3PKG-VERIFY ?auto_13510 ?auto_13511 ?auto_13512 ?auto_13509 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13524 - OBJ
      ?auto_13525 - OBJ
      ?auto_13526 - OBJ
      ?auto_13523 - LOCATION
    )
    :vars
    (
      ?auto_13528 - TRUCK
      ?auto_13527 - LOCATION
      ?auto_13529 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_13525 ?auto_13524 ) ) ( not ( = ?auto_13526 ?auto_13524 ) ) ( not ( = ?auto_13526 ?auto_13525 ) ) ( TRUCK-AT ?auto_13528 ?auto_13527 ) ( IN-CITY ?auto_13527 ?auto_13529 ) ( IN-CITY ?auto_13523 ?auto_13529 ) ( not ( = ?auto_13523 ?auto_13527 ) ) ( OBJ-AT ?auto_13524 ?auto_13523 ) ( OBJ-AT ?auto_13525 ?auto_13527 ) ( OBJ-AT ?auto_13526 ?auto_13523 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13524 ?auto_13525 ?auto_13523 )
      ( DELIVER-3PKG-VERIFY ?auto_13524 ?auto_13525 ?auto_13526 ?auto_13523 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13577 - OBJ
      ?auto_13578 - OBJ
      ?auto_13579 - OBJ
      ?auto_13576 - LOCATION
    )
    :vars
    (
      ?auto_13581 - TRUCK
      ?auto_13580 - LOCATION
      ?auto_13582 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_13578 ?auto_13577 ) ) ( not ( = ?auto_13579 ?auto_13577 ) ) ( not ( = ?auto_13579 ?auto_13578 ) ) ( TRUCK-AT ?auto_13581 ?auto_13580 ) ( IN-CITY ?auto_13580 ?auto_13582 ) ( IN-CITY ?auto_13576 ?auto_13582 ) ( not ( = ?auto_13576 ?auto_13580 ) ) ( OBJ-AT ?auto_13578 ?auto_13576 ) ( OBJ-AT ?auto_13577 ?auto_13580 ) ( OBJ-AT ?auto_13579 ?auto_13576 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13578 ?auto_13577 ?auto_13576 )
      ( DELIVER-3PKG-VERIFY ?auto_13577 ?auto_13578 ?auto_13579 ?auto_13576 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13672 - OBJ
      ?auto_13673 - OBJ
      ?auto_13674 - OBJ
      ?auto_13671 - LOCATION
    )
    :vars
    (
      ?auto_13677 - LOCATION
      ?auto_13675 - CITY
      ?auto_13676 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13673 ?auto_13672 ) ) ( not ( = ?auto_13674 ?auto_13672 ) ) ( not ( = ?auto_13674 ?auto_13673 ) ) ( IN-CITY ?auto_13677 ?auto_13675 ) ( IN-CITY ?auto_13671 ?auto_13675 ) ( not ( = ?auto_13671 ?auto_13677 ) ) ( OBJ-AT ?auto_13672 ?auto_13671 ) ( OBJ-AT ?auto_13674 ?auto_13677 ) ( TRUCK-AT ?auto_13676 ?auto_13671 ) ( OBJ-AT ?auto_13673 ?auto_13671 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13672 ?auto_13674 ?auto_13671 )
      ( DELIVER-3PKG-VERIFY ?auto_13672 ?auto_13673 ?auto_13674 ?auto_13671 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13686 - OBJ
      ?auto_13687 - OBJ
      ?auto_13688 - OBJ
      ?auto_13685 - LOCATION
    )
    :vars
    (
      ?auto_13691 - LOCATION
      ?auto_13689 - CITY
      ?auto_13690 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13687 ?auto_13686 ) ) ( not ( = ?auto_13688 ?auto_13686 ) ) ( not ( = ?auto_13688 ?auto_13687 ) ) ( IN-CITY ?auto_13691 ?auto_13689 ) ( IN-CITY ?auto_13685 ?auto_13689 ) ( not ( = ?auto_13685 ?auto_13691 ) ) ( OBJ-AT ?auto_13686 ?auto_13685 ) ( OBJ-AT ?auto_13687 ?auto_13691 ) ( TRUCK-AT ?auto_13690 ?auto_13685 ) ( OBJ-AT ?auto_13688 ?auto_13685 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13686 ?auto_13687 ?auto_13685 )
      ( DELIVER-3PKG-VERIFY ?auto_13686 ?auto_13687 ?auto_13688 ?auto_13685 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13739 - OBJ
      ?auto_13740 - OBJ
      ?auto_13741 - OBJ
      ?auto_13738 - LOCATION
    )
    :vars
    (
      ?auto_13744 - LOCATION
      ?auto_13742 - CITY
      ?auto_13743 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_13740 ?auto_13739 ) ) ( not ( = ?auto_13741 ?auto_13739 ) ) ( not ( = ?auto_13741 ?auto_13740 ) ) ( IN-CITY ?auto_13744 ?auto_13742 ) ( IN-CITY ?auto_13738 ?auto_13742 ) ( not ( = ?auto_13738 ?auto_13744 ) ) ( OBJ-AT ?auto_13740 ?auto_13738 ) ( OBJ-AT ?auto_13739 ?auto_13744 ) ( TRUCK-AT ?auto_13743 ?auto_13738 ) ( OBJ-AT ?auto_13741 ?auto_13738 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13740 ?auto_13739 ?auto_13738 )
      ( DELIVER-3PKG-VERIFY ?auto_13739 ?auto_13740 ?auto_13741 ?auto_13738 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13965 - OBJ
      ?auto_13964 - LOCATION
    )
    :vars
    (
      ?auto_13967 - OBJ
      ?auto_13966 - LOCATION
      ?auto_13969 - CITY
      ?auto_13968 - TRUCK
      ?auto_13970 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_13965 ?auto_13967 ) ) ( IN-CITY ?auto_13966 ?auto_13969 ) ( IN-CITY ?auto_13964 ?auto_13969 ) ( not ( = ?auto_13964 ?auto_13966 ) ) ( OBJ-AT ?auto_13967 ?auto_13964 ) ( OBJ-AT ?auto_13965 ?auto_13966 ) ( TRUCK-AT ?auto_13968 ?auto_13970 ) ( IN-CITY ?auto_13970 ?auto_13969 ) ( not ( = ?auto_13964 ?auto_13970 ) ) ( not ( = ?auto_13966 ?auto_13970 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13968 ?auto_13970 ?auto_13964 ?auto_13969 )
      ( DELIVER-2PKG ?auto_13967 ?auto_13965 ?auto_13964 )
      ( DELIVER-1PKG-VERIFY ?auto_13965 ?auto_13964 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13972 - OBJ
      ?auto_13973 - OBJ
      ?auto_13971 - LOCATION
    )
    :vars
    (
      ?auto_13976 - LOCATION
      ?auto_13974 - CITY
      ?auto_13975 - TRUCK
      ?auto_13977 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_13973 ?auto_13972 ) ) ( IN-CITY ?auto_13976 ?auto_13974 ) ( IN-CITY ?auto_13971 ?auto_13974 ) ( not ( = ?auto_13971 ?auto_13976 ) ) ( OBJ-AT ?auto_13972 ?auto_13971 ) ( OBJ-AT ?auto_13973 ?auto_13976 ) ( TRUCK-AT ?auto_13975 ?auto_13977 ) ( IN-CITY ?auto_13977 ?auto_13974 ) ( not ( = ?auto_13971 ?auto_13977 ) ) ( not ( = ?auto_13976 ?auto_13977 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13973 ?auto_13971 )
      ( DELIVER-2PKG-VERIFY ?auto_13972 ?auto_13973 ?auto_13971 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13987 - OBJ
      ?auto_13988 - OBJ
      ?auto_13986 - LOCATION
    )
    :vars
    (
      ?auto_13991 - LOCATION
      ?auto_13989 - CITY
      ?auto_13990 - TRUCK
      ?auto_13992 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_13988 ?auto_13987 ) ) ( IN-CITY ?auto_13991 ?auto_13989 ) ( IN-CITY ?auto_13986 ?auto_13989 ) ( not ( = ?auto_13986 ?auto_13991 ) ) ( OBJ-AT ?auto_13988 ?auto_13986 ) ( OBJ-AT ?auto_13987 ?auto_13991 ) ( TRUCK-AT ?auto_13990 ?auto_13992 ) ( IN-CITY ?auto_13992 ?auto_13989 ) ( not ( = ?auto_13986 ?auto_13992 ) ) ( not ( = ?auto_13991 ?auto_13992 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13988 ?auto_13987 ?auto_13986 )
      ( DELIVER-2PKG-VERIFY ?auto_13987 ?auto_13988 ?auto_13986 ) )
  )

)

