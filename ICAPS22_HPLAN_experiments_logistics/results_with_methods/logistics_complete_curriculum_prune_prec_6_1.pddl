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
      ?auto_10543 - OBJ
      ?auto_10544 - LOCATION
    )
    :vars
    (
      ?auto_10545 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10545 ?auto_10544 ) ( IN-TRUCK ?auto_10543 ?auto_10545 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_10543 ?auto_10545 ?auto_10544 )
      ( DELIVER-1PKG-VERIFY ?auto_10543 ?auto_10544 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10548 - OBJ
      ?auto_10549 - LOCATION
    )
    :vars
    (
      ?auto_10550 - TRUCK
      ?auto_10551 - LOCATION
      ?auto_10552 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10548 ?auto_10550 ) ( TRUCK-AT ?auto_10550 ?auto_10551 ) ( IN-CITY ?auto_10551 ?auto_10552 ) ( IN-CITY ?auto_10549 ?auto_10552 ) ( not ( = ?auto_10549 ?auto_10551 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10550 ?auto_10551 ?auto_10549 ?auto_10552 )
      ( DELIVER-1PKG ?auto_10548 ?auto_10549 )
      ( DELIVER-1PKG-VERIFY ?auto_10548 ?auto_10549 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10555 - OBJ
      ?auto_10556 - LOCATION
    )
    :vars
    (
      ?auto_10559 - TRUCK
      ?auto_10557 - LOCATION
      ?auto_10558 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10559 ?auto_10557 ) ( IN-CITY ?auto_10557 ?auto_10558 ) ( IN-CITY ?auto_10556 ?auto_10558 ) ( not ( = ?auto_10556 ?auto_10557 ) ) ( OBJ-AT ?auto_10555 ?auto_10557 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10555 ?auto_10559 ?auto_10557 )
      ( DELIVER-1PKG ?auto_10555 ?auto_10556 )
      ( DELIVER-1PKG-VERIFY ?auto_10555 ?auto_10556 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10562 - OBJ
      ?auto_10563 - LOCATION
    )
    :vars
    (
      ?auto_10564 - LOCATION
      ?auto_10566 - CITY
      ?auto_10565 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10564 ?auto_10566 ) ( IN-CITY ?auto_10563 ?auto_10566 ) ( not ( = ?auto_10563 ?auto_10564 ) ) ( OBJ-AT ?auto_10562 ?auto_10564 ) ( TRUCK-AT ?auto_10565 ?auto_10563 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10565 ?auto_10563 ?auto_10564 ?auto_10566 )
      ( DELIVER-1PKG ?auto_10562 ?auto_10563 )
      ( DELIVER-1PKG-VERIFY ?auto_10562 ?auto_10563 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10596 - OBJ
      ?auto_10598 - OBJ
      ?auto_10597 - LOCATION
    )
    :vars
    (
      ?auto_10599 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10598 ?auto_10596 ) ( TRUCK-AT ?auto_10599 ?auto_10597 ) ( IN-TRUCK ?auto_10598 ?auto_10599 ) ( OBJ-AT ?auto_10596 ?auto_10597 ) ( not ( = ?auto_10596 ?auto_10598 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10598 ?auto_10597 )
      ( DELIVER-2PKG-VERIFY ?auto_10596 ?auto_10598 ?auto_10597 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10603 - OBJ
      ?auto_10605 - OBJ
      ?auto_10604 - LOCATION
    )
    :vars
    (
      ?auto_10607 - TRUCK
      ?auto_10608 - LOCATION
      ?auto_10606 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10605 ?auto_10603 ) ( IN-TRUCK ?auto_10605 ?auto_10607 ) ( TRUCK-AT ?auto_10607 ?auto_10608 ) ( IN-CITY ?auto_10608 ?auto_10606 ) ( IN-CITY ?auto_10604 ?auto_10606 ) ( not ( = ?auto_10604 ?auto_10608 ) ) ( OBJ-AT ?auto_10603 ?auto_10604 ) ( not ( = ?auto_10603 ?auto_10605 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10605 ?auto_10604 )
      ( DELIVER-2PKG-VERIFY ?auto_10603 ?auto_10605 ?auto_10604 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10612 - OBJ
      ?auto_10614 - OBJ
      ?auto_10613 - LOCATION
    )
    :vars
    (
      ?auto_10617 - TRUCK
      ?auto_10615 - LOCATION
      ?auto_10616 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10614 ?auto_10612 ) ( TRUCK-AT ?auto_10617 ?auto_10615 ) ( IN-CITY ?auto_10615 ?auto_10616 ) ( IN-CITY ?auto_10613 ?auto_10616 ) ( not ( = ?auto_10613 ?auto_10615 ) ) ( OBJ-AT ?auto_10614 ?auto_10615 ) ( OBJ-AT ?auto_10612 ?auto_10613 ) ( not ( = ?auto_10612 ?auto_10614 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10614 ?auto_10613 )
      ( DELIVER-2PKG-VERIFY ?auto_10612 ?auto_10614 ?auto_10613 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10621 - OBJ
      ?auto_10623 - OBJ
      ?auto_10622 - LOCATION
    )
    :vars
    (
      ?auto_10624 - LOCATION
      ?auto_10625 - CITY
      ?auto_10626 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10623 ?auto_10621 ) ( IN-CITY ?auto_10624 ?auto_10625 ) ( IN-CITY ?auto_10622 ?auto_10625 ) ( not ( = ?auto_10622 ?auto_10624 ) ) ( OBJ-AT ?auto_10623 ?auto_10624 ) ( TRUCK-AT ?auto_10626 ?auto_10622 ) ( OBJ-AT ?auto_10621 ?auto_10622 ) ( not ( = ?auto_10621 ?auto_10623 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10623 ?auto_10622 )
      ( DELIVER-2PKG-VERIFY ?auto_10621 ?auto_10623 ?auto_10622 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10630 - OBJ
      ?auto_10632 - OBJ
      ?auto_10631 - LOCATION
    )
    :vars
    (
      ?auto_10634 - LOCATION
      ?auto_10633 - CITY
      ?auto_10635 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10632 ?auto_10630 ) ( IN-CITY ?auto_10634 ?auto_10633 ) ( IN-CITY ?auto_10631 ?auto_10633 ) ( not ( = ?auto_10631 ?auto_10634 ) ) ( OBJ-AT ?auto_10632 ?auto_10634 ) ( TRUCK-AT ?auto_10635 ?auto_10631 ) ( not ( = ?auto_10630 ?auto_10632 ) ) ( IN-TRUCK ?auto_10630 ?auto_10635 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10630 ?auto_10631 )
      ( DELIVER-2PKG ?auto_10630 ?auto_10632 ?auto_10631 )
      ( DELIVER-2PKG-VERIFY ?auto_10630 ?auto_10632 ?auto_10631 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10639 - OBJ
      ?auto_10641 - OBJ
      ?auto_10640 - LOCATION
    )
    :vars
    (
      ?auto_10642 - LOCATION
      ?auto_10643 - CITY
      ?auto_10644 - TRUCK
      ?auto_10645 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10641 ?auto_10639 ) ( IN-CITY ?auto_10642 ?auto_10643 ) ( IN-CITY ?auto_10640 ?auto_10643 ) ( not ( = ?auto_10640 ?auto_10642 ) ) ( OBJ-AT ?auto_10641 ?auto_10642 ) ( not ( = ?auto_10639 ?auto_10641 ) ) ( IN-TRUCK ?auto_10639 ?auto_10644 ) ( TRUCK-AT ?auto_10644 ?auto_10645 ) ( IN-CITY ?auto_10645 ?auto_10643 ) ( not ( = ?auto_10640 ?auto_10645 ) ) ( not ( = ?auto_10642 ?auto_10645 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10644 ?auto_10645 ?auto_10640 ?auto_10643 )
      ( DELIVER-2PKG ?auto_10639 ?auto_10641 ?auto_10640 )
      ( DELIVER-2PKG-VERIFY ?auto_10639 ?auto_10641 ?auto_10640 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10649 - OBJ
      ?auto_10651 - OBJ
      ?auto_10650 - LOCATION
    )
    :vars
    (
      ?auto_10652 - LOCATION
      ?auto_10653 - CITY
      ?auto_10655 - TRUCK
      ?auto_10654 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10651 ?auto_10649 ) ( IN-CITY ?auto_10652 ?auto_10653 ) ( IN-CITY ?auto_10650 ?auto_10653 ) ( not ( = ?auto_10650 ?auto_10652 ) ) ( OBJ-AT ?auto_10651 ?auto_10652 ) ( not ( = ?auto_10649 ?auto_10651 ) ) ( TRUCK-AT ?auto_10655 ?auto_10654 ) ( IN-CITY ?auto_10654 ?auto_10653 ) ( not ( = ?auto_10650 ?auto_10654 ) ) ( not ( = ?auto_10652 ?auto_10654 ) ) ( OBJ-AT ?auto_10649 ?auto_10654 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10649 ?auto_10655 ?auto_10654 )
      ( DELIVER-2PKG ?auto_10649 ?auto_10651 ?auto_10650 )
      ( DELIVER-2PKG-VERIFY ?auto_10649 ?auto_10651 ?auto_10650 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10659 - OBJ
      ?auto_10661 - OBJ
      ?auto_10660 - LOCATION
    )
    :vars
    (
      ?auto_10662 - LOCATION
      ?auto_10665 - CITY
      ?auto_10663 - LOCATION
      ?auto_10664 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10661 ?auto_10659 ) ( IN-CITY ?auto_10662 ?auto_10665 ) ( IN-CITY ?auto_10660 ?auto_10665 ) ( not ( = ?auto_10660 ?auto_10662 ) ) ( OBJ-AT ?auto_10661 ?auto_10662 ) ( not ( = ?auto_10659 ?auto_10661 ) ) ( IN-CITY ?auto_10663 ?auto_10665 ) ( not ( = ?auto_10660 ?auto_10663 ) ) ( not ( = ?auto_10662 ?auto_10663 ) ) ( OBJ-AT ?auto_10659 ?auto_10663 ) ( TRUCK-AT ?auto_10664 ?auto_10660 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10664 ?auto_10660 ?auto_10663 ?auto_10665 )
      ( DELIVER-2PKG ?auto_10659 ?auto_10661 ?auto_10660 )
      ( DELIVER-2PKG-VERIFY ?auto_10659 ?auto_10661 ?auto_10660 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10696 - OBJ
      ?auto_10698 - OBJ
      ?auto_10699 - OBJ
      ?auto_10697 - LOCATION
    )
    :vars
    (
      ?auto_10700 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10698 ?auto_10696 ) ( GREATER-THAN ?auto_10699 ?auto_10696 ) ( GREATER-THAN ?auto_10699 ?auto_10698 ) ( TRUCK-AT ?auto_10700 ?auto_10697 ) ( IN-TRUCK ?auto_10699 ?auto_10700 ) ( OBJ-AT ?auto_10696 ?auto_10697 ) ( OBJ-AT ?auto_10698 ?auto_10697 ) ( not ( = ?auto_10696 ?auto_10698 ) ) ( not ( = ?auto_10696 ?auto_10699 ) ) ( not ( = ?auto_10698 ?auto_10699 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10699 ?auto_10697 )
      ( DELIVER-3PKG-VERIFY ?auto_10696 ?auto_10698 ?auto_10699 ?auto_10697 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10705 - OBJ
      ?auto_10707 - OBJ
      ?auto_10708 - OBJ
      ?auto_10706 - LOCATION
    )
    :vars
    (
      ?auto_10710 - TRUCK
      ?auto_10709 - LOCATION
      ?auto_10711 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10707 ?auto_10705 ) ( GREATER-THAN ?auto_10708 ?auto_10705 ) ( GREATER-THAN ?auto_10708 ?auto_10707 ) ( IN-TRUCK ?auto_10708 ?auto_10710 ) ( TRUCK-AT ?auto_10710 ?auto_10709 ) ( IN-CITY ?auto_10709 ?auto_10711 ) ( IN-CITY ?auto_10706 ?auto_10711 ) ( not ( = ?auto_10706 ?auto_10709 ) ) ( OBJ-AT ?auto_10705 ?auto_10706 ) ( OBJ-AT ?auto_10707 ?auto_10706 ) ( not ( = ?auto_10705 ?auto_10707 ) ) ( not ( = ?auto_10705 ?auto_10708 ) ) ( not ( = ?auto_10707 ?auto_10708 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10708 ?auto_10706 )
      ( DELIVER-3PKG-VERIFY ?auto_10705 ?auto_10707 ?auto_10708 ?auto_10706 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10716 - OBJ
      ?auto_10718 - OBJ
      ?auto_10719 - OBJ
      ?auto_10717 - LOCATION
    )
    :vars
    (
      ?auto_10721 - TRUCK
      ?auto_10720 - LOCATION
      ?auto_10722 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10718 ?auto_10716 ) ( GREATER-THAN ?auto_10719 ?auto_10716 ) ( GREATER-THAN ?auto_10719 ?auto_10718 ) ( TRUCK-AT ?auto_10721 ?auto_10720 ) ( IN-CITY ?auto_10720 ?auto_10722 ) ( IN-CITY ?auto_10717 ?auto_10722 ) ( not ( = ?auto_10717 ?auto_10720 ) ) ( OBJ-AT ?auto_10719 ?auto_10720 ) ( OBJ-AT ?auto_10716 ?auto_10717 ) ( OBJ-AT ?auto_10718 ?auto_10717 ) ( not ( = ?auto_10716 ?auto_10718 ) ) ( not ( = ?auto_10716 ?auto_10719 ) ) ( not ( = ?auto_10718 ?auto_10719 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10719 ?auto_10717 )
      ( DELIVER-3PKG-VERIFY ?auto_10716 ?auto_10718 ?auto_10719 ?auto_10717 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10727 - OBJ
      ?auto_10729 - OBJ
      ?auto_10730 - OBJ
      ?auto_10728 - LOCATION
    )
    :vars
    (
      ?auto_10733 - LOCATION
      ?auto_10732 - CITY
      ?auto_10731 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10729 ?auto_10727 ) ( GREATER-THAN ?auto_10730 ?auto_10727 ) ( GREATER-THAN ?auto_10730 ?auto_10729 ) ( IN-CITY ?auto_10733 ?auto_10732 ) ( IN-CITY ?auto_10728 ?auto_10732 ) ( not ( = ?auto_10728 ?auto_10733 ) ) ( OBJ-AT ?auto_10730 ?auto_10733 ) ( TRUCK-AT ?auto_10731 ?auto_10728 ) ( OBJ-AT ?auto_10727 ?auto_10728 ) ( OBJ-AT ?auto_10729 ?auto_10728 ) ( not ( = ?auto_10727 ?auto_10729 ) ) ( not ( = ?auto_10727 ?auto_10730 ) ) ( not ( = ?auto_10729 ?auto_10730 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10730 ?auto_10728 )
      ( DELIVER-3PKG-VERIFY ?auto_10727 ?auto_10729 ?auto_10730 ?auto_10728 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10738 - OBJ
      ?auto_10740 - OBJ
      ?auto_10741 - OBJ
      ?auto_10739 - LOCATION
    )
    :vars
    (
      ?auto_10744 - LOCATION
      ?auto_10743 - CITY
      ?auto_10742 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10740 ?auto_10738 ) ( GREATER-THAN ?auto_10741 ?auto_10738 ) ( GREATER-THAN ?auto_10741 ?auto_10740 ) ( IN-CITY ?auto_10744 ?auto_10743 ) ( IN-CITY ?auto_10739 ?auto_10743 ) ( not ( = ?auto_10739 ?auto_10744 ) ) ( OBJ-AT ?auto_10741 ?auto_10744 ) ( TRUCK-AT ?auto_10742 ?auto_10739 ) ( OBJ-AT ?auto_10738 ?auto_10739 ) ( not ( = ?auto_10738 ?auto_10740 ) ) ( not ( = ?auto_10738 ?auto_10741 ) ) ( not ( = ?auto_10740 ?auto_10741 ) ) ( IN-TRUCK ?auto_10740 ?auto_10742 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10740 ?auto_10739 )
      ( DELIVER-3PKG ?auto_10738 ?auto_10740 ?auto_10741 ?auto_10739 )
      ( DELIVER-3PKG-VERIFY ?auto_10738 ?auto_10740 ?auto_10741 ?auto_10739 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10749 - OBJ
      ?auto_10751 - OBJ
      ?auto_10752 - OBJ
      ?auto_10750 - LOCATION
    )
    :vars
    (
      ?auto_10753 - LOCATION
      ?auto_10755 - CITY
      ?auto_10754 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10751 ?auto_10749 ) ( GREATER-THAN ?auto_10752 ?auto_10749 ) ( GREATER-THAN ?auto_10752 ?auto_10751 ) ( IN-CITY ?auto_10753 ?auto_10755 ) ( IN-CITY ?auto_10750 ?auto_10755 ) ( not ( = ?auto_10750 ?auto_10753 ) ) ( OBJ-AT ?auto_10752 ?auto_10753 ) ( OBJ-AT ?auto_10749 ?auto_10750 ) ( not ( = ?auto_10749 ?auto_10751 ) ) ( not ( = ?auto_10749 ?auto_10752 ) ) ( not ( = ?auto_10751 ?auto_10752 ) ) ( IN-TRUCK ?auto_10751 ?auto_10754 ) ( TRUCK-AT ?auto_10754 ?auto_10753 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10754 ?auto_10753 ?auto_10750 ?auto_10755 )
      ( DELIVER-3PKG ?auto_10749 ?auto_10751 ?auto_10752 ?auto_10750 )
      ( DELIVER-3PKG-VERIFY ?auto_10749 ?auto_10751 ?auto_10752 ?auto_10750 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10760 - OBJ
      ?auto_10762 - OBJ
      ?auto_10763 - OBJ
      ?auto_10761 - LOCATION
    )
    :vars
    (
      ?auto_10765 - LOCATION
      ?auto_10764 - CITY
      ?auto_10766 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10762 ?auto_10760 ) ( GREATER-THAN ?auto_10763 ?auto_10760 ) ( GREATER-THAN ?auto_10763 ?auto_10762 ) ( IN-CITY ?auto_10765 ?auto_10764 ) ( IN-CITY ?auto_10761 ?auto_10764 ) ( not ( = ?auto_10761 ?auto_10765 ) ) ( OBJ-AT ?auto_10763 ?auto_10765 ) ( OBJ-AT ?auto_10760 ?auto_10761 ) ( not ( = ?auto_10760 ?auto_10762 ) ) ( not ( = ?auto_10760 ?auto_10763 ) ) ( not ( = ?auto_10762 ?auto_10763 ) ) ( TRUCK-AT ?auto_10766 ?auto_10765 ) ( OBJ-AT ?auto_10762 ?auto_10765 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10762 ?auto_10766 ?auto_10765 )
      ( DELIVER-3PKG ?auto_10760 ?auto_10762 ?auto_10763 ?auto_10761 )
      ( DELIVER-3PKG-VERIFY ?auto_10760 ?auto_10762 ?auto_10763 ?auto_10761 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10771 - OBJ
      ?auto_10773 - OBJ
      ?auto_10774 - OBJ
      ?auto_10772 - LOCATION
    )
    :vars
    (
      ?auto_10776 - LOCATION
      ?auto_10777 - CITY
      ?auto_10775 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10773 ?auto_10771 ) ( GREATER-THAN ?auto_10774 ?auto_10771 ) ( GREATER-THAN ?auto_10774 ?auto_10773 ) ( IN-CITY ?auto_10776 ?auto_10777 ) ( IN-CITY ?auto_10772 ?auto_10777 ) ( not ( = ?auto_10772 ?auto_10776 ) ) ( OBJ-AT ?auto_10774 ?auto_10776 ) ( OBJ-AT ?auto_10771 ?auto_10772 ) ( not ( = ?auto_10771 ?auto_10773 ) ) ( not ( = ?auto_10771 ?auto_10774 ) ) ( not ( = ?auto_10773 ?auto_10774 ) ) ( OBJ-AT ?auto_10773 ?auto_10776 ) ( TRUCK-AT ?auto_10775 ?auto_10772 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10775 ?auto_10772 ?auto_10776 ?auto_10777 )
      ( DELIVER-3PKG ?auto_10771 ?auto_10773 ?auto_10774 ?auto_10772 )
      ( DELIVER-3PKG-VERIFY ?auto_10771 ?auto_10773 ?auto_10774 ?auto_10772 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10782 - OBJ
      ?auto_10784 - OBJ
      ?auto_10785 - OBJ
      ?auto_10783 - LOCATION
    )
    :vars
    (
      ?auto_10786 - LOCATION
      ?auto_10787 - CITY
      ?auto_10788 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10784 ?auto_10782 ) ( GREATER-THAN ?auto_10785 ?auto_10782 ) ( GREATER-THAN ?auto_10785 ?auto_10784 ) ( IN-CITY ?auto_10786 ?auto_10787 ) ( IN-CITY ?auto_10783 ?auto_10787 ) ( not ( = ?auto_10783 ?auto_10786 ) ) ( OBJ-AT ?auto_10785 ?auto_10786 ) ( not ( = ?auto_10782 ?auto_10784 ) ) ( not ( = ?auto_10782 ?auto_10785 ) ) ( not ( = ?auto_10784 ?auto_10785 ) ) ( OBJ-AT ?auto_10784 ?auto_10786 ) ( TRUCK-AT ?auto_10788 ?auto_10783 ) ( IN-TRUCK ?auto_10782 ?auto_10788 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10782 ?auto_10783 )
      ( DELIVER-3PKG ?auto_10782 ?auto_10784 ?auto_10785 ?auto_10783 )
      ( DELIVER-3PKG-VERIFY ?auto_10782 ?auto_10784 ?auto_10785 ?auto_10783 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10793 - OBJ
      ?auto_10795 - OBJ
      ?auto_10796 - OBJ
      ?auto_10794 - LOCATION
    )
    :vars
    (
      ?auto_10799 - LOCATION
      ?auto_10798 - CITY
      ?auto_10797 - TRUCK
      ?auto_10800 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10795 ?auto_10793 ) ( GREATER-THAN ?auto_10796 ?auto_10793 ) ( GREATER-THAN ?auto_10796 ?auto_10795 ) ( IN-CITY ?auto_10799 ?auto_10798 ) ( IN-CITY ?auto_10794 ?auto_10798 ) ( not ( = ?auto_10794 ?auto_10799 ) ) ( OBJ-AT ?auto_10796 ?auto_10799 ) ( not ( = ?auto_10793 ?auto_10795 ) ) ( not ( = ?auto_10793 ?auto_10796 ) ) ( not ( = ?auto_10795 ?auto_10796 ) ) ( OBJ-AT ?auto_10795 ?auto_10799 ) ( IN-TRUCK ?auto_10793 ?auto_10797 ) ( TRUCK-AT ?auto_10797 ?auto_10800 ) ( IN-CITY ?auto_10800 ?auto_10798 ) ( not ( = ?auto_10794 ?auto_10800 ) ) ( not ( = ?auto_10799 ?auto_10800 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10797 ?auto_10800 ?auto_10794 ?auto_10798 )
      ( DELIVER-3PKG ?auto_10793 ?auto_10795 ?auto_10796 ?auto_10794 )
      ( DELIVER-3PKG-VERIFY ?auto_10793 ?auto_10795 ?auto_10796 ?auto_10794 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10805 - OBJ
      ?auto_10807 - OBJ
      ?auto_10808 - OBJ
      ?auto_10806 - LOCATION
    )
    :vars
    (
      ?auto_10810 - LOCATION
      ?auto_10811 - CITY
      ?auto_10812 - TRUCK
      ?auto_10809 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10807 ?auto_10805 ) ( GREATER-THAN ?auto_10808 ?auto_10805 ) ( GREATER-THAN ?auto_10808 ?auto_10807 ) ( IN-CITY ?auto_10810 ?auto_10811 ) ( IN-CITY ?auto_10806 ?auto_10811 ) ( not ( = ?auto_10806 ?auto_10810 ) ) ( OBJ-AT ?auto_10808 ?auto_10810 ) ( not ( = ?auto_10805 ?auto_10807 ) ) ( not ( = ?auto_10805 ?auto_10808 ) ) ( not ( = ?auto_10807 ?auto_10808 ) ) ( OBJ-AT ?auto_10807 ?auto_10810 ) ( TRUCK-AT ?auto_10812 ?auto_10809 ) ( IN-CITY ?auto_10809 ?auto_10811 ) ( not ( = ?auto_10806 ?auto_10809 ) ) ( not ( = ?auto_10810 ?auto_10809 ) ) ( OBJ-AT ?auto_10805 ?auto_10809 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10805 ?auto_10812 ?auto_10809 )
      ( DELIVER-3PKG ?auto_10805 ?auto_10807 ?auto_10808 ?auto_10806 )
      ( DELIVER-3PKG-VERIFY ?auto_10805 ?auto_10807 ?auto_10808 ?auto_10806 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10817 - OBJ
      ?auto_10819 - OBJ
      ?auto_10820 - OBJ
      ?auto_10818 - LOCATION
    )
    :vars
    (
      ?auto_10821 - LOCATION
      ?auto_10824 - CITY
      ?auto_10823 - LOCATION
      ?auto_10822 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10819 ?auto_10817 ) ( GREATER-THAN ?auto_10820 ?auto_10817 ) ( GREATER-THAN ?auto_10820 ?auto_10819 ) ( IN-CITY ?auto_10821 ?auto_10824 ) ( IN-CITY ?auto_10818 ?auto_10824 ) ( not ( = ?auto_10818 ?auto_10821 ) ) ( OBJ-AT ?auto_10820 ?auto_10821 ) ( not ( = ?auto_10817 ?auto_10819 ) ) ( not ( = ?auto_10817 ?auto_10820 ) ) ( not ( = ?auto_10819 ?auto_10820 ) ) ( OBJ-AT ?auto_10819 ?auto_10821 ) ( IN-CITY ?auto_10823 ?auto_10824 ) ( not ( = ?auto_10818 ?auto_10823 ) ) ( not ( = ?auto_10821 ?auto_10823 ) ) ( OBJ-AT ?auto_10817 ?auto_10823 ) ( TRUCK-AT ?auto_10822 ?auto_10818 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10822 ?auto_10818 ?auto_10823 ?auto_10824 )
      ( DELIVER-3PKG ?auto_10817 ?auto_10819 ?auto_10820 ?auto_10818 )
      ( DELIVER-3PKG-VERIFY ?auto_10817 ?auto_10819 ?auto_10820 ?auto_10818 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10856 - OBJ
      ?auto_10858 - OBJ
      ?auto_10859 - OBJ
      ?auto_10860 - OBJ
      ?auto_10857 - LOCATION
    )
    :vars
    (
      ?auto_10861 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10858 ?auto_10856 ) ( GREATER-THAN ?auto_10859 ?auto_10856 ) ( GREATER-THAN ?auto_10859 ?auto_10858 ) ( GREATER-THAN ?auto_10860 ?auto_10856 ) ( GREATER-THAN ?auto_10860 ?auto_10858 ) ( GREATER-THAN ?auto_10860 ?auto_10859 ) ( TRUCK-AT ?auto_10861 ?auto_10857 ) ( IN-TRUCK ?auto_10860 ?auto_10861 ) ( OBJ-AT ?auto_10856 ?auto_10857 ) ( OBJ-AT ?auto_10858 ?auto_10857 ) ( OBJ-AT ?auto_10859 ?auto_10857 ) ( not ( = ?auto_10856 ?auto_10858 ) ) ( not ( = ?auto_10856 ?auto_10859 ) ) ( not ( = ?auto_10856 ?auto_10860 ) ) ( not ( = ?auto_10858 ?auto_10859 ) ) ( not ( = ?auto_10858 ?auto_10860 ) ) ( not ( = ?auto_10859 ?auto_10860 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10860 ?auto_10857 )
      ( DELIVER-4PKG-VERIFY ?auto_10856 ?auto_10858 ?auto_10859 ?auto_10860 ?auto_10857 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10867 - OBJ
      ?auto_10869 - OBJ
      ?auto_10870 - OBJ
      ?auto_10871 - OBJ
      ?auto_10868 - LOCATION
    )
    :vars
    (
      ?auto_10873 - TRUCK
      ?auto_10872 - LOCATION
      ?auto_10874 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10869 ?auto_10867 ) ( GREATER-THAN ?auto_10870 ?auto_10867 ) ( GREATER-THAN ?auto_10870 ?auto_10869 ) ( GREATER-THAN ?auto_10871 ?auto_10867 ) ( GREATER-THAN ?auto_10871 ?auto_10869 ) ( GREATER-THAN ?auto_10871 ?auto_10870 ) ( IN-TRUCK ?auto_10871 ?auto_10873 ) ( TRUCK-AT ?auto_10873 ?auto_10872 ) ( IN-CITY ?auto_10872 ?auto_10874 ) ( IN-CITY ?auto_10868 ?auto_10874 ) ( not ( = ?auto_10868 ?auto_10872 ) ) ( OBJ-AT ?auto_10867 ?auto_10868 ) ( OBJ-AT ?auto_10869 ?auto_10868 ) ( OBJ-AT ?auto_10870 ?auto_10868 ) ( not ( = ?auto_10867 ?auto_10869 ) ) ( not ( = ?auto_10867 ?auto_10870 ) ) ( not ( = ?auto_10867 ?auto_10871 ) ) ( not ( = ?auto_10869 ?auto_10870 ) ) ( not ( = ?auto_10869 ?auto_10871 ) ) ( not ( = ?auto_10870 ?auto_10871 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10871 ?auto_10868 )
      ( DELIVER-4PKG-VERIFY ?auto_10867 ?auto_10869 ?auto_10870 ?auto_10871 ?auto_10868 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10880 - OBJ
      ?auto_10882 - OBJ
      ?auto_10883 - OBJ
      ?auto_10884 - OBJ
      ?auto_10881 - LOCATION
    )
    :vars
    (
      ?auto_10886 - TRUCK
      ?auto_10885 - LOCATION
      ?auto_10887 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10882 ?auto_10880 ) ( GREATER-THAN ?auto_10883 ?auto_10880 ) ( GREATER-THAN ?auto_10883 ?auto_10882 ) ( GREATER-THAN ?auto_10884 ?auto_10880 ) ( GREATER-THAN ?auto_10884 ?auto_10882 ) ( GREATER-THAN ?auto_10884 ?auto_10883 ) ( TRUCK-AT ?auto_10886 ?auto_10885 ) ( IN-CITY ?auto_10885 ?auto_10887 ) ( IN-CITY ?auto_10881 ?auto_10887 ) ( not ( = ?auto_10881 ?auto_10885 ) ) ( OBJ-AT ?auto_10884 ?auto_10885 ) ( OBJ-AT ?auto_10880 ?auto_10881 ) ( OBJ-AT ?auto_10882 ?auto_10881 ) ( OBJ-AT ?auto_10883 ?auto_10881 ) ( not ( = ?auto_10880 ?auto_10882 ) ) ( not ( = ?auto_10880 ?auto_10883 ) ) ( not ( = ?auto_10880 ?auto_10884 ) ) ( not ( = ?auto_10882 ?auto_10883 ) ) ( not ( = ?auto_10882 ?auto_10884 ) ) ( not ( = ?auto_10883 ?auto_10884 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10884 ?auto_10881 )
      ( DELIVER-4PKG-VERIFY ?auto_10880 ?auto_10882 ?auto_10883 ?auto_10884 ?auto_10881 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10893 - OBJ
      ?auto_10895 - OBJ
      ?auto_10896 - OBJ
      ?auto_10897 - OBJ
      ?auto_10894 - LOCATION
    )
    :vars
    (
      ?auto_10899 - LOCATION
      ?auto_10900 - CITY
      ?auto_10898 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10895 ?auto_10893 ) ( GREATER-THAN ?auto_10896 ?auto_10893 ) ( GREATER-THAN ?auto_10896 ?auto_10895 ) ( GREATER-THAN ?auto_10897 ?auto_10893 ) ( GREATER-THAN ?auto_10897 ?auto_10895 ) ( GREATER-THAN ?auto_10897 ?auto_10896 ) ( IN-CITY ?auto_10899 ?auto_10900 ) ( IN-CITY ?auto_10894 ?auto_10900 ) ( not ( = ?auto_10894 ?auto_10899 ) ) ( OBJ-AT ?auto_10897 ?auto_10899 ) ( TRUCK-AT ?auto_10898 ?auto_10894 ) ( OBJ-AT ?auto_10893 ?auto_10894 ) ( OBJ-AT ?auto_10895 ?auto_10894 ) ( OBJ-AT ?auto_10896 ?auto_10894 ) ( not ( = ?auto_10893 ?auto_10895 ) ) ( not ( = ?auto_10893 ?auto_10896 ) ) ( not ( = ?auto_10893 ?auto_10897 ) ) ( not ( = ?auto_10895 ?auto_10896 ) ) ( not ( = ?auto_10895 ?auto_10897 ) ) ( not ( = ?auto_10896 ?auto_10897 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10897 ?auto_10894 )
      ( DELIVER-4PKG-VERIFY ?auto_10893 ?auto_10895 ?auto_10896 ?auto_10897 ?auto_10894 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10906 - OBJ
      ?auto_10908 - OBJ
      ?auto_10909 - OBJ
      ?auto_10910 - OBJ
      ?auto_10907 - LOCATION
    )
    :vars
    (
      ?auto_10913 - LOCATION
      ?auto_10912 - CITY
      ?auto_10911 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10908 ?auto_10906 ) ( GREATER-THAN ?auto_10909 ?auto_10906 ) ( GREATER-THAN ?auto_10909 ?auto_10908 ) ( GREATER-THAN ?auto_10910 ?auto_10906 ) ( GREATER-THAN ?auto_10910 ?auto_10908 ) ( GREATER-THAN ?auto_10910 ?auto_10909 ) ( IN-CITY ?auto_10913 ?auto_10912 ) ( IN-CITY ?auto_10907 ?auto_10912 ) ( not ( = ?auto_10907 ?auto_10913 ) ) ( OBJ-AT ?auto_10910 ?auto_10913 ) ( TRUCK-AT ?auto_10911 ?auto_10907 ) ( OBJ-AT ?auto_10906 ?auto_10907 ) ( OBJ-AT ?auto_10908 ?auto_10907 ) ( not ( = ?auto_10906 ?auto_10908 ) ) ( not ( = ?auto_10906 ?auto_10909 ) ) ( not ( = ?auto_10906 ?auto_10910 ) ) ( not ( = ?auto_10908 ?auto_10909 ) ) ( not ( = ?auto_10908 ?auto_10910 ) ) ( not ( = ?auto_10909 ?auto_10910 ) ) ( IN-TRUCK ?auto_10909 ?auto_10911 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10909 ?auto_10907 )
      ( DELIVER-4PKG ?auto_10906 ?auto_10908 ?auto_10909 ?auto_10910 ?auto_10907 )
      ( DELIVER-4PKG-VERIFY ?auto_10906 ?auto_10908 ?auto_10909 ?auto_10910 ?auto_10907 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10919 - OBJ
      ?auto_10921 - OBJ
      ?auto_10922 - OBJ
      ?auto_10923 - OBJ
      ?auto_10920 - LOCATION
    )
    :vars
    (
      ?auto_10925 - LOCATION
      ?auto_10926 - CITY
      ?auto_10924 - TRUCK
      ?auto_10927 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10921 ?auto_10919 ) ( GREATER-THAN ?auto_10922 ?auto_10919 ) ( GREATER-THAN ?auto_10922 ?auto_10921 ) ( GREATER-THAN ?auto_10923 ?auto_10919 ) ( GREATER-THAN ?auto_10923 ?auto_10921 ) ( GREATER-THAN ?auto_10923 ?auto_10922 ) ( IN-CITY ?auto_10925 ?auto_10926 ) ( IN-CITY ?auto_10920 ?auto_10926 ) ( not ( = ?auto_10920 ?auto_10925 ) ) ( OBJ-AT ?auto_10923 ?auto_10925 ) ( OBJ-AT ?auto_10919 ?auto_10920 ) ( OBJ-AT ?auto_10921 ?auto_10920 ) ( not ( = ?auto_10919 ?auto_10921 ) ) ( not ( = ?auto_10919 ?auto_10922 ) ) ( not ( = ?auto_10919 ?auto_10923 ) ) ( not ( = ?auto_10921 ?auto_10922 ) ) ( not ( = ?auto_10921 ?auto_10923 ) ) ( not ( = ?auto_10922 ?auto_10923 ) ) ( IN-TRUCK ?auto_10922 ?auto_10924 ) ( TRUCK-AT ?auto_10924 ?auto_10927 ) ( IN-CITY ?auto_10927 ?auto_10926 ) ( not ( = ?auto_10920 ?auto_10927 ) ) ( not ( = ?auto_10925 ?auto_10927 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10924 ?auto_10927 ?auto_10920 ?auto_10926 )
      ( DELIVER-4PKG ?auto_10919 ?auto_10921 ?auto_10922 ?auto_10923 ?auto_10920 )
      ( DELIVER-4PKG-VERIFY ?auto_10919 ?auto_10921 ?auto_10922 ?auto_10923 ?auto_10920 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10933 - OBJ
      ?auto_10935 - OBJ
      ?auto_10936 - OBJ
      ?auto_10937 - OBJ
      ?auto_10934 - LOCATION
    )
    :vars
    (
      ?auto_10939 - LOCATION
      ?auto_10940 - CITY
      ?auto_10938 - TRUCK
      ?auto_10941 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10935 ?auto_10933 ) ( GREATER-THAN ?auto_10936 ?auto_10933 ) ( GREATER-THAN ?auto_10936 ?auto_10935 ) ( GREATER-THAN ?auto_10937 ?auto_10933 ) ( GREATER-THAN ?auto_10937 ?auto_10935 ) ( GREATER-THAN ?auto_10937 ?auto_10936 ) ( IN-CITY ?auto_10939 ?auto_10940 ) ( IN-CITY ?auto_10934 ?auto_10940 ) ( not ( = ?auto_10934 ?auto_10939 ) ) ( OBJ-AT ?auto_10937 ?auto_10939 ) ( OBJ-AT ?auto_10933 ?auto_10934 ) ( OBJ-AT ?auto_10935 ?auto_10934 ) ( not ( = ?auto_10933 ?auto_10935 ) ) ( not ( = ?auto_10933 ?auto_10936 ) ) ( not ( = ?auto_10933 ?auto_10937 ) ) ( not ( = ?auto_10935 ?auto_10936 ) ) ( not ( = ?auto_10935 ?auto_10937 ) ) ( not ( = ?auto_10936 ?auto_10937 ) ) ( TRUCK-AT ?auto_10938 ?auto_10941 ) ( IN-CITY ?auto_10941 ?auto_10940 ) ( not ( = ?auto_10934 ?auto_10941 ) ) ( not ( = ?auto_10939 ?auto_10941 ) ) ( OBJ-AT ?auto_10936 ?auto_10941 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10936 ?auto_10938 ?auto_10941 )
      ( DELIVER-4PKG ?auto_10933 ?auto_10935 ?auto_10936 ?auto_10937 ?auto_10934 )
      ( DELIVER-4PKG-VERIFY ?auto_10933 ?auto_10935 ?auto_10936 ?auto_10937 ?auto_10934 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10947 - OBJ
      ?auto_10949 - OBJ
      ?auto_10950 - OBJ
      ?auto_10951 - OBJ
      ?auto_10948 - LOCATION
    )
    :vars
    (
      ?auto_10955 - LOCATION
      ?auto_10953 - CITY
      ?auto_10952 - LOCATION
      ?auto_10954 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10949 ?auto_10947 ) ( GREATER-THAN ?auto_10950 ?auto_10947 ) ( GREATER-THAN ?auto_10950 ?auto_10949 ) ( GREATER-THAN ?auto_10951 ?auto_10947 ) ( GREATER-THAN ?auto_10951 ?auto_10949 ) ( GREATER-THAN ?auto_10951 ?auto_10950 ) ( IN-CITY ?auto_10955 ?auto_10953 ) ( IN-CITY ?auto_10948 ?auto_10953 ) ( not ( = ?auto_10948 ?auto_10955 ) ) ( OBJ-AT ?auto_10951 ?auto_10955 ) ( OBJ-AT ?auto_10947 ?auto_10948 ) ( OBJ-AT ?auto_10949 ?auto_10948 ) ( not ( = ?auto_10947 ?auto_10949 ) ) ( not ( = ?auto_10947 ?auto_10950 ) ) ( not ( = ?auto_10947 ?auto_10951 ) ) ( not ( = ?auto_10949 ?auto_10950 ) ) ( not ( = ?auto_10949 ?auto_10951 ) ) ( not ( = ?auto_10950 ?auto_10951 ) ) ( IN-CITY ?auto_10952 ?auto_10953 ) ( not ( = ?auto_10948 ?auto_10952 ) ) ( not ( = ?auto_10955 ?auto_10952 ) ) ( OBJ-AT ?auto_10950 ?auto_10952 ) ( TRUCK-AT ?auto_10954 ?auto_10948 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10954 ?auto_10948 ?auto_10952 ?auto_10953 )
      ( DELIVER-4PKG ?auto_10947 ?auto_10949 ?auto_10950 ?auto_10951 ?auto_10948 )
      ( DELIVER-4PKG-VERIFY ?auto_10947 ?auto_10949 ?auto_10950 ?auto_10951 ?auto_10948 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10961 - OBJ
      ?auto_10963 - OBJ
      ?auto_10964 - OBJ
      ?auto_10965 - OBJ
      ?auto_10962 - LOCATION
    )
    :vars
    (
      ?auto_10967 - LOCATION
      ?auto_10966 - CITY
      ?auto_10968 - LOCATION
      ?auto_10969 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10963 ?auto_10961 ) ( GREATER-THAN ?auto_10964 ?auto_10961 ) ( GREATER-THAN ?auto_10964 ?auto_10963 ) ( GREATER-THAN ?auto_10965 ?auto_10961 ) ( GREATER-THAN ?auto_10965 ?auto_10963 ) ( GREATER-THAN ?auto_10965 ?auto_10964 ) ( IN-CITY ?auto_10967 ?auto_10966 ) ( IN-CITY ?auto_10962 ?auto_10966 ) ( not ( = ?auto_10962 ?auto_10967 ) ) ( OBJ-AT ?auto_10965 ?auto_10967 ) ( OBJ-AT ?auto_10961 ?auto_10962 ) ( not ( = ?auto_10961 ?auto_10963 ) ) ( not ( = ?auto_10961 ?auto_10964 ) ) ( not ( = ?auto_10961 ?auto_10965 ) ) ( not ( = ?auto_10963 ?auto_10964 ) ) ( not ( = ?auto_10963 ?auto_10965 ) ) ( not ( = ?auto_10964 ?auto_10965 ) ) ( IN-CITY ?auto_10968 ?auto_10966 ) ( not ( = ?auto_10962 ?auto_10968 ) ) ( not ( = ?auto_10967 ?auto_10968 ) ) ( OBJ-AT ?auto_10964 ?auto_10968 ) ( TRUCK-AT ?auto_10969 ?auto_10962 ) ( IN-TRUCK ?auto_10963 ?auto_10969 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10963 ?auto_10962 )
      ( DELIVER-4PKG ?auto_10961 ?auto_10963 ?auto_10964 ?auto_10965 ?auto_10962 )
      ( DELIVER-4PKG-VERIFY ?auto_10961 ?auto_10963 ?auto_10964 ?auto_10965 ?auto_10962 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10975 - OBJ
      ?auto_10977 - OBJ
      ?auto_10978 - OBJ
      ?auto_10979 - OBJ
      ?auto_10976 - LOCATION
    )
    :vars
    (
      ?auto_10980 - LOCATION
      ?auto_10982 - CITY
      ?auto_10981 - LOCATION
      ?auto_10983 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10977 ?auto_10975 ) ( GREATER-THAN ?auto_10978 ?auto_10975 ) ( GREATER-THAN ?auto_10978 ?auto_10977 ) ( GREATER-THAN ?auto_10979 ?auto_10975 ) ( GREATER-THAN ?auto_10979 ?auto_10977 ) ( GREATER-THAN ?auto_10979 ?auto_10978 ) ( IN-CITY ?auto_10980 ?auto_10982 ) ( IN-CITY ?auto_10976 ?auto_10982 ) ( not ( = ?auto_10976 ?auto_10980 ) ) ( OBJ-AT ?auto_10979 ?auto_10980 ) ( OBJ-AT ?auto_10975 ?auto_10976 ) ( not ( = ?auto_10975 ?auto_10977 ) ) ( not ( = ?auto_10975 ?auto_10978 ) ) ( not ( = ?auto_10975 ?auto_10979 ) ) ( not ( = ?auto_10977 ?auto_10978 ) ) ( not ( = ?auto_10977 ?auto_10979 ) ) ( not ( = ?auto_10978 ?auto_10979 ) ) ( IN-CITY ?auto_10981 ?auto_10982 ) ( not ( = ?auto_10976 ?auto_10981 ) ) ( not ( = ?auto_10980 ?auto_10981 ) ) ( OBJ-AT ?auto_10978 ?auto_10981 ) ( IN-TRUCK ?auto_10977 ?auto_10983 ) ( TRUCK-AT ?auto_10983 ?auto_10981 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10983 ?auto_10981 ?auto_10976 ?auto_10982 )
      ( DELIVER-4PKG ?auto_10975 ?auto_10977 ?auto_10978 ?auto_10979 ?auto_10976 )
      ( DELIVER-4PKG-VERIFY ?auto_10975 ?auto_10977 ?auto_10978 ?auto_10979 ?auto_10976 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10989 - OBJ
      ?auto_10991 - OBJ
      ?auto_10992 - OBJ
      ?auto_10993 - OBJ
      ?auto_10990 - LOCATION
    )
    :vars
    (
      ?auto_10995 - LOCATION
      ?auto_10994 - CITY
      ?auto_10996 - LOCATION
      ?auto_10997 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_10991 ?auto_10989 ) ( GREATER-THAN ?auto_10992 ?auto_10989 ) ( GREATER-THAN ?auto_10992 ?auto_10991 ) ( GREATER-THAN ?auto_10993 ?auto_10989 ) ( GREATER-THAN ?auto_10993 ?auto_10991 ) ( GREATER-THAN ?auto_10993 ?auto_10992 ) ( IN-CITY ?auto_10995 ?auto_10994 ) ( IN-CITY ?auto_10990 ?auto_10994 ) ( not ( = ?auto_10990 ?auto_10995 ) ) ( OBJ-AT ?auto_10993 ?auto_10995 ) ( OBJ-AT ?auto_10989 ?auto_10990 ) ( not ( = ?auto_10989 ?auto_10991 ) ) ( not ( = ?auto_10989 ?auto_10992 ) ) ( not ( = ?auto_10989 ?auto_10993 ) ) ( not ( = ?auto_10991 ?auto_10992 ) ) ( not ( = ?auto_10991 ?auto_10993 ) ) ( not ( = ?auto_10992 ?auto_10993 ) ) ( IN-CITY ?auto_10996 ?auto_10994 ) ( not ( = ?auto_10990 ?auto_10996 ) ) ( not ( = ?auto_10995 ?auto_10996 ) ) ( OBJ-AT ?auto_10992 ?auto_10996 ) ( TRUCK-AT ?auto_10997 ?auto_10996 ) ( OBJ-AT ?auto_10991 ?auto_10996 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10991 ?auto_10997 ?auto_10996 )
      ( DELIVER-4PKG ?auto_10989 ?auto_10991 ?auto_10992 ?auto_10993 ?auto_10990 )
      ( DELIVER-4PKG-VERIFY ?auto_10989 ?auto_10991 ?auto_10992 ?auto_10993 ?auto_10990 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_11003 - OBJ
      ?auto_11005 - OBJ
      ?auto_11006 - OBJ
      ?auto_11007 - OBJ
      ?auto_11004 - LOCATION
    )
    :vars
    (
      ?auto_11008 - LOCATION
      ?auto_11009 - CITY
      ?auto_11010 - LOCATION
      ?auto_11011 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11005 ?auto_11003 ) ( GREATER-THAN ?auto_11006 ?auto_11003 ) ( GREATER-THAN ?auto_11006 ?auto_11005 ) ( GREATER-THAN ?auto_11007 ?auto_11003 ) ( GREATER-THAN ?auto_11007 ?auto_11005 ) ( GREATER-THAN ?auto_11007 ?auto_11006 ) ( IN-CITY ?auto_11008 ?auto_11009 ) ( IN-CITY ?auto_11004 ?auto_11009 ) ( not ( = ?auto_11004 ?auto_11008 ) ) ( OBJ-AT ?auto_11007 ?auto_11008 ) ( OBJ-AT ?auto_11003 ?auto_11004 ) ( not ( = ?auto_11003 ?auto_11005 ) ) ( not ( = ?auto_11003 ?auto_11006 ) ) ( not ( = ?auto_11003 ?auto_11007 ) ) ( not ( = ?auto_11005 ?auto_11006 ) ) ( not ( = ?auto_11005 ?auto_11007 ) ) ( not ( = ?auto_11006 ?auto_11007 ) ) ( IN-CITY ?auto_11010 ?auto_11009 ) ( not ( = ?auto_11004 ?auto_11010 ) ) ( not ( = ?auto_11008 ?auto_11010 ) ) ( OBJ-AT ?auto_11006 ?auto_11010 ) ( OBJ-AT ?auto_11005 ?auto_11010 ) ( TRUCK-AT ?auto_11011 ?auto_11004 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11011 ?auto_11004 ?auto_11010 ?auto_11009 )
      ( DELIVER-4PKG ?auto_11003 ?auto_11005 ?auto_11006 ?auto_11007 ?auto_11004 )
      ( DELIVER-4PKG-VERIFY ?auto_11003 ?auto_11005 ?auto_11006 ?auto_11007 ?auto_11004 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_11017 - OBJ
      ?auto_11019 - OBJ
      ?auto_11020 - OBJ
      ?auto_11021 - OBJ
      ?auto_11018 - LOCATION
    )
    :vars
    (
      ?auto_11023 - LOCATION
      ?auto_11025 - CITY
      ?auto_11024 - LOCATION
      ?auto_11022 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11019 ?auto_11017 ) ( GREATER-THAN ?auto_11020 ?auto_11017 ) ( GREATER-THAN ?auto_11020 ?auto_11019 ) ( GREATER-THAN ?auto_11021 ?auto_11017 ) ( GREATER-THAN ?auto_11021 ?auto_11019 ) ( GREATER-THAN ?auto_11021 ?auto_11020 ) ( IN-CITY ?auto_11023 ?auto_11025 ) ( IN-CITY ?auto_11018 ?auto_11025 ) ( not ( = ?auto_11018 ?auto_11023 ) ) ( OBJ-AT ?auto_11021 ?auto_11023 ) ( not ( = ?auto_11017 ?auto_11019 ) ) ( not ( = ?auto_11017 ?auto_11020 ) ) ( not ( = ?auto_11017 ?auto_11021 ) ) ( not ( = ?auto_11019 ?auto_11020 ) ) ( not ( = ?auto_11019 ?auto_11021 ) ) ( not ( = ?auto_11020 ?auto_11021 ) ) ( IN-CITY ?auto_11024 ?auto_11025 ) ( not ( = ?auto_11018 ?auto_11024 ) ) ( not ( = ?auto_11023 ?auto_11024 ) ) ( OBJ-AT ?auto_11020 ?auto_11024 ) ( OBJ-AT ?auto_11019 ?auto_11024 ) ( TRUCK-AT ?auto_11022 ?auto_11018 ) ( IN-TRUCK ?auto_11017 ?auto_11022 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11017 ?auto_11018 )
      ( DELIVER-4PKG ?auto_11017 ?auto_11019 ?auto_11020 ?auto_11021 ?auto_11018 )
      ( DELIVER-4PKG-VERIFY ?auto_11017 ?auto_11019 ?auto_11020 ?auto_11021 ?auto_11018 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_11031 - OBJ
      ?auto_11033 - OBJ
      ?auto_11034 - OBJ
      ?auto_11035 - OBJ
      ?auto_11032 - LOCATION
    )
    :vars
    (
      ?auto_11037 - LOCATION
      ?auto_11036 - CITY
      ?auto_11038 - LOCATION
      ?auto_11039 - TRUCK
      ?auto_11040 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11033 ?auto_11031 ) ( GREATER-THAN ?auto_11034 ?auto_11031 ) ( GREATER-THAN ?auto_11034 ?auto_11033 ) ( GREATER-THAN ?auto_11035 ?auto_11031 ) ( GREATER-THAN ?auto_11035 ?auto_11033 ) ( GREATER-THAN ?auto_11035 ?auto_11034 ) ( IN-CITY ?auto_11037 ?auto_11036 ) ( IN-CITY ?auto_11032 ?auto_11036 ) ( not ( = ?auto_11032 ?auto_11037 ) ) ( OBJ-AT ?auto_11035 ?auto_11037 ) ( not ( = ?auto_11031 ?auto_11033 ) ) ( not ( = ?auto_11031 ?auto_11034 ) ) ( not ( = ?auto_11031 ?auto_11035 ) ) ( not ( = ?auto_11033 ?auto_11034 ) ) ( not ( = ?auto_11033 ?auto_11035 ) ) ( not ( = ?auto_11034 ?auto_11035 ) ) ( IN-CITY ?auto_11038 ?auto_11036 ) ( not ( = ?auto_11032 ?auto_11038 ) ) ( not ( = ?auto_11037 ?auto_11038 ) ) ( OBJ-AT ?auto_11034 ?auto_11038 ) ( OBJ-AT ?auto_11033 ?auto_11038 ) ( IN-TRUCK ?auto_11031 ?auto_11039 ) ( TRUCK-AT ?auto_11039 ?auto_11040 ) ( IN-CITY ?auto_11040 ?auto_11036 ) ( not ( = ?auto_11032 ?auto_11040 ) ) ( not ( = ?auto_11037 ?auto_11040 ) ) ( not ( = ?auto_11038 ?auto_11040 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11039 ?auto_11040 ?auto_11032 ?auto_11036 )
      ( DELIVER-4PKG ?auto_11031 ?auto_11033 ?auto_11034 ?auto_11035 ?auto_11032 )
      ( DELIVER-4PKG-VERIFY ?auto_11031 ?auto_11033 ?auto_11034 ?auto_11035 ?auto_11032 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_11046 - OBJ
      ?auto_11048 - OBJ
      ?auto_11049 - OBJ
      ?auto_11050 - OBJ
      ?auto_11047 - LOCATION
    )
    :vars
    (
      ?auto_11054 - LOCATION
      ?auto_11051 - CITY
      ?auto_11052 - LOCATION
      ?auto_11053 - TRUCK
      ?auto_11055 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11048 ?auto_11046 ) ( GREATER-THAN ?auto_11049 ?auto_11046 ) ( GREATER-THAN ?auto_11049 ?auto_11048 ) ( GREATER-THAN ?auto_11050 ?auto_11046 ) ( GREATER-THAN ?auto_11050 ?auto_11048 ) ( GREATER-THAN ?auto_11050 ?auto_11049 ) ( IN-CITY ?auto_11054 ?auto_11051 ) ( IN-CITY ?auto_11047 ?auto_11051 ) ( not ( = ?auto_11047 ?auto_11054 ) ) ( OBJ-AT ?auto_11050 ?auto_11054 ) ( not ( = ?auto_11046 ?auto_11048 ) ) ( not ( = ?auto_11046 ?auto_11049 ) ) ( not ( = ?auto_11046 ?auto_11050 ) ) ( not ( = ?auto_11048 ?auto_11049 ) ) ( not ( = ?auto_11048 ?auto_11050 ) ) ( not ( = ?auto_11049 ?auto_11050 ) ) ( IN-CITY ?auto_11052 ?auto_11051 ) ( not ( = ?auto_11047 ?auto_11052 ) ) ( not ( = ?auto_11054 ?auto_11052 ) ) ( OBJ-AT ?auto_11049 ?auto_11052 ) ( OBJ-AT ?auto_11048 ?auto_11052 ) ( TRUCK-AT ?auto_11053 ?auto_11055 ) ( IN-CITY ?auto_11055 ?auto_11051 ) ( not ( = ?auto_11047 ?auto_11055 ) ) ( not ( = ?auto_11054 ?auto_11055 ) ) ( not ( = ?auto_11052 ?auto_11055 ) ) ( OBJ-AT ?auto_11046 ?auto_11055 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11046 ?auto_11053 ?auto_11055 )
      ( DELIVER-4PKG ?auto_11046 ?auto_11048 ?auto_11049 ?auto_11050 ?auto_11047 )
      ( DELIVER-4PKG-VERIFY ?auto_11046 ?auto_11048 ?auto_11049 ?auto_11050 ?auto_11047 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_11061 - OBJ
      ?auto_11063 - OBJ
      ?auto_11064 - OBJ
      ?auto_11065 - OBJ
      ?auto_11062 - LOCATION
    )
    :vars
    (
      ?auto_11070 - LOCATION
      ?auto_11069 - CITY
      ?auto_11068 - LOCATION
      ?auto_11066 - LOCATION
      ?auto_11067 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11063 ?auto_11061 ) ( GREATER-THAN ?auto_11064 ?auto_11061 ) ( GREATER-THAN ?auto_11064 ?auto_11063 ) ( GREATER-THAN ?auto_11065 ?auto_11061 ) ( GREATER-THAN ?auto_11065 ?auto_11063 ) ( GREATER-THAN ?auto_11065 ?auto_11064 ) ( IN-CITY ?auto_11070 ?auto_11069 ) ( IN-CITY ?auto_11062 ?auto_11069 ) ( not ( = ?auto_11062 ?auto_11070 ) ) ( OBJ-AT ?auto_11065 ?auto_11070 ) ( not ( = ?auto_11061 ?auto_11063 ) ) ( not ( = ?auto_11061 ?auto_11064 ) ) ( not ( = ?auto_11061 ?auto_11065 ) ) ( not ( = ?auto_11063 ?auto_11064 ) ) ( not ( = ?auto_11063 ?auto_11065 ) ) ( not ( = ?auto_11064 ?auto_11065 ) ) ( IN-CITY ?auto_11068 ?auto_11069 ) ( not ( = ?auto_11062 ?auto_11068 ) ) ( not ( = ?auto_11070 ?auto_11068 ) ) ( OBJ-AT ?auto_11064 ?auto_11068 ) ( OBJ-AT ?auto_11063 ?auto_11068 ) ( IN-CITY ?auto_11066 ?auto_11069 ) ( not ( = ?auto_11062 ?auto_11066 ) ) ( not ( = ?auto_11070 ?auto_11066 ) ) ( not ( = ?auto_11068 ?auto_11066 ) ) ( OBJ-AT ?auto_11061 ?auto_11066 ) ( TRUCK-AT ?auto_11067 ?auto_11062 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11067 ?auto_11062 ?auto_11066 ?auto_11069 )
      ( DELIVER-4PKG ?auto_11061 ?auto_11063 ?auto_11064 ?auto_11065 ?auto_11062 )
      ( DELIVER-4PKG-VERIFY ?auto_11061 ?auto_11063 ?auto_11064 ?auto_11065 ?auto_11062 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11103 - OBJ
      ?auto_11105 - OBJ
      ?auto_11106 - OBJ
      ?auto_11107 - OBJ
      ?auto_11108 - OBJ
      ?auto_11104 - LOCATION
    )
    :vars
    (
      ?auto_11109 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11105 ?auto_11103 ) ( GREATER-THAN ?auto_11106 ?auto_11103 ) ( GREATER-THAN ?auto_11106 ?auto_11105 ) ( GREATER-THAN ?auto_11107 ?auto_11103 ) ( GREATER-THAN ?auto_11107 ?auto_11105 ) ( GREATER-THAN ?auto_11107 ?auto_11106 ) ( GREATER-THAN ?auto_11108 ?auto_11103 ) ( GREATER-THAN ?auto_11108 ?auto_11105 ) ( GREATER-THAN ?auto_11108 ?auto_11106 ) ( GREATER-THAN ?auto_11108 ?auto_11107 ) ( TRUCK-AT ?auto_11109 ?auto_11104 ) ( IN-TRUCK ?auto_11108 ?auto_11109 ) ( OBJ-AT ?auto_11103 ?auto_11104 ) ( OBJ-AT ?auto_11105 ?auto_11104 ) ( OBJ-AT ?auto_11106 ?auto_11104 ) ( OBJ-AT ?auto_11107 ?auto_11104 ) ( not ( = ?auto_11103 ?auto_11105 ) ) ( not ( = ?auto_11103 ?auto_11106 ) ) ( not ( = ?auto_11103 ?auto_11107 ) ) ( not ( = ?auto_11103 ?auto_11108 ) ) ( not ( = ?auto_11105 ?auto_11106 ) ) ( not ( = ?auto_11105 ?auto_11107 ) ) ( not ( = ?auto_11105 ?auto_11108 ) ) ( not ( = ?auto_11106 ?auto_11107 ) ) ( not ( = ?auto_11106 ?auto_11108 ) ) ( not ( = ?auto_11107 ?auto_11108 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11108 ?auto_11104 )
      ( DELIVER-5PKG-VERIFY ?auto_11103 ?auto_11105 ?auto_11106 ?auto_11107 ?auto_11108 ?auto_11104 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11116 - OBJ
      ?auto_11118 - OBJ
      ?auto_11119 - OBJ
      ?auto_11120 - OBJ
      ?auto_11121 - OBJ
      ?auto_11117 - LOCATION
    )
    :vars
    (
      ?auto_11122 - TRUCK
      ?auto_11124 - LOCATION
      ?auto_11123 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11118 ?auto_11116 ) ( GREATER-THAN ?auto_11119 ?auto_11116 ) ( GREATER-THAN ?auto_11119 ?auto_11118 ) ( GREATER-THAN ?auto_11120 ?auto_11116 ) ( GREATER-THAN ?auto_11120 ?auto_11118 ) ( GREATER-THAN ?auto_11120 ?auto_11119 ) ( GREATER-THAN ?auto_11121 ?auto_11116 ) ( GREATER-THAN ?auto_11121 ?auto_11118 ) ( GREATER-THAN ?auto_11121 ?auto_11119 ) ( GREATER-THAN ?auto_11121 ?auto_11120 ) ( IN-TRUCK ?auto_11121 ?auto_11122 ) ( TRUCK-AT ?auto_11122 ?auto_11124 ) ( IN-CITY ?auto_11124 ?auto_11123 ) ( IN-CITY ?auto_11117 ?auto_11123 ) ( not ( = ?auto_11117 ?auto_11124 ) ) ( OBJ-AT ?auto_11116 ?auto_11117 ) ( OBJ-AT ?auto_11118 ?auto_11117 ) ( OBJ-AT ?auto_11119 ?auto_11117 ) ( OBJ-AT ?auto_11120 ?auto_11117 ) ( not ( = ?auto_11116 ?auto_11118 ) ) ( not ( = ?auto_11116 ?auto_11119 ) ) ( not ( = ?auto_11116 ?auto_11120 ) ) ( not ( = ?auto_11116 ?auto_11121 ) ) ( not ( = ?auto_11118 ?auto_11119 ) ) ( not ( = ?auto_11118 ?auto_11120 ) ) ( not ( = ?auto_11118 ?auto_11121 ) ) ( not ( = ?auto_11119 ?auto_11120 ) ) ( not ( = ?auto_11119 ?auto_11121 ) ) ( not ( = ?auto_11120 ?auto_11121 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11121 ?auto_11117 )
      ( DELIVER-5PKG-VERIFY ?auto_11116 ?auto_11118 ?auto_11119 ?auto_11120 ?auto_11121 ?auto_11117 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11131 - OBJ
      ?auto_11133 - OBJ
      ?auto_11134 - OBJ
      ?auto_11135 - OBJ
      ?auto_11136 - OBJ
      ?auto_11132 - LOCATION
    )
    :vars
    (
      ?auto_11138 - TRUCK
      ?auto_11139 - LOCATION
      ?auto_11137 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11133 ?auto_11131 ) ( GREATER-THAN ?auto_11134 ?auto_11131 ) ( GREATER-THAN ?auto_11134 ?auto_11133 ) ( GREATER-THAN ?auto_11135 ?auto_11131 ) ( GREATER-THAN ?auto_11135 ?auto_11133 ) ( GREATER-THAN ?auto_11135 ?auto_11134 ) ( GREATER-THAN ?auto_11136 ?auto_11131 ) ( GREATER-THAN ?auto_11136 ?auto_11133 ) ( GREATER-THAN ?auto_11136 ?auto_11134 ) ( GREATER-THAN ?auto_11136 ?auto_11135 ) ( TRUCK-AT ?auto_11138 ?auto_11139 ) ( IN-CITY ?auto_11139 ?auto_11137 ) ( IN-CITY ?auto_11132 ?auto_11137 ) ( not ( = ?auto_11132 ?auto_11139 ) ) ( OBJ-AT ?auto_11136 ?auto_11139 ) ( OBJ-AT ?auto_11131 ?auto_11132 ) ( OBJ-AT ?auto_11133 ?auto_11132 ) ( OBJ-AT ?auto_11134 ?auto_11132 ) ( OBJ-AT ?auto_11135 ?auto_11132 ) ( not ( = ?auto_11131 ?auto_11133 ) ) ( not ( = ?auto_11131 ?auto_11134 ) ) ( not ( = ?auto_11131 ?auto_11135 ) ) ( not ( = ?auto_11131 ?auto_11136 ) ) ( not ( = ?auto_11133 ?auto_11134 ) ) ( not ( = ?auto_11133 ?auto_11135 ) ) ( not ( = ?auto_11133 ?auto_11136 ) ) ( not ( = ?auto_11134 ?auto_11135 ) ) ( not ( = ?auto_11134 ?auto_11136 ) ) ( not ( = ?auto_11135 ?auto_11136 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11136 ?auto_11132 )
      ( DELIVER-5PKG-VERIFY ?auto_11131 ?auto_11133 ?auto_11134 ?auto_11135 ?auto_11136 ?auto_11132 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11146 - OBJ
      ?auto_11148 - OBJ
      ?auto_11149 - OBJ
      ?auto_11150 - OBJ
      ?auto_11151 - OBJ
      ?auto_11147 - LOCATION
    )
    :vars
    (
      ?auto_11154 - LOCATION
      ?auto_11153 - CITY
      ?auto_11152 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11148 ?auto_11146 ) ( GREATER-THAN ?auto_11149 ?auto_11146 ) ( GREATER-THAN ?auto_11149 ?auto_11148 ) ( GREATER-THAN ?auto_11150 ?auto_11146 ) ( GREATER-THAN ?auto_11150 ?auto_11148 ) ( GREATER-THAN ?auto_11150 ?auto_11149 ) ( GREATER-THAN ?auto_11151 ?auto_11146 ) ( GREATER-THAN ?auto_11151 ?auto_11148 ) ( GREATER-THAN ?auto_11151 ?auto_11149 ) ( GREATER-THAN ?auto_11151 ?auto_11150 ) ( IN-CITY ?auto_11154 ?auto_11153 ) ( IN-CITY ?auto_11147 ?auto_11153 ) ( not ( = ?auto_11147 ?auto_11154 ) ) ( OBJ-AT ?auto_11151 ?auto_11154 ) ( TRUCK-AT ?auto_11152 ?auto_11147 ) ( OBJ-AT ?auto_11146 ?auto_11147 ) ( OBJ-AT ?auto_11148 ?auto_11147 ) ( OBJ-AT ?auto_11149 ?auto_11147 ) ( OBJ-AT ?auto_11150 ?auto_11147 ) ( not ( = ?auto_11146 ?auto_11148 ) ) ( not ( = ?auto_11146 ?auto_11149 ) ) ( not ( = ?auto_11146 ?auto_11150 ) ) ( not ( = ?auto_11146 ?auto_11151 ) ) ( not ( = ?auto_11148 ?auto_11149 ) ) ( not ( = ?auto_11148 ?auto_11150 ) ) ( not ( = ?auto_11148 ?auto_11151 ) ) ( not ( = ?auto_11149 ?auto_11150 ) ) ( not ( = ?auto_11149 ?auto_11151 ) ) ( not ( = ?auto_11150 ?auto_11151 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11151 ?auto_11147 )
      ( DELIVER-5PKG-VERIFY ?auto_11146 ?auto_11148 ?auto_11149 ?auto_11150 ?auto_11151 ?auto_11147 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11161 - OBJ
      ?auto_11163 - OBJ
      ?auto_11164 - OBJ
      ?auto_11165 - OBJ
      ?auto_11166 - OBJ
      ?auto_11162 - LOCATION
    )
    :vars
    (
      ?auto_11167 - LOCATION
      ?auto_11168 - CITY
      ?auto_11169 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11163 ?auto_11161 ) ( GREATER-THAN ?auto_11164 ?auto_11161 ) ( GREATER-THAN ?auto_11164 ?auto_11163 ) ( GREATER-THAN ?auto_11165 ?auto_11161 ) ( GREATER-THAN ?auto_11165 ?auto_11163 ) ( GREATER-THAN ?auto_11165 ?auto_11164 ) ( GREATER-THAN ?auto_11166 ?auto_11161 ) ( GREATER-THAN ?auto_11166 ?auto_11163 ) ( GREATER-THAN ?auto_11166 ?auto_11164 ) ( GREATER-THAN ?auto_11166 ?auto_11165 ) ( IN-CITY ?auto_11167 ?auto_11168 ) ( IN-CITY ?auto_11162 ?auto_11168 ) ( not ( = ?auto_11162 ?auto_11167 ) ) ( OBJ-AT ?auto_11166 ?auto_11167 ) ( TRUCK-AT ?auto_11169 ?auto_11162 ) ( OBJ-AT ?auto_11161 ?auto_11162 ) ( OBJ-AT ?auto_11163 ?auto_11162 ) ( OBJ-AT ?auto_11164 ?auto_11162 ) ( not ( = ?auto_11161 ?auto_11163 ) ) ( not ( = ?auto_11161 ?auto_11164 ) ) ( not ( = ?auto_11161 ?auto_11165 ) ) ( not ( = ?auto_11161 ?auto_11166 ) ) ( not ( = ?auto_11163 ?auto_11164 ) ) ( not ( = ?auto_11163 ?auto_11165 ) ) ( not ( = ?auto_11163 ?auto_11166 ) ) ( not ( = ?auto_11164 ?auto_11165 ) ) ( not ( = ?auto_11164 ?auto_11166 ) ) ( not ( = ?auto_11165 ?auto_11166 ) ) ( IN-TRUCK ?auto_11165 ?auto_11169 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11165 ?auto_11162 )
      ( DELIVER-5PKG ?auto_11161 ?auto_11163 ?auto_11164 ?auto_11165 ?auto_11166 ?auto_11162 )
      ( DELIVER-5PKG-VERIFY ?auto_11161 ?auto_11163 ?auto_11164 ?auto_11165 ?auto_11166 ?auto_11162 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11176 - OBJ
      ?auto_11178 - OBJ
      ?auto_11179 - OBJ
      ?auto_11180 - OBJ
      ?auto_11181 - OBJ
      ?auto_11177 - LOCATION
    )
    :vars
    (
      ?auto_11184 - LOCATION
      ?auto_11183 - CITY
      ?auto_11182 - TRUCK
      ?auto_11185 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11178 ?auto_11176 ) ( GREATER-THAN ?auto_11179 ?auto_11176 ) ( GREATER-THAN ?auto_11179 ?auto_11178 ) ( GREATER-THAN ?auto_11180 ?auto_11176 ) ( GREATER-THAN ?auto_11180 ?auto_11178 ) ( GREATER-THAN ?auto_11180 ?auto_11179 ) ( GREATER-THAN ?auto_11181 ?auto_11176 ) ( GREATER-THAN ?auto_11181 ?auto_11178 ) ( GREATER-THAN ?auto_11181 ?auto_11179 ) ( GREATER-THAN ?auto_11181 ?auto_11180 ) ( IN-CITY ?auto_11184 ?auto_11183 ) ( IN-CITY ?auto_11177 ?auto_11183 ) ( not ( = ?auto_11177 ?auto_11184 ) ) ( OBJ-AT ?auto_11181 ?auto_11184 ) ( OBJ-AT ?auto_11176 ?auto_11177 ) ( OBJ-AT ?auto_11178 ?auto_11177 ) ( OBJ-AT ?auto_11179 ?auto_11177 ) ( not ( = ?auto_11176 ?auto_11178 ) ) ( not ( = ?auto_11176 ?auto_11179 ) ) ( not ( = ?auto_11176 ?auto_11180 ) ) ( not ( = ?auto_11176 ?auto_11181 ) ) ( not ( = ?auto_11178 ?auto_11179 ) ) ( not ( = ?auto_11178 ?auto_11180 ) ) ( not ( = ?auto_11178 ?auto_11181 ) ) ( not ( = ?auto_11179 ?auto_11180 ) ) ( not ( = ?auto_11179 ?auto_11181 ) ) ( not ( = ?auto_11180 ?auto_11181 ) ) ( IN-TRUCK ?auto_11180 ?auto_11182 ) ( TRUCK-AT ?auto_11182 ?auto_11185 ) ( IN-CITY ?auto_11185 ?auto_11183 ) ( not ( = ?auto_11177 ?auto_11185 ) ) ( not ( = ?auto_11184 ?auto_11185 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11182 ?auto_11185 ?auto_11177 ?auto_11183 )
      ( DELIVER-5PKG ?auto_11176 ?auto_11178 ?auto_11179 ?auto_11180 ?auto_11181 ?auto_11177 )
      ( DELIVER-5PKG-VERIFY ?auto_11176 ?auto_11178 ?auto_11179 ?auto_11180 ?auto_11181 ?auto_11177 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11192 - OBJ
      ?auto_11194 - OBJ
      ?auto_11195 - OBJ
      ?auto_11196 - OBJ
      ?auto_11197 - OBJ
      ?auto_11193 - LOCATION
    )
    :vars
    (
      ?auto_11199 - LOCATION
      ?auto_11200 - CITY
      ?auto_11201 - TRUCK
      ?auto_11198 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11194 ?auto_11192 ) ( GREATER-THAN ?auto_11195 ?auto_11192 ) ( GREATER-THAN ?auto_11195 ?auto_11194 ) ( GREATER-THAN ?auto_11196 ?auto_11192 ) ( GREATER-THAN ?auto_11196 ?auto_11194 ) ( GREATER-THAN ?auto_11196 ?auto_11195 ) ( GREATER-THAN ?auto_11197 ?auto_11192 ) ( GREATER-THAN ?auto_11197 ?auto_11194 ) ( GREATER-THAN ?auto_11197 ?auto_11195 ) ( GREATER-THAN ?auto_11197 ?auto_11196 ) ( IN-CITY ?auto_11199 ?auto_11200 ) ( IN-CITY ?auto_11193 ?auto_11200 ) ( not ( = ?auto_11193 ?auto_11199 ) ) ( OBJ-AT ?auto_11197 ?auto_11199 ) ( OBJ-AT ?auto_11192 ?auto_11193 ) ( OBJ-AT ?auto_11194 ?auto_11193 ) ( OBJ-AT ?auto_11195 ?auto_11193 ) ( not ( = ?auto_11192 ?auto_11194 ) ) ( not ( = ?auto_11192 ?auto_11195 ) ) ( not ( = ?auto_11192 ?auto_11196 ) ) ( not ( = ?auto_11192 ?auto_11197 ) ) ( not ( = ?auto_11194 ?auto_11195 ) ) ( not ( = ?auto_11194 ?auto_11196 ) ) ( not ( = ?auto_11194 ?auto_11197 ) ) ( not ( = ?auto_11195 ?auto_11196 ) ) ( not ( = ?auto_11195 ?auto_11197 ) ) ( not ( = ?auto_11196 ?auto_11197 ) ) ( TRUCK-AT ?auto_11201 ?auto_11198 ) ( IN-CITY ?auto_11198 ?auto_11200 ) ( not ( = ?auto_11193 ?auto_11198 ) ) ( not ( = ?auto_11199 ?auto_11198 ) ) ( OBJ-AT ?auto_11196 ?auto_11198 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11196 ?auto_11201 ?auto_11198 )
      ( DELIVER-5PKG ?auto_11192 ?auto_11194 ?auto_11195 ?auto_11196 ?auto_11197 ?auto_11193 )
      ( DELIVER-5PKG-VERIFY ?auto_11192 ?auto_11194 ?auto_11195 ?auto_11196 ?auto_11197 ?auto_11193 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11208 - OBJ
      ?auto_11210 - OBJ
      ?auto_11211 - OBJ
      ?auto_11212 - OBJ
      ?auto_11213 - OBJ
      ?auto_11209 - LOCATION
    )
    :vars
    (
      ?auto_11217 - LOCATION
      ?auto_11214 - CITY
      ?auto_11216 - LOCATION
      ?auto_11215 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11210 ?auto_11208 ) ( GREATER-THAN ?auto_11211 ?auto_11208 ) ( GREATER-THAN ?auto_11211 ?auto_11210 ) ( GREATER-THAN ?auto_11212 ?auto_11208 ) ( GREATER-THAN ?auto_11212 ?auto_11210 ) ( GREATER-THAN ?auto_11212 ?auto_11211 ) ( GREATER-THAN ?auto_11213 ?auto_11208 ) ( GREATER-THAN ?auto_11213 ?auto_11210 ) ( GREATER-THAN ?auto_11213 ?auto_11211 ) ( GREATER-THAN ?auto_11213 ?auto_11212 ) ( IN-CITY ?auto_11217 ?auto_11214 ) ( IN-CITY ?auto_11209 ?auto_11214 ) ( not ( = ?auto_11209 ?auto_11217 ) ) ( OBJ-AT ?auto_11213 ?auto_11217 ) ( OBJ-AT ?auto_11208 ?auto_11209 ) ( OBJ-AT ?auto_11210 ?auto_11209 ) ( OBJ-AT ?auto_11211 ?auto_11209 ) ( not ( = ?auto_11208 ?auto_11210 ) ) ( not ( = ?auto_11208 ?auto_11211 ) ) ( not ( = ?auto_11208 ?auto_11212 ) ) ( not ( = ?auto_11208 ?auto_11213 ) ) ( not ( = ?auto_11210 ?auto_11211 ) ) ( not ( = ?auto_11210 ?auto_11212 ) ) ( not ( = ?auto_11210 ?auto_11213 ) ) ( not ( = ?auto_11211 ?auto_11212 ) ) ( not ( = ?auto_11211 ?auto_11213 ) ) ( not ( = ?auto_11212 ?auto_11213 ) ) ( IN-CITY ?auto_11216 ?auto_11214 ) ( not ( = ?auto_11209 ?auto_11216 ) ) ( not ( = ?auto_11217 ?auto_11216 ) ) ( OBJ-AT ?auto_11212 ?auto_11216 ) ( TRUCK-AT ?auto_11215 ?auto_11209 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11215 ?auto_11209 ?auto_11216 ?auto_11214 )
      ( DELIVER-5PKG ?auto_11208 ?auto_11210 ?auto_11211 ?auto_11212 ?auto_11213 ?auto_11209 )
      ( DELIVER-5PKG-VERIFY ?auto_11208 ?auto_11210 ?auto_11211 ?auto_11212 ?auto_11213 ?auto_11209 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11224 - OBJ
      ?auto_11226 - OBJ
      ?auto_11227 - OBJ
      ?auto_11228 - OBJ
      ?auto_11229 - OBJ
      ?auto_11225 - LOCATION
    )
    :vars
    (
      ?auto_11233 - LOCATION
      ?auto_11232 - CITY
      ?auto_11231 - LOCATION
      ?auto_11230 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11226 ?auto_11224 ) ( GREATER-THAN ?auto_11227 ?auto_11224 ) ( GREATER-THAN ?auto_11227 ?auto_11226 ) ( GREATER-THAN ?auto_11228 ?auto_11224 ) ( GREATER-THAN ?auto_11228 ?auto_11226 ) ( GREATER-THAN ?auto_11228 ?auto_11227 ) ( GREATER-THAN ?auto_11229 ?auto_11224 ) ( GREATER-THAN ?auto_11229 ?auto_11226 ) ( GREATER-THAN ?auto_11229 ?auto_11227 ) ( GREATER-THAN ?auto_11229 ?auto_11228 ) ( IN-CITY ?auto_11233 ?auto_11232 ) ( IN-CITY ?auto_11225 ?auto_11232 ) ( not ( = ?auto_11225 ?auto_11233 ) ) ( OBJ-AT ?auto_11229 ?auto_11233 ) ( OBJ-AT ?auto_11224 ?auto_11225 ) ( OBJ-AT ?auto_11226 ?auto_11225 ) ( not ( = ?auto_11224 ?auto_11226 ) ) ( not ( = ?auto_11224 ?auto_11227 ) ) ( not ( = ?auto_11224 ?auto_11228 ) ) ( not ( = ?auto_11224 ?auto_11229 ) ) ( not ( = ?auto_11226 ?auto_11227 ) ) ( not ( = ?auto_11226 ?auto_11228 ) ) ( not ( = ?auto_11226 ?auto_11229 ) ) ( not ( = ?auto_11227 ?auto_11228 ) ) ( not ( = ?auto_11227 ?auto_11229 ) ) ( not ( = ?auto_11228 ?auto_11229 ) ) ( IN-CITY ?auto_11231 ?auto_11232 ) ( not ( = ?auto_11225 ?auto_11231 ) ) ( not ( = ?auto_11233 ?auto_11231 ) ) ( OBJ-AT ?auto_11228 ?auto_11231 ) ( TRUCK-AT ?auto_11230 ?auto_11225 ) ( IN-TRUCK ?auto_11227 ?auto_11230 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11227 ?auto_11225 )
      ( DELIVER-5PKG ?auto_11224 ?auto_11226 ?auto_11227 ?auto_11228 ?auto_11229 ?auto_11225 )
      ( DELIVER-5PKG-VERIFY ?auto_11224 ?auto_11226 ?auto_11227 ?auto_11228 ?auto_11229 ?auto_11225 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11240 - OBJ
      ?auto_11242 - OBJ
      ?auto_11243 - OBJ
      ?auto_11244 - OBJ
      ?auto_11245 - OBJ
      ?auto_11241 - LOCATION
    )
    :vars
    (
      ?auto_11248 - LOCATION
      ?auto_11246 - CITY
      ?auto_11247 - LOCATION
      ?auto_11249 - TRUCK
      ?auto_11250 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11242 ?auto_11240 ) ( GREATER-THAN ?auto_11243 ?auto_11240 ) ( GREATER-THAN ?auto_11243 ?auto_11242 ) ( GREATER-THAN ?auto_11244 ?auto_11240 ) ( GREATER-THAN ?auto_11244 ?auto_11242 ) ( GREATER-THAN ?auto_11244 ?auto_11243 ) ( GREATER-THAN ?auto_11245 ?auto_11240 ) ( GREATER-THAN ?auto_11245 ?auto_11242 ) ( GREATER-THAN ?auto_11245 ?auto_11243 ) ( GREATER-THAN ?auto_11245 ?auto_11244 ) ( IN-CITY ?auto_11248 ?auto_11246 ) ( IN-CITY ?auto_11241 ?auto_11246 ) ( not ( = ?auto_11241 ?auto_11248 ) ) ( OBJ-AT ?auto_11245 ?auto_11248 ) ( OBJ-AT ?auto_11240 ?auto_11241 ) ( OBJ-AT ?auto_11242 ?auto_11241 ) ( not ( = ?auto_11240 ?auto_11242 ) ) ( not ( = ?auto_11240 ?auto_11243 ) ) ( not ( = ?auto_11240 ?auto_11244 ) ) ( not ( = ?auto_11240 ?auto_11245 ) ) ( not ( = ?auto_11242 ?auto_11243 ) ) ( not ( = ?auto_11242 ?auto_11244 ) ) ( not ( = ?auto_11242 ?auto_11245 ) ) ( not ( = ?auto_11243 ?auto_11244 ) ) ( not ( = ?auto_11243 ?auto_11245 ) ) ( not ( = ?auto_11244 ?auto_11245 ) ) ( IN-CITY ?auto_11247 ?auto_11246 ) ( not ( = ?auto_11241 ?auto_11247 ) ) ( not ( = ?auto_11248 ?auto_11247 ) ) ( OBJ-AT ?auto_11244 ?auto_11247 ) ( IN-TRUCK ?auto_11243 ?auto_11249 ) ( TRUCK-AT ?auto_11249 ?auto_11250 ) ( IN-CITY ?auto_11250 ?auto_11246 ) ( not ( = ?auto_11241 ?auto_11250 ) ) ( not ( = ?auto_11248 ?auto_11250 ) ) ( not ( = ?auto_11247 ?auto_11250 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11249 ?auto_11250 ?auto_11241 ?auto_11246 )
      ( DELIVER-5PKG ?auto_11240 ?auto_11242 ?auto_11243 ?auto_11244 ?auto_11245 ?auto_11241 )
      ( DELIVER-5PKG-VERIFY ?auto_11240 ?auto_11242 ?auto_11243 ?auto_11244 ?auto_11245 ?auto_11241 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11257 - OBJ
      ?auto_11259 - OBJ
      ?auto_11260 - OBJ
      ?auto_11261 - OBJ
      ?auto_11262 - OBJ
      ?auto_11258 - LOCATION
    )
    :vars
    (
      ?auto_11265 - LOCATION
      ?auto_11264 - CITY
      ?auto_11263 - LOCATION
      ?auto_11267 - TRUCK
      ?auto_11266 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11259 ?auto_11257 ) ( GREATER-THAN ?auto_11260 ?auto_11257 ) ( GREATER-THAN ?auto_11260 ?auto_11259 ) ( GREATER-THAN ?auto_11261 ?auto_11257 ) ( GREATER-THAN ?auto_11261 ?auto_11259 ) ( GREATER-THAN ?auto_11261 ?auto_11260 ) ( GREATER-THAN ?auto_11262 ?auto_11257 ) ( GREATER-THAN ?auto_11262 ?auto_11259 ) ( GREATER-THAN ?auto_11262 ?auto_11260 ) ( GREATER-THAN ?auto_11262 ?auto_11261 ) ( IN-CITY ?auto_11265 ?auto_11264 ) ( IN-CITY ?auto_11258 ?auto_11264 ) ( not ( = ?auto_11258 ?auto_11265 ) ) ( OBJ-AT ?auto_11262 ?auto_11265 ) ( OBJ-AT ?auto_11257 ?auto_11258 ) ( OBJ-AT ?auto_11259 ?auto_11258 ) ( not ( = ?auto_11257 ?auto_11259 ) ) ( not ( = ?auto_11257 ?auto_11260 ) ) ( not ( = ?auto_11257 ?auto_11261 ) ) ( not ( = ?auto_11257 ?auto_11262 ) ) ( not ( = ?auto_11259 ?auto_11260 ) ) ( not ( = ?auto_11259 ?auto_11261 ) ) ( not ( = ?auto_11259 ?auto_11262 ) ) ( not ( = ?auto_11260 ?auto_11261 ) ) ( not ( = ?auto_11260 ?auto_11262 ) ) ( not ( = ?auto_11261 ?auto_11262 ) ) ( IN-CITY ?auto_11263 ?auto_11264 ) ( not ( = ?auto_11258 ?auto_11263 ) ) ( not ( = ?auto_11265 ?auto_11263 ) ) ( OBJ-AT ?auto_11261 ?auto_11263 ) ( TRUCK-AT ?auto_11267 ?auto_11266 ) ( IN-CITY ?auto_11266 ?auto_11264 ) ( not ( = ?auto_11258 ?auto_11266 ) ) ( not ( = ?auto_11265 ?auto_11266 ) ) ( not ( = ?auto_11263 ?auto_11266 ) ) ( OBJ-AT ?auto_11260 ?auto_11266 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11260 ?auto_11267 ?auto_11266 )
      ( DELIVER-5PKG ?auto_11257 ?auto_11259 ?auto_11260 ?auto_11261 ?auto_11262 ?auto_11258 )
      ( DELIVER-5PKG-VERIFY ?auto_11257 ?auto_11259 ?auto_11260 ?auto_11261 ?auto_11262 ?auto_11258 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11274 - OBJ
      ?auto_11276 - OBJ
      ?auto_11277 - OBJ
      ?auto_11278 - OBJ
      ?auto_11279 - OBJ
      ?auto_11275 - LOCATION
    )
    :vars
    (
      ?auto_11280 - LOCATION
      ?auto_11282 - CITY
      ?auto_11284 - LOCATION
      ?auto_11281 - LOCATION
      ?auto_11283 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11276 ?auto_11274 ) ( GREATER-THAN ?auto_11277 ?auto_11274 ) ( GREATER-THAN ?auto_11277 ?auto_11276 ) ( GREATER-THAN ?auto_11278 ?auto_11274 ) ( GREATER-THAN ?auto_11278 ?auto_11276 ) ( GREATER-THAN ?auto_11278 ?auto_11277 ) ( GREATER-THAN ?auto_11279 ?auto_11274 ) ( GREATER-THAN ?auto_11279 ?auto_11276 ) ( GREATER-THAN ?auto_11279 ?auto_11277 ) ( GREATER-THAN ?auto_11279 ?auto_11278 ) ( IN-CITY ?auto_11280 ?auto_11282 ) ( IN-CITY ?auto_11275 ?auto_11282 ) ( not ( = ?auto_11275 ?auto_11280 ) ) ( OBJ-AT ?auto_11279 ?auto_11280 ) ( OBJ-AT ?auto_11274 ?auto_11275 ) ( OBJ-AT ?auto_11276 ?auto_11275 ) ( not ( = ?auto_11274 ?auto_11276 ) ) ( not ( = ?auto_11274 ?auto_11277 ) ) ( not ( = ?auto_11274 ?auto_11278 ) ) ( not ( = ?auto_11274 ?auto_11279 ) ) ( not ( = ?auto_11276 ?auto_11277 ) ) ( not ( = ?auto_11276 ?auto_11278 ) ) ( not ( = ?auto_11276 ?auto_11279 ) ) ( not ( = ?auto_11277 ?auto_11278 ) ) ( not ( = ?auto_11277 ?auto_11279 ) ) ( not ( = ?auto_11278 ?auto_11279 ) ) ( IN-CITY ?auto_11284 ?auto_11282 ) ( not ( = ?auto_11275 ?auto_11284 ) ) ( not ( = ?auto_11280 ?auto_11284 ) ) ( OBJ-AT ?auto_11278 ?auto_11284 ) ( IN-CITY ?auto_11281 ?auto_11282 ) ( not ( = ?auto_11275 ?auto_11281 ) ) ( not ( = ?auto_11280 ?auto_11281 ) ) ( not ( = ?auto_11284 ?auto_11281 ) ) ( OBJ-AT ?auto_11277 ?auto_11281 ) ( TRUCK-AT ?auto_11283 ?auto_11275 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11283 ?auto_11275 ?auto_11281 ?auto_11282 )
      ( DELIVER-5PKG ?auto_11274 ?auto_11276 ?auto_11277 ?auto_11278 ?auto_11279 ?auto_11275 )
      ( DELIVER-5PKG-VERIFY ?auto_11274 ?auto_11276 ?auto_11277 ?auto_11278 ?auto_11279 ?auto_11275 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11291 - OBJ
      ?auto_11293 - OBJ
      ?auto_11294 - OBJ
      ?auto_11295 - OBJ
      ?auto_11296 - OBJ
      ?auto_11292 - LOCATION
    )
    :vars
    (
      ?auto_11300 - LOCATION
      ?auto_11301 - CITY
      ?auto_11299 - LOCATION
      ?auto_11297 - LOCATION
      ?auto_11298 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11293 ?auto_11291 ) ( GREATER-THAN ?auto_11294 ?auto_11291 ) ( GREATER-THAN ?auto_11294 ?auto_11293 ) ( GREATER-THAN ?auto_11295 ?auto_11291 ) ( GREATER-THAN ?auto_11295 ?auto_11293 ) ( GREATER-THAN ?auto_11295 ?auto_11294 ) ( GREATER-THAN ?auto_11296 ?auto_11291 ) ( GREATER-THAN ?auto_11296 ?auto_11293 ) ( GREATER-THAN ?auto_11296 ?auto_11294 ) ( GREATER-THAN ?auto_11296 ?auto_11295 ) ( IN-CITY ?auto_11300 ?auto_11301 ) ( IN-CITY ?auto_11292 ?auto_11301 ) ( not ( = ?auto_11292 ?auto_11300 ) ) ( OBJ-AT ?auto_11296 ?auto_11300 ) ( OBJ-AT ?auto_11291 ?auto_11292 ) ( not ( = ?auto_11291 ?auto_11293 ) ) ( not ( = ?auto_11291 ?auto_11294 ) ) ( not ( = ?auto_11291 ?auto_11295 ) ) ( not ( = ?auto_11291 ?auto_11296 ) ) ( not ( = ?auto_11293 ?auto_11294 ) ) ( not ( = ?auto_11293 ?auto_11295 ) ) ( not ( = ?auto_11293 ?auto_11296 ) ) ( not ( = ?auto_11294 ?auto_11295 ) ) ( not ( = ?auto_11294 ?auto_11296 ) ) ( not ( = ?auto_11295 ?auto_11296 ) ) ( IN-CITY ?auto_11299 ?auto_11301 ) ( not ( = ?auto_11292 ?auto_11299 ) ) ( not ( = ?auto_11300 ?auto_11299 ) ) ( OBJ-AT ?auto_11295 ?auto_11299 ) ( IN-CITY ?auto_11297 ?auto_11301 ) ( not ( = ?auto_11292 ?auto_11297 ) ) ( not ( = ?auto_11300 ?auto_11297 ) ) ( not ( = ?auto_11299 ?auto_11297 ) ) ( OBJ-AT ?auto_11294 ?auto_11297 ) ( TRUCK-AT ?auto_11298 ?auto_11292 ) ( IN-TRUCK ?auto_11293 ?auto_11298 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11293 ?auto_11292 )
      ( DELIVER-5PKG ?auto_11291 ?auto_11293 ?auto_11294 ?auto_11295 ?auto_11296 ?auto_11292 )
      ( DELIVER-5PKG-VERIFY ?auto_11291 ?auto_11293 ?auto_11294 ?auto_11295 ?auto_11296 ?auto_11292 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11308 - OBJ
      ?auto_11310 - OBJ
      ?auto_11311 - OBJ
      ?auto_11312 - OBJ
      ?auto_11313 - OBJ
      ?auto_11309 - LOCATION
    )
    :vars
    (
      ?auto_11314 - LOCATION
      ?auto_11316 - CITY
      ?auto_11317 - LOCATION
      ?auto_11315 - LOCATION
      ?auto_11318 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11310 ?auto_11308 ) ( GREATER-THAN ?auto_11311 ?auto_11308 ) ( GREATER-THAN ?auto_11311 ?auto_11310 ) ( GREATER-THAN ?auto_11312 ?auto_11308 ) ( GREATER-THAN ?auto_11312 ?auto_11310 ) ( GREATER-THAN ?auto_11312 ?auto_11311 ) ( GREATER-THAN ?auto_11313 ?auto_11308 ) ( GREATER-THAN ?auto_11313 ?auto_11310 ) ( GREATER-THAN ?auto_11313 ?auto_11311 ) ( GREATER-THAN ?auto_11313 ?auto_11312 ) ( IN-CITY ?auto_11314 ?auto_11316 ) ( IN-CITY ?auto_11309 ?auto_11316 ) ( not ( = ?auto_11309 ?auto_11314 ) ) ( OBJ-AT ?auto_11313 ?auto_11314 ) ( OBJ-AT ?auto_11308 ?auto_11309 ) ( not ( = ?auto_11308 ?auto_11310 ) ) ( not ( = ?auto_11308 ?auto_11311 ) ) ( not ( = ?auto_11308 ?auto_11312 ) ) ( not ( = ?auto_11308 ?auto_11313 ) ) ( not ( = ?auto_11310 ?auto_11311 ) ) ( not ( = ?auto_11310 ?auto_11312 ) ) ( not ( = ?auto_11310 ?auto_11313 ) ) ( not ( = ?auto_11311 ?auto_11312 ) ) ( not ( = ?auto_11311 ?auto_11313 ) ) ( not ( = ?auto_11312 ?auto_11313 ) ) ( IN-CITY ?auto_11317 ?auto_11316 ) ( not ( = ?auto_11309 ?auto_11317 ) ) ( not ( = ?auto_11314 ?auto_11317 ) ) ( OBJ-AT ?auto_11312 ?auto_11317 ) ( IN-CITY ?auto_11315 ?auto_11316 ) ( not ( = ?auto_11309 ?auto_11315 ) ) ( not ( = ?auto_11314 ?auto_11315 ) ) ( not ( = ?auto_11317 ?auto_11315 ) ) ( OBJ-AT ?auto_11311 ?auto_11315 ) ( IN-TRUCK ?auto_11310 ?auto_11318 ) ( TRUCK-AT ?auto_11318 ?auto_11315 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11318 ?auto_11315 ?auto_11309 ?auto_11316 )
      ( DELIVER-5PKG ?auto_11308 ?auto_11310 ?auto_11311 ?auto_11312 ?auto_11313 ?auto_11309 )
      ( DELIVER-5PKG-VERIFY ?auto_11308 ?auto_11310 ?auto_11311 ?auto_11312 ?auto_11313 ?auto_11309 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11325 - OBJ
      ?auto_11327 - OBJ
      ?auto_11328 - OBJ
      ?auto_11329 - OBJ
      ?auto_11330 - OBJ
      ?auto_11326 - LOCATION
    )
    :vars
    (
      ?auto_11333 - LOCATION
      ?auto_11335 - CITY
      ?auto_11331 - LOCATION
      ?auto_11332 - LOCATION
      ?auto_11334 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11327 ?auto_11325 ) ( GREATER-THAN ?auto_11328 ?auto_11325 ) ( GREATER-THAN ?auto_11328 ?auto_11327 ) ( GREATER-THAN ?auto_11329 ?auto_11325 ) ( GREATER-THAN ?auto_11329 ?auto_11327 ) ( GREATER-THAN ?auto_11329 ?auto_11328 ) ( GREATER-THAN ?auto_11330 ?auto_11325 ) ( GREATER-THAN ?auto_11330 ?auto_11327 ) ( GREATER-THAN ?auto_11330 ?auto_11328 ) ( GREATER-THAN ?auto_11330 ?auto_11329 ) ( IN-CITY ?auto_11333 ?auto_11335 ) ( IN-CITY ?auto_11326 ?auto_11335 ) ( not ( = ?auto_11326 ?auto_11333 ) ) ( OBJ-AT ?auto_11330 ?auto_11333 ) ( OBJ-AT ?auto_11325 ?auto_11326 ) ( not ( = ?auto_11325 ?auto_11327 ) ) ( not ( = ?auto_11325 ?auto_11328 ) ) ( not ( = ?auto_11325 ?auto_11329 ) ) ( not ( = ?auto_11325 ?auto_11330 ) ) ( not ( = ?auto_11327 ?auto_11328 ) ) ( not ( = ?auto_11327 ?auto_11329 ) ) ( not ( = ?auto_11327 ?auto_11330 ) ) ( not ( = ?auto_11328 ?auto_11329 ) ) ( not ( = ?auto_11328 ?auto_11330 ) ) ( not ( = ?auto_11329 ?auto_11330 ) ) ( IN-CITY ?auto_11331 ?auto_11335 ) ( not ( = ?auto_11326 ?auto_11331 ) ) ( not ( = ?auto_11333 ?auto_11331 ) ) ( OBJ-AT ?auto_11329 ?auto_11331 ) ( IN-CITY ?auto_11332 ?auto_11335 ) ( not ( = ?auto_11326 ?auto_11332 ) ) ( not ( = ?auto_11333 ?auto_11332 ) ) ( not ( = ?auto_11331 ?auto_11332 ) ) ( OBJ-AT ?auto_11328 ?auto_11332 ) ( TRUCK-AT ?auto_11334 ?auto_11332 ) ( OBJ-AT ?auto_11327 ?auto_11332 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11327 ?auto_11334 ?auto_11332 )
      ( DELIVER-5PKG ?auto_11325 ?auto_11327 ?auto_11328 ?auto_11329 ?auto_11330 ?auto_11326 )
      ( DELIVER-5PKG-VERIFY ?auto_11325 ?auto_11327 ?auto_11328 ?auto_11329 ?auto_11330 ?auto_11326 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11342 - OBJ
      ?auto_11344 - OBJ
      ?auto_11345 - OBJ
      ?auto_11346 - OBJ
      ?auto_11347 - OBJ
      ?auto_11343 - LOCATION
    )
    :vars
    (
      ?auto_11348 - LOCATION
      ?auto_11349 - CITY
      ?auto_11350 - LOCATION
      ?auto_11351 - LOCATION
      ?auto_11352 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11344 ?auto_11342 ) ( GREATER-THAN ?auto_11345 ?auto_11342 ) ( GREATER-THAN ?auto_11345 ?auto_11344 ) ( GREATER-THAN ?auto_11346 ?auto_11342 ) ( GREATER-THAN ?auto_11346 ?auto_11344 ) ( GREATER-THAN ?auto_11346 ?auto_11345 ) ( GREATER-THAN ?auto_11347 ?auto_11342 ) ( GREATER-THAN ?auto_11347 ?auto_11344 ) ( GREATER-THAN ?auto_11347 ?auto_11345 ) ( GREATER-THAN ?auto_11347 ?auto_11346 ) ( IN-CITY ?auto_11348 ?auto_11349 ) ( IN-CITY ?auto_11343 ?auto_11349 ) ( not ( = ?auto_11343 ?auto_11348 ) ) ( OBJ-AT ?auto_11347 ?auto_11348 ) ( OBJ-AT ?auto_11342 ?auto_11343 ) ( not ( = ?auto_11342 ?auto_11344 ) ) ( not ( = ?auto_11342 ?auto_11345 ) ) ( not ( = ?auto_11342 ?auto_11346 ) ) ( not ( = ?auto_11342 ?auto_11347 ) ) ( not ( = ?auto_11344 ?auto_11345 ) ) ( not ( = ?auto_11344 ?auto_11346 ) ) ( not ( = ?auto_11344 ?auto_11347 ) ) ( not ( = ?auto_11345 ?auto_11346 ) ) ( not ( = ?auto_11345 ?auto_11347 ) ) ( not ( = ?auto_11346 ?auto_11347 ) ) ( IN-CITY ?auto_11350 ?auto_11349 ) ( not ( = ?auto_11343 ?auto_11350 ) ) ( not ( = ?auto_11348 ?auto_11350 ) ) ( OBJ-AT ?auto_11346 ?auto_11350 ) ( IN-CITY ?auto_11351 ?auto_11349 ) ( not ( = ?auto_11343 ?auto_11351 ) ) ( not ( = ?auto_11348 ?auto_11351 ) ) ( not ( = ?auto_11350 ?auto_11351 ) ) ( OBJ-AT ?auto_11345 ?auto_11351 ) ( OBJ-AT ?auto_11344 ?auto_11351 ) ( TRUCK-AT ?auto_11352 ?auto_11343 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11352 ?auto_11343 ?auto_11351 ?auto_11349 )
      ( DELIVER-5PKG ?auto_11342 ?auto_11344 ?auto_11345 ?auto_11346 ?auto_11347 ?auto_11343 )
      ( DELIVER-5PKG-VERIFY ?auto_11342 ?auto_11344 ?auto_11345 ?auto_11346 ?auto_11347 ?auto_11343 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11359 - OBJ
      ?auto_11361 - OBJ
      ?auto_11362 - OBJ
      ?auto_11363 - OBJ
      ?auto_11364 - OBJ
      ?auto_11360 - LOCATION
    )
    :vars
    (
      ?auto_11367 - LOCATION
      ?auto_11366 - CITY
      ?auto_11365 - LOCATION
      ?auto_11368 - LOCATION
      ?auto_11369 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11361 ?auto_11359 ) ( GREATER-THAN ?auto_11362 ?auto_11359 ) ( GREATER-THAN ?auto_11362 ?auto_11361 ) ( GREATER-THAN ?auto_11363 ?auto_11359 ) ( GREATER-THAN ?auto_11363 ?auto_11361 ) ( GREATER-THAN ?auto_11363 ?auto_11362 ) ( GREATER-THAN ?auto_11364 ?auto_11359 ) ( GREATER-THAN ?auto_11364 ?auto_11361 ) ( GREATER-THAN ?auto_11364 ?auto_11362 ) ( GREATER-THAN ?auto_11364 ?auto_11363 ) ( IN-CITY ?auto_11367 ?auto_11366 ) ( IN-CITY ?auto_11360 ?auto_11366 ) ( not ( = ?auto_11360 ?auto_11367 ) ) ( OBJ-AT ?auto_11364 ?auto_11367 ) ( not ( = ?auto_11359 ?auto_11361 ) ) ( not ( = ?auto_11359 ?auto_11362 ) ) ( not ( = ?auto_11359 ?auto_11363 ) ) ( not ( = ?auto_11359 ?auto_11364 ) ) ( not ( = ?auto_11361 ?auto_11362 ) ) ( not ( = ?auto_11361 ?auto_11363 ) ) ( not ( = ?auto_11361 ?auto_11364 ) ) ( not ( = ?auto_11362 ?auto_11363 ) ) ( not ( = ?auto_11362 ?auto_11364 ) ) ( not ( = ?auto_11363 ?auto_11364 ) ) ( IN-CITY ?auto_11365 ?auto_11366 ) ( not ( = ?auto_11360 ?auto_11365 ) ) ( not ( = ?auto_11367 ?auto_11365 ) ) ( OBJ-AT ?auto_11363 ?auto_11365 ) ( IN-CITY ?auto_11368 ?auto_11366 ) ( not ( = ?auto_11360 ?auto_11368 ) ) ( not ( = ?auto_11367 ?auto_11368 ) ) ( not ( = ?auto_11365 ?auto_11368 ) ) ( OBJ-AT ?auto_11362 ?auto_11368 ) ( OBJ-AT ?auto_11361 ?auto_11368 ) ( TRUCK-AT ?auto_11369 ?auto_11360 ) ( IN-TRUCK ?auto_11359 ?auto_11369 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11359 ?auto_11360 )
      ( DELIVER-5PKG ?auto_11359 ?auto_11361 ?auto_11362 ?auto_11363 ?auto_11364 ?auto_11360 )
      ( DELIVER-5PKG-VERIFY ?auto_11359 ?auto_11361 ?auto_11362 ?auto_11363 ?auto_11364 ?auto_11360 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11376 - OBJ
      ?auto_11378 - OBJ
      ?auto_11379 - OBJ
      ?auto_11380 - OBJ
      ?auto_11381 - OBJ
      ?auto_11377 - LOCATION
    )
    :vars
    (
      ?auto_11385 - LOCATION
      ?auto_11386 - CITY
      ?auto_11384 - LOCATION
      ?auto_11382 - LOCATION
      ?auto_11383 - TRUCK
      ?auto_11387 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11378 ?auto_11376 ) ( GREATER-THAN ?auto_11379 ?auto_11376 ) ( GREATER-THAN ?auto_11379 ?auto_11378 ) ( GREATER-THAN ?auto_11380 ?auto_11376 ) ( GREATER-THAN ?auto_11380 ?auto_11378 ) ( GREATER-THAN ?auto_11380 ?auto_11379 ) ( GREATER-THAN ?auto_11381 ?auto_11376 ) ( GREATER-THAN ?auto_11381 ?auto_11378 ) ( GREATER-THAN ?auto_11381 ?auto_11379 ) ( GREATER-THAN ?auto_11381 ?auto_11380 ) ( IN-CITY ?auto_11385 ?auto_11386 ) ( IN-CITY ?auto_11377 ?auto_11386 ) ( not ( = ?auto_11377 ?auto_11385 ) ) ( OBJ-AT ?auto_11381 ?auto_11385 ) ( not ( = ?auto_11376 ?auto_11378 ) ) ( not ( = ?auto_11376 ?auto_11379 ) ) ( not ( = ?auto_11376 ?auto_11380 ) ) ( not ( = ?auto_11376 ?auto_11381 ) ) ( not ( = ?auto_11378 ?auto_11379 ) ) ( not ( = ?auto_11378 ?auto_11380 ) ) ( not ( = ?auto_11378 ?auto_11381 ) ) ( not ( = ?auto_11379 ?auto_11380 ) ) ( not ( = ?auto_11379 ?auto_11381 ) ) ( not ( = ?auto_11380 ?auto_11381 ) ) ( IN-CITY ?auto_11384 ?auto_11386 ) ( not ( = ?auto_11377 ?auto_11384 ) ) ( not ( = ?auto_11385 ?auto_11384 ) ) ( OBJ-AT ?auto_11380 ?auto_11384 ) ( IN-CITY ?auto_11382 ?auto_11386 ) ( not ( = ?auto_11377 ?auto_11382 ) ) ( not ( = ?auto_11385 ?auto_11382 ) ) ( not ( = ?auto_11384 ?auto_11382 ) ) ( OBJ-AT ?auto_11379 ?auto_11382 ) ( OBJ-AT ?auto_11378 ?auto_11382 ) ( IN-TRUCK ?auto_11376 ?auto_11383 ) ( TRUCK-AT ?auto_11383 ?auto_11387 ) ( IN-CITY ?auto_11387 ?auto_11386 ) ( not ( = ?auto_11377 ?auto_11387 ) ) ( not ( = ?auto_11385 ?auto_11387 ) ) ( not ( = ?auto_11384 ?auto_11387 ) ) ( not ( = ?auto_11382 ?auto_11387 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11383 ?auto_11387 ?auto_11377 ?auto_11386 )
      ( DELIVER-5PKG ?auto_11376 ?auto_11378 ?auto_11379 ?auto_11380 ?auto_11381 ?auto_11377 )
      ( DELIVER-5PKG-VERIFY ?auto_11376 ?auto_11378 ?auto_11379 ?auto_11380 ?auto_11381 ?auto_11377 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11394 - OBJ
      ?auto_11396 - OBJ
      ?auto_11397 - OBJ
      ?auto_11398 - OBJ
      ?auto_11399 - OBJ
      ?auto_11395 - LOCATION
    )
    :vars
    (
      ?auto_11402 - LOCATION
      ?auto_11404 - CITY
      ?auto_11400 - LOCATION
      ?auto_11401 - LOCATION
      ?auto_11403 - TRUCK
      ?auto_11405 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11396 ?auto_11394 ) ( GREATER-THAN ?auto_11397 ?auto_11394 ) ( GREATER-THAN ?auto_11397 ?auto_11396 ) ( GREATER-THAN ?auto_11398 ?auto_11394 ) ( GREATER-THAN ?auto_11398 ?auto_11396 ) ( GREATER-THAN ?auto_11398 ?auto_11397 ) ( GREATER-THAN ?auto_11399 ?auto_11394 ) ( GREATER-THAN ?auto_11399 ?auto_11396 ) ( GREATER-THAN ?auto_11399 ?auto_11397 ) ( GREATER-THAN ?auto_11399 ?auto_11398 ) ( IN-CITY ?auto_11402 ?auto_11404 ) ( IN-CITY ?auto_11395 ?auto_11404 ) ( not ( = ?auto_11395 ?auto_11402 ) ) ( OBJ-AT ?auto_11399 ?auto_11402 ) ( not ( = ?auto_11394 ?auto_11396 ) ) ( not ( = ?auto_11394 ?auto_11397 ) ) ( not ( = ?auto_11394 ?auto_11398 ) ) ( not ( = ?auto_11394 ?auto_11399 ) ) ( not ( = ?auto_11396 ?auto_11397 ) ) ( not ( = ?auto_11396 ?auto_11398 ) ) ( not ( = ?auto_11396 ?auto_11399 ) ) ( not ( = ?auto_11397 ?auto_11398 ) ) ( not ( = ?auto_11397 ?auto_11399 ) ) ( not ( = ?auto_11398 ?auto_11399 ) ) ( IN-CITY ?auto_11400 ?auto_11404 ) ( not ( = ?auto_11395 ?auto_11400 ) ) ( not ( = ?auto_11402 ?auto_11400 ) ) ( OBJ-AT ?auto_11398 ?auto_11400 ) ( IN-CITY ?auto_11401 ?auto_11404 ) ( not ( = ?auto_11395 ?auto_11401 ) ) ( not ( = ?auto_11402 ?auto_11401 ) ) ( not ( = ?auto_11400 ?auto_11401 ) ) ( OBJ-AT ?auto_11397 ?auto_11401 ) ( OBJ-AT ?auto_11396 ?auto_11401 ) ( TRUCK-AT ?auto_11403 ?auto_11405 ) ( IN-CITY ?auto_11405 ?auto_11404 ) ( not ( = ?auto_11395 ?auto_11405 ) ) ( not ( = ?auto_11402 ?auto_11405 ) ) ( not ( = ?auto_11400 ?auto_11405 ) ) ( not ( = ?auto_11401 ?auto_11405 ) ) ( OBJ-AT ?auto_11394 ?auto_11405 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11394 ?auto_11403 ?auto_11405 )
      ( DELIVER-5PKG ?auto_11394 ?auto_11396 ?auto_11397 ?auto_11398 ?auto_11399 ?auto_11395 )
      ( DELIVER-5PKG-VERIFY ?auto_11394 ?auto_11396 ?auto_11397 ?auto_11398 ?auto_11399 ?auto_11395 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_11412 - OBJ
      ?auto_11414 - OBJ
      ?auto_11415 - OBJ
      ?auto_11416 - OBJ
      ?auto_11417 - OBJ
      ?auto_11413 - LOCATION
    )
    :vars
    (
      ?auto_11418 - LOCATION
      ?auto_11420 - CITY
      ?auto_11422 - LOCATION
      ?auto_11423 - LOCATION
      ?auto_11419 - LOCATION
      ?auto_11421 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11414 ?auto_11412 ) ( GREATER-THAN ?auto_11415 ?auto_11412 ) ( GREATER-THAN ?auto_11415 ?auto_11414 ) ( GREATER-THAN ?auto_11416 ?auto_11412 ) ( GREATER-THAN ?auto_11416 ?auto_11414 ) ( GREATER-THAN ?auto_11416 ?auto_11415 ) ( GREATER-THAN ?auto_11417 ?auto_11412 ) ( GREATER-THAN ?auto_11417 ?auto_11414 ) ( GREATER-THAN ?auto_11417 ?auto_11415 ) ( GREATER-THAN ?auto_11417 ?auto_11416 ) ( IN-CITY ?auto_11418 ?auto_11420 ) ( IN-CITY ?auto_11413 ?auto_11420 ) ( not ( = ?auto_11413 ?auto_11418 ) ) ( OBJ-AT ?auto_11417 ?auto_11418 ) ( not ( = ?auto_11412 ?auto_11414 ) ) ( not ( = ?auto_11412 ?auto_11415 ) ) ( not ( = ?auto_11412 ?auto_11416 ) ) ( not ( = ?auto_11412 ?auto_11417 ) ) ( not ( = ?auto_11414 ?auto_11415 ) ) ( not ( = ?auto_11414 ?auto_11416 ) ) ( not ( = ?auto_11414 ?auto_11417 ) ) ( not ( = ?auto_11415 ?auto_11416 ) ) ( not ( = ?auto_11415 ?auto_11417 ) ) ( not ( = ?auto_11416 ?auto_11417 ) ) ( IN-CITY ?auto_11422 ?auto_11420 ) ( not ( = ?auto_11413 ?auto_11422 ) ) ( not ( = ?auto_11418 ?auto_11422 ) ) ( OBJ-AT ?auto_11416 ?auto_11422 ) ( IN-CITY ?auto_11423 ?auto_11420 ) ( not ( = ?auto_11413 ?auto_11423 ) ) ( not ( = ?auto_11418 ?auto_11423 ) ) ( not ( = ?auto_11422 ?auto_11423 ) ) ( OBJ-AT ?auto_11415 ?auto_11423 ) ( OBJ-AT ?auto_11414 ?auto_11423 ) ( IN-CITY ?auto_11419 ?auto_11420 ) ( not ( = ?auto_11413 ?auto_11419 ) ) ( not ( = ?auto_11418 ?auto_11419 ) ) ( not ( = ?auto_11422 ?auto_11419 ) ) ( not ( = ?auto_11423 ?auto_11419 ) ) ( OBJ-AT ?auto_11412 ?auto_11419 ) ( TRUCK-AT ?auto_11421 ?auto_11413 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11421 ?auto_11413 ?auto_11419 ?auto_11420 )
      ( DELIVER-5PKG ?auto_11412 ?auto_11414 ?auto_11415 ?auto_11416 ?auto_11417 ?auto_11413 )
      ( DELIVER-5PKG-VERIFY ?auto_11412 ?auto_11414 ?auto_11415 ?auto_11416 ?auto_11417 ?auto_11413 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11457 - OBJ
      ?auto_11459 - OBJ
      ?auto_11461 - OBJ
      ?auto_11462 - OBJ
      ?auto_11463 - OBJ
      ?auto_11460 - OBJ
      ?auto_11458 - LOCATION
    )
    :vars
    (
      ?auto_11464 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11459 ?auto_11457 ) ( GREATER-THAN ?auto_11461 ?auto_11457 ) ( GREATER-THAN ?auto_11461 ?auto_11459 ) ( GREATER-THAN ?auto_11462 ?auto_11457 ) ( GREATER-THAN ?auto_11462 ?auto_11459 ) ( GREATER-THAN ?auto_11462 ?auto_11461 ) ( GREATER-THAN ?auto_11463 ?auto_11457 ) ( GREATER-THAN ?auto_11463 ?auto_11459 ) ( GREATER-THAN ?auto_11463 ?auto_11461 ) ( GREATER-THAN ?auto_11463 ?auto_11462 ) ( GREATER-THAN ?auto_11460 ?auto_11457 ) ( GREATER-THAN ?auto_11460 ?auto_11459 ) ( GREATER-THAN ?auto_11460 ?auto_11461 ) ( GREATER-THAN ?auto_11460 ?auto_11462 ) ( GREATER-THAN ?auto_11460 ?auto_11463 ) ( TRUCK-AT ?auto_11464 ?auto_11458 ) ( IN-TRUCK ?auto_11460 ?auto_11464 ) ( OBJ-AT ?auto_11457 ?auto_11458 ) ( OBJ-AT ?auto_11459 ?auto_11458 ) ( OBJ-AT ?auto_11461 ?auto_11458 ) ( OBJ-AT ?auto_11462 ?auto_11458 ) ( OBJ-AT ?auto_11463 ?auto_11458 ) ( not ( = ?auto_11457 ?auto_11459 ) ) ( not ( = ?auto_11457 ?auto_11461 ) ) ( not ( = ?auto_11457 ?auto_11462 ) ) ( not ( = ?auto_11457 ?auto_11463 ) ) ( not ( = ?auto_11457 ?auto_11460 ) ) ( not ( = ?auto_11459 ?auto_11461 ) ) ( not ( = ?auto_11459 ?auto_11462 ) ) ( not ( = ?auto_11459 ?auto_11463 ) ) ( not ( = ?auto_11459 ?auto_11460 ) ) ( not ( = ?auto_11461 ?auto_11462 ) ) ( not ( = ?auto_11461 ?auto_11463 ) ) ( not ( = ?auto_11461 ?auto_11460 ) ) ( not ( = ?auto_11462 ?auto_11463 ) ) ( not ( = ?auto_11462 ?auto_11460 ) ) ( not ( = ?auto_11463 ?auto_11460 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11460 ?auto_11458 )
      ( DELIVER-6PKG-VERIFY ?auto_11457 ?auto_11459 ?auto_11461 ?auto_11462 ?auto_11463 ?auto_11460 ?auto_11458 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11472 - OBJ
      ?auto_11474 - OBJ
      ?auto_11476 - OBJ
      ?auto_11477 - OBJ
      ?auto_11478 - OBJ
      ?auto_11475 - OBJ
      ?auto_11473 - LOCATION
    )
    :vars
    (
      ?auto_11480 - TRUCK
      ?auto_11481 - LOCATION
      ?auto_11479 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11474 ?auto_11472 ) ( GREATER-THAN ?auto_11476 ?auto_11472 ) ( GREATER-THAN ?auto_11476 ?auto_11474 ) ( GREATER-THAN ?auto_11477 ?auto_11472 ) ( GREATER-THAN ?auto_11477 ?auto_11474 ) ( GREATER-THAN ?auto_11477 ?auto_11476 ) ( GREATER-THAN ?auto_11478 ?auto_11472 ) ( GREATER-THAN ?auto_11478 ?auto_11474 ) ( GREATER-THAN ?auto_11478 ?auto_11476 ) ( GREATER-THAN ?auto_11478 ?auto_11477 ) ( GREATER-THAN ?auto_11475 ?auto_11472 ) ( GREATER-THAN ?auto_11475 ?auto_11474 ) ( GREATER-THAN ?auto_11475 ?auto_11476 ) ( GREATER-THAN ?auto_11475 ?auto_11477 ) ( GREATER-THAN ?auto_11475 ?auto_11478 ) ( IN-TRUCK ?auto_11475 ?auto_11480 ) ( TRUCK-AT ?auto_11480 ?auto_11481 ) ( IN-CITY ?auto_11481 ?auto_11479 ) ( IN-CITY ?auto_11473 ?auto_11479 ) ( not ( = ?auto_11473 ?auto_11481 ) ) ( OBJ-AT ?auto_11472 ?auto_11473 ) ( OBJ-AT ?auto_11474 ?auto_11473 ) ( OBJ-AT ?auto_11476 ?auto_11473 ) ( OBJ-AT ?auto_11477 ?auto_11473 ) ( OBJ-AT ?auto_11478 ?auto_11473 ) ( not ( = ?auto_11472 ?auto_11474 ) ) ( not ( = ?auto_11472 ?auto_11476 ) ) ( not ( = ?auto_11472 ?auto_11477 ) ) ( not ( = ?auto_11472 ?auto_11478 ) ) ( not ( = ?auto_11472 ?auto_11475 ) ) ( not ( = ?auto_11474 ?auto_11476 ) ) ( not ( = ?auto_11474 ?auto_11477 ) ) ( not ( = ?auto_11474 ?auto_11478 ) ) ( not ( = ?auto_11474 ?auto_11475 ) ) ( not ( = ?auto_11476 ?auto_11477 ) ) ( not ( = ?auto_11476 ?auto_11478 ) ) ( not ( = ?auto_11476 ?auto_11475 ) ) ( not ( = ?auto_11477 ?auto_11478 ) ) ( not ( = ?auto_11477 ?auto_11475 ) ) ( not ( = ?auto_11478 ?auto_11475 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11475 ?auto_11473 )
      ( DELIVER-6PKG-VERIFY ?auto_11472 ?auto_11474 ?auto_11476 ?auto_11477 ?auto_11478 ?auto_11475 ?auto_11473 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11489 - OBJ
      ?auto_11491 - OBJ
      ?auto_11493 - OBJ
      ?auto_11494 - OBJ
      ?auto_11495 - OBJ
      ?auto_11492 - OBJ
      ?auto_11490 - LOCATION
    )
    :vars
    (
      ?auto_11496 - TRUCK
      ?auto_11498 - LOCATION
      ?auto_11497 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11491 ?auto_11489 ) ( GREATER-THAN ?auto_11493 ?auto_11489 ) ( GREATER-THAN ?auto_11493 ?auto_11491 ) ( GREATER-THAN ?auto_11494 ?auto_11489 ) ( GREATER-THAN ?auto_11494 ?auto_11491 ) ( GREATER-THAN ?auto_11494 ?auto_11493 ) ( GREATER-THAN ?auto_11495 ?auto_11489 ) ( GREATER-THAN ?auto_11495 ?auto_11491 ) ( GREATER-THAN ?auto_11495 ?auto_11493 ) ( GREATER-THAN ?auto_11495 ?auto_11494 ) ( GREATER-THAN ?auto_11492 ?auto_11489 ) ( GREATER-THAN ?auto_11492 ?auto_11491 ) ( GREATER-THAN ?auto_11492 ?auto_11493 ) ( GREATER-THAN ?auto_11492 ?auto_11494 ) ( GREATER-THAN ?auto_11492 ?auto_11495 ) ( TRUCK-AT ?auto_11496 ?auto_11498 ) ( IN-CITY ?auto_11498 ?auto_11497 ) ( IN-CITY ?auto_11490 ?auto_11497 ) ( not ( = ?auto_11490 ?auto_11498 ) ) ( OBJ-AT ?auto_11492 ?auto_11498 ) ( OBJ-AT ?auto_11489 ?auto_11490 ) ( OBJ-AT ?auto_11491 ?auto_11490 ) ( OBJ-AT ?auto_11493 ?auto_11490 ) ( OBJ-AT ?auto_11494 ?auto_11490 ) ( OBJ-AT ?auto_11495 ?auto_11490 ) ( not ( = ?auto_11489 ?auto_11491 ) ) ( not ( = ?auto_11489 ?auto_11493 ) ) ( not ( = ?auto_11489 ?auto_11494 ) ) ( not ( = ?auto_11489 ?auto_11495 ) ) ( not ( = ?auto_11489 ?auto_11492 ) ) ( not ( = ?auto_11491 ?auto_11493 ) ) ( not ( = ?auto_11491 ?auto_11494 ) ) ( not ( = ?auto_11491 ?auto_11495 ) ) ( not ( = ?auto_11491 ?auto_11492 ) ) ( not ( = ?auto_11493 ?auto_11494 ) ) ( not ( = ?auto_11493 ?auto_11495 ) ) ( not ( = ?auto_11493 ?auto_11492 ) ) ( not ( = ?auto_11494 ?auto_11495 ) ) ( not ( = ?auto_11494 ?auto_11492 ) ) ( not ( = ?auto_11495 ?auto_11492 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11492 ?auto_11490 )
      ( DELIVER-6PKG-VERIFY ?auto_11489 ?auto_11491 ?auto_11493 ?auto_11494 ?auto_11495 ?auto_11492 ?auto_11490 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11506 - OBJ
      ?auto_11508 - OBJ
      ?auto_11510 - OBJ
      ?auto_11511 - OBJ
      ?auto_11512 - OBJ
      ?auto_11509 - OBJ
      ?auto_11507 - LOCATION
    )
    :vars
    (
      ?auto_11513 - LOCATION
      ?auto_11515 - CITY
      ?auto_11514 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11508 ?auto_11506 ) ( GREATER-THAN ?auto_11510 ?auto_11506 ) ( GREATER-THAN ?auto_11510 ?auto_11508 ) ( GREATER-THAN ?auto_11511 ?auto_11506 ) ( GREATER-THAN ?auto_11511 ?auto_11508 ) ( GREATER-THAN ?auto_11511 ?auto_11510 ) ( GREATER-THAN ?auto_11512 ?auto_11506 ) ( GREATER-THAN ?auto_11512 ?auto_11508 ) ( GREATER-THAN ?auto_11512 ?auto_11510 ) ( GREATER-THAN ?auto_11512 ?auto_11511 ) ( GREATER-THAN ?auto_11509 ?auto_11506 ) ( GREATER-THAN ?auto_11509 ?auto_11508 ) ( GREATER-THAN ?auto_11509 ?auto_11510 ) ( GREATER-THAN ?auto_11509 ?auto_11511 ) ( GREATER-THAN ?auto_11509 ?auto_11512 ) ( IN-CITY ?auto_11513 ?auto_11515 ) ( IN-CITY ?auto_11507 ?auto_11515 ) ( not ( = ?auto_11507 ?auto_11513 ) ) ( OBJ-AT ?auto_11509 ?auto_11513 ) ( TRUCK-AT ?auto_11514 ?auto_11507 ) ( OBJ-AT ?auto_11506 ?auto_11507 ) ( OBJ-AT ?auto_11508 ?auto_11507 ) ( OBJ-AT ?auto_11510 ?auto_11507 ) ( OBJ-AT ?auto_11511 ?auto_11507 ) ( OBJ-AT ?auto_11512 ?auto_11507 ) ( not ( = ?auto_11506 ?auto_11508 ) ) ( not ( = ?auto_11506 ?auto_11510 ) ) ( not ( = ?auto_11506 ?auto_11511 ) ) ( not ( = ?auto_11506 ?auto_11512 ) ) ( not ( = ?auto_11506 ?auto_11509 ) ) ( not ( = ?auto_11508 ?auto_11510 ) ) ( not ( = ?auto_11508 ?auto_11511 ) ) ( not ( = ?auto_11508 ?auto_11512 ) ) ( not ( = ?auto_11508 ?auto_11509 ) ) ( not ( = ?auto_11510 ?auto_11511 ) ) ( not ( = ?auto_11510 ?auto_11512 ) ) ( not ( = ?auto_11510 ?auto_11509 ) ) ( not ( = ?auto_11511 ?auto_11512 ) ) ( not ( = ?auto_11511 ?auto_11509 ) ) ( not ( = ?auto_11512 ?auto_11509 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11509 ?auto_11507 )
      ( DELIVER-6PKG-VERIFY ?auto_11506 ?auto_11508 ?auto_11510 ?auto_11511 ?auto_11512 ?auto_11509 ?auto_11507 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11523 - OBJ
      ?auto_11525 - OBJ
      ?auto_11527 - OBJ
      ?auto_11528 - OBJ
      ?auto_11529 - OBJ
      ?auto_11526 - OBJ
      ?auto_11524 - LOCATION
    )
    :vars
    (
      ?auto_11532 - LOCATION
      ?auto_11531 - CITY
      ?auto_11530 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11525 ?auto_11523 ) ( GREATER-THAN ?auto_11527 ?auto_11523 ) ( GREATER-THAN ?auto_11527 ?auto_11525 ) ( GREATER-THAN ?auto_11528 ?auto_11523 ) ( GREATER-THAN ?auto_11528 ?auto_11525 ) ( GREATER-THAN ?auto_11528 ?auto_11527 ) ( GREATER-THAN ?auto_11529 ?auto_11523 ) ( GREATER-THAN ?auto_11529 ?auto_11525 ) ( GREATER-THAN ?auto_11529 ?auto_11527 ) ( GREATER-THAN ?auto_11529 ?auto_11528 ) ( GREATER-THAN ?auto_11526 ?auto_11523 ) ( GREATER-THAN ?auto_11526 ?auto_11525 ) ( GREATER-THAN ?auto_11526 ?auto_11527 ) ( GREATER-THAN ?auto_11526 ?auto_11528 ) ( GREATER-THAN ?auto_11526 ?auto_11529 ) ( IN-CITY ?auto_11532 ?auto_11531 ) ( IN-CITY ?auto_11524 ?auto_11531 ) ( not ( = ?auto_11524 ?auto_11532 ) ) ( OBJ-AT ?auto_11526 ?auto_11532 ) ( TRUCK-AT ?auto_11530 ?auto_11524 ) ( OBJ-AT ?auto_11523 ?auto_11524 ) ( OBJ-AT ?auto_11525 ?auto_11524 ) ( OBJ-AT ?auto_11527 ?auto_11524 ) ( OBJ-AT ?auto_11528 ?auto_11524 ) ( not ( = ?auto_11523 ?auto_11525 ) ) ( not ( = ?auto_11523 ?auto_11527 ) ) ( not ( = ?auto_11523 ?auto_11528 ) ) ( not ( = ?auto_11523 ?auto_11529 ) ) ( not ( = ?auto_11523 ?auto_11526 ) ) ( not ( = ?auto_11525 ?auto_11527 ) ) ( not ( = ?auto_11525 ?auto_11528 ) ) ( not ( = ?auto_11525 ?auto_11529 ) ) ( not ( = ?auto_11525 ?auto_11526 ) ) ( not ( = ?auto_11527 ?auto_11528 ) ) ( not ( = ?auto_11527 ?auto_11529 ) ) ( not ( = ?auto_11527 ?auto_11526 ) ) ( not ( = ?auto_11528 ?auto_11529 ) ) ( not ( = ?auto_11528 ?auto_11526 ) ) ( not ( = ?auto_11529 ?auto_11526 ) ) ( IN-TRUCK ?auto_11529 ?auto_11530 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11529 ?auto_11524 )
      ( DELIVER-6PKG ?auto_11523 ?auto_11525 ?auto_11527 ?auto_11528 ?auto_11529 ?auto_11526 ?auto_11524 )
      ( DELIVER-6PKG-VERIFY ?auto_11523 ?auto_11525 ?auto_11527 ?auto_11528 ?auto_11529 ?auto_11526 ?auto_11524 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11540 - OBJ
      ?auto_11542 - OBJ
      ?auto_11544 - OBJ
      ?auto_11545 - OBJ
      ?auto_11546 - OBJ
      ?auto_11543 - OBJ
      ?auto_11541 - LOCATION
    )
    :vars
    (
      ?auto_11547 - LOCATION
      ?auto_11548 - CITY
      ?auto_11549 - TRUCK
      ?auto_11550 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11542 ?auto_11540 ) ( GREATER-THAN ?auto_11544 ?auto_11540 ) ( GREATER-THAN ?auto_11544 ?auto_11542 ) ( GREATER-THAN ?auto_11545 ?auto_11540 ) ( GREATER-THAN ?auto_11545 ?auto_11542 ) ( GREATER-THAN ?auto_11545 ?auto_11544 ) ( GREATER-THAN ?auto_11546 ?auto_11540 ) ( GREATER-THAN ?auto_11546 ?auto_11542 ) ( GREATER-THAN ?auto_11546 ?auto_11544 ) ( GREATER-THAN ?auto_11546 ?auto_11545 ) ( GREATER-THAN ?auto_11543 ?auto_11540 ) ( GREATER-THAN ?auto_11543 ?auto_11542 ) ( GREATER-THAN ?auto_11543 ?auto_11544 ) ( GREATER-THAN ?auto_11543 ?auto_11545 ) ( GREATER-THAN ?auto_11543 ?auto_11546 ) ( IN-CITY ?auto_11547 ?auto_11548 ) ( IN-CITY ?auto_11541 ?auto_11548 ) ( not ( = ?auto_11541 ?auto_11547 ) ) ( OBJ-AT ?auto_11543 ?auto_11547 ) ( OBJ-AT ?auto_11540 ?auto_11541 ) ( OBJ-AT ?auto_11542 ?auto_11541 ) ( OBJ-AT ?auto_11544 ?auto_11541 ) ( OBJ-AT ?auto_11545 ?auto_11541 ) ( not ( = ?auto_11540 ?auto_11542 ) ) ( not ( = ?auto_11540 ?auto_11544 ) ) ( not ( = ?auto_11540 ?auto_11545 ) ) ( not ( = ?auto_11540 ?auto_11546 ) ) ( not ( = ?auto_11540 ?auto_11543 ) ) ( not ( = ?auto_11542 ?auto_11544 ) ) ( not ( = ?auto_11542 ?auto_11545 ) ) ( not ( = ?auto_11542 ?auto_11546 ) ) ( not ( = ?auto_11542 ?auto_11543 ) ) ( not ( = ?auto_11544 ?auto_11545 ) ) ( not ( = ?auto_11544 ?auto_11546 ) ) ( not ( = ?auto_11544 ?auto_11543 ) ) ( not ( = ?auto_11545 ?auto_11546 ) ) ( not ( = ?auto_11545 ?auto_11543 ) ) ( not ( = ?auto_11546 ?auto_11543 ) ) ( IN-TRUCK ?auto_11546 ?auto_11549 ) ( TRUCK-AT ?auto_11549 ?auto_11550 ) ( IN-CITY ?auto_11550 ?auto_11548 ) ( not ( = ?auto_11541 ?auto_11550 ) ) ( not ( = ?auto_11547 ?auto_11550 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11549 ?auto_11550 ?auto_11541 ?auto_11548 )
      ( DELIVER-6PKG ?auto_11540 ?auto_11542 ?auto_11544 ?auto_11545 ?auto_11546 ?auto_11543 ?auto_11541 )
      ( DELIVER-6PKG-VERIFY ?auto_11540 ?auto_11542 ?auto_11544 ?auto_11545 ?auto_11546 ?auto_11543 ?auto_11541 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11558 - OBJ
      ?auto_11560 - OBJ
      ?auto_11562 - OBJ
      ?auto_11563 - OBJ
      ?auto_11564 - OBJ
      ?auto_11561 - OBJ
      ?auto_11559 - LOCATION
    )
    :vars
    (
      ?auto_11566 - LOCATION
      ?auto_11568 - CITY
      ?auto_11565 - TRUCK
      ?auto_11567 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11560 ?auto_11558 ) ( GREATER-THAN ?auto_11562 ?auto_11558 ) ( GREATER-THAN ?auto_11562 ?auto_11560 ) ( GREATER-THAN ?auto_11563 ?auto_11558 ) ( GREATER-THAN ?auto_11563 ?auto_11560 ) ( GREATER-THAN ?auto_11563 ?auto_11562 ) ( GREATER-THAN ?auto_11564 ?auto_11558 ) ( GREATER-THAN ?auto_11564 ?auto_11560 ) ( GREATER-THAN ?auto_11564 ?auto_11562 ) ( GREATER-THAN ?auto_11564 ?auto_11563 ) ( GREATER-THAN ?auto_11561 ?auto_11558 ) ( GREATER-THAN ?auto_11561 ?auto_11560 ) ( GREATER-THAN ?auto_11561 ?auto_11562 ) ( GREATER-THAN ?auto_11561 ?auto_11563 ) ( GREATER-THAN ?auto_11561 ?auto_11564 ) ( IN-CITY ?auto_11566 ?auto_11568 ) ( IN-CITY ?auto_11559 ?auto_11568 ) ( not ( = ?auto_11559 ?auto_11566 ) ) ( OBJ-AT ?auto_11561 ?auto_11566 ) ( OBJ-AT ?auto_11558 ?auto_11559 ) ( OBJ-AT ?auto_11560 ?auto_11559 ) ( OBJ-AT ?auto_11562 ?auto_11559 ) ( OBJ-AT ?auto_11563 ?auto_11559 ) ( not ( = ?auto_11558 ?auto_11560 ) ) ( not ( = ?auto_11558 ?auto_11562 ) ) ( not ( = ?auto_11558 ?auto_11563 ) ) ( not ( = ?auto_11558 ?auto_11564 ) ) ( not ( = ?auto_11558 ?auto_11561 ) ) ( not ( = ?auto_11560 ?auto_11562 ) ) ( not ( = ?auto_11560 ?auto_11563 ) ) ( not ( = ?auto_11560 ?auto_11564 ) ) ( not ( = ?auto_11560 ?auto_11561 ) ) ( not ( = ?auto_11562 ?auto_11563 ) ) ( not ( = ?auto_11562 ?auto_11564 ) ) ( not ( = ?auto_11562 ?auto_11561 ) ) ( not ( = ?auto_11563 ?auto_11564 ) ) ( not ( = ?auto_11563 ?auto_11561 ) ) ( not ( = ?auto_11564 ?auto_11561 ) ) ( TRUCK-AT ?auto_11565 ?auto_11567 ) ( IN-CITY ?auto_11567 ?auto_11568 ) ( not ( = ?auto_11559 ?auto_11567 ) ) ( not ( = ?auto_11566 ?auto_11567 ) ) ( OBJ-AT ?auto_11564 ?auto_11567 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11564 ?auto_11565 ?auto_11567 )
      ( DELIVER-6PKG ?auto_11558 ?auto_11560 ?auto_11562 ?auto_11563 ?auto_11564 ?auto_11561 ?auto_11559 )
      ( DELIVER-6PKG-VERIFY ?auto_11558 ?auto_11560 ?auto_11562 ?auto_11563 ?auto_11564 ?auto_11561 ?auto_11559 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11576 - OBJ
      ?auto_11578 - OBJ
      ?auto_11580 - OBJ
      ?auto_11581 - OBJ
      ?auto_11582 - OBJ
      ?auto_11579 - OBJ
      ?auto_11577 - LOCATION
    )
    :vars
    (
      ?auto_11586 - LOCATION
      ?auto_11585 - CITY
      ?auto_11584 - LOCATION
      ?auto_11583 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11578 ?auto_11576 ) ( GREATER-THAN ?auto_11580 ?auto_11576 ) ( GREATER-THAN ?auto_11580 ?auto_11578 ) ( GREATER-THAN ?auto_11581 ?auto_11576 ) ( GREATER-THAN ?auto_11581 ?auto_11578 ) ( GREATER-THAN ?auto_11581 ?auto_11580 ) ( GREATER-THAN ?auto_11582 ?auto_11576 ) ( GREATER-THAN ?auto_11582 ?auto_11578 ) ( GREATER-THAN ?auto_11582 ?auto_11580 ) ( GREATER-THAN ?auto_11582 ?auto_11581 ) ( GREATER-THAN ?auto_11579 ?auto_11576 ) ( GREATER-THAN ?auto_11579 ?auto_11578 ) ( GREATER-THAN ?auto_11579 ?auto_11580 ) ( GREATER-THAN ?auto_11579 ?auto_11581 ) ( GREATER-THAN ?auto_11579 ?auto_11582 ) ( IN-CITY ?auto_11586 ?auto_11585 ) ( IN-CITY ?auto_11577 ?auto_11585 ) ( not ( = ?auto_11577 ?auto_11586 ) ) ( OBJ-AT ?auto_11579 ?auto_11586 ) ( OBJ-AT ?auto_11576 ?auto_11577 ) ( OBJ-AT ?auto_11578 ?auto_11577 ) ( OBJ-AT ?auto_11580 ?auto_11577 ) ( OBJ-AT ?auto_11581 ?auto_11577 ) ( not ( = ?auto_11576 ?auto_11578 ) ) ( not ( = ?auto_11576 ?auto_11580 ) ) ( not ( = ?auto_11576 ?auto_11581 ) ) ( not ( = ?auto_11576 ?auto_11582 ) ) ( not ( = ?auto_11576 ?auto_11579 ) ) ( not ( = ?auto_11578 ?auto_11580 ) ) ( not ( = ?auto_11578 ?auto_11581 ) ) ( not ( = ?auto_11578 ?auto_11582 ) ) ( not ( = ?auto_11578 ?auto_11579 ) ) ( not ( = ?auto_11580 ?auto_11581 ) ) ( not ( = ?auto_11580 ?auto_11582 ) ) ( not ( = ?auto_11580 ?auto_11579 ) ) ( not ( = ?auto_11581 ?auto_11582 ) ) ( not ( = ?auto_11581 ?auto_11579 ) ) ( not ( = ?auto_11582 ?auto_11579 ) ) ( IN-CITY ?auto_11584 ?auto_11585 ) ( not ( = ?auto_11577 ?auto_11584 ) ) ( not ( = ?auto_11586 ?auto_11584 ) ) ( OBJ-AT ?auto_11582 ?auto_11584 ) ( TRUCK-AT ?auto_11583 ?auto_11577 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11583 ?auto_11577 ?auto_11584 ?auto_11585 )
      ( DELIVER-6PKG ?auto_11576 ?auto_11578 ?auto_11580 ?auto_11581 ?auto_11582 ?auto_11579 ?auto_11577 )
      ( DELIVER-6PKG-VERIFY ?auto_11576 ?auto_11578 ?auto_11580 ?auto_11581 ?auto_11582 ?auto_11579 ?auto_11577 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11594 - OBJ
      ?auto_11596 - OBJ
      ?auto_11598 - OBJ
      ?auto_11599 - OBJ
      ?auto_11600 - OBJ
      ?auto_11597 - OBJ
      ?auto_11595 - LOCATION
    )
    :vars
    (
      ?auto_11601 - LOCATION
      ?auto_11604 - CITY
      ?auto_11602 - LOCATION
      ?auto_11603 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11596 ?auto_11594 ) ( GREATER-THAN ?auto_11598 ?auto_11594 ) ( GREATER-THAN ?auto_11598 ?auto_11596 ) ( GREATER-THAN ?auto_11599 ?auto_11594 ) ( GREATER-THAN ?auto_11599 ?auto_11596 ) ( GREATER-THAN ?auto_11599 ?auto_11598 ) ( GREATER-THAN ?auto_11600 ?auto_11594 ) ( GREATER-THAN ?auto_11600 ?auto_11596 ) ( GREATER-THAN ?auto_11600 ?auto_11598 ) ( GREATER-THAN ?auto_11600 ?auto_11599 ) ( GREATER-THAN ?auto_11597 ?auto_11594 ) ( GREATER-THAN ?auto_11597 ?auto_11596 ) ( GREATER-THAN ?auto_11597 ?auto_11598 ) ( GREATER-THAN ?auto_11597 ?auto_11599 ) ( GREATER-THAN ?auto_11597 ?auto_11600 ) ( IN-CITY ?auto_11601 ?auto_11604 ) ( IN-CITY ?auto_11595 ?auto_11604 ) ( not ( = ?auto_11595 ?auto_11601 ) ) ( OBJ-AT ?auto_11597 ?auto_11601 ) ( OBJ-AT ?auto_11594 ?auto_11595 ) ( OBJ-AT ?auto_11596 ?auto_11595 ) ( OBJ-AT ?auto_11598 ?auto_11595 ) ( not ( = ?auto_11594 ?auto_11596 ) ) ( not ( = ?auto_11594 ?auto_11598 ) ) ( not ( = ?auto_11594 ?auto_11599 ) ) ( not ( = ?auto_11594 ?auto_11600 ) ) ( not ( = ?auto_11594 ?auto_11597 ) ) ( not ( = ?auto_11596 ?auto_11598 ) ) ( not ( = ?auto_11596 ?auto_11599 ) ) ( not ( = ?auto_11596 ?auto_11600 ) ) ( not ( = ?auto_11596 ?auto_11597 ) ) ( not ( = ?auto_11598 ?auto_11599 ) ) ( not ( = ?auto_11598 ?auto_11600 ) ) ( not ( = ?auto_11598 ?auto_11597 ) ) ( not ( = ?auto_11599 ?auto_11600 ) ) ( not ( = ?auto_11599 ?auto_11597 ) ) ( not ( = ?auto_11600 ?auto_11597 ) ) ( IN-CITY ?auto_11602 ?auto_11604 ) ( not ( = ?auto_11595 ?auto_11602 ) ) ( not ( = ?auto_11601 ?auto_11602 ) ) ( OBJ-AT ?auto_11600 ?auto_11602 ) ( TRUCK-AT ?auto_11603 ?auto_11595 ) ( IN-TRUCK ?auto_11599 ?auto_11603 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11599 ?auto_11595 )
      ( DELIVER-6PKG ?auto_11594 ?auto_11596 ?auto_11598 ?auto_11599 ?auto_11600 ?auto_11597 ?auto_11595 )
      ( DELIVER-6PKG-VERIFY ?auto_11594 ?auto_11596 ?auto_11598 ?auto_11599 ?auto_11600 ?auto_11597 ?auto_11595 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11612 - OBJ
      ?auto_11614 - OBJ
      ?auto_11616 - OBJ
      ?auto_11617 - OBJ
      ?auto_11618 - OBJ
      ?auto_11615 - OBJ
      ?auto_11613 - LOCATION
    )
    :vars
    (
      ?auto_11619 - LOCATION
      ?auto_11622 - CITY
      ?auto_11621 - LOCATION
      ?auto_11620 - TRUCK
      ?auto_11623 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11614 ?auto_11612 ) ( GREATER-THAN ?auto_11616 ?auto_11612 ) ( GREATER-THAN ?auto_11616 ?auto_11614 ) ( GREATER-THAN ?auto_11617 ?auto_11612 ) ( GREATER-THAN ?auto_11617 ?auto_11614 ) ( GREATER-THAN ?auto_11617 ?auto_11616 ) ( GREATER-THAN ?auto_11618 ?auto_11612 ) ( GREATER-THAN ?auto_11618 ?auto_11614 ) ( GREATER-THAN ?auto_11618 ?auto_11616 ) ( GREATER-THAN ?auto_11618 ?auto_11617 ) ( GREATER-THAN ?auto_11615 ?auto_11612 ) ( GREATER-THAN ?auto_11615 ?auto_11614 ) ( GREATER-THAN ?auto_11615 ?auto_11616 ) ( GREATER-THAN ?auto_11615 ?auto_11617 ) ( GREATER-THAN ?auto_11615 ?auto_11618 ) ( IN-CITY ?auto_11619 ?auto_11622 ) ( IN-CITY ?auto_11613 ?auto_11622 ) ( not ( = ?auto_11613 ?auto_11619 ) ) ( OBJ-AT ?auto_11615 ?auto_11619 ) ( OBJ-AT ?auto_11612 ?auto_11613 ) ( OBJ-AT ?auto_11614 ?auto_11613 ) ( OBJ-AT ?auto_11616 ?auto_11613 ) ( not ( = ?auto_11612 ?auto_11614 ) ) ( not ( = ?auto_11612 ?auto_11616 ) ) ( not ( = ?auto_11612 ?auto_11617 ) ) ( not ( = ?auto_11612 ?auto_11618 ) ) ( not ( = ?auto_11612 ?auto_11615 ) ) ( not ( = ?auto_11614 ?auto_11616 ) ) ( not ( = ?auto_11614 ?auto_11617 ) ) ( not ( = ?auto_11614 ?auto_11618 ) ) ( not ( = ?auto_11614 ?auto_11615 ) ) ( not ( = ?auto_11616 ?auto_11617 ) ) ( not ( = ?auto_11616 ?auto_11618 ) ) ( not ( = ?auto_11616 ?auto_11615 ) ) ( not ( = ?auto_11617 ?auto_11618 ) ) ( not ( = ?auto_11617 ?auto_11615 ) ) ( not ( = ?auto_11618 ?auto_11615 ) ) ( IN-CITY ?auto_11621 ?auto_11622 ) ( not ( = ?auto_11613 ?auto_11621 ) ) ( not ( = ?auto_11619 ?auto_11621 ) ) ( OBJ-AT ?auto_11618 ?auto_11621 ) ( IN-TRUCK ?auto_11617 ?auto_11620 ) ( TRUCK-AT ?auto_11620 ?auto_11623 ) ( IN-CITY ?auto_11623 ?auto_11622 ) ( not ( = ?auto_11613 ?auto_11623 ) ) ( not ( = ?auto_11619 ?auto_11623 ) ) ( not ( = ?auto_11621 ?auto_11623 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11620 ?auto_11623 ?auto_11613 ?auto_11622 )
      ( DELIVER-6PKG ?auto_11612 ?auto_11614 ?auto_11616 ?auto_11617 ?auto_11618 ?auto_11615 ?auto_11613 )
      ( DELIVER-6PKG-VERIFY ?auto_11612 ?auto_11614 ?auto_11616 ?auto_11617 ?auto_11618 ?auto_11615 ?auto_11613 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11631 - OBJ
      ?auto_11633 - OBJ
      ?auto_11635 - OBJ
      ?auto_11636 - OBJ
      ?auto_11637 - OBJ
      ?auto_11634 - OBJ
      ?auto_11632 - LOCATION
    )
    :vars
    (
      ?auto_11638 - LOCATION
      ?auto_11641 - CITY
      ?auto_11639 - LOCATION
      ?auto_11640 - TRUCK
      ?auto_11642 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11633 ?auto_11631 ) ( GREATER-THAN ?auto_11635 ?auto_11631 ) ( GREATER-THAN ?auto_11635 ?auto_11633 ) ( GREATER-THAN ?auto_11636 ?auto_11631 ) ( GREATER-THAN ?auto_11636 ?auto_11633 ) ( GREATER-THAN ?auto_11636 ?auto_11635 ) ( GREATER-THAN ?auto_11637 ?auto_11631 ) ( GREATER-THAN ?auto_11637 ?auto_11633 ) ( GREATER-THAN ?auto_11637 ?auto_11635 ) ( GREATER-THAN ?auto_11637 ?auto_11636 ) ( GREATER-THAN ?auto_11634 ?auto_11631 ) ( GREATER-THAN ?auto_11634 ?auto_11633 ) ( GREATER-THAN ?auto_11634 ?auto_11635 ) ( GREATER-THAN ?auto_11634 ?auto_11636 ) ( GREATER-THAN ?auto_11634 ?auto_11637 ) ( IN-CITY ?auto_11638 ?auto_11641 ) ( IN-CITY ?auto_11632 ?auto_11641 ) ( not ( = ?auto_11632 ?auto_11638 ) ) ( OBJ-AT ?auto_11634 ?auto_11638 ) ( OBJ-AT ?auto_11631 ?auto_11632 ) ( OBJ-AT ?auto_11633 ?auto_11632 ) ( OBJ-AT ?auto_11635 ?auto_11632 ) ( not ( = ?auto_11631 ?auto_11633 ) ) ( not ( = ?auto_11631 ?auto_11635 ) ) ( not ( = ?auto_11631 ?auto_11636 ) ) ( not ( = ?auto_11631 ?auto_11637 ) ) ( not ( = ?auto_11631 ?auto_11634 ) ) ( not ( = ?auto_11633 ?auto_11635 ) ) ( not ( = ?auto_11633 ?auto_11636 ) ) ( not ( = ?auto_11633 ?auto_11637 ) ) ( not ( = ?auto_11633 ?auto_11634 ) ) ( not ( = ?auto_11635 ?auto_11636 ) ) ( not ( = ?auto_11635 ?auto_11637 ) ) ( not ( = ?auto_11635 ?auto_11634 ) ) ( not ( = ?auto_11636 ?auto_11637 ) ) ( not ( = ?auto_11636 ?auto_11634 ) ) ( not ( = ?auto_11637 ?auto_11634 ) ) ( IN-CITY ?auto_11639 ?auto_11641 ) ( not ( = ?auto_11632 ?auto_11639 ) ) ( not ( = ?auto_11638 ?auto_11639 ) ) ( OBJ-AT ?auto_11637 ?auto_11639 ) ( TRUCK-AT ?auto_11640 ?auto_11642 ) ( IN-CITY ?auto_11642 ?auto_11641 ) ( not ( = ?auto_11632 ?auto_11642 ) ) ( not ( = ?auto_11638 ?auto_11642 ) ) ( not ( = ?auto_11639 ?auto_11642 ) ) ( OBJ-AT ?auto_11636 ?auto_11642 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11636 ?auto_11640 ?auto_11642 )
      ( DELIVER-6PKG ?auto_11631 ?auto_11633 ?auto_11635 ?auto_11636 ?auto_11637 ?auto_11634 ?auto_11632 )
      ( DELIVER-6PKG-VERIFY ?auto_11631 ?auto_11633 ?auto_11635 ?auto_11636 ?auto_11637 ?auto_11634 ?auto_11632 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11650 - OBJ
      ?auto_11652 - OBJ
      ?auto_11654 - OBJ
      ?auto_11655 - OBJ
      ?auto_11656 - OBJ
      ?auto_11653 - OBJ
      ?auto_11651 - LOCATION
    )
    :vars
    (
      ?auto_11657 - LOCATION
      ?auto_11658 - CITY
      ?auto_11659 - LOCATION
      ?auto_11660 - LOCATION
      ?auto_11661 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11652 ?auto_11650 ) ( GREATER-THAN ?auto_11654 ?auto_11650 ) ( GREATER-THAN ?auto_11654 ?auto_11652 ) ( GREATER-THAN ?auto_11655 ?auto_11650 ) ( GREATER-THAN ?auto_11655 ?auto_11652 ) ( GREATER-THAN ?auto_11655 ?auto_11654 ) ( GREATER-THAN ?auto_11656 ?auto_11650 ) ( GREATER-THAN ?auto_11656 ?auto_11652 ) ( GREATER-THAN ?auto_11656 ?auto_11654 ) ( GREATER-THAN ?auto_11656 ?auto_11655 ) ( GREATER-THAN ?auto_11653 ?auto_11650 ) ( GREATER-THAN ?auto_11653 ?auto_11652 ) ( GREATER-THAN ?auto_11653 ?auto_11654 ) ( GREATER-THAN ?auto_11653 ?auto_11655 ) ( GREATER-THAN ?auto_11653 ?auto_11656 ) ( IN-CITY ?auto_11657 ?auto_11658 ) ( IN-CITY ?auto_11651 ?auto_11658 ) ( not ( = ?auto_11651 ?auto_11657 ) ) ( OBJ-AT ?auto_11653 ?auto_11657 ) ( OBJ-AT ?auto_11650 ?auto_11651 ) ( OBJ-AT ?auto_11652 ?auto_11651 ) ( OBJ-AT ?auto_11654 ?auto_11651 ) ( not ( = ?auto_11650 ?auto_11652 ) ) ( not ( = ?auto_11650 ?auto_11654 ) ) ( not ( = ?auto_11650 ?auto_11655 ) ) ( not ( = ?auto_11650 ?auto_11656 ) ) ( not ( = ?auto_11650 ?auto_11653 ) ) ( not ( = ?auto_11652 ?auto_11654 ) ) ( not ( = ?auto_11652 ?auto_11655 ) ) ( not ( = ?auto_11652 ?auto_11656 ) ) ( not ( = ?auto_11652 ?auto_11653 ) ) ( not ( = ?auto_11654 ?auto_11655 ) ) ( not ( = ?auto_11654 ?auto_11656 ) ) ( not ( = ?auto_11654 ?auto_11653 ) ) ( not ( = ?auto_11655 ?auto_11656 ) ) ( not ( = ?auto_11655 ?auto_11653 ) ) ( not ( = ?auto_11656 ?auto_11653 ) ) ( IN-CITY ?auto_11659 ?auto_11658 ) ( not ( = ?auto_11651 ?auto_11659 ) ) ( not ( = ?auto_11657 ?auto_11659 ) ) ( OBJ-AT ?auto_11656 ?auto_11659 ) ( IN-CITY ?auto_11660 ?auto_11658 ) ( not ( = ?auto_11651 ?auto_11660 ) ) ( not ( = ?auto_11657 ?auto_11660 ) ) ( not ( = ?auto_11659 ?auto_11660 ) ) ( OBJ-AT ?auto_11655 ?auto_11660 ) ( TRUCK-AT ?auto_11661 ?auto_11651 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11661 ?auto_11651 ?auto_11660 ?auto_11658 )
      ( DELIVER-6PKG ?auto_11650 ?auto_11652 ?auto_11654 ?auto_11655 ?auto_11656 ?auto_11653 ?auto_11651 )
      ( DELIVER-6PKG-VERIFY ?auto_11650 ?auto_11652 ?auto_11654 ?auto_11655 ?auto_11656 ?auto_11653 ?auto_11651 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11669 - OBJ
      ?auto_11671 - OBJ
      ?auto_11673 - OBJ
      ?auto_11674 - OBJ
      ?auto_11675 - OBJ
      ?auto_11672 - OBJ
      ?auto_11670 - LOCATION
    )
    :vars
    (
      ?auto_11677 - LOCATION
      ?auto_11678 - CITY
      ?auto_11676 - LOCATION
      ?auto_11679 - LOCATION
      ?auto_11680 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11671 ?auto_11669 ) ( GREATER-THAN ?auto_11673 ?auto_11669 ) ( GREATER-THAN ?auto_11673 ?auto_11671 ) ( GREATER-THAN ?auto_11674 ?auto_11669 ) ( GREATER-THAN ?auto_11674 ?auto_11671 ) ( GREATER-THAN ?auto_11674 ?auto_11673 ) ( GREATER-THAN ?auto_11675 ?auto_11669 ) ( GREATER-THAN ?auto_11675 ?auto_11671 ) ( GREATER-THAN ?auto_11675 ?auto_11673 ) ( GREATER-THAN ?auto_11675 ?auto_11674 ) ( GREATER-THAN ?auto_11672 ?auto_11669 ) ( GREATER-THAN ?auto_11672 ?auto_11671 ) ( GREATER-THAN ?auto_11672 ?auto_11673 ) ( GREATER-THAN ?auto_11672 ?auto_11674 ) ( GREATER-THAN ?auto_11672 ?auto_11675 ) ( IN-CITY ?auto_11677 ?auto_11678 ) ( IN-CITY ?auto_11670 ?auto_11678 ) ( not ( = ?auto_11670 ?auto_11677 ) ) ( OBJ-AT ?auto_11672 ?auto_11677 ) ( OBJ-AT ?auto_11669 ?auto_11670 ) ( OBJ-AT ?auto_11671 ?auto_11670 ) ( not ( = ?auto_11669 ?auto_11671 ) ) ( not ( = ?auto_11669 ?auto_11673 ) ) ( not ( = ?auto_11669 ?auto_11674 ) ) ( not ( = ?auto_11669 ?auto_11675 ) ) ( not ( = ?auto_11669 ?auto_11672 ) ) ( not ( = ?auto_11671 ?auto_11673 ) ) ( not ( = ?auto_11671 ?auto_11674 ) ) ( not ( = ?auto_11671 ?auto_11675 ) ) ( not ( = ?auto_11671 ?auto_11672 ) ) ( not ( = ?auto_11673 ?auto_11674 ) ) ( not ( = ?auto_11673 ?auto_11675 ) ) ( not ( = ?auto_11673 ?auto_11672 ) ) ( not ( = ?auto_11674 ?auto_11675 ) ) ( not ( = ?auto_11674 ?auto_11672 ) ) ( not ( = ?auto_11675 ?auto_11672 ) ) ( IN-CITY ?auto_11676 ?auto_11678 ) ( not ( = ?auto_11670 ?auto_11676 ) ) ( not ( = ?auto_11677 ?auto_11676 ) ) ( OBJ-AT ?auto_11675 ?auto_11676 ) ( IN-CITY ?auto_11679 ?auto_11678 ) ( not ( = ?auto_11670 ?auto_11679 ) ) ( not ( = ?auto_11677 ?auto_11679 ) ) ( not ( = ?auto_11676 ?auto_11679 ) ) ( OBJ-AT ?auto_11674 ?auto_11679 ) ( TRUCK-AT ?auto_11680 ?auto_11670 ) ( IN-TRUCK ?auto_11673 ?auto_11680 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11673 ?auto_11670 )
      ( DELIVER-6PKG ?auto_11669 ?auto_11671 ?auto_11673 ?auto_11674 ?auto_11675 ?auto_11672 ?auto_11670 )
      ( DELIVER-6PKG-VERIFY ?auto_11669 ?auto_11671 ?auto_11673 ?auto_11674 ?auto_11675 ?auto_11672 ?auto_11670 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11688 - OBJ
      ?auto_11690 - OBJ
      ?auto_11692 - OBJ
      ?auto_11693 - OBJ
      ?auto_11694 - OBJ
      ?auto_11691 - OBJ
      ?auto_11689 - LOCATION
    )
    :vars
    (
      ?auto_11697 - LOCATION
      ?auto_11699 - CITY
      ?auto_11696 - LOCATION
      ?auto_11698 - LOCATION
      ?auto_11695 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11690 ?auto_11688 ) ( GREATER-THAN ?auto_11692 ?auto_11688 ) ( GREATER-THAN ?auto_11692 ?auto_11690 ) ( GREATER-THAN ?auto_11693 ?auto_11688 ) ( GREATER-THAN ?auto_11693 ?auto_11690 ) ( GREATER-THAN ?auto_11693 ?auto_11692 ) ( GREATER-THAN ?auto_11694 ?auto_11688 ) ( GREATER-THAN ?auto_11694 ?auto_11690 ) ( GREATER-THAN ?auto_11694 ?auto_11692 ) ( GREATER-THAN ?auto_11694 ?auto_11693 ) ( GREATER-THAN ?auto_11691 ?auto_11688 ) ( GREATER-THAN ?auto_11691 ?auto_11690 ) ( GREATER-THAN ?auto_11691 ?auto_11692 ) ( GREATER-THAN ?auto_11691 ?auto_11693 ) ( GREATER-THAN ?auto_11691 ?auto_11694 ) ( IN-CITY ?auto_11697 ?auto_11699 ) ( IN-CITY ?auto_11689 ?auto_11699 ) ( not ( = ?auto_11689 ?auto_11697 ) ) ( OBJ-AT ?auto_11691 ?auto_11697 ) ( OBJ-AT ?auto_11688 ?auto_11689 ) ( OBJ-AT ?auto_11690 ?auto_11689 ) ( not ( = ?auto_11688 ?auto_11690 ) ) ( not ( = ?auto_11688 ?auto_11692 ) ) ( not ( = ?auto_11688 ?auto_11693 ) ) ( not ( = ?auto_11688 ?auto_11694 ) ) ( not ( = ?auto_11688 ?auto_11691 ) ) ( not ( = ?auto_11690 ?auto_11692 ) ) ( not ( = ?auto_11690 ?auto_11693 ) ) ( not ( = ?auto_11690 ?auto_11694 ) ) ( not ( = ?auto_11690 ?auto_11691 ) ) ( not ( = ?auto_11692 ?auto_11693 ) ) ( not ( = ?auto_11692 ?auto_11694 ) ) ( not ( = ?auto_11692 ?auto_11691 ) ) ( not ( = ?auto_11693 ?auto_11694 ) ) ( not ( = ?auto_11693 ?auto_11691 ) ) ( not ( = ?auto_11694 ?auto_11691 ) ) ( IN-CITY ?auto_11696 ?auto_11699 ) ( not ( = ?auto_11689 ?auto_11696 ) ) ( not ( = ?auto_11697 ?auto_11696 ) ) ( OBJ-AT ?auto_11694 ?auto_11696 ) ( IN-CITY ?auto_11698 ?auto_11699 ) ( not ( = ?auto_11689 ?auto_11698 ) ) ( not ( = ?auto_11697 ?auto_11698 ) ) ( not ( = ?auto_11696 ?auto_11698 ) ) ( OBJ-AT ?auto_11693 ?auto_11698 ) ( IN-TRUCK ?auto_11692 ?auto_11695 ) ( TRUCK-AT ?auto_11695 ?auto_11697 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11695 ?auto_11697 ?auto_11689 ?auto_11699 )
      ( DELIVER-6PKG ?auto_11688 ?auto_11690 ?auto_11692 ?auto_11693 ?auto_11694 ?auto_11691 ?auto_11689 )
      ( DELIVER-6PKG-VERIFY ?auto_11688 ?auto_11690 ?auto_11692 ?auto_11693 ?auto_11694 ?auto_11691 ?auto_11689 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11707 - OBJ
      ?auto_11709 - OBJ
      ?auto_11711 - OBJ
      ?auto_11712 - OBJ
      ?auto_11713 - OBJ
      ?auto_11710 - OBJ
      ?auto_11708 - LOCATION
    )
    :vars
    (
      ?auto_11718 - LOCATION
      ?auto_11715 - CITY
      ?auto_11714 - LOCATION
      ?auto_11717 - LOCATION
      ?auto_11716 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11709 ?auto_11707 ) ( GREATER-THAN ?auto_11711 ?auto_11707 ) ( GREATER-THAN ?auto_11711 ?auto_11709 ) ( GREATER-THAN ?auto_11712 ?auto_11707 ) ( GREATER-THAN ?auto_11712 ?auto_11709 ) ( GREATER-THAN ?auto_11712 ?auto_11711 ) ( GREATER-THAN ?auto_11713 ?auto_11707 ) ( GREATER-THAN ?auto_11713 ?auto_11709 ) ( GREATER-THAN ?auto_11713 ?auto_11711 ) ( GREATER-THAN ?auto_11713 ?auto_11712 ) ( GREATER-THAN ?auto_11710 ?auto_11707 ) ( GREATER-THAN ?auto_11710 ?auto_11709 ) ( GREATER-THAN ?auto_11710 ?auto_11711 ) ( GREATER-THAN ?auto_11710 ?auto_11712 ) ( GREATER-THAN ?auto_11710 ?auto_11713 ) ( IN-CITY ?auto_11718 ?auto_11715 ) ( IN-CITY ?auto_11708 ?auto_11715 ) ( not ( = ?auto_11708 ?auto_11718 ) ) ( OBJ-AT ?auto_11710 ?auto_11718 ) ( OBJ-AT ?auto_11707 ?auto_11708 ) ( OBJ-AT ?auto_11709 ?auto_11708 ) ( not ( = ?auto_11707 ?auto_11709 ) ) ( not ( = ?auto_11707 ?auto_11711 ) ) ( not ( = ?auto_11707 ?auto_11712 ) ) ( not ( = ?auto_11707 ?auto_11713 ) ) ( not ( = ?auto_11707 ?auto_11710 ) ) ( not ( = ?auto_11709 ?auto_11711 ) ) ( not ( = ?auto_11709 ?auto_11712 ) ) ( not ( = ?auto_11709 ?auto_11713 ) ) ( not ( = ?auto_11709 ?auto_11710 ) ) ( not ( = ?auto_11711 ?auto_11712 ) ) ( not ( = ?auto_11711 ?auto_11713 ) ) ( not ( = ?auto_11711 ?auto_11710 ) ) ( not ( = ?auto_11712 ?auto_11713 ) ) ( not ( = ?auto_11712 ?auto_11710 ) ) ( not ( = ?auto_11713 ?auto_11710 ) ) ( IN-CITY ?auto_11714 ?auto_11715 ) ( not ( = ?auto_11708 ?auto_11714 ) ) ( not ( = ?auto_11718 ?auto_11714 ) ) ( OBJ-AT ?auto_11713 ?auto_11714 ) ( IN-CITY ?auto_11717 ?auto_11715 ) ( not ( = ?auto_11708 ?auto_11717 ) ) ( not ( = ?auto_11718 ?auto_11717 ) ) ( not ( = ?auto_11714 ?auto_11717 ) ) ( OBJ-AT ?auto_11712 ?auto_11717 ) ( TRUCK-AT ?auto_11716 ?auto_11718 ) ( OBJ-AT ?auto_11711 ?auto_11718 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11711 ?auto_11716 ?auto_11718 )
      ( DELIVER-6PKG ?auto_11707 ?auto_11709 ?auto_11711 ?auto_11712 ?auto_11713 ?auto_11710 ?auto_11708 )
      ( DELIVER-6PKG-VERIFY ?auto_11707 ?auto_11709 ?auto_11711 ?auto_11712 ?auto_11713 ?auto_11710 ?auto_11708 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11726 - OBJ
      ?auto_11728 - OBJ
      ?auto_11730 - OBJ
      ?auto_11731 - OBJ
      ?auto_11732 - OBJ
      ?auto_11729 - OBJ
      ?auto_11727 - LOCATION
    )
    :vars
    (
      ?auto_11734 - LOCATION
      ?auto_11735 - CITY
      ?auto_11733 - LOCATION
      ?auto_11737 - LOCATION
      ?auto_11736 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11728 ?auto_11726 ) ( GREATER-THAN ?auto_11730 ?auto_11726 ) ( GREATER-THAN ?auto_11730 ?auto_11728 ) ( GREATER-THAN ?auto_11731 ?auto_11726 ) ( GREATER-THAN ?auto_11731 ?auto_11728 ) ( GREATER-THAN ?auto_11731 ?auto_11730 ) ( GREATER-THAN ?auto_11732 ?auto_11726 ) ( GREATER-THAN ?auto_11732 ?auto_11728 ) ( GREATER-THAN ?auto_11732 ?auto_11730 ) ( GREATER-THAN ?auto_11732 ?auto_11731 ) ( GREATER-THAN ?auto_11729 ?auto_11726 ) ( GREATER-THAN ?auto_11729 ?auto_11728 ) ( GREATER-THAN ?auto_11729 ?auto_11730 ) ( GREATER-THAN ?auto_11729 ?auto_11731 ) ( GREATER-THAN ?auto_11729 ?auto_11732 ) ( IN-CITY ?auto_11734 ?auto_11735 ) ( IN-CITY ?auto_11727 ?auto_11735 ) ( not ( = ?auto_11727 ?auto_11734 ) ) ( OBJ-AT ?auto_11729 ?auto_11734 ) ( OBJ-AT ?auto_11726 ?auto_11727 ) ( OBJ-AT ?auto_11728 ?auto_11727 ) ( not ( = ?auto_11726 ?auto_11728 ) ) ( not ( = ?auto_11726 ?auto_11730 ) ) ( not ( = ?auto_11726 ?auto_11731 ) ) ( not ( = ?auto_11726 ?auto_11732 ) ) ( not ( = ?auto_11726 ?auto_11729 ) ) ( not ( = ?auto_11728 ?auto_11730 ) ) ( not ( = ?auto_11728 ?auto_11731 ) ) ( not ( = ?auto_11728 ?auto_11732 ) ) ( not ( = ?auto_11728 ?auto_11729 ) ) ( not ( = ?auto_11730 ?auto_11731 ) ) ( not ( = ?auto_11730 ?auto_11732 ) ) ( not ( = ?auto_11730 ?auto_11729 ) ) ( not ( = ?auto_11731 ?auto_11732 ) ) ( not ( = ?auto_11731 ?auto_11729 ) ) ( not ( = ?auto_11732 ?auto_11729 ) ) ( IN-CITY ?auto_11733 ?auto_11735 ) ( not ( = ?auto_11727 ?auto_11733 ) ) ( not ( = ?auto_11734 ?auto_11733 ) ) ( OBJ-AT ?auto_11732 ?auto_11733 ) ( IN-CITY ?auto_11737 ?auto_11735 ) ( not ( = ?auto_11727 ?auto_11737 ) ) ( not ( = ?auto_11734 ?auto_11737 ) ) ( not ( = ?auto_11733 ?auto_11737 ) ) ( OBJ-AT ?auto_11731 ?auto_11737 ) ( OBJ-AT ?auto_11730 ?auto_11734 ) ( TRUCK-AT ?auto_11736 ?auto_11727 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11736 ?auto_11727 ?auto_11734 ?auto_11735 )
      ( DELIVER-6PKG ?auto_11726 ?auto_11728 ?auto_11730 ?auto_11731 ?auto_11732 ?auto_11729 ?auto_11727 )
      ( DELIVER-6PKG-VERIFY ?auto_11726 ?auto_11728 ?auto_11730 ?auto_11731 ?auto_11732 ?auto_11729 ?auto_11727 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11745 - OBJ
      ?auto_11747 - OBJ
      ?auto_11749 - OBJ
      ?auto_11750 - OBJ
      ?auto_11751 - OBJ
      ?auto_11748 - OBJ
      ?auto_11746 - LOCATION
    )
    :vars
    (
      ?auto_11752 - LOCATION
      ?auto_11754 - CITY
      ?auto_11755 - LOCATION
      ?auto_11753 - LOCATION
      ?auto_11756 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11747 ?auto_11745 ) ( GREATER-THAN ?auto_11749 ?auto_11745 ) ( GREATER-THAN ?auto_11749 ?auto_11747 ) ( GREATER-THAN ?auto_11750 ?auto_11745 ) ( GREATER-THAN ?auto_11750 ?auto_11747 ) ( GREATER-THAN ?auto_11750 ?auto_11749 ) ( GREATER-THAN ?auto_11751 ?auto_11745 ) ( GREATER-THAN ?auto_11751 ?auto_11747 ) ( GREATER-THAN ?auto_11751 ?auto_11749 ) ( GREATER-THAN ?auto_11751 ?auto_11750 ) ( GREATER-THAN ?auto_11748 ?auto_11745 ) ( GREATER-THAN ?auto_11748 ?auto_11747 ) ( GREATER-THAN ?auto_11748 ?auto_11749 ) ( GREATER-THAN ?auto_11748 ?auto_11750 ) ( GREATER-THAN ?auto_11748 ?auto_11751 ) ( IN-CITY ?auto_11752 ?auto_11754 ) ( IN-CITY ?auto_11746 ?auto_11754 ) ( not ( = ?auto_11746 ?auto_11752 ) ) ( OBJ-AT ?auto_11748 ?auto_11752 ) ( OBJ-AT ?auto_11745 ?auto_11746 ) ( not ( = ?auto_11745 ?auto_11747 ) ) ( not ( = ?auto_11745 ?auto_11749 ) ) ( not ( = ?auto_11745 ?auto_11750 ) ) ( not ( = ?auto_11745 ?auto_11751 ) ) ( not ( = ?auto_11745 ?auto_11748 ) ) ( not ( = ?auto_11747 ?auto_11749 ) ) ( not ( = ?auto_11747 ?auto_11750 ) ) ( not ( = ?auto_11747 ?auto_11751 ) ) ( not ( = ?auto_11747 ?auto_11748 ) ) ( not ( = ?auto_11749 ?auto_11750 ) ) ( not ( = ?auto_11749 ?auto_11751 ) ) ( not ( = ?auto_11749 ?auto_11748 ) ) ( not ( = ?auto_11750 ?auto_11751 ) ) ( not ( = ?auto_11750 ?auto_11748 ) ) ( not ( = ?auto_11751 ?auto_11748 ) ) ( IN-CITY ?auto_11755 ?auto_11754 ) ( not ( = ?auto_11746 ?auto_11755 ) ) ( not ( = ?auto_11752 ?auto_11755 ) ) ( OBJ-AT ?auto_11751 ?auto_11755 ) ( IN-CITY ?auto_11753 ?auto_11754 ) ( not ( = ?auto_11746 ?auto_11753 ) ) ( not ( = ?auto_11752 ?auto_11753 ) ) ( not ( = ?auto_11755 ?auto_11753 ) ) ( OBJ-AT ?auto_11750 ?auto_11753 ) ( OBJ-AT ?auto_11749 ?auto_11752 ) ( TRUCK-AT ?auto_11756 ?auto_11746 ) ( IN-TRUCK ?auto_11747 ?auto_11756 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11747 ?auto_11746 )
      ( DELIVER-6PKG ?auto_11745 ?auto_11747 ?auto_11749 ?auto_11750 ?auto_11751 ?auto_11748 ?auto_11746 )
      ( DELIVER-6PKG-VERIFY ?auto_11745 ?auto_11747 ?auto_11749 ?auto_11750 ?auto_11751 ?auto_11748 ?auto_11746 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11764 - OBJ
      ?auto_11766 - OBJ
      ?auto_11768 - OBJ
      ?auto_11769 - OBJ
      ?auto_11770 - OBJ
      ?auto_11767 - OBJ
      ?auto_11765 - LOCATION
    )
    :vars
    (
      ?auto_11772 - LOCATION
      ?auto_11773 - CITY
      ?auto_11775 - LOCATION
      ?auto_11771 - LOCATION
      ?auto_11774 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11766 ?auto_11764 ) ( GREATER-THAN ?auto_11768 ?auto_11764 ) ( GREATER-THAN ?auto_11768 ?auto_11766 ) ( GREATER-THAN ?auto_11769 ?auto_11764 ) ( GREATER-THAN ?auto_11769 ?auto_11766 ) ( GREATER-THAN ?auto_11769 ?auto_11768 ) ( GREATER-THAN ?auto_11770 ?auto_11764 ) ( GREATER-THAN ?auto_11770 ?auto_11766 ) ( GREATER-THAN ?auto_11770 ?auto_11768 ) ( GREATER-THAN ?auto_11770 ?auto_11769 ) ( GREATER-THAN ?auto_11767 ?auto_11764 ) ( GREATER-THAN ?auto_11767 ?auto_11766 ) ( GREATER-THAN ?auto_11767 ?auto_11768 ) ( GREATER-THAN ?auto_11767 ?auto_11769 ) ( GREATER-THAN ?auto_11767 ?auto_11770 ) ( IN-CITY ?auto_11772 ?auto_11773 ) ( IN-CITY ?auto_11765 ?auto_11773 ) ( not ( = ?auto_11765 ?auto_11772 ) ) ( OBJ-AT ?auto_11767 ?auto_11772 ) ( OBJ-AT ?auto_11764 ?auto_11765 ) ( not ( = ?auto_11764 ?auto_11766 ) ) ( not ( = ?auto_11764 ?auto_11768 ) ) ( not ( = ?auto_11764 ?auto_11769 ) ) ( not ( = ?auto_11764 ?auto_11770 ) ) ( not ( = ?auto_11764 ?auto_11767 ) ) ( not ( = ?auto_11766 ?auto_11768 ) ) ( not ( = ?auto_11766 ?auto_11769 ) ) ( not ( = ?auto_11766 ?auto_11770 ) ) ( not ( = ?auto_11766 ?auto_11767 ) ) ( not ( = ?auto_11768 ?auto_11769 ) ) ( not ( = ?auto_11768 ?auto_11770 ) ) ( not ( = ?auto_11768 ?auto_11767 ) ) ( not ( = ?auto_11769 ?auto_11770 ) ) ( not ( = ?auto_11769 ?auto_11767 ) ) ( not ( = ?auto_11770 ?auto_11767 ) ) ( IN-CITY ?auto_11775 ?auto_11773 ) ( not ( = ?auto_11765 ?auto_11775 ) ) ( not ( = ?auto_11772 ?auto_11775 ) ) ( OBJ-AT ?auto_11770 ?auto_11775 ) ( IN-CITY ?auto_11771 ?auto_11773 ) ( not ( = ?auto_11765 ?auto_11771 ) ) ( not ( = ?auto_11772 ?auto_11771 ) ) ( not ( = ?auto_11775 ?auto_11771 ) ) ( OBJ-AT ?auto_11769 ?auto_11771 ) ( OBJ-AT ?auto_11768 ?auto_11772 ) ( IN-TRUCK ?auto_11766 ?auto_11774 ) ( TRUCK-AT ?auto_11774 ?auto_11772 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11774 ?auto_11772 ?auto_11765 ?auto_11773 )
      ( DELIVER-6PKG ?auto_11764 ?auto_11766 ?auto_11768 ?auto_11769 ?auto_11770 ?auto_11767 ?auto_11765 )
      ( DELIVER-6PKG-VERIFY ?auto_11764 ?auto_11766 ?auto_11768 ?auto_11769 ?auto_11770 ?auto_11767 ?auto_11765 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11783 - OBJ
      ?auto_11785 - OBJ
      ?auto_11787 - OBJ
      ?auto_11788 - OBJ
      ?auto_11789 - OBJ
      ?auto_11786 - OBJ
      ?auto_11784 - LOCATION
    )
    :vars
    (
      ?auto_11790 - LOCATION
      ?auto_11793 - CITY
      ?auto_11792 - LOCATION
      ?auto_11791 - LOCATION
      ?auto_11794 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11785 ?auto_11783 ) ( GREATER-THAN ?auto_11787 ?auto_11783 ) ( GREATER-THAN ?auto_11787 ?auto_11785 ) ( GREATER-THAN ?auto_11788 ?auto_11783 ) ( GREATER-THAN ?auto_11788 ?auto_11785 ) ( GREATER-THAN ?auto_11788 ?auto_11787 ) ( GREATER-THAN ?auto_11789 ?auto_11783 ) ( GREATER-THAN ?auto_11789 ?auto_11785 ) ( GREATER-THAN ?auto_11789 ?auto_11787 ) ( GREATER-THAN ?auto_11789 ?auto_11788 ) ( GREATER-THAN ?auto_11786 ?auto_11783 ) ( GREATER-THAN ?auto_11786 ?auto_11785 ) ( GREATER-THAN ?auto_11786 ?auto_11787 ) ( GREATER-THAN ?auto_11786 ?auto_11788 ) ( GREATER-THAN ?auto_11786 ?auto_11789 ) ( IN-CITY ?auto_11790 ?auto_11793 ) ( IN-CITY ?auto_11784 ?auto_11793 ) ( not ( = ?auto_11784 ?auto_11790 ) ) ( OBJ-AT ?auto_11786 ?auto_11790 ) ( OBJ-AT ?auto_11783 ?auto_11784 ) ( not ( = ?auto_11783 ?auto_11785 ) ) ( not ( = ?auto_11783 ?auto_11787 ) ) ( not ( = ?auto_11783 ?auto_11788 ) ) ( not ( = ?auto_11783 ?auto_11789 ) ) ( not ( = ?auto_11783 ?auto_11786 ) ) ( not ( = ?auto_11785 ?auto_11787 ) ) ( not ( = ?auto_11785 ?auto_11788 ) ) ( not ( = ?auto_11785 ?auto_11789 ) ) ( not ( = ?auto_11785 ?auto_11786 ) ) ( not ( = ?auto_11787 ?auto_11788 ) ) ( not ( = ?auto_11787 ?auto_11789 ) ) ( not ( = ?auto_11787 ?auto_11786 ) ) ( not ( = ?auto_11788 ?auto_11789 ) ) ( not ( = ?auto_11788 ?auto_11786 ) ) ( not ( = ?auto_11789 ?auto_11786 ) ) ( IN-CITY ?auto_11792 ?auto_11793 ) ( not ( = ?auto_11784 ?auto_11792 ) ) ( not ( = ?auto_11790 ?auto_11792 ) ) ( OBJ-AT ?auto_11789 ?auto_11792 ) ( IN-CITY ?auto_11791 ?auto_11793 ) ( not ( = ?auto_11784 ?auto_11791 ) ) ( not ( = ?auto_11790 ?auto_11791 ) ) ( not ( = ?auto_11792 ?auto_11791 ) ) ( OBJ-AT ?auto_11788 ?auto_11791 ) ( OBJ-AT ?auto_11787 ?auto_11790 ) ( TRUCK-AT ?auto_11794 ?auto_11790 ) ( OBJ-AT ?auto_11785 ?auto_11790 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11785 ?auto_11794 ?auto_11790 )
      ( DELIVER-6PKG ?auto_11783 ?auto_11785 ?auto_11787 ?auto_11788 ?auto_11789 ?auto_11786 ?auto_11784 )
      ( DELIVER-6PKG-VERIFY ?auto_11783 ?auto_11785 ?auto_11787 ?auto_11788 ?auto_11789 ?auto_11786 ?auto_11784 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11802 - OBJ
      ?auto_11804 - OBJ
      ?auto_11806 - OBJ
      ?auto_11807 - OBJ
      ?auto_11808 - OBJ
      ?auto_11805 - OBJ
      ?auto_11803 - LOCATION
    )
    :vars
    (
      ?auto_11810 - LOCATION
      ?auto_11813 - CITY
      ?auto_11812 - LOCATION
      ?auto_11809 - LOCATION
      ?auto_11811 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11804 ?auto_11802 ) ( GREATER-THAN ?auto_11806 ?auto_11802 ) ( GREATER-THAN ?auto_11806 ?auto_11804 ) ( GREATER-THAN ?auto_11807 ?auto_11802 ) ( GREATER-THAN ?auto_11807 ?auto_11804 ) ( GREATER-THAN ?auto_11807 ?auto_11806 ) ( GREATER-THAN ?auto_11808 ?auto_11802 ) ( GREATER-THAN ?auto_11808 ?auto_11804 ) ( GREATER-THAN ?auto_11808 ?auto_11806 ) ( GREATER-THAN ?auto_11808 ?auto_11807 ) ( GREATER-THAN ?auto_11805 ?auto_11802 ) ( GREATER-THAN ?auto_11805 ?auto_11804 ) ( GREATER-THAN ?auto_11805 ?auto_11806 ) ( GREATER-THAN ?auto_11805 ?auto_11807 ) ( GREATER-THAN ?auto_11805 ?auto_11808 ) ( IN-CITY ?auto_11810 ?auto_11813 ) ( IN-CITY ?auto_11803 ?auto_11813 ) ( not ( = ?auto_11803 ?auto_11810 ) ) ( OBJ-AT ?auto_11805 ?auto_11810 ) ( OBJ-AT ?auto_11802 ?auto_11803 ) ( not ( = ?auto_11802 ?auto_11804 ) ) ( not ( = ?auto_11802 ?auto_11806 ) ) ( not ( = ?auto_11802 ?auto_11807 ) ) ( not ( = ?auto_11802 ?auto_11808 ) ) ( not ( = ?auto_11802 ?auto_11805 ) ) ( not ( = ?auto_11804 ?auto_11806 ) ) ( not ( = ?auto_11804 ?auto_11807 ) ) ( not ( = ?auto_11804 ?auto_11808 ) ) ( not ( = ?auto_11804 ?auto_11805 ) ) ( not ( = ?auto_11806 ?auto_11807 ) ) ( not ( = ?auto_11806 ?auto_11808 ) ) ( not ( = ?auto_11806 ?auto_11805 ) ) ( not ( = ?auto_11807 ?auto_11808 ) ) ( not ( = ?auto_11807 ?auto_11805 ) ) ( not ( = ?auto_11808 ?auto_11805 ) ) ( IN-CITY ?auto_11812 ?auto_11813 ) ( not ( = ?auto_11803 ?auto_11812 ) ) ( not ( = ?auto_11810 ?auto_11812 ) ) ( OBJ-AT ?auto_11808 ?auto_11812 ) ( IN-CITY ?auto_11809 ?auto_11813 ) ( not ( = ?auto_11803 ?auto_11809 ) ) ( not ( = ?auto_11810 ?auto_11809 ) ) ( not ( = ?auto_11812 ?auto_11809 ) ) ( OBJ-AT ?auto_11807 ?auto_11809 ) ( OBJ-AT ?auto_11806 ?auto_11810 ) ( OBJ-AT ?auto_11804 ?auto_11810 ) ( TRUCK-AT ?auto_11811 ?auto_11803 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11811 ?auto_11803 ?auto_11810 ?auto_11813 )
      ( DELIVER-6PKG ?auto_11802 ?auto_11804 ?auto_11806 ?auto_11807 ?auto_11808 ?auto_11805 ?auto_11803 )
      ( DELIVER-6PKG-VERIFY ?auto_11802 ?auto_11804 ?auto_11806 ?auto_11807 ?auto_11808 ?auto_11805 ?auto_11803 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11821 - OBJ
      ?auto_11823 - OBJ
      ?auto_11825 - OBJ
      ?auto_11826 - OBJ
      ?auto_11827 - OBJ
      ?auto_11824 - OBJ
      ?auto_11822 - LOCATION
    )
    :vars
    (
      ?auto_11828 - LOCATION
      ?auto_11832 - CITY
      ?auto_11829 - LOCATION
      ?auto_11830 - LOCATION
      ?auto_11831 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11823 ?auto_11821 ) ( GREATER-THAN ?auto_11825 ?auto_11821 ) ( GREATER-THAN ?auto_11825 ?auto_11823 ) ( GREATER-THAN ?auto_11826 ?auto_11821 ) ( GREATER-THAN ?auto_11826 ?auto_11823 ) ( GREATER-THAN ?auto_11826 ?auto_11825 ) ( GREATER-THAN ?auto_11827 ?auto_11821 ) ( GREATER-THAN ?auto_11827 ?auto_11823 ) ( GREATER-THAN ?auto_11827 ?auto_11825 ) ( GREATER-THAN ?auto_11827 ?auto_11826 ) ( GREATER-THAN ?auto_11824 ?auto_11821 ) ( GREATER-THAN ?auto_11824 ?auto_11823 ) ( GREATER-THAN ?auto_11824 ?auto_11825 ) ( GREATER-THAN ?auto_11824 ?auto_11826 ) ( GREATER-THAN ?auto_11824 ?auto_11827 ) ( IN-CITY ?auto_11828 ?auto_11832 ) ( IN-CITY ?auto_11822 ?auto_11832 ) ( not ( = ?auto_11822 ?auto_11828 ) ) ( OBJ-AT ?auto_11824 ?auto_11828 ) ( not ( = ?auto_11821 ?auto_11823 ) ) ( not ( = ?auto_11821 ?auto_11825 ) ) ( not ( = ?auto_11821 ?auto_11826 ) ) ( not ( = ?auto_11821 ?auto_11827 ) ) ( not ( = ?auto_11821 ?auto_11824 ) ) ( not ( = ?auto_11823 ?auto_11825 ) ) ( not ( = ?auto_11823 ?auto_11826 ) ) ( not ( = ?auto_11823 ?auto_11827 ) ) ( not ( = ?auto_11823 ?auto_11824 ) ) ( not ( = ?auto_11825 ?auto_11826 ) ) ( not ( = ?auto_11825 ?auto_11827 ) ) ( not ( = ?auto_11825 ?auto_11824 ) ) ( not ( = ?auto_11826 ?auto_11827 ) ) ( not ( = ?auto_11826 ?auto_11824 ) ) ( not ( = ?auto_11827 ?auto_11824 ) ) ( IN-CITY ?auto_11829 ?auto_11832 ) ( not ( = ?auto_11822 ?auto_11829 ) ) ( not ( = ?auto_11828 ?auto_11829 ) ) ( OBJ-AT ?auto_11827 ?auto_11829 ) ( IN-CITY ?auto_11830 ?auto_11832 ) ( not ( = ?auto_11822 ?auto_11830 ) ) ( not ( = ?auto_11828 ?auto_11830 ) ) ( not ( = ?auto_11829 ?auto_11830 ) ) ( OBJ-AT ?auto_11826 ?auto_11830 ) ( OBJ-AT ?auto_11825 ?auto_11828 ) ( OBJ-AT ?auto_11823 ?auto_11828 ) ( TRUCK-AT ?auto_11831 ?auto_11822 ) ( IN-TRUCK ?auto_11821 ?auto_11831 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11821 ?auto_11822 )
      ( DELIVER-6PKG ?auto_11821 ?auto_11823 ?auto_11825 ?auto_11826 ?auto_11827 ?auto_11824 ?auto_11822 )
      ( DELIVER-6PKG-VERIFY ?auto_11821 ?auto_11823 ?auto_11825 ?auto_11826 ?auto_11827 ?auto_11824 ?auto_11822 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11840 - OBJ
      ?auto_11842 - OBJ
      ?auto_11844 - OBJ
      ?auto_11845 - OBJ
      ?auto_11846 - OBJ
      ?auto_11843 - OBJ
      ?auto_11841 - LOCATION
    )
    :vars
    (
      ?auto_11851 - LOCATION
      ?auto_11847 - CITY
      ?auto_11849 - LOCATION
      ?auto_11850 - LOCATION
      ?auto_11848 - TRUCK
      ?auto_11852 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11842 ?auto_11840 ) ( GREATER-THAN ?auto_11844 ?auto_11840 ) ( GREATER-THAN ?auto_11844 ?auto_11842 ) ( GREATER-THAN ?auto_11845 ?auto_11840 ) ( GREATER-THAN ?auto_11845 ?auto_11842 ) ( GREATER-THAN ?auto_11845 ?auto_11844 ) ( GREATER-THAN ?auto_11846 ?auto_11840 ) ( GREATER-THAN ?auto_11846 ?auto_11842 ) ( GREATER-THAN ?auto_11846 ?auto_11844 ) ( GREATER-THAN ?auto_11846 ?auto_11845 ) ( GREATER-THAN ?auto_11843 ?auto_11840 ) ( GREATER-THAN ?auto_11843 ?auto_11842 ) ( GREATER-THAN ?auto_11843 ?auto_11844 ) ( GREATER-THAN ?auto_11843 ?auto_11845 ) ( GREATER-THAN ?auto_11843 ?auto_11846 ) ( IN-CITY ?auto_11851 ?auto_11847 ) ( IN-CITY ?auto_11841 ?auto_11847 ) ( not ( = ?auto_11841 ?auto_11851 ) ) ( OBJ-AT ?auto_11843 ?auto_11851 ) ( not ( = ?auto_11840 ?auto_11842 ) ) ( not ( = ?auto_11840 ?auto_11844 ) ) ( not ( = ?auto_11840 ?auto_11845 ) ) ( not ( = ?auto_11840 ?auto_11846 ) ) ( not ( = ?auto_11840 ?auto_11843 ) ) ( not ( = ?auto_11842 ?auto_11844 ) ) ( not ( = ?auto_11842 ?auto_11845 ) ) ( not ( = ?auto_11842 ?auto_11846 ) ) ( not ( = ?auto_11842 ?auto_11843 ) ) ( not ( = ?auto_11844 ?auto_11845 ) ) ( not ( = ?auto_11844 ?auto_11846 ) ) ( not ( = ?auto_11844 ?auto_11843 ) ) ( not ( = ?auto_11845 ?auto_11846 ) ) ( not ( = ?auto_11845 ?auto_11843 ) ) ( not ( = ?auto_11846 ?auto_11843 ) ) ( IN-CITY ?auto_11849 ?auto_11847 ) ( not ( = ?auto_11841 ?auto_11849 ) ) ( not ( = ?auto_11851 ?auto_11849 ) ) ( OBJ-AT ?auto_11846 ?auto_11849 ) ( IN-CITY ?auto_11850 ?auto_11847 ) ( not ( = ?auto_11841 ?auto_11850 ) ) ( not ( = ?auto_11851 ?auto_11850 ) ) ( not ( = ?auto_11849 ?auto_11850 ) ) ( OBJ-AT ?auto_11845 ?auto_11850 ) ( OBJ-AT ?auto_11844 ?auto_11851 ) ( OBJ-AT ?auto_11842 ?auto_11851 ) ( IN-TRUCK ?auto_11840 ?auto_11848 ) ( TRUCK-AT ?auto_11848 ?auto_11852 ) ( IN-CITY ?auto_11852 ?auto_11847 ) ( not ( = ?auto_11841 ?auto_11852 ) ) ( not ( = ?auto_11851 ?auto_11852 ) ) ( not ( = ?auto_11849 ?auto_11852 ) ) ( not ( = ?auto_11850 ?auto_11852 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11848 ?auto_11852 ?auto_11841 ?auto_11847 )
      ( DELIVER-6PKG ?auto_11840 ?auto_11842 ?auto_11844 ?auto_11845 ?auto_11846 ?auto_11843 ?auto_11841 )
      ( DELIVER-6PKG-VERIFY ?auto_11840 ?auto_11842 ?auto_11844 ?auto_11845 ?auto_11846 ?auto_11843 ?auto_11841 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11860 - OBJ
      ?auto_11862 - OBJ
      ?auto_11864 - OBJ
      ?auto_11865 - OBJ
      ?auto_11866 - OBJ
      ?auto_11863 - OBJ
      ?auto_11861 - LOCATION
    )
    :vars
    (
      ?auto_11872 - LOCATION
      ?auto_11871 - CITY
      ?auto_11870 - LOCATION
      ?auto_11868 - LOCATION
      ?auto_11867 - TRUCK
      ?auto_11869 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11862 ?auto_11860 ) ( GREATER-THAN ?auto_11864 ?auto_11860 ) ( GREATER-THAN ?auto_11864 ?auto_11862 ) ( GREATER-THAN ?auto_11865 ?auto_11860 ) ( GREATER-THAN ?auto_11865 ?auto_11862 ) ( GREATER-THAN ?auto_11865 ?auto_11864 ) ( GREATER-THAN ?auto_11866 ?auto_11860 ) ( GREATER-THAN ?auto_11866 ?auto_11862 ) ( GREATER-THAN ?auto_11866 ?auto_11864 ) ( GREATER-THAN ?auto_11866 ?auto_11865 ) ( GREATER-THAN ?auto_11863 ?auto_11860 ) ( GREATER-THAN ?auto_11863 ?auto_11862 ) ( GREATER-THAN ?auto_11863 ?auto_11864 ) ( GREATER-THAN ?auto_11863 ?auto_11865 ) ( GREATER-THAN ?auto_11863 ?auto_11866 ) ( IN-CITY ?auto_11872 ?auto_11871 ) ( IN-CITY ?auto_11861 ?auto_11871 ) ( not ( = ?auto_11861 ?auto_11872 ) ) ( OBJ-AT ?auto_11863 ?auto_11872 ) ( not ( = ?auto_11860 ?auto_11862 ) ) ( not ( = ?auto_11860 ?auto_11864 ) ) ( not ( = ?auto_11860 ?auto_11865 ) ) ( not ( = ?auto_11860 ?auto_11866 ) ) ( not ( = ?auto_11860 ?auto_11863 ) ) ( not ( = ?auto_11862 ?auto_11864 ) ) ( not ( = ?auto_11862 ?auto_11865 ) ) ( not ( = ?auto_11862 ?auto_11866 ) ) ( not ( = ?auto_11862 ?auto_11863 ) ) ( not ( = ?auto_11864 ?auto_11865 ) ) ( not ( = ?auto_11864 ?auto_11866 ) ) ( not ( = ?auto_11864 ?auto_11863 ) ) ( not ( = ?auto_11865 ?auto_11866 ) ) ( not ( = ?auto_11865 ?auto_11863 ) ) ( not ( = ?auto_11866 ?auto_11863 ) ) ( IN-CITY ?auto_11870 ?auto_11871 ) ( not ( = ?auto_11861 ?auto_11870 ) ) ( not ( = ?auto_11872 ?auto_11870 ) ) ( OBJ-AT ?auto_11866 ?auto_11870 ) ( IN-CITY ?auto_11868 ?auto_11871 ) ( not ( = ?auto_11861 ?auto_11868 ) ) ( not ( = ?auto_11872 ?auto_11868 ) ) ( not ( = ?auto_11870 ?auto_11868 ) ) ( OBJ-AT ?auto_11865 ?auto_11868 ) ( OBJ-AT ?auto_11864 ?auto_11872 ) ( OBJ-AT ?auto_11862 ?auto_11872 ) ( TRUCK-AT ?auto_11867 ?auto_11869 ) ( IN-CITY ?auto_11869 ?auto_11871 ) ( not ( = ?auto_11861 ?auto_11869 ) ) ( not ( = ?auto_11872 ?auto_11869 ) ) ( not ( = ?auto_11870 ?auto_11869 ) ) ( not ( = ?auto_11868 ?auto_11869 ) ) ( OBJ-AT ?auto_11860 ?auto_11869 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11860 ?auto_11867 ?auto_11869 )
      ( DELIVER-6PKG ?auto_11860 ?auto_11862 ?auto_11864 ?auto_11865 ?auto_11866 ?auto_11863 ?auto_11861 )
      ( DELIVER-6PKG-VERIFY ?auto_11860 ?auto_11862 ?auto_11864 ?auto_11865 ?auto_11866 ?auto_11863 ?auto_11861 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_11880 - OBJ
      ?auto_11882 - OBJ
      ?auto_11884 - OBJ
      ?auto_11885 - OBJ
      ?auto_11886 - OBJ
      ?auto_11883 - OBJ
      ?auto_11881 - LOCATION
    )
    :vars
    (
      ?auto_11888 - LOCATION
      ?auto_11890 - CITY
      ?auto_11889 - LOCATION
      ?auto_11891 - LOCATION
      ?auto_11887 - LOCATION
      ?auto_11892 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_11882 ?auto_11880 ) ( GREATER-THAN ?auto_11884 ?auto_11880 ) ( GREATER-THAN ?auto_11884 ?auto_11882 ) ( GREATER-THAN ?auto_11885 ?auto_11880 ) ( GREATER-THAN ?auto_11885 ?auto_11882 ) ( GREATER-THAN ?auto_11885 ?auto_11884 ) ( GREATER-THAN ?auto_11886 ?auto_11880 ) ( GREATER-THAN ?auto_11886 ?auto_11882 ) ( GREATER-THAN ?auto_11886 ?auto_11884 ) ( GREATER-THAN ?auto_11886 ?auto_11885 ) ( GREATER-THAN ?auto_11883 ?auto_11880 ) ( GREATER-THAN ?auto_11883 ?auto_11882 ) ( GREATER-THAN ?auto_11883 ?auto_11884 ) ( GREATER-THAN ?auto_11883 ?auto_11885 ) ( GREATER-THAN ?auto_11883 ?auto_11886 ) ( IN-CITY ?auto_11888 ?auto_11890 ) ( IN-CITY ?auto_11881 ?auto_11890 ) ( not ( = ?auto_11881 ?auto_11888 ) ) ( OBJ-AT ?auto_11883 ?auto_11888 ) ( not ( = ?auto_11880 ?auto_11882 ) ) ( not ( = ?auto_11880 ?auto_11884 ) ) ( not ( = ?auto_11880 ?auto_11885 ) ) ( not ( = ?auto_11880 ?auto_11886 ) ) ( not ( = ?auto_11880 ?auto_11883 ) ) ( not ( = ?auto_11882 ?auto_11884 ) ) ( not ( = ?auto_11882 ?auto_11885 ) ) ( not ( = ?auto_11882 ?auto_11886 ) ) ( not ( = ?auto_11882 ?auto_11883 ) ) ( not ( = ?auto_11884 ?auto_11885 ) ) ( not ( = ?auto_11884 ?auto_11886 ) ) ( not ( = ?auto_11884 ?auto_11883 ) ) ( not ( = ?auto_11885 ?auto_11886 ) ) ( not ( = ?auto_11885 ?auto_11883 ) ) ( not ( = ?auto_11886 ?auto_11883 ) ) ( IN-CITY ?auto_11889 ?auto_11890 ) ( not ( = ?auto_11881 ?auto_11889 ) ) ( not ( = ?auto_11888 ?auto_11889 ) ) ( OBJ-AT ?auto_11886 ?auto_11889 ) ( IN-CITY ?auto_11891 ?auto_11890 ) ( not ( = ?auto_11881 ?auto_11891 ) ) ( not ( = ?auto_11888 ?auto_11891 ) ) ( not ( = ?auto_11889 ?auto_11891 ) ) ( OBJ-AT ?auto_11885 ?auto_11891 ) ( OBJ-AT ?auto_11884 ?auto_11888 ) ( OBJ-AT ?auto_11882 ?auto_11888 ) ( IN-CITY ?auto_11887 ?auto_11890 ) ( not ( = ?auto_11881 ?auto_11887 ) ) ( not ( = ?auto_11888 ?auto_11887 ) ) ( not ( = ?auto_11889 ?auto_11887 ) ) ( not ( = ?auto_11891 ?auto_11887 ) ) ( OBJ-AT ?auto_11880 ?auto_11887 ) ( TRUCK-AT ?auto_11892 ?auto_11881 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11892 ?auto_11881 ?auto_11887 ?auto_11890 )
      ( DELIVER-6PKG ?auto_11880 ?auto_11882 ?auto_11884 ?auto_11885 ?auto_11886 ?auto_11883 ?auto_11881 )
      ( DELIVER-6PKG-VERIFY ?auto_11880 ?auto_11882 ?auto_11884 ?auto_11885 ?auto_11886 ?auto_11883 ?auto_11881 ) )
  )

)

