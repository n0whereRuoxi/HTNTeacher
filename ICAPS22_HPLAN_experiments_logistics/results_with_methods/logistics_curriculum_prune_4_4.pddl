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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13614 - OBJ
      ?auto_13613 - LOCATION
    )
    :vars
    (
      ?auto_13616 - LOCATION
      ?auto_13617 - CITY
      ?auto_13615 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13616 ?auto_13617 ) ( IN-CITY ?auto_13613 ?auto_13617 ) ( not ( = ?auto_13613 ?auto_13616 ) ) ( OBJ-AT ?auto_13614 ?auto_13616 ) ( TRUCK-AT ?auto_13615 ?auto_13613 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13615 ?auto_13613 ?auto_13616 ?auto_13617 )
      ( !LOAD-TRUCK ?auto_13614 ?auto_13615 ?auto_13616 )
      ( !DRIVE-TRUCK ?auto_13615 ?auto_13616 ?auto_13613 ?auto_13617 )
      ( !UNLOAD-TRUCK ?auto_13614 ?auto_13615 ?auto_13613 )
      ( DELIVER-1PKG-VERIFY ?auto_13614 ?auto_13613 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13635 - OBJ
      ?auto_13636 - OBJ
      ?auto_13634 - LOCATION
    )
    :vars
    (
      ?auto_13639 - LOCATION
      ?auto_13638 - CITY
      ?auto_13637 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13639 ?auto_13638 ) ( IN-CITY ?auto_13634 ?auto_13638 ) ( not ( = ?auto_13634 ?auto_13639 ) ) ( OBJ-AT ?auto_13636 ?auto_13639 ) ( OBJ-AT ?auto_13635 ?auto_13639 ) ( TRUCK-AT ?auto_13637 ?auto_13634 ) ( not ( = ?auto_13635 ?auto_13636 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13635 ?auto_13634 )
      ( DELIVER-1PKG ?auto_13636 ?auto_13634 )
      ( DELIVER-2PKG-VERIFY ?auto_13635 ?auto_13636 ?auto_13634 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13743 - OBJ
      ?auto_13744 - OBJ
      ?auto_13745 - OBJ
      ?auto_13742 - LOCATION
    )
    :vars
    (
      ?auto_13746 - LOCATION
      ?auto_13747 - CITY
      ?auto_13749 - LOCATION
      ?auto_13748 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13746 ?auto_13747 ) ( IN-CITY ?auto_13742 ?auto_13747 ) ( not ( = ?auto_13742 ?auto_13746 ) ) ( OBJ-AT ?auto_13745 ?auto_13746 ) ( IN-CITY ?auto_13749 ?auto_13747 ) ( not ( = ?auto_13742 ?auto_13749 ) ) ( OBJ-AT ?auto_13744 ?auto_13749 ) ( OBJ-AT ?auto_13743 ?auto_13749 ) ( TRUCK-AT ?auto_13748 ?auto_13742 ) ( not ( = ?auto_13743 ?auto_13744 ) ) ( not ( = ?auto_13743 ?auto_13745 ) ) ( not ( = ?auto_13744 ?auto_13745 ) ) ( not ( = ?auto_13746 ?auto_13749 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13743 ?auto_13744 ?auto_13742 )
      ( DELIVER-1PKG ?auto_13745 ?auto_13742 )
      ( DELIVER-3PKG-VERIFY ?auto_13743 ?auto_13744 ?auto_13745 ?auto_13742 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13760 - OBJ
      ?auto_13761 - OBJ
      ?auto_13762 - OBJ
      ?auto_13759 - LOCATION
    )
    :vars
    (
      ?auto_13765 - LOCATION
      ?auto_13763 - CITY
      ?auto_13766 - LOCATION
      ?auto_13764 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13765 ?auto_13763 ) ( IN-CITY ?auto_13759 ?auto_13763 ) ( not ( = ?auto_13759 ?auto_13765 ) ) ( OBJ-AT ?auto_13761 ?auto_13765 ) ( IN-CITY ?auto_13766 ?auto_13763 ) ( not ( = ?auto_13759 ?auto_13766 ) ) ( OBJ-AT ?auto_13762 ?auto_13766 ) ( OBJ-AT ?auto_13760 ?auto_13766 ) ( TRUCK-AT ?auto_13764 ?auto_13759 ) ( not ( = ?auto_13760 ?auto_13762 ) ) ( not ( = ?auto_13760 ?auto_13761 ) ) ( not ( = ?auto_13762 ?auto_13761 ) ) ( not ( = ?auto_13765 ?auto_13766 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_13760 ?auto_13762 ?auto_13761 ?auto_13759 )
      ( DELIVER-3PKG-VERIFY ?auto_13760 ?auto_13761 ?auto_13762 ?auto_13759 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13821 - OBJ
      ?auto_13822 - OBJ
      ?auto_13823 - OBJ
      ?auto_13820 - LOCATION
    )
    :vars
    (
      ?auto_13827 - LOCATION
      ?auto_13824 - CITY
      ?auto_13825 - LOCATION
      ?auto_13826 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13827 ?auto_13824 ) ( IN-CITY ?auto_13820 ?auto_13824 ) ( not ( = ?auto_13820 ?auto_13827 ) ) ( OBJ-AT ?auto_13821 ?auto_13827 ) ( IN-CITY ?auto_13825 ?auto_13824 ) ( not ( = ?auto_13820 ?auto_13825 ) ) ( OBJ-AT ?auto_13823 ?auto_13825 ) ( OBJ-AT ?auto_13822 ?auto_13825 ) ( TRUCK-AT ?auto_13826 ?auto_13820 ) ( not ( = ?auto_13822 ?auto_13823 ) ) ( not ( = ?auto_13822 ?auto_13821 ) ) ( not ( = ?auto_13823 ?auto_13821 ) ) ( not ( = ?auto_13827 ?auto_13825 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_13822 ?auto_13821 ?auto_13823 ?auto_13820 )
      ( DELIVER-3PKG-VERIFY ?auto_13821 ?auto_13822 ?auto_13823 ?auto_13820 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14863 - OBJ
      ?auto_14864 - OBJ
      ?auto_14865 - OBJ
      ?auto_14866 - OBJ
      ?auto_14862 - LOCATION
    )
    :vars
    (
      ?auto_14868 - LOCATION
      ?auto_14869 - CITY
      ?auto_14870 - LOCATION
      ?auto_14867 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14868 ?auto_14869 ) ( IN-CITY ?auto_14862 ?auto_14869 ) ( not ( = ?auto_14862 ?auto_14868 ) ) ( OBJ-AT ?auto_14866 ?auto_14868 ) ( IN-CITY ?auto_14870 ?auto_14869 ) ( not ( = ?auto_14862 ?auto_14870 ) ) ( OBJ-AT ?auto_14865 ?auto_14870 ) ( OBJ-AT ?auto_14864 ?auto_14868 ) ( OBJ-AT ?auto_14863 ?auto_14868 ) ( TRUCK-AT ?auto_14867 ?auto_14862 ) ( not ( = ?auto_14863 ?auto_14864 ) ) ( not ( = ?auto_14863 ?auto_14865 ) ) ( not ( = ?auto_14864 ?auto_14865 ) ) ( not ( = ?auto_14870 ?auto_14868 ) ) ( not ( = ?auto_14863 ?auto_14866 ) ) ( not ( = ?auto_14864 ?auto_14866 ) ) ( not ( = ?auto_14865 ?auto_14866 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_14863 ?auto_14865 ?auto_14864 ?auto_14862 )
      ( DELIVER-1PKG ?auto_14866 ?auto_14862 )
      ( DELIVER-4PKG-VERIFY ?auto_14863 ?auto_14864 ?auto_14865 ?auto_14866 ?auto_14862 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14892 - OBJ
      ?auto_14893 - OBJ
      ?auto_14894 - OBJ
      ?auto_14895 - OBJ
      ?auto_14891 - LOCATION
    )
    :vars
    (
      ?auto_14896 - LOCATION
      ?auto_14897 - CITY
      ?auto_14899 - LOCATION
      ?auto_14898 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14896 ?auto_14897 ) ( IN-CITY ?auto_14891 ?auto_14897 ) ( not ( = ?auto_14891 ?auto_14896 ) ) ( OBJ-AT ?auto_14894 ?auto_14896 ) ( IN-CITY ?auto_14899 ?auto_14897 ) ( not ( = ?auto_14891 ?auto_14899 ) ) ( OBJ-AT ?auto_14895 ?auto_14899 ) ( OBJ-AT ?auto_14893 ?auto_14896 ) ( OBJ-AT ?auto_14892 ?auto_14896 ) ( TRUCK-AT ?auto_14898 ?auto_14891 ) ( not ( = ?auto_14892 ?auto_14893 ) ) ( not ( = ?auto_14892 ?auto_14895 ) ) ( not ( = ?auto_14893 ?auto_14895 ) ) ( not ( = ?auto_14899 ?auto_14896 ) ) ( not ( = ?auto_14892 ?auto_14894 ) ) ( not ( = ?auto_14893 ?auto_14894 ) ) ( not ( = ?auto_14895 ?auto_14894 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_14892 ?auto_14893 ?auto_14895 ?auto_14894 ?auto_14891 )
      ( DELIVER-4PKG-VERIFY ?auto_14892 ?auto_14893 ?auto_14894 ?auto_14895 ?auto_14891 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14921 - OBJ
      ?auto_14922 - OBJ
      ?auto_14923 - OBJ
      ?auto_14924 - OBJ
      ?auto_14920 - LOCATION
    )
    :vars
    (
      ?auto_14925 - LOCATION
      ?auto_14927 - CITY
      ?auto_14926 - LOCATION
      ?auto_14928 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14925 ?auto_14927 ) ( IN-CITY ?auto_14920 ?auto_14927 ) ( not ( = ?auto_14920 ?auto_14925 ) ) ( OBJ-AT ?auto_14924 ?auto_14925 ) ( IN-CITY ?auto_14926 ?auto_14927 ) ( not ( = ?auto_14920 ?auto_14926 ) ) ( OBJ-AT ?auto_14922 ?auto_14926 ) ( OBJ-AT ?auto_14923 ?auto_14925 ) ( OBJ-AT ?auto_14921 ?auto_14925 ) ( TRUCK-AT ?auto_14928 ?auto_14920 ) ( not ( = ?auto_14921 ?auto_14923 ) ) ( not ( = ?auto_14921 ?auto_14922 ) ) ( not ( = ?auto_14923 ?auto_14922 ) ) ( not ( = ?auto_14926 ?auto_14925 ) ) ( not ( = ?auto_14921 ?auto_14924 ) ) ( not ( = ?auto_14923 ?auto_14924 ) ) ( not ( = ?auto_14922 ?auto_14924 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_14921 ?auto_14923 ?auto_14924 ?auto_14922 ?auto_14920 )
      ( DELIVER-4PKG-VERIFY ?auto_14921 ?auto_14922 ?auto_14923 ?auto_14924 ?auto_14920 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15486 - OBJ
      ?auto_15487 - OBJ
      ?auto_15488 - OBJ
      ?auto_15489 - OBJ
      ?auto_15485 - LOCATION
    )
    :vars
    (
      ?auto_15490 - LOCATION
      ?auto_15492 - CITY
      ?auto_15491 - LOCATION
      ?auto_15493 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15490 ?auto_15492 ) ( IN-CITY ?auto_15485 ?auto_15492 ) ( not ( = ?auto_15485 ?auto_15490 ) ) ( OBJ-AT ?auto_15489 ?auto_15490 ) ( IN-CITY ?auto_15491 ?auto_15492 ) ( not ( = ?auto_15485 ?auto_15491 ) ) ( OBJ-AT ?auto_15486 ?auto_15491 ) ( OBJ-AT ?auto_15488 ?auto_15490 ) ( OBJ-AT ?auto_15487 ?auto_15490 ) ( TRUCK-AT ?auto_15493 ?auto_15485 ) ( not ( = ?auto_15487 ?auto_15488 ) ) ( not ( = ?auto_15487 ?auto_15486 ) ) ( not ( = ?auto_15488 ?auto_15486 ) ) ( not ( = ?auto_15491 ?auto_15490 ) ) ( not ( = ?auto_15487 ?auto_15489 ) ) ( not ( = ?auto_15488 ?auto_15489 ) ) ( not ( = ?auto_15486 ?auto_15489 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15487 ?auto_15488 ?auto_15489 ?auto_15486 ?auto_15485 )
      ( DELIVER-4PKG-VERIFY ?auto_15486 ?auto_15487 ?auto_15488 ?auto_15489 ?auto_15485 ) )
  )

)

