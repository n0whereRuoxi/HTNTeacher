( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_868 - PERSON
      ?auto_867 - CITY
    )
    :vars
    (
      ?auto_869 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_868 ?auto_869 ) ( AIRCRAFT-AT ?auto_869 ?auto_867 ) )
    :subtasks
    ( ( !DEBARK ?auto_868 ?auto_869 ?auto_867 )
      ( FLY-1PPL-VERIFY ?auto_868 ?auto_867 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_875 - PERSON
      ?auto_874 - CITY
    )
    :vars
    (
      ?auto_876 - AIRCRAFT
      ?auto_879 - CITY
      ?auto_877 - FLEVEL
      ?auto_878 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_875 ?auto_876 ) ( AIRCRAFT-AT ?auto_876 ?auto_879 ) ( FUEL-LEVEL ?auto_876 ?auto_877 ) ( NEXT ?auto_878 ?auto_877 ) ( not ( = ?auto_874 ?auto_879 ) ) ( not ( = ?auto_877 ?auto_878 ) ) )
    :subtasks
    ( ( !FLY ?auto_876 ?auto_879 ?auto_874 ?auto_877 ?auto_878 )
      ( FLY-1PPL ?auto_875 ?auto_874 )
      ( FLY-1PPL-VERIFY ?auto_875 ?auto_874 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_888 - PERSON
      ?auto_887 - CITY
    )
    :vars
    (
      ?auto_890 - AIRCRAFT
      ?auto_892 - CITY
      ?auto_889 - FLEVEL
      ?auto_891 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_890 ?auto_892 ) ( FUEL-LEVEL ?auto_890 ?auto_889 ) ( NEXT ?auto_891 ?auto_889 ) ( not ( = ?auto_887 ?auto_892 ) ) ( not ( = ?auto_889 ?auto_891 ) ) ( PERSON-AT ?auto_888 ?auto_892 ) )
    :subtasks
    ( ( !BOARD ?auto_888 ?auto_890 ?auto_892 )
      ( FLY-1PPL ?auto_888 ?auto_887 )
      ( FLY-1PPL-VERIFY ?auto_888 ?auto_887 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_901 - PERSON
      ?auto_900 - CITY
    )
    :vars
    (
      ?auto_903 - AIRCRAFT
      ?auto_905 - CITY
      ?auto_902 - FLEVEL
      ?auto_904 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_903 ?auto_905 ) ( NEXT ?auto_902 ?auto_904 ) ( not ( = ?auto_900 ?auto_905 ) ) ( not ( = ?auto_904 ?auto_902 ) ) ( PERSON-AT ?auto_901 ?auto_905 ) ( FUEL-LEVEL ?auto_903 ?auto_902 ) )
    :subtasks
    ( ( !REFUEL ?auto_903 ?auto_905 ?auto_902 ?auto_904 )
      ( FLY-1PPL ?auto_901 ?auto_900 )
      ( FLY-1PPL-VERIFY ?auto_901 ?auto_900 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_914 - PERSON
      ?auto_913 - CITY
    )
    :vars
    (
      ?auto_916 - FLEVEL
      ?auto_918 - FLEVEL
      ?auto_917 - CITY
      ?auto_915 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_916 ?auto_918 ) ( not ( = ?auto_913 ?auto_917 ) ) ( not ( = ?auto_918 ?auto_916 ) ) ( PERSON-AT ?auto_914 ?auto_917 ) ( AIRCRAFT-AT ?auto_915 ?auto_913 ) ( FUEL-LEVEL ?auto_915 ?auto_918 ) )
    :subtasks
    ( ( !FLY ?auto_915 ?auto_913 ?auto_917 ?auto_918 ?auto_916 )
      ( FLY-1PPL ?auto_914 ?auto_913 )
      ( FLY-1PPL-VERIFY ?auto_914 ?auto_913 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_927 - PERSON
      ?auto_926 - CITY
    )
    :vars
    (
      ?auto_929 - FLEVEL
      ?auto_930 - FLEVEL
      ?auto_928 - CITY
      ?auto_931 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_929 ?auto_930 ) ( not ( = ?auto_926 ?auto_928 ) ) ( not ( = ?auto_930 ?auto_929 ) ) ( PERSON-AT ?auto_927 ?auto_928 ) ( AIRCRAFT-AT ?auto_931 ?auto_926 ) ( FUEL-LEVEL ?auto_931 ?auto_929 ) )
    :subtasks
    ( ( !REFUEL ?auto_931 ?auto_926 ?auto_929 ?auto_930 )
      ( FLY-1PPL ?auto_927 ?auto_926 )
      ( FLY-1PPL-VERIFY ?auto_927 ?auto_926 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_951 - PERSON
      ?auto_950 - CITY
    )
    :vars
    (
      ?auto_952 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_951 ?auto_952 ) ( AIRCRAFT-AT ?auto_952 ?auto_950 ) )
    :subtasks
    ( ( !DEBARK ?auto_951 ?auto_952 ?auto_950 )
      ( FLY-1PPL-VERIFY ?auto_951 ?auto_950 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_954 - PERSON
      ?auto_955 - PERSON
      ?auto_953 - CITY
    )
    :vars
    (
      ?auto_956 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_955 ?auto_956 ) ( AIRCRAFT-AT ?auto_956 ?auto_953 ) ( PERSON-AT ?auto_954 ?auto_953 ) ( not ( = ?auto_954 ?auto_955 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_955 ?auto_953 )
      ( FLY-2PPL-VERIFY ?auto_954 ?auto_955 ?auto_953 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_958 - PERSON
      ?auto_959 - PERSON
      ?auto_957 - CITY
    )
    :vars
    (
      ?auto_960 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_958 ?auto_960 ) ( AIRCRAFT-AT ?auto_960 ?auto_957 ) ( PERSON-AT ?auto_959 ?auto_957 ) ( not ( = ?auto_958 ?auto_959 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_958 ?auto_957 )
      ( FLY-2PPL-VERIFY ?auto_958 ?auto_959 ?auto_957 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_966 - PERSON
      ?auto_965 - CITY
    )
    :vars
    (
      ?auto_967 - AIRCRAFT
      ?auto_970 - CITY
      ?auto_968 - FLEVEL
      ?auto_969 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_966 ?auto_967 ) ( AIRCRAFT-AT ?auto_967 ?auto_970 ) ( FUEL-LEVEL ?auto_967 ?auto_968 ) ( NEXT ?auto_969 ?auto_968 ) ( not ( = ?auto_965 ?auto_970 ) ) ( not ( = ?auto_968 ?auto_969 ) ) )
    :subtasks
    ( ( !FLY ?auto_967 ?auto_970 ?auto_965 ?auto_968 ?auto_969 )
      ( FLY-1PPL ?auto_966 ?auto_965 )
      ( FLY-1PPL-VERIFY ?auto_966 ?auto_965 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_972 - PERSON
      ?auto_973 - PERSON
      ?auto_971 - CITY
    )
    :vars
    (
      ?auto_974 - AIRCRAFT
      ?auto_976 - CITY
      ?auto_975 - FLEVEL
      ?auto_977 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_973 ?auto_974 ) ( AIRCRAFT-AT ?auto_974 ?auto_976 ) ( FUEL-LEVEL ?auto_974 ?auto_975 ) ( NEXT ?auto_977 ?auto_975 ) ( not ( = ?auto_971 ?auto_976 ) ) ( not ( = ?auto_975 ?auto_977 ) ) ( PERSON-AT ?auto_972 ?auto_971 ) ( not ( = ?auto_972 ?auto_973 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_973 ?auto_971 )
      ( FLY-2PPL-VERIFY ?auto_972 ?auto_973 ?auto_971 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_979 - PERSON
      ?auto_980 - PERSON
      ?auto_978 - CITY
    )
    :vars
    (
      ?auto_982 - AIRCRAFT
      ?auto_983 - CITY
      ?auto_981 - FLEVEL
      ?auto_984 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_979 ?auto_982 ) ( AIRCRAFT-AT ?auto_982 ?auto_983 ) ( FUEL-LEVEL ?auto_982 ?auto_981 ) ( NEXT ?auto_984 ?auto_981 ) ( not ( = ?auto_978 ?auto_983 ) ) ( not ( = ?auto_981 ?auto_984 ) ) ( PERSON-AT ?auto_980 ?auto_978 ) ( not ( = ?auto_980 ?auto_979 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_980 ?auto_979 ?auto_978 )
      ( FLY-2PPL-VERIFY ?auto_979 ?auto_980 ?auto_978 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_994 - PERSON
      ?auto_993 - CITY
    )
    :vars
    (
      ?auto_996 - AIRCRAFT
      ?auto_997 - CITY
      ?auto_995 - FLEVEL
      ?auto_998 - FLEVEL
      ?auto_999 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_996 ?auto_997 ) ( FUEL-LEVEL ?auto_996 ?auto_995 ) ( NEXT ?auto_998 ?auto_995 ) ( not ( = ?auto_993 ?auto_997 ) ) ( not ( = ?auto_995 ?auto_998 ) ) ( PERSON-AT ?auto_999 ?auto_993 ) ( not ( = ?auto_999 ?auto_994 ) ) ( PERSON-AT ?auto_994 ?auto_997 ) )
    :subtasks
    ( ( !BOARD ?auto_994 ?auto_996 ?auto_997 )
      ( FLY-2PPL ?auto_999 ?auto_994 ?auto_993 )
      ( FLY-1PPL-VERIFY ?auto_994 ?auto_993 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1001 - PERSON
      ?auto_1002 - PERSON
      ?auto_1000 - CITY
    )
    :vars
    (
      ?auto_1003 - AIRCRAFT
      ?auto_1005 - CITY
      ?auto_1004 - FLEVEL
      ?auto_1006 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1003 ?auto_1005 ) ( FUEL-LEVEL ?auto_1003 ?auto_1004 ) ( NEXT ?auto_1006 ?auto_1004 ) ( not ( = ?auto_1000 ?auto_1005 ) ) ( not ( = ?auto_1004 ?auto_1006 ) ) ( PERSON-AT ?auto_1001 ?auto_1000 ) ( not ( = ?auto_1001 ?auto_1002 ) ) ( PERSON-AT ?auto_1002 ?auto_1005 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1002 ?auto_1000 )
      ( FLY-2PPL-VERIFY ?auto_1001 ?auto_1002 ?auto_1000 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1008 - PERSON
      ?auto_1009 - PERSON
      ?auto_1007 - CITY
    )
    :vars
    (
      ?auto_1010 - AIRCRAFT
      ?auto_1011 - CITY
      ?auto_1013 - FLEVEL
      ?auto_1012 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1010 ?auto_1011 ) ( FUEL-LEVEL ?auto_1010 ?auto_1013 ) ( NEXT ?auto_1012 ?auto_1013 ) ( not ( = ?auto_1007 ?auto_1011 ) ) ( not ( = ?auto_1013 ?auto_1012 ) ) ( PERSON-AT ?auto_1009 ?auto_1007 ) ( not ( = ?auto_1009 ?auto_1008 ) ) ( PERSON-AT ?auto_1008 ?auto_1011 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1009 ?auto_1008 ?auto_1007 )
      ( FLY-2PPL-VERIFY ?auto_1008 ?auto_1009 ?auto_1007 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1023 - PERSON
      ?auto_1022 - CITY
    )
    :vars
    (
      ?auto_1025 - AIRCRAFT
      ?auto_1026 - CITY
      ?auto_1027 - FLEVEL
      ?auto_1028 - FLEVEL
      ?auto_1024 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1025 ?auto_1026 ) ( NEXT ?auto_1027 ?auto_1028 ) ( not ( = ?auto_1022 ?auto_1026 ) ) ( not ( = ?auto_1028 ?auto_1027 ) ) ( PERSON-AT ?auto_1024 ?auto_1022 ) ( not ( = ?auto_1024 ?auto_1023 ) ) ( PERSON-AT ?auto_1023 ?auto_1026 ) ( FUEL-LEVEL ?auto_1025 ?auto_1027 ) )
    :subtasks
    ( ( !REFUEL ?auto_1025 ?auto_1026 ?auto_1027 ?auto_1028 )
      ( FLY-2PPL ?auto_1024 ?auto_1023 ?auto_1022 )
      ( FLY-1PPL-VERIFY ?auto_1023 ?auto_1022 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1030 - PERSON
      ?auto_1031 - PERSON
      ?auto_1029 - CITY
    )
    :vars
    (
      ?auto_1034 - AIRCRAFT
      ?auto_1032 - CITY
      ?auto_1035 - FLEVEL
      ?auto_1033 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1034 ?auto_1032 ) ( NEXT ?auto_1035 ?auto_1033 ) ( not ( = ?auto_1029 ?auto_1032 ) ) ( not ( = ?auto_1033 ?auto_1035 ) ) ( PERSON-AT ?auto_1030 ?auto_1029 ) ( not ( = ?auto_1030 ?auto_1031 ) ) ( PERSON-AT ?auto_1031 ?auto_1032 ) ( FUEL-LEVEL ?auto_1034 ?auto_1035 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1031 ?auto_1029 )
      ( FLY-2PPL-VERIFY ?auto_1030 ?auto_1031 ?auto_1029 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1037 - PERSON
      ?auto_1038 - PERSON
      ?auto_1036 - CITY
    )
    :vars
    (
      ?auto_1040 - AIRCRAFT
      ?auto_1041 - CITY
      ?auto_1042 - FLEVEL
      ?auto_1039 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1040 ?auto_1041 ) ( NEXT ?auto_1042 ?auto_1039 ) ( not ( = ?auto_1036 ?auto_1041 ) ) ( not ( = ?auto_1039 ?auto_1042 ) ) ( PERSON-AT ?auto_1038 ?auto_1036 ) ( not ( = ?auto_1038 ?auto_1037 ) ) ( PERSON-AT ?auto_1037 ?auto_1041 ) ( FUEL-LEVEL ?auto_1040 ?auto_1042 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1038 ?auto_1037 ?auto_1036 )
      ( FLY-2PPL-VERIFY ?auto_1037 ?auto_1038 ?auto_1036 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1052 - PERSON
      ?auto_1051 - CITY
    )
    :vars
    (
      ?auto_1056 - FLEVEL
      ?auto_1053 - FLEVEL
      ?auto_1055 - CITY
      ?auto_1057 - PERSON
      ?auto_1054 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1056 ?auto_1053 ) ( not ( = ?auto_1051 ?auto_1055 ) ) ( not ( = ?auto_1053 ?auto_1056 ) ) ( PERSON-AT ?auto_1057 ?auto_1051 ) ( not ( = ?auto_1057 ?auto_1052 ) ) ( PERSON-AT ?auto_1052 ?auto_1055 ) ( AIRCRAFT-AT ?auto_1054 ?auto_1051 ) ( FUEL-LEVEL ?auto_1054 ?auto_1053 ) )
    :subtasks
    ( ( !FLY ?auto_1054 ?auto_1051 ?auto_1055 ?auto_1053 ?auto_1056 )
      ( FLY-2PPL ?auto_1057 ?auto_1052 ?auto_1051 )
      ( FLY-1PPL-VERIFY ?auto_1052 ?auto_1051 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1059 - PERSON
      ?auto_1060 - PERSON
      ?auto_1058 - CITY
    )
    :vars
    (
      ?auto_1062 - FLEVEL
      ?auto_1064 - FLEVEL
      ?auto_1063 - CITY
      ?auto_1061 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1062 ?auto_1064 ) ( not ( = ?auto_1058 ?auto_1063 ) ) ( not ( = ?auto_1064 ?auto_1062 ) ) ( PERSON-AT ?auto_1059 ?auto_1058 ) ( not ( = ?auto_1059 ?auto_1060 ) ) ( PERSON-AT ?auto_1060 ?auto_1063 ) ( AIRCRAFT-AT ?auto_1061 ?auto_1058 ) ( FUEL-LEVEL ?auto_1061 ?auto_1064 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1060 ?auto_1058 )
      ( FLY-2PPL-VERIFY ?auto_1059 ?auto_1060 ?auto_1058 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1066 - PERSON
      ?auto_1067 - PERSON
      ?auto_1065 - CITY
    )
    :vars
    (
      ?auto_1068 - FLEVEL
      ?auto_1071 - FLEVEL
      ?auto_1069 - CITY
      ?auto_1070 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1068 ?auto_1071 ) ( not ( = ?auto_1065 ?auto_1069 ) ) ( not ( = ?auto_1071 ?auto_1068 ) ) ( PERSON-AT ?auto_1067 ?auto_1065 ) ( not ( = ?auto_1067 ?auto_1066 ) ) ( PERSON-AT ?auto_1066 ?auto_1069 ) ( AIRCRAFT-AT ?auto_1070 ?auto_1065 ) ( FUEL-LEVEL ?auto_1070 ?auto_1071 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1067 ?auto_1066 ?auto_1065 )
      ( FLY-2PPL-VERIFY ?auto_1066 ?auto_1067 ?auto_1065 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1081 - PERSON
      ?auto_1080 - CITY
    )
    :vars
    (
      ?auto_1082 - FLEVEL
      ?auto_1086 - FLEVEL
      ?auto_1083 - CITY
      ?auto_1084 - PERSON
      ?auto_1085 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1082 ?auto_1086 ) ( not ( = ?auto_1080 ?auto_1083 ) ) ( not ( = ?auto_1086 ?auto_1082 ) ) ( PERSON-AT ?auto_1084 ?auto_1080 ) ( not ( = ?auto_1084 ?auto_1081 ) ) ( PERSON-AT ?auto_1081 ?auto_1083 ) ( AIRCRAFT-AT ?auto_1085 ?auto_1080 ) ( FUEL-LEVEL ?auto_1085 ?auto_1082 ) )
    :subtasks
    ( ( !REFUEL ?auto_1085 ?auto_1080 ?auto_1082 ?auto_1086 )
      ( FLY-2PPL ?auto_1084 ?auto_1081 ?auto_1080 )
      ( FLY-1PPL-VERIFY ?auto_1081 ?auto_1080 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1088 - PERSON
      ?auto_1089 - PERSON
      ?auto_1087 - CITY
    )
    :vars
    (
      ?auto_1093 - FLEVEL
      ?auto_1092 - FLEVEL
      ?auto_1090 - CITY
      ?auto_1091 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1093 ?auto_1092 ) ( not ( = ?auto_1087 ?auto_1090 ) ) ( not ( = ?auto_1092 ?auto_1093 ) ) ( PERSON-AT ?auto_1088 ?auto_1087 ) ( not ( = ?auto_1088 ?auto_1089 ) ) ( PERSON-AT ?auto_1089 ?auto_1090 ) ( AIRCRAFT-AT ?auto_1091 ?auto_1087 ) ( FUEL-LEVEL ?auto_1091 ?auto_1093 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1089 ?auto_1087 )
      ( FLY-2PPL-VERIFY ?auto_1088 ?auto_1089 ?auto_1087 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1095 - PERSON
      ?auto_1096 - PERSON
      ?auto_1094 - CITY
    )
    :vars
    (
      ?auto_1099 - FLEVEL
      ?auto_1097 - FLEVEL
      ?auto_1098 - CITY
      ?auto_1100 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1099 ?auto_1097 ) ( not ( = ?auto_1094 ?auto_1098 ) ) ( not ( = ?auto_1097 ?auto_1099 ) ) ( PERSON-AT ?auto_1096 ?auto_1094 ) ( not ( = ?auto_1096 ?auto_1095 ) ) ( PERSON-AT ?auto_1095 ?auto_1098 ) ( AIRCRAFT-AT ?auto_1100 ?auto_1094 ) ( FUEL-LEVEL ?auto_1100 ?auto_1099 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1096 ?auto_1095 ?auto_1094 )
      ( FLY-2PPL-VERIFY ?auto_1095 ?auto_1096 ?auto_1094 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1110 - PERSON
      ?auto_1109 - CITY
    )
    :vars
    (
      ?auto_1113 - FLEVEL
      ?auto_1111 - FLEVEL
      ?auto_1112 - CITY
      ?auto_1115 - PERSON
      ?auto_1114 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1113 ?auto_1111 ) ( not ( = ?auto_1109 ?auto_1112 ) ) ( not ( = ?auto_1111 ?auto_1113 ) ) ( not ( = ?auto_1115 ?auto_1110 ) ) ( PERSON-AT ?auto_1110 ?auto_1112 ) ( AIRCRAFT-AT ?auto_1114 ?auto_1109 ) ( FUEL-LEVEL ?auto_1114 ?auto_1113 ) ( IN ?auto_1115 ?auto_1114 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1115 ?auto_1109 )
      ( FLY-2PPL ?auto_1115 ?auto_1110 ?auto_1109 )
      ( FLY-1PPL-VERIFY ?auto_1110 ?auto_1109 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1117 - PERSON
      ?auto_1118 - PERSON
      ?auto_1116 - CITY
    )
    :vars
    (
      ?auto_1119 - FLEVEL
      ?auto_1122 - FLEVEL
      ?auto_1121 - CITY
      ?auto_1120 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1119 ?auto_1122 ) ( not ( = ?auto_1116 ?auto_1121 ) ) ( not ( = ?auto_1122 ?auto_1119 ) ) ( not ( = ?auto_1117 ?auto_1118 ) ) ( PERSON-AT ?auto_1118 ?auto_1121 ) ( AIRCRAFT-AT ?auto_1120 ?auto_1116 ) ( FUEL-LEVEL ?auto_1120 ?auto_1119 ) ( IN ?auto_1117 ?auto_1120 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1118 ?auto_1116 )
      ( FLY-2PPL-VERIFY ?auto_1117 ?auto_1118 ?auto_1116 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1124 - PERSON
      ?auto_1125 - PERSON
      ?auto_1123 - CITY
    )
    :vars
    (
      ?auto_1129 - FLEVEL
      ?auto_1128 - FLEVEL
      ?auto_1127 - CITY
      ?auto_1126 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1129 ?auto_1128 ) ( not ( = ?auto_1123 ?auto_1127 ) ) ( not ( = ?auto_1128 ?auto_1129 ) ) ( not ( = ?auto_1125 ?auto_1124 ) ) ( PERSON-AT ?auto_1124 ?auto_1127 ) ( AIRCRAFT-AT ?auto_1126 ?auto_1123 ) ( FUEL-LEVEL ?auto_1126 ?auto_1129 ) ( IN ?auto_1125 ?auto_1126 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1125 ?auto_1124 ?auto_1123 )
      ( FLY-2PPL-VERIFY ?auto_1124 ?auto_1125 ?auto_1123 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1139 - PERSON
      ?auto_1138 - CITY
    )
    :vars
    (
      ?auto_1144 - FLEVEL
      ?auto_1143 - FLEVEL
      ?auto_1141 - CITY
      ?auto_1142 - PERSON
      ?auto_1140 - AIRCRAFT
      ?auto_1145 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1144 ?auto_1143 ) ( not ( = ?auto_1138 ?auto_1141 ) ) ( not ( = ?auto_1143 ?auto_1144 ) ) ( not ( = ?auto_1142 ?auto_1139 ) ) ( PERSON-AT ?auto_1139 ?auto_1141 ) ( IN ?auto_1142 ?auto_1140 ) ( AIRCRAFT-AT ?auto_1140 ?auto_1145 ) ( FUEL-LEVEL ?auto_1140 ?auto_1143 ) ( not ( = ?auto_1138 ?auto_1145 ) ) ( not ( = ?auto_1141 ?auto_1145 ) ) )
    :subtasks
    ( ( !FLY ?auto_1140 ?auto_1145 ?auto_1138 ?auto_1143 ?auto_1144 )
      ( FLY-2PPL ?auto_1142 ?auto_1139 ?auto_1138 )
      ( FLY-1PPL-VERIFY ?auto_1139 ?auto_1138 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1147 - PERSON
      ?auto_1148 - PERSON
      ?auto_1146 - CITY
    )
    :vars
    (
      ?auto_1150 - FLEVEL
      ?auto_1151 - FLEVEL
      ?auto_1152 - CITY
      ?auto_1153 - AIRCRAFT
      ?auto_1149 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1150 ?auto_1151 ) ( not ( = ?auto_1146 ?auto_1152 ) ) ( not ( = ?auto_1151 ?auto_1150 ) ) ( not ( = ?auto_1147 ?auto_1148 ) ) ( PERSON-AT ?auto_1148 ?auto_1152 ) ( IN ?auto_1147 ?auto_1153 ) ( AIRCRAFT-AT ?auto_1153 ?auto_1149 ) ( FUEL-LEVEL ?auto_1153 ?auto_1151 ) ( not ( = ?auto_1146 ?auto_1149 ) ) ( not ( = ?auto_1152 ?auto_1149 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1148 ?auto_1146 )
      ( FLY-2PPL-VERIFY ?auto_1147 ?auto_1148 ?auto_1146 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1155 - PERSON
      ?auto_1156 - PERSON
      ?auto_1154 - CITY
    )
    :vars
    (
      ?auto_1159 - FLEVEL
      ?auto_1161 - FLEVEL
      ?auto_1160 - CITY
      ?auto_1157 - AIRCRAFT
      ?auto_1158 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1159 ?auto_1161 ) ( not ( = ?auto_1154 ?auto_1160 ) ) ( not ( = ?auto_1161 ?auto_1159 ) ) ( not ( = ?auto_1156 ?auto_1155 ) ) ( PERSON-AT ?auto_1155 ?auto_1160 ) ( IN ?auto_1156 ?auto_1157 ) ( AIRCRAFT-AT ?auto_1157 ?auto_1158 ) ( FUEL-LEVEL ?auto_1157 ?auto_1161 ) ( not ( = ?auto_1154 ?auto_1158 ) ) ( not ( = ?auto_1160 ?auto_1158 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1156 ?auto_1155 ?auto_1154 )
      ( FLY-2PPL-VERIFY ?auto_1155 ?auto_1156 ?auto_1154 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1172 - PERSON
      ?auto_1171 - CITY
    )
    :vars
    (
      ?auto_1175 - FLEVEL
      ?auto_1177 - FLEVEL
      ?auto_1176 - CITY
      ?auto_1178 - PERSON
      ?auto_1173 - AIRCRAFT
      ?auto_1174 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1175 ?auto_1177 ) ( not ( = ?auto_1171 ?auto_1176 ) ) ( not ( = ?auto_1177 ?auto_1175 ) ) ( not ( = ?auto_1178 ?auto_1172 ) ) ( PERSON-AT ?auto_1172 ?auto_1176 ) ( AIRCRAFT-AT ?auto_1173 ?auto_1174 ) ( FUEL-LEVEL ?auto_1173 ?auto_1177 ) ( not ( = ?auto_1171 ?auto_1174 ) ) ( not ( = ?auto_1176 ?auto_1174 ) ) ( PERSON-AT ?auto_1178 ?auto_1174 ) )
    :subtasks
    ( ( !BOARD ?auto_1178 ?auto_1173 ?auto_1174 )
      ( FLY-2PPL ?auto_1178 ?auto_1172 ?auto_1171 )
      ( FLY-1PPL-VERIFY ?auto_1172 ?auto_1171 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1180 - PERSON
      ?auto_1181 - PERSON
      ?auto_1179 - CITY
    )
    :vars
    (
      ?auto_1184 - FLEVEL
      ?auto_1186 - FLEVEL
      ?auto_1185 - CITY
      ?auto_1182 - AIRCRAFT
      ?auto_1183 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1184 ?auto_1186 ) ( not ( = ?auto_1179 ?auto_1185 ) ) ( not ( = ?auto_1186 ?auto_1184 ) ) ( not ( = ?auto_1180 ?auto_1181 ) ) ( PERSON-AT ?auto_1181 ?auto_1185 ) ( AIRCRAFT-AT ?auto_1182 ?auto_1183 ) ( FUEL-LEVEL ?auto_1182 ?auto_1186 ) ( not ( = ?auto_1179 ?auto_1183 ) ) ( not ( = ?auto_1185 ?auto_1183 ) ) ( PERSON-AT ?auto_1180 ?auto_1183 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1181 ?auto_1179 )
      ( FLY-2PPL-VERIFY ?auto_1180 ?auto_1181 ?auto_1179 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1188 - PERSON
      ?auto_1189 - PERSON
      ?auto_1187 - CITY
    )
    :vars
    (
      ?auto_1193 - FLEVEL
      ?auto_1190 - FLEVEL
      ?auto_1192 - CITY
      ?auto_1191 - AIRCRAFT
      ?auto_1194 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1193 ?auto_1190 ) ( not ( = ?auto_1187 ?auto_1192 ) ) ( not ( = ?auto_1190 ?auto_1193 ) ) ( not ( = ?auto_1189 ?auto_1188 ) ) ( PERSON-AT ?auto_1188 ?auto_1192 ) ( AIRCRAFT-AT ?auto_1191 ?auto_1194 ) ( FUEL-LEVEL ?auto_1191 ?auto_1190 ) ( not ( = ?auto_1187 ?auto_1194 ) ) ( not ( = ?auto_1192 ?auto_1194 ) ) ( PERSON-AT ?auto_1189 ?auto_1194 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1189 ?auto_1188 ?auto_1187 )
      ( FLY-2PPL-VERIFY ?auto_1188 ?auto_1189 ?auto_1187 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1205 - PERSON
      ?auto_1204 - CITY
    )
    :vars
    (
      ?auto_1209 - FLEVEL
      ?auto_1206 - FLEVEL
      ?auto_1208 - CITY
      ?auto_1211 - PERSON
      ?auto_1207 - AIRCRAFT
      ?auto_1210 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1209 ?auto_1206 ) ( not ( = ?auto_1204 ?auto_1208 ) ) ( not ( = ?auto_1206 ?auto_1209 ) ) ( not ( = ?auto_1211 ?auto_1205 ) ) ( PERSON-AT ?auto_1205 ?auto_1208 ) ( AIRCRAFT-AT ?auto_1207 ?auto_1210 ) ( not ( = ?auto_1204 ?auto_1210 ) ) ( not ( = ?auto_1208 ?auto_1210 ) ) ( PERSON-AT ?auto_1211 ?auto_1210 ) ( FUEL-LEVEL ?auto_1207 ?auto_1209 ) )
    :subtasks
    ( ( !REFUEL ?auto_1207 ?auto_1210 ?auto_1209 ?auto_1206 )
      ( FLY-2PPL ?auto_1211 ?auto_1205 ?auto_1204 )
      ( FLY-1PPL-VERIFY ?auto_1205 ?auto_1204 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1213 - PERSON
      ?auto_1214 - PERSON
      ?auto_1212 - CITY
    )
    :vars
    (
      ?auto_1219 - FLEVEL
      ?auto_1216 - FLEVEL
      ?auto_1215 - CITY
      ?auto_1217 - AIRCRAFT
      ?auto_1218 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1219 ?auto_1216 ) ( not ( = ?auto_1212 ?auto_1215 ) ) ( not ( = ?auto_1216 ?auto_1219 ) ) ( not ( = ?auto_1213 ?auto_1214 ) ) ( PERSON-AT ?auto_1214 ?auto_1215 ) ( AIRCRAFT-AT ?auto_1217 ?auto_1218 ) ( not ( = ?auto_1212 ?auto_1218 ) ) ( not ( = ?auto_1215 ?auto_1218 ) ) ( PERSON-AT ?auto_1213 ?auto_1218 ) ( FUEL-LEVEL ?auto_1217 ?auto_1219 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1214 ?auto_1212 )
      ( FLY-2PPL-VERIFY ?auto_1213 ?auto_1214 ?auto_1212 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1221 - PERSON
      ?auto_1222 - PERSON
      ?auto_1220 - CITY
    )
    :vars
    (
      ?auto_1223 - FLEVEL
      ?auto_1227 - FLEVEL
      ?auto_1226 - CITY
      ?auto_1225 - AIRCRAFT
      ?auto_1224 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1223 ?auto_1227 ) ( not ( = ?auto_1220 ?auto_1226 ) ) ( not ( = ?auto_1227 ?auto_1223 ) ) ( not ( = ?auto_1222 ?auto_1221 ) ) ( PERSON-AT ?auto_1221 ?auto_1226 ) ( AIRCRAFT-AT ?auto_1225 ?auto_1224 ) ( not ( = ?auto_1220 ?auto_1224 ) ) ( not ( = ?auto_1226 ?auto_1224 ) ) ( PERSON-AT ?auto_1222 ?auto_1224 ) ( FUEL-LEVEL ?auto_1225 ?auto_1223 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1222 ?auto_1221 ?auto_1220 )
      ( FLY-2PPL-VERIFY ?auto_1221 ?auto_1222 ?auto_1220 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1238 - PERSON
      ?auto_1237 - CITY
    )
    :vars
    (
      ?auto_1239 - FLEVEL
      ?auto_1243 - FLEVEL
      ?auto_1242 - CITY
      ?auto_1244 - PERSON
      ?auto_1240 - CITY
      ?auto_1241 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1239 ?auto_1243 ) ( not ( = ?auto_1237 ?auto_1242 ) ) ( not ( = ?auto_1243 ?auto_1239 ) ) ( not ( = ?auto_1244 ?auto_1238 ) ) ( PERSON-AT ?auto_1238 ?auto_1242 ) ( not ( = ?auto_1237 ?auto_1240 ) ) ( not ( = ?auto_1242 ?auto_1240 ) ) ( PERSON-AT ?auto_1244 ?auto_1240 ) ( AIRCRAFT-AT ?auto_1241 ?auto_1237 ) ( FUEL-LEVEL ?auto_1241 ?auto_1243 ) )
    :subtasks
    ( ( !FLY ?auto_1241 ?auto_1237 ?auto_1240 ?auto_1243 ?auto_1239 )
      ( FLY-2PPL ?auto_1244 ?auto_1238 ?auto_1237 )
      ( FLY-1PPL-VERIFY ?auto_1238 ?auto_1237 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1246 - PERSON
      ?auto_1247 - PERSON
      ?auto_1245 - CITY
    )
    :vars
    (
      ?auto_1250 - FLEVEL
      ?auto_1252 - FLEVEL
      ?auto_1248 - CITY
      ?auto_1249 - CITY
      ?auto_1251 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1250 ?auto_1252 ) ( not ( = ?auto_1245 ?auto_1248 ) ) ( not ( = ?auto_1252 ?auto_1250 ) ) ( not ( = ?auto_1246 ?auto_1247 ) ) ( PERSON-AT ?auto_1247 ?auto_1248 ) ( not ( = ?auto_1245 ?auto_1249 ) ) ( not ( = ?auto_1248 ?auto_1249 ) ) ( PERSON-AT ?auto_1246 ?auto_1249 ) ( AIRCRAFT-AT ?auto_1251 ?auto_1245 ) ( FUEL-LEVEL ?auto_1251 ?auto_1252 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1247 ?auto_1245 )
      ( FLY-2PPL-VERIFY ?auto_1246 ?auto_1247 ?auto_1245 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1254 - PERSON
      ?auto_1255 - PERSON
      ?auto_1253 - CITY
    )
    :vars
    (
      ?auto_1260 - FLEVEL
      ?auto_1258 - FLEVEL
      ?auto_1257 - CITY
      ?auto_1259 - CITY
      ?auto_1256 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1260 ?auto_1258 ) ( not ( = ?auto_1253 ?auto_1257 ) ) ( not ( = ?auto_1258 ?auto_1260 ) ) ( not ( = ?auto_1255 ?auto_1254 ) ) ( PERSON-AT ?auto_1254 ?auto_1257 ) ( not ( = ?auto_1253 ?auto_1259 ) ) ( not ( = ?auto_1257 ?auto_1259 ) ) ( PERSON-AT ?auto_1255 ?auto_1259 ) ( AIRCRAFT-AT ?auto_1256 ?auto_1253 ) ( FUEL-LEVEL ?auto_1256 ?auto_1258 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1255 ?auto_1254 ?auto_1253 )
      ( FLY-2PPL-VERIFY ?auto_1254 ?auto_1255 ?auto_1253 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1271 - PERSON
      ?auto_1270 - CITY
    )
    :vars
    (
      ?auto_1276 - FLEVEL
      ?auto_1274 - FLEVEL
      ?auto_1273 - CITY
      ?auto_1277 - PERSON
      ?auto_1275 - CITY
      ?auto_1272 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1276 ?auto_1274 ) ( not ( = ?auto_1270 ?auto_1273 ) ) ( not ( = ?auto_1274 ?auto_1276 ) ) ( not ( = ?auto_1277 ?auto_1271 ) ) ( PERSON-AT ?auto_1271 ?auto_1273 ) ( not ( = ?auto_1270 ?auto_1275 ) ) ( not ( = ?auto_1273 ?auto_1275 ) ) ( PERSON-AT ?auto_1277 ?auto_1275 ) ( AIRCRAFT-AT ?auto_1272 ?auto_1270 ) ( FUEL-LEVEL ?auto_1272 ?auto_1276 ) )
    :subtasks
    ( ( !REFUEL ?auto_1272 ?auto_1270 ?auto_1276 ?auto_1274 )
      ( FLY-2PPL ?auto_1277 ?auto_1271 ?auto_1270 )
      ( FLY-1PPL-VERIFY ?auto_1271 ?auto_1270 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1279 - PERSON
      ?auto_1280 - PERSON
      ?auto_1278 - CITY
    )
    :vars
    (
      ?auto_1285 - FLEVEL
      ?auto_1281 - FLEVEL
      ?auto_1282 - CITY
      ?auto_1283 - CITY
      ?auto_1284 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1285 ?auto_1281 ) ( not ( = ?auto_1278 ?auto_1282 ) ) ( not ( = ?auto_1281 ?auto_1285 ) ) ( not ( = ?auto_1279 ?auto_1280 ) ) ( PERSON-AT ?auto_1280 ?auto_1282 ) ( not ( = ?auto_1278 ?auto_1283 ) ) ( not ( = ?auto_1282 ?auto_1283 ) ) ( PERSON-AT ?auto_1279 ?auto_1283 ) ( AIRCRAFT-AT ?auto_1284 ?auto_1278 ) ( FUEL-LEVEL ?auto_1284 ?auto_1285 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1280 ?auto_1278 )
      ( FLY-2PPL-VERIFY ?auto_1279 ?auto_1280 ?auto_1278 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1287 - PERSON
      ?auto_1288 - PERSON
      ?auto_1286 - CITY
    )
    :vars
    (
      ?auto_1290 - FLEVEL
      ?auto_1293 - FLEVEL
      ?auto_1289 - CITY
      ?auto_1291 - CITY
      ?auto_1292 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1290 ?auto_1293 ) ( not ( = ?auto_1286 ?auto_1289 ) ) ( not ( = ?auto_1293 ?auto_1290 ) ) ( not ( = ?auto_1288 ?auto_1287 ) ) ( PERSON-AT ?auto_1287 ?auto_1289 ) ( not ( = ?auto_1286 ?auto_1291 ) ) ( not ( = ?auto_1289 ?auto_1291 ) ) ( PERSON-AT ?auto_1288 ?auto_1291 ) ( AIRCRAFT-AT ?auto_1292 ?auto_1286 ) ( FUEL-LEVEL ?auto_1292 ?auto_1290 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1288 ?auto_1287 ?auto_1286 )
      ( FLY-2PPL-VERIFY ?auto_1287 ?auto_1288 ?auto_1286 ) )
  )

)

