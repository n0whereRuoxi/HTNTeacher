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
      ?auto_135410 - OBJ
      ?auto_135409 - LOCATION
    )
    :vars
    (
      ?auto_135411 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135411 ?auto_135409 ) ( IN-TRUCK ?auto_135410 ?auto_135411 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_135410 ?auto_135411 ?auto_135409 )
      ( DELIVER-1PKG-VERIFY ?auto_135410 ?auto_135409 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135428 - OBJ
      ?auto_135427 - LOCATION
    )
    :vars
    (
      ?auto_135429 - TRUCK
      ?auto_135430 - LOCATION
      ?auto_135431 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135428 ?auto_135429 ) ( TRUCK-AT ?auto_135429 ?auto_135430 ) ( IN-CITY ?auto_135430 ?auto_135431 ) ( IN-CITY ?auto_135427 ?auto_135431 ) ( not ( = ?auto_135427 ?auto_135430 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_135429 ?auto_135430 ?auto_135427 ?auto_135431 )
      ( DELIVER-1PKG ?auto_135428 ?auto_135427 )
      ( DELIVER-1PKG-VERIFY ?auto_135428 ?auto_135427 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135454 - OBJ
      ?auto_135453 - LOCATION
    )
    :vars
    (
      ?auto_135456 - TRUCK
      ?auto_135455 - LOCATION
      ?auto_135457 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135456 ?auto_135455 ) ( IN-CITY ?auto_135455 ?auto_135457 ) ( IN-CITY ?auto_135453 ?auto_135457 ) ( not ( = ?auto_135453 ?auto_135455 ) ) ( OBJ-AT ?auto_135454 ?auto_135455 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_135454 ?auto_135456 ?auto_135455 )
      ( DELIVER-1PKG ?auto_135454 ?auto_135453 )
      ( DELIVER-1PKG-VERIFY ?auto_135454 ?auto_135453 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135480 - OBJ
      ?auto_135479 - LOCATION
    )
    :vars
    (
      ?auto_135481 - LOCATION
      ?auto_135482 - CITY
      ?auto_135483 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135481 ?auto_135482 ) ( IN-CITY ?auto_135479 ?auto_135482 ) ( not ( = ?auto_135479 ?auto_135481 ) ) ( OBJ-AT ?auto_135480 ?auto_135481 ) ( TRUCK-AT ?auto_135483 ?auto_135479 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_135483 ?auto_135479 ?auto_135481 ?auto_135482 )
      ( DELIVER-1PKG ?auto_135480 ?auto_135479 )
      ( DELIVER-1PKG-VERIFY ?auto_135480 ?auto_135479 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135623 - OBJ
      ?auto_135624 - OBJ
      ?auto_135622 - LOCATION
    )
    :vars
    (
      ?auto_135625 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135625 ?auto_135622 ) ( IN-TRUCK ?auto_135624 ?auto_135625 ) ( OBJ-AT ?auto_135623 ?auto_135622 ) ( not ( = ?auto_135623 ?auto_135624 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135624 ?auto_135622 )
      ( DELIVER-2PKG-VERIFY ?auto_135623 ?auto_135624 ?auto_135622 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135627 - OBJ
      ?auto_135628 - OBJ
      ?auto_135626 - LOCATION
    )
    :vars
    (
      ?auto_135629 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135629 ?auto_135626 ) ( IN-TRUCK ?auto_135627 ?auto_135629 ) ( OBJ-AT ?auto_135628 ?auto_135626 ) ( not ( = ?auto_135627 ?auto_135628 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135627 ?auto_135626 )
      ( DELIVER-2PKG-VERIFY ?auto_135627 ?auto_135628 ?auto_135626 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135635 - OBJ
      ?auto_135636 - OBJ
      ?auto_135637 - OBJ
      ?auto_135634 - LOCATION
    )
    :vars
    (
      ?auto_135638 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135638 ?auto_135634 ) ( IN-TRUCK ?auto_135637 ?auto_135638 ) ( OBJ-AT ?auto_135635 ?auto_135634 ) ( OBJ-AT ?auto_135636 ?auto_135634 ) ( not ( = ?auto_135635 ?auto_135636 ) ) ( not ( = ?auto_135635 ?auto_135637 ) ) ( not ( = ?auto_135636 ?auto_135637 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135637 ?auto_135634 )
      ( DELIVER-3PKG-VERIFY ?auto_135635 ?auto_135636 ?auto_135637 ?auto_135634 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135640 - OBJ
      ?auto_135641 - OBJ
      ?auto_135642 - OBJ
      ?auto_135639 - LOCATION
    )
    :vars
    (
      ?auto_135643 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135643 ?auto_135639 ) ( IN-TRUCK ?auto_135641 ?auto_135643 ) ( OBJ-AT ?auto_135640 ?auto_135639 ) ( OBJ-AT ?auto_135642 ?auto_135639 ) ( not ( = ?auto_135640 ?auto_135641 ) ) ( not ( = ?auto_135640 ?auto_135642 ) ) ( not ( = ?auto_135641 ?auto_135642 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135641 ?auto_135639 )
      ( DELIVER-3PKG-VERIFY ?auto_135640 ?auto_135641 ?auto_135642 ?auto_135639 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135650 - OBJ
      ?auto_135651 - OBJ
      ?auto_135652 - OBJ
      ?auto_135649 - LOCATION
    )
    :vars
    (
      ?auto_135653 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135653 ?auto_135649 ) ( IN-TRUCK ?auto_135650 ?auto_135653 ) ( OBJ-AT ?auto_135651 ?auto_135649 ) ( OBJ-AT ?auto_135652 ?auto_135649 ) ( not ( = ?auto_135650 ?auto_135651 ) ) ( not ( = ?auto_135650 ?auto_135652 ) ) ( not ( = ?auto_135651 ?auto_135652 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135650 ?auto_135649 )
      ( DELIVER-3PKG-VERIFY ?auto_135650 ?auto_135651 ?auto_135652 ?auto_135649 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135670 - OBJ
      ?auto_135671 - OBJ
      ?auto_135672 - OBJ
      ?auto_135673 - OBJ
      ?auto_135669 - LOCATION
    )
    :vars
    (
      ?auto_135674 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135674 ?auto_135669 ) ( IN-TRUCK ?auto_135673 ?auto_135674 ) ( OBJ-AT ?auto_135670 ?auto_135669 ) ( OBJ-AT ?auto_135671 ?auto_135669 ) ( OBJ-AT ?auto_135672 ?auto_135669 ) ( not ( = ?auto_135670 ?auto_135671 ) ) ( not ( = ?auto_135670 ?auto_135672 ) ) ( not ( = ?auto_135670 ?auto_135673 ) ) ( not ( = ?auto_135671 ?auto_135672 ) ) ( not ( = ?auto_135671 ?auto_135673 ) ) ( not ( = ?auto_135672 ?auto_135673 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135673 ?auto_135669 )
      ( DELIVER-4PKG-VERIFY ?auto_135670 ?auto_135671 ?auto_135672 ?auto_135673 ?auto_135669 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135676 - OBJ
      ?auto_135677 - OBJ
      ?auto_135678 - OBJ
      ?auto_135679 - OBJ
      ?auto_135675 - LOCATION
    )
    :vars
    (
      ?auto_135680 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135680 ?auto_135675 ) ( IN-TRUCK ?auto_135678 ?auto_135680 ) ( OBJ-AT ?auto_135676 ?auto_135675 ) ( OBJ-AT ?auto_135677 ?auto_135675 ) ( OBJ-AT ?auto_135679 ?auto_135675 ) ( not ( = ?auto_135676 ?auto_135677 ) ) ( not ( = ?auto_135676 ?auto_135678 ) ) ( not ( = ?auto_135676 ?auto_135679 ) ) ( not ( = ?auto_135677 ?auto_135678 ) ) ( not ( = ?auto_135677 ?auto_135679 ) ) ( not ( = ?auto_135678 ?auto_135679 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135678 ?auto_135675 )
      ( DELIVER-4PKG-VERIFY ?auto_135676 ?auto_135677 ?auto_135678 ?auto_135679 ?auto_135675 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135688 - OBJ
      ?auto_135689 - OBJ
      ?auto_135690 - OBJ
      ?auto_135691 - OBJ
      ?auto_135687 - LOCATION
    )
    :vars
    (
      ?auto_135692 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135692 ?auto_135687 ) ( IN-TRUCK ?auto_135689 ?auto_135692 ) ( OBJ-AT ?auto_135688 ?auto_135687 ) ( OBJ-AT ?auto_135690 ?auto_135687 ) ( OBJ-AT ?auto_135691 ?auto_135687 ) ( not ( = ?auto_135688 ?auto_135689 ) ) ( not ( = ?auto_135688 ?auto_135690 ) ) ( not ( = ?auto_135688 ?auto_135691 ) ) ( not ( = ?auto_135689 ?auto_135690 ) ) ( not ( = ?auto_135689 ?auto_135691 ) ) ( not ( = ?auto_135690 ?auto_135691 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135689 ?auto_135687 )
      ( DELIVER-4PKG-VERIFY ?auto_135688 ?auto_135689 ?auto_135690 ?auto_135691 ?auto_135687 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135712 - OBJ
      ?auto_135713 - OBJ
      ?auto_135714 - OBJ
      ?auto_135715 - OBJ
      ?auto_135711 - LOCATION
    )
    :vars
    (
      ?auto_135716 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135716 ?auto_135711 ) ( IN-TRUCK ?auto_135712 ?auto_135716 ) ( OBJ-AT ?auto_135713 ?auto_135711 ) ( OBJ-AT ?auto_135714 ?auto_135711 ) ( OBJ-AT ?auto_135715 ?auto_135711 ) ( not ( = ?auto_135712 ?auto_135713 ) ) ( not ( = ?auto_135712 ?auto_135714 ) ) ( not ( = ?auto_135712 ?auto_135715 ) ) ( not ( = ?auto_135713 ?auto_135714 ) ) ( not ( = ?auto_135713 ?auto_135715 ) ) ( not ( = ?auto_135714 ?auto_135715 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135712 ?auto_135711 )
      ( DELIVER-4PKG-VERIFY ?auto_135712 ?auto_135713 ?auto_135714 ?auto_135715 ?auto_135711 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135765 - OBJ
      ?auto_135766 - OBJ
      ?auto_135764 - LOCATION
    )
    :vars
    (
      ?auto_135768 - TRUCK
      ?auto_135769 - LOCATION
      ?auto_135767 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135766 ?auto_135768 ) ( TRUCK-AT ?auto_135768 ?auto_135769 ) ( IN-CITY ?auto_135769 ?auto_135767 ) ( IN-CITY ?auto_135764 ?auto_135767 ) ( not ( = ?auto_135764 ?auto_135769 ) ) ( OBJ-AT ?auto_135765 ?auto_135764 ) ( not ( = ?auto_135765 ?auto_135766 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135766 ?auto_135764 )
      ( DELIVER-2PKG-VERIFY ?auto_135765 ?auto_135766 ?auto_135764 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135771 - OBJ
      ?auto_135772 - OBJ
      ?auto_135770 - LOCATION
    )
    :vars
    (
      ?auto_135774 - TRUCK
      ?auto_135773 - LOCATION
      ?auto_135775 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135771 ?auto_135774 ) ( TRUCK-AT ?auto_135774 ?auto_135773 ) ( IN-CITY ?auto_135773 ?auto_135775 ) ( IN-CITY ?auto_135770 ?auto_135775 ) ( not ( = ?auto_135770 ?auto_135773 ) ) ( OBJ-AT ?auto_135772 ?auto_135770 ) ( not ( = ?auto_135772 ?auto_135771 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135772 ?auto_135771 ?auto_135770 )
      ( DELIVER-2PKG-VERIFY ?auto_135771 ?auto_135772 ?auto_135770 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135784 - OBJ
      ?auto_135785 - OBJ
      ?auto_135786 - OBJ
      ?auto_135783 - LOCATION
    )
    :vars
    (
      ?auto_135788 - TRUCK
      ?auto_135787 - LOCATION
      ?auto_135789 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135786 ?auto_135788 ) ( TRUCK-AT ?auto_135788 ?auto_135787 ) ( IN-CITY ?auto_135787 ?auto_135789 ) ( IN-CITY ?auto_135783 ?auto_135789 ) ( not ( = ?auto_135783 ?auto_135787 ) ) ( OBJ-AT ?auto_135785 ?auto_135783 ) ( not ( = ?auto_135785 ?auto_135786 ) ) ( OBJ-AT ?auto_135784 ?auto_135783 ) ( not ( = ?auto_135784 ?auto_135785 ) ) ( not ( = ?auto_135784 ?auto_135786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135785 ?auto_135786 ?auto_135783 )
      ( DELIVER-3PKG-VERIFY ?auto_135784 ?auto_135785 ?auto_135786 ?auto_135783 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135791 - OBJ
      ?auto_135792 - OBJ
      ?auto_135793 - OBJ
      ?auto_135790 - LOCATION
    )
    :vars
    (
      ?auto_135795 - TRUCK
      ?auto_135794 - LOCATION
      ?auto_135796 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135792 ?auto_135795 ) ( TRUCK-AT ?auto_135795 ?auto_135794 ) ( IN-CITY ?auto_135794 ?auto_135796 ) ( IN-CITY ?auto_135790 ?auto_135796 ) ( not ( = ?auto_135790 ?auto_135794 ) ) ( OBJ-AT ?auto_135793 ?auto_135790 ) ( not ( = ?auto_135793 ?auto_135792 ) ) ( OBJ-AT ?auto_135791 ?auto_135790 ) ( not ( = ?auto_135791 ?auto_135792 ) ) ( not ( = ?auto_135791 ?auto_135793 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135793 ?auto_135792 ?auto_135790 )
      ( DELIVER-3PKG-VERIFY ?auto_135791 ?auto_135792 ?auto_135793 ?auto_135790 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135805 - OBJ
      ?auto_135806 - OBJ
      ?auto_135807 - OBJ
      ?auto_135804 - LOCATION
    )
    :vars
    (
      ?auto_135809 - TRUCK
      ?auto_135808 - LOCATION
      ?auto_135810 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135805 ?auto_135809 ) ( TRUCK-AT ?auto_135809 ?auto_135808 ) ( IN-CITY ?auto_135808 ?auto_135810 ) ( IN-CITY ?auto_135804 ?auto_135810 ) ( not ( = ?auto_135804 ?auto_135808 ) ) ( OBJ-AT ?auto_135806 ?auto_135804 ) ( not ( = ?auto_135806 ?auto_135805 ) ) ( OBJ-AT ?auto_135807 ?auto_135804 ) ( not ( = ?auto_135805 ?auto_135807 ) ) ( not ( = ?auto_135806 ?auto_135807 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135806 ?auto_135805 ?auto_135804 )
      ( DELIVER-3PKG-VERIFY ?auto_135805 ?auto_135806 ?auto_135807 ?auto_135804 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135834 - OBJ
      ?auto_135835 - OBJ
      ?auto_135836 - OBJ
      ?auto_135837 - OBJ
      ?auto_135833 - LOCATION
    )
    :vars
    (
      ?auto_135839 - TRUCK
      ?auto_135838 - LOCATION
      ?auto_135840 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135837 ?auto_135839 ) ( TRUCK-AT ?auto_135839 ?auto_135838 ) ( IN-CITY ?auto_135838 ?auto_135840 ) ( IN-CITY ?auto_135833 ?auto_135840 ) ( not ( = ?auto_135833 ?auto_135838 ) ) ( OBJ-AT ?auto_135835 ?auto_135833 ) ( not ( = ?auto_135835 ?auto_135837 ) ) ( OBJ-AT ?auto_135834 ?auto_135833 ) ( OBJ-AT ?auto_135836 ?auto_135833 ) ( not ( = ?auto_135834 ?auto_135835 ) ) ( not ( = ?auto_135834 ?auto_135836 ) ) ( not ( = ?auto_135834 ?auto_135837 ) ) ( not ( = ?auto_135835 ?auto_135836 ) ) ( not ( = ?auto_135836 ?auto_135837 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135835 ?auto_135837 ?auto_135833 )
      ( DELIVER-4PKG-VERIFY ?auto_135834 ?auto_135835 ?auto_135836 ?auto_135837 ?auto_135833 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135842 - OBJ
      ?auto_135843 - OBJ
      ?auto_135844 - OBJ
      ?auto_135845 - OBJ
      ?auto_135841 - LOCATION
    )
    :vars
    (
      ?auto_135847 - TRUCK
      ?auto_135846 - LOCATION
      ?auto_135848 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135844 ?auto_135847 ) ( TRUCK-AT ?auto_135847 ?auto_135846 ) ( IN-CITY ?auto_135846 ?auto_135848 ) ( IN-CITY ?auto_135841 ?auto_135848 ) ( not ( = ?auto_135841 ?auto_135846 ) ) ( OBJ-AT ?auto_135843 ?auto_135841 ) ( not ( = ?auto_135843 ?auto_135844 ) ) ( OBJ-AT ?auto_135842 ?auto_135841 ) ( OBJ-AT ?auto_135845 ?auto_135841 ) ( not ( = ?auto_135842 ?auto_135843 ) ) ( not ( = ?auto_135842 ?auto_135844 ) ) ( not ( = ?auto_135842 ?auto_135845 ) ) ( not ( = ?auto_135843 ?auto_135845 ) ) ( not ( = ?auto_135844 ?auto_135845 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135843 ?auto_135844 ?auto_135841 )
      ( DELIVER-4PKG-VERIFY ?auto_135842 ?auto_135843 ?auto_135844 ?auto_135845 ?auto_135841 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135858 - OBJ
      ?auto_135859 - OBJ
      ?auto_135860 - OBJ
      ?auto_135861 - OBJ
      ?auto_135857 - LOCATION
    )
    :vars
    (
      ?auto_135863 - TRUCK
      ?auto_135862 - LOCATION
      ?auto_135864 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135859 ?auto_135863 ) ( TRUCK-AT ?auto_135863 ?auto_135862 ) ( IN-CITY ?auto_135862 ?auto_135864 ) ( IN-CITY ?auto_135857 ?auto_135864 ) ( not ( = ?auto_135857 ?auto_135862 ) ) ( OBJ-AT ?auto_135860 ?auto_135857 ) ( not ( = ?auto_135860 ?auto_135859 ) ) ( OBJ-AT ?auto_135858 ?auto_135857 ) ( OBJ-AT ?auto_135861 ?auto_135857 ) ( not ( = ?auto_135858 ?auto_135859 ) ) ( not ( = ?auto_135858 ?auto_135860 ) ) ( not ( = ?auto_135858 ?auto_135861 ) ) ( not ( = ?auto_135859 ?auto_135861 ) ) ( not ( = ?auto_135860 ?auto_135861 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135860 ?auto_135859 ?auto_135857 )
      ( DELIVER-4PKG-VERIFY ?auto_135858 ?auto_135859 ?auto_135860 ?auto_135861 ?auto_135857 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135890 - OBJ
      ?auto_135891 - OBJ
      ?auto_135892 - OBJ
      ?auto_135893 - OBJ
      ?auto_135889 - LOCATION
    )
    :vars
    (
      ?auto_135895 - TRUCK
      ?auto_135894 - LOCATION
      ?auto_135896 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135890 ?auto_135895 ) ( TRUCK-AT ?auto_135895 ?auto_135894 ) ( IN-CITY ?auto_135894 ?auto_135896 ) ( IN-CITY ?auto_135889 ?auto_135896 ) ( not ( = ?auto_135889 ?auto_135894 ) ) ( OBJ-AT ?auto_135891 ?auto_135889 ) ( not ( = ?auto_135891 ?auto_135890 ) ) ( OBJ-AT ?auto_135892 ?auto_135889 ) ( OBJ-AT ?auto_135893 ?auto_135889 ) ( not ( = ?auto_135890 ?auto_135892 ) ) ( not ( = ?auto_135890 ?auto_135893 ) ) ( not ( = ?auto_135891 ?auto_135892 ) ) ( not ( = ?auto_135891 ?auto_135893 ) ) ( not ( = ?auto_135892 ?auto_135893 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135891 ?auto_135890 ?auto_135889 )
      ( DELIVER-4PKG-VERIFY ?auto_135890 ?auto_135891 ?auto_135892 ?auto_135893 ?auto_135889 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135955 - OBJ
      ?auto_135954 - LOCATION
    )
    :vars
    (
      ?auto_135957 - TRUCK
      ?auto_135956 - LOCATION
      ?auto_135958 - CITY
      ?auto_135959 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135957 ?auto_135956 ) ( IN-CITY ?auto_135956 ?auto_135958 ) ( IN-CITY ?auto_135954 ?auto_135958 ) ( not ( = ?auto_135954 ?auto_135956 ) ) ( OBJ-AT ?auto_135959 ?auto_135954 ) ( not ( = ?auto_135959 ?auto_135955 ) ) ( OBJ-AT ?auto_135955 ?auto_135956 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_135955 ?auto_135957 ?auto_135956 )
      ( DELIVER-2PKG ?auto_135959 ?auto_135955 ?auto_135954 )
      ( DELIVER-1PKG-VERIFY ?auto_135955 ?auto_135954 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135961 - OBJ
      ?auto_135962 - OBJ
      ?auto_135960 - LOCATION
    )
    :vars
    (
      ?auto_135964 - TRUCK
      ?auto_135963 - LOCATION
      ?auto_135965 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135964 ?auto_135963 ) ( IN-CITY ?auto_135963 ?auto_135965 ) ( IN-CITY ?auto_135960 ?auto_135965 ) ( not ( = ?auto_135960 ?auto_135963 ) ) ( OBJ-AT ?auto_135961 ?auto_135960 ) ( not ( = ?auto_135961 ?auto_135962 ) ) ( OBJ-AT ?auto_135962 ?auto_135963 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135962 ?auto_135960 )
      ( DELIVER-2PKG-VERIFY ?auto_135961 ?auto_135962 ?auto_135960 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135967 - OBJ
      ?auto_135968 - OBJ
      ?auto_135966 - LOCATION
    )
    :vars
    (
      ?auto_135971 - TRUCK
      ?auto_135970 - LOCATION
      ?auto_135969 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135971 ?auto_135970 ) ( IN-CITY ?auto_135970 ?auto_135969 ) ( IN-CITY ?auto_135966 ?auto_135969 ) ( not ( = ?auto_135966 ?auto_135970 ) ) ( OBJ-AT ?auto_135968 ?auto_135966 ) ( not ( = ?auto_135968 ?auto_135967 ) ) ( OBJ-AT ?auto_135967 ?auto_135970 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135968 ?auto_135967 ?auto_135966 )
      ( DELIVER-2PKG-VERIFY ?auto_135967 ?auto_135968 ?auto_135966 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135980 - OBJ
      ?auto_135981 - OBJ
      ?auto_135982 - OBJ
      ?auto_135979 - LOCATION
    )
    :vars
    (
      ?auto_135985 - TRUCK
      ?auto_135984 - LOCATION
      ?auto_135983 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135985 ?auto_135984 ) ( IN-CITY ?auto_135984 ?auto_135983 ) ( IN-CITY ?auto_135979 ?auto_135983 ) ( not ( = ?auto_135979 ?auto_135984 ) ) ( OBJ-AT ?auto_135981 ?auto_135979 ) ( not ( = ?auto_135981 ?auto_135982 ) ) ( OBJ-AT ?auto_135982 ?auto_135984 ) ( OBJ-AT ?auto_135980 ?auto_135979 ) ( not ( = ?auto_135980 ?auto_135981 ) ) ( not ( = ?auto_135980 ?auto_135982 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135981 ?auto_135982 ?auto_135979 )
      ( DELIVER-3PKG-VERIFY ?auto_135980 ?auto_135981 ?auto_135982 ?auto_135979 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135987 - OBJ
      ?auto_135988 - OBJ
      ?auto_135989 - OBJ
      ?auto_135986 - LOCATION
    )
    :vars
    (
      ?auto_135992 - TRUCK
      ?auto_135991 - LOCATION
      ?auto_135990 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135992 ?auto_135991 ) ( IN-CITY ?auto_135991 ?auto_135990 ) ( IN-CITY ?auto_135986 ?auto_135990 ) ( not ( = ?auto_135986 ?auto_135991 ) ) ( OBJ-AT ?auto_135987 ?auto_135986 ) ( not ( = ?auto_135987 ?auto_135988 ) ) ( OBJ-AT ?auto_135988 ?auto_135991 ) ( OBJ-AT ?auto_135989 ?auto_135986 ) ( not ( = ?auto_135987 ?auto_135989 ) ) ( not ( = ?auto_135988 ?auto_135989 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135987 ?auto_135988 ?auto_135986 )
      ( DELIVER-3PKG-VERIFY ?auto_135987 ?auto_135988 ?auto_135989 ?auto_135986 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136001 - OBJ
      ?auto_136002 - OBJ
      ?auto_136003 - OBJ
      ?auto_136000 - LOCATION
    )
    :vars
    (
      ?auto_136006 - TRUCK
      ?auto_136005 - LOCATION
      ?auto_136004 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136006 ?auto_136005 ) ( IN-CITY ?auto_136005 ?auto_136004 ) ( IN-CITY ?auto_136000 ?auto_136004 ) ( not ( = ?auto_136000 ?auto_136005 ) ) ( OBJ-AT ?auto_136002 ?auto_136000 ) ( not ( = ?auto_136002 ?auto_136001 ) ) ( OBJ-AT ?auto_136001 ?auto_136005 ) ( OBJ-AT ?auto_136003 ?auto_136000 ) ( not ( = ?auto_136001 ?auto_136003 ) ) ( not ( = ?auto_136002 ?auto_136003 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136002 ?auto_136001 ?auto_136000 )
      ( DELIVER-3PKG-VERIFY ?auto_136001 ?auto_136002 ?auto_136003 ?auto_136000 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136030 - OBJ
      ?auto_136031 - OBJ
      ?auto_136032 - OBJ
      ?auto_136033 - OBJ
      ?auto_136029 - LOCATION
    )
    :vars
    (
      ?auto_136036 - TRUCK
      ?auto_136035 - LOCATION
      ?auto_136034 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136036 ?auto_136035 ) ( IN-CITY ?auto_136035 ?auto_136034 ) ( IN-CITY ?auto_136029 ?auto_136034 ) ( not ( = ?auto_136029 ?auto_136035 ) ) ( OBJ-AT ?auto_136031 ?auto_136029 ) ( not ( = ?auto_136031 ?auto_136033 ) ) ( OBJ-AT ?auto_136033 ?auto_136035 ) ( OBJ-AT ?auto_136030 ?auto_136029 ) ( OBJ-AT ?auto_136032 ?auto_136029 ) ( not ( = ?auto_136030 ?auto_136031 ) ) ( not ( = ?auto_136030 ?auto_136032 ) ) ( not ( = ?auto_136030 ?auto_136033 ) ) ( not ( = ?auto_136031 ?auto_136032 ) ) ( not ( = ?auto_136032 ?auto_136033 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136031 ?auto_136033 ?auto_136029 )
      ( DELIVER-4PKG-VERIFY ?auto_136030 ?auto_136031 ?auto_136032 ?auto_136033 ?auto_136029 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136038 - OBJ
      ?auto_136039 - OBJ
      ?auto_136040 - OBJ
      ?auto_136041 - OBJ
      ?auto_136037 - LOCATION
    )
    :vars
    (
      ?auto_136044 - TRUCK
      ?auto_136043 - LOCATION
      ?auto_136042 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136044 ?auto_136043 ) ( IN-CITY ?auto_136043 ?auto_136042 ) ( IN-CITY ?auto_136037 ?auto_136042 ) ( not ( = ?auto_136037 ?auto_136043 ) ) ( OBJ-AT ?auto_136038 ?auto_136037 ) ( not ( = ?auto_136038 ?auto_136040 ) ) ( OBJ-AT ?auto_136040 ?auto_136043 ) ( OBJ-AT ?auto_136039 ?auto_136037 ) ( OBJ-AT ?auto_136041 ?auto_136037 ) ( not ( = ?auto_136038 ?auto_136039 ) ) ( not ( = ?auto_136038 ?auto_136041 ) ) ( not ( = ?auto_136039 ?auto_136040 ) ) ( not ( = ?auto_136039 ?auto_136041 ) ) ( not ( = ?auto_136040 ?auto_136041 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136038 ?auto_136040 ?auto_136037 )
      ( DELIVER-4PKG-VERIFY ?auto_136038 ?auto_136039 ?auto_136040 ?auto_136041 ?auto_136037 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136054 - OBJ
      ?auto_136055 - OBJ
      ?auto_136056 - OBJ
      ?auto_136057 - OBJ
      ?auto_136053 - LOCATION
    )
    :vars
    (
      ?auto_136060 - TRUCK
      ?auto_136059 - LOCATION
      ?auto_136058 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136060 ?auto_136059 ) ( IN-CITY ?auto_136059 ?auto_136058 ) ( IN-CITY ?auto_136053 ?auto_136058 ) ( not ( = ?auto_136053 ?auto_136059 ) ) ( OBJ-AT ?auto_136054 ?auto_136053 ) ( not ( = ?auto_136054 ?auto_136055 ) ) ( OBJ-AT ?auto_136055 ?auto_136059 ) ( OBJ-AT ?auto_136056 ?auto_136053 ) ( OBJ-AT ?auto_136057 ?auto_136053 ) ( not ( = ?auto_136054 ?auto_136056 ) ) ( not ( = ?auto_136054 ?auto_136057 ) ) ( not ( = ?auto_136055 ?auto_136056 ) ) ( not ( = ?auto_136055 ?auto_136057 ) ) ( not ( = ?auto_136056 ?auto_136057 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136054 ?auto_136055 ?auto_136053 )
      ( DELIVER-4PKG-VERIFY ?auto_136054 ?auto_136055 ?auto_136056 ?auto_136057 ?auto_136053 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136086 - OBJ
      ?auto_136087 - OBJ
      ?auto_136088 - OBJ
      ?auto_136089 - OBJ
      ?auto_136085 - LOCATION
    )
    :vars
    (
      ?auto_136092 - TRUCK
      ?auto_136091 - LOCATION
      ?auto_136090 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136092 ?auto_136091 ) ( IN-CITY ?auto_136091 ?auto_136090 ) ( IN-CITY ?auto_136085 ?auto_136090 ) ( not ( = ?auto_136085 ?auto_136091 ) ) ( OBJ-AT ?auto_136089 ?auto_136085 ) ( not ( = ?auto_136089 ?auto_136086 ) ) ( OBJ-AT ?auto_136086 ?auto_136091 ) ( OBJ-AT ?auto_136087 ?auto_136085 ) ( OBJ-AT ?auto_136088 ?auto_136085 ) ( not ( = ?auto_136086 ?auto_136087 ) ) ( not ( = ?auto_136086 ?auto_136088 ) ) ( not ( = ?auto_136087 ?auto_136088 ) ) ( not ( = ?auto_136087 ?auto_136089 ) ) ( not ( = ?auto_136088 ?auto_136089 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136089 ?auto_136086 ?auto_136085 )
      ( DELIVER-4PKG-VERIFY ?auto_136086 ?auto_136087 ?auto_136088 ?auto_136089 ?auto_136085 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136151 - OBJ
      ?auto_136150 - LOCATION
    )
    :vars
    (
      ?auto_136153 - LOCATION
      ?auto_136152 - CITY
      ?auto_136155 - OBJ
      ?auto_136154 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136153 ?auto_136152 ) ( IN-CITY ?auto_136150 ?auto_136152 ) ( not ( = ?auto_136150 ?auto_136153 ) ) ( OBJ-AT ?auto_136155 ?auto_136150 ) ( not ( = ?auto_136155 ?auto_136151 ) ) ( OBJ-AT ?auto_136151 ?auto_136153 ) ( TRUCK-AT ?auto_136154 ?auto_136150 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_136154 ?auto_136150 ?auto_136153 ?auto_136152 )
      ( DELIVER-2PKG ?auto_136155 ?auto_136151 ?auto_136150 )
      ( DELIVER-1PKG-VERIFY ?auto_136151 ?auto_136150 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136157 - OBJ
      ?auto_136158 - OBJ
      ?auto_136156 - LOCATION
    )
    :vars
    (
      ?auto_136161 - LOCATION
      ?auto_136160 - CITY
      ?auto_136159 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136161 ?auto_136160 ) ( IN-CITY ?auto_136156 ?auto_136160 ) ( not ( = ?auto_136156 ?auto_136161 ) ) ( OBJ-AT ?auto_136157 ?auto_136156 ) ( not ( = ?auto_136157 ?auto_136158 ) ) ( OBJ-AT ?auto_136158 ?auto_136161 ) ( TRUCK-AT ?auto_136159 ?auto_136156 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136158 ?auto_136156 )
      ( DELIVER-2PKG-VERIFY ?auto_136157 ?auto_136158 ?auto_136156 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136163 - OBJ
      ?auto_136164 - OBJ
      ?auto_136162 - LOCATION
    )
    :vars
    (
      ?auto_136165 - LOCATION
      ?auto_136167 - CITY
      ?auto_136166 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136165 ?auto_136167 ) ( IN-CITY ?auto_136162 ?auto_136167 ) ( not ( = ?auto_136162 ?auto_136165 ) ) ( OBJ-AT ?auto_136164 ?auto_136162 ) ( not ( = ?auto_136164 ?auto_136163 ) ) ( OBJ-AT ?auto_136163 ?auto_136165 ) ( TRUCK-AT ?auto_136166 ?auto_136162 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136164 ?auto_136163 ?auto_136162 )
      ( DELIVER-2PKG-VERIFY ?auto_136163 ?auto_136164 ?auto_136162 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136176 - OBJ
      ?auto_136177 - OBJ
      ?auto_136178 - OBJ
      ?auto_136175 - LOCATION
    )
    :vars
    (
      ?auto_136179 - LOCATION
      ?auto_136181 - CITY
      ?auto_136180 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136179 ?auto_136181 ) ( IN-CITY ?auto_136175 ?auto_136181 ) ( not ( = ?auto_136175 ?auto_136179 ) ) ( OBJ-AT ?auto_136176 ?auto_136175 ) ( not ( = ?auto_136176 ?auto_136178 ) ) ( OBJ-AT ?auto_136178 ?auto_136179 ) ( TRUCK-AT ?auto_136180 ?auto_136175 ) ( OBJ-AT ?auto_136177 ?auto_136175 ) ( not ( = ?auto_136176 ?auto_136177 ) ) ( not ( = ?auto_136177 ?auto_136178 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136176 ?auto_136178 ?auto_136175 )
      ( DELIVER-3PKG-VERIFY ?auto_136176 ?auto_136177 ?auto_136178 ?auto_136175 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136183 - OBJ
      ?auto_136184 - OBJ
      ?auto_136185 - OBJ
      ?auto_136182 - LOCATION
    )
    :vars
    (
      ?auto_136186 - LOCATION
      ?auto_136188 - CITY
      ?auto_136187 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136186 ?auto_136188 ) ( IN-CITY ?auto_136182 ?auto_136188 ) ( not ( = ?auto_136182 ?auto_136186 ) ) ( OBJ-AT ?auto_136185 ?auto_136182 ) ( not ( = ?auto_136185 ?auto_136184 ) ) ( OBJ-AT ?auto_136184 ?auto_136186 ) ( TRUCK-AT ?auto_136187 ?auto_136182 ) ( OBJ-AT ?auto_136183 ?auto_136182 ) ( not ( = ?auto_136183 ?auto_136184 ) ) ( not ( = ?auto_136183 ?auto_136185 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136185 ?auto_136184 ?auto_136182 )
      ( DELIVER-3PKG-VERIFY ?auto_136183 ?auto_136184 ?auto_136185 ?auto_136182 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136197 - OBJ
      ?auto_136198 - OBJ
      ?auto_136199 - OBJ
      ?auto_136196 - LOCATION
    )
    :vars
    (
      ?auto_136200 - LOCATION
      ?auto_136202 - CITY
      ?auto_136201 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136200 ?auto_136202 ) ( IN-CITY ?auto_136196 ?auto_136202 ) ( not ( = ?auto_136196 ?auto_136200 ) ) ( OBJ-AT ?auto_136198 ?auto_136196 ) ( not ( = ?auto_136198 ?auto_136197 ) ) ( OBJ-AT ?auto_136197 ?auto_136200 ) ( TRUCK-AT ?auto_136201 ?auto_136196 ) ( OBJ-AT ?auto_136199 ?auto_136196 ) ( not ( = ?auto_136197 ?auto_136199 ) ) ( not ( = ?auto_136198 ?auto_136199 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136198 ?auto_136197 ?auto_136196 )
      ( DELIVER-3PKG-VERIFY ?auto_136197 ?auto_136198 ?auto_136199 ?auto_136196 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136226 - OBJ
      ?auto_136227 - OBJ
      ?auto_136228 - OBJ
      ?auto_136229 - OBJ
      ?auto_136225 - LOCATION
    )
    :vars
    (
      ?auto_136230 - LOCATION
      ?auto_136232 - CITY
      ?auto_136231 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136230 ?auto_136232 ) ( IN-CITY ?auto_136225 ?auto_136232 ) ( not ( = ?auto_136225 ?auto_136230 ) ) ( OBJ-AT ?auto_136227 ?auto_136225 ) ( not ( = ?auto_136227 ?auto_136229 ) ) ( OBJ-AT ?auto_136229 ?auto_136230 ) ( TRUCK-AT ?auto_136231 ?auto_136225 ) ( OBJ-AT ?auto_136226 ?auto_136225 ) ( OBJ-AT ?auto_136228 ?auto_136225 ) ( not ( = ?auto_136226 ?auto_136227 ) ) ( not ( = ?auto_136226 ?auto_136228 ) ) ( not ( = ?auto_136226 ?auto_136229 ) ) ( not ( = ?auto_136227 ?auto_136228 ) ) ( not ( = ?auto_136228 ?auto_136229 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136227 ?auto_136229 ?auto_136225 )
      ( DELIVER-4PKG-VERIFY ?auto_136226 ?auto_136227 ?auto_136228 ?auto_136229 ?auto_136225 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136234 - OBJ
      ?auto_136235 - OBJ
      ?auto_136236 - OBJ
      ?auto_136237 - OBJ
      ?auto_136233 - LOCATION
    )
    :vars
    (
      ?auto_136238 - LOCATION
      ?auto_136240 - CITY
      ?auto_136239 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136238 ?auto_136240 ) ( IN-CITY ?auto_136233 ?auto_136240 ) ( not ( = ?auto_136233 ?auto_136238 ) ) ( OBJ-AT ?auto_136237 ?auto_136233 ) ( not ( = ?auto_136237 ?auto_136236 ) ) ( OBJ-AT ?auto_136236 ?auto_136238 ) ( TRUCK-AT ?auto_136239 ?auto_136233 ) ( OBJ-AT ?auto_136234 ?auto_136233 ) ( OBJ-AT ?auto_136235 ?auto_136233 ) ( not ( = ?auto_136234 ?auto_136235 ) ) ( not ( = ?auto_136234 ?auto_136236 ) ) ( not ( = ?auto_136234 ?auto_136237 ) ) ( not ( = ?auto_136235 ?auto_136236 ) ) ( not ( = ?auto_136235 ?auto_136237 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136237 ?auto_136236 ?auto_136233 )
      ( DELIVER-4PKG-VERIFY ?auto_136234 ?auto_136235 ?auto_136236 ?auto_136237 ?auto_136233 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136250 - OBJ
      ?auto_136251 - OBJ
      ?auto_136252 - OBJ
      ?auto_136253 - OBJ
      ?auto_136249 - LOCATION
    )
    :vars
    (
      ?auto_136254 - LOCATION
      ?auto_136256 - CITY
      ?auto_136255 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136254 ?auto_136256 ) ( IN-CITY ?auto_136249 ?auto_136256 ) ( not ( = ?auto_136249 ?auto_136254 ) ) ( OBJ-AT ?auto_136252 ?auto_136249 ) ( not ( = ?auto_136252 ?auto_136251 ) ) ( OBJ-AT ?auto_136251 ?auto_136254 ) ( TRUCK-AT ?auto_136255 ?auto_136249 ) ( OBJ-AT ?auto_136250 ?auto_136249 ) ( OBJ-AT ?auto_136253 ?auto_136249 ) ( not ( = ?auto_136250 ?auto_136251 ) ) ( not ( = ?auto_136250 ?auto_136252 ) ) ( not ( = ?auto_136250 ?auto_136253 ) ) ( not ( = ?auto_136251 ?auto_136253 ) ) ( not ( = ?auto_136252 ?auto_136253 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136252 ?auto_136251 ?auto_136249 )
      ( DELIVER-4PKG-VERIFY ?auto_136250 ?auto_136251 ?auto_136252 ?auto_136253 ?auto_136249 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136282 - OBJ
      ?auto_136283 - OBJ
      ?auto_136284 - OBJ
      ?auto_136285 - OBJ
      ?auto_136281 - LOCATION
    )
    :vars
    (
      ?auto_136286 - LOCATION
      ?auto_136288 - CITY
      ?auto_136287 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136286 ?auto_136288 ) ( IN-CITY ?auto_136281 ?auto_136288 ) ( not ( = ?auto_136281 ?auto_136286 ) ) ( OBJ-AT ?auto_136285 ?auto_136281 ) ( not ( = ?auto_136285 ?auto_136282 ) ) ( OBJ-AT ?auto_136282 ?auto_136286 ) ( TRUCK-AT ?auto_136287 ?auto_136281 ) ( OBJ-AT ?auto_136283 ?auto_136281 ) ( OBJ-AT ?auto_136284 ?auto_136281 ) ( not ( = ?auto_136282 ?auto_136283 ) ) ( not ( = ?auto_136282 ?auto_136284 ) ) ( not ( = ?auto_136283 ?auto_136284 ) ) ( not ( = ?auto_136283 ?auto_136285 ) ) ( not ( = ?auto_136284 ?auto_136285 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136285 ?auto_136282 ?auto_136281 )
      ( DELIVER-4PKG-VERIFY ?auto_136282 ?auto_136283 ?auto_136284 ?auto_136285 ?auto_136281 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136347 - OBJ
      ?auto_136346 - LOCATION
    )
    :vars
    (
      ?auto_136349 - LOCATION
      ?auto_136351 - CITY
      ?auto_136348 - OBJ
      ?auto_136350 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136349 ?auto_136351 ) ( IN-CITY ?auto_136346 ?auto_136351 ) ( not ( = ?auto_136346 ?auto_136349 ) ) ( not ( = ?auto_136348 ?auto_136347 ) ) ( OBJ-AT ?auto_136347 ?auto_136349 ) ( TRUCK-AT ?auto_136350 ?auto_136346 ) ( IN-TRUCK ?auto_136348 ?auto_136350 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136348 ?auto_136346 )
      ( DELIVER-2PKG ?auto_136348 ?auto_136347 ?auto_136346 )
      ( DELIVER-1PKG-VERIFY ?auto_136347 ?auto_136346 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136353 - OBJ
      ?auto_136354 - OBJ
      ?auto_136352 - LOCATION
    )
    :vars
    (
      ?auto_136357 - LOCATION
      ?auto_136356 - CITY
      ?auto_136355 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136357 ?auto_136356 ) ( IN-CITY ?auto_136352 ?auto_136356 ) ( not ( = ?auto_136352 ?auto_136357 ) ) ( not ( = ?auto_136353 ?auto_136354 ) ) ( OBJ-AT ?auto_136354 ?auto_136357 ) ( TRUCK-AT ?auto_136355 ?auto_136352 ) ( IN-TRUCK ?auto_136353 ?auto_136355 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136354 ?auto_136352 )
      ( DELIVER-2PKG-VERIFY ?auto_136353 ?auto_136354 ?auto_136352 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136359 - OBJ
      ?auto_136360 - OBJ
      ?auto_136358 - LOCATION
    )
    :vars
    (
      ?auto_136361 - LOCATION
      ?auto_136362 - CITY
      ?auto_136363 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136361 ?auto_136362 ) ( IN-CITY ?auto_136358 ?auto_136362 ) ( not ( = ?auto_136358 ?auto_136361 ) ) ( not ( = ?auto_136360 ?auto_136359 ) ) ( OBJ-AT ?auto_136359 ?auto_136361 ) ( TRUCK-AT ?auto_136363 ?auto_136358 ) ( IN-TRUCK ?auto_136360 ?auto_136363 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136360 ?auto_136359 ?auto_136358 )
      ( DELIVER-2PKG-VERIFY ?auto_136359 ?auto_136360 ?auto_136358 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136543 - OBJ
      ?auto_136542 - LOCATION
    )
    :vars
    (
      ?auto_136544 - LOCATION
      ?auto_136545 - CITY
      ?auto_136547 - OBJ
      ?auto_136546 - TRUCK
      ?auto_136548 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_136544 ?auto_136545 ) ( IN-CITY ?auto_136542 ?auto_136545 ) ( not ( = ?auto_136542 ?auto_136544 ) ) ( not ( = ?auto_136547 ?auto_136543 ) ) ( OBJ-AT ?auto_136543 ?auto_136544 ) ( IN-TRUCK ?auto_136547 ?auto_136546 ) ( TRUCK-AT ?auto_136546 ?auto_136548 ) ( IN-CITY ?auto_136548 ?auto_136545 ) ( not ( = ?auto_136542 ?auto_136548 ) ) ( not ( = ?auto_136544 ?auto_136548 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_136546 ?auto_136548 ?auto_136542 ?auto_136545 )
      ( DELIVER-2PKG ?auto_136547 ?auto_136543 ?auto_136542 )
      ( DELIVER-1PKG-VERIFY ?auto_136543 ?auto_136542 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136550 - OBJ
      ?auto_136551 - OBJ
      ?auto_136549 - LOCATION
    )
    :vars
    (
      ?auto_136553 - LOCATION
      ?auto_136555 - CITY
      ?auto_136554 - TRUCK
      ?auto_136552 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_136553 ?auto_136555 ) ( IN-CITY ?auto_136549 ?auto_136555 ) ( not ( = ?auto_136549 ?auto_136553 ) ) ( not ( = ?auto_136550 ?auto_136551 ) ) ( OBJ-AT ?auto_136551 ?auto_136553 ) ( IN-TRUCK ?auto_136550 ?auto_136554 ) ( TRUCK-AT ?auto_136554 ?auto_136552 ) ( IN-CITY ?auto_136552 ?auto_136555 ) ( not ( = ?auto_136549 ?auto_136552 ) ) ( not ( = ?auto_136553 ?auto_136552 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136551 ?auto_136549 )
      ( DELIVER-2PKG-VERIFY ?auto_136550 ?auto_136551 ?auto_136549 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136557 - OBJ
      ?auto_136558 - OBJ
      ?auto_136556 - LOCATION
    )
    :vars
    (
      ?auto_136562 - LOCATION
      ?auto_136560 - CITY
      ?auto_136559 - TRUCK
      ?auto_136561 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_136562 ?auto_136560 ) ( IN-CITY ?auto_136556 ?auto_136560 ) ( not ( = ?auto_136556 ?auto_136562 ) ) ( not ( = ?auto_136558 ?auto_136557 ) ) ( OBJ-AT ?auto_136557 ?auto_136562 ) ( IN-TRUCK ?auto_136558 ?auto_136559 ) ( TRUCK-AT ?auto_136559 ?auto_136561 ) ( IN-CITY ?auto_136561 ?auto_136560 ) ( not ( = ?auto_136556 ?auto_136561 ) ) ( not ( = ?auto_136562 ?auto_136561 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136558 ?auto_136557 ?auto_136556 )
      ( DELIVER-2PKG-VERIFY ?auto_136557 ?auto_136558 ?auto_136556 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136765 - OBJ
      ?auto_136764 - LOCATION
    )
    :vars
    (
      ?auto_136769 - LOCATION
      ?auto_136767 - CITY
      ?auto_136770 - OBJ
      ?auto_136766 - TRUCK
      ?auto_136768 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_136769 ?auto_136767 ) ( IN-CITY ?auto_136764 ?auto_136767 ) ( not ( = ?auto_136764 ?auto_136769 ) ) ( not ( = ?auto_136770 ?auto_136765 ) ) ( OBJ-AT ?auto_136765 ?auto_136769 ) ( TRUCK-AT ?auto_136766 ?auto_136768 ) ( IN-CITY ?auto_136768 ?auto_136767 ) ( not ( = ?auto_136764 ?auto_136768 ) ) ( not ( = ?auto_136769 ?auto_136768 ) ) ( OBJ-AT ?auto_136770 ?auto_136768 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_136770 ?auto_136766 ?auto_136768 )
      ( DELIVER-2PKG ?auto_136770 ?auto_136765 ?auto_136764 )
      ( DELIVER-1PKG-VERIFY ?auto_136765 ?auto_136764 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136772 - OBJ
      ?auto_136773 - OBJ
      ?auto_136771 - LOCATION
    )
    :vars
    (
      ?auto_136777 - LOCATION
      ?auto_136774 - CITY
      ?auto_136775 - TRUCK
      ?auto_136776 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_136777 ?auto_136774 ) ( IN-CITY ?auto_136771 ?auto_136774 ) ( not ( = ?auto_136771 ?auto_136777 ) ) ( not ( = ?auto_136772 ?auto_136773 ) ) ( OBJ-AT ?auto_136773 ?auto_136777 ) ( TRUCK-AT ?auto_136775 ?auto_136776 ) ( IN-CITY ?auto_136776 ?auto_136774 ) ( not ( = ?auto_136771 ?auto_136776 ) ) ( not ( = ?auto_136777 ?auto_136776 ) ) ( OBJ-AT ?auto_136772 ?auto_136776 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136773 ?auto_136771 )
      ( DELIVER-2PKG-VERIFY ?auto_136772 ?auto_136773 ?auto_136771 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136779 - OBJ
      ?auto_136780 - OBJ
      ?auto_136778 - LOCATION
    )
    :vars
    (
      ?auto_136781 - LOCATION
      ?auto_136784 - CITY
      ?auto_136782 - TRUCK
      ?auto_136783 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_136781 ?auto_136784 ) ( IN-CITY ?auto_136778 ?auto_136784 ) ( not ( = ?auto_136778 ?auto_136781 ) ) ( not ( = ?auto_136780 ?auto_136779 ) ) ( OBJ-AT ?auto_136779 ?auto_136781 ) ( TRUCK-AT ?auto_136782 ?auto_136783 ) ( IN-CITY ?auto_136783 ?auto_136784 ) ( not ( = ?auto_136778 ?auto_136783 ) ) ( not ( = ?auto_136781 ?auto_136783 ) ) ( OBJ-AT ?auto_136780 ?auto_136783 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136780 ?auto_136779 ?auto_136778 )
      ( DELIVER-2PKG-VERIFY ?auto_136779 ?auto_136780 ?auto_136778 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138135 - OBJ
      ?auto_138136 - OBJ
      ?auto_138137 - OBJ
      ?auto_138134 - LOCATION
    )
    :vars
    (
      ?auto_138138 - TRUCK
      ?auto_138139 - LOCATION
      ?auto_138140 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138136 ?auto_138138 ) ( TRUCK-AT ?auto_138138 ?auto_138139 ) ( IN-CITY ?auto_138139 ?auto_138140 ) ( IN-CITY ?auto_138134 ?auto_138140 ) ( not ( = ?auto_138134 ?auto_138139 ) ) ( OBJ-AT ?auto_138135 ?auto_138134 ) ( not ( = ?auto_138135 ?auto_138136 ) ) ( OBJ-AT ?auto_138137 ?auto_138134 ) ( not ( = ?auto_138135 ?auto_138137 ) ) ( not ( = ?auto_138136 ?auto_138137 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138135 ?auto_138136 ?auto_138134 )
      ( DELIVER-3PKG-VERIFY ?auto_138135 ?auto_138136 ?auto_138137 ?auto_138134 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138157 - OBJ
      ?auto_138158 - OBJ
      ?auto_138159 - OBJ
      ?auto_138156 - LOCATION
    )
    :vars
    (
      ?auto_138160 - TRUCK
      ?auto_138161 - LOCATION
      ?auto_138162 - CITY
      ?auto_138163 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138159 ?auto_138160 ) ( TRUCK-AT ?auto_138160 ?auto_138161 ) ( IN-CITY ?auto_138161 ?auto_138162 ) ( IN-CITY ?auto_138156 ?auto_138162 ) ( not ( = ?auto_138156 ?auto_138161 ) ) ( OBJ-AT ?auto_138163 ?auto_138156 ) ( not ( = ?auto_138163 ?auto_138159 ) ) ( OBJ-AT ?auto_138157 ?auto_138156 ) ( OBJ-AT ?auto_138158 ?auto_138156 ) ( not ( = ?auto_138157 ?auto_138158 ) ) ( not ( = ?auto_138157 ?auto_138159 ) ) ( not ( = ?auto_138157 ?auto_138163 ) ) ( not ( = ?auto_138158 ?auto_138159 ) ) ( not ( = ?auto_138158 ?auto_138163 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138163 ?auto_138159 ?auto_138156 )
      ( DELIVER-3PKG-VERIFY ?auto_138157 ?auto_138158 ?auto_138159 ?auto_138156 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138169 - OBJ
      ?auto_138170 - OBJ
      ?auto_138171 - OBJ
      ?auto_138168 - LOCATION
    )
    :vars
    (
      ?auto_138172 - TRUCK
      ?auto_138173 - LOCATION
      ?auto_138174 - CITY
      ?auto_138175 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138170 ?auto_138172 ) ( TRUCK-AT ?auto_138172 ?auto_138173 ) ( IN-CITY ?auto_138173 ?auto_138174 ) ( IN-CITY ?auto_138168 ?auto_138174 ) ( not ( = ?auto_138168 ?auto_138173 ) ) ( OBJ-AT ?auto_138175 ?auto_138168 ) ( not ( = ?auto_138175 ?auto_138170 ) ) ( OBJ-AT ?auto_138169 ?auto_138168 ) ( OBJ-AT ?auto_138171 ?auto_138168 ) ( not ( = ?auto_138169 ?auto_138170 ) ) ( not ( = ?auto_138169 ?auto_138171 ) ) ( not ( = ?auto_138169 ?auto_138175 ) ) ( not ( = ?auto_138170 ?auto_138171 ) ) ( not ( = ?auto_138171 ?auto_138175 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138175 ?auto_138170 ?auto_138168 )
      ( DELIVER-3PKG-VERIFY ?auto_138169 ?auto_138170 ?auto_138171 ?auto_138168 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138207 - OBJ
      ?auto_138208 - OBJ
      ?auto_138209 - OBJ
      ?auto_138206 - LOCATION
    )
    :vars
    (
      ?auto_138210 - TRUCK
      ?auto_138211 - LOCATION
      ?auto_138212 - CITY
      ?auto_138213 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138207 ?auto_138210 ) ( TRUCK-AT ?auto_138210 ?auto_138211 ) ( IN-CITY ?auto_138211 ?auto_138212 ) ( IN-CITY ?auto_138206 ?auto_138212 ) ( not ( = ?auto_138206 ?auto_138211 ) ) ( OBJ-AT ?auto_138213 ?auto_138206 ) ( not ( = ?auto_138213 ?auto_138207 ) ) ( OBJ-AT ?auto_138208 ?auto_138206 ) ( OBJ-AT ?auto_138209 ?auto_138206 ) ( not ( = ?auto_138207 ?auto_138208 ) ) ( not ( = ?auto_138207 ?auto_138209 ) ) ( not ( = ?auto_138208 ?auto_138209 ) ) ( not ( = ?auto_138208 ?auto_138213 ) ) ( not ( = ?auto_138209 ?auto_138213 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138213 ?auto_138207 ?auto_138206 )
      ( DELIVER-3PKG-VERIFY ?auto_138207 ?auto_138208 ?auto_138209 ?auto_138206 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138262 - OBJ
      ?auto_138263 - OBJ
      ?auto_138264 - OBJ
      ?auto_138265 - OBJ
      ?auto_138261 - LOCATION
    )
    :vars
    (
      ?auto_138266 - TRUCK
      ?auto_138267 - LOCATION
      ?auto_138268 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138264 ?auto_138266 ) ( TRUCK-AT ?auto_138266 ?auto_138267 ) ( IN-CITY ?auto_138267 ?auto_138268 ) ( IN-CITY ?auto_138261 ?auto_138268 ) ( not ( = ?auto_138261 ?auto_138267 ) ) ( OBJ-AT ?auto_138265 ?auto_138261 ) ( not ( = ?auto_138265 ?auto_138264 ) ) ( OBJ-AT ?auto_138262 ?auto_138261 ) ( OBJ-AT ?auto_138263 ?auto_138261 ) ( not ( = ?auto_138262 ?auto_138263 ) ) ( not ( = ?auto_138262 ?auto_138264 ) ) ( not ( = ?auto_138262 ?auto_138265 ) ) ( not ( = ?auto_138263 ?auto_138264 ) ) ( not ( = ?auto_138263 ?auto_138265 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138265 ?auto_138264 ?auto_138261 )
      ( DELIVER-4PKG-VERIFY ?auto_138262 ?auto_138263 ?auto_138264 ?auto_138265 ?auto_138261 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138270 - OBJ
      ?auto_138271 - OBJ
      ?auto_138272 - OBJ
      ?auto_138273 - OBJ
      ?auto_138269 - LOCATION
    )
    :vars
    (
      ?auto_138274 - TRUCK
      ?auto_138275 - LOCATION
      ?auto_138276 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138272 ?auto_138274 ) ( TRUCK-AT ?auto_138274 ?auto_138275 ) ( IN-CITY ?auto_138275 ?auto_138276 ) ( IN-CITY ?auto_138269 ?auto_138276 ) ( not ( = ?auto_138269 ?auto_138275 ) ) ( OBJ-AT ?auto_138270 ?auto_138269 ) ( not ( = ?auto_138270 ?auto_138272 ) ) ( OBJ-AT ?auto_138271 ?auto_138269 ) ( OBJ-AT ?auto_138273 ?auto_138269 ) ( not ( = ?auto_138270 ?auto_138271 ) ) ( not ( = ?auto_138270 ?auto_138273 ) ) ( not ( = ?auto_138271 ?auto_138272 ) ) ( not ( = ?auto_138271 ?auto_138273 ) ) ( not ( = ?auto_138272 ?auto_138273 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138270 ?auto_138272 ?auto_138269 )
      ( DELIVER-4PKG-VERIFY ?auto_138270 ?auto_138271 ?auto_138272 ?auto_138273 ?auto_138269 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138286 - OBJ
      ?auto_138287 - OBJ
      ?auto_138288 - OBJ
      ?auto_138289 - OBJ
      ?auto_138285 - LOCATION
    )
    :vars
    (
      ?auto_138290 - TRUCK
      ?auto_138291 - LOCATION
      ?auto_138292 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138289 ?auto_138290 ) ( TRUCK-AT ?auto_138290 ?auto_138291 ) ( IN-CITY ?auto_138291 ?auto_138292 ) ( IN-CITY ?auto_138285 ?auto_138292 ) ( not ( = ?auto_138285 ?auto_138291 ) ) ( OBJ-AT ?auto_138288 ?auto_138285 ) ( not ( = ?auto_138288 ?auto_138289 ) ) ( OBJ-AT ?auto_138286 ?auto_138285 ) ( OBJ-AT ?auto_138287 ?auto_138285 ) ( not ( = ?auto_138286 ?auto_138287 ) ) ( not ( = ?auto_138286 ?auto_138288 ) ) ( not ( = ?auto_138286 ?auto_138289 ) ) ( not ( = ?auto_138287 ?auto_138288 ) ) ( not ( = ?auto_138287 ?auto_138289 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138288 ?auto_138289 ?auto_138285 )
      ( DELIVER-4PKG-VERIFY ?auto_138286 ?auto_138287 ?auto_138288 ?auto_138289 ?auto_138285 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138294 - OBJ
      ?auto_138295 - OBJ
      ?auto_138296 - OBJ
      ?auto_138297 - OBJ
      ?auto_138293 - LOCATION
    )
    :vars
    (
      ?auto_138298 - TRUCK
      ?auto_138299 - LOCATION
      ?auto_138300 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138297 ?auto_138298 ) ( TRUCK-AT ?auto_138298 ?auto_138299 ) ( IN-CITY ?auto_138299 ?auto_138300 ) ( IN-CITY ?auto_138293 ?auto_138300 ) ( not ( = ?auto_138293 ?auto_138299 ) ) ( OBJ-AT ?auto_138294 ?auto_138293 ) ( not ( = ?auto_138294 ?auto_138297 ) ) ( OBJ-AT ?auto_138295 ?auto_138293 ) ( OBJ-AT ?auto_138296 ?auto_138293 ) ( not ( = ?auto_138294 ?auto_138295 ) ) ( not ( = ?auto_138294 ?auto_138296 ) ) ( not ( = ?auto_138295 ?auto_138296 ) ) ( not ( = ?auto_138295 ?auto_138297 ) ) ( not ( = ?auto_138296 ?auto_138297 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138294 ?auto_138297 ?auto_138293 )
      ( DELIVER-4PKG-VERIFY ?auto_138294 ?auto_138295 ?auto_138296 ?auto_138297 ?auto_138293 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138326 - OBJ
      ?auto_138327 - OBJ
      ?auto_138328 - OBJ
      ?auto_138329 - OBJ
      ?auto_138325 - LOCATION
    )
    :vars
    (
      ?auto_138330 - TRUCK
      ?auto_138331 - LOCATION
      ?auto_138332 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138327 ?auto_138330 ) ( TRUCK-AT ?auto_138330 ?auto_138331 ) ( IN-CITY ?auto_138331 ?auto_138332 ) ( IN-CITY ?auto_138325 ?auto_138332 ) ( not ( = ?auto_138325 ?auto_138331 ) ) ( OBJ-AT ?auto_138326 ?auto_138325 ) ( not ( = ?auto_138326 ?auto_138327 ) ) ( OBJ-AT ?auto_138328 ?auto_138325 ) ( OBJ-AT ?auto_138329 ?auto_138325 ) ( not ( = ?auto_138326 ?auto_138328 ) ) ( not ( = ?auto_138326 ?auto_138329 ) ) ( not ( = ?auto_138327 ?auto_138328 ) ) ( not ( = ?auto_138327 ?auto_138329 ) ) ( not ( = ?auto_138328 ?auto_138329 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138326 ?auto_138327 ?auto_138325 )
      ( DELIVER-4PKG-VERIFY ?auto_138326 ?auto_138327 ?auto_138328 ?auto_138329 ?auto_138325 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138350 - OBJ
      ?auto_138351 - OBJ
      ?auto_138352 - OBJ
      ?auto_138353 - OBJ
      ?auto_138349 - LOCATION
    )
    :vars
    (
      ?auto_138354 - TRUCK
      ?auto_138355 - LOCATION
      ?auto_138356 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138351 ?auto_138354 ) ( TRUCK-AT ?auto_138354 ?auto_138355 ) ( IN-CITY ?auto_138355 ?auto_138356 ) ( IN-CITY ?auto_138349 ?auto_138356 ) ( not ( = ?auto_138349 ?auto_138355 ) ) ( OBJ-AT ?auto_138353 ?auto_138349 ) ( not ( = ?auto_138353 ?auto_138351 ) ) ( OBJ-AT ?auto_138350 ?auto_138349 ) ( OBJ-AT ?auto_138352 ?auto_138349 ) ( not ( = ?auto_138350 ?auto_138351 ) ) ( not ( = ?auto_138350 ?auto_138352 ) ) ( not ( = ?auto_138350 ?auto_138353 ) ) ( not ( = ?auto_138351 ?auto_138352 ) ) ( not ( = ?auto_138352 ?auto_138353 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138353 ?auto_138351 ?auto_138349 )
      ( DELIVER-4PKG-VERIFY ?auto_138350 ?auto_138351 ?auto_138352 ?auto_138353 ?auto_138349 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138446 - OBJ
      ?auto_138447 - OBJ
      ?auto_138448 - OBJ
      ?auto_138449 - OBJ
      ?auto_138445 - LOCATION
    )
    :vars
    (
      ?auto_138450 - TRUCK
      ?auto_138451 - LOCATION
      ?auto_138452 - CITY
      ?auto_138453 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138449 ?auto_138450 ) ( TRUCK-AT ?auto_138450 ?auto_138451 ) ( IN-CITY ?auto_138451 ?auto_138452 ) ( IN-CITY ?auto_138445 ?auto_138452 ) ( not ( = ?auto_138445 ?auto_138451 ) ) ( OBJ-AT ?auto_138453 ?auto_138445 ) ( not ( = ?auto_138453 ?auto_138449 ) ) ( OBJ-AT ?auto_138446 ?auto_138445 ) ( OBJ-AT ?auto_138447 ?auto_138445 ) ( OBJ-AT ?auto_138448 ?auto_138445 ) ( not ( = ?auto_138446 ?auto_138447 ) ) ( not ( = ?auto_138446 ?auto_138448 ) ) ( not ( = ?auto_138446 ?auto_138449 ) ) ( not ( = ?auto_138446 ?auto_138453 ) ) ( not ( = ?auto_138447 ?auto_138448 ) ) ( not ( = ?auto_138447 ?auto_138449 ) ) ( not ( = ?auto_138447 ?auto_138453 ) ) ( not ( = ?auto_138448 ?auto_138449 ) ) ( not ( = ?auto_138448 ?auto_138453 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138453 ?auto_138449 ?auto_138445 )
      ( DELIVER-4PKG-VERIFY ?auto_138446 ?auto_138447 ?auto_138448 ?auto_138449 ?auto_138445 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138463 - OBJ
      ?auto_138464 - OBJ
      ?auto_138465 - OBJ
      ?auto_138466 - OBJ
      ?auto_138462 - LOCATION
    )
    :vars
    (
      ?auto_138467 - TRUCK
      ?auto_138468 - LOCATION
      ?auto_138469 - CITY
      ?auto_138470 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138465 ?auto_138467 ) ( TRUCK-AT ?auto_138467 ?auto_138468 ) ( IN-CITY ?auto_138468 ?auto_138469 ) ( IN-CITY ?auto_138462 ?auto_138469 ) ( not ( = ?auto_138462 ?auto_138468 ) ) ( OBJ-AT ?auto_138470 ?auto_138462 ) ( not ( = ?auto_138470 ?auto_138465 ) ) ( OBJ-AT ?auto_138463 ?auto_138462 ) ( OBJ-AT ?auto_138464 ?auto_138462 ) ( OBJ-AT ?auto_138466 ?auto_138462 ) ( not ( = ?auto_138463 ?auto_138464 ) ) ( not ( = ?auto_138463 ?auto_138465 ) ) ( not ( = ?auto_138463 ?auto_138466 ) ) ( not ( = ?auto_138463 ?auto_138470 ) ) ( not ( = ?auto_138464 ?auto_138465 ) ) ( not ( = ?auto_138464 ?auto_138466 ) ) ( not ( = ?auto_138464 ?auto_138470 ) ) ( not ( = ?auto_138465 ?auto_138466 ) ) ( not ( = ?auto_138466 ?auto_138470 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138470 ?auto_138465 ?auto_138462 )
      ( DELIVER-4PKG-VERIFY ?auto_138463 ?auto_138464 ?auto_138465 ?auto_138466 ?auto_138462 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138513 - OBJ
      ?auto_138514 - OBJ
      ?auto_138515 - OBJ
      ?auto_138516 - OBJ
      ?auto_138512 - LOCATION
    )
    :vars
    (
      ?auto_138517 - TRUCK
      ?auto_138518 - LOCATION
      ?auto_138519 - CITY
      ?auto_138520 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138514 ?auto_138517 ) ( TRUCK-AT ?auto_138517 ?auto_138518 ) ( IN-CITY ?auto_138518 ?auto_138519 ) ( IN-CITY ?auto_138512 ?auto_138519 ) ( not ( = ?auto_138512 ?auto_138518 ) ) ( OBJ-AT ?auto_138520 ?auto_138512 ) ( not ( = ?auto_138520 ?auto_138514 ) ) ( OBJ-AT ?auto_138513 ?auto_138512 ) ( OBJ-AT ?auto_138515 ?auto_138512 ) ( OBJ-AT ?auto_138516 ?auto_138512 ) ( not ( = ?auto_138513 ?auto_138514 ) ) ( not ( = ?auto_138513 ?auto_138515 ) ) ( not ( = ?auto_138513 ?auto_138516 ) ) ( not ( = ?auto_138513 ?auto_138520 ) ) ( not ( = ?auto_138514 ?auto_138515 ) ) ( not ( = ?auto_138514 ?auto_138516 ) ) ( not ( = ?auto_138515 ?auto_138516 ) ) ( not ( = ?auto_138515 ?auto_138520 ) ) ( not ( = ?auto_138516 ?auto_138520 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138520 ?auto_138514 ?auto_138512 )
      ( DELIVER-4PKG-VERIFY ?auto_138513 ?auto_138514 ?auto_138515 ?auto_138516 ?auto_138512 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138557 - OBJ
      ?auto_138558 - OBJ
      ?auto_138559 - OBJ
      ?auto_138560 - OBJ
      ?auto_138556 - LOCATION
    )
    :vars
    (
      ?auto_138561 - TRUCK
      ?auto_138562 - LOCATION
      ?auto_138563 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138557 ?auto_138561 ) ( TRUCK-AT ?auto_138561 ?auto_138562 ) ( IN-CITY ?auto_138562 ?auto_138563 ) ( IN-CITY ?auto_138556 ?auto_138563 ) ( not ( = ?auto_138556 ?auto_138562 ) ) ( OBJ-AT ?auto_138559 ?auto_138556 ) ( not ( = ?auto_138559 ?auto_138557 ) ) ( OBJ-AT ?auto_138558 ?auto_138556 ) ( OBJ-AT ?auto_138560 ?auto_138556 ) ( not ( = ?auto_138557 ?auto_138558 ) ) ( not ( = ?auto_138557 ?auto_138560 ) ) ( not ( = ?auto_138558 ?auto_138559 ) ) ( not ( = ?auto_138558 ?auto_138560 ) ) ( not ( = ?auto_138559 ?auto_138560 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138559 ?auto_138557 ?auto_138556 )
      ( DELIVER-4PKG-VERIFY ?auto_138557 ?auto_138558 ?auto_138559 ?auto_138560 ?auto_138556 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138581 - OBJ
      ?auto_138582 - OBJ
      ?auto_138583 - OBJ
      ?auto_138584 - OBJ
      ?auto_138580 - LOCATION
    )
    :vars
    (
      ?auto_138585 - TRUCK
      ?auto_138586 - LOCATION
      ?auto_138587 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138581 ?auto_138585 ) ( TRUCK-AT ?auto_138585 ?auto_138586 ) ( IN-CITY ?auto_138586 ?auto_138587 ) ( IN-CITY ?auto_138580 ?auto_138587 ) ( not ( = ?auto_138580 ?auto_138586 ) ) ( OBJ-AT ?auto_138584 ?auto_138580 ) ( not ( = ?auto_138584 ?auto_138581 ) ) ( OBJ-AT ?auto_138582 ?auto_138580 ) ( OBJ-AT ?auto_138583 ?auto_138580 ) ( not ( = ?auto_138581 ?auto_138582 ) ) ( not ( = ?auto_138581 ?auto_138583 ) ) ( not ( = ?auto_138582 ?auto_138583 ) ) ( not ( = ?auto_138582 ?auto_138584 ) ) ( not ( = ?auto_138583 ?auto_138584 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138584 ?auto_138581 ?auto_138580 )
      ( DELIVER-4PKG-VERIFY ?auto_138581 ?auto_138582 ?auto_138583 ?auto_138584 ?auto_138580 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138661 - OBJ
      ?auto_138662 - OBJ
      ?auto_138663 - OBJ
      ?auto_138664 - OBJ
      ?auto_138660 - LOCATION
    )
    :vars
    (
      ?auto_138665 - TRUCK
      ?auto_138666 - LOCATION
      ?auto_138667 - CITY
      ?auto_138668 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138661 ?auto_138665 ) ( TRUCK-AT ?auto_138665 ?auto_138666 ) ( IN-CITY ?auto_138666 ?auto_138667 ) ( IN-CITY ?auto_138660 ?auto_138667 ) ( not ( = ?auto_138660 ?auto_138666 ) ) ( OBJ-AT ?auto_138668 ?auto_138660 ) ( not ( = ?auto_138668 ?auto_138661 ) ) ( OBJ-AT ?auto_138662 ?auto_138660 ) ( OBJ-AT ?auto_138663 ?auto_138660 ) ( OBJ-AT ?auto_138664 ?auto_138660 ) ( not ( = ?auto_138661 ?auto_138662 ) ) ( not ( = ?auto_138661 ?auto_138663 ) ) ( not ( = ?auto_138661 ?auto_138664 ) ) ( not ( = ?auto_138662 ?auto_138663 ) ) ( not ( = ?auto_138662 ?auto_138664 ) ) ( not ( = ?auto_138662 ?auto_138668 ) ) ( not ( = ?auto_138663 ?auto_138664 ) ) ( not ( = ?auto_138663 ?auto_138668 ) ) ( not ( = ?auto_138664 ?auto_138668 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138668 ?auto_138661 ?auto_138660 )
      ( DELIVER-4PKG-VERIFY ?auto_138661 ?auto_138662 ?auto_138663 ?auto_138664 ?auto_138660 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138845 - OBJ
      ?auto_138846 - OBJ
      ?auto_138847 - OBJ
      ?auto_138844 - LOCATION
    )
    :vars
    (
      ?auto_138850 - TRUCK
      ?auto_138851 - LOCATION
      ?auto_138848 - CITY
      ?auto_138849 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138850 ?auto_138851 ) ( IN-CITY ?auto_138851 ?auto_138848 ) ( IN-CITY ?auto_138844 ?auto_138848 ) ( not ( = ?auto_138844 ?auto_138851 ) ) ( OBJ-AT ?auto_138849 ?auto_138844 ) ( not ( = ?auto_138849 ?auto_138847 ) ) ( OBJ-AT ?auto_138847 ?auto_138851 ) ( OBJ-AT ?auto_138845 ?auto_138844 ) ( OBJ-AT ?auto_138846 ?auto_138844 ) ( not ( = ?auto_138845 ?auto_138846 ) ) ( not ( = ?auto_138845 ?auto_138847 ) ) ( not ( = ?auto_138845 ?auto_138849 ) ) ( not ( = ?auto_138846 ?auto_138847 ) ) ( not ( = ?auto_138846 ?auto_138849 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138849 ?auto_138847 ?auto_138844 )
      ( DELIVER-3PKG-VERIFY ?auto_138845 ?auto_138846 ?auto_138847 ?auto_138844 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138857 - OBJ
      ?auto_138858 - OBJ
      ?auto_138859 - OBJ
      ?auto_138856 - LOCATION
    )
    :vars
    (
      ?auto_138862 - TRUCK
      ?auto_138863 - LOCATION
      ?auto_138860 - CITY
      ?auto_138861 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138862 ?auto_138863 ) ( IN-CITY ?auto_138863 ?auto_138860 ) ( IN-CITY ?auto_138856 ?auto_138860 ) ( not ( = ?auto_138856 ?auto_138863 ) ) ( OBJ-AT ?auto_138861 ?auto_138856 ) ( not ( = ?auto_138861 ?auto_138858 ) ) ( OBJ-AT ?auto_138858 ?auto_138863 ) ( OBJ-AT ?auto_138857 ?auto_138856 ) ( OBJ-AT ?auto_138859 ?auto_138856 ) ( not ( = ?auto_138857 ?auto_138858 ) ) ( not ( = ?auto_138857 ?auto_138859 ) ) ( not ( = ?auto_138857 ?auto_138861 ) ) ( not ( = ?auto_138858 ?auto_138859 ) ) ( not ( = ?auto_138859 ?auto_138861 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138861 ?auto_138858 ?auto_138856 )
      ( DELIVER-3PKG-VERIFY ?auto_138857 ?auto_138858 ?auto_138859 ?auto_138856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138895 - OBJ
      ?auto_138896 - OBJ
      ?auto_138897 - OBJ
      ?auto_138894 - LOCATION
    )
    :vars
    (
      ?auto_138900 - TRUCK
      ?auto_138901 - LOCATION
      ?auto_138898 - CITY
      ?auto_138899 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138900 ?auto_138901 ) ( IN-CITY ?auto_138901 ?auto_138898 ) ( IN-CITY ?auto_138894 ?auto_138898 ) ( not ( = ?auto_138894 ?auto_138901 ) ) ( OBJ-AT ?auto_138899 ?auto_138894 ) ( not ( = ?auto_138899 ?auto_138895 ) ) ( OBJ-AT ?auto_138895 ?auto_138901 ) ( OBJ-AT ?auto_138896 ?auto_138894 ) ( OBJ-AT ?auto_138897 ?auto_138894 ) ( not ( = ?auto_138895 ?auto_138896 ) ) ( not ( = ?auto_138895 ?auto_138897 ) ) ( not ( = ?auto_138896 ?auto_138897 ) ) ( not ( = ?auto_138896 ?auto_138899 ) ) ( not ( = ?auto_138897 ?auto_138899 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138899 ?auto_138895 ?auto_138894 )
      ( DELIVER-3PKG-VERIFY ?auto_138895 ?auto_138896 ?auto_138897 ?auto_138894 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138942 - OBJ
      ?auto_138943 - OBJ
      ?auto_138944 - OBJ
      ?auto_138945 - OBJ
      ?auto_138941 - LOCATION
    )
    :vars
    (
      ?auto_138947 - TRUCK
      ?auto_138948 - LOCATION
      ?auto_138946 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138947 ?auto_138948 ) ( IN-CITY ?auto_138948 ?auto_138946 ) ( IN-CITY ?auto_138941 ?auto_138946 ) ( not ( = ?auto_138941 ?auto_138948 ) ) ( OBJ-AT ?auto_138942 ?auto_138941 ) ( not ( = ?auto_138942 ?auto_138945 ) ) ( OBJ-AT ?auto_138945 ?auto_138948 ) ( OBJ-AT ?auto_138943 ?auto_138941 ) ( OBJ-AT ?auto_138944 ?auto_138941 ) ( not ( = ?auto_138942 ?auto_138943 ) ) ( not ( = ?auto_138942 ?auto_138944 ) ) ( not ( = ?auto_138943 ?auto_138944 ) ) ( not ( = ?auto_138943 ?auto_138945 ) ) ( not ( = ?auto_138944 ?auto_138945 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138942 ?auto_138945 ?auto_138941 )
      ( DELIVER-4PKG-VERIFY ?auto_138942 ?auto_138943 ?auto_138944 ?auto_138945 ?auto_138941 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138950 - OBJ
      ?auto_138951 - OBJ
      ?auto_138952 - OBJ
      ?auto_138953 - OBJ
      ?auto_138949 - LOCATION
    )
    :vars
    (
      ?auto_138955 - TRUCK
      ?auto_138956 - LOCATION
      ?auto_138954 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138955 ?auto_138956 ) ( IN-CITY ?auto_138956 ?auto_138954 ) ( IN-CITY ?auto_138949 ?auto_138954 ) ( not ( = ?auto_138949 ?auto_138956 ) ) ( OBJ-AT ?auto_138953 ?auto_138949 ) ( not ( = ?auto_138953 ?auto_138952 ) ) ( OBJ-AT ?auto_138952 ?auto_138956 ) ( OBJ-AT ?auto_138950 ?auto_138949 ) ( OBJ-AT ?auto_138951 ?auto_138949 ) ( not ( = ?auto_138950 ?auto_138951 ) ) ( not ( = ?auto_138950 ?auto_138952 ) ) ( not ( = ?auto_138950 ?auto_138953 ) ) ( not ( = ?auto_138951 ?auto_138952 ) ) ( not ( = ?auto_138951 ?auto_138953 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138953 ?auto_138952 ?auto_138949 )
      ( DELIVER-4PKG-VERIFY ?auto_138950 ?auto_138951 ?auto_138952 ?auto_138953 ?auto_138949 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138974 - OBJ
      ?auto_138975 - OBJ
      ?auto_138976 - OBJ
      ?auto_138977 - OBJ
      ?auto_138973 - LOCATION
    )
    :vars
    (
      ?auto_138979 - TRUCK
      ?auto_138980 - LOCATION
      ?auto_138978 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138979 ?auto_138980 ) ( IN-CITY ?auto_138980 ?auto_138978 ) ( IN-CITY ?auto_138973 ?auto_138978 ) ( not ( = ?auto_138973 ?auto_138980 ) ) ( OBJ-AT ?auto_138976 ?auto_138973 ) ( not ( = ?auto_138976 ?auto_138977 ) ) ( OBJ-AT ?auto_138977 ?auto_138980 ) ( OBJ-AT ?auto_138974 ?auto_138973 ) ( OBJ-AT ?auto_138975 ?auto_138973 ) ( not ( = ?auto_138974 ?auto_138975 ) ) ( not ( = ?auto_138974 ?auto_138976 ) ) ( not ( = ?auto_138974 ?auto_138977 ) ) ( not ( = ?auto_138975 ?auto_138976 ) ) ( not ( = ?auto_138975 ?auto_138977 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138976 ?auto_138977 ?auto_138973 )
      ( DELIVER-4PKG-VERIFY ?auto_138974 ?auto_138975 ?auto_138976 ?auto_138977 ?auto_138973 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139014 - OBJ
      ?auto_139015 - OBJ
      ?auto_139016 - OBJ
      ?auto_139017 - OBJ
      ?auto_139013 - LOCATION
    )
    :vars
    (
      ?auto_139019 - TRUCK
      ?auto_139020 - LOCATION
      ?auto_139018 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139019 ?auto_139020 ) ( IN-CITY ?auto_139020 ?auto_139018 ) ( IN-CITY ?auto_139013 ?auto_139018 ) ( not ( = ?auto_139013 ?auto_139020 ) ) ( OBJ-AT ?auto_139017 ?auto_139013 ) ( not ( = ?auto_139017 ?auto_139015 ) ) ( OBJ-AT ?auto_139015 ?auto_139020 ) ( OBJ-AT ?auto_139014 ?auto_139013 ) ( OBJ-AT ?auto_139016 ?auto_139013 ) ( not ( = ?auto_139014 ?auto_139015 ) ) ( not ( = ?auto_139014 ?auto_139016 ) ) ( not ( = ?auto_139014 ?auto_139017 ) ) ( not ( = ?auto_139015 ?auto_139016 ) ) ( not ( = ?auto_139016 ?auto_139017 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139017 ?auto_139015 ?auto_139013 )
      ( DELIVER-4PKG-VERIFY ?auto_139014 ?auto_139015 ?auto_139016 ?auto_139017 ?auto_139013 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139102 - OBJ
      ?auto_139103 - OBJ
      ?auto_139104 - OBJ
      ?auto_139105 - OBJ
      ?auto_139101 - LOCATION
    )
    :vars
    (
      ?auto_139107 - TRUCK
      ?auto_139108 - LOCATION
      ?auto_139106 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139107 ?auto_139108 ) ( IN-CITY ?auto_139108 ?auto_139106 ) ( IN-CITY ?auto_139101 ?auto_139106 ) ( not ( = ?auto_139101 ?auto_139108 ) ) ( OBJ-AT ?auto_139103 ?auto_139101 ) ( not ( = ?auto_139103 ?auto_139104 ) ) ( OBJ-AT ?auto_139104 ?auto_139108 ) ( OBJ-AT ?auto_139102 ?auto_139101 ) ( OBJ-AT ?auto_139105 ?auto_139101 ) ( not ( = ?auto_139102 ?auto_139103 ) ) ( not ( = ?auto_139102 ?auto_139104 ) ) ( not ( = ?auto_139102 ?auto_139105 ) ) ( not ( = ?auto_139103 ?auto_139105 ) ) ( not ( = ?auto_139104 ?auto_139105 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139103 ?auto_139104 ?auto_139101 )
      ( DELIVER-4PKG-VERIFY ?auto_139102 ?auto_139103 ?auto_139104 ?auto_139105 ?auto_139101 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139134 - OBJ
      ?auto_139135 - OBJ
      ?auto_139136 - OBJ
      ?auto_139137 - OBJ
      ?auto_139133 - LOCATION
    )
    :vars
    (
      ?auto_139140 - TRUCK
      ?auto_139141 - LOCATION
      ?auto_139138 - CITY
      ?auto_139139 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139140 ?auto_139141 ) ( IN-CITY ?auto_139141 ?auto_139138 ) ( IN-CITY ?auto_139133 ?auto_139138 ) ( not ( = ?auto_139133 ?auto_139141 ) ) ( OBJ-AT ?auto_139139 ?auto_139133 ) ( not ( = ?auto_139139 ?auto_139137 ) ) ( OBJ-AT ?auto_139137 ?auto_139141 ) ( OBJ-AT ?auto_139134 ?auto_139133 ) ( OBJ-AT ?auto_139135 ?auto_139133 ) ( OBJ-AT ?auto_139136 ?auto_139133 ) ( not ( = ?auto_139134 ?auto_139135 ) ) ( not ( = ?auto_139134 ?auto_139136 ) ) ( not ( = ?auto_139134 ?auto_139137 ) ) ( not ( = ?auto_139134 ?auto_139139 ) ) ( not ( = ?auto_139135 ?auto_139136 ) ) ( not ( = ?auto_139135 ?auto_139137 ) ) ( not ( = ?auto_139135 ?auto_139139 ) ) ( not ( = ?auto_139136 ?auto_139137 ) ) ( not ( = ?auto_139136 ?auto_139139 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139139 ?auto_139137 ?auto_139133 )
      ( DELIVER-4PKG-VERIFY ?auto_139134 ?auto_139135 ?auto_139136 ?auto_139137 ?auto_139133 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139151 - OBJ
      ?auto_139152 - OBJ
      ?auto_139153 - OBJ
      ?auto_139154 - OBJ
      ?auto_139150 - LOCATION
    )
    :vars
    (
      ?auto_139157 - TRUCK
      ?auto_139158 - LOCATION
      ?auto_139155 - CITY
      ?auto_139156 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139157 ?auto_139158 ) ( IN-CITY ?auto_139158 ?auto_139155 ) ( IN-CITY ?auto_139150 ?auto_139155 ) ( not ( = ?auto_139150 ?auto_139158 ) ) ( OBJ-AT ?auto_139156 ?auto_139150 ) ( not ( = ?auto_139156 ?auto_139153 ) ) ( OBJ-AT ?auto_139153 ?auto_139158 ) ( OBJ-AT ?auto_139151 ?auto_139150 ) ( OBJ-AT ?auto_139152 ?auto_139150 ) ( OBJ-AT ?auto_139154 ?auto_139150 ) ( not ( = ?auto_139151 ?auto_139152 ) ) ( not ( = ?auto_139151 ?auto_139153 ) ) ( not ( = ?auto_139151 ?auto_139154 ) ) ( not ( = ?auto_139151 ?auto_139156 ) ) ( not ( = ?auto_139152 ?auto_139153 ) ) ( not ( = ?auto_139152 ?auto_139154 ) ) ( not ( = ?auto_139152 ?auto_139156 ) ) ( not ( = ?auto_139153 ?auto_139154 ) ) ( not ( = ?auto_139154 ?auto_139156 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139156 ?auto_139153 ?auto_139150 )
      ( DELIVER-4PKG-VERIFY ?auto_139151 ?auto_139152 ?auto_139153 ?auto_139154 ?auto_139150 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139169 - OBJ
      ?auto_139170 - OBJ
      ?auto_139171 - OBJ
      ?auto_139172 - OBJ
      ?auto_139168 - LOCATION
    )
    :vars
    (
      ?auto_139174 - TRUCK
      ?auto_139175 - LOCATION
      ?auto_139173 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139174 ?auto_139175 ) ( IN-CITY ?auto_139175 ?auto_139173 ) ( IN-CITY ?auto_139168 ?auto_139173 ) ( not ( = ?auto_139168 ?auto_139175 ) ) ( OBJ-AT ?auto_139171 ?auto_139168 ) ( not ( = ?auto_139171 ?auto_139170 ) ) ( OBJ-AT ?auto_139170 ?auto_139175 ) ( OBJ-AT ?auto_139169 ?auto_139168 ) ( OBJ-AT ?auto_139172 ?auto_139168 ) ( not ( = ?auto_139169 ?auto_139170 ) ) ( not ( = ?auto_139169 ?auto_139171 ) ) ( not ( = ?auto_139169 ?auto_139172 ) ) ( not ( = ?auto_139170 ?auto_139172 ) ) ( not ( = ?auto_139171 ?auto_139172 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139171 ?auto_139170 ?auto_139168 )
      ( DELIVER-4PKG-VERIFY ?auto_139169 ?auto_139170 ?auto_139171 ?auto_139172 ?auto_139168 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139201 - OBJ
      ?auto_139202 - OBJ
      ?auto_139203 - OBJ
      ?auto_139204 - OBJ
      ?auto_139200 - LOCATION
    )
    :vars
    (
      ?auto_139207 - TRUCK
      ?auto_139208 - LOCATION
      ?auto_139205 - CITY
      ?auto_139206 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139207 ?auto_139208 ) ( IN-CITY ?auto_139208 ?auto_139205 ) ( IN-CITY ?auto_139200 ?auto_139205 ) ( not ( = ?auto_139200 ?auto_139208 ) ) ( OBJ-AT ?auto_139206 ?auto_139200 ) ( not ( = ?auto_139206 ?auto_139202 ) ) ( OBJ-AT ?auto_139202 ?auto_139208 ) ( OBJ-AT ?auto_139201 ?auto_139200 ) ( OBJ-AT ?auto_139203 ?auto_139200 ) ( OBJ-AT ?auto_139204 ?auto_139200 ) ( not ( = ?auto_139201 ?auto_139202 ) ) ( not ( = ?auto_139201 ?auto_139203 ) ) ( not ( = ?auto_139201 ?auto_139204 ) ) ( not ( = ?auto_139201 ?auto_139206 ) ) ( not ( = ?auto_139202 ?auto_139203 ) ) ( not ( = ?auto_139202 ?auto_139204 ) ) ( not ( = ?auto_139203 ?auto_139204 ) ) ( not ( = ?auto_139203 ?auto_139206 ) ) ( not ( = ?auto_139204 ?auto_139206 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139206 ?auto_139202 ?auto_139200 )
      ( DELIVER-4PKG-VERIFY ?auto_139201 ?auto_139202 ?auto_139203 ?auto_139204 ?auto_139200 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139245 - OBJ
      ?auto_139246 - OBJ
      ?auto_139247 - OBJ
      ?auto_139248 - OBJ
      ?auto_139244 - LOCATION
    )
    :vars
    (
      ?auto_139250 - TRUCK
      ?auto_139251 - LOCATION
      ?auto_139249 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139250 ?auto_139251 ) ( IN-CITY ?auto_139251 ?auto_139249 ) ( IN-CITY ?auto_139244 ?auto_139249 ) ( not ( = ?auto_139244 ?auto_139251 ) ) ( OBJ-AT ?auto_139247 ?auto_139244 ) ( not ( = ?auto_139247 ?auto_139245 ) ) ( OBJ-AT ?auto_139245 ?auto_139251 ) ( OBJ-AT ?auto_139246 ?auto_139244 ) ( OBJ-AT ?auto_139248 ?auto_139244 ) ( not ( = ?auto_139245 ?auto_139246 ) ) ( not ( = ?auto_139245 ?auto_139248 ) ) ( not ( = ?auto_139246 ?auto_139247 ) ) ( not ( = ?auto_139246 ?auto_139248 ) ) ( not ( = ?auto_139247 ?auto_139248 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139247 ?auto_139245 ?auto_139244 )
      ( DELIVER-4PKG-VERIFY ?auto_139245 ?auto_139246 ?auto_139247 ?auto_139248 ?auto_139244 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139269 - OBJ
      ?auto_139270 - OBJ
      ?auto_139271 - OBJ
      ?auto_139272 - OBJ
      ?auto_139268 - LOCATION
    )
    :vars
    (
      ?auto_139274 - TRUCK
      ?auto_139275 - LOCATION
      ?auto_139273 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139274 ?auto_139275 ) ( IN-CITY ?auto_139275 ?auto_139273 ) ( IN-CITY ?auto_139268 ?auto_139273 ) ( not ( = ?auto_139268 ?auto_139275 ) ) ( OBJ-AT ?auto_139270 ?auto_139268 ) ( not ( = ?auto_139270 ?auto_139269 ) ) ( OBJ-AT ?auto_139269 ?auto_139275 ) ( OBJ-AT ?auto_139271 ?auto_139268 ) ( OBJ-AT ?auto_139272 ?auto_139268 ) ( not ( = ?auto_139269 ?auto_139271 ) ) ( not ( = ?auto_139269 ?auto_139272 ) ) ( not ( = ?auto_139270 ?auto_139271 ) ) ( not ( = ?auto_139270 ?auto_139272 ) ) ( not ( = ?auto_139271 ?auto_139272 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139270 ?auto_139269 ?auto_139268 )
      ( DELIVER-4PKG-VERIFY ?auto_139269 ?auto_139270 ?auto_139271 ?auto_139272 ?auto_139268 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139349 - OBJ
      ?auto_139350 - OBJ
      ?auto_139351 - OBJ
      ?auto_139352 - OBJ
      ?auto_139348 - LOCATION
    )
    :vars
    (
      ?auto_139355 - TRUCK
      ?auto_139356 - LOCATION
      ?auto_139353 - CITY
      ?auto_139354 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139355 ?auto_139356 ) ( IN-CITY ?auto_139356 ?auto_139353 ) ( IN-CITY ?auto_139348 ?auto_139353 ) ( not ( = ?auto_139348 ?auto_139356 ) ) ( OBJ-AT ?auto_139354 ?auto_139348 ) ( not ( = ?auto_139354 ?auto_139349 ) ) ( OBJ-AT ?auto_139349 ?auto_139356 ) ( OBJ-AT ?auto_139350 ?auto_139348 ) ( OBJ-AT ?auto_139351 ?auto_139348 ) ( OBJ-AT ?auto_139352 ?auto_139348 ) ( not ( = ?auto_139349 ?auto_139350 ) ) ( not ( = ?auto_139349 ?auto_139351 ) ) ( not ( = ?auto_139349 ?auto_139352 ) ) ( not ( = ?auto_139350 ?auto_139351 ) ) ( not ( = ?auto_139350 ?auto_139352 ) ) ( not ( = ?auto_139350 ?auto_139354 ) ) ( not ( = ?auto_139351 ?auto_139352 ) ) ( not ( = ?auto_139351 ?auto_139354 ) ) ( not ( = ?auto_139352 ?auto_139354 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139354 ?auto_139349 ?auto_139348 )
      ( DELIVER-4PKG-VERIFY ?auto_139349 ?auto_139350 ?auto_139351 ?auto_139352 ?auto_139348 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139511 - OBJ
      ?auto_139512 - OBJ
      ?auto_139513 - OBJ
      ?auto_139510 - LOCATION
    )
    :vars
    (
      ?auto_139515 - LOCATION
      ?auto_139514 - CITY
      ?auto_139516 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139515 ?auto_139514 ) ( IN-CITY ?auto_139510 ?auto_139514 ) ( not ( = ?auto_139510 ?auto_139515 ) ) ( OBJ-AT ?auto_139511 ?auto_139510 ) ( not ( = ?auto_139511 ?auto_139512 ) ) ( OBJ-AT ?auto_139512 ?auto_139515 ) ( TRUCK-AT ?auto_139516 ?auto_139510 ) ( OBJ-AT ?auto_139513 ?auto_139510 ) ( not ( = ?auto_139511 ?auto_139513 ) ) ( not ( = ?auto_139512 ?auto_139513 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139511 ?auto_139512 ?auto_139510 )
      ( DELIVER-3PKG-VERIFY ?auto_139511 ?auto_139512 ?auto_139513 ?auto_139510 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139533 - OBJ
      ?auto_139534 - OBJ
      ?auto_139535 - OBJ
      ?auto_139532 - LOCATION
    )
    :vars
    (
      ?auto_139538 - LOCATION
      ?auto_139537 - CITY
      ?auto_139536 - OBJ
      ?auto_139539 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139538 ?auto_139537 ) ( IN-CITY ?auto_139532 ?auto_139537 ) ( not ( = ?auto_139532 ?auto_139538 ) ) ( OBJ-AT ?auto_139536 ?auto_139532 ) ( not ( = ?auto_139536 ?auto_139535 ) ) ( OBJ-AT ?auto_139535 ?auto_139538 ) ( TRUCK-AT ?auto_139539 ?auto_139532 ) ( OBJ-AT ?auto_139533 ?auto_139532 ) ( OBJ-AT ?auto_139534 ?auto_139532 ) ( not ( = ?auto_139533 ?auto_139534 ) ) ( not ( = ?auto_139533 ?auto_139535 ) ) ( not ( = ?auto_139533 ?auto_139536 ) ) ( not ( = ?auto_139534 ?auto_139535 ) ) ( not ( = ?auto_139534 ?auto_139536 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139536 ?auto_139535 ?auto_139532 )
      ( DELIVER-3PKG-VERIFY ?auto_139533 ?auto_139534 ?auto_139535 ?auto_139532 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139545 - OBJ
      ?auto_139546 - OBJ
      ?auto_139547 - OBJ
      ?auto_139544 - LOCATION
    )
    :vars
    (
      ?auto_139550 - LOCATION
      ?auto_139549 - CITY
      ?auto_139548 - OBJ
      ?auto_139551 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139550 ?auto_139549 ) ( IN-CITY ?auto_139544 ?auto_139549 ) ( not ( = ?auto_139544 ?auto_139550 ) ) ( OBJ-AT ?auto_139548 ?auto_139544 ) ( not ( = ?auto_139548 ?auto_139546 ) ) ( OBJ-AT ?auto_139546 ?auto_139550 ) ( TRUCK-AT ?auto_139551 ?auto_139544 ) ( OBJ-AT ?auto_139545 ?auto_139544 ) ( OBJ-AT ?auto_139547 ?auto_139544 ) ( not ( = ?auto_139545 ?auto_139546 ) ) ( not ( = ?auto_139545 ?auto_139547 ) ) ( not ( = ?auto_139545 ?auto_139548 ) ) ( not ( = ?auto_139546 ?auto_139547 ) ) ( not ( = ?auto_139547 ?auto_139548 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139548 ?auto_139546 ?auto_139544 )
      ( DELIVER-3PKG-VERIFY ?auto_139545 ?auto_139546 ?auto_139547 ?auto_139544 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139583 - OBJ
      ?auto_139584 - OBJ
      ?auto_139585 - OBJ
      ?auto_139582 - LOCATION
    )
    :vars
    (
      ?auto_139588 - LOCATION
      ?auto_139587 - CITY
      ?auto_139586 - OBJ
      ?auto_139589 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139588 ?auto_139587 ) ( IN-CITY ?auto_139582 ?auto_139587 ) ( not ( = ?auto_139582 ?auto_139588 ) ) ( OBJ-AT ?auto_139586 ?auto_139582 ) ( not ( = ?auto_139586 ?auto_139583 ) ) ( OBJ-AT ?auto_139583 ?auto_139588 ) ( TRUCK-AT ?auto_139589 ?auto_139582 ) ( OBJ-AT ?auto_139584 ?auto_139582 ) ( OBJ-AT ?auto_139585 ?auto_139582 ) ( not ( = ?auto_139583 ?auto_139584 ) ) ( not ( = ?auto_139583 ?auto_139585 ) ) ( not ( = ?auto_139584 ?auto_139585 ) ) ( not ( = ?auto_139584 ?auto_139586 ) ) ( not ( = ?auto_139585 ?auto_139586 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139586 ?auto_139583 ?auto_139582 )
      ( DELIVER-3PKG-VERIFY ?auto_139583 ?auto_139584 ?auto_139585 ?auto_139582 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139622 - OBJ
      ?auto_139623 - OBJ
      ?auto_139624 - OBJ
      ?auto_139625 - OBJ
      ?auto_139621 - LOCATION
    )
    :vars
    (
      ?auto_139627 - LOCATION
      ?auto_139626 - CITY
      ?auto_139628 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139627 ?auto_139626 ) ( IN-CITY ?auto_139621 ?auto_139626 ) ( not ( = ?auto_139621 ?auto_139627 ) ) ( OBJ-AT ?auto_139624 ?auto_139621 ) ( not ( = ?auto_139624 ?auto_139625 ) ) ( OBJ-AT ?auto_139625 ?auto_139627 ) ( TRUCK-AT ?auto_139628 ?auto_139621 ) ( OBJ-AT ?auto_139622 ?auto_139621 ) ( OBJ-AT ?auto_139623 ?auto_139621 ) ( not ( = ?auto_139622 ?auto_139623 ) ) ( not ( = ?auto_139622 ?auto_139624 ) ) ( not ( = ?auto_139622 ?auto_139625 ) ) ( not ( = ?auto_139623 ?auto_139624 ) ) ( not ( = ?auto_139623 ?auto_139625 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139624 ?auto_139625 ?auto_139621 )
      ( DELIVER-4PKG-VERIFY ?auto_139622 ?auto_139623 ?auto_139624 ?auto_139625 ?auto_139621 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139630 - OBJ
      ?auto_139631 - OBJ
      ?auto_139632 - OBJ
      ?auto_139633 - OBJ
      ?auto_139629 - LOCATION
    )
    :vars
    (
      ?auto_139635 - LOCATION
      ?auto_139634 - CITY
      ?auto_139636 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139635 ?auto_139634 ) ( IN-CITY ?auto_139629 ?auto_139634 ) ( not ( = ?auto_139629 ?auto_139635 ) ) ( OBJ-AT ?auto_139630 ?auto_139629 ) ( not ( = ?auto_139630 ?auto_139633 ) ) ( OBJ-AT ?auto_139633 ?auto_139635 ) ( TRUCK-AT ?auto_139636 ?auto_139629 ) ( OBJ-AT ?auto_139631 ?auto_139629 ) ( OBJ-AT ?auto_139632 ?auto_139629 ) ( not ( = ?auto_139630 ?auto_139631 ) ) ( not ( = ?auto_139630 ?auto_139632 ) ) ( not ( = ?auto_139631 ?auto_139632 ) ) ( not ( = ?auto_139631 ?auto_139633 ) ) ( not ( = ?auto_139632 ?auto_139633 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139630 ?auto_139633 ?auto_139629 )
      ( DELIVER-4PKG-VERIFY ?auto_139630 ?auto_139631 ?auto_139632 ?auto_139633 ?auto_139629 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139646 - OBJ
      ?auto_139647 - OBJ
      ?auto_139648 - OBJ
      ?auto_139649 - OBJ
      ?auto_139645 - LOCATION
    )
    :vars
    (
      ?auto_139651 - LOCATION
      ?auto_139650 - CITY
      ?auto_139652 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139651 ?auto_139650 ) ( IN-CITY ?auto_139645 ?auto_139650 ) ( not ( = ?auto_139645 ?auto_139651 ) ) ( OBJ-AT ?auto_139646 ?auto_139645 ) ( not ( = ?auto_139646 ?auto_139648 ) ) ( OBJ-AT ?auto_139648 ?auto_139651 ) ( TRUCK-AT ?auto_139652 ?auto_139645 ) ( OBJ-AT ?auto_139647 ?auto_139645 ) ( OBJ-AT ?auto_139649 ?auto_139645 ) ( not ( = ?auto_139646 ?auto_139647 ) ) ( not ( = ?auto_139646 ?auto_139649 ) ) ( not ( = ?auto_139647 ?auto_139648 ) ) ( not ( = ?auto_139647 ?auto_139649 ) ) ( not ( = ?auto_139648 ?auto_139649 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139646 ?auto_139648 ?auto_139645 )
      ( DELIVER-4PKG-VERIFY ?auto_139646 ?auto_139647 ?auto_139648 ?auto_139649 ?auto_139645 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139702 - OBJ
      ?auto_139703 - OBJ
      ?auto_139704 - OBJ
      ?auto_139705 - OBJ
      ?auto_139701 - LOCATION
    )
    :vars
    (
      ?auto_139707 - LOCATION
      ?auto_139706 - CITY
      ?auto_139708 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139707 ?auto_139706 ) ( IN-CITY ?auto_139701 ?auto_139706 ) ( not ( = ?auto_139701 ?auto_139707 ) ) ( OBJ-AT ?auto_139705 ?auto_139701 ) ( not ( = ?auto_139705 ?auto_139703 ) ) ( OBJ-AT ?auto_139703 ?auto_139707 ) ( TRUCK-AT ?auto_139708 ?auto_139701 ) ( OBJ-AT ?auto_139702 ?auto_139701 ) ( OBJ-AT ?auto_139704 ?auto_139701 ) ( not ( = ?auto_139702 ?auto_139703 ) ) ( not ( = ?auto_139702 ?auto_139704 ) ) ( not ( = ?auto_139702 ?auto_139705 ) ) ( not ( = ?auto_139703 ?auto_139704 ) ) ( not ( = ?auto_139704 ?auto_139705 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139705 ?auto_139703 ?auto_139701 )
      ( DELIVER-4PKG-VERIFY ?auto_139702 ?auto_139703 ?auto_139704 ?auto_139705 ?auto_139701 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139734 - OBJ
      ?auto_139735 - OBJ
      ?auto_139736 - OBJ
      ?auto_139737 - OBJ
      ?auto_139733 - LOCATION
    )
    :vars
    (
      ?auto_139739 - LOCATION
      ?auto_139738 - CITY
      ?auto_139740 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139739 ?auto_139738 ) ( IN-CITY ?auto_139733 ?auto_139738 ) ( not ( = ?auto_139733 ?auto_139739 ) ) ( OBJ-AT ?auto_139734 ?auto_139733 ) ( not ( = ?auto_139734 ?auto_139735 ) ) ( OBJ-AT ?auto_139735 ?auto_139739 ) ( TRUCK-AT ?auto_139740 ?auto_139733 ) ( OBJ-AT ?auto_139736 ?auto_139733 ) ( OBJ-AT ?auto_139737 ?auto_139733 ) ( not ( = ?auto_139734 ?auto_139736 ) ) ( not ( = ?auto_139734 ?auto_139737 ) ) ( not ( = ?auto_139735 ?auto_139736 ) ) ( not ( = ?auto_139735 ?auto_139737 ) ) ( not ( = ?auto_139736 ?auto_139737 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139734 ?auto_139735 ?auto_139733 )
      ( DELIVER-4PKG-VERIFY ?auto_139734 ?auto_139735 ?auto_139736 ?auto_139737 ?auto_139733 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139790 - OBJ
      ?auto_139791 - OBJ
      ?auto_139792 - OBJ
      ?auto_139793 - OBJ
      ?auto_139789 - LOCATION
    )
    :vars
    (
      ?auto_139795 - LOCATION
      ?auto_139794 - CITY
      ?auto_139796 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139795 ?auto_139794 ) ( IN-CITY ?auto_139789 ?auto_139794 ) ( not ( = ?auto_139789 ?auto_139795 ) ) ( OBJ-AT ?auto_139791 ?auto_139789 ) ( not ( = ?auto_139791 ?auto_139792 ) ) ( OBJ-AT ?auto_139792 ?auto_139795 ) ( TRUCK-AT ?auto_139796 ?auto_139789 ) ( OBJ-AT ?auto_139790 ?auto_139789 ) ( OBJ-AT ?auto_139793 ?auto_139789 ) ( not ( = ?auto_139790 ?auto_139791 ) ) ( not ( = ?auto_139790 ?auto_139792 ) ) ( not ( = ?auto_139790 ?auto_139793 ) ) ( not ( = ?auto_139791 ?auto_139793 ) ) ( not ( = ?auto_139792 ?auto_139793 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139791 ?auto_139792 ?auto_139789 )
      ( DELIVER-4PKG-VERIFY ?auto_139790 ?auto_139791 ?auto_139792 ?auto_139793 ?auto_139789 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139822 - OBJ
      ?auto_139823 - OBJ
      ?auto_139824 - OBJ
      ?auto_139825 - OBJ
      ?auto_139821 - LOCATION
    )
    :vars
    (
      ?auto_139828 - LOCATION
      ?auto_139827 - CITY
      ?auto_139826 - OBJ
      ?auto_139829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139828 ?auto_139827 ) ( IN-CITY ?auto_139821 ?auto_139827 ) ( not ( = ?auto_139821 ?auto_139828 ) ) ( OBJ-AT ?auto_139826 ?auto_139821 ) ( not ( = ?auto_139826 ?auto_139825 ) ) ( OBJ-AT ?auto_139825 ?auto_139828 ) ( TRUCK-AT ?auto_139829 ?auto_139821 ) ( OBJ-AT ?auto_139822 ?auto_139821 ) ( OBJ-AT ?auto_139823 ?auto_139821 ) ( OBJ-AT ?auto_139824 ?auto_139821 ) ( not ( = ?auto_139822 ?auto_139823 ) ) ( not ( = ?auto_139822 ?auto_139824 ) ) ( not ( = ?auto_139822 ?auto_139825 ) ) ( not ( = ?auto_139822 ?auto_139826 ) ) ( not ( = ?auto_139823 ?auto_139824 ) ) ( not ( = ?auto_139823 ?auto_139825 ) ) ( not ( = ?auto_139823 ?auto_139826 ) ) ( not ( = ?auto_139824 ?auto_139825 ) ) ( not ( = ?auto_139824 ?auto_139826 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139826 ?auto_139825 ?auto_139821 )
      ( DELIVER-4PKG-VERIFY ?auto_139822 ?auto_139823 ?auto_139824 ?auto_139825 ?auto_139821 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139839 - OBJ
      ?auto_139840 - OBJ
      ?auto_139841 - OBJ
      ?auto_139842 - OBJ
      ?auto_139838 - LOCATION
    )
    :vars
    (
      ?auto_139845 - LOCATION
      ?auto_139844 - CITY
      ?auto_139843 - OBJ
      ?auto_139846 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139845 ?auto_139844 ) ( IN-CITY ?auto_139838 ?auto_139844 ) ( not ( = ?auto_139838 ?auto_139845 ) ) ( OBJ-AT ?auto_139843 ?auto_139838 ) ( not ( = ?auto_139843 ?auto_139841 ) ) ( OBJ-AT ?auto_139841 ?auto_139845 ) ( TRUCK-AT ?auto_139846 ?auto_139838 ) ( OBJ-AT ?auto_139839 ?auto_139838 ) ( OBJ-AT ?auto_139840 ?auto_139838 ) ( OBJ-AT ?auto_139842 ?auto_139838 ) ( not ( = ?auto_139839 ?auto_139840 ) ) ( not ( = ?auto_139839 ?auto_139841 ) ) ( not ( = ?auto_139839 ?auto_139842 ) ) ( not ( = ?auto_139839 ?auto_139843 ) ) ( not ( = ?auto_139840 ?auto_139841 ) ) ( not ( = ?auto_139840 ?auto_139842 ) ) ( not ( = ?auto_139840 ?auto_139843 ) ) ( not ( = ?auto_139841 ?auto_139842 ) ) ( not ( = ?auto_139842 ?auto_139843 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139843 ?auto_139841 ?auto_139838 )
      ( DELIVER-4PKG-VERIFY ?auto_139839 ?auto_139840 ?auto_139841 ?auto_139842 ?auto_139838 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139889 - OBJ
      ?auto_139890 - OBJ
      ?auto_139891 - OBJ
      ?auto_139892 - OBJ
      ?auto_139888 - LOCATION
    )
    :vars
    (
      ?auto_139895 - LOCATION
      ?auto_139894 - CITY
      ?auto_139893 - OBJ
      ?auto_139896 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139895 ?auto_139894 ) ( IN-CITY ?auto_139888 ?auto_139894 ) ( not ( = ?auto_139888 ?auto_139895 ) ) ( OBJ-AT ?auto_139893 ?auto_139888 ) ( not ( = ?auto_139893 ?auto_139890 ) ) ( OBJ-AT ?auto_139890 ?auto_139895 ) ( TRUCK-AT ?auto_139896 ?auto_139888 ) ( OBJ-AT ?auto_139889 ?auto_139888 ) ( OBJ-AT ?auto_139891 ?auto_139888 ) ( OBJ-AT ?auto_139892 ?auto_139888 ) ( not ( = ?auto_139889 ?auto_139890 ) ) ( not ( = ?auto_139889 ?auto_139891 ) ) ( not ( = ?auto_139889 ?auto_139892 ) ) ( not ( = ?auto_139889 ?auto_139893 ) ) ( not ( = ?auto_139890 ?auto_139891 ) ) ( not ( = ?auto_139890 ?auto_139892 ) ) ( not ( = ?auto_139891 ?auto_139892 ) ) ( not ( = ?auto_139891 ?auto_139893 ) ) ( not ( = ?auto_139892 ?auto_139893 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139893 ?auto_139890 ?auto_139888 )
      ( DELIVER-4PKG-VERIFY ?auto_139889 ?auto_139890 ?auto_139891 ?auto_139892 ?auto_139888 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139933 - OBJ
      ?auto_139934 - OBJ
      ?auto_139935 - OBJ
      ?auto_139936 - OBJ
      ?auto_139932 - LOCATION
    )
    :vars
    (
      ?auto_139938 - LOCATION
      ?auto_139937 - CITY
      ?auto_139939 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139938 ?auto_139937 ) ( IN-CITY ?auto_139932 ?auto_139937 ) ( not ( = ?auto_139932 ?auto_139938 ) ) ( OBJ-AT ?auto_139935 ?auto_139932 ) ( not ( = ?auto_139935 ?auto_139933 ) ) ( OBJ-AT ?auto_139933 ?auto_139938 ) ( TRUCK-AT ?auto_139939 ?auto_139932 ) ( OBJ-AT ?auto_139934 ?auto_139932 ) ( OBJ-AT ?auto_139936 ?auto_139932 ) ( not ( = ?auto_139933 ?auto_139934 ) ) ( not ( = ?auto_139933 ?auto_139936 ) ) ( not ( = ?auto_139934 ?auto_139935 ) ) ( not ( = ?auto_139934 ?auto_139936 ) ) ( not ( = ?auto_139935 ?auto_139936 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139935 ?auto_139933 ?auto_139932 )
      ( DELIVER-4PKG-VERIFY ?auto_139933 ?auto_139934 ?auto_139935 ?auto_139936 ?auto_139932 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139965 - OBJ
      ?auto_139966 - OBJ
      ?auto_139967 - OBJ
      ?auto_139968 - OBJ
      ?auto_139964 - LOCATION
    )
    :vars
    (
      ?auto_139970 - LOCATION
      ?auto_139969 - CITY
      ?auto_139971 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139970 ?auto_139969 ) ( IN-CITY ?auto_139964 ?auto_139969 ) ( not ( = ?auto_139964 ?auto_139970 ) ) ( OBJ-AT ?auto_139966 ?auto_139964 ) ( not ( = ?auto_139966 ?auto_139965 ) ) ( OBJ-AT ?auto_139965 ?auto_139970 ) ( TRUCK-AT ?auto_139971 ?auto_139964 ) ( OBJ-AT ?auto_139967 ?auto_139964 ) ( OBJ-AT ?auto_139968 ?auto_139964 ) ( not ( = ?auto_139965 ?auto_139967 ) ) ( not ( = ?auto_139965 ?auto_139968 ) ) ( not ( = ?auto_139966 ?auto_139967 ) ) ( not ( = ?auto_139966 ?auto_139968 ) ) ( not ( = ?auto_139967 ?auto_139968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139966 ?auto_139965 ?auto_139964 )
      ( DELIVER-4PKG-VERIFY ?auto_139965 ?auto_139966 ?auto_139967 ?auto_139968 ?auto_139964 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140037 - OBJ
      ?auto_140038 - OBJ
      ?auto_140039 - OBJ
      ?auto_140040 - OBJ
      ?auto_140036 - LOCATION
    )
    :vars
    (
      ?auto_140043 - LOCATION
      ?auto_140042 - CITY
      ?auto_140041 - OBJ
      ?auto_140044 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140043 ?auto_140042 ) ( IN-CITY ?auto_140036 ?auto_140042 ) ( not ( = ?auto_140036 ?auto_140043 ) ) ( OBJ-AT ?auto_140041 ?auto_140036 ) ( not ( = ?auto_140041 ?auto_140037 ) ) ( OBJ-AT ?auto_140037 ?auto_140043 ) ( TRUCK-AT ?auto_140044 ?auto_140036 ) ( OBJ-AT ?auto_140038 ?auto_140036 ) ( OBJ-AT ?auto_140039 ?auto_140036 ) ( OBJ-AT ?auto_140040 ?auto_140036 ) ( not ( = ?auto_140037 ?auto_140038 ) ) ( not ( = ?auto_140037 ?auto_140039 ) ) ( not ( = ?auto_140037 ?auto_140040 ) ) ( not ( = ?auto_140038 ?auto_140039 ) ) ( not ( = ?auto_140038 ?auto_140040 ) ) ( not ( = ?auto_140038 ?auto_140041 ) ) ( not ( = ?auto_140039 ?auto_140040 ) ) ( not ( = ?auto_140039 ?auto_140041 ) ) ( not ( = ?auto_140040 ?auto_140041 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140041 ?auto_140037 ?auto_140036 )
      ( DELIVER-4PKG-VERIFY ?auto_140037 ?auto_140038 ?auto_140039 ?auto_140040 ?auto_140036 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_140861 - OBJ
      ?auto_140860 - LOCATION
    )
    :vars
    (
      ?auto_140865 - LOCATION
      ?auto_140863 - CITY
      ?auto_140862 - OBJ
      ?auto_140864 - TRUCK
      ?auto_140866 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_140865 ?auto_140863 ) ( IN-CITY ?auto_140860 ?auto_140863 ) ( not ( = ?auto_140860 ?auto_140865 ) ) ( OBJ-AT ?auto_140862 ?auto_140860 ) ( not ( = ?auto_140862 ?auto_140861 ) ) ( OBJ-AT ?auto_140861 ?auto_140865 ) ( TRUCK-AT ?auto_140864 ?auto_140866 ) ( IN-CITY ?auto_140866 ?auto_140863 ) ( not ( = ?auto_140860 ?auto_140866 ) ) ( not ( = ?auto_140865 ?auto_140866 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_140864 ?auto_140866 ?auto_140860 ?auto_140863 )
      ( DELIVER-2PKG ?auto_140862 ?auto_140861 ?auto_140860 )
      ( DELIVER-1PKG-VERIFY ?auto_140861 ?auto_140860 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_140868 - OBJ
      ?auto_140869 - OBJ
      ?auto_140867 - LOCATION
    )
    :vars
    (
      ?auto_140871 - LOCATION
      ?auto_140873 - CITY
      ?auto_140870 - TRUCK
      ?auto_140872 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_140871 ?auto_140873 ) ( IN-CITY ?auto_140867 ?auto_140873 ) ( not ( = ?auto_140867 ?auto_140871 ) ) ( OBJ-AT ?auto_140868 ?auto_140867 ) ( not ( = ?auto_140868 ?auto_140869 ) ) ( OBJ-AT ?auto_140869 ?auto_140871 ) ( TRUCK-AT ?auto_140870 ?auto_140872 ) ( IN-CITY ?auto_140872 ?auto_140873 ) ( not ( = ?auto_140867 ?auto_140872 ) ) ( not ( = ?auto_140871 ?auto_140872 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_140869 ?auto_140867 )
      ( DELIVER-2PKG-VERIFY ?auto_140868 ?auto_140869 ?auto_140867 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_140883 - OBJ
      ?auto_140884 - OBJ
      ?auto_140882 - LOCATION
    )
    :vars
    (
      ?auto_140886 - LOCATION
      ?auto_140888 - CITY
      ?auto_140887 - TRUCK
      ?auto_140885 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_140886 ?auto_140888 ) ( IN-CITY ?auto_140882 ?auto_140888 ) ( not ( = ?auto_140882 ?auto_140886 ) ) ( OBJ-AT ?auto_140884 ?auto_140882 ) ( not ( = ?auto_140884 ?auto_140883 ) ) ( OBJ-AT ?auto_140883 ?auto_140886 ) ( TRUCK-AT ?auto_140887 ?auto_140885 ) ( IN-CITY ?auto_140885 ?auto_140888 ) ( not ( = ?auto_140882 ?auto_140885 ) ) ( not ( = ?auto_140886 ?auto_140885 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140884 ?auto_140883 ?auto_140882 )
      ( DELIVER-2PKG-VERIFY ?auto_140883 ?auto_140884 ?auto_140882 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140906 - OBJ
      ?auto_140907 - OBJ
      ?auto_140908 - OBJ
      ?auto_140905 - LOCATION
    )
    :vars
    (
      ?auto_140910 - LOCATION
      ?auto_140912 - CITY
      ?auto_140911 - TRUCK
      ?auto_140909 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_140910 ?auto_140912 ) ( IN-CITY ?auto_140905 ?auto_140912 ) ( not ( = ?auto_140905 ?auto_140910 ) ) ( OBJ-AT ?auto_140907 ?auto_140905 ) ( not ( = ?auto_140907 ?auto_140908 ) ) ( OBJ-AT ?auto_140908 ?auto_140910 ) ( TRUCK-AT ?auto_140911 ?auto_140909 ) ( IN-CITY ?auto_140909 ?auto_140912 ) ( not ( = ?auto_140905 ?auto_140909 ) ) ( not ( = ?auto_140910 ?auto_140909 ) ) ( OBJ-AT ?auto_140906 ?auto_140905 ) ( not ( = ?auto_140906 ?auto_140907 ) ) ( not ( = ?auto_140906 ?auto_140908 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140907 ?auto_140908 ?auto_140905 )
      ( DELIVER-3PKG-VERIFY ?auto_140906 ?auto_140907 ?auto_140908 ?auto_140905 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140922 - OBJ
      ?auto_140923 - OBJ
      ?auto_140924 - OBJ
      ?auto_140921 - LOCATION
    )
    :vars
    (
      ?auto_140926 - LOCATION
      ?auto_140928 - CITY
      ?auto_140927 - TRUCK
      ?auto_140925 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_140926 ?auto_140928 ) ( IN-CITY ?auto_140921 ?auto_140928 ) ( not ( = ?auto_140921 ?auto_140926 ) ) ( OBJ-AT ?auto_140924 ?auto_140921 ) ( not ( = ?auto_140924 ?auto_140923 ) ) ( OBJ-AT ?auto_140923 ?auto_140926 ) ( TRUCK-AT ?auto_140927 ?auto_140925 ) ( IN-CITY ?auto_140925 ?auto_140928 ) ( not ( = ?auto_140921 ?auto_140925 ) ) ( not ( = ?auto_140926 ?auto_140925 ) ) ( OBJ-AT ?auto_140922 ?auto_140921 ) ( not ( = ?auto_140922 ?auto_140923 ) ) ( not ( = ?auto_140922 ?auto_140924 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140924 ?auto_140923 ?auto_140921 )
      ( DELIVER-3PKG-VERIFY ?auto_140922 ?auto_140923 ?auto_140924 ?auto_140921 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140989 - OBJ
      ?auto_140990 - OBJ
      ?auto_140991 - OBJ
      ?auto_140988 - LOCATION
    )
    :vars
    (
      ?auto_140993 - LOCATION
      ?auto_140995 - CITY
      ?auto_140994 - TRUCK
      ?auto_140992 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_140993 ?auto_140995 ) ( IN-CITY ?auto_140988 ?auto_140995 ) ( not ( = ?auto_140988 ?auto_140993 ) ) ( OBJ-AT ?auto_140991 ?auto_140988 ) ( not ( = ?auto_140991 ?auto_140989 ) ) ( OBJ-AT ?auto_140989 ?auto_140993 ) ( TRUCK-AT ?auto_140994 ?auto_140992 ) ( IN-CITY ?auto_140992 ?auto_140995 ) ( not ( = ?auto_140988 ?auto_140992 ) ) ( not ( = ?auto_140993 ?auto_140992 ) ) ( OBJ-AT ?auto_140990 ?auto_140988 ) ( not ( = ?auto_140989 ?auto_140990 ) ) ( not ( = ?auto_140990 ?auto_140991 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140991 ?auto_140989 ?auto_140988 )
      ( DELIVER-3PKG-VERIFY ?auto_140989 ?auto_140990 ?auto_140991 ?auto_140988 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141065 - OBJ
      ?auto_141066 - OBJ
      ?auto_141067 - OBJ
      ?auto_141068 - OBJ
      ?auto_141064 - LOCATION
    )
    :vars
    (
      ?auto_141070 - LOCATION
      ?auto_141072 - CITY
      ?auto_141071 - TRUCK
      ?auto_141069 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141070 ?auto_141072 ) ( IN-CITY ?auto_141064 ?auto_141072 ) ( not ( = ?auto_141064 ?auto_141070 ) ) ( OBJ-AT ?auto_141065 ?auto_141064 ) ( not ( = ?auto_141065 ?auto_141068 ) ) ( OBJ-AT ?auto_141068 ?auto_141070 ) ( TRUCK-AT ?auto_141071 ?auto_141069 ) ( IN-CITY ?auto_141069 ?auto_141072 ) ( not ( = ?auto_141064 ?auto_141069 ) ) ( not ( = ?auto_141070 ?auto_141069 ) ) ( OBJ-AT ?auto_141066 ?auto_141064 ) ( OBJ-AT ?auto_141067 ?auto_141064 ) ( not ( = ?auto_141065 ?auto_141066 ) ) ( not ( = ?auto_141065 ?auto_141067 ) ) ( not ( = ?auto_141066 ?auto_141067 ) ) ( not ( = ?auto_141066 ?auto_141068 ) ) ( not ( = ?auto_141067 ?auto_141068 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141065 ?auto_141068 ?auto_141064 )
      ( DELIVER-4PKG-VERIFY ?auto_141065 ?auto_141066 ?auto_141067 ?auto_141068 ?auto_141064 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141083 - OBJ
      ?auto_141084 - OBJ
      ?auto_141085 - OBJ
      ?auto_141086 - OBJ
      ?auto_141082 - LOCATION
    )
    :vars
    (
      ?auto_141088 - LOCATION
      ?auto_141090 - CITY
      ?auto_141089 - TRUCK
      ?auto_141087 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141088 ?auto_141090 ) ( IN-CITY ?auto_141082 ?auto_141090 ) ( not ( = ?auto_141082 ?auto_141088 ) ) ( OBJ-AT ?auto_141083 ?auto_141082 ) ( not ( = ?auto_141083 ?auto_141085 ) ) ( OBJ-AT ?auto_141085 ?auto_141088 ) ( TRUCK-AT ?auto_141089 ?auto_141087 ) ( IN-CITY ?auto_141087 ?auto_141090 ) ( not ( = ?auto_141082 ?auto_141087 ) ) ( not ( = ?auto_141088 ?auto_141087 ) ) ( OBJ-AT ?auto_141084 ?auto_141082 ) ( OBJ-AT ?auto_141086 ?auto_141082 ) ( not ( = ?auto_141083 ?auto_141084 ) ) ( not ( = ?auto_141083 ?auto_141086 ) ) ( not ( = ?auto_141084 ?auto_141085 ) ) ( not ( = ?auto_141084 ?auto_141086 ) ) ( not ( = ?auto_141085 ?auto_141086 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141083 ?auto_141085 ?auto_141082 )
      ( DELIVER-4PKG-VERIFY ?auto_141083 ?auto_141084 ?auto_141085 ?auto_141086 ?auto_141082 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141155 - OBJ
      ?auto_141156 - OBJ
      ?auto_141157 - OBJ
      ?auto_141158 - OBJ
      ?auto_141154 - LOCATION
    )
    :vars
    (
      ?auto_141160 - LOCATION
      ?auto_141162 - CITY
      ?auto_141161 - TRUCK
      ?auto_141159 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141160 ?auto_141162 ) ( IN-CITY ?auto_141154 ?auto_141162 ) ( not ( = ?auto_141154 ?auto_141160 ) ) ( OBJ-AT ?auto_141155 ?auto_141154 ) ( not ( = ?auto_141155 ?auto_141156 ) ) ( OBJ-AT ?auto_141156 ?auto_141160 ) ( TRUCK-AT ?auto_141161 ?auto_141159 ) ( IN-CITY ?auto_141159 ?auto_141162 ) ( not ( = ?auto_141154 ?auto_141159 ) ) ( not ( = ?auto_141160 ?auto_141159 ) ) ( OBJ-AT ?auto_141157 ?auto_141154 ) ( OBJ-AT ?auto_141158 ?auto_141154 ) ( not ( = ?auto_141155 ?auto_141157 ) ) ( not ( = ?auto_141155 ?auto_141158 ) ) ( not ( = ?auto_141156 ?auto_141157 ) ) ( not ( = ?auto_141156 ?auto_141158 ) ) ( not ( = ?auto_141157 ?auto_141158 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141155 ?auto_141156 ?auto_141154 )
      ( DELIVER-4PKG-VERIFY ?auto_141155 ?auto_141156 ?auto_141157 ?auto_141158 ?auto_141154 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141414 - OBJ
      ?auto_141415 - OBJ
      ?auto_141416 - OBJ
      ?auto_141417 - OBJ
      ?auto_141413 - LOCATION
    )
    :vars
    (
      ?auto_141419 - LOCATION
      ?auto_141421 - CITY
      ?auto_141420 - TRUCK
      ?auto_141418 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141419 ?auto_141421 ) ( IN-CITY ?auto_141413 ?auto_141421 ) ( not ( = ?auto_141413 ?auto_141419 ) ) ( OBJ-AT ?auto_141416 ?auto_141413 ) ( not ( = ?auto_141416 ?auto_141414 ) ) ( OBJ-AT ?auto_141414 ?auto_141419 ) ( TRUCK-AT ?auto_141420 ?auto_141418 ) ( IN-CITY ?auto_141418 ?auto_141421 ) ( not ( = ?auto_141413 ?auto_141418 ) ) ( not ( = ?auto_141419 ?auto_141418 ) ) ( OBJ-AT ?auto_141415 ?auto_141413 ) ( OBJ-AT ?auto_141417 ?auto_141413 ) ( not ( = ?auto_141414 ?auto_141415 ) ) ( not ( = ?auto_141414 ?auto_141417 ) ) ( not ( = ?auto_141415 ?auto_141416 ) ) ( not ( = ?auto_141415 ?auto_141417 ) ) ( not ( = ?auto_141416 ?auto_141417 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141416 ?auto_141414 ?auto_141413 )
      ( DELIVER-4PKG-VERIFY ?auto_141414 ?auto_141415 ?auto_141416 ?auto_141417 ?auto_141413 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_141697 - OBJ
      ?auto_141698 - OBJ
      ?auto_141699 - OBJ
      ?auto_141696 - LOCATION
    )
    :vars
    (
      ?auto_141701 - LOCATION
      ?auto_141703 - CITY
      ?auto_141700 - TRUCK
      ?auto_141702 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141701 ?auto_141703 ) ( IN-CITY ?auto_141696 ?auto_141703 ) ( not ( = ?auto_141696 ?auto_141701 ) ) ( OBJ-AT ?auto_141697 ?auto_141696 ) ( not ( = ?auto_141697 ?auto_141699 ) ) ( OBJ-AT ?auto_141699 ?auto_141701 ) ( TRUCK-AT ?auto_141700 ?auto_141702 ) ( IN-CITY ?auto_141702 ?auto_141703 ) ( not ( = ?auto_141696 ?auto_141702 ) ) ( not ( = ?auto_141701 ?auto_141702 ) ) ( OBJ-AT ?auto_141698 ?auto_141696 ) ( not ( = ?auto_141697 ?auto_141698 ) ) ( not ( = ?auto_141698 ?auto_141699 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141697 ?auto_141699 ?auto_141696 )
      ( DELIVER-3PKG-VERIFY ?auto_141697 ?auto_141698 ?auto_141699 ?auto_141696 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_141780 - OBJ
      ?auto_141781 - OBJ
      ?auto_141782 - OBJ
      ?auto_141779 - LOCATION
    )
    :vars
    (
      ?auto_141784 - LOCATION
      ?auto_141786 - CITY
      ?auto_141783 - TRUCK
      ?auto_141785 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141784 ?auto_141786 ) ( IN-CITY ?auto_141779 ?auto_141786 ) ( not ( = ?auto_141779 ?auto_141784 ) ) ( OBJ-AT ?auto_141781 ?auto_141779 ) ( not ( = ?auto_141781 ?auto_141780 ) ) ( OBJ-AT ?auto_141780 ?auto_141784 ) ( TRUCK-AT ?auto_141783 ?auto_141785 ) ( IN-CITY ?auto_141785 ?auto_141786 ) ( not ( = ?auto_141779 ?auto_141785 ) ) ( not ( = ?auto_141784 ?auto_141785 ) ) ( OBJ-AT ?auto_141782 ?auto_141779 ) ( not ( = ?auto_141780 ?auto_141782 ) ) ( not ( = ?auto_141781 ?auto_141782 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141781 ?auto_141780 ?auto_141779 )
      ( DELIVER-3PKG-VERIFY ?auto_141780 ?auto_141781 ?auto_141782 ?auto_141779 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141946 - OBJ
      ?auto_141947 - OBJ
      ?auto_141948 - OBJ
      ?auto_141949 - OBJ
      ?auto_141945 - LOCATION
    )
    :vars
    (
      ?auto_141951 - LOCATION
      ?auto_141953 - CITY
      ?auto_141950 - TRUCK
      ?auto_141952 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141951 ?auto_141953 ) ( IN-CITY ?auto_141945 ?auto_141953 ) ( not ( = ?auto_141945 ?auto_141951 ) ) ( OBJ-AT ?auto_141949 ?auto_141945 ) ( not ( = ?auto_141949 ?auto_141947 ) ) ( OBJ-AT ?auto_141947 ?auto_141951 ) ( TRUCK-AT ?auto_141950 ?auto_141952 ) ( IN-CITY ?auto_141952 ?auto_141953 ) ( not ( = ?auto_141945 ?auto_141952 ) ) ( not ( = ?auto_141951 ?auto_141952 ) ) ( OBJ-AT ?auto_141946 ?auto_141945 ) ( OBJ-AT ?auto_141948 ?auto_141945 ) ( not ( = ?auto_141946 ?auto_141947 ) ) ( not ( = ?auto_141946 ?auto_141948 ) ) ( not ( = ?auto_141946 ?auto_141949 ) ) ( not ( = ?auto_141947 ?auto_141948 ) ) ( not ( = ?auto_141948 ?auto_141949 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141949 ?auto_141947 ?auto_141945 )
      ( DELIVER-4PKG-VERIFY ?auto_141946 ?auto_141947 ?auto_141948 ?auto_141949 ?auto_141945 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_142558 - OBJ
      ?auto_142559 - OBJ
      ?auto_142560 - OBJ
      ?auto_142557 - LOCATION
    )
    :vars
    (
      ?auto_142562 - LOCATION
      ?auto_142563 - CITY
      ?auto_142561 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_142562 ?auto_142563 ) ( IN-CITY ?auto_142557 ?auto_142563 ) ( not ( = ?auto_142557 ?auto_142562 ) ) ( OBJ-AT ?auto_142560 ?auto_142557 ) ( not ( = ?auto_142560 ?auto_142558 ) ) ( OBJ-AT ?auto_142558 ?auto_142562 ) ( TRUCK-AT ?auto_142561 ?auto_142557 ) ( OBJ-AT ?auto_142559 ?auto_142557 ) ( not ( = ?auto_142558 ?auto_142559 ) ) ( not ( = ?auto_142559 ?auto_142560 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_142560 ?auto_142558 ?auto_142557 )
      ( DELIVER-3PKG-VERIFY ?auto_142558 ?auto_142559 ?auto_142560 ?auto_142557 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_143864 - OBJ
      ?auto_143863 - LOCATION
    )
    :vars
    (
      ?auto_143867 - LOCATION
      ?auto_143866 - CITY
      ?auto_143868 - OBJ
      ?auto_143865 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_143867 ?auto_143866 ) ( IN-CITY ?auto_143863 ?auto_143866 ) ( not ( = ?auto_143863 ?auto_143867 ) ) ( not ( = ?auto_143868 ?auto_143864 ) ) ( OBJ-AT ?auto_143864 ?auto_143867 ) ( IN-TRUCK ?auto_143868 ?auto_143865 ) ( TRUCK-AT ?auto_143865 ?auto_143867 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_143865 ?auto_143867 ?auto_143863 ?auto_143866 )
      ( DELIVER-2PKG ?auto_143868 ?auto_143864 ?auto_143863 )
      ( DELIVER-1PKG-VERIFY ?auto_143864 ?auto_143863 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_143870 - OBJ
      ?auto_143871 - OBJ
      ?auto_143869 - LOCATION
    )
    :vars
    (
      ?auto_143873 - LOCATION
      ?auto_143874 - CITY
      ?auto_143872 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_143873 ?auto_143874 ) ( IN-CITY ?auto_143869 ?auto_143874 ) ( not ( = ?auto_143869 ?auto_143873 ) ) ( not ( = ?auto_143870 ?auto_143871 ) ) ( OBJ-AT ?auto_143871 ?auto_143873 ) ( IN-TRUCK ?auto_143870 ?auto_143872 ) ( TRUCK-AT ?auto_143872 ?auto_143873 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_143871 ?auto_143869 )
      ( DELIVER-2PKG-VERIFY ?auto_143870 ?auto_143871 ?auto_143869 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_143883 - OBJ
      ?auto_143884 - OBJ
      ?auto_143882 - LOCATION
    )
    :vars
    (
      ?auto_143885 - LOCATION
      ?auto_143886 - CITY
      ?auto_143887 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_143885 ?auto_143886 ) ( IN-CITY ?auto_143882 ?auto_143886 ) ( not ( = ?auto_143882 ?auto_143885 ) ) ( not ( = ?auto_143884 ?auto_143883 ) ) ( OBJ-AT ?auto_143883 ?auto_143885 ) ( IN-TRUCK ?auto_143884 ?auto_143887 ) ( TRUCK-AT ?auto_143887 ?auto_143885 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_143884 ?auto_143883 ?auto_143882 )
      ( DELIVER-2PKG-VERIFY ?auto_143883 ?auto_143884 ?auto_143882 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_150002 - OBJ
      ?auto_150003 - OBJ
      ?auto_150004 - OBJ
      ?auto_150001 - LOCATION
    )
    :vars
    (
      ?auto_150006 - TRUCK
      ?auto_150005 - LOCATION
      ?auto_150007 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_150006 ?auto_150005 ) ( IN-CITY ?auto_150005 ?auto_150007 ) ( IN-CITY ?auto_150001 ?auto_150007 ) ( not ( = ?auto_150001 ?auto_150005 ) ) ( OBJ-AT ?auto_150002 ?auto_150001 ) ( not ( = ?auto_150002 ?auto_150004 ) ) ( OBJ-AT ?auto_150004 ?auto_150005 ) ( OBJ-AT ?auto_150003 ?auto_150001 ) ( not ( = ?auto_150002 ?auto_150003 ) ) ( not ( = ?auto_150003 ?auto_150004 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_150002 ?auto_150004 ?auto_150001 )
      ( DELIVER-3PKG-VERIFY ?auto_150002 ?auto_150003 ?auto_150004 ?auto_150001 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_150017 - OBJ
      ?auto_150018 - OBJ
      ?auto_150019 - OBJ
      ?auto_150016 - LOCATION
    )
    :vars
    (
      ?auto_150021 - TRUCK
      ?auto_150020 - LOCATION
      ?auto_150022 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_150021 ?auto_150020 ) ( IN-CITY ?auto_150020 ?auto_150022 ) ( IN-CITY ?auto_150016 ?auto_150022 ) ( not ( = ?auto_150016 ?auto_150020 ) ) ( OBJ-AT ?auto_150019 ?auto_150016 ) ( not ( = ?auto_150019 ?auto_150018 ) ) ( OBJ-AT ?auto_150018 ?auto_150020 ) ( OBJ-AT ?auto_150017 ?auto_150016 ) ( not ( = ?auto_150017 ?auto_150018 ) ) ( not ( = ?auto_150017 ?auto_150019 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_150019 ?auto_150018 ?auto_150016 )
      ( DELIVER-3PKG-VERIFY ?auto_150017 ?auto_150018 ?auto_150019 ?auto_150016 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_150119 - OBJ
      ?auto_150120 - OBJ
      ?auto_150121 - OBJ
      ?auto_150118 - LOCATION
    )
    :vars
    (
      ?auto_150123 - TRUCK
      ?auto_150122 - LOCATION
      ?auto_150124 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_150123 ?auto_150122 ) ( IN-CITY ?auto_150122 ?auto_150124 ) ( IN-CITY ?auto_150118 ?auto_150124 ) ( not ( = ?auto_150118 ?auto_150122 ) ) ( OBJ-AT ?auto_150121 ?auto_150118 ) ( not ( = ?auto_150121 ?auto_150119 ) ) ( OBJ-AT ?auto_150119 ?auto_150122 ) ( OBJ-AT ?auto_150120 ?auto_150118 ) ( not ( = ?auto_150119 ?auto_150120 ) ) ( not ( = ?auto_150120 ?auto_150121 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_150121 ?auto_150119 ?auto_150118 )
      ( DELIVER-3PKG-VERIFY ?auto_150119 ?auto_150120 ?auto_150121 ?auto_150118 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155092 - OBJ
      ?auto_155093 - OBJ
      ?auto_155094 - OBJ
      ?auto_155091 - LOCATION
    )
    :vars
    (
      ?auto_155097 - LOCATION
      ?auto_155096 - CITY
      ?auto_155095 - TRUCK
      ?auto_155098 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155097 ?auto_155096 ) ( IN-CITY ?auto_155091 ?auto_155096 ) ( not ( = ?auto_155091 ?auto_155097 ) ) ( OBJ-AT ?auto_155092 ?auto_155091 ) ( not ( = ?auto_155092 ?auto_155093 ) ) ( OBJ-AT ?auto_155093 ?auto_155097 ) ( TRUCK-AT ?auto_155095 ?auto_155098 ) ( IN-CITY ?auto_155098 ?auto_155096 ) ( not ( = ?auto_155091 ?auto_155098 ) ) ( not ( = ?auto_155097 ?auto_155098 ) ) ( OBJ-AT ?auto_155094 ?auto_155091 ) ( not ( = ?auto_155092 ?auto_155094 ) ) ( not ( = ?auto_155093 ?auto_155094 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155092 ?auto_155093 ?auto_155091 )
      ( DELIVER-3PKG-VERIFY ?auto_155092 ?auto_155093 ?auto_155094 ?auto_155091 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155124 - OBJ
      ?auto_155125 - OBJ
      ?auto_155126 - OBJ
      ?auto_155123 - LOCATION
    )
    :vars
    (
      ?auto_155130 - LOCATION
      ?auto_155129 - CITY
      ?auto_155128 - OBJ
      ?auto_155127 - TRUCK
      ?auto_155131 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155130 ?auto_155129 ) ( IN-CITY ?auto_155123 ?auto_155129 ) ( not ( = ?auto_155123 ?auto_155130 ) ) ( OBJ-AT ?auto_155128 ?auto_155123 ) ( not ( = ?auto_155128 ?auto_155126 ) ) ( OBJ-AT ?auto_155126 ?auto_155130 ) ( TRUCK-AT ?auto_155127 ?auto_155131 ) ( IN-CITY ?auto_155131 ?auto_155129 ) ( not ( = ?auto_155123 ?auto_155131 ) ) ( not ( = ?auto_155130 ?auto_155131 ) ) ( OBJ-AT ?auto_155124 ?auto_155123 ) ( OBJ-AT ?auto_155125 ?auto_155123 ) ( not ( = ?auto_155124 ?auto_155125 ) ) ( not ( = ?auto_155124 ?auto_155126 ) ) ( not ( = ?auto_155124 ?auto_155128 ) ) ( not ( = ?auto_155125 ?auto_155126 ) ) ( not ( = ?auto_155125 ?auto_155128 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155128 ?auto_155126 ?auto_155123 )
      ( DELIVER-3PKG-VERIFY ?auto_155124 ?auto_155125 ?auto_155126 ?auto_155123 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155146 - OBJ
      ?auto_155147 - OBJ
      ?auto_155148 - OBJ
      ?auto_155145 - LOCATION
    )
    :vars
    (
      ?auto_155152 - LOCATION
      ?auto_155151 - CITY
      ?auto_155150 - OBJ
      ?auto_155149 - TRUCK
      ?auto_155153 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155152 ?auto_155151 ) ( IN-CITY ?auto_155145 ?auto_155151 ) ( not ( = ?auto_155145 ?auto_155152 ) ) ( OBJ-AT ?auto_155150 ?auto_155145 ) ( not ( = ?auto_155150 ?auto_155147 ) ) ( OBJ-AT ?auto_155147 ?auto_155152 ) ( TRUCK-AT ?auto_155149 ?auto_155153 ) ( IN-CITY ?auto_155153 ?auto_155151 ) ( not ( = ?auto_155145 ?auto_155153 ) ) ( not ( = ?auto_155152 ?auto_155153 ) ) ( OBJ-AT ?auto_155146 ?auto_155145 ) ( OBJ-AT ?auto_155148 ?auto_155145 ) ( not ( = ?auto_155146 ?auto_155147 ) ) ( not ( = ?auto_155146 ?auto_155148 ) ) ( not ( = ?auto_155146 ?auto_155150 ) ) ( not ( = ?auto_155147 ?auto_155148 ) ) ( not ( = ?auto_155148 ?auto_155150 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155150 ?auto_155147 ?auto_155145 )
      ( DELIVER-3PKG-VERIFY ?auto_155146 ?auto_155147 ?auto_155148 ?auto_155145 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155266 - OBJ
      ?auto_155267 - OBJ
      ?auto_155268 - OBJ
      ?auto_155265 - LOCATION
    )
    :vars
    (
      ?auto_155272 - LOCATION
      ?auto_155271 - CITY
      ?auto_155270 - OBJ
      ?auto_155269 - TRUCK
      ?auto_155273 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155272 ?auto_155271 ) ( IN-CITY ?auto_155265 ?auto_155271 ) ( not ( = ?auto_155265 ?auto_155272 ) ) ( OBJ-AT ?auto_155270 ?auto_155265 ) ( not ( = ?auto_155270 ?auto_155266 ) ) ( OBJ-AT ?auto_155266 ?auto_155272 ) ( TRUCK-AT ?auto_155269 ?auto_155273 ) ( IN-CITY ?auto_155273 ?auto_155271 ) ( not ( = ?auto_155265 ?auto_155273 ) ) ( not ( = ?auto_155272 ?auto_155273 ) ) ( OBJ-AT ?auto_155267 ?auto_155265 ) ( OBJ-AT ?auto_155268 ?auto_155265 ) ( not ( = ?auto_155266 ?auto_155267 ) ) ( not ( = ?auto_155266 ?auto_155268 ) ) ( not ( = ?auto_155267 ?auto_155268 ) ) ( not ( = ?auto_155267 ?auto_155270 ) ) ( not ( = ?auto_155268 ?auto_155270 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155270 ?auto_155266 ?auto_155265 )
      ( DELIVER-3PKG-VERIFY ?auto_155266 ?auto_155267 ?auto_155268 ?auto_155265 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155363 - OBJ
      ?auto_155364 - OBJ
      ?auto_155365 - OBJ
      ?auto_155366 - OBJ
      ?auto_155362 - LOCATION
    )
    :vars
    (
      ?auto_155369 - LOCATION
      ?auto_155368 - CITY
      ?auto_155367 - TRUCK
      ?auto_155370 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155369 ?auto_155368 ) ( IN-CITY ?auto_155362 ?auto_155368 ) ( not ( = ?auto_155362 ?auto_155369 ) ) ( OBJ-AT ?auto_155364 ?auto_155362 ) ( not ( = ?auto_155364 ?auto_155366 ) ) ( OBJ-AT ?auto_155366 ?auto_155369 ) ( TRUCK-AT ?auto_155367 ?auto_155370 ) ( IN-CITY ?auto_155370 ?auto_155368 ) ( not ( = ?auto_155362 ?auto_155370 ) ) ( not ( = ?auto_155369 ?auto_155370 ) ) ( OBJ-AT ?auto_155363 ?auto_155362 ) ( OBJ-AT ?auto_155365 ?auto_155362 ) ( not ( = ?auto_155363 ?auto_155364 ) ) ( not ( = ?auto_155363 ?auto_155365 ) ) ( not ( = ?auto_155363 ?auto_155366 ) ) ( not ( = ?auto_155364 ?auto_155365 ) ) ( not ( = ?auto_155365 ?auto_155366 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155364 ?auto_155366 ?auto_155362 )
      ( DELIVER-4PKG-VERIFY ?auto_155363 ?auto_155364 ?auto_155365 ?auto_155366 ?auto_155362 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155399 - OBJ
      ?auto_155400 - OBJ
      ?auto_155401 - OBJ
      ?auto_155402 - OBJ
      ?auto_155398 - LOCATION
    )
    :vars
    (
      ?auto_155405 - LOCATION
      ?auto_155404 - CITY
      ?auto_155403 - TRUCK
      ?auto_155406 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155405 ?auto_155404 ) ( IN-CITY ?auto_155398 ?auto_155404 ) ( not ( = ?auto_155398 ?auto_155405 ) ) ( OBJ-AT ?auto_155400 ?auto_155398 ) ( not ( = ?auto_155400 ?auto_155401 ) ) ( OBJ-AT ?auto_155401 ?auto_155405 ) ( TRUCK-AT ?auto_155403 ?auto_155406 ) ( IN-CITY ?auto_155406 ?auto_155404 ) ( not ( = ?auto_155398 ?auto_155406 ) ) ( not ( = ?auto_155405 ?auto_155406 ) ) ( OBJ-AT ?auto_155399 ?auto_155398 ) ( OBJ-AT ?auto_155402 ?auto_155398 ) ( not ( = ?auto_155399 ?auto_155400 ) ) ( not ( = ?auto_155399 ?auto_155401 ) ) ( not ( = ?auto_155399 ?auto_155402 ) ) ( not ( = ?auto_155400 ?auto_155402 ) ) ( not ( = ?auto_155401 ?auto_155402 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155400 ?auto_155401 ?auto_155398 )
      ( DELIVER-4PKG-VERIFY ?auto_155399 ?auto_155400 ?auto_155401 ?auto_155402 ?auto_155398 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155426 - OBJ
      ?auto_155427 - OBJ
      ?auto_155428 - OBJ
      ?auto_155429 - OBJ
      ?auto_155425 - LOCATION
    )
    :vars
    (
      ?auto_155432 - LOCATION
      ?auto_155431 - CITY
      ?auto_155430 - TRUCK
      ?auto_155433 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155432 ?auto_155431 ) ( IN-CITY ?auto_155425 ?auto_155431 ) ( not ( = ?auto_155425 ?auto_155432 ) ) ( OBJ-AT ?auto_155428 ?auto_155425 ) ( not ( = ?auto_155428 ?auto_155429 ) ) ( OBJ-AT ?auto_155429 ?auto_155432 ) ( TRUCK-AT ?auto_155430 ?auto_155433 ) ( IN-CITY ?auto_155433 ?auto_155431 ) ( not ( = ?auto_155425 ?auto_155433 ) ) ( not ( = ?auto_155432 ?auto_155433 ) ) ( OBJ-AT ?auto_155426 ?auto_155425 ) ( OBJ-AT ?auto_155427 ?auto_155425 ) ( not ( = ?auto_155426 ?auto_155427 ) ) ( not ( = ?auto_155426 ?auto_155428 ) ) ( not ( = ?auto_155426 ?auto_155429 ) ) ( not ( = ?auto_155427 ?auto_155428 ) ) ( not ( = ?auto_155427 ?auto_155429 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155428 ?auto_155429 ?auto_155425 )
      ( DELIVER-4PKG-VERIFY ?auto_155426 ?auto_155427 ?auto_155428 ?auto_155429 ?auto_155425 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155561 - OBJ
      ?auto_155562 - OBJ
      ?auto_155563 - OBJ
      ?auto_155564 - OBJ
      ?auto_155560 - LOCATION
    )
    :vars
    (
      ?auto_155567 - LOCATION
      ?auto_155566 - CITY
      ?auto_155565 - TRUCK
      ?auto_155568 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155567 ?auto_155566 ) ( IN-CITY ?auto_155560 ?auto_155566 ) ( not ( = ?auto_155560 ?auto_155567 ) ) ( OBJ-AT ?auto_155563 ?auto_155560 ) ( not ( = ?auto_155563 ?auto_155562 ) ) ( OBJ-AT ?auto_155562 ?auto_155567 ) ( TRUCK-AT ?auto_155565 ?auto_155568 ) ( IN-CITY ?auto_155568 ?auto_155566 ) ( not ( = ?auto_155560 ?auto_155568 ) ) ( not ( = ?auto_155567 ?auto_155568 ) ) ( OBJ-AT ?auto_155561 ?auto_155560 ) ( OBJ-AT ?auto_155564 ?auto_155560 ) ( not ( = ?auto_155561 ?auto_155562 ) ) ( not ( = ?auto_155561 ?auto_155563 ) ) ( not ( = ?auto_155561 ?auto_155564 ) ) ( not ( = ?auto_155562 ?auto_155564 ) ) ( not ( = ?auto_155563 ?auto_155564 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155563 ?auto_155562 ?auto_155560 )
      ( DELIVER-4PKG-VERIFY ?auto_155561 ?auto_155562 ?auto_155563 ?auto_155564 ?auto_155560 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155768 - OBJ
      ?auto_155769 - OBJ
      ?auto_155770 - OBJ
      ?auto_155771 - OBJ
      ?auto_155767 - LOCATION
    )
    :vars
    (
      ?auto_155775 - LOCATION
      ?auto_155774 - CITY
      ?auto_155773 - OBJ
      ?auto_155772 - TRUCK
      ?auto_155776 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155775 ?auto_155774 ) ( IN-CITY ?auto_155767 ?auto_155774 ) ( not ( = ?auto_155767 ?auto_155775 ) ) ( OBJ-AT ?auto_155773 ?auto_155767 ) ( not ( = ?auto_155773 ?auto_155771 ) ) ( OBJ-AT ?auto_155771 ?auto_155775 ) ( TRUCK-AT ?auto_155772 ?auto_155776 ) ( IN-CITY ?auto_155776 ?auto_155774 ) ( not ( = ?auto_155767 ?auto_155776 ) ) ( not ( = ?auto_155775 ?auto_155776 ) ) ( OBJ-AT ?auto_155768 ?auto_155767 ) ( OBJ-AT ?auto_155769 ?auto_155767 ) ( OBJ-AT ?auto_155770 ?auto_155767 ) ( not ( = ?auto_155768 ?auto_155769 ) ) ( not ( = ?auto_155768 ?auto_155770 ) ) ( not ( = ?auto_155768 ?auto_155771 ) ) ( not ( = ?auto_155768 ?auto_155773 ) ) ( not ( = ?auto_155769 ?auto_155770 ) ) ( not ( = ?auto_155769 ?auto_155771 ) ) ( not ( = ?auto_155769 ?auto_155773 ) ) ( not ( = ?auto_155770 ?auto_155771 ) ) ( not ( = ?auto_155770 ?auto_155773 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155773 ?auto_155771 ?auto_155767 )
      ( DELIVER-4PKG-VERIFY ?auto_155768 ?auto_155769 ?auto_155770 ?auto_155771 ?auto_155767 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155788 - OBJ
      ?auto_155789 - OBJ
      ?auto_155790 - OBJ
      ?auto_155791 - OBJ
      ?auto_155787 - LOCATION
    )
    :vars
    (
      ?auto_155794 - LOCATION
      ?auto_155793 - CITY
      ?auto_155792 - TRUCK
      ?auto_155795 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155794 ?auto_155793 ) ( IN-CITY ?auto_155787 ?auto_155793 ) ( not ( = ?auto_155787 ?auto_155794 ) ) ( OBJ-AT ?auto_155791 ?auto_155787 ) ( not ( = ?auto_155791 ?auto_155790 ) ) ( OBJ-AT ?auto_155790 ?auto_155794 ) ( TRUCK-AT ?auto_155792 ?auto_155795 ) ( IN-CITY ?auto_155795 ?auto_155793 ) ( not ( = ?auto_155787 ?auto_155795 ) ) ( not ( = ?auto_155794 ?auto_155795 ) ) ( OBJ-AT ?auto_155788 ?auto_155787 ) ( OBJ-AT ?auto_155789 ?auto_155787 ) ( not ( = ?auto_155788 ?auto_155789 ) ) ( not ( = ?auto_155788 ?auto_155790 ) ) ( not ( = ?auto_155788 ?auto_155791 ) ) ( not ( = ?auto_155789 ?auto_155790 ) ) ( not ( = ?auto_155789 ?auto_155791 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155791 ?auto_155790 ?auto_155787 )
      ( DELIVER-4PKG-VERIFY ?auto_155788 ?auto_155789 ?auto_155790 ?auto_155791 ?auto_155787 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155797 - OBJ
      ?auto_155798 - OBJ
      ?auto_155799 - OBJ
      ?auto_155800 - OBJ
      ?auto_155796 - LOCATION
    )
    :vars
    (
      ?auto_155804 - LOCATION
      ?auto_155803 - CITY
      ?auto_155802 - OBJ
      ?auto_155801 - TRUCK
      ?auto_155805 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155804 ?auto_155803 ) ( IN-CITY ?auto_155796 ?auto_155803 ) ( not ( = ?auto_155796 ?auto_155804 ) ) ( OBJ-AT ?auto_155802 ?auto_155796 ) ( not ( = ?auto_155802 ?auto_155799 ) ) ( OBJ-AT ?auto_155799 ?auto_155804 ) ( TRUCK-AT ?auto_155801 ?auto_155805 ) ( IN-CITY ?auto_155805 ?auto_155803 ) ( not ( = ?auto_155796 ?auto_155805 ) ) ( not ( = ?auto_155804 ?auto_155805 ) ) ( OBJ-AT ?auto_155797 ?auto_155796 ) ( OBJ-AT ?auto_155798 ?auto_155796 ) ( OBJ-AT ?auto_155800 ?auto_155796 ) ( not ( = ?auto_155797 ?auto_155798 ) ) ( not ( = ?auto_155797 ?auto_155799 ) ) ( not ( = ?auto_155797 ?auto_155800 ) ) ( not ( = ?auto_155797 ?auto_155802 ) ) ( not ( = ?auto_155798 ?auto_155799 ) ) ( not ( = ?auto_155798 ?auto_155800 ) ) ( not ( = ?auto_155798 ?auto_155802 ) ) ( not ( = ?auto_155799 ?auto_155800 ) ) ( not ( = ?auto_155800 ?auto_155802 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155802 ?auto_155799 ?auto_155796 )
      ( DELIVER-4PKG-VERIFY ?auto_155797 ?auto_155798 ?auto_155799 ?auto_155800 ?auto_155796 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155940 - OBJ
      ?auto_155941 - OBJ
      ?auto_155942 - OBJ
      ?auto_155943 - OBJ
      ?auto_155939 - LOCATION
    )
    :vars
    (
      ?auto_155947 - LOCATION
      ?auto_155946 - CITY
      ?auto_155945 - OBJ
      ?auto_155944 - TRUCK
      ?auto_155948 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155947 ?auto_155946 ) ( IN-CITY ?auto_155939 ?auto_155946 ) ( not ( = ?auto_155939 ?auto_155947 ) ) ( OBJ-AT ?auto_155945 ?auto_155939 ) ( not ( = ?auto_155945 ?auto_155941 ) ) ( OBJ-AT ?auto_155941 ?auto_155947 ) ( TRUCK-AT ?auto_155944 ?auto_155948 ) ( IN-CITY ?auto_155948 ?auto_155946 ) ( not ( = ?auto_155939 ?auto_155948 ) ) ( not ( = ?auto_155947 ?auto_155948 ) ) ( OBJ-AT ?auto_155940 ?auto_155939 ) ( OBJ-AT ?auto_155942 ?auto_155939 ) ( OBJ-AT ?auto_155943 ?auto_155939 ) ( not ( = ?auto_155940 ?auto_155941 ) ) ( not ( = ?auto_155940 ?auto_155942 ) ) ( not ( = ?auto_155940 ?auto_155943 ) ) ( not ( = ?auto_155940 ?auto_155945 ) ) ( not ( = ?auto_155941 ?auto_155942 ) ) ( not ( = ?auto_155941 ?auto_155943 ) ) ( not ( = ?auto_155942 ?auto_155943 ) ) ( not ( = ?auto_155942 ?auto_155945 ) ) ( not ( = ?auto_155943 ?auto_155945 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155945 ?auto_155941 ?auto_155939 )
      ( DELIVER-4PKG-VERIFY ?auto_155940 ?auto_155941 ?auto_155942 ?auto_155943 ?auto_155939 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156436 - OBJ
      ?auto_156437 - OBJ
      ?auto_156438 - OBJ
      ?auto_156439 - OBJ
      ?auto_156435 - LOCATION
    )
    :vars
    (
      ?auto_156442 - LOCATION
      ?auto_156441 - CITY
      ?auto_156440 - TRUCK
      ?auto_156443 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156442 ?auto_156441 ) ( IN-CITY ?auto_156435 ?auto_156441 ) ( not ( = ?auto_156435 ?auto_156442 ) ) ( OBJ-AT ?auto_156437 ?auto_156435 ) ( not ( = ?auto_156437 ?auto_156436 ) ) ( OBJ-AT ?auto_156436 ?auto_156442 ) ( TRUCK-AT ?auto_156440 ?auto_156443 ) ( IN-CITY ?auto_156443 ?auto_156441 ) ( not ( = ?auto_156435 ?auto_156443 ) ) ( not ( = ?auto_156442 ?auto_156443 ) ) ( OBJ-AT ?auto_156438 ?auto_156435 ) ( OBJ-AT ?auto_156439 ?auto_156435 ) ( not ( = ?auto_156436 ?auto_156438 ) ) ( not ( = ?auto_156436 ?auto_156439 ) ) ( not ( = ?auto_156437 ?auto_156438 ) ) ( not ( = ?auto_156437 ?auto_156439 ) ) ( not ( = ?auto_156438 ?auto_156439 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156437 ?auto_156436 ?auto_156435 )
      ( DELIVER-4PKG-VERIFY ?auto_156436 ?auto_156437 ?auto_156438 ?auto_156439 ?auto_156435 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156544 - OBJ
      ?auto_156545 - OBJ
      ?auto_156546 - OBJ
      ?auto_156547 - OBJ
      ?auto_156543 - LOCATION
    )
    :vars
    (
      ?auto_156550 - LOCATION
      ?auto_156549 - CITY
      ?auto_156548 - TRUCK
      ?auto_156551 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156550 ?auto_156549 ) ( IN-CITY ?auto_156543 ?auto_156549 ) ( not ( = ?auto_156543 ?auto_156550 ) ) ( OBJ-AT ?auto_156547 ?auto_156543 ) ( not ( = ?auto_156547 ?auto_156544 ) ) ( OBJ-AT ?auto_156544 ?auto_156550 ) ( TRUCK-AT ?auto_156548 ?auto_156551 ) ( IN-CITY ?auto_156551 ?auto_156549 ) ( not ( = ?auto_156543 ?auto_156551 ) ) ( not ( = ?auto_156550 ?auto_156551 ) ) ( OBJ-AT ?auto_156545 ?auto_156543 ) ( OBJ-AT ?auto_156546 ?auto_156543 ) ( not ( = ?auto_156544 ?auto_156545 ) ) ( not ( = ?auto_156544 ?auto_156546 ) ) ( not ( = ?auto_156545 ?auto_156546 ) ) ( not ( = ?auto_156545 ?auto_156547 ) ) ( not ( = ?auto_156546 ?auto_156547 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156547 ?auto_156544 ?auto_156543 )
      ( DELIVER-4PKG-VERIFY ?auto_156544 ?auto_156545 ?auto_156546 ?auto_156547 ?auto_156543 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156589 - OBJ
      ?auto_156590 - OBJ
      ?auto_156591 - OBJ
      ?auto_156592 - OBJ
      ?auto_156588 - LOCATION
    )
    :vars
    (
      ?auto_156596 - LOCATION
      ?auto_156595 - CITY
      ?auto_156594 - OBJ
      ?auto_156593 - TRUCK
      ?auto_156597 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156596 ?auto_156595 ) ( IN-CITY ?auto_156588 ?auto_156595 ) ( not ( = ?auto_156588 ?auto_156596 ) ) ( OBJ-AT ?auto_156594 ?auto_156588 ) ( not ( = ?auto_156594 ?auto_156589 ) ) ( OBJ-AT ?auto_156589 ?auto_156596 ) ( TRUCK-AT ?auto_156593 ?auto_156597 ) ( IN-CITY ?auto_156597 ?auto_156595 ) ( not ( = ?auto_156588 ?auto_156597 ) ) ( not ( = ?auto_156596 ?auto_156597 ) ) ( OBJ-AT ?auto_156590 ?auto_156588 ) ( OBJ-AT ?auto_156591 ?auto_156588 ) ( OBJ-AT ?auto_156592 ?auto_156588 ) ( not ( = ?auto_156589 ?auto_156590 ) ) ( not ( = ?auto_156589 ?auto_156591 ) ) ( not ( = ?auto_156589 ?auto_156592 ) ) ( not ( = ?auto_156590 ?auto_156591 ) ) ( not ( = ?auto_156590 ?auto_156592 ) ) ( not ( = ?auto_156590 ?auto_156594 ) ) ( not ( = ?auto_156591 ?auto_156592 ) ) ( not ( = ?auto_156591 ?auto_156594 ) ) ( not ( = ?auto_156592 ?auto_156594 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156594 ?auto_156589 ?auto_156588 )
      ( DELIVER-4PKG-VERIFY ?auto_156589 ?auto_156590 ?auto_156591 ?auto_156592 ?auto_156588 ) )
  )

)

