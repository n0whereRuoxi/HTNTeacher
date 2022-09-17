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
      ?auto_147533 - OBJ
      ?auto_147532 - LOCATION
    )
    :vars
    (
      ?auto_147535 - LOCATION
      ?auto_147536 - CITY
      ?auto_147534 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147535 ?auto_147536 ) ( IN-CITY ?auto_147532 ?auto_147536 ) ( not ( = ?auto_147532 ?auto_147535 ) ) ( OBJ-AT ?auto_147533 ?auto_147535 ) ( TRUCK-AT ?auto_147534 ?auto_147532 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_147534 ?auto_147532 ?auto_147535 ?auto_147536 )
      ( !LOAD-TRUCK ?auto_147533 ?auto_147534 ?auto_147535 )
      ( !DRIVE-TRUCK ?auto_147534 ?auto_147535 ?auto_147532 ?auto_147536 )
      ( !UNLOAD-TRUCK ?auto_147533 ?auto_147534 ?auto_147532 )
      ( DELIVER-1PKG-VERIFY ?auto_147533 ?auto_147532 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_147540 - OBJ
      ?auto_147539 - LOCATION
    )
    :vars
    (
      ?auto_147542 - LOCATION
      ?auto_147543 - CITY
      ?auto_147541 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147542 ?auto_147543 ) ( IN-CITY ?auto_147539 ?auto_147543 ) ( not ( = ?auto_147539 ?auto_147542 ) ) ( OBJ-AT ?auto_147540 ?auto_147542 ) ( TRUCK-AT ?auto_147541 ?auto_147539 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_147541 ?auto_147539 ?auto_147542 ?auto_147543 )
      ( !LOAD-TRUCK ?auto_147540 ?auto_147541 ?auto_147542 )
      ( !DRIVE-TRUCK ?auto_147541 ?auto_147542 ?auto_147539 ?auto_147543 )
      ( !UNLOAD-TRUCK ?auto_147540 ?auto_147541 ?auto_147539 )
      ( DELIVER-1PKG-VERIFY ?auto_147540 ?auto_147539 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_147554 - OBJ
      ?auto_147555 - OBJ
      ?auto_147553 - LOCATION
    )
    :vars
    (
      ?auto_147556 - LOCATION
      ?auto_147557 - CITY
      ?auto_147559 - LOCATION
      ?auto_147558 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147556 ?auto_147557 ) ( IN-CITY ?auto_147553 ?auto_147557 ) ( not ( = ?auto_147553 ?auto_147556 ) ) ( OBJ-AT ?auto_147555 ?auto_147556 ) ( IN-CITY ?auto_147559 ?auto_147557 ) ( not ( = ?auto_147553 ?auto_147559 ) ) ( OBJ-AT ?auto_147554 ?auto_147559 ) ( TRUCK-AT ?auto_147558 ?auto_147553 ) ( not ( = ?auto_147554 ?auto_147555 ) ) ( not ( = ?auto_147556 ?auto_147559 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_147554 ?auto_147553 )
      ( DELIVER-1PKG ?auto_147555 ?auto_147553 )
      ( DELIVER-2PKG-VERIFY ?auto_147554 ?auto_147555 ?auto_147553 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_147561 - OBJ
      ?auto_147562 - OBJ
      ?auto_147560 - LOCATION
    )
    :vars
    (
      ?auto_147566 - LOCATION
      ?auto_147565 - CITY
      ?auto_147563 - LOCATION
      ?auto_147564 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147566 ?auto_147565 ) ( IN-CITY ?auto_147560 ?auto_147565 ) ( not ( = ?auto_147560 ?auto_147566 ) ) ( OBJ-AT ?auto_147561 ?auto_147566 ) ( IN-CITY ?auto_147563 ?auto_147565 ) ( not ( = ?auto_147560 ?auto_147563 ) ) ( OBJ-AT ?auto_147562 ?auto_147563 ) ( TRUCK-AT ?auto_147564 ?auto_147560 ) ( not ( = ?auto_147562 ?auto_147561 ) ) ( not ( = ?auto_147566 ?auto_147563 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_147562 ?auto_147561 ?auto_147560 )
      ( DELIVER-2PKG-VERIFY ?auto_147561 ?auto_147562 ?auto_147560 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_147578 - OBJ
      ?auto_147577 - LOCATION
    )
    :vars
    (
      ?auto_147580 - LOCATION
      ?auto_147581 - CITY
      ?auto_147579 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147580 ?auto_147581 ) ( IN-CITY ?auto_147577 ?auto_147581 ) ( not ( = ?auto_147577 ?auto_147580 ) ) ( OBJ-AT ?auto_147578 ?auto_147580 ) ( TRUCK-AT ?auto_147579 ?auto_147577 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_147579 ?auto_147577 ?auto_147580 ?auto_147581 )
      ( !LOAD-TRUCK ?auto_147578 ?auto_147579 ?auto_147580 )
      ( !DRIVE-TRUCK ?auto_147579 ?auto_147580 ?auto_147577 ?auto_147581 )
      ( !UNLOAD-TRUCK ?auto_147578 ?auto_147579 ?auto_147577 )
      ( DELIVER-1PKG-VERIFY ?auto_147578 ?auto_147577 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147669 - OBJ
      ?auto_147670 - OBJ
      ?auto_147671 - OBJ
      ?auto_147668 - LOCATION
    )
    :vars
    (
      ?auto_147672 - LOCATION
      ?auto_147673 - CITY
      ?auto_147676 - LOCATION
      ?auto_147675 - LOCATION
      ?auto_147674 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147672 ?auto_147673 ) ( IN-CITY ?auto_147668 ?auto_147673 ) ( not ( = ?auto_147668 ?auto_147672 ) ) ( OBJ-AT ?auto_147671 ?auto_147672 ) ( IN-CITY ?auto_147676 ?auto_147673 ) ( not ( = ?auto_147668 ?auto_147676 ) ) ( OBJ-AT ?auto_147670 ?auto_147676 ) ( IN-CITY ?auto_147675 ?auto_147673 ) ( not ( = ?auto_147668 ?auto_147675 ) ) ( OBJ-AT ?auto_147669 ?auto_147675 ) ( TRUCK-AT ?auto_147674 ?auto_147668 ) ( not ( = ?auto_147669 ?auto_147670 ) ) ( not ( = ?auto_147676 ?auto_147675 ) ) ( not ( = ?auto_147669 ?auto_147671 ) ) ( not ( = ?auto_147670 ?auto_147671 ) ) ( not ( = ?auto_147672 ?auto_147676 ) ) ( not ( = ?auto_147672 ?auto_147675 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_147670 ?auto_147669 ?auto_147668 )
      ( DELIVER-1PKG ?auto_147671 ?auto_147668 )
      ( DELIVER-3PKG-VERIFY ?auto_147669 ?auto_147670 ?auto_147671 ?auto_147668 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147688 - OBJ
      ?auto_147689 - OBJ
      ?auto_147690 - OBJ
      ?auto_147687 - LOCATION
    )
    :vars
    (
      ?auto_147693 - LOCATION
      ?auto_147695 - CITY
      ?auto_147691 - LOCATION
      ?auto_147692 - LOCATION
      ?auto_147694 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147693 ?auto_147695 ) ( IN-CITY ?auto_147687 ?auto_147695 ) ( not ( = ?auto_147687 ?auto_147693 ) ) ( OBJ-AT ?auto_147689 ?auto_147693 ) ( IN-CITY ?auto_147691 ?auto_147695 ) ( not ( = ?auto_147687 ?auto_147691 ) ) ( OBJ-AT ?auto_147690 ?auto_147691 ) ( IN-CITY ?auto_147692 ?auto_147695 ) ( not ( = ?auto_147687 ?auto_147692 ) ) ( OBJ-AT ?auto_147688 ?auto_147692 ) ( TRUCK-AT ?auto_147694 ?auto_147687 ) ( not ( = ?auto_147688 ?auto_147690 ) ) ( not ( = ?auto_147691 ?auto_147692 ) ) ( not ( = ?auto_147688 ?auto_147689 ) ) ( not ( = ?auto_147690 ?auto_147689 ) ) ( not ( = ?auto_147693 ?auto_147691 ) ) ( not ( = ?auto_147693 ?auto_147692 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_147688 ?auto_147690 ?auto_147689 ?auto_147687 )
      ( DELIVER-3PKG-VERIFY ?auto_147688 ?auto_147689 ?auto_147690 ?auto_147687 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147707 - OBJ
      ?auto_147708 - OBJ
      ?auto_147709 - OBJ
      ?auto_147706 - LOCATION
    )
    :vars
    (
      ?auto_147710 - LOCATION
      ?auto_147713 - CITY
      ?auto_147712 - LOCATION
      ?auto_147714 - LOCATION
      ?auto_147711 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147710 ?auto_147713 ) ( IN-CITY ?auto_147706 ?auto_147713 ) ( not ( = ?auto_147706 ?auto_147710 ) ) ( OBJ-AT ?auto_147709 ?auto_147710 ) ( IN-CITY ?auto_147712 ?auto_147713 ) ( not ( = ?auto_147706 ?auto_147712 ) ) ( OBJ-AT ?auto_147707 ?auto_147712 ) ( IN-CITY ?auto_147714 ?auto_147713 ) ( not ( = ?auto_147706 ?auto_147714 ) ) ( OBJ-AT ?auto_147708 ?auto_147714 ) ( TRUCK-AT ?auto_147711 ?auto_147706 ) ( not ( = ?auto_147708 ?auto_147707 ) ) ( not ( = ?auto_147712 ?auto_147714 ) ) ( not ( = ?auto_147708 ?auto_147709 ) ) ( not ( = ?auto_147707 ?auto_147709 ) ) ( not ( = ?auto_147710 ?auto_147712 ) ) ( not ( = ?auto_147710 ?auto_147714 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_147708 ?auto_147709 ?auto_147707 ?auto_147706 )
      ( DELIVER-3PKG-VERIFY ?auto_147707 ?auto_147708 ?auto_147709 ?auto_147706 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147726 - OBJ
      ?auto_147727 - OBJ
      ?auto_147728 - OBJ
      ?auto_147725 - LOCATION
    )
    :vars
    (
      ?auto_147729 - LOCATION
      ?auto_147732 - CITY
      ?auto_147731 - LOCATION
      ?auto_147733 - LOCATION
      ?auto_147730 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147729 ?auto_147732 ) ( IN-CITY ?auto_147725 ?auto_147732 ) ( not ( = ?auto_147725 ?auto_147729 ) ) ( OBJ-AT ?auto_147727 ?auto_147729 ) ( IN-CITY ?auto_147731 ?auto_147732 ) ( not ( = ?auto_147725 ?auto_147731 ) ) ( OBJ-AT ?auto_147726 ?auto_147731 ) ( IN-CITY ?auto_147733 ?auto_147732 ) ( not ( = ?auto_147725 ?auto_147733 ) ) ( OBJ-AT ?auto_147728 ?auto_147733 ) ( TRUCK-AT ?auto_147730 ?auto_147725 ) ( not ( = ?auto_147728 ?auto_147726 ) ) ( not ( = ?auto_147731 ?auto_147733 ) ) ( not ( = ?auto_147728 ?auto_147727 ) ) ( not ( = ?auto_147726 ?auto_147727 ) ) ( not ( = ?auto_147729 ?auto_147731 ) ) ( not ( = ?auto_147729 ?auto_147733 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_147728 ?auto_147727 ?auto_147726 ?auto_147725 )
      ( DELIVER-3PKG-VERIFY ?auto_147726 ?auto_147727 ?auto_147728 ?auto_147725 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147765 - OBJ
      ?auto_147766 - OBJ
      ?auto_147767 - OBJ
      ?auto_147764 - LOCATION
    )
    :vars
    (
      ?auto_147768 - LOCATION
      ?auto_147771 - CITY
      ?auto_147770 - LOCATION
      ?auto_147772 - LOCATION
      ?auto_147769 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147768 ?auto_147771 ) ( IN-CITY ?auto_147764 ?auto_147771 ) ( not ( = ?auto_147764 ?auto_147768 ) ) ( OBJ-AT ?auto_147765 ?auto_147768 ) ( IN-CITY ?auto_147770 ?auto_147771 ) ( not ( = ?auto_147764 ?auto_147770 ) ) ( OBJ-AT ?auto_147767 ?auto_147770 ) ( IN-CITY ?auto_147772 ?auto_147771 ) ( not ( = ?auto_147764 ?auto_147772 ) ) ( OBJ-AT ?auto_147766 ?auto_147772 ) ( TRUCK-AT ?auto_147769 ?auto_147764 ) ( not ( = ?auto_147766 ?auto_147767 ) ) ( not ( = ?auto_147770 ?auto_147772 ) ) ( not ( = ?auto_147766 ?auto_147765 ) ) ( not ( = ?auto_147767 ?auto_147765 ) ) ( not ( = ?auto_147768 ?auto_147770 ) ) ( not ( = ?auto_147768 ?auto_147772 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_147766 ?auto_147765 ?auto_147767 ?auto_147764 )
      ( DELIVER-3PKG-VERIFY ?auto_147765 ?auto_147766 ?auto_147767 ?auto_147764 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147784 - OBJ
      ?auto_147785 - OBJ
      ?auto_147786 - OBJ
      ?auto_147783 - LOCATION
    )
    :vars
    (
      ?auto_147787 - LOCATION
      ?auto_147790 - CITY
      ?auto_147789 - LOCATION
      ?auto_147791 - LOCATION
      ?auto_147788 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147787 ?auto_147790 ) ( IN-CITY ?auto_147783 ?auto_147790 ) ( not ( = ?auto_147783 ?auto_147787 ) ) ( OBJ-AT ?auto_147784 ?auto_147787 ) ( IN-CITY ?auto_147789 ?auto_147790 ) ( not ( = ?auto_147783 ?auto_147789 ) ) ( OBJ-AT ?auto_147785 ?auto_147789 ) ( IN-CITY ?auto_147791 ?auto_147790 ) ( not ( = ?auto_147783 ?auto_147791 ) ) ( OBJ-AT ?auto_147786 ?auto_147791 ) ( TRUCK-AT ?auto_147788 ?auto_147783 ) ( not ( = ?auto_147786 ?auto_147785 ) ) ( not ( = ?auto_147789 ?auto_147791 ) ) ( not ( = ?auto_147786 ?auto_147784 ) ) ( not ( = ?auto_147785 ?auto_147784 ) ) ( not ( = ?auto_147787 ?auto_147789 ) ) ( not ( = ?auto_147787 ?auto_147791 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_147786 ?auto_147784 ?auto_147785 ?auto_147783 )
      ( DELIVER-3PKG-VERIFY ?auto_147784 ?auto_147785 ?auto_147786 ?auto_147783 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_147846 - OBJ
      ?auto_147845 - LOCATION
    )
    :vars
    (
      ?auto_147848 - LOCATION
      ?auto_147849 - CITY
      ?auto_147847 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147848 ?auto_147849 ) ( IN-CITY ?auto_147845 ?auto_147849 ) ( not ( = ?auto_147845 ?auto_147848 ) ) ( OBJ-AT ?auto_147846 ?auto_147848 ) ( TRUCK-AT ?auto_147847 ?auto_147845 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_147847 ?auto_147845 ?auto_147848 ?auto_147849 )
      ( !LOAD-TRUCK ?auto_147846 ?auto_147847 ?auto_147848 )
      ( !DRIVE-TRUCK ?auto_147847 ?auto_147848 ?auto_147845 ?auto_147849 )
      ( !UNLOAD-TRUCK ?auto_147846 ?auto_147847 ?auto_147845 )
      ( DELIVER-1PKG-VERIFY ?auto_147846 ?auto_147845 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148837 - OBJ
      ?auto_148838 - OBJ
      ?auto_148839 - OBJ
      ?auto_148840 - OBJ
      ?auto_148836 - LOCATION
    )
    :vars
    (
      ?auto_148843 - LOCATION
      ?auto_148841 - CITY
      ?auto_148844 - LOCATION
      ?auto_148845 - LOCATION
      ?auto_148846 - LOCATION
      ?auto_148842 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148843 ?auto_148841 ) ( IN-CITY ?auto_148836 ?auto_148841 ) ( not ( = ?auto_148836 ?auto_148843 ) ) ( OBJ-AT ?auto_148840 ?auto_148843 ) ( IN-CITY ?auto_148844 ?auto_148841 ) ( not ( = ?auto_148836 ?auto_148844 ) ) ( OBJ-AT ?auto_148839 ?auto_148844 ) ( IN-CITY ?auto_148845 ?auto_148841 ) ( not ( = ?auto_148836 ?auto_148845 ) ) ( OBJ-AT ?auto_148838 ?auto_148845 ) ( IN-CITY ?auto_148846 ?auto_148841 ) ( not ( = ?auto_148836 ?auto_148846 ) ) ( OBJ-AT ?auto_148837 ?auto_148846 ) ( TRUCK-AT ?auto_148842 ?auto_148836 ) ( not ( = ?auto_148837 ?auto_148838 ) ) ( not ( = ?auto_148845 ?auto_148846 ) ) ( not ( = ?auto_148837 ?auto_148839 ) ) ( not ( = ?auto_148838 ?auto_148839 ) ) ( not ( = ?auto_148844 ?auto_148845 ) ) ( not ( = ?auto_148844 ?auto_148846 ) ) ( not ( = ?auto_148837 ?auto_148840 ) ) ( not ( = ?auto_148838 ?auto_148840 ) ) ( not ( = ?auto_148839 ?auto_148840 ) ) ( not ( = ?auto_148843 ?auto_148844 ) ) ( not ( = ?auto_148843 ?auto_148845 ) ) ( not ( = ?auto_148843 ?auto_148846 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_148837 ?auto_148839 ?auto_148838 ?auto_148836 )
      ( DELIVER-1PKG ?auto_148840 ?auto_148836 )
      ( DELIVER-4PKG-VERIFY ?auto_148837 ?auto_148838 ?auto_148839 ?auto_148840 ?auto_148836 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148872 - OBJ
      ?auto_148873 - OBJ
      ?auto_148874 - OBJ
      ?auto_148875 - OBJ
      ?auto_148871 - LOCATION
    )
    :vars
    (
      ?auto_148878 - LOCATION
      ?auto_148881 - CITY
      ?auto_148876 - LOCATION
      ?auto_148877 - LOCATION
      ?auto_148879 - LOCATION
      ?auto_148880 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148878 ?auto_148881 ) ( IN-CITY ?auto_148871 ?auto_148881 ) ( not ( = ?auto_148871 ?auto_148878 ) ) ( OBJ-AT ?auto_148874 ?auto_148878 ) ( IN-CITY ?auto_148876 ?auto_148881 ) ( not ( = ?auto_148871 ?auto_148876 ) ) ( OBJ-AT ?auto_148875 ?auto_148876 ) ( IN-CITY ?auto_148877 ?auto_148881 ) ( not ( = ?auto_148871 ?auto_148877 ) ) ( OBJ-AT ?auto_148873 ?auto_148877 ) ( IN-CITY ?auto_148879 ?auto_148881 ) ( not ( = ?auto_148871 ?auto_148879 ) ) ( OBJ-AT ?auto_148872 ?auto_148879 ) ( TRUCK-AT ?auto_148880 ?auto_148871 ) ( not ( = ?auto_148872 ?auto_148873 ) ) ( not ( = ?auto_148877 ?auto_148879 ) ) ( not ( = ?auto_148872 ?auto_148875 ) ) ( not ( = ?auto_148873 ?auto_148875 ) ) ( not ( = ?auto_148876 ?auto_148877 ) ) ( not ( = ?auto_148876 ?auto_148879 ) ) ( not ( = ?auto_148872 ?auto_148874 ) ) ( not ( = ?auto_148873 ?auto_148874 ) ) ( not ( = ?auto_148875 ?auto_148874 ) ) ( not ( = ?auto_148878 ?auto_148876 ) ) ( not ( = ?auto_148878 ?auto_148877 ) ) ( not ( = ?auto_148878 ?auto_148879 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_148872 ?auto_148873 ?auto_148875 ?auto_148874 ?auto_148871 )
      ( DELIVER-4PKG-VERIFY ?auto_148872 ?auto_148873 ?auto_148874 ?auto_148875 ?auto_148871 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148907 - OBJ
      ?auto_148908 - OBJ
      ?auto_148909 - OBJ
      ?auto_148910 - OBJ
      ?auto_148906 - LOCATION
    )
    :vars
    (
      ?auto_148913 - LOCATION
      ?auto_148914 - CITY
      ?auto_148916 - LOCATION
      ?auto_148912 - LOCATION
      ?auto_148915 - LOCATION
      ?auto_148911 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148913 ?auto_148914 ) ( IN-CITY ?auto_148906 ?auto_148914 ) ( not ( = ?auto_148906 ?auto_148913 ) ) ( OBJ-AT ?auto_148910 ?auto_148913 ) ( IN-CITY ?auto_148916 ?auto_148914 ) ( not ( = ?auto_148906 ?auto_148916 ) ) ( OBJ-AT ?auto_148908 ?auto_148916 ) ( IN-CITY ?auto_148912 ?auto_148914 ) ( not ( = ?auto_148906 ?auto_148912 ) ) ( OBJ-AT ?auto_148909 ?auto_148912 ) ( IN-CITY ?auto_148915 ?auto_148914 ) ( not ( = ?auto_148906 ?auto_148915 ) ) ( OBJ-AT ?auto_148907 ?auto_148915 ) ( TRUCK-AT ?auto_148911 ?auto_148906 ) ( not ( = ?auto_148907 ?auto_148909 ) ) ( not ( = ?auto_148912 ?auto_148915 ) ) ( not ( = ?auto_148907 ?auto_148908 ) ) ( not ( = ?auto_148909 ?auto_148908 ) ) ( not ( = ?auto_148916 ?auto_148912 ) ) ( not ( = ?auto_148916 ?auto_148915 ) ) ( not ( = ?auto_148907 ?auto_148910 ) ) ( not ( = ?auto_148909 ?auto_148910 ) ) ( not ( = ?auto_148908 ?auto_148910 ) ) ( not ( = ?auto_148913 ?auto_148916 ) ) ( not ( = ?auto_148913 ?auto_148912 ) ) ( not ( = ?auto_148913 ?auto_148915 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_148907 ?auto_148909 ?auto_148910 ?auto_148908 ?auto_148906 )
      ( DELIVER-4PKG-VERIFY ?auto_148907 ?auto_148908 ?auto_148909 ?auto_148910 ?auto_148906 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148942 - OBJ
      ?auto_148943 - OBJ
      ?auto_148944 - OBJ
      ?auto_148945 - OBJ
      ?auto_148941 - LOCATION
    )
    :vars
    (
      ?auto_148948 - LOCATION
      ?auto_148949 - CITY
      ?auto_148951 - LOCATION
      ?auto_148947 - LOCATION
      ?auto_148950 - LOCATION
      ?auto_148946 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148948 ?auto_148949 ) ( IN-CITY ?auto_148941 ?auto_148949 ) ( not ( = ?auto_148941 ?auto_148948 ) ) ( OBJ-AT ?auto_148944 ?auto_148948 ) ( IN-CITY ?auto_148951 ?auto_148949 ) ( not ( = ?auto_148941 ?auto_148951 ) ) ( OBJ-AT ?auto_148943 ?auto_148951 ) ( IN-CITY ?auto_148947 ?auto_148949 ) ( not ( = ?auto_148941 ?auto_148947 ) ) ( OBJ-AT ?auto_148945 ?auto_148947 ) ( IN-CITY ?auto_148950 ?auto_148949 ) ( not ( = ?auto_148941 ?auto_148950 ) ) ( OBJ-AT ?auto_148942 ?auto_148950 ) ( TRUCK-AT ?auto_148946 ?auto_148941 ) ( not ( = ?auto_148942 ?auto_148945 ) ) ( not ( = ?auto_148947 ?auto_148950 ) ) ( not ( = ?auto_148942 ?auto_148943 ) ) ( not ( = ?auto_148945 ?auto_148943 ) ) ( not ( = ?auto_148951 ?auto_148947 ) ) ( not ( = ?auto_148951 ?auto_148950 ) ) ( not ( = ?auto_148942 ?auto_148944 ) ) ( not ( = ?auto_148945 ?auto_148944 ) ) ( not ( = ?auto_148943 ?auto_148944 ) ) ( not ( = ?auto_148948 ?auto_148951 ) ) ( not ( = ?auto_148948 ?auto_148947 ) ) ( not ( = ?auto_148948 ?auto_148950 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_148942 ?auto_148945 ?auto_148944 ?auto_148943 ?auto_148941 )
      ( DELIVER-4PKG-VERIFY ?auto_148942 ?auto_148943 ?auto_148944 ?auto_148945 ?auto_148941 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149051 - OBJ
      ?auto_149052 - OBJ
      ?auto_149053 - OBJ
      ?auto_149054 - OBJ
      ?auto_149050 - LOCATION
    )
    :vars
    (
      ?auto_149057 - LOCATION
      ?auto_149058 - CITY
      ?auto_149060 - LOCATION
      ?auto_149056 - LOCATION
      ?auto_149059 - LOCATION
      ?auto_149055 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149057 ?auto_149058 ) ( IN-CITY ?auto_149050 ?auto_149058 ) ( not ( = ?auto_149050 ?auto_149057 ) ) ( OBJ-AT ?auto_149052 ?auto_149057 ) ( IN-CITY ?auto_149060 ?auto_149058 ) ( not ( = ?auto_149050 ?auto_149060 ) ) ( OBJ-AT ?auto_149054 ?auto_149060 ) ( IN-CITY ?auto_149056 ?auto_149058 ) ( not ( = ?auto_149050 ?auto_149056 ) ) ( OBJ-AT ?auto_149053 ?auto_149056 ) ( IN-CITY ?auto_149059 ?auto_149058 ) ( not ( = ?auto_149050 ?auto_149059 ) ) ( OBJ-AT ?auto_149051 ?auto_149059 ) ( TRUCK-AT ?auto_149055 ?auto_149050 ) ( not ( = ?auto_149051 ?auto_149053 ) ) ( not ( = ?auto_149056 ?auto_149059 ) ) ( not ( = ?auto_149051 ?auto_149054 ) ) ( not ( = ?auto_149053 ?auto_149054 ) ) ( not ( = ?auto_149060 ?auto_149056 ) ) ( not ( = ?auto_149060 ?auto_149059 ) ) ( not ( = ?auto_149051 ?auto_149052 ) ) ( not ( = ?auto_149053 ?auto_149052 ) ) ( not ( = ?auto_149054 ?auto_149052 ) ) ( not ( = ?auto_149057 ?auto_149060 ) ) ( not ( = ?auto_149057 ?auto_149056 ) ) ( not ( = ?auto_149057 ?auto_149059 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149051 ?auto_149053 ?auto_149052 ?auto_149054 ?auto_149050 )
      ( DELIVER-4PKG-VERIFY ?auto_149051 ?auto_149052 ?auto_149053 ?auto_149054 ?auto_149050 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149086 - OBJ
      ?auto_149087 - OBJ
      ?auto_149088 - OBJ
      ?auto_149089 - OBJ
      ?auto_149085 - LOCATION
    )
    :vars
    (
      ?auto_149092 - LOCATION
      ?auto_149093 - CITY
      ?auto_149095 - LOCATION
      ?auto_149091 - LOCATION
      ?auto_149094 - LOCATION
      ?auto_149090 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149092 ?auto_149093 ) ( IN-CITY ?auto_149085 ?auto_149093 ) ( not ( = ?auto_149085 ?auto_149092 ) ) ( OBJ-AT ?auto_149087 ?auto_149092 ) ( IN-CITY ?auto_149095 ?auto_149093 ) ( not ( = ?auto_149085 ?auto_149095 ) ) ( OBJ-AT ?auto_149088 ?auto_149095 ) ( IN-CITY ?auto_149091 ?auto_149093 ) ( not ( = ?auto_149085 ?auto_149091 ) ) ( OBJ-AT ?auto_149089 ?auto_149091 ) ( IN-CITY ?auto_149094 ?auto_149093 ) ( not ( = ?auto_149085 ?auto_149094 ) ) ( OBJ-AT ?auto_149086 ?auto_149094 ) ( TRUCK-AT ?auto_149090 ?auto_149085 ) ( not ( = ?auto_149086 ?auto_149089 ) ) ( not ( = ?auto_149091 ?auto_149094 ) ) ( not ( = ?auto_149086 ?auto_149088 ) ) ( not ( = ?auto_149089 ?auto_149088 ) ) ( not ( = ?auto_149095 ?auto_149091 ) ) ( not ( = ?auto_149095 ?auto_149094 ) ) ( not ( = ?auto_149086 ?auto_149087 ) ) ( not ( = ?auto_149089 ?auto_149087 ) ) ( not ( = ?auto_149088 ?auto_149087 ) ) ( not ( = ?auto_149092 ?auto_149095 ) ) ( not ( = ?auto_149092 ?auto_149091 ) ) ( not ( = ?auto_149092 ?auto_149094 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149086 ?auto_149089 ?auto_149087 ?auto_149088 ?auto_149085 )
      ( DELIVER-4PKG-VERIFY ?auto_149086 ?auto_149087 ?auto_149088 ?auto_149089 ?auto_149085 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149195 - OBJ
      ?auto_149196 - OBJ
      ?auto_149197 - OBJ
      ?auto_149198 - OBJ
      ?auto_149194 - LOCATION
    )
    :vars
    (
      ?auto_149201 - LOCATION
      ?auto_149202 - CITY
      ?auto_149204 - LOCATION
      ?auto_149200 - LOCATION
      ?auto_149203 - LOCATION
      ?auto_149199 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149201 ?auto_149202 ) ( IN-CITY ?auto_149194 ?auto_149202 ) ( not ( = ?auto_149194 ?auto_149201 ) ) ( OBJ-AT ?auto_149198 ?auto_149201 ) ( IN-CITY ?auto_149204 ?auto_149202 ) ( not ( = ?auto_149194 ?auto_149204 ) ) ( OBJ-AT ?auto_149197 ?auto_149204 ) ( IN-CITY ?auto_149200 ?auto_149202 ) ( not ( = ?auto_149194 ?auto_149200 ) ) ( OBJ-AT ?auto_149195 ?auto_149200 ) ( IN-CITY ?auto_149203 ?auto_149202 ) ( not ( = ?auto_149194 ?auto_149203 ) ) ( OBJ-AT ?auto_149196 ?auto_149203 ) ( TRUCK-AT ?auto_149199 ?auto_149194 ) ( not ( = ?auto_149196 ?auto_149195 ) ) ( not ( = ?auto_149200 ?auto_149203 ) ) ( not ( = ?auto_149196 ?auto_149197 ) ) ( not ( = ?auto_149195 ?auto_149197 ) ) ( not ( = ?auto_149204 ?auto_149200 ) ) ( not ( = ?auto_149204 ?auto_149203 ) ) ( not ( = ?auto_149196 ?auto_149198 ) ) ( not ( = ?auto_149195 ?auto_149198 ) ) ( not ( = ?auto_149197 ?auto_149198 ) ) ( not ( = ?auto_149201 ?auto_149204 ) ) ( not ( = ?auto_149201 ?auto_149200 ) ) ( not ( = ?auto_149201 ?auto_149203 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149196 ?auto_149195 ?auto_149198 ?auto_149197 ?auto_149194 )
      ( DELIVER-4PKG-VERIFY ?auto_149195 ?auto_149196 ?auto_149197 ?auto_149198 ?auto_149194 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149230 - OBJ
      ?auto_149231 - OBJ
      ?auto_149232 - OBJ
      ?auto_149233 - OBJ
      ?auto_149229 - LOCATION
    )
    :vars
    (
      ?auto_149236 - LOCATION
      ?auto_149237 - CITY
      ?auto_149239 - LOCATION
      ?auto_149235 - LOCATION
      ?auto_149238 - LOCATION
      ?auto_149234 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149236 ?auto_149237 ) ( IN-CITY ?auto_149229 ?auto_149237 ) ( not ( = ?auto_149229 ?auto_149236 ) ) ( OBJ-AT ?auto_149232 ?auto_149236 ) ( IN-CITY ?auto_149239 ?auto_149237 ) ( not ( = ?auto_149229 ?auto_149239 ) ) ( OBJ-AT ?auto_149233 ?auto_149239 ) ( IN-CITY ?auto_149235 ?auto_149237 ) ( not ( = ?auto_149229 ?auto_149235 ) ) ( OBJ-AT ?auto_149230 ?auto_149235 ) ( IN-CITY ?auto_149238 ?auto_149237 ) ( not ( = ?auto_149229 ?auto_149238 ) ) ( OBJ-AT ?auto_149231 ?auto_149238 ) ( TRUCK-AT ?auto_149234 ?auto_149229 ) ( not ( = ?auto_149231 ?auto_149230 ) ) ( not ( = ?auto_149235 ?auto_149238 ) ) ( not ( = ?auto_149231 ?auto_149233 ) ) ( not ( = ?auto_149230 ?auto_149233 ) ) ( not ( = ?auto_149239 ?auto_149235 ) ) ( not ( = ?auto_149239 ?auto_149238 ) ) ( not ( = ?auto_149231 ?auto_149232 ) ) ( not ( = ?auto_149230 ?auto_149232 ) ) ( not ( = ?auto_149233 ?auto_149232 ) ) ( not ( = ?auto_149236 ?auto_149239 ) ) ( not ( = ?auto_149236 ?auto_149235 ) ) ( not ( = ?auto_149236 ?auto_149238 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149231 ?auto_149230 ?auto_149232 ?auto_149233 ?auto_149229 )
      ( DELIVER-4PKG-VERIFY ?auto_149230 ?auto_149231 ?auto_149232 ?auto_149233 ?auto_149229 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149340 - OBJ
      ?auto_149341 - OBJ
      ?auto_149342 - OBJ
      ?auto_149343 - OBJ
      ?auto_149339 - LOCATION
    )
    :vars
    (
      ?auto_149346 - LOCATION
      ?auto_149347 - CITY
      ?auto_149349 - LOCATION
      ?auto_149345 - LOCATION
      ?auto_149348 - LOCATION
      ?auto_149344 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149346 ?auto_149347 ) ( IN-CITY ?auto_149339 ?auto_149347 ) ( not ( = ?auto_149339 ?auto_149346 ) ) ( OBJ-AT ?auto_149343 ?auto_149346 ) ( IN-CITY ?auto_149349 ?auto_149347 ) ( not ( = ?auto_149339 ?auto_149349 ) ) ( OBJ-AT ?auto_149341 ?auto_149349 ) ( IN-CITY ?auto_149345 ?auto_149347 ) ( not ( = ?auto_149339 ?auto_149345 ) ) ( OBJ-AT ?auto_149340 ?auto_149345 ) ( IN-CITY ?auto_149348 ?auto_149347 ) ( not ( = ?auto_149339 ?auto_149348 ) ) ( OBJ-AT ?auto_149342 ?auto_149348 ) ( TRUCK-AT ?auto_149344 ?auto_149339 ) ( not ( = ?auto_149342 ?auto_149340 ) ) ( not ( = ?auto_149345 ?auto_149348 ) ) ( not ( = ?auto_149342 ?auto_149341 ) ) ( not ( = ?auto_149340 ?auto_149341 ) ) ( not ( = ?auto_149349 ?auto_149345 ) ) ( not ( = ?auto_149349 ?auto_149348 ) ) ( not ( = ?auto_149342 ?auto_149343 ) ) ( not ( = ?auto_149340 ?auto_149343 ) ) ( not ( = ?auto_149341 ?auto_149343 ) ) ( not ( = ?auto_149346 ?auto_149349 ) ) ( not ( = ?auto_149346 ?auto_149345 ) ) ( not ( = ?auto_149346 ?auto_149348 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149342 ?auto_149340 ?auto_149343 ?auto_149341 ?auto_149339 )
      ( DELIVER-4PKG-VERIFY ?auto_149340 ?auto_149341 ?auto_149342 ?auto_149343 ?auto_149339 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149375 - OBJ
      ?auto_149376 - OBJ
      ?auto_149377 - OBJ
      ?auto_149378 - OBJ
      ?auto_149374 - LOCATION
    )
    :vars
    (
      ?auto_149381 - LOCATION
      ?auto_149382 - CITY
      ?auto_149384 - LOCATION
      ?auto_149380 - LOCATION
      ?auto_149383 - LOCATION
      ?auto_149379 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149381 ?auto_149382 ) ( IN-CITY ?auto_149374 ?auto_149382 ) ( not ( = ?auto_149374 ?auto_149381 ) ) ( OBJ-AT ?auto_149377 ?auto_149381 ) ( IN-CITY ?auto_149384 ?auto_149382 ) ( not ( = ?auto_149374 ?auto_149384 ) ) ( OBJ-AT ?auto_149376 ?auto_149384 ) ( IN-CITY ?auto_149380 ?auto_149382 ) ( not ( = ?auto_149374 ?auto_149380 ) ) ( OBJ-AT ?auto_149375 ?auto_149380 ) ( IN-CITY ?auto_149383 ?auto_149382 ) ( not ( = ?auto_149374 ?auto_149383 ) ) ( OBJ-AT ?auto_149378 ?auto_149383 ) ( TRUCK-AT ?auto_149379 ?auto_149374 ) ( not ( = ?auto_149378 ?auto_149375 ) ) ( not ( = ?auto_149380 ?auto_149383 ) ) ( not ( = ?auto_149378 ?auto_149376 ) ) ( not ( = ?auto_149375 ?auto_149376 ) ) ( not ( = ?auto_149384 ?auto_149380 ) ) ( not ( = ?auto_149384 ?auto_149383 ) ) ( not ( = ?auto_149378 ?auto_149377 ) ) ( not ( = ?auto_149375 ?auto_149377 ) ) ( not ( = ?auto_149376 ?auto_149377 ) ) ( not ( = ?auto_149381 ?auto_149384 ) ) ( not ( = ?auto_149381 ?auto_149380 ) ) ( not ( = ?auto_149381 ?auto_149383 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149378 ?auto_149375 ?auto_149377 ?auto_149376 ?auto_149374 )
      ( DELIVER-4PKG-VERIFY ?auto_149375 ?auto_149376 ?auto_149377 ?auto_149378 ?auto_149374 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149446 - OBJ
      ?auto_149447 - OBJ
      ?auto_149448 - OBJ
      ?auto_149449 - OBJ
      ?auto_149445 - LOCATION
    )
    :vars
    (
      ?auto_149452 - LOCATION
      ?auto_149453 - CITY
      ?auto_149455 - LOCATION
      ?auto_149451 - LOCATION
      ?auto_149454 - LOCATION
      ?auto_149450 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149452 ?auto_149453 ) ( IN-CITY ?auto_149445 ?auto_149453 ) ( not ( = ?auto_149445 ?auto_149452 ) ) ( OBJ-AT ?auto_149447 ?auto_149452 ) ( IN-CITY ?auto_149455 ?auto_149453 ) ( not ( = ?auto_149445 ?auto_149455 ) ) ( OBJ-AT ?auto_149449 ?auto_149455 ) ( IN-CITY ?auto_149451 ?auto_149453 ) ( not ( = ?auto_149445 ?auto_149451 ) ) ( OBJ-AT ?auto_149446 ?auto_149451 ) ( IN-CITY ?auto_149454 ?auto_149453 ) ( not ( = ?auto_149445 ?auto_149454 ) ) ( OBJ-AT ?auto_149448 ?auto_149454 ) ( TRUCK-AT ?auto_149450 ?auto_149445 ) ( not ( = ?auto_149448 ?auto_149446 ) ) ( not ( = ?auto_149451 ?auto_149454 ) ) ( not ( = ?auto_149448 ?auto_149449 ) ) ( not ( = ?auto_149446 ?auto_149449 ) ) ( not ( = ?auto_149455 ?auto_149451 ) ) ( not ( = ?auto_149455 ?auto_149454 ) ) ( not ( = ?auto_149448 ?auto_149447 ) ) ( not ( = ?auto_149446 ?auto_149447 ) ) ( not ( = ?auto_149449 ?auto_149447 ) ) ( not ( = ?auto_149452 ?auto_149455 ) ) ( not ( = ?auto_149452 ?auto_149451 ) ) ( not ( = ?auto_149452 ?auto_149454 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149448 ?auto_149446 ?auto_149447 ?auto_149449 ?auto_149445 )
      ( DELIVER-4PKG-VERIFY ?auto_149446 ?auto_149447 ?auto_149448 ?auto_149449 ?auto_149445 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149519 - OBJ
      ?auto_149520 - OBJ
      ?auto_149521 - OBJ
      ?auto_149522 - OBJ
      ?auto_149518 - LOCATION
    )
    :vars
    (
      ?auto_149525 - LOCATION
      ?auto_149526 - CITY
      ?auto_149528 - LOCATION
      ?auto_149524 - LOCATION
      ?auto_149527 - LOCATION
      ?auto_149523 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149525 ?auto_149526 ) ( IN-CITY ?auto_149518 ?auto_149526 ) ( not ( = ?auto_149518 ?auto_149525 ) ) ( OBJ-AT ?auto_149520 ?auto_149525 ) ( IN-CITY ?auto_149528 ?auto_149526 ) ( not ( = ?auto_149518 ?auto_149528 ) ) ( OBJ-AT ?auto_149521 ?auto_149528 ) ( IN-CITY ?auto_149524 ?auto_149526 ) ( not ( = ?auto_149518 ?auto_149524 ) ) ( OBJ-AT ?auto_149519 ?auto_149524 ) ( IN-CITY ?auto_149527 ?auto_149526 ) ( not ( = ?auto_149518 ?auto_149527 ) ) ( OBJ-AT ?auto_149522 ?auto_149527 ) ( TRUCK-AT ?auto_149523 ?auto_149518 ) ( not ( = ?auto_149522 ?auto_149519 ) ) ( not ( = ?auto_149524 ?auto_149527 ) ) ( not ( = ?auto_149522 ?auto_149521 ) ) ( not ( = ?auto_149519 ?auto_149521 ) ) ( not ( = ?auto_149528 ?auto_149524 ) ) ( not ( = ?auto_149528 ?auto_149527 ) ) ( not ( = ?auto_149522 ?auto_149520 ) ) ( not ( = ?auto_149519 ?auto_149520 ) ) ( not ( = ?auto_149521 ?auto_149520 ) ) ( not ( = ?auto_149525 ?auto_149528 ) ) ( not ( = ?auto_149525 ?auto_149524 ) ) ( not ( = ?auto_149525 ?auto_149527 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149522 ?auto_149519 ?auto_149520 ?auto_149521 ?auto_149518 )
      ( DELIVER-4PKG-VERIFY ?auto_149519 ?auto_149520 ?auto_149521 ?auto_149522 ?auto_149518 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149628 - OBJ
      ?auto_149629 - OBJ
      ?auto_149630 - OBJ
      ?auto_149631 - OBJ
      ?auto_149627 - LOCATION
    )
    :vars
    (
      ?auto_149634 - LOCATION
      ?auto_149635 - CITY
      ?auto_149637 - LOCATION
      ?auto_149633 - LOCATION
      ?auto_149636 - LOCATION
      ?auto_149632 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149634 ?auto_149635 ) ( IN-CITY ?auto_149627 ?auto_149635 ) ( not ( = ?auto_149627 ?auto_149634 ) ) ( OBJ-AT ?auto_149631 ?auto_149634 ) ( IN-CITY ?auto_149637 ?auto_149635 ) ( not ( = ?auto_149627 ?auto_149637 ) ) ( OBJ-AT ?auto_149628 ?auto_149637 ) ( IN-CITY ?auto_149633 ?auto_149635 ) ( not ( = ?auto_149627 ?auto_149633 ) ) ( OBJ-AT ?auto_149630 ?auto_149633 ) ( IN-CITY ?auto_149636 ?auto_149635 ) ( not ( = ?auto_149627 ?auto_149636 ) ) ( OBJ-AT ?auto_149629 ?auto_149636 ) ( TRUCK-AT ?auto_149632 ?auto_149627 ) ( not ( = ?auto_149629 ?auto_149630 ) ) ( not ( = ?auto_149633 ?auto_149636 ) ) ( not ( = ?auto_149629 ?auto_149628 ) ) ( not ( = ?auto_149630 ?auto_149628 ) ) ( not ( = ?auto_149637 ?auto_149633 ) ) ( not ( = ?auto_149637 ?auto_149636 ) ) ( not ( = ?auto_149629 ?auto_149631 ) ) ( not ( = ?auto_149630 ?auto_149631 ) ) ( not ( = ?auto_149628 ?auto_149631 ) ) ( not ( = ?auto_149634 ?auto_149637 ) ) ( not ( = ?auto_149634 ?auto_149633 ) ) ( not ( = ?auto_149634 ?auto_149636 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149629 ?auto_149630 ?auto_149631 ?auto_149628 ?auto_149627 )
      ( DELIVER-4PKG-VERIFY ?auto_149628 ?auto_149629 ?auto_149630 ?auto_149631 ?auto_149627 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149663 - OBJ
      ?auto_149664 - OBJ
      ?auto_149665 - OBJ
      ?auto_149666 - OBJ
      ?auto_149662 - LOCATION
    )
    :vars
    (
      ?auto_149669 - LOCATION
      ?auto_149670 - CITY
      ?auto_149672 - LOCATION
      ?auto_149668 - LOCATION
      ?auto_149671 - LOCATION
      ?auto_149667 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149669 ?auto_149670 ) ( IN-CITY ?auto_149662 ?auto_149670 ) ( not ( = ?auto_149662 ?auto_149669 ) ) ( OBJ-AT ?auto_149665 ?auto_149669 ) ( IN-CITY ?auto_149672 ?auto_149670 ) ( not ( = ?auto_149662 ?auto_149672 ) ) ( OBJ-AT ?auto_149663 ?auto_149672 ) ( IN-CITY ?auto_149668 ?auto_149670 ) ( not ( = ?auto_149662 ?auto_149668 ) ) ( OBJ-AT ?auto_149666 ?auto_149668 ) ( IN-CITY ?auto_149671 ?auto_149670 ) ( not ( = ?auto_149662 ?auto_149671 ) ) ( OBJ-AT ?auto_149664 ?auto_149671 ) ( TRUCK-AT ?auto_149667 ?auto_149662 ) ( not ( = ?auto_149664 ?auto_149666 ) ) ( not ( = ?auto_149668 ?auto_149671 ) ) ( not ( = ?auto_149664 ?auto_149663 ) ) ( not ( = ?auto_149666 ?auto_149663 ) ) ( not ( = ?auto_149672 ?auto_149668 ) ) ( not ( = ?auto_149672 ?auto_149671 ) ) ( not ( = ?auto_149664 ?auto_149665 ) ) ( not ( = ?auto_149666 ?auto_149665 ) ) ( not ( = ?auto_149663 ?auto_149665 ) ) ( not ( = ?auto_149669 ?auto_149672 ) ) ( not ( = ?auto_149669 ?auto_149668 ) ) ( not ( = ?auto_149669 ?auto_149671 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149664 ?auto_149666 ?auto_149665 ?auto_149663 ?auto_149662 )
      ( DELIVER-4PKG-VERIFY ?auto_149663 ?auto_149664 ?auto_149665 ?auto_149666 ?auto_149662 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149698 - OBJ
      ?auto_149699 - OBJ
      ?auto_149700 - OBJ
      ?auto_149701 - OBJ
      ?auto_149697 - LOCATION
    )
    :vars
    (
      ?auto_149704 - LOCATION
      ?auto_149705 - CITY
      ?auto_149707 - LOCATION
      ?auto_149703 - LOCATION
      ?auto_149706 - LOCATION
      ?auto_149702 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149704 ?auto_149705 ) ( IN-CITY ?auto_149697 ?auto_149705 ) ( not ( = ?auto_149697 ?auto_149704 ) ) ( OBJ-AT ?auto_149701 ?auto_149704 ) ( IN-CITY ?auto_149707 ?auto_149705 ) ( not ( = ?auto_149697 ?auto_149707 ) ) ( OBJ-AT ?auto_149698 ?auto_149707 ) ( IN-CITY ?auto_149703 ?auto_149705 ) ( not ( = ?auto_149697 ?auto_149703 ) ) ( OBJ-AT ?auto_149699 ?auto_149703 ) ( IN-CITY ?auto_149706 ?auto_149705 ) ( not ( = ?auto_149697 ?auto_149706 ) ) ( OBJ-AT ?auto_149700 ?auto_149706 ) ( TRUCK-AT ?auto_149702 ?auto_149697 ) ( not ( = ?auto_149700 ?auto_149699 ) ) ( not ( = ?auto_149703 ?auto_149706 ) ) ( not ( = ?auto_149700 ?auto_149698 ) ) ( not ( = ?auto_149699 ?auto_149698 ) ) ( not ( = ?auto_149707 ?auto_149703 ) ) ( not ( = ?auto_149707 ?auto_149706 ) ) ( not ( = ?auto_149700 ?auto_149701 ) ) ( not ( = ?auto_149699 ?auto_149701 ) ) ( not ( = ?auto_149698 ?auto_149701 ) ) ( not ( = ?auto_149704 ?auto_149707 ) ) ( not ( = ?auto_149704 ?auto_149703 ) ) ( not ( = ?auto_149704 ?auto_149706 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149700 ?auto_149699 ?auto_149701 ?auto_149698 ?auto_149697 )
      ( DELIVER-4PKG-VERIFY ?auto_149698 ?auto_149699 ?auto_149700 ?auto_149701 ?auto_149697 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149733 - OBJ
      ?auto_149734 - OBJ
      ?auto_149735 - OBJ
      ?auto_149736 - OBJ
      ?auto_149732 - LOCATION
    )
    :vars
    (
      ?auto_149739 - LOCATION
      ?auto_149740 - CITY
      ?auto_149742 - LOCATION
      ?auto_149738 - LOCATION
      ?auto_149741 - LOCATION
      ?auto_149737 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149739 ?auto_149740 ) ( IN-CITY ?auto_149732 ?auto_149740 ) ( not ( = ?auto_149732 ?auto_149739 ) ) ( OBJ-AT ?auto_149735 ?auto_149739 ) ( IN-CITY ?auto_149742 ?auto_149740 ) ( not ( = ?auto_149732 ?auto_149742 ) ) ( OBJ-AT ?auto_149733 ?auto_149742 ) ( IN-CITY ?auto_149738 ?auto_149740 ) ( not ( = ?auto_149732 ?auto_149738 ) ) ( OBJ-AT ?auto_149734 ?auto_149738 ) ( IN-CITY ?auto_149741 ?auto_149740 ) ( not ( = ?auto_149732 ?auto_149741 ) ) ( OBJ-AT ?auto_149736 ?auto_149741 ) ( TRUCK-AT ?auto_149737 ?auto_149732 ) ( not ( = ?auto_149736 ?auto_149734 ) ) ( not ( = ?auto_149738 ?auto_149741 ) ) ( not ( = ?auto_149736 ?auto_149733 ) ) ( not ( = ?auto_149734 ?auto_149733 ) ) ( not ( = ?auto_149742 ?auto_149738 ) ) ( not ( = ?auto_149742 ?auto_149741 ) ) ( not ( = ?auto_149736 ?auto_149735 ) ) ( not ( = ?auto_149734 ?auto_149735 ) ) ( not ( = ?auto_149733 ?auto_149735 ) ) ( not ( = ?auto_149739 ?auto_149742 ) ) ( not ( = ?auto_149739 ?auto_149738 ) ) ( not ( = ?auto_149739 ?auto_149741 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149736 ?auto_149734 ?auto_149735 ?auto_149733 ?auto_149732 )
      ( DELIVER-4PKG-VERIFY ?auto_149733 ?auto_149734 ?auto_149735 ?auto_149736 ?auto_149732 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149879 - OBJ
      ?auto_149880 - OBJ
      ?auto_149881 - OBJ
      ?auto_149882 - OBJ
      ?auto_149878 - LOCATION
    )
    :vars
    (
      ?auto_149885 - LOCATION
      ?auto_149886 - CITY
      ?auto_149888 - LOCATION
      ?auto_149884 - LOCATION
      ?auto_149887 - LOCATION
      ?auto_149883 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149885 ?auto_149886 ) ( IN-CITY ?auto_149878 ?auto_149886 ) ( not ( = ?auto_149878 ?auto_149885 ) ) ( OBJ-AT ?auto_149880 ?auto_149885 ) ( IN-CITY ?auto_149888 ?auto_149886 ) ( not ( = ?auto_149878 ?auto_149888 ) ) ( OBJ-AT ?auto_149879 ?auto_149888 ) ( IN-CITY ?auto_149884 ?auto_149886 ) ( not ( = ?auto_149878 ?auto_149884 ) ) ( OBJ-AT ?auto_149882 ?auto_149884 ) ( IN-CITY ?auto_149887 ?auto_149886 ) ( not ( = ?auto_149878 ?auto_149887 ) ) ( OBJ-AT ?auto_149881 ?auto_149887 ) ( TRUCK-AT ?auto_149883 ?auto_149878 ) ( not ( = ?auto_149881 ?auto_149882 ) ) ( not ( = ?auto_149884 ?auto_149887 ) ) ( not ( = ?auto_149881 ?auto_149879 ) ) ( not ( = ?auto_149882 ?auto_149879 ) ) ( not ( = ?auto_149888 ?auto_149884 ) ) ( not ( = ?auto_149888 ?auto_149887 ) ) ( not ( = ?auto_149881 ?auto_149880 ) ) ( not ( = ?auto_149882 ?auto_149880 ) ) ( not ( = ?auto_149879 ?auto_149880 ) ) ( not ( = ?auto_149885 ?auto_149888 ) ) ( not ( = ?auto_149885 ?auto_149884 ) ) ( not ( = ?auto_149885 ?auto_149887 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149881 ?auto_149882 ?auto_149880 ?auto_149879 ?auto_149878 )
      ( DELIVER-4PKG-VERIFY ?auto_149879 ?auto_149880 ?auto_149881 ?auto_149882 ?auto_149878 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149914 - OBJ
      ?auto_149915 - OBJ
      ?auto_149916 - OBJ
      ?auto_149917 - OBJ
      ?auto_149913 - LOCATION
    )
    :vars
    (
      ?auto_149920 - LOCATION
      ?auto_149921 - CITY
      ?auto_149923 - LOCATION
      ?auto_149919 - LOCATION
      ?auto_149922 - LOCATION
      ?auto_149918 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149920 ?auto_149921 ) ( IN-CITY ?auto_149913 ?auto_149921 ) ( not ( = ?auto_149913 ?auto_149920 ) ) ( OBJ-AT ?auto_149915 ?auto_149920 ) ( IN-CITY ?auto_149923 ?auto_149921 ) ( not ( = ?auto_149913 ?auto_149923 ) ) ( OBJ-AT ?auto_149914 ?auto_149923 ) ( IN-CITY ?auto_149919 ?auto_149921 ) ( not ( = ?auto_149913 ?auto_149919 ) ) ( OBJ-AT ?auto_149916 ?auto_149919 ) ( IN-CITY ?auto_149922 ?auto_149921 ) ( not ( = ?auto_149913 ?auto_149922 ) ) ( OBJ-AT ?auto_149917 ?auto_149922 ) ( TRUCK-AT ?auto_149918 ?auto_149913 ) ( not ( = ?auto_149917 ?auto_149916 ) ) ( not ( = ?auto_149919 ?auto_149922 ) ) ( not ( = ?auto_149917 ?auto_149914 ) ) ( not ( = ?auto_149916 ?auto_149914 ) ) ( not ( = ?auto_149923 ?auto_149919 ) ) ( not ( = ?auto_149923 ?auto_149922 ) ) ( not ( = ?auto_149917 ?auto_149915 ) ) ( not ( = ?auto_149916 ?auto_149915 ) ) ( not ( = ?auto_149914 ?auto_149915 ) ) ( not ( = ?auto_149920 ?auto_149923 ) ) ( not ( = ?auto_149920 ?auto_149919 ) ) ( not ( = ?auto_149920 ?auto_149922 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149917 ?auto_149916 ?auto_149915 ?auto_149914 ?auto_149913 )
      ( DELIVER-4PKG-VERIFY ?auto_149914 ?auto_149915 ?auto_149916 ?auto_149917 ?auto_149913 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_150135 - OBJ
      ?auto_150136 - OBJ
      ?auto_150137 - OBJ
      ?auto_150138 - OBJ
      ?auto_150134 - LOCATION
    )
    :vars
    (
      ?auto_150141 - LOCATION
      ?auto_150142 - CITY
      ?auto_150144 - LOCATION
      ?auto_150140 - LOCATION
      ?auto_150143 - LOCATION
      ?auto_150139 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150141 ?auto_150142 ) ( IN-CITY ?auto_150134 ?auto_150142 ) ( not ( = ?auto_150134 ?auto_150141 ) ) ( OBJ-AT ?auto_150135 ?auto_150141 ) ( IN-CITY ?auto_150144 ?auto_150142 ) ( not ( = ?auto_150134 ?auto_150144 ) ) ( OBJ-AT ?auto_150138 ?auto_150144 ) ( IN-CITY ?auto_150140 ?auto_150142 ) ( not ( = ?auto_150134 ?auto_150140 ) ) ( OBJ-AT ?auto_150137 ?auto_150140 ) ( IN-CITY ?auto_150143 ?auto_150142 ) ( not ( = ?auto_150134 ?auto_150143 ) ) ( OBJ-AT ?auto_150136 ?auto_150143 ) ( TRUCK-AT ?auto_150139 ?auto_150134 ) ( not ( = ?auto_150136 ?auto_150137 ) ) ( not ( = ?auto_150140 ?auto_150143 ) ) ( not ( = ?auto_150136 ?auto_150138 ) ) ( not ( = ?auto_150137 ?auto_150138 ) ) ( not ( = ?auto_150144 ?auto_150140 ) ) ( not ( = ?auto_150144 ?auto_150143 ) ) ( not ( = ?auto_150136 ?auto_150135 ) ) ( not ( = ?auto_150137 ?auto_150135 ) ) ( not ( = ?auto_150138 ?auto_150135 ) ) ( not ( = ?auto_150141 ?auto_150144 ) ) ( not ( = ?auto_150141 ?auto_150140 ) ) ( not ( = ?auto_150141 ?auto_150143 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_150136 ?auto_150137 ?auto_150135 ?auto_150138 ?auto_150134 )
      ( DELIVER-4PKG-VERIFY ?auto_150135 ?auto_150136 ?auto_150137 ?auto_150138 ?auto_150134 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_150170 - OBJ
      ?auto_150171 - OBJ
      ?auto_150172 - OBJ
      ?auto_150173 - OBJ
      ?auto_150169 - LOCATION
    )
    :vars
    (
      ?auto_150176 - LOCATION
      ?auto_150177 - CITY
      ?auto_150179 - LOCATION
      ?auto_150175 - LOCATION
      ?auto_150178 - LOCATION
      ?auto_150174 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150176 ?auto_150177 ) ( IN-CITY ?auto_150169 ?auto_150177 ) ( not ( = ?auto_150169 ?auto_150176 ) ) ( OBJ-AT ?auto_150170 ?auto_150176 ) ( IN-CITY ?auto_150179 ?auto_150177 ) ( not ( = ?auto_150169 ?auto_150179 ) ) ( OBJ-AT ?auto_150172 ?auto_150179 ) ( IN-CITY ?auto_150175 ?auto_150177 ) ( not ( = ?auto_150169 ?auto_150175 ) ) ( OBJ-AT ?auto_150173 ?auto_150175 ) ( IN-CITY ?auto_150178 ?auto_150177 ) ( not ( = ?auto_150169 ?auto_150178 ) ) ( OBJ-AT ?auto_150171 ?auto_150178 ) ( TRUCK-AT ?auto_150174 ?auto_150169 ) ( not ( = ?auto_150171 ?auto_150173 ) ) ( not ( = ?auto_150175 ?auto_150178 ) ) ( not ( = ?auto_150171 ?auto_150172 ) ) ( not ( = ?auto_150173 ?auto_150172 ) ) ( not ( = ?auto_150179 ?auto_150175 ) ) ( not ( = ?auto_150179 ?auto_150178 ) ) ( not ( = ?auto_150171 ?auto_150170 ) ) ( not ( = ?auto_150173 ?auto_150170 ) ) ( not ( = ?auto_150172 ?auto_150170 ) ) ( not ( = ?auto_150176 ?auto_150179 ) ) ( not ( = ?auto_150176 ?auto_150175 ) ) ( not ( = ?auto_150176 ?auto_150178 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_150171 ?auto_150173 ?auto_150170 ?auto_150172 ?auto_150169 )
      ( DELIVER-4PKG-VERIFY ?auto_150170 ?auto_150171 ?auto_150172 ?auto_150173 ?auto_150169 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_150279 - OBJ
      ?auto_150280 - OBJ
      ?auto_150281 - OBJ
      ?auto_150282 - OBJ
      ?auto_150278 - LOCATION
    )
    :vars
    (
      ?auto_150285 - LOCATION
      ?auto_150286 - CITY
      ?auto_150288 - LOCATION
      ?auto_150284 - LOCATION
      ?auto_150287 - LOCATION
      ?auto_150283 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150285 ?auto_150286 ) ( IN-CITY ?auto_150278 ?auto_150286 ) ( not ( = ?auto_150278 ?auto_150285 ) ) ( OBJ-AT ?auto_150279 ?auto_150285 ) ( IN-CITY ?auto_150288 ?auto_150286 ) ( not ( = ?auto_150278 ?auto_150288 ) ) ( OBJ-AT ?auto_150282 ?auto_150288 ) ( IN-CITY ?auto_150284 ?auto_150286 ) ( not ( = ?auto_150278 ?auto_150284 ) ) ( OBJ-AT ?auto_150280 ?auto_150284 ) ( IN-CITY ?auto_150287 ?auto_150286 ) ( not ( = ?auto_150278 ?auto_150287 ) ) ( OBJ-AT ?auto_150281 ?auto_150287 ) ( TRUCK-AT ?auto_150283 ?auto_150278 ) ( not ( = ?auto_150281 ?auto_150280 ) ) ( not ( = ?auto_150284 ?auto_150287 ) ) ( not ( = ?auto_150281 ?auto_150282 ) ) ( not ( = ?auto_150280 ?auto_150282 ) ) ( not ( = ?auto_150288 ?auto_150284 ) ) ( not ( = ?auto_150288 ?auto_150287 ) ) ( not ( = ?auto_150281 ?auto_150279 ) ) ( not ( = ?auto_150280 ?auto_150279 ) ) ( not ( = ?auto_150282 ?auto_150279 ) ) ( not ( = ?auto_150285 ?auto_150288 ) ) ( not ( = ?auto_150285 ?auto_150284 ) ) ( not ( = ?auto_150285 ?auto_150287 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_150281 ?auto_150280 ?auto_150279 ?auto_150282 ?auto_150278 )
      ( DELIVER-4PKG-VERIFY ?auto_150279 ?auto_150280 ?auto_150281 ?auto_150282 ?auto_150278 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_150352 - OBJ
      ?auto_150353 - OBJ
      ?auto_150354 - OBJ
      ?auto_150355 - OBJ
      ?auto_150351 - LOCATION
    )
    :vars
    (
      ?auto_150358 - LOCATION
      ?auto_150359 - CITY
      ?auto_150361 - LOCATION
      ?auto_150357 - LOCATION
      ?auto_150360 - LOCATION
      ?auto_150356 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150358 ?auto_150359 ) ( IN-CITY ?auto_150351 ?auto_150359 ) ( not ( = ?auto_150351 ?auto_150358 ) ) ( OBJ-AT ?auto_150352 ?auto_150358 ) ( IN-CITY ?auto_150361 ?auto_150359 ) ( not ( = ?auto_150351 ?auto_150361 ) ) ( OBJ-AT ?auto_150354 ?auto_150361 ) ( IN-CITY ?auto_150357 ?auto_150359 ) ( not ( = ?auto_150351 ?auto_150357 ) ) ( OBJ-AT ?auto_150353 ?auto_150357 ) ( IN-CITY ?auto_150360 ?auto_150359 ) ( not ( = ?auto_150351 ?auto_150360 ) ) ( OBJ-AT ?auto_150355 ?auto_150360 ) ( TRUCK-AT ?auto_150356 ?auto_150351 ) ( not ( = ?auto_150355 ?auto_150353 ) ) ( not ( = ?auto_150357 ?auto_150360 ) ) ( not ( = ?auto_150355 ?auto_150354 ) ) ( not ( = ?auto_150353 ?auto_150354 ) ) ( not ( = ?auto_150361 ?auto_150357 ) ) ( not ( = ?auto_150361 ?auto_150360 ) ) ( not ( = ?auto_150355 ?auto_150352 ) ) ( not ( = ?auto_150353 ?auto_150352 ) ) ( not ( = ?auto_150354 ?auto_150352 ) ) ( not ( = ?auto_150358 ?auto_150361 ) ) ( not ( = ?auto_150358 ?auto_150357 ) ) ( not ( = ?auto_150358 ?auto_150360 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_150355 ?auto_150353 ?auto_150352 ?auto_150354 ?auto_150351 )
      ( DELIVER-4PKG-VERIFY ?auto_150352 ?auto_150353 ?auto_150354 ?auto_150355 ?auto_150351 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_150461 - OBJ
      ?auto_150462 - OBJ
      ?auto_150463 - OBJ
      ?auto_150464 - OBJ
      ?auto_150460 - LOCATION
    )
    :vars
    (
      ?auto_150467 - LOCATION
      ?auto_150468 - CITY
      ?auto_150470 - LOCATION
      ?auto_150466 - LOCATION
      ?auto_150469 - LOCATION
      ?auto_150465 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150467 ?auto_150468 ) ( IN-CITY ?auto_150460 ?auto_150468 ) ( not ( = ?auto_150460 ?auto_150467 ) ) ( OBJ-AT ?auto_150461 ?auto_150467 ) ( IN-CITY ?auto_150470 ?auto_150468 ) ( not ( = ?auto_150460 ?auto_150470 ) ) ( OBJ-AT ?auto_150462 ?auto_150470 ) ( IN-CITY ?auto_150466 ?auto_150468 ) ( not ( = ?auto_150460 ?auto_150466 ) ) ( OBJ-AT ?auto_150464 ?auto_150466 ) ( IN-CITY ?auto_150469 ?auto_150468 ) ( not ( = ?auto_150460 ?auto_150469 ) ) ( OBJ-AT ?auto_150463 ?auto_150469 ) ( TRUCK-AT ?auto_150465 ?auto_150460 ) ( not ( = ?auto_150463 ?auto_150464 ) ) ( not ( = ?auto_150466 ?auto_150469 ) ) ( not ( = ?auto_150463 ?auto_150462 ) ) ( not ( = ?auto_150464 ?auto_150462 ) ) ( not ( = ?auto_150470 ?auto_150466 ) ) ( not ( = ?auto_150470 ?auto_150469 ) ) ( not ( = ?auto_150463 ?auto_150461 ) ) ( not ( = ?auto_150464 ?auto_150461 ) ) ( not ( = ?auto_150462 ?auto_150461 ) ) ( not ( = ?auto_150467 ?auto_150470 ) ) ( not ( = ?auto_150467 ?auto_150466 ) ) ( not ( = ?auto_150467 ?auto_150469 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_150463 ?auto_150464 ?auto_150461 ?auto_150462 ?auto_150460 )
      ( DELIVER-4PKG-VERIFY ?auto_150461 ?auto_150462 ?auto_150463 ?auto_150464 ?auto_150460 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_150496 - OBJ
      ?auto_150497 - OBJ
      ?auto_150498 - OBJ
      ?auto_150499 - OBJ
      ?auto_150495 - LOCATION
    )
    :vars
    (
      ?auto_150502 - LOCATION
      ?auto_150503 - CITY
      ?auto_150505 - LOCATION
      ?auto_150501 - LOCATION
      ?auto_150504 - LOCATION
      ?auto_150500 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150502 ?auto_150503 ) ( IN-CITY ?auto_150495 ?auto_150503 ) ( not ( = ?auto_150495 ?auto_150502 ) ) ( OBJ-AT ?auto_150496 ?auto_150502 ) ( IN-CITY ?auto_150505 ?auto_150503 ) ( not ( = ?auto_150495 ?auto_150505 ) ) ( OBJ-AT ?auto_150497 ?auto_150505 ) ( IN-CITY ?auto_150501 ?auto_150503 ) ( not ( = ?auto_150495 ?auto_150501 ) ) ( OBJ-AT ?auto_150498 ?auto_150501 ) ( IN-CITY ?auto_150504 ?auto_150503 ) ( not ( = ?auto_150495 ?auto_150504 ) ) ( OBJ-AT ?auto_150499 ?auto_150504 ) ( TRUCK-AT ?auto_150500 ?auto_150495 ) ( not ( = ?auto_150499 ?auto_150498 ) ) ( not ( = ?auto_150501 ?auto_150504 ) ) ( not ( = ?auto_150499 ?auto_150497 ) ) ( not ( = ?auto_150498 ?auto_150497 ) ) ( not ( = ?auto_150505 ?auto_150501 ) ) ( not ( = ?auto_150505 ?auto_150504 ) ) ( not ( = ?auto_150499 ?auto_150496 ) ) ( not ( = ?auto_150498 ?auto_150496 ) ) ( not ( = ?auto_150497 ?auto_150496 ) ) ( not ( = ?auto_150502 ?auto_150505 ) ) ( not ( = ?auto_150502 ?auto_150501 ) ) ( not ( = ?auto_150502 ?auto_150504 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_150499 ?auto_150498 ?auto_150496 ?auto_150497 ?auto_150495 )
      ( DELIVER-4PKG-VERIFY ?auto_150496 ?auto_150497 ?auto_150498 ?auto_150499 ?auto_150495 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_150848 - OBJ
      ?auto_150847 - LOCATION
    )
    :vars
    (
      ?auto_150850 - LOCATION
      ?auto_150851 - CITY
      ?auto_150849 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150850 ?auto_150851 ) ( IN-CITY ?auto_150847 ?auto_150851 ) ( not ( = ?auto_150847 ?auto_150850 ) ) ( OBJ-AT ?auto_150848 ?auto_150850 ) ( TRUCK-AT ?auto_150849 ?auto_150847 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_150849 ?auto_150847 ?auto_150850 ?auto_150851 )
      ( !LOAD-TRUCK ?auto_150848 ?auto_150849 ?auto_150850 )
      ( !DRIVE-TRUCK ?auto_150849 ?auto_150850 ?auto_150847 ?auto_150851 )
      ( !UNLOAD-TRUCK ?auto_150848 ?auto_150849 ?auto_150847 )
      ( DELIVER-1PKG-VERIFY ?auto_150848 ?auto_150847 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164585 - OBJ
      ?auto_164586 - OBJ
      ?auto_164587 - OBJ
      ?auto_164588 - OBJ
      ?auto_164589 - OBJ
      ?auto_164584 - LOCATION
    )
    :vars
    (
      ?auto_164590 - LOCATION
      ?auto_164591 - CITY
      ?auto_164593 - LOCATION
      ?auto_164595 - LOCATION
      ?auto_164594 - LOCATION
      ?auto_164592 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164590 ?auto_164591 ) ( IN-CITY ?auto_164584 ?auto_164591 ) ( not ( = ?auto_164584 ?auto_164590 ) ) ( OBJ-AT ?auto_164589 ?auto_164590 ) ( IN-CITY ?auto_164593 ?auto_164591 ) ( not ( = ?auto_164584 ?auto_164593 ) ) ( OBJ-AT ?auto_164588 ?auto_164593 ) ( IN-CITY ?auto_164595 ?auto_164591 ) ( not ( = ?auto_164584 ?auto_164595 ) ) ( OBJ-AT ?auto_164587 ?auto_164595 ) ( OBJ-AT ?auto_164586 ?auto_164590 ) ( IN-CITY ?auto_164594 ?auto_164591 ) ( not ( = ?auto_164584 ?auto_164594 ) ) ( OBJ-AT ?auto_164585 ?auto_164594 ) ( TRUCK-AT ?auto_164592 ?auto_164584 ) ( not ( = ?auto_164585 ?auto_164586 ) ) ( not ( = ?auto_164590 ?auto_164594 ) ) ( not ( = ?auto_164585 ?auto_164587 ) ) ( not ( = ?auto_164586 ?auto_164587 ) ) ( not ( = ?auto_164595 ?auto_164590 ) ) ( not ( = ?auto_164595 ?auto_164594 ) ) ( not ( = ?auto_164585 ?auto_164588 ) ) ( not ( = ?auto_164586 ?auto_164588 ) ) ( not ( = ?auto_164587 ?auto_164588 ) ) ( not ( = ?auto_164593 ?auto_164595 ) ) ( not ( = ?auto_164593 ?auto_164590 ) ) ( not ( = ?auto_164593 ?auto_164594 ) ) ( not ( = ?auto_164585 ?auto_164589 ) ) ( not ( = ?auto_164586 ?auto_164589 ) ) ( not ( = ?auto_164587 ?auto_164589 ) ) ( not ( = ?auto_164588 ?auto_164589 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_164585 ?auto_164586 ?auto_164588 ?auto_164587 ?auto_164584 )
      ( DELIVER-1PKG ?auto_164589 ?auto_164584 )
      ( DELIVER-5PKG-VERIFY ?auto_164585 ?auto_164586 ?auto_164587 ?auto_164588 ?auto_164589 ?auto_164584 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164636 - OBJ
      ?auto_164637 - OBJ
      ?auto_164638 - OBJ
      ?auto_164639 - OBJ
      ?auto_164640 - OBJ
      ?auto_164635 - LOCATION
    )
    :vars
    (
      ?auto_164646 - LOCATION
      ?auto_164642 - CITY
      ?auto_164643 - LOCATION
      ?auto_164644 - LOCATION
      ?auto_164645 - LOCATION
      ?auto_164641 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164646 ?auto_164642 ) ( IN-CITY ?auto_164635 ?auto_164642 ) ( not ( = ?auto_164635 ?auto_164646 ) ) ( OBJ-AT ?auto_164639 ?auto_164646 ) ( IN-CITY ?auto_164643 ?auto_164642 ) ( not ( = ?auto_164635 ?auto_164643 ) ) ( OBJ-AT ?auto_164640 ?auto_164643 ) ( IN-CITY ?auto_164644 ?auto_164642 ) ( not ( = ?auto_164635 ?auto_164644 ) ) ( OBJ-AT ?auto_164638 ?auto_164644 ) ( OBJ-AT ?auto_164637 ?auto_164646 ) ( IN-CITY ?auto_164645 ?auto_164642 ) ( not ( = ?auto_164635 ?auto_164645 ) ) ( OBJ-AT ?auto_164636 ?auto_164645 ) ( TRUCK-AT ?auto_164641 ?auto_164635 ) ( not ( = ?auto_164636 ?auto_164637 ) ) ( not ( = ?auto_164646 ?auto_164645 ) ) ( not ( = ?auto_164636 ?auto_164638 ) ) ( not ( = ?auto_164637 ?auto_164638 ) ) ( not ( = ?auto_164644 ?auto_164646 ) ) ( not ( = ?auto_164644 ?auto_164645 ) ) ( not ( = ?auto_164636 ?auto_164640 ) ) ( not ( = ?auto_164637 ?auto_164640 ) ) ( not ( = ?auto_164638 ?auto_164640 ) ) ( not ( = ?auto_164643 ?auto_164644 ) ) ( not ( = ?auto_164643 ?auto_164646 ) ) ( not ( = ?auto_164643 ?auto_164645 ) ) ( not ( = ?auto_164636 ?auto_164639 ) ) ( not ( = ?auto_164637 ?auto_164639 ) ) ( not ( = ?auto_164638 ?auto_164639 ) ) ( not ( = ?auto_164640 ?auto_164639 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164636 ?auto_164637 ?auto_164638 ?auto_164640 ?auto_164639 ?auto_164635 )
      ( DELIVER-5PKG-VERIFY ?auto_164636 ?auto_164637 ?auto_164638 ?auto_164639 ?auto_164640 ?auto_164635 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164687 - OBJ
      ?auto_164688 - OBJ
      ?auto_164689 - OBJ
      ?auto_164690 - OBJ
      ?auto_164691 - OBJ
      ?auto_164686 - LOCATION
    )
    :vars
    (
      ?auto_164692 - LOCATION
      ?auto_164693 - CITY
      ?auto_164697 - LOCATION
      ?auto_164694 - LOCATION
      ?auto_164695 - LOCATION
      ?auto_164696 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164692 ?auto_164693 ) ( IN-CITY ?auto_164686 ?auto_164693 ) ( not ( = ?auto_164686 ?auto_164692 ) ) ( OBJ-AT ?auto_164691 ?auto_164692 ) ( IN-CITY ?auto_164697 ?auto_164693 ) ( not ( = ?auto_164686 ?auto_164697 ) ) ( OBJ-AT ?auto_164689 ?auto_164697 ) ( IN-CITY ?auto_164694 ?auto_164693 ) ( not ( = ?auto_164686 ?auto_164694 ) ) ( OBJ-AT ?auto_164690 ?auto_164694 ) ( OBJ-AT ?auto_164688 ?auto_164692 ) ( IN-CITY ?auto_164695 ?auto_164693 ) ( not ( = ?auto_164686 ?auto_164695 ) ) ( OBJ-AT ?auto_164687 ?auto_164695 ) ( TRUCK-AT ?auto_164696 ?auto_164686 ) ( not ( = ?auto_164687 ?auto_164688 ) ) ( not ( = ?auto_164692 ?auto_164695 ) ) ( not ( = ?auto_164687 ?auto_164690 ) ) ( not ( = ?auto_164688 ?auto_164690 ) ) ( not ( = ?auto_164694 ?auto_164692 ) ) ( not ( = ?auto_164694 ?auto_164695 ) ) ( not ( = ?auto_164687 ?auto_164689 ) ) ( not ( = ?auto_164688 ?auto_164689 ) ) ( not ( = ?auto_164690 ?auto_164689 ) ) ( not ( = ?auto_164697 ?auto_164694 ) ) ( not ( = ?auto_164697 ?auto_164692 ) ) ( not ( = ?auto_164697 ?auto_164695 ) ) ( not ( = ?auto_164687 ?auto_164691 ) ) ( not ( = ?auto_164688 ?auto_164691 ) ) ( not ( = ?auto_164690 ?auto_164691 ) ) ( not ( = ?auto_164689 ?auto_164691 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164687 ?auto_164688 ?auto_164690 ?auto_164691 ?auto_164689 ?auto_164686 )
      ( DELIVER-5PKG-VERIFY ?auto_164687 ?auto_164688 ?auto_164689 ?auto_164690 ?auto_164691 ?auto_164686 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164738 - OBJ
      ?auto_164739 - OBJ
      ?auto_164740 - OBJ
      ?auto_164741 - OBJ
      ?auto_164742 - OBJ
      ?auto_164737 - LOCATION
    )
    :vars
    (
      ?auto_164743 - LOCATION
      ?auto_164744 - CITY
      ?auto_164748 - LOCATION
      ?auto_164745 - LOCATION
      ?auto_164746 - LOCATION
      ?auto_164747 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164743 ?auto_164744 ) ( IN-CITY ?auto_164737 ?auto_164744 ) ( not ( = ?auto_164737 ?auto_164743 ) ) ( OBJ-AT ?auto_164741 ?auto_164743 ) ( IN-CITY ?auto_164748 ?auto_164744 ) ( not ( = ?auto_164737 ?auto_164748 ) ) ( OBJ-AT ?auto_164740 ?auto_164748 ) ( IN-CITY ?auto_164745 ?auto_164744 ) ( not ( = ?auto_164737 ?auto_164745 ) ) ( OBJ-AT ?auto_164742 ?auto_164745 ) ( OBJ-AT ?auto_164739 ?auto_164743 ) ( IN-CITY ?auto_164746 ?auto_164744 ) ( not ( = ?auto_164737 ?auto_164746 ) ) ( OBJ-AT ?auto_164738 ?auto_164746 ) ( TRUCK-AT ?auto_164747 ?auto_164737 ) ( not ( = ?auto_164738 ?auto_164739 ) ) ( not ( = ?auto_164743 ?auto_164746 ) ) ( not ( = ?auto_164738 ?auto_164742 ) ) ( not ( = ?auto_164739 ?auto_164742 ) ) ( not ( = ?auto_164745 ?auto_164743 ) ) ( not ( = ?auto_164745 ?auto_164746 ) ) ( not ( = ?auto_164738 ?auto_164740 ) ) ( not ( = ?auto_164739 ?auto_164740 ) ) ( not ( = ?auto_164742 ?auto_164740 ) ) ( not ( = ?auto_164748 ?auto_164745 ) ) ( not ( = ?auto_164748 ?auto_164743 ) ) ( not ( = ?auto_164748 ?auto_164746 ) ) ( not ( = ?auto_164738 ?auto_164741 ) ) ( not ( = ?auto_164739 ?auto_164741 ) ) ( not ( = ?auto_164742 ?auto_164741 ) ) ( not ( = ?auto_164740 ?auto_164741 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164738 ?auto_164739 ?auto_164742 ?auto_164741 ?auto_164740 ?auto_164737 )
      ( DELIVER-5PKG-VERIFY ?auto_164738 ?auto_164739 ?auto_164740 ?auto_164741 ?auto_164742 ?auto_164737 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164951 - OBJ
      ?auto_164952 - OBJ
      ?auto_164953 - OBJ
      ?auto_164954 - OBJ
      ?auto_164955 - OBJ
      ?auto_164950 - LOCATION
    )
    :vars
    (
      ?auto_164956 - LOCATION
      ?auto_164957 - CITY
      ?auto_164961 - LOCATION
      ?auto_164958 - LOCATION
      ?auto_164959 - LOCATION
      ?auto_164960 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164956 ?auto_164957 ) ( IN-CITY ?auto_164950 ?auto_164957 ) ( not ( = ?auto_164950 ?auto_164956 ) ) ( OBJ-AT ?auto_164953 ?auto_164956 ) ( IN-CITY ?auto_164961 ?auto_164957 ) ( not ( = ?auto_164950 ?auto_164961 ) ) ( OBJ-AT ?auto_164955 ?auto_164961 ) ( IN-CITY ?auto_164958 ?auto_164957 ) ( not ( = ?auto_164950 ?auto_164958 ) ) ( OBJ-AT ?auto_164954 ?auto_164958 ) ( OBJ-AT ?auto_164952 ?auto_164956 ) ( IN-CITY ?auto_164959 ?auto_164957 ) ( not ( = ?auto_164950 ?auto_164959 ) ) ( OBJ-AT ?auto_164951 ?auto_164959 ) ( TRUCK-AT ?auto_164960 ?auto_164950 ) ( not ( = ?auto_164951 ?auto_164952 ) ) ( not ( = ?auto_164956 ?auto_164959 ) ) ( not ( = ?auto_164951 ?auto_164954 ) ) ( not ( = ?auto_164952 ?auto_164954 ) ) ( not ( = ?auto_164958 ?auto_164956 ) ) ( not ( = ?auto_164958 ?auto_164959 ) ) ( not ( = ?auto_164951 ?auto_164955 ) ) ( not ( = ?auto_164952 ?auto_164955 ) ) ( not ( = ?auto_164954 ?auto_164955 ) ) ( not ( = ?auto_164961 ?auto_164958 ) ) ( not ( = ?auto_164961 ?auto_164956 ) ) ( not ( = ?auto_164961 ?auto_164959 ) ) ( not ( = ?auto_164951 ?auto_164953 ) ) ( not ( = ?auto_164952 ?auto_164953 ) ) ( not ( = ?auto_164954 ?auto_164953 ) ) ( not ( = ?auto_164955 ?auto_164953 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164951 ?auto_164952 ?auto_164954 ?auto_164953 ?auto_164955 ?auto_164950 )
      ( DELIVER-5PKG-VERIFY ?auto_164951 ?auto_164952 ?auto_164953 ?auto_164954 ?auto_164955 ?auto_164950 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165002 - OBJ
      ?auto_165003 - OBJ
      ?auto_165004 - OBJ
      ?auto_165005 - OBJ
      ?auto_165006 - OBJ
      ?auto_165001 - LOCATION
    )
    :vars
    (
      ?auto_165007 - LOCATION
      ?auto_165008 - CITY
      ?auto_165012 - LOCATION
      ?auto_165009 - LOCATION
      ?auto_165010 - LOCATION
      ?auto_165011 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165007 ?auto_165008 ) ( IN-CITY ?auto_165001 ?auto_165008 ) ( not ( = ?auto_165001 ?auto_165007 ) ) ( OBJ-AT ?auto_165004 ?auto_165007 ) ( IN-CITY ?auto_165012 ?auto_165008 ) ( not ( = ?auto_165001 ?auto_165012 ) ) ( OBJ-AT ?auto_165005 ?auto_165012 ) ( IN-CITY ?auto_165009 ?auto_165008 ) ( not ( = ?auto_165001 ?auto_165009 ) ) ( OBJ-AT ?auto_165006 ?auto_165009 ) ( OBJ-AT ?auto_165003 ?auto_165007 ) ( IN-CITY ?auto_165010 ?auto_165008 ) ( not ( = ?auto_165001 ?auto_165010 ) ) ( OBJ-AT ?auto_165002 ?auto_165010 ) ( TRUCK-AT ?auto_165011 ?auto_165001 ) ( not ( = ?auto_165002 ?auto_165003 ) ) ( not ( = ?auto_165007 ?auto_165010 ) ) ( not ( = ?auto_165002 ?auto_165006 ) ) ( not ( = ?auto_165003 ?auto_165006 ) ) ( not ( = ?auto_165009 ?auto_165007 ) ) ( not ( = ?auto_165009 ?auto_165010 ) ) ( not ( = ?auto_165002 ?auto_165005 ) ) ( not ( = ?auto_165003 ?auto_165005 ) ) ( not ( = ?auto_165006 ?auto_165005 ) ) ( not ( = ?auto_165012 ?auto_165009 ) ) ( not ( = ?auto_165012 ?auto_165007 ) ) ( not ( = ?auto_165012 ?auto_165010 ) ) ( not ( = ?auto_165002 ?auto_165004 ) ) ( not ( = ?auto_165003 ?auto_165004 ) ) ( not ( = ?auto_165006 ?auto_165004 ) ) ( not ( = ?auto_165005 ?auto_165004 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165002 ?auto_165003 ?auto_165006 ?auto_165004 ?auto_165005 ?auto_165001 )
      ( DELIVER-5PKG-VERIFY ?auto_165002 ?auto_165003 ?auto_165004 ?auto_165005 ?auto_165006 ?auto_165001 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165269 - OBJ
      ?auto_165270 - OBJ
      ?auto_165271 - OBJ
      ?auto_165272 - OBJ
      ?auto_165273 - OBJ
      ?auto_165268 - LOCATION
    )
    :vars
    (
      ?auto_165274 - LOCATION
      ?auto_165275 - CITY
      ?auto_165279 - LOCATION
      ?auto_165276 - LOCATION
      ?auto_165277 - LOCATION
      ?auto_165278 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165274 ?auto_165275 ) ( IN-CITY ?auto_165268 ?auto_165275 ) ( not ( = ?auto_165268 ?auto_165274 ) ) ( OBJ-AT ?auto_165273 ?auto_165274 ) ( IN-CITY ?auto_165279 ?auto_165275 ) ( not ( = ?auto_165268 ?auto_165279 ) ) ( OBJ-AT ?auto_165272 ?auto_165279 ) ( IN-CITY ?auto_165276 ?auto_165275 ) ( not ( = ?auto_165268 ?auto_165276 ) ) ( OBJ-AT ?auto_165270 ?auto_165276 ) ( OBJ-AT ?auto_165271 ?auto_165274 ) ( IN-CITY ?auto_165277 ?auto_165275 ) ( not ( = ?auto_165268 ?auto_165277 ) ) ( OBJ-AT ?auto_165269 ?auto_165277 ) ( TRUCK-AT ?auto_165278 ?auto_165268 ) ( not ( = ?auto_165269 ?auto_165271 ) ) ( not ( = ?auto_165274 ?auto_165277 ) ) ( not ( = ?auto_165269 ?auto_165270 ) ) ( not ( = ?auto_165271 ?auto_165270 ) ) ( not ( = ?auto_165276 ?auto_165274 ) ) ( not ( = ?auto_165276 ?auto_165277 ) ) ( not ( = ?auto_165269 ?auto_165272 ) ) ( not ( = ?auto_165271 ?auto_165272 ) ) ( not ( = ?auto_165270 ?auto_165272 ) ) ( not ( = ?auto_165279 ?auto_165276 ) ) ( not ( = ?auto_165279 ?auto_165274 ) ) ( not ( = ?auto_165279 ?auto_165277 ) ) ( not ( = ?auto_165269 ?auto_165273 ) ) ( not ( = ?auto_165271 ?auto_165273 ) ) ( not ( = ?auto_165270 ?auto_165273 ) ) ( not ( = ?auto_165272 ?auto_165273 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165269 ?auto_165271 ?auto_165270 ?auto_165273 ?auto_165272 ?auto_165268 )
      ( DELIVER-5PKG-VERIFY ?auto_165269 ?auto_165270 ?auto_165271 ?auto_165272 ?auto_165273 ?auto_165268 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165320 - OBJ
      ?auto_165321 - OBJ
      ?auto_165322 - OBJ
      ?auto_165323 - OBJ
      ?auto_165324 - OBJ
      ?auto_165319 - LOCATION
    )
    :vars
    (
      ?auto_165325 - LOCATION
      ?auto_165326 - CITY
      ?auto_165330 - LOCATION
      ?auto_165327 - LOCATION
      ?auto_165328 - LOCATION
      ?auto_165329 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165325 ?auto_165326 ) ( IN-CITY ?auto_165319 ?auto_165326 ) ( not ( = ?auto_165319 ?auto_165325 ) ) ( OBJ-AT ?auto_165323 ?auto_165325 ) ( IN-CITY ?auto_165330 ?auto_165326 ) ( not ( = ?auto_165319 ?auto_165330 ) ) ( OBJ-AT ?auto_165324 ?auto_165330 ) ( IN-CITY ?auto_165327 ?auto_165326 ) ( not ( = ?auto_165319 ?auto_165327 ) ) ( OBJ-AT ?auto_165321 ?auto_165327 ) ( OBJ-AT ?auto_165322 ?auto_165325 ) ( IN-CITY ?auto_165328 ?auto_165326 ) ( not ( = ?auto_165319 ?auto_165328 ) ) ( OBJ-AT ?auto_165320 ?auto_165328 ) ( TRUCK-AT ?auto_165329 ?auto_165319 ) ( not ( = ?auto_165320 ?auto_165322 ) ) ( not ( = ?auto_165325 ?auto_165328 ) ) ( not ( = ?auto_165320 ?auto_165321 ) ) ( not ( = ?auto_165322 ?auto_165321 ) ) ( not ( = ?auto_165327 ?auto_165325 ) ) ( not ( = ?auto_165327 ?auto_165328 ) ) ( not ( = ?auto_165320 ?auto_165324 ) ) ( not ( = ?auto_165322 ?auto_165324 ) ) ( not ( = ?auto_165321 ?auto_165324 ) ) ( not ( = ?auto_165330 ?auto_165327 ) ) ( not ( = ?auto_165330 ?auto_165325 ) ) ( not ( = ?auto_165330 ?auto_165328 ) ) ( not ( = ?auto_165320 ?auto_165323 ) ) ( not ( = ?auto_165322 ?auto_165323 ) ) ( not ( = ?auto_165321 ?auto_165323 ) ) ( not ( = ?auto_165324 ?auto_165323 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165320 ?auto_165322 ?auto_165321 ?auto_165323 ?auto_165324 ?auto_165319 )
      ( DELIVER-5PKG-VERIFY ?auto_165320 ?auto_165321 ?auto_165322 ?auto_165323 ?auto_165324 ?auto_165319 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165480 - OBJ
      ?auto_165481 - OBJ
      ?auto_165482 - OBJ
      ?auto_165483 - OBJ
      ?auto_165484 - OBJ
      ?auto_165479 - LOCATION
    )
    :vars
    (
      ?auto_165485 - LOCATION
      ?auto_165486 - CITY
      ?auto_165490 - LOCATION
      ?auto_165487 - LOCATION
      ?auto_165488 - LOCATION
      ?auto_165489 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165485 ?auto_165486 ) ( IN-CITY ?auto_165479 ?auto_165486 ) ( not ( = ?auto_165479 ?auto_165485 ) ) ( OBJ-AT ?auto_165484 ?auto_165485 ) ( IN-CITY ?auto_165490 ?auto_165486 ) ( not ( = ?auto_165479 ?auto_165490 ) ) ( OBJ-AT ?auto_165482 ?auto_165490 ) ( IN-CITY ?auto_165487 ?auto_165486 ) ( not ( = ?auto_165479 ?auto_165487 ) ) ( OBJ-AT ?auto_165481 ?auto_165487 ) ( OBJ-AT ?auto_165483 ?auto_165485 ) ( IN-CITY ?auto_165488 ?auto_165486 ) ( not ( = ?auto_165479 ?auto_165488 ) ) ( OBJ-AT ?auto_165480 ?auto_165488 ) ( TRUCK-AT ?auto_165489 ?auto_165479 ) ( not ( = ?auto_165480 ?auto_165483 ) ) ( not ( = ?auto_165485 ?auto_165488 ) ) ( not ( = ?auto_165480 ?auto_165481 ) ) ( not ( = ?auto_165483 ?auto_165481 ) ) ( not ( = ?auto_165487 ?auto_165485 ) ) ( not ( = ?auto_165487 ?auto_165488 ) ) ( not ( = ?auto_165480 ?auto_165482 ) ) ( not ( = ?auto_165483 ?auto_165482 ) ) ( not ( = ?auto_165481 ?auto_165482 ) ) ( not ( = ?auto_165490 ?auto_165487 ) ) ( not ( = ?auto_165490 ?auto_165485 ) ) ( not ( = ?auto_165490 ?auto_165488 ) ) ( not ( = ?auto_165480 ?auto_165484 ) ) ( not ( = ?auto_165483 ?auto_165484 ) ) ( not ( = ?auto_165481 ?auto_165484 ) ) ( not ( = ?auto_165482 ?auto_165484 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165480 ?auto_165483 ?auto_165481 ?auto_165484 ?auto_165482 ?auto_165479 )
      ( DELIVER-5PKG-VERIFY ?auto_165480 ?auto_165481 ?auto_165482 ?auto_165483 ?auto_165484 ?auto_165479 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165531 - OBJ
      ?auto_165532 - OBJ
      ?auto_165533 - OBJ
      ?auto_165534 - OBJ
      ?auto_165535 - OBJ
      ?auto_165530 - LOCATION
    )
    :vars
    (
      ?auto_165536 - LOCATION
      ?auto_165537 - CITY
      ?auto_165541 - LOCATION
      ?auto_165538 - LOCATION
      ?auto_165539 - LOCATION
      ?auto_165540 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165536 ?auto_165537 ) ( IN-CITY ?auto_165530 ?auto_165537 ) ( not ( = ?auto_165530 ?auto_165536 ) ) ( OBJ-AT ?auto_165534 ?auto_165536 ) ( IN-CITY ?auto_165541 ?auto_165537 ) ( not ( = ?auto_165530 ?auto_165541 ) ) ( OBJ-AT ?auto_165533 ?auto_165541 ) ( IN-CITY ?auto_165538 ?auto_165537 ) ( not ( = ?auto_165530 ?auto_165538 ) ) ( OBJ-AT ?auto_165532 ?auto_165538 ) ( OBJ-AT ?auto_165535 ?auto_165536 ) ( IN-CITY ?auto_165539 ?auto_165537 ) ( not ( = ?auto_165530 ?auto_165539 ) ) ( OBJ-AT ?auto_165531 ?auto_165539 ) ( TRUCK-AT ?auto_165540 ?auto_165530 ) ( not ( = ?auto_165531 ?auto_165535 ) ) ( not ( = ?auto_165536 ?auto_165539 ) ) ( not ( = ?auto_165531 ?auto_165532 ) ) ( not ( = ?auto_165535 ?auto_165532 ) ) ( not ( = ?auto_165538 ?auto_165536 ) ) ( not ( = ?auto_165538 ?auto_165539 ) ) ( not ( = ?auto_165531 ?auto_165533 ) ) ( not ( = ?auto_165535 ?auto_165533 ) ) ( not ( = ?auto_165532 ?auto_165533 ) ) ( not ( = ?auto_165541 ?auto_165538 ) ) ( not ( = ?auto_165541 ?auto_165536 ) ) ( not ( = ?auto_165541 ?auto_165539 ) ) ( not ( = ?auto_165531 ?auto_165534 ) ) ( not ( = ?auto_165535 ?auto_165534 ) ) ( not ( = ?auto_165532 ?auto_165534 ) ) ( not ( = ?auto_165533 ?auto_165534 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165531 ?auto_165535 ?auto_165532 ?auto_165534 ?auto_165533 ?auto_165530 )
      ( DELIVER-5PKG-VERIFY ?auto_165531 ?auto_165532 ?auto_165533 ?auto_165534 ?auto_165535 ?auto_165530 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165689 - OBJ
      ?auto_165690 - OBJ
      ?auto_165691 - OBJ
      ?auto_165692 - OBJ
      ?auto_165693 - OBJ
      ?auto_165688 - LOCATION
    )
    :vars
    (
      ?auto_165694 - LOCATION
      ?auto_165695 - CITY
      ?auto_165699 - LOCATION
      ?auto_165696 - LOCATION
      ?auto_165697 - LOCATION
      ?auto_165698 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165694 ?auto_165695 ) ( IN-CITY ?auto_165688 ?auto_165695 ) ( not ( = ?auto_165688 ?auto_165694 ) ) ( OBJ-AT ?auto_165691 ?auto_165694 ) ( IN-CITY ?auto_165699 ?auto_165695 ) ( not ( = ?auto_165688 ?auto_165699 ) ) ( OBJ-AT ?auto_165693 ?auto_165699 ) ( IN-CITY ?auto_165696 ?auto_165695 ) ( not ( = ?auto_165688 ?auto_165696 ) ) ( OBJ-AT ?auto_165690 ?auto_165696 ) ( OBJ-AT ?auto_165692 ?auto_165694 ) ( IN-CITY ?auto_165697 ?auto_165695 ) ( not ( = ?auto_165688 ?auto_165697 ) ) ( OBJ-AT ?auto_165689 ?auto_165697 ) ( TRUCK-AT ?auto_165698 ?auto_165688 ) ( not ( = ?auto_165689 ?auto_165692 ) ) ( not ( = ?auto_165694 ?auto_165697 ) ) ( not ( = ?auto_165689 ?auto_165690 ) ) ( not ( = ?auto_165692 ?auto_165690 ) ) ( not ( = ?auto_165696 ?auto_165694 ) ) ( not ( = ?auto_165696 ?auto_165697 ) ) ( not ( = ?auto_165689 ?auto_165693 ) ) ( not ( = ?auto_165692 ?auto_165693 ) ) ( not ( = ?auto_165690 ?auto_165693 ) ) ( not ( = ?auto_165699 ?auto_165696 ) ) ( not ( = ?auto_165699 ?auto_165694 ) ) ( not ( = ?auto_165699 ?auto_165697 ) ) ( not ( = ?auto_165689 ?auto_165691 ) ) ( not ( = ?auto_165692 ?auto_165691 ) ) ( not ( = ?auto_165690 ?auto_165691 ) ) ( not ( = ?auto_165693 ?auto_165691 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165689 ?auto_165692 ?auto_165690 ?auto_165691 ?auto_165693 ?auto_165688 )
      ( DELIVER-5PKG-VERIFY ?auto_165689 ?auto_165690 ?auto_165691 ?auto_165692 ?auto_165693 ?auto_165688 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165795 - OBJ
      ?auto_165796 - OBJ
      ?auto_165797 - OBJ
      ?auto_165798 - OBJ
      ?auto_165799 - OBJ
      ?auto_165794 - LOCATION
    )
    :vars
    (
      ?auto_165800 - LOCATION
      ?auto_165801 - CITY
      ?auto_165805 - LOCATION
      ?auto_165802 - LOCATION
      ?auto_165803 - LOCATION
      ?auto_165804 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165800 ?auto_165801 ) ( IN-CITY ?auto_165794 ?auto_165801 ) ( not ( = ?auto_165794 ?auto_165800 ) ) ( OBJ-AT ?auto_165797 ?auto_165800 ) ( IN-CITY ?auto_165805 ?auto_165801 ) ( not ( = ?auto_165794 ?auto_165805 ) ) ( OBJ-AT ?auto_165798 ?auto_165805 ) ( IN-CITY ?auto_165802 ?auto_165801 ) ( not ( = ?auto_165794 ?auto_165802 ) ) ( OBJ-AT ?auto_165796 ?auto_165802 ) ( OBJ-AT ?auto_165799 ?auto_165800 ) ( IN-CITY ?auto_165803 ?auto_165801 ) ( not ( = ?auto_165794 ?auto_165803 ) ) ( OBJ-AT ?auto_165795 ?auto_165803 ) ( TRUCK-AT ?auto_165804 ?auto_165794 ) ( not ( = ?auto_165795 ?auto_165799 ) ) ( not ( = ?auto_165800 ?auto_165803 ) ) ( not ( = ?auto_165795 ?auto_165796 ) ) ( not ( = ?auto_165799 ?auto_165796 ) ) ( not ( = ?auto_165802 ?auto_165800 ) ) ( not ( = ?auto_165802 ?auto_165803 ) ) ( not ( = ?auto_165795 ?auto_165798 ) ) ( not ( = ?auto_165799 ?auto_165798 ) ) ( not ( = ?auto_165796 ?auto_165798 ) ) ( not ( = ?auto_165805 ?auto_165802 ) ) ( not ( = ?auto_165805 ?auto_165800 ) ) ( not ( = ?auto_165805 ?auto_165803 ) ) ( not ( = ?auto_165795 ?auto_165797 ) ) ( not ( = ?auto_165799 ?auto_165797 ) ) ( not ( = ?auto_165796 ?auto_165797 ) ) ( not ( = ?auto_165798 ?auto_165797 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165795 ?auto_165799 ?auto_165796 ?auto_165797 ?auto_165798 ?auto_165794 )
      ( DELIVER-5PKG-VERIFY ?auto_165795 ?auto_165796 ?auto_165797 ?auto_165798 ?auto_165799 ?auto_165794 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_166062 - OBJ
      ?auto_166063 - OBJ
      ?auto_166064 - OBJ
      ?auto_166065 - OBJ
      ?auto_166066 - OBJ
      ?auto_166061 - LOCATION
    )
    :vars
    (
      ?auto_166067 - LOCATION
      ?auto_166068 - CITY
      ?auto_166072 - LOCATION
      ?auto_166069 - LOCATION
      ?auto_166070 - LOCATION
      ?auto_166071 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_166067 ?auto_166068 ) ( IN-CITY ?auto_166061 ?auto_166068 ) ( not ( = ?auto_166061 ?auto_166067 ) ) ( OBJ-AT ?auto_166066 ?auto_166067 ) ( IN-CITY ?auto_166072 ?auto_166068 ) ( not ( = ?auto_166061 ?auto_166072 ) ) ( OBJ-AT ?auto_166063 ?auto_166072 ) ( IN-CITY ?auto_166069 ?auto_166068 ) ( not ( = ?auto_166061 ?auto_166069 ) ) ( OBJ-AT ?auto_166065 ?auto_166069 ) ( OBJ-AT ?auto_166064 ?auto_166067 ) ( IN-CITY ?auto_166070 ?auto_166068 ) ( not ( = ?auto_166061 ?auto_166070 ) ) ( OBJ-AT ?auto_166062 ?auto_166070 ) ( TRUCK-AT ?auto_166071 ?auto_166061 ) ( not ( = ?auto_166062 ?auto_166064 ) ) ( not ( = ?auto_166067 ?auto_166070 ) ) ( not ( = ?auto_166062 ?auto_166065 ) ) ( not ( = ?auto_166064 ?auto_166065 ) ) ( not ( = ?auto_166069 ?auto_166067 ) ) ( not ( = ?auto_166069 ?auto_166070 ) ) ( not ( = ?auto_166062 ?auto_166063 ) ) ( not ( = ?auto_166064 ?auto_166063 ) ) ( not ( = ?auto_166065 ?auto_166063 ) ) ( not ( = ?auto_166072 ?auto_166069 ) ) ( not ( = ?auto_166072 ?auto_166067 ) ) ( not ( = ?auto_166072 ?auto_166070 ) ) ( not ( = ?auto_166062 ?auto_166066 ) ) ( not ( = ?auto_166064 ?auto_166066 ) ) ( not ( = ?auto_166065 ?auto_166066 ) ) ( not ( = ?auto_166063 ?auto_166066 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_166062 ?auto_166064 ?auto_166065 ?auto_166066 ?auto_166063 ?auto_166061 )
      ( DELIVER-5PKG-VERIFY ?auto_166062 ?auto_166063 ?auto_166064 ?auto_166065 ?auto_166066 ?auto_166061 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_166113 - OBJ
      ?auto_166114 - OBJ
      ?auto_166115 - OBJ
      ?auto_166116 - OBJ
      ?auto_166117 - OBJ
      ?auto_166112 - LOCATION
    )
    :vars
    (
      ?auto_166118 - LOCATION
      ?auto_166119 - CITY
      ?auto_166123 - LOCATION
      ?auto_166120 - LOCATION
      ?auto_166121 - LOCATION
      ?auto_166122 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_166118 ?auto_166119 ) ( IN-CITY ?auto_166112 ?auto_166119 ) ( not ( = ?auto_166112 ?auto_166118 ) ) ( OBJ-AT ?auto_166116 ?auto_166118 ) ( IN-CITY ?auto_166123 ?auto_166119 ) ( not ( = ?auto_166112 ?auto_166123 ) ) ( OBJ-AT ?auto_166114 ?auto_166123 ) ( IN-CITY ?auto_166120 ?auto_166119 ) ( not ( = ?auto_166112 ?auto_166120 ) ) ( OBJ-AT ?auto_166117 ?auto_166120 ) ( OBJ-AT ?auto_166115 ?auto_166118 ) ( IN-CITY ?auto_166121 ?auto_166119 ) ( not ( = ?auto_166112 ?auto_166121 ) ) ( OBJ-AT ?auto_166113 ?auto_166121 ) ( TRUCK-AT ?auto_166122 ?auto_166112 ) ( not ( = ?auto_166113 ?auto_166115 ) ) ( not ( = ?auto_166118 ?auto_166121 ) ) ( not ( = ?auto_166113 ?auto_166117 ) ) ( not ( = ?auto_166115 ?auto_166117 ) ) ( not ( = ?auto_166120 ?auto_166118 ) ) ( not ( = ?auto_166120 ?auto_166121 ) ) ( not ( = ?auto_166113 ?auto_166114 ) ) ( not ( = ?auto_166115 ?auto_166114 ) ) ( not ( = ?auto_166117 ?auto_166114 ) ) ( not ( = ?auto_166123 ?auto_166120 ) ) ( not ( = ?auto_166123 ?auto_166118 ) ) ( not ( = ?auto_166123 ?auto_166121 ) ) ( not ( = ?auto_166113 ?auto_166116 ) ) ( not ( = ?auto_166115 ?auto_166116 ) ) ( not ( = ?auto_166117 ?auto_166116 ) ) ( not ( = ?auto_166114 ?auto_166116 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_166113 ?auto_166115 ?auto_166117 ?auto_166116 ?auto_166114 ?auto_166112 )
      ( DELIVER-5PKG-VERIFY ?auto_166113 ?auto_166114 ?auto_166115 ?auto_166116 ?auto_166117 ?auto_166112 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_166164 - OBJ
      ?auto_166165 - OBJ
      ?auto_166166 - OBJ
      ?auto_166167 - OBJ
      ?auto_166168 - OBJ
      ?auto_166163 - LOCATION
    )
    :vars
    (
      ?auto_166169 - LOCATION
      ?auto_166170 - CITY
      ?auto_166174 - LOCATION
      ?auto_166171 - LOCATION
      ?auto_166172 - LOCATION
      ?auto_166173 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_166169 ?auto_166170 ) ( IN-CITY ?auto_166163 ?auto_166170 ) ( not ( = ?auto_166163 ?auto_166169 ) ) ( OBJ-AT ?auto_166168 ?auto_166169 ) ( IN-CITY ?auto_166174 ?auto_166170 ) ( not ( = ?auto_166163 ?auto_166174 ) ) ( OBJ-AT ?auto_166165 ?auto_166174 ) ( IN-CITY ?auto_166171 ?auto_166170 ) ( not ( = ?auto_166163 ?auto_166171 ) ) ( OBJ-AT ?auto_166166 ?auto_166171 ) ( OBJ-AT ?auto_166167 ?auto_166169 ) ( IN-CITY ?auto_166172 ?auto_166170 ) ( not ( = ?auto_166163 ?auto_166172 ) ) ( OBJ-AT ?auto_166164 ?auto_166172 ) ( TRUCK-AT ?auto_166173 ?auto_166163 ) ( not ( = ?auto_166164 ?auto_166167 ) ) ( not ( = ?auto_166169 ?auto_166172 ) ) ( not ( = ?auto_166164 ?auto_166166 ) ) ( not ( = ?auto_166167 ?auto_166166 ) ) ( not ( = ?auto_166171 ?auto_166169 ) ) ( not ( = ?auto_166171 ?auto_166172 ) ) ( not ( = ?auto_166164 ?auto_166165 ) ) ( not ( = ?auto_166167 ?auto_166165 ) ) ( not ( = ?auto_166166 ?auto_166165 ) ) ( not ( = ?auto_166174 ?auto_166171 ) ) ( not ( = ?auto_166174 ?auto_166169 ) ) ( not ( = ?auto_166174 ?auto_166172 ) ) ( not ( = ?auto_166164 ?auto_166168 ) ) ( not ( = ?auto_166167 ?auto_166168 ) ) ( not ( = ?auto_166166 ?auto_166168 ) ) ( not ( = ?auto_166165 ?auto_166168 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_166164 ?auto_166167 ?auto_166166 ?auto_166168 ?auto_166165 ?auto_166163 )
      ( DELIVER-5PKG-VERIFY ?auto_166164 ?auto_166165 ?auto_166166 ?auto_166167 ?auto_166168 ?auto_166163 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_166215 - OBJ
      ?auto_166216 - OBJ
      ?auto_166217 - OBJ
      ?auto_166218 - OBJ
      ?auto_166219 - OBJ
      ?auto_166214 - LOCATION
    )
    :vars
    (
      ?auto_166220 - LOCATION
      ?auto_166221 - CITY
      ?auto_166225 - LOCATION
      ?auto_166222 - LOCATION
      ?auto_166223 - LOCATION
      ?auto_166224 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_166220 ?auto_166221 ) ( IN-CITY ?auto_166214 ?auto_166221 ) ( not ( = ?auto_166214 ?auto_166220 ) ) ( OBJ-AT ?auto_166218 ?auto_166220 ) ( IN-CITY ?auto_166225 ?auto_166221 ) ( not ( = ?auto_166214 ?auto_166225 ) ) ( OBJ-AT ?auto_166216 ?auto_166225 ) ( IN-CITY ?auto_166222 ?auto_166221 ) ( not ( = ?auto_166214 ?auto_166222 ) ) ( OBJ-AT ?auto_166217 ?auto_166222 ) ( OBJ-AT ?auto_166219 ?auto_166220 ) ( IN-CITY ?auto_166223 ?auto_166221 ) ( not ( = ?auto_166214 ?auto_166223 ) ) ( OBJ-AT ?auto_166215 ?auto_166223 ) ( TRUCK-AT ?auto_166224 ?auto_166214 ) ( not ( = ?auto_166215 ?auto_166219 ) ) ( not ( = ?auto_166220 ?auto_166223 ) ) ( not ( = ?auto_166215 ?auto_166217 ) ) ( not ( = ?auto_166219 ?auto_166217 ) ) ( not ( = ?auto_166222 ?auto_166220 ) ) ( not ( = ?auto_166222 ?auto_166223 ) ) ( not ( = ?auto_166215 ?auto_166216 ) ) ( not ( = ?auto_166219 ?auto_166216 ) ) ( not ( = ?auto_166217 ?auto_166216 ) ) ( not ( = ?auto_166225 ?auto_166222 ) ) ( not ( = ?auto_166225 ?auto_166220 ) ) ( not ( = ?auto_166225 ?auto_166223 ) ) ( not ( = ?auto_166215 ?auto_166218 ) ) ( not ( = ?auto_166219 ?auto_166218 ) ) ( not ( = ?auto_166217 ?auto_166218 ) ) ( not ( = ?auto_166216 ?auto_166218 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_166215 ?auto_166219 ?auto_166217 ?auto_166218 ?auto_166216 ?auto_166214 )
      ( DELIVER-5PKG-VERIFY ?auto_166215 ?auto_166216 ?auto_166217 ?auto_166218 ?auto_166219 ?auto_166214 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_166482 - OBJ
      ?auto_166483 - OBJ
      ?auto_166484 - OBJ
      ?auto_166485 - OBJ
      ?auto_166486 - OBJ
      ?auto_166481 - LOCATION
    )
    :vars
    (
      ?auto_166487 - LOCATION
      ?auto_166488 - CITY
      ?auto_166492 - LOCATION
      ?auto_166489 - LOCATION
      ?auto_166490 - LOCATION
      ?auto_166491 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_166487 ?auto_166488 ) ( IN-CITY ?auto_166481 ?auto_166488 ) ( not ( = ?auto_166481 ?auto_166487 ) ) ( OBJ-AT ?auto_166484 ?auto_166487 ) ( IN-CITY ?auto_166492 ?auto_166488 ) ( not ( = ?auto_166481 ?auto_166492 ) ) ( OBJ-AT ?auto_166483 ?auto_166492 ) ( IN-CITY ?auto_166489 ?auto_166488 ) ( not ( = ?auto_166481 ?auto_166489 ) ) ( OBJ-AT ?auto_166486 ?auto_166489 ) ( OBJ-AT ?auto_166485 ?auto_166487 ) ( IN-CITY ?auto_166490 ?auto_166488 ) ( not ( = ?auto_166481 ?auto_166490 ) ) ( OBJ-AT ?auto_166482 ?auto_166490 ) ( TRUCK-AT ?auto_166491 ?auto_166481 ) ( not ( = ?auto_166482 ?auto_166485 ) ) ( not ( = ?auto_166487 ?auto_166490 ) ) ( not ( = ?auto_166482 ?auto_166486 ) ) ( not ( = ?auto_166485 ?auto_166486 ) ) ( not ( = ?auto_166489 ?auto_166487 ) ) ( not ( = ?auto_166489 ?auto_166490 ) ) ( not ( = ?auto_166482 ?auto_166483 ) ) ( not ( = ?auto_166485 ?auto_166483 ) ) ( not ( = ?auto_166486 ?auto_166483 ) ) ( not ( = ?auto_166492 ?auto_166489 ) ) ( not ( = ?auto_166492 ?auto_166487 ) ) ( not ( = ?auto_166492 ?auto_166490 ) ) ( not ( = ?auto_166482 ?auto_166484 ) ) ( not ( = ?auto_166485 ?auto_166484 ) ) ( not ( = ?auto_166486 ?auto_166484 ) ) ( not ( = ?auto_166483 ?auto_166484 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_166482 ?auto_166485 ?auto_166486 ?auto_166484 ?auto_166483 ?auto_166481 )
      ( DELIVER-5PKG-VERIFY ?auto_166482 ?auto_166483 ?auto_166484 ?auto_166485 ?auto_166486 ?auto_166481 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_166533 - OBJ
      ?auto_166534 - OBJ
      ?auto_166535 - OBJ
      ?auto_166536 - OBJ
      ?auto_166537 - OBJ
      ?auto_166532 - LOCATION
    )
    :vars
    (
      ?auto_166538 - LOCATION
      ?auto_166539 - CITY
      ?auto_166543 - LOCATION
      ?auto_166540 - LOCATION
      ?auto_166541 - LOCATION
      ?auto_166542 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_166538 ?auto_166539 ) ( IN-CITY ?auto_166532 ?auto_166539 ) ( not ( = ?auto_166532 ?auto_166538 ) ) ( OBJ-AT ?auto_166535 ?auto_166538 ) ( IN-CITY ?auto_166543 ?auto_166539 ) ( not ( = ?auto_166532 ?auto_166543 ) ) ( OBJ-AT ?auto_166534 ?auto_166543 ) ( IN-CITY ?auto_166540 ?auto_166539 ) ( not ( = ?auto_166532 ?auto_166540 ) ) ( OBJ-AT ?auto_166536 ?auto_166540 ) ( OBJ-AT ?auto_166537 ?auto_166538 ) ( IN-CITY ?auto_166541 ?auto_166539 ) ( not ( = ?auto_166532 ?auto_166541 ) ) ( OBJ-AT ?auto_166533 ?auto_166541 ) ( TRUCK-AT ?auto_166542 ?auto_166532 ) ( not ( = ?auto_166533 ?auto_166537 ) ) ( not ( = ?auto_166538 ?auto_166541 ) ) ( not ( = ?auto_166533 ?auto_166536 ) ) ( not ( = ?auto_166537 ?auto_166536 ) ) ( not ( = ?auto_166540 ?auto_166538 ) ) ( not ( = ?auto_166540 ?auto_166541 ) ) ( not ( = ?auto_166533 ?auto_166534 ) ) ( not ( = ?auto_166537 ?auto_166534 ) ) ( not ( = ?auto_166536 ?auto_166534 ) ) ( not ( = ?auto_166543 ?auto_166540 ) ) ( not ( = ?auto_166543 ?auto_166538 ) ) ( not ( = ?auto_166543 ?auto_166541 ) ) ( not ( = ?auto_166533 ?auto_166535 ) ) ( not ( = ?auto_166537 ?auto_166535 ) ) ( not ( = ?auto_166536 ?auto_166535 ) ) ( not ( = ?auto_166534 ?auto_166535 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_166533 ?auto_166537 ?auto_166536 ?auto_166535 ?auto_166534 ?auto_166532 )
      ( DELIVER-5PKG-VERIFY ?auto_166533 ?auto_166534 ?auto_166535 ?auto_166536 ?auto_166537 ?auto_166532 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167243 - OBJ
      ?auto_167244 - OBJ
      ?auto_167245 - OBJ
      ?auto_167246 - OBJ
      ?auto_167247 - OBJ
      ?auto_167242 - LOCATION
    )
    :vars
    (
      ?auto_167248 - LOCATION
      ?auto_167249 - CITY
      ?auto_167253 - LOCATION
      ?auto_167250 - LOCATION
      ?auto_167251 - LOCATION
      ?auto_167252 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167248 ?auto_167249 ) ( IN-CITY ?auto_167242 ?auto_167249 ) ( not ( = ?auto_167242 ?auto_167248 ) ) ( OBJ-AT ?auto_167244 ?auto_167248 ) ( IN-CITY ?auto_167253 ?auto_167249 ) ( not ( = ?auto_167242 ?auto_167253 ) ) ( OBJ-AT ?auto_167247 ?auto_167253 ) ( IN-CITY ?auto_167250 ?auto_167249 ) ( not ( = ?auto_167242 ?auto_167250 ) ) ( OBJ-AT ?auto_167246 ?auto_167250 ) ( OBJ-AT ?auto_167245 ?auto_167248 ) ( IN-CITY ?auto_167251 ?auto_167249 ) ( not ( = ?auto_167242 ?auto_167251 ) ) ( OBJ-AT ?auto_167243 ?auto_167251 ) ( TRUCK-AT ?auto_167252 ?auto_167242 ) ( not ( = ?auto_167243 ?auto_167245 ) ) ( not ( = ?auto_167248 ?auto_167251 ) ) ( not ( = ?auto_167243 ?auto_167246 ) ) ( not ( = ?auto_167245 ?auto_167246 ) ) ( not ( = ?auto_167250 ?auto_167248 ) ) ( not ( = ?auto_167250 ?auto_167251 ) ) ( not ( = ?auto_167243 ?auto_167247 ) ) ( not ( = ?auto_167245 ?auto_167247 ) ) ( not ( = ?auto_167246 ?auto_167247 ) ) ( not ( = ?auto_167253 ?auto_167250 ) ) ( not ( = ?auto_167253 ?auto_167248 ) ) ( not ( = ?auto_167253 ?auto_167251 ) ) ( not ( = ?auto_167243 ?auto_167244 ) ) ( not ( = ?auto_167245 ?auto_167244 ) ) ( not ( = ?auto_167246 ?auto_167244 ) ) ( not ( = ?auto_167247 ?auto_167244 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167243 ?auto_167245 ?auto_167246 ?auto_167244 ?auto_167247 ?auto_167242 )
      ( DELIVER-5PKG-VERIFY ?auto_167243 ?auto_167244 ?auto_167245 ?auto_167246 ?auto_167247 ?auto_167242 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167294 - OBJ
      ?auto_167295 - OBJ
      ?auto_167296 - OBJ
      ?auto_167297 - OBJ
      ?auto_167298 - OBJ
      ?auto_167293 - LOCATION
    )
    :vars
    (
      ?auto_167299 - LOCATION
      ?auto_167300 - CITY
      ?auto_167304 - LOCATION
      ?auto_167301 - LOCATION
      ?auto_167302 - LOCATION
      ?auto_167303 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167299 ?auto_167300 ) ( IN-CITY ?auto_167293 ?auto_167300 ) ( not ( = ?auto_167293 ?auto_167299 ) ) ( OBJ-AT ?auto_167295 ?auto_167299 ) ( IN-CITY ?auto_167304 ?auto_167300 ) ( not ( = ?auto_167293 ?auto_167304 ) ) ( OBJ-AT ?auto_167297 ?auto_167304 ) ( IN-CITY ?auto_167301 ?auto_167300 ) ( not ( = ?auto_167293 ?auto_167301 ) ) ( OBJ-AT ?auto_167298 ?auto_167301 ) ( OBJ-AT ?auto_167296 ?auto_167299 ) ( IN-CITY ?auto_167302 ?auto_167300 ) ( not ( = ?auto_167293 ?auto_167302 ) ) ( OBJ-AT ?auto_167294 ?auto_167302 ) ( TRUCK-AT ?auto_167303 ?auto_167293 ) ( not ( = ?auto_167294 ?auto_167296 ) ) ( not ( = ?auto_167299 ?auto_167302 ) ) ( not ( = ?auto_167294 ?auto_167298 ) ) ( not ( = ?auto_167296 ?auto_167298 ) ) ( not ( = ?auto_167301 ?auto_167299 ) ) ( not ( = ?auto_167301 ?auto_167302 ) ) ( not ( = ?auto_167294 ?auto_167297 ) ) ( not ( = ?auto_167296 ?auto_167297 ) ) ( not ( = ?auto_167298 ?auto_167297 ) ) ( not ( = ?auto_167304 ?auto_167301 ) ) ( not ( = ?auto_167304 ?auto_167299 ) ) ( not ( = ?auto_167304 ?auto_167302 ) ) ( not ( = ?auto_167294 ?auto_167295 ) ) ( not ( = ?auto_167296 ?auto_167295 ) ) ( not ( = ?auto_167298 ?auto_167295 ) ) ( not ( = ?auto_167297 ?auto_167295 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167294 ?auto_167296 ?auto_167298 ?auto_167295 ?auto_167297 ?auto_167293 )
      ( DELIVER-5PKG-VERIFY ?auto_167294 ?auto_167295 ?auto_167296 ?auto_167297 ?auto_167298 ?auto_167293 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167507 - OBJ
      ?auto_167508 - OBJ
      ?auto_167509 - OBJ
      ?auto_167510 - OBJ
      ?auto_167511 - OBJ
      ?auto_167506 - LOCATION
    )
    :vars
    (
      ?auto_167512 - LOCATION
      ?auto_167513 - CITY
      ?auto_167517 - LOCATION
      ?auto_167514 - LOCATION
      ?auto_167515 - LOCATION
      ?auto_167516 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167512 ?auto_167513 ) ( IN-CITY ?auto_167506 ?auto_167513 ) ( not ( = ?auto_167506 ?auto_167512 ) ) ( OBJ-AT ?auto_167508 ?auto_167512 ) ( IN-CITY ?auto_167517 ?auto_167513 ) ( not ( = ?auto_167506 ?auto_167517 ) ) ( OBJ-AT ?auto_167511 ?auto_167517 ) ( IN-CITY ?auto_167514 ?auto_167513 ) ( not ( = ?auto_167506 ?auto_167514 ) ) ( OBJ-AT ?auto_167509 ?auto_167514 ) ( OBJ-AT ?auto_167510 ?auto_167512 ) ( IN-CITY ?auto_167515 ?auto_167513 ) ( not ( = ?auto_167506 ?auto_167515 ) ) ( OBJ-AT ?auto_167507 ?auto_167515 ) ( TRUCK-AT ?auto_167516 ?auto_167506 ) ( not ( = ?auto_167507 ?auto_167510 ) ) ( not ( = ?auto_167512 ?auto_167515 ) ) ( not ( = ?auto_167507 ?auto_167509 ) ) ( not ( = ?auto_167510 ?auto_167509 ) ) ( not ( = ?auto_167514 ?auto_167512 ) ) ( not ( = ?auto_167514 ?auto_167515 ) ) ( not ( = ?auto_167507 ?auto_167511 ) ) ( not ( = ?auto_167510 ?auto_167511 ) ) ( not ( = ?auto_167509 ?auto_167511 ) ) ( not ( = ?auto_167517 ?auto_167514 ) ) ( not ( = ?auto_167517 ?auto_167512 ) ) ( not ( = ?auto_167517 ?auto_167515 ) ) ( not ( = ?auto_167507 ?auto_167508 ) ) ( not ( = ?auto_167510 ?auto_167508 ) ) ( not ( = ?auto_167509 ?auto_167508 ) ) ( not ( = ?auto_167511 ?auto_167508 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167507 ?auto_167510 ?auto_167509 ?auto_167508 ?auto_167511 ?auto_167506 )
      ( DELIVER-5PKG-VERIFY ?auto_167507 ?auto_167508 ?auto_167509 ?auto_167510 ?auto_167511 ?auto_167506 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167613 - OBJ
      ?auto_167614 - OBJ
      ?auto_167615 - OBJ
      ?auto_167616 - OBJ
      ?auto_167617 - OBJ
      ?auto_167612 - LOCATION
    )
    :vars
    (
      ?auto_167618 - LOCATION
      ?auto_167619 - CITY
      ?auto_167623 - LOCATION
      ?auto_167620 - LOCATION
      ?auto_167621 - LOCATION
      ?auto_167622 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167618 ?auto_167619 ) ( IN-CITY ?auto_167612 ?auto_167619 ) ( not ( = ?auto_167612 ?auto_167618 ) ) ( OBJ-AT ?auto_167614 ?auto_167618 ) ( IN-CITY ?auto_167623 ?auto_167619 ) ( not ( = ?auto_167612 ?auto_167623 ) ) ( OBJ-AT ?auto_167616 ?auto_167623 ) ( IN-CITY ?auto_167620 ?auto_167619 ) ( not ( = ?auto_167612 ?auto_167620 ) ) ( OBJ-AT ?auto_167615 ?auto_167620 ) ( OBJ-AT ?auto_167617 ?auto_167618 ) ( IN-CITY ?auto_167621 ?auto_167619 ) ( not ( = ?auto_167612 ?auto_167621 ) ) ( OBJ-AT ?auto_167613 ?auto_167621 ) ( TRUCK-AT ?auto_167622 ?auto_167612 ) ( not ( = ?auto_167613 ?auto_167617 ) ) ( not ( = ?auto_167618 ?auto_167621 ) ) ( not ( = ?auto_167613 ?auto_167615 ) ) ( not ( = ?auto_167617 ?auto_167615 ) ) ( not ( = ?auto_167620 ?auto_167618 ) ) ( not ( = ?auto_167620 ?auto_167621 ) ) ( not ( = ?auto_167613 ?auto_167616 ) ) ( not ( = ?auto_167617 ?auto_167616 ) ) ( not ( = ?auto_167615 ?auto_167616 ) ) ( not ( = ?auto_167623 ?auto_167620 ) ) ( not ( = ?auto_167623 ?auto_167618 ) ) ( not ( = ?auto_167623 ?auto_167621 ) ) ( not ( = ?auto_167613 ?auto_167614 ) ) ( not ( = ?auto_167617 ?auto_167614 ) ) ( not ( = ?auto_167615 ?auto_167614 ) ) ( not ( = ?auto_167616 ?auto_167614 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167613 ?auto_167617 ?auto_167615 ?auto_167614 ?auto_167616 ?auto_167612 )
      ( DELIVER-5PKG-VERIFY ?auto_167613 ?auto_167614 ?auto_167615 ?auto_167616 ?auto_167617 ?auto_167612 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167826 - OBJ
      ?auto_167827 - OBJ
      ?auto_167828 - OBJ
      ?auto_167829 - OBJ
      ?auto_167830 - OBJ
      ?auto_167825 - LOCATION
    )
    :vars
    (
      ?auto_167831 - LOCATION
      ?auto_167832 - CITY
      ?auto_167836 - LOCATION
      ?auto_167833 - LOCATION
      ?auto_167834 - LOCATION
      ?auto_167835 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167831 ?auto_167832 ) ( IN-CITY ?auto_167825 ?auto_167832 ) ( not ( = ?auto_167825 ?auto_167831 ) ) ( OBJ-AT ?auto_167827 ?auto_167831 ) ( IN-CITY ?auto_167836 ?auto_167832 ) ( not ( = ?auto_167825 ?auto_167836 ) ) ( OBJ-AT ?auto_167828 ?auto_167836 ) ( IN-CITY ?auto_167833 ?auto_167832 ) ( not ( = ?auto_167825 ?auto_167833 ) ) ( OBJ-AT ?auto_167830 ?auto_167833 ) ( OBJ-AT ?auto_167829 ?auto_167831 ) ( IN-CITY ?auto_167834 ?auto_167832 ) ( not ( = ?auto_167825 ?auto_167834 ) ) ( OBJ-AT ?auto_167826 ?auto_167834 ) ( TRUCK-AT ?auto_167835 ?auto_167825 ) ( not ( = ?auto_167826 ?auto_167829 ) ) ( not ( = ?auto_167831 ?auto_167834 ) ) ( not ( = ?auto_167826 ?auto_167830 ) ) ( not ( = ?auto_167829 ?auto_167830 ) ) ( not ( = ?auto_167833 ?auto_167831 ) ) ( not ( = ?auto_167833 ?auto_167834 ) ) ( not ( = ?auto_167826 ?auto_167828 ) ) ( not ( = ?auto_167829 ?auto_167828 ) ) ( not ( = ?auto_167830 ?auto_167828 ) ) ( not ( = ?auto_167836 ?auto_167833 ) ) ( not ( = ?auto_167836 ?auto_167831 ) ) ( not ( = ?auto_167836 ?auto_167834 ) ) ( not ( = ?auto_167826 ?auto_167827 ) ) ( not ( = ?auto_167829 ?auto_167827 ) ) ( not ( = ?auto_167830 ?auto_167827 ) ) ( not ( = ?auto_167828 ?auto_167827 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167826 ?auto_167829 ?auto_167830 ?auto_167827 ?auto_167828 ?auto_167825 )
      ( DELIVER-5PKG-VERIFY ?auto_167826 ?auto_167827 ?auto_167828 ?auto_167829 ?auto_167830 ?auto_167825 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167877 - OBJ
      ?auto_167878 - OBJ
      ?auto_167879 - OBJ
      ?auto_167880 - OBJ
      ?auto_167881 - OBJ
      ?auto_167876 - LOCATION
    )
    :vars
    (
      ?auto_167882 - LOCATION
      ?auto_167883 - CITY
      ?auto_167887 - LOCATION
      ?auto_167884 - LOCATION
      ?auto_167885 - LOCATION
      ?auto_167886 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167882 ?auto_167883 ) ( IN-CITY ?auto_167876 ?auto_167883 ) ( not ( = ?auto_167876 ?auto_167882 ) ) ( OBJ-AT ?auto_167878 ?auto_167882 ) ( IN-CITY ?auto_167887 ?auto_167883 ) ( not ( = ?auto_167876 ?auto_167887 ) ) ( OBJ-AT ?auto_167879 ?auto_167887 ) ( IN-CITY ?auto_167884 ?auto_167883 ) ( not ( = ?auto_167876 ?auto_167884 ) ) ( OBJ-AT ?auto_167880 ?auto_167884 ) ( OBJ-AT ?auto_167881 ?auto_167882 ) ( IN-CITY ?auto_167885 ?auto_167883 ) ( not ( = ?auto_167876 ?auto_167885 ) ) ( OBJ-AT ?auto_167877 ?auto_167885 ) ( TRUCK-AT ?auto_167886 ?auto_167876 ) ( not ( = ?auto_167877 ?auto_167881 ) ) ( not ( = ?auto_167882 ?auto_167885 ) ) ( not ( = ?auto_167877 ?auto_167880 ) ) ( not ( = ?auto_167881 ?auto_167880 ) ) ( not ( = ?auto_167884 ?auto_167882 ) ) ( not ( = ?auto_167884 ?auto_167885 ) ) ( not ( = ?auto_167877 ?auto_167879 ) ) ( not ( = ?auto_167881 ?auto_167879 ) ) ( not ( = ?auto_167880 ?auto_167879 ) ) ( not ( = ?auto_167887 ?auto_167884 ) ) ( not ( = ?auto_167887 ?auto_167882 ) ) ( not ( = ?auto_167887 ?auto_167885 ) ) ( not ( = ?auto_167877 ?auto_167878 ) ) ( not ( = ?auto_167881 ?auto_167878 ) ) ( not ( = ?auto_167880 ?auto_167878 ) ) ( not ( = ?auto_167879 ?auto_167878 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167877 ?auto_167881 ?auto_167880 ?auto_167878 ?auto_167879 ?auto_167876 )
      ( DELIVER-5PKG-VERIFY ?auto_167877 ?auto_167878 ?auto_167879 ?auto_167880 ?auto_167881 ?auto_167876 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168695 - OBJ
      ?auto_168696 - OBJ
      ?auto_168697 - OBJ
      ?auto_168698 - OBJ
      ?auto_168699 - OBJ
      ?auto_168694 - LOCATION
    )
    :vars
    (
      ?auto_168700 - LOCATION
      ?auto_168701 - CITY
      ?auto_168705 - LOCATION
      ?auto_168702 - LOCATION
      ?auto_168703 - LOCATION
      ?auto_168704 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168700 ?auto_168701 ) ( IN-CITY ?auto_168694 ?auto_168701 ) ( not ( = ?auto_168694 ?auto_168700 ) ) ( OBJ-AT ?auto_168699 ?auto_168700 ) ( IN-CITY ?auto_168705 ?auto_168701 ) ( not ( = ?auto_168694 ?auto_168705 ) ) ( OBJ-AT ?auto_168698 ?auto_168705 ) ( IN-CITY ?auto_168702 ?auto_168701 ) ( not ( = ?auto_168694 ?auto_168702 ) ) ( OBJ-AT ?auto_168697 ?auto_168702 ) ( OBJ-AT ?auto_168695 ?auto_168700 ) ( IN-CITY ?auto_168703 ?auto_168701 ) ( not ( = ?auto_168694 ?auto_168703 ) ) ( OBJ-AT ?auto_168696 ?auto_168703 ) ( TRUCK-AT ?auto_168704 ?auto_168694 ) ( not ( = ?auto_168696 ?auto_168695 ) ) ( not ( = ?auto_168700 ?auto_168703 ) ) ( not ( = ?auto_168696 ?auto_168697 ) ) ( not ( = ?auto_168695 ?auto_168697 ) ) ( not ( = ?auto_168702 ?auto_168700 ) ) ( not ( = ?auto_168702 ?auto_168703 ) ) ( not ( = ?auto_168696 ?auto_168698 ) ) ( not ( = ?auto_168695 ?auto_168698 ) ) ( not ( = ?auto_168697 ?auto_168698 ) ) ( not ( = ?auto_168705 ?auto_168702 ) ) ( not ( = ?auto_168705 ?auto_168700 ) ) ( not ( = ?auto_168705 ?auto_168703 ) ) ( not ( = ?auto_168696 ?auto_168699 ) ) ( not ( = ?auto_168695 ?auto_168699 ) ) ( not ( = ?auto_168697 ?auto_168699 ) ) ( not ( = ?auto_168698 ?auto_168699 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168696 ?auto_168695 ?auto_168697 ?auto_168699 ?auto_168698 ?auto_168694 )
      ( DELIVER-5PKG-VERIFY ?auto_168695 ?auto_168696 ?auto_168697 ?auto_168698 ?auto_168699 ?auto_168694 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168746 - OBJ
      ?auto_168747 - OBJ
      ?auto_168748 - OBJ
      ?auto_168749 - OBJ
      ?auto_168750 - OBJ
      ?auto_168745 - LOCATION
    )
    :vars
    (
      ?auto_168751 - LOCATION
      ?auto_168752 - CITY
      ?auto_168756 - LOCATION
      ?auto_168753 - LOCATION
      ?auto_168754 - LOCATION
      ?auto_168755 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168751 ?auto_168752 ) ( IN-CITY ?auto_168745 ?auto_168752 ) ( not ( = ?auto_168745 ?auto_168751 ) ) ( OBJ-AT ?auto_168749 ?auto_168751 ) ( IN-CITY ?auto_168756 ?auto_168752 ) ( not ( = ?auto_168745 ?auto_168756 ) ) ( OBJ-AT ?auto_168750 ?auto_168756 ) ( IN-CITY ?auto_168753 ?auto_168752 ) ( not ( = ?auto_168745 ?auto_168753 ) ) ( OBJ-AT ?auto_168748 ?auto_168753 ) ( OBJ-AT ?auto_168746 ?auto_168751 ) ( IN-CITY ?auto_168754 ?auto_168752 ) ( not ( = ?auto_168745 ?auto_168754 ) ) ( OBJ-AT ?auto_168747 ?auto_168754 ) ( TRUCK-AT ?auto_168755 ?auto_168745 ) ( not ( = ?auto_168747 ?auto_168746 ) ) ( not ( = ?auto_168751 ?auto_168754 ) ) ( not ( = ?auto_168747 ?auto_168748 ) ) ( not ( = ?auto_168746 ?auto_168748 ) ) ( not ( = ?auto_168753 ?auto_168751 ) ) ( not ( = ?auto_168753 ?auto_168754 ) ) ( not ( = ?auto_168747 ?auto_168750 ) ) ( not ( = ?auto_168746 ?auto_168750 ) ) ( not ( = ?auto_168748 ?auto_168750 ) ) ( not ( = ?auto_168756 ?auto_168753 ) ) ( not ( = ?auto_168756 ?auto_168751 ) ) ( not ( = ?auto_168756 ?auto_168754 ) ) ( not ( = ?auto_168747 ?auto_168749 ) ) ( not ( = ?auto_168746 ?auto_168749 ) ) ( not ( = ?auto_168748 ?auto_168749 ) ) ( not ( = ?auto_168750 ?auto_168749 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168747 ?auto_168746 ?auto_168748 ?auto_168749 ?auto_168750 ?auto_168745 )
      ( DELIVER-5PKG-VERIFY ?auto_168746 ?auto_168747 ?auto_168748 ?auto_168749 ?auto_168750 ?auto_168745 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168797 - OBJ
      ?auto_168798 - OBJ
      ?auto_168799 - OBJ
      ?auto_168800 - OBJ
      ?auto_168801 - OBJ
      ?auto_168796 - LOCATION
    )
    :vars
    (
      ?auto_168802 - LOCATION
      ?auto_168803 - CITY
      ?auto_168807 - LOCATION
      ?auto_168804 - LOCATION
      ?auto_168805 - LOCATION
      ?auto_168806 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168802 ?auto_168803 ) ( IN-CITY ?auto_168796 ?auto_168803 ) ( not ( = ?auto_168796 ?auto_168802 ) ) ( OBJ-AT ?auto_168801 ?auto_168802 ) ( IN-CITY ?auto_168807 ?auto_168803 ) ( not ( = ?auto_168796 ?auto_168807 ) ) ( OBJ-AT ?auto_168799 ?auto_168807 ) ( IN-CITY ?auto_168804 ?auto_168803 ) ( not ( = ?auto_168796 ?auto_168804 ) ) ( OBJ-AT ?auto_168800 ?auto_168804 ) ( OBJ-AT ?auto_168797 ?auto_168802 ) ( IN-CITY ?auto_168805 ?auto_168803 ) ( not ( = ?auto_168796 ?auto_168805 ) ) ( OBJ-AT ?auto_168798 ?auto_168805 ) ( TRUCK-AT ?auto_168806 ?auto_168796 ) ( not ( = ?auto_168798 ?auto_168797 ) ) ( not ( = ?auto_168802 ?auto_168805 ) ) ( not ( = ?auto_168798 ?auto_168800 ) ) ( not ( = ?auto_168797 ?auto_168800 ) ) ( not ( = ?auto_168804 ?auto_168802 ) ) ( not ( = ?auto_168804 ?auto_168805 ) ) ( not ( = ?auto_168798 ?auto_168799 ) ) ( not ( = ?auto_168797 ?auto_168799 ) ) ( not ( = ?auto_168800 ?auto_168799 ) ) ( not ( = ?auto_168807 ?auto_168804 ) ) ( not ( = ?auto_168807 ?auto_168802 ) ) ( not ( = ?auto_168807 ?auto_168805 ) ) ( not ( = ?auto_168798 ?auto_168801 ) ) ( not ( = ?auto_168797 ?auto_168801 ) ) ( not ( = ?auto_168800 ?auto_168801 ) ) ( not ( = ?auto_168799 ?auto_168801 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168798 ?auto_168797 ?auto_168800 ?auto_168801 ?auto_168799 ?auto_168796 )
      ( DELIVER-5PKG-VERIFY ?auto_168797 ?auto_168798 ?auto_168799 ?auto_168800 ?auto_168801 ?auto_168796 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168848 - OBJ
      ?auto_168849 - OBJ
      ?auto_168850 - OBJ
      ?auto_168851 - OBJ
      ?auto_168852 - OBJ
      ?auto_168847 - LOCATION
    )
    :vars
    (
      ?auto_168853 - LOCATION
      ?auto_168854 - CITY
      ?auto_168858 - LOCATION
      ?auto_168855 - LOCATION
      ?auto_168856 - LOCATION
      ?auto_168857 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168853 ?auto_168854 ) ( IN-CITY ?auto_168847 ?auto_168854 ) ( not ( = ?auto_168847 ?auto_168853 ) ) ( OBJ-AT ?auto_168851 ?auto_168853 ) ( IN-CITY ?auto_168858 ?auto_168854 ) ( not ( = ?auto_168847 ?auto_168858 ) ) ( OBJ-AT ?auto_168850 ?auto_168858 ) ( IN-CITY ?auto_168855 ?auto_168854 ) ( not ( = ?auto_168847 ?auto_168855 ) ) ( OBJ-AT ?auto_168852 ?auto_168855 ) ( OBJ-AT ?auto_168848 ?auto_168853 ) ( IN-CITY ?auto_168856 ?auto_168854 ) ( not ( = ?auto_168847 ?auto_168856 ) ) ( OBJ-AT ?auto_168849 ?auto_168856 ) ( TRUCK-AT ?auto_168857 ?auto_168847 ) ( not ( = ?auto_168849 ?auto_168848 ) ) ( not ( = ?auto_168853 ?auto_168856 ) ) ( not ( = ?auto_168849 ?auto_168852 ) ) ( not ( = ?auto_168848 ?auto_168852 ) ) ( not ( = ?auto_168855 ?auto_168853 ) ) ( not ( = ?auto_168855 ?auto_168856 ) ) ( not ( = ?auto_168849 ?auto_168850 ) ) ( not ( = ?auto_168848 ?auto_168850 ) ) ( not ( = ?auto_168852 ?auto_168850 ) ) ( not ( = ?auto_168858 ?auto_168855 ) ) ( not ( = ?auto_168858 ?auto_168853 ) ) ( not ( = ?auto_168858 ?auto_168856 ) ) ( not ( = ?auto_168849 ?auto_168851 ) ) ( not ( = ?auto_168848 ?auto_168851 ) ) ( not ( = ?auto_168852 ?auto_168851 ) ) ( not ( = ?auto_168850 ?auto_168851 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168849 ?auto_168848 ?auto_168852 ?auto_168851 ?auto_168850 ?auto_168847 )
      ( DELIVER-5PKG-VERIFY ?auto_168848 ?auto_168849 ?auto_168850 ?auto_168851 ?auto_168852 ?auto_168847 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169061 - OBJ
      ?auto_169062 - OBJ
      ?auto_169063 - OBJ
      ?auto_169064 - OBJ
      ?auto_169065 - OBJ
      ?auto_169060 - LOCATION
    )
    :vars
    (
      ?auto_169066 - LOCATION
      ?auto_169067 - CITY
      ?auto_169071 - LOCATION
      ?auto_169068 - LOCATION
      ?auto_169069 - LOCATION
      ?auto_169070 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169066 ?auto_169067 ) ( IN-CITY ?auto_169060 ?auto_169067 ) ( not ( = ?auto_169060 ?auto_169066 ) ) ( OBJ-AT ?auto_169063 ?auto_169066 ) ( IN-CITY ?auto_169071 ?auto_169067 ) ( not ( = ?auto_169060 ?auto_169071 ) ) ( OBJ-AT ?auto_169065 ?auto_169071 ) ( IN-CITY ?auto_169068 ?auto_169067 ) ( not ( = ?auto_169060 ?auto_169068 ) ) ( OBJ-AT ?auto_169064 ?auto_169068 ) ( OBJ-AT ?auto_169061 ?auto_169066 ) ( IN-CITY ?auto_169069 ?auto_169067 ) ( not ( = ?auto_169060 ?auto_169069 ) ) ( OBJ-AT ?auto_169062 ?auto_169069 ) ( TRUCK-AT ?auto_169070 ?auto_169060 ) ( not ( = ?auto_169062 ?auto_169061 ) ) ( not ( = ?auto_169066 ?auto_169069 ) ) ( not ( = ?auto_169062 ?auto_169064 ) ) ( not ( = ?auto_169061 ?auto_169064 ) ) ( not ( = ?auto_169068 ?auto_169066 ) ) ( not ( = ?auto_169068 ?auto_169069 ) ) ( not ( = ?auto_169062 ?auto_169065 ) ) ( not ( = ?auto_169061 ?auto_169065 ) ) ( not ( = ?auto_169064 ?auto_169065 ) ) ( not ( = ?auto_169071 ?auto_169068 ) ) ( not ( = ?auto_169071 ?auto_169066 ) ) ( not ( = ?auto_169071 ?auto_169069 ) ) ( not ( = ?auto_169062 ?auto_169063 ) ) ( not ( = ?auto_169061 ?auto_169063 ) ) ( not ( = ?auto_169064 ?auto_169063 ) ) ( not ( = ?auto_169065 ?auto_169063 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169062 ?auto_169061 ?auto_169064 ?auto_169063 ?auto_169065 ?auto_169060 )
      ( DELIVER-5PKG-VERIFY ?auto_169061 ?auto_169062 ?auto_169063 ?auto_169064 ?auto_169065 ?auto_169060 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169112 - OBJ
      ?auto_169113 - OBJ
      ?auto_169114 - OBJ
      ?auto_169115 - OBJ
      ?auto_169116 - OBJ
      ?auto_169111 - LOCATION
    )
    :vars
    (
      ?auto_169117 - LOCATION
      ?auto_169118 - CITY
      ?auto_169122 - LOCATION
      ?auto_169119 - LOCATION
      ?auto_169120 - LOCATION
      ?auto_169121 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169117 ?auto_169118 ) ( IN-CITY ?auto_169111 ?auto_169118 ) ( not ( = ?auto_169111 ?auto_169117 ) ) ( OBJ-AT ?auto_169114 ?auto_169117 ) ( IN-CITY ?auto_169122 ?auto_169118 ) ( not ( = ?auto_169111 ?auto_169122 ) ) ( OBJ-AT ?auto_169115 ?auto_169122 ) ( IN-CITY ?auto_169119 ?auto_169118 ) ( not ( = ?auto_169111 ?auto_169119 ) ) ( OBJ-AT ?auto_169116 ?auto_169119 ) ( OBJ-AT ?auto_169112 ?auto_169117 ) ( IN-CITY ?auto_169120 ?auto_169118 ) ( not ( = ?auto_169111 ?auto_169120 ) ) ( OBJ-AT ?auto_169113 ?auto_169120 ) ( TRUCK-AT ?auto_169121 ?auto_169111 ) ( not ( = ?auto_169113 ?auto_169112 ) ) ( not ( = ?auto_169117 ?auto_169120 ) ) ( not ( = ?auto_169113 ?auto_169116 ) ) ( not ( = ?auto_169112 ?auto_169116 ) ) ( not ( = ?auto_169119 ?auto_169117 ) ) ( not ( = ?auto_169119 ?auto_169120 ) ) ( not ( = ?auto_169113 ?auto_169115 ) ) ( not ( = ?auto_169112 ?auto_169115 ) ) ( not ( = ?auto_169116 ?auto_169115 ) ) ( not ( = ?auto_169122 ?auto_169119 ) ) ( not ( = ?auto_169122 ?auto_169117 ) ) ( not ( = ?auto_169122 ?auto_169120 ) ) ( not ( = ?auto_169113 ?auto_169114 ) ) ( not ( = ?auto_169112 ?auto_169114 ) ) ( not ( = ?auto_169116 ?auto_169114 ) ) ( not ( = ?auto_169115 ?auto_169114 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169113 ?auto_169112 ?auto_169116 ?auto_169114 ?auto_169115 ?auto_169111 )
      ( DELIVER-5PKG-VERIFY ?auto_169112 ?auto_169113 ?auto_169114 ?auto_169115 ?auto_169116 ?auto_169111 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170100 - OBJ
      ?auto_170101 - OBJ
      ?auto_170102 - OBJ
      ?auto_170103 - OBJ
      ?auto_170104 - OBJ
      ?auto_170099 - LOCATION
    )
    :vars
    (
      ?auto_170105 - LOCATION
      ?auto_170106 - CITY
      ?auto_170110 - LOCATION
      ?auto_170107 - LOCATION
      ?auto_170108 - LOCATION
      ?auto_170109 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170105 ?auto_170106 ) ( IN-CITY ?auto_170099 ?auto_170106 ) ( not ( = ?auto_170099 ?auto_170105 ) ) ( OBJ-AT ?auto_170104 ?auto_170105 ) ( IN-CITY ?auto_170110 ?auto_170106 ) ( not ( = ?auto_170099 ?auto_170110 ) ) ( OBJ-AT ?auto_170103 ?auto_170110 ) ( IN-CITY ?auto_170107 ?auto_170106 ) ( not ( = ?auto_170099 ?auto_170107 ) ) ( OBJ-AT ?auto_170101 ?auto_170107 ) ( OBJ-AT ?auto_170100 ?auto_170105 ) ( IN-CITY ?auto_170108 ?auto_170106 ) ( not ( = ?auto_170099 ?auto_170108 ) ) ( OBJ-AT ?auto_170102 ?auto_170108 ) ( TRUCK-AT ?auto_170109 ?auto_170099 ) ( not ( = ?auto_170102 ?auto_170100 ) ) ( not ( = ?auto_170105 ?auto_170108 ) ) ( not ( = ?auto_170102 ?auto_170101 ) ) ( not ( = ?auto_170100 ?auto_170101 ) ) ( not ( = ?auto_170107 ?auto_170105 ) ) ( not ( = ?auto_170107 ?auto_170108 ) ) ( not ( = ?auto_170102 ?auto_170103 ) ) ( not ( = ?auto_170100 ?auto_170103 ) ) ( not ( = ?auto_170101 ?auto_170103 ) ) ( not ( = ?auto_170110 ?auto_170107 ) ) ( not ( = ?auto_170110 ?auto_170105 ) ) ( not ( = ?auto_170110 ?auto_170108 ) ) ( not ( = ?auto_170102 ?auto_170104 ) ) ( not ( = ?auto_170100 ?auto_170104 ) ) ( not ( = ?auto_170101 ?auto_170104 ) ) ( not ( = ?auto_170103 ?auto_170104 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170102 ?auto_170100 ?auto_170101 ?auto_170104 ?auto_170103 ?auto_170099 )
      ( DELIVER-5PKG-VERIFY ?auto_170100 ?auto_170101 ?auto_170102 ?auto_170103 ?auto_170104 ?auto_170099 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170151 - OBJ
      ?auto_170152 - OBJ
      ?auto_170153 - OBJ
      ?auto_170154 - OBJ
      ?auto_170155 - OBJ
      ?auto_170150 - LOCATION
    )
    :vars
    (
      ?auto_170156 - LOCATION
      ?auto_170157 - CITY
      ?auto_170161 - LOCATION
      ?auto_170158 - LOCATION
      ?auto_170159 - LOCATION
      ?auto_170160 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170156 ?auto_170157 ) ( IN-CITY ?auto_170150 ?auto_170157 ) ( not ( = ?auto_170150 ?auto_170156 ) ) ( OBJ-AT ?auto_170154 ?auto_170156 ) ( IN-CITY ?auto_170161 ?auto_170157 ) ( not ( = ?auto_170150 ?auto_170161 ) ) ( OBJ-AT ?auto_170155 ?auto_170161 ) ( IN-CITY ?auto_170158 ?auto_170157 ) ( not ( = ?auto_170150 ?auto_170158 ) ) ( OBJ-AT ?auto_170152 ?auto_170158 ) ( OBJ-AT ?auto_170151 ?auto_170156 ) ( IN-CITY ?auto_170159 ?auto_170157 ) ( not ( = ?auto_170150 ?auto_170159 ) ) ( OBJ-AT ?auto_170153 ?auto_170159 ) ( TRUCK-AT ?auto_170160 ?auto_170150 ) ( not ( = ?auto_170153 ?auto_170151 ) ) ( not ( = ?auto_170156 ?auto_170159 ) ) ( not ( = ?auto_170153 ?auto_170152 ) ) ( not ( = ?auto_170151 ?auto_170152 ) ) ( not ( = ?auto_170158 ?auto_170156 ) ) ( not ( = ?auto_170158 ?auto_170159 ) ) ( not ( = ?auto_170153 ?auto_170155 ) ) ( not ( = ?auto_170151 ?auto_170155 ) ) ( not ( = ?auto_170152 ?auto_170155 ) ) ( not ( = ?auto_170161 ?auto_170158 ) ) ( not ( = ?auto_170161 ?auto_170156 ) ) ( not ( = ?auto_170161 ?auto_170159 ) ) ( not ( = ?auto_170153 ?auto_170154 ) ) ( not ( = ?auto_170151 ?auto_170154 ) ) ( not ( = ?auto_170152 ?auto_170154 ) ) ( not ( = ?auto_170155 ?auto_170154 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170153 ?auto_170151 ?auto_170152 ?auto_170154 ?auto_170155 ?auto_170150 )
      ( DELIVER-5PKG-VERIFY ?auto_170151 ?auto_170152 ?auto_170153 ?auto_170154 ?auto_170155 ?auto_170150 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170420 - OBJ
      ?auto_170421 - OBJ
      ?auto_170422 - OBJ
      ?auto_170423 - OBJ
      ?auto_170424 - OBJ
      ?auto_170419 - LOCATION
    )
    :vars
    (
      ?auto_170425 - LOCATION
      ?auto_170426 - CITY
      ?auto_170430 - LOCATION
      ?auto_170427 - LOCATION
      ?auto_170428 - LOCATION
      ?auto_170429 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170425 ?auto_170426 ) ( IN-CITY ?auto_170419 ?auto_170426 ) ( not ( = ?auto_170419 ?auto_170425 ) ) ( OBJ-AT ?auto_170424 ?auto_170425 ) ( IN-CITY ?auto_170430 ?auto_170426 ) ( not ( = ?auto_170419 ?auto_170430 ) ) ( OBJ-AT ?auto_170422 ?auto_170430 ) ( IN-CITY ?auto_170427 ?auto_170426 ) ( not ( = ?auto_170419 ?auto_170427 ) ) ( OBJ-AT ?auto_170421 ?auto_170427 ) ( OBJ-AT ?auto_170420 ?auto_170425 ) ( IN-CITY ?auto_170428 ?auto_170426 ) ( not ( = ?auto_170419 ?auto_170428 ) ) ( OBJ-AT ?auto_170423 ?auto_170428 ) ( TRUCK-AT ?auto_170429 ?auto_170419 ) ( not ( = ?auto_170423 ?auto_170420 ) ) ( not ( = ?auto_170425 ?auto_170428 ) ) ( not ( = ?auto_170423 ?auto_170421 ) ) ( not ( = ?auto_170420 ?auto_170421 ) ) ( not ( = ?auto_170427 ?auto_170425 ) ) ( not ( = ?auto_170427 ?auto_170428 ) ) ( not ( = ?auto_170423 ?auto_170422 ) ) ( not ( = ?auto_170420 ?auto_170422 ) ) ( not ( = ?auto_170421 ?auto_170422 ) ) ( not ( = ?auto_170430 ?auto_170427 ) ) ( not ( = ?auto_170430 ?auto_170425 ) ) ( not ( = ?auto_170430 ?auto_170428 ) ) ( not ( = ?auto_170423 ?auto_170424 ) ) ( not ( = ?auto_170420 ?auto_170424 ) ) ( not ( = ?auto_170421 ?auto_170424 ) ) ( not ( = ?auto_170422 ?auto_170424 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170423 ?auto_170420 ?auto_170421 ?auto_170424 ?auto_170422 ?auto_170419 )
      ( DELIVER-5PKG-VERIFY ?auto_170420 ?auto_170421 ?auto_170422 ?auto_170423 ?auto_170424 ?auto_170419 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170471 - OBJ
      ?auto_170472 - OBJ
      ?auto_170473 - OBJ
      ?auto_170474 - OBJ
      ?auto_170475 - OBJ
      ?auto_170470 - LOCATION
    )
    :vars
    (
      ?auto_170476 - LOCATION
      ?auto_170477 - CITY
      ?auto_170481 - LOCATION
      ?auto_170478 - LOCATION
      ?auto_170479 - LOCATION
      ?auto_170480 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170476 ?auto_170477 ) ( IN-CITY ?auto_170470 ?auto_170477 ) ( not ( = ?auto_170470 ?auto_170476 ) ) ( OBJ-AT ?auto_170474 ?auto_170476 ) ( IN-CITY ?auto_170481 ?auto_170477 ) ( not ( = ?auto_170470 ?auto_170481 ) ) ( OBJ-AT ?auto_170473 ?auto_170481 ) ( IN-CITY ?auto_170478 ?auto_170477 ) ( not ( = ?auto_170470 ?auto_170478 ) ) ( OBJ-AT ?auto_170472 ?auto_170478 ) ( OBJ-AT ?auto_170471 ?auto_170476 ) ( IN-CITY ?auto_170479 ?auto_170477 ) ( not ( = ?auto_170470 ?auto_170479 ) ) ( OBJ-AT ?auto_170475 ?auto_170479 ) ( TRUCK-AT ?auto_170480 ?auto_170470 ) ( not ( = ?auto_170475 ?auto_170471 ) ) ( not ( = ?auto_170476 ?auto_170479 ) ) ( not ( = ?auto_170475 ?auto_170472 ) ) ( not ( = ?auto_170471 ?auto_170472 ) ) ( not ( = ?auto_170478 ?auto_170476 ) ) ( not ( = ?auto_170478 ?auto_170479 ) ) ( not ( = ?auto_170475 ?auto_170473 ) ) ( not ( = ?auto_170471 ?auto_170473 ) ) ( not ( = ?auto_170472 ?auto_170473 ) ) ( not ( = ?auto_170481 ?auto_170478 ) ) ( not ( = ?auto_170481 ?auto_170476 ) ) ( not ( = ?auto_170481 ?auto_170479 ) ) ( not ( = ?auto_170475 ?auto_170474 ) ) ( not ( = ?auto_170471 ?auto_170474 ) ) ( not ( = ?auto_170472 ?auto_170474 ) ) ( not ( = ?auto_170473 ?auto_170474 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170475 ?auto_170471 ?auto_170472 ?auto_170474 ?auto_170473 ?auto_170470 )
      ( DELIVER-5PKG-VERIFY ?auto_170471 ?auto_170472 ?auto_170473 ?auto_170474 ?auto_170475 ?auto_170470 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170574 - OBJ
      ?auto_170575 - OBJ
      ?auto_170576 - OBJ
      ?auto_170577 - OBJ
      ?auto_170578 - OBJ
      ?auto_170573 - LOCATION
    )
    :vars
    (
      ?auto_170579 - LOCATION
      ?auto_170580 - CITY
      ?auto_170584 - LOCATION
      ?auto_170581 - LOCATION
      ?auto_170582 - LOCATION
      ?auto_170583 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170579 ?auto_170580 ) ( IN-CITY ?auto_170573 ?auto_170580 ) ( not ( = ?auto_170573 ?auto_170579 ) ) ( OBJ-AT ?auto_170576 ?auto_170579 ) ( IN-CITY ?auto_170584 ?auto_170580 ) ( not ( = ?auto_170573 ?auto_170584 ) ) ( OBJ-AT ?auto_170578 ?auto_170584 ) ( IN-CITY ?auto_170581 ?auto_170580 ) ( not ( = ?auto_170573 ?auto_170581 ) ) ( OBJ-AT ?auto_170575 ?auto_170581 ) ( OBJ-AT ?auto_170574 ?auto_170579 ) ( IN-CITY ?auto_170582 ?auto_170580 ) ( not ( = ?auto_170573 ?auto_170582 ) ) ( OBJ-AT ?auto_170577 ?auto_170582 ) ( TRUCK-AT ?auto_170583 ?auto_170573 ) ( not ( = ?auto_170577 ?auto_170574 ) ) ( not ( = ?auto_170579 ?auto_170582 ) ) ( not ( = ?auto_170577 ?auto_170575 ) ) ( not ( = ?auto_170574 ?auto_170575 ) ) ( not ( = ?auto_170581 ?auto_170579 ) ) ( not ( = ?auto_170581 ?auto_170582 ) ) ( not ( = ?auto_170577 ?auto_170578 ) ) ( not ( = ?auto_170574 ?auto_170578 ) ) ( not ( = ?auto_170575 ?auto_170578 ) ) ( not ( = ?auto_170584 ?auto_170581 ) ) ( not ( = ?auto_170584 ?auto_170579 ) ) ( not ( = ?auto_170584 ?auto_170582 ) ) ( not ( = ?auto_170577 ?auto_170576 ) ) ( not ( = ?auto_170574 ?auto_170576 ) ) ( not ( = ?auto_170575 ?auto_170576 ) ) ( not ( = ?auto_170578 ?auto_170576 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170577 ?auto_170574 ?auto_170575 ?auto_170576 ?auto_170578 ?auto_170573 )
      ( DELIVER-5PKG-VERIFY ?auto_170574 ?auto_170575 ?auto_170576 ?auto_170577 ?auto_170578 ?auto_170573 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170735 - OBJ
      ?auto_170736 - OBJ
      ?auto_170737 - OBJ
      ?auto_170738 - OBJ
      ?auto_170739 - OBJ
      ?auto_170734 - LOCATION
    )
    :vars
    (
      ?auto_170740 - LOCATION
      ?auto_170741 - CITY
      ?auto_170745 - LOCATION
      ?auto_170742 - LOCATION
      ?auto_170743 - LOCATION
      ?auto_170744 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170740 ?auto_170741 ) ( IN-CITY ?auto_170734 ?auto_170741 ) ( not ( = ?auto_170734 ?auto_170740 ) ) ( OBJ-AT ?auto_170737 ?auto_170740 ) ( IN-CITY ?auto_170745 ?auto_170741 ) ( not ( = ?auto_170734 ?auto_170745 ) ) ( OBJ-AT ?auto_170738 ?auto_170745 ) ( IN-CITY ?auto_170742 ?auto_170741 ) ( not ( = ?auto_170734 ?auto_170742 ) ) ( OBJ-AT ?auto_170736 ?auto_170742 ) ( OBJ-AT ?auto_170735 ?auto_170740 ) ( IN-CITY ?auto_170743 ?auto_170741 ) ( not ( = ?auto_170734 ?auto_170743 ) ) ( OBJ-AT ?auto_170739 ?auto_170743 ) ( TRUCK-AT ?auto_170744 ?auto_170734 ) ( not ( = ?auto_170739 ?auto_170735 ) ) ( not ( = ?auto_170740 ?auto_170743 ) ) ( not ( = ?auto_170739 ?auto_170736 ) ) ( not ( = ?auto_170735 ?auto_170736 ) ) ( not ( = ?auto_170742 ?auto_170740 ) ) ( not ( = ?auto_170742 ?auto_170743 ) ) ( not ( = ?auto_170739 ?auto_170738 ) ) ( not ( = ?auto_170735 ?auto_170738 ) ) ( not ( = ?auto_170736 ?auto_170738 ) ) ( not ( = ?auto_170745 ?auto_170742 ) ) ( not ( = ?auto_170745 ?auto_170740 ) ) ( not ( = ?auto_170745 ?auto_170743 ) ) ( not ( = ?auto_170739 ?auto_170737 ) ) ( not ( = ?auto_170735 ?auto_170737 ) ) ( not ( = ?auto_170736 ?auto_170737 ) ) ( not ( = ?auto_170738 ?auto_170737 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170739 ?auto_170735 ?auto_170736 ?auto_170737 ?auto_170738 ?auto_170734 )
      ( DELIVER-5PKG-VERIFY ?auto_170735 ?auto_170736 ?auto_170737 ?auto_170738 ?auto_170739 ?auto_170734 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170893 - OBJ
      ?auto_170894 - OBJ
      ?auto_170895 - OBJ
      ?auto_170896 - OBJ
      ?auto_170897 - OBJ
      ?auto_170892 - LOCATION
    )
    :vars
    (
      ?auto_170898 - LOCATION
      ?auto_170899 - CITY
      ?auto_170903 - LOCATION
      ?auto_170900 - LOCATION
      ?auto_170901 - LOCATION
      ?auto_170902 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170898 ?auto_170899 ) ( IN-CITY ?auto_170892 ?auto_170899 ) ( not ( = ?auto_170892 ?auto_170898 ) ) ( OBJ-AT ?auto_170897 ?auto_170898 ) ( IN-CITY ?auto_170903 ?auto_170899 ) ( not ( = ?auto_170892 ?auto_170903 ) ) ( OBJ-AT ?auto_170894 ?auto_170903 ) ( IN-CITY ?auto_170900 ?auto_170899 ) ( not ( = ?auto_170892 ?auto_170900 ) ) ( OBJ-AT ?auto_170896 ?auto_170900 ) ( OBJ-AT ?auto_170893 ?auto_170898 ) ( IN-CITY ?auto_170901 ?auto_170899 ) ( not ( = ?auto_170892 ?auto_170901 ) ) ( OBJ-AT ?auto_170895 ?auto_170901 ) ( TRUCK-AT ?auto_170902 ?auto_170892 ) ( not ( = ?auto_170895 ?auto_170893 ) ) ( not ( = ?auto_170898 ?auto_170901 ) ) ( not ( = ?auto_170895 ?auto_170896 ) ) ( not ( = ?auto_170893 ?auto_170896 ) ) ( not ( = ?auto_170900 ?auto_170898 ) ) ( not ( = ?auto_170900 ?auto_170901 ) ) ( not ( = ?auto_170895 ?auto_170894 ) ) ( not ( = ?auto_170893 ?auto_170894 ) ) ( not ( = ?auto_170896 ?auto_170894 ) ) ( not ( = ?auto_170903 ?auto_170900 ) ) ( not ( = ?auto_170903 ?auto_170898 ) ) ( not ( = ?auto_170903 ?auto_170901 ) ) ( not ( = ?auto_170895 ?auto_170897 ) ) ( not ( = ?auto_170893 ?auto_170897 ) ) ( not ( = ?auto_170896 ?auto_170897 ) ) ( not ( = ?auto_170894 ?auto_170897 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170895 ?auto_170893 ?auto_170896 ?auto_170897 ?auto_170894 ?auto_170892 )
      ( DELIVER-5PKG-VERIFY ?auto_170893 ?auto_170894 ?auto_170895 ?auto_170896 ?auto_170897 ?auto_170892 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170944 - OBJ
      ?auto_170945 - OBJ
      ?auto_170946 - OBJ
      ?auto_170947 - OBJ
      ?auto_170948 - OBJ
      ?auto_170943 - LOCATION
    )
    :vars
    (
      ?auto_170949 - LOCATION
      ?auto_170950 - CITY
      ?auto_170954 - LOCATION
      ?auto_170951 - LOCATION
      ?auto_170952 - LOCATION
      ?auto_170953 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170949 ?auto_170950 ) ( IN-CITY ?auto_170943 ?auto_170950 ) ( not ( = ?auto_170943 ?auto_170949 ) ) ( OBJ-AT ?auto_170947 ?auto_170949 ) ( IN-CITY ?auto_170954 ?auto_170950 ) ( not ( = ?auto_170943 ?auto_170954 ) ) ( OBJ-AT ?auto_170945 ?auto_170954 ) ( IN-CITY ?auto_170951 ?auto_170950 ) ( not ( = ?auto_170943 ?auto_170951 ) ) ( OBJ-AT ?auto_170948 ?auto_170951 ) ( OBJ-AT ?auto_170944 ?auto_170949 ) ( IN-CITY ?auto_170952 ?auto_170950 ) ( not ( = ?auto_170943 ?auto_170952 ) ) ( OBJ-AT ?auto_170946 ?auto_170952 ) ( TRUCK-AT ?auto_170953 ?auto_170943 ) ( not ( = ?auto_170946 ?auto_170944 ) ) ( not ( = ?auto_170949 ?auto_170952 ) ) ( not ( = ?auto_170946 ?auto_170948 ) ) ( not ( = ?auto_170944 ?auto_170948 ) ) ( not ( = ?auto_170951 ?auto_170949 ) ) ( not ( = ?auto_170951 ?auto_170952 ) ) ( not ( = ?auto_170946 ?auto_170945 ) ) ( not ( = ?auto_170944 ?auto_170945 ) ) ( not ( = ?auto_170948 ?auto_170945 ) ) ( not ( = ?auto_170954 ?auto_170951 ) ) ( not ( = ?auto_170954 ?auto_170949 ) ) ( not ( = ?auto_170954 ?auto_170952 ) ) ( not ( = ?auto_170946 ?auto_170947 ) ) ( not ( = ?auto_170944 ?auto_170947 ) ) ( not ( = ?auto_170948 ?auto_170947 ) ) ( not ( = ?auto_170945 ?auto_170947 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170946 ?auto_170944 ?auto_170948 ?auto_170947 ?auto_170945 ?auto_170943 )
      ( DELIVER-5PKG-VERIFY ?auto_170944 ?auto_170945 ?auto_170946 ?auto_170947 ?auto_170948 ?auto_170943 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171104 - OBJ
      ?auto_171105 - OBJ
      ?auto_171106 - OBJ
      ?auto_171107 - OBJ
      ?auto_171108 - OBJ
      ?auto_171103 - LOCATION
    )
    :vars
    (
      ?auto_171109 - LOCATION
      ?auto_171110 - CITY
      ?auto_171114 - LOCATION
      ?auto_171111 - LOCATION
      ?auto_171112 - LOCATION
      ?auto_171113 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171109 ?auto_171110 ) ( IN-CITY ?auto_171103 ?auto_171110 ) ( not ( = ?auto_171103 ?auto_171109 ) ) ( OBJ-AT ?auto_171108 ?auto_171109 ) ( IN-CITY ?auto_171114 ?auto_171110 ) ( not ( = ?auto_171103 ?auto_171114 ) ) ( OBJ-AT ?auto_171105 ?auto_171114 ) ( IN-CITY ?auto_171111 ?auto_171110 ) ( not ( = ?auto_171103 ?auto_171111 ) ) ( OBJ-AT ?auto_171106 ?auto_171111 ) ( OBJ-AT ?auto_171104 ?auto_171109 ) ( IN-CITY ?auto_171112 ?auto_171110 ) ( not ( = ?auto_171103 ?auto_171112 ) ) ( OBJ-AT ?auto_171107 ?auto_171112 ) ( TRUCK-AT ?auto_171113 ?auto_171103 ) ( not ( = ?auto_171107 ?auto_171104 ) ) ( not ( = ?auto_171109 ?auto_171112 ) ) ( not ( = ?auto_171107 ?auto_171106 ) ) ( not ( = ?auto_171104 ?auto_171106 ) ) ( not ( = ?auto_171111 ?auto_171109 ) ) ( not ( = ?auto_171111 ?auto_171112 ) ) ( not ( = ?auto_171107 ?auto_171105 ) ) ( not ( = ?auto_171104 ?auto_171105 ) ) ( not ( = ?auto_171106 ?auto_171105 ) ) ( not ( = ?auto_171114 ?auto_171111 ) ) ( not ( = ?auto_171114 ?auto_171109 ) ) ( not ( = ?auto_171114 ?auto_171112 ) ) ( not ( = ?auto_171107 ?auto_171108 ) ) ( not ( = ?auto_171104 ?auto_171108 ) ) ( not ( = ?auto_171106 ?auto_171108 ) ) ( not ( = ?auto_171105 ?auto_171108 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171107 ?auto_171104 ?auto_171106 ?auto_171108 ?auto_171105 ?auto_171103 )
      ( DELIVER-5PKG-VERIFY ?auto_171104 ?auto_171105 ?auto_171106 ?auto_171107 ?auto_171108 ?auto_171103 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171155 - OBJ
      ?auto_171156 - OBJ
      ?auto_171157 - OBJ
      ?auto_171158 - OBJ
      ?auto_171159 - OBJ
      ?auto_171154 - LOCATION
    )
    :vars
    (
      ?auto_171160 - LOCATION
      ?auto_171161 - CITY
      ?auto_171165 - LOCATION
      ?auto_171162 - LOCATION
      ?auto_171163 - LOCATION
      ?auto_171164 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171160 ?auto_171161 ) ( IN-CITY ?auto_171154 ?auto_171161 ) ( not ( = ?auto_171154 ?auto_171160 ) ) ( OBJ-AT ?auto_171158 ?auto_171160 ) ( IN-CITY ?auto_171165 ?auto_171161 ) ( not ( = ?auto_171154 ?auto_171165 ) ) ( OBJ-AT ?auto_171156 ?auto_171165 ) ( IN-CITY ?auto_171162 ?auto_171161 ) ( not ( = ?auto_171154 ?auto_171162 ) ) ( OBJ-AT ?auto_171157 ?auto_171162 ) ( OBJ-AT ?auto_171155 ?auto_171160 ) ( IN-CITY ?auto_171163 ?auto_171161 ) ( not ( = ?auto_171154 ?auto_171163 ) ) ( OBJ-AT ?auto_171159 ?auto_171163 ) ( TRUCK-AT ?auto_171164 ?auto_171154 ) ( not ( = ?auto_171159 ?auto_171155 ) ) ( not ( = ?auto_171160 ?auto_171163 ) ) ( not ( = ?auto_171159 ?auto_171157 ) ) ( not ( = ?auto_171155 ?auto_171157 ) ) ( not ( = ?auto_171162 ?auto_171160 ) ) ( not ( = ?auto_171162 ?auto_171163 ) ) ( not ( = ?auto_171159 ?auto_171156 ) ) ( not ( = ?auto_171155 ?auto_171156 ) ) ( not ( = ?auto_171157 ?auto_171156 ) ) ( not ( = ?auto_171165 ?auto_171162 ) ) ( not ( = ?auto_171165 ?auto_171160 ) ) ( not ( = ?auto_171165 ?auto_171163 ) ) ( not ( = ?auto_171159 ?auto_171158 ) ) ( not ( = ?auto_171155 ?auto_171158 ) ) ( not ( = ?auto_171157 ?auto_171158 ) ) ( not ( = ?auto_171156 ?auto_171158 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171159 ?auto_171155 ?auto_171157 ?auto_171158 ?auto_171156 ?auto_171154 )
      ( DELIVER-5PKG-VERIFY ?auto_171155 ?auto_171156 ?auto_171157 ?auto_171158 ?auto_171159 ?auto_171154 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171367 - OBJ
      ?auto_171368 - OBJ
      ?auto_171369 - OBJ
      ?auto_171370 - OBJ
      ?auto_171371 - OBJ
      ?auto_171366 - LOCATION
    )
    :vars
    (
      ?auto_171372 - LOCATION
      ?auto_171373 - CITY
      ?auto_171377 - LOCATION
      ?auto_171374 - LOCATION
      ?auto_171375 - LOCATION
      ?auto_171376 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171372 ?auto_171373 ) ( IN-CITY ?auto_171366 ?auto_171373 ) ( not ( = ?auto_171366 ?auto_171372 ) ) ( OBJ-AT ?auto_171369 ?auto_171372 ) ( IN-CITY ?auto_171377 ?auto_171373 ) ( not ( = ?auto_171366 ?auto_171377 ) ) ( OBJ-AT ?auto_171368 ?auto_171377 ) ( IN-CITY ?auto_171374 ?auto_171373 ) ( not ( = ?auto_171366 ?auto_171374 ) ) ( OBJ-AT ?auto_171371 ?auto_171374 ) ( OBJ-AT ?auto_171367 ?auto_171372 ) ( IN-CITY ?auto_171375 ?auto_171373 ) ( not ( = ?auto_171366 ?auto_171375 ) ) ( OBJ-AT ?auto_171370 ?auto_171375 ) ( TRUCK-AT ?auto_171376 ?auto_171366 ) ( not ( = ?auto_171370 ?auto_171367 ) ) ( not ( = ?auto_171372 ?auto_171375 ) ) ( not ( = ?auto_171370 ?auto_171371 ) ) ( not ( = ?auto_171367 ?auto_171371 ) ) ( not ( = ?auto_171374 ?auto_171372 ) ) ( not ( = ?auto_171374 ?auto_171375 ) ) ( not ( = ?auto_171370 ?auto_171368 ) ) ( not ( = ?auto_171367 ?auto_171368 ) ) ( not ( = ?auto_171371 ?auto_171368 ) ) ( not ( = ?auto_171377 ?auto_171374 ) ) ( not ( = ?auto_171377 ?auto_171372 ) ) ( not ( = ?auto_171377 ?auto_171375 ) ) ( not ( = ?auto_171370 ?auto_171369 ) ) ( not ( = ?auto_171367 ?auto_171369 ) ) ( not ( = ?auto_171371 ?auto_171369 ) ) ( not ( = ?auto_171368 ?auto_171369 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171370 ?auto_171367 ?auto_171371 ?auto_171369 ?auto_171368 ?auto_171366 )
      ( DELIVER-5PKG-VERIFY ?auto_171367 ?auto_171368 ?auto_171369 ?auto_171370 ?auto_171371 ?auto_171366 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171473 - OBJ
      ?auto_171474 - OBJ
      ?auto_171475 - OBJ
      ?auto_171476 - OBJ
      ?auto_171477 - OBJ
      ?auto_171472 - LOCATION
    )
    :vars
    (
      ?auto_171478 - LOCATION
      ?auto_171479 - CITY
      ?auto_171483 - LOCATION
      ?auto_171480 - LOCATION
      ?auto_171481 - LOCATION
      ?auto_171482 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171478 ?auto_171479 ) ( IN-CITY ?auto_171472 ?auto_171479 ) ( not ( = ?auto_171472 ?auto_171478 ) ) ( OBJ-AT ?auto_171475 ?auto_171478 ) ( IN-CITY ?auto_171483 ?auto_171479 ) ( not ( = ?auto_171472 ?auto_171483 ) ) ( OBJ-AT ?auto_171474 ?auto_171483 ) ( IN-CITY ?auto_171480 ?auto_171479 ) ( not ( = ?auto_171472 ?auto_171480 ) ) ( OBJ-AT ?auto_171476 ?auto_171480 ) ( OBJ-AT ?auto_171473 ?auto_171478 ) ( IN-CITY ?auto_171481 ?auto_171479 ) ( not ( = ?auto_171472 ?auto_171481 ) ) ( OBJ-AT ?auto_171477 ?auto_171481 ) ( TRUCK-AT ?auto_171482 ?auto_171472 ) ( not ( = ?auto_171477 ?auto_171473 ) ) ( not ( = ?auto_171478 ?auto_171481 ) ) ( not ( = ?auto_171477 ?auto_171476 ) ) ( not ( = ?auto_171473 ?auto_171476 ) ) ( not ( = ?auto_171480 ?auto_171478 ) ) ( not ( = ?auto_171480 ?auto_171481 ) ) ( not ( = ?auto_171477 ?auto_171474 ) ) ( not ( = ?auto_171473 ?auto_171474 ) ) ( not ( = ?auto_171476 ?auto_171474 ) ) ( not ( = ?auto_171483 ?auto_171480 ) ) ( not ( = ?auto_171483 ?auto_171478 ) ) ( not ( = ?auto_171483 ?auto_171481 ) ) ( not ( = ?auto_171477 ?auto_171475 ) ) ( not ( = ?auto_171473 ?auto_171475 ) ) ( not ( = ?auto_171476 ?auto_171475 ) ) ( not ( = ?auto_171474 ?auto_171475 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171477 ?auto_171473 ?auto_171476 ?auto_171475 ?auto_171474 ?auto_171472 )
      ( DELIVER-5PKG-VERIFY ?auto_171473 ?auto_171474 ?auto_171475 ?auto_171476 ?auto_171477 ?auto_171472 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171848 - OBJ
      ?auto_171849 - OBJ
      ?auto_171850 - OBJ
      ?auto_171851 - OBJ
      ?auto_171852 - OBJ
      ?auto_171847 - LOCATION
    )
    :vars
    (
      ?auto_171853 - LOCATION
      ?auto_171854 - CITY
      ?auto_171858 - LOCATION
      ?auto_171855 - LOCATION
      ?auto_171856 - LOCATION
      ?auto_171857 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171853 ?auto_171854 ) ( IN-CITY ?auto_171847 ?auto_171854 ) ( not ( = ?auto_171847 ?auto_171853 ) ) ( OBJ-AT ?auto_171849 ?auto_171853 ) ( IN-CITY ?auto_171858 ?auto_171854 ) ( not ( = ?auto_171847 ?auto_171858 ) ) ( OBJ-AT ?auto_171852 ?auto_171858 ) ( IN-CITY ?auto_171855 ?auto_171854 ) ( not ( = ?auto_171847 ?auto_171855 ) ) ( OBJ-AT ?auto_171851 ?auto_171855 ) ( OBJ-AT ?auto_171848 ?auto_171853 ) ( IN-CITY ?auto_171856 ?auto_171854 ) ( not ( = ?auto_171847 ?auto_171856 ) ) ( OBJ-AT ?auto_171850 ?auto_171856 ) ( TRUCK-AT ?auto_171857 ?auto_171847 ) ( not ( = ?auto_171850 ?auto_171848 ) ) ( not ( = ?auto_171853 ?auto_171856 ) ) ( not ( = ?auto_171850 ?auto_171851 ) ) ( not ( = ?auto_171848 ?auto_171851 ) ) ( not ( = ?auto_171855 ?auto_171853 ) ) ( not ( = ?auto_171855 ?auto_171856 ) ) ( not ( = ?auto_171850 ?auto_171852 ) ) ( not ( = ?auto_171848 ?auto_171852 ) ) ( not ( = ?auto_171851 ?auto_171852 ) ) ( not ( = ?auto_171858 ?auto_171855 ) ) ( not ( = ?auto_171858 ?auto_171853 ) ) ( not ( = ?auto_171858 ?auto_171856 ) ) ( not ( = ?auto_171850 ?auto_171849 ) ) ( not ( = ?auto_171848 ?auto_171849 ) ) ( not ( = ?auto_171851 ?auto_171849 ) ) ( not ( = ?auto_171852 ?auto_171849 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171850 ?auto_171848 ?auto_171851 ?auto_171849 ?auto_171852 ?auto_171847 )
      ( DELIVER-5PKG-VERIFY ?auto_171848 ?auto_171849 ?auto_171850 ?auto_171851 ?auto_171852 ?auto_171847 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171899 - OBJ
      ?auto_171900 - OBJ
      ?auto_171901 - OBJ
      ?auto_171902 - OBJ
      ?auto_171903 - OBJ
      ?auto_171898 - LOCATION
    )
    :vars
    (
      ?auto_171904 - LOCATION
      ?auto_171905 - CITY
      ?auto_171909 - LOCATION
      ?auto_171906 - LOCATION
      ?auto_171907 - LOCATION
      ?auto_171908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171904 ?auto_171905 ) ( IN-CITY ?auto_171898 ?auto_171905 ) ( not ( = ?auto_171898 ?auto_171904 ) ) ( OBJ-AT ?auto_171900 ?auto_171904 ) ( IN-CITY ?auto_171909 ?auto_171905 ) ( not ( = ?auto_171898 ?auto_171909 ) ) ( OBJ-AT ?auto_171902 ?auto_171909 ) ( IN-CITY ?auto_171906 ?auto_171905 ) ( not ( = ?auto_171898 ?auto_171906 ) ) ( OBJ-AT ?auto_171903 ?auto_171906 ) ( OBJ-AT ?auto_171899 ?auto_171904 ) ( IN-CITY ?auto_171907 ?auto_171905 ) ( not ( = ?auto_171898 ?auto_171907 ) ) ( OBJ-AT ?auto_171901 ?auto_171907 ) ( TRUCK-AT ?auto_171908 ?auto_171898 ) ( not ( = ?auto_171901 ?auto_171899 ) ) ( not ( = ?auto_171904 ?auto_171907 ) ) ( not ( = ?auto_171901 ?auto_171903 ) ) ( not ( = ?auto_171899 ?auto_171903 ) ) ( not ( = ?auto_171906 ?auto_171904 ) ) ( not ( = ?auto_171906 ?auto_171907 ) ) ( not ( = ?auto_171901 ?auto_171902 ) ) ( not ( = ?auto_171899 ?auto_171902 ) ) ( not ( = ?auto_171903 ?auto_171902 ) ) ( not ( = ?auto_171909 ?auto_171906 ) ) ( not ( = ?auto_171909 ?auto_171904 ) ) ( not ( = ?auto_171909 ?auto_171907 ) ) ( not ( = ?auto_171901 ?auto_171900 ) ) ( not ( = ?auto_171899 ?auto_171900 ) ) ( not ( = ?auto_171903 ?auto_171900 ) ) ( not ( = ?auto_171902 ?auto_171900 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171901 ?auto_171899 ?auto_171903 ?auto_171900 ?auto_171902 ?auto_171898 )
      ( DELIVER-5PKG-VERIFY ?auto_171899 ?auto_171900 ?auto_171901 ?auto_171902 ?auto_171903 ?auto_171898 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172392 - OBJ
      ?auto_172393 - OBJ
      ?auto_172394 - OBJ
      ?auto_172395 - OBJ
      ?auto_172396 - OBJ
      ?auto_172391 - LOCATION
    )
    :vars
    (
      ?auto_172397 - LOCATION
      ?auto_172398 - CITY
      ?auto_172402 - LOCATION
      ?auto_172399 - LOCATION
      ?auto_172400 - LOCATION
      ?auto_172401 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172397 ?auto_172398 ) ( IN-CITY ?auto_172391 ?auto_172398 ) ( not ( = ?auto_172391 ?auto_172397 ) ) ( OBJ-AT ?auto_172393 ?auto_172397 ) ( IN-CITY ?auto_172402 ?auto_172398 ) ( not ( = ?auto_172391 ?auto_172402 ) ) ( OBJ-AT ?auto_172396 ?auto_172402 ) ( IN-CITY ?auto_172399 ?auto_172398 ) ( not ( = ?auto_172391 ?auto_172399 ) ) ( OBJ-AT ?auto_172394 ?auto_172399 ) ( OBJ-AT ?auto_172392 ?auto_172397 ) ( IN-CITY ?auto_172400 ?auto_172398 ) ( not ( = ?auto_172391 ?auto_172400 ) ) ( OBJ-AT ?auto_172395 ?auto_172400 ) ( TRUCK-AT ?auto_172401 ?auto_172391 ) ( not ( = ?auto_172395 ?auto_172392 ) ) ( not ( = ?auto_172397 ?auto_172400 ) ) ( not ( = ?auto_172395 ?auto_172394 ) ) ( not ( = ?auto_172392 ?auto_172394 ) ) ( not ( = ?auto_172399 ?auto_172397 ) ) ( not ( = ?auto_172399 ?auto_172400 ) ) ( not ( = ?auto_172395 ?auto_172396 ) ) ( not ( = ?auto_172392 ?auto_172396 ) ) ( not ( = ?auto_172394 ?auto_172396 ) ) ( not ( = ?auto_172402 ?auto_172399 ) ) ( not ( = ?auto_172402 ?auto_172397 ) ) ( not ( = ?auto_172402 ?auto_172400 ) ) ( not ( = ?auto_172395 ?auto_172393 ) ) ( not ( = ?auto_172392 ?auto_172393 ) ) ( not ( = ?auto_172394 ?auto_172393 ) ) ( not ( = ?auto_172396 ?auto_172393 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172395 ?auto_172392 ?auto_172394 ?auto_172393 ?auto_172396 ?auto_172391 )
      ( DELIVER-5PKG-VERIFY ?auto_172392 ?auto_172393 ?auto_172394 ?auto_172395 ?auto_172396 ?auto_172391 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172553 - OBJ
      ?auto_172554 - OBJ
      ?auto_172555 - OBJ
      ?auto_172556 - OBJ
      ?auto_172557 - OBJ
      ?auto_172552 - LOCATION
    )
    :vars
    (
      ?auto_172558 - LOCATION
      ?auto_172559 - CITY
      ?auto_172563 - LOCATION
      ?auto_172560 - LOCATION
      ?auto_172561 - LOCATION
      ?auto_172562 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172558 ?auto_172559 ) ( IN-CITY ?auto_172552 ?auto_172559 ) ( not ( = ?auto_172552 ?auto_172558 ) ) ( OBJ-AT ?auto_172554 ?auto_172558 ) ( IN-CITY ?auto_172563 ?auto_172559 ) ( not ( = ?auto_172552 ?auto_172563 ) ) ( OBJ-AT ?auto_172556 ?auto_172563 ) ( IN-CITY ?auto_172560 ?auto_172559 ) ( not ( = ?auto_172552 ?auto_172560 ) ) ( OBJ-AT ?auto_172555 ?auto_172560 ) ( OBJ-AT ?auto_172553 ?auto_172558 ) ( IN-CITY ?auto_172561 ?auto_172559 ) ( not ( = ?auto_172552 ?auto_172561 ) ) ( OBJ-AT ?auto_172557 ?auto_172561 ) ( TRUCK-AT ?auto_172562 ?auto_172552 ) ( not ( = ?auto_172557 ?auto_172553 ) ) ( not ( = ?auto_172558 ?auto_172561 ) ) ( not ( = ?auto_172557 ?auto_172555 ) ) ( not ( = ?auto_172553 ?auto_172555 ) ) ( not ( = ?auto_172560 ?auto_172558 ) ) ( not ( = ?auto_172560 ?auto_172561 ) ) ( not ( = ?auto_172557 ?auto_172556 ) ) ( not ( = ?auto_172553 ?auto_172556 ) ) ( not ( = ?auto_172555 ?auto_172556 ) ) ( not ( = ?auto_172563 ?auto_172560 ) ) ( not ( = ?auto_172563 ?auto_172558 ) ) ( not ( = ?auto_172563 ?auto_172561 ) ) ( not ( = ?auto_172557 ?auto_172554 ) ) ( not ( = ?auto_172553 ?auto_172554 ) ) ( not ( = ?auto_172555 ?auto_172554 ) ) ( not ( = ?auto_172556 ?auto_172554 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172557 ?auto_172553 ?auto_172555 ?auto_172554 ?auto_172556 ?auto_172552 )
      ( DELIVER-5PKG-VERIFY ?auto_172553 ?auto_172554 ?auto_172555 ?auto_172556 ?auto_172557 ?auto_172552 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172711 - OBJ
      ?auto_172712 - OBJ
      ?auto_172713 - OBJ
      ?auto_172714 - OBJ
      ?auto_172715 - OBJ
      ?auto_172710 - LOCATION
    )
    :vars
    (
      ?auto_172716 - LOCATION
      ?auto_172717 - CITY
      ?auto_172721 - LOCATION
      ?auto_172718 - LOCATION
      ?auto_172719 - LOCATION
      ?auto_172720 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172716 ?auto_172717 ) ( IN-CITY ?auto_172710 ?auto_172717 ) ( not ( = ?auto_172710 ?auto_172716 ) ) ( OBJ-AT ?auto_172712 ?auto_172716 ) ( IN-CITY ?auto_172721 ?auto_172717 ) ( not ( = ?auto_172710 ?auto_172721 ) ) ( OBJ-AT ?auto_172713 ?auto_172721 ) ( IN-CITY ?auto_172718 ?auto_172717 ) ( not ( = ?auto_172710 ?auto_172718 ) ) ( OBJ-AT ?auto_172715 ?auto_172718 ) ( OBJ-AT ?auto_172711 ?auto_172716 ) ( IN-CITY ?auto_172719 ?auto_172717 ) ( not ( = ?auto_172710 ?auto_172719 ) ) ( OBJ-AT ?auto_172714 ?auto_172719 ) ( TRUCK-AT ?auto_172720 ?auto_172710 ) ( not ( = ?auto_172714 ?auto_172711 ) ) ( not ( = ?auto_172716 ?auto_172719 ) ) ( not ( = ?auto_172714 ?auto_172715 ) ) ( not ( = ?auto_172711 ?auto_172715 ) ) ( not ( = ?auto_172718 ?auto_172716 ) ) ( not ( = ?auto_172718 ?auto_172719 ) ) ( not ( = ?auto_172714 ?auto_172713 ) ) ( not ( = ?auto_172711 ?auto_172713 ) ) ( not ( = ?auto_172715 ?auto_172713 ) ) ( not ( = ?auto_172721 ?auto_172718 ) ) ( not ( = ?auto_172721 ?auto_172716 ) ) ( not ( = ?auto_172721 ?auto_172719 ) ) ( not ( = ?auto_172714 ?auto_172712 ) ) ( not ( = ?auto_172711 ?auto_172712 ) ) ( not ( = ?auto_172715 ?auto_172712 ) ) ( not ( = ?auto_172713 ?auto_172712 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172714 ?auto_172711 ?auto_172715 ?auto_172712 ?auto_172713 ?auto_172710 )
      ( DELIVER-5PKG-VERIFY ?auto_172711 ?auto_172712 ?auto_172713 ?auto_172714 ?auto_172715 ?auto_172710 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172817 - OBJ
      ?auto_172818 - OBJ
      ?auto_172819 - OBJ
      ?auto_172820 - OBJ
      ?auto_172821 - OBJ
      ?auto_172816 - LOCATION
    )
    :vars
    (
      ?auto_172822 - LOCATION
      ?auto_172823 - CITY
      ?auto_172827 - LOCATION
      ?auto_172824 - LOCATION
      ?auto_172825 - LOCATION
      ?auto_172826 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172822 ?auto_172823 ) ( IN-CITY ?auto_172816 ?auto_172823 ) ( not ( = ?auto_172816 ?auto_172822 ) ) ( OBJ-AT ?auto_172818 ?auto_172822 ) ( IN-CITY ?auto_172827 ?auto_172823 ) ( not ( = ?auto_172816 ?auto_172827 ) ) ( OBJ-AT ?auto_172819 ?auto_172827 ) ( IN-CITY ?auto_172824 ?auto_172823 ) ( not ( = ?auto_172816 ?auto_172824 ) ) ( OBJ-AT ?auto_172820 ?auto_172824 ) ( OBJ-AT ?auto_172817 ?auto_172822 ) ( IN-CITY ?auto_172825 ?auto_172823 ) ( not ( = ?auto_172816 ?auto_172825 ) ) ( OBJ-AT ?auto_172821 ?auto_172825 ) ( TRUCK-AT ?auto_172826 ?auto_172816 ) ( not ( = ?auto_172821 ?auto_172817 ) ) ( not ( = ?auto_172822 ?auto_172825 ) ) ( not ( = ?auto_172821 ?auto_172820 ) ) ( not ( = ?auto_172817 ?auto_172820 ) ) ( not ( = ?auto_172824 ?auto_172822 ) ) ( not ( = ?auto_172824 ?auto_172825 ) ) ( not ( = ?auto_172821 ?auto_172819 ) ) ( not ( = ?auto_172817 ?auto_172819 ) ) ( not ( = ?auto_172820 ?auto_172819 ) ) ( not ( = ?auto_172827 ?auto_172824 ) ) ( not ( = ?auto_172827 ?auto_172822 ) ) ( not ( = ?auto_172827 ?auto_172825 ) ) ( not ( = ?auto_172821 ?auto_172818 ) ) ( not ( = ?auto_172817 ?auto_172818 ) ) ( not ( = ?auto_172820 ?auto_172818 ) ) ( not ( = ?auto_172819 ?auto_172818 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172821 ?auto_172817 ?auto_172820 ?auto_172818 ?auto_172819 ?auto_172816 )
      ( DELIVER-5PKG-VERIFY ?auto_172817 ?auto_172818 ?auto_172819 ?auto_172820 ?auto_172821 ?auto_172816 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173526 - OBJ
      ?auto_173527 - OBJ
      ?auto_173528 - OBJ
      ?auto_173529 - OBJ
      ?auto_173530 - OBJ
      ?auto_173525 - LOCATION
    )
    :vars
    (
      ?auto_173531 - LOCATION
      ?auto_173532 - CITY
      ?auto_173536 - LOCATION
      ?auto_173533 - LOCATION
      ?auto_173534 - LOCATION
      ?auto_173535 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173531 ?auto_173532 ) ( IN-CITY ?auto_173525 ?auto_173532 ) ( not ( = ?auto_173525 ?auto_173531 ) ) ( OBJ-AT ?auto_173530 ?auto_173531 ) ( IN-CITY ?auto_173536 ?auto_173532 ) ( not ( = ?auto_173525 ?auto_173536 ) ) ( OBJ-AT ?auto_173529 ?auto_173536 ) ( IN-CITY ?auto_173533 ?auto_173532 ) ( not ( = ?auto_173525 ?auto_173533 ) ) ( OBJ-AT ?auto_173526 ?auto_173533 ) ( OBJ-AT ?auto_173528 ?auto_173531 ) ( IN-CITY ?auto_173534 ?auto_173532 ) ( not ( = ?auto_173525 ?auto_173534 ) ) ( OBJ-AT ?auto_173527 ?auto_173534 ) ( TRUCK-AT ?auto_173535 ?auto_173525 ) ( not ( = ?auto_173527 ?auto_173528 ) ) ( not ( = ?auto_173531 ?auto_173534 ) ) ( not ( = ?auto_173527 ?auto_173526 ) ) ( not ( = ?auto_173528 ?auto_173526 ) ) ( not ( = ?auto_173533 ?auto_173531 ) ) ( not ( = ?auto_173533 ?auto_173534 ) ) ( not ( = ?auto_173527 ?auto_173529 ) ) ( not ( = ?auto_173528 ?auto_173529 ) ) ( not ( = ?auto_173526 ?auto_173529 ) ) ( not ( = ?auto_173536 ?auto_173533 ) ) ( not ( = ?auto_173536 ?auto_173531 ) ) ( not ( = ?auto_173536 ?auto_173534 ) ) ( not ( = ?auto_173527 ?auto_173530 ) ) ( not ( = ?auto_173528 ?auto_173530 ) ) ( not ( = ?auto_173526 ?auto_173530 ) ) ( not ( = ?auto_173529 ?auto_173530 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173527 ?auto_173528 ?auto_173526 ?auto_173530 ?auto_173529 ?auto_173525 )
      ( DELIVER-5PKG-VERIFY ?auto_173526 ?auto_173527 ?auto_173528 ?auto_173529 ?auto_173530 ?auto_173525 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173577 - OBJ
      ?auto_173578 - OBJ
      ?auto_173579 - OBJ
      ?auto_173580 - OBJ
      ?auto_173581 - OBJ
      ?auto_173576 - LOCATION
    )
    :vars
    (
      ?auto_173582 - LOCATION
      ?auto_173583 - CITY
      ?auto_173587 - LOCATION
      ?auto_173584 - LOCATION
      ?auto_173585 - LOCATION
      ?auto_173586 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173582 ?auto_173583 ) ( IN-CITY ?auto_173576 ?auto_173583 ) ( not ( = ?auto_173576 ?auto_173582 ) ) ( OBJ-AT ?auto_173580 ?auto_173582 ) ( IN-CITY ?auto_173587 ?auto_173583 ) ( not ( = ?auto_173576 ?auto_173587 ) ) ( OBJ-AT ?auto_173581 ?auto_173587 ) ( IN-CITY ?auto_173584 ?auto_173583 ) ( not ( = ?auto_173576 ?auto_173584 ) ) ( OBJ-AT ?auto_173577 ?auto_173584 ) ( OBJ-AT ?auto_173579 ?auto_173582 ) ( IN-CITY ?auto_173585 ?auto_173583 ) ( not ( = ?auto_173576 ?auto_173585 ) ) ( OBJ-AT ?auto_173578 ?auto_173585 ) ( TRUCK-AT ?auto_173586 ?auto_173576 ) ( not ( = ?auto_173578 ?auto_173579 ) ) ( not ( = ?auto_173582 ?auto_173585 ) ) ( not ( = ?auto_173578 ?auto_173577 ) ) ( not ( = ?auto_173579 ?auto_173577 ) ) ( not ( = ?auto_173584 ?auto_173582 ) ) ( not ( = ?auto_173584 ?auto_173585 ) ) ( not ( = ?auto_173578 ?auto_173581 ) ) ( not ( = ?auto_173579 ?auto_173581 ) ) ( not ( = ?auto_173577 ?auto_173581 ) ) ( not ( = ?auto_173587 ?auto_173584 ) ) ( not ( = ?auto_173587 ?auto_173582 ) ) ( not ( = ?auto_173587 ?auto_173585 ) ) ( not ( = ?auto_173578 ?auto_173580 ) ) ( not ( = ?auto_173579 ?auto_173580 ) ) ( not ( = ?auto_173577 ?auto_173580 ) ) ( not ( = ?auto_173581 ?auto_173580 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173578 ?auto_173579 ?auto_173577 ?auto_173580 ?auto_173581 ?auto_173576 )
      ( DELIVER-5PKG-VERIFY ?auto_173577 ?auto_173578 ?auto_173579 ?auto_173580 ?auto_173581 ?auto_173576 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173737 - OBJ
      ?auto_173738 - OBJ
      ?auto_173739 - OBJ
      ?auto_173740 - OBJ
      ?auto_173741 - OBJ
      ?auto_173736 - LOCATION
    )
    :vars
    (
      ?auto_173742 - LOCATION
      ?auto_173743 - CITY
      ?auto_173747 - LOCATION
      ?auto_173744 - LOCATION
      ?auto_173745 - LOCATION
      ?auto_173746 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173742 ?auto_173743 ) ( IN-CITY ?auto_173736 ?auto_173743 ) ( not ( = ?auto_173736 ?auto_173742 ) ) ( OBJ-AT ?auto_173741 ?auto_173742 ) ( IN-CITY ?auto_173747 ?auto_173743 ) ( not ( = ?auto_173736 ?auto_173747 ) ) ( OBJ-AT ?auto_173739 ?auto_173747 ) ( IN-CITY ?auto_173744 ?auto_173743 ) ( not ( = ?auto_173736 ?auto_173744 ) ) ( OBJ-AT ?auto_173737 ?auto_173744 ) ( OBJ-AT ?auto_173740 ?auto_173742 ) ( IN-CITY ?auto_173745 ?auto_173743 ) ( not ( = ?auto_173736 ?auto_173745 ) ) ( OBJ-AT ?auto_173738 ?auto_173745 ) ( TRUCK-AT ?auto_173746 ?auto_173736 ) ( not ( = ?auto_173738 ?auto_173740 ) ) ( not ( = ?auto_173742 ?auto_173745 ) ) ( not ( = ?auto_173738 ?auto_173737 ) ) ( not ( = ?auto_173740 ?auto_173737 ) ) ( not ( = ?auto_173744 ?auto_173742 ) ) ( not ( = ?auto_173744 ?auto_173745 ) ) ( not ( = ?auto_173738 ?auto_173739 ) ) ( not ( = ?auto_173740 ?auto_173739 ) ) ( not ( = ?auto_173737 ?auto_173739 ) ) ( not ( = ?auto_173747 ?auto_173744 ) ) ( not ( = ?auto_173747 ?auto_173742 ) ) ( not ( = ?auto_173747 ?auto_173745 ) ) ( not ( = ?auto_173738 ?auto_173741 ) ) ( not ( = ?auto_173740 ?auto_173741 ) ) ( not ( = ?auto_173737 ?auto_173741 ) ) ( not ( = ?auto_173739 ?auto_173741 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173738 ?auto_173740 ?auto_173737 ?auto_173741 ?auto_173739 ?auto_173736 )
      ( DELIVER-5PKG-VERIFY ?auto_173737 ?auto_173738 ?auto_173739 ?auto_173740 ?auto_173741 ?auto_173736 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173788 - OBJ
      ?auto_173789 - OBJ
      ?auto_173790 - OBJ
      ?auto_173791 - OBJ
      ?auto_173792 - OBJ
      ?auto_173787 - LOCATION
    )
    :vars
    (
      ?auto_173793 - LOCATION
      ?auto_173794 - CITY
      ?auto_173798 - LOCATION
      ?auto_173795 - LOCATION
      ?auto_173796 - LOCATION
      ?auto_173797 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173793 ?auto_173794 ) ( IN-CITY ?auto_173787 ?auto_173794 ) ( not ( = ?auto_173787 ?auto_173793 ) ) ( OBJ-AT ?auto_173791 ?auto_173793 ) ( IN-CITY ?auto_173798 ?auto_173794 ) ( not ( = ?auto_173787 ?auto_173798 ) ) ( OBJ-AT ?auto_173790 ?auto_173798 ) ( IN-CITY ?auto_173795 ?auto_173794 ) ( not ( = ?auto_173787 ?auto_173795 ) ) ( OBJ-AT ?auto_173788 ?auto_173795 ) ( OBJ-AT ?auto_173792 ?auto_173793 ) ( IN-CITY ?auto_173796 ?auto_173794 ) ( not ( = ?auto_173787 ?auto_173796 ) ) ( OBJ-AT ?auto_173789 ?auto_173796 ) ( TRUCK-AT ?auto_173797 ?auto_173787 ) ( not ( = ?auto_173789 ?auto_173792 ) ) ( not ( = ?auto_173793 ?auto_173796 ) ) ( not ( = ?auto_173789 ?auto_173788 ) ) ( not ( = ?auto_173792 ?auto_173788 ) ) ( not ( = ?auto_173795 ?auto_173793 ) ) ( not ( = ?auto_173795 ?auto_173796 ) ) ( not ( = ?auto_173789 ?auto_173790 ) ) ( not ( = ?auto_173792 ?auto_173790 ) ) ( not ( = ?auto_173788 ?auto_173790 ) ) ( not ( = ?auto_173798 ?auto_173795 ) ) ( not ( = ?auto_173798 ?auto_173793 ) ) ( not ( = ?auto_173798 ?auto_173796 ) ) ( not ( = ?auto_173789 ?auto_173791 ) ) ( not ( = ?auto_173792 ?auto_173791 ) ) ( not ( = ?auto_173788 ?auto_173791 ) ) ( not ( = ?auto_173790 ?auto_173791 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173789 ?auto_173792 ?auto_173788 ?auto_173791 ?auto_173790 ?auto_173787 )
      ( DELIVER-5PKG-VERIFY ?auto_173788 ?auto_173789 ?auto_173790 ?auto_173791 ?auto_173792 ?auto_173787 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173946 - OBJ
      ?auto_173947 - OBJ
      ?auto_173948 - OBJ
      ?auto_173949 - OBJ
      ?auto_173950 - OBJ
      ?auto_173945 - LOCATION
    )
    :vars
    (
      ?auto_173951 - LOCATION
      ?auto_173952 - CITY
      ?auto_173956 - LOCATION
      ?auto_173953 - LOCATION
      ?auto_173954 - LOCATION
      ?auto_173955 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173951 ?auto_173952 ) ( IN-CITY ?auto_173945 ?auto_173952 ) ( not ( = ?auto_173945 ?auto_173951 ) ) ( OBJ-AT ?auto_173948 ?auto_173951 ) ( IN-CITY ?auto_173956 ?auto_173952 ) ( not ( = ?auto_173945 ?auto_173956 ) ) ( OBJ-AT ?auto_173950 ?auto_173956 ) ( IN-CITY ?auto_173953 ?auto_173952 ) ( not ( = ?auto_173945 ?auto_173953 ) ) ( OBJ-AT ?auto_173946 ?auto_173953 ) ( OBJ-AT ?auto_173949 ?auto_173951 ) ( IN-CITY ?auto_173954 ?auto_173952 ) ( not ( = ?auto_173945 ?auto_173954 ) ) ( OBJ-AT ?auto_173947 ?auto_173954 ) ( TRUCK-AT ?auto_173955 ?auto_173945 ) ( not ( = ?auto_173947 ?auto_173949 ) ) ( not ( = ?auto_173951 ?auto_173954 ) ) ( not ( = ?auto_173947 ?auto_173946 ) ) ( not ( = ?auto_173949 ?auto_173946 ) ) ( not ( = ?auto_173953 ?auto_173951 ) ) ( not ( = ?auto_173953 ?auto_173954 ) ) ( not ( = ?auto_173947 ?auto_173950 ) ) ( not ( = ?auto_173949 ?auto_173950 ) ) ( not ( = ?auto_173946 ?auto_173950 ) ) ( not ( = ?auto_173956 ?auto_173953 ) ) ( not ( = ?auto_173956 ?auto_173951 ) ) ( not ( = ?auto_173956 ?auto_173954 ) ) ( not ( = ?auto_173947 ?auto_173948 ) ) ( not ( = ?auto_173949 ?auto_173948 ) ) ( not ( = ?auto_173946 ?auto_173948 ) ) ( not ( = ?auto_173950 ?auto_173948 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173947 ?auto_173949 ?auto_173946 ?auto_173948 ?auto_173950 ?auto_173945 )
      ( DELIVER-5PKG-VERIFY ?auto_173946 ?auto_173947 ?auto_173948 ?auto_173949 ?auto_173950 ?auto_173945 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_174052 - OBJ
      ?auto_174053 - OBJ
      ?auto_174054 - OBJ
      ?auto_174055 - OBJ
      ?auto_174056 - OBJ
      ?auto_174051 - LOCATION
    )
    :vars
    (
      ?auto_174057 - LOCATION
      ?auto_174058 - CITY
      ?auto_174062 - LOCATION
      ?auto_174059 - LOCATION
      ?auto_174060 - LOCATION
      ?auto_174061 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174057 ?auto_174058 ) ( IN-CITY ?auto_174051 ?auto_174058 ) ( not ( = ?auto_174051 ?auto_174057 ) ) ( OBJ-AT ?auto_174054 ?auto_174057 ) ( IN-CITY ?auto_174062 ?auto_174058 ) ( not ( = ?auto_174051 ?auto_174062 ) ) ( OBJ-AT ?auto_174055 ?auto_174062 ) ( IN-CITY ?auto_174059 ?auto_174058 ) ( not ( = ?auto_174051 ?auto_174059 ) ) ( OBJ-AT ?auto_174052 ?auto_174059 ) ( OBJ-AT ?auto_174056 ?auto_174057 ) ( IN-CITY ?auto_174060 ?auto_174058 ) ( not ( = ?auto_174051 ?auto_174060 ) ) ( OBJ-AT ?auto_174053 ?auto_174060 ) ( TRUCK-AT ?auto_174061 ?auto_174051 ) ( not ( = ?auto_174053 ?auto_174056 ) ) ( not ( = ?auto_174057 ?auto_174060 ) ) ( not ( = ?auto_174053 ?auto_174052 ) ) ( not ( = ?auto_174056 ?auto_174052 ) ) ( not ( = ?auto_174059 ?auto_174057 ) ) ( not ( = ?auto_174059 ?auto_174060 ) ) ( not ( = ?auto_174053 ?auto_174055 ) ) ( not ( = ?auto_174056 ?auto_174055 ) ) ( not ( = ?auto_174052 ?auto_174055 ) ) ( not ( = ?auto_174062 ?auto_174059 ) ) ( not ( = ?auto_174062 ?auto_174057 ) ) ( not ( = ?auto_174062 ?auto_174060 ) ) ( not ( = ?auto_174053 ?auto_174054 ) ) ( not ( = ?auto_174056 ?auto_174054 ) ) ( not ( = ?auto_174052 ?auto_174054 ) ) ( not ( = ?auto_174055 ?auto_174054 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_174053 ?auto_174056 ?auto_174052 ?auto_174054 ?auto_174055 ?auto_174051 )
      ( DELIVER-5PKG-VERIFY ?auto_174052 ?auto_174053 ?auto_174054 ?auto_174055 ?auto_174056 ?auto_174051 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_174210 - OBJ
      ?auto_174211 - OBJ
      ?auto_174212 - OBJ
      ?auto_174213 - OBJ
      ?auto_174214 - OBJ
      ?auto_174209 - LOCATION
    )
    :vars
    (
      ?auto_174215 - LOCATION
      ?auto_174216 - CITY
      ?auto_174220 - LOCATION
      ?auto_174217 - LOCATION
      ?auto_174218 - LOCATION
      ?auto_174219 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174215 ?auto_174216 ) ( IN-CITY ?auto_174209 ?auto_174216 ) ( not ( = ?auto_174209 ?auto_174215 ) ) ( OBJ-AT ?auto_174214 ?auto_174215 ) ( IN-CITY ?auto_174220 ?auto_174216 ) ( not ( = ?auto_174209 ?auto_174220 ) ) ( OBJ-AT ?auto_174213 ?auto_174220 ) ( IN-CITY ?auto_174217 ?auto_174216 ) ( not ( = ?auto_174209 ?auto_174217 ) ) ( OBJ-AT ?auto_174210 ?auto_174217 ) ( OBJ-AT ?auto_174211 ?auto_174215 ) ( IN-CITY ?auto_174218 ?auto_174216 ) ( not ( = ?auto_174209 ?auto_174218 ) ) ( OBJ-AT ?auto_174212 ?auto_174218 ) ( TRUCK-AT ?auto_174219 ?auto_174209 ) ( not ( = ?auto_174212 ?auto_174211 ) ) ( not ( = ?auto_174215 ?auto_174218 ) ) ( not ( = ?auto_174212 ?auto_174210 ) ) ( not ( = ?auto_174211 ?auto_174210 ) ) ( not ( = ?auto_174217 ?auto_174215 ) ) ( not ( = ?auto_174217 ?auto_174218 ) ) ( not ( = ?auto_174212 ?auto_174213 ) ) ( not ( = ?auto_174211 ?auto_174213 ) ) ( not ( = ?auto_174210 ?auto_174213 ) ) ( not ( = ?auto_174220 ?auto_174217 ) ) ( not ( = ?auto_174220 ?auto_174215 ) ) ( not ( = ?auto_174220 ?auto_174218 ) ) ( not ( = ?auto_174212 ?auto_174214 ) ) ( not ( = ?auto_174211 ?auto_174214 ) ) ( not ( = ?auto_174210 ?auto_174214 ) ) ( not ( = ?auto_174213 ?auto_174214 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_174212 ?auto_174211 ?auto_174210 ?auto_174214 ?auto_174213 ?auto_174209 )
      ( DELIVER-5PKG-VERIFY ?auto_174210 ?auto_174211 ?auto_174212 ?auto_174213 ?auto_174214 ?auto_174209 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_174261 - OBJ
      ?auto_174262 - OBJ
      ?auto_174263 - OBJ
      ?auto_174264 - OBJ
      ?auto_174265 - OBJ
      ?auto_174260 - LOCATION
    )
    :vars
    (
      ?auto_174266 - LOCATION
      ?auto_174267 - CITY
      ?auto_174271 - LOCATION
      ?auto_174268 - LOCATION
      ?auto_174269 - LOCATION
      ?auto_174270 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174266 ?auto_174267 ) ( IN-CITY ?auto_174260 ?auto_174267 ) ( not ( = ?auto_174260 ?auto_174266 ) ) ( OBJ-AT ?auto_174264 ?auto_174266 ) ( IN-CITY ?auto_174271 ?auto_174267 ) ( not ( = ?auto_174260 ?auto_174271 ) ) ( OBJ-AT ?auto_174265 ?auto_174271 ) ( IN-CITY ?auto_174268 ?auto_174267 ) ( not ( = ?auto_174260 ?auto_174268 ) ) ( OBJ-AT ?auto_174261 ?auto_174268 ) ( OBJ-AT ?auto_174262 ?auto_174266 ) ( IN-CITY ?auto_174269 ?auto_174267 ) ( not ( = ?auto_174260 ?auto_174269 ) ) ( OBJ-AT ?auto_174263 ?auto_174269 ) ( TRUCK-AT ?auto_174270 ?auto_174260 ) ( not ( = ?auto_174263 ?auto_174262 ) ) ( not ( = ?auto_174266 ?auto_174269 ) ) ( not ( = ?auto_174263 ?auto_174261 ) ) ( not ( = ?auto_174262 ?auto_174261 ) ) ( not ( = ?auto_174268 ?auto_174266 ) ) ( not ( = ?auto_174268 ?auto_174269 ) ) ( not ( = ?auto_174263 ?auto_174265 ) ) ( not ( = ?auto_174262 ?auto_174265 ) ) ( not ( = ?auto_174261 ?auto_174265 ) ) ( not ( = ?auto_174271 ?auto_174268 ) ) ( not ( = ?auto_174271 ?auto_174266 ) ) ( not ( = ?auto_174271 ?auto_174269 ) ) ( not ( = ?auto_174263 ?auto_174264 ) ) ( not ( = ?auto_174262 ?auto_174264 ) ) ( not ( = ?auto_174261 ?auto_174264 ) ) ( not ( = ?auto_174265 ?auto_174264 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_174263 ?auto_174262 ?auto_174261 ?auto_174264 ?auto_174265 ?auto_174260 )
      ( DELIVER-5PKG-VERIFY ?auto_174261 ?auto_174262 ?auto_174263 ?auto_174264 ?auto_174265 ?auto_174260 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_174530 - OBJ
      ?auto_174531 - OBJ
      ?auto_174532 - OBJ
      ?auto_174533 - OBJ
      ?auto_174534 - OBJ
      ?auto_174529 - LOCATION
    )
    :vars
    (
      ?auto_174535 - LOCATION
      ?auto_174536 - CITY
      ?auto_174540 - LOCATION
      ?auto_174537 - LOCATION
      ?auto_174538 - LOCATION
      ?auto_174539 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174535 ?auto_174536 ) ( IN-CITY ?auto_174529 ?auto_174536 ) ( not ( = ?auto_174529 ?auto_174535 ) ) ( OBJ-AT ?auto_174534 ?auto_174535 ) ( IN-CITY ?auto_174540 ?auto_174536 ) ( not ( = ?auto_174529 ?auto_174540 ) ) ( OBJ-AT ?auto_174532 ?auto_174540 ) ( IN-CITY ?auto_174537 ?auto_174536 ) ( not ( = ?auto_174529 ?auto_174537 ) ) ( OBJ-AT ?auto_174530 ?auto_174537 ) ( OBJ-AT ?auto_174531 ?auto_174535 ) ( IN-CITY ?auto_174538 ?auto_174536 ) ( not ( = ?auto_174529 ?auto_174538 ) ) ( OBJ-AT ?auto_174533 ?auto_174538 ) ( TRUCK-AT ?auto_174539 ?auto_174529 ) ( not ( = ?auto_174533 ?auto_174531 ) ) ( not ( = ?auto_174535 ?auto_174538 ) ) ( not ( = ?auto_174533 ?auto_174530 ) ) ( not ( = ?auto_174531 ?auto_174530 ) ) ( not ( = ?auto_174537 ?auto_174535 ) ) ( not ( = ?auto_174537 ?auto_174538 ) ) ( not ( = ?auto_174533 ?auto_174532 ) ) ( not ( = ?auto_174531 ?auto_174532 ) ) ( not ( = ?auto_174530 ?auto_174532 ) ) ( not ( = ?auto_174540 ?auto_174537 ) ) ( not ( = ?auto_174540 ?auto_174535 ) ) ( not ( = ?auto_174540 ?auto_174538 ) ) ( not ( = ?auto_174533 ?auto_174534 ) ) ( not ( = ?auto_174531 ?auto_174534 ) ) ( not ( = ?auto_174530 ?auto_174534 ) ) ( not ( = ?auto_174532 ?auto_174534 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_174533 ?auto_174531 ?auto_174530 ?auto_174534 ?auto_174532 ?auto_174529 )
      ( DELIVER-5PKG-VERIFY ?auto_174530 ?auto_174531 ?auto_174532 ?auto_174533 ?auto_174534 ?auto_174529 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_174581 - OBJ
      ?auto_174582 - OBJ
      ?auto_174583 - OBJ
      ?auto_174584 - OBJ
      ?auto_174585 - OBJ
      ?auto_174580 - LOCATION
    )
    :vars
    (
      ?auto_174586 - LOCATION
      ?auto_174587 - CITY
      ?auto_174591 - LOCATION
      ?auto_174588 - LOCATION
      ?auto_174589 - LOCATION
      ?auto_174590 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174586 ?auto_174587 ) ( IN-CITY ?auto_174580 ?auto_174587 ) ( not ( = ?auto_174580 ?auto_174586 ) ) ( OBJ-AT ?auto_174584 ?auto_174586 ) ( IN-CITY ?auto_174591 ?auto_174587 ) ( not ( = ?auto_174580 ?auto_174591 ) ) ( OBJ-AT ?auto_174583 ?auto_174591 ) ( IN-CITY ?auto_174588 ?auto_174587 ) ( not ( = ?auto_174580 ?auto_174588 ) ) ( OBJ-AT ?auto_174581 ?auto_174588 ) ( OBJ-AT ?auto_174582 ?auto_174586 ) ( IN-CITY ?auto_174589 ?auto_174587 ) ( not ( = ?auto_174580 ?auto_174589 ) ) ( OBJ-AT ?auto_174585 ?auto_174589 ) ( TRUCK-AT ?auto_174590 ?auto_174580 ) ( not ( = ?auto_174585 ?auto_174582 ) ) ( not ( = ?auto_174586 ?auto_174589 ) ) ( not ( = ?auto_174585 ?auto_174581 ) ) ( not ( = ?auto_174582 ?auto_174581 ) ) ( not ( = ?auto_174588 ?auto_174586 ) ) ( not ( = ?auto_174588 ?auto_174589 ) ) ( not ( = ?auto_174585 ?auto_174583 ) ) ( not ( = ?auto_174582 ?auto_174583 ) ) ( not ( = ?auto_174581 ?auto_174583 ) ) ( not ( = ?auto_174591 ?auto_174588 ) ) ( not ( = ?auto_174591 ?auto_174586 ) ) ( not ( = ?auto_174591 ?auto_174589 ) ) ( not ( = ?auto_174585 ?auto_174584 ) ) ( not ( = ?auto_174582 ?auto_174584 ) ) ( not ( = ?auto_174581 ?auto_174584 ) ) ( not ( = ?auto_174583 ?auto_174584 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_174585 ?auto_174582 ?auto_174581 ?auto_174584 ?auto_174583 ?auto_174580 )
      ( DELIVER-5PKG-VERIFY ?auto_174581 ?auto_174582 ?auto_174583 ?auto_174584 ?auto_174585 ?auto_174580 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_174684 - OBJ
      ?auto_174685 - OBJ
      ?auto_174686 - OBJ
      ?auto_174687 - OBJ
      ?auto_174688 - OBJ
      ?auto_174683 - LOCATION
    )
    :vars
    (
      ?auto_174689 - LOCATION
      ?auto_174690 - CITY
      ?auto_174694 - LOCATION
      ?auto_174691 - LOCATION
      ?auto_174692 - LOCATION
      ?auto_174693 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174689 ?auto_174690 ) ( IN-CITY ?auto_174683 ?auto_174690 ) ( not ( = ?auto_174683 ?auto_174689 ) ) ( OBJ-AT ?auto_174686 ?auto_174689 ) ( IN-CITY ?auto_174694 ?auto_174690 ) ( not ( = ?auto_174683 ?auto_174694 ) ) ( OBJ-AT ?auto_174688 ?auto_174694 ) ( IN-CITY ?auto_174691 ?auto_174690 ) ( not ( = ?auto_174683 ?auto_174691 ) ) ( OBJ-AT ?auto_174684 ?auto_174691 ) ( OBJ-AT ?auto_174685 ?auto_174689 ) ( IN-CITY ?auto_174692 ?auto_174690 ) ( not ( = ?auto_174683 ?auto_174692 ) ) ( OBJ-AT ?auto_174687 ?auto_174692 ) ( TRUCK-AT ?auto_174693 ?auto_174683 ) ( not ( = ?auto_174687 ?auto_174685 ) ) ( not ( = ?auto_174689 ?auto_174692 ) ) ( not ( = ?auto_174687 ?auto_174684 ) ) ( not ( = ?auto_174685 ?auto_174684 ) ) ( not ( = ?auto_174691 ?auto_174689 ) ) ( not ( = ?auto_174691 ?auto_174692 ) ) ( not ( = ?auto_174687 ?auto_174688 ) ) ( not ( = ?auto_174685 ?auto_174688 ) ) ( not ( = ?auto_174684 ?auto_174688 ) ) ( not ( = ?auto_174694 ?auto_174691 ) ) ( not ( = ?auto_174694 ?auto_174689 ) ) ( not ( = ?auto_174694 ?auto_174692 ) ) ( not ( = ?auto_174687 ?auto_174686 ) ) ( not ( = ?auto_174685 ?auto_174686 ) ) ( not ( = ?auto_174684 ?auto_174686 ) ) ( not ( = ?auto_174688 ?auto_174686 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_174687 ?auto_174685 ?auto_174684 ?auto_174686 ?auto_174688 ?auto_174683 )
      ( DELIVER-5PKG-VERIFY ?auto_174684 ?auto_174685 ?auto_174686 ?auto_174687 ?auto_174688 ?auto_174683 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_174845 - OBJ
      ?auto_174846 - OBJ
      ?auto_174847 - OBJ
      ?auto_174848 - OBJ
      ?auto_174849 - OBJ
      ?auto_174844 - LOCATION
    )
    :vars
    (
      ?auto_174850 - LOCATION
      ?auto_174851 - CITY
      ?auto_174855 - LOCATION
      ?auto_174852 - LOCATION
      ?auto_174853 - LOCATION
      ?auto_174854 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174850 ?auto_174851 ) ( IN-CITY ?auto_174844 ?auto_174851 ) ( not ( = ?auto_174844 ?auto_174850 ) ) ( OBJ-AT ?auto_174847 ?auto_174850 ) ( IN-CITY ?auto_174855 ?auto_174851 ) ( not ( = ?auto_174844 ?auto_174855 ) ) ( OBJ-AT ?auto_174848 ?auto_174855 ) ( IN-CITY ?auto_174852 ?auto_174851 ) ( not ( = ?auto_174844 ?auto_174852 ) ) ( OBJ-AT ?auto_174845 ?auto_174852 ) ( OBJ-AT ?auto_174846 ?auto_174850 ) ( IN-CITY ?auto_174853 ?auto_174851 ) ( not ( = ?auto_174844 ?auto_174853 ) ) ( OBJ-AT ?auto_174849 ?auto_174853 ) ( TRUCK-AT ?auto_174854 ?auto_174844 ) ( not ( = ?auto_174849 ?auto_174846 ) ) ( not ( = ?auto_174850 ?auto_174853 ) ) ( not ( = ?auto_174849 ?auto_174845 ) ) ( not ( = ?auto_174846 ?auto_174845 ) ) ( not ( = ?auto_174852 ?auto_174850 ) ) ( not ( = ?auto_174852 ?auto_174853 ) ) ( not ( = ?auto_174849 ?auto_174848 ) ) ( not ( = ?auto_174846 ?auto_174848 ) ) ( not ( = ?auto_174845 ?auto_174848 ) ) ( not ( = ?auto_174855 ?auto_174852 ) ) ( not ( = ?auto_174855 ?auto_174850 ) ) ( not ( = ?auto_174855 ?auto_174853 ) ) ( not ( = ?auto_174849 ?auto_174847 ) ) ( not ( = ?auto_174846 ?auto_174847 ) ) ( not ( = ?auto_174845 ?auto_174847 ) ) ( not ( = ?auto_174848 ?auto_174847 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_174849 ?auto_174846 ?auto_174845 ?auto_174847 ?auto_174848 ?auto_174844 )
      ( DELIVER-5PKG-VERIFY ?auto_174845 ?auto_174846 ?auto_174847 ?auto_174848 ?auto_174849 ?auto_174844 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175833 - OBJ
      ?auto_175834 - OBJ
      ?auto_175835 - OBJ
      ?auto_175836 - OBJ
      ?auto_175837 - OBJ
      ?auto_175832 - LOCATION
    )
    :vars
    (
      ?auto_175838 - LOCATION
      ?auto_175839 - CITY
      ?auto_175843 - LOCATION
      ?auto_175840 - LOCATION
      ?auto_175841 - LOCATION
      ?auto_175842 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175838 ?auto_175839 ) ( IN-CITY ?auto_175832 ?auto_175839 ) ( not ( = ?auto_175832 ?auto_175838 ) ) ( OBJ-AT ?auto_175837 ?auto_175838 ) ( IN-CITY ?auto_175843 ?auto_175839 ) ( not ( = ?auto_175832 ?auto_175843 ) ) ( OBJ-AT ?auto_175834 ?auto_175843 ) ( IN-CITY ?auto_175840 ?auto_175839 ) ( not ( = ?auto_175832 ?auto_175840 ) ) ( OBJ-AT ?auto_175833 ?auto_175840 ) ( OBJ-AT ?auto_175836 ?auto_175838 ) ( IN-CITY ?auto_175841 ?auto_175839 ) ( not ( = ?auto_175832 ?auto_175841 ) ) ( OBJ-AT ?auto_175835 ?auto_175841 ) ( TRUCK-AT ?auto_175842 ?auto_175832 ) ( not ( = ?auto_175835 ?auto_175836 ) ) ( not ( = ?auto_175838 ?auto_175841 ) ) ( not ( = ?auto_175835 ?auto_175833 ) ) ( not ( = ?auto_175836 ?auto_175833 ) ) ( not ( = ?auto_175840 ?auto_175838 ) ) ( not ( = ?auto_175840 ?auto_175841 ) ) ( not ( = ?auto_175835 ?auto_175834 ) ) ( not ( = ?auto_175836 ?auto_175834 ) ) ( not ( = ?auto_175833 ?auto_175834 ) ) ( not ( = ?auto_175843 ?auto_175840 ) ) ( not ( = ?auto_175843 ?auto_175838 ) ) ( not ( = ?auto_175843 ?auto_175841 ) ) ( not ( = ?auto_175835 ?auto_175837 ) ) ( not ( = ?auto_175836 ?auto_175837 ) ) ( not ( = ?auto_175833 ?auto_175837 ) ) ( not ( = ?auto_175834 ?auto_175837 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175835 ?auto_175836 ?auto_175833 ?auto_175837 ?auto_175834 ?auto_175832 )
      ( DELIVER-5PKG-VERIFY ?auto_175833 ?auto_175834 ?auto_175835 ?auto_175836 ?auto_175837 ?auto_175832 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175884 - OBJ
      ?auto_175885 - OBJ
      ?auto_175886 - OBJ
      ?auto_175887 - OBJ
      ?auto_175888 - OBJ
      ?auto_175883 - LOCATION
    )
    :vars
    (
      ?auto_175889 - LOCATION
      ?auto_175890 - CITY
      ?auto_175894 - LOCATION
      ?auto_175891 - LOCATION
      ?auto_175892 - LOCATION
      ?auto_175893 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175889 ?auto_175890 ) ( IN-CITY ?auto_175883 ?auto_175890 ) ( not ( = ?auto_175883 ?auto_175889 ) ) ( OBJ-AT ?auto_175887 ?auto_175889 ) ( IN-CITY ?auto_175894 ?auto_175890 ) ( not ( = ?auto_175883 ?auto_175894 ) ) ( OBJ-AT ?auto_175885 ?auto_175894 ) ( IN-CITY ?auto_175891 ?auto_175890 ) ( not ( = ?auto_175883 ?auto_175891 ) ) ( OBJ-AT ?auto_175884 ?auto_175891 ) ( OBJ-AT ?auto_175888 ?auto_175889 ) ( IN-CITY ?auto_175892 ?auto_175890 ) ( not ( = ?auto_175883 ?auto_175892 ) ) ( OBJ-AT ?auto_175886 ?auto_175892 ) ( TRUCK-AT ?auto_175893 ?auto_175883 ) ( not ( = ?auto_175886 ?auto_175888 ) ) ( not ( = ?auto_175889 ?auto_175892 ) ) ( not ( = ?auto_175886 ?auto_175884 ) ) ( not ( = ?auto_175888 ?auto_175884 ) ) ( not ( = ?auto_175891 ?auto_175889 ) ) ( not ( = ?auto_175891 ?auto_175892 ) ) ( not ( = ?auto_175886 ?auto_175885 ) ) ( not ( = ?auto_175888 ?auto_175885 ) ) ( not ( = ?auto_175884 ?auto_175885 ) ) ( not ( = ?auto_175894 ?auto_175891 ) ) ( not ( = ?auto_175894 ?auto_175889 ) ) ( not ( = ?auto_175894 ?auto_175892 ) ) ( not ( = ?auto_175886 ?auto_175887 ) ) ( not ( = ?auto_175888 ?auto_175887 ) ) ( not ( = ?auto_175884 ?auto_175887 ) ) ( not ( = ?auto_175885 ?auto_175887 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175886 ?auto_175888 ?auto_175884 ?auto_175887 ?auto_175885 ?auto_175883 )
      ( DELIVER-5PKG-VERIFY ?auto_175884 ?auto_175885 ?auto_175886 ?auto_175887 ?auto_175888 ?auto_175883 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175935 - OBJ
      ?auto_175936 - OBJ
      ?auto_175937 - OBJ
      ?auto_175938 - OBJ
      ?auto_175939 - OBJ
      ?auto_175934 - LOCATION
    )
    :vars
    (
      ?auto_175940 - LOCATION
      ?auto_175941 - CITY
      ?auto_175945 - LOCATION
      ?auto_175942 - LOCATION
      ?auto_175943 - LOCATION
      ?auto_175944 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175940 ?auto_175941 ) ( IN-CITY ?auto_175934 ?auto_175941 ) ( not ( = ?auto_175934 ?auto_175940 ) ) ( OBJ-AT ?auto_175939 ?auto_175940 ) ( IN-CITY ?auto_175945 ?auto_175941 ) ( not ( = ?auto_175934 ?auto_175945 ) ) ( OBJ-AT ?auto_175936 ?auto_175945 ) ( IN-CITY ?auto_175942 ?auto_175941 ) ( not ( = ?auto_175934 ?auto_175942 ) ) ( OBJ-AT ?auto_175935 ?auto_175942 ) ( OBJ-AT ?auto_175937 ?auto_175940 ) ( IN-CITY ?auto_175943 ?auto_175941 ) ( not ( = ?auto_175934 ?auto_175943 ) ) ( OBJ-AT ?auto_175938 ?auto_175943 ) ( TRUCK-AT ?auto_175944 ?auto_175934 ) ( not ( = ?auto_175938 ?auto_175937 ) ) ( not ( = ?auto_175940 ?auto_175943 ) ) ( not ( = ?auto_175938 ?auto_175935 ) ) ( not ( = ?auto_175937 ?auto_175935 ) ) ( not ( = ?auto_175942 ?auto_175940 ) ) ( not ( = ?auto_175942 ?auto_175943 ) ) ( not ( = ?auto_175938 ?auto_175936 ) ) ( not ( = ?auto_175937 ?auto_175936 ) ) ( not ( = ?auto_175935 ?auto_175936 ) ) ( not ( = ?auto_175945 ?auto_175942 ) ) ( not ( = ?auto_175945 ?auto_175940 ) ) ( not ( = ?auto_175945 ?auto_175943 ) ) ( not ( = ?auto_175938 ?auto_175939 ) ) ( not ( = ?auto_175937 ?auto_175939 ) ) ( not ( = ?auto_175935 ?auto_175939 ) ) ( not ( = ?auto_175936 ?auto_175939 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175938 ?auto_175937 ?auto_175935 ?auto_175939 ?auto_175936 ?auto_175934 )
      ( DELIVER-5PKG-VERIFY ?auto_175935 ?auto_175936 ?auto_175937 ?auto_175938 ?auto_175939 ?auto_175934 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175986 - OBJ
      ?auto_175987 - OBJ
      ?auto_175988 - OBJ
      ?auto_175989 - OBJ
      ?auto_175990 - OBJ
      ?auto_175985 - LOCATION
    )
    :vars
    (
      ?auto_175991 - LOCATION
      ?auto_175992 - CITY
      ?auto_175996 - LOCATION
      ?auto_175993 - LOCATION
      ?auto_175994 - LOCATION
      ?auto_175995 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175991 ?auto_175992 ) ( IN-CITY ?auto_175985 ?auto_175992 ) ( not ( = ?auto_175985 ?auto_175991 ) ) ( OBJ-AT ?auto_175989 ?auto_175991 ) ( IN-CITY ?auto_175996 ?auto_175992 ) ( not ( = ?auto_175985 ?auto_175996 ) ) ( OBJ-AT ?auto_175987 ?auto_175996 ) ( IN-CITY ?auto_175993 ?auto_175992 ) ( not ( = ?auto_175985 ?auto_175993 ) ) ( OBJ-AT ?auto_175986 ?auto_175993 ) ( OBJ-AT ?auto_175988 ?auto_175991 ) ( IN-CITY ?auto_175994 ?auto_175992 ) ( not ( = ?auto_175985 ?auto_175994 ) ) ( OBJ-AT ?auto_175990 ?auto_175994 ) ( TRUCK-AT ?auto_175995 ?auto_175985 ) ( not ( = ?auto_175990 ?auto_175988 ) ) ( not ( = ?auto_175991 ?auto_175994 ) ) ( not ( = ?auto_175990 ?auto_175986 ) ) ( not ( = ?auto_175988 ?auto_175986 ) ) ( not ( = ?auto_175993 ?auto_175991 ) ) ( not ( = ?auto_175993 ?auto_175994 ) ) ( not ( = ?auto_175990 ?auto_175987 ) ) ( not ( = ?auto_175988 ?auto_175987 ) ) ( not ( = ?auto_175986 ?auto_175987 ) ) ( not ( = ?auto_175996 ?auto_175993 ) ) ( not ( = ?auto_175996 ?auto_175991 ) ) ( not ( = ?auto_175996 ?auto_175994 ) ) ( not ( = ?auto_175990 ?auto_175989 ) ) ( not ( = ?auto_175988 ?auto_175989 ) ) ( not ( = ?auto_175986 ?auto_175989 ) ) ( not ( = ?auto_175987 ?auto_175989 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175990 ?auto_175988 ?auto_175986 ?auto_175989 ?auto_175987 ?auto_175985 )
      ( DELIVER-5PKG-VERIFY ?auto_175986 ?auto_175987 ?auto_175988 ?auto_175989 ?auto_175990 ?auto_175985 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_176307 - OBJ
      ?auto_176308 - OBJ
      ?auto_176309 - OBJ
      ?auto_176310 - OBJ
      ?auto_176311 - OBJ
      ?auto_176306 - LOCATION
    )
    :vars
    (
      ?auto_176312 - LOCATION
      ?auto_176313 - CITY
      ?auto_176317 - LOCATION
      ?auto_176314 - LOCATION
      ?auto_176315 - LOCATION
      ?auto_176316 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176312 ?auto_176313 ) ( IN-CITY ?auto_176306 ?auto_176313 ) ( not ( = ?auto_176306 ?auto_176312 ) ) ( OBJ-AT ?auto_176309 ?auto_176312 ) ( IN-CITY ?auto_176317 ?auto_176313 ) ( not ( = ?auto_176306 ?auto_176317 ) ) ( OBJ-AT ?auto_176308 ?auto_176317 ) ( IN-CITY ?auto_176314 ?auto_176313 ) ( not ( = ?auto_176306 ?auto_176314 ) ) ( OBJ-AT ?auto_176307 ?auto_176314 ) ( OBJ-AT ?auto_176311 ?auto_176312 ) ( IN-CITY ?auto_176315 ?auto_176313 ) ( not ( = ?auto_176306 ?auto_176315 ) ) ( OBJ-AT ?auto_176310 ?auto_176315 ) ( TRUCK-AT ?auto_176316 ?auto_176306 ) ( not ( = ?auto_176310 ?auto_176311 ) ) ( not ( = ?auto_176312 ?auto_176315 ) ) ( not ( = ?auto_176310 ?auto_176307 ) ) ( not ( = ?auto_176311 ?auto_176307 ) ) ( not ( = ?auto_176314 ?auto_176312 ) ) ( not ( = ?auto_176314 ?auto_176315 ) ) ( not ( = ?auto_176310 ?auto_176308 ) ) ( not ( = ?auto_176311 ?auto_176308 ) ) ( not ( = ?auto_176307 ?auto_176308 ) ) ( not ( = ?auto_176317 ?auto_176314 ) ) ( not ( = ?auto_176317 ?auto_176312 ) ) ( not ( = ?auto_176317 ?auto_176315 ) ) ( not ( = ?auto_176310 ?auto_176309 ) ) ( not ( = ?auto_176311 ?auto_176309 ) ) ( not ( = ?auto_176307 ?auto_176309 ) ) ( not ( = ?auto_176308 ?auto_176309 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_176310 ?auto_176311 ?auto_176307 ?auto_176309 ?auto_176308 ?auto_176306 )
      ( DELIVER-5PKG-VERIFY ?auto_176307 ?auto_176308 ?auto_176309 ?auto_176310 ?auto_176311 ?auto_176306 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_176358 - OBJ
      ?auto_176359 - OBJ
      ?auto_176360 - OBJ
      ?auto_176361 - OBJ
      ?auto_176362 - OBJ
      ?auto_176357 - LOCATION
    )
    :vars
    (
      ?auto_176363 - LOCATION
      ?auto_176364 - CITY
      ?auto_176368 - LOCATION
      ?auto_176365 - LOCATION
      ?auto_176366 - LOCATION
      ?auto_176367 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176363 ?auto_176364 ) ( IN-CITY ?auto_176357 ?auto_176364 ) ( not ( = ?auto_176357 ?auto_176363 ) ) ( OBJ-AT ?auto_176360 ?auto_176363 ) ( IN-CITY ?auto_176368 ?auto_176364 ) ( not ( = ?auto_176357 ?auto_176368 ) ) ( OBJ-AT ?auto_176359 ?auto_176368 ) ( IN-CITY ?auto_176365 ?auto_176364 ) ( not ( = ?auto_176357 ?auto_176365 ) ) ( OBJ-AT ?auto_176358 ?auto_176365 ) ( OBJ-AT ?auto_176361 ?auto_176363 ) ( IN-CITY ?auto_176366 ?auto_176364 ) ( not ( = ?auto_176357 ?auto_176366 ) ) ( OBJ-AT ?auto_176362 ?auto_176366 ) ( TRUCK-AT ?auto_176367 ?auto_176357 ) ( not ( = ?auto_176362 ?auto_176361 ) ) ( not ( = ?auto_176363 ?auto_176366 ) ) ( not ( = ?auto_176362 ?auto_176358 ) ) ( not ( = ?auto_176361 ?auto_176358 ) ) ( not ( = ?auto_176365 ?auto_176363 ) ) ( not ( = ?auto_176365 ?auto_176366 ) ) ( not ( = ?auto_176362 ?auto_176359 ) ) ( not ( = ?auto_176361 ?auto_176359 ) ) ( not ( = ?auto_176358 ?auto_176359 ) ) ( not ( = ?auto_176368 ?auto_176365 ) ) ( not ( = ?auto_176368 ?auto_176363 ) ) ( not ( = ?auto_176368 ?auto_176366 ) ) ( not ( = ?auto_176362 ?auto_176360 ) ) ( not ( = ?auto_176361 ?auto_176360 ) ) ( not ( = ?auto_176358 ?auto_176360 ) ) ( not ( = ?auto_176359 ?auto_176360 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_176362 ?auto_176361 ?auto_176358 ?auto_176360 ?auto_176359 ?auto_176357 )
      ( DELIVER-5PKG-VERIFY ?auto_176358 ?auto_176359 ?auto_176360 ?auto_176361 ?auto_176362 ?auto_176357 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_176733 - OBJ
      ?auto_176734 - OBJ
      ?auto_176735 - OBJ
      ?auto_176736 - OBJ
      ?auto_176737 - OBJ
      ?auto_176732 - LOCATION
    )
    :vars
    (
      ?auto_176738 - LOCATION
      ?auto_176739 - CITY
      ?auto_176743 - LOCATION
      ?auto_176740 - LOCATION
      ?auto_176741 - LOCATION
      ?auto_176742 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176738 ?auto_176739 ) ( IN-CITY ?auto_176732 ?auto_176739 ) ( not ( = ?auto_176732 ?auto_176738 ) ) ( OBJ-AT ?auto_176734 ?auto_176738 ) ( IN-CITY ?auto_176743 ?auto_176739 ) ( not ( = ?auto_176732 ?auto_176743 ) ) ( OBJ-AT ?auto_176737 ?auto_176743 ) ( IN-CITY ?auto_176740 ?auto_176739 ) ( not ( = ?auto_176732 ?auto_176740 ) ) ( OBJ-AT ?auto_176733 ?auto_176740 ) ( OBJ-AT ?auto_176736 ?auto_176738 ) ( IN-CITY ?auto_176741 ?auto_176739 ) ( not ( = ?auto_176732 ?auto_176741 ) ) ( OBJ-AT ?auto_176735 ?auto_176741 ) ( TRUCK-AT ?auto_176742 ?auto_176732 ) ( not ( = ?auto_176735 ?auto_176736 ) ) ( not ( = ?auto_176738 ?auto_176741 ) ) ( not ( = ?auto_176735 ?auto_176733 ) ) ( not ( = ?auto_176736 ?auto_176733 ) ) ( not ( = ?auto_176740 ?auto_176738 ) ) ( not ( = ?auto_176740 ?auto_176741 ) ) ( not ( = ?auto_176735 ?auto_176737 ) ) ( not ( = ?auto_176736 ?auto_176737 ) ) ( not ( = ?auto_176733 ?auto_176737 ) ) ( not ( = ?auto_176743 ?auto_176740 ) ) ( not ( = ?auto_176743 ?auto_176738 ) ) ( not ( = ?auto_176743 ?auto_176741 ) ) ( not ( = ?auto_176735 ?auto_176734 ) ) ( not ( = ?auto_176736 ?auto_176734 ) ) ( not ( = ?auto_176733 ?auto_176734 ) ) ( not ( = ?auto_176737 ?auto_176734 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_176735 ?auto_176736 ?auto_176733 ?auto_176734 ?auto_176737 ?auto_176732 )
      ( DELIVER-5PKG-VERIFY ?auto_176733 ?auto_176734 ?auto_176735 ?auto_176736 ?auto_176737 ?auto_176732 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_176839 - OBJ
      ?auto_176840 - OBJ
      ?auto_176841 - OBJ
      ?auto_176842 - OBJ
      ?auto_176843 - OBJ
      ?auto_176838 - LOCATION
    )
    :vars
    (
      ?auto_176844 - LOCATION
      ?auto_176845 - CITY
      ?auto_176849 - LOCATION
      ?auto_176846 - LOCATION
      ?auto_176847 - LOCATION
      ?auto_176848 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176844 ?auto_176845 ) ( IN-CITY ?auto_176838 ?auto_176845 ) ( not ( = ?auto_176838 ?auto_176844 ) ) ( OBJ-AT ?auto_176840 ?auto_176844 ) ( IN-CITY ?auto_176849 ?auto_176845 ) ( not ( = ?auto_176838 ?auto_176849 ) ) ( OBJ-AT ?auto_176842 ?auto_176849 ) ( IN-CITY ?auto_176846 ?auto_176845 ) ( not ( = ?auto_176838 ?auto_176846 ) ) ( OBJ-AT ?auto_176839 ?auto_176846 ) ( OBJ-AT ?auto_176843 ?auto_176844 ) ( IN-CITY ?auto_176847 ?auto_176845 ) ( not ( = ?auto_176838 ?auto_176847 ) ) ( OBJ-AT ?auto_176841 ?auto_176847 ) ( TRUCK-AT ?auto_176848 ?auto_176838 ) ( not ( = ?auto_176841 ?auto_176843 ) ) ( not ( = ?auto_176844 ?auto_176847 ) ) ( not ( = ?auto_176841 ?auto_176839 ) ) ( not ( = ?auto_176843 ?auto_176839 ) ) ( not ( = ?auto_176846 ?auto_176844 ) ) ( not ( = ?auto_176846 ?auto_176847 ) ) ( not ( = ?auto_176841 ?auto_176842 ) ) ( not ( = ?auto_176843 ?auto_176842 ) ) ( not ( = ?auto_176839 ?auto_176842 ) ) ( not ( = ?auto_176849 ?auto_176846 ) ) ( not ( = ?auto_176849 ?auto_176844 ) ) ( not ( = ?auto_176849 ?auto_176847 ) ) ( not ( = ?auto_176841 ?auto_176840 ) ) ( not ( = ?auto_176843 ?auto_176840 ) ) ( not ( = ?auto_176839 ?auto_176840 ) ) ( not ( = ?auto_176842 ?auto_176840 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_176841 ?auto_176843 ?auto_176839 ?auto_176840 ?auto_176842 ?auto_176838 )
      ( DELIVER-5PKG-VERIFY ?auto_176839 ?auto_176840 ?auto_176841 ?auto_176842 ?auto_176843 ?auto_176838 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_176997 - OBJ
      ?auto_176998 - OBJ
      ?auto_176999 - OBJ
      ?auto_177000 - OBJ
      ?auto_177001 - OBJ
      ?auto_176996 - LOCATION
    )
    :vars
    (
      ?auto_177002 - LOCATION
      ?auto_177003 - CITY
      ?auto_177007 - LOCATION
      ?auto_177004 - LOCATION
      ?auto_177005 - LOCATION
      ?auto_177006 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177002 ?auto_177003 ) ( IN-CITY ?auto_176996 ?auto_177003 ) ( not ( = ?auto_176996 ?auto_177002 ) ) ( OBJ-AT ?auto_176998 ?auto_177002 ) ( IN-CITY ?auto_177007 ?auto_177003 ) ( not ( = ?auto_176996 ?auto_177007 ) ) ( OBJ-AT ?auto_177001 ?auto_177007 ) ( IN-CITY ?auto_177004 ?auto_177003 ) ( not ( = ?auto_176996 ?auto_177004 ) ) ( OBJ-AT ?auto_176997 ?auto_177004 ) ( OBJ-AT ?auto_176999 ?auto_177002 ) ( IN-CITY ?auto_177005 ?auto_177003 ) ( not ( = ?auto_176996 ?auto_177005 ) ) ( OBJ-AT ?auto_177000 ?auto_177005 ) ( TRUCK-AT ?auto_177006 ?auto_176996 ) ( not ( = ?auto_177000 ?auto_176999 ) ) ( not ( = ?auto_177002 ?auto_177005 ) ) ( not ( = ?auto_177000 ?auto_176997 ) ) ( not ( = ?auto_176999 ?auto_176997 ) ) ( not ( = ?auto_177004 ?auto_177002 ) ) ( not ( = ?auto_177004 ?auto_177005 ) ) ( not ( = ?auto_177000 ?auto_177001 ) ) ( not ( = ?auto_176999 ?auto_177001 ) ) ( not ( = ?auto_176997 ?auto_177001 ) ) ( not ( = ?auto_177007 ?auto_177004 ) ) ( not ( = ?auto_177007 ?auto_177002 ) ) ( not ( = ?auto_177007 ?auto_177005 ) ) ( not ( = ?auto_177000 ?auto_176998 ) ) ( not ( = ?auto_176999 ?auto_176998 ) ) ( not ( = ?auto_176997 ?auto_176998 ) ) ( not ( = ?auto_177001 ?auto_176998 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_177000 ?auto_176999 ?auto_176997 ?auto_176998 ?auto_177001 ?auto_176996 )
      ( DELIVER-5PKG-VERIFY ?auto_176997 ?auto_176998 ?auto_176999 ?auto_177000 ?auto_177001 ?auto_176996 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_177158 - OBJ
      ?auto_177159 - OBJ
      ?auto_177160 - OBJ
      ?auto_177161 - OBJ
      ?auto_177162 - OBJ
      ?auto_177157 - LOCATION
    )
    :vars
    (
      ?auto_177163 - LOCATION
      ?auto_177164 - CITY
      ?auto_177168 - LOCATION
      ?auto_177165 - LOCATION
      ?auto_177166 - LOCATION
      ?auto_177167 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177163 ?auto_177164 ) ( IN-CITY ?auto_177157 ?auto_177164 ) ( not ( = ?auto_177157 ?auto_177163 ) ) ( OBJ-AT ?auto_177159 ?auto_177163 ) ( IN-CITY ?auto_177168 ?auto_177164 ) ( not ( = ?auto_177157 ?auto_177168 ) ) ( OBJ-AT ?auto_177161 ?auto_177168 ) ( IN-CITY ?auto_177165 ?auto_177164 ) ( not ( = ?auto_177157 ?auto_177165 ) ) ( OBJ-AT ?auto_177158 ?auto_177165 ) ( OBJ-AT ?auto_177160 ?auto_177163 ) ( IN-CITY ?auto_177166 ?auto_177164 ) ( not ( = ?auto_177157 ?auto_177166 ) ) ( OBJ-AT ?auto_177162 ?auto_177166 ) ( TRUCK-AT ?auto_177167 ?auto_177157 ) ( not ( = ?auto_177162 ?auto_177160 ) ) ( not ( = ?auto_177163 ?auto_177166 ) ) ( not ( = ?auto_177162 ?auto_177158 ) ) ( not ( = ?auto_177160 ?auto_177158 ) ) ( not ( = ?auto_177165 ?auto_177163 ) ) ( not ( = ?auto_177165 ?auto_177166 ) ) ( not ( = ?auto_177162 ?auto_177161 ) ) ( not ( = ?auto_177160 ?auto_177161 ) ) ( not ( = ?auto_177158 ?auto_177161 ) ) ( not ( = ?auto_177168 ?auto_177165 ) ) ( not ( = ?auto_177168 ?auto_177163 ) ) ( not ( = ?auto_177168 ?auto_177166 ) ) ( not ( = ?auto_177162 ?auto_177159 ) ) ( not ( = ?auto_177160 ?auto_177159 ) ) ( not ( = ?auto_177158 ?auto_177159 ) ) ( not ( = ?auto_177161 ?auto_177159 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_177162 ?auto_177160 ?auto_177158 ?auto_177159 ?auto_177161 ?auto_177157 )
      ( DELIVER-5PKG-VERIFY ?auto_177158 ?auto_177159 ?auto_177160 ?auto_177161 ?auto_177162 ?auto_177157 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_177651 - OBJ
      ?auto_177652 - OBJ
      ?auto_177653 - OBJ
      ?auto_177654 - OBJ
      ?auto_177655 - OBJ
      ?auto_177650 - LOCATION
    )
    :vars
    (
      ?auto_177656 - LOCATION
      ?auto_177657 - CITY
      ?auto_177661 - LOCATION
      ?auto_177658 - LOCATION
      ?auto_177659 - LOCATION
      ?auto_177660 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177656 ?auto_177657 ) ( IN-CITY ?auto_177650 ?auto_177657 ) ( not ( = ?auto_177650 ?auto_177656 ) ) ( OBJ-AT ?auto_177652 ?auto_177656 ) ( IN-CITY ?auto_177661 ?auto_177657 ) ( not ( = ?auto_177650 ?auto_177661 ) ) ( OBJ-AT ?auto_177653 ?auto_177661 ) ( IN-CITY ?auto_177658 ?auto_177657 ) ( not ( = ?auto_177650 ?auto_177658 ) ) ( OBJ-AT ?auto_177651 ?auto_177658 ) ( OBJ-AT ?auto_177655 ?auto_177656 ) ( IN-CITY ?auto_177659 ?auto_177657 ) ( not ( = ?auto_177650 ?auto_177659 ) ) ( OBJ-AT ?auto_177654 ?auto_177659 ) ( TRUCK-AT ?auto_177660 ?auto_177650 ) ( not ( = ?auto_177654 ?auto_177655 ) ) ( not ( = ?auto_177656 ?auto_177659 ) ) ( not ( = ?auto_177654 ?auto_177651 ) ) ( not ( = ?auto_177655 ?auto_177651 ) ) ( not ( = ?auto_177658 ?auto_177656 ) ) ( not ( = ?auto_177658 ?auto_177659 ) ) ( not ( = ?auto_177654 ?auto_177653 ) ) ( not ( = ?auto_177655 ?auto_177653 ) ) ( not ( = ?auto_177651 ?auto_177653 ) ) ( not ( = ?auto_177661 ?auto_177658 ) ) ( not ( = ?auto_177661 ?auto_177656 ) ) ( not ( = ?auto_177661 ?auto_177659 ) ) ( not ( = ?auto_177654 ?auto_177652 ) ) ( not ( = ?auto_177655 ?auto_177652 ) ) ( not ( = ?auto_177651 ?auto_177652 ) ) ( not ( = ?auto_177653 ?auto_177652 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_177654 ?auto_177655 ?auto_177651 ?auto_177652 ?auto_177653 ?auto_177650 )
      ( DELIVER-5PKG-VERIFY ?auto_177651 ?auto_177652 ?auto_177653 ?auto_177654 ?auto_177655 ?auto_177650 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_177702 - OBJ
      ?auto_177703 - OBJ
      ?auto_177704 - OBJ
      ?auto_177705 - OBJ
      ?auto_177706 - OBJ
      ?auto_177701 - LOCATION
    )
    :vars
    (
      ?auto_177707 - LOCATION
      ?auto_177708 - CITY
      ?auto_177712 - LOCATION
      ?auto_177709 - LOCATION
      ?auto_177710 - LOCATION
      ?auto_177711 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177707 ?auto_177708 ) ( IN-CITY ?auto_177701 ?auto_177708 ) ( not ( = ?auto_177701 ?auto_177707 ) ) ( OBJ-AT ?auto_177703 ?auto_177707 ) ( IN-CITY ?auto_177712 ?auto_177708 ) ( not ( = ?auto_177701 ?auto_177712 ) ) ( OBJ-AT ?auto_177704 ?auto_177712 ) ( IN-CITY ?auto_177709 ?auto_177708 ) ( not ( = ?auto_177701 ?auto_177709 ) ) ( OBJ-AT ?auto_177702 ?auto_177709 ) ( OBJ-AT ?auto_177705 ?auto_177707 ) ( IN-CITY ?auto_177710 ?auto_177708 ) ( not ( = ?auto_177701 ?auto_177710 ) ) ( OBJ-AT ?auto_177706 ?auto_177710 ) ( TRUCK-AT ?auto_177711 ?auto_177701 ) ( not ( = ?auto_177706 ?auto_177705 ) ) ( not ( = ?auto_177707 ?auto_177710 ) ) ( not ( = ?auto_177706 ?auto_177702 ) ) ( not ( = ?auto_177705 ?auto_177702 ) ) ( not ( = ?auto_177709 ?auto_177707 ) ) ( not ( = ?auto_177709 ?auto_177710 ) ) ( not ( = ?auto_177706 ?auto_177704 ) ) ( not ( = ?auto_177705 ?auto_177704 ) ) ( not ( = ?auto_177702 ?auto_177704 ) ) ( not ( = ?auto_177712 ?auto_177709 ) ) ( not ( = ?auto_177712 ?auto_177707 ) ) ( not ( = ?auto_177712 ?auto_177710 ) ) ( not ( = ?auto_177706 ?auto_177703 ) ) ( not ( = ?auto_177705 ?auto_177703 ) ) ( not ( = ?auto_177702 ?auto_177703 ) ) ( not ( = ?auto_177704 ?auto_177703 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_177706 ?auto_177705 ?auto_177702 ?auto_177703 ?auto_177704 ?auto_177701 )
      ( DELIVER-5PKG-VERIFY ?auto_177702 ?auto_177703 ?auto_177704 ?auto_177705 ?auto_177706 ?auto_177701 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178466 - OBJ
      ?auto_178467 - OBJ
      ?auto_178468 - OBJ
      ?auto_178469 - OBJ
      ?auto_178470 - OBJ
      ?auto_178465 - LOCATION
    )
    :vars
    (
      ?auto_178471 - LOCATION
      ?auto_178472 - CITY
      ?auto_178476 - LOCATION
      ?auto_178473 - LOCATION
      ?auto_178474 - LOCATION
      ?auto_178475 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178471 ?auto_178472 ) ( IN-CITY ?auto_178465 ?auto_178472 ) ( not ( = ?auto_178465 ?auto_178471 ) ) ( OBJ-AT ?auto_178470 ?auto_178471 ) ( IN-CITY ?auto_178476 ?auto_178472 ) ( not ( = ?auto_178465 ?auto_178476 ) ) ( OBJ-AT ?auto_178466 ?auto_178476 ) ( IN-CITY ?auto_178473 ?auto_178472 ) ( not ( = ?auto_178465 ?auto_178473 ) ) ( OBJ-AT ?auto_178469 ?auto_178473 ) ( OBJ-AT ?auto_178468 ?auto_178471 ) ( IN-CITY ?auto_178474 ?auto_178472 ) ( not ( = ?auto_178465 ?auto_178474 ) ) ( OBJ-AT ?auto_178467 ?auto_178474 ) ( TRUCK-AT ?auto_178475 ?auto_178465 ) ( not ( = ?auto_178467 ?auto_178468 ) ) ( not ( = ?auto_178471 ?auto_178474 ) ) ( not ( = ?auto_178467 ?auto_178469 ) ) ( not ( = ?auto_178468 ?auto_178469 ) ) ( not ( = ?auto_178473 ?auto_178471 ) ) ( not ( = ?auto_178473 ?auto_178474 ) ) ( not ( = ?auto_178467 ?auto_178466 ) ) ( not ( = ?auto_178468 ?auto_178466 ) ) ( not ( = ?auto_178469 ?auto_178466 ) ) ( not ( = ?auto_178476 ?auto_178473 ) ) ( not ( = ?auto_178476 ?auto_178471 ) ) ( not ( = ?auto_178476 ?auto_178474 ) ) ( not ( = ?auto_178467 ?auto_178470 ) ) ( not ( = ?auto_178468 ?auto_178470 ) ) ( not ( = ?auto_178469 ?auto_178470 ) ) ( not ( = ?auto_178466 ?auto_178470 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178467 ?auto_178468 ?auto_178469 ?auto_178470 ?auto_178466 ?auto_178465 )
      ( DELIVER-5PKG-VERIFY ?auto_178466 ?auto_178467 ?auto_178468 ?auto_178469 ?auto_178470 ?auto_178465 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178517 - OBJ
      ?auto_178518 - OBJ
      ?auto_178519 - OBJ
      ?auto_178520 - OBJ
      ?auto_178521 - OBJ
      ?auto_178516 - LOCATION
    )
    :vars
    (
      ?auto_178522 - LOCATION
      ?auto_178523 - CITY
      ?auto_178527 - LOCATION
      ?auto_178524 - LOCATION
      ?auto_178525 - LOCATION
      ?auto_178526 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178522 ?auto_178523 ) ( IN-CITY ?auto_178516 ?auto_178523 ) ( not ( = ?auto_178516 ?auto_178522 ) ) ( OBJ-AT ?auto_178520 ?auto_178522 ) ( IN-CITY ?auto_178527 ?auto_178523 ) ( not ( = ?auto_178516 ?auto_178527 ) ) ( OBJ-AT ?auto_178517 ?auto_178527 ) ( IN-CITY ?auto_178524 ?auto_178523 ) ( not ( = ?auto_178516 ?auto_178524 ) ) ( OBJ-AT ?auto_178521 ?auto_178524 ) ( OBJ-AT ?auto_178519 ?auto_178522 ) ( IN-CITY ?auto_178525 ?auto_178523 ) ( not ( = ?auto_178516 ?auto_178525 ) ) ( OBJ-AT ?auto_178518 ?auto_178525 ) ( TRUCK-AT ?auto_178526 ?auto_178516 ) ( not ( = ?auto_178518 ?auto_178519 ) ) ( not ( = ?auto_178522 ?auto_178525 ) ) ( not ( = ?auto_178518 ?auto_178521 ) ) ( not ( = ?auto_178519 ?auto_178521 ) ) ( not ( = ?auto_178524 ?auto_178522 ) ) ( not ( = ?auto_178524 ?auto_178525 ) ) ( not ( = ?auto_178518 ?auto_178517 ) ) ( not ( = ?auto_178519 ?auto_178517 ) ) ( not ( = ?auto_178521 ?auto_178517 ) ) ( not ( = ?auto_178527 ?auto_178524 ) ) ( not ( = ?auto_178527 ?auto_178522 ) ) ( not ( = ?auto_178527 ?auto_178525 ) ) ( not ( = ?auto_178518 ?auto_178520 ) ) ( not ( = ?auto_178519 ?auto_178520 ) ) ( not ( = ?auto_178521 ?auto_178520 ) ) ( not ( = ?auto_178517 ?auto_178520 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178518 ?auto_178519 ?auto_178521 ?auto_178520 ?auto_178517 ?auto_178516 )
      ( DELIVER-5PKG-VERIFY ?auto_178517 ?auto_178518 ?auto_178519 ?auto_178520 ?auto_178521 ?auto_178516 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178568 - OBJ
      ?auto_178569 - OBJ
      ?auto_178570 - OBJ
      ?auto_178571 - OBJ
      ?auto_178572 - OBJ
      ?auto_178567 - LOCATION
    )
    :vars
    (
      ?auto_178573 - LOCATION
      ?auto_178574 - CITY
      ?auto_178578 - LOCATION
      ?auto_178575 - LOCATION
      ?auto_178576 - LOCATION
      ?auto_178577 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178573 ?auto_178574 ) ( IN-CITY ?auto_178567 ?auto_178574 ) ( not ( = ?auto_178567 ?auto_178573 ) ) ( OBJ-AT ?auto_178572 ?auto_178573 ) ( IN-CITY ?auto_178578 ?auto_178574 ) ( not ( = ?auto_178567 ?auto_178578 ) ) ( OBJ-AT ?auto_178568 ?auto_178578 ) ( IN-CITY ?auto_178575 ?auto_178574 ) ( not ( = ?auto_178567 ?auto_178575 ) ) ( OBJ-AT ?auto_178570 ?auto_178575 ) ( OBJ-AT ?auto_178571 ?auto_178573 ) ( IN-CITY ?auto_178576 ?auto_178574 ) ( not ( = ?auto_178567 ?auto_178576 ) ) ( OBJ-AT ?auto_178569 ?auto_178576 ) ( TRUCK-AT ?auto_178577 ?auto_178567 ) ( not ( = ?auto_178569 ?auto_178571 ) ) ( not ( = ?auto_178573 ?auto_178576 ) ) ( not ( = ?auto_178569 ?auto_178570 ) ) ( not ( = ?auto_178571 ?auto_178570 ) ) ( not ( = ?auto_178575 ?auto_178573 ) ) ( not ( = ?auto_178575 ?auto_178576 ) ) ( not ( = ?auto_178569 ?auto_178568 ) ) ( not ( = ?auto_178571 ?auto_178568 ) ) ( not ( = ?auto_178570 ?auto_178568 ) ) ( not ( = ?auto_178578 ?auto_178575 ) ) ( not ( = ?auto_178578 ?auto_178573 ) ) ( not ( = ?auto_178578 ?auto_178576 ) ) ( not ( = ?auto_178569 ?auto_178572 ) ) ( not ( = ?auto_178571 ?auto_178572 ) ) ( not ( = ?auto_178570 ?auto_178572 ) ) ( not ( = ?auto_178568 ?auto_178572 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178569 ?auto_178571 ?auto_178570 ?auto_178572 ?auto_178568 ?auto_178567 )
      ( DELIVER-5PKG-VERIFY ?auto_178568 ?auto_178569 ?auto_178570 ?auto_178571 ?auto_178572 ?auto_178567 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178619 - OBJ
      ?auto_178620 - OBJ
      ?auto_178621 - OBJ
      ?auto_178622 - OBJ
      ?auto_178623 - OBJ
      ?auto_178618 - LOCATION
    )
    :vars
    (
      ?auto_178624 - LOCATION
      ?auto_178625 - CITY
      ?auto_178629 - LOCATION
      ?auto_178626 - LOCATION
      ?auto_178627 - LOCATION
      ?auto_178628 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178624 ?auto_178625 ) ( IN-CITY ?auto_178618 ?auto_178625 ) ( not ( = ?auto_178618 ?auto_178624 ) ) ( OBJ-AT ?auto_178622 ?auto_178624 ) ( IN-CITY ?auto_178629 ?auto_178625 ) ( not ( = ?auto_178618 ?auto_178629 ) ) ( OBJ-AT ?auto_178619 ?auto_178629 ) ( IN-CITY ?auto_178626 ?auto_178625 ) ( not ( = ?auto_178618 ?auto_178626 ) ) ( OBJ-AT ?auto_178621 ?auto_178626 ) ( OBJ-AT ?auto_178623 ?auto_178624 ) ( IN-CITY ?auto_178627 ?auto_178625 ) ( not ( = ?auto_178618 ?auto_178627 ) ) ( OBJ-AT ?auto_178620 ?auto_178627 ) ( TRUCK-AT ?auto_178628 ?auto_178618 ) ( not ( = ?auto_178620 ?auto_178623 ) ) ( not ( = ?auto_178624 ?auto_178627 ) ) ( not ( = ?auto_178620 ?auto_178621 ) ) ( not ( = ?auto_178623 ?auto_178621 ) ) ( not ( = ?auto_178626 ?auto_178624 ) ) ( not ( = ?auto_178626 ?auto_178627 ) ) ( not ( = ?auto_178620 ?auto_178619 ) ) ( not ( = ?auto_178623 ?auto_178619 ) ) ( not ( = ?auto_178621 ?auto_178619 ) ) ( not ( = ?auto_178629 ?auto_178626 ) ) ( not ( = ?auto_178629 ?auto_178624 ) ) ( not ( = ?auto_178629 ?auto_178627 ) ) ( not ( = ?auto_178620 ?auto_178622 ) ) ( not ( = ?auto_178623 ?auto_178622 ) ) ( not ( = ?auto_178621 ?auto_178622 ) ) ( not ( = ?auto_178619 ?auto_178622 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178620 ?auto_178623 ?auto_178621 ?auto_178622 ?auto_178619 ?auto_178618 )
      ( DELIVER-5PKG-VERIFY ?auto_178619 ?auto_178620 ?auto_178621 ?auto_178622 ?auto_178623 ?auto_178618 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178886 - OBJ
      ?auto_178887 - OBJ
      ?auto_178888 - OBJ
      ?auto_178889 - OBJ
      ?auto_178890 - OBJ
      ?auto_178885 - LOCATION
    )
    :vars
    (
      ?auto_178891 - LOCATION
      ?auto_178892 - CITY
      ?auto_178896 - LOCATION
      ?auto_178893 - LOCATION
      ?auto_178894 - LOCATION
      ?auto_178895 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178891 ?auto_178892 ) ( IN-CITY ?auto_178885 ?auto_178892 ) ( not ( = ?auto_178885 ?auto_178891 ) ) ( OBJ-AT ?auto_178888 ?auto_178891 ) ( IN-CITY ?auto_178896 ?auto_178892 ) ( not ( = ?auto_178885 ?auto_178896 ) ) ( OBJ-AT ?auto_178886 ?auto_178896 ) ( IN-CITY ?auto_178893 ?auto_178892 ) ( not ( = ?auto_178885 ?auto_178893 ) ) ( OBJ-AT ?auto_178890 ?auto_178893 ) ( OBJ-AT ?auto_178889 ?auto_178891 ) ( IN-CITY ?auto_178894 ?auto_178892 ) ( not ( = ?auto_178885 ?auto_178894 ) ) ( OBJ-AT ?auto_178887 ?auto_178894 ) ( TRUCK-AT ?auto_178895 ?auto_178885 ) ( not ( = ?auto_178887 ?auto_178889 ) ) ( not ( = ?auto_178891 ?auto_178894 ) ) ( not ( = ?auto_178887 ?auto_178890 ) ) ( not ( = ?auto_178889 ?auto_178890 ) ) ( not ( = ?auto_178893 ?auto_178891 ) ) ( not ( = ?auto_178893 ?auto_178894 ) ) ( not ( = ?auto_178887 ?auto_178886 ) ) ( not ( = ?auto_178889 ?auto_178886 ) ) ( not ( = ?auto_178890 ?auto_178886 ) ) ( not ( = ?auto_178896 ?auto_178893 ) ) ( not ( = ?auto_178896 ?auto_178891 ) ) ( not ( = ?auto_178896 ?auto_178894 ) ) ( not ( = ?auto_178887 ?auto_178888 ) ) ( not ( = ?auto_178889 ?auto_178888 ) ) ( not ( = ?auto_178890 ?auto_178888 ) ) ( not ( = ?auto_178886 ?auto_178888 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178887 ?auto_178889 ?auto_178890 ?auto_178888 ?auto_178886 ?auto_178885 )
      ( DELIVER-5PKG-VERIFY ?auto_178886 ?auto_178887 ?auto_178888 ?auto_178889 ?auto_178890 ?auto_178885 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178937 - OBJ
      ?auto_178938 - OBJ
      ?auto_178939 - OBJ
      ?auto_178940 - OBJ
      ?auto_178941 - OBJ
      ?auto_178936 - LOCATION
    )
    :vars
    (
      ?auto_178942 - LOCATION
      ?auto_178943 - CITY
      ?auto_178947 - LOCATION
      ?auto_178944 - LOCATION
      ?auto_178945 - LOCATION
      ?auto_178946 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178942 ?auto_178943 ) ( IN-CITY ?auto_178936 ?auto_178943 ) ( not ( = ?auto_178936 ?auto_178942 ) ) ( OBJ-AT ?auto_178939 ?auto_178942 ) ( IN-CITY ?auto_178947 ?auto_178943 ) ( not ( = ?auto_178936 ?auto_178947 ) ) ( OBJ-AT ?auto_178937 ?auto_178947 ) ( IN-CITY ?auto_178944 ?auto_178943 ) ( not ( = ?auto_178936 ?auto_178944 ) ) ( OBJ-AT ?auto_178940 ?auto_178944 ) ( OBJ-AT ?auto_178941 ?auto_178942 ) ( IN-CITY ?auto_178945 ?auto_178943 ) ( not ( = ?auto_178936 ?auto_178945 ) ) ( OBJ-AT ?auto_178938 ?auto_178945 ) ( TRUCK-AT ?auto_178946 ?auto_178936 ) ( not ( = ?auto_178938 ?auto_178941 ) ) ( not ( = ?auto_178942 ?auto_178945 ) ) ( not ( = ?auto_178938 ?auto_178940 ) ) ( not ( = ?auto_178941 ?auto_178940 ) ) ( not ( = ?auto_178944 ?auto_178942 ) ) ( not ( = ?auto_178944 ?auto_178945 ) ) ( not ( = ?auto_178938 ?auto_178937 ) ) ( not ( = ?auto_178941 ?auto_178937 ) ) ( not ( = ?auto_178940 ?auto_178937 ) ) ( not ( = ?auto_178947 ?auto_178944 ) ) ( not ( = ?auto_178947 ?auto_178942 ) ) ( not ( = ?auto_178947 ?auto_178945 ) ) ( not ( = ?auto_178938 ?auto_178939 ) ) ( not ( = ?auto_178941 ?auto_178939 ) ) ( not ( = ?auto_178940 ?auto_178939 ) ) ( not ( = ?auto_178937 ?auto_178939 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178938 ?auto_178941 ?auto_178940 ?auto_178939 ?auto_178937 ?auto_178936 )
      ( DELIVER-5PKG-VERIFY ?auto_178937 ?auto_178938 ?auto_178939 ?auto_178940 ?auto_178941 ?auto_178936 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179150 - OBJ
      ?auto_179151 - OBJ
      ?auto_179152 - OBJ
      ?auto_179153 - OBJ
      ?auto_179154 - OBJ
      ?auto_179149 - LOCATION
    )
    :vars
    (
      ?auto_179155 - LOCATION
      ?auto_179156 - CITY
      ?auto_179160 - LOCATION
      ?auto_179157 - LOCATION
      ?auto_179158 - LOCATION
      ?auto_179159 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179155 ?auto_179156 ) ( IN-CITY ?auto_179149 ?auto_179156 ) ( not ( = ?auto_179149 ?auto_179155 ) ) ( OBJ-AT ?auto_179154 ?auto_179155 ) ( IN-CITY ?auto_179160 ?auto_179156 ) ( not ( = ?auto_179149 ?auto_179160 ) ) ( OBJ-AT ?auto_179150 ?auto_179160 ) ( IN-CITY ?auto_179157 ?auto_179156 ) ( not ( = ?auto_179149 ?auto_179157 ) ) ( OBJ-AT ?auto_179153 ?auto_179157 ) ( OBJ-AT ?auto_179151 ?auto_179155 ) ( IN-CITY ?auto_179158 ?auto_179156 ) ( not ( = ?auto_179149 ?auto_179158 ) ) ( OBJ-AT ?auto_179152 ?auto_179158 ) ( TRUCK-AT ?auto_179159 ?auto_179149 ) ( not ( = ?auto_179152 ?auto_179151 ) ) ( not ( = ?auto_179155 ?auto_179158 ) ) ( not ( = ?auto_179152 ?auto_179153 ) ) ( not ( = ?auto_179151 ?auto_179153 ) ) ( not ( = ?auto_179157 ?auto_179155 ) ) ( not ( = ?auto_179157 ?auto_179158 ) ) ( not ( = ?auto_179152 ?auto_179150 ) ) ( not ( = ?auto_179151 ?auto_179150 ) ) ( not ( = ?auto_179153 ?auto_179150 ) ) ( not ( = ?auto_179160 ?auto_179157 ) ) ( not ( = ?auto_179160 ?auto_179155 ) ) ( not ( = ?auto_179160 ?auto_179158 ) ) ( not ( = ?auto_179152 ?auto_179154 ) ) ( not ( = ?auto_179151 ?auto_179154 ) ) ( not ( = ?auto_179153 ?auto_179154 ) ) ( not ( = ?auto_179150 ?auto_179154 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179152 ?auto_179151 ?auto_179153 ?auto_179154 ?auto_179150 ?auto_179149 )
      ( DELIVER-5PKG-VERIFY ?auto_179150 ?auto_179151 ?auto_179152 ?auto_179153 ?auto_179154 ?auto_179149 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179201 - OBJ
      ?auto_179202 - OBJ
      ?auto_179203 - OBJ
      ?auto_179204 - OBJ
      ?auto_179205 - OBJ
      ?auto_179200 - LOCATION
    )
    :vars
    (
      ?auto_179206 - LOCATION
      ?auto_179207 - CITY
      ?auto_179211 - LOCATION
      ?auto_179208 - LOCATION
      ?auto_179209 - LOCATION
      ?auto_179210 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179206 ?auto_179207 ) ( IN-CITY ?auto_179200 ?auto_179207 ) ( not ( = ?auto_179200 ?auto_179206 ) ) ( OBJ-AT ?auto_179204 ?auto_179206 ) ( IN-CITY ?auto_179211 ?auto_179207 ) ( not ( = ?auto_179200 ?auto_179211 ) ) ( OBJ-AT ?auto_179201 ?auto_179211 ) ( IN-CITY ?auto_179208 ?auto_179207 ) ( not ( = ?auto_179200 ?auto_179208 ) ) ( OBJ-AT ?auto_179205 ?auto_179208 ) ( OBJ-AT ?auto_179202 ?auto_179206 ) ( IN-CITY ?auto_179209 ?auto_179207 ) ( not ( = ?auto_179200 ?auto_179209 ) ) ( OBJ-AT ?auto_179203 ?auto_179209 ) ( TRUCK-AT ?auto_179210 ?auto_179200 ) ( not ( = ?auto_179203 ?auto_179202 ) ) ( not ( = ?auto_179206 ?auto_179209 ) ) ( not ( = ?auto_179203 ?auto_179205 ) ) ( not ( = ?auto_179202 ?auto_179205 ) ) ( not ( = ?auto_179208 ?auto_179206 ) ) ( not ( = ?auto_179208 ?auto_179209 ) ) ( not ( = ?auto_179203 ?auto_179201 ) ) ( not ( = ?auto_179202 ?auto_179201 ) ) ( not ( = ?auto_179205 ?auto_179201 ) ) ( not ( = ?auto_179211 ?auto_179208 ) ) ( not ( = ?auto_179211 ?auto_179206 ) ) ( not ( = ?auto_179211 ?auto_179209 ) ) ( not ( = ?auto_179203 ?auto_179204 ) ) ( not ( = ?auto_179202 ?auto_179204 ) ) ( not ( = ?auto_179205 ?auto_179204 ) ) ( not ( = ?auto_179201 ?auto_179204 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179203 ?auto_179202 ?auto_179205 ?auto_179204 ?auto_179201 ?auto_179200 )
      ( DELIVER-5PKG-VERIFY ?auto_179201 ?auto_179202 ?auto_179203 ?auto_179204 ?auto_179205 ?auto_179200 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179361 - OBJ
      ?auto_179362 - OBJ
      ?auto_179363 - OBJ
      ?auto_179364 - OBJ
      ?auto_179365 - OBJ
      ?auto_179360 - LOCATION
    )
    :vars
    (
      ?auto_179366 - LOCATION
      ?auto_179367 - CITY
      ?auto_179371 - LOCATION
      ?auto_179368 - LOCATION
      ?auto_179369 - LOCATION
      ?auto_179370 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179366 ?auto_179367 ) ( IN-CITY ?auto_179360 ?auto_179367 ) ( not ( = ?auto_179360 ?auto_179366 ) ) ( OBJ-AT ?auto_179365 ?auto_179366 ) ( IN-CITY ?auto_179371 ?auto_179367 ) ( not ( = ?auto_179360 ?auto_179371 ) ) ( OBJ-AT ?auto_179361 ?auto_179371 ) ( IN-CITY ?auto_179368 ?auto_179367 ) ( not ( = ?auto_179360 ?auto_179368 ) ) ( OBJ-AT ?auto_179363 ?auto_179368 ) ( OBJ-AT ?auto_179362 ?auto_179366 ) ( IN-CITY ?auto_179369 ?auto_179367 ) ( not ( = ?auto_179360 ?auto_179369 ) ) ( OBJ-AT ?auto_179364 ?auto_179369 ) ( TRUCK-AT ?auto_179370 ?auto_179360 ) ( not ( = ?auto_179364 ?auto_179362 ) ) ( not ( = ?auto_179366 ?auto_179369 ) ) ( not ( = ?auto_179364 ?auto_179363 ) ) ( not ( = ?auto_179362 ?auto_179363 ) ) ( not ( = ?auto_179368 ?auto_179366 ) ) ( not ( = ?auto_179368 ?auto_179369 ) ) ( not ( = ?auto_179364 ?auto_179361 ) ) ( not ( = ?auto_179362 ?auto_179361 ) ) ( not ( = ?auto_179363 ?auto_179361 ) ) ( not ( = ?auto_179371 ?auto_179368 ) ) ( not ( = ?auto_179371 ?auto_179366 ) ) ( not ( = ?auto_179371 ?auto_179369 ) ) ( not ( = ?auto_179364 ?auto_179365 ) ) ( not ( = ?auto_179362 ?auto_179365 ) ) ( not ( = ?auto_179363 ?auto_179365 ) ) ( not ( = ?auto_179361 ?auto_179365 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179364 ?auto_179362 ?auto_179363 ?auto_179365 ?auto_179361 ?auto_179360 )
      ( DELIVER-5PKG-VERIFY ?auto_179361 ?auto_179362 ?auto_179363 ?auto_179364 ?auto_179365 ?auto_179360 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179412 - OBJ
      ?auto_179413 - OBJ
      ?auto_179414 - OBJ
      ?auto_179415 - OBJ
      ?auto_179416 - OBJ
      ?auto_179411 - LOCATION
    )
    :vars
    (
      ?auto_179417 - LOCATION
      ?auto_179418 - CITY
      ?auto_179422 - LOCATION
      ?auto_179419 - LOCATION
      ?auto_179420 - LOCATION
      ?auto_179421 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179417 ?auto_179418 ) ( IN-CITY ?auto_179411 ?auto_179418 ) ( not ( = ?auto_179411 ?auto_179417 ) ) ( OBJ-AT ?auto_179415 ?auto_179417 ) ( IN-CITY ?auto_179422 ?auto_179418 ) ( not ( = ?auto_179411 ?auto_179422 ) ) ( OBJ-AT ?auto_179412 ?auto_179422 ) ( IN-CITY ?auto_179419 ?auto_179418 ) ( not ( = ?auto_179411 ?auto_179419 ) ) ( OBJ-AT ?auto_179414 ?auto_179419 ) ( OBJ-AT ?auto_179413 ?auto_179417 ) ( IN-CITY ?auto_179420 ?auto_179418 ) ( not ( = ?auto_179411 ?auto_179420 ) ) ( OBJ-AT ?auto_179416 ?auto_179420 ) ( TRUCK-AT ?auto_179421 ?auto_179411 ) ( not ( = ?auto_179416 ?auto_179413 ) ) ( not ( = ?auto_179417 ?auto_179420 ) ) ( not ( = ?auto_179416 ?auto_179414 ) ) ( not ( = ?auto_179413 ?auto_179414 ) ) ( not ( = ?auto_179419 ?auto_179417 ) ) ( not ( = ?auto_179419 ?auto_179420 ) ) ( not ( = ?auto_179416 ?auto_179412 ) ) ( not ( = ?auto_179413 ?auto_179412 ) ) ( not ( = ?auto_179414 ?auto_179412 ) ) ( not ( = ?auto_179422 ?auto_179419 ) ) ( not ( = ?auto_179422 ?auto_179417 ) ) ( not ( = ?auto_179422 ?auto_179420 ) ) ( not ( = ?auto_179416 ?auto_179415 ) ) ( not ( = ?auto_179413 ?auto_179415 ) ) ( not ( = ?auto_179414 ?auto_179415 ) ) ( not ( = ?auto_179412 ?auto_179415 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179416 ?auto_179413 ?auto_179414 ?auto_179415 ?auto_179412 ?auto_179411 )
      ( DELIVER-5PKG-VERIFY ?auto_179412 ?auto_179413 ?auto_179414 ?auto_179415 ?auto_179416 ?auto_179411 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179624 - OBJ
      ?auto_179625 - OBJ
      ?auto_179626 - OBJ
      ?auto_179627 - OBJ
      ?auto_179628 - OBJ
      ?auto_179623 - LOCATION
    )
    :vars
    (
      ?auto_179629 - LOCATION
      ?auto_179630 - CITY
      ?auto_179634 - LOCATION
      ?auto_179631 - LOCATION
      ?auto_179632 - LOCATION
      ?auto_179633 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179629 ?auto_179630 ) ( IN-CITY ?auto_179623 ?auto_179630 ) ( not ( = ?auto_179623 ?auto_179629 ) ) ( OBJ-AT ?auto_179626 ?auto_179629 ) ( IN-CITY ?auto_179634 ?auto_179630 ) ( not ( = ?auto_179623 ?auto_179634 ) ) ( OBJ-AT ?auto_179624 ?auto_179634 ) ( IN-CITY ?auto_179631 ?auto_179630 ) ( not ( = ?auto_179623 ?auto_179631 ) ) ( OBJ-AT ?auto_179628 ?auto_179631 ) ( OBJ-AT ?auto_179625 ?auto_179629 ) ( IN-CITY ?auto_179632 ?auto_179630 ) ( not ( = ?auto_179623 ?auto_179632 ) ) ( OBJ-AT ?auto_179627 ?auto_179632 ) ( TRUCK-AT ?auto_179633 ?auto_179623 ) ( not ( = ?auto_179627 ?auto_179625 ) ) ( not ( = ?auto_179629 ?auto_179632 ) ) ( not ( = ?auto_179627 ?auto_179628 ) ) ( not ( = ?auto_179625 ?auto_179628 ) ) ( not ( = ?auto_179631 ?auto_179629 ) ) ( not ( = ?auto_179631 ?auto_179632 ) ) ( not ( = ?auto_179627 ?auto_179624 ) ) ( not ( = ?auto_179625 ?auto_179624 ) ) ( not ( = ?auto_179628 ?auto_179624 ) ) ( not ( = ?auto_179634 ?auto_179631 ) ) ( not ( = ?auto_179634 ?auto_179629 ) ) ( not ( = ?auto_179634 ?auto_179632 ) ) ( not ( = ?auto_179627 ?auto_179626 ) ) ( not ( = ?auto_179625 ?auto_179626 ) ) ( not ( = ?auto_179628 ?auto_179626 ) ) ( not ( = ?auto_179624 ?auto_179626 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179627 ?auto_179625 ?auto_179628 ?auto_179626 ?auto_179624 ?auto_179623 )
      ( DELIVER-5PKG-VERIFY ?auto_179624 ?auto_179625 ?auto_179626 ?auto_179627 ?auto_179628 ?auto_179623 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179730 - OBJ
      ?auto_179731 - OBJ
      ?auto_179732 - OBJ
      ?auto_179733 - OBJ
      ?auto_179734 - OBJ
      ?auto_179729 - LOCATION
    )
    :vars
    (
      ?auto_179735 - LOCATION
      ?auto_179736 - CITY
      ?auto_179740 - LOCATION
      ?auto_179737 - LOCATION
      ?auto_179738 - LOCATION
      ?auto_179739 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179735 ?auto_179736 ) ( IN-CITY ?auto_179729 ?auto_179736 ) ( not ( = ?auto_179729 ?auto_179735 ) ) ( OBJ-AT ?auto_179732 ?auto_179735 ) ( IN-CITY ?auto_179740 ?auto_179736 ) ( not ( = ?auto_179729 ?auto_179740 ) ) ( OBJ-AT ?auto_179730 ?auto_179740 ) ( IN-CITY ?auto_179737 ?auto_179736 ) ( not ( = ?auto_179729 ?auto_179737 ) ) ( OBJ-AT ?auto_179733 ?auto_179737 ) ( OBJ-AT ?auto_179731 ?auto_179735 ) ( IN-CITY ?auto_179738 ?auto_179736 ) ( not ( = ?auto_179729 ?auto_179738 ) ) ( OBJ-AT ?auto_179734 ?auto_179738 ) ( TRUCK-AT ?auto_179739 ?auto_179729 ) ( not ( = ?auto_179734 ?auto_179731 ) ) ( not ( = ?auto_179735 ?auto_179738 ) ) ( not ( = ?auto_179734 ?auto_179733 ) ) ( not ( = ?auto_179731 ?auto_179733 ) ) ( not ( = ?auto_179737 ?auto_179735 ) ) ( not ( = ?auto_179737 ?auto_179738 ) ) ( not ( = ?auto_179734 ?auto_179730 ) ) ( not ( = ?auto_179731 ?auto_179730 ) ) ( not ( = ?auto_179733 ?auto_179730 ) ) ( not ( = ?auto_179740 ?auto_179737 ) ) ( not ( = ?auto_179740 ?auto_179735 ) ) ( not ( = ?auto_179740 ?auto_179738 ) ) ( not ( = ?auto_179734 ?auto_179732 ) ) ( not ( = ?auto_179731 ?auto_179732 ) ) ( not ( = ?auto_179733 ?auto_179732 ) ) ( not ( = ?auto_179730 ?auto_179732 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179734 ?auto_179731 ?auto_179733 ?auto_179732 ?auto_179730 ?auto_179729 )
      ( DELIVER-5PKG-VERIFY ?auto_179730 ?auto_179731 ?auto_179732 ?auto_179733 ?auto_179734 ?auto_179729 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179943 - OBJ
      ?auto_179944 - OBJ
      ?auto_179945 - OBJ
      ?auto_179946 - OBJ
      ?auto_179947 - OBJ
      ?auto_179942 - LOCATION
    )
    :vars
    (
      ?auto_179948 - LOCATION
      ?auto_179949 - CITY
      ?auto_179953 - LOCATION
      ?auto_179950 - LOCATION
      ?auto_179951 - LOCATION
      ?auto_179952 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179948 ?auto_179949 ) ( IN-CITY ?auto_179942 ?auto_179949 ) ( not ( = ?auto_179942 ?auto_179948 ) ) ( OBJ-AT ?auto_179947 ?auto_179948 ) ( IN-CITY ?auto_179953 ?auto_179949 ) ( not ( = ?auto_179942 ?auto_179953 ) ) ( OBJ-AT ?auto_179943 ?auto_179953 ) ( IN-CITY ?auto_179950 ?auto_179949 ) ( not ( = ?auto_179942 ?auto_179950 ) ) ( OBJ-AT ?auto_179944 ?auto_179950 ) ( OBJ-AT ?auto_179946 ?auto_179948 ) ( IN-CITY ?auto_179951 ?auto_179949 ) ( not ( = ?auto_179942 ?auto_179951 ) ) ( OBJ-AT ?auto_179945 ?auto_179951 ) ( TRUCK-AT ?auto_179952 ?auto_179942 ) ( not ( = ?auto_179945 ?auto_179946 ) ) ( not ( = ?auto_179948 ?auto_179951 ) ) ( not ( = ?auto_179945 ?auto_179944 ) ) ( not ( = ?auto_179946 ?auto_179944 ) ) ( not ( = ?auto_179950 ?auto_179948 ) ) ( not ( = ?auto_179950 ?auto_179951 ) ) ( not ( = ?auto_179945 ?auto_179943 ) ) ( not ( = ?auto_179946 ?auto_179943 ) ) ( not ( = ?auto_179944 ?auto_179943 ) ) ( not ( = ?auto_179953 ?auto_179950 ) ) ( not ( = ?auto_179953 ?auto_179948 ) ) ( not ( = ?auto_179953 ?auto_179951 ) ) ( not ( = ?auto_179945 ?auto_179947 ) ) ( not ( = ?auto_179946 ?auto_179947 ) ) ( not ( = ?auto_179944 ?auto_179947 ) ) ( not ( = ?auto_179943 ?auto_179947 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179945 ?auto_179946 ?auto_179944 ?auto_179947 ?auto_179943 ?auto_179942 )
      ( DELIVER-5PKG-VERIFY ?auto_179943 ?auto_179944 ?auto_179945 ?auto_179946 ?auto_179947 ?auto_179942 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179994 - OBJ
      ?auto_179995 - OBJ
      ?auto_179996 - OBJ
      ?auto_179997 - OBJ
      ?auto_179998 - OBJ
      ?auto_179993 - LOCATION
    )
    :vars
    (
      ?auto_179999 - LOCATION
      ?auto_180000 - CITY
      ?auto_180004 - LOCATION
      ?auto_180001 - LOCATION
      ?auto_180002 - LOCATION
      ?auto_180003 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179999 ?auto_180000 ) ( IN-CITY ?auto_179993 ?auto_180000 ) ( not ( = ?auto_179993 ?auto_179999 ) ) ( OBJ-AT ?auto_179997 ?auto_179999 ) ( IN-CITY ?auto_180004 ?auto_180000 ) ( not ( = ?auto_179993 ?auto_180004 ) ) ( OBJ-AT ?auto_179994 ?auto_180004 ) ( IN-CITY ?auto_180001 ?auto_180000 ) ( not ( = ?auto_179993 ?auto_180001 ) ) ( OBJ-AT ?auto_179995 ?auto_180001 ) ( OBJ-AT ?auto_179998 ?auto_179999 ) ( IN-CITY ?auto_180002 ?auto_180000 ) ( not ( = ?auto_179993 ?auto_180002 ) ) ( OBJ-AT ?auto_179996 ?auto_180002 ) ( TRUCK-AT ?auto_180003 ?auto_179993 ) ( not ( = ?auto_179996 ?auto_179998 ) ) ( not ( = ?auto_179999 ?auto_180002 ) ) ( not ( = ?auto_179996 ?auto_179995 ) ) ( not ( = ?auto_179998 ?auto_179995 ) ) ( not ( = ?auto_180001 ?auto_179999 ) ) ( not ( = ?auto_180001 ?auto_180002 ) ) ( not ( = ?auto_179996 ?auto_179994 ) ) ( not ( = ?auto_179998 ?auto_179994 ) ) ( not ( = ?auto_179995 ?auto_179994 ) ) ( not ( = ?auto_180004 ?auto_180001 ) ) ( not ( = ?auto_180004 ?auto_179999 ) ) ( not ( = ?auto_180004 ?auto_180002 ) ) ( not ( = ?auto_179996 ?auto_179997 ) ) ( not ( = ?auto_179998 ?auto_179997 ) ) ( not ( = ?auto_179995 ?auto_179997 ) ) ( not ( = ?auto_179994 ?auto_179997 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179996 ?auto_179998 ?auto_179995 ?auto_179997 ?auto_179994 ?auto_179993 )
      ( DELIVER-5PKG-VERIFY ?auto_179994 ?auto_179995 ?auto_179996 ?auto_179997 ?auto_179998 ?auto_179993 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_180045 - OBJ
      ?auto_180046 - OBJ
      ?auto_180047 - OBJ
      ?auto_180048 - OBJ
      ?auto_180049 - OBJ
      ?auto_180044 - LOCATION
    )
    :vars
    (
      ?auto_180050 - LOCATION
      ?auto_180051 - CITY
      ?auto_180055 - LOCATION
      ?auto_180052 - LOCATION
      ?auto_180053 - LOCATION
      ?auto_180054 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180050 ?auto_180051 ) ( IN-CITY ?auto_180044 ?auto_180051 ) ( not ( = ?auto_180044 ?auto_180050 ) ) ( OBJ-AT ?auto_180049 ?auto_180050 ) ( IN-CITY ?auto_180055 ?auto_180051 ) ( not ( = ?auto_180044 ?auto_180055 ) ) ( OBJ-AT ?auto_180045 ?auto_180055 ) ( IN-CITY ?auto_180052 ?auto_180051 ) ( not ( = ?auto_180044 ?auto_180052 ) ) ( OBJ-AT ?auto_180046 ?auto_180052 ) ( OBJ-AT ?auto_180047 ?auto_180050 ) ( IN-CITY ?auto_180053 ?auto_180051 ) ( not ( = ?auto_180044 ?auto_180053 ) ) ( OBJ-AT ?auto_180048 ?auto_180053 ) ( TRUCK-AT ?auto_180054 ?auto_180044 ) ( not ( = ?auto_180048 ?auto_180047 ) ) ( not ( = ?auto_180050 ?auto_180053 ) ) ( not ( = ?auto_180048 ?auto_180046 ) ) ( not ( = ?auto_180047 ?auto_180046 ) ) ( not ( = ?auto_180052 ?auto_180050 ) ) ( not ( = ?auto_180052 ?auto_180053 ) ) ( not ( = ?auto_180048 ?auto_180045 ) ) ( not ( = ?auto_180047 ?auto_180045 ) ) ( not ( = ?auto_180046 ?auto_180045 ) ) ( not ( = ?auto_180055 ?auto_180052 ) ) ( not ( = ?auto_180055 ?auto_180050 ) ) ( not ( = ?auto_180055 ?auto_180053 ) ) ( not ( = ?auto_180048 ?auto_180049 ) ) ( not ( = ?auto_180047 ?auto_180049 ) ) ( not ( = ?auto_180046 ?auto_180049 ) ) ( not ( = ?auto_180045 ?auto_180049 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_180048 ?auto_180047 ?auto_180046 ?auto_180049 ?auto_180045 ?auto_180044 )
      ( DELIVER-5PKG-VERIFY ?auto_180045 ?auto_180046 ?auto_180047 ?auto_180048 ?auto_180049 ?auto_180044 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_180096 - OBJ
      ?auto_180097 - OBJ
      ?auto_180098 - OBJ
      ?auto_180099 - OBJ
      ?auto_180100 - OBJ
      ?auto_180095 - LOCATION
    )
    :vars
    (
      ?auto_180101 - LOCATION
      ?auto_180102 - CITY
      ?auto_180106 - LOCATION
      ?auto_180103 - LOCATION
      ?auto_180104 - LOCATION
      ?auto_180105 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180101 ?auto_180102 ) ( IN-CITY ?auto_180095 ?auto_180102 ) ( not ( = ?auto_180095 ?auto_180101 ) ) ( OBJ-AT ?auto_180099 ?auto_180101 ) ( IN-CITY ?auto_180106 ?auto_180102 ) ( not ( = ?auto_180095 ?auto_180106 ) ) ( OBJ-AT ?auto_180096 ?auto_180106 ) ( IN-CITY ?auto_180103 ?auto_180102 ) ( not ( = ?auto_180095 ?auto_180103 ) ) ( OBJ-AT ?auto_180097 ?auto_180103 ) ( OBJ-AT ?auto_180098 ?auto_180101 ) ( IN-CITY ?auto_180104 ?auto_180102 ) ( not ( = ?auto_180095 ?auto_180104 ) ) ( OBJ-AT ?auto_180100 ?auto_180104 ) ( TRUCK-AT ?auto_180105 ?auto_180095 ) ( not ( = ?auto_180100 ?auto_180098 ) ) ( not ( = ?auto_180101 ?auto_180104 ) ) ( not ( = ?auto_180100 ?auto_180097 ) ) ( not ( = ?auto_180098 ?auto_180097 ) ) ( not ( = ?auto_180103 ?auto_180101 ) ) ( not ( = ?auto_180103 ?auto_180104 ) ) ( not ( = ?auto_180100 ?auto_180096 ) ) ( not ( = ?auto_180098 ?auto_180096 ) ) ( not ( = ?auto_180097 ?auto_180096 ) ) ( not ( = ?auto_180106 ?auto_180103 ) ) ( not ( = ?auto_180106 ?auto_180101 ) ) ( not ( = ?auto_180106 ?auto_180104 ) ) ( not ( = ?auto_180100 ?auto_180099 ) ) ( not ( = ?auto_180098 ?auto_180099 ) ) ( not ( = ?auto_180097 ?auto_180099 ) ) ( not ( = ?auto_180096 ?auto_180099 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_180100 ?auto_180098 ?auto_180097 ?auto_180099 ?auto_180096 ?auto_180095 )
      ( DELIVER-5PKG-VERIFY ?auto_180096 ?auto_180097 ?auto_180098 ?auto_180099 ?auto_180100 ?auto_180095 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_180417 - OBJ
      ?auto_180418 - OBJ
      ?auto_180419 - OBJ
      ?auto_180420 - OBJ
      ?auto_180421 - OBJ
      ?auto_180416 - LOCATION
    )
    :vars
    (
      ?auto_180422 - LOCATION
      ?auto_180423 - CITY
      ?auto_180427 - LOCATION
      ?auto_180424 - LOCATION
      ?auto_180425 - LOCATION
      ?auto_180426 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180422 ?auto_180423 ) ( IN-CITY ?auto_180416 ?auto_180423 ) ( not ( = ?auto_180416 ?auto_180422 ) ) ( OBJ-AT ?auto_180419 ?auto_180422 ) ( IN-CITY ?auto_180427 ?auto_180423 ) ( not ( = ?auto_180416 ?auto_180427 ) ) ( OBJ-AT ?auto_180417 ?auto_180427 ) ( IN-CITY ?auto_180424 ?auto_180423 ) ( not ( = ?auto_180416 ?auto_180424 ) ) ( OBJ-AT ?auto_180418 ?auto_180424 ) ( OBJ-AT ?auto_180421 ?auto_180422 ) ( IN-CITY ?auto_180425 ?auto_180423 ) ( not ( = ?auto_180416 ?auto_180425 ) ) ( OBJ-AT ?auto_180420 ?auto_180425 ) ( TRUCK-AT ?auto_180426 ?auto_180416 ) ( not ( = ?auto_180420 ?auto_180421 ) ) ( not ( = ?auto_180422 ?auto_180425 ) ) ( not ( = ?auto_180420 ?auto_180418 ) ) ( not ( = ?auto_180421 ?auto_180418 ) ) ( not ( = ?auto_180424 ?auto_180422 ) ) ( not ( = ?auto_180424 ?auto_180425 ) ) ( not ( = ?auto_180420 ?auto_180417 ) ) ( not ( = ?auto_180421 ?auto_180417 ) ) ( not ( = ?auto_180418 ?auto_180417 ) ) ( not ( = ?auto_180427 ?auto_180424 ) ) ( not ( = ?auto_180427 ?auto_180422 ) ) ( not ( = ?auto_180427 ?auto_180425 ) ) ( not ( = ?auto_180420 ?auto_180419 ) ) ( not ( = ?auto_180421 ?auto_180419 ) ) ( not ( = ?auto_180418 ?auto_180419 ) ) ( not ( = ?auto_180417 ?auto_180419 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_180420 ?auto_180421 ?auto_180418 ?auto_180419 ?auto_180417 ?auto_180416 )
      ( DELIVER-5PKG-VERIFY ?auto_180417 ?auto_180418 ?auto_180419 ?auto_180420 ?auto_180421 ?auto_180416 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_180468 - OBJ
      ?auto_180469 - OBJ
      ?auto_180470 - OBJ
      ?auto_180471 - OBJ
      ?auto_180472 - OBJ
      ?auto_180467 - LOCATION
    )
    :vars
    (
      ?auto_180473 - LOCATION
      ?auto_180474 - CITY
      ?auto_180478 - LOCATION
      ?auto_180475 - LOCATION
      ?auto_180476 - LOCATION
      ?auto_180477 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180473 ?auto_180474 ) ( IN-CITY ?auto_180467 ?auto_180474 ) ( not ( = ?auto_180467 ?auto_180473 ) ) ( OBJ-AT ?auto_180470 ?auto_180473 ) ( IN-CITY ?auto_180478 ?auto_180474 ) ( not ( = ?auto_180467 ?auto_180478 ) ) ( OBJ-AT ?auto_180468 ?auto_180478 ) ( IN-CITY ?auto_180475 ?auto_180474 ) ( not ( = ?auto_180467 ?auto_180475 ) ) ( OBJ-AT ?auto_180469 ?auto_180475 ) ( OBJ-AT ?auto_180471 ?auto_180473 ) ( IN-CITY ?auto_180476 ?auto_180474 ) ( not ( = ?auto_180467 ?auto_180476 ) ) ( OBJ-AT ?auto_180472 ?auto_180476 ) ( TRUCK-AT ?auto_180477 ?auto_180467 ) ( not ( = ?auto_180472 ?auto_180471 ) ) ( not ( = ?auto_180473 ?auto_180476 ) ) ( not ( = ?auto_180472 ?auto_180469 ) ) ( not ( = ?auto_180471 ?auto_180469 ) ) ( not ( = ?auto_180475 ?auto_180473 ) ) ( not ( = ?auto_180475 ?auto_180476 ) ) ( not ( = ?auto_180472 ?auto_180468 ) ) ( not ( = ?auto_180471 ?auto_180468 ) ) ( not ( = ?auto_180469 ?auto_180468 ) ) ( not ( = ?auto_180478 ?auto_180475 ) ) ( not ( = ?auto_180478 ?auto_180473 ) ) ( not ( = ?auto_180478 ?auto_180476 ) ) ( not ( = ?auto_180472 ?auto_180470 ) ) ( not ( = ?auto_180471 ?auto_180470 ) ) ( not ( = ?auto_180469 ?auto_180470 ) ) ( not ( = ?auto_180468 ?auto_180470 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_180472 ?auto_180471 ?auto_180469 ?auto_180470 ?auto_180468 ?auto_180467 )
      ( DELIVER-5PKG-VERIFY ?auto_180468 ?auto_180469 ?auto_180470 ?auto_180471 ?auto_180472 ?auto_180467 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_181673 - OBJ
      ?auto_181674 - OBJ
      ?auto_181675 - OBJ
      ?auto_181676 - OBJ
      ?auto_181677 - OBJ
      ?auto_181672 - LOCATION
    )
    :vars
    (
      ?auto_181678 - LOCATION
      ?auto_181679 - CITY
      ?auto_181683 - LOCATION
      ?auto_181680 - LOCATION
      ?auto_181681 - LOCATION
      ?auto_181682 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181678 ?auto_181679 ) ( IN-CITY ?auto_181672 ?auto_181679 ) ( not ( = ?auto_181672 ?auto_181678 ) ) ( OBJ-AT ?auto_181674 ?auto_181678 ) ( IN-CITY ?auto_181683 ?auto_181679 ) ( not ( = ?auto_181672 ?auto_181683 ) ) ( OBJ-AT ?auto_181673 ?auto_181683 ) ( IN-CITY ?auto_181680 ?auto_181679 ) ( not ( = ?auto_181672 ?auto_181680 ) ) ( OBJ-AT ?auto_181677 ?auto_181680 ) ( OBJ-AT ?auto_181676 ?auto_181678 ) ( IN-CITY ?auto_181681 ?auto_181679 ) ( not ( = ?auto_181672 ?auto_181681 ) ) ( OBJ-AT ?auto_181675 ?auto_181681 ) ( TRUCK-AT ?auto_181682 ?auto_181672 ) ( not ( = ?auto_181675 ?auto_181676 ) ) ( not ( = ?auto_181678 ?auto_181681 ) ) ( not ( = ?auto_181675 ?auto_181677 ) ) ( not ( = ?auto_181676 ?auto_181677 ) ) ( not ( = ?auto_181680 ?auto_181678 ) ) ( not ( = ?auto_181680 ?auto_181681 ) ) ( not ( = ?auto_181675 ?auto_181673 ) ) ( not ( = ?auto_181676 ?auto_181673 ) ) ( not ( = ?auto_181677 ?auto_181673 ) ) ( not ( = ?auto_181683 ?auto_181680 ) ) ( not ( = ?auto_181683 ?auto_181678 ) ) ( not ( = ?auto_181683 ?auto_181681 ) ) ( not ( = ?auto_181675 ?auto_181674 ) ) ( not ( = ?auto_181676 ?auto_181674 ) ) ( not ( = ?auto_181677 ?auto_181674 ) ) ( not ( = ?auto_181673 ?auto_181674 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_181675 ?auto_181676 ?auto_181677 ?auto_181674 ?auto_181673 ?auto_181672 )
      ( DELIVER-5PKG-VERIFY ?auto_181673 ?auto_181674 ?auto_181675 ?auto_181676 ?auto_181677 ?auto_181672 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_181724 - OBJ
      ?auto_181725 - OBJ
      ?auto_181726 - OBJ
      ?auto_181727 - OBJ
      ?auto_181728 - OBJ
      ?auto_181723 - LOCATION
    )
    :vars
    (
      ?auto_181729 - LOCATION
      ?auto_181730 - CITY
      ?auto_181734 - LOCATION
      ?auto_181731 - LOCATION
      ?auto_181732 - LOCATION
      ?auto_181733 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181729 ?auto_181730 ) ( IN-CITY ?auto_181723 ?auto_181730 ) ( not ( = ?auto_181723 ?auto_181729 ) ) ( OBJ-AT ?auto_181725 ?auto_181729 ) ( IN-CITY ?auto_181734 ?auto_181730 ) ( not ( = ?auto_181723 ?auto_181734 ) ) ( OBJ-AT ?auto_181724 ?auto_181734 ) ( IN-CITY ?auto_181731 ?auto_181730 ) ( not ( = ?auto_181723 ?auto_181731 ) ) ( OBJ-AT ?auto_181727 ?auto_181731 ) ( OBJ-AT ?auto_181728 ?auto_181729 ) ( IN-CITY ?auto_181732 ?auto_181730 ) ( not ( = ?auto_181723 ?auto_181732 ) ) ( OBJ-AT ?auto_181726 ?auto_181732 ) ( TRUCK-AT ?auto_181733 ?auto_181723 ) ( not ( = ?auto_181726 ?auto_181728 ) ) ( not ( = ?auto_181729 ?auto_181732 ) ) ( not ( = ?auto_181726 ?auto_181727 ) ) ( not ( = ?auto_181728 ?auto_181727 ) ) ( not ( = ?auto_181731 ?auto_181729 ) ) ( not ( = ?auto_181731 ?auto_181732 ) ) ( not ( = ?auto_181726 ?auto_181724 ) ) ( not ( = ?auto_181728 ?auto_181724 ) ) ( not ( = ?auto_181727 ?auto_181724 ) ) ( not ( = ?auto_181734 ?auto_181731 ) ) ( not ( = ?auto_181734 ?auto_181729 ) ) ( not ( = ?auto_181734 ?auto_181732 ) ) ( not ( = ?auto_181726 ?auto_181725 ) ) ( not ( = ?auto_181728 ?auto_181725 ) ) ( not ( = ?auto_181727 ?auto_181725 ) ) ( not ( = ?auto_181724 ?auto_181725 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_181726 ?auto_181728 ?auto_181727 ?auto_181725 ?auto_181724 ?auto_181723 )
      ( DELIVER-5PKG-VERIFY ?auto_181724 ?auto_181725 ?auto_181726 ?auto_181727 ?auto_181728 ?auto_181723 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_181937 - OBJ
      ?auto_181938 - OBJ
      ?auto_181939 - OBJ
      ?auto_181940 - OBJ
      ?auto_181941 - OBJ
      ?auto_181936 - LOCATION
    )
    :vars
    (
      ?auto_181942 - LOCATION
      ?auto_181943 - CITY
      ?auto_181947 - LOCATION
      ?auto_181944 - LOCATION
      ?auto_181945 - LOCATION
      ?auto_181946 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181942 ?auto_181943 ) ( IN-CITY ?auto_181936 ?auto_181943 ) ( not ( = ?auto_181936 ?auto_181942 ) ) ( OBJ-AT ?auto_181938 ?auto_181942 ) ( IN-CITY ?auto_181947 ?auto_181943 ) ( not ( = ?auto_181936 ?auto_181947 ) ) ( OBJ-AT ?auto_181937 ?auto_181947 ) ( IN-CITY ?auto_181944 ?auto_181943 ) ( not ( = ?auto_181936 ?auto_181944 ) ) ( OBJ-AT ?auto_181941 ?auto_181944 ) ( OBJ-AT ?auto_181939 ?auto_181942 ) ( IN-CITY ?auto_181945 ?auto_181943 ) ( not ( = ?auto_181936 ?auto_181945 ) ) ( OBJ-AT ?auto_181940 ?auto_181945 ) ( TRUCK-AT ?auto_181946 ?auto_181936 ) ( not ( = ?auto_181940 ?auto_181939 ) ) ( not ( = ?auto_181942 ?auto_181945 ) ) ( not ( = ?auto_181940 ?auto_181941 ) ) ( not ( = ?auto_181939 ?auto_181941 ) ) ( not ( = ?auto_181944 ?auto_181942 ) ) ( not ( = ?auto_181944 ?auto_181945 ) ) ( not ( = ?auto_181940 ?auto_181937 ) ) ( not ( = ?auto_181939 ?auto_181937 ) ) ( not ( = ?auto_181941 ?auto_181937 ) ) ( not ( = ?auto_181947 ?auto_181944 ) ) ( not ( = ?auto_181947 ?auto_181942 ) ) ( not ( = ?auto_181947 ?auto_181945 ) ) ( not ( = ?auto_181940 ?auto_181938 ) ) ( not ( = ?auto_181939 ?auto_181938 ) ) ( not ( = ?auto_181941 ?auto_181938 ) ) ( not ( = ?auto_181937 ?auto_181938 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_181940 ?auto_181939 ?auto_181941 ?auto_181938 ?auto_181937 ?auto_181936 )
      ( DELIVER-5PKG-VERIFY ?auto_181937 ?auto_181938 ?auto_181939 ?auto_181940 ?auto_181941 ?auto_181936 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_182043 - OBJ
      ?auto_182044 - OBJ
      ?auto_182045 - OBJ
      ?auto_182046 - OBJ
      ?auto_182047 - OBJ
      ?auto_182042 - LOCATION
    )
    :vars
    (
      ?auto_182048 - LOCATION
      ?auto_182049 - CITY
      ?auto_182053 - LOCATION
      ?auto_182050 - LOCATION
      ?auto_182051 - LOCATION
      ?auto_182052 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_182048 ?auto_182049 ) ( IN-CITY ?auto_182042 ?auto_182049 ) ( not ( = ?auto_182042 ?auto_182048 ) ) ( OBJ-AT ?auto_182044 ?auto_182048 ) ( IN-CITY ?auto_182053 ?auto_182049 ) ( not ( = ?auto_182042 ?auto_182053 ) ) ( OBJ-AT ?auto_182043 ?auto_182053 ) ( IN-CITY ?auto_182050 ?auto_182049 ) ( not ( = ?auto_182042 ?auto_182050 ) ) ( OBJ-AT ?auto_182046 ?auto_182050 ) ( OBJ-AT ?auto_182045 ?auto_182048 ) ( IN-CITY ?auto_182051 ?auto_182049 ) ( not ( = ?auto_182042 ?auto_182051 ) ) ( OBJ-AT ?auto_182047 ?auto_182051 ) ( TRUCK-AT ?auto_182052 ?auto_182042 ) ( not ( = ?auto_182047 ?auto_182045 ) ) ( not ( = ?auto_182048 ?auto_182051 ) ) ( not ( = ?auto_182047 ?auto_182046 ) ) ( not ( = ?auto_182045 ?auto_182046 ) ) ( not ( = ?auto_182050 ?auto_182048 ) ) ( not ( = ?auto_182050 ?auto_182051 ) ) ( not ( = ?auto_182047 ?auto_182043 ) ) ( not ( = ?auto_182045 ?auto_182043 ) ) ( not ( = ?auto_182046 ?auto_182043 ) ) ( not ( = ?auto_182053 ?auto_182050 ) ) ( not ( = ?auto_182053 ?auto_182048 ) ) ( not ( = ?auto_182053 ?auto_182051 ) ) ( not ( = ?auto_182047 ?auto_182044 ) ) ( not ( = ?auto_182045 ?auto_182044 ) ) ( not ( = ?auto_182046 ?auto_182044 ) ) ( not ( = ?auto_182043 ?auto_182044 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_182047 ?auto_182045 ?auto_182046 ?auto_182044 ?auto_182043 ?auto_182042 )
      ( DELIVER-5PKG-VERIFY ?auto_182043 ?auto_182044 ?auto_182045 ?auto_182046 ?auto_182047 ?auto_182042 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_182256 - OBJ
      ?auto_182257 - OBJ
      ?auto_182258 - OBJ
      ?auto_182259 - OBJ
      ?auto_182260 - OBJ
      ?auto_182255 - LOCATION
    )
    :vars
    (
      ?auto_182261 - LOCATION
      ?auto_182262 - CITY
      ?auto_182266 - LOCATION
      ?auto_182263 - LOCATION
      ?auto_182264 - LOCATION
      ?auto_182265 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_182261 ?auto_182262 ) ( IN-CITY ?auto_182255 ?auto_182262 ) ( not ( = ?auto_182255 ?auto_182261 ) ) ( OBJ-AT ?auto_182257 ?auto_182261 ) ( IN-CITY ?auto_182266 ?auto_182262 ) ( not ( = ?auto_182255 ?auto_182266 ) ) ( OBJ-AT ?auto_182256 ?auto_182266 ) ( IN-CITY ?auto_182263 ?auto_182262 ) ( not ( = ?auto_182255 ?auto_182263 ) ) ( OBJ-AT ?auto_182258 ?auto_182263 ) ( OBJ-AT ?auto_182260 ?auto_182261 ) ( IN-CITY ?auto_182264 ?auto_182262 ) ( not ( = ?auto_182255 ?auto_182264 ) ) ( OBJ-AT ?auto_182259 ?auto_182264 ) ( TRUCK-AT ?auto_182265 ?auto_182255 ) ( not ( = ?auto_182259 ?auto_182260 ) ) ( not ( = ?auto_182261 ?auto_182264 ) ) ( not ( = ?auto_182259 ?auto_182258 ) ) ( not ( = ?auto_182260 ?auto_182258 ) ) ( not ( = ?auto_182263 ?auto_182261 ) ) ( not ( = ?auto_182263 ?auto_182264 ) ) ( not ( = ?auto_182259 ?auto_182256 ) ) ( not ( = ?auto_182260 ?auto_182256 ) ) ( not ( = ?auto_182258 ?auto_182256 ) ) ( not ( = ?auto_182266 ?auto_182263 ) ) ( not ( = ?auto_182266 ?auto_182261 ) ) ( not ( = ?auto_182266 ?auto_182264 ) ) ( not ( = ?auto_182259 ?auto_182257 ) ) ( not ( = ?auto_182260 ?auto_182257 ) ) ( not ( = ?auto_182258 ?auto_182257 ) ) ( not ( = ?auto_182256 ?auto_182257 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_182259 ?auto_182260 ?auto_182258 ?auto_182257 ?auto_182256 ?auto_182255 )
      ( DELIVER-5PKG-VERIFY ?auto_182256 ?auto_182257 ?auto_182258 ?auto_182259 ?auto_182260 ?auto_182255 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_182307 - OBJ
      ?auto_182308 - OBJ
      ?auto_182309 - OBJ
      ?auto_182310 - OBJ
      ?auto_182311 - OBJ
      ?auto_182306 - LOCATION
    )
    :vars
    (
      ?auto_182312 - LOCATION
      ?auto_182313 - CITY
      ?auto_182317 - LOCATION
      ?auto_182314 - LOCATION
      ?auto_182315 - LOCATION
      ?auto_182316 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_182312 ?auto_182313 ) ( IN-CITY ?auto_182306 ?auto_182313 ) ( not ( = ?auto_182306 ?auto_182312 ) ) ( OBJ-AT ?auto_182308 ?auto_182312 ) ( IN-CITY ?auto_182317 ?auto_182313 ) ( not ( = ?auto_182306 ?auto_182317 ) ) ( OBJ-AT ?auto_182307 ?auto_182317 ) ( IN-CITY ?auto_182314 ?auto_182313 ) ( not ( = ?auto_182306 ?auto_182314 ) ) ( OBJ-AT ?auto_182309 ?auto_182314 ) ( OBJ-AT ?auto_182310 ?auto_182312 ) ( IN-CITY ?auto_182315 ?auto_182313 ) ( not ( = ?auto_182306 ?auto_182315 ) ) ( OBJ-AT ?auto_182311 ?auto_182315 ) ( TRUCK-AT ?auto_182316 ?auto_182306 ) ( not ( = ?auto_182311 ?auto_182310 ) ) ( not ( = ?auto_182312 ?auto_182315 ) ) ( not ( = ?auto_182311 ?auto_182309 ) ) ( not ( = ?auto_182310 ?auto_182309 ) ) ( not ( = ?auto_182314 ?auto_182312 ) ) ( not ( = ?auto_182314 ?auto_182315 ) ) ( not ( = ?auto_182311 ?auto_182307 ) ) ( not ( = ?auto_182310 ?auto_182307 ) ) ( not ( = ?auto_182309 ?auto_182307 ) ) ( not ( = ?auto_182317 ?auto_182314 ) ) ( not ( = ?auto_182317 ?auto_182312 ) ) ( not ( = ?auto_182317 ?auto_182315 ) ) ( not ( = ?auto_182311 ?auto_182308 ) ) ( not ( = ?auto_182310 ?auto_182308 ) ) ( not ( = ?auto_182309 ?auto_182308 ) ) ( not ( = ?auto_182307 ?auto_182308 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_182311 ?auto_182310 ?auto_182309 ?auto_182308 ?auto_182307 ?auto_182306 )
      ( DELIVER-5PKG-VERIFY ?auto_182307 ?auto_182308 ?auto_182309 ?auto_182310 ?auto_182311 ?auto_182306 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_183794 - OBJ
      ?auto_183795 - OBJ
      ?auto_183796 - OBJ
      ?auto_183797 - OBJ
      ?auto_183798 - OBJ
      ?auto_183793 - LOCATION
    )
    :vars
    (
      ?auto_183799 - LOCATION
      ?auto_183800 - CITY
      ?auto_183804 - LOCATION
      ?auto_183801 - LOCATION
      ?auto_183802 - LOCATION
      ?auto_183803 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_183799 ?auto_183800 ) ( IN-CITY ?auto_183793 ?auto_183800 ) ( not ( = ?auto_183793 ?auto_183799 ) ) ( OBJ-AT ?auto_183794 ?auto_183799 ) ( IN-CITY ?auto_183804 ?auto_183800 ) ( not ( = ?auto_183793 ?auto_183804 ) ) ( OBJ-AT ?auto_183798 ?auto_183804 ) ( IN-CITY ?auto_183801 ?auto_183800 ) ( not ( = ?auto_183793 ?auto_183801 ) ) ( OBJ-AT ?auto_183797 ?auto_183801 ) ( OBJ-AT ?auto_183796 ?auto_183799 ) ( IN-CITY ?auto_183802 ?auto_183800 ) ( not ( = ?auto_183793 ?auto_183802 ) ) ( OBJ-AT ?auto_183795 ?auto_183802 ) ( TRUCK-AT ?auto_183803 ?auto_183793 ) ( not ( = ?auto_183795 ?auto_183796 ) ) ( not ( = ?auto_183799 ?auto_183802 ) ) ( not ( = ?auto_183795 ?auto_183797 ) ) ( not ( = ?auto_183796 ?auto_183797 ) ) ( not ( = ?auto_183801 ?auto_183799 ) ) ( not ( = ?auto_183801 ?auto_183802 ) ) ( not ( = ?auto_183795 ?auto_183798 ) ) ( not ( = ?auto_183796 ?auto_183798 ) ) ( not ( = ?auto_183797 ?auto_183798 ) ) ( not ( = ?auto_183804 ?auto_183801 ) ) ( not ( = ?auto_183804 ?auto_183799 ) ) ( not ( = ?auto_183804 ?auto_183802 ) ) ( not ( = ?auto_183795 ?auto_183794 ) ) ( not ( = ?auto_183796 ?auto_183794 ) ) ( not ( = ?auto_183797 ?auto_183794 ) ) ( not ( = ?auto_183798 ?auto_183794 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_183795 ?auto_183796 ?auto_183797 ?auto_183794 ?auto_183798 ?auto_183793 )
      ( DELIVER-5PKG-VERIFY ?auto_183794 ?auto_183795 ?auto_183796 ?auto_183797 ?auto_183798 ?auto_183793 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_183845 - OBJ
      ?auto_183846 - OBJ
      ?auto_183847 - OBJ
      ?auto_183848 - OBJ
      ?auto_183849 - OBJ
      ?auto_183844 - LOCATION
    )
    :vars
    (
      ?auto_183850 - LOCATION
      ?auto_183851 - CITY
      ?auto_183855 - LOCATION
      ?auto_183852 - LOCATION
      ?auto_183853 - LOCATION
      ?auto_183854 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_183850 ?auto_183851 ) ( IN-CITY ?auto_183844 ?auto_183851 ) ( not ( = ?auto_183844 ?auto_183850 ) ) ( OBJ-AT ?auto_183845 ?auto_183850 ) ( IN-CITY ?auto_183855 ?auto_183851 ) ( not ( = ?auto_183844 ?auto_183855 ) ) ( OBJ-AT ?auto_183848 ?auto_183855 ) ( IN-CITY ?auto_183852 ?auto_183851 ) ( not ( = ?auto_183844 ?auto_183852 ) ) ( OBJ-AT ?auto_183849 ?auto_183852 ) ( OBJ-AT ?auto_183847 ?auto_183850 ) ( IN-CITY ?auto_183853 ?auto_183851 ) ( not ( = ?auto_183844 ?auto_183853 ) ) ( OBJ-AT ?auto_183846 ?auto_183853 ) ( TRUCK-AT ?auto_183854 ?auto_183844 ) ( not ( = ?auto_183846 ?auto_183847 ) ) ( not ( = ?auto_183850 ?auto_183853 ) ) ( not ( = ?auto_183846 ?auto_183849 ) ) ( not ( = ?auto_183847 ?auto_183849 ) ) ( not ( = ?auto_183852 ?auto_183850 ) ) ( not ( = ?auto_183852 ?auto_183853 ) ) ( not ( = ?auto_183846 ?auto_183848 ) ) ( not ( = ?auto_183847 ?auto_183848 ) ) ( not ( = ?auto_183849 ?auto_183848 ) ) ( not ( = ?auto_183855 ?auto_183852 ) ) ( not ( = ?auto_183855 ?auto_183850 ) ) ( not ( = ?auto_183855 ?auto_183853 ) ) ( not ( = ?auto_183846 ?auto_183845 ) ) ( not ( = ?auto_183847 ?auto_183845 ) ) ( not ( = ?auto_183849 ?auto_183845 ) ) ( not ( = ?auto_183848 ?auto_183845 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_183846 ?auto_183847 ?auto_183849 ?auto_183845 ?auto_183848 ?auto_183844 )
      ( DELIVER-5PKG-VERIFY ?auto_183845 ?auto_183846 ?auto_183847 ?auto_183848 ?auto_183849 ?auto_183844 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_184058 - OBJ
      ?auto_184059 - OBJ
      ?auto_184060 - OBJ
      ?auto_184061 - OBJ
      ?auto_184062 - OBJ
      ?auto_184057 - LOCATION
    )
    :vars
    (
      ?auto_184063 - LOCATION
      ?auto_184064 - CITY
      ?auto_184068 - LOCATION
      ?auto_184065 - LOCATION
      ?auto_184066 - LOCATION
      ?auto_184067 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_184063 ?auto_184064 ) ( IN-CITY ?auto_184057 ?auto_184064 ) ( not ( = ?auto_184057 ?auto_184063 ) ) ( OBJ-AT ?auto_184058 ?auto_184063 ) ( IN-CITY ?auto_184068 ?auto_184064 ) ( not ( = ?auto_184057 ?auto_184068 ) ) ( OBJ-AT ?auto_184062 ?auto_184068 ) ( IN-CITY ?auto_184065 ?auto_184064 ) ( not ( = ?auto_184057 ?auto_184065 ) ) ( OBJ-AT ?auto_184060 ?auto_184065 ) ( OBJ-AT ?auto_184061 ?auto_184063 ) ( IN-CITY ?auto_184066 ?auto_184064 ) ( not ( = ?auto_184057 ?auto_184066 ) ) ( OBJ-AT ?auto_184059 ?auto_184066 ) ( TRUCK-AT ?auto_184067 ?auto_184057 ) ( not ( = ?auto_184059 ?auto_184061 ) ) ( not ( = ?auto_184063 ?auto_184066 ) ) ( not ( = ?auto_184059 ?auto_184060 ) ) ( not ( = ?auto_184061 ?auto_184060 ) ) ( not ( = ?auto_184065 ?auto_184063 ) ) ( not ( = ?auto_184065 ?auto_184066 ) ) ( not ( = ?auto_184059 ?auto_184062 ) ) ( not ( = ?auto_184061 ?auto_184062 ) ) ( not ( = ?auto_184060 ?auto_184062 ) ) ( not ( = ?auto_184068 ?auto_184065 ) ) ( not ( = ?auto_184068 ?auto_184063 ) ) ( not ( = ?auto_184068 ?auto_184066 ) ) ( not ( = ?auto_184059 ?auto_184058 ) ) ( not ( = ?auto_184061 ?auto_184058 ) ) ( not ( = ?auto_184060 ?auto_184058 ) ) ( not ( = ?auto_184062 ?auto_184058 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_184059 ?auto_184061 ?auto_184060 ?auto_184058 ?auto_184062 ?auto_184057 )
      ( DELIVER-5PKG-VERIFY ?auto_184058 ?auto_184059 ?auto_184060 ?auto_184061 ?auto_184062 ?auto_184057 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_184164 - OBJ
      ?auto_184165 - OBJ
      ?auto_184166 - OBJ
      ?auto_184167 - OBJ
      ?auto_184168 - OBJ
      ?auto_184163 - LOCATION
    )
    :vars
    (
      ?auto_184169 - LOCATION
      ?auto_184170 - CITY
      ?auto_184174 - LOCATION
      ?auto_184171 - LOCATION
      ?auto_184172 - LOCATION
      ?auto_184173 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_184169 ?auto_184170 ) ( IN-CITY ?auto_184163 ?auto_184170 ) ( not ( = ?auto_184163 ?auto_184169 ) ) ( OBJ-AT ?auto_184164 ?auto_184169 ) ( IN-CITY ?auto_184174 ?auto_184170 ) ( not ( = ?auto_184163 ?auto_184174 ) ) ( OBJ-AT ?auto_184167 ?auto_184174 ) ( IN-CITY ?auto_184171 ?auto_184170 ) ( not ( = ?auto_184163 ?auto_184171 ) ) ( OBJ-AT ?auto_184166 ?auto_184171 ) ( OBJ-AT ?auto_184168 ?auto_184169 ) ( IN-CITY ?auto_184172 ?auto_184170 ) ( not ( = ?auto_184163 ?auto_184172 ) ) ( OBJ-AT ?auto_184165 ?auto_184172 ) ( TRUCK-AT ?auto_184173 ?auto_184163 ) ( not ( = ?auto_184165 ?auto_184168 ) ) ( not ( = ?auto_184169 ?auto_184172 ) ) ( not ( = ?auto_184165 ?auto_184166 ) ) ( not ( = ?auto_184168 ?auto_184166 ) ) ( not ( = ?auto_184171 ?auto_184169 ) ) ( not ( = ?auto_184171 ?auto_184172 ) ) ( not ( = ?auto_184165 ?auto_184167 ) ) ( not ( = ?auto_184168 ?auto_184167 ) ) ( not ( = ?auto_184166 ?auto_184167 ) ) ( not ( = ?auto_184174 ?auto_184171 ) ) ( not ( = ?auto_184174 ?auto_184169 ) ) ( not ( = ?auto_184174 ?auto_184172 ) ) ( not ( = ?auto_184165 ?auto_184164 ) ) ( not ( = ?auto_184168 ?auto_184164 ) ) ( not ( = ?auto_184166 ?auto_184164 ) ) ( not ( = ?auto_184167 ?auto_184164 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_184165 ?auto_184168 ?auto_184166 ?auto_184164 ?auto_184167 ?auto_184163 )
      ( DELIVER-5PKG-VERIFY ?auto_184164 ?auto_184165 ?auto_184166 ?auto_184167 ?auto_184168 ?auto_184163 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_184377 - OBJ
      ?auto_184378 - OBJ
      ?auto_184379 - OBJ
      ?auto_184380 - OBJ
      ?auto_184381 - OBJ
      ?auto_184376 - LOCATION
    )
    :vars
    (
      ?auto_184382 - LOCATION
      ?auto_184383 - CITY
      ?auto_184387 - LOCATION
      ?auto_184384 - LOCATION
      ?auto_184385 - LOCATION
      ?auto_184386 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_184382 ?auto_184383 ) ( IN-CITY ?auto_184376 ?auto_184383 ) ( not ( = ?auto_184376 ?auto_184382 ) ) ( OBJ-AT ?auto_184377 ?auto_184382 ) ( IN-CITY ?auto_184387 ?auto_184383 ) ( not ( = ?auto_184376 ?auto_184387 ) ) ( OBJ-AT ?auto_184379 ?auto_184387 ) ( IN-CITY ?auto_184384 ?auto_184383 ) ( not ( = ?auto_184376 ?auto_184384 ) ) ( OBJ-AT ?auto_184381 ?auto_184384 ) ( OBJ-AT ?auto_184380 ?auto_184382 ) ( IN-CITY ?auto_184385 ?auto_184383 ) ( not ( = ?auto_184376 ?auto_184385 ) ) ( OBJ-AT ?auto_184378 ?auto_184385 ) ( TRUCK-AT ?auto_184386 ?auto_184376 ) ( not ( = ?auto_184378 ?auto_184380 ) ) ( not ( = ?auto_184382 ?auto_184385 ) ) ( not ( = ?auto_184378 ?auto_184381 ) ) ( not ( = ?auto_184380 ?auto_184381 ) ) ( not ( = ?auto_184384 ?auto_184382 ) ) ( not ( = ?auto_184384 ?auto_184385 ) ) ( not ( = ?auto_184378 ?auto_184379 ) ) ( not ( = ?auto_184380 ?auto_184379 ) ) ( not ( = ?auto_184381 ?auto_184379 ) ) ( not ( = ?auto_184387 ?auto_184384 ) ) ( not ( = ?auto_184387 ?auto_184382 ) ) ( not ( = ?auto_184387 ?auto_184385 ) ) ( not ( = ?auto_184378 ?auto_184377 ) ) ( not ( = ?auto_184380 ?auto_184377 ) ) ( not ( = ?auto_184381 ?auto_184377 ) ) ( not ( = ?auto_184379 ?auto_184377 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_184378 ?auto_184380 ?auto_184381 ?auto_184377 ?auto_184379 ?auto_184376 )
      ( DELIVER-5PKG-VERIFY ?auto_184377 ?auto_184378 ?auto_184379 ?auto_184380 ?auto_184381 ?auto_184376 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_184428 - OBJ
      ?auto_184429 - OBJ
      ?auto_184430 - OBJ
      ?auto_184431 - OBJ
      ?auto_184432 - OBJ
      ?auto_184427 - LOCATION
    )
    :vars
    (
      ?auto_184433 - LOCATION
      ?auto_184434 - CITY
      ?auto_184438 - LOCATION
      ?auto_184435 - LOCATION
      ?auto_184436 - LOCATION
      ?auto_184437 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_184433 ?auto_184434 ) ( IN-CITY ?auto_184427 ?auto_184434 ) ( not ( = ?auto_184427 ?auto_184433 ) ) ( OBJ-AT ?auto_184428 ?auto_184433 ) ( IN-CITY ?auto_184438 ?auto_184434 ) ( not ( = ?auto_184427 ?auto_184438 ) ) ( OBJ-AT ?auto_184430 ?auto_184438 ) ( IN-CITY ?auto_184435 ?auto_184434 ) ( not ( = ?auto_184427 ?auto_184435 ) ) ( OBJ-AT ?auto_184431 ?auto_184435 ) ( OBJ-AT ?auto_184432 ?auto_184433 ) ( IN-CITY ?auto_184436 ?auto_184434 ) ( not ( = ?auto_184427 ?auto_184436 ) ) ( OBJ-AT ?auto_184429 ?auto_184436 ) ( TRUCK-AT ?auto_184437 ?auto_184427 ) ( not ( = ?auto_184429 ?auto_184432 ) ) ( not ( = ?auto_184433 ?auto_184436 ) ) ( not ( = ?auto_184429 ?auto_184431 ) ) ( not ( = ?auto_184432 ?auto_184431 ) ) ( not ( = ?auto_184435 ?auto_184433 ) ) ( not ( = ?auto_184435 ?auto_184436 ) ) ( not ( = ?auto_184429 ?auto_184430 ) ) ( not ( = ?auto_184432 ?auto_184430 ) ) ( not ( = ?auto_184431 ?auto_184430 ) ) ( not ( = ?auto_184438 ?auto_184435 ) ) ( not ( = ?auto_184438 ?auto_184433 ) ) ( not ( = ?auto_184438 ?auto_184436 ) ) ( not ( = ?auto_184429 ?auto_184428 ) ) ( not ( = ?auto_184432 ?auto_184428 ) ) ( not ( = ?auto_184431 ?auto_184428 ) ) ( not ( = ?auto_184430 ?auto_184428 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_184429 ?auto_184432 ?auto_184431 ?auto_184428 ?auto_184430 ?auto_184427 )
      ( DELIVER-5PKG-VERIFY ?auto_184428 ?auto_184429 ?auto_184430 ?auto_184431 ?auto_184432 ?auto_184427 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_185138 - OBJ
      ?auto_185139 - OBJ
      ?auto_185140 - OBJ
      ?auto_185141 - OBJ
      ?auto_185142 - OBJ
      ?auto_185137 - LOCATION
    )
    :vars
    (
      ?auto_185143 - LOCATION
      ?auto_185144 - CITY
      ?auto_185148 - LOCATION
      ?auto_185145 - LOCATION
      ?auto_185146 - LOCATION
      ?auto_185147 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_185143 ?auto_185144 ) ( IN-CITY ?auto_185137 ?auto_185144 ) ( not ( = ?auto_185137 ?auto_185143 ) ) ( OBJ-AT ?auto_185138 ?auto_185143 ) ( IN-CITY ?auto_185148 ?auto_185144 ) ( not ( = ?auto_185137 ?auto_185148 ) ) ( OBJ-AT ?auto_185142 ?auto_185148 ) ( IN-CITY ?auto_185145 ?auto_185144 ) ( not ( = ?auto_185137 ?auto_185145 ) ) ( OBJ-AT ?auto_185141 ?auto_185145 ) ( OBJ-AT ?auto_185139 ?auto_185143 ) ( IN-CITY ?auto_185146 ?auto_185144 ) ( not ( = ?auto_185137 ?auto_185146 ) ) ( OBJ-AT ?auto_185140 ?auto_185146 ) ( TRUCK-AT ?auto_185147 ?auto_185137 ) ( not ( = ?auto_185140 ?auto_185139 ) ) ( not ( = ?auto_185143 ?auto_185146 ) ) ( not ( = ?auto_185140 ?auto_185141 ) ) ( not ( = ?auto_185139 ?auto_185141 ) ) ( not ( = ?auto_185145 ?auto_185143 ) ) ( not ( = ?auto_185145 ?auto_185146 ) ) ( not ( = ?auto_185140 ?auto_185142 ) ) ( not ( = ?auto_185139 ?auto_185142 ) ) ( not ( = ?auto_185141 ?auto_185142 ) ) ( not ( = ?auto_185148 ?auto_185145 ) ) ( not ( = ?auto_185148 ?auto_185143 ) ) ( not ( = ?auto_185148 ?auto_185146 ) ) ( not ( = ?auto_185140 ?auto_185138 ) ) ( not ( = ?auto_185139 ?auto_185138 ) ) ( not ( = ?auto_185141 ?auto_185138 ) ) ( not ( = ?auto_185142 ?auto_185138 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_185140 ?auto_185139 ?auto_185141 ?auto_185138 ?auto_185142 ?auto_185137 )
      ( DELIVER-5PKG-VERIFY ?auto_185138 ?auto_185139 ?auto_185140 ?auto_185141 ?auto_185142 ?auto_185137 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_185189 - OBJ
      ?auto_185190 - OBJ
      ?auto_185191 - OBJ
      ?auto_185192 - OBJ
      ?auto_185193 - OBJ
      ?auto_185188 - LOCATION
    )
    :vars
    (
      ?auto_185194 - LOCATION
      ?auto_185195 - CITY
      ?auto_185199 - LOCATION
      ?auto_185196 - LOCATION
      ?auto_185197 - LOCATION
      ?auto_185198 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_185194 ?auto_185195 ) ( IN-CITY ?auto_185188 ?auto_185195 ) ( not ( = ?auto_185188 ?auto_185194 ) ) ( OBJ-AT ?auto_185189 ?auto_185194 ) ( IN-CITY ?auto_185199 ?auto_185195 ) ( not ( = ?auto_185188 ?auto_185199 ) ) ( OBJ-AT ?auto_185192 ?auto_185199 ) ( IN-CITY ?auto_185196 ?auto_185195 ) ( not ( = ?auto_185188 ?auto_185196 ) ) ( OBJ-AT ?auto_185193 ?auto_185196 ) ( OBJ-AT ?auto_185190 ?auto_185194 ) ( IN-CITY ?auto_185197 ?auto_185195 ) ( not ( = ?auto_185188 ?auto_185197 ) ) ( OBJ-AT ?auto_185191 ?auto_185197 ) ( TRUCK-AT ?auto_185198 ?auto_185188 ) ( not ( = ?auto_185191 ?auto_185190 ) ) ( not ( = ?auto_185194 ?auto_185197 ) ) ( not ( = ?auto_185191 ?auto_185193 ) ) ( not ( = ?auto_185190 ?auto_185193 ) ) ( not ( = ?auto_185196 ?auto_185194 ) ) ( not ( = ?auto_185196 ?auto_185197 ) ) ( not ( = ?auto_185191 ?auto_185192 ) ) ( not ( = ?auto_185190 ?auto_185192 ) ) ( not ( = ?auto_185193 ?auto_185192 ) ) ( not ( = ?auto_185199 ?auto_185196 ) ) ( not ( = ?auto_185199 ?auto_185194 ) ) ( not ( = ?auto_185199 ?auto_185197 ) ) ( not ( = ?auto_185191 ?auto_185189 ) ) ( not ( = ?auto_185190 ?auto_185189 ) ) ( not ( = ?auto_185193 ?auto_185189 ) ) ( not ( = ?auto_185192 ?auto_185189 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_185191 ?auto_185190 ?auto_185193 ?auto_185189 ?auto_185192 ?auto_185188 )
      ( DELIVER-5PKG-VERIFY ?auto_185189 ?auto_185190 ?auto_185191 ?auto_185192 ?auto_185193 ?auto_185188 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_185682 - OBJ
      ?auto_185683 - OBJ
      ?auto_185684 - OBJ
      ?auto_185685 - OBJ
      ?auto_185686 - OBJ
      ?auto_185681 - LOCATION
    )
    :vars
    (
      ?auto_185687 - LOCATION
      ?auto_185688 - CITY
      ?auto_185692 - LOCATION
      ?auto_185689 - LOCATION
      ?auto_185690 - LOCATION
      ?auto_185691 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_185687 ?auto_185688 ) ( IN-CITY ?auto_185681 ?auto_185688 ) ( not ( = ?auto_185681 ?auto_185687 ) ) ( OBJ-AT ?auto_185682 ?auto_185687 ) ( IN-CITY ?auto_185692 ?auto_185688 ) ( not ( = ?auto_185681 ?auto_185692 ) ) ( OBJ-AT ?auto_185686 ?auto_185692 ) ( IN-CITY ?auto_185689 ?auto_185688 ) ( not ( = ?auto_185681 ?auto_185689 ) ) ( OBJ-AT ?auto_185684 ?auto_185689 ) ( OBJ-AT ?auto_185683 ?auto_185687 ) ( IN-CITY ?auto_185690 ?auto_185688 ) ( not ( = ?auto_185681 ?auto_185690 ) ) ( OBJ-AT ?auto_185685 ?auto_185690 ) ( TRUCK-AT ?auto_185691 ?auto_185681 ) ( not ( = ?auto_185685 ?auto_185683 ) ) ( not ( = ?auto_185687 ?auto_185690 ) ) ( not ( = ?auto_185685 ?auto_185684 ) ) ( not ( = ?auto_185683 ?auto_185684 ) ) ( not ( = ?auto_185689 ?auto_185687 ) ) ( not ( = ?auto_185689 ?auto_185690 ) ) ( not ( = ?auto_185685 ?auto_185686 ) ) ( not ( = ?auto_185683 ?auto_185686 ) ) ( not ( = ?auto_185684 ?auto_185686 ) ) ( not ( = ?auto_185692 ?auto_185689 ) ) ( not ( = ?auto_185692 ?auto_185687 ) ) ( not ( = ?auto_185692 ?auto_185690 ) ) ( not ( = ?auto_185685 ?auto_185682 ) ) ( not ( = ?auto_185683 ?auto_185682 ) ) ( not ( = ?auto_185684 ?auto_185682 ) ) ( not ( = ?auto_185686 ?auto_185682 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_185685 ?auto_185683 ?auto_185684 ?auto_185682 ?auto_185686 ?auto_185681 )
      ( DELIVER-5PKG-VERIFY ?auto_185682 ?auto_185683 ?auto_185684 ?auto_185685 ?auto_185686 ?auto_185681 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_185843 - OBJ
      ?auto_185844 - OBJ
      ?auto_185845 - OBJ
      ?auto_185846 - OBJ
      ?auto_185847 - OBJ
      ?auto_185842 - LOCATION
    )
    :vars
    (
      ?auto_185848 - LOCATION
      ?auto_185849 - CITY
      ?auto_185853 - LOCATION
      ?auto_185850 - LOCATION
      ?auto_185851 - LOCATION
      ?auto_185852 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_185848 ?auto_185849 ) ( IN-CITY ?auto_185842 ?auto_185849 ) ( not ( = ?auto_185842 ?auto_185848 ) ) ( OBJ-AT ?auto_185843 ?auto_185848 ) ( IN-CITY ?auto_185853 ?auto_185849 ) ( not ( = ?auto_185842 ?auto_185853 ) ) ( OBJ-AT ?auto_185846 ?auto_185853 ) ( IN-CITY ?auto_185850 ?auto_185849 ) ( not ( = ?auto_185842 ?auto_185850 ) ) ( OBJ-AT ?auto_185845 ?auto_185850 ) ( OBJ-AT ?auto_185844 ?auto_185848 ) ( IN-CITY ?auto_185851 ?auto_185849 ) ( not ( = ?auto_185842 ?auto_185851 ) ) ( OBJ-AT ?auto_185847 ?auto_185851 ) ( TRUCK-AT ?auto_185852 ?auto_185842 ) ( not ( = ?auto_185847 ?auto_185844 ) ) ( not ( = ?auto_185848 ?auto_185851 ) ) ( not ( = ?auto_185847 ?auto_185845 ) ) ( not ( = ?auto_185844 ?auto_185845 ) ) ( not ( = ?auto_185850 ?auto_185848 ) ) ( not ( = ?auto_185850 ?auto_185851 ) ) ( not ( = ?auto_185847 ?auto_185846 ) ) ( not ( = ?auto_185844 ?auto_185846 ) ) ( not ( = ?auto_185845 ?auto_185846 ) ) ( not ( = ?auto_185853 ?auto_185850 ) ) ( not ( = ?auto_185853 ?auto_185848 ) ) ( not ( = ?auto_185853 ?auto_185851 ) ) ( not ( = ?auto_185847 ?auto_185843 ) ) ( not ( = ?auto_185844 ?auto_185843 ) ) ( not ( = ?auto_185845 ?auto_185843 ) ) ( not ( = ?auto_185846 ?auto_185843 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_185847 ?auto_185844 ?auto_185845 ?auto_185843 ?auto_185846 ?auto_185842 )
      ( DELIVER-5PKG-VERIFY ?auto_185843 ?auto_185844 ?auto_185845 ?auto_185846 ?auto_185847 ?auto_185842 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_186001 - OBJ
      ?auto_186002 - OBJ
      ?auto_186003 - OBJ
      ?auto_186004 - OBJ
      ?auto_186005 - OBJ
      ?auto_186000 - LOCATION
    )
    :vars
    (
      ?auto_186006 - LOCATION
      ?auto_186007 - CITY
      ?auto_186011 - LOCATION
      ?auto_186008 - LOCATION
      ?auto_186009 - LOCATION
      ?auto_186010 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186006 ?auto_186007 ) ( IN-CITY ?auto_186000 ?auto_186007 ) ( not ( = ?auto_186000 ?auto_186006 ) ) ( OBJ-AT ?auto_186001 ?auto_186006 ) ( IN-CITY ?auto_186011 ?auto_186007 ) ( not ( = ?auto_186000 ?auto_186011 ) ) ( OBJ-AT ?auto_186003 ?auto_186011 ) ( IN-CITY ?auto_186008 ?auto_186007 ) ( not ( = ?auto_186000 ?auto_186008 ) ) ( OBJ-AT ?auto_186005 ?auto_186008 ) ( OBJ-AT ?auto_186002 ?auto_186006 ) ( IN-CITY ?auto_186009 ?auto_186007 ) ( not ( = ?auto_186000 ?auto_186009 ) ) ( OBJ-AT ?auto_186004 ?auto_186009 ) ( TRUCK-AT ?auto_186010 ?auto_186000 ) ( not ( = ?auto_186004 ?auto_186002 ) ) ( not ( = ?auto_186006 ?auto_186009 ) ) ( not ( = ?auto_186004 ?auto_186005 ) ) ( not ( = ?auto_186002 ?auto_186005 ) ) ( not ( = ?auto_186008 ?auto_186006 ) ) ( not ( = ?auto_186008 ?auto_186009 ) ) ( not ( = ?auto_186004 ?auto_186003 ) ) ( not ( = ?auto_186002 ?auto_186003 ) ) ( not ( = ?auto_186005 ?auto_186003 ) ) ( not ( = ?auto_186011 ?auto_186008 ) ) ( not ( = ?auto_186011 ?auto_186006 ) ) ( not ( = ?auto_186011 ?auto_186009 ) ) ( not ( = ?auto_186004 ?auto_186001 ) ) ( not ( = ?auto_186002 ?auto_186001 ) ) ( not ( = ?auto_186005 ?auto_186001 ) ) ( not ( = ?auto_186003 ?auto_186001 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_186004 ?auto_186002 ?auto_186005 ?auto_186001 ?auto_186003 ?auto_186000 )
      ( DELIVER-5PKG-VERIFY ?auto_186001 ?auto_186002 ?auto_186003 ?auto_186004 ?auto_186005 ?auto_186000 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_186107 - OBJ
      ?auto_186108 - OBJ
      ?auto_186109 - OBJ
      ?auto_186110 - OBJ
      ?auto_186111 - OBJ
      ?auto_186106 - LOCATION
    )
    :vars
    (
      ?auto_186112 - LOCATION
      ?auto_186113 - CITY
      ?auto_186117 - LOCATION
      ?auto_186114 - LOCATION
      ?auto_186115 - LOCATION
      ?auto_186116 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186112 ?auto_186113 ) ( IN-CITY ?auto_186106 ?auto_186113 ) ( not ( = ?auto_186106 ?auto_186112 ) ) ( OBJ-AT ?auto_186107 ?auto_186112 ) ( IN-CITY ?auto_186117 ?auto_186113 ) ( not ( = ?auto_186106 ?auto_186117 ) ) ( OBJ-AT ?auto_186109 ?auto_186117 ) ( IN-CITY ?auto_186114 ?auto_186113 ) ( not ( = ?auto_186106 ?auto_186114 ) ) ( OBJ-AT ?auto_186110 ?auto_186114 ) ( OBJ-AT ?auto_186108 ?auto_186112 ) ( IN-CITY ?auto_186115 ?auto_186113 ) ( not ( = ?auto_186106 ?auto_186115 ) ) ( OBJ-AT ?auto_186111 ?auto_186115 ) ( TRUCK-AT ?auto_186116 ?auto_186106 ) ( not ( = ?auto_186111 ?auto_186108 ) ) ( not ( = ?auto_186112 ?auto_186115 ) ) ( not ( = ?auto_186111 ?auto_186110 ) ) ( not ( = ?auto_186108 ?auto_186110 ) ) ( not ( = ?auto_186114 ?auto_186112 ) ) ( not ( = ?auto_186114 ?auto_186115 ) ) ( not ( = ?auto_186111 ?auto_186109 ) ) ( not ( = ?auto_186108 ?auto_186109 ) ) ( not ( = ?auto_186110 ?auto_186109 ) ) ( not ( = ?auto_186117 ?auto_186114 ) ) ( not ( = ?auto_186117 ?auto_186112 ) ) ( not ( = ?auto_186117 ?auto_186115 ) ) ( not ( = ?auto_186111 ?auto_186107 ) ) ( not ( = ?auto_186108 ?auto_186107 ) ) ( not ( = ?auto_186110 ?auto_186107 ) ) ( not ( = ?auto_186109 ?auto_186107 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_186111 ?auto_186108 ?auto_186110 ?auto_186107 ?auto_186109 ?auto_186106 )
      ( DELIVER-5PKG-VERIFY ?auto_186107 ?auto_186108 ?auto_186109 ?auto_186110 ?auto_186111 ?auto_186106 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_186762 - OBJ
      ?auto_186763 - OBJ
      ?auto_186764 - OBJ
      ?auto_186765 - OBJ
      ?auto_186766 - OBJ
      ?auto_186761 - LOCATION
    )
    :vars
    (
      ?auto_186767 - LOCATION
      ?auto_186768 - CITY
      ?auto_186772 - LOCATION
      ?auto_186769 - LOCATION
      ?auto_186770 - LOCATION
      ?auto_186771 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186767 ?auto_186768 ) ( IN-CITY ?auto_186761 ?auto_186768 ) ( not ( = ?auto_186761 ?auto_186767 ) ) ( OBJ-AT ?auto_186762 ?auto_186767 ) ( IN-CITY ?auto_186772 ?auto_186768 ) ( not ( = ?auto_186761 ?auto_186772 ) ) ( OBJ-AT ?auto_186766 ?auto_186772 ) ( IN-CITY ?auto_186769 ?auto_186768 ) ( not ( = ?auto_186761 ?auto_186769 ) ) ( OBJ-AT ?auto_186763 ?auto_186769 ) ( OBJ-AT ?auto_186765 ?auto_186767 ) ( IN-CITY ?auto_186770 ?auto_186768 ) ( not ( = ?auto_186761 ?auto_186770 ) ) ( OBJ-AT ?auto_186764 ?auto_186770 ) ( TRUCK-AT ?auto_186771 ?auto_186761 ) ( not ( = ?auto_186764 ?auto_186765 ) ) ( not ( = ?auto_186767 ?auto_186770 ) ) ( not ( = ?auto_186764 ?auto_186763 ) ) ( not ( = ?auto_186765 ?auto_186763 ) ) ( not ( = ?auto_186769 ?auto_186767 ) ) ( not ( = ?auto_186769 ?auto_186770 ) ) ( not ( = ?auto_186764 ?auto_186766 ) ) ( not ( = ?auto_186765 ?auto_186766 ) ) ( not ( = ?auto_186763 ?auto_186766 ) ) ( not ( = ?auto_186772 ?auto_186769 ) ) ( not ( = ?auto_186772 ?auto_186767 ) ) ( not ( = ?auto_186772 ?auto_186770 ) ) ( not ( = ?auto_186764 ?auto_186762 ) ) ( not ( = ?auto_186765 ?auto_186762 ) ) ( not ( = ?auto_186763 ?auto_186762 ) ) ( not ( = ?auto_186766 ?auto_186762 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_186764 ?auto_186765 ?auto_186763 ?auto_186762 ?auto_186766 ?auto_186761 )
      ( DELIVER-5PKG-VERIFY ?auto_186762 ?auto_186763 ?auto_186764 ?auto_186765 ?auto_186766 ?auto_186761 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_186868 - OBJ
      ?auto_186869 - OBJ
      ?auto_186870 - OBJ
      ?auto_186871 - OBJ
      ?auto_186872 - OBJ
      ?auto_186867 - LOCATION
    )
    :vars
    (
      ?auto_186873 - LOCATION
      ?auto_186874 - CITY
      ?auto_186878 - LOCATION
      ?auto_186875 - LOCATION
      ?auto_186876 - LOCATION
      ?auto_186877 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186873 ?auto_186874 ) ( IN-CITY ?auto_186867 ?auto_186874 ) ( not ( = ?auto_186867 ?auto_186873 ) ) ( OBJ-AT ?auto_186868 ?auto_186873 ) ( IN-CITY ?auto_186878 ?auto_186874 ) ( not ( = ?auto_186867 ?auto_186878 ) ) ( OBJ-AT ?auto_186871 ?auto_186878 ) ( IN-CITY ?auto_186875 ?auto_186874 ) ( not ( = ?auto_186867 ?auto_186875 ) ) ( OBJ-AT ?auto_186869 ?auto_186875 ) ( OBJ-AT ?auto_186872 ?auto_186873 ) ( IN-CITY ?auto_186876 ?auto_186874 ) ( not ( = ?auto_186867 ?auto_186876 ) ) ( OBJ-AT ?auto_186870 ?auto_186876 ) ( TRUCK-AT ?auto_186877 ?auto_186867 ) ( not ( = ?auto_186870 ?auto_186872 ) ) ( not ( = ?auto_186873 ?auto_186876 ) ) ( not ( = ?auto_186870 ?auto_186869 ) ) ( not ( = ?auto_186872 ?auto_186869 ) ) ( not ( = ?auto_186875 ?auto_186873 ) ) ( not ( = ?auto_186875 ?auto_186876 ) ) ( not ( = ?auto_186870 ?auto_186871 ) ) ( not ( = ?auto_186872 ?auto_186871 ) ) ( not ( = ?auto_186869 ?auto_186871 ) ) ( not ( = ?auto_186878 ?auto_186875 ) ) ( not ( = ?auto_186878 ?auto_186873 ) ) ( not ( = ?auto_186878 ?auto_186876 ) ) ( not ( = ?auto_186870 ?auto_186868 ) ) ( not ( = ?auto_186872 ?auto_186868 ) ) ( not ( = ?auto_186869 ?auto_186868 ) ) ( not ( = ?auto_186871 ?auto_186868 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_186870 ?auto_186872 ?auto_186869 ?auto_186868 ?auto_186871 ?auto_186867 )
      ( DELIVER-5PKG-VERIFY ?auto_186868 ?auto_186869 ?auto_186870 ?auto_186871 ?auto_186872 ?auto_186867 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_187026 - OBJ
      ?auto_187027 - OBJ
      ?auto_187028 - OBJ
      ?auto_187029 - OBJ
      ?auto_187030 - OBJ
      ?auto_187025 - LOCATION
    )
    :vars
    (
      ?auto_187031 - LOCATION
      ?auto_187032 - CITY
      ?auto_187036 - LOCATION
      ?auto_187033 - LOCATION
      ?auto_187034 - LOCATION
      ?auto_187035 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187031 ?auto_187032 ) ( IN-CITY ?auto_187025 ?auto_187032 ) ( not ( = ?auto_187025 ?auto_187031 ) ) ( OBJ-AT ?auto_187026 ?auto_187031 ) ( IN-CITY ?auto_187036 ?auto_187032 ) ( not ( = ?auto_187025 ?auto_187036 ) ) ( OBJ-AT ?auto_187030 ?auto_187036 ) ( IN-CITY ?auto_187033 ?auto_187032 ) ( not ( = ?auto_187025 ?auto_187033 ) ) ( OBJ-AT ?auto_187027 ?auto_187033 ) ( OBJ-AT ?auto_187028 ?auto_187031 ) ( IN-CITY ?auto_187034 ?auto_187032 ) ( not ( = ?auto_187025 ?auto_187034 ) ) ( OBJ-AT ?auto_187029 ?auto_187034 ) ( TRUCK-AT ?auto_187035 ?auto_187025 ) ( not ( = ?auto_187029 ?auto_187028 ) ) ( not ( = ?auto_187031 ?auto_187034 ) ) ( not ( = ?auto_187029 ?auto_187027 ) ) ( not ( = ?auto_187028 ?auto_187027 ) ) ( not ( = ?auto_187033 ?auto_187031 ) ) ( not ( = ?auto_187033 ?auto_187034 ) ) ( not ( = ?auto_187029 ?auto_187030 ) ) ( not ( = ?auto_187028 ?auto_187030 ) ) ( not ( = ?auto_187027 ?auto_187030 ) ) ( not ( = ?auto_187036 ?auto_187033 ) ) ( not ( = ?auto_187036 ?auto_187031 ) ) ( not ( = ?auto_187036 ?auto_187034 ) ) ( not ( = ?auto_187029 ?auto_187026 ) ) ( not ( = ?auto_187028 ?auto_187026 ) ) ( not ( = ?auto_187027 ?auto_187026 ) ) ( not ( = ?auto_187030 ?auto_187026 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_187029 ?auto_187028 ?auto_187027 ?auto_187026 ?auto_187030 ?auto_187025 )
      ( DELIVER-5PKG-VERIFY ?auto_187026 ?auto_187027 ?auto_187028 ?auto_187029 ?auto_187030 ?auto_187025 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_187187 - OBJ
      ?auto_187188 - OBJ
      ?auto_187189 - OBJ
      ?auto_187190 - OBJ
      ?auto_187191 - OBJ
      ?auto_187186 - LOCATION
    )
    :vars
    (
      ?auto_187192 - LOCATION
      ?auto_187193 - CITY
      ?auto_187197 - LOCATION
      ?auto_187194 - LOCATION
      ?auto_187195 - LOCATION
      ?auto_187196 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187192 ?auto_187193 ) ( IN-CITY ?auto_187186 ?auto_187193 ) ( not ( = ?auto_187186 ?auto_187192 ) ) ( OBJ-AT ?auto_187187 ?auto_187192 ) ( IN-CITY ?auto_187197 ?auto_187193 ) ( not ( = ?auto_187186 ?auto_187197 ) ) ( OBJ-AT ?auto_187190 ?auto_187197 ) ( IN-CITY ?auto_187194 ?auto_187193 ) ( not ( = ?auto_187186 ?auto_187194 ) ) ( OBJ-AT ?auto_187188 ?auto_187194 ) ( OBJ-AT ?auto_187189 ?auto_187192 ) ( IN-CITY ?auto_187195 ?auto_187193 ) ( not ( = ?auto_187186 ?auto_187195 ) ) ( OBJ-AT ?auto_187191 ?auto_187195 ) ( TRUCK-AT ?auto_187196 ?auto_187186 ) ( not ( = ?auto_187191 ?auto_187189 ) ) ( not ( = ?auto_187192 ?auto_187195 ) ) ( not ( = ?auto_187191 ?auto_187188 ) ) ( not ( = ?auto_187189 ?auto_187188 ) ) ( not ( = ?auto_187194 ?auto_187192 ) ) ( not ( = ?auto_187194 ?auto_187195 ) ) ( not ( = ?auto_187191 ?auto_187190 ) ) ( not ( = ?auto_187189 ?auto_187190 ) ) ( not ( = ?auto_187188 ?auto_187190 ) ) ( not ( = ?auto_187197 ?auto_187194 ) ) ( not ( = ?auto_187197 ?auto_187192 ) ) ( not ( = ?auto_187197 ?auto_187195 ) ) ( not ( = ?auto_187191 ?auto_187187 ) ) ( not ( = ?auto_187189 ?auto_187187 ) ) ( not ( = ?auto_187188 ?auto_187187 ) ) ( not ( = ?auto_187190 ?auto_187187 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_187191 ?auto_187189 ?auto_187188 ?auto_187187 ?auto_187190 ?auto_187186 )
      ( DELIVER-5PKG-VERIFY ?auto_187187 ?auto_187188 ?auto_187189 ?auto_187190 ?auto_187191 ?auto_187186 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_187680 - OBJ
      ?auto_187681 - OBJ
      ?auto_187682 - OBJ
      ?auto_187683 - OBJ
      ?auto_187684 - OBJ
      ?auto_187679 - LOCATION
    )
    :vars
    (
      ?auto_187685 - LOCATION
      ?auto_187686 - CITY
      ?auto_187690 - LOCATION
      ?auto_187687 - LOCATION
      ?auto_187688 - LOCATION
      ?auto_187689 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187685 ?auto_187686 ) ( IN-CITY ?auto_187679 ?auto_187686 ) ( not ( = ?auto_187679 ?auto_187685 ) ) ( OBJ-AT ?auto_187680 ?auto_187685 ) ( IN-CITY ?auto_187690 ?auto_187686 ) ( not ( = ?auto_187679 ?auto_187690 ) ) ( OBJ-AT ?auto_187682 ?auto_187690 ) ( IN-CITY ?auto_187687 ?auto_187686 ) ( not ( = ?auto_187679 ?auto_187687 ) ) ( OBJ-AT ?auto_187681 ?auto_187687 ) ( OBJ-AT ?auto_187684 ?auto_187685 ) ( IN-CITY ?auto_187688 ?auto_187686 ) ( not ( = ?auto_187679 ?auto_187688 ) ) ( OBJ-AT ?auto_187683 ?auto_187688 ) ( TRUCK-AT ?auto_187689 ?auto_187679 ) ( not ( = ?auto_187683 ?auto_187684 ) ) ( not ( = ?auto_187685 ?auto_187688 ) ) ( not ( = ?auto_187683 ?auto_187681 ) ) ( not ( = ?auto_187684 ?auto_187681 ) ) ( not ( = ?auto_187687 ?auto_187685 ) ) ( not ( = ?auto_187687 ?auto_187688 ) ) ( not ( = ?auto_187683 ?auto_187682 ) ) ( not ( = ?auto_187684 ?auto_187682 ) ) ( not ( = ?auto_187681 ?auto_187682 ) ) ( not ( = ?auto_187690 ?auto_187687 ) ) ( not ( = ?auto_187690 ?auto_187685 ) ) ( not ( = ?auto_187690 ?auto_187688 ) ) ( not ( = ?auto_187683 ?auto_187680 ) ) ( not ( = ?auto_187684 ?auto_187680 ) ) ( not ( = ?auto_187681 ?auto_187680 ) ) ( not ( = ?auto_187682 ?auto_187680 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_187683 ?auto_187684 ?auto_187681 ?auto_187680 ?auto_187682 ?auto_187679 )
      ( DELIVER-5PKG-VERIFY ?auto_187680 ?auto_187681 ?auto_187682 ?auto_187683 ?auto_187684 ?auto_187679 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_187731 - OBJ
      ?auto_187732 - OBJ
      ?auto_187733 - OBJ
      ?auto_187734 - OBJ
      ?auto_187735 - OBJ
      ?auto_187730 - LOCATION
    )
    :vars
    (
      ?auto_187736 - LOCATION
      ?auto_187737 - CITY
      ?auto_187741 - LOCATION
      ?auto_187738 - LOCATION
      ?auto_187739 - LOCATION
      ?auto_187740 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187736 ?auto_187737 ) ( IN-CITY ?auto_187730 ?auto_187737 ) ( not ( = ?auto_187730 ?auto_187736 ) ) ( OBJ-AT ?auto_187731 ?auto_187736 ) ( IN-CITY ?auto_187741 ?auto_187737 ) ( not ( = ?auto_187730 ?auto_187741 ) ) ( OBJ-AT ?auto_187733 ?auto_187741 ) ( IN-CITY ?auto_187738 ?auto_187737 ) ( not ( = ?auto_187730 ?auto_187738 ) ) ( OBJ-AT ?auto_187732 ?auto_187738 ) ( OBJ-AT ?auto_187734 ?auto_187736 ) ( IN-CITY ?auto_187739 ?auto_187737 ) ( not ( = ?auto_187730 ?auto_187739 ) ) ( OBJ-AT ?auto_187735 ?auto_187739 ) ( TRUCK-AT ?auto_187740 ?auto_187730 ) ( not ( = ?auto_187735 ?auto_187734 ) ) ( not ( = ?auto_187736 ?auto_187739 ) ) ( not ( = ?auto_187735 ?auto_187732 ) ) ( not ( = ?auto_187734 ?auto_187732 ) ) ( not ( = ?auto_187738 ?auto_187736 ) ) ( not ( = ?auto_187738 ?auto_187739 ) ) ( not ( = ?auto_187735 ?auto_187733 ) ) ( not ( = ?auto_187734 ?auto_187733 ) ) ( not ( = ?auto_187732 ?auto_187733 ) ) ( not ( = ?auto_187741 ?auto_187738 ) ) ( not ( = ?auto_187741 ?auto_187736 ) ) ( not ( = ?auto_187741 ?auto_187739 ) ) ( not ( = ?auto_187735 ?auto_187731 ) ) ( not ( = ?auto_187734 ?auto_187731 ) ) ( not ( = ?auto_187732 ?auto_187731 ) ) ( not ( = ?auto_187733 ?auto_187731 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_187735 ?auto_187734 ?auto_187732 ?auto_187731 ?auto_187733 ?auto_187730 )
      ( DELIVER-5PKG-VERIFY ?auto_187731 ?auto_187732 ?auto_187733 ?auto_187734 ?auto_187735 ?auto_187730 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_188441 - OBJ
      ?auto_188442 - OBJ
      ?auto_188443 - OBJ
      ?auto_188444 - OBJ
      ?auto_188445 - OBJ
      ?auto_188440 - LOCATION
    )
    :vars
    (
      ?auto_188446 - LOCATION
      ?auto_188447 - CITY
      ?auto_188451 - LOCATION
      ?auto_188448 - LOCATION
      ?auto_188449 - LOCATION
      ?auto_188450 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_188446 ?auto_188447 ) ( IN-CITY ?auto_188440 ?auto_188447 ) ( not ( = ?auto_188440 ?auto_188446 ) ) ( OBJ-AT ?auto_188441 ?auto_188446 ) ( IN-CITY ?auto_188451 ?auto_188447 ) ( not ( = ?auto_188440 ?auto_188451 ) ) ( OBJ-AT ?auto_188442 ?auto_188451 ) ( IN-CITY ?auto_188448 ?auto_188447 ) ( not ( = ?auto_188440 ?auto_188448 ) ) ( OBJ-AT ?auto_188445 ?auto_188448 ) ( OBJ-AT ?auto_188444 ?auto_188446 ) ( IN-CITY ?auto_188449 ?auto_188447 ) ( not ( = ?auto_188440 ?auto_188449 ) ) ( OBJ-AT ?auto_188443 ?auto_188449 ) ( TRUCK-AT ?auto_188450 ?auto_188440 ) ( not ( = ?auto_188443 ?auto_188444 ) ) ( not ( = ?auto_188446 ?auto_188449 ) ) ( not ( = ?auto_188443 ?auto_188445 ) ) ( not ( = ?auto_188444 ?auto_188445 ) ) ( not ( = ?auto_188448 ?auto_188446 ) ) ( not ( = ?auto_188448 ?auto_188449 ) ) ( not ( = ?auto_188443 ?auto_188442 ) ) ( not ( = ?auto_188444 ?auto_188442 ) ) ( not ( = ?auto_188445 ?auto_188442 ) ) ( not ( = ?auto_188451 ?auto_188448 ) ) ( not ( = ?auto_188451 ?auto_188446 ) ) ( not ( = ?auto_188451 ?auto_188449 ) ) ( not ( = ?auto_188443 ?auto_188441 ) ) ( not ( = ?auto_188444 ?auto_188441 ) ) ( not ( = ?auto_188445 ?auto_188441 ) ) ( not ( = ?auto_188442 ?auto_188441 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_188443 ?auto_188444 ?auto_188445 ?auto_188441 ?auto_188442 ?auto_188440 )
      ( DELIVER-5PKG-VERIFY ?auto_188441 ?auto_188442 ?auto_188443 ?auto_188444 ?auto_188445 ?auto_188440 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_188492 - OBJ
      ?auto_188493 - OBJ
      ?auto_188494 - OBJ
      ?auto_188495 - OBJ
      ?auto_188496 - OBJ
      ?auto_188491 - LOCATION
    )
    :vars
    (
      ?auto_188497 - LOCATION
      ?auto_188498 - CITY
      ?auto_188502 - LOCATION
      ?auto_188499 - LOCATION
      ?auto_188500 - LOCATION
      ?auto_188501 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_188497 ?auto_188498 ) ( IN-CITY ?auto_188491 ?auto_188498 ) ( not ( = ?auto_188491 ?auto_188497 ) ) ( OBJ-AT ?auto_188492 ?auto_188497 ) ( IN-CITY ?auto_188502 ?auto_188498 ) ( not ( = ?auto_188491 ?auto_188502 ) ) ( OBJ-AT ?auto_188493 ?auto_188502 ) ( IN-CITY ?auto_188499 ?auto_188498 ) ( not ( = ?auto_188491 ?auto_188499 ) ) ( OBJ-AT ?auto_188495 ?auto_188499 ) ( OBJ-AT ?auto_188496 ?auto_188497 ) ( IN-CITY ?auto_188500 ?auto_188498 ) ( not ( = ?auto_188491 ?auto_188500 ) ) ( OBJ-AT ?auto_188494 ?auto_188500 ) ( TRUCK-AT ?auto_188501 ?auto_188491 ) ( not ( = ?auto_188494 ?auto_188496 ) ) ( not ( = ?auto_188497 ?auto_188500 ) ) ( not ( = ?auto_188494 ?auto_188495 ) ) ( not ( = ?auto_188496 ?auto_188495 ) ) ( not ( = ?auto_188499 ?auto_188497 ) ) ( not ( = ?auto_188499 ?auto_188500 ) ) ( not ( = ?auto_188494 ?auto_188493 ) ) ( not ( = ?auto_188496 ?auto_188493 ) ) ( not ( = ?auto_188495 ?auto_188493 ) ) ( not ( = ?auto_188502 ?auto_188499 ) ) ( not ( = ?auto_188502 ?auto_188497 ) ) ( not ( = ?auto_188502 ?auto_188500 ) ) ( not ( = ?auto_188494 ?auto_188492 ) ) ( not ( = ?auto_188496 ?auto_188492 ) ) ( not ( = ?auto_188495 ?auto_188492 ) ) ( not ( = ?auto_188493 ?auto_188492 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_188494 ?auto_188496 ?auto_188495 ?auto_188492 ?auto_188493 ?auto_188491 )
      ( DELIVER-5PKG-VERIFY ?auto_188492 ?auto_188493 ?auto_188494 ?auto_188495 ?auto_188496 ?auto_188491 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_188705 - OBJ
      ?auto_188706 - OBJ
      ?auto_188707 - OBJ
      ?auto_188708 - OBJ
      ?auto_188709 - OBJ
      ?auto_188704 - LOCATION
    )
    :vars
    (
      ?auto_188710 - LOCATION
      ?auto_188711 - CITY
      ?auto_188715 - LOCATION
      ?auto_188712 - LOCATION
      ?auto_188713 - LOCATION
      ?auto_188714 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_188710 ?auto_188711 ) ( IN-CITY ?auto_188704 ?auto_188711 ) ( not ( = ?auto_188704 ?auto_188710 ) ) ( OBJ-AT ?auto_188705 ?auto_188710 ) ( IN-CITY ?auto_188715 ?auto_188711 ) ( not ( = ?auto_188704 ?auto_188715 ) ) ( OBJ-AT ?auto_188706 ?auto_188715 ) ( IN-CITY ?auto_188712 ?auto_188711 ) ( not ( = ?auto_188704 ?auto_188712 ) ) ( OBJ-AT ?auto_188709 ?auto_188712 ) ( OBJ-AT ?auto_188707 ?auto_188710 ) ( IN-CITY ?auto_188713 ?auto_188711 ) ( not ( = ?auto_188704 ?auto_188713 ) ) ( OBJ-AT ?auto_188708 ?auto_188713 ) ( TRUCK-AT ?auto_188714 ?auto_188704 ) ( not ( = ?auto_188708 ?auto_188707 ) ) ( not ( = ?auto_188710 ?auto_188713 ) ) ( not ( = ?auto_188708 ?auto_188709 ) ) ( not ( = ?auto_188707 ?auto_188709 ) ) ( not ( = ?auto_188712 ?auto_188710 ) ) ( not ( = ?auto_188712 ?auto_188713 ) ) ( not ( = ?auto_188708 ?auto_188706 ) ) ( not ( = ?auto_188707 ?auto_188706 ) ) ( not ( = ?auto_188709 ?auto_188706 ) ) ( not ( = ?auto_188715 ?auto_188712 ) ) ( not ( = ?auto_188715 ?auto_188710 ) ) ( not ( = ?auto_188715 ?auto_188713 ) ) ( not ( = ?auto_188708 ?auto_188705 ) ) ( not ( = ?auto_188707 ?auto_188705 ) ) ( not ( = ?auto_188709 ?auto_188705 ) ) ( not ( = ?auto_188706 ?auto_188705 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_188708 ?auto_188707 ?auto_188709 ?auto_188705 ?auto_188706 ?auto_188704 )
      ( DELIVER-5PKG-VERIFY ?auto_188705 ?auto_188706 ?auto_188707 ?auto_188708 ?auto_188709 ?auto_188704 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_188811 - OBJ
      ?auto_188812 - OBJ
      ?auto_188813 - OBJ
      ?auto_188814 - OBJ
      ?auto_188815 - OBJ
      ?auto_188810 - LOCATION
    )
    :vars
    (
      ?auto_188816 - LOCATION
      ?auto_188817 - CITY
      ?auto_188821 - LOCATION
      ?auto_188818 - LOCATION
      ?auto_188819 - LOCATION
      ?auto_188820 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_188816 ?auto_188817 ) ( IN-CITY ?auto_188810 ?auto_188817 ) ( not ( = ?auto_188810 ?auto_188816 ) ) ( OBJ-AT ?auto_188811 ?auto_188816 ) ( IN-CITY ?auto_188821 ?auto_188817 ) ( not ( = ?auto_188810 ?auto_188821 ) ) ( OBJ-AT ?auto_188812 ?auto_188821 ) ( IN-CITY ?auto_188818 ?auto_188817 ) ( not ( = ?auto_188810 ?auto_188818 ) ) ( OBJ-AT ?auto_188814 ?auto_188818 ) ( OBJ-AT ?auto_188813 ?auto_188816 ) ( IN-CITY ?auto_188819 ?auto_188817 ) ( not ( = ?auto_188810 ?auto_188819 ) ) ( OBJ-AT ?auto_188815 ?auto_188819 ) ( TRUCK-AT ?auto_188820 ?auto_188810 ) ( not ( = ?auto_188815 ?auto_188813 ) ) ( not ( = ?auto_188816 ?auto_188819 ) ) ( not ( = ?auto_188815 ?auto_188814 ) ) ( not ( = ?auto_188813 ?auto_188814 ) ) ( not ( = ?auto_188818 ?auto_188816 ) ) ( not ( = ?auto_188818 ?auto_188819 ) ) ( not ( = ?auto_188815 ?auto_188812 ) ) ( not ( = ?auto_188813 ?auto_188812 ) ) ( not ( = ?auto_188814 ?auto_188812 ) ) ( not ( = ?auto_188821 ?auto_188818 ) ) ( not ( = ?auto_188821 ?auto_188816 ) ) ( not ( = ?auto_188821 ?auto_188819 ) ) ( not ( = ?auto_188815 ?auto_188811 ) ) ( not ( = ?auto_188813 ?auto_188811 ) ) ( not ( = ?auto_188814 ?auto_188811 ) ) ( not ( = ?auto_188812 ?auto_188811 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_188815 ?auto_188813 ?auto_188814 ?auto_188811 ?auto_188812 ?auto_188810 )
      ( DELIVER-5PKG-VERIFY ?auto_188811 ?auto_188812 ?auto_188813 ?auto_188814 ?auto_188815 ?auto_188810 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_189024 - OBJ
      ?auto_189025 - OBJ
      ?auto_189026 - OBJ
      ?auto_189027 - OBJ
      ?auto_189028 - OBJ
      ?auto_189023 - LOCATION
    )
    :vars
    (
      ?auto_189029 - LOCATION
      ?auto_189030 - CITY
      ?auto_189034 - LOCATION
      ?auto_189031 - LOCATION
      ?auto_189032 - LOCATION
      ?auto_189033 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_189029 ?auto_189030 ) ( IN-CITY ?auto_189023 ?auto_189030 ) ( not ( = ?auto_189023 ?auto_189029 ) ) ( OBJ-AT ?auto_189024 ?auto_189029 ) ( IN-CITY ?auto_189034 ?auto_189030 ) ( not ( = ?auto_189023 ?auto_189034 ) ) ( OBJ-AT ?auto_189025 ?auto_189034 ) ( IN-CITY ?auto_189031 ?auto_189030 ) ( not ( = ?auto_189023 ?auto_189031 ) ) ( OBJ-AT ?auto_189026 ?auto_189031 ) ( OBJ-AT ?auto_189028 ?auto_189029 ) ( IN-CITY ?auto_189032 ?auto_189030 ) ( not ( = ?auto_189023 ?auto_189032 ) ) ( OBJ-AT ?auto_189027 ?auto_189032 ) ( TRUCK-AT ?auto_189033 ?auto_189023 ) ( not ( = ?auto_189027 ?auto_189028 ) ) ( not ( = ?auto_189029 ?auto_189032 ) ) ( not ( = ?auto_189027 ?auto_189026 ) ) ( not ( = ?auto_189028 ?auto_189026 ) ) ( not ( = ?auto_189031 ?auto_189029 ) ) ( not ( = ?auto_189031 ?auto_189032 ) ) ( not ( = ?auto_189027 ?auto_189025 ) ) ( not ( = ?auto_189028 ?auto_189025 ) ) ( not ( = ?auto_189026 ?auto_189025 ) ) ( not ( = ?auto_189034 ?auto_189031 ) ) ( not ( = ?auto_189034 ?auto_189029 ) ) ( not ( = ?auto_189034 ?auto_189032 ) ) ( not ( = ?auto_189027 ?auto_189024 ) ) ( not ( = ?auto_189028 ?auto_189024 ) ) ( not ( = ?auto_189026 ?auto_189024 ) ) ( not ( = ?auto_189025 ?auto_189024 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_189027 ?auto_189028 ?auto_189026 ?auto_189024 ?auto_189025 ?auto_189023 )
      ( DELIVER-5PKG-VERIFY ?auto_189024 ?auto_189025 ?auto_189026 ?auto_189027 ?auto_189028 ?auto_189023 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_189075 - OBJ
      ?auto_189076 - OBJ
      ?auto_189077 - OBJ
      ?auto_189078 - OBJ
      ?auto_189079 - OBJ
      ?auto_189074 - LOCATION
    )
    :vars
    (
      ?auto_189080 - LOCATION
      ?auto_189081 - CITY
      ?auto_189085 - LOCATION
      ?auto_189082 - LOCATION
      ?auto_189083 - LOCATION
      ?auto_189084 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_189080 ?auto_189081 ) ( IN-CITY ?auto_189074 ?auto_189081 ) ( not ( = ?auto_189074 ?auto_189080 ) ) ( OBJ-AT ?auto_189075 ?auto_189080 ) ( IN-CITY ?auto_189085 ?auto_189081 ) ( not ( = ?auto_189074 ?auto_189085 ) ) ( OBJ-AT ?auto_189076 ?auto_189085 ) ( IN-CITY ?auto_189082 ?auto_189081 ) ( not ( = ?auto_189074 ?auto_189082 ) ) ( OBJ-AT ?auto_189077 ?auto_189082 ) ( OBJ-AT ?auto_189078 ?auto_189080 ) ( IN-CITY ?auto_189083 ?auto_189081 ) ( not ( = ?auto_189074 ?auto_189083 ) ) ( OBJ-AT ?auto_189079 ?auto_189083 ) ( TRUCK-AT ?auto_189084 ?auto_189074 ) ( not ( = ?auto_189079 ?auto_189078 ) ) ( not ( = ?auto_189080 ?auto_189083 ) ) ( not ( = ?auto_189079 ?auto_189077 ) ) ( not ( = ?auto_189078 ?auto_189077 ) ) ( not ( = ?auto_189082 ?auto_189080 ) ) ( not ( = ?auto_189082 ?auto_189083 ) ) ( not ( = ?auto_189079 ?auto_189076 ) ) ( not ( = ?auto_189078 ?auto_189076 ) ) ( not ( = ?auto_189077 ?auto_189076 ) ) ( not ( = ?auto_189085 ?auto_189082 ) ) ( not ( = ?auto_189085 ?auto_189080 ) ) ( not ( = ?auto_189085 ?auto_189083 ) ) ( not ( = ?auto_189079 ?auto_189075 ) ) ( not ( = ?auto_189078 ?auto_189075 ) ) ( not ( = ?auto_189077 ?auto_189075 ) ) ( not ( = ?auto_189076 ?auto_189075 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_189079 ?auto_189078 ?auto_189077 ?auto_189075 ?auto_189076 ?auto_189074 )
      ( DELIVER-5PKG-VERIFY ?auto_189075 ?auto_189076 ?auto_189077 ?auto_189078 ?auto_189079 ?auto_189074 ) )
  )

)

