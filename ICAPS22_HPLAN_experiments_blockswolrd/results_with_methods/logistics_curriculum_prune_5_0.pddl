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
      ?auto_16474 - OBJ
      ?auto_16473 - LOCATION
    )
    :vars
    (
      ?auto_16476 - LOCATION
      ?auto_16477 - CITY
      ?auto_16475 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16476 ?auto_16477 ) ( IN-CITY ?auto_16473 ?auto_16477 ) ( not ( = ?auto_16473 ?auto_16476 ) ) ( OBJ-AT ?auto_16474 ?auto_16476 ) ( TRUCK-AT ?auto_16475 ?auto_16473 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16475 ?auto_16473 ?auto_16476 ?auto_16477 )
      ( !LOAD-TRUCK ?auto_16474 ?auto_16475 ?auto_16476 )
      ( !DRIVE-TRUCK ?auto_16475 ?auto_16476 ?auto_16473 ?auto_16477 )
      ( !UNLOAD-TRUCK ?auto_16474 ?auto_16475 ?auto_16473 )
      ( DELIVER-1PKG-VERIFY ?auto_16474 ?auto_16473 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16495 - OBJ
      ?auto_16496 - OBJ
      ?auto_16494 - LOCATION
    )
    :vars
    (
      ?auto_16497 - LOCATION
      ?auto_16499 - CITY
      ?auto_16498 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16497 ?auto_16499 ) ( IN-CITY ?auto_16494 ?auto_16499 ) ( not ( = ?auto_16494 ?auto_16497 ) ) ( OBJ-AT ?auto_16496 ?auto_16497 ) ( OBJ-AT ?auto_16495 ?auto_16497 ) ( TRUCK-AT ?auto_16498 ?auto_16494 ) ( not ( = ?auto_16495 ?auto_16496 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16495 ?auto_16494 )
      ( DELIVER-1PKG ?auto_16496 ?auto_16494 )
      ( DELIVER-2PKG-VERIFY ?auto_16495 ?auto_16496 ?auto_16494 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16603 - OBJ
      ?auto_16604 - OBJ
      ?auto_16605 - OBJ
      ?auto_16602 - LOCATION
    )
    :vars
    (
      ?auto_16607 - LOCATION
      ?auto_16608 - CITY
      ?auto_16609 - LOCATION
      ?auto_16606 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16607 ?auto_16608 ) ( IN-CITY ?auto_16602 ?auto_16608 ) ( not ( = ?auto_16602 ?auto_16607 ) ) ( OBJ-AT ?auto_16605 ?auto_16607 ) ( IN-CITY ?auto_16609 ?auto_16608 ) ( not ( = ?auto_16602 ?auto_16609 ) ) ( OBJ-AT ?auto_16604 ?auto_16609 ) ( OBJ-AT ?auto_16603 ?auto_16609 ) ( TRUCK-AT ?auto_16606 ?auto_16602 ) ( not ( = ?auto_16603 ?auto_16604 ) ) ( not ( = ?auto_16603 ?auto_16605 ) ) ( not ( = ?auto_16604 ?auto_16605 ) ) ( not ( = ?auto_16607 ?auto_16609 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16603 ?auto_16604 ?auto_16602 )
      ( DELIVER-1PKG ?auto_16605 ?auto_16602 )
      ( DELIVER-3PKG-VERIFY ?auto_16603 ?auto_16604 ?auto_16605 ?auto_16602 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16620 - OBJ
      ?auto_16621 - OBJ
      ?auto_16622 - OBJ
      ?auto_16619 - LOCATION
    )
    :vars
    (
      ?auto_16623 - LOCATION
      ?auto_16626 - CITY
      ?auto_16625 - LOCATION
      ?auto_16624 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16623 ?auto_16626 ) ( IN-CITY ?auto_16619 ?auto_16626 ) ( not ( = ?auto_16619 ?auto_16623 ) ) ( OBJ-AT ?auto_16621 ?auto_16623 ) ( IN-CITY ?auto_16625 ?auto_16626 ) ( not ( = ?auto_16619 ?auto_16625 ) ) ( OBJ-AT ?auto_16622 ?auto_16625 ) ( OBJ-AT ?auto_16620 ?auto_16625 ) ( TRUCK-AT ?auto_16624 ?auto_16619 ) ( not ( = ?auto_16620 ?auto_16622 ) ) ( not ( = ?auto_16620 ?auto_16621 ) ) ( not ( = ?auto_16622 ?auto_16621 ) ) ( not ( = ?auto_16623 ?auto_16625 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_16620 ?auto_16622 ?auto_16621 ?auto_16619 )
      ( DELIVER-3PKG-VERIFY ?auto_16620 ?auto_16621 ?auto_16622 ?auto_16619 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16681 - OBJ
      ?auto_16682 - OBJ
      ?auto_16683 - OBJ
      ?auto_16680 - LOCATION
    )
    :vars
    (
      ?auto_16686 - LOCATION
      ?auto_16685 - CITY
      ?auto_16687 - LOCATION
      ?auto_16684 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16686 ?auto_16685 ) ( IN-CITY ?auto_16680 ?auto_16685 ) ( not ( = ?auto_16680 ?auto_16686 ) ) ( OBJ-AT ?auto_16681 ?auto_16686 ) ( IN-CITY ?auto_16687 ?auto_16685 ) ( not ( = ?auto_16680 ?auto_16687 ) ) ( OBJ-AT ?auto_16683 ?auto_16687 ) ( OBJ-AT ?auto_16682 ?auto_16687 ) ( TRUCK-AT ?auto_16684 ?auto_16680 ) ( not ( = ?auto_16682 ?auto_16683 ) ) ( not ( = ?auto_16682 ?auto_16681 ) ) ( not ( = ?auto_16683 ?auto_16681 ) ) ( not ( = ?auto_16686 ?auto_16687 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_16682 ?auto_16681 ?auto_16683 ?auto_16680 )
      ( DELIVER-3PKG-VERIFY ?auto_16681 ?auto_16682 ?auto_16683 ?auto_16680 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17732 - OBJ
      ?auto_17733 - OBJ
      ?auto_17734 - OBJ
      ?auto_17735 - OBJ
      ?auto_17731 - LOCATION
    )
    :vars
    (
      ?auto_17738 - LOCATION
      ?auto_17736 - CITY
      ?auto_17739 - LOCATION
      ?auto_17740 - LOCATION
      ?auto_17737 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17738 ?auto_17736 ) ( IN-CITY ?auto_17731 ?auto_17736 ) ( not ( = ?auto_17731 ?auto_17738 ) ) ( OBJ-AT ?auto_17735 ?auto_17738 ) ( IN-CITY ?auto_17739 ?auto_17736 ) ( not ( = ?auto_17731 ?auto_17739 ) ) ( OBJ-AT ?auto_17734 ?auto_17739 ) ( IN-CITY ?auto_17740 ?auto_17736 ) ( not ( = ?auto_17731 ?auto_17740 ) ) ( OBJ-AT ?auto_17733 ?auto_17740 ) ( OBJ-AT ?auto_17732 ?auto_17740 ) ( TRUCK-AT ?auto_17737 ?auto_17731 ) ( not ( = ?auto_17732 ?auto_17733 ) ) ( not ( = ?auto_17732 ?auto_17734 ) ) ( not ( = ?auto_17733 ?auto_17734 ) ) ( not ( = ?auto_17739 ?auto_17740 ) ) ( not ( = ?auto_17732 ?auto_17735 ) ) ( not ( = ?auto_17733 ?auto_17735 ) ) ( not ( = ?auto_17734 ?auto_17735 ) ) ( not ( = ?auto_17738 ?auto_17739 ) ) ( not ( = ?auto_17738 ?auto_17740 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_17732 ?auto_17734 ?auto_17733 ?auto_17731 )
      ( DELIVER-1PKG ?auto_17735 ?auto_17731 )
      ( DELIVER-4PKG-VERIFY ?auto_17732 ?auto_17733 ?auto_17734 ?auto_17735 ?auto_17731 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17791 - OBJ
      ?auto_17792 - OBJ
      ?auto_17793 - OBJ
      ?auto_17794 - OBJ
      ?auto_17790 - LOCATION
    )
    :vars
    (
      ?auto_17796 - LOCATION
      ?auto_17799 - CITY
      ?auto_17795 - LOCATION
      ?auto_17798 - LOCATION
      ?auto_17797 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17796 ?auto_17799 ) ( IN-CITY ?auto_17790 ?auto_17799 ) ( not ( = ?auto_17790 ?auto_17796 ) ) ( OBJ-AT ?auto_17794 ?auto_17796 ) ( IN-CITY ?auto_17795 ?auto_17799 ) ( not ( = ?auto_17790 ?auto_17795 ) ) ( OBJ-AT ?auto_17792 ?auto_17795 ) ( IN-CITY ?auto_17798 ?auto_17799 ) ( not ( = ?auto_17790 ?auto_17798 ) ) ( OBJ-AT ?auto_17793 ?auto_17798 ) ( OBJ-AT ?auto_17791 ?auto_17798 ) ( TRUCK-AT ?auto_17797 ?auto_17790 ) ( not ( = ?auto_17791 ?auto_17793 ) ) ( not ( = ?auto_17791 ?auto_17792 ) ) ( not ( = ?auto_17793 ?auto_17792 ) ) ( not ( = ?auto_17795 ?auto_17798 ) ) ( not ( = ?auto_17791 ?auto_17794 ) ) ( not ( = ?auto_17793 ?auto_17794 ) ) ( not ( = ?auto_17792 ?auto_17794 ) ) ( not ( = ?auto_17796 ?auto_17795 ) ) ( not ( = ?auto_17796 ?auto_17798 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_17791 ?auto_17793 ?auto_17792 ?auto_17794 ?auto_17790 )
      ( DELIVER-4PKG-VERIFY ?auto_17791 ?auto_17792 ?auto_17793 ?auto_17794 ?auto_17790 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17823 - OBJ
      ?auto_17824 - OBJ
      ?auto_17825 - OBJ
      ?auto_17826 - OBJ
      ?auto_17822 - LOCATION
    )
    :vars
    (
      ?auto_17831 - LOCATION
      ?auto_17830 - CITY
      ?auto_17828 - LOCATION
      ?auto_17827 - LOCATION
      ?auto_17829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17831 ?auto_17830 ) ( IN-CITY ?auto_17822 ?auto_17830 ) ( not ( = ?auto_17822 ?auto_17831 ) ) ( OBJ-AT ?auto_17825 ?auto_17831 ) ( IN-CITY ?auto_17828 ?auto_17830 ) ( not ( = ?auto_17822 ?auto_17828 ) ) ( OBJ-AT ?auto_17824 ?auto_17828 ) ( IN-CITY ?auto_17827 ?auto_17830 ) ( not ( = ?auto_17822 ?auto_17827 ) ) ( OBJ-AT ?auto_17826 ?auto_17827 ) ( OBJ-AT ?auto_17823 ?auto_17827 ) ( TRUCK-AT ?auto_17829 ?auto_17822 ) ( not ( = ?auto_17823 ?auto_17826 ) ) ( not ( = ?auto_17823 ?auto_17824 ) ) ( not ( = ?auto_17826 ?auto_17824 ) ) ( not ( = ?auto_17828 ?auto_17827 ) ) ( not ( = ?auto_17823 ?auto_17825 ) ) ( not ( = ?auto_17826 ?auto_17825 ) ) ( not ( = ?auto_17824 ?auto_17825 ) ) ( not ( = ?auto_17831 ?auto_17828 ) ) ( not ( = ?auto_17831 ?auto_17827 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_17823 ?auto_17824 ?auto_17826 ?auto_17825 ?auto_17822 )
      ( DELIVER-4PKG-VERIFY ?auto_17823 ?auto_17824 ?auto_17825 ?auto_17826 ?auto_17822 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18412 - OBJ
      ?auto_18413 - OBJ
      ?auto_18414 - OBJ
      ?auto_18415 - OBJ
      ?auto_18411 - LOCATION
    )
    :vars
    (
      ?auto_18420 - LOCATION
      ?auto_18419 - CITY
      ?auto_18417 - LOCATION
      ?auto_18416 - LOCATION
      ?auto_18418 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18420 ?auto_18419 ) ( IN-CITY ?auto_18411 ?auto_18419 ) ( not ( = ?auto_18411 ?auto_18420 ) ) ( OBJ-AT ?auto_18415 ?auto_18420 ) ( IN-CITY ?auto_18417 ?auto_18419 ) ( not ( = ?auto_18411 ?auto_18417 ) ) ( OBJ-AT ?auto_18412 ?auto_18417 ) ( IN-CITY ?auto_18416 ?auto_18419 ) ( not ( = ?auto_18411 ?auto_18416 ) ) ( OBJ-AT ?auto_18414 ?auto_18416 ) ( OBJ-AT ?auto_18413 ?auto_18416 ) ( TRUCK-AT ?auto_18418 ?auto_18411 ) ( not ( = ?auto_18413 ?auto_18414 ) ) ( not ( = ?auto_18413 ?auto_18412 ) ) ( not ( = ?auto_18414 ?auto_18412 ) ) ( not ( = ?auto_18417 ?auto_18416 ) ) ( not ( = ?auto_18413 ?auto_18415 ) ) ( not ( = ?auto_18414 ?auto_18415 ) ) ( not ( = ?auto_18412 ?auto_18415 ) ) ( not ( = ?auto_18420 ?auto_18417 ) ) ( not ( = ?auto_18420 ?auto_18416 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18413 ?auto_18412 ?auto_18414 ?auto_18415 ?auto_18411 )
      ( DELIVER-4PKG-VERIFY ?auto_18412 ?auto_18413 ?auto_18414 ?auto_18415 ?auto_18411 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18444 - OBJ
      ?auto_18445 - OBJ
      ?auto_18446 - OBJ
      ?auto_18447 - OBJ
      ?auto_18443 - LOCATION
    )
    :vars
    (
      ?auto_18452 - LOCATION
      ?auto_18451 - CITY
      ?auto_18449 - LOCATION
      ?auto_18448 - LOCATION
      ?auto_18450 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18452 ?auto_18451 ) ( IN-CITY ?auto_18443 ?auto_18451 ) ( not ( = ?auto_18443 ?auto_18452 ) ) ( OBJ-AT ?auto_18446 ?auto_18452 ) ( IN-CITY ?auto_18449 ?auto_18451 ) ( not ( = ?auto_18443 ?auto_18449 ) ) ( OBJ-AT ?auto_18444 ?auto_18449 ) ( IN-CITY ?auto_18448 ?auto_18451 ) ( not ( = ?auto_18443 ?auto_18448 ) ) ( OBJ-AT ?auto_18447 ?auto_18448 ) ( OBJ-AT ?auto_18445 ?auto_18448 ) ( TRUCK-AT ?auto_18450 ?auto_18443 ) ( not ( = ?auto_18445 ?auto_18447 ) ) ( not ( = ?auto_18445 ?auto_18444 ) ) ( not ( = ?auto_18447 ?auto_18444 ) ) ( not ( = ?auto_18449 ?auto_18448 ) ) ( not ( = ?auto_18445 ?auto_18446 ) ) ( not ( = ?auto_18447 ?auto_18446 ) ) ( not ( = ?auto_18444 ?auto_18446 ) ) ( not ( = ?auto_18452 ?auto_18449 ) ) ( not ( = ?auto_18452 ?auto_18448 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18445 ?auto_18444 ?auto_18447 ?auto_18446 ?auto_18443 )
      ( DELIVER-4PKG-VERIFY ?auto_18444 ?auto_18445 ?auto_18446 ?auto_18447 ?auto_18443 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18632 - OBJ
      ?auto_18633 - OBJ
      ?auto_18634 - OBJ
      ?auto_18635 - OBJ
      ?auto_18631 - LOCATION
    )
    :vars
    (
      ?auto_18640 - LOCATION
      ?auto_18639 - CITY
      ?auto_18637 - LOCATION
      ?auto_18636 - LOCATION
      ?auto_18638 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18640 ?auto_18639 ) ( IN-CITY ?auto_18631 ?auto_18639 ) ( not ( = ?auto_18631 ?auto_18640 ) ) ( OBJ-AT ?auto_18633 ?auto_18640 ) ( IN-CITY ?auto_18637 ?auto_18639 ) ( not ( = ?auto_18631 ?auto_18637 ) ) ( OBJ-AT ?auto_18632 ?auto_18637 ) ( IN-CITY ?auto_18636 ?auto_18639 ) ( not ( = ?auto_18631 ?auto_18636 ) ) ( OBJ-AT ?auto_18635 ?auto_18636 ) ( OBJ-AT ?auto_18634 ?auto_18636 ) ( TRUCK-AT ?auto_18638 ?auto_18631 ) ( not ( = ?auto_18634 ?auto_18635 ) ) ( not ( = ?auto_18634 ?auto_18632 ) ) ( not ( = ?auto_18635 ?auto_18632 ) ) ( not ( = ?auto_18637 ?auto_18636 ) ) ( not ( = ?auto_18634 ?auto_18633 ) ) ( not ( = ?auto_18635 ?auto_18633 ) ) ( not ( = ?auto_18632 ?auto_18633 ) ) ( not ( = ?auto_18640 ?auto_18637 ) ) ( not ( = ?auto_18640 ?auto_18636 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18634 ?auto_18632 ?auto_18635 ?auto_18633 ?auto_18631 )
      ( DELIVER-4PKG-VERIFY ?auto_18632 ?auto_18633 ?auto_18634 ?auto_18635 ?auto_18631 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33142 - OBJ
      ?auto_33143 - OBJ
      ?auto_33144 - OBJ
      ?auto_33145 - OBJ
      ?auto_33146 - OBJ
      ?auto_33141 - LOCATION
    )
    :vars
    (
      ?auto_33147 - LOCATION
      ?auto_33148 - CITY
      ?auto_33151 - LOCATION
      ?auto_33150 - LOCATION
      ?auto_33149 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33147 ?auto_33148 ) ( IN-CITY ?auto_33141 ?auto_33148 ) ( not ( = ?auto_33141 ?auto_33147 ) ) ( OBJ-AT ?auto_33146 ?auto_33147 ) ( OBJ-AT ?auto_33145 ?auto_33147 ) ( IN-CITY ?auto_33151 ?auto_33148 ) ( not ( = ?auto_33141 ?auto_33151 ) ) ( OBJ-AT ?auto_33144 ?auto_33151 ) ( IN-CITY ?auto_33150 ?auto_33148 ) ( not ( = ?auto_33141 ?auto_33150 ) ) ( OBJ-AT ?auto_33143 ?auto_33150 ) ( OBJ-AT ?auto_33142 ?auto_33150 ) ( TRUCK-AT ?auto_33149 ?auto_33141 ) ( not ( = ?auto_33142 ?auto_33143 ) ) ( not ( = ?auto_33142 ?auto_33144 ) ) ( not ( = ?auto_33143 ?auto_33144 ) ) ( not ( = ?auto_33151 ?auto_33150 ) ) ( not ( = ?auto_33142 ?auto_33145 ) ) ( not ( = ?auto_33143 ?auto_33145 ) ) ( not ( = ?auto_33144 ?auto_33145 ) ) ( not ( = ?auto_33147 ?auto_33151 ) ) ( not ( = ?auto_33147 ?auto_33150 ) ) ( not ( = ?auto_33142 ?auto_33146 ) ) ( not ( = ?auto_33143 ?auto_33146 ) ) ( not ( = ?auto_33144 ?auto_33146 ) ) ( not ( = ?auto_33145 ?auto_33146 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_33142 ?auto_33144 ?auto_33143 ?auto_33145 ?auto_33141 )
      ( DELIVER-1PKG ?auto_33146 ?auto_33141 )
      ( DELIVER-5PKG-VERIFY ?auto_33142 ?auto_33143 ?auto_33144 ?auto_33145 ?auto_33146 ?auto_33141 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33231 - OBJ
      ?auto_33232 - OBJ
      ?auto_33233 - OBJ
      ?auto_33234 - OBJ
      ?auto_33235 - OBJ
      ?auto_33230 - LOCATION
    )
    :vars
    (
      ?auto_33237 - LOCATION
      ?auto_33240 - CITY
      ?auto_33239 - LOCATION
      ?auto_33236 - LOCATION
      ?auto_33238 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33237 ?auto_33240 ) ( IN-CITY ?auto_33230 ?auto_33240 ) ( not ( = ?auto_33230 ?auto_33237 ) ) ( OBJ-AT ?auto_33235 ?auto_33237 ) ( OBJ-AT ?auto_33233 ?auto_33237 ) ( IN-CITY ?auto_33239 ?auto_33240 ) ( not ( = ?auto_33230 ?auto_33239 ) ) ( OBJ-AT ?auto_33234 ?auto_33239 ) ( IN-CITY ?auto_33236 ?auto_33240 ) ( not ( = ?auto_33230 ?auto_33236 ) ) ( OBJ-AT ?auto_33232 ?auto_33236 ) ( OBJ-AT ?auto_33231 ?auto_33236 ) ( TRUCK-AT ?auto_33238 ?auto_33230 ) ( not ( = ?auto_33231 ?auto_33232 ) ) ( not ( = ?auto_33231 ?auto_33234 ) ) ( not ( = ?auto_33232 ?auto_33234 ) ) ( not ( = ?auto_33239 ?auto_33236 ) ) ( not ( = ?auto_33231 ?auto_33233 ) ) ( not ( = ?auto_33232 ?auto_33233 ) ) ( not ( = ?auto_33234 ?auto_33233 ) ) ( not ( = ?auto_33237 ?auto_33239 ) ) ( not ( = ?auto_33237 ?auto_33236 ) ) ( not ( = ?auto_33231 ?auto_33235 ) ) ( not ( = ?auto_33232 ?auto_33235 ) ) ( not ( = ?auto_33234 ?auto_33235 ) ) ( not ( = ?auto_33233 ?auto_33235 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_33231 ?auto_33232 ?auto_33234 ?auto_33233 ?auto_33235 ?auto_33230 )
      ( DELIVER-5PKG-VERIFY ?auto_33231 ?auto_33232 ?auto_33233 ?auto_33234 ?auto_33235 ?auto_33230 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33278 - OBJ
      ?auto_33279 - OBJ
      ?auto_33280 - OBJ
      ?auto_33281 - OBJ
      ?auto_33282 - OBJ
      ?auto_33277 - LOCATION
    )
    :vars
    (
      ?auto_33286 - LOCATION
      ?auto_33287 - CITY
      ?auto_33284 - LOCATION
      ?auto_33285 - LOCATION
      ?auto_33283 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33286 ?auto_33287 ) ( IN-CITY ?auto_33277 ?auto_33287 ) ( not ( = ?auto_33277 ?auto_33286 ) ) ( OBJ-AT ?auto_33281 ?auto_33286 ) ( OBJ-AT ?auto_33280 ?auto_33286 ) ( IN-CITY ?auto_33284 ?auto_33287 ) ( not ( = ?auto_33277 ?auto_33284 ) ) ( OBJ-AT ?auto_33282 ?auto_33284 ) ( IN-CITY ?auto_33285 ?auto_33287 ) ( not ( = ?auto_33277 ?auto_33285 ) ) ( OBJ-AT ?auto_33279 ?auto_33285 ) ( OBJ-AT ?auto_33278 ?auto_33285 ) ( TRUCK-AT ?auto_33283 ?auto_33277 ) ( not ( = ?auto_33278 ?auto_33279 ) ) ( not ( = ?auto_33278 ?auto_33282 ) ) ( not ( = ?auto_33279 ?auto_33282 ) ) ( not ( = ?auto_33284 ?auto_33285 ) ) ( not ( = ?auto_33278 ?auto_33280 ) ) ( not ( = ?auto_33279 ?auto_33280 ) ) ( not ( = ?auto_33282 ?auto_33280 ) ) ( not ( = ?auto_33286 ?auto_33284 ) ) ( not ( = ?auto_33286 ?auto_33285 ) ) ( not ( = ?auto_33278 ?auto_33281 ) ) ( not ( = ?auto_33279 ?auto_33281 ) ) ( not ( = ?auto_33282 ?auto_33281 ) ) ( not ( = ?auto_33280 ?auto_33281 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_33278 ?auto_33279 ?auto_33280 ?auto_33282 ?auto_33281 ?auto_33277 )
      ( DELIVER-5PKG-VERIFY ?auto_33278 ?auto_33279 ?auto_33280 ?auto_33281 ?auto_33282 ?auto_33277 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33759 - OBJ
      ?auto_33760 - OBJ
      ?auto_33761 - OBJ
      ?auto_33762 - OBJ
      ?auto_33763 - OBJ
      ?auto_33758 - LOCATION
    )
    :vars
    (
      ?auto_33767 - LOCATION
      ?auto_33768 - CITY
      ?auto_33765 - LOCATION
      ?auto_33766 - LOCATION
      ?auto_33764 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33767 ?auto_33768 ) ( IN-CITY ?auto_33758 ?auto_33768 ) ( not ( = ?auto_33758 ?auto_33767 ) ) ( OBJ-AT ?auto_33763 ?auto_33767 ) ( OBJ-AT ?auto_33762 ?auto_33767 ) ( IN-CITY ?auto_33765 ?auto_33768 ) ( not ( = ?auto_33758 ?auto_33765 ) ) ( OBJ-AT ?auto_33760 ?auto_33765 ) ( IN-CITY ?auto_33766 ?auto_33768 ) ( not ( = ?auto_33758 ?auto_33766 ) ) ( OBJ-AT ?auto_33761 ?auto_33766 ) ( OBJ-AT ?auto_33759 ?auto_33766 ) ( TRUCK-AT ?auto_33764 ?auto_33758 ) ( not ( = ?auto_33759 ?auto_33761 ) ) ( not ( = ?auto_33759 ?auto_33760 ) ) ( not ( = ?auto_33761 ?auto_33760 ) ) ( not ( = ?auto_33765 ?auto_33766 ) ) ( not ( = ?auto_33759 ?auto_33762 ) ) ( not ( = ?auto_33761 ?auto_33762 ) ) ( not ( = ?auto_33760 ?auto_33762 ) ) ( not ( = ?auto_33767 ?auto_33765 ) ) ( not ( = ?auto_33767 ?auto_33766 ) ) ( not ( = ?auto_33759 ?auto_33763 ) ) ( not ( = ?auto_33761 ?auto_33763 ) ) ( not ( = ?auto_33760 ?auto_33763 ) ) ( not ( = ?auto_33762 ?auto_33763 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_33759 ?auto_33761 ?auto_33762 ?auto_33760 ?auto_33763 ?auto_33758 )
      ( DELIVER-5PKG-VERIFY ?auto_33759 ?auto_33760 ?auto_33761 ?auto_33762 ?auto_33763 ?auto_33758 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33949 - OBJ
      ?auto_33950 - OBJ
      ?auto_33951 - OBJ
      ?auto_33952 - OBJ
      ?auto_33953 - OBJ
      ?auto_33948 - LOCATION
    )
    :vars
    (
      ?auto_33957 - LOCATION
      ?auto_33958 - CITY
      ?auto_33955 - LOCATION
      ?auto_33956 - LOCATION
      ?auto_33954 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33957 ?auto_33958 ) ( IN-CITY ?auto_33948 ?auto_33958 ) ( not ( = ?auto_33948 ?auto_33957 ) ) ( OBJ-AT ?auto_33953 ?auto_33957 ) ( OBJ-AT ?auto_33951 ?auto_33957 ) ( IN-CITY ?auto_33955 ?auto_33958 ) ( not ( = ?auto_33948 ?auto_33955 ) ) ( OBJ-AT ?auto_33950 ?auto_33955 ) ( IN-CITY ?auto_33956 ?auto_33958 ) ( not ( = ?auto_33948 ?auto_33956 ) ) ( OBJ-AT ?auto_33952 ?auto_33956 ) ( OBJ-AT ?auto_33949 ?auto_33956 ) ( TRUCK-AT ?auto_33954 ?auto_33948 ) ( not ( = ?auto_33949 ?auto_33952 ) ) ( not ( = ?auto_33949 ?auto_33950 ) ) ( not ( = ?auto_33952 ?auto_33950 ) ) ( not ( = ?auto_33955 ?auto_33956 ) ) ( not ( = ?auto_33949 ?auto_33951 ) ) ( not ( = ?auto_33952 ?auto_33951 ) ) ( not ( = ?auto_33950 ?auto_33951 ) ) ( not ( = ?auto_33957 ?auto_33955 ) ) ( not ( = ?auto_33957 ?auto_33956 ) ) ( not ( = ?auto_33949 ?auto_33953 ) ) ( not ( = ?auto_33952 ?auto_33953 ) ) ( not ( = ?auto_33950 ?auto_33953 ) ) ( not ( = ?auto_33951 ?auto_33953 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_33949 ?auto_33952 ?auto_33951 ?auto_33950 ?auto_33953 ?auto_33948 )
      ( DELIVER-5PKG-VERIFY ?auto_33949 ?auto_33950 ?auto_33951 ?auto_33952 ?auto_33953 ?auto_33948 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33996 - OBJ
      ?auto_33997 - OBJ
      ?auto_33998 - OBJ
      ?auto_33999 - OBJ
      ?auto_34000 - OBJ
      ?auto_33995 - LOCATION
    )
    :vars
    (
      ?auto_34004 - LOCATION
      ?auto_34005 - CITY
      ?auto_34002 - LOCATION
      ?auto_34003 - LOCATION
      ?auto_34001 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34004 ?auto_34005 ) ( IN-CITY ?auto_33995 ?auto_34005 ) ( not ( = ?auto_33995 ?auto_34004 ) ) ( OBJ-AT ?auto_33999 ?auto_34004 ) ( OBJ-AT ?auto_33998 ?auto_34004 ) ( IN-CITY ?auto_34002 ?auto_34005 ) ( not ( = ?auto_33995 ?auto_34002 ) ) ( OBJ-AT ?auto_33997 ?auto_34002 ) ( IN-CITY ?auto_34003 ?auto_34005 ) ( not ( = ?auto_33995 ?auto_34003 ) ) ( OBJ-AT ?auto_34000 ?auto_34003 ) ( OBJ-AT ?auto_33996 ?auto_34003 ) ( TRUCK-AT ?auto_34001 ?auto_33995 ) ( not ( = ?auto_33996 ?auto_34000 ) ) ( not ( = ?auto_33996 ?auto_33997 ) ) ( not ( = ?auto_34000 ?auto_33997 ) ) ( not ( = ?auto_34002 ?auto_34003 ) ) ( not ( = ?auto_33996 ?auto_33998 ) ) ( not ( = ?auto_34000 ?auto_33998 ) ) ( not ( = ?auto_33997 ?auto_33998 ) ) ( not ( = ?auto_34004 ?auto_34002 ) ) ( not ( = ?auto_34004 ?auto_34003 ) ) ( not ( = ?auto_33996 ?auto_33999 ) ) ( not ( = ?auto_34000 ?auto_33999 ) ) ( not ( = ?auto_33997 ?auto_33999 ) ) ( not ( = ?auto_33998 ?auto_33999 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_33996 ?auto_34000 ?auto_33998 ?auto_33997 ?auto_33999 ?auto_33995 )
      ( DELIVER-5PKG-VERIFY ?auto_33996 ?auto_33997 ?auto_33998 ?auto_33999 ?auto_34000 ?auto_33995 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34477 - OBJ
      ?auto_34478 - OBJ
      ?auto_34479 - OBJ
      ?auto_34480 - OBJ
      ?auto_34481 - OBJ
      ?auto_34476 - LOCATION
    )
    :vars
    (
      ?auto_34485 - LOCATION
      ?auto_34486 - CITY
      ?auto_34483 - LOCATION
      ?auto_34484 - LOCATION
      ?auto_34482 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34485 ?auto_34486 ) ( IN-CITY ?auto_34476 ?auto_34486 ) ( not ( = ?auto_34476 ?auto_34485 ) ) ( OBJ-AT ?auto_34481 ?auto_34485 ) ( OBJ-AT ?auto_34478 ?auto_34485 ) ( IN-CITY ?auto_34483 ?auto_34486 ) ( not ( = ?auto_34476 ?auto_34483 ) ) ( OBJ-AT ?auto_34480 ?auto_34483 ) ( IN-CITY ?auto_34484 ?auto_34486 ) ( not ( = ?auto_34476 ?auto_34484 ) ) ( OBJ-AT ?auto_34479 ?auto_34484 ) ( OBJ-AT ?auto_34477 ?auto_34484 ) ( TRUCK-AT ?auto_34482 ?auto_34476 ) ( not ( = ?auto_34477 ?auto_34479 ) ) ( not ( = ?auto_34477 ?auto_34480 ) ) ( not ( = ?auto_34479 ?auto_34480 ) ) ( not ( = ?auto_34483 ?auto_34484 ) ) ( not ( = ?auto_34477 ?auto_34478 ) ) ( not ( = ?auto_34479 ?auto_34478 ) ) ( not ( = ?auto_34480 ?auto_34478 ) ) ( not ( = ?auto_34485 ?auto_34483 ) ) ( not ( = ?auto_34485 ?auto_34484 ) ) ( not ( = ?auto_34477 ?auto_34481 ) ) ( not ( = ?auto_34479 ?auto_34481 ) ) ( not ( = ?auto_34480 ?auto_34481 ) ) ( not ( = ?auto_34478 ?auto_34481 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34477 ?auto_34479 ?auto_34478 ?auto_34480 ?auto_34481 ?auto_34476 )
      ( DELIVER-5PKG-VERIFY ?auto_34477 ?auto_34478 ?auto_34479 ?auto_34480 ?auto_34481 ?auto_34476 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34524 - OBJ
      ?auto_34525 - OBJ
      ?auto_34526 - OBJ
      ?auto_34527 - OBJ
      ?auto_34528 - OBJ
      ?auto_34523 - LOCATION
    )
    :vars
    (
      ?auto_34532 - LOCATION
      ?auto_34533 - CITY
      ?auto_34530 - LOCATION
      ?auto_34531 - LOCATION
      ?auto_34529 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34532 ?auto_34533 ) ( IN-CITY ?auto_34523 ?auto_34533 ) ( not ( = ?auto_34523 ?auto_34532 ) ) ( OBJ-AT ?auto_34527 ?auto_34532 ) ( OBJ-AT ?auto_34525 ?auto_34532 ) ( IN-CITY ?auto_34530 ?auto_34533 ) ( not ( = ?auto_34523 ?auto_34530 ) ) ( OBJ-AT ?auto_34528 ?auto_34530 ) ( IN-CITY ?auto_34531 ?auto_34533 ) ( not ( = ?auto_34523 ?auto_34531 ) ) ( OBJ-AT ?auto_34526 ?auto_34531 ) ( OBJ-AT ?auto_34524 ?auto_34531 ) ( TRUCK-AT ?auto_34529 ?auto_34523 ) ( not ( = ?auto_34524 ?auto_34526 ) ) ( not ( = ?auto_34524 ?auto_34528 ) ) ( not ( = ?auto_34526 ?auto_34528 ) ) ( not ( = ?auto_34530 ?auto_34531 ) ) ( not ( = ?auto_34524 ?auto_34525 ) ) ( not ( = ?auto_34526 ?auto_34525 ) ) ( not ( = ?auto_34528 ?auto_34525 ) ) ( not ( = ?auto_34532 ?auto_34530 ) ) ( not ( = ?auto_34532 ?auto_34531 ) ) ( not ( = ?auto_34524 ?auto_34527 ) ) ( not ( = ?auto_34526 ?auto_34527 ) ) ( not ( = ?auto_34528 ?auto_34527 ) ) ( not ( = ?auto_34525 ?auto_34527 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34524 ?auto_34526 ?auto_34525 ?auto_34528 ?auto_34527 ?auto_34523 )
      ( DELIVER-5PKG-VERIFY ?auto_34524 ?auto_34525 ?auto_34526 ?auto_34527 ?auto_34528 ?auto_34523 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34571 - OBJ
      ?auto_34572 - OBJ
      ?auto_34573 - OBJ
      ?auto_34574 - OBJ
      ?auto_34575 - OBJ
      ?auto_34570 - LOCATION
    )
    :vars
    (
      ?auto_34579 - LOCATION
      ?auto_34580 - CITY
      ?auto_34577 - LOCATION
      ?auto_34578 - LOCATION
      ?auto_34576 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34579 ?auto_34580 ) ( IN-CITY ?auto_34570 ?auto_34580 ) ( not ( = ?auto_34570 ?auto_34579 ) ) ( OBJ-AT ?auto_34575 ?auto_34579 ) ( OBJ-AT ?auto_34572 ?auto_34579 ) ( IN-CITY ?auto_34577 ?auto_34580 ) ( not ( = ?auto_34570 ?auto_34577 ) ) ( OBJ-AT ?auto_34573 ?auto_34577 ) ( IN-CITY ?auto_34578 ?auto_34580 ) ( not ( = ?auto_34570 ?auto_34578 ) ) ( OBJ-AT ?auto_34574 ?auto_34578 ) ( OBJ-AT ?auto_34571 ?auto_34578 ) ( TRUCK-AT ?auto_34576 ?auto_34570 ) ( not ( = ?auto_34571 ?auto_34574 ) ) ( not ( = ?auto_34571 ?auto_34573 ) ) ( not ( = ?auto_34574 ?auto_34573 ) ) ( not ( = ?auto_34577 ?auto_34578 ) ) ( not ( = ?auto_34571 ?auto_34572 ) ) ( not ( = ?auto_34574 ?auto_34572 ) ) ( not ( = ?auto_34573 ?auto_34572 ) ) ( not ( = ?auto_34579 ?auto_34577 ) ) ( not ( = ?auto_34579 ?auto_34578 ) ) ( not ( = ?auto_34571 ?auto_34575 ) ) ( not ( = ?auto_34574 ?auto_34575 ) ) ( not ( = ?auto_34573 ?auto_34575 ) ) ( not ( = ?auto_34572 ?auto_34575 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34571 ?auto_34574 ?auto_34572 ?auto_34573 ?auto_34575 ?auto_34570 )
      ( DELIVER-5PKG-VERIFY ?auto_34571 ?auto_34572 ?auto_34573 ?auto_34574 ?auto_34575 ?auto_34570 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34618 - OBJ
      ?auto_34619 - OBJ
      ?auto_34620 - OBJ
      ?auto_34621 - OBJ
      ?auto_34622 - OBJ
      ?auto_34617 - LOCATION
    )
    :vars
    (
      ?auto_34626 - LOCATION
      ?auto_34627 - CITY
      ?auto_34624 - LOCATION
      ?auto_34625 - LOCATION
      ?auto_34623 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34626 ?auto_34627 ) ( IN-CITY ?auto_34617 ?auto_34627 ) ( not ( = ?auto_34617 ?auto_34626 ) ) ( OBJ-AT ?auto_34621 ?auto_34626 ) ( OBJ-AT ?auto_34619 ?auto_34626 ) ( IN-CITY ?auto_34624 ?auto_34627 ) ( not ( = ?auto_34617 ?auto_34624 ) ) ( OBJ-AT ?auto_34620 ?auto_34624 ) ( IN-CITY ?auto_34625 ?auto_34627 ) ( not ( = ?auto_34617 ?auto_34625 ) ) ( OBJ-AT ?auto_34622 ?auto_34625 ) ( OBJ-AT ?auto_34618 ?auto_34625 ) ( TRUCK-AT ?auto_34623 ?auto_34617 ) ( not ( = ?auto_34618 ?auto_34622 ) ) ( not ( = ?auto_34618 ?auto_34620 ) ) ( not ( = ?auto_34622 ?auto_34620 ) ) ( not ( = ?auto_34624 ?auto_34625 ) ) ( not ( = ?auto_34618 ?auto_34619 ) ) ( not ( = ?auto_34622 ?auto_34619 ) ) ( not ( = ?auto_34620 ?auto_34619 ) ) ( not ( = ?auto_34626 ?auto_34624 ) ) ( not ( = ?auto_34626 ?auto_34625 ) ) ( not ( = ?auto_34618 ?auto_34621 ) ) ( not ( = ?auto_34622 ?auto_34621 ) ) ( not ( = ?auto_34620 ?auto_34621 ) ) ( not ( = ?auto_34619 ?auto_34621 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34618 ?auto_34622 ?auto_34619 ?auto_34620 ?auto_34621 ?auto_34617 )
      ( DELIVER-5PKG-VERIFY ?auto_34618 ?auto_34619 ?auto_34620 ?auto_34621 ?auto_34622 ?auto_34617 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34865 - OBJ
      ?auto_34866 - OBJ
      ?auto_34867 - OBJ
      ?auto_34868 - OBJ
      ?auto_34869 - OBJ
      ?auto_34864 - LOCATION
    )
    :vars
    (
      ?auto_34873 - LOCATION
      ?auto_34874 - CITY
      ?auto_34871 - LOCATION
      ?auto_34872 - LOCATION
      ?auto_34870 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34873 ?auto_34874 ) ( IN-CITY ?auto_34864 ?auto_34874 ) ( not ( = ?auto_34864 ?auto_34873 ) ) ( OBJ-AT ?auto_34867 ?auto_34873 ) ( OBJ-AT ?auto_34866 ?auto_34873 ) ( IN-CITY ?auto_34871 ?auto_34874 ) ( not ( = ?auto_34864 ?auto_34871 ) ) ( OBJ-AT ?auto_34869 ?auto_34871 ) ( IN-CITY ?auto_34872 ?auto_34874 ) ( not ( = ?auto_34864 ?auto_34872 ) ) ( OBJ-AT ?auto_34868 ?auto_34872 ) ( OBJ-AT ?auto_34865 ?auto_34872 ) ( TRUCK-AT ?auto_34870 ?auto_34864 ) ( not ( = ?auto_34865 ?auto_34868 ) ) ( not ( = ?auto_34865 ?auto_34869 ) ) ( not ( = ?auto_34868 ?auto_34869 ) ) ( not ( = ?auto_34871 ?auto_34872 ) ) ( not ( = ?auto_34865 ?auto_34866 ) ) ( not ( = ?auto_34868 ?auto_34866 ) ) ( not ( = ?auto_34869 ?auto_34866 ) ) ( not ( = ?auto_34873 ?auto_34871 ) ) ( not ( = ?auto_34873 ?auto_34872 ) ) ( not ( = ?auto_34865 ?auto_34867 ) ) ( not ( = ?auto_34868 ?auto_34867 ) ) ( not ( = ?auto_34869 ?auto_34867 ) ) ( not ( = ?auto_34866 ?auto_34867 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34865 ?auto_34868 ?auto_34866 ?auto_34869 ?auto_34867 ?auto_34864 )
      ( DELIVER-5PKG-VERIFY ?auto_34865 ?auto_34866 ?auto_34867 ?auto_34868 ?auto_34869 ?auto_34864 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34912 - OBJ
      ?auto_34913 - OBJ
      ?auto_34914 - OBJ
      ?auto_34915 - OBJ
      ?auto_34916 - OBJ
      ?auto_34911 - LOCATION
    )
    :vars
    (
      ?auto_34920 - LOCATION
      ?auto_34921 - CITY
      ?auto_34918 - LOCATION
      ?auto_34919 - LOCATION
      ?auto_34917 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34920 ?auto_34921 ) ( IN-CITY ?auto_34911 ?auto_34921 ) ( not ( = ?auto_34911 ?auto_34920 ) ) ( OBJ-AT ?auto_34914 ?auto_34920 ) ( OBJ-AT ?auto_34913 ?auto_34920 ) ( IN-CITY ?auto_34918 ?auto_34921 ) ( not ( = ?auto_34911 ?auto_34918 ) ) ( OBJ-AT ?auto_34915 ?auto_34918 ) ( IN-CITY ?auto_34919 ?auto_34921 ) ( not ( = ?auto_34911 ?auto_34919 ) ) ( OBJ-AT ?auto_34916 ?auto_34919 ) ( OBJ-AT ?auto_34912 ?auto_34919 ) ( TRUCK-AT ?auto_34917 ?auto_34911 ) ( not ( = ?auto_34912 ?auto_34916 ) ) ( not ( = ?auto_34912 ?auto_34915 ) ) ( not ( = ?auto_34916 ?auto_34915 ) ) ( not ( = ?auto_34918 ?auto_34919 ) ) ( not ( = ?auto_34912 ?auto_34913 ) ) ( not ( = ?auto_34916 ?auto_34913 ) ) ( not ( = ?auto_34915 ?auto_34913 ) ) ( not ( = ?auto_34920 ?auto_34918 ) ) ( not ( = ?auto_34920 ?auto_34919 ) ) ( not ( = ?auto_34912 ?auto_34914 ) ) ( not ( = ?auto_34916 ?auto_34914 ) ) ( not ( = ?auto_34915 ?auto_34914 ) ) ( not ( = ?auto_34913 ?auto_34914 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34912 ?auto_34916 ?auto_34913 ?auto_34915 ?auto_34914 ?auto_34911 )
      ( DELIVER-5PKG-VERIFY ?auto_34912 ?auto_34913 ?auto_34914 ?auto_34915 ?auto_34916 ?auto_34911 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41235 - OBJ
      ?auto_41236 - OBJ
      ?auto_41237 - OBJ
      ?auto_41238 - OBJ
      ?auto_41239 - OBJ
      ?auto_41234 - LOCATION
    )
    :vars
    (
      ?auto_41243 - LOCATION
      ?auto_41244 - CITY
      ?auto_41241 - LOCATION
      ?auto_41242 - LOCATION
      ?auto_41240 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41243 ?auto_41244 ) ( IN-CITY ?auto_41234 ?auto_41244 ) ( not ( = ?auto_41234 ?auto_41243 ) ) ( OBJ-AT ?auto_41239 ?auto_41243 ) ( OBJ-AT ?auto_41238 ?auto_41243 ) ( IN-CITY ?auto_41241 ?auto_41244 ) ( not ( = ?auto_41234 ?auto_41241 ) ) ( OBJ-AT ?auto_41235 ?auto_41241 ) ( IN-CITY ?auto_41242 ?auto_41244 ) ( not ( = ?auto_41234 ?auto_41242 ) ) ( OBJ-AT ?auto_41237 ?auto_41242 ) ( OBJ-AT ?auto_41236 ?auto_41242 ) ( TRUCK-AT ?auto_41240 ?auto_41234 ) ( not ( = ?auto_41236 ?auto_41237 ) ) ( not ( = ?auto_41236 ?auto_41235 ) ) ( not ( = ?auto_41237 ?auto_41235 ) ) ( not ( = ?auto_41241 ?auto_41242 ) ) ( not ( = ?auto_41236 ?auto_41238 ) ) ( not ( = ?auto_41237 ?auto_41238 ) ) ( not ( = ?auto_41235 ?auto_41238 ) ) ( not ( = ?auto_41243 ?auto_41241 ) ) ( not ( = ?auto_41243 ?auto_41242 ) ) ( not ( = ?auto_41236 ?auto_41239 ) ) ( not ( = ?auto_41237 ?auto_41239 ) ) ( not ( = ?auto_41235 ?auto_41239 ) ) ( not ( = ?auto_41238 ?auto_41239 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41236 ?auto_41237 ?auto_41238 ?auto_41235 ?auto_41239 ?auto_41234 )
      ( DELIVER-5PKG-VERIFY ?auto_41235 ?auto_41236 ?auto_41237 ?auto_41238 ?auto_41239 ?auto_41234 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41425 - OBJ
      ?auto_41426 - OBJ
      ?auto_41427 - OBJ
      ?auto_41428 - OBJ
      ?auto_41429 - OBJ
      ?auto_41424 - LOCATION
    )
    :vars
    (
      ?auto_41433 - LOCATION
      ?auto_41434 - CITY
      ?auto_41431 - LOCATION
      ?auto_41432 - LOCATION
      ?auto_41430 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41433 ?auto_41434 ) ( IN-CITY ?auto_41424 ?auto_41434 ) ( not ( = ?auto_41424 ?auto_41433 ) ) ( OBJ-AT ?auto_41429 ?auto_41433 ) ( OBJ-AT ?auto_41427 ?auto_41433 ) ( IN-CITY ?auto_41431 ?auto_41434 ) ( not ( = ?auto_41424 ?auto_41431 ) ) ( OBJ-AT ?auto_41425 ?auto_41431 ) ( IN-CITY ?auto_41432 ?auto_41434 ) ( not ( = ?auto_41424 ?auto_41432 ) ) ( OBJ-AT ?auto_41428 ?auto_41432 ) ( OBJ-AT ?auto_41426 ?auto_41432 ) ( TRUCK-AT ?auto_41430 ?auto_41424 ) ( not ( = ?auto_41426 ?auto_41428 ) ) ( not ( = ?auto_41426 ?auto_41425 ) ) ( not ( = ?auto_41428 ?auto_41425 ) ) ( not ( = ?auto_41431 ?auto_41432 ) ) ( not ( = ?auto_41426 ?auto_41427 ) ) ( not ( = ?auto_41428 ?auto_41427 ) ) ( not ( = ?auto_41425 ?auto_41427 ) ) ( not ( = ?auto_41433 ?auto_41431 ) ) ( not ( = ?auto_41433 ?auto_41432 ) ) ( not ( = ?auto_41426 ?auto_41429 ) ) ( not ( = ?auto_41428 ?auto_41429 ) ) ( not ( = ?auto_41425 ?auto_41429 ) ) ( not ( = ?auto_41427 ?auto_41429 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41426 ?auto_41428 ?auto_41427 ?auto_41425 ?auto_41429 ?auto_41424 )
      ( DELIVER-5PKG-VERIFY ?auto_41425 ?auto_41426 ?auto_41427 ?auto_41428 ?auto_41429 ?auto_41424 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41472 - OBJ
      ?auto_41473 - OBJ
      ?auto_41474 - OBJ
      ?auto_41475 - OBJ
      ?auto_41476 - OBJ
      ?auto_41471 - LOCATION
    )
    :vars
    (
      ?auto_41480 - LOCATION
      ?auto_41481 - CITY
      ?auto_41478 - LOCATION
      ?auto_41479 - LOCATION
      ?auto_41477 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41480 ?auto_41481 ) ( IN-CITY ?auto_41471 ?auto_41481 ) ( not ( = ?auto_41471 ?auto_41480 ) ) ( OBJ-AT ?auto_41475 ?auto_41480 ) ( OBJ-AT ?auto_41474 ?auto_41480 ) ( IN-CITY ?auto_41478 ?auto_41481 ) ( not ( = ?auto_41471 ?auto_41478 ) ) ( OBJ-AT ?auto_41472 ?auto_41478 ) ( IN-CITY ?auto_41479 ?auto_41481 ) ( not ( = ?auto_41471 ?auto_41479 ) ) ( OBJ-AT ?auto_41476 ?auto_41479 ) ( OBJ-AT ?auto_41473 ?auto_41479 ) ( TRUCK-AT ?auto_41477 ?auto_41471 ) ( not ( = ?auto_41473 ?auto_41476 ) ) ( not ( = ?auto_41473 ?auto_41472 ) ) ( not ( = ?auto_41476 ?auto_41472 ) ) ( not ( = ?auto_41478 ?auto_41479 ) ) ( not ( = ?auto_41473 ?auto_41474 ) ) ( not ( = ?auto_41476 ?auto_41474 ) ) ( not ( = ?auto_41472 ?auto_41474 ) ) ( not ( = ?auto_41480 ?auto_41478 ) ) ( not ( = ?auto_41480 ?auto_41479 ) ) ( not ( = ?auto_41473 ?auto_41475 ) ) ( not ( = ?auto_41476 ?auto_41475 ) ) ( not ( = ?auto_41472 ?auto_41475 ) ) ( not ( = ?auto_41474 ?auto_41475 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41473 ?auto_41476 ?auto_41474 ?auto_41472 ?auto_41475 ?auto_41471 )
      ( DELIVER-5PKG-VERIFY ?auto_41472 ?auto_41473 ?auto_41474 ?auto_41475 ?auto_41476 ?auto_41471 ) )
  )

)

