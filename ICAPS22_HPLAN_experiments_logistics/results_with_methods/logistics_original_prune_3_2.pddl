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
      ?auto_6757 - OBJ
      ?auto_6756 - LOCATION
    )
    :vars
    (
      ?auto_6758 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6758 ?auto_6756 ) ( IN-TRUCK ?auto_6757 ?auto_6758 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_6757 ?auto_6758 ?auto_6756 )
      ( DELIVER-1PKG-VERIFY ?auto_6757 ?auto_6756 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6769 - OBJ
      ?auto_6768 - LOCATION
    )
    :vars
    (
      ?auto_6770 - TRUCK
      ?auto_6771 - LOCATION
      ?auto_6772 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6769 ?auto_6770 ) ( TRUCK-AT ?auto_6770 ?auto_6771 ) ( IN-CITY ?auto_6771 ?auto_6772 ) ( IN-CITY ?auto_6768 ?auto_6772 ) ( not ( = ?auto_6768 ?auto_6771 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6770 ?auto_6771 ?auto_6768 ?auto_6772 )
      ( DELIVER-1PKG ?auto_6769 ?auto_6768 )
      ( DELIVER-1PKG-VERIFY ?auto_6769 ?auto_6768 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6787 - OBJ
      ?auto_6786 - LOCATION
    )
    :vars
    (
      ?auto_6790 - TRUCK
      ?auto_6788 - LOCATION
      ?auto_6789 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6790 ?auto_6788 ) ( IN-CITY ?auto_6788 ?auto_6789 ) ( IN-CITY ?auto_6786 ?auto_6789 ) ( not ( = ?auto_6786 ?auto_6788 ) ) ( OBJ-AT ?auto_6787 ?auto_6788 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6787 ?auto_6790 ?auto_6788 )
      ( DELIVER-1PKG ?auto_6787 ?auto_6786 )
      ( DELIVER-1PKG-VERIFY ?auto_6787 ?auto_6786 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6805 - OBJ
      ?auto_6804 - LOCATION
    )
    :vars
    (
      ?auto_6806 - LOCATION
      ?auto_6808 - CITY
      ?auto_6807 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6806 ?auto_6808 ) ( IN-CITY ?auto_6804 ?auto_6808 ) ( not ( = ?auto_6804 ?auto_6806 ) ) ( OBJ-AT ?auto_6805 ?auto_6806 ) ( TRUCK-AT ?auto_6807 ?auto_6804 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6807 ?auto_6804 ?auto_6806 ?auto_6808 )
      ( DELIVER-1PKG ?auto_6805 ?auto_6804 )
      ( DELIVER-1PKG-VERIFY ?auto_6805 ?auto_6804 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6865 - OBJ
      ?auto_6866 - OBJ
      ?auto_6864 - LOCATION
    )
    :vars
    (
      ?auto_6867 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6867 ?auto_6864 ) ( IN-TRUCK ?auto_6866 ?auto_6867 ) ( OBJ-AT ?auto_6865 ?auto_6864 ) ( not ( = ?auto_6865 ?auto_6866 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6866 ?auto_6864 )
      ( DELIVER-2PKG-VERIFY ?auto_6865 ?auto_6866 ?auto_6864 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6869 - OBJ
      ?auto_6870 - OBJ
      ?auto_6868 - LOCATION
    )
    :vars
    (
      ?auto_6871 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6871 ?auto_6868 ) ( IN-TRUCK ?auto_6869 ?auto_6871 ) ( OBJ-AT ?auto_6870 ?auto_6868 ) ( not ( = ?auto_6869 ?auto_6870 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6869 ?auto_6868 )
      ( DELIVER-2PKG-VERIFY ?auto_6869 ?auto_6870 ?auto_6868 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6877 - OBJ
      ?auto_6878 - OBJ
      ?auto_6879 - OBJ
      ?auto_6876 - LOCATION
    )
    :vars
    (
      ?auto_6880 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6880 ?auto_6876 ) ( IN-TRUCK ?auto_6879 ?auto_6880 ) ( OBJ-AT ?auto_6877 ?auto_6876 ) ( OBJ-AT ?auto_6878 ?auto_6876 ) ( not ( = ?auto_6877 ?auto_6878 ) ) ( not ( = ?auto_6877 ?auto_6879 ) ) ( not ( = ?auto_6878 ?auto_6879 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6879 ?auto_6876 )
      ( DELIVER-3PKG-VERIFY ?auto_6877 ?auto_6878 ?auto_6879 ?auto_6876 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6882 - OBJ
      ?auto_6883 - OBJ
      ?auto_6884 - OBJ
      ?auto_6881 - LOCATION
    )
    :vars
    (
      ?auto_6885 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6885 ?auto_6881 ) ( IN-TRUCK ?auto_6883 ?auto_6885 ) ( OBJ-AT ?auto_6882 ?auto_6881 ) ( OBJ-AT ?auto_6884 ?auto_6881 ) ( not ( = ?auto_6882 ?auto_6883 ) ) ( not ( = ?auto_6882 ?auto_6884 ) ) ( not ( = ?auto_6883 ?auto_6884 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6883 ?auto_6881 )
      ( DELIVER-3PKG-VERIFY ?auto_6882 ?auto_6883 ?auto_6884 ?auto_6881 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6892 - OBJ
      ?auto_6893 - OBJ
      ?auto_6894 - OBJ
      ?auto_6891 - LOCATION
    )
    :vars
    (
      ?auto_6895 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6895 ?auto_6891 ) ( IN-TRUCK ?auto_6892 ?auto_6895 ) ( OBJ-AT ?auto_6893 ?auto_6891 ) ( OBJ-AT ?auto_6894 ?auto_6891 ) ( not ( = ?auto_6892 ?auto_6893 ) ) ( not ( = ?auto_6892 ?auto_6894 ) ) ( not ( = ?auto_6893 ?auto_6894 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6892 ?auto_6891 )
      ( DELIVER-3PKG-VERIFY ?auto_6892 ?auto_6893 ?auto_6894 ?auto_6891 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6917 - OBJ
      ?auto_6918 - OBJ
      ?auto_6916 - LOCATION
    )
    :vars
    (
      ?auto_6919 - TRUCK
      ?auto_6920 - LOCATION
      ?auto_6921 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6918 ?auto_6919 ) ( TRUCK-AT ?auto_6919 ?auto_6920 ) ( IN-CITY ?auto_6920 ?auto_6921 ) ( IN-CITY ?auto_6916 ?auto_6921 ) ( not ( = ?auto_6916 ?auto_6920 ) ) ( OBJ-AT ?auto_6917 ?auto_6916 ) ( not ( = ?auto_6917 ?auto_6918 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6918 ?auto_6916 )
      ( DELIVER-2PKG-VERIFY ?auto_6917 ?auto_6918 ?auto_6916 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6923 - OBJ
      ?auto_6924 - OBJ
      ?auto_6922 - LOCATION
    )
    :vars
    (
      ?auto_6927 - TRUCK
      ?auto_6926 - LOCATION
      ?auto_6925 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6923 ?auto_6927 ) ( TRUCK-AT ?auto_6927 ?auto_6926 ) ( IN-CITY ?auto_6926 ?auto_6925 ) ( IN-CITY ?auto_6922 ?auto_6925 ) ( not ( = ?auto_6922 ?auto_6926 ) ) ( OBJ-AT ?auto_6924 ?auto_6922 ) ( not ( = ?auto_6924 ?auto_6923 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6924 ?auto_6923 ?auto_6922 )
      ( DELIVER-2PKG-VERIFY ?auto_6923 ?auto_6924 ?auto_6922 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6936 - OBJ
      ?auto_6937 - OBJ
      ?auto_6938 - OBJ
      ?auto_6935 - LOCATION
    )
    :vars
    (
      ?auto_6941 - TRUCK
      ?auto_6940 - LOCATION
      ?auto_6939 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6938 ?auto_6941 ) ( TRUCK-AT ?auto_6941 ?auto_6940 ) ( IN-CITY ?auto_6940 ?auto_6939 ) ( IN-CITY ?auto_6935 ?auto_6939 ) ( not ( = ?auto_6935 ?auto_6940 ) ) ( OBJ-AT ?auto_6936 ?auto_6935 ) ( not ( = ?auto_6936 ?auto_6938 ) ) ( OBJ-AT ?auto_6937 ?auto_6935 ) ( not ( = ?auto_6936 ?auto_6937 ) ) ( not ( = ?auto_6937 ?auto_6938 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6936 ?auto_6938 ?auto_6935 )
      ( DELIVER-3PKG-VERIFY ?auto_6936 ?auto_6937 ?auto_6938 ?auto_6935 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6943 - OBJ
      ?auto_6944 - OBJ
      ?auto_6945 - OBJ
      ?auto_6942 - LOCATION
    )
    :vars
    (
      ?auto_6948 - TRUCK
      ?auto_6947 - LOCATION
      ?auto_6946 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6944 ?auto_6948 ) ( TRUCK-AT ?auto_6948 ?auto_6947 ) ( IN-CITY ?auto_6947 ?auto_6946 ) ( IN-CITY ?auto_6942 ?auto_6946 ) ( not ( = ?auto_6942 ?auto_6947 ) ) ( OBJ-AT ?auto_6945 ?auto_6942 ) ( not ( = ?auto_6945 ?auto_6944 ) ) ( OBJ-AT ?auto_6943 ?auto_6942 ) ( not ( = ?auto_6943 ?auto_6944 ) ) ( not ( = ?auto_6943 ?auto_6945 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6945 ?auto_6944 ?auto_6942 )
      ( DELIVER-3PKG-VERIFY ?auto_6943 ?auto_6944 ?auto_6945 ?auto_6942 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6957 - OBJ
      ?auto_6958 - OBJ
      ?auto_6959 - OBJ
      ?auto_6956 - LOCATION
    )
    :vars
    (
      ?auto_6962 - TRUCK
      ?auto_6961 - LOCATION
      ?auto_6960 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6957 ?auto_6962 ) ( TRUCK-AT ?auto_6962 ?auto_6961 ) ( IN-CITY ?auto_6961 ?auto_6960 ) ( IN-CITY ?auto_6956 ?auto_6960 ) ( not ( = ?auto_6956 ?auto_6961 ) ) ( OBJ-AT ?auto_6959 ?auto_6956 ) ( not ( = ?auto_6959 ?auto_6957 ) ) ( OBJ-AT ?auto_6958 ?auto_6956 ) ( not ( = ?auto_6957 ?auto_6958 ) ) ( not ( = ?auto_6958 ?auto_6959 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6959 ?auto_6957 ?auto_6956 )
      ( DELIVER-3PKG-VERIFY ?auto_6957 ?auto_6958 ?auto_6959 ?auto_6956 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6986 - OBJ
      ?auto_6985 - LOCATION
    )
    :vars
    (
      ?auto_6990 - TRUCK
      ?auto_6988 - LOCATION
      ?auto_6987 - CITY
      ?auto_6989 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6990 ?auto_6988 ) ( IN-CITY ?auto_6988 ?auto_6987 ) ( IN-CITY ?auto_6985 ?auto_6987 ) ( not ( = ?auto_6985 ?auto_6988 ) ) ( OBJ-AT ?auto_6989 ?auto_6985 ) ( not ( = ?auto_6989 ?auto_6986 ) ) ( OBJ-AT ?auto_6986 ?auto_6988 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6986 ?auto_6990 ?auto_6988 )
      ( DELIVER-2PKG ?auto_6989 ?auto_6986 ?auto_6985 )
      ( DELIVER-1PKG-VERIFY ?auto_6986 ?auto_6985 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6992 - OBJ
      ?auto_6993 - OBJ
      ?auto_6991 - LOCATION
    )
    :vars
    (
      ?auto_6996 - TRUCK
      ?auto_6995 - LOCATION
      ?auto_6994 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6996 ?auto_6995 ) ( IN-CITY ?auto_6995 ?auto_6994 ) ( IN-CITY ?auto_6991 ?auto_6994 ) ( not ( = ?auto_6991 ?auto_6995 ) ) ( OBJ-AT ?auto_6992 ?auto_6991 ) ( not ( = ?auto_6992 ?auto_6993 ) ) ( OBJ-AT ?auto_6993 ?auto_6995 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6993 ?auto_6991 )
      ( DELIVER-2PKG-VERIFY ?auto_6992 ?auto_6993 ?auto_6991 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6998 - OBJ
      ?auto_6999 - OBJ
      ?auto_6997 - LOCATION
    )
    :vars
    (
      ?auto_7002 - TRUCK
      ?auto_7001 - LOCATION
      ?auto_7000 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7002 ?auto_7001 ) ( IN-CITY ?auto_7001 ?auto_7000 ) ( IN-CITY ?auto_6997 ?auto_7000 ) ( not ( = ?auto_6997 ?auto_7001 ) ) ( OBJ-AT ?auto_6999 ?auto_6997 ) ( not ( = ?auto_6999 ?auto_6998 ) ) ( OBJ-AT ?auto_6998 ?auto_7001 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6999 ?auto_6998 ?auto_6997 )
      ( DELIVER-2PKG-VERIFY ?auto_6998 ?auto_6999 ?auto_6997 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7011 - OBJ
      ?auto_7012 - OBJ
      ?auto_7013 - OBJ
      ?auto_7010 - LOCATION
    )
    :vars
    (
      ?auto_7016 - TRUCK
      ?auto_7015 - LOCATION
      ?auto_7014 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7016 ?auto_7015 ) ( IN-CITY ?auto_7015 ?auto_7014 ) ( IN-CITY ?auto_7010 ?auto_7014 ) ( not ( = ?auto_7010 ?auto_7015 ) ) ( OBJ-AT ?auto_7012 ?auto_7010 ) ( not ( = ?auto_7012 ?auto_7013 ) ) ( OBJ-AT ?auto_7013 ?auto_7015 ) ( OBJ-AT ?auto_7011 ?auto_7010 ) ( not ( = ?auto_7011 ?auto_7012 ) ) ( not ( = ?auto_7011 ?auto_7013 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7012 ?auto_7013 ?auto_7010 )
      ( DELIVER-3PKG-VERIFY ?auto_7011 ?auto_7012 ?auto_7013 ?auto_7010 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7018 - OBJ
      ?auto_7019 - OBJ
      ?auto_7020 - OBJ
      ?auto_7017 - LOCATION
    )
    :vars
    (
      ?auto_7023 - TRUCK
      ?auto_7022 - LOCATION
      ?auto_7021 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7023 ?auto_7022 ) ( IN-CITY ?auto_7022 ?auto_7021 ) ( IN-CITY ?auto_7017 ?auto_7021 ) ( not ( = ?auto_7017 ?auto_7022 ) ) ( OBJ-AT ?auto_7018 ?auto_7017 ) ( not ( = ?auto_7018 ?auto_7019 ) ) ( OBJ-AT ?auto_7019 ?auto_7022 ) ( OBJ-AT ?auto_7020 ?auto_7017 ) ( not ( = ?auto_7018 ?auto_7020 ) ) ( not ( = ?auto_7019 ?auto_7020 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7018 ?auto_7019 ?auto_7017 )
      ( DELIVER-3PKG-VERIFY ?auto_7018 ?auto_7019 ?auto_7020 ?auto_7017 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7032 - OBJ
      ?auto_7033 - OBJ
      ?auto_7034 - OBJ
      ?auto_7031 - LOCATION
    )
    :vars
    (
      ?auto_7037 - TRUCK
      ?auto_7036 - LOCATION
      ?auto_7035 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7037 ?auto_7036 ) ( IN-CITY ?auto_7036 ?auto_7035 ) ( IN-CITY ?auto_7031 ?auto_7035 ) ( not ( = ?auto_7031 ?auto_7036 ) ) ( OBJ-AT ?auto_7033 ?auto_7031 ) ( not ( = ?auto_7033 ?auto_7032 ) ) ( OBJ-AT ?auto_7032 ?auto_7036 ) ( OBJ-AT ?auto_7034 ?auto_7031 ) ( not ( = ?auto_7032 ?auto_7034 ) ) ( not ( = ?auto_7033 ?auto_7034 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7033 ?auto_7032 ?auto_7031 )
      ( DELIVER-3PKG-VERIFY ?auto_7032 ?auto_7033 ?auto_7034 ?auto_7031 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7061 - OBJ
      ?auto_7060 - LOCATION
    )
    :vars
    (
      ?auto_7064 - LOCATION
      ?auto_7063 - CITY
      ?auto_7062 - OBJ
      ?auto_7065 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7064 ?auto_7063 ) ( IN-CITY ?auto_7060 ?auto_7063 ) ( not ( = ?auto_7060 ?auto_7064 ) ) ( OBJ-AT ?auto_7062 ?auto_7060 ) ( not ( = ?auto_7062 ?auto_7061 ) ) ( OBJ-AT ?auto_7061 ?auto_7064 ) ( TRUCK-AT ?auto_7065 ?auto_7060 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7065 ?auto_7060 ?auto_7064 ?auto_7063 )
      ( DELIVER-2PKG ?auto_7062 ?auto_7061 ?auto_7060 )
      ( DELIVER-1PKG-VERIFY ?auto_7061 ?auto_7060 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7067 - OBJ
      ?auto_7068 - OBJ
      ?auto_7066 - LOCATION
    )
    :vars
    (
      ?auto_7071 - LOCATION
      ?auto_7069 - CITY
      ?auto_7070 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7071 ?auto_7069 ) ( IN-CITY ?auto_7066 ?auto_7069 ) ( not ( = ?auto_7066 ?auto_7071 ) ) ( OBJ-AT ?auto_7067 ?auto_7066 ) ( not ( = ?auto_7067 ?auto_7068 ) ) ( OBJ-AT ?auto_7068 ?auto_7071 ) ( TRUCK-AT ?auto_7070 ?auto_7066 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7068 ?auto_7066 )
      ( DELIVER-2PKG-VERIFY ?auto_7067 ?auto_7068 ?auto_7066 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7073 - OBJ
      ?auto_7074 - OBJ
      ?auto_7072 - LOCATION
    )
    :vars
    (
      ?auto_7075 - LOCATION
      ?auto_7076 - CITY
      ?auto_7077 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7075 ?auto_7076 ) ( IN-CITY ?auto_7072 ?auto_7076 ) ( not ( = ?auto_7072 ?auto_7075 ) ) ( OBJ-AT ?auto_7074 ?auto_7072 ) ( not ( = ?auto_7074 ?auto_7073 ) ) ( OBJ-AT ?auto_7073 ?auto_7075 ) ( TRUCK-AT ?auto_7077 ?auto_7072 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7074 ?auto_7073 ?auto_7072 )
      ( DELIVER-2PKG-VERIFY ?auto_7073 ?auto_7074 ?auto_7072 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7086 - OBJ
      ?auto_7087 - OBJ
      ?auto_7088 - OBJ
      ?auto_7085 - LOCATION
    )
    :vars
    (
      ?auto_7089 - LOCATION
      ?auto_7090 - CITY
      ?auto_7091 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7089 ?auto_7090 ) ( IN-CITY ?auto_7085 ?auto_7090 ) ( not ( = ?auto_7085 ?auto_7089 ) ) ( OBJ-AT ?auto_7086 ?auto_7085 ) ( not ( = ?auto_7086 ?auto_7088 ) ) ( OBJ-AT ?auto_7088 ?auto_7089 ) ( TRUCK-AT ?auto_7091 ?auto_7085 ) ( OBJ-AT ?auto_7087 ?auto_7085 ) ( not ( = ?auto_7086 ?auto_7087 ) ) ( not ( = ?auto_7087 ?auto_7088 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7086 ?auto_7088 ?auto_7085 )
      ( DELIVER-3PKG-VERIFY ?auto_7086 ?auto_7087 ?auto_7088 ?auto_7085 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7093 - OBJ
      ?auto_7094 - OBJ
      ?auto_7095 - OBJ
      ?auto_7092 - LOCATION
    )
    :vars
    (
      ?auto_7096 - LOCATION
      ?auto_7097 - CITY
      ?auto_7098 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7096 ?auto_7097 ) ( IN-CITY ?auto_7092 ?auto_7097 ) ( not ( = ?auto_7092 ?auto_7096 ) ) ( OBJ-AT ?auto_7095 ?auto_7092 ) ( not ( = ?auto_7095 ?auto_7094 ) ) ( OBJ-AT ?auto_7094 ?auto_7096 ) ( TRUCK-AT ?auto_7098 ?auto_7092 ) ( OBJ-AT ?auto_7093 ?auto_7092 ) ( not ( = ?auto_7093 ?auto_7094 ) ) ( not ( = ?auto_7093 ?auto_7095 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7095 ?auto_7094 ?auto_7092 )
      ( DELIVER-3PKG-VERIFY ?auto_7093 ?auto_7094 ?auto_7095 ?auto_7092 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7107 - OBJ
      ?auto_7108 - OBJ
      ?auto_7109 - OBJ
      ?auto_7106 - LOCATION
    )
    :vars
    (
      ?auto_7110 - LOCATION
      ?auto_7111 - CITY
      ?auto_7112 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7110 ?auto_7111 ) ( IN-CITY ?auto_7106 ?auto_7111 ) ( not ( = ?auto_7106 ?auto_7110 ) ) ( OBJ-AT ?auto_7109 ?auto_7106 ) ( not ( = ?auto_7109 ?auto_7107 ) ) ( OBJ-AT ?auto_7107 ?auto_7110 ) ( TRUCK-AT ?auto_7112 ?auto_7106 ) ( OBJ-AT ?auto_7108 ?auto_7106 ) ( not ( = ?auto_7107 ?auto_7108 ) ) ( not ( = ?auto_7108 ?auto_7109 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7109 ?auto_7107 ?auto_7106 )
      ( DELIVER-3PKG-VERIFY ?auto_7107 ?auto_7108 ?auto_7109 ?auto_7106 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7136 - OBJ
      ?auto_7135 - LOCATION
    )
    :vars
    (
      ?auto_7138 - LOCATION
      ?auto_7139 - CITY
      ?auto_7137 - OBJ
      ?auto_7140 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7138 ?auto_7139 ) ( IN-CITY ?auto_7135 ?auto_7139 ) ( not ( = ?auto_7135 ?auto_7138 ) ) ( not ( = ?auto_7137 ?auto_7136 ) ) ( OBJ-AT ?auto_7136 ?auto_7138 ) ( TRUCK-AT ?auto_7140 ?auto_7135 ) ( IN-TRUCK ?auto_7137 ?auto_7140 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7137 ?auto_7135 )
      ( DELIVER-2PKG ?auto_7137 ?auto_7136 ?auto_7135 )
      ( DELIVER-1PKG-VERIFY ?auto_7136 ?auto_7135 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7142 - OBJ
      ?auto_7143 - OBJ
      ?auto_7141 - LOCATION
    )
    :vars
    (
      ?auto_7146 - LOCATION
      ?auto_7144 - CITY
      ?auto_7145 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7146 ?auto_7144 ) ( IN-CITY ?auto_7141 ?auto_7144 ) ( not ( = ?auto_7141 ?auto_7146 ) ) ( not ( = ?auto_7142 ?auto_7143 ) ) ( OBJ-AT ?auto_7143 ?auto_7146 ) ( TRUCK-AT ?auto_7145 ?auto_7141 ) ( IN-TRUCK ?auto_7142 ?auto_7145 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7143 ?auto_7141 )
      ( DELIVER-2PKG-VERIFY ?auto_7142 ?auto_7143 ?auto_7141 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7148 - OBJ
      ?auto_7149 - OBJ
      ?auto_7147 - LOCATION
    )
    :vars
    (
      ?auto_7152 - LOCATION
      ?auto_7150 - CITY
      ?auto_7151 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7152 ?auto_7150 ) ( IN-CITY ?auto_7147 ?auto_7150 ) ( not ( = ?auto_7147 ?auto_7152 ) ) ( not ( = ?auto_7149 ?auto_7148 ) ) ( OBJ-AT ?auto_7148 ?auto_7152 ) ( TRUCK-AT ?auto_7151 ?auto_7147 ) ( IN-TRUCK ?auto_7149 ?auto_7151 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7149 ?auto_7148 ?auto_7147 )
      ( DELIVER-2PKG-VERIFY ?auto_7148 ?auto_7149 ?auto_7147 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7211 - OBJ
      ?auto_7210 - LOCATION
    )
    :vars
    (
      ?auto_7215 - LOCATION
      ?auto_7212 - CITY
      ?auto_7214 - OBJ
      ?auto_7213 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7215 ?auto_7212 ) ( IN-CITY ?auto_7210 ?auto_7212 ) ( not ( = ?auto_7210 ?auto_7215 ) ) ( not ( = ?auto_7214 ?auto_7211 ) ) ( OBJ-AT ?auto_7211 ?auto_7215 ) ( IN-TRUCK ?auto_7214 ?auto_7213 ) ( TRUCK-AT ?auto_7213 ?auto_7215 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7213 ?auto_7215 ?auto_7210 ?auto_7212 )
      ( DELIVER-2PKG ?auto_7214 ?auto_7211 ?auto_7210 )
      ( DELIVER-1PKG-VERIFY ?auto_7211 ?auto_7210 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7217 - OBJ
      ?auto_7218 - OBJ
      ?auto_7216 - LOCATION
    )
    :vars
    (
      ?auto_7219 - LOCATION
      ?auto_7221 - CITY
      ?auto_7220 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7219 ?auto_7221 ) ( IN-CITY ?auto_7216 ?auto_7221 ) ( not ( = ?auto_7216 ?auto_7219 ) ) ( not ( = ?auto_7217 ?auto_7218 ) ) ( OBJ-AT ?auto_7218 ?auto_7219 ) ( IN-TRUCK ?auto_7217 ?auto_7220 ) ( TRUCK-AT ?auto_7220 ?auto_7219 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7218 ?auto_7216 )
      ( DELIVER-2PKG-VERIFY ?auto_7217 ?auto_7218 ?auto_7216 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7223 - OBJ
      ?auto_7224 - OBJ
      ?auto_7222 - LOCATION
    )
    :vars
    (
      ?auto_7227 - LOCATION
      ?auto_7225 - CITY
      ?auto_7226 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7227 ?auto_7225 ) ( IN-CITY ?auto_7222 ?auto_7225 ) ( not ( = ?auto_7222 ?auto_7227 ) ) ( not ( = ?auto_7224 ?auto_7223 ) ) ( OBJ-AT ?auto_7223 ?auto_7227 ) ( IN-TRUCK ?auto_7224 ?auto_7226 ) ( TRUCK-AT ?auto_7226 ?auto_7227 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7224 ?auto_7223 ?auto_7222 )
      ( DELIVER-2PKG-VERIFY ?auto_7223 ?auto_7224 ?auto_7222 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7657 - OBJ
      ?auto_7658 - OBJ
      ?auto_7659 - OBJ
      ?auto_7656 - LOCATION
    )
    :vars
    (
      ?auto_7662 - TRUCK
      ?auto_7661 - LOCATION
      ?auto_7660 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7659 ?auto_7662 ) ( TRUCK-AT ?auto_7662 ?auto_7661 ) ( IN-CITY ?auto_7661 ?auto_7660 ) ( IN-CITY ?auto_7656 ?auto_7660 ) ( not ( = ?auto_7656 ?auto_7661 ) ) ( OBJ-AT ?auto_7658 ?auto_7656 ) ( not ( = ?auto_7658 ?auto_7659 ) ) ( OBJ-AT ?auto_7657 ?auto_7656 ) ( not ( = ?auto_7657 ?auto_7658 ) ) ( not ( = ?auto_7657 ?auto_7659 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7658 ?auto_7659 ?auto_7656 )
      ( DELIVER-3PKG-VERIFY ?auto_7657 ?auto_7658 ?auto_7659 ?auto_7656 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7690 - OBJ
      ?auto_7691 - OBJ
      ?auto_7692 - OBJ
      ?auto_7689 - LOCATION
    )
    :vars
    (
      ?auto_7696 - TRUCK
      ?auto_7694 - LOCATION
      ?auto_7693 - CITY
      ?auto_7695 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7692 ?auto_7696 ) ( TRUCK-AT ?auto_7696 ?auto_7694 ) ( IN-CITY ?auto_7694 ?auto_7693 ) ( IN-CITY ?auto_7689 ?auto_7693 ) ( not ( = ?auto_7689 ?auto_7694 ) ) ( OBJ-AT ?auto_7695 ?auto_7689 ) ( not ( = ?auto_7695 ?auto_7692 ) ) ( OBJ-AT ?auto_7690 ?auto_7689 ) ( OBJ-AT ?auto_7691 ?auto_7689 ) ( not ( = ?auto_7690 ?auto_7691 ) ) ( not ( = ?auto_7690 ?auto_7692 ) ) ( not ( = ?auto_7690 ?auto_7695 ) ) ( not ( = ?auto_7691 ?auto_7692 ) ) ( not ( = ?auto_7691 ?auto_7695 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7695 ?auto_7692 ?auto_7689 )
      ( DELIVER-3PKG-VERIFY ?auto_7690 ?auto_7691 ?auto_7692 ?auto_7689 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7702 - OBJ
      ?auto_7703 - OBJ
      ?auto_7704 - OBJ
      ?auto_7701 - LOCATION
    )
    :vars
    (
      ?auto_7708 - TRUCK
      ?auto_7706 - LOCATION
      ?auto_7705 - CITY
      ?auto_7707 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7703 ?auto_7708 ) ( TRUCK-AT ?auto_7708 ?auto_7706 ) ( IN-CITY ?auto_7706 ?auto_7705 ) ( IN-CITY ?auto_7701 ?auto_7705 ) ( not ( = ?auto_7701 ?auto_7706 ) ) ( OBJ-AT ?auto_7707 ?auto_7701 ) ( not ( = ?auto_7707 ?auto_7703 ) ) ( OBJ-AT ?auto_7702 ?auto_7701 ) ( OBJ-AT ?auto_7704 ?auto_7701 ) ( not ( = ?auto_7702 ?auto_7703 ) ) ( not ( = ?auto_7702 ?auto_7704 ) ) ( not ( = ?auto_7702 ?auto_7707 ) ) ( not ( = ?auto_7703 ?auto_7704 ) ) ( not ( = ?auto_7704 ?auto_7707 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7707 ?auto_7703 ?auto_7701 )
      ( DELIVER-3PKG-VERIFY ?auto_7702 ?auto_7703 ?auto_7704 ?auto_7701 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7718 - OBJ
      ?auto_7719 - OBJ
      ?auto_7720 - OBJ
      ?auto_7717 - LOCATION
    )
    :vars
    (
      ?auto_7723 - TRUCK
      ?auto_7722 - LOCATION
      ?auto_7721 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7718 ?auto_7723 ) ( TRUCK-AT ?auto_7723 ?auto_7722 ) ( IN-CITY ?auto_7722 ?auto_7721 ) ( IN-CITY ?auto_7717 ?auto_7721 ) ( not ( = ?auto_7717 ?auto_7722 ) ) ( OBJ-AT ?auto_7719 ?auto_7717 ) ( not ( = ?auto_7719 ?auto_7718 ) ) ( OBJ-AT ?auto_7720 ?auto_7717 ) ( not ( = ?auto_7718 ?auto_7720 ) ) ( not ( = ?auto_7719 ?auto_7720 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7719 ?auto_7718 ?auto_7717 )
      ( DELIVER-3PKG-VERIFY ?auto_7718 ?auto_7719 ?auto_7720 ?auto_7717 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7740 - OBJ
      ?auto_7741 - OBJ
      ?auto_7742 - OBJ
      ?auto_7739 - LOCATION
    )
    :vars
    (
      ?auto_7746 - TRUCK
      ?auto_7744 - LOCATION
      ?auto_7743 - CITY
      ?auto_7745 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7740 ?auto_7746 ) ( TRUCK-AT ?auto_7746 ?auto_7744 ) ( IN-CITY ?auto_7744 ?auto_7743 ) ( IN-CITY ?auto_7739 ?auto_7743 ) ( not ( = ?auto_7739 ?auto_7744 ) ) ( OBJ-AT ?auto_7745 ?auto_7739 ) ( not ( = ?auto_7745 ?auto_7740 ) ) ( OBJ-AT ?auto_7741 ?auto_7739 ) ( OBJ-AT ?auto_7742 ?auto_7739 ) ( not ( = ?auto_7740 ?auto_7741 ) ) ( not ( = ?auto_7740 ?auto_7742 ) ) ( not ( = ?auto_7741 ?auto_7742 ) ) ( not ( = ?auto_7741 ?auto_7745 ) ) ( not ( = ?auto_7742 ?auto_7745 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7745 ?auto_7740 ?auto_7739 )
      ( DELIVER-3PKG-VERIFY ?auto_7740 ?auto_7741 ?auto_7742 ?auto_7739 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7810 - OBJ
      ?auto_7811 - OBJ
      ?auto_7812 - OBJ
      ?auto_7809 - LOCATION
    )
    :vars
    (
      ?auto_7814 - TRUCK
      ?auto_7815 - LOCATION
      ?auto_7813 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7814 ?auto_7815 ) ( IN-CITY ?auto_7815 ?auto_7813 ) ( IN-CITY ?auto_7809 ?auto_7813 ) ( not ( = ?auto_7809 ?auto_7815 ) ) ( OBJ-AT ?auto_7810 ?auto_7809 ) ( not ( = ?auto_7810 ?auto_7812 ) ) ( OBJ-AT ?auto_7812 ?auto_7815 ) ( OBJ-AT ?auto_7811 ?auto_7809 ) ( not ( = ?auto_7810 ?auto_7811 ) ) ( not ( = ?auto_7811 ?auto_7812 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7810 ?auto_7812 ?auto_7809 )
      ( DELIVER-3PKG-VERIFY ?auto_7810 ?auto_7811 ?auto_7812 ?auto_7809 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7821 - OBJ
      ?auto_7822 - OBJ
      ?auto_7823 - OBJ
      ?auto_7820 - LOCATION
    )
    :vars
    (
      ?auto_7825 - TRUCK
      ?auto_7826 - LOCATION
      ?auto_7824 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7825 ?auto_7826 ) ( IN-CITY ?auto_7826 ?auto_7824 ) ( IN-CITY ?auto_7820 ?auto_7824 ) ( not ( = ?auto_7820 ?auto_7826 ) ) ( OBJ-AT ?auto_7823 ?auto_7820 ) ( not ( = ?auto_7823 ?auto_7822 ) ) ( OBJ-AT ?auto_7822 ?auto_7826 ) ( OBJ-AT ?auto_7821 ?auto_7820 ) ( not ( = ?auto_7821 ?auto_7822 ) ) ( not ( = ?auto_7821 ?auto_7823 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7823 ?auto_7822 ?auto_7820 )
      ( DELIVER-3PKG-VERIFY ?auto_7821 ?auto_7822 ?auto_7823 ?auto_7820 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7843 - OBJ
      ?auto_7844 - OBJ
      ?auto_7845 - OBJ
      ?auto_7842 - LOCATION
    )
    :vars
    (
      ?auto_7847 - TRUCK
      ?auto_7848 - LOCATION
      ?auto_7846 - CITY
      ?auto_7849 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7847 ?auto_7848 ) ( IN-CITY ?auto_7848 ?auto_7846 ) ( IN-CITY ?auto_7842 ?auto_7846 ) ( not ( = ?auto_7842 ?auto_7848 ) ) ( OBJ-AT ?auto_7849 ?auto_7842 ) ( not ( = ?auto_7849 ?auto_7845 ) ) ( OBJ-AT ?auto_7845 ?auto_7848 ) ( OBJ-AT ?auto_7843 ?auto_7842 ) ( OBJ-AT ?auto_7844 ?auto_7842 ) ( not ( = ?auto_7843 ?auto_7844 ) ) ( not ( = ?auto_7843 ?auto_7845 ) ) ( not ( = ?auto_7843 ?auto_7849 ) ) ( not ( = ?auto_7844 ?auto_7845 ) ) ( not ( = ?auto_7844 ?auto_7849 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7849 ?auto_7845 ?auto_7842 )
      ( DELIVER-3PKG-VERIFY ?auto_7843 ?auto_7844 ?auto_7845 ?auto_7842 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7855 - OBJ
      ?auto_7856 - OBJ
      ?auto_7857 - OBJ
      ?auto_7854 - LOCATION
    )
    :vars
    (
      ?auto_7859 - TRUCK
      ?auto_7860 - LOCATION
      ?auto_7858 - CITY
      ?auto_7861 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7859 ?auto_7860 ) ( IN-CITY ?auto_7860 ?auto_7858 ) ( IN-CITY ?auto_7854 ?auto_7858 ) ( not ( = ?auto_7854 ?auto_7860 ) ) ( OBJ-AT ?auto_7861 ?auto_7854 ) ( not ( = ?auto_7861 ?auto_7856 ) ) ( OBJ-AT ?auto_7856 ?auto_7860 ) ( OBJ-AT ?auto_7855 ?auto_7854 ) ( OBJ-AT ?auto_7857 ?auto_7854 ) ( not ( = ?auto_7855 ?auto_7856 ) ) ( not ( = ?auto_7855 ?auto_7857 ) ) ( not ( = ?auto_7855 ?auto_7861 ) ) ( not ( = ?auto_7856 ?auto_7857 ) ) ( not ( = ?auto_7857 ?auto_7861 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7861 ?auto_7856 ?auto_7854 )
      ( DELIVER-3PKG-VERIFY ?auto_7855 ?auto_7856 ?auto_7857 ?auto_7854 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7893 - OBJ
      ?auto_7894 - OBJ
      ?auto_7895 - OBJ
      ?auto_7892 - LOCATION
    )
    :vars
    (
      ?auto_7897 - TRUCK
      ?auto_7898 - LOCATION
      ?auto_7896 - CITY
      ?auto_7899 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7897 ?auto_7898 ) ( IN-CITY ?auto_7898 ?auto_7896 ) ( IN-CITY ?auto_7892 ?auto_7896 ) ( not ( = ?auto_7892 ?auto_7898 ) ) ( OBJ-AT ?auto_7899 ?auto_7892 ) ( not ( = ?auto_7899 ?auto_7893 ) ) ( OBJ-AT ?auto_7893 ?auto_7898 ) ( OBJ-AT ?auto_7894 ?auto_7892 ) ( OBJ-AT ?auto_7895 ?auto_7892 ) ( not ( = ?auto_7893 ?auto_7894 ) ) ( not ( = ?auto_7893 ?auto_7895 ) ) ( not ( = ?auto_7894 ?auto_7895 ) ) ( not ( = ?auto_7894 ?auto_7899 ) ) ( not ( = ?auto_7895 ?auto_7899 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7899 ?auto_7893 ?auto_7892 )
      ( DELIVER-3PKG-VERIFY ?auto_7893 ?auto_7894 ?auto_7895 ?auto_7892 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7974 - OBJ
      ?auto_7975 - OBJ
      ?auto_7976 - OBJ
      ?auto_7973 - LOCATION
    )
    :vars
    (
      ?auto_7979 - LOCATION
      ?auto_7978 - CITY
      ?auto_7977 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7979 ?auto_7978 ) ( IN-CITY ?auto_7973 ?auto_7978 ) ( not ( = ?auto_7973 ?auto_7979 ) ) ( OBJ-AT ?auto_7974 ?auto_7973 ) ( not ( = ?auto_7974 ?auto_7975 ) ) ( OBJ-AT ?auto_7975 ?auto_7979 ) ( TRUCK-AT ?auto_7977 ?auto_7973 ) ( OBJ-AT ?auto_7976 ?auto_7973 ) ( not ( = ?auto_7974 ?auto_7976 ) ) ( not ( = ?auto_7975 ?auto_7976 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7974 ?auto_7975 ?auto_7973 )
      ( DELIVER-3PKG-VERIFY ?auto_7974 ?auto_7975 ?auto_7976 ?auto_7973 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7996 - OBJ
      ?auto_7997 - OBJ
      ?auto_7998 - OBJ
      ?auto_7995 - LOCATION
    )
    :vars
    (
      ?auto_8001 - LOCATION
      ?auto_8000 - CITY
      ?auto_8002 - OBJ
      ?auto_7999 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8001 ?auto_8000 ) ( IN-CITY ?auto_7995 ?auto_8000 ) ( not ( = ?auto_7995 ?auto_8001 ) ) ( OBJ-AT ?auto_8002 ?auto_7995 ) ( not ( = ?auto_8002 ?auto_7998 ) ) ( OBJ-AT ?auto_7998 ?auto_8001 ) ( TRUCK-AT ?auto_7999 ?auto_7995 ) ( OBJ-AT ?auto_7996 ?auto_7995 ) ( OBJ-AT ?auto_7997 ?auto_7995 ) ( not ( = ?auto_7996 ?auto_7997 ) ) ( not ( = ?auto_7996 ?auto_7998 ) ) ( not ( = ?auto_7996 ?auto_8002 ) ) ( not ( = ?auto_7997 ?auto_7998 ) ) ( not ( = ?auto_7997 ?auto_8002 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8002 ?auto_7998 ?auto_7995 )
      ( DELIVER-3PKG-VERIFY ?auto_7996 ?auto_7997 ?auto_7998 ?auto_7995 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8008 - OBJ
      ?auto_8009 - OBJ
      ?auto_8010 - OBJ
      ?auto_8007 - LOCATION
    )
    :vars
    (
      ?auto_8013 - LOCATION
      ?auto_8012 - CITY
      ?auto_8014 - OBJ
      ?auto_8011 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8013 ?auto_8012 ) ( IN-CITY ?auto_8007 ?auto_8012 ) ( not ( = ?auto_8007 ?auto_8013 ) ) ( OBJ-AT ?auto_8014 ?auto_8007 ) ( not ( = ?auto_8014 ?auto_8009 ) ) ( OBJ-AT ?auto_8009 ?auto_8013 ) ( TRUCK-AT ?auto_8011 ?auto_8007 ) ( OBJ-AT ?auto_8008 ?auto_8007 ) ( OBJ-AT ?auto_8010 ?auto_8007 ) ( not ( = ?auto_8008 ?auto_8009 ) ) ( not ( = ?auto_8008 ?auto_8010 ) ) ( not ( = ?auto_8008 ?auto_8014 ) ) ( not ( = ?auto_8009 ?auto_8010 ) ) ( not ( = ?auto_8010 ?auto_8014 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8014 ?auto_8009 ?auto_8007 )
      ( DELIVER-3PKG-VERIFY ?auto_8008 ?auto_8009 ?auto_8010 ?auto_8007 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8046 - OBJ
      ?auto_8047 - OBJ
      ?auto_8048 - OBJ
      ?auto_8045 - LOCATION
    )
    :vars
    (
      ?auto_8051 - LOCATION
      ?auto_8050 - CITY
      ?auto_8052 - OBJ
      ?auto_8049 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8051 ?auto_8050 ) ( IN-CITY ?auto_8045 ?auto_8050 ) ( not ( = ?auto_8045 ?auto_8051 ) ) ( OBJ-AT ?auto_8052 ?auto_8045 ) ( not ( = ?auto_8052 ?auto_8046 ) ) ( OBJ-AT ?auto_8046 ?auto_8051 ) ( TRUCK-AT ?auto_8049 ?auto_8045 ) ( OBJ-AT ?auto_8047 ?auto_8045 ) ( OBJ-AT ?auto_8048 ?auto_8045 ) ( not ( = ?auto_8046 ?auto_8047 ) ) ( not ( = ?auto_8046 ?auto_8048 ) ) ( not ( = ?auto_8047 ?auto_8048 ) ) ( not ( = ?auto_8047 ?auto_8052 ) ) ( not ( = ?auto_8048 ?auto_8052 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8052 ?auto_8046 ?auto_8045 )
      ( DELIVER-3PKG-VERIFY ?auto_8046 ?auto_8047 ?auto_8048 ?auto_8045 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8254 - OBJ
      ?auto_8253 - LOCATION
    )
    :vars
    (
      ?auto_8256 - LOCATION
      ?auto_8255 - CITY
      ?auto_8257 - OBJ
      ?auto_8258 - TRUCK
      ?auto_8259 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8256 ?auto_8255 ) ( IN-CITY ?auto_8253 ?auto_8255 ) ( not ( = ?auto_8253 ?auto_8256 ) ) ( OBJ-AT ?auto_8257 ?auto_8253 ) ( not ( = ?auto_8257 ?auto_8254 ) ) ( OBJ-AT ?auto_8254 ?auto_8256 ) ( TRUCK-AT ?auto_8258 ?auto_8259 ) ( IN-CITY ?auto_8259 ?auto_8255 ) ( not ( = ?auto_8253 ?auto_8259 ) ) ( not ( = ?auto_8256 ?auto_8259 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8258 ?auto_8259 ?auto_8253 ?auto_8255 )
      ( DELIVER-2PKG ?auto_8257 ?auto_8254 ?auto_8253 )
      ( DELIVER-1PKG-VERIFY ?auto_8254 ?auto_8253 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8261 - OBJ
      ?auto_8262 - OBJ
      ?auto_8260 - LOCATION
    )
    :vars
    (
      ?auto_8266 - LOCATION
      ?auto_8264 - CITY
      ?auto_8265 - TRUCK
      ?auto_8263 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8266 ?auto_8264 ) ( IN-CITY ?auto_8260 ?auto_8264 ) ( not ( = ?auto_8260 ?auto_8266 ) ) ( OBJ-AT ?auto_8261 ?auto_8260 ) ( not ( = ?auto_8261 ?auto_8262 ) ) ( OBJ-AT ?auto_8262 ?auto_8266 ) ( TRUCK-AT ?auto_8265 ?auto_8263 ) ( IN-CITY ?auto_8263 ?auto_8264 ) ( not ( = ?auto_8260 ?auto_8263 ) ) ( not ( = ?auto_8266 ?auto_8263 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8262 ?auto_8260 )
      ( DELIVER-2PKG-VERIFY ?auto_8261 ?auto_8262 ?auto_8260 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8276 - OBJ
      ?auto_8277 - OBJ
      ?auto_8275 - LOCATION
    )
    :vars
    (
      ?auto_8278 - LOCATION
      ?auto_8281 - CITY
      ?auto_8280 - TRUCK
      ?auto_8279 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8278 ?auto_8281 ) ( IN-CITY ?auto_8275 ?auto_8281 ) ( not ( = ?auto_8275 ?auto_8278 ) ) ( OBJ-AT ?auto_8277 ?auto_8275 ) ( not ( = ?auto_8277 ?auto_8276 ) ) ( OBJ-AT ?auto_8276 ?auto_8278 ) ( TRUCK-AT ?auto_8280 ?auto_8279 ) ( IN-CITY ?auto_8279 ?auto_8281 ) ( not ( = ?auto_8275 ?auto_8279 ) ) ( not ( = ?auto_8278 ?auto_8279 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8277 ?auto_8276 ?auto_8275 )
      ( DELIVER-2PKG-VERIFY ?auto_8276 ?auto_8277 ?auto_8275 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8299 - OBJ
      ?auto_8300 - OBJ
      ?auto_8301 - OBJ
      ?auto_8298 - LOCATION
    )
    :vars
    (
      ?auto_8302 - LOCATION
      ?auto_8305 - CITY
      ?auto_8304 - TRUCK
      ?auto_8303 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8302 ?auto_8305 ) ( IN-CITY ?auto_8298 ?auto_8305 ) ( not ( = ?auto_8298 ?auto_8302 ) ) ( OBJ-AT ?auto_8299 ?auto_8298 ) ( not ( = ?auto_8299 ?auto_8301 ) ) ( OBJ-AT ?auto_8301 ?auto_8302 ) ( TRUCK-AT ?auto_8304 ?auto_8303 ) ( IN-CITY ?auto_8303 ?auto_8305 ) ( not ( = ?auto_8298 ?auto_8303 ) ) ( not ( = ?auto_8302 ?auto_8303 ) ) ( OBJ-AT ?auto_8300 ?auto_8298 ) ( not ( = ?auto_8299 ?auto_8300 ) ) ( not ( = ?auto_8300 ?auto_8301 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8299 ?auto_8301 ?auto_8298 )
      ( DELIVER-3PKG-VERIFY ?auto_8299 ?auto_8300 ?auto_8301 ?auto_8298 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8315 - OBJ
      ?auto_8316 - OBJ
      ?auto_8317 - OBJ
      ?auto_8314 - LOCATION
    )
    :vars
    (
      ?auto_8318 - LOCATION
      ?auto_8321 - CITY
      ?auto_8320 - TRUCK
      ?auto_8319 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8318 ?auto_8321 ) ( IN-CITY ?auto_8314 ?auto_8321 ) ( not ( = ?auto_8314 ?auto_8318 ) ) ( OBJ-AT ?auto_8317 ?auto_8314 ) ( not ( = ?auto_8317 ?auto_8316 ) ) ( OBJ-AT ?auto_8316 ?auto_8318 ) ( TRUCK-AT ?auto_8320 ?auto_8319 ) ( IN-CITY ?auto_8319 ?auto_8321 ) ( not ( = ?auto_8314 ?auto_8319 ) ) ( not ( = ?auto_8318 ?auto_8319 ) ) ( OBJ-AT ?auto_8315 ?auto_8314 ) ( not ( = ?auto_8315 ?auto_8316 ) ) ( not ( = ?auto_8315 ?auto_8317 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8317 ?auto_8316 ?auto_8314 )
      ( DELIVER-3PKG-VERIFY ?auto_8315 ?auto_8316 ?auto_8317 ?auto_8314 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8382 - OBJ
      ?auto_8383 - OBJ
      ?auto_8384 - OBJ
      ?auto_8381 - LOCATION
    )
    :vars
    (
      ?auto_8385 - LOCATION
      ?auto_8388 - CITY
      ?auto_8387 - TRUCK
      ?auto_8386 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8385 ?auto_8388 ) ( IN-CITY ?auto_8381 ?auto_8388 ) ( not ( = ?auto_8381 ?auto_8385 ) ) ( OBJ-AT ?auto_8383 ?auto_8381 ) ( not ( = ?auto_8383 ?auto_8382 ) ) ( OBJ-AT ?auto_8382 ?auto_8385 ) ( TRUCK-AT ?auto_8387 ?auto_8386 ) ( IN-CITY ?auto_8386 ?auto_8388 ) ( not ( = ?auto_8381 ?auto_8386 ) ) ( not ( = ?auto_8385 ?auto_8386 ) ) ( OBJ-AT ?auto_8384 ?auto_8381 ) ( not ( = ?auto_8382 ?auto_8384 ) ) ( not ( = ?auto_8383 ?auto_8384 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8383 ?auto_8382 ?auto_8381 )
      ( DELIVER-3PKG-VERIFY ?auto_8382 ?auto_8383 ?auto_8384 ?auto_8381 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8987 - OBJ
      ?auto_8986 - LOCATION
    )
    :vars
    (
      ?auto_8991 - LOCATION
      ?auto_8990 - CITY
      ?auto_8989 - OBJ
      ?auto_8988 - TRUCK
      ?auto_8992 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8991 ?auto_8990 ) ( IN-CITY ?auto_8986 ?auto_8990 ) ( not ( = ?auto_8986 ?auto_8991 ) ) ( not ( = ?auto_8989 ?auto_8987 ) ) ( OBJ-AT ?auto_8987 ?auto_8991 ) ( IN-TRUCK ?auto_8989 ?auto_8988 ) ( TRUCK-AT ?auto_8988 ?auto_8992 ) ( IN-CITY ?auto_8992 ?auto_8990 ) ( not ( = ?auto_8986 ?auto_8992 ) ) ( not ( = ?auto_8991 ?auto_8992 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8988 ?auto_8992 ?auto_8986 ?auto_8990 )
      ( DELIVER-2PKG ?auto_8989 ?auto_8987 ?auto_8986 )
      ( DELIVER-1PKG-VERIFY ?auto_8987 ?auto_8986 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8994 - OBJ
      ?auto_8995 - OBJ
      ?auto_8993 - LOCATION
    )
    :vars
    (
      ?auto_8998 - LOCATION
      ?auto_8996 - CITY
      ?auto_8999 - TRUCK
      ?auto_8997 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8998 ?auto_8996 ) ( IN-CITY ?auto_8993 ?auto_8996 ) ( not ( = ?auto_8993 ?auto_8998 ) ) ( not ( = ?auto_8994 ?auto_8995 ) ) ( OBJ-AT ?auto_8995 ?auto_8998 ) ( IN-TRUCK ?auto_8994 ?auto_8999 ) ( TRUCK-AT ?auto_8999 ?auto_8997 ) ( IN-CITY ?auto_8997 ?auto_8996 ) ( not ( = ?auto_8993 ?auto_8997 ) ) ( not ( = ?auto_8998 ?auto_8997 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8995 ?auto_8993 )
      ( DELIVER-2PKG-VERIFY ?auto_8994 ?auto_8995 ?auto_8993 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9009 - OBJ
      ?auto_9010 - OBJ
      ?auto_9008 - LOCATION
    )
    :vars
    (
      ?auto_9014 - LOCATION
      ?auto_9011 - CITY
      ?auto_9012 - TRUCK
      ?auto_9013 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9014 ?auto_9011 ) ( IN-CITY ?auto_9008 ?auto_9011 ) ( not ( = ?auto_9008 ?auto_9014 ) ) ( not ( = ?auto_9010 ?auto_9009 ) ) ( OBJ-AT ?auto_9009 ?auto_9014 ) ( IN-TRUCK ?auto_9010 ?auto_9012 ) ( TRUCK-AT ?auto_9012 ?auto_9013 ) ( IN-CITY ?auto_9013 ?auto_9011 ) ( not ( = ?auto_9008 ?auto_9013 ) ) ( not ( = ?auto_9014 ?auto_9013 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9010 ?auto_9009 ?auto_9008 )
      ( DELIVER-2PKG-VERIFY ?auto_9009 ?auto_9010 ?auto_9008 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_9191 - OBJ
      ?auto_9190 - LOCATION
    )
    :vars
    (
      ?auto_9196 - LOCATION
      ?auto_9193 - CITY
      ?auto_9192 - OBJ
      ?auto_9194 - TRUCK
      ?auto_9195 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9196 ?auto_9193 ) ( IN-CITY ?auto_9190 ?auto_9193 ) ( not ( = ?auto_9190 ?auto_9196 ) ) ( not ( = ?auto_9192 ?auto_9191 ) ) ( OBJ-AT ?auto_9191 ?auto_9196 ) ( TRUCK-AT ?auto_9194 ?auto_9195 ) ( IN-CITY ?auto_9195 ?auto_9193 ) ( not ( = ?auto_9190 ?auto_9195 ) ) ( not ( = ?auto_9196 ?auto_9195 ) ) ( OBJ-AT ?auto_9192 ?auto_9195 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_9192 ?auto_9194 ?auto_9195 )
      ( DELIVER-2PKG ?auto_9192 ?auto_9191 ?auto_9190 )
      ( DELIVER-1PKG-VERIFY ?auto_9191 ?auto_9190 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9198 - OBJ
      ?auto_9199 - OBJ
      ?auto_9197 - LOCATION
    )
    :vars
    (
      ?auto_9202 - LOCATION
      ?auto_9203 - CITY
      ?auto_9200 - TRUCK
      ?auto_9201 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9202 ?auto_9203 ) ( IN-CITY ?auto_9197 ?auto_9203 ) ( not ( = ?auto_9197 ?auto_9202 ) ) ( not ( = ?auto_9198 ?auto_9199 ) ) ( OBJ-AT ?auto_9199 ?auto_9202 ) ( TRUCK-AT ?auto_9200 ?auto_9201 ) ( IN-CITY ?auto_9201 ?auto_9203 ) ( not ( = ?auto_9197 ?auto_9201 ) ) ( not ( = ?auto_9202 ?auto_9201 ) ) ( OBJ-AT ?auto_9198 ?auto_9201 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_9199 ?auto_9197 )
      ( DELIVER-2PKG-VERIFY ?auto_9198 ?auto_9199 ?auto_9197 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_9208 - OBJ
      ?auto_9209 - OBJ
      ?auto_9207 - LOCATION
    )
    :vars
    (
      ?auto_9212 - LOCATION
      ?auto_9211 - CITY
      ?auto_9213 - TRUCK
      ?auto_9210 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_9212 ?auto_9211 ) ( IN-CITY ?auto_9207 ?auto_9211 ) ( not ( = ?auto_9207 ?auto_9212 ) ) ( not ( = ?auto_9209 ?auto_9208 ) ) ( OBJ-AT ?auto_9208 ?auto_9212 ) ( TRUCK-AT ?auto_9213 ?auto_9210 ) ( IN-CITY ?auto_9210 ?auto_9211 ) ( not ( = ?auto_9207 ?auto_9210 ) ) ( not ( = ?auto_9212 ?auto_9210 ) ) ( OBJ-AT ?auto_9209 ?auto_9210 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_9209 ?auto_9208 ?auto_9207 )
      ( DELIVER-2PKG-VERIFY ?auto_9208 ?auto_9209 ?auto_9207 ) )
  )

)

