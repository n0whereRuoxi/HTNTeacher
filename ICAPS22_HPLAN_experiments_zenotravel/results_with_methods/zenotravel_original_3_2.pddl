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
      ?auto_12750 - PERSON
      ?auto_12749 - CITY
    )
    :vars
    (
      ?auto_12751 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_12750 ?auto_12751 ) ( AIRCRAFT-AT ?auto_12751 ?auto_12749 ) )
    :subtasks
    ( ( !DEBARK ?auto_12750 ?auto_12751 ?auto_12749 )
      ( FLY-1PPL-VERIFY ?auto_12750 ?auto_12749 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_12762 - PERSON
      ?auto_12761 - CITY
    )
    :vars
    (
      ?auto_12763 - AIRCRAFT
      ?auto_12766 - CITY
      ?auto_12764 - FLEVEL
      ?auto_12765 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_12762 ?auto_12763 ) ( AIRCRAFT-AT ?auto_12763 ?auto_12766 ) ( FUEL-LEVEL ?auto_12763 ?auto_12764 ) ( NEXT ?auto_12765 ?auto_12764 ) ( not ( = ?auto_12761 ?auto_12766 ) ) ( not ( = ?auto_12764 ?auto_12765 ) ) )
    :subtasks
    ( ( !FLY ?auto_12763 ?auto_12766 ?auto_12761 ?auto_12764 ?auto_12765 )
      ( FLY-1PPL ?auto_12762 ?auto_12761 )
      ( FLY-1PPL-VERIFY ?auto_12762 ?auto_12761 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_12783 - PERSON
      ?auto_12782 - CITY
    )
    :vars
    (
      ?auto_12786 - AIRCRAFT
      ?auto_12787 - CITY
      ?auto_12784 - FLEVEL
      ?auto_12785 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_12786 ?auto_12787 ) ( FUEL-LEVEL ?auto_12786 ?auto_12784 ) ( NEXT ?auto_12785 ?auto_12784 ) ( not ( = ?auto_12782 ?auto_12787 ) ) ( not ( = ?auto_12784 ?auto_12785 ) ) ( PERSON-AT ?auto_12783 ?auto_12787 ) )
    :subtasks
    ( ( !BOARD ?auto_12783 ?auto_12786 ?auto_12787 )
      ( FLY-1PPL ?auto_12783 ?auto_12782 )
      ( FLY-1PPL-VERIFY ?auto_12783 ?auto_12782 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_12804 - PERSON
      ?auto_12803 - CITY
    )
    :vars
    (
      ?auto_12808 - AIRCRAFT
      ?auto_12807 - CITY
      ?auto_12805 - FLEVEL
      ?auto_12806 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_12808 ?auto_12807 ) ( NEXT ?auto_12805 ?auto_12806 ) ( not ( = ?auto_12803 ?auto_12807 ) ) ( not ( = ?auto_12806 ?auto_12805 ) ) ( PERSON-AT ?auto_12804 ?auto_12807 ) ( FUEL-LEVEL ?auto_12808 ?auto_12805 ) )
    :subtasks
    ( ( !REFUEL ?auto_12808 ?auto_12807 ?auto_12805 ?auto_12806 )
      ( FLY-1PPL ?auto_12804 ?auto_12803 )
      ( FLY-1PPL-VERIFY ?auto_12804 ?auto_12803 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_12825 - PERSON
      ?auto_12824 - CITY
    )
    :vars
    (
      ?auto_12826 - FLEVEL
      ?auto_12829 - FLEVEL
      ?auto_12827 - CITY
      ?auto_12828 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12826 ?auto_12829 ) ( not ( = ?auto_12824 ?auto_12827 ) ) ( not ( = ?auto_12829 ?auto_12826 ) ) ( PERSON-AT ?auto_12825 ?auto_12827 ) ( AIRCRAFT-AT ?auto_12828 ?auto_12824 ) ( FUEL-LEVEL ?auto_12828 ?auto_12829 ) )
    :subtasks
    ( ( !FLY ?auto_12828 ?auto_12824 ?auto_12827 ?auto_12829 ?auto_12826 )
      ( FLY-1PPL ?auto_12825 ?auto_12824 )
      ( FLY-1PPL-VERIFY ?auto_12825 ?auto_12824 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_12846 - PERSON
      ?auto_12845 - CITY
    )
    :vars
    (
      ?auto_12848 - FLEVEL
      ?auto_12850 - FLEVEL
      ?auto_12849 - CITY
      ?auto_12847 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_12848 ?auto_12850 ) ( not ( = ?auto_12845 ?auto_12849 ) ) ( not ( = ?auto_12850 ?auto_12848 ) ) ( PERSON-AT ?auto_12846 ?auto_12849 ) ( AIRCRAFT-AT ?auto_12847 ?auto_12845 ) ( FUEL-LEVEL ?auto_12847 ?auto_12848 ) )
    :subtasks
    ( ( !REFUEL ?auto_12847 ?auto_12845 ?auto_12848 ?auto_12850 )
      ( FLY-1PPL ?auto_12846 ?auto_12845 )
      ( FLY-1PPL-VERIFY ?auto_12846 ?auto_12845 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_12906 - PERSON
      ?auto_12905 - CITY
    )
    :vars
    (
      ?auto_12907 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_12906 ?auto_12907 ) ( AIRCRAFT-AT ?auto_12907 ?auto_12905 ) )
    :subtasks
    ( ( !DEBARK ?auto_12906 ?auto_12907 ?auto_12905 )
      ( FLY-1PPL-VERIFY ?auto_12906 ?auto_12905 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12909 - PERSON
      ?auto_12910 - PERSON
      ?auto_12908 - CITY
    )
    :vars
    (
      ?auto_12911 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_12910 ?auto_12911 ) ( AIRCRAFT-AT ?auto_12911 ?auto_12908 ) ( PERSON-AT ?auto_12909 ?auto_12908 ) ( not ( = ?auto_12909 ?auto_12910 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_12910 ?auto_12908 )
      ( FLY-2PPL-VERIFY ?auto_12909 ?auto_12910 ?auto_12908 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12913 - PERSON
      ?auto_12914 - PERSON
      ?auto_12912 - CITY
    )
    :vars
    (
      ?auto_12915 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_12913 ?auto_12915 ) ( AIRCRAFT-AT ?auto_12915 ?auto_12912 ) ( PERSON-AT ?auto_12914 ?auto_12912 ) ( not ( = ?auto_12913 ?auto_12914 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_12913 ?auto_12912 )
      ( FLY-2PPL-VERIFY ?auto_12913 ?auto_12914 ?auto_12912 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12921 - PERSON
      ?auto_12922 - PERSON
      ?auto_12923 - PERSON
      ?auto_12920 - CITY
    )
    :vars
    (
      ?auto_12924 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_12923 ?auto_12924 ) ( AIRCRAFT-AT ?auto_12924 ?auto_12920 ) ( PERSON-AT ?auto_12921 ?auto_12920 ) ( PERSON-AT ?auto_12922 ?auto_12920 ) ( not ( = ?auto_12921 ?auto_12922 ) ) ( not ( = ?auto_12921 ?auto_12923 ) ) ( not ( = ?auto_12922 ?auto_12923 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_12923 ?auto_12920 )
      ( FLY-3PPL-VERIFY ?auto_12921 ?auto_12922 ?auto_12923 ?auto_12920 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12926 - PERSON
      ?auto_12927 - PERSON
      ?auto_12928 - PERSON
      ?auto_12925 - CITY
    )
    :vars
    (
      ?auto_12929 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_12927 ?auto_12929 ) ( AIRCRAFT-AT ?auto_12929 ?auto_12925 ) ( PERSON-AT ?auto_12926 ?auto_12925 ) ( PERSON-AT ?auto_12928 ?auto_12925 ) ( not ( = ?auto_12926 ?auto_12927 ) ) ( not ( = ?auto_12926 ?auto_12928 ) ) ( not ( = ?auto_12927 ?auto_12928 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_12927 ?auto_12925 )
      ( FLY-3PPL-VERIFY ?auto_12926 ?auto_12927 ?auto_12928 ?auto_12925 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12936 - PERSON
      ?auto_12937 - PERSON
      ?auto_12938 - PERSON
      ?auto_12935 - CITY
    )
    :vars
    (
      ?auto_12939 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_12936 ?auto_12939 ) ( AIRCRAFT-AT ?auto_12939 ?auto_12935 ) ( PERSON-AT ?auto_12937 ?auto_12935 ) ( PERSON-AT ?auto_12938 ?auto_12935 ) ( not ( = ?auto_12936 ?auto_12937 ) ) ( not ( = ?auto_12936 ?auto_12938 ) ) ( not ( = ?auto_12937 ?auto_12938 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_12936 ?auto_12935 )
      ( FLY-3PPL-VERIFY ?auto_12936 ?auto_12937 ?auto_12938 ?auto_12935 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_12956 - PERSON
      ?auto_12955 - CITY
    )
    :vars
    (
      ?auto_12957 - AIRCRAFT
      ?auto_12960 - CITY
      ?auto_12958 - FLEVEL
      ?auto_12959 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_12956 ?auto_12957 ) ( AIRCRAFT-AT ?auto_12957 ?auto_12960 ) ( FUEL-LEVEL ?auto_12957 ?auto_12958 ) ( NEXT ?auto_12959 ?auto_12958 ) ( not ( = ?auto_12955 ?auto_12960 ) ) ( not ( = ?auto_12958 ?auto_12959 ) ) )
    :subtasks
    ( ( !FLY ?auto_12957 ?auto_12960 ?auto_12955 ?auto_12958 ?auto_12959 )
      ( FLY-1PPL ?auto_12956 ?auto_12955 )
      ( FLY-1PPL-VERIFY ?auto_12956 ?auto_12955 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12962 - PERSON
      ?auto_12963 - PERSON
      ?auto_12961 - CITY
    )
    :vars
    (
      ?auto_12967 - AIRCRAFT
      ?auto_12965 - CITY
      ?auto_12964 - FLEVEL
      ?auto_12966 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_12963 ?auto_12967 ) ( AIRCRAFT-AT ?auto_12967 ?auto_12965 ) ( FUEL-LEVEL ?auto_12967 ?auto_12964 ) ( NEXT ?auto_12966 ?auto_12964 ) ( not ( = ?auto_12961 ?auto_12965 ) ) ( not ( = ?auto_12964 ?auto_12966 ) ) ( PERSON-AT ?auto_12962 ?auto_12961 ) ( not ( = ?auto_12962 ?auto_12963 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_12963 ?auto_12961 )
      ( FLY-2PPL-VERIFY ?auto_12962 ?auto_12963 ?auto_12961 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_12969 - PERSON
      ?auto_12970 - PERSON
      ?auto_12968 - CITY
    )
    :vars
    (
      ?auto_12971 - AIRCRAFT
      ?auto_12972 - CITY
      ?auto_12974 - FLEVEL
      ?auto_12973 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_12969 ?auto_12971 ) ( AIRCRAFT-AT ?auto_12971 ?auto_12972 ) ( FUEL-LEVEL ?auto_12971 ?auto_12974 ) ( NEXT ?auto_12973 ?auto_12974 ) ( not ( = ?auto_12968 ?auto_12972 ) ) ( not ( = ?auto_12974 ?auto_12973 ) ) ( PERSON-AT ?auto_12970 ?auto_12968 ) ( not ( = ?auto_12970 ?auto_12969 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12970 ?auto_12969 ?auto_12968 )
      ( FLY-2PPL-VERIFY ?auto_12969 ?auto_12970 ?auto_12968 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12984 - PERSON
      ?auto_12985 - PERSON
      ?auto_12986 - PERSON
      ?auto_12983 - CITY
    )
    :vars
    (
      ?auto_12987 - AIRCRAFT
      ?auto_12988 - CITY
      ?auto_12990 - FLEVEL
      ?auto_12989 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_12986 ?auto_12987 ) ( AIRCRAFT-AT ?auto_12987 ?auto_12988 ) ( FUEL-LEVEL ?auto_12987 ?auto_12990 ) ( NEXT ?auto_12989 ?auto_12990 ) ( not ( = ?auto_12983 ?auto_12988 ) ) ( not ( = ?auto_12990 ?auto_12989 ) ) ( PERSON-AT ?auto_12985 ?auto_12983 ) ( not ( = ?auto_12985 ?auto_12986 ) ) ( PERSON-AT ?auto_12984 ?auto_12983 ) ( not ( = ?auto_12984 ?auto_12985 ) ) ( not ( = ?auto_12984 ?auto_12986 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12985 ?auto_12986 ?auto_12983 )
      ( FLY-3PPL-VERIFY ?auto_12984 ?auto_12985 ?auto_12986 ?auto_12983 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_12992 - PERSON
      ?auto_12993 - PERSON
      ?auto_12994 - PERSON
      ?auto_12991 - CITY
    )
    :vars
    (
      ?auto_12995 - AIRCRAFT
      ?auto_12996 - CITY
      ?auto_12998 - FLEVEL
      ?auto_12997 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_12993 ?auto_12995 ) ( AIRCRAFT-AT ?auto_12995 ?auto_12996 ) ( FUEL-LEVEL ?auto_12995 ?auto_12998 ) ( NEXT ?auto_12997 ?auto_12998 ) ( not ( = ?auto_12991 ?auto_12996 ) ) ( not ( = ?auto_12998 ?auto_12997 ) ) ( PERSON-AT ?auto_12994 ?auto_12991 ) ( not ( = ?auto_12994 ?auto_12993 ) ) ( PERSON-AT ?auto_12992 ?auto_12991 ) ( not ( = ?auto_12992 ?auto_12993 ) ) ( not ( = ?auto_12992 ?auto_12994 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_12994 ?auto_12993 ?auto_12991 )
      ( FLY-3PPL-VERIFY ?auto_12992 ?auto_12993 ?auto_12994 ?auto_12991 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13008 - PERSON
      ?auto_13009 - PERSON
      ?auto_13010 - PERSON
      ?auto_13007 - CITY
    )
    :vars
    (
      ?auto_13011 - AIRCRAFT
      ?auto_13012 - CITY
      ?auto_13014 - FLEVEL
      ?auto_13013 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_13008 ?auto_13011 ) ( AIRCRAFT-AT ?auto_13011 ?auto_13012 ) ( FUEL-LEVEL ?auto_13011 ?auto_13014 ) ( NEXT ?auto_13013 ?auto_13014 ) ( not ( = ?auto_13007 ?auto_13012 ) ) ( not ( = ?auto_13014 ?auto_13013 ) ) ( PERSON-AT ?auto_13009 ?auto_13007 ) ( not ( = ?auto_13009 ?auto_13008 ) ) ( PERSON-AT ?auto_13010 ?auto_13007 ) ( not ( = ?auto_13008 ?auto_13010 ) ) ( not ( = ?auto_13009 ?auto_13010 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13009 ?auto_13008 ?auto_13007 )
      ( FLY-3PPL-VERIFY ?auto_13008 ?auto_13009 ?auto_13010 ?auto_13007 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_13041 - PERSON
      ?auto_13040 - CITY
    )
    :vars
    (
      ?auto_13042 - AIRCRAFT
      ?auto_13044 - CITY
      ?auto_13046 - FLEVEL
      ?auto_13045 - FLEVEL
      ?auto_13043 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13042 ?auto_13044 ) ( FUEL-LEVEL ?auto_13042 ?auto_13046 ) ( NEXT ?auto_13045 ?auto_13046 ) ( not ( = ?auto_13040 ?auto_13044 ) ) ( not ( = ?auto_13046 ?auto_13045 ) ) ( PERSON-AT ?auto_13043 ?auto_13040 ) ( not ( = ?auto_13043 ?auto_13041 ) ) ( PERSON-AT ?auto_13041 ?auto_13044 ) )
    :subtasks
    ( ( !BOARD ?auto_13041 ?auto_13042 ?auto_13044 )
      ( FLY-2PPL ?auto_13043 ?auto_13041 ?auto_13040 )
      ( FLY-1PPL-VERIFY ?auto_13041 ?auto_13040 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13048 - PERSON
      ?auto_13049 - PERSON
      ?auto_13047 - CITY
    )
    :vars
    (
      ?auto_13053 - AIRCRAFT
      ?auto_13051 - CITY
      ?auto_13052 - FLEVEL
      ?auto_13050 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13053 ?auto_13051 ) ( FUEL-LEVEL ?auto_13053 ?auto_13052 ) ( NEXT ?auto_13050 ?auto_13052 ) ( not ( = ?auto_13047 ?auto_13051 ) ) ( not ( = ?auto_13052 ?auto_13050 ) ) ( PERSON-AT ?auto_13048 ?auto_13047 ) ( not ( = ?auto_13048 ?auto_13049 ) ) ( PERSON-AT ?auto_13049 ?auto_13051 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_13049 ?auto_13047 )
      ( FLY-2PPL-VERIFY ?auto_13048 ?auto_13049 ?auto_13047 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13055 - PERSON
      ?auto_13056 - PERSON
      ?auto_13054 - CITY
    )
    :vars
    (
      ?auto_13057 - AIRCRAFT
      ?auto_13058 - CITY
      ?auto_13060 - FLEVEL
      ?auto_13059 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13057 ?auto_13058 ) ( FUEL-LEVEL ?auto_13057 ?auto_13060 ) ( NEXT ?auto_13059 ?auto_13060 ) ( not ( = ?auto_13054 ?auto_13058 ) ) ( not ( = ?auto_13060 ?auto_13059 ) ) ( PERSON-AT ?auto_13056 ?auto_13054 ) ( not ( = ?auto_13056 ?auto_13055 ) ) ( PERSON-AT ?auto_13055 ?auto_13058 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13056 ?auto_13055 ?auto_13054 )
      ( FLY-2PPL-VERIFY ?auto_13055 ?auto_13056 ?auto_13054 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13070 - PERSON
      ?auto_13071 - PERSON
      ?auto_13072 - PERSON
      ?auto_13069 - CITY
    )
    :vars
    (
      ?auto_13073 - AIRCRAFT
      ?auto_13074 - CITY
      ?auto_13076 - FLEVEL
      ?auto_13075 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13073 ?auto_13074 ) ( FUEL-LEVEL ?auto_13073 ?auto_13076 ) ( NEXT ?auto_13075 ?auto_13076 ) ( not ( = ?auto_13069 ?auto_13074 ) ) ( not ( = ?auto_13076 ?auto_13075 ) ) ( PERSON-AT ?auto_13070 ?auto_13069 ) ( not ( = ?auto_13070 ?auto_13072 ) ) ( PERSON-AT ?auto_13072 ?auto_13074 ) ( PERSON-AT ?auto_13071 ?auto_13069 ) ( not ( = ?auto_13070 ?auto_13071 ) ) ( not ( = ?auto_13071 ?auto_13072 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13070 ?auto_13072 ?auto_13069 )
      ( FLY-3PPL-VERIFY ?auto_13070 ?auto_13071 ?auto_13072 ?auto_13069 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13078 - PERSON
      ?auto_13079 - PERSON
      ?auto_13080 - PERSON
      ?auto_13077 - CITY
    )
    :vars
    (
      ?auto_13081 - AIRCRAFT
      ?auto_13082 - CITY
      ?auto_13084 - FLEVEL
      ?auto_13083 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13081 ?auto_13082 ) ( FUEL-LEVEL ?auto_13081 ?auto_13084 ) ( NEXT ?auto_13083 ?auto_13084 ) ( not ( = ?auto_13077 ?auto_13082 ) ) ( not ( = ?auto_13084 ?auto_13083 ) ) ( PERSON-AT ?auto_13078 ?auto_13077 ) ( not ( = ?auto_13078 ?auto_13079 ) ) ( PERSON-AT ?auto_13079 ?auto_13082 ) ( PERSON-AT ?auto_13080 ?auto_13077 ) ( not ( = ?auto_13078 ?auto_13080 ) ) ( not ( = ?auto_13079 ?auto_13080 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13078 ?auto_13079 ?auto_13077 )
      ( FLY-3PPL-VERIFY ?auto_13078 ?auto_13079 ?auto_13080 ?auto_13077 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13094 - PERSON
      ?auto_13095 - PERSON
      ?auto_13096 - PERSON
      ?auto_13093 - CITY
    )
    :vars
    (
      ?auto_13097 - AIRCRAFT
      ?auto_13098 - CITY
      ?auto_13100 - FLEVEL
      ?auto_13099 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13097 ?auto_13098 ) ( FUEL-LEVEL ?auto_13097 ?auto_13100 ) ( NEXT ?auto_13099 ?auto_13100 ) ( not ( = ?auto_13093 ?auto_13098 ) ) ( not ( = ?auto_13100 ?auto_13099 ) ) ( PERSON-AT ?auto_13096 ?auto_13093 ) ( not ( = ?auto_13096 ?auto_13094 ) ) ( PERSON-AT ?auto_13094 ?auto_13098 ) ( PERSON-AT ?auto_13095 ?auto_13093 ) ( not ( = ?auto_13094 ?auto_13095 ) ) ( not ( = ?auto_13095 ?auto_13096 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13096 ?auto_13094 ?auto_13093 )
      ( FLY-3PPL-VERIFY ?auto_13094 ?auto_13095 ?auto_13096 ?auto_13093 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_13127 - PERSON
      ?auto_13126 - CITY
    )
    :vars
    (
      ?auto_13128 - AIRCRAFT
      ?auto_13129 - CITY
      ?auto_13131 - FLEVEL
      ?auto_13132 - FLEVEL
      ?auto_13130 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13128 ?auto_13129 ) ( NEXT ?auto_13131 ?auto_13132 ) ( not ( = ?auto_13126 ?auto_13129 ) ) ( not ( = ?auto_13132 ?auto_13131 ) ) ( PERSON-AT ?auto_13130 ?auto_13126 ) ( not ( = ?auto_13130 ?auto_13127 ) ) ( PERSON-AT ?auto_13127 ?auto_13129 ) ( FUEL-LEVEL ?auto_13128 ?auto_13131 ) )
    :subtasks
    ( ( !REFUEL ?auto_13128 ?auto_13129 ?auto_13131 ?auto_13132 )
      ( FLY-2PPL ?auto_13130 ?auto_13127 ?auto_13126 )
      ( FLY-1PPL-VERIFY ?auto_13127 ?auto_13126 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13134 - PERSON
      ?auto_13135 - PERSON
      ?auto_13133 - CITY
    )
    :vars
    (
      ?auto_13138 - AIRCRAFT
      ?auto_13139 - CITY
      ?auto_13137 - FLEVEL
      ?auto_13136 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13138 ?auto_13139 ) ( NEXT ?auto_13137 ?auto_13136 ) ( not ( = ?auto_13133 ?auto_13139 ) ) ( not ( = ?auto_13136 ?auto_13137 ) ) ( PERSON-AT ?auto_13134 ?auto_13133 ) ( not ( = ?auto_13134 ?auto_13135 ) ) ( PERSON-AT ?auto_13135 ?auto_13139 ) ( FUEL-LEVEL ?auto_13138 ?auto_13137 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_13135 ?auto_13133 )
      ( FLY-2PPL-VERIFY ?auto_13134 ?auto_13135 ?auto_13133 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13141 - PERSON
      ?auto_13142 - PERSON
      ?auto_13140 - CITY
    )
    :vars
    (
      ?auto_13143 - AIRCRAFT
      ?auto_13145 - CITY
      ?auto_13144 - FLEVEL
      ?auto_13146 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13143 ?auto_13145 ) ( NEXT ?auto_13144 ?auto_13146 ) ( not ( = ?auto_13140 ?auto_13145 ) ) ( not ( = ?auto_13146 ?auto_13144 ) ) ( PERSON-AT ?auto_13142 ?auto_13140 ) ( not ( = ?auto_13142 ?auto_13141 ) ) ( PERSON-AT ?auto_13141 ?auto_13145 ) ( FUEL-LEVEL ?auto_13143 ?auto_13144 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13142 ?auto_13141 ?auto_13140 )
      ( FLY-2PPL-VERIFY ?auto_13141 ?auto_13142 ?auto_13140 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13156 - PERSON
      ?auto_13157 - PERSON
      ?auto_13158 - PERSON
      ?auto_13155 - CITY
    )
    :vars
    (
      ?auto_13159 - AIRCRAFT
      ?auto_13161 - CITY
      ?auto_13160 - FLEVEL
      ?auto_13162 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13159 ?auto_13161 ) ( NEXT ?auto_13160 ?auto_13162 ) ( not ( = ?auto_13155 ?auto_13161 ) ) ( not ( = ?auto_13162 ?auto_13160 ) ) ( PERSON-AT ?auto_13156 ?auto_13155 ) ( not ( = ?auto_13156 ?auto_13158 ) ) ( PERSON-AT ?auto_13158 ?auto_13161 ) ( FUEL-LEVEL ?auto_13159 ?auto_13160 ) ( PERSON-AT ?auto_13157 ?auto_13155 ) ( not ( = ?auto_13156 ?auto_13157 ) ) ( not ( = ?auto_13157 ?auto_13158 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13156 ?auto_13158 ?auto_13155 )
      ( FLY-3PPL-VERIFY ?auto_13156 ?auto_13157 ?auto_13158 ?auto_13155 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13164 - PERSON
      ?auto_13165 - PERSON
      ?auto_13166 - PERSON
      ?auto_13163 - CITY
    )
    :vars
    (
      ?auto_13167 - AIRCRAFT
      ?auto_13169 - CITY
      ?auto_13168 - FLEVEL
      ?auto_13170 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13167 ?auto_13169 ) ( NEXT ?auto_13168 ?auto_13170 ) ( not ( = ?auto_13163 ?auto_13169 ) ) ( not ( = ?auto_13170 ?auto_13168 ) ) ( PERSON-AT ?auto_13164 ?auto_13163 ) ( not ( = ?auto_13164 ?auto_13165 ) ) ( PERSON-AT ?auto_13165 ?auto_13169 ) ( FUEL-LEVEL ?auto_13167 ?auto_13168 ) ( PERSON-AT ?auto_13166 ?auto_13163 ) ( not ( = ?auto_13164 ?auto_13166 ) ) ( not ( = ?auto_13165 ?auto_13166 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13164 ?auto_13165 ?auto_13163 )
      ( FLY-3PPL-VERIFY ?auto_13164 ?auto_13165 ?auto_13166 ?auto_13163 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13180 - PERSON
      ?auto_13181 - PERSON
      ?auto_13182 - PERSON
      ?auto_13179 - CITY
    )
    :vars
    (
      ?auto_13183 - AIRCRAFT
      ?auto_13185 - CITY
      ?auto_13184 - FLEVEL
      ?auto_13186 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_13183 ?auto_13185 ) ( NEXT ?auto_13184 ?auto_13186 ) ( not ( = ?auto_13179 ?auto_13185 ) ) ( not ( = ?auto_13186 ?auto_13184 ) ) ( PERSON-AT ?auto_13181 ?auto_13179 ) ( not ( = ?auto_13181 ?auto_13180 ) ) ( PERSON-AT ?auto_13180 ?auto_13185 ) ( FUEL-LEVEL ?auto_13183 ?auto_13184 ) ( PERSON-AT ?auto_13182 ?auto_13179 ) ( not ( = ?auto_13180 ?auto_13182 ) ) ( not ( = ?auto_13181 ?auto_13182 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13181 ?auto_13180 ?auto_13179 )
      ( FLY-3PPL-VERIFY ?auto_13180 ?auto_13181 ?auto_13182 ?auto_13179 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_13213 - PERSON
      ?auto_13212 - CITY
    )
    :vars
    (
      ?auto_13215 - FLEVEL
      ?auto_13218 - FLEVEL
      ?auto_13216 - CITY
      ?auto_13217 - PERSON
      ?auto_13214 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13215 ?auto_13218 ) ( not ( = ?auto_13212 ?auto_13216 ) ) ( not ( = ?auto_13218 ?auto_13215 ) ) ( PERSON-AT ?auto_13217 ?auto_13212 ) ( not ( = ?auto_13217 ?auto_13213 ) ) ( PERSON-AT ?auto_13213 ?auto_13216 ) ( AIRCRAFT-AT ?auto_13214 ?auto_13212 ) ( FUEL-LEVEL ?auto_13214 ?auto_13218 ) )
    :subtasks
    ( ( !FLY ?auto_13214 ?auto_13212 ?auto_13216 ?auto_13218 ?auto_13215 )
      ( FLY-2PPL ?auto_13217 ?auto_13213 ?auto_13212 )
      ( FLY-1PPL-VERIFY ?auto_13213 ?auto_13212 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13220 - PERSON
      ?auto_13221 - PERSON
      ?auto_13219 - CITY
    )
    :vars
    (
      ?auto_13222 - FLEVEL
      ?auto_13225 - FLEVEL
      ?auto_13223 - CITY
      ?auto_13224 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13222 ?auto_13225 ) ( not ( = ?auto_13219 ?auto_13223 ) ) ( not ( = ?auto_13225 ?auto_13222 ) ) ( PERSON-AT ?auto_13220 ?auto_13219 ) ( not ( = ?auto_13220 ?auto_13221 ) ) ( PERSON-AT ?auto_13221 ?auto_13223 ) ( AIRCRAFT-AT ?auto_13224 ?auto_13219 ) ( FUEL-LEVEL ?auto_13224 ?auto_13225 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_13221 ?auto_13219 )
      ( FLY-2PPL-VERIFY ?auto_13220 ?auto_13221 ?auto_13219 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13227 - PERSON
      ?auto_13228 - PERSON
      ?auto_13226 - CITY
    )
    :vars
    (
      ?auto_13232 - FLEVEL
      ?auto_13231 - FLEVEL
      ?auto_13230 - CITY
      ?auto_13229 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13232 ?auto_13231 ) ( not ( = ?auto_13226 ?auto_13230 ) ) ( not ( = ?auto_13231 ?auto_13232 ) ) ( PERSON-AT ?auto_13228 ?auto_13226 ) ( not ( = ?auto_13228 ?auto_13227 ) ) ( PERSON-AT ?auto_13227 ?auto_13230 ) ( AIRCRAFT-AT ?auto_13229 ?auto_13226 ) ( FUEL-LEVEL ?auto_13229 ?auto_13231 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13228 ?auto_13227 ?auto_13226 )
      ( FLY-2PPL-VERIFY ?auto_13227 ?auto_13228 ?auto_13226 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13242 - PERSON
      ?auto_13243 - PERSON
      ?auto_13244 - PERSON
      ?auto_13241 - CITY
    )
    :vars
    (
      ?auto_13248 - FLEVEL
      ?auto_13247 - FLEVEL
      ?auto_13246 - CITY
      ?auto_13245 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13248 ?auto_13247 ) ( not ( = ?auto_13241 ?auto_13246 ) ) ( not ( = ?auto_13247 ?auto_13248 ) ) ( PERSON-AT ?auto_13242 ?auto_13241 ) ( not ( = ?auto_13242 ?auto_13244 ) ) ( PERSON-AT ?auto_13244 ?auto_13246 ) ( AIRCRAFT-AT ?auto_13245 ?auto_13241 ) ( FUEL-LEVEL ?auto_13245 ?auto_13247 ) ( PERSON-AT ?auto_13243 ?auto_13241 ) ( not ( = ?auto_13242 ?auto_13243 ) ) ( not ( = ?auto_13243 ?auto_13244 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13242 ?auto_13244 ?auto_13241 )
      ( FLY-3PPL-VERIFY ?auto_13242 ?auto_13243 ?auto_13244 ?auto_13241 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13250 - PERSON
      ?auto_13251 - PERSON
      ?auto_13252 - PERSON
      ?auto_13249 - CITY
    )
    :vars
    (
      ?auto_13256 - FLEVEL
      ?auto_13255 - FLEVEL
      ?auto_13254 - CITY
      ?auto_13253 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13256 ?auto_13255 ) ( not ( = ?auto_13249 ?auto_13254 ) ) ( not ( = ?auto_13255 ?auto_13256 ) ) ( PERSON-AT ?auto_13252 ?auto_13249 ) ( not ( = ?auto_13252 ?auto_13251 ) ) ( PERSON-AT ?auto_13251 ?auto_13254 ) ( AIRCRAFT-AT ?auto_13253 ?auto_13249 ) ( FUEL-LEVEL ?auto_13253 ?auto_13255 ) ( PERSON-AT ?auto_13250 ?auto_13249 ) ( not ( = ?auto_13250 ?auto_13251 ) ) ( not ( = ?auto_13250 ?auto_13252 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13252 ?auto_13251 ?auto_13249 )
      ( FLY-3PPL-VERIFY ?auto_13250 ?auto_13251 ?auto_13252 ?auto_13249 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13266 - PERSON
      ?auto_13267 - PERSON
      ?auto_13268 - PERSON
      ?auto_13265 - CITY
    )
    :vars
    (
      ?auto_13272 - FLEVEL
      ?auto_13271 - FLEVEL
      ?auto_13270 - CITY
      ?auto_13269 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13272 ?auto_13271 ) ( not ( = ?auto_13265 ?auto_13270 ) ) ( not ( = ?auto_13271 ?auto_13272 ) ) ( PERSON-AT ?auto_13267 ?auto_13265 ) ( not ( = ?auto_13267 ?auto_13266 ) ) ( PERSON-AT ?auto_13266 ?auto_13270 ) ( AIRCRAFT-AT ?auto_13269 ?auto_13265 ) ( FUEL-LEVEL ?auto_13269 ?auto_13271 ) ( PERSON-AT ?auto_13268 ?auto_13265 ) ( not ( = ?auto_13266 ?auto_13268 ) ) ( not ( = ?auto_13267 ?auto_13268 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13267 ?auto_13266 ?auto_13265 )
      ( FLY-3PPL-VERIFY ?auto_13266 ?auto_13267 ?auto_13268 ?auto_13265 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_13299 - PERSON
      ?auto_13298 - CITY
    )
    :vars
    (
      ?auto_13304 - FLEVEL
      ?auto_13303 - FLEVEL
      ?auto_13302 - CITY
      ?auto_13301 - PERSON
      ?auto_13300 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13304 ?auto_13303 ) ( not ( = ?auto_13298 ?auto_13302 ) ) ( not ( = ?auto_13303 ?auto_13304 ) ) ( PERSON-AT ?auto_13301 ?auto_13298 ) ( not ( = ?auto_13301 ?auto_13299 ) ) ( PERSON-AT ?auto_13299 ?auto_13302 ) ( AIRCRAFT-AT ?auto_13300 ?auto_13298 ) ( FUEL-LEVEL ?auto_13300 ?auto_13304 ) )
    :subtasks
    ( ( !REFUEL ?auto_13300 ?auto_13298 ?auto_13304 ?auto_13303 )
      ( FLY-2PPL ?auto_13301 ?auto_13299 ?auto_13298 )
      ( FLY-1PPL-VERIFY ?auto_13299 ?auto_13298 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13306 - PERSON
      ?auto_13307 - PERSON
      ?auto_13305 - CITY
    )
    :vars
    (
      ?auto_13311 - FLEVEL
      ?auto_13310 - FLEVEL
      ?auto_13308 - CITY
      ?auto_13309 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13311 ?auto_13310 ) ( not ( = ?auto_13305 ?auto_13308 ) ) ( not ( = ?auto_13310 ?auto_13311 ) ) ( PERSON-AT ?auto_13306 ?auto_13305 ) ( not ( = ?auto_13306 ?auto_13307 ) ) ( PERSON-AT ?auto_13307 ?auto_13308 ) ( AIRCRAFT-AT ?auto_13309 ?auto_13305 ) ( FUEL-LEVEL ?auto_13309 ?auto_13311 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_13307 ?auto_13305 )
      ( FLY-2PPL-VERIFY ?auto_13306 ?auto_13307 ?auto_13305 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13313 - PERSON
      ?auto_13314 - PERSON
      ?auto_13312 - CITY
    )
    :vars
    (
      ?auto_13315 - FLEVEL
      ?auto_13317 - FLEVEL
      ?auto_13318 - CITY
      ?auto_13316 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13315 ?auto_13317 ) ( not ( = ?auto_13312 ?auto_13318 ) ) ( not ( = ?auto_13317 ?auto_13315 ) ) ( PERSON-AT ?auto_13314 ?auto_13312 ) ( not ( = ?auto_13314 ?auto_13313 ) ) ( PERSON-AT ?auto_13313 ?auto_13318 ) ( AIRCRAFT-AT ?auto_13316 ?auto_13312 ) ( FUEL-LEVEL ?auto_13316 ?auto_13315 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13314 ?auto_13313 ?auto_13312 )
      ( FLY-2PPL-VERIFY ?auto_13313 ?auto_13314 ?auto_13312 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13328 - PERSON
      ?auto_13329 - PERSON
      ?auto_13330 - PERSON
      ?auto_13327 - CITY
    )
    :vars
    (
      ?auto_13331 - FLEVEL
      ?auto_13333 - FLEVEL
      ?auto_13334 - CITY
      ?auto_13332 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13331 ?auto_13333 ) ( not ( = ?auto_13327 ?auto_13334 ) ) ( not ( = ?auto_13333 ?auto_13331 ) ) ( PERSON-AT ?auto_13329 ?auto_13327 ) ( not ( = ?auto_13329 ?auto_13330 ) ) ( PERSON-AT ?auto_13330 ?auto_13334 ) ( AIRCRAFT-AT ?auto_13332 ?auto_13327 ) ( FUEL-LEVEL ?auto_13332 ?auto_13331 ) ( PERSON-AT ?auto_13328 ?auto_13327 ) ( not ( = ?auto_13328 ?auto_13329 ) ) ( not ( = ?auto_13328 ?auto_13330 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13329 ?auto_13330 ?auto_13327 )
      ( FLY-3PPL-VERIFY ?auto_13328 ?auto_13329 ?auto_13330 ?auto_13327 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13336 - PERSON
      ?auto_13337 - PERSON
      ?auto_13338 - PERSON
      ?auto_13335 - CITY
    )
    :vars
    (
      ?auto_13339 - FLEVEL
      ?auto_13341 - FLEVEL
      ?auto_13342 - CITY
      ?auto_13340 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13339 ?auto_13341 ) ( not ( = ?auto_13335 ?auto_13342 ) ) ( not ( = ?auto_13341 ?auto_13339 ) ) ( PERSON-AT ?auto_13338 ?auto_13335 ) ( not ( = ?auto_13338 ?auto_13337 ) ) ( PERSON-AT ?auto_13337 ?auto_13342 ) ( AIRCRAFT-AT ?auto_13340 ?auto_13335 ) ( FUEL-LEVEL ?auto_13340 ?auto_13339 ) ( PERSON-AT ?auto_13336 ?auto_13335 ) ( not ( = ?auto_13336 ?auto_13337 ) ) ( not ( = ?auto_13336 ?auto_13338 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13338 ?auto_13337 ?auto_13335 )
      ( FLY-3PPL-VERIFY ?auto_13336 ?auto_13337 ?auto_13338 ?auto_13335 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_13352 - PERSON
      ?auto_13353 - PERSON
      ?auto_13354 - PERSON
      ?auto_13351 - CITY
    )
    :vars
    (
      ?auto_13355 - FLEVEL
      ?auto_13357 - FLEVEL
      ?auto_13358 - CITY
      ?auto_13356 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13355 ?auto_13357 ) ( not ( = ?auto_13351 ?auto_13358 ) ) ( not ( = ?auto_13357 ?auto_13355 ) ) ( PERSON-AT ?auto_13353 ?auto_13351 ) ( not ( = ?auto_13353 ?auto_13352 ) ) ( PERSON-AT ?auto_13352 ?auto_13358 ) ( AIRCRAFT-AT ?auto_13356 ?auto_13351 ) ( FUEL-LEVEL ?auto_13356 ?auto_13355 ) ( PERSON-AT ?auto_13354 ?auto_13351 ) ( not ( = ?auto_13352 ?auto_13354 ) ) ( not ( = ?auto_13353 ?auto_13354 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13353 ?auto_13352 ?auto_13351 )
      ( FLY-3PPL-VERIFY ?auto_13352 ?auto_13353 ?auto_13354 ?auto_13351 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_13385 - PERSON
      ?auto_13384 - CITY
    )
    :vars
    (
      ?auto_13386 - FLEVEL
      ?auto_13389 - FLEVEL
      ?auto_13390 - CITY
      ?auto_13388 - PERSON
      ?auto_13387 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13386 ?auto_13389 ) ( not ( = ?auto_13384 ?auto_13390 ) ) ( not ( = ?auto_13389 ?auto_13386 ) ) ( not ( = ?auto_13388 ?auto_13385 ) ) ( PERSON-AT ?auto_13385 ?auto_13390 ) ( AIRCRAFT-AT ?auto_13387 ?auto_13384 ) ( FUEL-LEVEL ?auto_13387 ?auto_13386 ) ( IN ?auto_13388 ?auto_13387 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_13388 ?auto_13384 )
      ( FLY-2PPL ?auto_13388 ?auto_13385 ?auto_13384 )
      ( FLY-1PPL-VERIFY ?auto_13385 ?auto_13384 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13392 - PERSON
      ?auto_13393 - PERSON
      ?auto_13391 - CITY
    )
    :vars
    (
      ?auto_13396 - FLEVEL
      ?auto_13394 - FLEVEL
      ?auto_13397 - CITY
      ?auto_13395 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13396 ?auto_13394 ) ( not ( = ?auto_13391 ?auto_13397 ) ) ( not ( = ?auto_13394 ?auto_13396 ) ) ( not ( = ?auto_13392 ?auto_13393 ) ) ( PERSON-AT ?auto_13393 ?auto_13397 ) ( AIRCRAFT-AT ?auto_13395 ?auto_13391 ) ( FUEL-LEVEL ?auto_13395 ?auto_13396 ) ( IN ?auto_13392 ?auto_13395 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_13393 ?auto_13391 )
      ( FLY-2PPL-VERIFY ?auto_13392 ?auto_13393 ?auto_13391 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13399 - PERSON
      ?auto_13400 - PERSON
      ?auto_13398 - CITY
    )
    :vars
    (
      ?auto_13402 - FLEVEL
      ?auto_13403 - FLEVEL
      ?auto_13404 - CITY
      ?auto_13401 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13402 ?auto_13403 ) ( not ( = ?auto_13398 ?auto_13404 ) ) ( not ( = ?auto_13403 ?auto_13402 ) ) ( not ( = ?auto_13400 ?auto_13399 ) ) ( PERSON-AT ?auto_13399 ?auto_13404 ) ( AIRCRAFT-AT ?auto_13401 ?auto_13398 ) ( FUEL-LEVEL ?auto_13401 ?auto_13402 ) ( IN ?auto_13400 ?auto_13401 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13400 ?auto_13399 ?auto_13398 )
      ( FLY-2PPL-VERIFY ?auto_13399 ?auto_13400 ?auto_13398 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_13471 - PERSON
      ?auto_13470 - CITY
    )
    :vars
    (
      ?auto_13474 - FLEVEL
      ?auto_13475 - FLEVEL
      ?auto_13476 - CITY
      ?auto_13473 - PERSON
      ?auto_13472 - AIRCRAFT
      ?auto_13477 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_13474 ?auto_13475 ) ( not ( = ?auto_13470 ?auto_13476 ) ) ( not ( = ?auto_13475 ?auto_13474 ) ) ( not ( = ?auto_13473 ?auto_13471 ) ) ( PERSON-AT ?auto_13471 ?auto_13476 ) ( IN ?auto_13473 ?auto_13472 ) ( AIRCRAFT-AT ?auto_13472 ?auto_13477 ) ( FUEL-LEVEL ?auto_13472 ?auto_13475 ) ( not ( = ?auto_13470 ?auto_13477 ) ) ( not ( = ?auto_13476 ?auto_13477 ) ) )
    :subtasks
    ( ( !FLY ?auto_13472 ?auto_13477 ?auto_13470 ?auto_13475 ?auto_13474 )
      ( FLY-2PPL ?auto_13473 ?auto_13471 ?auto_13470 )
      ( FLY-1PPL-VERIFY ?auto_13471 ?auto_13470 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13479 - PERSON
      ?auto_13480 - PERSON
      ?auto_13478 - CITY
    )
    :vars
    (
      ?auto_13481 - FLEVEL
      ?auto_13483 - FLEVEL
      ?auto_13485 - CITY
      ?auto_13484 - AIRCRAFT
      ?auto_13482 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_13481 ?auto_13483 ) ( not ( = ?auto_13478 ?auto_13485 ) ) ( not ( = ?auto_13483 ?auto_13481 ) ) ( not ( = ?auto_13479 ?auto_13480 ) ) ( PERSON-AT ?auto_13480 ?auto_13485 ) ( IN ?auto_13479 ?auto_13484 ) ( AIRCRAFT-AT ?auto_13484 ?auto_13482 ) ( FUEL-LEVEL ?auto_13484 ?auto_13483 ) ( not ( = ?auto_13478 ?auto_13482 ) ) ( not ( = ?auto_13485 ?auto_13482 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_13480 ?auto_13478 )
      ( FLY-2PPL-VERIFY ?auto_13479 ?auto_13480 ?auto_13478 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13487 - PERSON
      ?auto_13488 - PERSON
      ?auto_13486 - CITY
    )
    :vars
    (
      ?auto_13492 - FLEVEL
      ?auto_13489 - FLEVEL
      ?auto_13493 - CITY
      ?auto_13491 - AIRCRAFT
      ?auto_13490 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_13492 ?auto_13489 ) ( not ( = ?auto_13486 ?auto_13493 ) ) ( not ( = ?auto_13489 ?auto_13492 ) ) ( not ( = ?auto_13488 ?auto_13487 ) ) ( PERSON-AT ?auto_13487 ?auto_13493 ) ( IN ?auto_13488 ?auto_13491 ) ( AIRCRAFT-AT ?auto_13491 ?auto_13490 ) ( FUEL-LEVEL ?auto_13491 ?auto_13489 ) ( not ( = ?auto_13486 ?auto_13490 ) ) ( not ( = ?auto_13493 ?auto_13490 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13488 ?auto_13487 ?auto_13486 )
      ( FLY-2PPL-VERIFY ?auto_13487 ?auto_13488 ?auto_13486 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_13568 - PERSON
      ?auto_13567 - CITY
    )
    :vars
    (
      ?auto_13573 - FLEVEL
      ?auto_13569 - FLEVEL
      ?auto_13574 - CITY
      ?auto_13570 - PERSON
      ?auto_13572 - AIRCRAFT
      ?auto_13571 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_13573 ?auto_13569 ) ( not ( = ?auto_13567 ?auto_13574 ) ) ( not ( = ?auto_13569 ?auto_13573 ) ) ( not ( = ?auto_13570 ?auto_13568 ) ) ( PERSON-AT ?auto_13568 ?auto_13574 ) ( AIRCRAFT-AT ?auto_13572 ?auto_13571 ) ( FUEL-LEVEL ?auto_13572 ?auto_13569 ) ( not ( = ?auto_13567 ?auto_13571 ) ) ( not ( = ?auto_13574 ?auto_13571 ) ) ( PERSON-AT ?auto_13570 ?auto_13571 ) )
    :subtasks
    ( ( !BOARD ?auto_13570 ?auto_13572 ?auto_13571 )
      ( FLY-2PPL ?auto_13570 ?auto_13568 ?auto_13567 )
      ( FLY-1PPL-VERIFY ?auto_13568 ?auto_13567 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13576 - PERSON
      ?auto_13577 - PERSON
      ?auto_13575 - CITY
    )
    :vars
    (
      ?auto_13580 - FLEVEL
      ?auto_13581 - FLEVEL
      ?auto_13578 - CITY
      ?auto_13582 - AIRCRAFT
      ?auto_13579 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_13580 ?auto_13581 ) ( not ( = ?auto_13575 ?auto_13578 ) ) ( not ( = ?auto_13581 ?auto_13580 ) ) ( not ( = ?auto_13576 ?auto_13577 ) ) ( PERSON-AT ?auto_13577 ?auto_13578 ) ( AIRCRAFT-AT ?auto_13582 ?auto_13579 ) ( FUEL-LEVEL ?auto_13582 ?auto_13581 ) ( not ( = ?auto_13575 ?auto_13579 ) ) ( not ( = ?auto_13578 ?auto_13579 ) ) ( PERSON-AT ?auto_13576 ?auto_13579 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_13577 ?auto_13575 )
      ( FLY-2PPL-VERIFY ?auto_13576 ?auto_13577 ?auto_13575 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13584 - PERSON
      ?auto_13585 - PERSON
      ?auto_13583 - CITY
    )
    :vars
    (
      ?auto_13590 - FLEVEL
      ?auto_13589 - FLEVEL
      ?auto_13587 - CITY
      ?auto_13586 - AIRCRAFT
      ?auto_13588 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_13590 ?auto_13589 ) ( not ( = ?auto_13583 ?auto_13587 ) ) ( not ( = ?auto_13589 ?auto_13590 ) ) ( not ( = ?auto_13585 ?auto_13584 ) ) ( PERSON-AT ?auto_13584 ?auto_13587 ) ( AIRCRAFT-AT ?auto_13586 ?auto_13588 ) ( FUEL-LEVEL ?auto_13586 ?auto_13589 ) ( not ( = ?auto_13583 ?auto_13588 ) ) ( not ( = ?auto_13587 ?auto_13588 ) ) ( PERSON-AT ?auto_13585 ?auto_13588 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13585 ?auto_13584 ?auto_13583 )
      ( FLY-2PPL-VERIFY ?auto_13584 ?auto_13585 ?auto_13583 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_13665 - PERSON
      ?auto_13664 - CITY
    )
    :vars
    (
      ?auto_13671 - FLEVEL
      ?auto_13669 - FLEVEL
      ?auto_13667 - CITY
      ?auto_13670 - PERSON
      ?auto_13666 - AIRCRAFT
      ?auto_13668 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_13671 ?auto_13669 ) ( not ( = ?auto_13664 ?auto_13667 ) ) ( not ( = ?auto_13669 ?auto_13671 ) ) ( not ( = ?auto_13670 ?auto_13665 ) ) ( PERSON-AT ?auto_13665 ?auto_13667 ) ( AIRCRAFT-AT ?auto_13666 ?auto_13668 ) ( not ( = ?auto_13664 ?auto_13668 ) ) ( not ( = ?auto_13667 ?auto_13668 ) ) ( PERSON-AT ?auto_13670 ?auto_13668 ) ( FUEL-LEVEL ?auto_13666 ?auto_13671 ) )
    :subtasks
    ( ( !REFUEL ?auto_13666 ?auto_13668 ?auto_13671 ?auto_13669 )
      ( FLY-2PPL ?auto_13670 ?auto_13665 ?auto_13664 )
      ( FLY-1PPL-VERIFY ?auto_13665 ?auto_13664 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13673 - PERSON
      ?auto_13674 - PERSON
      ?auto_13672 - CITY
    )
    :vars
    (
      ?auto_13675 - FLEVEL
      ?auto_13678 - FLEVEL
      ?auto_13676 - CITY
      ?auto_13677 - AIRCRAFT
      ?auto_13679 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_13675 ?auto_13678 ) ( not ( = ?auto_13672 ?auto_13676 ) ) ( not ( = ?auto_13678 ?auto_13675 ) ) ( not ( = ?auto_13673 ?auto_13674 ) ) ( PERSON-AT ?auto_13674 ?auto_13676 ) ( AIRCRAFT-AT ?auto_13677 ?auto_13679 ) ( not ( = ?auto_13672 ?auto_13679 ) ) ( not ( = ?auto_13676 ?auto_13679 ) ) ( PERSON-AT ?auto_13673 ?auto_13679 ) ( FUEL-LEVEL ?auto_13677 ?auto_13675 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_13674 ?auto_13672 )
      ( FLY-2PPL-VERIFY ?auto_13673 ?auto_13674 ?auto_13672 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13681 - PERSON
      ?auto_13682 - PERSON
      ?auto_13680 - CITY
    )
    :vars
    (
      ?auto_13683 - FLEVEL
      ?auto_13687 - FLEVEL
      ?auto_13686 - CITY
      ?auto_13685 - AIRCRAFT
      ?auto_13684 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_13683 ?auto_13687 ) ( not ( = ?auto_13680 ?auto_13686 ) ) ( not ( = ?auto_13687 ?auto_13683 ) ) ( not ( = ?auto_13682 ?auto_13681 ) ) ( PERSON-AT ?auto_13681 ?auto_13686 ) ( AIRCRAFT-AT ?auto_13685 ?auto_13684 ) ( not ( = ?auto_13680 ?auto_13684 ) ) ( not ( = ?auto_13686 ?auto_13684 ) ) ( PERSON-AT ?auto_13682 ?auto_13684 ) ( FUEL-LEVEL ?auto_13685 ?auto_13683 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13682 ?auto_13681 ?auto_13680 )
      ( FLY-2PPL-VERIFY ?auto_13681 ?auto_13682 ?auto_13680 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_13762 - PERSON
      ?auto_13761 - CITY
    )
    :vars
    (
      ?auto_13763 - FLEVEL
      ?auto_13767 - FLEVEL
      ?auto_13766 - CITY
      ?auto_13768 - PERSON
      ?auto_13764 - CITY
      ?auto_13765 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13763 ?auto_13767 ) ( not ( = ?auto_13761 ?auto_13766 ) ) ( not ( = ?auto_13767 ?auto_13763 ) ) ( not ( = ?auto_13768 ?auto_13762 ) ) ( PERSON-AT ?auto_13762 ?auto_13766 ) ( not ( = ?auto_13761 ?auto_13764 ) ) ( not ( = ?auto_13766 ?auto_13764 ) ) ( PERSON-AT ?auto_13768 ?auto_13764 ) ( AIRCRAFT-AT ?auto_13765 ?auto_13761 ) ( FUEL-LEVEL ?auto_13765 ?auto_13767 ) )
    :subtasks
    ( ( !FLY ?auto_13765 ?auto_13761 ?auto_13764 ?auto_13767 ?auto_13763 )
      ( FLY-2PPL ?auto_13768 ?auto_13762 ?auto_13761 )
      ( FLY-1PPL-VERIFY ?auto_13762 ?auto_13761 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13770 - PERSON
      ?auto_13771 - PERSON
      ?auto_13769 - CITY
    )
    :vars
    (
      ?auto_13772 - FLEVEL
      ?auto_13773 - FLEVEL
      ?auto_13774 - CITY
      ?auto_13775 - CITY
      ?auto_13776 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13772 ?auto_13773 ) ( not ( = ?auto_13769 ?auto_13774 ) ) ( not ( = ?auto_13773 ?auto_13772 ) ) ( not ( = ?auto_13770 ?auto_13771 ) ) ( PERSON-AT ?auto_13771 ?auto_13774 ) ( not ( = ?auto_13769 ?auto_13775 ) ) ( not ( = ?auto_13774 ?auto_13775 ) ) ( PERSON-AT ?auto_13770 ?auto_13775 ) ( AIRCRAFT-AT ?auto_13776 ?auto_13769 ) ( FUEL-LEVEL ?auto_13776 ?auto_13773 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_13771 ?auto_13769 )
      ( FLY-2PPL-VERIFY ?auto_13770 ?auto_13771 ?auto_13769 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13778 - PERSON
      ?auto_13779 - PERSON
      ?auto_13777 - CITY
    )
    :vars
    (
      ?auto_13780 - FLEVEL
      ?auto_13781 - FLEVEL
      ?auto_13784 - CITY
      ?auto_13783 - CITY
      ?auto_13782 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13780 ?auto_13781 ) ( not ( = ?auto_13777 ?auto_13784 ) ) ( not ( = ?auto_13781 ?auto_13780 ) ) ( not ( = ?auto_13779 ?auto_13778 ) ) ( PERSON-AT ?auto_13778 ?auto_13784 ) ( not ( = ?auto_13777 ?auto_13783 ) ) ( not ( = ?auto_13784 ?auto_13783 ) ) ( PERSON-AT ?auto_13779 ?auto_13783 ) ( AIRCRAFT-AT ?auto_13782 ?auto_13777 ) ( FUEL-LEVEL ?auto_13782 ?auto_13781 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13779 ?auto_13778 ?auto_13777 )
      ( FLY-2PPL-VERIFY ?auto_13778 ?auto_13779 ?auto_13777 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_13859 - PERSON
      ?auto_13858 - CITY
    )
    :vars
    (
      ?auto_13860 - FLEVEL
      ?auto_13861 - FLEVEL
      ?auto_13865 - CITY
      ?auto_13862 - PERSON
      ?auto_13864 - CITY
      ?auto_13863 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13860 ?auto_13861 ) ( not ( = ?auto_13858 ?auto_13865 ) ) ( not ( = ?auto_13861 ?auto_13860 ) ) ( not ( = ?auto_13862 ?auto_13859 ) ) ( PERSON-AT ?auto_13859 ?auto_13865 ) ( not ( = ?auto_13858 ?auto_13864 ) ) ( not ( = ?auto_13865 ?auto_13864 ) ) ( PERSON-AT ?auto_13862 ?auto_13864 ) ( AIRCRAFT-AT ?auto_13863 ?auto_13858 ) ( FUEL-LEVEL ?auto_13863 ?auto_13860 ) )
    :subtasks
    ( ( !REFUEL ?auto_13863 ?auto_13858 ?auto_13860 ?auto_13861 )
      ( FLY-2PPL ?auto_13862 ?auto_13859 ?auto_13858 )
      ( FLY-1PPL-VERIFY ?auto_13859 ?auto_13858 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13867 - PERSON
      ?auto_13868 - PERSON
      ?auto_13866 - CITY
    )
    :vars
    (
      ?auto_13871 - FLEVEL
      ?auto_13873 - FLEVEL
      ?auto_13869 - CITY
      ?auto_13870 - CITY
      ?auto_13872 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13871 ?auto_13873 ) ( not ( = ?auto_13866 ?auto_13869 ) ) ( not ( = ?auto_13873 ?auto_13871 ) ) ( not ( = ?auto_13867 ?auto_13868 ) ) ( PERSON-AT ?auto_13868 ?auto_13869 ) ( not ( = ?auto_13866 ?auto_13870 ) ) ( not ( = ?auto_13869 ?auto_13870 ) ) ( PERSON-AT ?auto_13867 ?auto_13870 ) ( AIRCRAFT-AT ?auto_13872 ?auto_13866 ) ( FUEL-LEVEL ?auto_13872 ?auto_13871 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_13868 ?auto_13866 )
      ( FLY-2PPL-VERIFY ?auto_13867 ?auto_13868 ?auto_13866 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_13875 - PERSON
      ?auto_13876 - PERSON
      ?auto_13874 - CITY
    )
    :vars
    (
      ?auto_13879 - FLEVEL
      ?auto_13878 - FLEVEL
      ?auto_13877 - CITY
      ?auto_13881 - CITY
      ?auto_13880 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_13879 ?auto_13878 ) ( not ( = ?auto_13874 ?auto_13877 ) ) ( not ( = ?auto_13878 ?auto_13879 ) ) ( not ( = ?auto_13876 ?auto_13875 ) ) ( PERSON-AT ?auto_13875 ?auto_13877 ) ( not ( = ?auto_13874 ?auto_13881 ) ) ( not ( = ?auto_13877 ?auto_13881 ) ) ( PERSON-AT ?auto_13876 ?auto_13881 ) ( AIRCRAFT-AT ?auto_13880 ?auto_13874 ) ( FUEL-LEVEL ?auto_13880 ?auto_13879 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_13876 ?auto_13875 ?auto_13874 )
      ( FLY-2PPL-VERIFY ?auto_13875 ?auto_13876 ?auto_13874 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_14049 - PERSON
      ?auto_14048 - CITY
    )
    :vars
    (
      ?auto_14050 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14049 ?auto_14050 ) ( AIRCRAFT-AT ?auto_14050 ?auto_14048 ) )
    :subtasks
    ( ( !DEBARK ?auto_14049 ?auto_14050 ?auto_14048 )
      ( FLY-1PPL-VERIFY ?auto_14049 ?auto_14048 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14052 - PERSON
      ?auto_14053 - PERSON
      ?auto_14051 - CITY
    )
    :vars
    (
      ?auto_14054 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14053 ?auto_14054 ) ( AIRCRAFT-AT ?auto_14054 ?auto_14051 ) ( PERSON-AT ?auto_14052 ?auto_14051 ) ( not ( = ?auto_14052 ?auto_14053 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14053 ?auto_14051 )
      ( FLY-2PPL-VERIFY ?auto_14052 ?auto_14053 ?auto_14051 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14056 - PERSON
      ?auto_14057 - PERSON
      ?auto_14055 - CITY
    )
    :vars
    (
      ?auto_14058 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14057 ?auto_14058 ) ( AIRCRAFT-AT ?auto_14058 ?auto_14055 ) ( PERSON-AT ?auto_14056 ?auto_14055 ) ( not ( = ?auto_14056 ?auto_14057 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14057 ?auto_14055 )
      ( FLY-2PPL-VERIFY ?auto_14056 ?auto_14057 ?auto_14055 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14060 - PERSON
      ?auto_14061 - PERSON
      ?auto_14059 - CITY
    )
    :vars
    (
      ?auto_14062 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14060 ?auto_14062 ) ( AIRCRAFT-AT ?auto_14062 ?auto_14059 ) ( PERSON-AT ?auto_14061 ?auto_14059 ) ( not ( = ?auto_14060 ?auto_14061 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14060 ?auto_14059 )
      ( FLY-2PPL-VERIFY ?auto_14060 ?auto_14061 ?auto_14059 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14064 - PERSON
      ?auto_14065 - PERSON
      ?auto_14063 - CITY
    )
    :vars
    (
      ?auto_14066 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14064 ?auto_14066 ) ( AIRCRAFT-AT ?auto_14066 ?auto_14063 ) ( PERSON-AT ?auto_14065 ?auto_14063 ) ( not ( = ?auto_14064 ?auto_14065 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14064 ?auto_14063 )
      ( FLY-2PPL-VERIFY ?auto_14064 ?auto_14065 ?auto_14063 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14072 - PERSON
      ?auto_14073 - PERSON
      ?auto_14074 - PERSON
      ?auto_14071 - CITY
    )
    :vars
    (
      ?auto_14075 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14074 ?auto_14075 ) ( AIRCRAFT-AT ?auto_14075 ?auto_14071 ) ( PERSON-AT ?auto_14072 ?auto_14071 ) ( PERSON-AT ?auto_14073 ?auto_14071 ) ( not ( = ?auto_14072 ?auto_14073 ) ) ( not ( = ?auto_14072 ?auto_14074 ) ) ( not ( = ?auto_14073 ?auto_14074 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14074 ?auto_14071 )
      ( FLY-3PPL-VERIFY ?auto_14072 ?auto_14073 ?auto_14074 ?auto_14071 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14077 - PERSON
      ?auto_14078 - PERSON
      ?auto_14079 - PERSON
      ?auto_14076 - CITY
    )
    :vars
    (
      ?auto_14080 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14079 ?auto_14080 ) ( AIRCRAFT-AT ?auto_14080 ?auto_14076 ) ( PERSON-AT ?auto_14077 ?auto_14076 ) ( PERSON-AT ?auto_14078 ?auto_14076 ) ( not ( = ?auto_14077 ?auto_14078 ) ) ( not ( = ?auto_14077 ?auto_14079 ) ) ( not ( = ?auto_14078 ?auto_14079 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14079 ?auto_14076 )
      ( FLY-3PPL-VERIFY ?auto_14077 ?auto_14078 ?auto_14079 ?auto_14076 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14082 - PERSON
      ?auto_14083 - PERSON
      ?auto_14084 - PERSON
      ?auto_14081 - CITY
    )
    :vars
    (
      ?auto_14085 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14083 ?auto_14085 ) ( AIRCRAFT-AT ?auto_14085 ?auto_14081 ) ( PERSON-AT ?auto_14082 ?auto_14081 ) ( PERSON-AT ?auto_14084 ?auto_14081 ) ( not ( = ?auto_14082 ?auto_14083 ) ) ( not ( = ?auto_14082 ?auto_14084 ) ) ( not ( = ?auto_14083 ?auto_14084 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14083 ?auto_14081 )
      ( FLY-3PPL-VERIFY ?auto_14082 ?auto_14083 ?auto_14084 ?auto_14081 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14087 - PERSON
      ?auto_14088 - PERSON
      ?auto_14089 - PERSON
      ?auto_14086 - CITY
    )
    :vars
    (
      ?auto_14090 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14088 ?auto_14090 ) ( AIRCRAFT-AT ?auto_14090 ?auto_14086 ) ( PERSON-AT ?auto_14087 ?auto_14086 ) ( PERSON-AT ?auto_14089 ?auto_14086 ) ( not ( = ?auto_14087 ?auto_14088 ) ) ( not ( = ?auto_14087 ?auto_14089 ) ) ( not ( = ?auto_14088 ?auto_14089 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14088 ?auto_14086 )
      ( FLY-3PPL-VERIFY ?auto_14087 ?auto_14088 ?auto_14089 ?auto_14086 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14097 - PERSON
      ?auto_14098 - PERSON
      ?auto_14099 - PERSON
      ?auto_14096 - CITY
    )
    :vars
    (
      ?auto_14100 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14099 ?auto_14100 ) ( AIRCRAFT-AT ?auto_14100 ?auto_14096 ) ( PERSON-AT ?auto_14097 ?auto_14096 ) ( PERSON-AT ?auto_14098 ?auto_14096 ) ( not ( = ?auto_14097 ?auto_14098 ) ) ( not ( = ?auto_14097 ?auto_14099 ) ) ( not ( = ?auto_14098 ?auto_14099 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14099 ?auto_14096 )
      ( FLY-3PPL-VERIFY ?auto_14097 ?auto_14098 ?auto_14099 ?auto_14096 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14102 - PERSON
      ?auto_14103 - PERSON
      ?auto_14104 - PERSON
      ?auto_14101 - CITY
    )
    :vars
    (
      ?auto_14105 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14104 ?auto_14105 ) ( AIRCRAFT-AT ?auto_14105 ?auto_14101 ) ( PERSON-AT ?auto_14102 ?auto_14101 ) ( PERSON-AT ?auto_14103 ?auto_14101 ) ( not ( = ?auto_14102 ?auto_14103 ) ) ( not ( = ?auto_14102 ?auto_14104 ) ) ( not ( = ?auto_14103 ?auto_14104 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14104 ?auto_14101 )
      ( FLY-3PPL-VERIFY ?auto_14102 ?auto_14103 ?auto_14104 ?auto_14101 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14107 - PERSON
      ?auto_14108 - PERSON
      ?auto_14109 - PERSON
      ?auto_14106 - CITY
    )
    :vars
    (
      ?auto_14110 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14108 ?auto_14110 ) ( AIRCRAFT-AT ?auto_14110 ?auto_14106 ) ( PERSON-AT ?auto_14107 ?auto_14106 ) ( PERSON-AT ?auto_14109 ?auto_14106 ) ( not ( = ?auto_14107 ?auto_14108 ) ) ( not ( = ?auto_14107 ?auto_14109 ) ) ( not ( = ?auto_14108 ?auto_14109 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14108 ?auto_14106 )
      ( FLY-3PPL-VERIFY ?auto_14107 ?auto_14108 ?auto_14109 ?auto_14106 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14112 - PERSON
      ?auto_14113 - PERSON
      ?auto_14114 - PERSON
      ?auto_14111 - CITY
    )
    :vars
    (
      ?auto_14115 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14113 ?auto_14115 ) ( AIRCRAFT-AT ?auto_14115 ?auto_14111 ) ( PERSON-AT ?auto_14112 ?auto_14111 ) ( PERSON-AT ?auto_14114 ?auto_14111 ) ( not ( = ?auto_14112 ?auto_14113 ) ) ( not ( = ?auto_14112 ?auto_14114 ) ) ( not ( = ?auto_14113 ?auto_14114 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14113 ?auto_14111 )
      ( FLY-3PPL-VERIFY ?auto_14112 ?auto_14113 ?auto_14114 ?auto_14111 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14122 - PERSON
      ?auto_14123 - PERSON
      ?auto_14124 - PERSON
      ?auto_14121 - CITY
    )
    :vars
    (
      ?auto_14125 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14122 ?auto_14125 ) ( AIRCRAFT-AT ?auto_14125 ?auto_14121 ) ( PERSON-AT ?auto_14123 ?auto_14121 ) ( PERSON-AT ?auto_14124 ?auto_14121 ) ( not ( = ?auto_14122 ?auto_14123 ) ) ( not ( = ?auto_14122 ?auto_14124 ) ) ( not ( = ?auto_14123 ?auto_14124 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14122 ?auto_14121 )
      ( FLY-3PPL-VERIFY ?auto_14122 ?auto_14123 ?auto_14124 ?auto_14121 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14127 - PERSON
      ?auto_14128 - PERSON
      ?auto_14129 - PERSON
      ?auto_14126 - CITY
    )
    :vars
    (
      ?auto_14130 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14127 ?auto_14130 ) ( AIRCRAFT-AT ?auto_14130 ?auto_14126 ) ( PERSON-AT ?auto_14128 ?auto_14126 ) ( PERSON-AT ?auto_14129 ?auto_14126 ) ( not ( = ?auto_14127 ?auto_14128 ) ) ( not ( = ?auto_14127 ?auto_14129 ) ) ( not ( = ?auto_14128 ?auto_14129 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14127 ?auto_14126 )
      ( FLY-3PPL-VERIFY ?auto_14127 ?auto_14128 ?auto_14129 ?auto_14126 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14137 - PERSON
      ?auto_14138 - PERSON
      ?auto_14139 - PERSON
      ?auto_14136 - CITY
    )
    :vars
    (
      ?auto_14140 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14137 ?auto_14140 ) ( AIRCRAFT-AT ?auto_14140 ?auto_14136 ) ( PERSON-AT ?auto_14138 ?auto_14136 ) ( PERSON-AT ?auto_14139 ?auto_14136 ) ( not ( = ?auto_14137 ?auto_14138 ) ) ( not ( = ?auto_14137 ?auto_14139 ) ) ( not ( = ?auto_14138 ?auto_14139 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14137 ?auto_14136 )
      ( FLY-3PPL-VERIFY ?auto_14137 ?auto_14138 ?auto_14139 ?auto_14136 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14142 - PERSON
      ?auto_14143 - PERSON
      ?auto_14144 - PERSON
      ?auto_14141 - CITY
    )
    :vars
    (
      ?auto_14145 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_14142 ?auto_14145 ) ( AIRCRAFT-AT ?auto_14145 ?auto_14141 ) ( PERSON-AT ?auto_14143 ?auto_14141 ) ( PERSON-AT ?auto_14144 ?auto_14141 ) ( not ( = ?auto_14142 ?auto_14143 ) ) ( not ( = ?auto_14142 ?auto_14144 ) ) ( not ( = ?auto_14143 ?auto_14144 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14142 ?auto_14141 )
      ( FLY-3PPL-VERIFY ?auto_14142 ?auto_14143 ?auto_14144 ?auto_14141 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_14167 - PERSON
      ?auto_14166 - CITY
    )
    :vars
    (
      ?auto_14168 - AIRCRAFT
      ?auto_14171 - CITY
      ?auto_14169 - FLEVEL
      ?auto_14170 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_14167 ?auto_14168 ) ( AIRCRAFT-AT ?auto_14168 ?auto_14171 ) ( FUEL-LEVEL ?auto_14168 ?auto_14169 ) ( NEXT ?auto_14170 ?auto_14169 ) ( not ( = ?auto_14166 ?auto_14171 ) ) ( not ( = ?auto_14169 ?auto_14170 ) ) )
    :subtasks
    ( ( !FLY ?auto_14168 ?auto_14171 ?auto_14166 ?auto_14169 ?auto_14170 )
      ( FLY-1PPL ?auto_14167 ?auto_14166 )
      ( FLY-1PPL-VERIFY ?auto_14167 ?auto_14166 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14173 - PERSON
      ?auto_14174 - PERSON
      ?auto_14172 - CITY
    )
    :vars
    (
      ?auto_14176 - AIRCRAFT
      ?auto_14178 - CITY
      ?auto_14177 - FLEVEL
      ?auto_14175 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_14174 ?auto_14176 ) ( AIRCRAFT-AT ?auto_14176 ?auto_14178 ) ( FUEL-LEVEL ?auto_14176 ?auto_14177 ) ( NEXT ?auto_14175 ?auto_14177 ) ( not ( = ?auto_14172 ?auto_14178 ) ) ( not ( = ?auto_14177 ?auto_14175 ) ) ( PERSON-AT ?auto_14173 ?auto_14172 ) ( not ( = ?auto_14173 ?auto_14174 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14174 ?auto_14172 )
      ( FLY-2PPL-VERIFY ?auto_14173 ?auto_14174 ?auto_14172 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14180 - PERSON
      ?auto_14181 - PERSON
      ?auto_14179 - CITY
    )
    :vars
    (
      ?auto_14184 - AIRCRAFT
      ?auto_14183 - CITY
      ?auto_14186 - FLEVEL
      ?auto_14182 - FLEVEL
      ?auto_14185 - PERSON
    )
    :precondition
    ( and ( IN ?auto_14181 ?auto_14184 ) ( AIRCRAFT-AT ?auto_14184 ?auto_14183 ) ( FUEL-LEVEL ?auto_14184 ?auto_14186 ) ( NEXT ?auto_14182 ?auto_14186 ) ( not ( = ?auto_14179 ?auto_14183 ) ) ( not ( = ?auto_14186 ?auto_14182 ) ) ( PERSON-AT ?auto_14185 ?auto_14179 ) ( not ( = ?auto_14185 ?auto_14181 ) ) ( PERSON-AT ?auto_14180 ?auto_14179 ) ( not ( = ?auto_14180 ?auto_14181 ) ) ( not ( = ?auto_14180 ?auto_14185 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14185 ?auto_14181 ?auto_14179 )
      ( FLY-2PPL-VERIFY ?auto_14180 ?auto_14181 ?auto_14179 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14188 - PERSON
      ?auto_14189 - PERSON
      ?auto_14187 - CITY
    )
    :vars
    (
      ?auto_14192 - AIRCRAFT
      ?auto_14191 - CITY
      ?auto_14193 - FLEVEL
      ?auto_14190 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_14188 ?auto_14192 ) ( AIRCRAFT-AT ?auto_14192 ?auto_14191 ) ( FUEL-LEVEL ?auto_14192 ?auto_14193 ) ( NEXT ?auto_14190 ?auto_14193 ) ( not ( = ?auto_14187 ?auto_14191 ) ) ( not ( = ?auto_14193 ?auto_14190 ) ) ( PERSON-AT ?auto_14189 ?auto_14187 ) ( not ( = ?auto_14189 ?auto_14188 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14189 ?auto_14188 ?auto_14187 )
      ( FLY-2PPL-VERIFY ?auto_14188 ?auto_14189 ?auto_14187 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14195 - PERSON
      ?auto_14196 - PERSON
      ?auto_14194 - CITY
    )
    :vars
    (
      ?auto_14199 - AIRCRAFT
      ?auto_14198 - CITY
      ?auto_14201 - FLEVEL
      ?auto_14197 - FLEVEL
      ?auto_14200 - PERSON
    )
    :precondition
    ( and ( IN ?auto_14195 ?auto_14199 ) ( AIRCRAFT-AT ?auto_14199 ?auto_14198 ) ( FUEL-LEVEL ?auto_14199 ?auto_14201 ) ( NEXT ?auto_14197 ?auto_14201 ) ( not ( = ?auto_14194 ?auto_14198 ) ) ( not ( = ?auto_14201 ?auto_14197 ) ) ( PERSON-AT ?auto_14200 ?auto_14194 ) ( not ( = ?auto_14200 ?auto_14195 ) ) ( PERSON-AT ?auto_14196 ?auto_14194 ) ( not ( = ?auto_14195 ?auto_14196 ) ) ( not ( = ?auto_14196 ?auto_14200 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14200 ?auto_14195 ?auto_14194 )
      ( FLY-2PPL-VERIFY ?auto_14195 ?auto_14196 ?auto_14194 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14211 - PERSON
      ?auto_14212 - PERSON
      ?auto_14213 - PERSON
      ?auto_14210 - CITY
    )
    :vars
    (
      ?auto_14216 - AIRCRAFT
      ?auto_14215 - CITY
      ?auto_14217 - FLEVEL
      ?auto_14214 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_14213 ?auto_14216 ) ( AIRCRAFT-AT ?auto_14216 ?auto_14215 ) ( FUEL-LEVEL ?auto_14216 ?auto_14217 ) ( NEXT ?auto_14214 ?auto_14217 ) ( not ( = ?auto_14210 ?auto_14215 ) ) ( not ( = ?auto_14217 ?auto_14214 ) ) ( PERSON-AT ?auto_14212 ?auto_14210 ) ( not ( = ?auto_14212 ?auto_14213 ) ) ( PERSON-AT ?auto_14211 ?auto_14210 ) ( not ( = ?auto_14211 ?auto_14212 ) ) ( not ( = ?auto_14211 ?auto_14213 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14212 ?auto_14213 ?auto_14210 )
      ( FLY-3PPL-VERIFY ?auto_14211 ?auto_14212 ?auto_14213 ?auto_14210 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14219 - PERSON
      ?auto_14220 - PERSON
      ?auto_14221 - PERSON
      ?auto_14218 - CITY
    )
    :vars
    (
      ?auto_14224 - AIRCRAFT
      ?auto_14223 - CITY
      ?auto_14225 - FLEVEL
      ?auto_14222 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_14221 ?auto_14224 ) ( AIRCRAFT-AT ?auto_14224 ?auto_14223 ) ( FUEL-LEVEL ?auto_14224 ?auto_14225 ) ( NEXT ?auto_14222 ?auto_14225 ) ( not ( = ?auto_14218 ?auto_14223 ) ) ( not ( = ?auto_14225 ?auto_14222 ) ) ( PERSON-AT ?auto_14219 ?auto_14218 ) ( not ( = ?auto_14219 ?auto_14221 ) ) ( PERSON-AT ?auto_14220 ?auto_14218 ) ( not ( = ?auto_14219 ?auto_14220 ) ) ( not ( = ?auto_14220 ?auto_14221 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14219 ?auto_14221 ?auto_14218 )
      ( FLY-3PPL-VERIFY ?auto_14219 ?auto_14220 ?auto_14221 ?auto_14218 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14227 - PERSON
      ?auto_14228 - PERSON
      ?auto_14229 - PERSON
      ?auto_14226 - CITY
    )
    :vars
    (
      ?auto_14232 - AIRCRAFT
      ?auto_14231 - CITY
      ?auto_14233 - FLEVEL
      ?auto_14230 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_14228 ?auto_14232 ) ( AIRCRAFT-AT ?auto_14232 ?auto_14231 ) ( FUEL-LEVEL ?auto_14232 ?auto_14233 ) ( NEXT ?auto_14230 ?auto_14233 ) ( not ( = ?auto_14226 ?auto_14231 ) ) ( not ( = ?auto_14233 ?auto_14230 ) ) ( PERSON-AT ?auto_14229 ?auto_14226 ) ( not ( = ?auto_14229 ?auto_14228 ) ) ( PERSON-AT ?auto_14227 ?auto_14226 ) ( not ( = ?auto_14227 ?auto_14228 ) ) ( not ( = ?auto_14227 ?auto_14229 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14229 ?auto_14228 ?auto_14226 )
      ( FLY-3PPL-VERIFY ?auto_14227 ?auto_14228 ?auto_14229 ?auto_14226 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14235 - PERSON
      ?auto_14236 - PERSON
      ?auto_14237 - PERSON
      ?auto_14234 - CITY
    )
    :vars
    (
      ?auto_14240 - AIRCRAFT
      ?auto_14239 - CITY
      ?auto_14241 - FLEVEL
      ?auto_14238 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_14236 ?auto_14240 ) ( AIRCRAFT-AT ?auto_14240 ?auto_14239 ) ( FUEL-LEVEL ?auto_14240 ?auto_14241 ) ( NEXT ?auto_14238 ?auto_14241 ) ( not ( = ?auto_14234 ?auto_14239 ) ) ( not ( = ?auto_14241 ?auto_14238 ) ) ( PERSON-AT ?auto_14235 ?auto_14234 ) ( not ( = ?auto_14235 ?auto_14236 ) ) ( PERSON-AT ?auto_14237 ?auto_14234 ) ( not ( = ?auto_14235 ?auto_14237 ) ) ( not ( = ?auto_14236 ?auto_14237 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14235 ?auto_14236 ?auto_14234 )
      ( FLY-3PPL-VERIFY ?auto_14235 ?auto_14236 ?auto_14237 ?auto_14234 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14251 - PERSON
      ?auto_14252 - PERSON
      ?auto_14253 - PERSON
      ?auto_14250 - CITY
    )
    :vars
    (
      ?auto_14256 - AIRCRAFT
      ?auto_14255 - CITY
      ?auto_14257 - FLEVEL
      ?auto_14254 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_14253 ?auto_14256 ) ( AIRCRAFT-AT ?auto_14256 ?auto_14255 ) ( FUEL-LEVEL ?auto_14256 ?auto_14257 ) ( NEXT ?auto_14254 ?auto_14257 ) ( not ( = ?auto_14250 ?auto_14255 ) ) ( not ( = ?auto_14257 ?auto_14254 ) ) ( PERSON-AT ?auto_14252 ?auto_14250 ) ( not ( = ?auto_14252 ?auto_14253 ) ) ( PERSON-AT ?auto_14251 ?auto_14250 ) ( not ( = ?auto_14251 ?auto_14252 ) ) ( not ( = ?auto_14251 ?auto_14253 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14252 ?auto_14253 ?auto_14250 )
      ( FLY-3PPL-VERIFY ?auto_14251 ?auto_14252 ?auto_14253 ?auto_14250 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14259 - PERSON
      ?auto_14260 - PERSON
      ?auto_14261 - PERSON
      ?auto_14258 - CITY
    )
    :vars
    (
      ?auto_14264 - AIRCRAFT
      ?auto_14263 - CITY
      ?auto_14266 - FLEVEL
      ?auto_14262 - FLEVEL
      ?auto_14265 - PERSON
    )
    :precondition
    ( and ( IN ?auto_14261 ?auto_14264 ) ( AIRCRAFT-AT ?auto_14264 ?auto_14263 ) ( FUEL-LEVEL ?auto_14264 ?auto_14266 ) ( NEXT ?auto_14262 ?auto_14266 ) ( not ( = ?auto_14258 ?auto_14263 ) ) ( not ( = ?auto_14266 ?auto_14262 ) ) ( PERSON-AT ?auto_14265 ?auto_14258 ) ( not ( = ?auto_14265 ?auto_14261 ) ) ( PERSON-AT ?auto_14259 ?auto_14258 ) ( PERSON-AT ?auto_14260 ?auto_14258 ) ( not ( = ?auto_14259 ?auto_14260 ) ) ( not ( = ?auto_14259 ?auto_14261 ) ) ( not ( = ?auto_14259 ?auto_14265 ) ) ( not ( = ?auto_14260 ?auto_14261 ) ) ( not ( = ?auto_14260 ?auto_14265 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14265 ?auto_14261 ?auto_14258 )
      ( FLY-3PPL-VERIFY ?auto_14259 ?auto_14260 ?auto_14261 ?auto_14258 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14268 - PERSON
      ?auto_14269 - PERSON
      ?auto_14270 - PERSON
      ?auto_14267 - CITY
    )
    :vars
    (
      ?auto_14273 - AIRCRAFT
      ?auto_14272 - CITY
      ?auto_14274 - FLEVEL
      ?auto_14271 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_14269 ?auto_14273 ) ( AIRCRAFT-AT ?auto_14273 ?auto_14272 ) ( FUEL-LEVEL ?auto_14273 ?auto_14274 ) ( NEXT ?auto_14271 ?auto_14274 ) ( not ( = ?auto_14267 ?auto_14272 ) ) ( not ( = ?auto_14274 ?auto_14271 ) ) ( PERSON-AT ?auto_14270 ?auto_14267 ) ( not ( = ?auto_14270 ?auto_14269 ) ) ( PERSON-AT ?auto_14268 ?auto_14267 ) ( not ( = ?auto_14268 ?auto_14269 ) ) ( not ( = ?auto_14268 ?auto_14270 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14270 ?auto_14269 ?auto_14267 )
      ( FLY-3PPL-VERIFY ?auto_14268 ?auto_14269 ?auto_14270 ?auto_14267 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14276 - PERSON
      ?auto_14277 - PERSON
      ?auto_14278 - PERSON
      ?auto_14275 - CITY
    )
    :vars
    (
      ?auto_14281 - AIRCRAFT
      ?auto_14280 - CITY
      ?auto_14283 - FLEVEL
      ?auto_14279 - FLEVEL
      ?auto_14282 - PERSON
    )
    :precondition
    ( and ( IN ?auto_14277 ?auto_14281 ) ( AIRCRAFT-AT ?auto_14281 ?auto_14280 ) ( FUEL-LEVEL ?auto_14281 ?auto_14283 ) ( NEXT ?auto_14279 ?auto_14283 ) ( not ( = ?auto_14275 ?auto_14280 ) ) ( not ( = ?auto_14283 ?auto_14279 ) ) ( PERSON-AT ?auto_14282 ?auto_14275 ) ( not ( = ?auto_14282 ?auto_14277 ) ) ( PERSON-AT ?auto_14276 ?auto_14275 ) ( PERSON-AT ?auto_14278 ?auto_14275 ) ( not ( = ?auto_14276 ?auto_14277 ) ) ( not ( = ?auto_14276 ?auto_14278 ) ) ( not ( = ?auto_14276 ?auto_14282 ) ) ( not ( = ?auto_14277 ?auto_14278 ) ) ( not ( = ?auto_14278 ?auto_14282 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14282 ?auto_14277 ?auto_14275 )
      ( FLY-3PPL-VERIFY ?auto_14276 ?auto_14277 ?auto_14278 ?auto_14275 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14294 - PERSON
      ?auto_14295 - PERSON
      ?auto_14296 - PERSON
      ?auto_14293 - CITY
    )
    :vars
    (
      ?auto_14299 - AIRCRAFT
      ?auto_14298 - CITY
      ?auto_14300 - FLEVEL
      ?auto_14297 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_14294 ?auto_14299 ) ( AIRCRAFT-AT ?auto_14299 ?auto_14298 ) ( FUEL-LEVEL ?auto_14299 ?auto_14300 ) ( NEXT ?auto_14297 ?auto_14300 ) ( not ( = ?auto_14293 ?auto_14298 ) ) ( not ( = ?auto_14300 ?auto_14297 ) ) ( PERSON-AT ?auto_14295 ?auto_14293 ) ( not ( = ?auto_14295 ?auto_14294 ) ) ( PERSON-AT ?auto_14296 ?auto_14293 ) ( not ( = ?auto_14294 ?auto_14296 ) ) ( not ( = ?auto_14295 ?auto_14296 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14295 ?auto_14294 ?auto_14293 )
      ( FLY-3PPL-VERIFY ?auto_14294 ?auto_14295 ?auto_14296 ?auto_14293 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14302 - PERSON
      ?auto_14303 - PERSON
      ?auto_14304 - PERSON
      ?auto_14301 - CITY
    )
    :vars
    (
      ?auto_14307 - AIRCRAFT
      ?auto_14306 - CITY
      ?auto_14308 - FLEVEL
      ?auto_14305 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_14302 ?auto_14307 ) ( AIRCRAFT-AT ?auto_14307 ?auto_14306 ) ( FUEL-LEVEL ?auto_14307 ?auto_14308 ) ( NEXT ?auto_14305 ?auto_14308 ) ( not ( = ?auto_14301 ?auto_14306 ) ) ( not ( = ?auto_14308 ?auto_14305 ) ) ( PERSON-AT ?auto_14303 ?auto_14301 ) ( not ( = ?auto_14303 ?auto_14302 ) ) ( PERSON-AT ?auto_14304 ?auto_14301 ) ( not ( = ?auto_14302 ?auto_14304 ) ) ( not ( = ?auto_14303 ?auto_14304 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14303 ?auto_14302 ?auto_14301 )
      ( FLY-3PPL-VERIFY ?auto_14302 ?auto_14303 ?auto_14304 ?auto_14301 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14318 - PERSON
      ?auto_14319 - PERSON
      ?auto_14320 - PERSON
      ?auto_14317 - CITY
    )
    :vars
    (
      ?auto_14323 - AIRCRAFT
      ?auto_14322 - CITY
      ?auto_14324 - FLEVEL
      ?auto_14321 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_14318 ?auto_14323 ) ( AIRCRAFT-AT ?auto_14323 ?auto_14322 ) ( FUEL-LEVEL ?auto_14323 ?auto_14324 ) ( NEXT ?auto_14321 ?auto_14324 ) ( not ( = ?auto_14317 ?auto_14322 ) ) ( not ( = ?auto_14324 ?auto_14321 ) ) ( PERSON-AT ?auto_14320 ?auto_14317 ) ( not ( = ?auto_14320 ?auto_14318 ) ) ( PERSON-AT ?auto_14319 ?auto_14317 ) ( not ( = ?auto_14318 ?auto_14319 ) ) ( not ( = ?auto_14319 ?auto_14320 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14320 ?auto_14318 ?auto_14317 )
      ( FLY-3PPL-VERIFY ?auto_14318 ?auto_14319 ?auto_14320 ?auto_14317 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14326 - PERSON
      ?auto_14327 - PERSON
      ?auto_14328 - PERSON
      ?auto_14325 - CITY
    )
    :vars
    (
      ?auto_14331 - AIRCRAFT
      ?auto_14330 - CITY
      ?auto_14333 - FLEVEL
      ?auto_14329 - FLEVEL
      ?auto_14332 - PERSON
    )
    :precondition
    ( and ( IN ?auto_14326 ?auto_14331 ) ( AIRCRAFT-AT ?auto_14331 ?auto_14330 ) ( FUEL-LEVEL ?auto_14331 ?auto_14333 ) ( NEXT ?auto_14329 ?auto_14333 ) ( not ( = ?auto_14325 ?auto_14330 ) ) ( not ( = ?auto_14333 ?auto_14329 ) ) ( PERSON-AT ?auto_14332 ?auto_14325 ) ( not ( = ?auto_14332 ?auto_14326 ) ) ( PERSON-AT ?auto_14327 ?auto_14325 ) ( PERSON-AT ?auto_14328 ?auto_14325 ) ( not ( = ?auto_14326 ?auto_14327 ) ) ( not ( = ?auto_14326 ?auto_14328 ) ) ( not ( = ?auto_14327 ?auto_14328 ) ) ( not ( = ?auto_14327 ?auto_14332 ) ) ( not ( = ?auto_14328 ?auto_14332 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14332 ?auto_14326 ?auto_14325 )
      ( FLY-3PPL-VERIFY ?auto_14326 ?auto_14327 ?auto_14328 ?auto_14325 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_14370 - PERSON
      ?auto_14369 - CITY
    )
    :vars
    (
      ?auto_14373 - AIRCRAFT
      ?auto_14372 - CITY
      ?auto_14375 - FLEVEL
      ?auto_14371 - FLEVEL
      ?auto_14374 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14373 ?auto_14372 ) ( FUEL-LEVEL ?auto_14373 ?auto_14375 ) ( NEXT ?auto_14371 ?auto_14375 ) ( not ( = ?auto_14369 ?auto_14372 ) ) ( not ( = ?auto_14375 ?auto_14371 ) ) ( PERSON-AT ?auto_14374 ?auto_14369 ) ( not ( = ?auto_14374 ?auto_14370 ) ) ( PERSON-AT ?auto_14370 ?auto_14372 ) )
    :subtasks
    ( ( !BOARD ?auto_14370 ?auto_14373 ?auto_14372 )
      ( FLY-2PPL ?auto_14374 ?auto_14370 ?auto_14369 )
      ( FLY-1PPL-VERIFY ?auto_14370 ?auto_14369 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14377 - PERSON
      ?auto_14378 - PERSON
      ?auto_14376 - CITY
    )
    :vars
    (
      ?auto_14379 - AIRCRAFT
      ?auto_14381 - CITY
      ?auto_14382 - FLEVEL
      ?auto_14380 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14379 ?auto_14381 ) ( FUEL-LEVEL ?auto_14379 ?auto_14382 ) ( NEXT ?auto_14380 ?auto_14382 ) ( not ( = ?auto_14376 ?auto_14381 ) ) ( not ( = ?auto_14382 ?auto_14380 ) ) ( PERSON-AT ?auto_14377 ?auto_14376 ) ( not ( = ?auto_14377 ?auto_14378 ) ) ( PERSON-AT ?auto_14378 ?auto_14381 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14378 ?auto_14376 )
      ( FLY-2PPL-VERIFY ?auto_14377 ?auto_14378 ?auto_14376 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14384 - PERSON
      ?auto_14385 - PERSON
      ?auto_14383 - CITY
    )
    :vars
    (
      ?auto_14388 - AIRCRAFT
      ?auto_14389 - CITY
      ?auto_14387 - FLEVEL
      ?auto_14386 - FLEVEL
      ?auto_14390 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14388 ?auto_14389 ) ( FUEL-LEVEL ?auto_14388 ?auto_14387 ) ( NEXT ?auto_14386 ?auto_14387 ) ( not ( = ?auto_14383 ?auto_14389 ) ) ( not ( = ?auto_14387 ?auto_14386 ) ) ( PERSON-AT ?auto_14390 ?auto_14383 ) ( not ( = ?auto_14390 ?auto_14385 ) ) ( PERSON-AT ?auto_14385 ?auto_14389 ) ( PERSON-AT ?auto_14384 ?auto_14383 ) ( not ( = ?auto_14384 ?auto_14385 ) ) ( not ( = ?auto_14384 ?auto_14390 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14390 ?auto_14385 ?auto_14383 )
      ( FLY-2PPL-VERIFY ?auto_14384 ?auto_14385 ?auto_14383 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14392 - PERSON
      ?auto_14393 - PERSON
      ?auto_14391 - CITY
    )
    :vars
    (
      ?auto_14396 - AIRCRAFT
      ?auto_14397 - CITY
      ?auto_14395 - FLEVEL
      ?auto_14394 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14396 ?auto_14397 ) ( FUEL-LEVEL ?auto_14396 ?auto_14395 ) ( NEXT ?auto_14394 ?auto_14395 ) ( not ( = ?auto_14391 ?auto_14397 ) ) ( not ( = ?auto_14395 ?auto_14394 ) ) ( PERSON-AT ?auto_14393 ?auto_14391 ) ( not ( = ?auto_14393 ?auto_14392 ) ) ( PERSON-AT ?auto_14392 ?auto_14397 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14393 ?auto_14392 ?auto_14391 )
      ( FLY-2PPL-VERIFY ?auto_14392 ?auto_14393 ?auto_14391 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14399 - PERSON
      ?auto_14400 - PERSON
      ?auto_14398 - CITY
    )
    :vars
    (
      ?auto_14403 - AIRCRAFT
      ?auto_14404 - CITY
      ?auto_14402 - FLEVEL
      ?auto_14401 - FLEVEL
      ?auto_14405 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14403 ?auto_14404 ) ( FUEL-LEVEL ?auto_14403 ?auto_14402 ) ( NEXT ?auto_14401 ?auto_14402 ) ( not ( = ?auto_14398 ?auto_14404 ) ) ( not ( = ?auto_14402 ?auto_14401 ) ) ( PERSON-AT ?auto_14405 ?auto_14398 ) ( not ( = ?auto_14405 ?auto_14399 ) ) ( PERSON-AT ?auto_14399 ?auto_14404 ) ( PERSON-AT ?auto_14400 ?auto_14398 ) ( not ( = ?auto_14399 ?auto_14400 ) ) ( not ( = ?auto_14400 ?auto_14405 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14405 ?auto_14399 ?auto_14398 )
      ( FLY-2PPL-VERIFY ?auto_14399 ?auto_14400 ?auto_14398 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14415 - PERSON
      ?auto_14416 - PERSON
      ?auto_14417 - PERSON
      ?auto_14414 - CITY
    )
    :vars
    (
      ?auto_14420 - AIRCRAFT
      ?auto_14421 - CITY
      ?auto_14419 - FLEVEL
      ?auto_14418 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14420 ?auto_14421 ) ( FUEL-LEVEL ?auto_14420 ?auto_14419 ) ( NEXT ?auto_14418 ?auto_14419 ) ( not ( = ?auto_14414 ?auto_14421 ) ) ( not ( = ?auto_14419 ?auto_14418 ) ) ( PERSON-AT ?auto_14416 ?auto_14414 ) ( not ( = ?auto_14416 ?auto_14417 ) ) ( PERSON-AT ?auto_14417 ?auto_14421 ) ( PERSON-AT ?auto_14415 ?auto_14414 ) ( not ( = ?auto_14415 ?auto_14416 ) ) ( not ( = ?auto_14415 ?auto_14417 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14416 ?auto_14417 ?auto_14414 )
      ( FLY-3PPL-VERIFY ?auto_14415 ?auto_14416 ?auto_14417 ?auto_14414 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14423 - PERSON
      ?auto_14424 - PERSON
      ?auto_14425 - PERSON
      ?auto_14422 - CITY
    )
    :vars
    (
      ?auto_14428 - AIRCRAFT
      ?auto_14429 - CITY
      ?auto_14427 - FLEVEL
      ?auto_14426 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14428 ?auto_14429 ) ( FUEL-LEVEL ?auto_14428 ?auto_14427 ) ( NEXT ?auto_14426 ?auto_14427 ) ( not ( = ?auto_14422 ?auto_14429 ) ) ( not ( = ?auto_14427 ?auto_14426 ) ) ( PERSON-AT ?auto_14423 ?auto_14422 ) ( not ( = ?auto_14423 ?auto_14425 ) ) ( PERSON-AT ?auto_14425 ?auto_14429 ) ( PERSON-AT ?auto_14424 ?auto_14422 ) ( not ( = ?auto_14423 ?auto_14424 ) ) ( not ( = ?auto_14424 ?auto_14425 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14423 ?auto_14425 ?auto_14422 )
      ( FLY-3PPL-VERIFY ?auto_14423 ?auto_14424 ?auto_14425 ?auto_14422 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14431 - PERSON
      ?auto_14432 - PERSON
      ?auto_14433 - PERSON
      ?auto_14430 - CITY
    )
    :vars
    (
      ?auto_14436 - AIRCRAFT
      ?auto_14437 - CITY
      ?auto_14435 - FLEVEL
      ?auto_14434 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14436 ?auto_14437 ) ( FUEL-LEVEL ?auto_14436 ?auto_14435 ) ( NEXT ?auto_14434 ?auto_14435 ) ( not ( = ?auto_14430 ?auto_14437 ) ) ( not ( = ?auto_14435 ?auto_14434 ) ) ( PERSON-AT ?auto_14433 ?auto_14430 ) ( not ( = ?auto_14433 ?auto_14432 ) ) ( PERSON-AT ?auto_14432 ?auto_14437 ) ( PERSON-AT ?auto_14431 ?auto_14430 ) ( not ( = ?auto_14431 ?auto_14432 ) ) ( not ( = ?auto_14431 ?auto_14433 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14433 ?auto_14432 ?auto_14430 )
      ( FLY-3PPL-VERIFY ?auto_14431 ?auto_14432 ?auto_14433 ?auto_14430 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14439 - PERSON
      ?auto_14440 - PERSON
      ?auto_14441 - PERSON
      ?auto_14438 - CITY
    )
    :vars
    (
      ?auto_14444 - AIRCRAFT
      ?auto_14445 - CITY
      ?auto_14443 - FLEVEL
      ?auto_14442 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14444 ?auto_14445 ) ( FUEL-LEVEL ?auto_14444 ?auto_14443 ) ( NEXT ?auto_14442 ?auto_14443 ) ( not ( = ?auto_14438 ?auto_14445 ) ) ( not ( = ?auto_14443 ?auto_14442 ) ) ( PERSON-AT ?auto_14439 ?auto_14438 ) ( not ( = ?auto_14439 ?auto_14440 ) ) ( PERSON-AT ?auto_14440 ?auto_14445 ) ( PERSON-AT ?auto_14441 ?auto_14438 ) ( not ( = ?auto_14439 ?auto_14441 ) ) ( not ( = ?auto_14440 ?auto_14441 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14439 ?auto_14440 ?auto_14438 )
      ( FLY-3PPL-VERIFY ?auto_14439 ?auto_14440 ?auto_14441 ?auto_14438 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14455 - PERSON
      ?auto_14456 - PERSON
      ?auto_14457 - PERSON
      ?auto_14454 - CITY
    )
    :vars
    (
      ?auto_14460 - AIRCRAFT
      ?auto_14461 - CITY
      ?auto_14459 - FLEVEL
      ?auto_14458 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14460 ?auto_14461 ) ( FUEL-LEVEL ?auto_14460 ?auto_14459 ) ( NEXT ?auto_14458 ?auto_14459 ) ( not ( = ?auto_14454 ?auto_14461 ) ) ( not ( = ?auto_14459 ?auto_14458 ) ) ( PERSON-AT ?auto_14456 ?auto_14454 ) ( not ( = ?auto_14456 ?auto_14457 ) ) ( PERSON-AT ?auto_14457 ?auto_14461 ) ( PERSON-AT ?auto_14455 ?auto_14454 ) ( not ( = ?auto_14455 ?auto_14456 ) ) ( not ( = ?auto_14455 ?auto_14457 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14456 ?auto_14457 ?auto_14454 )
      ( FLY-3PPL-VERIFY ?auto_14455 ?auto_14456 ?auto_14457 ?auto_14454 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14463 - PERSON
      ?auto_14464 - PERSON
      ?auto_14465 - PERSON
      ?auto_14462 - CITY
    )
    :vars
    (
      ?auto_14468 - AIRCRAFT
      ?auto_14469 - CITY
      ?auto_14467 - FLEVEL
      ?auto_14466 - FLEVEL
      ?auto_14470 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14468 ?auto_14469 ) ( FUEL-LEVEL ?auto_14468 ?auto_14467 ) ( NEXT ?auto_14466 ?auto_14467 ) ( not ( = ?auto_14462 ?auto_14469 ) ) ( not ( = ?auto_14467 ?auto_14466 ) ) ( PERSON-AT ?auto_14470 ?auto_14462 ) ( not ( = ?auto_14470 ?auto_14465 ) ) ( PERSON-AT ?auto_14465 ?auto_14469 ) ( PERSON-AT ?auto_14463 ?auto_14462 ) ( PERSON-AT ?auto_14464 ?auto_14462 ) ( not ( = ?auto_14463 ?auto_14464 ) ) ( not ( = ?auto_14463 ?auto_14465 ) ) ( not ( = ?auto_14463 ?auto_14470 ) ) ( not ( = ?auto_14464 ?auto_14465 ) ) ( not ( = ?auto_14464 ?auto_14470 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14470 ?auto_14465 ?auto_14462 )
      ( FLY-3PPL-VERIFY ?auto_14463 ?auto_14464 ?auto_14465 ?auto_14462 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14472 - PERSON
      ?auto_14473 - PERSON
      ?auto_14474 - PERSON
      ?auto_14471 - CITY
    )
    :vars
    (
      ?auto_14477 - AIRCRAFT
      ?auto_14478 - CITY
      ?auto_14476 - FLEVEL
      ?auto_14475 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14477 ?auto_14478 ) ( FUEL-LEVEL ?auto_14477 ?auto_14476 ) ( NEXT ?auto_14475 ?auto_14476 ) ( not ( = ?auto_14471 ?auto_14478 ) ) ( not ( = ?auto_14476 ?auto_14475 ) ) ( PERSON-AT ?auto_14474 ?auto_14471 ) ( not ( = ?auto_14474 ?auto_14473 ) ) ( PERSON-AT ?auto_14473 ?auto_14478 ) ( PERSON-AT ?auto_14472 ?auto_14471 ) ( not ( = ?auto_14472 ?auto_14473 ) ) ( not ( = ?auto_14472 ?auto_14474 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14474 ?auto_14473 ?auto_14471 )
      ( FLY-3PPL-VERIFY ?auto_14472 ?auto_14473 ?auto_14474 ?auto_14471 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14480 - PERSON
      ?auto_14481 - PERSON
      ?auto_14482 - PERSON
      ?auto_14479 - CITY
    )
    :vars
    (
      ?auto_14485 - AIRCRAFT
      ?auto_14486 - CITY
      ?auto_14484 - FLEVEL
      ?auto_14483 - FLEVEL
      ?auto_14487 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14485 ?auto_14486 ) ( FUEL-LEVEL ?auto_14485 ?auto_14484 ) ( NEXT ?auto_14483 ?auto_14484 ) ( not ( = ?auto_14479 ?auto_14486 ) ) ( not ( = ?auto_14484 ?auto_14483 ) ) ( PERSON-AT ?auto_14487 ?auto_14479 ) ( not ( = ?auto_14487 ?auto_14481 ) ) ( PERSON-AT ?auto_14481 ?auto_14486 ) ( PERSON-AT ?auto_14480 ?auto_14479 ) ( PERSON-AT ?auto_14482 ?auto_14479 ) ( not ( = ?auto_14480 ?auto_14481 ) ) ( not ( = ?auto_14480 ?auto_14482 ) ) ( not ( = ?auto_14480 ?auto_14487 ) ) ( not ( = ?auto_14481 ?auto_14482 ) ) ( not ( = ?auto_14482 ?auto_14487 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14487 ?auto_14481 ?auto_14479 )
      ( FLY-3PPL-VERIFY ?auto_14480 ?auto_14481 ?auto_14482 ?auto_14479 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14498 - PERSON
      ?auto_14499 - PERSON
      ?auto_14500 - PERSON
      ?auto_14497 - CITY
    )
    :vars
    (
      ?auto_14503 - AIRCRAFT
      ?auto_14504 - CITY
      ?auto_14502 - FLEVEL
      ?auto_14501 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14503 ?auto_14504 ) ( FUEL-LEVEL ?auto_14503 ?auto_14502 ) ( NEXT ?auto_14501 ?auto_14502 ) ( not ( = ?auto_14497 ?auto_14504 ) ) ( not ( = ?auto_14502 ?auto_14501 ) ) ( PERSON-AT ?auto_14500 ?auto_14497 ) ( not ( = ?auto_14500 ?auto_14498 ) ) ( PERSON-AT ?auto_14498 ?auto_14504 ) ( PERSON-AT ?auto_14499 ?auto_14497 ) ( not ( = ?auto_14498 ?auto_14499 ) ) ( not ( = ?auto_14499 ?auto_14500 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14500 ?auto_14498 ?auto_14497 )
      ( FLY-3PPL-VERIFY ?auto_14498 ?auto_14499 ?auto_14500 ?auto_14497 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14506 - PERSON
      ?auto_14507 - PERSON
      ?auto_14508 - PERSON
      ?auto_14505 - CITY
    )
    :vars
    (
      ?auto_14511 - AIRCRAFT
      ?auto_14512 - CITY
      ?auto_14510 - FLEVEL
      ?auto_14509 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14511 ?auto_14512 ) ( FUEL-LEVEL ?auto_14511 ?auto_14510 ) ( NEXT ?auto_14509 ?auto_14510 ) ( not ( = ?auto_14505 ?auto_14512 ) ) ( not ( = ?auto_14510 ?auto_14509 ) ) ( PERSON-AT ?auto_14507 ?auto_14505 ) ( not ( = ?auto_14507 ?auto_14506 ) ) ( PERSON-AT ?auto_14506 ?auto_14512 ) ( PERSON-AT ?auto_14508 ?auto_14505 ) ( not ( = ?auto_14506 ?auto_14508 ) ) ( not ( = ?auto_14507 ?auto_14508 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14507 ?auto_14506 ?auto_14505 )
      ( FLY-3PPL-VERIFY ?auto_14506 ?auto_14507 ?auto_14508 ?auto_14505 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14522 - PERSON
      ?auto_14523 - PERSON
      ?auto_14524 - PERSON
      ?auto_14521 - CITY
    )
    :vars
    (
      ?auto_14527 - AIRCRAFT
      ?auto_14528 - CITY
      ?auto_14526 - FLEVEL
      ?auto_14525 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14527 ?auto_14528 ) ( FUEL-LEVEL ?auto_14527 ?auto_14526 ) ( NEXT ?auto_14525 ?auto_14526 ) ( not ( = ?auto_14521 ?auto_14528 ) ) ( not ( = ?auto_14526 ?auto_14525 ) ) ( PERSON-AT ?auto_14524 ?auto_14521 ) ( not ( = ?auto_14524 ?auto_14522 ) ) ( PERSON-AT ?auto_14522 ?auto_14528 ) ( PERSON-AT ?auto_14523 ?auto_14521 ) ( not ( = ?auto_14522 ?auto_14523 ) ) ( not ( = ?auto_14523 ?auto_14524 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14524 ?auto_14522 ?auto_14521 )
      ( FLY-3PPL-VERIFY ?auto_14522 ?auto_14523 ?auto_14524 ?auto_14521 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14530 - PERSON
      ?auto_14531 - PERSON
      ?auto_14532 - PERSON
      ?auto_14529 - CITY
    )
    :vars
    (
      ?auto_14535 - AIRCRAFT
      ?auto_14536 - CITY
      ?auto_14534 - FLEVEL
      ?auto_14533 - FLEVEL
      ?auto_14537 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14535 ?auto_14536 ) ( FUEL-LEVEL ?auto_14535 ?auto_14534 ) ( NEXT ?auto_14533 ?auto_14534 ) ( not ( = ?auto_14529 ?auto_14536 ) ) ( not ( = ?auto_14534 ?auto_14533 ) ) ( PERSON-AT ?auto_14537 ?auto_14529 ) ( not ( = ?auto_14537 ?auto_14530 ) ) ( PERSON-AT ?auto_14530 ?auto_14536 ) ( PERSON-AT ?auto_14531 ?auto_14529 ) ( PERSON-AT ?auto_14532 ?auto_14529 ) ( not ( = ?auto_14530 ?auto_14531 ) ) ( not ( = ?auto_14530 ?auto_14532 ) ) ( not ( = ?auto_14531 ?auto_14532 ) ) ( not ( = ?auto_14531 ?auto_14537 ) ) ( not ( = ?auto_14532 ?auto_14537 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14537 ?auto_14530 ?auto_14529 )
      ( FLY-3PPL-VERIFY ?auto_14530 ?auto_14531 ?auto_14532 ?auto_14529 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_14574 - PERSON
      ?auto_14573 - CITY
    )
    :vars
    (
      ?auto_14577 - AIRCRAFT
      ?auto_14578 - CITY
      ?auto_14575 - FLEVEL
      ?auto_14576 - FLEVEL
      ?auto_14579 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14577 ?auto_14578 ) ( NEXT ?auto_14575 ?auto_14576 ) ( not ( = ?auto_14573 ?auto_14578 ) ) ( not ( = ?auto_14576 ?auto_14575 ) ) ( PERSON-AT ?auto_14579 ?auto_14573 ) ( not ( = ?auto_14579 ?auto_14574 ) ) ( PERSON-AT ?auto_14574 ?auto_14578 ) ( FUEL-LEVEL ?auto_14577 ?auto_14575 ) )
    :subtasks
    ( ( !REFUEL ?auto_14577 ?auto_14578 ?auto_14575 ?auto_14576 )
      ( FLY-2PPL ?auto_14579 ?auto_14574 ?auto_14573 )
      ( FLY-1PPL-VERIFY ?auto_14574 ?auto_14573 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14581 - PERSON
      ?auto_14582 - PERSON
      ?auto_14580 - CITY
    )
    :vars
    (
      ?auto_14584 - AIRCRAFT
      ?auto_14585 - CITY
      ?auto_14586 - FLEVEL
      ?auto_14583 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14584 ?auto_14585 ) ( NEXT ?auto_14586 ?auto_14583 ) ( not ( = ?auto_14580 ?auto_14585 ) ) ( not ( = ?auto_14583 ?auto_14586 ) ) ( PERSON-AT ?auto_14581 ?auto_14580 ) ( not ( = ?auto_14581 ?auto_14582 ) ) ( PERSON-AT ?auto_14582 ?auto_14585 ) ( FUEL-LEVEL ?auto_14584 ?auto_14586 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14582 ?auto_14580 )
      ( FLY-2PPL-VERIFY ?auto_14581 ?auto_14582 ?auto_14580 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14588 - PERSON
      ?auto_14589 - PERSON
      ?auto_14587 - CITY
    )
    :vars
    (
      ?auto_14592 - AIRCRAFT
      ?auto_14590 - CITY
      ?auto_14593 - FLEVEL
      ?auto_14591 - FLEVEL
      ?auto_14594 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14592 ?auto_14590 ) ( NEXT ?auto_14593 ?auto_14591 ) ( not ( = ?auto_14587 ?auto_14590 ) ) ( not ( = ?auto_14591 ?auto_14593 ) ) ( PERSON-AT ?auto_14594 ?auto_14587 ) ( not ( = ?auto_14594 ?auto_14589 ) ) ( PERSON-AT ?auto_14589 ?auto_14590 ) ( FUEL-LEVEL ?auto_14592 ?auto_14593 ) ( PERSON-AT ?auto_14588 ?auto_14587 ) ( not ( = ?auto_14588 ?auto_14589 ) ) ( not ( = ?auto_14588 ?auto_14594 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14594 ?auto_14589 ?auto_14587 )
      ( FLY-2PPL-VERIFY ?auto_14588 ?auto_14589 ?auto_14587 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14596 - PERSON
      ?auto_14597 - PERSON
      ?auto_14595 - CITY
    )
    :vars
    (
      ?auto_14600 - AIRCRAFT
      ?auto_14598 - CITY
      ?auto_14601 - FLEVEL
      ?auto_14599 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14600 ?auto_14598 ) ( NEXT ?auto_14601 ?auto_14599 ) ( not ( = ?auto_14595 ?auto_14598 ) ) ( not ( = ?auto_14599 ?auto_14601 ) ) ( PERSON-AT ?auto_14597 ?auto_14595 ) ( not ( = ?auto_14597 ?auto_14596 ) ) ( PERSON-AT ?auto_14596 ?auto_14598 ) ( FUEL-LEVEL ?auto_14600 ?auto_14601 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14597 ?auto_14596 ?auto_14595 )
      ( FLY-2PPL-VERIFY ?auto_14596 ?auto_14597 ?auto_14595 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14603 - PERSON
      ?auto_14604 - PERSON
      ?auto_14602 - CITY
    )
    :vars
    (
      ?auto_14607 - AIRCRAFT
      ?auto_14605 - CITY
      ?auto_14608 - FLEVEL
      ?auto_14606 - FLEVEL
      ?auto_14609 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14607 ?auto_14605 ) ( NEXT ?auto_14608 ?auto_14606 ) ( not ( = ?auto_14602 ?auto_14605 ) ) ( not ( = ?auto_14606 ?auto_14608 ) ) ( PERSON-AT ?auto_14609 ?auto_14602 ) ( not ( = ?auto_14609 ?auto_14603 ) ) ( PERSON-AT ?auto_14603 ?auto_14605 ) ( FUEL-LEVEL ?auto_14607 ?auto_14608 ) ( PERSON-AT ?auto_14604 ?auto_14602 ) ( not ( = ?auto_14603 ?auto_14604 ) ) ( not ( = ?auto_14604 ?auto_14609 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14609 ?auto_14603 ?auto_14602 )
      ( FLY-2PPL-VERIFY ?auto_14603 ?auto_14604 ?auto_14602 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14619 - PERSON
      ?auto_14620 - PERSON
      ?auto_14621 - PERSON
      ?auto_14618 - CITY
    )
    :vars
    (
      ?auto_14624 - AIRCRAFT
      ?auto_14622 - CITY
      ?auto_14625 - FLEVEL
      ?auto_14623 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14624 ?auto_14622 ) ( NEXT ?auto_14625 ?auto_14623 ) ( not ( = ?auto_14618 ?auto_14622 ) ) ( not ( = ?auto_14623 ?auto_14625 ) ) ( PERSON-AT ?auto_14620 ?auto_14618 ) ( not ( = ?auto_14620 ?auto_14621 ) ) ( PERSON-AT ?auto_14621 ?auto_14622 ) ( FUEL-LEVEL ?auto_14624 ?auto_14625 ) ( PERSON-AT ?auto_14619 ?auto_14618 ) ( not ( = ?auto_14619 ?auto_14620 ) ) ( not ( = ?auto_14619 ?auto_14621 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14620 ?auto_14621 ?auto_14618 )
      ( FLY-3PPL-VERIFY ?auto_14619 ?auto_14620 ?auto_14621 ?auto_14618 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14627 - PERSON
      ?auto_14628 - PERSON
      ?auto_14629 - PERSON
      ?auto_14626 - CITY
    )
    :vars
    (
      ?auto_14632 - AIRCRAFT
      ?auto_14630 - CITY
      ?auto_14633 - FLEVEL
      ?auto_14631 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14632 ?auto_14630 ) ( NEXT ?auto_14633 ?auto_14631 ) ( not ( = ?auto_14626 ?auto_14630 ) ) ( not ( = ?auto_14631 ?auto_14633 ) ) ( PERSON-AT ?auto_14627 ?auto_14626 ) ( not ( = ?auto_14627 ?auto_14629 ) ) ( PERSON-AT ?auto_14629 ?auto_14630 ) ( FUEL-LEVEL ?auto_14632 ?auto_14633 ) ( PERSON-AT ?auto_14628 ?auto_14626 ) ( not ( = ?auto_14627 ?auto_14628 ) ) ( not ( = ?auto_14628 ?auto_14629 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14627 ?auto_14629 ?auto_14626 )
      ( FLY-3PPL-VERIFY ?auto_14627 ?auto_14628 ?auto_14629 ?auto_14626 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14635 - PERSON
      ?auto_14636 - PERSON
      ?auto_14637 - PERSON
      ?auto_14634 - CITY
    )
    :vars
    (
      ?auto_14640 - AIRCRAFT
      ?auto_14638 - CITY
      ?auto_14641 - FLEVEL
      ?auto_14639 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14640 ?auto_14638 ) ( NEXT ?auto_14641 ?auto_14639 ) ( not ( = ?auto_14634 ?auto_14638 ) ) ( not ( = ?auto_14639 ?auto_14641 ) ) ( PERSON-AT ?auto_14637 ?auto_14634 ) ( not ( = ?auto_14637 ?auto_14636 ) ) ( PERSON-AT ?auto_14636 ?auto_14638 ) ( FUEL-LEVEL ?auto_14640 ?auto_14641 ) ( PERSON-AT ?auto_14635 ?auto_14634 ) ( not ( = ?auto_14635 ?auto_14636 ) ) ( not ( = ?auto_14635 ?auto_14637 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14637 ?auto_14636 ?auto_14634 )
      ( FLY-3PPL-VERIFY ?auto_14635 ?auto_14636 ?auto_14637 ?auto_14634 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14643 - PERSON
      ?auto_14644 - PERSON
      ?auto_14645 - PERSON
      ?auto_14642 - CITY
    )
    :vars
    (
      ?auto_14648 - AIRCRAFT
      ?auto_14646 - CITY
      ?auto_14649 - FLEVEL
      ?auto_14647 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14648 ?auto_14646 ) ( NEXT ?auto_14649 ?auto_14647 ) ( not ( = ?auto_14642 ?auto_14646 ) ) ( not ( = ?auto_14647 ?auto_14649 ) ) ( PERSON-AT ?auto_14643 ?auto_14642 ) ( not ( = ?auto_14643 ?auto_14644 ) ) ( PERSON-AT ?auto_14644 ?auto_14646 ) ( FUEL-LEVEL ?auto_14648 ?auto_14649 ) ( PERSON-AT ?auto_14645 ?auto_14642 ) ( not ( = ?auto_14643 ?auto_14645 ) ) ( not ( = ?auto_14644 ?auto_14645 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14643 ?auto_14644 ?auto_14642 )
      ( FLY-3PPL-VERIFY ?auto_14643 ?auto_14644 ?auto_14645 ?auto_14642 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14659 - PERSON
      ?auto_14660 - PERSON
      ?auto_14661 - PERSON
      ?auto_14658 - CITY
    )
    :vars
    (
      ?auto_14664 - AIRCRAFT
      ?auto_14662 - CITY
      ?auto_14665 - FLEVEL
      ?auto_14663 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14664 ?auto_14662 ) ( NEXT ?auto_14665 ?auto_14663 ) ( not ( = ?auto_14658 ?auto_14662 ) ) ( not ( = ?auto_14663 ?auto_14665 ) ) ( PERSON-AT ?auto_14660 ?auto_14658 ) ( not ( = ?auto_14660 ?auto_14661 ) ) ( PERSON-AT ?auto_14661 ?auto_14662 ) ( FUEL-LEVEL ?auto_14664 ?auto_14665 ) ( PERSON-AT ?auto_14659 ?auto_14658 ) ( not ( = ?auto_14659 ?auto_14660 ) ) ( not ( = ?auto_14659 ?auto_14661 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14660 ?auto_14661 ?auto_14658 )
      ( FLY-3PPL-VERIFY ?auto_14659 ?auto_14660 ?auto_14661 ?auto_14658 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14667 - PERSON
      ?auto_14668 - PERSON
      ?auto_14669 - PERSON
      ?auto_14666 - CITY
    )
    :vars
    (
      ?auto_14672 - AIRCRAFT
      ?auto_14670 - CITY
      ?auto_14673 - FLEVEL
      ?auto_14671 - FLEVEL
      ?auto_14674 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14672 ?auto_14670 ) ( NEXT ?auto_14673 ?auto_14671 ) ( not ( = ?auto_14666 ?auto_14670 ) ) ( not ( = ?auto_14671 ?auto_14673 ) ) ( PERSON-AT ?auto_14674 ?auto_14666 ) ( not ( = ?auto_14674 ?auto_14669 ) ) ( PERSON-AT ?auto_14669 ?auto_14670 ) ( FUEL-LEVEL ?auto_14672 ?auto_14673 ) ( PERSON-AT ?auto_14667 ?auto_14666 ) ( PERSON-AT ?auto_14668 ?auto_14666 ) ( not ( = ?auto_14667 ?auto_14668 ) ) ( not ( = ?auto_14667 ?auto_14669 ) ) ( not ( = ?auto_14667 ?auto_14674 ) ) ( not ( = ?auto_14668 ?auto_14669 ) ) ( not ( = ?auto_14668 ?auto_14674 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14674 ?auto_14669 ?auto_14666 )
      ( FLY-3PPL-VERIFY ?auto_14667 ?auto_14668 ?auto_14669 ?auto_14666 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14676 - PERSON
      ?auto_14677 - PERSON
      ?auto_14678 - PERSON
      ?auto_14675 - CITY
    )
    :vars
    (
      ?auto_14681 - AIRCRAFT
      ?auto_14679 - CITY
      ?auto_14682 - FLEVEL
      ?auto_14680 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14681 ?auto_14679 ) ( NEXT ?auto_14682 ?auto_14680 ) ( not ( = ?auto_14675 ?auto_14679 ) ) ( not ( = ?auto_14680 ?auto_14682 ) ) ( PERSON-AT ?auto_14678 ?auto_14675 ) ( not ( = ?auto_14678 ?auto_14677 ) ) ( PERSON-AT ?auto_14677 ?auto_14679 ) ( FUEL-LEVEL ?auto_14681 ?auto_14682 ) ( PERSON-AT ?auto_14676 ?auto_14675 ) ( not ( = ?auto_14676 ?auto_14677 ) ) ( not ( = ?auto_14676 ?auto_14678 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14678 ?auto_14677 ?auto_14675 )
      ( FLY-3PPL-VERIFY ?auto_14676 ?auto_14677 ?auto_14678 ?auto_14675 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14684 - PERSON
      ?auto_14685 - PERSON
      ?auto_14686 - PERSON
      ?auto_14683 - CITY
    )
    :vars
    (
      ?auto_14689 - AIRCRAFT
      ?auto_14687 - CITY
      ?auto_14690 - FLEVEL
      ?auto_14688 - FLEVEL
      ?auto_14691 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14689 ?auto_14687 ) ( NEXT ?auto_14690 ?auto_14688 ) ( not ( = ?auto_14683 ?auto_14687 ) ) ( not ( = ?auto_14688 ?auto_14690 ) ) ( PERSON-AT ?auto_14691 ?auto_14683 ) ( not ( = ?auto_14691 ?auto_14685 ) ) ( PERSON-AT ?auto_14685 ?auto_14687 ) ( FUEL-LEVEL ?auto_14689 ?auto_14690 ) ( PERSON-AT ?auto_14684 ?auto_14683 ) ( PERSON-AT ?auto_14686 ?auto_14683 ) ( not ( = ?auto_14684 ?auto_14685 ) ) ( not ( = ?auto_14684 ?auto_14686 ) ) ( not ( = ?auto_14684 ?auto_14691 ) ) ( not ( = ?auto_14685 ?auto_14686 ) ) ( not ( = ?auto_14686 ?auto_14691 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14691 ?auto_14685 ?auto_14683 )
      ( FLY-3PPL-VERIFY ?auto_14684 ?auto_14685 ?auto_14686 ?auto_14683 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14702 - PERSON
      ?auto_14703 - PERSON
      ?auto_14704 - PERSON
      ?auto_14701 - CITY
    )
    :vars
    (
      ?auto_14707 - AIRCRAFT
      ?auto_14705 - CITY
      ?auto_14708 - FLEVEL
      ?auto_14706 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14707 ?auto_14705 ) ( NEXT ?auto_14708 ?auto_14706 ) ( not ( = ?auto_14701 ?auto_14705 ) ) ( not ( = ?auto_14706 ?auto_14708 ) ) ( PERSON-AT ?auto_14703 ?auto_14701 ) ( not ( = ?auto_14703 ?auto_14702 ) ) ( PERSON-AT ?auto_14702 ?auto_14705 ) ( FUEL-LEVEL ?auto_14707 ?auto_14708 ) ( PERSON-AT ?auto_14704 ?auto_14701 ) ( not ( = ?auto_14702 ?auto_14704 ) ) ( not ( = ?auto_14703 ?auto_14704 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14703 ?auto_14702 ?auto_14701 )
      ( FLY-3PPL-VERIFY ?auto_14702 ?auto_14703 ?auto_14704 ?auto_14701 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14710 - PERSON
      ?auto_14711 - PERSON
      ?auto_14712 - PERSON
      ?auto_14709 - CITY
    )
    :vars
    (
      ?auto_14715 - AIRCRAFT
      ?auto_14713 - CITY
      ?auto_14716 - FLEVEL
      ?auto_14714 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14715 ?auto_14713 ) ( NEXT ?auto_14716 ?auto_14714 ) ( not ( = ?auto_14709 ?auto_14713 ) ) ( not ( = ?auto_14714 ?auto_14716 ) ) ( PERSON-AT ?auto_14711 ?auto_14709 ) ( not ( = ?auto_14711 ?auto_14710 ) ) ( PERSON-AT ?auto_14710 ?auto_14713 ) ( FUEL-LEVEL ?auto_14715 ?auto_14716 ) ( PERSON-AT ?auto_14712 ?auto_14709 ) ( not ( = ?auto_14710 ?auto_14712 ) ) ( not ( = ?auto_14711 ?auto_14712 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14711 ?auto_14710 ?auto_14709 )
      ( FLY-3PPL-VERIFY ?auto_14710 ?auto_14711 ?auto_14712 ?auto_14709 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14726 - PERSON
      ?auto_14727 - PERSON
      ?auto_14728 - PERSON
      ?auto_14725 - CITY
    )
    :vars
    (
      ?auto_14731 - AIRCRAFT
      ?auto_14729 - CITY
      ?auto_14732 - FLEVEL
      ?auto_14730 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14731 ?auto_14729 ) ( NEXT ?auto_14732 ?auto_14730 ) ( not ( = ?auto_14725 ?auto_14729 ) ) ( not ( = ?auto_14730 ?auto_14732 ) ) ( PERSON-AT ?auto_14728 ?auto_14725 ) ( not ( = ?auto_14728 ?auto_14726 ) ) ( PERSON-AT ?auto_14726 ?auto_14729 ) ( FUEL-LEVEL ?auto_14731 ?auto_14732 ) ( PERSON-AT ?auto_14727 ?auto_14725 ) ( not ( = ?auto_14726 ?auto_14727 ) ) ( not ( = ?auto_14727 ?auto_14728 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14728 ?auto_14726 ?auto_14725 )
      ( FLY-3PPL-VERIFY ?auto_14726 ?auto_14727 ?auto_14728 ?auto_14725 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14734 - PERSON
      ?auto_14735 - PERSON
      ?auto_14736 - PERSON
      ?auto_14733 - CITY
    )
    :vars
    (
      ?auto_14739 - AIRCRAFT
      ?auto_14737 - CITY
      ?auto_14740 - FLEVEL
      ?auto_14738 - FLEVEL
      ?auto_14741 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_14739 ?auto_14737 ) ( NEXT ?auto_14740 ?auto_14738 ) ( not ( = ?auto_14733 ?auto_14737 ) ) ( not ( = ?auto_14738 ?auto_14740 ) ) ( PERSON-AT ?auto_14741 ?auto_14733 ) ( not ( = ?auto_14741 ?auto_14734 ) ) ( PERSON-AT ?auto_14734 ?auto_14737 ) ( FUEL-LEVEL ?auto_14739 ?auto_14740 ) ( PERSON-AT ?auto_14735 ?auto_14733 ) ( PERSON-AT ?auto_14736 ?auto_14733 ) ( not ( = ?auto_14734 ?auto_14735 ) ) ( not ( = ?auto_14734 ?auto_14736 ) ) ( not ( = ?auto_14735 ?auto_14736 ) ) ( not ( = ?auto_14735 ?auto_14741 ) ) ( not ( = ?auto_14736 ?auto_14741 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14741 ?auto_14734 ?auto_14733 )
      ( FLY-3PPL-VERIFY ?auto_14734 ?auto_14735 ?auto_14736 ?auto_14733 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_14778 - PERSON
      ?auto_14777 - CITY
    )
    :vars
    (
      ?auto_14782 - FLEVEL
      ?auto_14780 - FLEVEL
      ?auto_14779 - CITY
      ?auto_14783 - PERSON
      ?auto_14781 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14782 ?auto_14780 ) ( not ( = ?auto_14777 ?auto_14779 ) ) ( not ( = ?auto_14780 ?auto_14782 ) ) ( PERSON-AT ?auto_14783 ?auto_14777 ) ( not ( = ?auto_14783 ?auto_14778 ) ) ( PERSON-AT ?auto_14778 ?auto_14779 ) ( AIRCRAFT-AT ?auto_14781 ?auto_14777 ) ( FUEL-LEVEL ?auto_14781 ?auto_14780 ) )
    :subtasks
    ( ( !FLY ?auto_14781 ?auto_14777 ?auto_14779 ?auto_14780 ?auto_14782 )
      ( FLY-2PPL ?auto_14783 ?auto_14778 ?auto_14777 )
      ( FLY-1PPL-VERIFY ?auto_14778 ?auto_14777 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14785 - PERSON
      ?auto_14786 - PERSON
      ?auto_14784 - CITY
    )
    :vars
    (
      ?auto_14788 - FLEVEL
      ?auto_14787 - FLEVEL
      ?auto_14790 - CITY
      ?auto_14789 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14788 ?auto_14787 ) ( not ( = ?auto_14784 ?auto_14790 ) ) ( not ( = ?auto_14787 ?auto_14788 ) ) ( PERSON-AT ?auto_14785 ?auto_14784 ) ( not ( = ?auto_14785 ?auto_14786 ) ) ( PERSON-AT ?auto_14786 ?auto_14790 ) ( AIRCRAFT-AT ?auto_14789 ?auto_14784 ) ( FUEL-LEVEL ?auto_14789 ?auto_14787 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14786 ?auto_14784 )
      ( FLY-2PPL-VERIFY ?auto_14785 ?auto_14786 ?auto_14784 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14792 - PERSON
      ?auto_14793 - PERSON
      ?auto_14791 - CITY
    )
    :vars
    (
      ?auto_14794 - FLEVEL
      ?auto_14798 - FLEVEL
      ?auto_14795 - CITY
      ?auto_14797 - PERSON
      ?auto_14796 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14794 ?auto_14798 ) ( not ( = ?auto_14791 ?auto_14795 ) ) ( not ( = ?auto_14798 ?auto_14794 ) ) ( PERSON-AT ?auto_14797 ?auto_14791 ) ( not ( = ?auto_14797 ?auto_14793 ) ) ( PERSON-AT ?auto_14793 ?auto_14795 ) ( AIRCRAFT-AT ?auto_14796 ?auto_14791 ) ( FUEL-LEVEL ?auto_14796 ?auto_14798 ) ( PERSON-AT ?auto_14792 ?auto_14791 ) ( not ( = ?auto_14792 ?auto_14793 ) ) ( not ( = ?auto_14792 ?auto_14797 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14797 ?auto_14793 ?auto_14791 )
      ( FLY-2PPL-VERIFY ?auto_14792 ?auto_14793 ?auto_14791 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14800 - PERSON
      ?auto_14801 - PERSON
      ?auto_14799 - CITY
    )
    :vars
    (
      ?auto_14802 - FLEVEL
      ?auto_14805 - FLEVEL
      ?auto_14803 - CITY
      ?auto_14804 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14802 ?auto_14805 ) ( not ( = ?auto_14799 ?auto_14803 ) ) ( not ( = ?auto_14805 ?auto_14802 ) ) ( PERSON-AT ?auto_14801 ?auto_14799 ) ( not ( = ?auto_14801 ?auto_14800 ) ) ( PERSON-AT ?auto_14800 ?auto_14803 ) ( AIRCRAFT-AT ?auto_14804 ?auto_14799 ) ( FUEL-LEVEL ?auto_14804 ?auto_14805 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14801 ?auto_14800 ?auto_14799 )
      ( FLY-2PPL-VERIFY ?auto_14800 ?auto_14801 ?auto_14799 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14807 - PERSON
      ?auto_14808 - PERSON
      ?auto_14806 - CITY
    )
    :vars
    (
      ?auto_14809 - FLEVEL
      ?auto_14813 - FLEVEL
      ?auto_14810 - CITY
      ?auto_14812 - PERSON
      ?auto_14811 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14809 ?auto_14813 ) ( not ( = ?auto_14806 ?auto_14810 ) ) ( not ( = ?auto_14813 ?auto_14809 ) ) ( PERSON-AT ?auto_14812 ?auto_14806 ) ( not ( = ?auto_14812 ?auto_14807 ) ) ( PERSON-AT ?auto_14807 ?auto_14810 ) ( AIRCRAFT-AT ?auto_14811 ?auto_14806 ) ( FUEL-LEVEL ?auto_14811 ?auto_14813 ) ( PERSON-AT ?auto_14808 ?auto_14806 ) ( not ( = ?auto_14807 ?auto_14808 ) ) ( not ( = ?auto_14808 ?auto_14812 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14812 ?auto_14807 ?auto_14806 )
      ( FLY-2PPL-VERIFY ?auto_14807 ?auto_14808 ?auto_14806 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14823 - PERSON
      ?auto_14824 - PERSON
      ?auto_14825 - PERSON
      ?auto_14822 - CITY
    )
    :vars
    (
      ?auto_14826 - FLEVEL
      ?auto_14829 - FLEVEL
      ?auto_14827 - CITY
      ?auto_14828 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14826 ?auto_14829 ) ( not ( = ?auto_14822 ?auto_14827 ) ) ( not ( = ?auto_14829 ?auto_14826 ) ) ( PERSON-AT ?auto_14824 ?auto_14822 ) ( not ( = ?auto_14824 ?auto_14825 ) ) ( PERSON-AT ?auto_14825 ?auto_14827 ) ( AIRCRAFT-AT ?auto_14828 ?auto_14822 ) ( FUEL-LEVEL ?auto_14828 ?auto_14829 ) ( PERSON-AT ?auto_14823 ?auto_14822 ) ( not ( = ?auto_14823 ?auto_14824 ) ) ( not ( = ?auto_14823 ?auto_14825 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14824 ?auto_14825 ?auto_14822 )
      ( FLY-3PPL-VERIFY ?auto_14823 ?auto_14824 ?auto_14825 ?auto_14822 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14831 - PERSON
      ?auto_14832 - PERSON
      ?auto_14833 - PERSON
      ?auto_14830 - CITY
    )
    :vars
    (
      ?auto_14834 - FLEVEL
      ?auto_14837 - FLEVEL
      ?auto_14835 - CITY
      ?auto_14836 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14834 ?auto_14837 ) ( not ( = ?auto_14830 ?auto_14835 ) ) ( not ( = ?auto_14837 ?auto_14834 ) ) ( PERSON-AT ?auto_14831 ?auto_14830 ) ( not ( = ?auto_14831 ?auto_14833 ) ) ( PERSON-AT ?auto_14833 ?auto_14835 ) ( AIRCRAFT-AT ?auto_14836 ?auto_14830 ) ( FUEL-LEVEL ?auto_14836 ?auto_14837 ) ( PERSON-AT ?auto_14832 ?auto_14830 ) ( not ( = ?auto_14831 ?auto_14832 ) ) ( not ( = ?auto_14832 ?auto_14833 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14831 ?auto_14833 ?auto_14830 )
      ( FLY-3PPL-VERIFY ?auto_14831 ?auto_14832 ?auto_14833 ?auto_14830 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14839 - PERSON
      ?auto_14840 - PERSON
      ?auto_14841 - PERSON
      ?auto_14838 - CITY
    )
    :vars
    (
      ?auto_14842 - FLEVEL
      ?auto_14845 - FLEVEL
      ?auto_14843 - CITY
      ?auto_14844 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14842 ?auto_14845 ) ( not ( = ?auto_14838 ?auto_14843 ) ) ( not ( = ?auto_14845 ?auto_14842 ) ) ( PERSON-AT ?auto_14841 ?auto_14838 ) ( not ( = ?auto_14841 ?auto_14840 ) ) ( PERSON-AT ?auto_14840 ?auto_14843 ) ( AIRCRAFT-AT ?auto_14844 ?auto_14838 ) ( FUEL-LEVEL ?auto_14844 ?auto_14845 ) ( PERSON-AT ?auto_14839 ?auto_14838 ) ( not ( = ?auto_14839 ?auto_14840 ) ) ( not ( = ?auto_14839 ?auto_14841 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14841 ?auto_14840 ?auto_14838 )
      ( FLY-3PPL-VERIFY ?auto_14839 ?auto_14840 ?auto_14841 ?auto_14838 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14847 - PERSON
      ?auto_14848 - PERSON
      ?auto_14849 - PERSON
      ?auto_14846 - CITY
    )
    :vars
    (
      ?auto_14850 - FLEVEL
      ?auto_14853 - FLEVEL
      ?auto_14851 - CITY
      ?auto_14852 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14850 ?auto_14853 ) ( not ( = ?auto_14846 ?auto_14851 ) ) ( not ( = ?auto_14853 ?auto_14850 ) ) ( PERSON-AT ?auto_14847 ?auto_14846 ) ( not ( = ?auto_14847 ?auto_14848 ) ) ( PERSON-AT ?auto_14848 ?auto_14851 ) ( AIRCRAFT-AT ?auto_14852 ?auto_14846 ) ( FUEL-LEVEL ?auto_14852 ?auto_14853 ) ( PERSON-AT ?auto_14849 ?auto_14846 ) ( not ( = ?auto_14847 ?auto_14849 ) ) ( not ( = ?auto_14848 ?auto_14849 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14847 ?auto_14848 ?auto_14846 )
      ( FLY-3PPL-VERIFY ?auto_14847 ?auto_14848 ?auto_14849 ?auto_14846 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14863 - PERSON
      ?auto_14864 - PERSON
      ?auto_14865 - PERSON
      ?auto_14862 - CITY
    )
    :vars
    (
      ?auto_14866 - FLEVEL
      ?auto_14869 - FLEVEL
      ?auto_14867 - CITY
      ?auto_14868 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14866 ?auto_14869 ) ( not ( = ?auto_14862 ?auto_14867 ) ) ( not ( = ?auto_14869 ?auto_14866 ) ) ( PERSON-AT ?auto_14864 ?auto_14862 ) ( not ( = ?auto_14864 ?auto_14865 ) ) ( PERSON-AT ?auto_14865 ?auto_14867 ) ( AIRCRAFT-AT ?auto_14868 ?auto_14862 ) ( FUEL-LEVEL ?auto_14868 ?auto_14869 ) ( PERSON-AT ?auto_14863 ?auto_14862 ) ( not ( = ?auto_14863 ?auto_14864 ) ) ( not ( = ?auto_14863 ?auto_14865 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14864 ?auto_14865 ?auto_14862 )
      ( FLY-3PPL-VERIFY ?auto_14863 ?auto_14864 ?auto_14865 ?auto_14862 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14871 - PERSON
      ?auto_14872 - PERSON
      ?auto_14873 - PERSON
      ?auto_14870 - CITY
    )
    :vars
    (
      ?auto_14874 - FLEVEL
      ?auto_14878 - FLEVEL
      ?auto_14875 - CITY
      ?auto_14877 - PERSON
      ?auto_14876 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14874 ?auto_14878 ) ( not ( = ?auto_14870 ?auto_14875 ) ) ( not ( = ?auto_14878 ?auto_14874 ) ) ( PERSON-AT ?auto_14877 ?auto_14870 ) ( not ( = ?auto_14877 ?auto_14873 ) ) ( PERSON-AT ?auto_14873 ?auto_14875 ) ( AIRCRAFT-AT ?auto_14876 ?auto_14870 ) ( FUEL-LEVEL ?auto_14876 ?auto_14878 ) ( PERSON-AT ?auto_14871 ?auto_14870 ) ( PERSON-AT ?auto_14872 ?auto_14870 ) ( not ( = ?auto_14871 ?auto_14872 ) ) ( not ( = ?auto_14871 ?auto_14873 ) ) ( not ( = ?auto_14871 ?auto_14877 ) ) ( not ( = ?auto_14872 ?auto_14873 ) ) ( not ( = ?auto_14872 ?auto_14877 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14877 ?auto_14873 ?auto_14870 )
      ( FLY-3PPL-VERIFY ?auto_14871 ?auto_14872 ?auto_14873 ?auto_14870 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14880 - PERSON
      ?auto_14881 - PERSON
      ?auto_14882 - PERSON
      ?auto_14879 - CITY
    )
    :vars
    (
      ?auto_14883 - FLEVEL
      ?auto_14886 - FLEVEL
      ?auto_14884 - CITY
      ?auto_14885 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14883 ?auto_14886 ) ( not ( = ?auto_14879 ?auto_14884 ) ) ( not ( = ?auto_14886 ?auto_14883 ) ) ( PERSON-AT ?auto_14882 ?auto_14879 ) ( not ( = ?auto_14882 ?auto_14881 ) ) ( PERSON-AT ?auto_14881 ?auto_14884 ) ( AIRCRAFT-AT ?auto_14885 ?auto_14879 ) ( FUEL-LEVEL ?auto_14885 ?auto_14886 ) ( PERSON-AT ?auto_14880 ?auto_14879 ) ( not ( = ?auto_14880 ?auto_14881 ) ) ( not ( = ?auto_14880 ?auto_14882 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14882 ?auto_14881 ?auto_14879 )
      ( FLY-3PPL-VERIFY ?auto_14880 ?auto_14881 ?auto_14882 ?auto_14879 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14888 - PERSON
      ?auto_14889 - PERSON
      ?auto_14890 - PERSON
      ?auto_14887 - CITY
    )
    :vars
    (
      ?auto_14891 - FLEVEL
      ?auto_14895 - FLEVEL
      ?auto_14892 - CITY
      ?auto_14894 - PERSON
      ?auto_14893 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14891 ?auto_14895 ) ( not ( = ?auto_14887 ?auto_14892 ) ) ( not ( = ?auto_14895 ?auto_14891 ) ) ( PERSON-AT ?auto_14894 ?auto_14887 ) ( not ( = ?auto_14894 ?auto_14889 ) ) ( PERSON-AT ?auto_14889 ?auto_14892 ) ( AIRCRAFT-AT ?auto_14893 ?auto_14887 ) ( FUEL-LEVEL ?auto_14893 ?auto_14895 ) ( PERSON-AT ?auto_14888 ?auto_14887 ) ( PERSON-AT ?auto_14890 ?auto_14887 ) ( not ( = ?auto_14888 ?auto_14889 ) ) ( not ( = ?auto_14888 ?auto_14890 ) ) ( not ( = ?auto_14888 ?auto_14894 ) ) ( not ( = ?auto_14889 ?auto_14890 ) ) ( not ( = ?auto_14890 ?auto_14894 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14894 ?auto_14889 ?auto_14887 )
      ( FLY-3PPL-VERIFY ?auto_14888 ?auto_14889 ?auto_14890 ?auto_14887 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14906 - PERSON
      ?auto_14907 - PERSON
      ?auto_14908 - PERSON
      ?auto_14905 - CITY
    )
    :vars
    (
      ?auto_14909 - FLEVEL
      ?auto_14912 - FLEVEL
      ?auto_14910 - CITY
      ?auto_14911 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14909 ?auto_14912 ) ( not ( = ?auto_14905 ?auto_14910 ) ) ( not ( = ?auto_14912 ?auto_14909 ) ) ( PERSON-AT ?auto_14908 ?auto_14905 ) ( not ( = ?auto_14908 ?auto_14906 ) ) ( PERSON-AT ?auto_14906 ?auto_14910 ) ( AIRCRAFT-AT ?auto_14911 ?auto_14905 ) ( FUEL-LEVEL ?auto_14911 ?auto_14912 ) ( PERSON-AT ?auto_14907 ?auto_14905 ) ( not ( = ?auto_14906 ?auto_14907 ) ) ( not ( = ?auto_14907 ?auto_14908 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14908 ?auto_14906 ?auto_14905 )
      ( FLY-3PPL-VERIFY ?auto_14906 ?auto_14907 ?auto_14908 ?auto_14905 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14914 - PERSON
      ?auto_14915 - PERSON
      ?auto_14916 - PERSON
      ?auto_14913 - CITY
    )
    :vars
    (
      ?auto_14917 - FLEVEL
      ?auto_14920 - FLEVEL
      ?auto_14918 - CITY
      ?auto_14919 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14917 ?auto_14920 ) ( not ( = ?auto_14913 ?auto_14918 ) ) ( not ( = ?auto_14920 ?auto_14917 ) ) ( PERSON-AT ?auto_14915 ?auto_14913 ) ( not ( = ?auto_14915 ?auto_14914 ) ) ( PERSON-AT ?auto_14914 ?auto_14918 ) ( AIRCRAFT-AT ?auto_14919 ?auto_14913 ) ( FUEL-LEVEL ?auto_14919 ?auto_14920 ) ( PERSON-AT ?auto_14916 ?auto_14913 ) ( not ( = ?auto_14914 ?auto_14916 ) ) ( not ( = ?auto_14915 ?auto_14916 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14915 ?auto_14914 ?auto_14913 )
      ( FLY-3PPL-VERIFY ?auto_14914 ?auto_14915 ?auto_14916 ?auto_14913 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14930 - PERSON
      ?auto_14931 - PERSON
      ?auto_14932 - PERSON
      ?auto_14929 - CITY
    )
    :vars
    (
      ?auto_14933 - FLEVEL
      ?auto_14936 - FLEVEL
      ?auto_14934 - CITY
      ?auto_14935 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14933 ?auto_14936 ) ( not ( = ?auto_14929 ?auto_14934 ) ) ( not ( = ?auto_14936 ?auto_14933 ) ) ( PERSON-AT ?auto_14932 ?auto_14929 ) ( not ( = ?auto_14932 ?auto_14930 ) ) ( PERSON-AT ?auto_14930 ?auto_14934 ) ( AIRCRAFT-AT ?auto_14935 ?auto_14929 ) ( FUEL-LEVEL ?auto_14935 ?auto_14936 ) ( PERSON-AT ?auto_14931 ?auto_14929 ) ( not ( = ?auto_14930 ?auto_14931 ) ) ( not ( = ?auto_14931 ?auto_14932 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14932 ?auto_14930 ?auto_14929 )
      ( FLY-3PPL-VERIFY ?auto_14930 ?auto_14931 ?auto_14932 ?auto_14929 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_14938 - PERSON
      ?auto_14939 - PERSON
      ?auto_14940 - PERSON
      ?auto_14937 - CITY
    )
    :vars
    (
      ?auto_14941 - FLEVEL
      ?auto_14945 - FLEVEL
      ?auto_14942 - CITY
      ?auto_14944 - PERSON
      ?auto_14943 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14941 ?auto_14945 ) ( not ( = ?auto_14937 ?auto_14942 ) ) ( not ( = ?auto_14945 ?auto_14941 ) ) ( PERSON-AT ?auto_14944 ?auto_14937 ) ( not ( = ?auto_14944 ?auto_14938 ) ) ( PERSON-AT ?auto_14938 ?auto_14942 ) ( AIRCRAFT-AT ?auto_14943 ?auto_14937 ) ( FUEL-LEVEL ?auto_14943 ?auto_14945 ) ( PERSON-AT ?auto_14939 ?auto_14937 ) ( PERSON-AT ?auto_14940 ?auto_14937 ) ( not ( = ?auto_14938 ?auto_14939 ) ) ( not ( = ?auto_14938 ?auto_14940 ) ) ( not ( = ?auto_14939 ?auto_14940 ) ) ( not ( = ?auto_14939 ?auto_14944 ) ) ( not ( = ?auto_14940 ?auto_14944 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_14944 ?auto_14938 ?auto_14937 )
      ( FLY-3PPL-VERIFY ?auto_14938 ?auto_14939 ?auto_14940 ?auto_14937 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_14982 - PERSON
      ?auto_14981 - CITY
    )
    :vars
    (
      ?auto_14983 - FLEVEL
      ?auto_14987 - FLEVEL
      ?auto_14984 - CITY
      ?auto_14986 - PERSON
      ?auto_14985 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14983 ?auto_14987 ) ( not ( = ?auto_14981 ?auto_14984 ) ) ( not ( = ?auto_14987 ?auto_14983 ) ) ( PERSON-AT ?auto_14986 ?auto_14981 ) ( not ( = ?auto_14986 ?auto_14982 ) ) ( PERSON-AT ?auto_14982 ?auto_14984 ) ( AIRCRAFT-AT ?auto_14985 ?auto_14981 ) ( FUEL-LEVEL ?auto_14985 ?auto_14983 ) )
    :subtasks
    ( ( !REFUEL ?auto_14985 ?auto_14981 ?auto_14983 ?auto_14987 )
      ( FLY-2PPL ?auto_14986 ?auto_14982 ?auto_14981 )
      ( FLY-1PPL-VERIFY ?auto_14982 ?auto_14981 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14989 - PERSON
      ?auto_14990 - PERSON
      ?auto_14988 - CITY
    )
    :vars
    (
      ?auto_14992 - FLEVEL
      ?auto_14991 - FLEVEL
      ?auto_14993 - CITY
      ?auto_14994 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_14992 ?auto_14991 ) ( not ( = ?auto_14988 ?auto_14993 ) ) ( not ( = ?auto_14991 ?auto_14992 ) ) ( PERSON-AT ?auto_14989 ?auto_14988 ) ( not ( = ?auto_14989 ?auto_14990 ) ) ( PERSON-AT ?auto_14990 ?auto_14993 ) ( AIRCRAFT-AT ?auto_14994 ?auto_14988 ) ( FUEL-LEVEL ?auto_14994 ?auto_14992 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_14990 ?auto_14988 )
      ( FLY-2PPL-VERIFY ?auto_14989 ?auto_14990 ?auto_14988 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_14996 - PERSON
      ?auto_14997 - PERSON
      ?auto_14995 - CITY
    )
    :vars
    (
      ?auto_15001 - FLEVEL
      ?auto_14998 - FLEVEL
      ?auto_14999 - CITY
      ?auto_15002 - PERSON
      ?auto_15000 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15001 ?auto_14998 ) ( not ( = ?auto_14995 ?auto_14999 ) ) ( not ( = ?auto_14998 ?auto_15001 ) ) ( PERSON-AT ?auto_15002 ?auto_14995 ) ( not ( = ?auto_15002 ?auto_14997 ) ) ( PERSON-AT ?auto_14997 ?auto_14999 ) ( AIRCRAFT-AT ?auto_15000 ?auto_14995 ) ( FUEL-LEVEL ?auto_15000 ?auto_15001 ) ( PERSON-AT ?auto_14996 ?auto_14995 ) ( not ( = ?auto_14996 ?auto_14997 ) ) ( not ( = ?auto_14996 ?auto_15002 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15002 ?auto_14997 ?auto_14995 )
      ( FLY-2PPL-VERIFY ?auto_14996 ?auto_14997 ?auto_14995 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15004 - PERSON
      ?auto_15005 - PERSON
      ?auto_15003 - CITY
    )
    :vars
    (
      ?auto_15009 - FLEVEL
      ?auto_15006 - FLEVEL
      ?auto_15007 - CITY
      ?auto_15008 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15009 ?auto_15006 ) ( not ( = ?auto_15003 ?auto_15007 ) ) ( not ( = ?auto_15006 ?auto_15009 ) ) ( PERSON-AT ?auto_15005 ?auto_15003 ) ( not ( = ?auto_15005 ?auto_15004 ) ) ( PERSON-AT ?auto_15004 ?auto_15007 ) ( AIRCRAFT-AT ?auto_15008 ?auto_15003 ) ( FUEL-LEVEL ?auto_15008 ?auto_15009 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15005 ?auto_15004 ?auto_15003 )
      ( FLY-2PPL-VERIFY ?auto_15004 ?auto_15005 ?auto_15003 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15011 - PERSON
      ?auto_15012 - PERSON
      ?auto_15010 - CITY
    )
    :vars
    (
      ?auto_15016 - FLEVEL
      ?auto_15013 - FLEVEL
      ?auto_15014 - CITY
      ?auto_15017 - PERSON
      ?auto_15015 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15016 ?auto_15013 ) ( not ( = ?auto_15010 ?auto_15014 ) ) ( not ( = ?auto_15013 ?auto_15016 ) ) ( PERSON-AT ?auto_15017 ?auto_15010 ) ( not ( = ?auto_15017 ?auto_15011 ) ) ( PERSON-AT ?auto_15011 ?auto_15014 ) ( AIRCRAFT-AT ?auto_15015 ?auto_15010 ) ( FUEL-LEVEL ?auto_15015 ?auto_15016 ) ( PERSON-AT ?auto_15012 ?auto_15010 ) ( not ( = ?auto_15011 ?auto_15012 ) ) ( not ( = ?auto_15012 ?auto_15017 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15017 ?auto_15011 ?auto_15010 )
      ( FLY-2PPL-VERIFY ?auto_15011 ?auto_15012 ?auto_15010 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15027 - PERSON
      ?auto_15028 - PERSON
      ?auto_15029 - PERSON
      ?auto_15026 - CITY
    )
    :vars
    (
      ?auto_15033 - FLEVEL
      ?auto_15030 - FLEVEL
      ?auto_15031 - CITY
      ?auto_15032 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15033 ?auto_15030 ) ( not ( = ?auto_15026 ?auto_15031 ) ) ( not ( = ?auto_15030 ?auto_15033 ) ) ( PERSON-AT ?auto_15028 ?auto_15026 ) ( not ( = ?auto_15028 ?auto_15029 ) ) ( PERSON-AT ?auto_15029 ?auto_15031 ) ( AIRCRAFT-AT ?auto_15032 ?auto_15026 ) ( FUEL-LEVEL ?auto_15032 ?auto_15033 ) ( PERSON-AT ?auto_15027 ?auto_15026 ) ( not ( = ?auto_15027 ?auto_15028 ) ) ( not ( = ?auto_15027 ?auto_15029 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15028 ?auto_15029 ?auto_15026 )
      ( FLY-3PPL-VERIFY ?auto_15027 ?auto_15028 ?auto_15029 ?auto_15026 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15035 - PERSON
      ?auto_15036 - PERSON
      ?auto_15037 - PERSON
      ?auto_15034 - CITY
    )
    :vars
    (
      ?auto_15041 - FLEVEL
      ?auto_15038 - FLEVEL
      ?auto_15039 - CITY
      ?auto_15040 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15041 ?auto_15038 ) ( not ( = ?auto_15034 ?auto_15039 ) ) ( not ( = ?auto_15038 ?auto_15041 ) ) ( PERSON-AT ?auto_15035 ?auto_15034 ) ( not ( = ?auto_15035 ?auto_15037 ) ) ( PERSON-AT ?auto_15037 ?auto_15039 ) ( AIRCRAFT-AT ?auto_15040 ?auto_15034 ) ( FUEL-LEVEL ?auto_15040 ?auto_15041 ) ( PERSON-AT ?auto_15036 ?auto_15034 ) ( not ( = ?auto_15035 ?auto_15036 ) ) ( not ( = ?auto_15036 ?auto_15037 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15035 ?auto_15037 ?auto_15034 )
      ( FLY-3PPL-VERIFY ?auto_15035 ?auto_15036 ?auto_15037 ?auto_15034 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15043 - PERSON
      ?auto_15044 - PERSON
      ?auto_15045 - PERSON
      ?auto_15042 - CITY
    )
    :vars
    (
      ?auto_15049 - FLEVEL
      ?auto_15046 - FLEVEL
      ?auto_15047 - CITY
      ?auto_15048 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15049 ?auto_15046 ) ( not ( = ?auto_15042 ?auto_15047 ) ) ( not ( = ?auto_15046 ?auto_15049 ) ) ( PERSON-AT ?auto_15045 ?auto_15042 ) ( not ( = ?auto_15045 ?auto_15044 ) ) ( PERSON-AT ?auto_15044 ?auto_15047 ) ( AIRCRAFT-AT ?auto_15048 ?auto_15042 ) ( FUEL-LEVEL ?auto_15048 ?auto_15049 ) ( PERSON-AT ?auto_15043 ?auto_15042 ) ( not ( = ?auto_15043 ?auto_15044 ) ) ( not ( = ?auto_15043 ?auto_15045 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15045 ?auto_15044 ?auto_15042 )
      ( FLY-3PPL-VERIFY ?auto_15043 ?auto_15044 ?auto_15045 ?auto_15042 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15051 - PERSON
      ?auto_15052 - PERSON
      ?auto_15053 - PERSON
      ?auto_15050 - CITY
    )
    :vars
    (
      ?auto_15057 - FLEVEL
      ?auto_15054 - FLEVEL
      ?auto_15055 - CITY
      ?auto_15056 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15057 ?auto_15054 ) ( not ( = ?auto_15050 ?auto_15055 ) ) ( not ( = ?auto_15054 ?auto_15057 ) ) ( PERSON-AT ?auto_15051 ?auto_15050 ) ( not ( = ?auto_15051 ?auto_15052 ) ) ( PERSON-AT ?auto_15052 ?auto_15055 ) ( AIRCRAFT-AT ?auto_15056 ?auto_15050 ) ( FUEL-LEVEL ?auto_15056 ?auto_15057 ) ( PERSON-AT ?auto_15053 ?auto_15050 ) ( not ( = ?auto_15051 ?auto_15053 ) ) ( not ( = ?auto_15052 ?auto_15053 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15051 ?auto_15052 ?auto_15050 )
      ( FLY-3PPL-VERIFY ?auto_15051 ?auto_15052 ?auto_15053 ?auto_15050 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15067 - PERSON
      ?auto_15068 - PERSON
      ?auto_15069 - PERSON
      ?auto_15066 - CITY
    )
    :vars
    (
      ?auto_15073 - FLEVEL
      ?auto_15070 - FLEVEL
      ?auto_15071 - CITY
      ?auto_15072 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15073 ?auto_15070 ) ( not ( = ?auto_15066 ?auto_15071 ) ) ( not ( = ?auto_15070 ?auto_15073 ) ) ( PERSON-AT ?auto_15068 ?auto_15066 ) ( not ( = ?auto_15068 ?auto_15069 ) ) ( PERSON-AT ?auto_15069 ?auto_15071 ) ( AIRCRAFT-AT ?auto_15072 ?auto_15066 ) ( FUEL-LEVEL ?auto_15072 ?auto_15073 ) ( PERSON-AT ?auto_15067 ?auto_15066 ) ( not ( = ?auto_15067 ?auto_15068 ) ) ( not ( = ?auto_15067 ?auto_15069 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15068 ?auto_15069 ?auto_15066 )
      ( FLY-3PPL-VERIFY ?auto_15067 ?auto_15068 ?auto_15069 ?auto_15066 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15075 - PERSON
      ?auto_15076 - PERSON
      ?auto_15077 - PERSON
      ?auto_15074 - CITY
    )
    :vars
    (
      ?auto_15081 - FLEVEL
      ?auto_15078 - FLEVEL
      ?auto_15079 - CITY
      ?auto_15082 - PERSON
      ?auto_15080 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15081 ?auto_15078 ) ( not ( = ?auto_15074 ?auto_15079 ) ) ( not ( = ?auto_15078 ?auto_15081 ) ) ( PERSON-AT ?auto_15082 ?auto_15074 ) ( not ( = ?auto_15082 ?auto_15077 ) ) ( PERSON-AT ?auto_15077 ?auto_15079 ) ( AIRCRAFT-AT ?auto_15080 ?auto_15074 ) ( FUEL-LEVEL ?auto_15080 ?auto_15081 ) ( PERSON-AT ?auto_15075 ?auto_15074 ) ( PERSON-AT ?auto_15076 ?auto_15074 ) ( not ( = ?auto_15075 ?auto_15076 ) ) ( not ( = ?auto_15075 ?auto_15077 ) ) ( not ( = ?auto_15075 ?auto_15082 ) ) ( not ( = ?auto_15076 ?auto_15077 ) ) ( not ( = ?auto_15076 ?auto_15082 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15082 ?auto_15077 ?auto_15074 )
      ( FLY-3PPL-VERIFY ?auto_15075 ?auto_15076 ?auto_15077 ?auto_15074 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15084 - PERSON
      ?auto_15085 - PERSON
      ?auto_15086 - PERSON
      ?auto_15083 - CITY
    )
    :vars
    (
      ?auto_15090 - FLEVEL
      ?auto_15087 - FLEVEL
      ?auto_15088 - CITY
      ?auto_15089 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15090 ?auto_15087 ) ( not ( = ?auto_15083 ?auto_15088 ) ) ( not ( = ?auto_15087 ?auto_15090 ) ) ( PERSON-AT ?auto_15086 ?auto_15083 ) ( not ( = ?auto_15086 ?auto_15085 ) ) ( PERSON-AT ?auto_15085 ?auto_15088 ) ( AIRCRAFT-AT ?auto_15089 ?auto_15083 ) ( FUEL-LEVEL ?auto_15089 ?auto_15090 ) ( PERSON-AT ?auto_15084 ?auto_15083 ) ( not ( = ?auto_15084 ?auto_15085 ) ) ( not ( = ?auto_15084 ?auto_15086 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15086 ?auto_15085 ?auto_15083 )
      ( FLY-3PPL-VERIFY ?auto_15084 ?auto_15085 ?auto_15086 ?auto_15083 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15092 - PERSON
      ?auto_15093 - PERSON
      ?auto_15094 - PERSON
      ?auto_15091 - CITY
    )
    :vars
    (
      ?auto_15098 - FLEVEL
      ?auto_15095 - FLEVEL
      ?auto_15096 - CITY
      ?auto_15099 - PERSON
      ?auto_15097 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15098 ?auto_15095 ) ( not ( = ?auto_15091 ?auto_15096 ) ) ( not ( = ?auto_15095 ?auto_15098 ) ) ( PERSON-AT ?auto_15099 ?auto_15091 ) ( not ( = ?auto_15099 ?auto_15093 ) ) ( PERSON-AT ?auto_15093 ?auto_15096 ) ( AIRCRAFT-AT ?auto_15097 ?auto_15091 ) ( FUEL-LEVEL ?auto_15097 ?auto_15098 ) ( PERSON-AT ?auto_15092 ?auto_15091 ) ( PERSON-AT ?auto_15094 ?auto_15091 ) ( not ( = ?auto_15092 ?auto_15093 ) ) ( not ( = ?auto_15092 ?auto_15094 ) ) ( not ( = ?auto_15092 ?auto_15099 ) ) ( not ( = ?auto_15093 ?auto_15094 ) ) ( not ( = ?auto_15094 ?auto_15099 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15099 ?auto_15093 ?auto_15091 )
      ( FLY-3PPL-VERIFY ?auto_15092 ?auto_15093 ?auto_15094 ?auto_15091 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15110 - PERSON
      ?auto_15111 - PERSON
      ?auto_15112 - PERSON
      ?auto_15109 - CITY
    )
    :vars
    (
      ?auto_15116 - FLEVEL
      ?auto_15113 - FLEVEL
      ?auto_15114 - CITY
      ?auto_15115 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15116 ?auto_15113 ) ( not ( = ?auto_15109 ?auto_15114 ) ) ( not ( = ?auto_15113 ?auto_15116 ) ) ( PERSON-AT ?auto_15112 ?auto_15109 ) ( not ( = ?auto_15112 ?auto_15110 ) ) ( PERSON-AT ?auto_15110 ?auto_15114 ) ( AIRCRAFT-AT ?auto_15115 ?auto_15109 ) ( FUEL-LEVEL ?auto_15115 ?auto_15116 ) ( PERSON-AT ?auto_15111 ?auto_15109 ) ( not ( = ?auto_15110 ?auto_15111 ) ) ( not ( = ?auto_15111 ?auto_15112 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15112 ?auto_15110 ?auto_15109 )
      ( FLY-3PPL-VERIFY ?auto_15110 ?auto_15111 ?auto_15112 ?auto_15109 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15118 - PERSON
      ?auto_15119 - PERSON
      ?auto_15120 - PERSON
      ?auto_15117 - CITY
    )
    :vars
    (
      ?auto_15124 - FLEVEL
      ?auto_15121 - FLEVEL
      ?auto_15122 - CITY
      ?auto_15123 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15124 ?auto_15121 ) ( not ( = ?auto_15117 ?auto_15122 ) ) ( not ( = ?auto_15121 ?auto_15124 ) ) ( PERSON-AT ?auto_15119 ?auto_15117 ) ( not ( = ?auto_15119 ?auto_15118 ) ) ( PERSON-AT ?auto_15118 ?auto_15122 ) ( AIRCRAFT-AT ?auto_15123 ?auto_15117 ) ( FUEL-LEVEL ?auto_15123 ?auto_15124 ) ( PERSON-AT ?auto_15120 ?auto_15117 ) ( not ( = ?auto_15118 ?auto_15120 ) ) ( not ( = ?auto_15119 ?auto_15120 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15119 ?auto_15118 ?auto_15117 )
      ( FLY-3PPL-VERIFY ?auto_15118 ?auto_15119 ?auto_15120 ?auto_15117 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15134 - PERSON
      ?auto_15135 - PERSON
      ?auto_15136 - PERSON
      ?auto_15133 - CITY
    )
    :vars
    (
      ?auto_15140 - FLEVEL
      ?auto_15137 - FLEVEL
      ?auto_15138 - CITY
      ?auto_15139 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15140 ?auto_15137 ) ( not ( = ?auto_15133 ?auto_15138 ) ) ( not ( = ?auto_15137 ?auto_15140 ) ) ( PERSON-AT ?auto_15136 ?auto_15133 ) ( not ( = ?auto_15136 ?auto_15134 ) ) ( PERSON-AT ?auto_15134 ?auto_15138 ) ( AIRCRAFT-AT ?auto_15139 ?auto_15133 ) ( FUEL-LEVEL ?auto_15139 ?auto_15140 ) ( PERSON-AT ?auto_15135 ?auto_15133 ) ( not ( = ?auto_15134 ?auto_15135 ) ) ( not ( = ?auto_15135 ?auto_15136 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15136 ?auto_15134 ?auto_15133 )
      ( FLY-3PPL-VERIFY ?auto_15134 ?auto_15135 ?auto_15136 ?auto_15133 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15142 - PERSON
      ?auto_15143 - PERSON
      ?auto_15144 - PERSON
      ?auto_15141 - CITY
    )
    :vars
    (
      ?auto_15148 - FLEVEL
      ?auto_15145 - FLEVEL
      ?auto_15146 - CITY
      ?auto_15149 - PERSON
      ?auto_15147 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15148 ?auto_15145 ) ( not ( = ?auto_15141 ?auto_15146 ) ) ( not ( = ?auto_15145 ?auto_15148 ) ) ( PERSON-AT ?auto_15149 ?auto_15141 ) ( not ( = ?auto_15149 ?auto_15142 ) ) ( PERSON-AT ?auto_15142 ?auto_15146 ) ( AIRCRAFT-AT ?auto_15147 ?auto_15141 ) ( FUEL-LEVEL ?auto_15147 ?auto_15148 ) ( PERSON-AT ?auto_15143 ?auto_15141 ) ( PERSON-AT ?auto_15144 ?auto_15141 ) ( not ( = ?auto_15142 ?auto_15143 ) ) ( not ( = ?auto_15142 ?auto_15144 ) ) ( not ( = ?auto_15143 ?auto_15144 ) ) ( not ( = ?auto_15143 ?auto_15149 ) ) ( not ( = ?auto_15144 ?auto_15149 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15149 ?auto_15142 ?auto_15141 )
      ( FLY-3PPL-VERIFY ?auto_15142 ?auto_15143 ?auto_15144 ?auto_15141 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_15186 - PERSON
      ?auto_15185 - CITY
    )
    :vars
    (
      ?auto_15190 - FLEVEL
      ?auto_15187 - FLEVEL
      ?auto_15188 - CITY
      ?auto_15191 - PERSON
      ?auto_15189 - AIRCRAFT
      ?auto_15192 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_15190 ?auto_15187 ) ( not ( = ?auto_15185 ?auto_15188 ) ) ( not ( = ?auto_15187 ?auto_15190 ) ) ( PERSON-AT ?auto_15191 ?auto_15185 ) ( not ( = ?auto_15191 ?auto_15186 ) ) ( PERSON-AT ?auto_15186 ?auto_15188 ) ( AIRCRAFT-AT ?auto_15189 ?auto_15185 ) ( FUEL-LEVEL ?auto_15189 ?auto_15190 ) ( IN ?auto_15192 ?auto_15189 ) ( not ( = ?auto_15191 ?auto_15192 ) ) ( not ( = ?auto_15186 ?auto_15192 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15191 ?auto_15192 ?auto_15185 )
      ( FLY-2PPL ?auto_15191 ?auto_15186 ?auto_15185 )
      ( FLY-1PPL-VERIFY ?auto_15186 ?auto_15185 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15194 - PERSON
      ?auto_15195 - PERSON
      ?auto_15193 - CITY
    )
    :vars
    (
      ?auto_15198 - FLEVEL
      ?auto_15199 - FLEVEL
      ?auto_15200 - CITY
      ?auto_15197 - AIRCRAFT
      ?auto_15196 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_15198 ?auto_15199 ) ( not ( = ?auto_15193 ?auto_15200 ) ) ( not ( = ?auto_15199 ?auto_15198 ) ) ( PERSON-AT ?auto_15194 ?auto_15193 ) ( not ( = ?auto_15194 ?auto_15195 ) ) ( PERSON-AT ?auto_15195 ?auto_15200 ) ( AIRCRAFT-AT ?auto_15197 ?auto_15193 ) ( FUEL-LEVEL ?auto_15197 ?auto_15198 ) ( IN ?auto_15196 ?auto_15197 ) ( not ( = ?auto_15194 ?auto_15196 ) ) ( not ( = ?auto_15195 ?auto_15196 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_15195 ?auto_15193 )
      ( FLY-2PPL-VERIFY ?auto_15194 ?auto_15195 ?auto_15193 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15202 - PERSON
      ?auto_15203 - PERSON
      ?auto_15201 - CITY
    )
    :vars
    (
      ?auto_15205 - FLEVEL
      ?auto_15207 - FLEVEL
      ?auto_15208 - CITY
      ?auto_15206 - PERSON
      ?auto_15204 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15205 ?auto_15207 ) ( not ( = ?auto_15201 ?auto_15208 ) ) ( not ( = ?auto_15207 ?auto_15205 ) ) ( PERSON-AT ?auto_15206 ?auto_15201 ) ( not ( = ?auto_15206 ?auto_15203 ) ) ( PERSON-AT ?auto_15203 ?auto_15208 ) ( AIRCRAFT-AT ?auto_15204 ?auto_15201 ) ( FUEL-LEVEL ?auto_15204 ?auto_15205 ) ( IN ?auto_15202 ?auto_15204 ) ( not ( = ?auto_15206 ?auto_15202 ) ) ( not ( = ?auto_15203 ?auto_15202 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15206 ?auto_15203 ?auto_15201 )
      ( FLY-2PPL-VERIFY ?auto_15202 ?auto_15203 ?auto_15201 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15210 - PERSON
      ?auto_15211 - PERSON
      ?auto_15209 - CITY
    )
    :vars
    (
      ?auto_15213 - FLEVEL
      ?auto_15215 - FLEVEL
      ?auto_15216 - CITY
      ?auto_15212 - AIRCRAFT
      ?auto_15214 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_15213 ?auto_15215 ) ( not ( = ?auto_15209 ?auto_15216 ) ) ( not ( = ?auto_15215 ?auto_15213 ) ) ( PERSON-AT ?auto_15211 ?auto_15209 ) ( not ( = ?auto_15211 ?auto_15210 ) ) ( PERSON-AT ?auto_15210 ?auto_15216 ) ( AIRCRAFT-AT ?auto_15212 ?auto_15209 ) ( FUEL-LEVEL ?auto_15212 ?auto_15213 ) ( IN ?auto_15214 ?auto_15212 ) ( not ( = ?auto_15211 ?auto_15214 ) ) ( not ( = ?auto_15210 ?auto_15214 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15211 ?auto_15210 ?auto_15209 )
      ( FLY-2PPL-VERIFY ?auto_15210 ?auto_15211 ?auto_15209 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15218 - PERSON
      ?auto_15219 - PERSON
      ?auto_15217 - CITY
    )
    :vars
    (
      ?auto_15221 - FLEVEL
      ?auto_15223 - FLEVEL
      ?auto_15224 - CITY
      ?auto_15222 - PERSON
      ?auto_15220 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15221 ?auto_15223 ) ( not ( = ?auto_15217 ?auto_15224 ) ) ( not ( = ?auto_15223 ?auto_15221 ) ) ( PERSON-AT ?auto_15222 ?auto_15217 ) ( not ( = ?auto_15222 ?auto_15218 ) ) ( PERSON-AT ?auto_15218 ?auto_15224 ) ( AIRCRAFT-AT ?auto_15220 ?auto_15217 ) ( FUEL-LEVEL ?auto_15220 ?auto_15221 ) ( IN ?auto_15219 ?auto_15220 ) ( not ( = ?auto_15222 ?auto_15219 ) ) ( not ( = ?auto_15218 ?auto_15219 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15222 ?auto_15218 ?auto_15217 )
      ( FLY-2PPL-VERIFY ?auto_15218 ?auto_15219 ?auto_15217 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15235 - PERSON
      ?auto_15236 - PERSON
      ?auto_15237 - PERSON
      ?auto_15234 - CITY
    )
    :vars
    (
      ?auto_15239 - FLEVEL
      ?auto_15241 - FLEVEL
      ?auto_15242 - CITY
      ?auto_15238 - AIRCRAFT
      ?auto_15240 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_15239 ?auto_15241 ) ( not ( = ?auto_15234 ?auto_15242 ) ) ( not ( = ?auto_15241 ?auto_15239 ) ) ( PERSON-AT ?auto_15236 ?auto_15234 ) ( not ( = ?auto_15236 ?auto_15237 ) ) ( PERSON-AT ?auto_15237 ?auto_15242 ) ( AIRCRAFT-AT ?auto_15238 ?auto_15234 ) ( FUEL-LEVEL ?auto_15238 ?auto_15239 ) ( IN ?auto_15240 ?auto_15238 ) ( not ( = ?auto_15236 ?auto_15240 ) ) ( not ( = ?auto_15237 ?auto_15240 ) ) ( PERSON-AT ?auto_15235 ?auto_15234 ) ( not ( = ?auto_15235 ?auto_15236 ) ) ( not ( = ?auto_15235 ?auto_15237 ) ) ( not ( = ?auto_15235 ?auto_15240 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15236 ?auto_15237 ?auto_15234 )
      ( FLY-3PPL-VERIFY ?auto_15235 ?auto_15236 ?auto_15237 ?auto_15234 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15244 - PERSON
      ?auto_15245 - PERSON
      ?auto_15246 - PERSON
      ?auto_15243 - CITY
    )
    :vars
    (
      ?auto_15248 - FLEVEL
      ?auto_15249 - FLEVEL
      ?auto_15250 - CITY
      ?auto_15247 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15248 ?auto_15249 ) ( not ( = ?auto_15243 ?auto_15250 ) ) ( not ( = ?auto_15249 ?auto_15248 ) ) ( PERSON-AT ?auto_15244 ?auto_15243 ) ( not ( = ?auto_15244 ?auto_15246 ) ) ( PERSON-AT ?auto_15246 ?auto_15250 ) ( AIRCRAFT-AT ?auto_15247 ?auto_15243 ) ( FUEL-LEVEL ?auto_15247 ?auto_15248 ) ( IN ?auto_15245 ?auto_15247 ) ( not ( = ?auto_15244 ?auto_15245 ) ) ( not ( = ?auto_15246 ?auto_15245 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15244 ?auto_15246 ?auto_15243 )
      ( FLY-3PPL-VERIFY ?auto_15244 ?auto_15245 ?auto_15246 ?auto_15243 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15252 - PERSON
      ?auto_15253 - PERSON
      ?auto_15254 - PERSON
      ?auto_15251 - CITY
    )
    :vars
    (
      ?auto_15256 - FLEVEL
      ?auto_15258 - FLEVEL
      ?auto_15259 - CITY
      ?auto_15255 - AIRCRAFT
      ?auto_15257 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_15256 ?auto_15258 ) ( not ( = ?auto_15251 ?auto_15259 ) ) ( not ( = ?auto_15258 ?auto_15256 ) ) ( PERSON-AT ?auto_15254 ?auto_15251 ) ( not ( = ?auto_15254 ?auto_15253 ) ) ( PERSON-AT ?auto_15253 ?auto_15259 ) ( AIRCRAFT-AT ?auto_15255 ?auto_15251 ) ( FUEL-LEVEL ?auto_15255 ?auto_15256 ) ( IN ?auto_15257 ?auto_15255 ) ( not ( = ?auto_15254 ?auto_15257 ) ) ( not ( = ?auto_15253 ?auto_15257 ) ) ( PERSON-AT ?auto_15252 ?auto_15251 ) ( not ( = ?auto_15252 ?auto_15253 ) ) ( not ( = ?auto_15252 ?auto_15254 ) ) ( not ( = ?auto_15252 ?auto_15257 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15254 ?auto_15253 ?auto_15251 )
      ( FLY-3PPL-VERIFY ?auto_15252 ?auto_15253 ?auto_15254 ?auto_15251 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15261 - PERSON
      ?auto_15262 - PERSON
      ?auto_15263 - PERSON
      ?auto_15260 - CITY
    )
    :vars
    (
      ?auto_15265 - FLEVEL
      ?auto_15266 - FLEVEL
      ?auto_15267 - CITY
      ?auto_15264 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15265 ?auto_15266 ) ( not ( = ?auto_15260 ?auto_15267 ) ) ( not ( = ?auto_15266 ?auto_15265 ) ) ( PERSON-AT ?auto_15261 ?auto_15260 ) ( not ( = ?auto_15261 ?auto_15262 ) ) ( PERSON-AT ?auto_15262 ?auto_15267 ) ( AIRCRAFT-AT ?auto_15264 ?auto_15260 ) ( FUEL-LEVEL ?auto_15264 ?auto_15265 ) ( IN ?auto_15263 ?auto_15264 ) ( not ( = ?auto_15261 ?auto_15263 ) ) ( not ( = ?auto_15262 ?auto_15263 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15261 ?auto_15262 ?auto_15260 )
      ( FLY-3PPL-VERIFY ?auto_15261 ?auto_15262 ?auto_15263 ?auto_15260 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15278 - PERSON
      ?auto_15279 - PERSON
      ?auto_15280 - PERSON
      ?auto_15277 - CITY
    )
    :vars
    (
      ?auto_15282 - FLEVEL
      ?auto_15283 - FLEVEL
      ?auto_15284 - CITY
      ?auto_15281 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15282 ?auto_15283 ) ( not ( = ?auto_15277 ?auto_15284 ) ) ( not ( = ?auto_15283 ?auto_15282 ) ) ( PERSON-AT ?auto_15279 ?auto_15277 ) ( not ( = ?auto_15279 ?auto_15280 ) ) ( PERSON-AT ?auto_15280 ?auto_15284 ) ( AIRCRAFT-AT ?auto_15281 ?auto_15277 ) ( FUEL-LEVEL ?auto_15281 ?auto_15282 ) ( IN ?auto_15278 ?auto_15281 ) ( not ( = ?auto_15279 ?auto_15278 ) ) ( not ( = ?auto_15280 ?auto_15278 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15279 ?auto_15280 ?auto_15277 )
      ( FLY-3PPL-VERIFY ?auto_15278 ?auto_15279 ?auto_15280 ?auto_15277 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15295 - PERSON
      ?auto_15296 - PERSON
      ?auto_15297 - PERSON
      ?auto_15294 - CITY
    )
    :vars
    (
      ?auto_15299 - FLEVEL
      ?auto_15300 - FLEVEL
      ?auto_15301 - CITY
      ?auto_15298 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15299 ?auto_15300 ) ( not ( = ?auto_15294 ?auto_15301 ) ) ( not ( = ?auto_15300 ?auto_15299 ) ) ( PERSON-AT ?auto_15297 ?auto_15294 ) ( not ( = ?auto_15297 ?auto_15296 ) ) ( PERSON-AT ?auto_15296 ?auto_15301 ) ( AIRCRAFT-AT ?auto_15298 ?auto_15294 ) ( FUEL-LEVEL ?auto_15298 ?auto_15299 ) ( IN ?auto_15295 ?auto_15298 ) ( not ( = ?auto_15297 ?auto_15295 ) ) ( not ( = ?auto_15296 ?auto_15295 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15297 ?auto_15296 ?auto_15294 )
      ( FLY-3PPL-VERIFY ?auto_15295 ?auto_15296 ?auto_15297 ?auto_15294 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15321 - PERSON
      ?auto_15322 - PERSON
      ?auto_15323 - PERSON
      ?auto_15320 - CITY
    )
    :vars
    (
      ?auto_15325 - FLEVEL
      ?auto_15327 - FLEVEL
      ?auto_15328 - CITY
      ?auto_15324 - AIRCRAFT
      ?auto_15326 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_15325 ?auto_15327 ) ( not ( = ?auto_15320 ?auto_15328 ) ) ( not ( = ?auto_15327 ?auto_15325 ) ) ( PERSON-AT ?auto_15322 ?auto_15320 ) ( not ( = ?auto_15322 ?auto_15321 ) ) ( PERSON-AT ?auto_15321 ?auto_15328 ) ( AIRCRAFT-AT ?auto_15324 ?auto_15320 ) ( FUEL-LEVEL ?auto_15324 ?auto_15325 ) ( IN ?auto_15326 ?auto_15324 ) ( not ( = ?auto_15322 ?auto_15326 ) ) ( not ( = ?auto_15321 ?auto_15326 ) ) ( PERSON-AT ?auto_15323 ?auto_15320 ) ( not ( = ?auto_15321 ?auto_15323 ) ) ( not ( = ?auto_15322 ?auto_15323 ) ) ( not ( = ?auto_15323 ?auto_15326 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15322 ?auto_15321 ?auto_15320 )
      ( FLY-3PPL-VERIFY ?auto_15321 ?auto_15322 ?auto_15323 ?auto_15320 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15330 - PERSON
      ?auto_15331 - PERSON
      ?auto_15332 - PERSON
      ?auto_15329 - CITY
    )
    :vars
    (
      ?auto_15334 - FLEVEL
      ?auto_15335 - FLEVEL
      ?auto_15336 - CITY
      ?auto_15333 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15334 ?auto_15335 ) ( not ( = ?auto_15329 ?auto_15336 ) ) ( not ( = ?auto_15335 ?auto_15334 ) ) ( PERSON-AT ?auto_15331 ?auto_15329 ) ( not ( = ?auto_15331 ?auto_15330 ) ) ( PERSON-AT ?auto_15330 ?auto_15336 ) ( AIRCRAFT-AT ?auto_15333 ?auto_15329 ) ( FUEL-LEVEL ?auto_15333 ?auto_15334 ) ( IN ?auto_15332 ?auto_15333 ) ( not ( = ?auto_15331 ?auto_15332 ) ) ( not ( = ?auto_15330 ?auto_15332 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15331 ?auto_15330 ?auto_15329 )
      ( FLY-3PPL-VERIFY ?auto_15330 ?auto_15331 ?auto_15332 ?auto_15329 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15347 - PERSON
      ?auto_15348 - PERSON
      ?auto_15349 - PERSON
      ?auto_15346 - CITY
    )
    :vars
    (
      ?auto_15351 - FLEVEL
      ?auto_15352 - FLEVEL
      ?auto_15353 - CITY
      ?auto_15350 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15351 ?auto_15352 ) ( not ( = ?auto_15346 ?auto_15353 ) ) ( not ( = ?auto_15352 ?auto_15351 ) ) ( PERSON-AT ?auto_15349 ?auto_15346 ) ( not ( = ?auto_15349 ?auto_15347 ) ) ( PERSON-AT ?auto_15347 ?auto_15353 ) ( AIRCRAFT-AT ?auto_15350 ?auto_15346 ) ( FUEL-LEVEL ?auto_15350 ?auto_15351 ) ( IN ?auto_15348 ?auto_15350 ) ( not ( = ?auto_15349 ?auto_15348 ) ) ( not ( = ?auto_15347 ?auto_15348 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15349 ?auto_15347 ?auto_15346 )
      ( FLY-3PPL-VERIFY ?auto_15347 ?auto_15348 ?auto_15349 ?auto_15346 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_15401 - PERSON
      ?auto_15400 - CITY
    )
    :vars
    (
      ?auto_15403 - FLEVEL
      ?auto_15406 - FLEVEL
      ?auto_15407 - CITY
      ?auto_15405 - PERSON
      ?auto_15404 - PERSON
      ?auto_15402 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15403 ?auto_15406 ) ( not ( = ?auto_15400 ?auto_15407 ) ) ( not ( = ?auto_15406 ?auto_15403 ) ) ( PERSON-AT ?auto_15405 ?auto_15400 ) ( not ( = ?auto_15405 ?auto_15401 ) ) ( PERSON-AT ?auto_15401 ?auto_15407 ) ( IN ?auto_15404 ?auto_15402 ) ( not ( = ?auto_15405 ?auto_15404 ) ) ( not ( = ?auto_15401 ?auto_15404 ) ) ( AIRCRAFT-AT ?auto_15402 ?auto_15407 ) ( FUEL-LEVEL ?auto_15402 ?auto_15406 ) )
    :subtasks
    ( ( !FLY ?auto_15402 ?auto_15407 ?auto_15400 ?auto_15406 ?auto_15403 )
      ( FLY-2PPL ?auto_15405 ?auto_15401 ?auto_15400 )
      ( FLY-1PPL-VERIFY ?auto_15401 ?auto_15400 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15409 - PERSON
      ?auto_15410 - PERSON
      ?auto_15408 - CITY
    )
    :vars
    (
      ?auto_15411 - FLEVEL
      ?auto_15412 - FLEVEL
      ?auto_15415 - CITY
      ?auto_15414 - PERSON
      ?auto_15413 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15411 ?auto_15412 ) ( not ( = ?auto_15408 ?auto_15415 ) ) ( not ( = ?auto_15412 ?auto_15411 ) ) ( PERSON-AT ?auto_15409 ?auto_15408 ) ( not ( = ?auto_15409 ?auto_15410 ) ) ( PERSON-AT ?auto_15410 ?auto_15415 ) ( IN ?auto_15414 ?auto_15413 ) ( not ( = ?auto_15409 ?auto_15414 ) ) ( not ( = ?auto_15410 ?auto_15414 ) ) ( AIRCRAFT-AT ?auto_15413 ?auto_15415 ) ( FUEL-LEVEL ?auto_15413 ?auto_15412 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_15410 ?auto_15408 )
      ( FLY-2PPL-VERIFY ?auto_15409 ?auto_15410 ?auto_15408 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15417 - PERSON
      ?auto_15418 - PERSON
      ?auto_15416 - CITY
    )
    :vars
    (
      ?auto_15419 - FLEVEL
      ?auto_15423 - FLEVEL
      ?auto_15420 - CITY
      ?auto_15421 - PERSON
      ?auto_15422 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15419 ?auto_15423 ) ( not ( = ?auto_15416 ?auto_15420 ) ) ( not ( = ?auto_15423 ?auto_15419 ) ) ( PERSON-AT ?auto_15421 ?auto_15416 ) ( not ( = ?auto_15421 ?auto_15418 ) ) ( PERSON-AT ?auto_15418 ?auto_15420 ) ( IN ?auto_15417 ?auto_15422 ) ( not ( = ?auto_15421 ?auto_15417 ) ) ( not ( = ?auto_15418 ?auto_15417 ) ) ( AIRCRAFT-AT ?auto_15422 ?auto_15420 ) ( FUEL-LEVEL ?auto_15422 ?auto_15423 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15421 ?auto_15418 ?auto_15416 )
      ( FLY-2PPL-VERIFY ?auto_15417 ?auto_15418 ?auto_15416 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15425 - PERSON
      ?auto_15426 - PERSON
      ?auto_15424 - CITY
    )
    :vars
    (
      ?auto_15427 - FLEVEL
      ?auto_15431 - FLEVEL
      ?auto_15428 - CITY
      ?auto_15429 - PERSON
      ?auto_15430 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15427 ?auto_15431 ) ( not ( = ?auto_15424 ?auto_15428 ) ) ( not ( = ?auto_15431 ?auto_15427 ) ) ( PERSON-AT ?auto_15426 ?auto_15424 ) ( not ( = ?auto_15426 ?auto_15425 ) ) ( PERSON-AT ?auto_15425 ?auto_15428 ) ( IN ?auto_15429 ?auto_15430 ) ( not ( = ?auto_15426 ?auto_15429 ) ) ( not ( = ?auto_15425 ?auto_15429 ) ) ( AIRCRAFT-AT ?auto_15430 ?auto_15428 ) ( FUEL-LEVEL ?auto_15430 ?auto_15431 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15426 ?auto_15425 ?auto_15424 )
      ( FLY-2PPL-VERIFY ?auto_15425 ?auto_15426 ?auto_15424 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15433 - PERSON
      ?auto_15434 - PERSON
      ?auto_15432 - CITY
    )
    :vars
    (
      ?auto_15435 - FLEVEL
      ?auto_15439 - FLEVEL
      ?auto_15436 - CITY
      ?auto_15437 - PERSON
      ?auto_15438 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15435 ?auto_15439 ) ( not ( = ?auto_15432 ?auto_15436 ) ) ( not ( = ?auto_15439 ?auto_15435 ) ) ( PERSON-AT ?auto_15437 ?auto_15432 ) ( not ( = ?auto_15437 ?auto_15433 ) ) ( PERSON-AT ?auto_15433 ?auto_15436 ) ( IN ?auto_15434 ?auto_15438 ) ( not ( = ?auto_15437 ?auto_15434 ) ) ( not ( = ?auto_15433 ?auto_15434 ) ) ( AIRCRAFT-AT ?auto_15438 ?auto_15436 ) ( FUEL-LEVEL ?auto_15438 ?auto_15439 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15437 ?auto_15433 ?auto_15432 )
      ( FLY-2PPL-VERIFY ?auto_15433 ?auto_15434 ?auto_15432 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15450 - PERSON
      ?auto_15451 - PERSON
      ?auto_15452 - PERSON
      ?auto_15449 - CITY
    )
    :vars
    (
      ?auto_15453 - FLEVEL
      ?auto_15457 - FLEVEL
      ?auto_15454 - CITY
      ?auto_15455 - PERSON
      ?auto_15456 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15453 ?auto_15457 ) ( not ( = ?auto_15449 ?auto_15454 ) ) ( not ( = ?auto_15457 ?auto_15453 ) ) ( PERSON-AT ?auto_15450 ?auto_15449 ) ( not ( = ?auto_15450 ?auto_15452 ) ) ( PERSON-AT ?auto_15452 ?auto_15454 ) ( IN ?auto_15455 ?auto_15456 ) ( not ( = ?auto_15450 ?auto_15455 ) ) ( not ( = ?auto_15452 ?auto_15455 ) ) ( AIRCRAFT-AT ?auto_15456 ?auto_15454 ) ( FUEL-LEVEL ?auto_15456 ?auto_15457 ) ( PERSON-AT ?auto_15451 ?auto_15449 ) ( not ( = ?auto_15450 ?auto_15451 ) ) ( not ( = ?auto_15451 ?auto_15452 ) ) ( not ( = ?auto_15451 ?auto_15455 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15450 ?auto_15452 ?auto_15449 )
      ( FLY-3PPL-VERIFY ?auto_15450 ?auto_15451 ?auto_15452 ?auto_15449 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15459 - PERSON
      ?auto_15460 - PERSON
      ?auto_15461 - PERSON
      ?auto_15458 - CITY
    )
    :vars
    (
      ?auto_15462 - FLEVEL
      ?auto_15465 - FLEVEL
      ?auto_15463 - CITY
      ?auto_15464 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15462 ?auto_15465 ) ( not ( = ?auto_15458 ?auto_15463 ) ) ( not ( = ?auto_15465 ?auto_15462 ) ) ( PERSON-AT ?auto_15459 ?auto_15458 ) ( not ( = ?auto_15459 ?auto_15461 ) ) ( PERSON-AT ?auto_15461 ?auto_15463 ) ( IN ?auto_15460 ?auto_15464 ) ( not ( = ?auto_15459 ?auto_15460 ) ) ( not ( = ?auto_15461 ?auto_15460 ) ) ( AIRCRAFT-AT ?auto_15464 ?auto_15463 ) ( FUEL-LEVEL ?auto_15464 ?auto_15465 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15459 ?auto_15461 ?auto_15458 )
      ( FLY-3PPL-VERIFY ?auto_15459 ?auto_15460 ?auto_15461 ?auto_15458 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15467 - PERSON
      ?auto_15468 - PERSON
      ?auto_15469 - PERSON
      ?auto_15466 - CITY
    )
    :vars
    (
      ?auto_15470 - FLEVEL
      ?auto_15474 - FLEVEL
      ?auto_15471 - CITY
      ?auto_15472 - PERSON
      ?auto_15473 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15470 ?auto_15474 ) ( not ( = ?auto_15466 ?auto_15471 ) ) ( not ( = ?auto_15474 ?auto_15470 ) ) ( PERSON-AT ?auto_15469 ?auto_15466 ) ( not ( = ?auto_15469 ?auto_15468 ) ) ( PERSON-AT ?auto_15468 ?auto_15471 ) ( IN ?auto_15472 ?auto_15473 ) ( not ( = ?auto_15469 ?auto_15472 ) ) ( not ( = ?auto_15468 ?auto_15472 ) ) ( AIRCRAFT-AT ?auto_15473 ?auto_15471 ) ( FUEL-LEVEL ?auto_15473 ?auto_15474 ) ( PERSON-AT ?auto_15467 ?auto_15466 ) ( not ( = ?auto_15467 ?auto_15468 ) ) ( not ( = ?auto_15467 ?auto_15469 ) ) ( not ( = ?auto_15467 ?auto_15472 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15469 ?auto_15468 ?auto_15466 )
      ( FLY-3PPL-VERIFY ?auto_15467 ?auto_15468 ?auto_15469 ?auto_15466 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15476 - PERSON
      ?auto_15477 - PERSON
      ?auto_15478 - PERSON
      ?auto_15475 - CITY
    )
    :vars
    (
      ?auto_15479 - FLEVEL
      ?auto_15482 - FLEVEL
      ?auto_15480 - CITY
      ?auto_15481 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15479 ?auto_15482 ) ( not ( = ?auto_15475 ?auto_15480 ) ) ( not ( = ?auto_15482 ?auto_15479 ) ) ( PERSON-AT ?auto_15476 ?auto_15475 ) ( not ( = ?auto_15476 ?auto_15477 ) ) ( PERSON-AT ?auto_15477 ?auto_15480 ) ( IN ?auto_15478 ?auto_15481 ) ( not ( = ?auto_15476 ?auto_15478 ) ) ( not ( = ?auto_15477 ?auto_15478 ) ) ( AIRCRAFT-AT ?auto_15481 ?auto_15480 ) ( FUEL-LEVEL ?auto_15481 ?auto_15482 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15476 ?auto_15477 ?auto_15475 )
      ( FLY-3PPL-VERIFY ?auto_15476 ?auto_15477 ?auto_15478 ?auto_15475 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15493 - PERSON
      ?auto_15494 - PERSON
      ?auto_15495 - PERSON
      ?auto_15492 - CITY
    )
    :vars
    (
      ?auto_15496 - FLEVEL
      ?auto_15499 - FLEVEL
      ?auto_15497 - CITY
      ?auto_15498 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15496 ?auto_15499 ) ( not ( = ?auto_15492 ?auto_15497 ) ) ( not ( = ?auto_15499 ?auto_15496 ) ) ( PERSON-AT ?auto_15494 ?auto_15492 ) ( not ( = ?auto_15494 ?auto_15495 ) ) ( PERSON-AT ?auto_15495 ?auto_15497 ) ( IN ?auto_15493 ?auto_15498 ) ( not ( = ?auto_15494 ?auto_15493 ) ) ( not ( = ?auto_15495 ?auto_15493 ) ) ( AIRCRAFT-AT ?auto_15498 ?auto_15497 ) ( FUEL-LEVEL ?auto_15498 ?auto_15499 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15494 ?auto_15495 ?auto_15492 )
      ( FLY-3PPL-VERIFY ?auto_15493 ?auto_15494 ?auto_15495 ?auto_15492 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15510 - PERSON
      ?auto_15511 - PERSON
      ?auto_15512 - PERSON
      ?auto_15509 - CITY
    )
    :vars
    (
      ?auto_15513 - FLEVEL
      ?auto_15516 - FLEVEL
      ?auto_15514 - CITY
      ?auto_15515 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15513 ?auto_15516 ) ( not ( = ?auto_15509 ?auto_15514 ) ) ( not ( = ?auto_15516 ?auto_15513 ) ) ( PERSON-AT ?auto_15512 ?auto_15509 ) ( not ( = ?auto_15512 ?auto_15511 ) ) ( PERSON-AT ?auto_15511 ?auto_15514 ) ( IN ?auto_15510 ?auto_15515 ) ( not ( = ?auto_15512 ?auto_15510 ) ) ( not ( = ?auto_15511 ?auto_15510 ) ) ( AIRCRAFT-AT ?auto_15515 ?auto_15514 ) ( FUEL-LEVEL ?auto_15515 ?auto_15516 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15512 ?auto_15511 ?auto_15509 )
      ( FLY-3PPL-VERIFY ?auto_15510 ?auto_15511 ?auto_15512 ?auto_15509 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15536 - PERSON
      ?auto_15537 - PERSON
      ?auto_15538 - PERSON
      ?auto_15535 - CITY
    )
    :vars
    (
      ?auto_15539 - FLEVEL
      ?auto_15543 - FLEVEL
      ?auto_15540 - CITY
      ?auto_15541 - PERSON
      ?auto_15542 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15539 ?auto_15543 ) ( not ( = ?auto_15535 ?auto_15540 ) ) ( not ( = ?auto_15543 ?auto_15539 ) ) ( PERSON-AT ?auto_15537 ?auto_15535 ) ( not ( = ?auto_15537 ?auto_15536 ) ) ( PERSON-AT ?auto_15536 ?auto_15540 ) ( IN ?auto_15541 ?auto_15542 ) ( not ( = ?auto_15537 ?auto_15541 ) ) ( not ( = ?auto_15536 ?auto_15541 ) ) ( AIRCRAFT-AT ?auto_15542 ?auto_15540 ) ( FUEL-LEVEL ?auto_15542 ?auto_15543 ) ( PERSON-AT ?auto_15538 ?auto_15535 ) ( not ( = ?auto_15536 ?auto_15538 ) ) ( not ( = ?auto_15537 ?auto_15538 ) ) ( not ( = ?auto_15538 ?auto_15541 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15537 ?auto_15536 ?auto_15535 )
      ( FLY-3PPL-VERIFY ?auto_15536 ?auto_15537 ?auto_15538 ?auto_15535 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15545 - PERSON
      ?auto_15546 - PERSON
      ?auto_15547 - PERSON
      ?auto_15544 - CITY
    )
    :vars
    (
      ?auto_15548 - FLEVEL
      ?auto_15551 - FLEVEL
      ?auto_15549 - CITY
      ?auto_15550 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15548 ?auto_15551 ) ( not ( = ?auto_15544 ?auto_15549 ) ) ( not ( = ?auto_15551 ?auto_15548 ) ) ( PERSON-AT ?auto_15546 ?auto_15544 ) ( not ( = ?auto_15546 ?auto_15545 ) ) ( PERSON-AT ?auto_15545 ?auto_15549 ) ( IN ?auto_15547 ?auto_15550 ) ( not ( = ?auto_15546 ?auto_15547 ) ) ( not ( = ?auto_15545 ?auto_15547 ) ) ( AIRCRAFT-AT ?auto_15550 ?auto_15549 ) ( FUEL-LEVEL ?auto_15550 ?auto_15551 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15546 ?auto_15545 ?auto_15544 )
      ( FLY-3PPL-VERIFY ?auto_15545 ?auto_15546 ?auto_15547 ?auto_15544 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15562 - PERSON
      ?auto_15563 - PERSON
      ?auto_15564 - PERSON
      ?auto_15561 - CITY
    )
    :vars
    (
      ?auto_15565 - FLEVEL
      ?auto_15568 - FLEVEL
      ?auto_15566 - CITY
      ?auto_15567 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15565 ?auto_15568 ) ( not ( = ?auto_15561 ?auto_15566 ) ) ( not ( = ?auto_15568 ?auto_15565 ) ) ( PERSON-AT ?auto_15564 ?auto_15561 ) ( not ( = ?auto_15564 ?auto_15562 ) ) ( PERSON-AT ?auto_15562 ?auto_15566 ) ( IN ?auto_15563 ?auto_15567 ) ( not ( = ?auto_15564 ?auto_15563 ) ) ( not ( = ?auto_15562 ?auto_15563 ) ) ( AIRCRAFT-AT ?auto_15567 ?auto_15566 ) ( FUEL-LEVEL ?auto_15567 ?auto_15568 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15564 ?auto_15562 ?auto_15561 )
      ( FLY-3PPL-VERIFY ?auto_15562 ?auto_15563 ?auto_15564 ?auto_15561 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_15616 - PERSON
      ?auto_15615 - CITY
    )
    :vars
    (
      ?auto_15617 - FLEVEL
      ?auto_15622 - FLEVEL
      ?auto_15618 - CITY
      ?auto_15619 - PERSON
      ?auto_15620 - PERSON
      ?auto_15621 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15617 ?auto_15622 ) ( not ( = ?auto_15615 ?auto_15618 ) ) ( not ( = ?auto_15622 ?auto_15617 ) ) ( PERSON-AT ?auto_15619 ?auto_15615 ) ( not ( = ?auto_15619 ?auto_15616 ) ) ( PERSON-AT ?auto_15616 ?auto_15618 ) ( not ( = ?auto_15619 ?auto_15620 ) ) ( not ( = ?auto_15616 ?auto_15620 ) ) ( AIRCRAFT-AT ?auto_15621 ?auto_15618 ) ( FUEL-LEVEL ?auto_15621 ?auto_15622 ) ( PERSON-AT ?auto_15620 ?auto_15618 ) )
    :subtasks
    ( ( !BOARD ?auto_15620 ?auto_15621 ?auto_15618 )
      ( FLY-2PPL ?auto_15619 ?auto_15616 ?auto_15615 )
      ( FLY-1PPL-VERIFY ?auto_15616 ?auto_15615 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15624 - PERSON
      ?auto_15625 - PERSON
      ?auto_15623 - CITY
    )
    :vars
    (
      ?auto_15626 - FLEVEL
      ?auto_15630 - FLEVEL
      ?auto_15627 - CITY
      ?auto_15629 - PERSON
      ?auto_15628 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15626 ?auto_15630 ) ( not ( = ?auto_15623 ?auto_15627 ) ) ( not ( = ?auto_15630 ?auto_15626 ) ) ( PERSON-AT ?auto_15624 ?auto_15623 ) ( not ( = ?auto_15624 ?auto_15625 ) ) ( PERSON-AT ?auto_15625 ?auto_15627 ) ( not ( = ?auto_15624 ?auto_15629 ) ) ( not ( = ?auto_15625 ?auto_15629 ) ) ( AIRCRAFT-AT ?auto_15628 ?auto_15627 ) ( FUEL-LEVEL ?auto_15628 ?auto_15630 ) ( PERSON-AT ?auto_15629 ?auto_15627 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_15625 ?auto_15623 )
      ( FLY-2PPL-VERIFY ?auto_15624 ?auto_15625 ?auto_15623 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15632 - PERSON
      ?auto_15633 - PERSON
      ?auto_15631 - CITY
    )
    :vars
    (
      ?auto_15635 - FLEVEL
      ?auto_15636 - FLEVEL
      ?auto_15634 - CITY
      ?auto_15637 - PERSON
      ?auto_15638 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15635 ?auto_15636 ) ( not ( = ?auto_15631 ?auto_15634 ) ) ( not ( = ?auto_15636 ?auto_15635 ) ) ( PERSON-AT ?auto_15637 ?auto_15631 ) ( not ( = ?auto_15637 ?auto_15633 ) ) ( PERSON-AT ?auto_15633 ?auto_15634 ) ( not ( = ?auto_15637 ?auto_15632 ) ) ( not ( = ?auto_15633 ?auto_15632 ) ) ( AIRCRAFT-AT ?auto_15638 ?auto_15634 ) ( FUEL-LEVEL ?auto_15638 ?auto_15636 ) ( PERSON-AT ?auto_15632 ?auto_15634 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15637 ?auto_15633 ?auto_15631 )
      ( FLY-2PPL-VERIFY ?auto_15632 ?auto_15633 ?auto_15631 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15640 - PERSON
      ?auto_15641 - PERSON
      ?auto_15639 - CITY
    )
    :vars
    (
      ?auto_15644 - FLEVEL
      ?auto_15645 - FLEVEL
      ?auto_15642 - CITY
      ?auto_15643 - PERSON
      ?auto_15646 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15644 ?auto_15645 ) ( not ( = ?auto_15639 ?auto_15642 ) ) ( not ( = ?auto_15645 ?auto_15644 ) ) ( PERSON-AT ?auto_15641 ?auto_15639 ) ( not ( = ?auto_15641 ?auto_15640 ) ) ( PERSON-AT ?auto_15640 ?auto_15642 ) ( not ( = ?auto_15641 ?auto_15643 ) ) ( not ( = ?auto_15640 ?auto_15643 ) ) ( AIRCRAFT-AT ?auto_15646 ?auto_15642 ) ( FUEL-LEVEL ?auto_15646 ?auto_15645 ) ( PERSON-AT ?auto_15643 ?auto_15642 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15641 ?auto_15640 ?auto_15639 )
      ( FLY-2PPL-VERIFY ?auto_15640 ?auto_15641 ?auto_15639 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15648 - PERSON
      ?auto_15649 - PERSON
      ?auto_15647 - CITY
    )
    :vars
    (
      ?auto_15651 - FLEVEL
      ?auto_15652 - FLEVEL
      ?auto_15650 - CITY
      ?auto_15653 - PERSON
      ?auto_15654 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15651 ?auto_15652 ) ( not ( = ?auto_15647 ?auto_15650 ) ) ( not ( = ?auto_15652 ?auto_15651 ) ) ( PERSON-AT ?auto_15653 ?auto_15647 ) ( not ( = ?auto_15653 ?auto_15648 ) ) ( PERSON-AT ?auto_15648 ?auto_15650 ) ( not ( = ?auto_15653 ?auto_15649 ) ) ( not ( = ?auto_15648 ?auto_15649 ) ) ( AIRCRAFT-AT ?auto_15654 ?auto_15650 ) ( FUEL-LEVEL ?auto_15654 ?auto_15652 ) ( PERSON-AT ?auto_15649 ?auto_15650 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15653 ?auto_15648 ?auto_15647 )
      ( FLY-2PPL-VERIFY ?auto_15648 ?auto_15649 ?auto_15647 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15665 - PERSON
      ?auto_15666 - PERSON
      ?auto_15667 - PERSON
      ?auto_15664 - CITY
    )
    :vars
    (
      ?auto_15670 - FLEVEL
      ?auto_15671 - FLEVEL
      ?auto_15668 - CITY
      ?auto_15669 - PERSON
      ?auto_15672 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15670 ?auto_15671 ) ( not ( = ?auto_15664 ?auto_15668 ) ) ( not ( = ?auto_15671 ?auto_15670 ) ) ( PERSON-AT ?auto_15666 ?auto_15664 ) ( not ( = ?auto_15666 ?auto_15667 ) ) ( PERSON-AT ?auto_15667 ?auto_15668 ) ( not ( = ?auto_15666 ?auto_15669 ) ) ( not ( = ?auto_15667 ?auto_15669 ) ) ( AIRCRAFT-AT ?auto_15672 ?auto_15668 ) ( FUEL-LEVEL ?auto_15672 ?auto_15671 ) ( PERSON-AT ?auto_15669 ?auto_15668 ) ( PERSON-AT ?auto_15665 ?auto_15664 ) ( not ( = ?auto_15665 ?auto_15666 ) ) ( not ( = ?auto_15665 ?auto_15667 ) ) ( not ( = ?auto_15665 ?auto_15669 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15666 ?auto_15667 ?auto_15664 )
      ( FLY-3PPL-VERIFY ?auto_15665 ?auto_15666 ?auto_15667 ?auto_15664 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15674 - PERSON
      ?auto_15675 - PERSON
      ?auto_15676 - PERSON
      ?auto_15673 - CITY
    )
    :vars
    (
      ?auto_15678 - FLEVEL
      ?auto_15679 - FLEVEL
      ?auto_15677 - CITY
      ?auto_15680 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15678 ?auto_15679 ) ( not ( = ?auto_15673 ?auto_15677 ) ) ( not ( = ?auto_15679 ?auto_15678 ) ) ( PERSON-AT ?auto_15674 ?auto_15673 ) ( not ( = ?auto_15674 ?auto_15676 ) ) ( PERSON-AT ?auto_15676 ?auto_15677 ) ( not ( = ?auto_15674 ?auto_15675 ) ) ( not ( = ?auto_15676 ?auto_15675 ) ) ( AIRCRAFT-AT ?auto_15680 ?auto_15677 ) ( FUEL-LEVEL ?auto_15680 ?auto_15679 ) ( PERSON-AT ?auto_15675 ?auto_15677 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15674 ?auto_15676 ?auto_15673 )
      ( FLY-3PPL-VERIFY ?auto_15674 ?auto_15675 ?auto_15676 ?auto_15673 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15682 - PERSON
      ?auto_15683 - PERSON
      ?auto_15684 - PERSON
      ?auto_15681 - CITY
    )
    :vars
    (
      ?auto_15687 - FLEVEL
      ?auto_15688 - FLEVEL
      ?auto_15685 - CITY
      ?auto_15686 - PERSON
      ?auto_15689 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15687 ?auto_15688 ) ( not ( = ?auto_15681 ?auto_15685 ) ) ( not ( = ?auto_15688 ?auto_15687 ) ) ( PERSON-AT ?auto_15684 ?auto_15681 ) ( not ( = ?auto_15684 ?auto_15683 ) ) ( PERSON-AT ?auto_15683 ?auto_15685 ) ( not ( = ?auto_15684 ?auto_15686 ) ) ( not ( = ?auto_15683 ?auto_15686 ) ) ( AIRCRAFT-AT ?auto_15689 ?auto_15685 ) ( FUEL-LEVEL ?auto_15689 ?auto_15688 ) ( PERSON-AT ?auto_15686 ?auto_15685 ) ( PERSON-AT ?auto_15682 ?auto_15681 ) ( not ( = ?auto_15682 ?auto_15683 ) ) ( not ( = ?auto_15682 ?auto_15684 ) ) ( not ( = ?auto_15682 ?auto_15686 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15684 ?auto_15683 ?auto_15681 )
      ( FLY-3PPL-VERIFY ?auto_15682 ?auto_15683 ?auto_15684 ?auto_15681 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15691 - PERSON
      ?auto_15692 - PERSON
      ?auto_15693 - PERSON
      ?auto_15690 - CITY
    )
    :vars
    (
      ?auto_15695 - FLEVEL
      ?auto_15696 - FLEVEL
      ?auto_15694 - CITY
      ?auto_15697 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15695 ?auto_15696 ) ( not ( = ?auto_15690 ?auto_15694 ) ) ( not ( = ?auto_15696 ?auto_15695 ) ) ( PERSON-AT ?auto_15691 ?auto_15690 ) ( not ( = ?auto_15691 ?auto_15692 ) ) ( PERSON-AT ?auto_15692 ?auto_15694 ) ( not ( = ?auto_15691 ?auto_15693 ) ) ( not ( = ?auto_15692 ?auto_15693 ) ) ( AIRCRAFT-AT ?auto_15697 ?auto_15694 ) ( FUEL-LEVEL ?auto_15697 ?auto_15696 ) ( PERSON-AT ?auto_15693 ?auto_15694 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15691 ?auto_15692 ?auto_15690 )
      ( FLY-3PPL-VERIFY ?auto_15691 ?auto_15692 ?auto_15693 ?auto_15690 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15708 - PERSON
      ?auto_15709 - PERSON
      ?auto_15710 - PERSON
      ?auto_15707 - CITY
    )
    :vars
    (
      ?auto_15712 - FLEVEL
      ?auto_15713 - FLEVEL
      ?auto_15711 - CITY
      ?auto_15714 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15712 ?auto_15713 ) ( not ( = ?auto_15707 ?auto_15711 ) ) ( not ( = ?auto_15713 ?auto_15712 ) ) ( PERSON-AT ?auto_15709 ?auto_15707 ) ( not ( = ?auto_15709 ?auto_15710 ) ) ( PERSON-AT ?auto_15710 ?auto_15711 ) ( not ( = ?auto_15709 ?auto_15708 ) ) ( not ( = ?auto_15710 ?auto_15708 ) ) ( AIRCRAFT-AT ?auto_15714 ?auto_15711 ) ( FUEL-LEVEL ?auto_15714 ?auto_15713 ) ( PERSON-AT ?auto_15708 ?auto_15711 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15709 ?auto_15710 ?auto_15707 )
      ( FLY-3PPL-VERIFY ?auto_15708 ?auto_15709 ?auto_15710 ?auto_15707 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15725 - PERSON
      ?auto_15726 - PERSON
      ?auto_15727 - PERSON
      ?auto_15724 - CITY
    )
    :vars
    (
      ?auto_15729 - FLEVEL
      ?auto_15730 - FLEVEL
      ?auto_15728 - CITY
      ?auto_15731 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15729 ?auto_15730 ) ( not ( = ?auto_15724 ?auto_15728 ) ) ( not ( = ?auto_15730 ?auto_15729 ) ) ( PERSON-AT ?auto_15727 ?auto_15724 ) ( not ( = ?auto_15727 ?auto_15726 ) ) ( PERSON-AT ?auto_15726 ?auto_15728 ) ( not ( = ?auto_15727 ?auto_15725 ) ) ( not ( = ?auto_15726 ?auto_15725 ) ) ( AIRCRAFT-AT ?auto_15731 ?auto_15728 ) ( FUEL-LEVEL ?auto_15731 ?auto_15730 ) ( PERSON-AT ?auto_15725 ?auto_15728 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15727 ?auto_15726 ?auto_15724 )
      ( FLY-3PPL-VERIFY ?auto_15725 ?auto_15726 ?auto_15727 ?auto_15724 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15751 - PERSON
      ?auto_15752 - PERSON
      ?auto_15753 - PERSON
      ?auto_15750 - CITY
    )
    :vars
    (
      ?auto_15756 - FLEVEL
      ?auto_15757 - FLEVEL
      ?auto_15754 - CITY
      ?auto_15755 - PERSON
      ?auto_15758 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15756 ?auto_15757 ) ( not ( = ?auto_15750 ?auto_15754 ) ) ( not ( = ?auto_15757 ?auto_15756 ) ) ( PERSON-AT ?auto_15753 ?auto_15750 ) ( not ( = ?auto_15753 ?auto_15751 ) ) ( PERSON-AT ?auto_15751 ?auto_15754 ) ( not ( = ?auto_15753 ?auto_15755 ) ) ( not ( = ?auto_15751 ?auto_15755 ) ) ( AIRCRAFT-AT ?auto_15758 ?auto_15754 ) ( FUEL-LEVEL ?auto_15758 ?auto_15757 ) ( PERSON-AT ?auto_15755 ?auto_15754 ) ( PERSON-AT ?auto_15752 ?auto_15750 ) ( not ( = ?auto_15751 ?auto_15752 ) ) ( not ( = ?auto_15752 ?auto_15753 ) ) ( not ( = ?auto_15752 ?auto_15755 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15753 ?auto_15751 ?auto_15750 )
      ( FLY-3PPL-VERIFY ?auto_15751 ?auto_15752 ?auto_15753 ?auto_15750 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15760 - PERSON
      ?auto_15761 - PERSON
      ?auto_15762 - PERSON
      ?auto_15759 - CITY
    )
    :vars
    (
      ?auto_15764 - FLEVEL
      ?auto_15765 - FLEVEL
      ?auto_15763 - CITY
      ?auto_15766 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15764 ?auto_15765 ) ( not ( = ?auto_15759 ?auto_15763 ) ) ( not ( = ?auto_15765 ?auto_15764 ) ) ( PERSON-AT ?auto_15761 ?auto_15759 ) ( not ( = ?auto_15761 ?auto_15760 ) ) ( PERSON-AT ?auto_15760 ?auto_15763 ) ( not ( = ?auto_15761 ?auto_15762 ) ) ( not ( = ?auto_15760 ?auto_15762 ) ) ( AIRCRAFT-AT ?auto_15766 ?auto_15763 ) ( FUEL-LEVEL ?auto_15766 ?auto_15765 ) ( PERSON-AT ?auto_15762 ?auto_15763 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15761 ?auto_15760 ?auto_15759 )
      ( FLY-3PPL-VERIFY ?auto_15760 ?auto_15761 ?auto_15762 ?auto_15759 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15777 - PERSON
      ?auto_15778 - PERSON
      ?auto_15779 - PERSON
      ?auto_15776 - CITY
    )
    :vars
    (
      ?auto_15781 - FLEVEL
      ?auto_15782 - FLEVEL
      ?auto_15780 - CITY
      ?auto_15783 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15781 ?auto_15782 ) ( not ( = ?auto_15776 ?auto_15780 ) ) ( not ( = ?auto_15782 ?auto_15781 ) ) ( PERSON-AT ?auto_15779 ?auto_15776 ) ( not ( = ?auto_15779 ?auto_15777 ) ) ( PERSON-AT ?auto_15777 ?auto_15780 ) ( not ( = ?auto_15779 ?auto_15778 ) ) ( not ( = ?auto_15777 ?auto_15778 ) ) ( AIRCRAFT-AT ?auto_15783 ?auto_15780 ) ( FUEL-LEVEL ?auto_15783 ?auto_15782 ) ( PERSON-AT ?auto_15778 ?auto_15780 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15779 ?auto_15777 ?auto_15776 )
      ( FLY-3PPL-VERIFY ?auto_15777 ?auto_15778 ?auto_15779 ?auto_15776 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_15831 - PERSON
      ?auto_15830 - CITY
    )
    :vars
    (
      ?auto_15834 - FLEVEL
      ?auto_15835 - FLEVEL
      ?auto_15832 - CITY
      ?auto_15836 - PERSON
      ?auto_15833 - PERSON
      ?auto_15837 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15834 ?auto_15835 ) ( not ( = ?auto_15830 ?auto_15832 ) ) ( not ( = ?auto_15835 ?auto_15834 ) ) ( PERSON-AT ?auto_15836 ?auto_15830 ) ( not ( = ?auto_15836 ?auto_15831 ) ) ( PERSON-AT ?auto_15831 ?auto_15832 ) ( not ( = ?auto_15836 ?auto_15833 ) ) ( not ( = ?auto_15831 ?auto_15833 ) ) ( AIRCRAFT-AT ?auto_15837 ?auto_15832 ) ( PERSON-AT ?auto_15833 ?auto_15832 ) ( FUEL-LEVEL ?auto_15837 ?auto_15834 ) )
    :subtasks
    ( ( !REFUEL ?auto_15837 ?auto_15832 ?auto_15834 ?auto_15835 )
      ( FLY-2PPL ?auto_15836 ?auto_15831 ?auto_15830 )
      ( FLY-1PPL-VERIFY ?auto_15831 ?auto_15830 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15839 - PERSON
      ?auto_15840 - PERSON
      ?auto_15838 - CITY
    )
    :vars
    (
      ?auto_15845 - FLEVEL
      ?auto_15841 - FLEVEL
      ?auto_15843 - CITY
      ?auto_15844 - PERSON
      ?auto_15842 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15845 ?auto_15841 ) ( not ( = ?auto_15838 ?auto_15843 ) ) ( not ( = ?auto_15841 ?auto_15845 ) ) ( PERSON-AT ?auto_15839 ?auto_15838 ) ( not ( = ?auto_15839 ?auto_15840 ) ) ( PERSON-AT ?auto_15840 ?auto_15843 ) ( not ( = ?auto_15839 ?auto_15844 ) ) ( not ( = ?auto_15840 ?auto_15844 ) ) ( AIRCRAFT-AT ?auto_15842 ?auto_15843 ) ( PERSON-AT ?auto_15844 ?auto_15843 ) ( FUEL-LEVEL ?auto_15842 ?auto_15845 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_15840 ?auto_15838 )
      ( FLY-2PPL-VERIFY ?auto_15839 ?auto_15840 ?auto_15838 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15847 - PERSON
      ?auto_15848 - PERSON
      ?auto_15846 - CITY
    )
    :vars
    (
      ?auto_15853 - FLEVEL
      ?auto_15852 - FLEVEL
      ?auto_15849 - CITY
      ?auto_15850 - PERSON
      ?auto_15851 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15853 ?auto_15852 ) ( not ( = ?auto_15846 ?auto_15849 ) ) ( not ( = ?auto_15852 ?auto_15853 ) ) ( PERSON-AT ?auto_15850 ?auto_15846 ) ( not ( = ?auto_15850 ?auto_15848 ) ) ( PERSON-AT ?auto_15848 ?auto_15849 ) ( not ( = ?auto_15850 ?auto_15847 ) ) ( not ( = ?auto_15848 ?auto_15847 ) ) ( AIRCRAFT-AT ?auto_15851 ?auto_15849 ) ( PERSON-AT ?auto_15847 ?auto_15849 ) ( FUEL-LEVEL ?auto_15851 ?auto_15853 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15850 ?auto_15848 ?auto_15846 )
      ( FLY-2PPL-VERIFY ?auto_15847 ?auto_15848 ?auto_15846 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15855 - PERSON
      ?auto_15856 - PERSON
      ?auto_15854 - CITY
    )
    :vars
    (
      ?auto_15860 - FLEVEL
      ?auto_15859 - FLEVEL
      ?auto_15857 - CITY
      ?auto_15861 - PERSON
      ?auto_15858 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15860 ?auto_15859 ) ( not ( = ?auto_15854 ?auto_15857 ) ) ( not ( = ?auto_15859 ?auto_15860 ) ) ( PERSON-AT ?auto_15856 ?auto_15854 ) ( not ( = ?auto_15856 ?auto_15855 ) ) ( PERSON-AT ?auto_15855 ?auto_15857 ) ( not ( = ?auto_15856 ?auto_15861 ) ) ( not ( = ?auto_15855 ?auto_15861 ) ) ( AIRCRAFT-AT ?auto_15858 ?auto_15857 ) ( PERSON-AT ?auto_15861 ?auto_15857 ) ( FUEL-LEVEL ?auto_15858 ?auto_15860 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15856 ?auto_15855 ?auto_15854 )
      ( FLY-2PPL-VERIFY ?auto_15855 ?auto_15856 ?auto_15854 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_15863 - PERSON
      ?auto_15864 - PERSON
      ?auto_15862 - CITY
    )
    :vars
    (
      ?auto_15869 - FLEVEL
      ?auto_15868 - FLEVEL
      ?auto_15865 - CITY
      ?auto_15866 - PERSON
      ?auto_15867 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15869 ?auto_15868 ) ( not ( = ?auto_15862 ?auto_15865 ) ) ( not ( = ?auto_15868 ?auto_15869 ) ) ( PERSON-AT ?auto_15866 ?auto_15862 ) ( not ( = ?auto_15866 ?auto_15863 ) ) ( PERSON-AT ?auto_15863 ?auto_15865 ) ( not ( = ?auto_15866 ?auto_15864 ) ) ( not ( = ?auto_15863 ?auto_15864 ) ) ( AIRCRAFT-AT ?auto_15867 ?auto_15865 ) ( PERSON-AT ?auto_15864 ?auto_15865 ) ( FUEL-LEVEL ?auto_15867 ?auto_15869 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15866 ?auto_15863 ?auto_15862 )
      ( FLY-2PPL-VERIFY ?auto_15863 ?auto_15864 ?auto_15862 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15880 - PERSON
      ?auto_15881 - PERSON
      ?auto_15882 - PERSON
      ?auto_15879 - CITY
    )
    :vars
    (
      ?auto_15886 - FLEVEL
      ?auto_15885 - FLEVEL
      ?auto_15883 - CITY
      ?auto_15887 - PERSON
      ?auto_15884 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15886 ?auto_15885 ) ( not ( = ?auto_15879 ?auto_15883 ) ) ( not ( = ?auto_15885 ?auto_15886 ) ) ( PERSON-AT ?auto_15880 ?auto_15879 ) ( not ( = ?auto_15880 ?auto_15882 ) ) ( PERSON-AT ?auto_15882 ?auto_15883 ) ( not ( = ?auto_15880 ?auto_15887 ) ) ( not ( = ?auto_15882 ?auto_15887 ) ) ( AIRCRAFT-AT ?auto_15884 ?auto_15883 ) ( PERSON-AT ?auto_15887 ?auto_15883 ) ( FUEL-LEVEL ?auto_15884 ?auto_15886 ) ( PERSON-AT ?auto_15881 ?auto_15879 ) ( not ( = ?auto_15880 ?auto_15881 ) ) ( not ( = ?auto_15881 ?auto_15882 ) ) ( not ( = ?auto_15881 ?auto_15887 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15880 ?auto_15882 ?auto_15879 )
      ( FLY-3PPL-VERIFY ?auto_15880 ?auto_15881 ?auto_15882 ?auto_15879 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15889 - PERSON
      ?auto_15890 - PERSON
      ?auto_15891 - PERSON
      ?auto_15888 - CITY
    )
    :vars
    (
      ?auto_15895 - FLEVEL
      ?auto_15894 - FLEVEL
      ?auto_15892 - CITY
      ?auto_15893 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15895 ?auto_15894 ) ( not ( = ?auto_15888 ?auto_15892 ) ) ( not ( = ?auto_15894 ?auto_15895 ) ) ( PERSON-AT ?auto_15889 ?auto_15888 ) ( not ( = ?auto_15889 ?auto_15891 ) ) ( PERSON-AT ?auto_15891 ?auto_15892 ) ( not ( = ?auto_15889 ?auto_15890 ) ) ( not ( = ?auto_15891 ?auto_15890 ) ) ( AIRCRAFT-AT ?auto_15893 ?auto_15892 ) ( PERSON-AT ?auto_15890 ?auto_15892 ) ( FUEL-LEVEL ?auto_15893 ?auto_15895 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15889 ?auto_15891 ?auto_15888 )
      ( FLY-3PPL-VERIFY ?auto_15889 ?auto_15890 ?auto_15891 ?auto_15888 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15897 - PERSON
      ?auto_15898 - PERSON
      ?auto_15899 - PERSON
      ?auto_15896 - CITY
    )
    :vars
    (
      ?auto_15903 - FLEVEL
      ?auto_15902 - FLEVEL
      ?auto_15900 - CITY
      ?auto_15904 - PERSON
      ?auto_15901 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15903 ?auto_15902 ) ( not ( = ?auto_15896 ?auto_15900 ) ) ( not ( = ?auto_15902 ?auto_15903 ) ) ( PERSON-AT ?auto_15899 ?auto_15896 ) ( not ( = ?auto_15899 ?auto_15898 ) ) ( PERSON-AT ?auto_15898 ?auto_15900 ) ( not ( = ?auto_15899 ?auto_15904 ) ) ( not ( = ?auto_15898 ?auto_15904 ) ) ( AIRCRAFT-AT ?auto_15901 ?auto_15900 ) ( PERSON-AT ?auto_15904 ?auto_15900 ) ( FUEL-LEVEL ?auto_15901 ?auto_15903 ) ( PERSON-AT ?auto_15897 ?auto_15896 ) ( not ( = ?auto_15897 ?auto_15898 ) ) ( not ( = ?auto_15897 ?auto_15899 ) ) ( not ( = ?auto_15897 ?auto_15904 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15899 ?auto_15898 ?auto_15896 )
      ( FLY-3PPL-VERIFY ?auto_15897 ?auto_15898 ?auto_15899 ?auto_15896 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15906 - PERSON
      ?auto_15907 - PERSON
      ?auto_15908 - PERSON
      ?auto_15905 - CITY
    )
    :vars
    (
      ?auto_15912 - FLEVEL
      ?auto_15911 - FLEVEL
      ?auto_15909 - CITY
      ?auto_15910 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15912 ?auto_15911 ) ( not ( = ?auto_15905 ?auto_15909 ) ) ( not ( = ?auto_15911 ?auto_15912 ) ) ( PERSON-AT ?auto_15906 ?auto_15905 ) ( not ( = ?auto_15906 ?auto_15907 ) ) ( PERSON-AT ?auto_15907 ?auto_15909 ) ( not ( = ?auto_15906 ?auto_15908 ) ) ( not ( = ?auto_15907 ?auto_15908 ) ) ( AIRCRAFT-AT ?auto_15910 ?auto_15909 ) ( PERSON-AT ?auto_15908 ?auto_15909 ) ( FUEL-LEVEL ?auto_15910 ?auto_15912 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15906 ?auto_15907 ?auto_15905 )
      ( FLY-3PPL-VERIFY ?auto_15906 ?auto_15907 ?auto_15908 ?auto_15905 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15923 - PERSON
      ?auto_15924 - PERSON
      ?auto_15925 - PERSON
      ?auto_15922 - CITY
    )
    :vars
    (
      ?auto_15929 - FLEVEL
      ?auto_15928 - FLEVEL
      ?auto_15926 - CITY
      ?auto_15927 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15929 ?auto_15928 ) ( not ( = ?auto_15922 ?auto_15926 ) ) ( not ( = ?auto_15928 ?auto_15929 ) ) ( PERSON-AT ?auto_15924 ?auto_15922 ) ( not ( = ?auto_15924 ?auto_15925 ) ) ( PERSON-AT ?auto_15925 ?auto_15926 ) ( not ( = ?auto_15924 ?auto_15923 ) ) ( not ( = ?auto_15925 ?auto_15923 ) ) ( AIRCRAFT-AT ?auto_15927 ?auto_15926 ) ( PERSON-AT ?auto_15923 ?auto_15926 ) ( FUEL-LEVEL ?auto_15927 ?auto_15929 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15924 ?auto_15925 ?auto_15922 )
      ( FLY-3PPL-VERIFY ?auto_15923 ?auto_15924 ?auto_15925 ?auto_15922 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15940 - PERSON
      ?auto_15941 - PERSON
      ?auto_15942 - PERSON
      ?auto_15939 - CITY
    )
    :vars
    (
      ?auto_15946 - FLEVEL
      ?auto_15945 - FLEVEL
      ?auto_15943 - CITY
      ?auto_15944 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15946 ?auto_15945 ) ( not ( = ?auto_15939 ?auto_15943 ) ) ( not ( = ?auto_15945 ?auto_15946 ) ) ( PERSON-AT ?auto_15942 ?auto_15939 ) ( not ( = ?auto_15942 ?auto_15941 ) ) ( PERSON-AT ?auto_15941 ?auto_15943 ) ( not ( = ?auto_15942 ?auto_15940 ) ) ( not ( = ?auto_15941 ?auto_15940 ) ) ( AIRCRAFT-AT ?auto_15944 ?auto_15943 ) ( PERSON-AT ?auto_15940 ?auto_15943 ) ( FUEL-LEVEL ?auto_15944 ?auto_15946 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15942 ?auto_15941 ?auto_15939 )
      ( FLY-3PPL-VERIFY ?auto_15940 ?auto_15941 ?auto_15942 ?auto_15939 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15966 - PERSON
      ?auto_15967 - PERSON
      ?auto_15968 - PERSON
      ?auto_15965 - CITY
    )
    :vars
    (
      ?auto_15972 - FLEVEL
      ?auto_15971 - FLEVEL
      ?auto_15969 - CITY
      ?auto_15973 - PERSON
      ?auto_15970 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15972 ?auto_15971 ) ( not ( = ?auto_15965 ?auto_15969 ) ) ( not ( = ?auto_15971 ?auto_15972 ) ) ( PERSON-AT ?auto_15967 ?auto_15965 ) ( not ( = ?auto_15967 ?auto_15966 ) ) ( PERSON-AT ?auto_15966 ?auto_15969 ) ( not ( = ?auto_15967 ?auto_15973 ) ) ( not ( = ?auto_15966 ?auto_15973 ) ) ( AIRCRAFT-AT ?auto_15970 ?auto_15969 ) ( PERSON-AT ?auto_15973 ?auto_15969 ) ( FUEL-LEVEL ?auto_15970 ?auto_15972 ) ( PERSON-AT ?auto_15968 ?auto_15965 ) ( not ( = ?auto_15966 ?auto_15968 ) ) ( not ( = ?auto_15967 ?auto_15968 ) ) ( not ( = ?auto_15968 ?auto_15973 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15967 ?auto_15966 ?auto_15965 )
      ( FLY-3PPL-VERIFY ?auto_15966 ?auto_15967 ?auto_15968 ?auto_15965 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15975 - PERSON
      ?auto_15976 - PERSON
      ?auto_15977 - PERSON
      ?auto_15974 - CITY
    )
    :vars
    (
      ?auto_15981 - FLEVEL
      ?auto_15980 - FLEVEL
      ?auto_15978 - CITY
      ?auto_15979 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15981 ?auto_15980 ) ( not ( = ?auto_15974 ?auto_15978 ) ) ( not ( = ?auto_15980 ?auto_15981 ) ) ( PERSON-AT ?auto_15976 ?auto_15974 ) ( not ( = ?auto_15976 ?auto_15975 ) ) ( PERSON-AT ?auto_15975 ?auto_15978 ) ( not ( = ?auto_15976 ?auto_15977 ) ) ( not ( = ?auto_15975 ?auto_15977 ) ) ( AIRCRAFT-AT ?auto_15979 ?auto_15978 ) ( PERSON-AT ?auto_15977 ?auto_15978 ) ( FUEL-LEVEL ?auto_15979 ?auto_15981 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15976 ?auto_15975 ?auto_15974 )
      ( FLY-3PPL-VERIFY ?auto_15975 ?auto_15976 ?auto_15977 ?auto_15974 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_15992 - PERSON
      ?auto_15993 - PERSON
      ?auto_15994 - PERSON
      ?auto_15991 - CITY
    )
    :vars
    (
      ?auto_15998 - FLEVEL
      ?auto_15997 - FLEVEL
      ?auto_15995 - CITY
      ?auto_15996 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_15998 ?auto_15997 ) ( not ( = ?auto_15991 ?auto_15995 ) ) ( not ( = ?auto_15997 ?auto_15998 ) ) ( PERSON-AT ?auto_15994 ?auto_15991 ) ( not ( = ?auto_15994 ?auto_15992 ) ) ( PERSON-AT ?auto_15992 ?auto_15995 ) ( not ( = ?auto_15994 ?auto_15993 ) ) ( not ( = ?auto_15992 ?auto_15993 ) ) ( AIRCRAFT-AT ?auto_15996 ?auto_15995 ) ( PERSON-AT ?auto_15993 ?auto_15995 ) ( FUEL-LEVEL ?auto_15996 ?auto_15998 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_15994 ?auto_15992 ?auto_15991 )
      ( FLY-3PPL-VERIFY ?auto_15992 ?auto_15993 ?auto_15994 ?auto_15991 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_16046 - PERSON
      ?auto_16045 - CITY
    )
    :vars
    (
      ?auto_16051 - FLEVEL
      ?auto_16050 - FLEVEL
      ?auto_16047 - CITY
      ?auto_16048 - PERSON
      ?auto_16052 - PERSON
      ?auto_16049 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16051 ?auto_16050 ) ( not ( = ?auto_16045 ?auto_16047 ) ) ( not ( = ?auto_16050 ?auto_16051 ) ) ( PERSON-AT ?auto_16048 ?auto_16045 ) ( not ( = ?auto_16048 ?auto_16046 ) ) ( PERSON-AT ?auto_16046 ?auto_16047 ) ( not ( = ?auto_16048 ?auto_16052 ) ) ( not ( = ?auto_16046 ?auto_16052 ) ) ( PERSON-AT ?auto_16052 ?auto_16047 ) ( AIRCRAFT-AT ?auto_16049 ?auto_16045 ) ( FUEL-LEVEL ?auto_16049 ?auto_16050 ) )
    :subtasks
    ( ( !FLY ?auto_16049 ?auto_16045 ?auto_16047 ?auto_16050 ?auto_16051 )
      ( FLY-2PPL ?auto_16048 ?auto_16046 ?auto_16045 )
      ( FLY-1PPL-VERIFY ?auto_16046 ?auto_16045 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16054 - PERSON
      ?auto_16055 - PERSON
      ?auto_16053 - CITY
    )
    :vars
    (
      ?auto_16056 - FLEVEL
      ?auto_16057 - FLEVEL
      ?auto_16060 - CITY
      ?auto_16058 - PERSON
      ?auto_16059 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16056 ?auto_16057 ) ( not ( = ?auto_16053 ?auto_16060 ) ) ( not ( = ?auto_16057 ?auto_16056 ) ) ( PERSON-AT ?auto_16054 ?auto_16053 ) ( not ( = ?auto_16054 ?auto_16055 ) ) ( PERSON-AT ?auto_16055 ?auto_16060 ) ( not ( = ?auto_16054 ?auto_16058 ) ) ( not ( = ?auto_16055 ?auto_16058 ) ) ( PERSON-AT ?auto_16058 ?auto_16060 ) ( AIRCRAFT-AT ?auto_16059 ?auto_16053 ) ( FUEL-LEVEL ?auto_16059 ?auto_16057 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16055 ?auto_16053 )
      ( FLY-2PPL-VERIFY ?auto_16054 ?auto_16055 ?auto_16053 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16062 - PERSON
      ?auto_16063 - PERSON
      ?auto_16061 - CITY
    )
    :vars
    (
      ?auto_16064 - FLEVEL
      ?auto_16068 - FLEVEL
      ?auto_16065 - CITY
      ?auto_16066 - PERSON
      ?auto_16067 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16064 ?auto_16068 ) ( not ( = ?auto_16061 ?auto_16065 ) ) ( not ( = ?auto_16068 ?auto_16064 ) ) ( PERSON-AT ?auto_16066 ?auto_16061 ) ( not ( = ?auto_16066 ?auto_16063 ) ) ( PERSON-AT ?auto_16063 ?auto_16065 ) ( not ( = ?auto_16066 ?auto_16062 ) ) ( not ( = ?auto_16063 ?auto_16062 ) ) ( PERSON-AT ?auto_16062 ?auto_16065 ) ( AIRCRAFT-AT ?auto_16067 ?auto_16061 ) ( FUEL-LEVEL ?auto_16067 ?auto_16068 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16066 ?auto_16063 ?auto_16061 )
      ( FLY-2PPL-VERIFY ?auto_16062 ?auto_16063 ?auto_16061 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16070 - PERSON
      ?auto_16071 - PERSON
      ?auto_16069 - CITY
    )
    :vars
    (
      ?auto_16072 - FLEVEL
      ?auto_16076 - FLEVEL
      ?auto_16073 - CITY
      ?auto_16075 - PERSON
      ?auto_16074 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16072 ?auto_16076 ) ( not ( = ?auto_16069 ?auto_16073 ) ) ( not ( = ?auto_16076 ?auto_16072 ) ) ( PERSON-AT ?auto_16071 ?auto_16069 ) ( not ( = ?auto_16071 ?auto_16070 ) ) ( PERSON-AT ?auto_16070 ?auto_16073 ) ( not ( = ?auto_16071 ?auto_16075 ) ) ( not ( = ?auto_16070 ?auto_16075 ) ) ( PERSON-AT ?auto_16075 ?auto_16073 ) ( AIRCRAFT-AT ?auto_16074 ?auto_16069 ) ( FUEL-LEVEL ?auto_16074 ?auto_16076 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16071 ?auto_16070 ?auto_16069 )
      ( FLY-2PPL-VERIFY ?auto_16070 ?auto_16071 ?auto_16069 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16078 - PERSON
      ?auto_16079 - PERSON
      ?auto_16077 - CITY
    )
    :vars
    (
      ?auto_16080 - FLEVEL
      ?auto_16084 - FLEVEL
      ?auto_16081 - CITY
      ?auto_16082 - PERSON
      ?auto_16083 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16080 ?auto_16084 ) ( not ( = ?auto_16077 ?auto_16081 ) ) ( not ( = ?auto_16084 ?auto_16080 ) ) ( PERSON-AT ?auto_16082 ?auto_16077 ) ( not ( = ?auto_16082 ?auto_16078 ) ) ( PERSON-AT ?auto_16078 ?auto_16081 ) ( not ( = ?auto_16082 ?auto_16079 ) ) ( not ( = ?auto_16078 ?auto_16079 ) ) ( PERSON-AT ?auto_16079 ?auto_16081 ) ( AIRCRAFT-AT ?auto_16083 ?auto_16077 ) ( FUEL-LEVEL ?auto_16083 ?auto_16084 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16082 ?auto_16078 ?auto_16077 )
      ( FLY-2PPL-VERIFY ?auto_16078 ?auto_16079 ?auto_16077 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16095 - PERSON
      ?auto_16096 - PERSON
      ?auto_16097 - PERSON
      ?auto_16094 - CITY
    )
    :vars
    (
      ?auto_16098 - FLEVEL
      ?auto_16102 - FLEVEL
      ?auto_16099 - CITY
      ?auto_16101 - PERSON
      ?auto_16100 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16098 ?auto_16102 ) ( not ( = ?auto_16094 ?auto_16099 ) ) ( not ( = ?auto_16102 ?auto_16098 ) ) ( PERSON-AT ?auto_16095 ?auto_16094 ) ( not ( = ?auto_16095 ?auto_16097 ) ) ( PERSON-AT ?auto_16097 ?auto_16099 ) ( not ( = ?auto_16095 ?auto_16101 ) ) ( not ( = ?auto_16097 ?auto_16101 ) ) ( PERSON-AT ?auto_16101 ?auto_16099 ) ( AIRCRAFT-AT ?auto_16100 ?auto_16094 ) ( FUEL-LEVEL ?auto_16100 ?auto_16102 ) ( PERSON-AT ?auto_16096 ?auto_16094 ) ( not ( = ?auto_16095 ?auto_16096 ) ) ( not ( = ?auto_16096 ?auto_16097 ) ) ( not ( = ?auto_16096 ?auto_16101 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16095 ?auto_16097 ?auto_16094 )
      ( FLY-3PPL-VERIFY ?auto_16095 ?auto_16096 ?auto_16097 ?auto_16094 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16104 - PERSON
      ?auto_16105 - PERSON
      ?auto_16106 - PERSON
      ?auto_16103 - CITY
    )
    :vars
    (
      ?auto_16107 - FLEVEL
      ?auto_16110 - FLEVEL
      ?auto_16108 - CITY
      ?auto_16109 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16107 ?auto_16110 ) ( not ( = ?auto_16103 ?auto_16108 ) ) ( not ( = ?auto_16110 ?auto_16107 ) ) ( PERSON-AT ?auto_16104 ?auto_16103 ) ( not ( = ?auto_16104 ?auto_16106 ) ) ( PERSON-AT ?auto_16106 ?auto_16108 ) ( not ( = ?auto_16104 ?auto_16105 ) ) ( not ( = ?auto_16106 ?auto_16105 ) ) ( PERSON-AT ?auto_16105 ?auto_16108 ) ( AIRCRAFT-AT ?auto_16109 ?auto_16103 ) ( FUEL-LEVEL ?auto_16109 ?auto_16110 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16104 ?auto_16106 ?auto_16103 )
      ( FLY-3PPL-VERIFY ?auto_16104 ?auto_16105 ?auto_16106 ?auto_16103 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16112 - PERSON
      ?auto_16113 - PERSON
      ?auto_16114 - PERSON
      ?auto_16111 - CITY
    )
    :vars
    (
      ?auto_16115 - FLEVEL
      ?auto_16119 - FLEVEL
      ?auto_16116 - CITY
      ?auto_16118 - PERSON
      ?auto_16117 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16115 ?auto_16119 ) ( not ( = ?auto_16111 ?auto_16116 ) ) ( not ( = ?auto_16119 ?auto_16115 ) ) ( PERSON-AT ?auto_16114 ?auto_16111 ) ( not ( = ?auto_16114 ?auto_16113 ) ) ( PERSON-AT ?auto_16113 ?auto_16116 ) ( not ( = ?auto_16114 ?auto_16118 ) ) ( not ( = ?auto_16113 ?auto_16118 ) ) ( PERSON-AT ?auto_16118 ?auto_16116 ) ( AIRCRAFT-AT ?auto_16117 ?auto_16111 ) ( FUEL-LEVEL ?auto_16117 ?auto_16119 ) ( PERSON-AT ?auto_16112 ?auto_16111 ) ( not ( = ?auto_16112 ?auto_16113 ) ) ( not ( = ?auto_16112 ?auto_16114 ) ) ( not ( = ?auto_16112 ?auto_16118 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16114 ?auto_16113 ?auto_16111 )
      ( FLY-3PPL-VERIFY ?auto_16112 ?auto_16113 ?auto_16114 ?auto_16111 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16121 - PERSON
      ?auto_16122 - PERSON
      ?auto_16123 - PERSON
      ?auto_16120 - CITY
    )
    :vars
    (
      ?auto_16124 - FLEVEL
      ?auto_16127 - FLEVEL
      ?auto_16125 - CITY
      ?auto_16126 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16124 ?auto_16127 ) ( not ( = ?auto_16120 ?auto_16125 ) ) ( not ( = ?auto_16127 ?auto_16124 ) ) ( PERSON-AT ?auto_16121 ?auto_16120 ) ( not ( = ?auto_16121 ?auto_16122 ) ) ( PERSON-AT ?auto_16122 ?auto_16125 ) ( not ( = ?auto_16121 ?auto_16123 ) ) ( not ( = ?auto_16122 ?auto_16123 ) ) ( PERSON-AT ?auto_16123 ?auto_16125 ) ( AIRCRAFT-AT ?auto_16126 ?auto_16120 ) ( FUEL-LEVEL ?auto_16126 ?auto_16127 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16121 ?auto_16122 ?auto_16120 )
      ( FLY-3PPL-VERIFY ?auto_16121 ?auto_16122 ?auto_16123 ?auto_16120 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16138 - PERSON
      ?auto_16139 - PERSON
      ?auto_16140 - PERSON
      ?auto_16137 - CITY
    )
    :vars
    (
      ?auto_16141 - FLEVEL
      ?auto_16144 - FLEVEL
      ?auto_16142 - CITY
      ?auto_16143 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16141 ?auto_16144 ) ( not ( = ?auto_16137 ?auto_16142 ) ) ( not ( = ?auto_16144 ?auto_16141 ) ) ( PERSON-AT ?auto_16139 ?auto_16137 ) ( not ( = ?auto_16139 ?auto_16140 ) ) ( PERSON-AT ?auto_16140 ?auto_16142 ) ( not ( = ?auto_16139 ?auto_16138 ) ) ( not ( = ?auto_16140 ?auto_16138 ) ) ( PERSON-AT ?auto_16138 ?auto_16142 ) ( AIRCRAFT-AT ?auto_16143 ?auto_16137 ) ( FUEL-LEVEL ?auto_16143 ?auto_16144 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16139 ?auto_16140 ?auto_16137 )
      ( FLY-3PPL-VERIFY ?auto_16138 ?auto_16139 ?auto_16140 ?auto_16137 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16155 - PERSON
      ?auto_16156 - PERSON
      ?auto_16157 - PERSON
      ?auto_16154 - CITY
    )
    :vars
    (
      ?auto_16158 - FLEVEL
      ?auto_16161 - FLEVEL
      ?auto_16159 - CITY
      ?auto_16160 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16158 ?auto_16161 ) ( not ( = ?auto_16154 ?auto_16159 ) ) ( not ( = ?auto_16161 ?auto_16158 ) ) ( PERSON-AT ?auto_16157 ?auto_16154 ) ( not ( = ?auto_16157 ?auto_16156 ) ) ( PERSON-AT ?auto_16156 ?auto_16159 ) ( not ( = ?auto_16157 ?auto_16155 ) ) ( not ( = ?auto_16156 ?auto_16155 ) ) ( PERSON-AT ?auto_16155 ?auto_16159 ) ( AIRCRAFT-AT ?auto_16160 ?auto_16154 ) ( FUEL-LEVEL ?auto_16160 ?auto_16161 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16157 ?auto_16156 ?auto_16154 )
      ( FLY-3PPL-VERIFY ?auto_16155 ?auto_16156 ?auto_16157 ?auto_16154 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16181 - PERSON
      ?auto_16182 - PERSON
      ?auto_16183 - PERSON
      ?auto_16180 - CITY
    )
    :vars
    (
      ?auto_16184 - FLEVEL
      ?auto_16188 - FLEVEL
      ?auto_16185 - CITY
      ?auto_16187 - PERSON
      ?auto_16186 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16184 ?auto_16188 ) ( not ( = ?auto_16180 ?auto_16185 ) ) ( not ( = ?auto_16188 ?auto_16184 ) ) ( PERSON-AT ?auto_16182 ?auto_16180 ) ( not ( = ?auto_16182 ?auto_16181 ) ) ( PERSON-AT ?auto_16181 ?auto_16185 ) ( not ( = ?auto_16182 ?auto_16187 ) ) ( not ( = ?auto_16181 ?auto_16187 ) ) ( PERSON-AT ?auto_16187 ?auto_16185 ) ( AIRCRAFT-AT ?auto_16186 ?auto_16180 ) ( FUEL-LEVEL ?auto_16186 ?auto_16188 ) ( PERSON-AT ?auto_16183 ?auto_16180 ) ( not ( = ?auto_16181 ?auto_16183 ) ) ( not ( = ?auto_16182 ?auto_16183 ) ) ( not ( = ?auto_16183 ?auto_16187 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16182 ?auto_16181 ?auto_16180 )
      ( FLY-3PPL-VERIFY ?auto_16181 ?auto_16182 ?auto_16183 ?auto_16180 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16190 - PERSON
      ?auto_16191 - PERSON
      ?auto_16192 - PERSON
      ?auto_16189 - CITY
    )
    :vars
    (
      ?auto_16193 - FLEVEL
      ?auto_16196 - FLEVEL
      ?auto_16194 - CITY
      ?auto_16195 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16193 ?auto_16196 ) ( not ( = ?auto_16189 ?auto_16194 ) ) ( not ( = ?auto_16196 ?auto_16193 ) ) ( PERSON-AT ?auto_16191 ?auto_16189 ) ( not ( = ?auto_16191 ?auto_16190 ) ) ( PERSON-AT ?auto_16190 ?auto_16194 ) ( not ( = ?auto_16191 ?auto_16192 ) ) ( not ( = ?auto_16190 ?auto_16192 ) ) ( PERSON-AT ?auto_16192 ?auto_16194 ) ( AIRCRAFT-AT ?auto_16195 ?auto_16189 ) ( FUEL-LEVEL ?auto_16195 ?auto_16196 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16191 ?auto_16190 ?auto_16189 )
      ( FLY-3PPL-VERIFY ?auto_16190 ?auto_16191 ?auto_16192 ?auto_16189 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16207 - PERSON
      ?auto_16208 - PERSON
      ?auto_16209 - PERSON
      ?auto_16206 - CITY
    )
    :vars
    (
      ?auto_16210 - FLEVEL
      ?auto_16213 - FLEVEL
      ?auto_16211 - CITY
      ?auto_16212 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16210 ?auto_16213 ) ( not ( = ?auto_16206 ?auto_16211 ) ) ( not ( = ?auto_16213 ?auto_16210 ) ) ( PERSON-AT ?auto_16209 ?auto_16206 ) ( not ( = ?auto_16209 ?auto_16207 ) ) ( PERSON-AT ?auto_16207 ?auto_16211 ) ( not ( = ?auto_16209 ?auto_16208 ) ) ( not ( = ?auto_16207 ?auto_16208 ) ) ( PERSON-AT ?auto_16208 ?auto_16211 ) ( AIRCRAFT-AT ?auto_16212 ?auto_16206 ) ( FUEL-LEVEL ?auto_16212 ?auto_16213 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16209 ?auto_16207 ?auto_16206 )
      ( FLY-3PPL-VERIFY ?auto_16207 ?auto_16208 ?auto_16209 ?auto_16206 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_16261 - PERSON
      ?auto_16260 - CITY
    )
    :vars
    (
      ?auto_16262 - FLEVEL
      ?auto_16267 - FLEVEL
      ?auto_16263 - CITY
      ?auto_16264 - PERSON
      ?auto_16266 - PERSON
      ?auto_16265 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16262 ?auto_16267 ) ( not ( = ?auto_16260 ?auto_16263 ) ) ( not ( = ?auto_16267 ?auto_16262 ) ) ( PERSON-AT ?auto_16264 ?auto_16260 ) ( not ( = ?auto_16264 ?auto_16261 ) ) ( PERSON-AT ?auto_16261 ?auto_16263 ) ( not ( = ?auto_16264 ?auto_16266 ) ) ( not ( = ?auto_16261 ?auto_16266 ) ) ( PERSON-AT ?auto_16266 ?auto_16263 ) ( AIRCRAFT-AT ?auto_16265 ?auto_16260 ) ( FUEL-LEVEL ?auto_16265 ?auto_16262 ) )
    :subtasks
    ( ( !REFUEL ?auto_16265 ?auto_16260 ?auto_16262 ?auto_16267 )
      ( FLY-2PPL ?auto_16264 ?auto_16261 ?auto_16260 )
      ( FLY-1PPL-VERIFY ?auto_16261 ?auto_16260 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16269 - PERSON
      ?auto_16270 - PERSON
      ?auto_16268 - CITY
    )
    :vars
    (
      ?auto_16275 - FLEVEL
      ?auto_16272 - FLEVEL
      ?auto_16271 - CITY
      ?auto_16273 - PERSON
      ?auto_16274 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16275 ?auto_16272 ) ( not ( = ?auto_16268 ?auto_16271 ) ) ( not ( = ?auto_16272 ?auto_16275 ) ) ( PERSON-AT ?auto_16269 ?auto_16268 ) ( not ( = ?auto_16269 ?auto_16270 ) ) ( PERSON-AT ?auto_16270 ?auto_16271 ) ( not ( = ?auto_16269 ?auto_16273 ) ) ( not ( = ?auto_16270 ?auto_16273 ) ) ( PERSON-AT ?auto_16273 ?auto_16271 ) ( AIRCRAFT-AT ?auto_16274 ?auto_16268 ) ( FUEL-LEVEL ?auto_16274 ?auto_16275 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16270 ?auto_16268 )
      ( FLY-2PPL-VERIFY ?auto_16269 ?auto_16270 ?auto_16268 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16277 - PERSON
      ?auto_16278 - PERSON
      ?auto_16276 - CITY
    )
    :vars
    (
      ?auto_16282 - FLEVEL
      ?auto_16279 - FLEVEL
      ?auto_16280 - CITY
      ?auto_16283 - PERSON
      ?auto_16281 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16282 ?auto_16279 ) ( not ( = ?auto_16276 ?auto_16280 ) ) ( not ( = ?auto_16279 ?auto_16282 ) ) ( PERSON-AT ?auto_16283 ?auto_16276 ) ( not ( = ?auto_16283 ?auto_16278 ) ) ( PERSON-AT ?auto_16278 ?auto_16280 ) ( not ( = ?auto_16283 ?auto_16277 ) ) ( not ( = ?auto_16278 ?auto_16277 ) ) ( PERSON-AT ?auto_16277 ?auto_16280 ) ( AIRCRAFT-AT ?auto_16281 ?auto_16276 ) ( FUEL-LEVEL ?auto_16281 ?auto_16282 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16283 ?auto_16278 ?auto_16276 )
      ( FLY-2PPL-VERIFY ?auto_16277 ?auto_16278 ?auto_16276 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16285 - PERSON
      ?auto_16286 - PERSON
      ?auto_16284 - CITY
    )
    :vars
    (
      ?auto_16291 - FLEVEL
      ?auto_16287 - FLEVEL
      ?auto_16288 - CITY
      ?auto_16290 - PERSON
      ?auto_16289 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16291 ?auto_16287 ) ( not ( = ?auto_16284 ?auto_16288 ) ) ( not ( = ?auto_16287 ?auto_16291 ) ) ( PERSON-AT ?auto_16286 ?auto_16284 ) ( not ( = ?auto_16286 ?auto_16285 ) ) ( PERSON-AT ?auto_16285 ?auto_16288 ) ( not ( = ?auto_16286 ?auto_16290 ) ) ( not ( = ?auto_16285 ?auto_16290 ) ) ( PERSON-AT ?auto_16290 ?auto_16288 ) ( AIRCRAFT-AT ?auto_16289 ?auto_16284 ) ( FUEL-LEVEL ?auto_16289 ?auto_16291 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16286 ?auto_16285 ?auto_16284 )
      ( FLY-2PPL-VERIFY ?auto_16285 ?auto_16286 ?auto_16284 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16293 - PERSON
      ?auto_16294 - PERSON
      ?auto_16292 - CITY
    )
    :vars
    (
      ?auto_16298 - FLEVEL
      ?auto_16295 - FLEVEL
      ?auto_16296 - CITY
      ?auto_16299 - PERSON
      ?auto_16297 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16298 ?auto_16295 ) ( not ( = ?auto_16292 ?auto_16296 ) ) ( not ( = ?auto_16295 ?auto_16298 ) ) ( PERSON-AT ?auto_16299 ?auto_16292 ) ( not ( = ?auto_16299 ?auto_16293 ) ) ( PERSON-AT ?auto_16293 ?auto_16296 ) ( not ( = ?auto_16299 ?auto_16294 ) ) ( not ( = ?auto_16293 ?auto_16294 ) ) ( PERSON-AT ?auto_16294 ?auto_16296 ) ( AIRCRAFT-AT ?auto_16297 ?auto_16292 ) ( FUEL-LEVEL ?auto_16297 ?auto_16298 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16299 ?auto_16293 ?auto_16292 )
      ( FLY-2PPL-VERIFY ?auto_16293 ?auto_16294 ?auto_16292 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16310 - PERSON
      ?auto_16311 - PERSON
      ?auto_16312 - PERSON
      ?auto_16309 - CITY
    )
    :vars
    (
      ?auto_16317 - FLEVEL
      ?auto_16313 - FLEVEL
      ?auto_16314 - CITY
      ?auto_16316 - PERSON
      ?auto_16315 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16317 ?auto_16313 ) ( not ( = ?auto_16309 ?auto_16314 ) ) ( not ( = ?auto_16313 ?auto_16317 ) ) ( PERSON-AT ?auto_16310 ?auto_16309 ) ( not ( = ?auto_16310 ?auto_16312 ) ) ( PERSON-AT ?auto_16312 ?auto_16314 ) ( not ( = ?auto_16310 ?auto_16316 ) ) ( not ( = ?auto_16312 ?auto_16316 ) ) ( PERSON-AT ?auto_16316 ?auto_16314 ) ( AIRCRAFT-AT ?auto_16315 ?auto_16309 ) ( FUEL-LEVEL ?auto_16315 ?auto_16317 ) ( PERSON-AT ?auto_16311 ?auto_16309 ) ( not ( = ?auto_16310 ?auto_16311 ) ) ( not ( = ?auto_16311 ?auto_16312 ) ) ( not ( = ?auto_16311 ?auto_16316 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16310 ?auto_16312 ?auto_16309 )
      ( FLY-3PPL-VERIFY ?auto_16310 ?auto_16311 ?auto_16312 ?auto_16309 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16319 - PERSON
      ?auto_16320 - PERSON
      ?auto_16321 - PERSON
      ?auto_16318 - CITY
    )
    :vars
    (
      ?auto_16325 - FLEVEL
      ?auto_16322 - FLEVEL
      ?auto_16323 - CITY
      ?auto_16324 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16325 ?auto_16322 ) ( not ( = ?auto_16318 ?auto_16323 ) ) ( not ( = ?auto_16322 ?auto_16325 ) ) ( PERSON-AT ?auto_16319 ?auto_16318 ) ( not ( = ?auto_16319 ?auto_16321 ) ) ( PERSON-AT ?auto_16321 ?auto_16323 ) ( not ( = ?auto_16319 ?auto_16320 ) ) ( not ( = ?auto_16321 ?auto_16320 ) ) ( PERSON-AT ?auto_16320 ?auto_16323 ) ( AIRCRAFT-AT ?auto_16324 ?auto_16318 ) ( FUEL-LEVEL ?auto_16324 ?auto_16325 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16319 ?auto_16321 ?auto_16318 )
      ( FLY-3PPL-VERIFY ?auto_16319 ?auto_16320 ?auto_16321 ?auto_16318 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16327 - PERSON
      ?auto_16328 - PERSON
      ?auto_16329 - PERSON
      ?auto_16326 - CITY
    )
    :vars
    (
      ?auto_16334 - FLEVEL
      ?auto_16330 - FLEVEL
      ?auto_16331 - CITY
      ?auto_16333 - PERSON
      ?auto_16332 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16334 ?auto_16330 ) ( not ( = ?auto_16326 ?auto_16331 ) ) ( not ( = ?auto_16330 ?auto_16334 ) ) ( PERSON-AT ?auto_16329 ?auto_16326 ) ( not ( = ?auto_16329 ?auto_16328 ) ) ( PERSON-AT ?auto_16328 ?auto_16331 ) ( not ( = ?auto_16329 ?auto_16333 ) ) ( not ( = ?auto_16328 ?auto_16333 ) ) ( PERSON-AT ?auto_16333 ?auto_16331 ) ( AIRCRAFT-AT ?auto_16332 ?auto_16326 ) ( FUEL-LEVEL ?auto_16332 ?auto_16334 ) ( PERSON-AT ?auto_16327 ?auto_16326 ) ( not ( = ?auto_16327 ?auto_16328 ) ) ( not ( = ?auto_16327 ?auto_16329 ) ) ( not ( = ?auto_16327 ?auto_16333 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16329 ?auto_16328 ?auto_16326 )
      ( FLY-3PPL-VERIFY ?auto_16327 ?auto_16328 ?auto_16329 ?auto_16326 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16336 - PERSON
      ?auto_16337 - PERSON
      ?auto_16338 - PERSON
      ?auto_16335 - CITY
    )
    :vars
    (
      ?auto_16342 - FLEVEL
      ?auto_16339 - FLEVEL
      ?auto_16340 - CITY
      ?auto_16341 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16342 ?auto_16339 ) ( not ( = ?auto_16335 ?auto_16340 ) ) ( not ( = ?auto_16339 ?auto_16342 ) ) ( PERSON-AT ?auto_16336 ?auto_16335 ) ( not ( = ?auto_16336 ?auto_16337 ) ) ( PERSON-AT ?auto_16337 ?auto_16340 ) ( not ( = ?auto_16336 ?auto_16338 ) ) ( not ( = ?auto_16337 ?auto_16338 ) ) ( PERSON-AT ?auto_16338 ?auto_16340 ) ( AIRCRAFT-AT ?auto_16341 ?auto_16335 ) ( FUEL-LEVEL ?auto_16341 ?auto_16342 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16336 ?auto_16337 ?auto_16335 )
      ( FLY-3PPL-VERIFY ?auto_16336 ?auto_16337 ?auto_16338 ?auto_16335 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16353 - PERSON
      ?auto_16354 - PERSON
      ?auto_16355 - PERSON
      ?auto_16352 - CITY
    )
    :vars
    (
      ?auto_16359 - FLEVEL
      ?auto_16356 - FLEVEL
      ?auto_16357 - CITY
      ?auto_16358 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16359 ?auto_16356 ) ( not ( = ?auto_16352 ?auto_16357 ) ) ( not ( = ?auto_16356 ?auto_16359 ) ) ( PERSON-AT ?auto_16354 ?auto_16352 ) ( not ( = ?auto_16354 ?auto_16355 ) ) ( PERSON-AT ?auto_16355 ?auto_16357 ) ( not ( = ?auto_16354 ?auto_16353 ) ) ( not ( = ?auto_16355 ?auto_16353 ) ) ( PERSON-AT ?auto_16353 ?auto_16357 ) ( AIRCRAFT-AT ?auto_16358 ?auto_16352 ) ( FUEL-LEVEL ?auto_16358 ?auto_16359 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16354 ?auto_16355 ?auto_16352 )
      ( FLY-3PPL-VERIFY ?auto_16353 ?auto_16354 ?auto_16355 ?auto_16352 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16370 - PERSON
      ?auto_16371 - PERSON
      ?auto_16372 - PERSON
      ?auto_16369 - CITY
    )
    :vars
    (
      ?auto_16376 - FLEVEL
      ?auto_16373 - FLEVEL
      ?auto_16374 - CITY
      ?auto_16375 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16376 ?auto_16373 ) ( not ( = ?auto_16369 ?auto_16374 ) ) ( not ( = ?auto_16373 ?auto_16376 ) ) ( PERSON-AT ?auto_16372 ?auto_16369 ) ( not ( = ?auto_16372 ?auto_16371 ) ) ( PERSON-AT ?auto_16371 ?auto_16374 ) ( not ( = ?auto_16372 ?auto_16370 ) ) ( not ( = ?auto_16371 ?auto_16370 ) ) ( PERSON-AT ?auto_16370 ?auto_16374 ) ( AIRCRAFT-AT ?auto_16375 ?auto_16369 ) ( FUEL-LEVEL ?auto_16375 ?auto_16376 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16372 ?auto_16371 ?auto_16369 )
      ( FLY-3PPL-VERIFY ?auto_16370 ?auto_16371 ?auto_16372 ?auto_16369 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16396 - PERSON
      ?auto_16397 - PERSON
      ?auto_16398 - PERSON
      ?auto_16395 - CITY
    )
    :vars
    (
      ?auto_16403 - FLEVEL
      ?auto_16399 - FLEVEL
      ?auto_16400 - CITY
      ?auto_16402 - PERSON
      ?auto_16401 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16403 ?auto_16399 ) ( not ( = ?auto_16395 ?auto_16400 ) ) ( not ( = ?auto_16399 ?auto_16403 ) ) ( PERSON-AT ?auto_16397 ?auto_16395 ) ( not ( = ?auto_16397 ?auto_16396 ) ) ( PERSON-AT ?auto_16396 ?auto_16400 ) ( not ( = ?auto_16397 ?auto_16402 ) ) ( not ( = ?auto_16396 ?auto_16402 ) ) ( PERSON-AT ?auto_16402 ?auto_16400 ) ( AIRCRAFT-AT ?auto_16401 ?auto_16395 ) ( FUEL-LEVEL ?auto_16401 ?auto_16403 ) ( PERSON-AT ?auto_16398 ?auto_16395 ) ( not ( = ?auto_16396 ?auto_16398 ) ) ( not ( = ?auto_16397 ?auto_16398 ) ) ( not ( = ?auto_16398 ?auto_16402 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16397 ?auto_16396 ?auto_16395 )
      ( FLY-3PPL-VERIFY ?auto_16396 ?auto_16397 ?auto_16398 ?auto_16395 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16405 - PERSON
      ?auto_16406 - PERSON
      ?auto_16407 - PERSON
      ?auto_16404 - CITY
    )
    :vars
    (
      ?auto_16411 - FLEVEL
      ?auto_16408 - FLEVEL
      ?auto_16409 - CITY
      ?auto_16410 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16411 ?auto_16408 ) ( not ( = ?auto_16404 ?auto_16409 ) ) ( not ( = ?auto_16408 ?auto_16411 ) ) ( PERSON-AT ?auto_16406 ?auto_16404 ) ( not ( = ?auto_16406 ?auto_16405 ) ) ( PERSON-AT ?auto_16405 ?auto_16409 ) ( not ( = ?auto_16406 ?auto_16407 ) ) ( not ( = ?auto_16405 ?auto_16407 ) ) ( PERSON-AT ?auto_16407 ?auto_16409 ) ( AIRCRAFT-AT ?auto_16410 ?auto_16404 ) ( FUEL-LEVEL ?auto_16410 ?auto_16411 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16406 ?auto_16405 ?auto_16404 )
      ( FLY-3PPL-VERIFY ?auto_16405 ?auto_16406 ?auto_16407 ?auto_16404 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16422 - PERSON
      ?auto_16423 - PERSON
      ?auto_16424 - PERSON
      ?auto_16421 - CITY
    )
    :vars
    (
      ?auto_16428 - FLEVEL
      ?auto_16425 - FLEVEL
      ?auto_16426 - CITY
      ?auto_16427 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16428 ?auto_16425 ) ( not ( = ?auto_16421 ?auto_16426 ) ) ( not ( = ?auto_16425 ?auto_16428 ) ) ( PERSON-AT ?auto_16424 ?auto_16421 ) ( not ( = ?auto_16424 ?auto_16422 ) ) ( PERSON-AT ?auto_16422 ?auto_16426 ) ( not ( = ?auto_16424 ?auto_16423 ) ) ( not ( = ?auto_16422 ?auto_16423 ) ) ( PERSON-AT ?auto_16423 ?auto_16426 ) ( AIRCRAFT-AT ?auto_16427 ?auto_16421 ) ( FUEL-LEVEL ?auto_16427 ?auto_16428 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16424 ?auto_16422 ?auto_16421 )
      ( FLY-3PPL-VERIFY ?auto_16422 ?auto_16423 ?auto_16424 ?auto_16421 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_16476 - PERSON
      ?auto_16475 - CITY
    )
    :vars
    (
      ?auto_16481 - FLEVEL
      ?auto_16477 - FLEVEL
      ?auto_16478 - CITY
      ?auto_16482 - PERSON
      ?auto_16480 - PERSON
      ?auto_16479 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16481 ?auto_16477 ) ( not ( = ?auto_16475 ?auto_16478 ) ) ( not ( = ?auto_16477 ?auto_16481 ) ) ( not ( = ?auto_16482 ?auto_16476 ) ) ( PERSON-AT ?auto_16476 ?auto_16478 ) ( not ( = ?auto_16482 ?auto_16480 ) ) ( not ( = ?auto_16476 ?auto_16480 ) ) ( PERSON-AT ?auto_16480 ?auto_16478 ) ( AIRCRAFT-AT ?auto_16479 ?auto_16475 ) ( FUEL-LEVEL ?auto_16479 ?auto_16481 ) ( IN ?auto_16482 ?auto_16479 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16482 ?auto_16475 )
      ( FLY-2PPL ?auto_16482 ?auto_16476 ?auto_16475 )
      ( FLY-1PPL-VERIFY ?auto_16476 ?auto_16475 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16484 - PERSON
      ?auto_16485 - PERSON
      ?auto_16483 - CITY
    )
    :vars
    (
      ?auto_16490 - FLEVEL
      ?auto_16487 - FLEVEL
      ?auto_16489 - CITY
      ?auto_16486 - PERSON
      ?auto_16488 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16490 ?auto_16487 ) ( not ( = ?auto_16483 ?auto_16489 ) ) ( not ( = ?auto_16487 ?auto_16490 ) ) ( not ( = ?auto_16484 ?auto_16485 ) ) ( PERSON-AT ?auto_16485 ?auto_16489 ) ( not ( = ?auto_16484 ?auto_16486 ) ) ( not ( = ?auto_16485 ?auto_16486 ) ) ( PERSON-AT ?auto_16486 ?auto_16489 ) ( AIRCRAFT-AT ?auto_16488 ?auto_16483 ) ( FUEL-LEVEL ?auto_16488 ?auto_16490 ) ( IN ?auto_16484 ?auto_16488 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16485 ?auto_16483 )
      ( FLY-2PPL-VERIFY ?auto_16484 ?auto_16485 ?auto_16483 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16492 - PERSON
      ?auto_16493 - PERSON
      ?auto_16491 - CITY
    )
    :vars
    (
      ?auto_16494 - FLEVEL
      ?auto_16497 - FLEVEL
      ?auto_16496 - CITY
      ?auto_16498 - PERSON
      ?auto_16495 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16494 ?auto_16497 ) ( not ( = ?auto_16491 ?auto_16496 ) ) ( not ( = ?auto_16497 ?auto_16494 ) ) ( not ( = ?auto_16498 ?auto_16493 ) ) ( PERSON-AT ?auto_16493 ?auto_16496 ) ( not ( = ?auto_16498 ?auto_16492 ) ) ( not ( = ?auto_16493 ?auto_16492 ) ) ( PERSON-AT ?auto_16492 ?auto_16496 ) ( AIRCRAFT-AT ?auto_16495 ?auto_16491 ) ( FUEL-LEVEL ?auto_16495 ?auto_16494 ) ( IN ?auto_16498 ?auto_16495 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16498 ?auto_16493 ?auto_16491 )
      ( FLY-2PPL-VERIFY ?auto_16492 ?auto_16493 ?auto_16491 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16500 - PERSON
      ?auto_16501 - PERSON
      ?auto_16499 - CITY
    )
    :vars
    (
      ?auto_16502 - FLEVEL
      ?auto_16506 - FLEVEL
      ?auto_16504 - CITY
      ?auto_16505 - PERSON
      ?auto_16503 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16502 ?auto_16506 ) ( not ( = ?auto_16499 ?auto_16504 ) ) ( not ( = ?auto_16506 ?auto_16502 ) ) ( not ( = ?auto_16501 ?auto_16500 ) ) ( PERSON-AT ?auto_16500 ?auto_16504 ) ( not ( = ?auto_16501 ?auto_16505 ) ) ( not ( = ?auto_16500 ?auto_16505 ) ) ( PERSON-AT ?auto_16505 ?auto_16504 ) ( AIRCRAFT-AT ?auto_16503 ?auto_16499 ) ( FUEL-LEVEL ?auto_16503 ?auto_16502 ) ( IN ?auto_16501 ?auto_16503 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16501 ?auto_16500 ?auto_16499 )
      ( FLY-2PPL-VERIFY ?auto_16500 ?auto_16501 ?auto_16499 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16508 - PERSON
      ?auto_16509 - PERSON
      ?auto_16507 - CITY
    )
    :vars
    (
      ?auto_16510 - FLEVEL
      ?auto_16513 - FLEVEL
      ?auto_16512 - CITY
      ?auto_16514 - PERSON
      ?auto_16511 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16510 ?auto_16513 ) ( not ( = ?auto_16507 ?auto_16512 ) ) ( not ( = ?auto_16513 ?auto_16510 ) ) ( not ( = ?auto_16514 ?auto_16508 ) ) ( PERSON-AT ?auto_16508 ?auto_16512 ) ( not ( = ?auto_16514 ?auto_16509 ) ) ( not ( = ?auto_16508 ?auto_16509 ) ) ( PERSON-AT ?auto_16509 ?auto_16512 ) ( AIRCRAFT-AT ?auto_16511 ?auto_16507 ) ( FUEL-LEVEL ?auto_16511 ?auto_16510 ) ( IN ?auto_16514 ?auto_16511 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16514 ?auto_16508 ?auto_16507 )
      ( FLY-2PPL-VERIFY ?auto_16508 ?auto_16509 ?auto_16507 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16534 - PERSON
      ?auto_16535 - PERSON
      ?auto_16536 - PERSON
      ?auto_16533 - CITY
    )
    :vars
    (
      ?auto_16537 - FLEVEL
      ?auto_16540 - FLEVEL
      ?auto_16539 - CITY
      ?auto_16538 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16537 ?auto_16540 ) ( not ( = ?auto_16533 ?auto_16539 ) ) ( not ( = ?auto_16540 ?auto_16537 ) ) ( not ( = ?auto_16534 ?auto_16536 ) ) ( PERSON-AT ?auto_16536 ?auto_16539 ) ( not ( = ?auto_16534 ?auto_16535 ) ) ( not ( = ?auto_16536 ?auto_16535 ) ) ( PERSON-AT ?auto_16535 ?auto_16539 ) ( AIRCRAFT-AT ?auto_16538 ?auto_16533 ) ( FUEL-LEVEL ?auto_16538 ?auto_16537 ) ( IN ?auto_16534 ?auto_16538 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16534 ?auto_16536 ?auto_16533 )
      ( FLY-3PPL-VERIFY ?auto_16534 ?auto_16535 ?auto_16536 ?auto_16533 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16551 - PERSON
      ?auto_16552 - PERSON
      ?auto_16553 - PERSON
      ?auto_16550 - CITY
    )
    :vars
    (
      ?auto_16554 - FLEVEL
      ?auto_16557 - FLEVEL
      ?auto_16556 - CITY
      ?auto_16555 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16554 ?auto_16557 ) ( not ( = ?auto_16550 ?auto_16556 ) ) ( not ( = ?auto_16557 ?auto_16554 ) ) ( not ( = ?auto_16551 ?auto_16552 ) ) ( PERSON-AT ?auto_16552 ?auto_16556 ) ( not ( = ?auto_16551 ?auto_16553 ) ) ( not ( = ?auto_16552 ?auto_16553 ) ) ( PERSON-AT ?auto_16553 ?auto_16556 ) ( AIRCRAFT-AT ?auto_16555 ?auto_16550 ) ( FUEL-LEVEL ?auto_16555 ?auto_16554 ) ( IN ?auto_16551 ?auto_16555 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16551 ?auto_16552 ?auto_16550 )
      ( FLY-3PPL-VERIFY ?auto_16551 ?auto_16552 ?auto_16553 ?auto_16550 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16568 - PERSON
      ?auto_16569 - PERSON
      ?auto_16570 - PERSON
      ?auto_16567 - CITY
    )
    :vars
    (
      ?auto_16571 - FLEVEL
      ?auto_16574 - FLEVEL
      ?auto_16573 - CITY
      ?auto_16572 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16571 ?auto_16574 ) ( not ( = ?auto_16567 ?auto_16573 ) ) ( not ( = ?auto_16574 ?auto_16571 ) ) ( not ( = ?auto_16569 ?auto_16570 ) ) ( PERSON-AT ?auto_16570 ?auto_16573 ) ( not ( = ?auto_16569 ?auto_16568 ) ) ( not ( = ?auto_16570 ?auto_16568 ) ) ( PERSON-AT ?auto_16568 ?auto_16573 ) ( AIRCRAFT-AT ?auto_16572 ?auto_16567 ) ( FUEL-LEVEL ?auto_16572 ?auto_16571 ) ( IN ?auto_16569 ?auto_16572 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16569 ?auto_16570 ?auto_16567 )
      ( FLY-3PPL-VERIFY ?auto_16568 ?auto_16569 ?auto_16570 ?auto_16567 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16585 - PERSON
      ?auto_16586 - PERSON
      ?auto_16587 - PERSON
      ?auto_16584 - CITY
    )
    :vars
    (
      ?auto_16588 - FLEVEL
      ?auto_16591 - FLEVEL
      ?auto_16590 - CITY
      ?auto_16589 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16588 ?auto_16591 ) ( not ( = ?auto_16584 ?auto_16590 ) ) ( not ( = ?auto_16591 ?auto_16588 ) ) ( not ( = ?auto_16587 ?auto_16586 ) ) ( PERSON-AT ?auto_16586 ?auto_16590 ) ( not ( = ?auto_16587 ?auto_16585 ) ) ( not ( = ?auto_16586 ?auto_16585 ) ) ( PERSON-AT ?auto_16585 ?auto_16590 ) ( AIRCRAFT-AT ?auto_16589 ?auto_16584 ) ( FUEL-LEVEL ?auto_16589 ?auto_16588 ) ( IN ?auto_16587 ?auto_16589 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16587 ?auto_16586 ?auto_16584 )
      ( FLY-3PPL-VERIFY ?auto_16585 ?auto_16586 ?auto_16587 ?auto_16584 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16620 - PERSON
      ?auto_16621 - PERSON
      ?auto_16622 - PERSON
      ?auto_16619 - CITY
    )
    :vars
    (
      ?auto_16623 - FLEVEL
      ?auto_16626 - FLEVEL
      ?auto_16625 - CITY
      ?auto_16624 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16623 ?auto_16626 ) ( not ( = ?auto_16619 ?auto_16625 ) ) ( not ( = ?auto_16626 ?auto_16623 ) ) ( not ( = ?auto_16621 ?auto_16620 ) ) ( PERSON-AT ?auto_16620 ?auto_16625 ) ( not ( = ?auto_16621 ?auto_16622 ) ) ( not ( = ?auto_16620 ?auto_16622 ) ) ( PERSON-AT ?auto_16622 ?auto_16625 ) ( AIRCRAFT-AT ?auto_16624 ?auto_16619 ) ( FUEL-LEVEL ?auto_16624 ?auto_16623 ) ( IN ?auto_16621 ?auto_16624 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16621 ?auto_16620 ?auto_16619 )
      ( FLY-3PPL-VERIFY ?auto_16620 ?auto_16621 ?auto_16622 ?auto_16619 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16637 - PERSON
      ?auto_16638 - PERSON
      ?auto_16639 - PERSON
      ?auto_16636 - CITY
    )
    :vars
    (
      ?auto_16640 - FLEVEL
      ?auto_16643 - FLEVEL
      ?auto_16642 - CITY
      ?auto_16641 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_16640 ?auto_16643 ) ( not ( = ?auto_16636 ?auto_16642 ) ) ( not ( = ?auto_16643 ?auto_16640 ) ) ( not ( = ?auto_16639 ?auto_16637 ) ) ( PERSON-AT ?auto_16637 ?auto_16642 ) ( not ( = ?auto_16639 ?auto_16638 ) ) ( not ( = ?auto_16637 ?auto_16638 ) ) ( PERSON-AT ?auto_16638 ?auto_16642 ) ( AIRCRAFT-AT ?auto_16641 ?auto_16636 ) ( FUEL-LEVEL ?auto_16641 ?auto_16640 ) ( IN ?auto_16639 ?auto_16641 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16639 ?auto_16637 ?auto_16636 )
      ( FLY-3PPL-VERIFY ?auto_16637 ?auto_16638 ?auto_16639 ?auto_16636 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_16691 - PERSON
      ?auto_16690 - CITY
    )
    :vars
    (
      ?auto_16692 - FLEVEL
      ?auto_16696 - FLEVEL
      ?auto_16694 - CITY
      ?auto_16697 - PERSON
      ?auto_16695 - PERSON
      ?auto_16693 - AIRCRAFT
      ?auto_16698 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16692 ?auto_16696 ) ( not ( = ?auto_16690 ?auto_16694 ) ) ( not ( = ?auto_16696 ?auto_16692 ) ) ( not ( = ?auto_16697 ?auto_16691 ) ) ( PERSON-AT ?auto_16691 ?auto_16694 ) ( not ( = ?auto_16697 ?auto_16695 ) ) ( not ( = ?auto_16691 ?auto_16695 ) ) ( PERSON-AT ?auto_16695 ?auto_16694 ) ( IN ?auto_16697 ?auto_16693 ) ( AIRCRAFT-AT ?auto_16693 ?auto_16698 ) ( FUEL-LEVEL ?auto_16693 ?auto_16696 ) ( not ( = ?auto_16690 ?auto_16698 ) ) ( not ( = ?auto_16694 ?auto_16698 ) ) )
    :subtasks
    ( ( !FLY ?auto_16693 ?auto_16698 ?auto_16690 ?auto_16696 ?auto_16692 )
      ( FLY-2PPL ?auto_16697 ?auto_16691 ?auto_16690 )
      ( FLY-1PPL-VERIFY ?auto_16691 ?auto_16690 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16700 - PERSON
      ?auto_16701 - PERSON
      ?auto_16699 - CITY
    )
    :vars
    (
      ?auto_16705 - FLEVEL
      ?auto_16707 - FLEVEL
      ?auto_16703 - CITY
      ?auto_16706 - PERSON
      ?auto_16704 - AIRCRAFT
      ?auto_16702 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16705 ?auto_16707 ) ( not ( = ?auto_16699 ?auto_16703 ) ) ( not ( = ?auto_16707 ?auto_16705 ) ) ( not ( = ?auto_16700 ?auto_16701 ) ) ( PERSON-AT ?auto_16701 ?auto_16703 ) ( not ( = ?auto_16700 ?auto_16706 ) ) ( not ( = ?auto_16701 ?auto_16706 ) ) ( PERSON-AT ?auto_16706 ?auto_16703 ) ( IN ?auto_16700 ?auto_16704 ) ( AIRCRAFT-AT ?auto_16704 ?auto_16702 ) ( FUEL-LEVEL ?auto_16704 ?auto_16707 ) ( not ( = ?auto_16699 ?auto_16702 ) ) ( not ( = ?auto_16703 ?auto_16702 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16701 ?auto_16699 )
      ( FLY-2PPL-VERIFY ?auto_16700 ?auto_16701 ?auto_16699 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16709 - PERSON
      ?auto_16710 - PERSON
      ?auto_16708 - CITY
    )
    :vars
    (
      ?auto_16712 - FLEVEL
      ?auto_16714 - FLEVEL
      ?auto_16715 - CITY
      ?auto_16716 - PERSON
      ?auto_16713 - AIRCRAFT
      ?auto_16711 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16712 ?auto_16714 ) ( not ( = ?auto_16708 ?auto_16715 ) ) ( not ( = ?auto_16714 ?auto_16712 ) ) ( not ( = ?auto_16716 ?auto_16710 ) ) ( PERSON-AT ?auto_16710 ?auto_16715 ) ( not ( = ?auto_16716 ?auto_16709 ) ) ( not ( = ?auto_16710 ?auto_16709 ) ) ( PERSON-AT ?auto_16709 ?auto_16715 ) ( IN ?auto_16716 ?auto_16713 ) ( AIRCRAFT-AT ?auto_16713 ?auto_16711 ) ( FUEL-LEVEL ?auto_16713 ?auto_16714 ) ( not ( = ?auto_16708 ?auto_16711 ) ) ( not ( = ?auto_16715 ?auto_16711 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16716 ?auto_16710 ?auto_16708 )
      ( FLY-2PPL-VERIFY ?auto_16709 ?auto_16710 ?auto_16708 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16718 - PERSON
      ?auto_16719 - PERSON
      ?auto_16717 - CITY
    )
    :vars
    (
      ?auto_16721 - FLEVEL
      ?auto_16723 - FLEVEL
      ?auto_16724 - CITY
      ?auto_16725 - PERSON
      ?auto_16722 - AIRCRAFT
      ?auto_16720 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16721 ?auto_16723 ) ( not ( = ?auto_16717 ?auto_16724 ) ) ( not ( = ?auto_16723 ?auto_16721 ) ) ( not ( = ?auto_16719 ?auto_16718 ) ) ( PERSON-AT ?auto_16718 ?auto_16724 ) ( not ( = ?auto_16719 ?auto_16725 ) ) ( not ( = ?auto_16718 ?auto_16725 ) ) ( PERSON-AT ?auto_16725 ?auto_16724 ) ( IN ?auto_16719 ?auto_16722 ) ( AIRCRAFT-AT ?auto_16722 ?auto_16720 ) ( FUEL-LEVEL ?auto_16722 ?auto_16723 ) ( not ( = ?auto_16717 ?auto_16720 ) ) ( not ( = ?auto_16724 ?auto_16720 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16719 ?auto_16718 ?auto_16717 )
      ( FLY-2PPL-VERIFY ?auto_16718 ?auto_16719 ?auto_16717 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16727 - PERSON
      ?auto_16728 - PERSON
      ?auto_16726 - CITY
    )
    :vars
    (
      ?auto_16730 - FLEVEL
      ?auto_16732 - FLEVEL
      ?auto_16733 - CITY
      ?auto_16734 - PERSON
      ?auto_16731 - AIRCRAFT
      ?auto_16729 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16730 ?auto_16732 ) ( not ( = ?auto_16726 ?auto_16733 ) ) ( not ( = ?auto_16732 ?auto_16730 ) ) ( not ( = ?auto_16734 ?auto_16727 ) ) ( PERSON-AT ?auto_16727 ?auto_16733 ) ( not ( = ?auto_16734 ?auto_16728 ) ) ( not ( = ?auto_16727 ?auto_16728 ) ) ( PERSON-AT ?auto_16728 ?auto_16733 ) ( IN ?auto_16734 ?auto_16731 ) ( AIRCRAFT-AT ?auto_16731 ?auto_16729 ) ( FUEL-LEVEL ?auto_16731 ?auto_16732 ) ( not ( = ?auto_16726 ?auto_16729 ) ) ( not ( = ?auto_16733 ?auto_16729 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16734 ?auto_16727 ?auto_16726 )
      ( FLY-2PPL-VERIFY ?auto_16727 ?auto_16728 ?auto_16726 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16756 - PERSON
      ?auto_16757 - PERSON
      ?auto_16758 - PERSON
      ?auto_16755 - CITY
    )
    :vars
    (
      ?auto_16760 - FLEVEL
      ?auto_16762 - FLEVEL
      ?auto_16763 - CITY
      ?auto_16761 - AIRCRAFT
      ?auto_16759 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16760 ?auto_16762 ) ( not ( = ?auto_16755 ?auto_16763 ) ) ( not ( = ?auto_16762 ?auto_16760 ) ) ( not ( = ?auto_16756 ?auto_16758 ) ) ( PERSON-AT ?auto_16758 ?auto_16763 ) ( not ( = ?auto_16756 ?auto_16757 ) ) ( not ( = ?auto_16758 ?auto_16757 ) ) ( PERSON-AT ?auto_16757 ?auto_16763 ) ( IN ?auto_16756 ?auto_16761 ) ( AIRCRAFT-AT ?auto_16761 ?auto_16759 ) ( FUEL-LEVEL ?auto_16761 ?auto_16762 ) ( not ( = ?auto_16755 ?auto_16759 ) ) ( not ( = ?auto_16763 ?auto_16759 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16756 ?auto_16758 ?auto_16755 )
      ( FLY-3PPL-VERIFY ?auto_16756 ?auto_16757 ?auto_16758 ?auto_16755 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16775 - PERSON
      ?auto_16776 - PERSON
      ?auto_16777 - PERSON
      ?auto_16774 - CITY
    )
    :vars
    (
      ?auto_16779 - FLEVEL
      ?auto_16781 - FLEVEL
      ?auto_16782 - CITY
      ?auto_16780 - AIRCRAFT
      ?auto_16778 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16779 ?auto_16781 ) ( not ( = ?auto_16774 ?auto_16782 ) ) ( not ( = ?auto_16781 ?auto_16779 ) ) ( not ( = ?auto_16775 ?auto_16776 ) ) ( PERSON-AT ?auto_16776 ?auto_16782 ) ( not ( = ?auto_16775 ?auto_16777 ) ) ( not ( = ?auto_16776 ?auto_16777 ) ) ( PERSON-AT ?auto_16777 ?auto_16782 ) ( IN ?auto_16775 ?auto_16780 ) ( AIRCRAFT-AT ?auto_16780 ?auto_16778 ) ( FUEL-LEVEL ?auto_16780 ?auto_16781 ) ( not ( = ?auto_16774 ?auto_16778 ) ) ( not ( = ?auto_16782 ?auto_16778 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16775 ?auto_16776 ?auto_16774 )
      ( FLY-3PPL-VERIFY ?auto_16775 ?auto_16776 ?auto_16777 ?auto_16774 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16794 - PERSON
      ?auto_16795 - PERSON
      ?auto_16796 - PERSON
      ?auto_16793 - CITY
    )
    :vars
    (
      ?auto_16798 - FLEVEL
      ?auto_16800 - FLEVEL
      ?auto_16801 - CITY
      ?auto_16799 - AIRCRAFT
      ?auto_16797 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16798 ?auto_16800 ) ( not ( = ?auto_16793 ?auto_16801 ) ) ( not ( = ?auto_16800 ?auto_16798 ) ) ( not ( = ?auto_16795 ?auto_16796 ) ) ( PERSON-AT ?auto_16796 ?auto_16801 ) ( not ( = ?auto_16795 ?auto_16794 ) ) ( not ( = ?auto_16796 ?auto_16794 ) ) ( PERSON-AT ?auto_16794 ?auto_16801 ) ( IN ?auto_16795 ?auto_16799 ) ( AIRCRAFT-AT ?auto_16799 ?auto_16797 ) ( FUEL-LEVEL ?auto_16799 ?auto_16800 ) ( not ( = ?auto_16793 ?auto_16797 ) ) ( not ( = ?auto_16801 ?auto_16797 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16795 ?auto_16796 ?auto_16793 )
      ( FLY-3PPL-VERIFY ?auto_16794 ?auto_16795 ?auto_16796 ?auto_16793 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16813 - PERSON
      ?auto_16814 - PERSON
      ?auto_16815 - PERSON
      ?auto_16812 - CITY
    )
    :vars
    (
      ?auto_16817 - FLEVEL
      ?auto_16819 - FLEVEL
      ?auto_16820 - CITY
      ?auto_16818 - AIRCRAFT
      ?auto_16816 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16817 ?auto_16819 ) ( not ( = ?auto_16812 ?auto_16820 ) ) ( not ( = ?auto_16819 ?auto_16817 ) ) ( not ( = ?auto_16815 ?auto_16814 ) ) ( PERSON-AT ?auto_16814 ?auto_16820 ) ( not ( = ?auto_16815 ?auto_16813 ) ) ( not ( = ?auto_16814 ?auto_16813 ) ) ( PERSON-AT ?auto_16813 ?auto_16820 ) ( IN ?auto_16815 ?auto_16818 ) ( AIRCRAFT-AT ?auto_16818 ?auto_16816 ) ( FUEL-LEVEL ?auto_16818 ?auto_16819 ) ( not ( = ?auto_16812 ?auto_16816 ) ) ( not ( = ?auto_16820 ?auto_16816 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16815 ?auto_16814 ?auto_16812 )
      ( FLY-3PPL-VERIFY ?auto_16813 ?auto_16814 ?auto_16815 ?auto_16812 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16852 - PERSON
      ?auto_16853 - PERSON
      ?auto_16854 - PERSON
      ?auto_16851 - CITY
    )
    :vars
    (
      ?auto_16856 - FLEVEL
      ?auto_16858 - FLEVEL
      ?auto_16859 - CITY
      ?auto_16857 - AIRCRAFT
      ?auto_16855 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16856 ?auto_16858 ) ( not ( = ?auto_16851 ?auto_16859 ) ) ( not ( = ?auto_16858 ?auto_16856 ) ) ( not ( = ?auto_16853 ?auto_16852 ) ) ( PERSON-AT ?auto_16852 ?auto_16859 ) ( not ( = ?auto_16853 ?auto_16854 ) ) ( not ( = ?auto_16852 ?auto_16854 ) ) ( PERSON-AT ?auto_16854 ?auto_16859 ) ( IN ?auto_16853 ?auto_16857 ) ( AIRCRAFT-AT ?auto_16857 ?auto_16855 ) ( FUEL-LEVEL ?auto_16857 ?auto_16858 ) ( not ( = ?auto_16851 ?auto_16855 ) ) ( not ( = ?auto_16859 ?auto_16855 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16853 ?auto_16852 ?auto_16851 )
      ( FLY-3PPL-VERIFY ?auto_16852 ?auto_16853 ?auto_16854 ?auto_16851 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16871 - PERSON
      ?auto_16872 - PERSON
      ?auto_16873 - PERSON
      ?auto_16870 - CITY
    )
    :vars
    (
      ?auto_16875 - FLEVEL
      ?auto_16877 - FLEVEL
      ?auto_16878 - CITY
      ?auto_16876 - AIRCRAFT
      ?auto_16874 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16875 ?auto_16877 ) ( not ( = ?auto_16870 ?auto_16878 ) ) ( not ( = ?auto_16877 ?auto_16875 ) ) ( not ( = ?auto_16873 ?auto_16871 ) ) ( PERSON-AT ?auto_16871 ?auto_16878 ) ( not ( = ?auto_16873 ?auto_16872 ) ) ( not ( = ?auto_16871 ?auto_16872 ) ) ( PERSON-AT ?auto_16872 ?auto_16878 ) ( IN ?auto_16873 ?auto_16876 ) ( AIRCRAFT-AT ?auto_16876 ?auto_16874 ) ( FUEL-LEVEL ?auto_16876 ?auto_16877 ) ( not ( = ?auto_16870 ?auto_16874 ) ) ( not ( = ?auto_16878 ?auto_16874 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16873 ?auto_16871 ?auto_16870 )
      ( FLY-3PPL-VERIFY ?auto_16871 ?auto_16872 ?auto_16873 ?auto_16870 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_16931 - PERSON
      ?auto_16930 - CITY
    )
    :vars
    (
      ?auto_16933 - FLEVEL
      ?auto_16935 - FLEVEL
      ?auto_16936 - CITY
      ?auto_16938 - PERSON
      ?auto_16937 - PERSON
      ?auto_16934 - AIRCRAFT
      ?auto_16932 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16933 ?auto_16935 ) ( not ( = ?auto_16930 ?auto_16936 ) ) ( not ( = ?auto_16935 ?auto_16933 ) ) ( not ( = ?auto_16938 ?auto_16931 ) ) ( PERSON-AT ?auto_16931 ?auto_16936 ) ( not ( = ?auto_16938 ?auto_16937 ) ) ( not ( = ?auto_16931 ?auto_16937 ) ) ( PERSON-AT ?auto_16937 ?auto_16936 ) ( AIRCRAFT-AT ?auto_16934 ?auto_16932 ) ( FUEL-LEVEL ?auto_16934 ?auto_16935 ) ( not ( = ?auto_16930 ?auto_16932 ) ) ( not ( = ?auto_16936 ?auto_16932 ) ) ( PERSON-AT ?auto_16938 ?auto_16932 ) )
    :subtasks
    ( ( !BOARD ?auto_16938 ?auto_16934 ?auto_16932 )
      ( FLY-2PPL ?auto_16938 ?auto_16931 ?auto_16930 )
      ( FLY-1PPL-VERIFY ?auto_16931 ?auto_16930 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16940 - PERSON
      ?auto_16941 - PERSON
      ?auto_16939 - CITY
    )
    :vars
    (
      ?auto_16945 - FLEVEL
      ?auto_16942 - FLEVEL
      ?auto_16946 - CITY
      ?auto_16944 - PERSON
      ?auto_16943 - AIRCRAFT
      ?auto_16947 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16945 ?auto_16942 ) ( not ( = ?auto_16939 ?auto_16946 ) ) ( not ( = ?auto_16942 ?auto_16945 ) ) ( not ( = ?auto_16940 ?auto_16941 ) ) ( PERSON-AT ?auto_16941 ?auto_16946 ) ( not ( = ?auto_16940 ?auto_16944 ) ) ( not ( = ?auto_16941 ?auto_16944 ) ) ( PERSON-AT ?auto_16944 ?auto_16946 ) ( AIRCRAFT-AT ?auto_16943 ?auto_16947 ) ( FUEL-LEVEL ?auto_16943 ?auto_16942 ) ( not ( = ?auto_16939 ?auto_16947 ) ) ( not ( = ?auto_16946 ?auto_16947 ) ) ( PERSON-AT ?auto_16940 ?auto_16947 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_16941 ?auto_16939 )
      ( FLY-2PPL-VERIFY ?auto_16940 ?auto_16941 ?auto_16939 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16949 - PERSON
      ?auto_16950 - PERSON
      ?auto_16948 - CITY
    )
    :vars
    (
      ?auto_16954 - FLEVEL
      ?auto_16952 - FLEVEL
      ?auto_16953 - CITY
      ?auto_16956 - PERSON
      ?auto_16951 - AIRCRAFT
      ?auto_16955 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16954 ?auto_16952 ) ( not ( = ?auto_16948 ?auto_16953 ) ) ( not ( = ?auto_16952 ?auto_16954 ) ) ( not ( = ?auto_16956 ?auto_16950 ) ) ( PERSON-AT ?auto_16950 ?auto_16953 ) ( not ( = ?auto_16956 ?auto_16949 ) ) ( not ( = ?auto_16950 ?auto_16949 ) ) ( PERSON-AT ?auto_16949 ?auto_16953 ) ( AIRCRAFT-AT ?auto_16951 ?auto_16955 ) ( FUEL-LEVEL ?auto_16951 ?auto_16952 ) ( not ( = ?auto_16948 ?auto_16955 ) ) ( not ( = ?auto_16953 ?auto_16955 ) ) ( PERSON-AT ?auto_16956 ?auto_16955 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16956 ?auto_16950 ?auto_16948 )
      ( FLY-2PPL-VERIFY ?auto_16949 ?auto_16950 ?auto_16948 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16958 - PERSON
      ?auto_16959 - PERSON
      ?auto_16957 - CITY
    )
    :vars
    (
      ?auto_16964 - FLEVEL
      ?auto_16961 - FLEVEL
      ?auto_16963 - CITY
      ?auto_16962 - PERSON
      ?auto_16960 - AIRCRAFT
      ?auto_16965 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16964 ?auto_16961 ) ( not ( = ?auto_16957 ?auto_16963 ) ) ( not ( = ?auto_16961 ?auto_16964 ) ) ( not ( = ?auto_16959 ?auto_16958 ) ) ( PERSON-AT ?auto_16958 ?auto_16963 ) ( not ( = ?auto_16959 ?auto_16962 ) ) ( not ( = ?auto_16958 ?auto_16962 ) ) ( PERSON-AT ?auto_16962 ?auto_16963 ) ( AIRCRAFT-AT ?auto_16960 ?auto_16965 ) ( FUEL-LEVEL ?auto_16960 ?auto_16961 ) ( not ( = ?auto_16957 ?auto_16965 ) ) ( not ( = ?auto_16963 ?auto_16965 ) ) ( PERSON-AT ?auto_16959 ?auto_16965 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16959 ?auto_16958 ?auto_16957 )
      ( FLY-2PPL-VERIFY ?auto_16958 ?auto_16959 ?auto_16957 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_16967 - PERSON
      ?auto_16968 - PERSON
      ?auto_16966 - CITY
    )
    :vars
    (
      ?auto_16972 - FLEVEL
      ?auto_16970 - FLEVEL
      ?auto_16971 - CITY
      ?auto_16974 - PERSON
      ?auto_16969 - AIRCRAFT
      ?auto_16973 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_16972 ?auto_16970 ) ( not ( = ?auto_16966 ?auto_16971 ) ) ( not ( = ?auto_16970 ?auto_16972 ) ) ( not ( = ?auto_16974 ?auto_16967 ) ) ( PERSON-AT ?auto_16967 ?auto_16971 ) ( not ( = ?auto_16974 ?auto_16968 ) ) ( not ( = ?auto_16967 ?auto_16968 ) ) ( PERSON-AT ?auto_16968 ?auto_16971 ) ( AIRCRAFT-AT ?auto_16969 ?auto_16973 ) ( FUEL-LEVEL ?auto_16969 ?auto_16970 ) ( not ( = ?auto_16966 ?auto_16973 ) ) ( not ( = ?auto_16971 ?auto_16973 ) ) ( PERSON-AT ?auto_16974 ?auto_16973 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16974 ?auto_16967 ?auto_16966 )
      ( FLY-2PPL-VERIFY ?auto_16967 ?auto_16968 ?auto_16966 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_16996 - PERSON
      ?auto_16997 - PERSON
      ?auto_16998 - PERSON
      ?auto_16995 - CITY
    )
    :vars
    (
      ?auto_17002 - FLEVEL
      ?auto_17000 - FLEVEL
      ?auto_17001 - CITY
      ?auto_16999 - AIRCRAFT
      ?auto_17003 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17002 ?auto_17000 ) ( not ( = ?auto_16995 ?auto_17001 ) ) ( not ( = ?auto_17000 ?auto_17002 ) ) ( not ( = ?auto_16996 ?auto_16998 ) ) ( PERSON-AT ?auto_16998 ?auto_17001 ) ( not ( = ?auto_16996 ?auto_16997 ) ) ( not ( = ?auto_16998 ?auto_16997 ) ) ( PERSON-AT ?auto_16997 ?auto_17001 ) ( AIRCRAFT-AT ?auto_16999 ?auto_17003 ) ( FUEL-LEVEL ?auto_16999 ?auto_17000 ) ( not ( = ?auto_16995 ?auto_17003 ) ) ( not ( = ?auto_17001 ?auto_17003 ) ) ( PERSON-AT ?auto_16996 ?auto_17003 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_16996 ?auto_16998 ?auto_16995 )
      ( FLY-3PPL-VERIFY ?auto_16996 ?auto_16997 ?auto_16998 ?auto_16995 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17015 - PERSON
      ?auto_17016 - PERSON
      ?auto_17017 - PERSON
      ?auto_17014 - CITY
    )
    :vars
    (
      ?auto_17021 - FLEVEL
      ?auto_17019 - FLEVEL
      ?auto_17020 - CITY
      ?auto_17018 - AIRCRAFT
      ?auto_17022 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17021 ?auto_17019 ) ( not ( = ?auto_17014 ?auto_17020 ) ) ( not ( = ?auto_17019 ?auto_17021 ) ) ( not ( = ?auto_17015 ?auto_17016 ) ) ( PERSON-AT ?auto_17016 ?auto_17020 ) ( not ( = ?auto_17015 ?auto_17017 ) ) ( not ( = ?auto_17016 ?auto_17017 ) ) ( PERSON-AT ?auto_17017 ?auto_17020 ) ( AIRCRAFT-AT ?auto_17018 ?auto_17022 ) ( FUEL-LEVEL ?auto_17018 ?auto_17019 ) ( not ( = ?auto_17014 ?auto_17022 ) ) ( not ( = ?auto_17020 ?auto_17022 ) ) ( PERSON-AT ?auto_17015 ?auto_17022 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17015 ?auto_17016 ?auto_17014 )
      ( FLY-3PPL-VERIFY ?auto_17015 ?auto_17016 ?auto_17017 ?auto_17014 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17034 - PERSON
      ?auto_17035 - PERSON
      ?auto_17036 - PERSON
      ?auto_17033 - CITY
    )
    :vars
    (
      ?auto_17040 - FLEVEL
      ?auto_17038 - FLEVEL
      ?auto_17039 - CITY
      ?auto_17037 - AIRCRAFT
      ?auto_17041 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17040 ?auto_17038 ) ( not ( = ?auto_17033 ?auto_17039 ) ) ( not ( = ?auto_17038 ?auto_17040 ) ) ( not ( = ?auto_17035 ?auto_17036 ) ) ( PERSON-AT ?auto_17036 ?auto_17039 ) ( not ( = ?auto_17035 ?auto_17034 ) ) ( not ( = ?auto_17036 ?auto_17034 ) ) ( PERSON-AT ?auto_17034 ?auto_17039 ) ( AIRCRAFT-AT ?auto_17037 ?auto_17041 ) ( FUEL-LEVEL ?auto_17037 ?auto_17038 ) ( not ( = ?auto_17033 ?auto_17041 ) ) ( not ( = ?auto_17039 ?auto_17041 ) ) ( PERSON-AT ?auto_17035 ?auto_17041 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17035 ?auto_17036 ?auto_17033 )
      ( FLY-3PPL-VERIFY ?auto_17034 ?auto_17035 ?auto_17036 ?auto_17033 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17053 - PERSON
      ?auto_17054 - PERSON
      ?auto_17055 - PERSON
      ?auto_17052 - CITY
    )
    :vars
    (
      ?auto_17059 - FLEVEL
      ?auto_17057 - FLEVEL
      ?auto_17058 - CITY
      ?auto_17056 - AIRCRAFT
      ?auto_17060 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17059 ?auto_17057 ) ( not ( = ?auto_17052 ?auto_17058 ) ) ( not ( = ?auto_17057 ?auto_17059 ) ) ( not ( = ?auto_17055 ?auto_17054 ) ) ( PERSON-AT ?auto_17054 ?auto_17058 ) ( not ( = ?auto_17055 ?auto_17053 ) ) ( not ( = ?auto_17054 ?auto_17053 ) ) ( PERSON-AT ?auto_17053 ?auto_17058 ) ( AIRCRAFT-AT ?auto_17056 ?auto_17060 ) ( FUEL-LEVEL ?auto_17056 ?auto_17057 ) ( not ( = ?auto_17052 ?auto_17060 ) ) ( not ( = ?auto_17058 ?auto_17060 ) ) ( PERSON-AT ?auto_17055 ?auto_17060 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17055 ?auto_17054 ?auto_17052 )
      ( FLY-3PPL-VERIFY ?auto_17053 ?auto_17054 ?auto_17055 ?auto_17052 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17092 - PERSON
      ?auto_17093 - PERSON
      ?auto_17094 - PERSON
      ?auto_17091 - CITY
    )
    :vars
    (
      ?auto_17098 - FLEVEL
      ?auto_17096 - FLEVEL
      ?auto_17097 - CITY
      ?auto_17095 - AIRCRAFT
      ?auto_17099 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17098 ?auto_17096 ) ( not ( = ?auto_17091 ?auto_17097 ) ) ( not ( = ?auto_17096 ?auto_17098 ) ) ( not ( = ?auto_17093 ?auto_17092 ) ) ( PERSON-AT ?auto_17092 ?auto_17097 ) ( not ( = ?auto_17093 ?auto_17094 ) ) ( not ( = ?auto_17092 ?auto_17094 ) ) ( PERSON-AT ?auto_17094 ?auto_17097 ) ( AIRCRAFT-AT ?auto_17095 ?auto_17099 ) ( FUEL-LEVEL ?auto_17095 ?auto_17096 ) ( not ( = ?auto_17091 ?auto_17099 ) ) ( not ( = ?auto_17097 ?auto_17099 ) ) ( PERSON-AT ?auto_17093 ?auto_17099 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17093 ?auto_17092 ?auto_17091 )
      ( FLY-3PPL-VERIFY ?auto_17092 ?auto_17093 ?auto_17094 ?auto_17091 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17111 - PERSON
      ?auto_17112 - PERSON
      ?auto_17113 - PERSON
      ?auto_17110 - CITY
    )
    :vars
    (
      ?auto_17117 - FLEVEL
      ?auto_17115 - FLEVEL
      ?auto_17116 - CITY
      ?auto_17114 - AIRCRAFT
      ?auto_17118 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17117 ?auto_17115 ) ( not ( = ?auto_17110 ?auto_17116 ) ) ( not ( = ?auto_17115 ?auto_17117 ) ) ( not ( = ?auto_17113 ?auto_17111 ) ) ( PERSON-AT ?auto_17111 ?auto_17116 ) ( not ( = ?auto_17113 ?auto_17112 ) ) ( not ( = ?auto_17111 ?auto_17112 ) ) ( PERSON-AT ?auto_17112 ?auto_17116 ) ( AIRCRAFT-AT ?auto_17114 ?auto_17118 ) ( FUEL-LEVEL ?auto_17114 ?auto_17115 ) ( not ( = ?auto_17110 ?auto_17118 ) ) ( not ( = ?auto_17116 ?auto_17118 ) ) ( PERSON-AT ?auto_17113 ?auto_17118 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17113 ?auto_17111 ?auto_17110 )
      ( FLY-3PPL-VERIFY ?auto_17111 ?auto_17112 ?auto_17113 ?auto_17110 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_17171 - PERSON
      ?auto_17170 - CITY
    )
    :vars
    (
      ?auto_17176 - FLEVEL
      ?auto_17173 - FLEVEL
      ?auto_17175 - CITY
      ?auto_17178 - PERSON
      ?auto_17174 - PERSON
      ?auto_17172 - AIRCRAFT
      ?auto_17177 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17176 ?auto_17173 ) ( not ( = ?auto_17170 ?auto_17175 ) ) ( not ( = ?auto_17173 ?auto_17176 ) ) ( not ( = ?auto_17178 ?auto_17171 ) ) ( PERSON-AT ?auto_17171 ?auto_17175 ) ( not ( = ?auto_17178 ?auto_17174 ) ) ( not ( = ?auto_17171 ?auto_17174 ) ) ( PERSON-AT ?auto_17174 ?auto_17175 ) ( AIRCRAFT-AT ?auto_17172 ?auto_17177 ) ( not ( = ?auto_17170 ?auto_17177 ) ) ( not ( = ?auto_17175 ?auto_17177 ) ) ( PERSON-AT ?auto_17178 ?auto_17177 ) ( FUEL-LEVEL ?auto_17172 ?auto_17176 ) )
    :subtasks
    ( ( !REFUEL ?auto_17172 ?auto_17177 ?auto_17176 ?auto_17173 )
      ( FLY-2PPL ?auto_17178 ?auto_17171 ?auto_17170 )
      ( FLY-1PPL-VERIFY ?auto_17171 ?auto_17170 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_17180 - PERSON
      ?auto_17181 - PERSON
      ?auto_17179 - CITY
    )
    :vars
    (
      ?auto_17185 - FLEVEL
      ?auto_17182 - FLEVEL
      ?auto_17187 - CITY
      ?auto_17184 - PERSON
      ?auto_17183 - AIRCRAFT
      ?auto_17186 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17185 ?auto_17182 ) ( not ( = ?auto_17179 ?auto_17187 ) ) ( not ( = ?auto_17182 ?auto_17185 ) ) ( not ( = ?auto_17180 ?auto_17181 ) ) ( PERSON-AT ?auto_17181 ?auto_17187 ) ( not ( = ?auto_17180 ?auto_17184 ) ) ( not ( = ?auto_17181 ?auto_17184 ) ) ( PERSON-AT ?auto_17184 ?auto_17187 ) ( AIRCRAFT-AT ?auto_17183 ?auto_17186 ) ( not ( = ?auto_17179 ?auto_17186 ) ) ( not ( = ?auto_17187 ?auto_17186 ) ) ( PERSON-AT ?auto_17180 ?auto_17186 ) ( FUEL-LEVEL ?auto_17183 ?auto_17185 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_17181 ?auto_17179 )
      ( FLY-2PPL-VERIFY ?auto_17180 ?auto_17181 ?auto_17179 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_17189 - PERSON
      ?auto_17190 - PERSON
      ?auto_17188 - CITY
    )
    :vars
    (
      ?auto_17193 - FLEVEL
      ?auto_17194 - FLEVEL
      ?auto_17191 - CITY
      ?auto_17196 - PERSON
      ?auto_17195 - AIRCRAFT
      ?auto_17192 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17193 ?auto_17194 ) ( not ( = ?auto_17188 ?auto_17191 ) ) ( not ( = ?auto_17194 ?auto_17193 ) ) ( not ( = ?auto_17196 ?auto_17190 ) ) ( PERSON-AT ?auto_17190 ?auto_17191 ) ( not ( = ?auto_17196 ?auto_17189 ) ) ( not ( = ?auto_17190 ?auto_17189 ) ) ( PERSON-AT ?auto_17189 ?auto_17191 ) ( AIRCRAFT-AT ?auto_17195 ?auto_17192 ) ( not ( = ?auto_17188 ?auto_17192 ) ) ( not ( = ?auto_17191 ?auto_17192 ) ) ( PERSON-AT ?auto_17196 ?auto_17192 ) ( FUEL-LEVEL ?auto_17195 ?auto_17193 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17196 ?auto_17190 ?auto_17188 )
      ( FLY-2PPL-VERIFY ?auto_17189 ?auto_17190 ?auto_17188 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_17198 - PERSON
      ?auto_17199 - PERSON
      ?auto_17197 - CITY
    )
    :vars
    (
      ?auto_17203 - FLEVEL
      ?auto_17204 - FLEVEL
      ?auto_17200 - CITY
      ?auto_17201 - PERSON
      ?auto_17205 - AIRCRAFT
      ?auto_17202 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17203 ?auto_17204 ) ( not ( = ?auto_17197 ?auto_17200 ) ) ( not ( = ?auto_17204 ?auto_17203 ) ) ( not ( = ?auto_17199 ?auto_17198 ) ) ( PERSON-AT ?auto_17198 ?auto_17200 ) ( not ( = ?auto_17199 ?auto_17201 ) ) ( not ( = ?auto_17198 ?auto_17201 ) ) ( PERSON-AT ?auto_17201 ?auto_17200 ) ( AIRCRAFT-AT ?auto_17205 ?auto_17202 ) ( not ( = ?auto_17197 ?auto_17202 ) ) ( not ( = ?auto_17200 ?auto_17202 ) ) ( PERSON-AT ?auto_17199 ?auto_17202 ) ( FUEL-LEVEL ?auto_17205 ?auto_17203 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17199 ?auto_17198 ?auto_17197 )
      ( FLY-2PPL-VERIFY ?auto_17198 ?auto_17199 ?auto_17197 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_17207 - PERSON
      ?auto_17208 - PERSON
      ?auto_17206 - CITY
    )
    :vars
    (
      ?auto_17211 - FLEVEL
      ?auto_17212 - FLEVEL
      ?auto_17209 - CITY
      ?auto_17214 - PERSON
      ?auto_17213 - AIRCRAFT
      ?auto_17210 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17211 ?auto_17212 ) ( not ( = ?auto_17206 ?auto_17209 ) ) ( not ( = ?auto_17212 ?auto_17211 ) ) ( not ( = ?auto_17214 ?auto_17207 ) ) ( PERSON-AT ?auto_17207 ?auto_17209 ) ( not ( = ?auto_17214 ?auto_17208 ) ) ( not ( = ?auto_17207 ?auto_17208 ) ) ( PERSON-AT ?auto_17208 ?auto_17209 ) ( AIRCRAFT-AT ?auto_17213 ?auto_17210 ) ( not ( = ?auto_17206 ?auto_17210 ) ) ( not ( = ?auto_17209 ?auto_17210 ) ) ( PERSON-AT ?auto_17214 ?auto_17210 ) ( FUEL-LEVEL ?auto_17213 ?auto_17211 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17214 ?auto_17207 ?auto_17206 )
      ( FLY-2PPL-VERIFY ?auto_17207 ?auto_17208 ?auto_17206 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17236 - PERSON
      ?auto_17237 - PERSON
      ?auto_17238 - PERSON
      ?auto_17235 - CITY
    )
    :vars
    (
      ?auto_17241 - FLEVEL
      ?auto_17242 - FLEVEL
      ?auto_17239 - CITY
      ?auto_17243 - AIRCRAFT
      ?auto_17240 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17241 ?auto_17242 ) ( not ( = ?auto_17235 ?auto_17239 ) ) ( not ( = ?auto_17242 ?auto_17241 ) ) ( not ( = ?auto_17236 ?auto_17238 ) ) ( PERSON-AT ?auto_17238 ?auto_17239 ) ( not ( = ?auto_17236 ?auto_17237 ) ) ( not ( = ?auto_17238 ?auto_17237 ) ) ( PERSON-AT ?auto_17237 ?auto_17239 ) ( AIRCRAFT-AT ?auto_17243 ?auto_17240 ) ( not ( = ?auto_17235 ?auto_17240 ) ) ( not ( = ?auto_17239 ?auto_17240 ) ) ( PERSON-AT ?auto_17236 ?auto_17240 ) ( FUEL-LEVEL ?auto_17243 ?auto_17241 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17236 ?auto_17238 ?auto_17235 )
      ( FLY-3PPL-VERIFY ?auto_17236 ?auto_17237 ?auto_17238 ?auto_17235 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17255 - PERSON
      ?auto_17256 - PERSON
      ?auto_17257 - PERSON
      ?auto_17254 - CITY
    )
    :vars
    (
      ?auto_17260 - FLEVEL
      ?auto_17261 - FLEVEL
      ?auto_17258 - CITY
      ?auto_17262 - AIRCRAFT
      ?auto_17259 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17260 ?auto_17261 ) ( not ( = ?auto_17254 ?auto_17258 ) ) ( not ( = ?auto_17261 ?auto_17260 ) ) ( not ( = ?auto_17255 ?auto_17256 ) ) ( PERSON-AT ?auto_17256 ?auto_17258 ) ( not ( = ?auto_17255 ?auto_17257 ) ) ( not ( = ?auto_17256 ?auto_17257 ) ) ( PERSON-AT ?auto_17257 ?auto_17258 ) ( AIRCRAFT-AT ?auto_17262 ?auto_17259 ) ( not ( = ?auto_17254 ?auto_17259 ) ) ( not ( = ?auto_17258 ?auto_17259 ) ) ( PERSON-AT ?auto_17255 ?auto_17259 ) ( FUEL-LEVEL ?auto_17262 ?auto_17260 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17255 ?auto_17256 ?auto_17254 )
      ( FLY-3PPL-VERIFY ?auto_17255 ?auto_17256 ?auto_17257 ?auto_17254 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17274 - PERSON
      ?auto_17275 - PERSON
      ?auto_17276 - PERSON
      ?auto_17273 - CITY
    )
    :vars
    (
      ?auto_17279 - FLEVEL
      ?auto_17280 - FLEVEL
      ?auto_17277 - CITY
      ?auto_17281 - AIRCRAFT
      ?auto_17278 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17279 ?auto_17280 ) ( not ( = ?auto_17273 ?auto_17277 ) ) ( not ( = ?auto_17280 ?auto_17279 ) ) ( not ( = ?auto_17275 ?auto_17276 ) ) ( PERSON-AT ?auto_17276 ?auto_17277 ) ( not ( = ?auto_17275 ?auto_17274 ) ) ( not ( = ?auto_17276 ?auto_17274 ) ) ( PERSON-AT ?auto_17274 ?auto_17277 ) ( AIRCRAFT-AT ?auto_17281 ?auto_17278 ) ( not ( = ?auto_17273 ?auto_17278 ) ) ( not ( = ?auto_17277 ?auto_17278 ) ) ( PERSON-AT ?auto_17275 ?auto_17278 ) ( FUEL-LEVEL ?auto_17281 ?auto_17279 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17275 ?auto_17276 ?auto_17273 )
      ( FLY-3PPL-VERIFY ?auto_17274 ?auto_17275 ?auto_17276 ?auto_17273 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17293 - PERSON
      ?auto_17294 - PERSON
      ?auto_17295 - PERSON
      ?auto_17292 - CITY
    )
    :vars
    (
      ?auto_17298 - FLEVEL
      ?auto_17299 - FLEVEL
      ?auto_17296 - CITY
      ?auto_17300 - AIRCRAFT
      ?auto_17297 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17298 ?auto_17299 ) ( not ( = ?auto_17292 ?auto_17296 ) ) ( not ( = ?auto_17299 ?auto_17298 ) ) ( not ( = ?auto_17295 ?auto_17294 ) ) ( PERSON-AT ?auto_17294 ?auto_17296 ) ( not ( = ?auto_17295 ?auto_17293 ) ) ( not ( = ?auto_17294 ?auto_17293 ) ) ( PERSON-AT ?auto_17293 ?auto_17296 ) ( AIRCRAFT-AT ?auto_17300 ?auto_17297 ) ( not ( = ?auto_17292 ?auto_17297 ) ) ( not ( = ?auto_17296 ?auto_17297 ) ) ( PERSON-AT ?auto_17295 ?auto_17297 ) ( FUEL-LEVEL ?auto_17300 ?auto_17298 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17295 ?auto_17294 ?auto_17292 )
      ( FLY-3PPL-VERIFY ?auto_17293 ?auto_17294 ?auto_17295 ?auto_17292 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17332 - PERSON
      ?auto_17333 - PERSON
      ?auto_17334 - PERSON
      ?auto_17331 - CITY
    )
    :vars
    (
      ?auto_17337 - FLEVEL
      ?auto_17338 - FLEVEL
      ?auto_17335 - CITY
      ?auto_17339 - AIRCRAFT
      ?auto_17336 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17337 ?auto_17338 ) ( not ( = ?auto_17331 ?auto_17335 ) ) ( not ( = ?auto_17338 ?auto_17337 ) ) ( not ( = ?auto_17333 ?auto_17332 ) ) ( PERSON-AT ?auto_17332 ?auto_17335 ) ( not ( = ?auto_17333 ?auto_17334 ) ) ( not ( = ?auto_17332 ?auto_17334 ) ) ( PERSON-AT ?auto_17334 ?auto_17335 ) ( AIRCRAFT-AT ?auto_17339 ?auto_17336 ) ( not ( = ?auto_17331 ?auto_17336 ) ) ( not ( = ?auto_17335 ?auto_17336 ) ) ( PERSON-AT ?auto_17333 ?auto_17336 ) ( FUEL-LEVEL ?auto_17339 ?auto_17337 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17333 ?auto_17332 ?auto_17331 )
      ( FLY-3PPL-VERIFY ?auto_17332 ?auto_17333 ?auto_17334 ?auto_17331 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17351 - PERSON
      ?auto_17352 - PERSON
      ?auto_17353 - PERSON
      ?auto_17350 - CITY
    )
    :vars
    (
      ?auto_17356 - FLEVEL
      ?auto_17357 - FLEVEL
      ?auto_17354 - CITY
      ?auto_17358 - AIRCRAFT
      ?auto_17355 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_17356 ?auto_17357 ) ( not ( = ?auto_17350 ?auto_17354 ) ) ( not ( = ?auto_17357 ?auto_17356 ) ) ( not ( = ?auto_17353 ?auto_17351 ) ) ( PERSON-AT ?auto_17351 ?auto_17354 ) ( not ( = ?auto_17353 ?auto_17352 ) ) ( not ( = ?auto_17351 ?auto_17352 ) ) ( PERSON-AT ?auto_17352 ?auto_17354 ) ( AIRCRAFT-AT ?auto_17358 ?auto_17355 ) ( not ( = ?auto_17350 ?auto_17355 ) ) ( not ( = ?auto_17354 ?auto_17355 ) ) ( PERSON-AT ?auto_17353 ?auto_17355 ) ( FUEL-LEVEL ?auto_17358 ?auto_17356 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17353 ?auto_17351 ?auto_17350 )
      ( FLY-3PPL-VERIFY ?auto_17351 ?auto_17352 ?auto_17353 ?auto_17350 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_17411 - PERSON
      ?auto_17410 - CITY
    )
    :vars
    (
      ?auto_17415 - FLEVEL
      ?auto_17416 - FLEVEL
      ?auto_17412 - CITY
      ?auto_17418 - PERSON
      ?auto_17413 - PERSON
      ?auto_17414 - CITY
      ?auto_17417 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17415 ?auto_17416 ) ( not ( = ?auto_17410 ?auto_17412 ) ) ( not ( = ?auto_17416 ?auto_17415 ) ) ( not ( = ?auto_17418 ?auto_17411 ) ) ( PERSON-AT ?auto_17411 ?auto_17412 ) ( not ( = ?auto_17418 ?auto_17413 ) ) ( not ( = ?auto_17411 ?auto_17413 ) ) ( PERSON-AT ?auto_17413 ?auto_17412 ) ( not ( = ?auto_17410 ?auto_17414 ) ) ( not ( = ?auto_17412 ?auto_17414 ) ) ( PERSON-AT ?auto_17418 ?auto_17414 ) ( AIRCRAFT-AT ?auto_17417 ?auto_17410 ) ( FUEL-LEVEL ?auto_17417 ?auto_17416 ) )
    :subtasks
    ( ( !FLY ?auto_17417 ?auto_17410 ?auto_17414 ?auto_17416 ?auto_17415 )
      ( FLY-2PPL ?auto_17418 ?auto_17411 ?auto_17410 )
      ( FLY-1PPL-VERIFY ?auto_17411 ?auto_17410 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_17420 - PERSON
      ?auto_17421 - PERSON
      ?auto_17419 - CITY
    )
    :vars
    (
      ?auto_17426 - FLEVEL
      ?auto_17425 - FLEVEL
      ?auto_17423 - CITY
      ?auto_17427 - PERSON
      ?auto_17422 - CITY
      ?auto_17424 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17426 ?auto_17425 ) ( not ( = ?auto_17419 ?auto_17423 ) ) ( not ( = ?auto_17425 ?auto_17426 ) ) ( not ( = ?auto_17420 ?auto_17421 ) ) ( PERSON-AT ?auto_17421 ?auto_17423 ) ( not ( = ?auto_17420 ?auto_17427 ) ) ( not ( = ?auto_17421 ?auto_17427 ) ) ( PERSON-AT ?auto_17427 ?auto_17423 ) ( not ( = ?auto_17419 ?auto_17422 ) ) ( not ( = ?auto_17423 ?auto_17422 ) ) ( PERSON-AT ?auto_17420 ?auto_17422 ) ( AIRCRAFT-AT ?auto_17424 ?auto_17419 ) ( FUEL-LEVEL ?auto_17424 ?auto_17425 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_17421 ?auto_17419 )
      ( FLY-2PPL-VERIFY ?auto_17420 ?auto_17421 ?auto_17419 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_17429 - PERSON
      ?auto_17430 - PERSON
      ?auto_17428 - CITY
    )
    :vars
    (
      ?auto_17431 - FLEVEL
      ?auto_17433 - FLEVEL
      ?auto_17434 - CITY
      ?auto_17436 - PERSON
      ?auto_17432 - CITY
      ?auto_17435 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17431 ?auto_17433 ) ( not ( = ?auto_17428 ?auto_17434 ) ) ( not ( = ?auto_17433 ?auto_17431 ) ) ( not ( = ?auto_17436 ?auto_17430 ) ) ( PERSON-AT ?auto_17430 ?auto_17434 ) ( not ( = ?auto_17436 ?auto_17429 ) ) ( not ( = ?auto_17430 ?auto_17429 ) ) ( PERSON-AT ?auto_17429 ?auto_17434 ) ( not ( = ?auto_17428 ?auto_17432 ) ) ( not ( = ?auto_17434 ?auto_17432 ) ) ( PERSON-AT ?auto_17436 ?auto_17432 ) ( AIRCRAFT-AT ?auto_17435 ?auto_17428 ) ( FUEL-LEVEL ?auto_17435 ?auto_17433 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17436 ?auto_17430 ?auto_17428 )
      ( FLY-2PPL-VERIFY ?auto_17429 ?auto_17430 ?auto_17428 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_17438 - PERSON
      ?auto_17439 - PERSON
      ?auto_17437 - CITY
    )
    :vars
    (
      ?auto_17440 - FLEVEL
      ?auto_17442 - FLEVEL
      ?auto_17443 - CITY
      ?auto_17445 - PERSON
      ?auto_17441 - CITY
      ?auto_17444 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17440 ?auto_17442 ) ( not ( = ?auto_17437 ?auto_17443 ) ) ( not ( = ?auto_17442 ?auto_17440 ) ) ( not ( = ?auto_17439 ?auto_17438 ) ) ( PERSON-AT ?auto_17438 ?auto_17443 ) ( not ( = ?auto_17439 ?auto_17445 ) ) ( not ( = ?auto_17438 ?auto_17445 ) ) ( PERSON-AT ?auto_17445 ?auto_17443 ) ( not ( = ?auto_17437 ?auto_17441 ) ) ( not ( = ?auto_17443 ?auto_17441 ) ) ( PERSON-AT ?auto_17439 ?auto_17441 ) ( AIRCRAFT-AT ?auto_17444 ?auto_17437 ) ( FUEL-LEVEL ?auto_17444 ?auto_17442 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17439 ?auto_17438 ?auto_17437 )
      ( FLY-2PPL-VERIFY ?auto_17438 ?auto_17439 ?auto_17437 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_17447 - PERSON
      ?auto_17448 - PERSON
      ?auto_17446 - CITY
    )
    :vars
    (
      ?auto_17449 - FLEVEL
      ?auto_17451 - FLEVEL
      ?auto_17452 - CITY
      ?auto_17454 - PERSON
      ?auto_17450 - CITY
      ?auto_17453 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17449 ?auto_17451 ) ( not ( = ?auto_17446 ?auto_17452 ) ) ( not ( = ?auto_17451 ?auto_17449 ) ) ( not ( = ?auto_17454 ?auto_17447 ) ) ( PERSON-AT ?auto_17447 ?auto_17452 ) ( not ( = ?auto_17454 ?auto_17448 ) ) ( not ( = ?auto_17447 ?auto_17448 ) ) ( PERSON-AT ?auto_17448 ?auto_17452 ) ( not ( = ?auto_17446 ?auto_17450 ) ) ( not ( = ?auto_17452 ?auto_17450 ) ) ( PERSON-AT ?auto_17454 ?auto_17450 ) ( AIRCRAFT-AT ?auto_17453 ?auto_17446 ) ( FUEL-LEVEL ?auto_17453 ?auto_17451 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17454 ?auto_17447 ?auto_17446 )
      ( FLY-2PPL-VERIFY ?auto_17447 ?auto_17448 ?auto_17446 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17476 - PERSON
      ?auto_17477 - PERSON
      ?auto_17478 - PERSON
      ?auto_17475 - CITY
    )
    :vars
    (
      ?auto_17479 - FLEVEL
      ?auto_17481 - FLEVEL
      ?auto_17482 - CITY
      ?auto_17480 - CITY
      ?auto_17483 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17479 ?auto_17481 ) ( not ( = ?auto_17475 ?auto_17482 ) ) ( not ( = ?auto_17481 ?auto_17479 ) ) ( not ( = ?auto_17476 ?auto_17478 ) ) ( PERSON-AT ?auto_17478 ?auto_17482 ) ( not ( = ?auto_17476 ?auto_17477 ) ) ( not ( = ?auto_17478 ?auto_17477 ) ) ( PERSON-AT ?auto_17477 ?auto_17482 ) ( not ( = ?auto_17475 ?auto_17480 ) ) ( not ( = ?auto_17482 ?auto_17480 ) ) ( PERSON-AT ?auto_17476 ?auto_17480 ) ( AIRCRAFT-AT ?auto_17483 ?auto_17475 ) ( FUEL-LEVEL ?auto_17483 ?auto_17481 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17476 ?auto_17478 ?auto_17475 )
      ( FLY-3PPL-VERIFY ?auto_17476 ?auto_17477 ?auto_17478 ?auto_17475 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17495 - PERSON
      ?auto_17496 - PERSON
      ?auto_17497 - PERSON
      ?auto_17494 - CITY
    )
    :vars
    (
      ?auto_17498 - FLEVEL
      ?auto_17500 - FLEVEL
      ?auto_17501 - CITY
      ?auto_17499 - CITY
      ?auto_17502 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17498 ?auto_17500 ) ( not ( = ?auto_17494 ?auto_17501 ) ) ( not ( = ?auto_17500 ?auto_17498 ) ) ( not ( = ?auto_17495 ?auto_17496 ) ) ( PERSON-AT ?auto_17496 ?auto_17501 ) ( not ( = ?auto_17495 ?auto_17497 ) ) ( not ( = ?auto_17496 ?auto_17497 ) ) ( PERSON-AT ?auto_17497 ?auto_17501 ) ( not ( = ?auto_17494 ?auto_17499 ) ) ( not ( = ?auto_17501 ?auto_17499 ) ) ( PERSON-AT ?auto_17495 ?auto_17499 ) ( AIRCRAFT-AT ?auto_17502 ?auto_17494 ) ( FUEL-LEVEL ?auto_17502 ?auto_17500 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17495 ?auto_17496 ?auto_17494 )
      ( FLY-3PPL-VERIFY ?auto_17495 ?auto_17496 ?auto_17497 ?auto_17494 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17514 - PERSON
      ?auto_17515 - PERSON
      ?auto_17516 - PERSON
      ?auto_17513 - CITY
    )
    :vars
    (
      ?auto_17517 - FLEVEL
      ?auto_17519 - FLEVEL
      ?auto_17520 - CITY
      ?auto_17518 - CITY
      ?auto_17521 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17517 ?auto_17519 ) ( not ( = ?auto_17513 ?auto_17520 ) ) ( not ( = ?auto_17519 ?auto_17517 ) ) ( not ( = ?auto_17515 ?auto_17516 ) ) ( PERSON-AT ?auto_17516 ?auto_17520 ) ( not ( = ?auto_17515 ?auto_17514 ) ) ( not ( = ?auto_17516 ?auto_17514 ) ) ( PERSON-AT ?auto_17514 ?auto_17520 ) ( not ( = ?auto_17513 ?auto_17518 ) ) ( not ( = ?auto_17520 ?auto_17518 ) ) ( PERSON-AT ?auto_17515 ?auto_17518 ) ( AIRCRAFT-AT ?auto_17521 ?auto_17513 ) ( FUEL-LEVEL ?auto_17521 ?auto_17519 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17515 ?auto_17516 ?auto_17513 )
      ( FLY-3PPL-VERIFY ?auto_17514 ?auto_17515 ?auto_17516 ?auto_17513 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17533 - PERSON
      ?auto_17534 - PERSON
      ?auto_17535 - PERSON
      ?auto_17532 - CITY
    )
    :vars
    (
      ?auto_17536 - FLEVEL
      ?auto_17538 - FLEVEL
      ?auto_17539 - CITY
      ?auto_17537 - CITY
      ?auto_17540 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17536 ?auto_17538 ) ( not ( = ?auto_17532 ?auto_17539 ) ) ( not ( = ?auto_17538 ?auto_17536 ) ) ( not ( = ?auto_17535 ?auto_17534 ) ) ( PERSON-AT ?auto_17534 ?auto_17539 ) ( not ( = ?auto_17535 ?auto_17533 ) ) ( not ( = ?auto_17534 ?auto_17533 ) ) ( PERSON-AT ?auto_17533 ?auto_17539 ) ( not ( = ?auto_17532 ?auto_17537 ) ) ( not ( = ?auto_17539 ?auto_17537 ) ) ( PERSON-AT ?auto_17535 ?auto_17537 ) ( AIRCRAFT-AT ?auto_17540 ?auto_17532 ) ( FUEL-LEVEL ?auto_17540 ?auto_17538 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17535 ?auto_17534 ?auto_17532 )
      ( FLY-3PPL-VERIFY ?auto_17533 ?auto_17534 ?auto_17535 ?auto_17532 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17572 - PERSON
      ?auto_17573 - PERSON
      ?auto_17574 - PERSON
      ?auto_17571 - CITY
    )
    :vars
    (
      ?auto_17575 - FLEVEL
      ?auto_17577 - FLEVEL
      ?auto_17578 - CITY
      ?auto_17576 - CITY
      ?auto_17579 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17575 ?auto_17577 ) ( not ( = ?auto_17571 ?auto_17578 ) ) ( not ( = ?auto_17577 ?auto_17575 ) ) ( not ( = ?auto_17573 ?auto_17572 ) ) ( PERSON-AT ?auto_17572 ?auto_17578 ) ( not ( = ?auto_17573 ?auto_17574 ) ) ( not ( = ?auto_17572 ?auto_17574 ) ) ( PERSON-AT ?auto_17574 ?auto_17578 ) ( not ( = ?auto_17571 ?auto_17576 ) ) ( not ( = ?auto_17578 ?auto_17576 ) ) ( PERSON-AT ?auto_17573 ?auto_17576 ) ( AIRCRAFT-AT ?auto_17579 ?auto_17571 ) ( FUEL-LEVEL ?auto_17579 ?auto_17577 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17573 ?auto_17572 ?auto_17571 )
      ( FLY-3PPL-VERIFY ?auto_17572 ?auto_17573 ?auto_17574 ?auto_17571 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17591 - PERSON
      ?auto_17592 - PERSON
      ?auto_17593 - PERSON
      ?auto_17590 - CITY
    )
    :vars
    (
      ?auto_17594 - FLEVEL
      ?auto_17596 - FLEVEL
      ?auto_17597 - CITY
      ?auto_17595 - CITY
      ?auto_17598 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17594 ?auto_17596 ) ( not ( = ?auto_17590 ?auto_17597 ) ) ( not ( = ?auto_17596 ?auto_17594 ) ) ( not ( = ?auto_17593 ?auto_17591 ) ) ( PERSON-AT ?auto_17591 ?auto_17597 ) ( not ( = ?auto_17593 ?auto_17592 ) ) ( not ( = ?auto_17591 ?auto_17592 ) ) ( PERSON-AT ?auto_17592 ?auto_17597 ) ( not ( = ?auto_17590 ?auto_17595 ) ) ( not ( = ?auto_17597 ?auto_17595 ) ) ( PERSON-AT ?auto_17593 ?auto_17595 ) ( AIRCRAFT-AT ?auto_17598 ?auto_17590 ) ( FUEL-LEVEL ?auto_17598 ?auto_17596 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17593 ?auto_17591 ?auto_17590 )
      ( FLY-3PPL-VERIFY ?auto_17591 ?auto_17592 ?auto_17593 ?auto_17590 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_17651 - PERSON
      ?auto_17650 - CITY
    )
    :vars
    (
      ?auto_17652 - FLEVEL
      ?auto_17654 - FLEVEL
      ?auto_17655 - CITY
      ?auto_17658 - PERSON
      ?auto_17657 - PERSON
      ?auto_17653 - CITY
      ?auto_17656 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17652 ?auto_17654 ) ( not ( = ?auto_17650 ?auto_17655 ) ) ( not ( = ?auto_17654 ?auto_17652 ) ) ( not ( = ?auto_17658 ?auto_17651 ) ) ( PERSON-AT ?auto_17651 ?auto_17655 ) ( not ( = ?auto_17658 ?auto_17657 ) ) ( not ( = ?auto_17651 ?auto_17657 ) ) ( PERSON-AT ?auto_17657 ?auto_17655 ) ( not ( = ?auto_17650 ?auto_17653 ) ) ( not ( = ?auto_17655 ?auto_17653 ) ) ( PERSON-AT ?auto_17658 ?auto_17653 ) ( AIRCRAFT-AT ?auto_17656 ?auto_17650 ) ( FUEL-LEVEL ?auto_17656 ?auto_17652 ) )
    :subtasks
    ( ( !REFUEL ?auto_17656 ?auto_17650 ?auto_17652 ?auto_17654 )
      ( FLY-2PPL ?auto_17658 ?auto_17651 ?auto_17650 )
      ( FLY-1PPL-VERIFY ?auto_17651 ?auto_17650 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_17660 - PERSON
      ?auto_17661 - PERSON
      ?auto_17659 - CITY
    )
    :vars
    (
      ?auto_17663 - FLEVEL
      ?auto_17664 - FLEVEL
      ?auto_17666 - CITY
      ?auto_17662 - PERSON
      ?auto_17667 - CITY
      ?auto_17665 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17663 ?auto_17664 ) ( not ( = ?auto_17659 ?auto_17666 ) ) ( not ( = ?auto_17664 ?auto_17663 ) ) ( not ( = ?auto_17660 ?auto_17661 ) ) ( PERSON-AT ?auto_17661 ?auto_17666 ) ( not ( = ?auto_17660 ?auto_17662 ) ) ( not ( = ?auto_17661 ?auto_17662 ) ) ( PERSON-AT ?auto_17662 ?auto_17666 ) ( not ( = ?auto_17659 ?auto_17667 ) ) ( not ( = ?auto_17666 ?auto_17667 ) ) ( PERSON-AT ?auto_17660 ?auto_17667 ) ( AIRCRAFT-AT ?auto_17665 ?auto_17659 ) ( FUEL-LEVEL ?auto_17665 ?auto_17663 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_17661 ?auto_17659 )
      ( FLY-2PPL-VERIFY ?auto_17660 ?auto_17661 ?auto_17659 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_17669 - PERSON
      ?auto_17670 - PERSON
      ?auto_17668 - CITY
    )
    :vars
    (
      ?auto_17671 - FLEVEL
      ?auto_17673 - FLEVEL
      ?auto_17674 - CITY
      ?auto_17676 - PERSON
      ?auto_17672 - CITY
      ?auto_17675 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17671 ?auto_17673 ) ( not ( = ?auto_17668 ?auto_17674 ) ) ( not ( = ?auto_17673 ?auto_17671 ) ) ( not ( = ?auto_17676 ?auto_17670 ) ) ( PERSON-AT ?auto_17670 ?auto_17674 ) ( not ( = ?auto_17676 ?auto_17669 ) ) ( not ( = ?auto_17670 ?auto_17669 ) ) ( PERSON-AT ?auto_17669 ?auto_17674 ) ( not ( = ?auto_17668 ?auto_17672 ) ) ( not ( = ?auto_17674 ?auto_17672 ) ) ( PERSON-AT ?auto_17676 ?auto_17672 ) ( AIRCRAFT-AT ?auto_17675 ?auto_17668 ) ( FUEL-LEVEL ?auto_17675 ?auto_17671 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17676 ?auto_17670 ?auto_17668 )
      ( FLY-2PPL-VERIFY ?auto_17669 ?auto_17670 ?auto_17668 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_17678 - PERSON
      ?auto_17679 - PERSON
      ?auto_17677 - CITY
    )
    :vars
    (
      ?auto_17680 - FLEVEL
      ?auto_17682 - FLEVEL
      ?auto_17683 - CITY
      ?auto_17684 - PERSON
      ?auto_17681 - CITY
      ?auto_17685 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17680 ?auto_17682 ) ( not ( = ?auto_17677 ?auto_17683 ) ) ( not ( = ?auto_17682 ?auto_17680 ) ) ( not ( = ?auto_17679 ?auto_17678 ) ) ( PERSON-AT ?auto_17678 ?auto_17683 ) ( not ( = ?auto_17679 ?auto_17684 ) ) ( not ( = ?auto_17678 ?auto_17684 ) ) ( PERSON-AT ?auto_17684 ?auto_17683 ) ( not ( = ?auto_17677 ?auto_17681 ) ) ( not ( = ?auto_17683 ?auto_17681 ) ) ( PERSON-AT ?auto_17679 ?auto_17681 ) ( AIRCRAFT-AT ?auto_17685 ?auto_17677 ) ( FUEL-LEVEL ?auto_17685 ?auto_17680 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17679 ?auto_17678 ?auto_17677 )
      ( FLY-2PPL-VERIFY ?auto_17678 ?auto_17679 ?auto_17677 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_17687 - PERSON
      ?auto_17688 - PERSON
      ?auto_17686 - CITY
    )
    :vars
    (
      ?auto_17689 - FLEVEL
      ?auto_17691 - FLEVEL
      ?auto_17692 - CITY
      ?auto_17694 - PERSON
      ?auto_17690 - CITY
      ?auto_17693 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17689 ?auto_17691 ) ( not ( = ?auto_17686 ?auto_17692 ) ) ( not ( = ?auto_17691 ?auto_17689 ) ) ( not ( = ?auto_17694 ?auto_17687 ) ) ( PERSON-AT ?auto_17687 ?auto_17692 ) ( not ( = ?auto_17694 ?auto_17688 ) ) ( not ( = ?auto_17687 ?auto_17688 ) ) ( PERSON-AT ?auto_17688 ?auto_17692 ) ( not ( = ?auto_17686 ?auto_17690 ) ) ( not ( = ?auto_17692 ?auto_17690 ) ) ( PERSON-AT ?auto_17694 ?auto_17690 ) ( AIRCRAFT-AT ?auto_17693 ?auto_17686 ) ( FUEL-LEVEL ?auto_17693 ?auto_17689 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17694 ?auto_17687 ?auto_17686 )
      ( FLY-2PPL-VERIFY ?auto_17687 ?auto_17688 ?auto_17686 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17716 - PERSON
      ?auto_17717 - PERSON
      ?auto_17718 - PERSON
      ?auto_17715 - CITY
    )
    :vars
    (
      ?auto_17719 - FLEVEL
      ?auto_17721 - FLEVEL
      ?auto_17722 - CITY
      ?auto_17720 - CITY
      ?auto_17723 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17719 ?auto_17721 ) ( not ( = ?auto_17715 ?auto_17722 ) ) ( not ( = ?auto_17721 ?auto_17719 ) ) ( not ( = ?auto_17716 ?auto_17718 ) ) ( PERSON-AT ?auto_17718 ?auto_17722 ) ( not ( = ?auto_17716 ?auto_17717 ) ) ( not ( = ?auto_17718 ?auto_17717 ) ) ( PERSON-AT ?auto_17717 ?auto_17722 ) ( not ( = ?auto_17715 ?auto_17720 ) ) ( not ( = ?auto_17722 ?auto_17720 ) ) ( PERSON-AT ?auto_17716 ?auto_17720 ) ( AIRCRAFT-AT ?auto_17723 ?auto_17715 ) ( FUEL-LEVEL ?auto_17723 ?auto_17719 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17716 ?auto_17718 ?auto_17715 )
      ( FLY-3PPL-VERIFY ?auto_17716 ?auto_17717 ?auto_17718 ?auto_17715 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17735 - PERSON
      ?auto_17736 - PERSON
      ?auto_17737 - PERSON
      ?auto_17734 - CITY
    )
    :vars
    (
      ?auto_17738 - FLEVEL
      ?auto_17740 - FLEVEL
      ?auto_17741 - CITY
      ?auto_17739 - CITY
      ?auto_17742 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17738 ?auto_17740 ) ( not ( = ?auto_17734 ?auto_17741 ) ) ( not ( = ?auto_17740 ?auto_17738 ) ) ( not ( = ?auto_17735 ?auto_17736 ) ) ( PERSON-AT ?auto_17736 ?auto_17741 ) ( not ( = ?auto_17735 ?auto_17737 ) ) ( not ( = ?auto_17736 ?auto_17737 ) ) ( PERSON-AT ?auto_17737 ?auto_17741 ) ( not ( = ?auto_17734 ?auto_17739 ) ) ( not ( = ?auto_17741 ?auto_17739 ) ) ( PERSON-AT ?auto_17735 ?auto_17739 ) ( AIRCRAFT-AT ?auto_17742 ?auto_17734 ) ( FUEL-LEVEL ?auto_17742 ?auto_17738 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17735 ?auto_17736 ?auto_17734 )
      ( FLY-3PPL-VERIFY ?auto_17735 ?auto_17736 ?auto_17737 ?auto_17734 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17754 - PERSON
      ?auto_17755 - PERSON
      ?auto_17756 - PERSON
      ?auto_17753 - CITY
    )
    :vars
    (
      ?auto_17757 - FLEVEL
      ?auto_17759 - FLEVEL
      ?auto_17760 - CITY
      ?auto_17758 - CITY
      ?auto_17761 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17757 ?auto_17759 ) ( not ( = ?auto_17753 ?auto_17760 ) ) ( not ( = ?auto_17759 ?auto_17757 ) ) ( not ( = ?auto_17755 ?auto_17756 ) ) ( PERSON-AT ?auto_17756 ?auto_17760 ) ( not ( = ?auto_17755 ?auto_17754 ) ) ( not ( = ?auto_17756 ?auto_17754 ) ) ( PERSON-AT ?auto_17754 ?auto_17760 ) ( not ( = ?auto_17753 ?auto_17758 ) ) ( not ( = ?auto_17760 ?auto_17758 ) ) ( PERSON-AT ?auto_17755 ?auto_17758 ) ( AIRCRAFT-AT ?auto_17761 ?auto_17753 ) ( FUEL-LEVEL ?auto_17761 ?auto_17757 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17755 ?auto_17756 ?auto_17753 )
      ( FLY-3PPL-VERIFY ?auto_17754 ?auto_17755 ?auto_17756 ?auto_17753 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17773 - PERSON
      ?auto_17774 - PERSON
      ?auto_17775 - PERSON
      ?auto_17772 - CITY
    )
    :vars
    (
      ?auto_17776 - FLEVEL
      ?auto_17778 - FLEVEL
      ?auto_17779 - CITY
      ?auto_17777 - CITY
      ?auto_17780 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17776 ?auto_17778 ) ( not ( = ?auto_17772 ?auto_17779 ) ) ( not ( = ?auto_17778 ?auto_17776 ) ) ( not ( = ?auto_17775 ?auto_17774 ) ) ( PERSON-AT ?auto_17774 ?auto_17779 ) ( not ( = ?auto_17775 ?auto_17773 ) ) ( not ( = ?auto_17774 ?auto_17773 ) ) ( PERSON-AT ?auto_17773 ?auto_17779 ) ( not ( = ?auto_17772 ?auto_17777 ) ) ( not ( = ?auto_17779 ?auto_17777 ) ) ( PERSON-AT ?auto_17775 ?auto_17777 ) ( AIRCRAFT-AT ?auto_17780 ?auto_17772 ) ( FUEL-LEVEL ?auto_17780 ?auto_17776 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17775 ?auto_17774 ?auto_17772 )
      ( FLY-3PPL-VERIFY ?auto_17773 ?auto_17774 ?auto_17775 ?auto_17772 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17812 - PERSON
      ?auto_17813 - PERSON
      ?auto_17814 - PERSON
      ?auto_17811 - CITY
    )
    :vars
    (
      ?auto_17815 - FLEVEL
      ?auto_17817 - FLEVEL
      ?auto_17818 - CITY
      ?auto_17816 - CITY
      ?auto_17819 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17815 ?auto_17817 ) ( not ( = ?auto_17811 ?auto_17818 ) ) ( not ( = ?auto_17817 ?auto_17815 ) ) ( not ( = ?auto_17813 ?auto_17812 ) ) ( PERSON-AT ?auto_17812 ?auto_17818 ) ( not ( = ?auto_17813 ?auto_17814 ) ) ( not ( = ?auto_17812 ?auto_17814 ) ) ( PERSON-AT ?auto_17814 ?auto_17818 ) ( not ( = ?auto_17811 ?auto_17816 ) ) ( not ( = ?auto_17818 ?auto_17816 ) ) ( PERSON-AT ?auto_17813 ?auto_17816 ) ( AIRCRAFT-AT ?auto_17819 ?auto_17811 ) ( FUEL-LEVEL ?auto_17819 ?auto_17815 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17813 ?auto_17812 ?auto_17811 )
      ( FLY-3PPL-VERIFY ?auto_17812 ?auto_17813 ?auto_17814 ?auto_17811 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_17831 - PERSON
      ?auto_17832 - PERSON
      ?auto_17833 - PERSON
      ?auto_17830 - CITY
    )
    :vars
    (
      ?auto_17834 - FLEVEL
      ?auto_17836 - FLEVEL
      ?auto_17837 - CITY
      ?auto_17835 - CITY
      ?auto_17838 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_17834 ?auto_17836 ) ( not ( = ?auto_17830 ?auto_17837 ) ) ( not ( = ?auto_17836 ?auto_17834 ) ) ( not ( = ?auto_17833 ?auto_17831 ) ) ( PERSON-AT ?auto_17831 ?auto_17837 ) ( not ( = ?auto_17833 ?auto_17832 ) ) ( not ( = ?auto_17831 ?auto_17832 ) ) ( PERSON-AT ?auto_17832 ?auto_17837 ) ( not ( = ?auto_17830 ?auto_17835 ) ) ( not ( = ?auto_17837 ?auto_17835 ) ) ( PERSON-AT ?auto_17833 ?auto_17835 ) ( AIRCRAFT-AT ?auto_17838 ?auto_17830 ) ( FUEL-LEVEL ?auto_17838 ?auto_17834 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_17833 ?auto_17831 ?auto_17830 )
      ( FLY-3PPL-VERIFY ?auto_17831 ?auto_17832 ?auto_17833 ?auto_17830 ) )
  )

)

