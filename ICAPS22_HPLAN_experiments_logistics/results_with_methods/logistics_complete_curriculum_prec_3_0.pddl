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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_615 - OBJ
      ?auto_616 - LOCATION
    )
    :vars
    (
      ?auto_617 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_617 ?auto_616 ) ( IN-TRUCK ?auto_615 ?auto_617 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_615 ?auto_617 ?auto_616 )
      ( DELIVER-1PKG-VERIFY ?auto_615 ?auto_616 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_620 - OBJ
      ?auto_621 - LOCATION
    )
    :vars
    (
      ?auto_622 - TRUCK
      ?auto_623 - LOCATION
      ?auto_624 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_620 ?auto_622 ) ( TRUCK-AT ?auto_622 ?auto_623 ) ( IN-CITY ?auto_623 ?auto_624 ) ( IN-CITY ?auto_621 ?auto_624 ) ( not ( = ?auto_621 ?auto_623 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_622 ?auto_623 ?auto_621 ?auto_624 )
      ( DELIVER-1PKG ?auto_620 ?auto_621 )
      ( DELIVER-1PKG-VERIFY ?auto_620 ?auto_621 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_627 - OBJ
      ?auto_628 - LOCATION
    )
    :vars
    (
      ?auto_631 - TRUCK
      ?auto_629 - LOCATION
      ?auto_630 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_631 ?auto_629 ) ( IN-CITY ?auto_629 ?auto_630 ) ( IN-CITY ?auto_628 ?auto_630 ) ( not ( = ?auto_628 ?auto_629 ) ) ( OBJ-AT ?auto_627 ?auto_629 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_627 ?auto_631 ?auto_629 )
      ( DELIVER-1PKG ?auto_627 ?auto_628 )
      ( DELIVER-1PKG-VERIFY ?auto_627 ?auto_628 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_634 - OBJ
      ?auto_635 - LOCATION
    )
    :vars
    (
      ?auto_637 - LOCATION
      ?auto_636 - CITY
      ?auto_638 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_637 ?auto_636 ) ( IN-CITY ?auto_635 ?auto_636 ) ( not ( = ?auto_635 ?auto_637 ) ) ( OBJ-AT ?auto_634 ?auto_637 ) ( TRUCK-AT ?auto_638 ?auto_635 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_638 ?auto_635 ?auto_637 ?auto_636 )
      ( DELIVER-1PKG ?auto_634 ?auto_635 )
      ( DELIVER-1PKG-VERIFY ?auto_634 ?auto_635 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_641 - OBJ
      ?auto_642 - LOCATION
    )
    :vars
    (
      ?auto_643 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_643 ?auto_642 ) ( IN-TRUCK ?auto_641 ?auto_643 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_641 ?auto_643 ?auto_642 )
      ( DELIVER-1PKG-VERIFY ?auto_641 ?auto_642 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_646 - OBJ
      ?auto_647 - LOCATION
    )
    :vars
    (
      ?auto_648 - TRUCK
      ?auto_649 - LOCATION
      ?auto_650 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_646 ?auto_648 ) ( TRUCK-AT ?auto_648 ?auto_649 ) ( IN-CITY ?auto_649 ?auto_650 ) ( IN-CITY ?auto_647 ?auto_650 ) ( not ( = ?auto_647 ?auto_649 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_648 ?auto_649 ?auto_647 ?auto_650 )
      ( DELIVER-1PKG ?auto_646 ?auto_647 )
      ( DELIVER-1PKG-VERIFY ?auto_646 ?auto_647 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_653 - OBJ
      ?auto_654 - LOCATION
    )
    :vars
    (
      ?auto_657 - TRUCK
      ?auto_655 - LOCATION
      ?auto_656 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_657 ?auto_655 ) ( IN-CITY ?auto_655 ?auto_656 ) ( IN-CITY ?auto_654 ?auto_656 ) ( not ( = ?auto_654 ?auto_655 ) ) ( OBJ-AT ?auto_653 ?auto_655 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_653 ?auto_657 ?auto_655 )
      ( DELIVER-1PKG ?auto_653 ?auto_654 )
      ( DELIVER-1PKG-VERIFY ?auto_653 ?auto_654 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_660 - OBJ
      ?auto_661 - LOCATION
    )
    :vars
    (
      ?auto_663 - LOCATION
      ?auto_662 - CITY
      ?auto_664 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_663 ?auto_662 ) ( IN-CITY ?auto_661 ?auto_662 ) ( not ( = ?auto_661 ?auto_663 ) ) ( OBJ-AT ?auto_660 ?auto_663 ) ( TRUCK-AT ?auto_664 ?auto_661 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_664 ?auto_661 ?auto_663 ?auto_662 )
      ( DELIVER-1PKG ?auto_660 ?auto_661 )
      ( DELIVER-1PKG-VERIFY ?auto_660 ?auto_661 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_668 - OBJ
      ?auto_670 - OBJ
      ?auto_669 - LOCATION
    )
    :vars
    (
      ?auto_671 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_670 ?auto_668 ) ( TRUCK-AT ?auto_671 ?auto_669 ) ( IN-TRUCK ?auto_670 ?auto_671 ) ( OBJ-AT ?auto_668 ?auto_669 ) ( not ( = ?auto_668 ?auto_670 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_670 ?auto_669 )
      ( DELIVER-2PKG-VERIFY ?auto_668 ?auto_670 ?auto_669 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_675 - OBJ
      ?auto_677 - OBJ
      ?auto_676 - LOCATION
    )
    :vars
    (
      ?auto_680 - TRUCK
      ?auto_678 - LOCATION
      ?auto_679 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_677 ?auto_675 ) ( IN-TRUCK ?auto_677 ?auto_680 ) ( TRUCK-AT ?auto_680 ?auto_678 ) ( IN-CITY ?auto_678 ?auto_679 ) ( IN-CITY ?auto_676 ?auto_679 ) ( not ( = ?auto_676 ?auto_678 ) ) ( OBJ-AT ?auto_675 ?auto_676 ) ( not ( = ?auto_675 ?auto_677 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_677 ?auto_676 )
      ( DELIVER-2PKG-VERIFY ?auto_675 ?auto_677 ?auto_676 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_684 - OBJ
      ?auto_686 - OBJ
      ?auto_685 - LOCATION
    )
    :vars
    (
      ?auto_689 - TRUCK
      ?auto_688 - LOCATION
      ?auto_687 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_686 ?auto_684 ) ( TRUCK-AT ?auto_689 ?auto_688 ) ( IN-CITY ?auto_688 ?auto_687 ) ( IN-CITY ?auto_685 ?auto_687 ) ( not ( = ?auto_685 ?auto_688 ) ) ( OBJ-AT ?auto_686 ?auto_688 ) ( OBJ-AT ?auto_684 ?auto_685 ) ( not ( = ?auto_684 ?auto_686 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_686 ?auto_685 )
      ( DELIVER-2PKG-VERIFY ?auto_684 ?auto_686 ?auto_685 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_693 - OBJ
      ?auto_695 - OBJ
      ?auto_694 - LOCATION
    )
    :vars
    (
      ?auto_696 - LOCATION
      ?auto_698 - CITY
      ?auto_697 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_695 ?auto_693 ) ( IN-CITY ?auto_696 ?auto_698 ) ( IN-CITY ?auto_694 ?auto_698 ) ( not ( = ?auto_694 ?auto_696 ) ) ( OBJ-AT ?auto_695 ?auto_696 ) ( TRUCK-AT ?auto_697 ?auto_694 ) ( OBJ-AT ?auto_693 ?auto_694 ) ( not ( = ?auto_693 ?auto_695 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_695 ?auto_694 )
      ( DELIVER-2PKG-VERIFY ?auto_693 ?auto_695 ?auto_694 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_702 - OBJ
      ?auto_704 - OBJ
      ?auto_703 - LOCATION
    )
    :vars
    (
      ?auto_705 - LOCATION
      ?auto_706 - CITY
      ?auto_707 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_704 ?auto_702 ) ( IN-CITY ?auto_705 ?auto_706 ) ( IN-CITY ?auto_703 ?auto_706 ) ( not ( = ?auto_703 ?auto_705 ) ) ( OBJ-AT ?auto_704 ?auto_705 ) ( TRUCK-AT ?auto_707 ?auto_703 ) ( not ( = ?auto_702 ?auto_704 ) ) ( IN-TRUCK ?auto_702 ?auto_707 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_702 ?auto_703 )
      ( DELIVER-2PKG ?auto_702 ?auto_704 ?auto_703 )
      ( DELIVER-2PKG-VERIFY ?auto_702 ?auto_704 ?auto_703 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_711 - OBJ
      ?auto_713 - OBJ
      ?auto_712 - LOCATION
    )
    :vars
    (
      ?auto_714 - LOCATION
      ?auto_716 - CITY
      ?auto_715 - TRUCK
      ?auto_717 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_713 ?auto_711 ) ( IN-CITY ?auto_714 ?auto_716 ) ( IN-CITY ?auto_712 ?auto_716 ) ( not ( = ?auto_712 ?auto_714 ) ) ( OBJ-AT ?auto_713 ?auto_714 ) ( not ( = ?auto_711 ?auto_713 ) ) ( IN-TRUCK ?auto_711 ?auto_715 ) ( TRUCK-AT ?auto_715 ?auto_717 ) ( IN-CITY ?auto_717 ?auto_716 ) ( not ( = ?auto_712 ?auto_717 ) ) ( not ( = ?auto_714 ?auto_717 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_715 ?auto_717 ?auto_712 ?auto_716 )
      ( DELIVER-2PKG ?auto_711 ?auto_713 ?auto_712 )
      ( DELIVER-2PKG-VERIFY ?auto_711 ?auto_713 ?auto_712 ) )
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
      ?auto_724 - LOCATION
      ?auto_727 - CITY
      ?auto_725 - TRUCK
      ?auto_726 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_723 ?auto_721 ) ( IN-CITY ?auto_724 ?auto_727 ) ( IN-CITY ?auto_722 ?auto_727 ) ( not ( = ?auto_722 ?auto_724 ) ) ( OBJ-AT ?auto_723 ?auto_724 ) ( not ( = ?auto_721 ?auto_723 ) ) ( TRUCK-AT ?auto_725 ?auto_726 ) ( IN-CITY ?auto_726 ?auto_727 ) ( not ( = ?auto_722 ?auto_726 ) ) ( not ( = ?auto_724 ?auto_726 ) ) ( OBJ-AT ?auto_721 ?auto_726 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_721 ?auto_725 ?auto_726 )
      ( DELIVER-2PKG ?auto_721 ?auto_723 ?auto_722 )
      ( DELIVER-2PKG-VERIFY ?auto_721 ?auto_723 ?auto_722 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_731 - OBJ
      ?auto_733 - OBJ
      ?auto_732 - LOCATION
    )
    :vars
    (
      ?auto_735 - LOCATION
      ?auto_734 - CITY
      ?auto_736 - LOCATION
      ?auto_737 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_733 ?auto_731 ) ( IN-CITY ?auto_735 ?auto_734 ) ( IN-CITY ?auto_732 ?auto_734 ) ( not ( = ?auto_732 ?auto_735 ) ) ( OBJ-AT ?auto_733 ?auto_735 ) ( not ( = ?auto_731 ?auto_733 ) ) ( IN-CITY ?auto_736 ?auto_734 ) ( not ( = ?auto_732 ?auto_736 ) ) ( not ( = ?auto_735 ?auto_736 ) ) ( OBJ-AT ?auto_731 ?auto_736 ) ( TRUCK-AT ?auto_737 ?auto_732 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_737 ?auto_732 ?auto_736 ?auto_734 )
      ( DELIVER-2PKG ?auto_731 ?auto_733 ?auto_732 )
      ( DELIVER-2PKG-VERIFY ?auto_731 ?auto_733 ?auto_732 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_740 - OBJ
      ?auto_741 - LOCATION
    )
    :vars
    (
      ?auto_742 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_742 ?auto_741 ) ( IN-TRUCK ?auto_740 ?auto_742 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_740 ?auto_742 ?auto_741 )
      ( DELIVER-1PKG-VERIFY ?auto_740 ?auto_741 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_745 - OBJ
      ?auto_746 - LOCATION
    )
    :vars
    (
      ?auto_747 - TRUCK
      ?auto_748 - LOCATION
      ?auto_749 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_745 ?auto_747 ) ( TRUCK-AT ?auto_747 ?auto_748 ) ( IN-CITY ?auto_748 ?auto_749 ) ( IN-CITY ?auto_746 ?auto_749 ) ( not ( = ?auto_746 ?auto_748 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_747 ?auto_748 ?auto_746 ?auto_749 )
      ( DELIVER-1PKG ?auto_745 ?auto_746 )
      ( DELIVER-1PKG-VERIFY ?auto_745 ?auto_746 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_752 - OBJ
      ?auto_753 - LOCATION
    )
    :vars
    (
      ?auto_754 - TRUCK
      ?auto_755 - LOCATION
      ?auto_756 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_754 ?auto_755 ) ( IN-CITY ?auto_755 ?auto_756 ) ( IN-CITY ?auto_753 ?auto_756 ) ( not ( = ?auto_753 ?auto_755 ) ) ( OBJ-AT ?auto_752 ?auto_755 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_752 ?auto_754 ?auto_755 )
      ( DELIVER-1PKG ?auto_752 ?auto_753 )
      ( DELIVER-1PKG-VERIFY ?auto_752 ?auto_753 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_759 - OBJ
      ?auto_760 - LOCATION
    )
    :vars
    (
      ?auto_763 - LOCATION
      ?auto_761 - CITY
      ?auto_762 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_763 ?auto_761 ) ( IN-CITY ?auto_760 ?auto_761 ) ( not ( = ?auto_760 ?auto_763 ) ) ( OBJ-AT ?auto_759 ?auto_763 ) ( TRUCK-AT ?auto_762 ?auto_760 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_762 ?auto_760 ?auto_763 ?auto_761 )
      ( DELIVER-1PKG ?auto_759 ?auto_760 )
      ( DELIVER-1PKG-VERIFY ?auto_759 ?auto_760 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_768 - OBJ
      ?auto_770 - OBJ
      ?auto_771 - OBJ
      ?auto_769 - LOCATION
    )
    :vars
    (
      ?auto_772 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_770 ?auto_768 ) ( GREATER-THAN ?auto_771 ?auto_768 ) ( GREATER-THAN ?auto_771 ?auto_770 ) ( TRUCK-AT ?auto_772 ?auto_769 ) ( IN-TRUCK ?auto_771 ?auto_772 ) ( OBJ-AT ?auto_768 ?auto_769 ) ( OBJ-AT ?auto_770 ?auto_769 ) ( not ( = ?auto_768 ?auto_770 ) ) ( not ( = ?auto_768 ?auto_771 ) ) ( not ( = ?auto_770 ?auto_771 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_771 ?auto_769 )
      ( DELIVER-3PKG-VERIFY ?auto_768 ?auto_770 ?auto_771 ?auto_769 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_777 - OBJ
      ?auto_779 - OBJ
      ?auto_780 - OBJ
      ?auto_778 - LOCATION
    )
    :vars
    (
      ?auto_781 - TRUCK
      ?auto_782 - LOCATION
      ?auto_783 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_779 ?auto_777 ) ( GREATER-THAN ?auto_780 ?auto_777 ) ( GREATER-THAN ?auto_780 ?auto_779 ) ( IN-TRUCK ?auto_780 ?auto_781 ) ( TRUCK-AT ?auto_781 ?auto_782 ) ( IN-CITY ?auto_782 ?auto_783 ) ( IN-CITY ?auto_778 ?auto_783 ) ( not ( = ?auto_778 ?auto_782 ) ) ( OBJ-AT ?auto_777 ?auto_778 ) ( OBJ-AT ?auto_779 ?auto_778 ) ( not ( = ?auto_777 ?auto_779 ) ) ( not ( = ?auto_777 ?auto_780 ) ) ( not ( = ?auto_779 ?auto_780 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_780 ?auto_778 )
      ( DELIVER-3PKG-VERIFY ?auto_777 ?auto_779 ?auto_780 ?auto_778 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_788 - OBJ
      ?auto_790 - OBJ
      ?auto_791 - OBJ
      ?auto_789 - LOCATION
    )
    :vars
    (
      ?auto_793 - TRUCK
      ?auto_794 - LOCATION
      ?auto_792 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_790 ?auto_788 ) ( GREATER-THAN ?auto_791 ?auto_788 ) ( GREATER-THAN ?auto_791 ?auto_790 ) ( TRUCK-AT ?auto_793 ?auto_794 ) ( IN-CITY ?auto_794 ?auto_792 ) ( IN-CITY ?auto_789 ?auto_792 ) ( not ( = ?auto_789 ?auto_794 ) ) ( OBJ-AT ?auto_791 ?auto_794 ) ( OBJ-AT ?auto_788 ?auto_789 ) ( OBJ-AT ?auto_790 ?auto_789 ) ( not ( = ?auto_788 ?auto_790 ) ) ( not ( = ?auto_788 ?auto_791 ) ) ( not ( = ?auto_790 ?auto_791 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_791 ?auto_789 )
      ( DELIVER-3PKG-VERIFY ?auto_788 ?auto_790 ?auto_791 ?auto_789 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_799 - OBJ
      ?auto_801 - OBJ
      ?auto_802 - OBJ
      ?auto_800 - LOCATION
    )
    :vars
    (
      ?auto_805 - LOCATION
      ?auto_803 - CITY
      ?auto_804 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_801 ?auto_799 ) ( GREATER-THAN ?auto_802 ?auto_799 ) ( GREATER-THAN ?auto_802 ?auto_801 ) ( IN-CITY ?auto_805 ?auto_803 ) ( IN-CITY ?auto_800 ?auto_803 ) ( not ( = ?auto_800 ?auto_805 ) ) ( OBJ-AT ?auto_802 ?auto_805 ) ( TRUCK-AT ?auto_804 ?auto_800 ) ( OBJ-AT ?auto_799 ?auto_800 ) ( OBJ-AT ?auto_801 ?auto_800 ) ( not ( = ?auto_799 ?auto_801 ) ) ( not ( = ?auto_799 ?auto_802 ) ) ( not ( = ?auto_801 ?auto_802 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_802 ?auto_800 )
      ( DELIVER-3PKG-VERIFY ?auto_799 ?auto_801 ?auto_802 ?auto_800 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_810 - OBJ
      ?auto_812 - OBJ
      ?auto_813 - OBJ
      ?auto_811 - LOCATION
    )
    :vars
    (
      ?auto_814 - LOCATION
      ?auto_815 - CITY
      ?auto_816 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_812 ?auto_810 ) ( GREATER-THAN ?auto_813 ?auto_810 ) ( GREATER-THAN ?auto_813 ?auto_812 ) ( IN-CITY ?auto_814 ?auto_815 ) ( IN-CITY ?auto_811 ?auto_815 ) ( not ( = ?auto_811 ?auto_814 ) ) ( OBJ-AT ?auto_813 ?auto_814 ) ( TRUCK-AT ?auto_816 ?auto_811 ) ( OBJ-AT ?auto_810 ?auto_811 ) ( not ( = ?auto_810 ?auto_812 ) ) ( not ( = ?auto_810 ?auto_813 ) ) ( not ( = ?auto_812 ?auto_813 ) ) ( IN-TRUCK ?auto_812 ?auto_816 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_812 ?auto_811 )
      ( DELIVER-3PKG ?auto_810 ?auto_812 ?auto_813 ?auto_811 )
      ( DELIVER-3PKG-VERIFY ?auto_810 ?auto_812 ?auto_813 ?auto_811 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_821 - OBJ
      ?auto_823 - OBJ
      ?auto_824 - OBJ
      ?auto_822 - LOCATION
    )
    :vars
    (
      ?auto_827 - LOCATION
      ?auto_825 - CITY
      ?auto_826 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_823 ?auto_821 ) ( GREATER-THAN ?auto_824 ?auto_821 ) ( GREATER-THAN ?auto_824 ?auto_823 ) ( IN-CITY ?auto_827 ?auto_825 ) ( IN-CITY ?auto_822 ?auto_825 ) ( not ( = ?auto_822 ?auto_827 ) ) ( OBJ-AT ?auto_824 ?auto_827 ) ( OBJ-AT ?auto_821 ?auto_822 ) ( not ( = ?auto_821 ?auto_823 ) ) ( not ( = ?auto_821 ?auto_824 ) ) ( not ( = ?auto_823 ?auto_824 ) ) ( IN-TRUCK ?auto_823 ?auto_826 ) ( TRUCK-AT ?auto_826 ?auto_827 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_826 ?auto_827 ?auto_822 ?auto_825 )
      ( DELIVER-3PKG ?auto_821 ?auto_823 ?auto_824 ?auto_822 )
      ( DELIVER-3PKG-VERIFY ?auto_821 ?auto_823 ?auto_824 ?auto_822 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_832 - OBJ
      ?auto_834 - OBJ
      ?auto_835 - OBJ
      ?auto_833 - LOCATION
    )
    :vars
    (
      ?auto_836 - LOCATION
      ?auto_838 - CITY
      ?auto_837 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_834 ?auto_832 ) ( GREATER-THAN ?auto_835 ?auto_832 ) ( GREATER-THAN ?auto_835 ?auto_834 ) ( IN-CITY ?auto_836 ?auto_838 ) ( IN-CITY ?auto_833 ?auto_838 ) ( not ( = ?auto_833 ?auto_836 ) ) ( OBJ-AT ?auto_835 ?auto_836 ) ( OBJ-AT ?auto_832 ?auto_833 ) ( not ( = ?auto_832 ?auto_834 ) ) ( not ( = ?auto_832 ?auto_835 ) ) ( not ( = ?auto_834 ?auto_835 ) ) ( TRUCK-AT ?auto_837 ?auto_836 ) ( OBJ-AT ?auto_834 ?auto_836 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_834 ?auto_837 ?auto_836 )
      ( DELIVER-3PKG ?auto_832 ?auto_834 ?auto_835 ?auto_833 )
      ( DELIVER-3PKG-VERIFY ?auto_832 ?auto_834 ?auto_835 ?auto_833 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_843 - OBJ
      ?auto_845 - OBJ
      ?auto_846 - OBJ
      ?auto_844 - LOCATION
    )
    :vars
    (
      ?auto_847 - LOCATION
      ?auto_848 - CITY
      ?auto_849 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_845 ?auto_843 ) ( GREATER-THAN ?auto_846 ?auto_843 ) ( GREATER-THAN ?auto_846 ?auto_845 ) ( IN-CITY ?auto_847 ?auto_848 ) ( IN-CITY ?auto_844 ?auto_848 ) ( not ( = ?auto_844 ?auto_847 ) ) ( OBJ-AT ?auto_846 ?auto_847 ) ( OBJ-AT ?auto_843 ?auto_844 ) ( not ( = ?auto_843 ?auto_845 ) ) ( not ( = ?auto_843 ?auto_846 ) ) ( not ( = ?auto_845 ?auto_846 ) ) ( OBJ-AT ?auto_845 ?auto_847 ) ( TRUCK-AT ?auto_849 ?auto_844 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_849 ?auto_844 ?auto_847 ?auto_848 )
      ( DELIVER-3PKG ?auto_843 ?auto_845 ?auto_846 ?auto_844 )
      ( DELIVER-3PKG-VERIFY ?auto_843 ?auto_845 ?auto_846 ?auto_844 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_854 - OBJ
      ?auto_856 - OBJ
      ?auto_857 - OBJ
      ?auto_855 - LOCATION
    )
    :vars
    (
      ?auto_860 - LOCATION
      ?auto_859 - CITY
      ?auto_858 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_856 ?auto_854 ) ( GREATER-THAN ?auto_857 ?auto_854 ) ( GREATER-THAN ?auto_857 ?auto_856 ) ( IN-CITY ?auto_860 ?auto_859 ) ( IN-CITY ?auto_855 ?auto_859 ) ( not ( = ?auto_855 ?auto_860 ) ) ( OBJ-AT ?auto_857 ?auto_860 ) ( not ( = ?auto_854 ?auto_856 ) ) ( not ( = ?auto_854 ?auto_857 ) ) ( not ( = ?auto_856 ?auto_857 ) ) ( OBJ-AT ?auto_856 ?auto_860 ) ( TRUCK-AT ?auto_858 ?auto_855 ) ( IN-TRUCK ?auto_854 ?auto_858 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_854 ?auto_855 )
      ( DELIVER-3PKG ?auto_854 ?auto_856 ?auto_857 ?auto_855 )
      ( DELIVER-3PKG-VERIFY ?auto_854 ?auto_856 ?auto_857 ?auto_855 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_865 - OBJ
      ?auto_867 - OBJ
      ?auto_868 - OBJ
      ?auto_866 - LOCATION
    )
    :vars
    (
      ?auto_871 - LOCATION
      ?auto_870 - CITY
      ?auto_869 - TRUCK
      ?auto_872 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_867 ?auto_865 ) ( GREATER-THAN ?auto_868 ?auto_865 ) ( GREATER-THAN ?auto_868 ?auto_867 ) ( IN-CITY ?auto_871 ?auto_870 ) ( IN-CITY ?auto_866 ?auto_870 ) ( not ( = ?auto_866 ?auto_871 ) ) ( OBJ-AT ?auto_868 ?auto_871 ) ( not ( = ?auto_865 ?auto_867 ) ) ( not ( = ?auto_865 ?auto_868 ) ) ( not ( = ?auto_867 ?auto_868 ) ) ( OBJ-AT ?auto_867 ?auto_871 ) ( IN-TRUCK ?auto_865 ?auto_869 ) ( TRUCK-AT ?auto_869 ?auto_872 ) ( IN-CITY ?auto_872 ?auto_870 ) ( not ( = ?auto_866 ?auto_872 ) ) ( not ( = ?auto_871 ?auto_872 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_869 ?auto_872 ?auto_866 ?auto_870 )
      ( DELIVER-3PKG ?auto_865 ?auto_867 ?auto_868 ?auto_866 )
      ( DELIVER-3PKG-VERIFY ?auto_865 ?auto_867 ?auto_868 ?auto_866 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_877 - OBJ
      ?auto_879 - OBJ
      ?auto_880 - OBJ
      ?auto_878 - LOCATION
    )
    :vars
    (
      ?auto_883 - LOCATION
      ?auto_882 - CITY
      ?auto_884 - TRUCK
      ?auto_881 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_879 ?auto_877 ) ( GREATER-THAN ?auto_880 ?auto_877 ) ( GREATER-THAN ?auto_880 ?auto_879 ) ( IN-CITY ?auto_883 ?auto_882 ) ( IN-CITY ?auto_878 ?auto_882 ) ( not ( = ?auto_878 ?auto_883 ) ) ( OBJ-AT ?auto_880 ?auto_883 ) ( not ( = ?auto_877 ?auto_879 ) ) ( not ( = ?auto_877 ?auto_880 ) ) ( not ( = ?auto_879 ?auto_880 ) ) ( OBJ-AT ?auto_879 ?auto_883 ) ( TRUCK-AT ?auto_884 ?auto_881 ) ( IN-CITY ?auto_881 ?auto_882 ) ( not ( = ?auto_878 ?auto_881 ) ) ( not ( = ?auto_883 ?auto_881 ) ) ( OBJ-AT ?auto_877 ?auto_881 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_877 ?auto_884 ?auto_881 )
      ( DELIVER-3PKG ?auto_877 ?auto_879 ?auto_880 ?auto_878 )
      ( DELIVER-3PKG-VERIFY ?auto_877 ?auto_879 ?auto_880 ?auto_878 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_889 - OBJ
      ?auto_891 - OBJ
      ?auto_892 - OBJ
      ?auto_890 - LOCATION
    )
    :vars
    (
      ?auto_896 - LOCATION
      ?auto_895 - CITY
      ?auto_893 - LOCATION
      ?auto_894 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_891 ?auto_889 ) ( GREATER-THAN ?auto_892 ?auto_889 ) ( GREATER-THAN ?auto_892 ?auto_891 ) ( IN-CITY ?auto_896 ?auto_895 ) ( IN-CITY ?auto_890 ?auto_895 ) ( not ( = ?auto_890 ?auto_896 ) ) ( OBJ-AT ?auto_892 ?auto_896 ) ( not ( = ?auto_889 ?auto_891 ) ) ( not ( = ?auto_889 ?auto_892 ) ) ( not ( = ?auto_891 ?auto_892 ) ) ( OBJ-AT ?auto_891 ?auto_896 ) ( IN-CITY ?auto_893 ?auto_895 ) ( not ( = ?auto_890 ?auto_893 ) ) ( not ( = ?auto_896 ?auto_893 ) ) ( OBJ-AT ?auto_889 ?auto_893 ) ( TRUCK-AT ?auto_894 ?auto_890 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_894 ?auto_890 ?auto_893 ?auto_895 )
      ( DELIVER-3PKG ?auto_889 ?auto_891 ?auto_892 ?auto_890 )
      ( DELIVER-3PKG-VERIFY ?auto_889 ?auto_891 ?auto_892 ?auto_890 ) )
  )

)

