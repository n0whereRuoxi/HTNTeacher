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

  ( :method FLY-3PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_6750 - PERSON
      ?auto_6749 - CITY
    )
    :vars
    (
      ?auto_6751 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_6750 ?auto_6751 ) ( AIRCRAFT-AT ?auto_6751 ?auto_6749 ) )
    :subtasks
    ( ( !DEBARK ?auto_6750 ?auto_6751 ?auto_6749 )
      ( FLY-1PPL-VERIFY ?auto_6750 ?auto_6749 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_6762 - PERSON
      ?auto_6761 - CITY
    )
    :vars
    (
      ?auto_6763 - AIRCRAFT
      ?auto_6766 - CITY
      ?auto_6764 - FLEVEL
      ?auto_6765 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_6762 ?auto_6763 ) ( AIRCRAFT-AT ?auto_6763 ?auto_6766 ) ( FUEL-LEVEL ?auto_6763 ?auto_6764 ) ( NEXT ?auto_6765 ?auto_6764 ) ( not ( = ?auto_6761 ?auto_6766 ) ) ( not ( = ?auto_6764 ?auto_6765 ) ) )
    :subtasks
    ( ( !FLY ?auto_6763 ?auto_6766 ?auto_6761 ?auto_6764 ?auto_6765 )
      ( FLY-1PPL ?auto_6762 ?auto_6761 )
      ( FLY-1PPL-VERIFY ?auto_6762 ?auto_6761 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_6783 - PERSON
      ?auto_6782 - CITY
    )
    :vars
    (
      ?auto_6784 - AIRCRAFT
      ?auto_6787 - CITY
      ?auto_6786 - FLEVEL
      ?auto_6785 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_6784 ?auto_6787 ) ( FUEL-LEVEL ?auto_6784 ?auto_6786 ) ( NEXT ?auto_6785 ?auto_6786 ) ( not ( = ?auto_6782 ?auto_6787 ) ) ( not ( = ?auto_6786 ?auto_6785 ) ) ( PERSON-AT ?auto_6783 ?auto_6787 ) )
    :subtasks
    ( ( !BOARD ?auto_6783 ?auto_6784 ?auto_6787 )
      ( FLY-1PPL ?auto_6783 ?auto_6782 )
      ( FLY-1PPL-VERIFY ?auto_6783 ?auto_6782 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_6804 - PERSON
      ?auto_6803 - CITY
    )
    :vars
    (
      ?auto_6808 - AIRCRAFT
      ?auto_6807 - CITY
      ?auto_6806 - FLEVEL
      ?auto_6805 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_6808 ?auto_6807 ) ( NEXT ?auto_6806 ?auto_6805 ) ( not ( = ?auto_6803 ?auto_6807 ) ) ( not ( = ?auto_6805 ?auto_6806 ) ) ( PERSON-AT ?auto_6804 ?auto_6807 ) ( FUEL-LEVEL ?auto_6808 ?auto_6806 ) )
    :subtasks
    ( ( !REFUEL ?auto_6808 ?auto_6807 ?auto_6806 ?auto_6805 )
      ( FLY-1PPL ?auto_6804 ?auto_6803 )
      ( FLY-1PPL-VERIFY ?auto_6804 ?auto_6803 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_6825 - PERSON
      ?auto_6824 - CITY
    )
    :vars
    (
      ?auto_6828 - FLEVEL
      ?auto_6826 - FLEVEL
      ?auto_6827 - CITY
      ?auto_6829 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6828 ?auto_6826 ) ( not ( = ?auto_6824 ?auto_6827 ) ) ( not ( = ?auto_6826 ?auto_6828 ) ) ( PERSON-AT ?auto_6825 ?auto_6827 ) ( AIRCRAFT-AT ?auto_6829 ?auto_6824 ) ( FUEL-LEVEL ?auto_6829 ?auto_6826 ) )
    :subtasks
    ( ( !FLY ?auto_6829 ?auto_6824 ?auto_6827 ?auto_6826 ?auto_6828 )
      ( FLY-1PPL ?auto_6825 ?auto_6824 )
      ( FLY-1PPL-VERIFY ?auto_6825 ?auto_6824 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_6846 - PERSON
      ?auto_6845 - CITY
    )
    :vars
    (
      ?auto_6848 - FLEVEL
      ?auto_6849 - FLEVEL
      ?auto_6847 - CITY
      ?auto_6850 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6848 ?auto_6849 ) ( not ( = ?auto_6845 ?auto_6847 ) ) ( not ( = ?auto_6849 ?auto_6848 ) ) ( PERSON-AT ?auto_6846 ?auto_6847 ) ( AIRCRAFT-AT ?auto_6850 ?auto_6845 ) ( FUEL-LEVEL ?auto_6850 ?auto_6848 ) )
    :subtasks
    ( ( !REFUEL ?auto_6850 ?auto_6845 ?auto_6848 ?auto_6849 )
      ( FLY-1PPL ?auto_6846 ?auto_6845 )
      ( FLY-1PPL-VERIFY ?auto_6846 ?auto_6845 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6909 - PERSON
      ?auto_6910 - PERSON
      ?auto_6908 - CITY
    )
    :vars
    (
      ?auto_6911 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_6910 ?auto_6911 ) ( AIRCRAFT-AT ?auto_6911 ?auto_6908 ) ( PERSON-AT ?auto_6909 ?auto_6908 ) ( not ( = ?auto_6909 ?auto_6910 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_6910 ?auto_6908 )
      ( FLY-2PPL-VERIFY ?auto_6909 ?auto_6910 ?auto_6908 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6913 - PERSON
      ?auto_6914 - PERSON
      ?auto_6912 - CITY
    )
    :vars
    (
      ?auto_6915 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_6913 ?auto_6915 ) ( AIRCRAFT-AT ?auto_6915 ?auto_6912 ) ( PERSON-AT ?auto_6914 ?auto_6912 ) ( not ( = ?auto_6913 ?auto_6914 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_6913 ?auto_6912 )
      ( FLY-2PPL-VERIFY ?auto_6913 ?auto_6914 ?auto_6912 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6921 - PERSON
      ?auto_6922 - PERSON
      ?auto_6923 - PERSON
      ?auto_6920 - CITY
    )
    :vars
    (
      ?auto_6924 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_6923 ?auto_6924 ) ( AIRCRAFT-AT ?auto_6924 ?auto_6920 ) ( PERSON-AT ?auto_6921 ?auto_6920 ) ( PERSON-AT ?auto_6922 ?auto_6920 ) ( not ( = ?auto_6921 ?auto_6922 ) ) ( not ( = ?auto_6921 ?auto_6923 ) ) ( not ( = ?auto_6922 ?auto_6923 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_6923 ?auto_6920 )
      ( FLY-3PPL-VERIFY ?auto_6921 ?auto_6922 ?auto_6923 ?auto_6920 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6926 - PERSON
      ?auto_6927 - PERSON
      ?auto_6928 - PERSON
      ?auto_6925 - CITY
    )
    :vars
    (
      ?auto_6929 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_6927 ?auto_6929 ) ( AIRCRAFT-AT ?auto_6929 ?auto_6925 ) ( PERSON-AT ?auto_6926 ?auto_6925 ) ( PERSON-AT ?auto_6928 ?auto_6925 ) ( not ( = ?auto_6926 ?auto_6927 ) ) ( not ( = ?auto_6926 ?auto_6928 ) ) ( not ( = ?auto_6927 ?auto_6928 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_6927 ?auto_6925 )
      ( FLY-3PPL-VERIFY ?auto_6926 ?auto_6927 ?auto_6928 ?auto_6925 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6936 - PERSON
      ?auto_6937 - PERSON
      ?auto_6938 - PERSON
      ?auto_6935 - CITY
    )
    :vars
    (
      ?auto_6939 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_6936 ?auto_6939 ) ( AIRCRAFT-AT ?auto_6939 ?auto_6935 ) ( PERSON-AT ?auto_6937 ?auto_6935 ) ( PERSON-AT ?auto_6938 ?auto_6935 ) ( not ( = ?auto_6936 ?auto_6937 ) ) ( not ( = ?auto_6936 ?auto_6938 ) ) ( not ( = ?auto_6937 ?auto_6938 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_6936 ?auto_6935 )
      ( FLY-3PPL-VERIFY ?auto_6936 ?auto_6937 ?auto_6938 ?auto_6935 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6962 - PERSON
      ?auto_6963 - PERSON
      ?auto_6961 - CITY
    )
    :vars
    (
      ?auto_6967 - AIRCRAFT
      ?auto_6964 - CITY
      ?auto_6965 - FLEVEL
      ?auto_6966 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_6963 ?auto_6967 ) ( AIRCRAFT-AT ?auto_6967 ?auto_6964 ) ( FUEL-LEVEL ?auto_6967 ?auto_6965 ) ( NEXT ?auto_6966 ?auto_6965 ) ( not ( = ?auto_6961 ?auto_6964 ) ) ( not ( = ?auto_6965 ?auto_6966 ) ) ( PERSON-AT ?auto_6962 ?auto_6961 ) ( not ( = ?auto_6962 ?auto_6963 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_6963 ?auto_6961 )
      ( FLY-2PPL-VERIFY ?auto_6962 ?auto_6963 ?auto_6961 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6969 - PERSON
      ?auto_6970 - PERSON
      ?auto_6968 - CITY
    )
    :vars
    (
      ?auto_6974 - AIRCRAFT
      ?auto_6972 - CITY
      ?auto_6971 - FLEVEL
      ?auto_6973 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_6969 ?auto_6974 ) ( AIRCRAFT-AT ?auto_6974 ?auto_6972 ) ( FUEL-LEVEL ?auto_6974 ?auto_6971 ) ( NEXT ?auto_6973 ?auto_6971 ) ( not ( = ?auto_6968 ?auto_6972 ) ) ( not ( = ?auto_6971 ?auto_6973 ) ) ( PERSON-AT ?auto_6970 ?auto_6968 ) ( not ( = ?auto_6970 ?auto_6969 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6970 ?auto_6969 ?auto_6968 )
      ( FLY-2PPL-VERIFY ?auto_6969 ?auto_6970 ?auto_6968 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6984 - PERSON
      ?auto_6985 - PERSON
      ?auto_6986 - PERSON
      ?auto_6983 - CITY
    )
    :vars
    (
      ?auto_6990 - AIRCRAFT
      ?auto_6988 - CITY
      ?auto_6987 - FLEVEL
      ?auto_6989 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_6986 ?auto_6990 ) ( AIRCRAFT-AT ?auto_6990 ?auto_6988 ) ( FUEL-LEVEL ?auto_6990 ?auto_6987 ) ( NEXT ?auto_6989 ?auto_6987 ) ( not ( = ?auto_6983 ?auto_6988 ) ) ( not ( = ?auto_6987 ?auto_6989 ) ) ( PERSON-AT ?auto_6984 ?auto_6983 ) ( not ( = ?auto_6984 ?auto_6986 ) ) ( PERSON-AT ?auto_6985 ?auto_6983 ) ( not ( = ?auto_6984 ?auto_6985 ) ) ( not ( = ?auto_6985 ?auto_6986 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6984 ?auto_6986 ?auto_6983 )
      ( FLY-3PPL-VERIFY ?auto_6984 ?auto_6985 ?auto_6986 ?auto_6983 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6992 - PERSON
      ?auto_6993 - PERSON
      ?auto_6994 - PERSON
      ?auto_6991 - CITY
    )
    :vars
    (
      ?auto_6998 - AIRCRAFT
      ?auto_6996 - CITY
      ?auto_6995 - FLEVEL
      ?auto_6997 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_6993 ?auto_6998 ) ( AIRCRAFT-AT ?auto_6998 ?auto_6996 ) ( FUEL-LEVEL ?auto_6998 ?auto_6995 ) ( NEXT ?auto_6997 ?auto_6995 ) ( not ( = ?auto_6991 ?auto_6996 ) ) ( not ( = ?auto_6995 ?auto_6997 ) ) ( PERSON-AT ?auto_6994 ?auto_6991 ) ( not ( = ?auto_6994 ?auto_6993 ) ) ( PERSON-AT ?auto_6992 ?auto_6991 ) ( not ( = ?auto_6992 ?auto_6993 ) ) ( not ( = ?auto_6992 ?auto_6994 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6994 ?auto_6993 ?auto_6991 )
      ( FLY-3PPL-VERIFY ?auto_6992 ?auto_6993 ?auto_6994 ?auto_6991 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7008 - PERSON
      ?auto_7009 - PERSON
      ?auto_7010 - PERSON
      ?auto_7007 - CITY
    )
    :vars
    (
      ?auto_7014 - AIRCRAFT
      ?auto_7012 - CITY
      ?auto_7011 - FLEVEL
      ?auto_7013 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_7008 ?auto_7014 ) ( AIRCRAFT-AT ?auto_7014 ?auto_7012 ) ( FUEL-LEVEL ?auto_7014 ?auto_7011 ) ( NEXT ?auto_7013 ?auto_7011 ) ( not ( = ?auto_7007 ?auto_7012 ) ) ( not ( = ?auto_7011 ?auto_7013 ) ) ( PERSON-AT ?auto_7010 ?auto_7007 ) ( not ( = ?auto_7010 ?auto_7008 ) ) ( PERSON-AT ?auto_7009 ?auto_7007 ) ( not ( = ?auto_7008 ?auto_7009 ) ) ( not ( = ?auto_7009 ?auto_7010 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7010 ?auto_7008 ?auto_7007 )
      ( FLY-3PPL-VERIFY ?auto_7008 ?auto_7009 ?auto_7010 ?auto_7007 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7041 - PERSON
      ?auto_7040 - CITY
    )
    :vars
    (
      ?auto_7045 - AIRCRAFT
      ?auto_7043 - CITY
      ?auto_7042 - FLEVEL
      ?auto_7044 - FLEVEL
      ?auto_7046 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7045 ?auto_7043 ) ( FUEL-LEVEL ?auto_7045 ?auto_7042 ) ( NEXT ?auto_7044 ?auto_7042 ) ( not ( = ?auto_7040 ?auto_7043 ) ) ( not ( = ?auto_7042 ?auto_7044 ) ) ( PERSON-AT ?auto_7046 ?auto_7040 ) ( not ( = ?auto_7046 ?auto_7041 ) ) ( PERSON-AT ?auto_7041 ?auto_7043 ) )
    :subtasks
    ( ( !BOARD ?auto_7041 ?auto_7045 ?auto_7043 )
      ( FLY-2PPL ?auto_7046 ?auto_7041 ?auto_7040 )
      ( FLY-1PPL-VERIFY ?auto_7041 ?auto_7040 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7048 - PERSON
      ?auto_7049 - PERSON
      ?auto_7047 - CITY
    )
    :vars
    (
      ?auto_7050 - AIRCRAFT
      ?auto_7051 - CITY
      ?auto_7052 - FLEVEL
      ?auto_7053 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7050 ?auto_7051 ) ( FUEL-LEVEL ?auto_7050 ?auto_7052 ) ( NEXT ?auto_7053 ?auto_7052 ) ( not ( = ?auto_7047 ?auto_7051 ) ) ( not ( = ?auto_7052 ?auto_7053 ) ) ( PERSON-AT ?auto_7048 ?auto_7047 ) ( not ( = ?auto_7048 ?auto_7049 ) ) ( PERSON-AT ?auto_7049 ?auto_7051 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7049 ?auto_7047 )
      ( FLY-2PPL-VERIFY ?auto_7048 ?auto_7049 ?auto_7047 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7055 - PERSON
      ?auto_7056 - PERSON
      ?auto_7054 - CITY
    )
    :vars
    (
      ?auto_7058 - AIRCRAFT
      ?auto_7057 - CITY
      ?auto_7059 - FLEVEL
      ?auto_7060 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7058 ?auto_7057 ) ( FUEL-LEVEL ?auto_7058 ?auto_7059 ) ( NEXT ?auto_7060 ?auto_7059 ) ( not ( = ?auto_7054 ?auto_7057 ) ) ( not ( = ?auto_7059 ?auto_7060 ) ) ( PERSON-AT ?auto_7056 ?auto_7054 ) ( not ( = ?auto_7056 ?auto_7055 ) ) ( PERSON-AT ?auto_7055 ?auto_7057 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7056 ?auto_7055 ?auto_7054 )
      ( FLY-2PPL-VERIFY ?auto_7055 ?auto_7056 ?auto_7054 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7070 - PERSON
      ?auto_7071 - PERSON
      ?auto_7072 - PERSON
      ?auto_7069 - CITY
    )
    :vars
    (
      ?auto_7074 - AIRCRAFT
      ?auto_7073 - CITY
      ?auto_7075 - FLEVEL
      ?auto_7076 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7074 ?auto_7073 ) ( FUEL-LEVEL ?auto_7074 ?auto_7075 ) ( NEXT ?auto_7076 ?auto_7075 ) ( not ( = ?auto_7069 ?auto_7073 ) ) ( not ( = ?auto_7075 ?auto_7076 ) ) ( PERSON-AT ?auto_7071 ?auto_7069 ) ( not ( = ?auto_7071 ?auto_7072 ) ) ( PERSON-AT ?auto_7072 ?auto_7073 ) ( PERSON-AT ?auto_7070 ?auto_7069 ) ( not ( = ?auto_7070 ?auto_7071 ) ) ( not ( = ?auto_7070 ?auto_7072 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7071 ?auto_7072 ?auto_7069 )
      ( FLY-3PPL-VERIFY ?auto_7070 ?auto_7071 ?auto_7072 ?auto_7069 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7078 - PERSON
      ?auto_7079 - PERSON
      ?auto_7080 - PERSON
      ?auto_7077 - CITY
    )
    :vars
    (
      ?auto_7082 - AIRCRAFT
      ?auto_7081 - CITY
      ?auto_7083 - FLEVEL
      ?auto_7084 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7082 ?auto_7081 ) ( FUEL-LEVEL ?auto_7082 ?auto_7083 ) ( NEXT ?auto_7084 ?auto_7083 ) ( not ( = ?auto_7077 ?auto_7081 ) ) ( not ( = ?auto_7083 ?auto_7084 ) ) ( PERSON-AT ?auto_7078 ?auto_7077 ) ( not ( = ?auto_7078 ?auto_7079 ) ) ( PERSON-AT ?auto_7079 ?auto_7081 ) ( PERSON-AT ?auto_7080 ?auto_7077 ) ( not ( = ?auto_7078 ?auto_7080 ) ) ( not ( = ?auto_7079 ?auto_7080 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7078 ?auto_7079 ?auto_7077 )
      ( FLY-3PPL-VERIFY ?auto_7078 ?auto_7079 ?auto_7080 ?auto_7077 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7094 - PERSON
      ?auto_7095 - PERSON
      ?auto_7096 - PERSON
      ?auto_7093 - CITY
    )
    :vars
    (
      ?auto_7098 - AIRCRAFT
      ?auto_7097 - CITY
      ?auto_7099 - FLEVEL
      ?auto_7100 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7098 ?auto_7097 ) ( FUEL-LEVEL ?auto_7098 ?auto_7099 ) ( NEXT ?auto_7100 ?auto_7099 ) ( not ( = ?auto_7093 ?auto_7097 ) ) ( not ( = ?auto_7099 ?auto_7100 ) ) ( PERSON-AT ?auto_7096 ?auto_7093 ) ( not ( = ?auto_7096 ?auto_7094 ) ) ( PERSON-AT ?auto_7094 ?auto_7097 ) ( PERSON-AT ?auto_7095 ?auto_7093 ) ( not ( = ?auto_7094 ?auto_7095 ) ) ( not ( = ?auto_7095 ?auto_7096 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7096 ?auto_7094 ?auto_7093 )
      ( FLY-3PPL-VERIFY ?auto_7094 ?auto_7095 ?auto_7096 ?auto_7093 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7127 - PERSON
      ?auto_7126 - CITY
    )
    :vars
    (
      ?auto_7130 - AIRCRAFT
      ?auto_7129 - CITY
      ?auto_7132 - FLEVEL
      ?auto_7131 - FLEVEL
      ?auto_7128 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7130 ?auto_7129 ) ( NEXT ?auto_7132 ?auto_7131 ) ( not ( = ?auto_7126 ?auto_7129 ) ) ( not ( = ?auto_7131 ?auto_7132 ) ) ( PERSON-AT ?auto_7128 ?auto_7126 ) ( not ( = ?auto_7128 ?auto_7127 ) ) ( PERSON-AT ?auto_7127 ?auto_7129 ) ( FUEL-LEVEL ?auto_7130 ?auto_7132 ) )
    :subtasks
    ( ( !REFUEL ?auto_7130 ?auto_7129 ?auto_7132 ?auto_7131 )
      ( FLY-2PPL ?auto_7128 ?auto_7127 ?auto_7126 )
      ( FLY-1PPL-VERIFY ?auto_7127 ?auto_7126 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7134 - PERSON
      ?auto_7135 - PERSON
      ?auto_7133 - CITY
    )
    :vars
    (
      ?auto_7136 - AIRCRAFT
      ?auto_7138 - CITY
      ?auto_7139 - FLEVEL
      ?auto_7137 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7136 ?auto_7138 ) ( NEXT ?auto_7139 ?auto_7137 ) ( not ( = ?auto_7133 ?auto_7138 ) ) ( not ( = ?auto_7137 ?auto_7139 ) ) ( PERSON-AT ?auto_7134 ?auto_7133 ) ( not ( = ?auto_7134 ?auto_7135 ) ) ( PERSON-AT ?auto_7135 ?auto_7138 ) ( FUEL-LEVEL ?auto_7136 ?auto_7139 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7135 ?auto_7133 )
      ( FLY-2PPL-VERIFY ?auto_7134 ?auto_7135 ?auto_7133 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7141 - PERSON
      ?auto_7142 - PERSON
      ?auto_7140 - CITY
    )
    :vars
    (
      ?auto_7144 - AIRCRAFT
      ?auto_7145 - CITY
      ?auto_7146 - FLEVEL
      ?auto_7143 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7144 ?auto_7145 ) ( NEXT ?auto_7146 ?auto_7143 ) ( not ( = ?auto_7140 ?auto_7145 ) ) ( not ( = ?auto_7143 ?auto_7146 ) ) ( PERSON-AT ?auto_7142 ?auto_7140 ) ( not ( = ?auto_7142 ?auto_7141 ) ) ( PERSON-AT ?auto_7141 ?auto_7145 ) ( FUEL-LEVEL ?auto_7144 ?auto_7146 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7142 ?auto_7141 ?auto_7140 )
      ( FLY-2PPL-VERIFY ?auto_7141 ?auto_7142 ?auto_7140 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7156 - PERSON
      ?auto_7157 - PERSON
      ?auto_7158 - PERSON
      ?auto_7155 - CITY
    )
    :vars
    (
      ?auto_7160 - AIRCRAFT
      ?auto_7161 - CITY
      ?auto_7162 - FLEVEL
      ?auto_7159 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7160 ?auto_7161 ) ( NEXT ?auto_7162 ?auto_7159 ) ( not ( = ?auto_7155 ?auto_7161 ) ) ( not ( = ?auto_7159 ?auto_7162 ) ) ( PERSON-AT ?auto_7157 ?auto_7155 ) ( not ( = ?auto_7157 ?auto_7158 ) ) ( PERSON-AT ?auto_7158 ?auto_7161 ) ( FUEL-LEVEL ?auto_7160 ?auto_7162 ) ( PERSON-AT ?auto_7156 ?auto_7155 ) ( not ( = ?auto_7156 ?auto_7157 ) ) ( not ( = ?auto_7156 ?auto_7158 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7157 ?auto_7158 ?auto_7155 )
      ( FLY-3PPL-VERIFY ?auto_7156 ?auto_7157 ?auto_7158 ?auto_7155 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7164 - PERSON
      ?auto_7165 - PERSON
      ?auto_7166 - PERSON
      ?auto_7163 - CITY
    )
    :vars
    (
      ?auto_7168 - AIRCRAFT
      ?auto_7169 - CITY
      ?auto_7170 - FLEVEL
      ?auto_7167 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7168 ?auto_7169 ) ( NEXT ?auto_7170 ?auto_7167 ) ( not ( = ?auto_7163 ?auto_7169 ) ) ( not ( = ?auto_7167 ?auto_7170 ) ) ( PERSON-AT ?auto_7164 ?auto_7163 ) ( not ( = ?auto_7164 ?auto_7165 ) ) ( PERSON-AT ?auto_7165 ?auto_7169 ) ( FUEL-LEVEL ?auto_7168 ?auto_7170 ) ( PERSON-AT ?auto_7166 ?auto_7163 ) ( not ( = ?auto_7164 ?auto_7166 ) ) ( not ( = ?auto_7165 ?auto_7166 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7164 ?auto_7165 ?auto_7163 )
      ( FLY-3PPL-VERIFY ?auto_7164 ?auto_7165 ?auto_7166 ?auto_7163 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7180 - PERSON
      ?auto_7181 - PERSON
      ?auto_7182 - PERSON
      ?auto_7179 - CITY
    )
    :vars
    (
      ?auto_7184 - AIRCRAFT
      ?auto_7185 - CITY
      ?auto_7186 - FLEVEL
      ?auto_7183 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_7184 ?auto_7185 ) ( NEXT ?auto_7186 ?auto_7183 ) ( not ( = ?auto_7179 ?auto_7185 ) ) ( not ( = ?auto_7183 ?auto_7186 ) ) ( PERSON-AT ?auto_7181 ?auto_7179 ) ( not ( = ?auto_7181 ?auto_7180 ) ) ( PERSON-AT ?auto_7180 ?auto_7185 ) ( FUEL-LEVEL ?auto_7184 ?auto_7186 ) ( PERSON-AT ?auto_7182 ?auto_7179 ) ( not ( = ?auto_7180 ?auto_7182 ) ) ( not ( = ?auto_7181 ?auto_7182 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7181 ?auto_7180 ?auto_7179 )
      ( FLY-3PPL-VERIFY ?auto_7180 ?auto_7181 ?auto_7182 ?auto_7179 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7213 - PERSON
      ?auto_7212 - CITY
    )
    :vars
    (
      ?auto_7218 - FLEVEL
      ?auto_7214 - FLEVEL
      ?auto_7217 - CITY
      ?auto_7215 - PERSON
      ?auto_7216 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7218 ?auto_7214 ) ( not ( = ?auto_7212 ?auto_7217 ) ) ( not ( = ?auto_7214 ?auto_7218 ) ) ( PERSON-AT ?auto_7215 ?auto_7212 ) ( not ( = ?auto_7215 ?auto_7213 ) ) ( PERSON-AT ?auto_7213 ?auto_7217 ) ( AIRCRAFT-AT ?auto_7216 ?auto_7212 ) ( FUEL-LEVEL ?auto_7216 ?auto_7214 ) )
    :subtasks
    ( ( !FLY ?auto_7216 ?auto_7212 ?auto_7217 ?auto_7214 ?auto_7218 )
      ( FLY-2PPL ?auto_7215 ?auto_7213 ?auto_7212 )
      ( FLY-1PPL-VERIFY ?auto_7213 ?auto_7212 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7220 - PERSON
      ?auto_7221 - PERSON
      ?auto_7219 - CITY
    )
    :vars
    (
      ?auto_7223 - FLEVEL
      ?auto_7224 - FLEVEL
      ?auto_7222 - CITY
      ?auto_7225 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7223 ?auto_7224 ) ( not ( = ?auto_7219 ?auto_7222 ) ) ( not ( = ?auto_7224 ?auto_7223 ) ) ( PERSON-AT ?auto_7220 ?auto_7219 ) ( not ( = ?auto_7220 ?auto_7221 ) ) ( PERSON-AT ?auto_7221 ?auto_7222 ) ( AIRCRAFT-AT ?auto_7225 ?auto_7219 ) ( FUEL-LEVEL ?auto_7225 ?auto_7224 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7221 ?auto_7219 )
      ( FLY-2PPL-VERIFY ?auto_7220 ?auto_7221 ?auto_7219 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7227 - PERSON
      ?auto_7228 - PERSON
      ?auto_7226 - CITY
    )
    :vars
    (
      ?auto_7229 - FLEVEL
      ?auto_7230 - FLEVEL
      ?auto_7232 - CITY
      ?auto_7231 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7229 ?auto_7230 ) ( not ( = ?auto_7226 ?auto_7232 ) ) ( not ( = ?auto_7230 ?auto_7229 ) ) ( PERSON-AT ?auto_7228 ?auto_7226 ) ( not ( = ?auto_7228 ?auto_7227 ) ) ( PERSON-AT ?auto_7227 ?auto_7232 ) ( AIRCRAFT-AT ?auto_7231 ?auto_7226 ) ( FUEL-LEVEL ?auto_7231 ?auto_7230 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7228 ?auto_7227 ?auto_7226 )
      ( FLY-2PPL-VERIFY ?auto_7227 ?auto_7228 ?auto_7226 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7242 - PERSON
      ?auto_7243 - PERSON
      ?auto_7244 - PERSON
      ?auto_7241 - CITY
    )
    :vars
    (
      ?auto_7245 - FLEVEL
      ?auto_7246 - FLEVEL
      ?auto_7248 - CITY
      ?auto_7247 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7245 ?auto_7246 ) ( not ( = ?auto_7241 ?auto_7248 ) ) ( not ( = ?auto_7246 ?auto_7245 ) ) ( PERSON-AT ?auto_7242 ?auto_7241 ) ( not ( = ?auto_7242 ?auto_7244 ) ) ( PERSON-AT ?auto_7244 ?auto_7248 ) ( AIRCRAFT-AT ?auto_7247 ?auto_7241 ) ( FUEL-LEVEL ?auto_7247 ?auto_7246 ) ( PERSON-AT ?auto_7243 ?auto_7241 ) ( not ( = ?auto_7242 ?auto_7243 ) ) ( not ( = ?auto_7243 ?auto_7244 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7242 ?auto_7244 ?auto_7241 )
      ( FLY-3PPL-VERIFY ?auto_7242 ?auto_7243 ?auto_7244 ?auto_7241 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7250 - PERSON
      ?auto_7251 - PERSON
      ?auto_7252 - PERSON
      ?auto_7249 - CITY
    )
    :vars
    (
      ?auto_7253 - FLEVEL
      ?auto_7254 - FLEVEL
      ?auto_7256 - CITY
      ?auto_7255 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7253 ?auto_7254 ) ( not ( = ?auto_7249 ?auto_7256 ) ) ( not ( = ?auto_7254 ?auto_7253 ) ) ( PERSON-AT ?auto_7250 ?auto_7249 ) ( not ( = ?auto_7250 ?auto_7251 ) ) ( PERSON-AT ?auto_7251 ?auto_7256 ) ( AIRCRAFT-AT ?auto_7255 ?auto_7249 ) ( FUEL-LEVEL ?auto_7255 ?auto_7254 ) ( PERSON-AT ?auto_7252 ?auto_7249 ) ( not ( = ?auto_7250 ?auto_7252 ) ) ( not ( = ?auto_7251 ?auto_7252 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7250 ?auto_7251 ?auto_7249 )
      ( FLY-3PPL-VERIFY ?auto_7250 ?auto_7251 ?auto_7252 ?auto_7249 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7266 - PERSON
      ?auto_7267 - PERSON
      ?auto_7268 - PERSON
      ?auto_7265 - CITY
    )
    :vars
    (
      ?auto_7269 - FLEVEL
      ?auto_7270 - FLEVEL
      ?auto_7272 - CITY
      ?auto_7271 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7269 ?auto_7270 ) ( not ( = ?auto_7265 ?auto_7272 ) ) ( not ( = ?auto_7270 ?auto_7269 ) ) ( PERSON-AT ?auto_7268 ?auto_7265 ) ( not ( = ?auto_7268 ?auto_7266 ) ) ( PERSON-AT ?auto_7266 ?auto_7272 ) ( AIRCRAFT-AT ?auto_7271 ?auto_7265 ) ( FUEL-LEVEL ?auto_7271 ?auto_7270 ) ( PERSON-AT ?auto_7267 ?auto_7265 ) ( not ( = ?auto_7266 ?auto_7267 ) ) ( not ( = ?auto_7267 ?auto_7268 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7268 ?auto_7266 ?auto_7265 )
      ( FLY-3PPL-VERIFY ?auto_7266 ?auto_7267 ?auto_7268 ?auto_7265 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7299 - PERSON
      ?auto_7298 - CITY
    )
    :vars
    (
      ?auto_7300 - FLEVEL
      ?auto_7301 - FLEVEL
      ?auto_7303 - CITY
      ?auto_7304 - PERSON
      ?auto_7302 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7300 ?auto_7301 ) ( not ( = ?auto_7298 ?auto_7303 ) ) ( not ( = ?auto_7301 ?auto_7300 ) ) ( PERSON-AT ?auto_7304 ?auto_7298 ) ( not ( = ?auto_7304 ?auto_7299 ) ) ( PERSON-AT ?auto_7299 ?auto_7303 ) ( AIRCRAFT-AT ?auto_7302 ?auto_7298 ) ( FUEL-LEVEL ?auto_7302 ?auto_7300 ) )
    :subtasks
    ( ( !REFUEL ?auto_7302 ?auto_7298 ?auto_7300 ?auto_7301 )
      ( FLY-2PPL ?auto_7304 ?auto_7299 ?auto_7298 )
      ( FLY-1PPL-VERIFY ?auto_7299 ?auto_7298 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7306 - PERSON
      ?auto_7307 - PERSON
      ?auto_7305 - CITY
    )
    :vars
    (
      ?auto_7310 - FLEVEL
      ?auto_7309 - FLEVEL
      ?auto_7311 - CITY
      ?auto_7308 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7310 ?auto_7309 ) ( not ( = ?auto_7305 ?auto_7311 ) ) ( not ( = ?auto_7309 ?auto_7310 ) ) ( PERSON-AT ?auto_7306 ?auto_7305 ) ( not ( = ?auto_7306 ?auto_7307 ) ) ( PERSON-AT ?auto_7307 ?auto_7311 ) ( AIRCRAFT-AT ?auto_7308 ?auto_7305 ) ( FUEL-LEVEL ?auto_7308 ?auto_7310 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7307 ?auto_7305 )
      ( FLY-2PPL-VERIFY ?auto_7306 ?auto_7307 ?auto_7305 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7313 - PERSON
      ?auto_7314 - PERSON
      ?auto_7312 - CITY
    )
    :vars
    (
      ?auto_7315 - FLEVEL
      ?auto_7318 - FLEVEL
      ?auto_7316 - CITY
      ?auto_7317 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7315 ?auto_7318 ) ( not ( = ?auto_7312 ?auto_7316 ) ) ( not ( = ?auto_7318 ?auto_7315 ) ) ( PERSON-AT ?auto_7314 ?auto_7312 ) ( not ( = ?auto_7314 ?auto_7313 ) ) ( PERSON-AT ?auto_7313 ?auto_7316 ) ( AIRCRAFT-AT ?auto_7317 ?auto_7312 ) ( FUEL-LEVEL ?auto_7317 ?auto_7315 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7314 ?auto_7313 ?auto_7312 )
      ( FLY-2PPL-VERIFY ?auto_7313 ?auto_7314 ?auto_7312 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7328 - PERSON
      ?auto_7329 - PERSON
      ?auto_7330 - PERSON
      ?auto_7327 - CITY
    )
    :vars
    (
      ?auto_7331 - FLEVEL
      ?auto_7334 - FLEVEL
      ?auto_7332 - CITY
      ?auto_7333 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7331 ?auto_7334 ) ( not ( = ?auto_7327 ?auto_7332 ) ) ( not ( = ?auto_7334 ?auto_7331 ) ) ( PERSON-AT ?auto_7329 ?auto_7327 ) ( not ( = ?auto_7329 ?auto_7330 ) ) ( PERSON-AT ?auto_7330 ?auto_7332 ) ( AIRCRAFT-AT ?auto_7333 ?auto_7327 ) ( FUEL-LEVEL ?auto_7333 ?auto_7331 ) ( PERSON-AT ?auto_7328 ?auto_7327 ) ( not ( = ?auto_7328 ?auto_7329 ) ) ( not ( = ?auto_7328 ?auto_7330 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7329 ?auto_7330 ?auto_7327 )
      ( FLY-3PPL-VERIFY ?auto_7328 ?auto_7329 ?auto_7330 ?auto_7327 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7336 - PERSON
      ?auto_7337 - PERSON
      ?auto_7338 - PERSON
      ?auto_7335 - CITY
    )
    :vars
    (
      ?auto_7339 - FLEVEL
      ?auto_7342 - FLEVEL
      ?auto_7340 - CITY
      ?auto_7341 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7339 ?auto_7342 ) ( not ( = ?auto_7335 ?auto_7340 ) ) ( not ( = ?auto_7342 ?auto_7339 ) ) ( PERSON-AT ?auto_7336 ?auto_7335 ) ( not ( = ?auto_7336 ?auto_7337 ) ) ( PERSON-AT ?auto_7337 ?auto_7340 ) ( AIRCRAFT-AT ?auto_7341 ?auto_7335 ) ( FUEL-LEVEL ?auto_7341 ?auto_7339 ) ( PERSON-AT ?auto_7338 ?auto_7335 ) ( not ( = ?auto_7336 ?auto_7338 ) ) ( not ( = ?auto_7337 ?auto_7338 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7336 ?auto_7337 ?auto_7335 )
      ( FLY-3PPL-VERIFY ?auto_7336 ?auto_7337 ?auto_7338 ?auto_7335 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7352 - PERSON
      ?auto_7353 - PERSON
      ?auto_7354 - PERSON
      ?auto_7351 - CITY
    )
    :vars
    (
      ?auto_7355 - FLEVEL
      ?auto_7358 - FLEVEL
      ?auto_7356 - CITY
      ?auto_7357 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7355 ?auto_7358 ) ( not ( = ?auto_7351 ?auto_7356 ) ) ( not ( = ?auto_7358 ?auto_7355 ) ) ( PERSON-AT ?auto_7354 ?auto_7351 ) ( not ( = ?auto_7354 ?auto_7352 ) ) ( PERSON-AT ?auto_7352 ?auto_7356 ) ( AIRCRAFT-AT ?auto_7357 ?auto_7351 ) ( FUEL-LEVEL ?auto_7357 ?auto_7355 ) ( PERSON-AT ?auto_7353 ?auto_7351 ) ( not ( = ?auto_7352 ?auto_7353 ) ) ( not ( = ?auto_7353 ?auto_7354 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7354 ?auto_7352 ?auto_7351 )
      ( FLY-3PPL-VERIFY ?auto_7352 ?auto_7353 ?auto_7354 ?auto_7351 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7385 - PERSON
      ?auto_7384 - CITY
    )
    :vars
    (
      ?auto_7386 - FLEVEL
      ?auto_7389 - FLEVEL
      ?auto_7387 - CITY
      ?auto_7390 - PERSON
      ?auto_7388 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7386 ?auto_7389 ) ( not ( = ?auto_7384 ?auto_7387 ) ) ( not ( = ?auto_7389 ?auto_7386 ) ) ( not ( = ?auto_7390 ?auto_7385 ) ) ( PERSON-AT ?auto_7385 ?auto_7387 ) ( AIRCRAFT-AT ?auto_7388 ?auto_7384 ) ( FUEL-LEVEL ?auto_7388 ?auto_7386 ) ( IN ?auto_7390 ?auto_7388 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7390 ?auto_7384 )
      ( FLY-2PPL ?auto_7390 ?auto_7385 ?auto_7384 )
      ( FLY-1PPL-VERIFY ?auto_7385 ?auto_7384 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7392 - PERSON
      ?auto_7393 - PERSON
      ?auto_7391 - CITY
    )
    :vars
    (
      ?auto_7395 - FLEVEL
      ?auto_7397 - FLEVEL
      ?auto_7394 - CITY
      ?auto_7396 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7395 ?auto_7397 ) ( not ( = ?auto_7391 ?auto_7394 ) ) ( not ( = ?auto_7397 ?auto_7395 ) ) ( not ( = ?auto_7392 ?auto_7393 ) ) ( PERSON-AT ?auto_7393 ?auto_7394 ) ( AIRCRAFT-AT ?auto_7396 ?auto_7391 ) ( FUEL-LEVEL ?auto_7396 ?auto_7395 ) ( IN ?auto_7392 ?auto_7396 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7393 ?auto_7391 )
      ( FLY-2PPL-VERIFY ?auto_7392 ?auto_7393 ?auto_7391 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7399 - PERSON
      ?auto_7400 - PERSON
      ?auto_7398 - CITY
    )
    :vars
    (
      ?auto_7403 - FLEVEL
      ?auto_7404 - FLEVEL
      ?auto_7401 - CITY
      ?auto_7402 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7403 ?auto_7404 ) ( not ( = ?auto_7398 ?auto_7401 ) ) ( not ( = ?auto_7404 ?auto_7403 ) ) ( not ( = ?auto_7400 ?auto_7399 ) ) ( PERSON-AT ?auto_7399 ?auto_7401 ) ( AIRCRAFT-AT ?auto_7402 ?auto_7398 ) ( FUEL-LEVEL ?auto_7402 ?auto_7403 ) ( IN ?auto_7400 ?auto_7402 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7400 ?auto_7399 ?auto_7398 )
      ( FLY-2PPL-VERIFY ?auto_7399 ?auto_7400 ?auto_7398 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7471 - PERSON
      ?auto_7470 - CITY
    )
    :vars
    (
      ?auto_7474 - FLEVEL
      ?auto_7475 - FLEVEL
      ?auto_7472 - CITY
      ?auto_7476 - PERSON
      ?auto_7473 - AIRCRAFT
      ?auto_7477 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_7474 ?auto_7475 ) ( not ( = ?auto_7470 ?auto_7472 ) ) ( not ( = ?auto_7475 ?auto_7474 ) ) ( not ( = ?auto_7476 ?auto_7471 ) ) ( PERSON-AT ?auto_7471 ?auto_7472 ) ( IN ?auto_7476 ?auto_7473 ) ( AIRCRAFT-AT ?auto_7473 ?auto_7477 ) ( FUEL-LEVEL ?auto_7473 ?auto_7475 ) ( not ( = ?auto_7470 ?auto_7477 ) ) ( not ( = ?auto_7472 ?auto_7477 ) ) )
    :subtasks
    ( ( !FLY ?auto_7473 ?auto_7477 ?auto_7470 ?auto_7475 ?auto_7474 )
      ( FLY-2PPL ?auto_7476 ?auto_7471 ?auto_7470 )
      ( FLY-1PPL-VERIFY ?auto_7471 ?auto_7470 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7479 - PERSON
      ?auto_7480 - PERSON
      ?auto_7478 - CITY
    )
    :vars
    (
      ?auto_7482 - FLEVEL
      ?auto_7481 - FLEVEL
      ?auto_7485 - CITY
      ?auto_7483 - AIRCRAFT
      ?auto_7484 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_7482 ?auto_7481 ) ( not ( = ?auto_7478 ?auto_7485 ) ) ( not ( = ?auto_7481 ?auto_7482 ) ) ( not ( = ?auto_7479 ?auto_7480 ) ) ( PERSON-AT ?auto_7480 ?auto_7485 ) ( IN ?auto_7479 ?auto_7483 ) ( AIRCRAFT-AT ?auto_7483 ?auto_7484 ) ( FUEL-LEVEL ?auto_7483 ?auto_7481 ) ( not ( = ?auto_7478 ?auto_7484 ) ) ( not ( = ?auto_7485 ?auto_7484 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7480 ?auto_7478 )
      ( FLY-2PPL-VERIFY ?auto_7479 ?auto_7480 ?auto_7478 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7487 - PERSON
      ?auto_7488 - PERSON
      ?auto_7486 - CITY
    )
    :vars
    (
      ?auto_7491 - FLEVEL
      ?auto_7493 - FLEVEL
      ?auto_7489 - CITY
      ?auto_7490 - AIRCRAFT
      ?auto_7492 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_7491 ?auto_7493 ) ( not ( = ?auto_7486 ?auto_7489 ) ) ( not ( = ?auto_7493 ?auto_7491 ) ) ( not ( = ?auto_7488 ?auto_7487 ) ) ( PERSON-AT ?auto_7487 ?auto_7489 ) ( IN ?auto_7488 ?auto_7490 ) ( AIRCRAFT-AT ?auto_7490 ?auto_7492 ) ( FUEL-LEVEL ?auto_7490 ?auto_7493 ) ( not ( = ?auto_7486 ?auto_7492 ) ) ( not ( = ?auto_7489 ?auto_7492 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7488 ?auto_7487 ?auto_7486 )
      ( FLY-2PPL-VERIFY ?auto_7487 ?auto_7488 ?auto_7486 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7568 - PERSON
      ?auto_7567 - CITY
    )
    :vars
    (
      ?auto_7572 - FLEVEL
      ?auto_7574 - FLEVEL
      ?auto_7569 - CITY
      ?auto_7570 - PERSON
      ?auto_7571 - AIRCRAFT
      ?auto_7573 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_7572 ?auto_7574 ) ( not ( = ?auto_7567 ?auto_7569 ) ) ( not ( = ?auto_7574 ?auto_7572 ) ) ( not ( = ?auto_7570 ?auto_7568 ) ) ( PERSON-AT ?auto_7568 ?auto_7569 ) ( AIRCRAFT-AT ?auto_7571 ?auto_7573 ) ( FUEL-LEVEL ?auto_7571 ?auto_7574 ) ( not ( = ?auto_7567 ?auto_7573 ) ) ( not ( = ?auto_7569 ?auto_7573 ) ) ( PERSON-AT ?auto_7570 ?auto_7573 ) )
    :subtasks
    ( ( !BOARD ?auto_7570 ?auto_7571 ?auto_7573 )
      ( FLY-2PPL ?auto_7570 ?auto_7568 ?auto_7567 )
      ( FLY-1PPL-VERIFY ?auto_7568 ?auto_7567 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7576 - PERSON
      ?auto_7577 - PERSON
      ?auto_7575 - CITY
    )
    :vars
    (
      ?auto_7579 - FLEVEL
      ?auto_7581 - FLEVEL
      ?auto_7580 - CITY
      ?auto_7578 - AIRCRAFT
      ?auto_7582 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_7579 ?auto_7581 ) ( not ( = ?auto_7575 ?auto_7580 ) ) ( not ( = ?auto_7581 ?auto_7579 ) ) ( not ( = ?auto_7576 ?auto_7577 ) ) ( PERSON-AT ?auto_7577 ?auto_7580 ) ( AIRCRAFT-AT ?auto_7578 ?auto_7582 ) ( FUEL-LEVEL ?auto_7578 ?auto_7581 ) ( not ( = ?auto_7575 ?auto_7582 ) ) ( not ( = ?auto_7580 ?auto_7582 ) ) ( PERSON-AT ?auto_7576 ?auto_7582 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7577 ?auto_7575 )
      ( FLY-2PPL-VERIFY ?auto_7576 ?auto_7577 ?auto_7575 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7584 - PERSON
      ?auto_7585 - PERSON
      ?auto_7583 - CITY
    )
    :vars
    (
      ?auto_7588 - FLEVEL
      ?auto_7587 - FLEVEL
      ?auto_7590 - CITY
      ?auto_7586 - AIRCRAFT
      ?auto_7589 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_7588 ?auto_7587 ) ( not ( = ?auto_7583 ?auto_7590 ) ) ( not ( = ?auto_7587 ?auto_7588 ) ) ( not ( = ?auto_7585 ?auto_7584 ) ) ( PERSON-AT ?auto_7584 ?auto_7590 ) ( AIRCRAFT-AT ?auto_7586 ?auto_7589 ) ( FUEL-LEVEL ?auto_7586 ?auto_7587 ) ( not ( = ?auto_7583 ?auto_7589 ) ) ( not ( = ?auto_7590 ?auto_7589 ) ) ( PERSON-AT ?auto_7585 ?auto_7589 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7585 ?auto_7584 ?auto_7583 )
      ( FLY-2PPL-VERIFY ?auto_7584 ?auto_7585 ?auto_7583 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7665 - PERSON
      ?auto_7664 - CITY
    )
    :vars
    (
      ?auto_7668 - FLEVEL
      ?auto_7667 - FLEVEL
      ?auto_7671 - CITY
      ?auto_7669 - PERSON
      ?auto_7666 - AIRCRAFT
      ?auto_7670 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_7668 ?auto_7667 ) ( not ( = ?auto_7664 ?auto_7671 ) ) ( not ( = ?auto_7667 ?auto_7668 ) ) ( not ( = ?auto_7669 ?auto_7665 ) ) ( PERSON-AT ?auto_7665 ?auto_7671 ) ( AIRCRAFT-AT ?auto_7666 ?auto_7670 ) ( not ( = ?auto_7664 ?auto_7670 ) ) ( not ( = ?auto_7671 ?auto_7670 ) ) ( PERSON-AT ?auto_7669 ?auto_7670 ) ( FUEL-LEVEL ?auto_7666 ?auto_7668 ) )
    :subtasks
    ( ( !REFUEL ?auto_7666 ?auto_7670 ?auto_7668 ?auto_7667 )
      ( FLY-2PPL ?auto_7669 ?auto_7665 ?auto_7664 )
      ( FLY-1PPL-VERIFY ?auto_7665 ?auto_7664 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7673 - PERSON
      ?auto_7674 - PERSON
      ?auto_7672 - CITY
    )
    :vars
    (
      ?auto_7679 - FLEVEL
      ?auto_7677 - FLEVEL
      ?auto_7676 - CITY
      ?auto_7678 - AIRCRAFT
      ?auto_7675 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_7679 ?auto_7677 ) ( not ( = ?auto_7672 ?auto_7676 ) ) ( not ( = ?auto_7677 ?auto_7679 ) ) ( not ( = ?auto_7673 ?auto_7674 ) ) ( PERSON-AT ?auto_7674 ?auto_7676 ) ( AIRCRAFT-AT ?auto_7678 ?auto_7675 ) ( not ( = ?auto_7672 ?auto_7675 ) ) ( not ( = ?auto_7676 ?auto_7675 ) ) ( PERSON-AT ?auto_7673 ?auto_7675 ) ( FUEL-LEVEL ?auto_7678 ?auto_7679 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7674 ?auto_7672 )
      ( FLY-2PPL-VERIFY ?auto_7673 ?auto_7674 ?auto_7672 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7681 - PERSON
      ?auto_7682 - PERSON
      ?auto_7680 - CITY
    )
    :vars
    (
      ?auto_7687 - FLEVEL
      ?auto_7684 - FLEVEL
      ?auto_7683 - CITY
      ?auto_7685 - AIRCRAFT
      ?auto_7686 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_7687 ?auto_7684 ) ( not ( = ?auto_7680 ?auto_7683 ) ) ( not ( = ?auto_7684 ?auto_7687 ) ) ( not ( = ?auto_7682 ?auto_7681 ) ) ( PERSON-AT ?auto_7681 ?auto_7683 ) ( AIRCRAFT-AT ?auto_7685 ?auto_7686 ) ( not ( = ?auto_7680 ?auto_7686 ) ) ( not ( = ?auto_7683 ?auto_7686 ) ) ( PERSON-AT ?auto_7682 ?auto_7686 ) ( FUEL-LEVEL ?auto_7685 ?auto_7687 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7682 ?auto_7681 ?auto_7680 )
      ( FLY-2PPL-VERIFY ?auto_7681 ?auto_7682 ?auto_7680 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8157 - PERSON
      ?auto_8158 - PERSON
      ?auto_8159 - PERSON
      ?auto_8156 - CITY
    )
    :vars
    (
      ?auto_8161 - AIRCRAFT
      ?auto_8160 - CITY
      ?auto_8162 - FLEVEL
      ?auto_8163 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_8159 ?auto_8161 ) ( AIRCRAFT-AT ?auto_8161 ?auto_8160 ) ( FUEL-LEVEL ?auto_8161 ?auto_8162 ) ( NEXT ?auto_8163 ?auto_8162 ) ( not ( = ?auto_8156 ?auto_8160 ) ) ( not ( = ?auto_8162 ?auto_8163 ) ) ( PERSON-AT ?auto_8158 ?auto_8156 ) ( not ( = ?auto_8158 ?auto_8159 ) ) ( PERSON-AT ?auto_8157 ?auto_8156 ) ( not ( = ?auto_8157 ?auto_8158 ) ) ( not ( = ?auto_8157 ?auto_8159 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8158 ?auto_8159 ?auto_8156 )
      ( FLY-3PPL-VERIFY ?auto_8157 ?auto_8158 ?auto_8159 ?auto_8156 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8169 - PERSON
      ?auto_8170 - PERSON
      ?auto_8171 - PERSON
      ?auto_8168 - CITY
    )
    :vars
    (
      ?auto_8173 - AIRCRAFT
      ?auto_8172 - CITY
      ?auto_8174 - FLEVEL
      ?auto_8175 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_8170 ?auto_8173 ) ( AIRCRAFT-AT ?auto_8173 ?auto_8172 ) ( FUEL-LEVEL ?auto_8173 ?auto_8174 ) ( NEXT ?auto_8175 ?auto_8174 ) ( not ( = ?auto_8168 ?auto_8172 ) ) ( not ( = ?auto_8174 ?auto_8175 ) ) ( PERSON-AT ?auto_8169 ?auto_8168 ) ( not ( = ?auto_8169 ?auto_8170 ) ) ( PERSON-AT ?auto_8171 ?auto_8168 ) ( not ( = ?auto_8169 ?auto_8171 ) ) ( not ( = ?auto_8170 ?auto_8171 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8169 ?auto_8170 ?auto_8168 )
      ( FLY-3PPL-VERIFY ?auto_8169 ?auto_8170 ?auto_8171 ?auto_8168 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8193 - PERSON
      ?auto_8194 - PERSON
      ?auto_8195 - PERSON
      ?auto_8192 - CITY
    )
    :vars
    (
      ?auto_8197 - AIRCRAFT
      ?auto_8196 - CITY
      ?auto_8198 - FLEVEL
      ?auto_8200 - FLEVEL
      ?auto_8199 - PERSON
    )
    :precondition
    ( and ( IN ?auto_8195 ?auto_8197 ) ( AIRCRAFT-AT ?auto_8197 ?auto_8196 ) ( FUEL-LEVEL ?auto_8197 ?auto_8198 ) ( NEXT ?auto_8200 ?auto_8198 ) ( not ( = ?auto_8192 ?auto_8196 ) ) ( not ( = ?auto_8198 ?auto_8200 ) ) ( PERSON-AT ?auto_8199 ?auto_8192 ) ( not ( = ?auto_8199 ?auto_8195 ) ) ( PERSON-AT ?auto_8193 ?auto_8192 ) ( PERSON-AT ?auto_8194 ?auto_8192 ) ( not ( = ?auto_8193 ?auto_8194 ) ) ( not ( = ?auto_8193 ?auto_8195 ) ) ( not ( = ?auto_8193 ?auto_8199 ) ) ( not ( = ?auto_8194 ?auto_8195 ) ) ( not ( = ?auto_8194 ?auto_8199 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8199 ?auto_8195 ?auto_8192 )
      ( FLY-3PPL-VERIFY ?auto_8193 ?auto_8194 ?auto_8195 ?auto_8192 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8206 - PERSON
      ?auto_8207 - PERSON
      ?auto_8208 - PERSON
      ?auto_8205 - CITY
    )
    :vars
    (
      ?auto_8210 - AIRCRAFT
      ?auto_8209 - CITY
      ?auto_8211 - FLEVEL
      ?auto_8213 - FLEVEL
      ?auto_8212 - PERSON
    )
    :precondition
    ( and ( IN ?auto_8207 ?auto_8210 ) ( AIRCRAFT-AT ?auto_8210 ?auto_8209 ) ( FUEL-LEVEL ?auto_8210 ?auto_8211 ) ( NEXT ?auto_8213 ?auto_8211 ) ( not ( = ?auto_8205 ?auto_8209 ) ) ( not ( = ?auto_8211 ?auto_8213 ) ) ( PERSON-AT ?auto_8212 ?auto_8205 ) ( not ( = ?auto_8212 ?auto_8207 ) ) ( PERSON-AT ?auto_8206 ?auto_8205 ) ( PERSON-AT ?auto_8208 ?auto_8205 ) ( not ( = ?auto_8206 ?auto_8207 ) ) ( not ( = ?auto_8206 ?auto_8208 ) ) ( not ( = ?auto_8206 ?auto_8212 ) ) ( not ( = ?auto_8207 ?auto_8208 ) ) ( not ( = ?auto_8208 ?auto_8212 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8212 ?auto_8207 ?auto_8205 )
      ( FLY-3PPL-VERIFY ?auto_8206 ?auto_8207 ?auto_8208 ?auto_8205 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8224 - PERSON
      ?auto_8225 - PERSON
      ?auto_8226 - PERSON
      ?auto_8223 - CITY
    )
    :vars
    (
      ?auto_8228 - AIRCRAFT
      ?auto_8227 - CITY
      ?auto_8229 - FLEVEL
      ?auto_8230 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_8224 ?auto_8228 ) ( AIRCRAFT-AT ?auto_8228 ?auto_8227 ) ( FUEL-LEVEL ?auto_8228 ?auto_8229 ) ( NEXT ?auto_8230 ?auto_8229 ) ( not ( = ?auto_8223 ?auto_8227 ) ) ( not ( = ?auto_8229 ?auto_8230 ) ) ( PERSON-AT ?auto_8225 ?auto_8223 ) ( not ( = ?auto_8225 ?auto_8224 ) ) ( PERSON-AT ?auto_8226 ?auto_8223 ) ( not ( = ?auto_8224 ?auto_8226 ) ) ( not ( = ?auto_8225 ?auto_8226 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8225 ?auto_8224 ?auto_8223 )
      ( FLY-3PPL-VERIFY ?auto_8224 ?auto_8225 ?auto_8226 ?auto_8223 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8248 - PERSON
      ?auto_8249 - PERSON
      ?auto_8250 - PERSON
      ?auto_8247 - CITY
    )
    :vars
    (
      ?auto_8252 - AIRCRAFT
      ?auto_8251 - CITY
      ?auto_8253 - FLEVEL
      ?auto_8255 - FLEVEL
      ?auto_8254 - PERSON
    )
    :precondition
    ( and ( IN ?auto_8248 ?auto_8252 ) ( AIRCRAFT-AT ?auto_8252 ?auto_8251 ) ( FUEL-LEVEL ?auto_8252 ?auto_8253 ) ( NEXT ?auto_8255 ?auto_8253 ) ( not ( = ?auto_8247 ?auto_8251 ) ) ( not ( = ?auto_8253 ?auto_8255 ) ) ( PERSON-AT ?auto_8254 ?auto_8247 ) ( not ( = ?auto_8254 ?auto_8248 ) ) ( PERSON-AT ?auto_8249 ?auto_8247 ) ( PERSON-AT ?auto_8250 ?auto_8247 ) ( not ( = ?auto_8248 ?auto_8249 ) ) ( not ( = ?auto_8248 ?auto_8250 ) ) ( not ( = ?auto_8249 ?auto_8250 ) ) ( not ( = ?auto_8249 ?auto_8254 ) ) ( not ( = ?auto_8250 ?auto_8254 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8254 ?auto_8248 ?auto_8247 )
      ( FLY-3PPL-VERIFY ?auto_8248 ?auto_8249 ?auto_8250 ?auto_8247 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8339 - PERSON
      ?auto_8340 - PERSON
      ?auto_8341 - PERSON
      ?auto_8338 - CITY
    )
    :vars
    (
      ?auto_8342 - AIRCRAFT
      ?auto_8344 - CITY
      ?auto_8343 - FLEVEL
      ?auto_8345 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_8342 ?auto_8344 ) ( FUEL-LEVEL ?auto_8342 ?auto_8343 ) ( NEXT ?auto_8345 ?auto_8343 ) ( not ( = ?auto_8338 ?auto_8344 ) ) ( not ( = ?auto_8343 ?auto_8345 ) ) ( PERSON-AT ?auto_8341 ?auto_8338 ) ( not ( = ?auto_8341 ?auto_8340 ) ) ( PERSON-AT ?auto_8340 ?auto_8344 ) ( PERSON-AT ?auto_8339 ?auto_8338 ) ( not ( = ?auto_8339 ?auto_8340 ) ) ( not ( = ?auto_8339 ?auto_8341 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8341 ?auto_8340 ?auto_8338 )
      ( FLY-3PPL-VERIFY ?auto_8339 ?auto_8340 ?auto_8341 ?auto_8338 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8363 - PERSON
      ?auto_8364 - PERSON
      ?auto_8365 - PERSON
      ?auto_8362 - CITY
    )
    :vars
    (
      ?auto_8367 - AIRCRAFT
      ?auto_8369 - CITY
      ?auto_8368 - FLEVEL
      ?auto_8370 - FLEVEL
      ?auto_8366 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_8367 ?auto_8369 ) ( FUEL-LEVEL ?auto_8367 ?auto_8368 ) ( NEXT ?auto_8370 ?auto_8368 ) ( not ( = ?auto_8362 ?auto_8369 ) ) ( not ( = ?auto_8368 ?auto_8370 ) ) ( PERSON-AT ?auto_8366 ?auto_8362 ) ( not ( = ?auto_8366 ?auto_8365 ) ) ( PERSON-AT ?auto_8365 ?auto_8369 ) ( PERSON-AT ?auto_8363 ?auto_8362 ) ( PERSON-AT ?auto_8364 ?auto_8362 ) ( not ( = ?auto_8363 ?auto_8364 ) ) ( not ( = ?auto_8363 ?auto_8365 ) ) ( not ( = ?auto_8363 ?auto_8366 ) ) ( not ( = ?auto_8364 ?auto_8365 ) ) ( not ( = ?auto_8364 ?auto_8366 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8366 ?auto_8365 ?auto_8362 )
      ( FLY-3PPL-VERIFY ?auto_8363 ?auto_8364 ?auto_8365 ?auto_8362 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8376 - PERSON
      ?auto_8377 - PERSON
      ?auto_8378 - PERSON
      ?auto_8375 - CITY
    )
    :vars
    (
      ?auto_8380 - AIRCRAFT
      ?auto_8382 - CITY
      ?auto_8381 - FLEVEL
      ?auto_8383 - FLEVEL
      ?auto_8379 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_8380 ?auto_8382 ) ( FUEL-LEVEL ?auto_8380 ?auto_8381 ) ( NEXT ?auto_8383 ?auto_8381 ) ( not ( = ?auto_8375 ?auto_8382 ) ) ( not ( = ?auto_8381 ?auto_8383 ) ) ( PERSON-AT ?auto_8379 ?auto_8375 ) ( not ( = ?auto_8379 ?auto_8377 ) ) ( PERSON-AT ?auto_8377 ?auto_8382 ) ( PERSON-AT ?auto_8376 ?auto_8375 ) ( PERSON-AT ?auto_8378 ?auto_8375 ) ( not ( = ?auto_8376 ?auto_8377 ) ) ( not ( = ?auto_8376 ?auto_8378 ) ) ( not ( = ?auto_8376 ?auto_8379 ) ) ( not ( = ?auto_8377 ?auto_8378 ) ) ( not ( = ?auto_8378 ?auto_8379 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8379 ?auto_8377 ?auto_8375 )
      ( FLY-3PPL-VERIFY ?auto_8376 ?auto_8377 ?auto_8378 ?auto_8375 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8418 - PERSON
      ?auto_8419 - PERSON
      ?auto_8420 - PERSON
      ?auto_8417 - CITY
    )
    :vars
    (
      ?auto_8422 - AIRCRAFT
      ?auto_8424 - CITY
      ?auto_8423 - FLEVEL
      ?auto_8425 - FLEVEL
      ?auto_8421 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_8422 ?auto_8424 ) ( FUEL-LEVEL ?auto_8422 ?auto_8423 ) ( NEXT ?auto_8425 ?auto_8423 ) ( not ( = ?auto_8417 ?auto_8424 ) ) ( not ( = ?auto_8423 ?auto_8425 ) ) ( PERSON-AT ?auto_8421 ?auto_8417 ) ( not ( = ?auto_8421 ?auto_8418 ) ) ( PERSON-AT ?auto_8418 ?auto_8424 ) ( PERSON-AT ?auto_8419 ?auto_8417 ) ( PERSON-AT ?auto_8420 ?auto_8417 ) ( not ( = ?auto_8418 ?auto_8419 ) ) ( not ( = ?auto_8418 ?auto_8420 ) ) ( not ( = ?auto_8419 ?auto_8420 ) ) ( not ( = ?auto_8419 ?auto_8421 ) ) ( not ( = ?auto_8420 ?auto_8421 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8421 ?auto_8418 ?auto_8417 )
      ( FLY-3PPL-VERIFY ?auto_8418 ?auto_8419 ?auto_8420 ?auto_8417 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8533 - PERSON
      ?auto_8534 - PERSON
      ?auto_8535 - PERSON
      ?auto_8532 - CITY
    )
    :vars
    (
      ?auto_8540 - AIRCRAFT
      ?auto_8538 - CITY
      ?auto_8536 - FLEVEL
      ?auto_8537 - FLEVEL
      ?auto_8539 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_8540 ?auto_8538 ) ( NEXT ?auto_8536 ?auto_8537 ) ( not ( = ?auto_8532 ?auto_8538 ) ) ( not ( = ?auto_8537 ?auto_8536 ) ) ( PERSON-AT ?auto_8539 ?auto_8532 ) ( not ( = ?auto_8539 ?auto_8535 ) ) ( PERSON-AT ?auto_8535 ?auto_8538 ) ( FUEL-LEVEL ?auto_8540 ?auto_8536 ) ( PERSON-AT ?auto_8533 ?auto_8532 ) ( PERSON-AT ?auto_8534 ?auto_8532 ) ( not ( = ?auto_8533 ?auto_8534 ) ) ( not ( = ?auto_8533 ?auto_8535 ) ) ( not ( = ?auto_8533 ?auto_8539 ) ) ( not ( = ?auto_8534 ?auto_8535 ) ) ( not ( = ?auto_8534 ?auto_8539 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8539 ?auto_8535 ?auto_8532 )
      ( FLY-3PPL-VERIFY ?auto_8533 ?auto_8534 ?auto_8535 ?auto_8532 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8546 - PERSON
      ?auto_8547 - PERSON
      ?auto_8548 - PERSON
      ?auto_8545 - CITY
    )
    :vars
    (
      ?auto_8553 - AIRCRAFT
      ?auto_8551 - CITY
      ?auto_8549 - FLEVEL
      ?auto_8550 - FLEVEL
      ?auto_8552 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_8553 ?auto_8551 ) ( NEXT ?auto_8549 ?auto_8550 ) ( not ( = ?auto_8545 ?auto_8551 ) ) ( not ( = ?auto_8550 ?auto_8549 ) ) ( PERSON-AT ?auto_8552 ?auto_8545 ) ( not ( = ?auto_8552 ?auto_8547 ) ) ( PERSON-AT ?auto_8547 ?auto_8551 ) ( FUEL-LEVEL ?auto_8553 ?auto_8549 ) ( PERSON-AT ?auto_8546 ?auto_8545 ) ( PERSON-AT ?auto_8548 ?auto_8545 ) ( not ( = ?auto_8546 ?auto_8547 ) ) ( not ( = ?auto_8546 ?auto_8548 ) ) ( not ( = ?auto_8546 ?auto_8552 ) ) ( not ( = ?auto_8547 ?auto_8548 ) ) ( not ( = ?auto_8548 ?auto_8552 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8552 ?auto_8547 ?auto_8545 )
      ( FLY-3PPL-VERIFY ?auto_8546 ?auto_8547 ?auto_8548 ?auto_8545 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8588 - PERSON
      ?auto_8589 - PERSON
      ?auto_8590 - PERSON
      ?auto_8587 - CITY
    )
    :vars
    (
      ?auto_8595 - AIRCRAFT
      ?auto_8593 - CITY
      ?auto_8591 - FLEVEL
      ?auto_8592 - FLEVEL
      ?auto_8594 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_8595 ?auto_8593 ) ( NEXT ?auto_8591 ?auto_8592 ) ( not ( = ?auto_8587 ?auto_8593 ) ) ( not ( = ?auto_8592 ?auto_8591 ) ) ( PERSON-AT ?auto_8594 ?auto_8587 ) ( not ( = ?auto_8594 ?auto_8588 ) ) ( PERSON-AT ?auto_8588 ?auto_8593 ) ( FUEL-LEVEL ?auto_8595 ?auto_8591 ) ( PERSON-AT ?auto_8589 ?auto_8587 ) ( PERSON-AT ?auto_8590 ?auto_8587 ) ( not ( = ?auto_8588 ?auto_8589 ) ) ( not ( = ?auto_8588 ?auto_8590 ) ) ( not ( = ?auto_8589 ?auto_8590 ) ) ( not ( = ?auto_8589 ?auto_8594 ) ) ( not ( = ?auto_8590 ?auto_8594 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8594 ?auto_8588 ?auto_8587 )
      ( FLY-3PPL-VERIFY ?auto_8588 ?auto_8589 ?auto_8590 ?auto_8587 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8667 - PERSON
      ?auto_8668 - PERSON
      ?auto_8669 - PERSON
      ?auto_8666 - CITY
    )
    :vars
    (
      ?auto_8671 - FLEVEL
      ?auto_8672 - FLEVEL
      ?auto_8673 - CITY
      ?auto_8670 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8671 ?auto_8672 ) ( not ( = ?auto_8666 ?auto_8673 ) ) ( not ( = ?auto_8672 ?auto_8671 ) ) ( PERSON-AT ?auto_8668 ?auto_8666 ) ( not ( = ?auto_8668 ?auto_8669 ) ) ( PERSON-AT ?auto_8669 ?auto_8673 ) ( AIRCRAFT-AT ?auto_8670 ?auto_8666 ) ( FUEL-LEVEL ?auto_8670 ?auto_8672 ) ( PERSON-AT ?auto_8667 ?auto_8666 ) ( not ( = ?auto_8667 ?auto_8668 ) ) ( not ( = ?auto_8667 ?auto_8669 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8668 ?auto_8669 ?auto_8666 )
      ( FLY-3PPL-VERIFY ?auto_8667 ?auto_8668 ?auto_8669 ?auto_8666 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8703 - PERSON
      ?auto_8704 - PERSON
      ?auto_8705 - PERSON
      ?auto_8702 - CITY
    )
    :vars
    (
      ?auto_8707 - FLEVEL
      ?auto_8708 - FLEVEL
      ?auto_8710 - CITY
      ?auto_8709 - PERSON
      ?auto_8706 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8707 ?auto_8708 ) ( not ( = ?auto_8702 ?auto_8710 ) ) ( not ( = ?auto_8708 ?auto_8707 ) ) ( PERSON-AT ?auto_8709 ?auto_8702 ) ( not ( = ?auto_8709 ?auto_8705 ) ) ( PERSON-AT ?auto_8705 ?auto_8710 ) ( AIRCRAFT-AT ?auto_8706 ?auto_8702 ) ( FUEL-LEVEL ?auto_8706 ?auto_8708 ) ( PERSON-AT ?auto_8703 ?auto_8702 ) ( PERSON-AT ?auto_8704 ?auto_8702 ) ( not ( = ?auto_8703 ?auto_8704 ) ) ( not ( = ?auto_8703 ?auto_8705 ) ) ( not ( = ?auto_8703 ?auto_8709 ) ) ( not ( = ?auto_8704 ?auto_8705 ) ) ( not ( = ?auto_8704 ?auto_8709 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8709 ?auto_8705 ?auto_8702 )
      ( FLY-3PPL-VERIFY ?auto_8703 ?auto_8704 ?auto_8705 ?auto_8702 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8716 - PERSON
      ?auto_8717 - PERSON
      ?auto_8718 - PERSON
      ?auto_8715 - CITY
    )
    :vars
    (
      ?auto_8720 - FLEVEL
      ?auto_8721 - FLEVEL
      ?auto_8723 - CITY
      ?auto_8722 - PERSON
      ?auto_8719 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8720 ?auto_8721 ) ( not ( = ?auto_8715 ?auto_8723 ) ) ( not ( = ?auto_8721 ?auto_8720 ) ) ( PERSON-AT ?auto_8722 ?auto_8715 ) ( not ( = ?auto_8722 ?auto_8717 ) ) ( PERSON-AT ?auto_8717 ?auto_8723 ) ( AIRCRAFT-AT ?auto_8719 ?auto_8715 ) ( FUEL-LEVEL ?auto_8719 ?auto_8721 ) ( PERSON-AT ?auto_8716 ?auto_8715 ) ( PERSON-AT ?auto_8718 ?auto_8715 ) ( not ( = ?auto_8716 ?auto_8717 ) ) ( not ( = ?auto_8716 ?auto_8718 ) ) ( not ( = ?auto_8716 ?auto_8722 ) ) ( not ( = ?auto_8717 ?auto_8718 ) ) ( not ( = ?auto_8718 ?auto_8722 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8722 ?auto_8717 ?auto_8715 )
      ( FLY-3PPL-VERIFY ?auto_8716 ?auto_8717 ?auto_8718 ?auto_8715 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8734 - PERSON
      ?auto_8735 - PERSON
      ?auto_8736 - PERSON
      ?auto_8733 - CITY
    )
    :vars
    (
      ?auto_8738 - FLEVEL
      ?auto_8739 - FLEVEL
      ?auto_8740 - CITY
      ?auto_8737 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8738 ?auto_8739 ) ( not ( = ?auto_8733 ?auto_8740 ) ) ( not ( = ?auto_8739 ?auto_8738 ) ) ( PERSON-AT ?auto_8735 ?auto_8733 ) ( not ( = ?auto_8735 ?auto_8734 ) ) ( PERSON-AT ?auto_8734 ?auto_8740 ) ( AIRCRAFT-AT ?auto_8737 ?auto_8733 ) ( FUEL-LEVEL ?auto_8737 ?auto_8739 ) ( PERSON-AT ?auto_8736 ?auto_8733 ) ( not ( = ?auto_8734 ?auto_8736 ) ) ( not ( = ?auto_8735 ?auto_8736 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8735 ?auto_8734 ?auto_8733 )
      ( FLY-3PPL-VERIFY ?auto_8734 ?auto_8735 ?auto_8736 ?auto_8733 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8758 - PERSON
      ?auto_8759 - PERSON
      ?auto_8760 - PERSON
      ?auto_8757 - CITY
    )
    :vars
    (
      ?auto_8762 - FLEVEL
      ?auto_8763 - FLEVEL
      ?auto_8765 - CITY
      ?auto_8764 - PERSON
      ?auto_8761 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8762 ?auto_8763 ) ( not ( = ?auto_8757 ?auto_8765 ) ) ( not ( = ?auto_8763 ?auto_8762 ) ) ( PERSON-AT ?auto_8764 ?auto_8757 ) ( not ( = ?auto_8764 ?auto_8758 ) ) ( PERSON-AT ?auto_8758 ?auto_8765 ) ( AIRCRAFT-AT ?auto_8761 ?auto_8757 ) ( FUEL-LEVEL ?auto_8761 ?auto_8763 ) ( PERSON-AT ?auto_8759 ?auto_8757 ) ( PERSON-AT ?auto_8760 ?auto_8757 ) ( not ( = ?auto_8758 ?auto_8759 ) ) ( not ( = ?auto_8758 ?auto_8760 ) ) ( not ( = ?auto_8759 ?auto_8760 ) ) ( not ( = ?auto_8759 ?auto_8764 ) ) ( not ( = ?auto_8760 ?auto_8764 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8764 ?auto_8758 ?auto_8757 )
      ( FLY-3PPL-VERIFY ?auto_8758 ?auto_8759 ?auto_8760 ?auto_8757 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8837 - PERSON
      ?auto_8838 - PERSON
      ?auto_8839 - PERSON
      ?auto_8836 - CITY
    )
    :vars
    (
      ?auto_8841 - FLEVEL
      ?auto_8842 - FLEVEL
      ?auto_8843 - CITY
      ?auto_8840 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8841 ?auto_8842 ) ( not ( = ?auto_8836 ?auto_8843 ) ) ( not ( = ?auto_8842 ?auto_8841 ) ) ( PERSON-AT ?auto_8837 ?auto_8836 ) ( not ( = ?auto_8837 ?auto_8839 ) ) ( PERSON-AT ?auto_8839 ?auto_8843 ) ( AIRCRAFT-AT ?auto_8840 ?auto_8836 ) ( FUEL-LEVEL ?auto_8840 ?auto_8841 ) ( PERSON-AT ?auto_8838 ?auto_8836 ) ( not ( = ?auto_8837 ?auto_8838 ) ) ( not ( = ?auto_8838 ?auto_8839 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8837 ?auto_8839 ?auto_8836 )
      ( FLY-3PPL-VERIFY ?auto_8837 ?auto_8838 ?auto_8839 ?auto_8836 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8873 - PERSON
      ?auto_8874 - PERSON
      ?auto_8875 - PERSON
      ?auto_8872 - CITY
    )
    :vars
    (
      ?auto_8878 - FLEVEL
      ?auto_8879 - FLEVEL
      ?auto_8880 - CITY
      ?auto_8877 - PERSON
      ?auto_8876 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8878 ?auto_8879 ) ( not ( = ?auto_8872 ?auto_8880 ) ) ( not ( = ?auto_8879 ?auto_8878 ) ) ( PERSON-AT ?auto_8877 ?auto_8872 ) ( not ( = ?auto_8877 ?auto_8875 ) ) ( PERSON-AT ?auto_8875 ?auto_8880 ) ( AIRCRAFT-AT ?auto_8876 ?auto_8872 ) ( FUEL-LEVEL ?auto_8876 ?auto_8878 ) ( PERSON-AT ?auto_8873 ?auto_8872 ) ( PERSON-AT ?auto_8874 ?auto_8872 ) ( not ( = ?auto_8873 ?auto_8874 ) ) ( not ( = ?auto_8873 ?auto_8875 ) ) ( not ( = ?auto_8873 ?auto_8877 ) ) ( not ( = ?auto_8874 ?auto_8875 ) ) ( not ( = ?auto_8874 ?auto_8877 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8877 ?auto_8875 ?auto_8872 )
      ( FLY-3PPL-VERIFY ?auto_8873 ?auto_8874 ?auto_8875 ?auto_8872 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8886 - PERSON
      ?auto_8887 - PERSON
      ?auto_8888 - PERSON
      ?auto_8885 - CITY
    )
    :vars
    (
      ?auto_8891 - FLEVEL
      ?auto_8892 - FLEVEL
      ?auto_8893 - CITY
      ?auto_8890 - PERSON
      ?auto_8889 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8891 ?auto_8892 ) ( not ( = ?auto_8885 ?auto_8893 ) ) ( not ( = ?auto_8892 ?auto_8891 ) ) ( PERSON-AT ?auto_8890 ?auto_8885 ) ( not ( = ?auto_8890 ?auto_8887 ) ) ( PERSON-AT ?auto_8887 ?auto_8893 ) ( AIRCRAFT-AT ?auto_8889 ?auto_8885 ) ( FUEL-LEVEL ?auto_8889 ?auto_8891 ) ( PERSON-AT ?auto_8886 ?auto_8885 ) ( PERSON-AT ?auto_8888 ?auto_8885 ) ( not ( = ?auto_8886 ?auto_8887 ) ) ( not ( = ?auto_8886 ?auto_8888 ) ) ( not ( = ?auto_8886 ?auto_8890 ) ) ( not ( = ?auto_8887 ?auto_8888 ) ) ( not ( = ?auto_8888 ?auto_8890 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8890 ?auto_8887 ?auto_8885 )
      ( FLY-3PPL-VERIFY ?auto_8886 ?auto_8887 ?auto_8888 ?auto_8885 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_8928 - PERSON
      ?auto_8929 - PERSON
      ?auto_8930 - PERSON
      ?auto_8927 - CITY
    )
    :vars
    (
      ?auto_8933 - FLEVEL
      ?auto_8934 - FLEVEL
      ?auto_8935 - CITY
      ?auto_8932 - PERSON
      ?auto_8931 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_8933 ?auto_8934 ) ( not ( = ?auto_8927 ?auto_8935 ) ) ( not ( = ?auto_8934 ?auto_8933 ) ) ( PERSON-AT ?auto_8932 ?auto_8927 ) ( not ( = ?auto_8932 ?auto_8928 ) ) ( PERSON-AT ?auto_8928 ?auto_8935 ) ( AIRCRAFT-AT ?auto_8931 ?auto_8927 ) ( FUEL-LEVEL ?auto_8931 ?auto_8933 ) ( PERSON-AT ?auto_8929 ?auto_8927 ) ( PERSON-AT ?auto_8930 ?auto_8927 ) ( not ( = ?auto_8928 ?auto_8929 ) ) ( not ( = ?auto_8928 ?auto_8930 ) ) ( not ( = ?auto_8929 ?auto_8930 ) ) ( not ( = ?auto_8929 ?auto_8932 ) ) ( not ( = ?auto_8930 ?auto_8932 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_8932 ?auto_8928 ?auto_8927 )
      ( FLY-3PPL-VERIFY ?auto_8928 ?auto_8929 ?auto_8930 ?auto_8927 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9195 - PERSON
      ?auto_9196 - PERSON
      ?auto_9197 - PERSON
      ?auto_9194 - CITY
    )
    :vars
    (
      ?auto_9198 - AIRCRAFT
      ?auto_9200 - CITY
      ?auto_9201 - FLEVEL
      ?auto_9199 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9198 ?auto_9200 ) ( FUEL-LEVEL ?auto_9198 ?auto_9201 ) ( NEXT ?auto_9199 ?auto_9201 ) ( not ( = ?auto_9194 ?auto_9200 ) ) ( not ( = ?auto_9201 ?auto_9199 ) ) ( PERSON-AT ?auto_9195 ?auto_9194 ) ( not ( = ?auto_9195 ?auto_9197 ) ) ( PERSON-AT ?auto_9197 ?auto_9200 ) ( PERSON-AT ?auto_9196 ?auto_9194 ) ( not ( = ?auto_9195 ?auto_9196 ) ) ( not ( = ?auto_9196 ?auto_9197 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9195 ?auto_9197 ?auto_9194 )
      ( FLY-3PPL-VERIFY ?auto_9195 ?auto_9196 ?auto_9197 ?auto_9194 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9577 - PERSON
      ?auto_9578 - PERSON
      ?auto_9579 - PERSON
      ?auto_9576 - CITY
    )
    :vars
    (
      ?auto_9580 - AIRCRAFT
      ?auto_9582 - CITY
      ?auto_9583 - FLEVEL
      ?auto_9581 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9580 ?auto_9582 ) ( NEXT ?auto_9583 ?auto_9581 ) ( not ( = ?auto_9576 ?auto_9582 ) ) ( not ( = ?auto_9581 ?auto_9583 ) ) ( PERSON-AT ?auto_9577 ?auto_9576 ) ( not ( = ?auto_9577 ?auto_9579 ) ) ( PERSON-AT ?auto_9579 ?auto_9582 ) ( FUEL-LEVEL ?auto_9580 ?auto_9583 ) ( PERSON-AT ?auto_9578 ?auto_9576 ) ( not ( = ?auto_9577 ?auto_9578 ) ) ( not ( = ?auto_9578 ?auto_9579 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9577 ?auto_9579 ?auto_9576 )
      ( FLY-3PPL-VERIFY ?auto_9577 ?auto_9578 ?auto_9579 ?auto_9576 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9660 - PERSON
      ?auto_9661 - PERSON
      ?auto_9662 - PERSON
      ?auto_9659 - CITY
    )
    :vars
    (
      ?auto_9663 - AIRCRAFT
      ?auto_9665 - CITY
      ?auto_9666 - FLEVEL
      ?auto_9664 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_9663 ?auto_9665 ) ( NEXT ?auto_9666 ?auto_9664 ) ( not ( = ?auto_9659 ?auto_9665 ) ) ( not ( = ?auto_9664 ?auto_9666 ) ) ( PERSON-AT ?auto_9662 ?auto_9659 ) ( not ( = ?auto_9662 ?auto_9660 ) ) ( PERSON-AT ?auto_9660 ?auto_9665 ) ( FUEL-LEVEL ?auto_9663 ?auto_9666 ) ( PERSON-AT ?auto_9661 ?auto_9659 ) ( not ( = ?auto_9660 ?auto_9661 ) ) ( not ( = ?auto_9661 ?auto_9662 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9662 ?auto_9660 ?auto_9659 )
      ( FLY-3PPL-VERIFY ?auto_9660 ?auto_9661 ?auto_9662 ?auto_9659 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_9784 - PERSON
      ?auto_9785 - PERSON
      ?auto_9786 - PERSON
      ?auto_9783 - CITY
    )
    :vars
    (
      ?auto_9790 - FLEVEL
      ?auto_9787 - FLEVEL
      ?auto_9788 - CITY
      ?auto_9789 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_9790 ?auto_9787 ) ( not ( = ?auto_9783 ?auto_9788 ) ) ( not ( = ?auto_9787 ?auto_9790 ) ) ( PERSON-AT ?auto_9786 ?auto_9783 ) ( not ( = ?auto_9786 ?auto_9785 ) ) ( PERSON-AT ?auto_9785 ?auto_9788 ) ( AIRCRAFT-AT ?auto_9789 ?auto_9783 ) ( FUEL-LEVEL ?auto_9789 ?auto_9787 ) ( PERSON-AT ?auto_9784 ?auto_9783 ) ( not ( = ?auto_9784 ?auto_9785 ) ) ( not ( = ?auto_9784 ?auto_9786 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_9786 ?auto_9785 ?auto_9783 )
      ( FLY-3PPL-VERIFY ?auto_9784 ?auto_9785 ?auto_9786 ?auto_9783 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_10042 - PERSON
      ?auto_10043 - PERSON
      ?auto_10044 - PERSON
      ?auto_10041 - CITY
    )
    :vars
    (
      ?auto_10045 - FLEVEL
      ?auto_10046 - FLEVEL
      ?auto_10047 - CITY
      ?auto_10048 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_10045 ?auto_10046 ) ( not ( = ?auto_10041 ?auto_10047 ) ) ( not ( = ?auto_10046 ?auto_10045 ) ) ( PERSON-AT ?auto_10043 ?auto_10041 ) ( not ( = ?auto_10043 ?auto_10042 ) ) ( PERSON-AT ?auto_10042 ?auto_10047 ) ( AIRCRAFT-AT ?auto_10048 ?auto_10041 ) ( FUEL-LEVEL ?auto_10048 ?auto_10045 ) ( PERSON-AT ?auto_10044 ?auto_10041 ) ( not ( = ?auto_10042 ?auto_10044 ) ) ( not ( = ?auto_10043 ?auto_10044 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_10043 ?auto_10042 ?auto_10041 )
      ( FLY-3PPL-VERIFY ?auto_10042 ?auto_10043 ?auto_10044 ?auto_10041 ) )
  )

)

