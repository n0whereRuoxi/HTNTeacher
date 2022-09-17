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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_623 - OBJ
      ?auto_624 - LOCATION
    )
    :vars
    (
      ?auto_625 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_625 ?auto_624 ) ( IN-TRUCK ?auto_623 ?auto_625 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_623 ?auto_625 ?auto_624 )
      ( DELIVER-1PKG-VERIFY ?auto_623 ?auto_624 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_630 - OBJ
      ?auto_631 - LOCATION
    )
    :vars
    (
      ?auto_633 - TRUCK
      ?auto_636 - LOCATION
      ?auto_637 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_630 ?auto_633 ) ( TRUCK-AT ?auto_633 ?auto_636 ) ( IN-CITY ?auto_636 ?auto_637 ) ( IN-CITY ?auto_631 ?auto_637 ) ( not ( = ?auto_631 ?auto_636 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_633 ?auto_636 ?auto_631 ?auto_637 )
      ( DELIVER-1PKG ?auto_630 ?auto_631 )
      ( DELIVER-1PKG-VERIFY ?auto_630 ?auto_631 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_641 - OBJ
      ?auto_642 - LOCATION
    )
    :vars
    (
      ?auto_647 - TRUCK
      ?auto_645 - LOCATION
      ?auto_643 - CITY
      ?auto_649 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_647 ?auto_645 ) ( IN-CITY ?auto_645 ?auto_643 ) ( IN-CITY ?auto_642 ?auto_643 ) ( not ( = ?auto_642 ?auto_645 ) ) ( TRUCK-AT ?auto_647 ?auto_649 ) ( OBJ-AT ?auto_641 ?auto_649 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_641 ?auto_647 ?auto_649 )
      ( DELIVER-1PKG ?auto_641 ?auto_642 )
      ( DELIVER-1PKG-VERIFY ?auto_641 ?auto_642 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_653 - OBJ
      ?auto_654 - LOCATION
    )
    :vars
    (
      ?auto_659 - LOCATION
      ?auto_660 - CITY
      ?auto_657 - TRUCK
      ?auto_662 - LOCATION
      ?auto_663 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_659 ?auto_660 ) ( IN-CITY ?auto_654 ?auto_660 ) ( not ( = ?auto_654 ?auto_659 ) ) ( OBJ-AT ?auto_653 ?auto_659 ) ( TRUCK-AT ?auto_657 ?auto_662 ) ( IN-CITY ?auto_662 ?auto_663 ) ( IN-CITY ?auto_659 ?auto_663 ) ( not ( = ?auto_659 ?auto_662 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_657 ?auto_662 ?auto_659 ?auto_663 )
      ( DELIVER-1PKG ?auto_653 ?auto_654 )
      ( DELIVER-1PKG-VERIFY ?auto_653 ?auto_654 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_712 - OBJ
      ?auto_714 - OBJ
      ?auto_713 - LOCATION
    )
    :vars
    (
      ?auto_717 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_714 ?auto_712 ) ( TRUCK-AT ?auto_717 ?auto_713 ) ( IN-TRUCK ?auto_714 ?auto_717 ) ( OBJ-AT ?auto_712 ?auto_713 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_714 ?auto_713 )
      ( DELIVER-2PKG-VERIFY ?auto_712 ?auto_714 ?auto_713 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_721 - OBJ
      ?auto_723 - OBJ
      ?auto_722 - LOCATION
    )
    :vars
    (
      ?auto_726 - TRUCK
      ?auto_727 - LOCATION
      ?auto_725 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_723 ?auto_721 ) ( IN-TRUCK ?auto_723 ?auto_726 ) ( TRUCK-AT ?auto_726 ?auto_727 ) ( IN-CITY ?auto_727 ?auto_725 ) ( IN-CITY ?auto_722 ?auto_725 ) ( not ( = ?auto_722 ?auto_727 ) ) ( OBJ-AT ?auto_721 ?auto_722 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_723 ?auto_722 )
      ( DELIVER-2PKG-VERIFY ?auto_721 ?auto_723 ?auto_722 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_732 - OBJ
      ?auto_734 - OBJ
      ?auto_733 - LOCATION
    )
    :vars
    (
      ?auto_735 - TRUCK
      ?auto_738 - LOCATION
      ?auto_737 - CITY
      ?auto_740 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_734 ?auto_732 ) ( TRUCK-AT ?auto_735 ?auto_738 ) ( IN-CITY ?auto_738 ?auto_737 ) ( IN-CITY ?auto_733 ?auto_737 ) ( not ( = ?auto_733 ?auto_738 ) ) ( TRUCK-AT ?auto_735 ?auto_740 ) ( OBJ-AT ?auto_734 ?auto_740 ) ( OBJ-AT ?auto_732 ?auto_733 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_734 ?auto_733 )
      ( DELIVER-2PKG-VERIFY ?auto_732 ?auto_734 ?auto_733 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_744 - OBJ
      ?auto_746 - OBJ
      ?auto_745 - LOCATION
    )
    :vars
    (
      ?auto_749 - LOCATION
      ?auto_751 - CITY
      ?auto_748 - TRUCK
      ?auto_747 - LOCATION
      ?auto_750 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_746 ?auto_744 ) ( IN-CITY ?auto_749 ?auto_751 ) ( IN-CITY ?auto_745 ?auto_751 ) ( not ( = ?auto_745 ?auto_749 ) ) ( OBJ-AT ?auto_746 ?auto_749 ) ( TRUCK-AT ?auto_748 ?auto_747 ) ( IN-CITY ?auto_747 ?auto_750 ) ( IN-CITY ?auto_749 ?auto_750 ) ( not ( = ?auto_749 ?auto_747 ) ) ( OBJ-AT ?auto_744 ?auto_745 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_746 ?auto_745 )
      ( DELIVER-2PKG-VERIFY ?auto_744 ?auto_746 ?auto_745 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_761 - OBJ
      ?auto_759 - OBJ
      ?auto_758 - LOCATION
    )
    :vars
    (
      ?auto_762 - LOCATION
      ?auto_765 - CITY
      ?auto_763 - TRUCK
      ?auto_766 - LOCATION
      ?auto_764 - CITY
      ?auto_769 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_759 ?auto_761 ) ( IN-CITY ?auto_762 ?auto_765 ) ( IN-CITY ?auto_758 ?auto_765 ) ( not ( = ?auto_758 ?auto_762 ) ) ( OBJ-AT ?auto_759 ?auto_762 ) ( TRUCK-AT ?auto_763 ?auto_766 ) ( IN-CITY ?auto_766 ?auto_764 ) ( IN-CITY ?auto_762 ?auto_764 ) ( not ( = ?auto_762 ?auto_766 ) ) ( TRUCK-AT ?auto_769 ?auto_758 ) ( IN-TRUCK ?auto_761 ?auto_769 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_761 ?auto_758 )
      ( DELIVER-2PKG ?auto_761 ?auto_759 ?auto_758 )
      ( DELIVER-2PKG-VERIFY ?auto_761 ?auto_759 ?auto_758 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_774 - OBJ
      ?auto_776 - OBJ
      ?auto_775 - LOCATION
    )
    :vars
    (
      ?auto_778 - LOCATION
      ?auto_782 - CITY
      ?auto_783 - CITY
      ?auto_784 - TRUCK
      ?auto_787 - LOCATION
      ?auto_788 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_776 ?auto_774 ) ( IN-CITY ?auto_778 ?auto_782 ) ( IN-CITY ?auto_775 ?auto_782 ) ( not ( = ?auto_775 ?auto_778 ) ) ( OBJ-AT ?auto_776 ?auto_778 ) ( IN-CITY ?auto_775 ?auto_783 ) ( IN-CITY ?auto_778 ?auto_783 ) ( IN-TRUCK ?auto_774 ?auto_784 ) ( TRUCK-AT ?auto_784 ?auto_787 ) ( IN-CITY ?auto_787 ?auto_788 ) ( IN-CITY ?auto_775 ?auto_788 ) ( not ( = ?auto_775 ?auto_787 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_784 ?auto_787 ?auto_775 ?auto_788 )
      ( DELIVER-2PKG ?auto_774 ?auto_776 ?auto_775 )
      ( DELIVER-2PKG-VERIFY ?auto_774 ?auto_776 ?auto_775 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_793 - OBJ
      ?auto_795 - OBJ
      ?auto_794 - LOCATION
    )
    :vars
    (
      ?auto_796 - LOCATION
      ?auto_800 - CITY
      ?auto_797 - CITY
      ?auto_802 - TRUCK
      ?auto_803 - LOCATION
      ?auto_801 - CITY
      ?auto_806 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_795 ?auto_793 ) ( IN-CITY ?auto_796 ?auto_800 ) ( IN-CITY ?auto_794 ?auto_800 ) ( not ( = ?auto_794 ?auto_796 ) ) ( OBJ-AT ?auto_795 ?auto_796 ) ( IN-CITY ?auto_794 ?auto_797 ) ( IN-CITY ?auto_796 ?auto_797 ) ( TRUCK-AT ?auto_802 ?auto_803 ) ( IN-CITY ?auto_803 ?auto_801 ) ( IN-CITY ?auto_794 ?auto_801 ) ( not ( = ?auto_794 ?auto_803 ) ) ( TRUCK-AT ?auto_802 ?auto_806 ) ( OBJ-AT ?auto_793 ?auto_806 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_793 ?auto_802 ?auto_806 )
      ( DELIVER-2PKG ?auto_793 ?auto_795 ?auto_794 )
      ( DELIVER-2PKG-VERIFY ?auto_793 ?auto_795 ?auto_794 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_811 - OBJ
      ?auto_813 - OBJ
      ?auto_812 - LOCATION
    )
    :vars
    (
      ?auto_816 - LOCATION
      ?auto_819 - CITY
      ?auto_815 - CITY
      ?auto_817 - LOCATION
      ?auto_823 - CITY
      ?auto_822 - TRUCK
      ?auto_825 - LOCATION
      ?auto_826 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_813 ?auto_811 ) ( IN-CITY ?auto_816 ?auto_819 ) ( IN-CITY ?auto_812 ?auto_819 ) ( not ( = ?auto_812 ?auto_816 ) ) ( OBJ-AT ?auto_813 ?auto_816 ) ( IN-CITY ?auto_812 ?auto_815 ) ( IN-CITY ?auto_816 ?auto_815 ) ( IN-CITY ?auto_817 ?auto_823 ) ( IN-CITY ?auto_812 ?auto_823 ) ( not ( = ?auto_812 ?auto_817 ) ) ( OBJ-AT ?auto_811 ?auto_817 ) ( TRUCK-AT ?auto_822 ?auto_825 ) ( IN-CITY ?auto_825 ?auto_826 ) ( IN-CITY ?auto_817 ?auto_826 ) ( not ( = ?auto_817 ?auto_825 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_822 ?auto_825 ?auto_817 ?auto_826 )
      ( DELIVER-2PKG ?auto_811 ?auto_813 ?auto_812 )
      ( DELIVER-2PKG-VERIFY ?auto_811 ?auto_813 ?auto_812 ) )
  )

)

