( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48865 - SURFACE
      ?auto_48866 - SURFACE
    )
    :vars
    (
      ?auto_48867 - HOIST
      ?auto_48868 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48867 ?auto_48868 ) ( SURFACE-AT ?auto_48866 ?auto_48868 ) ( CLEAR ?auto_48866 ) ( LIFTING ?auto_48867 ?auto_48865 ) ( IS-CRATE ?auto_48865 ) ( not ( = ?auto_48865 ?auto_48866 ) ) )
    :subtasks
    ( ( !DROP ?auto_48867 ?auto_48865 ?auto_48866 ?auto_48868 )
      ( MAKE-ON-VERIFY ?auto_48865 ?auto_48866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48869 - SURFACE
      ?auto_48870 - SURFACE
    )
    :vars
    (
      ?auto_48871 - HOIST
      ?auto_48872 - PLACE
      ?auto_48873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48871 ?auto_48872 ) ( SURFACE-AT ?auto_48870 ?auto_48872 ) ( CLEAR ?auto_48870 ) ( IS-CRATE ?auto_48869 ) ( not ( = ?auto_48869 ?auto_48870 ) ) ( TRUCK-AT ?auto_48873 ?auto_48872 ) ( AVAILABLE ?auto_48871 ) ( IN ?auto_48869 ?auto_48873 ) )
    :subtasks
    ( ( !UNLOAD ?auto_48871 ?auto_48869 ?auto_48873 ?auto_48872 )
      ( MAKE-ON ?auto_48869 ?auto_48870 )
      ( MAKE-ON-VERIFY ?auto_48869 ?auto_48870 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48874 - SURFACE
      ?auto_48875 - SURFACE
    )
    :vars
    (
      ?auto_48878 - HOIST
      ?auto_48876 - PLACE
      ?auto_48877 - TRUCK
      ?auto_48879 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48878 ?auto_48876 ) ( SURFACE-AT ?auto_48875 ?auto_48876 ) ( CLEAR ?auto_48875 ) ( IS-CRATE ?auto_48874 ) ( not ( = ?auto_48874 ?auto_48875 ) ) ( AVAILABLE ?auto_48878 ) ( IN ?auto_48874 ?auto_48877 ) ( TRUCK-AT ?auto_48877 ?auto_48879 ) ( not ( = ?auto_48879 ?auto_48876 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_48877 ?auto_48879 ?auto_48876 )
      ( MAKE-ON ?auto_48874 ?auto_48875 )
      ( MAKE-ON-VERIFY ?auto_48874 ?auto_48875 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48880 - SURFACE
      ?auto_48881 - SURFACE
    )
    :vars
    (
      ?auto_48885 - HOIST
      ?auto_48883 - PLACE
      ?auto_48884 - TRUCK
      ?auto_48882 - PLACE
      ?auto_48886 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_48885 ?auto_48883 ) ( SURFACE-AT ?auto_48881 ?auto_48883 ) ( CLEAR ?auto_48881 ) ( IS-CRATE ?auto_48880 ) ( not ( = ?auto_48880 ?auto_48881 ) ) ( AVAILABLE ?auto_48885 ) ( TRUCK-AT ?auto_48884 ?auto_48882 ) ( not ( = ?auto_48882 ?auto_48883 ) ) ( HOIST-AT ?auto_48886 ?auto_48882 ) ( LIFTING ?auto_48886 ?auto_48880 ) ( not ( = ?auto_48885 ?auto_48886 ) ) )
    :subtasks
    ( ( !LOAD ?auto_48886 ?auto_48880 ?auto_48884 ?auto_48882 )
      ( MAKE-ON ?auto_48880 ?auto_48881 )
      ( MAKE-ON-VERIFY ?auto_48880 ?auto_48881 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48887 - SURFACE
      ?auto_48888 - SURFACE
    )
    :vars
    (
      ?auto_48890 - HOIST
      ?auto_48891 - PLACE
      ?auto_48892 - TRUCK
      ?auto_48889 - PLACE
      ?auto_48893 - HOIST
      ?auto_48894 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48890 ?auto_48891 ) ( SURFACE-AT ?auto_48888 ?auto_48891 ) ( CLEAR ?auto_48888 ) ( IS-CRATE ?auto_48887 ) ( not ( = ?auto_48887 ?auto_48888 ) ) ( AVAILABLE ?auto_48890 ) ( TRUCK-AT ?auto_48892 ?auto_48889 ) ( not ( = ?auto_48889 ?auto_48891 ) ) ( HOIST-AT ?auto_48893 ?auto_48889 ) ( not ( = ?auto_48890 ?auto_48893 ) ) ( AVAILABLE ?auto_48893 ) ( SURFACE-AT ?auto_48887 ?auto_48889 ) ( ON ?auto_48887 ?auto_48894 ) ( CLEAR ?auto_48887 ) ( not ( = ?auto_48887 ?auto_48894 ) ) ( not ( = ?auto_48888 ?auto_48894 ) ) )
    :subtasks
    ( ( !LIFT ?auto_48893 ?auto_48887 ?auto_48894 ?auto_48889 )
      ( MAKE-ON ?auto_48887 ?auto_48888 )
      ( MAKE-ON-VERIFY ?auto_48887 ?auto_48888 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48895 - SURFACE
      ?auto_48896 - SURFACE
    )
    :vars
    (
      ?auto_48897 - HOIST
      ?auto_48899 - PLACE
      ?auto_48900 - PLACE
      ?auto_48898 - HOIST
      ?auto_48901 - SURFACE
      ?auto_48902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48897 ?auto_48899 ) ( SURFACE-AT ?auto_48896 ?auto_48899 ) ( CLEAR ?auto_48896 ) ( IS-CRATE ?auto_48895 ) ( not ( = ?auto_48895 ?auto_48896 ) ) ( AVAILABLE ?auto_48897 ) ( not ( = ?auto_48900 ?auto_48899 ) ) ( HOIST-AT ?auto_48898 ?auto_48900 ) ( not ( = ?auto_48897 ?auto_48898 ) ) ( AVAILABLE ?auto_48898 ) ( SURFACE-AT ?auto_48895 ?auto_48900 ) ( ON ?auto_48895 ?auto_48901 ) ( CLEAR ?auto_48895 ) ( not ( = ?auto_48895 ?auto_48901 ) ) ( not ( = ?auto_48896 ?auto_48901 ) ) ( TRUCK-AT ?auto_48902 ?auto_48899 ) )
    :subtasks
    ( ( !DRIVE ?auto_48902 ?auto_48899 ?auto_48900 )
      ( MAKE-ON ?auto_48895 ?auto_48896 )
      ( MAKE-ON-VERIFY ?auto_48895 ?auto_48896 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48943 - SURFACE
      ?auto_48944 - SURFACE
    )
    :vars
    (
      ?auto_48950 - HOIST
      ?auto_48948 - PLACE
      ?auto_48945 - PLACE
      ?auto_48946 - HOIST
      ?auto_48949 - SURFACE
      ?auto_48947 - TRUCK
      ?auto_48951 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48950 ?auto_48948 ) ( IS-CRATE ?auto_48943 ) ( not ( = ?auto_48943 ?auto_48944 ) ) ( not ( = ?auto_48945 ?auto_48948 ) ) ( HOIST-AT ?auto_48946 ?auto_48945 ) ( not ( = ?auto_48950 ?auto_48946 ) ) ( AVAILABLE ?auto_48946 ) ( SURFACE-AT ?auto_48943 ?auto_48945 ) ( ON ?auto_48943 ?auto_48949 ) ( CLEAR ?auto_48943 ) ( not ( = ?auto_48943 ?auto_48949 ) ) ( not ( = ?auto_48944 ?auto_48949 ) ) ( TRUCK-AT ?auto_48947 ?auto_48948 ) ( SURFACE-AT ?auto_48951 ?auto_48948 ) ( CLEAR ?auto_48951 ) ( LIFTING ?auto_48950 ?auto_48944 ) ( IS-CRATE ?auto_48944 ) ( not ( = ?auto_48943 ?auto_48951 ) ) ( not ( = ?auto_48944 ?auto_48951 ) ) ( not ( = ?auto_48949 ?auto_48951 ) ) )
    :subtasks
    ( ( !DROP ?auto_48950 ?auto_48944 ?auto_48951 ?auto_48948 )
      ( MAKE-ON ?auto_48943 ?auto_48944 )
      ( MAKE-ON-VERIFY ?auto_48943 ?auto_48944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48952 - SURFACE
      ?auto_48953 - SURFACE
    )
    :vars
    (
      ?auto_48955 - HOIST
      ?auto_48959 - PLACE
      ?auto_48956 - PLACE
      ?auto_48958 - HOIST
      ?auto_48957 - SURFACE
      ?auto_48954 - TRUCK
      ?auto_48960 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48955 ?auto_48959 ) ( IS-CRATE ?auto_48952 ) ( not ( = ?auto_48952 ?auto_48953 ) ) ( not ( = ?auto_48956 ?auto_48959 ) ) ( HOIST-AT ?auto_48958 ?auto_48956 ) ( not ( = ?auto_48955 ?auto_48958 ) ) ( AVAILABLE ?auto_48958 ) ( SURFACE-AT ?auto_48952 ?auto_48956 ) ( ON ?auto_48952 ?auto_48957 ) ( CLEAR ?auto_48952 ) ( not ( = ?auto_48952 ?auto_48957 ) ) ( not ( = ?auto_48953 ?auto_48957 ) ) ( TRUCK-AT ?auto_48954 ?auto_48959 ) ( SURFACE-AT ?auto_48960 ?auto_48959 ) ( CLEAR ?auto_48960 ) ( IS-CRATE ?auto_48953 ) ( not ( = ?auto_48952 ?auto_48960 ) ) ( not ( = ?auto_48953 ?auto_48960 ) ) ( not ( = ?auto_48957 ?auto_48960 ) ) ( AVAILABLE ?auto_48955 ) ( IN ?auto_48953 ?auto_48954 ) )
    :subtasks
    ( ( !UNLOAD ?auto_48955 ?auto_48953 ?auto_48954 ?auto_48959 )
      ( MAKE-ON ?auto_48952 ?auto_48953 )
      ( MAKE-ON-VERIFY ?auto_48952 ?auto_48953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48961 - SURFACE
      ?auto_48962 - SURFACE
    )
    :vars
    (
      ?auto_48969 - HOIST
      ?auto_48968 - PLACE
      ?auto_48963 - PLACE
      ?auto_48964 - HOIST
      ?auto_48967 - SURFACE
      ?auto_48965 - SURFACE
      ?auto_48966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48969 ?auto_48968 ) ( IS-CRATE ?auto_48961 ) ( not ( = ?auto_48961 ?auto_48962 ) ) ( not ( = ?auto_48963 ?auto_48968 ) ) ( HOIST-AT ?auto_48964 ?auto_48963 ) ( not ( = ?auto_48969 ?auto_48964 ) ) ( AVAILABLE ?auto_48964 ) ( SURFACE-AT ?auto_48961 ?auto_48963 ) ( ON ?auto_48961 ?auto_48967 ) ( CLEAR ?auto_48961 ) ( not ( = ?auto_48961 ?auto_48967 ) ) ( not ( = ?auto_48962 ?auto_48967 ) ) ( SURFACE-AT ?auto_48965 ?auto_48968 ) ( CLEAR ?auto_48965 ) ( IS-CRATE ?auto_48962 ) ( not ( = ?auto_48961 ?auto_48965 ) ) ( not ( = ?auto_48962 ?auto_48965 ) ) ( not ( = ?auto_48967 ?auto_48965 ) ) ( AVAILABLE ?auto_48969 ) ( IN ?auto_48962 ?auto_48966 ) ( TRUCK-AT ?auto_48966 ?auto_48963 ) )
    :subtasks
    ( ( !DRIVE ?auto_48966 ?auto_48963 ?auto_48968 )
      ( MAKE-ON ?auto_48961 ?auto_48962 )
      ( MAKE-ON-VERIFY ?auto_48961 ?auto_48962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48970 - SURFACE
      ?auto_48971 - SURFACE
    )
    :vars
    (
      ?auto_48977 - HOIST
      ?auto_48974 - PLACE
      ?auto_48972 - PLACE
      ?auto_48975 - HOIST
      ?auto_48973 - SURFACE
      ?auto_48976 - SURFACE
      ?auto_48978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48977 ?auto_48974 ) ( IS-CRATE ?auto_48970 ) ( not ( = ?auto_48970 ?auto_48971 ) ) ( not ( = ?auto_48972 ?auto_48974 ) ) ( HOIST-AT ?auto_48975 ?auto_48972 ) ( not ( = ?auto_48977 ?auto_48975 ) ) ( SURFACE-AT ?auto_48970 ?auto_48972 ) ( ON ?auto_48970 ?auto_48973 ) ( CLEAR ?auto_48970 ) ( not ( = ?auto_48970 ?auto_48973 ) ) ( not ( = ?auto_48971 ?auto_48973 ) ) ( SURFACE-AT ?auto_48976 ?auto_48974 ) ( CLEAR ?auto_48976 ) ( IS-CRATE ?auto_48971 ) ( not ( = ?auto_48970 ?auto_48976 ) ) ( not ( = ?auto_48971 ?auto_48976 ) ) ( not ( = ?auto_48973 ?auto_48976 ) ) ( AVAILABLE ?auto_48977 ) ( TRUCK-AT ?auto_48978 ?auto_48972 ) ( LIFTING ?auto_48975 ?auto_48971 ) )
    :subtasks
    ( ( !LOAD ?auto_48975 ?auto_48971 ?auto_48978 ?auto_48972 )
      ( MAKE-ON ?auto_48970 ?auto_48971 )
      ( MAKE-ON-VERIFY ?auto_48970 ?auto_48971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48979 - SURFACE
      ?auto_48980 - SURFACE
    )
    :vars
    (
      ?auto_48983 - HOIST
      ?auto_48984 - PLACE
      ?auto_48987 - PLACE
      ?auto_48982 - HOIST
      ?auto_48985 - SURFACE
      ?auto_48981 - SURFACE
      ?auto_48986 - TRUCK
      ?auto_48988 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_48983 ?auto_48984 ) ( IS-CRATE ?auto_48979 ) ( not ( = ?auto_48979 ?auto_48980 ) ) ( not ( = ?auto_48987 ?auto_48984 ) ) ( HOIST-AT ?auto_48982 ?auto_48987 ) ( not ( = ?auto_48983 ?auto_48982 ) ) ( SURFACE-AT ?auto_48979 ?auto_48987 ) ( ON ?auto_48979 ?auto_48985 ) ( CLEAR ?auto_48979 ) ( not ( = ?auto_48979 ?auto_48985 ) ) ( not ( = ?auto_48980 ?auto_48985 ) ) ( SURFACE-AT ?auto_48981 ?auto_48984 ) ( CLEAR ?auto_48981 ) ( IS-CRATE ?auto_48980 ) ( not ( = ?auto_48979 ?auto_48981 ) ) ( not ( = ?auto_48980 ?auto_48981 ) ) ( not ( = ?auto_48985 ?auto_48981 ) ) ( AVAILABLE ?auto_48983 ) ( TRUCK-AT ?auto_48986 ?auto_48987 ) ( AVAILABLE ?auto_48982 ) ( SURFACE-AT ?auto_48980 ?auto_48987 ) ( ON ?auto_48980 ?auto_48988 ) ( CLEAR ?auto_48980 ) ( not ( = ?auto_48979 ?auto_48988 ) ) ( not ( = ?auto_48980 ?auto_48988 ) ) ( not ( = ?auto_48985 ?auto_48988 ) ) ( not ( = ?auto_48981 ?auto_48988 ) ) )
    :subtasks
    ( ( !LIFT ?auto_48982 ?auto_48980 ?auto_48988 ?auto_48987 )
      ( MAKE-ON ?auto_48979 ?auto_48980 )
      ( MAKE-ON-VERIFY ?auto_48979 ?auto_48980 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_48989 - SURFACE
      ?auto_48990 - SURFACE
    )
    :vars
    (
      ?auto_48993 - HOIST
      ?auto_48994 - PLACE
      ?auto_48998 - PLACE
      ?auto_48997 - HOIST
      ?auto_48996 - SURFACE
      ?auto_48992 - SURFACE
      ?auto_48995 - SURFACE
      ?auto_48991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_48993 ?auto_48994 ) ( IS-CRATE ?auto_48989 ) ( not ( = ?auto_48989 ?auto_48990 ) ) ( not ( = ?auto_48998 ?auto_48994 ) ) ( HOIST-AT ?auto_48997 ?auto_48998 ) ( not ( = ?auto_48993 ?auto_48997 ) ) ( SURFACE-AT ?auto_48989 ?auto_48998 ) ( ON ?auto_48989 ?auto_48996 ) ( CLEAR ?auto_48989 ) ( not ( = ?auto_48989 ?auto_48996 ) ) ( not ( = ?auto_48990 ?auto_48996 ) ) ( SURFACE-AT ?auto_48992 ?auto_48994 ) ( CLEAR ?auto_48992 ) ( IS-CRATE ?auto_48990 ) ( not ( = ?auto_48989 ?auto_48992 ) ) ( not ( = ?auto_48990 ?auto_48992 ) ) ( not ( = ?auto_48996 ?auto_48992 ) ) ( AVAILABLE ?auto_48993 ) ( AVAILABLE ?auto_48997 ) ( SURFACE-AT ?auto_48990 ?auto_48998 ) ( ON ?auto_48990 ?auto_48995 ) ( CLEAR ?auto_48990 ) ( not ( = ?auto_48989 ?auto_48995 ) ) ( not ( = ?auto_48990 ?auto_48995 ) ) ( not ( = ?auto_48996 ?auto_48995 ) ) ( not ( = ?auto_48992 ?auto_48995 ) ) ( TRUCK-AT ?auto_48991 ?auto_48994 ) )
    :subtasks
    ( ( !DRIVE ?auto_48991 ?auto_48994 ?auto_48998 )
      ( MAKE-ON ?auto_48989 ?auto_48990 )
      ( MAKE-ON-VERIFY ?auto_48989 ?auto_48990 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49063 - SURFACE
      ?auto_49064 - SURFACE
    )
    :vars
    (
      ?auto_49070 - HOIST
      ?auto_49067 - PLACE
      ?auto_49069 - PLACE
      ?auto_49065 - HOIST
      ?auto_49068 - SURFACE
      ?auto_49066 - TRUCK
      ?auto_49071 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49070 ?auto_49067 ) ( SURFACE-AT ?auto_49064 ?auto_49067 ) ( CLEAR ?auto_49064 ) ( IS-CRATE ?auto_49063 ) ( not ( = ?auto_49063 ?auto_49064 ) ) ( AVAILABLE ?auto_49070 ) ( not ( = ?auto_49069 ?auto_49067 ) ) ( HOIST-AT ?auto_49065 ?auto_49069 ) ( not ( = ?auto_49070 ?auto_49065 ) ) ( AVAILABLE ?auto_49065 ) ( SURFACE-AT ?auto_49063 ?auto_49069 ) ( ON ?auto_49063 ?auto_49068 ) ( CLEAR ?auto_49063 ) ( not ( = ?auto_49063 ?auto_49068 ) ) ( not ( = ?auto_49064 ?auto_49068 ) ) ( TRUCK-AT ?auto_49066 ?auto_49071 ) ( not ( = ?auto_49071 ?auto_49067 ) ) ( not ( = ?auto_49069 ?auto_49071 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49066 ?auto_49071 ?auto_49067 )
      ( MAKE-ON ?auto_49063 ?auto_49064 )
      ( MAKE-ON-VERIFY ?auto_49063 ?auto_49064 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49078 - SURFACE
      ?auto_49079 - SURFACE
    )
    :vars
    (
      ?auto_49082 - HOIST
      ?auto_49084 - PLACE
      ?auto_49081 - PLACE
      ?auto_49080 - HOIST
      ?auto_49083 - SURFACE
      ?auto_49085 - TRUCK
      ?auto_49086 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49082 ?auto_49084 ) ( SURFACE-AT ?auto_49079 ?auto_49084 ) ( CLEAR ?auto_49079 ) ( IS-CRATE ?auto_49078 ) ( not ( = ?auto_49078 ?auto_49079 ) ) ( not ( = ?auto_49081 ?auto_49084 ) ) ( HOIST-AT ?auto_49080 ?auto_49081 ) ( not ( = ?auto_49082 ?auto_49080 ) ) ( AVAILABLE ?auto_49080 ) ( SURFACE-AT ?auto_49078 ?auto_49081 ) ( ON ?auto_49078 ?auto_49083 ) ( CLEAR ?auto_49078 ) ( not ( = ?auto_49078 ?auto_49083 ) ) ( not ( = ?auto_49079 ?auto_49083 ) ) ( TRUCK-AT ?auto_49085 ?auto_49084 ) ( LIFTING ?auto_49082 ?auto_49086 ) ( IS-CRATE ?auto_49086 ) ( not ( = ?auto_49078 ?auto_49086 ) ) ( not ( = ?auto_49079 ?auto_49086 ) ) ( not ( = ?auto_49083 ?auto_49086 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49082 ?auto_49086 ?auto_49085 ?auto_49084 )
      ( MAKE-ON ?auto_49078 ?auto_49079 )
      ( MAKE-ON-VERIFY ?auto_49078 ?auto_49079 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49170 - SURFACE
      ?auto_49171 - SURFACE
    )
    :vars
    (
      ?auto_49172 - HOIST
      ?auto_49175 - PLACE
      ?auto_49177 - TRUCK
      ?auto_49173 - PLACE
      ?auto_49174 - HOIST
      ?auto_49176 - SURFACE
      ?auto_49178 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49172 ?auto_49175 ) ( SURFACE-AT ?auto_49171 ?auto_49175 ) ( CLEAR ?auto_49171 ) ( IS-CRATE ?auto_49170 ) ( not ( = ?auto_49170 ?auto_49171 ) ) ( AVAILABLE ?auto_49172 ) ( TRUCK-AT ?auto_49177 ?auto_49173 ) ( not ( = ?auto_49173 ?auto_49175 ) ) ( HOIST-AT ?auto_49174 ?auto_49173 ) ( not ( = ?auto_49172 ?auto_49174 ) ) ( SURFACE-AT ?auto_49170 ?auto_49173 ) ( ON ?auto_49170 ?auto_49176 ) ( CLEAR ?auto_49170 ) ( not ( = ?auto_49170 ?auto_49176 ) ) ( not ( = ?auto_49171 ?auto_49176 ) ) ( LIFTING ?auto_49174 ?auto_49178 ) ( IS-CRATE ?auto_49178 ) ( not ( = ?auto_49170 ?auto_49178 ) ) ( not ( = ?auto_49171 ?auto_49178 ) ) ( not ( = ?auto_49176 ?auto_49178 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49174 ?auto_49178 ?auto_49177 ?auto_49173 )
      ( MAKE-ON ?auto_49170 ?auto_49171 )
      ( MAKE-ON-VERIFY ?auto_49170 ?auto_49171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49407 - SURFACE
      ?auto_49408 - SURFACE
    )
    :vars
    (
      ?auto_49416 - HOIST
      ?auto_49413 - PLACE
      ?auto_49412 - PLACE
      ?auto_49410 - HOIST
      ?auto_49409 - SURFACE
      ?auto_49411 - SURFACE
      ?auto_49415 - SURFACE
      ?auto_49414 - TRUCK
      ?auto_49417 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49416 ?auto_49413 ) ( IS-CRATE ?auto_49407 ) ( not ( = ?auto_49407 ?auto_49408 ) ) ( not ( = ?auto_49412 ?auto_49413 ) ) ( HOIST-AT ?auto_49410 ?auto_49412 ) ( not ( = ?auto_49416 ?auto_49410 ) ) ( SURFACE-AT ?auto_49407 ?auto_49412 ) ( ON ?auto_49407 ?auto_49409 ) ( CLEAR ?auto_49407 ) ( not ( = ?auto_49407 ?auto_49409 ) ) ( not ( = ?auto_49408 ?auto_49409 ) ) ( IS-CRATE ?auto_49408 ) ( not ( = ?auto_49407 ?auto_49411 ) ) ( not ( = ?auto_49408 ?auto_49411 ) ) ( not ( = ?auto_49409 ?auto_49411 ) ) ( AVAILABLE ?auto_49410 ) ( SURFACE-AT ?auto_49408 ?auto_49412 ) ( ON ?auto_49408 ?auto_49415 ) ( CLEAR ?auto_49408 ) ( not ( = ?auto_49407 ?auto_49415 ) ) ( not ( = ?auto_49408 ?auto_49415 ) ) ( not ( = ?auto_49409 ?auto_49415 ) ) ( not ( = ?auto_49411 ?auto_49415 ) ) ( TRUCK-AT ?auto_49414 ?auto_49413 ) ( SURFACE-AT ?auto_49417 ?auto_49413 ) ( CLEAR ?auto_49417 ) ( LIFTING ?auto_49416 ?auto_49411 ) ( IS-CRATE ?auto_49411 ) ( not ( = ?auto_49407 ?auto_49417 ) ) ( not ( = ?auto_49408 ?auto_49417 ) ) ( not ( = ?auto_49409 ?auto_49417 ) ) ( not ( = ?auto_49411 ?auto_49417 ) ) ( not ( = ?auto_49415 ?auto_49417 ) ) )
    :subtasks
    ( ( !DROP ?auto_49416 ?auto_49411 ?auto_49417 ?auto_49413 )
      ( MAKE-ON ?auto_49407 ?auto_49408 )
      ( MAKE-ON-VERIFY ?auto_49407 ?auto_49408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49575 - SURFACE
      ?auto_49576 - SURFACE
    )
    :vars
    (
      ?auto_49584 - HOIST
      ?auto_49577 - PLACE
      ?auto_49580 - PLACE
      ?auto_49579 - HOIST
      ?auto_49581 - SURFACE
      ?auto_49578 - SURFACE
      ?auto_49583 - TRUCK
      ?auto_49582 - SURFACE
      ?auto_49585 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49584 ?auto_49577 ) ( IS-CRATE ?auto_49575 ) ( not ( = ?auto_49575 ?auto_49576 ) ) ( not ( = ?auto_49580 ?auto_49577 ) ) ( HOIST-AT ?auto_49579 ?auto_49580 ) ( not ( = ?auto_49584 ?auto_49579 ) ) ( SURFACE-AT ?auto_49575 ?auto_49580 ) ( ON ?auto_49575 ?auto_49581 ) ( CLEAR ?auto_49575 ) ( not ( = ?auto_49575 ?auto_49581 ) ) ( not ( = ?auto_49576 ?auto_49581 ) ) ( SURFACE-AT ?auto_49578 ?auto_49577 ) ( CLEAR ?auto_49578 ) ( IS-CRATE ?auto_49576 ) ( not ( = ?auto_49575 ?auto_49578 ) ) ( not ( = ?auto_49576 ?auto_49578 ) ) ( not ( = ?auto_49581 ?auto_49578 ) ) ( AVAILABLE ?auto_49584 ) ( TRUCK-AT ?auto_49583 ?auto_49580 ) ( SURFACE-AT ?auto_49576 ?auto_49580 ) ( ON ?auto_49576 ?auto_49582 ) ( CLEAR ?auto_49576 ) ( not ( = ?auto_49575 ?auto_49582 ) ) ( not ( = ?auto_49576 ?auto_49582 ) ) ( not ( = ?auto_49581 ?auto_49582 ) ) ( not ( = ?auto_49578 ?auto_49582 ) ) ( LIFTING ?auto_49579 ?auto_49585 ) ( IS-CRATE ?auto_49585 ) ( not ( = ?auto_49575 ?auto_49585 ) ) ( not ( = ?auto_49576 ?auto_49585 ) ) ( not ( = ?auto_49581 ?auto_49585 ) ) ( not ( = ?auto_49578 ?auto_49585 ) ) ( not ( = ?auto_49582 ?auto_49585 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49579 ?auto_49585 ?auto_49583 ?auto_49580 )
      ( MAKE-ON ?auto_49575 ?auto_49576 )
      ( MAKE-ON-VERIFY ?auto_49575 ?auto_49576 ) )
  )

)

