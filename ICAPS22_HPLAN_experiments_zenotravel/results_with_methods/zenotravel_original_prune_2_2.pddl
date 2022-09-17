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
      ?auto_824 - PERSON
      ?auto_823 - CITY
    )
    :vars
    (
      ?auto_825 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_824 ?auto_825 ) ( AIRCRAFT-AT ?auto_825 ?auto_823 ) )
    :subtasks
    ( ( !DEBARK ?auto_824 ?auto_825 ?auto_823 )
      ( FLY-1PPL-VERIFY ?auto_824 ?auto_823 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_831 - PERSON
      ?auto_830 - CITY
    )
    :vars
    (
      ?auto_832 - AIRCRAFT
      ?auto_835 - CITY
      ?auto_833 - FLEVEL
      ?auto_834 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_831 ?auto_832 ) ( AIRCRAFT-AT ?auto_832 ?auto_835 ) ( FUEL-LEVEL ?auto_832 ?auto_833 ) ( NEXT ?auto_834 ?auto_833 ) ( not ( = ?auto_830 ?auto_835 ) ) ( not ( = ?auto_833 ?auto_834 ) ) )
    :subtasks
    ( ( !FLY ?auto_832 ?auto_835 ?auto_830 ?auto_833 ?auto_834 )
      ( FLY-1PPL ?auto_831 ?auto_830 )
      ( FLY-1PPL-VERIFY ?auto_831 ?auto_830 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_844 - PERSON
      ?auto_843 - CITY
    )
    :vars
    (
      ?auto_847 - AIRCRAFT
      ?auto_845 - CITY
      ?auto_848 - FLEVEL
      ?auto_846 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_847 ?auto_845 ) ( FUEL-LEVEL ?auto_847 ?auto_848 ) ( NEXT ?auto_846 ?auto_848 ) ( not ( = ?auto_843 ?auto_845 ) ) ( not ( = ?auto_848 ?auto_846 ) ) ( PERSON-AT ?auto_844 ?auto_845 ) )
    :subtasks
    ( ( !BOARD ?auto_844 ?auto_847 ?auto_845 )
      ( FLY-1PPL ?auto_844 ?auto_843 )
      ( FLY-1PPL-VERIFY ?auto_844 ?auto_843 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_857 - PERSON
      ?auto_856 - CITY
    )
    :vars
    (
      ?auto_860 - AIRCRAFT
      ?auto_859 - CITY
      ?auto_861 - FLEVEL
      ?auto_858 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_860 ?auto_859 ) ( NEXT ?auto_861 ?auto_858 ) ( not ( = ?auto_856 ?auto_859 ) ) ( not ( = ?auto_858 ?auto_861 ) ) ( PERSON-AT ?auto_857 ?auto_859 ) ( FUEL-LEVEL ?auto_860 ?auto_861 ) )
    :subtasks
    ( ( !REFUEL ?auto_860 ?auto_859 ?auto_861 ?auto_858 )
      ( FLY-1PPL ?auto_857 ?auto_856 )
      ( FLY-1PPL-VERIFY ?auto_857 ?auto_856 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_870 - PERSON
      ?auto_869 - CITY
    )
    :vars
    (
      ?auto_874 - FLEVEL
      ?auto_873 - FLEVEL
      ?auto_871 - CITY
      ?auto_872 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_874 ?auto_873 ) ( not ( = ?auto_869 ?auto_871 ) ) ( not ( = ?auto_873 ?auto_874 ) ) ( PERSON-AT ?auto_870 ?auto_871 ) ( AIRCRAFT-AT ?auto_872 ?auto_869 ) ( FUEL-LEVEL ?auto_872 ?auto_873 ) )
    :subtasks
    ( ( !FLY ?auto_872 ?auto_869 ?auto_871 ?auto_873 ?auto_874 )
      ( FLY-1PPL ?auto_870 ?auto_869 )
      ( FLY-1PPL-VERIFY ?auto_870 ?auto_869 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_883 - PERSON
      ?auto_882 - CITY
    )
    :vars
    (
      ?auto_887 - FLEVEL
      ?auto_886 - FLEVEL
      ?auto_884 - CITY
      ?auto_885 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_887 ?auto_886 ) ( not ( = ?auto_882 ?auto_884 ) ) ( not ( = ?auto_886 ?auto_887 ) ) ( PERSON-AT ?auto_883 ?auto_884 ) ( AIRCRAFT-AT ?auto_885 ?auto_882 ) ( FUEL-LEVEL ?auto_885 ?auto_887 ) )
    :subtasks
    ( ( !REFUEL ?auto_885 ?auto_882 ?auto_887 ?auto_886 )
      ( FLY-1PPL ?auto_883 ?auto_882 )
      ( FLY-1PPL-VERIFY ?auto_883 ?auto_882 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_910 - PERSON
      ?auto_911 - PERSON
      ?auto_909 - CITY
    )
    :vars
    (
      ?auto_912 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_911 ?auto_912 ) ( AIRCRAFT-AT ?auto_912 ?auto_909 ) ( PERSON-AT ?auto_910 ?auto_909 ) ( not ( = ?auto_910 ?auto_911 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_911 ?auto_909 )
      ( FLY-2PPL-VERIFY ?auto_910 ?auto_911 ?auto_909 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_914 - PERSON
      ?auto_915 - PERSON
      ?auto_913 - CITY
    )
    :vars
    (
      ?auto_916 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_914 ?auto_916 ) ( AIRCRAFT-AT ?auto_916 ?auto_913 ) ( PERSON-AT ?auto_915 ?auto_913 ) ( not ( = ?auto_914 ?auto_915 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_914 ?auto_913 )
      ( FLY-2PPL-VERIFY ?auto_914 ?auto_915 ?auto_913 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_928 - PERSON
      ?auto_929 - PERSON
      ?auto_927 - CITY
    )
    :vars
    (
      ?auto_931 - AIRCRAFT
      ?auto_932 - CITY
      ?auto_933 - FLEVEL
      ?auto_930 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_929 ?auto_931 ) ( AIRCRAFT-AT ?auto_931 ?auto_932 ) ( FUEL-LEVEL ?auto_931 ?auto_933 ) ( NEXT ?auto_930 ?auto_933 ) ( not ( = ?auto_927 ?auto_932 ) ) ( not ( = ?auto_933 ?auto_930 ) ) ( PERSON-AT ?auto_928 ?auto_927 ) ( not ( = ?auto_928 ?auto_929 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_929 ?auto_927 )
      ( FLY-2PPL-VERIFY ?auto_928 ?auto_929 ?auto_927 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_935 - PERSON
      ?auto_936 - PERSON
      ?auto_934 - CITY
    )
    :vars
    (
      ?auto_937 - AIRCRAFT
      ?auto_939 - CITY
      ?auto_940 - FLEVEL
      ?auto_938 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_935 ?auto_937 ) ( AIRCRAFT-AT ?auto_937 ?auto_939 ) ( FUEL-LEVEL ?auto_937 ?auto_940 ) ( NEXT ?auto_938 ?auto_940 ) ( not ( = ?auto_934 ?auto_939 ) ) ( not ( = ?auto_940 ?auto_938 ) ) ( PERSON-AT ?auto_936 ?auto_934 ) ( not ( = ?auto_936 ?auto_935 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_936 ?auto_935 ?auto_934 )
      ( FLY-2PPL-VERIFY ?auto_935 ?auto_936 ?auto_934 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_950 - PERSON
      ?auto_949 - CITY
    )
    :vars
    (
      ?auto_951 - AIRCRAFT
      ?auto_953 - CITY
      ?auto_954 - FLEVEL
      ?auto_952 - FLEVEL
      ?auto_955 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_951 ?auto_953 ) ( FUEL-LEVEL ?auto_951 ?auto_954 ) ( NEXT ?auto_952 ?auto_954 ) ( not ( = ?auto_949 ?auto_953 ) ) ( not ( = ?auto_954 ?auto_952 ) ) ( PERSON-AT ?auto_955 ?auto_949 ) ( not ( = ?auto_955 ?auto_950 ) ) ( PERSON-AT ?auto_950 ?auto_953 ) )
    :subtasks
    ( ( !BOARD ?auto_950 ?auto_951 ?auto_953 )
      ( FLY-2PPL ?auto_955 ?auto_950 ?auto_949 )
      ( FLY-1PPL-VERIFY ?auto_950 ?auto_949 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_957 - PERSON
      ?auto_958 - PERSON
      ?auto_956 - CITY
    )
    :vars
    (
      ?auto_959 - AIRCRAFT
      ?auto_960 - CITY
      ?auto_961 - FLEVEL
      ?auto_962 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_959 ?auto_960 ) ( FUEL-LEVEL ?auto_959 ?auto_961 ) ( NEXT ?auto_962 ?auto_961 ) ( not ( = ?auto_956 ?auto_960 ) ) ( not ( = ?auto_961 ?auto_962 ) ) ( PERSON-AT ?auto_957 ?auto_956 ) ( not ( = ?auto_957 ?auto_958 ) ) ( PERSON-AT ?auto_958 ?auto_960 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_958 ?auto_956 )
      ( FLY-2PPL-VERIFY ?auto_957 ?auto_958 ?auto_956 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_964 - PERSON
      ?auto_965 - PERSON
      ?auto_963 - CITY
    )
    :vars
    (
      ?auto_967 - AIRCRAFT
      ?auto_969 - CITY
      ?auto_966 - FLEVEL
      ?auto_968 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_967 ?auto_969 ) ( FUEL-LEVEL ?auto_967 ?auto_966 ) ( NEXT ?auto_968 ?auto_966 ) ( not ( = ?auto_963 ?auto_969 ) ) ( not ( = ?auto_966 ?auto_968 ) ) ( PERSON-AT ?auto_965 ?auto_963 ) ( not ( = ?auto_965 ?auto_964 ) ) ( PERSON-AT ?auto_964 ?auto_969 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_965 ?auto_964 ?auto_963 )
      ( FLY-2PPL-VERIFY ?auto_964 ?auto_965 ?auto_963 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_979 - PERSON
      ?auto_978 - CITY
    )
    :vars
    (
      ?auto_981 - AIRCRAFT
      ?auto_984 - CITY
      ?auto_982 - FLEVEL
      ?auto_980 - FLEVEL
      ?auto_983 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_981 ?auto_984 ) ( NEXT ?auto_982 ?auto_980 ) ( not ( = ?auto_978 ?auto_984 ) ) ( not ( = ?auto_980 ?auto_982 ) ) ( PERSON-AT ?auto_983 ?auto_978 ) ( not ( = ?auto_983 ?auto_979 ) ) ( PERSON-AT ?auto_979 ?auto_984 ) ( FUEL-LEVEL ?auto_981 ?auto_982 ) )
    :subtasks
    ( ( !REFUEL ?auto_981 ?auto_984 ?auto_982 ?auto_980 )
      ( FLY-2PPL ?auto_983 ?auto_979 ?auto_978 )
      ( FLY-1PPL-VERIFY ?auto_979 ?auto_978 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_986 - PERSON
      ?auto_987 - PERSON
      ?auto_985 - CITY
    )
    :vars
    (
      ?auto_991 - AIRCRAFT
      ?auto_989 - CITY
      ?auto_990 - FLEVEL
      ?auto_988 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_991 ?auto_989 ) ( NEXT ?auto_990 ?auto_988 ) ( not ( = ?auto_985 ?auto_989 ) ) ( not ( = ?auto_988 ?auto_990 ) ) ( PERSON-AT ?auto_986 ?auto_985 ) ( not ( = ?auto_986 ?auto_987 ) ) ( PERSON-AT ?auto_987 ?auto_989 ) ( FUEL-LEVEL ?auto_991 ?auto_990 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_987 ?auto_985 )
      ( FLY-2PPL-VERIFY ?auto_986 ?auto_987 ?auto_985 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_993 - PERSON
      ?auto_994 - PERSON
      ?auto_992 - CITY
    )
    :vars
    (
      ?auto_996 - AIRCRAFT
      ?auto_997 - CITY
      ?auto_998 - FLEVEL
      ?auto_995 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_996 ?auto_997 ) ( NEXT ?auto_998 ?auto_995 ) ( not ( = ?auto_992 ?auto_997 ) ) ( not ( = ?auto_995 ?auto_998 ) ) ( PERSON-AT ?auto_994 ?auto_992 ) ( not ( = ?auto_994 ?auto_993 ) ) ( PERSON-AT ?auto_993 ?auto_997 ) ( FUEL-LEVEL ?auto_996 ?auto_998 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_994 ?auto_993 ?auto_992 )
      ( FLY-2PPL-VERIFY ?auto_993 ?auto_994 ?auto_992 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1008 - PERSON
      ?auto_1007 - CITY
    )
    :vars
    (
      ?auto_1013 - FLEVEL
      ?auto_1010 - FLEVEL
      ?auto_1012 - CITY
      ?auto_1009 - PERSON
      ?auto_1011 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1013 ?auto_1010 ) ( not ( = ?auto_1007 ?auto_1012 ) ) ( not ( = ?auto_1010 ?auto_1013 ) ) ( PERSON-AT ?auto_1009 ?auto_1007 ) ( not ( = ?auto_1009 ?auto_1008 ) ) ( PERSON-AT ?auto_1008 ?auto_1012 ) ( AIRCRAFT-AT ?auto_1011 ?auto_1007 ) ( FUEL-LEVEL ?auto_1011 ?auto_1010 ) )
    :subtasks
    ( ( !FLY ?auto_1011 ?auto_1007 ?auto_1012 ?auto_1010 ?auto_1013 )
      ( FLY-2PPL ?auto_1009 ?auto_1008 ?auto_1007 )
      ( FLY-1PPL-VERIFY ?auto_1008 ?auto_1007 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1015 - PERSON
      ?auto_1016 - PERSON
      ?auto_1014 - CITY
    )
    :vars
    (
      ?auto_1019 - FLEVEL
      ?auto_1020 - FLEVEL
      ?auto_1018 - CITY
      ?auto_1017 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1019 ?auto_1020 ) ( not ( = ?auto_1014 ?auto_1018 ) ) ( not ( = ?auto_1020 ?auto_1019 ) ) ( PERSON-AT ?auto_1015 ?auto_1014 ) ( not ( = ?auto_1015 ?auto_1016 ) ) ( PERSON-AT ?auto_1016 ?auto_1018 ) ( AIRCRAFT-AT ?auto_1017 ?auto_1014 ) ( FUEL-LEVEL ?auto_1017 ?auto_1020 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1016 ?auto_1014 )
      ( FLY-2PPL-VERIFY ?auto_1015 ?auto_1016 ?auto_1014 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1022 - PERSON
      ?auto_1023 - PERSON
      ?auto_1021 - CITY
    )
    :vars
    (
      ?auto_1027 - FLEVEL
      ?auto_1024 - FLEVEL
      ?auto_1025 - CITY
      ?auto_1026 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1027 ?auto_1024 ) ( not ( = ?auto_1021 ?auto_1025 ) ) ( not ( = ?auto_1024 ?auto_1027 ) ) ( PERSON-AT ?auto_1023 ?auto_1021 ) ( not ( = ?auto_1023 ?auto_1022 ) ) ( PERSON-AT ?auto_1022 ?auto_1025 ) ( AIRCRAFT-AT ?auto_1026 ?auto_1021 ) ( FUEL-LEVEL ?auto_1026 ?auto_1024 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1023 ?auto_1022 ?auto_1021 )
      ( FLY-2PPL-VERIFY ?auto_1022 ?auto_1023 ?auto_1021 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1037 - PERSON
      ?auto_1036 - CITY
    )
    :vars
    (
      ?auto_1042 - FLEVEL
      ?auto_1038 - FLEVEL
      ?auto_1040 - CITY
      ?auto_1039 - PERSON
      ?auto_1041 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1042 ?auto_1038 ) ( not ( = ?auto_1036 ?auto_1040 ) ) ( not ( = ?auto_1038 ?auto_1042 ) ) ( PERSON-AT ?auto_1039 ?auto_1036 ) ( not ( = ?auto_1039 ?auto_1037 ) ) ( PERSON-AT ?auto_1037 ?auto_1040 ) ( AIRCRAFT-AT ?auto_1041 ?auto_1036 ) ( FUEL-LEVEL ?auto_1041 ?auto_1042 ) )
    :subtasks
    ( ( !REFUEL ?auto_1041 ?auto_1036 ?auto_1042 ?auto_1038 )
      ( FLY-2PPL ?auto_1039 ?auto_1037 ?auto_1036 )
      ( FLY-1PPL-VERIFY ?auto_1037 ?auto_1036 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1044 - PERSON
      ?auto_1045 - PERSON
      ?auto_1043 - CITY
    )
    :vars
    (
      ?auto_1046 - FLEVEL
      ?auto_1049 - FLEVEL
      ?auto_1047 - CITY
      ?auto_1048 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1046 ?auto_1049 ) ( not ( = ?auto_1043 ?auto_1047 ) ) ( not ( = ?auto_1049 ?auto_1046 ) ) ( PERSON-AT ?auto_1044 ?auto_1043 ) ( not ( = ?auto_1044 ?auto_1045 ) ) ( PERSON-AT ?auto_1045 ?auto_1047 ) ( AIRCRAFT-AT ?auto_1048 ?auto_1043 ) ( FUEL-LEVEL ?auto_1048 ?auto_1046 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1045 ?auto_1043 )
      ( FLY-2PPL-VERIFY ?auto_1044 ?auto_1045 ?auto_1043 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1051 - PERSON
      ?auto_1052 - PERSON
      ?auto_1050 - CITY
    )
    :vars
    (
      ?auto_1054 - FLEVEL
      ?auto_1053 - FLEVEL
      ?auto_1056 - CITY
      ?auto_1055 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1054 ?auto_1053 ) ( not ( = ?auto_1050 ?auto_1056 ) ) ( not ( = ?auto_1053 ?auto_1054 ) ) ( PERSON-AT ?auto_1052 ?auto_1050 ) ( not ( = ?auto_1052 ?auto_1051 ) ) ( PERSON-AT ?auto_1051 ?auto_1056 ) ( AIRCRAFT-AT ?auto_1055 ?auto_1050 ) ( FUEL-LEVEL ?auto_1055 ?auto_1054 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1052 ?auto_1051 ?auto_1050 )
      ( FLY-2PPL-VERIFY ?auto_1051 ?auto_1052 ?auto_1050 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1066 - PERSON
      ?auto_1065 - CITY
    )
    :vars
    (
      ?auto_1069 - FLEVEL
      ?auto_1068 - FLEVEL
      ?auto_1071 - CITY
      ?auto_1067 - PERSON
      ?auto_1070 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1069 ?auto_1068 ) ( not ( = ?auto_1065 ?auto_1071 ) ) ( not ( = ?auto_1068 ?auto_1069 ) ) ( not ( = ?auto_1067 ?auto_1066 ) ) ( PERSON-AT ?auto_1066 ?auto_1071 ) ( AIRCRAFT-AT ?auto_1070 ?auto_1065 ) ( FUEL-LEVEL ?auto_1070 ?auto_1069 ) ( IN ?auto_1067 ?auto_1070 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1067 ?auto_1065 )
      ( FLY-2PPL ?auto_1067 ?auto_1066 ?auto_1065 )
      ( FLY-1PPL-VERIFY ?auto_1066 ?auto_1065 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1073 - PERSON
      ?auto_1074 - PERSON
      ?auto_1072 - CITY
    )
    :vars
    (
      ?auto_1077 - FLEVEL
      ?auto_1078 - FLEVEL
      ?auto_1076 - CITY
      ?auto_1075 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1077 ?auto_1078 ) ( not ( = ?auto_1072 ?auto_1076 ) ) ( not ( = ?auto_1078 ?auto_1077 ) ) ( not ( = ?auto_1073 ?auto_1074 ) ) ( PERSON-AT ?auto_1074 ?auto_1076 ) ( AIRCRAFT-AT ?auto_1075 ?auto_1072 ) ( FUEL-LEVEL ?auto_1075 ?auto_1077 ) ( IN ?auto_1073 ?auto_1075 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1074 ?auto_1072 )
      ( FLY-2PPL-VERIFY ?auto_1073 ?auto_1074 ?auto_1072 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1080 - PERSON
      ?auto_1081 - PERSON
      ?auto_1079 - CITY
    )
    :vars
    (
      ?auto_1084 - FLEVEL
      ?auto_1085 - FLEVEL
      ?auto_1083 - CITY
      ?auto_1082 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1084 ?auto_1085 ) ( not ( = ?auto_1079 ?auto_1083 ) ) ( not ( = ?auto_1085 ?auto_1084 ) ) ( not ( = ?auto_1081 ?auto_1080 ) ) ( PERSON-AT ?auto_1080 ?auto_1083 ) ( AIRCRAFT-AT ?auto_1082 ?auto_1079 ) ( FUEL-LEVEL ?auto_1082 ?auto_1084 ) ( IN ?auto_1081 ?auto_1082 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1081 ?auto_1080 ?auto_1079 )
      ( FLY-2PPL-VERIFY ?auto_1080 ?auto_1081 ?auto_1079 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1095 - PERSON
      ?auto_1094 - CITY
    )
    :vars
    (
      ?auto_1099 - FLEVEL
      ?auto_1100 - FLEVEL
      ?auto_1097 - CITY
      ?auto_1098 - PERSON
      ?auto_1096 - AIRCRAFT
      ?auto_1101 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1099 ?auto_1100 ) ( not ( = ?auto_1094 ?auto_1097 ) ) ( not ( = ?auto_1100 ?auto_1099 ) ) ( not ( = ?auto_1098 ?auto_1095 ) ) ( PERSON-AT ?auto_1095 ?auto_1097 ) ( IN ?auto_1098 ?auto_1096 ) ( AIRCRAFT-AT ?auto_1096 ?auto_1101 ) ( FUEL-LEVEL ?auto_1096 ?auto_1100 ) ( not ( = ?auto_1094 ?auto_1101 ) ) ( not ( = ?auto_1097 ?auto_1101 ) ) )
    :subtasks
    ( ( !FLY ?auto_1096 ?auto_1101 ?auto_1094 ?auto_1100 ?auto_1099 )
      ( FLY-2PPL ?auto_1098 ?auto_1095 ?auto_1094 )
      ( FLY-1PPL-VERIFY ?auto_1095 ?auto_1094 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1103 - PERSON
      ?auto_1104 - PERSON
      ?auto_1102 - CITY
    )
    :vars
    (
      ?auto_1105 - FLEVEL
      ?auto_1106 - FLEVEL
      ?auto_1107 - CITY
      ?auto_1109 - AIRCRAFT
      ?auto_1108 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1105 ?auto_1106 ) ( not ( = ?auto_1102 ?auto_1107 ) ) ( not ( = ?auto_1106 ?auto_1105 ) ) ( not ( = ?auto_1103 ?auto_1104 ) ) ( PERSON-AT ?auto_1104 ?auto_1107 ) ( IN ?auto_1103 ?auto_1109 ) ( AIRCRAFT-AT ?auto_1109 ?auto_1108 ) ( FUEL-LEVEL ?auto_1109 ?auto_1106 ) ( not ( = ?auto_1102 ?auto_1108 ) ) ( not ( = ?auto_1107 ?auto_1108 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1104 ?auto_1102 )
      ( FLY-2PPL-VERIFY ?auto_1103 ?auto_1104 ?auto_1102 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1111 - PERSON
      ?auto_1112 - PERSON
      ?auto_1110 - CITY
    )
    :vars
    (
      ?auto_1113 - FLEVEL
      ?auto_1115 - FLEVEL
      ?auto_1117 - CITY
      ?auto_1114 - AIRCRAFT
      ?auto_1116 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1113 ?auto_1115 ) ( not ( = ?auto_1110 ?auto_1117 ) ) ( not ( = ?auto_1115 ?auto_1113 ) ) ( not ( = ?auto_1112 ?auto_1111 ) ) ( PERSON-AT ?auto_1111 ?auto_1117 ) ( IN ?auto_1112 ?auto_1114 ) ( AIRCRAFT-AT ?auto_1114 ?auto_1116 ) ( FUEL-LEVEL ?auto_1114 ?auto_1115 ) ( not ( = ?auto_1110 ?auto_1116 ) ) ( not ( = ?auto_1117 ?auto_1116 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1112 ?auto_1111 ?auto_1110 )
      ( FLY-2PPL-VERIFY ?auto_1111 ?auto_1112 ?auto_1110 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1128 - PERSON
      ?auto_1127 - CITY
    )
    :vars
    (
      ?auto_1129 - FLEVEL
      ?auto_1131 - FLEVEL
      ?auto_1133 - CITY
      ?auto_1134 - PERSON
      ?auto_1130 - AIRCRAFT
      ?auto_1132 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1129 ?auto_1131 ) ( not ( = ?auto_1127 ?auto_1133 ) ) ( not ( = ?auto_1131 ?auto_1129 ) ) ( not ( = ?auto_1134 ?auto_1128 ) ) ( PERSON-AT ?auto_1128 ?auto_1133 ) ( AIRCRAFT-AT ?auto_1130 ?auto_1132 ) ( FUEL-LEVEL ?auto_1130 ?auto_1131 ) ( not ( = ?auto_1127 ?auto_1132 ) ) ( not ( = ?auto_1133 ?auto_1132 ) ) ( PERSON-AT ?auto_1134 ?auto_1132 ) )
    :subtasks
    ( ( !BOARD ?auto_1134 ?auto_1130 ?auto_1132 )
      ( FLY-2PPL ?auto_1134 ?auto_1128 ?auto_1127 )
      ( FLY-1PPL-VERIFY ?auto_1128 ?auto_1127 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1136 - PERSON
      ?auto_1137 - PERSON
      ?auto_1135 - CITY
    )
    :vars
    (
      ?auto_1138 - FLEVEL
      ?auto_1141 - FLEVEL
      ?auto_1140 - CITY
      ?auto_1142 - AIRCRAFT
      ?auto_1139 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1138 ?auto_1141 ) ( not ( = ?auto_1135 ?auto_1140 ) ) ( not ( = ?auto_1141 ?auto_1138 ) ) ( not ( = ?auto_1136 ?auto_1137 ) ) ( PERSON-AT ?auto_1137 ?auto_1140 ) ( AIRCRAFT-AT ?auto_1142 ?auto_1139 ) ( FUEL-LEVEL ?auto_1142 ?auto_1141 ) ( not ( = ?auto_1135 ?auto_1139 ) ) ( not ( = ?auto_1140 ?auto_1139 ) ) ( PERSON-AT ?auto_1136 ?auto_1139 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1137 ?auto_1135 )
      ( FLY-2PPL-VERIFY ?auto_1136 ?auto_1137 ?auto_1135 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1144 - PERSON
      ?auto_1145 - PERSON
      ?auto_1143 - CITY
    )
    :vars
    (
      ?auto_1150 - FLEVEL
      ?auto_1146 - FLEVEL
      ?auto_1148 - CITY
      ?auto_1147 - AIRCRAFT
      ?auto_1149 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1150 ?auto_1146 ) ( not ( = ?auto_1143 ?auto_1148 ) ) ( not ( = ?auto_1146 ?auto_1150 ) ) ( not ( = ?auto_1145 ?auto_1144 ) ) ( PERSON-AT ?auto_1144 ?auto_1148 ) ( AIRCRAFT-AT ?auto_1147 ?auto_1149 ) ( FUEL-LEVEL ?auto_1147 ?auto_1146 ) ( not ( = ?auto_1143 ?auto_1149 ) ) ( not ( = ?auto_1148 ?auto_1149 ) ) ( PERSON-AT ?auto_1145 ?auto_1149 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1145 ?auto_1144 ?auto_1143 )
      ( FLY-2PPL-VERIFY ?auto_1144 ?auto_1145 ?auto_1143 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1161 - PERSON
      ?auto_1160 - CITY
    )
    :vars
    (
      ?auto_1166 - FLEVEL
      ?auto_1162 - FLEVEL
      ?auto_1164 - CITY
      ?auto_1167 - PERSON
      ?auto_1163 - AIRCRAFT
      ?auto_1165 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1166 ?auto_1162 ) ( not ( = ?auto_1160 ?auto_1164 ) ) ( not ( = ?auto_1162 ?auto_1166 ) ) ( not ( = ?auto_1167 ?auto_1161 ) ) ( PERSON-AT ?auto_1161 ?auto_1164 ) ( AIRCRAFT-AT ?auto_1163 ?auto_1165 ) ( not ( = ?auto_1160 ?auto_1165 ) ) ( not ( = ?auto_1164 ?auto_1165 ) ) ( PERSON-AT ?auto_1167 ?auto_1165 ) ( FUEL-LEVEL ?auto_1163 ?auto_1166 ) )
    :subtasks
    ( ( !REFUEL ?auto_1163 ?auto_1165 ?auto_1166 ?auto_1162 )
      ( FLY-2PPL ?auto_1167 ?auto_1161 ?auto_1160 )
      ( FLY-1PPL-VERIFY ?auto_1161 ?auto_1160 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1169 - PERSON
      ?auto_1170 - PERSON
      ?auto_1168 - CITY
    )
    :vars
    (
      ?auto_1174 - FLEVEL
      ?auto_1173 - FLEVEL
      ?auto_1175 - CITY
      ?auto_1172 - AIRCRAFT
      ?auto_1171 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1174 ?auto_1173 ) ( not ( = ?auto_1168 ?auto_1175 ) ) ( not ( = ?auto_1173 ?auto_1174 ) ) ( not ( = ?auto_1169 ?auto_1170 ) ) ( PERSON-AT ?auto_1170 ?auto_1175 ) ( AIRCRAFT-AT ?auto_1172 ?auto_1171 ) ( not ( = ?auto_1168 ?auto_1171 ) ) ( not ( = ?auto_1175 ?auto_1171 ) ) ( PERSON-AT ?auto_1169 ?auto_1171 ) ( FUEL-LEVEL ?auto_1172 ?auto_1174 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1170 ?auto_1168 )
      ( FLY-2PPL-VERIFY ?auto_1169 ?auto_1170 ?auto_1168 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1177 - PERSON
      ?auto_1178 - PERSON
      ?auto_1176 - CITY
    )
    :vars
    (
      ?auto_1181 - FLEVEL
      ?auto_1179 - FLEVEL
      ?auto_1180 - CITY
      ?auto_1182 - AIRCRAFT
      ?auto_1183 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_1181 ?auto_1179 ) ( not ( = ?auto_1176 ?auto_1180 ) ) ( not ( = ?auto_1179 ?auto_1181 ) ) ( not ( = ?auto_1178 ?auto_1177 ) ) ( PERSON-AT ?auto_1177 ?auto_1180 ) ( AIRCRAFT-AT ?auto_1182 ?auto_1183 ) ( not ( = ?auto_1176 ?auto_1183 ) ) ( not ( = ?auto_1180 ?auto_1183 ) ) ( PERSON-AT ?auto_1178 ?auto_1183 ) ( FUEL-LEVEL ?auto_1182 ?auto_1181 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1178 ?auto_1177 ?auto_1176 )
      ( FLY-2PPL-VERIFY ?auto_1177 ?auto_1178 ?auto_1176 ) )
  )

)

