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
      ?auto_7572 - OBJ
      ?auto_7571 - LOCATION
    )
    :vars
    (
      ?auto_7573 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7573 ?auto_7571 ) ( IN-TRUCK ?auto_7572 ?auto_7573 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_7572 ?auto_7573 ?auto_7571 )
      ( DELIVER-1PKG-VERIFY ?auto_7572 ?auto_7571 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7584 - OBJ
      ?auto_7583 - LOCATION
    )
    :vars
    (
      ?auto_7585 - TRUCK
      ?auto_7586 - LOCATION
      ?auto_7587 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7584 ?auto_7585 ) ( TRUCK-AT ?auto_7585 ?auto_7586 ) ( IN-CITY ?auto_7586 ?auto_7587 ) ( IN-CITY ?auto_7583 ?auto_7587 ) ( not ( = ?auto_7583 ?auto_7586 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7585 ?auto_7586 ?auto_7583 ?auto_7587 )
      ( DELIVER-1PKG ?auto_7584 ?auto_7583 )
      ( DELIVER-1PKG-VERIFY ?auto_7584 ?auto_7583 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7602 - OBJ
      ?auto_7601 - LOCATION
    )
    :vars
    (
      ?auto_7604 - TRUCK
      ?auto_7603 - LOCATION
      ?auto_7605 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7604 ?auto_7603 ) ( IN-CITY ?auto_7603 ?auto_7605 ) ( IN-CITY ?auto_7601 ?auto_7605 ) ( not ( = ?auto_7601 ?auto_7603 ) ) ( OBJ-AT ?auto_7602 ?auto_7603 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7602 ?auto_7604 ?auto_7603 )
      ( DELIVER-1PKG ?auto_7602 ?auto_7601 )
      ( DELIVER-1PKG-VERIFY ?auto_7602 ?auto_7601 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7620 - OBJ
      ?auto_7619 - LOCATION
    )
    :vars
    (
      ?auto_7622 - LOCATION
      ?auto_7623 - CITY
      ?auto_7621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7622 ?auto_7623 ) ( IN-CITY ?auto_7619 ?auto_7623 ) ( not ( = ?auto_7619 ?auto_7622 ) ) ( OBJ-AT ?auto_7620 ?auto_7622 ) ( TRUCK-AT ?auto_7621 ?auto_7619 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7621 ?auto_7619 ?auto_7622 ?auto_7623 )
      ( DELIVER-1PKG ?auto_7620 ?auto_7619 )
      ( DELIVER-1PKG-VERIFY ?auto_7620 ?auto_7619 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7677 - OBJ
      ?auto_7676 - LOCATION
    )
    :vars
    (
      ?auto_7678 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7678 ?auto_7676 ) ( IN-TRUCK ?auto_7677 ?auto_7678 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_7677 ?auto_7678 ?auto_7676 )
      ( DELIVER-1PKG-VERIFY ?auto_7677 ?auto_7676 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7680 - OBJ
      ?auto_7681 - OBJ
      ?auto_7679 - LOCATION
    )
    :vars
    (
      ?auto_7682 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7681 ?auto_7680 ) ) ( TRUCK-AT ?auto_7682 ?auto_7679 ) ( IN-TRUCK ?auto_7681 ?auto_7682 ) ( OBJ-AT ?auto_7680 ?auto_7679 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7681 ?auto_7679 )
      ( DELIVER-2PKG-VERIFY ?auto_7680 ?auto_7681 ?auto_7679 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7684 - OBJ
      ?auto_7685 - OBJ
      ?auto_7683 - LOCATION
    )
    :vars
    (
      ?auto_7686 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7685 ?auto_7684 ) ) ( TRUCK-AT ?auto_7686 ?auto_7683 ) ( IN-TRUCK ?auto_7684 ?auto_7686 ) ( OBJ-AT ?auto_7685 ?auto_7683 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7684 ?auto_7683 )
      ( DELIVER-2PKG-VERIFY ?auto_7684 ?auto_7685 ?auto_7683 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7727 - OBJ
      ?auto_7726 - LOCATION
    )
    :vars
    (
      ?auto_7728 - TRUCK
      ?auto_7729 - LOCATION
      ?auto_7730 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7727 ?auto_7728 ) ( TRUCK-AT ?auto_7728 ?auto_7729 ) ( IN-CITY ?auto_7729 ?auto_7730 ) ( IN-CITY ?auto_7726 ?auto_7730 ) ( not ( = ?auto_7726 ?auto_7729 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7728 ?auto_7729 ?auto_7726 ?auto_7730 )
      ( DELIVER-1PKG ?auto_7727 ?auto_7726 )
      ( DELIVER-1PKG-VERIFY ?auto_7727 ?auto_7726 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7732 - OBJ
      ?auto_7733 - OBJ
      ?auto_7731 - LOCATION
    )
    :vars
    (
      ?auto_7734 - TRUCK
      ?auto_7736 - LOCATION
      ?auto_7735 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_7733 ?auto_7732 ) ) ( IN-TRUCK ?auto_7733 ?auto_7734 ) ( TRUCK-AT ?auto_7734 ?auto_7736 ) ( IN-CITY ?auto_7736 ?auto_7735 ) ( IN-CITY ?auto_7731 ?auto_7735 ) ( not ( = ?auto_7731 ?auto_7736 ) ) ( OBJ-AT ?auto_7732 ?auto_7731 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7733 ?auto_7731 )
      ( DELIVER-2PKG-VERIFY ?auto_7732 ?auto_7733 ?auto_7731 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7738 - OBJ
      ?auto_7739 - OBJ
      ?auto_7737 - LOCATION
    )
    :vars
    (
      ?auto_7741 - TRUCK
      ?auto_7742 - LOCATION
      ?auto_7740 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_7739 ?auto_7738 ) ) ( IN-TRUCK ?auto_7738 ?auto_7741 ) ( TRUCK-AT ?auto_7741 ?auto_7742 ) ( IN-CITY ?auto_7742 ?auto_7740 ) ( IN-CITY ?auto_7737 ?auto_7740 ) ( not ( = ?auto_7737 ?auto_7742 ) ) ( OBJ-AT ?auto_7739 ?auto_7737 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7739 ?auto_7738 ?auto_7737 )
      ( DELIVER-2PKG-VERIFY ?auto_7738 ?auto_7739 ?auto_7737 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7801 - OBJ
      ?auto_7800 - LOCATION
    )
    :vars
    (
      ?auto_7804 - OBJ
      ?auto_7803 - TRUCK
      ?auto_7805 - LOCATION
      ?auto_7802 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_7801 ?auto_7804 ) ) ( TRUCK-AT ?auto_7803 ?auto_7805 ) ( IN-CITY ?auto_7805 ?auto_7802 ) ( IN-CITY ?auto_7800 ?auto_7802 ) ( not ( = ?auto_7800 ?auto_7805 ) ) ( OBJ-AT ?auto_7804 ?auto_7800 ) ( OBJ-AT ?auto_7801 ?auto_7805 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7801 ?auto_7803 ?auto_7805 )
      ( DELIVER-2PKG ?auto_7804 ?auto_7801 ?auto_7800 )
      ( DELIVER-1PKG-VERIFY ?auto_7801 ?auto_7800 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7807 - OBJ
      ?auto_7808 - OBJ
      ?auto_7806 - LOCATION
    )
    :vars
    (
      ?auto_7810 - TRUCK
      ?auto_7811 - LOCATION
      ?auto_7809 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_7808 ?auto_7807 ) ) ( TRUCK-AT ?auto_7810 ?auto_7811 ) ( IN-CITY ?auto_7811 ?auto_7809 ) ( IN-CITY ?auto_7806 ?auto_7809 ) ( not ( = ?auto_7806 ?auto_7811 ) ) ( OBJ-AT ?auto_7807 ?auto_7806 ) ( OBJ-AT ?auto_7808 ?auto_7811 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7808 ?auto_7806 )
      ( DELIVER-2PKG-VERIFY ?auto_7807 ?auto_7808 ?auto_7806 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7813 - OBJ
      ?auto_7814 - OBJ
      ?auto_7812 - LOCATION
    )
    :vars
    (
      ?auto_7816 - TRUCK
      ?auto_7817 - LOCATION
      ?auto_7815 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_7814 ?auto_7813 ) ) ( TRUCK-AT ?auto_7816 ?auto_7817 ) ( IN-CITY ?auto_7817 ?auto_7815 ) ( IN-CITY ?auto_7812 ?auto_7815 ) ( not ( = ?auto_7812 ?auto_7817 ) ) ( OBJ-AT ?auto_7814 ?auto_7812 ) ( OBJ-AT ?auto_7813 ?auto_7817 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7814 ?auto_7813 ?auto_7812 )
      ( DELIVER-2PKG-VERIFY ?auto_7813 ?auto_7814 ?auto_7812 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7876 - OBJ
      ?auto_7875 - LOCATION
    )
    :vars
    (
      ?auto_7879 - OBJ
      ?auto_7880 - LOCATION
      ?auto_7877 - CITY
      ?auto_7878 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7876 ?auto_7879 ) ) ( IN-CITY ?auto_7880 ?auto_7877 ) ( IN-CITY ?auto_7875 ?auto_7877 ) ( not ( = ?auto_7875 ?auto_7880 ) ) ( OBJ-AT ?auto_7879 ?auto_7875 ) ( OBJ-AT ?auto_7876 ?auto_7880 ) ( TRUCK-AT ?auto_7878 ?auto_7875 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7878 ?auto_7875 ?auto_7880 ?auto_7877 )
      ( DELIVER-2PKG ?auto_7879 ?auto_7876 ?auto_7875 )
      ( DELIVER-1PKG-VERIFY ?auto_7876 ?auto_7875 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7882 - OBJ
      ?auto_7883 - OBJ
      ?auto_7881 - LOCATION
    )
    :vars
    (
      ?auto_7886 - LOCATION
      ?auto_7884 - CITY
      ?auto_7885 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7883 ?auto_7882 ) ) ( IN-CITY ?auto_7886 ?auto_7884 ) ( IN-CITY ?auto_7881 ?auto_7884 ) ( not ( = ?auto_7881 ?auto_7886 ) ) ( OBJ-AT ?auto_7882 ?auto_7881 ) ( OBJ-AT ?auto_7883 ?auto_7886 ) ( TRUCK-AT ?auto_7885 ?auto_7881 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7883 ?auto_7881 )
      ( DELIVER-2PKG-VERIFY ?auto_7882 ?auto_7883 ?auto_7881 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7888 - OBJ
      ?auto_7889 - OBJ
      ?auto_7887 - LOCATION
    )
    :vars
    (
      ?auto_7892 - LOCATION
      ?auto_7890 - CITY
      ?auto_7891 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7889 ?auto_7888 ) ) ( IN-CITY ?auto_7892 ?auto_7890 ) ( IN-CITY ?auto_7887 ?auto_7890 ) ( not ( = ?auto_7887 ?auto_7892 ) ) ( OBJ-AT ?auto_7889 ?auto_7887 ) ( OBJ-AT ?auto_7888 ?auto_7892 ) ( TRUCK-AT ?auto_7891 ?auto_7887 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7889 ?auto_7888 ?auto_7887 )
      ( DELIVER-2PKG-VERIFY ?auto_7888 ?auto_7889 ?auto_7887 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7951 - OBJ
      ?auto_7950 - LOCATION
    )
    :vars
    (
      ?auto_7952 - OBJ
      ?auto_7955 - LOCATION
      ?auto_7953 - CITY
      ?auto_7954 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7951 ?auto_7952 ) ) ( IN-CITY ?auto_7955 ?auto_7953 ) ( IN-CITY ?auto_7950 ?auto_7953 ) ( not ( = ?auto_7950 ?auto_7955 ) ) ( OBJ-AT ?auto_7951 ?auto_7955 ) ( TRUCK-AT ?auto_7954 ?auto_7950 ) ( IN-TRUCK ?auto_7952 ?auto_7954 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7952 ?auto_7950 )
      ( DELIVER-2PKG ?auto_7952 ?auto_7951 ?auto_7950 )
      ( DELIVER-1PKG-VERIFY ?auto_7951 ?auto_7950 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7957 - OBJ
      ?auto_7958 - OBJ
      ?auto_7956 - LOCATION
    )
    :vars
    (
      ?auto_7961 - LOCATION
      ?auto_7960 - CITY
      ?auto_7959 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7958 ?auto_7957 ) ) ( IN-CITY ?auto_7961 ?auto_7960 ) ( IN-CITY ?auto_7956 ?auto_7960 ) ( not ( = ?auto_7956 ?auto_7961 ) ) ( OBJ-AT ?auto_7958 ?auto_7961 ) ( TRUCK-AT ?auto_7959 ?auto_7956 ) ( IN-TRUCK ?auto_7957 ?auto_7959 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7958 ?auto_7956 )
      ( DELIVER-2PKG-VERIFY ?auto_7957 ?auto_7958 ?auto_7956 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7963 - OBJ
      ?auto_7964 - OBJ
      ?auto_7962 - LOCATION
    )
    :vars
    (
      ?auto_7965 - LOCATION
      ?auto_7967 - CITY
      ?auto_7966 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_7964 ?auto_7963 ) ) ( IN-CITY ?auto_7965 ?auto_7967 ) ( IN-CITY ?auto_7962 ?auto_7967 ) ( not ( = ?auto_7962 ?auto_7965 ) ) ( OBJ-AT ?auto_7963 ?auto_7965 ) ( TRUCK-AT ?auto_7966 ?auto_7962 ) ( IN-TRUCK ?auto_7964 ?auto_7966 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7964 ?auto_7963 ?auto_7962 )
      ( DELIVER-2PKG-VERIFY ?auto_7963 ?auto_7964 ?auto_7962 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8026 - OBJ
      ?auto_8025 - LOCATION
    )
    :vars
    (
      ?auto_8029 - OBJ
      ?auto_8027 - LOCATION
      ?auto_8030 - CITY
      ?auto_8028 - TRUCK
      ?auto_8031 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_8026 ?auto_8029 ) ) ( IN-CITY ?auto_8027 ?auto_8030 ) ( IN-CITY ?auto_8025 ?auto_8030 ) ( not ( = ?auto_8025 ?auto_8027 ) ) ( OBJ-AT ?auto_8026 ?auto_8027 ) ( IN-TRUCK ?auto_8029 ?auto_8028 ) ( TRUCK-AT ?auto_8028 ?auto_8031 ) ( IN-CITY ?auto_8031 ?auto_8030 ) ( not ( = ?auto_8025 ?auto_8031 ) ) ( not ( = ?auto_8027 ?auto_8031 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8028 ?auto_8031 ?auto_8025 ?auto_8030 )
      ( DELIVER-2PKG ?auto_8029 ?auto_8026 ?auto_8025 )
      ( DELIVER-1PKG-VERIFY ?auto_8026 ?auto_8025 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8033 - OBJ
      ?auto_8034 - OBJ
      ?auto_8032 - LOCATION
    )
    :vars
    (
      ?auto_8037 - LOCATION
      ?auto_8036 - CITY
      ?auto_8038 - TRUCK
      ?auto_8035 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_8034 ?auto_8033 ) ) ( IN-CITY ?auto_8037 ?auto_8036 ) ( IN-CITY ?auto_8032 ?auto_8036 ) ( not ( = ?auto_8032 ?auto_8037 ) ) ( OBJ-AT ?auto_8034 ?auto_8037 ) ( IN-TRUCK ?auto_8033 ?auto_8038 ) ( TRUCK-AT ?auto_8038 ?auto_8035 ) ( IN-CITY ?auto_8035 ?auto_8036 ) ( not ( = ?auto_8032 ?auto_8035 ) ) ( not ( = ?auto_8037 ?auto_8035 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8034 ?auto_8032 )
      ( DELIVER-2PKG-VERIFY ?auto_8033 ?auto_8034 ?auto_8032 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8040 - OBJ
      ?auto_8041 - OBJ
      ?auto_8039 - LOCATION
    )
    :vars
    (
      ?auto_8045 - LOCATION
      ?auto_8043 - CITY
      ?auto_8044 - TRUCK
      ?auto_8042 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_8041 ?auto_8040 ) ) ( IN-CITY ?auto_8045 ?auto_8043 ) ( IN-CITY ?auto_8039 ?auto_8043 ) ( not ( = ?auto_8039 ?auto_8045 ) ) ( OBJ-AT ?auto_8040 ?auto_8045 ) ( IN-TRUCK ?auto_8041 ?auto_8044 ) ( TRUCK-AT ?auto_8044 ?auto_8042 ) ( IN-CITY ?auto_8042 ?auto_8043 ) ( not ( = ?auto_8039 ?auto_8042 ) ) ( not ( = ?auto_8045 ?auto_8042 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8041 ?auto_8040 ?auto_8039 )
      ( DELIVER-2PKG-VERIFY ?auto_8040 ?auto_8041 ?auto_8039 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8112 - OBJ
      ?auto_8111 - LOCATION
    )
    :vars
    (
      ?auto_8114 - OBJ
      ?auto_8117 - LOCATION
      ?auto_8115 - CITY
      ?auto_8116 - TRUCK
      ?auto_8113 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_8112 ?auto_8114 ) ) ( IN-CITY ?auto_8117 ?auto_8115 ) ( IN-CITY ?auto_8111 ?auto_8115 ) ( not ( = ?auto_8111 ?auto_8117 ) ) ( OBJ-AT ?auto_8112 ?auto_8117 ) ( TRUCK-AT ?auto_8116 ?auto_8113 ) ( IN-CITY ?auto_8113 ?auto_8115 ) ( not ( = ?auto_8111 ?auto_8113 ) ) ( not ( = ?auto_8117 ?auto_8113 ) ) ( OBJ-AT ?auto_8114 ?auto_8113 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8114 ?auto_8116 ?auto_8113 )
      ( DELIVER-2PKG ?auto_8114 ?auto_8112 ?auto_8111 )
      ( DELIVER-1PKG-VERIFY ?auto_8112 ?auto_8111 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8119 - OBJ
      ?auto_8120 - OBJ
      ?auto_8118 - LOCATION
    )
    :vars
    (
      ?auto_8124 - LOCATION
      ?auto_8121 - CITY
      ?auto_8123 - TRUCK
      ?auto_8122 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_8120 ?auto_8119 ) ) ( IN-CITY ?auto_8124 ?auto_8121 ) ( IN-CITY ?auto_8118 ?auto_8121 ) ( not ( = ?auto_8118 ?auto_8124 ) ) ( OBJ-AT ?auto_8120 ?auto_8124 ) ( TRUCK-AT ?auto_8123 ?auto_8122 ) ( IN-CITY ?auto_8122 ?auto_8121 ) ( not ( = ?auto_8118 ?auto_8122 ) ) ( not ( = ?auto_8124 ?auto_8122 ) ) ( OBJ-AT ?auto_8119 ?auto_8122 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8120 ?auto_8118 )
      ( DELIVER-2PKG-VERIFY ?auto_8119 ?auto_8120 ?auto_8118 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8126 - OBJ
      ?auto_8127 - OBJ
      ?auto_8125 - LOCATION
    )
    :vars
    (
      ?auto_8130 - LOCATION
      ?auto_8128 - CITY
      ?auto_8131 - TRUCK
      ?auto_8129 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_8127 ?auto_8126 ) ) ( IN-CITY ?auto_8130 ?auto_8128 ) ( IN-CITY ?auto_8125 ?auto_8128 ) ( not ( = ?auto_8125 ?auto_8130 ) ) ( OBJ-AT ?auto_8126 ?auto_8130 ) ( TRUCK-AT ?auto_8131 ?auto_8129 ) ( IN-CITY ?auto_8129 ?auto_8128 ) ( not ( = ?auto_8125 ?auto_8129 ) ) ( not ( = ?auto_8130 ?auto_8129 ) ) ( OBJ-AT ?auto_8127 ?auto_8129 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8127 ?auto_8126 ?auto_8125 )
      ( DELIVER-2PKG-VERIFY ?auto_8126 ?auto_8127 ?auto_8125 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8198 - OBJ
      ?auto_8197 - LOCATION
    )
    :vars
    (
      ?auto_8200 - OBJ
      ?auto_8202 - LOCATION
      ?auto_8199 - CITY
      ?auto_8201 - LOCATION
      ?auto_8203 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8198 ?auto_8200 ) ) ( IN-CITY ?auto_8202 ?auto_8199 ) ( IN-CITY ?auto_8197 ?auto_8199 ) ( not ( = ?auto_8197 ?auto_8202 ) ) ( OBJ-AT ?auto_8198 ?auto_8202 ) ( IN-CITY ?auto_8201 ?auto_8199 ) ( not ( = ?auto_8197 ?auto_8201 ) ) ( not ( = ?auto_8202 ?auto_8201 ) ) ( OBJ-AT ?auto_8200 ?auto_8201 ) ( TRUCK-AT ?auto_8203 ?auto_8197 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8203 ?auto_8197 ?auto_8201 ?auto_8199 )
      ( DELIVER-2PKG ?auto_8200 ?auto_8198 ?auto_8197 )
      ( DELIVER-1PKG-VERIFY ?auto_8198 ?auto_8197 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8205 - OBJ
      ?auto_8206 - OBJ
      ?auto_8204 - LOCATION
    )
    :vars
    (
      ?auto_8210 - LOCATION
      ?auto_8209 - CITY
      ?auto_8208 - LOCATION
      ?auto_8207 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8206 ?auto_8205 ) ) ( IN-CITY ?auto_8210 ?auto_8209 ) ( IN-CITY ?auto_8204 ?auto_8209 ) ( not ( = ?auto_8204 ?auto_8210 ) ) ( OBJ-AT ?auto_8206 ?auto_8210 ) ( IN-CITY ?auto_8208 ?auto_8209 ) ( not ( = ?auto_8204 ?auto_8208 ) ) ( not ( = ?auto_8210 ?auto_8208 ) ) ( OBJ-AT ?auto_8205 ?auto_8208 ) ( TRUCK-AT ?auto_8207 ?auto_8204 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8206 ?auto_8204 )
      ( DELIVER-2PKG-VERIFY ?auto_8205 ?auto_8206 ?auto_8204 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8212 - OBJ
      ?auto_8213 - OBJ
      ?auto_8211 - LOCATION
    )
    :vars
    (
      ?auto_8214 - LOCATION
      ?auto_8217 - CITY
      ?auto_8215 - LOCATION
      ?auto_8216 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8213 ?auto_8212 ) ) ( IN-CITY ?auto_8214 ?auto_8217 ) ( IN-CITY ?auto_8211 ?auto_8217 ) ( not ( = ?auto_8211 ?auto_8214 ) ) ( OBJ-AT ?auto_8212 ?auto_8214 ) ( IN-CITY ?auto_8215 ?auto_8217 ) ( not ( = ?auto_8211 ?auto_8215 ) ) ( not ( = ?auto_8214 ?auto_8215 ) ) ( OBJ-AT ?auto_8213 ?auto_8215 ) ( TRUCK-AT ?auto_8216 ?auto_8211 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8213 ?auto_8212 ?auto_8211 )
      ( DELIVER-2PKG-VERIFY ?auto_8212 ?auto_8213 ?auto_8211 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8377 - OBJ
      ?auto_8376 - LOCATION
    )
    :vars
    (
      ?auto_8378 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_8378 ?auto_8376 ) ( IN-TRUCK ?auto_8377 ?auto_8378 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_8377 ?auto_8378 ?auto_8376 )
      ( DELIVER-1PKG-VERIFY ?auto_8377 ?auto_8376 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8380 - OBJ
      ?auto_8381 - OBJ
      ?auto_8379 - LOCATION
    )
    :vars
    (
      ?auto_8382 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8381 ?auto_8380 ) ) ( TRUCK-AT ?auto_8382 ?auto_8379 ) ( IN-TRUCK ?auto_8381 ?auto_8382 ) ( OBJ-AT ?auto_8380 ?auto_8379 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8381 ?auto_8379 )
      ( DELIVER-2PKG-VERIFY ?auto_8380 ?auto_8381 ?auto_8379 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8384 - OBJ
      ?auto_8385 - OBJ
      ?auto_8383 - LOCATION
    )
    :vars
    (
      ?auto_8386 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8385 ?auto_8384 ) ) ( TRUCK-AT ?auto_8386 ?auto_8383 ) ( IN-TRUCK ?auto_8385 ?auto_8386 ) ( OBJ-AT ?auto_8384 ?auto_8383 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8385 ?auto_8383 )
      ( DELIVER-2PKG-VERIFY ?auto_8384 ?auto_8385 ?auto_8383 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8388 - OBJ
      ?auto_8389 - OBJ
      ?auto_8387 - LOCATION
    )
    :vars
    (
      ?auto_8390 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8389 ?auto_8388 ) ) ( TRUCK-AT ?auto_8390 ?auto_8387 ) ( IN-TRUCK ?auto_8388 ?auto_8390 ) ( OBJ-AT ?auto_8389 ?auto_8387 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8388 ?auto_8387 )
      ( DELIVER-2PKG-VERIFY ?auto_8388 ?auto_8389 ?auto_8387 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8392 - OBJ
      ?auto_8393 - OBJ
      ?auto_8391 - LOCATION
    )
    :vars
    (
      ?auto_8394 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8393 ?auto_8392 ) ) ( TRUCK-AT ?auto_8394 ?auto_8391 ) ( IN-TRUCK ?auto_8392 ?auto_8394 ) ( OBJ-AT ?auto_8393 ?auto_8391 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8392 ?auto_8391 )
      ( DELIVER-2PKG-VERIFY ?auto_8392 ?auto_8393 ?auto_8391 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8405 - OBJ
      ?auto_8406 - OBJ
      ?auto_8407 - OBJ
      ?auto_8404 - LOCATION
    )
    :vars
    (
      ?auto_8408 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8406 ?auto_8405 ) ) ( not ( = ?auto_8407 ?auto_8405 ) ) ( not ( = ?auto_8407 ?auto_8406 ) ) ( TRUCK-AT ?auto_8408 ?auto_8404 ) ( IN-TRUCK ?auto_8407 ?auto_8408 ) ( OBJ-AT ?auto_8405 ?auto_8404 ) ( OBJ-AT ?auto_8406 ?auto_8404 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8407 ?auto_8404 )
      ( DELIVER-3PKG-VERIFY ?auto_8405 ?auto_8406 ?auto_8407 ?auto_8404 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8415 - OBJ
      ?auto_8416 - OBJ
      ?auto_8417 - OBJ
      ?auto_8414 - LOCATION
    )
    :vars
    (
      ?auto_8418 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8416 ?auto_8415 ) ) ( not ( = ?auto_8417 ?auto_8415 ) ) ( not ( = ?auto_8417 ?auto_8416 ) ) ( TRUCK-AT ?auto_8418 ?auto_8414 ) ( IN-TRUCK ?auto_8416 ?auto_8418 ) ( OBJ-AT ?auto_8415 ?auto_8414 ) ( OBJ-AT ?auto_8417 ?auto_8414 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8416 ?auto_8414 )
      ( DELIVER-3PKG-VERIFY ?auto_8415 ?auto_8416 ?auto_8417 ?auto_8414 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8425 - OBJ
      ?auto_8426 - OBJ
      ?auto_8427 - OBJ
      ?auto_8424 - LOCATION
    )
    :vars
    (
      ?auto_8428 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8426 ?auto_8425 ) ) ( not ( = ?auto_8427 ?auto_8425 ) ) ( not ( = ?auto_8427 ?auto_8426 ) ) ( TRUCK-AT ?auto_8428 ?auto_8424 ) ( IN-TRUCK ?auto_8427 ?auto_8428 ) ( OBJ-AT ?auto_8425 ?auto_8424 ) ( OBJ-AT ?auto_8426 ?auto_8424 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8427 ?auto_8424 )
      ( DELIVER-3PKG-VERIFY ?auto_8425 ?auto_8426 ?auto_8427 ?auto_8424 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8435 - OBJ
      ?auto_8436 - OBJ
      ?auto_8437 - OBJ
      ?auto_8434 - LOCATION
    )
    :vars
    (
      ?auto_8438 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8436 ?auto_8435 ) ) ( not ( = ?auto_8437 ?auto_8435 ) ) ( not ( = ?auto_8437 ?auto_8436 ) ) ( TRUCK-AT ?auto_8438 ?auto_8434 ) ( IN-TRUCK ?auto_8436 ?auto_8438 ) ( OBJ-AT ?auto_8435 ?auto_8434 ) ( OBJ-AT ?auto_8437 ?auto_8434 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8436 ?auto_8434 )
      ( DELIVER-3PKG-VERIFY ?auto_8435 ?auto_8436 ?auto_8437 ?auto_8434 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8455 - OBJ
      ?auto_8456 - OBJ
      ?auto_8457 - OBJ
      ?auto_8454 - LOCATION
    )
    :vars
    (
      ?auto_8458 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8456 ?auto_8455 ) ) ( not ( = ?auto_8457 ?auto_8455 ) ) ( not ( = ?auto_8457 ?auto_8456 ) ) ( TRUCK-AT ?auto_8458 ?auto_8454 ) ( IN-TRUCK ?auto_8455 ?auto_8458 ) ( OBJ-AT ?auto_8456 ?auto_8454 ) ( OBJ-AT ?auto_8457 ?auto_8454 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8455 ?auto_8454 )
      ( DELIVER-3PKG-VERIFY ?auto_8455 ?auto_8456 ?auto_8457 ?auto_8454 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8465 - OBJ
      ?auto_8466 - OBJ
      ?auto_8467 - OBJ
      ?auto_8464 - LOCATION
    )
    :vars
    (
      ?auto_8468 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8466 ?auto_8465 ) ) ( not ( = ?auto_8467 ?auto_8465 ) ) ( not ( = ?auto_8467 ?auto_8466 ) ) ( TRUCK-AT ?auto_8468 ?auto_8464 ) ( IN-TRUCK ?auto_8465 ?auto_8468 ) ( OBJ-AT ?auto_8466 ?auto_8464 ) ( OBJ-AT ?auto_8467 ?auto_8464 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8465 ?auto_8464 )
      ( DELIVER-3PKG-VERIFY ?auto_8465 ?auto_8466 ?auto_8467 ?auto_8464 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8495 - OBJ
      ?auto_8494 - LOCATION
    )
    :vars
    (
      ?auto_8496 - TRUCK
      ?auto_8497 - LOCATION
      ?auto_8498 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_8495 ?auto_8496 ) ( TRUCK-AT ?auto_8496 ?auto_8497 ) ( IN-CITY ?auto_8497 ?auto_8498 ) ( IN-CITY ?auto_8494 ?auto_8498 ) ( not ( = ?auto_8494 ?auto_8497 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8496 ?auto_8497 ?auto_8494 ?auto_8498 )
      ( DELIVER-1PKG ?auto_8495 ?auto_8494 )
      ( DELIVER-1PKG-VERIFY ?auto_8495 ?auto_8494 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8500 - OBJ
      ?auto_8501 - OBJ
      ?auto_8499 - LOCATION
    )
    :vars
    (
      ?auto_8504 - TRUCK
      ?auto_8502 - LOCATION
      ?auto_8503 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8501 ?auto_8500 ) ) ( IN-TRUCK ?auto_8501 ?auto_8504 ) ( TRUCK-AT ?auto_8504 ?auto_8502 ) ( IN-CITY ?auto_8502 ?auto_8503 ) ( IN-CITY ?auto_8499 ?auto_8503 ) ( not ( = ?auto_8499 ?auto_8502 ) ) ( OBJ-AT ?auto_8500 ?auto_8499 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8501 ?auto_8499 )
      ( DELIVER-2PKG-VERIFY ?auto_8500 ?auto_8501 ?auto_8499 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8506 - OBJ
      ?auto_8507 - OBJ
      ?auto_8505 - LOCATION
    )
    :vars
    (
      ?auto_8511 - OBJ
      ?auto_8510 - TRUCK
      ?auto_8509 - LOCATION
      ?auto_8508 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8507 ?auto_8506 ) ) ( not ( = ?auto_8507 ?auto_8511 ) ) ( IN-TRUCK ?auto_8507 ?auto_8510 ) ( TRUCK-AT ?auto_8510 ?auto_8509 ) ( IN-CITY ?auto_8509 ?auto_8508 ) ( IN-CITY ?auto_8505 ?auto_8508 ) ( not ( = ?auto_8505 ?auto_8509 ) ) ( OBJ-AT ?auto_8511 ?auto_8505 ) ( OBJ-AT ?auto_8506 ?auto_8505 ) ( not ( = ?auto_8506 ?auto_8511 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8511 ?auto_8507 ?auto_8505 )
      ( DELIVER-2PKG-VERIFY ?auto_8506 ?auto_8507 ?auto_8505 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8513 - OBJ
      ?auto_8514 - OBJ
      ?auto_8512 - LOCATION
    )
    :vars
    (
      ?auto_8517 - TRUCK
      ?auto_8516 - LOCATION
      ?auto_8515 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8514 ?auto_8513 ) ) ( IN-TRUCK ?auto_8513 ?auto_8517 ) ( TRUCK-AT ?auto_8517 ?auto_8516 ) ( IN-CITY ?auto_8516 ?auto_8515 ) ( IN-CITY ?auto_8512 ?auto_8515 ) ( not ( = ?auto_8512 ?auto_8516 ) ) ( OBJ-AT ?auto_8514 ?auto_8512 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8514 ?auto_8513 ?auto_8512 )
      ( DELIVER-2PKG-VERIFY ?auto_8513 ?auto_8514 ?auto_8512 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8519 - OBJ
      ?auto_8520 - OBJ
      ?auto_8518 - LOCATION
    )
    :vars
    (
      ?auto_8524 - OBJ
      ?auto_8523 - TRUCK
      ?auto_8522 - LOCATION
      ?auto_8521 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8520 ?auto_8519 ) ) ( not ( = ?auto_8519 ?auto_8524 ) ) ( IN-TRUCK ?auto_8519 ?auto_8523 ) ( TRUCK-AT ?auto_8523 ?auto_8522 ) ( IN-CITY ?auto_8522 ?auto_8521 ) ( IN-CITY ?auto_8518 ?auto_8521 ) ( not ( = ?auto_8518 ?auto_8522 ) ) ( OBJ-AT ?auto_8524 ?auto_8518 ) ( OBJ-AT ?auto_8520 ?auto_8518 ) ( not ( = ?auto_8520 ?auto_8524 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8524 ?auto_8519 ?auto_8518 )
      ( DELIVER-2PKG-VERIFY ?auto_8519 ?auto_8520 ?auto_8518 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8540 - OBJ
      ?auto_8541 - OBJ
      ?auto_8542 - OBJ
      ?auto_8539 - LOCATION
    )
    :vars
    (
      ?auto_8545 - TRUCK
      ?auto_8544 - LOCATION
      ?auto_8543 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8541 ?auto_8540 ) ) ( not ( = ?auto_8542 ?auto_8540 ) ) ( not ( = ?auto_8542 ?auto_8541 ) ) ( IN-TRUCK ?auto_8542 ?auto_8545 ) ( TRUCK-AT ?auto_8545 ?auto_8544 ) ( IN-CITY ?auto_8544 ?auto_8543 ) ( IN-CITY ?auto_8539 ?auto_8543 ) ( not ( = ?auto_8539 ?auto_8544 ) ) ( OBJ-AT ?auto_8540 ?auto_8539 ) ( OBJ-AT ?auto_8541 ?auto_8539 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8540 ?auto_8542 ?auto_8539 )
      ( DELIVER-3PKG-VERIFY ?auto_8540 ?auto_8541 ?auto_8542 ?auto_8539 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8554 - OBJ
      ?auto_8555 - OBJ
      ?auto_8556 - OBJ
      ?auto_8553 - LOCATION
    )
    :vars
    (
      ?auto_8559 - TRUCK
      ?auto_8558 - LOCATION
      ?auto_8557 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8555 ?auto_8554 ) ) ( not ( = ?auto_8556 ?auto_8554 ) ) ( not ( = ?auto_8556 ?auto_8555 ) ) ( IN-TRUCK ?auto_8555 ?auto_8559 ) ( TRUCK-AT ?auto_8559 ?auto_8558 ) ( IN-CITY ?auto_8558 ?auto_8557 ) ( IN-CITY ?auto_8553 ?auto_8557 ) ( not ( = ?auto_8553 ?auto_8558 ) ) ( OBJ-AT ?auto_8554 ?auto_8553 ) ( OBJ-AT ?auto_8556 ?auto_8553 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8554 ?auto_8555 ?auto_8553 )
      ( DELIVER-3PKG-VERIFY ?auto_8554 ?auto_8555 ?auto_8556 ?auto_8553 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8568 - OBJ
      ?auto_8569 - OBJ
      ?auto_8570 - OBJ
      ?auto_8567 - LOCATION
    )
    :vars
    (
      ?auto_8573 - TRUCK
      ?auto_8572 - LOCATION
      ?auto_8571 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8569 ?auto_8568 ) ) ( not ( = ?auto_8570 ?auto_8568 ) ) ( not ( = ?auto_8570 ?auto_8569 ) ) ( IN-TRUCK ?auto_8570 ?auto_8573 ) ( TRUCK-AT ?auto_8573 ?auto_8572 ) ( IN-CITY ?auto_8572 ?auto_8571 ) ( IN-CITY ?auto_8567 ?auto_8571 ) ( not ( = ?auto_8567 ?auto_8572 ) ) ( OBJ-AT ?auto_8569 ?auto_8567 ) ( OBJ-AT ?auto_8568 ?auto_8567 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8569 ?auto_8570 ?auto_8567 )
      ( DELIVER-3PKG-VERIFY ?auto_8568 ?auto_8569 ?auto_8570 ?auto_8567 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8583 - OBJ
      ?auto_8584 - OBJ
      ?auto_8585 - OBJ
      ?auto_8582 - LOCATION
    )
    :vars
    (
      ?auto_8588 - TRUCK
      ?auto_8587 - LOCATION
      ?auto_8586 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8584 ?auto_8583 ) ) ( not ( = ?auto_8585 ?auto_8583 ) ) ( not ( = ?auto_8585 ?auto_8584 ) ) ( IN-TRUCK ?auto_8584 ?auto_8588 ) ( TRUCK-AT ?auto_8588 ?auto_8587 ) ( IN-CITY ?auto_8587 ?auto_8586 ) ( IN-CITY ?auto_8582 ?auto_8586 ) ( not ( = ?auto_8582 ?auto_8587 ) ) ( OBJ-AT ?auto_8585 ?auto_8582 ) ( OBJ-AT ?auto_8583 ?auto_8582 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8585 ?auto_8584 ?auto_8582 )
      ( DELIVER-3PKG-VERIFY ?auto_8583 ?auto_8584 ?auto_8585 ?auto_8582 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8613 - OBJ
      ?auto_8614 - OBJ
      ?auto_8615 - OBJ
      ?auto_8612 - LOCATION
    )
    :vars
    (
      ?auto_8618 - TRUCK
      ?auto_8617 - LOCATION
      ?auto_8616 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8614 ?auto_8613 ) ) ( not ( = ?auto_8615 ?auto_8613 ) ) ( not ( = ?auto_8615 ?auto_8614 ) ) ( IN-TRUCK ?auto_8613 ?auto_8618 ) ( TRUCK-AT ?auto_8618 ?auto_8617 ) ( IN-CITY ?auto_8617 ?auto_8616 ) ( IN-CITY ?auto_8612 ?auto_8616 ) ( not ( = ?auto_8612 ?auto_8617 ) ) ( OBJ-AT ?auto_8614 ?auto_8612 ) ( OBJ-AT ?auto_8615 ?auto_8612 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8614 ?auto_8613 ?auto_8612 )
      ( DELIVER-3PKG-VERIFY ?auto_8613 ?auto_8614 ?auto_8615 ?auto_8612 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8627 - OBJ
      ?auto_8628 - OBJ
      ?auto_8629 - OBJ
      ?auto_8626 - LOCATION
    )
    :vars
    (
      ?auto_8632 - TRUCK
      ?auto_8631 - LOCATION
      ?auto_8630 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8628 ?auto_8627 ) ) ( not ( = ?auto_8629 ?auto_8627 ) ) ( not ( = ?auto_8629 ?auto_8628 ) ) ( IN-TRUCK ?auto_8627 ?auto_8632 ) ( TRUCK-AT ?auto_8632 ?auto_8631 ) ( IN-CITY ?auto_8631 ?auto_8630 ) ( IN-CITY ?auto_8626 ?auto_8630 ) ( not ( = ?auto_8626 ?auto_8631 ) ) ( OBJ-AT ?auto_8629 ?auto_8626 ) ( OBJ-AT ?auto_8628 ?auto_8626 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8629 ?auto_8627 ?auto_8626 )
      ( DELIVER-3PKG-VERIFY ?auto_8627 ?auto_8628 ?auto_8629 ?auto_8626 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8673 - OBJ
      ?auto_8672 - LOCATION
    )
    :vars
    (
      ?auto_8677 - OBJ
      ?auto_8676 - TRUCK
      ?auto_8675 - LOCATION
      ?auto_8674 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8673 ?auto_8677 ) ) ( TRUCK-AT ?auto_8676 ?auto_8675 ) ( IN-CITY ?auto_8675 ?auto_8674 ) ( IN-CITY ?auto_8672 ?auto_8674 ) ( not ( = ?auto_8672 ?auto_8675 ) ) ( OBJ-AT ?auto_8677 ?auto_8672 ) ( OBJ-AT ?auto_8673 ?auto_8675 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_8673 ?auto_8676 ?auto_8675 )
      ( DELIVER-2PKG ?auto_8677 ?auto_8673 ?auto_8672 )
      ( DELIVER-1PKG-VERIFY ?auto_8673 ?auto_8672 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8679 - OBJ
      ?auto_8680 - OBJ
      ?auto_8678 - LOCATION
    )
    :vars
    (
      ?auto_8681 - TRUCK
      ?auto_8682 - LOCATION
      ?auto_8683 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8680 ?auto_8679 ) ) ( TRUCK-AT ?auto_8681 ?auto_8682 ) ( IN-CITY ?auto_8682 ?auto_8683 ) ( IN-CITY ?auto_8678 ?auto_8683 ) ( not ( = ?auto_8678 ?auto_8682 ) ) ( OBJ-AT ?auto_8679 ?auto_8678 ) ( OBJ-AT ?auto_8680 ?auto_8682 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8680 ?auto_8678 )
      ( DELIVER-2PKG-VERIFY ?auto_8679 ?auto_8680 ?auto_8678 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8685 - OBJ
      ?auto_8686 - OBJ
      ?auto_8684 - LOCATION
    )
    :vars
    (
      ?auto_8688 - OBJ
      ?auto_8689 - TRUCK
      ?auto_8690 - LOCATION
      ?auto_8687 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8686 ?auto_8685 ) ) ( not ( = ?auto_8686 ?auto_8688 ) ) ( TRUCK-AT ?auto_8689 ?auto_8690 ) ( IN-CITY ?auto_8690 ?auto_8687 ) ( IN-CITY ?auto_8684 ?auto_8687 ) ( not ( = ?auto_8684 ?auto_8690 ) ) ( OBJ-AT ?auto_8688 ?auto_8684 ) ( OBJ-AT ?auto_8686 ?auto_8690 ) ( OBJ-AT ?auto_8685 ?auto_8684 ) ( not ( = ?auto_8685 ?auto_8688 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8688 ?auto_8686 ?auto_8684 )
      ( DELIVER-2PKG-VERIFY ?auto_8685 ?auto_8686 ?auto_8684 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8692 - OBJ
      ?auto_8693 - OBJ
      ?auto_8691 - LOCATION
    )
    :vars
    (
      ?auto_8695 - TRUCK
      ?auto_8696 - LOCATION
      ?auto_8694 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8693 ?auto_8692 ) ) ( TRUCK-AT ?auto_8695 ?auto_8696 ) ( IN-CITY ?auto_8696 ?auto_8694 ) ( IN-CITY ?auto_8691 ?auto_8694 ) ( not ( = ?auto_8691 ?auto_8696 ) ) ( OBJ-AT ?auto_8693 ?auto_8691 ) ( OBJ-AT ?auto_8692 ?auto_8696 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8693 ?auto_8692 ?auto_8691 )
      ( DELIVER-2PKG-VERIFY ?auto_8692 ?auto_8693 ?auto_8691 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8698 - OBJ
      ?auto_8699 - OBJ
      ?auto_8697 - LOCATION
    )
    :vars
    (
      ?auto_8701 - OBJ
      ?auto_8702 - TRUCK
      ?auto_8703 - LOCATION
      ?auto_8700 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8699 ?auto_8698 ) ) ( not ( = ?auto_8698 ?auto_8701 ) ) ( TRUCK-AT ?auto_8702 ?auto_8703 ) ( IN-CITY ?auto_8703 ?auto_8700 ) ( IN-CITY ?auto_8697 ?auto_8700 ) ( not ( = ?auto_8697 ?auto_8703 ) ) ( OBJ-AT ?auto_8701 ?auto_8697 ) ( OBJ-AT ?auto_8698 ?auto_8703 ) ( OBJ-AT ?auto_8699 ?auto_8697 ) ( not ( = ?auto_8699 ?auto_8701 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8701 ?auto_8698 ?auto_8697 )
      ( DELIVER-2PKG-VERIFY ?auto_8698 ?auto_8699 ?auto_8697 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8719 - OBJ
      ?auto_8720 - OBJ
      ?auto_8721 - OBJ
      ?auto_8718 - LOCATION
    )
    :vars
    (
      ?auto_8723 - TRUCK
      ?auto_8724 - LOCATION
      ?auto_8722 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8720 ?auto_8719 ) ) ( not ( = ?auto_8721 ?auto_8719 ) ) ( not ( = ?auto_8721 ?auto_8720 ) ) ( TRUCK-AT ?auto_8723 ?auto_8724 ) ( IN-CITY ?auto_8724 ?auto_8722 ) ( IN-CITY ?auto_8718 ?auto_8722 ) ( not ( = ?auto_8718 ?auto_8724 ) ) ( OBJ-AT ?auto_8719 ?auto_8718 ) ( OBJ-AT ?auto_8721 ?auto_8724 ) ( OBJ-AT ?auto_8720 ?auto_8718 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8719 ?auto_8721 ?auto_8718 )
      ( DELIVER-3PKG-VERIFY ?auto_8719 ?auto_8720 ?auto_8721 ?auto_8718 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8733 - OBJ
      ?auto_8734 - OBJ
      ?auto_8735 - OBJ
      ?auto_8732 - LOCATION
    )
    :vars
    (
      ?auto_8737 - TRUCK
      ?auto_8738 - LOCATION
      ?auto_8736 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8734 ?auto_8733 ) ) ( not ( = ?auto_8735 ?auto_8733 ) ) ( not ( = ?auto_8735 ?auto_8734 ) ) ( TRUCK-AT ?auto_8737 ?auto_8738 ) ( IN-CITY ?auto_8738 ?auto_8736 ) ( IN-CITY ?auto_8732 ?auto_8736 ) ( not ( = ?auto_8732 ?auto_8738 ) ) ( OBJ-AT ?auto_8733 ?auto_8732 ) ( OBJ-AT ?auto_8734 ?auto_8738 ) ( OBJ-AT ?auto_8735 ?auto_8732 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8733 ?auto_8734 ?auto_8732 )
      ( DELIVER-3PKG-VERIFY ?auto_8733 ?auto_8734 ?auto_8735 ?auto_8732 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8747 - OBJ
      ?auto_8748 - OBJ
      ?auto_8749 - OBJ
      ?auto_8746 - LOCATION
    )
    :vars
    (
      ?auto_8751 - TRUCK
      ?auto_8752 - LOCATION
      ?auto_8750 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8748 ?auto_8747 ) ) ( not ( = ?auto_8749 ?auto_8747 ) ) ( not ( = ?auto_8749 ?auto_8748 ) ) ( TRUCK-AT ?auto_8751 ?auto_8752 ) ( IN-CITY ?auto_8752 ?auto_8750 ) ( IN-CITY ?auto_8746 ?auto_8750 ) ( not ( = ?auto_8746 ?auto_8752 ) ) ( OBJ-AT ?auto_8748 ?auto_8746 ) ( OBJ-AT ?auto_8749 ?auto_8752 ) ( OBJ-AT ?auto_8747 ?auto_8746 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8748 ?auto_8749 ?auto_8746 )
      ( DELIVER-3PKG-VERIFY ?auto_8747 ?auto_8748 ?auto_8749 ?auto_8746 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8762 - OBJ
      ?auto_8763 - OBJ
      ?auto_8764 - OBJ
      ?auto_8761 - LOCATION
    )
    :vars
    (
      ?auto_8766 - TRUCK
      ?auto_8767 - LOCATION
      ?auto_8765 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8763 ?auto_8762 ) ) ( not ( = ?auto_8764 ?auto_8762 ) ) ( not ( = ?auto_8764 ?auto_8763 ) ) ( TRUCK-AT ?auto_8766 ?auto_8767 ) ( IN-CITY ?auto_8767 ?auto_8765 ) ( IN-CITY ?auto_8761 ?auto_8765 ) ( not ( = ?auto_8761 ?auto_8767 ) ) ( OBJ-AT ?auto_8764 ?auto_8761 ) ( OBJ-AT ?auto_8763 ?auto_8767 ) ( OBJ-AT ?auto_8762 ?auto_8761 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8764 ?auto_8763 ?auto_8761 )
      ( DELIVER-3PKG-VERIFY ?auto_8762 ?auto_8763 ?auto_8764 ?auto_8761 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8792 - OBJ
      ?auto_8793 - OBJ
      ?auto_8794 - OBJ
      ?auto_8791 - LOCATION
    )
    :vars
    (
      ?auto_8796 - TRUCK
      ?auto_8797 - LOCATION
      ?auto_8795 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8793 ?auto_8792 ) ) ( not ( = ?auto_8794 ?auto_8792 ) ) ( not ( = ?auto_8794 ?auto_8793 ) ) ( TRUCK-AT ?auto_8796 ?auto_8797 ) ( IN-CITY ?auto_8797 ?auto_8795 ) ( IN-CITY ?auto_8791 ?auto_8795 ) ( not ( = ?auto_8791 ?auto_8797 ) ) ( OBJ-AT ?auto_8793 ?auto_8791 ) ( OBJ-AT ?auto_8792 ?auto_8797 ) ( OBJ-AT ?auto_8794 ?auto_8791 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8793 ?auto_8792 ?auto_8791 )
      ( DELIVER-3PKG-VERIFY ?auto_8792 ?auto_8793 ?auto_8794 ?auto_8791 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8806 - OBJ
      ?auto_8807 - OBJ
      ?auto_8808 - OBJ
      ?auto_8805 - LOCATION
    )
    :vars
    (
      ?auto_8810 - TRUCK
      ?auto_8811 - LOCATION
      ?auto_8809 - CITY
    )
    :precondition
    ( and ( not ( = ?auto_8807 ?auto_8806 ) ) ( not ( = ?auto_8808 ?auto_8806 ) ) ( not ( = ?auto_8808 ?auto_8807 ) ) ( TRUCK-AT ?auto_8810 ?auto_8811 ) ( IN-CITY ?auto_8811 ?auto_8809 ) ( IN-CITY ?auto_8805 ?auto_8809 ) ( not ( = ?auto_8805 ?auto_8811 ) ) ( OBJ-AT ?auto_8808 ?auto_8805 ) ( OBJ-AT ?auto_8806 ?auto_8811 ) ( OBJ-AT ?auto_8807 ?auto_8805 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8808 ?auto_8806 ?auto_8805 )
      ( DELIVER-3PKG-VERIFY ?auto_8806 ?auto_8807 ?auto_8808 ?auto_8805 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8852 - OBJ
      ?auto_8851 - LOCATION
    )
    :vars
    (
      ?auto_8854 - OBJ
      ?auto_8856 - LOCATION
      ?auto_8853 - CITY
      ?auto_8855 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8852 ?auto_8854 ) ) ( IN-CITY ?auto_8856 ?auto_8853 ) ( IN-CITY ?auto_8851 ?auto_8853 ) ( not ( = ?auto_8851 ?auto_8856 ) ) ( OBJ-AT ?auto_8854 ?auto_8851 ) ( OBJ-AT ?auto_8852 ?auto_8856 ) ( TRUCK-AT ?auto_8855 ?auto_8851 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8855 ?auto_8851 ?auto_8856 ?auto_8853 )
      ( DELIVER-2PKG ?auto_8854 ?auto_8852 ?auto_8851 )
      ( DELIVER-1PKG-VERIFY ?auto_8852 ?auto_8851 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8858 - OBJ
      ?auto_8859 - OBJ
      ?auto_8857 - LOCATION
    )
    :vars
    (
      ?auto_8860 - LOCATION
      ?auto_8862 - CITY
      ?auto_8861 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8859 ?auto_8858 ) ) ( IN-CITY ?auto_8860 ?auto_8862 ) ( IN-CITY ?auto_8857 ?auto_8862 ) ( not ( = ?auto_8857 ?auto_8860 ) ) ( OBJ-AT ?auto_8858 ?auto_8857 ) ( OBJ-AT ?auto_8859 ?auto_8860 ) ( TRUCK-AT ?auto_8861 ?auto_8857 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8859 ?auto_8857 )
      ( DELIVER-2PKG-VERIFY ?auto_8858 ?auto_8859 ?auto_8857 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8864 - OBJ
      ?auto_8865 - OBJ
      ?auto_8863 - LOCATION
    )
    :vars
    (
      ?auto_8868 - OBJ
      ?auto_8866 - LOCATION
      ?auto_8867 - CITY
      ?auto_8869 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8865 ?auto_8864 ) ) ( not ( = ?auto_8865 ?auto_8868 ) ) ( IN-CITY ?auto_8866 ?auto_8867 ) ( IN-CITY ?auto_8863 ?auto_8867 ) ( not ( = ?auto_8863 ?auto_8866 ) ) ( OBJ-AT ?auto_8868 ?auto_8863 ) ( OBJ-AT ?auto_8865 ?auto_8866 ) ( TRUCK-AT ?auto_8869 ?auto_8863 ) ( OBJ-AT ?auto_8864 ?auto_8863 ) ( not ( = ?auto_8864 ?auto_8868 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8868 ?auto_8865 ?auto_8863 )
      ( DELIVER-2PKG-VERIFY ?auto_8864 ?auto_8865 ?auto_8863 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8871 - OBJ
      ?auto_8872 - OBJ
      ?auto_8870 - LOCATION
    )
    :vars
    (
      ?auto_8873 - LOCATION
      ?auto_8874 - CITY
      ?auto_8875 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8872 ?auto_8871 ) ) ( IN-CITY ?auto_8873 ?auto_8874 ) ( IN-CITY ?auto_8870 ?auto_8874 ) ( not ( = ?auto_8870 ?auto_8873 ) ) ( OBJ-AT ?auto_8872 ?auto_8870 ) ( OBJ-AT ?auto_8871 ?auto_8873 ) ( TRUCK-AT ?auto_8875 ?auto_8870 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8872 ?auto_8871 ?auto_8870 )
      ( DELIVER-2PKG-VERIFY ?auto_8871 ?auto_8872 ?auto_8870 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8877 - OBJ
      ?auto_8878 - OBJ
      ?auto_8876 - LOCATION
    )
    :vars
    (
      ?auto_8881 - OBJ
      ?auto_8879 - LOCATION
      ?auto_8880 - CITY
      ?auto_8882 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8878 ?auto_8877 ) ) ( not ( = ?auto_8877 ?auto_8881 ) ) ( IN-CITY ?auto_8879 ?auto_8880 ) ( IN-CITY ?auto_8876 ?auto_8880 ) ( not ( = ?auto_8876 ?auto_8879 ) ) ( OBJ-AT ?auto_8881 ?auto_8876 ) ( OBJ-AT ?auto_8877 ?auto_8879 ) ( TRUCK-AT ?auto_8882 ?auto_8876 ) ( OBJ-AT ?auto_8878 ?auto_8876 ) ( not ( = ?auto_8878 ?auto_8881 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8881 ?auto_8877 ?auto_8876 )
      ( DELIVER-2PKG-VERIFY ?auto_8877 ?auto_8878 ?auto_8876 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8898 - OBJ
      ?auto_8899 - OBJ
      ?auto_8900 - OBJ
      ?auto_8897 - LOCATION
    )
    :vars
    (
      ?auto_8901 - LOCATION
      ?auto_8902 - CITY
      ?auto_8903 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8899 ?auto_8898 ) ) ( not ( = ?auto_8900 ?auto_8898 ) ) ( not ( = ?auto_8900 ?auto_8899 ) ) ( IN-CITY ?auto_8901 ?auto_8902 ) ( IN-CITY ?auto_8897 ?auto_8902 ) ( not ( = ?auto_8897 ?auto_8901 ) ) ( OBJ-AT ?auto_8898 ?auto_8897 ) ( OBJ-AT ?auto_8900 ?auto_8901 ) ( TRUCK-AT ?auto_8903 ?auto_8897 ) ( OBJ-AT ?auto_8899 ?auto_8897 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8898 ?auto_8900 ?auto_8897 )
      ( DELIVER-3PKG-VERIFY ?auto_8898 ?auto_8899 ?auto_8900 ?auto_8897 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8912 - OBJ
      ?auto_8913 - OBJ
      ?auto_8914 - OBJ
      ?auto_8911 - LOCATION
    )
    :vars
    (
      ?auto_8915 - LOCATION
      ?auto_8916 - CITY
      ?auto_8917 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8913 ?auto_8912 ) ) ( not ( = ?auto_8914 ?auto_8912 ) ) ( not ( = ?auto_8914 ?auto_8913 ) ) ( IN-CITY ?auto_8915 ?auto_8916 ) ( IN-CITY ?auto_8911 ?auto_8916 ) ( not ( = ?auto_8911 ?auto_8915 ) ) ( OBJ-AT ?auto_8912 ?auto_8911 ) ( OBJ-AT ?auto_8913 ?auto_8915 ) ( TRUCK-AT ?auto_8917 ?auto_8911 ) ( OBJ-AT ?auto_8914 ?auto_8911 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8912 ?auto_8913 ?auto_8911 )
      ( DELIVER-3PKG-VERIFY ?auto_8912 ?auto_8913 ?auto_8914 ?auto_8911 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8926 - OBJ
      ?auto_8927 - OBJ
      ?auto_8928 - OBJ
      ?auto_8925 - LOCATION
    )
    :vars
    (
      ?auto_8929 - LOCATION
      ?auto_8930 - CITY
      ?auto_8931 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8927 ?auto_8926 ) ) ( not ( = ?auto_8928 ?auto_8926 ) ) ( not ( = ?auto_8928 ?auto_8927 ) ) ( IN-CITY ?auto_8929 ?auto_8930 ) ( IN-CITY ?auto_8925 ?auto_8930 ) ( not ( = ?auto_8925 ?auto_8929 ) ) ( OBJ-AT ?auto_8927 ?auto_8925 ) ( OBJ-AT ?auto_8928 ?auto_8929 ) ( TRUCK-AT ?auto_8931 ?auto_8925 ) ( OBJ-AT ?auto_8926 ?auto_8925 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8927 ?auto_8928 ?auto_8925 )
      ( DELIVER-3PKG-VERIFY ?auto_8926 ?auto_8927 ?auto_8928 ?auto_8925 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8941 - OBJ
      ?auto_8942 - OBJ
      ?auto_8943 - OBJ
      ?auto_8940 - LOCATION
    )
    :vars
    (
      ?auto_8944 - LOCATION
      ?auto_8945 - CITY
      ?auto_8946 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8942 ?auto_8941 ) ) ( not ( = ?auto_8943 ?auto_8941 ) ) ( not ( = ?auto_8943 ?auto_8942 ) ) ( IN-CITY ?auto_8944 ?auto_8945 ) ( IN-CITY ?auto_8940 ?auto_8945 ) ( not ( = ?auto_8940 ?auto_8944 ) ) ( OBJ-AT ?auto_8943 ?auto_8940 ) ( OBJ-AT ?auto_8942 ?auto_8944 ) ( TRUCK-AT ?auto_8946 ?auto_8940 ) ( OBJ-AT ?auto_8941 ?auto_8940 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8943 ?auto_8942 ?auto_8940 )
      ( DELIVER-3PKG-VERIFY ?auto_8941 ?auto_8942 ?auto_8943 ?auto_8940 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8971 - OBJ
      ?auto_8972 - OBJ
      ?auto_8973 - OBJ
      ?auto_8970 - LOCATION
    )
    :vars
    (
      ?auto_8974 - LOCATION
      ?auto_8975 - CITY
      ?auto_8976 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8972 ?auto_8971 ) ) ( not ( = ?auto_8973 ?auto_8971 ) ) ( not ( = ?auto_8973 ?auto_8972 ) ) ( IN-CITY ?auto_8974 ?auto_8975 ) ( IN-CITY ?auto_8970 ?auto_8975 ) ( not ( = ?auto_8970 ?auto_8974 ) ) ( OBJ-AT ?auto_8972 ?auto_8970 ) ( OBJ-AT ?auto_8971 ?auto_8974 ) ( TRUCK-AT ?auto_8976 ?auto_8970 ) ( OBJ-AT ?auto_8973 ?auto_8970 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8972 ?auto_8971 ?auto_8970 )
      ( DELIVER-3PKG-VERIFY ?auto_8971 ?auto_8972 ?auto_8973 ?auto_8970 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8985 - OBJ
      ?auto_8986 - OBJ
      ?auto_8987 - OBJ
      ?auto_8984 - LOCATION
    )
    :vars
    (
      ?auto_8988 - LOCATION
      ?auto_8989 - CITY
      ?auto_8990 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_8986 ?auto_8985 ) ) ( not ( = ?auto_8987 ?auto_8985 ) ) ( not ( = ?auto_8987 ?auto_8986 ) ) ( IN-CITY ?auto_8988 ?auto_8989 ) ( IN-CITY ?auto_8984 ?auto_8989 ) ( not ( = ?auto_8984 ?auto_8988 ) ) ( OBJ-AT ?auto_8987 ?auto_8984 ) ( OBJ-AT ?auto_8985 ?auto_8988 ) ( TRUCK-AT ?auto_8990 ?auto_8984 ) ( OBJ-AT ?auto_8986 ?auto_8984 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8987 ?auto_8985 ?auto_8984 )
      ( DELIVER-3PKG-VERIFY ?auto_8985 ?auto_8986 ?auto_8987 ?auto_8984 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9031 - OBJ
      ?auto_9030 - LOCATION
    )
    :vars
    (
      ?auto_9034 - OBJ
      ?auto_9032 - LOCATION
      ?auto_9033 - CITY
      ?auto_9035 - TRUCK
      ?auto_9036 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_9031 ?auto_9034 ) ) ( IN-CITY ?auto_9032 ?auto_9033 ) ( IN-CITY ?auto_9030 ?auto_9033 ) ( not ( = ?auto_9030 ?auto_9032 ) ) ( OBJ-AT ?auto_9034 ?auto_9030 ) ( OBJ-AT ?auto_9031 ?auto_9032 ) ( TRUCK-AT ?auto_9035 ?auto_9030 ) ( not ( = ?auto_9036 ?auto_9034 ) ) ( IN-TRUCK ?auto_9036 ?auto_9035 ) ( not ( = ?auto_9031 ?auto_9036 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9034 ?auto_9036 ?auto_9030 )
      ( DELIVER-2PKG ?auto_9034 ?auto_9031 ?auto_9030 )
      ( DELIVER-1PKG-VERIFY ?auto_9031 ?auto_9030 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9038 - OBJ
      ?auto_9039 - OBJ
      ?auto_9037 - LOCATION
    )
    :vars
    (
      ?auto_9040 - LOCATION
      ?auto_9042 - CITY
      ?auto_9043 - TRUCK
      ?auto_9041 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_9039 ?auto_9038 ) ) ( IN-CITY ?auto_9040 ?auto_9042 ) ( IN-CITY ?auto_9037 ?auto_9042 ) ( not ( = ?auto_9037 ?auto_9040 ) ) ( OBJ-AT ?auto_9038 ?auto_9037 ) ( OBJ-AT ?auto_9039 ?auto_9040 ) ( TRUCK-AT ?auto_9043 ?auto_9037 ) ( not ( = ?auto_9041 ?auto_9038 ) ) ( IN-TRUCK ?auto_9041 ?auto_9043 ) ( not ( = ?auto_9039 ?auto_9041 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9039 ?auto_9037 )
      ( DELIVER-2PKG-VERIFY ?auto_9038 ?auto_9039 ?auto_9037 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9045 - OBJ
      ?auto_9046 - OBJ
      ?auto_9044 - LOCATION
    )
    :vars
    (
      ?auto_9047 - OBJ
      ?auto_9048 - LOCATION
      ?auto_9050 - CITY
      ?auto_9049 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9046 ?auto_9045 ) ) ( not ( = ?auto_9046 ?auto_9047 ) ) ( IN-CITY ?auto_9048 ?auto_9050 ) ( IN-CITY ?auto_9044 ?auto_9050 ) ( not ( = ?auto_9044 ?auto_9048 ) ) ( OBJ-AT ?auto_9047 ?auto_9044 ) ( OBJ-AT ?auto_9046 ?auto_9048 ) ( TRUCK-AT ?auto_9049 ?auto_9044 ) ( not ( = ?auto_9045 ?auto_9047 ) ) ( IN-TRUCK ?auto_9045 ?auto_9049 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9047 ?auto_9046 ?auto_9044 )
      ( DELIVER-2PKG-VERIFY ?auto_9045 ?auto_9046 ?auto_9044 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9052 - OBJ
      ?auto_9053 - OBJ
      ?auto_9051 - LOCATION
    )
    :vars
    (
      ?auto_9054 - LOCATION
      ?auto_9057 - CITY
      ?auto_9056 - TRUCK
      ?auto_9055 - OBJ
    )
    :precondition
    ( and ( not ( = ?auto_9053 ?auto_9052 ) ) ( IN-CITY ?auto_9054 ?auto_9057 ) ( IN-CITY ?auto_9051 ?auto_9057 ) ( not ( = ?auto_9051 ?auto_9054 ) ) ( OBJ-AT ?auto_9053 ?auto_9051 ) ( OBJ-AT ?auto_9052 ?auto_9054 ) ( TRUCK-AT ?auto_9056 ?auto_9051 ) ( not ( = ?auto_9055 ?auto_9053 ) ) ( IN-TRUCK ?auto_9055 ?auto_9056 ) ( not ( = ?auto_9052 ?auto_9055 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9053 ?auto_9052 ?auto_9051 )
      ( DELIVER-2PKG-VERIFY ?auto_9052 ?auto_9053 ?auto_9051 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9059 - OBJ
      ?auto_9060 - OBJ
      ?auto_9058 - LOCATION
    )
    :vars
    (
      ?auto_9061 - OBJ
      ?auto_9062 - LOCATION
      ?auto_9064 - CITY
      ?auto_9063 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9060 ?auto_9059 ) ) ( not ( = ?auto_9059 ?auto_9061 ) ) ( IN-CITY ?auto_9062 ?auto_9064 ) ( IN-CITY ?auto_9058 ?auto_9064 ) ( not ( = ?auto_9058 ?auto_9062 ) ) ( OBJ-AT ?auto_9061 ?auto_9058 ) ( OBJ-AT ?auto_9059 ?auto_9062 ) ( TRUCK-AT ?auto_9063 ?auto_9058 ) ( not ( = ?auto_9060 ?auto_9061 ) ) ( IN-TRUCK ?auto_9060 ?auto_9063 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9061 ?auto_9059 ?auto_9058 )
      ( DELIVER-2PKG-VERIFY ?auto_9059 ?auto_9060 ?auto_9058 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9082 - OBJ
      ?auto_9083 - OBJ
      ?auto_9084 - OBJ
      ?auto_9081 - LOCATION
    )
    :vars
    (
      ?auto_9085 - LOCATION
      ?auto_9087 - CITY
      ?auto_9086 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9083 ?auto_9082 ) ) ( not ( = ?auto_9084 ?auto_9082 ) ) ( not ( = ?auto_9084 ?auto_9083 ) ) ( IN-CITY ?auto_9085 ?auto_9087 ) ( IN-CITY ?auto_9081 ?auto_9087 ) ( not ( = ?auto_9081 ?auto_9085 ) ) ( OBJ-AT ?auto_9082 ?auto_9081 ) ( OBJ-AT ?auto_9084 ?auto_9085 ) ( TRUCK-AT ?auto_9086 ?auto_9081 ) ( IN-TRUCK ?auto_9083 ?auto_9086 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9082 ?auto_9084 ?auto_9081 )
      ( DELIVER-3PKG-VERIFY ?auto_9082 ?auto_9083 ?auto_9084 ?auto_9081 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9097 - OBJ
      ?auto_9098 - OBJ
      ?auto_9099 - OBJ
      ?auto_9096 - LOCATION
    )
    :vars
    (
      ?auto_9100 - LOCATION
      ?auto_9102 - CITY
      ?auto_9101 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9098 ?auto_9097 ) ) ( not ( = ?auto_9099 ?auto_9097 ) ) ( not ( = ?auto_9099 ?auto_9098 ) ) ( IN-CITY ?auto_9100 ?auto_9102 ) ( IN-CITY ?auto_9096 ?auto_9102 ) ( not ( = ?auto_9096 ?auto_9100 ) ) ( OBJ-AT ?auto_9097 ?auto_9096 ) ( OBJ-AT ?auto_9098 ?auto_9100 ) ( TRUCK-AT ?auto_9101 ?auto_9096 ) ( IN-TRUCK ?auto_9099 ?auto_9101 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9097 ?auto_9098 ?auto_9096 )
      ( DELIVER-3PKG-VERIFY ?auto_9097 ?auto_9098 ?auto_9099 ?auto_9096 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9112 - OBJ
      ?auto_9113 - OBJ
      ?auto_9114 - OBJ
      ?auto_9111 - LOCATION
    )
    :vars
    (
      ?auto_9115 - LOCATION
      ?auto_9117 - CITY
      ?auto_9116 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9113 ?auto_9112 ) ) ( not ( = ?auto_9114 ?auto_9112 ) ) ( not ( = ?auto_9114 ?auto_9113 ) ) ( IN-CITY ?auto_9115 ?auto_9117 ) ( IN-CITY ?auto_9111 ?auto_9117 ) ( not ( = ?auto_9111 ?auto_9115 ) ) ( OBJ-AT ?auto_9113 ?auto_9111 ) ( OBJ-AT ?auto_9114 ?auto_9115 ) ( TRUCK-AT ?auto_9116 ?auto_9111 ) ( IN-TRUCK ?auto_9112 ?auto_9116 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9113 ?auto_9114 ?auto_9111 )
      ( DELIVER-3PKG-VERIFY ?auto_9112 ?auto_9113 ?auto_9114 ?auto_9111 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9127 - OBJ
      ?auto_9128 - OBJ
      ?auto_9129 - OBJ
      ?auto_9126 - LOCATION
    )
    :vars
    (
      ?auto_9130 - LOCATION
      ?auto_9132 - CITY
      ?auto_9131 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9128 ?auto_9127 ) ) ( not ( = ?auto_9129 ?auto_9127 ) ) ( not ( = ?auto_9129 ?auto_9128 ) ) ( IN-CITY ?auto_9130 ?auto_9132 ) ( IN-CITY ?auto_9126 ?auto_9132 ) ( not ( = ?auto_9126 ?auto_9130 ) ) ( OBJ-AT ?auto_9129 ?auto_9126 ) ( OBJ-AT ?auto_9128 ?auto_9130 ) ( TRUCK-AT ?auto_9131 ?auto_9126 ) ( IN-TRUCK ?auto_9127 ?auto_9131 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9129 ?auto_9128 ?auto_9126 )
      ( DELIVER-3PKG-VERIFY ?auto_9127 ?auto_9128 ?auto_9129 ?auto_9126 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9158 - OBJ
      ?auto_9159 - OBJ
      ?auto_9160 - OBJ
      ?auto_9157 - LOCATION
    )
    :vars
    (
      ?auto_9161 - LOCATION
      ?auto_9163 - CITY
      ?auto_9162 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9159 ?auto_9158 ) ) ( not ( = ?auto_9160 ?auto_9158 ) ) ( not ( = ?auto_9160 ?auto_9159 ) ) ( IN-CITY ?auto_9161 ?auto_9163 ) ( IN-CITY ?auto_9157 ?auto_9163 ) ( not ( = ?auto_9157 ?auto_9161 ) ) ( OBJ-AT ?auto_9159 ?auto_9157 ) ( OBJ-AT ?auto_9158 ?auto_9161 ) ( TRUCK-AT ?auto_9162 ?auto_9157 ) ( IN-TRUCK ?auto_9160 ?auto_9162 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9159 ?auto_9158 ?auto_9157 )
      ( DELIVER-3PKG-VERIFY ?auto_9158 ?auto_9159 ?auto_9160 ?auto_9157 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9173 - OBJ
      ?auto_9174 - OBJ
      ?auto_9175 - OBJ
      ?auto_9172 - LOCATION
    )
    :vars
    (
      ?auto_9176 - LOCATION
      ?auto_9178 - CITY
      ?auto_9177 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9174 ?auto_9173 ) ) ( not ( = ?auto_9175 ?auto_9173 ) ) ( not ( = ?auto_9175 ?auto_9174 ) ) ( IN-CITY ?auto_9176 ?auto_9178 ) ( IN-CITY ?auto_9172 ?auto_9178 ) ( not ( = ?auto_9172 ?auto_9176 ) ) ( OBJ-AT ?auto_9175 ?auto_9172 ) ( OBJ-AT ?auto_9173 ?auto_9176 ) ( TRUCK-AT ?auto_9177 ?auto_9172 ) ( IN-TRUCK ?auto_9174 ?auto_9177 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9175 ?auto_9173 ?auto_9172 )
      ( DELIVER-3PKG-VERIFY ?auto_9173 ?auto_9174 ?auto_9175 ?auto_9172 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9221 - OBJ
      ?auto_9220 - LOCATION
    )
    :vars
    (
      ?auto_9222 - OBJ
      ?auto_9223 - LOCATION
      ?auto_9226 - CITY
      ?auto_9224 - OBJ
      ?auto_9225 - TRUCK
      ?auto_9227 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9221 ?auto_9222 ) ) ( IN-CITY ?auto_9223 ?auto_9226 ) ( IN-CITY ?auto_9220 ?auto_9226 ) ( not ( = ?auto_9220 ?auto_9223 ) ) ( OBJ-AT ?auto_9222 ?auto_9220 ) ( OBJ-AT ?auto_9221 ?auto_9223 ) ( not ( = ?auto_9224 ?auto_9222 ) ) ( IN-TRUCK ?auto_9224 ?auto_9225 ) ( not ( = ?auto_9221 ?auto_9224 ) ) ( TRUCK-AT ?auto_9225 ?auto_9227 ) ( IN-CITY ?auto_9227 ?auto_9226 ) ( not ( = ?auto_9220 ?auto_9227 ) ) ( not ( = ?auto_9223 ?auto_9227 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9225 ?auto_9227 ?auto_9220 ?auto_9226 )
      ( DELIVER-2PKG ?auto_9222 ?auto_9221 ?auto_9220 )
      ( DELIVER-1PKG-VERIFY ?auto_9221 ?auto_9220 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9229 - OBJ
      ?auto_9230 - OBJ
      ?auto_9228 - LOCATION
    )
    :vars
    (
      ?auto_9235 - LOCATION
      ?auto_9232 - CITY
      ?auto_9231 - OBJ
      ?auto_9234 - TRUCK
      ?auto_9233 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9230 ?auto_9229 ) ) ( IN-CITY ?auto_9235 ?auto_9232 ) ( IN-CITY ?auto_9228 ?auto_9232 ) ( not ( = ?auto_9228 ?auto_9235 ) ) ( OBJ-AT ?auto_9229 ?auto_9228 ) ( OBJ-AT ?auto_9230 ?auto_9235 ) ( not ( = ?auto_9231 ?auto_9229 ) ) ( IN-TRUCK ?auto_9231 ?auto_9234 ) ( not ( = ?auto_9230 ?auto_9231 ) ) ( TRUCK-AT ?auto_9234 ?auto_9233 ) ( IN-CITY ?auto_9233 ?auto_9232 ) ( not ( = ?auto_9228 ?auto_9233 ) ) ( not ( = ?auto_9235 ?auto_9233 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9230 ?auto_9228 )
      ( DELIVER-2PKG-VERIFY ?auto_9229 ?auto_9230 ?auto_9228 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9237 - OBJ
      ?auto_9238 - OBJ
      ?auto_9236 - LOCATION
    )
    :vars
    (
      ?auto_9239 - OBJ
      ?auto_9240 - LOCATION
      ?auto_9243 - CITY
      ?auto_9242 - TRUCK
      ?auto_9241 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9238 ?auto_9237 ) ) ( not ( = ?auto_9238 ?auto_9239 ) ) ( IN-CITY ?auto_9240 ?auto_9243 ) ( IN-CITY ?auto_9236 ?auto_9243 ) ( not ( = ?auto_9236 ?auto_9240 ) ) ( OBJ-AT ?auto_9239 ?auto_9236 ) ( OBJ-AT ?auto_9238 ?auto_9240 ) ( not ( = ?auto_9237 ?auto_9239 ) ) ( IN-TRUCK ?auto_9237 ?auto_9242 ) ( TRUCK-AT ?auto_9242 ?auto_9241 ) ( IN-CITY ?auto_9241 ?auto_9243 ) ( not ( = ?auto_9236 ?auto_9241 ) ) ( not ( = ?auto_9240 ?auto_9241 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9239 ?auto_9238 ?auto_9236 )
      ( DELIVER-2PKG-VERIFY ?auto_9237 ?auto_9238 ?auto_9236 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9245 - OBJ
      ?auto_9246 - OBJ
      ?auto_9244 - LOCATION
    )
    :vars
    (
      ?auto_9247 - LOCATION
      ?auto_9251 - CITY
      ?auto_9250 - OBJ
      ?auto_9249 - TRUCK
      ?auto_9248 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9246 ?auto_9245 ) ) ( IN-CITY ?auto_9247 ?auto_9251 ) ( IN-CITY ?auto_9244 ?auto_9251 ) ( not ( = ?auto_9244 ?auto_9247 ) ) ( OBJ-AT ?auto_9246 ?auto_9244 ) ( OBJ-AT ?auto_9245 ?auto_9247 ) ( not ( = ?auto_9250 ?auto_9246 ) ) ( IN-TRUCK ?auto_9250 ?auto_9249 ) ( not ( = ?auto_9245 ?auto_9250 ) ) ( TRUCK-AT ?auto_9249 ?auto_9248 ) ( IN-CITY ?auto_9248 ?auto_9251 ) ( not ( = ?auto_9244 ?auto_9248 ) ) ( not ( = ?auto_9247 ?auto_9248 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9246 ?auto_9245 ?auto_9244 )
      ( DELIVER-2PKG-VERIFY ?auto_9245 ?auto_9246 ?auto_9244 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9253 - OBJ
      ?auto_9254 - OBJ
      ?auto_9252 - LOCATION
    )
    :vars
    (
      ?auto_9255 - OBJ
      ?auto_9256 - LOCATION
      ?auto_9259 - CITY
      ?auto_9258 - TRUCK
      ?auto_9257 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9254 ?auto_9253 ) ) ( not ( = ?auto_9253 ?auto_9255 ) ) ( IN-CITY ?auto_9256 ?auto_9259 ) ( IN-CITY ?auto_9252 ?auto_9259 ) ( not ( = ?auto_9252 ?auto_9256 ) ) ( OBJ-AT ?auto_9255 ?auto_9252 ) ( OBJ-AT ?auto_9253 ?auto_9256 ) ( not ( = ?auto_9254 ?auto_9255 ) ) ( IN-TRUCK ?auto_9254 ?auto_9258 ) ( TRUCK-AT ?auto_9258 ?auto_9257 ) ( IN-CITY ?auto_9257 ?auto_9259 ) ( not ( = ?auto_9252 ?auto_9257 ) ) ( not ( = ?auto_9256 ?auto_9257 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9255 ?auto_9253 ?auto_9252 )
      ( DELIVER-2PKG-VERIFY ?auto_9253 ?auto_9254 ?auto_9252 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9279 - OBJ
      ?auto_9280 - OBJ
      ?auto_9281 - OBJ
      ?auto_9278 - LOCATION
    )
    :vars
    (
      ?auto_9282 - LOCATION
      ?auto_9285 - CITY
      ?auto_9284 - TRUCK
      ?auto_9283 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9280 ?auto_9279 ) ) ( not ( = ?auto_9281 ?auto_9279 ) ) ( not ( = ?auto_9281 ?auto_9280 ) ) ( IN-CITY ?auto_9282 ?auto_9285 ) ( IN-CITY ?auto_9278 ?auto_9285 ) ( not ( = ?auto_9278 ?auto_9282 ) ) ( OBJ-AT ?auto_9279 ?auto_9278 ) ( OBJ-AT ?auto_9281 ?auto_9282 ) ( IN-TRUCK ?auto_9280 ?auto_9284 ) ( TRUCK-AT ?auto_9284 ?auto_9283 ) ( IN-CITY ?auto_9283 ?auto_9285 ) ( not ( = ?auto_9278 ?auto_9283 ) ) ( not ( = ?auto_9282 ?auto_9283 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9279 ?auto_9281 ?auto_9278 )
      ( DELIVER-3PKG-VERIFY ?auto_9279 ?auto_9280 ?auto_9281 ?auto_9278 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9296 - OBJ
      ?auto_9297 - OBJ
      ?auto_9298 - OBJ
      ?auto_9295 - LOCATION
    )
    :vars
    (
      ?auto_9299 - LOCATION
      ?auto_9302 - CITY
      ?auto_9301 - TRUCK
      ?auto_9300 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9297 ?auto_9296 ) ) ( not ( = ?auto_9298 ?auto_9296 ) ) ( not ( = ?auto_9298 ?auto_9297 ) ) ( IN-CITY ?auto_9299 ?auto_9302 ) ( IN-CITY ?auto_9295 ?auto_9302 ) ( not ( = ?auto_9295 ?auto_9299 ) ) ( OBJ-AT ?auto_9296 ?auto_9295 ) ( OBJ-AT ?auto_9297 ?auto_9299 ) ( IN-TRUCK ?auto_9298 ?auto_9301 ) ( TRUCK-AT ?auto_9301 ?auto_9300 ) ( IN-CITY ?auto_9300 ?auto_9302 ) ( not ( = ?auto_9295 ?auto_9300 ) ) ( not ( = ?auto_9299 ?auto_9300 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9296 ?auto_9297 ?auto_9295 )
      ( DELIVER-3PKG-VERIFY ?auto_9296 ?auto_9297 ?auto_9298 ?auto_9295 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9313 - OBJ
      ?auto_9314 - OBJ
      ?auto_9315 - OBJ
      ?auto_9312 - LOCATION
    )
    :vars
    (
      ?auto_9316 - LOCATION
      ?auto_9319 - CITY
      ?auto_9318 - TRUCK
      ?auto_9317 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9314 ?auto_9313 ) ) ( not ( = ?auto_9315 ?auto_9313 ) ) ( not ( = ?auto_9315 ?auto_9314 ) ) ( IN-CITY ?auto_9316 ?auto_9319 ) ( IN-CITY ?auto_9312 ?auto_9319 ) ( not ( = ?auto_9312 ?auto_9316 ) ) ( OBJ-AT ?auto_9314 ?auto_9312 ) ( OBJ-AT ?auto_9315 ?auto_9316 ) ( IN-TRUCK ?auto_9313 ?auto_9318 ) ( TRUCK-AT ?auto_9318 ?auto_9317 ) ( IN-CITY ?auto_9317 ?auto_9319 ) ( not ( = ?auto_9312 ?auto_9317 ) ) ( not ( = ?auto_9316 ?auto_9317 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9314 ?auto_9315 ?auto_9312 )
      ( DELIVER-3PKG-VERIFY ?auto_9313 ?auto_9314 ?auto_9315 ?auto_9312 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9330 - OBJ
      ?auto_9331 - OBJ
      ?auto_9332 - OBJ
      ?auto_9329 - LOCATION
    )
    :vars
    (
      ?auto_9333 - LOCATION
      ?auto_9336 - CITY
      ?auto_9335 - TRUCK
      ?auto_9334 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9331 ?auto_9330 ) ) ( not ( = ?auto_9332 ?auto_9330 ) ) ( not ( = ?auto_9332 ?auto_9331 ) ) ( IN-CITY ?auto_9333 ?auto_9336 ) ( IN-CITY ?auto_9329 ?auto_9336 ) ( not ( = ?auto_9329 ?auto_9333 ) ) ( OBJ-AT ?auto_9332 ?auto_9329 ) ( OBJ-AT ?auto_9331 ?auto_9333 ) ( IN-TRUCK ?auto_9330 ?auto_9335 ) ( TRUCK-AT ?auto_9335 ?auto_9334 ) ( IN-CITY ?auto_9334 ?auto_9336 ) ( not ( = ?auto_9329 ?auto_9334 ) ) ( not ( = ?auto_9333 ?auto_9334 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9332 ?auto_9331 ?auto_9329 )
      ( DELIVER-3PKG-VERIFY ?auto_9330 ?auto_9331 ?auto_9332 ?auto_9329 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9365 - OBJ
      ?auto_9366 - OBJ
      ?auto_9367 - OBJ
      ?auto_9364 - LOCATION
    )
    :vars
    (
      ?auto_9368 - LOCATION
      ?auto_9371 - CITY
      ?auto_9370 - TRUCK
      ?auto_9369 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9366 ?auto_9365 ) ) ( not ( = ?auto_9367 ?auto_9365 ) ) ( not ( = ?auto_9367 ?auto_9366 ) ) ( IN-CITY ?auto_9368 ?auto_9371 ) ( IN-CITY ?auto_9364 ?auto_9371 ) ( not ( = ?auto_9364 ?auto_9368 ) ) ( OBJ-AT ?auto_9366 ?auto_9364 ) ( OBJ-AT ?auto_9365 ?auto_9368 ) ( IN-TRUCK ?auto_9367 ?auto_9370 ) ( TRUCK-AT ?auto_9370 ?auto_9369 ) ( IN-CITY ?auto_9369 ?auto_9371 ) ( not ( = ?auto_9364 ?auto_9369 ) ) ( not ( = ?auto_9368 ?auto_9369 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9366 ?auto_9365 ?auto_9364 )
      ( DELIVER-3PKG-VERIFY ?auto_9365 ?auto_9366 ?auto_9367 ?auto_9364 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9382 - OBJ
      ?auto_9383 - OBJ
      ?auto_9384 - OBJ
      ?auto_9381 - LOCATION
    )
    :vars
    (
      ?auto_9385 - LOCATION
      ?auto_9388 - CITY
      ?auto_9387 - TRUCK
      ?auto_9386 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9383 ?auto_9382 ) ) ( not ( = ?auto_9384 ?auto_9382 ) ) ( not ( = ?auto_9384 ?auto_9383 ) ) ( IN-CITY ?auto_9385 ?auto_9388 ) ( IN-CITY ?auto_9381 ?auto_9388 ) ( not ( = ?auto_9381 ?auto_9385 ) ) ( OBJ-AT ?auto_9384 ?auto_9381 ) ( OBJ-AT ?auto_9382 ?auto_9385 ) ( IN-TRUCK ?auto_9383 ?auto_9387 ) ( TRUCK-AT ?auto_9387 ?auto_9386 ) ( IN-CITY ?auto_9386 ?auto_9388 ) ( not ( = ?auto_9381 ?auto_9386 ) ) ( not ( = ?auto_9385 ?auto_9386 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9384 ?auto_9382 ?auto_9381 )
      ( DELIVER-3PKG-VERIFY ?auto_9382 ?auto_9383 ?auto_9384 ?auto_9381 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9436 - OBJ
      ?auto_9435 - LOCATION
    )
    :vars
    (
      ?auto_9437 - OBJ
      ?auto_9438 - LOCATION
      ?auto_9442 - CITY
      ?auto_9441 - OBJ
      ?auto_9440 - TRUCK
      ?auto_9439 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9436 ?auto_9437 ) ) ( IN-CITY ?auto_9438 ?auto_9442 ) ( IN-CITY ?auto_9435 ?auto_9442 ) ( not ( = ?auto_9435 ?auto_9438 ) ) ( OBJ-AT ?auto_9437 ?auto_9435 ) ( OBJ-AT ?auto_9436 ?auto_9438 ) ( not ( = ?auto_9441 ?auto_9437 ) ) ( not ( = ?auto_9436 ?auto_9441 ) ) ( TRUCK-AT ?auto_9440 ?auto_9439 ) ( IN-CITY ?auto_9439 ?auto_9442 ) ( not ( = ?auto_9435 ?auto_9439 ) ) ( not ( = ?auto_9438 ?auto_9439 ) ) ( OBJ-AT ?auto_9441 ?auto_9439 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9441 ?auto_9440 ?auto_9439 )
      ( DELIVER-2PKG ?auto_9437 ?auto_9436 ?auto_9435 )
      ( DELIVER-1PKG-VERIFY ?auto_9436 ?auto_9435 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9444 - OBJ
      ?auto_9445 - OBJ
      ?auto_9443 - LOCATION
    )
    :vars
    (
      ?auto_9448 - LOCATION
      ?auto_9449 - CITY
      ?auto_9446 - OBJ
      ?auto_9447 - TRUCK
      ?auto_9450 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9445 ?auto_9444 ) ) ( IN-CITY ?auto_9448 ?auto_9449 ) ( IN-CITY ?auto_9443 ?auto_9449 ) ( not ( = ?auto_9443 ?auto_9448 ) ) ( OBJ-AT ?auto_9444 ?auto_9443 ) ( OBJ-AT ?auto_9445 ?auto_9448 ) ( not ( = ?auto_9446 ?auto_9444 ) ) ( not ( = ?auto_9445 ?auto_9446 ) ) ( TRUCK-AT ?auto_9447 ?auto_9450 ) ( IN-CITY ?auto_9450 ?auto_9449 ) ( not ( = ?auto_9443 ?auto_9450 ) ) ( not ( = ?auto_9448 ?auto_9450 ) ) ( OBJ-AT ?auto_9446 ?auto_9450 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9445 ?auto_9443 )
      ( DELIVER-2PKG-VERIFY ?auto_9444 ?auto_9445 ?auto_9443 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9452 - OBJ
      ?auto_9453 - OBJ
      ?auto_9451 - LOCATION
    )
    :vars
    (
      ?auto_9454 - OBJ
      ?auto_9457 - LOCATION
      ?auto_9455 - CITY
      ?auto_9458 - TRUCK
      ?auto_9456 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9453 ?auto_9452 ) ) ( not ( = ?auto_9453 ?auto_9454 ) ) ( IN-CITY ?auto_9457 ?auto_9455 ) ( IN-CITY ?auto_9451 ?auto_9455 ) ( not ( = ?auto_9451 ?auto_9457 ) ) ( OBJ-AT ?auto_9454 ?auto_9451 ) ( OBJ-AT ?auto_9453 ?auto_9457 ) ( not ( = ?auto_9452 ?auto_9454 ) ) ( TRUCK-AT ?auto_9458 ?auto_9456 ) ( IN-CITY ?auto_9456 ?auto_9455 ) ( not ( = ?auto_9451 ?auto_9456 ) ) ( not ( = ?auto_9457 ?auto_9456 ) ) ( OBJ-AT ?auto_9452 ?auto_9456 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9454 ?auto_9453 ?auto_9451 )
      ( DELIVER-2PKG-VERIFY ?auto_9452 ?auto_9453 ?auto_9451 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9460 - OBJ
      ?auto_9461 - OBJ
      ?auto_9459 - LOCATION
    )
    :vars
    (
      ?auto_9465 - LOCATION
      ?auto_9462 - CITY
      ?auto_9464 - OBJ
      ?auto_9466 - TRUCK
      ?auto_9463 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9461 ?auto_9460 ) ) ( IN-CITY ?auto_9465 ?auto_9462 ) ( IN-CITY ?auto_9459 ?auto_9462 ) ( not ( = ?auto_9459 ?auto_9465 ) ) ( OBJ-AT ?auto_9461 ?auto_9459 ) ( OBJ-AT ?auto_9460 ?auto_9465 ) ( not ( = ?auto_9464 ?auto_9461 ) ) ( not ( = ?auto_9460 ?auto_9464 ) ) ( TRUCK-AT ?auto_9466 ?auto_9463 ) ( IN-CITY ?auto_9463 ?auto_9462 ) ( not ( = ?auto_9459 ?auto_9463 ) ) ( not ( = ?auto_9465 ?auto_9463 ) ) ( OBJ-AT ?auto_9464 ?auto_9463 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9461 ?auto_9460 ?auto_9459 )
      ( DELIVER-2PKG-VERIFY ?auto_9460 ?auto_9461 ?auto_9459 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9468 - OBJ
      ?auto_9469 - OBJ
      ?auto_9467 - LOCATION
    )
    :vars
    (
      ?auto_9470 - OBJ
      ?auto_9473 - LOCATION
      ?auto_9471 - CITY
      ?auto_9474 - TRUCK
      ?auto_9472 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9469 ?auto_9468 ) ) ( not ( = ?auto_9468 ?auto_9470 ) ) ( IN-CITY ?auto_9473 ?auto_9471 ) ( IN-CITY ?auto_9467 ?auto_9471 ) ( not ( = ?auto_9467 ?auto_9473 ) ) ( OBJ-AT ?auto_9470 ?auto_9467 ) ( OBJ-AT ?auto_9468 ?auto_9473 ) ( not ( = ?auto_9469 ?auto_9470 ) ) ( TRUCK-AT ?auto_9474 ?auto_9472 ) ( IN-CITY ?auto_9472 ?auto_9471 ) ( not ( = ?auto_9467 ?auto_9472 ) ) ( not ( = ?auto_9473 ?auto_9472 ) ) ( OBJ-AT ?auto_9469 ?auto_9472 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9470 ?auto_9468 ?auto_9467 )
      ( DELIVER-2PKG-VERIFY ?auto_9468 ?auto_9469 ?auto_9467 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9494 - OBJ
      ?auto_9495 - OBJ
      ?auto_9496 - OBJ
      ?auto_9493 - LOCATION
    )
    :vars
    (
      ?auto_9499 - LOCATION
      ?auto_9497 - CITY
      ?auto_9500 - TRUCK
      ?auto_9498 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9495 ?auto_9494 ) ) ( not ( = ?auto_9496 ?auto_9494 ) ) ( not ( = ?auto_9496 ?auto_9495 ) ) ( IN-CITY ?auto_9499 ?auto_9497 ) ( IN-CITY ?auto_9493 ?auto_9497 ) ( not ( = ?auto_9493 ?auto_9499 ) ) ( OBJ-AT ?auto_9494 ?auto_9493 ) ( OBJ-AT ?auto_9496 ?auto_9499 ) ( TRUCK-AT ?auto_9500 ?auto_9498 ) ( IN-CITY ?auto_9498 ?auto_9497 ) ( not ( = ?auto_9493 ?auto_9498 ) ) ( not ( = ?auto_9499 ?auto_9498 ) ) ( OBJ-AT ?auto_9495 ?auto_9498 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9494 ?auto_9496 ?auto_9493 )
      ( DELIVER-3PKG-VERIFY ?auto_9494 ?auto_9495 ?auto_9496 ?auto_9493 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9511 - OBJ
      ?auto_9512 - OBJ
      ?auto_9513 - OBJ
      ?auto_9510 - LOCATION
    )
    :vars
    (
      ?auto_9516 - LOCATION
      ?auto_9514 - CITY
      ?auto_9517 - TRUCK
      ?auto_9515 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9512 ?auto_9511 ) ) ( not ( = ?auto_9513 ?auto_9511 ) ) ( not ( = ?auto_9513 ?auto_9512 ) ) ( IN-CITY ?auto_9516 ?auto_9514 ) ( IN-CITY ?auto_9510 ?auto_9514 ) ( not ( = ?auto_9510 ?auto_9516 ) ) ( OBJ-AT ?auto_9511 ?auto_9510 ) ( OBJ-AT ?auto_9512 ?auto_9516 ) ( TRUCK-AT ?auto_9517 ?auto_9515 ) ( IN-CITY ?auto_9515 ?auto_9514 ) ( not ( = ?auto_9510 ?auto_9515 ) ) ( not ( = ?auto_9516 ?auto_9515 ) ) ( OBJ-AT ?auto_9513 ?auto_9515 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9511 ?auto_9512 ?auto_9510 )
      ( DELIVER-3PKG-VERIFY ?auto_9511 ?auto_9512 ?auto_9513 ?auto_9510 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9528 - OBJ
      ?auto_9529 - OBJ
      ?auto_9530 - OBJ
      ?auto_9527 - LOCATION
    )
    :vars
    (
      ?auto_9533 - LOCATION
      ?auto_9531 - CITY
      ?auto_9534 - TRUCK
      ?auto_9532 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9529 ?auto_9528 ) ) ( not ( = ?auto_9530 ?auto_9528 ) ) ( not ( = ?auto_9530 ?auto_9529 ) ) ( IN-CITY ?auto_9533 ?auto_9531 ) ( IN-CITY ?auto_9527 ?auto_9531 ) ( not ( = ?auto_9527 ?auto_9533 ) ) ( OBJ-AT ?auto_9529 ?auto_9527 ) ( OBJ-AT ?auto_9530 ?auto_9533 ) ( TRUCK-AT ?auto_9534 ?auto_9532 ) ( IN-CITY ?auto_9532 ?auto_9531 ) ( not ( = ?auto_9527 ?auto_9532 ) ) ( not ( = ?auto_9533 ?auto_9532 ) ) ( OBJ-AT ?auto_9528 ?auto_9532 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9529 ?auto_9530 ?auto_9527 )
      ( DELIVER-3PKG-VERIFY ?auto_9528 ?auto_9529 ?auto_9530 ?auto_9527 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9545 - OBJ
      ?auto_9546 - OBJ
      ?auto_9547 - OBJ
      ?auto_9544 - LOCATION
    )
    :vars
    (
      ?auto_9550 - LOCATION
      ?auto_9548 - CITY
      ?auto_9551 - TRUCK
      ?auto_9549 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9546 ?auto_9545 ) ) ( not ( = ?auto_9547 ?auto_9545 ) ) ( not ( = ?auto_9547 ?auto_9546 ) ) ( IN-CITY ?auto_9550 ?auto_9548 ) ( IN-CITY ?auto_9544 ?auto_9548 ) ( not ( = ?auto_9544 ?auto_9550 ) ) ( OBJ-AT ?auto_9547 ?auto_9544 ) ( OBJ-AT ?auto_9546 ?auto_9550 ) ( TRUCK-AT ?auto_9551 ?auto_9549 ) ( IN-CITY ?auto_9549 ?auto_9548 ) ( not ( = ?auto_9544 ?auto_9549 ) ) ( not ( = ?auto_9550 ?auto_9549 ) ) ( OBJ-AT ?auto_9545 ?auto_9549 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9547 ?auto_9546 ?auto_9544 )
      ( DELIVER-3PKG-VERIFY ?auto_9545 ?auto_9546 ?auto_9547 ?auto_9544 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9580 - OBJ
      ?auto_9581 - OBJ
      ?auto_9582 - OBJ
      ?auto_9579 - LOCATION
    )
    :vars
    (
      ?auto_9585 - LOCATION
      ?auto_9583 - CITY
      ?auto_9586 - TRUCK
      ?auto_9584 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9581 ?auto_9580 ) ) ( not ( = ?auto_9582 ?auto_9580 ) ) ( not ( = ?auto_9582 ?auto_9581 ) ) ( IN-CITY ?auto_9585 ?auto_9583 ) ( IN-CITY ?auto_9579 ?auto_9583 ) ( not ( = ?auto_9579 ?auto_9585 ) ) ( OBJ-AT ?auto_9581 ?auto_9579 ) ( OBJ-AT ?auto_9580 ?auto_9585 ) ( TRUCK-AT ?auto_9586 ?auto_9584 ) ( IN-CITY ?auto_9584 ?auto_9583 ) ( not ( = ?auto_9579 ?auto_9584 ) ) ( not ( = ?auto_9585 ?auto_9584 ) ) ( OBJ-AT ?auto_9582 ?auto_9584 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9581 ?auto_9580 ?auto_9579 )
      ( DELIVER-3PKG-VERIFY ?auto_9580 ?auto_9581 ?auto_9582 ?auto_9579 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9597 - OBJ
      ?auto_9598 - OBJ
      ?auto_9599 - OBJ
      ?auto_9596 - LOCATION
    )
    :vars
    (
      ?auto_9602 - LOCATION
      ?auto_9600 - CITY
      ?auto_9603 - TRUCK
      ?auto_9601 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_9598 ?auto_9597 ) ) ( not ( = ?auto_9599 ?auto_9597 ) ) ( not ( = ?auto_9599 ?auto_9598 ) ) ( IN-CITY ?auto_9602 ?auto_9600 ) ( IN-CITY ?auto_9596 ?auto_9600 ) ( not ( = ?auto_9596 ?auto_9602 ) ) ( OBJ-AT ?auto_9599 ?auto_9596 ) ( OBJ-AT ?auto_9597 ?auto_9602 ) ( TRUCK-AT ?auto_9603 ?auto_9601 ) ( IN-CITY ?auto_9601 ?auto_9600 ) ( not ( = ?auto_9596 ?auto_9601 ) ) ( not ( = ?auto_9602 ?auto_9601 ) ) ( OBJ-AT ?auto_9598 ?auto_9601 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9599 ?auto_9597 ?auto_9596 )
      ( DELIVER-3PKG-VERIFY ?auto_9597 ?auto_9598 ?auto_9599 ?auto_9596 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9651 - OBJ
      ?auto_9650 - LOCATION
    )
    :vars
    (
      ?auto_9652 - OBJ
      ?auto_9656 - LOCATION
      ?auto_9653 - CITY
      ?auto_9655 - OBJ
      ?auto_9654 - LOCATION
      ?auto_9657 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9651 ?auto_9652 ) ) ( IN-CITY ?auto_9656 ?auto_9653 ) ( IN-CITY ?auto_9650 ?auto_9653 ) ( not ( = ?auto_9650 ?auto_9656 ) ) ( OBJ-AT ?auto_9652 ?auto_9650 ) ( OBJ-AT ?auto_9651 ?auto_9656 ) ( not ( = ?auto_9655 ?auto_9652 ) ) ( not ( = ?auto_9651 ?auto_9655 ) ) ( IN-CITY ?auto_9654 ?auto_9653 ) ( not ( = ?auto_9650 ?auto_9654 ) ) ( not ( = ?auto_9656 ?auto_9654 ) ) ( OBJ-AT ?auto_9655 ?auto_9654 ) ( TRUCK-AT ?auto_9657 ?auto_9650 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_9657 ?auto_9650 ?auto_9654 ?auto_9653 )
      ( DELIVER-2PKG ?auto_9652 ?auto_9651 ?auto_9650 )
      ( DELIVER-1PKG-VERIFY ?auto_9651 ?auto_9650 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9659 - OBJ
      ?auto_9660 - OBJ
      ?auto_9658 - LOCATION
    )
    :vars
    (
      ?auto_9664 - LOCATION
      ?auto_9665 - CITY
      ?auto_9661 - OBJ
      ?auto_9662 - LOCATION
      ?auto_9663 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9660 ?auto_9659 ) ) ( IN-CITY ?auto_9664 ?auto_9665 ) ( IN-CITY ?auto_9658 ?auto_9665 ) ( not ( = ?auto_9658 ?auto_9664 ) ) ( OBJ-AT ?auto_9659 ?auto_9658 ) ( OBJ-AT ?auto_9660 ?auto_9664 ) ( not ( = ?auto_9661 ?auto_9659 ) ) ( not ( = ?auto_9660 ?auto_9661 ) ) ( IN-CITY ?auto_9662 ?auto_9665 ) ( not ( = ?auto_9658 ?auto_9662 ) ) ( not ( = ?auto_9664 ?auto_9662 ) ) ( OBJ-AT ?auto_9661 ?auto_9662 ) ( TRUCK-AT ?auto_9663 ?auto_9658 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9660 ?auto_9658 )
      ( DELIVER-2PKG-VERIFY ?auto_9659 ?auto_9660 ?auto_9658 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9667 - OBJ
      ?auto_9668 - OBJ
      ?auto_9666 - LOCATION
    )
    :vars
    (
      ?auto_9673 - OBJ
      ?auto_9672 - LOCATION
      ?auto_9669 - CITY
      ?auto_9671 - LOCATION
      ?auto_9670 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9668 ?auto_9667 ) ) ( not ( = ?auto_9668 ?auto_9673 ) ) ( IN-CITY ?auto_9672 ?auto_9669 ) ( IN-CITY ?auto_9666 ?auto_9669 ) ( not ( = ?auto_9666 ?auto_9672 ) ) ( OBJ-AT ?auto_9673 ?auto_9666 ) ( OBJ-AT ?auto_9668 ?auto_9672 ) ( not ( = ?auto_9667 ?auto_9673 ) ) ( IN-CITY ?auto_9671 ?auto_9669 ) ( not ( = ?auto_9666 ?auto_9671 ) ) ( not ( = ?auto_9672 ?auto_9671 ) ) ( OBJ-AT ?auto_9667 ?auto_9671 ) ( TRUCK-AT ?auto_9670 ?auto_9666 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9673 ?auto_9668 ?auto_9666 )
      ( DELIVER-2PKG-VERIFY ?auto_9667 ?auto_9668 ?auto_9666 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9675 - OBJ
      ?auto_9676 - OBJ
      ?auto_9674 - LOCATION
    )
    :vars
    (
      ?auto_9681 - LOCATION
      ?auto_9677 - CITY
      ?auto_9680 - OBJ
      ?auto_9679 - LOCATION
      ?auto_9678 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9676 ?auto_9675 ) ) ( IN-CITY ?auto_9681 ?auto_9677 ) ( IN-CITY ?auto_9674 ?auto_9677 ) ( not ( = ?auto_9674 ?auto_9681 ) ) ( OBJ-AT ?auto_9676 ?auto_9674 ) ( OBJ-AT ?auto_9675 ?auto_9681 ) ( not ( = ?auto_9680 ?auto_9676 ) ) ( not ( = ?auto_9675 ?auto_9680 ) ) ( IN-CITY ?auto_9679 ?auto_9677 ) ( not ( = ?auto_9674 ?auto_9679 ) ) ( not ( = ?auto_9681 ?auto_9679 ) ) ( OBJ-AT ?auto_9680 ?auto_9679 ) ( TRUCK-AT ?auto_9678 ?auto_9674 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9676 ?auto_9675 ?auto_9674 )
      ( DELIVER-2PKG-VERIFY ?auto_9675 ?auto_9676 ?auto_9674 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9683 - OBJ
      ?auto_9684 - OBJ
      ?auto_9682 - LOCATION
    )
    :vars
    (
      ?auto_9689 - OBJ
      ?auto_9688 - LOCATION
      ?auto_9685 - CITY
      ?auto_9687 - LOCATION
      ?auto_9686 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9684 ?auto_9683 ) ) ( not ( = ?auto_9683 ?auto_9689 ) ) ( IN-CITY ?auto_9688 ?auto_9685 ) ( IN-CITY ?auto_9682 ?auto_9685 ) ( not ( = ?auto_9682 ?auto_9688 ) ) ( OBJ-AT ?auto_9689 ?auto_9682 ) ( OBJ-AT ?auto_9683 ?auto_9688 ) ( not ( = ?auto_9684 ?auto_9689 ) ) ( IN-CITY ?auto_9687 ?auto_9685 ) ( not ( = ?auto_9682 ?auto_9687 ) ) ( not ( = ?auto_9688 ?auto_9687 ) ) ( OBJ-AT ?auto_9684 ?auto_9687 ) ( TRUCK-AT ?auto_9686 ?auto_9682 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9689 ?auto_9683 ?auto_9682 )
      ( DELIVER-2PKG-VERIFY ?auto_9683 ?auto_9684 ?auto_9682 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9709 - OBJ
      ?auto_9710 - OBJ
      ?auto_9711 - OBJ
      ?auto_9708 - LOCATION
    )
    :vars
    (
      ?auto_9715 - LOCATION
      ?auto_9712 - CITY
      ?auto_9714 - LOCATION
      ?auto_9713 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9710 ?auto_9709 ) ) ( not ( = ?auto_9711 ?auto_9709 ) ) ( not ( = ?auto_9711 ?auto_9710 ) ) ( IN-CITY ?auto_9715 ?auto_9712 ) ( IN-CITY ?auto_9708 ?auto_9712 ) ( not ( = ?auto_9708 ?auto_9715 ) ) ( OBJ-AT ?auto_9709 ?auto_9708 ) ( OBJ-AT ?auto_9711 ?auto_9715 ) ( IN-CITY ?auto_9714 ?auto_9712 ) ( not ( = ?auto_9708 ?auto_9714 ) ) ( not ( = ?auto_9715 ?auto_9714 ) ) ( OBJ-AT ?auto_9710 ?auto_9714 ) ( TRUCK-AT ?auto_9713 ?auto_9708 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9709 ?auto_9711 ?auto_9708 )
      ( DELIVER-3PKG-VERIFY ?auto_9709 ?auto_9710 ?auto_9711 ?auto_9708 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9726 - OBJ
      ?auto_9727 - OBJ
      ?auto_9728 - OBJ
      ?auto_9725 - LOCATION
    )
    :vars
    (
      ?auto_9732 - LOCATION
      ?auto_9729 - CITY
      ?auto_9731 - LOCATION
      ?auto_9730 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9727 ?auto_9726 ) ) ( not ( = ?auto_9728 ?auto_9726 ) ) ( not ( = ?auto_9728 ?auto_9727 ) ) ( IN-CITY ?auto_9732 ?auto_9729 ) ( IN-CITY ?auto_9725 ?auto_9729 ) ( not ( = ?auto_9725 ?auto_9732 ) ) ( OBJ-AT ?auto_9726 ?auto_9725 ) ( OBJ-AT ?auto_9727 ?auto_9732 ) ( IN-CITY ?auto_9731 ?auto_9729 ) ( not ( = ?auto_9725 ?auto_9731 ) ) ( not ( = ?auto_9732 ?auto_9731 ) ) ( OBJ-AT ?auto_9728 ?auto_9731 ) ( TRUCK-AT ?auto_9730 ?auto_9725 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9726 ?auto_9727 ?auto_9725 )
      ( DELIVER-3PKG-VERIFY ?auto_9726 ?auto_9727 ?auto_9728 ?auto_9725 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9743 - OBJ
      ?auto_9744 - OBJ
      ?auto_9745 - OBJ
      ?auto_9742 - LOCATION
    )
    :vars
    (
      ?auto_9749 - LOCATION
      ?auto_9746 - CITY
      ?auto_9748 - LOCATION
      ?auto_9747 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9744 ?auto_9743 ) ) ( not ( = ?auto_9745 ?auto_9743 ) ) ( not ( = ?auto_9745 ?auto_9744 ) ) ( IN-CITY ?auto_9749 ?auto_9746 ) ( IN-CITY ?auto_9742 ?auto_9746 ) ( not ( = ?auto_9742 ?auto_9749 ) ) ( OBJ-AT ?auto_9744 ?auto_9742 ) ( OBJ-AT ?auto_9745 ?auto_9749 ) ( IN-CITY ?auto_9748 ?auto_9746 ) ( not ( = ?auto_9742 ?auto_9748 ) ) ( not ( = ?auto_9749 ?auto_9748 ) ) ( OBJ-AT ?auto_9743 ?auto_9748 ) ( TRUCK-AT ?auto_9747 ?auto_9742 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9744 ?auto_9745 ?auto_9742 )
      ( DELIVER-3PKG-VERIFY ?auto_9743 ?auto_9744 ?auto_9745 ?auto_9742 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9760 - OBJ
      ?auto_9761 - OBJ
      ?auto_9762 - OBJ
      ?auto_9759 - LOCATION
    )
    :vars
    (
      ?auto_9766 - LOCATION
      ?auto_9763 - CITY
      ?auto_9765 - LOCATION
      ?auto_9764 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9761 ?auto_9760 ) ) ( not ( = ?auto_9762 ?auto_9760 ) ) ( not ( = ?auto_9762 ?auto_9761 ) ) ( IN-CITY ?auto_9766 ?auto_9763 ) ( IN-CITY ?auto_9759 ?auto_9763 ) ( not ( = ?auto_9759 ?auto_9766 ) ) ( OBJ-AT ?auto_9762 ?auto_9759 ) ( OBJ-AT ?auto_9761 ?auto_9766 ) ( IN-CITY ?auto_9765 ?auto_9763 ) ( not ( = ?auto_9759 ?auto_9765 ) ) ( not ( = ?auto_9766 ?auto_9765 ) ) ( OBJ-AT ?auto_9760 ?auto_9765 ) ( TRUCK-AT ?auto_9764 ?auto_9759 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9762 ?auto_9761 ?auto_9759 )
      ( DELIVER-3PKG-VERIFY ?auto_9760 ?auto_9761 ?auto_9762 ?auto_9759 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9795 - OBJ
      ?auto_9796 - OBJ
      ?auto_9797 - OBJ
      ?auto_9794 - LOCATION
    )
    :vars
    (
      ?auto_9801 - LOCATION
      ?auto_9798 - CITY
      ?auto_9800 - LOCATION
      ?auto_9799 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9796 ?auto_9795 ) ) ( not ( = ?auto_9797 ?auto_9795 ) ) ( not ( = ?auto_9797 ?auto_9796 ) ) ( IN-CITY ?auto_9801 ?auto_9798 ) ( IN-CITY ?auto_9794 ?auto_9798 ) ( not ( = ?auto_9794 ?auto_9801 ) ) ( OBJ-AT ?auto_9796 ?auto_9794 ) ( OBJ-AT ?auto_9795 ?auto_9801 ) ( IN-CITY ?auto_9800 ?auto_9798 ) ( not ( = ?auto_9794 ?auto_9800 ) ) ( not ( = ?auto_9801 ?auto_9800 ) ) ( OBJ-AT ?auto_9797 ?auto_9800 ) ( TRUCK-AT ?auto_9799 ?auto_9794 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9796 ?auto_9795 ?auto_9794 )
      ( DELIVER-3PKG-VERIFY ?auto_9795 ?auto_9796 ?auto_9797 ?auto_9794 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9812 - OBJ
      ?auto_9813 - OBJ
      ?auto_9814 - OBJ
      ?auto_9811 - LOCATION
    )
    :vars
    (
      ?auto_9818 - LOCATION
      ?auto_9815 - CITY
      ?auto_9817 - LOCATION
      ?auto_9816 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9813 ?auto_9812 ) ) ( not ( = ?auto_9814 ?auto_9812 ) ) ( not ( = ?auto_9814 ?auto_9813 ) ) ( IN-CITY ?auto_9818 ?auto_9815 ) ( IN-CITY ?auto_9811 ?auto_9815 ) ( not ( = ?auto_9811 ?auto_9818 ) ) ( OBJ-AT ?auto_9814 ?auto_9811 ) ( OBJ-AT ?auto_9812 ?auto_9818 ) ( IN-CITY ?auto_9817 ?auto_9815 ) ( not ( = ?auto_9811 ?auto_9817 ) ) ( not ( = ?auto_9818 ?auto_9817 ) ) ( OBJ-AT ?auto_9813 ?auto_9817 ) ( TRUCK-AT ?auto_9816 ?auto_9811 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9814 ?auto_9812 ?auto_9811 )
      ( DELIVER-3PKG-VERIFY ?auto_9812 ?auto_9813 ?auto_9814 ?auto_9811 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9866 - OBJ
      ?auto_9865 - LOCATION
    )
    :vars
    (
      ?auto_9872 - OBJ
      ?auto_9871 - LOCATION
      ?auto_9867 - CITY
      ?auto_9870 - OBJ
      ?auto_9869 - LOCATION
      ?auto_9868 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9866 ?auto_9872 ) ) ( IN-CITY ?auto_9871 ?auto_9867 ) ( IN-CITY ?auto_9865 ?auto_9867 ) ( not ( = ?auto_9865 ?auto_9871 ) ) ( OBJ-AT ?auto_9866 ?auto_9871 ) ( not ( = ?auto_9870 ?auto_9872 ) ) ( not ( = ?auto_9866 ?auto_9870 ) ) ( IN-CITY ?auto_9869 ?auto_9867 ) ( not ( = ?auto_9865 ?auto_9869 ) ) ( not ( = ?auto_9871 ?auto_9869 ) ) ( OBJ-AT ?auto_9870 ?auto_9869 ) ( TRUCK-AT ?auto_9868 ?auto_9865 ) ( IN-TRUCK ?auto_9872 ?auto_9868 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9872 ?auto_9865 )
      ( DELIVER-2PKG ?auto_9872 ?auto_9866 ?auto_9865 )
      ( DELIVER-1PKG-VERIFY ?auto_9866 ?auto_9865 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9874 - OBJ
      ?auto_9875 - OBJ
      ?auto_9873 - LOCATION
    )
    :vars
    (
      ?auto_9877 - LOCATION
      ?auto_9880 - CITY
      ?auto_9876 - OBJ
      ?auto_9879 - LOCATION
      ?auto_9878 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9875 ?auto_9874 ) ) ( IN-CITY ?auto_9877 ?auto_9880 ) ( IN-CITY ?auto_9873 ?auto_9880 ) ( not ( = ?auto_9873 ?auto_9877 ) ) ( OBJ-AT ?auto_9875 ?auto_9877 ) ( not ( = ?auto_9876 ?auto_9874 ) ) ( not ( = ?auto_9875 ?auto_9876 ) ) ( IN-CITY ?auto_9879 ?auto_9880 ) ( not ( = ?auto_9873 ?auto_9879 ) ) ( not ( = ?auto_9877 ?auto_9879 ) ) ( OBJ-AT ?auto_9876 ?auto_9879 ) ( TRUCK-AT ?auto_9878 ?auto_9873 ) ( IN-TRUCK ?auto_9874 ?auto_9878 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9875 ?auto_9873 )
      ( DELIVER-2PKG-VERIFY ?auto_9874 ?auto_9875 ?auto_9873 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9882 - OBJ
      ?auto_9883 - OBJ
      ?auto_9881 - LOCATION
    )
    :vars
    (
      ?auto_9888 - OBJ
      ?auto_9887 - LOCATION
      ?auto_9884 - CITY
      ?auto_9885 - LOCATION
      ?auto_9886 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9883 ?auto_9882 ) ) ( not ( = ?auto_9883 ?auto_9888 ) ) ( IN-CITY ?auto_9887 ?auto_9884 ) ( IN-CITY ?auto_9881 ?auto_9884 ) ( not ( = ?auto_9881 ?auto_9887 ) ) ( OBJ-AT ?auto_9883 ?auto_9887 ) ( not ( = ?auto_9882 ?auto_9888 ) ) ( IN-CITY ?auto_9885 ?auto_9884 ) ( not ( = ?auto_9881 ?auto_9885 ) ) ( not ( = ?auto_9887 ?auto_9885 ) ) ( OBJ-AT ?auto_9882 ?auto_9885 ) ( TRUCK-AT ?auto_9886 ?auto_9881 ) ( IN-TRUCK ?auto_9888 ?auto_9886 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9888 ?auto_9883 ?auto_9881 )
      ( DELIVER-2PKG-VERIFY ?auto_9882 ?auto_9883 ?auto_9881 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9890 - OBJ
      ?auto_9891 - OBJ
      ?auto_9889 - LOCATION
    )
    :vars
    (
      ?auto_9896 - LOCATION
      ?auto_9892 - CITY
      ?auto_9895 - OBJ
      ?auto_9893 - LOCATION
      ?auto_9894 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9891 ?auto_9890 ) ) ( IN-CITY ?auto_9896 ?auto_9892 ) ( IN-CITY ?auto_9889 ?auto_9892 ) ( not ( = ?auto_9889 ?auto_9896 ) ) ( OBJ-AT ?auto_9890 ?auto_9896 ) ( not ( = ?auto_9895 ?auto_9891 ) ) ( not ( = ?auto_9890 ?auto_9895 ) ) ( IN-CITY ?auto_9893 ?auto_9892 ) ( not ( = ?auto_9889 ?auto_9893 ) ) ( not ( = ?auto_9896 ?auto_9893 ) ) ( OBJ-AT ?auto_9895 ?auto_9893 ) ( TRUCK-AT ?auto_9894 ?auto_9889 ) ( IN-TRUCK ?auto_9891 ?auto_9894 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9891 ?auto_9890 ?auto_9889 )
      ( DELIVER-2PKG-VERIFY ?auto_9890 ?auto_9891 ?auto_9889 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9898 - OBJ
      ?auto_9899 - OBJ
      ?auto_9897 - LOCATION
    )
    :vars
    (
      ?auto_9904 - OBJ
      ?auto_9903 - LOCATION
      ?auto_9900 - CITY
      ?auto_9901 - LOCATION
      ?auto_9902 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9899 ?auto_9898 ) ) ( not ( = ?auto_9898 ?auto_9904 ) ) ( IN-CITY ?auto_9903 ?auto_9900 ) ( IN-CITY ?auto_9897 ?auto_9900 ) ( not ( = ?auto_9897 ?auto_9903 ) ) ( OBJ-AT ?auto_9898 ?auto_9903 ) ( not ( = ?auto_9899 ?auto_9904 ) ) ( IN-CITY ?auto_9901 ?auto_9900 ) ( not ( = ?auto_9897 ?auto_9901 ) ) ( not ( = ?auto_9903 ?auto_9901 ) ) ( OBJ-AT ?auto_9899 ?auto_9901 ) ( TRUCK-AT ?auto_9902 ?auto_9897 ) ( IN-TRUCK ?auto_9904 ?auto_9902 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9904 ?auto_9898 ?auto_9897 )
      ( DELIVER-2PKG-VERIFY ?auto_9898 ?auto_9899 ?auto_9897 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9924 - OBJ
      ?auto_9925 - OBJ
      ?auto_9926 - OBJ
      ?auto_9923 - LOCATION
    )
    :vars
    (
      ?auto_9930 - LOCATION
      ?auto_9927 - CITY
      ?auto_9928 - LOCATION
      ?auto_9929 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9925 ?auto_9924 ) ) ( not ( = ?auto_9926 ?auto_9924 ) ) ( not ( = ?auto_9926 ?auto_9925 ) ) ( IN-CITY ?auto_9930 ?auto_9927 ) ( IN-CITY ?auto_9923 ?auto_9927 ) ( not ( = ?auto_9923 ?auto_9930 ) ) ( OBJ-AT ?auto_9926 ?auto_9930 ) ( IN-CITY ?auto_9928 ?auto_9927 ) ( not ( = ?auto_9923 ?auto_9928 ) ) ( not ( = ?auto_9930 ?auto_9928 ) ) ( OBJ-AT ?auto_9925 ?auto_9928 ) ( TRUCK-AT ?auto_9929 ?auto_9923 ) ( IN-TRUCK ?auto_9924 ?auto_9929 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9924 ?auto_9926 ?auto_9923 )
      ( DELIVER-3PKG-VERIFY ?auto_9924 ?auto_9925 ?auto_9926 ?auto_9923 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9941 - OBJ
      ?auto_9942 - OBJ
      ?auto_9943 - OBJ
      ?auto_9940 - LOCATION
    )
    :vars
    (
      ?auto_9947 - LOCATION
      ?auto_9944 - CITY
      ?auto_9945 - LOCATION
      ?auto_9946 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9942 ?auto_9941 ) ) ( not ( = ?auto_9943 ?auto_9941 ) ) ( not ( = ?auto_9943 ?auto_9942 ) ) ( IN-CITY ?auto_9947 ?auto_9944 ) ( IN-CITY ?auto_9940 ?auto_9944 ) ( not ( = ?auto_9940 ?auto_9947 ) ) ( OBJ-AT ?auto_9942 ?auto_9947 ) ( IN-CITY ?auto_9945 ?auto_9944 ) ( not ( = ?auto_9940 ?auto_9945 ) ) ( not ( = ?auto_9947 ?auto_9945 ) ) ( OBJ-AT ?auto_9943 ?auto_9945 ) ( TRUCK-AT ?auto_9946 ?auto_9940 ) ( IN-TRUCK ?auto_9941 ?auto_9946 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9941 ?auto_9942 ?auto_9940 )
      ( DELIVER-3PKG-VERIFY ?auto_9941 ?auto_9942 ?auto_9943 ?auto_9940 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9958 - OBJ
      ?auto_9959 - OBJ
      ?auto_9960 - OBJ
      ?auto_9957 - LOCATION
    )
    :vars
    (
      ?auto_9964 - LOCATION
      ?auto_9961 - CITY
      ?auto_9962 - LOCATION
      ?auto_9963 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9959 ?auto_9958 ) ) ( not ( = ?auto_9960 ?auto_9958 ) ) ( not ( = ?auto_9960 ?auto_9959 ) ) ( IN-CITY ?auto_9964 ?auto_9961 ) ( IN-CITY ?auto_9957 ?auto_9961 ) ( not ( = ?auto_9957 ?auto_9964 ) ) ( OBJ-AT ?auto_9960 ?auto_9964 ) ( IN-CITY ?auto_9962 ?auto_9961 ) ( not ( = ?auto_9957 ?auto_9962 ) ) ( not ( = ?auto_9964 ?auto_9962 ) ) ( OBJ-AT ?auto_9958 ?auto_9962 ) ( TRUCK-AT ?auto_9963 ?auto_9957 ) ( IN-TRUCK ?auto_9959 ?auto_9963 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9959 ?auto_9960 ?auto_9957 )
      ( DELIVER-3PKG-VERIFY ?auto_9958 ?auto_9959 ?auto_9960 ?auto_9957 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_9975 - OBJ
      ?auto_9976 - OBJ
      ?auto_9977 - OBJ
      ?auto_9974 - LOCATION
    )
    :vars
    (
      ?auto_9981 - LOCATION
      ?auto_9978 - CITY
      ?auto_9979 - LOCATION
      ?auto_9980 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_9976 ?auto_9975 ) ) ( not ( = ?auto_9977 ?auto_9975 ) ) ( not ( = ?auto_9977 ?auto_9976 ) ) ( IN-CITY ?auto_9981 ?auto_9978 ) ( IN-CITY ?auto_9974 ?auto_9978 ) ( not ( = ?auto_9974 ?auto_9981 ) ) ( OBJ-AT ?auto_9976 ?auto_9981 ) ( IN-CITY ?auto_9979 ?auto_9978 ) ( not ( = ?auto_9974 ?auto_9979 ) ) ( not ( = ?auto_9981 ?auto_9979 ) ) ( OBJ-AT ?auto_9975 ?auto_9979 ) ( TRUCK-AT ?auto_9980 ?auto_9974 ) ( IN-TRUCK ?auto_9977 ?auto_9980 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9977 ?auto_9976 ?auto_9974 )
      ( DELIVER-3PKG-VERIFY ?auto_9975 ?auto_9976 ?auto_9977 ?auto_9974 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10010 - OBJ
      ?auto_10011 - OBJ
      ?auto_10012 - OBJ
      ?auto_10009 - LOCATION
    )
    :vars
    (
      ?auto_10016 - LOCATION
      ?auto_10013 - CITY
      ?auto_10014 - LOCATION
      ?auto_10015 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10011 ?auto_10010 ) ) ( not ( = ?auto_10012 ?auto_10010 ) ) ( not ( = ?auto_10012 ?auto_10011 ) ) ( IN-CITY ?auto_10016 ?auto_10013 ) ( IN-CITY ?auto_10009 ?auto_10013 ) ( not ( = ?auto_10009 ?auto_10016 ) ) ( OBJ-AT ?auto_10010 ?auto_10016 ) ( IN-CITY ?auto_10014 ?auto_10013 ) ( not ( = ?auto_10009 ?auto_10014 ) ) ( not ( = ?auto_10016 ?auto_10014 ) ) ( OBJ-AT ?auto_10012 ?auto_10014 ) ( TRUCK-AT ?auto_10015 ?auto_10009 ) ( IN-TRUCK ?auto_10011 ?auto_10015 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10011 ?auto_10010 ?auto_10009 )
      ( DELIVER-3PKG-VERIFY ?auto_10010 ?auto_10011 ?auto_10012 ?auto_10009 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10027 - OBJ
      ?auto_10028 - OBJ
      ?auto_10029 - OBJ
      ?auto_10026 - LOCATION
    )
    :vars
    (
      ?auto_10033 - LOCATION
      ?auto_10030 - CITY
      ?auto_10031 - LOCATION
      ?auto_10032 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10028 ?auto_10027 ) ) ( not ( = ?auto_10029 ?auto_10027 ) ) ( not ( = ?auto_10029 ?auto_10028 ) ) ( IN-CITY ?auto_10033 ?auto_10030 ) ( IN-CITY ?auto_10026 ?auto_10030 ) ( not ( = ?auto_10026 ?auto_10033 ) ) ( OBJ-AT ?auto_10027 ?auto_10033 ) ( IN-CITY ?auto_10031 ?auto_10030 ) ( not ( = ?auto_10026 ?auto_10031 ) ) ( not ( = ?auto_10033 ?auto_10031 ) ) ( OBJ-AT ?auto_10028 ?auto_10031 ) ( TRUCK-AT ?auto_10032 ?auto_10026 ) ( IN-TRUCK ?auto_10029 ?auto_10032 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10029 ?auto_10027 ?auto_10026 )
      ( DELIVER-3PKG-VERIFY ?auto_10027 ?auto_10028 ?auto_10029 ?auto_10026 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10081 - OBJ
      ?auto_10080 - LOCATION
    )
    :vars
    (
      ?auto_10087 - OBJ
      ?auto_10086 - LOCATION
      ?auto_10082 - CITY
      ?auto_10085 - OBJ
      ?auto_10083 - LOCATION
      ?auto_10084 - TRUCK
      ?auto_10088 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10081 ?auto_10087 ) ) ( IN-CITY ?auto_10086 ?auto_10082 ) ( IN-CITY ?auto_10080 ?auto_10082 ) ( not ( = ?auto_10080 ?auto_10086 ) ) ( OBJ-AT ?auto_10081 ?auto_10086 ) ( not ( = ?auto_10085 ?auto_10087 ) ) ( not ( = ?auto_10081 ?auto_10085 ) ) ( IN-CITY ?auto_10083 ?auto_10082 ) ( not ( = ?auto_10080 ?auto_10083 ) ) ( not ( = ?auto_10086 ?auto_10083 ) ) ( OBJ-AT ?auto_10085 ?auto_10083 ) ( IN-TRUCK ?auto_10087 ?auto_10084 ) ( TRUCK-AT ?auto_10084 ?auto_10088 ) ( IN-CITY ?auto_10088 ?auto_10082 ) ( not ( = ?auto_10080 ?auto_10088 ) ) ( not ( = ?auto_10086 ?auto_10088 ) ) ( not ( = ?auto_10083 ?auto_10088 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10084 ?auto_10088 ?auto_10080 ?auto_10082 )
      ( DELIVER-2PKG ?auto_10087 ?auto_10081 ?auto_10080 )
      ( DELIVER-1PKG-VERIFY ?auto_10081 ?auto_10080 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10090 - OBJ
      ?auto_10091 - OBJ
      ?auto_10089 - LOCATION
    )
    :vars
    (
      ?auto_10095 - LOCATION
      ?auto_10097 - CITY
      ?auto_10096 - OBJ
      ?auto_10094 - LOCATION
      ?auto_10093 - TRUCK
      ?auto_10092 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10091 ?auto_10090 ) ) ( IN-CITY ?auto_10095 ?auto_10097 ) ( IN-CITY ?auto_10089 ?auto_10097 ) ( not ( = ?auto_10089 ?auto_10095 ) ) ( OBJ-AT ?auto_10091 ?auto_10095 ) ( not ( = ?auto_10096 ?auto_10090 ) ) ( not ( = ?auto_10091 ?auto_10096 ) ) ( IN-CITY ?auto_10094 ?auto_10097 ) ( not ( = ?auto_10089 ?auto_10094 ) ) ( not ( = ?auto_10095 ?auto_10094 ) ) ( OBJ-AT ?auto_10096 ?auto_10094 ) ( IN-TRUCK ?auto_10090 ?auto_10093 ) ( TRUCK-AT ?auto_10093 ?auto_10092 ) ( IN-CITY ?auto_10092 ?auto_10097 ) ( not ( = ?auto_10089 ?auto_10092 ) ) ( not ( = ?auto_10095 ?auto_10092 ) ) ( not ( = ?auto_10094 ?auto_10092 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10091 ?auto_10089 )
      ( DELIVER-2PKG-VERIFY ?auto_10090 ?auto_10091 ?auto_10089 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10099 - OBJ
      ?auto_10100 - OBJ
      ?auto_10098 - LOCATION
    )
    :vars
    (
      ?auto_10106 - OBJ
      ?auto_10103 - LOCATION
      ?auto_10105 - CITY
      ?auto_10101 - LOCATION
      ?auto_10102 - TRUCK
      ?auto_10104 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10100 ?auto_10099 ) ) ( not ( = ?auto_10100 ?auto_10106 ) ) ( IN-CITY ?auto_10103 ?auto_10105 ) ( IN-CITY ?auto_10098 ?auto_10105 ) ( not ( = ?auto_10098 ?auto_10103 ) ) ( OBJ-AT ?auto_10100 ?auto_10103 ) ( not ( = ?auto_10099 ?auto_10106 ) ) ( IN-CITY ?auto_10101 ?auto_10105 ) ( not ( = ?auto_10098 ?auto_10101 ) ) ( not ( = ?auto_10103 ?auto_10101 ) ) ( OBJ-AT ?auto_10099 ?auto_10101 ) ( IN-TRUCK ?auto_10106 ?auto_10102 ) ( TRUCK-AT ?auto_10102 ?auto_10104 ) ( IN-CITY ?auto_10104 ?auto_10105 ) ( not ( = ?auto_10098 ?auto_10104 ) ) ( not ( = ?auto_10103 ?auto_10104 ) ) ( not ( = ?auto_10101 ?auto_10104 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10106 ?auto_10100 ?auto_10098 )
      ( DELIVER-2PKG-VERIFY ?auto_10099 ?auto_10100 ?auto_10098 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10108 - OBJ
      ?auto_10109 - OBJ
      ?auto_10107 - LOCATION
    )
    :vars
    (
      ?auto_10113 - LOCATION
      ?auto_10115 - CITY
      ?auto_10110 - OBJ
      ?auto_10111 - LOCATION
      ?auto_10112 - TRUCK
      ?auto_10114 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10109 ?auto_10108 ) ) ( IN-CITY ?auto_10113 ?auto_10115 ) ( IN-CITY ?auto_10107 ?auto_10115 ) ( not ( = ?auto_10107 ?auto_10113 ) ) ( OBJ-AT ?auto_10108 ?auto_10113 ) ( not ( = ?auto_10110 ?auto_10109 ) ) ( not ( = ?auto_10108 ?auto_10110 ) ) ( IN-CITY ?auto_10111 ?auto_10115 ) ( not ( = ?auto_10107 ?auto_10111 ) ) ( not ( = ?auto_10113 ?auto_10111 ) ) ( OBJ-AT ?auto_10110 ?auto_10111 ) ( IN-TRUCK ?auto_10109 ?auto_10112 ) ( TRUCK-AT ?auto_10112 ?auto_10114 ) ( IN-CITY ?auto_10114 ?auto_10115 ) ( not ( = ?auto_10107 ?auto_10114 ) ) ( not ( = ?auto_10113 ?auto_10114 ) ) ( not ( = ?auto_10111 ?auto_10114 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10109 ?auto_10108 ?auto_10107 )
      ( DELIVER-2PKG-VERIFY ?auto_10108 ?auto_10109 ?auto_10107 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10117 - OBJ
      ?auto_10118 - OBJ
      ?auto_10116 - LOCATION
    )
    :vars
    (
      ?auto_10124 - OBJ
      ?auto_10121 - LOCATION
      ?auto_10123 - CITY
      ?auto_10119 - LOCATION
      ?auto_10120 - TRUCK
      ?auto_10122 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10118 ?auto_10117 ) ) ( not ( = ?auto_10117 ?auto_10124 ) ) ( IN-CITY ?auto_10121 ?auto_10123 ) ( IN-CITY ?auto_10116 ?auto_10123 ) ( not ( = ?auto_10116 ?auto_10121 ) ) ( OBJ-AT ?auto_10117 ?auto_10121 ) ( not ( = ?auto_10118 ?auto_10124 ) ) ( IN-CITY ?auto_10119 ?auto_10123 ) ( not ( = ?auto_10116 ?auto_10119 ) ) ( not ( = ?auto_10121 ?auto_10119 ) ) ( OBJ-AT ?auto_10118 ?auto_10119 ) ( IN-TRUCK ?auto_10124 ?auto_10120 ) ( TRUCK-AT ?auto_10120 ?auto_10122 ) ( IN-CITY ?auto_10122 ?auto_10123 ) ( not ( = ?auto_10116 ?auto_10122 ) ) ( not ( = ?auto_10121 ?auto_10122 ) ) ( not ( = ?auto_10119 ?auto_10122 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10124 ?auto_10117 ?auto_10116 )
      ( DELIVER-2PKG-VERIFY ?auto_10117 ?auto_10118 ?auto_10116 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10146 - OBJ
      ?auto_10147 - OBJ
      ?auto_10148 - OBJ
      ?auto_10145 - LOCATION
    )
    :vars
    (
      ?auto_10151 - LOCATION
      ?auto_10153 - CITY
      ?auto_10149 - LOCATION
      ?auto_10150 - TRUCK
      ?auto_10152 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10147 ?auto_10146 ) ) ( not ( = ?auto_10148 ?auto_10146 ) ) ( not ( = ?auto_10148 ?auto_10147 ) ) ( IN-CITY ?auto_10151 ?auto_10153 ) ( IN-CITY ?auto_10145 ?auto_10153 ) ( not ( = ?auto_10145 ?auto_10151 ) ) ( OBJ-AT ?auto_10148 ?auto_10151 ) ( IN-CITY ?auto_10149 ?auto_10153 ) ( not ( = ?auto_10145 ?auto_10149 ) ) ( not ( = ?auto_10151 ?auto_10149 ) ) ( OBJ-AT ?auto_10147 ?auto_10149 ) ( IN-TRUCK ?auto_10146 ?auto_10150 ) ( TRUCK-AT ?auto_10150 ?auto_10152 ) ( IN-CITY ?auto_10152 ?auto_10153 ) ( not ( = ?auto_10145 ?auto_10152 ) ) ( not ( = ?auto_10151 ?auto_10152 ) ) ( not ( = ?auto_10149 ?auto_10152 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10146 ?auto_10148 ?auto_10145 )
      ( DELIVER-3PKG-VERIFY ?auto_10146 ?auto_10147 ?auto_10148 ?auto_10145 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10165 - OBJ
      ?auto_10166 - OBJ
      ?auto_10167 - OBJ
      ?auto_10164 - LOCATION
    )
    :vars
    (
      ?auto_10170 - LOCATION
      ?auto_10172 - CITY
      ?auto_10168 - LOCATION
      ?auto_10169 - TRUCK
      ?auto_10171 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10166 ?auto_10165 ) ) ( not ( = ?auto_10167 ?auto_10165 ) ) ( not ( = ?auto_10167 ?auto_10166 ) ) ( IN-CITY ?auto_10170 ?auto_10172 ) ( IN-CITY ?auto_10164 ?auto_10172 ) ( not ( = ?auto_10164 ?auto_10170 ) ) ( OBJ-AT ?auto_10166 ?auto_10170 ) ( IN-CITY ?auto_10168 ?auto_10172 ) ( not ( = ?auto_10164 ?auto_10168 ) ) ( not ( = ?auto_10170 ?auto_10168 ) ) ( OBJ-AT ?auto_10167 ?auto_10168 ) ( IN-TRUCK ?auto_10165 ?auto_10169 ) ( TRUCK-AT ?auto_10169 ?auto_10171 ) ( IN-CITY ?auto_10171 ?auto_10172 ) ( not ( = ?auto_10164 ?auto_10171 ) ) ( not ( = ?auto_10170 ?auto_10171 ) ) ( not ( = ?auto_10168 ?auto_10171 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10165 ?auto_10166 ?auto_10164 )
      ( DELIVER-3PKG-VERIFY ?auto_10165 ?auto_10166 ?auto_10167 ?auto_10164 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10184 - OBJ
      ?auto_10185 - OBJ
      ?auto_10186 - OBJ
      ?auto_10183 - LOCATION
    )
    :vars
    (
      ?auto_10189 - LOCATION
      ?auto_10191 - CITY
      ?auto_10187 - LOCATION
      ?auto_10188 - TRUCK
      ?auto_10190 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10185 ?auto_10184 ) ) ( not ( = ?auto_10186 ?auto_10184 ) ) ( not ( = ?auto_10186 ?auto_10185 ) ) ( IN-CITY ?auto_10189 ?auto_10191 ) ( IN-CITY ?auto_10183 ?auto_10191 ) ( not ( = ?auto_10183 ?auto_10189 ) ) ( OBJ-AT ?auto_10186 ?auto_10189 ) ( IN-CITY ?auto_10187 ?auto_10191 ) ( not ( = ?auto_10183 ?auto_10187 ) ) ( not ( = ?auto_10189 ?auto_10187 ) ) ( OBJ-AT ?auto_10184 ?auto_10187 ) ( IN-TRUCK ?auto_10185 ?auto_10188 ) ( TRUCK-AT ?auto_10188 ?auto_10190 ) ( IN-CITY ?auto_10190 ?auto_10191 ) ( not ( = ?auto_10183 ?auto_10190 ) ) ( not ( = ?auto_10189 ?auto_10190 ) ) ( not ( = ?auto_10187 ?auto_10190 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10185 ?auto_10186 ?auto_10183 )
      ( DELIVER-3PKG-VERIFY ?auto_10184 ?auto_10185 ?auto_10186 ?auto_10183 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10203 - OBJ
      ?auto_10204 - OBJ
      ?auto_10205 - OBJ
      ?auto_10202 - LOCATION
    )
    :vars
    (
      ?auto_10208 - LOCATION
      ?auto_10210 - CITY
      ?auto_10206 - LOCATION
      ?auto_10207 - TRUCK
      ?auto_10209 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10204 ?auto_10203 ) ) ( not ( = ?auto_10205 ?auto_10203 ) ) ( not ( = ?auto_10205 ?auto_10204 ) ) ( IN-CITY ?auto_10208 ?auto_10210 ) ( IN-CITY ?auto_10202 ?auto_10210 ) ( not ( = ?auto_10202 ?auto_10208 ) ) ( OBJ-AT ?auto_10204 ?auto_10208 ) ( IN-CITY ?auto_10206 ?auto_10210 ) ( not ( = ?auto_10202 ?auto_10206 ) ) ( not ( = ?auto_10208 ?auto_10206 ) ) ( OBJ-AT ?auto_10203 ?auto_10206 ) ( IN-TRUCK ?auto_10205 ?auto_10207 ) ( TRUCK-AT ?auto_10207 ?auto_10209 ) ( IN-CITY ?auto_10209 ?auto_10210 ) ( not ( = ?auto_10202 ?auto_10209 ) ) ( not ( = ?auto_10208 ?auto_10209 ) ) ( not ( = ?auto_10206 ?auto_10209 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10205 ?auto_10204 ?auto_10202 )
      ( DELIVER-3PKG-VERIFY ?auto_10203 ?auto_10204 ?auto_10205 ?auto_10202 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10242 - OBJ
      ?auto_10243 - OBJ
      ?auto_10244 - OBJ
      ?auto_10241 - LOCATION
    )
    :vars
    (
      ?auto_10247 - LOCATION
      ?auto_10249 - CITY
      ?auto_10245 - LOCATION
      ?auto_10246 - TRUCK
      ?auto_10248 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10243 ?auto_10242 ) ) ( not ( = ?auto_10244 ?auto_10242 ) ) ( not ( = ?auto_10244 ?auto_10243 ) ) ( IN-CITY ?auto_10247 ?auto_10249 ) ( IN-CITY ?auto_10241 ?auto_10249 ) ( not ( = ?auto_10241 ?auto_10247 ) ) ( OBJ-AT ?auto_10242 ?auto_10247 ) ( IN-CITY ?auto_10245 ?auto_10249 ) ( not ( = ?auto_10241 ?auto_10245 ) ) ( not ( = ?auto_10247 ?auto_10245 ) ) ( OBJ-AT ?auto_10244 ?auto_10245 ) ( IN-TRUCK ?auto_10243 ?auto_10246 ) ( TRUCK-AT ?auto_10246 ?auto_10248 ) ( IN-CITY ?auto_10248 ?auto_10249 ) ( not ( = ?auto_10241 ?auto_10248 ) ) ( not ( = ?auto_10247 ?auto_10248 ) ) ( not ( = ?auto_10245 ?auto_10248 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10243 ?auto_10242 ?auto_10241 )
      ( DELIVER-3PKG-VERIFY ?auto_10242 ?auto_10243 ?auto_10244 ?auto_10241 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10261 - OBJ
      ?auto_10262 - OBJ
      ?auto_10263 - OBJ
      ?auto_10260 - LOCATION
    )
    :vars
    (
      ?auto_10266 - LOCATION
      ?auto_10268 - CITY
      ?auto_10264 - LOCATION
      ?auto_10265 - TRUCK
      ?auto_10267 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10262 ?auto_10261 ) ) ( not ( = ?auto_10263 ?auto_10261 ) ) ( not ( = ?auto_10263 ?auto_10262 ) ) ( IN-CITY ?auto_10266 ?auto_10268 ) ( IN-CITY ?auto_10260 ?auto_10268 ) ( not ( = ?auto_10260 ?auto_10266 ) ) ( OBJ-AT ?auto_10261 ?auto_10266 ) ( IN-CITY ?auto_10264 ?auto_10268 ) ( not ( = ?auto_10260 ?auto_10264 ) ) ( not ( = ?auto_10266 ?auto_10264 ) ) ( OBJ-AT ?auto_10262 ?auto_10264 ) ( IN-TRUCK ?auto_10263 ?auto_10265 ) ( TRUCK-AT ?auto_10265 ?auto_10267 ) ( IN-CITY ?auto_10267 ?auto_10268 ) ( not ( = ?auto_10260 ?auto_10267 ) ) ( not ( = ?auto_10266 ?auto_10267 ) ) ( not ( = ?auto_10264 ?auto_10267 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10263 ?auto_10261 ?auto_10260 )
      ( DELIVER-3PKG-VERIFY ?auto_10261 ?auto_10262 ?auto_10263 ?auto_10260 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10321 - OBJ
      ?auto_10320 - LOCATION
    )
    :vars
    (
      ?auto_10328 - OBJ
      ?auto_10325 - LOCATION
      ?auto_10327 - CITY
      ?auto_10322 - OBJ
      ?auto_10323 - LOCATION
      ?auto_10324 - TRUCK
      ?auto_10326 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10321 ?auto_10328 ) ) ( IN-CITY ?auto_10325 ?auto_10327 ) ( IN-CITY ?auto_10320 ?auto_10327 ) ( not ( = ?auto_10320 ?auto_10325 ) ) ( OBJ-AT ?auto_10321 ?auto_10325 ) ( not ( = ?auto_10322 ?auto_10328 ) ) ( not ( = ?auto_10321 ?auto_10322 ) ) ( IN-CITY ?auto_10323 ?auto_10327 ) ( not ( = ?auto_10320 ?auto_10323 ) ) ( not ( = ?auto_10325 ?auto_10323 ) ) ( OBJ-AT ?auto_10322 ?auto_10323 ) ( TRUCK-AT ?auto_10324 ?auto_10326 ) ( IN-CITY ?auto_10326 ?auto_10327 ) ( not ( = ?auto_10320 ?auto_10326 ) ) ( not ( = ?auto_10325 ?auto_10326 ) ) ( not ( = ?auto_10323 ?auto_10326 ) ) ( OBJ-AT ?auto_10328 ?auto_10326 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10328 ?auto_10324 ?auto_10326 )
      ( DELIVER-2PKG ?auto_10328 ?auto_10321 ?auto_10320 )
      ( DELIVER-1PKG-VERIFY ?auto_10321 ?auto_10320 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10330 - OBJ
      ?auto_10331 - OBJ
      ?auto_10329 - LOCATION
    )
    :vars
    (
      ?auto_10332 - LOCATION
      ?auto_10337 - CITY
      ?auto_10333 - OBJ
      ?auto_10335 - LOCATION
      ?auto_10336 - TRUCK
      ?auto_10334 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10331 ?auto_10330 ) ) ( IN-CITY ?auto_10332 ?auto_10337 ) ( IN-CITY ?auto_10329 ?auto_10337 ) ( not ( = ?auto_10329 ?auto_10332 ) ) ( OBJ-AT ?auto_10331 ?auto_10332 ) ( not ( = ?auto_10333 ?auto_10330 ) ) ( not ( = ?auto_10331 ?auto_10333 ) ) ( IN-CITY ?auto_10335 ?auto_10337 ) ( not ( = ?auto_10329 ?auto_10335 ) ) ( not ( = ?auto_10332 ?auto_10335 ) ) ( OBJ-AT ?auto_10333 ?auto_10335 ) ( TRUCK-AT ?auto_10336 ?auto_10334 ) ( IN-CITY ?auto_10334 ?auto_10337 ) ( not ( = ?auto_10329 ?auto_10334 ) ) ( not ( = ?auto_10332 ?auto_10334 ) ) ( not ( = ?auto_10335 ?auto_10334 ) ) ( OBJ-AT ?auto_10330 ?auto_10334 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10331 ?auto_10329 )
      ( DELIVER-2PKG-VERIFY ?auto_10330 ?auto_10331 ?auto_10329 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10339 - OBJ
      ?auto_10340 - OBJ
      ?auto_10338 - LOCATION
    )
    :vars
    (
      ?auto_10346 - OBJ
      ?auto_10342 - LOCATION
      ?auto_10343 - CITY
      ?auto_10345 - LOCATION
      ?auto_10341 - TRUCK
      ?auto_10344 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10340 ?auto_10339 ) ) ( not ( = ?auto_10340 ?auto_10346 ) ) ( IN-CITY ?auto_10342 ?auto_10343 ) ( IN-CITY ?auto_10338 ?auto_10343 ) ( not ( = ?auto_10338 ?auto_10342 ) ) ( OBJ-AT ?auto_10340 ?auto_10342 ) ( not ( = ?auto_10339 ?auto_10346 ) ) ( IN-CITY ?auto_10345 ?auto_10343 ) ( not ( = ?auto_10338 ?auto_10345 ) ) ( not ( = ?auto_10342 ?auto_10345 ) ) ( OBJ-AT ?auto_10339 ?auto_10345 ) ( TRUCK-AT ?auto_10341 ?auto_10344 ) ( IN-CITY ?auto_10344 ?auto_10343 ) ( not ( = ?auto_10338 ?auto_10344 ) ) ( not ( = ?auto_10342 ?auto_10344 ) ) ( not ( = ?auto_10345 ?auto_10344 ) ) ( OBJ-AT ?auto_10346 ?auto_10344 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10346 ?auto_10340 ?auto_10338 )
      ( DELIVER-2PKG-VERIFY ?auto_10339 ?auto_10340 ?auto_10338 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10348 - OBJ
      ?auto_10349 - OBJ
      ?auto_10347 - LOCATION
    )
    :vars
    (
      ?auto_10352 - LOCATION
      ?auto_10353 - CITY
      ?auto_10351 - OBJ
      ?auto_10355 - LOCATION
      ?auto_10350 - TRUCK
      ?auto_10354 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10349 ?auto_10348 ) ) ( IN-CITY ?auto_10352 ?auto_10353 ) ( IN-CITY ?auto_10347 ?auto_10353 ) ( not ( = ?auto_10347 ?auto_10352 ) ) ( OBJ-AT ?auto_10348 ?auto_10352 ) ( not ( = ?auto_10351 ?auto_10349 ) ) ( not ( = ?auto_10348 ?auto_10351 ) ) ( IN-CITY ?auto_10355 ?auto_10353 ) ( not ( = ?auto_10347 ?auto_10355 ) ) ( not ( = ?auto_10352 ?auto_10355 ) ) ( OBJ-AT ?auto_10351 ?auto_10355 ) ( TRUCK-AT ?auto_10350 ?auto_10354 ) ( IN-CITY ?auto_10354 ?auto_10353 ) ( not ( = ?auto_10347 ?auto_10354 ) ) ( not ( = ?auto_10352 ?auto_10354 ) ) ( not ( = ?auto_10355 ?auto_10354 ) ) ( OBJ-AT ?auto_10349 ?auto_10354 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10349 ?auto_10348 ?auto_10347 )
      ( DELIVER-2PKG-VERIFY ?auto_10348 ?auto_10349 ?auto_10347 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10357 - OBJ
      ?auto_10358 - OBJ
      ?auto_10356 - LOCATION
    )
    :vars
    (
      ?auto_10364 - OBJ
      ?auto_10360 - LOCATION
      ?auto_10361 - CITY
      ?auto_10363 - LOCATION
      ?auto_10359 - TRUCK
      ?auto_10362 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10358 ?auto_10357 ) ) ( not ( = ?auto_10357 ?auto_10364 ) ) ( IN-CITY ?auto_10360 ?auto_10361 ) ( IN-CITY ?auto_10356 ?auto_10361 ) ( not ( = ?auto_10356 ?auto_10360 ) ) ( OBJ-AT ?auto_10357 ?auto_10360 ) ( not ( = ?auto_10358 ?auto_10364 ) ) ( IN-CITY ?auto_10363 ?auto_10361 ) ( not ( = ?auto_10356 ?auto_10363 ) ) ( not ( = ?auto_10360 ?auto_10363 ) ) ( OBJ-AT ?auto_10358 ?auto_10363 ) ( TRUCK-AT ?auto_10359 ?auto_10362 ) ( IN-CITY ?auto_10362 ?auto_10361 ) ( not ( = ?auto_10356 ?auto_10362 ) ) ( not ( = ?auto_10360 ?auto_10362 ) ) ( not ( = ?auto_10363 ?auto_10362 ) ) ( OBJ-AT ?auto_10364 ?auto_10362 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10364 ?auto_10357 ?auto_10356 )
      ( DELIVER-2PKG-VERIFY ?auto_10357 ?auto_10358 ?auto_10356 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10386 - OBJ
      ?auto_10387 - OBJ
      ?auto_10388 - OBJ
      ?auto_10385 - LOCATION
    )
    :vars
    (
      ?auto_10390 - LOCATION
      ?auto_10391 - CITY
      ?auto_10393 - LOCATION
      ?auto_10389 - TRUCK
      ?auto_10392 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10387 ?auto_10386 ) ) ( not ( = ?auto_10388 ?auto_10386 ) ) ( not ( = ?auto_10388 ?auto_10387 ) ) ( IN-CITY ?auto_10390 ?auto_10391 ) ( IN-CITY ?auto_10385 ?auto_10391 ) ( not ( = ?auto_10385 ?auto_10390 ) ) ( OBJ-AT ?auto_10388 ?auto_10390 ) ( IN-CITY ?auto_10393 ?auto_10391 ) ( not ( = ?auto_10385 ?auto_10393 ) ) ( not ( = ?auto_10390 ?auto_10393 ) ) ( OBJ-AT ?auto_10387 ?auto_10393 ) ( TRUCK-AT ?auto_10389 ?auto_10392 ) ( IN-CITY ?auto_10392 ?auto_10391 ) ( not ( = ?auto_10385 ?auto_10392 ) ) ( not ( = ?auto_10390 ?auto_10392 ) ) ( not ( = ?auto_10393 ?auto_10392 ) ) ( OBJ-AT ?auto_10386 ?auto_10392 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10386 ?auto_10388 ?auto_10385 )
      ( DELIVER-3PKG-VERIFY ?auto_10386 ?auto_10387 ?auto_10388 ?auto_10385 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10405 - OBJ
      ?auto_10406 - OBJ
      ?auto_10407 - OBJ
      ?auto_10404 - LOCATION
    )
    :vars
    (
      ?auto_10409 - LOCATION
      ?auto_10410 - CITY
      ?auto_10412 - LOCATION
      ?auto_10408 - TRUCK
      ?auto_10411 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10406 ?auto_10405 ) ) ( not ( = ?auto_10407 ?auto_10405 ) ) ( not ( = ?auto_10407 ?auto_10406 ) ) ( IN-CITY ?auto_10409 ?auto_10410 ) ( IN-CITY ?auto_10404 ?auto_10410 ) ( not ( = ?auto_10404 ?auto_10409 ) ) ( OBJ-AT ?auto_10406 ?auto_10409 ) ( IN-CITY ?auto_10412 ?auto_10410 ) ( not ( = ?auto_10404 ?auto_10412 ) ) ( not ( = ?auto_10409 ?auto_10412 ) ) ( OBJ-AT ?auto_10407 ?auto_10412 ) ( TRUCK-AT ?auto_10408 ?auto_10411 ) ( IN-CITY ?auto_10411 ?auto_10410 ) ( not ( = ?auto_10404 ?auto_10411 ) ) ( not ( = ?auto_10409 ?auto_10411 ) ) ( not ( = ?auto_10412 ?auto_10411 ) ) ( OBJ-AT ?auto_10405 ?auto_10411 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10405 ?auto_10406 ?auto_10404 )
      ( DELIVER-3PKG-VERIFY ?auto_10405 ?auto_10406 ?auto_10407 ?auto_10404 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10424 - OBJ
      ?auto_10425 - OBJ
      ?auto_10426 - OBJ
      ?auto_10423 - LOCATION
    )
    :vars
    (
      ?auto_10428 - LOCATION
      ?auto_10429 - CITY
      ?auto_10431 - LOCATION
      ?auto_10427 - TRUCK
      ?auto_10430 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10425 ?auto_10424 ) ) ( not ( = ?auto_10426 ?auto_10424 ) ) ( not ( = ?auto_10426 ?auto_10425 ) ) ( IN-CITY ?auto_10428 ?auto_10429 ) ( IN-CITY ?auto_10423 ?auto_10429 ) ( not ( = ?auto_10423 ?auto_10428 ) ) ( OBJ-AT ?auto_10426 ?auto_10428 ) ( IN-CITY ?auto_10431 ?auto_10429 ) ( not ( = ?auto_10423 ?auto_10431 ) ) ( not ( = ?auto_10428 ?auto_10431 ) ) ( OBJ-AT ?auto_10424 ?auto_10431 ) ( TRUCK-AT ?auto_10427 ?auto_10430 ) ( IN-CITY ?auto_10430 ?auto_10429 ) ( not ( = ?auto_10423 ?auto_10430 ) ) ( not ( = ?auto_10428 ?auto_10430 ) ) ( not ( = ?auto_10431 ?auto_10430 ) ) ( OBJ-AT ?auto_10425 ?auto_10430 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10425 ?auto_10426 ?auto_10423 )
      ( DELIVER-3PKG-VERIFY ?auto_10424 ?auto_10425 ?auto_10426 ?auto_10423 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10443 - OBJ
      ?auto_10444 - OBJ
      ?auto_10445 - OBJ
      ?auto_10442 - LOCATION
    )
    :vars
    (
      ?auto_10447 - LOCATION
      ?auto_10448 - CITY
      ?auto_10450 - LOCATION
      ?auto_10446 - TRUCK
      ?auto_10449 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10444 ?auto_10443 ) ) ( not ( = ?auto_10445 ?auto_10443 ) ) ( not ( = ?auto_10445 ?auto_10444 ) ) ( IN-CITY ?auto_10447 ?auto_10448 ) ( IN-CITY ?auto_10442 ?auto_10448 ) ( not ( = ?auto_10442 ?auto_10447 ) ) ( OBJ-AT ?auto_10444 ?auto_10447 ) ( IN-CITY ?auto_10450 ?auto_10448 ) ( not ( = ?auto_10442 ?auto_10450 ) ) ( not ( = ?auto_10447 ?auto_10450 ) ) ( OBJ-AT ?auto_10443 ?auto_10450 ) ( TRUCK-AT ?auto_10446 ?auto_10449 ) ( IN-CITY ?auto_10449 ?auto_10448 ) ( not ( = ?auto_10442 ?auto_10449 ) ) ( not ( = ?auto_10447 ?auto_10449 ) ) ( not ( = ?auto_10450 ?auto_10449 ) ) ( OBJ-AT ?auto_10445 ?auto_10449 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10445 ?auto_10444 ?auto_10442 )
      ( DELIVER-3PKG-VERIFY ?auto_10443 ?auto_10444 ?auto_10445 ?auto_10442 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10482 - OBJ
      ?auto_10483 - OBJ
      ?auto_10484 - OBJ
      ?auto_10481 - LOCATION
    )
    :vars
    (
      ?auto_10486 - LOCATION
      ?auto_10487 - CITY
      ?auto_10489 - LOCATION
      ?auto_10485 - TRUCK
      ?auto_10488 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10483 ?auto_10482 ) ) ( not ( = ?auto_10484 ?auto_10482 ) ) ( not ( = ?auto_10484 ?auto_10483 ) ) ( IN-CITY ?auto_10486 ?auto_10487 ) ( IN-CITY ?auto_10481 ?auto_10487 ) ( not ( = ?auto_10481 ?auto_10486 ) ) ( OBJ-AT ?auto_10482 ?auto_10486 ) ( IN-CITY ?auto_10489 ?auto_10487 ) ( not ( = ?auto_10481 ?auto_10489 ) ) ( not ( = ?auto_10486 ?auto_10489 ) ) ( OBJ-AT ?auto_10484 ?auto_10489 ) ( TRUCK-AT ?auto_10485 ?auto_10488 ) ( IN-CITY ?auto_10488 ?auto_10487 ) ( not ( = ?auto_10481 ?auto_10488 ) ) ( not ( = ?auto_10486 ?auto_10488 ) ) ( not ( = ?auto_10489 ?auto_10488 ) ) ( OBJ-AT ?auto_10483 ?auto_10488 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10483 ?auto_10482 ?auto_10481 )
      ( DELIVER-3PKG-VERIFY ?auto_10482 ?auto_10483 ?auto_10484 ?auto_10481 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10501 - OBJ
      ?auto_10502 - OBJ
      ?auto_10503 - OBJ
      ?auto_10500 - LOCATION
    )
    :vars
    (
      ?auto_10505 - LOCATION
      ?auto_10506 - CITY
      ?auto_10508 - LOCATION
      ?auto_10504 - TRUCK
      ?auto_10507 - LOCATION
    )
    :precondition
    ( and ( not ( = ?auto_10502 ?auto_10501 ) ) ( not ( = ?auto_10503 ?auto_10501 ) ) ( not ( = ?auto_10503 ?auto_10502 ) ) ( IN-CITY ?auto_10505 ?auto_10506 ) ( IN-CITY ?auto_10500 ?auto_10506 ) ( not ( = ?auto_10500 ?auto_10505 ) ) ( OBJ-AT ?auto_10501 ?auto_10505 ) ( IN-CITY ?auto_10508 ?auto_10506 ) ( not ( = ?auto_10500 ?auto_10508 ) ) ( not ( = ?auto_10505 ?auto_10508 ) ) ( OBJ-AT ?auto_10502 ?auto_10508 ) ( TRUCK-AT ?auto_10504 ?auto_10507 ) ( IN-CITY ?auto_10507 ?auto_10506 ) ( not ( = ?auto_10500 ?auto_10507 ) ) ( not ( = ?auto_10505 ?auto_10507 ) ) ( not ( = ?auto_10508 ?auto_10507 ) ) ( OBJ-AT ?auto_10503 ?auto_10507 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10503 ?auto_10501 ?auto_10500 )
      ( DELIVER-3PKG-VERIFY ?auto_10501 ?auto_10502 ?auto_10503 ?auto_10500 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10561 - OBJ
      ?auto_10560 - LOCATION
    )
    :vars
    (
      ?auto_10568 - OBJ
      ?auto_10564 - LOCATION
      ?auto_10565 - CITY
      ?auto_10563 - OBJ
      ?auto_10567 - LOCATION
      ?auto_10566 - LOCATION
      ?auto_10562 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10561 ?auto_10568 ) ) ( IN-CITY ?auto_10564 ?auto_10565 ) ( IN-CITY ?auto_10560 ?auto_10565 ) ( not ( = ?auto_10560 ?auto_10564 ) ) ( OBJ-AT ?auto_10561 ?auto_10564 ) ( not ( = ?auto_10563 ?auto_10568 ) ) ( not ( = ?auto_10561 ?auto_10563 ) ) ( IN-CITY ?auto_10567 ?auto_10565 ) ( not ( = ?auto_10560 ?auto_10567 ) ) ( not ( = ?auto_10564 ?auto_10567 ) ) ( OBJ-AT ?auto_10563 ?auto_10567 ) ( IN-CITY ?auto_10566 ?auto_10565 ) ( not ( = ?auto_10560 ?auto_10566 ) ) ( not ( = ?auto_10564 ?auto_10566 ) ) ( not ( = ?auto_10567 ?auto_10566 ) ) ( OBJ-AT ?auto_10568 ?auto_10566 ) ( TRUCK-AT ?auto_10562 ?auto_10560 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10562 ?auto_10560 ?auto_10566 ?auto_10565 )
      ( DELIVER-2PKG ?auto_10568 ?auto_10561 ?auto_10560 )
      ( DELIVER-1PKG-VERIFY ?auto_10561 ?auto_10560 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10570 - OBJ
      ?auto_10571 - OBJ
      ?auto_10569 - LOCATION
    )
    :vars
    (
      ?auto_10572 - LOCATION
      ?auto_10576 - CITY
      ?auto_10573 - OBJ
      ?auto_10577 - LOCATION
      ?auto_10574 - LOCATION
      ?auto_10575 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10571 ?auto_10570 ) ) ( IN-CITY ?auto_10572 ?auto_10576 ) ( IN-CITY ?auto_10569 ?auto_10576 ) ( not ( = ?auto_10569 ?auto_10572 ) ) ( OBJ-AT ?auto_10571 ?auto_10572 ) ( not ( = ?auto_10573 ?auto_10570 ) ) ( not ( = ?auto_10571 ?auto_10573 ) ) ( IN-CITY ?auto_10577 ?auto_10576 ) ( not ( = ?auto_10569 ?auto_10577 ) ) ( not ( = ?auto_10572 ?auto_10577 ) ) ( OBJ-AT ?auto_10573 ?auto_10577 ) ( IN-CITY ?auto_10574 ?auto_10576 ) ( not ( = ?auto_10569 ?auto_10574 ) ) ( not ( = ?auto_10572 ?auto_10574 ) ) ( not ( = ?auto_10577 ?auto_10574 ) ) ( OBJ-AT ?auto_10570 ?auto_10574 ) ( TRUCK-AT ?auto_10575 ?auto_10569 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10571 ?auto_10569 )
      ( DELIVER-2PKG-VERIFY ?auto_10570 ?auto_10571 ?auto_10569 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10579 - OBJ
      ?auto_10580 - OBJ
      ?auto_10578 - LOCATION
    )
    :vars
    (
      ?auto_10586 - OBJ
      ?auto_10581 - LOCATION
      ?auto_10583 - CITY
      ?auto_10584 - LOCATION
      ?auto_10585 - LOCATION
      ?auto_10582 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10580 ?auto_10579 ) ) ( not ( = ?auto_10580 ?auto_10586 ) ) ( IN-CITY ?auto_10581 ?auto_10583 ) ( IN-CITY ?auto_10578 ?auto_10583 ) ( not ( = ?auto_10578 ?auto_10581 ) ) ( OBJ-AT ?auto_10580 ?auto_10581 ) ( not ( = ?auto_10579 ?auto_10586 ) ) ( IN-CITY ?auto_10584 ?auto_10583 ) ( not ( = ?auto_10578 ?auto_10584 ) ) ( not ( = ?auto_10581 ?auto_10584 ) ) ( OBJ-AT ?auto_10579 ?auto_10584 ) ( IN-CITY ?auto_10585 ?auto_10583 ) ( not ( = ?auto_10578 ?auto_10585 ) ) ( not ( = ?auto_10581 ?auto_10585 ) ) ( not ( = ?auto_10584 ?auto_10585 ) ) ( OBJ-AT ?auto_10586 ?auto_10585 ) ( TRUCK-AT ?auto_10582 ?auto_10578 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10586 ?auto_10580 ?auto_10578 )
      ( DELIVER-2PKG-VERIFY ?auto_10579 ?auto_10580 ?auto_10578 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10588 - OBJ
      ?auto_10589 - OBJ
      ?auto_10587 - LOCATION
    )
    :vars
    (
      ?auto_10590 - LOCATION
      ?auto_10592 - CITY
      ?auto_10594 - OBJ
      ?auto_10593 - LOCATION
      ?auto_10595 - LOCATION
      ?auto_10591 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10589 ?auto_10588 ) ) ( IN-CITY ?auto_10590 ?auto_10592 ) ( IN-CITY ?auto_10587 ?auto_10592 ) ( not ( = ?auto_10587 ?auto_10590 ) ) ( OBJ-AT ?auto_10588 ?auto_10590 ) ( not ( = ?auto_10594 ?auto_10589 ) ) ( not ( = ?auto_10588 ?auto_10594 ) ) ( IN-CITY ?auto_10593 ?auto_10592 ) ( not ( = ?auto_10587 ?auto_10593 ) ) ( not ( = ?auto_10590 ?auto_10593 ) ) ( OBJ-AT ?auto_10594 ?auto_10593 ) ( IN-CITY ?auto_10595 ?auto_10592 ) ( not ( = ?auto_10587 ?auto_10595 ) ) ( not ( = ?auto_10590 ?auto_10595 ) ) ( not ( = ?auto_10593 ?auto_10595 ) ) ( OBJ-AT ?auto_10589 ?auto_10595 ) ( TRUCK-AT ?auto_10591 ?auto_10587 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10589 ?auto_10588 ?auto_10587 )
      ( DELIVER-2PKG-VERIFY ?auto_10588 ?auto_10589 ?auto_10587 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10597 - OBJ
      ?auto_10598 - OBJ
      ?auto_10596 - LOCATION
    )
    :vars
    (
      ?auto_10604 - OBJ
      ?auto_10599 - LOCATION
      ?auto_10601 - CITY
      ?auto_10602 - LOCATION
      ?auto_10603 - LOCATION
      ?auto_10600 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10598 ?auto_10597 ) ) ( not ( = ?auto_10597 ?auto_10604 ) ) ( IN-CITY ?auto_10599 ?auto_10601 ) ( IN-CITY ?auto_10596 ?auto_10601 ) ( not ( = ?auto_10596 ?auto_10599 ) ) ( OBJ-AT ?auto_10597 ?auto_10599 ) ( not ( = ?auto_10598 ?auto_10604 ) ) ( IN-CITY ?auto_10602 ?auto_10601 ) ( not ( = ?auto_10596 ?auto_10602 ) ) ( not ( = ?auto_10599 ?auto_10602 ) ) ( OBJ-AT ?auto_10598 ?auto_10602 ) ( IN-CITY ?auto_10603 ?auto_10601 ) ( not ( = ?auto_10596 ?auto_10603 ) ) ( not ( = ?auto_10599 ?auto_10603 ) ) ( not ( = ?auto_10602 ?auto_10603 ) ) ( OBJ-AT ?auto_10604 ?auto_10603 ) ( TRUCK-AT ?auto_10600 ?auto_10596 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10604 ?auto_10597 ?auto_10596 )
      ( DELIVER-2PKG-VERIFY ?auto_10597 ?auto_10598 ?auto_10596 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10626 - OBJ
      ?auto_10627 - OBJ
      ?auto_10628 - OBJ
      ?auto_10625 - LOCATION
    )
    :vars
    (
      ?auto_10629 - LOCATION
      ?auto_10631 - CITY
      ?auto_10632 - LOCATION
      ?auto_10633 - LOCATION
      ?auto_10630 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10627 ?auto_10626 ) ) ( not ( = ?auto_10628 ?auto_10626 ) ) ( not ( = ?auto_10628 ?auto_10627 ) ) ( IN-CITY ?auto_10629 ?auto_10631 ) ( IN-CITY ?auto_10625 ?auto_10631 ) ( not ( = ?auto_10625 ?auto_10629 ) ) ( OBJ-AT ?auto_10628 ?auto_10629 ) ( IN-CITY ?auto_10632 ?auto_10631 ) ( not ( = ?auto_10625 ?auto_10632 ) ) ( not ( = ?auto_10629 ?auto_10632 ) ) ( OBJ-AT ?auto_10627 ?auto_10632 ) ( IN-CITY ?auto_10633 ?auto_10631 ) ( not ( = ?auto_10625 ?auto_10633 ) ) ( not ( = ?auto_10629 ?auto_10633 ) ) ( not ( = ?auto_10632 ?auto_10633 ) ) ( OBJ-AT ?auto_10626 ?auto_10633 ) ( TRUCK-AT ?auto_10630 ?auto_10625 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10626 ?auto_10628 ?auto_10625 )
      ( DELIVER-3PKG-VERIFY ?auto_10626 ?auto_10627 ?auto_10628 ?auto_10625 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10645 - OBJ
      ?auto_10646 - OBJ
      ?auto_10647 - OBJ
      ?auto_10644 - LOCATION
    )
    :vars
    (
      ?auto_10648 - LOCATION
      ?auto_10650 - CITY
      ?auto_10651 - LOCATION
      ?auto_10652 - LOCATION
      ?auto_10649 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10646 ?auto_10645 ) ) ( not ( = ?auto_10647 ?auto_10645 ) ) ( not ( = ?auto_10647 ?auto_10646 ) ) ( IN-CITY ?auto_10648 ?auto_10650 ) ( IN-CITY ?auto_10644 ?auto_10650 ) ( not ( = ?auto_10644 ?auto_10648 ) ) ( OBJ-AT ?auto_10646 ?auto_10648 ) ( IN-CITY ?auto_10651 ?auto_10650 ) ( not ( = ?auto_10644 ?auto_10651 ) ) ( not ( = ?auto_10648 ?auto_10651 ) ) ( OBJ-AT ?auto_10647 ?auto_10651 ) ( IN-CITY ?auto_10652 ?auto_10650 ) ( not ( = ?auto_10644 ?auto_10652 ) ) ( not ( = ?auto_10648 ?auto_10652 ) ) ( not ( = ?auto_10651 ?auto_10652 ) ) ( OBJ-AT ?auto_10645 ?auto_10652 ) ( TRUCK-AT ?auto_10649 ?auto_10644 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10645 ?auto_10646 ?auto_10644 )
      ( DELIVER-3PKG-VERIFY ?auto_10645 ?auto_10646 ?auto_10647 ?auto_10644 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10664 - OBJ
      ?auto_10665 - OBJ
      ?auto_10666 - OBJ
      ?auto_10663 - LOCATION
    )
    :vars
    (
      ?auto_10667 - LOCATION
      ?auto_10669 - CITY
      ?auto_10670 - LOCATION
      ?auto_10671 - LOCATION
      ?auto_10668 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10665 ?auto_10664 ) ) ( not ( = ?auto_10666 ?auto_10664 ) ) ( not ( = ?auto_10666 ?auto_10665 ) ) ( IN-CITY ?auto_10667 ?auto_10669 ) ( IN-CITY ?auto_10663 ?auto_10669 ) ( not ( = ?auto_10663 ?auto_10667 ) ) ( OBJ-AT ?auto_10666 ?auto_10667 ) ( IN-CITY ?auto_10670 ?auto_10669 ) ( not ( = ?auto_10663 ?auto_10670 ) ) ( not ( = ?auto_10667 ?auto_10670 ) ) ( OBJ-AT ?auto_10664 ?auto_10670 ) ( IN-CITY ?auto_10671 ?auto_10669 ) ( not ( = ?auto_10663 ?auto_10671 ) ) ( not ( = ?auto_10667 ?auto_10671 ) ) ( not ( = ?auto_10670 ?auto_10671 ) ) ( OBJ-AT ?auto_10665 ?auto_10671 ) ( TRUCK-AT ?auto_10668 ?auto_10663 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10665 ?auto_10666 ?auto_10663 )
      ( DELIVER-3PKG-VERIFY ?auto_10664 ?auto_10665 ?auto_10666 ?auto_10663 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10683 - OBJ
      ?auto_10684 - OBJ
      ?auto_10685 - OBJ
      ?auto_10682 - LOCATION
    )
    :vars
    (
      ?auto_10686 - LOCATION
      ?auto_10688 - CITY
      ?auto_10689 - LOCATION
      ?auto_10690 - LOCATION
      ?auto_10687 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10684 ?auto_10683 ) ) ( not ( = ?auto_10685 ?auto_10683 ) ) ( not ( = ?auto_10685 ?auto_10684 ) ) ( IN-CITY ?auto_10686 ?auto_10688 ) ( IN-CITY ?auto_10682 ?auto_10688 ) ( not ( = ?auto_10682 ?auto_10686 ) ) ( OBJ-AT ?auto_10684 ?auto_10686 ) ( IN-CITY ?auto_10689 ?auto_10688 ) ( not ( = ?auto_10682 ?auto_10689 ) ) ( not ( = ?auto_10686 ?auto_10689 ) ) ( OBJ-AT ?auto_10683 ?auto_10689 ) ( IN-CITY ?auto_10690 ?auto_10688 ) ( not ( = ?auto_10682 ?auto_10690 ) ) ( not ( = ?auto_10686 ?auto_10690 ) ) ( not ( = ?auto_10689 ?auto_10690 ) ) ( OBJ-AT ?auto_10685 ?auto_10690 ) ( TRUCK-AT ?auto_10687 ?auto_10682 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10685 ?auto_10684 ?auto_10682 )
      ( DELIVER-3PKG-VERIFY ?auto_10683 ?auto_10684 ?auto_10685 ?auto_10682 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10722 - OBJ
      ?auto_10723 - OBJ
      ?auto_10724 - OBJ
      ?auto_10721 - LOCATION
    )
    :vars
    (
      ?auto_10725 - LOCATION
      ?auto_10727 - CITY
      ?auto_10728 - LOCATION
      ?auto_10729 - LOCATION
      ?auto_10726 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10723 ?auto_10722 ) ) ( not ( = ?auto_10724 ?auto_10722 ) ) ( not ( = ?auto_10724 ?auto_10723 ) ) ( IN-CITY ?auto_10725 ?auto_10727 ) ( IN-CITY ?auto_10721 ?auto_10727 ) ( not ( = ?auto_10721 ?auto_10725 ) ) ( OBJ-AT ?auto_10722 ?auto_10725 ) ( IN-CITY ?auto_10728 ?auto_10727 ) ( not ( = ?auto_10721 ?auto_10728 ) ) ( not ( = ?auto_10725 ?auto_10728 ) ) ( OBJ-AT ?auto_10724 ?auto_10728 ) ( IN-CITY ?auto_10729 ?auto_10727 ) ( not ( = ?auto_10721 ?auto_10729 ) ) ( not ( = ?auto_10725 ?auto_10729 ) ) ( not ( = ?auto_10728 ?auto_10729 ) ) ( OBJ-AT ?auto_10723 ?auto_10729 ) ( TRUCK-AT ?auto_10726 ?auto_10721 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10723 ?auto_10722 ?auto_10721 )
      ( DELIVER-3PKG-VERIFY ?auto_10722 ?auto_10723 ?auto_10724 ?auto_10721 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10741 - OBJ
      ?auto_10742 - OBJ
      ?auto_10743 - OBJ
      ?auto_10740 - LOCATION
    )
    :vars
    (
      ?auto_10744 - LOCATION
      ?auto_10746 - CITY
      ?auto_10747 - LOCATION
      ?auto_10748 - LOCATION
      ?auto_10745 - TRUCK
    )
    :precondition
    ( and ( not ( = ?auto_10742 ?auto_10741 ) ) ( not ( = ?auto_10743 ?auto_10741 ) ) ( not ( = ?auto_10743 ?auto_10742 ) ) ( IN-CITY ?auto_10744 ?auto_10746 ) ( IN-CITY ?auto_10740 ?auto_10746 ) ( not ( = ?auto_10740 ?auto_10744 ) ) ( OBJ-AT ?auto_10741 ?auto_10744 ) ( IN-CITY ?auto_10747 ?auto_10746 ) ( not ( = ?auto_10740 ?auto_10747 ) ) ( not ( = ?auto_10744 ?auto_10747 ) ) ( OBJ-AT ?auto_10742 ?auto_10747 ) ( IN-CITY ?auto_10748 ?auto_10746 ) ( not ( = ?auto_10740 ?auto_10748 ) ) ( not ( = ?auto_10744 ?auto_10748 ) ) ( not ( = ?auto_10747 ?auto_10748 ) ) ( OBJ-AT ?auto_10743 ?auto_10748 ) ( TRUCK-AT ?auto_10745 ?auto_10740 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10743 ?auto_10741 ?auto_10740 )
      ( DELIVER-3PKG-VERIFY ?auto_10741 ?auto_10742 ?auto_10743 ?auto_10740 ) )
  )

)

