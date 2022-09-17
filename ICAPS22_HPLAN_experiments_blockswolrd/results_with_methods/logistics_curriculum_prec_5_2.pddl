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
      ?auto_103444 - OBJ
      ?auto_103443 - LOCATION
    )
    :vars
    (
      ?auto_103446 - LOCATION
      ?auto_103447 - CITY
      ?auto_103445 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103446 ?auto_103447 ) ( IN-CITY ?auto_103443 ?auto_103447 ) ( not ( = ?auto_103443 ?auto_103446 ) ) ( OBJ-AT ?auto_103444 ?auto_103446 ) ( TRUCK-AT ?auto_103445 ?auto_103443 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_103445 ?auto_103443 ?auto_103446 ?auto_103447 )
      ( !LOAD-TRUCK ?auto_103444 ?auto_103445 ?auto_103446 )
      ( !DRIVE-TRUCK ?auto_103445 ?auto_103446 ?auto_103443 ?auto_103447 )
      ( !UNLOAD-TRUCK ?auto_103444 ?auto_103445 ?auto_103443 )
      ( DELIVER-1PKG-VERIFY ?auto_103444 ?auto_103443 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_103451 - OBJ
      ?auto_103450 - LOCATION
    )
    :vars
    (
      ?auto_103453 - LOCATION
      ?auto_103454 - CITY
      ?auto_103452 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103453 ?auto_103454 ) ( IN-CITY ?auto_103450 ?auto_103454 ) ( not ( = ?auto_103450 ?auto_103453 ) ) ( OBJ-AT ?auto_103451 ?auto_103453 ) ( TRUCK-AT ?auto_103452 ?auto_103450 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_103452 ?auto_103450 ?auto_103453 ?auto_103454 )
      ( !LOAD-TRUCK ?auto_103451 ?auto_103452 ?auto_103453 )
      ( !DRIVE-TRUCK ?auto_103452 ?auto_103453 ?auto_103450 ?auto_103454 )
      ( !UNLOAD-TRUCK ?auto_103451 ?auto_103452 ?auto_103450 )
      ( DELIVER-1PKG-VERIFY ?auto_103451 ?auto_103450 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_103465 - OBJ
      ?auto_103466 - OBJ
      ?auto_103464 - LOCATION
    )
    :vars
    (
      ?auto_103467 - LOCATION
      ?auto_103469 - CITY
      ?auto_103470 - LOCATION
      ?auto_103468 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103467 ?auto_103469 ) ( IN-CITY ?auto_103464 ?auto_103469 ) ( not ( = ?auto_103464 ?auto_103467 ) ) ( OBJ-AT ?auto_103466 ?auto_103467 ) ( IN-CITY ?auto_103470 ?auto_103469 ) ( not ( = ?auto_103464 ?auto_103470 ) ) ( OBJ-AT ?auto_103465 ?auto_103470 ) ( TRUCK-AT ?auto_103468 ?auto_103464 ) ( not ( = ?auto_103465 ?auto_103466 ) ) ( not ( = ?auto_103467 ?auto_103470 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_103465 ?auto_103464 )
      ( DELIVER-1PKG ?auto_103466 ?auto_103464 )
      ( DELIVER-2PKG-VERIFY ?auto_103465 ?auto_103466 ?auto_103464 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_103472 - OBJ
      ?auto_103473 - OBJ
      ?auto_103471 - LOCATION
    )
    :vars
    (
      ?auto_103474 - LOCATION
      ?auto_103477 - CITY
      ?auto_103475 - LOCATION
      ?auto_103476 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103474 ?auto_103477 ) ( IN-CITY ?auto_103471 ?auto_103477 ) ( not ( = ?auto_103471 ?auto_103474 ) ) ( OBJ-AT ?auto_103472 ?auto_103474 ) ( IN-CITY ?auto_103475 ?auto_103477 ) ( not ( = ?auto_103471 ?auto_103475 ) ) ( OBJ-AT ?auto_103473 ?auto_103475 ) ( TRUCK-AT ?auto_103476 ?auto_103471 ) ( not ( = ?auto_103473 ?auto_103472 ) ) ( not ( = ?auto_103474 ?auto_103475 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103473 ?auto_103472 ?auto_103471 )
      ( DELIVER-2PKG-VERIFY ?auto_103472 ?auto_103473 ?auto_103471 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_103489 - OBJ
      ?auto_103488 - LOCATION
    )
    :vars
    (
      ?auto_103491 - LOCATION
      ?auto_103492 - CITY
      ?auto_103490 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103491 ?auto_103492 ) ( IN-CITY ?auto_103488 ?auto_103492 ) ( not ( = ?auto_103488 ?auto_103491 ) ) ( OBJ-AT ?auto_103489 ?auto_103491 ) ( TRUCK-AT ?auto_103490 ?auto_103488 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_103490 ?auto_103488 ?auto_103491 ?auto_103492 )
      ( !LOAD-TRUCK ?auto_103489 ?auto_103490 ?auto_103491 )
      ( !DRIVE-TRUCK ?auto_103490 ?auto_103491 ?auto_103488 ?auto_103492 )
      ( !UNLOAD-TRUCK ?auto_103489 ?auto_103490 ?auto_103488 )
      ( DELIVER-1PKG-VERIFY ?auto_103489 ?auto_103488 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_103580 - OBJ
      ?auto_103581 - OBJ
      ?auto_103582 - OBJ
      ?auto_103579 - LOCATION
    )
    :vars
    (
      ?auto_103583 - LOCATION
      ?auto_103585 - CITY
      ?auto_103587 - LOCATION
      ?auto_103586 - LOCATION
      ?auto_103584 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103583 ?auto_103585 ) ( IN-CITY ?auto_103579 ?auto_103585 ) ( not ( = ?auto_103579 ?auto_103583 ) ) ( OBJ-AT ?auto_103582 ?auto_103583 ) ( IN-CITY ?auto_103587 ?auto_103585 ) ( not ( = ?auto_103579 ?auto_103587 ) ) ( OBJ-AT ?auto_103581 ?auto_103587 ) ( IN-CITY ?auto_103586 ?auto_103585 ) ( not ( = ?auto_103579 ?auto_103586 ) ) ( OBJ-AT ?auto_103580 ?auto_103586 ) ( TRUCK-AT ?auto_103584 ?auto_103579 ) ( not ( = ?auto_103580 ?auto_103581 ) ) ( not ( = ?auto_103587 ?auto_103586 ) ) ( not ( = ?auto_103580 ?auto_103582 ) ) ( not ( = ?auto_103581 ?auto_103582 ) ) ( not ( = ?auto_103583 ?auto_103587 ) ) ( not ( = ?auto_103583 ?auto_103586 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_103581 ?auto_103580 ?auto_103579 )
      ( DELIVER-1PKG ?auto_103582 ?auto_103579 )
      ( DELIVER-3PKG-VERIFY ?auto_103580 ?auto_103581 ?auto_103582 ?auto_103579 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_103599 - OBJ
      ?auto_103600 - OBJ
      ?auto_103601 - OBJ
      ?auto_103598 - LOCATION
    )
    :vars
    (
      ?auto_103606 - LOCATION
      ?auto_103602 - CITY
      ?auto_103604 - LOCATION
      ?auto_103605 - LOCATION
      ?auto_103603 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103606 ?auto_103602 ) ( IN-CITY ?auto_103598 ?auto_103602 ) ( not ( = ?auto_103598 ?auto_103606 ) ) ( OBJ-AT ?auto_103600 ?auto_103606 ) ( IN-CITY ?auto_103604 ?auto_103602 ) ( not ( = ?auto_103598 ?auto_103604 ) ) ( OBJ-AT ?auto_103601 ?auto_103604 ) ( IN-CITY ?auto_103605 ?auto_103602 ) ( not ( = ?auto_103598 ?auto_103605 ) ) ( OBJ-AT ?auto_103599 ?auto_103605 ) ( TRUCK-AT ?auto_103603 ?auto_103598 ) ( not ( = ?auto_103599 ?auto_103601 ) ) ( not ( = ?auto_103604 ?auto_103605 ) ) ( not ( = ?auto_103599 ?auto_103600 ) ) ( not ( = ?auto_103601 ?auto_103600 ) ) ( not ( = ?auto_103606 ?auto_103604 ) ) ( not ( = ?auto_103606 ?auto_103605 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_103599 ?auto_103601 ?auto_103600 ?auto_103598 )
      ( DELIVER-3PKG-VERIFY ?auto_103599 ?auto_103600 ?auto_103601 ?auto_103598 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_103618 - OBJ
      ?auto_103619 - OBJ
      ?auto_103620 - OBJ
      ?auto_103617 - LOCATION
    )
    :vars
    (
      ?auto_103624 - LOCATION
      ?auto_103625 - CITY
      ?auto_103621 - LOCATION
      ?auto_103623 - LOCATION
      ?auto_103622 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103624 ?auto_103625 ) ( IN-CITY ?auto_103617 ?auto_103625 ) ( not ( = ?auto_103617 ?auto_103624 ) ) ( OBJ-AT ?auto_103620 ?auto_103624 ) ( IN-CITY ?auto_103621 ?auto_103625 ) ( not ( = ?auto_103617 ?auto_103621 ) ) ( OBJ-AT ?auto_103618 ?auto_103621 ) ( IN-CITY ?auto_103623 ?auto_103625 ) ( not ( = ?auto_103617 ?auto_103623 ) ) ( OBJ-AT ?auto_103619 ?auto_103623 ) ( TRUCK-AT ?auto_103622 ?auto_103617 ) ( not ( = ?auto_103619 ?auto_103618 ) ) ( not ( = ?auto_103621 ?auto_103623 ) ) ( not ( = ?auto_103619 ?auto_103620 ) ) ( not ( = ?auto_103618 ?auto_103620 ) ) ( not ( = ?auto_103624 ?auto_103621 ) ) ( not ( = ?auto_103624 ?auto_103623 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_103619 ?auto_103620 ?auto_103618 ?auto_103617 )
      ( DELIVER-3PKG-VERIFY ?auto_103618 ?auto_103619 ?auto_103620 ?auto_103617 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_103637 - OBJ
      ?auto_103638 - OBJ
      ?auto_103639 - OBJ
      ?auto_103636 - LOCATION
    )
    :vars
    (
      ?auto_103643 - LOCATION
      ?auto_103644 - CITY
      ?auto_103640 - LOCATION
      ?auto_103642 - LOCATION
      ?auto_103641 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103643 ?auto_103644 ) ( IN-CITY ?auto_103636 ?auto_103644 ) ( not ( = ?auto_103636 ?auto_103643 ) ) ( OBJ-AT ?auto_103638 ?auto_103643 ) ( IN-CITY ?auto_103640 ?auto_103644 ) ( not ( = ?auto_103636 ?auto_103640 ) ) ( OBJ-AT ?auto_103637 ?auto_103640 ) ( IN-CITY ?auto_103642 ?auto_103644 ) ( not ( = ?auto_103636 ?auto_103642 ) ) ( OBJ-AT ?auto_103639 ?auto_103642 ) ( TRUCK-AT ?auto_103641 ?auto_103636 ) ( not ( = ?auto_103639 ?auto_103637 ) ) ( not ( = ?auto_103640 ?auto_103642 ) ) ( not ( = ?auto_103639 ?auto_103638 ) ) ( not ( = ?auto_103637 ?auto_103638 ) ) ( not ( = ?auto_103643 ?auto_103640 ) ) ( not ( = ?auto_103643 ?auto_103642 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_103639 ?auto_103638 ?auto_103637 ?auto_103636 )
      ( DELIVER-3PKG-VERIFY ?auto_103637 ?auto_103638 ?auto_103639 ?auto_103636 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_103676 - OBJ
      ?auto_103677 - OBJ
      ?auto_103678 - OBJ
      ?auto_103675 - LOCATION
    )
    :vars
    (
      ?auto_103682 - LOCATION
      ?auto_103683 - CITY
      ?auto_103679 - LOCATION
      ?auto_103681 - LOCATION
      ?auto_103680 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103682 ?auto_103683 ) ( IN-CITY ?auto_103675 ?auto_103683 ) ( not ( = ?auto_103675 ?auto_103682 ) ) ( OBJ-AT ?auto_103676 ?auto_103682 ) ( IN-CITY ?auto_103679 ?auto_103683 ) ( not ( = ?auto_103675 ?auto_103679 ) ) ( OBJ-AT ?auto_103678 ?auto_103679 ) ( IN-CITY ?auto_103681 ?auto_103683 ) ( not ( = ?auto_103675 ?auto_103681 ) ) ( OBJ-AT ?auto_103677 ?auto_103681 ) ( TRUCK-AT ?auto_103680 ?auto_103675 ) ( not ( = ?auto_103677 ?auto_103678 ) ) ( not ( = ?auto_103679 ?auto_103681 ) ) ( not ( = ?auto_103677 ?auto_103676 ) ) ( not ( = ?auto_103678 ?auto_103676 ) ) ( not ( = ?auto_103682 ?auto_103679 ) ) ( not ( = ?auto_103682 ?auto_103681 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_103677 ?auto_103676 ?auto_103678 ?auto_103675 )
      ( DELIVER-3PKG-VERIFY ?auto_103676 ?auto_103677 ?auto_103678 ?auto_103675 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_103695 - OBJ
      ?auto_103696 - OBJ
      ?auto_103697 - OBJ
      ?auto_103694 - LOCATION
    )
    :vars
    (
      ?auto_103701 - LOCATION
      ?auto_103702 - CITY
      ?auto_103698 - LOCATION
      ?auto_103700 - LOCATION
      ?auto_103699 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103701 ?auto_103702 ) ( IN-CITY ?auto_103694 ?auto_103702 ) ( not ( = ?auto_103694 ?auto_103701 ) ) ( OBJ-AT ?auto_103695 ?auto_103701 ) ( IN-CITY ?auto_103698 ?auto_103702 ) ( not ( = ?auto_103694 ?auto_103698 ) ) ( OBJ-AT ?auto_103696 ?auto_103698 ) ( IN-CITY ?auto_103700 ?auto_103702 ) ( not ( = ?auto_103694 ?auto_103700 ) ) ( OBJ-AT ?auto_103697 ?auto_103700 ) ( TRUCK-AT ?auto_103699 ?auto_103694 ) ( not ( = ?auto_103697 ?auto_103696 ) ) ( not ( = ?auto_103698 ?auto_103700 ) ) ( not ( = ?auto_103697 ?auto_103695 ) ) ( not ( = ?auto_103696 ?auto_103695 ) ) ( not ( = ?auto_103701 ?auto_103698 ) ) ( not ( = ?auto_103701 ?auto_103700 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_103697 ?auto_103695 ?auto_103696 ?auto_103694 )
      ( DELIVER-3PKG-VERIFY ?auto_103695 ?auto_103696 ?auto_103697 ?auto_103694 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_103757 - OBJ
      ?auto_103756 - LOCATION
    )
    :vars
    (
      ?auto_103759 - LOCATION
      ?auto_103760 - CITY
      ?auto_103758 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103759 ?auto_103760 ) ( IN-CITY ?auto_103756 ?auto_103760 ) ( not ( = ?auto_103756 ?auto_103759 ) ) ( OBJ-AT ?auto_103757 ?auto_103759 ) ( TRUCK-AT ?auto_103758 ?auto_103756 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_103758 ?auto_103756 ?auto_103759 ?auto_103760 )
      ( !LOAD-TRUCK ?auto_103757 ?auto_103758 ?auto_103759 )
      ( !DRIVE-TRUCK ?auto_103758 ?auto_103759 ?auto_103756 ?auto_103760 )
      ( !UNLOAD-TRUCK ?auto_103757 ?auto_103758 ?auto_103756 )
      ( DELIVER-1PKG-VERIFY ?auto_103757 ?auto_103756 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_104739 - OBJ
      ?auto_104740 - OBJ
      ?auto_104741 - OBJ
      ?auto_104742 - OBJ
      ?auto_104738 - LOCATION
    )
    :vars
    (
      ?auto_104743 - LOCATION
      ?auto_104744 - CITY
      ?auto_104746 - LOCATION
      ?auto_104747 - LOCATION
      ?auto_104745 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104743 ?auto_104744 ) ( IN-CITY ?auto_104738 ?auto_104744 ) ( not ( = ?auto_104738 ?auto_104743 ) ) ( OBJ-AT ?auto_104742 ?auto_104743 ) ( OBJ-AT ?auto_104741 ?auto_104743 ) ( IN-CITY ?auto_104746 ?auto_104744 ) ( not ( = ?auto_104738 ?auto_104746 ) ) ( OBJ-AT ?auto_104740 ?auto_104746 ) ( IN-CITY ?auto_104747 ?auto_104744 ) ( not ( = ?auto_104738 ?auto_104747 ) ) ( OBJ-AT ?auto_104739 ?auto_104747 ) ( TRUCK-AT ?auto_104745 ?auto_104738 ) ( not ( = ?auto_104739 ?auto_104740 ) ) ( not ( = ?auto_104746 ?auto_104747 ) ) ( not ( = ?auto_104739 ?auto_104741 ) ) ( not ( = ?auto_104740 ?auto_104741 ) ) ( not ( = ?auto_104743 ?auto_104746 ) ) ( not ( = ?auto_104743 ?auto_104747 ) ) ( not ( = ?auto_104739 ?auto_104742 ) ) ( not ( = ?auto_104740 ?auto_104742 ) ) ( not ( = ?auto_104741 ?auto_104742 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_104739 ?auto_104741 ?auto_104740 ?auto_104738 )
      ( DELIVER-1PKG ?auto_104742 ?auto_104738 )
      ( DELIVER-4PKG-VERIFY ?auto_104739 ?auto_104740 ?auto_104741 ?auto_104742 ?auto_104738 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_104771 - OBJ
      ?auto_104772 - OBJ
      ?auto_104773 - OBJ
      ?auto_104774 - OBJ
      ?auto_104770 - LOCATION
    )
    :vars
    (
      ?auto_104777 - LOCATION
      ?auto_104775 - CITY
      ?auto_104779 - LOCATION
      ?auto_104776 - LOCATION
      ?auto_104778 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104777 ?auto_104775 ) ( IN-CITY ?auto_104770 ?auto_104775 ) ( not ( = ?auto_104770 ?auto_104777 ) ) ( OBJ-AT ?auto_104773 ?auto_104777 ) ( OBJ-AT ?auto_104774 ?auto_104777 ) ( IN-CITY ?auto_104779 ?auto_104775 ) ( not ( = ?auto_104770 ?auto_104779 ) ) ( OBJ-AT ?auto_104772 ?auto_104779 ) ( IN-CITY ?auto_104776 ?auto_104775 ) ( not ( = ?auto_104770 ?auto_104776 ) ) ( OBJ-AT ?auto_104771 ?auto_104776 ) ( TRUCK-AT ?auto_104778 ?auto_104770 ) ( not ( = ?auto_104771 ?auto_104772 ) ) ( not ( = ?auto_104779 ?auto_104776 ) ) ( not ( = ?auto_104771 ?auto_104774 ) ) ( not ( = ?auto_104772 ?auto_104774 ) ) ( not ( = ?auto_104777 ?auto_104779 ) ) ( not ( = ?auto_104777 ?auto_104776 ) ) ( not ( = ?auto_104771 ?auto_104773 ) ) ( not ( = ?auto_104772 ?auto_104773 ) ) ( not ( = ?auto_104774 ?auto_104773 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_104771 ?auto_104772 ?auto_104774 ?auto_104773 ?auto_104770 )
      ( DELIVER-4PKG-VERIFY ?auto_104771 ?auto_104772 ?auto_104773 ?auto_104774 ?auto_104770 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_104803 - OBJ
      ?auto_104804 - OBJ
      ?auto_104805 - OBJ
      ?auto_104806 - OBJ
      ?auto_104802 - LOCATION
    )
    :vars
    (
      ?auto_104809 - LOCATION
      ?auto_104811 - CITY
      ?auto_104810 - LOCATION
      ?auto_104808 - LOCATION
      ?auto_104807 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104809 ?auto_104811 ) ( IN-CITY ?auto_104802 ?auto_104811 ) ( not ( = ?auto_104802 ?auto_104809 ) ) ( OBJ-AT ?auto_104806 ?auto_104809 ) ( OBJ-AT ?auto_104804 ?auto_104809 ) ( IN-CITY ?auto_104810 ?auto_104811 ) ( not ( = ?auto_104802 ?auto_104810 ) ) ( OBJ-AT ?auto_104805 ?auto_104810 ) ( IN-CITY ?auto_104808 ?auto_104811 ) ( not ( = ?auto_104802 ?auto_104808 ) ) ( OBJ-AT ?auto_104803 ?auto_104808 ) ( TRUCK-AT ?auto_104807 ?auto_104802 ) ( not ( = ?auto_104803 ?auto_104805 ) ) ( not ( = ?auto_104810 ?auto_104808 ) ) ( not ( = ?auto_104803 ?auto_104804 ) ) ( not ( = ?auto_104805 ?auto_104804 ) ) ( not ( = ?auto_104809 ?auto_104810 ) ) ( not ( = ?auto_104809 ?auto_104808 ) ) ( not ( = ?auto_104803 ?auto_104806 ) ) ( not ( = ?auto_104805 ?auto_104806 ) ) ( not ( = ?auto_104804 ?auto_104806 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_104803 ?auto_104805 ?auto_104806 ?auto_104804 ?auto_104802 )
      ( DELIVER-4PKG-VERIFY ?auto_104803 ?auto_104804 ?auto_104805 ?auto_104806 ?auto_104802 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_104835 - OBJ
      ?auto_104836 - OBJ
      ?auto_104837 - OBJ
      ?auto_104838 - OBJ
      ?auto_104834 - LOCATION
    )
    :vars
    (
      ?auto_104841 - LOCATION
      ?auto_104843 - CITY
      ?auto_104842 - LOCATION
      ?auto_104840 - LOCATION
      ?auto_104839 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104841 ?auto_104843 ) ( IN-CITY ?auto_104834 ?auto_104843 ) ( not ( = ?auto_104834 ?auto_104841 ) ) ( OBJ-AT ?auto_104837 ?auto_104841 ) ( OBJ-AT ?auto_104836 ?auto_104841 ) ( IN-CITY ?auto_104842 ?auto_104843 ) ( not ( = ?auto_104834 ?auto_104842 ) ) ( OBJ-AT ?auto_104838 ?auto_104842 ) ( IN-CITY ?auto_104840 ?auto_104843 ) ( not ( = ?auto_104834 ?auto_104840 ) ) ( OBJ-AT ?auto_104835 ?auto_104840 ) ( TRUCK-AT ?auto_104839 ?auto_104834 ) ( not ( = ?auto_104835 ?auto_104838 ) ) ( not ( = ?auto_104842 ?auto_104840 ) ) ( not ( = ?auto_104835 ?auto_104836 ) ) ( not ( = ?auto_104838 ?auto_104836 ) ) ( not ( = ?auto_104841 ?auto_104842 ) ) ( not ( = ?auto_104841 ?auto_104840 ) ) ( not ( = ?auto_104835 ?auto_104837 ) ) ( not ( = ?auto_104838 ?auto_104837 ) ) ( not ( = ?auto_104836 ?auto_104837 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_104835 ?auto_104838 ?auto_104837 ?auto_104836 ?auto_104834 )
      ( DELIVER-4PKG-VERIFY ?auto_104835 ?auto_104836 ?auto_104837 ?auto_104838 ?auto_104834 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_104935 - OBJ
      ?auto_104936 - OBJ
      ?auto_104937 - OBJ
      ?auto_104938 - OBJ
      ?auto_104934 - LOCATION
    )
    :vars
    (
      ?auto_104941 - LOCATION
      ?auto_104943 - CITY
      ?auto_104942 - LOCATION
      ?auto_104940 - LOCATION
      ?auto_104939 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104941 ?auto_104943 ) ( IN-CITY ?auto_104934 ?auto_104943 ) ( not ( = ?auto_104934 ?auto_104941 ) ) ( OBJ-AT ?auto_104936 ?auto_104941 ) ( OBJ-AT ?auto_104938 ?auto_104941 ) ( IN-CITY ?auto_104942 ?auto_104943 ) ( not ( = ?auto_104934 ?auto_104942 ) ) ( OBJ-AT ?auto_104937 ?auto_104942 ) ( IN-CITY ?auto_104940 ?auto_104943 ) ( not ( = ?auto_104934 ?auto_104940 ) ) ( OBJ-AT ?auto_104935 ?auto_104940 ) ( TRUCK-AT ?auto_104939 ?auto_104934 ) ( not ( = ?auto_104935 ?auto_104937 ) ) ( not ( = ?auto_104942 ?auto_104940 ) ) ( not ( = ?auto_104935 ?auto_104938 ) ) ( not ( = ?auto_104937 ?auto_104938 ) ) ( not ( = ?auto_104941 ?auto_104942 ) ) ( not ( = ?auto_104941 ?auto_104940 ) ) ( not ( = ?auto_104935 ?auto_104936 ) ) ( not ( = ?auto_104937 ?auto_104936 ) ) ( not ( = ?auto_104938 ?auto_104936 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_104935 ?auto_104937 ?auto_104936 ?auto_104938 ?auto_104934 )
      ( DELIVER-4PKG-VERIFY ?auto_104935 ?auto_104936 ?auto_104937 ?auto_104938 ?auto_104934 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_104967 - OBJ
      ?auto_104968 - OBJ
      ?auto_104969 - OBJ
      ?auto_104970 - OBJ
      ?auto_104966 - LOCATION
    )
    :vars
    (
      ?auto_104973 - LOCATION
      ?auto_104975 - CITY
      ?auto_104974 - LOCATION
      ?auto_104972 - LOCATION
      ?auto_104971 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104973 ?auto_104975 ) ( IN-CITY ?auto_104966 ?auto_104975 ) ( not ( = ?auto_104966 ?auto_104973 ) ) ( OBJ-AT ?auto_104968 ?auto_104973 ) ( OBJ-AT ?auto_104969 ?auto_104973 ) ( IN-CITY ?auto_104974 ?auto_104975 ) ( not ( = ?auto_104966 ?auto_104974 ) ) ( OBJ-AT ?auto_104970 ?auto_104974 ) ( IN-CITY ?auto_104972 ?auto_104975 ) ( not ( = ?auto_104966 ?auto_104972 ) ) ( OBJ-AT ?auto_104967 ?auto_104972 ) ( TRUCK-AT ?auto_104971 ?auto_104966 ) ( not ( = ?auto_104967 ?auto_104970 ) ) ( not ( = ?auto_104974 ?auto_104972 ) ) ( not ( = ?auto_104967 ?auto_104969 ) ) ( not ( = ?auto_104970 ?auto_104969 ) ) ( not ( = ?auto_104973 ?auto_104974 ) ) ( not ( = ?auto_104973 ?auto_104972 ) ) ( not ( = ?auto_104967 ?auto_104968 ) ) ( not ( = ?auto_104970 ?auto_104968 ) ) ( not ( = ?auto_104969 ?auto_104968 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_104967 ?auto_104970 ?auto_104968 ?auto_104969 ?auto_104966 )
      ( DELIVER-4PKG-VERIFY ?auto_104967 ?auto_104968 ?auto_104969 ?auto_104970 ?auto_104966 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105067 - OBJ
      ?auto_105068 - OBJ
      ?auto_105069 - OBJ
      ?auto_105070 - OBJ
      ?auto_105066 - LOCATION
    )
    :vars
    (
      ?auto_105073 - LOCATION
      ?auto_105075 - CITY
      ?auto_105074 - LOCATION
      ?auto_105072 - LOCATION
      ?auto_105071 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105073 ?auto_105075 ) ( IN-CITY ?auto_105066 ?auto_105075 ) ( not ( = ?auto_105066 ?auto_105073 ) ) ( OBJ-AT ?auto_105070 ?auto_105073 ) ( OBJ-AT ?auto_105069 ?auto_105073 ) ( IN-CITY ?auto_105074 ?auto_105075 ) ( not ( = ?auto_105066 ?auto_105074 ) ) ( OBJ-AT ?auto_105067 ?auto_105074 ) ( IN-CITY ?auto_105072 ?auto_105075 ) ( not ( = ?auto_105066 ?auto_105072 ) ) ( OBJ-AT ?auto_105068 ?auto_105072 ) ( TRUCK-AT ?auto_105071 ?auto_105066 ) ( not ( = ?auto_105068 ?auto_105067 ) ) ( not ( = ?auto_105074 ?auto_105072 ) ) ( not ( = ?auto_105068 ?auto_105069 ) ) ( not ( = ?auto_105067 ?auto_105069 ) ) ( not ( = ?auto_105073 ?auto_105074 ) ) ( not ( = ?auto_105073 ?auto_105072 ) ) ( not ( = ?auto_105068 ?auto_105070 ) ) ( not ( = ?auto_105067 ?auto_105070 ) ) ( not ( = ?auto_105069 ?auto_105070 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105068 ?auto_105067 ?auto_105070 ?auto_105069 ?auto_105066 )
      ( DELIVER-4PKG-VERIFY ?auto_105067 ?auto_105068 ?auto_105069 ?auto_105070 ?auto_105066 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105099 - OBJ
      ?auto_105100 - OBJ
      ?auto_105101 - OBJ
      ?auto_105102 - OBJ
      ?auto_105098 - LOCATION
    )
    :vars
    (
      ?auto_105105 - LOCATION
      ?auto_105107 - CITY
      ?auto_105106 - LOCATION
      ?auto_105104 - LOCATION
      ?auto_105103 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105105 ?auto_105107 ) ( IN-CITY ?auto_105098 ?auto_105107 ) ( not ( = ?auto_105098 ?auto_105105 ) ) ( OBJ-AT ?auto_105101 ?auto_105105 ) ( OBJ-AT ?auto_105102 ?auto_105105 ) ( IN-CITY ?auto_105106 ?auto_105107 ) ( not ( = ?auto_105098 ?auto_105106 ) ) ( OBJ-AT ?auto_105099 ?auto_105106 ) ( IN-CITY ?auto_105104 ?auto_105107 ) ( not ( = ?auto_105098 ?auto_105104 ) ) ( OBJ-AT ?auto_105100 ?auto_105104 ) ( TRUCK-AT ?auto_105103 ?auto_105098 ) ( not ( = ?auto_105100 ?auto_105099 ) ) ( not ( = ?auto_105106 ?auto_105104 ) ) ( not ( = ?auto_105100 ?auto_105102 ) ) ( not ( = ?auto_105099 ?auto_105102 ) ) ( not ( = ?auto_105105 ?auto_105106 ) ) ( not ( = ?auto_105105 ?auto_105104 ) ) ( not ( = ?auto_105100 ?auto_105101 ) ) ( not ( = ?auto_105099 ?auto_105101 ) ) ( not ( = ?auto_105102 ?auto_105101 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105100 ?auto_105099 ?auto_105101 ?auto_105102 ?auto_105098 )
      ( DELIVER-4PKG-VERIFY ?auto_105099 ?auto_105100 ?auto_105101 ?auto_105102 ?auto_105098 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105200 - OBJ
      ?auto_105201 - OBJ
      ?auto_105202 - OBJ
      ?auto_105203 - OBJ
      ?auto_105199 - LOCATION
    )
    :vars
    (
      ?auto_105206 - LOCATION
      ?auto_105208 - CITY
      ?auto_105207 - LOCATION
      ?auto_105205 - LOCATION
      ?auto_105204 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105206 ?auto_105208 ) ( IN-CITY ?auto_105199 ?auto_105208 ) ( not ( = ?auto_105199 ?auto_105206 ) ) ( OBJ-AT ?auto_105203 ?auto_105206 ) ( OBJ-AT ?auto_105201 ?auto_105206 ) ( IN-CITY ?auto_105207 ?auto_105208 ) ( not ( = ?auto_105199 ?auto_105207 ) ) ( OBJ-AT ?auto_105200 ?auto_105207 ) ( IN-CITY ?auto_105205 ?auto_105208 ) ( not ( = ?auto_105199 ?auto_105205 ) ) ( OBJ-AT ?auto_105202 ?auto_105205 ) ( TRUCK-AT ?auto_105204 ?auto_105199 ) ( not ( = ?auto_105202 ?auto_105200 ) ) ( not ( = ?auto_105207 ?auto_105205 ) ) ( not ( = ?auto_105202 ?auto_105201 ) ) ( not ( = ?auto_105200 ?auto_105201 ) ) ( not ( = ?auto_105206 ?auto_105207 ) ) ( not ( = ?auto_105206 ?auto_105205 ) ) ( not ( = ?auto_105202 ?auto_105203 ) ) ( not ( = ?auto_105200 ?auto_105203 ) ) ( not ( = ?auto_105201 ?auto_105203 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105202 ?auto_105200 ?auto_105203 ?auto_105201 ?auto_105199 )
      ( DELIVER-4PKG-VERIFY ?auto_105200 ?auto_105201 ?auto_105202 ?auto_105203 ?auto_105199 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105232 - OBJ
      ?auto_105233 - OBJ
      ?auto_105234 - OBJ
      ?auto_105235 - OBJ
      ?auto_105231 - LOCATION
    )
    :vars
    (
      ?auto_105238 - LOCATION
      ?auto_105240 - CITY
      ?auto_105239 - LOCATION
      ?auto_105237 - LOCATION
      ?auto_105236 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105238 ?auto_105240 ) ( IN-CITY ?auto_105231 ?auto_105240 ) ( not ( = ?auto_105231 ?auto_105238 ) ) ( OBJ-AT ?auto_105234 ?auto_105238 ) ( OBJ-AT ?auto_105233 ?auto_105238 ) ( IN-CITY ?auto_105239 ?auto_105240 ) ( not ( = ?auto_105231 ?auto_105239 ) ) ( OBJ-AT ?auto_105232 ?auto_105239 ) ( IN-CITY ?auto_105237 ?auto_105240 ) ( not ( = ?auto_105231 ?auto_105237 ) ) ( OBJ-AT ?auto_105235 ?auto_105237 ) ( TRUCK-AT ?auto_105236 ?auto_105231 ) ( not ( = ?auto_105235 ?auto_105232 ) ) ( not ( = ?auto_105239 ?auto_105237 ) ) ( not ( = ?auto_105235 ?auto_105233 ) ) ( not ( = ?auto_105232 ?auto_105233 ) ) ( not ( = ?auto_105238 ?auto_105239 ) ) ( not ( = ?auto_105238 ?auto_105237 ) ) ( not ( = ?auto_105235 ?auto_105234 ) ) ( not ( = ?auto_105232 ?auto_105234 ) ) ( not ( = ?auto_105233 ?auto_105234 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105235 ?auto_105232 ?auto_105234 ?auto_105233 ?auto_105231 )
      ( DELIVER-4PKG-VERIFY ?auto_105232 ?auto_105233 ?auto_105234 ?auto_105235 ?auto_105231 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105297 - OBJ
      ?auto_105298 - OBJ
      ?auto_105299 - OBJ
      ?auto_105300 - OBJ
      ?auto_105296 - LOCATION
    )
    :vars
    (
      ?auto_105303 - LOCATION
      ?auto_105305 - CITY
      ?auto_105304 - LOCATION
      ?auto_105302 - LOCATION
      ?auto_105301 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105303 ?auto_105305 ) ( IN-CITY ?auto_105296 ?auto_105305 ) ( not ( = ?auto_105296 ?auto_105303 ) ) ( OBJ-AT ?auto_105298 ?auto_105303 ) ( OBJ-AT ?auto_105300 ?auto_105303 ) ( IN-CITY ?auto_105304 ?auto_105305 ) ( not ( = ?auto_105296 ?auto_105304 ) ) ( OBJ-AT ?auto_105297 ?auto_105304 ) ( IN-CITY ?auto_105302 ?auto_105305 ) ( not ( = ?auto_105296 ?auto_105302 ) ) ( OBJ-AT ?auto_105299 ?auto_105302 ) ( TRUCK-AT ?auto_105301 ?auto_105296 ) ( not ( = ?auto_105299 ?auto_105297 ) ) ( not ( = ?auto_105304 ?auto_105302 ) ) ( not ( = ?auto_105299 ?auto_105300 ) ) ( not ( = ?auto_105297 ?auto_105300 ) ) ( not ( = ?auto_105303 ?auto_105304 ) ) ( not ( = ?auto_105303 ?auto_105302 ) ) ( not ( = ?auto_105299 ?auto_105298 ) ) ( not ( = ?auto_105297 ?auto_105298 ) ) ( not ( = ?auto_105300 ?auto_105298 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105299 ?auto_105297 ?auto_105298 ?auto_105300 ?auto_105296 )
      ( DELIVER-4PKG-VERIFY ?auto_105297 ?auto_105298 ?auto_105299 ?auto_105300 ?auto_105296 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105364 - OBJ
      ?auto_105365 - OBJ
      ?auto_105366 - OBJ
      ?auto_105367 - OBJ
      ?auto_105363 - LOCATION
    )
    :vars
    (
      ?auto_105370 - LOCATION
      ?auto_105372 - CITY
      ?auto_105371 - LOCATION
      ?auto_105369 - LOCATION
      ?auto_105368 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105370 ?auto_105372 ) ( IN-CITY ?auto_105363 ?auto_105372 ) ( not ( = ?auto_105363 ?auto_105370 ) ) ( OBJ-AT ?auto_105365 ?auto_105370 ) ( OBJ-AT ?auto_105366 ?auto_105370 ) ( IN-CITY ?auto_105371 ?auto_105372 ) ( not ( = ?auto_105363 ?auto_105371 ) ) ( OBJ-AT ?auto_105364 ?auto_105371 ) ( IN-CITY ?auto_105369 ?auto_105372 ) ( not ( = ?auto_105363 ?auto_105369 ) ) ( OBJ-AT ?auto_105367 ?auto_105369 ) ( TRUCK-AT ?auto_105368 ?auto_105363 ) ( not ( = ?auto_105367 ?auto_105364 ) ) ( not ( = ?auto_105371 ?auto_105369 ) ) ( not ( = ?auto_105367 ?auto_105366 ) ) ( not ( = ?auto_105364 ?auto_105366 ) ) ( not ( = ?auto_105370 ?auto_105371 ) ) ( not ( = ?auto_105370 ?auto_105369 ) ) ( not ( = ?auto_105367 ?auto_105365 ) ) ( not ( = ?auto_105364 ?auto_105365 ) ) ( not ( = ?auto_105366 ?auto_105365 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105367 ?auto_105364 ?auto_105365 ?auto_105366 ?auto_105363 )
      ( DELIVER-4PKG-VERIFY ?auto_105364 ?auto_105365 ?auto_105366 ?auto_105367 ?auto_105363 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105464 - OBJ
      ?auto_105465 - OBJ
      ?auto_105466 - OBJ
      ?auto_105467 - OBJ
      ?auto_105463 - LOCATION
    )
    :vars
    (
      ?auto_105470 - LOCATION
      ?auto_105472 - CITY
      ?auto_105471 - LOCATION
      ?auto_105469 - LOCATION
      ?auto_105468 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105470 ?auto_105472 ) ( IN-CITY ?auto_105463 ?auto_105472 ) ( not ( = ?auto_105463 ?auto_105470 ) ) ( OBJ-AT ?auto_105467 ?auto_105470 ) ( OBJ-AT ?auto_105464 ?auto_105470 ) ( IN-CITY ?auto_105471 ?auto_105472 ) ( not ( = ?auto_105463 ?auto_105471 ) ) ( OBJ-AT ?auto_105466 ?auto_105471 ) ( IN-CITY ?auto_105469 ?auto_105472 ) ( not ( = ?auto_105463 ?auto_105469 ) ) ( OBJ-AT ?auto_105465 ?auto_105469 ) ( TRUCK-AT ?auto_105468 ?auto_105463 ) ( not ( = ?auto_105465 ?auto_105466 ) ) ( not ( = ?auto_105471 ?auto_105469 ) ) ( not ( = ?auto_105465 ?auto_105464 ) ) ( not ( = ?auto_105466 ?auto_105464 ) ) ( not ( = ?auto_105470 ?auto_105471 ) ) ( not ( = ?auto_105470 ?auto_105469 ) ) ( not ( = ?auto_105465 ?auto_105467 ) ) ( not ( = ?auto_105466 ?auto_105467 ) ) ( not ( = ?auto_105464 ?auto_105467 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105465 ?auto_105466 ?auto_105467 ?auto_105464 ?auto_105463 )
      ( DELIVER-4PKG-VERIFY ?auto_105464 ?auto_105465 ?auto_105466 ?auto_105467 ?auto_105463 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105496 - OBJ
      ?auto_105497 - OBJ
      ?auto_105498 - OBJ
      ?auto_105499 - OBJ
      ?auto_105495 - LOCATION
    )
    :vars
    (
      ?auto_105502 - LOCATION
      ?auto_105504 - CITY
      ?auto_105503 - LOCATION
      ?auto_105501 - LOCATION
      ?auto_105500 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105502 ?auto_105504 ) ( IN-CITY ?auto_105495 ?auto_105504 ) ( not ( = ?auto_105495 ?auto_105502 ) ) ( OBJ-AT ?auto_105498 ?auto_105502 ) ( OBJ-AT ?auto_105496 ?auto_105502 ) ( IN-CITY ?auto_105503 ?auto_105504 ) ( not ( = ?auto_105495 ?auto_105503 ) ) ( OBJ-AT ?auto_105499 ?auto_105503 ) ( IN-CITY ?auto_105501 ?auto_105504 ) ( not ( = ?auto_105495 ?auto_105501 ) ) ( OBJ-AT ?auto_105497 ?auto_105501 ) ( TRUCK-AT ?auto_105500 ?auto_105495 ) ( not ( = ?auto_105497 ?auto_105499 ) ) ( not ( = ?auto_105503 ?auto_105501 ) ) ( not ( = ?auto_105497 ?auto_105496 ) ) ( not ( = ?auto_105499 ?auto_105496 ) ) ( not ( = ?auto_105502 ?auto_105503 ) ) ( not ( = ?auto_105502 ?auto_105501 ) ) ( not ( = ?auto_105497 ?auto_105498 ) ) ( not ( = ?auto_105499 ?auto_105498 ) ) ( not ( = ?auto_105496 ?auto_105498 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105497 ?auto_105499 ?auto_105498 ?auto_105496 ?auto_105495 )
      ( DELIVER-4PKG-VERIFY ?auto_105496 ?auto_105497 ?auto_105498 ?auto_105499 ?auto_105495 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105528 - OBJ
      ?auto_105529 - OBJ
      ?auto_105530 - OBJ
      ?auto_105531 - OBJ
      ?auto_105527 - LOCATION
    )
    :vars
    (
      ?auto_105534 - LOCATION
      ?auto_105536 - CITY
      ?auto_105535 - LOCATION
      ?auto_105533 - LOCATION
      ?auto_105532 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105534 ?auto_105536 ) ( IN-CITY ?auto_105527 ?auto_105536 ) ( not ( = ?auto_105527 ?auto_105534 ) ) ( OBJ-AT ?auto_105531 ?auto_105534 ) ( OBJ-AT ?auto_105528 ?auto_105534 ) ( IN-CITY ?auto_105535 ?auto_105536 ) ( not ( = ?auto_105527 ?auto_105535 ) ) ( OBJ-AT ?auto_105529 ?auto_105535 ) ( IN-CITY ?auto_105533 ?auto_105536 ) ( not ( = ?auto_105527 ?auto_105533 ) ) ( OBJ-AT ?auto_105530 ?auto_105533 ) ( TRUCK-AT ?auto_105532 ?auto_105527 ) ( not ( = ?auto_105530 ?auto_105529 ) ) ( not ( = ?auto_105535 ?auto_105533 ) ) ( not ( = ?auto_105530 ?auto_105528 ) ) ( not ( = ?auto_105529 ?auto_105528 ) ) ( not ( = ?auto_105534 ?auto_105535 ) ) ( not ( = ?auto_105534 ?auto_105533 ) ) ( not ( = ?auto_105530 ?auto_105531 ) ) ( not ( = ?auto_105529 ?auto_105531 ) ) ( not ( = ?auto_105528 ?auto_105531 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105530 ?auto_105529 ?auto_105531 ?auto_105528 ?auto_105527 )
      ( DELIVER-4PKG-VERIFY ?auto_105528 ?auto_105529 ?auto_105530 ?auto_105531 ?auto_105527 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105560 - OBJ
      ?auto_105561 - OBJ
      ?auto_105562 - OBJ
      ?auto_105563 - OBJ
      ?auto_105559 - LOCATION
    )
    :vars
    (
      ?auto_105566 - LOCATION
      ?auto_105568 - CITY
      ?auto_105567 - LOCATION
      ?auto_105565 - LOCATION
      ?auto_105564 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105566 ?auto_105568 ) ( IN-CITY ?auto_105559 ?auto_105568 ) ( not ( = ?auto_105559 ?auto_105566 ) ) ( OBJ-AT ?auto_105562 ?auto_105566 ) ( OBJ-AT ?auto_105560 ?auto_105566 ) ( IN-CITY ?auto_105567 ?auto_105568 ) ( not ( = ?auto_105559 ?auto_105567 ) ) ( OBJ-AT ?auto_105561 ?auto_105567 ) ( IN-CITY ?auto_105565 ?auto_105568 ) ( not ( = ?auto_105559 ?auto_105565 ) ) ( OBJ-AT ?auto_105563 ?auto_105565 ) ( TRUCK-AT ?auto_105564 ?auto_105559 ) ( not ( = ?auto_105563 ?auto_105561 ) ) ( not ( = ?auto_105567 ?auto_105565 ) ) ( not ( = ?auto_105563 ?auto_105560 ) ) ( not ( = ?auto_105561 ?auto_105560 ) ) ( not ( = ?auto_105566 ?auto_105567 ) ) ( not ( = ?auto_105566 ?auto_105565 ) ) ( not ( = ?auto_105563 ?auto_105562 ) ) ( not ( = ?auto_105561 ?auto_105562 ) ) ( not ( = ?auto_105560 ?auto_105562 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105563 ?auto_105561 ?auto_105562 ?auto_105560 ?auto_105559 )
      ( DELIVER-4PKG-VERIFY ?auto_105560 ?auto_105561 ?auto_105562 ?auto_105563 ?auto_105559 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105694 - OBJ
      ?auto_105695 - OBJ
      ?auto_105696 - OBJ
      ?auto_105697 - OBJ
      ?auto_105693 - LOCATION
    )
    :vars
    (
      ?auto_105700 - LOCATION
      ?auto_105702 - CITY
      ?auto_105701 - LOCATION
      ?auto_105699 - LOCATION
      ?auto_105698 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105700 ?auto_105702 ) ( IN-CITY ?auto_105693 ?auto_105702 ) ( not ( = ?auto_105693 ?auto_105700 ) ) ( OBJ-AT ?auto_105695 ?auto_105700 ) ( OBJ-AT ?auto_105694 ?auto_105700 ) ( IN-CITY ?auto_105701 ?auto_105702 ) ( not ( = ?auto_105693 ?auto_105701 ) ) ( OBJ-AT ?auto_105697 ?auto_105701 ) ( IN-CITY ?auto_105699 ?auto_105702 ) ( not ( = ?auto_105693 ?auto_105699 ) ) ( OBJ-AT ?auto_105696 ?auto_105699 ) ( TRUCK-AT ?auto_105698 ?auto_105693 ) ( not ( = ?auto_105696 ?auto_105697 ) ) ( not ( = ?auto_105701 ?auto_105699 ) ) ( not ( = ?auto_105696 ?auto_105694 ) ) ( not ( = ?auto_105697 ?auto_105694 ) ) ( not ( = ?auto_105700 ?auto_105701 ) ) ( not ( = ?auto_105700 ?auto_105699 ) ) ( not ( = ?auto_105696 ?auto_105695 ) ) ( not ( = ?auto_105697 ?auto_105695 ) ) ( not ( = ?auto_105694 ?auto_105695 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105696 ?auto_105697 ?auto_105695 ?auto_105694 ?auto_105693 )
      ( DELIVER-4PKG-VERIFY ?auto_105694 ?auto_105695 ?auto_105696 ?auto_105697 ?auto_105693 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105726 - OBJ
      ?auto_105727 - OBJ
      ?auto_105728 - OBJ
      ?auto_105729 - OBJ
      ?auto_105725 - LOCATION
    )
    :vars
    (
      ?auto_105732 - LOCATION
      ?auto_105734 - CITY
      ?auto_105733 - LOCATION
      ?auto_105731 - LOCATION
      ?auto_105730 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105732 ?auto_105734 ) ( IN-CITY ?auto_105725 ?auto_105734 ) ( not ( = ?auto_105725 ?auto_105732 ) ) ( OBJ-AT ?auto_105727 ?auto_105732 ) ( OBJ-AT ?auto_105726 ?auto_105732 ) ( IN-CITY ?auto_105733 ?auto_105734 ) ( not ( = ?auto_105725 ?auto_105733 ) ) ( OBJ-AT ?auto_105728 ?auto_105733 ) ( IN-CITY ?auto_105731 ?auto_105734 ) ( not ( = ?auto_105725 ?auto_105731 ) ) ( OBJ-AT ?auto_105729 ?auto_105731 ) ( TRUCK-AT ?auto_105730 ?auto_105725 ) ( not ( = ?auto_105729 ?auto_105728 ) ) ( not ( = ?auto_105733 ?auto_105731 ) ) ( not ( = ?auto_105729 ?auto_105726 ) ) ( not ( = ?auto_105728 ?auto_105726 ) ) ( not ( = ?auto_105732 ?auto_105733 ) ) ( not ( = ?auto_105732 ?auto_105731 ) ) ( not ( = ?auto_105729 ?auto_105727 ) ) ( not ( = ?auto_105728 ?auto_105727 ) ) ( not ( = ?auto_105726 ?auto_105727 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105729 ?auto_105728 ?auto_105727 ?auto_105726 ?auto_105725 )
      ( DELIVER-4PKG-VERIFY ?auto_105726 ?auto_105727 ?auto_105728 ?auto_105729 ?auto_105725 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105929 - OBJ
      ?auto_105930 - OBJ
      ?auto_105931 - OBJ
      ?auto_105932 - OBJ
      ?auto_105928 - LOCATION
    )
    :vars
    (
      ?auto_105935 - LOCATION
      ?auto_105937 - CITY
      ?auto_105936 - LOCATION
      ?auto_105934 - LOCATION
      ?auto_105933 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105935 ?auto_105937 ) ( IN-CITY ?auto_105928 ?auto_105937 ) ( not ( = ?auto_105928 ?auto_105935 ) ) ( OBJ-AT ?auto_105929 ?auto_105935 ) ( OBJ-AT ?auto_105932 ?auto_105935 ) ( IN-CITY ?auto_105936 ?auto_105937 ) ( not ( = ?auto_105928 ?auto_105936 ) ) ( OBJ-AT ?auto_105931 ?auto_105936 ) ( IN-CITY ?auto_105934 ?auto_105937 ) ( not ( = ?auto_105928 ?auto_105934 ) ) ( OBJ-AT ?auto_105930 ?auto_105934 ) ( TRUCK-AT ?auto_105933 ?auto_105928 ) ( not ( = ?auto_105930 ?auto_105931 ) ) ( not ( = ?auto_105936 ?auto_105934 ) ) ( not ( = ?auto_105930 ?auto_105932 ) ) ( not ( = ?auto_105931 ?auto_105932 ) ) ( not ( = ?auto_105935 ?auto_105936 ) ) ( not ( = ?auto_105935 ?auto_105934 ) ) ( not ( = ?auto_105930 ?auto_105929 ) ) ( not ( = ?auto_105931 ?auto_105929 ) ) ( not ( = ?auto_105932 ?auto_105929 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105930 ?auto_105931 ?auto_105929 ?auto_105932 ?auto_105928 )
      ( DELIVER-4PKG-VERIFY ?auto_105929 ?auto_105930 ?auto_105931 ?auto_105932 ?auto_105928 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105961 - OBJ
      ?auto_105962 - OBJ
      ?auto_105963 - OBJ
      ?auto_105964 - OBJ
      ?auto_105960 - LOCATION
    )
    :vars
    (
      ?auto_105967 - LOCATION
      ?auto_105969 - CITY
      ?auto_105968 - LOCATION
      ?auto_105966 - LOCATION
      ?auto_105965 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105967 ?auto_105969 ) ( IN-CITY ?auto_105960 ?auto_105969 ) ( not ( = ?auto_105960 ?auto_105967 ) ) ( OBJ-AT ?auto_105961 ?auto_105967 ) ( OBJ-AT ?auto_105963 ?auto_105967 ) ( IN-CITY ?auto_105968 ?auto_105969 ) ( not ( = ?auto_105960 ?auto_105968 ) ) ( OBJ-AT ?auto_105964 ?auto_105968 ) ( IN-CITY ?auto_105966 ?auto_105969 ) ( not ( = ?auto_105960 ?auto_105966 ) ) ( OBJ-AT ?auto_105962 ?auto_105966 ) ( TRUCK-AT ?auto_105965 ?auto_105960 ) ( not ( = ?auto_105962 ?auto_105964 ) ) ( not ( = ?auto_105968 ?auto_105966 ) ) ( not ( = ?auto_105962 ?auto_105963 ) ) ( not ( = ?auto_105964 ?auto_105963 ) ) ( not ( = ?auto_105967 ?auto_105968 ) ) ( not ( = ?auto_105967 ?auto_105966 ) ) ( not ( = ?auto_105962 ?auto_105961 ) ) ( not ( = ?auto_105964 ?auto_105961 ) ) ( not ( = ?auto_105963 ?auto_105961 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105962 ?auto_105964 ?auto_105961 ?auto_105963 ?auto_105960 )
      ( DELIVER-4PKG-VERIFY ?auto_105961 ?auto_105962 ?auto_105963 ?auto_105964 ?auto_105960 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106061 - OBJ
      ?auto_106062 - OBJ
      ?auto_106063 - OBJ
      ?auto_106064 - OBJ
      ?auto_106060 - LOCATION
    )
    :vars
    (
      ?auto_106067 - LOCATION
      ?auto_106069 - CITY
      ?auto_106068 - LOCATION
      ?auto_106066 - LOCATION
      ?auto_106065 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106067 ?auto_106069 ) ( IN-CITY ?auto_106060 ?auto_106069 ) ( not ( = ?auto_106060 ?auto_106067 ) ) ( OBJ-AT ?auto_106061 ?auto_106067 ) ( OBJ-AT ?auto_106064 ?auto_106067 ) ( IN-CITY ?auto_106068 ?auto_106069 ) ( not ( = ?auto_106060 ?auto_106068 ) ) ( OBJ-AT ?auto_106062 ?auto_106068 ) ( IN-CITY ?auto_106066 ?auto_106069 ) ( not ( = ?auto_106060 ?auto_106066 ) ) ( OBJ-AT ?auto_106063 ?auto_106066 ) ( TRUCK-AT ?auto_106065 ?auto_106060 ) ( not ( = ?auto_106063 ?auto_106062 ) ) ( not ( = ?auto_106068 ?auto_106066 ) ) ( not ( = ?auto_106063 ?auto_106064 ) ) ( not ( = ?auto_106062 ?auto_106064 ) ) ( not ( = ?auto_106067 ?auto_106068 ) ) ( not ( = ?auto_106067 ?auto_106066 ) ) ( not ( = ?auto_106063 ?auto_106061 ) ) ( not ( = ?auto_106062 ?auto_106061 ) ) ( not ( = ?auto_106064 ?auto_106061 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106063 ?auto_106062 ?auto_106061 ?auto_106064 ?auto_106060 )
      ( DELIVER-4PKG-VERIFY ?auto_106061 ?auto_106062 ?auto_106063 ?auto_106064 ?auto_106060 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106128 - OBJ
      ?auto_106129 - OBJ
      ?auto_106130 - OBJ
      ?auto_106131 - OBJ
      ?auto_106127 - LOCATION
    )
    :vars
    (
      ?auto_106134 - LOCATION
      ?auto_106136 - CITY
      ?auto_106135 - LOCATION
      ?auto_106133 - LOCATION
      ?auto_106132 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106134 ?auto_106136 ) ( IN-CITY ?auto_106127 ?auto_106136 ) ( not ( = ?auto_106127 ?auto_106134 ) ) ( OBJ-AT ?auto_106128 ?auto_106134 ) ( OBJ-AT ?auto_106130 ?auto_106134 ) ( IN-CITY ?auto_106135 ?auto_106136 ) ( not ( = ?auto_106127 ?auto_106135 ) ) ( OBJ-AT ?auto_106129 ?auto_106135 ) ( IN-CITY ?auto_106133 ?auto_106136 ) ( not ( = ?auto_106127 ?auto_106133 ) ) ( OBJ-AT ?auto_106131 ?auto_106133 ) ( TRUCK-AT ?auto_106132 ?auto_106127 ) ( not ( = ?auto_106131 ?auto_106129 ) ) ( not ( = ?auto_106135 ?auto_106133 ) ) ( not ( = ?auto_106131 ?auto_106130 ) ) ( not ( = ?auto_106129 ?auto_106130 ) ) ( not ( = ?auto_106134 ?auto_106135 ) ) ( not ( = ?auto_106134 ?auto_106133 ) ) ( not ( = ?auto_106131 ?auto_106128 ) ) ( not ( = ?auto_106129 ?auto_106128 ) ) ( not ( = ?auto_106130 ?auto_106128 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106131 ?auto_106129 ?auto_106128 ?auto_106130 ?auto_106127 )
      ( DELIVER-4PKG-VERIFY ?auto_106128 ?auto_106129 ?auto_106130 ?auto_106131 ?auto_106127 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106228 - OBJ
      ?auto_106229 - OBJ
      ?auto_106230 - OBJ
      ?auto_106231 - OBJ
      ?auto_106227 - LOCATION
    )
    :vars
    (
      ?auto_106234 - LOCATION
      ?auto_106236 - CITY
      ?auto_106235 - LOCATION
      ?auto_106233 - LOCATION
      ?auto_106232 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106234 ?auto_106236 ) ( IN-CITY ?auto_106227 ?auto_106236 ) ( not ( = ?auto_106227 ?auto_106234 ) ) ( OBJ-AT ?auto_106228 ?auto_106234 ) ( OBJ-AT ?auto_106229 ?auto_106234 ) ( IN-CITY ?auto_106235 ?auto_106236 ) ( not ( = ?auto_106227 ?auto_106235 ) ) ( OBJ-AT ?auto_106231 ?auto_106235 ) ( IN-CITY ?auto_106233 ?auto_106236 ) ( not ( = ?auto_106227 ?auto_106233 ) ) ( OBJ-AT ?auto_106230 ?auto_106233 ) ( TRUCK-AT ?auto_106232 ?auto_106227 ) ( not ( = ?auto_106230 ?auto_106231 ) ) ( not ( = ?auto_106235 ?auto_106233 ) ) ( not ( = ?auto_106230 ?auto_106229 ) ) ( not ( = ?auto_106231 ?auto_106229 ) ) ( not ( = ?auto_106234 ?auto_106235 ) ) ( not ( = ?auto_106234 ?auto_106233 ) ) ( not ( = ?auto_106230 ?auto_106228 ) ) ( not ( = ?auto_106231 ?auto_106228 ) ) ( not ( = ?auto_106229 ?auto_106228 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106230 ?auto_106231 ?auto_106228 ?auto_106229 ?auto_106227 )
      ( DELIVER-4PKG-VERIFY ?auto_106228 ?auto_106229 ?auto_106230 ?auto_106231 ?auto_106227 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106260 - OBJ
      ?auto_106261 - OBJ
      ?auto_106262 - OBJ
      ?auto_106263 - OBJ
      ?auto_106259 - LOCATION
    )
    :vars
    (
      ?auto_106266 - LOCATION
      ?auto_106268 - CITY
      ?auto_106267 - LOCATION
      ?auto_106265 - LOCATION
      ?auto_106264 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106266 ?auto_106268 ) ( IN-CITY ?auto_106259 ?auto_106268 ) ( not ( = ?auto_106259 ?auto_106266 ) ) ( OBJ-AT ?auto_106260 ?auto_106266 ) ( OBJ-AT ?auto_106261 ?auto_106266 ) ( IN-CITY ?auto_106267 ?auto_106268 ) ( not ( = ?auto_106259 ?auto_106267 ) ) ( OBJ-AT ?auto_106262 ?auto_106267 ) ( IN-CITY ?auto_106265 ?auto_106268 ) ( not ( = ?auto_106259 ?auto_106265 ) ) ( OBJ-AT ?auto_106263 ?auto_106265 ) ( TRUCK-AT ?auto_106264 ?auto_106259 ) ( not ( = ?auto_106263 ?auto_106262 ) ) ( not ( = ?auto_106267 ?auto_106265 ) ) ( not ( = ?auto_106263 ?auto_106261 ) ) ( not ( = ?auto_106262 ?auto_106261 ) ) ( not ( = ?auto_106266 ?auto_106267 ) ) ( not ( = ?auto_106266 ?auto_106265 ) ) ( not ( = ?auto_106263 ?auto_106260 ) ) ( not ( = ?auto_106262 ?auto_106260 ) ) ( not ( = ?auto_106261 ?auto_106260 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106263 ?auto_106262 ?auto_106260 ?auto_106261 ?auto_106259 )
      ( DELIVER-4PKG-VERIFY ?auto_106260 ?auto_106261 ?auto_106262 ?auto_106263 ?auto_106259 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_106584 - OBJ
      ?auto_106583 - LOCATION
    )
    :vars
    (
      ?auto_106586 - LOCATION
      ?auto_106587 - CITY
      ?auto_106585 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106586 ?auto_106587 ) ( IN-CITY ?auto_106583 ?auto_106587 ) ( not ( = ?auto_106583 ?auto_106586 ) ) ( OBJ-AT ?auto_106584 ?auto_106586 ) ( TRUCK-AT ?auto_106585 ?auto_106583 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_106585 ?auto_106583 ?auto_106586 ?auto_106587 )
      ( !LOAD-TRUCK ?auto_106584 ?auto_106585 ?auto_106586 )
      ( !DRIVE-TRUCK ?auto_106585 ?auto_106586 ?auto_106583 ?auto_106587 )
      ( !UNLOAD-TRUCK ?auto_106584 ?auto_106585 ?auto_106583 )
      ( DELIVER-1PKG-VERIFY ?auto_106584 ?auto_106583 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_120321 - OBJ
      ?auto_120322 - OBJ
      ?auto_120323 - OBJ
      ?auto_120324 - OBJ
      ?auto_120325 - OBJ
      ?auto_120320 - LOCATION
    )
    :vars
    (
      ?auto_120327 - LOCATION
      ?auto_120326 - CITY
      ?auto_120330 - LOCATION
      ?auto_120331 - LOCATION
      ?auto_120329 - LOCATION
      ?auto_120328 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_120327 ?auto_120326 ) ( IN-CITY ?auto_120320 ?auto_120326 ) ( not ( = ?auto_120320 ?auto_120327 ) ) ( OBJ-AT ?auto_120325 ?auto_120327 ) ( IN-CITY ?auto_120330 ?auto_120326 ) ( not ( = ?auto_120320 ?auto_120330 ) ) ( OBJ-AT ?auto_120324 ?auto_120330 ) ( OBJ-AT ?auto_120323 ?auto_120330 ) ( IN-CITY ?auto_120331 ?auto_120326 ) ( not ( = ?auto_120320 ?auto_120331 ) ) ( OBJ-AT ?auto_120322 ?auto_120331 ) ( IN-CITY ?auto_120329 ?auto_120326 ) ( not ( = ?auto_120320 ?auto_120329 ) ) ( OBJ-AT ?auto_120321 ?auto_120329 ) ( TRUCK-AT ?auto_120328 ?auto_120320 ) ( not ( = ?auto_120321 ?auto_120322 ) ) ( not ( = ?auto_120331 ?auto_120329 ) ) ( not ( = ?auto_120321 ?auto_120323 ) ) ( not ( = ?auto_120322 ?auto_120323 ) ) ( not ( = ?auto_120330 ?auto_120331 ) ) ( not ( = ?auto_120330 ?auto_120329 ) ) ( not ( = ?auto_120321 ?auto_120324 ) ) ( not ( = ?auto_120322 ?auto_120324 ) ) ( not ( = ?auto_120323 ?auto_120324 ) ) ( not ( = ?auto_120321 ?auto_120325 ) ) ( not ( = ?auto_120322 ?auto_120325 ) ) ( not ( = ?auto_120323 ?auto_120325 ) ) ( not ( = ?auto_120324 ?auto_120325 ) ) ( not ( = ?auto_120327 ?auto_120330 ) ) ( not ( = ?auto_120327 ?auto_120331 ) ) ( not ( = ?auto_120327 ?auto_120329 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_120321 ?auto_120322 ?auto_120324 ?auto_120323 ?auto_120320 )
      ( DELIVER-1PKG ?auto_120325 ?auto_120320 )
      ( DELIVER-5PKG-VERIFY ?auto_120321 ?auto_120322 ?auto_120323 ?auto_120324 ?auto_120325 ?auto_120320 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_120372 - OBJ
      ?auto_120373 - OBJ
      ?auto_120374 - OBJ
      ?auto_120375 - OBJ
      ?auto_120376 - OBJ
      ?auto_120371 - LOCATION
    )
    :vars
    (
      ?auto_120378 - LOCATION
      ?auto_120377 - CITY
      ?auto_120380 - LOCATION
      ?auto_120382 - LOCATION
      ?auto_120381 - LOCATION
      ?auto_120379 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_120378 ?auto_120377 ) ( IN-CITY ?auto_120371 ?auto_120377 ) ( not ( = ?auto_120371 ?auto_120378 ) ) ( OBJ-AT ?auto_120375 ?auto_120378 ) ( IN-CITY ?auto_120380 ?auto_120377 ) ( not ( = ?auto_120371 ?auto_120380 ) ) ( OBJ-AT ?auto_120376 ?auto_120380 ) ( OBJ-AT ?auto_120374 ?auto_120380 ) ( IN-CITY ?auto_120382 ?auto_120377 ) ( not ( = ?auto_120371 ?auto_120382 ) ) ( OBJ-AT ?auto_120373 ?auto_120382 ) ( IN-CITY ?auto_120381 ?auto_120377 ) ( not ( = ?auto_120371 ?auto_120381 ) ) ( OBJ-AT ?auto_120372 ?auto_120381 ) ( TRUCK-AT ?auto_120379 ?auto_120371 ) ( not ( = ?auto_120372 ?auto_120373 ) ) ( not ( = ?auto_120382 ?auto_120381 ) ) ( not ( = ?auto_120372 ?auto_120374 ) ) ( not ( = ?auto_120373 ?auto_120374 ) ) ( not ( = ?auto_120380 ?auto_120382 ) ) ( not ( = ?auto_120380 ?auto_120381 ) ) ( not ( = ?auto_120372 ?auto_120376 ) ) ( not ( = ?auto_120373 ?auto_120376 ) ) ( not ( = ?auto_120374 ?auto_120376 ) ) ( not ( = ?auto_120372 ?auto_120375 ) ) ( not ( = ?auto_120373 ?auto_120375 ) ) ( not ( = ?auto_120374 ?auto_120375 ) ) ( not ( = ?auto_120376 ?auto_120375 ) ) ( not ( = ?auto_120378 ?auto_120380 ) ) ( not ( = ?auto_120378 ?auto_120382 ) ) ( not ( = ?auto_120378 ?auto_120381 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_120372 ?auto_120373 ?auto_120374 ?auto_120376 ?auto_120375 ?auto_120371 )
      ( DELIVER-5PKG-VERIFY ?auto_120372 ?auto_120373 ?auto_120374 ?auto_120375 ?auto_120376 ?auto_120371 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_120423 - OBJ
      ?auto_120424 - OBJ
      ?auto_120425 - OBJ
      ?auto_120426 - OBJ
      ?auto_120427 - OBJ
      ?auto_120422 - LOCATION
    )
    :vars
    (
      ?auto_120428 - LOCATION
      ?auto_120433 - CITY
      ?auto_120430 - LOCATION
      ?auto_120429 - LOCATION
      ?auto_120432 - LOCATION
      ?auto_120431 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_120428 ?auto_120433 ) ( IN-CITY ?auto_120422 ?auto_120433 ) ( not ( = ?auto_120422 ?auto_120428 ) ) ( OBJ-AT ?auto_120427 ?auto_120428 ) ( IN-CITY ?auto_120430 ?auto_120433 ) ( not ( = ?auto_120422 ?auto_120430 ) ) ( OBJ-AT ?auto_120425 ?auto_120430 ) ( OBJ-AT ?auto_120426 ?auto_120430 ) ( IN-CITY ?auto_120429 ?auto_120433 ) ( not ( = ?auto_120422 ?auto_120429 ) ) ( OBJ-AT ?auto_120424 ?auto_120429 ) ( IN-CITY ?auto_120432 ?auto_120433 ) ( not ( = ?auto_120422 ?auto_120432 ) ) ( OBJ-AT ?auto_120423 ?auto_120432 ) ( TRUCK-AT ?auto_120431 ?auto_120422 ) ( not ( = ?auto_120423 ?auto_120424 ) ) ( not ( = ?auto_120429 ?auto_120432 ) ) ( not ( = ?auto_120423 ?auto_120426 ) ) ( not ( = ?auto_120424 ?auto_120426 ) ) ( not ( = ?auto_120430 ?auto_120429 ) ) ( not ( = ?auto_120430 ?auto_120432 ) ) ( not ( = ?auto_120423 ?auto_120425 ) ) ( not ( = ?auto_120424 ?auto_120425 ) ) ( not ( = ?auto_120426 ?auto_120425 ) ) ( not ( = ?auto_120423 ?auto_120427 ) ) ( not ( = ?auto_120424 ?auto_120427 ) ) ( not ( = ?auto_120426 ?auto_120427 ) ) ( not ( = ?auto_120425 ?auto_120427 ) ) ( not ( = ?auto_120428 ?auto_120430 ) ) ( not ( = ?auto_120428 ?auto_120429 ) ) ( not ( = ?auto_120428 ?auto_120432 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_120423 ?auto_120424 ?auto_120426 ?auto_120427 ?auto_120425 ?auto_120422 )
      ( DELIVER-5PKG-VERIFY ?auto_120423 ?auto_120424 ?auto_120425 ?auto_120426 ?auto_120427 ?auto_120422 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_120474 - OBJ
      ?auto_120475 - OBJ
      ?auto_120476 - OBJ
      ?auto_120477 - OBJ
      ?auto_120478 - OBJ
      ?auto_120473 - LOCATION
    )
    :vars
    (
      ?auto_120479 - LOCATION
      ?auto_120484 - CITY
      ?auto_120481 - LOCATION
      ?auto_120480 - LOCATION
      ?auto_120483 - LOCATION
      ?auto_120482 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_120479 ?auto_120484 ) ( IN-CITY ?auto_120473 ?auto_120484 ) ( not ( = ?auto_120473 ?auto_120479 ) ) ( OBJ-AT ?auto_120477 ?auto_120479 ) ( IN-CITY ?auto_120481 ?auto_120484 ) ( not ( = ?auto_120473 ?auto_120481 ) ) ( OBJ-AT ?auto_120476 ?auto_120481 ) ( OBJ-AT ?auto_120478 ?auto_120481 ) ( IN-CITY ?auto_120480 ?auto_120484 ) ( not ( = ?auto_120473 ?auto_120480 ) ) ( OBJ-AT ?auto_120475 ?auto_120480 ) ( IN-CITY ?auto_120483 ?auto_120484 ) ( not ( = ?auto_120473 ?auto_120483 ) ) ( OBJ-AT ?auto_120474 ?auto_120483 ) ( TRUCK-AT ?auto_120482 ?auto_120473 ) ( not ( = ?auto_120474 ?auto_120475 ) ) ( not ( = ?auto_120480 ?auto_120483 ) ) ( not ( = ?auto_120474 ?auto_120478 ) ) ( not ( = ?auto_120475 ?auto_120478 ) ) ( not ( = ?auto_120481 ?auto_120480 ) ) ( not ( = ?auto_120481 ?auto_120483 ) ) ( not ( = ?auto_120474 ?auto_120476 ) ) ( not ( = ?auto_120475 ?auto_120476 ) ) ( not ( = ?auto_120478 ?auto_120476 ) ) ( not ( = ?auto_120474 ?auto_120477 ) ) ( not ( = ?auto_120475 ?auto_120477 ) ) ( not ( = ?auto_120478 ?auto_120477 ) ) ( not ( = ?auto_120476 ?auto_120477 ) ) ( not ( = ?auto_120479 ?auto_120481 ) ) ( not ( = ?auto_120479 ?auto_120480 ) ) ( not ( = ?auto_120479 ?auto_120483 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_120474 ?auto_120475 ?auto_120478 ?auto_120477 ?auto_120476 ?auto_120473 )
      ( DELIVER-5PKG-VERIFY ?auto_120474 ?auto_120475 ?auto_120476 ?auto_120477 ?auto_120478 ?auto_120473 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_120687 - OBJ
      ?auto_120688 - OBJ
      ?auto_120689 - OBJ
      ?auto_120690 - OBJ
      ?auto_120691 - OBJ
      ?auto_120686 - LOCATION
    )
    :vars
    (
      ?auto_120692 - LOCATION
      ?auto_120697 - CITY
      ?auto_120694 - LOCATION
      ?auto_120693 - LOCATION
      ?auto_120696 - LOCATION
      ?auto_120695 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_120692 ?auto_120697 ) ( IN-CITY ?auto_120686 ?auto_120697 ) ( not ( = ?auto_120686 ?auto_120692 ) ) ( OBJ-AT ?auto_120689 ?auto_120692 ) ( IN-CITY ?auto_120694 ?auto_120697 ) ( not ( = ?auto_120686 ?auto_120694 ) ) ( OBJ-AT ?auto_120691 ?auto_120694 ) ( OBJ-AT ?auto_120690 ?auto_120694 ) ( IN-CITY ?auto_120693 ?auto_120697 ) ( not ( = ?auto_120686 ?auto_120693 ) ) ( OBJ-AT ?auto_120688 ?auto_120693 ) ( IN-CITY ?auto_120696 ?auto_120697 ) ( not ( = ?auto_120686 ?auto_120696 ) ) ( OBJ-AT ?auto_120687 ?auto_120696 ) ( TRUCK-AT ?auto_120695 ?auto_120686 ) ( not ( = ?auto_120687 ?auto_120688 ) ) ( not ( = ?auto_120693 ?auto_120696 ) ) ( not ( = ?auto_120687 ?auto_120690 ) ) ( not ( = ?auto_120688 ?auto_120690 ) ) ( not ( = ?auto_120694 ?auto_120693 ) ) ( not ( = ?auto_120694 ?auto_120696 ) ) ( not ( = ?auto_120687 ?auto_120691 ) ) ( not ( = ?auto_120688 ?auto_120691 ) ) ( not ( = ?auto_120690 ?auto_120691 ) ) ( not ( = ?auto_120687 ?auto_120689 ) ) ( not ( = ?auto_120688 ?auto_120689 ) ) ( not ( = ?auto_120690 ?auto_120689 ) ) ( not ( = ?auto_120691 ?auto_120689 ) ) ( not ( = ?auto_120692 ?auto_120694 ) ) ( not ( = ?auto_120692 ?auto_120693 ) ) ( not ( = ?auto_120692 ?auto_120696 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_120687 ?auto_120688 ?auto_120690 ?auto_120689 ?auto_120691 ?auto_120686 )
      ( DELIVER-5PKG-VERIFY ?auto_120687 ?auto_120688 ?auto_120689 ?auto_120690 ?auto_120691 ?auto_120686 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_120738 - OBJ
      ?auto_120739 - OBJ
      ?auto_120740 - OBJ
      ?auto_120741 - OBJ
      ?auto_120742 - OBJ
      ?auto_120737 - LOCATION
    )
    :vars
    (
      ?auto_120743 - LOCATION
      ?auto_120748 - CITY
      ?auto_120745 - LOCATION
      ?auto_120744 - LOCATION
      ?auto_120747 - LOCATION
      ?auto_120746 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_120743 ?auto_120748 ) ( IN-CITY ?auto_120737 ?auto_120748 ) ( not ( = ?auto_120737 ?auto_120743 ) ) ( OBJ-AT ?auto_120740 ?auto_120743 ) ( IN-CITY ?auto_120745 ?auto_120748 ) ( not ( = ?auto_120737 ?auto_120745 ) ) ( OBJ-AT ?auto_120741 ?auto_120745 ) ( OBJ-AT ?auto_120742 ?auto_120745 ) ( IN-CITY ?auto_120744 ?auto_120748 ) ( not ( = ?auto_120737 ?auto_120744 ) ) ( OBJ-AT ?auto_120739 ?auto_120744 ) ( IN-CITY ?auto_120747 ?auto_120748 ) ( not ( = ?auto_120737 ?auto_120747 ) ) ( OBJ-AT ?auto_120738 ?auto_120747 ) ( TRUCK-AT ?auto_120746 ?auto_120737 ) ( not ( = ?auto_120738 ?auto_120739 ) ) ( not ( = ?auto_120744 ?auto_120747 ) ) ( not ( = ?auto_120738 ?auto_120742 ) ) ( not ( = ?auto_120739 ?auto_120742 ) ) ( not ( = ?auto_120745 ?auto_120744 ) ) ( not ( = ?auto_120745 ?auto_120747 ) ) ( not ( = ?auto_120738 ?auto_120741 ) ) ( not ( = ?auto_120739 ?auto_120741 ) ) ( not ( = ?auto_120742 ?auto_120741 ) ) ( not ( = ?auto_120738 ?auto_120740 ) ) ( not ( = ?auto_120739 ?auto_120740 ) ) ( not ( = ?auto_120742 ?auto_120740 ) ) ( not ( = ?auto_120741 ?auto_120740 ) ) ( not ( = ?auto_120743 ?auto_120745 ) ) ( not ( = ?auto_120743 ?auto_120744 ) ) ( not ( = ?auto_120743 ?auto_120747 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_120738 ?auto_120739 ?auto_120742 ?auto_120740 ?auto_120741 ?auto_120737 )
      ( DELIVER-5PKG-VERIFY ?auto_120738 ?auto_120739 ?auto_120740 ?auto_120741 ?auto_120742 ?auto_120737 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121005 - OBJ
      ?auto_121006 - OBJ
      ?auto_121007 - OBJ
      ?auto_121008 - OBJ
      ?auto_121009 - OBJ
      ?auto_121004 - LOCATION
    )
    :vars
    (
      ?auto_121010 - LOCATION
      ?auto_121015 - CITY
      ?auto_121012 - LOCATION
      ?auto_121011 - LOCATION
      ?auto_121014 - LOCATION
      ?auto_121013 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121010 ?auto_121015 ) ( IN-CITY ?auto_121004 ?auto_121015 ) ( not ( = ?auto_121004 ?auto_121010 ) ) ( OBJ-AT ?auto_121009 ?auto_121010 ) ( IN-CITY ?auto_121012 ?auto_121015 ) ( not ( = ?auto_121004 ?auto_121012 ) ) ( OBJ-AT ?auto_121008 ?auto_121012 ) ( OBJ-AT ?auto_121006 ?auto_121012 ) ( IN-CITY ?auto_121011 ?auto_121015 ) ( not ( = ?auto_121004 ?auto_121011 ) ) ( OBJ-AT ?auto_121007 ?auto_121011 ) ( IN-CITY ?auto_121014 ?auto_121015 ) ( not ( = ?auto_121004 ?auto_121014 ) ) ( OBJ-AT ?auto_121005 ?auto_121014 ) ( TRUCK-AT ?auto_121013 ?auto_121004 ) ( not ( = ?auto_121005 ?auto_121007 ) ) ( not ( = ?auto_121011 ?auto_121014 ) ) ( not ( = ?auto_121005 ?auto_121006 ) ) ( not ( = ?auto_121007 ?auto_121006 ) ) ( not ( = ?auto_121012 ?auto_121011 ) ) ( not ( = ?auto_121012 ?auto_121014 ) ) ( not ( = ?auto_121005 ?auto_121008 ) ) ( not ( = ?auto_121007 ?auto_121008 ) ) ( not ( = ?auto_121006 ?auto_121008 ) ) ( not ( = ?auto_121005 ?auto_121009 ) ) ( not ( = ?auto_121007 ?auto_121009 ) ) ( not ( = ?auto_121006 ?auto_121009 ) ) ( not ( = ?auto_121008 ?auto_121009 ) ) ( not ( = ?auto_121010 ?auto_121012 ) ) ( not ( = ?auto_121010 ?auto_121011 ) ) ( not ( = ?auto_121010 ?auto_121014 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121005 ?auto_121007 ?auto_121006 ?auto_121009 ?auto_121008 ?auto_121004 )
      ( DELIVER-5PKG-VERIFY ?auto_121005 ?auto_121006 ?auto_121007 ?auto_121008 ?auto_121009 ?auto_121004 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121056 - OBJ
      ?auto_121057 - OBJ
      ?auto_121058 - OBJ
      ?auto_121059 - OBJ
      ?auto_121060 - OBJ
      ?auto_121055 - LOCATION
    )
    :vars
    (
      ?auto_121061 - LOCATION
      ?auto_121066 - CITY
      ?auto_121063 - LOCATION
      ?auto_121062 - LOCATION
      ?auto_121065 - LOCATION
      ?auto_121064 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121061 ?auto_121066 ) ( IN-CITY ?auto_121055 ?auto_121066 ) ( not ( = ?auto_121055 ?auto_121061 ) ) ( OBJ-AT ?auto_121059 ?auto_121061 ) ( IN-CITY ?auto_121063 ?auto_121066 ) ( not ( = ?auto_121055 ?auto_121063 ) ) ( OBJ-AT ?auto_121060 ?auto_121063 ) ( OBJ-AT ?auto_121057 ?auto_121063 ) ( IN-CITY ?auto_121062 ?auto_121066 ) ( not ( = ?auto_121055 ?auto_121062 ) ) ( OBJ-AT ?auto_121058 ?auto_121062 ) ( IN-CITY ?auto_121065 ?auto_121066 ) ( not ( = ?auto_121055 ?auto_121065 ) ) ( OBJ-AT ?auto_121056 ?auto_121065 ) ( TRUCK-AT ?auto_121064 ?auto_121055 ) ( not ( = ?auto_121056 ?auto_121058 ) ) ( not ( = ?auto_121062 ?auto_121065 ) ) ( not ( = ?auto_121056 ?auto_121057 ) ) ( not ( = ?auto_121058 ?auto_121057 ) ) ( not ( = ?auto_121063 ?auto_121062 ) ) ( not ( = ?auto_121063 ?auto_121065 ) ) ( not ( = ?auto_121056 ?auto_121060 ) ) ( not ( = ?auto_121058 ?auto_121060 ) ) ( not ( = ?auto_121057 ?auto_121060 ) ) ( not ( = ?auto_121056 ?auto_121059 ) ) ( not ( = ?auto_121058 ?auto_121059 ) ) ( not ( = ?auto_121057 ?auto_121059 ) ) ( not ( = ?auto_121060 ?auto_121059 ) ) ( not ( = ?auto_121061 ?auto_121063 ) ) ( not ( = ?auto_121061 ?auto_121062 ) ) ( not ( = ?auto_121061 ?auto_121065 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121056 ?auto_121058 ?auto_121057 ?auto_121059 ?auto_121060 ?auto_121055 )
      ( DELIVER-5PKG-VERIFY ?auto_121056 ?auto_121057 ?auto_121058 ?auto_121059 ?auto_121060 ?auto_121055 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121216 - OBJ
      ?auto_121217 - OBJ
      ?auto_121218 - OBJ
      ?auto_121219 - OBJ
      ?auto_121220 - OBJ
      ?auto_121215 - LOCATION
    )
    :vars
    (
      ?auto_121221 - LOCATION
      ?auto_121226 - CITY
      ?auto_121223 - LOCATION
      ?auto_121222 - LOCATION
      ?auto_121225 - LOCATION
      ?auto_121224 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121221 ?auto_121226 ) ( IN-CITY ?auto_121215 ?auto_121226 ) ( not ( = ?auto_121215 ?auto_121221 ) ) ( OBJ-AT ?auto_121220 ?auto_121221 ) ( IN-CITY ?auto_121223 ?auto_121226 ) ( not ( = ?auto_121215 ?auto_121223 ) ) ( OBJ-AT ?auto_121218 ?auto_121223 ) ( OBJ-AT ?auto_121217 ?auto_121223 ) ( IN-CITY ?auto_121222 ?auto_121226 ) ( not ( = ?auto_121215 ?auto_121222 ) ) ( OBJ-AT ?auto_121219 ?auto_121222 ) ( IN-CITY ?auto_121225 ?auto_121226 ) ( not ( = ?auto_121215 ?auto_121225 ) ) ( OBJ-AT ?auto_121216 ?auto_121225 ) ( TRUCK-AT ?auto_121224 ?auto_121215 ) ( not ( = ?auto_121216 ?auto_121219 ) ) ( not ( = ?auto_121222 ?auto_121225 ) ) ( not ( = ?auto_121216 ?auto_121217 ) ) ( not ( = ?auto_121219 ?auto_121217 ) ) ( not ( = ?auto_121223 ?auto_121222 ) ) ( not ( = ?auto_121223 ?auto_121225 ) ) ( not ( = ?auto_121216 ?auto_121218 ) ) ( not ( = ?auto_121219 ?auto_121218 ) ) ( not ( = ?auto_121217 ?auto_121218 ) ) ( not ( = ?auto_121216 ?auto_121220 ) ) ( not ( = ?auto_121219 ?auto_121220 ) ) ( not ( = ?auto_121217 ?auto_121220 ) ) ( not ( = ?auto_121218 ?auto_121220 ) ) ( not ( = ?auto_121221 ?auto_121223 ) ) ( not ( = ?auto_121221 ?auto_121222 ) ) ( not ( = ?auto_121221 ?auto_121225 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121216 ?auto_121219 ?auto_121217 ?auto_121220 ?auto_121218 ?auto_121215 )
      ( DELIVER-5PKG-VERIFY ?auto_121216 ?auto_121217 ?auto_121218 ?auto_121219 ?auto_121220 ?auto_121215 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121267 - OBJ
      ?auto_121268 - OBJ
      ?auto_121269 - OBJ
      ?auto_121270 - OBJ
      ?auto_121271 - OBJ
      ?auto_121266 - LOCATION
    )
    :vars
    (
      ?auto_121272 - LOCATION
      ?auto_121277 - CITY
      ?auto_121274 - LOCATION
      ?auto_121273 - LOCATION
      ?auto_121276 - LOCATION
      ?auto_121275 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121272 ?auto_121277 ) ( IN-CITY ?auto_121266 ?auto_121277 ) ( not ( = ?auto_121266 ?auto_121272 ) ) ( OBJ-AT ?auto_121270 ?auto_121272 ) ( IN-CITY ?auto_121274 ?auto_121277 ) ( not ( = ?auto_121266 ?auto_121274 ) ) ( OBJ-AT ?auto_121269 ?auto_121274 ) ( OBJ-AT ?auto_121268 ?auto_121274 ) ( IN-CITY ?auto_121273 ?auto_121277 ) ( not ( = ?auto_121266 ?auto_121273 ) ) ( OBJ-AT ?auto_121271 ?auto_121273 ) ( IN-CITY ?auto_121276 ?auto_121277 ) ( not ( = ?auto_121266 ?auto_121276 ) ) ( OBJ-AT ?auto_121267 ?auto_121276 ) ( TRUCK-AT ?auto_121275 ?auto_121266 ) ( not ( = ?auto_121267 ?auto_121271 ) ) ( not ( = ?auto_121273 ?auto_121276 ) ) ( not ( = ?auto_121267 ?auto_121268 ) ) ( not ( = ?auto_121271 ?auto_121268 ) ) ( not ( = ?auto_121274 ?auto_121273 ) ) ( not ( = ?auto_121274 ?auto_121276 ) ) ( not ( = ?auto_121267 ?auto_121269 ) ) ( not ( = ?auto_121271 ?auto_121269 ) ) ( not ( = ?auto_121268 ?auto_121269 ) ) ( not ( = ?auto_121267 ?auto_121270 ) ) ( not ( = ?auto_121271 ?auto_121270 ) ) ( not ( = ?auto_121268 ?auto_121270 ) ) ( not ( = ?auto_121269 ?auto_121270 ) ) ( not ( = ?auto_121272 ?auto_121274 ) ) ( not ( = ?auto_121272 ?auto_121273 ) ) ( not ( = ?auto_121272 ?auto_121276 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121267 ?auto_121271 ?auto_121268 ?auto_121270 ?auto_121269 ?auto_121266 )
      ( DELIVER-5PKG-VERIFY ?auto_121267 ?auto_121268 ?auto_121269 ?auto_121270 ?auto_121271 ?auto_121266 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121425 - OBJ
      ?auto_121426 - OBJ
      ?auto_121427 - OBJ
      ?auto_121428 - OBJ
      ?auto_121429 - OBJ
      ?auto_121424 - LOCATION
    )
    :vars
    (
      ?auto_121430 - LOCATION
      ?auto_121435 - CITY
      ?auto_121432 - LOCATION
      ?auto_121431 - LOCATION
      ?auto_121434 - LOCATION
      ?auto_121433 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121430 ?auto_121435 ) ( IN-CITY ?auto_121424 ?auto_121435 ) ( not ( = ?auto_121424 ?auto_121430 ) ) ( OBJ-AT ?auto_121427 ?auto_121430 ) ( IN-CITY ?auto_121432 ?auto_121435 ) ( not ( = ?auto_121424 ?auto_121432 ) ) ( OBJ-AT ?auto_121429 ?auto_121432 ) ( OBJ-AT ?auto_121426 ?auto_121432 ) ( IN-CITY ?auto_121431 ?auto_121435 ) ( not ( = ?auto_121424 ?auto_121431 ) ) ( OBJ-AT ?auto_121428 ?auto_121431 ) ( IN-CITY ?auto_121434 ?auto_121435 ) ( not ( = ?auto_121424 ?auto_121434 ) ) ( OBJ-AT ?auto_121425 ?auto_121434 ) ( TRUCK-AT ?auto_121433 ?auto_121424 ) ( not ( = ?auto_121425 ?auto_121428 ) ) ( not ( = ?auto_121431 ?auto_121434 ) ) ( not ( = ?auto_121425 ?auto_121426 ) ) ( not ( = ?auto_121428 ?auto_121426 ) ) ( not ( = ?auto_121432 ?auto_121431 ) ) ( not ( = ?auto_121432 ?auto_121434 ) ) ( not ( = ?auto_121425 ?auto_121429 ) ) ( not ( = ?auto_121428 ?auto_121429 ) ) ( not ( = ?auto_121426 ?auto_121429 ) ) ( not ( = ?auto_121425 ?auto_121427 ) ) ( not ( = ?auto_121428 ?auto_121427 ) ) ( not ( = ?auto_121426 ?auto_121427 ) ) ( not ( = ?auto_121429 ?auto_121427 ) ) ( not ( = ?auto_121430 ?auto_121432 ) ) ( not ( = ?auto_121430 ?auto_121431 ) ) ( not ( = ?auto_121430 ?auto_121434 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121425 ?auto_121428 ?auto_121426 ?auto_121427 ?auto_121429 ?auto_121424 )
      ( DELIVER-5PKG-VERIFY ?auto_121425 ?auto_121426 ?auto_121427 ?auto_121428 ?auto_121429 ?auto_121424 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121531 - OBJ
      ?auto_121532 - OBJ
      ?auto_121533 - OBJ
      ?auto_121534 - OBJ
      ?auto_121535 - OBJ
      ?auto_121530 - LOCATION
    )
    :vars
    (
      ?auto_121536 - LOCATION
      ?auto_121541 - CITY
      ?auto_121538 - LOCATION
      ?auto_121537 - LOCATION
      ?auto_121540 - LOCATION
      ?auto_121539 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121536 ?auto_121541 ) ( IN-CITY ?auto_121530 ?auto_121541 ) ( not ( = ?auto_121530 ?auto_121536 ) ) ( OBJ-AT ?auto_121533 ?auto_121536 ) ( IN-CITY ?auto_121538 ?auto_121541 ) ( not ( = ?auto_121530 ?auto_121538 ) ) ( OBJ-AT ?auto_121534 ?auto_121538 ) ( OBJ-AT ?auto_121532 ?auto_121538 ) ( IN-CITY ?auto_121537 ?auto_121541 ) ( not ( = ?auto_121530 ?auto_121537 ) ) ( OBJ-AT ?auto_121535 ?auto_121537 ) ( IN-CITY ?auto_121540 ?auto_121541 ) ( not ( = ?auto_121530 ?auto_121540 ) ) ( OBJ-AT ?auto_121531 ?auto_121540 ) ( TRUCK-AT ?auto_121539 ?auto_121530 ) ( not ( = ?auto_121531 ?auto_121535 ) ) ( not ( = ?auto_121537 ?auto_121540 ) ) ( not ( = ?auto_121531 ?auto_121532 ) ) ( not ( = ?auto_121535 ?auto_121532 ) ) ( not ( = ?auto_121538 ?auto_121537 ) ) ( not ( = ?auto_121538 ?auto_121540 ) ) ( not ( = ?auto_121531 ?auto_121534 ) ) ( not ( = ?auto_121535 ?auto_121534 ) ) ( not ( = ?auto_121532 ?auto_121534 ) ) ( not ( = ?auto_121531 ?auto_121533 ) ) ( not ( = ?auto_121535 ?auto_121533 ) ) ( not ( = ?auto_121532 ?auto_121533 ) ) ( not ( = ?auto_121534 ?auto_121533 ) ) ( not ( = ?auto_121536 ?auto_121538 ) ) ( not ( = ?auto_121536 ?auto_121537 ) ) ( not ( = ?auto_121536 ?auto_121540 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121531 ?auto_121535 ?auto_121532 ?auto_121533 ?auto_121534 ?auto_121530 )
      ( DELIVER-5PKG-VERIFY ?auto_121531 ?auto_121532 ?auto_121533 ?auto_121534 ?auto_121535 ?auto_121530 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121798 - OBJ
      ?auto_121799 - OBJ
      ?auto_121800 - OBJ
      ?auto_121801 - OBJ
      ?auto_121802 - OBJ
      ?auto_121797 - LOCATION
    )
    :vars
    (
      ?auto_121803 - LOCATION
      ?auto_121808 - CITY
      ?auto_121805 - LOCATION
      ?auto_121804 - LOCATION
      ?auto_121807 - LOCATION
      ?auto_121806 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121803 ?auto_121808 ) ( IN-CITY ?auto_121797 ?auto_121808 ) ( not ( = ?auto_121797 ?auto_121803 ) ) ( OBJ-AT ?auto_121802 ?auto_121803 ) ( IN-CITY ?auto_121805 ?auto_121808 ) ( not ( = ?auto_121797 ?auto_121805 ) ) ( OBJ-AT ?auto_121799 ?auto_121805 ) ( OBJ-AT ?auto_121801 ?auto_121805 ) ( IN-CITY ?auto_121804 ?auto_121808 ) ( not ( = ?auto_121797 ?auto_121804 ) ) ( OBJ-AT ?auto_121800 ?auto_121804 ) ( IN-CITY ?auto_121807 ?auto_121808 ) ( not ( = ?auto_121797 ?auto_121807 ) ) ( OBJ-AT ?auto_121798 ?auto_121807 ) ( TRUCK-AT ?auto_121806 ?auto_121797 ) ( not ( = ?auto_121798 ?auto_121800 ) ) ( not ( = ?auto_121804 ?auto_121807 ) ) ( not ( = ?auto_121798 ?auto_121801 ) ) ( not ( = ?auto_121800 ?auto_121801 ) ) ( not ( = ?auto_121805 ?auto_121804 ) ) ( not ( = ?auto_121805 ?auto_121807 ) ) ( not ( = ?auto_121798 ?auto_121799 ) ) ( not ( = ?auto_121800 ?auto_121799 ) ) ( not ( = ?auto_121801 ?auto_121799 ) ) ( not ( = ?auto_121798 ?auto_121802 ) ) ( not ( = ?auto_121800 ?auto_121802 ) ) ( not ( = ?auto_121801 ?auto_121802 ) ) ( not ( = ?auto_121799 ?auto_121802 ) ) ( not ( = ?auto_121803 ?auto_121805 ) ) ( not ( = ?auto_121803 ?auto_121804 ) ) ( not ( = ?auto_121803 ?auto_121807 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121798 ?auto_121800 ?auto_121801 ?auto_121802 ?auto_121799 ?auto_121797 )
      ( DELIVER-5PKG-VERIFY ?auto_121798 ?auto_121799 ?auto_121800 ?auto_121801 ?auto_121802 ?auto_121797 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121849 - OBJ
      ?auto_121850 - OBJ
      ?auto_121851 - OBJ
      ?auto_121852 - OBJ
      ?auto_121853 - OBJ
      ?auto_121848 - LOCATION
    )
    :vars
    (
      ?auto_121854 - LOCATION
      ?auto_121859 - CITY
      ?auto_121856 - LOCATION
      ?auto_121855 - LOCATION
      ?auto_121858 - LOCATION
      ?auto_121857 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121854 ?auto_121859 ) ( IN-CITY ?auto_121848 ?auto_121859 ) ( not ( = ?auto_121848 ?auto_121854 ) ) ( OBJ-AT ?auto_121852 ?auto_121854 ) ( IN-CITY ?auto_121856 ?auto_121859 ) ( not ( = ?auto_121848 ?auto_121856 ) ) ( OBJ-AT ?auto_121850 ?auto_121856 ) ( OBJ-AT ?auto_121853 ?auto_121856 ) ( IN-CITY ?auto_121855 ?auto_121859 ) ( not ( = ?auto_121848 ?auto_121855 ) ) ( OBJ-AT ?auto_121851 ?auto_121855 ) ( IN-CITY ?auto_121858 ?auto_121859 ) ( not ( = ?auto_121848 ?auto_121858 ) ) ( OBJ-AT ?auto_121849 ?auto_121858 ) ( TRUCK-AT ?auto_121857 ?auto_121848 ) ( not ( = ?auto_121849 ?auto_121851 ) ) ( not ( = ?auto_121855 ?auto_121858 ) ) ( not ( = ?auto_121849 ?auto_121853 ) ) ( not ( = ?auto_121851 ?auto_121853 ) ) ( not ( = ?auto_121856 ?auto_121855 ) ) ( not ( = ?auto_121856 ?auto_121858 ) ) ( not ( = ?auto_121849 ?auto_121850 ) ) ( not ( = ?auto_121851 ?auto_121850 ) ) ( not ( = ?auto_121853 ?auto_121850 ) ) ( not ( = ?auto_121849 ?auto_121852 ) ) ( not ( = ?auto_121851 ?auto_121852 ) ) ( not ( = ?auto_121853 ?auto_121852 ) ) ( not ( = ?auto_121850 ?auto_121852 ) ) ( not ( = ?auto_121854 ?auto_121856 ) ) ( not ( = ?auto_121854 ?auto_121855 ) ) ( not ( = ?auto_121854 ?auto_121858 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121849 ?auto_121851 ?auto_121853 ?auto_121852 ?auto_121850 ?auto_121848 )
      ( DELIVER-5PKG-VERIFY ?auto_121849 ?auto_121850 ?auto_121851 ?auto_121852 ?auto_121853 ?auto_121848 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121900 - OBJ
      ?auto_121901 - OBJ
      ?auto_121902 - OBJ
      ?auto_121903 - OBJ
      ?auto_121904 - OBJ
      ?auto_121899 - LOCATION
    )
    :vars
    (
      ?auto_121905 - LOCATION
      ?auto_121910 - CITY
      ?auto_121907 - LOCATION
      ?auto_121906 - LOCATION
      ?auto_121909 - LOCATION
      ?auto_121908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121905 ?auto_121910 ) ( IN-CITY ?auto_121899 ?auto_121910 ) ( not ( = ?auto_121899 ?auto_121905 ) ) ( OBJ-AT ?auto_121904 ?auto_121905 ) ( IN-CITY ?auto_121907 ?auto_121910 ) ( not ( = ?auto_121899 ?auto_121907 ) ) ( OBJ-AT ?auto_121901 ?auto_121907 ) ( OBJ-AT ?auto_121902 ?auto_121907 ) ( IN-CITY ?auto_121906 ?auto_121910 ) ( not ( = ?auto_121899 ?auto_121906 ) ) ( OBJ-AT ?auto_121903 ?auto_121906 ) ( IN-CITY ?auto_121909 ?auto_121910 ) ( not ( = ?auto_121899 ?auto_121909 ) ) ( OBJ-AT ?auto_121900 ?auto_121909 ) ( TRUCK-AT ?auto_121908 ?auto_121899 ) ( not ( = ?auto_121900 ?auto_121903 ) ) ( not ( = ?auto_121906 ?auto_121909 ) ) ( not ( = ?auto_121900 ?auto_121902 ) ) ( not ( = ?auto_121903 ?auto_121902 ) ) ( not ( = ?auto_121907 ?auto_121906 ) ) ( not ( = ?auto_121907 ?auto_121909 ) ) ( not ( = ?auto_121900 ?auto_121901 ) ) ( not ( = ?auto_121903 ?auto_121901 ) ) ( not ( = ?auto_121902 ?auto_121901 ) ) ( not ( = ?auto_121900 ?auto_121904 ) ) ( not ( = ?auto_121903 ?auto_121904 ) ) ( not ( = ?auto_121902 ?auto_121904 ) ) ( not ( = ?auto_121901 ?auto_121904 ) ) ( not ( = ?auto_121905 ?auto_121907 ) ) ( not ( = ?auto_121905 ?auto_121906 ) ) ( not ( = ?auto_121905 ?auto_121909 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121900 ?auto_121903 ?auto_121902 ?auto_121904 ?auto_121901 ?auto_121899 )
      ( DELIVER-5PKG-VERIFY ?auto_121900 ?auto_121901 ?auto_121902 ?auto_121903 ?auto_121904 ?auto_121899 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121951 - OBJ
      ?auto_121952 - OBJ
      ?auto_121953 - OBJ
      ?auto_121954 - OBJ
      ?auto_121955 - OBJ
      ?auto_121950 - LOCATION
    )
    :vars
    (
      ?auto_121956 - LOCATION
      ?auto_121961 - CITY
      ?auto_121958 - LOCATION
      ?auto_121957 - LOCATION
      ?auto_121960 - LOCATION
      ?auto_121959 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121956 ?auto_121961 ) ( IN-CITY ?auto_121950 ?auto_121961 ) ( not ( = ?auto_121950 ?auto_121956 ) ) ( OBJ-AT ?auto_121954 ?auto_121956 ) ( IN-CITY ?auto_121958 ?auto_121961 ) ( not ( = ?auto_121950 ?auto_121958 ) ) ( OBJ-AT ?auto_121952 ?auto_121958 ) ( OBJ-AT ?auto_121953 ?auto_121958 ) ( IN-CITY ?auto_121957 ?auto_121961 ) ( not ( = ?auto_121950 ?auto_121957 ) ) ( OBJ-AT ?auto_121955 ?auto_121957 ) ( IN-CITY ?auto_121960 ?auto_121961 ) ( not ( = ?auto_121950 ?auto_121960 ) ) ( OBJ-AT ?auto_121951 ?auto_121960 ) ( TRUCK-AT ?auto_121959 ?auto_121950 ) ( not ( = ?auto_121951 ?auto_121955 ) ) ( not ( = ?auto_121957 ?auto_121960 ) ) ( not ( = ?auto_121951 ?auto_121953 ) ) ( not ( = ?auto_121955 ?auto_121953 ) ) ( not ( = ?auto_121958 ?auto_121957 ) ) ( not ( = ?auto_121958 ?auto_121960 ) ) ( not ( = ?auto_121951 ?auto_121952 ) ) ( not ( = ?auto_121955 ?auto_121952 ) ) ( not ( = ?auto_121953 ?auto_121952 ) ) ( not ( = ?auto_121951 ?auto_121954 ) ) ( not ( = ?auto_121955 ?auto_121954 ) ) ( not ( = ?auto_121953 ?auto_121954 ) ) ( not ( = ?auto_121952 ?auto_121954 ) ) ( not ( = ?auto_121956 ?auto_121958 ) ) ( not ( = ?auto_121956 ?auto_121957 ) ) ( not ( = ?auto_121956 ?auto_121960 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121951 ?auto_121955 ?auto_121953 ?auto_121954 ?auto_121952 ?auto_121950 )
      ( DELIVER-5PKG-VERIFY ?auto_121951 ?auto_121952 ?auto_121953 ?auto_121954 ?auto_121955 ?auto_121950 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122218 - OBJ
      ?auto_122219 - OBJ
      ?auto_122220 - OBJ
      ?auto_122221 - OBJ
      ?auto_122222 - OBJ
      ?auto_122217 - LOCATION
    )
    :vars
    (
      ?auto_122223 - LOCATION
      ?auto_122228 - CITY
      ?auto_122225 - LOCATION
      ?auto_122224 - LOCATION
      ?auto_122227 - LOCATION
      ?auto_122226 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122223 ?auto_122228 ) ( IN-CITY ?auto_122217 ?auto_122228 ) ( not ( = ?auto_122217 ?auto_122223 ) ) ( OBJ-AT ?auto_122220 ?auto_122223 ) ( IN-CITY ?auto_122225 ?auto_122228 ) ( not ( = ?auto_122217 ?auto_122225 ) ) ( OBJ-AT ?auto_122219 ?auto_122225 ) ( OBJ-AT ?auto_122222 ?auto_122225 ) ( IN-CITY ?auto_122224 ?auto_122228 ) ( not ( = ?auto_122217 ?auto_122224 ) ) ( OBJ-AT ?auto_122221 ?auto_122224 ) ( IN-CITY ?auto_122227 ?auto_122228 ) ( not ( = ?auto_122217 ?auto_122227 ) ) ( OBJ-AT ?auto_122218 ?auto_122227 ) ( TRUCK-AT ?auto_122226 ?auto_122217 ) ( not ( = ?auto_122218 ?auto_122221 ) ) ( not ( = ?auto_122224 ?auto_122227 ) ) ( not ( = ?auto_122218 ?auto_122222 ) ) ( not ( = ?auto_122221 ?auto_122222 ) ) ( not ( = ?auto_122225 ?auto_122224 ) ) ( not ( = ?auto_122225 ?auto_122227 ) ) ( not ( = ?auto_122218 ?auto_122219 ) ) ( not ( = ?auto_122221 ?auto_122219 ) ) ( not ( = ?auto_122222 ?auto_122219 ) ) ( not ( = ?auto_122218 ?auto_122220 ) ) ( not ( = ?auto_122221 ?auto_122220 ) ) ( not ( = ?auto_122222 ?auto_122220 ) ) ( not ( = ?auto_122219 ?auto_122220 ) ) ( not ( = ?auto_122223 ?auto_122225 ) ) ( not ( = ?auto_122223 ?auto_122224 ) ) ( not ( = ?auto_122223 ?auto_122227 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122218 ?auto_122221 ?auto_122222 ?auto_122220 ?auto_122219 ?auto_122217 )
      ( DELIVER-5PKG-VERIFY ?auto_122218 ?auto_122219 ?auto_122220 ?auto_122221 ?auto_122222 ?auto_122217 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122269 - OBJ
      ?auto_122270 - OBJ
      ?auto_122271 - OBJ
      ?auto_122272 - OBJ
      ?auto_122273 - OBJ
      ?auto_122268 - LOCATION
    )
    :vars
    (
      ?auto_122274 - LOCATION
      ?auto_122279 - CITY
      ?auto_122276 - LOCATION
      ?auto_122275 - LOCATION
      ?auto_122278 - LOCATION
      ?auto_122277 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122274 ?auto_122279 ) ( IN-CITY ?auto_122268 ?auto_122279 ) ( not ( = ?auto_122268 ?auto_122274 ) ) ( OBJ-AT ?auto_122271 ?auto_122274 ) ( IN-CITY ?auto_122276 ?auto_122279 ) ( not ( = ?auto_122268 ?auto_122276 ) ) ( OBJ-AT ?auto_122270 ?auto_122276 ) ( OBJ-AT ?auto_122272 ?auto_122276 ) ( IN-CITY ?auto_122275 ?auto_122279 ) ( not ( = ?auto_122268 ?auto_122275 ) ) ( OBJ-AT ?auto_122273 ?auto_122275 ) ( IN-CITY ?auto_122278 ?auto_122279 ) ( not ( = ?auto_122268 ?auto_122278 ) ) ( OBJ-AT ?auto_122269 ?auto_122278 ) ( TRUCK-AT ?auto_122277 ?auto_122268 ) ( not ( = ?auto_122269 ?auto_122273 ) ) ( not ( = ?auto_122275 ?auto_122278 ) ) ( not ( = ?auto_122269 ?auto_122272 ) ) ( not ( = ?auto_122273 ?auto_122272 ) ) ( not ( = ?auto_122276 ?auto_122275 ) ) ( not ( = ?auto_122276 ?auto_122278 ) ) ( not ( = ?auto_122269 ?auto_122270 ) ) ( not ( = ?auto_122273 ?auto_122270 ) ) ( not ( = ?auto_122272 ?auto_122270 ) ) ( not ( = ?auto_122269 ?auto_122271 ) ) ( not ( = ?auto_122273 ?auto_122271 ) ) ( not ( = ?auto_122272 ?auto_122271 ) ) ( not ( = ?auto_122270 ?auto_122271 ) ) ( not ( = ?auto_122274 ?auto_122276 ) ) ( not ( = ?auto_122274 ?auto_122275 ) ) ( not ( = ?auto_122274 ?auto_122278 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122269 ?auto_122273 ?auto_122272 ?auto_122271 ?auto_122270 ?auto_122268 )
      ( DELIVER-5PKG-VERIFY ?auto_122269 ?auto_122270 ?auto_122271 ?auto_122272 ?auto_122273 ?auto_122268 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122979 - OBJ
      ?auto_122980 - OBJ
      ?auto_122981 - OBJ
      ?auto_122982 - OBJ
      ?auto_122983 - OBJ
      ?auto_122978 - LOCATION
    )
    :vars
    (
      ?auto_122984 - LOCATION
      ?auto_122989 - CITY
      ?auto_122986 - LOCATION
      ?auto_122985 - LOCATION
      ?auto_122988 - LOCATION
      ?auto_122987 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122984 ?auto_122989 ) ( IN-CITY ?auto_122978 ?auto_122989 ) ( not ( = ?auto_122978 ?auto_122984 ) ) ( OBJ-AT ?auto_122980 ?auto_122984 ) ( IN-CITY ?auto_122986 ?auto_122989 ) ( not ( = ?auto_122978 ?auto_122986 ) ) ( OBJ-AT ?auto_122983 ?auto_122986 ) ( OBJ-AT ?auto_122982 ?auto_122986 ) ( IN-CITY ?auto_122985 ?auto_122989 ) ( not ( = ?auto_122978 ?auto_122985 ) ) ( OBJ-AT ?auto_122981 ?auto_122985 ) ( IN-CITY ?auto_122988 ?auto_122989 ) ( not ( = ?auto_122978 ?auto_122988 ) ) ( OBJ-AT ?auto_122979 ?auto_122988 ) ( TRUCK-AT ?auto_122987 ?auto_122978 ) ( not ( = ?auto_122979 ?auto_122981 ) ) ( not ( = ?auto_122985 ?auto_122988 ) ) ( not ( = ?auto_122979 ?auto_122982 ) ) ( not ( = ?auto_122981 ?auto_122982 ) ) ( not ( = ?auto_122986 ?auto_122985 ) ) ( not ( = ?auto_122986 ?auto_122988 ) ) ( not ( = ?auto_122979 ?auto_122983 ) ) ( not ( = ?auto_122981 ?auto_122983 ) ) ( not ( = ?auto_122982 ?auto_122983 ) ) ( not ( = ?auto_122979 ?auto_122980 ) ) ( not ( = ?auto_122981 ?auto_122980 ) ) ( not ( = ?auto_122982 ?auto_122980 ) ) ( not ( = ?auto_122983 ?auto_122980 ) ) ( not ( = ?auto_122984 ?auto_122986 ) ) ( not ( = ?auto_122984 ?auto_122985 ) ) ( not ( = ?auto_122984 ?auto_122988 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122979 ?auto_122981 ?auto_122982 ?auto_122980 ?auto_122983 ?auto_122978 )
      ( DELIVER-5PKG-VERIFY ?auto_122979 ?auto_122980 ?auto_122981 ?auto_122982 ?auto_122983 ?auto_122978 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123030 - OBJ
      ?auto_123031 - OBJ
      ?auto_123032 - OBJ
      ?auto_123033 - OBJ
      ?auto_123034 - OBJ
      ?auto_123029 - LOCATION
    )
    :vars
    (
      ?auto_123035 - LOCATION
      ?auto_123040 - CITY
      ?auto_123037 - LOCATION
      ?auto_123036 - LOCATION
      ?auto_123039 - LOCATION
      ?auto_123038 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123035 ?auto_123040 ) ( IN-CITY ?auto_123029 ?auto_123040 ) ( not ( = ?auto_123029 ?auto_123035 ) ) ( OBJ-AT ?auto_123031 ?auto_123035 ) ( IN-CITY ?auto_123037 ?auto_123040 ) ( not ( = ?auto_123029 ?auto_123037 ) ) ( OBJ-AT ?auto_123033 ?auto_123037 ) ( OBJ-AT ?auto_123034 ?auto_123037 ) ( IN-CITY ?auto_123036 ?auto_123040 ) ( not ( = ?auto_123029 ?auto_123036 ) ) ( OBJ-AT ?auto_123032 ?auto_123036 ) ( IN-CITY ?auto_123039 ?auto_123040 ) ( not ( = ?auto_123029 ?auto_123039 ) ) ( OBJ-AT ?auto_123030 ?auto_123039 ) ( TRUCK-AT ?auto_123038 ?auto_123029 ) ( not ( = ?auto_123030 ?auto_123032 ) ) ( not ( = ?auto_123036 ?auto_123039 ) ) ( not ( = ?auto_123030 ?auto_123034 ) ) ( not ( = ?auto_123032 ?auto_123034 ) ) ( not ( = ?auto_123037 ?auto_123036 ) ) ( not ( = ?auto_123037 ?auto_123039 ) ) ( not ( = ?auto_123030 ?auto_123033 ) ) ( not ( = ?auto_123032 ?auto_123033 ) ) ( not ( = ?auto_123034 ?auto_123033 ) ) ( not ( = ?auto_123030 ?auto_123031 ) ) ( not ( = ?auto_123032 ?auto_123031 ) ) ( not ( = ?auto_123034 ?auto_123031 ) ) ( not ( = ?auto_123033 ?auto_123031 ) ) ( not ( = ?auto_123035 ?auto_123037 ) ) ( not ( = ?auto_123035 ?auto_123036 ) ) ( not ( = ?auto_123035 ?auto_123039 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123030 ?auto_123032 ?auto_123034 ?auto_123031 ?auto_123033 ?auto_123029 )
      ( DELIVER-5PKG-VERIFY ?auto_123030 ?auto_123031 ?auto_123032 ?auto_123033 ?auto_123034 ?auto_123029 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123243 - OBJ
      ?auto_123244 - OBJ
      ?auto_123245 - OBJ
      ?auto_123246 - OBJ
      ?auto_123247 - OBJ
      ?auto_123242 - LOCATION
    )
    :vars
    (
      ?auto_123248 - LOCATION
      ?auto_123253 - CITY
      ?auto_123250 - LOCATION
      ?auto_123249 - LOCATION
      ?auto_123252 - LOCATION
      ?auto_123251 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123248 ?auto_123253 ) ( IN-CITY ?auto_123242 ?auto_123253 ) ( not ( = ?auto_123242 ?auto_123248 ) ) ( OBJ-AT ?auto_123244 ?auto_123248 ) ( IN-CITY ?auto_123250 ?auto_123253 ) ( not ( = ?auto_123242 ?auto_123250 ) ) ( OBJ-AT ?auto_123247 ?auto_123250 ) ( OBJ-AT ?auto_123245 ?auto_123250 ) ( IN-CITY ?auto_123249 ?auto_123253 ) ( not ( = ?auto_123242 ?auto_123249 ) ) ( OBJ-AT ?auto_123246 ?auto_123249 ) ( IN-CITY ?auto_123252 ?auto_123253 ) ( not ( = ?auto_123242 ?auto_123252 ) ) ( OBJ-AT ?auto_123243 ?auto_123252 ) ( TRUCK-AT ?auto_123251 ?auto_123242 ) ( not ( = ?auto_123243 ?auto_123246 ) ) ( not ( = ?auto_123249 ?auto_123252 ) ) ( not ( = ?auto_123243 ?auto_123245 ) ) ( not ( = ?auto_123246 ?auto_123245 ) ) ( not ( = ?auto_123250 ?auto_123249 ) ) ( not ( = ?auto_123250 ?auto_123252 ) ) ( not ( = ?auto_123243 ?auto_123247 ) ) ( not ( = ?auto_123246 ?auto_123247 ) ) ( not ( = ?auto_123245 ?auto_123247 ) ) ( not ( = ?auto_123243 ?auto_123244 ) ) ( not ( = ?auto_123246 ?auto_123244 ) ) ( not ( = ?auto_123245 ?auto_123244 ) ) ( not ( = ?auto_123247 ?auto_123244 ) ) ( not ( = ?auto_123248 ?auto_123250 ) ) ( not ( = ?auto_123248 ?auto_123249 ) ) ( not ( = ?auto_123248 ?auto_123252 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123243 ?auto_123246 ?auto_123245 ?auto_123244 ?auto_123247 ?auto_123242 )
      ( DELIVER-5PKG-VERIFY ?auto_123243 ?auto_123244 ?auto_123245 ?auto_123246 ?auto_123247 ?auto_123242 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123349 - OBJ
      ?auto_123350 - OBJ
      ?auto_123351 - OBJ
      ?auto_123352 - OBJ
      ?auto_123353 - OBJ
      ?auto_123348 - LOCATION
    )
    :vars
    (
      ?auto_123354 - LOCATION
      ?auto_123359 - CITY
      ?auto_123356 - LOCATION
      ?auto_123355 - LOCATION
      ?auto_123358 - LOCATION
      ?auto_123357 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123354 ?auto_123359 ) ( IN-CITY ?auto_123348 ?auto_123359 ) ( not ( = ?auto_123348 ?auto_123354 ) ) ( OBJ-AT ?auto_123350 ?auto_123354 ) ( IN-CITY ?auto_123356 ?auto_123359 ) ( not ( = ?auto_123348 ?auto_123356 ) ) ( OBJ-AT ?auto_123352 ?auto_123356 ) ( OBJ-AT ?auto_123351 ?auto_123356 ) ( IN-CITY ?auto_123355 ?auto_123359 ) ( not ( = ?auto_123348 ?auto_123355 ) ) ( OBJ-AT ?auto_123353 ?auto_123355 ) ( IN-CITY ?auto_123358 ?auto_123359 ) ( not ( = ?auto_123348 ?auto_123358 ) ) ( OBJ-AT ?auto_123349 ?auto_123358 ) ( TRUCK-AT ?auto_123357 ?auto_123348 ) ( not ( = ?auto_123349 ?auto_123353 ) ) ( not ( = ?auto_123355 ?auto_123358 ) ) ( not ( = ?auto_123349 ?auto_123351 ) ) ( not ( = ?auto_123353 ?auto_123351 ) ) ( not ( = ?auto_123356 ?auto_123355 ) ) ( not ( = ?auto_123356 ?auto_123358 ) ) ( not ( = ?auto_123349 ?auto_123352 ) ) ( not ( = ?auto_123353 ?auto_123352 ) ) ( not ( = ?auto_123351 ?auto_123352 ) ) ( not ( = ?auto_123349 ?auto_123350 ) ) ( not ( = ?auto_123353 ?auto_123350 ) ) ( not ( = ?auto_123351 ?auto_123350 ) ) ( not ( = ?auto_123352 ?auto_123350 ) ) ( not ( = ?auto_123354 ?auto_123356 ) ) ( not ( = ?auto_123354 ?auto_123355 ) ) ( not ( = ?auto_123354 ?auto_123358 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123349 ?auto_123353 ?auto_123351 ?auto_123350 ?auto_123352 ?auto_123348 )
      ( DELIVER-5PKG-VERIFY ?auto_123349 ?auto_123350 ?auto_123351 ?auto_123352 ?auto_123353 ?auto_123348 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123562 - OBJ
      ?auto_123563 - OBJ
      ?auto_123564 - OBJ
      ?auto_123565 - OBJ
      ?auto_123566 - OBJ
      ?auto_123561 - LOCATION
    )
    :vars
    (
      ?auto_123567 - LOCATION
      ?auto_123572 - CITY
      ?auto_123569 - LOCATION
      ?auto_123568 - LOCATION
      ?auto_123571 - LOCATION
      ?auto_123570 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123567 ?auto_123572 ) ( IN-CITY ?auto_123561 ?auto_123572 ) ( not ( = ?auto_123561 ?auto_123567 ) ) ( OBJ-AT ?auto_123563 ?auto_123567 ) ( IN-CITY ?auto_123569 ?auto_123572 ) ( not ( = ?auto_123561 ?auto_123569 ) ) ( OBJ-AT ?auto_123564 ?auto_123569 ) ( OBJ-AT ?auto_123566 ?auto_123569 ) ( IN-CITY ?auto_123568 ?auto_123572 ) ( not ( = ?auto_123561 ?auto_123568 ) ) ( OBJ-AT ?auto_123565 ?auto_123568 ) ( IN-CITY ?auto_123571 ?auto_123572 ) ( not ( = ?auto_123561 ?auto_123571 ) ) ( OBJ-AT ?auto_123562 ?auto_123571 ) ( TRUCK-AT ?auto_123570 ?auto_123561 ) ( not ( = ?auto_123562 ?auto_123565 ) ) ( not ( = ?auto_123568 ?auto_123571 ) ) ( not ( = ?auto_123562 ?auto_123566 ) ) ( not ( = ?auto_123565 ?auto_123566 ) ) ( not ( = ?auto_123569 ?auto_123568 ) ) ( not ( = ?auto_123569 ?auto_123571 ) ) ( not ( = ?auto_123562 ?auto_123564 ) ) ( not ( = ?auto_123565 ?auto_123564 ) ) ( not ( = ?auto_123566 ?auto_123564 ) ) ( not ( = ?auto_123562 ?auto_123563 ) ) ( not ( = ?auto_123565 ?auto_123563 ) ) ( not ( = ?auto_123566 ?auto_123563 ) ) ( not ( = ?auto_123564 ?auto_123563 ) ) ( not ( = ?auto_123567 ?auto_123569 ) ) ( not ( = ?auto_123567 ?auto_123568 ) ) ( not ( = ?auto_123567 ?auto_123571 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123562 ?auto_123565 ?auto_123566 ?auto_123563 ?auto_123564 ?auto_123561 )
      ( DELIVER-5PKG-VERIFY ?auto_123562 ?auto_123563 ?auto_123564 ?auto_123565 ?auto_123566 ?auto_123561 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123613 - OBJ
      ?auto_123614 - OBJ
      ?auto_123615 - OBJ
      ?auto_123616 - OBJ
      ?auto_123617 - OBJ
      ?auto_123612 - LOCATION
    )
    :vars
    (
      ?auto_123618 - LOCATION
      ?auto_123623 - CITY
      ?auto_123620 - LOCATION
      ?auto_123619 - LOCATION
      ?auto_123622 - LOCATION
      ?auto_123621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123618 ?auto_123623 ) ( IN-CITY ?auto_123612 ?auto_123623 ) ( not ( = ?auto_123612 ?auto_123618 ) ) ( OBJ-AT ?auto_123614 ?auto_123618 ) ( IN-CITY ?auto_123620 ?auto_123623 ) ( not ( = ?auto_123612 ?auto_123620 ) ) ( OBJ-AT ?auto_123615 ?auto_123620 ) ( OBJ-AT ?auto_123616 ?auto_123620 ) ( IN-CITY ?auto_123619 ?auto_123623 ) ( not ( = ?auto_123612 ?auto_123619 ) ) ( OBJ-AT ?auto_123617 ?auto_123619 ) ( IN-CITY ?auto_123622 ?auto_123623 ) ( not ( = ?auto_123612 ?auto_123622 ) ) ( OBJ-AT ?auto_123613 ?auto_123622 ) ( TRUCK-AT ?auto_123621 ?auto_123612 ) ( not ( = ?auto_123613 ?auto_123617 ) ) ( not ( = ?auto_123619 ?auto_123622 ) ) ( not ( = ?auto_123613 ?auto_123616 ) ) ( not ( = ?auto_123617 ?auto_123616 ) ) ( not ( = ?auto_123620 ?auto_123619 ) ) ( not ( = ?auto_123620 ?auto_123622 ) ) ( not ( = ?auto_123613 ?auto_123615 ) ) ( not ( = ?auto_123617 ?auto_123615 ) ) ( not ( = ?auto_123616 ?auto_123615 ) ) ( not ( = ?auto_123613 ?auto_123614 ) ) ( not ( = ?auto_123617 ?auto_123614 ) ) ( not ( = ?auto_123616 ?auto_123614 ) ) ( not ( = ?auto_123615 ?auto_123614 ) ) ( not ( = ?auto_123618 ?auto_123620 ) ) ( not ( = ?auto_123618 ?auto_123619 ) ) ( not ( = ?auto_123618 ?auto_123622 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123613 ?auto_123617 ?auto_123616 ?auto_123614 ?auto_123615 ?auto_123612 )
      ( DELIVER-5PKG-VERIFY ?auto_123613 ?auto_123614 ?auto_123615 ?auto_123616 ?auto_123617 ?auto_123612 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124431 - OBJ
      ?auto_124432 - OBJ
      ?auto_124433 - OBJ
      ?auto_124434 - OBJ
      ?auto_124435 - OBJ
      ?auto_124430 - LOCATION
    )
    :vars
    (
      ?auto_124436 - LOCATION
      ?auto_124441 - CITY
      ?auto_124438 - LOCATION
      ?auto_124437 - LOCATION
      ?auto_124440 - LOCATION
      ?auto_124439 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124436 ?auto_124441 ) ( IN-CITY ?auto_124430 ?auto_124441 ) ( not ( = ?auto_124430 ?auto_124436 ) ) ( OBJ-AT ?auto_124435 ?auto_124436 ) ( IN-CITY ?auto_124438 ?auto_124441 ) ( not ( = ?auto_124430 ?auto_124438 ) ) ( OBJ-AT ?auto_124434 ?auto_124438 ) ( OBJ-AT ?auto_124433 ?auto_124438 ) ( IN-CITY ?auto_124437 ?auto_124441 ) ( not ( = ?auto_124430 ?auto_124437 ) ) ( OBJ-AT ?auto_124431 ?auto_124437 ) ( IN-CITY ?auto_124440 ?auto_124441 ) ( not ( = ?auto_124430 ?auto_124440 ) ) ( OBJ-AT ?auto_124432 ?auto_124440 ) ( TRUCK-AT ?auto_124439 ?auto_124430 ) ( not ( = ?auto_124432 ?auto_124431 ) ) ( not ( = ?auto_124437 ?auto_124440 ) ) ( not ( = ?auto_124432 ?auto_124433 ) ) ( not ( = ?auto_124431 ?auto_124433 ) ) ( not ( = ?auto_124438 ?auto_124437 ) ) ( not ( = ?auto_124438 ?auto_124440 ) ) ( not ( = ?auto_124432 ?auto_124434 ) ) ( not ( = ?auto_124431 ?auto_124434 ) ) ( not ( = ?auto_124433 ?auto_124434 ) ) ( not ( = ?auto_124432 ?auto_124435 ) ) ( not ( = ?auto_124431 ?auto_124435 ) ) ( not ( = ?auto_124433 ?auto_124435 ) ) ( not ( = ?auto_124434 ?auto_124435 ) ) ( not ( = ?auto_124436 ?auto_124438 ) ) ( not ( = ?auto_124436 ?auto_124437 ) ) ( not ( = ?auto_124436 ?auto_124440 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124432 ?auto_124431 ?auto_124433 ?auto_124435 ?auto_124434 ?auto_124430 )
      ( DELIVER-5PKG-VERIFY ?auto_124431 ?auto_124432 ?auto_124433 ?auto_124434 ?auto_124435 ?auto_124430 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124482 - OBJ
      ?auto_124483 - OBJ
      ?auto_124484 - OBJ
      ?auto_124485 - OBJ
      ?auto_124486 - OBJ
      ?auto_124481 - LOCATION
    )
    :vars
    (
      ?auto_124487 - LOCATION
      ?auto_124492 - CITY
      ?auto_124489 - LOCATION
      ?auto_124488 - LOCATION
      ?auto_124491 - LOCATION
      ?auto_124490 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124487 ?auto_124492 ) ( IN-CITY ?auto_124481 ?auto_124492 ) ( not ( = ?auto_124481 ?auto_124487 ) ) ( OBJ-AT ?auto_124485 ?auto_124487 ) ( IN-CITY ?auto_124489 ?auto_124492 ) ( not ( = ?auto_124481 ?auto_124489 ) ) ( OBJ-AT ?auto_124486 ?auto_124489 ) ( OBJ-AT ?auto_124484 ?auto_124489 ) ( IN-CITY ?auto_124488 ?auto_124492 ) ( not ( = ?auto_124481 ?auto_124488 ) ) ( OBJ-AT ?auto_124482 ?auto_124488 ) ( IN-CITY ?auto_124491 ?auto_124492 ) ( not ( = ?auto_124481 ?auto_124491 ) ) ( OBJ-AT ?auto_124483 ?auto_124491 ) ( TRUCK-AT ?auto_124490 ?auto_124481 ) ( not ( = ?auto_124483 ?auto_124482 ) ) ( not ( = ?auto_124488 ?auto_124491 ) ) ( not ( = ?auto_124483 ?auto_124484 ) ) ( not ( = ?auto_124482 ?auto_124484 ) ) ( not ( = ?auto_124489 ?auto_124488 ) ) ( not ( = ?auto_124489 ?auto_124491 ) ) ( not ( = ?auto_124483 ?auto_124486 ) ) ( not ( = ?auto_124482 ?auto_124486 ) ) ( not ( = ?auto_124484 ?auto_124486 ) ) ( not ( = ?auto_124483 ?auto_124485 ) ) ( not ( = ?auto_124482 ?auto_124485 ) ) ( not ( = ?auto_124484 ?auto_124485 ) ) ( not ( = ?auto_124486 ?auto_124485 ) ) ( not ( = ?auto_124487 ?auto_124489 ) ) ( not ( = ?auto_124487 ?auto_124488 ) ) ( not ( = ?auto_124487 ?auto_124491 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124483 ?auto_124482 ?auto_124484 ?auto_124485 ?auto_124486 ?auto_124481 )
      ( DELIVER-5PKG-VERIFY ?auto_124482 ?auto_124483 ?auto_124484 ?auto_124485 ?auto_124486 ?auto_124481 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124533 - OBJ
      ?auto_124534 - OBJ
      ?auto_124535 - OBJ
      ?auto_124536 - OBJ
      ?auto_124537 - OBJ
      ?auto_124532 - LOCATION
    )
    :vars
    (
      ?auto_124538 - LOCATION
      ?auto_124543 - CITY
      ?auto_124540 - LOCATION
      ?auto_124539 - LOCATION
      ?auto_124542 - LOCATION
      ?auto_124541 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124538 ?auto_124543 ) ( IN-CITY ?auto_124532 ?auto_124543 ) ( not ( = ?auto_124532 ?auto_124538 ) ) ( OBJ-AT ?auto_124537 ?auto_124538 ) ( IN-CITY ?auto_124540 ?auto_124543 ) ( not ( = ?auto_124532 ?auto_124540 ) ) ( OBJ-AT ?auto_124535 ?auto_124540 ) ( OBJ-AT ?auto_124536 ?auto_124540 ) ( IN-CITY ?auto_124539 ?auto_124543 ) ( not ( = ?auto_124532 ?auto_124539 ) ) ( OBJ-AT ?auto_124533 ?auto_124539 ) ( IN-CITY ?auto_124542 ?auto_124543 ) ( not ( = ?auto_124532 ?auto_124542 ) ) ( OBJ-AT ?auto_124534 ?auto_124542 ) ( TRUCK-AT ?auto_124541 ?auto_124532 ) ( not ( = ?auto_124534 ?auto_124533 ) ) ( not ( = ?auto_124539 ?auto_124542 ) ) ( not ( = ?auto_124534 ?auto_124536 ) ) ( not ( = ?auto_124533 ?auto_124536 ) ) ( not ( = ?auto_124540 ?auto_124539 ) ) ( not ( = ?auto_124540 ?auto_124542 ) ) ( not ( = ?auto_124534 ?auto_124535 ) ) ( not ( = ?auto_124533 ?auto_124535 ) ) ( not ( = ?auto_124536 ?auto_124535 ) ) ( not ( = ?auto_124534 ?auto_124537 ) ) ( not ( = ?auto_124533 ?auto_124537 ) ) ( not ( = ?auto_124536 ?auto_124537 ) ) ( not ( = ?auto_124535 ?auto_124537 ) ) ( not ( = ?auto_124538 ?auto_124540 ) ) ( not ( = ?auto_124538 ?auto_124539 ) ) ( not ( = ?auto_124538 ?auto_124542 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124534 ?auto_124533 ?auto_124536 ?auto_124537 ?auto_124535 ?auto_124532 )
      ( DELIVER-5PKG-VERIFY ?auto_124533 ?auto_124534 ?auto_124535 ?auto_124536 ?auto_124537 ?auto_124532 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124584 - OBJ
      ?auto_124585 - OBJ
      ?auto_124586 - OBJ
      ?auto_124587 - OBJ
      ?auto_124588 - OBJ
      ?auto_124583 - LOCATION
    )
    :vars
    (
      ?auto_124589 - LOCATION
      ?auto_124594 - CITY
      ?auto_124591 - LOCATION
      ?auto_124590 - LOCATION
      ?auto_124593 - LOCATION
      ?auto_124592 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124589 ?auto_124594 ) ( IN-CITY ?auto_124583 ?auto_124594 ) ( not ( = ?auto_124583 ?auto_124589 ) ) ( OBJ-AT ?auto_124587 ?auto_124589 ) ( IN-CITY ?auto_124591 ?auto_124594 ) ( not ( = ?auto_124583 ?auto_124591 ) ) ( OBJ-AT ?auto_124586 ?auto_124591 ) ( OBJ-AT ?auto_124588 ?auto_124591 ) ( IN-CITY ?auto_124590 ?auto_124594 ) ( not ( = ?auto_124583 ?auto_124590 ) ) ( OBJ-AT ?auto_124584 ?auto_124590 ) ( IN-CITY ?auto_124593 ?auto_124594 ) ( not ( = ?auto_124583 ?auto_124593 ) ) ( OBJ-AT ?auto_124585 ?auto_124593 ) ( TRUCK-AT ?auto_124592 ?auto_124583 ) ( not ( = ?auto_124585 ?auto_124584 ) ) ( not ( = ?auto_124590 ?auto_124593 ) ) ( not ( = ?auto_124585 ?auto_124588 ) ) ( not ( = ?auto_124584 ?auto_124588 ) ) ( not ( = ?auto_124591 ?auto_124590 ) ) ( not ( = ?auto_124591 ?auto_124593 ) ) ( not ( = ?auto_124585 ?auto_124586 ) ) ( not ( = ?auto_124584 ?auto_124586 ) ) ( not ( = ?auto_124588 ?auto_124586 ) ) ( not ( = ?auto_124585 ?auto_124587 ) ) ( not ( = ?auto_124584 ?auto_124587 ) ) ( not ( = ?auto_124588 ?auto_124587 ) ) ( not ( = ?auto_124586 ?auto_124587 ) ) ( not ( = ?auto_124589 ?auto_124591 ) ) ( not ( = ?auto_124589 ?auto_124590 ) ) ( not ( = ?auto_124589 ?auto_124593 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124585 ?auto_124584 ?auto_124588 ?auto_124587 ?auto_124586 ?auto_124583 )
      ( DELIVER-5PKG-VERIFY ?auto_124584 ?auto_124585 ?auto_124586 ?auto_124587 ?auto_124588 ?auto_124583 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124797 - OBJ
      ?auto_124798 - OBJ
      ?auto_124799 - OBJ
      ?auto_124800 - OBJ
      ?auto_124801 - OBJ
      ?auto_124796 - LOCATION
    )
    :vars
    (
      ?auto_124802 - LOCATION
      ?auto_124807 - CITY
      ?auto_124804 - LOCATION
      ?auto_124803 - LOCATION
      ?auto_124806 - LOCATION
      ?auto_124805 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124802 ?auto_124807 ) ( IN-CITY ?auto_124796 ?auto_124807 ) ( not ( = ?auto_124796 ?auto_124802 ) ) ( OBJ-AT ?auto_124799 ?auto_124802 ) ( IN-CITY ?auto_124804 ?auto_124807 ) ( not ( = ?auto_124796 ?auto_124804 ) ) ( OBJ-AT ?auto_124801 ?auto_124804 ) ( OBJ-AT ?auto_124800 ?auto_124804 ) ( IN-CITY ?auto_124803 ?auto_124807 ) ( not ( = ?auto_124796 ?auto_124803 ) ) ( OBJ-AT ?auto_124797 ?auto_124803 ) ( IN-CITY ?auto_124806 ?auto_124807 ) ( not ( = ?auto_124796 ?auto_124806 ) ) ( OBJ-AT ?auto_124798 ?auto_124806 ) ( TRUCK-AT ?auto_124805 ?auto_124796 ) ( not ( = ?auto_124798 ?auto_124797 ) ) ( not ( = ?auto_124803 ?auto_124806 ) ) ( not ( = ?auto_124798 ?auto_124800 ) ) ( not ( = ?auto_124797 ?auto_124800 ) ) ( not ( = ?auto_124804 ?auto_124803 ) ) ( not ( = ?auto_124804 ?auto_124806 ) ) ( not ( = ?auto_124798 ?auto_124801 ) ) ( not ( = ?auto_124797 ?auto_124801 ) ) ( not ( = ?auto_124800 ?auto_124801 ) ) ( not ( = ?auto_124798 ?auto_124799 ) ) ( not ( = ?auto_124797 ?auto_124799 ) ) ( not ( = ?auto_124800 ?auto_124799 ) ) ( not ( = ?auto_124801 ?auto_124799 ) ) ( not ( = ?auto_124802 ?auto_124804 ) ) ( not ( = ?auto_124802 ?auto_124803 ) ) ( not ( = ?auto_124802 ?auto_124806 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124798 ?auto_124797 ?auto_124800 ?auto_124799 ?auto_124801 ?auto_124796 )
      ( DELIVER-5PKG-VERIFY ?auto_124797 ?auto_124798 ?auto_124799 ?auto_124800 ?auto_124801 ?auto_124796 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124848 - OBJ
      ?auto_124849 - OBJ
      ?auto_124850 - OBJ
      ?auto_124851 - OBJ
      ?auto_124852 - OBJ
      ?auto_124847 - LOCATION
    )
    :vars
    (
      ?auto_124853 - LOCATION
      ?auto_124858 - CITY
      ?auto_124855 - LOCATION
      ?auto_124854 - LOCATION
      ?auto_124857 - LOCATION
      ?auto_124856 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124853 ?auto_124858 ) ( IN-CITY ?auto_124847 ?auto_124858 ) ( not ( = ?auto_124847 ?auto_124853 ) ) ( OBJ-AT ?auto_124850 ?auto_124853 ) ( IN-CITY ?auto_124855 ?auto_124858 ) ( not ( = ?auto_124847 ?auto_124855 ) ) ( OBJ-AT ?auto_124851 ?auto_124855 ) ( OBJ-AT ?auto_124852 ?auto_124855 ) ( IN-CITY ?auto_124854 ?auto_124858 ) ( not ( = ?auto_124847 ?auto_124854 ) ) ( OBJ-AT ?auto_124848 ?auto_124854 ) ( IN-CITY ?auto_124857 ?auto_124858 ) ( not ( = ?auto_124847 ?auto_124857 ) ) ( OBJ-AT ?auto_124849 ?auto_124857 ) ( TRUCK-AT ?auto_124856 ?auto_124847 ) ( not ( = ?auto_124849 ?auto_124848 ) ) ( not ( = ?auto_124854 ?auto_124857 ) ) ( not ( = ?auto_124849 ?auto_124852 ) ) ( not ( = ?auto_124848 ?auto_124852 ) ) ( not ( = ?auto_124855 ?auto_124854 ) ) ( not ( = ?auto_124855 ?auto_124857 ) ) ( not ( = ?auto_124849 ?auto_124851 ) ) ( not ( = ?auto_124848 ?auto_124851 ) ) ( not ( = ?auto_124852 ?auto_124851 ) ) ( not ( = ?auto_124849 ?auto_124850 ) ) ( not ( = ?auto_124848 ?auto_124850 ) ) ( not ( = ?auto_124852 ?auto_124850 ) ) ( not ( = ?auto_124851 ?auto_124850 ) ) ( not ( = ?auto_124853 ?auto_124855 ) ) ( not ( = ?auto_124853 ?auto_124854 ) ) ( not ( = ?auto_124853 ?auto_124857 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124849 ?auto_124848 ?auto_124852 ?auto_124850 ?auto_124851 ?auto_124847 )
      ( DELIVER-5PKG-VERIFY ?auto_124848 ?auto_124849 ?auto_124850 ?auto_124851 ?auto_124852 ?auto_124847 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125836 - OBJ
      ?auto_125837 - OBJ
      ?auto_125838 - OBJ
      ?auto_125839 - OBJ
      ?auto_125840 - OBJ
      ?auto_125835 - LOCATION
    )
    :vars
    (
      ?auto_125841 - LOCATION
      ?auto_125846 - CITY
      ?auto_125843 - LOCATION
      ?auto_125842 - LOCATION
      ?auto_125845 - LOCATION
      ?auto_125844 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125841 ?auto_125846 ) ( IN-CITY ?auto_125835 ?auto_125846 ) ( not ( = ?auto_125835 ?auto_125841 ) ) ( OBJ-AT ?auto_125840 ?auto_125841 ) ( IN-CITY ?auto_125843 ?auto_125846 ) ( not ( = ?auto_125835 ?auto_125843 ) ) ( OBJ-AT ?auto_125839 ?auto_125843 ) ( OBJ-AT ?auto_125837 ?auto_125843 ) ( IN-CITY ?auto_125842 ?auto_125846 ) ( not ( = ?auto_125835 ?auto_125842 ) ) ( OBJ-AT ?auto_125836 ?auto_125842 ) ( IN-CITY ?auto_125845 ?auto_125846 ) ( not ( = ?auto_125835 ?auto_125845 ) ) ( OBJ-AT ?auto_125838 ?auto_125845 ) ( TRUCK-AT ?auto_125844 ?auto_125835 ) ( not ( = ?auto_125838 ?auto_125836 ) ) ( not ( = ?auto_125842 ?auto_125845 ) ) ( not ( = ?auto_125838 ?auto_125837 ) ) ( not ( = ?auto_125836 ?auto_125837 ) ) ( not ( = ?auto_125843 ?auto_125842 ) ) ( not ( = ?auto_125843 ?auto_125845 ) ) ( not ( = ?auto_125838 ?auto_125839 ) ) ( not ( = ?auto_125836 ?auto_125839 ) ) ( not ( = ?auto_125837 ?auto_125839 ) ) ( not ( = ?auto_125838 ?auto_125840 ) ) ( not ( = ?auto_125836 ?auto_125840 ) ) ( not ( = ?auto_125837 ?auto_125840 ) ) ( not ( = ?auto_125839 ?auto_125840 ) ) ( not ( = ?auto_125841 ?auto_125843 ) ) ( not ( = ?auto_125841 ?auto_125842 ) ) ( not ( = ?auto_125841 ?auto_125845 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125838 ?auto_125836 ?auto_125837 ?auto_125840 ?auto_125839 ?auto_125835 )
      ( DELIVER-5PKG-VERIFY ?auto_125836 ?auto_125837 ?auto_125838 ?auto_125839 ?auto_125840 ?auto_125835 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125887 - OBJ
      ?auto_125888 - OBJ
      ?auto_125889 - OBJ
      ?auto_125890 - OBJ
      ?auto_125891 - OBJ
      ?auto_125886 - LOCATION
    )
    :vars
    (
      ?auto_125892 - LOCATION
      ?auto_125897 - CITY
      ?auto_125894 - LOCATION
      ?auto_125893 - LOCATION
      ?auto_125896 - LOCATION
      ?auto_125895 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125892 ?auto_125897 ) ( IN-CITY ?auto_125886 ?auto_125897 ) ( not ( = ?auto_125886 ?auto_125892 ) ) ( OBJ-AT ?auto_125890 ?auto_125892 ) ( IN-CITY ?auto_125894 ?auto_125897 ) ( not ( = ?auto_125886 ?auto_125894 ) ) ( OBJ-AT ?auto_125891 ?auto_125894 ) ( OBJ-AT ?auto_125888 ?auto_125894 ) ( IN-CITY ?auto_125893 ?auto_125897 ) ( not ( = ?auto_125886 ?auto_125893 ) ) ( OBJ-AT ?auto_125887 ?auto_125893 ) ( IN-CITY ?auto_125896 ?auto_125897 ) ( not ( = ?auto_125886 ?auto_125896 ) ) ( OBJ-AT ?auto_125889 ?auto_125896 ) ( TRUCK-AT ?auto_125895 ?auto_125886 ) ( not ( = ?auto_125889 ?auto_125887 ) ) ( not ( = ?auto_125893 ?auto_125896 ) ) ( not ( = ?auto_125889 ?auto_125888 ) ) ( not ( = ?auto_125887 ?auto_125888 ) ) ( not ( = ?auto_125894 ?auto_125893 ) ) ( not ( = ?auto_125894 ?auto_125896 ) ) ( not ( = ?auto_125889 ?auto_125891 ) ) ( not ( = ?auto_125887 ?auto_125891 ) ) ( not ( = ?auto_125888 ?auto_125891 ) ) ( not ( = ?auto_125889 ?auto_125890 ) ) ( not ( = ?auto_125887 ?auto_125890 ) ) ( not ( = ?auto_125888 ?auto_125890 ) ) ( not ( = ?auto_125891 ?auto_125890 ) ) ( not ( = ?auto_125892 ?auto_125894 ) ) ( not ( = ?auto_125892 ?auto_125893 ) ) ( not ( = ?auto_125892 ?auto_125896 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125889 ?auto_125887 ?auto_125888 ?auto_125890 ?auto_125891 ?auto_125886 )
      ( DELIVER-5PKG-VERIFY ?auto_125887 ?auto_125888 ?auto_125889 ?auto_125890 ?auto_125891 ?auto_125886 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126156 - OBJ
      ?auto_126157 - OBJ
      ?auto_126158 - OBJ
      ?auto_126159 - OBJ
      ?auto_126160 - OBJ
      ?auto_126155 - LOCATION
    )
    :vars
    (
      ?auto_126161 - LOCATION
      ?auto_126166 - CITY
      ?auto_126163 - LOCATION
      ?auto_126162 - LOCATION
      ?auto_126165 - LOCATION
      ?auto_126164 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126161 ?auto_126166 ) ( IN-CITY ?auto_126155 ?auto_126166 ) ( not ( = ?auto_126155 ?auto_126161 ) ) ( OBJ-AT ?auto_126160 ?auto_126161 ) ( IN-CITY ?auto_126163 ?auto_126166 ) ( not ( = ?auto_126155 ?auto_126163 ) ) ( OBJ-AT ?auto_126158 ?auto_126163 ) ( OBJ-AT ?auto_126157 ?auto_126163 ) ( IN-CITY ?auto_126162 ?auto_126166 ) ( not ( = ?auto_126155 ?auto_126162 ) ) ( OBJ-AT ?auto_126156 ?auto_126162 ) ( IN-CITY ?auto_126165 ?auto_126166 ) ( not ( = ?auto_126155 ?auto_126165 ) ) ( OBJ-AT ?auto_126159 ?auto_126165 ) ( TRUCK-AT ?auto_126164 ?auto_126155 ) ( not ( = ?auto_126159 ?auto_126156 ) ) ( not ( = ?auto_126162 ?auto_126165 ) ) ( not ( = ?auto_126159 ?auto_126157 ) ) ( not ( = ?auto_126156 ?auto_126157 ) ) ( not ( = ?auto_126163 ?auto_126162 ) ) ( not ( = ?auto_126163 ?auto_126165 ) ) ( not ( = ?auto_126159 ?auto_126158 ) ) ( not ( = ?auto_126156 ?auto_126158 ) ) ( not ( = ?auto_126157 ?auto_126158 ) ) ( not ( = ?auto_126159 ?auto_126160 ) ) ( not ( = ?auto_126156 ?auto_126160 ) ) ( not ( = ?auto_126157 ?auto_126160 ) ) ( not ( = ?auto_126158 ?auto_126160 ) ) ( not ( = ?auto_126161 ?auto_126163 ) ) ( not ( = ?auto_126161 ?auto_126162 ) ) ( not ( = ?auto_126161 ?auto_126165 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126159 ?auto_126156 ?auto_126157 ?auto_126160 ?auto_126158 ?auto_126155 )
      ( DELIVER-5PKG-VERIFY ?auto_126156 ?auto_126157 ?auto_126158 ?auto_126159 ?auto_126160 ?auto_126155 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126207 - OBJ
      ?auto_126208 - OBJ
      ?auto_126209 - OBJ
      ?auto_126210 - OBJ
      ?auto_126211 - OBJ
      ?auto_126206 - LOCATION
    )
    :vars
    (
      ?auto_126212 - LOCATION
      ?auto_126217 - CITY
      ?auto_126214 - LOCATION
      ?auto_126213 - LOCATION
      ?auto_126216 - LOCATION
      ?auto_126215 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126212 ?auto_126217 ) ( IN-CITY ?auto_126206 ?auto_126217 ) ( not ( = ?auto_126206 ?auto_126212 ) ) ( OBJ-AT ?auto_126210 ?auto_126212 ) ( IN-CITY ?auto_126214 ?auto_126217 ) ( not ( = ?auto_126206 ?auto_126214 ) ) ( OBJ-AT ?auto_126209 ?auto_126214 ) ( OBJ-AT ?auto_126208 ?auto_126214 ) ( IN-CITY ?auto_126213 ?auto_126217 ) ( not ( = ?auto_126206 ?auto_126213 ) ) ( OBJ-AT ?auto_126207 ?auto_126213 ) ( IN-CITY ?auto_126216 ?auto_126217 ) ( not ( = ?auto_126206 ?auto_126216 ) ) ( OBJ-AT ?auto_126211 ?auto_126216 ) ( TRUCK-AT ?auto_126215 ?auto_126206 ) ( not ( = ?auto_126211 ?auto_126207 ) ) ( not ( = ?auto_126213 ?auto_126216 ) ) ( not ( = ?auto_126211 ?auto_126208 ) ) ( not ( = ?auto_126207 ?auto_126208 ) ) ( not ( = ?auto_126214 ?auto_126213 ) ) ( not ( = ?auto_126214 ?auto_126216 ) ) ( not ( = ?auto_126211 ?auto_126209 ) ) ( not ( = ?auto_126207 ?auto_126209 ) ) ( not ( = ?auto_126208 ?auto_126209 ) ) ( not ( = ?auto_126211 ?auto_126210 ) ) ( not ( = ?auto_126207 ?auto_126210 ) ) ( not ( = ?auto_126208 ?auto_126210 ) ) ( not ( = ?auto_126209 ?auto_126210 ) ) ( not ( = ?auto_126212 ?auto_126214 ) ) ( not ( = ?auto_126212 ?auto_126213 ) ) ( not ( = ?auto_126212 ?auto_126216 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126211 ?auto_126207 ?auto_126208 ?auto_126210 ?auto_126209 ?auto_126206 )
      ( DELIVER-5PKG-VERIFY ?auto_126207 ?auto_126208 ?auto_126209 ?auto_126210 ?auto_126211 ?auto_126206 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126310 - OBJ
      ?auto_126311 - OBJ
      ?auto_126312 - OBJ
      ?auto_126313 - OBJ
      ?auto_126314 - OBJ
      ?auto_126309 - LOCATION
    )
    :vars
    (
      ?auto_126315 - LOCATION
      ?auto_126320 - CITY
      ?auto_126317 - LOCATION
      ?auto_126316 - LOCATION
      ?auto_126319 - LOCATION
      ?auto_126318 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126315 ?auto_126320 ) ( IN-CITY ?auto_126309 ?auto_126320 ) ( not ( = ?auto_126309 ?auto_126315 ) ) ( OBJ-AT ?auto_126312 ?auto_126315 ) ( IN-CITY ?auto_126317 ?auto_126320 ) ( not ( = ?auto_126309 ?auto_126317 ) ) ( OBJ-AT ?auto_126314 ?auto_126317 ) ( OBJ-AT ?auto_126311 ?auto_126317 ) ( IN-CITY ?auto_126316 ?auto_126320 ) ( not ( = ?auto_126309 ?auto_126316 ) ) ( OBJ-AT ?auto_126310 ?auto_126316 ) ( IN-CITY ?auto_126319 ?auto_126320 ) ( not ( = ?auto_126309 ?auto_126319 ) ) ( OBJ-AT ?auto_126313 ?auto_126319 ) ( TRUCK-AT ?auto_126318 ?auto_126309 ) ( not ( = ?auto_126313 ?auto_126310 ) ) ( not ( = ?auto_126316 ?auto_126319 ) ) ( not ( = ?auto_126313 ?auto_126311 ) ) ( not ( = ?auto_126310 ?auto_126311 ) ) ( not ( = ?auto_126317 ?auto_126316 ) ) ( not ( = ?auto_126317 ?auto_126319 ) ) ( not ( = ?auto_126313 ?auto_126314 ) ) ( not ( = ?auto_126310 ?auto_126314 ) ) ( not ( = ?auto_126311 ?auto_126314 ) ) ( not ( = ?auto_126313 ?auto_126312 ) ) ( not ( = ?auto_126310 ?auto_126312 ) ) ( not ( = ?auto_126311 ?auto_126312 ) ) ( not ( = ?auto_126314 ?auto_126312 ) ) ( not ( = ?auto_126315 ?auto_126317 ) ) ( not ( = ?auto_126315 ?auto_126316 ) ) ( not ( = ?auto_126315 ?auto_126319 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126313 ?auto_126310 ?auto_126311 ?auto_126312 ?auto_126314 ?auto_126309 )
      ( DELIVER-5PKG-VERIFY ?auto_126310 ?auto_126311 ?auto_126312 ?auto_126313 ?auto_126314 ?auto_126309 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126471 - OBJ
      ?auto_126472 - OBJ
      ?auto_126473 - OBJ
      ?auto_126474 - OBJ
      ?auto_126475 - OBJ
      ?auto_126470 - LOCATION
    )
    :vars
    (
      ?auto_126476 - LOCATION
      ?auto_126481 - CITY
      ?auto_126478 - LOCATION
      ?auto_126477 - LOCATION
      ?auto_126480 - LOCATION
      ?auto_126479 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126476 ?auto_126481 ) ( IN-CITY ?auto_126470 ?auto_126481 ) ( not ( = ?auto_126470 ?auto_126476 ) ) ( OBJ-AT ?auto_126473 ?auto_126476 ) ( IN-CITY ?auto_126478 ?auto_126481 ) ( not ( = ?auto_126470 ?auto_126478 ) ) ( OBJ-AT ?auto_126474 ?auto_126478 ) ( OBJ-AT ?auto_126472 ?auto_126478 ) ( IN-CITY ?auto_126477 ?auto_126481 ) ( not ( = ?auto_126470 ?auto_126477 ) ) ( OBJ-AT ?auto_126471 ?auto_126477 ) ( IN-CITY ?auto_126480 ?auto_126481 ) ( not ( = ?auto_126470 ?auto_126480 ) ) ( OBJ-AT ?auto_126475 ?auto_126480 ) ( TRUCK-AT ?auto_126479 ?auto_126470 ) ( not ( = ?auto_126475 ?auto_126471 ) ) ( not ( = ?auto_126477 ?auto_126480 ) ) ( not ( = ?auto_126475 ?auto_126472 ) ) ( not ( = ?auto_126471 ?auto_126472 ) ) ( not ( = ?auto_126478 ?auto_126477 ) ) ( not ( = ?auto_126478 ?auto_126480 ) ) ( not ( = ?auto_126475 ?auto_126474 ) ) ( not ( = ?auto_126471 ?auto_126474 ) ) ( not ( = ?auto_126472 ?auto_126474 ) ) ( not ( = ?auto_126475 ?auto_126473 ) ) ( not ( = ?auto_126471 ?auto_126473 ) ) ( not ( = ?auto_126472 ?auto_126473 ) ) ( not ( = ?auto_126474 ?auto_126473 ) ) ( not ( = ?auto_126476 ?auto_126478 ) ) ( not ( = ?auto_126476 ?auto_126477 ) ) ( not ( = ?auto_126476 ?auto_126480 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126475 ?auto_126471 ?auto_126472 ?auto_126473 ?auto_126474 ?auto_126470 )
      ( DELIVER-5PKG-VERIFY ?auto_126471 ?auto_126472 ?auto_126473 ?auto_126474 ?auto_126475 ?auto_126470 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126629 - OBJ
      ?auto_126630 - OBJ
      ?auto_126631 - OBJ
      ?auto_126632 - OBJ
      ?auto_126633 - OBJ
      ?auto_126628 - LOCATION
    )
    :vars
    (
      ?auto_126634 - LOCATION
      ?auto_126639 - CITY
      ?auto_126636 - LOCATION
      ?auto_126635 - LOCATION
      ?auto_126638 - LOCATION
      ?auto_126637 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126634 ?auto_126639 ) ( IN-CITY ?auto_126628 ?auto_126639 ) ( not ( = ?auto_126628 ?auto_126634 ) ) ( OBJ-AT ?auto_126633 ?auto_126634 ) ( IN-CITY ?auto_126636 ?auto_126639 ) ( not ( = ?auto_126628 ?auto_126636 ) ) ( OBJ-AT ?auto_126630 ?auto_126636 ) ( OBJ-AT ?auto_126632 ?auto_126636 ) ( IN-CITY ?auto_126635 ?auto_126639 ) ( not ( = ?auto_126628 ?auto_126635 ) ) ( OBJ-AT ?auto_126629 ?auto_126635 ) ( IN-CITY ?auto_126638 ?auto_126639 ) ( not ( = ?auto_126628 ?auto_126638 ) ) ( OBJ-AT ?auto_126631 ?auto_126638 ) ( TRUCK-AT ?auto_126637 ?auto_126628 ) ( not ( = ?auto_126631 ?auto_126629 ) ) ( not ( = ?auto_126635 ?auto_126638 ) ) ( not ( = ?auto_126631 ?auto_126632 ) ) ( not ( = ?auto_126629 ?auto_126632 ) ) ( not ( = ?auto_126636 ?auto_126635 ) ) ( not ( = ?auto_126636 ?auto_126638 ) ) ( not ( = ?auto_126631 ?auto_126630 ) ) ( not ( = ?auto_126629 ?auto_126630 ) ) ( not ( = ?auto_126632 ?auto_126630 ) ) ( not ( = ?auto_126631 ?auto_126633 ) ) ( not ( = ?auto_126629 ?auto_126633 ) ) ( not ( = ?auto_126632 ?auto_126633 ) ) ( not ( = ?auto_126630 ?auto_126633 ) ) ( not ( = ?auto_126634 ?auto_126636 ) ) ( not ( = ?auto_126634 ?auto_126635 ) ) ( not ( = ?auto_126634 ?auto_126638 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126631 ?auto_126629 ?auto_126632 ?auto_126633 ?auto_126630 ?auto_126628 )
      ( DELIVER-5PKG-VERIFY ?auto_126629 ?auto_126630 ?auto_126631 ?auto_126632 ?auto_126633 ?auto_126628 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126680 - OBJ
      ?auto_126681 - OBJ
      ?auto_126682 - OBJ
      ?auto_126683 - OBJ
      ?auto_126684 - OBJ
      ?auto_126679 - LOCATION
    )
    :vars
    (
      ?auto_126685 - LOCATION
      ?auto_126690 - CITY
      ?auto_126687 - LOCATION
      ?auto_126686 - LOCATION
      ?auto_126689 - LOCATION
      ?auto_126688 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126685 ?auto_126690 ) ( IN-CITY ?auto_126679 ?auto_126690 ) ( not ( = ?auto_126679 ?auto_126685 ) ) ( OBJ-AT ?auto_126683 ?auto_126685 ) ( IN-CITY ?auto_126687 ?auto_126690 ) ( not ( = ?auto_126679 ?auto_126687 ) ) ( OBJ-AT ?auto_126681 ?auto_126687 ) ( OBJ-AT ?auto_126684 ?auto_126687 ) ( IN-CITY ?auto_126686 ?auto_126690 ) ( not ( = ?auto_126679 ?auto_126686 ) ) ( OBJ-AT ?auto_126680 ?auto_126686 ) ( IN-CITY ?auto_126689 ?auto_126690 ) ( not ( = ?auto_126679 ?auto_126689 ) ) ( OBJ-AT ?auto_126682 ?auto_126689 ) ( TRUCK-AT ?auto_126688 ?auto_126679 ) ( not ( = ?auto_126682 ?auto_126680 ) ) ( not ( = ?auto_126686 ?auto_126689 ) ) ( not ( = ?auto_126682 ?auto_126684 ) ) ( not ( = ?auto_126680 ?auto_126684 ) ) ( not ( = ?auto_126687 ?auto_126686 ) ) ( not ( = ?auto_126687 ?auto_126689 ) ) ( not ( = ?auto_126682 ?auto_126681 ) ) ( not ( = ?auto_126680 ?auto_126681 ) ) ( not ( = ?auto_126684 ?auto_126681 ) ) ( not ( = ?auto_126682 ?auto_126683 ) ) ( not ( = ?auto_126680 ?auto_126683 ) ) ( not ( = ?auto_126684 ?auto_126683 ) ) ( not ( = ?auto_126681 ?auto_126683 ) ) ( not ( = ?auto_126685 ?auto_126687 ) ) ( not ( = ?auto_126685 ?auto_126686 ) ) ( not ( = ?auto_126685 ?auto_126689 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126682 ?auto_126680 ?auto_126684 ?auto_126683 ?auto_126681 ?auto_126679 )
      ( DELIVER-5PKG-VERIFY ?auto_126680 ?auto_126681 ?auto_126682 ?auto_126683 ?auto_126684 ?auto_126679 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126840 - OBJ
      ?auto_126841 - OBJ
      ?auto_126842 - OBJ
      ?auto_126843 - OBJ
      ?auto_126844 - OBJ
      ?auto_126839 - LOCATION
    )
    :vars
    (
      ?auto_126845 - LOCATION
      ?auto_126850 - CITY
      ?auto_126847 - LOCATION
      ?auto_126846 - LOCATION
      ?auto_126849 - LOCATION
      ?auto_126848 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126845 ?auto_126850 ) ( IN-CITY ?auto_126839 ?auto_126850 ) ( not ( = ?auto_126839 ?auto_126845 ) ) ( OBJ-AT ?auto_126844 ?auto_126845 ) ( IN-CITY ?auto_126847 ?auto_126850 ) ( not ( = ?auto_126839 ?auto_126847 ) ) ( OBJ-AT ?auto_126841 ?auto_126847 ) ( OBJ-AT ?auto_126842 ?auto_126847 ) ( IN-CITY ?auto_126846 ?auto_126850 ) ( not ( = ?auto_126839 ?auto_126846 ) ) ( OBJ-AT ?auto_126840 ?auto_126846 ) ( IN-CITY ?auto_126849 ?auto_126850 ) ( not ( = ?auto_126839 ?auto_126849 ) ) ( OBJ-AT ?auto_126843 ?auto_126849 ) ( TRUCK-AT ?auto_126848 ?auto_126839 ) ( not ( = ?auto_126843 ?auto_126840 ) ) ( not ( = ?auto_126846 ?auto_126849 ) ) ( not ( = ?auto_126843 ?auto_126842 ) ) ( not ( = ?auto_126840 ?auto_126842 ) ) ( not ( = ?auto_126847 ?auto_126846 ) ) ( not ( = ?auto_126847 ?auto_126849 ) ) ( not ( = ?auto_126843 ?auto_126841 ) ) ( not ( = ?auto_126840 ?auto_126841 ) ) ( not ( = ?auto_126842 ?auto_126841 ) ) ( not ( = ?auto_126843 ?auto_126844 ) ) ( not ( = ?auto_126840 ?auto_126844 ) ) ( not ( = ?auto_126842 ?auto_126844 ) ) ( not ( = ?auto_126841 ?auto_126844 ) ) ( not ( = ?auto_126845 ?auto_126847 ) ) ( not ( = ?auto_126845 ?auto_126846 ) ) ( not ( = ?auto_126845 ?auto_126849 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126843 ?auto_126840 ?auto_126842 ?auto_126844 ?auto_126841 ?auto_126839 )
      ( DELIVER-5PKG-VERIFY ?auto_126840 ?auto_126841 ?auto_126842 ?auto_126843 ?auto_126844 ?auto_126839 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126891 - OBJ
      ?auto_126892 - OBJ
      ?auto_126893 - OBJ
      ?auto_126894 - OBJ
      ?auto_126895 - OBJ
      ?auto_126890 - LOCATION
    )
    :vars
    (
      ?auto_126896 - LOCATION
      ?auto_126901 - CITY
      ?auto_126898 - LOCATION
      ?auto_126897 - LOCATION
      ?auto_126900 - LOCATION
      ?auto_126899 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126896 ?auto_126901 ) ( IN-CITY ?auto_126890 ?auto_126901 ) ( not ( = ?auto_126890 ?auto_126896 ) ) ( OBJ-AT ?auto_126894 ?auto_126896 ) ( IN-CITY ?auto_126898 ?auto_126901 ) ( not ( = ?auto_126890 ?auto_126898 ) ) ( OBJ-AT ?auto_126892 ?auto_126898 ) ( OBJ-AT ?auto_126893 ?auto_126898 ) ( IN-CITY ?auto_126897 ?auto_126901 ) ( not ( = ?auto_126890 ?auto_126897 ) ) ( OBJ-AT ?auto_126891 ?auto_126897 ) ( IN-CITY ?auto_126900 ?auto_126901 ) ( not ( = ?auto_126890 ?auto_126900 ) ) ( OBJ-AT ?auto_126895 ?auto_126900 ) ( TRUCK-AT ?auto_126899 ?auto_126890 ) ( not ( = ?auto_126895 ?auto_126891 ) ) ( not ( = ?auto_126897 ?auto_126900 ) ) ( not ( = ?auto_126895 ?auto_126893 ) ) ( not ( = ?auto_126891 ?auto_126893 ) ) ( not ( = ?auto_126898 ?auto_126897 ) ) ( not ( = ?auto_126898 ?auto_126900 ) ) ( not ( = ?auto_126895 ?auto_126892 ) ) ( not ( = ?auto_126891 ?auto_126892 ) ) ( not ( = ?auto_126893 ?auto_126892 ) ) ( not ( = ?auto_126895 ?auto_126894 ) ) ( not ( = ?auto_126891 ?auto_126894 ) ) ( not ( = ?auto_126893 ?auto_126894 ) ) ( not ( = ?auto_126892 ?auto_126894 ) ) ( not ( = ?auto_126896 ?auto_126898 ) ) ( not ( = ?auto_126896 ?auto_126897 ) ) ( not ( = ?auto_126896 ?auto_126900 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126895 ?auto_126891 ?auto_126893 ?auto_126894 ?auto_126892 ?auto_126890 )
      ( DELIVER-5PKG-VERIFY ?auto_126891 ?auto_126892 ?auto_126893 ?auto_126894 ?auto_126895 ?auto_126890 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127103 - OBJ
      ?auto_127104 - OBJ
      ?auto_127105 - OBJ
      ?auto_127106 - OBJ
      ?auto_127107 - OBJ
      ?auto_127102 - LOCATION
    )
    :vars
    (
      ?auto_127108 - LOCATION
      ?auto_127113 - CITY
      ?auto_127110 - LOCATION
      ?auto_127109 - LOCATION
      ?auto_127112 - LOCATION
      ?auto_127111 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127108 ?auto_127113 ) ( IN-CITY ?auto_127102 ?auto_127113 ) ( not ( = ?auto_127102 ?auto_127108 ) ) ( OBJ-AT ?auto_127105 ?auto_127108 ) ( IN-CITY ?auto_127110 ?auto_127113 ) ( not ( = ?auto_127102 ?auto_127110 ) ) ( OBJ-AT ?auto_127104 ?auto_127110 ) ( OBJ-AT ?auto_127107 ?auto_127110 ) ( IN-CITY ?auto_127109 ?auto_127113 ) ( not ( = ?auto_127102 ?auto_127109 ) ) ( OBJ-AT ?auto_127103 ?auto_127109 ) ( IN-CITY ?auto_127112 ?auto_127113 ) ( not ( = ?auto_127102 ?auto_127112 ) ) ( OBJ-AT ?auto_127106 ?auto_127112 ) ( TRUCK-AT ?auto_127111 ?auto_127102 ) ( not ( = ?auto_127106 ?auto_127103 ) ) ( not ( = ?auto_127109 ?auto_127112 ) ) ( not ( = ?auto_127106 ?auto_127107 ) ) ( not ( = ?auto_127103 ?auto_127107 ) ) ( not ( = ?auto_127110 ?auto_127109 ) ) ( not ( = ?auto_127110 ?auto_127112 ) ) ( not ( = ?auto_127106 ?auto_127104 ) ) ( not ( = ?auto_127103 ?auto_127104 ) ) ( not ( = ?auto_127107 ?auto_127104 ) ) ( not ( = ?auto_127106 ?auto_127105 ) ) ( not ( = ?auto_127103 ?auto_127105 ) ) ( not ( = ?auto_127107 ?auto_127105 ) ) ( not ( = ?auto_127104 ?auto_127105 ) ) ( not ( = ?auto_127108 ?auto_127110 ) ) ( not ( = ?auto_127108 ?auto_127109 ) ) ( not ( = ?auto_127108 ?auto_127112 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127106 ?auto_127103 ?auto_127107 ?auto_127105 ?auto_127104 ?auto_127102 )
      ( DELIVER-5PKG-VERIFY ?auto_127103 ?auto_127104 ?auto_127105 ?auto_127106 ?auto_127107 ?auto_127102 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127209 - OBJ
      ?auto_127210 - OBJ
      ?auto_127211 - OBJ
      ?auto_127212 - OBJ
      ?auto_127213 - OBJ
      ?auto_127208 - LOCATION
    )
    :vars
    (
      ?auto_127214 - LOCATION
      ?auto_127219 - CITY
      ?auto_127216 - LOCATION
      ?auto_127215 - LOCATION
      ?auto_127218 - LOCATION
      ?auto_127217 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127214 ?auto_127219 ) ( IN-CITY ?auto_127208 ?auto_127219 ) ( not ( = ?auto_127208 ?auto_127214 ) ) ( OBJ-AT ?auto_127211 ?auto_127214 ) ( IN-CITY ?auto_127216 ?auto_127219 ) ( not ( = ?auto_127208 ?auto_127216 ) ) ( OBJ-AT ?auto_127210 ?auto_127216 ) ( OBJ-AT ?auto_127212 ?auto_127216 ) ( IN-CITY ?auto_127215 ?auto_127219 ) ( not ( = ?auto_127208 ?auto_127215 ) ) ( OBJ-AT ?auto_127209 ?auto_127215 ) ( IN-CITY ?auto_127218 ?auto_127219 ) ( not ( = ?auto_127208 ?auto_127218 ) ) ( OBJ-AT ?auto_127213 ?auto_127218 ) ( TRUCK-AT ?auto_127217 ?auto_127208 ) ( not ( = ?auto_127213 ?auto_127209 ) ) ( not ( = ?auto_127215 ?auto_127218 ) ) ( not ( = ?auto_127213 ?auto_127212 ) ) ( not ( = ?auto_127209 ?auto_127212 ) ) ( not ( = ?auto_127216 ?auto_127215 ) ) ( not ( = ?auto_127216 ?auto_127218 ) ) ( not ( = ?auto_127213 ?auto_127210 ) ) ( not ( = ?auto_127209 ?auto_127210 ) ) ( not ( = ?auto_127212 ?auto_127210 ) ) ( not ( = ?auto_127213 ?auto_127211 ) ) ( not ( = ?auto_127209 ?auto_127211 ) ) ( not ( = ?auto_127212 ?auto_127211 ) ) ( not ( = ?auto_127210 ?auto_127211 ) ) ( not ( = ?auto_127214 ?auto_127216 ) ) ( not ( = ?auto_127214 ?auto_127215 ) ) ( not ( = ?auto_127214 ?auto_127218 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127213 ?auto_127209 ?auto_127212 ?auto_127211 ?auto_127210 ?auto_127208 )
      ( DELIVER-5PKG-VERIFY ?auto_127209 ?auto_127210 ?auto_127211 ?auto_127212 ?auto_127213 ?auto_127208 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127584 - OBJ
      ?auto_127585 - OBJ
      ?auto_127586 - OBJ
      ?auto_127587 - OBJ
      ?auto_127588 - OBJ
      ?auto_127583 - LOCATION
    )
    :vars
    (
      ?auto_127589 - LOCATION
      ?auto_127594 - CITY
      ?auto_127591 - LOCATION
      ?auto_127590 - LOCATION
      ?auto_127593 - LOCATION
      ?auto_127592 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127589 ?auto_127594 ) ( IN-CITY ?auto_127583 ?auto_127594 ) ( not ( = ?auto_127583 ?auto_127589 ) ) ( OBJ-AT ?auto_127585 ?auto_127589 ) ( IN-CITY ?auto_127591 ?auto_127594 ) ( not ( = ?auto_127583 ?auto_127591 ) ) ( OBJ-AT ?auto_127588 ?auto_127591 ) ( OBJ-AT ?auto_127587 ?auto_127591 ) ( IN-CITY ?auto_127590 ?auto_127594 ) ( not ( = ?auto_127583 ?auto_127590 ) ) ( OBJ-AT ?auto_127584 ?auto_127590 ) ( IN-CITY ?auto_127593 ?auto_127594 ) ( not ( = ?auto_127583 ?auto_127593 ) ) ( OBJ-AT ?auto_127586 ?auto_127593 ) ( TRUCK-AT ?auto_127592 ?auto_127583 ) ( not ( = ?auto_127586 ?auto_127584 ) ) ( not ( = ?auto_127590 ?auto_127593 ) ) ( not ( = ?auto_127586 ?auto_127587 ) ) ( not ( = ?auto_127584 ?auto_127587 ) ) ( not ( = ?auto_127591 ?auto_127590 ) ) ( not ( = ?auto_127591 ?auto_127593 ) ) ( not ( = ?auto_127586 ?auto_127588 ) ) ( not ( = ?auto_127584 ?auto_127588 ) ) ( not ( = ?auto_127587 ?auto_127588 ) ) ( not ( = ?auto_127586 ?auto_127585 ) ) ( not ( = ?auto_127584 ?auto_127585 ) ) ( not ( = ?auto_127587 ?auto_127585 ) ) ( not ( = ?auto_127588 ?auto_127585 ) ) ( not ( = ?auto_127589 ?auto_127591 ) ) ( not ( = ?auto_127589 ?auto_127590 ) ) ( not ( = ?auto_127589 ?auto_127593 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127586 ?auto_127584 ?auto_127587 ?auto_127585 ?auto_127588 ?auto_127583 )
      ( DELIVER-5PKG-VERIFY ?auto_127584 ?auto_127585 ?auto_127586 ?auto_127587 ?auto_127588 ?auto_127583 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127635 - OBJ
      ?auto_127636 - OBJ
      ?auto_127637 - OBJ
      ?auto_127638 - OBJ
      ?auto_127639 - OBJ
      ?auto_127634 - LOCATION
    )
    :vars
    (
      ?auto_127640 - LOCATION
      ?auto_127645 - CITY
      ?auto_127642 - LOCATION
      ?auto_127641 - LOCATION
      ?auto_127644 - LOCATION
      ?auto_127643 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127640 ?auto_127645 ) ( IN-CITY ?auto_127634 ?auto_127645 ) ( not ( = ?auto_127634 ?auto_127640 ) ) ( OBJ-AT ?auto_127636 ?auto_127640 ) ( IN-CITY ?auto_127642 ?auto_127645 ) ( not ( = ?auto_127634 ?auto_127642 ) ) ( OBJ-AT ?auto_127638 ?auto_127642 ) ( OBJ-AT ?auto_127639 ?auto_127642 ) ( IN-CITY ?auto_127641 ?auto_127645 ) ( not ( = ?auto_127634 ?auto_127641 ) ) ( OBJ-AT ?auto_127635 ?auto_127641 ) ( IN-CITY ?auto_127644 ?auto_127645 ) ( not ( = ?auto_127634 ?auto_127644 ) ) ( OBJ-AT ?auto_127637 ?auto_127644 ) ( TRUCK-AT ?auto_127643 ?auto_127634 ) ( not ( = ?auto_127637 ?auto_127635 ) ) ( not ( = ?auto_127641 ?auto_127644 ) ) ( not ( = ?auto_127637 ?auto_127639 ) ) ( not ( = ?auto_127635 ?auto_127639 ) ) ( not ( = ?auto_127642 ?auto_127641 ) ) ( not ( = ?auto_127642 ?auto_127644 ) ) ( not ( = ?auto_127637 ?auto_127638 ) ) ( not ( = ?auto_127635 ?auto_127638 ) ) ( not ( = ?auto_127639 ?auto_127638 ) ) ( not ( = ?auto_127637 ?auto_127636 ) ) ( not ( = ?auto_127635 ?auto_127636 ) ) ( not ( = ?auto_127639 ?auto_127636 ) ) ( not ( = ?auto_127638 ?auto_127636 ) ) ( not ( = ?auto_127640 ?auto_127642 ) ) ( not ( = ?auto_127640 ?auto_127641 ) ) ( not ( = ?auto_127640 ?auto_127644 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127637 ?auto_127635 ?auto_127639 ?auto_127636 ?auto_127638 ?auto_127634 )
      ( DELIVER-5PKG-VERIFY ?auto_127635 ?auto_127636 ?auto_127637 ?auto_127638 ?auto_127639 ?auto_127634 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128128 - OBJ
      ?auto_128129 - OBJ
      ?auto_128130 - OBJ
      ?auto_128131 - OBJ
      ?auto_128132 - OBJ
      ?auto_128127 - LOCATION
    )
    :vars
    (
      ?auto_128133 - LOCATION
      ?auto_128138 - CITY
      ?auto_128135 - LOCATION
      ?auto_128134 - LOCATION
      ?auto_128137 - LOCATION
      ?auto_128136 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128133 ?auto_128138 ) ( IN-CITY ?auto_128127 ?auto_128138 ) ( not ( = ?auto_128127 ?auto_128133 ) ) ( OBJ-AT ?auto_128129 ?auto_128133 ) ( IN-CITY ?auto_128135 ?auto_128138 ) ( not ( = ?auto_128127 ?auto_128135 ) ) ( OBJ-AT ?auto_128132 ?auto_128135 ) ( OBJ-AT ?auto_128130 ?auto_128135 ) ( IN-CITY ?auto_128134 ?auto_128138 ) ( not ( = ?auto_128127 ?auto_128134 ) ) ( OBJ-AT ?auto_128128 ?auto_128134 ) ( IN-CITY ?auto_128137 ?auto_128138 ) ( not ( = ?auto_128127 ?auto_128137 ) ) ( OBJ-AT ?auto_128131 ?auto_128137 ) ( TRUCK-AT ?auto_128136 ?auto_128127 ) ( not ( = ?auto_128131 ?auto_128128 ) ) ( not ( = ?auto_128134 ?auto_128137 ) ) ( not ( = ?auto_128131 ?auto_128130 ) ) ( not ( = ?auto_128128 ?auto_128130 ) ) ( not ( = ?auto_128135 ?auto_128134 ) ) ( not ( = ?auto_128135 ?auto_128137 ) ) ( not ( = ?auto_128131 ?auto_128132 ) ) ( not ( = ?auto_128128 ?auto_128132 ) ) ( not ( = ?auto_128130 ?auto_128132 ) ) ( not ( = ?auto_128131 ?auto_128129 ) ) ( not ( = ?auto_128128 ?auto_128129 ) ) ( not ( = ?auto_128130 ?auto_128129 ) ) ( not ( = ?auto_128132 ?auto_128129 ) ) ( not ( = ?auto_128133 ?auto_128135 ) ) ( not ( = ?auto_128133 ?auto_128134 ) ) ( not ( = ?auto_128133 ?auto_128137 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128131 ?auto_128128 ?auto_128130 ?auto_128129 ?auto_128132 ?auto_128127 )
      ( DELIVER-5PKG-VERIFY ?auto_128128 ?auto_128129 ?auto_128130 ?auto_128131 ?auto_128132 ?auto_128127 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128289 - OBJ
      ?auto_128290 - OBJ
      ?auto_128291 - OBJ
      ?auto_128292 - OBJ
      ?auto_128293 - OBJ
      ?auto_128288 - LOCATION
    )
    :vars
    (
      ?auto_128294 - LOCATION
      ?auto_128299 - CITY
      ?auto_128296 - LOCATION
      ?auto_128295 - LOCATION
      ?auto_128298 - LOCATION
      ?auto_128297 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128294 ?auto_128299 ) ( IN-CITY ?auto_128288 ?auto_128299 ) ( not ( = ?auto_128288 ?auto_128294 ) ) ( OBJ-AT ?auto_128290 ?auto_128294 ) ( IN-CITY ?auto_128296 ?auto_128299 ) ( not ( = ?auto_128288 ?auto_128296 ) ) ( OBJ-AT ?auto_128292 ?auto_128296 ) ( OBJ-AT ?auto_128291 ?auto_128296 ) ( IN-CITY ?auto_128295 ?auto_128299 ) ( not ( = ?auto_128288 ?auto_128295 ) ) ( OBJ-AT ?auto_128289 ?auto_128295 ) ( IN-CITY ?auto_128298 ?auto_128299 ) ( not ( = ?auto_128288 ?auto_128298 ) ) ( OBJ-AT ?auto_128293 ?auto_128298 ) ( TRUCK-AT ?auto_128297 ?auto_128288 ) ( not ( = ?auto_128293 ?auto_128289 ) ) ( not ( = ?auto_128295 ?auto_128298 ) ) ( not ( = ?auto_128293 ?auto_128291 ) ) ( not ( = ?auto_128289 ?auto_128291 ) ) ( not ( = ?auto_128296 ?auto_128295 ) ) ( not ( = ?auto_128296 ?auto_128298 ) ) ( not ( = ?auto_128293 ?auto_128292 ) ) ( not ( = ?auto_128289 ?auto_128292 ) ) ( not ( = ?auto_128291 ?auto_128292 ) ) ( not ( = ?auto_128293 ?auto_128290 ) ) ( not ( = ?auto_128289 ?auto_128290 ) ) ( not ( = ?auto_128291 ?auto_128290 ) ) ( not ( = ?auto_128292 ?auto_128290 ) ) ( not ( = ?auto_128294 ?auto_128296 ) ) ( not ( = ?auto_128294 ?auto_128295 ) ) ( not ( = ?auto_128294 ?auto_128298 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128293 ?auto_128289 ?auto_128291 ?auto_128290 ?auto_128292 ?auto_128288 )
      ( DELIVER-5PKG-VERIFY ?auto_128289 ?auto_128290 ?auto_128291 ?auto_128292 ?auto_128293 ?auto_128288 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128447 - OBJ
      ?auto_128448 - OBJ
      ?auto_128449 - OBJ
      ?auto_128450 - OBJ
      ?auto_128451 - OBJ
      ?auto_128446 - LOCATION
    )
    :vars
    (
      ?auto_128452 - LOCATION
      ?auto_128457 - CITY
      ?auto_128454 - LOCATION
      ?auto_128453 - LOCATION
      ?auto_128456 - LOCATION
      ?auto_128455 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128452 ?auto_128457 ) ( IN-CITY ?auto_128446 ?auto_128457 ) ( not ( = ?auto_128446 ?auto_128452 ) ) ( OBJ-AT ?auto_128448 ?auto_128452 ) ( IN-CITY ?auto_128454 ?auto_128457 ) ( not ( = ?auto_128446 ?auto_128454 ) ) ( OBJ-AT ?auto_128449 ?auto_128454 ) ( OBJ-AT ?auto_128451 ?auto_128454 ) ( IN-CITY ?auto_128453 ?auto_128457 ) ( not ( = ?auto_128446 ?auto_128453 ) ) ( OBJ-AT ?auto_128447 ?auto_128453 ) ( IN-CITY ?auto_128456 ?auto_128457 ) ( not ( = ?auto_128446 ?auto_128456 ) ) ( OBJ-AT ?auto_128450 ?auto_128456 ) ( TRUCK-AT ?auto_128455 ?auto_128446 ) ( not ( = ?auto_128450 ?auto_128447 ) ) ( not ( = ?auto_128453 ?auto_128456 ) ) ( not ( = ?auto_128450 ?auto_128451 ) ) ( not ( = ?auto_128447 ?auto_128451 ) ) ( not ( = ?auto_128454 ?auto_128453 ) ) ( not ( = ?auto_128454 ?auto_128456 ) ) ( not ( = ?auto_128450 ?auto_128449 ) ) ( not ( = ?auto_128447 ?auto_128449 ) ) ( not ( = ?auto_128451 ?auto_128449 ) ) ( not ( = ?auto_128450 ?auto_128448 ) ) ( not ( = ?auto_128447 ?auto_128448 ) ) ( not ( = ?auto_128451 ?auto_128448 ) ) ( not ( = ?auto_128449 ?auto_128448 ) ) ( not ( = ?auto_128452 ?auto_128454 ) ) ( not ( = ?auto_128452 ?auto_128453 ) ) ( not ( = ?auto_128452 ?auto_128456 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128450 ?auto_128447 ?auto_128451 ?auto_128448 ?auto_128449 ?auto_128446 )
      ( DELIVER-5PKG-VERIFY ?auto_128447 ?auto_128448 ?auto_128449 ?auto_128450 ?auto_128451 ?auto_128446 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128553 - OBJ
      ?auto_128554 - OBJ
      ?auto_128555 - OBJ
      ?auto_128556 - OBJ
      ?auto_128557 - OBJ
      ?auto_128552 - LOCATION
    )
    :vars
    (
      ?auto_128558 - LOCATION
      ?auto_128563 - CITY
      ?auto_128560 - LOCATION
      ?auto_128559 - LOCATION
      ?auto_128562 - LOCATION
      ?auto_128561 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128558 ?auto_128563 ) ( IN-CITY ?auto_128552 ?auto_128563 ) ( not ( = ?auto_128552 ?auto_128558 ) ) ( OBJ-AT ?auto_128554 ?auto_128558 ) ( IN-CITY ?auto_128560 ?auto_128563 ) ( not ( = ?auto_128552 ?auto_128560 ) ) ( OBJ-AT ?auto_128555 ?auto_128560 ) ( OBJ-AT ?auto_128556 ?auto_128560 ) ( IN-CITY ?auto_128559 ?auto_128563 ) ( not ( = ?auto_128552 ?auto_128559 ) ) ( OBJ-AT ?auto_128553 ?auto_128559 ) ( IN-CITY ?auto_128562 ?auto_128563 ) ( not ( = ?auto_128552 ?auto_128562 ) ) ( OBJ-AT ?auto_128557 ?auto_128562 ) ( TRUCK-AT ?auto_128561 ?auto_128552 ) ( not ( = ?auto_128557 ?auto_128553 ) ) ( not ( = ?auto_128559 ?auto_128562 ) ) ( not ( = ?auto_128557 ?auto_128556 ) ) ( not ( = ?auto_128553 ?auto_128556 ) ) ( not ( = ?auto_128560 ?auto_128559 ) ) ( not ( = ?auto_128560 ?auto_128562 ) ) ( not ( = ?auto_128557 ?auto_128555 ) ) ( not ( = ?auto_128553 ?auto_128555 ) ) ( not ( = ?auto_128556 ?auto_128555 ) ) ( not ( = ?auto_128557 ?auto_128554 ) ) ( not ( = ?auto_128553 ?auto_128554 ) ) ( not ( = ?auto_128556 ?auto_128554 ) ) ( not ( = ?auto_128555 ?auto_128554 ) ) ( not ( = ?auto_128558 ?auto_128560 ) ) ( not ( = ?auto_128558 ?auto_128559 ) ) ( not ( = ?auto_128558 ?auto_128562 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128557 ?auto_128553 ?auto_128556 ?auto_128554 ?auto_128555 ?auto_128552 )
      ( DELIVER-5PKG-VERIFY ?auto_128553 ?auto_128554 ?auto_128555 ?auto_128556 ?auto_128557 ?auto_128552 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129262 - OBJ
      ?auto_129263 - OBJ
      ?auto_129264 - OBJ
      ?auto_129265 - OBJ
      ?auto_129266 - OBJ
      ?auto_129261 - LOCATION
    )
    :vars
    (
      ?auto_129267 - LOCATION
      ?auto_129272 - CITY
      ?auto_129269 - LOCATION
      ?auto_129268 - LOCATION
      ?auto_129271 - LOCATION
      ?auto_129270 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129267 ?auto_129272 ) ( IN-CITY ?auto_129261 ?auto_129272 ) ( not ( = ?auto_129261 ?auto_129267 ) ) ( OBJ-AT ?auto_129266 ?auto_129267 ) ( IN-CITY ?auto_129269 ?auto_129272 ) ( not ( = ?auto_129261 ?auto_129269 ) ) ( OBJ-AT ?auto_129265 ?auto_129269 ) ( OBJ-AT ?auto_129262 ?auto_129269 ) ( IN-CITY ?auto_129268 ?auto_129272 ) ( not ( = ?auto_129261 ?auto_129268 ) ) ( OBJ-AT ?auto_129264 ?auto_129268 ) ( IN-CITY ?auto_129271 ?auto_129272 ) ( not ( = ?auto_129261 ?auto_129271 ) ) ( OBJ-AT ?auto_129263 ?auto_129271 ) ( TRUCK-AT ?auto_129270 ?auto_129261 ) ( not ( = ?auto_129263 ?auto_129264 ) ) ( not ( = ?auto_129268 ?auto_129271 ) ) ( not ( = ?auto_129263 ?auto_129262 ) ) ( not ( = ?auto_129264 ?auto_129262 ) ) ( not ( = ?auto_129269 ?auto_129268 ) ) ( not ( = ?auto_129269 ?auto_129271 ) ) ( not ( = ?auto_129263 ?auto_129265 ) ) ( not ( = ?auto_129264 ?auto_129265 ) ) ( not ( = ?auto_129262 ?auto_129265 ) ) ( not ( = ?auto_129263 ?auto_129266 ) ) ( not ( = ?auto_129264 ?auto_129266 ) ) ( not ( = ?auto_129262 ?auto_129266 ) ) ( not ( = ?auto_129265 ?auto_129266 ) ) ( not ( = ?auto_129267 ?auto_129269 ) ) ( not ( = ?auto_129267 ?auto_129268 ) ) ( not ( = ?auto_129267 ?auto_129271 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129263 ?auto_129264 ?auto_129262 ?auto_129266 ?auto_129265 ?auto_129261 )
      ( DELIVER-5PKG-VERIFY ?auto_129262 ?auto_129263 ?auto_129264 ?auto_129265 ?auto_129266 ?auto_129261 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129313 - OBJ
      ?auto_129314 - OBJ
      ?auto_129315 - OBJ
      ?auto_129316 - OBJ
      ?auto_129317 - OBJ
      ?auto_129312 - LOCATION
    )
    :vars
    (
      ?auto_129318 - LOCATION
      ?auto_129323 - CITY
      ?auto_129320 - LOCATION
      ?auto_129319 - LOCATION
      ?auto_129322 - LOCATION
      ?auto_129321 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129318 ?auto_129323 ) ( IN-CITY ?auto_129312 ?auto_129323 ) ( not ( = ?auto_129312 ?auto_129318 ) ) ( OBJ-AT ?auto_129316 ?auto_129318 ) ( IN-CITY ?auto_129320 ?auto_129323 ) ( not ( = ?auto_129312 ?auto_129320 ) ) ( OBJ-AT ?auto_129317 ?auto_129320 ) ( OBJ-AT ?auto_129313 ?auto_129320 ) ( IN-CITY ?auto_129319 ?auto_129323 ) ( not ( = ?auto_129312 ?auto_129319 ) ) ( OBJ-AT ?auto_129315 ?auto_129319 ) ( IN-CITY ?auto_129322 ?auto_129323 ) ( not ( = ?auto_129312 ?auto_129322 ) ) ( OBJ-AT ?auto_129314 ?auto_129322 ) ( TRUCK-AT ?auto_129321 ?auto_129312 ) ( not ( = ?auto_129314 ?auto_129315 ) ) ( not ( = ?auto_129319 ?auto_129322 ) ) ( not ( = ?auto_129314 ?auto_129313 ) ) ( not ( = ?auto_129315 ?auto_129313 ) ) ( not ( = ?auto_129320 ?auto_129319 ) ) ( not ( = ?auto_129320 ?auto_129322 ) ) ( not ( = ?auto_129314 ?auto_129317 ) ) ( not ( = ?auto_129315 ?auto_129317 ) ) ( not ( = ?auto_129313 ?auto_129317 ) ) ( not ( = ?auto_129314 ?auto_129316 ) ) ( not ( = ?auto_129315 ?auto_129316 ) ) ( not ( = ?auto_129313 ?auto_129316 ) ) ( not ( = ?auto_129317 ?auto_129316 ) ) ( not ( = ?auto_129318 ?auto_129320 ) ) ( not ( = ?auto_129318 ?auto_129319 ) ) ( not ( = ?auto_129318 ?auto_129322 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129314 ?auto_129315 ?auto_129313 ?auto_129316 ?auto_129317 ?auto_129312 )
      ( DELIVER-5PKG-VERIFY ?auto_129313 ?auto_129314 ?auto_129315 ?auto_129316 ?auto_129317 ?auto_129312 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129473 - OBJ
      ?auto_129474 - OBJ
      ?auto_129475 - OBJ
      ?auto_129476 - OBJ
      ?auto_129477 - OBJ
      ?auto_129472 - LOCATION
    )
    :vars
    (
      ?auto_129478 - LOCATION
      ?auto_129483 - CITY
      ?auto_129480 - LOCATION
      ?auto_129479 - LOCATION
      ?auto_129482 - LOCATION
      ?auto_129481 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129478 ?auto_129483 ) ( IN-CITY ?auto_129472 ?auto_129483 ) ( not ( = ?auto_129472 ?auto_129478 ) ) ( OBJ-AT ?auto_129477 ?auto_129478 ) ( IN-CITY ?auto_129480 ?auto_129483 ) ( not ( = ?auto_129472 ?auto_129480 ) ) ( OBJ-AT ?auto_129475 ?auto_129480 ) ( OBJ-AT ?auto_129473 ?auto_129480 ) ( IN-CITY ?auto_129479 ?auto_129483 ) ( not ( = ?auto_129472 ?auto_129479 ) ) ( OBJ-AT ?auto_129476 ?auto_129479 ) ( IN-CITY ?auto_129482 ?auto_129483 ) ( not ( = ?auto_129472 ?auto_129482 ) ) ( OBJ-AT ?auto_129474 ?auto_129482 ) ( TRUCK-AT ?auto_129481 ?auto_129472 ) ( not ( = ?auto_129474 ?auto_129476 ) ) ( not ( = ?auto_129479 ?auto_129482 ) ) ( not ( = ?auto_129474 ?auto_129473 ) ) ( not ( = ?auto_129476 ?auto_129473 ) ) ( not ( = ?auto_129480 ?auto_129479 ) ) ( not ( = ?auto_129480 ?auto_129482 ) ) ( not ( = ?auto_129474 ?auto_129475 ) ) ( not ( = ?auto_129476 ?auto_129475 ) ) ( not ( = ?auto_129473 ?auto_129475 ) ) ( not ( = ?auto_129474 ?auto_129477 ) ) ( not ( = ?auto_129476 ?auto_129477 ) ) ( not ( = ?auto_129473 ?auto_129477 ) ) ( not ( = ?auto_129475 ?auto_129477 ) ) ( not ( = ?auto_129478 ?auto_129480 ) ) ( not ( = ?auto_129478 ?auto_129479 ) ) ( not ( = ?auto_129478 ?auto_129482 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129474 ?auto_129476 ?auto_129473 ?auto_129477 ?auto_129475 ?auto_129472 )
      ( DELIVER-5PKG-VERIFY ?auto_129473 ?auto_129474 ?auto_129475 ?auto_129476 ?auto_129477 ?auto_129472 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129524 - OBJ
      ?auto_129525 - OBJ
      ?auto_129526 - OBJ
      ?auto_129527 - OBJ
      ?auto_129528 - OBJ
      ?auto_129523 - LOCATION
    )
    :vars
    (
      ?auto_129529 - LOCATION
      ?auto_129534 - CITY
      ?auto_129531 - LOCATION
      ?auto_129530 - LOCATION
      ?auto_129533 - LOCATION
      ?auto_129532 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129529 ?auto_129534 ) ( IN-CITY ?auto_129523 ?auto_129534 ) ( not ( = ?auto_129523 ?auto_129529 ) ) ( OBJ-AT ?auto_129527 ?auto_129529 ) ( IN-CITY ?auto_129531 ?auto_129534 ) ( not ( = ?auto_129523 ?auto_129531 ) ) ( OBJ-AT ?auto_129526 ?auto_129531 ) ( OBJ-AT ?auto_129524 ?auto_129531 ) ( IN-CITY ?auto_129530 ?auto_129534 ) ( not ( = ?auto_129523 ?auto_129530 ) ) ( OBJ-AT ?auto_129528 ?auto_129530 ) ( IN-CITY ?auto_129533 ?auto_129534 ) ( not ( = ?auto_129523 ?auto_129533 ) ) ( OBJ-AT ?auto_129525 ?auto_129533 ) ( TRUCK-AT ?auto_129532 ?auto_129523 ) ( not ( = ?auto_129525 ?auto_129528 ) ) ( not ( = ?auto_129530 ?auto_129533 ) ) ( not ( = ?auto_129525 ?auto_129524 ) ) ( not ( = ?auto_129528 ?auto_129524 ) ) ( not ( = ?auto_129531 ?auto_129530 ) ) ( not ( = ?auto_129531 ?auto_129533 ) ) ( not ( = ?auto_129525 ?auto_129526 ) ) ( not ( = ?auto_129528 ?auto_129526 ) ) ( not ( = ?auto_129524 ?auto_129526 ) ) ( not ( = ?auto_129525 ?auto_129527 ) ) ( not ( = ?auto_129528 ?auto_129527 ) ) ( not ( = ?auto_129524 ?auto_129527 ) ) ( not ( = ?auto_129526 ?auto_129527 ) ) ( not ( = ?auto_129529 ?auto_129531 ) ) ( not ( = ?auto_129529 ?auto_129530 ) ) ( not ( = ?auto_129529 ?auto_129533 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129525 ?auto_129528 ?auto_129524 ?auto_129527 ?auto_129526 ?auto_129523 )
      ( DELIVER-5PKG-VERIFY ?auto_129524 ?auto_129525 ?auto_129526 ?auto_129527 ?auto_129528 ?auto_129523 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129682 - OBJ
      ?auto_129683 - OBJ
      ?auto_129684 - OBJ
      ?auto_129685 - OBJ
      ?auto_129686 - OBJ
      ?auto_129681 - LOCATION
    )
    :vars
    (
      ?auto_129687 - LOCATION
      ?auto_129692 - CITY
      ?auto_129689 - LOCATION
      ?auto_129688 - LOCATION
      ?auto_129691 - LOCATION
      ?auto_129690 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129687 ?auto_129692 ) ( IN-CITY ?auto_129681 ?auto_129692 ) ( not ( = ?auto_129681 ?auto_129687 ) ) ( OBJ-AT ?auto_129684 ?auto_129687 ) ( IN-CITY ?auto_129689 ?auto_129692 ) ( not ( = ?auto_129681 ?auto_129689 ) ) ( OBJ-AT ?auto_129686 ?auto_129689 ) ( OBJ-AT ?auto_129682 ?auto_129689 ) ( IN-CITY ?auto_129688 ?auto_129692 ) ( not ( = ?auto_129681 ?auto_129688 ) ) ( OBJ-AT ?auto_129685 ?auto_129688 ) ( IN-CITY ?auto_129691 ?auto_129692 ) ( not ( = ?auto_129681 ?auto_129691 ) ) ( OBJ-AT ?auto_129683 ?auto_129691 ) ( TRUCK-AT ?auto_129690 ?auto_129681 ) ( not ( = ?auto_129683 ?auto_129685 ) ) ( not ( = ?auto_129688 ?auto_129691 ) ) ( not ( = ?auto_129683 ?auto_129682 ) ) ( not ( = ?auto_129685 ?auto_129682 ) ) ( not ( = ?auto_129689 ?auto_129688 ) ) ( not ( = ?auto_129689 ?auto_129691 ) ) ( not ( = ?auto_129683 ?auto_129686 ) ) ( not ( = ?auto_129685 ?auto_129686 ) ) ( not ( = ?auto_129682 ?auto_129686 ) ) ( not ( = ?auto_129683 ?auto_129684 ) ) ( not ( = ?auto_129685 ?auto_129684 ) ) ( not ( = ?auto_129682 ?auto_129684 ) ) ( not ( = ?auto_129686 ?auto_129684 ) ) ( not ( = ?auto_129687 ?auto_129689 ) ) ( not ( = ?auto_129687 ?auto_129688 ) ) ( not ( = ?auto_129687 ?auto_129691 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129683 ?auto_129685 ?auto_129682 ?auto_129684 ?auto_129686 ?auto_129681 )
      ( DELIVER-5PKG-VERIFY ?auto_129682 ?auto_129683 ?auto_129684 ?auto_129685 ?auto_129686 ?auto_129681 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129788 - OBJ
      ?auto_129789 - OBJ
      ?auto_129790 - OBJ
      ?auto_129791 - OBJ
      ?auto_129792 - OBJ
      ?auto_129787 - LOCATION
    )
    :vars
    (
      ?auto_129793 - LOCATION
      ?auto_129798 - CITY
      ?auto_129795 - LOCATION
      ?auto_129794 - LOCATION
      ?auto_129797 - LOCATION
      ?auto_129796 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129793 ?auto_129798 ) ( IN-CITY ?auto_129787 ?auto_129798 ) ( not ( = ?auto_129787 ?auto_129793 ) ) ( OBJ-AT ?auto_129790 ?auto_129793 ) ( IN-CITY ?auto_129795 ?auto_129798 ) ( not ( = ?auto_129787 ?auto_129795 ) ) ( OBJ-AT ?auto_129791 ?auto_129795 ) ( OBJ-AT ?auto_129788 ?auto_129795 ) ( IN-CITY ?auto_129794 ?auto_129798 ) ( not ( = ?auto_129787 ?auto_129794 ) ) ( OBJ-AT ?auto_129792 ?auto_129794 ) ( IN-CITY ?auto_129797 ?auto_129798 ) ( not ( = ?auto_129787 ?auto_129797 ) ) ( OBJ-AT ?auto_129789 ?auto_129797 ) ( TRUCK-AT ?auto_129796 ?auto_129787 ) ( not ( = ?auto_129789 ?auto_129792 ) ) ( not ( = ?auto_129794 ?auto_129797 ) ) ( not ( = ?auto_129789 ?auto_129788 ) ) ( not ( = ?auto_129792 ?auto_129788 ) ) ( not ( = ?auto_129795 ?auto_129794 ) ) ( not ( = ?auto_129795 ?auto_129797 ) ) ( not ( = ?auto_129789 ?auto_129791 ) ) ( not ( = ?auto_129792 ?auto_129791 ) ) ( not ( = ?auto_129788 ?auto_129791 ) ) ( not ( = ?auto_129789 ?auto_129790 ) ) ( not ( = ?auto_129792 ?auto_129790 ) ) ( not ( = ?auto_129788 ?auto_129790 ) ) ( not ( = ?auto_129791 ?auto_129790 ) ) ( not ( = ?auto_129793 ?auto_129795 ) ) ( not ( = ?auto_129793 ?auto_129794 ) ) ( not ( = ?auto_129793 ?auto_129797 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129789 ?auto_129792 ?auto_129788 ?auto_129790 ?auto_129791 ?auto_129787 )
      ( DELIVER-5PKG-VERIFY ?auto_129788 ?auto_129789 ?auto_129790 ?auto_129791 ?auto_129792 ?auto_129787 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129946 - OBJ
      ?auto_129947 - OBJ
      ?auto_129948 - OBJ
      ?auto_129949 - OBJ
      ?auto_129950 - OBJ
      ?auto_129945 - LOCATION
    )
    :vars
    (
      ?auto_129951 - LOCATION
      ?auto_129956 - CITY
      ?auto_129953 - LOCATION
      ?auto_129952 - LOCATION
      ?auto_129955 - LOCATION
      ?auto_129954 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129951 ?auto_129956 ) ( IN-CITY ?auto_129945 ?auto_129956 ) ( not ( = ?auto_129945 ?auto_129951 ) ) ( OBJ-AT ?auto_129950 ?auto_129951 ) ( IN-CITY ?auto_129953 ?auto_129956 ) ( not ( = ?auto_129945 ?auto_129953 ) ) ( OBJ-AT ?auto_129949 ?auto_129953 ) ( OBJ-AT ?auto_129946 ?auto_129953 ) ( IN-CITY ?auto_129952 ?auto_129956 ) ( not ( = ?auto_129945 ?auto_129952 ) ) ( OBJ-AT ?auto_129947 ?auto_129952 ) ( IN-CITY ?auto_129955 ?auto_129956 ) ( not ( = ?auto_129945 ?auto_129955 ) ) ( OBJ-AT ?auto_129948 ?auto_129955 ) ( TRUCK-AT ?auto_129954 ?auto_129945 ) ( not ( = ?auto_129948 ?auto_129947 ) ) ( not ( = ?auto_129952 ?auto_129955 ) ) ( not ( = ?auto_129948 ?auto_129946 ) ) ( not ( = ?auto_129947 ?auto_129946 ) ) ( not ( = ?auto_129953 ?auto_129952 ) ) ( not ( = ?auto_129953 ?auto_129955 ) ) ( not ( = ?auto_129948 ?auto_129949 ) ) ( not ( = ?auto_129947 ?auto_129949 ) ) ( not ( = ?auto_129946 ?auto_129949 ) ) ( not ( = ?auto_129948 ?auto_129950 ) ) ( not ( = ?auto_129947 ?auto_129950 ) ) ( not ( = ?auto_129946 ?auto_129950 ) ) ( not ( = ?auto_129949 ?auto_129950 ) ) ( not ( = ?auto_129951 ?auto_129953 ) ) ( not ( = ?auto_129951 ?auto_129952 ) ) ( not ( = ?auto_129951 ?auto_129955 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129948 ?auto_129947 ?auto_129946 ?auto_129950 ?auto_129949 ?auto_129945 )
      ( DELIVER-5PKG-VERIFY ?auto_129946 ?auto_129947 ?auto_129948 ?auto_129949 ?auto_129950 ?auto_129945 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129997 - OBJ
      ?auto_129998 - OBJ
      ?auto_129999 - OBJ
      ?auto_130000 - OBJ
      ?auto_130001 - OBJ
      ?auto_129996 - LOCATION
    )
    :vars
    (
      ?auto_130002 - LOCATION
      ?auto_130007 - CITY
      ?auto_130004 - LOCATION
      ?auto_130003 - LOCATION
      ?auto_130006 - LOCATION
      ?auto_130005 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130002 ?auto_130007 ) ( IN-CITY ?auto_129996 ?auto_130007 ) ( not ( = ?auto_129996 ?auto_130002 ) ) ( OBJ-AT ?auto_130000 ?auto_130002 ) ( IN-CITY ?auto_130004 ?auto_130007 ) ( not ( = ?auto_129996 ?auto_130004 ) ) ( OBJ-AT ?auto_130001 ?auto_130004 ) ( OBJ-AT ?auto_129997 ?auto_130004 ) ( IN-CITY ?auto_130003 ?auto_130007 ) ( not ( = ?auto_129996 ?auto_130003 ) ) ( OBJ-AT ?auto_129998 ?auto_130003 ) ( IN-CITY ?auto_130006 ?auto_130007 ) ( not ( = ?auto_129996 ?auto_130006 ) ) ( OBJ-AT ?auto_129999 ?auto_130006 ) ( TRUCK-AT ?auto_130005 ?auto_129996 ) ( not ( = ?auto_129999 ?auto_129998 ) ) ( not ( = ?auto_130003 ?auto_130006 ) ) ( not ( = ?auto_129999 ?auto_129997 ) ) ( not ( = ?auto_129998 ?auto_129997 ) ) ( not ( = ?auto_130004 ?auto_130003 ) ) ( not ( = ?auto_130004 ?auto_130006 ) ) ( not ( = ?auto_129999 ?auto_130001 ) ) ( not ( = ?auto_129998 ?auto_130001 ) ) ( not ( = ?auto_129997 ?auto_130001 ) ) ( not ( = ?auto_129999 ?auto_130000 ) ) ( not ( = ?auto_129998 ?auto_130000 ) ) ( not ( = ?auto_129997 ?auto_130000 ) ) ( not ( = ?auto_130001 ?auto_130000 ) ) ( not ( = ?auto_130002 ?auto_130004 ) ) ( not ( = ?auto_130002 ?auto_130003 ) ) ( not ( = ?auto_130002 ?auto_130006 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129999 ?auto_129998 ?auto_129997 ?auto_130000 ?auto_130001 ?auto_129996 )
      ( DELIVER-5PKG-VERIFY ?auto_129997 ?auto_129998 ?auto_129999 ?auto_130000 ?auto_130001 ?auto_129996 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130266 - OBJ
      ?auto_130267 - OBJ
      ?auto_130268 - OBJ
      ?auto_130269 - OBJ
      ?auto_130270 - OBJ
      ?auto_130265 - LOCATION
    )
    :vars
    (
      ?auto_130271 - LOCATION
      ?auto_130276 - CITY
      ?auto_130273 - LOCATION
      ?auto_130272 - LOCATION
      ?auto_130275 - LOCATION
      ?auto_130274 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130271 ?auto_130276 ) ( IN-CITY ?auto_130265 ?auto_130276 ) ( not ( = ?auto_130265 ?auto_130271 ) ) ( OBJ-AT ?auto_130270 ?auto_130271 ) ( IN-CITY ?auto_130273 ?auto_130276 ) ( not ( = ?auto_130265 ?auto_130273 ) ) ( OBJ-AT ?auto_130268 ?auto_130273 ) ( OBJ-AT ?auto_130266 ?auto_130273 ) ( IN-CITY ?auto_130272 ?auto_130276 ) ( not ( = ?auto_130265 ?auto_130272 ) ) ( OBJ-AT ?auto_130267 ?auto_130272 ) ( IN-CITY ?auto_130275 ?auto_130276 ) ( not ( = ?auto_130265 ?auto_130275 ) ) ( OBJ-AT ?auto_130269 ?auto_130275 ) ( TRUCK-AT ?auto_130274 ?auto_130265 ) ( not ( = ?auto_130269 ?auto_130267 ) ) ( not ( = ?auto_130272 ?auto_130275 ) ) ( not ( = ?auto_130269 ?auto_130266 ) ) ( not ( = ?auto_130267 ?auto_130266 ) ) ( not ( = ?auto_130273 ?auto_130272 ) ) ( not ( = ?auto_130273 ?auto_130275 ) ) ( not ( = ?auto_130269 ?auto_130268 ) ) ( not ( = ?auto_130267 ?auto_130268 ) ) ( not ( = ?auto_130266 ?auto_130268 ) ) ( not ( = ?auto_130269 ?auto_130270 ) ) ( not ( = ?auto_130267 ?auto_130270 ) ) ( not ( = ?auto_130266 ?auto_130270 ) ) ( not ( = ?auto_130268 ?auto_130270 ) ) ( not ( = ?auto_130271 ?auto_130273 ) ) ( not ( = ?auto_130271 ?auto_130272 ) ) ( not ( = ?auto_130271 ?auto_130275 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130269 ?auto_130267 ?auto_130266 ?auto_130270 ?auto_130268 ?auto_130265 )
      ( DELIVER-5PKG-VERIFY ?auto_130266 ?auto_130267 ?auto_130268 ?auto_130269 ?auto_130270 ?auto_130265 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130317 - OBJ
      ?auto_130318 - OBJ
      ?auto_130319 - OBJ
      ?auto_130320 - OBJ
      ?auto_130321 - OBJ
      ?auto_130316 - LOCATION
    )
    :vars
    (
      ?auto_130322 - LOCATION
      ?auto_130327 - CITY
      ?auto_130324 - LOCATION
      ?auto_130323 - LOCATION
      ?auto_130326 - LOCATION
      ?auto_130325 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130322 ?auto_130327 ) ( IN-CITY ?auto_130316 ?auto_130327 ) ( not ( = ?auto_130316 ?auto_130322 ) ) ( OBJ-AT ?auto_130320 ?auto_130322 ) ( IN-CITY ?auto_130324 ?auto_130327 ) ( not ( = ?auto_130316 ?auto_130324 ) ) ( OBJ-AT ?auto_130319 ?auto_130324 ) ( OBJ-AT ?auto_130317 ?auto_130324 ) ( IN-CITY ?auto_130323 ?auto_130327 ) ( not ( = ?auto_130316 ?auto_130323 ) ) ( OBJ-AT ?auto_130318 ?auto_130323 ) ( IN-CITY ?auto_130326 ?auto_130327 ) ( not ( = ?auto_130316 ?auto_130326 ) ) ( OBJ-AT ?auto_130321 ?auto_130326 ) ( TRUCK-AT ?auto_130325 ?auto_130316 ) ( not ( = ?auto_130321 ?auto_130318 ) ) ( not ( = ?auto_130323 ?auto_130326 ) ) ( not ( = ?auto_130321 ?auto_130317 ) ) ( not ( = ?auto_130318 ?auto_130317 ) ) ( not ( = ?auto_130324 ?auto_130323 ) ) ( not ( = ?auto_130324 ?auto_130326 ) ) ( not ( = ?auto_130321 ?auto_130319 ) ) ( not ( = ?auto_130318 ?auto_130319 ) ) ( not ( = ?auto_130317 ?auto_130319 ) ) ( not ( = ?auto_130321 ?auto_130320 ) ) ( not ( = ?auto_130318 ?auto_130320 ) ) ( not ( = ?auto_130317 ?auto_130320 ) ) ( not ( = ?auto_130319 ?auto_130320 ) ) ( not ( = ?auto_130322 ?auto_130324 ) ) ( not ( = ?auto_130322 ?auto_130323 ) ) ( not ( = ?auto_130322 ?auto_130326 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130321 ?auto_130318 ?auto_130317 ?auto_130320 ?auto_130319 ?auto_130316 )
      ( DELIVER-5PKG-VERIFY ?auto_130317 ?auto_130318 ?auto_130319 ?auto_130320 ?auto_130321 ?auto_130316 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130420 - OBJ
      ?auto_130421 - OBJ
      ?auto_130422 - OBJ
      ?auto_130423 - OBJ
      ?auto_130424 - OBJ
      ?auto_130419 - LOCATION
    )
    :vars
    (
      ?auto_130425 - LOCATION
      ?auto_130430 - CITY
      ?auto_130427 - LOCATION
      ?auto_130426 - LOCATION
      ?auto_130429 - LOCATION
      ?auto_130428 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130425 ?auto_130430 ) ( IN-CITY ?auto_130419 ?auto_130430 ) ( not ( = ?auto_130419 ?auto_130425 ) ) ( OBJ-AT ?auto_130422 ?auto_130425 ) ( IN-CITY ?auto_130427 ?auto_130430 ) ( not ( = ?auto_130419 ?auto_130427 ) ) ( OBJ-AT ?auto_130424 ?auto_130427 ) ( OBJ-AT ?auto_130420 ?auto_130427 ) ( IN-CITY ?auto_130426 ?auto_130430 ) ( not ( = ?auto_130419 ?auto_130426 ) ) ( OBJ-AT ?auto_130421 ?auto_130426 ) ( IN-CITY ?auto_130429 ?auto_130430 ) ( not ( = ?auto_130419 ?auto_130429 ) ) ( OBJ-AT ?auto_130423 ?auto_130429 ) ( TRUCK-AT ?auto_130428 ?auto_130419 ) ( not ( = ?auto_130423 ?auto_130421 ) ) ( not ( = ?auto_130426 ?auto_130429 ) ) ( not ( = ?auto_130423 ?auto_130420 ) ) ( not ( = ?auto_130421 ?auto_130420 ) ) ( not ( = ?auto_130427 ?auto_130426 ) ) ( not ( = ?auto_130427 ?auto_130429 ) ) ( not ( = ?auto_130423 ?auto_130424 ) ) ( not ( = ?auto_130421 ?auto_130424 ) ) ( not ( = ?auto_130420 ?auto_130424 ) ) ( not ( = ?auto_130423 ?auto_130422 ) ) ( not ( = ?auto_130421 ?auto_130422 ) ) ( not ( = ?auto_130420 ?auto_130422 ) ) ( not ( = ?auto_130424 ?auto_130422 ) ) ( not ( = ?auto_130425 ?auto_130427 ) ) ( not ( = ?auto_130425 ?auto_130426 ) ) ( not ( = ?auto_130425 ?auto_130429 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130423 ?auto_130421 ?auto_130420 ?auto_130422 ?auto_130424 ?auto_130419 )
      ( DELIVER-5PKG-VERIFY ?auto_130420 ?auto_130421 ?auto_130422 ?auto_130423 ?auto_130424 ?auto_130419 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130581 - OBJ
      ?auto_130582 - OBJ
      ?auto_130583 - OBJ
      ?auto_130584 - OBJ
      ?auto_130585 - OBJ
      ?auto_130580 - LOCATION
    )
    :vars
    (
      ?auto_130586 - LOCATION
      ?auto_130591 - CITY
      ?auto_130588 - LOCATION
      ?auto_130587 - LOCATION
      ?auto_130590 - LOCATION
      ?auto_130589 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130586 ?auto_130591 ) ( IN-CITY ?auto_130580 ?auto_130591 ) ( not ( = ?auto_130580 ?auto_130586 ) ) ( OBJ-AT ?auto_130583 ?auto_130586 ) ( IN-CITY ?auto_130588 ?auto_130591 ) ( not ( = ?auto_130580 ?auto_130588 ) ) ( OBJ-AT ?auto_130584 ?auto_130588 ) ( OBJ-AT ?auto_130581 ?auto_130588 ) ( IN-CITY ?auto_130587 ?auto_130591 ) ( not ( = ?auto_130580 ?auto_130587 ) ) ( OBJ-AT ?auto_130582 ?auto_130587 ) ( IN-CITY ?auto_130590 ?auto_130591 ) ( not ( = ?auto_130580 ?auto_130590 ) ) ( OBJ-AT ?auto_130585 ?auto_130590 ) ( TRUCK-AT ?auto_130589 ?auto_130580 ) ( not ( = ?auto_130585 ?auto_130582 ) ) ( not ( = ?auto_130587 ?auto_130590 ) ) ( not ( = ?auto_130585 ?auto_130581 ) ) ( not ( = ?auto_130582 ?auto_130581 ) ) ( not ( = ?auto_130588 ?auto_130587 ) ) ( not ( = ?auto_130588 ?auto_130590 ) ) ( not ( = ?auto_130585 ?auto_130584 ) ) ( not ( = ?auto_130582 ?auto_130584 ) ) ( not ( = ?auto_130581 ?auto_130584 ) ) ( not ( = ?auto_130585 ?auto_130583 ) ) ( not ( = ?auto_130582 ?auto_130583 ) ) ( not ( = ?auto_130581 ?auto_130583 ) ) ( not ( = ?auto_130584 ?auto_130583 ) ) ( not ( = ?auto_130586 ?auto_130588 ) ) ( not ( = ?auto_130586 ?auto_130587 ) ) ( not ( = ?auto_130586 ?auto_130590 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130585 ?auto_130582 ?auto_130581 ?auto_130583 ?auto_130584 ?auto_130580 )
      ( DELIVER-5PKG-VERIFY ?auto_130581 ?auto_130582 ?auto_130583 ?auto_130584 ?auto_130585 ?auto_130580 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_131569 - OBJ
      ?auto_131570 - OBJ
      ?auto_131571 - OBJ
      ?auto_131572 - OBJ
      ?auto_131573 - OBJ
      ?auto_131568 - LOCATION
    )
    :vars
    (
      ?auto_131574 - LOCATION
      ?auto_131579 - CITY
      ?auto_131576 - LOCATION
      ?auto_131575 - LOCATION
      ?auto_131578 - LOCATION
      ?auto_131577 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_131574 ?auto_131579 ) ( IN-CITY ?auto_131568 ?auto_131579 ) ( not ( = ?auto_131568 ?auto_131574 ) ) ( OBJ-AT ?auto_131573 ?auto_131574 ) ( IN-CITY ?auto_131576 ?auto_131579 ) ( not ( = ?auto_131568 ?auto_131576 ) ) ( OBJ-AT ?auto_131570 ?auto_131576 ) ( OBJ-AT ?auto_131569 ?auto_131576 ) ( IN-CITY ?auto_131575 ?auto_131579 ) ( not ( = ?auto_131568 ?auto_131575 ) ) ( OBJ-AT ?auto_131572 ?auto_131575 ) ( IN-CITY ?auto_131578 ?auto_131579 ) ( not ( = ?auto_131568 ?auto_131578 ) ) ( OBJ-AT ?auto_131571 ?auto_131578 ) ( TRUCK-AT ?auto_131577 ?auto_131568 ) ( not ( = ?auto_131571 ?auto_131572 ) ) ( not ( = ?auto_131575 ?auto_131578 ) ) ( not ( = ?auto_131571 ?auto_131569 ) ) ( not ( = ?auto_131572 ?auto_131569 ) ) ( not ( = ?auto_131576 ?auto_131575 ) ) ( not ( = ?auto_131576 ?auto_131578 ) ) ( not ( = ?auto_131571 ?auto_131570 ) ) ( not ( = ?auto_131572 ?auto_131570 ) ) ( not ( = ?auto_131569 ?auto_131570 ) ) ( not ( = ?auto_131571 ?auto_131573 ) ) ( not ( = ?auto_131572 ?auto_131573 ) ) ( not ( = ?auto_131569 ?auto_131573 ) ) ( not ( = ?auto_131570 ?auto_131573 ) ) ( not ( = ?auto_131574 ?auto_131576 ) ) ( not ( = ?auto_131574 ?auto_131575 ) ) ( not ( = ?auto_131574 ?auto_131578 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_131571 ?auto_131572 ?auto_131569 ?auto_131573 ?auto_131570 ?auto_131568 )
      ( DELIVER-5PKG-VERIFY ?auto_131569 ?auto_131570 ?auto_131571 ?auto_131572 ?auto_131573 ?auto_131568 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_131620 - OBJ
      ?auto_131621 - OBJ
      ?auto_131622 - OBJ
      ?auto_131623 - OBJ
      ?auto_131624 - OBJ
      ?auto_131619 - LOCATION
    )
    :vars
    (
      ?auto_131625 - LOCATION
      ?auto_131630 - CITY
      ?auto_131627 - LOCATION
      ?auto_131626 - LOCATION
      ?auto_131629 - LOCATION
      ?auto_131628 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_131625 ?auto_131630 ) ( IN-CITY ?auto_131619 ?auto_131630 ) ( not ( = ?auto_131619 ?auto_131625 ) ) ( OBJ-AT ?auto_131623 ?auto_131625 ) ( IN-CITY ?auto_131627 ?auto_131630 ) ( not ( = ?auto_131619 ?auto_131627 ) ) ( OBJ-AT ?auto_131621 ?auto_131627 ) ( OBJ-AT ?auto_131620 ?auto_131627 ) ( IN-CITY ?auto_131626 ?auto_131630 ) ( not ( = ?auto_131619 ?auto_131626 ) ) ( OBJ-AT ?auto_131624 ?auto_131626 ) ( IN-CITY ?auto_131629 ?auto_131630 ) ( not ( = ?auto_131619 ?auto_131629 ) ) ( OBJ-AT ?auto_131622 ?auto_131629 ) ( TRUCK-AT ?auto_131628 ?auto_131619 ) ( not ( = ?auto_131622 ?auto_131624 ) ) ( not ( = ?auto_131626 ?auto_131629 ) ) ( not ( = ?auto_131622 ?auto_131620 ) ) ( not ( = ?auto_131624 ?auto_131620 ) ) ( not ( = ?auto_131627 ?auto_131626 ) ) ( not ( = ?auto_131627 ?auto_131629 ) ) ( not ( = ?auto_131622 ?auto_131621 ) ) ( not ( = ?auto_131624 ?auto_131621 ) ) ( not ( = ?auto_131620 ?auto_131621 ) ) ( not ( = ?auto_131622 ?auto_131623 ) ) ( not ( = ?auto_131624 ?auto_131623 ) ) ( not ( = ?auto_131620 ?auto_131623 ) ) ( not ( = ?auto_131621 ?auto_131623 ) ) ( not ( = ?auto_131625 ?auto_131627 ) ) ( not ( = ?auto_131625 ?auto_131626 ) ) ( not ( = ?auto_131625 ?auto_131629 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_131622 ?auto_131624 ?auto_131620 ?auto_131623 ?auto_131621 ?auto_131619 )
      ( DELIVER-5PKG-VERIFY ?auto_131620 ?auto_131621 ?auto_131622 ?auto_131623 ?auto_131624 ?auto_131619 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_131671 - OBJ
      ?auto_131672 - OBJ
      ?auto_131673 - OBJ
      ?auto_131674 - OBJ
      ?auto_131675 - OBJ
      ?auto_131670 - LOCATION
    )
    :vars
    (
      ?auto_131676 - LOCATION
      ?auto_131681 - CITY
      ?auto_131678 - LOCATION
      ?auto_131677 - LOCATION
      ?auto_131680 - LOCATION
      ?auto_131679 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_131676 ?auto_131681 ) ( IN-CITY ?auto_131670 ?auto_131681 ) ( not ( = ?auto_131670 ?auto_131676 ) ) ( OBJ-AT ?auto_131675 ?auto_131676 ) ( IN-CITY ?auto_131678 ?auto_131681 ) ( not ( = ?auto_131670 ?auto_131678 ) ) ( OBJ-AT ?auto_131672 ?auto_131678 ) ( OBJ-AT ?auto_131671 ?auto_131678 ) ( IN-CITY ?auto_131677 ?auto_131681 ) ( not ( = ?auto_131670 ?auto_131677 ) ) ( OBJ-AT ?auto_131673 ?auto_131677 ) ( IN-CITY ?auto_131680 ?auto_131681 ) ( not ( = ?auto_131670 ?auto_131680 ) ) ( OBJ-AT ?auto_131674 ?auto_131680 ) ( TRUCK-AT ?auto_131679 ?auto_131670 ) ( not ( = ?auto_131674 ?auto_131673 ) ) ( not ( = ?auto_131677 ?auto_131680 ) ) ( not ( = ?auto_131674 ?auto_131671 ) ) ( not ( = ?auto_131673 ?auto_131671 ) ) ( not ( = ?auto_131678 ?auto_131677 ) ) ( not ( = ?auto_131678 ?auto_131680 ) ) ( not ( = ?auto_131674 ?auto_131672 ) ) ( not ( = ?auto_131673 ?auto_131672 ) ) ( not ( = ?auto_131671 ?auto_131672 ) ) ( not ( = ?auto_131674 ?auto_131675 ) ) ( not ( = ?auto_131673 ?auto_131675 ) ) ( not ( = ?auto_131671 ?auto_131675 ) ) ( not ( = ?auto_131672 ?auto_131675 ) ) ( not ( = ?auto_131676 ?auto_131678 ) ) ( not ( = ?auto_131676 ?auto_131677 ) ) ( not ( = ?auto_131676 ?auto_131680 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_131674 ?auto_131673 ?auto_131671 ?auto_131675 ?auto_131672 ?auto_131670 )
      ( DELIVER-5PKG-VERIFY ?auto_131671 ?auto_131672 ?auto_131673 ?auto_131674 ?auto_131675 ?auto_131670 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_131722 - OBJ
      ?auto_131723 - OBJ
      ?auto_131724 - OBJ
      ?auto_131725 - OBJ
      ?auto_131726 - OBJ
      ?auto_131721 - LOCATION
    )
    :vars
    (
      ?auto_131727 - LOCATION
      ?auto_131732 - CITY
      ?auto_131729 - LOCATION
      ?auto_131728 - LOCATION
      ?auto_131731 - LOCATION
      ?auto_131730 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_131727 ?auto_131732 ) ( IN-CITY ?auto_131721 ?auto_131732 ) ( not ( = ?auto_131721 ?auto_131727 ) ) ( OBJ-AT ?auto_131725 ?auto_131727 ) ( IN-CITY ?auto_131729 ?auto_131732 ) ( not ( = ?auto_131721 ?auto_131729 ) ) ( OBJ-AT ?auto_131723 ?auto_131729 ) ( OBJ-AT ?auto_131722 ?auto_131729 ) ( IN-CITY ?auto_131728 ?auto_131732 ) ( not ( = ?auto_131721 ?auto_131728 ) ) ( OBJ-AT ?auto_131724 ?auto_131728 ) ( IN-CITY ?auto_131731 ?auto_131732 ) ( not ( = ?auto_131721 ?auto_131731 ) ) ( OBJ-AT ?auto_131726 ?auto_131731 ) ( TRUCK-AT ?auto_131730 ?auto_131721 ) ( not ( = ?auto_131726 ?auto_131724 ) ) ( not ( = ?auto_131728 ?auto_131731 ) ) ( not ( = ?auto_131726 ?auto_131722 ) ) ( not ( = ?auto_131724 ?auto_131722 ) ) ( not ( = ?auto_131729 ?auto_131728 ) ) ( not ( = ?auto_131729 ?auto_131731 ) ) ( not ( = ?auto_131726 ?auto_131723 ) ) ( not ( = ?auto_131724 ?auto_131723 ) ) ( not ( = ?auto_131722 ?auto_131723 ) ) ( not ( = ?auto_131726 ?auto_131725 ) ) ( not ( = ?auto_131724 ?auto_131725 ) ) ( not ( = ?auto_131722 ?auto_131725 ) ) ( not ( = ?auto_131723 ?auto_131725 ) ) ( not ( = ?auto_131727 ?auto_131729 ) ) ( not ( = ?auto_131727 ?auto_131728 ) ) ( not ( = ?auto_131727 ?auto_131731 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_131726 ?auto_131724 ?auto_131722 ?auto_131725 ?auto_131723 ?auto_131721 )
      ( DELIVER-5PKG-VERIFY ?auto_131722 ?auto_131723 ?auto_131724 ?auto_131725 ?auto_131726 ?auto_131721 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_132043 - OBJ
      ?auto_132044 - OBJ
      ?auto_132045 - OBJ
      ?auto_132046 - OBJ
      ?auto_132047 - OBJ
      ?auto_132042 - LOCATION
    )
    :vars
    (
      ?auto_132048 - LOCATION
      ?auto_132053 - CITY
      ?auto_132050 - LOCATION
      ?auto_132049 - LOCATION
      ?auto_132052 - LOCATION
      ?auto_132051 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_132048 ?auto_132053 ) ( IN-CITY ?auto_132042 ?auto_132053 ) ( not ( = ?auto_132042 ?auto_132048 ) ) ( OBJ-AT ?auto_132045 ?auto_132048 ) ( IN-CITY ?auto_132050 ?auto_132053 ) ( not ( = ?auto_132042 ?auto_132050 ) ) ( OBJ-AT ?auto_132044 ?auto_132050 ) ( OBJ-AT ?auto_132043 ?auto_132050 ) ( IN-CITY ?auto_132049 ?auto_132053 ) ( not ( = ?auto_132042 ?auto_132049 ) ) ( OBJ-AT ?auto_132047 ?auto_132049 ) ( IN-CITY ?auto_132052 ?auto_132053 ) ( not ( = ?auto_132042 ?auto_132052 ) ) ( OBJ-AT ?auto_132046 ?auto_132052 ) ( TRUCK-AT ?auto_132051 ?auto_132042 ) ( not ( = ?auto_132046 ?auto_132047 ) ) ( not ( = ?auto_132049 ?auto_132052 ) ) ( not ( = ?auto_132046 ?auto_132043 ) ) ( not ( = ?auto_132047 ?auto_132043 ) ) ( not ( = ?auto_132050 ?auto_132049 ) ) ( not ( = ?auto_132050 ?auto_132052 ) ) ( not ( = ?auto_132046 ?auto_132044 ) ) ( not ( = ?auto_132047 ?auto_132044 ) ) ( not ( = ?auto_132043 ?auto_132044 ) ) ( not ( = ?auto_132046 ?auto_132045 ) ) ( not ( = ?auto_132047 ?auto_132045 ) ) ( not ( = ?auto_132043 ?auto_132045 ) ) ( not ( = ?auto_132044 ?auto_132045 ) ) ( not ( = ?auto_132048 ?auto_132050 ) ) ( not ( = ?auto_132048 ?auto_132049 ) ) ( not ( = ?auto_132048 ?auto_132052 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_132046 ?auto_132047 ?auto_132043 ?auto_132045 ?auto_132044 ?auto_132042 )
      ( DELIVER-5PKG-VERIFY ?auto_132043 ?auto_132044 ?auto_132045 ?auto_132046 ?auto_132047 ?auto_132042 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_132094 - OBJ
      ?auto_132095 - OBJ
      ?auto_132096 - OBJ
      ?auto_132097 - OBJ
      ?auto_132098 - OBJ
      ?auto_132093 - LOCATION
    )
    :vars
    (
      ?auto_132099 - LOCATION
      ?auto_132104 - CITY
      ?auto_132101 - LOCATION
      ?auto_132100 - LOCATION
      ?auto_132103 - LOCATION
      ?auto_132102 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_132099 ?auto_132104 ) ( IN-CITY ?auto_132093 ?auto_132104 ) ( not ( = ?auto_132093 ?auto_132099 ) ) ( OBJ-AT ?auto_132096 ?auto_132099 ) ( IN-CITY ?auto_132101 ?auto_132104 ) ( not ( = ?auto_132093 ?auto_132101 ) ) ( OBJ-AT ?auto_132095 ?auto_132101 ) ( OBJ-AT ?auto_132094 ?auto_132101 ) ( IN-CITY ?auto_132100 ?auto_132104 ) ( not ( = ?auto_132093 ?auto_132100 ) ) ( OBJ-AT ?auto_132097 ?auto_132100 ) ( IN-CITY ?auto_132103 ?auto_132104 ) ( not ( = ?auto_132093 ?auto_132103 ) ) ( OBJ-AT ?auto_132098 ?auto_132103 ) ( TRUCK-AT ?auto_132102 ?auto_132093 ) ( not ( = ?auto_132098 ?auto_132097 ) ) ( not ( = ?auto_132100 ?auto_132103 ) ) ( not ( = ?auto_132098 ?auto_132094 ) ) ( not ( = ?auto_132097 ?auto_132094 ) ) ( not ( = ?auto_132101 ?auto_132100 ) ) ( not ( = ?auto_132101 ?auto_132103 ) ) ( not ( = ?auto_132098 ?auto_132095 ) ) ( not ( = ?auto_132097 ?auto_132095 ) ) ( not ( = ?auto_132094 ?auto_132095 ) ) ( not ( = ?auto_132098 ?auto_132096 ) ) ( not ( = ?auto_132097 ?auto_132096 ) ) ( not ( = ?auto_132094 ?auto_132096 ) ) ( not ( = ?auto_132095 ?auto_132096 ) ) ( not ( = ?auto_132099 ?auto_132101 ) ) ( not ( = ?auto_132099 ?auto_132100 ) ) ( not ( = ?auto_132099 ?auto_132103 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_132098 ?auto_132097 ?auto_132094 ?auto_132096 ?auto_132095 ?auto_132093 )
      ( DELIVER-5PKG-VERIFY ?auto_132094 ?auto_132095 ?auto_132096 ?auto_132097 ?auto_132098 ?auto_132093 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_132469 - OBJ
      ?auto_132470 - OBJ
      ?auto_132471 - OBJ
      ?auto_132472 - OBJ
      ?auto_132473 - OBJ
      ?auto_132468 - LOCATION
    )
    :vars
    (
      ?auto_132474 - LOCATION
      ?auto_132479 - CITY
      ?auto_132476 - LOCATION
      ?auto_132475 - LOCATION
      ?auto_132478 - LOCATION
      ?auto_132477 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_132474 ?auto_132479 ) ( IN-CITY ?auto_132468 ?auto_132479 ) ( not ( = ?auto_132468 ?auto_132474 ) ) ( OBJ-AT ?auto_132470 ?auto_132474 ) ( IN-CITY ?auto_132476 ?auto_132479 ) ( not ( = ?auto_132468 ?auto_132476 ) ) ( OBJ-AT ?auto_132473 ?auto_132476 ) ( OBJ-AT ?auto_132469 ?auto_132476 ) ( IN-CITY ?auto_132475 ?auto_132479 ) ( not ( = ?auto_132468 ?auto_132475 ) ) ( OBJ-AT ?auto_132472 ?auto_132475 ) ( IN-CITY ?auto_132478 ?auto_132479 ) ( not ( = ?auto_132468 ?auto_132478 ) ) ( OBJ-AT ?auto_132471 ?auto_132478 ) ( TRUCK-AT ?auto_132477 ?auto_132468 ) ( not ( = ?auto_132471 ?auto_132472 ) ) ( not ( = ?auto_132475 ?auto_132478 ) ) ( not ( = ?auto_132471 ?auto_132469 ) ) ( not ( = ?auto_132472 ?auto_132469 ) ) ( not ( = ?auto_132476 ?auto_132475 ) ) ( not ( = ?auto_132476 ?auto_132478 ) ) ( not ( = ?auto_132471 ?auto_132473 ) ) ( not ( = ?auto_132472 ?auto_132473 ) ) ( not ( = ?auto_132469 ?auto_132473 ) ) ( not ( = ?auto_132471 ?auto_132470 ) ) ( not ( = ?auto_132472 ?auto_132470 ) ) ( not ( = ?auto_132469 ?auto_132470 ) ) ( not ( = ?auto_132473 ?auto_132470 ) ) ( not ( = ?auto_132474 ?auto_132476 ) ) ( not ( = ?auto_132474 ?auto_132475 ) ) ( not ( = ?auto_132474 ?auto_132478 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_132471 ?auto_132472 ?auto_132469 ?auto_132470 ?auto_132473 ?auto_132468 )
      ( DELIVER-5PKG-VERIFY ?auto_132469 ?auto_132470 ?auto_132471 ?auto_132472 ?auto_132473 ?auto_132468 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_132575 - OBJ
      ?auto_132576 - OBJ
      ?auto_132577 - OBJ
      ?auto_132578 - OBJ
      ?auto_132579 - OBJ
      ?auto_132574 - LOCATION
    )
    :vars
    (
      ?auto_132580 - LOCATION
      ?auto_132585 - CITY
      ?auto_132582 - LOCATION
      ?auto_132581 - LOCATION
      ?auto_132584 - LOCATION
      ?auto_132583 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_132580 ?auto_132585 ) ( IN-CITY ?auto_132574 ?auto_132585 ) ( not ( = ?auto_132574 ?auto_132580 ) ) ( OBJ-AT ?auto_132576 ?auto_132580 ) ( IN-CITY ?auto_132582 ?auto_132585 ) ( not ( = ?auto_132574 ?auto_132582 ) ) ( OBJ-AT ?auto_132578 ?auto_132582 ) ( OBJ-AT ?auto_132575 ?auto_132582 ) ( IN-CITY ?auto_132581 ?auto_132585 ) ( not ( = ?auto_132574 ?auto_132581 ) ) ( OBJ-AT ?auto_132579 ?auto_132581 ) ( IN-CITY ?auto_132584 ?auto_132585 ) ( not ( = ?auto_132574 ?auto_132584 ) ) ( OBJ-AT ?auto_132577 ?auto_132584 ) ( TRUCK-AT ?auto_132583 ?auto_132574 ) ( not ( = ?auto_132577 ?auto_132579 ) ) ( not ( = ?auto_132581 ?auto_132584 ) ) ( not ( = ?auto_132577 ?auto_132575 ) ) ( not ( = ?auto_132579 ?auto_132575 ) ) ( not ( = ?auto_132582 ?auto_132581 ) ) ( not ( = ?auto_132582 ?auto_132584 ) ) ( not ( = ?auto_132577 ?auto_132578 ) ) ( not ( = ?auto_132579 ?auto_132578 ) ) ( not ( = ?auto_132575 ?auto_132578 ) ) ( not ( = ?auto_132577 ?auto_132576 ) ) ( not ( = ?auto_132579 ?auto_132576 ) ) ( not ( = ?auto_132575 ?auto_132576 ) ) ( not ( = ?auto_132578 ?auto_132576 ) ) ( not ( = ?auto_132580 ?auto_132582 ) ) ( not ( = ?auto_132580 ?auto_132581 ) ) ( not ( = ?auto_132580 ?auto_132584 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_132577 ?auto_132579 ?auto_132575 ?auto_132576 ?auto_132578 ?auto_132574 )
      ( DELIVER-5PKG-VERIFY ?auto_132575 ?auto_132576 ?auto_132577 ?auto_132578 ?auto_132579 ?auto_132574 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_132733 - OBJ
      ?auto_132734 - OBJ
      ?auto_132735 - OBJ
      ?auto_132736 - OBJ
      ?auto_132737 - OBJ
      ?auto_132732 - LOCATION
    )
    :vars
    (
      ?auto_132738 - LOCATION
      ?auto_132743 - CITY
      ?auto_132740 - LOCATION
      ?auto_132739 - LOCATION
      ?auto_132742 - LOCATION
      ?auto_132741 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_132738 ?auto_132743 ) ( IN-CITY ?auto_132732 ?auto_132743 ) ( not ( = ?auto_132732 ?auto_132738 ) ) ( OBJ-AT ?auto_132734 ?auto_132738 ) ( IN-CITY ?auto_132740 ?auto_132743 ) ( not ( = ?auto_132732 ?auto_132740 ) ) ( OBJ-AT ?auto_132737 ?auto_132740 ) ( OBJ-AT ?auto_132733 ?auto_132740 ) ( IN-CITY ?auto_132739 ?auto_132743 ) ( not ( = ?auto_132732 ?auto_132739 ) ) ( OBJ-AT ?auto_132735 ?auto_132739 ) ( IN-CITY ?auto_132742 ?auto_132743 ) ( not ( = ?auto_132732 ?auto_132742 ) ) ( OBJ-AT ?auto_132736 ?auto_132742 ) ( TRUCK-AT ?auto_132741 ?auto_132732 ) ( not ( = ?auto_132736 ?auto_132735 ) ) ( not ( = ?auto_132739 ?auto_132742 ) ) ( not ( = ?auto_132736 ?auto_132733 ) ) ( not ( = ?auto_132735 ?auto_132733 ) ) ( not ( = ?auto_132740 ?auto_132739 ) ) ( not ( = ?auto_132740 ?auto_132742 ) ) ( not ( = ?auto_132736 ?auto_132737 ) ) ( not ( = ?auto_132735 ?auto_132737 ) ) ( not ( = ?auto_132733 ?auto_132737 ) ) ( not ( = ?auto_132736 ?auto_132734 ) ) ( not ( = ?auto_132735 ?auto_132734 ) ) ( not ( = ?auto_132733 ?auto_132734 ) ) ( not ( = ?auto_132737 ?auto_132734 ) ) ( not ( = ?auto_132738 ?auto_132740 ) ) ( not ( = ?auto_132738 ?auto_132739 ) ) ( not ( = ?auto_132738 ?auto_132742 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_132736 ?auto_132735 ?auto_132733 ?auto_132734 ?auto_132737 ?auto_132732 )
      ( DELIVER-5PKG-VERIFY ?auto_132733 ?auto_132734 ?auto_132735 ?auto_132736 ?auto_132737 ?auto_132732 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_132894 - OBJ
      ?auto_132895 - OBJ
      ?auto_132896 - OBJ
      ?auto_132897 - OBJ
      ?auto_132898 - OBJ
      ?auto_132893 - LOCATION
    )
    :vars
    (
      ?auto_132899 - LOCATION
      ?auto_132904 - CITY
      ?auto_132901 - LOCATION
      ?auto_132900 - LOCATION
      ?auto_132903 - LOCATION
      ?auto_132902 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_132899 ?auto_132904 ) ( IN-CITY ?auto_132893 ?auto_132904 ) ( not ( = ?auto_132893 ?auto_132899 ) ) ( OBJ-AT ?auto_132895 ?auto_132899 ) ( IN-CITY ?auto_132901 ?auto_132904 ) ( not ( = ?auto_132893 ?auto_132901 ) ) ( OBJ-AT ?auto_132897 ?auto_132901 ) ( OBJ-AT ?auto_132894 ?auto_132901 ) ( IN-CITY ?auto_132900 ?auto_132904 ) ( not ( = ?auto_132893 ?auto_132900 ) ) ( OBJ-AT ?auto_132896 ?auto_132900 ) ( IN-CITY ?auto_132903 ?auto_132904 ) ( not ( = ?auto_132893 ?auto_132903 ) ) ( OBJ-AT ?auto_132898 ?auto_132903 ) ( TRUCK-AT ?auto_132902 ?auto_132893 ) ( not ( = ?auto_132898 ?auto_132896 ) ) ( not ( = ?auto_132900 ?auto_132903 ) ) ( not ( = ?auto_132898 ?auto_132894 ) ) ( not ( = ?auto_132896 ?auto_132894 ) ) ( not ( = ?auto_132901 ?auto_132900 ) ) ( not ( = ?auto_132901 ?auto_132903 ) ) ( not ( = ?auto_132898 ?auto_132897 ) ) ( not ( = ?auto_132896 ?auto_132897 ) ) ( not ( = ?auto_132894 ?auto_132897 ) ) ( not ( = ?auto_132898 ?auto_132895 ) ) ( not ( = ?auto_132896 ?auto_132895 ) ) ( not ( = ?auto_132894 ?auto_132895 ) ) ( not ( = ?auto_132897 ?auto_132895 ) ) ( not ( = ?auto_132899 ?auto_132901 ) ) ( not ( = ?auto_132899 ?auto_132900 ) ) ( not ( = ?auto_132899 ?auto_132903 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_132898 ?auto_132896 ?auto_132894 ?auto_132895 ?auto_132897 ?auto_132893 )
      ( DELIVER-5PKG-VERIFY ?auto_132894 ?auto_132895 ?auto_132896 ?auto_132897 ?auto_132898 ?auto_132893 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_133387 - OBJ
      ?auto_133388 - OBJ
      ?auto_133389 - OBJ
      ?auto_133390 - OBJ
      ?auto_133391 - OBJ
      ?auto_133386 - LOCATION
    )
    :vars
    (
      ?auto_133392 - LOCATION
      ?auto_133397 - CITY
      ?auto_133394 - LOCATION
      ?auto_133393 - LOCATION
      ?auto_133396 - LOCATION
      ?auto_133395 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_133392 ?auto_133397 ) ( IN-CITY ?auto_133386 ?auto_133397 ) ( not ( = ?auto_133386 ?auto_133392 ) ) ( OBJ-AT ?auto_133388 ?auto_133392 ) ( IN-CITY ?auto_133394 ?auto_133397 ) ( not ( = ?auto_133386 ?auto_133394 ) ) ( OBJ-AT ?auto_133389 ?auto_133394 ) ( OBJ-AT ?auto_133387 ?auto_133394 ) ( IN-CITY ?auto_133393 ?auto_133397 ) ( not ( = ?auto_133386 ?auto_133393 ) ) ( OBJ-AT ?auto_133391 ?auto_133393 ) ( IN-CITY ?auto_133396 ?auto_133397 ) ( not ( = ?auto_133386 ?auto_133396 ) ) ( OBJ-AT ?auto_133390 ?auto_133396 ) ( TRUCK-AT ?auto_133395 ?auto_133386 ) ( not ( = ?auto_133390 ?auto_133391 ) ) ( not ( = ?auto_133393 ?auto_133396 ) ) ( not ( = ?auto_133390 ?auto_133387 ) ) ( not ( = ?auto_133391 ?auto_133387 ) ) ( not ( = ?auto_133394 ?auto_133393 ) ) ( not ( = ?auto_133394 ?auto_133396 ) ) ( not ( = ?auto_133390 ?auto_133389 ) ) ( not ( = ?auto_133391 ?auto_133389 ) ) ( not ( = ?auto_133387 ?auto_133389 ) ) ( not ( = ?auto_133390 ?auto_133388 ) ) ( not ( = ?auto_133391 ?auto_133388 ) ) ( not ( = ?auto_133387 ?auto_133388 ) ) ( not ( = ?auto_133389 ?auto_133388 ) ) ( not ( = ?auto_133392 ?auto_133394 ) ) ( not ( = ?auto_133392 ?auto_133393 ) ) ( not ( = ?auto_133392 ?auto_133396 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_133390 ?auto_133391 ?auto_133387 ?auto_133388 ?auto_133389 ?auto_133386 )
      ( DELIVER-5PKG-VERIFY ?auto_133387 ?auto_133388 ?auto_133389 ?auto_133390 ?auto_133391 ?auto_133386 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_133438 - OBJ
      ?auto_133439 - OBJ
      ?auto_133440 - OBJ
      ?auto_133441 - OBJ
      ?auto_133442 - OBJ
      ?auto_133437 - LOCATION
    )
    :vars
    (
      ?auto_133443 - LOCATION
      ?auto_133448 - CITY
      ?auto_133445 - LOCATION
      ?auto_133444 - LOCATION
      ?auto_133447 - LOCATION
      ?auto_133446 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_133443 ?auto_133448 ) ( IN-CITY ?auto_133437 ?auto_133448 ) ( not ( = ?auto_133437 ?auto_133443 ) ) ( OBJ-AT ?auto_133439 ?auto_133443 ) ( IN-CITY ?auto_133445 ?auto_133448 ) ( not ( = ?auto_133437 ?auto_133445 ) ) ( OBJ-AT ?auto_133440 ?auto_133445 ) ( OBJ-AT ?auto_133438 ?auto_133445 ) ( IN-CITY ?auto_133444 ?auto_133448 ) ( not ( = ?auto_133437 ?auto_133444 ) ) ( OBJ-AT ?auto_133441 ?auto_133444 ) ( IN-CITY ?auto_133447 ?auto_133448 ) ( not ( = ?auto_133437 ?auto_133447 ) ) ( OBJ-AT ?auto_133442 ?auto_133447 ) ( TRUCK-AT ?auto_133446 ?auto_133437 ) ( not ( = ?auto_133442 ?auto_133441 ) ) ( not ( = ?auto_133444 ?auto_133447 ) ) ( not ( = ?auto_133442 ?auto_133438 ) ) ( not ( = ?auto_133441 ?auto_133438 ) ) ( not ( = ?auto_133445 ?auto_133444 ) ) ( not ( = ?auto_133445 ?auto_133447 ) ) ( not ( = ?auto_133442 ?auto_133440 ) ) ( not ( = ?auto_133441 ?auto_133440 ) ) ( not ( = ?auto_133438 ?auto_133440 ) ) ( not ( = ?auto_133442 ?auto_133439 ) ) ( not ( = ?auto_133441 ?auto_133439 ) ) ( not ( = ?auto_133438 ?auto_133439 ) ) ( not ( = ?auto_133440 ?auto_133439 ) ) ( not ( = ?auto_133443 ?auto_133445 ) ) ( not ( = ?auto_133443 ?auto_133444 ) ) ( not ( = ?auto_133443 ?auto_133447 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_133442 ?auto_133441 ?auto_133438 ?auto_133439 ?auto_133440 ?auto_133437 )
      ( DELIVER-5PKG-VERIFY ?auto_133438 ?auto_133439 ?auto_133440 ?auto_133441 ?auto_133442 ?auto_133437 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134202 - OBJ
      ?auto_134203 - OBJ
      ?auto_134204 - OBJ
      ?auto_134205 - OBJ
      ?auto_134206 - OBJ
      ?auto_134201 - LOCATION
    )
    :vars
    (
      ?auto_134207 - LOCATION
      ?auto_134212 - CITY
      ?auto_134209 - LOCATION
      ?auto_134208 - LOCATION
      ?auto_134211 - LOCATION
      ?auto_134210 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134207 ?auto_134212 ) ( IN-CITY ?auto_134201 ?auto_134212 ) ( not ( = ?auto_134201 ?auto_134207 ) ) ( OBJ-AT ?auto_134206 ?auto_134207 ) ( IN-CITY ?auto_134209 ?auto_134212 ) ( not ( = ?auto_134201 ?auto_134209 ) ) ( OBJ-AT ?auto_134202 ?auto_134209 ) ( OBJ-AT ?auto_134205 ?auto_134209 ) ( IN-CITY ?auto_134208 ?auto_134212 ) ( not ( = ?auto_134201 ?auto_134208 ) ) ( OBJ-AT ?auto_134204 ?auto_134208 ) ( IN-CITY ?auto_134211 ?auto_134212 ) ( not ( = ?auto_134201 ?auto_134211 ) ) ( OBJ-AT ?auto_134203 ?auto_134211 ) ( TRUCK-AT ?auto_134210 ?auto_134201 ) ( not ( = ?auto_134203 ?auto_134204 ) ) ( not ( = ?auto_134208 ?auto_134211 ) ) ( not ( = ?auto_134203 ?auto_134205 ) ) ( not ( = ?auto_134204 ?auto_134205 ) ) ( not ( = ?auto_134209 ?auto_134208 ) ) ( not ( = ?auto_134209 ?auto_134211 ) ) ( not ( = ?auto_134203 ?auto_134202 ) ) ( not ( = ?auto_134204 ?auto_134202 ) ) ( not ( = ?auto_134205 ?auto_134202 ) ) ( not ( = ?auto_134203 ?auto_134206 ) ) ( not ( = ?auto_134204 ?auto_134206 ) ) ( not ( = ?auto_134205 ?auto_134206 ) ) ( not ( = ?auto_134202 ?auto_134206 ) ) ( not ( = ?auto_134207 ?auto_134209 ) ) ( not ( = ?auto_134207 ?auto_134208 ) ) ( not ( = ?auto_134207 ?auto_134211 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134203 ?auto_134204 ?auto_134205 ?auto_134206 ?auto_134202 ?auto_134201 )
      ( DELIVER-5PKG-VERIFY ?auto_134202 ?auto_134203 ?auto_134204 ?auto_134205 ?auto_134206 ?auto_134201 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134253 - OBJ
      ?auto_134254 - OBJ
      ?auto_134255 - OBJ
      ?auto_134256 - OBJ
      ?auto_134257 - OBJ
      ?auto_134252 - LOCATION
    )
    :vars
    (
      ?auto_134258 - LOCATION
      ?auto_134263 - CITY
      ?auto_134260 - LOCATION
      ?auto_134259 - LOCATION
      ?auto_134262 - LOCATION
      ?auto_134261 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134258 ?auto_134263 ) ( IN-CITY ?auto_134252 ?auto_134263 ) ( not ( = ?auto_134252 ?auto_134258 ) ) ( OBJ-AT ?auto_134256 ?auto_134258 ) ( IN-CITY ?auto_134260 ?auto_134263 ) ( not ( = ?auto_134252 ?auto_134260 ) ) ( OBJ-AT ?auto_134253 ?auto_134260 ) ( OBJ-AT ?auto_134257 ?auto_134260 ) ( IN-CITY ?auto_134259 ?auto_134263 ) ( not ( = ?auto_134252 ?auto_134259 ) ) ( OBJ-AT ?auto_134255 ?auto_134259 ) ( IN-CITY ?auto_134262 ?auto_134263 ) ( not ( = ?auto_134252 ?auto_134262 ) ) ( OBJ-AT ?auto_134254 ?auto_134262 ) ( TRUCK-AT ?auto_134261 ?auto_134252 ) ( not ( = ?auto_134254 ?auto_134255 ) ) ( not ( = ?auto_134259 ?auto_134262 ) ) ( not ( = ?auto_134254 ?auto_134257 ) ) ( not ( = ?auto_134255 ?auto_134257 ) ) ( not ( = ?auto_134260 ?auto_134259 ) ) ( not ( = ?auto_134260 ?auto_134262 ) ) ( not ( = ?auto_134254 ?auto_134253 ) ) ( not ( = ?auto_134255 ?auto_134253 ) ) ( not ( = ?auto_134257 ?auto_134253 ) ) ( not ( = ?auto_134254 ?auto_134256 ) ) ( not ( = ?auto_134255 ?auto_134256 ) ) ( not ( = ?auto_134257 ?auto_134256 ) ) ( not ( = ?auto_134253 ?auto_134256 ) ) ( not ( = ?auto_134258 ?auto_134260 ) ) ( not ( = ?auto_134258 ?auto_134259 ) ) ( not ( = ?auto_134258 ?auto_134262 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134254 ?auto_134255 ?auto_134257 ?auto_134256 ?auto_134253 ?auto_134252 )
      ( DELIVER-5PKG-VERIFY ?auto_134253 ?auto_134254 ?auto_134255 ?auto_134256 ?auto_134257 ?auto_134252 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134304 - OBJ
      ?auto_134305 - OBJ
      ?auto_134306 - OBJ
      ?auto_134307 - OBJ
      ?auto_134308 - OBJ
      ?auto_134303 - LOCATION
    )
    :vars
    (
      ?auto_134309 - LOCATION
      ?auto_134314 - CITY
      ?auto_134311 - LOCATION
      ?auto_134310 - LOCATION
      ?auto_134313 - LOCATION
      ?auto_134312 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134309 ?auto_134314 ) ( IN-CITY ?auto_134303 ?auto_134314 ) ( not ( = ?auto_134303 ?auto_134309 ) ) ( OBJ-AT ?auto_134308 ?auto_134309 ) ( IN-CITY ?auto_134311 ?auto_134314 ) ( not ( = ?auto_134303 ?auto_134311 ) ) ( OBJ-AT ?auto_134304 ?auto_134311 ) ( OBJ-AT ?auto_134306 ?auto_134311 ) ( IN-CITY ?auto_134310 ?auto_134314 ) ( not ( = ?auto_134303 ?auto_134310 ) ) ( OBJ-AT ?auto_134307 ?auto_134310 ) ( IN-CITY ?auto_134313 ?auto_134314 ) ( not ( = ?auto_134303 ?auto_134313 ) ) ( OBJ-AT ?auto_134305 ?auto_134313 ) ( TRUCK-AT ?auto_134312 ?auto_134303 ) ( not ( = ?auto_134305 ?auto_134307 ) ) ( not ( = ?auto_134310 ?auto_134313 ) ) ( not ( = ?auto_134305 ?auto_134306 ) ) ( not ( = ?auto_134307 ?auto_134306 ) ) ( not ( = ?auto_134311 ?auto_134310 ) ) ( not ( = ?auto_134311 ?auto_134313 ) ) ( not ( = ?auto_134305 ?auto_134304 ) ) ( not ( = ?auto_134307 ?auto_134304 ) ) ( not ( = ?auto_134306 ?auto_134304 ) ) ( not ( = ?auto_134305 ?auto_134308 ) ) ( not ( = ?auto_134307 ?auto_134308 ) ) ( not ( = ?auto_134306 ?auto_134308 ) ) ( not ( = ?auto_134304 ?auto_134308 ) ) ( not ( = ?auto_134309 ?auto_134311 ) ) ( not ( = ?auto_134309 ?auto_134310 ) ) ( not ( = ?auto_134309 ?auto_134313 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134305 ?auto_134307 ?auto_134306 ?auto_134308 ?auto_134304 ?auto_134303 )
      ( DELIVER-5PKG-VERIFY ?auto_134304 ?auto_134305 ?auto_134306 ?auto_134307 ?auto_134308 ?auto_134303 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134355 - OBJ
      ?auto_134356 - OBJ
      ?auto_134357 - OBJ
      ?auto_134358 - OBJ
      ?auto_134359 - OBJ
      ?auto_134354 - LOCATION
    )
    :vars
    (
      ?auto_134360 - LOCATION
      ?auto_134365 - CITY
      ?auto_134362 - LOCATION
      ?auto_134361 - LOCATION
      ?auto_134364 - LOCATION
      ?auto_134363 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134360 ?auto_134365 ) ( IN-CITY ?auto_134354 ?auto_134365 ) ( not ( = ?auto_134354 ?auto_134360 ) ) ( OBJ-AT ?auto_134358 ?auto_134360 ) ( IN-CITY ?auto_134362 ?auto_134365 ) ( not ( = ?auto_134354 ?auto_134362 ) ) ( OBJ-AT ?auto_134355 ?auto_134362 ) ( OBJ-AT ?auto_134357 ?auto_134362 ) ( IN-CITY ?auto_134361 ?auto_134365 ) ( not ( = ?auto_134354 ?auto_134361 ) ) ( OBJ-AT ?auto_134359 ?auto_134361 ) ( IN-CITY ?auto_134364 ?auto_134365 ) ( not ( = ?auto_134354 ?auto_134364 ) ) ( OBJ-AT ?auto_134356 ?auto_134364 ) ( TRUCK-AT ?auto_134363 ?auto_134354 ) ( not ( = ?auto_134356 ?auto_134359 ) ) ( not ( = ?auto_134361 ?auto_134364 ) ) ( not ( = ?auto_134356 ?auto_134357 ) ) ( not ( = ?auto_134359 ?auto_134357 ) ) ( not ( = ?auto_134362 ?auto_134361 ) ) ( not ( = ?auto_134362 ?auto_134364 ) ) ( not ( = ?auto_134356 ?auto_134355 ) ) ( not ( = ?auto_134359 ?auto_134355 ) ) ( not ( = ?auto_134357 ?auto_134355 ) ) ( not ( = ?auto_134356 ?auto_134358 ) ) ( not ( = ?auto_134359 ?auto_134358 ) ) ( not ( = ?auto_134357 ?auto_134358 ) ) ( not ( = ?auto_134355 ?auto_134358 ) ) ( not ( = ?auto_134360 ?auto_134362 ) ) ( not ( = ?auto_134360 ?auto_134361 ) ) ( not ( = ?auto_134360 ?auto_134364 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134356 ?auto_134359 ?auto_134357 ?auto_134358 ?auto_134355 ?auto_134354 )
      ( DELIVER-5PKG-VERIFY ?auto_134355 ?auto_134356 ?auto_134357 ?auto_134358 ?auto_134359 ?auto_134354 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134622 - OBJ
      ?auto_134623 - OBJ
      ?auto_134624 - OBJ
      ?auto_134625 - OBJ
      ?auto_134626 - OBJ
      ?auto_134621 - LOCATION
    )
    :vars
    (
      ?auto_134627 - LOCATION
      ?auto_134632 - CITY
      ?auto_134629 - LOCATION
      ?auto_134628 - LOCATION
      ?auto_134631 - LOCATION
      ?auto_134630 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134627 ?auto_134632 ) ( IN-CITY ?auto_134621 ?auto_134632 ) ( not ( = ?auto_134621 ?auto_134627 ) ) ( OBJ-AT ?auto_134624 ?auto_134627 ) ( IN-CITY ?auto_134629 ?auto_134632 ) ( not ( = ?auto_134621 ?auto_134629 ) ) ( OBJ-AT ?auto_134622 ?auto_134629 ) ( OBJ-AT ?auto_134626 ?auto_134629 ) ( IN-CITY ?auto_134628 ?auto_134632 ) ( not ( = ?auto_134621 ?auto_134628 ) ) ( OBJ-AT ?auto_134625 ?auto_134628 ) ( IN-CITY ?auto_134631 ?auto_134632 ) ( not ( = ?auto_134621 ?auto_134631 ) ) ( OBJ-AT ?auto_134623 ?auto_134631 ) ( TRUCK-AT ?auto_134630 ?auto_134621 ) ( not ( = ?auto_134623 ?auto_134625 ) ) ( not ( = ?auto_134628 ?auto_134631 ) ) ( not ( = ?auto_134623 ?auto_134626 ) ) ( not ( = ?auto_134625 ?auto_134626 ) ) ( not ( = ?auto_134629 ?auto_134628 ) ) ( not ( = ?auto_134629 ?auto_134631 ) ) ( not ( = ?auto_134623 ?auto_134622 ) ) ( not ( = ?auto_134625 ?auto_134622 ) ) ( not ( = ?auto_134626 ?auto_134622 ) ) ( not ( = ?auto_134623 ?auto_134624 ) ) ( not ( = ?auto_134625 ?auto_134624 ) ) ( not ( = ?auto_134626 ?auto_134624 ) ) ( not ( = ?auto_134622 ?auto_134624 ) ) ( not ( = ?auto_134627 ?auto_134629 ) ) ( not ( = ?auto_134627 ?auto_134628 ) ) ( not ( = ?auto_134627 ?auto_134631 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134623 ?auto_134625 ?auto_134626 ?auto_134624 ?auto_134622 ?auto_134621 )
      ( DELIVER-5PKG-VERIFY ?auto_134622 ?auto_134623 ?auto_134624 ?auto_134625 ?auto_134626 ?auto_134621 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134673 - OBJ
      ?auto_134674 - OBJ
      ?auto_134675 - OBJ
      ?auto_134676 - OBJ
      ?auto_134677 - OBJ
      ?auto_134672 - LOCATION
    )
    :vars
    (
      ?auto_134678 - LOCATION
      ?auto_134683 - CITY
      ?auto_134680 - LOCATION
      ?auto_134679 - LOCATION
      ?auto_134682 - LOCATION
      ?auto_134681 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134678 ?auto_134683 ) ( IN-CITY ?auto_134672 ?auto_134683 ) ( not ( = ?auto_134672 ?auto_134678 ) ) ( OBJ-AT ?auto_134675 ?auto_134678 ) ( IN-CITY ?auto_134680 ?auto_134683 ) ( not ( = ?auto_134672 ?auto_134680 ) ) ( OBJ-AT ?auto_134673 ?auto_134680 ) ( OBJ-AT ?auto_134676 ?auto_134680 ) ( IN-CITY ?auto_134679 ?auto_134683 ) ( not ( = ?auto_134672 ?auto_134679 ) ) ( OBJ-AT ?auto_134677 ?auto_134679 ) ( IN-CITY ?auto_134682 ?auto_134683 ) ( not ( = ?auto_134672 ?auto_134682 ) ) ( OBJ-AT ?auto_134674 ?auto_134682 ) ( TRUCK-AT ?auto_134681 ?auto_134672 ) ( not ( = ?auto_134674 ?auto_134677 ) ) ( not ( = ?auto_134679 ?auto_134682 ) ) ( not ( = ?auto_134674 ?auto_134676 ) ) ( not ( = ?auto_134677 ?auto_134676 ) ) ( not ( = ?auto_134680 ?auto_134679 ) ) ( not ( = ?auto_134680 ?auto_134682 ) ) ( not ( = ?auto_134674 ?auto_134673 ) ) ( not ( = ?auto_134677 ?auto_134673 ) ) ( not ( = ?auto_134676 ?auto_134673 ) ) ( not ( = ?auto_134674 ?auto_134675 ) ) ( not ( = ?auto_134677 ?auto_134675 ) ) ( not ( = ?auto_134676 ?auto_134675 ) ) ( not ( = ?auto_134673 ?auto_134675 ) ) ( not ( = ?auto_134678 ?auto_134680 ) ) ( not ( = ?auto_134678 ?auto_134679 ) ) ( not ( = ?auto_134678 ?auto_134682 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134674 ?auto_134677 ?auto_134676 ?auto_134675 ?auto_134673 ?auto_134672 )
      ( DELIVER-5PKG-VERIFY ?auto_134673 ?auto_134674 ?auto_134675 ?auto_134676 ?auto_134677 ?auto_134672 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134886 - OBJ
      ?auto_134887 - OBJ
      ?auto_134888 - OBJ
      ?auto_134889 - OBJ
      ?auto_134890 - OBJ
      ?auto_134885 - LOCATION
    )
    :vars
    (
      ?auto_134891 - LOCATION
      ?auto_134896 - CITY
      ?auto_134893 - LOCATION
      ?auto_134892 - LOCATION
      ?auto_134895 - LOCATION
      ?auto_134894 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134891 ?auto_134896 ) ( IN-CITY ?auto_134885 ?auto_134896 ) ( not ( = ?auto_134885 ?auto_134891 ) ) ( OBJ-AT ?auto_134890 ?auto_134891 ) ( IN-CITY ?auto_134893 ?auto_134896 ) ( not ( = ?auto_134885 ?auto_134893 ) ) ( OBJ-AT ?auto_134886 ?auto_134893 ) ( OBJ-AT ?auto_134889 ?auto_134893 ) ( IN-CITY ?auto_134892 ?auto_134896 ) ( not ( = ?auto_134885 ?auto_134892 ) ) ( OBJ-AT ?auto_134887 ?auto_134892 ) ( IN-CITY ?auto_134895 ?auto_134896 ) ( not ( = ?auto_134885 ?auto_134895 ) ) ( OBJ-AT ?auto_134888 ?auto_134895 ) ( TRUCK-AT ?auto_134894 ?auto_134885 ) ( not ( = ?auto_134888 ?auto_134887 ) ) ( not ( = ?auto_134892 ?auto_134895 ) ) ( not ( = ?auto_134888 ?auto_134889 ) ) ( not ( = ?auto_134887 ?auto_134889 ) ) ( not ( = ?auto_134893 ?auto_134892 ) ) ( not ( = ?auto_134893 ?auto_134895 ) ) ( not ( = ?auto_134888 ?auto_134886 ) ) ( not ( = ?auto_134887 ?auto_134886 ) ) ( not ( = ?auto_134889 ?auto_134886 ) ) ( not ( = ?auto_134888 ?auto_134890 ) ) ( not ( = ?auto_134887 ?auto_134890 ) ) ( not ( = ?auto_134889 ?auto_134890 ) ) ( not ( = ?auto_134886 ?auto_134890 ) ) ( not ( = ?auto_134891 ?auto_134893 ) ) ( not ( = ?auto_134891 ?auto_134892 ) ) ( not ( = ?auto_134891 ?auto_134895 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134888 ?auto_134887 ?auto_134889 ?auto_134890 ?auto_134886 ?auto_134885 )
      ( DELIVER-5PKG-VERIFY ?auto_134886 ?auto_134887 ?auto_134888 ?auto_134889 ?auto_134890 ?auto_134885 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134937 - OBJ
      ?auto_134938 - OBJ
      ?auto_134939 - OBJ
      ?auto_134940 - OBJ
      ?auto_134941 - OBJ
      ?auto_134936 - LOCATION
    )
    :vars
    (
      ?auto_134942 - LOCATION
      ?auto_134947 - CITY
      ?auto_134944 - LOCATION
      ?auto_134943 - LOCATION
      ?auto_134946 - LOCATION
      ?auto_134945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134942 ?auto_134947 ) ( IN-CITY ?auto_134936 ?auto_134947 ) ( not ( = ?auto_134936 ?auto_134942 ) ) ( OBJ-AT ?auto_134940 ?auto_134942 ) ( IN-CITY ?auto_134944 ?auto_134947 ) ( not ( = ?auto_134936 ?auto_134944 ) ) ( OBJ-AT ?auto_134937 ?auto_134944 ) ( OBJ-AT ?auto_134941 ?auto_134944 ) ( IN-CITY ?auto_134943 ?auto_134947 ) ( not ( = ?auto_134936 ?auto_134943 ) ) ( OBJ-AT ?auto_134938 ?auto_134943 ) ( IN-CITY ?auto_134946 ?auto_134947 ) ( not ( = ?auto_134936 ?auto_134946 ) ) ( OBJ-AT ?auto_134939 ?auto_134946 ) ( TRUCK-AT ?auto_134945 ?auto_134936 ) ( not ( = ?auto_134939 ?auto_134938 ) ) ( not ( = ?auto_134943 ?auto_134946 ) ) ( not ( = ?auto_134939 ?auto_134941 ) ) ( not ( = ?auto_134938 ?auto_134941 ) ) ( not ( = ?auto_134944 ?auto_134943 ) ) ( not ( = ?auto_134944 ?auto_134946 ) ) ( not ( = ?auto_134939 ?auto_134937 ) ) ( not ( = ?auto_134938 ?auto_134937 ) ) ( not ( = ?auto_134941 ?auto_134937 ) ) ( not ( = ?auto_134939 ?auto_134940 ) ) ( not ( = ?auto_134938 ?auto_134940 ) ) ( not ( = ?auto_134941 ?auto_134940 ) ) ( not ( = ?auto_134937 ?auto_134940 ) ) ( not ( = ?auto_134942 ?auto_134944 ) ) ( not ( = ?auto_134942 ?auto_134943 ) ) ( not ( = ?auto_134942 ?auto_134946 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134939 ?auto_134938 ?auto_134941 ?auto_134940 ?auto_134937 ?auto_134936 )
      ( DELIVER-5PKG-VERIFY ?auto_134937 ?auto_134938 ?auto_134939 ?auto_134940 ?auto_134941 ?auto_134936 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135097 - OBJ
      ?auto_135098 - OBJ
      ?auto_135099 - OBJ
      ?auto_135100 - OBJ
      ?auto_135101 - OBJ
      ?auto_135096 - LOCATION
    )
    :vars
    (
      ?auto_135102 - LOCATION
      ?auto_135107 - CITY
      ?auto_135104 - LOCATION
      ?auto_135103 - LOCATION
      ?auto_135106 - LOCATION
      ?auto_135105 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135102 ?auto_135107 ) ( IN-CITY ?auto_135096 ?auto_135107 ) ( not ( = ?auto_135096 ?auto_135102 ) ) ( OBJ-AT ?auto_135101 ?auto_135102 ) ( IN-CITY ?auto_135104 ?auto_135107 ) ( not ( = ?auto_135096 ?auto_135104 ) ) ( OBJ-AT ?auto_135097 ?auto_135104 ) ( OBJ-AT ?auto_135099 ?auto_135104 ) ( IN-CITY ?auto_135103 ?auto_135107 ) ( not ( = ?auto_135096 ?auto_135103 ) ) ( OBJ-AT ?auto_135098 ?auto_135103 ) ( IN-CITY ?auto_135106 ?auto_135107 ) ( not ( = ?auto_135096 ?auto_135106 ) ) ( OBJ-AT ?auto_135100 ?auto_135106 ) ( TRUCK-AT ?auto_135105 ?auto_135096 ) ( not ( = ?auto_135100 ?auto_135098 ) ) ( not ( = ?auto_135103 ?auto_135106 ) ) ( not ( = ?auto_135100 ?auto_135099 ) ) ( not ( = ?auto_135098 ?auto_135099 ) ) ( not ( = ?auto_135104 ?auto_135103 ) ) ( not ( = ?auto_135104 ?auto_135106 ) ) ( not ( = ?auto_135100 ?auto_135097 ) ) ( not ( = ?auto_135098 ?auto_135097 ) ) ( not ( = ?auto_135099 ?auto_135097 ) ) ( not ( = ?auto_135100 ?auto_135101 ) ) ( not ( = ?auto_135098 ?auto_135101 ) ) ( not ( = ?auto_135099 ?auto_135101 ) ) ( not ( = ?auto_135097 ?auto_135101 ) ) ( not ( = ?auto_135102 ?auto_135104 ) ) ( not ( = ?auto_135102 ?auto_135103 ) ) ( not ( = ?auto_135102 ?auto_135106 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135100 ?auto_135098 ?auto_135099 ?auto_135101 ?auto_135097 ?auto_135096 )
      ( DELIVER-5PKG-VERIFY ?auto_135097 ?auto_135098 ?auto_135099 ?auto_135100 ?auto_135101 ?auto_135096 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135148 - OBJ
      ?auto_135149 - OBJ
      ?auto_135150 - OBJ
      ?auto_135151 - OBJ
      ?auto_135152 - OBJ
      ?auto_135147 - LOCATION
    )
    :vars
    (
      ?auto_135153 - LOCATION
      ?auto_135158 - CITY
      ?auto_135155 - LOCATION
      ?auto_135154 - LOCATION
      ?auto_135157 - LOCATION
      ?auto_135156 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135153 ?auto_135158 ) ( IN-CITY ?auto_135147 ?auto_135158 ) ( not ( = ?auto_135147 ?auto_135153 ) ) ( OBJ-AT ?auto_135151 ?auto_135153 ) ( IN-CITY ?auto_135155 ?auto_135158 ) ( not ( = ?auto_135147 ?auto_135155 ) ) ( OBJ-AT ?auto_135148 ?auto_135155 ) ( OBJ-AT ?auto_135150 ?auto_135155 ) ( IN-CITY ?auto_135154 ?auto_135158 ) ( not ( = ?auto_135147 ?auto_135154 ) ) ( OBJ-AT ?auto_135149 ?auto_135154 ) ( IN-CITY ?auto_135157 ?auto_135158 ) ( not ( = ?auto_135147 ?auto_135157 ) ) ( OBJ-AT ?auto_135152 ?auto_135157 ) ( TRUCK-AT ?auto_135156 ?auto_135147 ) ( not ( = ?auto_135152 ?auto_135149 ) ) ( not ( = ?auto_135154 ?auto_135157 ) ) ( not ( = ?auto_135152 ?auto_135150 ) ) ( not ( = ?auto_135149 ?auto_135150 ) ) ( not ( = ?auto_135155 ?auto_135154 ) ) ( not ( = ?auto_135155 ?auto_135157 ) ) ( not ( = ?auto_135152 ?auto_135148 ) ) ( not ( = ?auto_135149 ?auto_135148 ) ) ( not ( = ?auto_135150 ?auto_135148 ) ) ( not ( = ?auto_135152 ?auto_135151 ) ) ( not ( = ?auto_135149 ?auto_135151 ) ) ( not ( = ?auto_135150 ?auto_135151 ) ) ( not ( = ?auto_135148 ?auto_135151 ) ) ( not ( = ?auto_135153 ?auto_135155 ) ) ( not ( = ?auto_135153 ?auto_135154 ) ) ( not ( = ?auto_135153 ?auto_135157 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135152 ?auto_135149 ?auto_135150 ?auto_135151 ?auto_135148 ?auto_135147 )
      ( DELIVER-5PKG-VERIFY ?auto_135148 ?auto_135149 ?auto_135150 ?auto_135151 ?auto_135152 ?auto_135147 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135360 - OBJ
      ?auto_135361 - OBJ
      ?auto_135362 - OBJ
      ?auto_135363 - OBJ
      ?auto_135364 - OBJ
      ?auto_135359 - LOCATION
    )
    :vars
    (
      ?auto_135365 - LOCATION
      ?auto_135370 - CITY
      ?auto_135367 - LOCATION
      ?auto_135366 - LOCATION
      ?auto_135369 - LOCATION
      ?auto_135368 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135365 ?auto_135370 ) ( IN-CITY ?auto_135359 ?auto_135370 ) ( not ( = ?auto_135359 ?auto_135365 ) ) ( OBJ-AT ?auto_135362 ?auto_135365 ) ( IN-CITY ?auto_135367 ?auto_135370 ) ( not ( = ?auto_135359 ?auto_135367 ) ) ( OBJ-AT ?auto_135360 ?auto_135367 ) ( OBJ-AT ?auto_135364 ?auto_135367 ) ( IN-CITY ?auto_135366 ?auto_135370 ) ( not ( = ?auto_135359 ?auto_135366 ) ) ( OBJ-AT ?auto_135361 ?auto_135366 ) ( IN-CITY ?auto_135369 ?auto_135370 ) ( not ( = ?auto_135359 ?auto_135369 ) ) ( OBJ-AT ?auto_135363 ?auto_135369 ) ( TRUCK-AT ?auto_135368 ?auto_135359 ) ( not ( = ?auto_135363 ?auto_135361 ) ) ( not ( = ?auto_135366 ?auto_135369 ) ) ( not ( = ?auto_135363 ?auto_135364 ) ) ( not ( = ?auto_135361 ?auto_135364 ) ) ( not ( = ?auto_135367 ?auto_135366 ) ) ( not ( = ?auto_135367 ?auto_135369 ) ) ( not ( = ?auto_135363 ?auto_135360 ) ) ( not ( = ?auto_135361 ?auto_135360 ) ) ( not ( = ?auto_135364 ?auto_135360 ) ) ( not ( = ?auto_135363 ?auto_135362 ) ) ( not ( = ?auto_135361 ?auto_135362 ) ) ( not ( = ?auto_135364 ?auto_135362 ) ) ( not ( = ?auto_135360 ?auto_135362 ) ) ( not ( = ?auto_135365 ?auto_135367 ) ) ( not ( = ?auto_135365 ?auto_135366 ) ) ( not ( = ?auto_135365 ?auto_135369 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135363 ?auto_135361 ?auto_135364 ?auto_135362 ?auto_135360 ?auto_135359 )
      ( DELIVER-5PKG-VERIFY ?auto_135360 ?auto_135361 ?auto_135362 ?auto_135363 ?auto_135364 ?auto_135359 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135466 - OBJ
      ?auto_135467 - OBJ
      ?auto_135468 - OBJ
      ?auto_135469 - OBJ
      ?auto_135470 - OBJ
      ?auto_135465 - LOCATION
    )
    :vars
    (
      ?auto_135471 - LOCATION
      ?auto_135476 - CITY
      ?auto_135473 - LOCATION
      ?auto_135472 - LOCATION
      ?auto_135475 - LOCATION
      ?auto_135474 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135471 ?auto_135476 ) ( IN-CITY ?auto_135465 ?auto_135476 ) ( not ( = ?auto_135465 ?auto_135471 ) ) ( OBJ-AT ?auto_135468 ?auto_135471 ) ( IN-CITY ?auto_135473 ?auto_135476 ) ( not ( = ?auto_135465 ?auto_135473 ) ) ( OBJ-AT ?auto_135466 ?auto_135473 ) ( OBJ-AT ?auto_135469 ?auto_135473 ) ( IN-CITY ?auto_135472 ?auto_135476 ) ( not ( = ?auto_135465 ?auto_135472 ) ) ( OBJ-AT ?auto_135467 ?auto_135472 ) ( IN-CITY ?auto_135475 ?auto_135476 ) ( not ( = ?auto_135465 ?auto_135475 ) ) ( OBJ-AT ?auto_135470 ?auto_135475 ) ( TRUCK-AT ?auto_135474 ?auto_135465 ) ( not ( = ?auto_135470 ?auto_135467 ) ) ( not ( = ?auto_135472 ?auto_135475 ) ) ( not ( = ?auto_135470 ?auto_135469 ) ) ( not ( = ?auto_135467 ?auto_135469 ) ) ( not ( = ?auto_135473 ?auto_135472 ) ) ( not ( = ?auto_135473 ?auto_135475 ) ) ( not ( = ?auto_135470 ?auto_135466 ) ) ( not ( = ?auto_135467 ?auto_135466 ) ) ( not ( = ?auto_135469 ?auto_135466 ) ) ( not ( = ?auto_135470 ?auto_135468 ) ) ( not ( = ?auto_135467 ?auto_135468 ) ) ( not ( = ?auto_135469 ?auto_135468 ) ) ( not ( = ?auto_135466 ?auto_135468 ) ) ( not ( = ?auto_135471 ?auto_135473 ) ) ( not ( = ?auto_135471 ?auto_135472 ) ) ( not ( = ?auto_135471 ?auto_135475 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135470 ?auto_135467 ?auto_135469 ?auto_135468 ?auto_135466 ?auto_135465 )
      ( DELIVER-5PKG-VERIFY ?auto_135466 ?auto_135467 ?auto_135468 ?auto_135469 ?auto_135470 ?auto_135465 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135679 - OBJ
      ?auto_135680 - OBJ
      ?auto_135681 - OBJ
      ?auto_135682 - OBJ
      ?auto_135683 - OBJ
      ?auto_135678 - LOCATION
    )
    :vars
    (
      ?auto_135684 - LOCATION
      ?auto_135689 - CITY
      ?auto_135686 - LOCATION
      ?auto_135685 - LOCATION
      ?auto_135688 - LOCATION
      ?auto_135687 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135684 ?auto_135689 ) ( IN-CITY ?auto_135678 ?auto_135689 ) ( not ( = ?auto_135678 ?auto_135684 ) ) ( OBJ-AT ?auto_135683 ?auto_135684 ) ( IN-CITY ?auto_135686 ?auto_135689 ) ( not ( = ?auto_135678 ?auto_135686 ) ) ( OBJ-AT ?auto_135679 ?auto_135686 ) ( OBJ-AT ?auto_135680 ?auto_135686 ) ( IN-CITY ?auto_135685 ?auto_135689 ) ( not ( = ?auto_135678 ?auto_135685 ) ) ( OBJ-AT ?auto_135682 ?auto_135685 ) ( IN-CITY ?auto_135688 ?auto_135689 ) ( not ( = ?auto_135678 ?auto_135688 ) ) ( OBJ-AT ?auto_135681 ?auto_135688 ) ( TRUCK-AT ?auto_135687 ?auto_135678 ) ( not ( = ?auto_135681 ?auto_135682 ) ) ( not ( = ?auto_135685 ?auto_135688 ) ) ( not ( = ?auto_135681 ?auto_135680 ) ) ( not ( = ?auto_135682 ?auto_135680 ) ) ( not ( = ?auto_135686 ?auto_135685 ) ) ( not ( = ?auto_135686 ?auto_135688 ) ) ( not ( = ?auto_135681 ?auto_135679 ) ) ( not ( = ?auto_135682 ?auto_135679 ) ) ( not ( = ?auto_135680 ?auto_135679 ) ) ( not ( = ?auto_135681 ?auto_135683 ) ) ( not ( = ?auto_135682 ?auto_135683 ) ) ( not ( = ?auto_135680 ?auto_135683 ) ) ( not ( = ?auto_135679 ?auto_135683 ) ) ( not ( = ?auto_135684 ?auto_135686 ) ) ( not ( = ?auto_135684 ?auto_135685 ) ) ( not ( = ?auto_135684 ?auto_135688 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135681 ?auto_135682 ?auto_135680 ?auto_135683 ?auto_135679 ?auto_135678 )
      ( DELIVER-5PKG-VERIFY ?auto_135679 ?auto_135680 ?auto_135681 ?auto_135682 ?auto_135683 ?auto_135678 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135730 - OBJ
      ?auto_135731 - OBJ
      ?auto_135732 - OBJ
      ?auto_135733 - OBJ
      ?auto_135734 - OBJ
      ?auto_135729 - LOCATION
    )
    :vars
    (
      ?auto_135735 - LOCATION
      ?auto_135740 - CITY
      ?auto_135737 - LOCATION
      ?auto_135736 - LOCATION
      ?auto_135739 - LOCATION
      ?auto_135738 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135735 ?auto_135740 ) ( IN-CITY ?auto_135729 ?auto_135740 ) ( not ( = ?auto_135729 ?auto_135735 ) ) ( OBJ-AT ?auto_135733 ?auto_135735 ) ( IN-CITY ?auto_135737 ?auto_135740 ) ( not ( = ?auto_135729 ?auto_135737 ) ) ( OBJ-AT ?auto_135730 ?auto_135737 ) ( OBJ-AT ?auto_135731 ?auto_135737 ) ( IN-CITY ?auto_135736 ?auto_135740 ) ( not ( = ?auto_135729 ?auto_135736 ) ) ( OBJ-AT ?auto_135734 ?auto_135736 ) ( IN-CITY ?auto_135739 ?auto_135740 ) ( not ( = ?auto_135729 ?auto_135739 ) ) ( OBJ-AT ?auto_135732 ?auto_135739 ) ( TRUCK-AT ?auto_135738 ?auto_135729 ) ( not ( = ?auto_135732 ?auto_135734 ) ) ( not ( = ?auto_135736 ?auto_135739 ) ) ( not ( = ?auto_135732 ?auto_135731 ) ) ( not ( = ?auto_135734 ?auto_135731 ) ) ( not ( = ?auto_135737 ?auto_135736 ) ) ( not ( = ?auto_135737 ?auto_135739 ) ) ( not ( = ?auto_135732 ?auto_135730 ) ) ( not ( = ?auto_135734 ?auto_135730 ) ) ( not ( = ?auto_135731 ?auto_135730 ) ) ( not ( = ?auto_135732 ?auto_135733 ) ) ( not ( = ?auto_135734 ?auto_135733 ) ) ( not ( = ?auto_135731 ?auto_135733 ) ) ( not ( = ?auto_135730 ?auto_135733 ) ) ( not ( = ?auto_135735 ?auto_135737 ) ) ( not ( = ?auto_135735 ?auto_135736 ) ) ( not ( = ?auto_135735 ?auto_135739 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135732 ?auto_135734 ?auto_135731 ?auto_135733 ?auto_135730 ?auto_135729 )
      ( DELIVER-5PKG-VERIFY ?auto_135730 ?auto_135731 ?auto_135732 ?auto_135733 ?auto_135734 ?auto_135729 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135781 - OBJ
      ?auto_135782 - OBJ
      ?auto_135783 - OBJ
      ?auto_135784 - OBJ
      ?auto_135785 - OBJ
      ?auto_135780 - LOCATION
    )
    :vars
    (
      ?auto_135786 - LOCATION
      ?auto_135791 - CITY
      ?auto_135788 - LOCATION
      ?auto_135787 - LOCATION
      ?auto_135790 - LOCATION
      ?auto_135789 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135786 ?auto_135791 ) ( IN-CITY ?auto_135780 ?auto_135791 ) ( not ( = ?auto_135780 ?auto_135786 ) ) ( OBJ-AT ?auto_135785 ?auto_135786 ) ( IN-CITY ?auto_135788 ?auto_135791 ) ( not ( = ?auto_135780 ?auto_135788 ) ) ( OBJ-AT ?auto_135781 ?auto_135788 ) ( OBJ-AT ?auto_135782 ?auto_135788 ) ( IN-CITY ?auto_135787 ?auto_135791 ) ( not ( = ?auto_135780 ?auto_135787 ) ) ( OBJ-AT ?auto_135783 ?auto_135787 ) ( IN-CITY ?auto_135790 ?auto_135791 ) ( not ( = ?auto_135780 ?auto_135790 ) ) ( OBJ-AT ?auto_135784 ?auto_135790 ) ( TRUCK-AT ?auto_135789 ?auto_135780 ) ( not ( = ?auto_135784 ?auto_135783 ) ) ( not ( = ?auto_135787 ?auto_135790 ) ) ( not ( = ?auto_135784 ?auto_135782 ) ) ( not ( = ?auto_135783 ?auto_135782 ) ) ( not ( = ?auto_135788 ?auto_135787 ) ) ( not ( = ?auto_135788 ?auto_135790 ) ) ( not ( = ?auto_135784 ?auto_135781 ) ) ( not ( = ?auto_135783 ?auto_135781 ) ) ( not ( = ?auto_135782 ?auto_135781 ) ) ( not ( = ?auto_135784 ?auto_135785 ) ) ( not ( = ?auto_135783 ?auto_135785 ) ) ( not ( = ?auto_135782 ?auto_135785 ) ) ( not ( = ?auto_135781 ?auto_135785 ) ) ( not ( = ?auto_135786 ?auto_135788 ) ) ( not ( = ?auto_135786 ?auto_135787 ) ) ( not ( = ?auto_135786 ?auto_135790 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135784 ?auto_135783 ?auto_135782 ?auto_135785 ?auto_135781 ?auto_135780 )
      ( DELIVER-5PKG-VERIFY ?auto_135781 ?auto_135782 ?auto_135783 ?auto_135784 ?auto_135785 ?auto_135780 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135832 - OBJ
      ?auto_135833 - OBJ
      ?auto_135834 - OBJ
      ?auto_135835 - OBJ
      ?auto_135836 - OBJ
      ?auto_135831 - LOCATION
    )
    :vars
    (
      ?auto_135837 - LOCATION
      ?auto_135842 - CITY
      ?auto_135839 - LOCATION
      ?auto_135838 - LOCATION
      ?auto_135841 - LOCATION
      ?auto_135840 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135837 ?auto_135842 ) ( IN-CITY ?auto_135831 ?auto_135842 ) ( not ( = ?auto_135831 ?auto_135837 ) ) ( OBJ-AT ?auto_135835 ?auto_135837 ) ( IN-CITY ?auto_135839 ?auto_135842 ) ( not ( = ?auto_135831 ?auto_135839 ) ) ( OBJ-AT ?auto_135832 ?auto_135839 ) ( OBJ-AT ?auto_135833 ?auto_135839 ) ( IN-CITY ?auto_135838 ?auto_135842 ) ( not ( = ?auto_135831 ?auto_135838 ) ) ( OBJ-AT ?auto_135834 ?auto_135838 ) ( IN-CITY ?auto_135841 ?auto_135842 ) ( not ( = ?auto_135831 ?auto_135841 ) ) ( OBJ-AT ?auto_135836 ?auto_135841 ) ( TRUCK-AT ?auto_135840 ?auto_135831 ) ( not ( = ?auto_135836 ?auto_135834 ) ) ( not ( = ?auto_135838 ?auto_135841 ) ) ( not ( = ?auto_135836 ?auto_135833 ) ) ( not ( = ?auto_135834 ?auto_135833 ) ) ( not ( = ?auto_135839 ?auto_135838 ) ) ( not ( = ?auto_135839 ?auto_135841 ) ) ( not ( = ?auto_135836 ?auto_135832 ) ) ( not ( = ?auto_135834 ?auto_135832 ) ) ( not ( = ?auto_135833 ?auto_135832 ) ) ( not ( = ?auto_135836 ?auto_135835 ) ) ( not ( = ?auto_135834 ?auto_135835 ) ) ( not ( = ?auto_135833 ?auto_135835 ) ) ( not ( = ?auto_135832 ?auto_135835 ) ) ( not ( = ?auto_135837 ?auto_135839 ) ) ( not ( = ?auto_135837 ?auto_135838 ) ) ( not ( = ?auto_135837 ?auto_135841 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135836 ?auto_135834 ?auto_135833 ?auto_135835 ?auto_135832 ?auto_135831 )
      ( DELIVER-5PKG-VERIFY ?auto_135832 ?auto_135833 ?auto_135834 ?auto_135835 ?auto_135836 ?auto_135831 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136153 - OBJ
      ?auto_136154 - OBJ
      ?auto_136155 - OBJ
      ?auto_136156 - OBJ
      ?auto_136157 - OBJ
      ?auto_136152 - LOCATION
    )
    :vars
    (
      ?auto_136158 - LOCATION
      ?auto_136163 - CITY
      ?auto_136160 - LOCATION
      ?auto_136159 - LOCATION
      ?auto_136162 - LOCATION
      ?auto_136161 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136158 ?auto_136163 ) ( IN-CITY ?auto_136152 ?auto_136163 ) ( not ( = ?auto_136152 ?auto_136158 ) ) ( OBJ-AT ?auto_136155 ?auto_136158 ) ( IN-CITY ?auto_136160 ?auto_136163 ) ( not ( = ?auto_136152 ?auto_136160 ) ) ( OBJ-AT ?auto_136153 ?auto_136160 ) ( OBJ-AT ?auto_136154 ?auto_136160 ) ( IN-CITY ?auto_136159 ?auto_136163 ) ( not ( = ?auto_136152 ?auto_136159 ) ) ( OBJ-AT ?auto_136157 ?auto_136159 ) ( IN-CITY ?auto_136162 ?auto_136163 ) ( not ( = ?auto_136152 ?auto_136162 ) ) ( OBJ-AT ?auto_136156 ?auto_136162 ) ( TRUCK-AT ?auto_136161 ?auto_136152 ) ( not ( = ?auto_136156 ?auto_136157 ) ) ( not ( = ?auto_136159 ?auto_136162 ) ) ( not ( = ?auto_136156 ?auto_136154 ) ) ( not ( = ?auto_136157 ?auto_136154 ) ) ( not ( = ?auto_136160 ?auto_136159 ) ) ( not ( = ?auto_136160 ?auto_136162 ) ) ( not ( = ?auto_136156 ?auto_136153 ) ) ( not ( = ?auto_136157 ?auto_136153 ) ) ( not ( = ?auto_136154 ?auto_136153 ) ) ( not ( = ?auto_136156 ?auto_136155 ) ) ( not ( = ?auto_136157 ?auto_136155 ) ) ( not ( = ?auto_136154 ?auto_136155 ) ) ( not ( = ?auto_136153 ?auto_136155 ) ) ( not ( = ?auto_136158 ?auto_136160 ) ) ( not ( = ?auto_136158 ?auto_136159 ) ) ( not ( = ?auto_136158 ?auto_136162 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136156 ?auto_136157 ?auto_136154 ?auto_136155 ?auto_136153 ?auto_136152 )
      ( DELIVER-5PKG-VERIFY ?auto_136153 ?auto_136154 ?auto_136155 ?auto_136156 ?auto_136157 ?auto_136152 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136204 - OBJ
      ?auto_136205 - OBJ
      ?auto_136206 - OBJ
      ?auto_136207 - OBJ
      ?auto_136208 - OBJ
      ?auto_136203 - LOCATION
    )
    :vars
    (
      ?auto_136209 - LOCATION
      ?auto_136214 - CITY
      ?auto_136211 - LOCATION
      ?auto_136210 - LOCATION
      ?auto_136213 - LOCATION
      ?auto_136212 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136209 ?auto_136214 ) ( IN-CITY ?auto_136203 ?auto_136214 ) ( not ( = ?auto_136203 ?auto_136209 ) ) ( OBJ-AT ?auto_136206 ?auto_136209 ) ( IN-CITY ?auto_136211 ?auto_136214 ) ( not ( = ?auto_136203 ?auto_136211 ) ) ( OBJ-AT ?auto_136204 ?auto_136211 ) ( OBJ-AT ?auto_136205 ?auto_136211 ) ( IN-CITY ?auto_136210 ?auto_136214 ) ( not ( = ?auto_136203 ?auto_136210 ) ) ( OBJ-AT ?auto_136207 ?auto_136210 ) ( IN-CITY ?auto_136213 ?auto_136214 ) ( not ( = ?auto_136203 ?auto_136213 ) ) ( OBJ-AT ?auto_136208 ?auto_136213 ) ( TRUCK-AT ?auto_136212 ?auto_136203 ) ( not ( = ?auto_136208 ?auto_136207 ) ) ( not ( = ?auto_136210 ?auto_136213 ) ) ( not ( = ?auto_136208 ?auto_136205 ) ) ( not ( = ?auto_136207 ?auto_136205 ) ) ( not ( = ?auto_136211 ?auto_136210 ) ) ( not ( = ?auto_136211 ?auto_136213 ) ) ( not ( = ?auto_136208 ?auto_136204 ) ) ( not ( = ?auto_136207 ?auto_136204 ) ) ( not ( = ?auto_136205 ?auto_136204 ) ) ( not ( = ?auto_136208 ?auto_136206 ) ) ( not ( = ?auto_136207 ?auto_136206 ) ) ( not ( = ?auto_136205 ?auto_136206 ) ) ( not ( = ?auto_136204 ?auto_136206 ) ) ( not ( = ?auto_136209 ?auto_136211 ) ) ( not ( = ?auto_136209 ?auto_136210 ) ) ( not ( = ?auto_136209 ?auto_136213 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136208 ?auto_136207 ?auto_136205 ?auto_136206 ?auto_136204 ?auto_136203 )
      ( DELIVER-5PKG-VERIFY ?auto_136204 ?auto_136205 ?auto_136206 ?auto_136207 ?auto_136208 ?auto_136203 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137409 - OBJ
      ?auto_137410 - OBJ
      ?auto_137411 - OBJ
      ?auto_137412 - OBJ
      ?auto_137413 - OBJ
      ?auto_137408 - LOCATION
    )
    :vars
    (
      ?auto_137414 - LOCATION
      ?auto_137419 - CITY
      ?auto_137416 - LOCATION
      ?auto_137415 - LOCATION
      ?auto_137418 - LOCATION
      ?auto_137417 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137414 ?auto_137419 ) ( IN-CITY ?auto_137408 ?auto_137419 ) ( not ( = ?auto_137408 ?auto_137414 ) ) ( OBJ-AT ?auto_137410 ?auto_137414 ) ( IN-CITY ?auto_137416 ?auto_137419 ) ( not ( = ?auto_137408 ?auto_137416 ) ) ( OBJ-AT ?auto_137409 ?auto_137416 ) ( OBJ-AT ?auto_137413 ?auto_137416 ) ( IN-CITY ?auto_137415 ?auto_137419 ) ( not ( = ?auto_137408 ?auto_137415 ) ) ( OBJ-AT ?auto_137412 ?auto_137415 ) ( IN-CITY ?auto_137418 ?auto_137419 ) ( not ( = ?auto_137408 ?auto_137418 ) ) ( OBJ-AT ?auto_137411 ?auto_137418 ) ( TRUCK-AT ?auto_137417 ?auto_137408 ) ( not ( = ?auto_137411 ?auto_137412 ) ) ( not ( = ?auto_137415 ?auto_137418 ) ) ( not ( = ?auto_137411 ?auto_137413 ) ) ( not ( = ?auto_137412 ?auto_137413 ) ) ( not ( = ?auto_137416 ?auto_137415 ) ) ( not ( = ?auto_137416 ?auto_137418 ) ) ( not ( = ?auto_137411 ?auto_137409 ) ) ( not ( = ?auto_137412 ?auto_137409 ) ) ( not ( = ?auto_137413 ?auto_137409 ) ) ( not ( = ?auto_137411 ?auto_137410 ) ) ( not ( = ?auto_137412 ?auto_137410 ) ) ( not ( = ?auto_137413 ?auto_137410 ) ) ( not ( = ?auto_137409 ?auto_137410 ) ) ( not ( = ?auto_137414 ?auto_137416 ) ) ( not ( = ?auto_137414 ?auto_137415 ) ) ( not ( = ?auto_137414 ?auto_137418 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137411 ?auto_137412 ?auto_137413 ?auto_137410 ?auto_137409 ?auto_137408 )
      ( DELIVER-5PKG-VERIFY ?auto_137409 ?auto_137410 ?auto_137411 ?auto_137412 ?auto_137413 ?auto_137408 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137460 - OBJ
      ?auto_137461 - OBJ
      ?auto_137462 - OBJ
      ?auto_137463 - OBJ
      ?auto_137464 - OBJ
      ?auto_137459 - LOCATION
    )
    :vars
    (
      ?auto_137465 - LOCATION
      ?auto_137470 - CITY
      ?auto_137467 - LOCATION
      ?auto_137466 - LOCATION
      ?auto_137469 - LOCATION
      ?auto_137468 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137465 ?auto_137470 ) ( IN-CITY ?auto_137459 ?auto_137470 ) ( not ( = ?auto_137459 ?auto_137465 ) ) ( OBJ-AT ?auto_137461 ?auto_137465 ) ( IN-CITY ?auto_137467 ?auto_137470 ) ( not ( = ?auto_137459 ?auto_137467 ) ) ( OBJ-AT ?auto_137460 ?auto_137467 ) ( OBJ-AT ?auto_137463 ?auto_137467 ) ( IN-CITY ?auto_137466 ?auto_137470 ) ( not ( = ?auto_137459 ?auto_137466 ) ) ( OBJ-AT ?auto_137464 ?auto_137466 ) ( IN-CITY ?auto_137469 ?auto_137470 ) ( not ( = ?auto_137459 ?auto_137469 ) ) ( OBJ-AT ?auto_137462 ?auto_137469 ) ( TRUCK-AT ?auto_137468 ?auto_137459 ) ( not ( = ?auto_137462 ?auto_137464 ) ) ( not ( = ?auto_137466 ?auto_137469 ) ) ( not ( = ?auto_137462 ?auto_137463 ) ) ( not ( = ?auto_137464 ?auto_137463 ) ) ( not ( = ?auto_137467 ?auto_137466 ) ) ( not ( = ?auto_137467 ?auto_137469 ) ) ( not ( = ?auto_137462 ?auto_137460 ) ) ( not ( = ?auto_137464 ?auto_137460 ) ) ( not ( = ?auto_137463 ?auto_137460 ) ) ( not ( = ?auto_137462 ?auto_137461 ) ) ( not ( = ?auto_137464 ?auto_137461 ) ) ( not ( = ?auto_137463 ?auto_137461 ) ) ( not ( = ?auto_137460 ?auto_137461 ) ) ( not ( = ?auto_137465 ?auto_137467 ) ) ( not ( = ?auto_137465 ?auto_137466 ) ) ( not ( = ?auto_137465 ?auto_137469 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137462 ?auto_137464 ?auto_137463 ?auto_137461 ?auto_137460 ?auto_137459 )
      ( DELIVER-5PKG-VERIFY ?auto_137460 ?auto_137461 ?auto_137462 ?auto_137463 ?auto_137464 ?auto_137459 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137673 - OBJ
      ?auto_137674 - OBJ
      ?auto_137675 - OBJ
      ?auto_137676 - OBJ
      ?auto_137677 - OBJ
      ?auto_137672 - LOCATION
    )
    :vars
    (
      ?auto_137678 - LOCATION
      ?auto_137683 - CITY
      ?auto_137680 - LOCATION
      ?auto_137679 - LOCATION
      ?auto_137682 - LOCATION
      ?auto_137681 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137678 ?auto_137683 ) ( IN-CITY ?auto_137672 ?auto_137683 ) ( not ( = ?auto_137672 ?auto_137678 ) ) ( OBJ-AT ?auto_137674 ?auto_137678 ) ( IN-CITY ?auto_137680 ?auto_137683 ) ( not ( = ?auto_137672 ?auto_137680 ) ) ( OBJ-AT ?auto_137673 ?auto_137680 ) ( OBJ-AT ?auto_137677 ?auto_137680 ) ( IN-CITY ?auto_137679 ?auto_137683 ) ( not ( = ?auto_137672 ?auto_137679 ) ) ( OBJ-AT ?auto_137675 ?auto_137679 ) ( IN-CITY ?auto_137682 ?auto_137683 ) ( not ( = ?auto_137672 ?auto_137682 ) ) ( OBJ-AT ?auto_137676 ?auto_137682 ) ( TRUCK-AT ?auto_137681 ?auto_137672 ) ( not ( = ?auto_137676 ?auto_137675 ) ) ( not ( = ?auto_137679 ?auto_137682 ) ) ( not ( = ?auto_137676 ?auto_137677 ) ) ( not ( = ?auto_137675 ?auto_137677 ) ) ( not ( = ?auto_137680 ?auto_137679 ) ) ( not ( = ?auto_137680 ?auto_137682 ) ) ( not ( = ?auto_137676 ?auto_137673 ) ) ( not ( = ?auto_137675 ?auto_137673 ) ) ( not ( = ?auto_137677 ?auto_137673 ) ) ( not ( = ?auto_137676 ?auto_137674 ) ) ( not ( = ?auto_137675 ?auto_137674 ) ) ( not ( = ?auto_137677 ?auto_137674 ) ) ( not ( = ?auto_137673 ?auto_137674 ) ) ( not ( = ?auto_137678 ?auto_137680 ) ) ( not ( = ?auto_137678 ?auto_137679 ) ) ( not ( = ?auto_137678 ?auto_137682 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137676 ?auto_137675 ?auto_137677 ?auto_137674 ?auto_137673 ?auto_137672 )
      ( DELIVER-5PKG-VERIFY ?auto_137673 ?auto_137674 ?auto_137675 ?auto_137676 ?auto_137677 ?auto_137672 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137779 - OBJ
      ?auto_137780 - OBJ
      ?auto_137781 - OBJ
      ?auto_137782 - OBJ
      ?auto_137783 - OBJ
      ?auto_137778 - LOCATION
    )
    :vars
    (
      ?auto_137784 - LOCATION
      ?auto_137789 - CITY
      ?auto_137786 - LOCATION
      ?auto_137785 - LOCATION
      ?auto_137788 - LOCATION
      ?auto_137787 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137784 ?auto_137789 ) ( IN-CITY ?auto_137778 ?auto_137789 ) ( not ( = ?auto_137778 ?auto_137784 ) ) ( OBJ-AT ?auto_137780 ?auto_137784 ) ( IN-CITY ?auto_137786 ?auto_137789 ) ( not ( = ?auto_137778 ?auto_137786 ) ) ( OBJ-AT ?auto_137779 ?auto_137786 ) ( OBJ-AT ?auto_137782 ?auto_137786 ) ( IN-CITY ?auto_137785 ?auto_137789 ) ( not ( = ?auto_137778 ?auto_137785 ) ) ( OBJ-AT ?auto_137781 ?auto_137785 ) ( IN-CITY ?auto_137788 ?auto_137789 ) ( not ( = ?auto_137778 ?auto_137788 ) ) ( OBJ-AT ?auto_137783 ?auto_137788 ) ( TRUCK-AT ?auto_137787 ?auto_137778 ) ( not ( = ?auto_137783 ?auto_137781 ) ) ( not ( = ?auto_137785 ?auto_137788 ) ) ( not ( = ?auto_137783 ?auto_137782 ) ) ( not ( = ?auto_137781 ?auto_137782 ) ) ( not ( = ?auto_137786 ?auto_137785 ) ) ( not ( = ?auto_137786 ?auto_137788 ) ) ( not ( = ?auto_137783 ?auto_137779 ) ) ( not ( = ?auto_137781 ?auto_137779 ) ) ( not ( = ?auto_137782 ?auto_137779 ) ) ( not ( = ?auto_137783 ?auto_137780 ) ) ( not ( = ?auto_137781 ?auto_137780 ) ) ( not ( = ?auto_137782 ?auto_137780 ) ) ( not ( = ?auto_137779 ?auto_137780 ) ) ( not ( = ?auto_137784 ?auto_137786 ) ) ( not ( = ?auto_137784 ?auto_137785 ) ) ( not ( = ?auto_137784 ?auto_137788 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137783 ?auto_137781 ?auto_137782 ?auto_137780 ?auto_137779 ?auto_137778 )
      ( DELIVER-5PKG-VERIFY ?auto_137779 ?auto_137780 ?auto_137781 ?auto_137782 ?auto_137783 ?auto_137778 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137992 - OBJ
      ?auto_137993 - OBJ
      ?auto_137994 - OBJ
      ?auto_137995 - OBJ
      ?auto_137996 - OBJ
      ?auto_137991 - LOCATION
    )
    :vars
    (
      ?auto_137997 - LOCATION
      ?auto_138002 - CITY
      ?auto_137999 - LOCATION
      ?auto_137998 - LOCATION
      ?auto_138001 - LOCATION
      ?auto_138000 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137997 ?auto_138002 ) ( IN-CITY ?auto_137991 ?auto_138002 ) ( not ( = ?auto_137991 ?auto_137997 ) ) ( OBJ-AT ?auto_137993 ?auto_137997 ) ( IN-CITY ?auto_137999 ?auto_138002 ) ( not ( = ?auto_137991 ?auto_137999 ) ) ( OBJ-AT ?auto_137992 ?auto_137999 ) ( OBJ-AT ?auto_137994 ?auto_137999 ) ( IN-CITY ?auto_137998 ?auto_138002 ) ( not ( = ?auto_137991 ?auto_137998 ) ) ( OBJ-AT ?auto_137996 ?auto_137998 ) ( IN-CITY ?auto_138001 ?auto_138002 ) ( not ( = ?auto_137991 ?auto_138001 ) ) ( OBJ-AT ?auto_137995 ?auto_138001 ) ( TRUCK-AT ?auto_138000 ?auto_137991 ) ( not ( = ?auto_137995 ?auto_137996 ) ) ( not ( = ?auto_137998 ?auto_138001 ) ) ( not ( = ?auto_137995 ?auto_137994 ) ) ( not ( = ?auto_137996 ?auto_137994 ) ) ( not ( = ?auto_137999 ?auto_137998 ) ) ( not ( = ?auto_137999 ?auto_138001 ) ) ( not ( = ?auto_137995 ?auto_137992 ) ) ( not ( = ?auto_137996 ?auto_137992 ) ) ( not ( = ?auto_137994 ?auto_137992 ) ) ( not ( = ?auto_137995 ?auto_137993 ) ) ( not ( = ?auto_137996 ?auto_137993 ) ) ( not ( = ?auto_137994 ?auto_137993 ) ) ( not ( = ?auto_137992 ?auto_137993 ) ) ( not ( = ?auto_137997 ?auto_137999 ) ) ( not ( = ?auto_137997 ?auto_137998 ) ) ( not ( = ?auto_137997 ?auto_138001 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137995 ?auto_137996 ?auto_137994 ?auto_137993 ?auto_137992 ?auto_137991 )
      ( DELIVER-5PKG-VERIFY ?auto_137992 ?auto_137993 ?auto_137994 ?auto_137995 ?auto_137996 ?auto_137991 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_138043 - OBJ
      ?auto_138044 - OBJ
      ?auto_138045 - OBJ
      ?auto_138046 - OBJ
      ?auto_138047 - OBJ
      ?auto_138042 - LOCATION
    )
    :vars
    (
      ?auto_138048 - LOCATION
      ?auto_138053 - CITY
      ?auto_138050 - LOCATION
      ?auto_138049 - LOCATION
      ?auto_138052 - LOCATION
      ?auto_138051 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138048 ?auto_138053 ) ( IN-CITY ?auto_138042 ?auto_138053 ) ( not ( = ?auto_138042 ?auto_138048 ) ) ( OBJ-AT ?auto_138044 ?auto_138048 ) ( IN-CITY ?auto_138050 ?auto_138053 ) ( not ( = ?auto_138042 ?auto_138050 ) ) ( OBJ-AT ?auto_138043 ?auto_138050 ) ( OBJ-AT ?auto_138045 ?auto_138050 ) ( IN-CITY ?auto_138049 ?auto_138053 ) ( not ( = ?auto_138042 ?auto_138049 ) ) ( OBJ-AT ?auto_138046 ?auto_138049 ) ( IN-CITY ?auto_138052 ?auto_138053 ) ( not ( = ?auto_138042 ?auto_138052 ) ) ( OBJ-AT ?auto_138047 ?auto_138052 ) ( TRUCK-AT ?auto_138051 ?auto_138042 ) ( not ( = ?auto_138047 ?auto_138046 ) ) ( not ( = ?auto_138049 ?auto_138052 ) ) ( not ( = ?auto_138047 ?auto_138045 ) ) ( not ( = ?auto_138046 ?auto_138045 ) ) ( not ( = ?auto_138050 ?auto_138049 ) ) ( not ( = ?auto_138050 ?auto_138052 ) ) ( not ( = ?auto_138047 ?auto_138043 ) ) ( not ( = ?auto_138046 ?auto_138043 ) ) ( not ( = ?auto_138045 ?auto_138043 ) ) ( not ( = ?auto_138047 ?auto_138044 ) ) ( not ( = ?auto_138046 ?auto_138044 ) ) ( not ( = ?auto_138045 ?auto_138044 ) ) ( not ( = ?auto_138043 ?auto_138044 ) ) ( not ( = ?auto_138048 ?auto_138050 ) ) ( not ( = ?auto_138048 ?auto_138049 ) ) ( not ( = ?auto_138048 ?auto_138052 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_138047 ?auto_138046 ?auto_138045 ?auto_138044 ?auto_138043 ?auto_138042 )
      ( DELIVER-5PKG-VERIFY ?auto_138043 ?auto_138044 ?auto_138045 ?auto_138046 ?auto_138047 ?auto_138042 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_139530 - OBJ
      ?auto_139531 - OBJ
      ?auto_139532 - OBJ
      ?auto_139533 - OBJ
      ?auto_139534 - OBJ
      ?auto_139529 - LOCATION
    )
    :vars
    (
      ?auto_139535 - LOCATION
      ?auto_139540 - CITY
      ?auto_139537 - LOCATION
      ?auto_139536 - LOCATION
      ?auto_139539 - LOCATION
      ?auto_139538 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139535 ?auto_139540 ) ( IN-CITY ?auto_139529 ?auto_139540 ) ( not ( = ?auto_139529 ?auto_139535 ) ) ( OBJ-AT ?auto_139530 ?auto_139535 ) ( IN-CITY ?auto_139537 ?auto_139540 ) ( not ( = ?auto_139529 ?auto_139537 ) ) ( OBJ-AT ?auto_139534 ?auto_139537 ) ( OBJ-AT ?auto_139533 ?auto_139537 ) ( IN-CITY ?auto_139536 ?auto_139540 ) ( not ( = ?auto_139529 ?auto_139536 ) ) ( OBJ-AT ?auto_139532 ?auto_139536 ) ( IN-CITY ?auto_139539 ?auto_139540 ) ( not ( = ?auto_139529 ?auto_139539 ) ) ( OBJ-AT ?auto_139531 ?auto_139539 ) ( TRUCK-AT ?auto_139538 ?auto_139529 ) ( not ( = ?auto_139531 ?auto_139532 ) ) ( not ( = ?auto_139536 ?auto_139539 ) ) ( not ( = ?auto_139531 ?auto_139533 ) ) ( not ( = ?auto_139532 ?auto_139533 ) ) ( not ( = ?auto_139537 ?auto_139536 ) ) ( not ( = ?auto_139537 ?auto_139539 ) ) ( not ( = ?auto_139531 ?auto_139534 ) ) ( not ( = ?auto_139532 ?auto_139534 ) ) ( not ( = ?auto_139533 ?auto_139534 ) ) ( not ( = ?auto_139531 ?auto_139530 ) ) ( not ( = ?auto_139532 ?auto_139530 ) ) ( not ( = ?auto_139533 ?auto_139530 ) ) ( not ( = ?auto_139534 ?auto_139530 ) ) ( not ( = ?auto_139535 ?auto_139537 ) ) ( not ( = ?auto_139535 ?auto_139536 ) ) ( not ( = ?auto_139535 ?auto_139539 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_139531 ?auto_139532 ?auto_139533 ?auto_139530 ?auto_139534 ?auto_139529 )
      ( DELIVER-5PKG-VERIFY ?auto_139530 ?auto_139531 ?auto_139532 ?auto_139533 ?auto_139534 ?auto_139529 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_139581 - OBJ
      ?auto_139582 - OBJ
      ?auto_139583 - OBJ
      ?auto_139584 - OBJ
      ?auto_139585 - OBJ
      ?auto_139580 - LOCATION
    )
    :vars
    (
      ?auto_139586 - LOCATION
      ?auto_139591 - CITY
      ?auto_139588 - LOCATION
      ?auto_139587 - LOCATION
      ?auto_139590 - LOCATION
      ?auto_139589 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139586 ?auto_139591 ) ( IN-CITY ?auto_139580 ?auto_139591 ) ( not ( = ?auto_139580 ?auto_139586 ) ) ( OBJ-AT ?auto_139581 ?auto_139586 ) ( IN-CITY ?auto_139588 ?auto_139591 ) ( not ( = ?auto_139580 ?auto_139588 ) ) ( OBJ-AT ?auto_139584 ?auto_139588 ) ( OBJ-AT ?auto_139585 ?auto_139588 ) ( IN-CITY ?auto_139587 ?auto_139591 ) ( not ( = ?auto_139580 ?auto_139587 ) ) ( OBJ-AT ?auto_139583 ?auto_139587 ) ( IN-CITY ?auto_139590 ?auto_139591 ) ( not ( = ?auto_139580 ?auto_139590 ) ) ( OBJ-AT ?auto_139582 ?auto_139590 ) ( TRUCK-AT ?auto_139589 ?auto_139580 ) ( not ( = ?auto_139582 ?auto_139583 ) ) ( not ( = ?auto_139587 ?auto_139590 ) ) ( not ( = ?auto_139582 ?auto_139585 ) ) ( not ( = ?auto_139583 ?auto_139585 ) ) ( not ( = ?auto_139588 ?auto_139587 ) ) ( not ( = ?auto_139588 ?auto_139590 ) ) ( not ( = ?auto_139582 ?auto_139584 ) ) ( not ( = ?auto_139583 ?auto_139584 ) ) ( not ( = ?auto_139585 ?auto_139584 ) ) ( not ( = ?auto_139582 ?auto_139581 ) ) ( not ( = ?auto_139583 ?auto_139581 ) ) ( not ( = ?auto_139585 ?auto_139581 ) ) ( not ( = ?auto_139584 ?auto_139581 ) ) ( not ( = ?auto_139586 ?auto_139588 ) ) ( not ( = ?auto_139586 ?auto_139587 ) ) ( not ( = ?auto_139586 ?auto_139590 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_139582 ?auto_139583 ?auto_139585 ?auto_139581 ?auto_139584 ?auto_139580 )
      ( DELIVER-5PKG-VERIFY ?auto_139581 ?auto_139582 ?auto_139583 ?auto_139584 ?auto_139585 ?auto_139580 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_139794 - OBJ
      ?auto_139795 - OBJ
      ?auto_139796 - OBJ
      ?auto_139797 - OBJ
      ?auto_139798 - OBJ
      ?auto_139793 - LOCATION
    )
    :vars
    (
      ?auto_139799 - LOCATION
      ?auto_139804 - CITY
      ?auto_139801 - LOCATION
      ?auto_139800 - LOCATION
      ?auto_139803 - LOCATION
      ?auto_139802 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139799 ?auto_139804 ) ( IN-CITY ?auto_139793 ?auto_139804 ) ( not ( = ?auto_139793 ?auto_139799 ) ) ( OBJ-AT ?auto_139794 ?auto_139799 ) ( IN-CITY ?auto_139801 ?auto_139804 ) ( not ( = ?auto_139793 ?auto_139801 ) ) ( OBJ-AT ?auto_139798 ?auto_139801 ) ( OBJ-AT ?auto_139796 ?auto_139801 ) ( IN-CITY ?auto_139800 ?auto_139804 ) ( not ( = ?auto_139793 ?auto_139800 ) ) ( OBJ-AT ?auto_139797 ?auto_139800 ) ( IN-CITY ?auto_139803 ?auto_139804 ) ( not ( = ?auto_139793 ?auto_139803 ) ) ( OBJ-AT ?auto_139795 ?auto_139803 ) ( TRUCK-AT ?auto_139802 ?auto_139793 ) ( not ( = ?auto_139795 ?auto_139797 ) ) ( not ( = ?auto_139800 ?auto_139803 ) ) ( not ( = ?auto_139795 ?auto_139796 ) ) ( not ( = ?auto_139797 ?auto_139796 ) ) ( not ( = ?auto_139801 ?auto_139800 ) ) ( not ( = ?auto_139801 ?auto_139803 ) ) ( not ( = ?auto_139795 ?auto_139798 ) ) ( not ( = ?auto_139797 ?auto_139798 ) ) ( not ( = ?auto_139796 ?auto_139798 ) ) ( not ( = ?auto_139795 ?auto_139794 ) ) ( not ( = ?auto_139797 ?auto_139794 ) ) ( not ( = ?auto_139796 ?auto_139794 ) ) ( not ( = ?auto_139798 ?auto_139794 ) ) ( not ( = ?auto_139799 ?auto_139801 ) ) ( not ( = ?auto_139799 ?auto_139800 ) ) ( not ( = ?auto_139799 ?auto_139803 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_139795 ?auto_139797 ?auto_139796 ?auto_139794 ?auto_139798 ?auto_139793 )
      ( DELIVER-5PKG-VERIFY ?auto_139794 ?auto_139795 ?auto_139796 ?auto_139797 ?auto_139798 ?auto_139793 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_139900 - OBJ
      ?auto_139901 - OBJ
      ?auto_139902 - OBJ
      ?auto_139903 - OBJ
      ?auto_139904 - OBJ
      ?auto_139899 - LOCATION
    )
    :vars
    (
      ?auto_139905 - LOCATION
      ?auto_139910 - CITY
      ?auto_139907 - LOCATION
      ?auto_139906 - LOCATION
      ?auto_139909 - LOCATION
      ?auto_139908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139905 ?auto_139910 ) ( IN-CITY ?auto_139899 ?auto_139910 ) ( not ( = ?auto_139899 ?auto_139905 ) ) ( OBJ-AT ?auto_139900 ?auto_139905 ) ( IN-CITY ?auto_139907 ?auto_139910 ) ( not ( = ?auto_139899 ?auto_139907 ) ) ( OBJ-AT ?auto_139903 ?auto_139907 ) ( OBJ-AT ?auto_139902 ?auto_139907 ) ( IN-CITY ?auto_139906 ?auto_139910 ) ( not ( = ?auto_139899 ?auto_139906 ) ) ( OBJ-AT ?auto_139904 ?auto_139906 ) ( IN-CITY ?auto_139909 ?auto_139910 ) ( not ( = ?auto_139899 ?auto_139909 ) ) ( OBJ-AT ?auto_139901 ?auto_139909 ) ( TRUCK-AT ?auto_139908 ?auto_139899 ) ( not ( = ?auto_139901 ?auto_139904 ) ) ( not ( = ?auto_139906 ?auto_139909 ) ) ( not ( = ?auto_139901 ?auto_139902 ) ) ( not ( = ?auto_139904 ?auto_139902 ) ) ( not ( = ?auto_139907 ?auto_139906 ) ) ( not ( = ?auto_139907 ?auto_139909 ) ) ( not ( = ?auto_139901 ?auto_139903 ) ) ( not ( = ?auto_139904 ?auto_139903 ) ) ( not ( = ?auto_139902 ?auto_139903 ) ) ( not ( = ?auto_139901 ?auto_139900 ) ) ( not ( = ?auto_139904 ?auto_139900 ) ) ( not ( = ?auto_139902 ?auto_139900 ) ) ( not ( = ?auto_139903 ?auto_139900 ) ) ( not ( = ?auto_139905 ?auto_139907 ) ) ( not ( = ?auto_139905 ?auto_139906 ) ) ( not ( = ?auto_139905 ?auto_139909 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_139901 ?auto_139904 ?auto_139902 ?auto_139900 ?auto_139903 ?auto_139899 )
      ( DELIVER-5PKG-VERIFY ?auto_139900 ?auto_139901 ?auto_139902 ?auto_139903 ?auto_139904 ?auto_139899 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_140113 - OBJ
      ?auto_140114 - OBJ
      ?auto_140115 - OBJ
      ?auto_140116 - OBJ
      ?auto_140117 - OBJ
      ?auto_140112 - LOCATION
    )
    :vars
    (
      ?auto_140118 - LOCATION
      ?auto_140123 - CITY
      ?auto_140120 - LOCATION
      ?auto_140119 - LOCATION
      ?auto_140122 - LOCATION
      ?auto_140121 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140118 ?auto_140123 ) ( IN-CITY ?auto_140112 ?auto_140123 ) ( not ( = ?auto_140112 ?auto_140118 ) ) ( OBJ-AT ?auto_140113 ?auto_140118 ) ( IN-CITY ?auto_140120 ?auto_140123 ) ( not ( = ?auto_140112 ?auto_140120 ) ) ( OBJ-AT ?auto_140115 ?auto_140120 ) ( OBJ-AT ?auto_140117 ?auto_140120 ) ( IN-CITY ?auto_140119 ?auto_140123 ) ( not ( = ?auto_140112 ?auto_140119 ) ) ( OBJ-AT ?auto_140116 ?auto_140119 ) ( IN-CITY ?auto_140122 ?auto_140123 ) ( not ( = ?auto_140112 ?auto_140122 ) ) ( OBJ-AT ?auto_140114 ?auto_140122 ) ( TRUCK-AT ?auto_140121 ?auto_140112 ) ( not ( = ?auto_140114 ?auto_140116 ) ) ( not ( = ?auto_140119 ?auto_140122 ) ) ( not ( = ?auto_140114 ?auto_140117 ) ) ( not ( = ?auto_140116 ?auto_140117 ) ) ( not ( = ?auto_140120 ?auto_140119 ) ) ( not ( = ?auto_140120 ?auto_140122 ) ) ( not ( = ?auto_140114 ?auto_140115 ) ) ( not ( = ?auto_140116 ?auto_140115 ) ) ( not ( = ?auto_140117 ?auto_140115 ) ) ( not ( = ?auto_140114 ?auto_140113 ) ) ( not ( = ?auto_140116 ?auto_140113 ) ) ( not ( = ?auto_140117 ?auto_140113 ) ) ( not ( = ?auto_140115 ?auto_140113 ) ) ( not ( = ?auto_140118 ?auto_140120 ) ) ( not ( = ?auto_140118 ?auto_140119 ) ) ( not ( = ?auto_140118 ?auto_140122 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_140114 ?auto_140116 ?auto_140117 ?auto_140113 ?auto_140115 ?auto_140112 )
      ( DELIVER-5PKG-VERIFY ?auto_140113 ?auto_140114 ?auto_140115 ?auto_140116 ?auto_140117 ?auto_140112 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_140164 - OBJ
      ?auto_140165 - OBJ
      ?auto_140166 - OBJ
      ?auto_140167 - OBJ
      ?auto_140168 - OBJ
      ?auto_140163 - LOCATION
    )
    :vars
    (
      ?auto_140169 - LOCATION
      ?auto_140174 - CITY
      ?auto_140171 - LOCATION
      ?auto_140170 - LOCATION
      ?auto_140173 - LOCATION
      ?auto_140172 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140169 ?auto_140174 ) ( IN-CITY ?auto_140163 ?auto_140174 ) ( not ( = ?auto_140163 ?auto_140169 ) ) ( OBJ-AT ?auto_140164 ?auto_140169 ) ( IN-CITY ?auto_140171 ?auto_140174 ) ( not ( = ?auto_140163 ?auto_140171 ) ) ( OBJ-AT ?auto_140166 ?auto_140171 ) ( OBJ-AT ?auto_140167 ?auto_140171 ) ( IN-CITY ?auto_140170 ?auto_140174 ) ( not ( = ?auto_140163 ?auto_140170 ) ) ( OBJ-AT ?auto_140168 ?auto_140170 ) ( IN-CITY ?auto_140173 ?auto_140174 ) ( not ( = ?auto_140163 ?auto_140173 ) ) ( OBJ-AT ?auto_140165 ?auto_140173 ) ( TRUCK-AT ?auto_140172 ?auto_140163 ) ( not ( = ?auto_140165 ?auto_140168 ) ) ( not ( = ?auto_140170 ?auto_140173 ) ) ( not ( = ?auto_140165 ?auto_140167 ) ) ( not ( = ?auto_140168 ?auto_140167 ) ) ( not ( = ?auto_140171 ?auto_140170 ) ) ( not ( = ?auto_140171 ?auto_140173 ) ) ( not ( = ?auto_140165 ?auto_140166 ) ) ( not ( = ?auto_140168 ?auto_140166 ) ) ( not ( = ?auto_140167 ?auto_140166 ) ) ( not ( = ?auto_140165 ?auto_140164 ) ) ( not ( = ?auto_140168 ?auto_140164 ) ) ( not ( = ?auto_140167 ?auto_140164 ) ) ( not ( = ?auto_140166 ?auto_140164 ) ) ( not ( = ?auto_140169 ?auto_140171 ) ) ( not ( = ?auto_140169 ?auto_140170 ) ) ( not ( = ?auto_140169 ?auto_140173 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_140165 ?auto_140168 ?auto_140167 ?auto_140164 ?auto_140166 ?auto_140163 )
      ( DELIVER-5PKG-VERIFY ?auto_140164 ?auto_140165 ?auto_140166 ?auto_140167 ?auto_140168 ?auto_140163 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_140874 - OBJ
      ?auto_140875 - OBJ
      ?auto_140876 - OBJ
      ?auto_140877 - OBJ
      ?auto_140878 - OBJ
      ?auto_140873 - LOCATION
    )
    :vars
    (
      ?auto_140879 - LOCATION
      ?auto_140884 - CITY
      ?auto_140881 - LOCATION
      ?auto_140880 - LOCATION
      ?auto_140883 - LOCATION
      ?auto_140882 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140879 ?auto_140884 ) ( IN-CITY ?auto_140873 ?auto_140884 ) ( not ( = ?auto_140873 ?auto_140879 ) ) ( OBJ-AT ?auto_140874 ?auto_140879 ) ( IN-CITY ?auto_140881 ?auto_140884 ) ( not ( = ?auto_140873 ?auto_140881 ) ) ( OBJ-AT ?auto_140878 ?auto_140881 ) ( OBJ-AT ?auto_140877 ?auto_140881 ) ( IN-CITY ?auto_140880 ?auto_140884 ) ( not ( = ?auto_140873 ?auto_140880 ) ) ( OBJ-AT ?auto_140875 ?auto_140880 ) ( IN-CITY ?auto_140883 ?auto_140884 ) ( not ( = ?auto_140873 ?auto_140883 ) ) ( OBJ-AT ?auto_140876 ?auto_140883 ) ( TRUCK-AT ?auto_140882 ?auto_140873 ) ( not ( = ?auto_140876 ?auto_140875 ) ) ( not ( = ?auto_140880 ?auto_140883 ) ) ( not ( = ?auto_140876 ?auto_140877 ) ) ( not ( = ?auto_140875 ?auto_140877 ) ) ( not ( = ?auto_140881 ?auto_140880 ) ) ( not ( = ?auto_140881 ?auto_140883 ) ) ( not ( = ?auto_140876 ?auto_140878 ) ) ( not ( = ?auto_140875 ?auto_140878 ) ) ( not ( = ?auto_140877 ?auto_140878 ) ) ( not ( = ?auto_140876 ?auto_140874 ) ) ( not ( = ?auto_140875 ?auto_140874 ) ) ( not ( = ?auto_140877 ?auto_140874 ) ) ( not ( = ?auto_140878 ?auto_140874 ) ) ( not ( = ?auto_140879 ?auto_140881 ) ) ( not ( = ?auto_140879 ?auto_140880 ) ) ( not ( = ?auto_140879 ?auto_140883 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_140876 ?auto_140875 ?auto_140877 ?auto_140874 ?auto_140878 ?auto_140873 )
      ( DELIVER-5PKG-VERIFY ?auto_140874 ?auto_140875 ?auto_140876 ?auto_140877 ?auto_140878 ?auto_140873 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_140925 - OBJ
      ?auto_140926 - OBJ
      ?auto_140927 - OBJ
      ?auto_140928 - OBJ
      ?auto_140929 - OBJ
      ?auto_140924 - LOCATION
    )
    :vars
    (
      ?auto_140930 - LOCATION
      ?auto_140935 - CITY
      ?auto_140932 - LOCATION
      ?auto_140931 - LOCATION
      ?auto_140934 - LOCATION
      ?auto_140933 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140930 ?auto_140935 ) ( IN-CITY ?auto_140924 ?auto_140935 ) ( not ( = ?auto_140924 ?auto_140930 ) ) ( OBJ-AT ?auto_140925 ?auto_140930 ) ( IN-CITY ?auto_140932 ?auto_140935 ) ( not ( = ?auto_140924 ?auto_140932 ) ) ( OBJ-AT ?auto_140928 ?auto_140932 ) ( OBJ-AT ?auto_140929 ?auto_140932 ) ( IN-CITY ?auto_140931 ?auto_140935 ) ( not ( = ?auto_140924 ?auto_140931 ) ) ( OBJ-AT ?auto_140926 ?auto_140931 ) ( IN-CITY ?auto_140934 ?auto_140935 ) ( not ( = ?auto_140924 ?auto_140934 ) ) ( OBJ-AT ?auto_140927 ?auto_140934 ) ( TRUCK-AT ?auto_140933 ?auto_140924 ) ( not ( = ?auto_140927 ?auto_140926 ) ) ( not ( = ?auto_140931 ?auto_140934 ) ) ( not ( = ?auto_140927 ?auto_140929 ) ) ( not ( = ?auto_140926 ?auto_140929 ) ) ( not ( = ?auto_140932 ?auto_140931 ) ) ( not ( = ?auto_140932 ?auto_140934 ) ) ( not ( = ?auto_140927 ?auto_140928 ) ) ( not ( = ?auto_140926 ?auto_140928 ) ) ( not ( = ?auto_140929 ?auto_140928 ) ) ( not ( = ?auto_140927 ?auto_140925 ) ) ( not ( = ?auto_140926 ?auto_140925 ) ) ( not ( = ?auto_140929 ?auto_140925 ) ) ( not ( = ?auto_140928 ?auto_140925 ) ) ( not ( = ?auto_140930 ?auto_140932 ) ) ( not ( = ?auto_140930 ?auto_140931 ) ) ( not ( = ?auto_140930 ?auto_140934 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_140927 ?auto_140926 ?auto_140929 ?auto_140925 ?auto_140928 ?auto_140924 )
      ( DELIVER-5PKG-VERIFY ?auto_140925 ?auto_140926 ?auto_140927 ?auto_140928 ?auto_140929 ?auto_140924 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_141418 - OBJ
      ?auto_141419 - OBJ
      ?auto_141420 - OBJ
      ?auto_141421 - OBJ
      ?auto_141422 - OBJ
      ?auto_141417 - LOCATION
    )
    :vars
    (
      ?auto_141423 - LOCATION
      ?auto_141428 - CITY
      ?auto_141425 - LOCATION
      ?auto_141424 - LOCATION
      ?auto_141427 - LOCATION
      ?auto_141426 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_141423 ?auto_141428 ) ( IN-CITY ?auto_141417 ?auto_141428 ) ( not ( = ?auto_141417 ?auto_141423 ) ) ( OBJ-AT ?auto_141418 ?auto_141423 ) ( IN-CITY ?auto_141425 ?auto_141428 ) ( not ( = ?auto_141417 ?auto_141425 ) ) ( OBJ-AT ?auto_141422 ?auto_141425 ) ( OBJ-AT ?auto_141420 ?auto_141425 ) ( IN-CITY ?auto_141424 ?auto_141428 ) ( not ( = ?auto_141417 ?auto_141424 ) ) ( OBJ-AT ?auto_141419 ?auto_141424 ) ( IN-CITY ?auto_141427 ?auto_141428 ) ( not ( = ?auto_141417 ?auto_141427 ) ) ( OBJ-AT ?auto_141421 ?auto_141427 ) ( TRUCK-AT ?auto_141426 ?auto_141417 ) ( not ( = ?auto_141421 ?auto_141419 ) ) ( not ( = ?auto_141424 ?auto_141427 ) ) ( not ( = ?auto_141421 ?auto_141420 ) ) ( not ( = ?auto_141419 ?auto_141420 ) ) ( not ( = ?auto_141425 ?auto_141424 ) ) ( not ( = ?auto_141425 ?auto_141427 ) ) ( not ( = ?auto_141421 ?auto_141422 ) ) ( not ( = ?auto_141419 ?auto_141422 ) ) ( not ( = ?auto_141420 ?auto_141422 ) ) ( not ( = ?auto_141421 ?auto_141418 ) ) ( not ( = ?auto_141419 ?auto_141418 ) ) ( not ( = ?auto_141420 ?auto_141418 ) ) ( not ( = ?auto_141422 ?auto_141418 ) ) ( not ( = ?auto_141423 ?auto_141425 ) ) ( not ( = ?auto_141423 ?auto_141424 ) ) ( not ( = ?auto_141423 ?auto_141427 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_141421 ?auto_141419 ?auto_141420 ?auto_141418 ?auto_141422 ?auto_141417 )
      ( DELIVER-5PKG-VERIFY ?auto_141418 ?auto_141419 ?auto_141420 ?auto_141421 ?auto_141422 ?auto_141417 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_141579 - OBJ
      ?auto_141580 - OBJ
      ?auto_141581 - OBJ
      ?auto_141582 - OBJ
      ?auto_141583 - OBJ
      ?auto_141578 - LOCATION
    )
    :vars
    (
      ?auto_141584 - LOCATION
      ?auto_141589 - CITY
      ?auto_141586 - LOCATION
      ?auto_141585 - LOCATION
      ?auto_141588 - LOCATION
      ?auto_141587 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_141584 ?auto_141589 ) ( IN-CITY ?auto_141578 ?auto_141589 ) ( not ( = ?auto_141578 ?auto_141584 ) ) ( OBJ-AT ?auto_141579 ?auto_141584 ) ( IN-CITY ?auto_141586 ?auto_141589 ) ( not ( = ?auto_141578 ?auto_141586 ) ) ( OBJ-AT ?auto_141582 ?auto_141586 ) ( OBJ-AT ?auto_141581 ?auto_141586 ) ( IN-CITY ?auto_141585 ?auto_141589 ) ( not ( = ?auto_141578 ?auto_141585 ) ) ( OBJ-AT ?auto_141580 ?auto_141585 ) ( IN-CITY ?auto_141588 ?auto_141589 ) ( not ( = ?auto_141578 ?auto_141588 ) ) ( OBJ-AT ?auto_141583 ?auto_141588 ) ( TRUCK-AT ?auto_141587 ?auto_141578 ) ( not ( = ?auto_141583 ?auto_141580 ) ) ( not ( = ?auto_141585 ?auto_141588 ) ) ( not ( = ?auto_141583 ?auto_141581 ) ) ( not ( = ?auto_141580 ?auto_141581 ) ) ( not ( = ?auto_141586 ?auto_141585 ) ) ( not ( = ?auto_141586 ?auto_141588 ) ) ( not ( = ?auto_141583 ?auto_141582 ) ) ( not ( = ?auto_141580 ?auto_141582 ) ) ( not ( = ?auto_141581 ?auto_141582 ) ) ( not ( = ?auto_141583 ?auto_141579 ) ) ( not ( = ?auto_141580 ?auto_141579 ) ) ( not ( = ?auto_141581 ?auto_141579 ) ) ( not ( = ?auto_141582 ?auto_141579 ) ) ( not ( = ?auto_141584 ?auto_141586 ) ) ( not ( = ?auto_141584 ?auto_141585 ) ) ( not ( = ?auto_141584 ?auto_141588 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_141583 ?auto_141580 ?auto_141581 ?auto_141579 ?auto_141582 ?auto_141578 )
      ( DELIVER-5PKG-VERIFY ?auto_141579 ?auto_141580 ?auto_141581 ?auto_141582 ?auto_141583 ?auto_141578 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_141737 - OBJ
      ?auto_141738 - OBJ
      ?auto_141739 - OBJ
      ?auto_141740 - OBJ
      ?auto_141741 - OBJ
      ?auto_141736 - LOCATION
    )
    :vars
    (
      ?auto_141742 - LOCATION
      ?auto_141747 - CITY
      ?auto_141744 - LOCATION
      ?auto_141743 - LOCATION
      ?auto_141746 - LOCATION
      ?auto_141745 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_141742 ?auto_141747 ) ( IN-CITY ?auto_141736 ?auto_141747 ) ( not ( = ?auto_141736 ?auto_141742 ) ) ( OBJ-AT ?auto_141737 ?auto_141742 ) ( IN-CITY ?auto_141744 ?auto_141747 ) ( not ( = ?auto_141736 ?auto_141744 ) ) ( OBJ-AT ?auto_141739 ?auto_141744 ) ( OBJ-AT ?auto_141741 ?auto_141744 ) ( IN-CITY ?auto_141743 ?auto_141747 ) ( not ( = ?auto_141736 ?auto_141743 ) ) ( OBJ-AT ?auto_141738 ?auto_141743 ) ( IN-CITY ?auto_141746 ?auto_141747 ) ( not ( = ?auto_141736 ?auto_141746 ) ) ( OBJ-AT ?auto_141740 ?auto_141746 ) ( TRUCK-AT ?auto_141745 ?auto_141736 ) ( not ( = ?auto_141740 ?auto_141738 ) ) ( not ( = ?auto_141743 ?auto_141746 ) ) ( not ( = ?auto_141740 ?auto_141741 ) ) ( not ( = ?auto_141738 ?auto_141741 ) ) ( not ( = ?auto_141744 ?auto_141743 ) ) ( not ( = ?auto_141744 ?auto_141746 ) ) ( not ( = ?auto_141740 ?auto_141739 ) ) ( not ( = ?auto_141738 ?auto_141739 ) ) ( not ( = ?auto_141741 ?auto_141739 ) ) ( not ( = ?auto_141740 ?auto_141737 ) ) ( not ( = ?auto_141738 ?auto_141737 ) ) ( not ( = ?auto_141741 ?auto_141737 ) ) ( not ( = ?auto_141739 ?auto_141737 ) ) ( not ( = ?auto_141742 ?auto_141744 ) ) ( not ( = ?auto_141742 ?auto_141743 ) ) ( not ( = ?auto_141742 ?auto_141746 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_141740 ?auto_141738 ?auto_141741 ?auto_141737 ?auto_141739 ?auto_141736 )
      ( DELIVER-5PKG-VERIFY ?auto_141737 ?auto_141738 ?auto_141739 ?auto_141740 ?auto_141741 ?auto_141736 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_141843 - OBJ
      ?auto_141844 - OBJ
      ?auto_141845 - OBJ
      ?auto_141846 - OBJ
      ?auto_141847 - OBJ
      ?auto_141842 - LOCATION
    )
    :vars
    (
      ?auto_141848 - LOCATION
      ?auto_141853 - CITY
      ?auto_141850 - LOCATION
      ?auto_141849 - LOCATION
      ?auto_141852 - LOCATION
      ?auto_141851 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_141848 ?auto_141853 ) ( IN-CITY ?auto_141842 ?auto_141853 ) ( not ( = ?auto_141842 ?auto_141848 ) ) ( OBJ-AT ?auto_141843 ?auto_141848 ) ( IN-CITY ?auto_141850 ?auto_141853 ) ( not ( = ?auto_141842 ?auto_141850 ) ) ( OBJ-AT ?auto_141845 ?auto_141850 ) ( OBJ-AT ?auto_141846 ?auto_141850 ) ( IN-CITY ?auto_141849 ?auto_141853 ) ( not ( = ?auto_141842 ?auto_141849 ) ) ( OBJ-AT ?auto_141844 ?auto_141849 ) ( IN-CITY ?auto_141852 ?auto_141853 ) ( not ( = ?auto_141842 ?auto_141852 ) ) ( OBJ-AT ?auto_141847 ?auto_141852 ) ( TRUCK-AT ?auto_141851 ?auto_141842 ) ( not ( = ?auto_141847 ?auto_141844 ) ) ( not ( = ?auto_141849 ?auto_141852 ) ) ( not ( = ?auto_141847 ?auto_141846 ) ) ( not ( = ?auto_141844 ?auto_141846 ) ) ( not ( = ?auto_141850 ?auto_141849 ) ) ( not ( = ?auto_141850 ?auto_141852 ) ) ( not ( = ?auto_141847 ?auto_141845 ) ) ( not ( = ?auto_141844 ?auto_141845 ) ) ( not ( = ?auto_141846 ?auto_141845 ) ) ( not ( = ?auto_141847 ?auto_141843 ) ) ( not ( = ?auto_141844 ?auto_141843 ) ) ( not ( = ?auto_141846 ?auto_141843 ) ) ( not ( = ?auto_141845 ?auto_141843 ) ) ( not ( = ?auto_141848 ?auto_141850 ) ) ( not ( = ?auto_141848 ?auto_141849 ) ) ( not ( = ?auto_141848 ?auto_141852 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_141847 ?auto_141844 ?auto_141846 ?auto_141843 ?auto_141845 ?auto_141842 )
      ( DELIVER-5PKG-VERIFY ?auto_141843 ?auto_141844 ?auto_141845 ?auto_141846 ?auto_141847 ?auto_141842 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_142498 - OBJ
      ?auto_142499 - OBJ
      ?auto_142500 - OBJ
      ?auto_142501 - OBJ
      ?auto_142502 - OBJ
      ?auto_142497 - LOCATION
    )
    :vars
    (
      ?auto_142503 - LOCATION
      ?auto_142508 - CITY
      ?auto_142505 - LOCATION
      ?auto_142504 - LOCATION
      ?auto_142507 - LOCATION
      ?auto_142506 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_142503 ?auto_142508 ) ( IN-CITY ?auto_142497 ?auto_142508 ) ( not ( = ?auto_142497 ?auto_142503 ) ) ( OBJ-AT ?auto_142498 ?auto_142503 ) ( IN-CITY ?auto_142505 ?auto_142508 ) ( not ( = ?auto_142497 ?auto_142505 ) ) ( OBJ-AT ?auto_142502 ?auto_142505 ) ( OBJ-AT ?auto_142499 ?auto_142505 ) ( IN-CITY ?auto_142504 ?auto_142508 ) ( not ( = ?auto_142497 ?auto_142504 ) ) ( OBJ-AT ?auto_142501 ?auto_142504 ) ( IN-CITY ?auto_142507 ?auto_142508 ) ( not ( = ?auto_142497 ?auto_142507 ) ) ( OBJ-AT ?auto_142500 ?auto_142507 ) ( TRUCK-AT ?auto_142506 ?auto_142497 ) ( not ( = ?auto_142500 ?auto_142501 ) ) ( not ( = ?auto_142504 ?auto_142507 ) ) ( not ( = ?auto_142500 ?auto_142499 ) ) ( not ( = ?auto_142501 ?auto_142499 ) ) ( not ( = ?auto_142505 ?auto_142504 ) ) ( not ( = ?auto_142505 ?auto_142507 ) ) ( not ( = ?auto_142500 ?auto_142502 ) ) ( not ( = ?auto_142501 ?auto_142502 ) ) ( not ( = ?auto_142499 ?auto_142502 ) ) ( not ( = ?auto_142500 ?auto_142498 ) ) ( not ( = ?auto_142501 ?auto_142498 ) ) ( not ( = ?auto_142499 ?auto_142498 ) ) ( not ( = ?auto_142502 ?auto_142498 ) ) ( not ( = ?auto_142503 ?auto_142505 ) ) ( not ( = ?auto_142503 ?auto_142504 ) ) ( not ( = ?auto_142503 ?auto_142507 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_142500 ?auto_142501 ?auto_142499 ?auto_142498 ?auto_142502 ?auto_142497 )
      ( DELIVER-5PKG-VERIFY ?auto_142498 ?auto_142499 ?auto_142500 ?auto_142501 ?auto_142502 ?auto_142497 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_142604 - OBJ
      ?auto_142605 - OBJ
      ?auto_142606 - OBJ
      ?auto_142607 - OBJ
      ?auto_142608 - OBJ
      ?auto_142603 - LOCATION
    )
    :vars
    (
      ?auto_142609 - LOCATION
      ?auto_142614 - CITY
      ?auto_142611 - LOCATION
      ?auto_142610 - LOCATION
      ?auto_142613 - LOCATION
      ?auto_142612 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_142609 ?auto_142614 ) ( IN-CITY ?auto_142603 ?auto_142614 ) ( not ( = ?auto_142603 ?auto_142609 ) ) ( OBJ-AT ?auto_142604 ?auto_142609 ) ( IN-CITY ?auto_142611 ?auto_142614 ) ( not ( = ?auto_142603 ?auto_142611 ) ) ( OBJ-AT ?auto_142607 ?auto_142611 ) ( OBJ-AT ?auto_142605 ?auto_142611 ) ( IN-CITY ?auto_142610 ?auto_142614 ) ( not ( = ?auto_142603 ?auto_142610 ) ) ( OBJ-AT ?auto_142608 ?auto_142610 ) ( IN-CITY ?auto_142613 ?auto_142614 ) ( not ( = ?auto_142603 ?auto_142613 ) ) ( OBJ-AT ?auto_142606 ?auto_142613 ) ( TRUCK-AT ?auto_142612 ?auto_142603 ) ( not ( = ?auto_142606 ?auto_142608 ) ) ( not ( = ?auto_142610 ?auto_142613 ) ) ( not ( = ?auto_142606 ?auto_142605 ) ) ( not ( = ?auto_142608 ?auto_142605 ) ) ( not ( = ?auto_142611 ?auto_142610 ) ) ( not ( = ?auto_142611 ?auto_142613 ) ) ( not ( = ?auto_142606 ?auto_142607 ) ) ( not ( = ?auto_142608 ?auto_142607 ) ) ( not ( = ?auto_142605 ?auto_142607 ) ) ( not ( = ?auto_142606 ?auto_142604 ) ) ( not ( = ?auto_142608 ?auto_142604 ) ) ( not ( = ?auto_142605 ?auto_142604 ) ) ( not ( = ?auto_142607 ?auto_142604 ) ) ( not ( = ?auto_142609 ?auto_142611 ) ) ( not ( = ?auto_142609 ?auto_142610 ) ) ( not ( = ?auto_142609 ?auto_142613 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_142606 ?auto_142608 ?auto_142605 ?auto_142604 ?auto_142607 ?auto_142603 )
      ( DELIVER-5PKG-VERIFY ?auto_142604 ?auto_142605 ?auto_142606 ?auto_142607 ?auto_142608 ?auto_142603 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_142762 - OBJ
      ?auto_142763 - OBJ
      ?auto_142764 - OBJ
      ?auto_142765 - OBJ
      ?auto_142766 - OBJ
      ?auto_142761 - LOCATION
    )
    :vars
    (
      ?auto_142767 - LOCATION
      ?auto_142772 - CITY
      ?auto_142769 - LOCATION
      ?auto_142768 - LOCATION
      ?auto_142771 - LOCATION
      ?auto_142770 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_142767 ?auto_142772 ) ( IN-CITY ?auto_142761 ?auto_142772 ) ( not ( = ?auto_142761 ?auto_142767 ) ) ( OBJ-AT ?auto_142762 ?auto_142767 ) ( IN-CITY ?auto_142769 ?auto_142772 ) ( not ( = ?auto_142761 ?auto_142769 ) ) ( OBJ-AT ?auto_142766 ?auto_142769 ) ( OBJ-AT ?auto_142763 ?auto_142769 ) ( IN-CITY ?auto_142768 ?auto_142772 ) ( not ( = ?auto_142761 ?auto_142768 ) ) ( OBJ-AT ?auto_142764 ?auto_142768 ) ( IN-CITY ?auto_142771 ?auto_142772 ) ( not ( = ?auto_142761 ?auto_142771 ) ) ( OBJ-AT ?auto_142765 ?auto_142771 ) ( TRUCK-AT ?auto_142770 ?auto_142761 ) ( not ( = ?auto_142765 ?auto_142764 ) ) ( not ( = ?auto_142768 ?auto_142771 ) ) ( not ( = ?auto_142765 ?auto_142763 ) ) ( not ( = ?auto_142764 ?auto_142763 ) ) ( not ( = ?auto_142769 ?auto_142768 ) ) ( not ( = ?auto_142769 ?auto_142771 ) ) ( not ( = ?auto_142765 ?auto_142766 ) ) ( not ( = ?auto_142764 ?auto_142766 ) ) ( not ( = ?auto_142763 ?auto_142766 ) ) ( not ( = ?auto_142765 ?auto_142762 ) ) ( not ( = ?auto_142764 ?auto_142762 ) ) ( not ( = ?auto_142763 ?auto_142762 ) ) ( not ( = ?auto_142766 ?auto_142762 ) ) ( not ( = ?auto_142767 ?auto_142769 ) ) ( not ( = ?auto_142767 ?auto_142768 ) ) ( not ( = ?auto_142767 ?auto_142771 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_142765 ?auto_142764 ?auto_142763 ?auto_142762 ?auto_142766 ?auto_142761 )
      ( DELIVER-5PKG-VERIFY ?auto_142762 ?auto_142763 ?auto_142764 ?auto_142765 ?auto_142766 ?auto_142761 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_142923 - OBJ
      ?auto_142924 - OBJ
      ?auto_142925 - OBJ
      ?auto_142926 - OBJ
      ?auto_142927 - OBJ
      ?auto_142922 - LOCATION
    )
    :vars
    (
      ?auto_142928 - LOCATION
      ?auto_142933 - CITY
      ?auto_142930 - LOCATION
      ?auto_142929 - LOCATION
      ?auto_142932 - LOCATION
      ?auto_142931 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_142928 ?auto_142933 ) ( IN-CITY ?auto_142922 ?auto_142933 ) ( not ( = ?auto_142922 ?auto_142928 ) ) ( OBJ-AT ?auto_142923 ?auto_142928 ) ( IN-CITY ?auto_142930 ?auto_142933 ) ( not ( = ?auto_142922 ?auto_142930 ) ) ( OBJ-AT ?auto_142926 ?auto_142930 ) ( OBJ-AT ?auto_142924 ?auto_142930 ) ( IN-CITY ?auto_142929 ?auto_142933 ) ( not ( = ?auto_142922 ?auto_142929 ) ) ( OBJ-AT ?auto_142925 ?auto_142929 ) ( IN-CITY ?auto_142932 ?auto_142933 ) ( not ( = ?auto_142922 ?auto_142932 ) ) ( OBJ-AT ?auto_142927 ?auto_142932 ) ( TRUCK-AT ?auto_142931 ?auto_142922 ) ( not ( = ?auto_142927 ?auto_142925 ) ) ( not ( = ?auto_142929 ?auto_142932 ) ) ( not ( = ?auto_142927 ?auto_142924 ) ) ( not ( = ?auto_142925 ?auto_142924 ) ) ( not ( = ?auto_142930 ?auto_142929 ) ) ( not ( = ?auto_142930 ?auto_142932 ) ) ( not ( = ?auto_142927 ?auto_142926 ) ) ( not ( = ?auto_142925 ?auto_142926 ) ) ( not ( = ?auto_142924 ?auto_142926 ) ) ( not ( = ?auto_142927 ?auto_142923 ) ) ( not ( = ?auto_142925 ?auto_142923 ) ) ( not ( = ?auto_142924 ?auto_142923 ) ) ( not ( = ?auto_142926 ?auto_142923 ) ) ( not ( = ?auto_142928 ?auto_142930 ) ) ( not ( = ?auto_142928 ?auto_142929 ) ) ( not ( = ?auto_142928 ?auto_142932 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_142927 ?auto_142925 ?auto_142924 ?auto_142923 ?auto_142926 ?auto_142922 )
      ( DELIVER-5PKG-VERIFY ?auto_142923 ?auto_142924 ?auto_142925 ?auto_142926 ?auto_142927 ?auto_142922 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_143416 - OBJ
      ?auto_143417 - OBJ
      ?auto_143418 - OBJ
      ?auto_143419 - OBJ
      ?auto_143420 - OBJ
      ?auto_143415 - LOCATION
    )
    :vars
    (
      ?auto_143421 - LOCATION
      ?auto_143426 - CITY
      ?auto_143423 - LOCATION
      ?auto_143422 - LOCATION
      ?auto_143425 - LOCATION
      ?auto_143424 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_143421 ?auto_143426 ) ( IN-CITY ?auto_143415 ?auto_143426 ) ( not ( = ?auto_143415 ?auto_143421 ) ) ( OBJ-AT ?auto_143416 ?auto_143421 ) ( IN-CITY ?auto_143423 ?auto_143426 ) ( not ( = ?auto_143415 ?auto_143423 ) ) ( OBJ-AT ?auto_143418 ?auto_143423 ) ( OBJ-AT ?auto_143417 ?auto_143423 ) ( IN-CITY ?auto_143422 ?auto_143426 ) ( not ( = ?auto_143415 ?auto_143422 ) ) ( OBJ-AT ?auto_143420 ?auto_143422 ) ( IN-CITY ?auto_143425 ?auto_143426 ) ( not ( = ?auto_143415 ?auto_143425 ) ) ( OBJ-AT ?auto_143419 ?auto_143425 ) ( TRUCK-AT ?auto_143424 ?auto_143415 ) ( not ( = ?auto_143419 ?auto_143420 ) ) ( not ( = ?auto_143422 ?auto_143425 ) ) ( not ( = ?auto_143419 ?auto_143417 ) ) ( not ( = ?auto_143420 ?auto_143417 ) ) ( not ( = ?auto_143423 ?auto_143422 ) ) ( not ( = ?auto_143423 ?auto_143425 ) ) ( not ( = ?auto_143419 ?auto_143418 ) ) ( not ( = ?auto_143420 ?auto_143418 ) ) ( not ( = ?auto_143417 ?auto_143418 ) ) ( not ( = ?auto_143419 ?auto_143416 ) ) ( not ( = ?auto_143420 ?auto_143416 ) ) ( not ( = ?auto_143417 ?auto_143416 ) ) ( not ( = ?auto_143418 ?auto_143416 ) ) ( not ( = ?auto_143421 ?auto_143423 ) ) ( not ( = ?auto_143421 ?auto_143422 ) ) ( not ( = ?auto_143421 ?auto_143425 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_143419 ?auto_143420 ?auto_143417 ?auto_143416 ?auto_143418 ?auto_143415 )
      ( DELIVER-5PKG-VERIFY ?auto_143416 ?auto_143417 ?auto_143418 ?auto_143419 ?auto_143420 ?auto_143415 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_143467 - OBJ
      ?auto_143468 - OBJ
      ?auto_143469 - OBJ
      ?auto_143470 - OBJ
      ?auto_143471 - OBJ
      ?auto_143466 - LOCATION
    )
    :vars
    (
      ?auto_143472 - LOCATION
      ?auto_143477 - CITY
      ?auto_143474 - LOCATION
      ?auto_143473 - LOCATION
      ?auto_143476 - LOCATION
      ?auto_143475 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_143472 ?auto_143477 ) ( IN-CITY ?auto_143466 ?auto_143477 ) ( not ( = ?auto_143466 ?auto_143472 ) ) ( OBJ-AT ?auto_143467 ?auto_143472 ) ( IN-CITY ?auto_143474 ?auto_143477 ) ( not ( = ?auto_143466 ?auto_143474 ) ) ( OBJ-AT ?auto_143469 ?auto_143474 ) ( OBJ-AT ?auto_143468 ?auto_143474 ) ( IN-CITY ?auto_143473 ?auto_143477 ) ( not ( = ?auto_143466 ?auto_143473 ) ) ( OBJ-AT ?auto_143470 ?auto_143473 ) ( IN-CITY ?auto_143476 ?auto_143477 ) ( not ( = ?auto_143466 ?auto_143476 ) ) ( OBJ-AT ?auto_143471 ?auto_143476 ) ( TRUCK-AT ?auto_143475 ?auto_143466 ) ( not ( = ?auto_143471 ?auto_143470 ) ) ( not ( = ?auto_143473 ?auto_143476 ) ) ( not ( = ?auto_143471 ?auto_143468 ) ) ( not ( = ?auto_143470 ?auto_143468 ) ) ( not ( = ?auto_143474 ?auto_143473 ) ) ( not ( = ?auto_143474 ?auto_143476 ) ) ( not ( = ?auto_143471 ?auto_143469 ) ) ( not ( = ?auto_143470 ?auto_143469 ) ) ( not ( = ?auto_143468 ?auto_143469 ) ) ( not ( = ?auto_143471 ?auto_143467 ) ) ( not ( = ?auto_143470 ?auto_143467 ) ) ( not ( = ?auto_143468 ?auto_143467 ) ) ( not ( = ?auto_143469 ?auto_143467 ) ) ( not ( = ?auto_143472 ?auto_143474 ) ) ( not ( = ?auto_143472 ?auto_143473 ) ) ( not ( = ?auto_143472 ?auto_143476 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_143471 ?auto_143470 ?auto_143468 ?auto_143467 ?auto_143469 ?auto_143466 )
      ( DELIVER-5PKG-VERIFY ?auto_143467 ?auto_143468 ?auto_143469 ?auto_143470 ?auto_143471 ?auto_143466 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_144177 - OBJ
      ?auto_144178 - OBJ
      ?auto_144179 - OBJ
      ?auto_144180 - OBJ
      ?auto_144181 - OBJ
      ?auto_144176 - LOCATION
    )
    :vars
    (
      ?auto_144182 - LOCATION
      ?auto_144187 - CITY
      ?auto_144184 - LOCATION
      ?auto_144183 - LOCATION
      ?auto_144186 - LOCATION
      ?auto_144185 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144182 ?auto_144187 ) ( IN-CITY ?auto_144176 ?auto_144187 ) ( not ( = ?auto_144176 ?auto_144182 ) ) ( OBJ-AT ?auto_144177 ?auto_144182 ) ( IN-CITY ?auto_144184 ?auto_144187 ) ( not ( = ?auto_144176 ?auto_144184 ) ) ( OBJ-AT ?auto_144178 ?auto_144184 ) ( OBJ-AT ?auto_144181 ?auto_144184 ) ( IN-CITY ?auto_144183 ?auto_144187 ) ( not ( = ?auto_144176 ?auto_144183 ) ) ( OBJ-AT ?auto_144180 ?auto_144183 ) ( IN-CITY ?auto_144186 ?auto_144187 ) ( not ( = ?auto_144176 ?auto_144186 ) ) ( OBJ-AT ?auto_144179 ?auto_144186 ) ( TRUCK-AT ?auto_144185 ?auto_144176 ) ( not ( = ?auto_144179 ?auto_144180 ) ) ( not ( = ?auto_144183 ?auto_144186 ) ) ( not ( = ?auto_144179 ?auto_144181 ) ) ( not ( = ?auto_144180 ?auto_144181 ) ) ( not ( = ?auto_144184 ?auto_144183 ) ) ( not ( = ?auto_144184 ?auto_144186 ) ) ( not ( = ?auto_144179 ?auto_144178 ) ) ( not ( = ?auto_144180 ?auto_144178 ) ) ( not ( = ?auto_144181 ?auto_144178 ) ) ( not ( = ?auto_144179 ?auto_144177 ) ) ( not ( = ?auto_144180 ?auto_144177 ) ) ( not ( = ?auto_144181 ?auto_144177 ) ) ( not ( = ?auto_144178 ?auto_144177 ) ) ( not ( = ?auto_144182 ?auto_144184 ) ) ( not ( = ?auto_144182 ?auto_144183 ) ) ( not ( = ?auto_144182 ?auto_144186 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_144179 ?auto_144180 ?auto_144181 ?auto_144177 ?auto_144178 ?auto_144176 )
      ( DELIVER-5PKG-VERIFY ?auto_144177 ?auto_144178 ?auto_144179 ?auto_144180 ?auto_144181 ?auto_144176 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_144228 - OBJ
      ?auto_144229 - OBJ
      ?auto_144230 - OBJ
      ?auto_144231 - OBJ
      ?auto_144232 - OBJ
      ?auto_144227 - LOCATION
    )
    :vars
    (
      ?auto_144233 - LOCATION
      ?auto_144238 - CITY
      ?auto_144235 - LOCATION
      ?auto_144234 - LOCATION
      ?auto_144237 - LOCATION
      ?auto_144236 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144233 ?auto_144238 ) ( IN-CITY ?auto_144227 ?auto_144238 ) ( not ( = ?auto_144227 ?auto_144233 ) ) ( OBJ-AT ?auto_144228 ?auto_144233 ) ( IN-CITY ?auto_144235 ?auto_144238 ) ( not ( = ?auto_144227 ?auto_144235 ) ) ( OBJ-AT ?auto_144229 ?auto_144235 ) ( OBJ-AT ?auto_144231 ?auto_144235 ) ( IN-CITY ?auto_144234 ?auto_144238 ) ( not ( = ?auto_144227 ?auto_144234 ) ) ( OBJ-AT ?auto_144232 ?auto_144234 ) ( IN-CITY ?auto_144237 ?auto_144238 ) ( not ( = ?auto_144227 ?auto_144237 ) ) ( OBJ-AT ?auto_144230 ?auto_144237 ) ( TRUCK-AT ?auto_144236 ?auto_144227 ) ( not ( = ?auto_144230 ?auto_144232 ) ) ( not ( = ?auto_144234 ?auto_144237 ) ) ( not ( = ?auto_144230 ?auto_144231 ) ) ( not ( = ?auto_144232 ?auto_144231 ) ) ( not ( = ?auto_144235 ?auto_144234 ) ) ( not ( = ?auto_144235 ?auto_144237 ) ) ( not ( = ?auto_144230 ?auto_144229 ) ) ( not ( = ?auto_144232 ?auto_144229 ) ) ( not ( = ?auto_144231 ?auto_144229 ) ) ( not ( = ?auto_144230 ?auto_144228 ) ) ( not ( = ?auto_144232 ?auto_144228 ) ) ( not ( = ?auto_144231 ?auto_144228 ) ) ( not ( = ?auto_144229 ?auto_144228 ) ) ( not ( = ?auto_144233 ?auto_144235 ) ) ( not ( = ?auto_144233 ?auto_144234 ) ) ( not ( = ?auto_144233 ?auto_144237 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_144230 ?auto_144232 ?auto_144231 ?auto_144228 ?auto_144229 ?auto_144227 )
      ( DELIVER-5PKG-VERIFY ?auto_144228 ?auto_144229 ?auto_144230 ?auto_144231 ?auto_144232 ?auto_144227 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_144441 - OBJ
      ?auto_144442 - OBJ
      ?auto_144443 - OBJ
      ?auto_144444 - OBJ
      ?auto_144445 - OBJ
      ?auto_144440 - LOCATION
    )
    :vars
    (
      ?auto_144446 - LOCATION
      ?auto_144451 - CITY
      ?auto_144448 - LOCATION
      ?auto_144447 - LOCATION
      ?auto_144450 - LOCATION
      ?auto_144449 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144446 ?auto_144451 ) ( IN-CITY ?auto_144440 ?auto_144451 ) ( not ( = ?auto_144440 ?auto_144446 ) ) ( OBJ-AT ?auto_144441 ?auto_144446 ) ( IN-CITY ?auto_144448 ?auto_144451 ) ( not ( = ?auto_144440 ?auto_144448 ) ) ( OBJ-AT ?auto_144442 ?auto_144448 ) ( OBJ-AT ?auto_144445 ?auto_144448 ) ( IN-CITY ?auto_144447 ?auto_144451 ) ( not ( = ?auto_144440 ?auto_144447 ) ) ( OBJ-AT ?auto_144443 ?auto_144447 ) ( IN-CITY ?auto_144450 ?auto_144451 ) ( not ( = ?auto_144440 ?auto_144450 ) ) ( OBJ-AT ?auto_144444 ?auto_144450 ) ( TRUCK-AT ?auto_144449 ?auto_144440 ) ( not ( = ?auto_144444 ?auto_144443 ) ) ( not ( = ?auto_144447 ?auto_144450 ) ) ( not ( = ?auto_144444 ?auto_144445 ) ) ( not ( = ?auto_144443 ?auto_144445 ) ) ( not ( = ?auto_144448 ?auto_144447 ) ) ( not ( = ?auto_144448 ?auto_144450 ) ) ( not ( = ?auto_144444 ?auto_144442 ) ) ( not ( = ?auto_144443 ?auto_144442 ) ) ( not ( = ?auto_144445 ?auto_144442 ) ) ( not ( = ?auto_144444 ?auto_144441 ) ) ( not ( = ?auto_144443 ?auto_144441 ) ) ( not ( = ?auto_144445 ?auto_144441 ) ) ( not ( = ?auto_144442 ?auto_144441 ) ) ( not ( = ?auto_144446 ?auto_144448 ) ) ( not ( = ?auto_144446 ?auto_144447 ) ) ( not ( = ?auto_144446 ?auto_144450 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_144444 ?auto_144443 ?auto_144445 ?auto_144441 ?auto_144442 ?auto_144440 )
      ( DELIVER-5PKG-VERIFY ?auto_144441 ?auto_144442 ?auto_144443 ?auto_144444 ?auto_144445 ?auto_144440 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_144547 - OBJ
      ?auto_144548 - OBJ
      ?auto_144549 - OBJ
      ?auto_144550 - OBJ
      ?auto_144551 - OBJ
      ?auto_144546 - LOCATION
    )
    :vars
    (
      ?auto_144552 - LOCATION
      ?auto_144557 - CITY
      ?auto_144554 - LOCATION
      ?auto_144553 - LOCATION
      ?auto_144556 - LOCATION
      ?auto_144555 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144552 ?auto_144557 ) ( IN-CITY ?auto_144546 ?auto_144557 ) ( not ( = ?auto_144546 ?auto_144552 ) ) ( OBJ-AT ?auto_144547 ?auto_144552 ) ( IN-CITY ?auto_144554 ?auto_144557 ) ( not ( = ?auto_144546 ?auto_144554 ) ) ( OBJ-AT ?auto_144548 ?auto_144554 ) ( OBJ-AT ?auto_144550 ?auto_144554 ) ( IN-CITY ?auto_144553 ?auto_144557 ) ( not ( = ?auto_144546 ?auto_144553 ) ) ( OBJ-AT ?auto_144549 ?auto_144553 ) ( IN-CITY ?auto_144556 ?auto_144557 ) ( not ( = ?auto_144546 ?auto_144556 ) ) ( OBJ-AT ?auto_144551 ?auto_144556 ) ( TRUCK-AT ?auto_144555 ?auto_144546 ) ( not ( = ?auto_144551 ?auto_144549 ) ) ( not ( = ?auto_144553 ?auto_144556 ) ) ( not ( = ?auto_144551 ?auto_144550 ) ) ( not ( = ?auto_144549 ?auto_144550 ) ) ( not ( = ?auto_144554 ?auto_144553 ) ) ( not ( = ?auto_144554 ?auto_144556 ) ) ( not ( = ?auto_144551 ?auto_144548 ) ) ( not ( = ?auto_144549 ?auto_144548 ) ) ( not ( = ?auto_144550 ?auto_144548 ) ) ( not ( = ?auto_144551 ?auto_144547 ) ) ( not ( = ?auto_144549 ?auto_144547 ) ) ( not ( = ?auto_144550 ?auto_144547 ) ) ( not ( = ?auto_144548 ?auto_144547 ) ) ( not ( = ?auto_144552 ?auto_144554 ) ) ( not ( = ?auto_144552 ?auto_144553 ) ) ( not ( = ?auto_144552 ?auto_144556 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_144551 ?auto_144549 ?auto_144550 ?auto_144547 ?auto_144548 ?auto_144546 )
      ( DELIVER-5PKG-VERIFY ?auto_144547 ?auto_144548 ?auto_144549 ?auto_144550 ?auto_144551 ?auto_144546 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_144760 - OBJ
      ?auto_144761 - OBJ
      ?auto_144762 - OBJ
      ?auto_144763 - OBJ
      ?auto_144764 - OBJ
      ?auto_144759 - LOCATION
    )
    :vars
    (
      ?auto_144765 - LOCATION
      ?auto_144770 - CITY
      ?auto_144767 - LOCATION
      ?auto_144766 - LOCATION
      ?auto_144769 - LOCATION
      ?auto_144768 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144765 ?auto_144770 ) ( IN-CITY ?auto_144759 ?auto_144770 ) ( not ( = ?auto_144759 ?auto_144765 ) ) ( OBJ-AT ?auto_144760 ?auto_144765 ) ( IN-CITY ?auto_144767 ?auto_144770 ) ( not ( = ?auto_144759 ?auto_144767 ) ) ( OBJ-AT ?auto_144761 ?auto_144767 ) ( OBJ-AT ?auto_144762 ?auto_144767 ) ( IN-CITY ?auto_144766 ?auto_144770 ) ( not ( = ?auto_144759 ?auto_144766 ) ) ( OBJ-AT ?auto_144764 ?auto_144766 ) ( IN-CITY ?auto_144769 ?auto_144770 ) ( not ( = ?auto_144759 ?auto_144769 ) ) ( OBJ-AT ?auto_144763 ?auto_144769 ) ( TRUCK-AT ?auto_144768 ?auto_144759 ) ( not ( = ?auto_144763 ?auto_144764 ) ) ( not ( = ?auto_144766 ?auto_144769 ) ) ( not ( = ?auto_144763 ?auto_144762 ) ) ( not ( = ?auto_144764 ?auto_144762 ) ) ( not ( = ?auto_144767 ?auto_144766 ) ) ( not ( = ?auto_144767 ?auto_144769 ) ) ( not ( = ?auto_144763 ?auto_144761 ) ) ( not ( = ?auto_144764 ?auto_144761 ) ) ( not ( = ?auto_144762 ?auto_144761 ) ) ( not ( = ?auto_144763 ?auto_144760 ) ) ( not ( = ?auto_144764 ?auto_144760 ) ) ( not ( = ?auto_144762 ?auto_144760 ) ) ( not ( = ?auto_144761 ?auto_144760 ) ) ( not ( = ?auto_144765 ?auto_144767 ) ) ( not ( = ?auto_144765 ?auto_144766 ) ) ( not ( = ?auto_144765 ?auto_144769 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_144763 ?auto_144764 ?auto_144762 ?auto_144760 ?auto_144761 ?auto_144759 )
      ( DELIVER-5PKG-VERIFY ?auto_144760 ?auto_144761 ?auto_144762 ?auto_144763 ?auto_144764 ?auto_144759 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_144811 - OBJ
      ?auto_144812 - OBJ
      ?auto_144813 - OBJ
      ?auto_144814 - OBJ
      ?auto_144815 - OBJ
      ?auto_144810 - LOCATION
    )
    :vars
    (
      ?auto_144816 - LOCATION
      ?auto_144821 - CITY
      ?auto_144818 - LOCATION
      ?auto_144817 - LOCATION
      ?auto_144820 - LOCATION
      ?auto_144819 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144816 ?auto_144821 ) ( IN-CITY ?auto_144810 ?auto_144821 ) ( not ( = ?auto_144810 ?auto_144816 ) ) ( OBJ-AT ?auto_144811 ?auto_144816 ) ( IN-CITY ?auto_144818 ?auto_144821 ) ( not ( = ?auto_144810 ?auto_144818 ) ) ( OBJ-AT ?auto_144812 ?auto_144818 ) ( OBJ-AT ?auto_144813 ?auto_144818 ) ( IN-CITY ?auto_144817 ?auto_144821 ) ( not ( = ?auto_144810 ?auto_144817 ) ) ( OBJ-AT ?auto_144814 ?auto_144817 ) ( IN-CITY ?auto_144820 ?auto_144821 ) ( not ( = ?auto_144810 ?auto_144820 ) ) ( OBJ-AT ?auto_144815 ?auto_144820 ) ( TRUCK-AT ?auto_144819 ?auto_144810 ) ( not ( = ?auto_144815 ?auto_144814 ) ) ( not ( = ?auto_144817 ?auto_144820 ) ) ( not ( = ?auto_144815 ?auto_144813 ) ) ( not ( = ?auto_144814 ?auto_144813 ) ) ( not ( = ?auto_144818 ?auto_144817 ) ) ( not ( = ?auto_144818 ?auto_144820 ) ) ( not ( = ?auto_144815 ?auto_144812 ) ) ( not ( = ?auto_144814 ?auto_144812 ) ) ( not ( = ?auto_144813 ?auto_144812 ) ) ( not ( = ?auto_144815 ?auto_144811 ) ) ( not ( = ?auto_144814 ?auto_144811 ) ) ( not ( = ?auto_144813 ?auto_144811 ) ) ( not ( = ?auto_144812 ?auto_144811 ) ) ( not ( = ?auto_144816 ?auto_144818 ) ) ( not ( = ?auto_144816 ?auto_144817 ) ) ( not ( = ?auto_144816 ?auto_144820 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_144815 ?auto_144814 ?auto_144813 ?auto_144811 ?auto_144812 ?auto_144810 )
      ( DELIVER-5PKG-VERIFY ?auto_144811 ?auto_144812 ?auto_144813 ?auto_144814 ?auto_144815 ?auto_144810 ) )
  )

)

