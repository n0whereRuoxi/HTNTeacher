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
      ?auto_14581 - OBJ
      ?auto_14582 - LOCATION
    )
    :vars
    (
      ?auto_14583 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14583 ?auto_14582 ) ( IN-TRUCK ?auto_14581 ?auto_14583 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_14581 ?auto_14583 ?auto_14582 )
      ( DELIVER-1PKG-VERIFY ?auto_14581 ?auto_14582 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14586 - OBJ
      ?auto_14587 - LOCATION
    )
    :vars
    (
      ?auto_14588 - TRUCK
      ?auto_14589 - LOCATION
      ?auto_14590 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14586 ?auto_14588 ) ( TRUCK-AT ?auto_14588 ?auto_14589 ) ( IN-CITY ?auto_14589 ?auto_14590 ) ( IN-CITY ?auto_14587 ?auto_14590 ) ( not ( = ?auto_14587 ?auto_14589 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14588 ?auto_14589 ?auto_14587 ?auto_14590 )
      ( DELIVER-1PKG ?auto_14586 ?auto_14587 )
      ( DELIVER-1PKG-VERIFY ?auto_14586 ?auto_14587 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14593 - OBJ
      ?auto_14594 - LOCATION
    )
    :vars
    (
      ?auto_14595 - TRUCK
      ?auto_14596 - LOCATION
      ?auto_14597 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14595 ?auto_14596 ) ( IN-CITY ?auto_14596 ?auto_14597 ) ( IN-CITY ?auto_14594 ?auto_14597 ) ( not ( = ?auto_14594 ?auto_14596 ) ) ( OBJ-AT ?auto_14593 ?auto_14596 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14593 ?auto_14595 ?auto_14596 )
      ( DELIVER-1PKG ?auto_14593 ?auto_14594 )
      ( DELIVER-1PKG-VERIFY ?auto_14593 ?auto_14594 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14600 - OBJ
      ?auto_14601 - LOCATION
    )
    :vars
    (
      ?auto_14604 - LOCATION
      ?auto_14603 - CITY
      ?auto_14602 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14604 ?auto_14603 ) ( IN-CITY ?auto_14601 ?auto_14603 ) ( not ( = ?auto_14601 ?auto_14604 ) ) ( OBJ-AT ?auto_14600 ?auto_14604 ) ( TRUCK-AT ?auto_14602 ?auto_14601 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14602 ?auto_14601 ?auto_14604 ?auto_14603 )
      ( DELIVER-1PKG ?auto_14600 ?auto_14601 )
      ( DELIVER-1PKG-VERIFY ?auto_14600 ?auto_14601 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14634 - OBJ
      ?auto_14636 - OBJ
      ?auto_14635 - LOCATION
    )
    :vars
    (
      ?auto_14637 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14636 ?auto_14634 ) ( TRUCK-AT ?auto_14637 ?auto_14635 ) ( IN-TRUCK ?auto_14636 ?auto_14637 ) ( OBJ-AT ?auto_14634 ?auto_14635 ) ( not ( = ?auto_14634 ?auto_14636 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14636 ?auto_14635 )
      ( DELIVER-2PKG-VERIFY ?auto_14634 ?auto_14636 ?auto_14635 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14641 - OBJ
      ?auto_14643 - OBJ
      ?auto_14642 - LOCATION
    )
    :vars
    (
      ?auto_14644 - TRUCK
      ?auto_14645 - LOCATION
      ?auto_14646 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14643 ?auto_14641 ) ( IN-TRUCK ?auto_14643 ?auto_14644 ) ( TRUCK-AT ?auto_14644 ?auto_14645 ) ( IN-CITY ?auto_14645 ?auto_14646 ) ( IN-CITY ?auto_14642 ?auto_14646 ) ( not ( = ?auto_14642 ?auto_14645 ) ) ( OBJ-AT ?auto_14641 ?auto_14642 ) ( not ( = ?auto_14641 ?auto_14643 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14643 ?auto_14642 )
      ( DELIVER-2PKG-VERIFY ?auto_14641 ?auto_14643 ?auto_14642 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14650 - OBJ
      ?auto_14652 - OBJ
      ?auto_14651 - LOCATION
    )
    :vars
    (
      ?auto_14655 - TRUCK
      ?auto_14653 - LOCATION
      ?auto_14654 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14652 ?auto_14650 ) ( TRUCK-AT ?auto_14655 ?auto_14653 ) ( IN-CITY ?auto_14653 ?auto_14654 ) ( IN-CITY ?auto_14651 ?auto_14654 ) ( not ( = ?auto_14651 ?auto_14653 ) ) ( OBJ-AT ?auto_14652 ?auto_14653 ) ( OBJ-AT ?auto_14650 ?auto_14651 ) ( not ( = ?auto_14650 ?auto_14652 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14652 ?auto_14651 )
      ( DELIVER-2PKG-VERIFY ?auto_14650 ?auto_14652 ?auto_14651 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14659 - OBJ
      ?auto_14661 - OBJ
      ?auto_14660 - LOCATION
    )
    :vars
    (
      ?auto_14662 - LOCATION
      ?auto_14663 - CITY
      ?auto_14664 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14661 ?auto_14659 ) ( IN-CITY ?auto_14662 ?auto_14663 ) ( IN-CITY ?auto_14660 ?auto_14663 ) ( not ( = ?auto_14660 ?auto_14662 ) ) ( OBJ-AT ?auto_14661 ?auto_14662 ) ( TRUCK-AT ?auto_14664 ?auto_14660 ) ( OBJ-AT ?auto_14659 ?auto_14660 ) ( not ( = ?auto_14659 ?auto_14661 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14661 ?auto_14660 )
      ( DELIVER-2PKG-VERIFY ?auto_14659 ?auto_14661 ?auto_14660 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14668 - OBJ
      ?auto_14670 - OBJ
      ?auto_14669 - LOCATION
    )
    :vars
    (
      ?auto_14672 - LOCATION
      ?auto_14671 - CITY
      ?auto_14673 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14670 ?auto_14668 ) ( IN-CITY ?auto_14672 ?auto_14671 ) ( IN-CITY ?auto_14669 ?auto_14671 ) ( not ( = ?auto_14669 ?auto_14672 ) ) ( OBJ-AT ?auto_14670 ?auto_14672 ) ( TRUCK-AT ?auto_14673 ?auto_14669 ) ( not ( = ?auto_14668 ?auto_14670 ) ) ( IN-TRUCK ?auto_14668 ?auto_14673 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14668 ?auto_14669 )
      ( DELIVER-2PKG ?auto_14668 ?auto_14670 ?auto_14669 )
      ( DELIVER-2PKG-VERIFY ?auto_14668 ?auto_14670 ?auto_14669 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14677 - OBJ
      ?auto_14679 - OBJ
      ?auto_14678 - LOCATION
    )
    :vars
    (
      ?auto_14681 - LOCATION
      ?auto_14680 - CITY
      ?auto_14682 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14679 ?auto_14677 ) ( IN-CITY ?auto_14681 ?auto_14680 ) ( IN-CITY ?auto_14678 ?auto_14680 ) ( not ( = ?auto_14678 ?auto_14681 ) ) ( OBJ-AT ?auto_14679 ?auto_14681 ) ( not ( = ?auto_14677 ?auto_14679 ) ) ( IN-TRUCK ?auto_14677 ?auto_14682 ) ( TRUCK-AT ?auto_14682 ?auto_14681 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14682 ?auto_14681 ?auto_14678 ?auto_14680 )
      ( DELIVER-2PKG ?auto_14677 ?auto_14679 ?auto_14678 )
      ( DELIVER-2PKG-VERIFY ?auto_14677 ?auto_14679 ?auto_14678 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14686 - OBJ
      ?auto_14688 - OBJ
      ?auto_14687 - LOCATION
    )
    :vars
    (
      ?auto_14689 - LOCATION
      ?auto_14690 - CITY
      ?auto_14691 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14688 ?auto_14686 ) ( IN-CITY ?auto_14689 ?auto_14690 ) ( IN-CITY ?auto_14687 ?auto_14690 ) ( not ( = ?auto_14687 ?auto_14689 ) ) ( OBJ-AT ?auto_14688 ?auto_14689 ) ( not ( = ?auto_14686 ?auto_14688 ) ) ( TRUCK-AT ?auto_14691 ?auto_14689 ) ( OBJ-AT ?auto_14686 ?auto_14689 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14686 ?auto_14691 ?auto_14689 )
      ( DELIVER-2PKG ?auto_14686 ?auto_14688 ?auto_14687 )
      ( DELIVER-2PKG-VERIFY ?auto_14686 ?auto_14688 ?auto_14687 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14695 - OBJ
      ?auto_14697 - OBJ
      ?auto_14696 - LOCATION
    )
    :vars
    (
      ?auto_14698 - LOCATION
      ?auto_14699 - CITY
      ?auto_14700 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14697 ?auto_14695 ) ( IN-CITY ?auto_14698 ?auto_14699 ) ( IN-CITY ?auto_14696 ?auto_14699 ) ( not ( = ?auto_14696 ?auto_14698 ) ) ( OBJ-AT ?auto_14697 ?auto_14698 ) ( not ( = ?auto_14695 ?auto_14697 ) ) ( OBJ-AT ?auto_14695 ?auto_14698 ) ( TRUCK-AT ?auto_14700 ?auto_14696 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14700 ?auto_14696 ?auto_14698 ?auto_14699 )
      ( DELIVER-2PKG ?auto_14695 ?auto_14697 ?auto_14696 )
      ( DELIVER-2PKG-VERIFY ?auto_14695 ?auto_14697 ?auto_14696 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14731 - OBJ
      ?auto_14733 - OBJ
      ?auto_14734 - OBJ
      ?auto_14732 - LOCATION
    )
    :vars
    (
      ?auto_14735 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14733 ?auto_14731 ) ( GREATER-THAN ?auto_14734 ?auto_14731 ) ( GREATER-THAN ?auto_14734 ?auto_14733 ) ( TRUCK-AT ?auto_14735 ?auto_14732 ) ( IN-TRUCK ?auto_14734 ?auto_14735 ) ( OBJ-AT ?auto_14731 ?auto_14732 ) ( OBJ-AT ?auto_14733 ?auto_14732 ) ( not ( = ?auto_14731 ?auto_14733 ) ) ( not ( = ?auto_14731 ?auto_14734 ) ) ( not ( = ?auto_14733 ?auto_14734 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14734 ?auto_14732 )
      ( DELIVER-3PKG-VERIFY ?auto_14731 ?auto_14733 ?auto_14734 ?auto_14732 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14740 - OBJ
      ?auto_14742 - OBJ
      ?auto_14743 - OBJ
      ?auto_14741 - LOCATION
    )
    :vars
    (
      ?auto_14745 - TRUCK
      ?auto_14746 - LOCATION
      ?auto_14744 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14742 ?auto_14740 ) ( GREATER-THAN ?auto_14743 ?auto_14740 ) ( GREATER-THAN ?auto_14743 ?auto_14742 ) ( IN-TRUCK ?auto_14743 ?auto_14745 ) ( TRUCK-AT ?auto_14745 ?auto_14746 ) ( IN-CITY ?auto_14746 ?auto_14744 ) ( IN-CITY ?auto_14741 ?auto_14744 ) ( not ( = ?auto_14741 ?auto_14746 ) ) ( OBJ-AT ?auto_14740 ?auto_14741 ) ( OBJ-AT ?auto_14742 ?auto_14741 ) ( not ( = ?auto_14740 ?auto_14742 ) ) ( not ( = ?auto_14740 ?auto_14743 ) ) ( not ( = ?auto_14742 ?auto_14743 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14743 ?auto_14741 )
      ( DELIVER-3PKG-VERIFY ?auto_14740 ?auto_14742 ?auto_14743 ?auto_14741 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14751 - OBJ
      ?auto_14753 - OBJ
      ?auto_14754 - OBJ
      ?auto_14752 - LOCATION
    )
    :vars
    (
      ?auto_14757 - TRUCK
      ?auto_14755 - LOCATION
      ?auto_14756 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14753 ?auto_14751 ) ( GREATER-THAN ?auto_14754 ?auto_14751 ) ( GREATER-THAN ?auto_14754 ?auto_14753 ) ( TRUCK-AT ?auto_14757 ?auto_14755 ) ( IN-CITY ?auto_14755 ?auto_14756 ) ( IN-CITY ?auto_14752 ?auto_14756 ) ( not ( = ?auto_14752 ?auto_14755 ) ) ( OBJ-AT ?auto_14754 ?auto_14755 ) ( OBJ-AT ?auto_14751 ?auto_14752 ) ( OBJ-AT ?auto_14753 ?auto_14752 ) ( not ( = ?auto_14751 ?auto_14753 ) ) ( not ( = ?auto_14751 ?auto_14754 ) ) ( not ( = ?auto_14753 ?auto_14754 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14754 ?auto_14752 )
      ( DELIVER-3PKG-VERIFY ?auto_14751 ?auto_14753 ?auto_14754 ?auto_14752 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14762 - OBJ
      ?auto_14764 - OBJ
      ?auto_14765 - OBJ
      ?auto_14763 - LOCATION
    )
    :vars
    (
      ?auto_14768 - LOCATION
      ?auto_14766 - CITY
      ?auto_14767 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14764 ?auto_14762 ) ( GREATER-THAN ?auto_14765 ?auto_14762 ) ( GREATER-THAN ?auto_14765 ?auto_14764 ) ( IN-CITY ?auto_14768 ?auto_14766 ) ( IN-CITY ?auto_14763 ?auto_14766 ) ( not ( = ?auto_14763 ?auto_14768 ) ) ( OBJ-AT ?auto_14765 ?auto_14768 ) ( TRUCK-AT ?auto_14767 ?auto_14763 ) ( OBJ-AT ?auto_14762 ?auto_14763 ) ( OBJ-AT ?auto_14764 ?auto_14763 ) ( not ( = ?auto_14762 ?auto_14764 ) ) ( not ( = ?auto_14762 ?auto_14765 ) ) ( not ( = ?auto_14764 ?auto_14765 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14765 ?auto_14763 )
      ( DELIVER-3PKG-VERIFY ?auto_14762 ?auto_14764 ?auto_14765 ?auto_14763 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14773 - OBJ
      ?auto_14775 - OBJ
      ?auto_14776 - OBJ
      ?auto_14774 - LOCATION
    )
    :vars
    (
      ?auto_14777 - LOCATION
      ?auto_14778 - CITY
      ?auto_14779 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14775 ?auto_14773 ) ( GREATER-THAN ?auto_14776 ?auto_14773 ) ( GREATER-THAN ?auto_14776 ?auto_14775 ) ( IN-CITY ?auto_14777 ?auto_14778 ) ( IN-CITY ?auto_14774 ?auto_14778 ) ( not ( = ?auto_14774 ?auto_14777 ) ) ( OBJ-AT ?auto_14776 ?auto_14777 ) ( TRUCK-AT ?auto_14779 ?auto_14774 ) ( OBJ-AT ?auto_14773 ?auto_14774 ) ( not ( = ?auto_14773 ?auto_14775 ) ) ( not ( = ?auto_14773 ?auto_14776 ) ) ( not ( = ?auto_14775 ?auto_14776 ) ) ( IN-TRUCK ?auto_14775 ?auto_14779 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14775 ?auto_14774 )
      ( DELIVER-3PKG ?auto_14773 ?auto_14775 ?auto_14776 ?auto_14774 )
      ( DELIVER-3PKG-VERIFY ?auto_14773 ?auto_14775 ?auto_14776 ?auto_14774 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14784 - OBJ
      ?auto_14786 - OBJ
      ?auto_14787 - OBJ
      ?auto_14785 - LOCATION
    )
    :vars
    (
      ?auto_14789 - LOCATION
      ?auto_14788 - CITY
      ?auto_14790 - TRUCK
      ?auto_14791 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14786 ?auto_14784 ) ( GREATER-THAN ?auto_14787 ?auto_14784 ) ( GREATER-THAN ?auto_14787 ?auto_14786 ) ( IN-CITY ?auto_14789 ?auto_14788 ) ( IN-CITY ?auto_14785 ?auto_14788 ) ( not ( = ?auto_14785 ?auto_14789 ) ) ( OBJ-AT ?auto_14787 ?auto_14789 ) ( OBJ-AT ?auto_14784 ?auto_14785 ) ( not ( = ?auto_14784 ?auto_14786 ) ) ( not ( = ?auto_14784 ?auto_14787 ) ) ( not ( = ?auto_14786 ?auto_14787 ) ) ( IN-TRUCK ?auto_14786 ?auto_14790 ) ( TRUCK-AT ?auto_14790 ?auto_14791 ) ( IN-CITY ?auto_14791 ?auto_14788 ) ( not ( = ?auto_14785 ?auto_14791 ) ) ( not ( = ?auto_14789 ?auto_14791 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14790 ?auto_14791 ?auto_14785 ?auto_14788 )
      ( DELIVER-3PKG ?auto_14784 ?auto_14786 ?auto_14787 ?auto_14785 )
      ( DELIVER-3PKG-VERIFY ?auto_14784 ?auto_14786 ?auto_14787 ?auto_14785 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14796 - OBJ
      ?auto_14798 - OBJ
      ?auto_14799 - OBJ
      ?auto_14797 - LOCATION
    )
    :vars
    (
      ?auto_14802 - LOCATION
      ?auto_14800 - CITY
      ?auto_14801 - TRUCK
      ?auto_14803 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14798 ?auto_14796 ) ( GREATER-THAN ?auto_14799 ?auto_14796 ) ( GREATER-THAN ?auto_14799 ?auto_14798 ) ( IN-CITY ?auto_14802 ?auto_14800 ) ( IN-CITY ?auto_14797 ?auto_14800 ) ( not ( = ?auto_14797 ?auto_14802 ) ) ( OBJ-AT ?auto_14799 ?auto_14802 ) ( OBJ-AT ?auto_14796 ?auto_14797 ) ( not ( = ?auto_14796 ?auto_14798 ) ) ( not ( = ?auto_14796 ?auto_14799 ) ) ( not ( = ?auto_14798 ?auto_14799 ) ) ( TRUCK-AT ?auto_14801 ?auto_14803 ) ( IN-CITY ?auto_14803 ?auto_14800 ) ( not ( = ?auto_14797 ?auto_14803 ) ) ( not ( = ?auto_14802 ?auto_14803 ) ) ( OBJ-AT ?auto_14798 ?auto_14803 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14798 ?auto_14801 ?auto_14803 )
      ( DELIVER-3PKG ?auto_14796 ?auto_14798 ?auto_14799 ?auto_14797 )
      ( DELIVER-3PKG-VERIFY ?auto_14796 ?auto_14798 ?auto_14799 ?auto_14797 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14808 - OBJ
      ?auto_14810 - OBJ
      ?auto_14811 - OBJ
      ?auto_14809 - LOCATION
    )
    :vars
    (
      ?auto_14812 - LOCATION
      ?auto_14815 - CITY
      ?auto_14813 - LOCATION
      ?auto_14814 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14810 ?auto_14808 ) ( GREATER-THAN ?auto_14811 ?auto_14808 ) ( GREATER-THAN ?auto_14811 ?auto_14810 ) ( IN-CITY ?auto_14812 ?auto_14815 ) ( IN-CITY ?auto_14809 ?auto_14815 ) ( not ( = ?auto_14809 ?auto_14812 ) ) ( OBJ-AT ?auto_14811 ?auto_14812 ) ( OBJ-AT ?auto_14808 ?auto_14809 ) ( not ( = ?auto_14808 ?auto_14810 ) ) ( not ( = ?auto_14808 ?auto_14811 ) ) ( not ( = ?auto_14810 ?auto_14811 ) ) ( IN-CITY ?auto_14813 ?auto_14815 ) ( not ( = ?auto_14809 ?auto_14813 ) ) ( not ( = ?auto_14812 ?auto_14813 ) ) ( OBJ-AT ?auto_14810 ?auto_14813 ) ( TRUCK-AT ?auto_14814 ?auto_14809 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14814 ?auto_14809 ?auto_14813 ?auto_14815 )
      ( DELIVER-3PKG ?auto_14808 ?auto_14810 ?auto_14811 ?auto_14809 )
      ( DELIVER-3PKG-VERIFY ?auto_14808 ?auto_14810 ?auto_14811 ?auto_14809 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14820 - OBJ
      ?auto_14822 - OBJ
      ?auto_14823 - OBJ
      ?auto_14821 - LOCATION
    )
    :vars
    (
      ?auto_14825 - LOCATION
      ?auto_14826 - CITY
      ?auto_14824 - LOCATION
      ?auto_14827 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14822 ?auto_14820 ) ( GREATER-THAN ?auto_14823 ?auto_14820 ) ( GREATER-THAN ?auto_14823 ?auto_14822 ) ( IN-CITY ?auto_14825 ?auto_14826 ) ( IN-CITY ?auto_14821 ?auto_14826 ) ( not ( = ?auto_14821 ?auto_14825 ) ) ( OBJ-AT ?auto_14823 ?auto_14825 ) ( not ( = ?auto_14820 ?auto_14822 ) ) ( not ( = ?auto_14820 ?auto_14823 ) ) ( not ( = ?auto_14822 ?auto_14823 ) ) ( IN-CITY ?auto_14824 ?auto_14826 ) ( not ( = ?auto_14821 ?auto_14824 ) ) ( not ( = ?auto_14825 ?auto_14824 ) ) ( OBJ-AT ?auto_14822 ?auto_14824 ) ( TRUCK-AT ?auto_14827 ?auto_14821 ) ( IN-TRUCK ?auto_14820 ?auto_14827 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14820 ?auto_14821 )
      ( DELIVER-3PKG ?auto_14820 ?auto_14822 ?auto_14823 ?auto_14821 )
      ( DELIVER-3PKG-VERIFY ?auto_14820 ?auto_14822 ?auto_14823 ?auto_14821 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14832 - OBJ
      ?auto_14834 - OBJ
      ?auto_14835 - OBJ
      ?auto_14833 - LOCATION
    )
    :vars
    (
      ?auto_14836 - LOCATION
      ?auto_14838 - CITY
      ?auto_14837 - LOCATION
      ?auto_14839 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14834 ?auto_14832 ) ( GREATER-THAN ?auto_14835 ?auto_14832 ) ( GREATER-THAN ?auto_14835 ?auto_14834 ) ( IN-CITY ?auto_14836 ?auto_14838 ) ( IN-CITY ?auto_14833 ?auto_14838 ) ( not ( = ?auto_14833 ?auto_14836 ) ) ( OBJ-AT ?auto_14835 ?auto_14836 ) ( not ( = ?auto_14832 ?auto_14834 ) ) ( not ( = ?auto_14832 ?auto_14835 ) ) ( not ( = ?auto_14834 ?auto_14835 ) ) ( IN-CITY ?auto_14837 ?auto_14838 ) ( not ( = ?auto_14833 ?auto_14837 ) ) ( not ( = ?auto_14836 ?auto_14837 ) ) ( OBJ-AT ?auto_14834 ?auto_14837 ) ( IN-TRUCK ?auto_14832 ?auto_14839 ) ( TRUCK-AT ?auto_14839 ?auto_14837 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14839 ?auto_14837 ?auto_14833 ?auto_14838 )
      ( DELIVER-3PKG ?auto_14832 ?auto_14834 ?auto_14835 ?auto_14833 )
      ( DELIVER-3PKG-VERIFY ?auto_14832 ?auto_14834 ?auto_14835 ?auto_14833 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14844 - OBJ
      ?auto_14846 - OBJ
      ?auto_14847 - OBJ
      ?auto_14845 - LOCATION
    )
    :vars
    (
      ?auto_14850 - LOCATION
      ?auto_14848 - CITY
      ?auto_14849 - LOCATION
      ?auto_14851 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14846 ?auto_14844 ) ( GREATER-THAN ?auto_14847 ?auto_14844 ) ( GREATER-THAN ?auto_14847 ?auto_14846 ) ( IN-CITY ?auto_14850 ?auto_14848 ) ( IN-CITY ?auto_14845 ?auto_14848 ) ( not ( = ?auto_14845 ?auto_14850 ) ) ( OBJ-AT ?auto_14847 ?auto_14850 ) ( not ( = ?auto_14844 ?auto_14846 ) ) ( not ( = ?auto_14844 ?auto_14847 ) ) ( not ( = ?auto_14846 ?auto_14847 ) ) ( IN-CITY ?auto_14849 ?auto_14848 ) ( not ( = ?auto_14845 ?auto_14849 ) ) ( not ( = ?auto_14850 ?auto_14849 ) ) ( OBJ-AT ?auto_14846 ?auto_14849 ) ( TRUCK-AT ?auto_14851 ?auto_14849 ) ( OBJ-AT ?auto_14844 ?auto_14849 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14844 ?auto_14851 ?auto_14849 )
      ( DELIVER-3PKG ?auto_14844 ?auto_14846 ?auto_14847 ?auto_14845 )
      ( DELIVER-3PKG-VERIFY ?auto_14844 ?auto_14846 ?auto_14847 ?auto_14845 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14856 - OBJ
      ?auto_14858 - OBJ
      ?auto_14859 - OBJ
      ?auto_14857 - LOCATION
    )
    :vars
    (
      ?auto_14861 - LOCATION
      ?auto_14863 - CITY
      ?auto_14862 - LOCATION
      ?auto_14860 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14858 ?auto_14856 ) ( GREATER-THAN ?auto_14859 ?auto_14856 ) ( GREATER-THAN ?auto_14859 ?auto_14858 ) ( IN-CITY ?auto_14861 ?auto_14863 ) ( IN-CITY ?auto_14857 ?auto_14863 ) ( not ( = ?auto_14857 ?auto_14861 ) ) ( OBJ-AT ?auto_14859 ?auto_14861 ) ( not ( = ?auto_14856 ?auto_14858 ) ) ( not ( = ?auto_14856 ?auto_14859 ) ) ( not ( = ?auto_14858 ?auto_14859 ) ) ( IN-CITY ?auto_14862 ?auto_14863 ) ( not ( = ?auto_14857 ?auto_14862 ) ) ( not ( = ?auto_14861 ?auto_14862 ) ) ( OBJ-AT ?auto_14858 ?auto_14862 ) ( OBJ-AT ?auto_14856 ?auto_14862 ) ( TRUCK-AT ?auto_14860 ?auto_14857 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14860 ?auto_14857 ?auto_14862 ?auto_14863 )
      ( DELIVER-3PKG ?auto_14856 ?auto_14858 ?auto_14859 ?auto_14857 )
      ( DELIVER-3PKG-VERIFY ?auto_14856 ?auto_14858 ?auto_14859 ?auto_14857 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14895 - OBJ
      ?auto_14897 - OBJ
      ?auto_14898 - OBJ
      ?auto_14899 - OBJ
      ?auto_14896 - LOCATION
    )
    :vars
    (
      ?auto_14900 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14897 ?auto_14895 ) ( GREATER-THAN ?auto_14898 ?auto_14895 ) ( GREATER-THAN ?auto_14898 ?auto_14897 ) ( GREATER-THAN ?auto_14899 ?auto_14895 ) ( GREATER-THAN ?auto_14899 ?auto_14897 ) ( GREATER-THAN ?auto_14899 ?auto_14898 ) ( TRUCK-AT ?auto_14900 ?auto_14896 ) ( IN-TRUCK ?auto_14899 ?auto_14900 ) ( OBJ-AT ?auto_14895 ?auto_14896 ) ( OBJ-AT ?auto_14897 ?auto_14896 ) ( OBJ-AT ?auto_14898 ?auto_14896 ) ( not ( = ?auto_14895 ?auto_14897 ) ) ( not ( = ?auto_14895 ?auto_14898 ) ) ( not ( = ?auto_14895 ?auto_14899 ) ) ( not ( = ?auto_14897 ?auto_14898 ) ) ( not ( = ?auto_14897 ?auto_14899 ) ) ( not ( = ?auto_14898 ?auto_14899 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14899 ?auto_14896 )
      ( DELIVER-4PKG-VERIFY ?auto_14895 ?auto_14897 ?auto_14898 ?auto_14899 ?auto_14896 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14906 - OBJ
      ?auto_14908 - OBJ
      ?auto_14909 - OBJ
      ?auto_14910 - OBJ
      ?auto_14907 - LOCATION
    )
    :vars
    (
      ?auto_14911 - TRUCK
      ?auto_14912 - LOCATION
      ?auto_14913 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14908 ?auto_14906 ) ( GREATER-THAN ?auto_14909 ?auto_14906 ) ( GREATER-THAN ?auto_14909 ?auto_14908 ) ( GREATER-THAN ?auto_14910 ?auto_14906 ) ( GREATER-THAN ?auto_14910 ?auto_14908 ) ( GREATER-THAN ?auto_14910 ?auto_14909 ) ( IN-TRUCK ?auto_14910 ?auto_14911 ) ( TRUCK-AT ?auto_14911 ?auto_14912 ) ( IN-CITY ?auto_14912 ?auto_14913 ) ( IN-CITY ?auto_14907 ?auto_14913 ) ( not ( = ?auto_14907 ?auto_14912 ) ) ( OBJ-AT ?auto_14906 ?auto_14907 ) ( OBJ-AT ?auto_14908 ?auto_14907 ) ( OBJ-AT ?auto_14909 ?auto_14907 ) ( not ( = ?auto_14906 ?auto_14908 ) ) ( not ( = ?auto_14906 ?auto_14909 ) ) ( not ( = ?auto_14906 ?auto_14910 ) ) ( not ( = ?auto_14908 ?auto_14909 ) ) ( not ( = ?auto_14908 ?auto_14910 ) ) ( not ( = ?auto_14909 ?auto_14910 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14910 ?auto_14907 )
      ( DELIVER-4PKG-VERIFY ?auto_14906 ?auto_14908 ?auto_14909 ?auto_14910 ?auto_14907 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14919 - OBJ
      ?auto_14921 - OBJ
      ?auto_14922 - OBJ
      ?auto_14923 - OBJ
      ?auto_14920 - LOCATION
    )
    :vars
    (
      ?auto_14924 - TRUCK
      ?auto_14926 - LOCATION
      ?auto_14925 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14921 ?auto_14919 ) ( GREATER-THAN ?auto_14922 ?auto_14919 ) ( GREATER-THAN ?auto_14922 ?auto_14921 ) ( GREATER-THAN ?auto_14923 ?auto_14919 ) ( GREATER-THAN ?auto_14923 ?auto_14921 ) ( GREATER-THAN ?auto_14923 ?auto_14922 ) ( TRUCK-AT ?auto_14924 ?auto_14926 ) ( IN-CITY ?auto_14926 ?auto_14925 ) ( IN-CITY ?auto_14920 ?auto_14925 ) ( not ( = ?auto_14920 ?auto_14926 ) ) ( OBJ-AT ?auto_14923 ?auto_14926 ) ( OBJ-AT ?auto_14919 ?auto_14920 ) ( OBJ-AT ?auto_14921 ?auto_14920 ) ( OBJ-AT ?auto_14922 ?auto_14920 ) ( not ( = ?auto_14919 ?auto_14921 ) ) ( not ( = ?auto_14919 ?auto_14922 ) ) ( not ( = ?auto_14919 ?auto_14923 ) ) ( not ( = ?auto_14921 ?auto_14922 ) ) ( not ( = ?auto_14921 ?auto_14923 ) ) ( not ( = ?auto_14922 ?auto_14923 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14923 ?auto_14920 )
      ( DELIVER-4PKG-VERIFY ?auto_14919 ?auto_14921 ?auto_14922 ?auto_14923 ?auto_14920 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14932 - OBJ
      ?auto_14934 - OBJ
      ?auto_14935 - OBJ
      ?auto_14936 - OBJ
      ?auto_14933 - LOCATION
    )
    :vars
    (
      ?auto_14938 - LOCATION
      ?auto_14939 - CITY
      ?auto_14937 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14934 ?auto_14932 ) ( GREATER-THAN ?auto_14935 ?auto_14932 ) ( GREATER-THAN ?auto_14935 ?auto_14934 ) ( GREATER-THAN ?auto_14936 ?auto_14932 ) ( GREATER-THAN ?auto_14936 ?auto_14934 ) ( GREATER-THAN ?auto_14936 ?auto_14935 ) ( IN-CITY ?auto_14938 ?auto_14939 ) ( IN-CITY ?auto_14933 ?auto_14939 ) ( not ( = ?auto_14933 ?auto_14938 ) ) ( OBJ-AT ?auto_14936 ?auto_14938 ) ( TRUCK-AT ?auto_14937 ?auto_14933 ) ( OBJ-AT ?auto_14932 ?auto_14933 ) ( OBJ-AT ?auto_14934 ?auto_14933 ) ( OBJ-AT ?auto_14935 ?auto_14933 ) ( not ( = ?auto_14932 ?auto_14934 ) ) ( not ( = ?auto_14932 ?auto_14935 ) ) ( not ( = ?auto_14932 ?auto_14936 ) ) ( not ( = ?auto_14934 ?auto_14935 ) ) ( not ( = ?auto_14934 ?auto_14936 ) ) ( not ( = ?auto_14935 ?auto_14936 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14936 ?auto_14933 )
      ( DELIVER-4PKG-VERIFY ?auto_14932 ?auto_14934 ?auto_14935 ?auto_14936 ?auto_14933 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14945 - OBJ
      ?auto_14947 - OBJ
      ?auto_14948 - OBJ
      ?auto_14949 - OBJ
      ?auto_14946 - LOCATION
    )
    :vars
    (
      ?auto_14951 - LOCATION
      ?auto_14952 - CITY
      ?auto_14950 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14947 ?auto_14945 ) ( GREATER-THAN ?auto_14948 ?auto_14945 ) ( GREATER-THAN ?auto_14948 ?auto_14947 ) ( GREATER-THAN ?auto_14949 ?auto_14945 ) ( GREATER-THAN ?auto_14949 ?auto_14947 ) ( GREATER-THAN ?auto_14949 ?auto_14948 ) ( IN-CITY ?auto_14951 ?auto_14952 ) ( IN-CITY ?auto_14946 ?auto_14952 ) ( not ( = ?auto_14946 ?auto_14951 ) ) ( OBJ-AT ?auto_14949 ?auto_14951 ) ( TRUCK-AT ?auto_14950 ?auto_14946 ) ( OBJ-AT ?auto_14945 ?auto_14946 ) ( OBJ-AT ?auto_14947 ?auto_14946 ) ( not ( = ?auto_14945 ?auto_14947 ) ) ( not ( = ?auto_14945 ?auto_14948 ) ) ( not ( = ?auto_14945 ?auto_14949 ) ) ( not ( = ?auto_14947 ?auto_14948 ) ) ( not ( = ?auto_14947 ?auto_14949 ) ) ( not ( = ?auto_14948 ?auto_14949 ) ) ( IN-TRUCK ?auto_14948 ?auto_14950 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14948 ?auto_14946 )
      ( DELIVER-4PKG ?auto_14945 ?auto_14947 ?auto_14948 ?auto_14949 ?auto_14946 )
      ( DELIVER-4PKG-VERIFY ?auto_14945 ?auto_14947 ?auto_14948 ?auto_14949 ?auto_14946 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14958 - OBJ
      ?auto_14960 - OBJ
      ?auto_14961 - OBJ
      ?auto_14962 - OBJ
      ?auto_14959 - LOCATION
    )
    :vars
    (
      ?auto_14964 - LOCATION
      ?auto_14965 - CITY
      ?auto_14963 - TRUCK
      ?auto_14966 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14960 ?auto_14958 ) ( GREATER-THAN ?auto_14961 ?auto_14958 ) ( GREATER-THAN ?auto_14961 ?auto_14960 ) ( GREATER-THAN ?auto_14962 ?auto_14958 ) ( GREATER-THAN ?auto_14962 ?auto_14960 ) ( GREATER-THAN ?auto_14962 ?auto_14961 ) ( IN-CITY ?auto_14964 ?auto_14965 ) ( IN-CITY ?auto_14959 ?auto_14965 ) ( not ( = ?auto_14959 ?auto_14964 ) ) ( OBJ-AT ?auto_14962 ?auto_14964 ) ( OBJ-AT ?auto_14958 ?auto_14959 ) ( OBJ-AT ?auto_14960 ?auto_14959 ) ( not ( = ?auto_14958 ?auto_14960 ) ) ( not ( = ?auto_14958 ?auto_14961 ) ) ( not ( = ?auto_14958 ?auto_14962 ) ) ( not ( = ?auto_14960 ?auto_14961 ) ) ( not ( = ?auto_14960 ?auto_14962 ) ) ( not ( = ?auto_14961 ?auto_14962 ) ) ( IN-TRUCK ?auto_14961 ?auto_14963 ) ( TRUCK-AT ?auto_14963 ?auto_14966 ) ( IN-CITY ?auto_14966 ?auto_14965 ) ( not ( = ?auto_14959 ?auto_14966 ) ) ( not ( = ?auto_14964 ?auto_14966 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14963 ?auto_14966 ?auto_14959 ?auto_14965 )
      ( DELIVER-4PKG ?auto_14958 ?auto_14960 ?auto_14961 ?auto_14962 ?auto_14959 )
      ( DELIVER-4PKG-VERIFY ?auto_14958 ?auto_14960 ?auto_14961 ?auto_14962 ?auto_14959 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14972 - OBJ
      ?auto_14974 - OBJ
      ?auto_14975 - OBJ
      ?auto_14976 - OBJ
      ?auto_14973 - LOCATION
    )
    :vars
    (
      ?auto_14980 - LOCATION
      ?auto_14978 - CITY
      ?auto_14977 - TRUCK
      ?auto_14979 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14974 ?auto_14972 ) ( GREATER-THAN ?auto_14975 ?auto_14972 ) ( GREATER-THAN ?auto_14975 ?auto_14974 ) ( GREATER-THAN ?auto_14976 ?auto_14972 ) ( GREATER-THAN ?auto_14976 ?auto_14974 ) ( GREATER-THAN ?auto_14976 ?auto_14975 ) ( IN-CITY ?auto_14980 ?auto_14978 ) ( IN-CITY ?auto_14973 ?auto_14978 ) ( not ( = ?auto_14973 ?auto_14980 ) ) ( OBJ-AT ?auto_14976 ?auto_14980 ) ( OBJ-AT ?auto_14972 ?auto_14973 ) ( OBJ-AT ?auto_14974 ?auto_14973 ) ( not ( = ?auto_14972 ?auto_14974 ) ) ( not ( = ?auto_14972 ?auto_14975 ) ) ( not ( = ?auto_14972 ?auto_14976 ) ) ( not ( = ?auto_14974 ?auto_14975 ) ) ( not ( = ?auto_14974 ?auto_14976 ) ) ( not ( = ?auto_14975 ?auto_14976 ) ) ( TRUCK-AT ?auto_14977 ?auto_14979 ) ( IN-CITY ?auto_14979 ?auto_14978 ) ( not ( = ?auto_14973 ?auto_14979 ) ) ( not ( = ?auto_14980 ?auto_14979 ) ) ( OBJ-AT ?auto_14975 ?auto_14979 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14975 ?auto_14977 ?auto_14979 )
      ( DELIVER-4PKG ?auto_14972 ?auto_14974 ?auto_14975 ?auto_14976 ?auto_14973 )
      ( DELIVER-4PKG-VERIFY ?auto_14972 ?auto_14974 ?auto_14975 ?auto_14976 ?auto_14973 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14986 - OBJ
      ?auto_14988 - OBJ
      ?auto_14989 - OBJ
      ?auto_14990 - OBJ
      ?auto_14987 - LOCATION
    )
    :vars
    (
      ?auto_14992 - LOCATION
      ?auto_14994 - CITY
      ?auto_14993 - LOCATION
      ?auto_14991 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_14988 ?auto_14986 ) ( GREATER-THAN ?auto_14989 ?auto_14986 ) ( GREATER-THAN ?auto_14989 ?auto_14988 ) ( GREATER-THAN ?auto_14990 ?auto_14986 ) ( GREATER-THAN ?auto_14990 ?auto_14988 ) ( GREATER-THAN ?auto_14990 ?auto_14989 ) ( IN-CITY ?auto_14992 ?auto_14994 ) ( IN-CITY ?auto_14987 ?auto_14994 ) ( not ( = ?auto_14987 ?auto_14992 ) ) ( OBJ-AT ?auto_14990 ?auto_14992 ) ( OBJ-AT ?auto_14986 ?auto_14987 ) ( OBJ-AT ?auto_14988 ?auto_14987 ) ( not ( = ?auto_14986 ?auto_14988 ) ) ( not ( = ?auto_14986 ?auto_14989 ) ) ( not ( = ?auto_14986 ?auto_14990 ) ) ( not ( = ?auto_14988 ?auto_14989 ) ) ( not ( = ?auto_14988 ?auto_14990 ) ) ( not ( = ?auto_14989 ?auto_14990 ) ) ( IN-CITY ?auto_14993 ?auto_14994 ) ( not ( = ?auto_14987 ?auto_14993 ) ) ( not ( = ?auto_14992 ?auto_14993 ) ) ( OBJ-AT ?auto_14989 ?auto_14993 ) ( TRUCK-AT ?auto_14991 ?auto_14987 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14991 ?auto_14987 ?auto_14993 ?auto_14994 )
      ( DELIVER-4PKG ?auto_14986 ?auto_14988 ?auto_14989 ?auto_14990 ?auto_14987 )
      ( DELIVER-4PKG-VERIFY ?auto_14986 ?auto_14988 ?auto_14989 ?auto_14990 ?auto_14987 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15000 - OBJ
      ?auto_15002 - OBJ
      ?auto_15003 - OBJ
      ?auto_15004 - OBJ
      ?auto_15001 - LOCATION
    )
    :vars
    (
      ?auto_15008 - LOCATION
      ?auto_15007 - CITY
      ?auto_15006 - LOCATION
      ?auto_15005 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15002 ?auto_15000 ) ( GREATER-THAN ?auto_15003 ?auto_15000 ) ( GREATER-THAN ?auto_15003 ?auto_15002 ) ( GREATER-THAN ?auto_15004 ?auto_15000 ) ( GREATER-THAN ?auto_15004 ?auto_15002 ) ( GREATER-THAN ?auto_15004 ?auto_15003 ) ( IN-CITY ?auto_15008 ?auto_15007 ) ( IN-CITY ?auto_15001 ?auto_15007 ) ( not ( = ?auto_15001 ?auto_15008 ) ) ( OBJ-AT ?auto_15004 ?auto_15008 ) ( OBJ-AT ?auto_15000 ?auto_15001 ) ( not ( = ?auto_15000 ?auto_15002 ) ) ( not ( = ?auto_15000 ?auto_15003 ) ) ( not ( = ?auto_15000 ?auto_15004 ) ) ( not ( = ?auto_15002 ?auto_15003 ) ) ( not ( = ?auto_15002 ?auto_15004 ) ) ( not ( = ?auto_15003 ?auto_15004 ) ) ( IN-CITY ?auto_15006 ?auto_15007 ) ( not ( = ?auto_15001 ?auto_15006 ) ) ( not ( = ?auto_15008 ?auto_15006 ) ) ( OBJ-AT ?auto_15003 ?auto_15006 ) ( TRUCK-AT ?auto_15005 ?auto_15001 ) ( IN-TRUCK ?auto_15002 ?auto_15005 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15002 ?auto_15001 )
      ( DELIVER-4PKG ?auto_15000 ?auto_15002 ?auto_15003 ?auto_15004 ?auto_15001 )
      ( DELIVER-4PKG-VERIFY ?auto_15000 ?auto_15002 ?auto_15003 ?auto_15004 ?auto_15001 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15014 - OBJ
      ?auto_15016 - OBJ
      ?auto_15017 - OBJ
      ?auto_15018 - OBJ
      ?auto_15015 - LOCATION
    )
    :vars
    (
      ?auto_15020 - LOCATION
      ?auto_15022 - CITY
      ?auto_15021 - LOCATION
      ?auto_15019 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15016 ?auto_15014 ) ( GREATER-THAN ?auto_15017 ?auto_15014 ) ( GREATER-THAN ?auto_15017 ?auto_15016 ) ( GREATER-THAN ?auto_15018 ?auto_15014 ) ( GREATER-THAN ?auto_15018 ?auto_15016 ) ( GREATER-THAN ?auto_15018 ?auto_15017 ) ( IN-CITY ?auto_15020 ?auto_15022 ) ( IN-CITY ?auto_15015 ?auto_15022 ) ( not ( = ?auto_15015 ?auto_15020 ) ) ( OBJ-AT ?auto_15018 ?auto_15020 ) ( OBJ-AT ?auto_15014 ?auto_15015 ) ( not ( = ?auto_15014 ?auto_15016 ) ) ( not ( = ?auto_15014 ?auto_15017 ) ) ( not ( = ?auto_15014 ?auto_15018 ) ) ( not ( = ?auto_15016 ?auto_15017 ) ) ( not ( = ?auto_15016 ?auto_15018 ) ) ( not ( = ?auto_15017 ?auto_15018 ) ) ( IN-CITY ?auto_15021 ?auto_15022 ) ( not ( = ?auto_15015 ?auto_15021 ) ) ( not ( = ?auto_15020 ?auto_15021 ) ) ( OBJ-AT ?auto_15017 ?auto_15021 ) ( IN-TRUCK ?auto_15016 ?auto_15019 ) ( TRUCK-AT ?auto_15019 ?auto_15020 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15019 ?auto_15020 ?auto_15015 ?auto_15022 )
      ( DELIVER-4PKG ?auto_15014 ?auto_15016 ?auto_15017 ?auto_15018 ?auto_15015 )
      ( DELIVER-4PKG-VERIFY ?auto_15014 ?auto_15016 ?auto_15017 ?auto_15018 ?auto_15015 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15028 - OBJ
      ?auto_15030 - OBJ
      ?auto_15031 - OBJ
      ?auto_15032 - OBJ
      ?auto_15029 - LOCATION
    )
    :vars
    (
      ?auto_15035 - LOCATION
      ?auto_15034 - CITY
      ?auto_15036 - LOCATION
      ?auto_15033 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15030 ?auto_15028 ) ( GREATER-THAN ?auto_15031 ?auto_15028 ) ( GREATER-THAN ?auto_15031 ?auto_15030 ) ( GREATER-THAN ?auto_15032 ?auto_15028 ) ( GREATER-THAN ?auto_15032 ?auto_15030 ) ( GREATER-THAN ?auto_15032 ?auto_15031 ) ( IN-CITY ?auto_15035 ?auto_15034 ) ( IN-CITY ?auto_15029 ?auto_15034 ) ( not ( = ?auto_15029 ?auto_15035 ) ) ( OBJ-AT ?auto_15032 ?auto_15035 ) ( OBJ-AT ?auto_15028 ?auto_15029 ) ( not ( = ?auto_15028 ?auto_15030 ) ) ( not ( = ?auto_15028 ?auto_15031 ) ) ( not ( = ?auto_15028 ?auto_15032 ) ) ( not ( = ?auto_15030 ?auto_15031 ) ) ( not ( = ?auto_15030 ?auto_15032 ) ) ( not ( = ?auto_15031 ?auto_15032 ) ) ( IN-CITY ?auto_15036 ?auto_15034 ) ( not ( = ?auto_15029 ?auto_15036 ) ) ( not ( = ?auto_15035 ?auto_15036 ) ) ( OBJ-AT ?auto_15031 ?auto_15036 ) ( TRUCK-AT ?auto_15033 ?auto_15035 ) ( OBJ-AT ?auto_15030 ?auto_15035 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15030 ?auto_15033 ?auto_15035 )
      ( DELIVER-4PKG ?auto_15028 ?auto_15030 ?auto_15031 ?auto_15032 ?auto_15029 )
      ( DELIVER-4PKG-VERIFY ?auto_15028 ?auto_15030 ?auto_15031 ?auto_15032 ?auto_15029 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15042 - OBJ
      ?auto_15044 - OBJ
      ?auto_15045 - OBJ
      ?auto_15046 - OBJ
      ?auto_15043 - LOCATION
    )
    :vars
    (
      ?auto_15049 - LOCATION
      ?auto_15050 - CITY
      ?auto_15048 - LOCATION
      ?auto_15047 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15044 ?auto_15042 ) ( GREATER-THAN ?auto_15045 ?auto_15042 ) ( GREATER-THAN ?auto_15045 ?auto_15044 ) ( GREATER-THAN ?auto_15046 ?auto_15042 ) ( GREATER-THAN ?auto_15046 ?auto_15044 ) ( GREATER-THAN ?auto_15046 ?auto_15045 ) ( IN-CITY ?auto_15049 ?auto_15050 ) ( IN-CITY ?auto_15043 ?auto_15050 ) ( not ( = ?auto_15043 ?auto_15049 ) ) ( OBJ-AT ?auto_15046 ?auto_15049 ) ( OBJ-AT ?auto_15042 ?auto_15043 ) ( not ( = ?auto_15042 ?auto_15044 ) ) ( not ( = ?auto_15042 ?auto_15045 ) ) ( not ( = ?auto_15042 ?auto_15046 ) ) ( not ( = ?auto_15044 ?auto_15045 ) ) ( not ( = ?auto_15044 ?auto_15046 ) ) ( not ( = ?auto_15045 ?auto_15046 ) ) ( IN-CITY ?auto_15048 ?auto_15050 ) ( not ( = ?auto_15043 ?auto_15048 ) ) ( not ( = ?auto_15049 ?auto_15048 ) ) ( OBJ-AT ?auto_15045 ?auto_15048 ) ( OBJ-AT ?auto_15044 ?auto_15049 ) ( TRUCK-AT ?auto_15047 ?auto_15043 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15047 ?auto_15043 ?auto_15049 ?auto_15050 )
      ( DELIVER-4PKG ?auto_15042 ?auto_15044 ?auto_15045 ?auto_15046 ?auto_15043 )
      ( DELIVER-4PKG-VERIFY ?auto_15042 ?auto_15044 ?auto_15045 ?auto_15046 ?auto_15043 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15056 - OBJ
      ?auto_15058 - OBJ
      ?auto_15059 - OBJ
      ?auto_15060 - OBJ
      ?auto_15057 - LOCATION
    )
    :vars
    (
      ?auto_15062 - LOCATION
      ?auto_15063 - CITY
      ?auto_15064 - LOCATION
      ?auto_15061 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15058 ?auto_15056 ) ( GREATER-THAN ?auto_15059 ?auto_15056 ) ( GREATER-THAN ?auto_15059 ?auto_15058 ) ( GREATER-THAN ?auto_15060 ?auto_15056 ) ( GREATER-THAN ?auto_15060 ?auto_15058 ) ( GREATER-THAN ?auto_15060 ?auto_15059 ) ( IN-CITY ?auto_15062 ?auto_15063 ) ( IN-CITY ?auto_15057 ?auto_15063 ) ( not ( = ?auto_15057 ?auto_15062 ) ) ( OBJ-AT ?auto_15060 ?auto_15062 ) ( not ( = ?auto_15056 ?auto_15058 ) ) ( not ( = ?auto_15056 ?auto_15059 ) ) ( not ( = ?auto_15056 ?auto_15060 ) ) ( not ( = ?auto_15058 ?auto_15059 ) ) ( not ( = ?auto_15058 ?auto_15060 ) ) ( not ( = ?auto_15059 ?auto_15060 ) ) ( IN-CITY ?auto_15064 ?auto_15063 ) ( not ( = ?auto_15057 ?auto_15064 ) ) ( not ( = ?auto_15062 ?auto_15064 ) ) ( OBJ-AT ?auto_15059 ?auto_15064 ) ( OBJ-AT ?auto_15058 ?auto_15062 ) ( TRUCK-AT ?auto_15061 ?auto_15057 ) ( IN-TRUCK ?auto_15056 ?auto_15061 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15056 ?auto_15057 )
      ( DELIVER-4PKG ?auto_15056 ?auto_15058 ?auto_15059 ?auto_15060 ?auto_15057 )
      ( DELIVER-4PKG-VERIFY ?auto_15056 ?auto_15058 ?auto_15059 ?auto_15060 ?auto_15057 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15070 - OBJ
      ?auto_15072 - OBJ
      ?auto_15073 - OBJ
      ?auto_15074 - OBJ
      ?auto_15071 - LOCATION
    )
    :vars
    (
      ?auto_15078 - LOCATION
      ?auto_15077 - CITY
      ?auto_15075 - LOCATION
      ?auto_15076 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15072 ?auto_15070 ) ( GREATER-THAN ?auto_15073 ?auto_15070 ) ( GREATER-THAN ?auto_15073 ?auto_15072 ) ( GREATER-THAN ?auto_15074 ?auto_15070 ) ( GREATER-THAN ?auto_15074 ?auto_15072 ) ( GREATER-THAN ?auto_15074 ?auto_15073 ) ( IN-CITY ?auto_15078 ?auto_15077 ) ( IN-CITY ?auto_15071 ?auto_15077 ) ( not ( = ?auto_15071 ?auto_15078 ) ) ( OBJ-AT ?auto_15074 ?auto_15078 ) ( not ( = ?auto_15070 ?auto_15072 ) ) ( not ( = ?auto_15070 ?auto_15073 ) ) ( not ( = ?auto_15070 ?auto_15074 ) ) ( not ( = ?auto_15072 ?auto_15073 ) ) ( not ( = ?auto_15072 ?auto_15074 ) ) ( not ( = ?auto_15073 ?auto_15074 ) ) ( IN-CITY ?auto_15075 ?auto_15077 ) ( not ( = ?auto_15071 ?auto_15075 ) ) ( not ( = ?auto_15078 ?auto_15075 ) ) ( OBJ-AT ?auto_15073 ?auto_15075 ) ( OBJ-AT ?auto_15072 ?auto_15078 ) ( IN-TRUCK ?auto_15070 ?auto_15076 ) ( TRUCK-AT ?auto_15076 ?auto_15078 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15076 ?auto_15078 ?auto_15071 ?auto_15077 )
      ( DELIVER-4PKG ?auto_15070 ?auto_15072 ?auto_15073 ?auto_15074 ?auto_15071 )
      ( DELIVER-4PKG-VERIFY ?auto_15070 ?auto_15072 ?auto_15073 ?auto_15074 ?auto_15071 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15084 - OBJ
      ?auto_15086 - OBJ
      ?auto_15087 - OBJ
      ?auto_15088 - OBJ
      ?auto_15085 - LOCATION
    )
    :vars
    (
      ?auto_15091 - LOCATION
      ?auto_15089 - CITY
      ?auto_15090 - LOCATION
      ?auto_15092 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15086 ?auto_15084 ) ( GREATER-THAN ?auto_15087 ?auto_15084 ) ( GREATER-THAN ?auto_15087 ?auto_15086 ) ( GREATER-THAN ?auto_15088 ?auto_15084 ) ( GREATER-THAN ?auto_15088 ?auto_15086 ) ( GREATER-THAN ?auto_15088 ?auto_15087 ) ( IN-CITY ?auto_15091 ?auto_15089 ) ( IN-CITY ?auto_15085 ?auto_15089 ) ( not ( = ?auto_15085 ?auto_15091 ) ) ( OBJ-AT ?auto_15088 ?auto_15091 ) ( not ( = ?auto_15084 ?auto_15086 ) ) ( not ( = ?auto_15084 ?auto_15087 ) ) ( not ( = ?auto_15084 ?auto_15088 ) ) ( not ( = ?auto_15086 ?auto_15087 ) ) ( not ( = ?auto_15086 ?auto_15088 ) ) ( not ( = ?auto_15087 ?auto_15088 ) ) ( IN-CITY ?auto_15090 ?auto_15089 ) ( not ( = ?auto_15085 ?auto_15090 ) ) ( not ( = ?auto_15091 ?auto_15090 ) ) ( OBJ-AT ?auto_15087 ?auto_15090 ) ( OBJ-AT ?auto_15086 ?auto_15091 ) ( TRUCK-AT ?auto_15092 ?auto_15091 ) ( OBJ-AT ?auto_15084 ?auto_15091 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15084 ?auto_15092 ?auto_15091 )
      ( DELIVER-4PKG ?auto_15084 ?auto_15086 ?auto_15087 ?auto_15088 ?auto_15085 )
      ( DELIVER-4PKG-VERIFY ?auto_15084 ?auto_15086 ?auto_15087 ?auto_15088 ?auto_15085 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15098 - OBJ
      ?auto_15100 - OBJ
      ?auto_15101 - OBJ
      ?auto_15102 - OBJ
      ?auto_15099 - LOCATION
    )
    :vars
    (
      ?auto_15106 - LOCATION
      ?auto_15105 - CITY
      ?auto_15103 - LOCATION
      ?auto_15104 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15100 ?auto_15098 ) ( GREATER-THAN ?auto_15101 ?auto_15098 ) ( GREATER-THAN ?auto_15101 ?auto_15100 ) ( GREATER-THAN ?auto_15102 ?auto_15098 ) ( GREATER-THAN ?auto_15102 ?auto_15100 ) ( GREATER-THAN ?auto_15102 ?auto_15101 ) ( IN-CITY ?auto_15106 ?auto_15105 ) ( IN-CITY ?auto_15099 ?auto_15105 ) ( not ( = ?auto_15099 ?auto_15106 ) ) ( OBJ-AT ?auto_15102 ?auto_15106 ) ( not ( = ?auto_15098 ?auto_15100 ) ) ( not ( = ?auto_15098 ?auto_15101 ) ) ( not ( = ?auto_15098 ?auto_15102 ) ) ( not ( = ?auto_15100 ?auto_15101 ) ) ( not ( = ?auto_15100 ?auto_15102 ) ) ( not ( = ?auto_15101 ?auto_15102 ) ) ( IN-CITY ?auto_15103 ?auto_15105 ) ( not ( = ?auto_15099 ?auto_15103 ) ) ( not ( = ?auto_15106 ?auto_15103 ) ) ( OBJ-AT ?auto_15101 ?auto_15103 ) ( OBJ-AT ?auto_15100 ?auto_15106 ) ( OBJ-AT ?auto_15098 ?auto_15106 ) ( TRUCK-AT ?auto_15104 ?auto_15099 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15104 ?auto_15099 ?auto_15106 ?auto_15105 )
      ( DELIVER-4PKG ?auto_15098 ?auto_15100 ?auto_15101 ?auto_15102 ?auto_15099 )
      ( DELIVER-4PKG-VERIFY ?auto_15098 ?auto_15100 ?auto_15101 ?auto_15102 ?auto_15099 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15139 - OBJ
      ?auto_15141 - OBJ
      ?auto_15142 - OBJ
      ?auto_15143 - OBJ
      ?auto_15144 - OBJ
      ?auto_15140 - LOCATION
    )
    :vars
    (
      ?auto_15145 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15141 ?auto_15139 ) ( GREATER-THAN ?auto_15142 ?auto_15139 ) ( GREATER-THAN ?auto_15142 ?auto_15141 ) ( GREATER-THAN ?auto_15143 ?auto_15139 ) ( GREATER-THAN ?auto_15143 ?auto_15141 ) ( GREATER-THAN ?auto_15143 ?auto_15142 ) ( GREATER-THAN ?auto_15144 ?auto_15139 ) ( GREATER-THAN ?auto_15144 ?auto_15141 ) ( GREATER-THAN ?auto_15144 ?auto_15142 ) ( GREATER-THAN ?auto_15144 ?auto_15143 ) ( TRUCK-AT ?auto_15145 ?auto_15140 ) ( IN-TRUCK ?auto_15144 ?auto_15145 ) ( OBJ-AT ?auto_15139 ?auto_15140 ) ( OBJ-AT ?auto_15141 ?auto_15140 ) ( OBJ-AT ?auto_15142 ?auto_15140 ) ( OBJ-AT ?auto_15143 ?auto_15140 ) ( not ( = ?auto_15139 ?auto_15141 ) ) ( not ( = ?auto_15139 ?auto_15142 ) ) ( not ( = ?auto_15139 ?auto_15143 ) ) ( not ( = ?auto_15139 ?auto_15144 ) ) ( not ( = ?auto_15141 ?auto_15142 ) ) ( not ( = ?auto_15141 ?auto_15143 ) ) ( not ( = ?auto_15141 ?auto_15144 ) ) ( not ( = ?auto_15142 ?auto_15143 ) ) ( not ( = ?auto_15142 ?auto_15144 ) ) ( not ( = ?auto_15143 ?auto_15144 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15144 ?auto_15140 )
      ( DELIVER-5PKG-VERIFY ?auto_15139 ?auto_15141 ?auto_15142 ?auto_15143 ?auto_15144 ?auto_15140 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15152 - OBJ
      ?auto_15154 - OBJ
      ?auto_15155 - OBJ
      ?auto_15156 - OBJ
      ?auto_15157 - OBJ
      ?auto_15153 - LOCATION
    )
    :vars
    (
      ?auto_15160 - TRUCK
      ?auto_15158 - LOCATION
      ?auto_15159 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15154 ?auto_15152 ) ( GREATER-THAN ?auto_15155 ?auto_15152 ) ( GREATER-THAN ?auto_15155 ?auto_15154 ) ( GREATER-THAN ?auto_15156 ?auto_15152 ) ( GREATER-THAN ?auto_15156 ?auto_15154 ) ( GREATER-THAN ?auto_15156 ?auto_15155 ) ( GREATER-THAN ?auto_15157 ?auto_15152 ) ( GREATER-THAN ?auto_15157 ?auto_15154 ) ( GREATER-THAN ?auto_15157 ?auto_15155 ) ( GREATER-THAN ?auto_15157 ?auto_15156 ) ( IN-TRUCK ?auto_15157 ?auto_15160 ) ( TRUCK-AT ?auto_15160 ?auto_15158 ) ( IN-CITY ?auto_15158 ?auto_15159 ) ( IN-CITY ?auto_15153 ?auto_15159 ) ( not ( = ?auto_15153 ?auto_15158 ) ) ( OBJ-AT ?auto_15152 ?auto_15153 ) ( OBJ-AT ?auto_15154 ?auto_15153 ) ( OBJ-AT ?auto_15155 ?auto_15153 ) ( OBJ-AT ?auto_15156 ?auto_15153 ) ( not ( = ?auto_15152 ?auto_15154 ) ) ( not ( = ?auto_15152 ?auto_15155 ) ) ( not ( = ?auto_15152 ?auto_15156 ) ) ( not ( = ?auto_15152 ?auto_15157 ) ) ( not ( = ?auto_15154 ?auto_15155 ) ) ( not ( = ?auto_15154 ?auto_15156 ) ) ( not ( = ?auto_15154 ?auto_15157 ) ) ( not ( = ?auto_15155 ?auto_15156 ) ) ( not ( = ?auto_15155 ?auto_15157 ) ) ( not ( = ?auto_15156 ?auto_15157 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15157 ?auto_15153 )
      ( DELIVER-5PKG-VERIFY ?auto_15152 ?auto_15154 ?auto_15155 ?auto_15156 ?auto_15157 ?auto_15153 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15167 - OBJ
      ?auto_15169 - OBJ
      ?auto_15170 - OBJ
      ?auto_15171 - OBJ
      ?auto_15172 - OBJ
      ?auto_15168 - LOCATION
    )
    :vars
    (
      ?auto_15173 - TRUCK
      ?auto_15175 - LOCATION
      ?auto_15174 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15169 ?auto_15167 ) ( GREATER-THAN ?auto_15170 ?auto_15167 ) ( GREATER-THAN ?auto_15170 ?auto_15169 ) ( GREATER-THAN ?auto_15171 ?auto_15167 ) ( GREATER-THAN ?auto_15171 ?auto_15169 ) ( GREATER-THAN ?auto_15171 ?auto_15170 ) ( GREATER-THAN ?auto_15172 ?auto_15167 ) ( GREATER-THAN ?auto_15172 ?auto_15169 ) ( GREATER-THAN ?auto_15172 ?auto_15170 ) ( GREATER-THAN ?auto_15172 ?auto_15171 ) ( TRUCK-AT ?auto_15173 ?auto_15175 ) ( IN-CITY ?auto_15175 ?auto_15174 ) ( IN-CITY ?auto_15168 ?auto_15174 ) ( not ( = ?auto_15168 ?auto_15175 ) ) ( OBJ-AT ?auto_15172 ?auto_15175 ) ( OBJ-AT ?auto_15167 ?auto_15168 ) ( OBJ-AT ?auto_15169 ?auto_15168 ) ( OBJ-AT ?auto_15170 ?auto_15168 ) ( OBJ-AT ?auto_15171 ?auto_15168 ) ( not ( = ?auto_15167 ?auto_15169 ) ) ( not ( = ?auto_15167 ?auto_15170 ) ) ( not ( = ?auto_15167 ?auto_15171 ) ) ( not ( = ?auto_15167 ?auto_15172 ) ) ( not ( = ?auto_15169 ?auto_15170 ) ) ( not ( = ?auto_15169 ?auto_15171 ) ) ( not ( = ?auto_15169 ?auto_15172 ) ) ( not ( = ?auto_15170 ?auto_15171 ) ) ( not ( = ?auto_15170 ?auto_15172 ) ) ( not ( = ?auto_15171 ?auto_15172 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15172 ?auto_15168 )
      ( DELIVER-5PKG-VERIFY ?auto_15167 ?auto_15169 ?auto_15170 ?auto_15171 ?auto_15172 ?auto_15168 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15182 - OBJ
      ?auto_15184 - OBJ
      ?auto_15185 - OBJ
      ?auto_15186 - OBJ
      ?auto_15187 - OBJ
      ?auto_15183 - LOCATION
    )
    :vars
    (
      ?auto_15190 - LOCATION
      ?auto_15188 - CITY
      ?auto_15189 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15184 ?auto_15182 ) ( GREATER-THAN ?auto_15185 ?auto_15182 ) ( GREATER-THAN ?auto_15185 ?auto_15184 ) ( GREATER-THAN ?auto_15186 ?auto_15182 ) ( GREATER-THAN ?auto_15186 ?auto_15184 ) ( GREATER-THAN ?auto_15186 ?auto_15185 ) ( GREATER-THAN ?auto_15187 ?auto_15182 ) ( GREATER-THAN ?auto_15187 ?auto_15184 ) ( GREATER-THAN ?auto_15187 ?auto_15185 ) ( GREATER-THAN ?auto_15187 ?auto_15186 ) ( IN-CITY ?auto_15190 ?auto_15188 ) ( IN-CITY ?auto_15183 ?auto_15188 ) ( not ( = ?auto_15183 ?auto_15190 ) ) ( OBJ-AT ?auto_15187 ?auto_15190 ) ( TRUCK-AT ?auto_15189 ?auto_15183 ) ( OBJ-AT ?auto_15182 ?auto_15183 ) ( OBJ-AT ?auto_15184 ?auto_15183 ) ( OBJ-AT ?auto_15185 ?auto_15183 ) ( OBJ-AT ?auto_15186 ?auto_15183 ) ( not ( = ?auto_15182 ?auto_15184 ) ) ( not ( = ?auto_15182 ?auto_15185 ) ) ( not ( = ?auto_15182 ?auto_15186 ) ) ( not ( = ?auto_15182 ?auto_15187 ) ) ( not ( = ?auto_15184 ?auto_15185 ) ) ( not ( = ?auto_15184 ?auto_15186 ) ) ( not ( = ?auto_15184 ?auto_15187 ) ) ( not ( = ?auto_15185 ?auto_15186 ) ) ( not ( = ?auto_15185 ?auto_15187 ) ) ( not ( = ?auto_15186 ?auto_15187 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15187 ?auto_15183 )
      ( DELIVER-5PKG-VERIFY ?auto_15182 ?auto_15184 ?auto_15185 ?auto_15186 ?auto_15187 ?auto_15183 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15197 - OBJ
      ?auto_15199 - OBJ
      ?auto_15200 - OBJ
      ?auto_15201 - OBJ
      ?auto_15202 - OBJ
      ?auto_15198 - LOCATION
    )
    :vars
    (
      ?auto_15203 - LOCATION
      ?auto_15205 - CITY
      ?auto_15204 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15199 ?auto_15197 ) ( GREATER-THAN ?auto_15200 ?auto_15197 ) ( GREATER-THAN ?auto_15200 ?auto_15199 ) ( GREATER-THAN ?auto_15201 ?auto_15197 ) ( GREATER-THAN ?auto_15201 ?auto_15199 ) ( GREATER-THAN ?auto_15201 ?auto_15200 ) ( GREATER-THAN ?auto_15202 ?auto_15197 ) ( GREATER-THAN ?auto_15202 ?auto_15199 ) ( GREATER-THAN ?auto_15202 ?auto_15200 ) ( GREATER-THAN ?auto_15202 ?auto_15201 ) ( IN-CITY ?auto_15203 ?auto_15205 ) ( IN-CITY ?auto_15198 ?auto_15205 ) ( not ( = ?auto_15198 ?auto_15203 ) ) ( OBJ-AT ?auto_15202 ?auto_15203 ) ( TRUCK-AT ?auto_15204 ?auto_15198 ) ( OBJ-AT ?auto_15197 ?auto_15198 ) ( OBJ-AT ?auto_15199 ?auto_15198 ) ( OBJ-AT ?auto_15200 ?auto_15198 ) ( not ( = ?auto_15197 ?auto_15199 ) ) ( not ( = ?auto_15197 ?auto_15200 ) ) ( not ( = ?auto_15197 ?auto_15201 ) ) ( not ( = ?auto_15197 ?auto_15202 ) ) ( not ( = ?auto_15199 ?auto_15200 ) ) ( not ( = ?auto_15199 ?auto_15201 ) ) ( not ( = ?auto_15199 ?auto_15202 ) ) ( not ( = ?auto_15200 ?auto_15201 ) ) ( not ( = ?auto_15200 ?auto_15202 ) ) ( not ( = ?auto_15201 ?auto_15202 ) ) ( IN-TRUCK ?auto_15201 ?auto_15204 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15201 ?auto_15198 )
      ( DELIVER-5PKG ?auto_15197 ?auto_15199 ?auto_15200 ?auto_15201 ?auto_15202 ?auto_15198 )
      ( DELIVER-5PKG-VERIFY ?auto_15197 ?auto_15199 ?auto_15200 ?auto_15201 ?auto_15202 ?auto_15198 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15212 - OBJ
      ?auto_15214 - OBJ
      ?auto_15215 - OBJ
      ?auto_15216 - OBJ
      ?auto_15217 - OBJ
      ?auto_15213 - LOCATION
    )
    :vars
    (
      ?auto_15219 - LOCATION
      ?auto_15220 - CITY
      ?auto_15218 - TRUCK
      ?auto_15221 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15214 ?auto_15212 ) ( GREATER-THAN ?auto_15215 ?auto_15212 ) ( GREATER-THAN ?auto_15215 ?auto_15214 ) ( GREATER-THAN ?auto_15216 ?auto_15212 ) ( GREATER-THAN ?auto_15216 ?auto_15214 ) ( GREATER-THAN ?auto_15216 ?auto_15215 ) ( GREATER-THAN ?auto_15217 ?auto_15212 ) ( GREATER-THAN ?auto_15217 ?auto_15214 ) ( GREATER-THAN ?auto_15217 ?auto_15215 ) ( GREATER-THAN ?auto_15217 ?auto_15216 ) ( IN-CITY ?auto_15219 ?auto_15220 ) ( IN-CITY ?auto_15213 ?auto_15220 ) ( not ( = ?auto_15213 ?auto_15219 ) ) ( OBJ-AT ?auto_15217 ?auto_15219 ) ( OBJ-AT ?auto_15212 ?auto_15213 ) ( OBJ-AT ?auto_15214 ?auto_15213 ) ( OBJ-AT ?auto_15215 ?auto_15213 ) ( not ( = ?auto_15212 ?auto_15214 ) ) ( not ( = ?auto_15212 ?auto_15215 ) ) ( not ( = ?auto_15212 ?auto_15216 ) ) ( not ( = ?auto_15212 ?auto_15217 ) ) ( not ( = ?auto_15214 ?auto_15215 ) ) ( not ( = ?auto_15214 ?auto_15216 ) ) ( not ( = ?auto_15214 ?auto_15217 ) ) ( not ( = ?auto_15215 ?auto_15216 ) ) ( not ( = ?auto_15215 ?auto_15217 ) ) ( not ( = ?auto_15216 ?auto_15217 ) ) ( IN-TRUCK ?auto_15216 ?auto_15218 ) ( TRUCK-AT ?auto_15218 ?auto_15221 ) ( IN-CITY ?auto_15221 ?auto_15220 ) ( not ( = ?auto_15213 ?auto_15221 ) ) ( not ( = ?auto_15219 ?auto_15221 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15218 ?auto_15221 ?auto_15213 ?auto_15220 )
      ( DELIVER-5PKG ?auto_15212 ?auto_15214 ?auto_15215 ?auto_15216 ?auto_15217 ?auto_15213 )
      ( DELIVER-5PKG-VERIFY ?auto_15212 ?auto_15214 ?auto_15215 ?auto_15216 ?auto_15217 ?auto_15213 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15228 - OBJ
      ?auto_15230 - OBJ
      ?auto_15231 - OBJ
      ?auto_15232 - OBJ
      ?auto_15233 - OBJ
      ?auto_15229 - LOCATION
    )
    :vars
    (
      ?auto_15235 - LOCATION
      ?auto_15234 - CITY
      ?auto_15237 - TRUCK
      ?auto_15236 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15230 ?auto_15228 ) ( GREATER-THAN ?auto_15231 ?auto_15228 ) ( GREATER-THAN ?auto_15231 ?auto_15230 ) ( GREATER-THAN ?auto_15232 ?auto_15228 ) ( GREATER-THAN ?auto_15232 ?auto_15230 ) ( GREATER-THAN ?auto_15232 ?auto_15231 ) ( GREATER-THAN ?auto_15233 ?auto_15228 ) ( GREATER-THAN ?auto_15233 ?auto_15230 ) ( GREATER-THAN ?auto_15233 ?auto_15231 ) ( GREATER-THAN ?auto_15233 ?auto_15232 ) ( IN-CITY ?auto_15235 ?auto_15234 ) ( IN-CITY ?auto_15229 ?auto_15234 ) ( not ( = ?auto_15229 ?auto_15235 ) ) ( OBJ-AT ?auto_15233 ?auto_15235 ) ( OBJ-AT ?auto_15228 ?auto_15229 ) ( OBJ-AT ?auto_15230 ?auto_15229 ) ( OBJ-AT ?auto_15231 ?auto_15229 ) ( not ( = ?auto_15228 ?auto_15230 ) ) ( not ( = ?auto_15228 ?auto_15231 ) ) ( not ( = ?auto_15228 ?auto_15232 ) ) ( not ( = ?auto_15228 ?auto_15233 ) ) ( not ( = ?auto_15230 ?auto_15231 ) ) ( not ( = ?auto_15230 ?auto_15232 ) ) ( not ( = ?auto_15230 ?auto_15233 ) ) ( not ( = ?auto_15231 ?auto_15232 ) ) ( not ( = ?auto_15231 ?auto_15233 ) ) ( not ( = ?auto_15232 ?auto_15233 ) ) ( TRUCK-AT ?auto_15237 ?auto_15236 ) ( IN-CITY ?auto_15236 ?auto_15234 ) ( not ( = ?auto_15229 ?auto_15236 ) ) ( not ( = ?auto_15235 ?auto_15236 ) ) ( OBJ-AT ?auto_15232 ?auto_15236 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15232 ?auto_15237 ?auto_15236 )
      ( DELIVER-5PKG ?auto_15228 ?auto_15230 ?auto_15231 ?auto_15232 ?auto_15233 ?auto_15229 )
      ( DELIVER-5PKG-VERIFY ?auto_15228 ?auto_15230 ?auto_15231 ?auto_15232 ?auto_15233 ?auto_15229 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15244 - OBJ
      ?auto_15246 - OBJ
      ?auto_15247 - OBJ
      ?auto_15248 - OBJ
      ?auto_15249 - OBJ
      ?auto_15245 - LOCATION
    )
    :vars
    (
      ?auto_15251 - LOCATION
      ?auto_15252 - CITY
      ?auto_15250 - LOCATION
      ?auto_15253 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15246 ?auto_15244 ) ( GREATER-THAN ?auto_15247 ?auto_15244 ) ( GREATER-THAN ?auto_15247 ?auto_15246 ) ( GREATER-THAN ?auto_15248 ?auto_15244 ) ( GREATER-THAN ?auto_15248 ?auto_15246 ) ( GREATER-THAN ?auto_15248 ?auto_15247 ) ( GREATER-THAN ?auto_15249 ?auto_15244 ) ( GREATER-THAN ?auto_15249 ?auto_15246 ) ( GREATER-THAN ?auto_15249 ?auto_15247 ) ( GREATER-THAN ?auto_15249 ?auto_15248 ) ( IN-CITY ?auto_15251 ?auto_15252 ) ( IN-CITY ?auto_15245 ?auto_15252 ) ( not ( = ?auto_15245 ?auto_15251 ) ) ( OBJ-AT ?auto_15249 ?auto_15251 ) ( OBJ-AT ?auto_15244 ?auto_15245 ) ( OBJ-AT ?auto_15246 ?auto_15245 ) ( OBJ-AT ?auto_15247 ?auto_15245 ) ( not ( = ?auto_15244 ?auto_15246 ) ) ( not ( = ?auto_15244 ?auto_15247 ) ) ( not ( = ?auto_15244 ?auto_15248 ) ) ( not ( = ?auto_15244 ?auto_15249 ) ) ( not ( = ?auto_15246 ?auto_15247 ) ) ( not ( = ?auto_15246 ?auto_15248 ) ) ( not ( = ?auto_15246 ?auto_15249 ) ) ( not ( = ?auto_15247 ?auto_15248 ) ) ( not ( = ?auto_15247 ?auto_15249 ) ) ( not ( = ?auto_15248 ?auto_15249 ) ) ( IN-CITY ?auto_15250 ?auto_15252 ) ( not ( = ?auto_15245 ?auto_15250 ) ) ( not ( = ?auto_15251 ?auto_15250 ) ) ( OBJ-AT ?auto_15248 ?auto_15250 ) ( TRUCK-AT ?auto_15253 ?auto_15245 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15253 ?auto_15245 ?auto_15250 ?auto_15252 )
      ( DELIVER-5PKG ?auto_15244 ?auto_15246 ?auto_15247 ?auto_15248 ?auto_15249 ?auto_15245 )
      ( DELIVER-5PKG-VERIFY ?auto_15244 ?auto_15246 ?auto_15247 ?auto_15248 ?auto_15249 ?auto_15245 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15260 - OBJ
      ?auto_15262 - OBJ
      ?auto_15263 - OBJ
      ?auto_15264 - OBJ
      ?auto_15265 - OBJ
      ?auto_15261 - LOCATION
    )
    :vars
    (
      ?auto_15268 - LOCATION
      ?auto_15269 - CITY
      ?auto_15266 - LOCATION
      ?auto_15267 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15262 ?auto_15260 ) ( GREATER-THAN ?auto_15263 ?auto_15260 ) ( GREATER-THAN ?auto_15263 ?auto_15262 ) ( GREATER-THAN ?auto_15264 ?auto_15260 ) ( GREATER-THAN ?auto_15264 ?auto_15262 ) ( GREATER-THAN ?auto_15264 ?auto_15263 ) ( GREATER-THAN ?auto_15265 ?auto_15260 ) ( GREATER-THAN ?auto_15265 ?auto_15262 ) ( GREATER-THAN ?auto_15265 ?auto_15263 ) ( GREATER-THAN ?auto_15265 ?auto_15264 ) ( IN-CITY ?auto_15268 ?auto_15269 ) ( IN-CITY ?auto_15261 ?auto_15269 ) ( not ( = ?auto_15261 ?auto_15268 ) ) ( OBJ-AT ?auto_15265 ?auto_15268 ) ( OBJ-AT ?auto_15260 ?auto_15261 ) ( OBJ-AT ?auto_15262 ?auto_15261 ) ( not ( = ?auto_15260 ?auto_15262 ) ) ( not ( = ?auto_15260 ?auto_15263 ) ) ( not ( = ?auto_15260 ?auto_15264 ) ) ( not ( = ?auto_15260 ?auto_15265 ) ) ( not ( = ?auto_15262 ?auto_15263 ) ) ( not ( = ?auto_15262 ?auto_15264 ) ) ( not ( = ?auto_15262 ?auto_15265 ) ) ( not ( = ?auto_15263 ?auto_15264 ) ) ( not ( = ?auto_15263 ?auto_15265 ) ) ( not ( = ?auto_15264 ?auto_15265 ) ) ( IN-CITY ?auto_15266 ?auto_15269 ) ( not ( = ?auto_15261 ?auto_15266 ) ) ( not ( = ?auto_15268 ?auto_15266 ) ) ( OBJ-AT ?auto_15264 ?auto_15266 ) ( TRUCK-AT ?auto_15267 ?auto_15261 ) ( IN-TRUCK ?auto_15263 ?auto_15267 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15263 ?auto_15261 )
      ( DELIVER-5PKG ?auto_15260 ?auto_15262 ?auto_15263 ?auto_15264 ?auto_15265 ?auto_15261 )
      ( DELIVER-5PKG-VERIFY ?auto_15260 ?auto_15262 ?auto_15263 ?auto_15264 ?auto_15265 ?auto_15261 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15276 - OBJ
      ?auto_15278 - OBJ
      ?auto_15279 - OBJ
      ?auto_15280 - OBJ
      ?auto_15281 - OBJ
      ?auto_15277 - LOCATION
    )
    :vars
    (
      ?auto_15284 - LOCATION
      ?auto_15282 - CITY
      ?auto_15283 - LOCATION
      ?auto_15285 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15278 ?auto_15276 ) ( GREATER-THAN ?auto_15279 ?auto_15276 ) ( GREATER-THAN ?auto_15279 ?auto_15278 ) ( GREATER-THAN ?auto_15280 ?auto_15276 ) ( GREATER-THAN ?auto_15280 ?auto_15278 ) ( GREATER-THAN ?auto_15280 ?auto_15279 ) ( GREATER-THAN ?auto_15281 ?auto_15276 ) ( GREATER-THAN ?auto_15281 ?auto_15278 ) ( GREATER-THAN ?auto_15281 ?auto_15279 ) ( GREATER-THAN ?auto_15281 ?auto_15280 ) ( IN-CITY ?auto_15284 ?auto_15282 ) ( IN-CITY ?auto_15277 ?auto_15282 ) ( not ( = ?auto_15277 ?auto_15284 ) ) ( OBJ-AT ?auto_15281 ?auto_15284 ) ( OBJ-AT ?auto_15276 ?auto_15277 ) ( OBJ-AT ?auto_15278 ?auto_15277 ) ( not ( = ?auto_15276 ?auto_15278 ) ) ( not ( = ?auto_15276 ?auto_15279 ) ) ( not ( = ?auto_15276 ?auto_15280 ) ) ( not ( = ?auto_15276 ?auto_15281 ) ) ( not ( = ?auto_15278 ?auto_15279 ) ) ( not ( = ?auto_15278 ?auto_15280 ) ) ( not ( = ?auto_15278 ?auto_15281 ) ) ( not ( = ?auto_15279 ?auto_15280 ) ) ( not ( = ?auto_15279 ?auto_15281 ) ) ( not ( = ?auto_15280 ?auto_15281 ) ) ( IN-CITY ?auto_15283 ?auto_15282 ) ( not ( = ?auto_15277 ?auto_15283 ) ) ( not ( = ?auto_15284 ?auto_15283 ) ) ( OBJ-AT ?auto_15280 ?auto_15283 ) ( IN-TRUCK ?auto_15279 ?auto_15285 ) ( TRUCK-AT ?auto_15285 ?auto_15284 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15285 ?auto_15284 ?auto_15277 ?auto_15282 )
      ( DELIVER-5PKG ?auto_15276 ?auto_15278 ?auto_15279 ?auto_15280 ?auto_15281 ?auto_15277 )
      ( DELIVER-5PKG-VERIFY ?auto_15276 ?auto_15278 ?auto_15279 ?auto_15280 ?auto_15281 ?auto_15277 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15292 - OBJ
      ?auto_15294 - OBJ
      ?auto_15295 - OBJ
      ?auto_15296 - OBJ
      ?auto_15297 - OBJ
      ?auto_15293 - LOCATION
    )
    :vars
    (
      ?auto_15300 - LOCATION
      ?auto_15299 - CITY
      ?auto_15298 - LOCATION
      ?auto_15301 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15294 ?auto_15292 ) ( GREATER-THAN ?auto_15295 ?auto_15292 ) ( GREATER-THAN ?auto_15295 ?auto_15294 ) ( GREATER-THAN ?auto_15296 ?auto_15292 ) ( GREATER-THAN ?auto_15296 ?auto_15294 ) ( GREATER-THAN ?auto_15296 ?auto_15295 ) ( GREATER-THAN ?auto_15297 ?auto_15292 ) ( GREATER-THAN ?auto_15297 ?auto_15294 ) ( GREATER-THAN ?auto_15297 ?auto_15295 ) ( GREATER-THAN ?auto_15297 ?auto_15296 ) ( IN-CITY ?auto_15300 ?auto_15299 ) ( IN-CITY ?auto_15293 ?auto_15299 ) ( not ( = ?auto_15293 ?auto_15300 ) ) ( OBJ-AT ?auto_15297 ?auto_15300 ) ( OBJ-AT ?auto_15292 ?auto_15293 ) ( OBJ-AT ?auto_15294 ?auto_15293 ) ( not ( = ?auto_15292 ?auto_15294 ) ) ( not ( = ?auto_15292 ?auto_15295 ) ) ( not ( = ?auto_15292 ?auto_15296 ) ) ( not ( = ?auto_15292 ?auto_15297 ) ) ( not ( = ?auto_15294 ?auto_15295 ) ) ( not ( = ?auto_15294 ?auto_15296 ) ) ( not ( = ?auto_15294 ?auto_15297 ) ) ( not ( = ?auto_15295 ?auto_15296 ) ) ( not ( = ?auto_15295 ?auto_15297 ) ) ( not ( = ?auto_15296 ?auto_15297 ) ) ( IN-CITY ?auto_15298 ?auto_15299 ) ( not ( = ?auto_15293 ?auto_15298 ) ) ( not ( = ?auto_15300 ?auto_15298 ) ) ( OBJ-AT ?auto_15296 ?auto_15298 ) ( TRUCK-AT ?auto_15301 ?auto_15300 ) ( OBJ-AT ?auto_15295 ?auto_15300 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15295 ?auto_15301 ?auto_15300 )
      ( DELIVER-5PKG ?auto_15292 ?auto_15294 ?auto_15295 ?auto_15296 ?auto_15297 ?auto_15293 )
      ( DELIVER-5PKG-VERIFY ?auto_15292 ?auto_15294 ?auto_15295 ?auto_15296 ?auto_15297 ?auto_15293 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15308 - OBJ
      ?auto_15310 - OBJ
      ?auto_15311 - OBJ
      ?auto_15312 - OBJ
      ?auto_15313 - OBJ
      ?auto_15309 - LOCATION
    )
    :vars
    (
      ?auto_15315 - LOCATION
      ?auto_15316 - CITY
      ?auto_15314 - LOCATION
      ?auto_15317 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15310 ?auto_15308 ) ( GREATER-THAN ?auto_15311 ?auto_15308 ) ( GREATER-THAN ?auto_15311 ?auto_15310 ) ( GREATER-THAN ?auto_15312 ?auto_15308 ) ( GREATER-THAN ?auto_15312 ?auto_15310 ) ( GREATER-THAN ?auto_15312 ?auto_15311 ) ( GREATER-THAN ?auto_15313 ?auto_15308 ) ( GREATER-THAN ?auto_15313 ?auto_15310 ) ( GREATER-THAN ?auto_15313 ?auto_15311 ) ( GREATER-THAN ?auto_15313 ?auto_15312 ) ( IN-CITY ?auto_15315 ?auto_15316 ) ( IN-CITY ?auto_15309 ?auto_15316 ) ( not ( = ?auto_15309 ?auto_15315 ) ) ( OBJ-AT ?auto_15313 ?auto_15315 ) ( OBJ-AT ?auto_15308 ?auto_15309 ) ( OBJ-AT ?auto_15310 ?auto_15309 ) ( not ( = ?auto_15308 ?auto_15310 ) ) ( not ( = ?auto_15308 ?auto_15311 ) ) ( not ( = ?auto_15308 ?auto_15312 ) ) ( not ( = ?auto_15308 ?auto_15313 ) ) ( not ( = ?auto_15310 ?auto_15311 ) ) ( not ( = ?auto_15310 ?auto_15312 ) ) ( not ( = ?auto_15310 ?auto_15313 ) ) ( not ( = ?auto_15311 ?auto_15312 ) ) ( not ( = ?auto_15311 ?auto_15313 ) ) ( not ( = ?auto_15312 ?auto_15313 ) ) ( IN-CITY ?auto_15314 ?auto_15316 ) ( not ( = ?auto_15309 ?auto_15314 ) ) ( not ( = ?auto_15315 ?auto_15314 ) ) ( OBJ-AT ?auto_15312 ?auto_15314 ) ( OBJ-AT ?auto_15311 ?auto_15315 ) ( TRUCK-AT ?auto_15317 ?auto_15309 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15317 ?auto_15309 ?auto_15315 ?auto_15316 )
      ( DELIVER-5PKG ?auto_15308 ?auto_15310 ?auto_15311 ?auto_15312 ?auto_15313 ?auto_15309 )
      ( DELIVER-5PKG-VERIFY ?auto_15308 ?auto_15310 ?auto_15311 ?auto_15312 ?auto_15313 ?auto_15309 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15324 - OBJ
      ?auto_15326 - OBJ
      ?auto_15327 - OBJ
      ?auto_15328 - OBJ
      ?auto_15329 - OBJ
      ?auto_15325 - LOCATION
    )
    :vars
    (
      ?auto_15330 - LOCATION
      ?auto_15333 - CITY
      ?auto_15332 - LOCATION
      ?auto_15331 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15326 ?auto_15324 ) ( GREATER-THAN ?auto_15327 ?auto_15324 ) ( GREATER-THAN ?auto_15327 ?auto_15326 ) ( GREATER-THAN ?auto_15328 ?auto_15324 ) ( GREATER-THAN ?auto_15328 ?auto_15326 ) ( GREATER-THAN ?auto_15328 ?auto_15327 ) ( GREATER-THAN ?auto_15329 ?auto_15324 ) ( GREATER-THAN ?auto_15329 ?auto_15326 ) ( GREATER-THAN ?auto_15329 ?auto_15327 ) ( GREATER-THAN ?auto_15329 ?auto_15328 ) ( IN-CITY ?auto_15330 ?auto_15333 ) ( IN-CITY ?auto_15325 ?auto_15333 ) ( not ( = ?auto_15325 ?auto_15330 ) ) ( OBJ-AT ?auto_15329 ?auto_15330 ) ( OBJ-AT ?auto_15324 ?auto_15325 ) ( not ( = ?auto_15324 ?auto_15326 ) ) ( not ( = ?auto_15324 ?auto_15327 ) ) ( not ( = ?auto_15324 ?auto_15328 ) ) ( not ( = ?auto_15324 ?auto_15329 ) ) ( not ( = ?auto_15326 ?auto_15327 ) ) ( not ( = ?auto_15326 ?auto_15328 ) ) ( not ( = ?auto_15326 ?auto_15329 ) ) ( not ( = ?auto_15327 ?auto_15328 ) ) ( not ( = ?auto_15327 ?auto_15329 ) ) ( not ( = ?auto_15328 ?auto_15329 ) ) ( IN-CITY ?auto_15332 ?auto_15333 ) ( not ( = ?auto_15325 ?auto_15332 ) ) ( not ( = ?auto_15330 ?auto_15332 ) ) ( OBJ-AT ?auto_15328 ?auto_15332 ) ( OBJ-AT ?auto_15327 ?auto_15330 ) ( TRUCK-AT ?auto_15331 ?auto_15325 ) ( IN-TRUCK ?auto_15326 ?auto_15331 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15326 ?auto_15325 )
      ( DELIVER-5PKG ?auto_15324 ?auto_15326 ?auto_15327 ?auto_15328 ?auto_15329 ?auto_15325 )
      ( DELIVER-5PKG-VERIFY ?auto_15324 ?auto_15326 ?auto_15327 ?auto_15328 ?auto_15329 ?auto_15325 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15340 - OBJ
      ?auto_15342 - OBJ
      ?auto_15343 - OBJ
      ?auto_15344 - OBJ
      ?auto_15345 - OBJ
      ?auto_15341 - LOCATION
    )
    :vars
    (
      ?auto_15348 - LOCATION
      ?auto_15346 - CITY
      ?auto_15347 - LOCATION
      ?auto_15349 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15342 ?auto_15340 ) ( GREATER-THAN ?auto_15343 ?auto_15340 ) ( GREATER-THAN ?auto_15343 ?auto_15342 ) ( GREATER-THAN ?auto_15344 ?auto_15340 ) ( GREATER-THAN ?auto_15344 ?auto_15342 ) ( GREATER-THAN ?auto_15344 ?auto_15343 ) ( GREATER-THAN ?auto_15345 ?auto_15340 ) ( GREATER-THAN ?auto_15345 ?auto_15342 ) ( GREATER-THAN ?auto_15345 ?auto_15343 ) ( GREATER-THAN ?auto_15345 ?auto_15344 ) ( IN-CITY ?auto_15348 ?auto_15346 ) ( IN-CITY ?auto_15341 ?auto_15346 ) ( not ( = ?auto_15341 ?auto_15348 ) ) ( OBJ-AT ?auto_15345 ?auto_15348 ) ( OBJ-AT ?auto_15340 ?auto_15341 ) ( not ( = ?auto_15340 ?auto_15342 ) ) ( not ( = ?auto_15340 ?auto_15343 ) ) ( not ( = ?auto_15340 ?auto_15344 ) ) ( not ( = ?auto_15340 ?auto_15345 ) ) ( not ( = ?auto_15342 ?auto_15343 ) ) ( not ( = ?auto_15342 ?auto_15344 ) ) ( not ( = ?auto_15342 ?auto_15345 ) ) ( not ( = ?auto_15343 ?auto_15344 ) ) ( not ( = ?auto_15343 ?auto_15345 ) ) ( not ( = ?auto_15344 ?auto_15345 ) ) ( IN-CITY ?auto_15347 ?auto_15346 ) ( not ( = ?auto_15341 ?auto_15347 ) ) ( not ( = ?auto_15348 ?auto_15347 ) ) ( OBJ-AT ?auto_15344 ?auto_15347 ) ( OBJ-AT ?auto_15343 ?auto_15348 ) ( IN-TRUCK ?auto_15342 ?auto_15349 ) ( TRUCK-AT ?auto_15349 ?auto_15347 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15349 ?auto_15347 ?auto_15341 ?auto_15346 )
      ( DELIVER-5PKG ?auto_15340 ?auto_15342 ?auto_15343 ?auto_15344 ?auto_15345 ?auto_15341 )
      ( DELIVER-5PKG-VERIFY ?auto_15340 ?auto_15342 ?auto_15343 ?auto_15344 ?auto_15345 ?auto_15341 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15356 - OBJ
      ?auto_15358 - OBJ
      ?auto_15359 - OBJ
      ?auto_15360 - OBJ
      ?auto_15361 - OBJ
      ?auto_15357 - LOCATION
    )
    :vars
    (
      ?auto_15362 - LOCATION
      ?auto_15363 - CITY
      ?auto_15365 - LOCATION
      ?auto_15364 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15358 ?auto_15356 ) ( GREATER-THAN ?auto_15359 ?auto_15356 ) ( GREATER-THAN ?auto_15359 ?auto_15358 ) ( GREATER-THAN ?auto_15360 ?auto_15356 ) ( GREATER-THAN ?auto_15360 ?auto_15358 ) ( GREATER-THAN ?auto_15360 ?auto_15359 ) ( GREATER-THAN ?auto_15361 ?auto_15356 ) ( GREATER-THAN ?auto_15361 ?auto_15358 ) ( GREATER-THAN ?auto_15361 ?auto_15359 ) ( GREATER-THAN ?auto_15361 ?auto_15360 ) ( IN-CITY ?auto_15362 ?auto_15363 ) ( IN-CITY ?auto_15357 ?auto_15363 ) ( not ( = ?auto_15357 ?auto_15362 ) ) ( OBJ-AT ?auto_15361 ?auto_15362 ) ( OBJ-AT ?auto_15356 ?auto_15357 ) ( not ( = ?auto_15356 ?auto_15358 ) ) ( not ( = ?auto_15356 ?auto_15359 ) ) ( not ( = ?auto_15356 ?auto_15360 ) ) ( not ( = ?auto_15356 ?auto_15361 ) ) ( not ( = ?auto_15358 ?auto_15359 ) ) ( not ( = ?auto_15358 ?auto_15360 ) ) ( not ( = ?auto_15358 ?auto_15361 ) ) ( not ( = ?auto_15359 ?auto_15360 ) ) ( not ( = ?auto_15359 ?auto_15361 ) ) ( not ( = ?auto_15360 ?auto_15361 ) ) ( IN-CITY ?auto_15365 ?auto_15363 ) ( not ( = ?auto_15357 ?auto_15365 ) ) ( not ( = ?auto_15362 ?auto_15365 ) ) ( OBJ-AT ?auto_15360 ?auto_15365 ) ( OBJ-AT ?auto_15359 ?auto_15362 ) ( TRUCK-AT ?auto_15364 ?auto_15365 ) ( OBJ-AT ?auto_15358 ?auto_15365 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15358 ?auto_15364 ?auto_15365 )
      ( DELIVER-5PKG ?auto_15356 ?auto_15358 ?auto_15359 ?auto_15360 ?auto_15361 ?auto_15357 )
      ( DELIVER-5PKG-VERIFY ?auto_15356 ?auto_15358 ?auto_15359 ?auto_15360 ?auto_15361 ?auto_15357 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15372 - OBJ
      ?auto_15374 - OBJ
      ?auto_15375 - OBJ
      ?auto_15376 - OBJ
      ?auto_15377 - OBJ
      ?auto_15373 - LOCATION
    )
    :vars
    (
      ?auto_15381 - LOCATION
      ?auto_15380 - CITY
      ?auto_15379 - LOCATION
      ?auto_15378 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15374 ?auto_15372 ) ( GREATER-THAN ?auto_15375 ?auto_15372 ) ( GREATER-THAN ?auto_15375 ?auto_15374 ) ( GREATER-THAN ?auto_15376 ?auto_15372 ) ( GREATER-THAN ?auto_15376 ?auto_15374 ) ( GREATER-THAN ?auto_15376 ?auto_15375 ) ( GREATER-THAN ?auto_15377 ?auto_15372 ) ( GREATER-THAN ?auto_15377 ?auto_15374 ) ( GREATER-THAN ?auto_15377 ?auto_15375 ) ( GREATER-THAN ?auto_15377 ?auto_15376 ) ( IN-CITY ?auto_15381 ?auto_15380 ) ( IN-CITY ?auto_15373 ?auto_15380 ) ( not ( = ?auto_15373 ?auto_15381 ) ) ( OBJ-AT ?auto_15377 ?auto_15381 ) ( OBJ-AT ?auto_15372 ?auto_15373 ) ( not ( = ?auto_15372 ?auto_15374 ) ) ( not ( = ?auto_15372 ?auto_15375 ) ) ( not ( = ?auto_15372 ?auto_15376 ) ) ( not ( = ?auto_15372 ?auto_15377 ) ) ( not ( = ?auto_15374 ?auto_15375 ) ) ( not ( = ?auto_15374 ?auto_15376 ) ) ( not ( = ?auto_15374 ?auto_15377 ) ) ( not ( = ?auto_15375 ?auto_15376 ) ) ( not ( = ?auto_15375 ?auto_15377 ) ) ( not ( = ?auto_15376 ?auto_15377 ) ) ( IN-CITY ?auto_15379 ?auto_15380 ) ( not ( = ?auto_15373 ?auto_15379 ) ) ( not ( = ?auto_15381 ?auto_15379 ) ) ( OBJ-AT ?auto_15376 ?auto_15379 ) ( OBJ-AT ?auto_15375 ?auto_15381 ) ( OBJ-AT ?auto_15374 ?auto_15379 ) ( TRUCK-AT ?auto_15378 ?auto_15373 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15378 ?auto_15373 ?auto_15379 ?auto_15380 )
      ( DELIVER-5PKG ?auto_15372 ?auto_15374 ?auto_15375 ?auto_15376 ?auto_15377 ?auto_15373 )
      ( DELIVER-5PKG-VERIFY ?auto_15372 ?auto_15374 ?auto_15375 ?auto_15376 ?auto_15377 ?auto_15373 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15388 - OBJ
      ?auto_15390 - OBJ
      ?auto_15391 - OBJ
      ?auto_15392 - OBJ
      ?auto_15393 - OBJ
      ?auto_15389 - LOCATION
    )
    :vars
    (
      ?auto_15395 - LOCATION
      ?auto_15397 - CITY
      ?auto_15394 - LOCATION
      ?auto_15396 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15390 ?auto_15388 ) ( GREATER-THAN ?auto_15391 ?auto_15388 ) ( GREATER-THAN ?auto_15391 ?auto_15390 ) ( GREATER-THAN ?auto_15392 ?auto_15388 ) ( GREATER-THAN ?auto_15392 ?auto_15390 ) ( GREATER-THAN ?auto_15392 ?auto_15391 ) ( GREATER-THAN ?auto_15393 ?auto_15388 ) ( GREATER-THAN ?auto_15393 ?auto_15390 ) ( GREATER-THAN ?auto_15393 ?auto_15391 ) ( GREATER-THAN ?auto_15393 ?auto_15392 ) ( IN-CITY ?auto_15395 ?auto_15397 ) ( IN-CITY ?auto_15389 ?auto_15397 ) ( not ( = ?auto_15389 ?auto_15395 ) ) ( OBJ-AT ?auto_15393 ?auto_15395 ) ( not ( = ?auto_15388 ?auto_15390 ) ) ( not ( = ?auto_15388 ?auto_15391 ) ) ( not ( = ?auto_15388 ?auto_15392 ) ) ( not ( = ?auto_15388 ?auto_15393 ) ) ( not ( = ?auto_15390 ?auto_15391 ) ) ( not ( = ?auto_15390 ?auto_15392 ) ) ( not ( = ?auto_15390 ?auto_15393 ) ) ( not ( = ?auto_15391 ?auto_15392 ) ) ( not ( = ?auto_15391 ?auto_15393 ) ) ( not ( = ?auto_15392 ?auto_15393 ) ) ( IN-CITY ?auto_15394 ?auto_15397 ) ( not ( = ?auto_15389 ?auto_15394 ) ) ( not ( = ?auto_15395 ?auto_15394 ) ) ( OBJ-AT ?auto_15392 ?auto_15394 ) ( OBJ-AT ?auto_15391 ?auto_15395 ) ( OBJ-AT ?auto_15390 ?auto_15394 ) ( TRUCK-AT ?auto_15396 ?auto_15389 ) ( IN-TRUCK ?auto_15388 ?auto_15396 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15388 ?auto_15389 )
      ( DELIVER-5PKG ?auto_15388 ?auto_15390 ?auto_15391 ?auto_15392 ?auto_15393 ?auto_15389 )
      ( DELIVER-5PKG-VERIFY ?auto_15388 ?auto_15390 ?auto_15391 ?auto_15392 ?auto_15393 ?auto_15389 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15404 - OBJ
      ?auto_15406 - OBJ
      ?auto_15407 - OBJ
      ?auto_15408 - OBJ
      ?auto_15409 - OBJ
      ?auto_15405 - LOCATION
    )
    :vars
    (
      ?auto_15410 - LOCATION
      ?auto_15411 - CITY
      ?auto_15412 - LOCATION
      ?auto_15413 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15406 ?auto_15404 ) ( GREATER-THAN ?auto_15407 ?auto_15404 ) ( GREATER-THAN ?auto_15407 ?auto_15406 ) ( GREATER-THAN ?auto_15408 ?auto_15404 ) ( GREATER-THAN ?auto_15408 ?auto_15406 ) ( GREATER-THAN ?auto_15408 ?auto_15407 ) ( GREATER-THAN ?auto_15409 ?auto_15404 ) ( GREATER-THAN ?auto_15409 ?auto_15406 ) ( GREATER-THAN ?auto_15409 ?auto_15407 ) ( GREATER-THAN ?auto_15409 ?auto_15408 ) ( IN-CITY ?auto_15410 ?auto_15411 ) ( IN-CITY ?auto_15405 ?auto_15411 ) ( not ( = ?auto_15405 ?auto_15410 ) ) ( OBJ-AT ?auto_15409 ?auto_15410 ) ( not ( = ?auto_15404 ?auto_15406 ) ) ( not ( = ?auto_15404 ?auto_15407 ) ) ( not ( = ?auto_15404 ?auto_15408 ) ) ( not ( = ?auto_15404 ?auto_15409 ) ) ( not ( = ?auto_15406 ?auto_15407 ) ) ( not ( = ?auto_15406 ?auto_15408 ) ) ( not ( = ?auto_15406 ?auto_15409 ) ) ( not ( = ?auto_15407 ?auto_15408 ) ) ( not ( = ?auto_15407 ?auto_15409 ) ) ( not ( = ?auto_15408 ?auto_15409 ) ) ( IN-CITY ?auto_15412 ?auto_15411 ) ( not ( = ?auto_15405 ?auto_15412 ) ) ( not ( = ?auto_15410 ?auto_15412 ) ) ( OBJ-AT ?auto_15408 ?auto_15412 ) ( OBJ-AT ?auto_15407 ?auto_15410 ) ( OBJ-AT ?auto_15406 ?auto_15412 ) ( IN-TRUCK ?auto_15404 ?auto_15413 ) ( TRUCK-AT ?auto_15413 ?auto_15412 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15413 ?auto_15412 ?auto_15405 ?auto_15411 )
      ( DELIVER-5PKG ?auto_15404 ?auto_15406 ?auto_15407 ?auto_15408 ?auto_15409 ?auto_15405 )
      ( DELIVER-5PKG-VERIFY ?auto_15404 ?auto_15406 ?auto_15407 ?auto_15408 ?auto_15409 ?auto_15405 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15420 - OBJ
      ?auto_15422 - OBJ
      ?auto_15423 - OBJ
      ?auto_15424 - OBJ
      ?auto_15425 - OBJ
      ?auto_15421 - LOCATION
    )
    :vars
    (
      ?auto_15426 - LOCATION
      ?auto_15427 - CITY
      ?auto_15429 - LOCATION
      ?auto_15428 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15422 ?auto_15420 ) ( GREATER-THAN ?auto_15423 ?auto_15420 ) ( GREATER-THAN ?auto_15423 ?auto_15422 ) ( GREATER-THAN ?auto_15424 ?auto_15420 ) ( GREATER-THAN ?auto_15424 ?auto_15422 ) ( GREATER-THAN ?auto_15424 ?auto_15423 ) ( GREATER-THAN ?auto_15425 ?auto_15420 ) ( GREATER-THAN ?auto_15425 ?auto_15422 ) ( GREATER-THAN ?auto_15425 ?auto_15423 ) ( GREATER-THAN ?auto_15425 ?auto_15424 ) ( IN-CITY ?auto_15426 ?auto_15427 ) ( IN-CITY ?auto_15421 ?auto_15427 ) ( not ( = ?auto_15421 ?auto_15426 ) ) ( OBJ-AT ?auto_15425 ?auto_15426 ) ( not ( = ?auto_15420 ?auto_15422 ) ) ( not ( = ?auto_15420 ?auto_15423 ) ) ( not ( = ?auto_15420 ?auto_15424 ) ) ( not ( = ?auto_15420 ?auto_15425 ) ) ( not ( = ?auto_15422 ?auto_15423 ) ) ( not ( = ?auto_15422 ?auto_15424 ) ) ( not ( = ?auto_15422 ?auto_15425 ) ) ( not ( = ?auto_15423 ?auto_15424 ) ) ( not ( = ?auto_15423 ?auto_15425 ) ) ( not ( = ?auto_15424 ?auto_15425 ) ) ( IN-CITY ?auto_15429 ?auto_15427 ) ( not ( = ?auto_15421 ?auto_15429 ) ) ( not ( = ?auto_15426 ?auto_15429 ) ) ( OBJ-AT ?auto_15424 ?auto_15429 ) ( OBJ-AT ?auto_15423 ?auto_15426 ) ( OBJ-AT ?auto_15422 ?auto_15429 ) ( TRUCK-AT ?auto_15428 ?auto_15429 ) ( OBJ-AT ?auto_15420 ?auto_15429 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15420 ?auto_15428 ?auto_15429 )
      ( DELIVER-5PKG ?auto_15420 ?auto_15422 ?auto_15423 ?auto_15424 ?auto_15425 ?auto_15421 )
      ( DELIVER-5PKG-VERIFY ?auto_15420 ?auto_15422 ?auto_15423 ?auto_15424 ?auto_15425 ?auto_15421 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_15436 - OBJ
      ?auto_15438 - OBJ
      ?auto_15439 - OBJ
      ?auto_15440 - OBJ
      ?auto_15441 - OBJ
      ?auto_15437 - LOCATION
    )
    :vars
    (
      ?auto_15442 - LOCATION
      ?auto_15443 - CITY
      ?auto_15444 - LOCATION
      ?auto_15445 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15438 ?auto_15436 ) ( GREATER-THAN ?auto_15439 ?auto_15436 ) ( GREATER-THAN ?auto_15439 ?auto_15438 ) ( GREATER-THAN ?auto_15440 ?auto_15436 ) ( GREATER-THAN ?auto_15440 ?auto_15438 ) ( GREATER-THAN ?auto_15440 ?auto_15439 ) ( GREATER-THAN ?auto_15441 ?auto_15436 ) ( GREATER-THAN ?auto_15441 ?auto_15438 ) ( GREATER-THAN ?auto_15441 ?auto_15439 ) ( GREATER-THAN ?auto_15441 ?auto_15440 ) ( IN-CITY ?auto_15442 ?auto_15443 ) ( IN-CITY ?auto_15437 ?auto_15443 ) ( not ( = ?auto_15437 ?auto_15442 ) ) ( OBJ-AT ?auto_15441 ?auto_15442 ) ( not ( = ?auto_15436 ?auto_15438 ) ) ( not ( = ?auto_15436 ?auto_15439 ) ) ( not ( = ?auto_15436 ?auto_15440 ) ) ( not ( = ?auto_15436 ?auto_15441 ) ) ( not ( = ?auto_15438 ?auto_15439 ) ) ( not ( = ?auto_15438 ?auto_15440 ) ) ( not ( = ?auto_15438 ?auto_15441 ) ) ( not ( = ?auto_15439 ?auto_15440 ) ) ( not ( = ?auto_15439 ?auto_15441 ) ) ( not ( = ?auto_15440 ?auto_15441 ) ) ( IN-CITY ?auto_15444 ?auto_15443 ) ( not ( = ?auto_15437 ?auto_15444 ) ) ( not ( = ?auto_15442 ?auto_15444 ) ) ( OBJ-AT ?auto_15440 ?auto_15444 ) ( OBJ-AT ?auto_15439 ?auto_15442 ) ( OBJ-AT ?auto_15438 ?auto_15444 ) ( OBJ-AT ?auto_15436 ?auto_15444 ) ( TRUCK-AT ?auto_15445 ?auto_15437 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15445 ?auto_15437 ?auto_15444 ?auto_15443 )
      ( DELIVER-5PKG ?auto_15436 ?auto_15438 ?auto_15439 ?auto_15440 ?auto_15441 ?auto_15437 )
      ( DELIVER-5PKG-VERIFY ?auto_15436 ?auto_15438 ?auto_15439 ?auto_15440 ?auto_15441 ?auto_15437 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15479 - OBJ
      ?auto_15481 - OBJ
      ?auto_15483 - OBJ
      ?auto_15484 - OBJ
      ?auto_15485 - OBJ
      ?auto_15482 - OBJ
      ?auto_15480 - LOCATION
    )
    :vars
    (
      ?auto_15486 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15481 ?auto_15479 ) ( GREATER-THAN ?auto_15483 ?auto_15479 ) ( GREATER-THAN ?auto_15483 ?auto_15481 ) ( GREATER-THAN ?auto_15484 ?auto_15479 ) ( GREATER-THAN ?auto_15484 ?auto_15481 ) ( GREATER-THAN ?auto_15484 ?auto_15483 ) ( GREATER-THAN ?auto_15485 ?auto_15479 ) ( GREATER-THAN ?auto_15485 ?auto_15481 ) ( GREATER-THAN ?auto_15485 ?auto_15483 ) ( GREATER-THAN ?auto_15485 ?auto_15484 ) ( GREATER-THAN ?auto_15482 ?auto_15479 ) ( GREATER-THAN ?auto_15482 ?auto_15481 ) ( GREATER-THAN ?auto_15482 ?auto_15483 ) ( GREATER-THAN ?auto_15482 ?auto_15484 ) ( GREATER-THAN ?auto_15482 ?auto_15485 ) ( TRUCK-AT ?auto_15486 ?auto_15480 ) ( IN-TRUCK ?auto_15482 ?auto_15486 ) ( OBJ-AT ?auto_15479 ?auto_15480 ) ( OBJ-AT ?auto_15481 ?auto_15480 ) ( OBJ-AT ?auto_15483 ?auto_15480 ) ( OBJ-AT ?auto_15484 ?auto_15480 ) ( OBJ-AT ?auto_15485 ?auto_15480 ) ( not ( = ?auto_15479 ?auto_15481 ) ) ( not ( = ?auto_15479 ?auto_15483 ) ) ( not ( = ?auto_15479 ?auto_15484 ) ) ( not ( = ?auto_15479 ?auto_15485 ) ) ( not ( = ?auto_15479 ?auto_15482 ) ) ( not ( = ?auto_15481 ?auto_15483 ) ) ( not ( = ?auto_15481 ?auto_15484 ) ) ( not ( = ?auto_15481 ?auto_15485 ) ) ( not ( = ?auto_15481 ?auto_15482 ) ) ( not ( = ?auto_15483 ?auto_15484 ) ) ( not ( = ?auto_15483 ?auto_15485 ) ) ( not ( = ?auto_15483 ?auto_15482 ) ) ( not ( = ?auto_15484 ?auto_15485 ) ) ( not ( = ?auto_15484 ?auto_15482 ) ) ( not ( = ?auto_15485 ?auto_15482 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15482 ?auto_15480 )
      ( DELIVER-6PKG-VERIFY ?auto_15479 ?auto_15481 ?auto_15483 ?auto_15484 ?auto_15485 ?auto_15482 ?auto_15480 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15494 - OBJ
      ?auto_15496 - OBJ
      ?auto_15498 - OBJ
      ?auto_15499 - OBJ
      ?auto_15500 - OBJ
      ?auto_15497 - OBJ
      ?auto_15495 - LOCATION
    )
    :vars
    (
      ?auto_15501 - TRUCK
      ?auto_15502 - LOCATION
      ?auto_15503 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15496 ?auto_15494 ) ( GREATER-THAN ?auto_15498 ?auto_15494 ) ( GREATER-THAN ?auto_15498 ?auto_15496 ) ( GREATER-THAN ?auto_15499 ?auto_15494 ) ( GREATER-THAN ?auto_15499 ?auto_15496 ) ( GREATER-THAN ?auto_15499 ?auto_15498 ) ( GREATER-THAN ?auto_15500 ?auto_15494 ) ( GREATER-THAN ?auto_15500 ?auto_15496 ) ( GREATER-THAN ?auto_15500 ?auto_15498 ) ( GREATER-THAN ?auto_15500 ?auto_15499 ) ( GREATER-THAN ?auto_15497 ?auto_15494 ) ( GREATER-THAN ?auto_15497 ?auto_15496 ) ( GREATER-THAN ?auto_15497 ?auto_15498 ) ( GREATER-THAN ?auto_15497 ?auto_15499 ) ( GREATER-THAN ?auto_15497 ?auto_15500 ) ( IN-TRUCK ?auto_15497 ?auto_15501 ) ( TRUCK-AT ?auto_15501 ?auto_15502 ) ( IN-CITY ?auto_15502 ?auto_15503 ) ( IN-CITY ?auto_15495 ?auto_15503 ) ( not ( = ?auto_15495 ?auto_15502 ) ) ( OBJ-AT ?auto_15494 ?auto_15495 ) ( OBJ-AT ?auto_15496 ?auto_15495 ) ( OBJ-AT ?auto_15498 ?auto_15495 ) ( OBJ-AT ?auto_15499 ?auto_15495 ) ( OBJ-AT ?auto_15500 ?auto_15495 ) ( not ( = ?auto_15494 ?auto_15496 ) ) ( not ( = ?auto_15494 ?auto_15498 ) ) ( not ( = ?auto_15494 ?auto_15499 ) ) ( not ( = ?auto_15494 ?auto_15500 ) ) ( not ( = ?auto_15494 ?auto_15497 ) ) ( not ( = ?auto_15496 ?auto_15498 ) ) ( not ( = ?auto_15496 ?auto_15499 ) ) ( not ( = ?auto_15496 ?auto_15500 ) ) ( not ( = ?auto_15496 ?auto_15497 ) ) ( not ( = ?auto_15498 ?auto_15499 ) ) ( not ( = ?auto_15498 ?auto_15500 ) ) ( not ( = ?auto_15498 ?auto_15497 ) ) ( not ( = ?auto_15499 ?auto_15500 ) ) ( not ( = ?auto_15499 ?auto_15497 ) ) ( not ( = ?auto_15500 ?auto_15497 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15497 ?auto_15495 )
      ( DELIVER-6PKG-VERIFY ?auto_15494 ?auto_15496 ?auto_15498 ?auto_15499 ?auto_15500 ?auto_15497 ?auto_15495 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15511 - OBJ
      ?auto_15513 - OBJ
      ?auto_15515 - OBJ
      ?auto_15516 - OBJ
      ?auto_15517 - OBJ
      ?auto_15514 - OBJ
      ?auto_15512 - LOCATION
    )
    :vars
    (
      ?auto_15520 - TRUCK
      ?auto_15519 - LOCATION
      ?auto_15518 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15513 ?auto_15511 ) ( GREATER-THAN ?auto_15515 ?auto_15511 ) ( GREATER-THAN ?auto_15515 ?auto_15513 ) ( GREATER-THAN ?auto_15516 ?auto_15511 ) ( GREATER-THAN ?auto_15516 ?auto_15513 ) ( GREATER-THAN ?auto_15516 ?auto_15515 ) ( GREATER-THAN ?auto_15517 ?auto_15511 ) ( GREATER-THAN ?auto_15517 ?auto_15513 ) ( GREATER-THAN ?auto_15517 ?auto_15515 ) ( GREATER-THAN ?auto_15517 ?auto_15516 ) ( GREATER-THAN ?auto_15514 ?auto_15511 ) ( GREATER-THAN ?auto_15514 ?auto_15513 ) ( GREATER-THAN ?auto_15514 ?auto_15515 ) ( GREATER-THAN ?auto_15514 ?auto_15516 ) ( GREATER-THAN ?auto_15514 ?auto_15517 ) ( TRUCK-AT ?auto_15520 ?auto_15519 ) ( IN-CITY ?auto_15519 ?auto_15518 ) ( IN-CITY ?auto_15512 ?auto_15518 ) ( not ( = ?auto_15512 ?auto_15519 ) ) ( OBJ-AT ?auto_15514 ?auto_15519 ) ( OBJ-AT ?auto_15511 ?auto_15512 ) ( OBJ-AT ?auto_15513 ?auto_15512 ) ( OBJ-AT ?auto_15515 ?auto_15512 ) ( OBJ-AT ?auto_15516 ?auto_15512 ) ( OBJ-AT ?auto_15517 ?auto_15512 ) ( not ( = ?auto_15511 ?auto_15513 ) ) ( not ( = ?auto_15511 ?auto_15515 ) ) ( not ( = ?auto_15511 ?auto_15516 ) ) ( not ( = ?auto_15511 ?auto_15517 ) ) ( not ( = ?auto_15511 ?auto_15514 ) ) ( not ( = ?auto_15513 ?auto_15515 ) ) ( not ( = ?auto_15513 ?auto_15516 ) ) ( not ( = ?auto_15513 ?auto_15517 ) ) ( not ( = ?auto_15513 ?auto_15514 ) ) ( not ( = ?auto_15515 ?auto_15516 ) ) ( not ( = ?auto_15515 ?auto_15517 ) ) ( not ( = ?auto_15515 ?auto_15514 ) ) ( not ( = ?auto_15516 ?auto_15517 ) ) ( not ( = ?auto_15516 ?auto_15514 ) ) ( not ( = ?auto_15517 ?auto_15514 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15514 ?auto_15512 )
      ( DELIVER-6PKG-VERIFY ?auto_15511 ?auto_15513 ?auto_15515 ?auto_15516 ?auto_15517 ?auto_15514 ?auto_15512 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15528 - OBJ
      ?auto_15530 - OBJ
      ?auto_15532 - OBJ
      ?auto_15533 - OBJ
      ?auto_15534 - OBJ
      ?auto_15531 - OBJ
      ?auto_15529 - LOCATION
    )
    :vars
    (
      ?auto_15535 - LOCATION
      ?auto_15536 - CITY
      ?auto_15537 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15530 ?auto_15528 ) ( GREATER-THAN ?auto_15532 ?auto_15528 ) ( GREATER-THAN ?auto_15532 ?auto_15530 ) ( GREATER-THAN ?auto_15533 ?auto_15528 ) ( GREATER-THAN ?auto_15533 ?auto_15530 ) ( GREATER-THAN ?auto_15533 ?auto_15532 ) ( GREATER-THAN ?auto_15534 ?auto_15528 ) ( GREATER-THAN ?auto_15534 ?auto_15530 ) ( GREATER-THAN ?auto_15534 ?auto_15532 ) ( GREATER-THAN ?auto_15534 ?auto_15533 ) ( GREATER-THAN ?auto_15531 ?auto_15528 ) ( GREATER-THAN ?auto_15531 ?auto_15530 ) ( GREATER-THAN ?auto_15531 ?auto_15532 ) ( GREATER-THAN ?auto_15531 ?auto_15533 ) ( GREATER-THAN ?auto_15531 ?auto_15534 ) ( IN-CITY ?auto_15535 ?auto_15536 ) ( IN-CITY ?auto_15529 ?auto_15536 ) ( not ( = ?auto_15529 ?auto_15535 ) ) ( OBJ-AT ?auto_15531 ?auto_15535 ) ( TRUCK-AT ?auto_15537 ?auto_15529 ) ( OBJ-AT ?auto_15528 ?auto_15529 ) ( OBJ-AT ?auto_15530 ?auto_15529 ) ( OBJ-AT ?auto_15532 ?auto_15529 ) ( OBJ-AT ?auto_15533 ?auto_15529 ) ( OBJ-AT ?auto_15534 ?auto_15529 ) ( not ( = ?auto_15528 ?auto_15530 ) ) ( not ( = ?auto_15528 ?auto_15532 ) ) ( not ( = ?auto_15528 ?auto_15533 ) ) ( not ( = ?auto_15528 ?auto_15534 ) ) ( not ( = ?auto_15528 ?auto_15531 ) ) ( not ( = ?auto_15530 ?auto_15532 ) ) ( not ( = ?auto_15530 ?auto_15533 ) ) ( not ( = ?auto_15530 ?auto_15534 ) ) ( not ( = ?auto_15530 ?auto_15531 ) ) ( not ( = ?auto_15532 ?auto_15533 ) ) ( not ( = ?auto_15532 ?auto_15534 ) ) ( not ( = ?auto_15532 ?auto_15531 ) ) ( not ( = ?auto_15533 ?auto_15534 ) ) ( not ( = ?auto_15533 ?auto_15531 ) ) ( not ( = ?auto_15534 ?auto_15531 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15531 ?auto_15529 )
      ( DELIVER-6PKG-VERIFY ?auto_15528 ?auto_15530 ?auto_15532 ?auto_15533 ?auto_15534 ?auto_15531 ?auto_15529 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15545 - OBJ
      ?auto_15547 - OBJ
      ?auto_15549 - OBJ
      ?auto_15550 - OBJ
      ?auto_15551 - OBJ
      ?auto_15548 - OBJ
      ?auto_15546 - LOCATION
    )
    :vars
    (
      ?auto_15554 - LOCATION
      ?auto_15552 - CITY
      ?auto_15553 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15547 ?auto_15545 ) ( GREATER-THAN ?auto_15549 ?auto_15545 ) ( GREATER-THAN ?auto_15549 ?auto_15547 ) ( GREATER-THAN ?auto_15550 ?auto_15545 ) ( GREATER-THAN ?auto_15550 ?auto_15547 ) ( GREATER-THAN ?auto_15550 ?auto_15549 ) ( GREATER-THAN ?auto_15551 ?auto_15545 ) ( GREATER-THAN ?auto_15551 ?auto_15547 ) ( GREATER-THAN ?auto_15551 ?auto_15549 ) ( GREATER-THAN ?auto_15551 ?auto_15550 ) ( GREATER-THAN ?auto_15548 ?auto_15545 ) ( GREATER-THAN ?auto_15548 ?auto_15547 ) ( GREATER-THAN ?auto_15548 ?auto_15549 ) ( GREATER-THAN ?auto_15548 ?auto_15550 ) ( GREATER-THAN ?auto_15548 ?auto_15551 ) ( IN-CITY ?auto_15554 ?auto_15552 ) ( IN-CITY ?auto_15546 ?auto_15552 ) ( not ( = ?auto_15546 ?auto_15554 ) ) ( OBJ-AT ?auto_15548 ?auto_15554 ) ( TRUCK-AT ?auto_15553 ?auto_15546 ) ( OBJ-AT ?auto_15545 ?auto_15546 ) ( OBJ-AT ?auto_15547 ?auto_15546 ) ( OBJ-AT ?auto_15549 ?auto_15546 ) ( OBJ-AT ?auto_15550 ?auto_15546 ) ( not ( = ?auto_15545 ?auto_15547 ) ) ( not ( = ?auto_15545 ?auto_15549 ) ) ( not ( = ?auto_15545 ?auto_15550 ) ) ( not ( = ?auto_15545 ?auto_15551 ) ) ( not ( = ?auto_15545 ?auto_15548 ) ) ( not ( = ?auto_15547 ?auto_15549 ) ) ( not ( = ?auto_15547 ?auto_15550 ) ) ( not ( = ?auto_15547 ?auto_15551 ) ) ( not ( = ?auto_15547 ?auto_15548 ) ) ( not ( = ?auto_15549 ?auto_15550 ) ) ( not ( = ?auto_15549 ?auto_15551 ) ) ( not ( = ?auto_15549 ?auto_15548 ) ) ( not ( = ?auto_15550 ?auto_15551 ) ) ( not ( = ?auto_15550 ?auto_15548 ) ) ( not ( = ?auto_15551 ?auto_15548 ) ) ( IN-TRUCK ?auto_15551 ?auto_15553 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15551 ?auto_15546 )
      ( DELIVER-6PKG ?auto_15545 ?auto_15547 ?auto_15549 ?auto_15550 ?auto_15551 ?auto_15548 ?auto_15546 )
      ( DELIVER-6PKG-VERIFY ?auto_15545 ?auto_15547 ?auto_15549 ?auto_15550 ?auto_15551 ?auto_15548 ?auto_15546 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15562 - OBJ
      ?auto_15564 - OBJ
      ?auto_15566 - OBJ
      ?auto_15567 - OBJ
      ?auto_15568 - OBJ
      ?auto_15565 - OBJ
      ?auto_15563 - LOCATION
    )
    :vars
    (
      ?auto_15571 - LOCATION
      ?auto_15570 - CITY
      ?auto_15569 - TRUCK
      ?auto_15572 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15564 ?auto_15562 ) ( GREATER-THAN ?auto_15566 ?auto_15562 ) ( GREATER-THAN ?auto_15566 ?auto_15564 ) ( GREATER-THAN ?auto_15567 ?auto_15562 ) ( GREATER-THAN ?auto_15567 ?auto_15564 ) ( GREATER-THAN ?auto_15567 ?auto_15566 ) ( GREATER-THAN ?auto_15568 ?auto_15562 ) ( GREATER-THAN ?auto_15568 ?auto_15564 ) ( GREATER-THAN ?auto_15568 ?auto_15566 ) ( GREATER-THAN ?auto_15568 ?auto_15567 ) ( GREATER-THAN ?auto_15565 ?auto_15562 ) ( GREATER-THAN ?auto_15565 ?auto_15564 ) ( GREATER-THAN ?auto_15565 ?auto_15566 ) ( GREATER-THAN ?auto_15565 ?auto_15567 ) ( GREATER-THAN ?auto_15565 ?auto_15568 ) ( IN-CITY ?auto_15571 ?auto_15570 ) ( IN-CITY ?auto_15563 ?auto_15570 ) ( not ( = ?auto_15563 ?auto_15571 ) ) ( OBJ-AT ?auto_15565 ?auto_15571 ) ( OBJ-AT ?auto_15562 ?auto_15563 ) ( OBJ-AT ?auto_15564 ?auto_15563 ) ( OBJ-AT ?auto_15566 ?auto_15563 ) ( OBJ-AT ?auto_15567 ?auto_15563 ) ( not ( = ?auto_15562 ?auto_15564 ) ) ( not ( = ?auto_15562 ?auto_15566 ) ) ( not ( = ?auto_15562 ?auto_15567 ) ) ( not ( = ?auto_15562 ?auto_15568 ) ) ( not ( = ?auto_15562 ?auto_15565 ) ) ( not ( = ?auto_15564 ?auto_15566 ) ) ( not ( = ?auto_15564 ?auto_15567 ) ) ( not ( = ?auto_15564 ?auto_15568 ) ) ( not ( = ?auto_15564 ?auto_15565 ) ) ( not ( = ?auto_15566 ?auto_15567 ) ) ( not ( = ?auto_15566 ?auto_15568 ) ) ( not ( = ?auto_15566 ?auto_15565 ) ) ( not ( = ?auto_15567 ?auto_15568 ) ) ( not ( = ?auto_15567 ?auto_15565 ) ) ( not ( = ?auto_15568 ?auto_15565 ) ) ( IN-TRUCK ?auto_15568 ?auto_15569 ) ( TRUCK-AT ?auto_15569 ?auto_15572 ) ( IN-CITY ?auto_15572 ?auto_15570 ) ( not ( = ?auto_15563 ?auto_15572 ) ) ( not ( = ?auto_15571 ?auto_15572 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15569 ?auto_15572 ?auto_15563 ?auto_15570 )
      ( DELIVER-6PKG ?auto_15562 ?auto_15564 ?auto_15566 ?auto_15567 ?auto_15568 ?auto_15565 ?auto_15563 )
      ( DELIVER-6PKG-VERIFY ?auto_15562 ?auto_15564 ?auto_15566 ?auto_15567 ?auto_15568 ?auto_15565 ?auto_15563 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15580 - OBJ
      ?auto_15582 - OBJ
      ?auto_15584 - OBJ
      ?auto_15585 - OBJ
      ?auto_15586 - OBJ
      ?auto_15583 - OBJ
      ?auto_15581 - LOCATION
    )
    :vars
    (
      ?auto_15587 - LOCATION
      ?auto_15589 - CITY
      ?auto_15590 - TRUCK
      ?auto_15588 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15582 ?auto_15580 ) ( GREATER-THAN ?auto_15584 ?auto_15580 ) ( GREATER-THAN ?auto_15584 ?auto_15582 ) ( GREATER-THAN ?auto_15585 ?auto_15580 ) ( GREATER-THAN ?auto_15585 ?auto_15582 ) ( GREATER-THAN ?auto_15585 ?auto_15584 ) ( GREATER-THAN ?auto_15586 ?auto_15580 ) ( GREATER-THAN ?auto_15586 ?auto_15582 ) ( GREATER-THAN ?auto_15586 ?auto_15584 ) ( GREATER-THAN ?auto_15586 ?auto_15585 ) ( GREATER-THAN ?auto_15583 ?auto_15580 ) ( GREATER-THAN ?auto_15583 ?auto_15582 ) ( GREATER-THAN ?auto_15583 ?auto_15584 ) ( GREATER-THAN ?auto_15583 ?auto_15585 ) ( GREATER-THAN ?auto_15583 ?auto_15586 ) ( IN-CITY ?auto_15587 ?auto_15589 ) ( IN-CITY ?auto_15581 ?auto_15589 ) ( not ( = ?auto_15581 ?auto_15587 ) ) ( OBJ-AT ?auto_15583 ?auto_15587 ) ( OBJ-AT ?auto_15580 ?auto_15581 ) ( OBJ-AT ?auto_15582 ?auto_15581 ) ( OBJ-AT ?auto_15584 ?auto_15581 ) ( OBJ-AT ?auto_15585 ?auto_15581 ) ( not ( = ?auto_15580 ?auto_15582 ) ) ( not ( = ?auto_15580 ?auto_15584 ) ) ( not ( = ?auto_15580 ?auto_15585 ) ) ( not ( = ?auto_15580 ?auto_15586 ) ) ( not ( = ?auto_15580 ?auto_15583 ) ) ( not ( = ?auto_15582 ?auto_15584 ) ) ( not ( = ?auto_15582 ?auto_15585 ) ) ( not ( = ?auto_15582 ?auto_15586 ) ) ( not ( = ?auto_15582 ?auto_15583 ) ) ( not ( = ?auto_15584 ?auto_15585 ) ) ( not ( = ?auto_15584 ?auto_15586 ) ) ( not ( = ?auto_15584 ?auto_15583 ) ) ( not ( = ?auto_15585 ?auto_15586 ) ) ( not ( = ?auto_15585 ?auto_15583 ) ) ( not ( = ?auto_15586 ?auto_15583 ) ) ( TRUCK-AT ?auto_15590 ?auto_15588 ) ( IN-CITY ?auto_15588 ?auto_15589 ) ( not ( = ?auto_15581 ?auto_15588 ) ) ( not ( = ?auto_15587 ?auto_15588 ) ) ( OBJ-AT ?auto_15586 ?auto_15588 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15586 ?auto_15590 ?auto_15588 )
      ( DELIVER-6PKG ?auto_15580 ?auto_15582 ?auto_15584 ?auto_15585 ?auto_15586 ?auto_15583 ?auto_15581 )
      ( DELIVER-6PKG-VERIFY ?auto_15580 ?auto_15582 ?auto_15584 ?auto_15585 ?auto_15586 ?auto_15583 ?auto_15581 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15598 - OBJ
      ?auto_15600 - OBJ
      ?auto_15602 - OBJ
      ?auto_15603 - OBJ
      ?auto_15604 - OBJ
      ?auto_15601 - OBJ
      ?auto_15599 - LOCATION
    )
    :vars
    (
      ?auto_15606 - LOCATION
      ?auto_15605 - CITY
      ?auto_15608 - LOCATION
      ?auto_15607 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15600 ?auto_15598 ) ( GREATER-THAN ?auto_15602 ?auto_15598 ) ( GREATER-THAN ?auto_15602 ?auto_15600 ) ( GREATER-THAN ?auto_15603 ?auto_15598 ) ( GREATER-THAN ?auto_15603 ?auto_15600 ) ( GREATER-THAN ?auto_15603 ?auto_15602 ) ( GREATER-THAN ?auto_15604 ?auto_15598 ) ( GREATER-THAN ?auto_15604 ?auto_15600 ) ( GREATER-THAN ?auto_15604 ?auto_15602 ) ( GREATER-THAN ?auto_15604 ?auto_15603 ) ( GREATER-THAN ?auto_15601 ?auto_15598 ) ( GREATER-THAN ?auto_15601 ?auto_15600 ) ( GREATER-THAN ?auto_15601 ?auto_15602 ) ( GREATER-THAN ?auto_15601 ?auto_15603 ) ( GREATER-THAN ?auto_15601 ?auto_15604 ) ( IN-CITY ?auto_15606 ?auto_15605 ) ( IN-CITY ?auto_15599 ?auto_15605 ) ( not ( = ?auto_15599 ?auto_15606 ) ) ( OBJ-AT ?auto_15601 ?auto_15606 ) ( OBJ-AT ?auto_15598 ?auto_15599 ) ( OBJ-AT ?auto_15600 ?auto_15599 ) ( OBJ-AT ?auto_15602 ?auto_15599 ) ( OBJ-AT ?auto_15603 ?auto_15599 ) ( not ( = ?auto_15598 ?auto_15600 ) ) ( not ( = ?auto_15598 ?auto_15602 ) ) ( not ( = ?auto_15598 ?auto_15603 ) ) ( not ( = ?auto_15598 ?auto_15604 ) ) ( not ( = ?auto_15598 ?auto_15601 ) ) ( not ( = ?auto_15600 ?auto_15602 ) ) ( not ( = ?auto_15600 ?auto_15603 ) ) ( not ( = ?auto_15600 ?auto_15604 ) ) ( not ( = ?auto_15600 ?auto_15601 ) ) ( not ( = ?auto_15602 ?auto_15603 ) ) ( not ( = ?auto_15602 ?auto_15604 ) ) ( not ( = ?auto_15602 ?auto_15601 ) ) ( not ( = ?auto_15603 ?auto_15604 ) ) ( not ( = ?auto_15603 ?auto_15601 ) ) ( not ( = ?auto_15604 ?auto_15601 ) ) ( IN-CITY ?auto_15608 ?auto_15605 ) ( not ( = ?auto_15599 ?auto_15608 ) ) ( not ( = ?auto_15606 ?auto_15608 ) ) ( OBJ-AT ?auto_15604 ?auto_15608 ) ( TRUCK-AT ?auto_15607 ?auto_15599 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15607 ?auto_15599 ?auto_15608 ?auto_15605 )
      ( DELIVER-6PKG ?auto_15598 ?auto_15600 ?auto_15602 ?auto_15603 ?auto_15604 ?auto_15601 ?auto_15599 )
      ( DELIVER-6PKG-VERIFY ?auto_15598 ?auto_15600 ?auto_15602 ?auto_15603 ?auto_15604 ?auto_15601 ?auto_15599 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15616 - OBJ
      ?auto_15618 - OBJ
      ?auto_15620 - OBJ
      ?auto_15621 - OBJ
      ?auto_15622 - OBJ
      ?auto_15619 - OBJ
      ?auto_15617 - LOCATION
    )
    :vars
    (
      ?auto_15625 - LOCATION
      ?auto_15623 - CITY
      ?auto_15626 - LOCATION
      ?auto_15624 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15618 ?auto_15616 ) ( GREATER-THAN ?auto_15620 ?auto_15616 ) ( GREATER-THAN ?auto_15620 ?auto_15618 ) ( GREATER-THAN ?auto_15621 ?auto_15616 ) ( GREATER-THAN ?auto_15621 ?auto_15618 ) ( GREATER-THAN ?auto_15621 ?auto_15620 ) ( GREATER-THAN ?auto_15622 ?auto_15616 ) ( GREATER-THAN ?auto_15622 ?auto_15618 ) ( GREATER-THAN ?auto_15622 ?auto_15620 ) ( GREATER-THAN ?auto_15622 ?auto_15621 ) ( GREATER-THAN ?auto_15619 ?auto_15616 ) ( GREATER-THAN ?auto_15619 ?auto_15618 ) ( GREATER-THAN ?auto_15619 ?auto_15620 ) ( GREATER-THAN ?auto_15619 ?auto_15621 ) ( GREATER-THAN ?auto_15619 ?auto_15622 ) ( IN-CITY ?auto_15625 ?auto_15623 ) ( IN-CITY ?auto_15617 ?auto_15623 ) ( not ( = ?auto_15617 ?auto_15625 ) ) ( OBJ-AT ?auto_15619 ?auto_15625 ) ( OBJ-AT ?auto_15616 ?auto_15617 ) ( OBJ-AT ?auto_15618 ?auto_15617 ) ( OBJ-AT ?auto_15620 ?auto_15617 ) ( not ( = ?auto_15616 ?auto_15618 ) ) ( not ( = ?auto_15616 ?auto_15620 ) ) ( not ( = ?auto_15616 ?auto_15621 ) ) ( not ( = ?auto_15616 ?auto_15622 ) ) ( not ( = ?auto_15616 ?auto_15619 ) ) ( not ( = ?auto_15618 ?auto_15620 ) ) ( not ( = ?auto_15618 ?auto_15621 ) ) ( not ( = ?auto_15618 ?auto_15622 ) ) ( not ( = ?auto_15618 ?auto_15619 ) ) ( not ( = ?auto_15620 ?auto_15621 ) ) ( not ( = ?auto_15620 ?auto_15622 ) ) ( not ( = ?auto_15620 ?auto_15619 ) ) ( not ( = ?auto_15621 ?auto_15622 ) ) ( not ( = ?auto_15621 ?auto_15619 ) ) ( not ( = ?auto_15622 ?auto_15619 ) ) ( IN-CITY ?auto_15626 ?auto_15623 ) ( not ( = ?auto_15617 ?auto_15626 ) ) ( not ( = ?auto_15625 ?auto_15626 ) ) ( OBJ-AT ?auto_15622 ?auto_15626 ) ( TRUCK-AT ?auto_15624 ?auto_15617 ) ( IN-TRUCK ?auto_15621 ?auto_15624 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15621 ?auto_15617 )
      ( DELIVER-6PKG ?auto_15616 ?auto_15618 ?auto_15620 ?auto_15621 ?auto_15622 ?auto_15619 ?auto_15617 )
      ( DELIVER-6PKG-VERIFY ?auto_15616 ?auto_15618 ?auto_15620 ?auto_15621 ?auto_15622 ?auto_15619 ?auto_15617 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15634 - OBJ
      ?auto_15636 - OBJ
      ?auto_15638 - OBJ
      ?auto_15639 - OBJ
      ?auto_15640 - OBJ
      ?auto_15637 - OBJ
      ?auto_15635 - LOCATION
    )
    :vars
    (
      ?auto_15644 - LOCATION
      ?auto_15641 - CITY
      ?auto_15643 - LOCATION
      ?auto_15642 - TRUCK
      ?auto_15645 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15636 ?auto_15634 ) ( GREATER-THAN ?auto_15638 ?auto_15634 ) ( GREATER-THAN ?auto_15638 ?auto_15636 ) ( GREATER-THAN ?auto_15639 ?auto_15634 ) ( GREATER-THAN ?auto_15639 ?auto_15636 ) ( GREATER-THAN ?auto_15639 ?auto_15638 ) ( GREATER-THAN ?auto_15640 ?auto_15634 ) ( GREATER-THAN ?auto_15640 ?auto_15636 ) ( GREATER-THAN ?auto_15640 ?auto_15638 ) ( GREATER-THAN ?auto_15640 ?auto_15639 ) ( GREATER-THAN ?auto_15637 ?auto_15634 ) ( GREATER-THAN ?auto_15637 ?auto_15636 ) ( GREATER-THAN ?auto_15637 ?auto_15638 ) ( GREATER-THAN ?auto_15637 ?auto_15639 ) ( GREATER-THAN ?auto_15637 ?auto_15640 ) ( IN-CITY ?auto_15644 ?auto_15641 ) ( IN-CITY ?auto_15635 ?auto_15641 ) ( not ( = ?auto_15635 ?auto_15644 ) ) ( OBJ-AT ?auto_15637 ?auto_15644 ) ( OBJ-AT ?auto_15634 ?auto_15635 ) ( OBJ-AT ?auto_15636 ?auto_15635 ) ( OBJ-AT ?auto_15638 ?auto_15635 ) ( not ( = ?auto_15634 ?auto_15636 ) ) ( not ( = ?auto_15634 ?auto_15638 ) ) ( not ( = ?auto_15634 ?auto_15639 ) ) ( not ( = ?auto_15634 ?auto_15640 ) ) ( not ( = ?auto_15634 ?auto_15637 ) ) ( not ( = ?auto_15636 ?auto_15638 ) ) ( not ( = ?auto_15636 ?auto_15639 ) ) ( not ( = ?auto_15636 ?auto_15640 ) ) ( not ( = ?auto_15636 ?auto_15637 ) ) ( not ( = ?auto_15638 ?auto_15639 ) ) ( not ( = ?auto_15638 ?auto_15640 ) ) ( not ( = ?auto_15638 ?auto_15637 ) ) ( not ( = ?auto_15639 ?auto_15640 ) ) ( not ( = ?auto_15639 ?auto_15637 ) ) ( not ( = ?auto_15640 ?auto_15637 ) ) ( IN-CITY ?auto_15643 ?auto_15641 ) ( not ( = ?auto_15635 ?auto_15643 ) ) ( not ( = ?auto_15644 ?auto_15643 ) ) ( OBJ-AT ?auto_15640 ?auto_15643 ) ( IN-TRUCK ?auto_15639 ?auto_15642 ) ( TRUCK-AT ?auto_15642 ?auto_15645 ) ( IN-CITY ?auto_15645 ?auto_15641 ) ( not ( = ?auto_15635 ?auto_15645 ) ) ( not ( = ?auto_15644 ?auto_15645 ) ) ( not ( = ?auto_15643 ?auto_15645 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15642 ?auto_15645 ?auto_15635 ?auto_15641 )
      ( DELIVER-6PKG ?auto_15634 ?auto_15636 ?auto_15638 ?auto_15639 ?auto_15640 ?auto_15637 ?auto_15635 )
      ( DELIVER-6PKG-VERIFY ?auto_15634 ?auto_15636 ?auto_15638 ?auto_15639 ?auto_15640 ?auto_15637 ?auto_15635 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15653 - OBJ
      ?auto_15655 - OBJ
      ?auto_15657 - OBJ
      ?auto_15658 - OBJ
      ?auto_15659 - OBJ
      ?auto_15656 - OBJ
      ?auto_15654 - LOCATION
    )
    :vars
    (
      ?auto_15662 - LOCATION
      ?auto_15663 - CITY
      ?auto_15660 - LOCATION
      ?auto_15661 - TRUCK
      ?auto_15664 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15655 ?auto_15653 ) ( GREATER-THAN ?auto_15657 ?auto_15653 ) ( GREATER-THAN ?auto_15657 ?auto_15655 ) ( GREATER-THAN ?auto_15658 ?auto_15653 ) ( GREATER-THAN ?auto_15658 ?auto_15655 ) ( GREATER-THAN ?auto_15658 ?auto_15657 ) ( GREATER-THAN ?auto_15659 ?auto_15653 ) ( GREATER-THAN ?auto_15659 ?auto_15655 ) ( GREATER-THAN ?auto_15659 ?auto_15657 ) ( GREATER-THAN ?auto_15659 ?auto_15658 ) ( GREATER-THAN ?auto_15656 ?auto_15653 ) ( GREATER-THAN ?auto_15656 ?auto_15655 ) ( GREATER-THAN ?auto_15656 ?auto_15657 ) ( GREATER-THAN ?auto_15656 ?auto_15658 ) ( GREATER-THAN ?auto_15656 ?auto_15659 ) ( IN-CITY ?auto_15662 ?auto_15663 ) ( IN-CITY ?auto_15654 ?auto_15663 ) ( not ( = ?auto_15654 ?auto_15662 ) ) ( OBJ-AT ?auto_15656 ?auto_15662 ) ( OBJ-AT ?auto_15653 ?auto_15654 ) ( OBJ-AT ?auto_15655 ?auto_15654 ) ( OBJ-AT ?auto_15657 ?auto_15654 ) ( not ( = ?auto_15653 ?auto_15655 ) ) ( not ( = ?auto_15653 ?auto_15657 ) ) ( not ( = ?auto_15653 ?auto_15658 ) ) ( not ( = ?auto_15653 ?auto_15659 ) ) ( not ( = ?auto_15653 ?auto_15656 ) ) ( not ( = ?auto_15655 ?auto_15657 ) ) ( not ( = ?auto_15655 ?auto_15658 ) ) ( not ( = ?auto_15655 ?auto_15659 ) ) ( not ( = ?auto_15655 ?auto_15656 ) ) ( not ( = ?auto_15657 ?auto_15658 ) ) ( not ( = ?auto_15657 ?auto_15659 ) ) ( not ( = ?auto_15657 ?auto_15656 ) ) ( not ( = ?auto_15658 ?auto_15659 ) ) ( not ( = ?auto_15658 ?auto_15656 ) ) ( not ( = ?auto_15659 ?auto_15656 ) ) ( IN-CITY ?auto_15660 ?auto_15663 ) ( not ( = ?auto_15654 ?auto_15660 ) ) ( not ( = ?auto_15662 ?auto_15660 ) ) ( OBJ-AT ?auto_15659 ?auto_15660 ) ( TRUCK-AT ?auto_15661 ?auto_15664 ) ( IN-CITY ?auto_15664 ?auto_15663 ) ( not ( = ?auto_15654 ?auto_15664 ) ) ( not ( = ?auto_15662 ?auto_15664 ) ) ( not ( = ?auto_15660 ?auto_15664 ) ) ( OBJ-AT ?auto_15658 ?auto_15664 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15658 ?auto_15661 ?auto_15664 )
      ( DELIVER-6PKG ?auto_15653 ?auto_15655 ?auto_15657 ?auto_15658 ?auto_15659 ?auto_15656 ?auto_15654 )
      ( DELIVER-6PKG-VERIFY ?auto_15653 ?auto_15655 ?auto_15657 ?auto_15658 ?auto_15659 ?auto_15656 ?auto_15654 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15672 - OBJ
      ?auto_15674 - OBJ
      ?auto_15676 - OBJ
      ?auto_15677 - OBJ
      ?auto_15678 - OBJ
      ?auto_15675 - OBJ
      ?auto_15673 - LOCATION
    )
    :vars
    (
      ?auto_15680 - LOCATION
      ?auto_15683 - CITY
      ?auto_15679 - LOCATION
      ?auto_15681 - LOCATION
      ?auto_15682 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15674 ?auto_15672 ) ( GREATER-THAN ?auto_15676 ?auto_15672 ) ( GREATER-THAN ?auto_15676 ?auto_15674 ) ( GREATER-THAN ?auto_15677 ?auto_15672 ) ( GREATER-THAN ?auto_15677 ?auto_15674 ) ( GREATER-THAN ?auto_15677 ?auto_15676 ) ( GREATER-THAN ?auto_15678 ?auto_15672 ) ( GREATER-THAN ?auto_15678 ?auto_15674 ) ( GREATER-THAN ?auto_15678 ?auto_15676 ) ( GREATER-THAN ?auto_15678 ?auto_15677 ) ( GREATER-THAN ?auto_15675 ?auto_15672 ) ( GREATER-THAN ?auto_15675 ?auto_15674 ) ( GREATER-THAN ?auto_15675 ?auto_15676 ) ( GREATER-THAN ?auto_15675 ?auto_15677 ) ( GREATER-THAN ?auto_15675 ?auto_15678 ) ( IN-CITY ?auto_15680 ?auto_15683 ) ( IN-CITY ?auto_15673 ?auto_15683 ) ( not ( = ?auto_15673 ?auto_15680 ) ) ( OBJ-AT ?auto_15675 ?auto_15680 ) ( OBJ-AT ?auto_15672 ?auto_15673 ) ( OBJ-AT ?auto_15674 ?auto_15673 ) ( OBJ-AT ?auto_15676 ?auto_15673 ) ( not ( = ?auto_15672 ?auto_15674 ) ) ( not ( = ?auto_15672 ?auto_15676 ) ) ( not ( = ?auto_15672 ?auto_15677 ) ) ( not ( = ?auto_15672 ?auto_15678 ) ) ( not ( = ?auto_15672 ?auto_15675 ) ) ( not ( = ?auto_15674 ?auto_15676 ) ) ( not ( = ?auto_15674 ?auto_15677 ) ) ( not ( = ?auto_15674 ?auto_15678 ) ) ( not ( = ?auto_15674 ?auto_15675 ) ) ( not ( = ?auto_15676 ?auto_15677 ) ) ( not ( = ?auto_15676 ?auto_15678 ) ) ( not ( = ?auto_15676 ?auto_15675 ) ) ( not ( = ?auto_15677 ?auto_15678 ) ) ( not ( = ?auto_15677 ?auto_15675 ) ) ( not ( = ?auto_15678 ?auto_15675 ) ) ( IN-CITY ?auto_15679 ?auto_15683 ) ( not ( = ?auto_15673 ?auto_15679 ) ) ( not ( = ?auto_15680 ?auto_15679 ) ) ( OBJ-AT ?auto_15678 ?auto_15679 ) ( IN-CITY ?auto_15681 ?auto_15683 ) ( not ( = ?auto_15673 ?auto_15681 ) ) ( not ( = ?auto_15680 ?auto_15681 ) ) ( not ( = ?auto_15679 ?auto_15681 ) ) ( OBJ-AT ?auto_15677 ?auto_15681 ) ( TRUCK-AT ?auto_15682 ?auto_15673 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15682 ?auto_15673 ?auto_15681 ?auto_15683 )
      ( DELIVER-6PKG ?auto_15672 ?auto_15674 ?auto_15676 ?auto_15677 ?auto_15678 ?auto_15675 ?auto_15673 )
      ( DELIVER-6PKG-VERIFY ?auto_15672 ?auto_15674 ?auto_15676 ?auto_15677 ?auto_15678 ?auto_15675 ?auto_15673 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15691 - OBJ
      ?auto_15693 - OBJ
      ?auto_15695 - OBJ
      ?auto_15696 - OBJ
      ?auto_15697 - OBJ
      ?auto_15694 - OBJ
      ?auto_15692 - LOCATION
    )
    :vars
    (
      ?auto_15702 - LOCATION
      ?auto_15698 - CITY
      ?auto_15699 - LOCATION
      ?auto_15700 - LOCATION
      ?auto_15701 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15693 ?auto_15691 ) ( GREATER-THAN ?auto_15695 ?auto_15691 ) ( GREATER-THAN ?auto_15695 ?auto_15693 ) ( GREATER-THAN ?auto_15696 ?auto_15691 ) ( GREATER-THAN ?auto_15696 ?auto_15693 ) ( GREATER-THAN ?auto_15696 ?auto_15695 ) ( GREATER-THAN ?auto_15697 ?auto_15691 ) ( GREATER-THAN ?auto_15697 ?auto_15693 ) ( GREATER-THAN ?auto_15697 ?auto_15695 ) ( GREATER-THAN ?auto_15697 ?auto_15696 ) ( GREATER-THAN ?auto_15694 ?auto_15691 ) ( GREATER-THAN ?auto_15694 ?auto_15693 ) ( GREATER-THAN ?auto_15694 ?auto_15695 ) ( GREATER-THAN ?auto_15694 ?auto_15696 ) ( GREATER-THAN ?auto_15694 ?auto_15697 ) ( IN-CITY ?auto_15702 ?auto_15698 ) ( IN-CITY ?auto_15692 ?auto_15698 ) ( not ( = ?auto_15692 ?auto_15702 ) ) ( OBJ-AT ?auto_15694 ?auto_15702 ) ( OBJ-AT ?auto_15691 ?auto_15692 ) ( OBJ-AT ?auto_15693 ?auto_15692 ) ( not ( = ?auto_15691 ?auto_15693 ) ) ( not ( = ?auto_15691 ?auto_15695 ) ) ( not ( = ?auto_15691 ?auto_15696 ) ) ( not ( = ?auto_15691 ?auto_15697 ) ) ( not ( = ?auto_15691 ?auto_15694 ) ) ( not ( = ?auto_15693 ?auto_15695 ) ) ( not ( = ?auto_15693 ?auto_15696 ) ) ( not ( = ?auto_15693 ?auto_15697 ) ) ( not ( = ?auto_15693 ?auto_15694 ) ) ( not ( = ?auto_15695 ?auto_15696 ) ) ( not ( = ?auto_15695 ?auto_15697 ) ) ( not ( = ?auto_15695 ?auto_15694 ) ) ( not ( = ?auto_15696 ?auto_15697 ) ) ( not ( = ?auto_15696 ?auto_15694 ) ) ( not ( = ?auto_15697 ?auto_15694 ) ) ( IN-CITY ?auto_15699 ?auto_15698 ) ( not ( = ?auto_15692 ?auto_15699 ) ) ( not ( = ?auto_15702 ?auto_15699 ) ) ( OBJ-AT ?auto_15697 ?auto_15699 ) ( IN-CITY ?auto_15700 ?auto_15698 ) ( not ( = ?auto_15692 ?auto_15700 ) ) ( not ( = ?auto_15702 ?auto_15700 ) ) ( not ( = ?auto_15699 ?auto_15700 ) ) ( OBJ-AT ?auto_15696 ?auto_15700 ) ( TRUCK-AT ?auto_15701 ?auto_15692 ) ( IN-TRUCK ?auto_15695 ?auto_15701 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15695 ?auto_15692 )
      ( DELIVER-6PKG ?auto_15691 ?auto_15693 ?auto_15695 ?auto_15696 ?auto_15697 ?auto_15694 ?auto_15692 )
      ( DELIVER-6PKG-VERIFY ?auto_15691 ?auto_15693 ?auto_15695 ?auto_15696 ?auto_15697 ?auto_15694 ?auto_15692 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15710 - OBJ
      ?auto_15712 - OBJ
      ?auto_15714 - OBJ
      ?auto_15715 - OBJ
      ?auto_15716 - OBJ
      ?auto_15713 - OBJ
      ?auto_15711 - LOCATION
    )
    :vars
    (
      ?auto_15719 - LOCATION
      ?auto_15717 - CITY
      ?auto_15718 - LOCATION
      ?auto_15721 - LOCATION
      ?auto_15720 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15712 ?auto_15710 ) ( GREATER-THAN ?auto_15714 ?auto_15710 ) ( GREATER-THAN ?auto_15714 ?auto_15712 ) ( GREATER-THAN ?auto_15715 ?auto_15710 ) ( GREATER-THAN ?auto_15715 ?auto_15712 ) ( GREATER-THAN ?auto_15715 ?auto_15714 ) ( GREATER-THAN ?auto_15716 ?auto_15710 ) ( GREATER-THAN ?auto_15716 ?auto_15712 ) ( GREATER-THAN ?auto_15716 ?auto_15714 ) ( GREATER-THAN ?auto_15716 ?auto_15715 ) ( GREATER-THAN ?auto_15713 ?auto_15710 ) ( GREATER-THAN ?auto_15713 ?auto_15712 ) ( GREATER-THAN ?auto_15713 ?auto_15714 ) ( GREATER-THAN ?auto_15713 ?auto_15715 ) ( GREATER-THAN ?auto_15713 ?auto_15716 ) ( IN-CITY ?auto_15719 ?auto_15717 ) ( IN-CITY ?auto_15711 ?auto_15717 ) ( not ( = ?auto_15711 ?auto_15719 ) ) ( OBJ-AT ?auto_15713 ?auto_15719 ) ( OBJ-AT ?auto_15710 ?auto_15711 ) ( OBJ-AT ?auto_15712 ?auto_15711 ) ( not ( = ?auto_15710 ?auto_15712 ) ) ( not ( = ?auto_15710 ?auto_15714 ) ) ( not ( = ?auto_15710 ?auto_15715 ) ) ( not ( = ?auto_15710 ?auto_15716 ) ) ( not ( = ?auto_15710 ?auto_15713 ) ) ( not ( = ?auto_15712 ?auto_15714 ) ) ( not ( = ?auto_15712 ?auto_15715 ) ) ( not ( = ?auto_15712 ?auto_15716 ) ) ( not ( = ?auto_15712 ?auto_15713 ) ) ( not ( = ?auto_15714 ?auto_15715 ) ) ( not ( = ?auto_15714 ?auto_15716 ) ) ( not ( = ?auto_15714 ?auto_15713 ) ) ( not ( = ?auto_15715 ?auto_15716 ) ) ( not ( = ?auto_15715 ?auto_15713 ) ) ( not ( = ?auto_15716 ?auto_15713 ) ) ( IN-CITY ?auto_15718 ?auto_15717 ) ( not ( = ?auto_15711 ?auto_15718 ) ) ( not ( = ?auto_15719 ?auto_15718 ) ) ( OBJ-AT ?auto_15716 ?auto_15718 ) ( IN-CITY ?auto_15721 ?auto_15717 ) ( not ( = ?auto_15711 ?auto_15721 ) ) ( not ( = ?auto_15719 ?auto_15721 ) ) ( not ( = ?auto_15718 ?auto_15721 ) ) ( OBJ-AT ?auto_15715 ?auto_15721 ) ( IN-TRUCK ?auto_15714 ?auto_15720 ) ( TRUCK-AT ?auto_15720 ?auto_15718 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15720 ?auto_15718 ?auto_15711 ?auto_15717 )
      ( DELIVER-6PKG ?auto_15710 ?auto_15712 ?auto_15714 ?auto_15715 ?auto_15716 ?auto_15713 ?auto_15711 )
      ( DELIVER-6PKG-VERIFY ?auto_15710 ?auto_15712 ?auto_15714 ?auto_15715 ?auto_15716 ?auto_15713 ?auto_15711 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15729 - OBJ
      ?auto_15731 - OBJ
      ?auto_15733 - OBJ
      ?auto_15734 - OBJ
      ?auto_15735 - OBJ
      ?auto_15732 - OBJ
      ?auto_15730 - LOCATION
    )
    :vars
    (
      ?auto_15740 - LOCATION
      ?auto_15736 - CITY
      ?auto_15737 - LOCATION
      ?auto_15739 - LOCATION
      ?auto_15738 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15731 ?auto_15729 ) ( GREATER-THAN ?auto_15733 ?auto_15729 ) ( GREATER-THAN ?auto_15733 ?auto_15731 ) ( GREATER-THAN ?auto_15734 ?auto_15729 ) ( GREATER-THAN ?auto_15734 ?auto_15731 ) ( GREATER-THAN ?auto_15734 ?auto_15733 ) ( GREATER-THAN ?auto_15735 ?auto_15729 ) ( GREATER-THAN ?auto_15735 ?auto_15731 ) ( GREATER-THAN ?auto_15735 ?auto_15733 ) ( GREATER-THAN ?auto_15735 ?auto_15734 ) ( GREATER-THAN ?auto_15732 ?auto_15729 ) ( GREATER-THAN ?auto_15732 ?auto_15731 ) ( GREATER-THAN ?auto_15732 ?auto_15733 ) ( GREATER-THAN ?auto_15732 ?auto_15734 ) ( GREATER-THAN ?auto_15732 ?auto_15735 ) ( IN-CITY ?auto_15740 ?auto_15736 ) ( IN-CITY ?auto_15730 ?auto_15736 ) ( not ( = ?auto_15730 ?auto_15740 ) ) ( OBJ-AT ?auto_15732 ?auto_15740 ) ( OBJ-AT ?auto_15729 ?auto_15730 ) ( OBJ-AT ?auto_15731 ?auto_15730 ) ( not ( = ?auto_15729 ?auto_15731 ) ) ( not ( = ?auto_15729 ?auto_15733 ) ) ( not ( = ?auto_15729 ?auto_15734 ) ) ( not ( = ?auto_15729 ?auto_15735 ) ) ( not ( = ?auto_15729 ?auto_15732 ) ) ( not ( = ?auto_15731 ?auto_15733 ) ) ( not ( = ?auto_15731 ?auto_15734 ) ) ( not ( = ?auto_15731 ?auto_15735 ) ) ( not ( = ?auto_15731 ?auto_15732 ) ) ( not ( = ?auto_15733 ?auto_15734 ) ) ( not ( = ?auto_15733 ?auto_15735 ) ) ( not ( = ?auto_15733 ?auto_15732 ) ) ( not ( = ?auto_15734 ?auto_15735 ) ) ( not ( = ?auto_15734 ?auto_15732 ) ) ( not ( = ?auto_15735 ?auto_15732 ) ) ( IN-CITY ?auto_15737 ?auto_15736 ) ( not ( = ?auto_15730 ?auto_15737 ) ) ( not ( = ?auto_15740 ?auto_15737 ) ) ( OBJ-AT ?auto_15735 ?auto_15737 ) ( IN-CITY ?auto_15739 ?auto_15736 ) ( not ( = ?auto_15730 ?auto_15739 ) ) ( not ( = ?auto_15740 ?auto_15739 ) ) ( not ( = ?auto_15737 ?auto_15739 ) ) ( OBJ-AT ?auto_15734 ?auto_15739 ) ( TRUCK-AT ?auto_15738 ?auto_15737 ) ( OBJ-AT ?auto_15733 ?auto_15737 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15733 ?auto_15738 ?auto_15737 )
      ( DELIVER-6PKG ?auto_15729 ?auto_15731 ?auto_15733 ?auto_15734 ?auto_15735 ?auto_15732 ?auto_15730 )
      ( DELIVER-6PKG-VERIFY ?auto_15729 ?auto_15731 ?auto_15733 ?auto_15734 ?auto_15735 ?auto_15732 ?auto_15730 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15748 - OBJ
      ?auto_15750 - OBJ
      ?auto_15752 - OBJ
      ?auto_15753 - OBJ
      ?auto_15754 - OBJ
      ?auto_15751 - OBJ
      ?auto_15749 - LOCATION
    )
    :vars
    (
      ?auto_15758 - LOCATION
      ?auto_15755 - CITY
      ?auto_15759 - LOCATION
      ?auto_15757 - LOCATION
      ?auto_15756 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15750 ?auto_15748 ) ( GREATER-THAN ?auto_15752 ?auto_15748 ) ( GREATER-THAN ?auto_15752 ?auto_15750 ) ( GREATER-THAN ?auto_15753 ?auto_15748 ) ( GREATER-THAN ?auto_15753 ?auto_15750 ) ( GREATER-THAN ?auto_15753 ?auto_15752 ) ( GREATER-THAN ?auto_15754 ?auto_15748 ) ( GREATER-THAN ?auto_15754 ?auto_15750 ) ( GREATER-THAN ?auto_15754 ?auto_15752 ) ( GREATER-THAN ?auto_15754 ?auto_15753 ) ( GREATER-THAN ?auto_15751 ?auto_15748 ) ( GREATER-THAN ?auto_15751 ?auto_15750 ) ( GREATER-THAN ?auto_15751 ?auto_15752 ) ( GREATER-THAN ?auto_15751 ?auto_15753 ) ( GREATER-THAN ?auto_15751 ?auto_15754 ) ( IN-CITY ?auto_15758 ?auto_15755 ) ( IN-CITY ?auto_15749 ?auto_15755 ) ( not ( = ?auto_15749 ?auto_15758 ) ) ( OBJ-AT ?auto_15751 ?auto_15758 ) ( OBJ-AT ?auto_15748 ?auto_15749 ) ( OBJ-AT ?auto_15750 ?auto_15749 ) ( not ( = ?auto_15748 ?auto_15750 ) ) ( not ( = ?auto_15748 ?auto_15752 ) ) ( not ( = ?auto_15748 ?auto_15753 ) ) ( not ( = ?auto_15748 ?auto_15754 ) ) ( not ( = ?auto_15748 ?auto_15751 ) ) ( not ( = ?auto_15750 ?auto_15752 ) ) ( not ( = ?auto_15750 ?auto_15753 ) ) ( not ( = ?auto_15750 ?auto_15754 ) ) ( not ( = ?auto_15750 ?auto_15751 ) ) ( not ( = ?auto_15752 ?auto_15753 ) ) ( not ( = ?auto_15752 ?auto_15754 ) ) ( not ( = ?auto_15752 ?auto_15751 ) ) ( not ( = ?auto_15753 ?auto_15754 ) ) ( not ( = ?auto_15753 ?auto_15751 ) ) ( not ( = ?auto_15754 ?auto_15751 ) ) ( IN-CITY ?auto_15759 ?auto_15755 ) ( not ( = ?auto_15749 ?auto_15759 ) ) ( not ( = ?auto_15758 ?auto_15759 ) ) ( OBJ-AT ?auto_15754 ?auto_15759 ) ( IN-CITY ?auto_15757 ?auto_15755 ) ( not ( = ?auto_15749 ?auto_15757 ) ) ( not ( = ?auto_15758 ?auto_15757 ) ) ( not ( = ?auto_15759 ?auto_15757 ) ) ( OBJ-AT ?auto_15753 ?auto_15757 ) ( OBJ-AT ?auto_15752 ?auto_15759 ) ( TRUCK-AT ?auto_15756 ?auto_15749 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15756 ?auto_15749 ?auto_15759 ?auto_15755 )
      ( DELIVER-6PKG ?auto_15748 ?auto_15750 ?auto_15752 ?auto_15753 ?auto_15754 ?auto_15751 ?auto_15749 )
      ( DELIVER-6PKG-VERIFY ?auto_15748 ?auto_15750 ?auto_15752 ?auto_15753 ?auto_15754 ?auto_15751 ?auto_15749 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15767 - OBJ
      ?auto_15769 - OBJ
      ?auto_15771 - OBJ
      ?auto_15772 - OBJ
      ?auto_15773 - OBJ
      ?auto_15770 - OBJ
      ?auto_15768 - LOCATION
    )
    :vars
    (
      ?auto_15775 - LOCATION
      ?auto_15778 - CITY
      ?auto_15777 - LOCATION
      ?auto_15776 - LOCATION
      ?auto_15774 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15769 ?auto_15767 ) ( GREATER-THAN ?auto_15771 ?auto_15767 ) ( GREATER-THAN ?auto_15771 ?auto_15769 ) ( GREATER-THAN ?auto_15772 ?auto_15767 ) ( GREATER-THAN ?auto_15772 ?auto_15769 ) ( GREATER-THAN ?auto_15772 ?auto_15771 ) ( GREATER-THAN ?auto_15773 ?auto_15767 ) ( GREATER-THAN ?auto_15773 ?auto_15769 ) ( GREATER-THAN ?auto_15773 ?auto_15771 ) ( GREATER-THAN ?auto_15773 ?auto_15772 ) ( GREATER-THAN ?auto_15770 ?auto_15767 ) ( GREATER-THAN ?auto_15770 ?auto_15769 ) ( GREATER-THAN ?auto_15770 ?auto_15771 ) ( GREATER-THAN ?auto_15770 ?auto_15772 ) ( GREATER-THAN ?auto_15770 ?auto_15773 ) ( IN-CITY ?auto_15775 ?auto_15778 ) ( IN-CITY ?auto_15768 ?auto_15778 ) ( not ( = ?auto_15768 ?auto_15775 ) ) ( OBJ-AT ?auto_15770 ?auto_15775 ) ( OBJ-AT ?auto_15767 ?auto_15768 ) ( not ( = ?auto_15767 ?auto_15769 ) ) ( not ( = ?auto_15767 ?auto_15771 ) ) ( not ( = ?auto_15767 ?auto_15772 ) ) ( not ( = ?auto_15767 ?auto_15773 ) ) ( not ( = ?auto_15767 ?auto_15770 ) ) ( not ( = ?auto_15769 ?auto_15771 ) ) ( not ( = ?auto_15769 ?auto_15772 ) ) ( not ( = ?auto_15769 ?auto_15773 ) ) ( not ( = ?auto_15769 ?auto_15770 ) ) ( not ( = ?auto_15771 ?auto_15772 ) ) ( not ( = ?auto_15771 ?auto_15773 ) ) ( not ( = ?auto_15771 ?auto_15770 ) ) ( not ( = ?auto_15772 ?auto_15773 ) ) ( not ( = ?auto_15772 ?auto_15770 ) ) ( not ( = ?auto_15773 ?auto_15770 ) ) ( IN-CITY ?auto_15777 ?auto_15778 ) ( not ( = ?auto_15768 ?auto_15777 ) ) ( not ( = ?auto_15775 ?auto_15777 ) ) ( OBJ-AT ?auto_15773 ?auto_15777 ) ( IN-CITY ?auto_15776 ?auto_15778 ) ( not ( = ?auto_15768 ?auto_15776 ) ) ( not ( = ?auto_15775 ?auto_15776 ) ) ( not ( = ?auto_15777 ?auto_15776 ) ) ( OBJ-AT ?auto_15772 ?auto_15776 ) ( OBJ-AT ?auto_15771 ?auto_15777 ) ( TRUCK-AT ?auto_15774 ?auto_15768 ) ( IN-TRUCK ?auto_15769 ?auto_15774 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15769 ?auto_15768 )
      ( DELIVER-6PKG ?auto_15767 ?auto_15769 ?auto_15771 ?auto_15772 ?auto_15773 ?auto_15770 ?auto_15768 )
      ( DELIVER-6PKG-VERIFY ?auto_15767 ?auto_15769 ?auto_15771 ?auto_15772 ?auto_15773 ?auto_15770 ?auto_15768 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15786 - OBJ
      ?auto_15788 - OBJ
      ?auto_15790 - OBJ
      ?auto_15791 - OBJ
      ?auto_15792 - OBJ
      ?auto_15789 - OBJ
      ?auto_15787 - LOCATION
    )
    :vars
    (
      ?auto_15796 - LOCATION
      ?auto_15795 - CITY
      ?auto_15794 - LOCATION
      ?auto_15793 - LOCATION
      ?auto_15797 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15788 ?auto_15786 ) ( GREATER-THAN ?auto_15790 ?auto_15786 ) ( GREATER-THAN ?auto_15790 ?auto_15788 ) ( GREATER-THAN ?auto_15791 ?auto_15786 ) ( GREATER-THAN ?auto_15791 ?auto_15788 ) ( GREATER-THAN ?auto_15791 ?auto_15790 ) ( GREATER-THAN ?auto_15792 ?auto_15786 ) ( GREATER-THAN ?auto_15792 ?auto_15788 ) ( GREATER-THAN ?auto_15792 ?auto_15790 ) ( GREATER-THAN ?auto_15792 ?auto_15791 ) ( GREATER-THAN ?auto_15789 ?auto_15786 ) ( GREATER-THAN ?auto_15789 ?auto_15788 ) ( GREATER-THAN ?auto_15789 ?auto_15790 ) ( GREATER-THAN ?auto_15789 ?auto_15791 ) ( GREATER-THAN ?auto_15789 ?auto_15792 ) ( IN-CITY ?auto_15796 ?auto_15795 ) ( IN-CITY ?auto_15787 ?auto_15795 ) ( not ( = ?auto_15787 ?auto_15796 ) ) ( OBJ-AT ?auto_15789 ?auto_15796 ) ( OBJ-AT ?auto_15786 ?auto_15787 ) ( not ( = ?auto_15786 ?auto_15788 ) ) ( not ( = ?auto_15786 ?auto_15790 ) ) ( not ( = ?auto_15786 ?auto_15791 ) ) ( not ( = ?auto_15786 ?auto_15792 ) ) ( not ( = ?auto_15786 ?auto_15789 ) ) ( not ( = ?auto_15788 ?auto_15790 ) ) ( not ( = ?auto_15788 ?auto_15791 ) ) ( not ( = ?auto_15788 ?auto_15792 ) ) ( not ( = ?auto_15788 ?auto_15789 ) ) ( not ( = ?auto_15790 ?auto_15791 ) ) ( not ( = ?auto_15790 ?auto_15792 ) ) ( not ( = ?auto_15790 ?auto_15789 ) ) ( not ( = ?auto_15791 ?auto_15792 ) ) ( not ( = ?auto_15791 ?auto_15789 ) ) ( not ( = ?auto_15792 ?auto_15789 ) ) ( IN-CITY ?auto_15794 ?auto_15795 ) ( not ( = ?auto_15787 ?auto_15794 ) ) ( not ( = ?auto_15796 ?auto_15794 ) ) ( OBJ-AT ?auto_15792 ?auto_15794 ) ( IN-CITY ?auto_15793 ?auto_15795 ) ( not ( = ?auto_15787 ?auto_15793 ) ) ( not ( = ?auto_15796 ?auto_15793 ) ) ( not ( = ?auto_15794 ?auto_15793 ) ) ( OBJ-AT ?auto_15791 ?auto_15793 ) ( OBJ-AT ?auto_15790 ?auto_15794 ) ( IN-TRUCK ?auto_15788 ?auto_15797 ) ( TRUCK-AT ?auto_15797 ?auto_15793 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15797 ?auto_15793 ?auto_15787 ?auto_15795 )
      ( DELIVER-6PKG ?auto_15786 ?auto_15788 ?auto_15790 ?auto_15791 ?auto_15792 ?auto_15789 ?auto_15787 )
      ( DELIVER-6PKG-VERIFY ?auto_15786 ?auto_15788 ?auto_15790 ?auto_15791 ?auto_15792 ?auto_15789 ?auto_15787 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15805 - OBJ
      ?auto_15807 - OBJ
      ?auto_15809 - OBJ
      ?auto_15810 - OBJ
      ?auto_15811 - OBJ
      ?auto_15808 - OBJ
      ?auto_15806 - LOCATION
    )
    :vars
    (
      ?auto_15815 - LOCATION
      ?auto_15814 - CITY
      ?auto_15816 - LOCATION
      ?auto_15813 - LOCATION
      ?auto_15812 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15807 ?auto_15805 ) ( GREATER-THAN ?auto_15809 ?auto_15805 ) ( GREATER-THAN ?auto_15809 ?auto_15807 ) ( GREATER-THAN ?auto_15810 ?auto_15805 ) ( GREATER-THAN ?auto_15810 ?auto_15807 ) ( GREATER-THAN ?auto_15810 ?auto_15809 ) ( GREATER-THAN ?auto_15811 ?auto_15805 ) ( GREATER-THAN ?auto_15811 ?auto_15807 ) ( GREATER-THAN ?auto_15811 ?auto_15809 ) ( GREATER-THAN ?auto_15811 ?auto_15810 ) ( GREATER-THAN ?auto_15808 ?auto_15805 ) ( GREATER-THAN ?auto_15808 ?auto_15807 ) ( GREATER-THAN ?auto_15808 ?auto_15809 ) ( GREATER-THAN ?auto_15808 ?auto_15810 ) ( GREATER-THAN ?auto_15808 ?auto_15811 ) ( IN-CITY ?auto_15815 ?auto_15814 ) ( IN-CITY ?auto_15806 ?auto_15814 ) ( not ( = ?auto_15806 ?auto_15815 ) ) ( OBJ-AT ?auto_15808 ?auto_15815 ) ( OBJ-AT ?auto_15805 ?auto_15806 ) ( not ( = ?auto_15805 ?auto_15807 ) ) ( not ( = ?auto_15805 ?auto_15809 ) ) ( not ( = ?auto_15805 ?auto_15810 ) ) ( not ( = ?auto_15805 ?auto_15811 ) ) ( not ( = ?auto_15805 ?auto_15808 ) ) ( not ( = ?auto_15807 ?auto_15809 ) ) ( not ( = ?auto_15807 ?auto_15810 ) ) ( not ( = ?auto_15807 ?auto_15811 ) ) ( not ( = ?auto_15807 ?auto_15808 ) ) ( not ( = ?auto_15809 ?auto_15810 ) ) ( not ( = ?auto_15809 ?auto_15811 ) ) ( not ( = ?auto_15809 ?auto_15808 ) ) ( not ( = ?auto_15810 ?auto_15811 ) ) ( not ( = ?auto_15810 ?auto_15808 ) ) ( not ( = ?auto_15811 ?auto_15808 ) ) ( IN-CITY ?auto_15816 ?auto_15814 ) ( not ( = ?auto_15806 ?auto_15816 ) ) ( not ( = ?auto_15815 ?auto_15816 ) ) ( OBJ-AT ?auto_15811 ?auto_15816 ) ( IN-CITY ?auto_15813 ?auto_15814 ) ( not ( = ?auto_15806 ?auto_15813 ) ) ( not ( = ?auto_15815 ?auto_15813 ) ) ( not ( = ?auto_15816 ?auto_15813 ) ) ( OBJ-AT ?auto_15810 ?auto_15813 ) ( OBJ-AT ?auto_15809 ?auto_15816 ) ( TRUCK-AT ?auto_15812 ?auto_15813 ) ( OBJ-AT ?auto_15807 ?auto_15813 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15807 ?auto_15812 ?auto_15813 )
      ( DELIVER-6PKG ?auto_15805 ?auto_15807 ?auto_15809 ?auto_15810 ?auto_15811 ?auto_15808 ?auto_15806 )
      ( DELIVER-6PKG-VERIFY ?auto_15805 ?auto_15807 ?auto_15809 ?auto_15810 ?auto_15811 ?auto_15808 ?auto_15806 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15824 - OBJ
      ?auto_15826 - OBJ
      ?auto_15828 - OBJ
      ?auto_15829 - OBJ
      ?auto_15830 - OBJ
      ?auto_15827 - OBJ
      ?auto_15825 - LOCATION
    )
    :vars
    (
      ?auto_15831 - LOCATION
      ?auto_15834 - CITY
      ?auto_15835 - LOCATION
      ?auto_15833 - LOCATION
      ?auto_15832 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15826 ?auto_15824 ) ( GREATER-THAN ?auto_15828 ?auto_15824 ) ( GREATER-THAN ?auto_15828 ?auto_15826 ) ( GREATER-THAN ?auto_15829 ?auto_15824 ) ( GREATER-THAN ?auto_15829 ?auto_15826 ) ( GREATER-THAN ?auto_15829 ?auto_15828 ) ( GREATER-THAN ?auto_15830 ?auto_15824 ) ( GREATER-THAN ?auto_15830 ?auto_15826 ) ( GREATER-THAN ?auto_15830 ?auto_15828 ) ( GREATER-THAN ?auto_15830 ?auto_15829 ) ( GREATER-THAN ?auto_15827 ?auto_15824 ) ( GREATER-THAN ?auto_15827 ?auto_15826 ) ( GREATER-THAN ?auto_15827 ?auto_15828 ) ( GREATER-THAN ?auto_15827 ?auto_15829 ) ( GREATER-THAN ?auto_15827 ?auto_15830 ) ( IN-CITY ?auto_15831 ?auto_15834 ) ( IN-CITY ?auto_15825 ?auto_15834 ) ( not ( = ?auto_15825 ?auto_15831 ) ) ( OBJ-AT ?auto_15827 ?auto_15831 ) ( OBJ-AT ?auto_15824 ?auto_15825 ) ( not ( = ?auto_15824 ?auto_15826 ) ) ( not ( = ?auto_15824 ?auto_15828 ) ) ( not ( = ?auto_15824 ?auto_15829 ) ) ( not ( = ?auto_15824 ?auto_15830 ) ) ( not ( = ?auto_15824 ?auto_15827 ) ) ( not ( = ?auto_15826 ?auto_15828 ) ) ( not ( = ?auto_15826 ?auto_15829 ) ) ( not ( = ?auto_15826 ?auto_15830 ) ) ( not ( = ?auto_15826 ?auto_15827 ) ) ( not ( = ?auto_15828 ?auto_15829 ) ) ( not ( = ?auto_15828 ?auto_15830 ) ) ( not ( = ?auto_15828 ?auto_15827 ) ) ( not ( = ?auto_15829 ?auto_15830 ) ) ( not ( = ?auto_15829 ?auto_15827 ) ) ( not ( = ?auto_15830 ?auto_15827 ) ) ( IN-CITY ?auto_15835 ?auto_15834 ) ( not ( = ?auto_15825 ?auto_15835 ) ) ( not ( = ?auto_15831 ?auto_15835 ) ) ( OBJ-AT ?auto_15830 ?auto_15835 ) ( IN-CITY ?auto_15833 ?auto_15834 ) ( not ( = ?auto_15825 ?auto_15833 ) ) ( not ( = ?auto_15831 ?auto_15833 ) ) ( not ( = ?auto_15835 ?auto_15833 ) ) ( OBJ-AT ?auto_15829 ?auto_15833 ) ( OBJ-AT ?auto_15828 ?auto_15835 ) ( OBJ-AT ?auto_15826 ?auto_15833 ) ( TRUCK-AT ?auto_15832 ?auto_15825 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15832 ?auto_15825 ?auto_15833 ?auto_15834 )
      ( DELIVER-6PKG ?auto_15824 ?auto_15826 ?auto_15828 ?auto_15829 ?auto_15830 ?auto_15827 ?auto_15825 )
      ( DELIVER-6PKG-VERIFY ?auto_15824 ?auto_15826 ?auto_15828 ?auto_15829 ?auto_15830 ?auto_15827 ?auto_15825 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15843 - OBJ
      ?auto_15845 - OBJ
      ?auto_15847 - OBJ
      ?auto_15848 - OBJ
      ?auto_15849 - OBJ
      ?auto_15846 - OBJ
      ?auto_15844 - LOCATION
    )
    :vars
    (
      ?auto_15852 - LOCATION
      ?auto_15853 - CITY
      ?auto_15850 - LOCATION
      ?auto_15854 - LOCATION
      ?auto_15851 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15845 ?auto_15843 ) ( GREATER-THAN ?auto_15847 ?auto_15843 ) ( GREATER-THAN ?auto_15847 ?auto_15845 ) ( GREATER-THAN ?auto_15848 ?auto_15843 ) ( GREATER-THAN ?auto_15848 ?auto_15845 ) ( GREATER-THAN ?auto_15848 ?auto_15847 ) ( GREATER-THAN ?auto_15849 ?auto_15843 ) ( GREATER-THAN ?auto_15849 ?auto_15845 ) ( GREATER-THAN ?auto_15849 ?auto_15847 ) ( GREATER-THAN ?auto_15849 ?auto_15848 ) ( GREATER-THAN ?auto_15846 ?auto_15843 ) ( GREATER-THAN ?auto_15846 ?auto_15845 ) ( GREATER-THAN ?auto_15846 ?auto_15847 ) ( GREATER-THAN ?auto_15846 ?auto_15848 ) ( GREATER-THAN ?auto_15846 ?auto_15849 ) ( IN-CITY ?auto_15852 ?auto_15853 ) ( IN-CITY ?auto_15844 ?auto_15853 ) ( not ( = ?auto_15844 ?auto_15852 ) ) ( OBJ-AT ?auto_15846 ?auto_15852 ) ( not ( = ?auto_15843 ?auto_15845 ) ) ( not ( = ?auto_15843 ?auto_15847 ) ) ( not ( = ?auto_15843 ?auto_15848 ) ) ( not ( = ?auto_15843 ?auto_15849 ) ) ( not ( = ?auto_15843 ?auto_15846 ) ) ( not ( = ?auto_15845 ?auto_15847 ) ) ( not ( = ?auto_15845 ?auto_15848 ) ) ( not ( = ?auto_15845 ?auto_15849 ) ) ( not ( = ?auto_15845 ?auto_15846 ) ) ( not ( = ?auto_15847 ?auto_15848 ) ) ( not ( = ?auto_15847 ?auto_15849 ) ) ( not ( = ?auto_15847 ?auto_15846 ) ) ( not ( = ?auto_15848 ?auto_15849 ) ) ( not ( = ?auto_15848 ?auto_15846 ) ) ( not ( = ?auto_15849 ?auto_15846 ) ) ( IN-CITY ?auto_15850 ?auto_15853 ) ( not ( = ?auto_15844 ?auto_15850 ) ) ( not ( = ?auto_15852 ?auto_15850 ) ) ( OBJ-AT ?auto_15849 ?auto_15850 ) ( IN-CITY ?auto_15854 ?auto_15853 ) ( not ( = ?auto_15844 ?auto_15854 ) ) ( not ( = ?auto_15852 ?auto_15854 ) ) ( not ( = ?auto_15850 ?auto_15854 ) ) ( OBJ-AT ?auto_15848 ?auto_15854 ) ( OBJ-AT ?auto_15847 ?auto_15850 ) ( OBJ-AT ?auto_15845 ?auto_15854 ) ( TRUCK-AT ?auto_15851 ?auto_15844 ) ( IN-TRUCK ?auto_15843 ?auto_15851 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15843 ?auto_15844 )
      ( DELIVER-6PKG ?auto_15843 ?auto_15845 ?auto_15847 ?auto_15848 ?auto_15849 ?auto_15846 ?auto_15844 )
      ( DELIVER-6PKG-VERIFY ?auto_15843 ?auto_15845 ?auto_15847 ?auto_15848 ?auto_15849 ?auto_15846 ?auto_15844 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15862 - OBJ
      ?auto_15864 - OBJ
      ?auto_15866 - OBJ
      ?auto_15867 - OBJ
      ?auto_15868 - OBJ
      ?auto_15865 - OBJ
      ?auto_15863 - LOCATION
    )
    :vars
    (
      ?auto_15869 - LOCATION
      ?auto_15872 - CITY
      ?auto_15871 - LOCATION
      ?auto_15873 - LOCATION
      ?auto_15870 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15864 ?auto_15862 ) ( GREATER-THAN ?auto_15866 ?auto_15862 ) ( GREATER-THAN ?auto_15866 ?auto_15864 ) ( GREATER-THAN ?auto_15867 ?auto_15862 ) ( GREATER-THAN ?auto_15867 ?auto_15864 ) ( GREATER-THAN ?auto_15867 ?auto_15866 ) ( GREATER-THAN ?auto_15868 ?auto_15862 ) ( GREATER-THAN ?auto_15868 ?auto_15864 ) ( GREATER-THAN ?auto_15868 ?auto_15866 ) ( GREATER-THAN ?auto_15868 ?auto_15867 ) ( GREATER-THAN ?auto_15865 ?auto_15862 ) ( GREATER-THAN ?auto_15865 ?auto_15864 ) ( GREATER-THAN ?auto_15865 ?auto_15866 ) ( GREATER-THAN ?auto_15865 ?auto_15867 ) ( GREATER-THAN ?auto_15865 ?auto_15868 ) ( IN-CITY ?auto_15869 ?auto_15872 ) ( IN-CITY ?auto_15863 ?auto_15872 ) ( not ( = ?auto_15863 ?auto_15869 ) ) ( OBJ-AT ?auto_15865 ?auto_15869 ) ( not ( = ?auto_15862 ?auto_15864 ) ) ( not ( = ?auto_15862 ?auto_15866 ) ) ( not ( = ?auto_15862 ?auto_15867 ) ) ( not ( = ?auto_15862 ?auto_15868 ) ) ( not ( = ?auto_15862 ?auto_15865 ) ) ( not ( = ?auto_15864 ?auto_15866 ) ) ( not ( = ?auto_15864 ?auto_15867 ) ) ( not ( = ?auto_15864 ?auto_15868 ) ) ( not ( = ?auto_15864 ?auto_15865 ) ) ( not ( = ?auto_15866 ?auto_15867 ) ) ( not ( = ?auto_15866 ?auto_15868 ) ) ( not ( = ?auto_15866 ?auto_15865 ) ) ( not ( = ?auto_15867 ?auto_15868 ) ) ( not ( = ?auto_15867 ?auto_15865 ) ) ( not ( = ?auto_15868 ?auto_15865 ) ) ( IN-CITY ?auto_15871 ?auto_15872 ) ( not ( = ?auto_15863 ?auto_15871 ) ) ( not ( = ?auto_15869 ?auto_15871 ) ) ( OBJ-AT ?auto_15868 ?auto_15871 ) ( IN-CITY ?auto_15873 ?auto_15872 ) ( not ( = ?auto_15863 ?auto_15873 ) ) ( not ( = ?auto_15869 ?auto_15873 ) ) ( not ( = ?auto_15871 ?auto_15873 ) ) ( OBJ-AT ?auto_15867 ?auto_15873 ) ( OBJ-AT ?auto_15866 ?auto_15871 ) ( OBJ-AT ?auto_15864 ?auto_15873 ) ( IN-TRUCK ?auto_15862 ?auto_15870 ) ( TRUCK-AT ?auto_15870 ?auto_15873 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15870 ?auto_15873 ?auto_15863 ?auto_15872 )
      ( DELIVER-6PKG ?auto_15862 ?auto_15864 ?auto_15866 ?auto_15867 ?auto_15868 ?auto_15865 ?auto_15863 )
      ( DELIVER-6PKG-VERIFY ?auto_15862 ?auto_15864 ?auto_15866 ?auto_15867 ?auto_15868 ?auto_15865 ?auto_15863 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15881 - OBJ
      ?auto_15883 - OBJ
      ?auto_15885 - OBJ
      ?auto_15886 - OBJ
      ?auto_15887 - OBJ
      ?auto_15884 - OBJ
      ?auto_15882 - LOCATION
    )
    :vars
    (
      ?auto_15888 - LOCATION
      ?auto_15890 - CITY
      ?auto_15889 - LOCATION
      ?auto_15891 - LOCATION
      ?auto_15892 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15883 ?auto_15881 ) ( GREATER-THAN ?auto_15885 ?auto_15881 ) ( GREATER-THAN ?auto_15885 ?auto_15883 ) ( GREATER-THAN ?auto_15886 ?auto_15881 ) ( GREATER-THAN ?auto_15886 ?auto_15883 ) ( GREATER-THAN ?auto_15886 ?auto_15885 ) ( GREATER-THAN ?auto_15887 ?auto_15881 ) ( GREATER-THAN ?auto_15887 ?auto_15883 ) ( GREATER-THAN ?auto_15887 ?auto_15885 ) ( GREATER-THAN ?auto_15887 ?auto_15886 ) ( GREATER-THAN ?auto_15884 ?auto_15881 ) ( GREATER-THAN ?auto_15884 ?auto_15883 ) ( GREATER-THAN ?auto_15884 ?auto_15885 ) ( GREATER-THAN ?auto_15884 ?auto_15886 ) ( GREATER-THAN ?auto_15884 ?auto_15887 ) ( IN-CITY ?auto_15888 ?auto_15890 ) ( IN-CITY ?auto_15882 ?auto_15890 ) ( not ( = ?auto_15882 ?auto_15888 ) ) ( OBJ-AT ?auto_15884 ?auto_15888 ) ( not ( = ?auto_15881 ?auto_15883 ) ) ( not ( = ?auto_15881 ?auto_15885 ) ) ( not ( = ?auto_15881 ?auto_15886 ) ) ( not ( = ?auto_15881 ?auto_15887 ) ) ( not ( = ?auto_15881 ?auto_15884 ) ) ( not ( = ?auto_15883 ?auto_15885 ) ) ( not ( = ?auto_15883 ?auto_15886 ) ) ( not ( = ?auto_15883 ?auto_15887 ) ) ( not ( = ?auto_15883 ?auto_15884 ) ) ( not ( = ?auto_15885 ?auto_15886 ) ) ( not ( = ?auto_15885 ?auto_15887 ) ) ( not ( = ?auto_15885 ?auto_15884 ) ) ( not ( = ?auto_15886 ?auto_15887 ) ) ( not ( = ?auto_15886 ?auto_15884 ) ) ( not ( = ?auto_15887 ?auto_15884 ) ) ( IN-CITY ?auto_15889 ?auto_15890 ) ( not ( = ?auto_15882 ?auto_15889 ) ) ( not ( = ?auto_15888 ?auto_15889 ) ) ( OBJ-AT ?auto_15887 ?auto_15889 ) ( IN-CITY ?auto_15891 ?auto_15890 ) ( not ( = ?auto_15882 ?auto_15891 ) ) ( not ( = ?auto_15888 ?auto_15891 ) ) ( not ( = ?auto_15889 ?auto_15891 ) ) ( OBJ-AT ?auto_15886 ?auto_15891 ) ( OBJ-AT ?auto_15885 ?auto_15889 ) ( OBJ-AT ?auto_15883 ?auto_15891 ) ( TRUCK-AT ?auto_15892 ?auto_15891 ) ( OBJ-AT ?auto_15881 ?auto_15891 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15881 ?auto_15892 ?auto_15891 )
      ( DELIVER-6PKG ?auto_15881 ?auto_15883 ?auto_15885 ?auto_15886 ?auto_15887 ?auto_15884 ?auto_15882 )
      ( DELIVER-6PKG-VERIFY ?auto_15881 ?auto_15883 ?auto_15885 ?auto_15886 ?auto_15887 ?auto_15884 ?auto_15882 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_15900 - OBJ
      ?auto_15902 - OBJ
      ?auto_15904 - OBJ
      ?auto_15905 - OBJ
      ?auto_15906 - OBJ
      ?auto_15903 - OBJ
      ?auto_15901 - LOCATION
    )
    :vars
    (
      ?auto_15909 - LOCATION
      ?auto_15908 - CITY
      ?auto_15910 - LOCATION
      ?auto_15907 - LOCATION
      ?auto_15911 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_15902 ?auto_15900 ) ( GREATER-THAN ?auto_15904 ?auto_15900 ) ( GREATER-THAN ?auto_15904 ?auto_15902 ) ( GREATER-THAN ?auto_15905 ?auto_15900 ) ( GREATER-THAN ?auto_15905 ?auto_15902 ) ( GREATER-THAN ?auto_15905 ?auto_15904 ) ( GREATER-THAN ?auto_15906 ?auto_15900 ) ( GREATER-THAN ?auto_15906 ?auto_15902 ) ( GREATER-THAN ?auto_15906 ?auto_15904 ) ( GREATER-THAN ?auto_15906 ?auto_15905 ) ( GREATER-THAN ?auto_15903 ?auto_15900 ) ( GREATER-THAN ?auto_15903 ?auto_15902 ) ( GREATER-THAN ?auto_15903 ?auto_15904 ) ( GREATER-THAN ?auto_15903 ?auto_15905 ) ( GREATER-THAN ?auto_15903 ?auto_15906 ) ( IN-CITY ?auto_15909 ?auto_15908 ) ( IN-CITY ?auto_15901 ?auto_15908 ) ( not ( = ?auto_15901 ?auto_15909 ) ) ( OBJ-AT ?auto_15903 ?auto_15909 ) ( not ( = ?auto_15900 ?auto_15902 ) ) ( not ( = ?auto_15900 ?auto_15904 ) ) ( not ( = ?auto_15900 ?auto_15905 ) ) ( not ( = ?auto_15900 ?auto_15906 ) ) ( not ( = ?auto_15900 ?auto_15903 ) ) ( not ( = ?auto_15902 ?auto_15904 ) ) ( not ( = ?auto_15902 ?auto_15905 ) ) ( not ( = ?auto_15902 ?auto_15906 ) ) ( not ( = ?auto_15902 ?auto_15903 ) ) ( not ( = ?auto_15904 ?auto_15905 ) ) ( not ( = ?auto_15904 ?auto_15906 ) ) ( not ( = ?auto_15904 ?auto_15903 ) ) ( not ( = ?auto_15905 ?auto_15906 ) ) ( not ( = ?auto_15905 ?auto_15903 ) ) ( not ( = ?auto_15906 ?auto_15903 ) ) ( IN-CITY ?auto_15910 ?auto_15908 ) ( not ( = ?auto_15901 ?auto_15910 ) ) ( not ( = ?auto_15909 ?auto_15910 ) ) ( OBJ-AT ?auto_15906 ?auto_15910 ) ( IN-CITY ?auto_15907 ?auto_15908 ) ( not ( = ?auto_15901 ?auto_15907 ) ) ( not ( = ?auto_15909 ?auto_15907 ) ) ( not ( = ?auto_15910 ?auto_15907 ) ) ( OBJ-AT ?auto_15905 ?auto_15907 ) ( OBJ-AT ?auto_15904 ?auto_15910 ) ( OBJ-AT ?auto_15902 ?auto_15907 ) ( OBJ-AT ?auto_15900 ?auto_15907 ) ( TRUCK-AT ?auto_15911 ?auto_15901 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15911 ?auto_15901 ?auto_15907 ?auto_15908 )
      ( DELIVER-6PKG ?auto_15900 ?auto_15902 ?auto_15904 ?auto_15905 ?auto_15906 ?auto_15903 ?auto_15901 )
      ( DELIVER-6PKG-VERIFY ?auto_15900 ?auto_15902 ?auto_15904 ?auto_15905 ?auto_15906 ?auto_15903 ?auto_15901 ) )
  )

)

