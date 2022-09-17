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
      ?auto_32906 - SURFACE
      ?auto_32907 - SURFACE
    )
    :vars
    (
      ?auto_32908 - HOIST
      ?auto_32909 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32908 ?auto_32909 ) ( SURFACE-AT ?auto_32907 ?auto_32909 ) ( CLEAR ?auto_32907 ) ( LIFTING ?auto_32908 ?auto_32906 ) ( IS-CRATE ?auto_32906 ) ( not ( = ?auto_32906 ?auto_32907 ) ) )
    :subtasks
    ( ( !DROP ?auto_32908 ?auto_32906 ?auto_32907 ?auto_32909 )
      ( MAKE-ON-VERIFY ?auto_32906 ?auto_32907 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32910 - SURFACE
      ?auto_32911 - SURFACE
    )
    :vars
    (
      ?auto_32912 - HOIST
      ?auto_32913 - PLACE
      ?auto_32914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32912 ?auto_32913 ) ( SURFACE-AT ?auto_32911 ?auto_32913 ) ( CLEAR ?auto_32911 ) ( IS-CRATE ?auto_32910 ) ( not ( = ?auto_32910 ?auto_32911 ) ) ( TRUCK-AT ?auto_32914 ?auto_32913 ) ( AVAILABLE ?auto_32912 ) ( IN ?auto_32910 ?auto_32914 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32912 ?auto_32910 ?auto_32914 ?auto_32913 )
      ( MAKE-ON ?auto_32910 ?auto_32911 )
      ( MAKE-ON-VERIFY ?auto_32910 ?auto_32911 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32915 - SURFACE
      ?auto_32916 - SURFACE
    )
    :vars
    (
      ?auto_32918 - HOIST
      ?auto_32919 - PLACE
      ?auto_32917 - TRUCK
      ?auto_32920 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32918 ?auto_32919 ) ( SURFACE-AT ?auto_32916 ?auto_32919 ) ( CLEAR ?auto_32916 ) ( IS-CRATE ?auto_32915 ) ( not ( = ?auto_32915 ?auto_32916 ) ) ( AVAILABLE ?auto_32918 ) ( IN ?auto_32915 ?auto_32917 ) ( TRUCK-AT ?auto_32917 ?auto_32920 ) ( not ( = ?auto_32920 ?auto_32919 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32917 ?auto_32920 ?auto_32919 )
      ( MAKE-ON ?auto_32915 ?auto_32916 )
      ( MAKE-ON-VERIFY ?auto_32915 ?auto_32916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32921 - SURFACE
      ?auto_32922 - SURFACE
    )
    :vars
    (
      ?auto_32925 - HOIST
      ?auto_32924 - PLACE
      ?auto_32923 - TRUCK
      ?auto_32926 - PLACE
      ?auto_32927 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32925 ?auto_32924 ) ( SURFACE-AT ?auto_32922 ?auto_32924 ) ( CLEAR ?auto_32922 ) ( IS-CRATE ?auto_32921 ) ( not ( = ?auto_32921 ?auto_32922 ) ) ( AVAILABLE ?auto_32925 ) ( TRUCK-AT ?auto_32923 ?auto_32926 ) ( not ( = ?auto_32926 ?auto_32924 ) ) ( HOIST-AT ?auto_32927 ?auto_32926 ) ( LIFTING ?auto_32927 ?auto_32921 ) ( not ( = ?auto_32925 ?auto_32927 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32927 ?auto_32921 ?auto_32923 ?auto_32926 )
      ( MAKE-ON ?auto_32921 ?auto_32922 )
      ( MAKE-ON-VERIFY ?auto_32921 ?auto_32922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32928 - SURFACE
      ?auto_32929 - SURFACE
    )
    :vars
    (
      ?auto_32933 - HOIST
      ?auto_32931 - PLACE
      ?auto_32932 - TRUCK
      ?auto_32930 - PLACE
      ?auto_32934 - HOIST
      ?auto_32935 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32933 ?auto_32931 ) ( SURFACE-AT ?auto_32929 ?auto_32931 ) ( CLEAR ?auto_32929 ) ( IS-CRATE ?auto_32928 ) ( not ( = ?auto_32928 ?auto_32929 ) ) ( AVAILABLE ?auto_32933 ) ( TRUCK-AT ?auto_32932 ?auto_32930 ) ( not ( = ?auto_32930 ?auto_32931 ) ) ( HOIST-AT ?auto_32934 ?auto_32930 ) ( not ( = ?auto_32933 ?auto_32934 ) ) ( AVAILABLE ?auto_32934 ) ( SURFACE-AT ?auto_32928 ?auto_32930 ) ( ON ?auto_32928 ?auto_32935 ) ( CLEAR ?auto_32928 ) ( not ( = ?auto_32928 ?auto_32935 ) ) ( not ( = ?auto_32929 ?auto_32935 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32934 ?auto_32928 ?auto_32935 ?auto_32930 )
      ( MAKE-ON ?auto_32928 ?auto_32929 )
      ( MAKE-ON-VERIFY ?auto_32928 ?auto_32929 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32936 - SURFACE
      ?auto_32937 - SURFACE
    )
    :vars
    (
      ?auto_32942 - HOIST
      ?auto_32943 - PLACE
      ?auto_32939 - PLACE
      ?auto_32938 - HOIST
      ?auto_32941 - SURFACE
      ?auto_32940 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32942 ?auto_32943 ) ( SURFACE-AT ?auto_32937 ?auto_32943 ) ( CLEAR ?auto_32937 ) ( IS-CRATE ?auto_32936 ) ( not ( = ?auto_32936 ?auto_32937 ) ) ( AVAILABLE ?auto_32942 ) ( not ( = ?auto_32939 ?auto_32943 ) ) ( HOIST-AT ?auto_32938 ?auto_32939 ) ( not ( = ?auto_32942 ?auto_32938 ) ) ( AVAILABLE ?auto_32938 ) ( SURFACE-AT ?auto_32936 ?auto_32939 ) ( ON ?auto_32936 ?auto_32941 ) ( CLEAR ?auto_32936 ) ( not ( = ?auto_32936 ?auto_32941 ) ) ( not ( = ?auto_32937 ?auto_32941 ) ) ( TRUCK-AT ?auto_32940 ?auto_32943 ) )
    :subtasks
    ( ( !DRIVE ?auto_32940 ?auto_32943 ?auto_32939 )
      ( MAKE-ON ?auto_32936 ?auto_32937 )
      ( MAKE-ON-VERIFY ?auto_32936 ?auto_32937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32946 - SURFACE
      ?auto_32947 - SURFACE
    )
    :vars
    (
      ?auto_32948 - HOIST
      ?auto_32949 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32948 ?auto_32949 ) ( SURFACE-AT ?auto_32947 ?auto_32949 ) ( CLEAR ?auto_32947 ) ( LIFTING ?auto_32948 ?auto_32946 ) ( IS-CRATE ?auto_32946 ) ( not ( = ?auto_32946 ?auto_32947 ) ) )
    :subtasks
    ( ( !DROP ?auto_32948 ?auto_32946 ?auto_32947 ?auto_32949 )
      ( MAKE-ON-VERIFY ?auto_32946 ?auto_32947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32950 - SURFACE
      ?auto_32951 - SURFACE
    )
    :vars
    (
      ?auto_32952 - HOIST
      ?auto_32953 - PLACE
      ?auto_32954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32952 ?auto_32953 ) ( SURFACE-AT ?auto_32951 ?auto_32953 ) ( CLEAR ?auto_32951 ) ( IS-CRATE ?auto_32950 ) ( not ( = ?auto_32950 ?auto_32951 ) ) ( TRUCK-AT ?auto_32954 ?auto_32953 ) ( AVAILABLE ?auto_32952 ) ( IN ?auto_32950 ?auto_32954 ) )
    :subtasks
    ( ( !UNLOAD ?auto_32952 ?auto_32950 ?auto_32954 ?auto_32953 )
      ( MAKE-ON ?auto_32950 ?auto_32951 )
      ( MAKE-ON-VERIFY ?auto_32950 ?auto_32951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32955 - SURFACE
      ?auto_32956 - SURFACE
    )
    :vars
    (
      ?auto_32957 - HOIST
      ?auto_32958 - PLACE
      ?auto_32959 - TRUCK
      ?auto_32960 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32957 ?auto_32958 ) ( SURFACE-AT ?auto_32956 ?auto_32958 ) ( CLEAR ?auto_32956 ) ( IS-CRATE ?auto_32955 ) ( not ( = ?auto_32955 ?auto_32956 ) ) ( AVAILABLE ?auto_32957 ) ( IN ?auto_32955 ?auto_32959 ) ( TRUCK-AT ?auto_32959 ?auto_32960 ) ( not ( = ?auto_32960 ?auto_32958 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_32959 ?auto_32960 ?auto_32958 )
      ( MAKE-ON ?auto_32955 ?auto_32956 )
      ( MAKE-ON-VERIFY ?auto_32955 ?auto_32956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32961 - SURFACE
      ?auto_32962 - SURFACE
    )
    :vars
    (
      ?auto_32966 - HOIST
      ?auto_32963 - PLACE
      ?auto_32964 - TRUCK
      ?auto_32965 - PLACE
      ?auto_32967 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_32966 ?auto_32963 ) ( SURFACE-AT ?auto_32962 ?auto_32963 ) ( CLEAR ?auto_32962 ) ( IS-CRATE ?auto_32961 ) ( not ( = ?auto_32961 ?auto_32962 ) ) ( AVAILABLE ?auto_32966 ) ( TRUCK-AT ?auto_32964 ?auto_32965 ) ( not ( = ?auto_32965 ?auto_32963 ) ) ( HOIST-AT ?auto_32967 ?auto_32965 ) ( LIFTING ?auto_32967 ?auto_32961 ) ( not ( = ?auto_32966 ?auto_32967 ) ) )
    :subtasks
    ( ( !LOAD ?auto_32967 ?auto_32961 ?auto_32964 ?auto_32965 )
      ( MAKE-ON ?auto_32961 ?auto_32962 )
      ( MAKE-ON-VERIFY ?auto_32961 ?auto_32962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32968 - SURFACE
      ?auto_32969 - SURFACE
    )
    :vars
    (
      ?auto_32973 - HOIST
      ?auto_32970 - PLACE
      ?auto_32972 - TRUCK
      ?auto_32971 - PLACE
      ?auto_32974 - HOIST
      ?auto_32975 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32973 ?auto_32970 ) ( SURFACE-AT ?auto_32969 ?auto_32970 ) ( CLEAR ?auto_32969 ) ( IS-CRATE ?auto_32968 ) ( not ( = ?auto_32968 ?auto_32969 ) ) ( AVAILABLE ?auto_32973 ) ( TRUCK-AT ?auto_32972 ?auto_32971 ) ( not ( = ?auto_32971 ?auto_32970 ) ) ( HOIST-AT ?auto_32974 ?auto_32971 ) ( not ( = ?auto_32973 ?auto_32974 ) ) ( AVAILABLE ?auto_32974 ) ( SURFACE-AT ?auto_32968 ?auto_32971 ) ( ON ?auto_32968 ?auto_32975 ) ( CLEAR ?auto_32968 ) ( not ( = ?auto_32968 ?auto_32975 ) ) ( not ( = ?auto_32969 ?auto_32975 ) ) )
    :subtasks
    ( ( !LIFT ?auto_32974 ?auto_32968 ?auto_32975 ?auto_32971 )
      ( MAKE-ON ?auto_32968 ?auto_32969 )
      ( MAKE-ON-VERIFY ?auto_32968 ?auto_32969 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32976 - SURFACE
      ?auto_32977 - SURFACE
    )
    :vars
    (
      ?auto_32978 - HOIST
      ?auto_32979 - PLACE
      ?auto_32980 - PLACE
      ?auto_32982 - HOIST
      ?auto_32983 - SURFACE
      ?auto_32981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_32978 ?auto_32979 ) ( SURFACE-AT ?auto_32977 ?auto_32979 ) ( CLEAR ?auto_32977 ) ( IS-CRATE ?auto_32976 ) ( not ( = ?auto_32976 ?auto_32977 ) ) ( AVAILABLE ?auto_32978 ) ( not ( = ?auto_32980 ?auto_32979 ) ) ( HOIST-AT ?auto_32982 ?auto_32980 ) ( not ( = ?auto_32978 ?auto_32982 ) ) ( AVAILABLE ?auto_32982 ) ( SURFACE-AT ?auto_32976 ?auto_32980 ) ( ON ?auto_32976 ?auto_32983 ) ( CLEAR ?auto_32976 ) ( not ( = ?auto_32976 ?auto_32983 ) ) ( not ( = ?auto_32977 ?auto_32983 ) ) ( TRUCK-AT ?auto_32981 ?auto_32979 ) )
    :subtasks
    ( ( !DRIVE ?auto_32981 ?auto_32979 ?auto_32980 )
      ( MAKE-ON ?auto_32976 ?auto_32977 )
      ( MAKE-ON-VERIFY ?auto_32976 ?auto_32977 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32984 - SURFACE
      ?auto_32985 - SURFACE
    )
    :vars
    (
      ?auto_32990 - HOIST
      ?auto_32987 - PLACE
      ?auto_32989 - PLACE
      ?auto_32988 - HOIST
      ?auto_32986 - SURFACE
      ?auto_32991 - TRUCK
      ?auto_32992 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_32990 ?auto_32987 ) ( IS-CRATE ?auto_32984 ) ( not ( = ?auto_32984 ?auto_32985 ) ) ( not ( = ?auto_32989 ?auto_32987 ) ) ( HOIST-AT ?auto_32988 ?auto_32989 ) ( not ( = ?auto_32990 ?auto_32988 ) ) ( AVAILABLE ?auto_32988 ) ( SURFACE-AT ?auto_32984 ?auto_32989 ) ( ON ?auto_32984 ?auto_32986 ) ( CLEAR ?auto_32984 ) ( not ( = ?auto_32984 ?auto_32986 ) ) ( not ( = ?auto_32985 ?auto_32986 ) ) ( TRUCK-AT ?auto_32991 ?auto_32987 ) ( SURFACE-AT ?auto_32992 ?auto_32987 ) ( CLEAR ?auto_32992 ) ( LIFTING ?auto_32990 ?auto_32985 ) ( IS-CRATE ?auto_32985 ) ( not ( = ?auto_32984 ?auto_32992 ) ) ( not ( = ?auto_32985 ?auto_32992 ) ) ( not ( = ?auto_32986 ?auto_32992 ) ) )
    :subtasks
    ( ( !DROP ?auto_32990 ?auto_32985 ?auto_32992 ?auto_32987 )
      ( MAKE-ON ?auto_32984 ?auto_32985 )
      ( MAKE-ON-VERIFY ?auto_32984 ?auto_32985 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32993 - SURFACE
      ?auto_32994 - SURFACE
    )
    :vars
    (
      ?auto_33001 - HOIST
      ?auto_32999 - PLACE
      ?auto_32995 - PLACE
      ?auto_32996 - HOIST
      ?auto_32997 - SURFACE
      ?auto_33000 - TRUCK
      ?auto_32998 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33001 ?auto_32999 ) ( IS-CRATE ?auto_32993 ) ( not ( = ?auto_32993 ?auto_32994 ) ) ( not ( = ?auto_32995 ?auto_32999 ) ) ( HOIST-AT ?auto_32996 ?auto_32995 ) ( not ( = ?auto_33001 ?auto_32996 ) ) ( AVAILABLE ?auto_32996 ) ( SURFACE-AT ?auto_32993 ?auto_32995 ) ( ON ?auto_32993 ?auto_32997 ) ( CLEAR ?auto_32993 ) ( not ( = ?auto_32993 ?auto_32997 ) ) ( not ( = ?auto_32994 ?auto_32997 ) ) ( TRUCK-AT ?auto_33000 ?auto_32999 ) ( SURFACE-AT ?auto_32998 ?auto_32999 ) ( CLEAR ?auto_32998 ) ( IS-CRATE ?auto_32994 ) ( not ( = ?auto_32993 ?auto_32998 ) ) ( not ( = ?auto_32994 ?auto_32998 ) ) ( not ( = ?auto_32997 ?auto_32998 ) ) ( AVAILABLE ?auto_33001 ) ( IN ?auto_32994 ?auto_33000 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33001 ?auto_32994 ?auto_33000 ?auto_32999 )
      ( MAKE-ON ?auto_32993 ?auto_32994 )
      ( MAKE-ON-VERIFY ?auto_32993 ?auto_32994 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33002 - SURFACE
      ?auto_33003 - SURFACE
    )
    :vars
    (
      ?auto_33009 - HOIST
      ?auto_33006 - PLACE
      ?auto_33010 - PLACE
      ?auto_33007 - HOIST
      ?auto_33008 - SURFACE
      ?auto_33004 - SURFACE
      ?auto_33005 - TRUCK
      ?auto_33011 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33009 ?auto_33006 ) ( IS-CRATE ?auto_33002 ) ( not ( = ?auto_33002 ?auto_33003 ) ) ( not ( = ?auto_33010 ?auto_33006 ) ) ( HOIST-AT ?auto_33007 ?auto_33010 ) ( not ( = ?auto_33009 ?auto_33007 ) ) ( AVAILABLE ?auto_33007 ) ( SURFACE-AT ?auto_33002 ?auto_33010 ) ( ON ?auto_33002 ?auto_33008 ) ( CLEAR ?auto_33002 ) ( not ( = ?auto_33002 ?auto_33008 ) ) ( not ( = ?auto_33003 ?auto_33008 ) ) ( SURFACE-AT ?auto_33004 ?auto_33006 ) ( CLEAR ?auto_33004 ) ( IS-CRATE ?auto_33003 ) ( not ( = ?auto_33002 ?auto_33004 ) ) ( not ( = ?auto_33003 ?auto_33004 ) ) ( not ( = ?auto_33008 ?auto_33004 ) ) ( AVAILABLE ?auto_33009 ) ( IN ?auto_33003 ?auto_33005 ) ( TRUCK-AT ?auto_33005 ?auto_33011 ) ( not ( = ?auto_33011 ?auto_33006 ) ) ( not ( = ?auto_33010 ?auto_33011 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33005 ?auto_33011 ?auto_33006 )
      ( MAKE-ON ?auto_33002 ?auto_33003 )
      ( MAKE-ON-VERIFY ?auto_33002 ?auto_33003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33012 - SURFACE
      ?auto_33013 - SURFACE
    )
    :vars
    (
      ?auto_33021 - HOIST
      ?auto_33020 - PLACE
      ?auto_33017 - PLACE
      ?auto_33014 - HOIST
      ?auto_33015 - SURFACE
      ?auto_33019 - SURFACE
      ?auto_33016 - TRUCK
      ?auto_33018 - PLACE
      ?auto_33022 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33021 ?auto_33020 ) ( IS-CRATE ?auto_33012 ) ( not ( = ?auto_33012 ?auto_33013 ) ) ( not ( = ?auto_33017 ?auto_33020 ) ) ( HOIST-AT ?auto_33014 ?auto_33017 ) ( not ( = ?auto_33021 ?auto_33014 ) ) ( AVAILABLE ?auto_33014 ) ( SURFACE-AT ?auto_33012 ?auto_33017 ) ( ON ?auto_33012 ?auto_33015 ) ( CLEAR ?auto_33012 ) ( not ( = ?auto_33012 ?auto_33015 ) ) ( not ( = ?auto_33013 ?auto_33015 ) ) ( SURFACE-AT ?auto_33019 ?auto_33020 ) ( CLEAR ?auto_33019 ) ( IS-CRATE ?auto_33013 ) ( not ( = ?auto_33012 ?auto_33019 ) ) ( not ( = ?auto_33013 ?auto_33019 ) ) ( not ( = ?auto_33015 ?auto_33019 ) ) ( AVAILABLE ?auto_33021 ) ( TRUCK-AT ?auto_33016 ?auto_33018 ) ( not ( = ?auto_33018 ?auto_33020 ) ) ( not ( = ?auto_33017 ?auto_33018 ) ) ( HOIST-AT ?auto_33022 ?auto_33018 ) ( LIFTING ?auto_33022 ?auto_33013 ) ( not ( = ?auto_33021 ?auto_33022 ) ) ( not ( = ?auto_33014 ?auto_33022 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33022 ?auto_33013 ?auto_33016 ?auto_33018 )
      ( MAKE-ON ?auto_33012 ?auto_33013 )
      ( MAKE-ON-VERIFY ?auto_33012 ?auto_33013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33023 - SURFACE
      ?auto_33024 - SURFACE
    )
    :vars
    (
      ?auto_33029 - HOIST
      ?auto_33028 - PLACE
      ?auto_33026 - PLACE
      ?auto_33031 - HOIST
      ?auto_33027 - SURFACE
      ?auto_33032 - SURFACE
      ?auto_33025 - TRUCK
      ?auto_33033 - PLACE
      ?auto_33030 - HOIST
      ?auto_33034 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33029 ?auto_33028 ) ( IS-CRATE ?auto_33023 ) ( not ( = ?auto_33023 ?auto_33024 ) ) ( not ( = ?auto_33026 ?auto_33028 ) ) ( HOIST-AT ?auto_33031 ?auto_33026 ) ( not ( = ?auto_33029 ?auto_33031 ) ) ( AVAILABLE ?auto_33031 ) ( SURFACE-AT ?auto_33023 ?auto_33026 ) ( ON ?auto_33023 ?auto_33027 ) ( CLEAR ?auto_33023 ) ( not ( = ?auto_33023 ?auto_33027 ) ) ( not ( = ?auto_33024 ?auto_33027 ) ) ( SURFACE-AT ?auto_33032 ?auto_33028 ) ( CLEAR ?auto_33032 ) ( IS-CRATE ?auto_33024 ) ( not ( = ?auto_33023 ?auto_33032 ) ) ( not ( = ?auto_33024 ?auto_33032 ) ) ( not ( = ?auto_33027 ?auto_33032 ) ) ( AVAILABLE ?auto_33029 ) ( TRUCK-AT ?auto_33025 ?auto_33033 ) ( not ( = ?auto_33033 ?auto_33028 ) ) ( not ( = ?auto_33026 ?auto_33033 ) ) ( HOIST-AT ?auto_33030 ?auto_33033 ) ( not ( = ?auto_33029 ?auto_33030 ) ) ( not ( = ?auto_33031 ?auto_33030 ) ) ( AVAILABLE ?auto_33030 ) ( SURFACE-AT ?auto_33024 ?auto_33033 ) ( ON ?auto_33024 ?auto_33034 ) ( CLEAR ?auto_33024 ) ( not ( = ?auto_33023 ?auto_33034 ) ) ( not ( = ?auto_33024 ?auto_33034 ) ) ( not ( = ?auto_33027 ?auto_33034 ) ) ( not ( = ?auto_33032 ?auto_33034 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33030 ?auto_33024 ?auto_33034 ?auto_33033 )
      ( MAKE-ON ?auto_33023 ?auto_33024 )
      ( MAKE-ON-VERIFY ?auto_33023 ?auto_33024 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33035 - SURFACE
      ?auto_33036 - SURFACE
    )
    :vars
    (
      ?auto_33040 - HOIST
      ?auto_33044 - PLACE
      ?auto_33038 - PLACE
      ?auto_33045 - HOIST
      ?auto_33039 - SURFACE
      ?auto_33037 - SURFACE
      ?auto_33046 - PLACE
      ?auto_33043 - HOIST
      ?auto_33041 - SURFACE
      ?auto_33042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33040 ?auto_33044 ) ( IS-CRATE ?auto_33035 ) ( not ( = ?auto_33035 ?auto_33036 ) ) ( not ( = ?auto_33038 ?auto_33044 ) ) ( HOIST-AT ?auto_33045 ?auto_33038 ) ( not ( = ?auto_33040 ?auto_33045 ) ) ( AVAILABLE ?auto_33045 ) ( SURFACE-AT ?auto_33035 ?auto_33038 ) ( ON ?auto_33035 ?auto_33039 ) ( CLEAR ?auto_33035 ) ( not ( = ?auto_33035 ?auto_33039 ) ) ( not ( = ?auto_33036 ?auto_33039 ) ) ( SURFACE-AT ?auto_33037 ?auto_33044 ) ( CLEAR ?auto_33037 ) ( IS-CRATE ?auto_33036 ) ( not ( = ?auto_33035 ?auto_33037 ) ) ( not ( = ?auto_33036 ?auto_33037 ) ) ( not ( = ?auto_33039 ?auto_33037 ) ) ( AVAILABLE ?auto_33040 ) ( not ( = ?auto_33046 ?auto_33044 ) ) ( not ( = ?auto_33038 ?auto_33046 ) ) ( HOIST-AT ?auto_33043 ?auto_33046 ) ( not ( = ?auto_33040 ?auto_33043 ) ) ( not ( = ?auto_33045 ?auto_33043 ) ) ( AVAILABLE ?auto_33043 ) ( SURFACE-AT ?auto_33036 ?auto_33046 ) ( ON ?auto_33036 ?auto_33041 ) ( CLEAR ?auto_33036 ) ( not ( = ?auto_33035 ?auto_33041 ) ) ( not ( = ?auto_33036 ?auto_33041 ) ) ( not ( = ?auto_33039 ?auto_33041 ) ) ( not ( = ?auto_33037 ?auto_33041 ) ) ( TRUCK-AT ?auto_33042 ?auto_33044 ) )
    :subtasks
    ( ( !DRIVE ?auto_33042 ?auto_33044 ?auto_33046 )
      ( MAKE-ON ?auto_33035 ?auto_33036 )
      ( MAKE-ON-VERIFY ?auto_33035 ?auto_33036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33049 - SURFACE
      ?auto_33050 - SURFACE
    )
    :vars
    (
      ?auto_33051 - HOIST
      ?auto_33052 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33051 ?auto_33052 ) ( SURFACE-AT ?auto_33050 ?auto_33052 ) ( CLEAR ?auto_33050 ) ( LIFTING ?auto_33051 ?auto_33049 ) ( IS-CRATE ?auto_33049 ) ( not ( = ?auto_33049 ?auto_33050 ) ) )
    :subtasks
    ( ( !DROP ?auto_33051 ?auto_33049 ?auto_33050 ?auto_33052 )
      ( MAKE-ON-VERIFY ?auto_33049 ?auto_33050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33053 - SURFACE
      ?auto_33054 - SURFACE
    )
    :vars
    (
      ?auto_33056 - HOIST
      ?auto_33055 - PLACE
      ?auto_33057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33056 ?auto_33055 ) ( SURFACE-AT ?auto_33054 ?auto_33055 ) ( CLEAR ?auto_33054 ) ( IS-CRATE ?auto_33053 ) ( not ( = ?auto_33053 ?auto_33054 ) ) ( TRUCK-AT ?auto_33057 ?auto_33055 ) ( AVAILABLE ?auto_33056 ) ( IN ?auto_33053 ?auto_33057 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33056 ?auto_33053 ?auto_33057 ?auto_33055 )
      ( MAKE-ON ?auto_33053 ?auto_33054 )
      ( MAKE-ON-VERIFY ?auto_33053 ?auto_33054 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33058 - SURFACE
      ?auto_33059 - SURFACE
    )
    :vars
    (
      ?auto_33061 - HOIST
      ?auto_33062 - PLACE
      ?auto_33060 - TRUCK
      ?auto_33063 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33061 ?auto_33062 ) ( SURFACE-AT ?auto_33059 ?auto_33062 ) ( CLEAR ?auto_33059 ) ( IS-CRATE ?auto_33058 ) ( not ( = ?auto_33058 ?auto_33059 ) ) ( AVAILABLE ?auto_33061 ) ( IN ?auto_33058 ?auto_33060 ) ( TRUCK-AT ?auto_33060 ?auto_33063 ) ( not ( = ?auto_33063 ?auto_33062 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33060 ?auto_33063 ?auto_33062 )
      ( MAKE-ON ?auto_33058 ?auto_33059 )
      ( MAKE-ON-VERIFY ?auto_33058 ?auto_33059 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33064 - SURFACE
      ?auto_33065 - SURFACE
    )
    :vars
    (
      ?auto_33068 - HOIST
      ?auto_33069 - PLACE
      ?auto_33066 - TRUCK
      ?auto_33067 - PLACE
      ?auto_33070 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33068 ?auto_33069 ) ( SURFACE-AT ?auto_33065 ?auto_33069 ) ( CLEAR ?auto_33065 ) ( IS-CRATE ?auto_33064 ) ( not ( = ?auto_33064 ?auto_33065 ) ) ( AVAILABLE ?auto_33068 ) ( TRUCK-AT ?auto_33066 ?auto_33067 ) ( not ( = ?auto_33067 ?auto_33069 ) ) ( HOIST-AT ?auto_33070 ?auto_33067 ) ( LIFTING ?auto_33070 ?auto_33064 ) ( not ( = ?auto_33068 ?auto_33070 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33070 ?auto_33064 ?auto_33066 ?auto_33067 )
      ( MAKE-ON ?auto_33064 ?auto_33065 )
      ( MAKE-ON-VERIFY ?auto_33064 ?auto_33065 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33071 - SURFACE
      ?auto_33072 - SURFACE
    )
    :vars
    (
      ?auto_33076 - HOIST
      ?auto_33077 - PLACE
      ?auto_33073 - TRUCK
      ?auto_33075 - PLACE
      ?auto_33074 - HOIST
      ?auto_33078 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33076 ?auto_33077 ) ( SURFACE-AT ?auto_33072 ?auto_33077 ) ( CLEAR ?auto_33072 ) ( IS-CRATE ?auto_33071 ) ( not ( = ?auto_33071 ?auto_33072 ) ) ( AVAILABLE ?auto_33076 ) ( TRUCK-AT ?auto_33073 ?auto_33075 ) ( not ( = ?auto_33075 ?auto_33077 ) ) ( HOIST-AT ?auto_33074 ?auto_33075 ) ( not ( = ?auto_33076 ?auto_33074 ) ) ( AVAILABLE ?auto_33074 ) ( SURFACE-AT ?auto_33071 ?auto_33075 ) ( ON ?auto_33071 ?auto_33078 ) ( CLEAR ?auto_33071 ) ( not ( = ?auto_33071 ?auto_33078 ) ) ( not ( = ?auto_33072 ?auto_33078 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33074 ?auto_33071 ?auto_33078 ?auto_33075 )
      ( MAKE-ON ?auto_33071 ?auto_33072 )
      ( MAKE-ON-VERIFY ?auto_33071 ?auto_33072 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33079 - SURFACE
      ?auto_33080 - SURFACE
    )
    :vars
    (
      ?auto_33081 - HOIST
      ?auto_33083 - PLACE
      ?auto_33085 - PLACE
      ?auto_33082 - HOIST
      ?auto_33086 - SURFACE
      ?auto_33084 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33081 ?auto_33083 ) ( SURFACE-AT ?auto_33080 ?auto_33083 ) ( CLEAR ?auto_33080 ) ( IS-CRATE ?auto_33079 ) ( not ( = ?auto_33079 ?auto_33080 ) ) ( AVAILABLE ?auto_33081 ) ( not ( = ?auto_33085 ?auto_33083 ) ) ( HOIST-AT ?auto_33082 ?auto_33085 ) ( not ( = ?auto_33081 ?auto_33082 ) ) ( AVAILABLE ?auto_33082 ) ( SURFACE-AT ?auto_33079 ?auto_33085 ) ( ON ?auto_33079 ?auto_33086 ) ( CLEAR ?auto_33079 ) ( not ( = ?auto_33079 ?auto_33086 ) ) ( not ( = ?auto_33080 ?auto_33086 ) ) ( TRUCK-AT ?auto_33084 ?auto_33083 ) )
    :subtasks
    ( ( !DRIVE ?auto_33084 ?auto_33083 ?auto_33085 )
      ( MAKE-ON ?auto_33079 ?auto_33080 )
      ( MAKE-ON-VERIFY ?auto_33079 ?auto_33080 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33087 - SURFACE
      ?auto_33088 - SURFACE
    )
    :vars
    (
      ?auto_33092 - HOIST
      ?auto_33091 - PLACE
      ?auto_33089 - PLACE
      ?auto_33094 - HOIST
      ?auto_33090 - SURFACE
      ?auto_33093 - TRUCK
      ?auto_33095 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33092 ?auto_33091 ) ( IS-CRATE ?auto_33087 ) ( not ( = ?auto_33087 ?auto_33088 ) ) ( not ( = ?auto_33089 ?auto_33091 ) ) ( HOIST-AT ?auto_33094 ?auto_33089 ) ( not ( = ?auto_33092 ?auto_33094 ) ) ( AVAILABLE ?auto_33094 ) ( SURFACE-AT ?auto_33087 ?auto_33089 ) ( ON ?auto_33087 ?auto_33090 ) ( CLEAR ?auto_33087 ) ( not ( = ?auto_33087 ?auto_33090 ) ) ( not ( = ?auto_33088 ?auto_33090 ) ) ( TRUCK-AT ?auto_33093 ?auto_33091 ) ( SURFACE-AT ?auto_33095 ?auto_33091 ) ( CLEAR ?auto_33095 ) ( LIFTING ?auto_33092 ?auto_33088 ) ( IS-CRATE ?auto_33088 ) ( not ( = ?auto_33087 ?auto_33095 ) ) ( not ( = ?auto_33088 ?auto_33095 ) ) ( not ( = ?auto_33090 ?auto_33095 ) ) )
    :subtasks
    ( ( !DROP ?auto_33092 ?auto_33088 ?auto_33095 ?auto_33091 )
      ( MAKE-ON ?auto_33087 ?auto_33088 )
      ( MAKE-ON-VERIFY ?auto_33087 ?auto_33088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33096 - SURFACE
      ?auto_33097 - SURFACE
    )
    :vars
    (
      ?auto_33098 - HOIST
      ?auto_33103 - PLACE
      ?auto_33102 - PLACE
      ?auto_33100 - HOIST
      ?auto_33099 - SURFACE
      ?auto_33104 - TRUCK
      ?auto_33101 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33098 ?auto_33103 ) ( IS-CRATE ?auto_33096 ) ( not ( = ?auto_33096 ?auto_33097 ) ) ( not ( = ?auto_33102 ?auto_33103 ) ) ( HOIST-AT ?auto_33100 ?auto_33102 ) ( not ( = ?auto_33098 ?auto_33100 ) ) ( AVAILABLE ?auto_33100 ) ( SURFACE-AT ?auto_33096 ?auto_33102 ) ( ON ?auto_33096 ?auto_33099 ) ( CLEAR ?auto_33096 ) ( not ( = ?auto_33096 ?auto_33099 ) ) ( not ( = ?auto_33097 ?auto_33099 ) ) ( TRUCK-AT ?auto_33104 ?auto_33103 ) ( SURFACE-AT ?auto_33101 ?auto_33103 ) ( CLEAR ?auto_33101 ) ( IS-CRATE ?auto_33097 ) ( not ( = ?auto_33096 ?auto_33101 ) ) ( not ( = ?auto_33097 ?auto_33101 ) ) ( not ( = ?auto_33099 ?auto_33101 ) ) ( AVAILABLE ?auto_33098 ) ( IN ?auto_33097 ?auto_33104 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33098 ?auto_33097 ?auto_33104 ?auto_33103 )
      ( MAKE-ON ?auto_33096 ?auto_33097 )
      ( MAKE-ON-VERIFY ?auto_33096 ?auto_33097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33105 - SURFACE
      ?auto_33106 - SURFACE
    )
    :vars
    (
      ?auto_33110 - HOIST
      ?auto_33112 - PLACE
      ?auto_33107 - PLACE
      ?auto_33113 - HOIST
      ?auto_33108 - SURFACE
      ?auto_33111 - SURFACE
      ?auto_33109 - TRUCK
      ?auto_33114 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33110 ?auto_33112 ) ( IS-CRATE ?auto_33105 ) ( not ( = ?auto_33105 ?auto_33106 ) ) ( not ( = ?auto_33107 ?auto_33112 ) ) ( HOIST-AT ?auto_33113 ?auto_33107 ) ( not ( = ?auto_33110 ?auto_33113 ) ) ( AVAILABLE ?auto_33113 ) ( SURFACE-AT ?auto_33105 ?auto_33107 ) ( ON ?auto_33105 ?auto_33108 ) ( CLEAR ?auto_33105 ) ( not ( = ?auto_33105 ?auto_33108 ) ) ( not ( = ?auto_33106 ?auto_33108 ) ) ( SURFACE-AT ?auto_33111 ?auto_33112 ) ( CLEAR ?auto_33111 ) ( IS-CRATE ?auto_33106 ) ( not ( = ?auto_33105 ?auto_33111 ) ) ( not ( = ?auto_33106 ?auto_33111 ) ) ( not ( = ?auto_33108 ?auto_33111 ) ) ( AVAILABLE ?auto_33110 ) ( IN ?auto_33106 ?auto_33109 ) ( TRUCK-AT ?auto_33109 ?auto_33114 ) ( not ( = ?auto_33114 ?auto_33112 ) ) ( not ( = ?auto_33107 ?auto_33114 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33109 ?auto_33114 ?auto_33112 )
      ( MAKE-ON ?auto_33105 ?auto_33106 )
      ( MAKE-ON-VERIFY ?auto_33105 ?auto_33106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33115 - SURFACE
      ?auto_33116 - SURFACE
    )
    :vars
    (
      ?auto_33119 - HOIST
      ?auto_33124 - PLACE
      ?auto_33118 - PLACE
      ?auto_33123 - HOIST
      ?auto_33117 - SURFACE
      ?auto_33122 - SURFACE
      ?auto_33120 - TRUCK
      ?auto_33121 - PLACE
      ?auto_33125 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33119 ?auto_33124 ) ( IS-CRATE ?auto_33115 ) ( not ( = ?auto_33115 ?auto_33116 ) ) ( not ( = ?auto_33118 ?auto_33124 ) ) ( HOIST-AT ?auto_33123 ?auto_33118 ) ( not ( = ?auto_33119 ?auto_33123 ) ) ( AVAILABLE ?auto_33123 ) ( SURFACE-AT ?auto_33115 ?auto_33118 ) ( ON ?auto_33115 ?auto_33117 ) ( CLEAR ?auto_33115 ) ( not ( = ?auto_33115 ?auto_33117 ) ) ( not ( = ?auto_33116 ?auto_33117 ) ) ( SURFACE-AT ?auto_33122 ?auto_33124 ) ( CLEAR ?auto_33122 ) ( IS-CRATE ?auto_33116 ) ( not ( = ?auto_33115 ?auto_33122 ) ) ( not ( = ?auto_33116 ?auto_33122 ) ) ( not ( = ?auto_33117 ?auto_33122 ) ) ( AVAILABLE ?auto_33119 ) ( TRUCK-AT ?auto_33120 ?auto_33121 ) ( not ( = ?auto_33121 ?auto_33124 ) ) ( not ( = ?auto_33118 ?auto_33121 ) ) ( HOIST-AT ?auto_33125 ?auto_33121 ) ( LIFTING ?auto_33125 ?auto_33116 ) ( not ( = ?auto_33119 ?auto_33125 ) ) ( not ( = ?auto_33123 ?auto_33125 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33125 ?auto_33116 ?auto_33120 ?auto_33121 )
      ( MAKE-ON ?auto_33115 ?auto_33116 )
      ( MAKE-ON-VERIFY ?auto_33115 ?auto_33116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33126 - SURFACE
      ?auto_33127 - SURFACE
    )
    :vars
    (
      ?auto_33128 - HOIST
      ?auto_33134 - PLACE
      ?auto_33129 - PLACE
      ?auto_33136 - HOIST
      ?auto_33132 - SURFACE
      ?auto_33131 - SURFACE
      ?auto_33135 - TRUCK
      ?auto_33130 - PLACE
      ?auto_33133 - HOIST
      ?auto_33137 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33128 ?auto_33134 ) ( IS-CRATE ?auto_33126 ) ( not ( = ?auto_33126 ?auto_33127 ) ) ( not ( = ?auto_33129 ?auto_33134 ) ) ( HOIST-AT ?auto_33136 ?auto_33129 ) ( not ( = ?auto_33128 ?auto_33136 ) ) ( AVAILABLE ?auto_33136 ) ( SURFACE-AT ?auto_33126 ?auto_33129 ) ( ON ?auto_33126 ?auto_33132 ) ( CLEAR ?auto_33126 ) ( not ( = ?auto_33126 ?auto_33132 ) ) ( not ( = ?auto_33127 ?auto_33132 ) ) ( SURFACE-AT ?auto_33131 ?auto_33134 ) ( CLEAR ?auto_33131 ) ( IS-CRATE ?auto_33127 ) ( not ( = ?auto_33126 ?auto_33131 ) ) ( not ( = ?auto_33127 ?auto_33131 ) ) ( not ( = ?auto_33132 ?auto_33131 ) ) ( AVAILABLE ?auto_33128 ) ( TRUCK-AT ?auto_33135 ?auto_33130 ) ( not ( = ?auto_33130 ?auto_33134 ) ) ( not ( = ?auto_33129 ?auto_33130 ) ) ( HOIST-AT ?auto_33133 ?auto_33130 ) ( not ( = ?auto_33128 ?auto_33133 ) ) ( not ( = ?auto_33136 ?auto_33133 ) ) ( AVAILABLE ?auto_33133 ) ( SURFACE-AT ?auto_33127 ?auto_33130 ) ( ON ?auto_33127 ?auto_33137 ) ( CLEAR ?auto_33127 ) ( not ( = ?auto_33126 ?auto_33137 ) ) ( not ( = ?auto_33127 ?auto_33137 ) ) ( not ( = ?auto_33132 ?auto_33137 ) ) ( not ( = ?auto_33131 ?auto_33137 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33133 ?auto_33127 ?auto_33137 ?auto_33130 )
      ( MAKE-ON ?auto_33126 ?auto_33127 )
      ( MAKE-ON-VERIFY ?auto_33126 ?auto_33127 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33138 - SURFACE
      ?auto_33139 - SURFACE
    )
    :vars
    (
      ?auto_33146 - HOIST
      ?auto_33141 - PLACE
      ?auto_33148 - PLACE
      ?auto_33147 - HOIST
      ?auto_33144 - SURFACE
      ?auto_33149 - SURFACE
      ?auto_33140 - PLACE
      ?auto_33142 - HOIST
      ?auto_33145 - SURFACE
      ?auto_33143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33146 ?auto_33141 ) ( IS-CRATE ?auto_33138 ) ( not ( = ?auto_33138 ?auto_33139 ) ) ( not ( = ?auto_33148 ?auto_33141 ) ) ( HOIST-AT ?auto_33147 ?auto_33148 ) ( not ( = ?auto_33146 ?auto_33147 ) ) ( AVAILABLE ?auto_33147 ) ( SURFACE-AT ?auto_33138 ?auto_33148 ) ( ON ?auto_33138 ?auto_33144 ) ( CLEAR ?auto_33138 ) ( not ( = ?auto_33138 ?auto_33144 ) ) ( not ( = ?auto_33139 ?auto_33144 ) ) ( SURFACE-AT ?auto_33149 ?auto_33141 ) ( CLEAR ?auto_33149 ) ( IS-CRATE ?auto_33139 ) ( not ( = ?auto_33138 ?auto_33149 ) ) ( not ( = ?auto_33139 ?auto_33149 ) ) ( not ( = ?auto_33144 ?auto_33149 ) ) ( AVAILABLE ?auto_33146 ) ( not ( = ?auto_33140 ?auto_33141 ) ) ( not ( = ?auto_33148 ?auto_33140 ) ) ( HOIST-AT ?auto_33142 ?auto_33140 ) ( not ( = ?auto_33146 ?auto_33142 ) ) ( not ( = ?auto_33147 ?auto_33142 ) ) ( AVAILABLE ?auto_33142 ) ( SURFACE-AT ?auto_33139 ?auto_33140 ) ( ON ?auto_33139 ?auto_33145 ) ( CLEAR ?auto_33139 ) ( not ( = ?auto_33138 ?auto_33145 ) ) ( not ( = ?auto_33139 ?auto_33145 ) ) ( not ( = ?auto_33144 ?auto_33145 ) ) ( not ( = ?auto_33149 ?auto_33145 ) ) ( TRUCK-AT ?auto_33143 ?auto_33141 ) )
    :subtasks
    ( ( !DRIVE ?auto_33143 ?auto_33141 ?auto_33140 )
      ( MAKE-ON ?auto_33138 ?auto_33139 )
      ( MAKE-ON-VERIFY ?auto_33138 ?auto_33139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33150 - SURFACE
      ?auto_33151 - SURFACE
    )
    :vars
    (
      ?auto_33152 - HOIST
      ?auto_33161 - PLACE
      ?auto_33160 - PLACE
      ?auto_33154 - HOIST
      ?auto_33157 - SURFACE
      ?auto_33158 - SURFACE
      ?auto_33156 - PLACE
      ?auto_33159 - HOIST
      ?auto_33155 - SURFACE
      ?auto_33153 - TRUCK
      ?auto_33162 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33152 ?auto_33161 ) ( IS-CRATE ?auto_33150 ) ( not ( = ?auto_33150 ?auto_33151 ) ) ( not ( = ?auto_33160 ?auto_33161 ) ) ( HOIST-AT ?auto_33154 ?auto_33160 ) ( not ( = ?auto_33152 ?auto_33154 ) ) ( AVAILABLE ?auto_33154 ) ( SURFACE-AT ?auto_33150 ?auto_33160 ) ( ON ?auto_33150 ?auto_33157 ) ( CLEAR ?auto_33150 ) ( not ( = ?auto_33150 ?auto_33157 ) ) ( not ( = ?auto_33151 ?auto_33157 ) ) ( IS-CRATE ?auto_33151 ) ( not ( = ?auto_33150 ?auto_33158 ) ) ( not ( = ?auto_33151 ?auto_33158 ) ) ( not ( = ?auto_33157 ?auto_33158 ) ) ( not ( = ?auto_33156 ?auto_33161 ) ) ( not ( = ?auto_33160 ?auto_33156 ) ) ( HOIST-AT ?auto_33159 ?auto_33156 ) ( not ( = ?auto_33152 ?auto_33159 ) ) ( not ( = ?auto_33154 ?auto_33159 ) ) ( AVAILABLE ?auto_33159 ) ( SURFACE-AT ?auto_33151 ?auto_33156 ) ( ON ?auto_33151 ?auto_33155 ) ( CLEAR ?auto_33151 ) ( not ( = ?auto_33150 ?auto_33155 ) ) ( not ( = ?auto_33151 ?auto_33155 ) ) ( not ( = ?auto_33157 ?auto_33155 ) ) ( not ( = ?auto_33158 ?auto_33155 ) ) ( TRUCK-AT ?auto_33153 ?auto_33161 ) ( SURFACE-AT ?auto_33162 ?auto_33161 ) ( CLEAR ?auto_33162 ) ( LIFTING ?auto_33152 ?auto_33158 ) ( IS-CRATE ?auto_33158 ) ( not ( = ?auto_33150 ?auto_33162 ) ) ( not ( = ?auto_33151 ?auto_33162 ) ) ( not ( = ?auto_33157 ?auto_33162 ) ) ( not ( = ?auto_33158 ?auto_33162 ) ) ( not ( = ?auto_33155 ?auto_33162 ) ) )
    :subtasks
    ( ( !DROP ?auto_33152 ?auto_33158 ?auto_33162 ?auto_33161 )
      ( MAKE-ON ?auto_33150 ?auto_33151 )
      ( MAKE-ON-VERIFY ?auto_33150 ?auto_33151 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33163 - SURFACE
      ?auto_33164 - SURFACE
    )
    :vars
    (
      ?auto_33169 - HOIST
      ?auto_33166 - PLACE
      ?auto_33168 - PLACE
      ?auto_33173 - HOIST
      ?auto_33174 - SURFACE
      ?auto_33165 - SURFACE
      ?auto_33170 - PLACE
      ?auto_33171 - HOIST
      ?auto_33172 - SURFACE
      ?auto_33175 - TRUCK
      ?auto_33167 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33169 ?auto_33166 ) ( IS-CRATE ?auto_33163 ) ( not ( = ?auto_33163 ?auto_33164 ) ) ( not ( = ?auto_33168 ?auto_33166 ) ) ( HOIST-AT ?auto_33173 ?auto_33168 ) ( not ( = ?auto_33169 ?auto_33173 ) ) ( AVAILABLE ?auto_33173 ) ( SURFACE-AT ?auto_33163 ?auto_33168 ) ( ON ?auto_33163 ?auto_33174 ) ( CLEAR ?auto_33163 ) ( not ( = ?auto_33163 ?auto_33174 ) ) ( not ( = ?auto_33164 ?auto_33174 ) ) ( IS-CRATE ?auto_33164 ) ( not ( = ?auto_33163 ?auto_33165 ) ) ( not ( = ?auto_33164 ?auto_33165 ) ) ( not ( = ?auto_33174 ?auto_33165 ) ) ( not ( = ?auto_33170 ?auto_33166 ) ) ( not ( = ?auto_33168 ?auto_33170 ) ) ( HOIST-AT ?auto_33171 ?auto_33170 ) ( not ( = ?auto_33169 ?auto_33171 ) ) ( not ( = ?auto_33173 ?auto_33171 ) ) ( AVAILABLE ?auto_33171 ) ( SURFACE-AT ?auto_33164 ?auto_33170 ) ( ON ?auto_33164 ?auto_33172 ) ( CLEAR ?auto_33164 ) ( not ( = ?auto_33163 ?auto_33172 ) ) ( not ( = ?auto_33164 ?auto_33172 ) ) ( not ( = ?auto_33174 ?auto_33172 ) ) ( not ( = ?auto_33165 ?auto_33172 ) ) ( TRUCK-AT ?auto_33175 ?auto_33166 ) ( SURFACE-AT ?auto_33167 ?auto_33166 ) ( CLEAR ?auto_33167 ) ( IS-CRATE ?auto_33165 ) ( not ( = ?auto_33163 ?auto_33167 ) ) ( not ( = ?auto_33164 ?auto_33167 ) ) ( not ( = ?auto_33174 ?auto_33167 ) ) ( not ( = ?auto_33165 ?auto_33167 ) ) ( not ( = ?auto_33172 ?auto_33167 ) ) ( AVAILABLE ?auto_33169 ) ( IN ?auto_33165 ?auto_33175 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33169 ?auto_33165 ?auto_33175 ?auto_33166 )
      ( MAKE-ON ?auto_33163 ?auto_33164 )
      ( MAKE-ON-VERIFY ?auto_33163 ?auto_33164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33176 - SURFACE
      ?auto_33177 - SURFACE
    )
    :vars
    (
      ?auto_33181 - HOIST
      ?auto_33180 - PLACE
      ?auto_33183 - PLACE
      ?auto_33178 - HOIST
      ?auto_33186 - SURFACE
      ?auto_33188 - SURFACE
      ?auto_33187 - PLACE
      ?auto_33184 - HOIST
      ?auto_33185 - SURFACE
      ?auto_33179 - SURFACE
      ?auto_33182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33181 ?auto_33180 ) ( IS-CRATE ?auto_33176 ) ( not ( = ?auto_33176 ?auto_33177 ) ) ( not ( = ?auto_33183 ?auto_33180 ) ) ( HOIST-AT ?auto_33178 ?auto_33183 ) ( not ( = ?auto_33181 ?auto_33178 ) ) ( AVAILABLE ?auto_33178 ) ( SURFACE-AT ?auto_33176 ?auto_33183 ) ( ON ?auto_33176 ?auto_33186 ) ( CLEAR ?auto_33176 ) ( not ( = ?auto_33176 ?auto_33186 ) ) ( not ( = ?auto_33177 ?auto_33186 ) ) ( IS-CRATE ?auto_33177 ) ( not ( = ?auto_33176 ?auto_33188 ) ) ( not ( = ?auto_33177 ?auto_33188 ) ) ( not ( = ?auto_33186 ?auto_33188 ) ) ( not ( = ?auto_33187 ?auto_33180 ) ) ( not ( = ?auto_33183 ?auto_33187 ) ) ( HOIST-AT ?auto_33184 ?auto_33187 ) ( not ( = ?auto_33181 ?auto_33184 ) ) ( not ( = ?auto_33178 ?auto_33184 ) ) ( AVAILABLE ?auto_33184 ) ( SURFACE-AT ?auto_33177 ?auto_33187 ) ( ON ?auto_33177 ?auto_33185 ) ( CLEAR ?auto_33177 ) ( not ( = ?auto_33176 ?auto_33185 ) ) ( not ( = ?auto_33177 ?auto_33185 ) ) ( not ( = ?auto_33186 ?auto_33185 ) ) ( not ( = ?auto_33188 ?auto_33185 ) ) ( SURFACE-AT ?auto_33179 ?auto_33180 ) ( CLEAR ?auto_33179 ) ( IS-CRATE ?auto_33188 ) ( not ( = ?auto_33176 ?auto_33179 ) ) ( not ( = ?auto_33177 ?auto_33179 ) ) ( not ( = ?auto_33186 ?auto_33179 ) ) ( not ( = ?auto_33188 ?auto_33179 ) ) ( not ( = ?auto_33185 ?auto_33179 ) ) ( AVAILABLE ?auto_33181 ) ( IN ?auto_33188 ?auto_33182 ) ( TRUCK-AT ?auto_33182 ?auto_33183 ) )
    :subtasks
    ( ( !DRIVE ?auto_33182 ?auto_33183 ?auto_33180 )
      ( MAKE-ON ?auto_33176 ?auto_33177 )
      ( MAKE-ON-VERIFY ?auto_33176 ?auto_33177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33189 - SURFACE
      ?auto_33190 - SURFACE
    )
    :vars
    (
      ?auto_33193 - HOIST
      ?auto_33195 - PLACE
      ?auto_33191 - PLACE
      ?auto_33192 - HOIST
      ?auto_33199 - SURFACE
      ?auto_33201 - SURFACE
      ?auto_33198 - PLACE
      ?auto_33196 - HOIST
      ?auto_33200 - SURFACE
      ?auto_33197 - SURFACE
      ?auto_33194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33193 ?auto_33195 ) ( IS-CRATE ?auto_33189 ) ( not ( = ?auto_33189 ?auto_33190 ) ) ( not ( = ?auto_33191 ?auto_33195 ) ) ( HOIST-AT ?auto_33192 ?auto_33191 ) ( not ( = ?auto_33193 ?auto_33192 ) ) ( SURFACE-AT ?auto_33189 ?auto_33191 ) ( ON ?auto_33189 ?auto_33199 ) ( CLEAR ?auto_33189 ) ( not ( = ?auto_33189 ?auto_33199 ) ) ( not ( = ?auto_33190 ?auto_33199 ) ) ( IS-CRATE ?auto_33190 ) ( not ( = ?auto_33189 ?auto_33201 ) ) ( not ( = ?auto_33190 ?auto_33201 ) ) ( not ( = ?auto_33199 ?auto_33201 ) ) ( not ( = ?auto_33198 ?auto_33195 ) ) ( not ( = ?auto_33191 ?auto_33198 ) ) ( HOIST-AT ?auto_33196 ?auto_33198 ) ( not ( = ?auto_33193 ?auto_33196 ) ) ( not ( = ?auto_33192 ?auto_33196 ) ) ( AVAILABLE ?auto_33196 ) ( SURFACE-AT ?auto_33190 ?auto_33198 ) ( ON ?auto_33190 ?auto_33200 ) ( CLEAR ?auto_33190 ) ( not ( = ?auto_33189 ?auto_33200 ) ) ( not ( = ?auto_33190 ?auto_33200 ) ) ( not ( = ?auto_33199 ?auto_33200 ) ) ( not ( = ?auto_33201 ?auto_33200 ) ) ( SURFACE-AT ?auto_33197 ?auto_33195 ) ( CLEAR ?auto_33197 ) ( IS-CRATE ?auto_33201 ) ( not ( = ?auto_33189 ?auto_33197 ) ) ( not ( = ?auto_33190 ?auto_33197 ) ) ( not ( = ?auto_33199 ?auto_33197 ) ) ( not ( = ?auto_33201 ?auto_33197 ) ) ( not ( = ?auto_33200 ?auto_33197 ) ) ( AVAILABLE ?auto_33193 ) ( TRUCK-AT ?auto_33194 ?auto_33191 ) ( LIFTING ?auto_33192 ?auto_33201 ) )
    :subtasks
    ( ( !LOAD ?auto_33192 ?auto_33201 ?auto_33194 ?auto_33191 )
      ( MAKE-ON ?auto_33189 ?auto_33190 )
      ( MAKE-ON-VERIFY ?auto_33189 ?auto_33190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33202 - SURFACE
      ?auto_33203 - SURFACE
    )
    :vars
    (
      ?auto_33209 - HOIST
      ?auto_33212 - PLACE
      ?auto_33207 - PLACE
      ?auto_33208 - HOIST
      ?auto_33206 - SURFACE
      ?auto_33213 - SURFACE
      ?auto_33205 - PLACE
      ?auto_33211 - HOIST
      ?auto_33214 - SURFACE
      ?auto_33210 - SURFACE
      ?auto_33204 - TRUCK
      ?auto_33215 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33209 ?auto_33212 ) ( IS-CRATE ?auto_33202 ) ( not ( = ?auto_33202 ?auto_33203 ) ) ( not ( = ?auto_33207 ?auto_33212 ) ) ( HOIST-AT ?auto_33208 ?auto_33207 ) ( not ( = ?auto_33209 ?auto_33208 ) ) ( SURFACE-AT ?auto_33202 ?auto_33207 ) ( ON ?auto_33202 ?auto_33206 ) ( CLEAR ?auto_33202 ) ( not ( = ?auto_33202 ?auto_33206 ) ) ( not ( = ?auto_33203 ?auto_33206 ) ) ( IS-CRATE ?auto_33203 ) ( not ( = ?auto_33202 ?auto_33213 ) ) ( not ( = ?auto_33203 ?auto_33213 ) ) ( not ( = ?auto_33206 ?auto_33213 ) ) ( not ( = ?auto_33205 ?auto_33212 ) ) ( not ( = ?auto_33207 ?auto_33205 ) ) ( HOIST-AT ?auto_33211 ?auto_33205 ) ( not ( = ?auto_33209 ?auto_33211 ) ) ( not ( = ?auto_33208 ?auto_33211 ) ) ( AVAILABLE ?auto_33211 ) ( SURFACE-AT ?auto_33203 ?auto_33205 ) ( ON ?auto_33203 ?auto_33214 ) ( CLEAR ?auto_33203 ) ( not ( = ?auto_33202 ?auto_33214 ) ) ( not ( = ?auto_33203 ?auto_33214 ) ) ( not ( = ?auto_33206 ?auto_33214 ) ) ( not ( = ?auto_33213 ?auto_33214 ) ) ( SURFACE-AT ?auto_33210 ?auto_33212 ) ( CLEAR ?auto_33210 ) ( IS-CRATE ?auto_33213 ) ( not ( = ?auto_33202 ?auto_33210 ) ) ( not ( = ?auto_33203 ?auto_33210 ) ) ( not ( = ?auto_33206 ?auto_33210 ) ) ( not ( = ?auto_33213 ?auto_33210 ) ) ( not ( = ?auto_33214 ?auto_33210 ) ) ( AVAILABLE ?auto_33209 ) ( TRUCK-AT ?auto_33204 ?auto_33207 ) ( AVAILABLE ?auto_33208 ) ( SURFACE-AT ?auto_33213 ?auto_33207 ) ( ON ?auto_33213 ?auto_33215 ) ( CLEAR ?auto_33213 ) ( not ( = ?auto_33202 ?auto_33215 ) ) ( not ( = ?auto_33203 ?auto_33215 ) ) ( not ( = ?auto_33206 ?auto_33215 ) ) ( not ( = ?auto_33213 ?auto_33215 ) ) ( not ( = ?auto_33214 ?auto_33215 ) ) ( not ( = ?auto_33210 ?auto_33215 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33208 ?auto_33213 ?auto_33215 ?auto_33207 )
      ( MAKE-ON ?auto_33202 ?auto_33203 )
      ( MAKE-ON-VERIFY ?auto_33202 ?auto_33203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33216 - SURFACE
      ?auto_33217 - SURFACE
    )
    :vars
    (
      ?auto_33229 - HOIST
      ?auto_33223 - PLACE
      ?auto_33228 - PLACE
      ?auto_33222 - HOIST
      ?auto_33226 - SURFACE
      ?auto_33221 - SURFACE
      ?auto_33218 - PLACE
      ?auto_33225 - HOIST
      ?auto_33219 - SURFACE
      ?auto_33220 - SURFACE
      ?auto_33227 - SURFACE
      ?auto_33224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33229 ?auto_33223 ) ( IS-CRATE ?auto_33216 ) ( not ( = ?auto_33216 ?auto_33217 ) ) ( not ( = ?auto_33228 ?auto_33223 ) ) ( HOIST-AT ?auto_33222 ?auto_33228 ) ( not ( = ?auto_33229 ?auto_33222 ) ) ( SURFACE-AT ?auto_33216 ?auto_33228 ) ( ON ?auto_33216 ?auto_33226 ) ( CLEAR ?auto_33216 ) ( not ( = ?auto_33216 ?auto_33226 ) ) ( not ( = ?auto_33217 ?auto_33226 ) ) ( IS-CRATE ?auto_33217 ) ( not ( = ?auto_33216 ?auto_33221 ) ) ( not ( = ?auto_33217 ?auto_33221 ) ) ( not ( = ?auto_33226 ?auto_33221 ) ) ( not ( = ?auto_33218 ?auto_33223 ) ) ( not ( = ?auto_33228 ?auto_33218 ) ) ( HOIST-AT ?auto_33225 ?auto_33218 ) ( not ( = ?auto_33229 ?auto_33225 ) ) ( not ( = ?auto_33222 ?auto_33225 ) ) ( AVAILABLE ?auto_33225 ) ( SURFACE-AT ?auto_33217 ?auto_33218 ) ( ON ?auto_33217 ?auto_33219 ) ( CLEAR ?auto_33217 ) ( not ( = ?auto_33216 ?auto_33219 ) ) ( not ( = ?auto_33217 ?auto_33219 ) ) ( not ( = ?auto_33226 ?auto_33219 ) ) ( not ( = ?auto_33221 ?auto_33219 ) ) ( SURFACE-AT ?auto_33220 ?auto_33223 ) ( CLEAR ?auto_33220 ) ( IS-CRATE ?auto_33221 ) ( not ( = ?auto_33216 ?auto_33220 ) ) ( not ( = ?auto_33217 ?auto_33220 ) ) ( not ( = ?auto_33226 ?auto_33220 ) ) ( not ( = ?auto_33221 ?auto_33220 ) ) ( not ( = ?auto_33219 ?auto_33220 ) ) ( AVAILABLE ?auto_33229 ) ( AVAILABLE ?auto_33222 ) ( SURFACE-AT ?auto_33221 ?auto_33228 ) ( ON ?auto_33221 ?auto_33227 ) ( CLEAR ?auto_33221 ) ( not ( = ?auto_33216 ?auto_33227 ) ) ( not ( = ?auto_33217 ?auto_33227 ) ) ( not ( = ?auto_33226 ?auto_33227 ) ) ( not ( = ?auto_33221 ?auto_33227 ) ) ( not ( = ?auto_33219 ?auto_33227 ) ) ( not ( = ?auto_33220 ?auto_33227 ) ) ( TRUCK-AT ?auto_33224 ?auto_33223 ) )
    :subtasks
    ( ( !DRIVE ?auto_33224 ?auto_33223 ?auto_33228 )
      ( MAKE-ON ?auto_33216 ?auto_33217 )
      ( MAKE-ON-VERIFY ?auto_33216 ?auto_33217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33232 - SURFACE
      ?auto_33233 - SURFACE
    )
    :vars
    (
      ?auto_33234 - HOIST
      ?auto_33235 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33234 ?auto_33235 ) ( SURFACE-AT ?auto_33233 ?auto_33235 ) ( CLEAR ?auto_33233 ) ( LIFTING ?auto_33234 ?auto_33232 ) ( IS-CRATE ?auto_33232 ) ( not ( = ?auto_33232 ?auto_33233 ) ) )
    :subtasks
    ( ( !DROP ?auto_33234 ?auto_33232 ?auto_33233 ?auto_33235 )
      ( MAKE-ON-VERIFY ?auto_33232 ?auto_33233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33236 - SURFACE
      ?auto_33237 - SURFACE
    )
    :vars
    (
      ?auto_33239 - HOIST
      ?auto_33238 - PLACE
      ?auto_33240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33239 ?auto_33238 ) ( SURFACE-AT ?auto_33237 ?auto_33238 ) ( CLEAR ?auto_33237 ) ( IS-CRATE ?auto_33236 ) ( not ( = ?auto_33236 ?auto_33237 ) ) ( TRUCK-AT ?auto_33240 ?auto_33238 ) ( AVAILABLE ?auto_33239 ) ( IN ?auto_33236 ?auto_33240 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33239 ?auto_33236 ?auto_33240 ?auto_33238 )
      ( MAKE-ON ?auto_33236 ?auto_33237 )
      ( MAKE-ON-VERIFY ?auto_33236 ?auto_33237 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33241 - SURFACE
      ?auto_33242 - SURFACE
    )
    :vars
    (
      ?auto_33244 - HOIST
      ?auto_33243 - PLACE
      ?auto_33245 - TRUCK
      ?auto_33246 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33244 ?auto_33243 ) ( SURFACE-AT ?auto_33242 ?auto_33243 ) ( CLEAR ?auto_33242 ) ( IS-CRATE ?auto_33241 ) ( not ( = ?auto_33241 ?auto_33242 ) ) ( AVAILABLE ?auto_33244 ) ( IN ?auto_33241 ?auto_33245 ) ( TRUCK-AT ?auto_33245 ?auto_33246 ) ( not ( = ?auto_33246 ?auto_33243 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33245 ?auto_33246 ?auto_33243 )
      ( MAKE-ON ?auto_33241 ?auto_33242 )
      ( MAKE-ON-VERIFY ?auto_33241 ?auto_33242 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33247 - SURFACE
      ?auto_33248 - SURFACE
    )
    :vars
    (
      ?auto_33252 - HOIST
      ?auto_33249 - PLACE
      ?auto_33251 - TRUCK
      ?auto_33250 - PLACE
      ?auto_33253 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33252 ?auto_33249 ) ( SURFACE-AT ?auto_33248 ?auto_33249 ) ( CLEAR ?auto_33248 ) ( IS-CRATE ?auto_33247 ) ( not ( = ?auto_33247 ?auto_33248 ) ) ( AVAILABLE ?auto_33252 ) ( TRUCK-AT ?auto_33251 ?auto_33250 ) ( not ( = ?auto_33250 ?auto_33249 ) ) ( HOIST-AT ?auto_33253 ?auto_33250 ) ( LIFTING ?auto_33253 ?auto_33247 ) ( not ( = ?auto_33252 ?auto_33253 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33253 ?auto_33247 ?auto_33251 ?auto_33250 )
      ( MAKE-ON ?auto_33247 ?auto_33248 )
      ( MAKE-ON-VERIFY ?auto_33247 ?auto_33248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33254 - SURFACE
      ?auto_33255 - SURFACE
    )
    :vars
    (
      ?auto_33258 - HOIST
      ?auto_33257 - PLACE
      ?auto_33260 - TRUCK
      ?auto_33259 - PLACE
      ?auto_33256 - HOIST
      ?auto_33261 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33258 ?auto_33257 ) ( SURFACE-AT ?auto_33255 ?auto_33257 ) ( CLEAR ?auto_33255 ) ( IS-CRATE ?auto_33254 ) ( not ( = ?auto_33254 ?auto_33255 ) ) ( AVAILABLE ?auto_33258 ) ( TRUCK-AT ?auto_33260 ?auto_33259 ) ( not ( = ?auto_33259 ?auto_33257 ) ) ( HOIST-AT ?auto_33256 ?auto_33259 ) ( not ( = ?auto_33258 ?auto_33256 ) ) ( AVAILABLE ?auto_33256 ) ( SURFACE-AT ?auto_33254 ?auto_33259 ) ( ON ?auto_33254 ?auto_33261 ) ( CLEAR ?auto_33254 ) ( not ( = ?auto_33254 ?auto_33261 ) ) ( not ( = ?auto_33255 ?auto_33261 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33256 ?auto_33254 ?auto_33261 ?auto_33259 )
      ( MAKE-ON ?auto_33254 ?auto_33255 )
      ( MAKE-ON-VERIFY ?auto_33254 ?auto_33255 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33262 - SURFACE
      ?auto_33263 - SURFACE
    )
    :vars
    (
      ?auto_33264 - HOIST
      ?auto_33269 - PLACE
      ?auto_33267 - PLACE
      ?auto_33268 - HOIST
      ?auto_33266 - SURFACE
      ?auto_33265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33264 ?auto_33269 ) ( SURFACE-AT ?auto_33263 ?auto_33269 ) ( CLEAR ?auto_33263 ) ( IS-CRATE ?auto_33262 ) ( not ( = ?auto_33262 ?auto_33263 ) ) ( AVAILABLE ?auto_33264 ) ( not ( = ?auto_33267 ?auto_33269 ) ) ( HOIST-AT ?auto_33268 ?auto_33267 ) ( not ( = ?auto_33264 ?auto_33268 ) ) ( AVAILABLE ?auto_33268 ) ( SURFACE-AT ?auto_33262 ?auto_33267 ) ( ON ?auto_33262 ?auto_33266 ) ( CLEAR ?auto_33262 ) ( not ( = ?auto_33262 ?auto_33266 ) ) ( not ( = ?auto_33263 ?auto_33266 ) ) ( TRUCK-AT ?auto_33265 ?auto_33269 ) )
    :subtasks
    ( ( !DRIVE ?auto_33265 ?auto_33269 ?auto_33267 )
      ( MAKE-ON ?auto_33262 ?auto_33263 )
      ( MAKE-ON-VERIFY ?auto_33262 ?auto_33263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33270 - SURFACE
      ?auto_33271 - SURFACE
    )
    :vars
    (
      ?auto_33276 - HOIST
      ?auto_33274 - PLACE
      ?auto_33273 - PLACE
      ?auto_33275 - HOIST
      ?auto_33272 - SURFACE
      ?auto_33277 - TRUCK
      ?auto_33278 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33276 ?auto_33274 ) ( IS-CRATE ?auto_33270 ) ( not ( = ?auto_33270 ?auto_33271 ) ) ( not ( = ?auto_33273 ?auto_33274 ) ) ( HOIST-AT ?auto_33275 ?auto_33273 ) ( not ( = ?auto_33276 ?auto_33275 ) ) ( AVAILABLE ?auto_33275 ) ( SURFACE-AT ?auto_33270 ?auto_33273 ) ( ON ?auto_33270 ?auto_33272 ) ( CLEAR ?auto_33270 ) ( not ( = ?auto_33270 ?auto_33272 ) ) ( not ( = ?auto_33271 ?auto_33272 ) ) ( TRUCK-AT ?auto_33277 ?auto_33274 ) ( SURFACE-AT ?auto_33278 ?auto_33274 ) ( CLEAR ?auto_33278 ) ( LIFTING ?auto_33276 ?auto_33271 ) ( IS-CRATE ?auto_33271 ) ( not ( = ?auto_33270 ?auto_33278 ) ) ( not ( = ?auto_33271 ?auto_33278 ) ) ( not ( = ?auto_33272 ?auto_33278 ) ) )
    :subtasks
    ( ( !DROP ?auto_33276 ?auto_33271 ?auto_33278 ?auto_33274 )
      ( MAKE-ON ?auto_33270 ?auto_33271 )
      ( MAKE-ON-VERIFY ?auto_33270 ?auto_33271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33279 - SURFACE
      ?auto_33280 - SURFACE
    )
    :vars
    (
      ?auto_33281 - HOIST
      ?auto_33285 - PLACE
      ?auto_33282 - PLACE
      ?auto_33286 - HOIST
      ?auto_33287 - SURFACE
      ?auto_33283 - TRUCK
      ?auto_33284 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33281 ?auto_33285 ) ( IS-CRATE ?auto_33279 ) ( not ( = ?auto_33279 ?auto_33280 ) ) ( not ( = ?auto_33282 ?auto_33285 ) ) ( HOIST-AT ?auto_33286 ?auto_33282 ) ( not ( = ?auto_33281 ?auto_33286 ) ) ( AVAILABLE ?auto_33286 ) ( SURFACE-AT ?auto_33279 ?auto_33282 ) ( ON ?auto_33279 ?auto_33287 ) ( CLEAR ?auto_33279 ) ( not ( = ?auto_33279 ?auto_33287 ) ) ( not ( = ?auto_33280 ?auto_33287 ) ) ( TRUCK-AT ?auto_33283 ?auto_33285 ) ( SURFACE-AT ?auto_33284 ?auto_33285 ) ( CLEAR ?auto_33284 ) ( IS-CRATE ?auto_33280 ) ( not ( = ?auto_33279 ?auto_33284 ) ) ( not ( = ?auto_33280 ?auto_33284 ) ) ( not ( = ?auto_33287 ?auto_33284 ) ) ( AVAILABLE ?auto_33281 ) ( IN ?auto_33280 ?auto_33283 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33281 ?auto_33280 ?auto_33283 ?auto_33285 )
      ( MAKE-ON ?auto_33279 ?auto_33280 )
      ( MAKE-ON-VERIFY ?auto_33279 ?auto_33280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33288 - SURFACE
      ?auto_33289 - SURFACE
    )
    :vars
    (
      ?auto_33296 - HOIST
      ?auto_33293 - PLACE
      ?auto_33294 - PLACE
      ?auto_33292 - HOIST
      ?auto_33290 - SURFACE
      ?auto_33295 - SURFACE
      ?auto_33291 - TRUCK
      ?auto_33297 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33296 ?auto_33293 ) ( IS-CRATE ?auto_33288 ) ( not ( = ?auto_33288 ?auto_33289 ) ) ( not ( = ?auto_33294 ?auto_33293 ) ) ( HOIST-AT ?auto_33292 ?auto_33294 ) ( not ( = ?auto_33296 ?auto_33292 ) ) ( AVAILABLE ?auto_33292 ) ( SURFACE-AT ?auto_33288 ?auto_33294 ) ( ON ?auto_33288 ?auto_33290 ) ( CLEAR ?auto_33288 ) ( not ( = ?auto_33288 ?auto_33290 ) ) ( not ( = ?auto_33289 ?auto_33290 ) ) ( SURFACE-AT ?auto_33295 ?auto_33293 ) ( CLEAR ?auto_33295 ) ( IS-CRATE ?auto_33289 ) ( not ( = ?auto_33288 ?auto_33295 ) ) ( not ( = ?auto_33289 ?auto_33295 ) ) ( not ( = ?auto_33290 ?auto_33295 ) ) ( AVAILABLE ?auto_33296 ) ( IN ?auto_33289 ?auto_33291 ) ( TRUCK-AT ?auto_33291 ?auto_33297 ) ( not ( = ?auto_33297 ?auto_33293 ) ) ( not ( = ?auto_33294 ?auto_33297 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33291 ?auto_33297 ?auto_33293 )
      ( MAKE-ON ?auto_33288 ?auto_33289 )
      ( MAKE-ON-VERIFY ?auto_33288 ?auto_33289 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33298 - SURFACE
      ?auto_33299 - SURFACE
    )
    :vars
    (
      ?auto_33307 - HOIST
      ?auto_33303 - PLACE
      ?auto_33301 - PLACE
      ?auto_33300 - HOIST
      ?auto_33302 - SURFACE
      ?auto_33306 - SURFACE
      ?auto_33305 - TRUCK
      ?auto_33304 - PLACE
      ?auto_33308 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33307 ?auto_33303 ) ( IS-CRATE ?auto_33298 ) ( not ( = ?auto_33298 ?auto_33299 ) ) ( not ( = ?auto_33301 ?auto_33303 ) ) ( HOIST-AT ?auto_33300 ?auto_33301 ) ( not ( = ?auto_33307 ?auto_33300 ) ) ( AVAILABLE ?auto_33300 ) ( SURFACE-AT ?auto_33298 ?auto_33301 ) ( ON ?auto_33298 ?auto_33302 ) ( CLEAR ?auto_33298 ) ( not ( = ?auto_33298 ?auto_33302 ) ) ( not ( = ?auto_33299 ?auto_33302 ) ) ( SURFACE-AT ?auto_33306 ?auto_33303 ) ( CLEAR ?auto_33306 ) ( IS-CRATE ?auto_33299 ) ( not ( = ?auto_33298 ?auto_33306 ) ) ( not ( = ?auto_33299 ?auto_33306 ) ) ( not ( = ?auto_33302 ?auto_33306 ) ) ( AVAILABLE ?auto_33307 ) ( TRUCK-AT ?auto_33305 ?auto_33304 ) ( not ( = ?auto_33304 ?auto_33303 ) ) ( not ( = ?auto_33301 ?auto_33304 ) ) ( HOIST-AT ?auto_33308 ?auto_33304 ) ( LIFTING ?auto_33308 ?auto_33299 ) ( not ( = ?auto_33307 ?auto_33308 ) ) ( not ( = ?auto_33300 ?auto_33308 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33308 ?auto_33299 ?auto_33305 ?auto_33304 )
      ( MAKE-ON ?auto_33298 ?auto_33299 )
      ( MAKE-ON-VERIFY ?auto_33298 ?auto_33299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33309 - SURFACE
      ?auto_33310 - SURFACE
    )
    :vars
    (
      ?auto_33316 - HOIST
      ?auto_33313 - PLACE
      ?auto_33314 - PLACE
      ?auto_33311 - HOIST
      ?auto_33318 - SURFACE
      ?auto_33317 - SURFACE
      ?auto_33319 - TRUCK
      ?auto_33312 - PLACE
      ?auto_33315 - HOIST
      ?auto_33320 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33316 ?auto_33313 ) ( IS-CRATE ?auto_33309 ) ( not ( = ?auto_33309 ?auto_33310 ) ) ( not ( = ?auto_33314 ?auto_33313 ) ) ( HOIST-AT ?auto_33311 ?auto_33314 ) ( not ( = ?auto_33316 ?auto_33311 ) ) ( AVAILABLE ?auto_33311 ) ( SURFACE-AT ?auto_33309 ?auto_33314 ) ( ON ?auto_33309 ?auto_33318 ) ( CLEAR ?auto_33309 ) ( not ( = ?auto_33309 ?auto_33318 ) ) ( not ( = ?auto_33310 ?auto_33318 ) ) ( SURFACE-AT ?auto_33317 ?auto_33313 ) ( CLEAR ?auto_33317 ) ( IS-CRATE ?auto_33310 ) ( not ( = ?auto_33309 ?auto_33317 ) ) ( not ( = ?auto_33310 ?auto_33317 ) ) ( not ( = ?auto_33318 ?auto_33317 ) ) ( AVAILABLE ?auto_33316 ) ( TRUCK-AT ?auto_33319 ?auto_33312 ) ( not ( = ?auto_33312 ?auto_33313 ) ) ( not ( = ?auto_33314 ?auto_33312 ) ) ( HOIST-AT ?auto_33315 ?auto_33312 ) ( not ( = ?auto_33316 ?auto_33315 ) ) ( not ( = ?auto_33311 ?auto_33315 ) ) ( AVAILABLE ?auto_33315 ) ( SURFACE-AT ?auto_33310 ?auto_33312 ) ( ON ?auto_33310 ?auto_33320 ) ( CLEAR ?auto_33310 ) ( not ( = ?auto_33309 ?auto_33320 ) ) ( not ( = ?auto_33310 ?auto_33320 ) ) ( not ( = ?auto_33318 ?auto_33320 ) ) ( not ( = ?auto_33317 ?auto_33320 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33315 ?auto_33310 ?auto_33320 ?auto_33312 )
      ( MAKE-ON ?auto_33309 ?auto_33310 )
      ( MAKE-ON-VERIFY ?auto_33309 ?auto_33310 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33321 - SURFACE
      ?auto_33322 - SURFACE
    )
    :vars
    (
      ?auto_33328 - HOIST
      ?auto_33332 - PLACE
      ?auto_33327 - PLACE
      ?auto_33326 - HOIST
      ?auto_33325 - SURFACE
      ?auto_33330 - SURFACE
      ?auto_33324 - PLACE
      ?auto_33329 - HOIST
      ?auto_33331 - SURFACE
      ?auto_33323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33328 ?auto_33332 ) ( IS-CRATE ?auto_33321 ) ( not ( = ?auto_33321 ?auto_33322 ) ) ( not ( = ?auto_33327 ?auto_33332 ) ) ( HOIST-AT ?auto_33326 ?auto_33327 ) ( not ( = ?auto_33328 ?auto_33326 ) ) ( AVAILABLE ?auto_33326 ) ( SURFACE-AT ?auto_33321 ?auto_33327 ) ( ON ?auto_33321 ?auto_33325 ) ( CLEAR ?auto_33321 ) ( not ( = ?auto_33321 ?auto_33325 ) ) ( not ( = ?auto_33322 ?auto_33325 ) ) ( SURFACE-AT ?auto_33330 ?auto_33332 ) ( CLEAR ?auto_33330 ) ( IS-CRATE ?auto_33322 ) ( not ( = ?auto_33321 ?auto_33330 ) ) ( not ( = ?auto_33322 ?auto_33330 ) ) ( not ( = ?auto_33325 ?auto_33330 ) ) ( AVAILABLE ?auto_33328 ) ( not ( = ?auto_33324 ?auto_33332 ) ) ( not ( = ?auto_33327 ?auto_33324 ) ) ( HOIST-AT ?auto_33329 ?auto_33324 ) ( not ( = ?auto_33328 ?auto_33329 ) ) ( not ( = ?auto_33326 ?auto_33329 ) ) ( AVAILABLE ?auto_33329 ) ( SURFACE-AT ?auto_33322 ?auto_33324 ) ( ON ?auto_33322 ?auto_33331 ) ( CLEAR ?auto_33322 ) ( not ( = ?auto_33321 ?auto_33331 ) ) ( not ( = ?auto_33322 ?auto_33331 ) ) ( not ( = ?auto_33325 ?auto_33331 ) ) ( not ( = ?auto_33330 ?auto_33331 ) ) ( TRUCK-AT ?auto_33323 ?auto_33332 ) )
    :subtasks
    ( ( !DRIVE ?auto_33323 ?auto_33332 ?auto_33324 )
      ( MAKE-ON ?auto_33321 ?auto_33322 )
      ( MAKE-ON-VERIFY ?auto_33321 ?auto_33322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33333 - SURFACE
      ?auto_33334 - SURFACE
    )
    :vars
    (
      ?auto_33337 - HOIST
      ?auto_33343 - PLACE
      ?auto_33342 - PLACE
      ?auto_33335 - HOIST
      ?auto_33336 - SURFACE
      ?auto_33341 - SURFACE
      ?auto_33344 - PLACE
      ?auto_33339 - HOIST
      ?auto_33338 - SURFACE
      ?auto_33340 - TRUCK
      ?auto_33345 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33337 ?auto_33343 ) ( IS-CRATE ?auto_33333 ) ( not ( = ?auto_33333 ?auto_33334 ) ) ( not ( = ?auto_33342 ?auto_33343 ) ) ( HOIST-AT ?auto_33335 ?auto_33342 ) ( not ( = ?auto_33337 ?auto_33335 ) ) ( AVAILABLE ?auto_33335 ) ( SURFACE-AT ?auto_33333 ?auto_33342 ) ( ON ?auto_33333 ?auto_33336 ) ( CLEAR ?auto_33333 ) ( not ( = ?auto_33333 ?auto_33336 ) ) ( not ( = ?auto_33334 ?auto_33336 ) ) ( IS-CRATE ?auto_33334 ) ( not ( = ?auto_33333 ?auto_33341 ) ) ( not ( = ?auto_33334 ?auto_33341 ) ) ( not ( = ?auto_33336 ?auto_33341 ) ) ( not ( = ?auto_33344 ?auto_33343 ) ) ( not ( = ?auto_33342 ?auto_33344 ) ) ( HOIST-AT ?auto_33339 ?auto_33344 ) ( not ( = ?auto_33337 ?auto_33339 ) ) ( not ( = ?auto_33335 ?auto_33339 ) ) ( AVAILABLE ?auto_33339 ) ( SURFACE-AT ?auto_33334 ?auto_33344 ) ( ON ?auto_33334 ?auto_33338 ) ( CLEAR ?auto_33334 ) ( not ( = ?auto_33333 ?auto_33338 ) ) ( not ( = ?auto_33334 ?auto_33338 ) ) ( not ( = ?auto_33336 ?auto_33338 ) ) ( not ( = ?auto_33341 ?auto_33338 ) ) ( TRUCK-AT ?auto_33340 ?auto_33343 ) ( SURFACE-AT ?auto_33345 ?auto_33343 ) ( CLEAR ?auto_33345 ) ( LIFTING ?auto_33337 ?auto_33341 ) ( IS-CRATE ?auto_33341 ) ( not ( = ?auto_33333 ?auto_33345 ) ) ( not ( = ?auto_33334 ?auto_33345 ) ) ( not ( = ?auto_33336 ?auto_33345 ) ) ( not ( = ?auto_33341 ?auto_33345 ) ) ( not ( = ?auto_33338 ?auto_33345 ) ) )
    :subtasks
    ( ( !DROP ?auto_33337 ?auto_33341 ?auto_33345 ?auto_33343 )
      ( MAKE-ON ?auto_33333 ?auto_33334 )
      ( MAKE-ON-VERIFY ?auto_33333 ?auto_33334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33346 - SURFACE
      ?auto_33347 - SURFACE
    )
    :vars
    (
      ?auto_33355 - HOIST
      ?auto_33349 - PLACE
      ?auto_33351 - PLACE
      ?auto_33356 - HOIST
      ?auto_33350 - SURFACE
      ?auto_33353 - SURFACE
      ?auto_33352 - PLACE
      ?auto_33358 - HOIST
      ?auto_33357 - SURFACE
      ?auto_33354 - TRUCK
      ?auto_33348 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33355 ?auto_33349 ) ( IS-CRATE ?auto_33346 ) ( not ( = ?auto_33346 ?auto_33347 ) ) ( not ( = ?auto_33351 ?auto_33349 ) ) ( HOIST-AT ?auto_33356 ?auto_33351 ) ( not ( = ?auto_33355 ?auto_33356 ) ) ( AVAILABLE ?auto_33356 ) ( SURFACE-AT ?auto_33346 ?auto_33351 ) ( ON ?auto_33346 ?auto_33350 ) ( CLEAR ?auto_33346 ) ( not ( = ?auto_33346 ?auto_33350 ) ) ( not ( = ?auto_33347 ?auto_33350 ) ) ( IS-CRATE ?auto_33347 ) ( not ( = ?auto_33346 ?auto_33353 ) ) ( not ( = ?auto_33347 ?auto_33353 ) ) ( not ( = ?auto_33350 ?auto_33353 ) ) ( not ( = ?auto_33352 ?auto_33349 ) ) ( not ( = ?auto_33351 ?auto_33352 ) ) ( HOIST-AT ?auto_33358 ?auto_33352 ) ( not ( = ?auto_33355 ?auto_33358 ) ) ( not ( = ?auto_33356 ?auto_33358 ) ) ( AVAILABLE ?auto_33358 ) ( SURFACE-AT ?auto_33347 ?auto_33352 ) ( ON ?auto_33347 ?auto_33357 ) ( CLEAR ?auto_33347 ) ( not ( = ?auto_33346 ?auto_33357 ) ) ( not ( = ?auto_33347 ?auto_33357 ) ) ( not ( = ?auto_33350 ?auto_33357 ) ) ( not ( = ?auto_33353 ?auto_33357 ) ) ( TRUCK-AT ?auto_33354 ?auto_33349 ) ( SURFACE-AT ?auto_33348 ?auto_33349 ) ( CLEAR ?auto_33348 ) ( IS-CRATE ?auto_33353 ) ( not ( = ?auto_33346 ?auto_33348 ) ) ( not ( = ?auto_33347 ?auto_33348 ) ) ( not ( = ?auto_33350 ?auto_33348 ) ) ( not ( = ?auto_33353 ?auto_33348 ) ) ( not ( = ?auto_33357 ?auto_33348 ) ) ( AVAILABLE ?auto_33355 ) ( IN ?auto_33353 ?auto_33354 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33355 ?auto_33353 ?auto_33354 ?auto_33349 )
      ( MAKE-ON ?auto_33346 ?auto_33347 )
      ( MAKE-ON-VERIFY ?auto_33346 ?auto_33347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33359 - SURFACE
      ?auto_33360 - SURFACE
    )
    :vars
    (
      ?auto_33366 - HOIST
      ?auto_33364 - PLACE
      ?auto_33363 - PLACE
      ?auto_33365 - HOIST
      ?auto_33370 - SURFACE
      ?auto_33368 - SURFACE
      ?auto_33361 - PLACE
      ?auto_33362 - HOIST
      ?auto_33371 - SURFACE
      ?auto_33367 - SURFACE
      ?auto_33369 - TRUCK
      ?auto_33372 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33366 ?auto_33364 ) ( IS-CRATE ?auto_33359 ) ( not ( = ?auto_33359 ?auto_33360 ) ) ( not ( = ?auto_33363 ?auto_33364 ) ) ( HOIST-AT ?auto_33365 ?auto_33363 ) ( not ( = ?auto_33366 ?auto_33365 ) ) ( AVAILABLE ?auto_33365 ) ( SURFACE-AT ?auto_33359 ?auto_33363 ) ( ON ?auto_33359 ?auto_33370 ) ( CLEAR ?auto_33359 ) ( not ( = ?auto_33359 ?auto_33370 ) ) ( not ( = ?auto_33360 ?auto_33370 ) ) ( IS-CRATE ?auto_33360 ) ( not ( = ?auto_33359 ?auto_33368 ) ) ( not ( = ?auto_33360 ?auto_33368 ) ) ( not ( = ?auto_33370 ?auto_33368 ) ) ( not ( = ?auto_33361 ?auto_33364 ) ) ( not ( = ?auto_33363 ?auto_33361 ) ) ( HOIST-AT ?auto_33362 ?auto_33361 ) ( not ( = ?auto_33366 ?auto_33362 ) ) ( not ( = ?auto_33365 ?auto_33362 ) ) ( AVAILABLE ?auto_33362 ) ( SURFACE-AT ?auto_33360 ?auto_33361 ) ( ON ?auto_33360 ?auto_33371 ) ( CLEAR ?auto_33360 ) ( not ( = ?auto_33359 ?auto_33371 ) ) ( not ( = ?auto_33360 ?auto_33371 ) ) ( not ( = ?auto_33370 ?auto_33371 ) ) ( not ( = ?auto_33368 ?auto_33371 ) ) ( SURFACE-AT ?auto_33367 ?auto_33364 ) ( CLEAR ?auto_33367 ) ( IS-CRATE ?auto_33368 ) ( not ( = ?auto_33359 ?auto_33367 ) ) ( not ( = ?auto_33360 ?auto_33367 ) ) ( not ( = ?auto_33370 ?auto_33367 ) ) ( not ( = ?auto_33368 ?auto_33367 ) ) ( not ( = ?auto_33371 ?auto_33367 ) ) ( AVAILABLE ?auto_33366 ) ( IN ?auto_33368 ?auto_33369 ) ( TRUCK-AT ?auto_33369 ?auto_33372 ) ( not ( = ?auto_33372 ?auto_33364 ) ) ( not ( = ?auto_33363 ?auto_33372 ) ) ( not ( = ?auto_33361 ?auto_33372 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33369 ?auto_33372 ?auto_33364 )
      ( MAKE-ON ?auto_33359 ?auto_33360 )
      ( MAKE-ON-VERIFY ?auto_33359 ?auto_33360 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33373 - SURFACE
      ?auto_33374 - SURFACE
    )
    :vars
    (
      ?auto_33378 - HOIST
      ?auto_33379 - PLACE
      ?auto_33383 - PLACE
      ?auto_33386 - HOIST
      ?auto_33384 - SURFACE
      ?auto_33381 - SURFACE
      ?auto_33382 - PLACE
      ?auto_33380 - HOIST
      ?auto_33385 - SURFACE
      ?auto_33377 - SURFACE
      ?auto_33376 - TRUCK
      ?auto_33375 - PLACE
      ?auto_33387 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33378 ?auto_33379 ) ( IS-CRATE ?auto_33373 ) ( not ( = ?auto_33373 ?auto_33374 ) ) ( not ( = ?auto_33383 ?auto_33379 ) ) ( HOIST-AT ?auto_33386 ?auto_33383 ) ( not ( = ?auto_33378 ?auto_33386 ) ) ( AVAILABLE ?auto_33386 ) ( SURFACE-AT ?auto_33373 ?auto_33383 ) ( ON ?auto_33373 ?auto_33384 ) ( CLEAR ?auto_33373 ) ( not ( = ?auto_33373 ?auto_33384 ) ) ( not ( = ?auto_33374 ?auto_33384 ) ) ( IS-CRATE ?auto_33374 ) ( not ( = ?auto_33373 ?auto_33381 ) ) ( not ( = ?auto_33374 ?auto_33381 ) ) ( not ( = ?auto_33384 ?auto_33381 ) ) ( not ( = ?auto_33382 ?auto_33379 ) ) ( not ( = ?auto_33383 ?auto_33382 ) ) ( HOIST-AT ?auto_33380 ?auto_33382 ) ( not ( = ?auto_33378 ?auto_33380 ) ) ( not ( = ?auto_33386 ?auto_33380 ) ) ( AVAILABLE ?auto_33380 ) ( SURFACE-AT ?auto_33374 ?auto_33382 ) ( ON ?auto_33374 ?auto_33385 ) ( CLEAR ?auto_33374 ) ( not ( = ?auto_33373 ?auto_33385 ) ) ( not ( = ?auto_33374 ?auto_33385 ) ) ( not ( = ?auto_33384 ?auto_33385 ) ) ( not ( = ?auto_33381 ?auto_33385 ) ) ( SURFACE-AT ?auto_33377 ?auto_33379 ) ( CLEAR ?auto_33377 ) ( IS-CRATE ?auto_33381 ) ( not ( = ?auto_33373 ?auto_33377 ) ) ( not ( = ?auto_33374 ?auto_33377 ) ) ( not ( = ?auto_33384 ?auto_33377 ) ) ( not ( = ?auto_33381 ?auto_33377 ) ) ( not ( = ?auto_33385 ?auto_33377 ) ) ( AVAILABLE ?auto_33378 ) ( TRUCK-AT ?auto_33376 ?auto_33375 ) ( not ( = ?auto_33375 ?auto_33379 ) ) ( not ( = ?auto_33383 ?auto_33375 ) ) ( not ( = ?auto_33382 ?auto_33375 ) ) ( HOIST-AT ?auto_33387 ?auto_33375 ) ( LIFTING ?auto_33387 ?auto_33381 ) ( not ( = ?auto_33378 ?auto_33387 ) ) ( not ( = ?auto_33386 ?auto_33387 ) ) ( not ( = ?auto_33380 ?auto_33387 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33387 ?auto_33381 ?auto_33376 ?auto_33375 )
      ( MAKE-ON ?auto_33373 ?auto_33374 )
      ( MAKE-ON-VERIFY ?auto_33373 ?auto_33374 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33388 - SURFACE
      ?auto_33389 - SURFACE
    )
    :vars
    (
      ?auto_33397 - HOIST
      ?auto_33398 - PLACE
      ?auto_33391 - PLACE
      ?auto_33399 - HOIST
      ?auto_33390 - SURFACE
      ?auto_33395 - SURFACE
      ?auto_33392 - PLACE
      ?auto_33402 - HOIST
      ?auto_33394 - SURFACE
      ?auto_33401 - SURFACE
      ?auto_33396 - TRUCK
      ?auto_33400 - PLACE
      ?auto_33393 - HOIST
      ?auto_33403 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33397 ?auto_33398 ) ( IS-CRATE ?auto_33388 ) ( not ( = ?auto_33388 ?auto_33389 ) ) ( not ( = ?auto_33391 ?auto_33398 ) ) ( HOIST-AT ?auto_33399 ?auto_33391 ) ( not ( = ?auto_33397 ?auto_33399 ) ) ( AVAILABLE ?auto_33399 ) ( SURFACE-AT ?auto_33388 ?auto_33391 ) ( ON ?auto_33388 ?auto_33390 ) ( CLEAR ?auto_33388 ) ( not ( = ?auto_33388 ?auto_33390 ) ) ( not ( = ?auto_33389 ?auto_33390 ) ) ( IS-CRATE ?auto_33389 ) ( not ( = ?auto_33388 ?auto_33395 ) ) ( not ( = ?auto_33389 ?auto_33395 ) ) ( not ( = ?auto_33390 ?auto_33395 ) ) ( not ( = ?auto_33392 ?auto_33398 ) ) ( not ( = ?auto_33391 ?auto_33392 ) ) ( HOIST-AT ?auto_33402 ?auto_33392 ) ( not ( = ?auto_33397 ?auto_33402 ) ) ( not ( = ?auto_33399 ?auto_33402 ) ) ( AVAILABLE ?auto_33402 ) ( SURFACE-AT ?auto_33389 ?auto_33392 ) ( ON ?auto_33389 ?auto_33394 ) ( CLEAR ?auto_33389 ) ( not ( = ?auto_33388 ?auto_33394 ) ) ( not ( = ?auto_33389 ?auto_33394 ) ) ( not ( = ?auto_33390 ?auto_33394 ) ) ( not ( = ?auto_33395 ?auto_33394 ) ) ( SURFACE-AT ?auto_33401 ?auto_33398 ) ( CLEAR ?auto_33401 ) ( IS-CRATE ?auto_33395 ) ( not ( = ?auto_33388 ?auto_33401 ) ) ( not ( = ?auto_33389 ?auto_33401 ) ) ( not ( = ?auto_33390 ?auto_33401 ) ) ( not ( = ?auto_33395 ?auto_33401 ) ) ( not ( = ?auto_33394 ?auto_33401 ) ) ( AVAILABLE ?auto_33397 ) ( TRUCK-AT ?auto_33396 ?auto_33400 ) ( not ( = ?auto_33400 ?auto_33398 ) ) ( not ( = ?auto_33391 ?auto_33400 ) ) ( not ( = ?auto_33392 ?auto_33400 ) ) ( HOIST-AT ?auto_33393 ?auto_33400 ) ( not ( = ?auto_33397 ?auto_33393 ) ) ( not ( = ?auto_33399 ?auto_33393 ) ) ( not ( = ?auto_33402 ?auto_33393 ) ) ( AVAILABLE ?auto_33393 ) ( SURFACE-AT ?auto_33395 ?auto_33400 ) ( ON ?auto_33395 ?auto_33403 ) ( CLEAR ?auto_33395 ) ( not ( = ?auto_33388 ?auto_33403 ) ) ( not ( = ?auto_33389 ?auto_33403 ) ) ( not ( = ?auto_33390 ?auto_33403 ) ) ( not ( = ?auto_33395 ?auto_33403 ) ) ( not ( = ?auto_33394 ?auto_33403 ) ) ( not ( = ?auto_33401 ?auto_33403 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33393 ?auto_33395 ?auto_33403 ?auto_33400 )
      ( MAKE-ON ?auto_33388 ?auto_33389 )
      ( MAKE-ON-VERIFY ?auto_33388 ?auto_33389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33404 - SURFACE
      ?auto_33405 - SURFACE
    )
    :vars
    (
      ?auto_33415 - HOIST
      ?auto_33409 - PLACE
      ?auto_33414 - PLACE
      ?auto_33408 - HOIST
      ?auto_33406 - SURFACE
      ?auto_33407 - SURFACE
      ?auto_33416 - PLACE
      ?auto_33418 - HOIST
      ?auto_33412 - SURFACE
      ?auto_33410 - SURFACE
      ?auto_33411 - PLACE
      ?auto_33413 - HOIST
      ?auto_33417 - SURFACE
      ?auto_33419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33415 ?auto_33409 ) ( IS-CRATE ?auto_33404 ) ( not ( = ?auto_33404 ?auto_33405 ) ) ( not ( = ?auto_33414 ?auto_33409 ) ) ( HOIST-AT ?auto_33408 ?auto_33414 ) ( not ( = ?auto_33415 ?auto_33408 ) ) ( AVAILABLE ?auto_33408 ) ( SURFACE-AT ?auto_33404 ?auto_33414 ) ( ON ?auto_33404 ?auto_33406 ) ( CLEAR ?auto_33404 ) ( not ( = ?auto_33404 ?auto_33406 ) ) ( not ( = ?auto_33405 ?auto_33406 ) ) ( IS-CRATE ?auto_33405 ) ( not ( = ?auto_33404 ?auto_33407 ) ) ( not ( = ?auto_33405 ?auto_33407 ) ) ( not ( = ?auto_33406 ?auto_33407 ) ) ( not ( = ?auto_33416 ?auto_33409 ) ) ( not ( = ?auto_33414 ?auto_33416 ) ) ( HOIST-AT ?auto_33418 ?auto_33416 ) ( not ( = ?auto_33415 ?auto_33418 ) ) ( not ( = ?auto_33408 ?auto_33418 ) ) ( AVAILABLE ?auto_33418 ) ( SURFACE-AT ?auto_33405 ?auto_33416 ) ( ON ?auto_33405 ?auto_33412 ) ( CLEAR ?auto_33405 ) ( not ( = ?auto_33404 ?auto_33412 ) ) ( not ( = ?auto_33405 ?auto_33412 ) ) ( not ( = ?auto_33406 ?auto_33412 ) ) ( not ( = ?auto_33407 ?auto_33412 ) ) ( SURFACE-AT ?auto_33410 ?auto_33409 ) ( CLEAR ?auto_33410 ) ( IS-CRATE ?auto_33407 ) ( not ( = ?auto_33404 ?auto_33410 ) ) ( not ( = ?auto_33405 ?auto_33410 ) ) ( not ( = ?auto_33406 ?auto_33410 ) ) ( not ( = ?auto_33407 ?auto_33410 ) ) ( not ( = ?auto_33412 ?auto_33410 ) ) ( AVAILABLE ?auto_33415 ) ( not ( = ?auto_33411 ?auto_33409 ) ) ( not ( = ?auto_33414 ?auto_33411 ) ) ( not ( = ?auto_33416 ?auto_33411 ) ) ( HOIST-AT ?auto_33413 ?auto_33411 ) ( not ( = ?auto_33415 ?auto_33413 ) ) ( not ( = ?auto_33408 ?auto_33413 ) ) ( not ( = ?auto_33418 ?auto_33413 ) ) ( AVAILABLE ?auto_33413 ) ( SURFACE-AT ?auto_33407 ?auto_33411 ) ( ON ?auto_33407 ?auto_33417 ) ( CLEAR ?auto_33407 ) ( not ( = ?auto_33404 ?auto_33417 ) ) ( not ( = ?auto_33405 ?auto_33417 ) ) ( not ( = ?auto_33406 ?auto_33417 ) ) ( not ( = ?auto_33407 ?auto_33417 ) ) ( not ( = ?auto_33412 ?auto_33417 ) ) ( not ( = ?auto_33410 ?auto_33417 ) ) ( TRUCK-AT ?auto_33419 ?auto_33409 ) )
    :subtasks
    ( ( !DRIVE ?auto_33419 ?auto_33409 ?auto_33411 )
      ( MAKE-ON ?auto_33404 ?auto_33405 )
      ( MAKE-ON-VERIFY ?auto_33404 ?auto_33405 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33420 - SURFACE
      ?auto_33421 - SURFACE
    )
    :vars
    (
      ?auto_33432 - HOIST
      ?auto_33424 - PLACE
      ?auto_33429 - PLACE
      ?auto_33427 - HOIST
      ?auto_33435 - SURFACE
      ?auto_33431 - SURFACE
      ?auto_33422 - PLACE
      ?auto_33433 - HOIST
      ?auto_33426 - SURFACE
      ?auto_33434 - SURFACE
      ?auto_33425 - PLACE
      ?auto_33430 - HOIST
      ?auto_33423 - SURFACE
      ?auto_33428 - TRUCK
      ?auto_33436 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33432 ?auto_33424 ) ( IS-CRATE ?auto_33420 ) ( not ( = ?auto_33420 ?auto_33421 ) ) ( not ( = ?auto_33429 ?auto_33424 ) ) ( HOIST-AT ?auto_33427 ?auto_33429 ) ( not ( = ?auto_33432 ?auto_33427 ) ) ( AVAILABLE ?auto_33427 ) ( SURFACE-AT ?auto_33420 ?auto_33429 ) ( ON ?auto_33420 ?auto_33435 ) ( CLEAR ?auto_33420 ) ( not ( = ?auto_33420 ?auto_33435 ) ) ( not ( = ?auto_33421 ?auto_33435 ) ) ( IS-CRATE ?auto_33421 ) ( not ( = ?auto_33420 ?auto_33431 ) ) ( not ( = ?auto_33421 ?auto_33431 ) ) ( not ( = ?auto_33435 ?auto_33431 ) ) ( not ( = ?auto_33422 ?auto_33424 ) ) ( not ( = ?auto_33429 ?auto_33422 ) ) ( HOIST-AT ?auto_33433 ?auto_33422 ) ( not ( = ?auto_33432 ?auto_33433 ) ) ( not ( = ?auto_33427 ?auto_33433 ) ) ( AVAILABLE ?auto_33433 ) ( SURFACE-AT ?auto_33421 ?auto_33422 ) ( ON ?auto_33421 ?auto_33426 ) ( CLEAR ?auto_33421 ) ( not ( = ?auto_33420 ?auto_33426 ) ) ( not ( = ?auto_33421 ?auto_33426 ) ) ( not ( = ?auto_33435 ?auto_33426 ) ) ( not ( = ?auto_33431 ?auto_33426 ) ) ( IS-CRATE ?auto_33431 ) ( not ( = ?auto_33420 ?auto_33434 ) ) ( not ( = ?auto_33421 ?auto_33434 ) ) ( not ( = ?auto_33435 ?auto_33434 ) ) ( not ( = ?auto_33431 ?auto_33434 ) ) ( not ( = ?auto_33426 ?auto_33434 ) ) ( not ( = ?auto_33425 ?auto_33424 ) ) ( not ( = ?auto_33429 ?auto_33425 ) ) ( not ( = ?auto_33422 ?auto_33425 ) ) ( HOIST-AT ?auto_33430 ?auto_33425 ) ( not ( = ?auto_33432 ?auto_33430 ) ) ( not ( = ?auto_33427 ?auto_33430 ) ) ( not ( = ?auto_33433 ?auto_33430 ) ) ( AVAILABLE ?auto_33430 ) ( SURFACE-AT ?auto_33431 ?auto_33425 ) ( ON ?auto_33431 ?auto_33423 ) ( CLEAR ?auto_33431 ) ( not ( = ?auto_33420 ?auto_33423 ) ) ( not ( = ?auto_33421 ?auto_33423 ) ) ( not ( = ?auto_33435 ?auto_33423 ) ) ( not ( = ?auto_33431 ?auto_33423 ) ) ( not ( = ?auto_33426 ?auto_33423 ) ) ( not ( = ?auto_33434 ?auto_33423 ) ) ( TRUCK-AT ?auto_33428 ?auto_33424 ) ( SURFACE-AT ?auto_33436 ?auto_33424 ) ( CLEAR ?auto_33436 ) ( LIFTING ?auto_33432 ?auto_33434 ) ( IS-CRATE ?auto_33434 ) ( not ( = ?auto_33420 ?auto_33436 ) ) ( not ( = ?auto_33421 ?auto_33436 ) ) ( not ( = ?auto_33435 ?auto_33436 ) ) ( not ( = ?auto_33431 ?auto_33436 ) ) ( not ( = ?auto_33426 ?auto_33436 ) ) ( not ( = ?auto_33434 ?auto_33436 ) ) ( not ( = ?auto_33423 ?auto_33436 ) ) )
    :subtasks
    ( ( !DROP ?auto_33432 ?auto_33434 ?auto_33436 ?auto_33424 )
      ( MAKE-ON ?auto_33420 ?auto_33421 )
      ( MAKE-ON-VERIFY ?auto_33420 ?auto_33421 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33437 - SURFACE
      ?auto_33438 - SURFACE
    )
    :vars
    (
      ?auto_33445 - HOIST
      ?auto_33450 - PLACE
      ?auto_33443 - PLACE
      ?auto_33452 - HOIST
      ?auto_33451 - SURFACE
      ?auto_33440 - SURFACE
      ?auto_33448 - PLACE
      ?auto_33439 - HOIST
      ?auto_33453 - SURFACE
      ?auto_33449 - SURFACE
      ?auto_33446 - PLACE
      ?auto_33444 - HOIST
      ?auto_33441 - SURFACE
      ?auto_33442 - TRUCK
      ?auto_33447 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33445 ?auto_33450 ) ( IS-CRATE ?auto_33437 ) ( not ( = ?auto_33437 ?auto_33438 ) ) ( not ( = ?auto_33443 ?auto_33450 ) ) ( HOIST-AT ?auto_33452 ?auto_33443 ) ( not ( = ?auto_33445 ?auto_33452 ) ) ( AVAILABLE ?auto_33452 ) ( SURFACE-AT ?auto_33437 ?auto_33443 ) ( ON ?auto_33437 ?auto_33451 ) ( CLEAR ?auto_33437 ) ( not ( = ?auto_33437 ?auto_33451 ) ) ( not ( = ?auto_33438 ?auto_33451 ) ) ( IS-CRATE ?auto_33438 ) ( not ( = ?auto_33437 ?auto_33440 ) ) ( not ( = ?auto_33438 ?auto_33440 ) ) ( not ( = ?auto_33451 ?auto_33440 ) ) ( not ( = ?auto_33448 ?auto_33450 ) ) ( not ( = ?auto_33443 ?auto_33448 ) ) ( HOIST-AT ?auto_33439 ?auto_33448 ) ( not ( = ?auto_33445 ?auto_33439 ) ) ( not ( = ?auto_33452 ?auto_33439 ) ) ( AVAILABLE ?auto_33439 ) ( SURFACE-AT ?auto_33438 ?auto_33448 ) ( ON ?auto_33438 ?auto_33453 ) ( CLEAR ?auto_33438 ) ( not ( = ?auto_33437 ?auto_33453 ) ) ( not ( = ?auto_33438 ?auto_33453 ) ) ( not ( = ?auto_33451 ?auto_33453 ) ) ( not ( = ?auto_33440 ?auto_33453 ) ) ( IS-CRATE ?auto_33440 ) ( not ( = ?auto_33437 ?auto_33449 ) ) ( not ( = ?auto_33438 ?auto_33449 ) ) ( not ( = ?auto_33451 ?auto_33449 ) ) ( not ( = ?auto_33440 ?auto_33449 ) ) ( not ( = ?auto_33453 ?auto_33449 ) ) ( not ( = ?auto_33446 ?auto_33450 ) ) ( not ( = ?auto_33443 ?auto_33446 ) ) ( not ( = ?auto_33448 ?auto_33446 ) ) ( HOIST-AT ?auto_33444 ?auto_33446 ) ( not ( = ?auto_33445 ?auto_33444 ) ) ( not ( = ?auto_33452 ?auto_33444 ) ) ( not ( = ?auto_33439 ?auto_33444 ) ) ( AVAILABLE ?auto_33444 ) ( SURFACE-AT ?auto_33440 ?auto_33446 ) ( ON ?auto_33440 ?auto_33441 ) ( CLEAR ?auto_33440 ) ( not ( = ?auto_33437 ?auto_33441 ) ) ( not ( = ?auto_33438 ?auto_33441 ) ) ( not ( = ?auto_33451 ?auto_33441 ) ) ( not ( = ?auto_33440 ?auto_33441 ) ) ( not ( = ?auto_33453 ?auto_33441 ) ) ( not ( = ?auto_33449 ?auto_33441 ) ) ( TRUCK-AT ?auto_33442 ?auto_33450 ) ( SURFACE-AT ?auto_33447 ?auto_33450 ) ( CLEAR ?auto_33447 ) ( IS-CRATE ?auto_33449 ) ( not ( = ?auto_33437 ?auto_33447 ) ) ( not ( = ?auto_33438 ?auto_33447 ) ) ( not ( = ?auto_33451 ?auto_33447 ) ) ( not ( = ?auto_33440 ?auto_33447 ) ) ( not ( = ?auto_33453 ?auto_33447 ) ) ( not ( = ?auto_33449 ?auto_33447 ) ) ( not ( = ?auto_33441 ?auto_33447 ) ) ( AVAILABLE ?auto_33445 ) ( IN ?auto_33449 ?auto_33442 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33445 ?auto_33449 ?auto_33442 ?auto_33450 )
      ( MAKE-ON ?auto_33437 ?auto_33438 )
      ( MAKE-ON-VERIFY ?auto_33437 ?auto_33438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33454 - SURFACE
      ?auto_33455 - SURFACE
    )
    :vars
    (
      ?auto_33460 - HOIST
      ?auto_33462 - PLACE
      ?auto_33459 - PLACE
      ?auto_33463 - HOIST
      ?auto_33468 - SURFACE
      ?auto_33456 - SURFACE
      ?auto_33470 - PLACE
      ?auto_33457 - HOIST
      ?auto_33465 - SURFACE
      ?auto_33461 - SURFACE
      ?auto_33467 - PLACE
      ?auto_33466 - HOIST
      ?auto_33464 - SURFACE
      ?auto_33469 - SURFACE
      ?auto_33458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33460 ?auto_33462 ) ( IS-CRATE ?auto_33454 ) ( not ( = ?auto_33454 ?auto_33455 ) ) ( not ( = ?auto_33459 ?auto_33462 ) ) ( HOIST-AT ?auto_33463 ?auto_33459 ) ( not ( = ?auto_33460 ?auto_33463 ) ) ( AVAILABLE ?auto_33463 ) ( SURFACE-AT ?auto_33454 ?auto_33459 ) ( ON ?auto_33454 ?auto_33468 ) ( CLEAR ?auto_33454 ) ( not ( = ?auto_33454 ?auto_33468 ) ) ( not ( = ?auto_33455 ?auto_33468 ) ) ( IS-CRATE ?auto_33455 ) ( not ( = ?auto_33454 ?auto_33456 ) ) ( not ( = ?auto_33455 ?auto_33456 ) ) ( not ( = ?auto_33468 ?auto_33456 ) ) ( not ( = ?auto_33470 ?auto_33462 ) ) ( not ( = ?auto_33459 ?auto_33470 ) ) ( HOIST-AT ?auto_33457 ?auto_33470 ) ( not ( = ?auto_33460 ?auto_33457 ) ) ( not ( = ?auto_33463 ?auto_33457 ) ) ( AVAILABLE ?auto_33457 ) ( SURFACE-AT ?auto_33455 ?auto_33470 ) ( ON ?auto_33455 ?auto_33465 ) ( CLEAR ?auto_33455 ) ( not ( = ?auto_33454 ?auto_33465 ) ) ( not ( = ?auto_33455 ?auto_33465 ) ) ( not ( = ?auto_33468 ?auto_33465 ) ) ( not ( = ?auto_33456 ?auto_33465 ) ) ( IS-CRATE ?auto_33456 ) ( not ( = ?auto_33454 ?auto_33461 ) ) ( not ( = ?auto_33455 ?auto_33461 ) ) ( not ( = ?auto_33468 ?auto_33461 ) ) ( not ( = ?auto_33456 ?auto_33461 ) ) ( not ( = ?auto_33465 ?auto_33461 ) ) ( not ( = ?auto_33467 ?auto_33462 ) ) ( not ( = ?auto_33459 ?auto_33467 ) ) ( not ( = ?auto_33470 ?auto_33467 ) ) ( HOIST-AT ?auto_33466 ?auto_33467 ) ( not ( = ?auto_33460 ?auto_33466 ) ) ( not ( = ?auto_33463 ?auto_33466 ) ) ( not ( = ?auto_33457 ?auto_33466 ) ) ( AVAILABLE ?auto_33466 ) ( SURFACE-AT ?auto_33456 ?auto_33467 ) ( ON ?auto_33456 ?auto_33464 ) ( CLEAR ?auto_33456 ) ( not ( = ?auto_33454 ?auto_33464 ) ) ( not ( = ?auto_33455 ?auto_33464 ) ) ( not ( = ?auto_33468 ?auto_33464 ) ) ( not ( = ?auto_33456 ?auto_33464 ) ) ( not ( = ?auto_33465 ?auto_33464 ) ) ( not ( = ?auto_33461 ?auto_33464 ) ) ( SURFACE-AT ?auto_33469 ?auto_33462 ) ( CLEAR ?auto_33469 ) ( IS-CRATE ?auto_33461 ) ( not ( = ?auto_33454 ?auto_33469 ) ) ( not ( = ?auto_33455 ?auto_33469 ) ) ( not ( = ?auto_33468 ?auto_33469 ) ) ( not ( = ?auto_33456 ?auto_33469 ) ) ( not ( = ?auto_33465 ?auto_33469 ) ) ( not ( = ?auto_33461 ?auto_33469 ) ) ( not ( = ?auto_33464 ?auto_33469 ) ) ( AVAILABLE ?auto_33460 ) ( IN ?auto_33461 ?auto_33458 ) ( TRUCK-AT ?auto_33458 ?auto_33470 ) )
    :subtasks
    ( ( !DRIVE ?auto_33458 ?auto_33470 ?auto_33462 )
      ( MAKE-ON ?auto_33454 ?auto_33455 )
      ( MAKE-ON-VERIFY ?auto_33454 ?auto_33455 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33471 - SURFACE
      ?auto_33472 - SURFACE
    )
    :vars
    (
      ?auto_33481 - HOIST
      ?auto_33486 - PLACE
      ?auto_33485 - PLACE
      ?auto_33487 - HOIST
      ?auto_33477 - SURFACE
      ?auto_33483 - SURFACE
      ?auto_33476 - PLACE
      ?auto_33484 - HOIST
      ?auto_33480 - SURFACE
      ?auto_33479 - SURFACE
      ?auto_33482 - PLACE
      ?auto_33478 - HOIST
      ?auto_33473 - SURFACE
      ?auto_33475 - SURFACE
      ?auto_33474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33481 ?auto_33486 ) ( IS-CRATE ?auto_33471 ) ( not ( = ?auto_33471 ?auto_33472 ) ) ( not ( = ?auto_33485 ?auto_33486 ) ) ( HOIST-AT ?auto_33487 ?auto_33485 ) ( not ( = ?auto_33481 ?auto_33487 ) ) ( AVAILABLE ?auto_33487 ) ( SURFACE-AT ?auto_33471 ?auto_33485 ) ( ON ?auto_33471 ?auto_33477 ) ( CLEAR ?auto_33471 ) ( not ( = ?auto_33471 ?auto_33477 ) ) ( not ( = ?auto_33472 ?auto_33477 ) ) ( IS-CRATE ?auto_33472 ) ( not ( = ?auto_33471 ?auto_33483 ) ) ( not ( = ?auto_33472 ?auto_33483 ) ) ( not ( = ?auto_33477 ?auto_33483 ) ) ( not ( = ?auto_33476 ?auto_33486 ) ) ( not ( = ?auto_33485 ?auto_33476 ) ) ( HOIST-AT ?auto_33484 ?auto_33476 ) ( not ( = ?auto_33481 ?auto_33484 ) ) ( not ( = ?auto_33487 ?auto_33484 ) ) ( SURFACE-AT ?auto_33472 ?auto_33476 ) ( ON ?auto_33472 ?auto_33480 ) ( CLEAR ?auto_33472 ) ( not ( = ?auto_33471 ?auto_33480 ) ) ( not ( = ?auto_33472 ?auto_33480 ) ) ( not ( = ?auto_33477 ?auto_33480 ) ) ( not ( = ?auto_33483 ?auto_33480 ) ) ( IS-CRATE ?auto_33483 ) ( not ( = ?auto_33471 ?auto_33479 ) ) ( not ( = ?auto_33472 ?auto_33479 ) ) ( not ( = ?auto_33477 ?auto_33479 ) ) ( not ( = ?auto_33483 ?auto_33479 ) ) ( not ( = ?auto_33480 ?auto_33479 ) ) ( not ( = ?auto_33482 ?auto_33486 ) ) ( not ( = ?auto_33485 ?auto_33482 ) ) ( not ( = ?auto_33476 ?auto_33482 ) ) ( HOIST-AT ?auto_33478 ?auto_33482 ) ( not ( = ?auto_33481 ?auto_33478 ) ) ( not ( = ?auto_33487 ?auto_33478 ) ) ( not ( = ?auto_33484 ?auto_33478 ) ) ( AVAILABLE ?auto_33478 ) ( SURFACE-AT ?auto_33483 ?auto_33482 ) ( ON ?auto_33483 ?auto_33473 ) ( CLEAR ?auto_33483 ) ( not ( = ?auto_33471 ?auto_33473 ) ) ( not ( = ?auto_33472 ?auto_33473 ) ) ( not ( = ?auto_33477 ?auto_33473 ) ) ( not ( = ?auto_33483 ?auto_33473 ) ) ( not ( = ?auto_33480 ?auto_33473 ) ) ( not ( = ?auto_33479 ?auto_33473 ) ) ( SURFACE-AT ?auto_33475 ?auto_33486 ) ( CLEAR ?auto_33475 ) ( IS-CRATE ?auto_33479 ) ( not ( = ?auto_33471 ?auto_33475 ) ) ( not ( = ?auto_33472 ?auto_33475 ) ) ( not ( = ?auto_33477 ?auto_33475 ) ) ( not ( = ?auto_33483 ?auto_33475 ) ) ( not ( = ?auto_33480 ?auto_33475 ) ) ( not ( = ?auto_33479 ?auto_33475 ) ) ( not ( = ?auto_33473 ?auto_33475 ) ) ( AVAILABLE ?auto_33481 ) ( TRUCK-AT ?auto_33474 ?auto_33476 ) ( LIFTING ?auto_33484 ?auto_33479 ) )
    :subtasks
    ( ( !LOAD ?auto_33484 ?auto_33479 ?auto_33474 ?auto_33476 )
      ( MAKE-ON ?auto_33471 ?auto_33472 )
      ( MAKE-ON-VERIFY ?auto_33471 ?auto_33472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33488 - SURFACE
      ?auto_33489 - SURFACE
    )
    :vars
    (
      ?auto_33498 - HOIST
      ?auto_33492 - PLACE
      ?auto_33499 - PLACE
      ?auto_33490 - HOIST
      ?auto_33503 - SURFACE
      ?auto_33500 - SURFACE
      ?auto_33497 - PLACE
      ?auto_33504 - HOIST
      ?auto_33495 - SURFACE
      ?auto_33502 - SURFACE
      ?auto_33494 - PLACE
      ?auto_33501 - HOIST
      ?auto_33493 - SURFACE
      ?auto_33496 - SURFACE
      ?auto_33491 - TRUCK
      ?auto_33505 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33498 ?auto_33492 ) ( IS-CRATE ?auto_33488 ) ( not ( = ?auto_33488 ?auto_33489 ) ) ( not ( = ?auto_33499 ?auto_33492 ) ) ( HOIST-AT ?auto_33490 ?auto_33499 ) ( not ( = ?auto_33498 ?auto_33490 ) ) ( AVAILABLE ?auto_33490 ) ( SURFACE-AT ?auto_33488 ?auto_33499 ) ( ON ?auto_33488 ?auto_33503 ) ( CLEAR ?auto_33488 ) ( not ( = ?auto_33488 ?auto_33503 ) ) ( not ( = ?auto_33489 ?auto_33503 ) ) ( IS-CRATE ?auto_33489 ) ( not ( = ?auto_33488 ?auto_33500 ) ) ( not ( = ?auto_33489 ?auto_33500 ) ) ( not ( = ?auto_33503 ?auto_33500 ) ) ( not ( = ?auto_33497 ?auto_33492 ) ) ( not ( = ?auto_33499 ?auto_33497 ) ) ( HOIST-AT ?auto_33504 ?auto_33497 ) ( not ( = ?auto_33498 ?auto_33504 ) ) ( not ( = ?auto_33490 ?auto_33504 ) ) ( SURFACE-AT ?auto_33489 ?auto_33497 ) ( ON ?auto_33489 ?auto_33495 ) ( CLEAR ?auto_33489 ) ( not ( = ?auto_33488 ?auto_33495 ) ) ( not ( = ?auto_33489 ?auto_33495 ) ) ( not ( = ?auto_33503 ?auto_33495 ) ) ( not ( = ?auto_33500 ?auto_33495 ) ) ( IS-CRATE ?auto_33500 ) ( not ( = ?auto_33488 ?auto_33502 ) ) ( not ( = ?auto_33489 ?auto_33502 ) ) ( not ( = ?auto_33503 ?auto_33502 ) ) ( not ( = ?auto_33500 ?auto_33502 ) ) ( not ( = ?auto_33495 ?auto_33502 ) ) ( not ( = ?auto_33494 ?auto_33492 ) ) ( not ( = ?auto_33499 ?auto_33494 ) ) ( not ( = ?auto_33497 ?auto_33494 ) ) ( HOIST-AT ?auto_33501 ?auto_33494 ) ( not ( = ?auto_33498 ?auto_33501 ) ) ( not ( = ?auto_33490 ?auto_33501 ) ) ( not ( = ?auto_33504 ?auto_33501 ) ) ( AVAILABLE ?auto_33501 ) ( SURFACE-AT ?auto_33500 ?auto_33494 ) ( ON ?auto_33500 ?auto_33493 ) ( CLEAR ?auto_33500 ) ( not ( = ?auto_33488 ?auto_33493 ) ) ( not ( = ?auto_33489 ?auto_33493 ) ) ( not ( = ?auto_33503 ?auto_33493 ) ) ( not ( = ?auto_33500 ?auto_33493 ) ) ( not ( = ?auto_33495 ?auto_33493 ) ) ( not ( = ?auto_33502 ?auto_33493 ) ) ( SURFACE-AT ?auto_33496 ?auto_33492 ) ( CLEAR ?auto_33496 ) ( IS-CRATE ?auto_33502 ) ( not ( = ?auto_33488 ?auto_33496 ) ) ( not ( = ?auto_33489 ?auto_33496 ) ) ( not ( = ?auto_33503 ?auto_33496 ) ) ( not ( = ?auto_33500 ?auto_33496 ) ) ( not ( = ?auto_33495 ?auto_33496 ) ) ( not ( = ?auto_33502 ?auto_33496 ) ) ( not ( = ?auto_33493 ?auto_33496 ) ) ( AVAILABLE ?auto_33498 ) ( TRUCK-AT ?auto_33491 ?auto_33497 ) ( AVAILABLE ?auto_33504 ) ( SURFACE-AT ?auto_33502 ?auto_33497 ) ( ON ?auto_33502 ?auto_33505 ) ( CLEAR ?auto_33502 ) ( not ( = ?auto_33488 ?auto_33505 ) ) ( not ( = ?auto_33489 ?auto_33505 ) ) ( not ( = ?auto_33503 ?auto_33505 ) ) ( not ( = ?auto_33500 ?auto_33505 ) ) ( not ( = ?auto_33495 ?auto_33505 ) ) ( not ( = ?auto_33502 ?auto_33505 ) ) ( not ( = ?auto_33493 ?auto_33505 ) ) ( not ( = ?auto_33496 ?auto_33505 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33504 ?auto_33502 ?auto_33505 ?auto_33497 )
      ( MAKE-ON ?auto_33488 ?auto_33489 )
      ( MAKE-ON-VERIFY ?auto_33488 ?auto_33489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33506 - SURFACE
      ?auto_33507 - SURFACE
    )
    :vars
    (
      ?auto_33522 - HOIST
      ?auto_33516 - PLACE
      ?auto_33523 - PLACE
      ?auto_33517 - HOIST
      ?auto_33509 - SURFACE
      ?auto_33521 - SURFACE
      ?auto_33514 - PLACE
      ?auto_33511 - HOIST
      ?auto_33513 - SURFACE
      ?auto_33512 - SURFACE
      ?auto_33519 - PLACE
      ?auto_33520 - HOIST
      ?auto_33518 - SURFACE
      ?auto_33510 - SURFACE
      ?auto_33508 - SURFACE
      ?auto_33515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33522 ?auto_33516 ) ( IS-CRATE ?auto_33506 ) ( not ( = ?auto_33506 ?auto_33507 ) ) ( not ( = ?auto_33523 ?auto_33516 ) ) ( HOIST-AT ?auto_33517 ?auto_33523 ) ( not ( = ?auto_33522 ?auto_33517 ) ) ( AVAILABLE ?auto_33517 ) ( SURFACE-AT ?auto_33506 ?auto_33523 ) ( ON ?auto_33506 ?auto_33509 ) ( CLEAR ?auto_33506 ) ( not ( = ?auto_33506 ?auto_33509 ) ) ( not ( = ?auto_33507 ?auto_33509 ) ) ( IS-CRATE ?auto_33507 ) ( not ( = ?auto_33506 ?auto_33521 ) ) ( not ( = ?auto_33507 ?auto_33521 ) ) ( not ( = ?auto_33509 ?auto_33521 ) ) ( not ( = ?auto_33514 ?auto_33516 ) ) ( not ( = ?auto_33523 ?auto_33514 ) ) ( HOIST-AT ?auto_33511 ?auto_33514 ) ( not ( = ?auto_33522 ?auto_33511 ) ) ( not ( = ?auto_33517 ?auto_33511 ) ) ( SURFACE-AT ?auto_33507 ?auto_33514 ) ( ON ?auto_33507 ?auto_33513 ) ( CLEAR ?auto_33507 ) ( not ( = ?auto_33506 ?auto_33513 ) ) ( not ( = ?auto_33507 ?auto_33513 ) ) ( not ( = ?auto_33509 ?auto_33513 ) ) ( not ( = ?auto_33521 ?auto_33513 ) ) ( IS-CRATE ?auto_33521 ) ( not ( = ?auto_33506 ?auto_33512 ) ) ( not ( = ?auto_33507 ?auto_33512 ) ) ( not ( = ?auto_33509 ?auto_33512 ) ) ( not ( = ?auto_33521 ?auto_33512 ) ) ( not ( = ?auto_33513 ?auto_33512 ) ) ( not ( = ?auto_33519 ?auto_33516 ) ) ( not ( = ?auto_33523 ?auto_33519 ) ) ( not ( = ?auto_33514 ?auto_33519 ) ) ( HOIST-AT ?auto_33520 ?auto_33519 ) ( not ( = ?auto_33522 ?auto_33520 ) ) ( not ( = ?auto_33517 ?auto_33520 ) ) ( not ( = ?auto_33511 ?auto_33520 ) ) ( AVAILABLE ?auto_33520 ) ( SURFACE-AT ?auto_33521 ?auto_33519 ) ( ON ?auto_33521 ?auto_33518 ) ( CLEAR ?auto_33521 ) ( not ( = ?auto_33506 ?auto_33518 ) ) ( not ( = ?auto_33507 ?auto_33518 ) ) ( not ( = ?auto_33509 ?auto_33518 ) ) ( not ( = ?auto_33521 ?auto_33518 ) ) ( not ( = ?auto_33513 ?auto_33518 ) ) ( not ( = ?auto_33512 ?auto_33518 ) ) ( SURFACE-AT ?auto_33510 ?auto_33516 ) ( CLEAR ?auto_33510 ) ( IS-CRATE ?auto_33512 ) ( not ( = ?auto_33506 ?auto_33510 ) ) ( not ( = ?auto_33507 ?auto_33510 ) ) ( not ( = ?auto_33509 ?auto_33510 ) ) ( not ( = ?auto_33521 ?auto_33510 ) ) ( not ( = ?auto_33513 ?auto_33510 ) ) ( not ( = ?auto_33512 ?auto_33510 ) ) ( not ( = ?auto_33518 ?auto_33510 ) ) ( AVAILABLE ?auto_33522 ) ( AVAILABLE ?auto_33511 ) ( SURFACE-AT ?auto_33512 ?auto_33514 ) ( ON ?auto_33512 ?auto_33508 ) ( CLEAR ?auto_33512 ) ( not ( = ?auto_33506 ?auto_33508 ) ) ( not ( = ?auto_33507 ?auto_33508 ) ) ( not ( = ?auto_33509 ?auto_33508 ) ) ( not ( = ?auto_33521 ?auto_33508 ) ) ( not ( = ?auto_33513 ?auto_33508 ) ) ( not ( = ?auto_33512 ?auto_33508 ) ) ( not ( = ?auto_33518 ?auto_33508 ) ) ( not ( = ?auto_33510 ?auto_33508 ) ) ( TRUCK-AT ?auto_33515 ?auto_33516 ) )
    :subtasks
    ( ( !DRIVE ?auto_33515 ?auto_33516 ?auto_33514 )
      ( MAKE-ON ?auto_33506 ?auto_33507 )
      ( MAKE-ON-VERIFY ?auto_33506 ?auto_33507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33526 - SURFACE
      ?auto_33527 - SURFACE
    )
    :vars
    (
      ?auto_33528 - HOIST
      ?auto_33529 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33528 ?auto_33529 ) ( SURFACE-AT ?auto_33527 ?auto_33529 ) ( CLEAR ?auto_33527 ) ( LIFTING ?auto_33528 ?auto_33526 ) ( IS-CRATE ?auto_33526 ) ( not ( = ?auto_33526 ?auto_33527 ) ) )
    :subtasks
    ( ( !DROP ?auto_33528 ?auto_33526 ?auto_33527 ?auto_33529 )
      ( MAKE-ON-VERIFY ?auto_33526 ?auto_33527 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33530 - SURFACE
      ?auto_33531 - SURFACE
    )
    :vars
    (
      ?auto_33532 - HOIST
      ?auto_33533 - PLACE
      ?auto_33534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33532 ?auto_33533 ) ( SURFACE-AT ?auto_33531 ?auto_33533 ) ( CLEAR ?auto_33531 ) ( IS-CRATE ?auto_33530 ) ( not ( = ?auto_33530 ?auto_33531 ) ) ( TRUCK-AT ?auto_33534 ?auto_33533 ) ( AVAILABLE ?auto_33532 ) ( IN ?auto_33530 ?auto_33534 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33532 ?auto_33530 ?auto_33534 ?auto_33533 )
      ( MAKE-ON ?auto_33530 ?auto_33531 )
      ( MAKE-ON-VERIFY ?auto_33530 ?auto_33531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33535 - SURFACE
      ?auto_33536 - SURFACE
    )
    :vars
    (
      ?auto_33539 - HOIST
      ?auto_33537 - PLACE
      ?auto_33538 - TRUCK
      ?auto_33540 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33539 ?auto_33537 ) ( SURFACE-AT ?auto_33536 ?auto_33537 ) ( CLEAR ?auto_33536 ) ( IS-CRATE ?auto_33535 ) ( not ( = ?auto_33535 ?auto_33536 ) ) ( AVAILABLE ?auto_33539 ) ( IN ?auto_33535 ?auto_33538 ) ( TRUCK-AT ?auto_33538 ?auto_33540 ) ( not ( = ?auto_33540 ?auto_33537 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33538 ?auto_33540 ?auto_33537 )
      ( MAKE-ON ?auto_33535 ?auto_33536 )
      ( MAKE-ON-VERIFY ?auto_33535 ?auto_33536 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33541 - SURFACE
      ?auto_33542 - SURFACE
    )
    :vars
    (
      ?auto_33545 - HOIST
      ?auto_33546 - PLACE
      ?auto_33544 - TRUCK
      ?auto_33543 - PLACE
      ?auto_33547 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33545 ?auto_33546 ) ( SURFACE-AT ?auto_33542 ?auto_33546 ) ( CLEAR ?auto_33542 ) ( IS-CRATE ?auto_33541 ) ( not ( = ?auto_33541 ?auto_33542 ) ) ( AVAILABLE ?auto_33545 ) ( TRUCK-AT ?auto_33544 ?auto_33543 ) ( not ( = ?auto_33543 ?auto_33546 ) ) ( HOIST-AT ?auto_33547 ?auto_33543 ) ( LIFTING ?auto_33547 ?auto_33541 ) ( not ( = ?auto_33545 ?auto_33547 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33547 ?auto_33541 ?auto_33544 ?auto_33543 )
      ( MAKE-ON ?auto_33541 ?auto_33542 )
      ( MAKE-ON-VERIFY ?auto_33541 ?auto_33542 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33548 - SURFACE
      ?auto_33549 - SURFACE
    )
    :vars
    (
      ?auto_33551 - HOIST
      ?auto_33553 - PLACE
      ?auto_33552 - TRUCK
      ?auto_33550 - PLACE
      ?auto_33554 - HOIST
      ?auto_33555 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33551 ?auto_33553 ) ( SURFACE-AT ?auto_33549 ?auto_33553 ) ( CLEAR ?auto_33549 ) ( IS-CRATE ?auto_33548 ) ( not ( = ?auto_33548 ?auto_33549 ) ) ( AVAILABLE ?auto_33551 ) ( TRUCK-AT ?auto_33552 ?auto_33550 ) ( not ( = ?auto_33550 ?auto_33553 ) ) ( HOIST-AT ?auto_33554 ?auto_33550 ) ( not ( = ?auto_33551 ?auto_33554 ) ) ( AVAILABLE ?auto_33554 ) ( SURFACE-AT ?auto_33548 ?auto_33550 ) ( ON ?auto_33548 ?auto_33555 ) ( CLEAR ?auto_33548 ) ( not ( = ?auto_33548 ?auto_33555 ) ) ( not ( = ?auto_33549 ?auto_33555 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33554 ?auto_33548 ?auto_33555 ?auto_33550 )
      ( MAKE-ON ?auto_33548 ?auto_33549 )
      ( MAKE-ON-VERIFY ?auto_33548 ?auto_33549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33556 - SURFACE
      ?auto_33557 - SURFACE
    )
    :vars
    (
      ?auto_33561 - HOIST
      ?auto_33563 - PLACE
      ?auto_33562 - PLACE
      ?auto_33559 - HOIST
      ?auto_33560 - SURFACE
      ?auto_33558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33561 ?auto_33563 ) ( SURFACE-AT ?auto_33557 ?auto_33563 ) ( CLEAR ?auto_33557 ) ( IS-CRATE ?auto_33556 ) ( not ( = ?auto_33556 ?auto_33557 ) ) ( AVAILABLE ?auto_33561 ) ( not ( = ?auto_33562 ?auto_33563 ) ) ( HOIST-AT ?auto_33559 ?auto_33562 ) ( not ( = ?auto_33561 ?auto_33559 ) ) ( AVAILABLE ?auto_33559 ) ( SURFACE-AT ?auto_33556 ?auto_33562 ) ( ON ?auto_33556 ?auto_33560 ) ( CLEAR ?auto_33556 ) ( not ( = ?auto_33556 ?auto_33560 ) ) ( not ( = ?auto_33557 ?auto_33560 ) ) ( TRUCK-AT ?auto_33558 ?auto_33563 ) )
    :subtasks
    ( ( !DRIVE ?auto_33558 ?auto_33563 ?auto_33562 )
      ( MAKE-ON ?auto_33556 ?auto_33557 )
      ( MAKE-ON-VERIFY ?auto_33556 ?auto_33557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33564 - SURFACE
      ?auto_33565 - SURFACE
    )
    :vars
    (
      ?auto_33569 - HOIST
      ?auto_33566 - PLACE
      ?auto_33571 - PLACE
      ?auto_33568 - HOIST
      ?auto_33567 - SURFACE
      ?auto_33570 - TRUCK
      ?auto_33572 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33569 ?auto_33566 ) ( IS-CRATE ?auto_33564 ) ( not ( = ?auto_33564 ?auto_33565 ) ) ( not ( = ?auto_33571 ?auto_33566 ) ) ( HOIST-AT ?auto_33568 ?auto_33571 ) ( not ( = ?auto_33569 ?auto_33568 ) ) ( AVAILABLE ?auto_33568 ) ( SURFACE-AT ?auto_33564 ?auto_33571 ) ( ON ?auto_33564 ?auto_33567 ) ( CLEAR ?auto_33564 ) ( not ( = ?auto_33564 ?auto_33567 ) ) ( not ( = ?auto_33565 ?auto_33567 ) ) ( TRUCK-AT ?auto_33570 ?auto_33566 ) ( SURFACE-AT ?auto_33572 ?auto_33566 ) ( CLEAR ?auto_33572 ) ( LIFTING ?auto_33569 ?auto_33565 ) ( IS-CRATE ?auto_33565 ) ( not ( = ?auto_33564 ?auto_33572 ) ) ( not ( = ?auto_33565 ?auto_33572 ) ) ( not ( = ?auto_33567 ?auto_33572 ) ) )
    :subtasks
    ( ( !DROP ?auto_33569 ?auto_33565 ?auto_33572 ?auto_33566 )
      ( MAKE-ON ?auto_33564 ?auto_33565 )
      ( MAKE-ON-VERIFY ?auto_33564 ?auto_33565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33573 - SURFACE
      ?auto_33574 - SURFACE
    )
    :vars
    (
      ?auto_33581 - HOIST
      ?auto_33577 - PLACE
      ?auto_33580 - PLACE
      ?auto_33576 - HOIST
      ?auto_33575 - SURFACE
      ?auto_33579 - TRUCK
      ?auto_33578 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33581 ?auto_33577 ) ( IS-CRATE ?auto_33573 ) ( not ( = ?auto_33573 ?auto_33574 ) ) ( not ( = ?auto_33580 ?auto_33577 ) ) ( HOIST-AT ?auto_33576 ?auto_33580 ) ( not ( = ?auto_33581 ?auto_33576 ) ) ( AVAILABLE ?auto_33576 ) ( SURFACE-AT ?auto_33573 ?auto_33580 ) ( ON ?auto_33573 ?auto_33575 ) ( CLEAR ?auto_33573 ) ( not ( = ?auto_33573 ?auto_33575 ) ) ( not ( = ?auto_33574 ?auto_33575 ) ) ( TRUCK-AT ?auto_33579 ?auto_33577 ) ( SURFACE-AT ?auto_33578 ?auto_33577 ) ( CLEAR ?auto_33578 ) ( IS-CRATE ?auto_33574 ) ( not ( = ?auto_33573 ?auto_33578 ) ) ( not ( = ?auto_33574 ?auto_33578 ) ) ( not ( = ?auto_33575 ?auto_33578 ) ) ( AVAILABLE ?auto_33581 ) ( IN ?auto_33574 ?auto_33579 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33581 ?auto_33574 ?auto_33579 ?auto_33577 )
      ( MAKE-ON ?auto_33573 ?auto_33574 )
      ( MAKE-ON-VERIFY ?auto_33573 ?auto_33574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33582 - SURFACE
      ?auto_33583 - SURFACE
    )
    :vars
    (
      ?auto_33587 - HOIST
      ?auto_33586 - PLACE
      ?auto_33588 - PLACE
      ?auto_33589 - HOIST
      ?auto_33585 - SURFACE
      ?auto_33590 - SURFACE
      ?auto_33584 - TRUCK
      ?auto_33591 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33587 ?auto_33586 ) ( IS-CRATE ?auto_33582 ) ( not ( = ?auto_33582 ?auto_33583 ) ) ( not ( = ?auto_33588 ?auto_33586 ) ) ( HOIST-AT ?auto_33589 ?auto_33588 ) ( not ( = ?auto_33587 ?auto_33589 ) ) ( AVAILABLE ?auto_33589 ) ( SURFACE-AT ?auto_33582 ?auto_33588 ) ( ON ?auto_33582 ?auto_33585 ) ( CLEAR ?auto_33582 ) ( not ( = ?auto_33582 ?auto_33585 ) ) ( not ( = ?auto_33583 ?auto_33585 ) ) ( SURFACE-AT ?auto_33590 ?auto_33586 ) ( CLEAR ?auto_33590 ) ( IS-CRATE ?auto_33583 ) ( not ( = ?auto_33582 ?auto_33590 ) ) ( not ( = ?auto_33583 ?auto_33590 ) ) ( not ( = ?auto_33585 ?auto_33590 ) ) ( AVAILABLE ?auto_33587 ) ( IN ?auto_33583 ?auto_33584 ) ( TRUCK-AT ?auto_33584 ?auto_33591 ) ( not ( = ?auto_33591 ?auto_33586 ) ) ( not ( = ?auto_33588 ?auto_33591 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33584 ?auto_33591 ?auto_33586 )
      ( MAKE-ON ?auto_33582 ?auto_33583 )
      ( MAKE-ON-VERIFY ?auto_33582 ?auto_33583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33592 - SURFACE
      ?auto_33593 - SURFACE
    )
    :vars
    (
      ?auto_33595 - HOIST
      ?auto_33599 - PLACE
      ?auto_33601 - PLACE
      ?auto_33594 - HOIST
      ?auto_33600 - SURFACE
      ?auto_33598 - SURFACE
      ?auto_33596 - TRUCK
      ?auto_33597 - PLACE
      ?auto_33602 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33595 ?auto_33599 ) ( IS-CRATE ?auto_33592 ) ( not ( = ?auto_33592 ?auto_33593 ) ) ( not ( = ?auto_33601 ?auto_33599 ) ) ( HOIST-AT ?auto_33594 ?auto_33601 ) ( not ( = ?auto_33595 ?auto_33594 ) ) ( AVAILABLE ?auto_33594 ) ( SURFACE-AT ?auto_33592 ?auto_33601 ) ( ON ?auto_33592 ?auto_33600 ) ( CLEAR ?auto_33592 ) ( not ( = ?auto_33592 ?auto_33600 ) ) ( not ( = ?auto_33593 ?auto_33600 ) ) ( SURFACE-AT ?auto_33598 ?auto_33599 ) ( CLEAR ?auto_33598 ) ( IS-CRATE ?auto_33593 ) ( not ( = ?auto_33592 ?auto_33598 ) ) ( not ( = ?auto_33593 ?auto_33598 ) ) ( not ( = ?auto_33600 ?auto_33598 ) ) ( AVAILABLE ?auto_33595 ) ( TRUCK-AT ?auto_33596 ?auto_33597 ) ( not ( = ?auto_33597 ?auto_33599 ) ) ( not ( = ?auto_33601 ?auto_33597 ) ) ( HOIST-AT ?auto_33602 ?auto_33597 ) ( LIFTING ?auto_33602 ?auto_33593 ) ( not ( = ?auto_33595 ?auto_33602 ) ) ( not ( = ?auto_33594 ?auto_33602 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33602 ?auto_33593 ?auto_33596 ?auto_33597 )
      ( MAKE-ON ?auto_33592 ?auto_33593 )
      ( MAKE-ON-VERIFY ?auto_33592 ?auto_33593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33603 - SURFACE
      ?auto_33604 - SURFACE
    )
    :vars
    (
      ?auto_33609 - HOIST
      ?auto_33605 - PLACE
      ?auto_33608 - PLACE
      ?auto_33612 - HOIST
      ?auto_33611 - SURFACE
      ?auto_33607 - SURFACE
      ?auto_33610 - TRUCK
      ?auto_33606 - PLACE
      ?auto_33613 - HOIST
      ?auto_33614 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33609 ?auto_33605 ) ( IS-CRATE ?auto_33603 ) ( not ( = ?auto_33603 ?auto_33604 ) ) ( not ( = ?auto_33608 ?auto_33605 ) ) ( HOIST-AT ?auto_33612 ?auto_33608 ) ( not ( = ?auto_33609 ?auto_33612 ) ) ( AVAILABLE ?auto_33612 ) ( SURFACE-AT ?auto_33603 ?auto_33608 ) ( ON ?auto_33603 ?auto_33611 ) ( CLEAR ?auto_33603 ) ( not ( = ?auto_33603 ?auto_33611 ) ) ( not ( = ?auto_33604 ?auto_33611 ) ) ( SURFACE-AT ?auto_33607 ?auto_33605 ) ( CLEAR ?auto_33607 ) ( IS-CRATE ?auto_33604 ) ( not ( = ?auto_33603 ?auto_33607 ) ) ( not ( = ?auto_33604 ?auto_33607 ) ) ( not ( = ?auto_33611 ?auto_33607 ) ) ( AVAILABLE ?auto_33609 ) ( TRUCK-AT ?auto_33610 ?auto_33606 ) ( not ( = ?auto_33606 ?auto_33605 ) ) ( not ( = ?auto_33608 ?auto_33606 ) ) ( HOIST-AT ?auto_33613 ?auto_33606 ) ( not ( = ?auto_33609 ?auto_33613 ) ) ( not ( = ?auto_33612 ?auto_33613 ) ) ( AVAILABLE ?auto_33613 ) ( SURFACE-AT ?auto_33604 ?auto_33606 ) ( ON ?auto_33604 ?auto_33614 ) ( CLEAR ?auto_33604 ) ( not ( = ?auto_33603 ?auto_33614 ) ) ( not ( = ?auto_33604 ?auto_33614 ) ) ( not ( = ?auto_33611 ?auto_33614 ) ) ( not ( = ?auto_33607 ?auto_33614 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33613 ?auto_33604 ?auto_33614 ?auto_33606 )
      ( MAKE-ON ?auto_33603 ?auto_33604 )
      ( MAKE-ON-VERIFY ?auto_33603 ?auto_33604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33615 - SURFACE
      ?auto_33616 - SURFACE
    )
    :vars
    (
      ?auto_33619 - HOIST
      ?auto_33625 - PLACE
      ?auto_33617 - PLACE
      ?auto_33624 - HOIST
      ?auto_33620 - SURFACE
      ?auto_33623 - SURFACE
      ?auto_33622 - PLACE
      ?auto_33618 - HOIST
      ?auto_33626 - SURFACE
      ?auto_33621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33619 ?auto_33625 ) ( IS-CRATE ?auto_33615 ) ( not ( = ?auto_33615 ?auto_33616 ) ) ( not ( = ?auto_33617 ?auto_33625 ) ) ( HOIST-AT ?auto_33624 ?auto_33617 ) ( not ( = ?auto_33619 ?auto_33624 ) ) ( AVAILABLE ?auto_33624 ) ( SURFACE-AT ?auto_33615 ?auto_33617 ) ( ON ?auto_33615 ?auto_33620 ) ( CLEAR ?auto_33615 ) ( not ( = ?auto_33615 ?auto_33620 ) ) ( not ( = ?auto_33616 ?auto_33620 ) ) ( SURFACE-AT ?auto_33623 ?auto_33625 ) ( CLEAR ?auto_33623 ) ( IS-CRATE ?auto_33616 ) ( not ( = ?auto_33615 ?auto_33623 ) ) ( not ( = ?auto_33616 ?auto_33623 ) ) ( not ( = ?auto_33620 ?auto_33623 ) ) ( AVAILABLE ?auto_33619 ) ( not ( = ?auto_33622 ?auto_33625 ) ) ( not ( = ?auto_33617 ?auto_33622 ) ) ( HOIST-AT ?auto_33618 ?auto_33622 ) ( not ( = ?auto_33619 ?auto_33618 ) ) ( not ( = ?auto_33624 ?auto_33618 ) ) ( AVAILABLE ?auto_33618 ) ( SURFACE-AT ?auto_33616 ?auto_33622 ) ( ON ?auto_33616 ?auto_33626 ) ( CLEAR ?auto_33616 ) ( not ( = ?auto_33615 ?auto_33626 ) ) ( not ( = ?auto_33616 ?auto_33626 ) ) ( not ( = ?auto_33620 ?auto_33626 ) ) ( not ( = ?auto_33623 ?auto_33626 ) ) ( TRUCK-AT ?auto_33621 ?auto_33625 ) )
    :subtasks
    ( ( !DRIVE ?auto_33621 ?auto_33625 ?auto_33622 )
      ( MAKE-ON ?auto_33615 ?auto_33616 )
      ( MAKE-ON-VERIFY ?auto_33615 ?auto_33616 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33627 - SURFACE
      ?auto_33628 - SURFACE
    )
    :vars
    (
      ?auto_33636 - HOIST
      ?auto_33637 - PLACE
      ?auto_33634 - PLACE
      ?auto_33631 - HOIST
      ?auto_33630 - SURFACE
      ?auto_33629 - SURFACE
      ?auto_33638 - PLACE
      ?auto_33632 - HOIST
      ?auto_33635 - SURFACE
      ?auto_33633 - TRUCK
      ?auto_33639 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33636 ?auto_33637 ) ( IS-CRATE ?auto_33627 ) ( not ( = ?auto_33627 ?auto_33628 ) ) ( not ( = ?auto_33634 ?auto_33637 ) ) ( HOIST-AT ?auto_33631 ?auto_33634 ) ( not ( = ?auto_33636 ?auto_33631 ) ) ( AVAILABLE ?auto_33631 ) ( SURFACE-AT ?auto_33627 ?auto_33634 ) ( ON ?auto_33627 ?auto_33630 ) ( CLEAR ?auto_33627 ) ( not ( = ?auto_33627 ?auto_33630 ) ) ( not ( = ?auto_33628 ?auto_33630 ) ) ( IS-CRATE ?auto_33628 ) ( not ( = ?auto_33627 ?auto_33629 ) ) ( not ( = ?auto_33628 ?auto_33629 ) ) ( not ( = ?auto_33630 ?auto_33629 ) ) ( not ( = ?auto_33638 ?auto_33637 ) ) ( not ( = ?auto_33634 ?auto_33638 ) ) ( HOIST-AT ?auto_33632 ?auto_33638 ) ( not ( = ?auto_33636 ?auto_33632 ) ) ( not ( = ?auto_33631 ?auto_33632 ) ) ( AVAILABLE ?auto_33632 ) ( SURFACE-AT ?auto_33628 ?auto_33638 ) ( ON ?auto_33628 ?auto_33635 ) ( CLEAR ?auto_33628 ) ( not ( = ?auto_33627 ?auto_33635 ) ) ( not ( = ?auto_33628 ?auto_33635 ) ) ( not ( = ?auto_33630 ?auto_33635 ) ) ( not ( = ?auto_33629 ?auto_33635 ) ) ( TRUCK-AT ?auto_33633 ?auto_33637 ) ( SURFACE-AT ?auto_33639 ?auto_33637 ) ( CLEAR ?auto_33639 ) ( LIFTING ?auto_33636 ?auto_33629 ) ( IS-CRATE ?auto_33629 ) ( not ( = ?auto_33627 ?auto_33639 ) ) ( not ( = ?auto_33628 ?auto_33639 ) ) ( not ( = ?auto_33630 ?auto_33639 ) ) ( not ( = ?auto_33629 ?auto_33639 ) ) ( not ( = ?auto_33635 ?auto_33639 ) ) )
    :subtasks
    ( ( !DROP ?auto_33636 ?auto_33629 ?auto_33639 ?auto_33637 )
      ( MAKE-ON ?auto_33627 ?auto_33628 )
      ( MAKE-ON-VERIFY ?auto_33627 ?auto_33628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33640 - SURFACE
      ?auto_33641 - SURFACE
    )
    :vars
    (
      ?auto_33645 - HOIST
      ?auto_33650 - PLACE
      ?auto_33648 - PLACE
      ?auto_33649 - HOIST
      ?auto_33644 - SURFACE
      ?auto_33651 - SURFACE
      ?auto_33642 - PLACE
      ?auto_33652 - HOIST
      ?auto_33647 - SURFACE
      ?auto_33643 - TRUCK
      ?auto_33646 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33645 ?auto_33650 ) ( IS-CRATE ?auto_33640 ) ( not ( = ?auto_33640 ?auto_33641 ) ) ( not ( = ?auto_33648 ?auto_33650 ) ) ( HOIST-AT ?auto_33649 ?auto_33648 ) ( not ( = ?auto_33645 ?auto_33649 ) ) ( AVAILABLE ?auto_33649 ) ( SURFACE-AT ?auto_33640 ?auto_33648 ) ( ON ?auto_33640 ?auto_33644 ) ( CLEAR ?auto_33640 ) ( not ( = ?auto_33640 ?auto_33644 ) ) ( not ( = ?auto_33641 ?auto_33644 ) ) ( IS-CRATE ?auto_33641 ) ( not ( = ?auto_33640 ?auto_33651 ) ) ( not ( = ?auto_33641 ?auto_33651 ) ) ( not ( = ?auto_33644 ?auto_33651 ) ) ( not ( = ?auto_33642 ?auto_33650 ) ) ( not ( = ?auto_33648 ?auto_33642 ) ) ( HOIST-AT ?auto_33652 ?auto_33642 ) ( not ( = ?auto_33645 ?auto_33652 ) ) ( not ( = ?auto_33649 ?auto_33652 ) ) ( AVAILABLE ?auto_33652 ) ( SURFACE-AT ?auto_33641 ?auto_33642 ) ( ON ?auto_33641 ?auto_33647 ) ( CLEAR ?auto_33641 ) ( not ( = ?auto_33640 ?auto_33647 ) ) ( not ( = ?auto_33641 ?auto_33647 ) ) ( not ( = ?auto_33644 ?auto_33647 ) ) ( not ( = ?auto_33651 ?auto_33647 ) ) ( TRUCK-AT ?auto_33643 ?auto_33650 ) ( SURFACE-AT ?auto_33646 ?auto_33650 ) ( CLEAR ?auto_33646 ) ( IS-CRATE ?auto_33651 ) ( not ( = ?auto_33640 ?auto_33646 ) ) ( not ( = ?auto_33641 ?auto_33646 ) ) ( not ( = ?auto_33644 ?auto_33646 ) ) ( not ( = ?auto_33651 ?auto_33646 ) ) ( not ( = ?auto_33647 ?auto_33646 ) ) ( AVAILABLE ?auto_33645 ) ( IN ?auto_33651 ?auto_33643 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33645 ?auto_33651 ?auto_33643 ?auto_33650 )
      ( MAKE-ON ?auto_33640 ?auto_33641 )
      ( MAKE-ON-VERIFY ?auto_33640 ?auto_33641 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33653 - SURFACE
      ?auto_33654 - SURFACE
    )
    :vars
    (
      ?auto_33665 - HOIST
      ?auto_33660 - PLACE
      ?auto_33656 - PLACE
      ?auto_33659 - HOIST
      ?auto_33657 - SURFACE
      ?auto_33658 - SURFACE
      ?auto_33661 - PLACE
      ?auto_33664 - HOIST
      ?auto_33663 - SURFACE
      ?auto_33655 - SURFACE
      ?auto_33662 - TRUCK
      ?auto_33666 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33665 ?auto_33660 ) ( IS-CRATE ?auto_33653 ) ( not ( = ?auto_33653 ?auto_33654 ) ) ( not ( = ?auto_33656 ?auto_33660 ) ) ( HOIST-AT ?auto_33659 ?auto_33656 ) ( not ( = ?auto_33665 ?auto_33659 ) ) ( AVAILABLE ?auto_33659 ) ( SURFACE-AT ?auto_33653 ?auto_33656 ) ( ON ?auto_33653 ?auto_33657 ) ( CLEAR ?auto_33653 ) ( not ( = ?auto_33653 ?auto_33657 ) ) ( not ( = ?auto_33654 ?auto_33657 ) ) ( IS-CRATE ?auto_33654 ) ( not ( = ?auto_33653 ?auto_33658 ) ) ( not ( = ?auto_33654 ?auto_33658 ) ) ( not ( = ?auto_33657 ?auto_33658 ) ) ( not ( = ?auto_33661 ?auto_33660 ) ) ( not ( = ?auto_33656 ?auto_33661 ) ) ( HOIST-AT ?auto_33664 ?auto_33661 ) ( not ( = ?auto_33665 ?auto_33664 ) ) ( not ( = ?auto_33659 ?auto_33664 ) ) ( AVAILABLE ?auto_33664 ) ( SURFACE-AT ?auto_33654 ?auto_33661 ) ( ON ?auto_33654 ?auto_33663 ) ( CLEAR ?auto_33654 ) ( not ( = ?auto_33653 ?auto_33663 ) ) ( not ( = ?auto_33654 ?auto_33663 ) ) ( not ( = ?auto_33657 ?auto_33663 ) ) ( not ( = ?auto_33658 ?auto_33663 ) ) ( SURFACE-AT ?auto_33655 ?auto_33660 ) ( CLEAR ?auto_33655 ) ( IS-CRATE ?auto_33658 ) ( not ( = ?auto_33653 ?auto_33655 ) ) ( not ( = ?auto_33654 ?auto_33655 ) ) ( not ( = ?auto_33657 ?auto_33655 ) ) ( not ( = ?auto_33658 ?auto_33655 ) ) ( not ( = ?auto_33663 ?auto_33655 ) ) ( AVAILABLE ?auto_33665 ) ( IN ?auto_33658 ?auto_33662 ) ( TRUCK-AT ?auto_33662 ?auto_33666 ) ( not ( = ?auto_33666 ?auto_33660 ) ) ( not ( = ?auto_33656 ?auto_33666 ) ) ( not ( = ?auto_33661 ?auto_33666 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33662 ?auto_33666 ?auto_33660 )
      ( MAKE-ON ?auto_33653 ?auto_33654 )
      ( MAKE-ON-VERIFY ?auto_33653 ?auto_33654 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33667 - SURFACE
      ?auto_33668 - SURFACE
    )
    :vars
    (
      ?auto_33669 - HOIST
      ?auto_33674 - PLACE
      ?auto_33677 - PLACE
      ?auto_33673 - HOIST
      ?auto_33672 - SURFACE
      ?auto_33670 - SURFACE
      ?auto_33676 - PLACE
      ?auto_33671 - HOIST
      ?auto_33678 - SURFACE
      ?auto_33680 - SURFACE
      ?auto_33675 - TRUCK
      ?auto_33679 - PLACE
      ?auto_33681 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33669 ?auto_33674 ) ( IS-CRATE ?auto_33667 ) ( not ( = ?auto_33667 ?auto_33668 ) ) ( not ( = ?auto_33677 ?auto_33674 ) ) ( HOIST-AT ?auto_33673 ?auto_33677 ) ( not ( = ?auto_33669 ?auto_33673 ) ) ( AVAILABLE ?auto_33673 ) ( SURFACE-AT ?auto_33667 ?auto_33677 ) ( ON ?auto_33667 ?auto_33672 ) ( CLEAR ?auto_33667 ) ( not ( = ?auto_33667 ?auto_33672 ) ) ( not ( = ?auto_33668 ?auto_33672 ) ) ( IS-CRATE ?auto_33668 ) ( not ( = ?auto_33667 ?auto_33670 ) ) ( not ( = ?auto_33668 ?auto_33670 ) ) ( not ( = ?auto_33672 ?auto_33670 ) ) ( not ( = ?auto_33676 ?auto_33674 ) ) ( not ( = ?auto_33677 ?auto_33676 ) ) ( HOIST-AT ?auto_33671 ?auto_33676 ) ( not ( = ?auto_33669 ?auto_33671 ) ) ( not ( = ?auto_33673 ?auto_33671 ) ) ( AVAILABLE ?auto_33671 ) ( SURFACE-AT ?auto_33668 ?auto_33676 ) ( ON ?auto_33668 ?auto_33678 ) ( CLEAR ?auto_33668 ) ( not ( = ?auto_33667 ?auto_33678 ) ) ( not ( = ?auto_33668 ?auto_33678 ) ) ( not ( = ?auto_33672 ?auto_33678 ) ) ( not ( = ?auto_33670 ?auto_33678 ) ) ( SURFACE-AT ?auto_33680 ?auto_33674 ) ( CLEAR ?auto_33680 ) ( IS-CRATE ?auto_33670 ) ( not ( = ?auto_33667 ?auto_33680 ) ) ( not ( = ?auto_33668 ?auto_33680 ) ) ( not ( = ?auto_33672 ?auto_33680 ) ) ( not ( = ?auto_33670 ?auto_33680 ) ) ( not ( = ?auto_33678 ?auto_33680 ) ) ( AVAILABLE ?auto_33669 ) ( TRUCK-AT ?auto_33675 ?auto_33679 ) ( not ( = ?auto_33679 ?auto_33674 ) ) ( not ( = ?auto_33677 ?auto_33679 ) ) ( not ( = ?auto_33676 ?auto_33679 ) ) ( HOIST-AT ?auto_33681 ?auto_33679 ) ( LIFTING ?auto_33681 ?auto_33670 ) ( not ( = ?auto_33669 ?auto_33681 ) ) ( not ( = ?auto_33673 ?auto_33681 ) ) ( not ( = ?auto_33671 ?auto_33681 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33681 ?auto_33670 ?auto_33675 ?auto_33679 )
      ( MAKE-ON ?auto_33667 ?auto_33668 )
      ( MAKE-ON-VERIFY ?auto_33667 ?auto_33668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33682 - SURFACE
      ?auto_33683 - SURFACE
    )
    :vars
    (
      ?auto_33693 - HOIST
      ?auto_33687 - PLACE
      ?auto_33686 - PLACE
      ?auto_33696 - HOIST
      ?auto_33691 - SURFACE
      ?auto_33692 - SURFACE
      ?auto_33694 - PLACE
      ?auto_33685 - HOIST
      ?auto_33684 - SURFACE
      ?auto_33695 - SURFACE
      ?auto_33689 - TRUCK
      ?auto_33690 - PLACE
      ?auto_33688 - HOIST
      ?auto_33697 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33693 ?auto_33687 ) ( IS-CRATE ?auto_33682 ) ( not ( = ?auto_33682 ?auto_33683 ) ) ( not ( = ?auto_33686 ?auto_33687 ) ) ( HOIST-AT ?auto_33696 ?auto_33686 ) ( not ( = ?auto_33693 ?auto_33696 ) ) ( AVAILABLE ?auto_33696 ) ( SURFACE-AT ?auto_33682 ?auto_33686 ) ( ON ?auto_33682 ?auto_33691 ) ( CLEAR ?auto_33682 ) ( not ( = ?auto_33682 ?auto_33691 ) ) ( not ( = ?auto_33683 ?auto_33691 ) ) ( IS-CRATE ?auto_33683 ) ( not ( = ?auto_33682 ?auto_33692 ) ) ( not ( = ?auto_33683 ?auto_33692 ) ) ( not ( = ?auto_33691 ?auto_33692 ) ) ( not ( = ?auto_33694 ?auto_33687 ) ) ( not ( = ?auto_33686 ?auto_33694 ) ) ( HOIST-AT ?auto_33685 ?auto_33694 ) ( not ( = ?auto_33693 ?auto_33685 ) ) ( not ( = ?auto_33696 ?auto_33685 ) ) ( AVAILABLE ?auto_33685 ) ( SURFACE-AT ?auto_33683 ?auto_33694 ) ( ON ?auto_33683 ?auto_33684 ) ( CLEAR ?auto_33683 ) ( not ( = ?auto_33682 ?auto_33684 ) ) ( not ( = ?auto_33683 ?auto_33684 ) ) ( not ( = ?auto_33691 ?auto_33684 ) ) ( not ( = ?auto_33692 ?auto_33684 ) ) ( SURFACE-AT ?auto_33695 ?auto_33687 ) ( CLEAR ?auto_33695 ) ( IS-CRATE ?auto_33692 ) ( not ( = ?auto_33682 ?auto_33695 ) ) ( not ( = ?auto_33683 ?auto_33695 ) ) ( not ( = ?auto_33691 ?auto_33695 ) ) ( not ( = ?auto_33692 ?auto_33695 ) ) ( not ( = ?auto_33684 ?auto_33695 ) ) ( AVAILABLE ?auto_33693 ) ( TRUCK-AT ?auto_33689 ?auto_33690 ) ( not ( = ?auto_33690 ?auto_33687 ) ) ( not ( = ?auto_33686 ?auto_33690 ) ) ( not ( = ?auto_33694 ?auto_33690 ) ) ( HOIST-AT ?auto_33688 ?auto_33690 ) ( not ( = ?auto_33693 ?auto_33688 ) ) ( not ( = ?auto_33696 ?auto_33688 ) ) ( not ( = ?auto_33685 ?auto_33688 ) ) ( AVAILABLE ?auto_33688 ) ( SURFACE-AT ?auto_33692 ?auto_33690 ) ( ON ?auto_33692 ?auto_33697 ) ( CLEAR ?auto_33692 ) ( not ( = ?auto_33682 ?auto_33697 ) ) ( not ( = ?auto_33683 ?auto_33697 ) ) ( not ( = ?auto_33691 ?auto_33697 ) ) ( not ( = ?auto_33692 ?auto_33697 ) ) ( not ( = ?auto_33684 ?auto_33697 ) ) ( not ( = ?auto_33695 ?auto_33697 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33688 ?auto_33692 ?auto_33697 ?auto_33690 )
      ( MAKE-ON ?auto_33682 ?auto_33683 )
      ( MAKE-ON-VERIFY ?auto_33682 ?auto_33683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33698 - SURFACE
      ?auto_33699 - SURFACE
    )
    :vars
    (
      ?auto_33706 - HOIST
      ?auto_33710 - PLACE
      ?auto_33707 - PLACE
      ?auto_33705 - HOIST
      ?auto_33709 - SURFACE
      ?auto_33711 - SURFACE
      ?auto_33703 - PLACE
      ?auto_33712 - HOIST
      ?auto_33700 - SURFACE
      ?auto_33704 - SURFACE
      ?auto_33701 - PLACE
      ?auto_33702 - HOIST
      ?auto_33708 - SURFACE
      ?auto_33713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33706 ?auto_33710 ) ( IS-CRATE ?auto_33698 ) ( not ( = ?auto_33698 ?auto_33699 ) ) ( not ( = ?auto_33707 ?auto_33710 ) ) ( HOIST-AT ?auto_33705 ?auto_33707 ) ( not ( = ?auto_33706 ?auto_33705 ) ) ( AVAILABLE ?auto_33705 ) ( SURFACE-AT ?auto_33698 ?auto_33707 ) ( ON ?auto_33698 ?auto_33709 ) ( CLEAR ?auto_33698 ) ( not ( = ?auto_33698 ?auto_33709 ) ) ( not ( = ?auto_33699 ?auto_33709 ) ) ( IS-CRATE ?auto_33699 ) ( not ( = ?auto_33698 ?auto_33711 ) ) ( not ( = ?auto_33699 ?auto_33711 ) ) ( not ( = ?auto_33709 ?auto_33711 ) ) ( not ( = ?auto_33703 ?auto_33710 ) ) ( not ( = ?auto_33707 ?auto_33703 ) ) ( HOIST-AT ?auto_33712 ?auto_33703 ) ( not ( = ?auto_33706 ?auto_33712 ) ) ( not ( = ?auto_33705 ?auto_33712 ) ) ( AVAILABLE ?auto_33712 ) ( SURFACE-AT ?auto_33699 ?auto_33703 ) ( ON ?auto_33699 ?auto_33700 ) ( CLEAR ?auto_33699 ) ( not ( = ?auto_33698 ?auto_33700 ) ) ( not ( = ?auto_33699 ?auto_33700 ) ) ( not ( = ?auto_33709 ?auto_33700 ) ) ( not ( = ?auto_33711 ?auto_33700 ) ) ( SURFACE-AT ?auto_33704 ?auto_33710 ) ( CLEAR ?auto_33704 ) ( IS-CRATE ?auto_33711 ) ( not ( = ?auto_33698 ?auto_33704 ) ) ( not ( = ?auto_33699 ?auto_33704 ) ) ( not ( = ?auto_33709 ?auto_33704 ) ) ( not ( = ?auto_33711 ?auto_33704 ) ) ( not ( = ?auto_33700 ?auto_33704 ) ) ( AVAILABLE ?auto_33706 ) ( not ( = ?auto_33701 ?auto_33710 ) ) ( not ( = ?auto_33707 ?auto_33701 ) ) ( not ( = ?auto_33703 ?auto_33701 ) ) ( HOIST-AT ?auto_33702 ?auto_33701 ) ( not ( = ?auto_33706 ?auto_33702 ) ) ( not ( = ?auto_33705 ?auto_33702 ) ) ( not ( = ?auto_33712 ?auto_33702 ) ) ( AVAILABLE ?auto_33702 ) ( SURFACE-AT ?auto_33711 ?auto_33701 ) ( ON ?auto_33711 ?auto_33708 ) ( CLEAR ?auto_33711 ) ( not ( = ?auto_33698 ?auto_33708 ) ) ( not ( = ?auto_33699 ?auto_33708 ) ) ( not ( = ?auto_33709 ?auto_33708 ) ) ( not ( = ?auto_33711 ?auto_33708 ) ) ( not ( = ?auto_33700 ?auto_33708 ) ) ( not ( = ?auto_33704 ?auto_33708 ) ) ( TRUCK-AT ?auto_33713 ?auto_33710 ) )
    :subtasks
    ( ( !DRIVE ?auto_33713 ?auto_33710 ?auto_33701 )
      ( MAKE-ON ?auto_33698 ?auto_33699 )
      ( MAKE-ON-VERIFY ?auto_33698 ?auto_33699 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33714 - SURFACE
      ?auto_33715 - SURFACE
    )
    :vars
    (
      ?auto_33722 - HOIST
      ?auto_33726 - PLACE
      ?auto_33721 - PLACE
      ?auto_33725 - HOIST
      ?auto_33729 - SURFACE
      ?auto_33719 - SURFACE
      ?auto_33727 - PLACE
      ?auto_33723 - HOIST
      ?auto_33728 - SURFACE
      ?auto_33724 - SURFACE
      ?auto_33720 - PLACE
      ?auto_33717 - HOIST
      ?auto_33716 - SURFACE
      ?auto_33718 - TRUCK
      ?auto_33730 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33722 ?auto_33726 ) ( IS-CRATE ?auto_33714 ) ( not ( = ?auto_33714 ?auto_33715 ) ) ( not ( = ?auto_33721 ?auto_33726 ) ) ( HOIST-AT ?auto_33725 ?auto_33721 ) ( not ( = ?auto_33722 ?auto_33725 ) ) ( AVAILABLE ?auto_33725 ) ( SURFACE-AT ?auto_33714 ?auto_33721 ) ( ON ?auto_33714 ?auto_33729 ) ( CLEAR ?auto_33714 ) ( not ( = ?auto_33714 ?auto_33729 ) ) ( not ( = ?auto_33715 ?auto_33729 ) ) ( IS-CRATE ?auto_33715 ) ( not ( = ?auto_33714 ?auto_33719 ) ) ( not ( = ?auto_33715 ?auto_33719 ) ) ( not ( = ?auto_33729 ?auto_33719 ) ) ( not ( = ?auto_33727 ?auto_33726 ) ) ( not ( = ?auto_33721 ?auto_33727 ) ) ( HOIST-AT ?auto_33723 ?auto_33727 ) ( not ( = ?auto_33722 ?auto_33723 ) ) ( not ( = ?auto_33725 ?auto_33723 ) ) ( AVAILABLE ?auto_33723 ) ( SURFACE-AT ?auto_33715 ?auto_33727 ) ( ON ?auto_33715 ?auto_33728 ) ( CLEAR ?auto_33715 ) ( not ( = ?auto_33714 ?auto_33728 ) ) ( not ( = ?auto_33715 ?auto_33728 ) ) ( not ( = ?auto_33729 ?auto_33728 ) ) ( not ( = ?auto_33719 ?auto_33728 ) ) ( IS-CRATE ?auto_33719 ) ( not ( = ?auto_33714 ?auto_33724 ) ) ( not ( = ?auto_33715 ?auto_33724 ) ) ( not ( = ?auto_33729 ?auto_33724 ) ) ( not ( = ?auto_33719 ?auto_33724 ) ) ( not ( = ?auto_33728 ?auto_33724 ) ) ( not ( = ?auto_33720 ?auto_33726 ) ) ( not ( = ?auto_33721 ?auto_33720 ) ) ( not ( = ?auto_33727 ?auto_33720 ) ) ( HOIST-AT ?auto_33717 ?auto_33720 ) ( not ( = ?auto_33722 ?auto_33717 ) ) ( not ( = ?auto_33725 ?auto_33717 ) ) ( not ( = ?auto_33723 ?auto_33717 ) ) ( AVAILABLE ?auto_33717 ) ( SURFACE-AT ?auto_33719 ?auto_33720 ) ( ON ?auto_33719 ?auto_33716 ) ( CLEAR ?auto_33719 ) ( not ( = ?auto_33714 ?auto_33716 ) ) ( not ( = ?auto_33715 ?auto_33716 ) ) ( not ( = ?auto_33729 ?auto_33716 ) ) ( not ( = ?auto_33719 ?auto_33716 ) ) ( not ( = ?auto_33728 ?auto_33716 ) ) ( not ( = ?auto_33724 ?auto_33716 ) ) ( TRUCK-AT ?auto_33718 ?auto_33726 ) ( SURFACE-AT ?auto_33730 ?auto_33726 ) ( CLEAR ?auto_33730 ) ( LIFTING ?auto_33722 ?auto_33724 ) ( IS-CRATE ?auto_33724 ) ( not ( = ?auto_33714 ?auto_33730 ) ) ( not ( = ?auto_33715 ?auto_33730 ) ) ( not ( = ?auto_33729 ?auto_33730 ) ) ( not ( = ?auto_33719 ?auto_33730 ) ) ( not ( = ?auto_33728 ?auto_33730 ) ) ( not ( = ?auto_33724 ?auto_33730 ) ) ( not ( = ?auto_33716 ?auto_33730 ) ) )
    :subtasks
    ( ( !DROP ?auto_33722 ?auto_33724 ?auto_33730 ?auto_33726 )
      ( MAKE-ON ?auto_33714 ?auto_33715 )
      ( MAKE-ON-VERIFY ?auto_33714 ?auto_33715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33731 - SURFACE
      ?auto_33732 - SURFACE
    )
    :vars
    (
      ?auto_33735 - HOIST
      ?auto_33747 - PLACE
      ?auto_33733 - PLACE
      ?auto_33742 - HOIST
      ?auto_33737 - SURFACE
      ?auto_33746 - SURFACE
      ?auto_33743 - PLACE
      ?auto_33734 - HOIST
      ?auto_33739 - SURFACE
      ?auto_33744 - SURFACE
      ?auto_33738 - PLACE
      ?auto_33736 - HOIST
      ?auto_33741 - SURFACE
      ?auto_33740 - TRUCK
      ?auto_33745 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33735 ?auto_33747 ) ( IS-CRATE ?auto_33731 ) ( not ( = ?auto_33731 ?auto_33732 ) ) ( not ( = ?auto_33733 ?auto_33747 ) ) ( HOIST-AT ?auto_33742 ?auto_33733 ) ( not ( = ?auto_33735 ?auto_33742 ) ) ( AVAILABLE ?auto_33742 ) ( SURFACE-AT ?auto_33731 ?auto_33733 ) ( ON ?auto_33731 ?auto_33737 ) ( CLEAR ?auto_33731 ) ( not ( = ?auto_33731 ?auto_33737 ) ) ( not ( = ?auto_33732 ?auto_33737 ) ) ( IS-CRATE ?auto_33732 ) ( not ( = ?auto_33731 ?auto_33746 ) ) ( not ( = ?auto_33732 ?auto_33746 ) ) ( not ( = ?auto_33737 ?auto_33746 ) ) ( not ( = ?auto_33743 ?auto_33747 ) ) ( not ( = ?auto_33733 ?auto_33743 ) ) ( HOIST-AT ?auto_33734 ?auto_33743 ) ( not ( = ?auto_33735 ?auto_33734 ) ) ( not ( = ?auto_33742 ?auto_33734 ) ) ( AVAILABLE ?auto_33734 ) ( SURFACE-AT ?auto_33732 ?auto_33743 ) ( ON ?auto_33732 ?auto_33739 ) ( CLEAR ?auto_33732 ) ( not ( = ?auto_33731 ?auto_33739 ) ) ( not ( = ?auto_33732 ?auto_33739 ) ) ( not ( = ?auto_33737 ?auto_33739 ) ) ( not ( = ?auto_33746 ?auto_33739 ) ) ( IS-CRATE ?auto_33746 ) ( not ( = ?auto_33731 ?auto_33744 ) ) ( not ( = ?auto_33732 ?auto_33744 ) ) ( not ( = ?auto_33737 ?auto_33744 ) ) ( not ( = ?auto_33746 ?auto_33744 ) ) ( not ( = ?auto_33739 ?auto_33744 ) ) ( not ( = ?auto_33738 ?auto_33747 ) ) ( not ( = ?auto_33733 ?auto_33738 ) ) ( not ( = ?auto_33743 ?auto_33738 ) ) ( HOIST-AT ?auto_33736 ?auto_33738 ) ( not ( = ?auto_33735 ?auto_33736 ) ) ( not ( = ?auto_33742 ?auto_33736 ) ) ( not ( = ?auto_33734 ?auto_33736 ) ) ( AVAILABLE ?auto_33736 ) ( SURFACE-AT ?auto_33746 ?auto_33738 ) ( ON ?auto_33746 ?auto_33741 ) ( CLEAR ?auto_33746 ) ( not ( = ?auto_33731 ?auto_33741 ) ) ( not ( = ?auto_33732 ?auto_33741 ) ) ( not ( = ?auto_33737 ?auto_33741 ) ) ( not ( = ?auto_33746 ?auto_33741 ) ) ( not ( = ?auto_33739 ?auto_33741 ) ) ( not ( = ?auto_33744 ?auto_33741 ) ) ( TRUCK-AT ?auto_33740 ?auto_33747 ) ( SURFACE-AT ?auto_33745 ?auto_33747 ) ( CLEAR ?auto_33745 ) ( IS-CRATE ?auto_33744 ) ( not ( = ?auto_33731 ?auto_33745 ) ) ( not ( = ?auto_33732 ?auto_33745 ) ) ( not ( = ?auto_33737 ?auto_33745 ) ) ( not ( = ?auto_33746 ?auto_33745 ) ) ( not ( = ?auto_33739 ?auto_33745 ) ) ( not ( = ?auto_33744 ?auto_33745 ) ) ( not ( = ?auto_33741 ?auto_33745 ) ) ( AVAILABLE ?auto_33735 ) ( IN ?auto_33744 ?auto_33740 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33735 ?auto_33744 ?auto_33740 ?auto_33747 )
      ( MAKE-ON ?auto_33731 ?auto_33732 )
      ( MAKE-ON-VERIFY ?auto_33731 ?auto_33732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33748 - SURFACE
      ?auto_33749 - SURFACE
    )
    :vars
    (
      ?auto_33757 - HOIST
      ?auto_33764 - PLACE
      ?auto_33761 - PLACE
      ?auto_33751 - HOIST
      ?auto_33750 - SURFACE
      ?auto_33759 - SURFACE
      ?auto_33753 - PLACE
      ?auto_33752 - HOIST
      ?auto_33756 - SURFACE
      ?auto_33763 - SURFACE
      ?auto_33758 - PLACE
      ?auto_33762 - HOIST
      ?auto_33760 - SURFACE
      ?auto_33755 - SURFACE
      ?auto_33754 - TRUCK
      ?auto_33765 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33757 ?auto_33764 ) ( IS-CRATE ?auto_33748 ) ( not ( = ?auto_33748 ?auto_33749 ) ) ( not ( = ?auto_33761 ?auto_33764 ) ) ( HOIST-AT ?auto_33751 ?auto_33761 ) ( not ( = ?auto_33757 ?auto_33751 ) ) ( AVAILABLE ?auto_33751 ) ( SURFACE-AT ?auto_33748 ?auto_33761 ) ( ON ?auto_33748 ?auto_33750 ) ( CLEAR ?auto_33748 ) ( not ( = ?auto_33748 ?auto_33750 ) ) ( not ( = ?auto_33749 ?auto_33750 ) ) ( IS-CRATE ?auto_33749 ) ( not ( = ?auto_33748 ?auto_33759 ) ) ( not ( = ?auto_33749 ?auto_33759 ) ) ( not ( = ?auto_33750 ?auto_33759 ) ) ( not ( = ?auto_33753 ?auto_33764 ) ) ( not ( = ?auto_33761 ?auto_33753 ) ) ( HOIST-AT ?auto_33752 ?auto_33753 ) ( not ( = ?auto_33757 ?auto_33752 ) ) ( not ( = ?auto_33751 ?auto_33752 ) ) ( AVAILABLE ?auto_33752 ) ( SURFACE-AT ?auto_33749 ?auto_33753 ) ( ON ?auto_33749 ?auto_33756 ) ( CLEAR ?auto_33749 ) ( not ( = ?auto_33748 ?auto_33756 ) ) ( not ( = ?auto_33749 ?auto_33756 ) ) ( not ( = ?auto_33750 ?auto_33756 ) ) ( not ( = ?auto_33759 ?auto_33756 ) ) ( IS-CRATE ?auto_33759 ) ( not ( = ?auto_33748 ?auto_33763 ) ) ( not ( = ?auto_33749 ?auto_33763 ) ) ( not ( = ?auto_33750 ?auto_33763 ) ) ( not ( = ?auto_33759 ?auto_33763 ) ) ( not ( = ?auto_33756 ?auto_33763 ) ) ( not ( = ?auto_33758 ?auto_33764 ) ) ( not ( = ?auto_33761 ?auto_33758 ) ) ( not ( = ?auto_33753 ?auto_33758 ) ) ( HOIST-AT ?auto_33762 ?auto_33758 ) ( not ( = ?auto_33757 ?auto_33762 ) ) ( not ( = ?auto_33751 ?auto_33762 ) ) ( not ( = ?auto_33752 ?auto_33762 ) ) ( AVAILABLE ?auto_33762 ) ( SURFACE-AT ?auto_33759 ?auto_33758 ) ( ON ?auto_33759 ?auto_33760 ) ( CLEAR ?auto_33759 ) ( not ( = ?auto_33748 ?auto_33760 ) ) ( not ( = ?auto_33749 ?auto_33760 ) ) ( not ( = ?auto_33750 ?auto_33760 ) ) ( not ( = ?auto_33759 ?auto_33760 ) ) ( not ( = ?auto_33756 ?auto_33760 ) ) ( not ( = ?auto_33763 ?auto_33760 ) ) ( SURFACE-AT ?auto_33755 ?auto_33764 ) ( CLEAR ?auto_33755 ) ( IS-CRATE ?auto_33763 ) ( not ( = ?auto_33748 ?auto_33755 ) ) ( not ( = ?auto_33749 ?auto_33755 ) ) ( not ( = ?auto_33750 ?auto_33755 ) ) ( not ( = ?auto_33759 ?auto_33755 ) ) ( not ( = ?auto_33756 ?auto_33755 ) ) ( not ( = ?auto_33763 ?auto_33755 ) ) ( not ( = ?auto_33760 ?auto_33755 ) ) ( AVAILABLE ?auto_33757 ) ( IN ?auto_33763 ?auto_33754 ) ( TRUCK-AT ?auto_33754 ?auto_33765 ) ( not ( = ?auto_33765 ?auto_33764 ) ) ( not ( = ?auto_33761 ?auto_33765 ) ) ( not ( = ?auto_33753 ?auto_33765 ) ) ( not ( = ?auto_33758 ?auto_33765 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33754 ?auto_33765 ?auto_33764 )
      ( MAKE-ON ?auto_33748 ?auto_33749 )
      ( MAKE-ON-VERIFY ?auto_33748 ?auto_33749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33766 - SURFACE
      ?auto_33767 - SURFACE
    )
    :vars
    (
      ?auto_33777 - HOIST
      ?auto_33770 - PLACE
      ?auto_33773 - PLACE
      ?auto_33779 - HOIST
      ?auto_33775 - SURFACE
      ?auto_33769 - SURFACE
      ?auto_33782 - PLACE
      ?auto_33780 - HOIST
      ?auto_33771 - SURFACE
      ?auto_33768 - SURFACE
      ?auto_33774 - PLACE
      ?auto_33783 - HOIST
      ?auto_33781 - SURFACE
      ?auto_33778 - SURFACE
      ?auto_33772 - TRUCK
      ?auto_33776 - PLACE
      ?auto_33784 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33777 ?auto_33770 ) ( IS-CRATE ?auto_33766 ) ( not ( = ?auto_33766 ?auto_33767 ) ) ( not ( = ?auto_33773 ?auto_33770 ) ) ( HOIST-AT ?auto_33779 ?auto_33773 ) ( not ( = ?auto_33777 ?auto_33779 ) ) ( AVAILABLE ?auto_33779 ) ( SURFACE-AT ?auto_33766 ?auto_33773 ) ( ON ?auto_33766 ?auto_33775 ) ( CLEAR ?auto_33766 ) ( not ( = ?auto_33766 ?auto_33775 ) ) ( not ( = ?auto_33767 ?auto_33775 ) ) ( IS-CRATE ?auto_33767 ) ( not ( = ?auto_33766 ?auto_33769 ) ) ( not ( = ?auto_33767 ?auto_33769 ) ) ( not ( = ?auto_33775 ?auto_33769 ) ) ( not ( = ?auto_33782 ?auto_33770 ) ) ( not ( = ?auto_33773 ?auto_33782 ) ) ( HOIST-AT ?auto_33780 ?auto_33782 ) ( not ( = ?auto_33777 ?auto_33780 ) ) ( not ( = ?auto_33779 ?auto_33780 ) ) ( AVAILABLE ?auto_33780 ) ( SURFACE-AT ?auto_33767 ?auto_33782 ) ( ON ?auto_33767 ?auto_33771 ) ( CLEAR ?auto_33767 ) ( not ( = ?auto_33766 ?auto_33771 ) ) ( not ( = ?auto_33767 ?auto_33771 ) ) ( not ( = ?auto_33775 ?auto_33771 ) ) ( not ( = ?auto_33769 ?auto_33771 ) ) ( IS-CRATE ?auto_33769 ) ( not ( = ?auto_33766 ?auto_33768 ) ) ( not ( = ?auto_33767 ?auto_33768 ) ) ( not ( = ?auto_33775 ?auto_33768 ) ) ( not ( = ?auto_33769 ?auto_33768 ) ) ( not ( = ?auto_33771 ?auto_33768 ) ) ( not ( = ?auto_33774 ?auto_33770 ) ) ( not ( = ?auto_33773 ?auto_33774 ) ) ( not ( = ?auto_33782 ?auto_33774 ) ) ( HOIST-AT ?auto_33783 ?auto_33774 ) ( not ( = ?auto_33777 ?auto_33783 ) ) ( not ( = ?auto_33779 ?auto_33783 ) ) ( not ( = ?auto_33780 ?auto_33783 ) ) ( AVAILABLE ?auto_33783 ) ( SURFACE-AT ?auto_33769 ?auto_33774 ) ( ON ?auto_33769 ?auto_33781 ) ( CLEAR ?auto_33769 ) ( not ( = ?auto_33766 ?auto_33781 ) ) ( not ( = ?auto_33767 ?auto_33781 ) ) ( not ( = ?auto_33775 ?auto_33781 ) ) ( not ( = ?auto_33769 ?auto_33781 ) ) ( not ( = ?auto_33771 ?auto_33781 ) ) ( not ( = ?auto_33768 ?auto_33781 ) ) ( SURFACE-AT ?auto_33778 ?auto_33770 ) ( CLEAR ?auto_33778 ) ( IS-CRATE ?auto_33768 ) ( not ( = ?auto_33766 ?auto_33778 ) ) ( not ( = ?auto_33767 ?auto_33778 ) ) ( not ( = ?auto_33775 ?auto_33778 ) ) ( not ( = ?auto_33769 ?auto_33778 ) ) ( not ( = ?auto_33771 ?auto_33778 ) ) ( not ( = ?auto_33768 ?auto_33778 ) ) ( not ( = ?auto_33781 ?auto_33778 ) ) ( AVAILABLE ?auto_33777 ) ( TRUCK-AT ?auto_33772 ?auto_33776 ) ( not ( = ?auto_33776 ?auto_33770 ) ) ( not ( = ?auto_33773 ?auto_33776 ) ) ( not ( = ?auto_33782 ?auto_33776 ) ) ( not ( = ?auto_33774 ?auto_33776 ) ) ( HOIST-AT ?auto_33784 ?auto_33776 ) ( LIFTING ?auto_33784 ?auto_33768 ) ( not ( = ?auto_33777 ?auto_33784 ) ) ( not ( = ?auto_33779 ?auto_33784 ) ) ( not ( = ?auto_33780 ?auto_33784 ) ) ( not ( = ?auto_33783 ?auto_33784 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33784 ?auto_33768 ?auto_33772 ?auto_33776 )
      ( MAKE-ON ?auto_33766 ?auto_33767 )
      ( MAKE-ON-VERIFY ?auto_33766 ?auto_33767 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33785 - SURFACE
      ?auto_33786 - SURFACE
    )
    :vars
    (
      ?auto_33789 - HOIST
      ?auto_33793 - PLACE
      ?auto_33796 - PLACE
      ?auto_33800 - HOIST
      ?auto_33794 - SURFACE
      ?auto_33795 - SURFACE
      ?auto_33788 - PLACE
      ?auto_33787 - HOIST
      ?auto_33790 - SURFACE
      ?auto_33791 - SURFACE
      ?auto_33799 - PLACE
      ?auto_33797 - HOIST
      ?auto_33801 - SURFACE
      ?auto_33802 - SURFACE
      ?auto_33803 - TRUCK
      ?auto_33798 - PLACE
      ?auto_33792 - HOIST
      ?auto_33804 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33789 ?auto_33793 ) ( IS-CRATE ?auto_33785 ) ( not ( = ?auto_33785 ?auto_33786 ) ) ( not ( = ?auto_33796 ?auto_33793 ) ) ( HOIST-AT ?auto_33800 ?auto_33796 ) ( not ( = ?auto_33789 ?auto_33800 ) ) ( AVAILABLE ?auto_33800 ) ( SURFACE-AT ?auto_33785 ?auto_33796 ) ( ON ?auto_33785 ?auto_33794 ) ( CLEAR ?auto_33785 ) ( not ( = ?auto_33785 ?auto_33794 ) ) ( not ( = ?auto_33786 ?auto_33794 ) ) ( IS-CRATE ?auto_33786 ) ( not ( = ?auto_33785 ?auto_33795 ) ) ( not ( = ?auto_33786 ?auto_33795 ) ) ( not ( = ?auto_33794 ?auto_33795 ) ) ( not ( = ?auto_33788 ?auto_33793 ) ) ( not ( = ?auto_33796 ?auto_33788 ) ) ( HOIST-AT ?auto_33787 ?auto_33788 ) ( not ( = ?auto_33789 ?auto_33787 ) ) ( not ( = ?auto_33800 ?auto_33787 ) ) ( AVAILABLE ?auto_33787 ) ( SURFACE-AT ?auto_33786 ?auto_33788 ) ( ON ?auto_33786 ?auto_33790 ) ( CLEAR ?auto_33786 ) ( not ( = ?auto_33785 ?auto_33790 ) ) ( not ( = ?auto_33786 ?auto_33790 ) ) ( not ( = ?auto_33794 ?auto_33790 ) ) ( not ( = ?auto_33795 ?auto_33790 ) ) ( IS-CRATE ?auto_33795 ) ( not ( = ?auto_33785 ?auto_33791 ) ) ( not ( = ?auto_33786 ?auto_33791 ) ) ( not ( = ?auto_33794 ?auto_33791 ) ) ( not ( = ?auto_33795 ?auto_33791 ) ) ( not ( = ?auto_33790 ?auto_33791 ) ) ( not ( = ?auto_33799 ?auto_33793 ) ) ( not ( = ?auto_33796 ?auto_33799 ) ) ( not ( = ?auto_33788 ?auto_33799 ) ) ( HOIST-AT ?auto_33797 ?auto_33799 ) ( not ( = ?auto_33789 ?auto_33797 ) ) ( not ( = ?auto_33800 ?auto_33797 ) ) ( not ( = ?auto_33787 ?auto_33797 ) ) ( AVAILABLE ?auto_33797 ) ( SURFACE-AT ?auto_33795 ?auto_33799 ) ( ON ?auto_33795 ?auto_33801 ) ( CLEAR ?auto_33795 ) ( not ( = ?auto_33785 ?auto_33801 ) ) ( not ( = ?auto_33786 ?auto_33801 ) ) ( not ( = ?auto_33794 ?auto_33801 ) ) ( not ( = ?auto_33795 ?auto_33801 ) ) ( not ( = ?auto_33790 ?auto_33801 ) ) ( not ( = ?auto_33791 ?auto_33801 ) ) ( SURFACE-AT ?auto_33802 ?auto_33793 ) ( CLEAR ?auto_33802 ) ( IS-CRATE ?auto_33791 ) ( not ( = ?auto_33785 ?auto_33802 ) ) ( not ( = ?auto_33786 ?auto_33802 ) ) ( not ( = ?auto_33794 ?auto_33802 ) ) ( not ( = ?auto_33795 ?auto_33802 ) ) ( not ( = ?auto_33790 ?auto_33802 ) ) ( not ( = ?auto_33791 ?auto_33802 ) ) ( not ( = ?auto_33801 ?auto_33802 ) ) ( AVAILABLE ?auto_33789 ) ( TRUCK-AT ?auto_33803 ?auto_33798 ) ( not ( = ?auto_33798 ?auto_33793 ) ) ( not ( = ?auto_33796 ?auto_33798 ) ) ( not ( = ?auto_33788 ?auto_33798 ) ) ( not ( = ?auto_33799 ?auto_33798 ) ) ( HOIST-AT ?auto_33792 ?auto_33798 ) ( not ( = ?auto_33789 ?auto_33792 ) ) ( not ( = ?auto_33800 ?auto_33792 ) ) ( not ( = ?auto_33787 ?auto_33792 ) ) ( not ( = ?auto_33797 ?auto_33792 ) ) ( AVAILABLE ?auto_33792 ) ( SURFACE-AT ?auto_33791 ?auto_33798 ) ( ON ?auto_33791 ?auto_33804 ) ( CLEAR ?auto_33791 ) ( not ( = ?auto_33785 ?auto_33804 ) ) ( not ( = ?auto_33786 ?auto_33804 ) ) ( not ( = ?auto_33794 ?auto_33804 ) ) ( not ( = ?auto_33795 ?auto_33804 ) ) ( not ( = ?auto_33790 ?auto_33804 ) ) ( not ( = ?auto_33791 ?auto_33804 ) ) ( not ( = ?auto_33801 ?auto_33804 ) ) ( not ( = ?auto_33802 ?auto_33804 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33792 ?auto_33791 ?auto_33804 ?auto_33798 )
      ( MAKE-ON ?auto_33785 ?auto_33786 )
      ( MAKE-ON-VERIFY ?auto_33785 ?auto_33786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33805 - SURFACE
      ?auto_33806 - SURFACE
    )
    :vars
    (
      ?auto_33822 - HOIST
      ?auto_33821 - PLACE
      ?auto_33808 - PLACE
      ?auto_33824 - HOIST
      ?auto_33812 - SURFACE
      ?auto_33807 - SURFACE
      ?auto_33823 - PLACE
      ?auto_33814 - HOIST
      ?auto_33817 - SURFACE
      ?auto_33818 - SURFACE
      ?auto_33813 - PLACE
      ?auto_33811 - HOIST
      ?auto_33820 - SURFACE
      ?auto_33815 - SURFACE
      ?auto_33809 - PLACE
      ?auto_33810 - HOIST
      ?auto_33819 - SURFACE
      ?auto_33816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33822 ?auto_33821 ) ( IS-CRATE ?auto_33805 ) ( not ( = ?auto_33805 ?auto_33806 ) ) ( not ( = ?auto_33808 ?auto_33821 ) ) ( HOIST-AT ?auto_33824 ?auto_33808 ) ( not ( = ?auto_33822 ?auto_33824 ) ) ( AVAILABLE ?auto_33824 ) ( SURFACE-AT ?auto_33805 ?auto_33808 ) ( ON ?auto_33805 ?auto_33812 ) ( CLEAR ?auto_33805 ) ( not ( = ?auto_33805 ?auto_33812 ) ) ( not ( = ?auto_33806 ?auto_33812 ) ) ( IS-CRATE ?auto_33806 ) ( not ( = ?auto_33805 ?auto_33807 ) ) ( not ( = ?auto_33806 ?auto_33807 ) ) ( not ( = ?auto_33812 ?auto_33807 ) ) ( not ( = ?auto_33823 ?auto_33821 ) ) ( not ( = ?auto_33808 ?auto_33823 ) ) ( HOIST-AT ?auto_33814 ?auto_33823 ) ( not ( = ?auto_33822 ?auto_33814 ) ) ( not ( = ?auto_33824 ?auto_33814 ) ) ( AVAILABLE ?auto_33814 ) ( SURFACE-AT ?auto_33806 ?auto_33823 ) ( ON ?auto_33806 ?auto_33817 ) ( CLEAR ?auto_33806 ) ( not ( = ?auto_33805 ?auto_33817 ) ) ( not ( = ?auto_33806 ?auto_33817 ) ) ( not ( = ?auto_33812 ?auto_33817 ) ) ( not ( = ?auto_33807 ?auto_33817 ) ) ( IS-CRATE ?auto_33807 ) ( not ( = ?auto_33805 ?auto_33818 ) ) ( not ( = ?auto_33806 ?auto_33818 ) ) ( not ( = ?auto_33812 ?auto_33818 ) ) ( not ( = ?auto_33807 ?auto_33818 ) ) ( not ( = ?auto_33817 ?auto_33818 ) ) ( not ( = ?auto_33813 ?auto_33821 ) ) ( not ( = ?auto_33808 ?auto_33813 ) ) ( not ( = ?auto_33823 ?auto_33813 ) ) ( HOIST-AT ?auto_33811 ?auto_33813 ) ( not ( = ?auto_33822 ?auto_33811 ) ) ( not ( = ?auto_33824 ?auto_33811 ) ) ( not ( = ?auto_33814 ?auto_33811 ) ) ( AVAILABLE ?auto_33811 ) ( SURFACE-AT ?auto_33807 ?auto_33813 ) ( ON ?auto_33807 ?auto_33820 ) ( CLEAR ?auto_33807 ) ( not ( = ?auto_33805 ?auto_33820 ) ) ( not ( = ?auto_33806 ?auto_33820 ) ) ( not ( = ?auto_33812 ?auto_33820 ) ) ( not ( = ?auto_33807 ?auto_33820 ) ) ( not ( = ?auto_33817 ?auto_33820 ) ) ( not ( = ?auto_33818 ?auto_33820 ) ) ( SURFACE-AT ?auto_33815 ?auto_33821 ) ( CLEAR ?auto_33815 ) ( IS-CRATE ?auto_33818 ) ( not ( = ?auto_33805 ?auto_33815 ) ) ( not ( = ?auto_33806 ?auto_33815 ) ) ( not ( = ?auto_33812 ?auto_33815 ) ) ( not ( = ?auto_33807 ?auto_33815 ) ) ( not ( = ?auto_33817 ?auto_33815 ) ) ( not ( = ?auto_33818 ?auto_33815 ) ) ( not ( = ?auto_33820 ?auto_33815 ) ) ( AVAILABLE ?auto_33822 ) ( not ( = ?auto_33809 ?auto_33821 ) ) ( not ( = ?auto_33808 ?auto_33809 ) ) ( not ( = ?auto_33823 ?auto_33809 ) ) ( not ( = ?auto_33813 ?auto_33809 ) ) ( HOIST-AT ?auto_33810 ?auto_33809 ) ( not ( = ?auto_33822 ?auto_33810 ) ) ( not ( = ?auto_33824 ?auto_33810 ) ) ( not ( = ?auto_33814 ?auto_33810 ) ) ( not ( = ?auto_33811 ?auto_33810 ) ) ( AVAILABLE ?auto_33810 ) ( SURFACE-AT ?auto_33818 ?auto_33809 ) ( ON ?auto_33818 ?auto_33819 ) ( CLEAR ?auto_33818 ) ( not ( = ?auto_33805 ?auto_33819 ) ) ( not ( = ?auto_33806 ?auto_33819 ) ) ( not ( = ?auto_33812 ?auto_33819 ) ) ( not ( = ?auto_33807 ?auto_33819 ) ) ( not ( = ?auto_33817 ?auto_33819 ) ) ( not ( = ?auto_33818 ?auto_33819 ) ) ( not ( = ?auto_33820 ?auto_33819 ) ) ( not ( = ?auto_33815 ?auto_33819 ) ) ( TRUCK-AT ?auto_33816 ?auto_33821 ) )
    :subtasks
    ( ( !DRIVE ?auto_33816 ?auto_33821 ?auto_33809 )
      ( MAKE-ON ?auto_33805 ?auto_33806 )
      ( MAKE-ON-VERIFY ?auto_33805 ?auto_33806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33825 - SURFACE
      ?auto_33826 - SURFACE
    )
    :vars
    (
      ?auto_33841 - HOIST
      ?auto_33842 - PLACE
      ?auto_33838 - PLACE
      ?auto_33833 - HOIST
      ?auto_33836 - SURFACE
      ?auto_33837 - SURFACE
      ?auto_33834 - PLACE
      ?auto_33828 - HOIST
      ?auto_33827 - SURFACE
      ?auto_33843 - SURFACE
      ?auto_33835 - PLACE
      ?auto_33830 - HOIST
      ?auto_33840 - SURFACE
      ?auto_33844 - SURFACE
      ?auto_33832 - PLACE
      ?auto_33831 - HOIST
      ?auto_33829 - SURFACE
      ?auto_33839 - TRUCK
      ?auto_33845 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33841 ?auto_33842 ) ( IS-CRATE ?auto_33825 ) ( not ( = ?auto_33825 ?auto_33826 ) ) ( not ( = ?auto_33838 ?auto_33842 ) ) ( HOIST-AT ?auto_33833 ?auto_33838 ) ( not ( = ?auto_33841 ?auto_33833 ) ) ( AVAILABLE ?auto_33833 ) ( SURFACE-AT ?auto_33825 ?auto_33838 ) ( ON ?auto_33825 ?auto_33836 ) ( CLEAR ?auto_33825 ) ( not ( = ?auto_33825 ?auto_33836 ) ) ( not ( = ?auto_33826 ?auto_33836 ) ) ( IS-CRATE ?auto_33826 ) ( not ( = ?auto_33825 ?auto_33837 ) ) ( not ( = ?auto_33826 ?auto_33837 ) ) ( not ( = ?auto_33836 ?auto_33837 ) ) ( not ( = ?auto_33834 ?auto_33842 ) ) ( not ( = ?auto_33838 ?auto_33834 ) ) ( HOIST-AT ?auto_33828 ?auto_33834 ) ( not ( = ?auto_33841 ?auto_33828 ) ) ( not ( = ?auto_33833 ?auto_33828 ) ) ( AVAILABLE ?auto_33828 ) ( SURFACE-AT ?auto_33826 ?auto_33834 ) ( ON ?auto_33826 ?auto_33827 ) ( CLEAR ?auto_33826 ) ( not ( = ?auto_33825 ?auto_33827 ) ) ( not ( = ?auto_33826 ?auto_33827 ) ) ( not ( = ?auto_33836 ?auto_33827 ) ) ( not ( = ?auto_33837 ?auto_33827 ) ) ( IS-CRATE ?auto_33837 ) ( not ( = ?auto_33825 ?auto_33843 ) ) ( not ( = ?auto_33826 ?auto_33843 ) ) ( not ( = ?auto_33836 ?auto_33843 ) ) ( not ( = ?auto_33837 ?auto_33843 ) ) ( not ( = ?auto_33827 ?auto_33843 ) ) ( not ( = ?auto_33835 ?auto_33842 ) ) ( not ( = ?auto_33838 ?auto_33835 ) ) ( not ( = ?auto_33834 ?auto_33835 ) ) ( HOIST-AT ?auto_33830 ?auto_33835 ) ( not ( = ?auto_33841 ?auto_33830 ) ) ( not ( = ?auto_33833 ?auto_33830 ) ) ( not ( = ?auto_33828 ?auto_33830 ) ) ( AVAILABLE ?auto_33830 ) ( SURFACE-AT ?auto_33837 ?auto_33835 ) ( ON ?auto_33837 ?auto_33840 ) ( CLEAR ?auto_33837 ) ( not ( = ?auto_33825 ?auto_33840 ) ) ( not ( = ?auto_33826 ?auto_33840 ) ) ( not ( = ?auto_33836 ?auto_33840 ) ) ( not ( = ?auto_33837 ?auto_33840 ) ) ( not ( = ?auto_33827 ?auto_33840 ) ) ( not ( = ?auto_33843 ?auto_33840 ) ) ( IS-CRATE ?auto_33843 ) ( not ( = ?auto_33825 ?auto_33844 ) ) ( not ( = ?auto_33826 ?auto_33844 ) ) ( not ( = ?auto_33836 ?auto_33844 ) ) ( not ( = ?auto_33837 ?auto_33844 ) ) ( not ( = ?auto_33827 ?auto_33844 ) ) ( not ( = ?auto_33843 ?auto_33844 ) ) ( not ( = ?auto_33840 ?auto_33844 ) ) ( not ( = ?auto_33832 ?auto_33842 ) ) ( not ( = ?auto_33838 ?auto_33832 ) ) ( not ( = ?auto_33834 ?auto_33832 ) ) ( not ( = ?auto_33835 ?auto_33832 ) ) ( HOIST-AT ?auto_33831 ?auto_33832 ) ( not ( = ?auto_33841 ?auto_33831 ) ) ( not ( = ?auto_33833 ?auto_33831 ) ) ( not ( = ?auto_33828 ?auto_33831 ) ) ( not ( = ?auto_33830 ?auto_33831 ) ) ( AVAILABLE ?auto_33831 ) ( SURFACE-AT ?auto_33843 ?auto_33832 ) ( ON ?auto_33843 ?auto_33829 ) ( CLEAR ?auto_33843 ) ( not ( = ?auto_33825 ?auto_33829 ) ) ( not ( = ?auto_33826 ?auto_33829 ) ) ( not ( = ?auto_33836 ?auto_33829 ) ) ( not ( = ?auto_33837 ?auto_33829 ) ) ( not ( = ?auto_33827 ?auto_33829 ) ) ( not ( = ?auto_33843 ?auto_33829 ) ) ( not ( = ?auto_33840 ?auto_33829 ) ) ( not ( = ?auto_33844 ?auto_33829 ) ) ( TRUCK-AT ?auto_33839 ?auto_33842 ) ( SURFACE-AT ?auto_33845 ?auto_33842 ) ( CLEAR ?auto_33845 ) ( LIFTING ?auto_33841 ?auto_33844 ) ( IS-CRATE ?auto_33844 ) ( not ( = ?auto_33825 ?auto_33845 ) ) ( not ( = ?auto_33826 ?auto_33845 ) ) ( not ( = ?auto_33836 ?auto_33845 ) ) ( not ( = ?auto_33837 ?auto_33845 ) ) ( not ( = ?auto_33827 ?auto_33845 ) ) ( not ( = ?auto_33843 ?auto_33845 ) ) ( not ( = ?auto_33840 ?auto_33845 ) ) ( not ( = ?auto_33844 ?auto_33845 ) ) ( not ( = ?auto_33829 ?auto_33845 ) ) )
    :subtasks
    ( ( !DROP ?auto_33841 ?auto_33844 ?auto_33845 ?auto_33842 )
      ( MAKE-ON ?auto_33825 ?auto_33826 )
      ( MAKE-ON-VERIFY ?auto_33825 ?auto_33826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33846 - SURFACE
      ?auto_33847 - SURFACE
    )
    :vars
    (
      ?auto_33859 - HOIST
      ?auto_33850 - PLACE
      ?auto_33854 - PLACE
      ?auto_33849 - HOIST
      ?auto_33860 - SURFACE
      ?auto_33851 - SURFACE
      ?auto_33853 - PLACE
      ?auto_33864 - HOIST
      ?auto_33862 - SURFACE
      ?auto_33848 - SURFACE
      ?auto_33858 - PLACE
      ?auto_33857 - HOIST
      ?auto_33852 - SURFACE
      ?auto_33855 - SURFACE
      ?auto_33861 - PLACE
      ?auto_33865 - HOIST
      ?auto_33856 - SURFACE
      ?auto_33866 - TRUCK
      ?auto_33863 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33859 ?auto_33850 ) ( IS-CRATE ?auto_33846 ) ( not ( = ?auto_33846 ?auto_33847 ) ) ( not ( = ?auto_33854 ?auto_33850 ) ) ( HOIST-AT ?auto_33849 ?auto_33854 ) ( not ( = ?auto_33859 ?auto_33849 ) ) ( AVAILABLE ?auto_33849 ) ( SURFACE-AT ?auto_33846 ?auto_33854 ) ( ON ?auto_33846 ?auto_33860 ) ( CLEAR ?auto_33846 ) ( not ( = ?auto_33846 ?auto_33860 ) ) ( not ( = ?auto_33847 ?auto_33860 ) ) ( IS-CRATE ?auto_33847 ) ( not ( = ?auto_33846 ?auto_33851 ) ) ( not ( = ?auto_33847 ?auto_33851 ) ) ( not ( = ?auto_33860 ?auto_33851 ) ) ( not ( = ?auto_33853 ?auto_33850 ) ) ( not ( = ?auto_33854 ?auto_33853 ) ) ( HOIST-AT ?auto_33864 ?auto_33853 ) ( not ( = ?auto_33859 ?auto_33864 ) ) ( not ( = ?auto_33849 ?auto_33864 ) ) ( AVAILABLE ?auto_33864 ) ( SURFACE-AT ?auto_33847 ?auto_33853 ) ( ON ?auto_33847 ?auto_33862 ) ( CLEAR ?auto_33847 ) ( not ( = ?auto_33846 ?auto_33862 ) ) ( not ( = ?auto_33847 ?auto_33862 ) ) ( not ( = ?auto_33860 ?auto_33862 ) ) ( not ( = ?auto_33851 ?auto_33862 ) ) ( IS-CRATE ?auto_33851 ) ( not ( = ?auto_33846 ?auto_33848 ) ) ( not ( = ?auto_33847 ?auto_33848 ) ) ( not ( = ?auto_33860 ?auto_33848 ) ) ( not ( = ?auto_33851 ?auto_33848 ) ) ( not ( = ?auto_33862 ?auto_33848 ) ) ( not ( = ?auto_33858 ?auto_33850 ) ) ( not ( = ?auto_33854 ?auto_33858 ) ) ( not ( = ?auto_33853 ?auto_33858 ) ) ( HOIST-AT ?auto_33857 ?auto_33858 ) ( not ( = ?auto_33859 ?auto_33857 ) ) ( not ( = ?auto_33849 ?auto_33857 ) ) ( not ( = ?auto_33864 ?auto_33857 ) ) ( AVAILABLE ?auto_33857 ) ( SURFACE-AT ?auto_33851 ?auto_33858 ) ( ON ?auto_33851 ?auto_33852 ) ( CLEAR ?auto_33851 ) ( not ( = ?auto_33846 ?auto_33852 ) ) ( not ( = ?auto_33847 ?auto_33852 ) ) ( not ( = ?auto_33860 ?auto_33852 ) ) ( not ( = ?auto_33851 ?auto_33852 ) ) ( not ( = ?auto_33862 ?auto_33852 ) ) ( not ( = ?auto_33848 ?auto_33852 ) ) ( IS-CRATE ?auto_33848 ) ( not ( = ?auto_33846 ?auto_33855 ) ) ( not ( = ?auto_33847 ?auto_33855 ) ) ( not ( = ?auto_33860 ?auto_33855 ) ) ( not ( = ?auto_33851 ?auto_33855 ) ) ( not ( = ?auto_33862 ?auto_33855 ) ) ( not ( = ?auto_33848 ?auto_33855 ) ) ( not ( = ?auto_33852 ?auto_33855 ) ) ( not ( = ?auto_33861 ?auto_33850 ) ) ( not ( = ?auto_33854 ?auto_33861 ) ) ( not ( = ?auto_33853 ?auto_33861 ) ) ( not ( = ?auto_33858 ?auto_33861 ) ) ( HOIST-AT ?auto_33865 ?auto_33861 ) ( not ( = ?auto_33859 ?auto_33865 ) ) ( not ( = ?auto_33849 ?auto_33865 ) ) ( not ( = ?auto_33864 ?auto_33865 ) ) ( not ( = ?auto_33857 ?auto_33865 ) ) ( AVAILABLE ?auto_33865 ) ( SURFACE-AT ?auto_33848 ?auto_33861 ) ( ON ?auto_33848 ?auto_33856 ) ( CLEAR ?auto_33848 ) ( not ( = ?auto_33846 ?auto_33856 ) ) ( not ( = ?auto_33847 ?auto_33856 ) ) ( not ( = ?auto_33860 ?auto_33856 ) ) ( not ( = ?auto_33851 ?auto_33856 ) ) ( not ( = ?auto_33862 ?auto_33856 ) ) ( not ( = ?auto_33848 ?auto_33856 ) ) ( not ( = ?auto_33852 ?auto_33856 ) ) ( not ( = ?auto_33855 ?auto_33856 ) ) ( TRUCK-AT ?auto_33866 ?auto_33850 ) ( SURFACE-AT ?auto_33863 ?auto_33850 ) ( CLEAR ?auto_33863 ) ( IS-CRATE ?auto_33855 ) ( not ( = ?auto_33846 ?auto_33863 ) ) ( not ( = ?auto_33847 ?auto_33863 ) ) ( not ( = ?auto_33860 ?auto_33863 ) ) ( not ( = ?auto_33851 ?auto_33863 ) ) ( not ( = ?auto_33862 ?auto_33863 ) ) ( not ( = ?auto_33848 ?auto_33863 ) ) ( not ( = ?auto_33852 ?auto_33863 ) ) ( not ( = ?auto_33855 ?auto_33863 ) ) ( not ( = ?auto_33856 ?auto_33863 ) ) ( AVAILABLE ?auto_33859 ) ( IN ?auto_33855 ?auto_33866 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33859 ?auto_33855 ?auto_33866 ?auto_33850 )
      ( MAKE-ON ?auto_33846 ?auto_33847 )
      ( MAKE-ON-VERIFY ?auto_33846 ?auto_33847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33867 - SURFACE
      ?auto_33868 - SURFACE
    )
    :vars
    (
      ?auto_33878 - HOIST
      ?auto_33877 - PLACE
      ?auto_33884 - PLACE
      ?auto_33874 - HOIST
      ?auto_33885 - SURFACE
      ?auto_33881 - SURFACE
      ?auto_33887 - PLACE
      ?auto_33875 - HOIST
      ?auto_33883 - SURFACE
      ?auto_33879 - SURFACE
      ?auto_33871 - PLACE
      ?auto_33880 - HOIST
      ?auto_33869 - SURFACE
      ?auto_33870 - SURFACE
      ?auto_33873 - PLACE
      ?auto_33876 - HOIST
      ?auto_33886 - SURFACE
      ?auto_33872 - SURFACE
      ?auto_33882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33878 ?auto_33877 ) ( IS-CRATE ?auto_33867 ) ( not ( = ?auto_33867 ?auto_33868 ) ) ( not ( = ?auto_33884 ?auto_33877 ) ) ( HOIST-AT ?auto_33874 ?auto_33884 ) ( not ( = ?auto_33878 ?auto_33874 ) ) ( AVAILABLE ?auto_33874 ) ( SURFACE-AT ?auto_33867 ?auto_33884 ) ( ON ?auto_33867 ?auto_33885 ) ( CLEAR ?auto_33867 ) ( not ( = ?auto_33867 ?auto_33885 ) ) ( not ( = ?auto_33868 ?auto_33885 ) ) ( IS-CRATE ?auto_33868 ) ( not ( = ?auto_33867 ?auto_33881 ) ) ( not ( = ?auto_33868 ?auto_33881 ) ) ( not ( = ?auto_33885 ?auto_33881 ) ) ( not ( = ?auto_33887 ?auto_33877 ) ) ( not ( = ?auto_33884 ?auto_33887 ) ) ( HOIST-AT ?auto_33875 ?auto_33887 ) ( not ( = ?auto_33878 ?auto_33875 ) ) ( not ( = ?auto_33874 ?auto_33875 ) ) ( AVAILABLE ?auto_33875 ) ( SURFACE-AT ?auto_33868 ?auto_33887 ) ( ON ?auto_33868 ?auto_33883 ) ( CLEAR ?auto_33868 ) ( not ( = ?auto_33867 ?auto_33883 ) ) ( not ( = ?auto_33868 ?auto_33883 ) ) ( not ( = ?auto_33885 ?auto_33883 ) ) ( not ( = ?auto_33881 ?auto_33883 ) ) ( IS-CRATE ?auto_33881 ) ( not ( = ?auto_33867 ?auto_33879 ) ) ( not ( = ?auto_33868 ?auto_33879 ) ) ( not ( = ?auto_33885 ?auto_33879 ) ) ( not ( = ?auto_33881 ?auto_33879 ) ) ( not ( = ?auto_33883 ?auto_33879 ) ) ( not ( = ?auto_33871 ?auto_33877 ) ) ( not ( = ?auto_33884 ?auto_33871 ) ) ( not ( = ?auto_33887 ?auto_33871 ) ) ( HOIST-AT ?auto_33880 ?auto_33871 ) ( not ( = ?auto_33878 ?auto_33880 ) ) ( not ( = ?auto_33874 ?auto_33880 ) ) ( not ( = ?auto_33875 ?auto_33880 ) ) ( AVAILABLE ?auto_33880 ) ( SURFACE-AT ?auto_33881 ?auto_33871 ) ( ON ?auto_33881 ?auto_33869 ) ( CLEAR ?auto_33881 ) ( not ( = ?auto_33867 ?auto_33869 ) ) ( not ( = ?auto_33868 ?auto_33869 ) ) ( not ( = ?auto_33885 ?auto_33869 ) ) ( not ( = ?auto_33881 ?auto_33869 ) ) ( not ( = ?auto_33883 ?auto_33869 ) ) ( not ( = ?auto_33879 ?auto_33869 ) ) ( IS-CRATE ?auto_33879 ) ( not ( = ?auto_33867 ?auto_33870 ) ) ( not ( = ?auto_33868 ?auto_33870 ) ) ( not ( = ?auto_33885 ?auto_33870 ) ) ( not ( = ?auto_33881 ?auto_33870 ) ) ( not ( = ?auto_33883 ?auto_33870 ) ) ( not ( = ?auto_33879 ?auto_33870 ) ) ( not ( = ?auto_33869 ?auto_33870 ) ) ( not ( = ?auto_33873 ?auto_33877 ) ) ( not ( = ?auto_33884 ?auto_33873 ) ) ( not ( = ?auto_33887 ?auto_33873 ) ) ( not ( = ?auto_33871 ?auto_33873 ) ) ( HOIST-AT ?auto_33876 ?auto_33873 ) ( not ( = ?auto_33878 ?auto_33876 ) ) ( not ( = ?auto_33874 ?auto_33876 ) ) ( not ( = ?auto_33875 ?auto_33876 ) ) ( not ( = ?auto_33880 ?auto_33876 ) ) ( AVAILABLE ?auto_33876 ) ( SURFACE-AT ?auto_33879 ?auto_33873 ) ( ON ?auto_33879 ?auto_33886 ) ( CLEAR ?auto_33879 ) ( not ( = ?auto_33867 ?auto_33886 ) ) ( not ( = ?auto_33868 ?auto_33886 ) ) ( not ( = ?auto_33885 ?auto_33886 ) ) ( not ( = ?auto_33881 ?auto_33886 ) ) ( not ( = ?auto_33883 ?auto_33886 ) ) ( not ( = ?auto_33879 ?auto_33886 ) ) ( not ( = ?auto_33869 ?auto_33886 ) ) ( not ( = ?auto_33870 ?auto_33886 ) ) ( SURFACE-AT ?auto_33872 ?auto_33877 ) ( CLEAR ?auto_33872 ) ( IS-CRATE ?auto_33870 ) ( not ( = ?auto_33867 ?auto_33872 ) ) ( not ( = ?auto_33868 ?auto_33872 ) ) ( not ( = ?auto_33885 ?auto_33872 ) ) ( not ( = ?auto_33881 ?auto_33872 ) ) ( not ( = ?auto_33883 ?auto_33872 ) ) ( not ( = ?auto_33879 ?auto_33872 ) ) ( not ( = ?auto_33869 ?auto_33872 ) ) ( not ( = ?auto_33870 ?auto_33872 ) ) ( not ( = ?auto_33886 ?auto_33872 ) ) ( AVAILABLE ?auto_33878 ) ( IN ?auto_33870 ?auto_33882 ) ( TRUCK-AT ?auto_33882 ?auto_33871 ) )
    :subtasks
    ( ( !DRIVE ?auto_33882 ?auto_33871 ?auto_33877 )
      ( MAKE-ON ?auto_33867 ?auto_33868 )
      ( MAKE-ON-VERIFY ?auto_33867 ?auto_33868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33888 - SURFACE
      ?auto_33889 - SURFACE
    )
    :vars
    (
      ?auto_33901 - HOIST
      ?auto_33899 - PLACE
      ?auto_33905 - PLACE
      ?auto_33908 - HOIST
      ?auto_33903 - SURFACE
      ?auto_33893 - SURFACE
      ?auto_33891 - PLACE
      ?auto_33890 - HOIST
      ?auto_33896 - SURFACE
      ?auto_33895 - SURFACE
      ?auto_33900 - PLACE
      ?auto_33902 - HOIST
      ?auto_33894 - SURFACE
      ?auto_33897 - SURFACE
      ?auto_33906 - PLACE
      ?auto_33892 - HOIST
      ?auto_33904 - SURFACE
      ?auto_33907 - SURFACE
      ?auto_33898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33901 ?auto_33899 ) ( IS-CRATE ?auto_33888 ) ( not ( = ?auto_33888 ?auto_33889 ) ) ( not ( = ?auto_33905 ?auto_33899 ) ) ( HOIST-AT ?auto_33908 ?auto_33905 ) ( not ( = ?auto_33901 ?auto_33908 ) ) ( AVAILABLE ?auto_33908 ) ( SURFACE-AT ?auto_33888 ?auto_33905 ) ( ON ?auto_33888 ?auto_33903 ) ( CLEAR ?auto_33888 ) ( not ( = ?auto_33888 ?auto_33903 ) ) ( not ( = ?auto_33889 ?auto_33903 ) ) ( IS-CRATE ?auto_33889 ) ( not ( = ?auto_33888 ?auto_33893 ) ) ( not ( = ?auto_33889 ?auto_33893 ) ) ( not ( = ?auto_33903 ?auto_33893 ) ) ( not ( = ?auto_33891 ?auto_33899 ) ) ( not ( = ?auto_33905 ?auto_33891 ) ) ( HOIST-AT ?auto_33890 ?auto_33891 ) ( not ( = ?auto_33901 ?auto_33890 ) ) ( not ( = ?auto_33908 ?auto_33890 ) ) ( AVAILABLE ?auto_33890 ) ( SURFACE-AT ?auto_33889 ?auto_33891 ) ( ON ?auto_33889 ?auto_33896 ) ( CLEAR ?auto_33889 ) ( not ( = ?auto_33888 ?auto_33896 ) ) ( not ( = ?auto_33889 ?auto_33896 ) ) ( not ( = ?auto_33903 ?auto_33896 ) ) ( not ( = ?auto_33893 ?auto_33896 ) ) ( IS-CRATE ?auto_33893 ) ( not ( = ?auto_33888 ?auto_33895 ) ) ( not ( = ?auto_33889 ?auto_33895 ) ) ( not ( = ?auto_33903 ?auto_33895 ) ) ( not ( = ?auto_33893 ?auto_33895 ) ) ( not ( = ?auto_33896 ?auto_33895 ) ) ( not ( = ?auto_33900 ?auto_33899 ) ) ( not ( = ?auto_33905 ?auto_33900 ) ) ( not ( = ?auto_33891 ?auto_33900 ) ) ( HOIST-AT ?auto_33902 ?auto_33900 ) ( not ( = ?auto_33901 ?auto_33902 ) ) ( not ( = ?auto_33908 ?auto_33902 ) ) ( not ( = ?auto_33890 ?auto_33902 ) ) ( SURFACE-AT ?auto_33893 ?auto_33900 ) ( ON ?auto_33893 ?auto_33894 ) ( CLEAR ?auto_33893 ) ( not ( = ?auto_33888 ?auto_33894 ) ) ( not ( = ?auto_33889 ?auto_33894 ) ) ( not ( = ?auto_33903 ?auto_33894 ) ) ( not ( = ?auto_33893 ?auto_33894 ) ) ( not ( = ?auto_33896 ?auto_33894 ) ) ( not ( = ?auto_33895 ?auto_33894 ) ) ( IS-CRATE ?auto_33895 ) ( not ( = ?auto_33888 ?auto_33897 ) ) ( not ( = ?auto_33889 ?auto_33897 ) ) ( not ( = ?auto_33903 ?auto_33897 ) ) ( not ( = ?auto_33893 ?auto_33897 ) ) ( not ( = ?auto_33896 ?auto_33897 ) ) ( not ( = ?auto_33895 ?auto_33897 ) ) ( not ( = ?auto_33894 ?auto_33897 ) ) ( not ( = ?auto_33906 ?auto_33899 ) ) ( not ( = ?auto_33905 ?auto_33906 ) ) ( not ( = ?auto_33891 ?auto_33906 ) ) ( not ( = ?auto_33900 ?auto_33906 ) ) ( HOIST-AT ?auto_33892 ?auto_33906 ) ( not ( = ?auto_33901 ?auto_33892 ) ) ( not ( = ?auto_33908 ?auto_33892 ) ) ( not ( = ?auto_33890 ?auto_33892 ) ) ( not ( = ?auto_33902 ?auto_33892 ) ) ( AVAILABLE ?auto_33892 ) ( SURFACE-AT ?auto_33895 ?auto_33906 ) ( ON ?auto_33895 ?auto_33904 ) ( CLEAR ?auto_33895 ) ( not ( = ?auto_33888 ?auto_33904 ) ) ( not ( = ?auto_33889 ?auto_33904 ) ) ( not ( = ?auto_33903 ?auto_33904 ) ) ( not ( = ?auto_33893 ?auto_33904 ) ) ( not ( = ?auto_33896 ?auto_33904 ) ) ( not ( = ?auto_33895 ?auto_33904 ) ) ( not ( = ?auto_33894 ?auto_33904 ) ) ( not ( = ?auto_33897 ?auto_33904 ) ) ( SURFACE-AT ?auto_33907 ?auto_33899 ) ( CLEAR ?auto_33907 ) ( IS-CRATE ?auto_33897 ) ( not ( = ?auto_33888 ?auto_33907 ) ) ( not ( = ?auto_33889 ?auto_33907 ) ) ( not ( = ?auto_33903 ?auto_33907 ) ) ( not ( = ?auto_33893 ?auto_33907 ) ) ( not ( = ?auto_33896 ?auto_33907 ) ) ( not ( = ?auto_33895 ?auto_33907 ) ) ( not ( = ?auto_33894 ?auto_33907 ) ) ( not ( = ?auto_33897 ?auto_33907 ) ) ( not ( = ?auto_33904 ?auto_33907 ) ) ( AVAILABLE ?auto_33901 ) ( TRUCK-AT ?auto_33898 ?auto_33900 ) ( LIFTING ?auto_33902 ?auto_33897 ) )
    :subtasks
    ( ( !LOAD ?auto_33902 ?auto_33897 ?auto_33898 ?auto_33900 )
      ( MAKE-ON ?auto_33888 ?auto_33889 )
      ( MAKE-ON-VERIFY ?auto_33888 ?auto_33889 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33909 - SURFACE
      ?auto_33910 - SURFACE
    )
    :vars
    (
      ?auto_33928 - HOIST
      ?auto_33921 - PLACE
      ?auto_33929 - PLACE
      ?auto_33917 - HOIST
      ?auto_33920 - SURFACE
      ?auto_33927 - SURFACE
      ?auto_33912 - PLACE
      ?auto_33919 - HOIST
      ?auto_33915 - SURFACE
      ?auto_33924 - SURFACE
      ?auto_33918 - PLACE
      ?auto_33926 - HOIST
      ?auto_33923 - SURFACE
      ?auto_33922 - SURFACE
      ?auto_33914 - PLACE
      ?auto_33925 - HOIST
      ?auto_33916 - SURFACE
      ?auto_33913 - SURFACE
      ?auto_33911 - TRUCK
      ?auto_33930 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33928 ?auto_33921 ) ( IS-CRATE ?auto_33909 ) ( not ( = ?auto_33909 ?auto_33910 ) ) ( not ( = ?auto_33929 ?auto_33921 ) ) ( HOIST-AT ?auto_33917 ?auto_33929 ) ( not ( = ?auto_33928 ?auto_33917 ) ) ( AVAILABLE ?auto_33917 ) ( SURFACE-AT ?auto_33909 ?auto_33929 ) ( ON ?auto_33909 ?auto_33920 ) ( CLEAR ?auto_33909 ) ( not ( = ?auto_33909 ?auto_33920 ) ) ( not ( = ?auto_33910 ?auto_33920 ) ) ( IS-CRATE ?auto_33910 ) ( not ( = ?auto_33909 ?auto_33927 ) ) ( not ( = ?auto_33910 ?auto_33927 ) ) ( not ( = ?auto_33920 ?auto_33927 ) ) ( not ( = ?auto_33912 ?auto_33921 ) ) ( not ( = ?auto_33929 ?auto_33912 ) ) ( HOIST-AT ?auto_33919 ?auto_33912 ) ( not ( = ?auto_33928 ?auto_33919 ) ) ( not ( = ?auto_33917 ?auto_33919 ) ) ( AVAILABLE ?auto_33919 ) ( SURFACE-AT ?auto_33910 ?auto_33912 ) ( ON ?auto_33910 ?auto_33915 ) ( CLEAR ?auto_33910 ) ( not ( = ?auto_33909 ?auto_33915 ) ) ( not ( = ?auto_33910 ?auto_33915 ) ) ( not ( = ?auto_33920 ?auto_33915 ) ) ( not ( = ?auto_33927 ?auto_33915 ) ) ( IS-CRATE ?auto_33927 ) ( not ( = ?auto_33909 ?auto_33924 ) ) ( not ( = ?auto_33910 ?auto_33924 ) ) ( not ( = ?auto_33920 ?auto_33924 ) ) ( not ( = ?auto_33927 ?auto_33924 ) ) ( not ( = ?auto_33915 ?auto_33924 ) ) ( not ( = ?auto_33918 ?auto_33921 ) ) ( not ( = ?auto_33929 ?auto_33918 ) ) ( not ( = ?auto_33912 ?auto_33918 ) ) ( HOIST-AT ?auto_33926 ?auto_33918 ) ( not ( = ?auto_33928 ?auto_33926 ) ) ( not ( = ?auto_33917 ?auto_33926 ) ) ( not ( = ?auto_33919 ?auto_33926 ) ) ( SURFACE-AT ?auto_33927 ?auto_33918 ) ( ON ?auto_33927 ?auto_33923 ) ( CLEAR ?auto_33927 ) ( not ( = ?auto_33909 ?auto_33923 ) ) ( not ( = ?auto_33910 ?auto_33923 ) ) ( not ( = ?auto_33920 ?auto_33923 ) ) ( not ( = ?auto_33927 ?auto_33923 ) ) ( not ( = ?auto_33915 ?auto_33923 ) ) ( not ( = ?auto_33924 ?auto_33923 ) ) ( IS-CRATE ?auto_33924 ) ( not ( = ?auto_33909 ?auto_33922 ) ) ( not ( = ?auto_33910 ?auto_33922 ) ) ( not ( = ?auto_33920 ?auto_33922 ) ) ( not ( = ?auto_33927 ?auto_33922 ) ) ( not ( = ?auto_33915 ?auto_33922 ) ) ( not ( = ?auto_33924 ?auto_33922 ) ) ( not ( = ?auto_33923 ?auto_33922 ) ) ( not ( = ?auto_33914 ?auto_33921 ) ) ( not ( = ?auto_33929 ?auto_33914 ) ) ( not ( = ?auto_33912 ?auto_33914 ) ) ( not ( = ?auto_33918 ?auto_33914 ) ) ( HOIST-AT ?auto_33925 ?auto_33914 ) ( not ( = ?auto_33928 ?auto_33925 ) ) ( not ( = ?auto_33917 ?auto_33925 ) ) ( not ( = ?auto_33919 ?auto_33925 ) ) ( not ( = ?auto_33926 ?auto_33925 ) ) ( AVAILABLE ?auto_33925 ) ( SURFACE-AT ?auto_33924 ?auto_33914 ) ( ON ?auto_33924 ?auto_33916 ) ( CLEAR ?auto_33924 ) ( not ( = ?auto_33909 ?auto_33916 ) ) ( not ( = ?auto_33910 ?auto_33916 ) ) ( not ( = ?auto_33920 ?auto_33916 ) ) ( not ( = ?auto_33927 ?auto_33916 ) ) ( not ( = ?auto_33915 ?auto_33916 ) ) ( not ( = ?auto_33924 ?auto_33916 ) ) ( not ( = ?auto_33923 ?auto_33916 ) ) ( not ( = ?auto_33922 ?auto_33916 ) ) ( SURFACE-AT ?auto_33913 ?auto_33921 ) ( CLEAR ?auto_33913 ) ( IS-CRATE ?auto_33922 ) ( not ( = ?auto_33909 ?auto_33913 ) ) ( not ( = ?auto_33910 ?auto_33913 ) ) ( not ( = ?auto_33920 ?auto_33913 ) ) ( not ( = ?auto_33927 ?auto_33913 ) ) ( not ( = ?auto_33915 ?auto_33913 ) ) ( not ( = ?auto_33924 ?auto_33913 ) ) ( not ( = ?auto_33923 ?auto_33913 ) ) ( not ( = ?auto_33922 ?auto_33913 ) ) ( not ( = ?auto_33916 ?auto_33913 ) ) ( AVAILABLE ?auto_33928 ) ( TRUCK-AT ?auto_33911 ?auto_33918 ) ( AVAILABLE ?auto_33926 ) ( SURFACE-AT ?auto_33922 ?auto_33918 ) ( ON ?auto_33922 ?auto_33930 ) ( CLEAR ?auto_33922 ) ( not ( = ?auto_33909 ?auto_33930 ) ) ( not ( = ?auto_33910 ?auto_33930 ) ) ( not ( = ?auto_33920 ?auto_33930 ) ) ( not ( = ?auto_33927 ?auto_33930 ) ) ( not ( = ?auto_33915 ?auto_33930 ) ) ( not ( = ?auto_33924 ?auto_33930 ) ) ( not ( = ?auto_33923 ?auto_33930 ) ) ( not ( = ?auto_33922 ?auto_33930 ) ) ( not ( = ?auto_33916 ?auto_33930 ) ) ( not ( = ?auto_33913 ?auto_33930 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33926 ?auto_33922 ?auto_33930 ?auto_33918 )
      ( MAKE-ON ?auto_33909 ?auto_33910 )
      ( MAKE-ON-VERIFY ?auto_33909 ?auto_33910 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33931 - SURFACE
      ?auto_33932 - SURFACE
    )
    :vars
    (
      ?auto_33939 - HOIST
      ?auto_33949 - PLACE
      ?auto_33938 - PLACE
      ?auto_33935 - HOIST
      ?auto_33946 - SURFACE
      ?auto_33951 - SURFACE
      ?auto_33941 - PLACE
      ?auto_33934 - HOIST
      ?auto_33947 - SURFACE
      ?auto_33948 - SURFACE
      ?auto_33943 - PLACE
      ?auto_33944 - HOIST
      ?auto_33940 - SURFACE
      ?auto_33933 - SURFACE
      ?auto_33936 - PLACE
      ?auto_33950 - HOIST
      ?auto_33945 - SURFACE
      ?auto_33952 - SURFACE
      ?auto_33937 - SURFACE
      ?auto_33942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33939 ?auto_33949 ) ( IS-CRATE ?auto_33931 ) ( not ( = ?auto_33931 ?auto_33932 ) ) ( not ( = ?auto_33938 ?auto_33949 ) ) ( HOIST-AT ?auto_33935 ?auto_33938 ) ( not ( = ?auto_33939 ?auto_33935 ) ) ( AVAILABLE ?auto_33935 ) ( SURFACE-AT ?auto_33931 ?auto_33938 ) ( ON ?auto_33931 ?auto_33946 ) ( CLEAR ?auto_33931 ) ( not ( = ?auto_33931 ?auto_33946 ) ) ( not ( = ?auto_33932 ?auto_33946 ) ) ( IS-CRATE ?auto_33932 ) ( not ( = ?auto_33931 ?auto_33951 ) ) ( not ( = ?auto_33932 ?auto_33951 ) ) ( not ( = ?auto_33946 ?auto_33951 ) ) ( not ( = ?auto_33941 ?auto_33949 ) ) ( not ( = ?auto_33938 ?auto_33941 ) ) ( HOIST-AT ?auto_33934 ?auto_33941 ) ( not ( = ?auto_33939 ?auto_33934 ) ) ( not ( = ?auto_33935 ?auto_33934 ) ) ( AVAILABLE ?auto_33934 ) ( SURFACE-AT ?auto_33932 ?auto_33941 ) ( ON ?auto_33932 ?auto_33947 ) ( CLEAR ?auto_33932 ) ( not ( = ?auto_33931 ?auto_33947 ) ) ( not ( = ?auto_33932 ?auto_33947 ) ) ( not ( = ?auto_33946 ?auto_33947 ) ) ( not ( = ?auto_33951 ?auto_33947 ) ) ( IS-CRATE ?auto_33951 ) ( not ( = ?auto_33931 ?auto_33948 ) ) ( not ( = ?auto_33932 ?auto_33948 ) ) ( not ( = ?auto_33946 ?auto_33948 ) ) ( not ( = ?auto_33951 ?auto_33948 ) ) ( not ( = ?auto_33947 ?auto_33948 ) ) ( not ( = ?auto_33943 ?auto_33949 ) ) ( not ( = ?auto_33938 ?auto_33943 ) ) ( not ( = ?auto_33941 ?auto_33943 ) ) ( HOIST-AT ?auto_33944 ?auto_33943 ) ( not ( = ?auto_33939 ?auto_33944 ) ) ( not ( = ?auto_33935 ?auto_33944 ) ) ( not ( = ?auto_33934 ?auto_33944 ) ) ( SURFACE-AT ?auto_33951 ?auto_33943 ) ( ON ?auto_33951 ?auto_33940 ) ( CLEAR ?auto_33951 ) ( not ( = ?auto_33931 ?auto_33940 ) ) ( not ( = ?auto_33932 ?auto_33940 ) ) ( not ( = ?auto_33946 ?auto_33940 ) ) ( not ( = ?auto_33951 ?auto_33940 ) ) ( not ( = ?auto_33947 ?auto_33940 ) ) ( not ( = ?auto_33948 ?auto_33940 ) ) ( IS-CRATE ?auto_33948 ) ( not ( = ?auto_33931 ?auto_33933 ) ) ( not ( = ?auto_33932 ?auto_33933 ) ) ( not ( = ?auto_33946 ?auto_33933 ) ) ( not ( = ?auto_33951 ?auto_33933 ) ) ( not ( = ?auto_33947 ?auto_33933 ) ) ( not ( = ?auto_33948 ?auto_33933 ) ) ( not ( = ?auto_33940 ?auto_33933 ) ) ( not ( = ?auto_33936 ?auto_33949 ) ) ( not ( = ?auto_33938 ?auto_33936 ) ) ( not ( = ?auto_33941 ?auto_33936 ) ) ( not ( = ?auto_33943 ?auto_33936 ) ) ( HOIST-AT ?auto_33950 ?auto_33936 ) ( not ( = ?auto_33939 ?auto_33950 ) ) ( not ( = ?auto_33935 ?auto_33950 ) ) ( not ( = ?auto_33934 ?auto_33950 ) ) ( not ( = ?auto_33944 ?auto_33950 ) ) ( AVAILABLE ?auto_33950 ) ( SURFACE-AT ?auto_33948 ?auto_33936 ) ( ON ?auto_33948 ?auto_33945 ) ( CLEAR ?auto_33948 ) ( not ( = ?auto_33931 ?auto_33945 ) ) ( not ( = ?auto_33932 ?auto_33945 ) ) ( not ( = ?auto_33946 ?auto_33945 ) ) ( not ( = ?auto_33951 ?auto_33945 ) ) ( not ( = ?auto_33947 ?auto_33945 ) ) ( not ( = ?auto_33948 ?auto_33945 ) ) ( not ( = ?auto_33940 ?auto_33945 ) ) ( not ( = ?auto_33933 ?auto_33945 ) ) ( SURFACE-AT ?auto_33952 ?auto_33949 ) ( CLEAR ?auto_33952 ) ( IS-CRATE ?auto_33933 ) ( not ( = ?auto_33931 ?auto_33952 ) ) ( not ( = ?auto_33932 ?auto_33952 ) ) ( not ( = ?auto_33946 ?auto_33952 ) ) ( not ( = ?auto_33951 ?auto_33952 ) ) ( not ( = ?auto_33947 ?auto_33952 ) ) ( not ( = ?auto_33948 ?auto_33952 ) ) ( not ( = ?auto_33940 ?auto_33952 ) ) ( not ( = ?auto_33933 ?auto_33952 ) ) ( not ( = ?auto_33945 ?auto_33952 ) ) ( AVAILABLE ?auto_33939 ) ( AVAILABLE ?auto_33944 ) ( SURFACE-AT ?auto_33933 ?auto_33943 ) ( ON ?auto_33933 ?auto_33937 ) ( CLEAR ?auto_33933 ) ( not ( = ?auto_33931 ?auto_33937 ) ) ( not ( = ?auto_33932 ?auto_33937 ) ) ( not ( = ?auto_33946 ?auto_33937 ) ) ( not ( = ?auto_33951 ?auto_33937 ) ) ( not ( = ?auto_33947 ?auto_33937 ) ) ( not ( = ?auto_33948 ?auto_33937 ) ) ( not ( = ?auto_33940 ?auto_33937 ) ) ( not ( = ?auto_33933 ?auto_33937 ) ) ( not ( = ?auto_33945 ?auto_33937 ) ) ( not ( = ?auto_33952 ?auto_33937 ) ) ( TRUCK-AT ?auto_33942 ?auto_33949 ) )
    :subtasks
    ( ( !DRIVE ?auto_33942 ?auto_33949 ?auto_33943 )
      ( MAKE-ON ?auto_33931 ?auto_33932 )
      ( MAKE-ON-VERIFY ?auto_33931 ?auto_33932 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33955 - SURFACE
      ?auto_33956 - SURFACE
    )
    :vars
    (
      ?auto_33957 - HOIST
      ?auto_33958 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33957 ?auto_33958 ) ( SURFACE-AT ?auto_33956 ?auto_33958 ) ( CLEAR ?auto_33956 ) ( LIFTING ?auto_33957 ?auto_33955 ) ( IS-CRATE ?auto_33955 ) ( not ( = ?auto_33955 ?auto_33956 ) ) )
    :subtasks
    ( ( !DROP ?auto_33957 ?auto_33955 ?auto_33956 ?auto_33958 )
      ( MAKE-ON-VERIFY ?auto_33955 ?auto_33956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33959 - SURFACE
      ?auto_33960 - SURFACE
    )
    :vars
    (
      ?auto_33962 - HOIST
      ?auto_33961 - PLACE
      ?auto_33963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33962 ?auto_33961 ) ( SURFACE-AT ?auto_33960 ?auto_33961 ) ( CLEAR ?auto_33960 ) ( IS-CRATE ?auto_33959 ) ( not ( = ?auto_33959 ?auto_33960 ) ) ( TRUCK-AT ?auto_33963 ?auto_33961 ) ( AVAILABLE ?auto_33962 ) ( IN ?auto_33959 ?auto_33963 ) )
    :subtasks
    ( ( !UNLOAD ?auto_33962 ?auto_33959 ?auto_33963 ?auto_33961 )
      ( MAKE-ON ?auto_33959 ?auto_33960 )
      ( MAKE-ON-VERIFY ?auto_33959 ?auto_33960 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33964 - SURFACE
      ?auto_33965 - SURFACE
    )
    :vars
    (
      ?auto_33968 - HOIST
      ?auto_33967 - PLACE
      ?auto_33966 - TRUCK
      ?auto_33969 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33968 ?auto_33967 ) ( SURFACE-AT ?auto_33965 ?auto_33967 ) ( CLEAR ?auto_33965 ) ( IS-CRATE ?auto_33964 ) ( not ( = ?auto_33964 ?auto_33965 ) ) ( AVAILABLE ?auto_33968 ) ( IN ?auto_33964 ?auto_33966 ) ( TRUCK-AT ?auto_33966 ?auto_33969 ) ( not ( = ?auto_33969 ?auto_33967 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_33966 ?auto_33969 ?auto_33967 )
      ( MAKE-ON ?auto_33964 ?auto_33965 )
      ( MAKE-ON-VERIFY ?auto_33964 ?auto_33965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33970 - SURFACE
      ?auto_33971 - SURFACE
    )
    :vars
    (
      ?auto_33972 - HOIST
      ?auto_33975 - PLACE
      ?auto_33974 - TRUCK
      ?auto_33973 - PLACE
      ?auto_33976 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_33972 ?auto_33975 ) ( SURFACE-AT ?auto_33971 ?auto_33975 ) ( CLEAR ?auto_33971 ) ( IS-CRATE ?auto_33970 ) ( not ( = ?auto_33970 ?auto_33971 ) ) ( AVAILABLE ?auto_33972 ) ( TRUCK-AT ?auto_33974 ?auto_33973 ) ( not ( = ?auto_33973 ?auto_33975 ) ) ( HOIST-AT ?auto_33976 ?auto_33973 ) ( LIFTING ?auto_33976 ?auto_33970 ) ( not ( = ?auto_33972 ?auto_33976 ) ) )
    :subtasks
    ( ( !LOAD ?auto_33976 ?auto_33970 ?auto_33974 ?auto_33973 )
      ( MAKE-ON ?auto_33970 ?auto_33971 )
      ( MAKE-ON-VERIFY ?auto_33970 ?auto_33971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33977 - SURFACE
      ?auto_33978 - SURFACE
    )
    :vars
    (
      ?auto_33983 - HOIST
      ?auto_33979 - PLACE
      ?auto_33980 - TRUCK
      ?auto_33981 - PLACE
      ?auto_33982 - HOIST
      ?auto_33984 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33983 ?auto_33979 ) ( SURFACE-AT ?auto_33978 ?auto_33979 ) ( CLEAR ?auto_33978 ) ( IS-CRATE ?auto_33977 ) ( not ( = ?auto_33977 ?auto_33978 ) ) ( AVAILABLE ?auto_33983 ) ( TRUCK-AT ?auto_33980 ?auto_33981 ) ( not ( = ?auto_33981 ?auto_33979 ) ) ( HOIST-AT ?auto_33982 ?auto_33981 ) ( not ( = ?auto_33983 ?auto_33982 ) ) ( AVAILABLE ?auto_33982 ) ( SURFACE-AT ?auto_33977 ?auto_33981 ) ( ON ?auto_33977 ?auto_33984 ) ( CLEAR ?auto_33977 ) ( not ( = ?auto_33977 ?auto_33984 ) ) ( not ( = ?auto_33978 ?auto_33984 ) ) )
    :subtasks
    ( ( !LIFT ?auto_33982 ?auto_33977 ?auto_33984 ?auto_33981 )
      ( MAKE-ON ?auto_33977 ?auto_33978 )
      ( MAKE-ON-VERIFY ?auto_33977 ?auto_33978 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33985 - SURFACE
      ?auto_33986 - SURFACE
    )
    :vars
    (
      ?auto_33992 - HOIST
      ?auto_33988 - PLACE
      ?auto_33990 - PLACE
      ?auto_33989 - HOIST
      ?auto_33991 - SURFACE
      ?auto_33987 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_33992 ?auto_33988 ) ( SURFACE-AT ?auto_33986 ?auto_33988 ) ( CLEAR ?auto_33986 ) ( IS-CRATE ?auto_33985 ) ( not ( = ?auto_33985 ?auto_33986 ) ) ( AVAILABLE ?auto_33992 ) ( not ( = ?auto_33990 ?auto_33988 ) ) ( HOIST-AT ?auto_33989 ?auto_33990 ) ( not ( = ?auto_33992 ?auto_33989 ) ) ( AVAILABLE ?auto_33989 ) ( SURFACE-AT ?auto_33985 ?auto_33990 ) ( ON ?auto_33985 ?auto_33991 ) ( CLEAR ?auto_33985 ) ( not ( = ?auto_33985 ?auto_33991 ) ) ( not ( = ?auto_33986 ?auto_33991 ) ) ( TRUCK-AT ?auto_33987 ?auto_33988 ) )
    :subtasks
    ( ( !DRIVE ?auto_33987 ?auto_33988 ?auto_33990 )
      ( MAKE-ON ?auto_33985 ?auto_33986 )
      ( MAKE-ON-VERIFY ?auto_33985 ?auto_33986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33993 - SURFACE
      ?auto_33994 - SURFACE
    )
    :vars
    (
      ?auto_33999 - HOIST
      ?auto_33998 - PLACE
      ?auto_33995 - PLACE
      ?auto_34000 - HOIST
      ?auto_33996 - SURFACE
      ?auto_33997 - TRUCK
      ?auto_34001 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_33999 ?auto_33998 ) ( IS-CRATE ?auto_33993 ) ( not ( = ?auto_33993 ?auto_33994 ) ) ( not ( = ?auto_33995 ?auto_33998 ) ) ( HOIST-AT ?auto_34000 ?auto_33995 ) ( not ( = ?auto_33999 ?auto_34000 ) ) ( AVAILABLE ?auto_34000 ) ( SURFACE-AT ?auto_33993 ?auto_33995 ) ( ON ?auto_33993 ?auto_33996 ) ( CLEAR ?auto_33993 ) ( not ( = ?auto_33993 ?auto_33996 ) ) ( not ( = ?auto_33994 ?auto_33996 ) ) ( TRUCK-AT ?auto_33997 ?auto_33998 ) ( SURFACE-AT ?auto_34001 ?auto_33998 ) ( CLEAR ?auto_34001 ) ( LIFTING ?auto_33999 ?auto_33994 ) ( IS-CRATE ?auto_33994 ) ( not ( = ?auto_33993 ?auto_34001 ) ) ( not ( = ?auto_33994 ?auto_34001 ) ) ( not ( = ?auto_33996 ?auto_34001 ) ) )
    :subtasks
    ( ( !DROP ?auto_33999 ?auto_33994 ?auto_34001 ?auto_33998 )
      ( MAKE-ON ?auto_33993 ?auto_33994 )
      ( MAKE-ON-VERIFY ?auto_33993 ?auto_33994 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34002 - SURFACE
      ?auto_34003 - SURFACE
    )
    :vars
    (
      ?auto_34007 - HOIST
      ?auto_34010 - PLACE
      ?auto_34009 - PLACE
      ?auto_34008 - HOIST
      ?auto_34004 - SURFACE
      ?auto_34005 - TRUCK
      ?auto_34006 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34007 ?auto_34010 ) ( IS-CRATE ?auto_34002 ) ( not ( = ?auto_34002 ?auto_34003 ) ) ( not ( = ?auto_34009 ?auto_34010 ) ) ( HOIST-AT ?auto_34008 ?auto_34009 ) ( not ( = ?auto_34007 ?auto_34008 ) ) ( AVAILABLE ?auto_34008 ) ( SURFACE-AT ?auto_34002 ?auto_34009 ) ( ON ?auto_34002 ?auto_34004 ) ( CLEAR ?auto_34002 ) ( not ( = ?auto_34002 ?auto_34004 ) ) ( not ( = ?auto_34003 ?auto_34004 ) ) ( TRUCK-AT ?auto_34005 ?auto_34010 ) ( SURFACE-AT ?auto_34006 ?auto_34010 ) ( CLEAR ?auto_34006 ) ( IS-CRATE ?auto_34003 ) ( not ( = ?auto_34002 ?auto_34006 ) ) ( not ( = ?auto_34003 ?auto_34006 ) ) ( not ( = ?auto_34004 ?auto_34006 ) ) ( AVAILABLE ?auto_34007 ) ( IN ?auto_34003 ?auto_34005 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34007 ?auto_34003 ?auto_34005 ?auto_34010 )
      ( MAKE-ON ?auto_34002 ?auto_34003 )
      ( MAKE-ON-VERIFY ?auto_34002 ?auto_34003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34011 - SURFACE
      ?auto_34012 - SURFACE
    )
    :vars
    (
      ?auto_34018 - HOIST
      ?auto_34016 - PLACE
      ?auto_34013 - PLACE
      ?auto_34017 - HOIST
      ?auto_34015 - SURFACE
      ?auto_34014 - SURFACE
      ?auto_34019 - TRUCK
      ?auto_34020 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34018 ?auto_34016 ) ( IS-CRATE ?auto_34011 ) ( not ( = ?auto_34011 ?auto_34012 ) ) ( not ( = ?auto_34013 ?auto_34016 ) ) ( HOIST-AT ?auto_34017 ?auto_34013 ) ( not ( = ?auto_34018 ?auto_34017 ) ) ( AVAILABLE ?auto_34017 ) ( SURFACE-AT ?auto_34011 ?auto_34013 ) ( ON ?auto_34011 ?auto_34015 ) ( CLEAR ?auto_34011 ) ( not ( = ?auto_34011 ?auto_34015 ) ) ( not ( = ?auto_34012 ?auto_34015 ) ) ( SURFACE-AT ?auto_34014 ?auto_34016 ) ( CLEAR ?auto_34014 ) ( IS-CRATE ?auto_34012 ) ( not ( = ?auto_34011 ?auto_34014 ) ) ( not ( = ?auto_34012 ?auto_34014 ) ) ( not ( = ?auto_34015 ?auto_34014 ) ) ( AVAILABLE ?auto_34018 ) ( IN ?auto_34012 ?auto_34019 ) ( TRUCK-AT ?auto_34019 ?auto_34020 ) ( not ( = ?auto_34020 ?auto_34016 ) ) ( not ( = ?auto_34013 ?auto_34020 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34019 ?auto_34020 ?auto_34016 )
      ( MAKE-ON ?auto_34011 ?auto_34012 )
      ( MAKE-ON-VERIFY ?auto_34011 ?auto_34012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34021 - SURFACE
      ?auto_34022 - SURFACE
    )
    :vars
    (
      ?auto_34029 - HOIST
      ?auto_34023 - PLACE
      ?auto_34028 - PLACE
      ?auto_34025 - HOIST
      ?auto_34024 - SURFACE
      ?auto_34026 - SURFACE
      ?auto_34027 - TRUCK
      ?auto_34030 - PLACE
      ?auto_34031 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34029 ?auto_34023 ) ( IS-CRATE ?auto_34021 ) ( not ( = ?auto_34021 ?auto_34022 ) ) ( not ( = ?auto_34028 ?auto_34023 ) ) ( HOIST-AT ?auto_34025 ?auto_34028 ) ( not ( = ?auto_34029 ?auto_34025 ) ) ( AVAILABLE ?auto_34025 ) ( SURFACE-AT ?auto_34021 ?auto_34028 ) ( ON ?auto_34021 ?auto_34024 ) ( CLEAR ?auto_34021 ) ( not ( = ?auto_34021 ?auto_34024 ) ) ( not ( = ?auto_34022 ?auto_34024 ) ) ( SURFACE-AT ?auto_34026 ?auto_34023 ) ( CLEAR ?auto_34026 ) ( IS-CRATE ?auto_34022 ) ( not ( = ?auto_34021 ?auto_34026 ) ) ( not ( = ?auto_34022 ?auto_34026 ) ) ( not ( = ?auto_34024 ?auto_34026 ) ) ( AVAILABLE ?auto_34029 ) ( TRUCK-AT ?auto_34027 ?auto_34030 ) ( not ( = ?auto_34030 ?auto_34023 ) ) ( not ( = ?auto_34028 ?auto_34030 ) ) ( HOIST-AT ?auto_34031 ?auto_34030 ) ( LIFTING ?auto_34031 ?auto_34022 ) ( not ( = ?auto_34029 ?auto_34031 ) ) ( not ( = ?auto_34025 ?auto_34031 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34031 ?auto_34022 ?auto_34027 ?auto_34030 )
      ( MAKE-ON ?auto_34021 ?auto_34022 )
      ( MAKE-ON-VERIFY ?auto_34021 ?auto_34022 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34032 - SURFACE
      ?auto_34033 - SURFACE
    )
    :vars
    (
      ?auto_34042 - HOIST
      ?auto_34035 - PLACE
      ?auto_34037 - PLACE
      ?auto_34040 - HOIST
      ?auto_34039 - SURFACE
      ?auto_34036 - SURFACE
      ?auto_34038 - TRUCK
      ?auto_34041 - PLACE
      ?auto_34034 - HOIST
      ?auto_34043 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34042 ?auto_34035 ) ( IS-CRATE ?auto_34032 ) ( not ( = ?auto_34032 ?auto_34033 ) ) ( not ( = ?auto_34037 ?auto_34035 ) ) ( HOIST-AT ?auto_34040 ?auto_34037 ) ( not ( = ?auto_34042 ?auto_34040 ) ) ( AVAILABLE ?auto_34040 ) ( SURFACE-AT ?auto_34032 ?auto_34037 ) ( ON ?auto_34032 ?auto_34039 ) ( CLEAR ?auto_34032 ) ( not ( = ?auto_34032 ?auto_34039 ) ) ( not ( = ?auto_34033 ?auto_34039 ) ) ( SURFACE-AT ?auto_34036 ?auto_34035 ) ( CLEAR ?auto_34036 ) ( IS-CRATE ?auto_34033 ) ( not ( = ?auto_34032 ?auto_34036 ) ) ( not ( = ?auto_34033 ?auto_34036 ) ) ( not ( = ?auto_34039 ?auto_34036 ) ) ( AVAILABLE ?auto_34042 ) ( TRUCK-AT ?auto_34038 ?auto_34041 ) ( not ( = ?auto_34041 ?auto_34035 ) ) ( not ( = ?auto_34037 ?auto_34041 ) ) ( HOIST-AT ?auto_34034 ?auto_34041 ) ( not ( = ?auto_34042 ?auto_34034 ) ) ( not ( = ?auto_34040 ?auto_34034 ) ) ( AVAILABLE ?auto_34034 ) ( SURFACE-AT ?auto_34033 ?auto_34041 ) ( ON ?auto_34033 ?auto_34043 ) ( CLEAR ?auto_34033 ) ( not ( = ?auto_34032 ?auto_34043 ) ) ( not ( = ?auto_34033 ?auto_34043 ) ) ( not ( = ?auto_34039 ?auto_34043 ) ) ( not ( = ?auto_34036 ?auto_34043 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34034 ?auto_34033 ?auto_34043 ?auto_34041 )
      ( MAKE-ON ?auto_34032 ?auto_34033 )
      ( MAKE-ON-VERIFY ?auto_34032 ?auto_34033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34044 - SURFACE
      ?auto_34045 - SURFACE
    )
    :vars
    (
      ?auto_34051 - HOIST
      ?auto_34049 - PLACE
      ?auto_34055 - PLACE
      ?auto_34046 - HOIST
      ?auto_34047 - SURFACE
      ?auto_34050 - SURFACE
      ?auto_34048 - PLACE
      ?auto_34053 - HOIST
      ?auto_34052 - SURFACE
      ?auto_34054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34051 ?auto_34049 ) ( IS-CRATE ?auto_34044 ) ( not ( = ?auto_34044 ?auto_34045 ) ) ( not ( = ?auto_34055 ?auto_34049 ) ) ( HOIST-AT ?auto_34046 ?auto_34055 ) ( not ( = ?auto_34051 ?auto_34046 ) ) ( AVAILABLE ?auto_34046 ) ( SURFACE-AT ?auto_34044 ?auto_34055 ) ( ON ?auto_34044 ?auto_34047 ) ( CLEAR ?auto_34044 ) ( not ( = ?auto_34044 ?auto_34047 ) ) ( not ( = ?auto_34045 ?auto_34047 ) ) ( SURFACE-AT ?auto_34050 ?auto_34049 ) ( CLEAR ?auto_34050 ) ( IS-CRATE ?auto_34045 ) ( not ( = ?auto_34044 ?auto_34050 ) ) ( not ( = ?auto_34045 ?auto_34050 ) ) ( not ( = ?auto_34047 ?auto_34050 ) ) ( AVAILABLE ?auto_34051 ) ( not ( = ?auto_34048 ?auto_34049 ) ) ( not ( = ?auto_34055 ?auto_34048 ) ) ( HOIST-AT ?auto_34053 ?auto_34048 ) ( not ( = ?auto_34051 ?auto_34053 ) ) ( not ( = ?auto_34046 ?auto_34053 ) ) ( AVAILABLE ?auto_34053 ) ( SURFACE-AT ?auto_34045 ?auto_34048 ) ( ON ?auto_34045 ?auto_34052 ) ( CLEAR ?auto_34045 ) ( not ( = ?auto_34044 ?auto_34052 ) ) ( not ( = ?auto_34045 ?auto_34052 ) ) ( not ( = ?auto_34047 ?auto_34052 ) ) ( not ( = ?auto_34050 ?auto_34052 ) ) ( TRUCK-AT ?auto_34054 ?auto_34049 ) )
    :subtasks
    ( ( !DRIVE ?auto_34054 ?auto_34049 ?auto_34048 )
      ( MAKE-ON ?auto_34044 ?auto_34045 )
      ( MAKE-ON-VERIFY ?auto_34044 ?auto_34045 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34056 - SURFACE
      ?auto_34057 - SURFACE
    )
    :vars
    (
      ?auto_34063 - HOIST
      ?auto_34065 - PLACE
      ?auto_34067 - PLACE
      ?auto_34060 - HOIST
      ?auto_34061 - SURFACE
      ?auto_34066 - SURFACE
      ?auto_34062 - PLACE
      ?auto_34064 - HOIST
      ?auto_34059 - SURFACE
      ?auto_34058 - TRUCK
      ?auto_34068 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34063 ?auto_34065 ) ( IS-CRATE ?auto_34056 ) ( not ( = ?auto_34056 ?auto_34057 ) ) ( not ( = ?auto_34067 ?auto_34065 ) ) ( HOIST-AT ?auto_34060 ?auto_34067 ) ( not ( = ?auto_34063 ?auto_34060 ) ) ( AVAILABLE ?auto_34060 ) ( SURFACE-AT ?auto_34056 ?auto_34067 ) ( ON ?auto_34056 ?auto_34061 ) ( CLEAR ?auto_34056 ) ( not ( = ?auto_34056 ?auto_34061 ) ) ( not ( = ?auto_34057 ?auto_34061 ) ) ( IS-CRATE ?auto_34057 ) ( not ( = ?auto_34056 ?auto_34066 ) ) ( not ( = ?auto_34057 ?auto_34066 ) ) ( not ( = ?auto_34061 ?auto_34066 ) ) ( not ( = ?auto_34062 ?auto_34065 ) ) ( not ( = ?auto_34067 ?auto_34062 ) ) ( HOIST-AT ?auto_34064 ?auto_34062 ) ( not ( = ?auto_34063 ?auto_34064 ) ) ( not ( = ?auto_34060 ?auto_34064 ) ) ( AVAILABLE ?auto_34064 ) ( SURFACE-AT ?auto_34057 ?auto_34062 ) ( ON ?auto_34057 ?auto_34059 ) ( CLEAR ?auto_34057 ) ( not ( = ?auto_34056 ?auto_34059 ) ) ( not ( = ?auto_34057 ?auto_34059 ) ) ( not ( = ?auto_34061 ?auto_34059 ) ) ( not ( = ?auto_34066 ?auto_34059 ) ) ( TRUCK-AT ?auto_34058 ?auto_34065 ) ( SURFACE-AT ?auto_34068 ?auto_34065 ) ( CLEAR ?auto_34068 ) ( LIFTING ?auto_34063 ?auto_34066 ) ( IS-CRATE ?auto_34066 ) ( not ( = ?auto_34056 ?auto_34068 ) ) ( not ( = ?auto_34057 ?auto_34068 ) ) ( not ( = ?auto_34061 ?auto_34068 ) ) ( not ( = ?auto_34066 ?auto_34068 ) ) ( not ( = ?auto_34059 ?auto_34068 ) ) )
    :subtasks
    ( ( !DROP ?auto_34063 ?auto_34066 ?auto_34068 ?auto_34065 )
      ( MAKE-ON ?auto_34056 ?auto_34057 )
      ( MAKE-ON-VERIFY ?auto_34056 ?auto_34057 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34069 - SURFACE
      ?auto_34070 - SURFACE
    )
    :vars
    (
      ?auto_34074 - HOIST
      ?auto_34080 - PLACE
      ?auto_34079 - PLACE
      ?auto_34076 - HOIST
      ?auto_34075 - SURFACE
      ?auto_34081 - SURFACE
      ?auto_34072 - PLACE
      ?auto_34078 - HOIST
      ?auto_34071 - SURFACE
      ?auto_34073 - TRUCK
      ?auto_34077 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34074 ?auto_34080 ) ( IS-CRATE ?auto_34069 ) ( not ( = ?auto_34069 ?auto_34070 ) ) ( not ( = ?auto_34079 ?auto_34080 ) ) ( HOIST-AT ?auto_34076 ?auto_34079 ) ( not ( = ?auto_34074 ?auto_34076 ) ) ( AVAILABLE ?auto_34076 ) ( SURFACE-AT ?auto_34069 ?auto_34079 ) ( ON ?auto_34069 ?auto_34075 ) ( CLEAR ?auto_34069 ) ( not ( = ?auto_34069 ?auto_34075 ) ) ( not ( = ?auto_34070 ?auto_34075 ) ) ( IS-CRATE ?auto_34070 ) ( not ( = ?auto_34069 ?auto_34081 ) ) ( not ( = ?auto_34070 ?auto_34081 ) ) ( not ( = ?auto_34075 ?auto_34081 ) ) ( not ( = ?auto_34072 ?auto_34080 ) ) ( not ( = ?auto_34079 ?auto_34072 ) ) ( HOIST-AT ?auto_34078 ?auto_34072 ) ( not ( = ?auto_34074 ?auto_34078 ) ) ( not ( = ?auto_34076 ?auto_34078 ) ) ( AVAILABLE ?auto_34078 ) ( SURFACE-AT ?auto_34070 ?auto_34072 ) ( ON ?auto_34070 ?auto_34071 ) ( CLEAR ?auto_34070 ) ( not ( = ?auto_34069 ?auto_34071 ) ) ( not ( = ?auto_34070 ?auto_34071 ) ) ( not ( = ?auto_34075 ?auto_34071 ) ) ( not ( = ?auto_34081 ?auto_34071 ) ) ( TRUCK-AT ?auto_34073 ?auto_34080 ) ( SURFACE-AT ?auto_34077 ?auto_34080 ) ( CLEAR ?auto_34077 ) ( IS-CRATE ?auto_34081 ) ( not ( = ?auto_34069 ?auto_34077 ) ) ( not ( = ?auto_34070 ?auto_34077 ) ) ( not ( = ?auto_34075 ?auto_34077 ) ) ( not ( = ?auto_34081 ?auto_34077 ) ) ( not ( = ?auto_34071 ?auto_34077 ) ) ( AVAILABLE ?auto_34074 ) ( IN ?auto_34081 ?auto_34073 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34074 ?auto_34081 ?auto_34073 ?auto_34080 )
      ( MAKE-ON ?auto_34069 ?auto_34070 )
      ( MAKE-ON-VERIFY ?auto_34069 ?auto_34070 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34082 - SURFACE
      ?auto_34083 - SURFACE
    )
    :vars
    (
      ?auto_34090 - HOIST
      ?auto_34086 - PLACE
      ?auto_34089 - PLACE
      ?auto_34093 - HOIST
      ?auto_34091 - SURFACE
      ?auto_34088 - SURFACE
      ?auto_34085 - PLACE
      ?auto_34087 - HOIST
      ?auto_34084 - SURFACE
      ?auto_34094 - SURFACE
      ?auto_34092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34090 ?auto_34086 ) ( IS-CRATE ?auto_34082 ) ( not ( = ?auto_34082 ?auto_34083 ) ) ( not ( = ?auto_34089 ?auto_34086 ) ) ( HOIST-AT ?auto_34093 ?auto_34089 ) ( not ( = ?auto_34090 ?auto_34093 ) ) ( AVAILABLE ?auto_34093 ) ( SURFACE-AT ?auto_34082 ?auto_34089 ) ( ON ?auto_34082 ?auto_34091 ) ( CLEAR ?auto_34082 ) ( not ( = ?auto_34082 ?auto_34091 ) ) ( not ( = ?auto_34083 ?auto_34091 ) ) ( IS-CRATE ?auto_34083 ) ( not ( = ?auto_34082 ?auto_34088 ) ) ( not ( = ?auto_34083 ?auto_34088 ) ) ( not ( = ?auto_34091 ?auto_34088 ) ) ( not ( = ?auto_34085 ?auto_34086 ) ) ( not ( = ?auto_34089 ?auto_34085 ) ) ( HOIST-AT ?auto_34087 ?auto_34085 ) ( not ( = ?auto_34090 ?auto_34087 ) ) ( not ( = ?auto_34093 ?auto_34087 ) ) ( AVAILABLE ?auto_34087 ) ( SURFACE-AT ?auto_34083 ?auto_34085 ) ( ON ?auto_34083 ?auto_34084 ) ( CLEAR ?auto_34083 ) ( not ( = ?auto_34082 ?auto_34084 ) ) ( not ( = ?auto_34083 ?auto_34084 ) ) ( not ( = ?auto_34091 ?auto_34084 ) ) ( not ( = ?auto_34088 ?auto_34084 ) ) ( SURFACE-AT ?auto_34094 ?auto_34086 ) ( CLEAR ?auto_34094 ) ( IS-CRATE ?auto_34088 ) ( not ( = ?auto_34082 ?auto_34094 ) ) ( not ( = ?auto_34083 ?auto_34094 ) ) ( not ( = ?auto_34091 ?auto_34094 ) ) ( not ( = ?auto_34088 ?auto_34094 ) ) ( not ( = ?auto_34084 ?auto_34094 ) ) ( AVAILABLE ?auto_34090 ) ( IN ?auto_34088 ?auto_34092 ) ( TRUCK-AT ?auto_34092 ?auto_34089 ) )
    :subtasks
    ( ( !DRIVE ?auto_34092 ?auto_34089 ?auto_34086 )
      ( MAKE-ON ?auto_34082 ?auto_34083 )
      ( MAKE-ON-VERIFY ?auto_34082 ?auto_34083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34095 - SURFACE
      ?auto_34096 - SURFACE
    )
    :vars
    (
      ?auto_34106 - HOIST
      ?auto_34103 - PLACE
      ?auto_34105 - PLACE
      ?auto_34098 - HOIST
      ?auto_34104 - SURFACE
      ?auto_34099 - SURFACE
      ?auto_34102 - PLACE
      ?auto_34100 - HOIST
      ?auto_34101 - SURFACE
      ?auto_34107 - SURFACE
      ?auto_34097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34106 ?auto_34103 ) ( IS-CRATE ?auto_34095 ) ( not ( = ?auto_34095 ?auto_34096 ) ) ( not ( = ?auto_34105 ?auto_34103 ) ) ( HOIST-AT ?auto_34098 ?auto_34105 ) ( not ( = ?auto_34106 ?auto_34098 ) ) ( SURFACE-AT ?auto_34095 ?auto_34105 ) ( ON ?auto_34095 ?auto_34104 ) ( CLEAR ?auto_34095 ) ( not ( = ?auto_34095 ?auto_34104 ) ) ( not ( = ?auto_34096 ?auto_34104 ) ) ( IS-CRATE ?auto_34096 ) ( not ( = ?auto_34095 ?auto_34099 ) ) ( not ( = ?auto_34096 ?auto_34099 ) ) ( not ( = ?auto_34104 ?auto_34099 ) ) ( not ( = ?auto_34102 ?auto_34103 ) ) ( not ( = ?auto_34105 ?auto_34102 ) ) ( HOIST-AT ?auto_34100 ?auto_34102 ) ( not ( = ?auto_34106 ?auto_34100 ) ) ( not ( = ?auto_34098 ?auto_34100 ) ) ( AVAILABLE ?auto_34100 ) ( SURFACE-AT ?auto_34096 ?auto_34102 ) ( ON ?auto_34096 ?auto_34101 ) ( CLEAR ?auto_34096 ) ( not ( = ?auto_34095 ?auto_34101 ) ) ( not ( = ?auto_34096 ?auto_34101 ) ) ( not ( = ?auto_34104 ?auto_34101 ) ) ( not ( = ?auto_34099 ?auto_34101 ) ) ( SURFACE-AT ?auto_34107 ?auto_34103 ) ( CLEAR ?auto_34107 ) ( IS-CRATE ?auto_34099 ) ( not ( = ?auto_34095 ?auto_34107 ) ) ( not ( = ?auto_34096 ?auto_34107 ) ) ( not ( = ?auto_34104 ?auto_34107 ) ) ( not ( = ?auto_34099 ?auto_34107 ) ) ( not ( = ?auto_34101 ?auto_34107 ) ) ( AVAILABLE ?auto_34106 ) ( TRUCK-AT ?auto_34097 ?auto_34105 ) ( LIFTING ?auto_34098 ?auto_34099 ) )
    :subtasks
    ( ( !LOAD ?auto_34098 ?auto_34099 ?auto_34097 ?auto_34105 )
      ( MAKE-ON ?auto_34095 ?auto_34096 )
      ( MAKE-ON-VERIFY ?auto_34095 ?auto_34096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34108 - SURFACE
      ?auto_34109 - SURFACE
    )
    :vars
    (
      ?auto_34118 - HOIST
      ?auto_34110 - PLACE
      ?auto_34115 - PLACE
      ?auto_34119 - HOIST
      ?auto_34111 - SURFACE
      ?auto_34120 - SURFACE
      ?auto_34113 - PLACE
      ?auto_34114 - HOIST
      ?auto_34112 - SURFACE
      ?auto_34117 - SURFACE
      ?auto_34116 - TRUCK
      ?auto_34121 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34118 ?auto_34110 ) ( IS-CRATE ?auto_34108 ) ( not ( = ?auto_34108 ?auto_34109 ) ) ( not ( = ?auto_34115 ?auto_34110 ) ) ( HOIST-AT ?auto_34119 ?auto_34115 ) ( not ( = ?auto_34118 ?auto_34119 ) ) ( SURFACE-AT ?auto_34108 ?auto_34115 ) ( ON ?auto_34108 ?auto_34111 ) ( CLEAR ?auto_34108 ) ( not ( = ?auto_34108 ?auto_34111 ) ) ( not ( = ?auto_34109 ?auto_34111 ) ) ( IS-CRATE ?auto_34109 ) ( not ( = ?auto_34108 ?auto_34120 ) ) ( not ( = ?auto_34109 ?auto_34120 ) ) ( not ( = ?auto_34111 ?auto_34120 ) ) ( not ( = ?auto_34113 ?auto_34110 ) ) ( not ( = ?auto_34115 ?auto_34113 ) ) ( HOIST-AT ?auto_34114 ?auto_34113 ) ( not ( = ?auto_34118 ?auto_34114 ) ) ( not ( = ?auto_34119 ?auto_34114 ) ) ( AVAILABLE ?auto_34114 ) ( SURFACE-AT ?auto_34109 ?auto_34113 ) ( ON ?auto_34109 ?auto_34112 ) ( CLEAR ?auto_34109 ) ( not ( = ?auto_34108 ?auto_34112 ) ) ( not ( = ?auto_34109 ?auto_34112 ) ) ( not ( = ?auto_34111 ?auto_34112 ) ) ( not ( = ?auto_34120 ?auto_34112 ) ) ( SURFACE-AT ?auto_34117 ?auto_34110 ) ( CLEAR ?auto_34117 ) ( IS-CRATE ?auto_34120 ) ( not ( = ?auto_34108 ?auto_34117 ) ) ( not ( = ?auto_34109 ?auto_34117 ) ) ( not ( = ?auto_34111 ?auto_34117 ) ) ( not ( = ?auto_34120 ?auto_34117 ) ) ( not ( = ?auto_34112 ?auto_34117 ) ) ( AVAILABLE ?auto_34118 ) ( TRUCK-AT ?auto_34116 ?auto_34115 ) ( AVAILABLE ?auto_34119 ) ( SURFACE-AT ?auto_34120 ?auto_34115 ) ( ON ?auto_34120 ?auto_34121 ) ( CLEAR ?auto_34120 ) ( not ( = ?auto_34108 ?auto_34121 ) ) ( not ( = ?auto_34109 ?auto_34121 ) ) ( not ( = ?auto_34111 ?auto_34121 ) ) ( not ( = ?auto_34120 ?auto_34121 ) ) ( not ( = ?auto_34112 ?auto_34121 ) ) ( not ( = ?auto_34117 ?auto_34121 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34119 ?auto_34120 ?auto_34121 ?auto_34115 )
      ( MAKE-ON ?auto_34108 ?auto_34109 )
      ( MAKE-ON-VERIFY ?auto_34108 ?auto_34109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34122 - SURFACE
      ?auto_34123 - SURFACE
    )
    :vars
    (
      ?auto_34134 - HOIST
      ?auto_34135 - PLACE
      ?auto_34132 - PLACE
      ?auto_34129 - HOIST
      ?auto_34130 - SURFACE
      ?auto_34127 - SURFACE
      ?auto_34128 - PLACE
      ?auto_34126 - HOIST
      ?auto_34133 - SURFACE
      ?auto_34131 - SURFACE
      ?auto_34125 - SURFACE
      ?auto_34124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34134 ?auto_34135 ) ( IS-CRATE ?auto_34122 ) ( not ( = ?auto_34122 ?auto_34123 ) ) ( not ( = ?auto_34132 ?auto_34135 ) ) ( HOIST-AT ?auto_34129 ?auto_34132 ) ( not ( = ?auto_34134 ?auto_34129 ) ) ( SURFACE-AT ?auto_34122 ?auto_34132 ) ( ON ?auto_34122 ?auto_34130 ) ( CLEAR ?auto_34122 ) ( not ( = ?auto_34122 ?auto_34130 ) ) ( not ( = ?auto_34123 ?auto_34130 ) ) ( IS-CRATE ?auto_34123 ) ( not ( = ?auto_34122 ?auto_34127 ) ) ( not ( = ?auto_34123 ?auto_34127 ) ) ( not ( = ?auto_34130 ?auto_34127 ) ) ( not ( = ?auto_34128 ?auto_34135 ) ) ( not ( = ?auto_34132 ?auto_34128 ) ) ( HOIST-AT ?auto_34126 ?auto_34128 ) ( not ( = ?auto_34134 ?auto_34126 ) ) ( not ( = ?auto_34129 ?auto_34126 ) ) ( AVAILABLE ?auto_34126 ) ( SURFACE-AT ?auto_34123 ?auto_34128 ) ( ON ?auto_34123 ?auto_34133 ) ( CLEAR ?auto_34123 ) ( not ( = ?auto_34122 ?auto_34133 ) ) ( not ( = ?auto_34123 ?auto_34133 ) ) ( not ( = ?auto_34130 ?auto_34133 ) ) ( not ( = ?auto_34127 ?auto_34133 ) ) ( SURFACE-AT ?auto_34131 ?auto_34135 ) ( CLEAR ?auto_34131 ) ( IS-CRATE ?auto_34127 ) ( not ( = ?auto_34122 ?auto_34131 ) ) ( not ( = ?auto_34123 ?auto_34131 ) ) ( not ( = ?auto_34130 ?auto_34131 ) ) ( not ( = ?auto_34127 ?auto_34131 ) ) ( not ( = ?auto_34133 ?auto_34131 ) ) ( AVAILABLE ?auto_34134 ) ( AVAILABLE ?auto_34129 ) ( SURFACE-AT ?auto_34127 ?auto_34132 ) ( ON ?auto_34127 ?auto_34125 ) ( CLEAR ?auto_34127 ) ( not ( = ?auto_34122 ?auto_34125 ) ) ( not ( = ?auto_34123 ?auto_34125 ) ) ( not ( = ?auto_34130 ?auto_34125 ) ) ( not ( = ?auto_34127 ?auto_34125 ) ) ( not ( = ?auto_34133 ?auto_34125 ) ) ( not ( = ?auto_34131 ?auto_34125 ) ) ( TRUCK-AT ?auto_34124 ?auto_34135 ) )
    :subtasks
    ( ( !DRIVE ?auto_34124 ?auto_34135 ?auto_34132 )
      ( MAKE-ON ?auto_34122 ?auto_34123 )
      ( MAKE-ON-VERIFY ?auto_34122 ?auto_34123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34136 - SURFACE
      ?auto_34137 - SURFACE
    )
    :vars
    (
      ?auto_34139 - HOIST
      ?auto_34144 - PLACE
      ?auto_34148 - PLACE
      ?auto_34147 - HOIST
      ?auto_34142 - SURFACE
      ?auto_34146 - SURFACE
      ?auto_34141 - PLACE
      ?auto_34138 - HOIST
      ?auto_34140 - SURFACE
      ?auto_34143 - SURFACE
      ?auto_34145 - SURFACE
      ?auto_34149 - TRUCK
      ?auto_34150 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34139 ?auto_34144 ) ( IS-CRATE ?auto_34136 ) ( not ( = ?auto_34136 ?auto_34137 ) ) ( not ( = ?auto_34148 ?auto_34144 ) ) ( HOIST-AT ?auto_34147 ?auto_34148 ) ( not ( = ?auto_34139 ?auto_34147 ) ) ( SURFACE-AT ?auto_34136 ?auto_34148 ) ( ON ?auto_34136 ?auto_34142 ) ( CLEAR ?auto_34136 ) ( not ( = ?auto_34136 ?auto_34142 ) ) ( not ( = ?auto_34137 ?auto_34142 ) ) ( IS-CRATE ?auto_34137 ) ( not ( = ?auto_34136 ?auto_34146 ) ) ( not ( = ?auto_34137 ?auto_34146 ) ) ( not ( = ?auto_34142 ?auto_34146 ) ) ( not ( = ?auto_34141 ?auto_34144 ) ) ( not ( = ?auto_34148 ?auto_34141 ) ) ( HOIST-AT ?auto_34138 ?auto_34141 ) ( not ( = ?auto_34139 ?auto_34138 ) ) ( not ( = ?auto_34147 ?auto_34138 ) ) ( AVAILABLE ?auto_34138 ) ( SURFACE-AT ?auto_34137 ?auto_34141 ) ( ON ?auto_34137 ?auto_34140 ) ( CLEAR ?auto_34137 ) ( not ( = ?auto_34136 ?auto_34140 ) ) ( not ( = ?auto_34137 ?auto_34140 ) ) ( not ( = ?auto_34142 ?auto_34140 ) ) ( not ( = ?auto_34146 ?auto_34140 ) ) ( IS-CRATE ?auto_34146 ) ( not ( = ?auto_34136 ?auto_34143 ) ) ( not ( = ?auto_34137 ?auto_34143 ) ) ( not ( = ?auto_34142 ?auto_34143 ) ) ( not ( = ?auto_34146 ?auto_34143 ) ) ( not ( = ?auto_34140 ?auto_34143 ) ) ( AVAILABLE ?auto_34147 ) ( SURFACE-AT ?auto_34146 ?auto_34148 ) ( ON ?auto_34146 ?auto_34145 ) ( CLEAR ?auto_34146 ) ( not ( = ?auto_34136 ?auto_34145 ) ) ( not ( = ?auto_34137 ?auto_34145 ) ) ( not ( = ?auto_34142 ?auto_34145 ) ) ( not ( = ?auto_34146 ?auto_34145 ) ) ( not ( = ?auto_34140 ?auto_34145 ) ) ( not ( = ?auto_34143 ?auto_34145 ) ) ( TRUCK-AT ?auto_34149 ?auto_34144 ) ( SURFACE-AT ?auto_34150 ?auto_34144 ) ( CLEAR ?auto_34150 ) ( LIFTING ?auto_34139 ?auto_34143 ) ( IS-CRATE ?auto_34143 ) ( not ( = ?auto_34136 ?auto_34150 ) ) ( not ( = ?auto_34137 ?auto_34150 ) ) ( not ( = ?auto_34142 ?auto_34150 ) ) ( not ( = ?auto_34146 ?auto_34150 ) ) ( not ( = ?auto_34140 ?auto_34150 ) ) ( not ( = ?auto_34143 ?auto_34150 ) ) ( not ( = ?auto_34145 ?auto_34150 ) ) )
    :subtasks
    ( ( !DROP ?auto_34139 ?auto_34143 ?auto_34150 ?auto_34144 )
      ( MAKE-ON ?auto_34136 ?auto_34137 )
      ( MAKE-ON-VERIFY ?auto_34136 ?auto_34137 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34151 - SURFACE
      ?auto_34152 - SURFACE
    )
    :vars
    (
      ?auto_34154 - HOIST
      ?auto_34165 - PLACE
      ?auto_34159 - PLACE
      ?auto_34163 - HOIST
      ?auto_34157 - SURFACE
      ?auto_34158 - SURFACE
      ?auto_34155 - PLACE
      ?auto_34164 - HOIST
      ?auto_34162 - SURFACE
      ?auto_34156 - SURFACE
      ?auto_34153 - SURFACE
      ?auto_34161 - TRUCK
      ?auto_34160 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34154 ?auto_34165 ) ( IS-CRATE ?auto_34151 ) ( not ( = ?auto_34151 ?auto_34152 ) ) ( not ( = ?auto_34159 ?auto_34165 ) ) ( HOIST-AT ?auto_34163 ?auto_34159 ) ( not ( = ?auto_34154 ?auto_34163 ) ) ( SURFACE-AT ?auto_34151 ?auto_34159 ) ( ON ?auto_34151 ?auto_34157 ) ( CLEAR ?auto_34151 ) ( not ( = ?auto_34151 ?auto_34157 ) ) ( not ( = ?auto_34152 ?auto_34157 ) ) ( IS-CRATE ?auto_34152 ) ( not ( = ?auto_34151 ?auto_34158 ) ) ( not ( = ?auto_34152 ?auto_34158 ) ) ( not ( = ?auto_34157 ?auto_34158 ) ) ( not ( = ?auto_34155 ?auto_34165 ) ) ( not ( = ?auto_34159 ?auto_34155 ) ) ( HOIST-AT ?auto_34164 ?auto_34155 ) ( not ( = ?auto_34154 ?auto_34164 ) ) ( not ( = ?auto_34163 ?auto_34164 ) ) ( AVAILABLE ?auto_34164 ) ( SURFACE-AT ?auto_34152 ?auto_34155 ) ( ON ?auto_34152 ?auto_34162 ) ( CLEAR ?auto_34152 ) ( not ( = ?auto_34151 ?auto_34162 ) ) ( not ( = ?auto_34152 ?auto_34162 ) ) ( not ( = ?auto_34157 ?auto_34162 ) ) ( not ( = ?auto_34158 ?auto_34162 ) ) ( IS-CRATE ?auto_34158 ) ( not ( = ?auto_34151 ?auto_34156 ) ) ( not ( = ?auto_34152 ?auto_34156 ) ) ( not ( = ?auto_34157 ?auto_34156 ) ) ( not ( = ?auto_34158 ?auto_34156 ) ) ( not ( = ?auto_34162 ?auto_34156 ) ) ( AVAILABLE ?auto_34163 ) ( SURFACE-AT ?auto_34158 ?auto_34159 ) ( ON ?auto_34158 ?auto_34153 ) ( CLEAR ?auto_34158 ) ( not ( = ?auto_34151 ?auto_34153 ) ) ( not ( = ?auto_34152 ?auto_34153 ) ) ( not ( = ?auto_34157 ?auto_34153 ) ) ( not ( = ?auto_34158 ?auto_34153 ) ) ( not ( = ?auto_34162 ?auto_34153 ) ) ( not ( = ?auto_34156 ?auto_34153 ) ) ( TRUCK-AT ?auto_34161 ?auto_34165 ) ( SURFACE-AT ?auto_34160 ?auto_34165 ) ( CLEAR ?auto_34160 ) ( IS-CRATE ?auto_34156 ) ( not ( = ?auto_34151 ?auto_34160 ) ) ( not ( = ?auto_34152 ?auto_34160 ) ) ( not ( = ?auto_34157 ?auto_34160 ) ) ( not ( = ?auto_34158 ?auto_34160 ) ) ( not ( = ?auto_34162 ?auto_34160 ) ) ( not ( = ?auto_34156 ?auto_34160 ) ) ( not ( = ?auto_34153 ?auto_34160 ) ) ( AVAILABLE ?auto_34154 ) ( IN ?auto_34156 ?auto_34161 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34154 ?auto_34156 ?auto_34161 ?auto_34165 )
      ( MAKE-ON ?auto_34151 ?auto_34152 )
      ( MAKE-ON-VERIFY ?auto_34151 ?auto_34152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34166 - SURFACE
      ?auto_34167 - SURFACE
    )
    :vars
    (
      ?auto_34169 - HOIST
      ?auto_34170 - PLACE
      ?auto_34180 - PLACE
      ?auto_34171 - HOIST
      ?auto_34177 - SURFACE
      ?auto_34179 - SURFACE
      ?auto_34176 - PLACE
      ?auto_34172 - HOIST
      ?auto_34175 - SURFACE
      ?auto_34173 - SURFACE
      ?auto_34174 - SURFACE
      ?auto_34178 - SURFACE
      ?auto_34168 - TRUCK
      ?auto_34181 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34169 ?auto_34170 ) ( IS-CRATE ?auto_34166 ) ( not ( = ?auto_34166 ?auto_34167 ) ) ( not ( = ?auto_34180 ?auto_34170 ) ) ( HOIST-AT ?auto_34171 ?auto_34180 ) ( not ( = ?auto_34169 ?auto_34171 ) ) ( SURFACE-AT ?auto_34166 ?auto_34180 ) ( ON ?auto_34166 ?auto_34177 ) ( CLEAR ?auto_34166 ) ( not ( = ?auto_34166 ?auto_34177 ) ) ( not ( = ?auto_34167 ?auto_34177 ) ) ( IS-CRATE ?auto_34167 ) ( not ( = ?auto_34166 ?auto_34179 ) ) ( not ( = ?auto_34167 ?auto_34179 ) ) ( not ( = ?auto_34177 ?auto_34179 ) ) ( not ( = ?auto_34176 ?auto_34170 ) ) ( not ( = ?auto_34180 ?auto_34176 ) ) ( HOIST-AT ?auto_34172 ?auto_34176 ) ( not ( = ?auto_34169 ?auto_34172 ) ) ( not ( = ?auto_34171 ?auto_34172 ) ) ( AVAILABLE ?auto_34172 ) ( SURFACE-AT ?auto_34167 ?auto_34176 ) ( ON ?auto_34167 ?auto_34175 ) ( CLEAR ?auto_34167 ) ( not ( = ?auto_34166 ?auto_34175 ) ) ( not ( = ?auto_34167 ?auto_34175 ) ) ( not ( = ?auto_34177 ?auto_34175 ) ) ( not ( = ?auto_34179 ?auto_34175 ) ) ( IS-CRATE ?auto_34179 ) ( not ( = ?auto_34166 ?auto_34173 ) ) ( not ( = ?auto_34167 ?auto_34173 ) ) ( not ( = ?auto_34177 ?auto_34173 ) ) ( not ( = ?auto_34179 ?auto_34173 ) ) ( not ( = ?auto_34175 ?auto_34173 ) ) ( AVAILABLE ?auto_34171 ) ( SURFACE-AT ?auto_34179 ?auto_34180 ) ( ON ?auto_34179 ?auto_34174 ) ( CLEAR ?auto_34179 ) ( not ( = ?auto_34166 ?auto_34174 ) ) ( not ( = ?auto_34167 ?auto_34174 ) ) ( not ( = ?auto_34177 ?auto_34174 ) ) ( not ( = ?auto_34179 ?auto_34174 ) ) ( not ( = ?auto_34175 ?auto_34174 ) ) ( not ( = ?auto_34173 ?auto_34174 ) ) ( SURFACE-AT ?auto_34178 ?auto_34170 ) ( CLEAR ?auto_34178 ) ( IS-CRATE ?auto_34173 ) ( not ( = ?auto_34166 ?auto_34178 ) ) ( not ( = ?auto_34167 ?auto_34178 ) ) ( not ( = ?auto_34177 ?auto_34178 ) ) ( not ( = ?auto_34179 ?auto_34178 ) ) ( not ( = ?auto_34175 ?auto_34178 ) ) ( not ( = ?auto_34173 ?auto_34178 ) ) ( not ( = ?auto_34174 ?auto_34178 ) ) ( AVAILABLE ?auto_34169 ) ( IN ?auto_34173 ?auto_34168 ) ( TRUCK-AT ?auto_34168 ?auto_34181 ) ( not ( = ?auto_34181 ?auto_34170 ) ) ( not ( = ?auto_34180 ?auto_34181 ) ) ( not ( = ?auto_34176 ?auto_34181 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34168 ?auto_34181 ?auto_34170 )
      ( MAKE-ON ?auto_34166 ?auto_34167 )
      ( MAKE-ON-VERIFY ?auto_34166 ?auto_34167 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34182 - SURFACE
      ?auto_34183 - SURFACE
    )
    :vars
    (
      ?auto_34189 - HOIST
      ?auto_34197 - PLACE
      ?auto_34194 - PLACE
      ?auto_34185 - HOIST
      ?auto_34193 - SURFACE
      ?auto_34192 - SURFACE
      ?auto_34186 - PLACE
      ?auto_34190 - HOIST
      ?auto_34195 - SURFACE
      ?auto_34196 - SURFACE
      ?auto_34191 - SURFACE
      ?auto_34184 - SURFACE
      ?auto_34187 - TRUCK
      ?auto_34188 - PLACE
      ?auto_34198 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34189 ?auto_34197 ) ( IS-CRATE ?auto_34182 ) ( not ( = ?auto_34182 ?auto_34183 ) ) ( not ( = ?auto_34194 ?auto_34197 ) ) ( HOIST-AT ?auto_34185 ?auto_34194 ) ( not ( = ?auto_34189 ?auto_34185 ) ) ( SURFACE-AT ?auto_34182 ?auto_34194 ) ( ON ?auto_34182 ?auto_34193 ) ( CLEAR ?auto_34182 ) ( not ( = ?auto_34182 ?auto_34193 ) ) ( not ( = ?auto_34183 ?auto_34193 ) ) ( IS-CRATE ?auto_34183 ) ( not ( = ?auto_34182 ?auto_34192 ) ) ( not ( = ?auto_34183 ?auto_34192 ) ) ( not ( = ?auto_34193 ?auto_34192 ) ) ( not ( = ?auto_34186 ?auto_34197 ) ) ( not ( = ?auto_34194 ?auto_34186 ) ) ( HOIST-AT ?auto_34190 ?auto_34186 ) ( not ( = ?auto_34189 ?auto_34190 ) ) ( not ( = ?auto_34185 ?auto_34190 ) ) ( AVAILABLE ?auto_34190 ) ( SURFACE-AT ?auto_34183 ?auto_34186 ) ( ON ?auto_34183 ?auto_34195 ) ( CLEAR ?auto_34183 ) ( not ( = ?auto_34182 ?auto_34195 ) ) ( not ( = ?auto_34183 ?auto_34195 ) ) ( not ( = ?auto_34193 ?auto_34195 ) ) ( not ( = ?auto_34192 ?auto_34195 ) ) ( IS-CRATE ?auto_34192 ) ( not ( = ?auto_34182 ?auto_34196 ) ) ( not ( = ?auto_34183 ?auto_34196 ) ) ( not ( = ?auto_34193 ?auto_34196 ) ) ( not ( = ?auto_34192 ?auto_34196 ) ) ( not ( = ?auto_34195 ?auto_34196 ) ) ( AVAILABLE ?auto_34185 ) ( SURFACE-AT ?auto_34192 ?auto_34194 ) ( ON ?auto_34192 ?auto_34191 ) ( CLEAR ?auto_34192 ) ( not ( = ?auto_34182 ?auto_34191 ) ) ( not ( = ?auto_34183 ?auto_34191 ) ) ( not ( = ?auto_34193 ?auto_34191 ) ) ( not ( = ?auto_34192 ?auto_34191 ) ) ( not ( = ?auto_34195 ?auto_34191 ) ) ( not ( = ?auto_34196 ?auto_34191 ) ) ( SURFACE-AT ?auto_34184 ?auto_34197 ) ( CLEAR ?auto_34184 ) ( IS-CRATE ?auto_34196 ) ( not ( = ?auto_34182 ?auto_34184 ) ) ( not ( = ?auto_34183 ?auto_34184 ) ) ( not ( = ?auto_34193 ?auto_34184 ) ) ( not ( = ?auto_34192 ?auto_34184 ) ) ( not ( = ?auto_34195 ?auto_34184 ) ) ( not ( = ?auto_34196 ?auto_34184 ) ) ( not ( = ?auto_34191 ?auto_34184 ) ) ( AVAILABLE ?auto_34189 ) ( TRUCK-AT ?auto_34187 ?auto_34188 ) ( not ( = ?auto_34188 ?auto_34197 ) ) ( not ( = ?auto_34194 ?auto_34188 ) ) ( not ( = ?auto_34186 ?auto_34188 ) ) ( HOIST-AT ?auto_34198 ?auto_34188 ) ( LIFTING ?auto_34198 ?auto_34196 ) ( not ( = ?auto_34189 ?auto_34198 ) ) ( not ( = ?auto_34185 ?auto_34198 ) ) ( not ( = ?auto_34190 ?auto_34198 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34198 ?auto_34196 ?auto_34187 ?auto_34188 )
      ( MAKE-ON ?auto_34182 ?auto_34183 )
      ( MAKE-ON-VERIFY ?auto_34182 ?auto_34183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34199 - SURFACE
      ?auto_34200 - SURFACE
    )
    :vars
    (
      ?auto_34213 - HOIST
      ?auto_34205 - PLACE
      ?auto_34210 - PLACE
      ?auto_34211 - HOIST
      ?auto_34208 - SURFACE
      ?auto_34206 - SURFACE
      ?auto_34214 - PLACE
      ?auto_34204 - HOIST
      ?auto_34209 - SURFACE
      ?auto_34212 - SURFACE
      ?auto_34215 - SURFACE
      ?auto_34202 - SURFACE
      ?auto_34203 - TRUCK
      ?auto_34207 - PLACE
      ?auto_34201 - HOIST
      ?auto_34216 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34213 ?auto_34205 ) ( IS-CRATE ?auto_34199 ) ( not ( = ?auto_34199 ?auto_34200 ) ) ( not ( = ?auto_34210 ?auto_34205 ) ) ( HOIST-AT ?auto_34211 ?auto_34210 ) ( not ( = ?auto_34213 ?auto_34211 ) ) ( SURFACE-AT ?auto_34199 ?auto_34210 ) ( ON ?auto_34199 ?auto_34208 ) ( CLEAR ?auto_34199 ) ( not ( = ?auto_34199 ?auto_34208 ) ) ( not ( = ?auto_34200 ?auto_34208 ) ) ( IS-CRATE ?auto_34200 ) ( not ( = ?auto_34199 ?auto_34206 ) ) ( not ( = ?auto_34200 ?auto_34206 ) ) ( not ( = ?auto_34208 ?auto_34206 ) ) ( not ( = ?auto_34214 ?auto_34205 ) ) ( not ( = ?auto_34210 ?auto_34214 ) ) ( HOIST-AT ?auto_34204 ?auto_34214 ) ( not ( = ?auto_34213 ?auto_34204 ) ) ( not ( = ?auto_34211 ?auto_34204 ) ) ( AVAILABLE ?auto_34204 ) ( SURFACE-AT ?auto_34200 ?auto_34214 ) ( ON ?auto_34200 ?auto_34209 ) ( CLEAR ?auto_34200 ) ( not ( = ?auto_34199 ?auto_34209 ) ) ( not ( = ?auto_34200 ?auto_34209 ) ) ( not ( = ?auto_34208 ?auto_34209 ) ) ( not ( = ?auto_34206 ?auto_34209 ) ) ( IS-CRATE ?auto_34206 ) ( not ( = ?auto_34199 ?auto_34212 ) ) ( not ( = ?auto_34200 ?auto_34212 ) ) ( not ( = ?auto_34208 ?auto_34212 ) ) ( not ( = ?auto_34206 ?auto_34212 ) ) ( not ( = ?auto_34209 ?auto_34212 ) ) ( AVAILABLE ?auto_34211 ) ( SURFACE-AT ?auto_34206 ?auto_34210 ) ( ON ?auto_34206 ?auto_34215 ) ( CLEAR ?auto_34206 ) ( not ( = ?auto_34199 ?auto_34215 ) ) ( not ( = ?auto_34200 ?auto_34215 ) ) ( not ( = ?auto_34208 ?auto_34215 ) ) ( not ( = ?auto_34206 ?auto_34215 ) ) ( not ( = ?auto_34209 ?auto_34215 ) ) ( not ( = ?auto_34212 ?auto_34215 ) ) ( SURFACE-AT ?auto_34202 ?auto_34205 ) ( CLEAR ?auto_34202 ) ( IS-CRATE ?auto_34212 ) ( not ( = ?auto_34199 ?auto_34202 ) ) ( not ( = ?auto_34200 ?auto_34202 ) ) ( not ( = ?auto_34208 ?auto_34202 ) ) ( not ( = ?auto_34206 ?auto_34202 ) ) ( not ( = ?auto_34209 ?auto_34202 ) ) ( not ( = ?auto_34212 ?auto_34202 ) ) ( not ( = ?auto_34215 ?auto_34202 ) ) ( AVAILABLE ?auto_34213 ) ( TRUCK-AT ?auto_34203 ?auto_34207 ) ( not ( = ?auto_34207 ?auto_34205 ) ) ( not ( = ?auto_34210 ?auto_34207 ) ) ( not ( = ?auto_34214 ?auto_34207 ) ) ( HOIST-AT ?auto_34201 ?auto_34207 ) ( not ( = ?auto_34213 ?auto_34201 ) ) ( not ( = ?auto_34211 ?auto_34201 ) ) ( not ( = ?auto_34204 ?auto_34201 ) ) ( AVAILABLE ?auto_34201 ) ( SURFACE-AT ?auto_34212 ?auto_34207 ) ( ON ?auto_34212 ?auto_34216 ) ( CLEAR ?auto_34212 ) ( not ( = ?auto_34199 ?auto_34216 ) ) ( not ( = ?auto_34200 ?auto_34216 ) ) ( not ( = ?auto_34208 ?auto_34216 ) ) ( not ( = ?auto_34206 ?auto_34216 ) ) ( not ( = ?auto_34209 ?auto_34216 ) ) ( not ( = ?auto_34212 ?auto_34216 ) ) ( not ( = ?auto_34215 ?auto_34216 ) ) ( not ( = ?auto_34202 ?auto_34216 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34201 ?auto_34212 ?auto_34216 ?auto_34207 )
      ( MAKE-ON ?auto_34199 ?auto_34200 )
      ( MAKE-ON-VERIFY ?auto_34199 ?auto_34200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34217 - SURFACE
      ?auto_34218 - SURFACE
    )
    :vars
    (
      ?auto_34223 - HOIST
      ?auto_34228 - PLACE
      ?auto_34226 - PLACE
      ?auto_34219 - HOIST
      ?auto_34231 - SURFACE
      ?auto_34229 - SURFACE
      ?auto_34224 - PLACE
      ?auto_34232 - HOIST
      ?auto_34227 - SURFACE
      ?auto_34225 - SURFACE
      ?auto_34221 - SURFACE
      ?auto_34222 - SURFACE
      ?auto_34220 - PLACE
      ?auto_34230 - HOIST
      ?auto_34234 - SURFACE
      ?auto_34233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34223 ?auto_34228 ) ( IS-CRATE ?auto_34217 ) ( not ( = ?auto_34217 ?auto_34218 ) ) ( not ( = ?auto_34226 ?auto_34228 ) ) ( HOIST-AT ?auto_34219 ?auto_34226 ) ( not ( = ?auto_34223 ?auto_34219 ) ) ( SURFACE-AT ?auto_34217 ?auto_34226 ) ( ON ?auto_34217 ?auto_34231 ) ( CLEAR ?auto_34217 ) ( not ( = ?auto_34217 ?auto_34231 ) ) ( not ( = ?auto_34218 ?auto_34231 ) ) ( IS-CRATE ?auto_34218 ) ( not ( = ?auto_34217 ?auto_34229 ) ) ( not ( = ?auto_34218 ?auto_34229 ) ) ( not ( = ?auto_34231 ?auto_34229 ) ) ( not ( = ?auto_34224 ?auto_34228 ) ) ( not ( = ?auto_34226 ?auto_34224 ) ) ( HOIST-AT ?auto_34232 ?auto_34224 ) ( not ( = ?auto_34223 ?auto_34232 ) ) ( not ( = ?auto_34219 ?auto_34232 ) ) ( AVAILABLE ?auto_34232 ) ( SURFACE-AT ?auto_34218 ?auto_34224 ) ( ON ?auto_34218 ?auto_34227 ) ( CLEAR ?auto_34218 ) ( not ( = ?auto_34217 ?auto_34227 ) ) ( not ( = ?auto_34218 ?auto_34227 ) ) ( not ( = ?auto_34231 ?auto_34227 ) ) ( not ( = ?auto_34229 ?auto_34227 ) ) ( IS-CRATE ?auto_34229 ) ( not ( = ?auto_34217 ?auto_34225 ) ) ( not ( = ?auto_34218 ?auto_34225 ) ) ( not ( = ?auto_34231 ?auto_34225 ) ) ( not ( = ?auto_34229 ?auto_34225 ) ) ( not ( = ?auto_34227 ?auto_34225 ) ) ( AVAILABLE ?auto_34219 ) ( SURFACE-AT ?auto_34229 ?auto_34226 ) ( ON ?auto_34229 ?auto_34221 ) ( CLEAR ?auto_34229 ) ( not ( = ?auto_34217 ?auto_34221 ) ) ( not ( = ?auto_34218 ?auto_34221 ) ) ( not ( = ?auto_34231 ?auto_34221 ) ) ( not ( = ?auto_34229 ?auto_34221 ) ) ( not ( = ?auto_34227 ?auto_34221 ) ) ( not ( = ?auto_34225 ?auto_34221 ) ) ( SURFACE-AT ?auto_34222 ?auto_34228 ) ( CLEAR ?auto_34222 ) ( IS-CRATE ?auto_34225 ) ( not ( = ?auto_34217 ?auto_34222 ) ) ( not ( = ?auto_34218 ?auto_34222 ) ) ( not ( = ?auto_34231 ?auto_34222 ) ) ( not ( = ?auto_34229 ?auto_34222 ) ) ( not ( = ?auto_34227 ?auto_34222 ) ) ( not ( = ?auto_34225 ?auto_34222 ) ) ( not ( = ?auto_34221 ?auto_34222 ) ) ( AVAILABLE ?auto_34223 ) ( not ( = ?auto_34220 ?auto_34228 ) ) ( not ( = ?auto_34226 ?auto_34220 ) ) ( not ( = ?auto_34224 ?auto_34220 ) ) ( HOIST-AT ?auto_34230 ?auto_34220 ) ( not ( = ?auto_34223 ?auto_34230 ) ) ( not ( = ?auto_34219 ?auto_34230 ) ) ( not ( = ?auto_34232 ?auto_34230 ) ) ( AVAILABLE ?auto_34230 ) ( SURFACE-AT ?auto_34225 ?auto_34220 ) ( ON ?auto_34225 ?auto_34234 ) ( CLEAR ?auto_34225 ) ( not ( = ?auto_34217 ?auto_34234 ) ) ( not ( = ?auto_34218 ?auto_34234 ) ) ( not ( = ?auto_34231 ?auto_34234 ) ) ( not ( = ?auto_34229 ?auto_34234 ) ) ( not ( = ?auto_34227 ?auto_34234 ) ) ( not ( = ?auto_34225 ?auto_34234 ) ) ( not ( = ?auto_34221 ?auto_34234 ) ) ( not ( = ?auto_34222 ?auto_34234 ) ) ( TRUCK-AT ?auto_34233 ?auto_34228 ) )
    :subtasks
    ( ( !DRIVE ?auto_34233 ?auto_34228 ?auto_34220 )
      ( MAKE-ON ?auto_34217 ?auto_34218 )
      ( MAKE-ON-VERIFY ?auto_34217 ?auto_34218 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34235 - SURFACE
      ?auto_34236 - SURFACE
    )
    :vars
    (
      ?auto_34245 - HOIST
      ?auto_34237 - PLACE
      ?auto_34243 - PLACE
      ?auto_34249 - HOIST
      ?auto_34244 - SURFACE
      ?auto_34246 - SURFACE
      ?auto_34238 - PLACE
      ?auto_34252 - HOIST
      ?auto_34240 - SURFACE
      ?auto_34239 - SURFACE
      ?auto_34251 - SURFACE
      ?auto_34247 - SURFACE
      ?auto_34250 - PLACE
      ?auto_34241 - HOIST
      ?auto_34242 - SURFACE
      ?auto_34248 - TRUCK
      ?auto_34253 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34245 ?auto_34237 ) ( IS-CRATE ?auto_34235 ) ( not ( = ?auto_34235 ?auto_34236 ) ) ( not ( = ?auto_34243 ?auto_34237 ) ) ( HOIST-AT ?auto_34249 ?auto_34243 ) ( not ( = ?auto_34245 ?auto_34249 ) ) ( SURFACE-AT ?auto_34235 ?auto_34243 ) ( ON ?auto_34235 ?auto_34244 ) ( CLEAR ?auto_34235 ) ( not ( = ?auto_34235 ?auto_34244 ) ) ( not ( = ?auto_34236 ?auto_34244 ) ) ( IS-CRATE ?auto_34236 ) ( not ( = ?auto_34235 ?auto_34246 ) ) ( not ( = ?auto_34236 ?auto_34246 ) ) ( not ( = ?auto_34244 ?auto_34246 ) ) ( not ( = ?auto_34238 ?auto_34237 ) ) ( not ( = ?auto_34243 ?auto_34238 ) ) ( HOIST-AT ?auto_34252 ?auto_34238 ) ( not ( = ?auto_34245 ?auto_34252 ) ) ( not ( = ?auto_34249 ?auto_34252 ) ) ( AVAILABLE ?auto_34252 ) ( SURFACE-AT ?auto_34236 ?auto_34238 ) ( ON ?auto_34236 ?auto_34240 ) ( CLEAR ?auto_34236 ) ( not ( = ?auto_34235 ?auto_34240 ) ) ( not ( = ?auto_34236 ?auto_34240 ) ) ( not ( = ?auto_34244 ?auto_34240 ) ) ( not ( = ?auto_34246 ?auto_34240 ) ) ( IS-CRATE ?auto_34246 ) ( not ( = ?auto_34235 ?auto_34239 ) ) ( not ( = ?auto_34236 ?auto_34239 ) ) ( not ( = ?auto_34244 ?auto_34239 ) ) ( not ( = ?auto_34246 ?auto_34239 ) ) ( not ( = ?auto_34240 ?auto_34239 ) ) ( AVAILABLE ?auto_34249 ) ( SURFACE-AT ?auto_34246 ?auto_34243 ) ( ON ?auto_34246 ?auto_34251 ) ( CLEAR ?auto_34246 ) ( not ( = ?auto_34235 ?auto_34251 ) ) ( not ( = ?auto_34236 ?auto_34251 ) ) ( not ( = ?auto_34244 ?auto_34251 ) ) ( not ( = ?auto_34246 ?auto_34251 ) ) ( not ( = ?auto_34240 ?auto_34251 ) ) ( not ( = ?auto_34239 ?auto_34251 ) ) ( IS-CRATE ?auto_34239 ) ( not ( = ?auto_34235 ?auto_34247 ) ) ( not ( = ?auto_34236 ?auto_34247 ) ) ( not ( = ?auto_34244 ?auto_34247 ) ) ( not ( = ?auto_34246 ?auto_34247 ) ) ( not ( = ?auto_34240 ?auto_34247 ) ) ( not ( = ?auto_34239 ?auto_34247 ) ) ( not ( = ?auto_34251 ?auto_34247 ) ) ( not ( = ?auto_34250 ?auto_34237 ) ) ( not ( = ?auto_34243 ?auto_34250 ) ) ( not ( = ?auto_34238 ?auto_34250 ) ) ( HOIST-AT ?auto_34241 ?auto_34250 ) ( not ( = ?auto_34245 ?auto_34241 ) ) ( not ( = ?auto_34249 ?auto_34241 ) ) ( not ( = ?auto_34252 ?auto_34241 ) ) ( AVAILABLE ?auto_34241 ) ( SURFACE-AT ?auto_34239 ?auto_34250 ) ( ON ?auto_34239 ?auto_34242 ) ( CLEAR ?auto_34239 ) ( not ( = ?auto_34235 ?auto_34242 ) ) ( not ( = ?auto_34236 ?auto_34242 ) ) ( not ( = ?auto_34244 ?auto_34242 ) ) ( not ( = ?auto_34246 ?auto_34242 ) ) ( not ( = ?auto_34240 ?auto_34242 ) ) ( not ( = ?auto_34239 ?auto_34242 ) ) ( not ( = ?auto_34251 ?auto_34242 ) ) ( not ( = ?auto_34247 ?auto_34242 ) ) ( TRUCK-AT ?auto_34248 ?auto_34237 ) ( SURFACE-AT ?auto_34253 ?auto_34237 ) ( CLEAR ?auto_34253 ) ( LIFTING ?auto_34245 ?auto_34247 ) ( IS-CRATE ?auto_34247 ) ( not ( = ?auto_34235 ?auto_34253 ) ) ( not ( = ?auto_34236 ?auto_34253 ) ) ( not ( = ?auto_34244 ?auto_34253 ) ) ( not ( = ?auto_34246 ?auto_34253 ) ) ( not ( = ?auto_34240 ?auto_34253 ) ) ( not ( = ?auto_34239 ?auto_34253 ) ) ( not ( = ?auto_34251 ?auto_34253 ) ) ( not ( = ?auto_34247 ?auto_34253 ) ) ( not ( = ?auto_34242 ?auto_34253 ) ) )
    :subtasks
    ( ( !DROP ?auto_34245 ?auto_34247 ?auto_34253 ?auto_34237 )
      ( MAKE-ON ?auto_34235 ?auto_34236 )
      ( MAKE-ON-VERIFY ?auto_34235 ?auto_34236 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34254 - SURFACE
      ?auto_34255 - SURFACE
    )
    :vars
    (
      ?auto_34260 - HOIST
      ?auto_34261 - PLACE
      ?auto_34256 - PLACE
      ?auto_34262 - HOIST
      ?auto_34258 - SURFACE
      ?auto_34263 - SURFACE
      ?auto_34257 - PLACE
      ?auto_34265 - HOIST
      ?auto_34267 - SURFACE
      ?auto_34268 - SURFACE
      ?auto_34264 - SURFACE
      ?auto_34271 - SURFACE
      ?auto_34272 - PLACE
      ?auto_34266 - HOIST
      ?auto_34270 - SURFACE
      ?auto_34259 - TRUCK
      ?auto_34269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34260 ?auto_34261 ) ( IS-CRATE ?auto_34254 ) ( not ( = ?auto_34254 ?auto_34255 ) ) ( not ( = ?auto_34256 ?auto_34261 ) ) ( HOIST-AT ?auto_34262 ?auto_34256 ) ( not ( = ?auto_34260 ?auto_34262 ) ) ( SURFACE-AT ?auto_34254 ?auto_34256 ) ( ON ?auto_34254 ?auto_34258 ) ( CLEAR ?auto_34254 ) ( not ( = ?auto_34254 ?auto_34258 ) ) ( not ( = ?auto_34255 ?auto_34258 ) ) ( IS-CRATE ?auto_34255 ) ( not ( = ?auto_34254 ?auto_34263 ) ) ( not ( = ?auto_34255 ?auto_34263 ) ) ( not ( = ?auto_34258 ?auto_34263 ) ) ( not ( = ?auto_34257 ?auto_34261 ) ) ( not ( = ?auto_34256 ?auto_34257 ) ) ( HOIST-AT ?auto_34265 ?auto_34257 ) ( not ( = ?auto_34260 ?auto_34265 ) ) ( not ( = ?auto_34262 ?auto_34265 ) ) ( AVAILABLE ?auto_34265 ) ( SURFACE-AT ?auto_34255 ?auto_34257 ) ( ON ?auto_34255 ?auto_34267 ) ( CLEAR ?auto_34255 ) ( not ( = ?auto_34254 ?auto_34267 ) ) ( not ( = ?auto_34255 ?auto_34267 ) ) ( not ( = ?auto_34258 ?auto_34267 ) ) ( not ( = ?auto_34263 ?auto_34267 ) ) ( IS-CRATE ?auto_34263 ) ( not ( = ?auto_34254 ?auto_34268 ) ) ( not ( = ?auto_34255 ?auto_34268 ) ) ( not ( = ?auto_34258 ?auto_34268 ) ) ( not ( = ?auto_34263 ?auto_34268 ) ) ( not ( = ?auto_34267 ?auto_34268 ) ) ( AVAILABLE ?auto_34262 ) ( SURFACE-AT ?auto_34263 ?auto_34256 ) ( ON ?auto_34263 ?auto_34264 ) ( CLEAR ?auto_34263 ) ( not ( = ?auto_34254 ?auto_34264 ) ) ( not ( = ?auto_34255 ?auto_34264 ) ) ( not ( = ?auto_34258 ?auto_34264 ) ) ( not ( = ?auto_34263 ?auto_34264 ) ) ( not ( = ?auto_34267 ?auto_34264 ) ) ( not ( = ?auto_34268 ?auto_34264 ) ) ( IS-CRATE ?auto_34268 ) ( not ( = ?auto_34254 ?auto_34271 ) ) ( not ( = ?auto_34255 ?auto_34271 ) ) ( not ( = ?auto_34258 ?auto_34271 ) ) ( not ( = ?auto_34263 ?auto_34271 ) ) ( not ( = ?auto_34267 ?auto_34271 ) ) ( not ( = ?auto_34268 ?auto_34271 ) ) ( not ( = ?auto_34264 ?auto_34271 ) ) ( not ( = ?auto_34272 ?auto_34261 ) ) ( not ( = ?auto_34256 ?auto_34272 ) ) ( not ( = ?auto_34257 ?auto_34272 ) ) ( HOIST-AT ?auto_34266 ?auto_34272 ) ( not ( = ?auto_34260 ?auto_34266 ) ) ( not ( = ?auto_34262 ?auto_34266 ) ) ( not ( = ?auto_34265 ?auto_34266 ) ) ( AVAILABLE ?auto_34266 ) ( SURFACE-AT ?auto_34268 ?auto_34272 ) ( ON ?auto_34268 ?auto_34270 ) ( CLEAR ?auto_34268 ) ( not ( = ?auto_34254 ?auto_34270 ) ) ( not ( = ?auto_34255 ?auto_34270 ) ) ( not ( = ?auto_34258 ?auto_34270 ) ) ( not ( = ?auto_34263 ?auto_34270 ) ) ( not ( = ?auto_34267 ?auto_34270 ) ) ( not ( = ?auto_34268 ?auto_34270 ) ) ( not ( = ?auto_34264 ?auto_34270 ) ) ( not ( = ?auto_34271 ?auto_34270 ) ) ( TRUCK-AT ?auto_34259 ?auto_34261 ) ( SURFACE-AT ?auto_34269 ?auto_34261 ) ( CLEAR ?auto_34269 ) ( IS-CRATE ?auto_34271 ) ( not ( = ?auto_34254 ?auto_34269 ) ) ( not ( = ?auto_34255 ?auto_34269 ) ) ( not ( = ?auto_34258 ?auto_34269 ) ) ( not ( = ?auto_34263 ?auto_34269 ) ) ( not ( = ?auto_34267 ?auto_34269 ) ) ( not ( = ?auto_34268 ?auto_34269 ) ) ( not ( = ?auto_34264 ?auto_34269 ) ) ( not ( = ?auto_34271 ?auto_34269 ) ) ( not ( = ?auto_34270 ?auto_34269 ) ) ( AVAILABLE ?auto_34260 ) ( IN ?auto_34271 ?auto_34259 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34260 ?auto_34271 ?auto_34259 ?auto_34261 )
      ( MAKE-ON ?auto_34254 ?auto_34255 )
      ( MAKE-ON-VERIFY ?auto_34254 ?auto_34255 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34273 - SURFACE
      ?auto_34274 - SURFACE
    )
    :vars
    (
      ?auto_34280 - HOIST
      ?auto_34282 - PLACE
      ?auto_34288 - PLACE
      ?auto_34281 - HOIST
      ?auto_34283 - SURFACE
      ?auto_34285 - SURFACE
      ?auto_34279 - PLACE
      ?auto_34284 - HOIST
      ?auto_34286 - SURFACE
      ?auto_34275 - SURFACE
      ?auto_34276 - SURFACE
      ?auto_34287 - SURFACE
      ?auto_34290 - PLACE
      ?auto_34277 - HOIST
      ?auto_34289 - SURFACE
      ?auto_34278 - SURFACE
      ?auto_34291 - TRUCK
      ?auto_34292 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34280 ?auto_34282 ) ( IS-CRATE ?auto_34273 ) ( not ( = ?auto_34273 ?auto_34274 ) ) ( not ( = ?auto_34288 ?auto_34282 ) ) ( HOIST-AT ?auto_34281 ?auto_34288 ) ( not ( = ?auto_34280 ?auto_34281 ) ) ( SURFACE-AT ?auto_34273 ?auto_34288 ) ( ON ?auto_34273 ?auto_34283 ) ( CLEAR ?auto_34273 ) ( not ( = ?auto_34273 ?auto_34283 ) ) ( not ( = ?auto_34274 ?auto_34283 ) ) ( IS-CRATE ?auto_34274 ) ( not ( = ?auto_34273 ?auto_34285 ) ) ( not ( = ?auto_34274 ?auto_34285 ) ) ( not ( = ?auto_34283 ?auto_34285 ) ) ( not ( = ?auto_34279 ?auto_34282 ) ) ( not ( = ?auto_34288 ?auto_34279 ) ) ( HOIST-AT ?auto_34284 ?auto_34279 ) ( not ( = ?auto_34280 ?auto_34284 ) ) ( not ( = ?auto_34281 ?auto_34284 ) ) ( AVAILABLE ?auto_34284 ) ( SURFACE-AT ?auto_34274 ?auto_34279 ) ( ON ?auto_34274 ?auto_34286 ) ( CLEAR ?auto_34274 ) ( not ( = ?auto_34273 ?auto_34286 ) ) ( not ( = ?auto_34274 ?auto_34286 ) ) ( not ( = ?auto_34283 ?auto_34286 ) ) ( not ( = ?auto_34285 ?auto_34286 ) ) ( IS-CRATE ?auto_34285 ) ( not ( = ?auto_34273 ?auto_34275 ) ) ( not ( = ?auto_34274 ?auto_34275 ) ) ( not ( = ?auto_34283 ?auto_34275 ) ) ( not ( = ?auto_34285 ?auto_34275 ) ) ( not ( = ?auto_34286 ?auto_34275 ) ) ( AVAILABLE ?auto_34281 ) ( SURFACE-AT ?auto_34285 ?auto_34288 ) ( ON ?auto_34285 ?auto_34276 ) ( CLEAR ?auto_34285 ) ( not ( = ?auto_34273 ?auto_34276 ) ) ( not ( = ?auto_34274 ?auto_34276 ) ) ( not ( = ?auto_34283 ?auto_34276 ) ) ( not ( = ?auto_34285 ?auto_34276 ) ) ( not ( = ?auto_34286 ?auto_34276 ) ) ( not ( = ?auto_34275 ?auto_34276 ) ) ( IS-CRATE ?auto_34275 ) ( not ( = ?auto_34273 ?auto_34287 ) ) ( not ( = ?auto_34274 ?auto_34287 ) ) ( not ( = ?auto_34283 ?auto_34287 ) ) ( not ( = ?auto_34285 ?auto_34287 ) ) ( not ( = ?auto_34286 ?auto_34287 ) ) ( not ( = ?auto_34275 ?auto_34287 ) ) ( not ( = ?auto_34276 ?auto_34287 ) ) ( not ( = ?auto_34290 ?auto_34282 ) ) ( not ( = ?auto_34288 ?auto_34290 ) ) ( not ( = ?auto_34279 ?auto_34290 ) ) ( HOIST-AT ?auto_34277 ?auto_34290 ) ( not ( = ?auto_34280 ?auto_34277 ) ) ( not ( = ?auto_34281 ?auto_34277 ) ) ( not ( = ?auto_34284 ?auto_34277 ) ) ( AVAILABLE ?auto_34277 ) ( SURFACE-AT ?auto_34275 ?auto_34290 ) ( ON ?auto_34275 ?auto_34289 ) ( CLEAR ?auto_34275 ) ( not ( = ?auto_34273 ?auto_34289 ) ) ( not ( = ?auto_34274 ?auto_34289 ) ) ( not ( = ?auto_34283 ?auto_34289 ) ) ( not ( = ?auto_34285 ?auto_34289 ) ) ( not ( = ?auto_34286 ?auto_34289 ) ) ( not ( = ?auto_34275 ?auto_34289 ) ) ( not ( = ?auto_34276 ?auto_34289 ) ) ( not ( = ?auto_34287 ?auto_34289 ) ) ( SURFACE-AT ?auto_34278 ?auto_34282 ) ( CLEAR ?auto_34278 ) ( IS-CRATE ?auto_34287 ) ( not ( = ?auto_34273 ?auto_34278 ) ) ( not ( = ?auto_34274 ?auto_34278 ) ) ( not ( = ?auto_34283 ?auto_34278 ) ) ( not ( = ?auto_34285 ?auto_34278 ) ) ( not ( = ?auto_34286 ?auto_34278 ) ) ( not ( = ?auto_34275 ?auto_34278 ) ) ( not ( = ?auto_34276 ?auto_34278 ) ) ( not ( = ?auto_34287 ?auto_34278 ) ) ( not ( = ?auto_34289 ?auto_34278 ) ) ( AVAILABLE ?auto_34280 ) ( IN ?auto_34287 ?auto_34291 ) ( TRUCK-AT ?auto_34291 ?auto_34292 ) ( not ( = ?auto_34292 ?auto_34282 ) ) ( not ( = ?auto_34288 ?auto_34292 ) ) ( not ( = ?auto_34279 ?auto_34292 ) ) ( not ( = ?auto_34290 ?auto_34292 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34291 ?auto_34292 ?auto_34282 )
      ( MAKE-ON ?auto_34273 ?auto_34274 )
      ( MAKE-ON-VERIFY ?auto_34273 ?auto_34274 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34293 - SURFACE
      ?auto_34294 - SURFACE
    )
    :vars
    (
      ?auto_34306 - HOIST
      ?auto_34299 - PLACE
      ?auto_34311 - PLACE
      ?auto_34308 - HOIST
      ?auto_34309 - SURFACE
      ?auto_34298 - SURFACE
      ?auto_34304 - PLACE
      ?auto_34296 - HOIST
      ?auto_34295 - SURFACE
      ?auto_34303 - SURFACE
      ?auto_34297 - SURFACE
      ?auto_34300 - SURFACE
      ?auto_34312 - PLACE
      ?auto_34310 - HOIST
      ?auto_34307 - SURFACE
      ?auto_34305 - SURFACE
      ?auto_34301 - TRUCK
      ?auto_34302 - PLACE
      ?auto_34313 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34306 ?auto_34299 ) ( IS-CRATE ?auto_34293 ) ( not ( = ?auto_34293 ?auto_34294 ) ) ( not ( = ?auto_34311 ?auto_34299 ) ) ( HOIST-AT ?auto_34308 ?auto_34311 ) ( not ( = ?auto_34306 ?auto_34308 ) ) ( SURFACE-AT ?auto_34293 ?auto_34311 ) ( ON ?auto_34293 ?auto_34309 ) ( CLEAR ?auto_34293 ) ( not ( = ?auto_34293 ?auto_34309 ) ) ( not ( = ?auto_34294 ?auto_34309 ) ) ( IS-CRATE ?auto_34294 ) ( not ( = ?auto_34293 ?auto_34298 ) ) ( not ( = ?auto_34294 ?auto_34298 ) ) ( not ( = ?auto_34309 ?auto_34298 ) ) ( not ( = ?auto_34304 ?auto_34299 ) ) ( not ( = ?auto_34311 ?auto_34304 ) ) ( HOIST-AT ?auto_34296 ?auto_34304 ) ( not ( = ?auto_34306 ?auto_34296 ) ) ( not ( = ?auto_34308 ?auto_34296 ) ) ( AVAILABLE ?auto_34296 ) ( SURFACE-AT ?auto_34294 ?auto_34304 ) ( ON ?auto_34294 ?auto_34295 ) ( CLEAR ?auto_34294 ) ( not ( = ?auto_34293 ?auto_34295 ) ) ( not ( = ?auto_34294 ?auto_34295 ) ) ( not ( = ?auto_34309 ?auto_34295 ) ) ( not ( = ?auto_34298 ?auto_34295 ) ) ( IS-CRATE ?auto_34298 ) ( not ( = ?auto_34293 ?auto_34303 ) ) ( not ( = ?auto_34294 ?auto_34303 ) ) ( not ( = ?auto_34309 ?auto_34303 ) ) ( not ( = ?auto_34298 ?auto_34303 ) ) ( not ( = ?auto_34295 ?auto_34303 ) ) ( AVAILABLE ?auto_34308 ) ( SURFACE-AT ?auto_34298 ?auto_34311 ) ( ON ?auto_34298 ?auto_34297 ) ( CLEAR ?auto_34298 ) ( not ( = ?auto_34293 ?auto_34297 ) ) ( not ( = ?auto_34294 ?auto_34297 ) ) ( not ( = ?auto_34309 ?auto_34297 ) ) ( not ( = ?auto_34298 ?auto_34297 ) ) ( not ( = ?auto_34295 ?auto_34297 ) ) ( not ( = ?auto_34303 ?auto_34297 ) ) ( IS-CRATE ?auto_34303 ) ( not ( = ?auto_34293 ?auto_34300 ) ) ( not ( = ?auto_34294 ?auto_34300 ) ) ( not ( = ?auto_34309 ?auto_34300 ) ) ( not ( = ?auto_34298 ?auto_34300 ) ) ( not ( = ?auto_34295 ?auto_34300 ) ) ( not ( = ?auto_34303 ?auto_34300 ) ) ( not ( = ?auto_34297 ?auto_34300 ) ) ( not ( = ?auto_34312 ?auto_34299 ) ) ( not ( = ?auto_34311 ?auto_34312 ) ) ( not ( = ?auto_34304 ?auto_34312 ) ) ( HOIST-AT ?auto_34310 ?auto_34312 ) ( not ( = ?auto_34306 ?auto_34310 ) ) ( not ( = ?auto_34308 ?auto_34310 ) ) ( not ( = ?auto_34296 ?auto_34310 ) ) ( AVAILABLE ?auto_34310 ) ( SURFACE-AT ?auto_34303 ?auto_34312 ) ( ON ?auto_34303 ?auto_34307 ) ( CLEAR ?auto_34303 ) ( not ( = ?auto_34293 ?auto_34307 ) ) ( not ( = ?auto_34294 ?auto_34307 ) ) ( not ( = ?auto_34309 ?auto_34307 ) ) ( not ( = ?auto_34298 ?auto_34307 ) ) ( not ( = ?auto_34295 ?auto_34307 ) ) ( not ( = ?auto_34303 ?auto_34307 ) ) ( not ( = ?auto_34297 ?auto_34307 ) ) ( not ( = ?auto_34300 ?auto_34307 ) ) ( SURFACE-AT ?auto_34305 ?auto_34299 ) ( CLEAR ?auto_34305 ) ( IS-CRATE ?auto_34300 ) ( not ( = ?auto_34293 ?auto_34305 ) ) ( not ( = ?auto_34294 ?auto_34305 ) ) ( not ( = ?auto_34309 ?auto_34305 ) ) ( not ( = ?auto_34298 ?auto_34305 ) ) ( not ( = ?auto_34295 ?auto_34305 ) ) ( not ( = ?auto_34303 ?auto_34305 ) ) ( not ( = ?auto_34297 ?auto_34305 ) ) ( not ( = ?auto_34300 ?auto_34305 ) ) ( not ( = ?auto_34307 ?auto_34305 ) ) ( AVAILABLE ?auto_34306 ) ( TRUCK-AT ?auto_34301 ?auto_34302 ) ( not ( = ?auto_34302 ?auto_34299 ) ) ( not ( = ?auto_34311 ?auto_34302 ) ) ( not ( = ?auto_34304 ?auto_34302 ) ) ( not ( = ?auto_34312 ?auto_34302 ) ) ( HOIST-AT ?auto_34313 ?auto_34302 ) ( LIFTING ?auto_34313 ?auto_34300 ) ( not ( = ?auto_34306 ?auto_34313 ) ) ( not ( = ?auto_34308 ?auto_34313 ) ) ( not ( = ?auto_34296 ?auto_34313 ) ) ( not ( = ?auto_34310 ?auto_34313 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34313 ?auto_34300 ?auto_34301 ?auto_34302 )
      ( MAKE-ON ?auto_34293 ?auto_34294 )
      ( MAKE-ON-VERIFY ?auto_34293 ?auto_34294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34314 - SURFACE
      ?auto_34315 - SURFACE
    )
    :vars
    (
      ?auto_34320 - HOIST
      ?auto_34322 - PLACE
      ?auto_34316 - PLACE
      ?auto_34331 - HOIST
      ?auto_34324 - SURFACE
      ?auto_34330 - SURFACE
      ?auto_34333 - PLACE
      ?auto_34319 - HOIST
      ?auto_34326 - SURFACE
      ?auto_34328 - SURFACE
      ?auto_34332 - SURFACE
      ?auto_34318 - SURFACE
      ?auto_34317 - PLACE
      ?auto_34323 - HOIST
      ?auto_34334 - SURFACE
      ?auto_34321 - SURFACE
      ?auto_34327 - TRUCK
      ?auto_34325 - PLACE
      ?auto_34329 - HOIST
      ?auto_34335 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34320 ?auto_34322 ) ( IS-CRATE ?auto_34314 ) ( not ( = ?auto_34314 ?auto_34315 ) ) ( not ( = ?auto_34316 ?auto_34322 ) ) ( HOIST-AT ?auto_34331 ?auto_34316 ) ( not ( = ?auto_34320 ?auto_34331 ) ) ( SURFACE-AT ?auto_34314 ?auto_34316 ) ( ON ?auto_34314 ?auto_34324 ) ( CLEAR ?auto_34314 ) ( not ( = ?auto_34314 ?auto_34324 ) ) ( not ( = ?auto_34315 ?auto_34324 ) ) ( IS-CRATE ?auto_34315 ) ( not ( = ?auto_34314 ?auto_34330 ) ) ( not ( = ?auto_34315 ?auto_34330 ) ) ( not ( = ?auto_34324 ?auto_34330 ) ) ( not ( = ?auto_34333 ?auto_34322 ) ) ( not ( = ?auto_34316 ?auto_34333 ) ) ( HOIST-AT ?auto_34319 ?auto_34333 ) ( not ( = ?auto_34320 ?auto_34319 ) ) ( not ( = ?auto_34331 ?auto_34319 ) ) ( AVAILABLE ?auto_34319 ) ( SURFACE-AT ?auto_34315 ?auto_34333 ) ( ON ?auto_34315 ?auto_34326 ) ( CLEAR ?auto_34315 ) ( not ( = ?auto_34314 ?auto_34326 ) ) ( not ( = ?auto_34315 ?auto_34326 ) ) ( not ( = ?auto_34324 ?auto_34326 ) ) ( not ( = ?auto_34330 ?auto_34326 ) ) ( IS-CRATE ?auto_34330 ) ( not ( = ?auto_34314 ?auto_34328 ) ) ( not ( = ?auto_34315 ?auto_34328 ) ) ( not ( = ?auto_34324 ?auto_34328 ) ) ( not ( = ?auto_34330 ?auto_34328 ) ) ( not ( = ?auto_34326 ?auto_34328 ) ) ( AVAILABLE ?auto_34331 ) ( SURFACE-AT ?auto_34330 ?auto_34316 ) ( ON ?auto_34330 ?auto_34332 ) ( CLEAR ?auto_34330 ) ( not ( = ?auto_34314 ?auto_34332 ) ) ( not ( = ?auto_34315 ?auto_34332 ) ) ( not ( = ?auto_34324 ?auto_34332 ) ) ( not ( = ?auto_34330 ?auto_34332 ) ) ( not ( = ?auto_34326 ?auto_34332 ) ) ( not ( = ?auto_34328 ?auto_34332 ) ) ( IS-CRATE ?auto_34328 ) ( not ( = ?auto_34314 ?auto_34318 ) ) ( not ( = ?auto_34315 ?auto_34318 ) ) ( not ( = ?auto_34324 ?auto_34318 ) ) ( not ( = ?auto_34330 ?auto_34318 ) ) ( not ( = ?auto_34326 ?auto_34318 ) ) ( not ( = ?auto_34328 ?auto_34318 ) ) ( not ( = ?auto_34332 ?auto_34318 ) ) ( not ( = ?auto_34317 ?auto_34322 ) ) ( not ( = ?auto_34316 ?auto_34317 ) ) ( not ( = ?auto_34333 ?auto_34317 ) ) ( HOIST-AT ?auto_34323 ?auto_34317 ) ( not ( = ?auto_34320 ?auto_34323 ) ) ( not ( = ?auto_34331 ?auto_34323 ) ) ( not ( = ?auto_34319 ?auto_34323 ) ) ( AVAILABLE ?auto_34323 ) ( SURFACE-AT ?auto_34328 ?auto_34317 ) ( ON ?auto_34328 ?auto_34334 ) ( CLEAR ?auto_34328 ) ( not ( = ?auto_34314 ?auto_34334 ) ) ( not ( = ?auto_34315 ?auto_34334 ) ) ( not ( = ?auto_34324 ?auto_34334 ) ) ( not ( = ?auto_34330 ?auto_34334 ) ) ( not ( = ?auto_34326 ?auto_34334 ) ) ( not ( = ?auto_34328 ?auto_34334 ) ) ( not ( = ?auto_34332 ?auto_34334 ) ) ( not ( = ?auto_34318 ?auto_34334 ) ) ( SURFACE-AT ?auto_34321 ?auto_34322 ) ( CLEAR ?auto_34321 ) ( IS-CRATE ?auto_34318 ) ( not ( = ?auto_34314 ?auto_34321 ) ) ( not ( = ?auto_34315 ?auto_34321 ) ) ( not ( = ?auto_34324 ?auto_34321 ) ) ( not ( = ?auto_34330 ?auto_34321 ) ) ( not ( = ?auto_34326 ?auto_34321 ) ) ( not ( = ?auto_34328 ?auto_34321 ) ) ( not ( = ?auto_34332 ?auto_34321 ) ) ( not ( = ?auto_34318 ?auto_34321 ) ) ( not ( = ?auto_34334 ?auto_34321 ) ) ( AVAILABLE ?auto_34320 ) ( TRUCK-AT ?auto_34327 ?auto_34325 ) ( not ( = ?auto_34325 ?auto_34322 ) ) ( not ( = ?auto_34316 ?auto_34325 ) ) ( not ( = ?auto_34333 ?auto_34325 ) ) ( not ( = ?auto_34317 ?auto_34325 ) ) ( HOIST-AT ?auto_34329 ?auto_34325 ) ( not ( = ?auto_34320 ?auto_34329 ) ) ( not ( = ?auto_34331 ?auto_34329 ) ) ( not ( = ?auto_34319 ?auto_34329 ) ) ( not ( = ?auto_34323 ?auto_34329 ) ) ( AVAILABLE ?auto_34329 ) ( SURFACE-AT ?auto_34318 ?auto_34325 ) ( ON ?auto_34318 ?auto_34335 ) ( CLEAR ?auto_34318 ) ( not ( = ?auto_34314 ?auto_34335 ) ) ( not ( = ?auto_34315 ?auto_34335 ) ) ( not ( = ?auto_34324 ?auto_34335 ) ) ( not ( = ?auto_34330 ?auto_34335 ) ) ( not ( = ?auto_34326 ?auto_34335 ) ) ( not ( = ?auto_34328 ?auto_34335 ) ) ( not ( = ?auto_34332 ?auto_34335 ) ) ( not ( = ?auto_34318 ?auto_34335 ) ) ( not ( = ?auto_34334 ?auto_34335 ) ) ( not ( = ?auto_34321 ?auto_34335 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34329 ?auto_34318 ?auto_34335 ?auto_34325 )
      ( MAKE-ON ?auto_34314 ?auto_34315 )
      ( MAKE-ON-VERIFY ?auto_34314 ?auto_34315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34336 - SURFACE
      ?auto_34337 - SURFACE
    )
    :vars
    (
      ?auto_34341 - HOIST
      ?auto_34356 - PLACE
      ?auto_34351 - PLACE
      ?auto_34346 - HOIST
      ?auto_34347 - SURFACE
      ?auto_34353 - SURFACE
      ?auto_34349 - PLACE
      ?auto_34343 - HOIST
      ?auto_34357 - SURFACE
      ?auto_34344 - SURFACE
      ?auto_34348 - SURFACE
      ?auto_34352 - SURFACE
      ?auto_34339 - PLACE
      ?auto_34350 - HOIST
      ?auto_34355 - SURFACE
      ?auto_34338 - SURFACE
      ?auto_34342 - PLACE
      ?auto_34354 - HOIST
      ?auto_34345 - SURFACE
      ?auto_34340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34341 ?auto_34356 ) ( IS-CRATE ?auto_34336 ) ( not ( = ?auto_34336 ?auto_34337 ) ) ( not ( = ?auto_34351 ?auto_34356 ) ) ( HOIST-AT ?auto_34346 ?auto_34351 ) ( not ( = ?auto_34341 ?auto_34346 ) ) ( SURFACE-AT ?auto_34336 ?auto_34351 ) ( ON ?auto_34336 ?auto_34347 ) ( CLEAR ?auto_34336 ) ( not ( = ?auto_34336 ?auto_34347 ) ) ( not ( = ?auto_34337 ?auto_34347 ) ) ( IS-CRATE ?auto_34337 ) ( not ( = ?auto_34336 ?auto_34353 ) ) ( not ( = ?auto_34337 ?auto_34353 ) ) ( not ( = ?auto_34347 ?auto_34353 ) ) ( not ( = ?auto_34349 ?auto_34356 ) ) ( not ( = ?auto_34351 ?auto_34349 ) ) ( HOIST-AT ?auto_34343 ?auto_34349 ) ( not ( = ?auto_34341 ?auto_34343 ) ) ( not ( = ?auto_34346 ?auto_34343 ) ) ( AVAILABLE ?auto_34343 ) ( SURFACE-AT ?auto_34337 ?auto_34349 ) ( ON ?auto_34337 ?auto_34357 ) ( CLEAR ?auto_34337 ) ( not ( = ?auto_34336 ?auto_34357 ) ) ( not ( = ?auto_34337 ?auto_34357 ) ) ( not ( = ?auto_34347 ?auto_34357 ) ) ( not ( = ?auto_34353 ?auto_34357 ) ) ( IS-CRATE ?auto_34353 ) ( not ( = ?auto_34336 ?auto_34344 ) ) ( not ( = ?auto_34337 ?auto_34344 ) ) ( not ( = ?auto_34347 ?auto_34344 ) ) ( not ( = ?auto_34353 ?auto_34344 ) ) ( not ( = ?auto_34357 ?auto_34344 ) ) ( AVAILABLE ?auto_34346 ) ( SURFACE-AT ?auto_34353 ?auto_34351 ) ( ON ?auto_34353 ?auto_34348 ) ( CLEAR ?auto_34353 ) ( not ( = ?auto_34336 ?auto_34348 ) ) ( not ( = ?auto_34337 ?auto_34348 ) ) ( not ( = ?auto_34347 ?auto_34348 ) ) ( not ( = ?auto_34353 ?auto_34348 ) ) ( not ( = ?auto_34357 ?auto_34348 ) ) ( not ( = ?auto_34344 ?auto_34348 ) ) ( IS-CRATE ?auto_34344 ) ( not ( = ?auto_34336 ?auto_34352 ) ) ( not ( = ?auto_34337 ?auto_34352 ) ) ( not ( = ?auto_34347 ?auto_34352 ) ) ( not ( = ?auto_34353 ?auto_34352 ) ) ( not ( = ?auto_34357 ?auto_34352 ) ) ( not ( = ?auto_34344 ?auto_34352 ) ) ( not ( = ?auto_34348 ?auto_34352 ) ) ( not ( = ?auto_34339 ?auto_34356 ) ) ( not ( = ?auto_34351 ?auto_34339 ) ) ( not ( = ?auto_34349 ?auto_34339 ) ) ( HOIST-AT ?auto_34350 ?auto_34339 ) ( not ( = ?auto_34341 ?auto_34350 ) ) ( not ( = ?auto_34346 ?auto_34350 ) ) ( not ( = ?auto_34343 ?auto_34350 ) ) ( AVAILABLE ?auto_34350 ) ( SURFACE-AT ?auto_34344 ?auto_34339 ) ( ON ?auto_34344 ?auto_34355 ) ( CLEAR ?auto_34344 ) ( not ( = ?auto_34336 ?auto_34355 ) ) ( not ( = ?auto_34337 ?auto_34355 ) ) ( not ( = ?auto_34347 ?auto_34355 ) ) ( not ( = ?auto_34353 ?auto_34355 ) ) ( not ( = ?auto_34357 ?auto_34355 ) ) ( not ( = ?auto_34344 ?auto_34355 ) ) ( not ( = ?auto_34348 ?auto_34355 ) ) ( not ( = ?auto_34352 ?auto_34355 ) ) ( SURFACE-AT ?auto_34338 ?auto_34356 ) ( CLEAR ?auto_34338 ) ( IS-CRATE ?auto_34352 ) ( not ( = ?auto_34336 ?auto_34338 ) ) ( not ( = ?auto_34337 ?auto_34338 ) ) ( not ( = ?auto_34347 ?auto_34338 ) ) ( not ( = ?auto_34353 ?auto_34338 ) ) ( not ( = ?auto_34357 ?auto_34338 ) ) ( not ( = ?auto_34344 ?auto_34338 ) ) ( not ( = ?auto_34348 ?auto_34338 ) ) ( not ( = ?auto_34352 ?auto_34338 ) ) ( not ( = ?auto_34355 ?auto_34338 ) ) ( AVAILABLE ?auto_34341 ) ( not ( = ?auto_34342 ?auto_34356 ) ) ( not ( = ?auto_34351 ?auto_34342 ) ) ( not ( = ?auto_34349 ?auto_34342 ) ) ( not ( = ?auto_34339 ?auto_34342 ) ) ( HOIST-AT ?auto_34354 ?auto_34342 ) ( not ( = ?auto_34341 ?auto_34354 ) ) ( not ( = ?auto_34346 ?auto_34354 ) ) ( not ( = ?auto_34343 ?auto_34354 ) ) ( not ( = ?auto_34350 ?auto_34354 ) ) ( AVAILABLE ?auto_34354 ) ( SURFACE-AT ?auto_34352 ?auto_34342 ) ( ON ?auto_34352 ?auto_34345 ) ( CLEAR ?auto_34352 ) ( not ( = ?auto_34336 ?auto_34345 ) ) ( not ( = ?auto_34337 ?auto_34345 ) ) ( not ( = ?auto_34347 ?auto_34345 ) ) ( not ( = ?auto_34353 ?auto_34345 ) ) ( not ( = ?auto_34357 ?auto_34345 ) ) ( not ( = ?auto_34344 ?auto_34345 ) ) ( not ( = ?auto_34348 ?auto_34345 ) ) ( not ( = ?auto_34352 ?auto_34345 ) ) ( not ( = ?auto_34355 ?auto_34345 ) ) ( not ( = ?auto_34338 ?auto_34345 ) ) ( TRUCK-AT ?auto_34340 ?auto_34356 ) )
    :subtasks
    ( ( !DRIVE ?auto_34340 ?auto_34356 ?auto_34342 )
      ( MAKE-ON ?auto_34336 ?auto_34337 )
      ( MAKE-ON-VERIFY ?auto_34336 ?auto_34337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34358 - SURFACE
      ?auto_34359 - SURFACE
    )
    :vars
    (
      ?auto_34375 - HOIST
      ?auto_34361 - PLACE
      ?auto_34376 - PLACE
      ?auto_34371 - HOIST
      ?auto_34365 - SURFACE
      ?auto_34367 - SURFACE
      ?auto_34379 - PLACE
      ?auto_34374 - HOIST
      ?auto_34366 - SURFACE
      ?auto_34378 - SURFACE
      ?auto_34377 - SURFACE
      ?auto_34368 - SURFACE
      ?auto_34370 - PLACE
      ?auto_34373 - HOIST
      ?auto_34363 - SURFACE
      ?auto_34360 - SURFACE
      ?auto_34369 - PLACE
      ?auto_34364 - HOIST
      ?auto_34362 - SURFACE
      ?auto_34372 - TRUCK
      ?auto_34380 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34375 ?auto_34361 ) ( IS-CRATE ?auto_34358 ) ( not ( = ?auto_34358 ?auto_34359 ) ) ( not ( = ?auto_34376 ?auto_34361 ) ) ( HOIST-AT ?auto_34371 ?auto_34376 ) ( not ( = ?auto_34375 ?auto_34371 ) ) ( SURFACE-AT ?auto_34358 ?auto_34376 ) ( ON ?auto_34358 ?auto_34365 ) ( CLEAR ?auto_34358 ) ( not ( = ?auto_34358 ?auto_34365 ) ) ( not ( = ?auto_34359 ?auto_34365 ) ) ( IS-CRATE ?auto_34359 ) ( not ( = ?auto_34358 ?auto_34367 ) ) ( not ( = ?auto_34359 ?auto_34367 ) ) ( not ( = ?auto_34365 ?auto_34367 ) ) ( not ( = ?auto_34379 ?auto_34361 ) ) ( not ( = ?auto_34376 ?auto_34379 ) ) ( HOIST-AT ?auto_34374 ?auto_34379 ) ( not ( = ?auto_34375 ?auto_34374 ) ) ( not ( = ?auto_34371 ?auto_34374 ) ) ( AVAILABLE ?auto_34374 ) ( SURFACE-AT ?auto_34359 ?auto_34379 ) ( ON ?auto_34359 ?auto_34366 ) ( CLEAR ?auto_34359 ) ( not ( = ?auto_34358 ?auto_34366 ) ) ( not ( = ?auto_34359 ?auto_34366 ) ) ( not ( = ?auto_34365 ?auto_34366 ) ) ( not ( = ?auto_34367 ?auto_34366 ) ) ( IS-CRATE ?auto_34367 ) ( not ( = ?auto_34358 ?auto_34378 ) ) ( not ( = ?auto_34359 ?auto_34378 ) ) ( not ( = ?auto_34365 ?auto_34378 ) ) ( not ( = ?auto_34367 ?auto_34378 ) ) ( not ( = ?auto_34366 ?auto_34378 ) ) ( AVAILABLE ?auto_34371 ) ( SURFACE-AT ?auto_34367 ?auto_34376 ) ( ON ?auto_34367 ?auto_34377 ) ( CLEAR ?auto_34367 ) ( not ( = ?auto_34358 ?auto_34377 ) ) ( not ( = ?auto_34359 ?auto_34377 ) ) ( not ( = ?auto_34365 ?auto_34377 ) ) ( not ( = ?auto_34367 ?auto_34377 ) ) ( not ( = ?auto_34366 ?auto_34377 ) ) ( not ( = ?auto_34378 ?auto_34377 ) ) ( IS-CRATE ?auto_34378 ) ( not ( = ?auto_34358 ?auto_34368 ) ) ( not ( = ?auto_34359 ?auto_34368 ) ) ( not ( = ?auto_34365 ?auto_34368 ) ) ( not ( = ?auto_34367 ?auto_34368 ) ) ( not ( = ?auto_34366 ?auto_34368 ) ) ( not ( = ?auto_34378 ?auto_34368 ) ) ( not ( = ?auto_34377 ?auto_34368 ) ) ( not ( = ?auto_34370 ?auto_34361 ) ) ( not ( = ?auto_34376 ?auto_34370 ) ) ( not ( = ?auto_34379 ?auto_34370 ) ) ( HOIST-AT ?auto_34373 ?auto_34370 ) ( not ( = ?auto_34375 ?auto_34373 ) ) ( not ( = ?auto_34371 ?auto_34373 ) ) ( not ( = ?auto_34374 ?auto_34373 ) ) ( AVAILABLE ?auto_34373 ) ( SURFACE-AT ?auto_34378 ?auto_34370 ) ( ON ?auto_34378 ?auto_34363 ) ( CLEAR ?auto_34378 ) ( not ( = ?auto_34358 ?auto_34363 ) ) ( not ( = ?auto_34359 ?auto_34363 ) ) ( not ( = ?auto_34365 ?auto_34363 ) ) ( not ( = ?auto_34367 ?auto_34363 ) ) ( not ( = ?auto_34366 ?auto_34363 ) ) ( not ( = ?auto_34378 ?auto_34363 ) ) ( not ( = ?auto_34377 ?auto_34363 ) ) ( not ( = ?auto_34368 ?auto_34363 ) ) ( IS-CRATE ?auto_34368 ) ( not ( = ?auto_34358 ?auto_34360 ) ) ( not ( = ?auto_34359 ?auto_34360 ) ) ( not ( = ?auto_34365 ?auto_34360 ) ) ( not ( = ?auto_34367 ?auto_34360 ) ) ( not ( = ?auto_34366 ?auto_34360 ) ) ( not ( = ?auto_34378 ?auto_34360 ) ) ( not ( = ?auto_34377 ?auto_34360 ) ) ( not ( = ?auto_34368 ?auto_34360 ) ) ( not ( = ?auto_34363 ?auto_34360 ) ) ( not ( = ?auto_34369 ?auto_34361 ) ) ( not ( = ?auto_34376 ?auto_34369 ) ) ( not ( = ?auto_34379 ?auto_34369 ) ) ( not ( = ?auto_34370 ?auto_34369 ) ) ( HOIST-AT ?auto_34364 ?auto_34369 ) ( not ( = ?auto_34375 ?auto_34364 ) ) ( not ( = ?auto_34371 ?auto_34364 ) ) ( not ( = ?auto_34374 ?auto_34364 ) ) ( not ( = ?auto_34373 ?auto_34364 ) ) ( AVAILABLE ?auto_34364 ) ( SURFACE-AT ?auto_34368 ?auto_34369 ) ( ON ?auto_34368 ?auto_34362 ) ( CLEAR ?auto_34368 ) ( not ( = ?auto_34358 ?auto_34362 ) ) ( not ( = ?auto_34359 ?auto_34362 ) ) ( not ( = ?auto_34365 ?auto_34362 ) ) ( not ( = ?auto_34367 ?auto_34362 ) ) ( not ( = ?auto_34366 ?auto_34362 ) ) ( not ( = ?auto_34378 ?auto_34362 ) ) ( not ( = ?auto_34377 ?auto_34362 ) ) ( not ( = ?auto_34368 ?auto_34362 ) ) ( not ( = ?auto_34363 ?auto_34362 ) ) ( not ( = ?auto_34360 ?auto_34362 ) ) ( TRUCK-AT ?auto_34372 ?auto_34361 ) ( SURFACE-AT ?auto_34380 ?auto_34361 ) ( CLEAR ?auto_34380 ) ( LIFTING ?auto_34375 ?auto_34360 ) ( IS-CRATE ?auto_34360 ) ( not ( = ?auto_34358 ?auto_34380 ) ) ( not ( = ?auto_34359 ?auto_34380 ) ) ( not ( = ?auto_34365 ?auto_34380 ) ) ( not ( = ?auto_34367 ?auto_34380 ) ) ( not ( = ?auto_34366 ?auto_34380 ) ) ( not ( = ?auto_34378 ?auto_34380 ) ) ( not ( = ?auto_34377 ?auto_34380 ) ) ( not ( = ?auto_34368 ?auto_34380 ) ) ( not ( = ?auto_34363 ?auto_34380 ) ) ( not ( = ?auto_34360 ?auto_34380 ) ) ( not ( = ?auto_34362 ?auto_34380 ) ) )
    :subtasks
    ( ( !DROP ?auto_34375 ?auto_34360 ?auto_34380 ?auto_34361 )
      ( MAKE-ON ?auto_34358 ?auto_34359 )
      ( MAKE-ON-VERIFY ?auto_34358 ?auto_34359 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34381 - SURFACE
      ?auto_34382 - SURFACE
    )
    :vars
    (
      ?auto_34393 - HOIST
      ?auto_34394 - PLACE
      ?auto_34383 - PLACE
      ?auto_34399 - HOIST
      ?auto_34391 - SURFACE
      ?auto_34390 - SURFACE
      ?auto_34389 - PLACE
      ?auto_34386 - HOIST
      ?auto_34387 - SURFACE
      ?auto_34385 - SURFACE
      ?auto_34384 - SURFACE
      ?auto_34398 - SURFACE
      ?auto_34402 - PLACE
      ?auto_34396 - HOIST
      ?auto_34397 - SURFACE
      ?auto_34400 - SURFACE
      ?auto_34403 - PLACE
      ?auto_34395 - HOIST
      ?auto_34401 - SURFACE
      ?auto_34392 - TRUCK
      ?auto_34388 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34393 ?auto_34394 ) ( IS-CRATE ?auto_34381 ) ( not ( = ?auto_34381 ?auto_34382 ) ) ( not ( = ?auto_34383 ?auto_34394 ) ) ( HOIST-AT ?auto_34399 ?auto_34383 ) ( not ( = ?auto_34393 ?auto_34399 ) ) ( SURFACE-AT ?auto_34381 ?auto_34383 ) ( ON ?auto_34381 ?auto_34391 ) ( CLEAR ?auto_34381 ) ( not ( = ?auto_34381 ?auto_34391 ) ) ( not ( = ?auto_34382 ?auto_34391 ) ) ( IS-CRATE ?auto_34382 ) ( not ( = ?auto_34381 ?auto_34390 ) ) ( not ( = ?auto_34382 ?auto_34390 ) ) ( not ( = ?auto_34391 ?auto_34390 ) ) ( not ( = ?auto_34389 ?auto_34394 ) ) ( not ( = ?auto_34383 ?auto_34389 ) ) ( HOIST-AT ?auto_34386 ?auto_34389 ) ( not ( = ?auto_34393 ?auto_34386 ) ) ( not ( = ?auto_34399 ?auto_34386 ) ) ( AVAILABLE ?auto_34386 ) ( SURFACE-AT ?auto_34382 ?auto_34389 ) ( ON ?auto_34382 ?auto_34387 ) ( CLEAR ?auto_34382 ) ( not ( = ?auto_34381 ?auto_34387 ) ) ( not ( = ?auto_34382 ?auto_34387 ) ) ( not ( = ?auto_34391 ?auto_34387 ) ) ( not ( = ?auto_34390 ?auto_34387 ) ) ( IS-CRATE ?auto_34390 ) ( not ( = ?auto_34381 ?auto_34385 ) ) ( not ( = ?auto_34382 ?auto_34385 ) ) ( not ( = ?auto_34391 ?auto_34385 ) ) ( not ( = ?auto_34390 ?auto_34385 ) ) ( not ( = ?auto_34387 ?auto_34385 ) ) ( AVAILABLE ?auto_34399 ) ( SURFACE-AT ?auto_34390 ?auto_34383 ) ( ON ?auto_34390 ?auto_34384 ) ( CLEAR ?auto_34390 ) ( not ( = ?auto_34381 ?auto_34384 ) ) ( not ( = ?auto_34382 ?auto_34384 ) ) ( not ( = ?auto_34391 ?auto_34384 ) ) ( not ( = ?auto_34390 ?auto_34384 ) ) ( not ( = ?auto_34387 ?auto_34384 ) ) ( not ( = ?auto_34385 ?auto_34384 ) ) ( IS-CRATE ?auto_34385 ) ( not ( = ?auto_34381 ?auto_34398 ) ) ( not ( = ?auto_34382 ?auto_34398 ) ) ( not ( = ?auto_34391 ?auto_34398 ) ) ( not ( = ?auto_34390 ?auto_34398 ) ) ( not ( = ?auto_34387 ?auto_34398 ) ) ( not ( = ?auto_34385 ?auto_34398 ) ) ( not ( = ?auto_34384 ?auto_34398 ) ) ( not ( = ?auto_34402 ?auto_34394 ) ) ( not ( = ?auto_34383 ?auto_34402 ) ) ( not ( = ?auto_34389 ?auto_34402 ) ) ( HOIST-AT ?auto_34396 ?auto_34402 ) ( not ( = ?auto_34393 ?auto_34396 ) ) ( not ( = ?auto_34399 ?auto_34396 ) ) ( not ( = ?auto_34386 ?auto_34396 ) ) ( AVAILABLE ?auto_34396 ) ( SURFACE-AT ?auto_34385 ?auto_34402 ) ( ON ?auto_34385 ?auto_34397 ) ( CLEAR ?auto_34385 ) ( not ( = ?auto_34381 ?auto_34397 ) ) ( not ( = ?auto_34382 ?auto_34397 ) ) ( not ( = ?auto_34391 ?auto_34397 ) ) ( not ( = ?auto_34390 ?auto_34397 ) ) ( not ( = ?auto_34387 ?auto_34397 ) ) ( not ( = ?auto_34385 ?auto_34397 ) ) ( not ( = ?auto_34384 ?auto_34397 ) ) ( not ( = ?auto_34398 ?auto_34397 ) ) ( IS-CRATE ?auto_34398 ) ( not ( = ?auto_34381 ?auto_34400 ) ) ( not ( = ?auto_34382 ?auto_34400 ) ) ( not ( = ?auto_34391 ?auto_34400 ) ) ( not ( = ?auto_34390 ?auto_34400 ) ) ( not ( = ?auto_34387 ?auto_34400 ) ) ( not ( = ?auto_34385 ?auto_34400 ) ) ( not ( = ?auto_34384 ?auto_34400 ) ) ( not ( = ?auto_34398 ?auto_34400 ) ) ( not ( = ?auto_34397 ?auto_34400 ) ) ( not ( = ?auto_34403 ?auto_34394 ) ) ( not ( = ?auto_34383 ?auto_34403 ) ) ( not ( = ?auto_34389 ?auto_34403 ) ) ( not ( = ?auto_34402 ?auto_34403 ) ) ( HOIST-AT ?auto_34395 ?auto_34403 ) ( not ( = ?auto_34393 ?auto_34395 ) ) ( not ( = ?auto_34399 ?auto_34395 ) ) ( not ( = ?auto_34386 ?auto_34395 ) ) ( not ( = ?auto_34396 ?auto_34395 ) ) ( AVAILABLE ?auto_34395 ) ( SURFACE-AT ?auto_34398 ?auto_34403 ) ( ON ?auto_34398 ?auto_34401 ) ( CLEAR ?auto_34398 ) ( not ( = ?auto_34381 ?auto_34401 ) ) ( not ( = ?auto_34382 ?auto_34401 ) ) ( not ( = ?auto_34391 ?auto_34401 ) ) ( not ( = ?auto_34390 ?auto_34401 ) ) ( not ( = ?auto_34387 ?auto_34401 ) ) ( not ( = ?auto_34385 ?auto_34401 ) ) ( not ( = ?auto_34384 ?auto_34401 ) ) ( not ( = ?auto_34398 ?auto_34401 ) ) ( not ( = ?auto_34397 ?auto_34401 ) ) ( not ( = ?auto_34400 ?auto_34401 ) ) ( TRUCK-AT ?auto_34392 ?auto_34394 ) ( SURFACE-AT ?auto_34388 ?auto_34394 ) ( CLEAR ?auto_34388 ) ( IS-CRATE ?auto_34400 ) ( not ( = ?auto_34381 ?auto_34388 ) ) ( not ( = ?auto_34382 ?auto_34388 ) ) ( not ( = ?auto_34391 ?auto_34388 ) ) ( not ( = ?auto_34390 ?auto_34388 ) ) ( not ( = ?auto_34387 ?auto_34388 ) ) ( not ( = ?auto_34385 ?auto_34388 ) ) ( not ( = ?auto_34384 ?auto_34388 ) ) ( not ( = ?auto_34398 ?auto_34388 ) ) ( not ( = ?auto_34397 ?auto_34388 ) ) ( not ( = ?auto_34400 ?auto_34388 ) ) ( not ( = ?auto_34401 ?auto_34388 ) ) ( AVAILABLE ?auto_34393 ) ( IN ?auto_34400 ?auto_34392 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34393 ?auto_34400 ?auto_34392 ?auto_34394 )
      ( MAKE-ON ?auto_34381 ?auto_34382 )
      ( MAKE-ON-VERIFY ?auto_34381 ?auto_34382 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34404 - SURFACE
      ?auto_34405 - SURFACE
    )
    :vars
    (
      ?auto_34426 - HOIST
      ?auto_34406 - PLACE
      ?auto_34411 - PLACE
      ?auto_34413 - HOIST
      ?auto_34423 - SURFACE
      ?auto_34409 - SURFACE
      ?auto_34422 - PLACE
      ?auto_34419 - HOIST
      ?auto_34407 - SURFACE
      ?auto_34424 - SURFACE
      ?auto_34425 - SURFACE
      ?auto_34418 - SURFACE
      ?auto_34416 - PLACE
      ?auto_34412 - HOIST
      ?auto_34420 - SURFACE
      ?auto_34414 - SURFACE
      ?auto_34417 - PLACE
      ?auto_34421 - HOIST
      ?auto_34415 - SURFACE
      ?auto_34408 - SURFACE
      ?auto_34410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34426 ?auto_34406 ) ( IS-CRATE ?auto_34404 ) ( not ( = ?auto_34404 ?auto_34405 ) ) ( not ( = ?auto_34411 ?auto_34406 ) ) ( HOIST-AT ?auto_34413 ?auto_34411 ) ( not ( = ?auto_34426 ?auto_34413 ) ) ( SURFACE-AT ?auto_34404 ?auto_34411 ) ( ON ?auto_34404 ?auto_34423 ) ( CLEAR ?auto_34404 ) ( not ( = ?auto_34404 ?auto_34423 ) ) ( not ( = ?auto_34405 ?auto_34423 ) ) ( IS-CRATE ?auto_34405 ) ( not ( = ?auto_34404 ?auto_34409 ) ) ( not ( = ?auto_34405 ?auto_34409 ) ) ( not ( = ?auto_34423 ?auto_34409 ) ) ( not ( = ?auto_34422 ?auto_34406 ) ) ( not ( = ?auto_34411 ?auto_34422 ) ) ( HOIST-AT ?auto_34419 ?auto_34422 ) ( not ( = ?auto_34426 ?auto_34419 ) ) ( not ( = ?auto_34413 ?auto_34419 ) ) ( AVAILABLE ?auto_34419 ) ( SURFACE-AT ?auto_34405 ?auto_34422 ) ( ON ?auto_34405 ?auto_34407 ) ( CLEAR ?auto_34405 ) ( not ( = ?auto_34404 ?auto_34407 ) ) ( not ( = ?auto_34405 ?auto_34407 ) ) ( not ( = ?auto_34423 ?auto_34407 ) ) ( not ( = ?auto_34409 ?auto_34407 ) ) ( IS-CRATE ?auto_34409 ) ( not ( = ?auto_34404 ?auto_34424 ) ) ( not ( = ?auto_34405 ?auto_34424 ) ) ( not ( = ?auto_34423 ?auto_34424 ) ) ( not ( = ?auto_34409 ?auto_34424 ) ) ( not ( = ?auto_34407 ?auto_34424 ) ) ( AVAILABLE ?auto_34413 ) ( SURFACE-AT ?auto_34409 ?auto_34411 ) ( ON ?auto_34409 ?auto_34425 ) ( CLEAR ?auto_34409 ) ( not ( = ?auto_34404 ?auto_34425 ) ) ( not ( = ?auto_34405 ?auto_34425 ) ) ( not ( = ?auto_34423 ?auto_34425 ) ) ( not ( = ?auto_34409 ?auto_34425 ) ) ( not ( = ?auto_34407 ?auto_34425 ) ) ( not ( = ?auto_34424 ?auto_34425 ) ) ( IS-CRATE ?auto_34424 ) ( not ( = ?auto_34404 ?auto_34418 ) ) ( not ( = ?auto_34405 ?auto_34418 ) ) ( not ( = ?auto_34423 ?auto_34418 ) ) ( not ( = ?auto_34409 ?auto_34418 ) ) ( not ( = ?auto_34407 ?auto_34418 ) ) ( not ( = ?auto_34424 ?auto_34418 ) ) ( not ( = ?auto_34425 ?auto_34418 ) ) ( not ( = ?auto_34416 ?auto_34406 ) ) ( not ( = ?auto_34411 ?auto_34416 ) ) ( not ( = ?auto_34422 ?auto_34416 ) ) ( HOIST-AT ?auto_34412 ?auto_34416 ) ( not ( = ?auto_34426 ?auto_34412 ) ) ( not ( = ?auto_34413 ?auto_34412 ) ) ( not ( = ?auto_34419 ?auto_34412 ) ) ( AVAILABLE ?auto_34412 ) ( SURFACE-AT ?auto_34424 ?auto_34416 ) ( ON ?auto_34424 ?auto_34420 ) ( CLEAR ?auto_34424 ) ( not ( = ?auto_34404 ?auto_34420 ) ) ( not ( = ?auto_34405 ?auto_34420 ) ) ( not ( = ?auto_34423 ?auto_34420 ) ) ( not ( = ?auto_34409 ?auto_34420 ) ) ( not ( = ?auto_34407 ?auto_34420 ) ) ( not ( = ?auto_34424 ?auto_34420 ) ) ( not ( = ?auto_34425 ?auto_34420 ) ) ( not ( = ?auto_34418 ?auto_34420 ) ) ( IS-CRATE ?auto_34418 ) ( not ( = ?auto_34404 ?auto_34414 ) ) ( not ( = ?auto_34405 ?auto_34414 ) ) ( not ( = ?auto_34423 ?auto_34414 ) ) ( not ( = ?auto_34409 ?auto_34414 ) ) ( not ( = ?auto_34407 ?auto_34414 ) ) ( not ( = ?auto_34424 ?auto_34414 ) ) ( not ( = ?auto_34425 ?auto_34414 ) ) ( not ( = ?auto_34418 ?auto_34414 ) ) ( not ( = ?auto_34420 ?auto_34414 ) ) ( not ( = ?auto_34417 ?auto_34406 ) ) ( not ( = ?auto_34411 ?auto_34417 ) ) ( not ( = ?auto_34422 ?auto_34417 ) ) ( not ( = ?auto_34416 ?auto_34417 ) ) ( HOIST-AT ?auto_34421 ?auto_34417 ) ( not ( = ?auto_34426 ?auto_34421 ) ) ( not ( = ?auto_34413 ?auto_34421 ) ) ( not ( = ?auto_34419 ?auto_34421 ) ) ( not ( = ?auto_34412 ?auto_34421 ) ) ( AVAILABLE ?auto_34421 ) ( SURFACE-AT ?auto_34418 ?auto_34417 ) ( ON ?auto_34418 ?auto_34415 ) ( CLEAR ?auto_34418 ) ( not ( = ?auto_34404 ?auto_34415 ) ) ( not ( = ?auto_34405 ?auto_34415 ) ) ( not ( = ?auto_34423 ?auto_34415 ) ) ( not ( = ?auto_34409 ?auto_34415 ) ) ( not ( = ?auto_34407 ?auto_34415 ) ) ( not ( = ?auto_34424 ?auto_34415 ) ) ( not ( = ?auto_34425 ?auto_34415 ) ) ( not ( = ?auto_34418 ?auto_34415 ) ) ( not ( = ?auto_34420 ?auto_34415 ) ) ( not ( = ?auto_34414 ?auto_34415 ) ) ( SURFACE-AT ?auto_34408 ?auto_34406 ) ( CLEAR ?auto_34408 ) ( IS-CRATE ?auto_34414 ) ( not ( = ?auto_34404 ?auto_34408 ) ) ( not ( = ?auto_34405 ?auto_34408 ) ) ( not ( = ?auto_34423 ?auto_34408 ) ) ( not ( = ?auto_34409 ?auto_34408 ) ) ( not ( = ?auto_34407 ?auto_34408 ) ) ( not ( = ?auto_34424 ?auto_34408 ) ) ( not ( = ?auto_34425 ?auto_34408 ) ) ( not ( = ?auto_34418 ?auto_34408 ) ) ( not ( = ?auto_34420 ?auto_34408 ) ) ( not ( = ?auto_34414 ?auto_34408 ) ) ( not ( = ?auto_34415 ?auto_34408 ) ) ( AVAILABLE ?auto_34426 ) ( IN ?auto_34414 ?auto_34410 ) ( TRUCK-AT ?auto_34410 ?auto_34416 ) )
    :subtasks
    ( ( !DRIVE ?auto_34410 ?auto_34416 ?auto_34406 )
      ( MAKE-ON ?auto_34404 ?auto_34405 )
      ( MAKE-ON-VERIFY ?auto_34404 ?auto_34405 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34427 - SURFACE
      ?auto_34428 - SURFACE
    )
    :vars
    (
      ?auto_34429 - HOIST
      ?auto_34430 - PLACE
      ?auto_34447 - PLACE
      ?auto_34435 - HOIST
      ?auto_34432 - SURFACE
      ?auto_34449 - SURFACE
      ?auto_34431 - PLACE
      ?auto_34441 - HOIST
      ?auto_34434 - SURFACE
      ?auto_34446 - SURFACE
      ?auto_34445 - SURFACE
      ?auto_34438 - SURFACE
      ?auto_34443 - PLACE
      ?auto_34440 - HOIST
      ?auto_34433 - SURFACE
      ?auto_34448 - SURFACE
      ?auto_34437 - PLACE
      ?auto_34444 - HOIST
      ?auto_34436 - SURFACE
      ?auto_34439 - SURFACE
      ?auto_34442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34429 ?auto_34430 ) ( IS-CRATE ?auto_34427 ) ( not ( = ?auto_34427 ?auto_34428 ) ) ( not ( = ?auto_34447 ?auto_34430 ) ) ( HOIST-AT ?auto_34435 ?auto_34447 ) ( not ( = ?auto_34429 ?auto_34435 ) ) ( SURFACE-AT ?auto_34427 ?auto_34447 ) ( ON ?auto_34427 ?auto_34432 ) ( CLEAR ?auto_34427 ) ( not ( = ?auto_34427 ?auto_34432 ) ) ( not ( = ?auto_34428 ?auto_34432 ) ) ( IS-CRATE ?auto_34428 ) ( not ( = ?auto_34427 ?auto_34449 ) ) ( not ( = ?auto_34428 ?auto_34449 ) ) ( not ( = ?auto_34432 ?auto_34449 ) ) ( not ( = ?auto_34431 ?auto_34430 ) ) ( not ( = ?auto_34447 ?auto_34431 ) ) ( HOIST-AT ?auto_34441 ?auto_34431 ) ( not ( = ?auto_34429 ?auto_34441 ) ) ( not ( = ?auto_34435 ?auto_34441 ) ) ( AVAILABLE ?auto_34441 ) ( SURFACE-AT ?auto_34428 ?auto_34431 ) ( ON ?auto_34428 ?auto_34434 ) ( CLEAR ?auto_34428 ) ( not ( = ?auto_34427 ?auto_34434 ) ) ( not ( = ?auto_34428 ?auto_34434 ) ) ( not ( = ?auto_34432 ?auto_34434 ) ) ( not ( = ?auto_34449 ?auto_34434 ) ) ( IS-CRATE ?auto_34449 ) ( not ( = ?auto_34427 ?auto_34446 ) ) ( not ( = ?auto_34428 ?auto_34446 ) ) ( not ( = ?auto_34432 ?auto_34446 ) ) ( not ( = ?auto_34449 ?auto_34446 ) ) ( not ( = ?auto_34434 ?auto_34446 ) ) ( AVAILABLE ?auto_34435 ) ( SURFACE-AT ?auto_34449 ?auto_34447 ) ( ON ?auto_34449 ?auto_34445 ) ( CLEAR ?auto_34449 ) ( not ( = ?auto_34427 ?auto_34445 ) ) ( not ( = ?auto_34428 ?auto_34445 ) ) ( not ( = ?auto_34432 ?auto_34445 ) ) ( not ( = ?auto_34449 ?auto_34445 ) ) ( not ( = ?auto_34434 ?auto_34445 ) ) ( not ( = ?auto_34446 ?auto_34445 ) ) ( IS-CRATE ?auto_34446 ) ( not ( = ?auto_34427 ?auto_34438 ) ) ( not ( = ?auto_34428 ?auto_34438 ) ) ( not ( = ?auto_34432 ?auto_34438 ) ) ( not ( = ?auto_34449 ?auto_34438 ) ) ( not ( = ?auto_34434 ?auto_34438 ) ) ( not ( = ?auto_34446 ?auto_34438 ) ) ( not ( = ?auto_34445 ?auto_34438 ) ) ( not ( = ?auto_34443 ?auto_34430 ) ) ( not ( = ?auto_34447 ?auto_34443 ) ) ( not ( = ?auto_34431 ?auto_34443 ) ) ( HOIST-AT ?auto_34440 ?auto_34443 ) ( not ( = ?auto_34429 ?auto_34440 ) ) ( not ( = ?auto_34435 ?auto_34440 ) ) ( not ( = ?auto_34441 ?auto_34440 ) ) ( SURFACE-AT ?auto_34446 ?auto_34443 ) ( ON ?auto_34446 ?auto_34433 ) ( CLEAR ?auto_34446 ) ( not ( = ?auto_34427 ?auto_34433 ) ) ( not ( = ?auto_34428 ?auto_34433 ) ) ( not ( = ?auto_34432 ?auto_34433 ) ) ( not ( = ?auto_34449 ?auto_34433 ) ) ( not ( = ?auto_34434 ?auto_34433 ) ) ( not ( = ?auto_34446 ?auto_34433 ) ) ( not ( = ?auto_34445 ?auto_34433 ) ) ( not ( = ?auto_34438 ?auto_34433 ) ) ( IS-CRATE ?auto_34438 ) ( not ( = ?auto_34427 ?auto_34448 ) ) ( not ( = ?auto_34428 ?auto_34448 ) ) ( not ( = ?auto_34432 ?auto_34448 ) ) ( not ( = ?auto_34449 ?auto_34448 ) ) ( not ( = ?auto_34434 ?auto_34448 ) ) ( not ( = ?auto_34446 ?auto_34448 ) ) ( not ( = ?auto_34445 ?auto_34448 ) ) ( not ( = ?auto_34438 ?auto_34448 ) ) ( not ( = ?auto_34433 ?auto_34448 ) ) ( not ( = ?auto_34437 ?auto_34430 ) ) ( not ( = ?auto_34447 ?auto_34437 ) ) ( not ( = ?auto_34431 ?auto_34437 ) ) ( not ( = ?auto_34443 ?auto_34437 ) ) ( HOIST-AT ?auto_34444 ?auto_34437 ) ( not ( = ?auto_34429 ?auto_34444 ) ) ( not ( = ?auto_34435 ?auto_34444 ) ) ( not ( = ?auto_34441 ?auto_34444 ) ) ( not ( = ?auto_34440 ?auto_34444 ) ) ( AVAILABLE ?auto_34444 ) ( SURFACE-AT ?auto_34438 ?auto_34437 ) ( ON ?auto_34438 ?auto_34436 ) ( CLEAR ?auto_34438 ) ( not ( = ?auto_34427 ?auto_34436 ) ) ( not ( = ?auto_34428 ?auto_34436 ) ) ( not ( = ?auto_34432 ?auto_34436 ) ) ( not ( = ?auto_34449 ?auto_34436 ) ) ( not ( = ?auto_34434 ?auto_34436 ) ) ( not ( = ?auto_34446 ?auto_34436 ) ) ( not ( = ?auto_34445 ?auto_34436 ) ) ( not ( = ?auto_34438 ?auto_34436 ) ) ( not ( = ?auto_34433 ?auto_34436 ) ) ( not ( = ?auto_34448 ?auto_34436 ) ) ( SURFACE-AT ?auto_34439 ?auto_34430 ) ( CLEAR ?auto_34439 ) ( IS-CRATE ?auto_34448 ) ( not ( = ?auto_34427 ?auto_34439 ) ) ( not ( = ?auto_34428 ?auto_34439 ) ) ( not ( = ?auto_34432 ?auto_34439 ) ) ( not ( = ?auto_34449 ?auto_34439 ) ) ( not ( = ?auto_34434 ?auto_34439 ) ) ( not ( = ?auto_34446 ?auto_34439 ) ) ( not ( = ?auto_34445 ?auto_34439 ) ) ( not ( = ?auto_34438 ?auto_34439 ) ) ( not ( = ?auto_34433 ?auto_34439 ) ) ( not ( = ?auto_34448 ?auto_34439 ) ) ( not ( = ?auto_34436 ?auto_34439 ) ) ( AVAILABLE ?auto_34429 ) ( TRUCK-AT ?auto_34442 ?auto_34443 ) ( LIFTING ?auto_34440 ?auto_34448 ) )
    :subtasks
    ( ( !LOAD ?auto_34440 ?auto_34448 ?auto_34442 ?auto_34443 )
      ( MAKE-ON ?auto_34427 ?auto_34428 )
      ( MAKE-ON-VERIFY ?auto_34427 ?auto_34428 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34450 - SURFACE
      ?auto_34451 - SURFACE
    )
    :vars
    (
      ?auto_34454 - HOIST
      ?auto_34459 - PLACE
      ?auto_34466 - PLACE
      ?auto_34467 - HOIST
      ?auto_34460 - SURFACE
      ?auto_34470 - SURFACE
      ?auto_34458 - PLACE
      ?auto_34462 - HOIST
      ?auto_34456 - SURFACE
      ?auto_34471 - SURFACE
      ?auto_34465 - SURFACE
      ?auto_34468 - SURFACE
      ?auto_34452 - PLACE
      ?auto_34463 - HOIST
      ?auto_34461 - SURFACE
      ?auto_34472 - SURFACE
      ?auto_34455 - PLACE
      ?auto_34453 - HOIST
      ?auto_34457 - SURFACE
      ?auto_34464 - SURFACE
      ?auto_34469 - TRUCK
      ?auto_34473 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34454 ?auto_34459 ) ( IS-CRATE ?auto_34450 ) ( not ( = ?auto_34450 ?auto_34451 ) ) ( not ( = ?auto_34466 ?auto_34459 ) ) ( HOIST-AT ?auto_34467 ?auto_34466 ) ( not ( = ?auto_34454 ?auto_34467 ) ) ( SURFACE-AT ?auto_34450 ?auto_34466 ) ( ON ?auto_34450 ?auto_34460 ) ( CLEAR ?auto_34450 ) ( not ( = ?auto_34450 ?auto_34460 ) ) ( not ( = ?auto_34451 ?auto_34460 ) ) ( IS-CRATE ?auto_34451 ) ( not ( = ?auto_34450 ?auto_34470 ) ) ( not ( = ?auto_34451 ?auto_34470 ) ) ( not ( = ?auto_34460 ?auto_34470 ) ) ( not ( = ?auto_34458 ?auto_34459 ) ) ( not ( = ?auto_34466 ?auto_34458 ) ) ( HOIST-AT ?auto_34462 ?auto_34458 ) ( not ( = ?auto_34454 ?auto_34462 ) ) ( not ( = ?auto_34467 ?auto_34462 ) ) ( AVAILABLE ?auto_34462 ) ( SURFACE-AT ?auto_34451 ?auto_34458 ) ( ON ?auto_34451 ?auto_34456 ) ( CLEAR ?auto_34451 ) ( not ( = ?auto_34450 ?auto_34456 ) ) ( not ( = ?auto_34451 ?auto_34456 ) ) ( not ( = ?auto_34460 ?auto_34456 ) ) ( not ( = ?auto_34470 ?auto_34456 ) ) ( IS-CRATE ?auto_34470 ) ( not ( = ?auto_34450 ?auto_34471 ) ) ( not ( = ?auto_34451 ?auto_34471 ) ) ( not ( = ?auto_34460 ?auto_34471 ) ) ( not ( = ?auto_34470 ?auto_34471 ) ) ( not ( = ?auto_34456 ?auto_34471 ) ) ( AVAILABLE ?auto_34467 ) ( SURFACE-AT ?auto_34470 ?auto_34466 ) ( ON ?auto_34470 ?auto_34465 ) ( CLEAR ?auto_34470 ) ( not ( = ?auto_34450 ?auto_34465 ) ) ( not ( = ?auto_34451 ?auto_34465 ) ) ( not ( = ?auto_34460 ?auto_34465 ) ) ( not ( = ?auto_34470 ?auto_34465 ) ) ( not ( = ?auto_34456 ?auto_34465 ) ) ( not ( = ?auto_34471 ?auto_34465 ) ) ( IS-CRATE ?auto_34471 ) ( not ( = ?auto_34450 ?auto_34468 ) ) ( not ( = ?auto_34451 ?auto_34468 ) ) ( not ( = ?auto_34460 ?auto_34468 ) ) ( not ( = ?auto_34470 ?auto_34468 ) ) ( not ( = ?auto_34456 ?auto_34468 ) ) ( not ( = ?auto_34471 ?auto_34468 ) ) ( not ( = ?auto_34465 ?auto_34468 ) ) ( not ( = ?auto_34452 ?auto_34459 ) ) ( not ( = ?auto_34466 ?auto_34452 ) ) ( not ( = ?auto_34458 ?auto_34452 ) ) ( HOIST-AT ?auto_34463 ?auto_34452 ) ( not ( = ?auto_34454 ?auto_34463 ) ) ( not ( = ?auto_34467 ?auto_34463 ) ) ( not ( = ?auto_34462 ?auto_34463 ) ) ( SURFACE-AT ?auto_34471 ?auto_34452 ) ( ON ?auto_34471 ?auto_34461 ) ( CLEAR ?auto_34471 ) ( not ( = ?auto_34450 ?auto_34461 ) ) ( not ( = ?auto_34451 ?auto_34461 ) ) ( not ( = ?auto_34460 ?auto_34461 ) ) ( not ( = ?auto_34470 ?auto_34461 ) ) ( not ( = ?auto_34456 ?auto_34461 ) ) ( not ( = ?auto_34471 ?auto_34461 ) ) ( not ( = ?auto_34465 ?auto_34461 ) ) ( not ( = ?auto_34468 ?auto_34461 ) ) ( IS-CRATE ?auto_34468 ) ( not ( = ?auto_34450 ?auto_34472 ) ) ( not ( = ?auto_34451 ?auto_34472 ) ) ( not ( = ?auto_34460 ?auto_34472 ) ) ( not ( = ?auto_34470 ?auto_34472 ) ) ( not ( = ?auto_34456 ?auto_34472 ) ) ( not ( = ?auto_34471 ?auto_34472 ) ) ( not ( = ?auto_34465 ?auto_34472 ) ) ( not ( = ?auto_34468 ?auto_34472 ) ) ( not ( = ?auto_34461 ?auto_34472 ) ) ( not ( = ?auto_34455 ?auto_34459 ) ) ( not ( = ?auto_34466 ?auto_34455 ) ) ( not ( = ?auto_34458 ?auto_34455 ) ) ( not ( = ?auto_34452 ?auto_34455 ) ) ( HOIST-AT ?auto_34453 ?auto_34455 ) ( not ( = ?auto_34454 ?auto_34453 ) ) ( not ( = ?auto_34467 ?auto_34453 ) ) ( not ( = ?auto_34462 ?auto_34453 ) ) ( not ( = ?auto_34463 ?auto_34453 ) ) ( AVAILABLE ?auto_34453 ) ( SURFACE-AT ?auto_34468 ?auto_34455 ) ( ON ?auto_34468 ?auto_34457 ) ( CLEAR ?auto_34468 ) ( not ( = ?auto_34450 ?auto_34457 ) ) ( not ( = ?auto_34451 ?auto_34457 ) ) ( not ( = ?auto_34460 ?auto_34457 ) ) ( not ( = ?auto_34470 ?auto_34457 ) ) ( not ( = ?auto_34456 ?auto_34457 ) ) ( not ( = ?auto_34471 ?auto_34457 ) ) ( not ( = ?auto_34465 ?auto_34457 ) ) ( not ( = ?auto_34468 ?auto_34457 ) ) ( not ( = ?auto_34461 ?auto_34457 ) ) ( not ( = ?auto_34472 ?auto_34457 ) ) ( SURFACE-AT ?auto_34464 ?auto_34459 ) ( CLEAR ?auto_34464 ) ( IS-CRATE ?auto_34472 ) ( not ( = ?auto_34450 ?auto_34464 ) ) ( not ( = ?auto_34451 ?auto_34464 ) ) ( not ( = ?auto_34460 ?auto_34464 ) ) ( not ( = ?auto_34470 ?auto_34464 ) ) ( not ( = ?auto_34456 ?auto_34464 ) ) ( not ( = ?auto_34471 ?auto_34464 ) ) ( not ( = ?auto_34465 ?auto_34464 ) ) ( not ( = ?auto_34468 ?auto_34464 ) ) ( not ( = ?auto_34461 ?auto_34464 ) ) ( not ( = ?auto_34472 ?auto_34464 ) ) ( not ( = ?auto_34457 ?auto_34464 ) ) ( AVAILABLE ?auto_34454 ) ( TRUCK-AT ?auto_34469 ?auto_34452 ) ( AVAILABLE ?auto_34463 ) ( SURFACE-AT ?auto_34472 ?auto_34452 ) ( ON ?auto_34472 ?auto_34473 ) ( CLEAR ?auto_34472 ) ( not ( = ?auto_34450 ?auto_34473 ) ) ( not ( = ?auto_34451 ?auto_34473 ) ) ( not ( = ?auto_34460 ?auto_34473 ) ) ( not ( = ?auto_34470 ?auto_34473 ) ) ( not ( = ?auto_34456 ?auto_34473 ) ) ( not ( = ?auto_34471 ?auto_34473 ) ) ( not ( = ?auto_34465 ?auto_34473 ) ) ( not ( = ?auto_34468 ?auto_34473 ) ) ( not ( = ?auto_34461 ?auto_34473 ) ) ( not ( = ?auto_34472 ?auto_34473 ) ) ( not ( = ?auto_34457 ?auto_34473 ) ) ( not ( = ?auto_34464 ?auto_34473 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34463 ?auto_34472 ?auto_34473 ?auto_34452 )
      ( MAKE-ON ?auto_34450 ?auto_34451 )
      ( MAKE-ON-VERIFY ?auto_34450 ?auto_34451 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34474 - SURFACE
      ?auto_34475 - SURFACE
    )
    :vars
    (
      ?auto_34487 - HOIST
      ?auto_34484 - PLACE
      ?auto_34491 - PLACE
      ?auto_34490 - HOIST
      ?auto_34493 - SURFACE
      ?auto_34492 - SURFACE
      ?auto_34476 - PLACE
      ?auto_34478 - HOIST
      ?auto_34482 - SURFACE
      ?auto_34483 - SURFACE
      ?auto_34481 - SURFACE
      ?auto_34497 - SURFACE
      ?auto_34488 - PLACE
      ?auto_34479 - HOIST
      ?auto_34489 - SURFACE
      ?auto_34494 - SURFACE
      ?auto_34485 - PLACE
      ?auto_34495 - HOIST
      ?auto_34477 - SURFACE
      ?auto_34480 - SURFACE
      ?auto_34486 - SURFACE
      ?auto_34496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34487 ?auto_34484 ) ( IS-CRATE ?auto_34474 ) ( not ( = ?auto_34474 ?auto_34475 ) ) ( not ( = ?auto_34491 ?auto_34484 ) ) ( HOIST-AT ?auto_34490 ?auto_34491 ) ( not ( = ?auto_34487 ?auto_34490 ) ) ( SURFACE-AT ?auto_34474 ?auto_34491 ) ( ON ?auto_34474 ?auto_34493 ) ( CLEAR ?auto_34474 ) ( not ( = ?auto_34474 ?auto_34493 ) ) ( not ( = ?auto_34475 ?auto_34493 ) ) ( IS-CRATE ?auto_34475 ) ( not ( = ?auto_34474 ?auto_34492 ) ) ( not ( = ?auto_34475 ?auto_34492 ) ) ( not ( = ?auto_34493 ?auto_34492 ) ) ( not ( = ?auto_34476 ?auto_34484 ) ) ( not ( = ?auto_34491 ?auto_34476 ) ) ( HOIST-AT ?auto_34478 ?auto_34476 ) ( not ( = ?auto_34487 ?auto_34478 ) ) ( not ( = ?auto_34490 ?auto_34478 ) ) ( AVAILABLE ?auto_34478 ) ( SURFACE-AT ?auto_34475 ?auto_34476 ) ( ON ?auto_34475 ?auto_34482 ) ( CLEAR ?auto_34475 ) ( not ( = ?auto_34474 ?auto_34482 ) ) ( not ( = ?auto_34475 ?auto_34482 ) ) ( not ( = ?auto_34493 ?auto_34482 ) ) ( not ( = ?auto_34492 ?auto_34482 ) ) ( IS-CRATE ?auto_34492 ) ( not ( = ?auto_34474 ?auto_34483 ) ) ( not ( = ?auto_34475 ?auto_34483 ) ) ( not ( = ?auto_34493 ?auto_34483 ) ) ( not ( = ?auto_34492 ?auto_34483 ) ) ( not ( = ?auto_34482 ?auto_34483 ) ) ( AVAILABLE ?auto_34490 ) ( SURFACE-AT ?auto_34492 ?auto_34491 ) ( ON ?auto_34492 ?auto_34481 ) ( CLEAR ?auto_34492 ) ( not ( = ?auto_34474 ?auto_34481 ) ) ( not ( = ?auto_34475 ?auto_34481 ) ) ( not ( = ?auto_34493 ?auto_34481 ) ) ( not ( = ?auto_34492 ?auto_34481 ) ) ( not ( = ?auto_34482 ?auto_34481 ) ) ( not ( = ?auto_34483 ?auto_34481 ) ) ( IS-CRATE ?auto_34483 ) ( not ( = ?auto_34474 ?auto_34497 ) ) ( not ( = ?auto_34475 ?auto_34497 ) ) ( not ( = ?auto_34493 ?auto_34497 ) ) ( not ( = ?auto_34492 ?auto_34497 ) ) ( not ( = ?auto_34482 ?auto_34497 ) ) ( not ( = ?auto_34483 ?auto_34497 ) ) ( not ( = ?auto_34481 ?auto_34497 ) ) ( not ( = ?auto_34488 ?auto_34484 ) ) ( not ( = ?auto_34491 ?auto_34488 ) ) ( not ( = ?auto_34476 ?auto_34488 ) ) ( HOIST-AT ?auto_34479 ?auto_34488 ) ( not ( = ?auto_34487 ?auto_34479 ) ) ( not ( = ?auto_34490 ?auto_34479 ) ) ( not ( = ?auto_34478 ?auto_34479 ) ) ( SURFACE-AT ?auto_34483 ?auto_34488 ) ( ON ?auto_34483 ?auto_34489 ) ( CLEAR ?auto_34483 ) ( not ( = ?auto_34474 ?auto_34489 ) ) ( not ( = ?auto_34475 ?auto_34489 ) ) ( not ( = ?auto_34493 ?auto_34489 ) ) ( not ( = ?auto_34492 ?auto_34489 ) ) ( not ( = ?auto_34482 ?auto_34489 ) ) ( not ( = ?auto_34483 ?auto_34489 ) ) ( not ( = ?auto_34481 ?auto_34489 ) ) ( not ( = ?auto_34497 ?auto_34489 ) ) ( IS-CRATE ?auto_34497 ) ( not ( = ?auto_34474 ?auto_34494 ) ) ( not ( = ?auto_34475 ?auto_34494 ) ) ( not ( = ?auto_34493 ?auto_34494 ) ) ( not ( = ?auto_34492 ?auto_34494 ) ) ( not ( = ?auto_34482 ?auto_34494 ) ) ( not ( = ?auto_34483 ?auto_34494 ) ) ( not ( = ?auto_34481 ?auto_34494 ) ) ( not ( = ?auto_34497 ?auto_34494 ) ) ( not ( = ?auto_34489 ?auto_34494 ) ) ( not ( = ?auto_34485 ?auto_34484 ) ) ( not ( = ?auto_34491 ?auto_34485 ) ) ( not ( = ?auto_34476 ?auto_34485 ) ) ( not ( = ?auto_34488 ?auto_34485 ) ) ( HOIST-AT ?auto_34495 ?auto_34485 ) ( not ( = ?auto_34487 ?auto_34495 ) ) ( not ( = ?auto_34490 ?auto_34495 ) ) ( not ( = ?auto_34478 ?auto_34495 ) ) ( not ( = ?auto_34479 ?auto_34495 ) ) ( AVAILABLE ?auto_34495 ) ( SURFACE-AT ?auto_34497 ?auto_34485 ) ( ON ?auto_34497 ?auto_34477 ) ( CLEAR ?auto_34497 ) ( not ( = ?auto_34474 ?auto_34477 ) ) ( not ( = ?auto_34475 ?auto_34477 ) ) ( not ( = ?auto_34493 ?auto_34477 ) ) ( not ( = ?auto_34492 ?auto_34477 ) ) ( not ( = ?auto_34482 ?auto_34477 ) ) ( not ( = ?auto_34483 ?auto_34477 ) ) ( not ( = ?auto_34481 ?auto_34477 ) ) ( not ( = ?auto_34497 ?auto_34477 ) ) ( not ( = ?auto_34489 ?auto_34477 ) ) ( not ( = ?auto_34494 ?auto_34477 ) ) ( SURFACE-AT ?auto_34480 ?auto_34484 ) ( CLEAR ?auto_34480 ) ( IS-CRATE ?auto_34494 ) ( not ( = ?auto_34474 ?auto_34480 ) ) ( not ( = ?auto_34475 ?auto_34480 ) ) ( not ( = ?auto_34493 ?auto_34480 ) ) ( not ( = ?auto_34492 ?auto_34480 ) ) ( not ( = ?auto_34482 ?auto_34480 ) ) ( not ( = ?auto_34483 ?auto_34480 ) ) ( not ( = ?auto_34481 ?auto_34480 ) ) ( not ( = ?auto_34497 ?auto_34480 ) ) ( not ( = ?auto_34489 ?auto_34480 ) ) ( not ( = ?auto_34494 ?auto_34480 ) ) ( not ( = ?auto_34477 ?auto_34480 ) ) ( AVAILABLE ?auto_34487 ) ( AVAILABLE ?auto_34479 ) ( SURFACE-AT ?auto_34494 ?auto_34488 ) ( ON ?auto_34494 ?auto_34486 ) ( CLEAR ?auto_34494 ) ( not ( = ?auto_34474 ?auto_34486 ) ) ( not ( = ?auto_34475 ?auto_34486 ) ) ( not ( = ?auto_34493 ?auto_34486 ) ) ( not ( = ?auto_34492 ?auto_34486 ) ) ( not ( = ?auto_34482 ?auto_34486 ) ) ( not ( = ?auto_34483 ?auto_34486 ) ) ( not ( = ?auto_34481 ?auto_34486 ) ) ( not ( = ?auto_34497 ?auto_34486 ) ) ( not ( = ?auto_34489 ?auto_34486 ) ) ( not ( = ?auto_34494 ?auto_34486 ) ) ( not ( = ?auto_34477 ?auto_34486 ) ) ( not ( = ?auto_34480 ?auto_34486 ) ) ( TRUCK-AT ?auto_34496 ?auto_34484 ) )
    :subtasks
    ( ( !DRIVE ?auto_34496 ?auto_34484 ?auto_34488 )
      ( MAKE-ON ?auto_34474 ?auto_34475 )
      ( MAKE-ON-VERIFY ?auto_34474 ?auto_34475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34500 - SURFACE
      ?auto_34501 - SURFACE
    )
    :vars
    (
      ?auto_34502 - HOIST
      ?auto_34503 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34502 ?auto_34503 ) ( SURFACE-AT ?auto_34501 ?auto_34503 ) ( CLEAR ?auto_34501 ) ( LIFTING ?auto_34502 ?auto_34500 ) ( IS-CRATE ?auto_34500 ) ( not ( = ?auto_34500 ?auto_34501 ) ) )
    :subtasks
    ( ( !DROP ?auto_34502 ?auto_34500 ?auto_34501 ?auto_34503 )
      ( MAKE-ON-VERIFY ?auto_34500 ?auto_34501 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34504 - SURFACE
      ?auto_34505 - SURFACE
    )
    :vars
    (
      ?auto_34507 - HOIST
      ?auto_34506 - PLACE
      ?auto_34508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34507 ?auto_34506 ) ( SURFACE-AT ?auto_34505 ?auto_34506 ) ( CLEAR ?auto_34505 ) ( IS-CRATE ?auto_34504 ) ( not ( = ?auto_34504 ?auto_34505 ) ) ( TRUCK-AT ?auto_34508 ?auto_34506 ) ( AVAILABLE ?auto_34507 ) ( IN ?auto_34504 ?auto_34508 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34507 ?auto_34504 ?auto_34508 ?auto_34506 )
      ( MAKE-ON ?auto_34504 ?auto_34505 )
      ( MAKE-ON-VERIFY ?auto_34504 ?auto_34505 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34509 - SURFACE
      ?auto_34510 - SURFACE
    )
    :vars
    (
      ?auto_34512 - HOIST
      ?auto_34513 - PLACE
      ?auto_34511 - TRUCK
      ?auto_34514 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34512 ?auto_34513 ) ( SURFACE-AT ?auto_34510 ?auto_34513 ) ( CLEAR ?auto_34510 ) ( IS-CRATE ?auto_34509 ) ( not ( = ?auto_34509 ?auto_34510 ) ) ( AVAILABLE ?auto_34512 ) ( IN ?auto_34509 ?auto_34511 ) ( TRUCK-AT ?auto_34511 ?auto_34514 ) ( not ( = ?auto_34514 ?auto_34513 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34511 ?auto_34514 ?auto_34513 )
      ( MAKE-ON ?auto_34509 ?auto_34510 )
      ( MAKE-ON-VERIFY ?auto_34509 ?auto_34510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34515 - SURFACE
      ?auto_34516 - SURFACE
    )
    :vars
    (
      ?auto_34518 - HOIST
      ?auto_34520 - PLACE
      ?auto_34519 - TRUCK
      ?auto_34517 - PLACE
      ?auto_34521 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34518 ?auto_34520 ) ( SURFACE-AT ?auto_34516 ?auto_34520 ) ( CLEAR ?auto_34516 ) ( IS-CRATE ?auto_34515 ) ( not ( = ?auto_34515 ?auto_34516 ) ) ( AVAILABLE ?auto_34518 ) ( TRUCK-AT ?auto_34519 ?auto_34517 ) ( not ( = ?auto_34517 ?auto_34520 ) ) ( HOIST-AT ?auto_34521 ?auto_34517 ) ( LIFTING ?auto_34521 ?auto_34515 ) ( not ( = ?auto_34518 ?auto_34521 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34521 ?auto_34515 ?auto_34519 ?auto_34517 )
      ( MAKE-ON ?auto_34515 ?auto_34516 )
      ( MAKE-ON-VERIFY ?auto_34515 ?auto_34516 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34522 - SURFACE
      ?auto_34523 - SURFACE
    )
    :vars
    (
      ?auto_34527 - HOIST
      ?auto_34528 - PLACE
      ?auto_34526 - TRUCK
      ?auto_34524 - PLACE
      ?auto_34525 - HOIST
      ?auto_34529 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34527 ?auto_34528 ) ( SURFACE-AT ?auto_34523 ?auto_34528 ) ( CLEAR ?auto_34523 ) ( IS-CRATE ?auto_34522 ) ( not ( = ?auto_34522 ?auto_34523 ) ) ( AVAILABLE ?auto_34527 ) ( TRUCK-AT ?auto_34526 ?auto_34524 ) ( not ( = ?auto_34524 ?auto_34528 ) ) ( HOIST-AT ?auto_34525 ?auto_34524 ) ( not ( = ?auto_34527 ?auto_34525 ) ) ( AVAILABLE ?auto_34525 ) ( SURFACE-AT ?auto_34522 ?auto_34524 ) ( ON ?auto_34522 ?auto_34529 ) ( CLEAR ?auto_34522 ) ( not ( = ?auto_34522 ?auto_34529 ) ) ( not ( = ?auto_34523 ?auto_34529 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34525 ?auto_34522 ?auto_34529 ?auto_34524 )
      ( MAKE-ON ?auto_34522 ?auto_34523 )
      ( MAKE-ON-VERIFY ?auto_34522 ?auto_34523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34530 - SURFACE
      ?auto_34531 - SURFACE
    )
    :vars
    (
      ?auto_34537 - HOIST
      ?auto_34533 - PLACE
      ?auto_34536 - PLACE
      ?auto_34535 - HOIST
      ?auto_34532 - SURFACE
      ?auto_34534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34537 ?auto_34533 ) ( SURFACE-AT ?auto_34531 ?auto_34533 ) ( CLEAR ?auto_34531 ) ( IS-CRATE ?auto_34530 ) ( not ( = ?auto_34530 ?auto_34531 ) ) ( AVAILABLE ?auto_34537 ) ( not ( = ?auto_34536 ?auto_34533 ) ) ( HOIST-AT ?auto_34535 ?auto_34536 ) ( not ( = ?auto_34537 ?auto_34535 ) ) ( AVAILABLE ?auto_34535 ) ( SURFACE-AT ?auto_34530 ?auto_34536 ) ( ON ?auto_34530 ?auto_34532 ) ( CLEAR ?auto_34530 ) ( not ( = ?auto_34530 ?auto_34532 ) ) ( not ( = ?auto_34531 ?auto_34532 ) ) ( TRUCK-AT ?auto_34534 ?auto_34533 ) )
    :subtasks
    ( ( !DRIVE ?auto_34534 ?auto_34533 ?auto_34536 )
      ( MAKE-ON ?auto_34530 ?auto_34531 )
      ( MAKE-ON-VERIFY ?auto_34530 ?auto_34531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34538 - SURFACE
      ?auto_34539 - SURFACE
    )
    :vars
    (
      ?auto_34545 - HOIST
      ?auto_34543 - PLACE
      ?auto_34544 - PLACE
      ?auto_34540 - HOIST
      ?auto_34541 - SURFACE
      ?auto_34542 - TRUCK
      ?auto_34546 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34545 ?auto_34543 ) ( IS-CRATE ?auto_34538 ) ( not ( = ?auto_34538 ?auto_34539 ) ) ( not ( = ?auto_34544 ?auto_34543 ) ) ( HOIST-AT ?auto_34540 ?auto_34544 ) ( not ( = ?auto_34545 ?auto_34540 ) ) ( AVAILABLE ?auto_34540 ) ( SURFACE-AT ?auto_34538 ?auto_34544 ) ( ON ?auto_34538 ?auto_34541 ) ( CLEAR ?auto_34538 ) ( not ( = ?auto_34538 ?auto_34541 ) ) ( not ( = ?auto_34539 ?auto_34541 ) ) ( TRUCK-AT ?auto_34542 ?auto_34543 ) ( SURFACE-AT ?auto_34546 ?auto_34543 ) ( CLEAR ?auto_34546 ) ( LIFTING ?auto_34545 ?auto_34539 ) ( IS-CRATE ?auto_34539 ) ( not ( = ?auto_34538 ?auto_34546 ) ) ( not ( = ?auto_34539 ?auto_34546 ) ) ( not ( = ?auto_34541 ?auto_34546 ) ) )
    :subtasks
    ( ( !DROP ?auto_34545 ?auto_34539 ?auto_34546 ?auto_34543 )
      ( MAKE-ON ?auto_34538 ?auto_34539 )
      ( MAKE-ON-VERIFY ?auto_34538 ?auto_34539 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34547 - SURFACE
      ?auto_34548 - SURFACE
    )
    :vars
    (
      ?auto_34552 - HOIST
      ?auto_34550 - PLACE
      ?auto_34549 - PLACE
      ?auto_34551 - HOIST
      ?auto_34553 - SURFACE
      ?auto_34554 - TRUCK
      ?auto_34555 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34552 ?auto_34550 ) ( IS-CRATE ?auto_34547 ) ( not ( = ?auto_34547 ?auto_34548 ) ) ( not ( = ?auto_34549 ?auto_34550 ) ) ( HOIST-AT ?auto_34551 ?auto_34549 ) ( not ( = ?auto_34552 ?auto_34551 ) ) ( AVAILABLE ?auto_34551 ) ( SURFACE-AT ?auto_34547 ?auto_34549 ) ( ON ?auto_34547 ?auto_34553 ) ( CLEAR ?auto_34547 ) ( not ( = ?auto_34547 ?auto_34553 ) ) ( not ( = ?auto_34548 ?auto_34553 ) ) ( TRUCK-AT ?auto_34554 ?auto_34550 ) ( SURFACE-AT ?auto_34555 ?auto_34550 ) ( CLEAR ?auto_34555 ) ( IS-CRATE ?auto_34548 ) ( not ( = ?auto_34547 ?auto_34555 ) ) ( not ( = ?auto_34548 ?auto_34555 ) ) ( not ( = ?auto_34553 ?auto_34555 ) ) ( AVAILABLE ?auto_34552 ) ( IN ?auto_34548 ?auto_34554 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34552 ?auto_34548 ?auto_34554 ?auto_34550 )
      ( MAKE-ON ?auto_34547 ?auto_34548 )
      ( MAKE-ON-VERIFY ?auto_34547 ?auto_34548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34556 - SURFACE
      ?auto_34557 - SURFACE
    )
    :vars
    (
      ?auto_34558 - HOIST
      ?auto_34560 - PLACE
      ?auto_34564 - PLACE
      ?auto_34563 - HOIST
      ?auto_34559 - SURFACE
      ?auto_34561 - SURFACE
      ?auto_34562 - TRUCK
      ?auto_34565 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34558 ?auto_34560 ) ( IS-CRATE ?auto_34556 ) ( not ( = ?auto_34556 ?auto_34557 ) ) ( not ( = ?auto_34564 ?auto_34560 ) ) ( HOIST-AT ?auto_34563 ?auto_34564 ) ( not ( = ?auto_34558 ?auto_34563 ) ) ( AVAILABLE ?auto_34563 ) ( SURFACE-AT ?auto_34556 ?auto_34564 ) ( ON ?auto_34556 ?auto_34559 ) ( CLEAR ?auto_34556 ) ( not ( = ?auto_34556 ?auto_34559 ) ) ( not ( = ?auto_34557 ?auto_34559 ) ) ( SURFACE-AT ?auto_34561 ?auto_34560 ) ( CLEAR ?auto_34561 ) ( IS-CRATE ?auto_34557 ) ( not ( = ?auto_34556 ?auto_34561 ) ) ( not ( = ?auto_34557 ?auto_34561 ) ) ( not ( = ?auto_34559 ?auto_34561 ) ) ( AVAILABLE ?auto_34558 ) ( IN ?auto_34557 ?auto_34562 ) ( TRUCK-AT ?auto_34562 ?auto_34565 ) ( not ( = ?auto_34565 ?auto_34560 ) ) ( not ( = ?auto_34564 ?auto_34565 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34562 ?auto_34565 ?auto_34560 )
      ( MAKE-ON ?auto_34556 ?auto_34557 )
      ( MAKE-ON-VERIFY ?auto_34556 ?auto_34557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34566 - SURFACE
      ?auto_34567 - SURFACE
    )
    :vars
    (
      ?auto_34572 - HOIST
      ?auto_34575 - PLACE
      ?auto_34573 - PLACE
      ?auto_34571 - HOIST
      ?auto_34570 - SURFACE
      ?auto_34574 - SURFACE
      ?auto_34568 - TRUCK
      ?auto_34569 - PLACE
      ?auto_34576 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34572 ?auto_34575 ) ( IS-CRATE ?auto_34566 ) ( not ( = ?auto_34566 ?auto_34567 ) ) ( not ( = ?auto_34573 ?auto_34575 ) ) ( HOIST-AT ?auto_34571 ?auto_34573 ) ( not ( = ?auto_34572 ?auto_34571 ) ) ( AVAILABLE ?auto_34571 ) ( SURFACE-AT ?auto_34566 ?auto_34573 ) ( ON ?auto_34566 ?auto_34570 ) ( CLEAR ?auto_34566 ) ( not ( = ?auto_34566 ?auto_34570 ) ) ( not ( = ?auto_34567 ?auto_34570 ) ) ( SURFACE-AT ?auto_34574 ?auto_34575 ) ( CLEAR ?auto_34574 ) ( IS-CRATE ?auto_34567 ) ( not ( = ?auto_34566 ?auto_34574 ) ) ( not ( = ?auto_34567 ?auto_34574 ) ) ( not ( = ?auto_34570 ?auto_34574 ) ) ( AVAILABLE ?auto_34572 ) ( TRUCK-AT ?auto_34568 ?auto_34569 ) ( not ( = ?auto_34569 ?auto_34575 ) ) ( not ( = ?auto_34573 ?auto_34569 ) ) ( HOIST-AT ?auto_34576 ?auto_34569 ) ( LIFTING ?auto_34576 ?auto_34567 ) ( not ( = ?auto_34572 ?auto_34576 ) ) ( not ( = ?auto_34571 ?auto_34576 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34576 ?auto_34567 ?auto_34568 ?auto_34569 )
      ( MAKE-ON ?auto_34566 ?auto_34567 )
      ( MAKE-ON-VERIFY ?auto_34566 ?auto_34567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34577 - SURFACE
      ?auto_34578 - SURFACE
    )
    :vars
    (
      ?auto_34584 - HOIST
      ?auto_34579 - PLACE
      ?auto_34580 - PLACE
      ?auto_34586 - HOIST
      ?auto_34587 - SURFACE
      ?auto_34581 - SURFACE
      ?auto_34583 - TRUCK
      ?auto_34585 - PLACE
      ?auto_34582 - HOIST
      ?auto_34588 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34584 ?auto_34579 ) ( IS-CRATE ?auto_34577 ) ( not ( = ?auto_34577 ?auto_34578 ) ) ( not ( = ?auto_34580 ?auto_34579 ) ) ( HOIST-AT ?auto_34586 ?auto_34580 ) ( not ( = ?auto_34584 ?auto_34586 ) ) ( AVAILABLE ?auto_34586 ) ( SURFACE-AT ?auto_34577 ?auto_34580 ) ( ON ?auto_34577 ?auto_34587 ) ( CLEAR ?auto_34577 ) ( not ( = ?auto_34577 ?auto_34587 ) ) ( not ( = ?auto_34578 ?auto_34587 ) ) ( SURFACE-AT ?auto_34581 ?auto_34579 ) ( CLEAR ?auto_34581 ) ( IS-CRATE ?auto_34578 ) ( not ( = ?auto_34577 ?auto_34581 ) ) ( not ( = ?auto_34578 ?auto_34581 ) ) ( not ( = ?auto_34587 ?auto_34581 ) ) ( AVAILABLE ?auto_34584 ) ( TRUCK-AT ?auto_34583 ?auto_34585 ) ( not ( = ?auto_34585 ?auto_34579 ) ) ( not ( = ?auto_34580 ?auto_34585 ) ) ( HOIST-AT ?auto_34582 ?auto_34585 ) ( not ( = ?auto_34584 ?auto_34582 ) ) ( not ( = ?auto_34586 ?auto_34582 ) ) ( AVAILABLE ?auto_34582 ) ( SURFACE-AT ?auto_34578 ?auto_34585 ) ( ON ?auto_34578 ?auto_34588 ) ( CLEAR ?auto_34578 ) ( not ( = ?auto_34577 ?auto_34588 ) ) ( not ( = ?auto_34578 ?auto_34588 ) ) ( not ( = ?auto_34587 ?auto_34588 ) ) ( not ( = ?auto_34581 ?auto_34588 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34582 ?auto_34578 ?auto_34588 ?auto_34585 )
      ( MAKE-ON ?auto_34577 ?auto_34578 )
      ( MAKE-ON-VERIFY ?auto_34577 ?auto_34578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34589 - SURFACE
      ?auto_34590 - SURFACE
    )
    :vars
    (
      ?auto_34596 - HOIST
      ?auto_34597 - PLACE
      ?auto_34593 - PLACE
      ?auto_34599 - HOIST
      ?auto_34591 - SURFACE
      ?auto_34594 - SURFACE
      ?auto_34600 - PLACE
      ?auto_34595 - HOIST
      ?auto_34592 - SURFACE
      ?auto_34598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34596 ?auto_34597 ) ( IS-CRATE ?auto_34589 ) ( not ( = ?auto_34589 ?auto_34590 ) ) ( not ( = ?auto_34593 ?auto_34597 ) ) ( HOIST-AT ?auto_34599 ?auto_34593 ) ( not ( = ?auto_34596 ?auto_34599 ) ) ( AVAILABLE ?auto_34599 ) ( SURFACE-AT ?auto_34589 ?auto_34593 ) ( ON ?auto_34589 ?auto_34591 ) ( CLEAR ?auto_34589 ) ( not ( = ?auto_34589 ?auto_34591 ) ) ( not ( = ?auto_34590 ?auto_34591 ) ) ( SURFACE-AT ?auto_34594 ?auto_34597 ) ( CLEAR ?auto_34594 ) ( IS-CRATE ?auto_34590 ) ( not ( = ?auto_34589 ?auto_34594 ) ) ( not ( = ?auto_34590 ?auto_34594 ) ) ( not ( = ?auto_34591 ?auto_34594 ) ) ( AVAILABLE ?auto_34596 ) ( not ( = ?auto_34600 ?auto_34597 ) ) ( not ( = ?auto_34593 ?auto_34600 ) ) ( HOIST-AT ?auto_34595 ?auto_34600 ) ( not ( = ?auto_34596 ?auto_34595 ) ) ( not ( = ?auto_34599 ?auto_34595 ) ) ( AVAILABLE ?auto_34595 ) ( SURFACE-AT ?auto_34590 ?auto_34600 ) ( ON ?auto_34590 ?auto_34592 ) ( CLEAR ?auto_34590 ) ( not ( = ?auto_34589 ?auto_34592 ) ) ( not ( = ?auto_34590 ?auto_34592 ) ) ( not ( = ?auto_34591 ?auto_34592 ) ) ( not ( = ?auto_34594 ?auto_34592 ) ) ( TRUCK-AT ?auto_34598 ?auto_34597 ) )
    :subtasks
    ( ( !DRIVE ?auto_34598 ?auto_34597 ?auto_34600 )
      ( MAKE-ON ?auto_34589 ?auto_34590 )
      ( MAKE-ON-VERIFY ?auto_34589 ?auto_34590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34601 - SURFACE
      ?auto_34602 - SURFACE
    )
    :vars
    (
      ?auto_34610 - HOIST
      ?auto_34606 - PLACE
      ?auto_34605 - PLACE
      ?auto_34603 - HOIST
      ?auto_34607 - SURFACE
      ?auto_34612 - SURFACE
      ?auto_34604 - PLACE
      ?auto_34608 - HOIST
      ?auto_34609 - SURFACE
      ?auto_34611 - TRUCK
      ?auto_34613 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34610 ?auto_34606 ) ( IS-CRATE ?auto_34601 ) ( not ( = ?auto_34601 ?auto_34602 ) ) ( not ( = ?auto_34605 ?auto_34606 ) ) ( HOIST-AT ?auto_34603 ?auto_34605 ) ( not ( = ?auto_34610 ?auto_34603 ) ) ( AVAILABLE ?auto_34603 ) ( SURFACE-AT ?auto_34601 ?auto_34605 ) ( ON ?auto_34601 ?auto_34607 ) ( CLEAR ?auto_34601 ) ( not ( = ?auto_34601 ?auto_34607 ) ) ( not ( = ?auto_34602 ?auto_34607 ) ) ( IS-CRATE ?auto_34602 ) ( not ( = ?auto_34601 ?auto_34612 ) ) ( not ( = ?auto_34602 ?auto_34612 ) ) ( not ( = ?auto_34607 ?auto_34612 ) ) ( not ( = ?auto_34604 ?auto_34606 ) ) ( not ( = ?auto_34605 ?auto_34604 ) ) ( HOIST-AT ?auto_34608 ?auto_34604 ) ( not ( = ?auto_34610 ?auto_34608 ) ) ( not ( = ?auto_34603 ?auto_34608 ) ) ( AVAILABLE ?auto_34608 ) ( SURFACE-AT ?auto_34602 ?auto_34604 ) ( ON ?auto_34602 ?auto_34609 ) ( CLEAR ?auto_34602 ) ( not ( = ?auto_34601 ?auto_34609 ) ) ( not ( = ?auto_34602 ?auto_34609 ) ) ( not ( = ?auto_34607 ?auto_34609 ) ) ( not ( = ?auto_34612 ?auto_34609 ) ) ( TRUCK-AT ?auto_34611 ?auto_34606 ) ( SURFACE-AT ?auto_34613 ?auto_34606 ) ( CLEAR ?auto_34613 ) ( LIFTING ?auto_34610 ?auto_34612 ) ( IS-CRATE ?auto_34612 ) ( not ( = ?auto_34601 ?auto_34613 ) ) ( not ( = ?auto_34602 ?auto_34613 ) ) ( not ( = ?auto_34607 ?auto_34613 ) ) ( not ( = ?auto_34612 ?auto_34613 ) ) ( not ( = ?auto_34609 ?auto_34613 ) ) )
    :subtasks
    ( ( !DROP ?auto_34610 ?auto_34612 ?auto_34613 ?auto_34606 )
      ( MAKE-ON ?auto_34601 ?auto_34602 )
      ( MAKE-ON-VERIFY ?auto_34601 ?auto_34602 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34614 - SURFACE
      ?auto_34615 - SURFACE
    )
    :vars
    (
      ?auto_34622 - HOIST
      ?auto_34617 - PLACE
      ?auto_34626 - PLACE
      ?auto_34624 - HOIST
      ?auto_34619 - SURFACE
      ?auto_34621 - SURFACE
      ?auto_34618 - PLACE
      ?auto_34616 - HOIST
      ?auto_34620 - SURFACE
      ?auto_34625 - TRUCK
      ?auto_34623 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34622 ?auto_34617 ) ( IS-CRATE ?auto_34614 ) ( not ( = ?auto_34614 ?auto_34615 ) ) ( not ( = ?auto_34626 ?auto_34617 ) ) ( HOIST-AT ?auto_34624 ?auto_34626 ) ( not ( = ?auto_34622 ?auto_34624 ) ) ( AVAILABLE ?auto_34624 ) ( SURFACE-AT ?auto_34614 ?auto_34626 ) ( ON ?auto_34614 ?auto_34619 ) ( CLEAR ?auto_34614 ) ( not ( = ?auto_34614 ?auto_34619 ) ) ( not ( = ?auto_34615 ?auto_34619 ) ) ( IS-CRATE ?auto_34615 ) ( not ( = ?auto_34614 ?auto_34621 ) ) ( not ( = ?auto_34615 ?auto_34621 ) ) ( not ( = ?auto_34619 ?auto_34621 ) ) ( not ( = ?auto_34618 ?auto_34617 ) ) ( not ( = ?auto_34626 ?auto_34618 ) ) ( HOIST-AT ?auto_34616 ?auto_34618 ) ( not ( = ?auto_34622 ?auto_34616 ) ) ( not ( = ?auto_34624 ?auto_34616 ) ) ( AVAILABLE ?auto_34616 ) ( SURFACE-AT ?auto_34615 ?auto_34618 ) ( ON ?auto_34615 ?auto_34620 ) ( CLEAR ?auto_34615 ) ( not ( = ?auto_34614 ?auto_34620 ) ) ( not ( = ?auto_34615 ?auto_34620 ) ) ( not ( = ?auto_34619 ?auto_34620 ) ) ( not ( = ?auto_34621 ?auto_34620 ) ) ( TRUCK-AT ?auto_34625 ?auto_34617 ) ( SURFACE-AT ?auto_34623 ?auto_34617 ) ( CLEAR ?auto_34623 ) ( IS-CRATE ?auto_34621 ) ( not ( = ?auto_34614 ?auto_34623 ) ) ( not ( = ?auto_34615 ?auto_34623 ) ) ( not ( = ?auto_34619 ?auto_34623 ) ) ( not ( = ?auto_34621 ?auto_34623 ) ) ( not ( = ?auto_34620 ?auto_34623 ) ) ( AVAILABLE ?auto_34622 ) ( IN ?auto_34621 ?auto_34625 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34622 ?auto_34621 ?auto_34625 ?auto_34617 )
      ( MAKE-ON ?auto_34614 ?auto_34615 )
      ( MAKE-ON-VERIFY ?auto_34614 ?auto_34615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34627 - SURFACE
      ?auto_34628 - SURFACE
    )
    :vars
    (
      ?auto_34633 - HOIST
      ?auto_34631 - PLACE
      ?auto_34637 - PLACE
      ?auto_34632 - HOIST
      ?auto_34638 - SURFACE
      ?auto_34636 - SURFACE
      ?auto_34630 - PLACE
      ?auto_34629 - HOIST
      ?auto_34639 - SURFACE
      ?auto_34635 - SURFACE
      ?auto_34634 - TRUCK
      ?auto_34640 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34633 ?auto_34631 ) ( IS-CRATE ?auto_34627 ) ( not ( = ?auto_34627 ?auto_34628 ) ) ( not ( = ?auto_34637 ?auto_34631 ) ) ( HOIST-AT ?auto_34632 ?auto_34637 ) ( not ( = ?auto_34633 ?auto_34632 ) ) ( AVAILABLE ?auto_34632 ) ( SURFACE-AT ?auto_34627 ?auto_34637 ) ( ON ?auto_34627 ?auto_34638 ) ( CLEAR ?auto_34627 ) ( not ( = ?auto_34627 ?auto_34638 ) ) ( not ( = ?auto_34628 ?auto_34638 ) ) ( IS-CRATE ?auto_34628 ) ( not ( = ?auto_34627 ?auto_34636 ) ) ( not ( = ?auto_34628 ?auto_34636 ) ) ( not ( = ?auto_34638 ?auto_34636 ) ) ( not ( = ?auto_34630 ?auto_34631 ) ) ( not ( = ?auto_34637 ?auto_34630 ) ) ( HOIST-AT ?auto_34629 ?auto_34630 ) ( not ( = ?auto_34633 ?auto_34629 ) ) ( not ( = ?auto_34632 ?auto_34629 ) ) ( AVAILABLE ?auto_34629 ) ( SURFACE-AT ?auto_34628 ?auto_34630 ) ( ON ?auto_34628 ?auto_34639 ) ( CLEAR ?auto_34628 ) ( not ( = ?auto_34627 ?auto_34639 ) ) ( not ( = ?auto_34628 ?auto_34639 ) ) ( not ( = ?auto_34638 ?auto_34639 ) ) ( not ( = ?auto_34636 ?auto_34639 ) ) ( SURFACE-AT ?auto_34635 ?auto_34631 ) ( CLEAR ?auto_34635 ) ( IS-CRATE ?auto_34636 ) ( not ( = ?auto_34627 ?auto_34635 ) ) ( not ( = ?auto_34628 ?auto_34635 ) ) ( not ( = ?auto_34638 ?auto_34635 ) ) ( not ( = ?auto_34636 ?auto_34635 ) ) ( not ( = ?auto_34639 ?auto_34635 ) ) ( AVAILABLE ?auto_34633 ) ( IN ?auto_34636 ?auto_34634 ) ( TRUCK-AT ?auto_34634 ?auto_34640 ) ( not ( = ?auto_34640 ?auto_34631 ) ) ( not ( = ?auto_34637 ?auto_34640 ) ) ( not ( = ?auto_34630 ?auto_34640 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34634 ?auto_34640 ?auto_34631 )
      ( MAKE-ON ?auto_34627 ?auto_34628 )
      ( MAKE-ON-VERIFY ?auto_34627 ?auto_34628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34641 - SURFACE
      ?auto_34642 - SURFACE
    )
    :vars
    (
      ?auto_34650 - HOIST
      ?auto_34654 - PLACE
      ?auto_34649 - PLACE
      ?auto_34646 - HOIST
      ?auto_34653 - SURFACE
      ?auto_34652 - SURFACE
      ?auto_34647 - PLACE
      ?auto_34644 - HOIST
      ?auto_34645 - SURFACE
      ?auto_34643 - SURFACE
      ?auto_34651 - TRUCK
      ?auto_34648 - PLACE
      ?auto_34655 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34650 ?auto_34654 ) ( IS-CRATE ?auto_34641 ) ( not ( = ?auto_34641 ?auto_34642 ) ) ( not ( = ?auto_34649 ?auto_34654 ) ) ( HOIST-AT ?auto_34646 ?auto_34649 ) ( not ( = ?auto_34650 ?auto_34646 ) ) ( AVAILABLE ?auto_34646 ) ( SURFACE-AT ?auto_34641 ?auto_34649 ) ( ON ?auto_34641 ?auto_34653 ) ( CLEAR ?auto_34641 ) ( not ( = ?auto_34641 ?auto_34653 ) ) ( not ( = ?auto_34642 ?auto_34653 ) ) ( IS-CRATE ?auto_34642 ) ( not ( = ?auto_34641 ?auto_34652 ) ) ( not ( = ?auto_34642 ?auto_34652 ) ) ( not ( = ?auto_34653 ?auto_34652 ) ) ( not ( = ?auto_34647 ?auto_34654 ) ) ( not ( = ?auto_34649 ?auto_34647 ) ) ( HOIST-AT ?auto_34644 ?auto_34647 ) ( not ( = ?auto_34650 ?auto_34644 ) ) ( not ( = ?auto_34646 ?auto_34644 ) ) ( AVAILABLE ?auto_34644 ) ( SURFACE-AT ?auto_34642 ?auto_34647 ) ( ON ?auto_34642 ?auto_34645 ) ( CLEAR ?auto_34642 ) ( not ( = ?auto_34641 ?auto_34645 ) ) ( not ( = ?auto_34642 ?auto_34645 ) ) ( not ( = ?auto_34653 ?auto_34645 ) ) ( not ( = ?auto_34652 ?auto_34645 ) ) ( SURFACE-AT ?auto_34643 ?auto_34654 ) ( CLEAR ?auto_34643 ) ( IS-CRATE ?auto_34652 ) ( not ( = ?auto_34641 ?auto_34643 ) ) ( not ( = ?auto_34642 ?auto_34643 ) ) ( not ( = ?auto_34653 ?auto_34643 ) ) ( not ( = ?auto_34652 ?auto_34643 ) ) ( not ( = ?auto_34645 ?auto_34643 ) ) ( AVAILABLE ?auto_34650 ) ( TRUCK-AT ?auto_34651 ?auto_34648 ) ( not ( = ?auto_34648 ?auto_34654 ) ) ( not ( = ?auto_34649 ?auto_34648 ) ) ( not ( = ?auto_34647 ?auto_34648 ) ) ( HOIST-AT ?auto_34655 ?auto_34648 ) ( LIFTING ?auto_34655 ?auto_34652 ) ( not ( = ?auto_34650 ?auto_34655 ) ) ( not ( = ?auto_34646 ?auto_34655 ) ) ( not ( = ?auto_34644 ?auto_34655 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34655 ?auto_34652 ?auto_34651 ?auto_34648 )
      ( MAKE-ON ?auto_34641 ?auto_34642 )
      ( MAKE-ON-VERIFY ?auto_34641 ?auto_34642 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34656 - SURFACE
      ?auto_34657 - SURFACE
    )
    :vars
    (
      ?auto_34660 - HOIST
      ?auto_34666 - PLACE
      ?auto_34659 - PLACE
      ?auto_34669 - HOIST
      ?auto_34668 - SURFACE
      ?auto_34663 - SURFACE
      ?auto_34667 - PLACE
      ?auto_34670 - HOIST
      ?auto_34664 - SURFACE
      ?auto_34665 - SURFACE
      ?auto_34661 - TRUCK
      ?auto_34662 - PLACE
      ?auto_34658 - HOIST
      ?auto_34671 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34660 ?auto_34666 ) ( IS-CRATE ?auto_34656 ) ( not ( = ?auto_34656 ?auto_34657 ) ) ( not ( = ?auto_34659 ?auto_34666 ) ) ( HOIST-AT ?auto_34669 ?auto_34659 ) ( not ( = ?auto_34660 ?auto_34669 ) ) ( AVAILABLE ?auto_34669 ) ( SURFACE-AT ?auto_34656 ?auto_34659 ) ( ON ?auto_34656 ?auto_34668 ) ( CLEAR ?auto_34656 ) ( not ( = ?auto_34656 ?auto_34668 ) ) ( not ( = ?auto_34657 ?auto_34668 ) ) ( IS-CRATE ?auto_34657 ) ( not ( = ?auto_34656 ?auto_34663 ) ) ( not ( = ?auto_34657 ?auto_34663 ) ) ( not ( = ?auto_34668 ?auto_34663 ) ) ( not ( = ?auto_34667 ?auto_34666 ) ) ( not ( = ?auto_34659 ?auto_34667 ) ) ( HOIST-AT ?auto_34670 ?auto_34667 ) ( not ( = ?auto_34660 ?auto_34670 ) ) ( not ( = ?auto_34669 ?auto_34670 ) ) ( AVAILABLE ?auto_34670 ) ( SURFACE-AT ?auto_34657 ?auto_34667 ) ( ON ?auto_34657 ?auto_34664 ) ( CLEAR ?auto_34657 ) ( not ( = ?auto_34656 ?auto_34664 ) ) ( not ( = ?auto_34657 ?auto_34664 ) ) ( not ( = ?auto_34668 ?auto_34664 ) ) ( not ( = ?auto_34663 ?auto_34664 ) ) ( SURFACE-AT ?auto_34665 ?auto_34666 ) ( CLEAR ?auto_34665 ) ( IS-CRATE ?auto_34663 ) ( not ( = ?auto_34656 ?auto_34665 ) ) ( not ( = ?auto_34657 ?auto_34665 ) ) ( not ( = ?auto_34668 ?auto_34665 ) ) ( not ( = ?auto_34663 ?auto_34665 ) ) ( not ( = ?auto_34664 ?auto_34665 ) ) ( AVAILABLE ?auto_34660 ) ( TRUCK-AT ?auto_34661 ?auto_34662 ) ( not ( = ?auto_34662 ?auto_34666 ) ) ( not ( = ?auto_34659 ?auto_34662 ) ) ( not ( = ?auto_34667 ?auto_34662 ) ) ( HOIST-AT ?auto_34658 ?auto_34662 ) ( not ( = ?auto_34660 ?auto_34658 ) ) ( not ( = ?auto_34669 ?auto_34658 ) ) ( not ( = ?auto_34670 ?auto_34658 ) ) ( AVAILABLE ?auto_34658 ) ( SURFACE-AT ?auto_34663 ?auto_34662 ) ( ON ?auto_34663 ?auto_34671 ) ( CLEAR ?auto_34663 ) ( not ( = ?auto_34656 ?auto_34671 ) ) ( not ( = ?auto_34657 ?auto_34671 ) ) ( not ( = ?auto_34668 ?auto_34671 ) ) ( not ( = ?auto_34663 ?auto_34671 ) ) ( not ( = ?auto_34664 ?auto_34671 ) ) ( not ( = ?auto_34665 ?auto_34671 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34658 ?auto_34663 ?auto_34671 ?auto_34662 )
      ( MAKE-ON ?auto_34656 ?auto_34657 )
      ( MAKE-ON-VERIFY ?auto_34656 ?auto_34657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34672 - SURFACE
      ?auto_34673 - SURFACE
    )
    :vars
    (
      ?auto_34680 - HOIST
      ?auto_34677 - PLACE
      ?auto_34686 - PLACE
      ?auto_34685 - HOIST
      ?auto_34675 - SURFACE
      ?auto_34679 - SURFACE
      ?auto_34687 - PLACE
      ?auto_34683 - HOIST
      ?auto_34682 - SURFACE
      ?auto_34681 - SURFACE
      ?auto_34674 - PLACE
      ?auto_34678 - HOIST
      ?auto_34684 - SURFACE
      ?auto_34676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34680 ?auto_34677 ) ( IS-CRATE ?auto_34672 ) ( not ( = ?auto_34672 ?auto_34673 ) ) ( not ( = ?auto_34686 ?auto_34677 ) ) ( HOIST-AT ?auto_34685 ?auto_34686 ) ( not ( = ?auto_34680 ?auto_34685 ) ) ( AVAILABLE ?auto_34685 ) ( SURFACE-AT ?auto_34672 ?auto_34686 ) ( ON ?auto_34672 ?auto_34675 ) ( CLEAR ?auto_34672 ) ( not ( = ?auto_34672 ?auto_34675 ) ) ( not ( = ?auto_34673 ?auto_34675 ) ) ( IS-CRATE ?auto_34673 ) ( not ( = ?auto_34672 ?auto_34679 ) ) ( not ( = ?auto_34673 ?auto_34679 ) ) ( not ( = ?auto_34675 ?auto_34679 ) ) ( not ( = ?auto_34687 ?auto_34677 ) ) ( not ( = ?auto_34686 ?auto_34687 ) ) ( HOIST-AT ?auto_34683 ?auto_34687 ) ( not ( = ?auto_34680 ?auto_34683 ) ) ( not ( = ?auto_34685 ?auto_34683 ) ) ( AVAILABLE ?auto_34683 ) ( SURFACE-AT ?auto_34673 ?auto_34687 ) ( ON ?auto_34673 ?auto_34682 ) ( CLEAR ?auto_34673 ) ( not ( = ?auto_34672 ?auto_34682 ) ) ( not ( = ?auto_34673 ?auto_34682 ) ) ( not ( = ?auto_34675 ?auto_34682 ) ) ( not ( = ?auto_34679 ?auto_34682 ) ) ( SURFACE-AT ?auto_34681 ?auto_34677 ) ( CLEAR ?auto_34681 ) ( IS-CRATE ?auto_34679 ) ( not ( = ?auto_34672 ?auto_34681 ) ) ( not ( = ?auto_34673 ?auto_34681 ) ) ( not ( = ?auto_34675 ?auto_34681 ) ) ( not ( = ?auto_34679 ?auto_34681 ) ) ( not ( = ?auto_34682 ?auto_34681 ) ) ( AVAILABLE ?auto_34680 ) ( not ( = ?auto_34674 ?auto_34677 ) ) ( not ( = ?auto_34686 ?auto_34674 ) ) ( not ( = ?auto_34687 ?auto_34674 ) ) ( HOIST-AT ?auto_34678 ?auto_34674 ) ( not ( = ?auto_34680 ?auto_34678 ) ) ( not ( = ?auto_34685 ?auto_34678 ) ) ( not ( = ?auto_34683 ?auto_34678 ) ) ( AVAILABLE ?auto_34678 ) ( SURFACE-AT ?auto_34679 ?auto_34674 ) ( ON ?auto_34679 ?auto_34684 ) ( CLEAR ?auto_34679 ) ( not ( = ?auto_34672 ?auto_34684 ) ) ( not ( = ?auto_34673 ?auto_34684 ) ) ( not ( = ?auto_34675 ?auto_34684 ) ) ( not ( = ?auto_34679 ?auto_34684 ) ) ( not ( = ?auto_34682 ?auto_34684 ) ) ( not ( = ?auto_34681 ?auto_34684 ) ) ( TRUCK-AT ?auto_34676 ?auto_34677 ) )
    :subtasks
    ( ( !DRIVE ?auto_34676 ?auto_34677 ?auto_34674 )
      ( MAKE-ON ?auto_34672 ?auto_34673 )
      ( MAKE-ON-VERIFY ?auto_34672 ?auto_34673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34688 - SURFACE
      ?auto_34689 - SURFACE
    )
    :vars
    (
      ?auto_34699 - HOIST
      ?auto_34701 - PLACE
      ?auto_34690 - PLACE
      ?auto_34697 - HOIST
      ?auto_34695 - SURFACE
      ?auto_34693 - SURFACE
      ?auto_34702 - PLACE
      ?auto_34692 - HOIST
      ?auto_34696 - SURFACE
      ?auto_34698 - SURFACE
      ?auto_34703 - PLACE
      ?auto_34691 - HOIST
      ?auto_34694 - SURFACE
      ?auto_34700 - TRUCK
      ?auto_34704 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34699 ?auto_34701 ) ( IS-CRATE ?auto_34688 ) ( not ( = ?auto_34688 ?auto_34689 ) ) ( not ( = ?auto_34690 ?auto_34701 ) ) ( HOIST-AT ?auto_34697 ?auto_34690 ) ( not ( = ?auto_34699 ?auto_34697 ) ) ( AVAILABLE ?auto_34697 ) ( SURFACE-AT ?auto_34688 ?auto_34690 ) ( ON ?auto_34688 ?auto_34695 ) ( CLEAR ?auto_34688 ) ( not ( = ?auto_34688 ?auto_34695 ) ) ( not ( = ?auto_34689 ?auto_34695 ) ) ( IS-CRATE ?auto_34689 ) ( not ( = ?auto_34688 ?auto_34693 ) ) ( not ( = ?auto_34689 ?auto_34693 ) ) ( not ( = ?auto_34695 ?auto_34693 ) ) ( not ( = ?auto_34702 ?auto_34701 ) ) ( not ( = ?auto_34690 ?auto_34702 ) ) ( HOIST-AT ?auto_34692 ?auto_34702 ) ( not ( = ?auto_34699 ?auto_34692 ) ) ( not ( = ?auto_34697 ?auto_34692 ) ) ( AVAILABLE ?auto_34692 ) ( SURFACE-AT ?auto_34689 ?auto_34702 ) ( ON ?auto_34689 ?auto_34696 ) ( CLEAR ?auto_34689 ) ( not ( = ?auto_34688 ?auto_34696 ) ) ( not ( = ?auto_34689 ?auto_34696 ) ) ( not ( = ?auto_34695 ?auto_34696 ) ) ( not ( = ?auto_34693 ?auto_34696 ) ) ( IS-CRATE ?auto_34693 ) ( not ( = ?auto_34688 ?auto_34698 ) ) ( not ( = ?auto_34689 ?auto_34698 ) ) ( not ( = ?auto_34695 ?auto_34698 ) ) ( not ( = ?auto_34693 ?auto_34698 ) ) ( not ( = ?auto_34696 ?auto_34698 ) ) ( not ( = ?auto_34703 ?auto_34701 ) ) ( not ( = ?auto_34690 ?auto_34703 ) ) ( not ( = ?auto_34702 ?auto_34703 ) ) ( HOIST-AT ?auto_34691 ?auto_34703 ) ( not ( = ?auto_34699 ?auto_34691 ) ) ( not ( = ?auto_34697 ?auto_34691 ) ) ( not ( = ?auto_34692 ?auto_34691 ) ) ( AVAILABLE ?auto_34691 ) ( SURFACE-AT ?auto_34693 ?auto_34703 ) ( ON ?auto_34693 ?auto_34694 ) ( CLEAR ?auto_34693 ) ( not ( = ?auto_34688 ?auto_34694 ) ) ( not ( = ?auto_34689 ?auto_34694 ) ) ( not ( = ?auto_34695 ?auto_34694 ) ) ( not ( = ?auto_34693 ?auto_34694 ) ) ( not ( = ?auto_34696 ?auto_34694 ) ) ( not ( = ?auto_34698 ?auto_34694 ) ) ( TRUCK-AT ?auto_34700 ?auto_34701 ) ( SURFACE-AT ?auto_34704 ?auto_34701 ) ( CLEAR ?auto_34704 ) ( LIFTING ?auto_34699 ?auto_34698 ) ( IS-CRATE ?auto_34698 ) ( not ( = ?auto_34688 ?auto_34704 ) ) ( not ( = ?auto_34689 ?auto_34704 ) ) ( not ( = ?auto_34695 ?auto_34704 ) ) ( not ( = ?auto_34693 ?auto_34704 ) ) ( not ( = ?auto_34696 ?auto_34704 ) ) ( not ( = ?auto_34698 ?auto_34704 ) ) ( not ( = ?auto_34694 ?auto_34704 ) ) )
    :subtasks
    ( ( !DROP ?auto_34699 ?auto_34698 ?auto_34704 ?auto_34701 )
      ( MAKE-ON ?auto_34688 ?auto_34689 )
      ( MAKE-ON-VERIFY ?auto_34688 ?auto_34689 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34705 - SURFACE
      ?auto_34706 - SURFACE
    )
    :vars
    (
      ?auto_34709 - HOIST
      ?auto_34721 - PLACE
      ?auto_34708 - PLACE
      ?auto_34713 - HOIST
      ?auto_34714 - SURFACE
      ?auto_34717 - SURFACE
      ?auto_34718 - PLACE
      ?auto_34707 - HOIST
      ?auto_34711 - SURFACE
      ?auto_34720 - SURFACE
      ?auto_34715 - PLACE
      ?auto_34716 - HOIST
      ?auto_34710 - SURFACE
      ?auto_34719 - TRUCK
      ?auto_34712 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34709 ?auto_34721 ) ( IS-CRATE ?auto_34705 ) ( not ( = ?auto_34705 ?auto_34706 ) ) ( not ( = ?auto_34708 ?auto_34721 ) ) ( HOIST-AT ?auto_34713 ?auto_34708 ) ( not ( = ?auto_34709 ?auto_34713 ) ) ( AVAILABLE ?auto_34713 ) ( SURFACE-AT ?auto_34705 ?auto_34708 ) ( ON ?auto_34705 ?auto_34714 ) ( CLEAR ?auto_34705 ) ( not ( = ?auto_34705 ?auto_34714 ) ) ( not ( = ?auto_34706 ?auto_34714 ) ) ( IS-CRATE ?auto_34706 ) ( not ( = ?auto_34705 ?auto_34717 ) ) ( not ( = ?auto_34706 ?auto_34717 ) ) ( not ( = ?auto_34714 ?auto_34717 ) ) ( not ( = ?auto_34718 ?auto_34721 ) ) ( not ( = ?auto_34708 ?auto_34718 ) ) ( HOIST-AT ?auto_34707 ?auto_34718 ) ( not ( = ?auto_34709 ?auto_34707 ) ) ( not ( = ?auto_34713 ?auto_34707 ) ) ( AVAILABLE ?auto_34707 ) ( SURFACE-AT ?auto_34706 ?auto_34718 ) ( ON ?auto_34706 ?auto_34711 ) ( CLEAR ?auto_34706 ) ( not ( = ?auto_34705 ?auto_34711 ) ) ( not ( = ?auto_34706 ?auto_34711 ) ) ( not ( = ?auto_34714 ?auto_34711 ) ) ( not ( = ?auto_34717 ?auto_34711 ) ) ( IS-CRATE ?auto_34717 ) ( not ( = ?auto_34705 ?auto_34720 ) ) ( not ( = ?auto_34706 ?auto_34720 ) ) ( not ( = ?auto_34714 ?auto_34720 ) ) ( not ( = ?auto_34717 ?auto_34720 ) ) ( not ( = ?auto_34711 ?auto_34720 ) ) ( not ( = ?auto_34715 ?auto_34721 ) ) ( not ( = ?auto_34708 ?auto_34715 ) ) ( not ( = ?auto_34718 ?auto_34715 ) ) ( HOIST-AT ?auto_34716 ?auto_34715 ) ( not ( = ?auto_34709 ?auto_34716 ) ) ( not ( = ?auto_34713 ?auto_34716 ) ) ( not ( = ?auto_34707 ?auto_34716 ) ) ( AVAILABLE ?auto_34716 ) ( SURFACE-AT ?auto_34717 ?auto_34715 ) ( ON ?auto_34717 ?auto_34710 ) ( CLEAR ?auto_34717 ) ( not ( = ?auto_34705 ?auto_34710 ) ) ( not ( = ?auto_34706 ?auto_34710 ) ) ( not ( = ?auto_34714 ?auto_34710 ) ) ( not ( = ?auto_34717 ?auto_34710 ) ) ( not ( = ?auto_34711 ?auto_34710 ) ) ( not ( = ?auto_34720 ?auto_34710 ) ) ( TRUCK-AT ?auto_34719 ?auto_34721 ) ( SURFACE-AT ?auto_34712 ?auto_34721 ) ( CLEAR ?auto_34712 ) ( IS-CRATE ?auto_34720 ) ( not ( = ?auto_34705 ?auto_34712 ) ) ( not ( = ?auto_34706 ?auto_34712 ) ) ( not ( = ?auto_34714 ?auto_34712 ) ) ( not ( = ?auto_34717 ?auto_34712 ) ) ( not ( = ?auto_34711 ?auto_34712 ) ) ( not ( = ?auto_34720 ?auto_34712 ) ) ( not ( = ?auto_34710 ?auto_34712 ) ) ( AVAILABLE ?auto_34709 ) ( IN ?auto_34720 ?auto_34719 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34709 ?auto_34720 ?auto_34719 ?auto_34721 )
      ( MAKE-ON ?auto_34705 ?auto_34706 )
      ( MAKE-ON-VERIFY ?auto_34705 ?auto_34706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34722 - SURFACE
      ?auto_34723 - SURFACE
    )
    :vars
    (
      ?auto_34737 - HOIST
      ?auto_34734 - PLACE
      ?auto_34727 - PLACE
      ?auto_34732 - HOIST
      ?auto_34724 - SURFACE
      ?auto_34729 - SURFACE
      ?auto_34733 - PLACE
      ?auto_34735 - HOIST
      ?auto_34730 - SURFACE
      ?auto_34728 - SURFACE
      ?auto_34731 - PLACE
      ?auto_34725 - HOIST
      ?auto_34736 - SURFACE
      ?auto_34738 - SURFACE
      ?auto_34726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34737 ?auto_34734 ) ( IS-CRATE ?auto_34722 ) ( not ( = ?auto_34722 ?auto_34723 ) ) ( not ( = ?auto_34727 ?auto_34734 ) ) ( HOIST-AT ?auto_34732 ?auto_34727 ) ( not ( = ?auto_34737 ?auto_34732 ) ) ( AVAILABLE ?auto_34732 ) ( SURFACE-AT ?auto_34722 ?auto_34727 ) ( ON ?auto_34722 ?auto_34724 ) ( CLEAR ?auto_34722 ) ( not ( = ?auto_34722 ?auto_34724 ) ) ( not ( = ?auto_34723 ?auto_34724 ) ) ( IS-CRATE ?auto_34723 ) ( not ( = ?auto_34722 ?auto_34729 ) ) ( not ( = ?auto_34723 ?auto_34729 ) ) ( not ( = ?auto_34724 ?auto_34729 ) ) ( not ( = ?auto_34733 ?auto_34734 ) ) ( not ( = ?auto_34727 ?auto_34733 ) ) ( HOIST-AT ?auto_34735 ?auto_34733 ) ( not ( = ?auto_34737 ?auto_34735 ) ) ( not ( = ?auto_34732 ?auto_34735 ) ) ( AVAILABLE ?auto_34735 ) ( SURFACE-AT ?auto_34723 ?auto_34733 ) ( ON ?auto_34723 ?auto_34730 ) ( CLEAR ?auto_34723 ) ( not ( = ?auto_34722 ?auto_34730 ) ) ( not ( = ?auto_34723 ?auto_34730 ) ) ( not ( = ?auto_34724 ?auto_34730 ) ) ( not ( = ?auto_34729 ?auto_34730 ) ) ( IS-CRATE ?auto_34729 ) ( not ( = ?auto_34722 ?auto_34728 ) ) ( not ( = ?auto_34723 ?auto_34728 ) ) ( not ( = ?auto_34724 ?auto_34728 ) ) ( not ( = ?auto_34729 ?auto_34728 ) ) ( not ( = ?auto_34730 ?auto_34728 ) ) ( not ( = ?auto_34731 ?auto_34734 ) ) ( not ( = ?auto_34727 ?auto_34731 ) ) ( not ( = ?auto_34733 ?auto_34731 ) ) ( HOIST-AT ?auto_34725 ?auto_34731 ) ( not ( = ?auto_34737 ?auto_34725 ) ) ( not ( = ?auto_34732 ?auto_34725 ) ) ( not ( = ?auto_34735 ?auto_34725 ) ) ( AVAILABLE ?auto_34725 ) ( SURFACE-AT ?auto_34729 ?auto_34731 ) ( ON ?auto_34729 ?auto_34736 ) ( CLEAR ?auto_34729 ) ( not ( = ?auto_34722 ?auto_34736 ) ) ( not ( = ?auto_34723 ?auto_34736 ) ) ( not ( = ?auto_34724 ?auto_34736 ) ) ( not ( = ?auto_34729 ?auto_34736 ) ) ( not ( = ?auto_34730 ?auto_34736 ) ) ( not ( = ?auto_34728 ?auto_34736 ) ) ( SURFACE-AT ?auto_34738 ?auto_34734 ) ( CLEAR ?auto_34738 ) ( IS-CRATE ?auto_34728 ) ( not ( = ?auto_34722 ?auto_34738 ) ) ( not ( = ?auto_34723 ?auto_34738 ) ) ( not ( = ?auto_34724 ?auto_34738 ) ) ( not ( = ?auto_34729 ?auto_34738 ) ) ( not ( = ?auto_34730 ?auto_34738 ) ) ( not ( = ?auto_34728 ?auto_34738 ) ) ( not ( = ?auto_34736 ?auto_34738 ) ) ( AVAILABLE ?auto_34737 ) ( IN ?auto_34728 ?auto_34726 ) ( TRUCK-AT ?auto_34726 ?auto_34733 ) )
    :subtasks
    ( ( !DRIVE ?auto_34726 ?auto_34733 ?auto_34734 )
      ( MAKE-ON ?auto_34722 ?auto_34723 )
      ( MAKE-ON-VERIFY ?auto_34722 ?auto_34723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34739 - SURFACE
      ?auto_34740 - SURFACE
    )
    :vars
    (
      ?auto_34755 - HOIST
      ?auto_34744 - PLACE
      ?auto_34745 - PLACE
      ?auto_34753 - HOIST
      ?auto_34741 - SURFACE
      ?auto_34751 - SURFACE
      ?auto_34748 - PLACE
      ?auto_34750 - HOIST
      ?auto_34746 - SURFACE
      ?auto_34749 - SURFACE
      ?auto_34754 - PLACE
      ?auto_34742 - HOIST
      ?auto_34747 - SURFACE
      ?auto_34752 - SURFACE
      ?auto_34743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34755 ?auto_34744 ) ( IS-CRATE ?auto_34739 ) ( not ( = ?auto_34739 ?auto_34740 ) ) ( not ( = ?auto_34745 ?auto_34744 ) ) ( HOIST-AT ?auto_34753 ?auto_34745 ) ( not ( = ?auto_34755 ?auto_34753 ) ) ( AVAILABLE ?auto_34753 ) ( SURFACE-AT ?auto_34739 ?auto_34745 ) ( ON ?auto_34739 ?auto_34741 ) ( CLEAR ?auto_34739 ) ( not ( = ?auto_34739 ?auto_34741 ) ) ( not ( = ?auto_34740 ?auto_34741 ) ) ( IS-CRATE ?auto_34740 ) ( not ( = ?auto_34739 ?auto_34751 ) ) ( not ( = ?auto_34740 ?auto_34751 ) ) ( not ( = ?auto_34741 ?auto_34751 ) ) ( not ( = ?auto_34748 ?auto_34744 ) ) ( not ( = ?auto_34745 ?auto_34748 ) ) ( HOIST-AT ?auto_34750 ?auto_34748 ) ( not ( = ?auto_34755 ?auto_34750 ) ) ( not ( = ?auto_34753 ?auto_34750 ) ) ( SURFACE-AT ?auto_34740 ?auto_34748 ) ( ON ?auto_34740 ?auto_34746 ) ( CLEAR ?auto_34740 ) ( not ( = ?auto_34739 ?auto_34746 ) ) ( not ( = ?auto_34740 ?auto_34746 ) ) ( not ( = ?auto_34741 ?auto_34746 ) ) ( not ( = ?auto_34751 ?auto_34746 ) ) ( IS-CRATE ?auto_34751 ) ( not ( = ?auto_34739 ?auto_34749 ) ) ( not ( = ?auto_34740 ?auto_34749 ) ) ( not ( = ?auto_34741 ?auto_34749 ) ) ( not ( = ?auto_34751 ?auto_34749 ) ) ( not ( = ?auto_34746 ?auto_34749 ) ) ( not ( = ?auto_34754 ?auto_34744 ) ) ( not ( = ?auto_34745 ?auto_34754 ) ) ( not ( = ?auto_34748 ?auto_34754 ) ) ( HOIST-AT ?auto_34742 ?auto_34754 ) ( not ( = ?auto_34755 ?auto_34742 ) ) ( not ( = ?auto_34753 ?auto_34742 ) ) ( not ( = ?auto_34750 ?auto_34742 ) ) ( AVAILABLE ?auto_34742 ) ( SURFACE-AT ?auto_34751 ?auto_34754 ) ( ON ?auto_34751 ?auto_34747 ) ( CLEAR ?auto_34751 ) ( not ( = ?auto_34739 ?auto_34747 ) ) ( not ( = ?auto_34740 ?auto_34747 ) ) ( not ( = ?auto_34741 ?auto_34747 ) ) ( not ( = ?auto_34751 ?auto_34747 ) ) ( not ( = ?auto_34746 ?auto_34747 ) ) ( not ( = ?auto_34749 ?auto_34747 ) ) ( SURFACE-AT ?auto_34752 ?auto_34744 ) ( CLEAR ?auto_34752 ) ( IS-CRATE ?auto_34749 ) ( not ( = ?auto_34739 ?auto_34752 ) ) ( not ( = ?auto_34740 ?auto_34752 ) ) ( not ( = ?auto_34741 ?auto_34752 ) ) ( not ( = ?auto_34751 ?auto_34752 ) ) ( not ( = ?auto_34746 ?auto_34752 ) ) ( not ( = ?auto_34749 ?auto_34752 ) ) ( not ( = ?auto_34747 ?auto_34752 ) ) ( AVAILABLE ?auto_34755 ) ( TRUCK-AT ?auto_34743 ?auto_34748 ) ( LIFTING ?auto_34750 ?auto_34749 ) )
    :subtasks
    ( ( !LOAD ?auto_34750 ?auto_34749 ?auto_34743 ?auto_34748 )
      ( MAKE-ON ?auto_34739 ?auto_34740 )
      ( MAKE-ON-VERIFY ?auto_34739 ?auto_34740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34756 - SURFACE
      ?auto_34757 - SURFACE
    )
    :vars
    (
      ?auto_34764 - HOIST
      ?auto_34767 - PLACE
      ?auto_34763 - PLACE
      ?auto_34760 - HOIST
      ?auto_34766 - SURFACE
      ?auto_34772 - SURFACE
      ?auto_34771 - PLACE
      ?auto_34758 - HOIST
      ?auto_34765 - SURFACE
      ?auto_34761 - SURFACE
      ?auto_34762 - PLACE
      ?auto_34769 - HOIST
      ?auto_34768 - SURFACE
      ?auto_34759 - SURFACE
      ?auto_34770 - TRUCK
      ?auto_34773 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34764 ?auto_34767 ) ( IS-CRATE ?auto_34756 ) ( not ( = ?auto_34756 ?auto_34757 ) ) ( not ( = ?auto_34763 ?auto_34767 ) ) ( HOIST-AT ?auto_34760 ?auto_34763 ) ( not ( = ?auto_34764 ?auto_34760 ) ) ( AVAILABLE ?auto_34760 ) ( SURFACE-AT ?auto_34756 ?auto_34763 ) ( ON ?auto_34756 ?auto_34766 ) ( CLEAR ?auto_34756 ) ( not ( = ?auto_34756 ?auto_34766 ) ) ( not ( = ?auto_34757 ?auto_34766 ) ) ( IS-CRATE ?auto_34757 ) ( not ( = ?auto_34756 ?auto_34772 ) ) ( not ( = ?auto_34757 ?auto_34772 ) ) ( not ( = ?auto_34766 ?auto_34772 ) ) ( not ( = ?auto_34771 ?auto_34767 ) ) ( not ( = ?auto_34763 ?auto_34771 ) ) ( HOIST-AT ?auto_34758 ?auto_34771 ) ( not ( = ?auto_34764 ?auto_34758 ) ) ( not ( = ?auto_34760 ?auto_34758 ) ) ( SURFACE-AT ?auto_34757 ?auto_34771 ) ( ON ?auto_34757 ?auto_34765 ) ( CLEAR ?auto_34757 ) ( not ( = ?auto_34756 ?auto_34765 ) ) ( not ( = ?auto_34757 ?auto_34765 ) ) ( not ( = ?auto_34766 ?auto_34765 ) ) ( not ( = ?auto_34772 ?auto_34765 ) ) ( IS-CRATE ?auto_34772 ) ( not ( = ?auto_34756 ?auto_34761 ) ) ( not ( = ?auto_34757 ?auto_34761 ) ) ( not ( = ?auto_34766 ?auto_34761 ) ) ( not ( = ?auto_34772 ?auto_34761 ) ) ( not ( = ?auto_34765 ?auto_34761 ) ) ( not ( = ?auto_34762 ?auto_34767 ) ) ( not ( = ?auto_34763 ?auto_34762 ) ) ( not ( = ?auto_34771 ?auto_34762 ) ) ( HOIST-AT ?auto_34769 ?auto_34762 ) ( not ( = ?auto_34764 ?auto_34769 ) ) ( not ( = ?auto_34760 ?auto_34769 ) ) ( not ( = ?auto_34758 ?auto_34769 ) ) ( AVAILABLE ?auto_34769 ) ( SURFACE-AT ?auto_34772 ?auto_34762 ) ( ON ?auto_34772 ?auto_34768 ) ( CLEAR ?auto_34772 ) ( not ( = ?auto_34756 ?auto_34768 ) ) ( not ( = ?auto_34757 ?auto_34768 ) ) ( not ( = ?auto_34766 ?auto_34768 ) ) ( not ( = ?auto_34772 ?auto_34768 ) ) ( not ( = ?auto_34765 ?auto_34768 ) ) ( not ( = ?auto_34761 ?auto_34768 ) ) ( SURFACE-AT ?auto_34759 ?auto_34767 ) ( CLEAR ?auto_34759 ) ( IS-CRATE ?auto_34761 ) ( not ( = ?auto_34756 ?auto_34759 ) ) ( not ( = ?auto_34757 ?auto_34759 ) ) ( not ( = ?auto_34766 ?auto_34759 ) ) ( not ( = ?auto_34772 ?auto_34759 ) ) ( not ( = ?auto_34765 ?auto_34759 ) ) ( not ( = ?auto_34761 ?auto_34759 ) ) ( not ( = ?auto_34768 ?auto_34759 ) ) ( AVAILABLE ?auto_34764 ) ( TRUCK-AT ?auto_34770 ?auto_34771 ) ( AVAILABLE ?auto_34758 ) ( SURFACE-AT ?auto_34761 ?auto_34771 ) ( ON ?auto_34761 ?auto_34773 ) ( CLEAR ?auto_34761 ) ( not ( = ?auto_34756 ?auto_34773 ) ) ( not ( = ?auto_34757 ?auto_34773 ) ) ( not ( = ?auto_34766 ?auto_34773 ) ) ( not ( = ?auto_34772 ?auto_34773 ) ) ( not ( = ?auto_34765 ?auto_34773 ) ) ( not ( = ?auto_34761 ?auto_34773 ) ) ( not ( = ?auto_34768 ?auto_34773 ) ) ( not ( = ?auto_34759 ?auto_34773 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34758 ?auto_34761 ?auto_34773 ?auto_34771 )
      ( MAKE-ON ?auto_34756 ?auto_34757 )
      ( MAKE-ON-VERIFY ?auto_34756 ?auto_34757 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34774 - SURFACE
      ?auto_34775 - SURFACE
    )
    :vars
    (
      ?auto_34790 - HOIST
      ?auto_34791 - PLACE
      ?auto_34779 - PLACE
      ?auto_34781 - HOIST
      ?auto_34789 - SURFACE
      ?auto_34788 - SURFACE
      ?auto_34784 - PLACE
      ?auto_34786 - HOIST
      ?auto_34780 - SURFACE
      ?auto_34777 - SURFACE
      ?auto_34778 - PLACE
      ?auto_34782 - HOIST
      ?auto_34785 - SURFACE
      ?auto_34776 - SURFACE
      ?auto_34787 - SURFACE
      ?auto_34783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34790 ?auto_34791 ) ( IS-CRATE ?auto_34774 ) ( not ( = ?auto_34774 ?auto_34775 ) ) ( not ( = ?auto_34779 ?auto_34791 ) ) ( HOIST-AT ?auto_34781 ?auto_34779 ) ( not ( = ?auto_34790 ?auto_34781 ) ) ( AVAILABLE ?auto_34781 ) ( SURFACE-AT ?auto_34774 ?auto_34779 ) ( ON ?auto_34774 ?auto_34789 ) ( CLEAR ?auto_34774 ) ( not ( = ?auto_34774 ?auto_34789 ) ) ( not ( = ?auto_34775 ?auto_34789 ) ) ( IS-CRATE ?auto_34775 ) ( not ( = ?auto_34774 ?auto_34788 ) ) ( not ( = ?auto_34775 ?auto_34788 ) ) ( not ( = ?auto_34789 ?auto_34788 ) ) ( not ( = ?auto_34784 ?auto_34791 ) ) ( not ( = ?auto_34779 ?auto_34784 ) ) ( HOIST-AT ?auto_34786 ?auto_34784 ) ( not ( = ?auto_34790 ?auto_34786 ) ) ( not ( = ?auto_34781 ?auto_34786 ) ) ( SURFACE-AT ?auto_34775 ?auto_34784 ) ( ON ?auto_34775 ?auto_34780 ) ( CLEAR ?auto_34775 ) ( not ( = ?auto_34774 ?auto_34780 ) ) ( not ( = ?auto_34775 ?auto_34780 ) ) ( not ( = ?auto_34789 ?auto_34780 ) ) ( not ( = ?auto_34788 ?auto_34780 ) ) ( IS-CRATE ?auto_34788 ) ( not ( = ?auto_34774 ?auto_34777 ) ) ( not ( = ?auto_34775 ?auto_34777 ) ) ( not ( = ?auto_34789 ?auto_34777 ) ) ( not ( = ?auto_34788 ?auto_34777 ) ) ( not ( = ?auto_34780 ?auto_34777 ) ) ( not ( = ?auto_34778 ?auto_34791 ) ) ( not ( = ?auto_34779 ?auto_34778 ) ) ( not ( = ?auto_34784 ?auto_34778 ) ) ( HOIST-AT ?auto_34782 ?auto_34778 ) ( not ( = ?auto_34790 ?auto_34782 ) ) ( not ( = ?auto_34781 ?auto_34782 ) ) ( not ( = ?auto_34786 ?auto_34782 ) ) ( AVAILABLE ?auto_34782 ) ( SURFACE-AT ?auto_34788 ?auto_34778 ) ( ON ?auto_34788 ?auto_34785 ) ( CLEAR ?auto_34788 ) ( not ( = ?auto_34774 ?auto_34785 ) ) ( not ( = ?auto_34775 ?auto_34785 ) ) ( not ( = ?auto_34789 ?auto_34785 ) ) ( not ( = ?auto_34788 ?auto_34785 ) ) ( not ( = ?auto_34780 ?auto_34785 ) ) ( not ( = ?auto_34777 ?auto_34785 ) ) ( SURFACE-AT ?auto_34776 ?auto_34791 ) ( CLEAR ?auto_34776 ) ( IS-CRATE ?auto_34777 ) ( not ( = ?auto_34774 ?auto_34776 ) ) ( not ( = ?auto_34775 ?auto_34776 ) ) ( not ( = ?auto_34789 ?auto_34776 ) ) ( not ( = ?auto_34788 ?auto_34776 ) ) ( not ( = ?auto_34780 ?auto_34776 ) ) ( not ( = ?auto_34777 ?auto_34776 ) ) ( not ( = ?auto_34785 ?auto_34776 ) ) ( AVAILABLE ?auto_34790 ) ( AVAILABLE ?auto_34786 ) ( SURFACE-AT ?auto_34777 ?auto_34784 ) ( ON ?auto_34777 ?auto_34787 ) ( CLEAR ?auto_34777 ) ( not ( = ?auto_34774 ?auto_34787 ) ) ( not ( = ?auto_34775 ?auto_34787 ) ) ( not ( = ?auto_34789 ?auto_34787 ) ) ( not ( = ?auto_34788 ?auto_34787 ) ) ( not ( = ?auto_34780 ?auto_34787 ) ) ( not ( = ?auto_34777 ?auto_34787 ) ) ( not ( = ?auto_34785 ?auto_34787 ) ) ( not ( = ?auto_34776 ?auto_34787 ) ) ( TRUCK-AT ?auto_34783 ?auto_34791 ) )
    :subtasks
    ( ( !DRIVE ?auto_34783 ?auto_34791 ?auto_34784 )
      ( MAKE-ON ?auto_34774 ?auto_34775 )
      ( MAKE-ON-VERIFY ?auto_34774 ?auto_34775 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34792 - SURFACE
      ?auto_34793 - SURFACE
    )
    :vars
    (
      ?auto_34799 - HOIST
      ?auto_34797 - PLACE
      ?auto_34801 - PLACE
      ?auto_34806 - HOIST
      ?auto_34803 - SURFACE
      ?auto_34796 - SURFACE
      ?auto_34809 - PLACE
      ?auto_34800 - HOIST
      ?auto_34807 - SURFACE
      ?auto_34808 - SURFACE
      ?auto_34802 - PLACE
      ?auto_34804 - HOIST
      ?auto_34798 - SURFACE
      ?auto_34805 - SURFACE
      ?auto_34794 - SURFACE
      ?auto_34795 - TRUCK
      ?auto_34810 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34799 ?auto_34797 ) ( IS-CRATE ?auto_34792 ) ( not ( = ?auto_34792 ?auto_34793 ) ) ( not ( = ?auto_34801 ?auto_34797 ) ) ( HOIST-AT ?auto_34806 ?auto_34801 ) ( not ( = ?auto_34799 ?auto_34806 ) ) ( AVAILABLE ?auto_34806 ) ( SURFACE-AT ?auto_34792 ?auto_34801 ) ( ON ?auto_34792 ?auto_34803 ) ( CLEAR ?auto_34792 ) ( not ( = ?auto_34792 ?auto_34803 ) ) ( not ( = ?auto_34793 ?auto_34803 ) ) ( IS-CRATE ?auto_34793 ) ( not ( = ?auto_34792 ?auto_34796 ) ) ( not ( = ?auto_34793 ?auto_34796 ) ) ( not ( = ?auto_34803 ?auto_34796 ) ) ( not ( = ?auto_34809 ?auto_34797 ) ) ( not ( = ?auto_34801 ?auto_34809 ) ) ( HOIST-AT ?auto_34800 ?auto_34809 ) ( not ( = ?auto_34799 ?auto_34800 ) ) ( not ( = ?auto_34806 ?auto_34800 ) ) ( SURFACE-AT ?auto_34793 ?auto_34809 ) ( ON ?auto_34793 ?auto_34807 ) ( CLEAR ?auto_34793 ) ( not ( = ?auto_34792 ?auto_34807 ) ) ( not ( = ?auto_34793 ?auto_34807 ) ) ( not ( = ?auto_34803 ?auto_34807 ) ) ( not ( = ?auto_34796 ?auto_34807 ) ) ( IS-CRATE ?auto_34796 ) ( not ( = ?auto_34792 ?auto_34808 ) ) ( not ( = ?auto_34793 ?auto_34808 ) ) ( not ( = ?auto_34803 ?auto_34808 ) ) ( not ( = ?auto_34796 ?auto_34808 ) ) ( not ( = ?auto_34807 ?auto_34808 ) ) ( not ( = ?auto_34802 ?auto_34797 ) ) ( not ( = ?auto_34801 ?auto_34802 ) ) ( not ( = ?auto_34809 ?auto_34802 ) ) ( HOIST-AT ?auto_34804 ?auto_34802 ) ( not ( = ?auto_34799 ?auto_34804 ) ) ( not ( = ?auto_34806 ?auto_34804 ) ) ( not ( = ?auto_34800 ?auto_34804 ) ) ( AVAILABLE ?auto_34804 ) ( SURFACE-AT ?auto_34796 ?auto_34802 ) ( ON ?auto_34796 ?auto_34798 ) ( CLEAR ?auto_34796 ) ( not ( = ?auto_34792 ?auto_34798 ) ) ( not ( = ?auto_34793 ?auto_34798 ) ) ( not ( = ?auto_34803 ?auto_34798 ) ) ( not ( = ?auto_34796 ?auto_34798 ) ) ( not ( = ?auto_34807 ?auto_34798 ) ) ( not ( = ?auto_34808 ?auto_34798 ) ) ( IS-CRATE ?auto_34808 ) ( not ( = ?auto_34792 ?auto_34805 ) ) ( not ( = ?auto_34793 ?auto_34805 ) ) ( not ( = ?auto_34803 ?auto_34805 ) ) ( not ( = ?auto_34796 ?auto_34805 ) ) ( not ( = ?auto_34807 ?auto_34805 ) ) ( not ( = ?auto_34808 ?auto_34805 ) ) ( not ( = ?auto_34798 ?auto_34805 ) ) ( AVAILABLE ?auto_34800 ) ( SURFACE-AT ?auto_34808 ?auto_34809 ) ( ON ?auto_34808 ?auto_34794 ) ( CLEAR ?auto_34808 ) ( not ( = ?auto_34792 ?auto_34794 ) ) ( not ( = ?auto_34793 ?auto_34794 ) ) ( not ( = ?auto_34803 ?auto_34794 ) ) ( not ( = ?auto_34796 ?auto_34794 ) ) ( not ( = ?auto_34807 ?auto_34794 ) ) ( not ( = ?auto_34808 ?auto_34794 ) ) ( not ( = ?auto_34798 ?auto_34794 ) ) ( not ( = ?auto_34805 ?auto_34794 ) ) ( TRUCK-AT ?auto_34795 ?auto_34797 ) ( SURFACE-AT ?auto_34810 ?auto_34797 ) ( CLEAR ?auto_34810 ) ( LIFTING ?auto_34799 ?auto_34805 ) ( IS-CRATE ?auto_34805 ) ( not ( = ?auto_34792 ?auto_34810 ) ) ( not ( = ?auto_34793 ?auto_34810 ) ) ( not ( = ?auto_34803 ?auto_34810 ) ) ( not ( = ?auto_34796 ?auto_34810 ) ) ( not ( = ?auto_34807 ?auto_34810 ) ) ( not ( = ?auto_34808 ?auto_34810 ) ) ( not ( = ?auto_34798 ?auto_34810 ) ) ( not ( = ?auto_34805 ?auto_34810 ) ) ( not ( = ?auto_34794 ?auto_34810 ) ) )
    :subtasks
    ( ( !DROP ?auto_34799 ?auto_34805 ?auto_34810 ?auto_34797 )
      ( MAKE-ON ?auto_34792 ?auto_34793 )
      ( MAKE-ON-VERIFY ?auto_34792 ?auto_34793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34811 - SURFACE
      ?auto_34812 - SURFACE
    )
    :vars
    (
      ?auto_34813 - HOIST
      ?auto_34815 - PLACE
      ?auto_34828 - PLACE
      ?auto_34822 - HOIST
      ?auto_34820 - SURFACE
      ?auto_34819 - SURFACE
      ?auto_34816 - PLACE
      ?auto_34817 - HOIST
      ?auto_34827 - SURFACE
      ?auto_34821 - SURFACE
      ?auto_34824 - PLACE
      ?auto_34826 - HOIST
      ?auto_34814 - SURFACE
      ?auto_34829 - SURFACE
      ?auto_34825 - SURFACE
      ?auto_34818 - TRUCK
      ?auto_34823 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34813 ?auto_34815 ) ( IS-CRATE ?auto_34811 ) ( not ( = ?auto_34811 ?auto_34812 ) ) ( not ( = ?auto_34828 ?auto_34815 ) ) ( HOIST-AT ?auto_34822 ?auto_34828 ) ( not ( = ?auto_34813 ?auto_34822 ) ) ( AVAILABLE ?auto_34822 ) ( SURFACE-AT ?auto_34811 ?auto_34828 ) ( ON ?auto_34811 ?auto_34820 ) ( CLEAR ?auto_34811 ) ( not ( = ?auto_34811 ?auto_34820 ) ) ( not ( = ?auto_34812 ?auto_34820 ) ) ( IS-CRATE ?auto_34812 ) ( not ( = ?auto_34811 ?auto_34819 ) ) ( not ( = ?auto_34812 ?auto_34819 ) ) ( not ( = ?auto_34820 ?auto_34819 ) ) ( not ( = ?auto_34816 ?auto_34815 ) ) ( not ( = ?auto_34828 ?auto_34816 ) ) ( HOIST-AT ?auto_34817 ?auto_34816 ) ( not ( = ?auto_34813 ?auto_34817 ) ) ( not ( = ?auto_34822 ?auto_34817 ) ) ( SURFACE-AT ?auto_34812 ?auto_34816 ) ( ON ?auto_34812 ?auto_34827 ) ( CLEAR ?auto_34812 ) ( not ( = ?auto_34811 ?auto_34827 ) ) ( not ( = ?auto_34812 ?auto_34827 ) ) ( not ( = ?auto_34820 ?auto_34827 ) ) ( not ( = ?auto_34819 ?auto_34827 ) ) ( IS-CRATE ?auto_34819 ) ( not ( = ?auto_34811 ?auto_34821 ) ) ( not ( = ?auto_34812 ?auto_34821 ) ) ( not ( = ?auto_34820 ?auto_34821 ) ) ( not ( = ?auto_34819 ?auto_34821 ) ) ( not ( = ?auto_34827 ?auto_34821 ) ) ( not ( = ?auto_34824 ?auto_34815 ) ) ( not ( = ?auto_34828 ?auto_34824 ) ) ( not ( = ?auto_34816 ?auto_34824 ) ) ( HOIST-AT ?auto_34826 ?auto_34824 ) ( not ( = ?auto_34813 ?auto_34826 ) ) ( not ( = ?auto_34822 ?auto_34826 ) ) ( not ( = ?auto_34817 ?auto_34826 ) ) ( AVAILABLE ?auto_34826 ) ( SURFACE-AT ?auto_34819 ?auto_34824 ) ( ON ?auto_34819 ?auto_34814 ) ( CLEAR ?auto_34819 ) ( not ( = ?auto_34811 ?auto_34814 ) ) ( not ( = ?auto_34812 ?auto_34814 ) ) ( not ( = ?auto_34820 ?auto_34814 ) ) ( not ( = ?auto_34819 ?auto_34814 ) ) ( not ( = ?auto_34827 ?auto_34814 ) ) ( not ( = ?auto_34821 ?auto_34814 ) ) ( IS-CRATE ?auto_34821 ) ( not ( = ?auto_34811 ?auto_34829 ) ) ( not ( = ?auto_34812 ?auto_34829 ) ) ( not ( = ?auto_34820 ?auto_34829 ) ) ( not ( = ?auto_34819 ?auto_34829 ) ) ( not ( = ?auto_34827 ?auto_34829 ) ) ( not ( = ?auto_34821 ?auto_34829 ) ) ( not ( = ?auto_34814 ?auto_34829 ) ) ( AVAILABLE ?auto_34817 ) ( SURFACE-AT ?auto_34821 ?auto_34816 ) ( ON ?auto_34821 ?auto_34825 ) ( CLEAR ?auto_34821 ) ( not ( = ?auto_34811 ?auto_34825 ) ) ( not ( = ?auto_34812 ?auto_34825 ) ) ( not ( = ?auto_34820 ?auto_34825 ) ) ( not ( = ?auto_34819 ?auto_34825 ) ) ( not ( = ?auto_34827 ?auto_34825 ) ) ( not ( = ?auto_34821 ?auto_34825 ) ) ( not ( = ?auto_34814 ?auto_34825 ) ) ( not ( = ?auto_34829 ?auto_34825 ) ) ( TRUCK-AT ?auto_34818 ?auto_34815 ) ( SURFACE-AT ?auto_34823 ?auto_34815 ) ( CLEAR ?auto_34823 ) ( IS-CRATE ?auto_34829 ) ( not ( = ?auto_34811 ?auto_34823 ) ) ( not ( = ?auto_34812 ?auto_34823 ) ) ( not ( = ?auto_34820 ?auto_34823 ) ) ( not ( = ?auto_34819 ?auto_34823 ) ) ( not ( = ?auto_34827 ?auto_34823 ) ) ( not ( = ?auto_34821 ?auto_34823 ) ) ( not ( = ?auto_34814 ?auto_34823 ) ) ( not ( = ?auto_34829 ?auto_34823 ) ) ( not ( = ?auto_34825 ?auto_34823 ) ) ( AVAILABLE ?auto_34813 ) ( IN ?auto_34829 ?auto_34818 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34813 ?auto_34829 ?auto_34818 ?auto_34815 )
      ( MAKE-ON ?auto_34811 ?auto_34812 )
      ( MAKE-ON-VERIFY ?auto_34811 ?auto_34812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34830 - SURFACE
      ?auto_34831 - SURFACE
    )
    :vars
    (
      ?auto_34844 - HOIST
      ?auto_34837 - PLACE
      ?auto_34834 - PLACE
      ?auto_34840 - HOIST
      ?auto_34835 - SURFACE
      ?auto_34848 - SURFACE
      ?auto_34832 - PLACE
      ?auto_34843 - HOIST
      ?auto_34845 - SURFACE
      ?auto_34846 - SURFACE
      ?auto_34847 - PLACE
      ?auto_34842 - HOIST
      ?auto_34841 - SURFACE
      ?auto_34839 - SURFACE
      ?auto_34833 - SURFACE
      ?auto_34838 - SURFACE
      ?auto_34836 - TRUCK
      ?auto_34849 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34844 ?auto_34837 ) ( IS-CRATE ?auto_34830 ) ( not ( = ?auto_34830 ?auto_34831 ) ) ( not ( = ?auto_34834 ?auto_34837 ) ) ( HOIST-AT ?auto_34840 ?auto_34834 ) ( not ( = ?auto_34844 ?auto_34840 ) ) ( AVAILABLE ?auto_34840 ) ( SURFACE-AT ?auto_34830 ?auto_34834 ) ( ON ?auto_34830 ?auto_34835 ) ( CLEAR ?auto_34830 ) ( not ( = ?auto_34830 ?auto_34835 ) ) ( not ( = ?auto_34831 ?auto_34835 ) ) ( IS-CRATE ?auto_34831 ) ( not ( = ?auto_34830 ?auto_34848 ) ) ( not ( = ?auto_34831 ?auto_34848 ) ) ( not ( = ?auto_34835 ?auto_34848 ) ) ( not ( = ?auto_34832 ?auto_34837 ) ) ( not ( = ?auto_34834 ?auto_34832 ) ) ( HOIST-AT ?auto_34843 ?auto_34832 ) ( not ( = ?auto_34844 ?auto_34843 ) ) ( not ( = ?auto_34840 ?auto_34843 ) ) ( SURFACE-AT ?auto_34831 ?auto_34832 ) ( ON ?auto_34831 ?auto_34845 ) ( CLEAR ?auto_34831 ) ( not ( = ?auto_34830 ?auto_34845 ) ) ( not ( = ?auto_34831 ?auto_34845 ) ) ( not ( = ?auto_34835 ?auto_34845 ) ) ( not ( = ?auto_34848 ?auto_34845 ) ) ( IS-CRATE ?auto_34848 ) ( not ( = ?auto_34830 ?auto_34846 ) ) ( not ( = ?auto_34831 ?auto_34846 ) ) ( not ( = ?auto_34835 ?auto_34846 ) ) ( not ( = ?auto_34848 ?auto_34846 ) ) ( not ( = ?auto_34845 ?auto_34846 ) ) ( not ( = ?auto_34847 ?auto_34837 ) ) ( not ( = ?auto_34834 ?auto_34847 ) ) ( not ( = ?auto_34832 ?auto_34847 ) ) ( HOIST-AT ?auto_34842 ?auto_34847 ) ( not ( = ?auto_34844 ?auto_34842 ) ) ( not ( = ?auto_34840 ?auto_34842 ) ) ( not ( = ?auto_34843 ?auto_34842 ) ) ( AVAILABLE ?auto_34842 ) ( SURFACE-AT ?auto_34848 ?auto_34847 ) ( ON ?auto_34848 ?auto_34841 ) ( CLEAR ?auto_34848 ) ( not ( = ?auto_34830 ?auto_34841 ) ) ( not ( = ?auto_34831 ?auto_34841 ) ) ( not ( = ?auto_34835 ?auto_34841 ) ) ( not ( = ?auto_34848 ?auto_34841 ) ) ( not ( = ?auto_34845 ?auto_34841 ) ) ( not ( = ?auto_34846 ?auto_34841 ) ) ( IS-CRATE ?auto_34846 ) ( not ( = ?auto_34830 ?auto_34839 ) ) ( not ( = ?auto_34831 ?auto_34839 ) ) ( not ( = ?auto_34835 ?auto_34839 ) ) ( not ( = ?auto_34848 ?auto_34839 ) ) ( not ( = ?auto_34845 ?auto_34839 ) ) ( not ( = ?auto_34846 ?auto_34839 ) ) ( not ( = ?auto_34841 ?auto_34839 ) ) ( AVAILABLE ?auto_34843 ) ( SURFACE-AT ?auto_34846 ?auto_34832 ) ( ON ?auto_34846 ?auto_34833 ) ( CLEAR ?auto_34846 ) ( not ( = ?auto_34830 ?auto_34833 ) ) ( not ( = ?auto_34831 ?auto_34833 ) ) ( not ( = ?auto_34835 ?auto_34833 ) ) ( not ( = ?auto_34848 ?auto_34833 ) ) ( not ( = ?auto_34845 ?auto_34833 ) ) ( not ( = ?auto_34846 ?auto_34833 ) ) ( not ( = ?auto_34841 ?auto_34833 ) ) ( not ( = ?auto_34839 ?auto_34833 ) ) ( SURFACE-AT ?auto_34838 ?auto_34837 ) ( CLEAR ?auto_34838 ) ( IS-CRATE ?auto_34839 ) ( not ( = ?auto_34830 ?auto_34838 ) ) ( not ( = ?auto_34831 ?auto_34838 ) ) ( not ( = ?auto_34835 ?auto_34838 ) ) ( not ( = ?auto_34848 ?auto_34838 ) ) ( not ( = ?auto_34845 ?auto_34838 ) ) ( not ( = ?auto_34846 ?auto_34838 ) ) ( not ( = ?auto_34841 ?auto_34838 ) ) ( not ( = ?auto_34839 ?auto_34838 ) ) ( not ( = ?auto_34833 ?auto_34838 ) ) ( AVAILABLE ?auto_34844 ) ( IN ?auto_34839 ?auto_34836 ) ( TRUCK-AT ?auto_34836 ?auto_34849 ) ( not ( = ?auto_34849 ?auto_34837 ) ) ( not ( = ?auto_34834 ?auto_34849 ) ) ( not ( = ?auto_34832 ?auto_34849 ) ) ( not ( = ?auto_34847 ?auto_34849 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34836 ?auto_34849 ?auto_34837 )
      ( MAKE-ON ?auto_34830 ?auto_34831 )
      ( MAKE-ON-VERIFY ?auto_34830 ?auto_34831 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34850 - SURFACE
      ?auto_34851 - SURFACE
    )
    :vars
    (
      ?auto_34868 - HOIST
      ?auto_34866 - PLACE
      ?auto_34863 - PLACE
      ?auto_34862 - HOIST
      ?auto_34865 - SURFACE
      ?auto_34856 - SURFACE
      ?auto_34860 - PLACE
      ?auto_34858 - HOIST
      ?auto_34864 - SURFACE
      ?auto_34852 - SURFACE
      ?auto_34859 - PLACE
      ?auto_34867 - HOIST
      ?auto_34853 - SURFACE
      ?auto_34869 - SURFACE
      ?auto_34857 - SURFACE
      ?auto_34854 - SURFACE
      ?auto_34861 - TRUCK
      ?auto_34855 - PLACE
      ?auto_34870 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34868 ?auto_34866 ) ( IS-CRATE ?auto_34850 ) ( not ( = ?auto_34850 ?auto_34851 ) ) ( not ( = ?auto_34863 ?auto_34866 ) ) ( HOIST-AT ?auto_34862 ?auto_34863 ) ( not ( = ?auto_34868 ?auto_34862 ) ) ( AVAILABLE ?auto_34862 ) ( SURFACE-AT ?auto_34850 ?auto_34863 ) ( ON ?auto_34850 ?auto_34865 ) ( CLEAR ?auto_34850 ) ( not ( = ?auto_34850 ?auto_34865 ) ) ( not ( = ?auto_34851 ?auto_34865 ) ) ( IS-CRATE ?auto_34851 ) ( not ( = ?auto_34850 ?auto_34856 ) ) ( not ( = ?auto_34851 ?auto_34856 ) ) ( not ( = ?auto_34865 ?auto_34856 ) ) ( not ( = ?auto_34860 ?auto_34866 ) ) ( not ( = ?auto_34863 ?auto_34860 ) ) ( HOIST-AT ?auto_34858 ?auto_34860 ) ( not ( = ?auto_34868 ?auto_34858 ) ) ( not ( = ?auto_34862 ?auto_34858 ) ) ( SURFACE-AT ?auto_34851 ?auto_34860 ) ( ON ?auto_34851 ?auto_34864 ) ( CLEAR ?auto_34851 ) ( not ( = ?auto_34850 ?auto_34864 ) ) ( not ( = ?auto_34851 ?auto_34864 ) ) ( not ( = ?auto_34865 ?auto_34864 ) ) ( not ( = ?auto_34856 ?auto_34864 ) ) ( IS-CRATE ?auto_34856 ) ( not ( = ?auto_34850 ?auto_34852 ) ) ( not ( = ?auto_34851 ?auto_34852 ) ) ( not ( = ?auto_34865 ?auto_34852 ) ) ( not ( = ?auto_34856 ?auto_34852 ) ) ( not ( = ?auto_34864 ?auto_34852 ) ) ( not ( = ?auto_34859 ?auto_34866 ) ) ( not ( = ?auto_34863 ?auto_34859 ) ) ( not ( = ?auto_34860 ?auto_34859 ) ) ( HOIST-AT ?auto_34867 ?auto_34859 ) ( not ( = ?auto_34868 ?auto_34867 ) ) ( not ( = ?auto_34862 ?auto_34867 ) ) ( not ( = ?auto_34858 ?auto_34867 ) ) ( AVAILABLE ?auto_34867 ) ( SURFACE-AT ?auto_34856 ?auto_34859 ) ( ON ?auto_34856 ?auto_34853 ) ( CLEAR ?auto_34856 ) ( not ( = ?auto_34850 ?auto_34853 ) ) ( not ( = ?auto_34851 ?auto_34853 ) ) ( not ( = ?auto_34865 ?auto_34853 ) ) ( not ( = ?auto_34856 ?auto_34853 ) ) ( not ( = ?auto_34864 ?auto_34853 ) ) ( not ( = ?auto_34852 ?auto_34853 ) ) ( IS-CRATE ?auto_34852 ) ( not ( = ?auto_34850 ?auto_34869 ) ) ( not ( = ?auto_34851 ?auto_34869 ) ) ( not ( = ?auto_34865 ?auto_34869 ) ) ( not ( = ?auto_34856 ?auto_34869 ) ) ( not ( = ?auto_34864 ?auto_34869 ) ) ( not ( = ?auto_34852 ?auto_34869 ) ) ( not ( = ?auto_34853 ?auto_34869 ) ) ( AVAILABLE ?auto_34858 ) ( SURFACE-AT ?auto_34852 ?auto_34860 ) ( ON ?auto_34852 ?auto_34857 ) ( CLEAR ?auto_34852 ) ( not ( = ?auto_34850 ?auto_34857 ) ) ( not ( = ?auto_34851 ?auto_34857 ) ) ( not ( = ?auto_34865 ?auto_34857 ) ) ( not ( = ?auto_34856 ?auto_34857 ) ) ( not ( = ?auto_34864 ?auto_34857 ) ) ( not ( = ?auto_34852 ?auto_34857 ) ) ( not ( = ?auto_34853 ?auto_34857 ) ) ( not ( = ?auto_34869 ?auto_34857 ) ) ( SURFACE-AT ?auto_34854 ?auto_34866 ) ( CLEAR ?auto_34854 ) ( IS-CRATE ?auto_34869 ) ( not ( = ?auto_34850 ?auto_34854 ) ) ( not ( = ?auto_34851 ?auto_34854 ) ) ( not ( = ?auto_34865 ?auto_34854 ) ) ( not ( = ?auto_34856 ?auto_34854 ) ) ( not ( = ?auto_34864 ?auto_34854 ) ) ( not ( = ?auto_34852 ?auto_34854 ) ) ( not ( = ?auto_34853 ?auto_34854 ) ) ( not ( = ?auto_34869 ?auto_34854 ) ) ( not ( = ?auto_34857 ?auto_34854 ) ) ( AVAILABLE ?auto_34868 ) ( TRUCK-AT ?auto_34861 ?auto_34855 ) ( not ( = ?auto_34855 ?auto_34866 ) ) ( not ( = ?auto_34863 ?auto_34855 ) ) ( not ( = ?auto_34860 ?auto_34855 ) ) ( not ( = ?auto_34859 ?auto_34855 ) ) ( HOIST-AT ?auto_34870 ?auto_34855 ) ( LIFTING ?auto_34870 ?auto_34869 ) ( not ( = ?auto_34868 ?auto_34870 ) ) ( not ( = ?auto_34862 ?auto_34870 ) ) ( not ( = ?auto_34858 ?auto_34870 ) ) ( not ( = ?auto_34867 ?auto_34870 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34870 ?auto_34869 ?auto_34861 ?auto_34855 )
      ( MAKE-ON ?auto_34850 ?auto_34851 )
      ( MAKE-ON-VERIFY ?auto_34850 ?auto_34851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34871 - SURFACE
      ?auto_34872 - SURFACE
    )
    :vars
    (
      ?auto_34882 - HOIST
      ?auto_34874 - PLACE
      ?auto_34884 - PLACE
      ?auto_34875 - HOIST
      ?auto_34877 - SURFACE
      ?auto_34891 - SURFACE
      ?auto_34888 - PLACE
      ?auto_34887 - HOIST
      ?auto_34879 - SURFACE
      ?auto_34890 - SURFACE
      ?auto_34876 - PLACE
      ?auto_34873 - HOIST
      ?auto_34883 - SURFACE
      ?auto_34889 - SURFACE
      ?auto_34885 - SURFACE
      ?auto_34880 - SURFACE
      ?auto_34878 - TRUCK
      ?auto_34881 - PLACE
      ?auto_34886 - HOIST
      ?auto_34892 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34882 ?auto_34874 ) ( IS-CRATE ?auto_34871 ) ( not ( = ?auto_34871 ?auto_34872 ) ) ( not ( = ?auto_34884 ?auto_34874 ) ) ( HOIST-AT ?auto_34875 ?auto_34884 ) ( not ( = ?auto_34882 ?auto_34875 ) ) ( AVAILABLE ?auto_34875 ) ( SURFACE-AT ?auto_34871 ?auto_34884 ) ( ON ?auto_34871 ?auto_34877 ) ( CLEAR ?auto_34871 ) ( not ( = ?auto_34871 ?auto_34877 ) ) ( not ( = ?auto_34872 ?auto_34877 ) ) ( IS-CRATE ?auto_34872 ) ( not ( = ?auto_34871 ?auto_34891 ) ) ( not ( = ?auto_34872 ?auto_34891 ) ) ( not ( = ?auto_34877 ?auto_34891 ) ) ( not ( = ?auto_34888 ?auto_34874 ) ) ( not ( = ?auto_34884 ?auto_34888 ) ) ( HOIST-AT ?auto_34887 ?auto_34888 ) ( not ( = ?auto_34882 ?auto_34887 ) ) ( not ( = ?auto_34875 ?auto_34887 ) ) ( SURFACE-AT ?auto_34872 ?auto_34888 ) ( ON ?auto_34872 ?auto_34879 ) ( CLEAR ?auto_34872 ) ( not ( = ?auto_34871 ?auto_34879 ) ) ( not ( = ?auto_34872 ?auto_34879 ) ) ( not ( = ?auto_34877 ?auto_34879 ) ) ( not ( = ?auto_34891 ?auto_34879 ) ) ( IS-CRATE ?auto_34891 ) ( not ( = ?auto_34871 ?auto_34890 ) ) ( not ( = ?auto_34872 ?auto_34890 ) ) ( not ( = ?auto_34877 ?auto_34890 ) ) ( not ( = ?auto_34891 ?auto_34890 ) ) ( not ( = ?auto_34879 ?auto_34890 ) ) ( not ( = ?auto_34876 ?auto_34874 ) ) ( not ( = ?auto_34884 ?auto_34876 ) ) ( not ( = ?auto_34888 ?auto_34876 ) ) ( HOIST-AT ?auto_34873 ?auto_34876 ) ( not ( = ?auto_34882 ?auto_34873 ) ) ( not ( = ?auto_34875 ?auto_34873 ) ) ( not ( = ?auto_34887 ?auto_34873 ) ) ( AVAILABLE ?auto_34873 ) ( SURFACE-AT ?auto_34891 ?auto_34876 ) ( ON ?auto_34891 ?auto_34883 ) ( CLEAR ?auto_34891 ) ( not ( = ?auto_34871 ?auto_34883 ) ) ( not ( = ?auto_34872 ?auto_34883 ) ) ( not ( = ?auto_34877 ?auto_34883 ) ) ( not ( = ?auto_34891 ?auto_34883 ) ) ( not ( = ?auto_34879 ?auto_34883 ) ) ( not ( = ?auto_34890 ?auto_34883 ) ) ( IS-CRATE ?auto_34890 ) ( not ( = ?auto_34871 ?auto_34889 ) ) ( not ( = ?auto_34872 ?auto_34889 ) ) ( not ( = ?auto_34877 ?auto_34889 ) ) ( not ( = ?auto_34891 ?auto_34889 ) ) ( not ( = ?auto_34879 ?auto_34889 ) ) ( not ( = ?auto_34890 ?auto_34889 ) ) ( not ( = ?auto_34883 ?auto_34889 ) ) ( AVAILABLE ?auto_34887 ) ( SURFACE-AT ?auto_34890 ?auto_34888 ) ( ON ?auto_34890 ?auto_34885 ) ( CLEAR ?auto_34890 ) ( not ( = ?auto_34871 ?auto_34885 ) ) ( not ( = ?auto_34872 ?auto_34885 ) ) ( not ( = ?auto_34877 ?auto_34885 ) ) ( not ( = ?auto_34891 ?auto_34885 ) ) ( not ( = ?auto_34879 ?auto_34885 ) ) ( not ( = ?auto_34890 ?auto_34885 ) ) ( not ( = ?auto_34883 ?auto_34885 ) ) ( not ( = ?auto_34889 ?auto_34885 ) ) ( SURFACE-AT ?auto_34880 ?auto_34874 ) ( CLEAR ?auto_34880 ) ( IS-CRATE ?auto_34889 ) ( not ( = ?auto_34871 ?auto_34880 ) ) ( not ( = ?auto_34872 ?auto_34880 ) ) ( not ( = ?auto_34877 ?auto_34880 ) ) ( not ( = ?auto_34891 ?auto_34880 ) ) ( not ( = ?auto_34879 ?auto_34880 ) ) ( not ( = ?auto_34890 ?auto_34880 ) ) ( not ( = ?auto_34883 ?auto_34880 ) ) ( not ( = ?auto_34889 ?auto_34880 ) ) ( not ( = ?auto_34885 ?auto_34880 ) ) ( AVAILABLE ?auto_34882 ) ( TRUCK-AT ?auto_34878 ?auto_34881 ) ( not ( = ?auto_34881 ?auto_34874 ) ) ( not ( = ?auto_34884 ?auto_34881 ) ) ( not ( = ?auto_34888 ?auto_34881 ) ) ( not ( = ?auto_34876 ?auto_34881 ) ) ( HOIST-AT ?auto_34886 ?auto_34881 ) ( not ( = ?auto_34882 ?auto_34886 ) ) ( not ( = ?auto_34875 ?auto_34886 ) ) ( not ( = ?auto_34887 ?auto_34886 ) ) ( not ( = ?auto_34873 ?auto_34886 ) ) ( AVAILABLE ?auto_34886 ) ( SURFACE-AT ?auto_34889 ?auto_34881 ) ( ON ?auto_34889 ?auto_34892 ) ( CLEAR ?auto_34889 ) ( not ( = ?auto_34871 ?auto_34892 ) ) ( not ( = ?auto_34872 ?auto_34892 ) ) ( not ( = ?auto_34877 ?auto_34892 ) ) ( not ( = ?auto_34891 ?auto_34892 ) ) ( not ( = ?auto_34879 ?auto_34892 ) ) ( not ( = ?auto_34890 ?auto_34892 ) ) ( not ( = ?auto_34883 ?auto_34892 ) ) ( not ( = ?auto_34889 ?auto_34892 ) ) ( not ( = ?auto_34885 ?auto_34892 ) ) ( not ( = ?auto_34880 ?auto_34892 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34886 ?auto_34889 ?auto_34892 ?auto_34881 )
      ( MAKE-ON ?auto_34871 ?auto_34872 )
      ( MAKE-ON-VERIFY ?auto_34871 ?auto_34872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34893 - SURFACE
      ?auto_34894 - SURFACE
    )
    :vars
    (
      ?auto_34903 - HOIST
      ?auto_34912 - PLACE
      ?auto_34913 - PLACE
      ?auto_34910 - HOIST
      ?auto_34899 - SURFACE
      ?auto_34909 - SURFACE
      ?auto_34897 - PLACE
      ?auto_34911 - HOIST
      ?auto_34896 - SURFACE
      ?auto_34895 - SURFACE
      ?auto_34904 - PLACE
      ?auto_34907 - HOIST
      ?auto_34901 - SURFACE
      ?auto_34908 - SURFACE
      ?auto_34905 - SURFACE
      ?auto_34914 - SURFACE
      ?auto_34906 - PLACE
      ?auto_34898 - HOIST
      ?auto_34902 - SURFACE
      ?auto_34900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34903 ?auto_34912 ) ( IS-CRATE ?auto_34893 ) ( not ( = ?auto_34893 ?auto_34894 ) ) ( not ( = ?auto_34913 ?auto_34912 ) ) ( HOIST-AT ?auto_34910 ?auto_34913 ) ( not ( = ?auto_34903 ?auto_34910 ) ) ( AVAILABLE ?auto_34910 ) ( SURFACE-AT ?auto_34893 ?auto_34913 ) ( ON ?auto_34893 ?auto_34899 ) ( CLEAR ?auto_34893 ) ( not ( = ?auto_34893 ?auto_34899 ) ) ( not ( = ?auto_34894 ?auto_34899 ) ) ( IS-CRATE ?auto_34894 ) ( not ( = ?auto_34893 ?auto_34909 ) ) ( not ( = ?auto_34894 ?auto_34909 ) ) ( not ( = ?auto_34899 ?auto_34909 ) ) ( not ( = ?auto_34897 ?auto_34912 ) ) ( not ( = ?auto_34913 ?auto_34897 ) ) ( HOIST-AT ?auto_34911 ?auto_34897 ) ( not ( = ?auto_34903 ?auto_34911 ) ) ( not ( = ?auto_34910 ?auto_34911 ) ) ( SURFACE-AT ?auto_34894 ?auto_34897 ) ( ON ?auto_34894 ?auto_34896 ) ( CLEAR ?auto_34894 ) ( not ( = ?auto_34893 ?auto_34896 ) ) ( not ( = ?auto_34894 ?auto_34896 ) ) ( not ( = ?auto_34899 ?auto_34896 ) ) ( not ( = ?auto_34909 ?auto_34896 ) ) ( IS-CRATE ?auto_34909 ) ( not ( = ?auto_34893 ?auto_34895 ) ) ( not ( = ?auto_34894 ?auto_34895 ) ) ( not ( = ?auto_34899 ?auto_34895 ) ) ( not ( = ?auto_34909 ?auto_34895 ) ) ( not ( = ?auto_34896 ?auto_34895 ) ) ( not ( = ?auto_34904 ?auto_34912 ) ) ( not ( = ?auto_34913 ?auto_34904 ) ) ( not ( = ?auto_34897 ?auto_34904 ) ) ( HOIST-AT ?auto_34907 ?auto_34904 ) ( not ( = ?auto_34903 ?auto_34907 ) ) ( not ( = ?auto_34910 ?auto_34907 ) ) ( not ( = ?auto_34911 ?auto_34907 ) ) ( AVAILABLE ?auto_34907 ) ( SURFACE-AT ?auto_34909 ?auto_34904 ) ( ON ?auto_34909 ?auto_34901 ) ( CLEAR ?auto_34909 ) ( not ( = ?auto_34893 ?auto_34901 ) ) ( not ( = ?auto_34894 ?auto_34901 ) ) ( not ( = ?auto_34899 ?auto_34901 ) ) ( not ( = ?auto_34909 ?auto_34901 ) ) ( not ( = ?auto_34896 ?auto_34901 ) ) ( not ( = ?auto_34895 ?auto_34901 ) ) ( IS-CRATE ?auto_34895 ) ( not ( = ?auto_34893 ?auto_34908 ) ) ( not ( = ?auto_34894 ?auto_34908 ) ) ( not ( = ?auto_34899 ?auto_34908 ) ) ( not ( = ?auto_34909 ?auto_34908 ) ) ( not ( = ?auto_34896 ?auto_34908 ) ) ( not ( = ?auto_34895 ?auto_34908 ) ) ( not ( = ?auto_34901 ?auto_34908 ) ) ( AVAILABLE ?auto_34911 ) ( SURFACE-AT ?auto_34895 ?auto_34897 ) ( ON ?auto_34895 ?auto_34905 ) ( CLEAR ?auto_34895 ) ( not ( = ?auto_34893 ?auto_34905 ) ) ( not ( = ?auto_34894 ?auto_34905 ) ) ( not ( = ?auto_34899 ?auto_34905 ) ) ( not ( = ?auto_34909 ?auto_34905 ) ) ( not ( = ?auto_34896 ?auto_34905 ) ) ( not ( = ?auto_34895 ?auto_34905 ) ) ( not ( = ?auto_34901 ?auto_34905 ) ) ( not ( = ?auto_34908 ?auto_34905 ) ) ( SURFACE-AT ?auto_34914 ?auto_34912 ) ( CLEAR ?auto_34914 ) ( IS-CRATE ?auto_34908 ) ( not ( = ?auto_34893 ?auto_34914 ) ) ( not ( = ?auto_34894 ?auto_34914 ) ) ( not ( = ?auto_34899 ?auto_34914 ) ) ( not ( = ?auto_34909 ?auto_34914 ) ) ( not ( = ?auto_34896 ?auto_34914 ) ) ( not ( = ?auto_34895 ?auto_34914 ) ) ( not ( = ?auto_34901 ?auto_34914 ) ) ( not ( = ?auto_34908 ?auto_34914 ) ) ( not ( = ?auto_34905 ?auto_34914 ) ) ( AVAILABLE ?auto_34903 ) ( not ( = ?auto_34906 ?auto_34912 ) ) ( not ( = ?auto_34913 ?auto_34906 ) ) ( not ( = ?auto_34897 ?auto_34906 ) ) ( not ( = ?auto_34904 ?auto_34906 ) ) ( HOIST-AT ?auto_34898 ?auto_34906 ) ( not ( = ?auto_34903 ?auto_34898 ) ) ( not ( = ?auto_34910 ?auto_34898 ) ) ( not ( = ?auto_34911 ?auto_34898 ) ) ( not ( = ?auto_34907 ?auto_34898 ) ) ( AVAILABLE ?auto_34898 ) ( SURFACE-AT ?auto_34908 ?auto_34906 ) ( ON ?auto_34908 ?auto_34902 ) ( CLEAR ?auto_34908 ) ( not ( = ?auto_34893 ?auto_34902 ) ) ( not ( = ?auto_34894 ?auto_34902 ) ) ( not ( = ?auto_34899 ?auto_34902 ) ) ( not ( = ?auto_34909 ?auto_34902 ) ) ( not ( = ?auto_34896 ?auto_34902 ) ) ( not ( = ?auto_34895 ?auto_34902 ) ) ( not ( = ?auto_34901 ?auto_34902 ) ) ( not ( = ?auto_34908 ?auto_34902 ) ) ( not ( = ?auto_34905 ?auto_34902 ) ) ( not ( = ?auto_34914 ?auto_34902 ) ) ( TRUCK-AT ?auto_34900 ?auto_34912 ) )
    :subtasks
    ( ( !DRIVE ?auto_34900 ?auto_34912 ?auto_34906 )
      ( MAKE-ON ?auto_34893 ?auto_34894 )
      ( MAKE-ON-VERIFY ?auto_34893 ?auto_34894 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34915 - SURFACE
      ?auto_34916 - SURFACE
    )
    :vars
    (
      ?auto_34926 - HOIST
      ?auto_34922 - PLACE
      ?auto_34923 - PLACE
      ?auto_34925 - HOIST
      ?auto_34934 - SURFACE
      ?auto_34920 - SURFACE
      ?auto_34927 - PLACE
      ?auto_34921 - HOIST
      ?auto_34933 - SURFACE
      ?auto_34919 - SURFACE
      ?auto_34935 - PLACE
      ?auto_34932 - HOIST
      ?auto_34917 - SURFACE
      ?auto_34936 - SURFACE
      ?auto_34929 - SURFACE
      ?auto_34924 - SURFACE
      ?auto_34918 - PLACE
      ?auto_34930 - HOIST
      ?auto_34928 - SURFACE
      ?auto_34931 - TRUCK
      ?auto_34937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34926 ?auto_34922 ) ( IS-CRATE ?auto_34915 ) ( not ( = ?auto_34915 ?auto_34916 ) ) ( not ( = ?auto_34923 ?auto_34922 ) ) ( HOIST-AT ?auto_34925 ?auto_34923 ) ( not ( = ?auto_34926 ?auto_34925 ) ) ( AVAILABLE ?auto_34925 ) ( SURFACE-AT ?auto_34915 ?auto_34923 ) ( ON ?auto_34915 ?auto_34934 ) ( CLEAR ?auto_34915 ) ( not ( = ?auto_34915 ?auto_34934 ) ) ( not ( = ?auto_34916 ?auto_34934 ) ) ( IS-CRATE ?auto_34916 ) ( not ( = ?auto_34915 ?auto_34920 ) ) ( not ( = ?auto_34916 ?auto_34920 ) ) ( not ( = ?auto_34934 ?auto_34920 ) ) ( not ( = ?auto_34927 ?auto_34922 ) ) ( not ( = ?auto_34923 ?auto_34927 ) ) ( HOIST-AT ?auto_34921 ?auto_34927 ) ( not ( = ?auto_34926 ?auto_34921 ) ) ( not ( = ?auto_34925 ?auto_34921 ) ) ( SURFACE-AT ?auto_34916 ?auto_34927 ) ( ON ?auto_34916 ?auto_34933 ) ( CLEAR ?auto_34916 ) ( not ( = ?auto_34915 ?auto_34933 ) ) ( not ( = ?auto_34916 ?auto_34933 ) ) ( not ( = ?auto_34934 ?auto_34933 ) ) ( not ( = ?auto_34920 ?auto_34933 ) ) ( IS-CRATE ?auto_34920 ) ( not ( = ?auto_34915 ?auto_34919 ) ) ( not ( = ?auto_34916 ?auto_34919 ) ) ( not ( = ?auto_34934 ?auto_34919 ) ) ( not ( = ?auto_34920 ?auto_34919 ) ) ( not ( = ?auto_34933 ?auto_34919 ) ) ( not ( = ?auto_34935 ?auto_34922 ) ) ( not ( = ?auto_34923 ?auto_34935 ) ) ( not ( = ?auto_34927 ?auto_34935 ) ) ( HOIST-AT ?auto_34932 ?auto_34935 ) ( not ( = ?auto_34926 ?auto_34932 ) ) ( not ( = ?auto_34925 ?auto_34932 ) ) ( not ( = ?auto_34921 ?auto_34932 ) ) ( AVAILABLE ?auto_34932 ) ( SURFACE-AT ?auto_34920 ?auto_34935 ) ( ON ?auto_34920 ?auto_34917 ) ( CLEAR ?auto_34920 ) ( not ( = ?auto_34915 ?auto_34917 ) ) ( not ( = ?auto_34916 ?auto_34917 ) ) ( not ( = ?auto_34934 ?auto_34917 ) ) ( not ( = ?auto_34920 ?auto_34917 ) ) ( not ( = ?auto_34933 ?auto_34917 ) ) ( not ( = ?auto_34919 ?auto_34917 ) ) ( IS-CRATE ?auto_34919 ) ( not ( = ?auto_34915 ?auto_34936 ) ) ( not ( = ?auto_34916 ?auto_34936 ) ) ( not ( = ?auto_34934 ?auto_34936 ) ) ( not ( = ?auto_34920 ?auto_34936 ) ) ( not ( = ?auto_34933 ?auto_34936 ) ) ( not ( = ?auto_34919 ?auto_34936 ) ) ( not ( = ?auto_34917 ?auto_34936 ) ) ( AVAILABLE ?auto_34921 ) ( SURFACE-AT ?auto_34919 ?auto_34927 ) ( ON ?auto_34919 ?auto_34929 ) ( CLEAR ?auto_34919 ) ( not ( = ?auto_34915 ?auto_34929 ) ) ( not ( = ?auto_34916 ?auto_34929 ) ) ( not ( = ?auto_34934 ?auto_34929 ) ) ( not ( = ?auto_34920 ?auto_34929 ) ) ( not ( = ?auto_34933 ?auto_34929 ) ) ( not ( = ?auto_34919 ?auto_34929 ) ) ( not ( = ?auto_34917 ?auto_34929 ) ) ( not ( = ?auto_34936 ?auto_34929 ) ) ( IS-CRATE ?auto_34936 ) ( not ( = ?auto_34915 ?auto_34924 ) ) ( not ( = ?auto_34916 ?auto_34924 ) ) ( not ( = ?auto_34934 ?auto_34924 ) ) ( not ( = ?auto_34920 ?auto_34924 ) ) ( not ( = ?auto_34933 ?auto_34924 ) ) ( not ( = ?auto_34919 ?auto_34924 ) ) ( not ( = ?auto_34917 ?auto_34924 ) ) ( not ( = ?auto_34936 ?auto_34924 ) ) ( not ( = ?auto_34929 ?auto_34924 ) ) ( not ( = ?auto_34918 ?auto_34922 ) ) ( not ( = ?auto_34923 ?auto_34918 ) ) ( not ( = ?auto_34927 ?auto_34918 ) ) ( not ( = ?auto_34935 ?auto_34918 ) ) ( HOIST-AT ?auto_34930 ?auto_34918 ) ( not ( = ?auto_34926 ?auto_34930 ) ) ( not ( = ?auto_34925 ?auto_34930 ) ) ( not ( = ?auto_34921 ?auto_34930 ) ) ( not ( = ?auto_34932 ?auto_34930 ) ) ( AVAILABLE ?auto_34930 ) ( SURFACE-AT ?auto_34936 ?auto_34918 ) ( ON ?auto_34936 ?auto_34928 ) ( CLEAR ?auto_34936 ) ( not ( = ?auto_34915 ?auto_34928 ) ) ( not ( = ?auto_34916 ?auto_34928 ) ) ( not ( = ?auto_34934 ?auto_34928 ) ) ( not ( = ?auto_34920 ?auto_34928 ) ) ( not ( = ?auto_34933 ?auto_34928 ) ) ( not ( = ?auto_34919 ?auto_34928 ) ) ( not ( = ?auto_34917 ?auto_34928 ) ) ( not ( = ?auto_34936 ?auto_34928 ) ) ( not ( = ?auto_34929 ?auto_34928 ) ) ( not ( = ?auto_34924 ?auto_34928 ) ) ( TRUCK-AT ?auto_34931 ?auto_34922 ) ( SURFACE-AT ?auto_34937 ?auto_34922 ) ( CLEAR ?auto_34937 ) ( LIFTING ?auto_34926 ?auto_34924 ) ( IS-CRATE ?auto_34924 ) ( not ( = ?auto_34915 ?auto_34937 ) ) ( not ( = ?auto_34916 ?auto_34937 ) ) ( not ( = ?auto_34934 ?auto_34937 ) ) ( not ( = ?auto_34920 ?auto_34937 ) ) ( not ( = ?auto_34933 ?auto_34937 ) ) ( not ( = ?auto_34919 ?auto_34937 ) ) ( not ( = ?auto_34917 ?auto_34937 ) ) ( not ( = ?auto_34936 ?auto_34937 ) ) ( not ( = ?auto_34929 ?auto_34937 ) ) ( not ( = ?auto_34924 ?auto_34937 ) ) ( not ( = ?auto_34928 ?auto_34937 ) ) )
    :subtasks
    ( ( !DROP ?auto_34926 ?auto_34924 ?auto_34937 ?auto_34922 )
      ( MAKE-ON ?auto_34915 ?auto_34916 )
      ( MAKE-ON-VERIFY ?auto_34915 ?auto_34916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34938 - SURFACE
      ?auto_34939 - SURFACE
    )
    :vars
    (
      ?auto_34960 - HOIST
      ?auto_34941 - PLACE
      ?auto_34951 - PLACE
      ?auto_34943 - HOIST
      ?auto_34954 - SURFACE
      ?auto_34944 - SURFACE
      ?auto_34959 - PLACE
      ?auto_34957 - HOIST
      ?auto_34955 - SURFACE
      ?auto_34945 - SURFACE
      ?auto_34952 - PLACE
      ?auto_34946 - HOIST
      ?auto_34953 - SURFACE
      ?auto_34956 - SURFACE
      ?auto_34942 - SURFACE
      ?auto_34940 - SURFACE
      ?auto_34948 - PLACE
      ?auto_34958 - HOIST
      ?auto_34947 - SURFACE
      ?auto_34950 - TRUCK
      ?auto_34949 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34960 ?auto_34941 ) ( IS-CRATE ?auto_34938 ) ( not ( = ?auto_34938 ?auto_34939 ) ) ( not ( = ?auto_34951 ?auto_34941 ) ) ( HOIST-AT ?auto_34943 ?auto_34951 ) ( not ( = ?auto_34960 ?auto_34943 ) ) ( AVAILABLE ?auto_34943 ) ( SURFACE-AT ?auto_34938 ?auto_34951 ) ( ON ?auto_34938 ?auto_34954 ) ( CLEAR ?auto_34938 ) ( not ( = ?auto_34938 ?auto_34954 ) ) ( not ( = ?auto_34939 ?auto_34954 ) ) ( IS-CRATE ?auto_34939 ) ( not ( = ?auto_34938 ?auto_34944 ) ) ( not ( = ?auto_34939 ?auto_34944 ) ) ( not ( = ?auto_34954 ?auto_34944 ) ) ( not ( = ?auto_34959 ?auto_34941 ) ) ( not ( = ?auto_34951 ?auto_34959 ) ) ( HOIST-AT ?auto_34957 ?auto_34959 ) ( not ( = ?auto_34960 ?auto_34957 ) ) ( not ( = ?auto_34943 ?auto_34957 ) ) ( SURFACE-AT ?auto_34939 ?auto_34959 ) ( ON ?auto_34939 ?auto_34955 ) ( CLEAR ?auto_34939 ) ( not ( = ?auto_34938 ?auto_34955 ) ) ( not ( = ?auto_34939 ?auto_34955 ) ) ( not ( = ?auto_34954 ?auto_34955 ) ) ( not ( = ?auto_34944 ?auto_34955 ) ) ( IS-CRATE ?auto_34944 ) ( not ( = ?auto_34938 ?auto_34945 ) ) ( not ( = ?auto_34939 ?auto_34945 ) ) ( not ( = ?auto_34954 ?auto_34945 ) ) ( not ( = ?auto_34944 ?auto_34945 ) ) ( not ( = ?auto_34955 ?auto_34945 ) ) ( not ( = ?auto_34952 ?auto_34941 ) ) ( not ( = ?auto_34951 ?auto_34952 ) ) ( not ( = ?auto_34959 ?auto_34952 ) ) ( HOIST-AT ?auto_34946 ?auto_34952 ) ( not ( = ?auto_34960 ?auto_34946 ) ) ( not ( = ?auto_34943 ?auto_34946 ) ) ( not ( = ?auto_34957 ?auto_34946 ) ) ( AVAILABLE ?auto_34946 ) ( SURFACE-AT ?auto_34944 ?auto_34952 ) ( ON ?auto_34944 ?auto_34953 ) ( CLEAR ?auto_34944 ) ( not ( = ?auto_34938 ?auto_34953 ) ) ( not ( = ?auto_34939 ?auto_34953 ) ) ( not ( = ?auto_34954 ?auto_34953 ) ) ( not ( = ?auto_34944 ?auto_34953 ) ) ( not ( = ?auto_34955 ?auto_34953 ) ) ( not ( = ?auto_34945 ?auto_34953 ) ) ( IS-CRATE ?auto_34945 ) ( not ( = ?auto_34938 ?auto_34956 ) ) ( not ( = ?auto_34939 ?auto_34956 ) ) ( not ( = ?auto_34954 ?auto_34956 ) ) ( not ( = ?auto_34944 ?auto_34956 ) ) ( not ( = ?auto_34955 ?auto_34956 ) ) ( not ( = ?auto_34945 ?auto_34956 ) ) ( not ( = ?auto_34953 ?auto_34956 ) ) ( AVAILABLE ?auto_34957 ) ( SURFACE-AT ?auto_34945 ?auto_34959 ) ( ON ?auto_34945 ?auto_34942 ) ( CLEAR ?auto_34945 ) ( not ( = ?auto_34938 ?auto_34942 ) ) ( not ( = ?auto_34939 ?auto_34942 ) ) ( not ( = ?auto_34954 ?auto_34942 ) ) ( not ( = ?auto_34944 ?auto_34942 ) ) ( not ( = ?auto_34955 ?auto_34942 ) ) ( not ( = ?auto_34945 ?auto_34942 ) ) ( not ( = ?auto_34953 ?auto_34942 ) ) ( not ( = ?auto_34956 ?auto_34942 ) ) ( IS-CRATE ?auto_34956 ) ( not ( = ?auto_34938 ?auto_34940 ) ) ( not ( = ?auto_34939 ?auto_34940 ) ) ( not ( = ?auto_34954 ?auto_34940 ) ) ( not ( = ?auto_34944 ?auto_34940 ) ) ( not ( = ?auto_34955 ?auto_34940 ) ) ( not ( = ?auto_34945 ?auto_34940 ) ) ( not ( = ?auto_34953 ?auto_34940 ) ) ( not ( = ?auto_34956 ?auto_34940 ) ) ( not ( = ?auto_34942 ?auto_34940 ) ) ( not ( = ?auto_34948 ?auto_34941 ) ) ( not ( = ?auto_34951 ?auto_34948 ) ) ( not ( = ?auto_34959 ?auto_34948 ) ) ( not ( = ?auto_34952 ?auto_34948 ) ) ( HOIST-AT ?auto_34958 ?auto_34948 ) ( not ( = ?auto_34960 ?auto_34958 ) ) ( not ( = ?auto_34943 ?auto_34958 ) ) ( not ( = ?auto_34957 ?auto_34958 ) ) ( not ( = ?auto_34946 ?auto_34958 ) ) ( AVAILABLE ?auto_34958 ) ( SURFACE-AT ?auto_34956 ?auto_34948 ) ( ON ?auto_34956 ?auto_34947 ) ( CLEAR ?auto_34956 ) ( not ( = ?auto_34938 ?auto_34947 ) ) ( not ( = ?auto_34939 ?auto_34947 ) ) ( not ( = ?auto_34954 ?auto_34947 ) ) ( not ( = ?auto_34944 ?auto_34947 ) ) ( not ( = ?auto_34955 ?auto_34947 ) ) ( not ( = ?auto_34945 ?auto_34947 ) ) ( not ( = ?auto_34953 ?auto_34947 ) ) ( not ( = ?auto_34956 ?auto_34947 ) ) ( not ( = ?auto_34942 ?auto_34947 ) ) ( not ( = ?auto_34940 ?auto_34947 ) ) ( TRUCK-AT ?auto_34950 ?auto_34941 ) ( SURFACE-AT ?auto_34949 ?auto_34941 ) ( CLEAR ?auto_34949 ) ( IS-CRATE ?auto_34940 ) ( not ( = ?auto_34938 ?auto_34949 ) ) ( not ( = ?auto_34939 ?auto_34949 ) ) ( not ( = ?auto_34954 ?auto_34949 ) ) ( not ( = ?auto_34944 ?auto_34949 ) ) ( not ( = ?auto_34955 ?auto_34949 ) ) ( not ( = ?auto_34945 ?auto_34949 ) ) ( not ( = ?auto_34953 ?auto_34949 ) ) ( not ( = ?auto_34956 ?auto_34949 ) ) ( not ( = ?auto_34942 ?auto_34949 ) ) ( not ( = ?auto_34940 ?auto_34949 ) ) ( not ( = ?auto_34947 ?auto_34949 ) ) ( AVAILABLE ?auto_34960 ) ( IN ?auto_34940 ?auto_34950 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34960 ?auto_34940 ?auto_34950 ?auto_34941 )
      ( MAKE-ON ?auto_34938 ?auto_34939 )
      ( MAKE-ON-VERIFY ?auto_34938 ?auto_34939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34961 - SURFACE
      ?auto_34962 - SURFACE
    )
    :vars
    (
      ?auto_34977 - HOIST
      ?auto_34965 - PLACE
      ?auto_34981 - PLACE
      ?auto_34969 - HOIST
      ?auto_34979 - SURFACE
      ?auto_34967 - SURFACE
      ?auto_34964 - PLACE
      ?auto_34978 - HOIST
      ?auto_34972 - SURFACE
      ?auto_34973 - SURFACE
      ?auto_34980 - PLACE
      ?auto_34975 - HOIST
      ?auto_34983 - SURFACE
      ?auto_34966 - SURFACE
      ?auto_34971 - SURFACE
      ?auto_34968 - SURFACE
      ?auto_34976 - PLACE
      ?auto_34970 - HOIST
      ?auto_34982 - SURFACE
      ?auto_34963 - SURFACE
      ?auto_34974 - TRUCK
      ?auto_34984 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34977 ?auto_34965 ) ( IS-CRATE ?auto_34961 ) ( not ( = ?auto_34961 ?auto_34962 ) ) ( not ( = ?auto_34981 ?auto_34965 ) ) ( HOIST-AT ?auto_34969 ?auto_34981 ) ( not ( = ?auto_34977 ?auto_34969 ) ) ( AVAILABLE ?auto_34969 ) ( SURFACE-AT ?auto_34961 ?auto_34981 ) ( ON ?auto_34961 ?auto_34979 ) ( CLEAR ?auto_34961 ) ( not ( = ?auto_34961 ?auto_34979 ) ) ( not ( = ?auto_34962 ?auto_34979 ) ) ( IS-CRATE ?auto_34962 ) ( not ( = ?auto_34961 ?auto_34967 ) ) ( not ( = ?auto_34962 ?auto_34967 ) ) ( not ( = ?auto_34979 ?auto_34967 ) ) ( not ( = ?auto_34964 ?auto_34965 ) ) ( not ( = ?auto_34981 ?auto_34964 ) ) ( HOIST-AT ?auto_34978 ?auto_34964 ) ( not ( = ?auto_34977 ?auto_34978 ) ) ( not ( = ?auto_34969 ?auto_34978 ) ) ( SURFACE-AT ?auto_34962 ?auto_34964 ) ( ON ?auto_34962 ?auto_34972 ) ( CLEAR ?auto_34962 ) ( not ( = ?auto_34961 ?auto_34972 ) ) ( not ( = ?auto_34962 ?auto_34972 ) ) ( not ( = ?auto_34979 ?auto_34972 ) ) ( not ( = ?auto_34967 ?auto_34972 ) ) ( IS-CRATE ?auto_34967 ) ( not ( = ?auto_34961 ?auto_34973 ) ) ( not ( = ?auto_34962 ?auto_34973 ) ) ( not ( = ?auto_34979 ?auto_34973 ) ) ( not ( = ?auto_34967 ?auto_34973 ) ) ( not ( = ?auto_34972 ?auto_34973 ) ) ( not ( = ?auto_34980 ?auto_34965 ) ) ( not ( = ?auto_34981 ?auto_34980 ) ) ( not ( = ?auto_34964 ?auto_34980 ) ) ( HOIST-AT ?auto_34975 ?auto_34980 ) ( not ( = ?auto_34977 ?auto_34975 ) ) ( not ( = ?auto_34969 ?auto_34975 ) ) ( not ( = ?auto_34978 ?auto_34975 ) ) ( AVAILABLE ?auto_34975 ) ( SURFACE-AT ?auto_34967 ?auto_34980 ) ( ON ?auto_34967 ?auto_34983 ) ( CLEAR ?auto_34967 ) ( not ( = ?auto_34961 ?auto_34983 ) ) ( not ( = ?auto_34962 ?auto_34983 ) ) ( not ( = ?auto_34979 ?auto_34983 ) ) ( not ( = ?auto_34967 ?auto_34983 ) ) ( not ( = ?auto_34972 ?auto_34983 ) ) ( not ( = ?auto_34973 ?auto_34983 ) ) ( IS-CRATE ?auto_34973 ) ( not ( = ?auto_34961 ?auto_34966 ) ) ( not ( = ?auto_34962 ?auto_34966 ) ) ( not ( = ?auto_34979 ?auto_34966 ) ) ( not ( = ?auto_34967 ?auto_34966 ) ) ( not ( = ?auto_34972 ?auto_34966 ) ) ( not ( = ?auto_34973 ?auto_34966 ) ) ( not ( = ?auto_34983 ?auto_34966 ) ) ( AVAILABLE ?auto_34978 ) ( SURFACE-AT ?auto_34973 ?auto_34964 ) ( ON ?auto_34973 ?auto_34971 ) ( CLEAR ?auto_34973 ) ( not ( = ?auto_34961 ?auto_34971 ) ) ( not ( = ?auto_34962 ?auto_34971 ) ) ( not ( = ?auto_34979 ?auto_34971 ) ) ( not ( = ?auto_34967 ?auto_34971 ) ) ( not ( = ?auto_34972 ?auto_34971 ) ) ( not ( = ?auto_34973 ?auto_34971 ) ) ( not ( = ?auto_34983 ?auto_34971 ) ) ( not ( = ?auto_34966 ?auto_34971 ) ) ( IS-CRATE ?auto_34966 ) ( not ( = ?auto_34961 ?auto_34968 ) ) ( not ( = ?auto_34962 ?auto_34968 ) ) ( not ( = ?auto_34979 ?auto_34968 ) ) ( not ( = ?auto_34967 ?auto_34968 ) ) ( not ( = ?auto_34972 ?auto_34968 ) ) ( not ( = ?auto_34973 ?auto_34968 ) ) ( not ( = ?auto_34983 ?auto_34968 ) ) ( not ( = ?auto_34966 ?auto_34968 ) ) ( not ( = ?auto_34971 ?auto_34968 ) ) ( not ( = ?auto_34976 ?auto_34965 ) ) ( not ( = ?auto_34981 ?auto_34976 ) ) ( not ( = ?auto_34964 ?auto_34976 ) ) ( not ( = ?auto_34980 ?auto_34976 ) ) ( HOIST-AT ?auto_34970 ?auto_34976 ) ( not ( = ?auto_34977 ?auto_34970 ) ) ( not ( = ?auto_34969 ?auto_34970 ) ) ( not ( = ?auto_34978 ?auto_34970 ) ) ( not ( = ?auto_34975 ?auto_34970 ) ) ( AVAILABLE ?auto_34970 ) ( SURFACE-AT ?auto_34966 ?auto_34976 ) ( ON ?auto_34966 ?auto_34982 ) ( CLEAR ?auto_34966 ) ( not ( = ?auto_34961 ?auto_34982 ) ) ( not ( = ?auto_34962 ?auto_34982 ) ) ( not ( = ?auto_34979 ?auto_34982 ) ) ( not ( = ?auto_34967 ?auto_34982 ) ) ( not ( = ?auto_34972 ?auto_34982 ) ) ( not ( = ?auto_34973 ?auto_34982 ) ) ( not ( = ?auto_34983 ?auto_34982 ) ) ( not ( = ?auto_34966 ?auto_34982 ) ) ( not ( = ?auto_34971 ?auto_34982 ) ) ( not ( = ?auto_34968 ?auto_34982 ) ) ( SURFACE-AT ?auto_34963 ?auto_34965 ) ( CLEAR ?auto_34963 ) ( IS-CRATE ?auto_34968 ) ( not ( = ?auto_34961 ?auto_34963 ) ) ( not ( = ?auto_34962 ?auto_34963 ) ) ( not ( = ?auto_34979 ?auto_34963 ) ) ( not ( = ?auto_34967 ?auto_34963 ) ) ( not ( = ?auto_34972 ?auto_34963 ) ) ( not ( = ?auto_34973 ?auto_34963 ) ) ( not ( = ?auto_34983 ?auto_34963 ) ) ( not ( = ?auto_34966 ?auto_34963 ) ) ( not ( = ?auto_34971 ?auto_34963 ) ) ( not ( = ?auto_34968 ?auto_34963 ) ) ( not ( = ?auto_34982 ?auto_34963 ) ) ( AVAILABLE ?auto_34977 ) ( IN ?auto_34968 ?auto_34974 ) ( TRUCK-AT ?auto_34974 ?auto_34984 ) ( not ( = ?auto_34984 ?auto_34965 ) ) ( not ( = ?auto_34981 ?auto_34984 ) ) ( not ( = ?auto_34964 ?auto_34984 ) ) ( not ( = ?auto_34980 ?auto_34984 ) ) ( not ( = ?auto_34976 ?auto_34984 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34974 ?auto_34984 ?auto_34965 )
      ( MAKE-ON ?auto_34961 ?auto_34962 )
      ( MAKE-ON-VERIFY ?auto_34961 ?auto_34962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34985 - SURFACE
      ?auto_34986 - SURFACE
    )
    :vars
    (
      ?auto_34992 - HOIST
      ?auto_34997 - PLACE
      ?auto_35004 - PLACE
      ?auto_35007 - HOIST
      ?auto_34988 - SURFACE
      ?auto_34999 - SURFACE
      ?auto_34993 - PLACE
      ?auto_34998 - HOIST
      ?auto_35001 - SURFACE
      ?auto_35000 - SURFACE
      ?auto_34991 - PLACE
      ?auto_35003 - HOIST
      ?auto_35006 - SURFACE
      ?auto_34990 - SURFACE
      ?auto_34995 - SURFACE
      ?auto_34989 - SURFACE
      ?auto_35008 - PLACE
      ?auto_34994 - HOIST
      ?auto_35005 - SURFACE
      ?auto_34996 - SURFACE
      ?auto_35002 - TRUCK
      ?auto_34987 - PLACE
      ?auto_35009 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34992 ?auto_34997 ) ( IS-CRATE ?auto_34985 ) ( not ( = ?auto_34985 ?auto_34986 ) ) ( not ( = ?auto_35004 ?auto_34997 ) ) ( HOIST-AT ?auto_35007 ?auto_35004 ) ( not ( = ?auto_34992 ?auto_35007 ) ) ( AVAILABLE ?auto_35007 ) ( SURFACE-AT ?auto_34985 ?auto_35004 ) ( ON ?auto_34985 ?auto_34988 ) ( CLEAR ?auto_34985 ) ( not ( = ?auto_34985 ?auto_34988 ) ) ( not ( = ?auto_34986 ?auto_34988 ) ) ( IS-CRATE ?auto_34986 ) ( not ( = ?auto_34985 ?auto_34999 ) ) ( not ( = ?auto_34986 ?auto_34999 ) ) ( not ( = ?auto_34988 ?auto_34999 ) ) ( not ( = ?auto_34993 ?auto_34997 ) ) ( not ( = ?auto_35004 ?auto_34993 ) ) ( HOIST-AT ?auto_34998 ?auto_34993 ) ( not ( = ?auto_34992 ?auto_34998 ) ) ( not ( = ?auto_35007 ?auto_34998 ) ) ( SURFACE-AT ?auto_34986 ?auto_34993 ) ( ON ?auto_34986 ?auto_35001 ) ( CLEAR ?auto_34986 ) ( not ( = ?auto_34985 ?auto_35001 ) ) ( not ( = ?auto_34986 ?auto_35001 ) ) ( not ( = ?auto_34988 ?auto_35001 ) ) ( not ( = ?auto_34999 ?auto_35001 ) ) ( IS-CRATE ?auto_34999 ) ( not ( = ?auto_34985 ?auto_35000 ) ) ( not ( = ?auto_34986 ?auto_35000 ) ) ( not ( = ?auto_34988 ?auto_35000 ) ) ( not ( = ?auto_34999 ?auto_35000 ) ) ( not ( = ?auto_35001 ?auto_35000 ) ) ( not ( = ?auto_34991 ?auto_34997 ) ) ( not ( = ?auto_35004 ?auto_34991 ) ) ( not ( = ?auto_34993 ?auto_34991 ) ) ( HOIST-AT ?auto_35003 ?auto_34991 ) ( not ( = ?auto_34992 ?auto_35003 ) ) ( not ( = ?auto_35007 ?auto_35003 ) ) ( not ( = ?auto_34998 ?auto_35003 ) ) ( AVAILABLE ?auto_35003 ) ( SURFACE-AT ?auto_34999 ?auto_34991 ) ( ON ?auto_34999 ?auto_35006 ) ( CLEAR ?auto_34999 ) ( not ( = ?auto_34985 ?auto_35006 ) ) ( not ( = ?auto_34986 ?auto_35006 ) ) ( not ( = ?auto_34988 ?auto_35006 ) ) ( not ( = ?auto_34999 ?auto_35006 ) ) ( not ( = ?auto_35001 ?auto_35006 ) ) ( not ( = ?auto_35000 ?auto_35006 ) ) ( IS-CRATE ?auto_35000 ) ( not ( = ?auto_34985 ?auto_34990 ) ) ( not ( = ?auto_34986 ?auto_34990 ) ) ( not ( = ?auto_34988 ?auto_34990 ) ) ( not ( = ?auto_34999 ?auto_34990 ) ) ( not ( = ?auto_35001 ?auto_34990 ) ) ( not ( = ?auto_35000 ?auto_34990 ) ) ( not ( = ?auto_35006 ?auto_34990 ) ) ( AVAILABLE ?auto_34998 ) ( SURFACE-AT ?auto_35000 ?auto_34993 ) ( ON ?auto_35000 ?auto_34995 ) ( CLEAR ?auto_35000 ) ( not ( = ?auto_34985 ?auto_34995 ) ) ( not ( = ?auto_34986 ?auto_34995 ) ) ( not ( = ?auto_34988 ?auto_34995 ) ) ( not ( = ?auto_34999 ?auto_34995 ) ) ( not ( = ?auto_35001 ?auto_34995 ) ) ( not ( = ?auto_35000 ?auto_34995 ) ) ( not ( = ?auto_35006 ?auto_34995 ) ) ( not ( = ?auto_34990 ?auto_34995 ) ) ( IS-CRATE ?auto_34990 ) ( not ( = ?auto_34985 ?auto_34989 ) ) ( not ( = ?auto_34986 ?auto_34989 ) ) ( not ( = ?auto_34988 ?auto_34989 ) ) ( not ( = ?auto_34999 ?auto_34989 ) ) ( not ( = ?auto_35001 ?auto_34989 ) ) ( not ( = ?auto_35000 ?auto_34989 ) ) ( not ( = ?auto_35006 ?auto_34989 ) ) ( not ( = ?auto_34990 ?auto_34989 ) ) ( not ( = ?auto_34995 ?auto_34989 ) ) ( not ( = ?auto_35008 ?auto_34997 ) ) ( not ( = ?auto_35004 ?auto_35008 ) ) ( not ( = ?auto_34993 ?auto_35008 ) ) ( not ( = ?auto_34991 ?auto_35008 ) ) ( HOIST-AT ?auto_34994 ?auto_35008 ) ( not ( = ?auto_34992 ?auto_34994 ) ) ( not ( = ?auto_35007 ?auto_34994 ) ) ( not ( = ?auto_34998 ?auto_34994 ) ) ( not ( = ?auto_35003 ?auto_34994 ) ) ( AVAILABLE ?auto_34994 ) ( SURFACE-AT ?auto_34990 ?auto_35008 ) ( ON ?auto_34990 ?auto_35005 ) ( CLEAR ?auto_34990 ) ( not ( = ?auto_34985 ?auto_35005 ) ) ( not ( = ?auto_34986 ?auto_35005 ) ) ( not ( = ?auto_34988 ?auto_35005 ) ) ( not ( = ?auto_34999 ?auto_35005 ) ) ( not ( = ?auto_35001 ?auto_35005 ) ) ( not ( = ?auto_35000 ?auto_35005 ) ) ( not ( = ?auto_35006 ?auto_35005 ) ) ( not ( = ?auto_34990 ?auto_35005 ) ) ( not ( = ?auto_34995 ?auto_35005 ) ) ( not ( = ?auto_34989 ?auto_35005 ) ) ( SURFACE-AT ?auto_34996 ?auto_34997 ) ( CLEAR ?auto_34996 ) ( IS-CRATE ?auto_34989 ) ( not ( = ?auto_34985 ?auto_34996 ) ) ( not ( = ?auto_34986 ?auto_34996 ) ) ( not ( = ?auto_34988 ?auto_34996 ) ) ( not ( = ?auto_34999 ?auto_34996 ) ) ( not ( = ?auto_35001 ?auto_34996 ) ) ( not ( = ?auto_35000 ?auto_34996 ) ) ( not ( = ?auto_35006 ?auto_34996 ) ) ( not ( = ?auto_34990 ?auto_34996 ) ) ( not ( = ?auto_34995 ?auto_34996 ) ) ( not ( = ?auto_34989 ?auto_34996 ) ) ( not ( = ?auto_35005 ?auto_34996 ) ) ( AVAILABLE ?auto_34992 ) ( TRUCK-AT ?auto_35002 ?auto_34987 ) ( not ( = ?auto_34987 ?auto_34997 ) ) ( not ( = ?auto_35004 ?auto_34987 ) ) ( not ( = ?auto_34993 ?auto_34987 ) ) ( not ( = ?auto_34991 ?auto_34987 ) ) ( not ( = ?auto_35008 ?auto_34987 ) ) ( HOIST-AT ?auto_35009 ?auto_34987 ) ( LIFTING ?auto_35009 ?auto_34989 ) ( not ( = ?auto_34992 ?auto_35009 ) ) ( not ( = ?auto_35007 ?auto_35009 ) ) ( not ( = ?auto_34998 ?auto_35009 ) ) ( not ( = ?auto_35003 ?auto_35009 ) ) ( not ( = ?auto_34994 ?auto_35009 ) ) )
    :subtasks
    ( ( !LOAD ?auto_35009 ?auto_34989 ?auto_35002 ?auto_34987 )
      ( MAKE-ON ?auto_34985 ?auto_34986 )
      ( MAKE-ON-VERIFY ?auto_34985 ?auto_34986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35010 - SURFACE
      ?auto_35011 - SURFACE
    )
    :vars
    (
      ?auto_35017 - HOIST
      ?auto_35033 - PLACE
      ?auto_35026 - PLACE
      ?auto_35030 - HOIST
      ?auto_35021 - SURFACE
      ?auto_35013 - SURFACE
      ?auto_35023 - PLACE
      ?auto_35034 - HOIST
      ?auto_35014 - SURFACE
      ?auto_35031 - SURFACE
      ?auto_35022 - PLACE
      ?auto_35032 - HOIST
      ?auto_35029 - SURFACE
      ?auto_35020 - SURFACE
      ?auto_35016 - SURFACE
      ?auto_35019 - SURFACE
      ?auto_35028 - PLACE
      ?auto_35018 - HOIST
      ?auto_35027 - SURFACE
      ?auto_35024 - SURFACE
      ?auto_35015 - TRUCK
      ?auto_35012 - PLACE
      ?auto_35025 - HOIST
      ?auto_35035 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35017 ?auto_35033 ) ( IS-CRATE ?auto_35010 ) ( not ( = ?auto_35010 ?auto_35011 ) ) ( not ( = ?auto_35026 ?auto_35033 ) ) ( HOIST-AT ?auto_35030 ?auto_35026 ) ( not ( = ?auto_35017 ?auto_35030 ) ) ( AVAILABLE ?auto_35030 ) ( SURFACE-AT ?auto_35010 ?auto_35026 ) ( ON ?auto_35010 ?auto_35021 ) ( CLEAR ?auto_35010 ) ( not ( = ?auto_35010 ?auto_35021 ) ) ( not ( = ?auto_35011 ?auto_35021 ) ) ( IS-CRATE ?auto_35011 ) ( not ( = ?auto_35010 ?auto_35013 ) ) ( not ( = ?auto_35011 ?auto_35013 ) ) ( not ( = ?auto_35021 ?auto_35013 ) ) ( not ( = ?auto_35023 ?auto_35033 ) ) ( not ( = ?auto_35026 ?auto_35023 ) ) ( HOIST-AT ?auto_35034 ?auto_35023 ) ( not ( = ?auto_35017 ?auto_35034 ) ) ( not ( = ?auto_35030 ?auto_35034 ) ) ( SURFACE-AT ?auto_35011 ?auto_35023 ) ( ON ?auto_35011 ?auto_35014 ) ( CLEAR ?auto_35011 ) ( not ( = ?auto_35010 ?auto_35014 ) ) ( not ( = ?auto_35011 ?auto_35014 ) ) ( not ( = ?auto_35021 ?auto_35014 ) ) ( not ( = ?auto_35013 ?auto_35014 ) ) ( IS-CRATE ?auto_35013 ) ( not ( = ?auto_35010 ?auto_35031 ) ) ( not ( = ?auto_35011 ?auto_35031 ) ) ( not ( = ?auto_35021 ?auto_35031 ) ) ( not ( = ?auto_35013 ?auto_35031 ) ) ( not ( = ?auto_35014 ?auto_35031 ) ) ( not ( = ?auto_35022 ?auto_35033 ) ) ( not ( = ?auto_35026 ?auto_35022 ) ) ( not ( = ?auto_35023 ?auto_35022 ) ) ( HOIST-AT ?auto_35032 ?auto_35022 ) ( not ( = ?auto_35017 ?auto_35032 ) ) ( not ( = ?auto_35030 ?auto_35032 ) ) ( not ( = ?auto_35034 ?auto_35032 ) ) ( AVAILABLE ?auto_35032 ) ( SURFACE-AT ?auto_35013 ?auto_35022 ) ( ON ?auto_35013 ?auto_35029 ) ( CLEAR ?auto_35013 ) ( not ( = ?auto_35010 ?auto_35029 ) ) ( not ( = ?auto_35011 ?auto_35029 ) ) ( not ( = ?auto_35021 ?auto_35029 ) ) ( not ( = ?auto_35013 ?auto_35029 ) ) ( not ( = ?auto_35014 ?auto_35029 ) ) ( not ( = ?auto_35031 ?auto_35029 ) ) ( IS-CRATE ?auto_35031 ) ( not ( = ?auto_35010 ?auto_35020 ) ) ( not ( = ?auto_35011 ?auto_35020 ) ) ( not ( = ?auto_35021 ?auto_35020 ) ) ( not ( = ?auto_35013 ?auto_35020 ) ) ( not ( = ?auto_35014 ?auto_35020 ) ) ( not ( = ?auto_35031 ?auto_35020 ) ) ( not ( = ?auto_35029 ?auto_35020 ) ) ( AVAILABLE ?auto_35034 ) ( SURFACE-AT ?auto_35031 ?auto_35023 ) ( ON ?auto_35031 ?auto_35016 ) ( CLEAR ?auto_35031 ) ( not ( = ?auto_35010 ?auto_35016 ) ) ( not ( = ?auto_35011 ?auto_35016 ) ) ( not ( = ?auto_35021 ?auto_35016 ) ) ( not ( = ?auto_35013 ?auto_35016 ) ) ( not ( = ?auto_35014 ?auto_35016 ) ) ( not ( = ?auto_35031 ?auto_35016 ) ) ( not ( = ?auto_35029 ?auto_35016 ) ) ( not ( = ?auto_35020 ?auto_35016 ) ) ( IS-CRATE ?auto_35020 ) ( not ( = ?auto_35010 ?auto_35019 ) ) ( not ( = ?auto_35011 ?auto_35019 ) ) ( not ( = ?auto_35021 ?auto_35019 ) ) ( not ( = ?auto_35013 ?auto_35019 ) ) ( not ( = ?auto_35014 ?auto_35019 ) ) ( not ( = ?auto_35031 ?auto_35019 ) ) ( not ( = ?auto_35029 ?auto_35019 ) ) ( not ( = ?auto_35020 ?auto_35019 ) ) ( not ( = ?auto_35016 ?auto_35019 ) ) ( not ( = ?auto_35028 ?auto_35033 ) ) ( not ( = ?auto_35026 ?auto_35028 ) ) ( not ( = ?auto_35023 ?auto_35028 ) ) ( not ( = ?auto_35022 ?auto_35028 ) ) ( HOIST-AT ?auto_35018 ?auto_35028 ) ( not ( = ?auto_35017 ?auto_35018 ) ) ( not ( = ?auto_35030 ?auto_35018 ) ) ( not ( = ?auto_35034 ?auto_35018 ) ) ( not ( = ?auto_35032 ?auto_35018 ) ) ( AVAILABLE ?auto_35018 ) ( SURFACE-AT ?auto_35020 ?auto_35028 ) ( ON ?auto_35020 ?auto_35027 ) ( CLEAR ?auto_35020 ) ( not ( = ?auto_35010 ?auto_35027 ) ) ( not ( = ?auto_35011 ?auto_35027 ) ) ( not ( = ?auto_35021 ?auto_35027 ) ) ( not ( = ?auto_35013 ?auto_35027 ) ) ( not ( = ?auto_35014 ?auto_35027 ) ) ( not ( = ?auto_35031 ?auto_35027 ) ) ( not ( = ?auto_35029 ?auto_35027 ) ) ( not ( = ?auto_35020 ?auto_35027 ) ) ( not ( = ?auto_35016 ?auto_35027 ) ) ( not ( = ?auto_35019 ?auto_35027 ) ) ( SURFACE-AT ?auto_35024 ?auto_35033 ) ( CLEAR ?auto_35024 ) ( IS-CRATE ?auto_35019 ) ( not ( = ?auto_35010 ?auto_35024 ) ) ( not ( = ?auto_35011 ?auto_35024 ) ) ( not ( = ?auto_35021 ?auto_35024 ) ) ( not ( = ?auto_35013 ?auto_35024 ) ) ( not ( = ?auto_35014 ?auto_35024 ) ) ( not ( = ?auto_35031 ?auto_35024 ) ) ( not ( = ?auto_35029 ?auto_35024 ) ) ( not ( = ?auto_35020 ?auto_35024 ) ) ( not ( = ?auto_35016 ?auto_35024 ) ) ( not ( = ?auto_35019 ?auto_35024 ) ) ( not ( = ?auto_35027 ?auto_35024 ) ) ( AVAILABLE ?auto_35017 ) ( TRUCK-AT ?auto_35015 ?auto_35012 ) ( not ( = ?auto_35012 ?auto_35033 ) ) ( not ( = ?auto_35026 ?auto_35012 ) ) ( not ( = ?auto_35023 ?auto_35012 ) ) ( not ( = ?auto_35022 ?auto_35012 ) ) ( not ( = ?auto_35028 ?auto_35012 ) ) ( HOIST-AT ?auto_35025 ?auto_35012 ) ( not ( = ?auto_35017 ?auto_35025 ) ) ( not ( = ?auto_35030 ?auto_35025 ) ) ( not ( = ?auto_35034 ?auto_35025 ) ) ( not ( = ?auto_35032 ?auto_35025 ) ) ( not ( = ?auto_35018 ?auto_35025 ) ) ( AVAILABLE ?auto_35025 ) ( SURFACE-AT ?auto_35019 ?auto_35012 ) ( ON ?auto_35019 ?auto_35035 ) ( CLEAR ?auto_35019 ) ( not ( = ?auto_35010 ?auto_35035 ) ) ( not ( = ?auto_35011 ?auto_35035 ) ) ( not ( = ?auto_35021 ?auto_35035 ) ) ( not ( = ?auto_35013 ?auto_35035 ) ) ( not ( = ?auto_35014 ?auto_35035 ) ) ( not ( = ?auto_35031 ?auto_35035 ) ) ( not ( = ?auto_35029 ?auto_35035 ) ) ( not ( = ?auto_35020 ?auto_35035 ) ) ( not ( = ?auto_35016 ?auto_35035 ) ) ( not ( = ?auto_35019 ?auto_35035 ) ) ( not ( = ?auto_35027 ?auto_35035 ) ) ( not ( = ?auto_35024 ?auto_35035 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35025 ?auto_35019 ?auto_35035 ?auto_35012 )
      ( MAKE-ON ?auto_35010 ?auto_35011 )
      ( MAKE-ON-VERIFY ?auto_35010 ?auto_35011 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35036 - SURFACE
      ?auto_35037 - SURFACE
    )
    :vars
    (
      ?auto_35056 - HOIST
      ?auto_35038 - PLACE
      ?auto_35040 - PLACE
      ?auto_35049 - HOIST
      ?auto_35044 - SURFACE
      ?auto_35041 - SURFACE
      ?auto_35060 - PLACE
      ?auto_35039 - HOIST
      ?auto_35057 - SURFACE
      ?auto_35042 - SURFACE
      ?auto_35045 - PLACE
      ?auto_35043 - HOIST
      ?auto_35048 - SURFACE
      ?auto_35055 - SURFACE
      ?auto_35058 - SURFACE
      ?auto_35053 - SURFACE
      ?auto_35050 - PLACE
      ?auto_35052 - HOIST
      ?auto_35046 - SURFACE
      ?auto_35061 - SURFACE
      ?auto_35047 - PLACE
      ?auto_35054 - HOIST
      ?auto_35051 - SURFACE
      ?auto_35059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35056 ?auto_35038 ) ( IS-CRATE ?auto_35036 ) ( not ( = ?auto_35036 ?auto_35037 ) ) ( not ( = ?auto_35040 ?auto_35038 ) ) ( HOIST-AT ?auto_35049 ?auto_35040 ) ( not ( = ?auto_35056 ?auto_35049 ) ) ( AVAILABLE ?auto_35049 ) ( SURFACE-AT ?auto_35036 ?auto_35040 ) ( ON ?auto_35036 ?auto_35044 ) ( CLEAR ?auto_35036 ) ( not ( = ?auto_35036 ?auto_35044 ) ) ( not ( = ?auto_35037 ?auto_35044 ) ) ( IS-CRATE ?auto_35037 ) ( not ( = ?auto_35036 ?auto_35041 ) ) ( not ( = ?auto_35037 ?auto_35041 ) ) ( not ( = ?auto_35044 ?auto_35041 ) ) ( not ( = ?auto_35060 ?auto_35038 ) ) ( not ( = ?auto_35040 ?auto_35060 ) ) ( HOIST-AT ?auto_35039 ?auto_35060 ) ( not ( = ?auto_35056 ?auto_35039 ) ) ( not ( = ?auto_35049 ?auto_35039 ) ) ( SURFACE-AT ?auto_35037 ?auto_35060 ) ( ON ?auto_35037 ?auto_35057 ) ( CLEAR ?auto_35037 ) ( not ( = ?auto_35036 ?auto_35057 ) ) ( not ( = ?auto_35037 ?auto_35057 ) ) ( not ( = ?auto_35044 ?auto_35057 ) ) ( not ( = ?auto_35041 ?auto_35057 ) ) ( IS-CRATE ?auto_35041 ) ( not ( = ?auto_35036 ?auto_35042 ) ) ( not ( = ?auto_35037 ?auto_35042 ) ) ( not ( = ?auto_35044 ?auto_35042 ) ) ( not ( = ?auto_35041 ?auto_35042 ) ) ( not ( = ?auto_35057 ?auto_35042 ) ) ( not ( = ?auto_35045 ?auto_35038 ) ) ( not ( = ?auto_35040 ?auto_35045 ) ) ( not ( = ?auto_35060 ?auto_35045 ) ) ( HOIST-AT ?auto_35043 ?auto_35045 ) ( not ( = ?auto_35056 ?auto_35043 ) ) ( not ( = ?auto_35049 ?auto_35043 ) ) ( not ( = ?auto_35039 ?auto_35043 ) ) ( AVAILABLE ?auto_35043 ) ( SURFACE-AT ?auto_35041 ?auto_35045 ) ( ON ?auto_35041 ?auto_35048 ) ( CLEAR ?auto_35041 ) ( not ( = ?auto_35036 ?auto_35048 ) ) ( not ( = ?auto_35037 ?auto_35048 ) ) ( not ( = ?auto_35044 ?auto_35048 ) ) ( not ( = ?auto_35041 ?auto_35048 ) ) ( not ( = ?auto_35057 ?auto_35048 ) ) ( not ( = ?auto_35042 ?auto_35048 ) ) ( IS-CRATE ?auto_35042 ) ( not ( = ?auto_35036 ?auto_35055 ) ) ( not ( = ?auto_35037 ?auto_35055 ) ) ( not ( = ?auto_35044 ?auto_35055 ) ) ( not ( = ?auto_35041 ?auto_35055 ) ) ( not ( = ?auto_35057 ?auto_35055 ) ) ( not ( = ?auto_35042 ?auto_35055 ) ) ( not ( = ?auto_35048 ?auto_35055 ) ) ( AVAILABLE ?auto_35039 ) ( SURFACE-AT ?auto_35042 ?auto_35060 ) ( ON ?auto_35042 ?auto_35058 ) ( CLEAR ?auto_35042 ) ( not ( = ?auto_35036 ?auto_35058 ) ) ( not ( = ?auto_35037 ?auto_35058 ) ) ( not ( = ?auto_35044 ?auto_35058 ) ) ( not ( = ?auto_35041 ?auto_35058 ) ) ( not ( = ?auto_35057 ?auto_35058 ) ) ( not ( = ?auto_35042 ?auto_35058 ) ) ( not ( = ?auto_35048 ?auto_35058 ) ) ( not ( = ?auto_35055 ?auto_35058 ) ) ( IS-CRATE ?auto_35055 ) ( not ( = ?auto_35036 ?auto_35053 ) ) ( not ( = ?auto_35037 ?auto_35053 ) ) ( not ( = ?auto_35044 ?auto_35053 ) ) ( not ( = ?auto_35041 ?auto_35053 ) ) ( not ( = ?auto_35057 ?auto_35053 ) ) ( not ( = ?auto_35042 ?auto_35053 ) ) ( not ( = ?auto_35048 ?auto_35053 ) ) ( not ( = ?auto_35055 ?auto_35053 ) ) ( not ( = ?auto_35058 ?auto_35053 ) ) ( not ( = ?auto_35050 ?auto_35038 ) ) ( not ( = ?auto_35040 ?auto_35050 ) ) ( not ( = ?auto_35060 ?auto_35050 ) ) ( not ( = ?auto_35045 ?auto_35050 ) ) ( HOIST-AT ?auto_35052 ?auto_35050 ) ( not ( = ?auto_35056 ?auto_35052 ) ) ( not ( = ?auto_35049 ?auto_35052 ) ) ( not ( = ?auto_35039 ?auto_35052 ) ) ( not ( = ?auto_35043 ?auto_35052 ) ) ( AVAILABLE ?auto_35052 ) ( SURFACE-AT ?auto_35055 ?auto_35050 ) ( ON ?auto_35055 ?auto_35046 ) ( CLEAR ?auto_35055 ) ( not ( = ?auto_35036 ?auto_35046 ) ) ( not ( = ?auto_35037 ?auto_35046 ) ) ( not ( = ?auto_35044 ?auto_35046 ) ) ( not ( = ?auto_35041 ?auto_35046 ) ) ( not ( = ?auto_35057 ?auto_35046 ) ) ( not ( = ?auto_35042 ?auto_35046 ) ) ( not ( = ?auto_35048 ?auto_35046 ) ) ( not ( = ?auto_35055 ?auto_35046 ) ) ( not ( = ?auto_35058 ?auto_35046 ) ) ( not ( = ?auto_35053 ?auto_35046 ) ) ( SURFACE-AT ?auto_35061 ?auto_35038 ) ( CLEAR ?auto_35061 ) ( IS-CRATE ?auto_35053 ) ( not ( = ?auto_35036 ?auto_35061 ) ) ( not ( = ?auto_35037 ?auto_35061 ) ) ( not ( = ?auto_35044 ?auto_35061 ) ) ( not ( = ?auto_35041 ?auto_35061 ) ) ( not ( = ?auto_35057 ?auto_35061 ) ) ( not ( = ?auto_35042 ?auto_35061 ) ) ( not ( = ?auto_35048 ?auto_35061 ) ) ( not ( = ?auto_35055 ?auto_35061 ) ) ( not ( = ?auto_35058 ?auto_35061 ) ) ( not ( = ?auto_35053 ?auto_35061 ) ) ( not ( = ?auto_35046 ?auto_35061 ) ) ( AVAILABLE ?auto_35056 ) ( not ( = ?auto_35047 ?auto_35038 ) ) ( not ( = ?auto_35040 ?auto_35047 ) ) ( not ( = ?auto_35060 ?auto_35047 ) ) ( not ( = ?auto_35045 ?auto_35047 ) ) ( not ( = ?auto_35050 ?auto_35047 ) ) ( HOIST-AT ?auto_35054 ?auto_35047 ) ( not ( = ?auto_35056 ?auto_35054 ) ) ( not ( = ?auto_35049 ?auto_35054 ) ) ( not ( = ?auto_35039 ?auto_35054 ) ) ( not ( = ?auto_35043 ?auto_35054 ) ) ( not ( = ?auto_35052 ?auto_35054 ) ) ( AVAILABLE ?auto_35054 ) ( SURFACE-AT ?auto_35053 ?auto_35047 ) ( ON ?auto_35053 ?auto_35051 ) ( CLEAR ?auto_35053 ) ( not ( = ?auto_35036 ?auto_35051 ) ) ( not ( = ?auto_35037 ?auto_35051 ) ) ( not ( = ?auto_35044 ?auto_35051 ) ) ( not ( = ?auto_35041 ?auto_35051 ) ) ( not ( = ?auto_35057 ?auto_35051 ) ) ( not ( = ?auto_35042 ?auto_35051 ) ) ( not ( = ?auto_35048 ?auto_35051 ) ) ( not ( = ?auto_35055 ?auto_35051 ) ) ( not ( = ?auto_35058 ?auto_35051 ) ) ( not ( = ?auto_35053 ?auto_35051 ) ) ( not ( = ?auto_35046 ?auto_35051 ) ) ( not ( = ?auto_35061 ?auto_35051 ) ) ( TRUCK-AT ?auto_35059 ?auto_35038 ) )
    :subtasks
    ( ( !DRIVE ?auto_35059 ?auto_35038 ?auto_35047 )
      ( MAKE-ON ?auto_35036 ?auto_35037 )
      ( MAKE-ON-VERIFY ?auto_35036 ?auto_35037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35062 - SURFACE
      ?auto_35063 - SURFACE
    )
    :vars
    (
      ?auto_35080 - HOIST
      ?auto_35067 - PLACE
      ?auto_35071 - PLACE
      ?auto_35075 - HOIST
      ?auto_35072 - SURFACE
      ?auto_35086 - SURFACE
      ?auto_35070 - PLACE
      ?auto_35083 - HOIST
      ?auto_35087 - SURFACE
      ?auto_35064 - SURFACE
      ?auto_35065 - PLACE
      ?auto_35076 - HOIST
      ?auto_35081 - SURFACE
      ?auto_35079 - SURFACE
      ?auto_35082 - SURFACE
      ?auto_35085 - SURFACE
      ?auto_35068 - PLACE
      ?auto_35084 - HOIST
      ?auto_35073 - SURFACE
      ?auto_35077 - SURFACE
      ?auto_35066 - PLACE
      ?auto_35078 - HOIST
      ?auto_35074 - SURFACE
      ?auto_35069 - TRUCK
      ?auto_35088 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35080 ?auto_35067 ) ( IS-CRATE ?auto_35062 ) ( not ( = ?auto_35062 ?auto_35063 ) ) ( not ( = ?auto_35071 ?auto_35067 ) ) ( HOIST-AT ?auto_35075 ?auto_35071 ) ( not ( = ?auto_35080 ?auto_35075 ) ) ( AVAILABLE ?auto_35075 ) ( SURFACE-AT ?auto_35062 ?auto_35071 ) ( ON ?auto_35062 ?auto_35072 ) ( CLEAR ?auto_35062 ) ( not ( = ?auto_35062 ?auto_35072 ) ) ( not ( = ?auto_35063 ?auto_35072 ) ) ( IS-CRATE ?auto_35063 ) ( not ( = ?auto_35062 ?auto_35086 ) ) ( not ( = ?auto_35063 ?auto_35086 ) ) ( not ( = ?auto_35072 ?auto_35086 ) ) ( not ( = ?auto_35070 ?auto_35067 ) ) ( not ( = ?auto_35071 ?auto_35070 ) ) ( HOIST-AT ?auto_35083 ?auto_35070 ) ( not ( = ?auto_35080 ?auto_35083 ) ) ( not ( = ?auto_35075 ?auto_35083 ) ) ( SURFACE-AT ?auto_35063 ?auto_35070 ) ( ON ?auto_35063 ?auto_35087 ) ( CLEAR ?auto_35063 ) ( not ( = ?auto_35062 ?auto_35087 ) ) ( not ( = ?auto_35063 ?auto_35087 ) ) ( not ( = ?auto_35072 ?auto_35087 ) ) ( not ( = ?auto_35086 ?auto_35087 ) ) ( IS-CRATE ?auto_35086 ) ( not ( = ?auto_35062 ?auto_35064 ) ) ( not ( = ?auto_35063 ?auto_35064 ) ) ( not ( = ?auto_35072 ?auto_35064 ) ) ( not ( = ?auto_35086 ?auto_35064 ) ) ( not ( = ?auto_35087 ?auto_35064 ) ) ( not ( = ?auto_35065 ?auto_35067 ) ) ( not ( = ?auto_35071 ?auto_35065 ) ) ( not ( = ?auto_35070 ?auto_35065 ) ) ( HOIST-AT ?auto_35076 ?auto_35065 ) ( not ( = ?auto_35080 ?auto_35076 ) ) ( not ( = ?auto_35075 ?auto_35076 ) ) ( not ( = ?auto_35083 ?auto_35076 ) ) ( AVAILABLE ?auto_35076 ) ( SURFACE-AT ?auto_35086 ?auto_35065 ) ( ON ?auto_35086 ?auto_35081 ) ( CLEAR ?auto_35086 ) ( not ( = ?auto_35062 ?auto_35081 ) ) ( not ( = ?auto_35063 ?auto_35081 ) ) ( not ( = ?auto_35072 ?auto_35081 ) ) ( not ( = ?auto_35086 ?auto_35081 ) ) ( not ( = ?auto_35087 ?auto_35081 ) ) ( not ( = ?auto_35064 ?auto_35081 ) ) ( IS-CRATE ?auto_35064 ) ( not ( = ?auto_35062 ?auto_35079 ) ) ( not ( = ?auto_35063 ?auto_35079 ) ) ( not ( = ?auto_35072 ?auto_35079 ) ) ( not ( = ?auto_35086 ?auto_35079 ) ) ( not ( = ?auto_35087 ?auto_35079 ) ) ( not ( = ?auto_35064 ?auto_35079 ) ) ( not ( = ?auto_35081 ?auto_35079 ) ) ( AVAILABLE ?auto_35083 ) ( SURFACE-AT ?auto_35064 ?auto_35070 ) ( ON ?auto_35064 ?auto_35082 ) ( CLEAR ?auto_35064 ) ( not ( = ?auto_35062 ?auto_35082 ) ) ( not ( = ?auto_35063 ?auto_35082 ) ) ( not ( = ?auto_35072 ?auto_35082 ) ) ( not ( = ?auto_35086 ?auto_35082 ) ) ( not ( = ?auto_35087 ?auto_35082 ) ) ( not ( = ?auto_35064 ?auto_35082 ) ) ( not ( = ?auto_35081 ?auto_35082 ) ) ( not ( = ?auto_35079 ?auto_35082 ) ) ( IS-CRATE ?auto_35079 ) ( not ( = ?auto_35062 ?auto_35085 ) ) ( not ( = ?auto_35063 ?auto_35085 ) ) ( not ( = ?auto_35072 ?auto_35085 ) ) ( not ( = ?auto_35086 ?auto_35085 ) ) ( not ( = ?auto_35087 ?auto_35085 ) ) ( not ( = ?auto_35064 ?auto_35085 ) ) ( not ( = ?auto_35081 ?auto_35085 ) ) ( not ( = ?auto_35079 ?auto_35085 ) ) ( not ( = ?auto_35082 ?auto_35085 ) ) ( not ( = ?auto_35068 ?auto_35067 ) ) ( not ( = ?auto_35071 ?auto_35068 ) ) ( not ( = ?auto_35070 ?auto_35068 ) ) ( not ( = ?auto_35065 ?auto_35068 ) ) ( HOIST-AT ?auto_35084 ?auto_35068 ) ( not ( = ?auto_35080 ?auto_35084 ) ) ( not ( = ?auto_35075 ?auto_35084 ) ) ( not ( = ?auto_35083 ?auto_35084 ) ) ( not ( = ?auto_35076 ?auto_35084 ) ) ( AVAILABLE ?auto_35084 ) ( SURFACE-AT ?auto_35079 ?auto_35068 ) ( ON ?auto_35079 ?auto_35073 ) ( CLEAR ?auto_35079 ) ( not ( = ?auto_35062 ?auto_35073 ) ) ( not ( = ?auto_35063 ?auto_35073 ) ) ( not ( = ?auto_35072 ?auto_35073 ) ) ( not ( = ?auto_35086 ?auto_35073 ) ) ( not ( = ?auto_35087 ?auto_35073 ) ) ( not ( = ?auto_35064 ?auto_35073 ) ) ( not ( = ?auto_35081 ?auto_35073 ) ) ( not ( = ?auto_35079 ?auto_35073 ) ) ( not ( = ?auto_35082 ?auto_35073 ) ) ( not ( = ?auto_35085 ?auto_35073 ) ) ( IS-CRATE ?auto_35085 ) ( not ( = ?auto_35062 ?auto_35077 ) ) ( not ( = ?auto_35063 ?auto_35077 ) ) ( not ( = ?auto_35072 ?auto_35077 ) ) ( not ( = ?auto_35086 ?auto_35077 ) ) ( not ( = ?auto_35087 ?auto_35077 ) ) ( not ( = ?auto_35064 ?auto_35077 ) ) ( not ( = ?auto_35081 ?auto_35077 ) ) ( not ( = ?auto_35079 ?auto_35077 ) ) ( not ( = ?auto_35082 ?auto_35077 ) ) ( not ( = ?auto_35085 ?auto_35077 ) ) ( not ( = ?auto_35073 ?auto_35077 ) ) ( not ( = ?auto_35066 ?auto_35067 ) ) ( not ( = ?auto_35071 ?auto_35066 ) ) ( not ( = ?auto_35070 ?auto_35066 ) ) ( not ( = ?auto_35065 ?auto_35066 ) ) ( not ( = ?auto_35068 ?auto_35066 ) ) ( HOIST-AT ?auto_35078 ?auto_35066 ) ( not ( = ?auto_35080 ?auto_35078 ) ) ( not ( = ?auto_35075 ?auto_35078 ) ) ( not ( = ?auto_35083 ?auto_35078 ) ) ( not ( = ?auto_35076 ?auto_35078 ) ) ( not ( = ?auto_35084 ?auto_35078 ) ) ( AVAILABLE ?auto_35078 ) ( SURFACE-AT ?auto_35085 ?auto_35066 ) ( ON ?auto_35085 ?auto_35074 ) ( CLEAR ?auto_35085 ) ( not ( = ?auto_35062 ?auto_35074 ) ) ( not ( = ?auto_35063 ?auto_35074 ) ) ( not ( = ?auto_35072 ?auto_35074 ) ) ( not ( = ?auto_35086 ?auto_35074 ) ) ( not ( = ?auto_35087 ?auto_35074 ) ) ( not ( = ?auto_35064 ?auto_35074 ) ) ( not ( = ?auto_35081 ?auto_35074 ) ) ( not ( = ?auto_35079 ?auto_35074 ) ) ( not ( = ?auto_35082 ?auto_35074 ) ) ( not ( = ?auto_35085 ?auto_35074 ) ) ( not ( = ?auto_35073 ?auto_35074 ) ) ( not ( = ?auto_35077 ?auto_35074 ) ) ( TRUCK-AT ?auto_35069 ?auto_35067 ) ( SURFACE-AT ?auto_35088 ?auto_35067 ) ( CLEAR ?auto_35088 ) ( LIFTING ?auto_35080 ?auto_35077 ) ( IS-CRATE ?auto_35077 ) ( not ( = ?auto_35062 ?auto_35088 ) ) ( not ( = ?auto_35063 ?auto_35088 ) ) ( not ( = ?auto_35072 ?auto_35088 ) ) ( not ( = ?auto_35086 ?auto_35088 ) ) ( not ( = ?auto_35087 ?auto_35088 ) ) ( not ( = ?auto_35064 ?auto_35088 ) ) ( not ( = ?auto_35081 ?auto_35088 ) ) ( not ( = ?auto_35079 ?auto_35088 ) ) ( not ( = ?auto_35082 ?auto_35088 ) ) ( not ( = ?auto_35085 ?auto_35088 ) ) ( not ( = ?auto_35073 ?auto_35088 ) ) ( not ( = ?auto_35077 ?auto_35088 ) ) ( not ( = ?auto_35074 ?auto_35088 ) ) )
    :subtasks
    ( ( !DROP ?auto_35080 ?auto_35077 ?auto_35088 ?auto_35067 )
      ( MAKE-ON ?auto_35062 ?auto_35063 )
      ( MAKE-ON-VERIFY ?auto_35062 ?auto_35063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35089 - SURFACE
      ?auto_35090 - SURFACE
    )
    :vars
    (
      ?auto_35098 - HOIST
      ?auto_35103 - PLACE
      ?auto_35112 - PLACE
      ?auto_35110 - HOIST
      ?auto_35107 - SURFACE
      ?auto_35092 - SURFACE
      ?auto_35095 - PLACE
      ?auto_35099 - HOIST
      ?auto_35097 - SURFACE
      ?auto_35108 - SURFACE
      ?auto_35106 - PLACE
      ?auto_35096 - HOIST
      ?auto_35094 - SURFACE
      ?auto_35091 - SURFACE
      ?auto_35093 - SURFACE
      ?auto_35101 - SURFACE
      ?auto_35105 - PLACE
      ?auto_35100 - HOIST
      ?auto_35113 - SURFACE
      ?auto_35111 - SURFACE
      ?auto_35114 - PLACE
      ?auto_35104 - HOIST
      ?auto_35102 - SURFACE
      ?auto_35115 - TRUCK
      ?auto_35109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35098 ?auto_35103 ) ( IS-CRATE ?auto_35089 ) ( not ( = ?auto_35089 ?auto_35090 ) ) ( not ( = ?auto_35112 ?auto_35103 ) ) ( HOIST-AT ?auto_35110 ?auto_35112 ) ( not ( = ?auto_35098 ?auto_35110 ) ) ( AVAILABLE ?auto_35110 ) ( SURFACE-AT ?auto_35089 ?auto_35112 ) ( ON ?auto_35089 ?auto_35107 ) ( CLEAR ?auto_35089 ) ( not ( = ?auto_35089 ?auto_35107 ) ) ( not ( = ?auto_35090 ?auto_35107 ) ) ( IS-CRATE ?auto_35090 ) ( not ( = ?auto_35089 ?auto_35092 ) ) ( not ( = ?auto_35090 ?auto_35092 ) ) ( not ( = ?auto_35107 ?auto_35092 ) ) ( not ( = ?auto_35095 ?auto_35103 ) ) ( not ( = ?auto_35112 ?auto_35095 ) ) ( HOIST-AT ?auto_35099 ?auto_35095 ) ( not ( = ?auto_35098 ?auto_35099 ) ) ( not ( = ?auto_35110 ?auto_35099 ) ) ( SURFACE-AT ?auto_35090 ?auto_35095 ) ( ON ?auto_35090 ?auto_35097 ) ( CLEAR ?auto_35090 ) ( not ( = ?auto_35089 ?auto_35097 ) ) ( not ( = ?auto_35090 ?auto_35097 ) ) ( not ( = ?auto_35107 ?auto_35097 ) ) ( not ( = ?auto_35092 ?auto_35097 ) ) ( IS-CRATE ?auto_35092 ) ( not ( = ?auto_35089 ?auto_35108 ) ) ( not ( = ?auto_35090 ?auto_35108 ) ) ( not ( = ?auto_35107 ?auto_35108 ) ) ( not ( = ?auto_35092 ?auto_35108 ) ) ( not ( = ?auto_35097 ?auto_35108 ) ) ( not ( = ?auto_35106 ?auto_35103 ) ) ( not ( = ?auto_35112 ?auto_35106 ) ) ( not ( = ?auto_35095 ?auto_35106 ) ) ( HOIST-AT ?auto_35096 ?auto_35106 ) ( not ( = ?auto_35098 ?auto_35096 ) ) ( not ( = ?auto_35110 ?auto_35096 ) ) ( not ( = ?auto_35099 ?auto_35096 ) ) ( AVAILABLE ?auto_35096 ) ( SURFACE-AT ?auto_35092 ?auto_35106 ) ( ON ?auto_35092 ?auto_35094 ) ( CLEAR ?auto_35092 ) ( not ( = ?auto_35089 ?auto_35094 ) ) ( not ( = ?auto_35090 ?auto_35094 ) ) ( not ( = ?auto_35107 ?auto_35094 ) ) ( not ( = ?auto_35092 ?auto_35094 ) ) ( not ( = ?auto_35097 ?auto_35094 ) ) ( not ( = ?auto_35108 ?auto_35094 ) ) ( IS-CRATE ?auto_35108 ) ( not ( = ?auto_35089 ?auto_35091 ) ) ( not ( = ?auto_35090 ?auto_35091 ) ) ( not ( = ?auto_35107 ?auto_35091 ) ) ( not ( = ?auto_35092 ?auto_35091 ) ) ( not ( = ?auto_35097 ?auto_35091 ) ) ( not ( = ?auto_35108 ?auto_35091 ) ) ( not ( = ?auto_35094 ?auto_35091 ) ) ( AVAILABLE ?auto_35099 ) ( SURFACE-AT ?auto_35108 ?auto_35095 ) ( ON ?auto_35108 ?auto_35093 ) ( CLEAR ?auto_35108 ) ( not ( = ?auto_35089 ?auto_35093 ) ) ( not ( = ?auto_35090 ?auto_35093 ) ) ( not ( = ?auto_35107 ?auto_35093 ) ) ( not ( = ?auto_35092 ?auto_35093 ) ) ( not ( = ?auto_35097 ?auto_35093 ) ) ( not ( = ?auto_35108 ?auto_35093 ) ) ( not ( = ?auto_35094 ?auto_35093 ) ) ( not ( = ?auto_35091 ?auto_35093 ) ) ( IS-CRATE ?auto_35091 ) ( not ( = ?auto_35089 ?auto_35101 ) ) ( not ( = ?auto_35090 ?auto_35101 ) ) ( not ( = ?auto_35107 ?auto_35101 ) ) ( not ( = ?auto_35092 ?auto_35101 ) ) ( not ( = ?auto_35097 ?auto_35101 ) ) ( not ( = ?auto_35108 ?auto_35101 ) ) ( not ( = ?auto_35094 ?auto_35101 ) ) ( not ( = ?auto_35091 ?auto_35101 ) ) ( not ( = ?auto_35093 ?auto_35101 ) ) ( not ( = ?auto_35105 ?auto_35103 ) ) ( not ( = ?auto_35112 ?auto_35105 ) ) ( not ( = ?auto_35095 ?auto_35105 ) ) ( not ( = ?auto_35106 ?auto_35105 ) ) ( HOIST-AT ?auto_35100 ?auto_35105 ) ( not ( = ?auto_35098 ?auto_35100 ) ) ( not ( = ?auto_35110 ?auto_35100 ) ) ( not ( = ?auto_35099 ?auto_35100 ) ) ( not ( = ?auto_35096 ?auto_35100 ) ) ( AVAILABLE ?auto_35100 ) ( SURFACE-AT ?auto_35091 ?auto_35105 ) ( ON ?auto_35091 ?auto_35113 ) ( CLEAR ?auto_35091 ) ( not ( = ?auto_35089 ?auto_35113 ) ) ( not ( = ?auto_35090 ?auto_35113 ) ) ( not ( = ?auto_35107 ?auto_35113 ) ) ( not ( = ?auto_35092 ?auto_35113 ) ) ( not ( = ?auto_35097 ?auto_35113 ) ) ( not ( = ?auto_35108 ?auto_35113 ) ) ( not ( = ?auto_35094 ?auto_35113 ) ) ( not ( = ?auto_35091 ?auto_35113 ) ) ( not ( = ?auto_35093 ?auto_35113 ) ) ( not ( = ?auto_35101 ?auto_35113 ) ) ( IS-CRATE ?auto_35101 ) ( not ( = ?auto_35089 ?auto_35111 ) ) ( not ( = ?auto_35090 ?auto_35111 ) ) ( not ( = ?auto_35107 ?auto_35111 ) ) ( not ( = ?auto_35092 ?auto_35111 ) ) ( not ( = ?auto_35097 ?auto_35111 ) ) ( not ( = ?auto_35108 ?auto_35111 ) ) ( not ( = ?auto_35094 ?auto_35111 ) ) ( not ( = ?auto_35091 ?auto_35111 ) ) ( not ( = ?auto_35093 ?auto_35111 ) ) ( not ( = ?auto_35101 ?auto_35111 ) ) ( not ( = ?auto_35113 ?auto_35111 ) ) ( not ( = ?auto_35114 ?auto_35103 ) ) ( not ( = ?auto_35112 ?auto_35114 ) ) ( not ( = ?auto_35095 ?auto_35114 ) ) ( not ( = ?auto_35106 ?auto_35114 ) ) ( not ( = ?auto_35105 ?auto_35114 ) ) ( HOIST-AT ?auto_35104 ?auto_35114 ) ( not ( = ?auto_35098 ?auto_35104 ) ) ( not ( = ?auto_35110 ?auto_35104 ) ) ( not ( = ?auto_35099 ?auto_35104 ) ) ( not ( = ?auto_35096 ?auto_35104 ) ) ( not ( = ?auto_35100 ?auto_35104 ) ) ( AVAILABLE ?auto_35104 ) ( SURFACE-AT ?auto_35101 ?auto_35114 ) ( ON ?auto_35101 ?auto_35102 ) ( CLEAR ?auto_35101 ) ( not ( = ?auto_35089 ?auto_35102 ) ) ( not ( = ?auto_35090 ?auto_35102 ) ) ( not ( = ?auto_35107 ?auto_35102 ) ) ( not ( = ?auto_35092 ?auto_35102 ) ) ( not ( = ?auto_35097 ?auto_35102 ) ) ( not ( = ?auto_35108 ?auto_35102 ) ) ( not ( = ?auto_35094 ?auto_35102 ) ) ( not ( = ?auto_35091 ?auto_35102 ) ) ( not ( = ?auto_35093 ?auto_35102 ) ) ( not ( = ?auto_35101 ?auto_35102 ) ) ( not ( = ?auto_35113 ?auto_35102 ) ) ( not ( = ?auto_35111 ?auto_35102 ) ) ( TRUCK-AT ?auto_35115 ?auto_35103 ) ( SURFACE-AT ?auto_35109 ?auto_35103 ) ( CLEAR ?auto_35109 ) ( IS-CRATE ?auto_35111 ) ( not ( = ?auto_35089 ?auto_35109 ) ) ( not ( = ?auto_35090 ?auto_35109 ) ) ( not ( = ?auto_35107 ?auto_35109 ) ) ( not ( = ?auto_35092 ?auto_35109 ) ) ( not ( = ?auto_35097 ?auto_35109 ) ) ( not ( = ?auto_35108 ?auto_35109 ) ) ( not ( = ?auto_35094 ?auto_35109 ) ) ( not ( = ?auto_35091 ?auto_35109 ) ) ( not ( = ?auto_35093 ?auto_35109 ) ) ( not ( = ?auto_35101 ?auto_35109 ) ) ( not ( = ?auto_35113 ?auto_35109 ) ) ( not ( = ?auto_35111 ?auto_35109 ) ) ( not ( = ?auto_35102 ?auto_35109 ) ) ( AVAILABLE ?auto_35098 ) ( IN ?auto_35111 ?auto_35115 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35098 ?auto_35111 ?auto_35115 ?auto_35103 )
      ( MAKE-ON ?auto_35089 ?auto_35090 )
      ( MAKE-ON-VERIFY ?auto_35089 ?auto_35090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35116 - SURFACE
      ?auto_35117 - SURFACE
    )
    :vars
    (
      ?auto_35142 - HOIST
      ?auto_35140 - PLACE
      ?auto_35134 - PLACE
      ?auto_35132 - HOIST
      ?auto_35129 - SURFACE
      ?auto_35124 - SURFACE
      ?auto_35137 - PLACE
      ?auto_35138 - HOIST
      ?auto_35118 - SURFACE
      ?auto_35130 - SURFACE
      ?auto_35136 - PLACE
      ?auto_35141 - HOIST
      ?auto_35139 - SURFACE
      ?auto_35125 - SURFACE
      ?auto_35119 - SURFACE
      ?auto_35121 - SURFACE
      ?auto_35126 - PLACE
      ?auto_35123 - HOIST
      ?auto_35135 - SURFACE
      ?auto_35133 - SURFACE
      ?auto_35128 - PLACE
      ?auto_35120 - HOIST
      ?auto_35122 - SURFACE
      ?auto_35131 - SURFACE
      ?auto_35127 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35142 ?auto_35140 ) ( IS-CRATE ?auto_35116 ) ( not ( = ?auto_35116 ?auto_35117 ) ) ( not ( = ?auto_35134 ?auto_35140 ) ) ( HOIST-AT ?auto_35132 ?auto_35134 ) ( not ( = ?auto_35142 ?auto_35132 ) ) ( AVAILABLE ?auto_35132 ) ( SURFACE-AT ?auto_35116 ?auto_35134 ) ( ON ?auto_35116 ?auto_35129 ) ( CLEAR ?auto_35116 ) ( not ( = ?auto_35116 ?auto_35129 ) ) ( not ( = ?auto_35117 ?auto_35129 ) ) ( IS-CRATE ?auto_35117 ) ( not ( = ?auto_35116 ?auto_35124 ) ) ( not ( = ?auto_35117 ?auto_35124 ) ) ( not ( = ?auto_35129 ?auto_35124 ) ) ( not ( = ?auto_35137 ?auto_35140 ) ) ( not ( = ?auto_35134 ?auto_35137 ) ) ( HOIST-AT ?auto_35138 ?auto_35137 ) ( not ( = ?auto_35142 ?auto_35138 ) ) ( not ( = ?auto_35132 ?auto_35138 ) ) ( SURFACE-AT ?auto_35117 ?auto_35137 ) ( ON ?auto_35117 ?auto_35118 ) ( CLEAR ?auto_35117 ) ( not ( = ?auto_35116 ?auto_35118 ) ) ( not ( = ?auto_35117 ?auto_35118 ) ) ( not ( = ?auto_35129 ?auto_35118 ) ) ( not ( = ?auto_35124 ?auto_35118 ) ) ( IS-CRATE ?auto_35124 ) ( not ( = ?auto_35116 ?auto_35130 ) ) ( not ( = ?auto_35117 ?auto_35130 ) ) ( not ( = ?auto_35129 ?auto_35130 ) ) ( not ( = ?auto_35124 ?auto_35130 ) ) ( not ( = ?auto_35118 ?auto_35130 ) ) ( not ( = ?auto_35136 ?auto_35140 ) ) ( not ( = ?auto_35134 ?auto_35136 ) ) ( not ( = ?auto_35137 ?auto_35136 ) ) ( HOIST-AT ?auto_35141 ?auto_35136 ) ( not ( = ?auto_35142 ?auto_35141 ) ) ( not ( = ?auto_35132 ?auto_35141 ) ) ( not ( = ?auto_35138 ?auto_35141 ) ) ( AVAILABLE ?auto_35141 ) ( SURFACE-AT ?auto_35124 ?auto_35136 ) ( ON ?auto_35124 ?auto_35139 ) ( CLEAR ?auto_35124 ) ( not ( = ?auto_35116 ?auto_35139 ) ) ( not ( = ?auto_35117 ?auto_35139 ) ) ( not ( = ?auto_35129 ?auto_35139 ) ) ( not ( = ?auto_35124 ?auto_35139 ) ) ( not ( = ?auto_35118 ?auto_35139 ) ) ( not ( = ?auto_35130 ?auto_35139 ) ) ( IS-CRATE ?auto_35130 ) ( not ( = ?auto_35116 ?auto_35125 ) ) ( not ( = ?auto_35117 ?auto_35125 ) ) ( not ( = ?auto_35129 ?auto_35125 ) ) ( not ( = ?auto_35124 ?auto_35125 ) ) ( not ( = ?auto_35118 ?auto_35125 ) ) ( not ( = ?auto_35130 ?auto_35125 ) ) ( not ( = ?auto_35139 ?auto_35125 ) ) ( AVAILABLE ?auto_35138 ) ( SURFACE-AT ?auto_35130 ?auto_35137 ) ( ON ?auto_35130 ?auto_35119 ) ( CLEAR ?auto_35130 ) ( not ( = ?auto_35116 ?auto_35119 ) ) ( not ( = ?auto_35117 ?auto_35119 ) ) ( not ( = ?auto_35129 ?auto_35119 ) ) ( not ( = ?auto_35124 ?auto_35119 ) ) ( not ( = ?auto_35118 ?auto_35119 ) ) ( not ( = ?auto_35130 ?auto_35119 ) ) ( not ( = ?auto_35139 ?auto_35119 ) ) ( not ( = ?auto_35125 ?auto_35119 ) ) ( IS-CRATE ?auto_35125 ) ( not ( = ?auto_35116 ?auto_35121 ) ) ( not ( = ?auto_35117 ?auto_35121 ) ) ( not ( = ?auto_35129 ?auto_35121 ) ) ( not ( = ?auto_35124 ?auto_35121 ) ) ( not ( = ?auto_35118 ?auto_35121 ) ) ( not ( = ?auto_35130 ?auto_35121 ) ) ( not ( = ?auto_35139 ?auto_35121 ) ) ( not ( = ?auto_35125 ?auto_35121 ) ) ( not ( = ?auto_35119 ?auto_35121 ) ) ( not ( = ?auto_35126 ?auto_35140 ) ) ( not ( = ?auto_35134 ?auto_35126 ) ) ( not ( = ?auto_35137 ?auto_35126 ) ) ( not ( = ?auto_35136 ?auto_35126 ) ) ( HOIST-AT ?auto_35123 ?auto_35126 ) ( not ( = ?auto_35142 ?auto_35123 ) ) ( not ( = ?auto_35132 ?auto_35123 ) ) ( not ( = ?auto_35138 ?auto_35123 ) ) ( not ( = ?auto_35141 ?auto_35123 ) ) ( AVAILABLE ?auto_35123 ) ( SURFACE-AT ?auto_35125 ?auto_35126 ) ( ON ?auto_35125 ?auto_35135 ) ( CLEAR ?auto_35125 ) ( not ( = ?auto_35116 ?auto_35135 ) ) ( not ( = ?auto_35117 ?auto_35135 ) ) ( not ( = ?auto_35129 ?auto_35135 ) ) ( not ( = ?auto_35124 ?auto_35135 ) ) ( not ( = ?auto_35118 ?auto_35135 ) ) ( not ( = ?auto_35130 ?auto_35135 ) ) ( not ( = ?auto_35139 ?auto_35135 ) ) ( not ( = ?auto_35125 ?auto_35135 ) ) ( not ( = ?auto_35119 ?auto_35135 ) ) ( not ( = ?auto_35121 ?auto_35135 ) ) ( IS-CRATE ?auto_35121 ) ( not ( = ?auto_35116 ?auto_35133 ) ) ( not ( = ?auto_35117 ?auto_35133 ) ) ( not ( = ?auto_35129 ?auto_35133 ) ) ( not ( = ?auto_35124 ?auto_35133 ) ) ( not ( = ?auto_35118 ?auto_35133 ) ) ( not ( = ?auto_35130 ?auto_35133 ) ) ( not ( = ?auto_35139 ?auto_35133 ) ) ( not ( = ?auto_35125 ?auto_35133 ) ) ( not ( = ?auto_35119 ?auto_35133 ) ) ( not ( = ?auto_35121 ?auto_35133 ) ) ( not ( = ?auto_35135 ?auto_35133 ) ) ( not ( = ?auto_35128 ?auto_35140 ) ) ( not ( = ?auto_35134 ?auto_35128 ) ) ( not ( = ?auto_35137 ?auto_35128 ) ) ( not ( = ?auto_35136 ?auto_35128 ) ) ( not ( = ?auto_35126 ?auto_35128 ) ) ( HOIST-AT ?auto_35120 ?auto_35128 ) ( not ( = ?auto_35142 ?auto_35120 ) ) ( not ( = ?auto_35132 ?auto_35120 ) ) ( not ( = ?auto_35138 ?auto_35120 ) ) ( not ( = ?auto_35141 ?auto_35120 ) ) ( not ( = ?auto_35123 ?auto_35120 ) ) ( AVAILABLE ?auto_35120 ) ( SURFACE-AT ?auto_35121 ?auto_35128 ) ( ON ?auto_35121 ?auto_35122 ) ( CLEAR ?auto_35121 ) ( not ( = ?auto_35116 ?auto_35122 ) ) ( not ( = ?auto_35117 ?auto_35122 ) ) ( not ( = ?auto_35129 ?auto_35122 ) ) ( not ( = ?auto_35124 ?auto_35122 ) ) ( not ( = ?auto_35118 ?auto_35122 ) ) ( not ( = ?auto_35130 ?auto_35122 ) ) ( not ( = ?auto_35139 ?auto_35122 ) ) ( not ( = ?auto_35125 ?auto_35122 ) ) ( not ( = ?auto_35119 ?auto_35122 ) ) ( not ( = ?auto_35121 ?auto_35122 ) ) ( not ( = ?auto_35135 ?auto_35122 ) ) ( not ( = ?auto_35133 ?auto_35122 ) ) ( SURFACE-AT ?auto_35131 ?auto_35140 ) ( CLEAR ?auto_35131 ) ( IS-CRATE ?auto_35133 ) ( not ( = ?auto_35116 ?auto_35131 ) ) ( not ( = ?auto_35117 ?auto_35131 ) ) ( not ( = ?auto_35129 ?auto_35131 ) ) ( not ( = ?auto_35124 ?auto_35131 ) ) ( not ( = ?auto_35118 ?auto_35131 ) ) ( not ( = ?auto_35130 ?auto_35131 ) ) ( not ( = ?auto_35139 ?auto_35131 ) ) ( not ( = ?auto_35125 ?auto_35131 ) ) ( not ( = ?auto_35119 ?auto_35131 ) ) ( not ( = ?auto_35121 ?auto_35131 ) ) ( not ( = ?auto_35135 ?auto_35131 ) ) ( not ( = ?auto_35133 ?auto_35131 ) ) ( not ( = ?auto_35122 ?auto_35131 ) ) ( AVAILABLE ?auto_35142 ) ( IN ?auto_35133 ?auto_35127 ) ( TRUCK-AT ?auto_35127 ?auto_35126 ) )
    :subtasks
    ( ( !DRIVE ?auto_35127 ?auto_35126 ?auto_35140 )
      ( MAKE-ON ?auto_35116 ?auto_35117 )
      ( MAKE-ON-VERIFY ?auto_35116 ?auto_35117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35143 - SURFACE
      ?auto_35144 - SURFACE
    )
    :vars
    (
      ?auto_35169 - HOIST
      ?auto_35162 - PLACE
      ?auto_35160 - PLACE
      ?auto_35145 - HOIST
      ?auto_35147 - SURFACE
      ?auto_35149 - SURFACE
      ?auto_35148 - PLACE
      ?auto_35146 - HOIST
      ?auto_35150 - SURFACE
      ?auto_35155 - SURFACE
      ?auto_35159 - PLACE
      ?auto_35168 - HOIST
      ?auto_35158 - SURFACE
      ?auto_35151 - SURFACE
      ?auto_35157 - SURFACE
      ?auto_35156 - SURFACE
      ?auto_35164 - PLACE
      ?auto_35163 - HOIST
      ?auto_35161 - SURFACE
      ?auto_35165 - SURFACE
      ?auto_35166 - PLACE
      ?auto_35154 - HOIST
      ?auto_35167 - SURFACE
      ?auto_35152 - SURFACE
      ?auto_35153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35169 ?auto_35162 ) ( IS-CRATE ?auto_35143 ) ( not ( = ?auto_35143 ?auto_35144 ) ) ( not ( = ?auto_35160 ?auto_35162 ) ) ( HOIST-AT ?auto_35145 ?auto_35160 ) ( not ( = ?auto_35169 ?auto_35145 ) ) ( AVAILABLE ?auto_35145 ) ( SURFACE-AT ?auto_35143 ?auto_35160 ) ( ON ?auto_35143 ?auto_35147 ) ( CLEAR ?auto_35143 ) ( not ( = ?auto_35143 ?auto_35147 ) ) ( not ( = ?auto_35144 ?auto_35147 ) ) ( IS-CRATE ?auto_35144 ) ( not ( = ?auto_35143 ?auto_35149 ) ) ( not ( = ?auto_35144 ?auto_35149 ) ) ( not ( = ?auto_35147 ?auto_35149 ) ) ( not ( = ?auto_35148 ?auto_35162 ) ) ( not ( = ?auto_35160 ?auto_35148 ) ) ( HOIST-AT ?auto_35146 ?auto_35148 ) ( not ( = ?auto_35169 ?auto_35146 ) ) ( not ( = ?auto_35145 ?auto_35146 ) ) ( SURFACE-AT ?auto_35144 ?auto_35148 ) ( ON ?auto_35144 ?auto_35150 ) ( CLEAR ?auto_35144 ) ( not ( = ?auto_35143 ?auto_35150 ) ) ( not ( = ?auto_35144 ?auto_35150 ) ) ( not ( = ?auto_35147 ?auto_35150 ) ) ( not ( = ?auto_35149 ?auto_35150 ) ) ( IS-CRATE ?auto_35149 ) ( not ( = ?auto_35143 ?auto_35155 ) ) ( not ( = ?auto_35144 ?auto_35155 ) ) ( not ( = ?auto_35147 ?auto_35155 ) ) ( not ( = ?auto_35149 ?auto_35155 ) ) ( not ( = ?auto_35150 ?auto_35155 ) ) ( not ( = ?auto_35159 ?auto_35162 ) ) ( not ( = ?auto_35160 ?auto_35159 ) ) ( not ( = ?auto_35148 ?auto_35159 ) ) ( HOIST-AT ?auto_35168 ?auto_35159 ) ( not ( = ?auto_35169 ?auto_35168 ) ) ( not ( = ?auto_35145 ?auto_35168 ) ) ( not ( = ?auto_35146 ?auto_35168 ) ) ( AVAILABLE ?auto_35168 ) ( SURFACE-AT ?auto_35149 ?auto_35159 ) ( ON ?auto_35149 ?auto_35158 ) ( CLEAR ?auto_35149 ) ( not ( = ?auto_35143 ?auto_35158 ) ) ( not ( = ?auto_35144 ?auto_35158 ) ) ( not ( = ?auto_35147 ?auto_35158 ) ) ( not ( = ?auto_35149 ?auto_35158 ) ) ( not ( = ?auto_35150 ?auto_35158 ) ) ( not ( = ?auto_35155 ?auto_35158 ) ) ( IS-CRATE ?auto_35155 ) ( not ( = ?auto_35143 ?auto_35151 ) ) ( not ( = ?auto_35144 ?auto_35151 ) ) ( not ( = ?auto_35147 ?auto_35151 ) ) ( not ( = ?auto_35149 ?auto_35151 ) ) ( not ( = ?auto_35150 ?auto_35151 ) ) ( not ( = ?auto_35155 ?auto_35151 ) ) ( not ( = ?auto_35158 ?auto_35151 ) ) ( AVAILABLE ?auto_35146 ) ( SURFACE-AT ?auto_35155 ?auto_35148 ) ( ON ?auto_35155 ?auto_35157 ) ( CLEAR ?auto_35155 ) ( not ( = ?auto_35143 ?auto_35157 ) ) ( not ( = ?auto_35144 ?auto_35157 ) ) ( not ( = ?auto_35147 ?auto_35157 ) ) ( not ( = ?auto_35149 ?auto_35157 ) ) ( not ( = ?auto_35150 ?auto_35157 ) ) ( not ( = ?auto_35155 ?auto_35157 ) ) ( not ( = ?auto_35158 ?auto_35157 ) ) ( not ( = ?auto_35151 ?auto_35157 ) ) ( IS-CRATE ?auto_35151 ) ( not ( = ?auto_35143 ?auto_35156 ) ) ( not ( = ?auto_35144 ?auto_35156 ) ) ( not ( = ?auto_35147 ?auto_35156 ) ) ( not ( = ?auto_35149 ?auto_35156 ) ) ( not ( = ?auto_35150 ?auto_35156 ) ) ( not ( = ?auto_35155 ?auto_35156 ) ) ( not ( = ?auto_35158 ?auto_35156 ) ) ( not ( = ?auto_35151 ?auto_35156 ) ) ( not ( = ?auto_35157 ?auto_35156 ) ) ( not ( = ?auto_35164 ?auto_35162 ) ) ( not ( = ?auto_35160 ?auto_35164 ) ) ( not ( = ?auto_35148 ?auto_35164 ) ) ( not ( = ?auto_35159 ?auto_35164 ) ) ( HOIST-AT ?auto_35163 ?auto_35164 ) ( not ( = ?auto_35169 ?auto_35163 ) ) ( not ( = ?auto_35145 ?auto_35163 ) ) ( not ( = ?auto_35146 ?auto_35163 ) ) ( not ( = ?auto_35168 ?auto_35163 ) ) ( SURFACE-AT ?auto_35151 ?auto_35164 ) ( ON ?auto_35151 ?auto_35161 ) ( CLEAR ?auto_35151 ) ( not ( = ?auto_35143 ?auto_35161 ) ) ( not ( = ?auto_35144 ?auto_35161 ) ) ( not ( = ?auto_35147 ?auto_35161 ) ) ( not ( = ?auto_35149 ?auto_35161 ) ) ( not ( = ?auto_35150 ?auto_35161 ) ) ( not ( = ?auto_35155 ?auto_35161 ) ) ( not ( = ?auto_35158 ?auto_35161 ) ) ( not ( = ?auto_35151 ?auto_35161 ) ) ( not ( = ?auto_35157 ?auto_35161 ) ) ( not ( = ?auto_35156 ?auto_35161 ) ) ( IS-CRATE ?auto_35156 ) ( not ( = ?auto_35143 ?auto_35165 ) ) ( not ( = ?auto_35144 ?auto_35165 ) ) ( not ( = ?auto_35147 ?auto_35165 ) ) ( not ( = ?auto_35149 ?auto_35165 ) ) ( not ( = ?auto_35150 ?auto_35165 ) ) ( not ( = ?auto_35155 ?auto_35165 ) ) ( not ( = ?auto_35158 ?auto_35165 ) ) ( not ( = ?auto_35151 ?auto_35165 ) ) ( not ( = ?auto_35157 ?auto_35165 ) ) ( not ( = ?auto_35156 ?auto_35165 ) ) ( not ( = ?auto_35161 ?auto_35165 ) ) ( not ( = ?auto_35166 ?auto_35162 ) ) ( not ( = ?auto_35160 ?auto_35166 ) ) ( not ( = ?auto_35148 ?auto_35166 ) ) ( not ( = ?auto_35159 ?auto_35166 ) ) ( not ( = ?auto_35164 ?auto_35166 ) ) ( HOIST-AT ?auto_35154 ?auto_35166 ) ( not ( = ?auto_35169 ?auto_35154 ) ) ( not ( = ?auto_35145 ?auto_35154 ) ) ( not ( = ?auto_35146 ?auto_35154 ) ) ( not ( = ?auto_35168 ?auto_35154 ) ) ( not ( = ?auto_35163 ?auto_35154 ) ) ( AVAILABLE ?auto_35154 ) ( SURFACE-AT ?auto_35156 ?auto_35166 ) ( ON ?auto_35156 ?auto_35167 ) ( CLEAR ?auto_35156 ) ( not ( = ?auto_35143 ?auto_35167 ) ) ( not ( = ?auto_35144 ?auto_35167 ) ) ( not ( = ?auto_35147 ?auto_35167 ) ) ( not ( = ?auto_35149 ?auto_35167 ) ) ( not ( = ?auto_35150 ?auto_35167 ) ) ( not ( = ?auto_35155 ?auto_35167 ) ) ( not ( = ?auto_35158 ?auto_35167 ) ) ( not ( = ?auto_35151 ?auto_35167 ) ) ( not ( = ?auto_35157 ?auto_35167 ) ) ( not ( = ?auto_35156 ?auto_35167 ) ) ( not ( = ?auto_35161 ?auto_35167 ) ) ( not ( = ?auto_35165 ?auto_35167 ) ) ( SURFACE-AT ?auto_35152 ?auto_35162 ) ( CLEAR ?auto_35152 ) ( IS-CRATE ?auto_35165 ) ( not ( = ?auto_35143 ?auto_35152 ) ) ( not ( = ?auto_35144 ?auto_35152 ) ) ( not ( = ?auto_35147 ?auto_35152 ) ) ( not ( = ?auto_35149 ?auto_35152 ) ) ( not ( = ?auto_35150 ?auto_35152 ) ) ( not ( = ?auto_35155 ?auto_35152 ) ) ( not ( = ?auto_35158 ?auto_35152 ) ) ( not ( = ?auto_35151 ?auto_35152 ) ) ( not ( = ?auto_35157 ?auto_35152 ) ) ( not ( = ?auto_35156 ?auto_35152 ) ) ( not ( = ?auto_35161 ?auto_35152 ) ) ( not ( = ?auto_35165 ?auto_35152 ) ) ( not ( = ?auto_35167 ?auto_35152 ) ) ( AVAILABLE ?auto_35169 ) ( TRUCK-AT ?auto_35153 ?auto_35164 ) ( LIFTING ?auto_35163 ?auto_35165 ) )
    :subtasks
    ( ( !LOAD ?auto_35163 ?auto_35165 ?auto_35153 ?auto_35164 )
      ( MAKE-ON ?auto_35143 ?auto_35144 )
      ( MAKE-ON-VERIFY ?auto_35143 ?auto_35144 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35170 - SURFACE
      ?auto_35171 - SURFACE
    )
    :vars
    (
      ?auto_35196 - HOIST
      ?auto_35173 - PLACE
      ?auto_35182 - PLACE
      ?auto_35190 - HOIST
      ?auto_35191 - SURFACE
      ?auto_35195 - SURFACE
      ?auto_35175 - PLACE
      ?auto_35186 - HOIST
      ?auto_35185 - SURFACE
      ?auto_35184 - SURFACE
      ?auto_35183 - PLACE
      ?auto_35174 - HOIST
      ?auto_35176 - SURFACE
      ?auto_35187 - SURFACE
      ?auto_35192 - SURFACE
      ?auto_35194 - SURFACE
      ?auto_35178 - PLACE
      ?auto_35177 - HOIST
      ?auto_35172 - SURFACE
      ?auto_35179 - SURFACE
      ?auto_35180 - PLACE
      ?auto_35193 - HOIST
      ?auto_35181 - SURFACE
      ?auto_35189 - SURFACE
      ?auto_35188 - TRUCK
      ?auto_35197 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35196 ?auto_35173 ) ( IS-CRATE ?auto_35170 ) ( not ( = ?auto_35170 ?auto_35171 ) ) ( not ( = ?auto_35182 ?auto_35173 ) ) ( HOIST-AT ?auto_35190 ?auto_35182 ) ( not ( = ?auto_35196 ?auto_35190 ) ) ( AVAILABLE ?auto_35190 ) ( SURFACE-AT ?auto_35170 ?auto_35182 ) ( ON ?auto_35170 ?auto_35191 ) ( CLEAR ?auto_35170 ) ( not ( = ?auto_35170 ?auto_35191 ) ) ( not ( = ?auto_35171 ?auto_35191 ) ) ( IS-CRATE ?auto_35171 ) ( not ( = ?auto_35170 ?auto_35195 ) ) ( not ( = ?auto_35171 ?auto_35195 ) ) ( not ( = ?auto_35191 ?auto_35195 ) ) ( not ( = ?auto_35175 ?auto_35173 ) ) ( not ( = ?auto_35182 ?auto_35175 ) ) ( HOIST-AT ?auto_35186 ?auto_35175 ) ( not ( = ?auto_35196 ?auto_35186 ) ) ( not ( = ?auto_35190 ?auto_35186 ) ) ( SURFACE-AT ?auto_35171 ?auto_35175 ) ( ON ?auto_35171 ?auto_35185 ) ( CLEAR ?auto_35171 ) ( not ( = ?auto_35170 ?auto_35185 ) ) ( not ( = ?auto_35171 ?auto_35185 ) ) ( not ( = ?auto_35191 ?auto_35185 ) ) ( not ( = ?auto_35195 ?auto_35185 ) ) ( IS-CRATE ?auto_35195 ) ( not ( = ?auto_35170 ?auto_35184 ) ) ( not ( = ?auto_35171 ?auto_35184 ) ) ( not ( = ?auto_35191 ?auto_35184 ) ) ( not ( = ?auto_35195 ?auto_35184 ) ) ( not ( = ?auto_35185 ?auto_35184 ) ) ( not ( = ?auto_35183 ?auto_35173 ) ) ( not ( = ?auto_35182 ?auto_35183 ) ) ( not ( = ?auto_35175 ?auto_35183 ) ) ( HOIST-AT ?auto_35174 ?auto_35183 ) ( not ( = ?auto_35196 ?auto_35174 ) ) ( not ( = ?auto_35190 ?auto_35174 ) ) ( not ( = ?auto_35186 ?auto_35174 ) ) ( AVAILABLE ?auto_35174 ) ( SURFACE-AT ?auto_35195 ?auto_35183 ) ( ON ?auto_35195 ?auto_35176 ) ( CLEAR ?auto_35195 ) ( not ( = ?auto_35170 ?auto_35176 ) ) ( not ( = ?auto_35171 ?auto_35176 ) ) ( not ( = ?auto_35191 ?auto_35176 ) ) ( not ( = ?auto_35195 ?auto_35176 ) ) ( not ( = ?auto_35185 ?auto_35176 ) ) ( not ( = ?auto_35184 ?auto_35176 ) ) ( IS-CRATE ?auto_35184 ) ( not ( = ?auto_35170 ?auto_35187 ) ) ( not ( = ?auto_35171 ?auto_35187 ) ) ( not ( = ?auto_35191 ?auto_35187 ) ) ( not ( = ?auto_35195 ?auto_35187 ) ) ( not ( = ?auto_35185 ?auto_35187 ) ) ( not ( = ?auto_35184 ?auto_35187 ) ) ( not ( = ?auto_35176 ?auto_35187 ) ) ( AVAILABLE ?auto_35186 ) ( SURFACE-AT ?auto_35184 ?auto_35175 ) ( ON ?auto_35184 ?auto_35192 ) ( CLEAR ?auto_35184 ) ( not ( = ?auto_35170 ?auto_35192 ) ) ( not ( = ?auto_35171 ?auto_35192 ) ) ( not ( = ?auto_35191 ?auto_35192 ) ) ( not ( = ?auto_35195 ?auto_35192 ) ) ( not ( = ?auto_35185 ?auto_35192 ) ) ( not ( = ?auto_35184 ?auto_35192 ) ) ( not ( = ?auto_35176 ?auto_35192 ) ) ( not ( = ?auto_35187 ?auto_35192 ) ) ( IS-CRATE ?auto_35187 ) ( not ( = ?auto_35170 ?auto_35194 ) ) ( not ( = ?auto_35171 ?auto_35194 ) ) ( not ( = ?auto_35191 ?auto_35194 ) ) ( not ( = ?auto_35195 ?auto_35194 ) ) ( not ( = ?auto_35185 ?auto_35194 ) ) ( not ( = ?auto_35184 ?auto_35194 ) ) ( not ( = ?auto_35176 ?auto_35194 ) ) ( not ( = ?auto_35187 ?auto_35194 ) ) ( not ( = ?auto_35192 ?auto_35194 ) ) ( not ( = ?auto_35178 ?auto_35173 ) ) ( not ( = ?auto_35182 ?auto_35178 ) ) ( not ( = ?auto_35175 ?auto_35178 ) ) ( not ( = ?auto_35183 ?auto_35178 ) ) ( HOIST-AT ?auto_35177 ?auto_35178 ) ( not ( = ?auto_35196 ?auto_35177 ) ) ( not ( = ?auto_35190 ?auto_35177 ) ) ( not ( = ?auto_35186 ?auto_35177 ) ) ( not ( = ?auto_35174 ?auto_35177 ) ) ( SURFACE-AT ?auto_35187 ?auto_35178 ) ( ON ?auto_35187 ?auto_35172 ) ( CLEAR ?auto_35187 ) ( not ( = ?auto_35170 ?auto_35172 ) ) ( not ( = ?auto_35171 ?auto_35172 ) ) ( not ( = ?auto_35191 ?auto_35172 ) ) ( not ( = ?auto_35195 ?auto_35172 ) ) ( not ( = ?auto_35185 ?auto_35172 ) ) ( not ( = ?auto_35184 ?auto_35172 ) ) ( not ( = ?auto_35176 ?auto_35172 ) ) ( not ( = ?auto_35187 ?auto_35172 ) ) ( not ( = ?auto_35192 ?auto_35172 ) ) ( not ( = ?auto_35194 ?auto_35172 ) ) ( IS-CRATE ?auto_35194 ) ( not ( = ?auto_35170 ?auto_35179 ) ) ( not ( = ?auto_35171 ?auto_35179 ) ) ( not ( = ?auto_35191 ?auto_35179 ) ) ( not ( = ?auto_35195 ?auto_35179 ) ) ( not ( = ?auto_35185 ?auto_35179 ) ) ( not ( = ?auto_35184 ?auto_35179 ) ) ( not ( = ?auto_35176 ?auto_35179 ) ) ( not ( = ?auto_35187 ?auto_35179 ) ) ( not ( = ?auto_35192 ?auto_35179 ) ) ( not ( = ?auto_35194 ?auto_35179 ) ) ( not ( = ?auto_35172 ?auto_35179 ) ) ( not ( = ?auto_35180 ?auto_35173 ) ) ( not ( = ?auto_35182 ?auto_35180 ) ) ( not ( = ?auto_35175 ?auto_35180 ) ) ( not ( = ?auto_35183 ?auto_35180 ) ) ( not ( = ?auto_35178 ?auto_35180 ) ) ( HOIST-AT ?auto_35193 ?auto_35180 ) ( not ( = ?auto_35196 ?auto_35193 ) ) ( not ( = ?auto_35190 ?auto_35193 ) ) ( not ( = ?auto_35186 ?auto_35193 ) ) ( not ( = ?auto_35174 ?auto_35193 ) ) ( not ( = ?auto_35177 ?auto_35193 ) ) ( AVAILABLE ?auto_35193 ) ( SURFACE-AT ?auto_35194 ?auto_35180 ) ( ON ?auto_35194 ?auto_35181 ) ( CLEAR ?auto_35194 ) ( not ( = ?auto_35170 ?auto_35181 ) ) ( not ( = ?auto_35171 ?auto_35181 ) ) ( not ( = ?auto_35191 ?auto_35181 ) ) ( not ( = ?auto_35195 ?auto_35181 ) ) ( not ( = ?auto_35185 ?auto_35181 ) ) ( not ( = ?auto_35184 ?auto_35181 ) ) ( not ( = ?auto_35176 ?auto_35181 ) ) ( not ( = ?auto_35187 ?auto_35181 ) ) ( not ( = ?auto_35192 ?auto_35181 ) ) ( not ( = ?auto_35194 ?auto_35181 ) ) ( not ( = ?auto_35172 ?auto_35181 ) ) ( not ( = ?auto_35179 ?auto_35181 ) ) ( SURFACE-AT ?auto_35189 ?auto_35173 ) ( CLEAR ?auto_35189 ) ( IS-CRATE ?auto_35179 ) ( not ( = ?auto_35170 ?auto_35189 ) ) ( not ( = ?auto_35171 ?auto_35189 ) ) ( not ( = ?auto_35191 ?auto_35189 ) ) ( not ( = ?auto_35195 ?auto_35189 ) ) ( not ( = ?auto_35185 ?auto_35189 ) ) ( not ( = ?auto_35184 ?auto_35189 ) ) ( not ( = ?auto_35176 ?auto_35189 ) ) ( not ( = ?auto_35187 ?auto_35189 ) ) ( not ( = ?auto_35192 ?auto_35189 ) ) ( not ( = ?auto_35194 ?auto_35189 ) ) ( not ( = ?auto_35172 ?auto_35189 ) ) ( not ( = ?auto_35179 ?auto_35189 ) ) ( not ( = ?auto_35181 ?auto_35189 ) ) ( AVAILABLE ?auto_35196 ) ( TRUCK-AT ?auto_35188 ?auto_35178 ) ( AVAILABLE ?auto_35177 ) ( SURFACE-AT ?auto_35179 ?auto_35178 ) ( ON ?auto_35179 ?auto_35197 ) ( CLEAR ?auto_35179 ) ( not ( = ?auto_35170 ?auto_35197 ) ) ( not ( = ?auto_35171 ?auto_35197 ) ) ( not ( = ?auto_35191 ?auto_35197 ) ) ( not ( = ?auto_35195 ?auto_35197 ) ) ( not ( = ?auto_35185 ?auto_35197 ) ) ( not ( = ?auto_35184 ?auto_35197 ) ) ( not ( = ?auto_35176 ?auto_35197 ) ) ( not ( = ?auto_35187 ?auto_35197 ) ) ( not ( = ?auto_35192 ?auto_35197 ) ) ( not ( = ?auto_35194 ?auto_35197 ) ) ( not ( = ?auto_35172 ?auto_35197 ) ) ( not ( = ?auto_35179 ?auto_35197 ) ) ( not ( = ?auto_35181 ?auto_35197 ) ) ( not ( = ?auto_35189 ?auto_35197 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35177 ?auto_35179 ?auto_35197 ?auto_35178 )
      ( MAKE-ON ?auto_35170 ?auto_35171 )
      ( MAKE-ON-VERIFY ?auto_35170 ?auto_35171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35198 - SURFACE
      ?auto_35199 - SURFACE
    )
    :vars
    (
      ?auto_35222 - HOIST
      ?auto_35224 - PLACE
      ?auto_35203 - PLACE
      ?auto_35221 - HOIST
      ?auto_35207 - SURFACE
      ?auto_35218 - SURFACE
      ?auto_35201 - PLACE
      ?auto_35204 - HOIST
      ?auto_35205 - SURFACE
      ?auto_35202 - SURFACE
      ?auto_35215 - PLACE
      ?auto_35213 - HOIST
      ?auto_35223 - SURFACE
      ?auto_35211 - SURFACE
      ?auto_35208 - SURFACE
      ?auto_35210 - SURFACE
      ?auto_35212 - PLACE
      ?auto_35206 - HOIST
      ?auto_35217 - SURFACE
      ?auto_35200 - SURFACE
      ?auto_35216 - PLACE
      ?auto_35209 - HOIST
      ?auto_35214 - SURFACE
      ?auto_35220 - SURFACE
      ?auto_35225 - SURFACE
      ?auto_35219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35222 ?auto_35224 ) ( IS-CRATE ?auto_35198 ) ( not ( = ?auto_35198 ?auto_35199 ) ) ( not ( = ?auto_35203 ?auto_35224 ) ) ( HOIST-AT ?auto_35221 ?auto_35203 ) ( not ( = ?auto_35222 ?auto_35221 ) ) ( AVAILABLE ?auto_35221 ) ( SURFACE-AT ?auto_35198 ?auto_35203 ) ( ON ?auto_35198 ?auto_35207 ) ( CLEAR ?auto_35198 ) ( not ( = ?auto_35198 ?auto_35207 ) ) ( not ( = ?auto_35199 ?auto_35207 ) ) ( IS-CRATE ?auto_35199 ) ( not ( = ?auto_35198 ?auto_35218 ) ) ( not ( = ?auto_35199 ?auto_35218 ) ) ( not ( = ?auto_35207 ?auto_35218 ) ) ( not ( = ?auto_35201 ?auto_35224 ) ) ( not ( = ?auto_35203 ?auto_35201 ) ) ( HOIST-AT ?auto_35204 ?auto_35201 ) ( not ( = ?auto_35222 ?auto_35204 ) ) ( not ( = ?auto_35221 ?auto_35204 ) ) ( SURFACE-AT ?auto_35199 ?auto_35201 ) ( ON ?auto_35199 ?auto_35205 ) ( CLEAR ?auto_35199 ) ( not ( = ?auto_35198 ?auto_35205 ) ) ( not ( = ?auto_35199 ?auto_35205 ) ) ( not ( = ?auto_35207 ?auto_35205 ) ) ( not ( = ?auto_35218 ?auto_35205 ) ) ( IS-CRATE ?auto_35218 ) ( not ( = ?auto_35198 ?auto_35202 ) ) ( not ( = ?auto_35199 ?auto_35202 ) ) ( not ( = ?auto_35207 ?auto_35202 ) ) ( not ( = ?auto_35218 ?auto_35202 ) ) ( not ( = ?auto_35205 ?auto_35202 ) ) ( not ( = ?auto_35215 ?auto_35224 ) ) ( not ( = ?auto_35203 ?auto_35215 ) ) ( not ( = ?auto_35201 ?auto_35215 ) ) ( HOIST-AT ?auto_35213 ?auto_35215 ) ( not ( = ?auto_35222 ?auto_35213 ) ) ( not ( = ?auto_35221 ?auto_35213 ) ) ( not ( = ?auto_35204 ?auto_35213 ) ) ( AVAILABLE ?auto_35213 ) ( SURFACE-AT ?auto_35218 ?auto_35215 ) ( ON ?auto_35218 ?auto_35223 ) ( CLEAR ?auto_35218 ) ( not ( = ?auto_35198 ?auto_35223 ) ) ( not ( = ?auto_35199 ?auto_35223 ) ) ( not ( = ?auto_35207 ?auto_35223 ) ) ( not ( = ?auto_35218 ?auto_35223 ) ) ( not ( = ?auto_35205 ?auto_35223 ) ) ( not ( = ?auto_35202 ?auto_35223 ) ) ( IS-CRATE ?auto_35202 ) ( not ( = ?auto_35198 ?auto_35211 ) ) ( not ( = ?auto_35199 ?auto_35211 ) ) ( not ( = ?auto_35207 ?auto_35211 ) ) ( not ( = ?auto_35218 ?auto_35211 ) ) ( not ( = ?auto_35205 ?auto_35211 ) ) ( not ( = ?auto_35202 ?auto_35211 ) ) ( not ( = ?auto_35223 ?auto_35211 ) ) ( AVAILABLE ?auto_35204 ) ( SURFACE-AT ?auto_35202 ?auto_35201 ) ( ON ?auto_35202 ?auto_35208 ) ( CLEAR ?auto_35202 ) ( not ( = ?auto_35198 ?auto_35208 ) ) ( not ( = ?auto_35199 ?auto_35208 ) ) ( not ( = ?auto_35207 ?auto_35208 ) ) ( not ( = ?auto_35218 ?auto_35208 ) ) ( not ( = ?auto_35205 ?auto_35208 ) ) ( not ( = ?auto_35202 ?auto_35208 ) ) ( not ( = ?auto_35223 ?auto_35208 ) ) ( not ( = ?auto_35211 ?auto_35208 ) ) ( IS-CRATE ?auto_35211 ) ( not ( = ?auto_35198 ?auto_35210 ) ) ( not ( = ?auto_35199 ?auto_35210 ) ) ( not ( = ?auto_35207 ?auto_35210 ) ) ( not ( = ?auto_35218 ?auto_35210 ) ) ( not ( = ?auto_35205 ?auto_35210 ) ) ( not ( = ?auto_35202 ?auto_35210 ) ) ( not ( = ?auto_35223 ?auto_35210 ) ) ( not ( = ?auto_35211 ?auto_35210 ) ) ( not ( = ?auto_35208 ?auto_35210 ) ) ( not ( = ?auto_35212 ?auto_35224 ) ) ( not ( = ?auto_35203 ?auto_35212 ) ) ( not ( = ?auto_35201 ?auto_35212 ) ) ( not ( = ?auto_35215 ?auto_35212 ) ) ( HOIST-AT ?auto_35206 ?auto_35212 ) ( not ( = ?auto_35222 ?auto_35206 ) ) ( not ( = ?auto_35221 ?auto_35206 ) ) ( not ( = ?auto_35204 ?auto_35206 ) ) ( not ( = ?auto_35213 ?auto_35206 ) ) ( SURFACE-AT ?auto_35211 ?auto_35212 ) ( ON ?auto_35211 ?auto_35217 ) ( CLEAR ?auto_35211 ) ( not ( = ?auto_35198 ?auto_35217 ) ) ( not ( = ?auto_35199 ?auto_35217 ) ) ( not ( = ?auto_35207 ?auto_35217 ) ) ( not ( = ?auto_35218 ?auto_35217 ) ) ( not ( = ?auto_35205 ?auto_35217 ) ) ( not ( = ?auto_35202 ?auto_35217 ) ) ( not ( = ?auto_35223 ?auto_35217 ) ) ( not ( = ?auto_35211 ?auto_35217 ) ) ( not ( = ?auto_35208 ?auto_35217 ) ) ( not ( = ?auto_35210 ?auto_35217 ) ) ( IS-CRATE ?auto_35210 ) ( not ( = ?auto_35198 ?auto_35200 ) ) ( not ( = ?auto_35199 ?auto_35200 ) ) ( not ( = ?auto_35207 ?auto_35200 ) ) ( not ( = ?auto_35218 ?auto_35200 ) ) ( not ( = ?auto_35205 ?auto_35200 ) ) ( not ( = ?auto_35202 ?auto_35200 ) ) ( not ( = ?auto_35223 ?auto_35200 ) ) ( not ( = ?auto_35211 ?auto_35200 ) ) ( not ( = ?auto_35208 ?auto_35200 ) ) ( not ( = ?auto_35210 ?auto_35200 ) ) ( not ( = ?auto_35217 ?auto_35200 ) ) ( not ( = ?auto_35216 ?auto_35224 ) ) ( not ( = ?auto_35203 ?auto_35216 ) ) ( not ( = ?auto_35201 ?auto_35216 ) ) ( not ( = ?auto_35215 ?auto_35216 ) ) ( not ( = ?auto_35212 ?auto_35216 ) ) ( HOIST-AT ?auto_35209 ?auto_35216 ) ( not ( = ?auto_35222 ?auto_35209 ) ) ( not ( = ?auto_35221 ?auto_35209 ) ) ( not ( = ?auto_35204 ?auto_35209 ) ) ( not ( = ?auto_35213 ?auto_35209 ) ) ( not ( = ?auto_35206 ?auto_35209 ) ) ( AVAILABLE ?auto_35209 ) ( SURFACE-AT ?auto_35210 ?auto_35216 ) ( ON ?auto_35210 ?auto_35214 ) ( CLEAR ?auto_35210 ) ( not ( = ?auto_35198 ?auto_35214 ) ) ( not ( = ?auto_35199 ?auto_35214 ) ) ( not ( = ?auto_35207 ?auto_35214 ) ) ( not ( = ?auto_35218 ?auto_35214 ) ) ( not ( = ?auto_35205 ?auto_35214 ) ) ( not ( = ?auto_35202 ?auto_35214 ) ) ( not ( = ?auto_35223 ?auto_35214 ) ) ( not ( = ?auto_35211 ?auto_35214 ) ) ( not ( = ?auto_35208 ?auto_35214 ) ) ( not ( = ?auto_35210 ?auto_35214 ) ) ( not ( = ?auto_35217 ?auto_35214 ) ) ( not ( = ?auto_35200 ?auto_35214 ) ) ( SURFACE-AT ?auto_35220 ?auto_35224 ) ( CLEAR ?auto_35220 ) ( IS-CRATE ?auto_35200 ) ( not ( = ?auto_35198 ?auto_35220 ) ) ( not ( = ?auto_35199 ?auto_35220 ) ) ( not ( = ?auto_35207 ?auto_35220 ) ) ( not ( = ?auto_35218 ?auto_35220 ) ) ( not ( = ?auto_35205 ?auto_35220 ) ) ( not ( = ?auto_35202 ?auto_35220 ) ) ( not ( = ?auto_35223 ?auto_35220 ) ) ( not ( = ?auto_35211 ?auto_35220 ) ) ( not ( = ?auto_35208 ?auto_35220 ) ) ( not ( = ?auto_35210 ?auto_35220 ) ) ( not ( = ?auto_35217 ?auto_35220 ) ) ( not ( = ?auto_35200 ?auto_35220 ) ) ( not ( = ?auto_35214 ?auto_35220 ) ) ( AVAILABLE ?auto_35222 ) ( AVAILABLE ?auto_35206 ) ( SURFACE-AT ?auto_35200 ?auto_35212 ) ( ON ?auto_35200 ?auto_35225 ) ( CLEAR ?auto_35200 ) ( not ( = ?auto_35198 ?auto_35225 ) ) ( not ( = ?auto_35199 ?auto_35225 ) ) ( not ( = ?auto_35207 ?auto_35225 ) ) ( not ( = ?auto_35218 ?auto_35225 ) ) ( not ( = ?auto_35205 ?auto_35225 ) ) ( not ( = ?auto_35202 ?auto_35225 ) ) ( not ( = ?auto_35223 ?auto_35225 ) ) ( not ( = ?auto_35211 ?auto_35225 ) ) ( not ( = ?auto_35208 ?auto_35225 ) ) ( not ( = ?auto_35210 ?auto_35225 ) ) ( not ( = ?auto_35217 ?auto_35225 ) ) ( not ( = ?auto_35200 ?auto_35225 ) ) ( not ( = ?auto_35214 ?auto_35225 ) ) ( not ( = ?auto_35220 ?auto_35225 ) ) ( TRUCK-AT ?auto_35219 ?auto_35224 ) )
    :subtasks
    ( ( !DRIVE ?auto_35219 ?auto_35224 ?auto_35212 )
      ( MAKE-ON ?auto_35198 ?auto_35199 )
      ( MAKE-ON-VERIFY ?auto_35198 ?auto_35199 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35228 - SURFACE
      ?auto_35229 - SURFACE
    )
    :vars
    (
      ?auto_35230 - HOIST
      ?auto_35231 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35230 ?auto_35231 ) ( SURFACE-AT ?auto_35229 ?auto_35231 ) ( CLEAR ?auto_35229 ) ( LIFTING ?auto_35230 ?auto_35228 ) ( IS-CRATE ?auto_35228 ) ( not ( = ?auto_35228 ?auto_35229 ) ) )
    :subtasks
    ( ( !DROP ?auto_35230 ?auto_35228 ?auto_35229 ?auto_35231 )
      ( MAKE-ON-VERIFY ?auto_35228 ?auto_35229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35232 - SURFACE
      ?auto_35233 - SURFACE
    )
    :vars
    (
      ?auto_35235 - HOIST
      ?auto_35234 - PLACE
      ?auto_35236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35235 ?auto_35234 ) ( SURFACE-AT ?auto_35233 ?auto_35234 ) ( CLEAR ?auto_35233 ) ( IS-CRATE ?auto_35232 ) ( not ( = ?auto_35232 ?auto_35233 ) ) ( TRUCK-AT ?auto_35236 ?auto_35234 ) ( AVAILABLE ?auto_35235 ) ( IN ?auto_35232 ?auto_35236 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35235 ?auto_35232 ?auto_35236 ?auto_35234 )
      ( MAKE-ON ?auto_35232 ?auto_35233 )
      ( MAKE-ON-VERIFY ?auto_35232 ?auto_35233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35237 - SURFACE
      ?auto_35238 - SURFACE
    )
    :vars
    (
      ?auto_35239 - HOIST
      ?auto_35241 - PLACE
      ?auto_35240 - TRUCK
      ?auto_35242 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35239 ?auto_35241 ) ( SURFACE-AT ?auto_35238 ?auto_35241 ) ( CLEAR ?auto_35238 ) ( IS-CRATE ?auto_35237 ) ( not ( = ?auto_35237 ?auto_35238 ) ) ( AVAILABLE ?auto_35239 ) ( IN ?auto_35237 ?auto_35240 ) ( TRUCK-AT ?auto_35240 ?auto_35242 ) ( not ( = ?auto_35242 ?auto_35241 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_35240 ?auto_35242 ?auto_35241 )
      ( MAKE-ON ?auto_35237 ?auto_35238 )
      ( MAKE-ON-VERIFY ?auto_35237 ?auto_35238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35243 - SURFACE
      ?auto_35244 - SURFACE
    )
    :vars
    (
      ?auto_35246 - HOIST
      ?auto_35248 - PLACE
      ?auto_35245 - TRUCK
      ?auto_35247 - PLACE
      ?auto_35249 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35246 ?auto_35248 ) ( SURFACE-AT ?auto_35244 ?auto_35248 ) ( CLEAR ?auto_35244 ) ( IS-CRATE ?auto_35243 ) ( not ( = ?auto_35243 ?auto_35244 ) ) ( AVAILABLE ?auto_35246 ) ( TRUCK-AT ?auto_35245 ?auto_35247 ) ( not ( = ?auto_35247 ?auto_35248 ) ) ( HOIST-AT ?auto_35249 ?auto_35247 ) ( LIFTING ?auto_35249 ?auto_35243 ) ( not ( = ?auto_35246 ?auto_35249 ) ) )
    :subtasks
    ( ( !LOAD ?auto_35249 ?auto_35243 ?auto_35245 ?auto_35247 )
      ( MAKE-ON ?auto_35243 ?auto_35244 )
      ( MAKE-ON-VERIFY ?auto_35243 ?auto_35244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35250 - SURFACE
      ?auto_35251 - SURFACE
    )
    :vars
    (
      ?auto_35254 - HOIST
      ?auto_35253 - PLACE
      ?auto_35255 - TRUCK
      ?auto_35252 - PLACE
      ?auto_35256 - HOIST
      ?auto_35257 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35254 ?auto_35253 ) ( SURFACE-AT ?auto_35251 ?auto_35253 ) ( CLEAR ?auto_35251 ) ( IS-CRATE ?auto_35250 ) ( not ( = ?auto_35250 ?auto_35251 ) ) ( AVAILABLE ?auto_35254 ) ( TRUCK-AT ?auto_35255 ?auto_35252 ) ( not ( = ?auto_35252 ?auto_35253 ) ) ( HOIST-AT ?auto_35256 ?auto_35252 ) ( not ( = ?auto_35254 ?auto_35256 ) ) ( AVAILABLE ?auto_35256 ) ( SURFACE-AT ?auto_35250 ?auto_35252 ) ( ON ?auto_35250 ?auto_35257 ) ( CLEAR ?auto_35250 ) ( not ( = ?auto_35250 ?auto_35257 ) ) ( not ( = ?auto_35251 ?auto_35257 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35256 ?auto_35250 ?auto_35257 ?auto_35252 )
      ( MAKE-ON ?auto_35250 ?auto_35251 )
      ( MAKE-ON-VERIFY ?auto_35250 ?auto_35251 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35258 - SURFACE
      ?auto_35259 - SURFACE
    )
    :vars
    (
      ?auto_35261 - HOIST
      ?auto_35263 - PLACE
      ?auto_35264 - PLACE
      ?auto_35265 - HOIST
      ?auto_35260 - SURFACE
      ?auto_35262 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35261 ?auto_35263 ) ( SURFACE-AT ?auto_35259 ?auto_35263 ) ( CLEAR ?auto_35259 ) ( IS-CRATE ?auto_35258 ) ( not ( = ?auto_35258 ?auto_35259 ) ) ( AVAILABLE ?auto_35261 ) ( not ( = ?auto_35264 ?auto_35263 ) ) ( HOIST-AT ?auto_35265 ?auto_35264 ) ( not ( = ?auto_35261 ?auto_35265 ) ) ( AVAILABLE ?auto_35265 ) ( SURFACE-AT ?auto_35258 ?auto_35264 ) ( ON ?auto_35258 ?auto_35260 ) ( CLEAR ?auto_35258 ) ( not ( = ?auto_35258 ?auto_35260 ) ) ( not ( = ?auto_35259 ?auto_35260 ) ) ( TRUCK-AT ?auto_35262 ?auto_35263 ) )
    :subtasks
    ( ( !DRIVE ?auto_35262 ?auto_35263 ?auto_35264 )
      ( MAKE-ON ?auto_35258 ?auto_35259 )
      ( MAKE-ON-VERIFY ?auto_35258 ?auto_35259 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35266 - SURFACE
      ?auto_35267 - SURFACE
    )
    :vars
    (
      ?auto_35273 - HOIST
      ?auto_35268 - PLACE
      ?auto_35272 - PLACE
      ?auto_35269 - HOIST
      ?auto_35270 - SURFACE
      ?auto_35271 - TRUCK
      ?auto_35274 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35273 ?auto_35268 ) ( IS-CRATE ?auto_35266 ) ( not ( = ?auto_35266 ?auto_35267 ) ) ( not ( = ?auto_35272 ?auto_35268 ) ) ( HOIST-AT ?auto_35269 ?auto_35272 ) ( not ( = ?auto_35273 ?auto_35269 ) ) ( AVAILABLE ?auto_35269 ) ( SURFACE-AT ?auto_35266 ?auto_35272 ) ( ON ?auto_35266 ?auto_35270 ) ( CLEAR ?auto_35266 ) ( not ( = ?auto_35266 ?auto_35270 ) ) ( not ( = ?auto_35267 ?auto_35270 ) ) ( TRUCK-AT ?auto_35271 ?auto_35268 ) ( SURFACE-AT ?auto_35274 ?auto_35268 ) ( CLEAR ?auto_35274 ) ( LIFTING ?auto_35273 ?auto_35267 ) ( IS-CRATE ?auto_35267 ) ( not ( = ?auto_35266 ?auto_35274 ) ) ( not ( = ?auto_35267 ?auto_35274 ) ) ( not ( = ?auto_35270 ?auto_35274 ) ) )
    :subtasks
    ( ( !DROP ?auto_35273 ?auto_35267 ?auto_35274 ?auto_35268 )
      ( MAKE-ON ?auto_35266 ?auto_35267 )
      ( MAKE-ON-VERIFY ?auto_35266 ?auto_35267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35275 - SURFACE
      ?auto_35276 - SURFACE
    )
    :vars
    (
      ?auto_35277 - HOIST
      ?auto_35282 - PLACE
      ?auto_35280 - PLACE
      ?auto_35278 - HOIST
      ?auto_35279 - SURFACE
      ?auto_35281 - TRUCK
      ?auto_35283 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35277 ?auto_35282 ) ( IS-CRATE ?auto_35275 ) ( not ( = ?auto_35275 ?auto_35276 ) ) ( not ( = ?auto_35280 ?auto_35282 ) ) ( HOIST-AT ?auto_35278 ?auto_35280 ) ( not ( = ?auto_35277 ?auto_35278 ) ) ( AVAILABLE ?auto_35278 ) ( SURFACE-AT ?auto_35275 ?auto_35280 ) ( ON ?auto_35275 ?auto_35279 ) ( CLEAR ?auto_35275 ) ( not ( = ?auto_35275 ?auto_35279 ) ) ( not ( = ?auto_35276 ?auto_35279 ) ) ( TRUCK-AT ?auto_35281 ?auto_35282 ) ( SURFACE-AT ?auto_35283 ?auto_35282 ) ( CLEAR ?auto_35283 ) ( IS-CRATE ?auto_35276 ) ( not ( = ?auto_35275 ?auto_35283 ) ) ( not ( = ?auto_35276 ?auto_35283 ) ) ( not ( = ?auto_35279 ?auto_35283 ) ) ( AVAILABLE ?auto_35277 ) ( IN ?auto_35276 ?auto_35281 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35277 ?auto_35276 ?auto_35281 ?auto_35282 )
      ( MAKE-ON ?auto_35275 ?auto_35276 )
      ( MAKE-ON-VERIFY ?auto_35275 ?auto_35276 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35284 - SURFACE
      ?auto_35285 - SURFACE
    )
    :vars
    (
      ?auto_35292 - HOIST
      ?auto_35286 - PLACE
      ?auto_35290 - PLACE
      ?auto_35288 - HOIST
      ?auto_35291 - SURFACE
      ?auto_35289 - SURFACE
      ?auto_35287 - TRUCK
      ?auto_35293 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35292 ?auto_35286 ) ( IS-CRATE ?auto_35284 ) ( not ( = ?auto_35284 ?auto_35285 ) ) ( not ( = ?auto_35290 ?auto_35286 ) ) ( HOIST-AT ?auto_35288 ?auto_35290 ) ( not ( = ?auto_35292 ?auto_35288 ) ) ( AVAILABLE ?auto_35288 ) ( SURFACE-AT ?auto_35284 ?auto_35290 ) ( ON ?auto_35284 ?auto_35291 ) ( CLEAR ?auto_35284 ) ( not ( = ?auto_35284 ?auto_35291 ) ) ( not ( = ?auto_35285 ?auto_35291 ) ) ( SURFACE-AT ?auto_35289 ?auto_35286 ) ( CLEAR ?auto_35289 ) ( IS-CRATE ?auto_35285 ) ( not ( = ?auto_35284 ?auto_35289 ) ) ( not ( = ?auto_35285 ?auto_35289 ) ) ( not ( = ?auto_35291 ?auto_35289 ) ) ( AVAILABLE ?auto_35292 ) ( IN ?auto_35285 ?auto_35287 ) ( TRUCK-AT ?auto_35287 ?auto_35293 ) ( not ( = ?auto_35293 ?auto_35286 ) ) ( not ( = ?auto_35290 ?auto_35293 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_35287 ?auto_35293 ?auto_35286 )
      ( MAKE-ON ?auto_35284 ?auto_35285 )
      ( MAKE-ON-VERIFY ?auto_35284 ?auto_35285 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35294 - SURFACE
      ?auto_35295 - SURFACE
    )
    :vars
    (
      ?auto_35303 - HOIST
      ?auto_35300 - PLACE
      ?auto_35298 - PLACE
      ?auto_35302 - HOIST
      ?auto_35296 - SURFACE
      ?auto_35301 - SURFACE
      ?auto_35299 - TRUCK
      ?auto_35297 - PLACE
      ?auto_35304 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35303 ?auto_35300 ) ( IS-CRATE ?auto_35294 ) ( not ( = ?auto_35294 ?auto_35295 ) ) ( not ( = ?auto_35298 ?auto_35300 ) ) ( HOIST-AT ?auto_35302 ?auto_35298 ) ( not ( = ?auto_35303 ?auto_35302 ) ) ( AVAILABLE ?auto_35302 ) ( SURFACE-AT ?auto_35294 ?auto_35298 ) ( ON ?auto_35294 ?auto_35296 ) ( CLEAR ?auto_35294 ) ( not ( = ?auto_35294 ?auto_35296 ) ) ( not ( = ?auto_35295 ?auto_35296 ) ) ( SURFACE-AT ?auto_35301 ?auto_35300 ) ( CLEAR ?auto_35301 ) ( IS-CRATE ?auto_35295 ) ( not ( = ?auto_35294 ?auto_35301 ) ) ( not ( = ?auto_35295 ?auto_35301 ) ) ( not ( = ?auto_35296 ?auto_35301 ) ) ( AVAILABLE ?auto_35303 ) ( TRUCK-AT ?auto_35299 ?auto_35297 ) ( not ( = ?auto_35297 ?auto_35300 ) ) ( not ( = ?auto_35298 ?auto_35297 ) ) ( HOIST-AT ?auto_35304 ?auto_35297 ) ( LIFTING ?auto_35304 ?auto_35295 ) ( not ( = ?auto_35303 ?auto_35304 ) ) ( not ( = ?auto_35302 ?auto_35304 ) ) )
    :subtasks
    ( ( !LOAD ?auto_35304 ?auto_35295 ?auto_35299 ?auto_35297 )
      ( MAKE-ON ?auto_35294 ?auto_35295 )
      ( MAKE-ON-VERIFY ?auto_35294 ?auto_35295 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35305 - SURFACE
      ?auto_35306 - SURFACE
    )
    :vars
    (
      ?auto_35313 - HOIST
      ?auto_35308 - PLACE
      ?auto_35314 - PLACE
      ?auto_35309 - HOIST
      ?auto_35312 - SURFACE
      ?auto_35307 - SURFACE
      ?auto_35315 - TRUCK
      ?auto_35310 - PLACE
      ?auto_35311 - HOIST
      ?auto_35316 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35313 ?auto_35308 ) ( IS-CRATE ?auto_35305 ) ( not ( = ?auto_35305 ?auto_35306 ) ) ( not ( = ?auto_35314 ?auto_35308 ) ) ( HOIST-AT ?auto_35309 ?auto_35314 ) ( not ( = ?auto_35313 ?auto_35309 ) ) ( AVAILABLE ?auto_35309 ) ( SURFACE-AT ?auto_35305 ?auto_35314 ) ( ON ?auto_35305 ?auto_35312 ) ( CLEAR ?auto_35305 ) ( not ( = ?auto_35305 ?auto_35312 ) ) ( not ( = ?auto_35306 ?auto_35312 ) ) ( SURFACE-AT ?auto_35307 ?auto_35308 ) ( CLEAR ?auto_35307 ) ( IS-CRATE ?auto_35306 ) ( not ( = ?auto_35305 ?auto_35307 ) ) ( not ( = ?auto_35306 ?auto_35307 ) ) ( not ( = ?auto_35312 ?auto_35307 ) ) ( AVAILABLE ?auto_35313 ) ( TRUCK-AT ?auto_35315 ?auto_35310 ) ( not ( = ?auto_35310 ?auto_35308 ) ) ( not ( = ?auto_35314 ?auto_35310 ) ) ( HOIST-AT ?auto_35311 ?auto_35310 ) ( not ( = ?auto_35313 ?auto_35311 ) ) ( not ( = ?auto_35309 ?auto_35311 ) ) ( AVAILABLE ?auto_35311 ) ( SURFACE-AT ?auto_35306 ?auto_35310 ) ( ON ?auto_35306 ?auto_35316 ) ( CLEAR ?auto_35306 ) ( not ( = ?auto_35305 ?auto_35316 ) ) ( not ( = ?auto_35306 ?auto_35316 ) ) ( not ( = ?auto_35312 ?auto_35316 ) ) ( not ( = ?auto_35307 ?auto_35316 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35311 ?auto_35306 ?auto_35316 ?auto_35310 )
      ( MAKE-ON ?auto_35305 ?auto_35306 )
      ( MAKE-ON-VERIFY ?auto_35305 ?auto_35306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35317 - SURFACE
      ?auto_35318 - SURFACE
    )
    :vars
    (
      ?auto_35326 - HOIST
      ?auto_35325 - PLACE
      ?auto_35324 - PLACE
      ?auto_35319 - HOIST
      ?auto_35321 - SURFACE
      ?auto_35323 - SURFACE
      ?auto_35322 - PLACE
      ?auto_35320 - HOIST
      ?auto_35327 - SURFACE
      ?auto_35328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35326 ?auto_35325 ) ( IS-CRATE ?auto_35317 ) ( not ( = ?auto_35317 ?auto_35318 ) ) ( not ( = ?auto_35324 ?auto_35325 ) ) ( HOIST-AT ?auto_35319 ?auto_35324 ) ( not ( = ?auto_35326 ?auto_35319 ) ) ( AVAILABLE ?auto_35319 ) ( SURFACE-AT ?auto_35317 ?auto_35324 ) ( ON ?auto_35317 ?auto_35321 ) ( CLEAR ?auto_35317 ) ( not ( = ?auto_35317 ?auto_35321 ) ) ( not ( = ?auto_35318 ?auto_35321 ) ) ( SURFACE-AT ?auto_35323 ?auto_35325 ) ( CLEAR ?auto_35323 ) ( IS-CRATE ?auto_35318 ) ( not ( = ?auto_35317 ?auto_35323 ) ) ( not ( = ?auto_35318 ?auto_35323 ) ) ( not ( = ?auto_35321 ?auto_35323 ) ) ( AVAILABLE ?auto_35326 ) ( not ( = ?auto_35322 ?auto_35325 ) ) ( not ( = ?auto_35324 ?auto_35322 ) ) ( HOIST-AT ?auto_35320 ?auto_35322 ) ( not ( = ?auto_35326 ?auto_35320 ) ) ( not ( = ?auto_35319 ?auto_35320 ) ) ( AVAILABLE ?auto_35320 ) ( SURFACE-AT ?auto_35318 ?auto_35322 ) ( ON ?auto_35318 ?auto_35327 ) ( CLEAR ?auto_35318 ) ( not ( = ?auto_35317 ?auto_35327 ) ) ( not ( = ?auto_35318 ?auto_35327 ) ) ( not ( = ?auto_35321 ?auto_35327 ) ) ( not ( = ?auto_35323 ?auto_35327 ) ) ( TRUCK-AT ?auto_35328 ?auto_35325 ) )
    :subtasks
    ( ( !DRIVE ?auto_35328 ?auto_35325 ?auto_35322 )
      ( MAKE-ON ?auto_35317 ?auto_35318 )
      ( MAKE-ON-VERIFY ?auto_35317 ?auto_35318 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35329 - SURFACE
      ?auto_35330 - SURFACE
    )
    :vars
    (
      ?auto_35334 - HOIST
      ?auto_35338 - PLACE
      ?auto_35331 - PLACE
      ?auto_35332 - HOIST
      ?auto_35335 - SURFACE
      ?auto_35340 - SURFACE
      ?auto_35333 - PLACE
      ?auto_35336 - HOIST
      ?auto_35339 - SURFACE
      ?auto_35337 - TRUCK
      ?auto_35341 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35334 ?auto_35338 ) ( IS-CRATE ?auto_35329 ) ( not ( = ?auto_35329 ?auto_35330 ) ) ( not ( = ?auto_35331 ?auto_35338 ) ) ( HOIST-AT ?auto_35332 ?auto_35331 ) ( not ( = ?auto_35334 ?auto_35332 ) ) ( AVAILABLE ?auto_35332 ) ( SURFACE-AT ?auto_35329 ?auto_35331 ) ( ON ?auto_35329 ?auto_35335 ) ( CLEAR ?auto_35329 ) ( not ( = ?auto_35329 ?auto_35335 ) ) ( not ( = ?auto_35330 ?auto_35335 ) ) ( IS-CRATE ?auto_35330 ) ( not ( = ?auto_35329 ?auto_35340 ) ) ( not ( = ?auto_35330 ?auto_35340 ) ) ( not ( = ?auto_35335 ?auto_35340 ) ) ( not ( = ?auto_35333 ?auto_35338 ) ) ( not ( = ?auto_35331 ?auto_35333 ) ) ( HOIST-AT ?auto_35336 ?auto_35333 ) ( not ( = ?auto_35334 ?auto_35336 ) ) ( not ( = ?auto_35332 ?auto_35336 ) ) ( AVAILABLE ?auto_35336 ) ( SURFACE-AT ?auto_35330 ?auto_35333 ) ( ON ?auto_35330 ?auto_35339 ) ( CLEAR ?auto_35330 ) ( not ( = ?auto_35329 ?auto_35339 ) ) ( not ( = ?auto_35330 ?auto_35339 ) ) ( not ( = ?auto_35335 ?auto_35339 ) ) ( not ( = ?auto_35340 ?auto_35339 ) ) ( TRUCK-AT ?auto_35337 ?auto_35338 ) ( SURFACE-AT ?auto_35341 ?auto_35338 ) ( CLEAR ?auto_35341 ) ( LIFTING ?auto_35334 ?auto_35340 ) ( IS-CRATE ?auto_35340 ) ( not ( = ?auto_35329 ?auto_35341 ) ) ( not ( = ?auto_35330 ?auto_35341 ) ) ( not ( = ?auto_35335 ?auto_35341 ) ) ( not ( = ?auto_35340 ?auto_35341 ) ) ( not ( = ?auto_35339 ?auto_35341 ) ) )
    :subtasks
    ( ( !DROP ?auto_35334 ?auto_35340 ?auto_35341 ?auto_35338 )
      ( MAKE-ON ?auto_35329 ?auto_35330 )
      ( MAKE-ON-VERIFY ?auto_35329 ?auto_35330 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35342 - SURFACE
      ?auto_35343 - SURFACE
    )
    :vars
    (
      ?auto_35351 - HOIST
      ?auto_35344 - PLACE
      ?auto_35354 - PLACE
      ?auto_35350 - HOIST
      ?auto_35352 - SURFACE
      ?auto_35345 - SURFACE
      ?auto_35348 - PLACE
      ?auto_35349 - HOIST
      ?auto_35353 - SURFACE
      ?auto_35346 - TRUCK
      ?auto_35347 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35351 ?auto_35344 ) ( IS-CRATE ?auto_35342 ) ( not ( = ?auto_35342 ?auto_35343 ) ) ( not ( = ?auto_35354 ?auto_35344 ) ) ( HOIST-AT ?auto_35350 ?auto_35354 ) ( not ( = ?auto_35351 ?auto_35350 ) ) ( AVAILABLE ?auto_35350 ) ( SURFACE-AT ?auto_35342 ?auto_35354 ) ( ON ?auto_35342 ?auto_35352 ) ( CLEAR ?auto_35342 ) ( not ( = ?auto_35342 ?auto_35352 ) ) ( not ( = ?auto_35343 ?auto_35352 ) ) ( IS-CRATE ?auto_35343 ) ( not ( = ?auto_35342 ?auto_35345 ) ) ( not ( = ?auto_35343 ?auto_35345 ) ) ( not ( = ?auto_35352 ?auto_35345 ) ) ( not ( = ?auto_35348 ?auto_35344 ) ) ( not ( = ?auto_35354 ?auto_35348 ) ) ( HOIST-AT ?auto_35349 ?auto_35348 ) ( not ( = ?auto_35351 ?auto_35349 ) ) ( not ( = ?auto_35350 ?auto_35349 ) ) ( AVAILABLE ?auto_35349 ) ( SURFACE-AT ?auto_35343 ?auto_35348 ) ( ON ?auto_35343 ?auto_35353 ) ( CLEAR ?auto_35343 ) ( not ( = ?auto_35342 ?auto_35353 ) ) ( not ( = ?auto_35343 ?auto_35353 ) ) ( not ( = ?auto_35352 ?auto_35353 ) ) ( not ( = ?auto_35345 ?auto_35353 ) ) ( TRUCK-AT ?auto_35346 ?auto_35344 ) ( SURFACE-AT ?auto_35347 ?auto_35344 ) ( CLEAR ?auto_35347 ) ( IS-CRATE ?auto_35345 ) ( not ( = ?auto_35342 ?auto_35347 ) ) ( not ( = ?auto_35343 ?auto_35347 ) ) ( not ( = ?auto_35352 ?auto_35347 ) ) ( not ( = ?auto_35345 ?auto_35347 ) ) ( not ( = ?auto_35353 ?auto_35347 ) ) ( AVAILABLE ?auto_35351 ) ( IN ?auto_35345 ?auto_35346 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35351 ?auto_35345 ?auto_35346 ?auto_35344 )
      ( MAKE-ON ?auto_35342 ?auto_35343 )
      ( MAKE-ON-VERIFY ?auto_35342 ?auto_35343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35355 - SURFACE
      ?auto_35356 - SURFACE
    )
    :vars
    (
      ?auto_35358 - HOIST
      ?auto_35357 - PLACE
      ?auto_35363 - PLACE
      ?auto_35361 - HOIST
      ?auto_35367 - SURFACE
      ?auto_35366 - SURFACE
      ?auto_35362 - PLACE
      ?auto_35360 - HOIST
      ?auto_35359 - SURFACE
      ?auto_35364 - SURFACE
      ?auto_35365 - TRUCK
      ?auto_35368 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35358 ?auto_35357 ) ( IS-CRATE ?auto_35355 ) ( not ( = ?auto_35355 ?auto_35356 ) ) ( not ( = ?auto_35363 ?auto_35357 ) ) ( HOIST-AT ?auto_35361 ?auto_35363 ) ( not ( = ?auto_35358 ?auto_35361 ) ) ( AVAILABLE ?auto_35361 ) ( SURFACE-AT ?auto_35355 ?auto_35363 ) ( ON ?auto_35355 ?auto_35367 ) ( CLEAR ?auto_35355 ) ( not ( = ?auto_35355 ?auto_35367 ) ) ( not ( = ?auto_35356 ?auto_35367 ) ) ( IS-CRATE ?auto_35356 ) ( not ( = ?auto_35355 ?auto_35366 ) ) ( not ( = ?auto_35356 ?auto_35366 ) ) ( not ( = ?auto_35367 ?auto_35366 ) ) ( not ( = ?auto_35362 ?auto_35357 ) ) ( not ( = ?auto_35363 ?auto_35362 ) ) ( HOIST-AT ?auto_35360 ?auto_35362 ) ( not ( = ?auto_35358 ?auto_35360 ) ) ( not ( = ?auto_35361 ?auto_35360 ) ) ( AVAILABLE ?auto_35360 ) ( SURFACE-AT ?auto_35356 ?auto_35362 ) ( ON ?auto_35356 ?auto_35359 ) ( CLEAR ?auto_35356 ) ( not ( = ?auto_35355 ?auto_35359 ) ) ( not ( = ?auto_35356 ?auto_35359 ) ) ( not ( = ?auto_35367 ?auto_35359 ) ) ( not ( = ?auto_35366 ?auto_35359 ) ) ( SURFACE-AT ?auto_35364 ?auto_35357 ) ( CLEAR ?auto_35364 ) ( IS-CRATE ?auto_35366 ) ( not ( = ?auto_35355 ?auto_35364 ) ) ( not ( = ?auto_35356 ?auto_35364 ) ) ( not ( = ?auto_35367 ?auto_35364 ) ) ( not ( = ?auto_35366 ?auto_35364 ) ) ( not ( = ?auto_35359 ?auto_35364 ) ) ( AVAILABLE ?auto_35358 ) ( IN ?auto_35366 ?auto_35365 ) ( TRUCK-AT ?auto_35365 ?auto_35368 ) ( not ( = ?auto_35368 ?auto_35357 ) ) ( not ( = ?auto_35363 ?auto_35368 ) ) ( not ( = ?auto_35362 ?auto_35368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_35365 ?auto_35368 ?auto_35357 )
      ( MAKE-ON ?auto_35355 ?auto_35356 )
      ( MAKE-ON-VERIFY ?auto_35355 ?auto_35356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35369 - SURFACE
      ?auto_35370 - SURFACE
    )
    :vars
    (
      ?auto_35371 - HOIST
      ?auto_35372 - PLACE
      ?auto_35381 - PLACE
      ?auto_35376 - HOIST
      ?auto_35374 - SURFACE
      ?auto_35379 - SURFACE
      ?auto_35377 - PLACE
      ?auto_35373 - HOIST
      ?auto_35380 - SURFACE
      ?auto_35378 - SURFACE
      ?auto_35375 - TRUCK
      ?auto_35382 - PLACE
      ?auto_35383 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35371 ?auto_35372 ) ( IS-CRATE ?auto_35369 ) ( not ( = ?auto_35369 ?auto_35370 ) ) ( not ( = ?auto_35381 ?auto_35372 ) ) ( HOIST-AT ?auto_35376 ?auto_35381 ) ( not ( = ?auto_35371 ?auto_35376 ) ) ( AVAILABLE ?auto_35376 ) ( SURFACE-AT ?auto_35369 ?auto_35381 ) ( ON ?auto_35369 ?auto_35374 ) ( CLEAR ?auto_35369 ) ( not ( = ?auto_35369 ?auto_35374 ) ) ( not ( = ?auto_35370 ?auto_35374 ) ) ( IS-CRATE ?auto_35370 ) ( not ( = ?auto_35369 ?auto_35379 ) ) ( not ( = ?auto_35370 ?auto_35379 ) ) ( not ( = ?auto_35374 ?auto_35379 ) ) ( not ( = ?auto_35377 ?auto_35372 ) ) ( not ( = ?auto_35381 ?auto_35377 ) ) ( HOIST-AT ?auto_35373 ?auto_35377 ) ( not ( = ?auto_35371 ?auto_35373 ) ) ( not ( = ?auto_35376 ?auto_35373 ) ) ( AVAILABLE ?auto_35373 ) ( SURFACE-AT ?auto_35370 ?auto_35377 ) ( ON ?auto_35370 ?auto_35380 ) ( CLEAR ?auto_35370 ) ( not ( = ?auto_35369 ?auto_35380 ) ) ( not ( = ?auto_35370 ?auto_35380 ) ) ( not ( = ?auto_35374 ?auto_35380 ) ) ( not ( = ?auto_35379 ?auto_35380 ) ) ( SURFACE-AT ?auto_35378 ?auto_35372 ) ( CLEAR ?auto_35378 ) ( IS-CRATE ?auto_35379 ) ( not ( = ?auto_35369 ?auto_35378 ) ) ( not ( = ?auto_35370 ?auto_35378 ) ) ( not ( = ?auto_35374 ?auto_35378 ) ) ( not ( = ?auto_35379 ?auto_35378 ) ) ( not ( = ?auto_35380 ?auto_35378 ) ) ( AVAILABLE ?auto_35371 ) ( TRUCK-AT ?auto_35375 ?auto_35382 ) ( not ( = ?auto_35382 ?auto_35372 ) ) ( not ( = ?auto_35381 ?auto_35382 ) ) ( not ( = ?auto_35377 ?auto_35382 ) ) ( HOIST-AT ?auto_35383 ?auto_35382 ) ( LIFTING ?auto_35383 ?auto_35379 ) ( not ( = ?auto_35371 ?auto_35383 ) ) ( not ( = ?auto_35376 ?auto_35383 ) ) ( not ( = ?auto_35373 ?auto_35383 ) ) )
    :subtasks
    ( ( !LOAD ?auto_35383 ?auto_35379 ?auto_35375 ?auto_35382 )
      ( MAKE-ON ?auto_35369 ?auto_35370 )
      ( MAKE-ON-VERIFY ?auto_35369 ?auto_35370 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35384 - SURFACE
      ?auto_35385 - SURFACE
    )
    :vars
    (
      ?auto_35386 - HOIST
      ?auto_35391 - PLACE
      ?auto_35389 - PLACE
      ?auto_35397 - HOIST
      ?auto_35390 - SURFACE
      ?auto_35396 - SURFACE
      ?auto_35395 - PLACE
      ?auto_35393 - HOIST
      ?auto_35392 - SURFACE
      ?auto_35388 - SURFACE
      ?auto_35387 - TRUCK
      ?auto_35398 - PLACE
      ?auto_35394 - HOIST
      ?auto_35399 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35386 ?auto_35391 ) ( IS-CRATE ?auto_35384 ) ( not ( = ?auto_35384 ?auto_35385 ) ) ( not ( = ?auto_35389 ?auto_35391 ) ) ( HOIST-AT ?auto_35397 ?auto_35389 ) ( not ( = ?auto_35386 ?auto_35397 ) ) ( AVAILABLE ?auto_35397 ) ( SURFACE-AT ?auto_35384 ?auto_35389 ) ( ON ?auto_35384 ?auto_35390 ) ( CLEAR ?auto_35384 ) ( not ( = ?auto_35384 ?auto_35390 ) ) ( not ( = ?auto_35385 ?auto_35390 ) ) ( IS-CRATE ?auto_35385 ) ( not ( = ?auto_35384 ?auto_35396 ) ) ( not ( = ?auto_35385 ?auto_35396 ) ) ( not ( = ?auto_35390 ?auto_35396 ) ) ( not ( = ?auto_35395 ?auto_35391 ) ) ( not ( = ?auto_35389 ?auto_35395 ) ) ( HOIST-AT ?auto_35393 ?auto_35395 ) ( not ( = ?auto_35386 ?auto_35393 ) ) ( not ( = ?auto_35397 ?auto_35393 ) ) ( AVAILABLE ?auto_35393 ) ( SURFACE-AT ?auto_35385 ?auto_35395 ) ( ON ?auto_35385 ?auto_35392 ) ( CLEAR ?auto_35385 ) ( not ( = ?auto_35384 ?auto_35392 ) ) ( not ( = ?auto_35385 ?auto_35392 ) ) ( not ( = ?auto_35390 ?auto_35392 ) ) ( not ( = ?auto_35396 ?auto_35392 ) ) ( SURFACE-AT ?auto_35388 ?auto_35391 ) ( CLEAR ?auto_35388 ) ( IS-CRATE ?auto_35396 ) ( not ( = ?auto_35384 ?auto_35388 ) ) ( not ( = ?auto_35385 ?auto_35388 ) ) ( not ( = ?auto_35390 ?auto_35388 ) ) ( not ( = ?auto_35396 ?auto_35388 ) ) ( not ( = ?auto_35392 ?auto_35388 ) ) ( AVAILABLE ?auto_35386 ) ( TRUCK-AT ?auto_35387 ?auto_35398 ) ( not ( = ?auto_35398 ?auto_35391 ) ) ( not ( = ?auto_35389 ?auto_35398 ) ) ( not ( = ?auto_35395 ?auto_35398 ) ) ( HOIST-AT ?auto_35394 ?auto_35398 ) ( not ( = ?auto_35386 ?auto_35394 ) ) ( not ( = ?auto_35397 ?auto_35394 ) ) ( not ( = ?auto_35393 ?auto_35394 ) ) ( AVAILABLE ?auto_35394 ) ( SURFACE-AT ?auto_35396 ?auto_35398 ) ( ON ?auto_35396 ?auto_35399 ) ( CLEAR ?auto_35396 ) ( not ( = ?auto_35384 ?auto_35399 ) ) ( not ( = ?auto_35385 ?auto_35399 ) ) ( not ( = ?auto_35390 ?auto_35399 ) ) ( not ( = ?auto_35396 ?auto_35399 ) ) ( not ( = ?auto_35392 ?auto_35399 ) ) ( not ( = ?auto_35388 ?auto_35399 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35394 ?auto_35396 ?auto_35399 ?auto_35398 )
      ( MAKE-ON ?auto_35384 ?auto_35385 )
      ( MAKE-ON-VERIFY ?auto_35384 ?auto_35385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35400 - SURFACE
      ?auto_35401 - SURFACE
    )
    :vars
    (
      ?auto_35414 - HOIST
      ?auto_35409 - PLACE
      ?auto_35412 - PLACE
      ?auto_35410 - HOIST
      ?auto_35402 - SURFACE
      ?auto_35411 - SURFACE
      ?auto_35406 - PLACE
      ?auto_35403 - HOIST
      ?auto_35404 - SURFACE
      ?auto_35407 - SURFACE
      ?auto_35405 - PLACE
      ?auto_35413 - HOIST
      ?auto_35415 - SURFACE
      ?auto_35408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35414 ?auto_35409 ) ( IS-CRATE ?auto_35400 ) ( not ( = ?auto_35400 ?auto_35401 ) ) ( not ( = ?auto_35412 ?auto_35409 ) ) ( HOIST-AT ?auto_35410 ?auto_35412 ) ( not ( = ?auto_35414 ?auto_35410 ) ) ( AVAILABLE ?auto_35410 ) ( SURFACE-AT ?auto_35400 ?auto_35412 ) ( ON ?auto_35400 ?auto_35402 ) ( CLEAR ?auto_35400 ) ( not ( = ?auto_35400 ?auto_35402 ) ) ( not ( = ?auto_35401 ?auto_35402 ) ) ( IS-CRATE ?auto_35401 ) ( not ( = ?auto_35400 ?auto_35411 ) ) ( not ( = ?auto_35401 ?auto_35411 ) ) ( not ( = ?auto_35402 ?auto_35411 ) ) ( not ( = ?auto_35406 ?auto_35409 ) ) ( not ( = ?auto_35412 ?auto_35406 ) ) ( HOIST-AT ?auto_35403 ?auto_35406 ) ( not ( = ?auto_35414 ?auto_35403 ) ) ( not ( = ?auto_35410 ?auto_35403 ) ) ( AVAILABLE ?auto_35403 ) ( SURFACE-AT ?auto_35401 ?auto_35406 ) ( ON ?auto_35401 ?auto_35404 ) ( CLEAR ?auto_35401 ) ( not ( = ?auto_35400 ?auto_35404 ) ) ( not ( = ?auto_35401 ?auto_35404 ) ) ( not ( = ?auto_35402 ?auto_35404 ) ) ( not ( = ?auto_35411 ?auto_35404 ) ) ( SURFACE-AT ?auto_35407 ?auto_35409 ) ( CLEAR ?auto_35407 ) ( IS-CRATE ?auto_35411 ) ( not ( = ?auto_35400 ?auto_35407 ) ) ( not ( = ?auto_35401 ?auto_35407 ) ) ( not ( = ?auto_35402 ?auto_35407 ) ) ( not ( = ?auto_35411 ?auto_35407 ) ) ( not ( = ?auto_35404 ?auto_35407 ) ) ( AVAILABLE ?auto_35414 ) ( not ( = ?auto_35405 ?auto_35409 ) ) ( not ( = ?auto_35412 ?auto_35405 ) ) ( not ( = ?auto_35406 ?auto_35405 ) ) ( HOIST-AT ?auto_35413 ?auto_35405 ) ( not ( = ?auto_35414 ?auto_35413 ) ) ( not ( = ?auto_35410 ?auto_35413 ) ) ( not ( = ?auto_35403 ?auto_35413 ) ) ( AVAILABLE ?auto_35413 ) ( SURFACE-AT ?auto_35411 ?auto_35405 ) ( ON ?auto_35411 ?auto_35415 ) ( CLEAR ?auto_35411 ) ( not ( = ?auto_35400 ?auto_35415 ) ) ( not ( = ?auto_35401 ?auto_35415 ) ) ( not ( = ?auto_35402 ?auto_35415 ) ) ( not ( = ?auto_35411 ?auto_35415 ) ) ( not ( = ?auto_35404 ?auto_35415 ) ) ( not ( = ?auto_35407 ?auto_35415 ) ) ( TRUCK-AT ?auto_35408 ?auto_35409 ) )
    :subtasks
    ( ( !DRIVE ?auto_35408 ?auto_35409 ?auto_35405 )
      ( MAKE-ON ?auto_35400 ?auto_35401 )
      ( MAKE-ON-VERIFY ?auto_35400 ?auto_35401 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35416 - SURFACE
      ?auto_35417 - SURFACE
    )
    :vars
    (
      ?auto_35418 - HOIST
      ?auto_35426 - PLACE
      ?auto_35419 - PLACE
      ?auto_35431 - HOIST
      ?auto_35421 - SURFACE
      ?auto_35423 - SURFACE
      ?auto_35420 - PLACE
      ?auto_35427 - HOIST
      ?auto_35424 - SURFACE
      ?auto_35422 - SURFACE
      ?auto_35430 - PLACE
      ?auto_35428 - HOIST
      ?auto_35429 - SURFACE
      ?auto_35425 - TRUCK
      ?auto_35432 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35418 ?auto_35426 ) ( IS-CRATE ?auto_35416 ) ( not ( = ?auto_35416 ?auto_35417 ) ) ( not ( = ?auto_35419 ?auto_35426 ) ) ( HOIST-AT ?auto_35431 ?auto_35419 ) ( not ( = ?auto_35418 ?auto_35431 ) ) ( AVAILABLE ?auto_35431 ) ( SURFACE-AT ?auto_35416 ?auto_35419 ) ( ON ?auto_35416 ?auto_35421 ) ( CLEAR ?auto_35416 ) ( not ( = ?auto_35416 ?auto_35421 ) ) ( not ( = ?auto_35417 ?auto_35421 ) ) ( IS-CRATE ?auto_35417 ) ( not ( = ?auto_35416 ?auto_35423 ) ) ( not ( = ?auto_35417 ?auto_35423 ) ) ( not ( = ?auto_35421 ?auto_35423 ) ) ( not ( = ?auto_35420 ?auto_35426 ) ) ( not ( = ?auto_35419 ?auto_35420 ) ) ( HOIST-AT ?auto_35427 ?auto_35420 ) ( not ( = ?auto_35418 ?auto_35427 ) ) ( not ( = ?auto_35431 ?auto_35427 ) ) ( AVAILABLE ?auto_35427 ) ( SURFACE-AT ?auto_35417 ?auto_35420 ) ( ON ?auto_35417 ?auto_35424 ) ( CLEAR ?auto_35417 ) ( not ( = ?auto_35416 ?auto_35424 ) ) ( not ( = ?auto_35417 ?auto_35424 ) ) ( not ( = ?auto_35421 ?auto_35424 ) ) ( not ( = ?auto_35423 ?auto_35424 ) ) ( IS-CRATE ?auto_35423 ) ( not ( = ?auto_35416 ?auto_35422 ) ) ( not ( = ?auto_35417 ?auto_35422 ) ) ( not ( = ?auto_35421 ?auto_35422 ) ) ( not ( = ?auto_35423 ?auto_35422 ) ) ( not ( = ?auto_35424 ?auto_35422 ) ) ( not ( = ?auto_35430 ?auto_35426 ) ) ( not ( = ?auto_35419 ?auto_35430 ) ) ( not ( = ?auto_35420 ?auto_35430 ) ) ( HOIST-AT ?auto_35428 ?auto_35430 ) ( not ( = ?auto_35418 ?auto_35428 ) ) ( not ( = ?auto_35431 ?auto_35428 ) ) ( not ( = ?auto_35427 ?auto_35428 ) ) ( AVAILABLE ?auto_35428 ) ( SURFACE-AT ?auto_35423 ?auto_35430 ) ( ON ?auto_35423 ?auto_35429 ) ( CLEAR ?auto_35423 ) ( not ( = ?auto_35416 ?auto_35429 ) ) ( not ( = ?auto_35417 ?auto_35429 ) ) ( not ( = ?auto_35421 ?auto_35429 ) ) ( not ( = ?auto_35423 ?auto_35429 ) ) ( not ( = ?auto_35424 ?auto_35429 ) ) ( not ( = ?auto_35422 ?auto_35429 ) ) ( TRUCK-AT ?auto_35425 ?auto_35426 ) ( SURFACE-AT ?auto_35432 ?auto_35426 ) ( CLEAR ?auto_35432 ) ( LIFTING ?auto_35418 ?auto_35422 ) ( IS-CRATE ?auto_35422 ) ( not ( = ?auto_35416 ?auto_35432 ) ) ( not ( = ?auto_35417 ?auto_35432 ) ) ( not ( = ?auto_35421 ?auto_35432 ) ) ( not ( = ?auto_35423 ?auto_35432 ) ) ( not ( = ?auto_35424 ?auto_35432 ) ) ( not ( = ?auto_35422 ?auto_35432 ) ) ( not ( = ?auto_35429 ?auto_35432 ) ) )
    :subtasks
    ( ( !DROP ?auto_35418 ?auto_35422 ?auto_35432 ?auto_35426 )
      ( MAKE-ON ?auto_35416 ?auto_35417 )
      ( MAKE-ON-VERIFY ?auto_35416 ?auto_35417 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35433 - SURFACE
      ?auto_35434 - SURFACE
    )
    :vars
    (
      ?auto_35435 - HOIST
      ?auto_35449 - PLACE
      ?auto_35444 - PLACE
      ?auto_35443 - HOIST
      ?auto_35445 - SURFACE
      ?auto_35442 - SURFACE
      ?auto_35436 - PLACE
      ?auto_35439 - HOIST
      ?auto_35446 - SURFACE
      ?auto_35440 - SURFACE
      ?auto_35437 - PLACE
      ?auto_35438 - HOIST
      ?auto_35448 - SURFACE
      ?auto_35441 - TRUCK
      ?auto_35447 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35435 ?auto_35449 ) ( IS-CRATE ?auto_35433 ) ( not ( = ?auto_35433 ?auto_35434 ) ) ( not ( = ?auto_35444 ?auto_35449 ) ) ( HOIST-AT ?auto_35443 ?auto_35444 ) ( not ( = ?auto_35435 ?auto_35443 ) ) ( AVAILABLE ?auto_35443 ) ( SURFACE-AT ?auto_35433 ?auto_35444 ) ( ON ?auto_35433 ?auto_35445 ) ( CLEAR ?auto_35433 ) ( not ( = ?auto_35433 ?auto_35445 ) ) ( not ( = ?auto_35434 ?auto_35445 ) ) ( IS-CRATE ?auto_35434 ) ( not ( = ?auto_35433 ?auto_35442 ) ) ( not ( = ?auto_35434 ?auto_35442 ) ) ( not ( = ?auto_35445 ?auto_35442 ) ) ( not ( = ?auto_35436 ?auto_35449 ) ) ( not ( = ?auto_35444 ?auto_35436 ) ) ( HOIST-AT ?auto_35439 ?auto_35436 ) ( not ( = ?auto_35435 ?auto_35439 ) ) ( not ( = ?auto_35443 ?auto_35439 ) ) ( AVAILABLE ?auto_35439 ) ( SURFACE-AT ?auto_35434 ?auto_35436 ) ( ON ?auto_35434 ?auto_35446 ) ( CLEAR ?auto_35434 ) ( not ( = ?auto_35433 ?auto_35446 ) ) ( not ( = ?auto_35434 ?auto_35446 ) ) ( not ( = ?auto_35445 ?auto_35446 ) ) ( not ( = ?auto_35442 ?auto_35446 ) ) ( IS-CRATE ?auto_35442 ) ( not ( = ?auto_35433 ?auto_35440 ) ) ( not ( = ?auto_35434 ?auto_35440 ) ) ( not ( = ?auto_35445 ?auto_35440 ) ) ( not ( = ?auto_35442 ?auto_35440 ) ) ( not ( = ?auto_35446 ?auto_35440 ) ) ( not ( = ?auto_35437 ?auto_35449 ) ) ( not ( = ?auto_35444 ?auto_35437 ) ) ( not ( = ?auto_35436 ?auto_35437 ) ) ( HOIST-AT ?auto_35438 ?auto_35437 ) ( not ( = ?auto_35435 ?auto_35438 ) ) ( not ( = ?auto_35443 ?auto_35438 ) ) ( not ( = ?auto_35439 ?auto_35438 ) ) ( AVAILABLE ?auto_35438 ) ( SURFACE-AT ?auto_35442 ?auto_35437 ) ( ON ?auto_35442 ?auto_35448 ) ( CLEAR ?auto_35442 ) ( not ( = ?auto_35433 ?auto_35448 ) ) ( not ( = ?auto_35434 ?auto_35448 ) ) ( not ( = ?auto_35445 ?auto_35448 ) ) ( not ( = ?auto_35442 ?auto_35448 ) ) ( not ( = ?auto_35446 ?auto_35448 ) ) ( not ( = ?auto_35440 ?auto_35448 ) ) ( TRUCK-AT ?auto_35441 ?auto_35449 ) ( SURFACE-AT ?auto_35447 ?auto_35449 ) ( CLEAR ?auto_35447 ) ( IS-CRATE ?auto_35440 ) ( not ( = ?auto_35433 ?auto_35447 ) ) ( not ( = ?auto_35434 ?auto_35447 ) ) ( not ( = ?auto_35445 ?auto_35447 ) ) ( not ( = ?auto_35442 ?auto_35447 ) ) ( not ( = ?auto_35446 ?auto_35447 ) ) ( not ( = ?auto_35440 ?auto_35447 ) ) ( not ( = ?auto_35448 ?auto_35447 ) ) ( AVAILABLE ?auto_35435 ) ( IN ?auto_35440 ?auto_35441 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35435 ?auto_35440 ?auto_35441 ?auto_35449 )
      ( MAKE-ON ?auto_35433 ?auto_35434 )
      ( MAKE-ON-VERIFY ?auto_35433 ?auto_35434 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35450 - SURFACE
      ?auto_35451 - SURFACE
    )
    :vars
    (
      ?auto_35460 - HOIST
      ?auto_35459 - PLACE
      ?auto_35457 - PLACE
      ?auto_35466 - HOIST
      ?auto_35464 - SURFACE
      ?auto_35452 - SURFACE
      ?auto_35453 - PLACE
      ?auto_35455 - HOIST
      ?auto_35458 - SURFACE
      ?auto_35463 - SURFACE
      ?auto_35462 - PLACE
      ?auto_35461 - HOIST
      ?auto_35456 - SURFACE
      ?auto_35454 - SURFACE
      ?auto_35465 - TRUCK
      ?auto_35467 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35460 ?auto_35459 ) ( IS-CRATE ?auto_35450 ) ( not ( = ?auto_35450 ?auto_35451 ) ) ( not ( = ?auto_35457 ?auto_35459 ) ) ( HOIST-AT ?auto_35466 ?auto_35457 ) ( not ( = ?auto_35460 ?auto_35466 ) ) ( AVAILABLE ?auto_35466 ) ( SURFACE-AT ?auto_35450 ?auto_35457 ) ( ON ?auto_35450 ?auto_35464 ) ( CLEAR ?auto_35450 ) ( not ( = ?auto_35450 ?auto_35464 ) ) ( not ( = ?auto_35451 ?auto_35464 ) ) ( IS-CRATE ?auto_35451 ) ( not ( = ?auto_35450 ?auto_35452 ) ) ( not ( = ?auto_35451 ?auto_35452 ) ) ( not ( = ?auto_35464 ?auto_35452 ) ) ( not ( = ?auto_35453 ?auto_35459 ) ) ( not ( = ?auto_35457 ?auto_35453 ) ) ( HOIST-AT ?auto_35455 ?auto_35453 ) ( not ( = ?auto_35460 ?auto_35455 ) ) ( not ( = ?auto_35466 ?auto_35455 ) ) ( AVAILABLE ?auto_35455 ) ( SURFACE-AT ?auto_35451 ?auto_35453 ) ( ON ?auto_35451 ?auto_35458 ) ( CLEAR ?auto_35451 ) ( not ( = ?auto_35450 ?auto_35458 ) ) ( not ( = ?auto_35451 ?auto_35458 ) ) ( not ( = ?auto_35464 ?auto_35458 ) ) ( not ( = ?auto_35452 ?auto_35458 ) ) ( IS-CRATE ?auto_35452 ) ( not ( = ?auto_35450 ?auto_35463 ) ) ( not ( = ?auto_35451 ?auto_35463 ) ) ( not ( = ?auto_35464 ?auto_35463 ) ) ( not ( = ?auto_35452 ?auto_35463 ) ) ( not ( = ?auto_35458 ?auto_35463 ) ) ( not ( = ?auto_35462 ?auto_35459 ) ) ( not ( = ?auto_35457 ?auto_35462 ) ) ( not ( = ?auto_35453 ?auto_35462 ) ) ( HOIST-AT ?auto_35461 ?auto_35462 ) ( not ( = ?auto_35460 ?auto_35461 ) ) ( not ( = ?auto_35466 ?auto_35461 ) ) ( not ( = ?auto_35455 ?auto_35461 ) ) ( AVAILABLE ?auto_35461 ) ( SURFACE-AT ?auto_35452 ?auto_35462 ) ( ON ?auto_35452 ?auto_35456 ) ( CLEAR ?auto_35452 ) ( not ( = ?auto_35450 ?auto_35456 ) ) ( not ( = ?auto_35451 ?auto_35456 ) ) ( not ( = ?auto_35464 ?auto_35456 ) ) ( not ( = ?auto_35452 ?auto_35456 ) ) ( not ( = ?auto_35458 ?auto_35456 ) ) ( not ( = ?auto_35463 ?auto_35456 ) ) ( SURFACE-AT ?auto_35454 ?auto_35459 ) ( CLEAR ?auto_35454 ) ( IS-CRATE ?auto_35463 ) ( not ( = ?auto_35450 ?auto_35454 ) ) ( not ( = ?auto_35451 ?auto_35454 ) ) ( not ( = ?auto_35464 ?auto_35454 ) ) ( not ( = ?auto_35452 ?auto_35454 ) ) ( not ( = ?auto_35458 ?auto_35454 ) ) ( not ( = ?auto_35463 ?auto_35454 ) ) ( not ( = ?auto_35456 ?auto_35454 ) ) ( AVAILABLE ?auto_35460 ) ( IN ?auto_35463 ?auto_35465 ) ( TRUCK-AT ?auto_35465 ?auto_35467 ) ( not ( = ?auto_35467 ?auto_35459 ) ) ( not ( = ?auto_35457 ?auto_35467 ) ) ( not ( = ?auto_35453 ?auto_35467 ) ) ( not ( = ?auto_35462 ?auto_35467 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_35465 ?auto_35467 ?auto_35459 )
      ( MAKE-ON ?auto_35450 ?auto_35451 )
      ( MAKE-ON-VERIFY ?auto_35450 ?auto_35451 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35468 - SURFACE
      ?auto_35469 - SURFACE
    )
    :vars
    (
      ?auto_35479 - HOIST
      ?auto_35472 - PLACE
      ?auto_35473 - PLACE
      ?auto_35471 - HOIST
      ?auto_35483 - SURFACE
      ?auto_35480 - SURFACE
      ?auto_35475 - PLACE
      ?auto_35477 - HOIST
      ?auto_35478 - SURFACE
      ?auto_35482 - SURFACE
      ?auto_35476 - PLACE
      ?auto_35485 - HOIST
      ?auto_35484 - SURFACE
      ?auto_35474 - SURFACE
      ?auto_35470 - TRUCK
      ?auto_35481 - PLACE
      ?auto_35486 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35479 ?auto_35472 ) ( IS-CRATE ?auto_35468 ) ( not ( = ?auto_35468 ?auto_35469 ) ) ( not ( = ?auto_35473 ?auto_35472 ) ) ( HOIST-AT ?auto_35471 ?auto_35473 ) ( not ( = ?auto_35479 ?auto_35471 ) ) ( AVAILABLE ?auto_35471 ) ( SURFACE-AT ?auto_35468 ?auto_35473 ) ( ON ?auto_35468 ?auto_35483 ) ( CLEAR ?auto_35468 ) ( not ( = ?auto_35468 ?auto_35483 ) ) ( not ( = ?auto_35469 ?auto_35483 ) ) ( IS-CRATE ?auto_35469 ) ( not ( = ?auto_35468 ?auto_35480 ) ) ( not ( = ?auto_35469 ?auto_35480 ) ) ( not ( = ?auto_35483 ?auto_35480 ) ) ( not ( = ?auto_35475 ?auto_35472 ) ) ( not ( = ?auto_35473 ?auto_35475 ) ) ( HOIST-AT ?auto_35477 ?auto_35475 ) ( not ( = ?auto_35479 ?auto_35477 ) ) ( not ( = ?auto_35471 ?auto_35477 ) ) ( AVAILABLE ?auto_35477 ) ( SURFACE-AT ?auto_35469 ?auto_35475 ) ( ON ?auto_35469 ?auto_35478 ) ( CLEAR ?auto_35469 ) ( not ( = ?auto_35468 ?auto_35478 ) ) ( not ( = ?auto_35469 ?auto_35478 ) ) ( not ( = ?auto_35483 ?auto_35478 ) ) ( not ( = ?auto_35480 ?auto_35478 ) ) ( IS-CRATE ?auto_35480 ) ( not ( = ?auto_35468 ?auto_35482 ) ) ( not ( = ?auto_35469 ?auto_35482 ) ) ( not ( = ?auto_35483 ?auto_35482 ) ) ( not ( = ?auto_35480 ?auto_35482 ) ) ( not ( = ?auto_35478 ?auto_35482 ) ) ( not ( = ?auto_35476 ?auto_35472 ) ) ( not ( = ?auto_35473 ?auto_35476 ) ) ( not ( = ?auto_35475 ?auto_35476 ) ) ( HOIST-AT ?auto_35485 ?auto_35476 ) ( not ( = ?auto_35479 ?auto_35485 ) ) ( not ( = ?auto_35471 ?auto_35485 ) ) ( not ( = ?auto_35477 ?auto_35485 ) ) ( AVAILABLE ?auto_35485 ) ( SURFACE-AT ?auto_35480 ?auto_35476 ) ( ON ?auto_35480 ?auto_35484 ) ( CLEAR ?auto_35480 ) ( not ( = ?auto_35468 ?auto_35484 ) ) ( not ( = ?auto_35469 ?auto_35484 ) ) ( not ( = ?auto_35483 ?auto_35484 ) ) ( not ( = ?auto_35480 ?auto_35484 ) ) ( not ( = ?auto_35478 ?auto_35484 ) ) ( not ( = ?auto_35482 ?auto_35484 ) ) ( SURFACE-AT ?auto_35474 ?auto_35472 ) ( CLEAR ?auto_35474 ) ( IS-CRATE ?auto_35482 ) ( not ( = ?auto_35468 ?auto_35474 ) ) ( not ( = ?auto_35469 ?auto_35474 ) ) ( not ( = ?auto_35483 ?auto_35474 ) ) ( not ( = ?auto_35480 ?auto_35474 ) ) ( not ( = ?auto_35478 ?auto_35474 ) ) ( not ( = ?auto_35482 ?auto_35474 ) ) ( not ( = ?auto_35484 ?auto_35474 ) ) ( AVAILABLE ?auto_35479 ) ( TRUCK-AT ?auto_35470 ?auto_35481 ) ( not ( = ?auto_35481 ?auto_35472 ) ) ( not ( = ?auto_35473 ?auto_35481 ) ) ( not ( = ?auto_35475 ?auto_35481 ) ) ( not ( = ?auto_35476 ?auto_35481 ) ) ( HOIST-AT ?auto_35486 ?auto_35481 ) ( LIFTING ?auto_35486 ?auto_35482 ) ( not ( = ?auto_35479 ?auto_35486 ) ) ( not ( = ?auto_35471 ?auto_35486 ) ) ( not ( = ?auto_35477 ?auto_35486 ) ) ( not ( = ?auto_35485 ?auto_35486 ) ) )
    :subtasks
    ( ( !LOAD ?auto_35486 ?auto_35482 ?auto_35470 ?auto_35481 )
      ( MAKE-ON ?auto_35468 ?auto_35469 )
      ( MAKE-ON-VERIFY ?auto_35468 ?auto_35469 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35487 - SURFACE
      ?auto_35488 - SURFACE
    )
    :vars
    (
      ?auto_35494 - HOIST
      ?auto_35496 - PLACE
      ?auto_35491 - PLACE
      ?auto_35498 - HOIST
      ?auto_35503 - SURFACE
      ?auto_35505 - SURFACE
      ?auto_35490 - PLACE
      ?auto_35497 - HOIST
      ?auto_35502 - SURFACE
      ?auto_35489 - SURFACE
      ?auto_35492 - PLACE
      ?auto_35501 - HOIST
      ?auto_35500 - SURFACE
      ?auto_35504 - SURFACE
      ?auto_35499 - TRUCK
      ?auto_35493 - PLACE
      ?auto_35495 - HOIST
      ?auto_35506 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35494 ?auto_35496 ) ( IS-CRATE ?auto_35487 ) ( not ( = ?auto_35487 ?auto_35488 ) ) ( not ( = ?auto_35491 ?auto_35496 ) ) ( HOIST-AT ?auto_35498 ?auto_35491 ) ( not ( = ?auto_35494 ?auto_35498 ) ) ( AVAILABLE ?auto_35498 ) ( SURFACE-AT ?auto_35487 ?auto_35491 ) ( ON ?auto_35487 ?auto_35503 ) ( CLEAR ?auto_35487 ) ( not ( = ?auto_35487 ?auto_35503 ) ) ( not ( = ?auto_35488 ?auto_35503 ) ) ( IS-CRATE ?auto_35488 ) ( not ( = ?auto_35487 ?auto_35505 ) ) ( not ( = ?auto_35488 ?auto_35505 ) ) ( not ( = ?auto_35503 ?auto_35505 ) ) ( not ( = ?auto_35490 ?auto_35496 ) ) ( not ( = ?auto_35491 ?auto_35490 ) ) ( HOIST-AT ?auto_35497 ?auto_35490 ) ( not ( = ?auto_35494 ?auto_35497 ) ) ( not ( = ?auto_35498 ?auto_35497 ) ) ( AVAILABLE ?auto_35497 ) ( SURFACE-AT ?auto_35488 ?auto_35490 ) ( ON ?auto_35488 ?auto_35502 ) ( CLEAR ?auto_35488 ) ( not ( = ?auto_35487 ?auto_35502 ) ) ( not ( = ?auto_35488 ?auto_35502 ) ) ( not ( = ?auto_35503 ?auto_35502 ) ) ( not ( = ?auto_35505 ?auto_35502 ) ) ( IS-CRATE ?auto_35505 ) ( not ( = ?auto_35487 ?auto_35489 ) ) ( not ( = ?auto_35488 ?auto_35489 ) ) ( not ( = ?auto_35503 ?auto_35489 ) ) ( not ( = ?auto_35505 ?auto_35489 ) ) ( not ( = ?auto_35502 ?auto_35489 ) ) ( not ( = ?auto_35492 ?auto_35496 ) ) ( not ( = ?auto_35491 ?auto_35492 ) ) ( not ( = ?auto_35490 ?auto_35492 ) ) ( HOIST-AT ?auto_35501 ?auto_35492 ) ( not ( = ?auto_35494 ?auto_35501 ) ) ( not ( = ?auto_35498 ?auto_35501 ) ) ( not ( = ?auto_35497 ?auto_35501 ) ) ( AVAILABLE ?auto_35501 ) ( SURFACE-AT ?auto_35505 ?auto_35492 ) ( ON ?auto_35505 ?auto_35500 ) ( CLEAR ?auto_35505 ) ( not ( = ?auto_35487 ?auto_35500 ) ) ( not ( = ?auto_35488 ?auto_35500 ) ) ( not ( = ?auto_35503 ?auto_35500 ) ) ( not ( = ?auto_35505 ?auto_35500 ) ) ( not ( = ?auto_35502 ?auto_35500 ) ) ( not ( = ?auto_35489 ?auto_35500 ) ) ( SURFACE-AT ?auto_35504 ?auto_35496 ) ( CLEAR ?auto_35504 ) ( IS-CRATE ?auto_35489 ) ( not ( = ?auto_35487 ?auto_35504 ) ) ( not ( = ?auto_35488 ?auto_35504 ) ) ( not ( = ?auto_35503 ?auto_35504 ) ) ( not ( = ?auto_35505 ?auto_35504 ) ) ( not ( = ?auto_35502 ?auto_35504 ) ) ( not ( = ?auto_35489 ?auto_35504 ) ) ( not ( = ?auto_35500 ?auto_35504 ) ) ( AVAILABLE ?auto_35494 ) ( TRUCK-AT ?auto_35499 ?auto_35493 ) ( not ( = ?auto_35493 ?auto_35496 ) ) ( not ( = ?auto_35491 ?auto_35493 ) ) ( not ( = ?auto_35490 ?auto_35493 ) ) ( not ( = ?auto_35492 ?auto_35493 ) ) ( HOIST-AT ?auto_35495 ?auto_35493 ) ( not ( = ?auto_35494 ?auto_35495 ) ) ( not ( = ?auto_35498 ?auto_35495 ) ) ( not ( = ?auto_35497 ?auto_35495 ) ) ( not ( = ?auto_35501 ?auto_35495 ) ) ( AVAILABLE ?auto_35495 ) ( SURFACE-AT ?auto_35489 ?auto_35493 ) ( ON ?auto_35489 ?auto_35506 ) ( CLEAR ?auto_35489 ) ( not ( = ?auto_35487 ?auto_35506 ) ) ( not ( = ?auto_35488 ?auto_35506 ) ) ( not ( = ?auto_35503 ?auto_35506 ) ) ( not ( = ?auto_35505 ?auto_35506 ) ) ( not ( = ?auto_35502 ?auto_35506 ) ) ( not ( = ?auto_35489 ?auto_35506 ) ) ( not ( = ?auto_35500 ?auto_35506 ) ) ( not ( = ?auto_35504 ?auto_35506 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35495 ?auto_35489 ?auto_35506 ?auto_35493 )
      ( MAKE-ON ?auto_35487 ?auto_35488 )
      ( MAKE-ON-VERIFY ?auto_35487 ?auto_35488 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35507 - SURFACE
      ?auto_35508 - SURFACE
    )
    :vars
    (
      ?auto_35515 - HOIST
      ?auto_35520 - PLACE
      ?auto_35521 - PLACE
      ?auto_35513 - HOIST
      ?auto_35525 - SURFACE
      ?auto_35514 - SURFACE
      ?auto_35522 - PLACE
      ?auto_35512 - HOIST
      ?auto_35511 - SURFACE
      ?auto_35517 - SURFACE
      ?auto_35523 - PLACE
      ?auto_35509 - HOIST
      ?auto_35519 - SURFACE
      ?auto_35510 - SURFACE
      ?auto_35524 - PLACE
      ?auto_35526 - HOIST
      ?auto_35516 - SURFACE
      ?auto_35518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35515 ?auto_35520 ) ( IS-CRATE ?auto_35507 ) ( not ( = ?auto_35507 ?auto_35508 ) ) ( not ( = ?auto_35521 ?auto_35520 ) ) ( HOIST-AT ?auto_35513 ?auto_35521 ) ( not ( = ?auto_35515 ?auto_35513 ) ) ( AVAILABLE ?auto_35513 ) ( SURFACE-AT ?auto_35507 ?auto_35521 ) ( ON ?auto_35507 ?auto_35525 ) ( CLEAR ?auto_35507 ) ( not ( = ?auto_35507 ?auto_35525 ) ) ( not ( = ?auto_35508 ?auto_35525 ) ) ( IS-CRATE ?auto_35508 ) ( not ( = ?auto_35507 ?auto_35514 ) ) ( not ( = ?auto_35508 ?auto_35514 ) ) ( not ( = ?auto_35525 ?auto_35514 ) ) ( not ( = ?auto_35522 ?auto_35520 ) ) ( not ( = ?auto_35521 ?auto_35522 ) ) ( HOIST-AT ?auto_35512 ?auto_35522 ) ( not ( = ?auto_35515 ?auto_35512 ) ) ( not ( = ?auto_35513 ?auto_35512 ) ) ( AVAILABLE ?auto_35512 ) ( SURFACE-AT ?auto_35508 ?auto_35522 ) ( ON ?auto_35508 ?auto_35511 ) ( CLEAR ?auto_35508 ) ( not ( = ?auto_35507 ?auto_35511 ) ) ( not ( = ?auto_35508 ?auto_35511 ) ) ( not ( = ?auto_35525 ?auto_35511 ) ) ( not ( = ?auto_35514 ?auto_35511 ) ) ( IS-CRATE ?auto_35514 ) ( not ( = ?auto_35507 ?auto_35517 ) ) ( not ( = ?auto_35508 ?auto_35517 ) ) ( not ( = ?auto_35525 ?auto_35517 ) ) ( not ( = ?auto_35514 ?auto_35517 ) ) ( not ( = ?auto_35511 ?auto_35517 ) ) ( not ( = ?auto_35523 ?auto_35520 ) ) ( not ( = ?auto_35521 ?auto_35523 ) ) ( not ( = ?auto_35522 ?auto_35523 ) ) ( HOIST-AT ?auto_35509 ?auto_35523 ) ( not ( = ?auto_35515 ?auto_35509 ) ) ( not ( = ?auto_35513 ?auto_35509 ) ) ( not ( = ?auto_35512 ?auto_35509 ) ) ( AVAILABLE ?auto_35509 ) ( SURFACE-AT ?auto_35514 ?auto_35523 ) ( ON ?auto_35514 ?auto_35519 ) ( CLEAR ?auto_35514 ) ( not ( = ?auto_35507 ?auto_35519 ) ) ( not ( = ?auto_35508 ?auto_35519 ) ) ( not ( = ?auto_35525 ?auto_35519 ) ) ( not ( = ?auto_35514 ?auto_35519 ) ) ( not ( = ?auto_35511 ?auto_35519 ) ) ( not ( = ?auto_35517 ?auto_35519 ) ) ( SURFACE-AT ?auto_35510 ?auto_35520 ) ( CLEAR ?auto_35510 ) ( IS-CRATE ?auto_35517 ) ( not ( = ?auto_35507 ?auto_35510 ) ) ( not ( = ?auto_35508 ?auto_35510 ) ) ( not ( = ?auto_35525 ?auto_35510 ) ) ( not ( = ?auto_35514 ?auto_35510 ) ) ( not ( = ?auto_35511 ?auto_35510 ) ) ( not ( = ?auto_35517 ?auto_35510 ) ) ( not ( = ?auto_35519 ?auto_35510 ) ) ( AVAILABLE ?auto_35515 ) ( not ( = ?auto_35524 ?auto_35520 ) ) ( not ( = ?auto_35521 ?auto_35524 ) ) ( not ( = ?auto_35522 ?auto_35524 ) ) ( not ( = ?auto_35523 ?auto_35524 ) ) ( HOIST-AT ?auto_35526 ?auto_35524 ) ( not ( = ?auto_35515 ?auto_35526 ) ) ( not ( = ?auto_35513 ?auto_35526 ) ) ( not ( = ?auto_35512 ?auto_35526 ) ) ( not ( = ?auto_35509 ?auto_35526 ) ) ( AVAILABLE ?auto_35526 ) ( SURFACE-AT ?auto_35517 ?auto_35524 ) ( ON ?auto_35517 ?auto_35516 ) ( CLEAR ?auto_35517 ) ( not ( = ?auto_35507 ?auto_35516 ) ) ( not ( = ?auto_35508 ?auto_35516 ) ) ( not ( = ?auto_35525 ?auto_35516 ) ) ( not ( = ?auto_35514 ?auto_35516 ) ) ( not ( = ?auto_35511 ?auto_35516 ) ) ( not ( = ?auto_35517 ?auto_35516 ) ) ( not ( = ?auto_35519 ?auto_35516 ) ) ( not ( = ?auto_35510 ?auto_35516 ) ) ( TRUCK-AT ?auto_35518 ?auto_35520 ) )
    :subtasks
    ( ( !DRIVE ?auto_35518 ?auto_35520 ?auto_35524 )
      ( MAKE-ON ?auto_35507 ?auto_35508 )
      ( MAKE-ON-VERIFY ?auto_35507 ?auto_35508 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35527 - SURFACE
      ?auto_35528 - SURFACE
    )
    :vars
    (
      ?auto_35530 - HOIST
      ?auto_35544 - PLACE
      ?auto_35533 - PLACE
      ?auto_35537 - HOIST
      ?auto_35540 - SURFACE
      ?auto_35538 - SURFACE
      ?auto_35535 - PLACE
      ?auto_35529 - HOIST
      ?auto_35536 - SURFACE
      ?auto_35534 - SURFACE
      ?auto_35545 - PLACE
      ?auto_35532 - HOIST
      ?auto_35543 - SURFACE
      ?auto_35531 - SURFACE
      ?auto_35542 - PLACE
      ?auto_35541 - HOIST
      ?auto_35539 - SURFACE
      ?auto_35546 - TRUCK
      ?auto_35547 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35530 ?auto_35544 ) ( IS-CRATE ?auto_35527 ) ( not ( = ?auto_35527 ?auto_35528 ) ) ( not ( = ?auto_35533 ?auto_35544 ) ) ( HOIST-AT ?auto_35537 ?auto_35533 ) ( not ( = ?auto_35530 ?auto_35537 ) ) ( AVAILABLE ?auto_35537 ) ( SURFACE-AT ?auto_35527 ?auto_35533 ) ( ON ?auto_35527 ?auto_35540 ) ( CLEAR ?auto_35527 ) ( not ( = ?auto_35527 ?auto_35540 ) ) ( not ( = ?auto_35528 ?auto_35540 ) ) ( IS-CRATE ?auto_35528 ) ( not ( = ?auto_35527 ?auto_35538 ) ) ( not ( = ?auto_35528 ?auto_35538 ) ) ( not ( = ?auto_35540 ?auto_35538 ) ) ( not ( = ?auto_35535 ?auto_35544 ) ) ( not ( = ?auto_35533 ?auto_35535 ) ) ( HOIST-AT ?auto_35529 ?auto_35535 ) ( not ( = ?auto_35530 ?auto_35529 ) ) ( not ( = ?auto_35537 ?auto_35529 ) ) ( AVAILABLE ?auto_35529 ) ( SURFACE-AT ?auto_35528 ?auto_35535 ) ( ON ?auto_35528 ?auto_35536 ) ( CLEAR ?auto_35528 ) ( not ( = ?auto_35527 ?auto_35536 ) ) ( not ( = ?auto_35528 ?auto_35536 ) ) ( not ( = ?auto_35540 ?auto_35536 ) ) ( not ( = ?auto_35538 ?auto_35536 ) ) ( IS-CRATE ?auto_35538 ) ( not ( = ?auto_35527 ?auto_35534 ) ) ( not ( = ?auto_35528 ?auto_35534 ) ) ( not ( = ?auto_35540 ?auto_35534 ) ) ( not ( = ?auto_35538 ?auto_35534 ) ) ( not ( = ?auto_35536 ?auto_35534 ) ) ( not ( = ?auto_35545 ?auto_35544 ) ) ( not ( = ?auto_35533 ?auto_35545 ) ) ( not ( = ?auto_35535 ?auto_35545 ) ) ( HOIST-AT ?auto_35532 ?auto_35545 ) ( not ( = ?auto_35530 ?auto_35532 ) ) ( not ( = ?auto_35537 ?auto_35532 ) ) ( not ( = ?auto_35529 ?auto_35532 ) ) ( AVAILABLE ?auto_35532 ) ( SURFACE-AT ?auto_35538 ?auto_35545 ) ( ON ?auto_35538 ?auto_35543 ) ( CLEAR ?auto_35538 ) ( not ( = ?auto_35527 ?auto_35543 ) ) ( not ( = ?auto_35528 ?auto_35543 ) ) ( not ( = ?auto_35540 ?auto_35543 ) ) ( not ( = ?auto_35538 ?auto_35543 ) ) ( not ( = ?auto_35536 ?auto_35543 ) ) ( not ( = ?auto_35534 ?auto_35543 ) ) ( IS-CRATE ?auto_35534 ) ( not ( = ?auto_35527 ?auto_35531 ) ) ( not ( = ?auto_35528 ?auto_35531 ) ) ( not ( = ?auto_35540 ?auto_35531 ) ) ( not ( = ?auto_35538 ?auto_35531 ) ) ( not ( = ?auto_35536 ?auto_35531 ) ) ( not ( = ?auto_35534 ?auto_35531 ) ) ( not ( = ?auto_35543 ?auto_35531 ) ) ( not ( = ?auto_35542 ?auto_35544 ) ) ( not ( = ?auto_35533 ?auto_35542 ) ) ( not ( = ?auto_35535 ?auto_35542 ) ) ( not ( = ?auto_35545 ?auto_35542 ) ) ( HOIST-AT ?auto_35541 ?auto_35542 ) ( not ( = ?auto_35530 ?auto_35541 ) ) ( not ( = ?auto_35537 ?auto_35541 ) ) ( not ( = ?auto_35529 ?auto_35541 ) ) ( not ( = ?auto_35532 ?auto_35541 ) ) ( AVAILABLE ?auto_35541 ) ( SURFACE-AT ?auto_35534 ?auto_35542 ) ( ON ?auto_35534 ?auto_35539 ) ( CLEAR ?auto_35534 ) ( not ( = ?auto_35527 ?auto_35539 ) ) ( not ( = ?auto_35528 ?auto_35539 ) ) ( not ( = ?auto_35540 ?auto_35539 ) ) ( not ( = ?auto_35538 ?auto_35539 ) ) ( not ( = ?auto_35536 ?auto_35539 ) ) ( not ( = ?auto_35534 ?auto_35539 ) ) ( not ( = ?auto_35543 ?auto_35539 ) ) ( not ( = ?auto_35531 ?auto_35539 ) ) ( TRUCK-AT ?auto_35546 ?auto_35544 ) ( SURFACE-AT ?auto_35547 ?auto_35544 ) ( CLEAR ?auto_35547 ) ( LIFTING ?auto_35530 ?auto_35531 ) ( IS-CRATE ?auto_35531 ) ( not ( = ?auto_35527 ?auto_35547 ) ) ( not ( = ?auto_35528 ?auto_35547 ) ) ( not ( = ?auto_35540 ?auto_35547 ) ) ( not ( = ?auto_35538 ?auto_35547 ) ) ( not ( = ?auto_35536 ?auto_35547 ) ) ( not ( = ?auto_35534 ?auto_35547 ) ) ( not ( = ?auto_35543 ?auto_35547 ) ) ( not ( = ?auto_35531 ?auto_35547 ) ) ( not ( = ?auto_35539 ?auto_35547 ) ) )
    :subtasks
    ( ( !DROP ?auto_35530 ?auto_35531 ?auto_35547 ?auto_35544 )
      ( MAKE-ON ?auto_35527 ?auto_35528 )
      ( MAKE-ON-VERIFY ?auto_35527 ?auto_35528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35548 - SURFACE
      ?auto_35549 - SURFACE
    )
    :vars
    (
      ?auto_35552 - HOIST
      ?auto_35550 - PLACE
      ?auto_35567 - PLACE
      ?auto_35557 - HOIST
      ?auto_35556 - SURFACE
      ?auto_35564 - SURFACE
      ?auto_35551 - PLACE
      ?auto_35561 - HOIST
      ?auto_35555 - SURFACE
      ?auto_35568 - SURFACE
      ?auto_35560 - PLACE
      ?auto_35566 - HOIST
      ?auto_35563 - SURFACE
      ?auto_35565 - SURFACE
      ?auto_35554 - PLACE
      ?auto_35562 - HOIST
      ?auto_35553 - SURFACE
      ?auto_35559 - TRUCK
      ?auto_35558 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35552 ?auto_35550 ) ( IS-CRATE ?auto_35548 ) ( not ( = ?auto_35548 ?auto_35549 ) ) ( not ( = ?auto_35567 ?auto_35550 ) ) ( HOIST-AT ?auto_35557 ?auto_35567 ) ( not ( = ?auto_35552 ?auto_35557 ) ) ( AVAILABLE ?auto_35557 ) ( SURFACE-AT ?auto_35548 ?auto_35567 ) ( ON ?auto_35548 ?auto_35556 ) ( CLEAR ?auto_35548 ) ( not ( = ?auto_35548 ?auto_35556 ) ) ( not ( = ?auto_35549 ?auto_35556 ) ) ( IS-CRATE ?auto_35549 ) ( not ( = ?auto_35548 ?auto_35564 ) ) ( not ( = ?auto_35549 ?auto_35564 ) ) ( not ( = ?auto_35556 ?auto_35564 ) ) ( not ( = ?auto_35551 ?auto_35550 ) ) ( not ( = ?auto_35567 ?auto_35551 ) ) ( HOIST-AT ?auto_35561 ?auto_35551 ) ( not ( = ?auto_35552 ?auto_35561 ) ) ( not ( = ?auto_35557 ?auto_35561 ) ) ( AVAILABLE ?auto_35561 ) ( SURFACE-AT ?auto_35549 ?auto_35551 ) ( ON ?auto_35549 ?auto_35555 ) ( CLEAR ?auto_35549 ) ( not ( = ?auto_35548 ?auto_35555 ) ) ( not ( = ?auto_35549 ?auto_35555 ) ) ( not ( = ?auto_35556 ?auto_35555 ) ) ( not ( = ?auto_35564 ?auto_35555 ) ) ( IS-CRATE ?auto_35564 ) ( not ( = ?auto_35548 ?auto_35568 ) ) ( not ( = ?auto_35549 ?auto_35568 ) ) ( not ( = ?auto_35556 ?auto_35568 ) ) ( not ( = ?auto_35564 ?auto_35568 ) ) ( not ( = ?auto_35555 ?auto_35568 ) ) ( not ( = ?auto_35560 ?auto_35550 ) ) ( not ( = ?auto_35567 ?auto_35560 ) ) ( not ( = ?auto_35551 ?auto_35560 ) ) ( HOIST-AT ?auto_35566 ?auto_35560 ) ( not ( = ?auto_35552 ?auto_35566 ) ) ( not ( = ?auto_35557 ?auto_35566 ) ) ( not ( = ?auto_35561 ?auto_35566 ) ) ( AVAILABLE ?auto_35566 ) ( SURFACE-AT ?auto_35564 ?auto_35560 ) ( ON ?auto_35564 ?auto_35563 ) ( CLEAR ?auto_35564 ) ( not ( = ?auto_35548 ?auto_35563 ) ) ( not ( = ?auto_35549 ?auto_35563 ) ) ( not ( = ?auto_35556 ?auto_35563 ) ) ( not ( = ?auto_35564 ?auto_35563 ) ) ( not ( = ?auto_35555 ?auto_35563 ) ) ( not ( = ?auto_35568 ?auto_35563 ) ) ( IS-CRATE ?auto_35568 ) ( not ( = ?auto_35548 ?auto_35565 ) ) ( not ( = ?auto_35549 ?auto_35565 ) ) ( not ( = ?auto_35556 ?auto_35565 ) ) ( not ( = ?auto_35564 ?auto_35565 ) ) ( not ( = ?auto_35555 ?auto_35565 ) ) ( not ( = ?auto_35568 ?auto_35565 ) ) ( not ( = ?auto_35563 ?auto_35565 ) ) ( not ( = ?auto_35554 ?auto_35550 ) ) ( not ( = ?auto_35567 ?auto_35554 ) ) ( not ( = ?auto_35551 ?auto_35554 ) ) ( not ( = ?auto_35560 ?auto_35554 ) ) ( HOIST-AT ?auto_35562 ?auto_35554 ) ( not ( = ?auto_35552 ?auto_35562 ) ) ( not ( = ?auto_35557 ?auto_35562 ) ) ( not ( = ?auto_35561 ?auto_35562 ) ) ( not ( = ?auto_35566 ?auto_35562 ) ) ( AVAILABLE ?auto_35562 ) ( SURFACE-AT ?auto_35568 ?auto_35554 ) ( ON ?auto_35568 ?auto_35553 ) ( CLEAR ?auto_35568 ) ( not ( = ?auto_35548 ?auto_35553 ) ) ( not ( = ?auto_35549 ?auto_35553 ) ) ( not ( = ?auto_35556 ?auto_35553 ) ) ( not ( = ?auto_35564 ?auto_35553 ) ) ( not ( = ?auto_35555 ?auto_35553 ) ) ( not ( = ?auto_35568 ?auto_35553 ) ) ( not ( = ?auto_35563 ?auto_35553 ) ) ( not ( = ?auto_35565 ?auto_35553 ) ) ( TRUCK-AT ?auto_35559 ?auto_35550 ) ( SURFACE-AT ?auto_35558 ?auto_35550 ) ( CLEAR ?auto_35558 ) ( IS-CRATE ?auto_35565 ) ( not ( = ?auto_35548 ?auto_35558 ) ) ( not ( = ?auto_35549 ?auto_35558 ) ) ( not ( = ?auto_35556 ?auto_35558 ) ) ( not ( = ?auto_35564 ?auto_35558 ) ) ( not ( = ?auto_35555 ?auto_35558 ) ) ( not ( = ?auto_35568 ?auto_35558 ) ) ( not ( = ?auto_35563 ?auto_35558 ) ) ( not ( = ?auto_35565 ?auto_35558 ) ) ( not ( = ?auto_35553 ?auto_35558 ) ) ( AVAILABLE ?auto_35552 ) ( IN ?auto_35565 ?auto_35559 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35552 ?auto_35565 ?auto_35559 ?auto_35550 )
      ( MAKE-ON ?auto_35548 ?auto_35549 )
      ( MAKE-ON-VERIFY ?auto_35548 ?auto_35549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35569 - SURFACE
      ?auto_35570 - SURFACE
    )
    :vars
    (
      ?auto_35581 - HOIST
      ?auto_35588 - PLACE
      ?auto_35572 - PLACE
      ?auto_35584 - HOIST
      ?auto_35578 - SURFACE
      ?auto_35589 - SURFACE
      ?auto_35586 - PLACE
      ?auto_35577 - HOIST
      ?auto_35585 - SURFACE
      ?auto_35573 - SURFACE
      ?auto_35579 - PLACE
      ?auto_35571 - HOIST
      ?auto_35583 - SURFACE
      ?auto_35574 - SURFACE
      ?auto_35587 - PLACE
      ?auto_35575 - HOIST
      ?auto_35580 - SURFACE
      ?auto_35576 - SURFACE
      ?auto_35582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35581 ?auto_35588 ) ( IS-CRATE ?auto_35569 ) ( not ( = ?auto_35569 ?auto_35570 ) ) ( not ( = ?auto_35572 ?auto_35588 ) ) ( HOIST-AT ?auto_35584 ?auto_35572 ) ( not ( = ?auto_35581 ?auto_35584 ) ) ( AVAILABLE ?auto_35584 ) ( SURFACE-AT ?auto_35569 ?auto_35572 ) ( ON ?auto_35569 ?auto_35578 ) ( CLEAR ?auto_35569 ) ( not ( = ?auto_35569 ?auto_35578 ) ) ( not ( = ?auto_35570 ?auto_35578 ) ) ( IS-CRATE ?auto_35570 ) ( not ( = ?auto_35569 ?auto_35589 ) ) ( not ( = ?auto_35570 ?auto_35589 ) ) ( not ( = ?auto_35578 ?auto_35589 ) ) ( not ( = ?auto_35586 ?auto_35588 ) ) ( not ( = ?auto_35572 ?auto_35586 ) ) ( HOIST-AT ?auto_35577 ?auto_35586 ) ( not ( = ?auto_35581 ?auto_35577 ) ) ( not ( = ?auto_35584 ?auto_35577 ) ) ( AVAILABLE ?auto_35577 ) ( SURFACE-AT ?auto_35570 ?auto_35586 ) ( ON ?auto_35570 ?auto_35585 ) ( CLEAR ?auto_35570 ) ( not ( = ?auto_35569 ?auto_35585 ) ) ( not ( = ?auto_35570 ?auto_35585 ) ) ( not ( = ?auto_35578 ?auto_35585 ) ) ( not ( = ?auto_35589 ?auto_35585 ) ) ( IS-CRATE ?auto_35589 ) ( not ( = ?auto_35569 ?auto_35573 ) ) ( not ( = ?auto_35570 ?auto_35573 ) ) ( not ( = ?auto_35578 ?auto_35573 ) ) ( not ( = ?auto_35589 ?auto_35573 ) ) ( not ( = ?auto_35585 ?auto_35573 ) ) ( not ( = ?auto_35579 ?auto_35588 ) ) ( not ( = ?auto_35572 ?auto_35579 ) ) ( not ( = ?auto_35586 ?auto_35579 ) ) ( HOIST-AT ?auto_35571 ?auto_35579 ) ( not ( = ?auto_35581 ?auto_35571 ) ) ( not ( = ?auto_35584 ?auto_35571 ) ) ( not ( = ?auto_35577 ?auto_35571 ) ) ( AVAILABLE ?auto_35571 ) ( SURFACE-AT ?auto_35589 ?auto_35579 ) ( ON ?auto_35589 ?auto_35583 ) ( CLEAR ?auto_35589 ) ( not ( = ?auto_35569 ?auto_35583 ) ) ( not ( = ?auto_35570 ?auto_35583 ) ) ( not ( = ?auto_35578 ?auto_35583 ) ) ( not ( = ?auto_35589 ?auto_35583 ) ) ( not ( = ?auto_35585 ?auto_35583 ) ) ( not ( = ?auto_35573 ?auto_35583 ) ) ( IS-CRATE ?auto_35573 ) ( not ( = ?auto_35569 ?auto_35574 ) ) ( not ( = ?auto_35570 ?auto_35574 ) ) ( not ( = ?auto_35578 ?auto_35574 ) ) ( not ( = ?auto_35589 ?auto_35574 ) ) ( not ( = ?auto_35585 ?auto_35574 ) ) ( not ( = ?auto_35573 ?auto_35574 ) ) ( not ( = ?auto_35583 ?auto_35574 ) ) ( not ( = ?auto_35587 ?auto_35588 ) ) ( not ( = ?auto_35572 ?auto_35587 ) ) ( not ( = ?auto_35586 ?auto_35587 ) ) ( not ( = ?auto_35579 ?auto_35587 ) ) ( HOIST-AT ?auto_35575 ?auto_35587 ) ( not ( = ?auto_35581 ?auto_35575 ) ) ( not ( = ?auto_35584 ?auto_35575 ) ) ( not ( = ?auto_35577 ?auto_35575 ) ) ( not ( = ?auto_35571 ?auto_35575 ) ) ( AVAILABLE ?auto_35575 ) ( SURFACE-AT ?auto_35573 ?auto_35587 ) ( ON ?auto_35573 ?auto_35580 ) ( CLEAR ?auto_35573 ) ( not ( = ?auto_35569 ?auto_35580 ) ) ( not ( = ?auto_35570 ?auto_35580 ) ) ( not ( = ?auto_35578 ?auto_35580 ) ) ( not ( = ?auto_35589 ?auto_35580 ) ) ( not ( = ?auto_35585 ?auto_35580 ) ) ( not ( = ?auto_35573 ?auto_35580 ) ) ( not ( = ?auto_35583 ?auto_35580 ) ) ( not ( = ?auto_35574 ?auto_35580 ) ) ( SURFACE-AT ?auto_35576 ?auto_35588 ) ( CLEAR ?auto_35576 ) ( IS-CRATE ?auto_35574 ) ( not ( = ?auto_35569 ?auto_35576 ) ) ( not ( = ?auto_35570 ?auto_35576 ) ) ( not ( = ?auto_35578 ?auto_35576 ) ) ( not ( = ?auto_35589 ?auto_35576 ) ) ( not ( = ?auto_35585 ?auto_35576 ) ) ( not ( = ?auto_35573 ?auto_35576 ) ) ( not ( = ?auto_35583 ?auto_35576 ) ) ( not ( = ?auto_35574 ?auto_35576 ) ) ( not ( = ?auto_35580 ?auto_35576 ) ) ( AVAILABLE ?auto_35581 ) ( IN ?auto_35574 ?auto_35582 ) ( TRUCK-AT ?auto_35582 ?auto_35579 ) )
    :subtasks
    ( ( !DRIVE ?auto_35582 ?auto_35579 ?auto_35588 )
      ( MAKE-ON ?auto_35569 ?auto_35570 )
      ( MAKE-ON-VERIFY ?auto_35569 ?auto_35570 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35590 - SURFACE
      ?auto_35591 - SURFACE
    )
    :vars
    (
      ?auto_35600 - HOIST
      ?auto_35596 - PLACE
      ?auto_35601 - PLACE
      ?auto_35604 - HOIST
      ?auto_35609 - SURFACE
      ?auto_35595 - SURFACE
      ?auto_35610 - PLACE
      ?auto_35606 - HOIST
      ?auto_35605 - SURFACE
      ?auto_35602 - SURFACE
      ?auto_35603 - PLACE
      ?auto_35593 - HOIST
      ?auto_35592 - SURFACE
      ?auto_35597 - SURFACE
      ?auto_35594 - PLACE
      ?auto_35598 - HOIST
      ?auto_35608 - SURFACE
      ?auto_35599 - SURFACE
      ?auto_35607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35600 ?auto_35596 ) ( IS-CRATE ?auto_35590 ) ( not ( = ?auto_35590 ?auto_35591 ) ) ( not ( = ?auto_35601 ?auto_35596 ) ) ( HOIST-AT ?auto_35604 ?auto_35601 ) ( not ( = ?auto_35600 ?auto_35604 ) ) ( AVAILABLE ?auto_35604 ) ( SURFACE-AT ?auto_35590 ?auto_35601 ) ( ON ?auto_35590 ?auto_35609 ) ( CLEAR ?auto_35590 ) ( not ( = ?auto_35590 ?auto_35609 ) ) ( not ( = ?auto_35591 ?auto_35609 ) ) ( IS-CRATE ?auto_35591 ) ( not ( = ?auto_35590 ?auto_35595 ) ) ( not ( = ?auto_35591 ?auto_35595 ) ) ( not ( = ?auto_35609 ?auto_35595 ) ) ( not ( = ?auto_35610 ?auto_35596 ) ) ( not ( = ?auto_35601 ?auto_35610 ) ) ( HOIST-AT ?auto_35606 ?auto_35610 ) ( not ( = ?auto_35600 ?auto_35606 ) ) ( not ( = ?auto_35604 ?auto_35606 ) ) ( AVAILABLE ?auto_35606 ) ( SURFACE-AT ?auto_35591 ?auto_35610 ) ( ON ?auto_35591 ?auto_35605 ) ( CLEAR ?auto_35591 ) ( not ( = ?auto_35590 ?auto_35605 ) ) ( not ( = ?auto_35591 ?auto_35605 ) ) ( not ( = ?auto_35609 ?auto_35605 ) ) ( not ( = ?auto_35595 ?auto_35605 ) ) ( IS-CRATE ?auto_35595 ) ( not ( = ?auto_35590 ?auto_35602 ) ) ( not ( = ?auto_35591 ?auto_35602 ) ) ( not ( = ?auto_35609 ?auto_35602 ) ) ( not ( = ?auto_35595 ?auto_35602 ) ) ( not ( = ?auto_35605 ?auto_35602 ) ) ( not ( = ?auto_35603 ?auto_35596 ) ) ( not ( = ?auto_35601 ?auto_35603 ) ) ( not ( = ?auto_35610 ?auto_35603 ) ) ( HOIST-AT ?auto_35593 ?auto_35603 ) ( not ( = ?auto_35600 ?auto_35593 ) ) ( not ( = ?auto_35604 ?auto_35593 ) ) ( not ( = ?auto_35606 ?auto_35593 ) ) ( SURFACE-AT ?auto_35595 ?auto_35603 ) ( ON ?auto_35595 ?auto_35592 ) ( CLEAR ?auto_35595 ) ( not ( = ?auto_35590 ?auto_35592 ) ) ( not ( = ?auto_35591 ?auto_35592 ) ) ( not ( = ?auto_35609 ?auto_35592 ) ) ( not ( = ?auto_35595 ?auto_35592 ) ) ( not ( = ?auto_35605 ?auto_35592 ) ) ( not ( = ?auto_35602 ?auto_35592 ) ) ( IS-CRATE ?auto_35602 ) ( not ( = ?auto_35590 ?auto_35597 ) ) ( not ( = ?auto_35591 ?auto_35597 ) ) ( not ( = ?auto_35609 ?auto_35597 ) ) ( not ( = ?auto_35595 ?auto_35597 ) ) ( not ( = ?auto_35605 ?auto_35597 ) ) ( not ( = ?auto_35602 ?auto_35597 ) ) ( not ( = ?auto_35592 ?auto_35597 ) ) ( not ( = ?auto_35594 ?auto_35596 ) ) ( not ( = ?auto_35601 ?auto_35594 ) ) ( not ( = ?auto_35610 ?auto_35594 ) ) ( not ( = ?auto_35603 ?auto_35594 ) ) ( HOIST-AT ?auto_35598 ?auto_35594 ) ( not ( = ?auto_35600 ?auto_35598 ) ) ( not ( = ?auto_35604 ?auto_35598 ) ) ( not ( = ?auto_35606 ?auto_35598 ) ) ( not ( = ?auto_35593 ?auto_35598 ) ) ( AVAILABLE ?auto_35598 ) ( SURFACE-AT ?auto_35602 ?auto_35594 ) ( ON ?auto_35602 ?auto_35608 ) ( CLEAR ?auto_35602 ) ( not ( = ?auto_35590 ?auto_35608 ) ) ( not ( = ?auto_35591 ?auto_35608 ) ) ( not ( = ?auto_35609 ?auto_35608 ) ) ( not ( = ?auto_35595 ?auto_35608 ) ) ( not ( = ?auto_35605 ?auto_35608 ) ) ( not ( = ?auto_35602 ?auto_35608 ) ) ( not ( = ?auto_35592 ?auto_35608 ) ) ( not ( = ?auto_35597 ?auto_35608 ) ) ( SURFACE-AT ?auto_35599 ?auto_35596 ) ( CLEAR ?auto_35599 ) ( IS-CRATE ?auto_35597 ) ( not ( = ?auto_35590 ?auto_35599 ) ) ( not ( = ?auto_35591 ?auto_35599 ) ) ( not ( = ?auto_35609 ?auto_35599 ) ) ( not ( = ?auto_35595 ?auto_35599 ) ) ( not ( = ?auto_35605 ?auto_35599 ) ) ( not ( = ?auto_35602 ?auto_35599 ) ) ( not ( = ?auto_35592 ?auto_35599 ) ) ( not ( = ?auto_35597 ?auto_35599 ) ) ( not ( = ?auto_35608 ?auto_35599 ) ) ( AVAILABLE ?auto_35600 ) ( TRUCK-AT ?auto_35607 ?auto_35603 ) ( LIFTING ?auto_35593 ?auto_35597 ) )
    :subtasks
    ( ( !LOAD ?auto_35593 ?auto_35597 ?auto_35607 ?auto_35603 )
      ( MAKE-ON ?auto_35590 ?auto_35591 )
      ( MAKE-ON-VERIFY ?auto_35590 ?auto_35591 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35611 - SURFACE
      ?auto_35612 - SURFACE
    )
    :vars
    (
      ?auto_35613 - HOIST
      ?auto_35628 - PLACE
      ?auto_35618 - PLACE
      ?auto_35620 - HOIST
      ?auto_35625 - SURFACE
      ?auto_35621 - SURFACE
      ?auto_35630 - PLACE
      ?auto_35614 - HOIST
      ?auto_35617 - SURFACE
      ?auto_35626 - SURFACE
      ?auto_35622 - PLACE
      ?auto_35623 - HOIST
      ?auto_35627 - SURFACE
      ?auto_35624 - SURFACE
      ?auto_35619 - PLACE
      ?auto_35615 - HOIST
      ?auto_35631 - SURFACE
      ?auto_35616 - SURFACE
      ?auto_35629 - TRUCK
      ?auto_35632 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35613 ?auto_35628 ) ( IS-CRATE ?auto_35611 ) ( not ( = ?auto_35611 ?auto_35612 ) ) ( not ( = ?auto_35618 ?auto_35628 ) ) ( HOIST-AT ?auto_35620 ?auto_35618 ) ( not ( = ?auto_35613 ?auto_35620 ) ) ( AVAILABLE ?auto_35620 ) ( SURFACE-AT ?auto_35611 ?auto_35618 ) ( ON ?auto_35611 ?auto_35625 ) ( CLEAR ?auto_35611 ) ( not ( = ?auto_35611 ?auto_35625 ) ) ( not ( = ?auto_35612 ?auto_35625 ) ) ( IS-CRATE ?auto_35612 ) ( not ( = ?auto_35611 ?auto_35621 ) ) ( not ( = ?auto_35612 ?auto_35621 ) ) ( not ( = ?auto_35625 ?auto_35621 ) ) ( not ( = ?auto_35630 ?auto_35628 ) ) ( not ( = ?auto_35618 ?auto_35630 ) ) ( HOIST-AT ?auto_35614 ?auto_35630 ) ( not ( = ?auto_35613 ?auto_35614 ) ) ( not ( = ?auto_35620 ?auto_35614 ) ) ( AVAILABLE ?auto_35614 ) ( SURFACE-AT ?auto_35612 ?auto_35630 ) ( ON ?auto_35612 ?auto_35617 ) ( CLEAR ?auto_35612 ) ( not ( = ?auto_35611 ?auto_35617 ) ) ( not ( = ?auto_35612 ?auto_35617 ) ) ( not ( = ?auto_35625 ?auto_35617 ) ) ( not ( = ?auto_35621 ?auto_35617 ) ) ( IS-CRATE ?auto_35621 ) ( not ( = ?auto_35611 ?auto_35626 ) ) ( not ( = ?auto_35612 ?auto_35626 ) ) ( not ( = ?auto_35625 ?auto_35626 ) ) ( not ( = ?auto_35621 ?auto_35626 ) ) ( not ( = ?auto_35617 ?auto_35626 ) ) ( not ( = ?auto_35622 ?auto_35628 ) ) ( not ( = ?auto_35618 ?auto_35622 ) ) ( not ( = ?auto_35630 ?auto_35622 ) ) ( HOIST-AT ?auto_35623 ?auto_35622 ) ( not ( = ?auto_35613 ?auto_35623 ) ) ( not ( = ?auto_35620 ?auto_35623 ) ) ( not ( = ?auto_35614 ?auto_35623 ) ) ( SURFACE-AT ?auto_35621 ?auto_35622 ) ( ON ?auto_35621 ?auto_35627 ) ( CLEAR ?auto_35621 ) ( not ( = ?auto_35611 ?auto_35627 ) ) ( not ( = ?auto_35612 ?auto_35627 ) ) ( not ( = ?auto_35625 ?auto_35627 ) ) ( not ( = ?auto_35621 ?auto_35627 ) ) ( not ( = ?auto_35617 ?auto_35627 ) ) ( not ( = ?auto_35626 ?auto_35627 ) ) ( IS-CRATE ?auto_35626 ) ( not ( = ?auto_35611 ?auto_35624 ) ) ( not ( = ?auto_35612 ?auto_35624 ) ) ( not ( = ?auto_35625 ?auto_35624 ) ) ( not ( = ?auto_35621 ?auto_35624 ) ) ( not ( = ?auto_35617 ?auto_35624 ) ) ( not ( = ?auto_35626 ?auto_35624 ) ) ( not ( = ?auto_35627 ?auto_35624 ) ) ( not ( = ?auto_35619 ?auto_35628 ) ) ( not ( = ?auto_35618 ?auto_35619 ) ) ( not ( = ?auto_35630 ?auto_35619 ) ) ( not ( = ?auto_35622 ?auto_35619 ) ) ( HOIST-AT ?auto_35615 ?auto_35619 ) ( not ( = ?auto_35613 ?auto_35615 ) ) ( not ( = ?auto_35620 ?auto_35615 ) ) ( not ( = ?auto_35614 ?auto_35615 ) ) ( not ( = ?auto_35623 ?auto_35615 ) ) ( AVAILABLE ?auto_35615 ) ( SURFACE-AT ?auto_35626 ?auto_35619 ) ( ON ?auto_35626 ?auto_35631 ) ( CLEAR ?auto_35626 ) ( not ( = ?auto_35611 ?auto_35631 ) ) ( not ( = ?auto_35612 ?auto_35631 ) ) ( not ( = ?auto_35625 ?auto_35631 ) ) ( not ( = ?auto_35621 ?auto_35631 ) ) ( not ( = ?auto_35617 ?auto_35631 ) ) ( not ( = ?auto_35626 ?auto_35631 ) ) ( not ( = ?auto_35627 ?auto_35631 ) ) ( not ( = ?auto_35624 ?auto_35631 ) ) ( SURFACE-AT ?auto_35616 ?auto_35628 ) ( CLEAR ?auto_35616 ) ( IS-CRATE ?auto_35624 ) ( not ( = ?auto_35611 ?auto_35616 ) ) ( not ( = ?auto_35612 ?auto_35616 ) ) ( not ( = ?auto_35625 ?auto_35616 ) ) ( not ( = ?auto_35621 ?auto_35616 ) ) ( not ( = ?auto_35617 ?auto_35616 ) ) ( not ( = ?auto_35626 ?auto_35616 ) ) ( not ( = ?auto_35627 ?auto_35616 ) ) ( not ( = ?auto_35624 ?auto_35616 ) ) ( not ( = ?auto_35631 ?auto_35616 ) ) ( AVAILABLE ?auto_35613 ) ( TRUCK-AT ?auto_35629 ?auto_35622 ) ( AVAILABLE ?auto_35623 ) ( SURFACE-AT ?auto_35624 ?auto_35622 ) ( ON ?auto_35624 ?auto_35632 ) ( CLEAR ?auto_35624 ) ( not ( = ?auto_35611 ?auto_35632 ) ) ( not ( = ?auto_35612 ?auto_35632 ) ) ( not ( = ?auto_35625 ?auto_35632 ) ) ( not ( = ?auto_35621 ?auto_35632 ) ) ( not ( = ?auto_35617 ?auto_35632 ) ) ( not ( = ?auto_35626 ?auto_35632 ) ) ( not ( = ?auto_35627 ?auto_35632 ) ) ( not ( = ?auto_35624 ?auto_35632 ) ) ( not ( = ?auto_35631 ?auto_35632 ) ) ( not ( = ?auto_35616 ?auto_35632 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35623 ?auto_35624 ?auto_35632 ?auto_35622 )
      ( MAKE-ON ?auto_35611 ?auto_35612 )
      ( MAKE-ON-VERIFY ?auto_35611 ?auto_35612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35633 - SURFACE
      ?auto_35634 - SURFACE
    )
    :vars
    (
      ?auto_35644 - HOIST
      ?auto_35651 - PLACE
      ?auto_35654 - PLACE
      ?auto_35639 - HOIST
      ?auto_35637 - SURFACE
      ?auto_35643 - SURFACE
      ?auto_35649 - PLACE
      ?auto_35635 - HOIST
      ?auto_35646 - SURFACE
      ?auto_35647 - SURFACE
      ?auto_35636 - PLACE
      ?auto_35653 - HOIST
      ?auto_35640 - SURFACE
      ?auto_35641 - SURFACE
      ?auto_35652 - PLACE
      ?auto_35645 - HOIST
      ?auto_35650 - SURFACE
      ?auto_35638 - SURFACE
      ?auto_35642 - SURFACE
      ?auto_35648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35644 ?auto_35651 ) ( IS-CRATE ?auto_35633 ) ( not ( = ?auto_35633 ?auto_35634 ) ) ( not ( = ?auto_35654 ?auto_35651 ) ) ( HOIST-AT ?auto_35639 ?auto_35654 ) ( not ( = ?auto_35644 ?auto_35639 ) ) ( AVAILABLE ?auto_35639 ) ( SURFACE-AT ?auto_35633 ?auto_35654 ) ( ON ?auto_35633 ?auto_35637 ) ( CLEAR ?auto_35633 ) ( not ( = ?auto_35633 ?auto_35637 ) ) ( not ( = ?auto_35634 ?auto_35637 ) ) ( IS-CRATE ?auto_35634 ) ( not ( = ?auto_35633 ?auto_35643 ) ) ( not ( = ?auto_35634 ?auto_35643 ) ) ( not ( = ?auto_35637 ?auto_35643 ) ) ( not ( = ?auto_35649 ?auto_35651 ) ) ( not ( = ?auto_35654 ?auto_35649 ) ) ( HOIST-AT ?auto_35635 ?auto_35649 ) ( not ( = ?auto_35644 ?auto_35635 ) ) ( not ( = ?auto_35639 ?auto_35635 ) ) ( AVAILABLE ?auto_35635 ) ( SURFACE-AT ?auto_35634 ?auto_35649 ) ( ON ?auto_35634 ?auto_35646 ) ( CLEAR ?auto_35634 ) ( not ( = ?auto_35633 ?auto_35646 ) ) ( not ( = ?auto_35634 ?auto_35646 ) ) ( not ( = ?auto_35637 ?auto_35646 ) ) ( not ( = ?auto_35643 ?auto_35646 ) ) ( IS-CRATE ?auto_35643 ) ( not ( = ?auto_35633 ?auto_35647 ) ) ( not ( = ?auto_35634 ?auto_35647 ) ) ( not ( = ?auto_35637 ?auto_35647 ) ) ( not ( = ?auto_35643 ?auto_35647 ) ) ( not ( = ?auto_35646 ?auto_35647 ) ) ( not ( = ?auto_35636 ?auto_35651 ) ) ( not ( = ?auto_35654 ?auto_35636 ) ) ( not ( = ?auto_35649 ?auto_35636 ) ) ( HOIST-AT ?auto_35653 ?auto_35636 ) ( not ( = ?auto_35644 ?auto_35653 ) ) ( not ( = ?auto_35639 ?auto_35653 ) ) ( not ( = ?auto_35635 ?auto_35653 ) ) ( SURFACE-AT ?auto_35643 ?auto_35636 ) ( ON ?auto_35643 ?auto_35640 ) ( CLEAR ?auto_35643 ) ( not ( = ?auto_35633 ?auto_35640 ) ) ( not ( = ?auto_35634 ?auto_35640 ) ) ( not ( = ?auto_35637 ?auto_35640 ) ) ( not ( = ?auto_35643 ?auto_35640 ) ) ( not ( = ?auto_35646 ?auto_35640 ) ) ( not ( = ?auto_35647 ?auto_35640 ) ) ( IS-CRATE ?auto_35647 ) ( not ( = ?auto_35633 ?auto_35641 ) ) ( not ( = ?auto_35634 ?auto_35641 ) ) ( not ( = ?auto_35637 ?auto_35641 ) ) ( not ( = ?auto_35643 ?auto_35641 ) ) ( not ( = ?auto_35646 ?auto_35641 ) ) ( not ( = ?auto_35647 ?auto_35641 ) ) ( not ( = ?auto_35640 ?auto_35641 ) ) ( not ( = ?auto_35652 ?auto_35651 ) ) ( not ( = ?auto_35654 ?auto_35652 ) ) ( not ( = ?auto_35649 ?auto_35652 ) ) ( not ( = ?auto_35636 ?auto_35652 ) ) ( HOIST-AT ?auto_35645 ?auto_35652 ) ( not ( = ?auto_35644 ?auto_35645 ) ) ( not ( = ?auto_35639 ?auto_35645 ) ) ( not ( = ?auto_35635 ?auto_35645 ) ) ( not ( = ?auto_35653 ?auto_35645 ) ) ( AVAILABLE ?auto_35645 ) ( SURFACE-AT ?auto_35647 ?auto_35652 ) ( ON ?auto_35647 ?auto_35650 ) ( CLEAR ?auto_35647 ) ( not ( = ?auto_35633 ?auto_35650 ) ) ( not ( = ?auto_35634 ?auto_35650 ) ) ( not ( = ?auto_35637 ?auto_35650 ) ) ( not ( = ?auto_35643 ?auto_35650 ) ) ( not ( = ?auto_35646 ?auto_35650 ) ) ( not ( = ?auto_35647 ?auto_35650 ) ) ( not ( = ?auto_35640 ?auto_35650 ) ) ( not ( = ?auto_35641 ?auto_35650 ) ) ( SURFACE-AT ?auto_35638 ?auto_35651 ) ( CLEAR ?auto_35638 ) ( IS-CRATE ?auto_35641 ) ( not ( = ?auto_35633 ?auto_35638 ) ) ( not ( = ?auto_35634 ?auto_35638 ) ) ( not ( = ?auto_35637 ?auto_35638 ) ) ( not ( = ?auto_35643 ?auto_35638 ) ) ( not ( = ?auto_35646 ?auto_35638 ) ) ( not ( = ?auto_35647 ?auto_35638 ) ) ( not ( = ?auto_35640 ?auto_35638 ) ) ( not ( = ?auto_35641 ?auto_35638 ) ) ( not ( = ?auto_35650 ?auto_35638 ) ) ( AVAILABLE ?auto_35644 ) ( AVAILABLE ?auto_35653 ) ( SURFACE-AT ?auto_35641 ?auto_35636 ) ( ON ?auto_35641 ?auto_35642 ) ( CLEAR ?auto_35641 ) ( not ( = ?auto_35633 ?auto_35642 ) ) ( not ( = ?auto_35634 ?auto_35642 ) ) ( not ( = ?auto_35637 ?auto_35642 ) ) ( not ( = ?auto_35643 ?auto_35642 ) ) ( not ( = ?auto_35646 ?auto_35642 ) ) ( not ( = ?auto_35647 ?auto_35642 ) ) ( not ( = ?auto_35640 ?auto_35642 ) ) ( not ( = ?auto_35641 ?auto_35642 ) ) ( not ( = ?auto_35650 ?auto_35642 ) ) ( not ( = ?auto_35638 ?auto_35642 ) ) ( TRUCK-AT ?auto_35648 ?auto_35651 ) )
    :subtasks
    ( ( !DRIVE ?auto_35648 ?auto_35651 ?auto_35636 )
      ( MAKE-ON ?auto_35633 ?auto_35634 )
      ( MAKE-ON-VERIFY ?auto_35633 ?auto_35634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35655 - SURFACE
      ?auto_35656 - SURFACE
    )
    :vars
    (
      ?auto_35667 - HOIST
      ?auto_35675 - PLACE
      ?auto_35663 - PLACE
      ?auto_35661 - HOIST
      ?auto_35668 - SURFACE
      ?auto_35666 - SURFACE
      ?auto_35664 - PLACE
      ?auto_35657 - HOIST
      ?auto_35662 - SURFACE
      ?auto_35669 - SURFACE
      ?auto_35676 - PLACE
      ?auto_35673 - HOIST
      ?auto_35672 - SURFACE
      ?auto_35658 - SURFACE
      ?auto_35674 - PLACE
      ?auto_35671 - HOIST
      ?auto_35665 - SURFACE
      ?auto_35660 - SURFACE
      ?auto_35659 - SURFACE
      ?auto_35670 - TRUCK
      ?auto_35677 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35667 ?auto_35675 ) ( IS-CRATE ?auto_35655 ) ( not ( = ?auto_35655 ?auto_35656 ) ) ( not ( = ?auto_35663 ?auto_35675 ) ) ( HOIST-AT ?auto_35661 ?auto_35663 ) ( not ( = ?auto_35667 ?auto_35661 ) ) ( AVAILABLE ?auto_35661 ) ( SURFACE-AT ?auto_35655 ?auto_35663 ) ( ON ?auto_35655 ?auto_35668 ) ( CLEAR ?auto_35655 ) ( not ( = ?auto_35655 ?auto_35668 ) ) ( not ( = ?auto_35656 ?auto_35668 ) ) ( IS-CRATE ?auto_35656 ) ( not ( = ?auto_35655 ?auto_35666 ) ) ( not ( = ?auto_35656 ?auto_35666 ) ) ( not ( = ?auto_35668 ?auto_35666 ) ) ( not ( = ?auto_35664 ?auto_35675 ) ) ( not ( = ?auto_35663 ?auto_35664 ) ) ( HOIST-AT ?auto_35657 ?auto_35664 ) ( not ( = ?auto_35667 ?auto_35657 ) ) ( not ( = ?auto_35661 ?auto_35657 ) ) ( AVAILABLE ?auto_35657 ) ( SURFACE-AT ?auto_35656 ?auto_35664 ) ( ON ?auto_35656 ?auto_35662 ) ( CLEAR ?auto_35656 ) ( not ( = ?auto_35655 ?auto_35662 ) ) ( not ( = ?auto_35656 ?auto_35662 ) ) ( not ( = ?auto_35668 ?auto_35662 ) ) ( not ( = ?auto_35666 ?auto_35662 ) ) ( IS-CRATE ?auto_35666 ) ( not ( = ?auto_35655 ?auto_35669 ) ) ( not ( = ?auto_35656 ?auto_35669 ) ) ( not ( = ?auto_35668 ?auto_35669 ) ) ( not ( = ?auto_35666 ?auto_35669 ) ) ( not ( = ?auto_35662 ?auto_35669 ) ) ( not ( = ?auto_35676 ?auto_35675 ) ) ( not ( = ?auto_35663 ?auto_35676 ) ) ( not ( = ?auto_35664 ?auto_35676 ) ) ( HOIST-AT ?auto_35673 ?auto_35676 ) ( not ( = ?auto_35667 ?auto_35673 ) ) ( not ( = ?auto_35661 ?auto_35673 ) ) ( not ( = ?auto_35657 ?auto_35673 ) ) ( SURFACE-AT ?auto_35666 ?auto_35676 ) ( ON ?auto_35666 ?auto_35672 ) ( CLEAR ?auto_35666 ) ( not ( = ?auto_35655 ?auto_35672 ) ) ( not ( = ?auto_35656 ?auto_35672 ) ) ( not ( = ?auto_35668 ?auto_35672 ) ) ( not ( = ?auto_35666 ?auto_35672 ) ) ( not ( = ?auto_35662 ?auto_35672 ) ) ( not ( = ?auto_35669 ?auto_35672 ) ) ( IS-CRATE ?auto_35669 ) ( not ( = ?auto_35655 ?auto_35658 ) ) ( not ( = ?auto_35656 ?auto_35658 ) ) ( not ( = ?auto_35668 ?auto_35658 ) ) ( not ( = ?auto_35666 ?auto_35658 ) ) ( not ( = ?auto_35662 ?auto_35658 ) ) ( not ( = ?auto_35669 ?auto_35658 ) ) ( not ( = ?auto_35672 ?auto_35658 ) ) ( not ( = ?auto_35674 ?auto_35675 ) ) ( not ( = ?auto_35663 ?auto_35674 ) ) ( not ( = ?auto_35664 ?auto_35674 ) ) ( not ( = ?auto_35676 ?auto_35674 ) ) ( HOIST-AT ?auto_35671 ?auto_35674 ) ( not ( = ?auto_35667 ?auto_35671 ) ) ( not ( = ?auto_35661 ?auto_35671 ) ) ( not ( = ?auto_35657 ?auto_35671 ) ) ( not ( = ?auto_35673 ?auto_35671 ) ) ( AVAILABLE ?auto_35671 ) ( SURFACE-AT ?auto_35669 ?auto_35674 ) ( ON ?auto_35669 ?auto_35665 ) ( CLEAR ?auto_35669 ) ( not ( = ?auto_35655 ?auto_35665 ) ) ( not ( = ?auto_35656 ?auto_35665 ) ) ( not ( = ?auto_35668 ?auto_35665 ) ) ( not ( = ?auto_35666 ?auto_35665 ) ) ( not ( = ?auto_35662 ?auto_35665 ) ) ( not ( = ?auto_35669 ?auto_35665 ) ) ( not ( = ?auto_35672 ?auto_35665 ) ) ( not ( = ?auto_35658 ?auto_35665 ) ) ( IS-CRATE ?auto_35658 ) ( not ( = ?auto_35655 ?auto_35660 ) ) ( not ( = ?auto_35656 ?auto_35660 ) ) ( not ( = ?auto_35668 ?auto_35660 ) ) ( not ( = ?auto_35666 ?auto_35660 ) ) ( not ( = ?auto_35662 ?auto_35660 ) ) ( not ( = ?auto_35669 ?auto_35660 ) ) ( not ( = ?auto_35672 ?auto_35660 ) ) ( not ( = ?auto_35658 ?auto_35660 ) ) ( not ( = ?auto_35665 ?auto_35660 ) ) ( AVAILABLE ?auto_35673 ) ( SURFACE-AT ?auto_35658 ?auto_35676 ) ( ON ?auto_35658 ?auto_35659 ) ( CLEAR ?auto_35658 ) ( not ( = ?auto_35655 ?auto_35659 ) ) ( not ( = ?auto_35656 ?auto_35659 ) ) ( not ( = ?auto_35668 ?auto_35659 ) ) ( not ( = ?auto_35666 ?auto_35659 ) ) ( not ( = ?auto_35662 ?auto_35659 ) ) ( not ( = ?auto_35669 ?auto_35659 ) ) ( not ( = ?auto_35672 ?auto_35659 ) ) ( not ( = ?auto_35658 ?auto_35659 ) ) ( not ( = ?auto_35665 ?auto_35659 ) ) ( not ( = ?auto_35660 ?auto_35659 ) ) ( TRUCK-AT ?auto_35670 ?auto_35675 ) ( SURFACE-AT ?auto_35677 ?auto_35675 ) ( CLEAR ?auto_35677 ) ( LIFTING ?auto_35667 ?auto_35660 ) ( IS-CRATE ?auto_35660 ) ( not ( = ?auto_35655 ?auto_35677 ) ) ( not ( = ?auto_35656 ?auto_35677 ) ) ( not ( = ?auto_35668 ?auto_35677 ) ) ( not ( = ?auto_35666 ?auto_35677 ) ) ( not ( = ?auto_35662 ?auto_35677 ) ) ( not ( = ?auto_35669 ?auto_35677 ) ) ( not ( = ?auto_35672 ?auto_35677 ) ) ( not ( = ?auto_35658 ?auto_35677 ) ) ( not ( = ?auto_35665 ?auto_35677 ) ) ( not ( = ?auto_35660 ?auto_35677 ) ) ( not ( = ?auto_35659 ?auto_35677 ) ) )
    :subtasks
    ( ( !DROP ?auto_35667 ?auto_35660 ?auto_35677 ?auto_35675 )
      ( MAKE-ON ?auto_35655 ?auto_35656 )
      ( MAKE-ON-VERIFY ?auto_35655 ?auto_35656 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35678 - SURFACE
      ?auto_35679 - SURFACE
    )
    :vars
    (
      ?auto_35697 - HOIST
      ?auto_35688 - PLACE
      ?auto_35699 - PLACE
      ?auto_35687 - HOIST
      ?auto_35680 - SURFACE
      ?auto_35684 - SURFACE
      ?auto_35685 - PLACE
      ?auto_35681 - HOIST
      ?auto_35694 - SURFACE
      ?auto_35695 - SURFACE
      ?auto_35689 - PLACE
      ?auto_35683 - HOIST
      ?auto_35700 - SURFACE
      ?auto_35686 - SURFACE
      ?auto_35682 - PLACE
      ?auto_35698 - HOIST
      ?auto_35693 - SURFACE
      ?auto_35691 - SURFACE
      ?auto_35692 - SURFACE
      ?auto_35696 - TRUCK
      ?auto_35690 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35697 ?auto_35688 ) ( IS-CRATE ?auto_35678 ) ( not ( = ?auto_35678 ?auto_35679 ) ) ( not ( = ?auto_35699 ?auto_35688 ) ) ( HOIST-AT ?auto_35687 ?auto_35699 ) ( not ( = ?auto_35697 ?auto_35687 ) ) ( AVAILABLE ?auto_35687 ) ( SURFACE-AT ?auto_35678 ?auto_35699 ) ( ON ?auto_35678 ?auto_35680 ) ( CLEAR ?auto_35678 ) ( not ( = ?auto_35678 ?auto_35680 ) ) ( not ( = ?auto_35679 ?auto_35680 ) ) ( IS-CRATE ?auto_35679 ) ( not ( = ?auto_35678 ?auto_35684 ) ) ( not ( = ?auto_35679 ?auto_35684 ) ) ( not ( = ?auto_35680 ?auto_35684 ) ) ( not ( = ?auto_35685 ?auto_35688 ) ) ( not ( = ?auto_35699 ?auto_35685 ) ) ( HOIST-AT ?auto_35681 ?auto_35685 ) ( not ( = ?auto_35697 ?auto_35681 ) ) ( not ( = ?auto_35687 ?auto_35681 ) ) ( AVAILABLE ?auto_35681 ) ( SURFACE-AT ?auto_35679 ?auto_35685 ) ( ON ?auto_35679 ?auto_35694 ) ( CLEAR ?auto_35679 ) ( not ( = ?auto_35678 ?auto_35694 ) ) ( not ( = ?auto_35679 ?auto_35694 ) ) ( not ( = ?auto_35680 ?auto_35694 ) ) ( not ( = ?auto_35684 ?auto_35694 ) ) ( IS-CRATE ?auto_35684 ) ( not ( = ?auto_35678 ?auto_35695 ) ) ( not ( = ?auto_35679 ?auto_35695 ) ) ( not ( = ?auto_35680 ?auto_35695 ) ) ( not ( = ?auto_35684 ?auto_35695 ) ) ( not ( = ?auto_35694 ?auto_35695 ) ) ( not ( = ?auto_35689 ?auto_35688 ) ) ( not ( = ?auto_35699 ?auto_35689 ) ) ( not ( = ?auto_35685 ?auto_35689 ) ) ( HOIST-AT ?auto_35683 ?auto_35689 ) ( not ( = ?auto_35697 ?auto_35683 ) ) ( not ( = ?auto_35687 ?auto_35683 ) ) ( not ( = ?auto_35681 ?auto_35683 ) ) ( SURFACE-AT ?auto_35684 ?auto_35689 ) ( ON ?auto_35684 ?auto_35700 ) ( CLEAR ?auto_35684 ) ( not ( = ?auto_35678 ?auto_35700 ) ) ( not ( = ?auto_35679 ?auto_35700 ) ) ( not ( = ?auto_35680 ?auto_35700 ) ) ( not ( = ?auto_35684 ?auto_35700 ) ) ( not ( = ?auto_35694 ?auto_35700 ) ) ( not ( = ?auto_35695 ?auto_35700 ) ) ( IS-CRATE ?auto_35695 ) ( not ( = ?auto_35678 ?auto_35686 ) ) ( not ( = ?auto_35679 ?auto_35686 ) ) ( not ( = ?auto_35680 ?auto_35686 ) ) ( not ( = ?auto_35684 ?auto_35686 ) ) ( not ( = ?auto_35694 ?auto_35686 ) ) ( not ( = ?auto_35695 ?auto_35686 ) ) ( not ( = ?auto_35700 ?auto_35686 ) ) ( not ( = ?auto_35682 ?auto_35688 ) ) ( not ( = ?auto_35699 ?auto_35682 ) ) ( not ( = ?auto_35685 ?auto_35682 ) ) ( not ( = ?auto_35689 ?auto_35682 ) ) ( HOIST-AT ?auto_35698 ?auto_35682 ) ( not ( = ?auto_35697 ?auto_35698 ) ) ( not ( = ?auto_35687 ?auto_35698 ) ) ( not ( = ?auto_35681 ?auto_35698 ) ) ( not ( = ?auto_35683 ?auto_35698 ) ) ( AVAILABLE ?auto_35698 ) ( SURFACE-AT ?auto_35695 ?auto_35682 ) ( ON ?auto_35695 ?auto_35693 ) ( CLEAR ?auto_35695 ) ( not ( = ?auto_35678 ?auto_35693 ) ) ( not ( = ?auto_35679 ?auto_35693 ) ) ( not ( = ?auto_35680 ?auto_35693 ) ) ( not ( = ?auto_35684 ?auto_35693 ) ) ( not ( = ?auto_35694 ?auto_35693 ) ) ( not ( = ?auto_35695 ?auto_35693 ) ) ( not ( = ?auto_35700 ?auto_35693 ) ) ( not ( = ?auto_35686 ?auto_35693 ) ) ( IS-CRATE ?auto_35686 ) ( not ( = ?auto_35678 ?auto_35691 ) ) ( not ( = ?auto_35679 ?auto_35691 ) ) ( not ( = ?auto_35680 ?auto_35691 ) ) ( not ( = ?auto_35684 ?auto_35691 ) ) ( not ( = ?auto_35694 ?auto_35691 ) ) ( not ( = ?auto_35695 ?auto_35691 ) ) ( not ( = ?auto_35700 ?auto_35691 ) ) ( not ( = ?auto_35686 ?auto_35691 ) ) ( not ( = ?auto_35693 ?auto_35691 ) ) ( AVAILABLE ?auto_35683 ) ( SURFACE-AT ?auto_35686 ?auto_35689 ) ( ON ?auto_35686 ?auto_35692 ) ( CLEAR ?auto_35686 ) ( not ( = ?auto_35678 ?auto_35692 ) ) ( not ( = ?auto_35679 ?auto_35692 ) ) ( not ( = ?auto_35680 ?auto_35692 ) ) ( not ( = ?auto_35684 ?auto_35692 ) ) ( not ( = ?auto_35694 ?auto_35692 ) ) ( not ( = ?auto_35695 ?auto_35692 ) ) ( not ( = ?auto_35700 ?auto_35692 ) ) ( not ( = ?auto_35686 ?auto_35692 ) ) ( not ( = ?auto_35693 ?auto_35692 ) ) ( not ( = ?auto_35691 ?auto_35692 ) ) ( TRUCK-AT ?auto_35696 ?auto_35688 ) ( SURFACE-AT ?auto_35690 ?auto_35688 ) ( CLEAR ?auto_35690 ) ( IS-CRATE ?auto_35691 ) ( not ( = ?auto_35678 ?auto_35690 ) ) ( not ( = ?auto_35679 ?auto_35690 ) ) ( not ( = ?auto_35680 ?auto_35690 ) ) ( not ( = ?auto_35684 ?auto_35690 ) ) ( not ( = ?auto_35694 ?auto_35690 ) ) ( not ( = ?auto_35695 ?auto_35690 ) ) ( not ( = ?auto_35700 ?auto_35690 ) ) ( not ( = ?auto_35686 ?auto_35690 ) ) ( not ( = ?auto_35693 ?auto_35690 ) ) ( not ( = ?auto_35691 ?auto_35690 ) ) ( not ( = ?auto_35692 ?auto_35690 ) ) ( AVAILABLE ?auto_35697 ) ( IN ?auto_35691 ?auto_35696 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35697 ?auto_35691 ?auto_35696 ?auto_35688 )
      ( MAKE-ON ?auto_35678 ?auto_35679 )
      ( MAKE-ON-VERIFY ?auto_35678 ?auto_35679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35701 - SURFACE
      ?auto_35702 - SURFACE
    )
    :vars
    (
      ?auto_35718 - HOIST
      ?auto_35713 - PLACE
      ?auto_35714 - PLACE
      ?auto_35706 - HOIST
      ?auto_35703 - SURFACE
      ?auto_35717 - SURFACE
      ?auto_35710 - PLACE
      ?auto_35715 - HOIST
      ?auto_35723 - SURFACE
      ?auto_35709 - SURFACE
      ?auto_35719 - PLACE
      ?auto_35705 - HOIST
      ?auto_35704 - SURFACE
      ?auto_35712 - SURFACE
      ?auto_35711 - PLACE
      ?auto_35721 - HOIST
      ?auto_35708 - SURFACE
      ?auto_35707 - SURFACE
      ?auto_35720 - SURFACE
      ?auto_35716 - SURFACE
      ?auto_35722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35718 ?auto_35713 ) ( IS-CRATE ?auto_35701 ) ( not ( = ?auto_35701 ?auto_35702 ) ) ( not ( = ?auto_35714 ?auto_35713 ) ) ( HOIST-AT ?auto_35706 ?auto_35714 ) ( not ( = ?auto_35718 ?auto_35706 ) ) ( AVAILABLE ?auto_35706 ) ( SURFACE-AT ?auto_35701 ?auto_35714 ) ( ON ?auto_35701 ?auto_35703 ) ( CLEAR ?auto_35701 ) ( not ( = ?auto_35701 ?auto_35703 ) ) ( not ( = ?auto_35702 ?auto_35703 ) ) ( IS-CRATE ?auto_35702 ) ( not ( = ?auto_35701 ?auto_35717 ) ) ( not ( = ?auto_35702 ?auto_35717 ) ) ( not ( = ?auto_35703 ?auto_35717 ) ) ( not ( = ?auto_35710 ?auto_35713 ) ) ( not ( = ?auto_35714 ?auto_35710 ) ) ( HOIST-AT ?auto_35715 ?auto_35710 ) ( not ( = ?auto_35718 ?auto_35715 ) ) ( not ( = ?auto_35706 ?auto_35715 ) ) ( AVAILABLE ?auto_35715 ) ( SURFACE-AT ?auto_35702 ?auto_35710 ) ( ON ?auto_35702 ?auto_35723 ) ( CLEAR ?auto_35702 ) ( not ( = ?auto_35701 ?auto_35723 ) ) ( not ( = ?auto_35702 ?auto_35723 ) ) ( not ( = ?auto_35703 ?auto_35723 ) ) ( not ( = ?auto_35717 ?auto_35723 ) ) ( IS-CRATE ?auto_35717 ) ( not ( = ?auto_35701 ?auto_35709 ) ) ( not ( = ?auto_35702 ?auto_35709 ) ) ( not ( = ?auto_35703 ?auto_35709 ) ) ( not ( = ?auto_35717 ?auto_35709 ) ) ( not ( = ?auto_35723 ?auto_35709 ) ) ( not ( = ?auto_35719 ?auto_35713 ) ) ( not ( = ?auto_35714 ?auto_35719 ) ) ( not ( = ?auto_35710 ?auto_35719 ) ) ( HOIST-AT ?auto_35705 ?auto_35719 ) ( not ( = ?auto_35718 ?auto_35705 ) ) ( not ( = ?auto_35706 ?auto_35705 ) ) ( not ( = ?auto_35715 ?auto_35705 ) ) ( SURFACE-AT ?auto_35717 ?auto_35719 ) ( ON ?auto_35717 ?auto_35704 ) ( CLEAR ?auto_35717 ) ( not ( = ?auto_35701 ?auto_35704 ) ) ( not ( = ?auto_35702 ?auto_35704 ) ) ( not ( = ?auto_35703 ?auto_35704 ) ) ( not ( = ?auto_35717 ?auto_35704 ) ) ( not ( = ?auto_35723 ?auto_35704 ) ) ( not ( = ?auto_35709 ?auto_35704 ) ) ( IS-CRATE ?auto_35709 ) ( not ( = ?auto_35701 ?auto_35712 ) ) ( not ( = ?auto_35702 ?auto_35712 ) ) ( not ( = ?auto_35703 ?auto_35712 ) ) ( not ( = ?auto_35717 ?auto_35712 ) ) ( not ( = ?auto_35723 ?auto_35712 ) ) ( not ( = ?auto_35709 ?auto_35712 ) ) ( not ( = ?auto_35704 ?auto_35712 ) ) ( not ( = ?auto_35711 ?auto_35713 ) ) ( not ( = ?auto_35714 ?auto_35711 ) ) ( not ( = ?auto_35710 ?auto_35711 ) ) ( not ( = ?auto_35719 ?auto_35711 ) ) ( HOIST-AT ?auto_35721 ?auto_35711 ) ( not ( = ?auto_35718 ?auto_35721 ) ) ( not ( = ?auto_35706 ?auto_35721 ) ) ( not ( = ?auto_35715 ?auto_35721 ) ) ( not ( = ?auto_35705 ?auto_35721 ) ) ( AVAILABLE ?auto_35721 ) ( SURFACE-AT ?auto_35709 ?auto_35711 ) ( ON ?auto_35709 ?auto_35708 ) ( CLEAR ?auto_35709 ) ( not ( = ?auto_35701 ?auto_35708 ) ) ( not ( = ?auto_35702 ?auto_35708 ) ) ( not ( = ?auto_35703 ?auto_35708 ) ) ( not ( = ?auto_35717 ?auto_35708 ) ) ( not ( = ?auto_35723 ?auto_35708 ) ) ( not ( = ?auto_35709 ?auto_35708 ) ) ( not ( = ?auto_35704 ?auto_35708 ) ) ( not ( = ?auto_35712 ?auto_35708 ) ) ( IS-CRATE ?auto_35712 ) ( not ( = ?auto_35701 ?auto_35707 ) ) ( not ( = ?auto_35702 ?auto_35707 ) ) ( not ( = ?auto_35703 ?auto_35707 ) ) ( not ( = ?auto_35717 ?auto_35707 ) ) ( not ( = ?auto_35723 ?auto_35707 ) ) ( not ( = ?auto_35709 ?auto_35707 ) ) ( not ( = ?auto_35704 ?auto_35707 ) ) ( not ( = ?auto_35712 ?auto_35707 ) ) ( not ( = ?auto_35708 ?auto_35707 ) ) ( AVAILABLE ?auto_35705 ) ( SURFACE-AT ?auto_35712 ?auto_35719 ) ( ON ?auto_35712 ?auto_35720 ) ( CLEAR ?auto_35712 ) ( not ( = ?auto_35701 ?auto_35720 ) ) ( not ( = ?auto_35702 ?auto_35720 ) ) ( not ( = ?auto_35703 ?auto_35720 ) ) ( not ( = ?auto_35717 ?auto_35720 ) ) ( not ( = ?auto_35723 ?auto_35720 ) ) ( not ( = ?auto_35709 ?auto_35720 ) ) ( not ( = ?auto_35704 ?auto_35720 ) ) ( not ( = ?auto_35712 ?auto_35720 ) ) ( not ( = ?auto_35708 ?auto_35720 ) ) ( not ( = ?auto_35707 ?auto_35720 ) ) ( SURFACE-AT ?auto_35716 ?auto_35713 ) ( CLEAR ?auto_35716 ) ( IS-CRATE ?auto_35707 ) ( not ( = ?auto_35701 ?auto_35716 ) ) ( not ( = ?auto_35702 ?auto_35716 ) ) ( not ( = ?auto_35703 ?auto_35716 ) ) ( not ( = ?auto_35717 ?auto_35716 ) ) ( not ( = ?auto_35723 ?auto_35716 ) ) ( not ( = ?auto_35709 ?auto_35716 ) ) ( not ( = ?auto_35704 ?auto_35716 ) ) ( not ( = ?auto_35712 ?auto_35716 ) ) ( not ( = ?auto_35708 ?auto_35716 ) ) ( not ( = ?auto_35707 ?auto_35716 ) ) ( not ( = ?auto_35720 ?auto_35716 ) ) ( AVAILABLE ?auto_35718 ) ( IN ?auto_35707 ?auto_35722 ) ( TRUCK-AT ?auto_35722 ?auto_35714 ) )
    :subtasks
    ( ( !DRIVE ?auto_35722 ?auto_35714 ?auto_35713 )
      ( MAKE-ON ?auto_35701 ?auto_35702 )
      ( MAKE-ON-VERIFY ?auto_35701 ?auto_35702 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35724 - SURFACE
      ?auto_35725 - SURFACE
    )
    :vars
    (
      ?auto_35727 - HOIST
      ?auto_35731 - PLACE
      ?auto_35733 - PLACE
      ?auto_35743 - HOIST
      ?auto_35726 - SURFACE
      ?auto_35741 - SURFACE
      ?auto_35742 - PLACE
      ?auto_35740 - HOIST
      ?auto_35737 - SURFACE
      ?auto_35728 - SURFACE
      ?auto_35744 - PLACE
      ?auto_35745 - HOIST
      ?auto_35746 - SURFACE
      ?auto_35732 - SURFACE
      ?auto_35739 - PLACE
      ?auto_35735 - HOIST
      ?auto_35738 - SURFACE
      ?auto_35730 - SURFACE
      ?auto_35734 - SURFACE
      ?auto_35729 - SURFACE
      ?auto_35736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35727 ?auto_35731 ) ( IS-CRATE ?auto_35724 ) ( not ( = ?auto_35724 ?auto_35725 ) ) ( not ( = ?auto_35733 ?auto_35731 ) ) ( HOIST-AT ?auto_35743 ?auto_35733 ) ( not ( = ?auto_35727 ?auto_35743 ) ) ( SURFACE-AT ?auto_35724 ?auto_35733 ) ( ON ?auto_35724 ?auto_35726 ) ( CLEAR ?auto_35724 ) ( not ( = ?auto_35724 ?auto_35726 ) ) ( not ( = ?auto_35725 ?auto_35726 ) ) ( IS-CRATE ?auto_35725 ) ( not ( = ?auto_35724 ?auto_35741 ) ) ( not ( = ?auto_35725 ?auto_35741 ) ) ( not ( = ?auto_35726 ?auto_35741 ) ) ( not ( = ?auto_35742 ?auto_35731 ) ) ( not ( = ?auto_35733 ?auto_35742 ) ) ( HOIST-AT ?auto_35740 ?auto_35742 ) ( not ( = ?auto_35727 ?auto_35740 ) ) ( not ( = ?auto_35743 ?auto_35740 ) ) ( AVAILABLE ?auto_35740 ) ( SURFACE-AT ?auto_35725 ?auto_35742 ) ( ON ?auto_35725 ?auto_35737 ) ( CLEAR ?auto_35725 ) ( not ( = ?auto_35724 ?auto_35737 ) ) ( not ( = ?auto_35725 ?auto_35737 ) ) ( not ( = ?auto_35726 ?auto_35737 ) ) ( not ( = ?auto_35741 ?auto_35737 ) ) ( IS-CRATE ?auto_35741 ) ( not ( = ?auto_35724 ?auto_35728 ) ) ( not ( = ?auto_35725 ?auto_35728 ) ) ( not ( = ?auto_35726 ?auto_35728 ) ) ( not ( = ?auto_35741 ?auto_35728 ) ) ( not ( = ?auto_35737 ?auto_35728 ) ) ( not ( = ?auto_35744 ?auto_35731 ) ) ( not ( = ?auto_35733 ?auto_35744 ) ) ( not ( = ?auto_35742 ?auto_35744 ) ) ( HOIST-AT ?auto_35745 ?auto_35744 ) ( not ( = ?auto_35727 ?auto_35745 ) ) ( not ( = ?auto_35743 ?auto_35745 ) ) ( not ( = ?auto_35740 ?auto_35745 ) ) ( SURFACE-AT ?auto_35741 ?auto_35744 ) ( ON ?auto_35741 ?auto_35746 ) ( CLEAR ?auto_35741 ) ( not ( = ?auto_35724 ?auto_35746 ) ) ( not ( = ?auto_35725 ?auto_35746 ) ) ( not ( = ?auto_35726 ?auto_35746 ) ) ( not ( = ?auto_35741 ?auto_35746 ) ) ( not ( = ?auto_35737 ?auto_35746 ) ) ( not ( = ?auto_35728 ?auto_35746 ) ) ( IS-CRATE ?auto_35728 ) ( not ( = ?auto_35724 ?auto_35732 ) ) ( not ( = ?auto_35725 ?auto_35732 ) ) ( not ( = ?auto_35726 ?auto_35732 ) ) ( not ( = ?auto_35741 ?auto_35732 ) ) ( not ( = ?auto_35737 ?auto_35732 ) ) ( not ( = ?auto_35728 ?auto_35732 ) ) ( not ( = ?auto_35746 ?auto_35732 ) ) ( not ( = ?auto_35739 ?auto_35731 ) ) ( not ( = ?auto_35733 ?auto_35739 ) ) ( not ( = ?auto_35742 ?auto_35739 ) ) ( not ( = ?auto_35744 ?auto_35739 ) ) ( HOIST-AT ?auto_35735 ?auto_35739 ) ( not ( = ?auto_35727 ?auto_35735 ) ) ( not ( = ?auto_35743 ?auto_35735 ) ) ( not ( = ?auto_35740 ?auto_35735 ) ) ( not ( = ?auto_35745 ?auto_35735 ) ) ( AVAILABLE ?auto_35735 ) ( SURFACE-AT ?auto_35728 ?auto_35739 ) ( ON ?auto_35728 ?auto_35738 ) ( CLEAR ?auto_35728 ) ( not ( = ?auto_35724 ?auto_35738 ) ) ( not ( = ?auto_35725 ?auto_35738 ) ) ( not ( = ?auto_35726 ?auto_35738 ) ) ( not ( = ?auto_35741 ?auto_35738 ) ) ( not ( = ?auto_35737 ?auto_35738 ) ) ( not ( = ?auto_35728 ?auto_35738 ) ) ( not ( = ?auto_35746 ?auto_35738 ) ) ( not ( = ?auto_35732 ?auto_35738 ) ) ( IS-CRATE ?auto_35732 ) ( not ( = ?auto_35724 ?auto_35730 ) ) ( not ( = ?auto_35725 ?auto_35730 ) ) ( not ( = ?auto_35726 ?auto_35730 ) ) ( not ( = ?auto_35741 ?auto_35730 ) ) ( not ( = ?auto_35737 ?auto_35730 ) ) ( not ( = ?auto_35728 ?auto_35730 ) ) ( not ( = ?auto_35746 ?auto_35730 ) ) ( not ( = ?auto_35732 ?auto_35730 ) ) ( not ( = ?auto_35738 ?auto_35730 ) ) ( AVAILABLE ?auto_35745 ) ( SURFACE-AT ?auto_35732 ?auto_35744 ) ( ON ?auto_35732 ?auto_35734 ) ( CLEAR ?auto_35732 ) ( not ( = ?auto_35724 ?auto_35734 ) ) ( not ( = ?auto_35725 ?auto_35734 ) ) ( not ( = ?auto_35726 ?auto_35734 ) ) ( not ( = ?auto_35741 ?auto_35734 ) ) ( not ( = ?auto_35737 ?auto_35734 ) ) ( not ( = ?auto_35728 ?auto_35734 ) ) ( not ( = ?auto_35746 ?auto_35734 ) ) ( not ( = ?auto_35732 ?auto_35734 ) ) ( not ( = ?auto_35738 ?auto_35734 ) ) ( not ( = ?auto_35730 ?auto_35734 ) ) ( SURFACE-AT ?auto_35729 ?auto_35731 ) ( CLEAR ?auto_35729 ) ( IS-CRATE ?auto_35730 ) ( not ( = ?auto_35724 ?auto_35729 ) ) ( not ( = ?auto_35725 ?auto_35729 ) ) ( not ( = ?auto_35726 ?auto_35729 ) ) ( not ( = ?auto_35741 ?auto_35729 ) ) ( not ( = ?auto_35737 ?auto_35729 ) ) ( not ( = ?auto_35728 ?auto_35729 ) ) ( not ( = ?auto_35746 ?auto_35729 ) ) ( not ( = ?auto_35732 ?auto_35729 ) ) ( not ( = ?auto_35738 ?auto_35729 ) ) ( not ( = ?auto_35730 ?auto_35729 ) ) ( not ( = ?auto_35734 ?auto_35729 ) ) ( AVAILABLE ?auto_35727 ) ( TRUCK-AT ?auto_35736 ?auto_35733 ) ( LIFTING ?auto_35743 ?auto_35730 ) )
    :subtasks
    ( ( !LOAD ?auto_35743 ?auto_35730 ?auto_35736 ?auto_35733 )
      ( MAKE-ON ?auto_35724 ?auto_35725 )
      ( MAKE-ON-VERIFY ?auto_35724 ?auto_35725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35747 - SURFACE
      ?auto_35748 - SURFACE
    )
    :vars
    (
      ?auto_35763 - HOIST
      ?auto_35751 - PLACE
      ?auto_35761 - PLACE
      ?auto_35757 - HOIST
      ?auto_35758 - SURFACE
      ?auto_35767 - SURFACE
      ?auto_35754 - PLACE
      ?auto_35759 - HOIST
      ?auto_35753 - SURFACE
      ?auto_35762 - SURFACE
      ?auto_35760 - PLACE
      ?auto_35769 - HOIST
      ?auto_35749 - SURFACE
      ?auto_35756 - SURFACE
      ?auto_35755 - PLACE
      ?auto_35750 - HOIST
      ?auto_35766 - SURFACE
      ?auto_35765 - SURFACE
      ?auto_35768 - SURFACE
      ?auto_35764 - SURFACE
      ?auto_35752 - TRUCK
      ?auto_35770 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35763 ?auto_35751 ) ( IS-CRATE ?auto_35747 ) ( not ( = ?auto_35747 ?auto_35748 ) ) ( not ( = ?auto_35761 ?auto_35751 ) ) ( HOIST-AT ?auto_35757 ?auto_35761 ) ( not ( = ?auto_35763 ?auto_35757 ) ) ( SURFACE-AT ?auto_35747 ?auto_35761 ) ( ON ?auto_35747 ?auto_35758 ) ( CLEAR ?auto_35747 ) ( not ( = ?auto_35747 ?auto_35758 ) ) ( not ( = ?auto_35748 ?auto_35758 ) ) ( IS-CRATE ?auto_35748 ) ( not ( = ?auto_35747 ?auto_35767 ) ) ( not ( = ?auto_35748 ?auto_35767 ) ) ( not ( = ?auto_35758 ?auto_35767 ) ) ( not ( = ?auto_35754 ?auto_35751 ) ) ( not ( = ?auto_35761 ?auto_35754 ) ) ( HOIST-AT ?auto_35759 ?auto_35754 ) ( not ( = ?auto_35763 ?auto_35759 ) ) ( not ( = ?auto_35757 ?auto_35759 ) ) ( AVAILABLE ?auto_35759 ) ( SURFACE-AT ?auto_35748 ?auto_35754 ) ( ON ?auto_35748 ?auto_35753 ) ( CLEAR ?auto_35748 ) ( not ( = ?auto_35747 ?auto_35753 ) ) ( not ( = ?auto_35748 ?auto_35753 ) ) ( not ( = ?auto_35758 ?auto_35753 ) ) ( not ( = ?auto_35767 ?auto_35753 ) ) ( IS-CRATE ?auto_35767 ) ( not ( = ?auto_35747 ?auto_35762 ) ) ( not ( = ?auto_35748 ?auto_35762 ) ) ( not ( = ?auto_35758 ?auto_35762 ) ) ( not ( = ?auto_35767 ?auto_35762 ) ) ( not ( = ?auto_35753 ?auto_35762 ) ) ( not ( = ?auto_35760 ?auto_35751 ) ) ( not ( = ?auto_35761 ?auto_35760 ) ) ( not ( = ?auto_35754 ?auto_35760 ) ) ( HOIST-AT ?auto_35769 ?auto_35760 ) ( not ( = ?auto_35763 ?auto_35769 ) ) ( not ( = ?auto_35757 ?auto_35769 ) ) ( not ( = ?auto_35759 ?auto_35769 ) ) ( SURFACE-AT ?auto_35767 ?auto_35760 ) ( ON ?auto_35767 ?auto_35749 ) ( CLEAR ?auto_35767 ) ( not ( = ?auto_35747 ?auto_35749 ) ) ( not ( = ?auto_35748 ?auto_35749 ) ) ( not ( = ?auto_35758 ?auto_35749 ) ) ( not ( = ?auto_35767 ?auto_35749 ) ) ( not ( = ?auto_35753 ?auto_35749 ) ) ( not ( = ?auto_35762 ?auto_35749 ) ) ( IS-CRATE ?auto_35762 ) ( not ( = ?auto_35747 ?auto_35756 ) ) ( not ( = ?auto_35748 ?auto_35756 ) ) ( not ( = ?auto_35758 ?auto_35756 ) ) ( not ( = ?auto_35767 ?auto_35756 ) ) ( not ( = ?auto_35753 ?auto_35756 ) ) ( not ( = ?auto_35762 ?auto_35756 ) ) ( not ( = ?auto_35749 ?auto_35756 ) ) ( not ( = ?auto_35755 ?auto_35751 ) ) ( not ( = ?auto_35761 ?auto_35755 ) ) ( not ( = ?auto_35754 ?auto_35755 ) ) ( not ( = ?auto_35760 ?auto_35755 ) ) ( HOIST-AT ?auto_35750 ?auto_35755 ) ( not ( = ?auto_35763 ?auto_35750 ) ) ( not ( = ?auto_35757 ?auto_35750 ) ) ( not ( = ?auto_35759 ?auto_35750 ) ) ( not ( = ?auto_35769 ?auto_35750 ) ) ( AVAILABLE ?auto_35750 ) ( SURFACE-AT ?auto_35762 ?auto_35755 ) ( ON ?auto_35762 ?auto_35766 ) ( CLEAR ?auto_35762 ) ( not ( = ?auto_35747 ?auto_35766 ) ) ( not ( = ?auto_35748 ?auto_35766 ) ) ( not ( = ?auto_35758 ?auto_35766 ) ) ( not ( = ?auto_35767 ?auto_35766 ) ) ( not ( = ?auto_35753 ?auto_35766 ) ) ( not ( = ?auto_35762 ?auto_35766 ) ) ( not ( = ?auto_35749 ?auto_35766 ) ) ( not ( = ?auto_35756 ?auto_35766 ) ) ( IS-CRATE ?auto_35756 ) ( not ( = ?auto_35747 ?auto_35765 ) ) ( not ( = ?auto_35748 ?auto_35765 ) ) ( not ( = ?auto_35758 ?auto_35765 ) ) ( not ( = ?auto_35767 ?auto_35765 ) ) ( not ( = ?auto_35753 ?auto_35765 ) ) ( not ( = ?auto_35762 ?auto_35765 ) ) ( not ( = ?auto_35749 ?auto_35765 ) ) ( not ( = ?auto_35756 ?auto_35765 ) ) ( not ( = ?auto_35766 ?auto_35765 ) ) ( AVAILABLE ?auto_35769 ) ( SURFACE-AT ?auto_35756 ?auto_35760 ) ( ON ?auto_35756 ?auto_35768 ) ( CLEAR ?auto_35756 ) ( not ( = ?auto_35747 ?auto_35768 ) ) ( not ( = ?auto_35748 ?auto_35768 ) ) ( not ( = ?auto_35758 ?auto_35768 ) ) ( not ( = ?auto_35767 ?auto_35768 ) ) ( not ( = ?auto_35753 ?auto_35768 ) ) ( not ( = ?auto_35762 ?auto_35768 ) ) ( not ( = ?auto_35749 ?auto_35768 ) ) ( not ( = ?auto_35756 ?auto_35768 ) ) ( not ( = ?auto_35766 ?auto_35768 ) ) ( not ( = ?auto_35765 ?auto_35768 ) ) ( SURFACE-AT ?auto_35764 ?auto_35751 ) ( CLEAR ?auto_35764 ) ( IS-CRATE ?auto_35765 ) ( not ( = ?auto_35747 ?auto_35764 ) ) ( not ( = ?auto_35748 ?auto_35764 ) ) ( not ( = ?auto_35758 ?auto_35764 ) ) ( not ( = ?auto_35767 ?auto_35764 ) ) ( not ( = ?auto_35753 ?auto_35764 ) ) ( not ( = ?auto_35762 ?auto_35764 ) ) ( not ( = ?auto_35749 ?auto_35764 ) ) ( not ( = ?auto_35756 ?auto_35764 ) ) ( not ( = ?auto_35766 ?auto_35764 ) ) ( not ( = ?auto_35765 ?auto_35764 ) ) ( not ( = ?auto_35768 ?auto_35764 ) ) ( AVAILABLE ?auto_35763 ) ( TRUCK-AT ?auto_35752 ?auto_35761 ) ( AVAILABLE ?auto_35757 ) ( SURFACE-AT ?auto_35765 ?auto_35761 ) ( ON ?auto_35765 ?auto_35770 ) ( CLEAR ?auto_35765 ) ( not ( = ?auto_35747 ?auto_35770 ) ) ( not ( = ?auto_35748 ?auto_35770 ) ) ( not ( = ?auto_35758 ?auto_35770 ) ) ( not ( = ?auto_35767 ?auto_35770 ) ) ( not ( = ?auto_35753 ?auto_35770 ) ) ( not ( = ?auto_35762 ?auto_35770 ) ) ( not ( = ?auto_35749 ?auto_35770 ) ) ( not ( = ?auto_35756 ?auto_35770 ) ) ( not ( = ?auto_35766 ?auto_35770 ) ) ( not ( = ?auto_35765 ?auto_35770 ) ) ( not ( = ?auto_35768 ?auto_35770 ) ) ( not ( = ?auto_35764 ?auto_35770 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35757 ?auto_35765 ?auto_35770 ?auto_35761 )
      ( MAKE-ON ?auto_35747 ?auto_35748 )
      ( MAKE-ON-VERIFY ?auto_35747 ?auto_35748 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35771 - SURFACE
      ?auto_35772 - SURFACE
    )
    :vars
    (
      ?auto_35776 - HOIST
      ?auto_35781 - PLACE
      ?auto_35786 - PLACE
      ?auto_35788 - HOIST
      ?auto_35793 - SURFACE
      ?auto_35792 - SURFACE
      ?auto_35783 - PLACE
      ?auto_35784 - HOIST
      ?auto_35779 - SURFACE
      ?auto_35787 - SURFACE
      ?auto_35785 - PLACE
      ?auto_35773 - HOIST
      ?auto_35794 - SURFACE
      ?auto_35778 - SURFACE
      ?auto_35777 - PLACE
      ?auto_35782 - HOIST
      ?auto_35789 - SURFACE
      ?auto_35790 - SURFACE
      ?auto_35791 - SURFACE
      ?auto_35774 - SURFACE
      ?auto_35775 - SURFACE
      ?auto_35780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35776 ?auto_35781 ) ( IS-CRATE ?auto_35771 ) ( not ( = ?auto_35771 ?auto_35772 ) ) ( not ( = ?auto_35786 ?auto_35781 ) ) ( HOIST-AT ?auto_35788 ?auto_35786 ) ( not ( = ?auto_35776 ?auto_35788 ) ) ( SURFACE-AT ?auto_35771 ?auto_35786 ) ( ON ?auto_35771 ?auto_35793 ) ( CLEAR ?auto_35771 ) ( not ( = ?auto_35771 ?auto_35793 ) ) ( not ( = ?auto_35772 ?auto_35793 ) ) ( IS-CRATE ?auto_35772 ) ( not ( = ?auto_35771 ?auto_35792 ) ) ( not ( = ?auto_35772 ?auto_35792 ) ) ( not ( = ?auto_35793 ?auto_35792 ) ) ( not ( = ?auto_35783 ?auto_35781 ) ) ( not ( = ?auto_35786 ?auto_35783 ) ) ( HOIST-AT ?auto_35784 ?auto_35783 ) ( not ( = ?auto_35776 ?auto_35784 ) ) ( not ( = ?auto_35788 ?auto_35784 ) ) ( AVAILABLE ?auto_35784 ) ( SURFACE-AT ?auto_35772 ?auto_35783 ) ( ON ?auto_35772 ?auto_35779 ) ( CLEAR ?auto_35772 ) ( not ( = ?auto_35771 ?auto_35779 ) ) ( not ( = ?auto_35772 ?auto_35779 ) ) ( not ( = ?auto_35793 ?auto_35779 ) ) ( not ( = ?auto_35792 ?auto_35779 ) ) ( IS-CRATE ?auto_35792 ) ( not ( = ?auto_35771 ?auto_35787 ) ) ( not ( = ?auto_35772 ?auto_35787 ) ) ( not ( = ?auto_35793 ?auto_35787 ) ) ( not ( = ?auto_35792 ?auto_35787 ) ) ( not ( = ?auto_35779 ?auto_35787 ) ) ( not ( = ?auto_35785 ?auto_35781 ) ) ( not ( = ?auto_35786 ?auto_35785 ) ) ( not ( = ?auto_35783 ?auto_35785 ) ) ( HOIST-AT ?auto_35773 ?auto_35785 ) ( not ( = ?auto_35776 ?auto_35773 ) ) ( not ( = ?auto_35788 ?auto_35773 ) ) ( not ( = ?auto_35784 ?auto_35773 ) ) ( SURFACE-AT ?auto_35792 ?auto_35785 ) ( ON ?auto_35792 ?auto_35794 ) ( CLEAR ?auto_35792 ) ( not ( = ?auto_35771 ?auto_35794 ) ) ( not ( = ?auto_35772 ?auto_35794 ) ) ( not ( = ?auto_35793 ?auto_35794 ) ) ( not ( = ?auto_35792 ?auto_35794 ) ) ( not ( = ?auto_35779 ?auto_35794 ) ) ( not ( = ?auto_35787 ?auto_35794 ) ) ( IS-CRATE ?auto_35787 ) ( not ( = ?auto_35771 ?auto_35778 ) ) ( not ( = ?auto_35772 ?auto_35778 ) ) ( not ( = ?auto_35793 ?auto_35778 ) ) ( not ( = ?auto_35792 ?auto_35778 ) ) ( not ( = ?auto_35779 ?auto_35778 ) ) ( not ( = ?auto_35787 ?auto_35778 ) ) ( not ( = ?auto_35794 ?auto_35778 ) ) ( not ( = ?auto_35777 ?auto_35781 ) ) ( not ( = ?auto_35786 ?auto_35777 ) ) ( not ( = ?auto_35783 ?auto_35777 ) ) ( not ( = ?auto_35785 ?auto_35777 ) ) ( HOIST-AT ?auto_35782 ?auto_35777 ) ( not ( = ?auto_35776 ?auto_35782 ) ) ( not ( = ?auto_35788 ?auto_35782 ) ) ( not ( = ?auto_35784 ?auto_35782 ) ) ( not ( = ?auto_35773 ?auto_35782 ) ) ( AVAILABLE ?auto_35782 ) ( SURFACE-AT ?auto_35787 ?auto_35777 ) ( ON ?auto_35787 ?auto_35789 ) ( CLEAR ?auto_35787 ) ( not ( = ?auto_35771 ?auto_35789 ) ) ( not ( = ?auto_35772 ?auto_35789 ) ) ( not ( = ?auto_35793 ?auto_35789 ) ) ( not ( = ?auto_35792 ?auto_35789 ) ) ( not ( = ?auto_35779 ?auto_35789 ) ) ( not ( = ?auto_35787 ?auto_35789 ) ) ( not ( = ?auto_35794 ?auto_35789 ) ) ( not ( = ?auto_35778 ?auto_35789 ) ) ( IS-CRATE ?auto_35778 ) ( not ( = ?auto_35771 ?auto_35790 ) ) ( not ( = ?auto_35772 ?auto_35790 ) ) ( not ( = ?auto_35793 ?auto_35790 ) ) ( not ( = ?auto_35792 ?auto_35790 ) ) ( not ( = ?auto_35779 ?auto_35790 ) ) ( not ( = ?auto_35787 ?auto_35790 ) ) ( not ( = ?auto_35794 ?auto_35790 ) ) ( not ( = ?auto_35778 ?auto_35790 ) ) ( not ( = ?auto_35789 ?auto_35790 ) ) ( AVAILABLE ?auto_35773 ) ( SURFACE-AT ?auto_35778 ?auto_35785 ) ( ON ?auto_35778 ?auto_35791 ) ( CLEAR ?auto_35778 ) ( not ( = ?auto_35771 ?auto_35791 ) ) ( not ( = ?auto_35772 ?auto_35791 ) ) ( not ( = ?auto_35793 ?auto_35791 ) ) ( not ( = ?auto_35792 ?auto_35791 ) ) ( not ( = ?auto_35779 ?auto_35791 ) ) ( not ( = ?auto_35787 ?auto_35791 ) ) ( not ( = ?auto_35794 ?auto_35791 ) ) ( not ( = ?auto_35778 ?auto_35791 ) ) ( not ( = ?auto_35789 ?auto_35791 ) ) ( not ( = ?auto_35790 ?auto_35791 ) ) ( SURFACE-AT ?auto_35774 ?auto_35781 ) ( CLEAR ?auto_35774 ) ( IS-CRATE ?auto_35790 ) ( not ( = ?auto_35771 ?auto_35774 ) ) ( not ( = ?auto_35772 ?auto_35774 ) ) ( not ( = ?auto_35793 ?auto_35774 ) ) ( not ( = ?auto_35792 ?auto_35774 ) ) ( not ( = ?auto_35779 ?auto_35774 ) ) ( not ( = ?auto_35787 ?auto_35774 ) ) ( not ( = ?auto_35794 ?auto_35774 ) ) ( not ( = ?auto_35778 ?auto_35774 ) ) ( not ( = ?auto_35789 ?auto_35774 ) ) ( not ( = ?auto_35790 ?auto_35774 ) ) ( not ( = ?auto_35791 ?auto_35774 ) ) ( AVAILABLE ?auto_35776 ) ( AVAILABLE ?auto_35788 ) ( SURFACE-AT ?auto_35790 ?auto_35786 ) ( ON ?auto_35790 ?auto_35775 ) ( CLEAR ?auto_35790 ) ( not ( = ?auto_35771 ?auto_35775 ) ) ( not ( = ?auto_35772 ?auto_35775 ) ) ( not ( = ?auto_35793 ?auto_35775 ) ) ( not ( = ?auto_35792 ?auto_35775 ) ) ( not ( = ?auto_35779 ?auto_35775 ) ) ( not ( = ?auto_35787 ?auto_35775 ) ) ( not ( = ?auto_35794 ?auto_35775 ) ) ( not ( = ?auto_35778 ?auto_35775 ) ) ( not ( = ?auto_35789 ?auto_35775 ) ) ( not ( = ?auto_35790 ?auto_35775 ) ) ( not ( = ?auto_35791 ?auto_35775 ) ) ( not ( = ?auto_35774 ?auto_35775 ) ) ( TRUCK-AT ?auto_35780 ?auto_35781 ) )
    :subtasks
    ( ( !DRIVE ?auto_35780 ?auto_35781 ?auto_35786 )
      ( MAKE-ON ?auto_35771 ?auto_35772 )
      ( MAKE-ON-VERIFY ?auto_35771 ?auto_35772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35795 - SURFACE
      ?auto_35796 - SURFACE
    )
    :vars
    (
      ?auto_35811 - HOIST
      ?auto_35808 - PLACE
      ?auto_35804 - PLACE
      ?auto_35797 - HOIST
      ?auto_35799 - SURFACE
      ?auto_35818 - SURFACE
      ?auto_35810 - PLACE
      ?auto_35805 - HOIST
      ?auto_35807 - SURFACE
      ?auto_35802 - SURFACE
      ?auto_35816 - PLACE
      ?auto_35815 - HOIST
      ?auto_35798 - SURFACE
      ?auto_35806 - SURFACE
      ?auto_35812 - PLACE
      ?auto_35814 - HOIST
      ?auto_35800 - SURFACE
      ?auto_35817 - SURFACE
      ?auto_35809 - SURFACE
      ?auto_35801 - SURFACE
      ?auto_35803 - SURFACE
      ?auto_35813 - TRUCK
      ?auto_35819 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35811 ?auto_35808 ) ( IS-CRATE ?auto_35795 ) ( not ( = ?auto_35795 ?auto_35796 ) ) ( not ( = ?auto_35804 ?auto_35808 ) ) ( HOIST-AT ?auto_35797 ?auto_35804 ) ( not ( = ?auto_35811 ?auto_35797 ) ) ( SURFACE-AT ?auto_35795 ?auto_35804 ) ( ON ?auto_35795 ?auto_35799 ) ( CLEAR ?auto_35795 ) ( not ( = ?auto_35795 ?auto_35799 ) ) ( not ( = ?auto_35796 ?auto_35799 ) ) ( IS-CRATE ?auto_35796 ) ( not ( = ?auto_35795 ?auto_35818 ) ) ( not ( = ?auto_35796 ?auto_35818 ) ) ( not ( = ?auto_35799 ?auto_35818 ) ) ( not ( = ?auto_35810 ?auto_35808 ) ) ( not ( = ?auto_35804 ?auto_35810 ) ) ( HOIST-AT ?auto_35805 ?auto_35810 ) ( not ( = ?auto_35811 ?auto_35805 ) ) ( not ( = ?auto_35797 ?auto_35805 ) ) ( AVAILABLE ?auto_35805 ) ( SURFACE-AT ?auto_35796 ?auto_35810 ) ( ON ?auto_35796 ?auto_35807 ) ( CLEAR ?auto_35796 ) ( not ( = ?auto_35795 ?auto_35807 ) ) ( not ( = ?auto_35796 ?auto_35807 ) ) ( not ( = ?auto_35799 ?auto_35807 ) ) ( not ( = ?auto_35818 ?auto_35807 ) ) ( IS-CRATE ?auto_35818 ) ( not ( = ?auto_35795 ?auto_35802 ) ) ( not ( = ?auto_35796 ?auto_35802 ) ) ( not ( = ?auto_35799 ?auto_35802 ) ) ( not ( = ?auto_35818 ?auto_35802 ) ) ( not ( = ?auto_35807 ?auto_35802 ) ) ( not ( = ?auto_35816 ?auto_35808 ) ) ( not ( = ?auto_35804 ?auto_35816 ) ) ( not ( = ?auto_35810 ?auto_35816 ) ) ( HOIST-AT ?auto_35815 ?auto_35816 ) ( not ( = ?auto_35811 ?auto_35815 ) ) ( not ( = ?auto_35797 ?auto_35815 ) ) ( not ( = ?auto_35805 ?auto_35815 ) ) ( SURFACE-AT ?auto_35818 ?auto_35816 ) ( ON ?auto_35818 ?auto_35798 ) ( CLEAR ?auto_35818 ) ( not ( = ?auto_35795 ?auto_35798 ) ) ( not ( = ?auto_35796 ?auto_35798 ) ) ( not ( = ?auto_35799 ?auto_35798 ) ) ( not ( = ?auto_35818 ?auto_35798 ) ) ( not ( = ?auto_35807 ?auto_35798 ) ) ( not ( = ?auto_35802 ?auto_35798 ) ) ( IS-CRATE ?auto_35802 ) ( not ( = ?auto_35795 ?auto_35806 ) ) ( not ( = ?auto_35796 ?auto_35806 ) ) ( not ( = ?auto_35799 ?auto_35806 ) ) ( not ( = ?auto_35818 ?auto_35806 ) ) ( not ( = ?auto_35807 ?auto_35806 ) ) ( not ( = ?auto_35802 ?auto_35806 ) ) ( not ( = ?auto_35798 ?auto_35806 ) ) ( not ( = ?auto_35812 ?auto_35808 ) ) ( not ( = ?auto_35804 ?auto_35812 ) ) ( not ( = ?auto_35810 ?auto_35812 ) ) ( not ( = ?auto_35816 ?auto_35812 ) ) ( HOIST-AT ?auto_35814 ?auto_35812 ) ( not ( = ?auto_35811 ?auto_35814 ) ) ( not ( = ?auto_35797 ?auto_35814 ) ) ( not ( = ?auto_35805 ?auto_35814 ) ) ( not ( = ?auto_35815 ?auto_35814 ) ) ( AVAILABLE ?auto_35814 ) ( SURFACE-AT ?auto_35802 ?auto_35812 ) ( ON ?auto_35802 ?auto_35800 ) ( CLEAR ?auto_35802 ) ( not ( = ?auto_35795 ?auto_35800 ) ) ( not ( = ?auto_35796 ?auto_35800 ) ) ( not ( = ?auto_35799 ?auto_35800 ) ) ( not ( = ?auto_35818 ?auto_35800 ) ) ( not ( = ?auto_35807 ?auto_35800 ) ) ( not ( = ?auto_35802 ?auto_35800 ) ) ( not ( = ?auto_35798 ?auto_35800 ) ) ( not ( = ?auto_35806 ?auto_35800 ) ) ( IS-CRATE ?auto_35806 ) ( not ( = ?auto_35795 ?auto_35817 ) ) ( not ( = ?auto_35796 ?auto_35817 ) ) ( not ( = ?auto_35799 ?auto_35817 ) ) ( not ( = ?auto_35818 ?auto_35817 ) ) ( not ( = ?auto_35807 ?auto_35817 ) ) ( not ( = ?auto_35802 ?auto_35817 ) ) ( not ( = ?auto_35798 ?auto_35817 ) ) ( not ( = ?auto_35806 ?auto_35817 ) ) ( not ( = ?auto_35800 ?auto_35817 ) ) ( AVAILABLE ?auto_35815 ) ( SURFACE-AT ?auto_35806 ?auto_35816 ) ( ON ?auto_35806 ?auto_35809 ) ( CLEAR ?auto_35806 ) ( not ( = ?auto_35795 ?auto_35809 ) ) ( not ( = ?auto_35796 ?auto_35809 ) ) ( not ( = ?auto_35799 ?auto_35809 ) ) ( not ( = ?auto_35818 ?auto_35809 ) ) ( not ( = ?auto_35807 ?auto_35809 ) ) ( not ( = ?auto_35802 ?auto_35809 ) ) ( not ( = ?auto_35798 ?auto_35809 ) ) ( not ( = ?auto_35806 ?auto_35809 ) ) ( not ( = ?auto_35800 ?auto_35809 ) ) ( not ( = ?auto_35817 ?auto_35809 ) ) ( IS-CRATE ?auto_35817 ) ( not ( = ?auto_35795 ?auto_35801 ) ) ( not ( = ?auto_35796 ?auto_35801 ) ) ( not ( = ?auto_35799 ?auto_35801 ) ) ( not ( = ?auto_35818 ?auto_35801 ) ) ( not ( = ?auto_35807 ?auto_35801 ) ) ( not ( = ?auto_35802 ?auto_35801 ) ) ( not ( = ?auto_35798 ?auto_35801 ) ) ( not ( = ?auto_35806 ?auto_35801 ) ) ( not ( = ?auto_35800 ?auto_35801 ) ) ( not ( = ?auto_35817 ?auto_35801 ) ) ( not ( = ?auto_35809 ?auto_35801 ) ) ( AVAILABLE ?auto_35797 ) ( SURFACE-AT ?auto_35817 ?auto_35804 ) ( ON ?auto_35817 ?auto_35803 ) ( CLEAR ?auto_35817 ) ( not ( = ?auto_35795 ?auto_35803 ) ) ( not ( = ?auto_35796 ?auto_35803 ) ) ( not ( = ?auto_35799 ?auto_35803 ) ) ( not ( = ?auto_35818 ?auto_35803 ) ) ( not ( = ?auto_35807 ?auto_35803 ) ) ( not ( = ?auto_35802 ?auto_35803 ) ) ( not ( = ?auto_35798 ?auto_35803 ) ) ( not ( = ?auto_35806 ?auto_35803 ) ) ( not ( = ?auto_35800 ?auto_35803 ) ) ( not ( = ?auto_35817 ?auto_35803 ) ) ( not ( = ?auto_35809 ?auto_35803 ) ) ( not ( = ?auto_35801 ?auto_35803 ) ) ( TRUCK-AT ?auto_35813 ?auto_35808 ) ( SURFACE-AT ?auto_35819 ?auto_35808 ) ( CLEAR ?auto_35819 ) ( LIFTING ?auto_35811 ?auto_35801 ) ( IS-CRATE ?auto_35801 ) ( not ( = ?auto_35795 ?auto_35819 ) ) ( not ( = ?auto_35796 ?auto_35819 ) ) ( not ( = ?auto_35799 ?auto_35819 ) ) ( not ( = ?auto_35818 ?auto_35819 ) ) ( not ( = ?auto_35807 ?auto_35819 ) ) ( not ( = ?auto_35802 ?auto_35819 ) ) ( not ( = ?auto_35798 ?auto_35819 ) ) ( not ( = ?auto_35806 ?auto_35819 ) ) ( not ( = ?auto_35800 ?auto_35819 ) ) ( not ( = ?auto_35817 ?auto_35819 ) ) ( not ( = ?auto_35809 ?auto_35819 ) ) ( not ( = ?auto_35801 ?auto_35819 ) ) ( not ( = ?auto_35803 ?auto_35819 ) ) )
    :subtasks
    ( ( !DROP ?auto_35811 ?auto_35801 ?auto_35819 ?auto_35808 )
      ( MAKE-ON ?auto_35795 ?auto_35796 )
      ( MAKE-ON-VERIFY ?auto_35795 ?auto_35796 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35820 - SURFACE
      ?auto_35821 - SURFACE
    )
    :vars
    (
      ?auto_35824 - HOIST
      ?auto_35835 - PLACE
      ?auto_35828 - PLACE
      ?auto_35841 - HOIST
      ?auto_35830 - SURFACE
      ?auto_35826 - SURFACE
      ?auto_35827 - PLACE
      ?auto_35840 - HOIST
      ?auto_35832 - SURFACE
      ?auto_35831 - SURFACE
      ?auto_35844 - PLACE
      ?auto_35843 - HOIST
      ?auto_35823 - SURFACE
      ?auto_35829 - SURFACE
      ?auto_35838 - PLACE
      ?auto_35837 - HOIST
      ?auto_35833 - SURFACE
      ?auto_35822 - SURFACE
      ?auto_35834 - SURFACE
      ?auto_35825 - SURFACE
      ?auto_35839 - SURFACE
      ?auto_35836 - TRUCK
      ?auto_35842 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35824 ?auto_35835 ) ( IS-CRATE ?auto_35820 ) ( not ( = ?auto_35820 ?auto_35821 ) ) ( not ( = ?auto_35828 ?auto_35835 ) ) ( HOIST-AT ?auto_35841 ?auto_35828 ) ( not ( = ?auto_35824 ?auto_35841 ) ) ( SURFACE-AT ?auto_35820 ?auto_35828 ) ( ON ?auto_35820 ?auto_35830 ) ( CLEAR ?auto_35820 ) ( not ( = ?auto_35820 ?auto_35830 ) ) ( not ( = ?auto_35821 ?auto_35830 ) ) ( IS-CRATE ?auto_35821 ) ( not ( = ?auto_35820 ?auto_35826 ) ) ( not ( = ?auto_35821 ?auto_35826 ) ) ( not ( = ?auto_35830 ?auto_35826 ) ) ( not ( = ?auto_35827 ?auto_35835 ) ) ( not ( = ?auto_35828 ?auto_35827 ) ) ( HOIST-AT ?auto_35840 ?auto_35827 ) ( not ( = ?auto_35824 ?auto_35840 ) ) ( not ( = ?auto_35841 ?auto_35840 ) ) ( AVAILABLE ?auto_35840 ) ( SURFACE-AT ?auto_35821 ?auto_35827 ) ( ON ?auto_35821 ?auto_35832 ) ( CLEAR ?auto_35821 ) ( not ( = ?auto_35820 ?auto_35832 ) ) ( not ( = ?auto_35821 ?auto_35832 ) ) ( not ( = ?auto_35830 ?auto_35832 ) ) ( not ( = ?auto_35826 ?auto_35832 ) ) ( IS-CRATE ?auto_35826 ) ( not ( = ?auto_35820 ?auto_35831 ) ) ( not ( = ?auto_35821 ?auto_35831 ) ) ( not ( = ?auto_35830 ?auto_35831 ) ) ( not ( = ?auto_35826 ?auto_35831 ) ) ( not ( = ?auto_35832 ?auto_35831 ) ) ( not ( = ?auto_35844 ?auto_35835 ) ) ( not ( = ?auto_35828 ?auto_35844 ) ) ( not ( = ?auto_35827 ?auto_35844 ) ) ( HOIST-AT ?auto_35843 ?auto_35844 ) ( not ( = ?auto_35824 ?auto_35843 ) ) ( not ( = ?auto_35841 ?auto_35843 ) ) ( not ( = ?auto_35840 ?auto_35843 ) ) ( SURFACE-AT ?auto_35826 ?auto_35844 ) ( ON ?auto_35826 ?auto_35823 ) ( CLEAR ?auto_35826 ) ( not ( = ?auto_35820 ?auto_35823 ) ) ( not ( = ?auto_35821 ?auto_35823 ) ) ( not ( = ?auto_35830 ?auto_35823 ) ) ( not ( = ?auto_35826 ?auto_35823 ) ) ( not ( = ?auto_35832 ?auto_35823 ) ) ( not ( = ?auto_35831 ?auto_35823 ) ) ( IS-CRATE ?auto_35831 ) ( not ( = ?auto_35820 ?auto_35829 ) ) ( not ( = ?auto_35821 ?auto_35829 ) ) ( not ( = ?auto_35830 ?auto_35829 ) ) ( not ( = ?auto_35826 ?auto_35829 ) ) ( not ( = ?auto_35832 ?auto_35829 ) ) ( not ( = ?auto_35831 ?auto_35829 ) ) ( not ( = ?auto_35823 ?auto_35829 ) ) ( not ( = ?auto_35838 ?auto_35835 ) ) ( not ( = ?auto_35828 ?auto_35838 ) ) ( not ( = ?auto_35827 ?auto_35838 ) ) ( not ( = ?auto_35844 ?auto_35838 ) ) ( HOIST-AT ?auto_35837 ?auto_35838 ) ( not ( = ?auto_35824 ?auto_35837 ) ) ( not ( = ?auto_35841 ?auto_35837 ) ) ( not ( = ?auto_35840 ?auto_35837 ) ) ( not ( = ?auto_35843 ?auto_35837 ) ) ( AVAILABLE ?auto_35837 ) ( SURFACE-AT ?auto_35831 ?auto_35838 ) ( ON ?auto_35831 ?auto_35833 ) ( CLEAR ?auto_35831 ) ( not ( = ?auto_35820 ?auto_35833 ) ) ( not ( = ?auto_35821 ?auto_35833 ) ) ( not ( = ?auto_35830 ?auto_35833 ) ) ( not ( = ?auto_35826 ?auto_35833 ) ) ( not ( = ?auto_35832 ?auto_35833 ) ) ( not ( = ?auto_35831 ?auto_35833 ) ) ( not ( = ?auto_35823 ?auto_35833 ) ) ( not ( = ?auto_35829 ?auto_35833 ) ) ( IS-CRATE ?auto_35829 ) ( not ( = ?auto_35820 ?auto_35822 ) ) ( not ( = ?auto_35821 ?auto_35822 ) ) ( not ( = ?auto_35830 ?auto_35822 ) ) ( not ( = ?auto_35826 ?auto_35822 ) ) ( not ( = ?auto_35832 ?auto_35822 ) ) ( not ( = ?auto_35831 ?auto_35822 ) ) ( not ( = ?auto_35823 ?auto_35822 ) ) ( not ( = ?auto_35829 ?auto_35822 ) ) ( not ( = ?auto_35833 ?auto_35822 ) ) ( AVAILABLE ?auto_35843 ) ( SURFACE-AT ?auto_35829 ?auto_35844 ) ( ON ?auto_35829 ?auto_35834 ) ( CLEAR ?auto_35829 ) ( not ( = ?auto_35820 ?auto_35834 ) ) ( not ( = ?auto_35821 ?auto_35834 ) ) ( not ( = ?auto_35830 ?auto_35834 ) ) ( not ( = ?auto_35826 ?auto_35834 ) ) ( not ( = ?auto_35832 ?auto_35834 ) ) ( not ( = ?auto_35831 ?auto_35834 ) ) ( not ( = ?auto_35823 ?auto_35834 ) ) ( not ( = ?auto_35829 ?auto_35834 ) ) ( not ( = ?auto_35833 ?auto_35834 ) ) ( not ( = ?auto_35822 ?auto_35834 ) ) ( IS-CRATE ?auto_35822 ) ( not ( = ?auto_35820 ?auto_35825 ) ) ( not ( = ?auto_35821 ?auto_35825 ) ) ( not ( = ?auto_35830 ?auto_35825 ) ) ( not ( = ?auto_35826 ?auto_35825 ) ) ( not ( = ?auto_35832 ?auto_35825 ) ) ( not ( = ?auto_35831 ?auto_35825 ) ) ( not ( = ?auto_35823 ?auto_35825 ) ) ( not ( = ?auto_35829 ?auto_35825 ) ) ( not ( = ?auto_35833 ?auto_35825 ) ) ( not ( = ?auto_35822 ?auto_35825 ) ) ( not ( = ?auto_35834 ?auto_35825 ) ) ( AVAILABLE ?auto_35841 ) ( SURFACE-AT ?auto_35822 ?auto_35828 ) ( ON ?auto_35822 ?auto_35839 ) ( CLEAR ?auto_35822 ) ( not ( = ?auto_35820 ?auto_35839 ) ) ( not ( = ?auto_35821 ?auto_35839 ) ) ( not ( = ?auto_35830 ?auto_35839 ) ) ( not ( = ?auto_35826 ?auto_35839 ) ) ( not ( = ?auto_35832 ?auto_35839 ) ) ( not ( = ?auto_35831 ?auto_35839 ) ) ( not ( = ?auto_35823 ?auto_35839 ) ) ( not ( = ?auto_35829 ?auto_35839 ) ) ( not ( = ?auto_35833 ?auto_35839 ) ) ( not ( = ?auto_35822 ?auto_35839 ) ) ( not ( = ?auto_35834 ?auto_35839 ) ) ( not ( = ?auto_35825 ?auto_35839 ) ) ( TRUCK-AT ?auto_35836 ?auto_35835 ) ( SURFACE-AT ?auto_35842 ?auto_35835 ) ( CLEAR ?auto_35842 ) ( IS-CRATE ?auto_35825 ) ( not ( = ?auto_35820 ?auto_35842 ) ) ( not ( = ?auto_35821 ?auto_35842 ) ) ( not ( = ?auto_35830 ?auto_35842 ) ) ( not ( = ?auto_35826 ?auto_35842 ) ) ( not ( = ?auto_35832 ?auto_35842 ) ) ( not ( = ?auto_35831 ?auto_35842 ) ) ( not ( = ?auto_35823 ?auto_35842 ) ) ( not ( = ?auto_35829 ?auto_35842 ) ) ( not ( = ?auto_35833 ?auto_35842 ) ) ( not ( = ?auto_35822 ?auto_35842 ) ) ( not ( = ?auto_35834 ?auto_35842 ) ) ( not ( = ?auto_35825 ?auto_35842 ) ) ( not ( = ?auto_35839 ?auto_35842 ) ) ( AVAILABLE ?auto_35824 ) ( IN ?auto_35825 ?auto_35836 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35824 ?auto_35825 ?auto_35836 ?auto_35835 )
      ( MAKE-ON ?auto_35820 ?auto_35821 )
      ( MAKE-ON-VERIFY ?auto_35820 ?auto_35821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35845 - SURFACE
      ?auto_35846 - SURFACE
    )
    :vars
    (
      ?auto_35850 - HOIST
      ?auto_35851 - PLACE
      ?auto_35847 - PLACE
      ?auto_35857 - HOIST
      ?auto_35863 - SURFACE
      ?auto_35862 - SURFACE
      ?auto_35854 - PLACE
      ?auto_35852 - HOIST
      ?auto_35866 - SURFACE
      ?auto_35865 - SURFACE
      ?auto_35860 - PLACE
      ?auto_35859 - HOIST
      ?auto_35848 - SURFACE
      ?auto_35856 - SURFACE
      ?auto_35853 - PLACE
      ?auto_35861 - HOIST
      ?auto_35849 - SURFACE
      ?auto_35868 - SURFACE
      ?auto_35855 - SURFACE
      ?auto_35864 - SURFACE
      ?auto_35867 - SURFACE
      ?auto_35858 - SURFACE
      ?auto_35869 - TRUCK
      ?auto_35870 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35850 ?auto_35851 ) ( IS-CRATE ?auto_35845 ) ( not ( = ?auto_35845 ?auto_35846 ) ) ( not ( = ?auto_35847 ?auto_35851 ) ) ( HOIST-AT ?auto_35857 ?auto_35847 ) ( not ( = ?auto_35850 ?auto_35857 ) ) ( SURFACE-AT ?auto_35845 ?auto_35847 ) ( ON ?auto_35845 ?auto_35863 ) ( CLEAR ?auto_35845 ) ( not ( = ?auto_35845 ?auto_35863 ) ) ( not ( = ?auto_35846 ?auto_35863 ) ) ( IS-CRATE ?auto_35846 ) ( not ( = ?auto_35845 ?auto_35862 ) ) ( not ( = ?auto_35846 ?auto_35862 ) ) ( not ( = ?auto_35863 ?auto_35862 ) ) ( not ( = ?auto_35854 ?auto_35851 ) ) ( not ( = ?auto_35847 ?auto_35854 ) ) ( HOIST-AT ?auto_35852 ?auto_35854 ) ( not ( = ?auto_35850 ?auto_35852 ) ) ( not ( = ?auto_35857 ?auto_35852 ) ) ( AVAILABLE ?auto_35852 ) ( SURFACE-AT ?auto_35846 ?auto_35854 ) ( ON ?auto_35846 ?auto_35866 ) ( CLEAR ?auto_35846 ) ( not ( = ?auto_35845 ?auto_35866 ) ) ( not ( = ?auto_35846 ?auto_35866 ) ) ( not ( = ?auto_35863 ?auto_35866 ) ) ( not ( = ?auto_35862 ?auto_35866 ) ) ( IS-CRATE ?auto_35862 ) ( not ( = ?auto_35845 ?auto_35865 ) ) ( not ( = ?auto_35846 ?auto_35865 ) ) ( not ( = ?auto_35863 ?auto_35865 ) ) ( not ( = ?auto_35862 ?auto_35865 ) ) ( not ( = ?auto_35866 ?auto_35865 ) ) ( not ( = ?auto_35860 ?auto_35851 ) ) ( not ( = ?auto_35847 ?auto_35860 ) ) ( not ( = ?auto_35854 ?auto_35860 ) ) ( HOIST-AT ?auto_35859 ?auto_35860 ) ( not ( = ?auto_35850 ?auto_35859 ) ) ( not ( = ?auto_35857 ?auto_35859 ) ) ( not ( = ?auto_35852 ?auto_35859 ) ) ( SURFACE-AT ?auto_35862 ?auto_35860 ) ( ON ?auto_35862 ?auto_35848 ) ( CLEAR ?auto_35862 ) ( not ( = ?auto_35845 ?auto_35848 ) ) ( not ( = ?auto_35846 ?auto_35848 ) ) ( not ( = ?auto_35863 ?auto_35848 ) ) ( not ( = ?auto_35862 ?auto_35848 ) ) ( not ( = ?auto_35866 ?auto_35848 ) ) ( not ( = ?auto_35865 ?auto_35848 ) ) ( IS-CRATE ?auto_35865 ) ( not ( = ?auto_35845 ?auto_35856 ) ) ( not ( = ?auto_35846 ?auto_35856 ) ) ( not ( = ?auto_35863 ?auto_35856 ) ) ( not ( = ?auto_35862 ?auto_35856 ) ) ( not ( = ?auto_35866 ?auto_35856 ) ) ( not ( = ?auto_35865 ?auto_35856 ) ) ( not ( = ?auto_35848 ?auto_35856 ) ) ( not ( = ?auto_35853 ?auto_35851 ) ) ( not ( = ?auto_35847 ?auto_35853 ) ) ( not ( = ?auto_35854 ?auto_35853 ) ) ( not ( = ?auto_35860 ?auto_35853 ) ) ( HOIST-AT ?auto_35861 ?auto_35853 ) ( not ( = ?auto_35850 ?auto_35861 ) ) ( not ( = ?auto_35857 ?auto_35861 ) ) ( not ( = ?auto_35852 ?auto_35861 ) ) ( not ( = ?auto_35859 ?auto_35861 ) ) ( AVAILABLE ?auto_35861 ) ( SURFACE-AT ?auto_35865 ?auto_35853 ) ( ON ?auto_35865 ?auto_35849 ) ( CLEAR ?auto_35865 ) ( not ( = ?auto_35845 ?auto_35849 ) ) ( not ( = ?auto_35846 ?auto_35849 ) ) ( not ( = ?auto_35863 ?auto_35849 ) ) ( not ( = ?auto_35862 ?auto_35849 ) ) ( not ( = ?auto_35866 ?auto_35849 ) ) ( not ( = ?auto_35865 ?auto_35849 ) ) ( not ( = ?auto_35848 ?auto_35849 ) ) ( not ( = ?auto_35856 ?auto_35849 ) ) ( IS-CRATE ?auto_35856 ) ( not ( = ?auto_35845 ?auto_35868 ) ) ( not ( = ?auto_35846 ?auto_35868 ) ) ( not ( = ?auto_35863 ?auto_35868 ) ) ( not ( = ?auto_35862 ?auto_35868 ) ) ( not ( = ?auto_35866 ?auto_35868 ) ) ( not ( = ?auto_35865 ?auto_35868 ) ) ( not ( = ?auto_35848 ?auto_35868 ) ) ( not ( = ?auto_35856 ?auto_35868 ) ) ( not ( = ?auto_35849 ?auto_35868 ) ) ( AVAILABLE ?auto_35859 ) ( SURFACE-AT ?auto_35856 ?auto_35860 ) ( ON ?auto_35856 ?auto_35855 ) ( CLEAR ?auto_35856 ) ( not ( = ?auto_35845 ?auto_35855 ) ) ( not ( = ?auto_35846 ?auto_35855 ) ) ( not ( = ?auto_35863 ?auto_35855 ) ) ( not ( = ?auto_35862 ?auto_35855 ) ) ( not ( = ?auto_35866 ?auto_35855 ) ) ( not ( = ?auto_35865 ?auto_35855 ) ) ( not ( = ?auto_35848 ?auto_35855 ) ) ( not ( = ?auto_35856 ?auto_35855 ) ) ( not ( = ?auto_35849 ?auto_35855 ) ) ( not ( = ?auto_35868 ?auto_35855 ) ) ( IS-CRATE ?auto_35868 ) ( not ( = ?auto_35845 ?auto_35864 ) ) ( not ( = ?auto_35846 ?auto_35864 ) ) ( not ( = ?auto_35863 ?auto_35864 ) ) ( not ( = ?auto_35862 ?auto_35864 ) ) ( not ( = ?auto_35866 ?auto_35864 ) ) ( not ( = ?auto_35865 ?auto_35864 ) ) ( not ( = ?auto_35848 ?auto_35864 ) ) ( not ( = ?auto_35856 ?auto_35864 ) ) ( not ( = ?auto_35849 ?auto_35864 ) ) ( not ( = ?auto_35868 ?auto_35864 ) ) ( not ( = ?auto_35855 ?auto_35864 ) ) ( AVAILABLE ?auto_35857 ) ( SURFACE-AT ?auto_35868 ?auto_35847 ) ( ON ?auto_35868 ?auto_35867 ) ( CLEAR ?auto_35868 ) ( not ( = ?auto_35845 ?auto_35867 ) ) ( not ( = ?auto_35846 ?auto_35867 ) ) ( not ( = ?auto_35863 ?auto_35867 ) ) ( not ( = ?auto_35862 ?auto_35867 ) ) ( not ( = ?auto_35866 ?auto_35867 ) ) ( not ( = ?auto_35865 ?auto_35867 ) ) ( not ( = ?auto_35848 ?auto_35867 ) ) ( not ( = ?auto_35856 ?auto_35867 ) ) ( not ( = ?auto_35849 ?auto_35867 ) ) ( not ( = ?auto_35868 ?auto_35867 ) ) ( not ( = ?auto_35855 ?auto_35867 ) ) ( not ( = ?auto_35864 ?auto_35867 ) ) ( SURFACE-AT ?auto_35858 ?auto_35851 ) ( CLEAR ?auto_35858 ) ( IS-CRATE ?auto_35864 ) ( not ( = ?auto_35845 ?auto_35858 ) ) ( not ( = ?auto_35846 ?auto_35858 ) ) ( not ( = ?auto_35863 ?auto_35858 ) ) ( not ( = ?auto_35862 ?auto_35858 ) ) ( not ( = ?auto_35866 ?auto_35858 ) ) ( not ( = ?auto_35865 ?auto_35858 ) ) ( not ( = ?auto_35848 ?auto_35858 ) ) ( not ( = ?auto_35856 ?auto_35858 ) ) ( not ( = ?auto_35849 ?auto_35858 ) ) ( not ( = ?auto_35868 ?auto_35858 ) ) ( not ( = ?auto_35855 ?auto_35858 ) ) ( not ( = ?auto_35864 ?auto_35858 ) ) ( not ( = ?auto_35867 ?auto_35858 ) ) ( AVAILABLE ?auto_35850 ) ( IN ?auto_35864 ?auto_35869 ) ( TRUCK-AT ?auto_35869 ?auto_35870 ) ( not ( = ?auto_35870 ?auto_35851 ) ) ( not ( = ?auto_35847 ?auto_35870 ) ) ( not ( = ?auto_35854 ?auto_35870 ) ) ( not ( = ?auto_35860 ?auto_35870 ) ) ( not ( = ?auto_35853 ?auto_35870 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_35869 ?auto_35870 ?auto_35851 )
      ( MAKE-ON ?auto_35845 ?auto_35846 )
      ( MAKE-ON-VERIFY ?auto_35845 ?auto_35846 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35871 - SURFACE
      ?auto_35872 - SURFACE
    )
    :vars
    (
      ?auto_35895 - HOIST
      ?auto_35875 - PLACE
      ?auto_35883 - PLACE
      ?auto_35876 - HOIST
      ?auto_35873 - SURFACE
      ?auto_35882 - SURFACE
      ?auto_35884 - PLACE
      ?auto_35885 - HOIST
      ?auto_35878 - SURFACE
      ?auto_35877 - SURFACE
      ?auto_35891 - PLACE
      ?auto_35894 - HOIST
      ?auto_35896 - SURFACE
      ?auto_35892 - SURFACE
      ?auto_35890 - PLACE
      ?auto_35889 - HOIST
      ?auto_35893 - SURFACE
      ?auto_35880 - SURFACE
      ?auto_35887 - SURFACE
      ?auto_35874 - SURFACE
      ?auto_35879 - SURFACE
      ?auto_35886 - SURFACE
      ?auto_35881 - TRUCK
      ?auto_35888 - PLACE
      ?auto_35897 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_35895 ?auto_35875 ) ( IS-CRATE ?auto_35871 ) ( not ( = ?auto_35871 ?auto_35872 ) ) ( not ( = ?auto_35883 ?auto_35875 ) ) ( HOIST-AT ?auto_35876 ?auto_35883 ) ( not ( = ?auto_35895 ?auto_35876 ) ) ( SURFACE-AT ?auto_35871 ?auto_35883 ) ( ON ?auto_35871 ?auto_35873 ) ( CLEAR ?auto_35871 ) ( not ( = ?auto_35871 ?auto_35873 ) ) ( not ( = ?auto_35872 ?auto_35873 ) ) ( IS-CRATE ?auto_35872 ) ( not ( = ?auto_35871 ?auto_35882 ) ) ( not ( = ?auto_35872 ?auto_35882 ) ) ( not ( = ?auto_35873 ?auto_35882 ) ) ( not ( = ?auto_35884 ?auto_35875 ) ) ( not ( = ?auto_35883 ?auto_35884 ) ) ( HOIST-AT ?auto_35885 ?auto_35884 ) ( not ( = ?auto_35895 ?auto_35885 ) ) ( not ( = ?auto_35876 ?auto_35885 ) ) ( AVAILABLE ?auto_35885 ) ( SURFACE-AT ?auto_35872 ?auto_35884 ) ( ON ?auto_35872 ?auto_35878 ) ( CLEAR ?auto_35872 ) ( not ( = ?auto_35871 ?auto_35878 ) ) ( not ( = ?auto_35872 ?auto_35878 ) ) ( not ( = ?auto_35873 ?auto_35878 ) ) ( not ( = ?auto_35882 ?auto_35878 ) ) ( IS-CRATE ?auto_35882 ) ( not ( = ?auto_35871 ?auto_35877 ) ) ( not ( = ?auto_35872 ?auto_35877 ) ) ( not ( = ?auto_35873 ?auto_35877 ) ) ( not ( = ?auto_35882 ?auto_35877 ) ) ( not ( = ?auto_35878 ?auto_35877 ) ) ( not ( = ?auto_35891 ?auto_35875 ) ) ( not ( = ?auto_35883 ?auto_35891 ) ) ( not ( = ?auto_35884 ?auto_35891 ) ) ( HOIST-AT ?auto_35894 ?auto_35891 ) ( not ( = ?auto_35895 ?auto_35894 ) ) ( not ( = ?auto_35876 ?auto_35894 ) ) ( not ( = ?auto_35885 ?auto_35894 ) ) ( SURFACE-AT ?auto_35882 ?auto_35891 ) ( ON ?auto_35882 ?auto_35896 ) ( CLEAR ?auto_35882 ) ( not ( = ?auto_35871 ?auto_35896 ) ) ( not ( = ?auto_35872 ?auto_35896 ) ) ( not ( = ?auto_35873 ?auto_35896 ) ) ( not ( = ?auto_35882 ?auto_35896 ) ) ( not ( = ?auto_35878 ?auto_35896 ) ) ( not ( = ?auto_35877 ?auto_35896 ) ) ( IS-CRATE ?auto_35877 ) ( not ( = ?auto_35871 ?auto_35892 ) ) ( not ( = ?auto_35872 ?auto_35892 ) ) ( not ( = ?auto_35873 ?auto_35892 ) ) ( not ( = ?auto_35882 ?auto_35892 ) ) ( not ( = ?auto_35878 ?auto_35892 ) ) ( not ( = ?auto_35877 ?auto_35892 ) ) ( not ( = ?auto_35896 ?auto_35892 ) ) ( not ( = ?auto_35890 ?auto_35875 ) ) ( not ( = ?auto_35883 ?auto_35890 ) ) ( not ( = ?auto_35884 ?auto_35890 ) ) ( not ( = ?auto_35891 ?auto_35890 ) ) ( HOIST-AT ?auto_35889 ?auto_35890 ) ( not ( = ?auto_35895 ?auto_35889 ) ) ( not ( = ?auto_35876 ?auto_35889 ) ) ( not ( = ?auto_35885 ?auto_35889 ) ) ( not ( = ?auto_35894 ?auto_35889 ) ) ( AVAILABLE ?auto_35889 ) ( SURFACE-AT ?auto_35877 ?auto_35890 ) ( ON ?auto_35877 ?auto_35893 ) ( CLEAR ?auto_35877 ) ( not ( = ?auto_35871 ?auto_35893 ) ) ( not ( = ?auto_35872 ?auto_35893 ) ) ( not ( = ?auto_35873 ?auto_35893 ) ) ( not ( = ?auto_35882 ?auto_35893 ) ) ( not ( = ?auto_35878 ?auto_35893 ) ) ( not ( = ?auto_35877 ?auto_35893 ) ) ( not ( = ?auto_35896 ?auto_35893 ) ) ( not ( = ?auto_35892 ?auto_35893 ) ) ( IS-CRATE ?auto_35892 ) ( not ( = ?auto_35871 ?auto_35880 ) ) ( not ( = ?auto_35872 ?auto_35880 ) ) ( not ( = ?auto_35873 ?auto_35880 ) ) ( not ( = ?auto_35882 ?auto_35880 ) ) ( not ( = ?auto_35878 ?auto_35880 ) ) ( not ( = ?auto_35877 ?auto_35880 ) ) ( not ( = ?auto_35896 ?auto_35880 ) ) ( not ( = ?auto_35892 ?auto_35880 ) ) ( not ( = ?auto_35893 ?auto_35880 ) ) ( AVAILABLE ?auto_35894 ) ( SURFACE-AT ?auto_35892 ?auto_35891 ) ( ON ?auto_35892 ?auto_35887 ) ( CLEAR ?auto_35892 ) ( not ( = ?auto_35871 ?auto_35887 ) ) ( not ( = ?auto_35872 ?auto_35887 ) ) ( not ( = ?auto_35873 ?auto_35887 ) ) ( not ( = ?auto_35882 ?auto_35887 ) ) ( not ( = ?auto_35878 ?auto_35887 ) ) ( not ( = ?auto_35877 ?auto_35887 ) ) ( not ( = ?auto_35896 ?auto_35887 ) ) ( not ( = ?auto_35892 ?auto_35887 ) ) ( not ( = ?auto_35893 ?auto_35887 ) ) ( not ( = ?auto_35880 ?auto_35887 ) ) ( IS-CRATE ?auto_35880 ) ( not ( = ?auto_35871 ?auto_35874 ) ) ( not ( = ?auto_35872 ?auto_35874 ) ) ( not ( = ?auto_35873 ?auto_35874 ) ) ( not ( = ?auto_35882 ?auto_35874 ) ) ( not ( = ?auto_35878 ?auto_35874 ) ) ( not ( = ?auto_35877 ?auto_35874 ) ) ( not ( = ?auto_35896 ?auto_35874 ) ) ( not ( = ?auto_35892 ?auto_35874 ) ) ( not ( = ?auto_35893 ?auto_35874 ) ) ( not ( = ?auto_35880 ?auto_35874 ) ) ( not ( = ?auto_35887 ?auto_35874 ) ) ( AVAILABLE ?auto_35876 ) ( SURFACE-AT ?auto_35880 ?auto_35883 ) ( ON ?auto_35880 ?auto_35879 ) ( CLEAR ?auto_35880 ) ( not ( = ?auto_35871 ?auto_35879 ) ) ( not ( = ?auto_35872 ?auto_35879 ) ) ( not ( = ?auto_35873 ?auto_35879 ) ) ( not ( = ?auto_35882 ?auto_35879 ) ) ( not ( = ?auto_35878 ?auto_35879 ) ) ( not ( = ?auto_35877 ?auto_35879 ) ) ( not ( = ?auto_35896 ?auto_35879 ) ) ( not ( = ?auto_35892 ?auto_35879 ) ) ( not ( = ?auto_35893 ?auto_35879 ) ) ( not ( = ?auto_35880 ?auto_35879 ) ) ( not ( = ?auto_35887 ?auto_35879 ) ) ( not ( = ?auto_35874 ?auto_35879 ) ) ( SURFACE-AT ?auto_35886 ?auto_35875 ) ( CLEAR ?auto_35886 ) ( IS-CRATE ?auto_35874 ) ( not ( = ?auto_35871 ?auto_35886 ) ) ( not ( = ?auto_35872 ?auto_35886 ) ) ( not ( = ?auto_35873 ?auto_35886 ) ) ( not ( = ?auto_35882 ?auto_35886 ) ) ( not ( = ?auto_35878 ?auto_35886 ) ) ( not ( = ?auto_35877 ?auto_35886 ) ) ( not ( = ?auto_35896 ?auto_35886 ) ) ( not ( = ?auto_35892 ?auto_35886 ) ) ( not ( = ?auto_35893 ?auto_35886 ) ) ( not ( = ?auto_35880 ?auto_35886 ) ) ( not ( = ?auto_35887 ?auto_35886 ) ) ( not ( = ?auto_35874 ?auto_35886 ) ) ( not ( = ?auto_35879 ?auto_35886 ) ) ( AVAILABLE ?auto_35895 ) ( TRUCK-AT ?auto_35881 ?auto_35888 ) ( not ( = ?auto_35888 ?auto_35875 ) ) ( not ( = ?auto_35883 ?auto_35888 ) ) ( not ( = ?auto_35884 ?auto_35888 ) ) ( not ( = ?auto_35891 ?auto_35888 ) ) ( not ( = ?auto_35890 ?auto_35888 ) ) ( HOIST-AT ?auto_35897 ?auto_35888 ) ( LIFTING ?auto_35897 ?auto_35874 ) ( not ( = ?auto_35895 ?auto_35897 ) ) ( not ( = ?auto_35876 ?auto_35897 ) ) ( not ( = ?auto_35885 ?auto_35897 ) ) ( not ( = ?auto_35894 ?auto_35897 ) ) ( not ( = ?auto_35889 ?auto_35897 ) ) )
    :subtasks
    ( ( !LOAD ?auto_35897 ?auto_35874 ?auto_35881 ?auto_35888 )
      ( MAKE-ON ?auto_35871 ?auto_35872 )
      ( MAKE-ON-VERIFY ?auto_35871 ?auto_35872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35898 - SURFACE
      ?auto_35899 - SURFACE
    )
    :vars
    (
      ?auto_35914 - HOIST
      ?auto_35915 - PLACE
      ?auto_35918 - PLACE
      ?auto_35906 - HOIST
      ?auto_35903 - SURFACE
      ?auto_35900 - SURFACE
      ?auto_35922 - PLACE
      ?auto_35907 - HOIST
      ?auto_35919 - SURFACE
      ?auto_35921 - SURFACE
      ?auto_35910 - PLACE
      ?auto_35913 - HOIST
      ?auto_35904 - SURFACE
      ?auto_35911 - SURFACE
      ?auto_35905 - PLACE
      ?auto_35901 - HOIST
      ?auto_35912 - SURFACE
      ?auto_35902 - SURFACE
      ?auto_35917 - SURFACE
      ?auto_35920 - SURFACE
      ?auto_35908 - SURFACE
      ?auto_35923 - SURFACE
      ?auto_35909 - TRUCK
      ?auto_35916 - PLACE
      ?auto_35924 - HOIST
      ?auto_35925 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35914 ?auto_35915 ) ( IS-CRATE ?auto_35898 ) ( not ( = ?auto_35898 ?auto_35899 ) ) ( not ( = ?auto_35918 ?auto_35915 ) ) ( HOIST-AT ?auto_35906 ?auto_35918 ) ( not ( = ?auto_35914 ?auto_35906 ) ) ( SURFACE-AT ?auto_35898 ?auto_35918 ) ( ON ?auto_35898 ?auto_35903 ) ( CLEAR ?auto_35898 ) ( not ( = ?auto_35898 ?auto_35903 ) ) ( not ( = ?auto_35899 ?auto_35903 ) ) ( IS-CRATE ?auto_35899 ) ( not ( = ?auto_35898 ?auto_35900 ) ) ( not ( = ?auto_35899 ?auto_35900 ) ) ( not ( = ?auto_35903 ?auto_35900 ) ) ( not ( = ?auto_35922 ?auto_35915 ) ) ( not ( = ?auto_35918 ?auto_35922 ) ) ( HOIST-AT ?auto_35907 ?auto_35922 ) ( not ( = ?auto_35914 ?auto_35907 ) ) ( not ( = ?auto_35906 ?auto_35907 ) ) ( AVAILABLE ?auto_35907 ) ( SURFACE-AT ?auto_35899 ?auto_35922 ) ( ON ?auto_35899 ?auto_35919 ) ( CLEAR ?auto_35899 ) ( not ( = ?auto_35898 ?auto_35919 ) ) ( not ( = ?auto_35899 ?auto_35919 ) ) ( not ( = ?auto_35903 ?auto_35919 ) ) ( not ( = ?auto_35900 ?auto_35919 ) ) ( IS-CRATE ?auto_35900 ) ( not ( = ?auto_35898 ?auto_35921 ) ) ( not ( = ?auto_35899 ?auto_35921 ) ) ( not ( = ?auto_35903 ?auto_35921 ) ) ( not ( = ?auto_35900 ?auto_35921 ) ) ( not ( = ?auto_35919 ?auto_35921 ) ) ( not ( = ?auto_35910 ?auto_35915 ) ) ( not ( = ?auto_35918 ?auto_35910 ) ) ( not ( = ?auto_35922 ?auto_35910 ) ) ( HOIST-AT ?auto_35913 ?auto_35910 ) ( not ( = ?auto_35914 ?auto_35913 ) ) ( not ( = ?auto_35906 ?auto_35913 ) ) ( not ( = ?auto_35907 ?auto_35913 ) ) ( SURFACE-AT ?auto_35900 ?auto_35910 ) ( ON ?auto_35900 ?auto_35904 ) ( CLEAR ?auto_35900 ) ( not ( = ?auto_35898 ?auto_35904 ) ) ( not ( = ?auto_35899 ?auto_35904 ) ) ( not ( = ?auto_35903 ?auto_35904 ) ) ( not ( = ?auto_35900 ?auto_35904 ) ) ( not ( = ?auto_35919 ?auto_35904 ) ) ( not ( = ?auto_35921 ?auto_35904 ) ) ( IS-CRATE ?auto_35921 ) ( not ( = ?auto_35898 ?auto_35911 ) ) ( not ( = ?auto_35899 ?auto_35911 ) ) ( not ( = ?auto_35903 ?auto_35911 ) ) ( not ( = ?auto_35900 ?auto_35911 ) ) ( not ( = ?auto_35919 ?auto_35911 ) ) ( not ( = ?auto_35921 ?auto_35911 ) ) ( not ( = ?auto_35904 ?auto_35911 ) ) ( not ( = ?auto_35905 ?auto_35915 ) ) ( not ( = ?auto_35918 ?auto_35905 ) ) ( not ( = ?auto_35922 ?auto_35905 ) ) ( not ( = ?auto_35910 ?auto_35905 ) ) ( HOIST-AT ?auto_35901 ?auto_35905 ) ( not ( = ?auto_35914 ?auto_35901 ) ) ( not ( = ?auto_35906 ?auto_35901 ) ) ( not ( = ?auto_35907 ?auto_35901 ) ) ( not ( = ?auto_35913 ?auto_35901 ) ) ( AVAILABLE ?auto_35901 ) ( SURFACE-AT ?auto_35921 ?auto_35905 ) ( ON ?auto_35921 ?auto_35912 ) ( CLEAR ?auto_35921 ) ( not ( = ?auto_35898 ?auto_35912 ) ) ( not ( = ?auto_35899 ?auto_35912 ) ) ( not ( = ?auto_35903 ?auto_35912 ) ) ( not ( = ?auto_35900 ?auto_35912 ) ) ( not ( = ?auto_35919 ?auto_35912 ) ) ( not ( = ?auto_35921 ?auto_35912 ) ) ( not ( = ?auto_35904 ?auto_35912 ) ) ( not ( = ?auto_35911 ?auto_35912 ) ) ( IS-CRATE ?auto_35911 ) ( not ( = ?auto_35898 ?auto_35902 ) ) ( not ( = ?auto_35899 ?auto_35902 ) ) ( not ( = ?auto_35903 ?auto_35902 ) ) ( not ( = ?auto_35900 ?auto_35902 ) ) ( not ( = ?auto_35919 ?auto_35902 ) ) ( not ( = ?auto_35921 ?auto_35902 ) ) ( not ( = ?auto_35904 ?auto_35902 ) ) ( not ( = ?auto_35911 ?auto_35902 ) ) ( not ( = ?auto_35912 ?auto_35902 ) ) ( AVAILABLE ?auto_35913 ) ( SURFACE-AT ?auto_35911 ?auto_35910 ) ( ON ?auto_35911 ?auto_35917 ) ( CLEAR ?auto_35911 ) ( not ( = ?auto_35898 ?auto_35917 ) ) ( not ( = ?auto_35899 ?auto_35917 ) ) ( not ( = ?auto_35903 ?auto_35917 ) ) ( not ( = ?auto_35900 ?auto_35917 ) ) ( not ( = ?auto_35919 ?auto_35917 ) ) ( not ( = ?auto_35921 ?auto_35917 ) ) ( not ( = ?auto_35904 ?auto_35917 ) ) ( not ( = ?auto_35911 ?auto_35917 ) ) ( not ( = ?auto_35912 ?auto_35917 ) ) ( not ( = ?auto_35902 ?auto_35917 ) ) ( IS-CRATE ?auto_35902 ) ( not ( = ?auto_35898 ?auto_35920 ) ) ( not ( = ?auto_35899 ?auto_35920 ) ) ( not ( = ?auto_35903 ?auto_35920 ) ) ( not ( = ?auto_35900 ?auto_35920 ) ) ( not ( = ?auto_35919 ?auto_35920 ) ) ( not ( = ?auto_35921 ?auto_35920 ) ) ( not ( = ?auto_35904 ?auto_35920 ) ) ( not ( = ?auto_35911 ?auto_35920 ) ) ( not ( = ?auto_35912 ?auto_35920 ) ) ( not ( = ?auto_35902 ?auto_35920 ) ) ( not ( = ?auto_35917 ?auto_35920 ) ) ( AVAILABLE ?auto_35906 ) ( SURFACE-AT ?auto_35902 ?auto_35918 ) ( ON ?auto_35902 ?auto_35908 ) ( CLEAR ?auto_35902 ) ( not ( = ?auto_35898 ?auto_35908 ) ) ( not ( = ?auto_35899 ?auto_35908 ) ) ( not ( = ?auto_35903 ?auto_35908 ) ) ( not ( = ?auto_35900 ?auto_35908 ) ) ( not ( = ?auto_35919 ?auto_35908 ) ) ( not ( = ?auto_35921 ?auto_35908 ) ) ( not ( = ?auto_35904 ?auto_35908 ) ) ( not ( = ?auto_35911 ?auto_35908 ) ) ( not ( = ?auto_35912 ?auto_35908 ) ) ( not ( = ?auto_35902 ?auto_35908 ) ) ( not ( = ?auto_35917 ?auto_35908 ) ) ( not ( = ?auto_35920 ?auto_35908 ) ) ( SURFACE-AT ?auto_35923 ?auto_35915 ) ( CLEAR ?auto_35923 ) ( IS-CRATE ?auto_35920 ) ( not ( = ?auto_35898 ?auto_35923 ) ) ( not ( = ?auto_35899 ?auto_35923 ) ) ( not ( = ?auto_35903 ?auto_35923 ) ) ( not ( = ?auto_35900 ?auto_35923 ) ) ( not ( = ?auto_35919 ?auto_35923 ) ) ( not ( = ?auto_35921 ?auto_35923 ) ) ( not ( = ?auto_35904 ?auto_35923 ) ) ( not ( = ?auto_35911 ?auto_35923 ) ) ( not ( = ?auto_35912 ?auto_35923 ) ) ( not ( = ?auto_35902 ?auto_35923 ) ) ( not ( = ?auto_35917 ?auto_35923 ) ) ( not ( = ?auto_35920 ?auto_35923 ) ) ( not ( = ?auto_35908 ?auto_35923 ) ) ( AVAILABLE ?auto_35914 ) ( TRUCK-AT ?auto_35909 ?auto_35916 ) ( not ( = ?auto_35916 ?auto_35915 ) ) ( not ( = ?auto_35918 ?auto_35916 ) ) ( not ( = ?auto_35922 ?auto_35916 ) ) ( not ( = ?auto_35910 ?auto_35916 ) ) ( not ( = ?auto_35905 ?auto_35916 ) ) ( HOIST-AT ?auto_35924 ?auto_35916 ) ( not ( = ?auto_35914 ?auto_35924 ) ) ( not ( = ?auto_35906 ?auto_35924 ) ) ( not ( = ?auto_35907 ?auto_35924 ) ) ( not ( = ?auto_35913 ?auto_35924 ) ) ( not ( = ?auto_35901 ?auto_35924 ) ) ( AVAILABLE ?auto_35924 ) ( SURFACE-AT ?auto_35920 ?auto_35916 ) ( ON ?auto_35920 ?auto_35925 ) ( CLEAR ?auto_35920 ) ( not ( = ?auto_35898 ?auto_35925 ) ) ( not ( = ?auto_35899 ?auto_35925 ) ) ( not ( = ?auto_35903 ?auto_35925 ) ) ( not ( = ?auto_35900 ?auto_35925 ) ) ( not ( = ?auto_35919 ?auto_35925 ) ) ( not ( = ?auto_35921 ?auto_35925 ) ) ( not ( = ?auto_35904 ?auto_35925 ) ) ( not ( = ?auto_35911 ?auto_35925 ) ) ( not ( = ?auto_35912 ?auto_35925 ) ) ( not ( = ?auto_35902 ?auto_35925 ) ) ( not ( = ?auto_35917 ?auto_35925 ) ) ( not ( = ?auto_35920 ?auto_35925 ) ) ( not ( = ?auto_35908 ?auto_35925 ) ) ( not ( = ?auto_35923 ?auto_35925 ) ) )
    :subtasks
    ( ( !LIFT ?auto_35924 ?auto_35920 ?auto_35925 ?auto_35916 )
      ( MAKE-ON ?auto_35898 ?auto_35899 )
      ( MAKE-ON-VERIFY ?auto_35898 ?auto_35899 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35926 - SURFACE
      ?auto_35927 - SURFACE
    )
    :vars
    (
      ?auto_35932 - HOIST
      ?auto_35933 - PLACE
      ?auto_35934 - PLACE
      ?auto_35935 - HOIST
      ?auto_35938 - SURFACE
      ?auto_35947 - SURFACE
      ?auto_35943 - PLACE
      ?auto_35940 - HOIST
      ?auto_35948 - SURFACE
      ?auto_35942 - SURFACE
      ?auto_35931 - PLACE
      ?auto_35950 - HOIST
      ?auto_35952 - SURFACE
      ?auto_35936 - SURFACE
      ?auto_35941 - PLACE
      ?auto_35951 - HOIST
      ?auto_35937 - SURFACE
      ?auto_35944 - SURFACE
      ?auto_35928 - SURFACE
      ?auto_35949 - SURFACE
      ?auto_35946 - SURFACE
      ?auto_35930 - SURFACE
      ?auto_35929 - PLACE
      ?auto_35939 - HOIST
      ?auto_35953 - SURFACE
      ?auto_35945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35932 ?auto_35933 ) ( IS-CRATE ?auto_35926 ) ( not ( = ?auto_35926 ?auto_35927 ) ) ( not ( = ?auto_35934 ?auto_35933 ) ) ( HOIST-AT ?auto_35935 ?auto_35934 ) ( not ( = ?auto_35932 ?auto_35935 ) ) ( SURFACE-AT ?auto_35926 ?auto_35934 ) ( ON ?auto_35926 ?auto_35938 ) ( CLEAR ?auto_35926 ) ( not ( = ?auto_35926 ?auto_35938 ) ) ( not ( = ?auto_35927 ?auto_35938 ) ) ( IS-CRATE ?auto_35927 ) ( not ( = ?auto_35926 ?auto_35947 ) ) ( not ( = ?auto_35927 ?auto_35947 ) ) ( not ( = ?auto_35938 ?auto_35947 ) ) ( not ( = ?auto_35943 ?auto_35933 ) ) ( not ( = ?auto_35934 ?auto_35943 ) ) ( HOIST-AT ?auto_35940 ?auto_35943 ) ( not ( = ?auto_35932 ?auto_35940 ) ) ( not ( = ?auto_35935 ?auto_35940 ) ) ( AVAILABLE ?auto_35940 ) ( SURFACE-AT ?auto_35927 ?auto_35943 ) ( ON ?auto_35927 ?auto_35948 ) ( CLEAR ?auto_35927 ) ( not ( = ?auto_35926 ?auto_35948 ) ) ( not ( = ?auto_35927 ?auto_35948 ) ) ( not ( = ?auto_35938 ?auto_35948 ) ) ( not ( = ?auto_35947 ?auto_35948 ) ) ( IS-CRATE ?auto_35947 ) ( not ( = ?auto_35926 ?auto_35942 ) ) ( not ( = ?auto_35927 ?auto_35942 ) ) ( not ( = ?auto_35938 ?auto_35942 ) ) ( not ( = ?auto_35947 ?auto_35942 ) ) ( not ( = ?auto_35948 ?auto_35942 ) ) ( not ( = ?auto_35931 ?auto_35933 ) ) ( not ( = ?auto_35934 ?auto_35931 ) ) ( not ( = ?auto_35943 ?auto_35931 ) ) ( HOIST-AT ?auto_35950 ?auto_35931 ) ( not ( = ?auto_35932 ?auto_35950 ) ) ( not ( = ?auto_35935 ?auto_35950 ) ) ( not ( = ?auto_35940 ?auto_35950 ) ) ( SURFACE-AT ?auto_35947 ?auto_35931 ) ( ON ?auto_35947 ?auto_35952 ) ( CLEAR ?auto_35947 ) ( not ( = ?auto_35926 ?auto_35952 ) ) ( not ( = ?auto_35927 ?auto_35952 ) ) ( not ( = ?auto_35938 ?auto_35952 ) ) ( not ( = ?auto_35947 ?auto_35952 ) ) ( not ( = ?auto_35948 ?auto_35952 ) ) ( not ( = ?auto_35942 ?auto_35952 ) ) ( IS-CRATE ?auto_35942 ) ( not ( = ?auto_35926 ?auto_35936 ) ) ( not ( = ?auto_35927 ?auto_35936 ) ) ( not ( = ?auto_35938 ?auto_35936 ) ) ( not ( = ?auto_35947 ?auto_35936 ) ) ( not ( = ?auto_35948 ?auto_35936 ) ) ( not ( = ?auto_35942 ?auto_35936 ) ) ( not ( = ?auto_35952 ?auto_35936 ) ) ( not ( = ?auto_35941 ?auto_35933 ) ) ( not ( = ?auto_35934 ?auto_35941 ) ) ( not ( = ?auto_35943 ?auto_35941 ) ) ( not ( = ?auto_35931 ?auto_35941 ) ) ( HOIST-AT ?auto_35951 ?auto_35941 ) ( not ( = ?auto_35932 ?auto_35951 ) ) ( not ( = ?auto_35935 ?auto_35951 ) ) ( not ( = ?auto_35940 ?auto_35951 ) ) ( not ( = ?auto_35950 ?auto_35951 ) ) ( AVAILABLE ?auto_35951 ) ( SURFACE-AT ?auto_35942 ?auto_35941 ) ( ON ?auto_35942 ?auto_35937 ) ( CLEAR ?auto_35942 ) ( not ( = ?auto_35926 ?auto_35937 ) ) ( not ( = ?auto_35927 ?auto_35937 ) ) ( not ( = ?auto_35938 ?auto_35937 ) ) ( not ( = ?auto_35947 ?auto_35937 ) ) ( not ( = ?auto_35948 ?auto_35937 ) ) ( not ( = ?auto_35942 ?auto_35937 ) ) ( not ( = ?auto_35952 ?auto_35937 ) ) ( not ( = ?auto_35936 ?auto_35937 ) ) ( IS-CRATE ?auto_35936 ) ( not ( = ?auto_35926 ?auto_35944 ) ) ( not ( = ?auto_35927 ?auto_35944 ) ) ( not ( = ?auto_35938 ?auto_35944 ) ) ( not ( = ?auto_35947 ?auto_35944 ) ) ( not ( = ?auto_35948 ?auto_35944 ) ) ( not ( = ?auto_35942 ?auto_35944 ) ) ( not ( = ?auto_35952 ?auto_35944 ) ) ( not ( = ?auto_35936 ?auto_35944 ) ) ( not ( = ?auto_35937 ?auto_35944 ) ) ( AVAILABLE ?auto_35950 ) ( SURFACE-AT ?auto_35936 ?auto_35931 ) ( ON ?auto_35936 ?auto_35928 ) ( CLEAR ?auto_35936 ) ( not ( = ?auto_35926 ?auto_35928 ) ) ( not ( = ?auto_35927 ?auto_35928 ) ) ( not ( = ?auto_35938 ?auto_35928 ) ) ( not ( = ?auto_35947 ?auto_35928 ) ) ( not ( = ?auto_35948 ?auto_35928 ) ) ( not ( = ?auto_35942 ?auto_35928 ) ) ( not ( = ?auto_35952 ?auto_35928 ) ) ( not ( = ?auto_35936 ?auto_35928 ) ) ( not ( = ?auto_35937 ?auto_35928 ) ) ( not ( = ?auto_35944 ?auto_35928 ) ) ( IS-CRATE ?auto_35944 ) ( not ( = ?auto_35926 ?auto_35949 ) ) ( not ( = ?auto_35927 ?auto_35949 ) ) ( not ( = ?auto_35938 ?auto_35949 ) ) ( not ( = ?auto_35947 ?auto_35949 ) ) ( not ( = ?auto_35948 ?auto_35949 ) ) ( not ( = ?auto_35942 ?auto_35949 ) ) ( not ( = ?auto_35952 ?auto_35949 ) ) ( not ( = ?auto_35936 ?auto_35949 ) ) ( not ( = ?auto_35937 ?auto_35949 ) ) ( not ( = ?auto_35944 ?auto_35949 ) ) ( not ( = ?auto_35928 ?auto_35949 ) ) ( AVAILABLE ?auto_35935 ) ( SURFACE-AT ?auto_35944 ?auto_35934 ) ( ON ?auto_35944 ?auto_35946 ) ( CLEAR ?auto_35944 ) ( not ( = ?auto_35926 ?auto_35946 ) ) ( not ( = ?auto_35927 ?auto_35946 ) ) ( not ( = ?auto_35938 ?auto_35946 ) ) ( not ( = ?auto_35947 ?auto_35946 ) ) ( not ( = ?auto_35948 ?auto_35946 ) ) ( not ( = ?auto_35942 ?auto_35946 ) ) ( not ( = ?auto_35952 ?auto_35946 ) ) ( not ( = ?auto_35936 ?auto_35946 ) ) ( not ( = ?auto_35937 ?auto_35946 ) ) ( not ( = ?auto_35944 ?auto_35946 ) ) ( not ( = ?auto_35928 ?auto_35946 ) ) ( not ( = ?auto_35949 ?auto_35946 ) ) ( SURFACE-AT ?auto_35930 ?auto_35933 ) ( CLEAR ?auto_35930 ) ( IS-CRATE ?auto_35949 ) ( not ( = ?auto_35926 ?auto_35930 ) ) ( not ( = ?auto_35927 ?auto_35930 ) ) ( not ( = ?auto_35938 ?auto_35930 ) ) ( not ( = ?auto_35947 ?auto_35930 ) ) ( not ( = ?auto_35948 ?auto_35930 ) ) ( not ( = ?auto_35942 ?auto_35930 ) ) ( not ( = ?auto_35952 ?auto_35930 ) ) ( not ( = ?auto_35936 ?auto_35930 ) ) ( not ( = ?auto_35937 ?auto_35930 ) ) ( not ( = ?auto_35944 ?auto_35930 ) ) ( not ( = ?auto_35928 ?auto_35930 ) ) ( not ( = ?auto_35949 ?auto_35930 ) ) ( not ( = ?auto_35946 ?auto_35930 ) ) ( AVAILABLE ?auto_35932 ) ( not ( = ?auto_35929 ?auto_35933 ) ) ( not ( = ?auto_35934 ?auto_35929 ) ) ( not ( = ?auto_35943 ?auto_35929 ) ) ( not ( = ?auto_35931 ?auto_35929 ) ) ( not ( = ?auto_35941 ?auto_35929 ) ) ( HOIST-AT ?auto_35939 ?auto_35929 ) ( not ( = ?auto_35932 ?auto_35939 ) ) ( not ( = ?auto_35935 ?auto_35939 ) ) ( not ( = ?auto_35940 ?auto_35939 ) ) ( not ( = ?auto_35950 ?auto_35939 ) ) ( not ( = ?auto_35951 ?auto_35939 ) ) ( AVAILABLE ?auto_35939 ) ( SURFACE-AT ?auto_35949 ?auto_35929 ) ( ON ?auto_35949 ?auto_35953 ) ( CLEAR ?auto_35949 ) ( not ( = ?auto_35926 ?auto_35953 ) ) ( not ( = ?auto_35927 ?auto_35953 ) ) ( not ( = ?auto_35938 ?auto_35953 ) ) ( not ( = ?auto_35947 ?auto_35953 ) ) ( not ( = ?auto_35948 ?auto_35953 ) ) ( not ( = ?auto_35942 ?auto_35953 ) ) ( not ( = ?auto_35952 ?auto_35953 ) ) ( not ( = ?auto_35936 ?auto_35953 ) ) ( not ( = ?auto_35937 ?auto_35953 ) ) ( not ( = ?auto_35944 ?auto_35953 ) ) ( not ( = ?auto_35928 ?auto_35953 ) ) ( not ( = ?auto_35949 ?auto_35953 ) ) ( not ( = ?auto_35946 ?auto_35953 ) ) ( not ( = ?auto_35930 ?auto_35953 ) ) ( TRUCK-AT ?auto_35945 ?auto_35933 ) )
    :subtasks
    ( ( !DRIVE ?auto_35945 ?auto_35933 ?auto_35929 )
      ( MAKE-ON ?auto_35926 ?auto_35927 )
      ( MAKE-ON-VERIFY ?auto_35926 ?auto_35927 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35954 - SURFACE
      ?auto_35955 - SURFACE
    )
    :vars
    (
      ?auto_35968 - HOIST
      ?auto_35971 - PLACE
      ?auto_35973 - PLACE
      ?auto_35977 - HOIST
      ?auto_35979 - SURFACE
      ?auto_35962 - SURFACE
      ?auto_35957 - PLACE
      ?auto_35978 - HOIST
      ?auto_35963 - SURFACE
      ?auto_35967 - SURFACE
      ?auto_35974 - PLACE
      ?auto_35960 - HOIST
      ?auto_35975 - SURFACE
      ?auto_35956 - SURFACE
      ?auto_35970 - PLACE
      ?auto_35980 - HOIST
      ?auto_35969 - SURFACE
      ?auto_35981 - SURFACE
      ?auto_35966 - SURFACE
      ?auto_35961 - SURFACE
      ?auto_35965 - SURFACE
      ?auto_35972 - SURFACE
      ?auto_35958 - PLACE
      ?auto_35959 - HOIST
      ?auto_35976 - SURFACE
      ?auto_35964 - TRUCK
      ?auto_35982 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35968 ?auto_35971 ) ( IS-CRATE ?auto_35954 ) ( not ( = ?auto_35954 ?auto_35955 ) ) ( not ( = ?auto_35973 ?auto_35971 ) ) ( HOIST-AT ?auto_35977 ?auto_35973 ) ( not ( = ?auto_35968 ?auto_35977 ) ) ( SURFACE-AT ?auto_35954 ?auto_35973 ) ( ON ?auto_35954 ?auto_35979 ) ( CLEAR ?auto_35954 ) ( not ( = ?auto_35954 ?auto_35979 ) ) ( not ( = ?auto_35955 ?auto_35979 ) ) ( IS-CRATE ?auto_35955 ) ( not ( = ?auto_35954 ?auto_35962 ) ) ( not ( = ?auto_35955 ?auto_35962 ) ) ( not ( = ?auto_35979 ?auto_35962 ) ) ( not ( = ?auto_35957 ?auto_35971 ) ) ( not ( = ?auto_35973 ?auto_35957 ) ) ( HOIST-AT ?auto_35978 ?auto_35957 ) ( not ( = ?auto_35968 ?auto_35978 ) ) ( not ( = ?auto_35977 ?auto_35978 ) ) ( AVAILABLE ?auto_35978 ) ( SURFACE-AT ?auto_35955 ?auto_35957 ) ( ON ?auto_35955 ?auto_35963 ) ( CLEAR ?auto_35955 ) ( not ( = ?auto_35954 ?auto_35963 ) ) ( not ( = ?auto_35955 ?auto_35963 ) ) ( not ( = ?auto_35979 ?auto_35963 ) ) ( not ( = ?auto_35962 ?auto_35963 ) ) ( IS-CRATE ?auto_35962 ) ( not ( = ?auto_35954 ?auto_35967 ) ) ( not ( = ?auto_35955 ?auto_35967 ) ) ( not ( = ?auto_35979 ?auto_35967 ) ) ( not ( = ?auto_35962 ?auto_35967 ) ) ( not ( = ?auto_35963 ?auto_35967 ) ) ( not ( = ?auto_35974 ?auto_35971 ) ) ( not ( = ?auto_35973 ?auto_35974 ) ) ( not ( = ?auto_35957 ?auto_35974 ) ) ( HOIST-AT ?auto_35960 ?auto_35974 ) ( not ( = ?auto_35968 ?auto_35960 ) ) ( not ( = ?auto_35977 ?auto_35960 ) ) ( not ( = ?auto_35978 ?auto_35960 ) ) ( SURFACE-AT ?auto_35962 ?auto_35974 ) ( ON ?auto_35962 ?auto_35975 ) ( CLEAR ?auto_35962 ) ( not ( = ?auto_35954 ?auto_35975 ) ) ( not ( = ?auto_35955 ?auto_35975 ) ) ( not ( = ?auto_35979 ?auto_35975 ) ) ( not ( = ?auto_35962 ?auto_35975 ) ) ( not ( = ?auto_35963 ?auto_35975 ) ) ( not ( = ?auto_35967 ?auto_35975 ) ) ( IS-CRATE ?auto_35967 ) ( not ( = ?auto_35954 ?auto_35956 ) ) ( not ( = ?auto_35955 ?auto_35956 ) ) ( not ( = ?auto_35979 ?auto_35956 ) ) ( not ( = ?auto_35962 ?auto_35956 ) ) ( not ( = ?auto_35963 ?auto_35956 ) ) ( not ( = ?auto_35967 ?auto_35956 ) ) ( not ( = ?auto_35975 ?auto_35956 ) ) ( not ( = ?auto_35970 ?auto_35971 ) ) ( not ( = ?auto_35973 ?auto_35970 ) ) ( not ( = ?auto_35957 ?auto_35970 ) ) ( not ( = ?auto_35974 ?auto_35970 ) ) ( HOIST-AT ?auto_35980 ?auto_35970 ) ( not ( = ?auto_35968 ?auto_35980 ) ) ( not ( = ?auto_35977 ?auto_35980 ) ) ( not ( = ?auto_35978 ?auto_35980 ) ) ( not ( = ?auto_35960 ?auto_35980 ) ) ( AVAILABLE ?auto_35980 ) ( SURFACE-AT ?auto_35967 ?auto_35970 ) ( ON ?auto_35967 ?auto_35969 ) ( CLEAR ?auto_35967 ) ( not ( = ?auto_35954 ?auto_35969 ) ) ( not ( = ?auto_35955 ?auto_35969 ) ) ( not ( = ?auto_35979 ?auto_35969 ) ) ( not ( = ?auto_35962 ?auto_35969 ) ) ( not ( = ?auto_35963 ?auto_35969 ) ) ( not ( = ?auto_35967 ?auto_35969 ) ) ( not ( = ?auto_35975 ?auto_35969 ) ) ( not ( = ?auto_35956 ?auto_35969 ) ) ( IS-CRATE ?auto_35956 ) ( not ( = ?auto_35954 ?auto_35981 ) ) ( not ( = ?auto_35955 ?auto_35981 ) ) ( not ( = ?auto_35979 ?auto_35981 ) ) ( not ( = ?auto_35962 ?auto_35981 ) ) ( not ( = ?auto_35963 ?auto_35981 ) ) ( not ( = ?auto_35967 ?auto_35981 ) ) ( not ( = ?auto_35975 ?auto_35981 ) ) ( not ( = ?auto_35956 ?auto_35981 ) ) ( not ( = ?auto_35969 ?auto_35981 ) ) ( AVAILABLE ?auto_35960 ) ( SURFACE-AT ?auto_35956 ?auto_35974 ) ( ON ?auto_35956 ?auto_35966 ) ( CLEAR ?auto_35956 ) ( not ( = ?auto_35954 ?auto_35966 ) ) ( not ( = ?auto_35955 ?auto_35966 ) ) ( not ( = ?auto_35979 ?auto_35966 ) ) ( not ( = ?auto_35962 ?auto_35966 ) ) ( not ( = ?auto_35963 ?auto_35966 ) ) ( not ( = ?auto_35967 ?auto_35966 ) ) ( not ( = ?auto_35975 ?auto_35966 ) ) ( not ( = ?auto_35956 ?auto_35966 ) ) ( not ( = ?auto_35969 ?auto_35966 ) ) ( not ( = ?auto_35981 ?auto_35966 ) ) ( IS-CRATE ?auto_35981 ) ( not ( = ?auto_35954 ?auto_35961 ) ) ( not ( = ?auto_35955 ?auto_35961 ) ) ( not ( = ?auto_35979 ?auto_35961 ) ) ( not ( = ?auto_35962 ?auto_35961 ) ) ( not ( = ?auto_35963 ?auto_35961 ) ) ( not ( = ?auto_35967 ?auto_35961 ) ) ( not ( = ?auto_35975 ?auto_35961 ) ) ( not ( = ?auto_35956 ?auto_35961 ) ) ( not ( = ?auto_35969 ?auto_35961 ) ) ( not ( = ?auto_35981 ?auto_35961 ) ) ( not ( = ?auto_35966 ?auto_35961 ) ) ( AVAILABLE ?auto_35977 ) ( SURFACE-AT ?auto_35981 ?auto_35973 ) ( ON ?auto_35981 ?auto_35965 ) ( CLEAR ?auto_35981 ) ( not ( = ?auto_35954 ?auto_35965 ) ) ( not ( = ?auto_35955 ?auto_35965 ) ) ( not ( = ?auto_35979 ?auto_35965 ) ) ( not ( = ?auto_35962 ?auto_35965 ) ) ( not ( = ?auto_35963 ?auto_35965 ) ) ( not ( = ?auto_35967 ?auto_35965 ) ) ( not ( = ?auto_35975 ?auto_35965 ) ) ( not ( = ?auto_35956 ?auto_35965 ) ) ( not ( = ?auto_35969 ?auto_35965 ) ) ( not ( = ?auto_35981 ?auto_35965 ) ) ( not ( = ?auto_35966 ?auto_35965 ) ) ( not ( = ?auto_35961 ?auto_35965 ) ) ( IS-CRATE ?auto_35961 ) ( not ( = ?auto_35954 ?auto_35972 ) ) ( not ( = ?auto_35955 ?auto_35972 ) ) ( not ( = ?auto_35979 ?auto_35972 ) ) ( not ( = ?auto_35962 ?auto_35972 ) ) ( not ( = ?auto_35963 ?auto_35972 ) ) ( not ( = ?auto_35967 ?auto_35972 ) ) ( not ( = ?auto_35975 ?auto_35972 ) ) ( not ( = ?auto_35956 ?auto_35972 ) ) ( not ( = ?auto_35969 ?auto_35972 ) ) ( not ( = ?auto_35981 ?auto_35972 ) ) ( not ( = ?auto_35966 ?auto_35972 ) ) ( not ( = ?auto_35961 ?auto_35972 ) ) ( not ( = ?auto_35965 ?auto_35972 ) ) ( not ( = ?auto_35958 ?auto_35971 ) ) ( not ( = ?auto_35973 ?auto_35958 ) ) ( not ( = ?auto_35957 ?auto_35958 ) ) ( not ( = ?auto_35974 ?auto_35958 ) ) ( not ( = ?auto_35970 ?auto_35958 ) ) ( HOIST-AT ?auto_35959 ?auto_35958 ) ( not ( = ?auto_35968 ?auto_35959 ) ) ( not ( = ?auto_35977 ?auto_35959 ) ) ( not ( = ?auto_35978 ?auto_35959 ) ) ( not ( = ?auto_35960 ?auto_35959 ) ) ( not ( = ?auto_35980 ?auto_35959 ) ) ( AVAILABLE ?auto_35959 ) ( SURFACE-AT ?auto_35961 ?auto_35958 ) ( ON ?auto_35961 ?auto_35976 ) ( CLEAR ?auto_35961 ) ( not ( = ?auto_35954 ?auto_35976 ) ) ( not ( = ?auto_35955 ?auto_35976 ) ) ( not ( = ?auto_35979 ?auto_35976 ) ) ( not ( = ?auto_35962 ?auto_35976 ) ) ( not ( = ?auto_35963 ?auto_35976 ) ) ( not ( = ?auto_35967 ?auto_35976 ) ) ( not ( = ?auto_35975 ?auto_35976 ) ) ( not ( = ?auto_35956 ?auto_35976 ) ) ( not ( = ?auto_35969 ?auto_35976 ) ) ( not ( = ?auto_35981 ?auto_35976 ) ) ( not ( = ?auto_35966 ?auto_35976 ) ) ( not ( = ?auto_35961 ?auto_35976 ) ) ( not ( = ?auto_35965 ?auto_35976 ) ) ( not ( = ?auto_35972 ?auto_35976 ) ) ( TRUCK-AT ?auto_35964 ?auto_35971 ) ( SURFACE-AT ?auto_35982 ?auto_35971 ) ( CLEAR ?auto_35982 ) ( LIFTING ?auto_35968 ?auto_35972 ) ( IS-CRATE ?auto_35972 ) ( not ( = ?auto_35954 ?auto_35982 ) ) ( not ( = ?auto_35955 ?auto_35982 ) ) ( not ( = ?auto_35979 ?auto_35982 ) ) ( not ( = ?auto_35962 ?auto_35982 ) ) ( not ( = ?auto_35963 ?auto_35982 ) ) ( not ( = ?auto_35967 ?auto_35982 ) ) ( not ( = ?auto_35975 ?auto_35982 ) ) ( not ( = ?auto_35956 ?auto_35982 ) ) ( not ( = ?auto_35969 ?auto_35982 ) ) ( not ( = ?auto_35981 ?auto_35982 ) ) ( not ( = ?auto_35966 ?auto_35982 ) ) ( not ( = ?auto_35961 ?auto_35982 ) ) ( not ( = ?auto_35965 ?auto_35982 ) ) ( not ( = ?auto_35972 ?auto_35982 ) ) ( not ( = ?auto_35976 ?auto_35982 ) ) )
    :subtasks
    ( ( !DROP ?auto_35968 ?auto_35972 ?auto_35982 ?auto_35971 )
      ( MAKE-ON ?auto_35954 ?auto_35955 )
      ( MAKE-ON-VERIFY ?auto_35954 ?auto_35955 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_35983 - SURFACE
      ?auto_35984 - SURFACE
    )
    :vars
    (
      ?auto_35993 - HOIST
      ?auto_35990 - PLACE
      ?auto_36003 - PLACE
      ?auto_36007 - HOIST
      ?auto_35998 - SURFACE
      ?auto_36001 - SURFACE
      ?auto_35997 - PLACE
      ?auto_36008 - HOIST
      ?auto_35994 - SURFACE
      ?auto_36009 - SURFACE
      ?auto_36004 - PLACE
      ?auto_35989 - HOIST
      ?auto_36005 - SURFACE
      ?auto_35991 - SURFACE
      ?auto_36000 - PLACE
      ?auto_35988 - HOIST
      ?auto_36010 - SURFACE
      ?auto_35987 - SURFACE
      ?auto_35986 - SURFACE
      ?auto_35995 - SURFACE
      ?auto_35985 - SURFACE
      ?auto_35999 - SURFACE
      ?auto_35996 - PLACE
      ?auto_35992 - HOIST
      ?auto_36006 - SURFACE
      ?auto_36011 - TRUCK
      ?auto_36002 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_35993 ?auto_35990 ) ( IS-CRATE ?auto_35983 ) ( not ( = ?auto_35983 ?auto_35984 ) ) ( not ( = ?auto_36003 ?auto_35990 ) ) ( HOIST-AT ?auto_36007 ?auto_36003 ) ( not ( = ?auto_35993 ?auto_36007 ) ) ( SURFACE-AT ?auto_35983 ?auto_36003 ) ( ON ?auto_35983 ?auto_35998 ) ( CLEAR ?auto_35983 ) ( not ( = ?auto_35983 ?auto_35998 ) ) ( not ( = ?auto_35984 ?auto_35998 ) ) ( IS-CRATE ?auto_35984 ) ( not ( = ?auto_35983 ?auto_36001 ) ) ( not ( = ?auto_35984 ?auto_36001 ) ) ( not ( = ?auto_35998 ?auto_36001 ) ) ( not ( = ?auto_35997 ?auto_35990 ) ) ( not ( = ?auto_36003 ?auto_35997 ) ) ( HOIST-AT ?auto_36008 ?auto_35997 ) ( not ( = ?auto_35993 ?auto_36008 ) ) ( not ( = ?auto_36007 ?auto_36008 ) ) ( AVAILABLE ?auto_36008 ) ( SURFACE-AT ?auto_35984 ?auto_35997 ) ( ON ?auto_35984 ?auto_35994 ) ( CLEAR ?auto_35984 ) ( not ( = ?auto_35983 ?auto_35994 ) ) ( not ( = ?auto_35984 ?auto_35994 ) ) ( not ( = ?auto_35998 ?auto_35994 ) ) ( not ( = ?auto_36001 ?auto_35994 ) ) ( IS-CRATE ?auto_36001 ) ( not ( = ?auto_35983 ?auto_36009 ) ) ( not ( = ?auto_35984 ?auto_36009 ) ) ( not ( = ?auto_35998 ?auto_36009 ) ) ( not ( = ?auto_36001 ?auto_36009 ) ) ( not ( = ?auto_35994 ?auto_36009 ) ) ( not ( = ?auto_36004 ?auto_35990 ) ) ( not ( = ?auto_36003 ?auto_36004 ) ) ( not ( = ?auto_35997 ?auto_36004 ) ) ( HOIST-AT ?auto_35989 ?auto_36004 ) ( not ( = ?auto_35993 ?auto_35989 ) ) ( not ( = ?auto_36007 ?auto_35989 ) ) ( not ( = ?auto_36008 ?auto_35989 ) ) ( SURFACE-AT ?auto_36001 ?auto_36004 ) ( ON ?auto_36001 ?auto_36005 ) ( CLEAR ?auto_36001 ) ( not ( = ?auto_35983 ?auto_36005 ) ) ( not ( = ?auto_35984 ?auto_36005 ) ) ( not ( = ?auto_35998 ?auto_36005 ) ) ( not ( = ?auto_36001 ?auto_36005 ) ) ( not ( = ?auto_35994 ?auto_36005 ) ) ( not ( = ?auto_36009 ?auto_36005 ) ) ( IS-CRATE ?auto_36009 ) ( not ( = ?auto_35983 ?auto_35991 ) ) ( not ( = ?auto_35984 ?auto_35991 ) ) ( not ( = ?auto_35998 ?auto_35991 ) ) ( not ( = ?auto_36001 ?auto_35991 ) ) ( not ( = ?auto_35994 ?auto_35991 ) ) ( not ( = ?auto_36009 ?auto_35991 ) ) ( not ( = ?auto_36005 ?auto_35991 ) ) ( not ( = ?auto_36000 ?auto_35990 ) ) ( not ( = ?auto_36003 ?auto_36000 ) ) ( not ( = ?auto_35997 ?auto_36000 ) ) ( not ( = ?auto_36004 ?auto_36000 ) ) ( HOIST-AT ?auto_35988 ?auto_36000 ) ( not ( = ?auto_35993 ?auto_35988 ) ) ( not ( = ?auto_36007 ?auto_35988 ) ) ( not ( = ?auto_36008 ?auto_35988 ) ) ( not ( = ?auto_35989 ?auto_35988 ) ) ( AVAILABLE ?auto_35988 ) ( SURFACE-AT ?auto_36009 ?auto_36000 ) ( ON ?auto_36009 ?auto_36010 ) ( CLEAR ?auto_36009 ) ( not ( = ?auto_35983 ?auto_36010 ) ) ( not ( = ?auto_35984 ?auto_36010 ) ) ( not ( = ?auto_35998 ?auto_36010 ) ) ( not ( = ?auto_36001 ?auto_36010 ) ) ( not ( = ?auto_35994 ?auto_36010 ) ) ( not ( = ?auto_36009 ?auto_36010 ) ) ( not ( = ?auto_36005 ?auto_36010 ) ) ( not ( = ?auto_35991 ?auto_36010 ) ) ( IS-CRATE ?auto_35991 ) ( not ( = ?auto_35983 ?auto_35987 ) ) ( not ( = ?auto_35984 ?auto_35987 ) ) ( not ( = ?auto_35998 ?auto_35987 ) ) ( not ( = ?auto_36001 ?auto_35987 ) ) ( not ( = ?auto_35994 ?auto_35987 ) ) ( not ( = ?auto_36009 ?auto_35987 ) ) ( not ( = ?auto_36005 ?auto_35987 ) ) ( not ( = ?auto_35991 ?auto_35987 ) ) ( not ( = ?auto_36010 ?auto_35987 ) ) ( AVAILABLE ?auto_35989 ) ( SURFACE-AT ?auto_35991 ?auto_36004 ) ( ON ?auto_35991 ?auto_35986 ) ( CLEAR ?auto_35991 ) ( not ( = ?auto_35983 ?auto_35986 ) ) ( not ( = ?auto_35984 ?auto_35986 ) ) ( not ( = ?auto_35998 ?auto_35986 ) ) ( not ( = ?auto_36001 ?auto_35986 ) ) ( not ( = ?auto_35994 ?auto_35986 ) ) ( not ( = ?auto_36009 ?auto_35986 ) ) ( not ( = ?auto_36005 ?auto_35986 ) ) ( not ( = ?auto_35991 ?auto_35986 ) ) ( not ( = ?auto_36010 ?auto_35986 ) ) ( not ( = ?auto_35987 ?auto_35986 ) ) ( IS-CRATE ?auto_35987 ) ( not ( = ?auto_35983 ?auto_35995 ) ) ( not ( = ?auto_35984 ?auto_35995 ) ) ( not ( = ?auto_35998 ?auto_35995 ) ) ( not ( = ?auto_36001 ?auto_35995 ) ) ( not ( = ?auto_35994 ?auto_35995 ) ) ( not ( = ?auto_36009 ?auto_35995 ) ) ( not ( = ?auto_36005 ?auto_35995 ) ) ( not ( = ?auto_35991 ?auto_35995 ) ) ( not ( = ?auto_36010 ?auto_35995 ) ) ( not ( = ?auto_35987 ?auto_35995 ) ) ( not ( = ?auto_35986 ?auto_35995 ) ) ( AVAILABLE ?auto_36007 ) ( SURFACE-AT ?auto_35987 ?auto_36003 ) ( ON ?auto_35987 ?auto_35985 ) ( CLEAR ?auto_35987 ) ( not ( = ?auto_35983 ?auto_35985 ) ) ( not ( = ?auto_35984 ?auto_35985 ) ) ( not ( = ?auto_35998 ?auto_35985 ) ) ( not ( = ?auto_36001 ?auto_35985 ) ) ( not ( = ?auto_35994 ?auto_35985 ) ) ( not ( = ?auto_36009 ?auto_35985 ) ) ( not ( = ?auto_36005 ?auto_35985 ) ) ( not ( = ?auto_35991 ?auto_35985 ) ) ( not ( = ?auto_36010 ?auto_35985 ) ) ( not ( = ?auto_35987 ?auto_35985 ) ) ( not ( = ?auto_35986 ?auto_35985 ) ) ( not ( = ?auto_35995 ?auto_35985 ) ) ( IS-CRATE ?auto_35995 ) ( not ( = ?auto_35983 ?auto_35999 ) ) ( not ( = ?auto_35984 ?auto_35999 ) ) ( not ( = ?auto_35998 ?auto_35999 ) ) ( not ( = ?auto_36001 ?auto_35999 ) ) ( not ( = ?auto_35994 ?auto_35999 ) ) ( not ( = ?auto_36009 ?auto_35999 ) ) ( not ( = ?auto_36005 ?auto_35999 ) ) ( not ( = ?auto_35991 ?auto_35999 ) ) ( not ( = ?auto_36010 ?auto_35999 ) ) ( not ( = ?auto_35987 ?auto_35999 ) ) ( not ( = ?auto_35986 ?auto_35999 ) ) ( not ( = ?auto_35995 ?auto_35999 ) ) ( not ( = ?auto_35985 ?auto_35999 ) ) ( not ( = ?auto_35996 ?auto_35990 ) ) ( not ( = ?auto_36003 ?auto_35996 ) ) ( not ( = ?auto_35997 ?auto_35996 ) ) ( not ( = ?auto_36004 ?auto_35996 ) ) ( not ( = ?auto_36000 ?auto_35996 ) ) ( HOIST-AT ?auto_35992 ?auto_35996 ) ( not ( = ?auto_35993 ?auto_35992 ) ) ( not ( = ?auto_36007 ?auto_35992 ) ) ( not ( = ?auto_36008 ?auto_35992 ) ) ( not ( = ?auto_35989 ?auto_35992 ) ) ( not ( = ?auto_35988 ?auto_35992 ) ) ( AVAILABLE ?auto_35992 ) ( SURFACE-AT ?auto_35995 ?auto_35996 ) ( ON ?auto_35995 ?auto_36006 ) ( CLEAR ?auto_35995 ) ( not ( = ?auto_35983 ?auto_36006 ) ) ( not ( = ?auto_35984 ?auto_36006 ) ) ( not ( = ?auto_35998 ?auto_36006 ) ) ( not ( = ?auto_36001 ?auto_36006 ) ) ( not ( = ?auto_35994 ?auto_36006 ) ) ( not ( = ?auto_36009 ?auto_36006 ) ) ( not ( = ?auto_36005 ?auto_36006 ) ) ( not ( = ?auto_35991 ?auto_36006 ) ) ( not ( = ?auto_36010 ?auto_36006 ) ) ( not ( = ?auto_35987 ?auto_36006 ) ) ( not ( = ?auto_35986 ?auto_36006 ) ) ( not ( = ?auto_35995 ?auto_36006 ) ) ( not ( = ?auto_35985 ?auto_36006 ) ) ( not ( = ?auto_35999 ?auto_36006 ) ) ( TRUCK-AT ?auto_36011 ?auto_35990 ) ( SURFACE-AT ?auto_36002 ?auto_35990 ) ( CLEAR ?auto_36002 ) ( IS-CRATE ?auto_35999 ) ( not ( = ?auto_35983 ?auto_36002 ) ) ( not ( = ?auto_35984 ?auto_36002 ) ) ( not ( = ?auto_35998 ?auto_36002 ) ) ( not ( = ?auto_36001 ?auto_36002 ) ) ( not ( = ?auto_35994 ?auto_36002 ) ) ( not ( = ?auto_36009 ?auto_36002 ) ) ( not ( = ?auto_36005 ?auto_36002 ) ) ( not ( = ?auto_35991 ?auto_36002 ) ) ( not ( = ?auto_36010 ?auto_36002 ) ) ( not ( = ?auto_35987 ?auto_36002 ) ) ( not ( = ?auto_35986 ?auto_36002 ) ) ( not ( = ?auto_35995 ?auto_36002 ) ) ( not ( = ?auto_35985 ?auto_36002 ) ) ( not ( = ?auto_35999 ?auto_36002 ) ) ( not ( = ?auto_36006 ?auto_36002 ) ) ( AVAILABLE ?auto_35993 ) ( IN ?auto_35999 ?auto_36011 ) )
    :subtasks
    ( ( !UNLOAD ?auto_35993 ?auto_35999 ?auto_36011 ?auto_35990 )
      ( MAKE-ON ?auto_35983 ?auto_35984 )
      ( MAKE-ON-VERIFY ?auto_35983 ?auto_35984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36012 - SURFACE
      ?auto_36013 - SURFACE
    )
    :vars
    (
      ?auto_36028 - HOIST
      ?auto_36026 - PLACE
      ?auto_36032 - PLACE
      ?auto_36036 - HOIST
      ?auto_36038 - SURFACE
      ?auto_36030 - SURFACE
      ?auto_36019 - PLACE
      ?auto_36029 - HOIST
      ?auto_36017 - SURFACE
      ?auto_36023 - SURFACE
      ?auto_36033 - PLACE
      ?auto_36040 - HOIST
      ?auto_36034 - SURFACE
      ?auto_36027 - SURFACE
      ?auto_36037 - PLACE
      ?auto_36025 - HOIST
      ?auto_36022 - SURFACE
      ?auto_36018 - SURFACE
      ?auto_36016 - SURFACE
      ?auto_36024 - SURFACE
      ?auto_36020 - SURFACE
      ?auto_36039 - SURFACE
      ?auto_36014 - PLACE
      ?auto_36015 - HOIST
      ?auto_36035 - SURFACE
      ?auto_36031 - SURFACE
      ?auto_36021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36028 ?auto_36026 ) ( IS-CRATE ?auto_36012 ) ( not ( = ?auto_36012 ?auto_36013 ) ) ( not ( = ?auto_36032 ?auto_36026 ) ) ( HOIST-AT ?auto_36036 ?auto_36032 ) ( not ( = ?auto_36028 ?auto_36036 ) ) ( SURFACE-AT ?auto_36012 ?auto_36032 ) ( ON ?auto_36012 ?auto_36038 ) ( CLEAR ?auto_36012 ) ( not ( = ?auto_36012 ?auto_36038 ) ) ( not ( = ?auto_36013 ?auto_36038 ) ) ( IS-CRATE ?auto_36013 ) ( not ( = ?auto_36012 ?auto_36030 ) ) ( not ( = ?auto_36013 ?auto_36030 ) ) ( not ( = ?auto_36038 ?auto_36030 ) ) ( not ( = ?auto_36019 ?auto_36026 ) ) ( not ( = ?auto_36032 ?auto_36019 ) ) ( HOIST-AT ?auto_36029 ?auto_36019 ) ( not ( = ?auto_36028 ?auto_36029 ) ) ( not ( = ?auto_36036 ?auto_36029 ) ) ( AVAILABLE ?auto_36029 ) ( SURFACE-AT ?auto_36013 ?auto_36019 ) ( ON ?auto_36013 ?auto_36017 ) ( CLEAR ?auto_36013 ) ( not ( = ?auto_36012 ?auto_36017 ) ) ( not ( = ?auto_36013 ?auto_36017 ) ) ( not ( = ?auto_36038 ?auto_36017 ) ) ( not ( = ?auto_36030 ?auto_36017 ) ) ( IS-CRATE ?auto_36030 ) ( not ( = ?auto_36012 ?auto_36023 ) ) ( not ( = ?auto_36013 ?auto_36023 ) ) ( not ( = ?auto_36038 ?auto_36023 ) ) ( not ( = ?auto_36030 ?auto_36023 ) ) ( not ( = ?auto_36017 ?auto_36023 ) ) ( not ( = ?auto_36033 ?auto_36026 ) ) ( not ( = ?auto_36032 ?auto_36033 ) ) ( not ( = ?auto_36019 ?auto_36033 ) ) ( HOIST-AT ?auto_36040 ?auto_36033 ) ( not ( = ?auto_36028 ?auto_36040 ) ) ( not ( = ?auto_36036 ?auto_36040 ) ) ( not ( = ?auto_36029 ?auto_36040 ) ) ( SURFACE-AT ?auto_36030 ?auto_36033 ) ( ON ?auto_36030 ?auto_36034 ) ( CLEAR ?auto_36030 ) ( not ( = ?auto_36012 ?auto_36034 ) ) ( not ( = ?auto_36013 ?auto_36034 ) ) ( not ( = ?auto_36038 ?auto_36034 ) ) ( not ( = ?auto_36030 ?auto_36034 ) ) ( not ( = ?auto_36017 ?auto_36034 ) ) ( not ( = ?auto_36023 ?auto_36034 ) ) ( IS-CRATE ?auto_36023 ) ( not ( = ?auto_36012 ?auto_36027 ) ) ( not ( = ?auto_36013 ?auto_36027 ) ) ( not ( = ?auto_36038 ?auto_36027 ) ) ( not ( = ?auto_36030 ?auto_36027 ) ) ( not ( = ?auto_36017 ?auto_36027 ) ) ( not ( = ?auto_36023 ?auto_36027 ) ) ( not ( = ?auto_36034 ?auto_36027 ) ) ( not ( = ?auto_36037 ?auto_36026 ) ) ( not ( = ?auto_36032 ?auto_36037 ) ) ( not ( = ?auto_36019 ?auto_36037 ) ) ( not ( = ?auto_36033 ?auto_36037 ) ) ( HOIST-AT ?auto_36025 ?auto_36037 ) ( not ( = ?auto_36028 ?auto_36025 ) ) ( not ( = ?auto_36036 ?auto_36025 ) ) ( not ( = ?auto_36029 ?auto_36025 ) ) ( not ( = ?auto_36040 ?auto_36025 ) ) ( AVAILABLE ?auto_36025 ) ( SURFACE-AT ?auto_36023 ?auto_36037 ) ( ON ?auto_36023 ?auto_36022 ) ( CLEAR ?auto_36023 ) ( not ( = ?auto_36012 ?auto_36022 ) ) ( not ( = ?auto_36013 ?auto_36022 ) ) ( not ( = ?auto_36038 ?auto_36022 ) ) ( not ( = ?auto_36030 ?auto_36022 ) ) ( not ( = ?auto_36017 ?auto_36022 ) ) ( not ( = ?auto_36023 ?auto_36022 ) ) ( not ( = ?auto_36034 ?auto_36022 ) ) ( not ( = ?auto_36027 ?auto_36022 ) ) ( IS-CRATE ?auto_36027 ) ( not ( = ?auto_36012 ?auto_36018 ) ) ( not ( = ?auto_36013 ?auto_36018 ) ) ( not ( = ?auto_36038 ?auto_36018 ) ) ( not ( = ?auto_36030 ?auto_36018 ) ) ( not ( = ?auto_36017 ?auto_36018 ) ) ( not ( = ?auto_36023 ?auto_36018 ) ) ( not ( = ?auto_36034 ?auto_36018 ) ) ( not ( = ?auto_36027 ?auto_36018 ) ) ( not ( = ?auto_36022 ?auto_36018 ) ) ( AVAILABLE ?auto_36040 ) ( SURFACE-AT ?auto_36027 ?auto_36033 ) ( ON ?auto_36027 ?auto_36016 ) ( CLEAR ?auto_36027 ) ( not ( = ?auto_36012 ?auto_36016 ) ) ( not ( = ?auto_36013 ?auto_36016 ) ) ( not ( = ?auto_36038 ?auto_36016 ) ) ( not ( = ?auto_36030 ?auto_36016 ) ) ( not ( = ?auto_36017 ?auto_36016 ) ) ( not ( = ?auto_36023 ?auto_36016 ) ) ( not ( = ?auto_36034 ?auto_36016 ) ) ( not ( = ?auto_36027 ?auto_36016 ) ) ( not ( = ?auto_36022 ?auto_36016 ) ) ( not ( = ?auto_36018 ?auto_36016 ) ) ( IS-CRATE ?auto_36018 ) ( not ( = ?auto_36012 ?auto_36024 ) ) ( not ( = ?auto_36013 ?auto_36024 ) ) ( not ( = ?auto_36038 ?auto_36024 ) ) ( not ( = ?auto_36030 ?auto_36024 ) ) ( not ( = ?auto_36017 ?auto_36024 ) ) ( not ( = ?auto_36023 ?auto_36024 ) ) ( not ( = ?auto_36034 ?auto_36024 ) ) ( not ( = ?auto_36027 ?auto_36024 ) ) ( not ( = ?auto_36022 ?auto_36024 ) ) ( not ( = ?auto_36018 ?auto_36024 ) ) ( not ( = ?auto_36016 ?auto_36024 ) ) ( AVAILABLE ?auto_36036 ) ( SURFACE-AT ?auto_36018 ?auto_36032 ) ( ON ?auto_36018 ?auto_36020 ) ( CLEAR ?auto_36018 ) ( not ( = ?auto_36012 ?auto_36020 ) ) ( not ( = ?auto_36013 ?auto_36020 ) ) ( not ( = ?auto_36038 ?auto_36020 ) ) ( not ( = ?auto_36030 ?auto_36020 ) ) ( not ( = ?auto_36017 ?auto_36020 ) ) ( not ( = ?auto_36023 ?auto_36020 ) ) ( not ( = ?auto_36034 ?auto_36020 ) ) ( not ( = ?auto_36027 ?auto_36020 ) ) ( not ( = ?auto_36022 ?auto_36020 ) ) ( not ( = ?auto_36018 ?auto_36020 ) ) ( not ( = ?auto_36016 ?auto_36020 ) ) ( not ( = ?auto_36024 ?auto_36020 ) ) ( IS-CRATE ?auto_36024 ) ( not ( = ?auto_36012 ?auto_36039 ) ) ( not ( = ?auto_36013 ?auto_36039 ) ) ( not ( = ?auto_36038 ?auto_36039 ) ) ( not ( = ?auto_36030 ?auto_36039 ) ) ( not ( = ?auto_36017 ?auto_36039 ) ) ( not ( = ?auto_36023 ?auto_36039 ) ) ( not ( = ?auto_36034 ?auto_36039 ) ) ( not ( = ?auto_36027 ?auto_36039 ) ) ( not ( = ?auto_36022 ?auto_36039 ) ) ( not ( = ?auto_36018 ?auto_36039 ) ) ( not ( = ?auto_36016 ?auto_36039 ) ) ( not ( = ?auto_36024 ?auto_36039 ) ) ( not ( = ?auto_36020 ?auto_36039 ) ) ( not ( = ?auto_36014 ?auto_36026 ) ) ( not ( = ?auto_36032 ?auto_36014 ) ) ( not ( = ?auto_36019 ?auto_36014 ) ) ( not ( = ?auto_36033 ?auto_36014 ) ) ( not ( = ?auto_36037 ?auto_36014 ) ) ( HOIST-AT ?auto_36015 ?auto_36014 ) ( not ( = ?auto_36028 ?auto_36015 ) ) ( not ( = ?auto_36036 ?auto_36015 ) ) ( not ( = ?auto_36029 ?auto_36015 ) ) ( not ( = ?auto_36040 ?auto_36015 ) ) ( not ( = ?auto_36025 ?auto_36015 ) ) ( AVAILABLE ?auto_36015 ) ( SURFACE-AT ?auto_36024 ?auto_36014 ) ( ON ?auto_36024 ?auto_36035 ) ( CLEAR ?auto_36024 ) ( not ( = ?auto_36012 ?auto_36035 ) ) ( not ( = ?auto_36013 ?auto_36035 ) ) ( not ( = ?auto_36038 ?auto_36035 ) ) ( not ( = ?auto_36030 ?auto_36035 ) ) ( not ( = ?auto_36017 ?auto_36035 ) ) ( not ( = ?auto_36023 ?auto_36035 ) ) ( not ( = ?auto_36034 ?auto_36035 ) ) ( not ( = ?auto_36027 ?auto_36035 ) ) ( not ( = ?auto_36022 ?auto_36035 ) ) ( not ( = ?auto_36018 ?auto_36035 ) ) ( not ( = ?auto_36016 ?auto_36035 ) ) ( not ( = ?auto_36024 ?auto_36035 ) ) ( not ( = ?auto_36020 ?auto_36035 ) ) ( not ( = ?auto_36039 ?auto_36035 ) ) ( SURFACE-AT ?auto_36031 ?auto_36026 ) ( CLEAR ?auto_36031 ) ( IS-CRATE ?auto_36039 ) ( not ( = ?auto_36012 ?auto_36031 ) ) ( not ( = ?auto_36013 ?auto_36031 ) ) ( not ( = ?auto_36038 ?auto_36031 ) ) ( not ( = ?auto_36030 ?auto_36031 ) ) ( not ( = ?auto_36017 ?auto_36031 ) ) ( not ( = ?auto_36023 ?auto_36031 ) ) ( not ( = ?auto_36034 ?auto_36031 ) ) ( not ( = ?auto_36027 ?auto_36031 ) ) ( not ( = ?auto_36022 ?auto_36031 ) ) ( not ( = ?auto_36018 ?auto_36031 ) ) ( not ( = ?auto_36016 ?auto_36031 ) ) ( not ( = ?auto_36024 ?auto_36031 ) ) ( not ( = ?auto_36020 ?auto_36031 ) ) ( not ( = ?auto_36039 ?auto_36031 ) ) ( not ( = ?auto_36035 ?auto_36031 ) ) ( AVAILABLE ?auto_36028 ) ( IN ?auto_36039 ?auto_36021 ) ( TRUCK-AT ?auto_36021 ?auto_36032 ) )
    :subtasks
    ( ( !DRIVE ?auto_36021 ?auto_36032 ?auto_36026 )
      ( MAKE-ON ?auto_36012 ?auto_36013 )
      ( MAKE-ON-VERIFY ?auto_36012 ?auto_36013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36041 - SURFACE
      ?auto_36042 - SURFACE
    )
    :vars
    (
      ?auto_36062 - HOIST
      ?auto_36056 - PLACE
      ?auto_36053 - PLACE
      ?auto_36045 - HOIST
      ?auto_36046 - SURFACE
      ?auto_36059 - SURFACE
      ?auto_36050 - PLACE
      ?auto_36061 - HOIST
      ?auto_36065 - SURFACE
      ?auto_36054 - SURFACE
      ?auto_36052 - PLACE
      ?auto_36047 - HOIST
      ?auto_36060 - SURFACE
      ?auto_36055 - SURFACE
      ?auto_36044 - PLACE
      ?auto_36067 - HOIST
      ?auto_36068 - SURFACE
      ?auto_36066 - SURFACE
      ?auto_36057 - SURFACE
      ?auto_36063 - SURFACE
      ?auto_36049 - SURFACE
      ?auto_36048 - SURFACE
      ?auto_36069 - PLACE
      ?auto_36064 - HOIST
      ?auto_36051 - SURFACE
      ?auto_36058 - SURFACE
      ?auto_36043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36062 ?auto_36056 ) ( IS-CRATE ?auto_36041 ) ( not ( = ?auto_36041 ?auto_36042 ) ) ( not ( = ?auto_36053 ?auto_36056 ) ) ( HOIST-AT ?auto_36045 ?auto_36053 ) ( not ( = ?auto_36062 ?auto_36045 ) ) ( SURFACE-AT ?auto_36041 ?auto_36053 ) ( ON ?auto_36041 ?auto_36046 ) ( CLEAR ?auto_36041 ) ( not ( = ?auto_36041 ?auto_36046 ) ) ( not ( = ?auto_36042 ?auto_36046 ) ) ( IS-CRATE ?auto_36042 ) ( not ( = ?auto_36041 ?auto_36059 ) ) ( not ( = ?auto_36042 ?auto_36059 ) ) ( not ( = ?auto_36046 ?auto_36059 ) ) ( not ( = ?auto_36050 ?auto_36056 ) ) ( not ( = ?auto_36053 ?auto_36050 ) ) ( HOIST-AT ?auto_36061 ?auto_36050 ) ( not ( = ?auto_36062 ?auto_36061 ) ) ( not ( = ?auto_36045 ?auto_36061 ) ) ( AVAILABLE ?auto_36061 ) ( SURFACE-AT ?auto_36042 ?auto_36050 ) ( ON ?auto_36042 ?auto_36065 ) ( CLEAR ?auto_36042 ) ( not ( = ?auto_36041 ?auto_36065 ) ) ( not ( = ?auto_36042 ?auto_36065 ) ) ( not ( = ?auto_36046 ?auto_36065 ) ) ( not ( = ?auto_36059 ?auto_36065 ) ) ( IS-CRATE ?auto_36059 ) ( not ( = ?auto_36041 ?auto_36054 ) ) ( not ( = ?auto_36042 ?auto_36054 ) ) ( not ( = ?auto_36046 ?auto_36054 ) ) ( not ( = ?auto_36059 ?auto_36054 ) ) ( not ( = ?auto_36065 ?auto_36054 ) ) ( not ( = ?auto_36052 ?auto_36056 ) ) ( not ( = ?auto_36053 ?auto_36052 ) ) ( not ( = ?auto_36050 ?auto_36052 ) ) ( HOIST-AT ?auto_36047 ?auto_36052 ) ( not ( = ?auto_36062 ?auto_36047 ) ) ( not ( = ?auto_36045 ?auto_36047 ) ) ( not ( = ?auto_36061 ?auto_36047 ) ) ( SURFACE-AT ?auto_36059 ?auto_36052 ) ( ON ?auto_36059 ?auto_36060 ) ( CLEAR ?auto_36059 ) ( not ( = ?auto_36041 ?auto_36060 ) ) ( not ( = ?auto_36042 ?auto_36060 ) ) ( not ( = ?auto_36046 ?auto_36060 ) ) ( not ( = ?auto_36059 ?auto_36060 ) ) ( not ( = ?auto_36065 ?auto_36060 ) ) ( not ( = ?auto_36054 ?auto_36060 ) ) ( IS-CRATE ?auto_36054 ) ( not ( = ?auto_36041 ?auto_36055 ) ) ( not ( = ?auto_36042 ?auto_36055 ) ) ( not ( = ?auto_36046 ?auto_36055 ) ) ( not ( = ?auto_36059 ?auto_36055 ) ) ( not ( = ?auto_36065 ?auto_36055 ) ) ( not ( = ?auto_36054 ?auto_36055 ) ) ( not ( = ?auto_36060 ?auto_36055 ) ) ( not ( = ?auto_36044 ?auto_36056 ) ) ( not ( = ?auto_36053 ?auto_36044 ) ) ( not ( = ?auto_36050 ?auto_36044 ) ) ( not ( = ?auto_36052 ?auto_36044 ) ) ( HOIST-AT ?auto_36067 ?auto_36044 ) ( not ( = ?auto_36062 ?auto_36067 ) ) ( not ( = ?auto_36045 ?auto_36067 ) ) ( not ( = ?auto_36061 ?auto_36067 ) ) ( not ( = ?auto_36047 ?auto_36067 ) ) ( AVAILABLE ?auto_36067 ) ( SURFACE-AT ?auto_36054 ?auto_36044 ) ( ON ?auto_36054 ?auto_36068 ) ( CLEAR ?auto_36054 ) ( not ( = ?auto_36041 ?auto_36068 ) ) ( not ( = ?auto_36042 ?auto_36068 ) ) ( not ( = ?auto_36046 ?auto_36068 ) ) ( not ( = ?auto_36059 ?auto_36068 ) ) ( not ( = ?auto_36065 ?auto_36068 ) ) ( not ( = ?auto_36054 ?auto_36068 ) ) ( not ( = ?auto_36060 ?auto_36068 ) ) ( not ( = ?auto_36055 ?auto_36068 ) ) ( IS-CRATE ?auto_36055 ) ( not ( = ?auto_36041 ?auto_36066 ) ) ( not ( = ?auto_36042 ?auto_36066 ) ) ( not ( = ?auto_36046 ?auto_36066 ) ) ( not ( = ?auto_36059 ?auto_36066 ) ) ( not ( = ?auto_36065 ?auto_36066 ) ) ( not ( = ?auto_36054 ?auto_36066 ) ) ( not ( = ?auto_36060 ?auto_36066 ) ) ( not ( = ?auto_36055 ?auto_36066 ) ) ( not ( = ?auto_36068 ?auto_36066 ) ) ( AVAILABLE ?auto_36047 ) ( SURFACE-AT ?auto_36055 ?auto_36052 ) ( ON ?auto_36055 ?auto_36057 ) ( CLEAR ?auto_36055 ) ( not ( = ?auto_36041 ?auto_36057 ) ) ( not ( = ?auto_36042 ?auto_36057 ) ) ( not ( = ?auto_36046 ?auto_36057 ) ) ( not ( = ?auto_36059 ?auto_36057 ) ) ( not ( = ?auto_36065 ?auto_36057 ) ) ( not ( = ?auto_36054 ?auto_36057 ) ) ( not ( = ?auto_36060 ?auto_36057 ) ) ( not ( = ?auto_36055 ?auto_36057 ) ) ( not ( = ?auto_36068 ?auto_36057 ) ) ( not ( = ?auto_36066 ?auto_36057 ) ) ( IS-CRATE ?auto_36066 ) ( not ( = ?auto_36041 ?auto_36063 ) ) ( not ( = ?auto_36042 ?auto_36063 ) ) ( not ( = ?auto_36046 ?auto_36063 ) ) ( not ( = ?auto_36059 ?auto_36063 ) ) ( not ( = ?auto_36065 ?auto_36063 ) ) ( not ( = ?auto_36054 ?auto_36063 ) ) ( not ( = ?auto_36060 ?auto_36063 ) ) ( not ( = ?auto_36055 ?auto_36063 ) ) ( not ( = ?auto_36068 ?auto_36063 ) ) ( not ( = ?auto_36066 ?auto_36063 ) ) ( not ( = ?auto_36057 ?auto_36063 ) ) ( SURFACE-AT ?auto_36066 ?auto_36053 ) ( ON ?auto_36066 ?auto_36049 ) ( CLEAR ?auto_36066 ) ( not ( = ?auto_36041 ?auto_36049 ) ) ( not ( = ?auto_36042 ?auto_36049 ) ) ( not ( = ?auto_36046 ?auto_36049 ) ) ( not ( = ?auto_36059 ?auto_36049 ) ) ( not ( = ?auto_36065 ?auto_36049 ) ) ( not ( = ?auto_36054 ?auto_36049 ) ) ( not ( = ?auto_36060 ?auto_36049 ) ) ( not ( = ?auto_36055 ?auto_36049 ) ) ( not ( = ?auto_36068 ?auto_36049 ) ) ( not ( = ?auto_36066 ?auto_36049 ) ) ( not ( = ?auto_36057 ?auto_36049 ) ) ( not ( = ?auto_36063 ?auto_36049 ) ) ( IS-CRATE ?auto_36063 ) ( not ( = ?auto_36041 ?auto_36048 ) ) ( not ( = ?auto_36042 ?auto_36048 ) ) ( not ( = ?auto_36046 ?auto_36048 ) ) ( not ( = ?auto_36059 ?auto_36048 ) ) ( not ( = ?auto_36065 ?auto_36048 ) ) ( not ( = ?auto_36054 ?auto_36048 ) ) ( not ( = ?auto_36060 ?auto_36048 ) ) ( not ( = ?auto_36055 ?auto_36048 ) ) ( not ( = ?auto_36068 ?auto_36048 ) ) ( not ( = ?auto_36066 ?auto_36048 ) ) ( not ( = ?auto_36057 ?auto_36048 ) ) ( not ( = ?auto_36063 ?auto_36048 ) ) ( not ( = ?auto_36049 ?auto_36048 ) ) ( not ( = ?auto_36069 ?auto_36056 ) ) ( not ( = ?auto_36053 ?auto_36069 ) ) ( not ( = ?auto_36050 ?auto_36069 ) ) ( not ( = ?auto_36052 ?auto_36069 ) ) ( not ( = ?auto_36044 ?auto_36069 ) ) ( HOIST-AT ?auto_36064 ?auto_36069 ) ( not ( = ?auto_36062 ?auto_36064 ) ) ( not ( = ?auto_36045 ?auto_36064 ) ) ( not ( = ?auto_36061 ?auto_36064 ) ) ( not ( = ?auto_36047 ?auto_36064 ) ) ( not ( = ?auto_36067 ?auto_36064 ) ) ( AVAILABLE ?auto_36064 ) ( SURFACE-AT ?auto_36063 ?auto_36069 ) ( ON ?auto_36063 ?auto_36051 ) ( CLEAR ?auto_36063 ) ( not ( = ?auto_36041 ?auto_36051 ) ) ( not ( = ?auto_36042 ?auto_36051 ) ) ( not ( = ?auto_36046 ?auto_36051 ) ) ( not ( = ?auto_36059 ?auto_36051 ) ) ( not ( = ?auto_36065 ?auto_36051 ) ) ( not ( = ?auto_36054 ?auto_36051 ) ) ( not ( = ?auto_36060 ?auto_36051 ) ) ( not ( = ?auto_36055 ?auto_36051 ) ) ( not ( = ?auto_36068 ?auto_36051 ) ) ( not ( = ?auto_36066 ?auto_36051 ) ) ( not ( = ?auto_36057 ?auto_36051 ) ) ( not ( = ?auto_36063 ?auto_36051 ) ) ( not ( = ?auto_36049 ?auto_36051 ) ) ( not ( = ?auto_36048 ?auto_36051 ) ) ( SURFACE-AT ?auto_36058 ?auto_36056 ) ( CLEAR ?auto_36058 ) ( IS-CRATE ?auto_36048 ) ( not ( = ?auto_36041 ?auto_36058 ) ) ( not ( = ?auto_36042 ?auto_36058 ) ) ( not ( = ?auto_36046 ?auto_36058 ) ) ( not ( = ?auto_36059 ?auto_36058 ) ) ( not ( = ?auto_36065 ?auto_36058 ) ) ( not ( = ?auto_36054 ?auto_36058 ) ) ( not ( = ?auto_36060 ?auto_36058 ) ) ( not ( = ?auto_36055 ?auto_36058 ) ) ( not ( = ?auto_36068 ?auto_36058 ) ) ( not ( = ?auto_36066 ?auto_36058 ) ) ( not ( = ?auto_36057 ?auto_36058 ) ) ( not ( = ?auto_36063 ?auto_36058 ) ) ( not ( = ?auto_36049 ?auto_36058 ) ) ( not ( = ?auto_36048 ?auto_36058 ) ) ( not ( = ?auto_36051 ?auto_36058 ) ) ( AVAILABLE ?auto_36062 ) ( TRUCK-AT ?auto_36043 ?auto_36053 ) ( LIFTING ?auto_36045 ?auto_36048 ) )
    :subtasks
    ( ( !LOAD ?auto_36045 ?auto_36048 ?auto_36043 ?auto_36053 )
      ( MAKE-ON ?auto_36041 ?auto_36042 )
      ( MAKE-ON-VERIFY ?auto_36041 ?auto_36042 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36070 - SURFACE
      ?auto_36071 - SURFACE
    )
    :vars
    (
      ?auto_36084 - HOIST
      ?auto_36094 - PLACE
      ?auto_36091 - PLACE
      ?auto_36098 - HOIST
      ?auto_36097 - SURFACE
      ?auto_36081 - SURFACE
      ?auto_36095 - PLACE
      ?auto_36083 - HOIST
      ?auto_36087 - SURFACE
      ?auto_36092 - SURFACE
      ?auto_36090 - PLACE
      ?auto_36096 - HOIST
      ?auto_36082 - SURFACE
      ?auto_36093 - SURFACE
      ?auto_36074 - PLACE
      ?auto_36079 - HOIST
      ?auto_36075 - SURFACE
      ?auto_36080 - SURFACE
      ?auto_36078 - SURFACE
      ?auto_36085 - SURFACE
      ?auto_36072 - SURFACE
      ?auto_36073 - SURFACE
      ?auto_36076 - PLACE
      ?auto_36086 - HOIST
      ?auto_36089 - SURFACE
      ?auto_36088 - SURFACE
      ?auto_36077 - TRUCK
      ?auto_36099 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36084 ?auto_36094 ) ( IS-CRATE ?auto_36070 ) ( not ( = ?auto_36070 ?auto_36071 ) ) ( not ( = ?auto_36091 ?auto_36094 ) ) ( HOIST-AT ?auto_36098 ?auto_36091 ) ( not ( = ?auto_36084 ?auto_36098 ) ) ( SURFACE-AT ?auto_36070 ?auto_36091 ) ( ON ?auto_36070 ?auto_36097 ) ( CLEAR ?auto_36070 ) ( not ( = ?auto_36070 ?auto_36097 ) ) ( not ( = ?auto_36071 ?auto_36097 ) ) ( IS-CRATE ?auto_36071 ) ( not ( = ?auto_36070 ?auto_36081 ) ) ( not ( = ?auto_36071 ?auto_36081 ) ) ( not ( = ?auto_36097 ?auto_36081 ) ) ( not ( = ?auto_36095 ?auto_36094 ) ) ( not ( = ?auto_36091 ?auto_36095 ) ) ( HOIST-AT ?auto_36083 ?auto_36095 ) ( not ( = ?auto_36084 ?auto_36083 ) ) ( not ( = ?auto_36098 ?auto_36083 ) ) ( AVAILABLE ?auto_36083 ) ( SURFACE-AT ?auto_36071 ?auto_36095 ) ( ON ?auto_36071 ?auto_36087 ) ( CLEAR ?auto_36071 ) ( not ( = ?auto_36070 ?auto_36087 ) ) ( not ( = ?auto_36071 ?auto_36087 ) ) ( not ( = ?auto_36097 ?auto_36087 ) ) ( not ( = ?auto_36081 ?auto_36087 ) ) ( IS-CRATE ?auto_36081 ) ( not ( = ?auto_36070 ?auto_36092 ) ) ( not ( = ?auto_36071 ?auto_36092 ) ) ( not ( = ?auto_36097 ?auto_36092 ) ) ( not ( = ?auto_36081 ?auto_36092 ) ) ( not ( = ?auto_36087 ?auto_36092 ) ) ( not ( = ?auto_36090 ?auto_36094 ) ) ( not ( = ?auto_36091 ?auto_36090 ) ) ( not ( = ?auto_36095 ?auto_36090 ) ) ( HOIST-AT ?auto_36096 ?auto_36090 ) ( not ( = ?auto_36084 ?auto_36096 ) ) ( not ( = ?auto_36098 ?auto_36096 ) ) ( not ( = ?auto_36083 ?auto_36096 ) ) ( SURFACE-AT ?auto_36081 ?auto_36090 ) ( ON ?auto_36081 ?auto_36082 ) ( CLEAR ?auto_36081 ) ( not ( = ?auto_36070 ?auto_36082 ) ) ( not ( = ?auto_36071 ?auto_36082 ) ) ( not ( = ?auto_36097 ?auto_36082 ) ) ( not ( = ?auto_36081 ?auto_36082 ) ) ( not ( = ?auto_36087 ?auto_36082 ) ) ( not ( = ?auto_36092 ?auto_36082 ) ) ( IS-CRATE ?auto_36092 ) ( not ( = ?auto_36070 ?auto_36093 ) ) ( not ( = ?auto_36071 ?auto_36093 ) ) ( not ( = ?auto_36097 ?auto_36093 ) ) ( not ( = ?auto_36081 ?auto_36093 ) ) ( not ( = ?auto_36087 ?auto_36093 ) ) ( not ( = ?auto_36092 ?auto_36093 ) ) ( not ( = ?auto_36082 ?auto_36093 ) ) ( not ( = ?auto_36074 ?auto_36094 ) ) ( not ( = ?auto_36091 ?auto_36074 ) ) ( not ( = ?auto_36095 ?auto_36074 ) ) ( not ( = ?auto_36090 ?auto_36074 ) ) ( HOIST-AT ?auto_36079 ?auto_36074 ) ( not ( = ?auto_36084 ?auto_36079 ) ) ( not ( = ?auto_36098 ?auto_36079 ) ) ( not ( = ?auto_36083 ?auto_36079 ) ) ( not ( = ?auto_36096 ?auto_36079 ) ) ( AVAILABLE ?auto_36079 ) ( SURFACE-AT ?auto_36092 ?auto_36074 ) ( ON ?auto_36092 ?auto_36075 ) ( CLEAR ?auto_36092 ) ( not ( = ?auto_36070 ?auto_36075 ) ) ( not ( = ?auto_36071 ?auto_36075 ) ) ( not ( = ?auto_36097 ?auto_36075 ) ) ( not ( = ?auto_36081 ?auto_36075 ) ) ( not ( = ?auto_36087 ?auto_36075 ) ) ( not ( = ?auto_36092 ?auto_36075 ) ) ( not ( = ?auto_36082 ?auto_36075 ) ) ( not ( = ?auto_36093 ?auto_36075 ) ) ( IS-CRATE ?auto_36093 ) ( not ( = ?auto_36070 ?auto_36080 ) ) ( not ( = ?auto_36071 ?auto_36080 ) ) ( not ( = ?auto_36097 ?auto_36080 ) ) ( not ( = ?auto_36081 ?auto_36080 ) ) ( not ( = ?auto_36087 ?auto_36080 ) ) ( not ( = ?auto_36092 ?auto_36080 ) ) ( not ( = ?auto_36082 ?auto_36080 ) ) ( not ( = ?auto_36093 ?auto_36080 ) ) ( not ( = ?auto_36075 ?auto_36080 ) ) ( AVAILABLE ?auto_36096 ) ( SURFACE-AT ?auto_36093 ?auto_36090 ) ( ON ?auto_36093 ?auto_36078 ) ( CLEAR ?auto_36093 ) ( not ( = ?auto_36070 ?auto_36078 ) ) ( not ( = ?auto_36071 ?auto_36078 ) ) ( not ( = ?auto_36097 ?auto_36078 ) ) ( not ( = ?auto_36081 ?auto_36078 ) ) ( not ( = ?auto_36087 ?auto_36078 ) ) ( not ( = ?auto_36092 ?auto_36078 ) ) ( not ( = ?auto_36082 ?auto_36078 ) ) ( not ( = ?auto_36093 ?auto_36078 ) ) ( not ( = ?auto_36075 ?auto_36078 ) ) ( not ( = ?auto_36080 ?auto_36078 ) ) ( IS-CRATE ?auto_36080 ) ( not ( = ?auto_36070 ?auto_36085 ) ) ( not ( = ?auto_36071 ?auto_36085 ) ) ( not ( = ?auto_36097 ?auto_36085 ) ) ( not ( = ?auto_36081 ?auto_36085 ) ) ( not ( = ?auto_36087 ?auto_36085 ) ) ( not ( = ?auto_36092 ?auto_36085 ) ) ( not ( = ?auto_36082 ?auto_36085 ) ) ( not ( = ?auto_36093 ?auto_36085 ) ) ( not ( = ?auto_36075 ?auto_36085 ) ) ( not ( = ?auto_36080 ?auto_36085 ) ) ( not ( = ?auto_36078 ?auto_36085 ) ) ( SURFACE-AT ?auto_36080 ?auto_36091 ) ( ON ?auto_36080 ?auto_36072 ) ( CLEAR ?auto_36080 ) ( not ( = ?auto_36070 ?auto_36072 ) ) ( not ( = ?auto_36071 ?auto_36072 ) ) ( not ( = ?auto_36097 ?auto_36072 ) ) ( not ( = ?auto_36081 ?auto_36072 ) ) ( not ( = ?auto_36087 ?auto_36072 ) ) ( not ( = ?auto_36092 ?auto_36072 ) ) ( not ( = ?auto_36082 ?auto_36072 ) ) ( not ( = ?auto_36093 ?auto_36072 ) ) ( not ( = ?auto_36075 ?auto_36072 ) ) ( not ( = ?auto_36080 ?auto_36072 ) ) ( not ( = ?auto_36078 ?auto_36072 ) ) ( not ( = ?auto_36085 ?auto_36072 ) ) ( IS-CRATE ?auto_36085 ) ( not ( = ?auto_36070 ?auto_36073 ) ) ( not ( = ?auto_36071 ?auto_36073 ) ) ( not ( = ?auto_36097 ?auto_36073 ) ) ( not ( = ?auto_36081 ?auto_36073 ) ) ( not ( = ?auto_36087 ?auto_36073 ) ) ( not ( = ?auto_36092 ?auto_36073 ) ) ( not ( = ?auto_36082 ?auto_36073 ) ) ( not ( = ?auto_36093 ?auto_36073 ) ) ( not ( = ?auto_36075 ?auto_36073 ) ) ( not ( = ?auto_36080 ?auto_36073 ) ) ( not ( = ?auto_36078 ?auto_36073 ) ) ( not ( = ?auto_36085 ?auto_36073 ) ) ( not ( = ?auto_36072 ?auto_36073 ) ) ( not ( = ?auto_36076 ?auto_36094 ) ) ( not ( = ?auto_36091 ?auto_36076 ) ) ( not ( = ?auto_36095 ?auto_36076 ) ) ( not ( = ?auto_36090 ?auto_36076 ) ) ( not ( = ?auto_36074 ?auto_36076 ) ) ( HOIST-AT ?auto_36086 ?auto_36076 ) ( not ( = ?auto_36084 ?auto_36086 ) ) ( not ( = ?auto_36098 ?auto_36086 ) ) ( not ( = ?auto_36083 ?auto_36086 ) ) ( not ( = ?auto_36096 ?auto_36086 ) ) ( not ( = ?auto_36079 ?auto_36086 ) ) ( AVAILABLE ?auto_36086 ) ( SURFACE-AT ?auto_36085 ?auto_36076 ) ( ON ?auto_36085 ?auto_36089 ) ( CLEAR ?auto_36085 ) ( not ( = ?auto_36070 ?auto_36089 ) ) ( not ( = ?auto_36071 ?auto_36089 ) ) ( not ( = ?auto_36097 ?auto_36089 ) ) ( not ( = ?auto_36081 ?auto_36089 ) ) ( not ( = ?auto_36087 ?auto_36089 ) ) ( not ( = ?auto_36092 ?auto_36089 ) ) ( not ( = ?auto_36082 ?auto_36089 ) ) ( not ( = ?auto_36093 ?auto_36089 ) ) ( not ( = ?auto_36075 ?auto_36089 ) ) ( not ( = ?auto_36080 ?auto_36089 ) ) ( not ( = ?auto_36078 ?auto_36089 ) ) ( not ( = ?auto_36085 ?auto_36089 ) ) ( not ( = ?auto_36072 ?auto_36089 ) ) ( not ( = ?auto_36073 ?auto_36089 ) ) ( SURFACE-AT ?auto_36088 ?auto_36094 ) ( CLEAR ?auto_36088 ) ( IS-CRATE ?auto_36073 ) ( not ( = ?auto_36070 ?auto_36088 ) ) ( not ( = ?auto_36071 ?auto_36088 ) ) ( not ( = ?auto_36097 ?auto_36088 ) ) ( not ( = ?auto_36081 ?auto_36088 ) ) ( not ( = ?auto_36087 ?auto_36088 ) ) ( not ( = ?auto_36092 ?auto_36088 ) ) ( not ( = ?auto_36082 ?auto_36088 ) ) ( not ( = ?auto_36093 ?auto_36088 ) ) ( not ( = ?auto_36075 ?auto_36088 ) ) ( not ( = ?auto_36080 ?auto_36088 ) ) ( not ( = ?auto_36078 ?auto_36088 ) ) ( not ( = ?auto_36085 ?auto_36088 ) ) ( not ( = ?auto_36072 ?auto_36088 ) ) ( not ( = ?auto_36073 ?auto_36088 ) ) ( not ( = ?auto_36089 ?auto_36088 ) ) ( AVAILABLE ?auto_36084 ) ( TRUCK-AT ?auto_36077 ?auto_36091 ) ( AVAILABLE ?auto_36098 ) ( SURFACE-AT ?auto_36073 ?auto_36091 ) ( ON ?auto_36073 ?auto_36099 ) ( CLEAR ?auto_36073 ) ( not ( = ?auto_36070 ?auto_36099 ) ) ( not ( = ?auto_36071 ?auto_36099 ) ) ( not ( = ?auto_36097 ?auto_36099 ) ) ( not ( = ?auto_36081 ?auto_36099 ) ) ( not ( = ?auto_36087 ?auto_36099 ) ) ( not ( = ?auto_36092 ?auto_36099 ) ) ( not ( = ?auto_36082 ?auto_36099 ) ) ( not ( = ?auto_36093 ?auto_36099 ) ) ( not ( = ?auto_36075 ?auto_36099 ) ) ( not ( = ?auto_36080 ?auto_36099 ) ) ( not ( = ?auto_36078 ?auto_36099 ) ) ( not ( = ?auto_36085 ?auto_36099 ) ) ( not ( = ?auto_36072 ?auto_36099 ) ) ( not ( = ?auto_36073 ?auto_36099 ) ) ( not ( = ?auto_36089 ?auto_36099 ) ) ( not ( = ?auto_36088 ?auto_36099 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36098 ?auto_36073 ?auto_36099 ?auto_36091 )
      ( MAKE-ON ?auto_36070 ?auto_36071 )
      ( MAKE-ON-VERIFY ?auto_36070 ?auto_36071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36100 - SURFACE
      ?auto_36101 - SURFACE
    )
    :vars
    (
      ?auto_36129 - HOIST
      ?auto_36119 - PLACE
      ?auto_36116 - PLACE
      ?auto_36123 - HOIST
      ?auto_36122 - SURFACE
      ?auto_36106 - SURFACE
      ?auto_36124 - PLACE
      ?auto_36112 - HOIST
      ?auto_36120 - SURFACE
      ?auto_36117 - SURFACE
      ?auto_36115 - PLACE
      ?auto_36113 - HOIST
      ?auto_36109 - SURFACE
      ?auto_36118 - SURFACE
      ?auto_36103 - PLACE
      ?auto_36110 - HOIST
      ?auto_36102 - SURFACE
      ?auto_36105 - SURFACE
      ?auto_36127 - SURFACE
      ?auto_36111 - SURFACE
      ?auto_36121 - SURFACE
      ?auto_36104 - SURFACE
      ?auto_36108 - PLACE
      ?auto_36126 - HOIST
      ?auto_36114 - SURFACE
      ?auto_36125 - SURFACE
      ?auto_36128 - SURFACE
      ?auto_36107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36129 ?auto_36119 ) ( IS-CRATE ?auto_36100 ) ( not ( = ?auto_36100 ?auto_36101 ) ) ( not ( = ?auto_36116 ?auto_36119 ) ) ( HOIST-AT ?auto_36123 ?auto_36116 ) ( not ( = ?auto_36129 ?auto_36123 ) ) ( SURFACE-AT ?auto_36100 ?auto_36116 ) ( ON ?auto_36100 ?auto_36122 ) ( CLEAR ?auto_36100 ) ( not ( = ?auto_36100 ?auto_36122 ) ) ( not ( = ?auto_36101 ?auto_36122 ) ) ( IS-CRATE ?auto_36101 ) ( not ( = ?auto_36100 ?auto_36106 ) ) ( not ( = ?auto_36101 ?auto_36106 ) ) ( not ( = ?auto_36122 ?auto_36106 ) ) ( not ( = ?auto_36124 ?auto_36119 ) ) ( not ( = ?auto_36116 ?auto_36124 ) ) ( HOIST-AT ?auto_36112 ?auto_36124 ) ( not ( = ?auto_36129 ?auto_36112 ) ) ( not ( = ?auto_36123 ?auto_36112 ) ) ( AVAILABLE ?auto_36112 ) ( SURFACE-AT ?auto_36101 ?auto_36124 ) ( ON ?auto_36101 ?auto_36120 ) ( CLEAR ?auto_36101 ) ( not ( = ?auto_36100 ?auto_36120 ) ) ( not ( = ?auto_36101 ?auto_36120 ) ) ( not ( = ?auto_36122 ?auto_36120 ) ) ( not ( = ?auto_36106 ?auto_36120 ) ) ( IS-CRATE ?auto_36106 ) ( not ( = ?auto_36100 ?auto_36117 ) ) ( not ( = ?auto_36101 ?auto_36117 ) ) ( not ( = ?auto_36122 ?auto_36117 ) ) ( not ( = ?auto_36106 ?auto_36117 ) ) ( not ( = ?auto_36120 ?auto_36117 ) ) ( not ( = ?auto_36115 ?auto_36119 ) ) ( not ( = ?auto_36116 ?auto_36115 ) ) ( not ( = ?auto_36124 ?auto_36115 ) ) ( HOIST-AT ?auto_36113 ?auto_36115 ) ( not ( = ?auto_36129 ?auto_36113 ) ) ( not ( = ?auto_36123 ?auto_36113 ) ) ( not ( = ?auto_36112 ?auto_36113 ) ) ( SURFACE-AT ?auto_36106 ?auto_36115 ) ( ON ?auto_36106 ?auto_36109 ) ( CLEAR ?auto_36106 ) ( not ( = ?auto_36100 ?auto_36109 ) ) ( not ( = ?auto_36101 ?auto_36109 ) ) ( not ( = ?auto_36122 ?auto_36109 ) ) ( not ( = ?auto_36106 ?auto_36109 ) ) ( not ( = ?auto_36120 ?auto_36109 ) ) ( not ( = ?auto_36117 ?auto_36109 ) ) ( IS-CRATE ?auto_36117 ) ( not ( = ?auto_36100 ?auto_36118 ) ) ( not ( = ?auto_36101 ?auto_36118 ) ) ( not ( = ?auto_36122 ?auto_36118 ) ) ( not ( = ?auto_36106 ?auto_36118 ) ) ( not ( = ?auto_36120 ?auto_36118 ) ) ( not ( = ?auto_36117 ?auto_36118 ) ) ( not ( = ?auto_36109 ?auto_36118 ) ) ( not ( = ?auto_36103 ?auto_36119 ) ) ( not ( = ?auto_36116 ?auto_36103 ) ) ( not ( = ?auto_36124 ?auto_36103 ) ) ( not ( = ?auto_36115 ?auto_36103 ) ) ( HOIST-AT ?auto_36110 ?auto_36103 ) ( not ( = ?auto_36129 ?auto_36110 ) ) ( not ( = ?auto_36123 ?auto_36110 ) ) ( not ( = ?auto_36112 ?auto_36110 ) ) ( not ( = ?auto_36113 ?auto_36110 ) ) ( AVAILABLE ?auto_36110 ) ( SURFACE-AT ?auto_36117 ?auto_36103 ) ( ON ?auto_36117 ?auto_36102 ) ( CLEAR ?auto_36117 ) ( not ( = ?auto_36100 ?auto_36102 ) ) ( not ( = ?auto_36101 ?auto_36102 ) ) ( not ( = ?auto_36122 ?auto_36102 ) ) ( not ( = ?auto_36106 ?auto_36102 ) ) ( not ( = ?auto_36120 ?auto_36102 ) ) ( not ( = ?auto_36117 ?auto_36102 ) ) ( not ( = ?auto_36109 ?auto_36102 ) ) ( not ( = ?auto_36118 ?auto_36102 ) ) ( IS-CRATE ?auto_36118 ) ( not ( = ?auto_36100 ?auto_36105 ) ) ( not ( = ?auto_36101 ?auto_36105 ) ) ( not ( = ?auto_36122 ?auto_36105 ) ) ( not ( = ?auto_36106 ?auto_36105 ) ) ( not ( = ?auto_36120 ?auto_36105 ) ) ( not ( = ?auto_36117 ?auto_36105 ) ) ( not ( = ?auto_36109 ?auto_36105 ) ) ( not ( = ?auto_36118 ?auto_36105 ) ) ( not ( = ?auto_36102 ?auto_36105 ) ) ( AVAILABLE ?auto_36113 ) ( SURFACE-AT ?auto_36118 ?auto_36115 ) ( ON ?auto_36118 ?auto_36127 ) ( CLEAR ?auto_36118 ) ( not ( = ?auto_36100 ?auto_36127 ) ) ( not ( = ?auto_36101 ?auto_36127 ) ) ( not ( = ?auto_36122 ?auto_36127 ) ) ( not ( = ?auto_36106 ?auto_36127 ) ) ( not ( = ?auto_36120 ?auto_36127 ) ) ( not ( = ?auto_36117 ?auto_36127 ) ) ( not ( = ?auto_36109 ?auto_36127 ) ) ( not ( = ?auto_36118 ?auto_36127 ) ) ( not ( = ?auto_36102 ?auto_36127 ) ) ( not ( = ?auto_36105 ?auto_36127 ) ) ( IS-CRATE ?auto_36105 ) ( not ( = ?auto_36100 ?auto_36111 ) ) ( not ( = ?auto_36101 ?auto_36111 ) ) ( not ( = ?auto_36122 ?auto_36111 ) ) ( not ( = ?auto_36106 ?auto_36111 ) ) ( not ( = ?auto_36120 ?auto_36111 ) ) ( not ( = ?auto_36117 ?auto_36111 ) ) ( not ( = ?auto_36109 ?auto_36111 ) ) ( not ( = ?auto_36118 ?auto_36111 ) ) ( not ( = ?auto_36102 ?auto_36111 ) ) ( not ( = ?auto_36105 ?auto_36111 ) ) ( not ( = ?auto_36127 ?auto_36111 ) ) ( SURFACE-AT ?auto_36105 ?auto_36116 ) ( ON ?auto_36105 ?auto_36121 ) ( CLEAR ?auto_36105 ) ( not ( = ?auto_36100 ?auto_36121 ) ) ( not ( = ?auto_36101 ?auto_36121 ) ) ( not ( = ?auto_36122 ?auto_36121 ) ) ( not ( = ?auto_36106 ?auto_36121 ) ) ( not ( = ?auto_36120 ?auto_36121 ) ) ( not ( = ?auto_36117 ?auto_36121 ) ) ( not ( = ?auto_36109 ?auto_36121 ) ) ( not ( = ?auto_36118 ?auto_36121 ) ) ( not ( = ?auto_36102 ?auto_36121 ) ) ( not ( = ?auto_36105 ?auto_36121 ) ) ( not ( = ?auto_36127 ?auto_36121 ) ) ( not ( = ?auto_36111 ?auto_36121 ) ) ( IS-CRATE ?auto_36111 ) ( not ( = ?auto_36100 ?auto_36104 ) ) ( not ( = ?auto_36101 ?auto_36104 ) ) ( not ( = ?auto_36122 ?auto_36104 ) ) ( not ( = ?auto_36106 ?auto_36104 ) ) ( not ( = ?auto_36120 ?auto_36104 ) ) ( not ( = ?auto_36117 ?auto_36104 ) ) ( not ( = ?auto_36109 ?auto_36104 ) ) ( not ( = ?auto_36118 ?auto_36104 ) ) ( not ( = ?auto_36102 ?auto_36104 ) ) ( not ( = ?auto_36105 ?auto_36104 ) ) ( not ( = ?auto_36127 ?auto_36104 ) ) ( not ( = ?auto_36111 ?auto_36104 ) ) ( not ( = ?auto_36121 ?auto_36104 ) ) ( not ( = ?auto_36108 ?auto_36119 ) ) ( not ( = ?auto_36116 ?auto_36108 ) ) ( not ( = ?auto_36124 ?auto_36108 ) ) ( not ( = ?auto_36115 ?auto_36108 ) ) ( not ( = ?auto_36103 ?auto_36108 ) ) ( HOIST-AT ?auto_36126 ?auto_36108 ) ( not ( = ?auto_36129 ?auto_36126 ) ) ( not ( = ?auto_36123 ?auto_36126 ) ) ( not ( = ?auto_36112 ?auto_36126 ) ) ( not ( = ?auto_36113 ?auto_36126 ) ) ( not ( = ?auto_36110 ?auto_36126 ) ) ( AVAILABLE ?auto_36126 ) ( SURFACE-AT ?auto_36111 ?auto_36108 ) ( ON ?auto_36111 ?auto_36114 ) ( CLEAR ?auto_36111 ) ( not ( = ?auto_36100 ?auto_36114 ) ) ( not ( = ?auto_36101 ?auto_36114 ) ) ( not ( = ?auto_36122 ?auto_36114 ) ) ( not ( = ?auto_36106 ?auto_36114 ) ) ( not ( = ?auto_36120 ?auto_36114 ) ) ( not ( = ?auto_36117 ?auto_36114 ) ) ( not ( = ?auto_36109 ?auto_36114 ) ) ( not ( = ?auto_36118 ?auto_36114 ) ) ( not ( = ?auto_36102 ?auto_36114 ) ) ( not ( = ?auto_36105 ?auto_36114 ) ) ( not ( = ?auto_36127 ?auto_36114 ) ) ( not ( = ?auto_36111 ?auto_36114 ) ) ( not ( = ?auto_36121 ?auto_36114 ) ) ( not ( = ?auto_36104 ?auto_36114 ) ) ( SURFACE-AT ?auto_36125 ?auto_36119 ) ( CLEAR ?auto_36125 ) ( IS-CRATE ?auto_36104 ) ( not ( = ?auto_36100 ?auto_36125 ) ) ( not ( = ?auto_36101 ?auto_36125 ) ) ( not ( = ?auto_36122 ?auto_36125 ) ) ( not ( = ?auto_36106 ?auto_36125 ) ) ( not ( = ?auto_36120 ?auto_36125 ) ) ( not ( = ?auto_36117 ?auto_36125 ) ) ( not ( = ?auto_36109 ?auto_36125 ) ) ( not ( = ?auto_36118 ?auto_36125 ) ) ( not ( = ?auto_36102 ?auto_36125 ) ) ( not ( = ?auto_36105 ?auto_36125 ) ) ( not ( = ?auto_36127 ?auto_36125 ) ) ( not ( = ?auto_36111 ?auto_36125 ) ) ( not ( = ?auto_36121 ?auto_36125 ) ) ( not ( = ?auto_36104 ?auto_36125 ) ) ( not ( = ?auto_36114 ?auto_36125 ) ) ( AVAILABLE ?auto_36129 ) ( AVAILABLE ?auto_36123 ) ( SURFACE-AT ?auto_36104 ?auto_36116 ) ( ON ?auto_36104 ?auto_36128 ) ( CLEAR ?auto_36104 ) ( not ( = ?auto_36100 ?auto_36128 ) ) ( not ( = ?auto_36101 ?auto_36128 ) ) ( not ( = ?auto_36122 ?auto_36128 ) ) ( not ( = ?auto_36106 ?auto_36128 ) ) ( not ( = ?auto_36120 ?auto_36128 ) ) ( not ( = ?auto_36117 ?auto_36128 ) ) ( not ( = ?auto_36109 ?auto_36128 ) ) ( not ( = ?auto_36118 ?auto_36128 ) ) ( not ( = ?auto_36102 ?auto_36128 ) ) ( not ( = ?auto_36105 ?auto_36128 ) ) ( not ( = ?auto_36127 ?auto_36128 ) ) ( not ( = ?auto_36111 ?auto_36128 ) ) ( not ( = ?auto_36121 ?auto_36128 ) ) ( not ( = ?auto_36104 ?auto_36128 ) ) ( not ( = ?auto_36114 ?auto_36128 ) ) ( not ( = ?auto_36125 ?auto_36128 ) ) ( TRUCK-AT ?auto_36107 ?auto_36119 ) )
    :subtasks
    ( ( !DRIVE ?auto_36107 ?auto_36119 ?auto_36116 )
      ( MAKE-ON ?auto_36100 ?auto_36101 )
      ( MAKE-ON-VERIFY ?auto_36100 ?auto_36101 ) )
  )

)

