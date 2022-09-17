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
      ?auto_11991 - SURFACE
      ?auto_11992 - SURFACE
    )
    :vars
    (
      ?auto_11993 - HOIST
      ?auto_11994 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11993 ?auto_11994 ) ( SURFACE-AT ?auto_11992 ?auto_11994 ) ( CLEAR ?auto_11992 ) ( LIFTING ?auto_11993 ?auto_11991 ) ( IS-CRATE ?auto_11991 ) ( not ( = ?auto_11991 ?auto_11992 ) ) )
    :subtasks
    ( ( !DROP ?auto_11993 ?auto_11991 ?auto_11992 ?auto_11994 )
      ( MAKE-ON-VERIFY ?auto_11991 ?auto_11992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11995 - SURFACE
      ?auto_11996 - SURFACE
    )
    :vars
    (
      ?auto_11997 - HOIST
      ?auto_11998 - PLACE
      ?auto_11999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11997 ?auto_11998 ) ( SURFACE-AT ?auto_11996 ?auto_11998 ) ( CLEAR ?auto_11996 ) ( IS-CRATE ?auto_11995 ) ( not ( = ?auto_11995 ?auto_11996 ) ) ( TRUCK-AT ?auto_11999 ?auto_11998 ) ( AVAILABLE ?auto_11997 ) ( IN ?auto_11995 ?auto_11999 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11997 ?auto_11995 ?auto_11999 ?auto_11998 )
      ( MAKE-ON ?auto_11995 ?auto_11996 )
      ( MAKE-ON-VERIFY ?auto_11995 ?auto_11996 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12000 - SURFACE
      ?auto_12001 - SURFACE
    )
    :vars
    (
      ?auto_12004 - HOIST
      ?auto_12003 - PLACE
      ?auto_12002 - TRUCK
      ?auto_12005 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12004 ?auto_12003 ) ( SURFACE-AT ?auto_12001 ?auto_12003 ) ( CLEAR ?auto_12001 ) ( IS-CRATE ?auto_12000 ) ( not ( = ?auto_12000 ?auto_12001 ) ) ( AVAILABLE ?auto_12004 ) ( IN ?auto_12000 ?auto_12002 ) ( TRUCK-AT ?auto_12002 ?auto_12005 ) ( not ( = ?auto_12005 ?auto_12003 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12002 ?auto_12005 ?auto_12003 )
      ( MAKE-ON ?auto_12000 ?auto_12001 )
      ( MAKE-ON-VERIFY ?auto_12000 ?auto_12001 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12006 - SURFACE
      ?auto_12007 - SURFACE
    )
    :vars
    (
      ?auto_12010 - HOIST
      ?auto_12009 - PLACE
      ?auto_12008 - TRUCK
      ?auto_12011 - PLACE
      ?auto_12012 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12010 ?auto_12009 ) ( SURFACE-AT ?auto_12007 ?auto_12009 ) ( CLEAR ?auto_12007 ) ( IS-CRATE ?auto_12006 ) ( not ( = ?auto_12006 ?auto_12007 ) ) ( AVAILABLE ?auto_12010 ) ( TRUCK-AT ?auto_12008 ?auto_12011 ) ( not ( = ?auto_12011 ?auto_12009 ) ) ( HOIST-AT ?auto_12012 ?auto_12011 ) ( LIFTING ?auto_12012 ?auto_12006 ) ( not ( = ?auto_12010 ?auto_12012 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12012 ?auto_12006 ?auto_12008 ?auto_12011 )
      ( MAKE-ON ?auto_12006 ?auto_12007 )
      ( MAKE-ON-VERIFY ?auto_12006 ?auto_12007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12013 - SURFACE
      ?auto_12014 - SURFACE
    )
    :vars
    (
      ?auto_12016 - HOIST
      ?auto_12018 - PLACE
      ?auto_12017 - TRUCK
      ?auto_12015 - PLACE
      ?auto_12019 - HOIST
      ?auto_12020 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12016 ?auto_12018 ) ( SURFACE-AT ?auto_12014 ?auto_12018 ) ( CLEAR ?auto_12014 ) ( IS-CRATE ?auto_12013 ) ( not ( = ?auto_12013 ?auto_12014 ) ) ( AVAILABLE ?auto_12016 ) ( TRUCK-AT ?auto_12017 ?auto_12015 ) ( not ( = ?auto_12015 ?auto_12018 ) ) ( HOIST-AT ?auto_12019 ?auto_12015 ) ( not ( = ?auto_12016 ?auto_12019 ) ) ( AVAILABLE ?auto_12019 ) ( SURFACE-AT ?auto_12013 ?auto_12015 ) ( ON ?auto_12013 ?auto_12020 ) ( CLEAR ?auto_12013 ) ( not ( = ?auto_12013 ?auto_12020 ) ) ( not ( = ?auto_12014 ?auto_12020 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12019 ?auto_12013 ?auto_12020 ?auto_12015 )
      ( MAKE-ON ?auto_12013 ?auto_12014 )
      ( MAKE-ON-VERIFY ?auto_12013 ?auto_12014 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12021 - SURFACE
      ?auto_12022 - SURFACE
    )
    :vars
    (
      ?auto_12026 - HOIST
      ?auto_12027 - PLACE
      ?auto_12025 - PLACE
      ?auto_12028 - HOIST
      ?auto_12024 - SURFACE
      ?auto_12023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12026 ?auto_12027 ) ( SURFACE-AT ?auto_12022 ?auto_12027 ) ( CLEAR ?auto_12022 ) ( IS-CRATE ?auto_12021 ) ( not ( = ?auto_12021 ?auto_12022 ) ) ( AVAILABLE ?auto_12026 ) ( not ( = ?auto_12025 ?auto_12027 ) ) ( HOIST-AT ?auto_12028 ?auto_12025 ) ( not ( = ?auto_12026 ?auto_12028 ) ) ( AVAILABLE ?auto_12028 ) ( SURFACE-AT ?auto_12021 ?auto_12025 ) ( ON ?auto_12021 ?auto_12024 ) ( CLEAR ?auto_12021 ) ( not ( = ?auto_12021 ?auto_12024 ) ) ( not ( = ?auto_12022 ?auto_12024 ) ) ( TRUCK-AT ?auto_12023 ?auto_12027 ) )
    :subtasks
    ( ( !DRIVE ?auto_12023 ?auto_12027 ?auto_12025 )
      ( MAKE-ON ?auto_12021 ?auto_12022 )
      ( MAKE-ON-VERIFY ?auto_12021 ?auto_12022 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12031 - SURFACE
      ?auto_12032 - SURFACE
    )
    :vars
    (
      ?auto_12033 - HOIST
      ?auto_12034 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12033 ?auto_12034 ) ( SURFACE-AT ?auto_12032 ?auto_12034 ) ( CLEAR ?auto_12032 ) ( LIFTING ?auto_12033 ?auto_12031 ) ( IS-CRATE ?auto_12031 ) ( not ( = ?auto_12031 ?auto_12032 ) ) )
    :subtasks
    ( ( !DROP ?auto_12033 ?auto_12031 ?auto_12032 ?auto_12034 )
      ( MAKE-ON-VERIFY ?auto_12031 ?auto_12032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12035 - SURFACE
      ?auto_12036 - SURFACE
    )
    :vars
    (
      ?auto_12037 - HOIST
      ?auto_12038 - PLACE
      ?auto_12039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12037 ?auto_12038 ) ( SURFACE-AT ?auto_12036 ?auto_12038 ) ( CLEAR ?auto_12036 ) ( IS-CRATE ?auto_12035 ) ( not ( = ?auto_12035 ?auto_12036 ) ) ( TRUCK-AT ?auto_12039 ?auto_12038 ) ( AVAILABLE ?auto_12037 ) ( IN ?auto_12035 ?auto_12039 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12037 ?auto_12035 ?auto_12039 ?auto_12038 )
      ( MAKE-ON ?auto_12035 ?auto_12036 )
      ( MAKE-ON-VERIFY ?auto_12035 ?auto_12036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12040 - SURFACE
      ?auto_12041 - SURFACE
    )
    :vars
    (
      ?auto_12044 - HOIST
      ?auto_12043 - PLACE
      ?auto_12042 - TRUCK
      ?auto_12045 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12044 ?auto_12043 ) ( SURFACE-AT ?auto_12041 ?auto_12043 ) ( CLEAR ?auto_12041 ) ( IS-CRATE ?auto_12040 ) ( not ( = ?auto_12040 ?auto_12041 ) ) ( AVAILABLE ?auto_12044 ) ( IN ?auto_12040 ?auto_12042 ) ( TRUCK-AT ?auto_12042 ?auto_12045 ) ( not ( = ?auto_12045 ?auto_12043 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12042 ?auto_12045 ?auto_12043 )
      ( MAKE-ON ?auto_12040 ?auto_12041 )
      ( MAKE-ON-VERIFY ?auto_12040 ?auto_12041 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12046 - SURFACE
      ?auto_12047 - SURFACE
    )
    :vars
    (
      ?auto_12051 - HOIST
      ?auto_12050 - PLACE
      ?auto_12049 - TRUCK
      ?auto_12048 - PLACE
      ?auto_12052 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12051 ?auto_12050 ) ( SURFACE-AT ?auto_12047 ?auto_12050 ) ( CLEAR ?auto_12047 ) ( IS-CRATE ?auto_12046 ) ( not ( = ?auto_12046 ?auto_12047 ) ) ( AVAILABLE ?auto_12051 ) ( TRUCK-AT ?auto_12049 ?auto_12048 ) ( not ( = ?auto_12048 ?auto_12050 ) ) ( HOIST-AT ?auto_12052 ?auto_12048 ) ( LIFTING ?auto_12052 ?auto_12046 ) ( not ( = ?auto_12051 ?auto_12052 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12052 ?auto_12046 ?auto_12049 ?auto_12048 )
      ( MAKE-ON ?auto_12046 ?auto_12047 )
      ( MAKE-ON-VERIFY ?auto_12046 ?auto_12047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12053 - SURFACE
      ?auto_12054 - SURFACE
    )
    :vars
    (
      ?auto_12058 - HOIST
      ?auto_12055 - PLACE
      ?auto_12057 - TRUCK
      ?auto_12056 - PLACE
      ?auto_12059 - HOIST
      ?auto_12060 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12058 ?auto_12055 ) ( SURFACE-AT ?auto_12054 ?auto_12055 ) ( CLEAR ?auto_12054 ) ( IS-CRATE ?auto_12053 ) ( not ( = ?auto_12053 ?auto_12054 ) ) ( AVAILABLE ?auto_12058 ) ( TRUCK-AT ?auto_12057 ?auto_12056 ) ( not ( = ?auto_12056 ?auto_12055 ) ) ( HOIST-AT ?auto_12059 ?auto_12056 ) ( not ( = ?auto_12058 ?auto_12059 ) ) ( AVAILABLE ?auto_12059 ) ( SURFACE-AT ?auto_12053 ?auto_12056 ) ( ON ?auto_12053 ?auto_12060 ) ( CLEAR ?auto_12053 ) ( not ( = ?auto_12053 ?auto_12060 ) ) ( not ( = ?auto_12054 ?auto_12060 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12059 ?auto_12053 ?auto_12060 ?auto_12056 )
      ( MAKE-ON ?auto_12053 ?auto_12054 )
      ( MAKE-ON-VERIFY ?auto_12053 ?auto_12054 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12061 - SURFACE
      ?auto_12062 - SURFACE
    )
    :vars
    (
      ?auto_12066 - HOIST
      ?auto_12064 - PLACE
      ?auto_12065 - PLACE
      ?auto_12068 - HOIST
      ?auto_12067 - SURFACE
      ?auto_12063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12066 ?auto_12064 ) ( SURFACE-AT ?auto_12062 ?auto_12064 ) ( CLEAR ?auto_12062 ) ( IS-CRATE ?auto_12061 ) ( not ( = ?auto_12061 ?auto_12062 ) ) ( AVAILABLE ?auto_12066 ) ( not ( = ?auto_12065 ?auto_12064 ) ) ( HOIST-AT ?auto_12068 ?auto_12065 ) ( not ( = ?auto_12066 ?auto_12068 ) ) ( AVAILABLE ?auto_12068 ) ( SURFACE-AT ?auto_12061 ?auto_12065 ) ( ON ?auto_12061 ?auto_12067 ) ( CLEAR ?auto_12061 ) ( not ( = ?auto_12061 ?auto_12067 ) ) ( not ( = ?auto_12062 ?auto_12067 ) ) ( TRUCK-AT ?auto_12063 ?auto_12064 ) )
    :subtasks
    ( ( !DRIVE ?auto_12063 ?auto_12064 ?auto_12065 )
      ( MAKE-ON ?auto_12061 ?auto_12062 )
      ( MAKE-ON-VERIFY ?auto_12061 ?auto_12062 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12069 - SURFACE
      ?auto_12070 - SURFACE
    )
    :vars
    (
      ?auto_12073 - HOIST
      ?auto_12075 - PLACE
      ?auto_12074 - PLACE
      ?auto_12072 - HOIST
      ?auto_12076 - SURFACE
      ?auto_12071 - TRUCK
      ?auto_12077 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12073 ?auto_12075 ) ( IS-CRATE ?auto_12069 ) ( not ( = ?auto_12069 ?auto_12070 ) ) ( not ( = ?auto_12074 ?auto_12075 ) ) ( HOIST-AT ?auto_12072 ?auto_12074 ) ( not ( = ?auto_12073 ?auto_12072 ) ) ( AVAILABLE ?auto_12072 ) ( SURFACE-AT ?auto_12069 ?auto_12074 ) ( ON ?auto_12069 ?auto_12076 ) ( CLEAR ?auto_12069 ) ( not ( = ?auto_12069 ?auto_12076 ) ) ( not ( = ?auto_12070 ?auto_12076 ) ) ( TRUCK-AT ?auto_12071 ?auto_12075 ) ( SURFACE-AT ?auto_12077 ?auto_12075 ) ( CLEAR ?auto_12077 ) ( LIFTING ?auto_12073 ?auto_12070 ) ( IS-CRATE ?auto_12070 ) ( not ( = ?auto_12069 ?auto_12077 ) ) ( not ( = ?auto_12070 ?auto_12077 ) ) ( not ( = ?auto_12076 ?auto_12077 ) ) )
    :subtasks
    ( ( !DROP ?auto_12073 ?auto_12070 ?auto_12077 ?auto_12075 )
      ( MAKE-ON ?auto_12069 ?auto_12070 )
      ( MAKE-ON-VERIFY ?auto_12069 ?auto_12070 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12078 - SURFACE
      ?auto_12079 - SURFACE
    )
    :vars
    (
      ?auto_12080 - HOIST
      ?auto_12083 - PLACE
      ?auto_12082 - PLACE
      ?auto_12085 - HOIST
      ?auto_12086 - SURFACE
      ?auto_12081 - TRUCK
      ?auto_12084 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12080 ?auto_12083 ) ( IS-CRATE ?auto_12078 ) ( not ( = ?auto_12078 ?auto_12079 ) ) ( not ( = ?auto_12082 ?auto_12083 ) ) ( HOIST-AT ?auto_12085 ?auto_12082 ) ( not ( = ?auto_12080 ?auto_12085 ) ) ( AVAILABLE ?auto_12085 ) ( SURFACE-AT ?auto_12078 ?auto_12082 ) ( ON ?auto_12078 ?auto_12086 ) ( CLEAR ?auto_12078 ) ( not ( = ?auto_12078 ?auto_12086 ) ) ( not ( = ?auto_12079 ?auto_12086 ) ) ( TRUCK-AT ?auto_12081 ?auto_12083 ) ( SURFACE-AT ?auto_12084 ?auto_12083 ) ( CLEAR ?auto_12084 ) ( IS-CRATE ?auto_12079 ) ( not ( = ?auto_12078 ?auto_12084 ) ) ( not ( = ?auto_12079 ?auto_12084 ) ) ( not ( = ?auto_12086 ?auto_12084 ) ) ( AVAILABLE ?auto_12080 ) ( IN ?auto_12079 ?auto_12081 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12080 ?auto_12079 ?auto_12081 ?auto_12083 )
      ( MAKE-ON ?auto_12078 ?auto_12079 )
      ( MAKE-ON-VERIFY ?auto_12078 ?auto_12079 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12087 - SURFACE
      ?auto_12088 - SURFACE
    )
    :vars
    (
      ?auto_12092 - HOIST
      ?auto_12090 - PLACE
      ?auto_12094 - PLACE
      ?auto_12091 - HOIST
      ?auto_12095 - SURFACE
      ?auto_12093 - SURFACE
      ?auto_12089 - TRUCK
      ?auto_12096 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12092 ?auto_12090 ) ( IS-CRATE ?auto_12087 ) ( not ( = ?auto_12087 ?auto_12088 ) ) ( not ( = ?auto_12094 ?auto_12090 ) ) ( HOIST-AT ?auto_12091 ?auto_12094 ) ( not ( = ?auto_12092 ?auto_12091 ) ) ( AVAILABLE ?auto_12091 ) ( SURFACE-AT ?auto_12087 ?auto_12094 ) ( ON ?auto_12087 ?auto_12095 ) ( CLEAR ?auto_12087 ) ( not ( = ?auto_12087 ?auto_12095 ) ) ( not ( = ?auto_12088 ?auto_12095 ) ) ( SURFACE-AT ?auto_12093 ?auto_12090 ) ( CLEAR ?auto_12093 ) ( IS-CRATE ?auto_12088 ) ( not ( = ?auto_12087 ?auto_12093 ) ) ( not ( = ?auto_12088 ?auto_12093 ) ) ( not ( = ?auto_12095 ?auto_12093 ) ) ( AVAILABLE ?auto_12092 ) ( IN ?auto_12088 ?auto_12089 ) ( TRUCK-AT ?auto_12089 ?auto_12096 ) ( not ( = ?auto_12096 ?auto_12090 ) ) ( not ( = ?auto_12094 ?auto_12096 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12089 ?auto_12096 ?auto_12090 )
      ( MAKE-ON ?auto_12087 ?auto_12088 )
      ( MAKE-ON-VERIFY ?auto_12087 ?auto_12088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12097 - SURFACE
      ?auto_12098 - SURFACE
    )
    :vars
    (
      ?auto_12100 - HOIST
      ?auto_12104 - PLACE
      ?auto_12101 - PLACE
      ?auto_12105 - HOIST
      ?auto_12102 - SURFACE
      ?auto_12106 - SURFACE
      ?auto_12099 - TRUCK
      ?auto_12103 - PLACE
      ?auto_12107 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12100 ?auto_12104 ) ( IS-CRATE ?auto_12097 ) ( not ( = ?auto_12097 ?auto_12098 ) ) ( not ( = ?auto_12101 ?auto_12104 ) ) ( HOIST-AT ?auto_12105 ?auto_12101 ) ( not ( = ?auto_12100 ?auto_12105 ) ) ( AVAILABLE ?auto_12105 ) ( SURFACE-AT ?auto_12097 ?auto_12101 ) ( ON ?auto_12097 ?auto_12102 ) ( CLEAR ?auto_12097 ) ( not ( = ?auto_12097 ?auto_12102 ) ) ( not ( = ?auto_12098 ?auto_12102 ) ) ( SURFACE-AT ?auto_12106 ?auto_12104 ) ( CLEAR ?auto_12106 ) ( IS-CRATE ?auto_12098 ) ( not ( = ?auto_12097 ?auto_12106 ) ) ( not ( = ?auto_12098 ?auto_12106 ) ) ( not ( = ?auto_12102 ?auto_12106 ) ) ( AVAILABLE ?auto_12100 ) ( TRUCK-AT ?auto_12099 ?auto_12103 ) ( not ( = ?auto_12103 ?auto_12104 ) ) ( not ( = ?auto_12101 ?auto_12103 ) ) ( HOIST-AT ?auto_12107 ?auto_12103 ) ( LIFTING ?auto_12107 ?auto_12098 ) ( not ( = ?auto_12100 ?auto_12107 ) ) ( not ( = ?auto_12105 ?auto_12107 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12107 ?auto_12098 ?auto_12099 ?auto_12103 )
      ( MAKE-ON ?auto_12097 ?auto_12098 )
      ( MAKE-ON-VERIFY ?auto_12097 ?auto_12098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12108 - SURFACE
      ?auto_12109 - SURFACE
    )
    :vars
    (
      ?auto_12116 - HOIST
      ?auto_12114 - PLACE
      ?auto_12113 - PLACE
      ?auto_12115 - HOIST
      ?auto_12111 - SURFACE
      ?auto_12110 - SURFACE
      ?auto_12112 - TRUCK
      ?auto_12117 - PLACE
      ?auto_12118 - HOIST
      ?auto_12119 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12116 ?auto_12114 ) ( IS-CRATE ?auto_12108 ) ( not ( = ?auto_12108 ?auto_12109 ) ) ( not ( = ?auto_12113 ?auto_12114 ) ) ( HOIST-AT ?auto_12115 ?auto_12113 ) ( not ( = ?auto_12116 ?auto_12115 ) ) ( AVAILABLE ?auto_12115 ) ( SURFACE-AT ?auto_12108 ?auto_12113 ) ( ON ?auto_12108 ?auto_12111 ) ( CLEAR ?auto_12108 ) ( not ( = ?auto_12108 ?auto_12111 ) ) ( not ( = ?auto_12109 ?auto_12111 ) ) ( SURFACE-AT ?auto_12110 ?auto_12114 ) ( CLEAR ?auto_12110 ) ( IS-CRATE ?auto_12109 ) ( not ( = ?auto_12108 ?auto_12110 ) ) ( not ( = ?auto_12109 ?auto_12110 ) ) ( not ( = ?auto_12111 ?auto_12110 ) ) ( AVAILABLE ?auto_12116 ) ( TRUCK-AT ?auto_12112 ?auto_12117 ) ( not ( = ?auto_12117 ?auto_12114 ) ) ( not ( = ?auto_12113 ?auto_12117 ) ) ( HOIST-AT ?auto_12118 ?auto_12117 ) ( not ( = ?auto_12116 ?auto_12118 ) ) ( not ( = ?auto_12115 ?auto_12118 ) ) ( AVAILABLE ?auto_12118 ) ( SURFACE-AT ?auto_12109 ?auto_12117 ) ( ON ?auto_12109 ?auto_12119 ) ( CLEAR ?auto_12109 ) ( not ( = ?auto_12108 ?auto_12119 ) ) ( not ( = ?auto_12109 ?auto_12119 ) ) ( not ( = ?auto_12111 ?auto_12119 ) ) ( not ( = ?auto_12110 ?auto_12119 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12118 ?auto_12109 ?auto_12119 ?auto_12117 )
      ( MAKE-ON ?auto_12108 ?auto_12109 )
      ( MAKE-ON-VERIFY ?auto_12108 ?auto_12109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12120 - SURFACE
      ?auto_12121 - SURFACE
    )
    :vars
    (
      ?auto_12128 - HOIST
      ?auto_12122 - PLACE
      ?auto_12127 - PLACE
      ?auto_12130 - HOIST
      ?auto_12123 - SURFACE
      ?auto_12131 - SURFACE
      ?auto_12129 - PLACE
      ?auto_12125 - HOIST
      ?auto_12124 - SURFACE
      ?auto_12126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12128 ?auto_12122 ) ( IS-CRATE ?auto_12120 ) ( not ( = ?auto_12120 ?auto_12121 ) ) ( not ( = ?auto_12127 ?auto_12122 ) ) ( HOIST-AT ?auto_12130 ?auto_12127 ) ( not ( = ?auto_12128 ?auto_12130 ) ) ( AVAILABLE ?auto_12130 ) ( SURFACE-AT ?auto_12120 ?auto_12127 ) ( ON ?auto_12120 ?auto_12123 ) ( CLEAR ?auto_12120 ) ( not ( = ?auto_12120 ?auto_12123 ) ) ( not ( = ?auto_12121 ?auto_12123 ) ) ( SURFACE-AT ?auto_12131 ?auto_12122 ) ( CLEAR ?auto_12131 ) ( IS-CRATE ?auto_12121 ) ( not ( = ?auto_12120 ?auto_12131 ) ) ( not ( = ?auto_12121 ?auto_12131 ) ) ( not ( = ?auto_12123 ?auto_12131 ) ) ( AVAILABLE ?auto_12128 ) ( not ( = ?auto_12129 ?auto_12122 ) ) ( not ( = ?auto_12127 ?auto_12129 ) ) ( HOIST-AT ?auto_12125 ?auto_12129 ) ( not ( = ?auto_12128 ?auto_12125 ) ) ( not ( = ?auto_12130 ?auto_12125 ) ) ( AVAILABLE ?auto_12125 ) ( SURFACE-AT ?auto_12121 ?auto_12129 ) ( ON ?auto_12121 ?auto_12124 ) ( CLEAR ?auto_12121 ) ( not ( = ?auto_12120 ?auto_12124 ) ) ( not ( = ?auto_12121 ?auto_12124 ) ) ( not ( = ?auto_12123 ?auto_12124 ) ) ( not ( = ?auto_12131 ?auto_12124 ) ) ( TRUCK-AT ?auto_12126 ?auto_12122 ) )
    :subtasks
    ( ( !DRIVE ?auto_12126 ?auto_12122 ?auto_12129 )
      ( MAKE-ON ?auto_12120 ?auto_12121 )
      ( MAKE-ON-VERIFY ?auto_12120 ?auto_12121 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12134 - SURFACE
      ?auto_12135 - SURFACE
    )
    :vars
    (
      ?auto_12136 - HOIST
      ?auto_12137 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12136 ?auto_12137 ) ( SURFACE-AT ?auto_12135 ?auto_12137 ) ( CLEAR ?auto_12135 ) ( LIFTING ?auto_12136 ?auto_12134 ) ( IS-CRATE ?auto_12134 ) ( not ( = ?auto_12134 ?auto_12135 ) ) )
    :subtasks
    ( ( !DROP ?auto_12136 ?auto_12134 ?auto_12135 ?auto_12137 )
      ( MAKE-ON-VERIFY ?auto_12134 ?auto_12135 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12138 - SURFACE
      ?auto_12139 - SURFACE
    )
    :vars
    (
      ?auto_12140 - HOIST
      ?auto_12141 - PLACE
      ?auto_12142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12140 ?auto_12141 ) ( SURFACE-AT ?auto_12139 ?auto_12141 ) ( CLEAR ?auto_12139 ) ( IS-CRATE ?auto_12138 ) ( not ( = ?auto_12138 ?auto_12139 ) ) ( TRUCK-AT ?auto_12142 ?auto_12141 ) ( AVAILABLE ?auto_12140 ) ( IN ?auto_12138 ?auto_12142 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12140 ?auto_12138 ?auto_12142 ?auto_12141 )
      ( MAKE-ON ?auto_12138 ?auto_12139 )
      ( MAKE-ON-VERIFY ?auto_12138 ?auto_12139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12143 - SURFACE
      ?auto_12144 - SURFACE
    )
    :vars
    (
      ?auto_12146 - HOIST
      ?auto_12145 - PLACE
      ?auto_12147 - TRUCK
      ?auto_12148 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12146 ?auto_12145 ) ( SURFACE-AT ?auto_12144 ?auto_12145 ) ( CLEAR ?auto_12144 ) ( IS-CRATE ?auto_12143 ) ( not ( = ?auto_12143 ?auto_12144 ) ) ( AVAILABLE ?auto_12146 ) ( IN ?auto_12143 ?auto_12147 ) ( TRUCK-AT ?auto_12147 ?auto_12148 ) ( not ( = ?auto_12148 ?auto_12145 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12147 ?auto_12148 ?auto_12145 )
      ( MAKE-ON ?auto_12143 ?auto_12144 )
      ( MAKE-ON-VERIFY ?auto_12143 ?auto_12144 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12149 - SURFACE
      ?auto_12150 - SURFACE
    )
    :vars
    (
      ?auto_12152 - HOIST
      ?auto_12153 - PLACE
      ?auto_12151 - TRUCK
      ?auto_12154 - PLACE
      ?auto_12155 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12152 ?auto_12153 ) ( SURFACE-AT ?auto_12150 ?auto_12153 ) ( CLEAR ?auto_12150 ) ( IS-CRATE ?auto_12149 ) ( not ( = ?auto_12149 ?auto_12150 ) ) ( AVAILABLE ?auto_12152 ) ( TRUCK-AT ?auto_12151 ?auto_12154 ) ( not ( = ?auto_12154 ?auto_12153 ) ) ( HOIST-AT ?auto_12155 ?auto_12154 ) ( LIFTING ?auto_12155 ?auto_12149 ) ( not ( = ?auto_12152 ?auto_12155 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12155 ?auto_12149 ?auto_12151 ?auto_12154 )
      ( MAKE-ON ?auto_12149 ?auto_12150 )
      ( MAKE-ON-VERIFY ?auto_12149 ?auto_12150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12156 - SURFACE
      ?auto_12157 - SURFACE
    )
    :vars
    (
      ?auto_12159 - HOIST
      ?auto_12161 - PLACE
      ?auto_12160 - TRUCK
      ?auto_12158 - PLACE
      ?auto_12162 - HOIST
      ?auto_12163 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12159 ?auto_12161 ) ( SURFACE-AT ?auto_12157 ?auto_12161 ) ( CLEAR ?auto_12157 ) ( IS-CRATE ?auto_12156 ) ( not ( = ?auto_12156 ?auto_12157 ) ) ( AVAILABLE ?auto_12159 ) ( TRUCK-AT ?auto_12160 ?auto_12158 ) ( not ( = ?auto_12158 ?auto_12161 ) ) ( HOIST-AT ?auto_12162 ?auto_12158 ) ( not ( = ?auto_12159 ?auto_12162 ) ) ( AVAILABLE ?auto_12162 ) ( SURFACE-AT ?auto_12156 ?auto_12158 ) ( ON ?auto_12156 ?auto_12163 ) ( CLEAR ?auto_12156 ) ( not ( = ?auto_12156 ?auto_12163 ) ) ( not ( = ?auto_12157 ?auto_12163 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12162 ?auto_12156 ?auto_12163 ?auto_12158 )
      ( MAKE-ON ?auto_12156 ?auto_12157 )
      ( MAKE-ON-VERIFY ?auto_12156 ?auto_12157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12164 - SURFACE
      ?auto_12165 - SURFACE
    )
    :vars
    (
      ?auto_12171 - HOIST
      ?auto_12170 - PLACE
      ?auto_12167 - PLACE
      ?auto_12168 - HOIST
      ?auto_12166 - SURFACE
      ?auto_12169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12171 ?auto_12170 ) ( SURFACE-AT ?auto_12165 ?auto_12170 ) ( CLEAR ?auto_12165 ) ( IS-CRATE ?auto_12164 ) ( not ( = ?auto_12164 ?auto_12165 ) ) ( AVAILABLE ?auto_12171 ) ( not ( = ?auto_12167 ?auto_12170 ) ) ( HOIST-AT ?auto_12168 ?auto_12167 ) ( not ( = ?auto_12171 ?auto_12168 ) ) ( AVAILABLE ?auto_12168 ) ( SURFACE-AT ?auto_12164 ?auto_12167 ) ( ON ?auto_12164 ?auto_12166 ) ( CLEAR ?auto_12164 ) ( not ( = ?auto_12164 ?auto_12166 ) ) ( not ( = ?auto_12165 ?auto_12166 ) ) ( TRUCK-AT ?auto_12169 ?auto_12170 ) )
    :subtasks
    ( ( !DRIVE ?auto_12169 ?auto_12170 ?auto_12167 )
      ( MAKE-ON ?auto_12164 ?auto_12165 )
      ( MAKE-ON-VERIFY ?auto_12164 ?auto_12165 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12172 - SURFACE
      ?auto_12173 - SURFACE
    )
    :vars
    (
      ?auto_12176 - HOIST
      ?auto_12178 - PLACE
      ?auto_12177 - PLACE
      ?auto_12174 - HOIST
      ?auto_12175 - SURFACE
      ?auto_12179 - TRUCK
      ?auto_12180 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12176 ?auto_12178 ) ( IS-CRATE ?auto_12172 ) ( not ( = ?auto_12172 ?auto_12173 ) ) ( not ( = ?auto_12177 ?auto_12178 ) ) ( HOIST-AT ?auto_12174 ?auto_12177 ) ( not ( = ?auto_12176 ?auto_12174 ) ) ( AVAILABLE ?auto_12174 ) ( SURFACE-AT ?auto_12172 ?auto_12177 ) ( ON ?auto_12172 ?auto_12175 ) ( CLEAR ?auto_12172 ) ( not ( = ?auto_12172 ?auto_12175 ) ) ( not ( = ?auto_12173 ?auto_12175 ) ) ( TRUCK-AT ?auto_12179 ?auto_12178 ) ( SURFACE-AT ?auto_12180 ?auto_12178 ) ( CLEAR ?auto_12180 ) ( LIFTING ?auto_12176 ?auto_12173 ) ( IS-CRATE ?auto_12173 ) ( not ( = ?auto_12172 ?auto_12180 ) ) ( not ( = ?auto_12173 ?auto_12180 ) ) ( not ( = ?auto_12175 ?auto_12180 ) ) )
    :subtasks
    ( ( !DROP ?auto_12176 ?auto_12173 ?auto_12180 ?auto_12178 )
      ( MAKE-ON ?auto_12172 ?auto_12173 )
      ( MAKE-ON-VERIFY ?auto_12172 ?auto_12173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12181 - SURFACE
      ?auto_12182 - SURFACE
    )
    :vars
    (
      ?auto_12189 - HOIST
      ?auto_12187 - PLACE
      ?auto_12183 - PLACE
      ?auto_12184 - HOIST
      ?auto_12185 - SURFACE
      ?auto_12186 - TRUCK
      ?auto_12188 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12189 ?auto_12187 ) ( IS-CRATE ?auto_12181 ) ( not ( = ?auto_12181 ?auto_12182 ) ) ( not ( = ?auto_12183 ?auto_12187 ) ) ( HOIST-AT ?auto_12184 ?auto_12183 ) ( not ( = ?auto_12189 ?auto_12184 ) ) ( AVAILABLE ?auto_12184 ) ( SURFACE-AT ?auto_12181 ?auto_12183 ) ( ON ?auto_12181 ?auto_12185 ) ( CLEAR ?auto_12181 ) ( not ( = ?auto_12181 ?auto_12185 ) ) ( not ( = ?auto_12182 ?auto_12185 ) ) ( TRUCK-AT ?auto_12186 ?auto_12187 ) ( SURFACE-AT ?auto_12188 ?auto_12187 ) ( CLEAR ?auto_12188 ) ( IS-CRATE ?auto_12182 ) ( not ( = ?auto_12181 ?auto_12188 ) ) ( not ( = ?auto_12182 ?auto_12188 ) ) ( not ( = ?auto_12185 ?auto_12188 ) ) ( AVAILABLE ?auto_12189 ) ( IN ?auto_12182 ?auto_12186 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12189 ?auto_12182 ?auto_12186 ?auto_12187 )
      ( MAKE-ON ?auto_12181 ?auto_12182 )
      ( MAKE-ON-VERIFY ?auto_12181 ?auto_12182 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12190 - SURFACE
      ?auto_12191 - SURFACE
    )
    :vars
    (
      ?auto_12193 - HOIST
      ?auto_12198 - PLACE
      ?auto_12195 - PLACE
      ?auto_12192 - HOIST
      ?auto_12196 - SURFACE
      ?auto_12197 - SURFACE
      ?auto_12194 - TRUCK
      ?auto_12199 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12193 ?auto_12198 ) ( IS-CRATE ?auto_12190 ) ( not ( = ?auto_12190 ?auto_12191 ) ) ( not ( = ?auto_12195 ?auto_12198 ) ) ( HOIST-AT ?auto_12192 ?auto_12195 ) ( not ( = ?auto_12193 ?auto_12192 ) ) ( AVAILABLE ?auto_12192 ) ( SURFACE-AT ?auto_12190 ?auto_12195 ) ( ON ?auto_12190 ?auto_12196 ) ( CLEAR ?auto_12190 ) ( not ( = ?auto_12190 ?auto_12196 ) ) ( not ( = ?auto_12191 ?auto_12196 ) ) ( SURFACE-AT ?auto_12197 ?auto_12198 ) ( CLEAR ?auto_12197 ) ( IS-CRATE ?auto_12191 ) ( not ( = ?auto_12190 ?auto_12197 ) ) ( not ( = ?auto_12191 ?auto_12197 ) ) ( not ( = ?auto_12196 ?auto_12197 ) ) ( AVAILABLE ?auto_12193 ) ( IN ?auto_12191 ?auto_12194 ) ( TRUCK-AT ?auto_12194 ?auto_12199 ) ( not ( = ?auto_12199 ?auto_12198 ) ) ( not ( = ?auto_12195 ?auto_12199 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12194 ?auto_12199 ?auto_12198 )
      ( MAKE-ON ?auto_12190 ?auto_12191 )
      ( MAKE-ON-VERIFY ?auto_12190 ?auto_12191 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12200 - SURFACE
      ?auto_12201 - SURFACE
    )
    :vars
    (
      ?auto_12208 - HOIST
      ?auto_12203 - PLACE
      ?auto_12205 - PLACE
      ?auto_12202 - HOIST
      ?auto_12207 - SURFACE
      ?auto_12209 - SURFACE
      ?auto_12204 - TRUCK
      ?auto_12206 - PLACE
      ?auto_12210 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12208 ?auto_12203 ) ( IS-CRATE ?auto_12200 ) ( not ( = ?auto_12200 ?auto_12201 ) ) ( not ( = ?auto_12205 ?auto_12203 ) ) ( HOIST-AT ?auto_12202 ?auto_12205 ) ( not ( = ?auto_12208 ?auto_12202 ) ) ( AVAILABLE ?auto_12202 ) ( SURFACE-AT ?auto_12200 ?auto_12205 ) ( ON ?auto_12200 ?auto_12207 ) ( CLEAR ?auto_12200 ) ( not ( = ?auto_12200 ?auto_12207 ) ) ( not ( = ?auto_12201 ?auto_12207 ) ) ( SURFACE-AT ?auto_12209 ?auto_12203 ) ( CLEAR ?auto_12209 ) ( IS-CRATE ?auto_12201 ) ( not ( = ?auto_12200 ?auto_12209 ) ) ( not ( = ?auto_12201 ?auto_12209 ) ) ( not ( = ?auto_12207 ?auto_12209 ) ) ( AVAILABLE ?auto_12208 ) ( TRUCK-AT ?auto_12204 ?auto_12206 ) ( not ( = ?auto_12206 ?auto_12203 ) ) ( not ( = ?auto_12205 ?auto_12206 ) ) ( HOIST-AT ?auto_12210 ?auto_12206 ) ( LIFTING ?auto_12210 ?auto_12201 ) ( not ( = ?auto_12208 ?auto_12210 ) ) ( not ( = ?auto_12202 ?auto_12210 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12210 ?auto_12201 ?auto_12204 ?auto_12206 )
      ( MAKE-ON ?auto_12200 ?auto_12201 )
      ( MAKE-ON-VERIFY ?auto_12200 ?auto_12201 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12211 - SURFACE
      ?auto_12212 - SURFACE
    )
    :vars
    (
      ?auto_12216 - HOIST
      ?auto_12219 - PLACE
      ?auto_12215 - PLACE
      ?auto_12213 - HOIST
      ?auto_12221 - SURFACE
      ?auto_12220 - SURFACE
      ?auto_12218 - TRUCK
      ?auto_12214 - PLACE
      ?auto_12217 - HOIST
      ?auto_12222 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12216 ?auto_12219 ) ( IS-CRATE ?auto_12211 ) ( not ( = ?auto_12211 ?auto_12212 ) ) ( not ( = ?auto_12215 ?auto_12219 ) ) ( HOIST-AT ?auto_12213 ?auto_12215 ) ( not ( = ?auto_12216 ?auto_12213 ) ) ( AVAILABLE ?auto_12213 ) ( SURFACE-AT ?auto_12211 ?auto_12215 ) ( ON ?auto_12211 ?auto_12221 ) ( CLEAR ?auto_12211 ) ( not ( = ?auto_12211 ?auto_12221 ) ) ( not ( = ?auto_12212 ?auto_12221 ) ) ( SURFACE-AT ?auto_12220 ?auto_12219 ) ( CLEAR ?auto_12220 ) ( IS-CRATE ?auto_12212 ) ( not ( = ?auto_12211 ?auto_12220 ) ) ( not ( = ?auto_12212 ?auto_12220 ) ) ( not ( = ?auto_12221 ?auto_12220 ) ) ( AVAILABLE ?auto_12216 ) ( TRUCK-AT ?auto_12218 ?auto_12214 ) ( not ( = ?auto_12214 ?auto_12219 ) ) ( not ( = ?auto_12215 ?auto_12214 ) ) ( HOIST-AT ?auto_12217 ?auto_12214 ) ( not ( = ?auto_12216 ?auto_12217 ) ) ( not ( = ?auto_12213 ?auto_12217 ) ) ( AVAILABLE ?auto_12217 ) ( SURFACE-AT ?auto_12212 ?auto_12214 ) ( ON ?auto_12212 ?auto_12222 ) ( CLEAR ?auto_12212 ) ( not ( = ?auto_12211 ?auto_12222 ) ) ( not ( = ?auto_12212 ?auto_12222 ) ) ( not ( = ?auto_12221 ?auto_12222 ) ) ( not ( = ?auto_12220 ?auto_12222 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12217 ?auto_12212 ?auto_12222 ?auto_12214 )
      ( MAKE-ON ?auto_12211 ?auto_12212 )
      ( MAKE-ON-VERIFY ?auto_12211 ?auto_12212 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12223 - SURFACE
      ?auto_12224 - SURFACE
    )
    :vars
    (
      ?auto_12232 - HOIST
      ?auto_12227 - PLACE
      ?auto_12231 - PLACE
      ?auto_12230 - HOIST
      ?auto_12228 - SURFACE
      ?auto_12229 - SURFACE
      ?auto_12225 - PLACE
      ?auto_12234 - HOIST
      ?auto_12226 - SURFACE
      ?auto_12233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12232 ?auto_12227 ) ( IS-CRATE ?auto_12223 ) ( not ( = ?auto_12223 ?auto_12224 ) ) ( not ( = ?auto_12231 ?auto_12227 ) ) ( HOIST-AT ?auto_12230 ?auto_12231 ) ( not ( = ?auto_12232 ?auto_12230 ) ) ( AVAILABLE ?auto_12230 ) ( SURFACE-AT ?auto_12223 ?auto_12231 ) ( ON ?auto_12223 ?auto_12228 ) ( CLEAR ?auto_12223 ) ( not ( = ?auto_12223 ?auto_12228 ) ) ( not ( = ?auto_12224 ?auto_12228 ) ) ( SURFACE-AT ?auto_12229 ?auto_12227 ) ( CLEAR ?auto_12229 ) ( IS-CRATE ?auto_12224 ) ( not ( = ?auto_12223 ?auto_12229 ) ) ( not ( = ?auto_12224 ?auto_12229 ) ) ( not ( = ?auto_12228 ?auto_12229 ) ) ( AVAILABLE ?auto_12232 ) ( not ( = ?auto_12225 ?auto_12227 ) ) ( not ( = ?auto_12231 ?auto_12225 ) ) ( HOIST-AT ?auto_12234 ?auto_12225 ) ( not ( = ?auto_12232 ?auto_12234 ) ) ( not ( = ?auto_12230 ?auto_12234 ) ) ( AVAILABLE ?auto_12234 ) ( SURFACE-AT ?auto_12224 ?auto_12225 ) ( ON ?auto_12224 ?auto_12226 ) ( CLEAR ?auto_12224 ) ( not ( = ?auto_12223 ?auto_12226 ) ) ( not ( = ?auto_12224 ?auto_12226 ) ) ( not ( = ?auto_12228 ?auto_12226 ) ) ( not ( = ?auto_12229 ?auto_12226 ) ) ( TRUCK-AT ?auto_12233 ?auto_12227 ) )
    :subtasks
    ( ( !DRIVE ?auto_12233 ?auto_12227 ?auto_12225 )
      ( MAKE-ON ?auto_12223 ?auto_12224 )
      ( MAKE-ON-VERIFY ?auto_12223 ?auto_12224 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12235 - SURFACE
      ?auto_12236 - SURFACE
    )
    :vars
    (
      ?auto_12237 - HOIST
      ?auto_12238 - PLACE
      ?auto_12240 - PLACE
      ?auto_12242 - HOIST
      ?auto_12244 - SURFACE
      ?auto_12246 - SURFACE
      ?auto_12245 - PLACE
      ?auto_12241 - HOIST
      ?auto_12243 - SURFACE
      ?auto_12239 - TRUCK
      ?auto_12247 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12237 ?auto_12238 ) ( IS-CRATE ?auto_12235 ) ( not ( = ?auto_12235 ?auto_12236 ) ) ( not ( = ?auto_12240 ?auto_12238 ) ) ( HOIST-AT ?auto_12242 ?auto_12240 ) ( not ( = ?auto_12237 ?auto_12242 ) ) ( AVAILABLE ?auto_12242 ) ( SURFACE-AT ?auto_12235 ?auto_12240 ) ( ON ?auto_12235 ?auto_12244 ) ( CLEAR ?auto_12235 ) ( not ( = ?auto_12235 ?auto_12244 ) ) ( not ( = ?auto_12236 ?auto_12244 ) ) ( IS-CRATE ?auto_12236 ) ( not ( = ?auto_12235 ?auto_12246 ) ) ( not ( = ?auto_12236 ?auto_12246 ) ) ( not ( = ?auto_12244 ?auto_12246 ) ) ( not ( = ?auto_12245 ?auto_12238 ) ) ( not ( = ?auto_12240 ?auto_12245 ) ) ( HOIST-AT ?auto_12241 ?auto_12245 ) ( not ( = ?auto_12237 ?auto_12241 ) ) ( not ( = ?auto_12242 ?auto_12241 ) ) ( AVAILABLE ?auto_12241 ) ( SURFACE-AT ?auto_12236 ?auto_12245 ) ( ON ?auto_12236 ?auto_12243 ) ( CLEAR ?auto_12236 ) ( not ( = ?auto_12235 ?auto_12243 ) ) ( not ( = ?auto_12236 ?auto_12243 ) ) ( not ( = ?auto_12244 ?auto_12243 ) ) ( not ( = ?auto_12246 ?auto_12243 ) ) ( TRUCK-AT ?auto_12239 ?auto_12238 ) ( SURFACE-AT ?auto_12247 ?auto_12238 ) ( CLEAR ?auto_12247 ) ( LIFTING ?auto_12237 ?auto_12246 ) ( IS-CRATE ?auto_12246 ) ( not ( = ?auto_12235 ?auto_12247 ) ) ( not ( = ?auto_12236 ?auto_12247 ) ) ( not ( = ?auto_12244 ?auto_12247 ) ) ( not ( = ?auto_12246 ?auto_12247 ) ) ( not ( = ?auto_12243 ?auto_12247 ) ) )
    :subtasks
    ( ( !DROP ?auto_12237 ?auto_12246 ?auto_12247 ?auto_12238 )
      ( MAKE-ON ?auto_12235 ?auto_12236 )
      ( MAKE-ON-VERIFY ?auto_12235 ?auto_12236 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12248 - SURFACE
      ?auto_12249 - SURFACE
    )
    :vars
    (
      ?auto_12252 - HOIST
      ?auto_12250 - PLACE
      ?auto_12257 - PLACE
      ?auto_12254 - HOIST
      ?auto_12260 - SURFACE
      ?auto_12258 - SURFACE
      ?auto_12253 - PLACE
      ?auto_12255 - HOIST
      ?auto_12259 - SURFACE
      ?auto_12256 - TRUCK
      ?auto_12251 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12252 ?auto_12250 ) ( IS-CRATE ?auto_12248 ) ( not ( = ?auto_12248 ?auto_12249 ) ) ( not ( = ?auto_12257 ?auto_12250 ) ) ( HOIST-AT ?auto_12254 ?auto_12257 ) ( not ( = ?auto_12252 ?auto_12254 ) ) ( AVAILABLE ?auto_12254 ) ( SURFACE-AT ?auto_12248 ?auto_12257 ) ( ON ?auto_12248 ?auto_12260 ) ( CLEAR ?auto_12248 ) ( not ( = ?auto_12248 ?auto_12260 ) ) ( not ( = ?auto_12249 ?auto_12260 ) ) ( IS-CRATE ?auto_12249 ) ( not ( = ?auto_12248 ?auto_12258 ) ) ( not ( = ?auto_12249 ?auto_12258 ) ) ( not ( = ?auto_12260 ?auto_12258 ) ) ( not ( = ?auto_12253 ?auto_12250 ) ) ( not ( = ?auto_12257 ?auto_12253 ) ) ( HOIST-AT ?auto_12255 ?auto_12253 ) ( not ( = ?auto_12252 ?auto_12255 ) ) ( not ( = ?auto_12254 ?auto_12255 ) ) ( AVAILABLE ?auto_12255 ) ( SURFACE-AT ?auto_12249 ?auto_12253 ) ( ON ?auto_12249 ?auto_12259 ) ( CLEAR ?auto_12249 ) ( not ( = ?auto_12248 ?auto_12259 ) ) ( not ( = ?auto_12249 ?auto_12259 ) ) ( not ( = ?auto_12260 ?auto_12259 ) ) ( not ( = ?auto_12258 ?auto_12259 ) ) ( TRUCK-AT ?auto_12256 ?auto_12250 ) ( SURFACE-AT ?auto_12251 ?auto_12250 ) ( CLEAR ?auto_12251 ) ( IS-CRATE ?auto_12258 ) ( not ( = ?auto_12248 ?auto_12251 ) ) ( not ( = ?auto_12249 ?auto_12251 ) ) ( not ( = ?auto_12260 ?auto_12251 ) ) ( not ( = ?auto_12258 ?auto_12251 ) ) ( not ( = ?auto_12259 ?auto_12251 ) ) ( AVAILABLE ?auto_12252 ) ( IN ?auto_12258 ?auto_12256 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12252 ?auto_12258 ?auto_12256 ?auto_12250 )
      ( MAKE-ON ?auto_12248 ?auto_12249 )
      ( MAKE-ON-VERIFY ?auto_12248 ?auto_12249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12261 - SURFACE
      ?auto_12262 - SURFACE
    )
    :vars
    (
      ?auto_12270 - HOIST
      ?auto_12271 - PLACE
      ?auto_12268 - PLACE
      ?auto_12273 - HOIST
      ?auto_12267 - SURFACE
      ?auto_12272 - SURFACE
      ?auto_12265 - PLACE
      ?auto_12266 - HOIST
      ?auto_12269 - SURFACE
      ?auto_12263 - SURFACE
      ?auto_12264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12270 ?auto_12271 ) ( IS-CRATE ?auto_12261 ) ( not ( = ?auto_12261 ?auto_12262 ) ) ( not ( = ?auto_12268 ?auto_12271 ) ) ( HOIST-AT ?auto_12273 ?auto_12268 ) ( not ( = ?auto_12270 ?auto_12273 ) ) ( AVAILABLE ?auto_12273 ) ( SURFACE-AT ?auto_12261 ?auto_12268 ) ( ON ?auto_12261 ?auto_12267 ) ( CLEAR ?auto_12261 ) ( not ( = ?auto_12261 ?auto_12267 ) ) ( not ( = ?auto_12262 ?auto_12267 ) ) ( IS-CRATE ?auto_12262 ) ( not ( = ?auto_12261 ?auto_12272 ) ) ( not ( = ?auto_12262 ?auto_12272 ) ) ( not ( = ?auto_12267 ?auto_12272 ) ) ( not ( = ?auto_12265 ?auto_12271 ) ) ( not ( = ?auto_12268 ?auto_12265 ) ) ( HOIST-AT ?auto_12266 ?auto_12265 ) ( not ( = ?auto_12270 ?auto_12266 ) ) ( not ( = ?auto_12273 ?auto_12266 ) ) ( AVAILABLE ?auto_12266 ) ( SURFACE-AT ?auto_12262 ?auto_12265 ) ( ON ?auto_12262 ?auto_12269 ) ( CLEAR ?auto_12262 ) ( not ( = ?auto_12261 ?auto_12269 ) ) ( not ( = ?auto_12262 ?auto_12269 ) ) ( not ( = ?auto_12267 ?auto_12269 ) ) ( not ( = ?auto_12272 ?auto_12269 ) ) ( SURFACE-AT ?auto_12263 ?auto_12271 ) ( CLEAR ?auto_12263 ) ( IS-CRATE ?auto_12272 ) ( not ( = ?auto_12261 ?auto_12263 ) ) ( not ( = ?auto_12262 ?auto_12263 ) ) ( not ( = ?auto_12267 ?auto_12263 ) ) ( not ( = ?auto_12272 ?auto_12263 ) ) ( not ( = ?auto_12269 ?auto_12263 ) ) ( AVAILABLE ?auto_12270 ) ( IN ?auto_12272 ?auto_12264 ) ( TRUCK-AT ?auto_12264 ?auto_12268 ) )
    :subtasks
    ( ( !DRIVE ?auto_12264 ?auto_12268 ?auto_12271 )
      ( MAKE-ON ?auto_12261 ?auto_12262 )
      ( MAKE-ON-VERIFY ?auto_12261 ?auto_12262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12274 - SURFACE
      ?auto_12275 - SURFACE
    )
    :vars
    (
      ?auto_12281 - HOIST
      ?auto_12284 - PLACE
      ?auto_12286 - PLACE
      ?auto_12280 - HOIST
      ?auto_12276 - SURFACE
      ?auto_12278 - SURFACE
      ?auto_12282 - PLACE
      ?auto_12279 - HOIST
      ?auto_12285 - SURFACE
      ?auto_12277 - SURFACE
      ?auto_12283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12281 ?auto_12284 ) ( IS-CRATE ?auto_12274 ) ( not ( = ?auto_12274 ?auto_12275 ) ) ( not ( = ?auto_12286 ?auto_12284 ) ) ( HOIST-AT ?auto_12280 ?auto_12286 ) ( not ( = ?auto_12281 ?auto_12280 ) ) ( SURFACE-AT ?auto_12274 ?auto_12286 ) ( ON ?auto_12274 ?auto_12276 ) ( CLEAR ?auto_12274 ) ( not ( = ?auto_12274 ?auto_12276 ) ) ( not ( = ?auto_12275 ?auto_12276 ) ) ( IS-CRATE ?auto_12275 ) ( not ( = ?auto_12274 ?auto_12278 ) ) ( not ( = ?auto_12275 ?auto_12278 ) ) ( not ( = ?auto_12276 ?auto_12278 ) ) ( not ( = ?auto_12282 ?auto_12284 ) ) ( not ( = ?auto_12286 ?auto_12282 ) ) ( HOIST-AT ?auto_12279 ?auto_12282 ) ( not ( = ?auto_12281 ?auto_12279 ) ) ( not ( = ?auto_12280 ?auto_12279 ) ) ( AVAILABLE ?auto_12279 ) ( SURFACE-AT ?auto_12275 ?auto_12282 ) ( ON ?auto_12275 ?auto_12285 ) ( CLEAR ?auto_12275 ) ( not ( = ?auto_12274 ?auto_12285 ) ) ( not ( = ?auto_12275 ?auto_12285 ) ) ( not ( = ?auto_12276 ?auto_12285 ) ) ( not ( = ?auto_12278 ?auto_12285 ) ) ( SURFACE-AT ?auto_12277 ?auto_12284 ) ( CLEAR ?auto_12277 ) ( IS-CRATE ?auto_12278 ) ( not ( = ?auto_12274 ?auto_12277 ) ) ( not ( = ?auto_12275 ?auto_12277 ) ) ( not ( = ?auto_12276 ?auto_12277 ) ) ( not ( = ?auto_12278 ?auto_12277 ) ) ( not ( = ?auto_12285 ?auto_12277 ) ) ( AVAILABLE ?auto_12281 ) ( TRUCK-AT ?auto_12283 ?auto_12286 ) ( LIFTING ?auto_12280 ?auto_12278 ) )
    :subtasks
    ( ( !LOAD ?auto_12280 ?auto_12278 ?auto_12283 ?auto_12286 )
      ( MAKE-ON ?auto_12274 ?auto_12275 )
      ( MAKE-ON-VERIFY ?auto_12274 ?auto_12275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12287 - SURFACE
      ?auto_12288 - SURFACE
    )
    :vars
    (
      ?auto_12299 - HOIST
      ?auto_12298 - PLACE
      ?auto_12295 - PLACE
      ?auto_12291 - HOIST
      ?auto_12296 - SURFACE
      ?auto_12292 - SURFACE
      ?auto_12293 - PLACE
      ?auto_12289 - HOIST
      ?auto_12290 - SURFACE
      ?auto_12297 - SURFACE
      ?auto_12294 - TRUCK
      ?auto_12300 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12299 ?auto_12298 ) ( IS-CRATE ?auto_12287 ) ( not ( = ?auto_12287 ?auto_12288 ) ) ( not ( = ?auto_12295 ?auto_12298 ) ) ( HOIST-AT ?auto_12291 ?auto_12295 ) ( not ( = ?auto_12299 ?auto_12291 ) ) ( SURFACE-AT ?auto_12287 ?auto_12295 ) ( ON ?auto_12287 ?auto_12296 ) ( CLEAR ?auto_12287 ) ( not ( = ?auto_12287 ?auto_12296 ) ) ( not ( = ?auto_12288 ?auto_12296 ) ) ( IS-CRATE ?auto_12288 ) ( not ( = ?auto_12287 ?auto_12292 ) ) ( not ( = ?auto_12288 ?auto_12292 ) ) ( not ( = ?auto_12296 ?auto_12292 ) ) ( not ( = ?auto_12293 ?auto_12298 ) ) ( not ( = ?auto_12295 ?auto_12293 ) ) ( HOIST-AT ?auto_12289 ?auto_12293 ) ( not ( = ?auto_12299 ?auto_12289 ) ) ( not ( = ?auto_12291 ?auto_12289 ) ) ( AVAILABLE ?auto_12289 ) ( SURFACE-AT ?auto_12288 ?auto_12293 ) ( ON ?auto_12288 ?auto_12290 ) ( CLEAR ?auto_12288 ) ( not ( = ?auto_12287 ?auto_12290 ) ) ( not ( = ?auto_12288 ?auto_12290 ) ) ( not ( = ?auto_12296 ?auto_12290 ) ) ( not ( = ?auto_12292 ?auto_12290 ) ) ( SURFACE-AT ?auto_12297 ?auto_12298 ) ( CLEAR ?auto_12297 ) ( IS-CRATE ?auto_12292 ) ( not ( = ?auto_12287 ?auto_12297 ) ) ( not ( = ?auto_12288 ?auto_12297 ) ) ( not ( = ?auto_12296 ?auto_12297 ) ) ( not ( = ?auto_12292 ?auto_12297 ) ) ( not ( = ?auto_12290 ?auto_12297 ) ) ( AVAILABLE ?auto_12299 ) ( TRUCK-AT ?auto_12294 ?auto_12295 ) ( AVAILABLE ?auto_12291 ) ( SURFACE-AT ?auto_12292 ?auto_12295 ) ( ON ?auto_12292 ?auto_12300 ) ( CLEAR ?auto_12292 ) ( not ( = ?auto_12287 ?auto_12300 ) ) ( not ( = ?auto_12288 ?auto_12300 ) ) ( not ( = ?auto_12296 ?auto_12300 ) ) ( not ( = ?auto_12292 ?auto_12300 ) ) ( not ( = ?auto_12290 ?auto_12300 ) ) ( not ( = ?auto_12297 ?auto_12300 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12291 ?auto_12292 ?auto_12300 ?auto_12295 )
      ( MAKE-ON ?auto_12287 ?auto_12288 )
      ( MAKE-ON-VERIFY ?auto_12287 ?auto_12288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12301 - SURFACE
      ?auto_12302 - SURFACE
    )
    :vars
    (
      ?auto_12307 - HOIST
      ?auto_12312 - PLACE
      ?auto_12306 - PLACE
      ?auto_12313 - HOIST
      ?auto_12305 - SURFACE
      ?auto_12311 - SURFACE
      ?auto_12310 - PLACE
      ?auto_12303 - HOIST
      ?auto_12308 - SURFACE
      ?auto_12309 - SURFACE
      ?auto_12314 - SURFACE
      ?auto_12304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12307 ?auto_12312 ) ( IS-CRATE ?auto_12301 ) ( not ( = ?auto_12301 ?auto_12302 ) ) ( not ( = ?auto_12306 ?auto_12312 ) ) ( HOIST-AT ?auto_12313 ?auto_12306 ) ( not ( = ?auto_12307 ?auto_12313 ) ) ( SURFACE-AT ?auto_12301 ?auto_12306 ) ( ON ?auto_12301 ?auto_12305 ) ( CLEAR ?auto_12301 ) ( not ( = ?auto_12301 ?auto_12305 ) ) ( not ( = ?auto_12302 ?auto_12305 ) ) ( IS-CRATE ?auto_12302 ) ( not ( = ?auto_12301 ?auto_12311 ) ) ( not ( = ?auto_12302 ?auto_12311 ) ) ( not ( = ?auto_12305 ?auto_12311 ) ) ( not ( = ?auto_12310 ?auto_12312 ) ) ( not ( = ?auto_12306 ?auto_12310 ) ) ( HOIST-AT ?auto_12303 ?auto_12310 ) ( not ( = ?auto_12307 ?auto_12303 ) ) ( not ( = ?auto_12313 ?auto_12303 ) ) ( AVAILABLE ?auto_12303 ) ( SURFACE-AT ?auto_12302 ?auto_12310 ) ( ON ?auto_12302 ?auto_12308 ) ( CLEAR ?auto_12302 ) ( not ( = ?auto_12301 ?auto_12308 ) ) ( not ( = ?auto_12302 ?auto_12308 ) ) ( not ( = ?auto_12305 ?auto_12308 ) ) ( not ( = ?auto_12311 ?auto_12308 ) ) ( SURFACE-AT ?auto_12309 ?auto_12312 ) ( CLEAR ?auto_12309 ) ( IS-CRATE ?auto_12311 ) ( not ( = ?auto_12301 ?auto_12309 ) ) ( not ( = ?auto_12302 ?auto_12309 ) ) ( not ( = ?auto_12305 ?auto_12309 ) ) ( not ( = ?auto_12311 ?auto_12309 ) ) ( not ( = ?auto_12308 ?auto_12309 ) ) ( AVAILABLE ?auto_12307 ) ( AVAILABLE ?auto_12313 ) ( SURFACE-AT ?auto_12311 ?auto_12306 ) ( ON ?auto_12311 ?auto_12314 ) ( CLEAR ?auto_12311 ) ( not ( = ?auto_12301 ?auto_12314 ) ) ( not ( = ?auto_12302 ?auto_12314 ) ) ( not ( = ?auto_12305 ?auto_12314 ) ) ( not ( = ?auto_12311 ?auto_12314 ) ) ( not ( = ?auto_12308 ?auto_12314 ) ) ( not ( = ?auto_12309 ?auto_12314 ) ) ( TRUCK-AT ?auto_12304 ?auto_12312 ) )
    :subtasks
    ( ( !DRIVE ?auto_12304 ?auto_12312 ?auto_12306 )
      ( MAKE-ON ?auto_12301 ?auto_12302 )
      ( MAKE-ON-VERIFY ?auto_12301 ?auto_12302 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12317 - SURFACE
      ?auto_12318 - SURFACE
    )
    :vars
    (
      ?auto_12319 - HOIST
      ?auto_12320 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12319 ?auto_12320 ) ( SURFACE-AT ?auto_12318 ?auto_12320 ) ( CLEAR ?auto_12318 ) ( LIFTING ?auto_12319 ?auto_12317 ) ( IS-CRATE ?auto_12317 ) ( not ( = ?auto_12317 ?auto_12318 ) ) )
    :subtasks
    ( ( !DROP ?auto_12319 ?auto_12317 ?auto_12318 ?auto_12320 )
      ( MAKE-ON-VERIFY ?auto_12317 ?auto_12318 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12321 - SURFACE
      ?auto_12322 - SURFACE
    )
    :vars
    (
      ?auto_12324 - HOIST
      ?auto_12323 - PLACE
      ?auto_12325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12324 ?auto_12323 ) ( SURFACE-AT ?auto_12322 ?auto_12323 ) ( CLEAR ?auto_12322 ) ( IS-CRATE ?auto_12321 ) ( not ( = ?auto_12321 ?auto_12322 ) ) ( TRUCK-AT ?auto_12325 ?auto_12323 ) ( AVAILABLE ?auto_12324 ) ( IN ?auto_12321 ?auto_12325 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12324 ?auto_12321 ?auto_12325 ?auto_12323 )
      ( MAKE-ON ?auto_12321 ?auto_12322 )
      ( MAKE-ON-VERIFY ?auto_12321 ?auto_12322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12326 - SURFACE
      ?auto_12327 - SURFACE
    )
    :vars
    (
      ?auto_12330 - HOIST
      ?auto_12328 - PLACE
      ?auto_12329 - TRUCK
      ?auto_12331 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12330 ?auto_12328 ) ( SURFACE-AT ?auto_12327 ?auto_12328 ) ( CLEAR ?auto_12327 ) ( IS-CRATE ?auto_12326 ) ( not ( = ?auto_12326 ?auto_12327 ) ) ( AVAILABLE ?auto_12330 ) ( IN ?auto_12326 ?auto_12329 ) ( TRUCK-AT ?auto_12329 ?auto_12331 ) ( not ( = ?auto_12331 ?auto_12328 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12329 ?auto_12331 ?auto_12328 )
      ( MAKE-ON ?auto_12326 ?auto_12327 )
      ( MAKE-ON-VERIFY ?auto_12326 ?auto_12327 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12332 - SURFACE
      ?auto_12333 - SURFACE
    )
    :vars
    (
      ?auto_12335 - HOIST
      ?auto_12337 - PLACE
      ?auto_12334 - TRUCK
      ?auto_12336 - PLACE
      ?auto_12338 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12335 ?auto_12337 ) ( SURFACE-AT ?auto_12333 ?auto_12337 ) ( CLEAR ?auto_12333 ) ( IS-CRATE ?auto_12332 ) ( not ( = ?auto_12332 ?auto_12333 ) ) ( AVAILABLE ?auto_12335 ) ( TRUCK-AT ?auto_12334 ?auto_12336 ) ( not ( = ?auto_12336 ?auto_12337 ) ) ( HOIST-AT ?auto_12338 ?auto_12336 ) ( LIFTING ?auto_12338 ?auto_12332 ) ( not ( = ?auto_12335 ?auto_12338 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12338 ?auto_12332 ?auto_12334 ?auto_12336 )
      ( MAKE-ON ?auto_12332 ?auto_12333 )
      ( MAKE-ON-VERIFY ?auto_12332 ?auto_12333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12339 - SURFACE
      ?auto_12340 - SURFACE
    )
    :vars
    (
      ?auto_12341 - HOIST
      ?auto_12344 - PLACE
      ?auto_12343 - TRUCK
      ?auto_12345 - PLACE
      ?auto_12342 - HOIST
      ?auto_12346 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12341 ?auto_12344 ) ( SURFACE-AT ?auto_12340 ?auto_12344 ) ( CLEAR ?auto_12340 ) ( IS-CRATE ?auto_12339 ) ( not ( = ?auto_12339 ?auto_12340 ) ) ( AVAILABLE ?auto_12341 ) ( TRUCK-AT ?auto_12343 ?auto_12345 ) ( not ( = ?auto_12345 ?auto_12344 ) ) ( HOIST-AT ?auto_12342 ?auto_12345 ) ( not ( = ?auto_12341 ?auto_12342 ) ) ( AVAILABLE ?auto_12342 ) ( SURFACE-AT ?auto_12339 ?auto_12345 ) ( ON ?auto_12339 ?auto_12346 ) ( CLEAR ?auto_12339 ) ( not ( = ?auto_12339 ?auto_12346 ) ) ( not ( = ?auto_12340 ?auto_12346 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12342 ?auto_12339 ?auto_12346 ?auto_12345 )
      ( MAKE-ON ?auto_12339 ?auto_12340 )
      ( MAKE-ON-VERIFY ?auto_12339 ?auto_12340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12347 - SURFACE
      ?auto_12348 - SURFACE
    )
    :vars
    (
      ?auto_12351 - HOIST
      ?auto_12352 - PLACE
      ?auto_12350 - PLACE
      ?auto_12353 - HOIST
      ?auto_12354 - SURFACE
      ?auto_12349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12351 ?auto_12352 ) ( SURFACE-AT ?auto_12348 ?auto_12352 ) ( CLEAR ?auto_12348 ) ( IS-CRATE ?auto_12347 ) ( not ( = ?auto_12347 ?auto_12348 ) ) ( AVAILABLE ?auto_12351 ) ( not ( = ?auto_12350 ?auto_12352 ) ) ( HOIST-AT ?auto_12353 ?auto_12350 ) ( not ( = ?auto_12351 ?auto_12353 ) ) ( AVAILABLE ?auto_12353 ) ( SURFACE-AT ?auto_12347 ?auto_12350 ) ( ON ?auto_12347 ?auto_12354 ) ( CLEAR ?auto_12347 ) ( not ( = ?auto_12347 ?auto_12354 ) ) ( not ( = ?auto_12348 ?auto_12354 ) ) ( TRUCK-AT ?auto_12349 ?auto_12352 ) )
    :subtasks
    ( ( !DRIVE ?auto_12349 ?auto_12352 ?auto_12350 )
      ( MAKE-ON ?auto_12347 ?auto_12348 )
      ( MAKE-ON-VERIFY ?auto_12347 ?auto_12348 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12355 - SURFACE
      ?auto_12356 - SURFACE
    )
    :vars
    (
      ?auto_12360 - HOIST
      ?auto_12361 - PLACE
      ?auto_12362 - PLACE
      ?auto_12358 - HOIST
      ?auto_12357 - SURFACE
      ?auto_12359 - TRUCK
      ?auto_12363 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12360 ?auto_12361 ) ( IS-CRATE ?auto_12355 ) ( not ( = ?auto_12355 ?auto_12356 ) ) ( not ( = ?auto_12362 ?auto_12361 ) ) ( HOIST-AT ?auto_12358 ?auto_12362 ) ( not ( = ?auto_12360 ?auto_12358 ) ) ( AVAILABLE ?auto_12358 ) ( SURFACE-AT ?auto_12355 ?auto_12362 ) ( ON ?auto_12355 ?auto_12357 ) ( CLEAR ?auto_12355 ) ( not ( = ?auto_12355 ?auto_12357 ) ) ( not ( = ?auto_12356 ?auto_12357 ) ) ( TRUCK-AT ?auto_12359 ?auto_12361 ) ( SURFACE-AT ?auto_12363 ?auto_12361 ) ( CLEAR ?auto_12363 ) ( LIFTING ?auto_12360 ?auto_12356 ) ( IS-CRATE ?auto_12356 ) ( not ( = ?auto_12355 ?auto_12363 ) ) ( not ( = ?auto_12356 ?auto_12363 ) ) ( not ( = ?auto_12357 ?auto_12363 ) ) )
    :subtasks
    ( ( !DROP ?auto_12360 ?auto_12356 ?auto_12363 ?auto_12361 )
      ( MAKE-ON ?auto_12355 ?auto_12356 )
      ( MAKE-ON-VERIFY ?auto_12355 ?auto_12356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12364 - SURFACE
      ?auto_12365 - SURFACE
    )
    :vars
    (
      ?auto_12370 - HOIST
      ?auto_12366 - PLACE
      ?auto_12367 - PLACE
      ?auto_12368 - HOIST
      ?auto_12371 - SURFACE
      ?auto_12369 - TRUCK
      ?auto_12372 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12370 ?auto_12366 ) ( IS-CRATE ?auto_12364 ) ( not ( = ?auto_12364 ?auto_12365 ) ) ( not ( = ?auto_12367 ?auto_12366 ) ) ( HOIST-AT ?auto_12368 ?auto_12367 ) ( not ( = ?auto_12370 ?auto_12368 ) ) ( AVAILABLE ?auto_12368 ) ( SURFACE-AT ?auto_12364 ?auto_12367 ) ( ON ?auto_12364 ?auto_12371 ) ( CLEAR ?auto_12364 ) ( not ( = ?auto_12364 ?auto_12371 ) ) ( not ( = ?auto_12365 ?auto_12371 ) ) ( TRUCK-AT ?auto_12369 ?auto_12366 ) ( SURFACE-AT ?auto_12372 ?auto_12366 ) ( CLEAR ?auto_12372 ) ( IS-CRATE ?auto_12365 ) ( not ( = ?auto_12364 ?auto_12372 ) ) ( not ( = ?auto_12365 ?auto_12372 ) ) ( not ( = ?auto_12371 ?auto_12372 ) ) ( AVAILABLE ?auto_12370 ) ( IN ?auto_12365 ?auto_12369 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12370 ?auto_12365 ?auto_12369 ?auto_12366 )
      ( MAKE-ON ?auto_12364 ?auto_12365 )
      ( MAKE-ON-VERIFY ?auto_12364 ?auto_12365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12373 - SURFACE
      ?auto_12374 - SURFACE
    )
    :vars
    (
      ?auto_12377 - HOIST
      ?auto_12375 - PLACE
      ?auto_12376 - PLACE
      ?auto_12381 - HOIST
      ?auto_12379 - SURFACE
      ?auto_12380 - SURFACE
      ?auto_12378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12377 ?auto_12375 ) ( IS-CRATE ?auto_12373 ) ( not ( = ?auto_12373 ?auto_12374 ) ) ( not ( = ?auto_12376 ?auto_12375 ) ) ( HOIST-AT ?auto_12381 ?auto_12376 ) ( not ( = ?auto_12377 ?auto_12381 ) ) ( AVAILABLE ?auto_12381 ) ( SURFACE-AT ?auto_12373 ?auto_12376 ) ( ON ?auto_12373 ?auto_12379 ) ( CLEAR ?auto_12373 ) ( not ( = ?auto_12373 ?auto_12379 ) ) ( not ( = ?auto_12374 ?auto_12379 ) ) ( SURFACE-AT ?auto_12380 ?auto_12375 ) ( CLEAR ?auto_12380 ) ( IS-CRATE ?auto_12374 ) ( not ( = ?auto_12373 ?auto_12380 ) ) ( not ( = ?auto_12374 ?auto_12380 ) ) ( not ( = ?auto_12379 ?auto_12380 ) ) ( AVAILABLE ?auto_12377 ) ( IN ?auto_12374 ?auto_12378 ) ( TRUCK-AT ?auto_12378 ?auto_12376 ) )
    :subtasks
    ( ( !DRIVE ?auto_12378 ?auto_12376 ?auto_12375 )
      ( MAKE-ON ?auto_12373 ?auto_12374 )
      ( MAKE-ON-VERIFY ?auto_12373 ?auto_12374 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12382 - SURFACE
      ?auto_12383 - SURFACE
    )
    :vars
    (
      ?auto_12389 - HOIST
      ?auto_12390 - PLACE
      ?auto_12387 - PLACE
      ?auto_12388 - HOIST
      ?auto_12386 - SURFACE
      ?auto_12384 - SURFACE
      ?auto_12385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12389 ?auto_12390 ) ( IS-CRATE ?auto_12382 ) ( not ( = ?auto_12382 ?auto_12383 ) ) ( not ( = ?auto_12387 ?auto_12390 ) ) ( HOIST-AT ?auto_12388 ?auto_12387 ) ( not ( = ?auto_12389 ?auto_12388 ) ) ( SURFACE-AT ?auto_12382 ?auto_12387 ) ( ON ?auto_12382 ?auto_12386 ) ( CLEAR ?auto_12382 ) ( not ( = ?auto_12382 ?auto_12386 ) ) ( not ( = ?auto_12383 ?auto_12386 ) ) ( SURFACE-AT ?auto_12384 ?auto_12390 ) ( CLEAR ?auto_12384 ) ( IS-CRATE ?auto_12383 ) ( not ( = ?auto_12382 ?auto_12384 ) ) ( not ( = ?auto_12383 ?auto_12384 ) ) ( not ( = ?auto_12386 ?auto_12384 ) ) ( AVAILABLE ?auto_12389 ) ( TRUCK-AT ?auto_12385 ?auto_12387 ) ( LIFTING ?auto_12388 ?auto_12383 ) )
    :subtasks
    ( ( !LOAD ?auto_12388 ?auto_12383 ?auto_12385 ?auto_12387 )
      ( MAKE-ON ?auto_12382 ?auto_12383 )
      ( MAKE-ON-VERIFY ?auto_12382 ?auto_12383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12391 - SURFACE
      ?auto_12392 - SURFACE
    )
    :vars
    (
      ?auto_12396 - HOIST
      ?auto_12398 - PLACE
      ?auto_12393 - PLACE
      ?auto_12397 - HOIST
      ?auto_12399 - SURFACE
      ?auto_12394 - SURFACE
      ?auto_12395 - TRUCK
      ?auto_12400 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12396 ?auto_12398 ) ( IS-CRATE ?auto_12391 ) ( not ( = ?auto_12391 ?auto_12392 ) ) ( not ( = ?auto_12393 ?auto_12398 ) ) ( HOIST-AT ?auto_12397 ?auto_12393 ) ( not ( = ?auto_12396 ?auto_12397 ) ) ( SURFACE-AT ?auto_12391 ?auto_12393 ) ( ON ?auto_12391 ?auto_12399 ) ( CLEAR ?auto_12391 ) ( not ( = ?auto_12391 ?auto_12399 ) ) ( not ( = ?auto_12392 ?auto_12399 ) ) ( SURFACE-AT ?auto_12394 ?auto_12398 ) ( CLEAR ?auto_12394 ) ( IS-CRATE ?auto_12392 ) ( not ( = ?auto_12391 ?auto_12394 ) ) ( not ( = ?auto_12392 ?auto_12394 ) ) ( not ( = ?auto_12399 ?auto_12394 ) ) ( AVAILABLE ?auto_12396 ) ( TRUCK-AT ?auto_12395 ?auto_12393 ) ( AVAILABLE ?auto_12397 ) ( SURFACE-AT ?auto_12392 ?auto_12393 ) ( ON ?auto_12392 ?auto_12400 ) ( CLEAR ?auto_12392 ) ( not ( = ?auto_12391 ?auto_12400 ) ) ( not ( = ?auto_12392 ?auto_12400 ) ) ( not ( = ?auto_12399 ?auto_12400 ) ) ( not ( = ?auto_12394 ?auto_12400 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12397 ?auto_12392 ?auto_12400 ?auto_12393 )
      ( MAKE-ON ?auto_12391 ?auto_12392 )
      ( MAKE-ON-VERIFY ?auto_12391 ?auto_12392 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12401 - SURFACE
      ?auto_12402 - SURFACE
    )
    :vars
    (
      ?auto_12409 - HOIST
      ?auto_12410 - PLACE
      ?auto_12407 - PLACE
      ?auto_12404 - HOIST
      ?auto_12403 - SURFACE
      ?auto_12405 - SURFACE
      ?auto_12408 - SURFACE
      ?auto_12406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12409 ?auto_12410 ) ( IS-CRATE ?auto_12401 ) ( not ( = ?auto_12401 ?auto_12402 ) ) ( not ( = ?auto_12407 ?auto_12410 ) ) ( HOIST-AT ?auto_12404 ?auto_12407 ) ( not ( = ?auto_12409 ?auto_12404 ) ) ( SURFACE-AT ?auto_12401 ?auto_12407 ) ( ON ?auto_12401 ?auto_12403 ) ( CLEAR ?auto_12401 ) ( not ( = ?auto_12401 ?auto_12403 ) ) ( not ( = ?auto_12402 ?auto_12403 ) ) ( SURFACE-AT ?auto_12405 ?auto_12410 ) ( CLEAR ?auto_12405 ) ( IS-CRATE ?auto_12402 ) ( not ( = ?auto_12401 ?auto_12405 ) ) ( not ( = ?auto_12402 ?auto_12405 ) ) ( not ( = ?auto_12403 ?auto_12405 ) ) ( AVAILABLE ?auto_12409 ) ( AVAILABLE ?auto_12404 ) ( SURFACE-AT ?auto_12402 ?auto_12407 ) ( ON ?auto_12402 ?auto_12408 ) ( CLEAR ?auto_12402 ) ( not ( = ?auto_12401 ?auto_12408 ) ) ( not ( = ?auto_12402 ?auto_12408 ) ) ( not ( = ?auto_12403 ?auto_12408 ) ) ( not ( = ?auto_12405 ?auto_12408 ) ) ( TRUCK-AT ?auto_12406 ?auto_12410 ) )
    :subtasks
    ( ( !DRIVE ?auto_12406 ?auto_12410 ?auto_12407 )
      ( MAKE-ON ?auto_12401 ?auto_12402 )
      ( MAKE-ON-VERIFY ?auto_12401 ?auto_12402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12411 - SURFACE
      ?auto_12412 - SURFACE
    )
    :vars
    (
      ?auto_12419 - HOIST
      ?auto_12413 - PLACE
      ?auto_12416 - PLACE
      ?auto_12415 - HOIST
      ?auto_12414 - SURFACE
      ?auto_12420 - SURFACE
      ?auto_12417 - SURFACE
      ?auto_12418 - TRUCK
      ?auto_12421 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12419 ?auto_12413 ) ( IS-CRATE ?auto_12411 ) ( not ( = ?auto_12411 ?auto_12412 ) ) ( not ( = ?auto_12416 ?auto_12413 ) ) ( HOIST-AT ?auto_12415 ?auto_12416 ) ( not ( = ?auto_12419 ?auto_12415 ) ) ( SURFACE-AT ?auto_12411 ?auto_12416 ) ( ON ?auto_12411 ?auto_12414 ) ( CLEAR ?auto_12411 ) ( not ( = ?auto_12411 ?auto_12414 ) ) ( not ( = ?auto_12412 ?auto_12414 ) ) ( IS-CRATE ?auto_12412 ) ( not ( = ?auto_12411 ?auto_12420 ) ) ( not ( = ?auto_12412 ?auto_12420 ) ) ( not ( = ?auto_12414 ?auto_12420 ) ) ( AVAILABLE ?auto_12415 ) ( SURFACE-AT ?auto_12412 ?auto_12416 ) ( ON ?auto_12412 ?auto_12417 ) ( CLEAR ?auto_12412 ) ( not ( = ?auto_12411 ?auto_12417 ) ) ( not ( = ?auto_12412 ?auto_12417 ) ) ( not ( = ?auto_12414 ?auto_12417 ) ) ( not ( = ?auto_12420 ?auto_12417 ) ) ( TRUCK-AT ?auto_12418 ?auto_12413 ) ( SURFACE-AT ?auto_12421 ?auto_12413 ) ( CLEAR ?auto_12421 ) ( LIFTING ?auto_12419 ?auto_12420 ) ( IS-CRATE ?auto_12420 ) ( not ( = ?auto_12411 ?auto_12421 ) ) ( not ( = ?auto_12412 ?auto_12421 ) ) ( not ( = ?auto_12414 ?auto_12421 ) ) ( not ( = ?auto_12420 ?auto_12421 ) ) ( not ( = ?auto_12417 ?auto_12421 ) ) )
    :subtasks
    ( ( !DROP ?auto_12419 ?auto_12420 ?auto_12421 ?auto_12413 )
      ( MAKE-ON ?auto_12411 ?auto_12412 )
      ( MAKE-ON-VERIFY ?auto_12411 ?auto_12412 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12422 - SURFACE
      ?auto_12423 - SURFACE
    )
    :vars
    (
      ?auto_12425 - HOIST
      ?auto_12424 - PLACE
      ?auto_12431 - PLACE
      ?auto_12427 - HOIST
      ?auto_12428 - SURFACE
      ?auto_12429 - SURFACE
      ?auto_12430 - SURFACE
      ?auto_12426 - TRUCK
      ?auto_12432 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12425 ?auto_12424 ) ( IS-CRATE ?auto_12422 ) ( not ( = ?auto_12422 ?auto_12423 ) ) ( not ( = ?auto_12431 ?auto_12424 ) ) ( HOIST-AT ?auto_12427 ?auto_12431 ) ( not ( = ?auto_12425 ?auto_12427 ) ) ( SURFACE-AT ?auto_12422 ?auto_12431 ) ( ON ?auto_12422 ?auto_12428 ) ( CLEAR ?auto_12422 ) ( not ( = ?auto_12422 ?auto_12428 ) ) ( not ( = ?auto_12423 ?auto_12428 ) ) ( IS-CRATE ?auto_12423 ) ( not ( = ?auto_12422 ?auto_12429 ) ) ( not ( = ?auto_12423 ?auto_12429 ) ) ( not ( = ?auto_12428 ?auto_12429 ) ) ( AVAILABLE ?auto_12427 ) ( SURFACE-AT ?auto_12423 ?auto_12431 ) ( ON ?auto_12423 ?auto_12430 ) ( CLEAR ?auto_12423 ) ( not ( = ?auto_12422 ?auto_12430 ) ) ( not ( = ?auto_12423 ?auto_12430 ) ) ( not ( = ?auto_12428 ?auto_12430 ) ) ( not ( = ?auto_12429 ?auto_12430 ) ) ( TRUCK-AT ?auto_12426 ?auto_12424 ) ( SURFACE-AT ?auto_12432 ?auto_12424 ) ( CLEAR ?auto_12432 ) ( IS-CRATE ?auto_12429 ) ( not ( = ?auto_12422 ?auto_12432 ) ) ( not ( = ?auto_12423 ?auto_12432 ) ) ( not ( = ?auto_12428 ?auto_12432 ) ) ( not ( = ?auto_12429 ?auto_12432 ) ) ( not ( = ?auto_12430 ?auto_12432 ) ) ( AVAILABLE ?auto_12425 ) ( IN ?auto_12429 ?auto_12426 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12425 ?auto_12429 ?auto_12426 ?auto_12424 )
      ( MAKE-ON ?auto_12422 ?auto_12423 )
      ( MAKE-ON-VERIFY ?auto_12422 ?auto_12423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12433 - SURFACE
      ?auto_12434 - SURFACE
    )
    :vars
    (
      ?auto_12438 - HOIST
      ?auto_12440 - PLACE
      ?auto_12439 - PLACE
      ?auto_12441 - HOIST
      ?auto_12436 - SURFACE
      ?auto_12442 - SURFACE
      ?auto_12437 - SURFACE
      ?auto_12443 - SURFACE
      ?auto_12435 - TRUCK
      ?auto_12444 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12438 ?auto_12440 ) ( IS-CRATE ?auto_12433 ) ( not ( = ?auto_12433 ?auto_12434 ) ) ( not ( = ?auto_12439 ?auto_12440 ) ) ( HOIST-AT ?auto_12441 ?auto_12439 ) ( not ( = ?auto_12438 ?auto_12441 ) ) ( SURFACE-AT ?auto_12433 ?auto_12439 ) ( ON ?auto_12433 ?auto_12436 ) ( CLEAR ?auto_12433 ) ( not ( = ?auto_12433 ?auto_12436 ) ) ( not ( = ?auto_12434 ?auto_12436 ) ) ( IS-CRATE ?auto_12434 ) ( not ( = ?auto_12433 ?auto_12442 ) ) ( not ( = ?auto_12434 ?auto_12442 ) ) ( not ( = ?auto_12436 ?auto_12442 ) ) ( AVAILABLE ?auto_12441 ) ( SURFACE-AT ?auto_12434 ?auto_12439 ) ( ON ?auto_12434 ?auto_12437 ) ( CLEAR ?auto_12434 ) ( not ( = ?auto_12433 ?auto_12437 ) ) ( not ( = ?auto_12434 ?auto_12437 ) ) ( not ( = ?auto_12436 ?auto_12437 ) ) ( not ( = ?auto_12442 ?auto_12437 ) ) ( SURFACE-AT ?auto_12443 ?auto_12440 ) ( CLEAR ?auto_12443 ) ( IS-CRATE ?auto_12442 ) ( not ( = ?auto_12433 ?auto_12443 ) ) ( not ( = ?auto_12434 ?auto_12443 ) ) ( not ( = ?auto_12436 ?auto_12443 ) ) ( not ( = ?auto_12442 ?auto_12443 ) ) ( not ( = ?auto_12437 ?auto_12443 ) ) ( AVAILABLE ?auto_12438 ) ( IN ?auto_12442 ?auto_12435 ) ( TRUCK-AT ?auto_12435 ?auto_12444 ) ( not ( = ?auto_12444 ?auto_12440 ) ) ( not ( = ?auto_12439 ?auto_12444 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12435 ?auto_12444 ?auto_12440 )
      ( MAKE-ON ?auto_12433 ?auto_12434 )
      ( MAKE-ON-VERIFY ?auto_12433 ?auto_12434 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12445 - SURFACE
      ?auto_12446 - SURFACE
    )
    :vars
    (
      ?auto_12454 - HOIST
      ?auto_12453 - PLACE
      ?auto_12449 - PLACE
      ?auto_12447 - HOIST
      ?auto_12448 - SURFACE
      ?auto_12452 - SURFACE
      ?auto_12450 - SURFACE
      ?auto_12455 - SURFACE
      ?auto_12451 - TRUCK
      ?auto_12456 - PLACE
      ?auto_12457 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12454 ?auto_12453 ) ( IS-CRATE ?auto_12445 ) ( not ( = ?auto_12445 ?auto_12446 ) ) ( not ( = ?auto_12449 ?auto_12453 ) ) ( HOIST-AT ?auto_12447 ?auto_12449 ) ( not ( = ?auto_12454 ?auto_12447 ) ) ( SURFACE-AT ?auto_12445 ?auto_12449 ) ( ON ?auto_12445 ?auto_12448 ) ( CLEAR ?auto_12445 ) ( not ( = ?auto_12445 ?auto_12448 ) ) ( not ( = ?auto_12446 ?auto_12448 ) ) ( IS-CRATE ?auto_12446 ) ( not ( = ?auto_12445 ?auto_12452 ) ) ( not ( = ?auto_12446 ?auto_12452 ) ) ( not ( = ?auto_12448 ?auto_12452 ) ) ( AVAILABLE ?auto_12447 ) ( SURFACE-AT ?auto_12446 ?auto_12449 ) ( ON ?auto_12446 ?auto_12450 ) ( CLEAR ?auto_12446 ) ( not ( = ?auto_12445 ?auto_12450 ) ) ( not ( = ?auto_12446 ?auto_12450 ) ) ( not ( = ?auto_12448 ?auto_12450 ) ) ( not ( = ?auto_12452 ?auto_12450 ) ) ( SURFACE-AT ?auto_12455 ?auto_12453 ) ( CLEAR ?auto_12455 ) ( IS-CRATE ?auto_12452 ) ( not ( = ?auto_12445 ?auto_12455 ) ) ( not ( = ?auto_12446 ?auto_12455 ) ) ( not ( = ?auto_12448 ?auto_12455 ) ) ( not ( = ?auto_12452 ?auto_12455 ) ) ( not ( = ?auto_12450 ?auto_12455 ) ) ( AVAILABLE ?auto_12454 ) ( TRUCK-AT ?auto_12451 ?auto_12456 ) ( not ( = ?auto_12456 ?auto_12453 ) ) ( not ( = ?auto_12449 ?auto_12456 ) ) ( HOIST-AT ?auto_12457 ?auto_12456 ) ( LIFTING ?auto_12457 ?auto_12452 ) ( not ( = ?auto_12454 ?auto_12457 ) ) ( not ( = ?auto_12447 ?auto_12457 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12457 ?auto_12452 ?auto_12451 ?auto_12456 )
      ( MAKE-ON ?auto_12445 ?auto_12446 )
      ( MAKE-ON-VERIFY ?auto_12445 ?auto_12446 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12458 - SURFACE
      ?auto_12459 - SURFACE
    )
    :vars
    (
      ?auto_12463 - HOIST
      ?auto_12470 - PLACE
      ?auto_12468 - PLACE
      ?auto_12462 - HOIST
      ?auto_12465 - SURFACE
      ?auto_12464 - SURFACE
      ?auto_12467 - SURFACE
      ?auto_12460 - SURFACE
      ?auto_12466 - TRUCK
      ?auto_12461 - PLACE
      ?auto_12469 - HOIST
      ?auto_12471 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12463 ?auto_12470 ) ( IS-CRATE ?auto_12458 ) ( not ( = ?auto_12458 ?auto_12459 ) ) ( not ( = ?auto_12468 ?auto_12470 ) ) ( HOIST-AT ?auto_12462 ?auto_12468 ) ( not ( = ?auto_12463 ?auto_12462 ) ) ( SURFACE-AT ?auto_12458 ?auto_12468 ) ( ON ?auto_12458 ?auto_12465 ) ( CLEAR ?auto_12458 ) ( not ( = ?auto_12458 ?auto_12465 ) ) ( not ( = ?auto_12459 ?auto_12465 ) ) ( IS-CRATE ?auto_12459 ) ( not ( = ?auto_12458 ?auto_12464 ) ) ( not ( = ?auto_12459 ?auto_12464 ) ) ( not ( = ?auto_12465 ?auto_12464 ) ) ( AVAILABLE ?auto_12462 ) ( SURFACE-AT ?auto_12459 ?auto_12468 ) ( ON ?auto_12459 ?auto_12467 ) ( CLEAR ?auto_12459 ) ( not ( = ?auto_12458 ?auto_12467 ) ) ( not ( = ?auto_12459 ?auto_12467 ) ) ( not ( = ?auto_12465 ?auto_12467 ) ) ( not ( = ?auto_12464 ?auto_12467 ) ) ( SURFACE-AT ?auto_12460 ?auto_12470 ) ( CLEAR ?auto_12460 ) ( IS-CRATE ?auto_12464 ) ( not ( = ?auto_12458 ?auto_12460 ) ) ( not ( = ?auto_12459 ?auto_12460 ) ) ( not ( = ?auto_12465 ?auto_12460 ) ) ( not ( = ?auto_12464 ?auto_12460 ) ) ( not ( = ?auto_12467 ?auto_12460 ) ) ( AVAILABLE ?auto_12463 ) ( TRUCK-AT ?auto_12466 ?auto_12461 ) ( not ( = ?auto_12461 ?auto_12470 ) ) ( not ( = ?auto_12468 ?auto_12461 ) ) ( HOIST-AT ?auto_12469 ?auto_12461 ) ( not ( = ?auto_12463 ?auto_12469 ) ) ( not ( = ?auto_12462 ?auto_12469 ) ) ( AVAILABLE ?auto_12469 ) ( SURFACE-AT ?auto_12464 ?auto_12461 ) ( ON ?auto_12464 ?auto_12471 ) ( CLEAR ?auto_12464 ) ( not ( = ?auto_12458 ?auto_12471 ) ) ( not ( = ?auto_12459 ?auto_12471 ) ) ( not ( = ?auto_12465 ?auto_12471 ) ) ( not ( = ?auto_12464 ?auto_12471 ) ) ( not ( = ?auto_12467 ?auto_12471 ) ) ( not ( = ?auto_12460 ?auto_12471 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12469 ?auto_12464 ?auto_12471 ?auto_12461 )
      ( MAKE-ON ?auto_12458 ?auto_12459 )
      ( MAKE-ON-VERIFY ?auto_12458 ?auto_12459 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12472 - SURFACE
      ?auto_12473 - SURFACE
    )
    :vars
    (
      ?auto_12480 - HOIST
      ?auto_12479 - PLACE
      ?auto_12484 - PLACE
      ?auto_12482 - HOIST
      ?auto_12483 - SURFACE
      ?auto_12476 - SURFACE
      ?auto_12478 - SURFACE
      ?auto_12474 - SURFACE
      ?auto_12475 - PLACE
      ?auto_12481 - HOIST
      ?auto_12485 - SURFACE
      ?auto_12477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12480 ?auto_12479 ) ( IS-CRATE ?auto_12472 ) ( not ( = ?auto_12472 ?auto_12473 ) ) ( not ( = ?auto_12484 ?auto_12479 ) ) ( HOIST-AT ?auto_12482 ?auto_12484 ) ( not ( = ?auto_12480 ?auto_12482 ) ) ( SURFACE-AT ?auto_12472 ?auto_12484 ) ( ON ?auto_12472 ?auto_12483 ) ( CLEAR ?auto_12472 ) ( not ( = ?auto_12472 ?auto_12483 ) ) ( not ( = ?auto_12473 ?auto_12483 ) ) ( IS-CRATE ?auto_12473 ) ( not ( = ?auto_12472 ?auto_12476 ) ) ( not ( = ?auto_12473 ?auto_12476 ) ) ( not ( = ?auto_12483 ?auto_12476 ) ) ( AVAILABLE ?auto_12482 ) ( SURFACE-AT ?auto_12473 ?auto_12484 ) ( ON ?auto_12473 ?auto_12478 ) ( CLEAR ?auto_12473 ) ( not ( = ?auto_12472 ?auto_12478 ) ) ( not ( = ?auto_12473 ?auto_12478 ) ) ( not ( = ?auto_12483 ?auto_12478 ) ) ( not ( = ?auto_12476 ?auto_12478 ) ) ( SURFACE-AT ?auto_12474 ?auto_12479 ) ( CLEAR ?auto_12474 ) ( IS-CRATE ?auto_12476 ) ( not ( = ?auto_12472 ?auto_12474 ) ) ( not ( = ?auto_12473 ?auto_12474 ) ) ( not ( = ?auto_12483 ?auto_12474 ) ) ( not ( = ?auto_12476 ?auto_12474 ) ) ( not ( = ?auto_12478 ?auto_12474 ) ) ( AVAILABLE ?auto_12480 ) ( not ( = ?auto_12475 ?auto_12479 ) ) ( not ( = ?auto_12484 ?auto_12475 ) ) ( HOIST-AT ?auto_12481 ?auto_12475 ) ( not ( = ?auto_12480 ?auto_12481 ) ) ( not ( = ?auto_12482 ?auto_12481 ) ) ( AVAILABLE ?auto_12481 ) ( SURFACE-AT ?auto_12476 ?auto_12475 ) ( ON ?auto_12476 ?auto_12485 ) ( CLEAR ?auto_12476 ) ( not ( = ?auto_12472 ?auto_12485 ) ) ( not ( = ?auto_12473 ?auto_12485 ) ) ( not ( = ?auto_12483 ?auto_12485 ) ) ( not ( = ?auto_12476 ?auto_12485 ) ) ( not ( = ?auto_12478 ?auto_12485 ) ) ( not ( = ?auto_12474 ?auto_12485 ) ) ( TRUCK-AT ?auto_12477 ?auto_12479 ) )
    :subtasks
    ( ( !DRIVE ?auto_12477 ?auto_12479 ?auto_12475 )
      ( MAKE-ON ?auto_12472 ?auto_12473 )
      ( MAKE-ON-VERIFY ?auto_12472 ?auto_12473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12486 - SURFACE
      ?auto_12487 - SURFACE
    )
    :vars
    (
      ?auto_12491 - HOIST
      ?auto_12498 - PLACE
      ?auto_12499 - PLACE
      ?auto_12495 - HOIST
      ?auto_12488 - SURFACE
      ?auto_12490 - SURFACE
      ?auto_12497 - SURFACE
      ?auto_12494 - SURFACE
      ?auto_12496 - PLACE
      ?auto_12489 - HOIST
      ?auto_12493 - SURFACE
      ?auto_12492 - TRUCK
      ?auto_12500 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12491 ?auto_12498 ) ( IS-CRATE ?auto_12486 ) ( not ( = ?auto_12486 ?auto_12487 ) ) ( not ( = ?auto_12499 ?auto_12498 ) ) ( HOIST-AT ?auto_12495 ?auto_12499 ) ( not ( = ?auto_12491 ?auto_12495 ) ) ( SURFACE-AT ?auto_12486 ?auto_12499 ) ( ON ?auto_12486 ?auto_12488 ) ( CLEAR ?auto_12486 ) ( not ( = ?auto_12486 ?auto_12488 ) ) ( not ( = ?auto_12487 ?auto_12488 ) ) ( IS-CRATE ?auto_12487 ) ( not ( = ?auto_12486 ?auto_12490 ) ) ( not ( = ?auto_12487 ?auto_12490 ) ) ( not ( = ?auto_12488 ?auto_12490 ) ) ( AVAILABLE ?auto_12495 ) ( SURFACE-AT ?auto_12487 ?auto_12499 ) ( ON ?auto_12487 ?auto_12497 ) ( CLEAR ?auto_12487 ) ( not ( = ?auto_12486 ?auto_12497 ) ) ( not ( = ?auto_12487 ?auto_12497 ) ) ( not ( = ?auto_12488 ?auto_12497 ) ) ( not ( = ?auto_12490 ?auto_12497 ) ) ( IS-CRATE ?auto_12490 ) ( not ( = ?auto_12486 ?auto_12494 ) ) ( not ( = ?auto_12487 ?auto_12494 ) ) ( not ( = ?auto_12488 ?auto_12494 ) ) ( not ( = ?auto_12490 ?auto_12494 ) ) ( not ( = ?auto_12497 ?auto_12494 ) ) ( not ( = ?auto_12496 ?auto_12498 ) ) ( not ( = ?auto_12499 ?auto_12496 ) ) ( HOIST-AT ?auto_12489 ?auto_12496 ) ( not ( = ?auto_12491 ?auto_12489 ) ) ( not ( = ?auto_12495 ?auto_12489 ) ) ( AVAILABLE ?auto_12489 ) ( SURFACE-AT ?auto_12490 ?auto_12496 ) ( ON ?auto_12490 ?auto_12493 ) ( CLEAR ?auto_12490 ) ( not ( = ?auto_12486 ?auto_12493 ) ) ( not ( = ?auto_12487 ?auto_12493 ) ) ( not ( = ?auto_12488 ?auto_12493 ) ) ( not ( = ?auto_12490 ?auto_12493 ) ) ( not ( = ?auto_12497 ?auto_12493 ) ) ( not ( = ?auto_12494 ?auto_12493 ) ) ( TRUCK-AT ?auto_12492 ?auto_12498 ) ( SURFACE-AT ?auto_12500 ?auto_12498 ) ( CLEAR ?auto_12500 ) ( LIFTING ?auto_12491 ?auto_12494 ) ( IS-CRATE ?auto_12494 ) ( not ( = ?auto_12486 ?auto_12500 ) ) ( not ( = ?auto_12487 ?auto_12500 ) ) ( not ( = ?auto_12488 ?auto_12500 ) ) ( not ( = ?auto_12490 ?auto_12500 ) ) ( not ( = ?auto_12497 ?auto_12500 ) ) ( not ( = ?auto_12494 ?auto_12500 ) ) ( not ( = ?auto_12493 ?auto_12500 ) ) )
    :subtasks
    ( ( !DROP ?auto_12491 ?auto_12494 ?auto_12500 ?auto_12498 )
      ( MAKE-ON ?auto_12486 ?auto_12487 )
      ( MAKE-ON-VERIFY ?auto_12486 ?auto_12487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12501 - SURFACE
      ?auto_12502 - SURFACE
    )
    :vars
    (
      ?auto_12515 - HOIST
      ?auto_12508 - PLACE
      ?auto_12511 - PLACE
      ?auto_12513 - HOIST
      ?auto_12505 - SURFACE
      ?auto_12506 - SURFACE
      ?auto_12507 - SURFACE
      ?auto_12510 - SURFACE
      ?auto_12509 - PLACE
      ?auto_12514 - HOIST
      ?auto_12503 - SURFACE
      ?auto_12504 - TRUCK
      ?auto_12512 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12515 ?auto_12508 ) ( IS-CRATE ?auto_12501 ) ( not ( = ?auto_12501 ?auto_12502 ) ) ( not ( = ?auto_12511 ?auto_12508 ) ) ( HOIST-AT ?auto_12513 ?auto_12511 ) ( not ( = ?auto_12515 ?auto_12513 ) ) ( SURFACE-AT ?auto_12501 ?auto_12511 ) ( ON ?auto_12501 ?auto_12505 ) ( CLEAR ?auto_12501 ) ( not ( = ?auto_12501 ?auto_12505 ) ) ( not ( = ?auto_12502 ?auto_12505 ) ) ( IS-CRATE ?auto_12502 ) ( not ( = ?auto_12501 ?auto_12506 ) ) ( not ( = ?auto_12502 ?auto_12506 ) ) ( not ( = ?auto_12505 ?auto_12506 ) ) ( AVAILABLE ?auto_12513 ) ( SURFACE-AT ?auto_12502 ?auto_12511 ) ( ON ?auto_12502 ?auto_12507 ) ( CLEAR ?auto_12502 ) ( not ( = ?auto_12501 ?auto_12507 ) ) ( not ( = ?auto_12502 ?auto_12507 ) ) ( not ( = ?auto_12505 ?auto_12507 ) ) ( not ( = ?auto_12506 ?auto_12507 ) ) ( IS-CRATE ?auto_12506 ) ( not ( = ?auto_12501 ?auto_12510 ) ) ( not ( = ?auto_12502 ?auto_12510 ) ) ( not ( = ?auto_12505 ?auto_12510 ) ) ( not ( = ?auto_12506 ?auto_12510 ) ) ( not ( = ?auto_12507 ?auto_12510 ) ) ( not ( = ?auto_12509 ?auto_12508 ) ) ( not ( = ?auto_12511 ?auto_12509 ) ) ( HOIST-AT ?auto_12514 ?auto_12509 ) ( not ( = ?auto_12515 ?auto_12514 ) ) ( not ( = ?auto_12513 ?auto_12514 ) ) ( AVAILABLE ?auto_12514 ) ( SURFACE-AT ?auto_12506 ?auto_12509 ) ( ON ?auto_12506 ?auto_12503 ) ( CLEAR ?auto_12506 ) ( not ( = ?auto_12501 ?auto_12503 ) ) ( not ( = ?auto_12502 ?auto_12503 ) ) ( not ( = ?auto_12505 ?auto_12503 ) ) ( not ( = ?auto_12506 ?auto_12503 ) ) ( not ( = ?auto_12507 ?auto_12503 ) ) ( not ( = ?auto_12510 ?auto_12503 ) ) ( TRUCK-AT ?auto_12504 ?auto_12508 ) ( SURFACE-AT ?auto_12512 ?auto_12508 ) ( CLEAR ?auto_12512 ) ( IS-CRATE ?auto_12510 ) ( not ( = ?auto_12501 ?auto_12512 ) ) ( not ( = ?auto_12502 ?auto_12512 ) ) ( not ( = ?auto_12505 ?auto_12512 ) ) ( not ( = ?auto_12506 ?auto_12512 ) ) ( not ( = ?auto_12507 ?auto_12512 ) ) ( not ( = ?auto_12510 ?auto_12512 ) ) ( not ( = ?auto_12503 ?auto_12512 ) ) ( AVAILABLE ?auto_12515 ) ( IN ?auto_12510 ?auto_12504 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12515 ?auto_12510 ?auto_12504 ?auto_12508 )
      ( MAKE-ON ?auto_12501 ?auto_12502 )
      ( MAKE-ON-VERIFY ?auto_12501 ?auto_12502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12516 - SURFACE
      ?auto_12517 - SURFACE
    )
    :vars
    (
      ?auto_12525 - HOIST
      ?auto_12520 - PLACE
      ?auto_12529 - PLACE
      ?auto_12530 - HOIST
      ?auto_12519 - SURFACE
      ?auto_12518 - SURFACE
      ?auto_12521 - SURFACE
      ?auto_12528 - SURFACE
      ?auto_12522 - PLACE
      ?auto_12524 - HOIST
      ?auto_12526 - SURFACE
      ?auto_12527 - SURFACE
      ?auto_12523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12525 ?auto_12520 ) ( IS-CRATE ?auto_12516 ) ( not ( = ?auto_12516 ?auto_12517 ) ) ( not ( = ?auto_12529 ?auto_12520 ) ) ( HOIST-AT ?auto_12530 ?auto_12529 ) ( not ( = ?auto_12525 ?auto_12530 ) ) ( SURFACE-AT ?auto_12516 ?auto_12529 ) ( ON ?auto_12516 ?auto_12519 ) ( CLEAR ?auto_12516 ) ( not ( = ?auto_12516 ?auto_12519 ) ) ( not ( = ?auto_12517 ?auto_12519 ) ) ( IS-CRATE ?auto_12517 ) ( not ( = ?auto_12516 ?auto_12518 ) ) ( not ( = ?auto_12517 ?auto_12518 ) ) ( not ( = ?auto_12519 ?auto_12518 ) ) ( AVAILABLE ?auto_12530 ) ( SURFACE-AT ?auto_12517 ?auto_12529 ) ( ON ?auto_12517 ?auto_12521 ) ( CLEAR ?auto_12517 ) ( not ( = ?auto_12516 ?auto_12521 ) ) ( not ( = ?auto_12517 ?auto_12521 ) ) ( not ( = ?auto_12519 ?auto_12521 ) ) ( not ( = ?auto_12518 ?auto_12521 ) ) ( IS-CRATE ?auto_12518 ) ( not ( = ?auto_12516 ?auto_12528 ) ) ( not ( = ?auto_12517 ?auto_12528 ) ) ( not ( = ?auto_12519 ?auto_12528 ) ) ( not ( = ?auto_12518 ?auto_12528 ) ) ( not ( = ?auto_12521 ?auto_12528 ) ) ( not ( = ?auto_12522 ?auto_12520 ) ) ( not ( = ?auto_12529 ?auto_12522 ) ) ( HOIST-AT ?auto_12524 ?auto_12522 ) ( not ( = ?auto_12525 ?auto_12524 ) ) ( not ( = ?auto_12530 ?auto_12524 ) ) ( AVAILABLE ?auto_12524 ) ( SURFACE-AT ?auto_12518 ?auto_12522 ) ( ON ?auto_12518 ?auto_12526 ) ( CLEAR ?auto_12518 ) ( not ( = ?auto_12516 ?auto_12526 ) ) ( not ( = ?auto_12517 ?auto_12526 ) ) ( not ( = ?auto_12519 ?auto_12526 ) ) ( not ( = ?auto_12518 ?auto_12526 ) ) ( not ( = ?auto_12521 ?auto_12526 ) ) ( not ( = ?auto_12528 ?auto_12526 ) ) ( SURFACE-AT ?auto_12527 ?auto_12520 ) ( CLEAR ?auto_12527 ) ( IS-CRATE ?auto_12528 ) ( not ( = ?auto_12516 ?auto_12527 ) ) ( not ( = ?auto_12517 ?auto_12527 ) ) ( not ( = ?auto_12519 ?auto_12527 ) ) ( not ( = ?auto_12518 ?auto_12527 ) ) ( not ( = ?auto_12521 ?auto_12527 ) ) ( not ( = ?auto_12528 ?auto_12527 ) ) ( not ( = ?auto_12526 ?auto_12527 ) ) ( AVAILABLE ?auto_12525 ) ( IN ?auto_12528 ?auto_12523 ) ( TRUCK-AT ?auto_12523 ?auto_12529 ) )
    :subtasks
    ( ( !DRIVE ?auto_12523 ?auto_12529 ?auto_12520 )
      ( MAKE-ON ?auto_12516 ?auto_12517 )
      ( MAKE-ON-VERIFY ?auto_12516 ?auto_12517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12531 - SURFACE
      ?auto_12532 - SURFACE
    )
    :vars
    (
      ?auto_12536 - HOIST
      ?auto_12543 - PLACE
      ?auto_12533 - PLACE
      ?auto_12540 - HOIST
      ?auto_12535 - SURFACE
      ?auto_12541 - SURFACE
      ?auto_12545 - SURFACE
      ?auto_12544 - SURFACE
      ?auto_12539 - PLACE
      ?auto_12534 - HOIST
      ?auto_12537 - SURFACE
      ?auto_12538 - SURFACE
      ?auto_12542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12536 ?auto_12543 ) ( IS-CRATE ?auto_12531 ) ( not ( = ?auto_12531 ?auto_12532 ) ) ( not ( = ?auto_12533 ?auto_12543 ) ) ( HOIST-AT ?auto_12540 ?auto_12533 ) ( not ( = ?auto_12536 ?auto_12540 ) ) ( SURFACE-AT ?auto_12531 ?auto_12533 ) ( ON ?auto_12531 ?auto_12535 ) ( CLEAR ?auto_12531 ) ( not ( = ?auto_12531 ?auto_12535 ) ) ( not ( = ?auto_12532 ?auto_12535 ) ) ( IS-CRATE ?auto_12532 ) ( not ( = ?auto_12531 ?auto_12541 ) ) ( not ( = ?auto_12532 ?auto_12541 ) ) ( not ( = ?auto_12535 ?auto_12541 ) ) ( SURFACE-AT ?auto_12532 ?auto_12533 ) ( ON ?auto_12532 ?auto_12545 ) ( CLEAR ?auto_12532 ) ( not ( = ?auto_12531 ?auto_12545 ) ) ( not ( = ?auto_12532 ?auto_12545 ) ) ( not ( = ?auto_12535 ?auto_12545 ) ) ( not ( = ?auto_12541 ?auto_12545 ) ) ( IS-CRATE ?auto_12541 ) ( not ( = ?auto_12531 ?auto_12544 ) ) ( not ( = ?auto_12532 ?auto_12544 ) ) ( not ( = ?auto_12535 ?auto_12544 ) ) ( not ( = ?auto_12541 ?auto_12544 ) ) ( not ( = ?auto_12545 ?auto_12544 ) ) ( not ( = ?auto_12539 ?auto_12543 ) ) ( not ( = ?auto_12533 ?auto_12539 ) ) ( HOIST-AT ?auto_12534 ?auto_12539 ) ( not ( = ?auto_12536 ?auto_12534 ) ) ( not ( = ?auto_12540 ?auto_12534 ) ) ( AVAILABLE ?auto_12534 ) ( SURFACE-AT ?auto_12541 ?auto_12539 ) ( ON ?auto_12541 ?auto_12537 ) ( CLEAR ?auto_12541 ) ( not ( = ?auto_12531 ?auto_12537 ) ) ( not ( = ?auto_12532 ?auto_12537 ) ) ( not ( = ?auto_12535 ?auto_12537 ) ) ( not ( = ?auto_12541 ?auto_12537 ) ) ( not ( = ?auto_12545 ?auto_12537 ) ) ( not ( = ?auto_12544 ?auto_12537 ) ) ( SURFACE-AT ?auto_12538 ?auto_12543 ) ( CLEAR ?auto_12538 ) ( IS-CRATE ?auto_12544 ) ( not ( = ?auto_12531 ?auto_12538 ) ) ( not ( = ?auto_12532 ?auto_12538 ) ) ( not ( = ?auto_12535 ?auto_12538 ) ) ( not ( = ?auto_12541 ?auto_12538 ) ) ( not ( = ?auto_12545 ?auto_12538 ) ) ( not ( = ?auto_12544 ?auto_12538 ) ) ( not ( = ?auto_12537 ?auto_12538 ) ) ( AVAILABLE ?auto_12536 ) ( TRUCK-AT ?auto_12542 ?auto_12533 ) ( LIFTING ?auto_12540 ?auto_12544 ) )
    :subtasks
    ( ( !LOAD ?auto_12540 ?auto_12544 ?auto_12542 ?auto_12533 )
      ( MAKE-ON ?auto_12531 ?auto_12532 )
      ( MAKE-ON-VERIFY ?auto_12531 ?auto_12532 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12546 - SURFACE
      ?auto_12547 - SURFACE
    )
    :vars
    (
      ?auto_12560 - HOIST
      ?auto_12548 - PLACE
      ?auto_12557 - PLACE
      ?auto_12555 - HOIST
      ?auto_12549 - SURFACE
      ?auto_12558 - SURFACE
      ?auto_12554 - SURFACE
      ?auto_12550 - SURFACE
      ?auto_12559 - PLACE
      ?auto_12553 - HOIST
      ?auto_12556 - SURFACE
      ?auto_12552 - SURFACE
      ?auto_12551 - TRUCK
      ?auto_12561 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12560 ?auto_12548 ) ( IS-CRATE ?auto_12546 ) ( not ( = ?auto_12546 ?auto_12547 ) ) ( not ( = ?auto_12557 ?auto_12548 ) ) ( HOIST-AT ?auto_12555 ?auto_12557 ) ( not ( = ?auto_12560 ?auto_12555 ) ) ( SURFACE-AT ?auto_12546 ?auto_12557 ) ( ON ?auto_12546 ?auto_12549 ) ( CLEAR ?auto_12546 ) ( not ( = ?auto_12546 ?auto_12549 ) ) ( not ( = ?auto_12547 ?auto_12549 ) ) ( IS-CRATE ?auto_12547 ) ( not ( = ?auto_12546 ?auto_12558 ) ) ( not ( = ?auto_12547 ?auto_12558 ) ) ( not ( = ?auto_12549 ?auto_12558 ) ) ( SURFACE-AT ?auto_12547 ?auto_12557 ) ( ON ?auto_12547 ?auto_12554 ) ( CLEAR ?auto_12547 ) ( not ( = ?auto_12546 ?auto_12554 ) ) ( not ( = ?auto_12547 ?auto_12554 ) ) ( not ( = ?auto_12549 ?auto_12554 ) ) ( not ( = ?auto_12558 ?auto_12554 ) ) ( IS-CRATE ?auto_12558 ) ( not ( = ?auto_12546 ?auto_12550 ) ) ( not ( = ?auto_12547 ?auto_12550 ) ) ( not ( = ?auto_12549 ?auto_12550 ) ) ( not ( = ?auto_12558 ?auto_12550 ) ) ( not ( = ?auto_12554 ?auto_12550 ) ) ( not ( = ?auto_12559 ?auto_12548 ) ) ( not ( = ?auto_12557 ?auto_12559 ) ) ( HOIST-AT ?auto_12553 ?auto_12559 ) ( not ( = ?auto_12560 ?auto_12553 ) ) ( not ( = ?auto_12555 ?auto_12553 ) ) ( AVAILABLE ?auto_12553 ) ( SURFACE-AT ?auto_12558 ?auto_12559 ) ( ON ?auto_12558 ?auto_12556 ) ( CLEAR ?auto_12558 ) ( not ( = ?auto_12546 ?auto_12556 ) ) ( not ( = ?auto_12547 ?auto_12556 ) ) ( not ( = ?auto_12549 ?auto_12556 ) ) ( not ( = ?auto_12558 ?auto_12556 ) ) ( not ( = ?auto_12554 ?auto_12556 ) ) ( not ( = ?auto_12550 ?auto_12556 ) ) ( SURFACE-AT ?auto_12552 ?auto_12548 ) ( CLEAR ?auto_12552 ) ( IS-CRATE ?auto_12550 ) ( not ( = ?auto_12546 ?auto_12552 ) ) ( not ( = ?auto_12547 ?auto_12552 ) ) ( not ( = ?auto_12549 ?auto_12552 ) ) ( not ( = ?auto_12558 ?auto_12552 ) ) ( not ( = ?auto_12554 ?auto_12552 ) ) ( not ( = ?auto_12550 ?auto_12552 ) ) ( not ( = ?auto_12556 ?auto_12552 ) ) ( AVAILABLE ?auto_12560 ) ( TRUCK-AT ?auto_12551 ?auto_12557 ) ( AVAILABLE ?auto_12555 ) ( SURFACE-AT ?auto_12550 ?auto_12557 ) ( ON ?auto_12550 ?auto_12561 ) ( CLEAR ?auto_12550 ) ( not ( = ?auto_12546 ?auto_12561 ) ) ( not ( = ?auto_12547 ?auto_12561 ) ) ( not ( = ?auto_12549 ?auto_12561 ) ) ( not ( = ?auto_12558 ?auto_12561 ) ) ( not ( = ?auto_12554 ?auto_12561 ) ) ( not ( = ?auto_12550 ?auto_12561 ) ) ( not ( = ?auto_12556 ?auto_12561 ) ) ( not ( = ?auto_12552 ?auto_12561 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12555 ?auto_12550 ?auto_12561 ?auto_12557 )
      ( MAKE-ON ?auto_12546 ?auto_12547 )
      ( MAKE-ON-VERIFY ?auto_12546 ?auto_12547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12562 - SURFACE
      ?auto_12563 - SURFACE
    )
    :vars
    (
      ?auto_12576 - HOIST
      ?auto_12570 - PLACE
      ?auto_12564 - PLACE
      ?auto_12575 - HOIST
      ?auto_12573 - SURFACE
      ?auto_12567 - SURFACE
      ?auto_12577 - SURFACE
      ?auto_12565 - SURFACE
      ?auto_12572 - PLACE
      ?auto_12566 - HOIST
      ?auto_12568 - SURFACE
      ?auto_12569 - SURFACE
      ?auto_12571 - SURFACE
      ?auto_12574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12576 ?auto_12570 ) ( IS-CRATE ?auto_12562 ) ( not ( = ?auto_12562 ?auto_12563 ) ) ( not ( = ?auto_12564 ?auto_12570 ) ) ( HOIST-AT ?auto_12575 ?auto_12564 ) ( not ( = ?auto_12576 ?auto_12575 ) ) ( SURFACE-AT ?auto_12562 ?auto_12564 ) ( ON ?auto_12562 ?auto_12573 ) ( CLEAR ?auto_12562 ) ( not ( = ?auto_12562 ?auto_12573 ) ) ( not ( = ?auto_12563 ?auto_12573 ) ) ( IS-CRATE ?auto_12563 ) ( not ( = ?auto_12562 ?auto_12567 ) ) ( not ( = ?auto_12563 ?auto_12567 ) ) ( not ( = ?auto_12573 ?auto_12567 ) ) ( SURFACE-AT ?auto_12563 ?auto_12564 ) ( ON ?auto_12563 ?auto_12577 ) ( CLEAR ?auto_12563 ) ( not ( = ?auto_12562 ?auto_12577 ) ) ( not ( = ?auto_12563 ?auto_12577 ) ) ( not ( = ?auto_12573 ?auto_12577 ) ) ( not ( = ?auto_12567 ?auto_12577 ) ) ( IS-CRATE ?auto_12567 ) ( not ( = ?auto_12562 ?auto_12565 ) ) ( not ( = ?auto_12563 ?auto_12565 ) ) ( not ( = ?auto_12573 ?auto_12565 ) ) ( not ( = ?auto_12567 ?auto_12565 ) ) ( not ( = ?auto_12577 ?auto_12565 ) ) ( not ( = ?auto_12572 ?auto_12570 ) ) ( not ( = ?auto_12564 ?auto_12572 ) ) ( HOIST-AT ?auto_12566 ?auto_12572 ) ( not ( = ?auto_12576 ?auto_12566 ) ) ( not ( = ?auto_12575 ?auto_12566 ) ) ( AVAILABLE ?auto_12566 ) ( SURFACE-AT ?auto_12567 ?auto_12572 ) ( ON ?auto_12567 ?auto_12568 ) ( CLEAR ?auto_12567 ) ( not ( = ?auto_12562 ?auto_12568 ) ) ( not ( = ?auto_12563 ?auto_12568 ) ) ( not ( = ?auto_12573 ?auto_12568 ) ) ( not ( = ?auto_12567 ?auto_12568 ) ) ( not ( = ?auto_12577 ?auto_12568 ) ) ( not ( = ?auto_12565 ?auto_12568 ) ) ( SURFACE-AT ?auto_12569 ?auto_12570 ) ( CLEAR ?auto_12569 ) ( IS-CRATE ?auto_12565 ) ( not ( = ?auto_12562 ?auto_12569 ) ) ( not ( = ?auto_12563 ?auto_12569 ) ) ( not ( = ?auto_12573 ?auto_12569 ) ) ( not ( = ?auto_12567 ?auto_12569 ) ) ( not ( = ?auto_12577 ?auto_12569 ) ) ( not ( = ?auto_12565 ?auto_12569 ) ) ( not ( = ?auto_12568 ?auto_12569 ) ) ( AVAILABLE ?auto_12576 ) ( AVAILABLE ?auto_12575 ) ( SURFACE-AT ?auto_12565 ?auto_12564 ) ( ON ?auto_12565 ?auto_12571 ) ( CLEAR ?auto_12565 ) ( not ( = ?auto_12562 ?auto_12571 ) ) ( not ( = ?auto_12563 ?auto_12571 ) ) ( not ( = ?auto_12573 ?auto_12571 ) ) ( not ( = ?auto_12567 ?auto_12571 ) ) ( not ( = ?auto_12577 ?auto_12571 ) ) ( not ( = ?auto_12565 ?auto_12571 ) ) ( not ( = ?auto_12568 ?auto_12571 ) ) ( not ( = ?auto_12569 ?auto_12571 ) ) ( TRUCK-AT ?auto_12574 ?auto_12570 ) )
    :subtasks
    ( ( !DRIVE ?auto_12574 ?auto_12570 ?auto_12564 )
      ( MAKE-ON ?auto_12562 ?auto_12563 )
      ( MAKE-ON-VERIFY ?auto_12562 ?auto_12563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12580 - SURFACE
      ?auto_12581 - SURFACE
    )
    :vars
    (
      ?auto_12582 - HOIST
      ?auto_12583 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12582 ?auto_12583 ) ( SURFACE-AT ?auto_12581 ?auto_12583 ) ( CLEAR ?auto_12581 ) ( LIFTING ?auto_12582 ?auto_12580 ) ( IS-CRATE ?auto_12580 ) ( not ( = ?auto_12580 ?auto_12581 ) ) )
    :subtasks
    ( ( !DROP ?auto_12582 ?auto_12580 ?auto_12581 ?auto_12583 )
      ( MAKE-ON-VERIFY ?auto_12580 ?auto_12581 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12584 - SURFACE
      ?auto_12585 - SURFACE
    )
    :vars
    (
      ?auto_12586 - HOIST
      ?auto_12587 - PLACE
      ?auto_12588 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12586 ?auto_12587 ) ( SURFACE-AT ?auto_12585 ?auto_12587 ) ( CLEAR ?auto_12585 ) ( IS-CRATE ?auto_12584 ) ( not ( = ?auto_12584 ?auto_12585 ) ) ( TRUCK-AT ?auto_12588 ?auto_12587 ) ( AVAILABLE ?auto_12586 ) ( IN ?auto_12584 ?auto_12588 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12586 ?auto_12584 ?auto_12588 ?auto_12587 )
      ( MAKE-ON ?auto_12584 ?auto_12585 )
      ( MAKE-ON-VERIFY ?auto_12584 ?auto_12585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12589 - SURFACE
      ?auto_12590 - SURFACE
    )
    :vars
    (
      ?auto_12591 - HOIST
      ?auto_12593 - PLACE
      ?auto_12592 - TRUCK
      ?auto_12594 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12591 ?auto_12593 ) ( SURFACE-AT ?auto_12590 ?auto_12593 ) ( CLEAR ?auto_12590 ) ( IS-CRATE ?auto_12589 ) ( not ( = ?auto_12589 ?auto_12590 ) ) ( AVAILABLE ?auto_12591 ) ( IN ?auto_12589 ?auto_12592 ) ( TRUCK-AT ?auto_12592 ?auto_12594 ) ( not ( = ?auto_12594 ?auto_12593 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12592 ?auto_12594 ?auto_12593 )
      ( MAKE-ON ?auto_12589 ?auto_12590 )
      ( MAKE-ON-VERIFY ?auto_12589 ?auto_12590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12595 - SURFACE
      ?auto_12596 - SURFACE
    )
    :vars
    (
      ?auto_12598 - HOIST
      ?auto_12597 - PLACE
      ?auto_12600 - TRUCK
      ?auto_12599 - PLACE
      ?auto_12601 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12598 ?auto_12597 ) ( SURFACE-AT ?auto_12596 ?auto_12597 ) ( CLEAR ?auto_12596 ) ( IS-CRATE ?auto_12595 ) ( not ( = ?auto_12595 ?auto_12596 ) ) ( AVAILABLE ?auto_12598 ) ( TRUCK-AT ?auto_12600 ?auto_12599 ) ( not ( = ?auto_12599 ?auto_12597 ) ) ( HOIST-AT ?auto_12601 ?auto_12599 ) ( LIFTING ?auto_12601 ?auto_12595 ) ( not ( = ?auto_12598 ?auto_12601 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12601 ?auto_12595 ?auto_12600 ?auto_12599 )
      ( MAKE-ON ?auto_12595 ?auto_12596 )
      ( MAKE-ON-VERIFY ?auto_12595 ?auto_12596 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12602 - SURFACE
      ?auto_12603 - SURFACE
    )
    :vars
    (
      ?auto_12608 - HOIST
      ?auto_12606 - PLACE
      ?auto_12607 - TRUCK
      ?auto_12605 - PLACE
      ?auto_12604 - HOIST
      ?auto_12609 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12608 ?auto_12606 ) ( SURFACE-AT ?auto_12603 ?auto_12606 ) ( CLEAR ?auto_12603 ) ( IS-CRATE ?auto_12602 ) ( not ( = ?auto_12602 ?auto_12603 ) ) ( AVAILABLE ?auto_12608 ) ( TRUCK-AT ?auto_12607 ?auto_12605 ) ( not ( = ?auto_12605 ?auto_12606 ) ) ( HOIST-AT ?auto_12604 ?auto_12605 ) ( not ( = ?auto_12608 ?auto_12604 ) ) ( AVAILABLE ?auto_12604 ) ( SURFACE-AT ?auto_12602 ?auto_12605 ) ( ON ?auto_12602 ?auto_12609 ) ( CLEAR ?auto_12602 ) ( not ( = ?auto_12602 ?auto_12609 ) ) ( not ( = ?auto_12603 ?auto_12609 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12604 ?auto_12602 ?auto_12609 ?auto_12605 )
      ( MAKE-ON ?auto_12602 ?auto_12603 )
      ( MAKE-ON-VERIFY ?auto_12602 ?auto_12603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12610 - SURFACE
      ?auto_12611 - SURFACE
    )
    :vars
    (
      ?auto_12613 - HOIST
      ?auto_12612 - PLACE
      ?auto_12616 - PLACE
      ?auto_12614 - HOIST
      ?auto_12615 - SURFACE
      ?auto_12617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12613 ?auto_12612 ) ( SURFACE-AT ?auto_12611 ?auto_12612 ) ( CLEAR ?auto_12611 ) ( IS-CRATE ?auto_12610 ) ( not ( = ?auto_12610 ?auto_12611 ) ) ( AVAILABLE ?auto_12613 ) ( not ( = ?auto_12616 ?auto_12612 ) ) ( HOIST-AT ?auto_12614 ?auto_12616 ) ( not ( = ?auto_12613 ?auto_12614 ) ) ( AVAILABLE ?auto_12614 ) ( SURFACE-AT ?auto_12610 ?auto_12616 ) ( ON ?auto_12610 ?auto_12615 ) ( CLEAR ?auto_12610 ) ( not ( = ?auto_12610 ?auto_12615 ) ) ( not ( = ?auto_12611 ?auto_12615 ) ) ( TRUCK-AT ?auto_12617 ?auto_12612 ) )
    :subtasks
    ( ( !DRIVE ?auto_12617 ?auto_12612 ?auto_12616 )
      ( MAKE-ON ?auto_12610 ?auto_12611 )
      ( MAKE-ON-VERIFY ?auto_12610 ?auto_12611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12618 - SURFACE
      ?auto_12619 - SURFACE
    )
    :vars
    (
      ?auto_12622 - HOIST
      ?auto_12621 - PLACE
      ?auto_12624 - PLACE
      ?auto_12620 - HOIST
      ?auto_12623 - SURFACE
      ?auto_12625 - TRUCK
      ?auto_12626 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12622 ?auto_12621 ) ( IS-CRATE ?auto_12618 ) ( not ( = ?auto_12618 ?auto_12619 ) ) ( not ( = ?auto_12624 ?auto_12621 ) ) ( HOIST-AT ?auto_12620 ?auto_12624 ) ( not ( = ?auto_12622 ?auto_12620 ) ) ( AVAILABLE ?auto_12620 ) ( SURFACE-AT ?auto_12618 ?auto_12624 ) ( ON ?auto_12618 ?auto_12623 ) ( CLEAR ?auto_12618 ) ( not ( = ?auto_12618 ?auto_12623 ) ) ( not ( = ?auto_12619 ?auto_12623 ) ) ( TRUCK-AT ?auto_12625 ?auto_12621 ) ( SURFACE-AT ?auto_12626 ?auto_12621 ) ( CLEAR ?auto_12626 ) ( LIFTING ?auto_12622 ?auto_12619 ) ( IS-CRATE ?auto_12619 ) ( not ( = ?auto_12618 ?auto_12626 ) ) ( not ( = ?auto_12619 ?auto_12626 ) ) ( not ( = ?auto_12623 ?auto_12626 ) ) )
    :subtasks
    ( ( !DROP ?auto_12622 ?auto_12619 ?auto_12626 ?auto_12621 )
      ( MAKE-ON ?auto_12618 ?auto_12619 )
      ( MAKE-ON-VERIFY ?auto_12618 ?auto_12619 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12627 - SURFACE
      ?auto_12628 - SURFACE
    )
    :vars
    (
      ?auto_12635 - HOIST
      ?auto_12634 - PLACE
      ?auto_12629 - PLACE
      ?auto_12630 - HOIST
      ?auto_12632 - SURFACE
      ?auto_12633 - TRUCK
      ?auto_12631 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12635 ?auto_12634 ) ( IS-CRATE ?auto_12627 ) ( not ( = ?auto_12627 ?auto_12628 ) ) ( not ( = ?auto_12629 ?auto_12634 ) ) ( HOIST-AT ?auto_12630 ?auto_12629 ) ( not ( = ?auto_12635 ?auto_12630 ) ) ( AVAILABLE ?auto_12630 ) ( SURFACE-AT ?auto_12627 ?auto_12629 ) ( ON ?auto_12627 ?auto_12632 ) ( CLEAR ?auto_12627 ) ( not ( = ?auto_12627 ?auto_12632 ) ) ( not ( = ?auto_12628 ?auto_12632 ) ) ( TRUCK-AT ?auto_12633 ?auto_12634 ) ( SURFACE-AT ?auto_12631 ?auto_12634 ) ( CLEAR ?auto_12631 ) ( IS-CRATE ?auto_12628 ) ( not ( = ?auto_12627 ?auto_12631 ) ) ( not ( = ?auto_12628 ?auto_12631 ) ) ( not ( = ?auto_12632 ?auto_12631 ) ) ( AVAILABLE ?auto_12635 ) ( IN ?auto_12628 ?auto_12633 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12635 ?auto_12628 ?auto_12633 ?auto_12634 )
      ( MAKE-ON ?auto_12627 ?auto_12628 )
      ( MAKE-ON-VERIFY ?auto_12627 ?auto_12628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12636 - SURFACE
      ?auto_12637 - SURFACE
    )
    :vars
    (
      ?auto_12644 - HOIST
      ?auto_12642 - PLACE
      ?auto_12638 - PLACE
      ?auto_12639 - HOIST
      ?auto_12640 - SURFACE
      ?auto_12641 - SURFACE
      ?auto_12643 - TRUCK
      ?auto_12645 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12644 ?auto_12642 ) ( IS-CRATE ?auto_12636 ) ( not ( = ?auto_12636 ?auto_12637 ) ) ( not ( = ?auto_12638 ?auto_12642 ) ) ( HOIST-AT ?auto_12639 ?auto_12638 ) ( not ( = ?auto_12644 ?auto_12639 ) ) ( AVAILABLE ?auto_12639 ) ( SURFACE-AT ?auto_12636 ?auto_12638 ) ( ON ?auto_12636 ?auto_12640 ) ( CLEAR ?auto_12636 ) ( not ( = ?auto_12636 ?auto_12640 ) ) ( not ( = ?auto_12637 ?auto_12640 ) ) ( SURFACE-AT ?auto_12641 ?auto_12642 ) ( CLEAR ?auto_12641 ) ( IS-CRATE ?auto_12637 ) ( not ( = ?auto_12636 ?auto_12641 ) ) ( not ( = ?auto_12637 ?auto_12641 ) ) ( not ( = ?auto_12640 ?auto_12641 ) ) ( AVAILABLE ?auto_12644 ) ( IN ?auto_12637 ?auto_12643 ) ( TRUCK-AT ?auto_12643 ?auto_12645 ) ( not ( = ?auto_12645 ?auto_12642 ) ) ( not ( = ?auto_12638 ?auto_12645 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12643 ?auto_12645 ?auto_12642 )
      ( MAKE-ON ?auto_12636 ?auto_12637 )
      ( MAKE-ON-VERIFY ?auto_12636 ?auto_12637 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12646 - SURFACE
      ?auto_12647 - SURFACE
    )
    :vars
    (
      ?auto_12654 - HOIST
      ?auto_12649 - PLACE
      ?auto_12653 - PLACE
      ?auto_12648 - HOIST
      ?auto_12651 - SURFACE
      ?auto_12652 - SURFACE
      ?auto_12655 - TRUCK
      ?auto_12650 - PLACE
      ?auto_12656 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12654 ?auto_12649 ) ( IS-CRATE ?auto_12646 ) ( not ( = ?auto_12646 ?auto_12647 ) ) ( not ( = ?auto_12653 ?auto_12649 ) ) ( HOIST-AT ?auto_12648 ?auto_12653 ) ( not ( = ?auto_12654 ?auto_12648 ) ) ( AVAILABLE ?auto_12648 ) ( SURFACE-AT ?auto_12646 ?auto_12653 ) ( ON ?auto_12646 ?auto_12651 ) ( CLEAR ?auto_12646 ) ( not ( = ?auto_12646 ?auto_12651 ) ) ( not ( = ?auto_12647 ?auto_12651 ) ) ( SURFACE-AT ?auto_12652 ?auto_12649 ) ( CLEAR ?auto_12652 ) ( IS-CRATE ?auto_12647 ) ( not ( = ?auto_12646 ?auto_12652 ) ) ( not ( = ?auto_12647 ?auto_12652 ) ) ( not ( = ?auto_12651 ?auto_12652 ) ) ( AVAILABLE ?auto_12654 ) ( TRUCK-AT ?auto_12655 ?auto_12650 ) ( not ( = ?auto_12650 ?auto_12649 ) ) ( not ( = ?auto_12653 ?auto_12650 ) ) ( HOIST-AT ?auto_12656 ?auto_12650 ) ( LIFTING ?auto_12656 ?auto_12647 ) ( not ( = ?auto_12654 ?auto_12656 ) ) ( not ( = ?auto_12648 ?auto_12656 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12656 ?auto_12647 ?auto_12655 ?auto_12650 )
      ( MAKE-ON ?auto_12646 ?auto_12647 )
      ( MAKE-ON-VERIFY ?auto_12646 ?auto_12647 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12657 - SURFACE
      ?auto_12658 - SURFACE
    )
    :vars
    (
      ?auto_12659 - HOIST
      ?auto_12662 - PLACE
      ?auto_12667 - PLACE
      ?auto_12666 - HOIST
      ?auto_12664 - SURFACE
      ?auto_12660 - SURFACE
      ?auto_12663 - TRUCK
      ?auto_12661 - PLACE
      ?auto_12665 - HOIST
      ?auto_12668 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12659 ?auto_12662 ) ( IS-CRATE ?auto_12657 ) ( not ( = ?auto_12657 ?auto_12658 ) ) ( not ( = ?auto_12667 ?auto_12662 ) ) ( HOIST-AT ?auto_12666 ?auto_12667 ) ( not ( = ?auto_12659 ?auto_12666 ) ) ( AVAILABLE ?auto_12666 ) ( SURFACE-AT ?auto_12657 ?auto_12667 ) ( ON ?auto_12657 ?auto_12664 ) ( CLEAR ?auto_12657 ) ( not ( = ?auto_12657 ?auto_12664 ) ) ( not ( = ?auto_12658 ?auto_12664 ) ) ( SURFACE-AT ?auto_12660 ?auto_12662 ) ( CLEAR ?auto_12660 ) ( IS-CRATE ?auto_12658 ) ( not ( = ?auto_12657 ?auto_12660 ) ) ( not ( = ?auto_12658 ?auto_12660 ) ) ( not ( = ?auto_12664 ?auto_12660 ) ) ( AVAILABLE ?auto_12659 ) ( TRUCK-AT ?auto_12663 ?auto_12661 ) ( not ( = ?auto_12661 ?auto_12662 ) ) ( not ( = ?auto_12667 ?auto_12661 ) ) ( HOIST-AT ?auto_12665 ?auto_12661 ) ( not ( = ?auto_12659 ?auto_12665 ) ) ( not ( = ?auto_12666 ?auto_12665 ) ) ( AVAILABLE ?auto_12665 ) ( SURFACE-AT ?auto_12658 ?auto_12661 ) ( ON ?auto_12658 ?auto_12668 ) ( CLEAR ?auto_12658 ) ( not ( = ?auto_12657 ?auto_12668 ) ) ( not ( = ?auto_12658 ?auto_12668 ) ) ( not ( = ?auto_12664 ?auto_12668 ) ) ( not ( = ?auto_12660 ?auto_12668 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12665 ?auto_12658 ?auto_12668 ?auto_12661 )
      ( MAKE-ON ?auto_12657 ?auto_12658 )
      ( MAKE-ON-VERIFY ?auto_12657 ?auto_12658 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12669 - SURFACE
      ?auto_12670 - SURFACE
    )
    :vars
    (
      ?auto_12680 - HOIST
      ?auto_12673 - PLACE
      ?auto_12677 - PLACE
      ?auto_12674 - HOIST
      ?auto_12679 - SURFACE
      ?auto_12675 - SURFACE
      ?auto_12676 - PLACE
      ?auto_12671 - HOIST
      ?auto_12672 - SURFACE
      ?auto_12678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12680 ?auto_12673 ) ( IS-CRATE ?auto_12669 ) ( not ( = ?auto_12669 ?auto_12670 ) ) ( not ( = ?auto_12677 ?auto_12673 ) ) ( HOIST-AT ?auto_12674 ?auto_12677 ) ( not ( = ?auto_12680 ?auto_12674 ) ) ( AVAILABLE ?auto_12674 ) ( SURFACE-AT ?auto_12669 ?auto_12677 ) ( ON ?auto_12669 ?auto_12679 ) ( CLEAR ?auto_12669 ) ( not ( = ?auto_12669 ?auto_12679 ) ) ( not ( = ?auto_12670 ?auto_12679 ) ) ( SURFACE-AT ?auto_12675 ?auto_12673 ) ( CLEAR ?auto_12675 ) ( IS-CRATE ?auto_12670 ) ( not ( = ?auto_12669 ?auto_12675 ) ) ( not ( = ?auto_12670 ?auto_12675 ) ) ( not ( = ?auto_12679 ?auto_12675 ) ) ( AVAILABLE ?auto_12680 ) ( not ( = ?auto_12676 ?auto_12673 ) ) ( not ( = ?auto_12677 ?auto_12676 ) ) ( HOIST-AT ?auto_12671 ?auto_12676 ) ( not ( = ?auto_12680 ?auto_12671 ) ) ( not ( = ?auto_12674 ?auto_12671 ) ) ( AVAILABLE ?auto_12671 ) ( SURFACE-AT ?auto_12670 ?auto_12676 ) ( ON ?auto_12670 ?auto_12672 ) ( CLEAR ?auto_12670 ) ( not ( = ?auto_12669 ?auto_12672 ) ) ( not ( = ?auto_12670 ?auto_12672 ) ) ( not ( = ?auto_12679 ?auto_12672 ) ) ( not ( = ?auto_12675 ?auto_12672 ) ) ( TRUCK-AT ?auto_12678 ?auto_12673 ) )
    :subtasks
    ( ( !DRIVE ?auto_12678 ?auto_12673 ?auto_12676 )
      ( MAKE-ON ?auto_12669 ?auto_12670 )
      ( MAKE-ON-VERIFY ?auto_12669 ?auto_12670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12681 - SURFACE
      ?auto_12682 - SURFACE
    )
    :vars
    (
      ?auto_12691 - HOIST
      ?auto_12690 - PLACE
      ?auto_12683 - PLACE
      ?auto_12686 - HOIST
      ?auto_12684 - SURFACE
      ?auto_12687 - SURFACE
      ?auto_12689 - PLACE
      ?auto_12692 - HOIST
      ?auto_12685 - SURFACE
      ?auto_12688 - TRUCK
      ?auto_12693 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12691 ?auto_12690 ) ( IS-CRATE ?auto_12681 ) ( not ( = ?auto_12681 ?auto_12682 ) ) ( not ( = ?auto_12683 ?auto_12690 ) ) ( HOIST-AT ?auto_12686 ?auto_12683 ) ( not ( = ?auto_12691 ?auto_12686 ) ) ( AVAILABLE ?auto_12686 ) ( SURFACE-AT ?auto_12681 ?auto_12683 ) ( ON ?auto_12681 ?auto_12684 ) ( CLEAR ?auto_12681 ) ( not ( = ?auto_12681 ?auto_12684 ) ) ( not ( = ?auto_12682 ?auto_12684 ) ) ( IS-CRATE ?auto_12682 ) ( not ( = ?auto_12681 ?auto_12687 ) ) ( not ( = ?auto_12682 ?auto_12687 ) ) ( not ( = ?auto_12684 ?auto_12687 ) ) ( not ( = ?auto_12689 ?auto_12690 ) ) ( not ( = ?auto_12683 ?auto_12689 ) ) ( HOIST-AT ?auto_12692 ?auto_12689 ) ( not ( = ?auto_12691 ?auto_12692 ) ) ( not ( = ?auto_12686 ?auto_12692 ) ) ( AVAILABLE ?auto_12692 ) ( SURFACE-AT ?auto_12682 ?auto_12689 ) ( ON ?auto_12682 ?auto_12685 ) ( CLEAR ?auto_12682 ) ( not ( = ?auto_12681 ?auto_12685 ) ) ( not ( = ?auto_12682 ?auto_12685 ) ) ( not ( = ?auto_12684 ?auto_12685 ) ) ( not ( = ?auto_12687 ?auto_12685 ) ) ( TRUCK-AT ?auto_12688 ?auto_12690 ) ( SURFACE-AT ?auto_12693 ?auto_12690 ) ( CLEAR ?auto_12693 ) ( LIFTING ?auto_12691 ?auto_12687 ) ( IS-CRATE ?auto_12687 ) ( not ( = ?auto_12681 ?auto_12693 ) ) ( not ( = ?auto_12682 ?auto_12693 ) ) ( not ( = ?auto_12684 ?auto_12693 ) ) ( not ( = ?auto_12687 ?auto_12693 ) ) ( not ( = ?auto_12685 ?auto_12693 ) ) )
    :subtasks
    ( ( !DROP ?auto_12691 ?auto_12687 ?auto_12693 ?auto_12690 )
      ( MAKE-ON ?auto_12681 ?auto_12682 )
      ( MAKE-ON-VERIFY ?auto_12681 ?auto_12682 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12694 - SURFACE
      ?auto_12695 - SURFACE
    )
    :vars
    (
      ?auto_12697 - HOIST
      ?auto_12706 - PLACE
      ?auto_12696 - PLACE
      ?auto_12700 - HOIST
      ?auto_12701 - SURFACE
      ?auto_12702 - SURFACE
      ?auto_12704 - PLACE
      ?auto_12705 - HOIST
      ?auto_12698 - SURFACE
      ?auto_12699 - TRUCK
      ?auto_12703 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12697 ?auto_12706 ) ( IS-CRATE ?auto_12694 ) ( not ( = ?auto_12694 ?auto_12695 ) ) ( not ( = ?auto_12696 ?auto_12706 ) ) ( HOIST-AT ?auto_12700 ?auto_12696 ) ( not ( = ?auto_12697 ?auto_12700 ) ) ( AVAILABLE ?auto_12700 ) ( SURFACE-AT ?auto_12694 ?auto_12696 ) ( ON ?auto_12694 ?auto_12701 ) ( CLEAR ?auto_12694 ) ( not ( = ?auto_12694 ?auto_12701 ) ) ( not ( = ?auto_12695 ?auto_12701 ) ) ( IS-CRATE ?auto_12695 ) ( not ( = ?auto_12694 ?auto_12702 ) ) ( not ( = ?auto_12695 ?auto_12702 ) ) ( not ( = ?auto_12701 ?auto_12702 ) ) ( not ( = ?auto_12704 ?auto_12706 ) ) ( not ( = ?auto_12696 ?auto_12704 ) ) ( HOIST-AT ?auto_12705 ?auto_12704 ) ( not ( = ?auto_12697 ?auto_12705 ) ) ( not ( = ?auto_12700 ?auto_12705 ) ) ( AVAILABLE ?auto_12705 ) ( SURFACE-AT ?auto_12695 ?auto_12704 ) ( ON ?auto_12695 ?auto_12698 ) ( CLEAR ?auto_12695 ) ( not ( = ?auto_12694 ?auto_12698 ) ) ( not ( = ?auto_12695 ?auto_12698 ) ) ( not ( = ?auto_12701 ?auto_12698 ) ) ( not ( = ?auto_12702 ?auto_12698 ) ) ( TRUCK-AT ?auto_12699 ?auto_12706 ) ( SURFACE-AT ?auto_12703 ?auto_12706 ) ( CLEAR ?auto_12703 ) ( IS-CRATE ?auto_12702 ) ( not ( = ?auto_12694 ?auto_12703 ) ) ( not ( = ?auto_12695 ?auto_12703 ) ) ( not ( = ?auto_12701 ?auto_12703 ) ) ( not ( = ?auto_12702 ?auto_12703 ) ) ( not ( = ?auto_12698 ?auto_12703 ) ) ( AVAILABLE ?auto_12697 ) ( IN ?auto_12702 ?auto_12699 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12697 ?auto_12702 ?auto_12699 ?auto_12706 )
      ( MAKE-ON ?auto_12694 ?auto_12695 )
      ( MAKE-ON-VERIFY ?auto_12694 ?auto_12695 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12707 - SURFACE
      ?auto_12708 - SURFACE
    )
    :vars
    (
      ?auto_12716 - HOIST
      ?auto_12714 - PLACE
      ?auto_12709 - PLACE
      ?auto_12718 - HOIST
      ?auto_12719 - SURFACE
      ?auto_12710 - SURFACE
      ?auto_12715 - PLACE
      ?auto_12711 - HOIST
      ?auto_12713 - SURFACE
      ?auto_12712 - SURFACE
      ?auto_12717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12716 ?auto_12714 ) ( IS-CRATE ?auto_12707 ) ( not ( = ?auto_12707 ?auto_12708 ) ) ( not ( = ?auto_12709 ?auto_12714 ) ) ( HOIST-AT ?auto_12718 ?auto_12709 ) ( not ( = ?auto_12716 ?auto_12718 ) ) ( AVAILABLE ?auto_12718 ) ( SURFACE-AT ?auto_12707 ?auto_12709 ) ( ON ?auto_12707 ?auto_12719 ) ( CLEAR ?auto_12707 ) ( not ( = ?auto_12707 ?auto_12719 ) ) ( not ( = ?auto_12708 ?auto_12719 ) ) ( IS-CRATE ?auto_12708 ) ( not ( = ?auto_12707 ?auto_12710 ) ) ( not ( = ?auto_12708 ?auto_12710 ) ) ( not ( = ?auto_12719 ?auto_12710 ) ) ( not ( = ?auto_12715 ?auto_12714 ) ) ( not ( = ?auto_12709 ?auto_12715 ) ) ( HOIST-AT ?auto_12711 ?auto_12715 ) ( not ( = ?auto_12716 ?auto_12711 ) ) ( not ( = ?auto_12718 ?auto_12711 ) ) ( AVAILABLE ?auto_12711 ) ( SURFACE-AT ?auto_12708 ?auto_12715 ) ( ON ?auto_12708 ?auto_12713 ) ( CLEAR ?auto_12708 ) ( not ( = ?auto_12707 ?auto_12713 ) ) ( not ( = ?auto_12708 ?auto_12713 ) ) ( not ( = ?auto_12719 ?auto_12713 ) ) ( not ( = ?auto_12710 ?auto_12713 ) ) ( SURFACE-AT ?auto_12712 ?auto_12714 ) ( CLEAR ?auto_12712 ) ( IS-CRATE ?auto_12710 ) ( not ( = ?auto_12707 ?auto_12712 ) ) ( not ( = ?auto_12708 ?auto_12712 ) ) ( not ( = ?auto_12719 ?auto_12712 ) ) ( not ( = ?auto_12710 ?auto_12712 ) ) ( not ( = ?auto_12713 ?auto_12712 ) ) ( AVAILABLE ?auto_12716 ) ( IN ?auto_12710 ?auto_12717 ) ( TRUCK-AT ?auto_12717 ?auto_12715 ) )
    :subtasks
    ( ( !DRIVE ?auto_12717 ?auto_12715 ?auto_12714 )
      ( MAKE-ON ?auto_12707 ?auto_12708 )
      ( MAKE-ON-VERIFY ?auto_12707 ?auto_12708 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12720 - SURFACE
      ?auto_12721 - SURFACE
    )
    :vars
    (
      ?auto_12722 - HOIST
      ?auto_12724 - PLACE
      ?auto_12727 - PLACE
      ?auto_12723 - HOIST
      ?auto_12730 - SURFACE
      ?auto_12732 - SURFACE
      ?auto_12729 - PLACE
      ?auto_12728 - HOIST
      ?auto_12725 - SURFACE
      ?auto_12731 - SURFACE
      ?auto_12726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12722 ?auto_12724 ) ( IS-CRATE ?auto_12720 ) ( not ( = ?auto_12720 ?auto_12721 ) ) ( not ( = ?auto_12727 ?auto_12724 ) ) ( HOIST-AT ?auto_12723 ?auto_12727 ) ( not ( = ?auto_12722 ?auto_12723 ) ) ( AVAILABLE ?auto_12723 ) ( SURFACE-AT ?auto_12720 ?auto_12727 ) ( ON ?auto_12720 ?auto_12730 ) ( CLEAR ?auto_12720 ) ( not ( = ?auto_12720 ?auto_12730 ) ) ( not ( = ?auto_12721 ?auto_12730 ) ) ( IS-CRATE ?auto_12721 ) ( not ( = ?auto_12720 ?auto_12732 ) ) ( not ( = ?auto_12721 ?auto_12732 ) ) ( not ( = ?auto_12730 ?auto_12732 ) ) ( not ( = ?auto_12729 ?auto_12724 ) ) ( not ( = ?auto_12727 ?auto_12729 ) ) ( HOIST-AT ?auto_12728 ?auto_12729 ) ( not ( = ?auto_12722 ?auto_12728 ) ) ( not ( = ?auto_12723 ?auto_12728 ) ) ( SURFACE-AT ?auto_12721 ?auto_12729 ) ( ON ?auto_12721 ?auto_12725 ) ( CLEAR ?auto_12721 ) ( not ( = ?auto_12720 ?auto_12725 ) ) ( not ( = ?auto_12721 ?auto_12725 ) ) ( not ( = ?auto_12730 ?auto_12725 ) ) ( not ( = ?auto_12732 ?auto_12725 ) ) ( SURFACE-AT ?auto_12731 ?auto_12724 ) ( CLEAR ?auto_12731 ) ( IS-CRATE ?auto_12732 ) ( not ( = ?auto_12720 ?auto_12731 ) ) ( not ( = ?auto_12721 ?auto_12731 ) ) ( not ( = ?auto_12730 ?auto_12731 ) ) ( not ( = ?auto_12732 ?auto_12731 ) ) ( not ( = ?auto_12725 ?auto_12731 ) ) ( AVAILABLE ?auto_12722 ) ( TRUCK-AT ?auto_12726 ?auto_12729 ) ( LIFTING ?auto_12728 ?auto_12732 ) )
    :subtasks
    ( ( !LOAD ?auto_12728 ?auto_12732 ?auto_12726 ?auto_12729 )
      ( MAKE-ON ?auto_12720 ?auto_12721 )
      ( MAKE-ON-VERIFY ?auto_12720 ?auto_12721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12733 - SURFACE
      ?auto_12734 - SURFACE
    )
    :vars
    (
      ?auto_12736 - HOIST
      ?auto_12743 - PLACE
      ?auto_12735 - PLACE
      ?auto_12742 - HOIST
      ?auto_12737 - SURFACE
      ?auto_12740 - SURFACE
      ?auto_12738 - PLACE
      ?auto_12739 - HOIST
      ?auto_12745 - SURFACE
      ?auto_12741 - SURFACE
      ?auto_12744 - TRUCK
      ?auto_12746 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12736 ?auto_12743 ) ( IS-CRATE ?auto_12733 ) ( not ( = ?auto_12733 ?auto_12734 ) ) ( not ( = ?auto_12735 ?auto_12743 ) ) ( HOIST-AT ?auto_12742 ?auto_12735 ) ( not ( = ?auto_12736 ?auto_12742 ) ) ( AVAILABLE ?auto_12742 ) ( SURFACE-AT ?auto_12733 ?auto_12735 ) ( ON ?auto_12733 ?auto_12737 ) ( CLEAR ?auto_12733 ) ( not ( = ?auto_12733 ?auto_12737 ) ) ( not ( = ?auto_12734 ?auto_12737 ) ) ( IS-CRATE ?auto_12734 ) ( not ( = ?auto_12733 ?auto_12740 ) ) ( not ( = ?auto_12734 ?auto_12740 ) ) ( not ( = ?auto_12737 ?auto_12740 ) ) ( not ( = ?auto_12738 ?auto_12743 ) ) ( not ( = ?auto_12735 ?auto_12738 ) ) ( HOIST-AT ?auto_12739 ?auto_12738 ) ( not ( = ?auto_12736 ?auto_12739 ) ) ( not ( = ?auto_12742 ?auto_12739 ) ) ( SURFACE-AT ?auto_12734 ?auto_12738 ) ( ON ?auto_12734 ?auto_12745 ) ( CLEAR ?auto_12734 ) ( not ( = ?auto_12733 ?auto_12745 ) ) ( not ( = ?auto_12734 ?auto_12745 ) ) ( not ( = ?auto_12737 ?auto_12745 ) ) ( not ( = ?auto_12740 ?auto_12745 ) ) ( SURFACE-AT ?auto_12741 ?auto_12743 ) ( CLEAR ?auto_12741 ) ( IS-CRATE ?auto_12740 ) ( not ( = ?auto_12733 ?auto_12741 ) ) ( not ( = ?auto_12734 ?auto_12741 ) ) ( not ( = ?auto_12737 ?auto_12741 ) ) ( not ( = ?auto_12740 ?auto_12741 ) ) ( not ( = ?auto_12745 ?auto_12741 ) ) ( AVAILABLE ?auto_12736 ) ( TRUCK-AT ?auto_12744 ?auto_12738 ) ( AVAILABLE ?auto_12739 ) ( SURFACE-AT ?auto_12740 ?auto_12738 ) ( ON ?auto_12740 ?auto_12746 ) ( CLEAR ?auto_12740 ) ( not ( = ?auto_12733 ?auto_12746 ) ) ( not ( = ?auto_12734 ?auto_12746 ) ) ( not ( = ?auto_12737 ?auto_12746 ) ) ( not ( = ?auto_12740 ?auto_12746 ) ) ( not ( = ?auto_12745 ?auto_12746 ) ) ( not ( = ?auto_12741 ?auto_12746 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12739 ?auto_12740 ?auto_12746 ?auto_12738 )
      ( MAKE-ON ?auto_12733 ?auto_12734 )
      ( MAKE-ON-VERIFY ?auto_12733 ?auto_12734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12747 - SURFACE
      ?auto_12748 - SURFACE
    )
    :vars
    (
      ?auto_12754 - HOIST
      ?auto_12751 - PLACE
      ?auto_12753 - PLACE
      ?auto_12755 - HOIST
      ?auto_12760 - SURFACE
      ?auto_12757 - SURFACE
      ?auto_12752 - PLACE
      ?auto_12749 - HOIST
      ?auto_12750 - SURFACE
      ?auto_12759 - SURFACE
      ?auto_12756 - SURFACE
      ?auto_12758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12754 ?auto_12751 ) ( IS-CRATE ?auto_12747 ) ( not ( = ?auto_12747 ?auto_12748 ) ) ( not ( = ?auto_12753 ?auto_12751 ) ) ( HOIST-AT ?auto_12755 ?auto_12753 ) ( not ( = ?auto_12754 ?auto_12755 ) ) ( AVAILABLE ?auto_12755 ) ( SURFACE-AT ?auto_12747 ?auto_12753 ) ( ON ?auto_12747 ?auto_12760 ) ( CLEAR ?auto_12747 ) ( not ( = ?auto_12747 ?auto_12760 ) ) ( not ( = ?auto_12748 ?auto_12760 ) ) ( IS-CRATE ?auto_12748 ) ( not ( = ?auto_12747 ?auto_12757 ) ) ( not ( = ?auto_12748 ?auto_12757 ) ) ( not ( = ?auto_12760 ?auto_12757 ) ) ( not ( = ?auto_12752 ?auto_12751 ) ) ( not ( = ?auto_12753 ?auto_12752 ) ) ( HOIST-AT ?auto_12749 ?auto_12752 ) ( not ( = ?auto_12754 ?auto_12749 ) ) ( not ( = ?auto_12755 ?auto_12749 ) ) ( SURFACE-AT ?auto_12748 ?auto_12752 ) ( ON ?auto_12748 ?auto_12750 ) ( CLEAR ?auto_12748 ) ( not ( = ?auto_12747 ?auto_12750 ) ) ( not ( = ?auto_12748 ?auto_12750 ) ) ( not ( = ?auto_12760 ?auto_12750 ) ) ( not ( = ?auto_12757 ?auto_12750 ) ) ( SURFACE-AT ?auto_12759 ?auto_12751 ) ( CLEAR ?auto_12759 ) ( IS-CRATE ?auto_12757 ) ( not ( = ?auto_12747 ?auto_12759 ) ) ( not ( = ?auto_12748 ?auto_12759 ) ) ( not ( = ?auto_12760 ?auto_12759 ) ) ( not ( = ?auto_12757 ?auto_12759 ) ) ( not ( = ?auto_12750 ?auto_12759 ) ) ( AVAILABLE ?auto_12754 ) ( AVAILABLE ?auto_12749 ) ( SURFACE-AT ?auto_12757 ?auto_12752 ) ( ON ?auto_12757 ?auto_12756 ) ( CLEAR ?auto_12757 ) ( not ( = ?auto_12747 ?auto_12756 ) ) ( not ( = ?auto_12748 ?auto_12756 ) ) ( not ( = ?auto_12760 ?auto_12756 ) ) ( not ( = ?auto_12757 ?auto_12756 ) ) ( not ( = ?auto_12750 ?auto_12756 ) ) ( not ( = ?auto_12759 ?auto_12756 ) ) ( TRUCK-AT ?auto_12758 ?auto_12751 ) )
    :subtasks
    ( ( !DRIVE ?auto_12758 ?auto_12751 ?auto_12752 )
      ( MAKE-ON ?auto_12747 ?auto_12748 )
      ( MAKE-ON-VERIFY ?auto_12747 ?auto_12748 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12761 - SURFACE
      ?auto_12762 - SURFACE
    )
    :vars
    (
      ?auto_12773 - HOIST
      ?auto_12764 - PLACE
      ?auto_12767 - PLACE
      ?auto_12770 - HOIST
      ?auto_12768 - SURFACE
      ?auto_12772 - SURFACE
      ?auto_12771 - PLACE
      ?auto_12774 - HOIST
      ?auto_12763 - SURFACE
      ?auto_12765 - SURFACE
      ?auto_12769 - SURFACE
      ?auto_12766 - TRUCK
      ?auto_12775 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12773 ?auto_12764 ) ( IS-CRATE ?auto_12761 ) ( not ( = ?auto_12761 ?auto_12762 ) ) ( not ( = ?auto_12767 ?auto_12764 ) ) ( HOIST-AT ?auto_12770 ?auto_12767 ) ( not ( = ?auto_12773 ?auto_12770 ) ) ( AVAILABLE ?auto_12770 ) ( SURFACE-AT ?auto_12761 ?auto_12767 ) ( ON ?auto_12761 ?auto_12768 ) ( CLEAR ?auto_12761 ) ( not ( = ?auto_12761 ?auto_12768 ) ) ( not ( = ?auto_12762 ?auto_12768 ) ) ( IS-CRATE ?auto_12762 ) ( not ( = ?auto_12761 ?auto_12772 ) ) ( not ( = ?auto_12762 ?auto_12772 ) ) ( not ( = ?auto_12768 ?auto_12772 ) ) ( not ( = ?auto_12771 ?auto_12764 ) ) ( not ( = ?auto_12767 ?auto_12771 ) ) ( HOIST-AT ?auto_12774 ?auto_12771 ) ( not ( = ?auto_12773 ?auto_12774 ) ) ( not ( = ?auto_12770 ?auto_12774 ) ) ( SURFACE-AT ?auto_12762 ?auto_12771 ) ( ON ?auto_12762 ?auto_12763 ) ( CLEAR ?auto_12762 ) ( not ( = ?auto_12761 ?auto_12763 ) ) ( not ( = ?auto_12762 ?auto_12763 ) ) ( not ( = ?auto_12768 ?auto_12763 ) ) ( not ( = ?auto_12772 ?auto_12763 ) ) ( IS-CRATE ?auto_12772 ) ( not ( = ?auto_12761 ?auto_12765 ) ) ( not ( = ?auto_12762 ?auto_12765 ) ) ( not ( = ?auto_12768 ?auto_12765 ) ) ( not ( = ?auto_12772 ?auto_12765 ) ) ( not ( = ?auto_12763 ?auto_12765 ) ) ( AVAILABLE ?auto_12774 ) ( SURFACE-AT ?auto_12772 ?auto_12771 ) ( ON ?auto_12772 ?auto_12769 ) ( CLEAR ?auto_12772 ) ( not ( = ?auto_12761 ?auto_12769 ) ) ( not ( = ?auto_12762 ?auto_12769 ) ) ( not ( = ?auto_12768 ?auto_12769 ) ) ( not ( = ?auto_12772 ?auto_12769 ) ) ( not ( = ?auto_12763 ?auto_12769 ) ) ( not ( = ?auto_12765 ?auto_12769 ) ) ( TRUCK-AT ?auto_12766 ?auto_12764 ) ( SURFACE-AT ?auto_12775 ?auto_12764 ) ( CLEAR ?auto_12775 ) ( LIFTING ?auto_12773 ?auto_12765 ) ( IS-CRATE ?auto_12765 ) ( not ( = ?auto_12761 ?auto_12775 ) ) ( not ( = ?auto_12762 ?auto_12775 ) ) ( not ( = ?auto_12768 ?auto_12775 ) ) ( not ( = ?auto_12772 ?auto_12775 ) ) ( not ( = ?auto_12763 ?auto_12775 ) ) ( not ( = ?auto_12765 ?auto_12775 ) ) ( not ( = ?auto_12769 ?auto_12775 ) ) )
    :subtasks
    ( ( !DROP ?auto_12773 ?auto_12765 ?auto_12775 ?auto_12764 )
      ( MAKE-ON ?auto_12761 ?auto_12762 )
      ( MAKE-ON-VERIFY ?auto_12761 ?auto_12762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12776 - SURFACE
      ?auto_12777 - SURFACE
    )
    :vars
    (
      ?auto_12785 - HOIST
      ?auto_12784 - PLACE
      ?auto_12783 - PLACE
      ?auto_12787 - HOIST
      ?auto_12782 - SURFACE
      ?auto_12790 - SURFACE
      ?auto_12786 - PLACE
      ?auto_12780 - HOIST
      ?auto_12788 - SURFACE
      ?auto_12789 - SURFACE
      ?auto_12779 - SURFACE
      ?auto_12781 - TRUCK
      ?auto_12778 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12785 ?auto_12784 ) ( IS-CRATE ?auto_12776 ) ( not ( = ?auto_12776 ?auto_12777 ) ) ( not ( = ?auto_12783 ?auto_12784 ) ) ( HOIST-AT ?auto_12787 ?auto_12783 ) ( not ( = ?auto_12785 ?auto_12787 ) ) ( AVAILABLE ?auto_12787 ) ( SURFACE-AT ?auto_12776 ?auto_12783 ) ( ON ?auto_12776 ?auto_12782 ) ( CLEAR ?auto_12776 ) ( not ( = ?auto_12776 ?auto_12782 ) ) ( not ( = ?auto_12777 ?auto_12782 ) ) ( IS-CRATE ?auto_12777 ) ( not ( = ?auto_12776 ?auto_12790 ) ) ( not ( = ?auto_12777 ?auto_12790 ) ) ( not ( = ?auto_12782 ?auto_12790 ) ) ( not ( = ?auto_12786 ?auto_12784 ) ) ( not ( = ?auto_12783 ?auto_12786 ) ) ( HOIST-AT ?auto_12780 ?auto_12786 ) ( not ( = ?auto_12785 ?auto_12780 ) ) ( not ( = ?auto_12787 ?auto_12780 ) ) ( SURFACE-AT ?auto_12777 ?auto_12786 ) ( ON ?auto_12777 ?auto_12788 ) ( CLEAR ?auto_12777 ) ( not ( = ?auto_12776 ?auto_12788 ) ) ( not ( = ?auto_12777 ?auto_12788 ) ) ( not ( = ?auto_12782 ?auto_12788 ) ) ( not ( = ?auto_12790 ?auto_12788 ) ) ( IS-CRATE ?auto_12790 ) ( not ( = ?auto_12776 ?auto_12789 ) ) ( not ( = ?auto_12777 ?auto_12789 ) ) ( not ( = ?auto_12782 ?auto_12789 ) ) ( not ( = ?auto_12790 ?auto_12789 ) ) ( not ( = ?auto_12788 ?auto_12789 ) ) ( AVAILABLE ?auto_12780 ) ( SURFACE-AT ?auto_12790 ?auto_12786 ) ( ON ?auto_12790 ?auto_12779 ) ( CLEAR ?auto_12790 ) ( not ( = ?auto_12776 ?auto_12779 ) ) ( not ( = ?auto_12777 ?auto_12779 ) ) ( not ( = ?auto_12782 ?auto_12779 ) ) ( not ( = ?auto_12790 ?auto_12779 ) ) ( not ( = ?auto_12788 ?auto_12779 ) ) ( not ( = ?auto_12789 ?auto_12779 ) ) ( TRUCK-AT ?auto_12781 ?auto_12784 ) ( SURFACE-AT ?auto_12778 ?auto_12784 ) ( CLEAR ?auto_12778 ) ( IS-CRATE ?auto_12789 ) ( not ( = ?auto_12776 ?auto_12778 ) ) ( not ( = ?auto_12777 ?auto_12778 ) ) ( not ( = ?auto_12782 ?auto_12778 ) ) ( not ( = ?auto_12790 ?auto_12778 ) ) ( not ( = ?auto_12788 ?auto_12778 ) ) ( not ( = ?auto_12789 ?auto_12778 ) ) ( not ( = ?auto_12779 ?auto_12778 ) ) ( AVAILABLE ?auto_12785 ) ( IN ?auto_12789 ?auto_12781 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12785 ?auto_12789 ?auto_12781 ?auto_12784 )
      ( MAKE-ON ?auto_12776 ?auto_12777 )
      ( MAKE-ON-VERIFY ?auto_12776 ?auto_12777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12791 - SURFACE
      ?auto_12792 - SURFACE
    )
    :vars
    (
      ?auto_12798 - HOIST
      ?auto_12801 - PLACE
      ?auto_12797 - PLACE
      ?auto_12796 - HOIST
      ?auto_12794 - SURFACE
      ?auto_12804 - SURFACE
      ?auto_12802 - PLACE
      ?auto_12805 - HOIST
      ?auto_12803 - SURFACE
      ?auto_12799 - SURFACE
      ?auto_12800 - SURFACE
      ?auto_12795 - SURFACE
      ?auto_12793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12798 ?auto_12801 ) ( IS-CRATE ?auto_12791 ) ( not ( = ?auto_12791 ?auto_12792 ) ) ( not ( = ?auto_12797 ?auto_12801 ) ) ( HOIST-AT ?auto_12796 ?auto_12797 ) ( not ( = ?auto_12798 ?auto_12796 ) ) ( AVAILABLE ?auto_12796 ) ( SURFACE-AT ?auto_12791 ?auto_12797 ) ( ON ?auto_12791 ?auto_12794 ) ( CLEAR ?auto_12791 ) ( not ( = ?auto_12791 ?auto_12794 ) ) ( not ( = ?auto_12792 ?auto_12794 ) ) ( IS-CRATE ?auto_12792 ) ( not ( = ?auto_12791 ?auto_12804 ) ) ( not ( = ?auto_12792 ?auto_12804 ) ) ( not ( = ?auto_12794 ?auto_12804 ) ) ( not ( = ?auto_12802 ?auto_12801 ) ) ( not ( = ?auto_12797 ?auto_12802 ) ) ( HOIST-AT ?auto_12805 ?auto_12802 ) ( not ( = ?auto_12798 ?auto_12805 ) ) ( not ( = ?auto_12796 ?auto_12805 ) ) ( SURFACE-AT ?auto_12792 ?auto_12802 ) ( ON ?auto_12792 ?auto_12803 ) ( CLEAR ?auto_12792 ) ( not ( = ?auto_12791 ?auto_12803 ) ) ( not ( = ?auto_12792 ?auto_12803 ) ) ( not ( = ?auto_12794 ?auto_12803 ) ) ( not ( = ?auto_12804 ?auto_12803 ) ) ( IS-CRATE ?auto_12804 ) ( not ( = ?auto_12791 ?auto_12799 ) ) ( not ( = ?auto_12792 ?auto_12799 ) ) ( not ( = ?auto_12794 ?auto_12799 ) ) ( not ( = ?auto_12804 ?auto_12799 ) ) ( not ( = ?auto_12803 ?auto_12799 ) ) ( AVAILABLE ?auto_12805 ) ( SURFACE-AT ?auto_12804 ?auto_12802 ) ( ON ?auto_12804 ?auto_12800 ) ( CLEAR ?auto_12804 ) ( not ( = ?auto_12791 ?auto_12800 ) ) ( not ( = ?auto_12792 ?auto_12800 ) ) ( not ( = ?auto_12794 ?auto_12800 ) ) ( not ( = ?auto_12804 ?auto_12800 ) ) ( not ( = ?auto_12803 ?auto_12800 ) ) ( not ( = ?auto_12799 ?auto_12800 ) ) ( SURFACE-AT ?auto_12795 ?auto_12801 ) ( CLEAR ?auto_12795 ) ( IS-CRATE ?auto_12799 ) ( not ( = ?auto_12791 ?auto_12795 ) ) ( not ( = ?auto_12792 ?auto_12795 ) ) ( not ( = ?auto_12794 ?auto_12795 ) ) ( not ( = ?auto_12804 ?auto_12795 ) ) ( not ( = ?auto_12803 ?auto_12795 ) ) ( not ( = ?auto_12799 ?auto_12795 ) ) ( not ( = ?auto_12800 ?auto_12795 ) ) ( AVAILABLE ?auto_12798 ) ( IN ?auto_12799 ?auto_12793 ) ( TRUCK-AT ?auto_12793 ?auto_12797 ) )
    :subtasks
    ( ( !DRIVE ?auto_12793 ?auto_12797 ?auto_12801 )
      ( MAKE-ON ?auto_12791 ?auto_12792 )
      ( MAKE-ON-VERIFY ?auto_12791 ?auto_12792 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12806 - SURFACE
      ?auto_12807 - SURFACE
    )
    :vars
    (
      ?auto_12816 - HOIST
      ?auto_12820 - PLACE
      ?auto_12813 - PLACE
      ?auto_12817 - HOIST
      ?auto_12819 - SURFACE
      ?auto_12814 - SURFACE
      ?auto_12812 - PLACE
      ?auto_12809 - HOIST
      ?auto_12810 - SURFACE
      ?auto_12818 - SURFACE
      ?auto_12811 - SURFACE
      ?auto_12815 - SURFACE
      ?auto_12808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12816 ?auto_12820 ) ( IS-CRATE ?auto_12806 ) ( not ( = ?auto_12806 ?auto_12807 ) ) ( not ( = ?auto_12813 ?auto_12820 ) ) ( HOIST-AT ?auto_12817 ?auto_12813 ) ( not ( = ?auto_12816 ?auto_12817 ) ) ( SURFACE-AT ?auto_12806 ?auto_12813 ) ( ON ?auto_12806 ?auto_12819 ) ( CLEAR ?auto_12806 ) ( not ( = ?auto_12806 ?auto_12819 ) ) ( not ( = ?auto_12807 ?auto_12819 ) ) ( IS-CRATE ?auto_12807 ) ( not ( = ?auto_12806 ?auto_12814 ) ) ( not ( = ?auto_12807 ?auto_12814 ) ) ( not ( = ?auto_12819 ?auto_12814 ) ) ( not ( = ?auto_12812 ?auto_12820 ) ) ( not ( = ?auto_12813 ?auto_12812 ) ) ( HOIST-AT ?auto_12809 ?auto_12812 ) ( not ( = ?auto_12816 ?auto_12809 ) ) ( not ( = ?auto_12817 ?auto_12809 ) ) ( SURFACE-AT ?auto_12807 ?auto_12812 ) ( ON ?auto_12807 ?auto_12810 ) ( CLEAR ?auto_12807 ) ( not ( = ?auto_12806 ?auto_12810 ) ) ( not ( = ?auto_12807 ?auto_12810 ) ) ( not ( = ?auto_12819 ?auto_12810 ) ) ( not ( = ?auto_12814 ?auto_12810 ) ) ( IS-CRATE ?auto_12814 ) ( not ( = ?auto_12806 ?auto_12818 ) ) ( not ( = ?auto_12807 ?auto_12818 ) ) ( not ( = ?auto_12819 ?auto_12818 ) ) ( not ( = ?auto_12814 ?auto_12818 ) ) ( not ( = ?auto_12810 ?auto_12818 ) ) ( AVAILABLE ?auto_12809 ) ( SURFACE-AT ?auto_12814 ?auto_12812 ) ( ON ?auto_12814 ?auto_12811 ) ( CLEAR ?auto_12814 ) ( not ( = ?auto_12806 ?auto_12811 ) ) ( not ( = ?auto_12807 ?auto_12811 ) ) ( not ( = ?auto_12819 ?auto_12811 ) ) ( not ( = ?auto_12814 ?auto_12811 ) ) ( not ( = ?auto_12810 ?auto_12811 ) ) ( not ( = ?auto_12818 ?auto_12811 ) ) ( SURFACE-AT ?auto_12815 ?auto_12820 ) ( CLEAR ?auto_12815 ) ( IS-CRATE ?auto_12818 ) ( not ( = ?auto_12806 ?auto_12815 ) ) ( not ( = ?auto_12807 ?auto_12815 ) ) ( not ( = ?auto_12819 ?auto_12815 ) ) ( not ( = ?auto_12814 ?auto_12815 ) ) ( not ( = ?auto_12810 ?auto_12815 ) ) ( not ( = ?auto_12818 ?auto_12815 ) ) ( not ( = ?auto_12811 ?auto_12815 ) ) ( AVAILABLE ?auto_12816 ) ( TRUCK-AT ?auto_12808 ?auto_12813 ) ( LIFTING ?auto_12817 ?auto_12818 ) )
    :subtasks
    ( ( !LOAD ?auto_12817 ?auto_12818 ?auto_12808 ?auto_12813 )
      ( MAKE-ON ?auto_12806 ?auto_12807 )
      ( MAKE-ON-VERIFY ?auto_12806 ?auto_12807 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12821 - SURFACE
      ?auto_12822 - SURFACE
    )
    :vars
    (
      ?auto_12835 - HOIST
      ?auto_12826 - PLACE
      ?auto_12827 - PLACE
      ?auto_12823 - HOIST
      ?auto_12828 - SURFACE
      ?auto_12825 - SURFACE
      ?auto_12831 - PLACE
      ?auto_12830 - HOIST
      ?auto_12829 - SURFACE
      ?auto_12824 - SURFACE
      ?auto_12832 - SURFACE
      ?auto_12834 - SURFACE
      ?auto_12833 - TRUCK
      ?auto_12836 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12835 ?auto_12826 ) ( IS-CRATE ?auto_12821 ) ( not ( = ?auto_12821 ?auto_12822 ) ) ( not ( = ?auto_12827 ?auto_12826 ) ) ( HOIST-AT ?auto_12823 ?auto_12827 ) ( not ( = ?auto_12835 ?auto_12823 ) ) ( SURFACE-AT ?auto_12821 ?auto_12827 ) ( ON ?auto_12821 ?auto_12828 ) ( CLEAR ?auto_12821 ) ( not ( = ?auto_12821 ?auto_12828 ) ) ( not ( = ?auto_12822 ?auto_12828 ) ) ( IS-CRATE ?auto_12822 ) ( not ( = ?auto_12821 ?auto_12825 ) ) ( not ( = ?auto_12822 ?auto_12825 ) ) ( not ( = ?auto_12828 ?auto_12825 ) ) ( not ( = ?auto_12831 ?auto_12826 ) ) ( not ( = ?auto_12827 ?auto_12831 ) ) ( HOIST-AT ?auto_12830 ?auto_12831 ) ( not ( = ?auto_12835 ?auto_12830 ) ) ( not ( = ?auto_12823 ?auto_12830 ) ) ( SURFACE-AT ?auto_12822 ?auto_12831 ) ( ON ?auto_12822 ?auto_12829 ) ( CLEAR ?auto_12822 ) ( not ( = ?auto_12821 ?auto_12829 ) ) ( not ( = ?auto_12822 ?auto_12829 ) ) ( not ( = ?auto_12828 ?auto_12829 ) ) ( not ( = ?auto_12825 ?auto_12829 ) ) ( IS-CRATE ?auto_12825 ) ( not ( = ?auto_12821 ?auto_12824 ) ) ( not ( = ?auto_12822 ?auto_12824 ) ) ( not ( = ?auto_12828 ?auto_12824 ) ) ( not ( = ?auto_12825 ?auto_12824 ) ) ( not ( = ?auto_12829 ?auto_12824 ) ) ( AVAILABLE ?auto_12830 ) ( SURFACE-AT ?auto_12825 ?auto_12831 ) ( ON ?auto_12825 ?auto_12832 ) ( CLEAR ?auto_12825 ) ( not ( = ?auto_12821 ?auto_12832 ) ) ( not ( = ?auto_12822 ?auto_12832 ) ) ( not ( = ?auto_12828 ?auto_12832 ) ) ( not ( = ?auto_12825 ?auto_12832 ) ) ( not ( = ?auto_12829 ?auto_12832 ) ) ( not ( = ?auto_12824 ?auto_12832 ) ) ( SURFACE-AT ?auto_12834 ?auto_12826 ) ( CLEAR ?auto_12834 ) ( IS-CRATE ?auto_12824 ) ( not ( = ?auto_12821 ?auto_12834 ) ) ( not ( = ?auto_12822 ?auto_12834 ) ) ( not ( = ?auto_12828 ?auto_12834 ) ) ( not ( = ?auto_12825 ?auto_12834 ) ) ( not ( = ?auto_12829 ?auto_12834 ) ) ( not ( = ?auto_12824 ?auto_12834 ) ) ( not ( = ?auto_12832 ?auto_12834 ) ) ( AVAILABLE ?auto_12835 ) ( TRUCK-AT ?auto_12833 ?auto_12827 ) ( AVAILABLE ?auto_12823 ) ( SURFACE-AT ?auto_12824 ?auto_12827 ) ( ON ?auto_12824 ?auto_12836 ) ( CLEAR ?auto_12824 ) ( not ( = ?auto_12821 ?auto_12836 ) ) ( not ( = ?auto_12822 ?auto_12836 ) ) ( not ( = ?auto_12828 ?auto_12836 ) ) ( not ( = ?auto_12825 ?auto_12836 ) ) ( not ( = ?auto_12829 ?auto_12836 ) ) ( not ( = ?auto_12824 ?auto_12836 ) ) ( not ( = ?auto_12832 ?auto_12836 ) ) ( not ( = ?auto_12834 ?auto_12836 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12823 ?auto_12824 ?auto_12836 ?auto_12827 )
      ( MAKE-ON ?auto_12821 ?auto_12822 )
      ( MAKE-ON-VERIFY ?auto_12821 ?auto_12822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12837 - SURFACE
      ?auto_12838 - SURFACE
    )
    :vars
    (
      ?auto_12852 - HOIST
      ?auto_12841 - PLACE
      ?auto_12845 - PLACE
      ?auto_12848 - HOIST
      ?auto_12849 - SURFACE
      ?auto_12850 - SURFACE
      ?auto_12846 - PLACE
      ?auto_12847 - HOIST
      ?auto_12851 - SURFACE
      ?auto_12843 - SURFACE
      ?auto_12844 - SURFACE
      ?auto_12842 - SURFACE
      ?auto_12840 - SURFACE
      ?auto_12839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12852 ?auto_12841 ) ( IS-CRATE ?auto_12837 ) ( not ( = ?auto_12837 ?auto_12838 ) ) ( not ( = ?auto_12845 ?auto_12841 ) ) ( HOIST-AT ?auto_12848 ?auto_12845 ) ( not ( = ?auto_12852 ?auto_12848 ) ) ( SURFACE-AT ?auto_12837 ?auto_12845 ) ( ON ?auto_12837 ?auto_12849 ) ( CLEAR ?auto_12837 ) ( not ( = ?auto_12837 ?auto_12849 ) ) ( not ( = ?auto_12838 ?auto_12849 ) ) ( IS-CRATE ?auto_12838 ) ( not ( = ?auto_12837 ?auto_12850 ) ) ( not ( = ?auto_12838 ?auto_12850 ) ) ( not ( = ?auto_12849 ?auto_12850 ) ) ( not ( = ?auto_12846 ?auto_12841 ) ) ( not ( = ?auto_12845 ?auto_12846 ) ) ( HOIST-AT ?auto_12847 ?auto_12846 ) ( not ( = ?auto_12852 ?auto_12847 ) ) ( not ( = ?auto_12848 ?auto_12847 ) ) ( SURFACE-AT ?auto_12838 ?auto_12846 ) ( ON ?auto_12838 ?auto_12851 ) ( CLEAR ?auto_12838 ) ( not ( = ?auto_12837 ?auto_12851 ) ) ( not ( = ?auto_12838 ?auto_12851 ) ) ( not ( = ?auto_12849 ?auto_12851 ) ) ( not ( = ?auto_12850 ?auto_12851 ) ) ( IS-CRATE ?auto_12850 ) ( not ( = ?auto_12837 ?auto_12843 ) ) ( not ( = ?auto_12838 ?auto_12843 ) ) ( not ( = ?auto_12849 ?auto_12843 ) ) ( not ( = ?auto_12850 ?auto_12843 ) ) ( not ( = ?auto_12851 ?auto_12843 ) ) ( AVAILABLE ?auto_12847 ) ( SURFACE-AT ?auto_12850 ?auto_12846 ) ( ON ?auto_12850 ?auto_12844 ) ( CLEAR ?auto_12850 ) ( not ( = ?auto_12837 ?auto_12844 ) ) ( not ( = ?auto_12838 ?auto_12844 ) ) ( not ( = ?auto_12849 ?auto_12844 ) ) ( not ( = ?auto_12850 ?auto_12844 ) ) ( not ( = ?auto_12851 ?auto_12844 ) ) ( not ( = ?auto_12843 ?auto_12844 ) ) ( SURFACE-AT ?auto_12842 ?auto_12841 ) ( CLEAR ?auto_12842 ) ( IS-CRATE ?auto_12843 ) ( not ( = ?auto_12837 ?auto_12842 ) ) ( not ( = ?auto_12838 ?auto_12842 ) ) ( not ( = ?auto_12849 ?auto_12842 ) ) ( not ( = ?auto_12850 ?auto_12842 ) ) ( not ( = ?auto_12851 ?auto_12842 ) ) ( not ( = ?auto_12843 ?auto_12842 ) ) ( not ( = ?auto_12844 ?auto_12842 ) ) ( AVAILABLE ?auto_12852 ) ( AVAILABLE ?auto_12848 ) ( SURFACE-AT ?auto_12843 ?auto_12845 ) ( ON ?auto_12843 ?auto_12840 ) ( CLEAR ?auto_12843 ) ( not ( = ?auto_12837 ?auto_12840 ) ) ( not ( = ?auto_12838 ?auto_12840 ) ) ( not ( = ?auto_12849 ?auto_12840 ) ) ( not ( = ?auto_12850 ?auto_12840 ) ) ( not ( = ?auto_12851 ?auto_12840 ) ) ( not ( = ?auto_12843 ?auto_12840 ) ) ( not ( = ?auto_12844 ?auto_12840 ) ) ( not ( = ?auto_12842 ?auto_12840 ) ) ( TRUCK-AT ?auto_12839 ?auto_12841 ) )
    :subtasks
    ( ( !DRIVE ?auto_12839 ?auto_12841 ?auto_12845 )
      ( MAKE-ON ?auto_12837 ?auto_12838 )
      ( MAKE-ON-VERIFY ?auto_12837 ?auto_12838 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12853 - SURFACE
      ?auto_12854 - SURFACE
    )
    :vars
    (
      ?auto_12858 - HOIST
      ?auto_12859 - PLACE
      ?auto_12864 - PLACE
      ?auto_12860 - HOIST
      ?auto_12861 - SURFACE
      ?auto_12867 - SURFACE
      ?auto_12856 - PLACE
      ?auto_12855 - HOIST
      ?auto_12868 - SURFACE
      ?auto_12862 - SURFACE
      ?auto_12863 - SURFACE
      ?auto_12857 - SURFACE
      ?auto_12865 - SURFACE
      ?auto_12866 - TRUCK
      ?auto_12869 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12858 ?auto_12859 ) ( IS-CRATE ?auto_12853 ) ( not ( = ?auto_12853 ?auto_12854 ) ) ( not ( = ?auto_12864 ?auto_12859 ) ) ( HOIST-AT ?auto_12860 ?auto_12864 ) ( not ( = ?auto_12858 ?auto_12860 ) ) ( SURFACE-AT ?auto_12853 ?auto_12864 ) ( ON ?auto_12853 ?auto_12861 ) ( CLEAR ?auto_12853 ) ( not ( = ?auto_12853 ?auto_12861 ) ) ( not ( = ?auto_12854 ?auto_12861 ) ) ( IS-CRATE ?auto_12854 ) ( not ( = ?auto_12853 ?auto_12867 ) ) ( not ( = ?auto_12854 ?auto_12867 ) ) ( not ( = ?auto_12861 ?auto_12867 ) ) ( not ( = ?auto_12856 ?auto_12859 ) ) ( not ( = ?auto_12864 ?auto_12856 ) ) ( HOIST-AT ?auto_12855 ?auto_12856 ) ( not ( = ?auto_12858 ?auto_12855 ) ) ( not ( = ?auto_12860 ?auto_12855 ) ) ( SURFACE-AT ?auto_12854 ?auto_12856 ) ( ON ?auto_12854 ?auto_12868 ) ( CLEAR ?auto_12854 ) ( not ( = ?auto_12853 ?auto_12868 ) ) ( not ( = ?auto_12854 ?auto_12868 ) ) ( not ( = ?auto_12861 ?auto_12868 ) ) ( not ( = ?auto_12867 ?auto_12868 ) ) ( IS-CRATE ?auto_12867 ) ( not ( = ?auto_12853 ?auto_12862 ) ) ( not ( = ?auto_12854 ?auto_12862 ) ) ( not ( = ?auto_12861 ?auto_12862 ) ) ( not ( = ?auto_12867 ?auto_12862 ) ) ( not ( = ?auto_12868 ?auto_12862 ) ) ( AVAILABLE ?auto_12855 ) ( SURFACE-AT ?auto_12867 ?auto_12856 ) ( ON ?auto_12867 ?auto_12863 ) ( CLEAR ?auto_12867 ) ( not ( = ?auto_12853 ?auto_12863 ) ) ( not ( = ?auto_12854 ?auto_12863 ) ) ( not ( = ?auto_12861 ?auto_12863 ) ) ( not ( = ?auto_12867 ?auto_12863 ) ) ( not ( = ?auto_12868 ?auto_12863 ) ) ( not ( = ?auto_12862 ?auto_12863 ) ) ( IS-CRATE ?auto_12862 ) ( not ( = ?auto_12853 ?auto_12857 ) ) ( not ( = ?auto_12854 ?auto_12857 ) ) ( not ( = ?auto_12861 ?auto_12857 ) ) ( not ( = ?auto_12867 ?auto_12857 ) ) ( not ( = ?auto_12868 ?auto_12857 ) ) ( not ( = ?auto_12862 ?auto_12857 ) ) ( not ( = ?auto_12863 ?auto_12857 ) ) ( AVAILABLE ?auto_12860 ) ( SURFACE-AT ?auto_12862 ?auto_12864 ) ( ON ?auto_12862 ?auto_12865 ) ( CLEAR ?auto_12862 ) ( not ( = ?auto_12853 ?auto_12865 ) ) ( not ( = ?auto_12854 ?auto_12865 ) ) ( not ( = ?auto_12861 ?auto_12865 ) ) ( not ( = ?auto_12867 ?auto_12865 ) ) ( not ( = ?auto_12868 ?auto_12865 ) ) ( not ( = ?auto_12862 ?auto_12865 ) ) ( not ( = ?auto_12863 ?auto_12865 ) ) ( not ( = ?auto_12857 ?auto_12865 ) ) ( TRUCK-AT ?auto_12866 ?auto_12859 ) ( SURFACE-AT ?auto_12869 ?auto_12859 ) ( CLEAR ?auto_12869 ) ( LIFTING ?auto_12858 ?auto_12857 ) ( IS-CRATE ?auto_12857 ) ( not ( = ?auto_12853 ?auto_12869 ) ) ( not ( = ?auto_12854 ?auto_12869 ) ) ( not ( = ?auto_12861 ?auto_12869 ) ) ( not ( = ?auto_12867 ?auto_12869 ) ) ( not ( = ?auto_12868 ?auto_12869 ) ) ( not ( = ?auto_12862 ?auto_12869 ) ) ( not ( = ?auto_12863 ?auto_12869 ) ) ( not ( = ?auto_12857 ?auto_12869 ) ) ( not ( = ?auto_12865 ?auto_12869 ) ) )
    :subtasks
    ( ( !DROP ?auto_12858 ?auto_12857 ?auto_12869 ?auto_12859 )
      ( MAKE-ON ?auto_12853 ?auto_12854 )
      ( MAKE-ON-VERIFY ?auto_12853 ?auto_12854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12870 - SURFACE
      ?auto_12871 - SURFACE
    )
    :vars
    (
      ?auto_12884 - HOIST
      ?auto_12872 - PLACE
      ?auto_12874 - PLACE
      ?auto_12876 - HOIST
      ?auto_12882 - SURFACE
      ?auto_12873 - SURFACE
      ?auto_12881 - PLACE
      ?auto_12879 - HOIST
      ?auto_12880 - SURFACE
      ?auto_12885 - SURFACE
      ?auto_12878 - SURFACE
      ?auto_12883 - SURFACE
      ?auto_12875 - SURFACE
      ?auto_12886 - TRUCK
      ?auto_12877 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12884 ?auto_12872 ) ( IS-CRATE ?auto_12870 ) ( not ( = ?auto_12870 ?auto_12871 ) ) ( not ( = ?auto_12874 ?auto_12872 ) ) ( HOIST-AT ?auto_12876 ?auto_12874 ) ( not ( = ?auto_12884 ?auto_12876 ) ) ( SURFACE-AT ?auto_12870 ?auto_12874 ) ( ON ?auto_12870 ?auto_12882 ) ( CLEAR ?auto_12870 ) ( not ( = ?auto_12870 ?auto_12882 ) ) ( not ( = ?auto_12871 ?auto_12882 ) ) ( IS-CRATE ?auto_12871 ) ( not ( = ?auto_12870 ?auto_12873 ) ) ( not ( = ?auto_12871 ?auto_12873 ) ) ( not ( = ?auto_12882 ?auto_12873 ) ) ( not ( = ?auto_12881 ?auto_12872 ) ) ( not ( = ?auto_12874 ?auto_12881 ) ) ( HOIST-AT ?auto_12879 ?auto_12881 ) ( not ( = ?auto_12884 ?auto_12879 ) ) ( not ( = ?auto_12876 ?auto_12879 ) ) ( SURFACE-AT ?auto_12871 ?auto_12881 ) ( ON ?auto_12871 ?auto_12880 ) ( CLEAR ?auto_12871 ) ( not ( = ?auto_12870 ?auto_12880 ) ) ( not ( = ?auto_12871 ?auto_12880 ) ) ( not ( = ?auto_12882 ?auto_12880 ) ) ( not ( = ?auto_12873 ?auto_12880 ) ) ( IS-CRATE ?auto_12873 ) ( not ( = ?auto_12870 ?auto_12885 ) ) ( not ( = ?auto_12871 ?auto_12885 ) ) ( not ( = ?auto_12882 ?auto_12885 ) ) ( not ( = ?auto_12873 ?auto_12885 ) ) ( not ( = ?auto_12880 ?auto_12885 ) ) ( AVAILABLE ?auto_12879 ) ( SURFACE-AT ?auto_12873 ?auto_12881 ) ( ON ?auto_12873 ?auto_12878 ) ( CLEAR ?auto_12873 ) ( not ( = ?auto_12870 ?auto_12878 ) ) ( not ( = ?auto_12871 ?auto_12878 ) ) ( not ( = ?auto_12882 ?auto_12878 ) ) ( not ( = ?auto_12873 ?auto_12878 ) ) ( not ( = ?auto_12880 ?auto_12878 ) ) ( not ( = ?auto_12885 ?auto_12878 ) ) ( IS-CRATE ?auto_12885 ) ( not ( = ?auto_12870 ?auto_12883 ) ) ( not ( = ?auto_12871 ?auto_12883 ) ) ( not ( = ?auto_12882 ?auto_12883 ) ) ( not ( = ?auto_12873 ?auto_12883 ) ) ( not ( = ?auto_12880 ?auto_12883 ) ) ( not ( = ?auto_12885 ?auto_12883 ) ) ( not ( = ?auto_12878 ?auto_12883 ) ) ( AVAILABLE ?auto_12876 ) ( SURFACE-AT ?auto_12885 ?auto_12874 ) ( ON ?auto_12885 ?auto_12875 ) ( CLEAR ?auto_12885 ) ( not ( = ?auto_12870 ?auto_12875 ) ) ( not ( = ?auto_12871 ?auto_12875 ) ) ( not ( = ?auto_12882 ?auto_12875 ) ) ( not ( = ?auto_12873 ?auto_12875 ) ) ( not ( = ?auto_12880 ?auto_12875 ) ) ( not ( = ?auto_12885 ?auto_12875 ) ) ( not ( = ?auto_12878 ?auto_12875 ) ) ( not ( = ?auto_12883 ?auto_12875 ) ) ( TRUCK-AT ?auto_12886 ?auto_12872 ) ( SURFACE-AT ?auto_12877 ?auto_12872 ) ( CLEAR ?auto_12877 ) ( IS-CRATE ?auto_12883 ) ( not ( = ?auto_12870 ?auto_12877 ) ) ( not ( = ?auto_12871 ?auto_12877 ) ) ( not ( = ?auto_12882 ?auto_12877 ) ) ( not ( = ?auto_12873 ?auto_12877 ) ) ( not ( = ?auto_12880 ?auto_12877 ) ) ( not ( = ?auto_12885 ?auto_12877 ) ) ( not ( = ?auto_12878 ?auto_12877 ) ) ( not ( = ?auto_12883 ?auto_12877 ) ) ( not ( = ?auto_12875 ?auto_12877 ) ) ( AVAILABLE ?auto_12884 ) ( IN ?auto_12883 ?auto_12886 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12884 ?auto_12883 ?auto_12886 ?auto_12872 )
      ( MAKE-ON ?auto_12870 ?auto_12871 )
      ( MAKE-ON-VERIFY ?auto_12870 ?auto_12871 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12887 - SURFACE
      ?auto_12888 - SURFACE
    )
    :vars
    (
      ?auto_12902 - HOIST
      ?auto_12889 - PLACE
      ?auto_12899 - PLACE
      ?auto_12897 - HOIST
      ?auto_12890 - SURFACE
      ?auto_12895 - SURFACE
      ?auto_12893 - PLACE
      ?auto_12891 - HOIST
      ?auto_12898 - SURFACE
      ?auto_12896 - SURFACE
      ?auto_12903 - SURFACE
      ?auto_12900 - SURFACE
      ?auto_12892 - SURFACE
      ?auto_12901 - SURFACE
      ?auto_12894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12902 ?auto_12889 ) ( IS-CRATE ?auto_12887 ) ( not ( = ?auto_12887 ?auto_12888 ) ) ( not ( = ?auto_12899 ?auto_12889 ) ) ( HOIST-AT ?auto_12897 ?auto_12899 ) ( not ( = ?auto_12902 ?auto_12897 ) ) ( SURFACE-AT ?auto_12887 ?auto_12899 ) ( ON ?auto_12887 ?auto_12890 ) ( CLEAR ?auto_12887 ) ( not ( = ?auto_12887 ?auto_12890 ) ) ( not ( = ?auto_12888 ?auto_12890 ) ) ( IS-CRATE ?auto_12888 ) ( not ( = ?auto_12887 ?auto_12895 ) ) ( not ( = ?auto_12888 ?auto_12895 ) ) ( not ( = ?auto_12890 ?auto_12895 ) ) ( not ( = ?auto_12893 ?auto_12889 ) ) ( not ( = ?auto_12899 ?auto_12893 ) ) ( HOIST-AT ?auto_12891 ?auto_12893 ) ( not ( = ?auto_12902 ?auto_12891 ) ) ( not ( = ?auto_12897 ?auto_12891 ) ) ( SURFACE-AT ?auto_12888 ?auto_12893 ) ( ON ?auto_12888 ?auto_12898 ) ( CLEAR ?auto_12888 ) ( not ( = ?auto_12887 ?auto_12898 ) ) ( not ( = ?auto_12888 ?auto_12898 ) ) ( not ( = ?auto_12890 ?auto_12898 ) ) ( not ( = ?auto_12895 ?auto_12898 ) ) ( IS-CRATE ?auto_12895 ) ( not ( = ?auto_12887 ?auto_12896 ) ) ( not ( = ?auto_12888 ?auto_12896 ) ) ( not ( = ?auto_12890 ?auto_12896 ) ) ( not ( = ?auto_12895 ?auto_12896 ) ) ( not ( = ?auto_12898 ?auto_12896 ) ) ( AVAILABLE ?auto_12891 ) ( SURFACE-AT ?auto_12895 ?auto_12893 ) ( ON ?auto_12895 ?auto_12903 ) ( CLEAR ?auto_12895 ) ( not ( = ?auto_12887 ?auto_12903 ) ) ( not ( = ?auto_12888 ?auto_12903 ) ) ( not ( = ?auto_12890 ?auto_12903 ) ) ( not ( = ?auto_12895 ?auto_12903 ) ) ( not ( = ?auto_12898 ?auto_12903 ) ) ( not ( = ?auto_12896 ?auto_12903 ) ) ( IS-CRATE ?auto_12896 ) ( not ( = ?auto_12887 ?auto_12900 ) ) ( not ( = ?auto_12888 ?auto_12900 ) ) ( not ( = ?auto_12890 ?auto_12900 ) ) ( not ( = ?auto_12895 ?auto_12900 ) ) ( not ( = ?auto_12898 ?auto_12900 ) ) ( not ( = ?auto_12896 ?auto_12900 ) ) ( not ( = ?auto_12903 ?auto_12900 ) ) ( AVAILABLE ?auto_12897 ) ( SURFACE-AT ?auto_12896 ?auto_12899 ) ( ON ?auto_12896 ?auto_12892 ) ( CLEAR ?auto_12896 ) ( not ( = ?auto_12887 ?auto_12892 ) ) ( not ( = ?auto_12888 ?auto_12892 ) ) ( not ( = ?auto_12890 ?auto_12892 ) ) ( not ( = ?auto_12895 ?auto_12892 ) ) ( not ( = ?auto_12898 ?auto_12892 ) ) ( not ( = ?auto_12896 ?auto_12892 ) ) ( not ( = ?auto_12903 ?auto_12892 ) ) ( not ( = ?auto_12900 ?auto_12892 ) ) ( SURFACE-AT ?auto_12901 ?auto_12889 ) ( CLEAR ?auto_12901 ) ( IS-CRATE ?auto_12900 ) ( not ( = ?auto_12887 ?auto_12901 ) ) ( not ( = ?auto_12888 ?auto_12901 ) ) ( not ( = ?auto_12890 ?auto_12901 ) ) ( not ( = ?auto_12895 ?auto_12901 ) ) ( not ( = ?auto_12898 ?auto_12901 ) ) ( not ( = ?auto_12896 ?auto_12901 ) ) ( not ( = ?auto_12903 ?auto_12901 ) ) ( not ( = ?auto_12900 ?auto_12901 ) ) ( not ( = ?auto_12892 ?auto_12901 ) ) ( AVAILABLE ?auto_12902 ) ( IN ?auto_12900 ?auto_12894 ) ( TRUCK-AT ?auto_12894 ?auto_12893 ) )
    :subtasks
    ( ( !DRIVE ?auto_12894 ?auto_12893 ?auto_12889 )
      ( MAKE-ON ?auto_12887 ?auto_12888 )
      ( MAKE-ON-VERIFY ?auto_12887 ?auto_12888 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12904 - SURFACE
      ?auto_12905 - SURFACE
    )
    :vars
    (
      ?auto_12910 - HOIST
      ?auto_12917 - PLACE
      ?auto_12914 - PLACE
      ?auto_12909 - HOIST
      ?auto_12919 - SURFACE
      ?auto_12912 - SURFACE
      ?auto_12916 - PLACE
      ?auto_12908 - HOIST
      ?auto_12913 - SURFACE
      ?auto_12906 - SURFACE
      ?auto_12911 - SURFACE
      ?auto_12918 - SURFACE
      ?auto_12915 - SURFACE
      ?auto_12907 - SURFACE
      ?auto_12920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12910 ?auto_12917 ) ( IS-CRATE ?auto_12904 ) ( not ( = ?auto_12904 ?auto_12905 ) ) ( not ( = ?auto_12914 ?auto_12917 ) ) ( HOIST-AT ?auto_12909 ?auto_12914 ) ( not ( = ?auto_12910 ?auto_12909 ) ) ( SURFACE-AT ?auto_12904 ?auto_12914 ) ( ON ?auto_12904 ?auto_12919 ) ( CLEAR ?auto_12904 ) ( not ( = ?auto_12904 ?auto_12919 ) ) ( not ( = ?auto_12905 ?auto_12919 ) ) ( IS-CRATE ?auto_12905 ) ( not ( = ?auto_12904 ?auto_12912 ) ) ( not ( = ?auto_12905 ?auto_12912 ) ) ( not ( = ?auto_12919 ?auto_12912 ) ) ( not ( = ?auto_12916 ?auto_12917 ) ) ( not ( = ?auto_12914 ?auto_12916 ) ) ( HOIST-AT ?auto_12908 ?auto_12916 ) ( not ( = ?auto_12910 ?auto_12908 ) ) ( not ( = ?auto_12909 ?auto_12908 ) ) ( SURFACE-AT ?auto_12905 ?auto_12916 ) ( ON ?auto_12905 ?auto_12913 ) ( CLEAR ?auto_12905 ) ( not ( = ?auto_12904 ?auto_12913 ) ) ( not ( = ?auto_12905 ?auto_12913 ) ) ( not ( = ?auto_12919 ?auto_12913 ) ) ( not ( = ?auto_12912 ?auto_12913 ) ) ( IS-CRATE ?auto_12912 ) ( not ( = ?auto_12904 ?auto_12906 ) ) ( not ( = ?auto_12905 ?auto_12906 ) ) ( not ( = ?auto_12919 ?auto_12906 ) ) ( not ( = ?auto_12912 ?auto_12906 ) ) ( not ( = ?auto_12913 ?auto_12906 ) ) ( SURFACE-AT ?auto_12912 ?auto_12916 ) ( ON ?auto_12912 ?auto_12911 ) ( CLEAR ?auto_12912 ) ( not ( = ?auto_12904 ?auto_12911 ) ) ( not ( = ?auto_12905 ?auto_12911 ) ) ( not ( = ?auto_12919 ?auto_12911 ) ) ( not ( = ?auto_12912 ?auto_12911 ) ) ( not ( = ?auto_12913 ?auto_12911 ) ) ( not ( = ?auto_12906 ?auto_12911 ) ) ( IS-CRATE ?auto_12906 ) ( not ( = ?auto_12904 ?auto_12918 ) ) ( not ( = ?auto_12905 ?auto_12918 ) ) ( not ( = ?auto_12919 ?auto_12918 ) ) ( not ( = ?auto_12912 ?auto_12918 ) ) ( not ( = ?auto_12913 ?auto_12918 ) ) ( not ( = ?auto_12906 ?auto_12918 ) ) ( not ( = ?auto_12911 ?auto_12918 ) ) ( AVAILABLE ?auto_12909 ) ( SURFACE-AT ?auto_12906 ?auto_12914 ) ( ON ?auto_12906 ?auto_12915 ) ( CLEAR ?auto_12906 ) ( not ( = ?auto_12904 ?auto_12915 ) ) ( not ( = ?auto_12905 ?auto_12915 ) ) ( not ( = ?auto_12919 ?auto_12915 ) ) ( not ( = ?auto_12912 ?auto_12915 ) ) ( not ( = ?auto_12913 ?auto_12915 ) ) ( not ( = ?auto_12906 ?auto_12915 ) ) ( not ( = ?auto_12911 ?auto_12915 ) ) ( not ( = ?auto_12918 ?auto_12915 ) ) ( SURFACE-AT ?auto_12907 ?auto_12917 ) ( CLEAR ?auto_12907 ) ( IS-CRATE ?auto_12918 ) ( not ( = ?auto_12904 ?auto_12907 ) ) ( not ( = ?auto_12905 ?auto_12907 ) ) ( not ( = ?auto_12919 ?auto_12907 ) ) ( not ( = ?auto_12912 ?auto_12907 ) ) ( not ( = ?auto_12913 ?auto_12907 ) ) ( not ( = ?auto_12906 ?auto_12907 ) ) ( not ( = ?auto_12911 ?auto_12907 ) ) ( not ( = ?auto_12918 ?auto_12907 ) ) ( not ( = ?auto_12915 ?auto_12907 ) ) ( AVAILABLE ?auto_12910 ) ( TRUCK-AT ?auto_12920 ?auto_12916 ) ( LIFTING ?auto_12908 ?auto_12918 ) )
    :subtasks
    ( ( !LOAD ?auto_12908 ?auto_12918 ?auto_12920 ?auto_12916 )
      ( MAKE-ON ?auto_12904 ?auto_12905 )
      ( MAKE-ON-VERIFY ?auto_12904 ?auto_12905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12921 - SURFACE
      ?auto_12922 - SURFACE
    )
    :vars
    (
      ?auto_12937 - HOIST
      ?auto_12928 - PLACE
      ?auto_12934 - PLACE
      ?auto_12924 - HOIST
      ?auto_12927 - SURFACE
      ?auto_12933 - SURFACE
      ?auto_12935 - PLACE
      ?auto_12925 - HOIST
      ?auto_12930 - SURFACE
      ?auto_12936 - SURFACE
      ?auto_12932 - SURFACE
      ?auto_12923 - SURFACE
      ?auto_12926 - SURFACE
      ?auto_12931 - SURFACE
      ?auto_12929 - TRUCK
      ?auto_12938 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12937 ?auto_12928 ) ( IS-CRATE ?auto_12921 ) ( not ( = ?auto_12921 ?auto_12922 ) ) ( not ( = ?auto_12934 ?auto_12928 ) ) ( HOIST-AT ?auto_12924 ?auto_12934 ) ( not ( = ?auto_12937 ?auto_12924 ) ) ( SURFACE-AT ?auto_12921 ?auto_12934 ) ( ON ?auto_12921 ?auto_12927 ) ( CLEAR ?auto_12921 ) ( not ( = ?auto_12921 ?auto_12927 ) ) ( not ( = ?auto_12922 ?auto_12927 ) ) ( IS-CRATE ?auto_12922 ) ( not ( = ?auto_12921 ?auto_12933 ) ) ( not ( = ?auto_12922 ?auto_12933 ) ) ( not ( = ?auto_12927 ?auto_12933 ) ) ( not ( = ?auto_12935 ?auto_12928 ) ) ( not ( = ?auto_12934 ?auto_12935 ) ) ( HOIST-AT ?auto_12925 ?auto_12935 ) ( not ( = ?auto_12937 ?auto_12925 ) ) ( not ( = ?auto_12924 ?auto_12925 ) ) ( SURFACE-AT ?auto_12922 ?auto_12935 ) ( ON ?auto_12922 ?auto_12930 ) ( CLEAR ?auto_12922 ) ( not ( = ?auto_12921 ?auto_12930 ) ) ( not ( = ?auto_12922 ?auto_12930 ) ) ( not ( = ?auto_12927 ?auto_12930 ) ) ( not ( = ?auto_12933 ?auto_12930 ) ) ( IS-CRATE ?auto_12933 ) ( not ( = ?auto_12921 ?auto_12936 ) ) ( not ( = ?auto_12922 ?auto_12936 ) ) ( not ( = ?auto_12927 ?auto_12936 ) ) ( not ( = ?auto_12933 ?auto_12936 ) ) ( not ( = ?auto_12930 ?auto_12936 ) ) ( SURFACE-AT ?auto_12933 ?auto_12935 ) ( ON ?auto_12933 ?auto_12932 ) ( CLEAR ?auto_12933 ) ( not ( = ?auto_12921 ?auto_12932 ) ) ( not ( = ?auto_12922 ?auto_12932 ) ) ( not ( = ?auto_12927 ?auto_12932 ) ) ( not ( = ?auto_12933 ?auto_12932 ) ) ( not ( = ?auto_12930 ?auto_12932 ) ) ( not ( = ?auto_12936 ?auto_12932 ) ) ( IS-CRATE ?auto_12936 ) ( not ( = ?auto_12921 ?auto_12923 ) ) ( not ( = ?auto_12922 ?auto_12923 ) ) ( not ( = ?auto_12927 ?auto_12923 ) ) ( not ( = ?auto_12933 ?auto_12923 ) ) ( not ( = ?auto_12930 ?auto_12923 ) ) ( not ( = ?auto_12936 ?auto_12923 ) ) ( not ( = ?auto_12932 ?auto_12923 ) ) ( AVAILABLE ?auto_12924 ) ( SURFACE-AT ?auto_12936 ?auto_12934 ) ( ON ?auto_12936 ?auto_12926 ) ( CLEAR ?auto_12936 ) ( not ( = ?auto_12921 ?auto_12926 ) ) ( not ( = ?auto_12922 ?auto_12926 ) ) ( not ( = ?auto_12927 ?auto_12926 ) ) ( not ( = ?auto_12933 ?auto_12926 ) ) ( not ( = ?auto_12930 ?auto_12926 ) ) ( not ( = ?auto_12936 ?auto_12926 ) ) ( not ( = ?auto_12932 ?auto_12926 ) ) ( not ( = ?auto_12923 ?auto_12926 ) ) ( SURFACE-AT ?auto_12931 ?auto_12928 ) ( CLEAR ?auto_12931 ) ( IS-CRATE ?auto_12923 ) ( not ( = ?auto_12921 ?auto_12931 ) ) ( not ( = ?auto_12922 ?auto_12931 ) ) ( not ( = ?auto_12927 ?auto_12931 ) ) ( not ( = ?auto_12933 ?auto_12931 ) ) ( not ( = ?auto_12930 ?auto_12931 ) ) ( not ( = ?auto_12936 ?auto_12931 ) ) ( not ( = ?auto_12932 ?auto_12931 ) ) ( not ( = ?auto_12923 ?auto_12931 ) ) ( not ( = ?auto_12926 ?auto_12931 ) ) ( AVAILABLE ?auto_12937 ) ( TRUCK-AT ?auto_12929 ?auto_12935 ) ( AVAILABLE ?auto_12925 ) ( SURFACE-AT ?auto_12923 ?auto_12935 ) ( ON ?auto_12923 ?auto_12938 ) ( CLEAR ?auto_12923 ) ( not ( = ?auto_12921 ?auto_12938 ) ) ( not ( = ?auto_12922 ?auto_12938 ) ) ( not ( = ?auto_12927 ?auto_12938 ) ) ( not ( = ?auto_12933 ?auto_12938 ) ) ( not ( = ?auto_12930 ?auto_12938 ) ) ( not ( = ?auto_12936 ?auto_12938 ) ) ( not ( = ?auto_12932 ?auto_12938 ) ) ( not ( = ?auto_12923 ?auto_12938 ) ) ( not ( = ?auto_12926 ?auto_12938 ) ) ( not ( = ?auto_12931 ?auto_12938 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12925 ?auto_12923 ?auto_12938 ?auto_12935 )
      ( MAKE-ON ?auto_12921 ?auto_12922 )
      ( MAKE-ON-VERIFY ?auto_12921 ?auto_12922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12939 - SURFACE
      ?auto_12940 - SURFACE
    )
    :vars
    (
      ?auto_12944 - HOIST
      ?auto_12948 - PLACE
      ?auto_12950 - PLACE
      ?auto_12941 - HOIST
      ?auto_12951 - SURFACE
      ?auto_12947 - SURFACE
      ?auto_12942 - PLACE
      ?auto_12956 - HOIST
      ?auto_12946 - SURFACE
      ?auto_12952 - SURFACE
      ?auto_12949 - SURFACE
      ?auto_12954 - SURFACE
      ?auto_12943 - SURFACE
      ?auto_12953 - SURFACE
      ?auto_12955 - SURFACE
      ?auto_12945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12944 ?auto_12948 ) ( IS-CRATE ?auto_12939 ) ( not ( = ?auto_12939 ?auto_12940 ) ) ( not ( = ?auto_12950 ?auto_12948 ) ) ( HOIST-AT ?auto_12941 ?auto_12950 ) ( not ( = ?auto_12944 ?auto_12941 ) ) ( SURFACE-AT ?auto_12939 ?auto_12950 ) ( ON ?auto_12939 ?auto_12951 ) ( CLEAR ?auto_12939 ) ( not ( = ?auto_12939 ?auto_12951 ) ) ( not ( = ?auto_12940 ?auto_12951 ) ) ( IS-CRATE ?auto_12940 ) ( not ( = ?auto_12939 ?auto_12947 ) ) ( not ( = ?auto_12940 ?auto_12947 ) ) ( not ( = ?auto_12951 ?auto_12947 ) ) ( not ( = ?auto_12942 ?auto_12948 ) ) ( not ( = ?auto_12950 ?auto_12942 ) ) ( HOIST-AT ?auto_12956 ?auto_12942 ) ( not ( = ?auto_12944 ?auto_12956 ) ) ( not ( = ?auto_12941 ?auto_12956 ) ) ( SURFACE-AT ?auto_12940 ?auto_12942 ) ( ON ?auto_12940 ?auto_12946 ) ( CLEAR ?auto_12940 ) ( not ( = ?auto_12939 ?auto_12946 ) ) ( not ( = ?auto_12940 ?auto_12946 ) ) ( not ( = ?auto_12951 ?auto_12946 ) ) ( not ( = ?auto_12947 ?auto_12946 ) ) ( IS-CRATE ?auto_12947 ) ( not ( = ?auto_12939 ?auto_12952 ) ) ( not ( = ?auto_12940 ?auto_12952 ) ) ( not ( = ?auto_12951 ?auto_12952 ) ) ( not ( = ?auto_12947 ?auto_12952 ) ) ( not ( = ?auto_12946 ?auto_12952 ) ) ( SURFACE-AT ?auto_12947 ?auto_12942 ) ( ON ?auto_12947 ?auto_12949 ) ( CLEAR ?auto_12947 ) ( not ( = ?auto_12939 ?auto_12949 ) ) ( not ( = ?auto_12940 ?auto_12949 ) ) ( not ( = ?auto_12951 ?auto_12949 ) ) ( not ( = ?auto_12947 ?auto_12949 ) ) ( not ( = ?auto_12946 ?auto_12949 ) ) ( not ( = ?auto_12952 ?auto_12949 ) ) ( IS-CRATE ?auto_12952 ) ( not ( = ?auto_12939 ?auto_12954 ) ) ( not ( = ?auto_12940 ?auto_12954 ) ) ( not ( = ?auto_12951 ?auto_12954 ) ) ( not ( = ?auto_12947 ?auto_12954 ) ) ( not ( = ?auto_12946 ?auto_12954 ) ) ( not ( = ?auto_12952 ?auto_12954 ) ) ( not ( = ?auto_12949 ?auto_12954 ) ) ( AVAILABLE ?auto_12941 ) ( SURFACE-AT ?auto_12952 ?auto_12950 ) ( ON ?auto_12952 ?auto_12943 ) ( CLEAR ?auto_12952 ) ( not ( = ?auto_12939 ?auto_12943 ) ) ( not ( = ?auto_12940 ?auto_12943 ) ) ( not ( = ?auto_12951 ?auto_12943 ) ) ( not ( = ?auto_12947 ?auto_12943 ) ) ( not ( = ?auto_12946 ?auto_12943 ) ) ( not ( = ?auto_12952 ?auto_12943 ) ) ( not ( = ?auto_12949 ?auto_12943 ) ) ( not ( = ?auto_12954 ?auto_12943 ) ) ( SURFACE-AT ?auto_12953 ?auto_12948 ) ( CLEAR ?auto_12953 ) ( IS-CRATE ?auto_12954 ) ( not ( = ?auto_12939 ?auto_12953 ) ) ( not ( = ?auto_12940 ?auto_12953 ) ) ( not ( = ?auto_12951 ?auto_12953 ) ) ( not ( = ?auto_12947 ?auto_12953 ) ) ( not ( = ?auto_12946 ?auto_12953 ) ) ( not ( = ?auto_12952 ?auto_12953 ) ) ( not ( = ?auto_12949 ?auto_12953 ) ) ( not ( = ?auto_12954 ?auto_12953 ) ) ( not ( = ?auto_12943 ?auto_12953 ) ) ( AVAILABLE ?auto_12944 ) ( AVAILABLE ?auto_12956 ) ( SURFACE-AT ?auto_12954 ?auto_12942 ) ( ON ?auto_12954 ?auto_12955 ) ( CLEAR ?auto_12954 ) ( not ( = ?auto_12939 ?auto_12955 ) ) ( not ( = ?auto_12940 ?auto_12955 ) ) ( not ( = ?auto_12951 ?auto_12955 ) ) ( not ( = ?auto_12947 ?auto_12955 ) ) ( not ( = ?auto_12946 ?auto_12955 ) ) ( not ( = ?auto_12952 ?auto_12955 ) ) ( not ( = ?auto_12949 ?auto_12955 ) ) ( not ( = ?auto_12954 ?auto_12955 ) ) ( not ( = ?auto_12943 ?auto_12955 ) ) ( not ( = ?auto_12953 ?auto_12955 ) ) ( TRUCK-AT ?auto_12945 ?auto_12948 ) )
    :subtasks
    ( ( !DRIVE ?auto_12945 ?auto_12948 ?auto_12942 )
      ( MAKE-ON ?auto_12939 ?auto_12940 )
      ( MAKE-ON-VERIFY ?auto_12939 ?auto_12940 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12959 - SURFACE
      ?auto_12960 - SURFACE
    )
    :vars
    (
      ?auto_12961 - HOIST
      ?auto_12962 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12961 ?auto_12962 ) ( SURFACE-AT ?auto_12960 ?auto_12962 ) ( CLEAR ?auto_12960 ) ( LIFTING ?auto_12961 ?auto_12959 ) ( IS-CRATE ?auto_12959 ) ( not ( = ?auto_12959 ?auto_12960 ) ) )
    :subtasks
    ( ( !DROP ?auto_12961 ?auto_12959 ?auto_12960 ?auto_12962 )
      ( MAKE-ON-VERIFY ?auto_12959 ?auto_12960 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12963 - SURFACE
      ?auto_12964 - SURFACE
    )
    :vars
    (
      ?auto_12965 - HOIST
      ?auto_12966 - PLACE
      ?auto_12967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12965 ?auto_12966 ) ( SURFACE-AT ?auto_12964 ?auto_12966 ) ( CLEAR ?auto_12964 ) ( IS-CRATE ?auto_12963 ) ( not ( = ?auto_12963 ?auto_12964 ) ) ( TRUCK-AT ?auto_12967 ?auto_12966 ) ( AVAILABLE ?auto_12965 ) ( IN ?auto_12963 ?auto_12967 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12965 ?auto_12963 ?auto_12967 ?auto_12966 )
      ( MAKE-ON ?auto_12963 ?auto_12964 )
      ( MAKE-ON-VERIFY ?auto_12963 ?auto_12964 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12968 - SURFACE
      ?auto_12969 - SURFACE
    )
    :vars
    (
      ?auto_12971 - HOIST
      ?auto_12970 - PLACE
      ?auto_12972 - TRUCK
      ?auto_12973 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12971 ?auto_12970 ) ( SURFACE-AT ?auto_12969 ?auto_12970 ) ( CLEAR ?auto_12969 ) ( IS-CRATE ?auto_12968 ) ( not ( = ?auto_12968 ?auto_12969 ) ) ( AVAILABLE ?auto_12971 ) ( IN ?auto_12968 ?auto_12972 ) ( TRUCK-AT ?auto_12972 ?auto_12973 ) ( not ( = ?auto_12973 ?auto_12970 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12972 ?auto_12973 ?auto_12970 )
      ( MAKE-ON ?auto_12968 ?auto_12969 )
      ( MAKE-ON-VERIFY ?auto_12968 ?auto_12969 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12974 - SURFACE
      ?auto_12975 - SURFACE
    )
    :vars
    (
      ?auto_12978 - HOIST
      ?auto_12979 - PLACE
      ?auto_12977 - TRUCK
      ?auto_12976 - PLACE
      ?auto_12980 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12978 ?auto_12979 ) ( SURFACE-AT ?auto_12975 ?auto_12979 ) ( CLEAR ?auto_12975 ) ( IS-CRATE ?auto_12974 ) ( not ( = ?auto_12974 ?auto_12975 ) ) ( AVAILABLE ?auto_12978 ) ( TRUCK-AT ?auto_12977 ?auto_12976 ) ( not ( = ?auto_12976 ?auto_12979 ) ) ( HOIST-AT ?auto_12980 ?auto_12976 ) ( LIFTING ?auto_12980 ?auto_12974 ) ( not ( = ?auto_12978 ?auto_12980 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12980 ?auto_12974 ?auto_12977 ?auto_12976 )
      ( MAKE-ON ?auto_12974 ?auto_12975 )
      ( MAKE-ON-VERIFY ?auto_12974 ?auto_12975 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12981 - SURFACE
      ?auto_12982 - SURFACE
    )
    :vars
    (
      ?auto_12983 - HOIST
      ?auto_12987 - PLACE
      ?auto_12986 - TRUCK
      ?auto_12985 - PLACE
      ?auto_12984 - HOIST
      ?auto_12988 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12983 ?auto_12987 ) ( SURFACE-AT ?auto_12982 ?auto_12987 ) ( CLEAR ?auto_12982 ) ( IS-CRATE ?auto_12981 ) ( not ( = ?auto_12981 ?auto_12982 ) ) ( AVAILABLE ?auto_12983 ) ( TRUCK-AT ?auto_12986 ?auto_12985 ) ( not ( = ?auto_12985 ?auto_12987 ) ) ( HOIST-AT ?auto_12984 ?auto_12985 ) ( not ( = ?auto_12983 ?auto_12984 ) ) ( AVAILABLE ?auto_12984 ) ( SURFACE-AT ?auto_12981 ?auto_12985 ) ( ON ?auto_12981 ?auto_12988 ) ( CLEAR ?auto_12981 ) ( not ( = ?auto_12981 ?auto_12988 ) ) ( not ( = ?auto_12982 ?auto_12988 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12984 ?auto_12981 ?auto_12988 ?auto_12985 )
      ( MAKE-ON ?auto_12981 ?auto_12982 )
      ( MAKE-ON-VERIFY ?auto_12981 ?auto_12982 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12989 - SURFACE
      ?auto_12990 - SURFACE
    )
    :vars
    (
      ?auto_12996 - HOIST
      ?auto_12994 - PLACE
      ?auto_12993 - PLACE
      ?auto_12995 - HOIST
      ?auto_12992 - SURFACE
      ?auto_12991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12996 ?auto_12994 ) ( SURFACE-AT ?auto_12990 ?auto_12994 ) ( CLEAR ?auto_12990 ) ( IS-CRATE ?auto_12989 ) ( not ( = ?auto_12989 ?auto_12990 ) ) ( AVAILABLE ?auto_12996 ) ( not ( = ?auto_12993 ?auto_12994 ) ) ( HOIST-AT ?auto_12995 ?auto_12993 ) ( not ( = ?auto_12996 ?auto_12995 ) ) ( AVAILABLE ?auto_12995 ) ( SURFACE-AT ?auto_12989 ?auto_12993 ) ( ON ?auto_12989 ?auto_12992 ) ( CLEAR ?auto_12989 ) ( not ( = ?auto_12989 ?auto_12992 ) ) ( not ( = ?auto_12990 ?auto_12992 ) ) ( TRUCK-AT ?auto_12991 ?auto_12994 ) )
    :subtasks
    ( ( !DRIVE ?auto_12991 ?auto_12994 ?auto_12993 )
      ( MAKE-ON ?auto_12989 ?auto_12990 )
      ( MAKE-ON-VERIFY ?auto_12989 ?auto_12990 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_12997 - SURFACE
      ?auto_12998 - SURFACE
    )
    :vars
    (
      ?auto_12999 - HOIST
      ?auto_13004 - PLACE
      ?auto_13003 - PLACE
      ?auto_13001 - HOIST
      ?auto_13000 - SURFACE
      ?auto_13002 - TRUCK
      ?auto_13005 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12999 ?auto_13004 ) ( IS-CRATE ?auto_12997 ) ( not ( = ?auto_12997 ?auto_12998 ) ) ( not ( = ?auto_13003 ?auto_13004 ) ) ( HOIST-AT ?auto_13001 ?auto_13003 ) ( not ( = ?auto_12999 ?auto_13001 ) ) ( AVAILABLE ?auto_13001 ) ( SURFACE-AT ?auto_12997 ?auto_13003 ) ( ON ?auto_12997 ?auto_13000 ) ( CLEAR ?auto_12997 ) ( not ( = ?auto_12997 ?auto_13000 ) ) ( not ( = ?auto_12998 ?auto_13000 ) ) ( TRUCK-AT ?auto_13002 ?auto_13004 ) ( SURFACE-AT ?auto_13005 ?auto_13004 ) ( CLEAR ?auto_13005 ) ( LIFTING ?auto_12999 ?auto_12998 ) ( IS-CRATE ?auto_12998 ) ( not ( = ?auto_12997 ?auto_13005 ) ) ( not ( = ?auto_12998 ?auto_13005 ) ) ( not ( = ?auto_13000 ?auto_13005 ) ) )
    :subtasks
    ( ( !DROP ?auto_12999 ?auto_12998 ?auto_13005 ?auto_13004 )
      ( MAKE-ON ?auto_12997 ?auto_12998 )
      ( MAKE-ON-VERIFY ?auto_12997 ?auto_12998 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13006 - SURFACE
      ?auto_13007 - SURFACE
    )
    :vars
    (
      ?auto_13012 - HOIST
      ?auto_13009 - PLACE
      ?auto_13014 - PLACE
      ?auto_13011 - HOIST
      ?auto_13008 - SURFACE
      ?auto_13013 - TRUCK
      ?auto_13010 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13012 ?auto_13009 ) ( IS-CRATE ?auto_13006 ) ( not ( = ?auto_13006 ?auto_13007 ) ) ( not ( = ?auto_13014 ?auto_13009 ) ) ( HOIST-AT ?auto_13011 ?auto_13014 ) ( not ( = ?auto_13012 ?auto_13011 ) ) ( AVAILABLE ?auto_13011 ) ( SURFACE-AT ?auto_13006 ?auto_13014 ) ( ON ?auto_13006 ?auto_13008 ) ( CLEAR ?auto_13006 ) ( not ( = ?auto_13006 ?auto_13008 ) ) ( not ( = ?auto_13007 ?auto_13008 ) ) ( TRUCK-AT ?auto_13013 ?auto_13009 ) ( SURFACE-AT ?auto_13010 ?auto_13009 ) ( CLEAR ?auto_13010 ) ( IS-CRATE ?auto_13007 ) ( not ( = ?auto_13006 ?auto_13010 ) ) ( not ( = ?auto_13007 ?auto_13010 ) ) ( not ( = ?auto_13008 ?auto_13010 ) ) ( AVAILABLE ?auto_13012 ) ( IN ?auto_13007 ?auto_13013 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13012 ?auto_13007 ?auto_13013 ?auto_13009 )
      ( MAKE-ON ?auto_13006 ?auto_13007 )
      ( MAKE-ON-VERIFY ?auto_13006 ?auto_13007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13015 - SURFACE
      ?auto_13016 - SURFACE
    )
    :vars
    (
      ?auto_13022 - HOIST
      ?auto_13021 - PLACE
      ?auto_13020 - PLACE
      ?auto_13019 - HOIST
      ?auto_13023 - SURFACE
      ?auto_13018 - SURFACE
      ?auto_13017 - TRUCK
      ?auto_13024 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13022 ?auto_13021 ) ( IS-CRATE ?auto_13015 ) ( not ( = ?auto_13015 ?auto_13016 ) ) ( not ( = ?auto_13020 ?auto_13021 ) ) ( HOIST-AT ?auto_13019 ?auto_13020 ) ( not ( = ?auto_13022 ?auto_13019 ) ) ( AVAILABLE ?auto_13019 ) ( SURFACE-AT ?auto_13015 ?auto_13020 ) ( ON ?auto_13015 ?auto_13023 ) ( CLEAR ?auto_13015 ) ( not ( = ?auto_13015 ?auto_13023 ) ) ( not ( = ?auto_13016 ?auto_13023 ) ) ( SURFACE-AT ?auto_13018 ?auto_13021 ) ( CLEAR ?auto_13018 ) ( IS-CRATE ?auto_13016 ) ( not ( = ?auto_13015 ?auto_13018 ) ) ( not ( = ?auto_13016 ?auto_13018 ) ) ( not ( = ?auto_13023 ?auto_13018 ) ) ( AVAILABLE ?auto_13022 ) ( IN ?auto_13016 ?auto_13017 ) ( TRUCK-AT ?auto_13017 ?auto_13024 ) ( not ( = ?auto_13024 ?auto_13021 ) ) ( not ( = ?auto_13020 ?auto_13024 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13017 ?auto_13024 ?auto_13021 )
      ( MAKE-ON ?auto_13015 ?auto_13016 )
      ( MAKE-ON-VERIFY ?auto_13015 ?auto_13016 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13025 - SURFACE
      ?auto_13026 - SURFACE
    )
    :vars
    (
      ?auto_13029 - HOIST
      ?auto_13031 - PLACE
      ?auto_13032 - PLACE
      ?auto_13033 - HOIST
      ?auto_13034 - SURFACE
      ?auto_13030 - SURFACE
      ?auto_13027 - TRUCK
      ?auto_13028 - PLACE
      ?auto_13035 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13029 ?auto_13031 ) ( IS-CRATE ?auto_13025 ) ( not ( = ?auto_13025 ?auto_13026 ) ) ( not ( = ?auto_13032 ?auto_13031 ) ) ( HOIST-AT ?auto_13033 ?auto_13032 ) ( not ( = ?auto_13029 ?auto_13033 ) ) ( AVAILABLE ?auto_13033 ) ( SURFACE-AT ?auto_13025 ?auto_13032 ) ( ON ?auto_13025 ?auto_13034 ) ( CLEAR ?auto_13025 ) ( not ( = ?auto_13025 ?auto_13034 ) ) ( not ( = ?auto_13026 ?auto_13034 ) ) ( SURFACE-AT ?auto_13030 ?auto_13031 ) ( CLEAR ?auto_13030 ) ( IS-CRATE ?auto_13026 ) ( not ( = ?auto_13025 ?auto_13030 ) ) ( not ( = ?auto_13026 ?auto_13030 ) ) ( not ( = ?auto_13034 ?auto_13030 ) ) ( AVAILABLE ?auto_13029 ) ( TRUCK-AT ?auto_13027 ?auto_13028 ) ( not ( = ?auto_13028 ?auto_13031 ) ) ( not ( = ?auto_13032 ?auto_13028 ) ) ( HOIST-AT ?auto_13035 ?auto_13028 ) ( LIFTING ?auto_13035 ?auto_13026 ) ( not ( = ?auto_13029 ?auto_13035 ) ) ( not ( = ?auto_13033 ?auto_13035 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13035 ?auto_13026 ?auto_13027 ?auto_13028 )
      ( MAKE-ON ?auto_13025 ?auto_13026 )
      ( MAKE-ON-VERIFY ?auto_13025 ?auto_13026 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13036 - SURFACE
      ?auto_13037 - SURFACE
    )
    :vars
    (
      ?auto_13046 - HOIST
      ?auto_13041 - PLACE
      ?auto_13044 - PLACE
      ?auto_13040 - HOIST
      ?auto_13043 - SURFACE
      ?auto_13045 - SURFACE
      ?auto_13038 - TRUCK
      ?auto_13042 - PLACE
      ?auto_13039 - HOIST
      ?auto_13047 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13046 ?auto_13041 ) ( IS-CRATE ?auto_13036 ) ( not ( = ?auto_13036 ?auto_13037 ) ) ( not ( = ?auto_13044 ?auto_13041 ) ) ( HOIST-AT ?auto_13040 ?auto_13044 ) ( not ( = ?auto_13046 ?auto_13040 ) ) ( AVAILABLE ?auto_13040 ) ( SURFACE-AT ?auto_13036 ?auto_13044 ) ( ON ?auto_13036 ?auto_13043 ) ( CLEAR ?auto_13036 ) ( not ( = ?auto_13036 ?auto_13043 ) ) ( not ( = ?auto_13037 ?auto_13043 ) ) ( SURFACE-AT ?auto_13045 ?auto_13041 ) ( CLEAR ?auto_13045 ) ( IS-CRATE ?auto_13037 ) ( not ( = ?auto_13036 ?auto_13045 ) ) ( not ( = ?auto_13037 ?auto_13045 ) ) ( not ( = ?auto_13043 ?auto_13045 ) ) ( AVAILABLE ?auto_13046 ) ( TRUCK-AT ?auto_13038 ?auto_13042 ) ( not ( = ?auto_13042 ?auto_13041 ) ) ( not ( = ?auto_13044 ?auto_13042 ) ) ( HOIST-AT ?auto_13039 ?auto_13042 ) ( not ( = ?auto_13046 ?auto_13039 ) ) ( not ( = ?auto_13040 ?auto_13039 ) ) ( AVAILABLE ?auto_13039 ) ( SURFACE-AT ?auto_13037 ?auto_13042 ) ( ON ?auto_13037 ?auto_13047 ) ( CLEAR ?auto_13037 ) ( not ( = ?auto_13036 ?auto_13047 ) ) ( not ( = ?auto_13037 ?auto_13047 ) ) ( not ( = ?auto_13043 ?auto_13047 ) ) ( not ( = ?auto_13045 ?auto_13047 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13039 ?auto_13037 ?auto_13047 ?auto_13042 )
      ( MAKE-ON ?auto_13036 ?auto_13037 )
      ( MAKE-ON-VERIFY ?auto_13036 ?auto_13037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13048 - SURFACE
      ?auto_13049 - SURFACE
    )
    :vars
    (
      ?auto_13059 - HOIST
      ?auto_13058 - PLACE
      ?auto_13055 - PLACE
      ?auto_13056 - HOIST
      ?auto_13057 - SURFACE
      ?auto_13053 - SURFACE
      ?auto_13052 - PLACE
      ?auto_13054 - HOIST
      ?auto_13051 - SURFACE
      ?auto_13050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13059 ?auto_13058 ) ( IS-CRATE ?auto_13048 ) ( not ( = ?auto_13048 ?auto_13049 ) ) ( not ( = ?auto_13055 ?auto_13058 ) ) ( HOIST-AT ?auto_13056 ?auto_13055 ) ( not ( = ?auto_13059 ?auto_13056 ) ) ( AVAILABLE ?auto_13056 ) ( SURFACE-AT ?auto_13048 ?auto_13055 ) ( ON ?auto_13048 ?auto_13057 ) ( CLEAR ?auto_13048 ) ( not ( = ?auto_13048 ?auto_13057 ) ) ( not ( = ?auto_13049 ?auto_13057 ) ) ( SURFACE-AT ?auto_13053 ?auto_13058 ) ( CLEAR ?auto_13053 ) ( IS-CRATE ?auto_13049 ) ( not ( = ?auto_13048 ?auto_13053 ) ) ( not ( = ?auto_13049 ?auto_13053 ) ) ( not ( = ?auto_13057 ?auto_13053 ) ) ( AVAILABLE ?auto_13059 ) ( not ( = ?auto_13052 ?auto_13058 ) ) ( not ( = ?auto_13055 ?auto_13052 ) ) ( HOIST-AT ?auto_13054 ?auto_13052 ) ( not ( = ?auto_13059 ?auto_13054 ) ) ( not ( = ?auto_13056 ?auto_13054 ) ) ( AVAILABLE ?auto_13054 ) ( SURFACE-AT ?auto_13049 ?auto_13052 ) ( ON ?auto_13049 ?auto_13051 ) ( CLEAR ?auto_13049 ) ( not ( = ?auto_13048 ?auto_13051 ) ) ( not ( = ?auto_13049 ?auto_13051 ) ) ( not ( = ?auto_13057 ?auto_13051 ) ) ( not ( = ?auto_13053 ?auto_13051 ) ) ( TRUCK-AT ?auto_13050 ?auto_13058 ) )
    :subtasks
    ( ( !DRIVE ?auto_13050 ?auto_13058 ?auto_13052 )
      ( MAKE-ON ?auto_13048 ?auto_13049 )
      ( MAKE-ON-VERIFY ?auto_13048 ?auto_13049 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13060 - SURFACE
      ?auto_13061 - SURFACE
    )
    :vars
    (
      ?auto_13065 - HOIST
      ?auto_13071 - PLACE
      ?auto_13064 - PLACE
      ?auto_13070 - HOIST
      ?auto_13069 - SURFACE
      ?auto_13068 - SURFACE
      ?auto_13067 - PLACE
      ?auto_13063 - HOIST
      ?auto_13062 - SURFACE
      ?auto_13066 - TRUCK
      ?auto_13072 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13065 ?auto_13071 ) ( IS-CRATE ?auto_13060 ) ( not ( = ?auto_13060 ?auto_13061 ) ) ( not ( = ?auto_13064 ?auto_13071 ) ) ( HOIST-AT ?auto_13070 ?auto_13064 ) ( not ( = ?auto_13065 ?auto_13070 ) ) ( AVAILABLE ?auto_13070 ) ( SURFACE-AT ?auto_13060 ?auto_13064 ) ( ON ?auto_13060 ?auto_13069 ) ( CLEAR ?auto_13060 ) ( not ( = ?auto_13060 ?auto_13069 ) ) ( not ( = ?auto_13061 ?auto_13069 ) ) ( IS-CRATE ?auto_13061 ) ( not ( = ?auto_13060 ?auto_13068 ) ) ( not ( = ?auto_13061 ?auto_13068 ) ) ( not ( = ?auto_13069 ?auto_13068 ) ) ( not ( = ?auto_13067 ?auto_13071 ) ) ( not ( = ?auto_13064 ?auto_13067 ) ) ( HOIST-AT ?auto_13063 ?auto_13067 ) ( not ( = ?auto_13065 ?auto_13063 ) ) ( not ( = ?auto_13070 ?auto_13063 ) ) ( AVAILABLE ?auto_13063 ) ( SURFACE-AT ?auto_13061 ?auto_13067 ) ( ON ?auto_13061 ?auto_13062 ) ( CLEAR ?auto_13061 ) ( not ( = ?auto_13060 ?auto_13062 ) ) ( not ( = ?auto_13061 ?auto_13062 ) ) ( not ( = ?auto_13069 ?auto_13062 ) ) ( not ( = ?auto_13068 ?auto_13062 ) ) ( TRUCK-AT ?auto_13066 ?auto_13071 ) ( SURFACE-AT ?auto_13072 ?auto_13071 ) ( CLEAR ?auto_13072 ) ( LIFTING ?auto_13065 ?auto_13068 ) ( IS-CRATE ?auto_13068 ) ( not ( = ?auto_13060 ?auto_13072 ) ) ( not ( = ?auto_13061 ?auto_13072 ) ) ( not ( = ?auto_13069 ?auto_13072 ) ) ( not ( = ?auto_13068 ?auto_13072 ) ) ( not ( = ?auto_13062 ?auto_13072 ) ) )
    :subtasks
    ( ( !DROP ?auto_13065 ?auto_13068 ?auto_13072 ?auto_13071 )
      ( MAKE-ON ?auto_13060 ?auto_13061 )
      ( MAKE-ON-VERIFY ?auto_13060 ?auto_13061 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13073 - SURFACE
      ?auto_13074 - SURFACE
    )
    :vars
    (
      ?auto_13081 - HOIST
      ?auto_13077 - PLACE
      ?auto_13075 - PLACE
      ?auto_13083 - HOIST
      ?auto_13076 - SURFACE
      ?auto_13078 - SURFACE
      ?auto_13079 - PLACE
      ?auto_13080 - HOIST
      ?auto_13084 - SURFACE
      ?auto_13082 - TRUCK
      ?auto_13085 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13081 ?auto_13077 ) ( IS-CRATE ?auto_13073 ) ( not ( = ?auto_13073 ?auto_13074 ) ) ( not ( = ?auto_13075 ?auto_13077 ) ) ( HOIST-AT ?auto_13083 ?auto_13075 ) ( not ( = ?auto_13081 ?auto_13083 ) ) ( AVAILABLE ?auto_13083 ) ( SURFACE-AT ?auto_13073 ?auto_13075 ) ( ON ?auto_13073 ?auto_13076 ) ( CLEAR ?auto_13073 ) ( not ( = ?auto_13073 ?auto_13076 ) ) ( not ( = ?auto_13074 ?auto_13076 ) ) ( IS-CRATE ?auto_13074 ) ( not ( = ?auto_13073 ?auto_13078 ) ) ( not ( = ?auto_13074 ?auto_13078 ) ) ( not ( = ?auto_13076 ?auto_13078 ) ) ( not ( = ?auto_13079 ?auto_13077 ) ) ( not ( = ?auto_13075 ?auto_13079 ) ) ( HOIST-AT ?auto_13080 ?auto_13079 ) ( not ( = ?auto_13081 ?auto_13080 ) ) ( not ( = ?auto_13083 ?auto_13080 ) ) ( AVAILABLE ?auto_13080 ) ( SURFACE-AT ?auto_13074 ?auto_13079 ) ( ON ?auto_13074 ?auto_13084 ) ( CLEAR ?auto_13074 ) ( not ( = ?auto_13073 ?auto_13084 ) ) ( not ( = ?auto_13074 ?auto_13084 ) ) ( not ( = ?auto_13076 ?auto_13084 ) ) ( not ( = ?auto_13078 ?auto_13084 ) ) ( TRUCK-AT ?auto_13082 ?auto_13077 ) ( SURFACE-AT ?auto_13085 ?auto_13077 ) ( CLEAR ?auto_13085 ) ( IS-CRATE ?auto_13078 ) ( not ( = ?auto_13073 ?auto_13085 ) ) ( not ( = ?auto_13074 ?auto_13085 ) ) ( not ( = ?auto_13076 ?auto_13085 ) ) ( not ( = ?auto_13078 ?auto_13085 ) ) ( not ( = ?auto_13084 ?auto_13085 ) ) ( AVAILABLE ?auto_13081 ) ( IN ?auto_13078 ?auto_13082 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13081 ?auto_13078 ?auto_13082 ?auto_13077 )
      ( MAKE-ON ?auto_13073 ?auto_13074 )
      ( MAKE-ON-VERIFY ?auto_13073 ?auto_13074 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13086 - SURFACE
      ?auto_13087 - SURFACE
    )
    :vars
    (
      ?auto_13088 - HOIST
      ?auto_13093 - PLACE
      ?auto_13095 - PLACE
      ?auto_13089 - HOIST
      ?auto_13090 - SURFACE
      ?auto_13098 - SURFACE
      ?auto_13096 - PLACE
      ?auto_13092 - HOIST
      ?auto_13091 - SURFACE
      ?auto_13097 - SURFACE
      ?auto_13094 - TRUCK
      ?auto_13099 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13088 ?auto_13093 ) ( IS-CRATE ?auto_13086 ) ( not ( = ?auto_13086 ?auto_13087 ) ) ( not ( = ?auto_13095 ?auto_13093 ) ) ( HOIST-AT ?auto_13089 ?auto_13095 ) ( not ( = ?auto_13088 ?auto_13089 ) ) ( AVAILABLE ?auto_13089 ) ( SURFACE-AT ?auto_13086 ?auto_13095 ) ( ON ?auto_13086 ?auto_13090 ) ( CLEAR ?auto_13086 ) ( not ( = ?auto_13086 ?auto_13090 ) ) ( not ( = ?auto_13087 ?auto_13090 ) ) ( IS-CRATE ?auto_13087 ) ( not ( = ?auto_13086 ?auto_13098 ) ) ( not ( = ?auto_13087 ?auto_13098 ) ) ( not ( = ?auto_13090 ?auto_13098 ) ) ( not ( = ?auto_13096 ?auto_13093 ) ) ( not ( = ?auto_13095 ?auto_13096 ) ) ( HOIST-AT ?auto_13092 ?auto_13096 ) ( not ( = ?auto_13088 ?auto_13092 ) ) ( not ( = ?auto_13089 ?auto_13092 ) ) ( AVAILABLE ?auto_13092 ) ( SURFACE-AT ?auto_13087 ?auto_13096 ) ( ON ?auto_13087 ?auto_13091 ) ( CLEAR ?auto_13087 ) ( not ( = ?auto_13086 ?auto_13091 ) ) ( not ( = ?auto_13087 ?auto_13091 ) ) ( not ( = ?auto_13090 ?auto_13091 ) ) ( not ( = ?auto_13098 ?auto_13091 ) ) ( SURFACE-AT ?auto_13097 ?auto_13093 ) ( CLEAR ?auto_13097 ) ( IS-CRATE ?auto_13098 ) ( not ( = ?auto_13086 ?auto_13097 ) ) ( not ( = ?auto_13087 ?auto_13097 ) ) ( not ( = ?auto_13090 ?auto_13097 ) ) ( not ( = ?auto_13098 ?auto_13097 ) ) ( not ( = ?auto_13091 ?auto_13097 ) ) ( AVAILABLE ?auto_13088 ) ( IN ?auto_13098 ?auto_13094 ) ( TRUCK-AT ?auto_13094 ?auto_13099 ) ( not ( = ?auto_13099 ?auto_13093 ) ) ( not ( = ?auto_13095 ?auto_13099 ) ) ( not ( = ?auto_13096 ?auto_13099 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13094 ?auto_13099 ?auto_13093 )
      ( MAKE-ON ?auto_13086 ?auto_13087 )
      ( MAKE-ON-VERIFY ?auto_13086 ?auto_13087 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13100 - SURFACE
      ?auto_13101 - SURFACE
    )
    :vars
    (
      ?auto_13112 - HOIST
      ?auto_13108 - PLACE
      ?auto_13109 - PLACE
      ?auto_13103 - HOIST
      ?auto_13111 - SURFACE
      ?auto_13104 - SURFACE
      ?auto_13106 - PLACE
      ?auto_13107 - HOIST
      ?auto_13102 - SURFACE
      ?auto_13110 - SURFACE
      ?auto_13113 - TRUCK
      ?auto_13105 - PLACE
      ?auto_13114 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13112 ?auto_13108 ) ( IS-CRATE ?auto_13100 ) ( not ( = ?auto_13100 ?auto_13101 ) ) ( not ( = ?auto_13109 ?auto_13108 ) ) ( HOIST-AT ?auto_13103 ?auto_13109 ) ( not ( = ?auto_13112 ?auto_13103 ) ) ( AVAILABLE ?auto_13103 ) ( SURFACE-AT ?auto_13100 ?auto_13109 ) ( ON ?auto_13100 ?auto_13111 ) ( CLEAR ?auto_13100 ) ( not ( = ?auto_13100 ?auto_13111 ) ) ( not ( = ?auto_13101 ?auto_13111 ) ) ( IS-CRATE ?auto_13101 ) ( not ( = ?auto_13100 ?auto_13104 ) ) ( not ( = ?auto_13101 ?auto_13104 ) ) ( not ( = ?auto_13111 ?auto_13104 ) ) ( not ( = ?auto_13106 ?auto_13108 ) ) ( not ( = ?auto_13109 ?auto_13106 ) ) ( HOIST-AT ?auto_13107 ?auto_13106 ) ( not ( = ?auto_13112 ?auto_13107 ) ) ( not ( = ?auto_13103 ?auto_13107 ) ) ( AVAILABLE ?auto_13107 ) ( SURFACE-AT ?auto_13101 ?auto_13106 ) ( ON ?auto_13101 ?auto_13102 ) ( CLEAR ?auto_13101 ) ( not ( = ?auto_13100 ?auto_13102 ) ) ( not ( = ?auto_13101 ?auto_13102 ) ) ( not ( = ?auto_13111 ?auto_13102 ) ) ( not ( = ?auto_13104 ?auto_13102 ) ) ( SURFACE-AT ?auto_13110 ?auto_13108 ) ( CLEAR ?auto_13110 ) ( IS-CRATE ?auto_13104 ) ( not ( = ?auto_13100 ?auto_13110 ) ) ( not ( = ?auto_13101 ?auto_13110 ) ) ( not ( = ?auto_13111 ?auto_13110 ) ) ( not ( = ?auto_13104 ?auto_13110 ) ) ( not ( = ?auto_13102 ?auto_13110 ) ) ( AVAILABLE ?auto_13112 ) ( TRUCK-AT ?auto_13113 ?auto_13105 ) ( not ( = ?auto_13105 ?auto_13108 ) ) ( not ( = ?auto_13109 ?auto_13105 ) ) ( not ( = ?auto_13106 ?auto_13105 ) ) ( HOIST-AT ?auto_13114 ?auto_13105 ) ( LIFTING ?auto_13114 ?auto_13104 ) ( not ( = ?auto_13112 ?auto_13114 ) ) ( not ( = ?auto_13103 ?auto_13114 ) ) ( not ( = ?auto_13107 ?auto_13114 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13114 ?auto_13104 ?auto_13113 ?auto_13105 )
      ( MAKE-ON ?auto_13100 ?auto_13101 )
      ( MAKE-ON-VERIFY ?auto_13100 ?auto_13101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13115 - SURFACE
      ?auto_13116 - SURFACE
    )
    :vars
    (
      ?auto_13124 - HOIST
      ?auto_13118 - PLACE
      ?auto_13122 - PLACE
      ?auto_13126 - HOIST
      ?auto_13127 - SURFACE
      ?auto_13128 - SURFACE
      ?auto_13123 - PLACE
      ?auto_13121 - HOIST
      ?auto_13119 - SURFACE
      ?auto_13120 - SURFACE
      ?auto_13129 - TRUCK
      ?auto_13125 - PLACE
      ?auto_13117 - HOIST
      ?auto_13130 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13124 ?auto_13118 ) ( IS-CRATE ?auto_13115 ) ( not ( = ?auto_13115 ?auto_13116 ) ) ( not ( = ?auto_13122 ?auto_13118 ) ) ( HOIST-AT ?auto_13126 ?auto_13122 ) ( not ( = ?auto_13124 ?auto_13126 ) ) ( AVAILABLE ?auto_13126 ) ( SURFACE-AT ?auto_13115 ?auto_13122 ) ( ON ?auto_13115 ?auto_13127 ) ( CLEAR ?auto_13115 ) ( not ( = ?auto_13115 ?auto_13127 ) ) ( not ( = ?auto_13116 ?auto_13127 ) ) ( IS-CRATE ?auto_13116 ) ( not ( = ?auto_13115 ?auto_13128 ) ) ( not ( = ?auto_13116 ?auto_13128 ) ) ( not ( = ?auto_13127 ?auto_13128 ) ) ( not ( = ?auto_13123 ?auto_13118 ) ) ( not ( = ?auto_13122 ?auto_13123 ) ) ( HOIST-AT ?auto_13121 ?auto_13123 ) ( not ( = ?auto_13124 ?auto_13121 ) ) ( not ( = ?auto_13126 ?auto_13121 ) ) ( AVAILABLE ?auto_13121 ) ( SURFACE-AT ?auto_13116 ?auto_13123 ) ( ON ?auto_13116 ?auto_13119 ) ( CLEAR ?auto_13116 ) ( not ( = ?auto_13115 ?auto_13119 ) ) ( not ( = ?auto_13116 ?auto_13119 ) ) ( not ( = ?auto_13127 ?auto_13119 ) ) ( not ( = ?auto_13128 ?auto_13119 ) ) ( SURFACE-AT ?auto_13120 ?auto_13118 ) ( CLEAR ?auto_13120 ) ( IS-CRATE ?auto_13128 ) ( not ( = ?auto_13115 ?auto_13120 ) ) ( not ( = ?auto_13116 ?auto_13120 ) ) ( not ( = ?auto_13127 ?auto_13120 ) ) ( not ( = ?auto_13128 ?auto_13120 ) ) ( not ( = ?auto_13119 ?auto_13120 ) ) ( AVAILABLE ?auto_13124 ) ( TRUCK-AT ?auto_13129 ?auto_13125 ) ( not ( = ?auto_13125 ?auto_13118 ) ) ( not ( = ?auto_13122 ?auto_13125 ) ) ( not ( = ?auto_13123 ?auto_13125 ) ) ( HOIST-AT ?auto_13117 ?auto_13125 ) ( not ( = ?auto_13124 ?auto_13117 ) ) ( not ( = ?auto_13126 ?auto_13117 ) ) ( not ( = ?auto_13121 ?auto_13117 ) ) ( AVAILABLE ?auto_13117 ) ( SURFACE-AT ?auto_13128 ?auto_13125 ) ( ON ?auto_13128 ?auto_13130 ) ( CLEAR ?auto_13128 ) ( not ( = ?auto_13115 ?auto_13130 ) ) ( not ( = ?auto_13116 ?auto_13130 ) ) ( not ( = ?auto_13127 ?auto_13130 ) ) ( not ( = ?auto_13128 ?auto_13130 ) ) ( not ( = ?auto_13119 ?auto_13130 ) ) ( not ( = ?auto_13120 ?auto_13130 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13117 ?auto_13128 ?auto_13130 ?auto_13125 )
      ( MAKE-ON ?auto_13115 ?auto_13116 )
      ( MAKE-ON-VERIFY ?auto_13115 ?auto_13116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13131 - SURFACE
      ?auto_13132 - SURFACE
    )
    :vars
    (
      ?auto_13136 - HOIST
      ?auto_13134 - PLACE
      ?auto_13141 - PLACE
      ?auto_13146 - HOIST
      ?auto_13140 - SURFACE
      ?auto_13135 - SURFACE
      ?auto_13137 - PLACE
      ?auto_13139 - HOIST
      ?auto_13145 - SURFACE
      ?auto_13133 - SURFACE
      ?auto_13143 - PLACE
      ?auto_13144 - HOIST
      ?auto_13142 - SURFACE
      ?auto_13138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13136 ?auto_13134 ) ( IS-CRATE ?auto_13131 ) ( not ( = ?auto_13131 ?auto_13132 ) ) ( not ( = ?auto_13141 ?auto_13134 ) ) ( HOIST-AT ?auto_13146 ?auto_13141 ) ( not ( = ?auto_13136 ?auto_13146 ) ) ( AVAILABLE ?auto_13146 ) ( SURFACE-AT ?auto_13131 ?auto_13141 ) ( ON ?auto_13131 ?auto_13140 ) ( CLEAR ?auto_13131 ) ( not ( = ?auto_13131 ?auto_13140 ) ) ( not ( = ?auto_13132 ?auto_13140 ) ) ( IS-CRATE ?auto_13132 ) ( not ( = ?auto_13131 ?auto_13135 ) ) ( not ( = ?auto_13132 ?auto_13135 ) ) ( not ( = ?auto_13140 ?auto_13135 ) ) ( not ( = ?auto_13137 ?auto_13134 ) ) ( not ( = ?auto_13141 ?auto_13137 ) ) ( HOIST-AT ?auto_13139 ?auto_13137 ) ( not ( = ?auto_13136 ?auto_13139 ) ) ( not ( = ?auto_13146 ?auto_13139 ) ) ( AVAILABLE ?auto_13139 ) ( SURFACE-AT ?auto_13132 ?auto_13137 ) ( ON ?auto_13132 ?auto_13145 ) ( CLEAR ?auto_13132 ) ( not ( = ?auto_13131 ?auto_13145 ) ) ( not ( = ?auto_13132 ?auto_13145 ) ) ( not ( = ?auto_13140 ?auto_13145 ) ) ( not ( = ?auto_13135 ?auto_13145 ) ) ( SURFACE-AT ?auto_13133 ?auto_13134 ) ( CLEAR ?auto_13133 ) ( IS-CRATE ?auto_13135 ) ( not ( = ?auto_13131 ?auto_13133 ) ) ( not ( = ?auto_13132 ?auto_13133 ) ) ( not ( = ?auto_13140 ?auto_13133 ) ) ( not ( = ?auto_13135 ?auto_13133 ) ) ( not ( = ?auto_13145 ?auto_13133 ) ) ( AVAILABLE ?auto_13136 ) ( not ( = ?auto_13143 ?auto_13134 ) ) ( not ( = ?auto_13141 ?auto_13143 ) ) ( not ( = ?auto_13137 ?auto_13143 ) ) ( HOIST-AT ?auto_13144 ?auto_13143 ) ( not ( = ?auto_13136 ?auto_13144 ) ) ( not ( = ?auto_13146 ?auto_13144 ) ) ( not ( = ?auto_13139 ?auto_13144 ) ) ( AVAILABLE ?auto_13144 ) ( SURFACE-AT ?auto_13135 ?auto_13143 ) ( ON ?auto_13135 ?auto_13142 ) ( CLEAR ?auto_13135 ) ( not ( = ?auto_13131 ?auto_13142 ) ) ( not ( = ?auto_13132 ?auto_13142 ) ) ( not ( = ?auto_13140 ?auto_13142 ) ) ( not ( = ?auto_13135 ?auto_13142 ) ) ( not ( = ?auto_13145 ?auto_13142 ) ) ( not ( = ?auto_13133 ?auto_13142 ) ) ( TRUCK-AT ?auto_13138 ?auto_13134 ) )
    :subtasks
    ( ( !DRIVE ?auto_13138 ?auto_13134 ?auto_13143 )
      ( MAKE-ON ?auto_13131 ?auto_13132 )
      ( MAKE-ON-VERIFY ?auto_13131 ?auto_13132 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13147 - SURFACE
      ?auto_13148 - SURFACE
    )
    :vars
    (
      ?auto_13156 - HOIST
      ?auto_13153 - PLACE
      ?auto_13157 - PLACE
      ?auto_13155 - HOIST
      ?auto_13154 - SURFACE
      ?auto_13149 - SURFACE
      ?auto_13159 - PLACE
      ?auto_13151 - HOIST
      ?auto_13158 - SURFACE
      ?auto_13152 - SURFACE
      ?auto_13162 - PLACE
      ?auto_13150 - HOIST
      ?auto_13160 - SURFACE
      ?auto_13161 - TRUCK
      ?auto_13163 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13156 ?auto_13153 ) ( IS-CRATE ?auto_13147 ) ( not ( = ?auto_13147 ?auto_13148 ) ) ( not ( = ?auto_13157 ?auto_13153 ) ) ( HOIST-AT ?auto_13155 ?auto_13157 ) ( not ( = ?auto_13156 ?auto_13155 ) ) ( AVAILABLE ?auto_13155 ) ( SURFACE-AT ?auto_13147 ?auto_13157 ) ( ON ?auto_13147 ?auto_13154 ) ( CLEAR ?auto_13147 ) ( not ( = ?auto_13147 ?auto_13154 ) ) ( not ( = ?auto_13148 ?auto_13154 ) ) ( IS-CRATE ?auto_13148 ) ( not ( = ?auto_13147 ?auto_13149 ) ) ( not ( = ?auto_13148 ?auto_13149 ) ) ( not ( = ?auto_13154 ?auto_13149 ) ) ( not ( = ?auto_13159 ?auto_13153 ) ) ( not ( = ?auto_13157 ?auto_13159 ) ) ( HOIST-AT ?auto_13151 ?auto_13159 ) ( not ( = ?auto_13156 ?auto_13151 ) ) ( not ( = ?auto_13155 ?auto_13151 ) ) ( AVAILABLE ?auto_13151 ) ( SURFACE-AT ?auto_13148 ?auto_13159 ) ( ON ?auto_13148 ?auto_13158 ) ( CLEAR ?auto_13148 ) ( not ( = ?auto_13147 ?auto_13158 ) ) ( not ( = ?auto_13148 ?auto_13158 ) ) ( not ( = ?auto_13154 ?auto_13158 ) ) ( not ( = ?auto_13149 ?auto_13158 ) ) ( IS-CRATE ?auto_13149 ) ( not ( = ?auto_13147 ?auto_13152 ) ) ( not ( = ?auto_13148 ?auto_13152 ) ) ( not ( = ?auto_13154 ?auto_13152 ) ) ( not ( = ?auto_13149 ?auto_13152 ) ) ( not ( = ?auto_13158 ?auto_13152 ) ) ( not ( = ?auto_13162 ?auto_13153 ) ) ( not ( = ?auto_13157 ?auto_13162 ) ) ( not ( = ?auto_13159 ?auto_13162 ) ) ( HOIST-AT ?auto_13150 ?auto_13162 ) ( not ( = ?auto_13156 ?auto_13150 ) ) ( not ( = ?auto_13155 ?auto_13150 ) ) ( not ( = ?auto_13151 ?auto_13150 ) ) ( AVAILABLE ?auto_13150 ) ( SURFACE-AT ?auto_13149 ?auto_13162 ) ( ON ?auto_13149 ?auto_13160 ) ( CLEAR ?auto_13149 ) ( not ( = ?auto_13147 ?auto_13160 ) ) ( not ( = ?auto_13148 ?auto_13160 ) ) ( not ( = ?auto_13154 ?auto_13160 ) ) ( not ( = ?auto_13149 ?auto_13160 ) ) ( not ( = ?auto_13158 ?auto_13160 ) ) ( not ( = ?auto_13152 ?auto_13160 ) ) ( TRUCK-AT ?auto_13161 ?auto_13153 ) ( SURFACE-AT ?auto_13163 ?auto_13153 ) ( CLEAR ?auto_13163 ) ( LIFTING ?auto_13156 ?auto_13152 ) ( IS-CRATE ?auto_13152 ) ( not ( = ?auto_13147 ?auto_13163 ) ) ( not ( = ?auto_13148 ?auto_13163 ) ) ( not ( = ?auto_13154 ?auto_13163 ) ) ( not ( = ?auto_13149 ?auto_13163 ) ) ( not ( = ?auto_13158 ?auto_13163 ) ) ( not ( = ?auto_13152 ?auto_13163 ) ) ( not ( = ?auto_13160 ?auto_13163 ) ) )
    :subtasks
    ( ( !DROP ?auto_13156 ?auto_13152 ?auto_13163 ?auto_13153 )
      ( MAKE-ON ?auto_13147 ?auto_13148 )
      ( MAKE-ON-VERIFY ?auto_13147 ?auto_13148 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13164 - SURFACE
      ?auto_13165 - SURFACE
    )
    :vars
    (
      ?auto_13169 - HOIST
      ?auto_13175 - PLACE
      ?auto_13178 - PLACE
      ?auto_13179 - HOIST
      ?auto_13168 - SURFACE
      ?auto_13173 - SURFACE
      ?auto_13180 - PLACE
      ?auto_13172 - HOIST
      ?auto_13174 - SURFACE
      ?auto_13170 - SURFACE
      ?auto_13167 - PLACE
      ?auto_13166 - HOIST
      ?auto_13177 - SURFACE
      ?auto_13171 - TRUCK
      ?auto_13176 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13169 ?auto_13175 ) ( IS-CRATE ?auto_13164 ) ( not ( = ?auto_13164 ?auto_13165 ) ) ( not ( = ?auto_13178 ?auto_13175 ) ) ( HOIST-AT ?auto_13179 ?auto_13178 ) ( not ( = ?auto_13169 ?auto_13179 ) ) ( AVAILABLE ?auto_13179 ) ( SURFACE-AT ?auto_13164 ?auto_13178 ) ( ON ?auto_13164 ?auto_13168 ) ( CLEAR ?auto_13164 ) ( not ( = ?auto_13164 ?auto_13168 ) ) ( not ( = ?auto_13165 ?auto_13168 ) ) ( IS-CRATE ?auto_13165 ) ( not ( = ?auto_13164 ?auto_13173 ) ) ( not ( = ?auto_13165 ?auto_13173 ) ) ( not ( = ?auto_13168 ?auto_13173 ) ) ( not ( = ?auto_13180 ?auto_13175 ) ) ( not ( = ?auto_13178 ?auto_13180 ) ) ( HOIST-AT ?auto_13172 ?auto_13180 ) ( not ( = ?auto_13169 ?auto_13172 ) ) ( not ( = ?auto_13179 ?auto_13172 ) ) ( AVAILABLE ?auto_13172 ) ( SURFACE-AT ?auto_13165 ?auto_13180 ) ( ON ?auto_13165 ?auto_13174 ) ( CLEAR ?auto_13165 ) ( not ( = ?auto_13164 ?auto_13174 ) ) ( not ( = ?auto_13165 ?auto_13174 ) ) ( not ( = ?auto_13168 ?auto_13174 ) ) ( not ( = ?auto_13173 ?auto_13174 ) ) ( IS-CRATE ?auto_13173 ) ( not ( = ?auto_13164 ?auto_13170 ) ) ( not ( = ?auto_13165 ?auto_13170 ) ) ( not ( = ?auto_13168 ?auto_13170 ) ) ( not ( = ?auto_13173 ?auto_13170 ) ) ( not ( = ?auto_13174 ?auto_13170 ) ) ( not ( = ?auto_13167 ?auto_13175 ) ) ( not ( = ?auto_13178 ?auto_13167 ) ) ( not ( = ?auto_13180 ?auto_13167 ) ) ( HOIST-AT ?auto_13166 ?auto_13167 ) ( not ( = ?auto_13169 ?auto_13166 ) ) ( not ( = ?auto_13179 ?auto_13166 ) ) ( not ( = ?auto_13172 ?auto_13166 ) ) ( AVAILABLE ?auto_13166 ) ( SURFACE-AT ?auto_13173 ?auto_13167 ) ( ON ?auto_13173 ?auto_13177 ) ( CLEAR ?auto_13173 ) ( not ( = ?auto_13164 ?auto_13177 ) ) ( not ( = ?auto_13165 ?auto_13177 ) ) ( not ( = ?auto_13168 ?auto_13177 ) ) ( not ( = ?auto_13173 ?auto_13177 ) ) ( not ( = ?auto_13174 ?auto_13177 ) ) ( not ( = ?auto_13170 ?auto_13177 ) ) ( TRUCK-AT ?auto_13171 ?auto_13175 ) ( SURFACE-AT ?auto_13176 ?auto_13175 ) ( CLEAR ?auto_13176 ) ( IS-CRATE ?auto_13170 ) ( not ( = ?auto_13164 ?auto_13176 ) ) ( not ( = ?auto_13165 ?auto_13176 ) ) ( not ( = ?auto_13168 ?auto_13176 ) ) ( not ( = ?auto_13173 ?auto_13176 ) ) ( not ( = ?auto_13174 ?auto_13176 ) ) ( not ( = ?auto_13170 ?auto_13176 ) ) ( not ( = ?auto_13177 ?auto_13176 ) ) ( AVAILABLE ?auto_13169 ) ( IN ?auto_13170 ?auto_13171 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13169 ?auto_13170 ?auto_13171 ?auto_13175 )
      ( MAKE-ON ?auto_13164 ?auto_13165 )
      ( MAKE-ON-VERIFY ?auto_13164 ?auto_13165 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13181 - SURFACE
      ?auto_13182 - SURFACE
    )
    :vars
    (
      ?auto_13192 - HOIST
      ?auto_13185 - PLACE
      ?auto_13196 - PLACE
      ?auto_13190 - HOIST
      ?auto_13188 - SURFACE
      ?auto_13195 - SURFACE
      ?auto_13187 - PLACE
      ?auto_13183 - HOIST
      ?auto_13184 - SURFACE
      ?auto_13191 - SURFACE
      ?auto_13194 - PLACE
      ?auto_13193 - HOIST
      ?auto_13186 - SURFACE
      ?auto_13197 - SURFACE
      ?auto_13189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13192 ?auto_13185 ) ( IS-CRATE ?auto_13181 ) ( not ( = ?auto_13181 ?auto_13182 ) ) ( not ( = ?auto_13196 ?auto_13185 ) ) ( HOIST-AT ?auto_13190 ?auto_13196 ) ( not ( = ?auto_13192 ?auto_13190 ) ) ( AVAILABLE ?auto_13190 ) ( SURFACE-AT ?auto_13181 ?auto_13196 ) ( ON ?auto_13181 ?auto_13188 ) ( CLEAR ?auto_13181 ) ( not ( = ?auto_13181 ?auto_13188 ) ) ( not ( = ?auto_13182 ?auto_13188 ) ) ( IS-CRATE ?auto_13182 ) ( not ( = ?auto_13181 ?auto_13195 ) ) ( not ( = ?auto_13182 ?auto_13195 ) ) ( not ( = ?auto_13188 ?auto_13195 ) ) ( not ( = ?auto_13187 ?auto_13185 ) ) ( not ( = ?auto_13196 ?auto_13187 ) ) ( HOIST-AT ?auto_13183 ?auto_13187 ) ( not ( = ?auto_13192 ?auto_13183 ) ) ( not ( = ?auto_13190 ?auto_13183 ) ) ( AVAILABLE ?auto_13183 ) ( SURFACE-AT ?auto_13182 ?auto_13187 ) ( ON ?auto_13182 ?auto_13184 ) ( CLEAR ?auto_13182 ) ( not ( = ?auto_13181 ?auto_13184 ) ) ( not ( = ?auto_13182 ?auto_13184 ) ) ( not ( = ?auto_13188 ?auto_13184 ) ) ( not ( = ?auto_13195 ?auto_13184 ) ) ( IS-CRATE ?auto_13195 ) ( not ( = ?auto_13181 ?auto_13191 ) ) ( not ( = ?auto_13182 ?auto_13191 ) ) ( not ( = ?auto_13188 ?auto_13191 ) ) ( not ( = ?auto_13195 ?auto_13191 ) ) ( not ( = ?auto_13184 ?auto_13191 ) ) ( not ( = ?auto_13194 ?auto_13185 ) ) ( not ( = ?auto_13196 ?auto_13194 ) ) ( not ( = ?auto_13187 ?auto_13194 ) ) ( HOIST-AT ?auto_13193 ?auto_13194 ) ( not ( = ?auto_13192 ?auto_13193 ) ) ( not ( = ?auto_13190 ?auto_13193 ) ) ( not ( = ?auto_13183 ?auto_13193 ) ) ( AVAILABLE ?auto_13193 ) ( SURFACE-AT ?auto_13195 ?auto_13194 ) ( ON ?auto_13195 ?auto_13186 ) ( CLEAR ?auto_13195 ) ( not ( = ?auto_13181 ?auto_13186 ) ) ( not ( = ?auto_13182 ?auto_13186 ) ) ( not ( = ?auto_13188 ?auto_13186 ) ) ( not ( = ?auto_13195 ?auto_13186 ) ) ( not ( = ?auto_13184 ?auto_13186 ) ) ( not ( = ?auto_13191 ?auto_13186 ) ) ( SURFACE-AT ?auto_13197 ?auto_13185 ) ( CLEAR ?auto_13197 ) ( IS-CRATE ?auto_13191 ) ( not ( = ?auto_13181 ?auto_13197 ) ) ( not ( = ?auto_13182 ?auto_13197 ) ) ( not ( = ?auto_13188 ?auto_13197 ) ) ( not ( = ?auto_13195 ?auto_13197 ) ) ( not ( = ?auto_13184 ?auto_13197 ) ) ( not ( = ?auto_13191 ?auto_13197 ) ) ( not ( = ?auto_13186 ?auto_13197 ) ) ( AVAILABLE ?auto_13192 ) ( IN ?auto_13191 ?auto_13189 ) ( TRUCK-AT ?auto_13189 ?auto_13194 ) )
    :subtasks
    ( ( !DRIVE ?auto_13189 ?auto_13194 ?auto_13185 )
      ( MAKE-ON ?auto_13181 ?auto_13182 )
      ( MAKE-ON-VERIFY ?auto_13181 ?auto_13182 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13198 - SURFACE
      ?auto_13199 - SURFACE
    )
    :vars
    (
      ?auto_13205 - HOIST
      ?auto_13210 - PLACE
      ?auto_13206 - PLACE
      ?auto_13208 - HOIST
      ?auto_13209 - SURFACE
      ?auto_13207 - SURFACE
      ?auto_13204 - PLACE
      ?auto_13212 - HOIST
      ?auto_13211 - SURFACE
      ?auto_13213 - SURFACE
      ?auto_13214 - PLACE
      ?auto_13203 - HOIST
      ?auto_13200 - SURFACE
      ?auto_13201 - SURFACE
      ?auto_13202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13205 ?auto_13210 ) ( IS-CRATE ?auto_13198 ) ( not ( = ?auto_13198 ?auto_13199 ) ) ( not ( = ?auto_13206 ?auto_13210 ) ) ( HOIST-AT ?auto_13208 ?auto_13206 ) ( not ( = ?auto_13205 ?auto_13208 ) ) ( AVAILABLE ?auto_13208 ) ( SURFACE-AT ?auto_13198 ?auto_13206 ) ( ON ?auto_13198 ?auto_13209 ) ( CLEAR ?auto_13198 ) ( not ( = ?auto_13198 ?auto_13209 ) ) ( not ( = ?auto_13199 ?auto_13209 ) ) ( IS-CRATE ?auto_13199 ) ( not ( = ?auto_13198 ?auto_13207 ) ) ( not ( = ?auto_13199 ?auto_13207 ) ) ( not ( = ?auto_13209 ?auto_13207 ) ) ( not ( = ?auto_13204 ?auto_13210 ) ) ( not ( = ?auto_13206 ?auto_13204 ) ) ( HOIST-AT ?auto_13212 ?auto_13204 ) ( not ( = ?auto_13205 ?auto_13212 ) ) ( not ( = ?auto_13208 ?auto_13212 ) ) ( AVAILABLE ?auto_13212 ) ( SURFACE-AT ?auto_13199 ?auto_13204 ) ( ON ?auto_13199 ?auto_13211 ) ( CLEAR ?auto_13199 ) ( not ( = ?auto_13198 ?auto_13211 ) ) ( not ( = ?auto_13199 ?auto_13211 ) ) ( not ( = ?auto_13209 ?auto_13211 ) ) ( not ( = ?auto_13207 ?auto_13211 ) ) ( IS-CRATE ?auto_13207 ) ( not ( = ?auto_13198 ?auto_13213 ) ) ( not ( = ?auto_13199 ?auto_13213 ) ) ( not ( = ?auto_13209 ?auto_13213 ) ) ( not ( = ?auto_13207 ?auto_13213 ) ) ( not ( = ?auto_13211 ?auto_13213 ) ) ( not ( = ?auto_13214 ?auto_13210 ) ) ( not ( = ?auto_13206 ?auto_13214 ) ) ( not ( = ?auto_13204 ?auto_13214 ) ) ( HOIST-AT ?auto_13203 ?auto_13214 ) ( not ( = ?auto_13205 ?auto_13203 ) ) ( not ( = ?auto_13208 ?auto_13203 ) ) ( not ( = ?auto_13212 ?auto_13203 ) ) ( SURFACE-AT ?auto_13207 ?auto_13214 ) ( ON ?auto_13207 ?auto_13200 ) ( CLEAR ?auto_13207 ) ( not ( = ?auto_13198 ?auto_13200 ) ) ( not ( = ?auto_13199 ?auto_13200 ) ) ( not ( = ?auto_13209 ?auto_13200 ) ) ( not ( = ?auto_13207 ?auto_13200 ) ) ( not ( = ?auto_13211 ?auto_13200 ) ) ( not ( = ?auto_13213 ?auto_13200 ) ) ( SURFACE-AT ?auto_13201 ?auto_13210 ) ( CLEAR ?auto_13201 ) ( IS-CRATE ?auto_13213 ) ( not ( = ?auto_13198 ?auto_13201 ) ) ( not ( = ?auto_13199 ?auto_13201 ) ) ( not ( = ?auto_13209 ?auto_13201 ) ) ( not ( = ?auto_13207 ?auto_13201 ) ) ( not ( = ?auto_13211 ?auto_13201 ) ) ( not ( = ?auto_13213 ?auto_13201 ) ) ( not ( = ?auto_13200 ?auto_13201 ) ) ( AVAILABLE ?auto_13205 ) ( TRUCK-AT ?auto_13202 ?auto_13214 ) ( LIFTING ?auto_13203 ?auto_13213 ) )
    :subtasks
    ( ( !LOAD ?auto_13203 ?auto_13213 ?auto_13202 ?auto_13214 )
      ( MAKE-ON ?auto_13198 ?auto_13199 )
      ( MAKE-ON-VERIFY ?auto_13198 ?auto_13199 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13215 - SURFACE
      ?auto_13216 - SURFACE
    )
    :vars
    (
      ?auto_13227 - HOIST
      ?auto_13222 - PLACE
      ?auto_13228 - PLACE
      ?auto_13219 - HOIST
      ?auto_13221 - SURFACE
      ?auto_13226 - SURFACE
      ?auto_13218 - PLACE
      ?auto_13223 - HOIST
      ?auto_13220 - SURFACE
      ?auto_13217 - SURFACE
      ?auto_13231 - PLACE
      ?auto_13229 - HOIST
      ?auto_13230 - SURFACE
      ?auto_13224 - SURFACE
      ?auto_13225 - TRUCK
      ?auto_13232 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13227 ?auto_13222 ) ( IS-CRATE ?auto_13215 ) ( not ( = ?auto_13215 ?auto_13216 ) ) ( not ( = ?auto_13228 ?auto_13222 ) ) ( HOIST-AT ?auto_13219 ?auto_13228 ) ( not ( = ?auto_13227 ?auto_13219 ) ) ( AVAILABLE ?auto_13219 ) ( SURFACE-AT ?auto_13215 ?auto_13228 ) ( ON ?auto_13215 ?auto_13221 ) ( CLEAR ?auto_13215 ) ( not ( = ?auto_13215 ?auto_13221 ) ) ( not ( = ?auto_13216 ?auto_13221 ) ) ( IS-CRATE ?auto_13216 ) ( not ( = ?auto_13215 ?auto_13226 ) ) ( not ( = ?auto_13216 ?auto_13226 ) ) ( not ( = ?auto_13221 ?auto_13226 ) ) ( not ( = ?auto_13218 ?auto_13222 ) ) ( not ( = ?auto_13228 ?auto_13218 ) ) ( HOIST-AT ?auto_13223 ?auto_13218 ) ( not ( = ?auto_13227 ?auto_13223 ) ) ( not ( = ?auto_13219 ?auto_13223 ) ) ( AVAILABLE ?auto_13223 ) ( SURFACE-AT ?auto_13216 ?auto_13218 ) ( ON ?auto_13216 ?auto_13220 ) ( CLEAR ?auto_13216 ) ( not ( = ?auto_13215 ?auto_13220 ) ) ( not ( = ?auto_13216 ?auto_13220 ) ) ( not ( = ?auto_13221 ?auto_13220 ) ) ( not ( = ?auto_13226 ?auto_13220 ) ) ( IS-CRATE ?auto_13226 ) ( not ( = ?auto_13215 ?auto_13217 ) ) ( not ( = ?auto_13216 ?auto_13217 ) ) ( not ( = ?auto_13221 ?auto_13217 ) ) ( not ( = ?auto_13226 ?auto_13217 ) ) ( not ( = ?auto_13220 ?auto_13217 ) ) ( not ( = ?auto_13231 ?auto_13222 ) ) ( not ( = ?auto_13228 ?auto_13231 ) ) ( not ( = ?auto_13218 ?auto_13231 ) ) ( HOIST-AT ?auto_13229 ?auto_13231 ) ( not ( = ?auto_13227 ?auto_13229 ) ) ( not ( = ?auto_13219 ?auto_13229 ) ) ( not ( = ?auto_13223 ?auto_13229 ) ) ( SURFACE-AT ?auto_13226 ?auto_13231 ) ( ON ?auto_13226 ?auto_13230 ) ( CLEAR ?auto_13226 ) ( not ( = ?auto_13215 ?auto_13230 ) ) ( not ( = ?auto_13216 ?auto_13230 ) ) ( not ( = ?auto_13221 ?auto_13230 ) ) ( not ( = ?auto_13226 ?auto_13230 ) ) ( not ( = ?auto_13220 ?auto_13230 ) ) ( not ( = ?auto_13217 ?auto_13230 ) ) ( SURFACE-AT ?auto_13224 ?auto_13222 ) ( CLEAR ?auto_13224 ) ( IS-CRATE ?auto_13217 ) ( not ( = ?auto_13215 ?auto_13224 ) ) ( not ( = ?auto_13216 ?auto_13224 ) ) ( not ( = ?auto_13221 ?auto_13224 ) ) ( not ( = ?auto_13226 ?auto_13224 ) ) ( not ( = ?auto_13220 ?auto_13224 ) ) ( not ( = ?auto_13217 ?auto_13224 ) ) ( not ( = ?auto_13230 ?auto_13224 ) ) ( AVAILABLE ?auto_13227 ) ( TRUCK-AT ?auto_13225 ?auto_13231 ) ( AVAILABLE ?auto_13229 ) ( SURFACE-AT ?auto_13217 ?auto_13231 ) ( ON ?auto_13217 ?auto_13232 ) ( CLEAR ?auto_13217 ) ( not ( = ?auto_13215 ?auto_13232 ) ) ( not ( = ?auto_13216 ?auto_13232 ) ) ( not ( = ?auto_13221 ?auto_13232 ) ) ( not ( = ?auto_13226 ?auto_13232 ) ) ( not ( = ?auto_13220 ?auto_13232 ) ) ( not ( = ?auto_13217 ?auto_13232 ) ) ( not ( = ?auto_13230 ?auto_13232 ) ) ( not ( = ?auto_13224 ?auto_13232 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13229 ?auto_13217 ?auto_13232 ?auto_13231 )
      ( MAKE-ON ?auto_13215 ?auto_13216 )
      ( MAKE-ON-VERIFY ?auto_13215 ?auto_13216 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13233 - SURFACE
      ?auto_13234 - SURFACE
    )
    :vars
    (
      ?auto_13236 - HOIST
      ?auto_13246 - PLACE
      ?auto_13237 - PLACE
      ?auto_13248 - HOIST
      ?auto_13244 - SURFACE
      ?auto_13241 - SURFACE
      ?auto_13249 - PLACE
      ?auto_13242 - HOIST
      ?auto_13250 - SURFACE
      ?auto_13245 - SURFACE
      ?auto_13240 - PLACE
      ?auto_13238 - HOIST
      ?auto_13235 - SURFACE
      ?auto_13247 - SURFACE
      ?auto_13243 - SURFACE
      ?auto_13239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13236 ?auto_13246 ) ( IS-CRATE ?auto_13233 ) ( not ( = ?auto_13233 ?auto_13234 ) ) ( not ( = ?auto_13237 ?auto_13246 ) ) ( HOIST-AT ?auto_13248 ?auto_13237 ) ( not ( = ?auto_13236 ?auto_13248 ) ) ( AVAILABLE ?auto_13248 ) ( SURFACE-AT ?auto_13233 ?auto_13237 ) ( ON ?auto_13233 ?auto_13244 ) ( CLEAR ?auto_13233 ) ( not ( = ?auto_13233 ?auto_13244 ) ) ( not ( = ?auto_13234 ?auto_13244 ) ) ( IS-CRATE ?auto_13234 ) ( not ( = ?auto_13233 ?auto_13241 ) ) ( not ( = ?auto_13234 ?auto_13241 ) ) ( not ( = ?auto_13244 ?auto_13241 ) ) ( not ( = ?auto_13249 ?auto_13246 ) ) ( not ( = ?auto_13237 ?auto_13249 ) ) ( HOIST-AT ?auto_13242 ?auto_13249 ) ( not ( = ?auto_13236 ?auto_13242 ) ) ( not ( = ?auto_13248 ?auto_13242 ) ) ( AVAILABLE ?auto_13242 ) ( SURFACE-AT ?auto_13234 ?auto_13249 ) ( ON ?auto_13234 ?auto_13250 ) ( CLEAR ?auto_13234 ) ( not ( = ?auto_13233 ?auto_13250 ) ) ( not ( = ?auto_13234 ?auto_13250 ) ) ( not ( = ?auto_13244 ?auto_13250 ) ) ( not ( = ?auto_13241 ?auto_13250 ) ) ( IS-CRATE ?auto_13241 ) ( not ( = ?auto_13233 ?auto_13245 ) ) ( not ( = ?auto_13234 ?auto_13245 ) ) ( not ( = ?auto_13244 ?auto_13245 ) ) ( not ( = ?auto_13241 ?auto_13245 ) ) ( not ( = ?auto_13250 ?auto_13245 ) ) ( not ( = ?auto_13240 ?auto_13246 ) ) ( not ( = ?auto_13237 ?auto_13240 ) ) ( not ( = ?auto_13249 ?auto_13240 ) ) ( HOIST-AT ?auto_13238 ?auto_13240 ) ( not ( = ?auto_13236 ?auto_13238 ) ) ( not ( = ?auto_13248 ?auto_13238 ) ) ( not ( = ?auto_13242 ?auto_13238 ) ) ( SURFACE-AT ?auto_13241 ?auto_13240 ) ( ON ?auto_13241 ?auto_13235 ) ( CLEAR ?auto_13241 ) ( not ( = ?auto_13233 ?auto_13235 ) ) ( not ( = ?auto_13234 ?auto_13235 ) ) ( not ( = ?auto_13244 ?auto_13235 ) ) ( not ( = ?auto_13241 ?auto_13235 ) ) ( not ( = ?auto_13250 ?auto_13235 ) ) ( not ( = ?auto_13245 ?auto_13235 ) ) ( SURFACE-AT ?auto_13247 ?auto_13246 ) ( CLEAR ?auto_13247 ) ( IS-CRATE ?auto_13245 ) ( not ( = ?auto_13233 ?auto_13247 ) ) ( not ( = ?auto_13234 ?auto_13247 ) ) ( not ( = ?auto_13244 ?auto_13247 ) ) ( not ( = ?auto_13241 ?auto_13247 ) ) ( not ( = ?auto_13250 ?auto_13247 ) ) ( not ( = ?auto_13245 ?auto_13247 ) ) ( not ( = ?auto_13235 ?auto_13247 ) ) ( AVAILABLE ?auto_13236 ) ( AVAILABLE ?auto_13238 ) ( SURFACE-AT ?auto_13245 ?auto_13240 ) ( ON ?auto_13245 ?auto_13243 ) ( CLEAR ?auto_13245 ) ( not ( = ?auto_13233 ?auto_13243 ) ) ( not ( = ?auto_13234 ?auto_13243 ) ) ( not ( = ?auto_13244 ?auto_13243 ) ) ( not ( = ?auto_13241 ?auto_13243 ) ) ( not ( = ?auto_13250 ?auto_13243 ) ) ( not ( = ?auto_13245 ?auto_13243 ) ) ( not ( = ?auto_13235 ?auto_13243 ) ) ( not ( = ?auto_13247 ?auto_13243 ) ) ( TRUCK-AT ?auto_13239 ?auto_13246 ) )
    :subtasks
    ( ( !DRIVE ?auto_13239 ?auto_13246 ?auto_13240 )
      ( MAKE-ON ?auto_13233 ?auto_13234 )
      ( MAKE-ON-VERIFY ?auto_13233 ?auto_13234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13251 - SURFACE
      ?auto_13252 - SURFACE
    )
    :vars
    (
      ?auto_13255 - HOIST
      ?auto_13264 - PLACE
      ?auto_13256 - PLACE
      ?auto_13253 - HOIST
      ?auto_13259 - SURFACE
      ?auto_13261 - SURFACE
      ?auto_13254 - PLACE
      ?auto_13263 - HOIST
      ?auto_13260 - SURFACE
      ?auto_13268 - SURFACE
      ?auto_13257 - PLACE
      ?auto_13258 - HOIST
      ?auto_13266 - SURFACE
      ?auto_13265 - SURFACE
      ?auto_13262 - SURFACE
      ?auto_13267 - TRUCK
      ?auto_13269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13255 ?auto_13264 ) ( IS-CRATE ?auto_13251 ) ( not ( = ?auto_13251 ?auto_13252 ) ) ( not ( = ?auto_13256 ?auto_13264 ) ) ( HOIST-AT ?auto_13253 ?auto_13256 ) ( not ( = ?auto_13255 ?auto_13253 ) ) ( AVAILABLE ?auto_13253 ) ( SURFACE-AT ?auto_13251 ?auto_13256 ) ( ON ?auto_13251 ?auto_13259 ) ( CLEAR ?auto_13251 ) ( not ( = ?auto_13251 ?auto_13259 ) ) ( not ( = ?auto_13252 ?auto_13259 ) ) ( IS-CRATE ?auto_13252 ) ( not ( = ?auto_13251 ?auto_13261 ) ) ( not ( = ?auto_13252 ?auto_13261 ) ) ( not ( = ?auto_13259 ?auto_13261 ) ) ( not ( = ?auto_13254 ?auto_13264 ) ) ( not ( = ?auto_13256 ?auto_13254 ) ) ( HOIST-AT ?auto_13263 ?auto_13254 ) ( not ( = ?auto_13255 ?auto_13263 ) ) ( not ( = ?auto_13253 ?auto_13263 ) ) ( AVAILABLE ?auto_13263 ) ( SURFACE-AT ?auto_13252 ?auto_13254 ) ( ON ?auto_13252 ?auto_13260 ) ( CLEAR ?auto_13252 ) ( not ( = ?auto_13251 ?auto_13260 ) ) ( not ( = ?auto_13252 ?auto_13260 ) ) ( not ( = ?auto_13259 ?auto_13260 ) ) ( not ( = ?auto_13261 ?auto_13260 ) ) ( IS-CRATE ?auto_13261 ) ( not ( = ?auto_13251 ?auto_13268 ) ) ( not ( = ?auto_13252 ?auto_13268 ) ) ( not ( = ?auto_13259 ?auto_13268 ) ) ( not ( = ?auto_13261 ?auto_13268 ) ) ( not ( = ?auto_13260 ?auto_13268 ) ) ( not ( = ?auto_13257 ?auto_13264 ) ) ( not ( = ?auto_13256 ?auto_13257 ) ) ( not ( = ?auto_13254 ?auto_13257 ) ) ( HOIST-AT ?auto_13258 ?auto_13257 ) ( not ( = ?auto_13255 ?auto_13258 ) ) ( not ( = ?auto_13253 ?auto_13258 ) ) ( not ( = ?auto_13263 ?auto_13258 ) ) ( SURFACE-AT ?auto_13261 ?auto_13257 ) ( ON ?auto_13261 ?auto_13266 ) ( CLEAR ?auto_13261 ) ( not ( = ?auto_13251 ?auto_13266 ) ) ( not ( = ?auto_13252 ?auto_13266 ) ) ( not ( = ?auto_13259 ?auto_13266 ) ) ( not ( = ?auto_13261 ?auto_13266 ) ) ( not ( = ?auto_13260 ?auto_13266 ) ) ( not ( = ?auto_13268 ?auto_13266 ) ) ( IS-CRATE ?auto_13268 ) ( not ( = ?auto_13251 ?auto_13265 ) ) ( not ( = ?auto_13252 ?auto_13265 ) ) ( not ( = ?auto_13259 ?auto_13265 ) ) ( not ( = ?auto_13261 ?auto_13265 ) ) ( not ( = ?auto_13260 ?auto_13265 ) ) ( not ( = ?auto_13268 ?auto_13265 ) ) ( not ( = ?auto_13266 ?auto_13265 ) ) ( AVAILABLE ?auto_13258 ) ( SURFACE-AT ?auto_13268 ?auto_13257 ) ( ON ?auto_13268 ?auto_13262 ) ( CLEAR ?auto_13268 ) ( not ( = ?auto_13251 ?auto_13262 ) ) ( not ( = ?auto_13252 ?auto_13262 ) ) ( not ( = ?auto_13259 ?auto_13262 ) ) ( not ( = ?auto_13261 ?auto_13262 ) ) ( not ( = ?auto_13260 ?auto_13262 ) ) ( not ( = ?auto_13268 ?auto_13262 ) ) ( not ( = ?auto_13266 ?auto_13262 ) ) ( not ( = ?auto_13265 ?auto_13262 ) ) ( TRUCK-AT ?auto_13267 ?auto_13264 ) ( SURFACE-AT ?auto_13269 ?auto_13264 ) ( CLEAR ?auto_13269 ) ( LIFTING ?auto_13255 ?auto_13265 ) ( IS-CRATE ?auto_13265 ) ( not ( = ?auto_13251 ?auto_13269 ) ) ( not ( = ?auto_13252 ?auto_13269 ) ) ( not ( = ?auto_13259 ?auto_13269 ) ) ( not ( = ?auto_13261 ?auto_13269 ) ) ( not ( = ?auto_13260 ?auto_13269 ) ) ( not ( = ?auto_13268 ?auto_13269 ) ) ( not ( = ?auto_13266 ?auto_13269 ) ) ( not ( = ?auto_13265 ?auto_13269 ) ) ( not ( = ?auto_13262 ?auto_13269 ) ) )
    :subtasks
    ( ( !DROP ?auto_13255 ?auto_13265 ?auto_13269 ?auto_13264 )
      ( MAKE-ON ?auto_13251 ?auto_13252 )
      ( MAKE-ON-VERIFY ?auto_13251 ?auto_13252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13270 - SURFACE
      ?auto_13271 - SURFACE
    )
    :vars
    (
      ?auto_13287 - HOIST
      ?auto_13286 - PLACE
      ?auto_13288 - PLACE
      ?auto_13285 - HOIST
      ?auto_13278 - SURFACE
      ?auto_13284 - SURFACE
      ?auto_13279 - PLACE
      ?auto_13275 - HOIST
      ?auto_13273 - SURFACE
      ?auto_13277 - SURFACE
      ?auto_13272 - PLACE
      ?auto_13276 - HOIST
      ?auto_13274 - SURFACE
      ?auto_13280 - SURFACE
      ?auto_13281 - SURFACE
      ?auto_13282 - TRUCK
      ?auto_13283 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13287 ?auto_13286 ) ( IS-CRATE ?auto_13270 ) ( not ( = ?auto_13270 ?auto_13271 ) ) ( not ( = ?auto_13288 ?auto_13286 ) ) ( HOIST-AT ?auto_13285 ?auto_13288 ) ( not ( = ?auto_13287 ?auto_13285 ) ) ( AVAILABLE ?auto_13285 ) ( SURFACE-AT ?auto_13270 ?auto_13288 ) ( ON ?auto_13270 ?auto_13278 ) ( CLEAR ?auto_13270 ) ( not ( = ?auto_13270 ?auto_13278 ) ) ( not ( = ?auto_13271 ?auto_13278 ) ) ( IS-CRATE ?auto_13271 ) ( not ( = ?auto_13270 ?auto_13284 ) ) ( not ( = ?auto_13271 ?auto_13284 ) ) ( not ( = ?auto_13278 ?auto_13284 ) ) ( not ( = ?auto_13279 ?auto_13286 ) ) ( not ( = ?auto_13288 ?auto_13279 ) ) ( HOIST-AT ?auto_13275 ?auto_13279 ) ( not ( = ?auto_13287 ?auto_13275 ) ) ( not ( = ?auto_13285 ?auto_13275 ) ) ( AVAILABLE ?auto_13275 ) ( SURFACE-AT ?auto_13271 ?auto_13279 ) ( ON ?auto_13271 ?auto_13273 ) ( CLEAR ?auto_13271 ) ( not ( = ?auto_13270 ?auto_13273 ) ) ( not ( = ?auto_13271 ?auto_13273 ) ) ( not ( = ?auto_13278 ?auto_13273 ) ) ( not ( = ?auto_13284 ?auto_13273 ) ) ( IS-CRATE ?auto_13284 ) ( not ( = ?auto_13270 ?auto_13277 ) ) ( not ( = ?auto_13271 ?auto_13277 ) ) ( not ( = ?auto_13278 ?auto_13277 ) ) ( not ( = ?auto_13284 ?auto_13277 ) ) ( not ( = ?auto_13273 ?auto_13277 ) ) ( not ( = ?auto_13272 ?auto_13286 ) ) ( not ( = ?auto_13288 ?auto_13272 ) ) ( not ( = ?auto_13279 ?auto_13272 ) ) ( HOIST-AT ?auto_13276 ?auto_13272 ) ( not ( = ?auto_13287 ?auto_13276 ) ) ( not ( = ?auto_13285 ?auto_13276 ) ) ( not ( = ?auto_13275 ?auto_13276 ) ) ( SURFACE-AT ?auto_13284 ?auto_13272 ) ( ON ?auto_13284 ?auto_13274 ) ( CLEAR ?auto_13284 ) ( not ( = ?auto_13270 ?auto_13274 ) ) ( not ( = ?auto_13271 ?auto_13274 ) ) ( not ( = ?auto_13278 ?auto_13274 ) ) ( not ( = ?auto_13284 ?auto_13274 ) ) ( not ( = ?auto_13273 ?auto_13274 ) ) ( not ( = ?auto_13277 ?auto_13274 ) ) ( IS-CRATE ?auto_13277 ) ( not ( = ?auto_13270 ?auto_13280 ) ) ( not ( = ?auto_13271 ?auto_13280 ) ) ( not ( = ?auto_13278 ?auto_13280 ) ) ( not ( = ?auto_13284 ?auto_13280 ) ) ( not ( = ?auto_13273 ?auto_13280 ) ) ( not ( = ?auto_13277 ?auto_13280 ) ) ( not ( = ?auto_13274 ?auto_13280 ) ) ( AVAILABLE ?auto_13276 ) ( SURFACE-AT ?auto_13277 ?auto_13272 ) ( ON ?auto_13277 ?auto_13281 ) ( CLEAR ?auto_13277 ) ( not ( = ?auto_13270 ?auto_13281 ) ) ( not ( = ?auto_13271 ?auto_13281 ) ) ( not ( = ?auto_13278 ?auto_13281 ) ) ( not ( = ?auto_13284 ?auto_13281 ) ) ( not ( = ?auto_13273 ?auto_13281 ) ) ( not ( = ?auto_13277 ?auto_13281 ) ) ( not ( = ?auto_13274 ?auto_13281 ) ) ( not ( = ?auto_13280 ?auto_13281 ) ) ( TRUCK-AT ?auto_13282 ?auto_13286 ) ( SURFACE-AT ?auto_13283 ?auto_13286 ) ( CLEAR ?auto_13283 ) ( IS-CRATE ?auto_13280 ) ( not ( = ?auto_13270 ?auto_13283 ) ) ( not ( = ?auto_13271 ?auto_13283 ) ) ( not ( = ?auto_13278 ?auto_13283 ) ) ( not ( = ?auto_13284 ?auto_13283 ) ) ( not ( = ?auto_13273 ?auto_13283 ) ) ( not ( = ?auto_13277 ?auto_13283 ) ) ( not ( = ?auto_13274 ?auto_13283 ) ) ( not ( = ?auto_13280 ?auto_13283 ) ) ( not ( = ?auto_13281 ?auto_13283 ) ) ( AVAILABLE ?auto_13287 ) ( IN ?auto_13280 ?auto_13282 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13287 ?auto_13280 ?auto_13282 ?auto_13286 )
      ( MAKE-ON ?auto_13270 ?auto_13271 )
      ( MAKE-ON-VERIFY ?auto_13270 ?auto_13271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13289 - SURFACE
      ?auto_13290 - SURFACE
    )
    :vars
    (
      ?auto_13304 - HOIST
      ?auto_13292 - PLACE
      ?auto_13295 - PLACE
      ?auto_13296 - HOIST
      ?auto_13299 - SURFACE
      ?auto_13303 - SURFACE
      ?auto_13307 - PLACE
      ?auto_13300 - HOIST
      ?auto_13297 - SURFACE
      ?auto_13294 - SURFACE
      ?auto_13291 - PLACE
      ?auto_13298 - HOIST
      ?auto_13306 - SURFACE
      ?auto_13302 - SURFACE
      ?auto_13293 - SURFACE
      ?auto_13305 - SURFACE
      ?auto_13301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13304 ?auto_13292 ) ( IS-CRATE ?auto_13289 ) ( not ( = ?auto_13289 ?auto_13290 ) ) ( not ( = ?auto_13295 ?auto_13292 ) ) ( HOIST-AT ?auto_13296 ?auto_13295 ) ( not ( = ?auto_13304 ?auto_13296 ) ) ( AVAILABLE ?auto_13296 ) ( SURFACE-AT ?auto_13289 ?auto_13295 ) ( ON ?auto_13289 ?auto_13299 ) ( CLEAR ?auto_13289 ) ( not ( = ?auto_13289 ?auto_13299 ) ) ( not ( = ?auto_13290 ?auto_13299 ) ) ( IS-CRATE ?auto_13290 ) ( not ( = ?auto_13289 ?auto_13303 ) ) ( not ( = ?auto_13290 ?auto_13303 ) ) ( not ( = ?auto_13299 ?auto_13303 ) ) ( not ( = ?auto_13307 ?auto_13292 ) ) ( not ( = ?auto_13295 ?auto_13307 ) ) ( HOIST-AT ?auto_13300 ?auto_13307 ) ( not ( = ?auto_13304 ?auto_13300 ) ) ( not ( = ?auto_13296 ?auto_13300 ) ) ( AVAILABLE ?auto_13300 ) ( SURFACE-AT ?auto_13290 ?auto_13307 ) ( ON ?auto_13290 ?auto_13297 ) ( CLEAR ?auto_13290 ) ( not ( = ?auto_13289 ?auto_13297 ) ) ( not ( = ?auto_13290 ?auto_13297 ) ) ( not ( = ?auto_13299 ?auto_13297 ) ) ( not ( = ?auto_13303 ?auto_13297 ) ) ( IS-CRATE ?auto_13303 ) ( not ( = ?auto_13289 ?auto_13294 ) ) ( not ( = ?auto_13290 ?auto_13294 ) ) ( not ( = ?auto_13299 ?auto_13294 ) ) ( not ( = ?auto_13303 ?auto_13294 ) ) ( not ( = ?auto_13297 ?auto_13294 ) ) ( not ( = ?auto_13291 ?auto_13292 ) ) ( not ( = ?auto_13295 ?auto_13291 ) ) ( not ( = ?auto_13307 ?auto_13291 ) ) ( HOIST-AT ?auto_13298 ?auto_13291 ) ( not ( = ?auto_13304 ?auto_13298 ) ) ( not ( = ?auto_13296 ?auto_13298 ) ) ( not ( = ?auto_13300 ?auto_13298 ) ) ( SURFACE-AT ?auto_13303 ?auto_13291 ) ( ON ?auto_13303 ?auto_13306 ) ( CLEAR ?auto_13303 ) ( not ( = ?auto_13289 ?auto_13306 ) ) ( not ( = ?auto_13290 ?auto_13306 ) ) ( not ( = ?auto_13299 ?auto_13306 ) ) ( not ( = ?auto_13303 ?auto_13306 ) ) ( not ( = ?auto_13297 ?auto_13306 ) ) ( not ( = ?auto_13294 ?auto_13306 ) ) ( IS-CRATE ?auto_13294 ) ( not ( = ?auto_13289 ?auto_13302 ) ) ( not ( = ?auto_13290 ?auto_13302 ) ) ( not ( = ?auto_13299 ?auto_13302 ) ) ( not ( = ?auto_13303 ?auto_13302 ) ) ( not ( = ?auto_13297 ?auto_13302 ) ) ( not ( = ?auto_13294 ?auto_13302 ) ) ( not ( = ?auto_13306 ?auto_13302 ) ) ( AVAILABLE ?auto_13298 ) ( SURFACE-AT ?auto_13294 ?auto_13291 ) ( ON ?auto_13294 ?auto_13293 ) ( CLEAR ?auto_13294 ) ( not ( = ?auto_13289 ?auto_13293 ) ) ( not ( = ?auto_13290 ?auto_13293 ) ) ( not ( = ?auto_13299 ?auto_13293 ) ) ( not ( = ?auto_13303 ?auto_13293 ) ) ( not ( = ?auto_13297 ?auto_13293 ) ) ( not ( = ?auto_13294 ?auto_13293 ) ) ( not ( = ?auto_13306 ?auto_13293 ) ) ( not ( = ?auto_13302 ?auto_13293 ) ) ( SURFACE-AT ?auto_13305 ?auto_13292 ) ( CLEAR ?auto_13305 ) ( IS-CRATE ?auto_13302 ) ( not ( = ?auto_13289 ?auto_13305 ) ) ( not ( = ?auto_13290 ?auto_13305 ) ) ( not ( = ?auto_13299 ?auto_13305 ) ) ( not ( = ?auto_13303 ?auto_13305 ) ) ( not ( = ?auto_13297 ?auto_13305 ) ) ( not ( = ?auto_13294 ?auto_13305 ) ) ( not ( = ?auto_13306 ?auto_13305 ) ) ( not ( = ?auto_13302 ?auto_13305 ) ) ( not ( = ?auto_13293 ?auto_13305 ) ) ( AVAILABLE ?auto_13304 ) ( IN ?auto_13302 ?auto_13301 ) ( TRUCK-AT ?auto_13301 ?auto_13307 ) )
    :subtasks
    ( ( !DRIVE ?auto_13301 ?auto_13307 ?auto_13292 )
      ( MAKE-ON ?auto_13289 ?auto_13290 )
      ( MAKE-ON-VERIFY ?auto_13289 ?auto_13290 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13308 - SURFACE
      ?auto_13309 - SURFACE
    )
    :vars
    (
      ?auto_13311 - HOIST
      ?auto_13312 - PLACE
      ?auto_13321 - PLACE
      ?auto_13318 - HOIST
      ?auto_13316 - SURFACE
      ?auto_13313 - SURFACE
      ?auto_13310 - PLACE
      ?auto_13323 - HOIST
      ?auto_13326 - SURFACE
      ?auto_13317 - SURFACE
      ?auto_13320 - PLACE
      ?auto_13314 - HOIST
      ?auto_13324 - SURFACE
      ?auto_13322 - SURFACE
      ?auto_13315 - SURFACE
      ?auto_13325 - SURFACE
      ?auto_13319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13311 ?auto_13312 ) ( IS-CRATE ?auto_13308 ) ( not ( = ?auto_13308 ?auto_13309 ) ) ( not ( = ?auto_13321 ?auto_13312 ) ) ( HOIST-AT ?auto_13318 ?auto_13321 ) ( not ( = ?auto_13311 ?auto_13318 ) ) ( AVAILABLE ?auto_13318 ) ( SURFACE-AT ?auto_13308 ?auto_13321 ) ( ON ?auto_13308 ?auto_13316 ) ( CLEAR ?auto_13308 ) ( not ( = ?auto_13308 ?auto_13316 ) ) ( not ( = ?auto_13309 ?auto_13316 ) ) ( IS-CRATE ?auto_13309 ) ( not ( = ?auto_13308 ?auto_13313 ) ) ( not ( = ?auto_13309 ?auto_13313 ) ) ( not ( = ?auto_13316 ?auto_13313 ) ) ( not ( = ?auto_13310 ?auto_13312 ) ) ( not ( = ?auto_13321 ?auto_13310 ) ) ( HOIST-AT ?auto_13323 ?auto_13310 ) ( not ( = ?auto_13311 ?auto_13323 ) ) ( not ( = ?auto_13318 ?auto_13323 ) ) ( SURFACE-AT ?auto_13309 ?auto_13310 ) ( ON ?auto_13309 ?auto_13326 ) ( CLEAR ?auto_13309 ) ( not ( = ?auto_13308 ?auto_13326 ) ) ( not ( = ?auto_13309 ?auto_13326 ) ) ( not ( = ?auto_13316 ?auto_13326 ) ) ( not ( = ?auto_13313 ?auto_13326 ) ) ( IS-CRATE ?auto_13313 ) ( not ( = ?auto_13308 ?auto_13317 ) ) ( not ( = ?auto_13309 ?auto_13317 ) ) ( not ( = ?auto_13316 ?auto_13317 ) ) ( not ( = ?auto_13313 ?auto_13317 ) ) ( not ( = ?auto_13326 ?auto_13317 ) ) ( not ( = ?auto_13320 ?auto_13312 ) ) ( not ( = ?auto_13321 ?auto_13320 ) ) ( not ( = ?auto_13310 ?auto_13320 ) ) ( HOIST-AT ?auto_13314 ?auto_13320 ) ( not ( = ?auto_13311 ?auto_13314 ) ) ( not ( = ?auto_13318 ?auto_13314 ) ) ( not ( = ?auto_13323 ?auto_13314 ) ) ( SURFACE-AT ?auto_13313 ?auto_13320 ) ( ON ?auto_13313 ?auto_13324 ) ( CLEAR ?auto_13313 ) ( not ( = ?auto_13308 ?auto_13324 ) ) ( not ( = ?auto_13309 ?auto_13324 ) ) ( not ( = ?auto_13316 ?auto_13324 ) ) ( not ( = ?auto_13313 ?auto_13324 ) ) ( not ( = ?auto_13326 ?auto_13324 ) ) ( not ( = ?auto_13317 ?auto_13324 ) ) ( IS-CRATE ?auto_13317 ) ( not ( = ?auto_13308 ?auto_13322 ) ) ( not ( = ?auto_13309 ?auto_13322 ) ) ( not ( = ?auto_13316 ?auto_13322 ) ) ( not ( = ?auto_13313 ?auto_13322 ) ) ( not ( = ?auto_13326 ?auto_13322 ) ) ( not ( = ?auto_13317 ?auto_13322 ) ) ( not ( = ?auto_13324 ?auto_13322 ) ) ( AVAILABLE ?auto_13314 ) ( SURFACE-AT ?auto_13317 ?auto_13320 ) ( ON ?auto_13317 ?auto_13315 ) ( CLEAR ?auto_13317 ) ( not ( = ?auto_13308 ?auto_13315 ) ) ( not ( = ?auto_13309 ?auto_13315 ) ) ( not ( = ?auto_13316 ?auto_13315 ) ) ( not ( = ?auto_13313 ?auto_13315 ) ) ( not ( = ?auto_13326 ?auto_13315 ) ) ( not ( = ?auto_13317 ?auto_13315 ) ) ( not ( = ?auto_13324 ?auto_13315 ) ) ( not ( = ?auto_13322 ?auto_13315 ) ) ( SURFACE-AT ?auto_13325 ?auto_13312 ) ( CLEAR ?auto_13325 ) ( IS-CRATE ?auto_13322 ) ( not ( = ?auto_13308 ?auto_13325 ) ) ( not ( = ?auto_13309 ?auto_13325 ) ) ( not ( = ?auto_13316 ?auto_13325 ) ) ( not ( = ?auto_13313 ?auto_13325 ) ) ( not ( = ?auto_13326 ?auto_13325 ) ) ( not ( = ?auto_13317 ?auto_13325 ) ) ( not ( = ?auto_13324 ?auto_13325 ) ) ( not ( = ?auto_13322 ?auto_13325 ) ) ( not ( = ?auto_13315 ?auto_13325 ) ) ( AVAILABLE ?auto_13311 ) ( TRUCK-AT ?auto_13319 ?auto_13310 ) ( LIFTING ?auto_13323 ?auto_13322 ) )
    :subtasks
    ( ( !LOAD ?auto_13323 ?auto_13322 ?auto_13319 ?auto_13310 )
      ( MAKE-ON ?auto_13308 ?auto_13309 )
      ( MAKE-ON-VERIFY ?auto_13308 ?auto_13309 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13327 - SURFACE
      ?auto_13328 - SURFACE
    )
    :vars
    (
      ?auto_13342 - HOIST
      ?auto_13330 - PLACE
      ?auto_13341 - PLACE
      ?auto_13337 - HOIST
      ?auto_13336 - SURFACE
      ?auto_13340 - SURFACE
      ?auto_13344 - PLACE
      ?auto_13333 - HOIST
      ?auto_13338 - SURFACE
      ?auto_13331 - SURFACE
      ?auto_13345 - PLACE
      ?auto_13343 - HOIST
      ?auto_13329 - SURFACE
      ?auto_13339 - SURFACE
      ?auto_13335 - SURFACE
      ?auto_13332 - SURFACE
      ?auto_13334 - TRUCK
      ?auto_13346 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13342 ?auto_13330 ) ( IS-CRATE ?auto_13327 ) ( not ( = ?auto_13327 ?auto_13328 ) ) ( not ( = ?auto_13341 ?auto_13330 ) ) ( HOIST-AT ?auto_13337 ?auto_13341 ) ( not ( = ?auto_13342 ?auto_13337 ) ) ( AVAILABLE ?auto_13337 ) ( SURFACE-AT ?auto_13327 ?auto_13341 ) ( ON ?auto_13327 ?auto_13336 ) ( CLEAR ?auto_13327 ) ( not ( = ?auto_13327 ?auto_13336 ) ) ( not ( = ?auto_13328 ?auto_13336 ) ) ( IS-CRATE ?auto_13328 ) ( not ( = ?auto_13327 ?auto_13340 ) ) ( not ( = ?auto_13328 ?auto_13340 ) ) ( not ( = ?auto_13336 ?auto_13340 ) ) ( not ( = ?auto_13344 ?auto_13330 ) ) ( not ( = ?auto_13341 ?auto_13344 ) ) ( HOIST-AT ?auto_13333 ?auto_13344 ) ( not ( = ?auto_13342 ?auto_13333 ) ) ( not ( = ?auto_13337 ?auto_13333 ) ) ( SURFACE-AT ?auto_13328 ?auto_13344 ) ( ON ?auto_13328 ?auto_13338 ) ( CLEAR ?auto_13328 ) ( not ( = ?auto_13327 ?auto_13338 ) ) ( not ( = ?auto_13328 ?auto_13338 ) ) ( not ( = ?auto_13336 ?auto_13338 ) ) ( not ( = ?auto_13340 ?auto_13338 ) ) ( IS-CRATE ?auto_13340 ) ( not ( = ?auto_13327 ?auto_13331 ) ) ( not ( = ?auto_13328 ?auto_13331 ) ) ( not ( = ?auto_13336 ?auto_13331 ) ) ( not ( = ?auto_13340 ?auto_13331 ) ) ( not ( = ?auto_13338 ?auto_13331 ) ) ( not ( = ?auto_13345 ?auto_13330 ) ) ( not ( = ?auto_13341 ?auto_13345 ) ) ( not ( = ?auto_13344 ?auto_13345 ) ) ( HOIST-AT ?auto_13343 ?auto_13345 ) ( not ( = ?auto_13342 ?auto_13343 ) ) ( not ( = ?auto_13337 ?auto_13343 ) ) ( not ( = ?auto_13333 ?auto_13343 ) ) ( SURFACE-AT ?auto_13340 ?auto_13345 ) ( ON ?auto_13340 ?auto_13329 ) ( CLEAR ?auto_13340 ) ( not ( = ?auto_13327 ?auto_13329 ) ) ( not ( = ?auto_13328 ?auto_13329 ) ) ( not ( = ?auto_13336 ?auto_13329 ) ) ( not ( = ?auto_13340 ?auto_13329 ) ) ( not ( = ?auto_13338 ?auto_13329 ) ) ( not ( = ?auto_13331 ?auto_13329 ) ) ( IS-CRATE ?auto_13331 ) ( not ( = ?auto_13327 ?auto_13339 ) ) ( not ( = ?auto_13328 ?auto_13339 ) ) ( not ( = ?auto_13336 ?auto_13339 ) ) ( not ( = ?auto_13340 ?auto_13339 ) ) ( not ( = ?auto_13338 ?auto_13339 ) ) ( not ( = ?auto_13331 ?auto_13339 ) ) ( not ( = ?auto_13329 ?auto_13339 ) ) ( AVAILABLE ?auto_13343 ) ( SURFACE-AT ?auto_13331 ?auto_13345 ) ( ON ?auto_13331 ?auto_13335 ) ( CLEAR ?auto_13331 ) ( not ( = ?auto_13327 ?auto_13335 ) ) ( not ( = ?auto_13328 ?auto_13335 ) ) ( not ( = ?auto_13336 ?auto_13335 ) ) ( not ( = ?auto_13340 ?auto_13335 ) ) ( not ( = ?auto_13338 ?auto_13335 ) ) ( not ( = ?auto_13331 ?auto_13335 ) ) ( not ( = ?auto_13329 ?auto_13335 ) ) ( not ( = ?auto_13339 ?auto_13335 ) ) ( SURFACE-AT ?auto_13332 ?auto_13330 ) ( CLEAR ?auto_13332 ) ( IS-CRATE ?auto_13339 ) ( not ( = ?auto_13327 ?auto_13332 ) ) ( not ( = ?auto_13328 ?auto_13332 ) ) ( not ( = ?auto_13336 ?auto_13332 ) ) ( not ( = ?auto_13340 ?auto_13332 ) ) ( not ( = ?auto_13338 ?auto_13332 ) ) ( not ( = ?auto_13331 ?auto_13332 ) ) ( not ( = ?auto_13329 ?auto_13332 ) ) ( not ( = ?auto_13339 ?auto_13332 ) ) ( not ( = ?auto_13335 ?auto_13332 ) ) ( AVAILABLE ?auto_13342 ) ( TRUCK-AT ?auto_13334 ?auto_13344 ) ( AVAILABLE ?auto_13333 ) ( SURFACE-AT ?auto_13339 ?auto_13344 ) ( ON ?auto_13339 ?auto_13346 ) ( CLEAR ?auto_13339 ) ( not ( = ?auto_13327 ?auto_13346 ) ) ( not ( = ?auto_13328 ?auto_13346 ) ) ( not ( = ?auto_13336 ?auto_13346 ) ) ( not ( = ?auto_13340 ?auto_13346 ) ) ( not ( = ?auto_13338 ?auto_13346 ) ) ( not ( = ?auto_13331 ?auto_13346 ) ) ( not ( = ?auto_13329 ?auto_13346 ) ) ( not ( = ?auto_13339 ?auto_13346 ) ) ( not ( = ?auto_13335 ?auto_13346 ) ) ( not ( = ?auto_13332 ?auto_13346 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13333 ?auto_13339 ?auto_13346 ?auto_13344 )
      ( MAKE-ON ?auto_13327 ?auto_13328 )
      ( MAKE-ON-VERIFY ?auto_13327 ?auto_13328 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13347 - SURFACE
      ?auto_13348 - SURFACE
    )
    :vars
    (
      ?auto_13358 - HOIST
      ?auto_13360 - PLACE
      ?auto_13353 - PLACE
      ?auto_13361 - HOIST
      ?auto_13349 - SURFACE
      ?auto_13356 - SURFACE
      ?auto_13352 - PLACE
      ?auto_13357 - HOIST
      ?auto_13365 - SURFACE
      ?auto_13364 - SURFACE
      ?auto_13355 - PLACE
      ?auto_13366 - HOIST
      ?auto_13362 - SURFACE
      ?auto_13350 - SURFACE
      ?auto_13351 - SURFACE
      ?auto_13354 - SURFACE
      ?auto_13363 - SURFACE
      ?auto_13359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13358 ?auto_13360 ) ( IS-CRATE ?auto_13347 ) ( not ( = ?auto_13347 ?auto_13348 ) ) ( not ( = ?auto_13353 ?auto_13360 ) ) ( HOIST-AT ?auto_13361 ?auto_13353 ) ( not ( = ?auto_13358 ?auto_13361 ) ) ( AVAILABLE ?auto_13361 ) ( SURFACE-AT ?auto_13347 ?auto_13353 ) ( ON ?auto_13347 ?auto_13349 ) ( CLEAR ?auto_13347 ) ( not ( = ?auto_13347 ?auto_13349 ) ) ( not ( = ?auto_13348 ?auto_13349 ) ) ( IS-CRATE ?auto_13348 ) ( not ( = ?auto_13347 ?auto_13356 ) ) ( not ( = ?auto_13348 ?auto_13356 ) ) ( not ( = ?auto_13349 ?auto_13356 ) ) ( not ( = ?auto_13352 ?auto_13360 ) ) ( not ( = ?auto_13353 ?auto_13352 ) ) ( HOIST-AT ?auto_13357 ?auto_13352 ) ( not ( = ?auto_13358 ?auto_13357 ) ) ( not ( = ?auto_13361 ?auto_13357 ) ) ( SURFACE-AT ?auto_13348 ?auto_13352 ) ( ON ?auto_13348 ?auto_13365 ) ( CLEAR ?auto_13348 ) ( not ( = ?auto_13347 ?auto_13365 ) ) ( not ( = ?auto_13348 ?auto_13365 ) ) ( not ( = ?auto_13349 ?auto_13365 ) ) ( not ( = ?auto_13356 ?auto_13365 ) ) ( IS-CRATE ?auto_13356 ) ( not ( = ?auto_13347 ?auto_13364 ) ) ( not ( = ?auto_13348 ?auto_13364 ) ) ( not ( = ?auto_13349 ?auto_13364 ) ) ( not ( = ?auto_13356 ?auto_13364 ) ) ( not ( = ?auto_13365 ?auto_13364 ) ) ( not ( = ?auto_13355 ?auto_13360 ) ) ( not ( = ?auto_13353 ?auto_13355 ) ) ( not ( = ?auto_13352 ?auto_13355 ) ) ( HOIST-AT ?auto_13366 ?auto_13355 ) ( not ( = ?auto_13358 ?auto_13366 ) ) ( not ( = ?auto_13361 ?auto_13366 ) ) ( not ( = ?auto_13357 ?auto_13366 ) ) ( SURFACE-AT ?auto_13356 ?auto_13355 ) ( ON ?auto_13356 ?auto_13362 ) ( CLEAR ?auto_13356 ) ( not ( = ?auto_13347 ?auto_13362 ) ) ( not ( = ?auto_13348 ?auto_13362 ) ) ( not ( = ?auto_13349 ?auto_13362 ) ) ( not ( = ?auto_13356 ?auto_13362 ) ) ( not ( = ?auto_13365 ?auto_13362 ) ) ( not ( = ?auto_13364 ?auto_13362 ) ) ( IS-CRATE ?auto_13364 ) ( not ( = ?auto_13347 ?auto_13350 ) ) ( not ( = ?auto_13348 ?auto_13350 ) ) ( not ( = ?auto_13349 ?auto_13350 ) ) ( not ( = ?auto_13356 ?auto_13350 ) ) ( not ( = ?auto_13365 ?auto_13350 ) ) ( not ( = ?auto_13364 ?auto_13350 ) ) ( not ( = ?auto_13362 ?auto_13350 ) ) ( AVAILABLE ?auto_13366 ) ( SURFACE-AT ?auto_13364 ?auto_13355 ) ( ON ?auto_13364 ?auto_13351 ) ( CLEAR ?auto_13364 ) ( not ( = ?auto_13347 ?auto_13351 ) ) ( not ( = ?auto_13348 ?auto_13351 ) ) ( not ( = ?auto_13349 ?auto_13351 ) ) ( not ( = ?auto_13356 ?auto_13351 ) ) ( not ( = ?auto_13365 ?auto_13351 ) ) ( not ( = ?auto_13364 ?auto_13351 ) ) ( not ( = ?auto_13362 ?auto_13351 ) ) ( not ( = ?auto_13350 ?auto_13351 ) ) ( SURFACE-AT ?auto_13354 ?auto_13360 ) ( CLEAR ?auto_13354 ) ( IS-CRATE ?auto_13350 ) ( not ( = ?auto_13347 ?auto_13354 ) ) ( not ( = ?auto_13348 ?auto_13354 ) ) ( not ( = ?auto_13349 ?auto_13354 ) ) ( not ( = ?auto_13356 ?auto_13354 ) ) ( not ( = ?auto_13365 ?auto_13354 ) ) ( not ( = ?auto_13364 ?auto_13354 ) ) ( not ( = ?auto_13362 ?auto_13354 ) ) ( not ( = ?auto_13350 ?auto_13354 ) ) ( not ( = ?auto_13351 ?auto_13354 ) ) ( AVAILABLE ?auto_13358 ) ( AVAILABLE ?auto_13357 ) ( SURFACE-AT ?auto_13350 ?auto_13352 ) ( ON ?auto_13350 ?auto_13363 ) ( CLEAR ?auto_13350 ) ( not ( = ?auto_13347 ?auto_13363 ) ) ( not ( = ?auto_13348 ?auto_13363 ) ) ( not ( = ?auto_13349 ?auto_13363 ) ) ( not ( = ?auto_13356 ?auto_13363 ) ) ( not ( = ?auto_13365 ?auto_13363 ) ) ( not ( = ?auto_13364 ?auto_13363 ) ) ( not ( = ?auto_13362 ?auto_13363 ) ) ( not ( = ?auto_13350 ?auto_13363 ) ) ( not ( = ?auto_13351 ?auto_13363 ) ) ( not ( = ?auto_13354 ?auto_13363 ) ) ( TRUCK-AT ?auto_13359 ?auto_13360 ) )
    :subtasks
    ( ( !DRIVE ?auto_13359 ?auto_13360 ?auto_13352 )
      ( MAKE-ON ?auto_13347 ?auto_13348 )
      ( MAKE-ON-VERIFY ?auto_13347 ?auto_13348 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13367 - SURFACE
      ?auto_13368 - SURFACE
    )
    :vars
    (
      ?auto_13374 - HOIST
      ?auto_13370 - PLACE
      ?auto_13375 - PLACE
      ?auto_13369 - HOIST
      ?auto_13378 - SURFACE
      ?auto_13377 - SURFACE
      ?auto_13381 - PLACE
      ?auto_13373 - HOIST
      ?auto_13384 - SURFACE
      ?auto_13371 - SURFACE
      ?auto_13380 - PLACE
      ?auto_13383 - HOIST
      ?auto_13386 - SURFACE
      ?auto_13376 - SURFACE
      ?auto_13372 - SURFACE
      ?auto_13382 - SURFACE
      ?auto_13379 - SURFACE
      ?auto_13385 - TRUCK
      ?auto_13387 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13374 ?auto_13370 ) ( IS-CRATE ?auto_13367 ) ( not ( = ?auto_13367 ?auto_13368 ) ) ( not ( = ?auto_13375 ?auto_13370 ) ) ( HOIST-AT ?auto_13369 ?auto_13375 ) ( not ( = ?auto_13374 ?auto_13369 ) ) ( AVAILABLE ?auto_13369 ) ( SURFACE-AT ?auto_13367 ?auto_13375 ) ( ON ?auto_13367 ?auto_13378 ) ( CLEAR ?auto_13367 ) ( not ( = ?auto_13367 ?auto_13378 ) ) ( not ( = ?auto_13368 ?auto_13378 ) ) ( IS-CRATE ?auto_13368 ) ( not ( = ?auto_13367 ?auto_13377 ) ) ( not ( = ?auto_13368 ?auto_13377 ) ) ( not ( = ?auto_13378 ?auto_13377 ) ) ( not ( = ?auto_13381 ?auto_13370 ) ) ( not ( = ?auto_13375 ?auto_13381 ) ) ( HOIST-AT ?auto_13373 ?auto_13381 ) ( not ( = ?auto_13374 ?auto_13373 ) ) ( not ( = ?auto_13369 ?auto_13373 ) ) ( SURFACE-AT ?auto_13368 ?auto_13381 ) ( ON ?auto_13368 ?auto_13384 ) ( CLEAR ?auto_13368 ) ( not ( = ?auto_13367 ?auto_13384 ) ) ( not ( = ?auto_13368 ?auto_13384 ) ) ( not ( = ?auto_13378 ?auto_13384 ) ) ( not ( = ?auto_13377 ?auto_13384 ) ) ( IS-CRATE ?auto_13377 ) ( not ( = ?auto_13367 ?auto_13371 ) ) ( not ( = ?auto_13368 ?auto_13371 ) ) ( not ( = ?auto_13378 ?auto_13371 ) ) ( not ( = ?auto_13377 ?auto_13371 ) ) ( not ( = ?auto_13384 ?auto_13371 ) ) ( not ( = ?auto_13380 ?auto_13370 ) ) ( not ( = ?auto_13375 ?auto_13380 ) ) ( not ( = ?auto_13381 ?auto_13380 ) ) ( HOIST-AT ?auto_13383 ?auto_13380 ) ( not ( = ?auto_13374 ?auto_13383 ) ) ( not ( = ?auto_13369 ?auto_13383 ) ) ( not ( = ?auto_13373 ?auto_13383 ) ) ( SURFACE-AT ?auto_13377 ?auto_13380 ) ( ON ?auto_13377 ?auto_13386 ) ( CLEAR ?auto_13377 ) ( not ( = ?auto_13367 ?auto_13386 ) ) ( not ( = ?auto_13368 ?auto_13386 ) ) ( not ( = ?auto_13378 ?auto_13386 ) ) ( not ( = ?auto_13377 ?auto_13386 ) ) ( not ( = ?auto_13384 ?auto_13386 ) ) ( not ( = ?auto_13371 ?auto_13386 ) ) ( IS-CRATE ?auto_13371 ) ( not ( = ?auto_13367 ?auto_13376 ) ) ( not ( = ?auto_13368 ?auto_13376 ) ) ( not ( = ?auto_13378 ?auto_13376 ) ) ( not ( = ?auto_13377 ?auto_13376 ) ) ( not ( = ?auto_13384 ?auto_13376 ) ) ( not ( = ?auto_13371 ?auto_13376 ) ) ( not ( = ?auto_13386 ?auto_13376 ) ) ( AVAILABLE ?auto_13383 ) ( SURFACE-AT ?auto_13371 ?auto_13380 ) ( ON ?auto_13371 ?auto_13372 ) ( CLEAR ?auto_13371 ) ( not ( = ?auto_13367 ?auto_13372 ) ) ( not ( = ?auto_13368 ?auto_13372 ) ) ( not ( = ?auto_13378 ?auto_13372 ) ) ( not ( = ?auto_13377 ?auto_13372 ) ) ( not ( = ?auto_13384 ?auto_13372 ) ) ( not ( = ?auto_13371 ?auto_13372 ) ) ( not ( = ?auto_13386 ?auto_13372 ) ) ( not ( = ?auto_13376 ?auto_13372 ) ) ( IS-CRATE ?auto_13376 ) ( not ( = ?auto_13367 ?auto_13382 ) ) ( not ( = ?auto_13368 ?auto_13382 ) ) ( not ( = ?auto_13378 ?auto_13382 ) ) ( not ( = ?auto_13377 ?auto_13382 ) ) ( not ( = ?auto_13384 ?auto_13382 ) ) ( not ( = ?auto_13371 ?auto_13382 ) ) ( not ( = ?auto_13386 ?auto_13382 ) ) ( not ( = ?auto_13376 ?auto_13382 ) ) ( not ( = ?auto_13372 ?auto_13382 ) ) ( AVAILABLE ?auto_13373 ) ( SURFACE-AT ?auto_13376 ?auto_13381 ) ( ON ?auto_13376 ?auto_13379 ) ( CLEAR ?auto_13376 ) ( not ( = ?auto_13367 ?auto_13379 ) ) ( not ( = ?auto_13368 ?auto_13379 ) ) ( not ( = ?auto_13378 ?auto_13379 ) ) ( not ( = ?auto_13377 ?auto_13379 ) ) ( not ( = ?auto_13384 ?auto_13379 ) ) ( not ( = ?auto_13371 ?auto_13379 ) ) ( not ( = ?auto_13386 ?auto_13379 ) ) ( not ( = ?auto_13376 ?auto_13379 ) ) ( not ( = ?auto_13372 ?auto_13379 ) ) ( not ( = ?auto_13382 ?auto_13379 ) ) ( TRUCK-AT ?auto_13385 ?auto_13370 ) ( SURFACE-AT ?auto_13387 ?auto_13370 ) ( CLEAR ?auto_13387 ) ( LIFTING ?auto_13374 ?auto_13382 ) ( IS-CRATE ?auto_13382 ) ( not ( = ?auto_13367 ?auto_13387 ) ) ( not ( = ?auto_13368 ?auto_13387 ) ) ( not ( = ?auto_13378 ?auto_13387 ) ) ( not ( = ?auto_13377 ?auto_13387 ) ) ( not ( = ?auto_13384 ?auto_13387 ) ) ( not ( = ?auto_13371 ?auto_13387 ) ) ( not ( = ?auto_13386 ?auto_13387 ) ) ( not ( = ?auto_13376 ?auto_13387 ) ) ( not ( = ?auto_13372 ?auto_13387 ) ) ( not ( = ?auto_13382 ?auto_13387 ) ) ( not ( = ?auto_13379 ?auto_13387 ) ) )
    :subtasks
    ( ( !DROP ?auto_13374 ?auto_13382 ?auto_13387 ?auto_13370 )
      ( MAKE-ON ?auto_13367 ?auto_13368 )
      ( MAKE-ON-VERIFY ?auto_13367 ?auto_13368 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13388 - SURFACE
      ?auto_13389 - SURFACE
    )
    :vars
    (
      ?auto_13399 - HOIST
      ?auto_13396 - PLACE
      ?auto_13408 - PLACE
      ?auto_13394 - HOIST
      ?auto_13404 - SURFACE
      ?auto_13402 - SURFACE
      ?auto_13400 - PLACE
      ?auto_13393 - HOIST
      ?auto_13390 - SURFACE
      ?auto_13401 - SURFACE
      ?auto_13395 - PLACE
      ?auto_13407 - HOIST
      ?auto_13397 - SURFACE
      ?auto_13398 - SURFACE
      ?auto_13405 - SURFACE
      ?auto_13392 - SURFACE
      ?auto_13403 - SURFACE
      ?auto_13391 - TRUCK
      ?auto_13406 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13399 ?auto_13396 ) ( IS-CRATE ?auto_13388 ) ( not ( = ?auto_13388 ?auto_13389 ) ) ( not ( = ?auto_13408 ?auto_13396 ) ) ( HOIST-AT ?auto_13394 ?auto_13408 ) ( not ( = ?auto_13399 ?auto_13394 ) ) ( AVAILABLE ?auto_13394 ) ( SURFACE-AT ?auto_13388 ?auto_13408 ) ( ON ?auto_13388 ?auto_13404 ) ( CLEAR ?auto_13388 ) ( not ( = ?auto_13388 ?auto_13404 ) ) ( not ( = ?auto_13389 ?auto_13404 ) ) ( IS-CRATE ?auto_13389 ) ( not ( = ?auto_13388 ?auto_13402 ) ) ( not ( = ?auto_13389 ?auto_13402 ) ) ( not ( = ?auto_13404 ?auto_13402 ) ) ( not ( = ?auto_13400 ?auto_13396 ) ) ( not ( = ?auto_13408 ?auto_13400 ) ) ( HOIST-AT ?auto_13393 ?auto_13400 ) ( not ( = ?auto_13399 ?auto_13393 ) ) ( not ( = ?auto_13394 ?auto_13393 ) ) ( SURFACE-AT ?auto_13389 ?auto_13400 ) ( ON ?auto_13389 ?auto_13390 ) ( CLEAR ?auto_13389 ) ( not ( = ?auto_13388 ?auto_13390 ) ) ( not ( = ?auto_13389 ?auto_13390 ) ) ( not ( = ?auto_13404 ?auto_13390 ) ) ( not ( = ?auto_13402 ?auto_13390 ) ) ( IS-CRATE ?auto_13402 ) ( not ( = ?auto_13388 ?auto_13401 ) ) ( not ( = ?auto_13389 ?auto_13401 ) ) ( not ( = ?auto_13404 ?auto_13401 ) ) ( not ( = ?auto_13402 ?auto_13401 ) ) ( not ( = ?auto_13390 ?auto_13401 ) ) ( not ( = ?auto_13395 ?auto_13396 ) ) ( not ( = ?auto_13408 ?auto_13395 ) ) ( not ( = ?auto_13400 ?auto_13395 ) ) ( HOIST-AT ?auto_13407 ?auto_13395 ) ( not ( = ?auto_13399 ?auto_13407 ) ) ( not ( = ?auto_13394 ?auto_13407 ) ) ( not ( = ?auto_13393 ?auto_13407 ) ) ( SURFACE-AT ?auto_13402 ?auto_13395 ) ( ON ?auto_13402 ?auto_13397 ) ( CLEAR ?auto_13402 ) ( not ( = ?auto_13388 ?auto_13397 ) ) ( not ( = ?auto_13389 ?auto_13397 ) ) ( not ( = ?auto_13404 ?auto_13397 ) ) ( not ( = ?auto_13402 ?auto_13397 ) ) ( not ( = ?auto_13390 ?auto_13397 ) ) ( not ( = ?auto_13401 ?auto_13397 ) ) ( IS-CRATE ?auto_13401 ) ( not ( = ?auto_13388 ?auto_13398 ) ) ( not ( = ?auto_13389 ?auto_13398 ) ) ( not ( = ?auto_13404 ?auto_13398 ) ) ( not ( = ?auto_13402 ?auto_13398 ) ) ( not ( = ?auto_13390 ?auto_13398 ) ) ( not ( = ?auto_13401 ?auto_13398 ) ) ( not ( = ?auto_13397 ?auto_13398 ) ) ( AVAILABLE ?auto_13407 ) ( SURFACE-AT ?auto_13401 ?auto_13395 ) ( ON ?auto_13401 ?auto_13405 ) ( CLEAR ?auto_13401 ) ( not ( = ?auto_13388 ?auto_13405 ) ) ( not ( = ?auto_13389 ?auto_13405 ) ) ( not ( = ?auto_13404 ?auto_13405 ) ) ( not ( = ?auto_13402 ?auto_13405 ) ) ( not ( = ?auto_13390 ?auto_13405 ) ) ( not ( = ?auto_13401 ?auto_13405 ) ) ( not ( = ?auto_13397 ?auto_13405 ) ) ( not ( = ?auto_13398 ?auto_13405 ) ) ( IS-CRATE ?auto_13398 ) ( not ( = ?auto_13388 ?auto_13392 ) ) ( not ( = ?auto_13389 ?auto_13392 ) ) ( not ( = ?auto_13404 ?auto_13392 ) ) ( not ( = ?auto_13402 ?auto_13392 ) ) ( not ( = ?auto_13390 ?auto_13392 ) ) ( not ( = ?auto_13401 ?auto_13392 ) ) ( not ( = ?auto_13397 ?auto_13392 ) ) ( not ( = ?auto_13398 ?auto_13392 ) ) ( not ( = ?auto_13405 ?auto_13392 ) ) ( AVAILABLE ?auto_13393 ) ( SURFACE-AT ?auto_13398 ?auto_13400 ) ( ON ?auto_13398 ?auto_13403 ) ( CLEAR ?auto_13398 ) ( not ( = ?auto_13388 ?auto_13403 ) ) ( not ( = ?auto_13389 ?auto_13403 ) ) ( not ( = ?auto_13404 ?auto_13403 ) ) ( not ( = ?auto_13402 ?auto_13403 ) ) ( not ( = ?auto_13390 ?auto_13403 ) ) ( not ( = ?auto_13401 ?auto_13403 ) ) ( not ( = ?auto_13397 ?auto_13403 ) ) ( not ( = ?auto_13398 ?auto_13403 ) ) ( not ( = ?auto_13405 ?auto_13403 ) ) ( not ( = ?auto_13392 ?auto_13403 ) ) ( TRUCK-AT ?auto_13391 ?auto_13396 ) ( SURFACE-AT ?auto_13406 ?auto_13396 ) ( CLEAR ?auto_13406 ) ( IS-CRATE ?auto_13392 ) ( not ( = ?auto_13388 ?auto_13406 ) ) ( not ( = ?auto_13389 ?auto_13406 ) ) ( not ( = ?auto_13404 ?auto_13406 ) ) ( not ( = ?auto_13402 ?auto_13406 ) ) ( not ( = ?auto_13390 ?auto_13406 ) ) ( not ( = ?auto_13401 ?auto_13406 ) ) ( not ( = ?auto_13397 ?auto_13406 ) ) ( not ( = ?auto_13398 ?auto_13406 ) ) ( not ( = ?auto_13405 ?auto_13406 ) ) ( not ( = ?auto_13392 ?auto_13406 ) ) ( not ( = ?auto_13403 ?auto_13406 ) ) ( AVAILABLE ?auto_13399 ) ( IN ?auto_13392 ?auto_13391 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13399 ?auto_13392 ?auto_13391 ?auto_13396 )
      ( MAKE-ON ?auto_13388 ?auto_13389 )
      ( MAKE-ON-VERIFY ?auto_13388 ?auto_13389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13409 - SURFACE
      ?auto_13410 - SURFACE
    )
    :vars
    (
      ?auto_13417 - HOIST
      ?auto_13424 - PLACE
      ?auto_13418 - PLACE
      ?auto_13413 - HOIST
      ?auto_13428 - SURFACE
      ?auto_13429 - SURFACE
      ?auto_13414 - PLACE
      ?auto_13427 - HOIST
      ?auto_13411 - SURFACE
      ?auto_13422 - SURFACE
      ?auto_13412 - PLACE
      ?auto_13420 - HOIST
      ?auto_13421 - SURFACE
      ?auto_13425 - SURFACE
      ?auto_13426 - SURFACE
      ?auto_13415 - SURFACE
      ?auto_13423 - SURFACE
      ?auto_13419 - SURFACE
      ?auto_13416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13417 ?auto_13424 ) ( IS-CRATE ?auto_13409 ) ( not ( = ?auto_13409 ?auto_13410 ) ) ( not ( = ?auto_13418 ?auto_13424 ) ) ( HOIST-AT ?auto_13413 ?auto_13418 ) ( not ( = ?auto_13417 ?auto_13413 ) ) ( AVAILABLE ?auto_13413 ) ( SURFACE-AT ?auto_13409 ?auto_13418 ) ( ON ?auto_13409 ?auto_13428 ) ( CLEAR ?auto_13409 ) ( not ( = ?auto_13409 ?auto_13428 ) ) ( not ( = ?auto_13410 ?auto_13428 ) ) ( IS-CRATE ?auto_13410 ) ( not ( = ?auto_13409 ?auto_13429 ) ) ( not ( = ?auto_13410 ?auto_13429 ) ) ( not ( = ?auto_13428 ?auto_13429 ) ) ( not ( = ?auto_13414 ?auto_13424 ) ) ( not ( = ?auto_13418 ?auto_13414 ) ) ( HOIST-AT ?auto_13427 ?auto_13414 ) ( not ( = ?auto_13417 ?auto_13427 ) ) ( not ( = ?auto_13413 ?auto_13427 ) ) ( SURFACE-AT ?auto_13410 ?auto_13414 ) ( ON ?auto_13410 ?auto_13411 ) ( CLEAR ?auto_13410 ) ( not ( = ?auto_13409 ?auto_13411 ) ) ( not ( = ?auto_13410 ?auto_13411 ) ) ( not ( = ?auto_13428 ?auto_13411 ) ) ( not ( = ?auto_13429 ?auto_13411 ) ) ( IS-CRATE ?auto_13429 ) ( not ( = ?auto_13409 ?auto_13422 ) ) ( not ( = ?auto_13410 ?auto_13422 ) ) ( not ( = ?auto_13428 ?auto_13422 ) ) ( not ( = ?auto_13429 ?auto_13422 ) ) ( not ( = ?auto_13411 ?auto_13422 ) ) ( not ( = ?auto_13412 ?auto_13424 ) ) ( not ( = ?auto_13418 ?auto_13412 ) ) ( not ( = ?auto_13414 ?auto_13412 ) ) ( HOIST-AT ?auto_13420 ?auto_13412 ) ( not ( = ?auto_13417 ?auto_13420 ) ) ( not ( = ?auto_13413 ?auto_13420 ) ) ( not ( = ?auto_13427 ?auto_13420 ) ) ( SURFACE-AT ?auto_13429 ?auto_13412 ) ( ON ?auto_13429 ?auto_13421 ) ( CLEAR ?auto_13429 ) ( not ( = ?auto_13409 ?auto_13421 ) ) ( not ( = ?auto_13410 ?auto_13421 ) ) ( not ( = ?auto_13428 ?auto_13421 ) ) ( not ( = ?auto_13429 ?auto_13421 ) ) ( not ( = ?auto_13411 ?auto_13421 ) ) ( not ( = ?auto_13422 ?auto_13421 ) ) ( IS-CRATE ?auto_13422 ) ( not ( = ?auto_13409 ?auto_13425 ) ) ( not ( = ?auto_13410 ?auto_13425 ) ) ( not ( = ?auto_13428 ?auto_13425 ) ) ( not ( = ?auto_13429 ?auto_13425 ) ) ( not ( = ?auto_13411 ?auto_13425 ) ) ( not ( = ?auto_13422 ?auto_13425 ) ) ( not ( = ?auto_13421 ?auto_13425 ) ) ( AVAILABLE ?auto_13420 ) ( SURFACE-AT ?auto_13422 ?auto_13412 ) ( ON ?auto_13422 ?auto_13426 ) ( CLEAR ?auto_13422 ) ( not ( = ?auto_13409 ?auto_13426 ) ) ( not ( = ?auto_13410 ?auto_13426 ) ) ( not ( = ?auto_13428 ?auto_13426 ) ) ( not ( = ?auto_13429 ?auto_13426 ) ) ( not ( = ?auto_13411 ?auto_13426 ) ) ( not ( = ?auto_13422 ?auto_13426 ) ) ( not ( = ?auto_13421 ?auto_13426 ) ) ( not ( = ?auto_13425 ?auto_13426 ) ) ( IS-CRATE ?auto_13425 ) ( not ( = ?auto_13409 ?auto_13415 ) ) ( not ( = ?auto_13410 ?auto_13415 ) ) ( not ( = ?auto_13428 ?auto_13415 ) ) ( not ( = ?auto_13429 ?auto_13415 ) ) ( not ( = ?auto_13411 ?auto_13415 ) ) ( not ( = ?auto_13422 ?auto_13415 ) ) ( not ( = ?auto_13421 ?auto_13415 ) ) ( not ( = ?auto_13425 ?auto_13415 ) ) ( not ( = ?auto_13426 ?auto_13415 ) ) ( AVAILABLE ?auto_13427 ) ( SURFACE-AT ?auto_13425 ?auto_13414 ) ( ON ?auto_13425 ?auto_13423 ) ( CLEAR ?auto_13425 ) ( not ( = ?auto_13409 ?auto_13423 ) ) ( not ( = ?auto_13410 ?auto_13423 ) ) ( not ( = ?auto_13428 ?auto_13423 ) ) ( not ( = ?auto_13429 ?auto_13423 ) ) ( not ( = ?auto_13411 ?auto_13423 ) ) ( not ( = ?auto_13422 ?auto_13423 ) ) ( not ( = ?auto_13421 ?auto_13423 ) ) ( not ( = ?auto_13425 ?auto_13423 ) ) ( not ( = ?auto_13426 ?auto_13423 ) ) ( not ( = ?auto_13415 ?auto_13423 ) ) ( SURFACE-AT ?auto_13419 ?auto_13424 ) ( CLEAR ?auto_13419 ) ( IS-CRATE ?auto_13415 ) ( not ( = ?auto_13409 ?auto_13419 ) ) ( not ( = ?auto_13410 ?auto_13419 ) ) ( not ( = ?auto_13428 ?auto_13419 ) ) ( not ( = ?auto_13429 ?auto_13419 ) ) ( not ( = ?auto_13411 ?auto_13419 ) ) ( not ( = ?auto_13422 ?auto_13419 ) ) ( not ( = ?auto_13421 ?auto_13419 ) ) ( not ( = ?auto_13425 ?auto_13419 ) ) ( not ( = ?auto_13426 ?auto_13419 ) ) ( not ( = ?auto_13415 ?auto_13419 ) ) ( not ( = ?auto_13423 ?auto_13419 ) ) ( AVAILABLE ?auto_13417 ) ( IN ?auto_13415 ?auto_13416 ) ( TRUCK-AT ?auto_13416 ?auto_13412 ) )
    :subtasks
    ( ( !DRIVE ?auto_13416 ?auto_13412 ?auto_13424 )
      ( MAKE-ON ?auto_13409 ?auto_13410 )
      ( MAKE-ON-VERIFY ?auto_13409 ?auto_13410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13430 - SURFACE
      ?auto_13431 - SURFACE
    )
    :vars
    (
      ?auto_13440 - HOIST
      ?auto_13441 - PLACE
      ?auto_13436 - PLACE
      ?auto_13448 - HOIST
      ?auto_13439 - SURFACE
      ?auto_13438 - SURFACE
      ?auto_13433 - PLACE
      ?auto_13434 - HOIST
      ?auto_13450 - SURFACE
      ?auto_13446 - SURFACE
      ?auto_13435 - PLACE
      ?auto_13444 - HOIST
      ?auto_13443 - SURFACE
      ?auto_13432 - SURFACE
      ?auto_13445 - SURFACE
      ?auto_13442 - SURFACE
      ?auto_13447 - SURFACE
      ?auto_13449 - SURFACE
      ?auto_13437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13440 ?auto_13441 ) ( IS-CRATE ?auto_13430 ) ( not ( = ?auto_13430 ?auto_13431 ) ) ( not ( = ?auto_13436 ?auto_13441 ) ) ( HOIST-AT ?auto_13448 ?auto_13436 ) ( not ( = ?auto_13440 ?auto_13448 ) ) ( AVAILABLE ?auto_13448 ) ( SURFACE-AT ?auto_13430 ?auto_13436 ) ( ON ?auto_13430 ?auto_13439 ) ( CLEAR ?auto_13430 ) ( not ( = ?auto_13430 ?auto_13439 ) ) ( not ( = ?auto_13431 ?auto_13439 ) ) ( IS-CRATE ?auto_13431 ) ( not ( = ?auto_13430 ?auto_13438 ) ) ( not ( = ?auto_13431 ?auto_13438 ) ) ( not ( = ?auto_13439 ?auto_13438 ) ) ( not ( = ?auto_13433 ?auto_13441 ) ) ( not ( = ?auto_13436 ?auto_13433 ) ) ( HOIST-AT ?auto_13434 ?auto_13433 ) ( not ( = ?auto_13440 ?auto_13434 ) ) ( not ( = ?auto_13448 ?auto_13434 ) ) ( SURFACE-AT ?auto_13431 ?auto_13433 ) ( ON ?auto_13431 ?auto_13450 ) ( CLEAR ?auto_13431 ) ( not ( = ?auto_13430 ?auto_13450 ) ) ( not ( = ?auto_13431 ?auto_13450 ) ) ( not ( = ?auto_13439 ?auto_13450 ) ) ( not ( = ?auto_13438 ?auto_13450 ) ) ( IS-CRATE ?auto_13438 ) ( not ( = ?auto_13430 ?auto_13446 ) ) ( not ( = ?auto_13431 ?auto_13446 ) ) ( not ( = ?auto_13439 ?auto_13446 ) ) ( not ( = ?auto_13438 ?auto_13446 ) ) ( not ( = ?auto_13450 ?auto_13446 ) ) ( not ( = ?auto_13435 ?auto_13441 ) ) ( not ( = ?auto_13436 ?auto_13435 ) ) ( not ( = ?auto_13433 ?auto_13435 ) ) ( HOIST-AT ?auto_13444 ?auto_13435 ) ( not ( = ?auto_13440 ?auto_13444 ) ) ( not ( = ?auto_13448 ?auto_13444 ) ) ( not ( = ?auto_13434 ?auto_13444 ) ) ( SURFACE-AT ?auto_13438 ?auto_13435 ) ( ON ?auto_13438 ?auto_13443 ) ( CLEAR ?auto_13438 ) ( not ( = ?auto_13430 ?auto_13443 ) ) ( not ( = ?auto_13431 ?auto_13443 ) ) ( not ( = ?auto_13439 ?auto_13443 ) ) ( not ( = ?auto_13438 ?auto_13443 ) ) ( not ( = ?auto_13450 ?auto_13443 ) ) ( not ( = ?auto_13446 ?auto_13443 ) ) ( IS-CRATE ?auto_13446 ) ( not ( = ?auto_13430 ?auto_13432 ) ) ( not ( = ?auto_13431 ?auto_13432 ) ) ( not ( = ?auto_13439 ?auto_13432 ) ) ( not ( = ?auto_13438 ?auto_13432 ) ) ( not ( = ?auto_13450 ?auto_13432 ) ) ( not ( = ?auto_13446 ?auto_13432 ) ) ( not ( = ?auto_13443 ?auto_13432 ) ) ( SURFACE-AT ?auto_13446 ?auto_13435 ) ( ON ?auto_13446 ?auto_13445 ) ( CLEAR ?auto_13446 ) ( not ( = ?auto_13430 ?auto_13445 ) ) ( not ( = ?auto_13431 ?auto_13445 ) ) ( not ( = ?auto_13439 ?auto_13445 ) ) ( not ( = ?auto_13438 ?auto_13445 ) ) ( not ( = ?auto_13450 ?auto_13445 ) ) ( not ( = ?auto_13446 ?auto_13445 ) ) ( not ( = ?auto_13443 ?auto_13445 ) ) ( not ( = ?auto_13432 ?auto_13445 ) ) ( IS-CRATE ?auto_13432 ) ( not ( = ?auto_13430 ?auto_13442 ) ) ( not ( = ?auto_13431 ?auto_13442 ) ) ( not ( = ?auto_13439 ?auto_13442 ) ) ( not ( = ?auto_13438 ?auto_13442 ) ) ( not ( = ?auto_13450 ?auto_13442 ) ) ( not ( = ?auto_13446 ?auto_13442 ) ) ( not ( = ?auto_13443 ?auto_13442 ) ) ( not ( = ?auto_13432 ?auto_13442 ) ) ( not ( = ?auto_13445 ?auto_13442 ) ) ( AVAILABLE ?auto_13434 ) ( SURFACE-AT ?auto_13432 ?auto_13433 ) ( ON ?auto_13432 ?auto_13447 ) ( CLEAR ?auto_13432 ) ( not ( = ?auto_13430 ?auto_13447 ) ) ( not ( = ?auto_13431 ?auto_13447 ) ) ( not ( = ?auto_13439 ?auto_13447 ) ) ( not ( = ?auto_13438 ?auto_13447 ) ) ( not ( = ?auto_13450 ?auto_13447 ) ) ( not ( = ?auto_13446 ?auto_13447 ) ) ( not ( = ?auto_13443 ?auto_13447 ) ) ( not ( = ?auto_13432 ?auto_13447 ) ) ( not ( = ?auto_13445 ?auto_13447 ) ) ( not ( = ?auto_13442 ?auto_13447 ) ) ( SURFACE-AT ?auto_13449 ?auto_13441 ) ( CLEAR ?auto_13449 ) ( IS-CRATE ?auto_13442 ) ( not ( = ?auto_13430 ?auto_13449 ) ) ( not ( = ?auto_13431 ?auto_13449 ) ) ( not ( = ?auto_13439 ?auto_13449 ) ) ( not ( = ?auto_13438 ?auto_13449 ) ) ( not ( = ?auto_13450 ?auto_13449 ) ) ( not ( = ?auto_13446 ?auto_13449 ) ) ( not ( = ?auto_13443 ?auto_13449 ) ) ( not ( = ?auto_13432 ?auto_13449 ) ) ( not ( = ?auto_13445 ?auto_13449 ) ) ( not ( = ?auto_13442 ?auto_13449 ) ) ( not ( = ?auto_13447 ?auto_13449 ) ) ( AVAILABLE ?auto_13440 ) ( TRUCK-AT ?auto_13437 ?auto_13435 ) ( LIFTING ?auto_13444 ?auto_13442 ) )
    :subtasks
    ( ( !LOAD ?auto_13444 ?auto_13442 ?auto_13437 ?auto_13435 )
      ( MAKE-ON ?auto_13430 ?auto_13431 )
      ( MAKE-ON-VERIFY ?auto_13430 ?auto_13431 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13451 - SURFACE
      ?auto_13452 - SURFACE
    )
    :vars
    (
      ?auto_13461 - HOIST
      ?auto_13464 - PLACE
      ?auto_13467 - PLACE
      ?auto_13454 - HOIST
      ?auto_13460 - SURFACE
      ?auto_13462 - SURFACE
      ?auto_13458 - PLACE
      ?auto_13459 - HOIST
      ?auto_13471 - SURFACE
      ?auto_13466 - SURFACE
      ?auto_13456 - PLACE
      ?auto_13468 - HOIST
      ?auto_13469 - SURFACE
      ?auto_13465 - SURFACE
      ?auto_13463 - SURFACE
      ?auto_13470 - SURFACE
      ?auto_13455 - SURFACE
      ?auto_13457 - SURFACE
      ?auto_13453 - TRUCK
      ?auto_13472 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13461 ?auto_13464 ) ( IS-CRATE ?auto_13451 ) ( not ( = ?auto_13451 ?auto_13452 ) ) ( not ( = ?auto_13467 ?auto_13464 ) ) ( HOIST-AT ?auto_13454 ?auto_13467 ) ( not ( = ?auto_13461 ?auto_13454 ) ) ( AVAILABLE ?auto_13454 ) ( SURFACE-AT ?auto_13451 ?auto_13467 ) ( ON ?auto_13451 ?auto_13460 ) ( CLEAR ?auto_13451 ) ( not ( = ?auto_13451 ?auto_13460 ) ) ( not ( = ?auto_13452 ?auto_13460 ) ) ( IS-CRATE ?auto_13452 ) ( not ( = ?auto_13451 ?auto_13462 ) ) ( not ( = ?auto_13452 ?auto_13462 ) ) ( not ( = ?auto_13460 ?auto_13462 ) ) ( not ( = ?auto_13458 ?auto_13464 ) ) ( not ( = ?auto_13467 ?auto_13458 ) ) ( HOIST-AT ?auto_13459 ?auto_13458 ) ( not ( = ?auto_13461 ?auto_13459 ) ) ( not ( = ?auto_13454 ?auto_13459 ) ) ( SURFACE-AT ?auto_13452 ?auto_13458 ) ( ON ?auto_13452 ?auto_13471 ) ( CLEAR ?auto_13452 ) ( not ( = ?auto_13451 ?auto_13471 ) ) ( not ( = ?auto_13452 ?auto_13471 ) ) ( not ( = ?auto_13460 ?auto_13471 ) ) ( not ( = ?auto_13462 ?auto_13471 ) ) ( IS-CRATE ?auto_13462 ) ( not ( = ?auto_13451 ?auto_13466 ) ) ( not ( = ?auto_13452 ?auto_13466 ) ) ( not ( = ?auto_13460 ?auto_13466 ) ) ( not ( = ?auto_13462 ?auto_13466 ) ) ( not ( = ?auto_13471 ?auto_13466 ) ) ( not ( = ?auto_13456 ?auto_13464 ) ) ( not ( = ?auto_13467 ?auto_13456 ) ) ( not ( = ?auto_13458 ?auto_13456 ) ) ( HOIST-AT ?auto_13468 ?auto_13456 ) ( not ( = ?auto_13461 ?auto_13468 ) ) ( not ( = ?auto_13454 ?auto_13468 ) ) ( not ( = ?auto_13459 ?auto_13468 ) ) ( SURFACE-AT ?auto_13462 ?auto_13456 ) ( ON ?auto_13462 ?auto_13469 ) ( CLEAR ?auto_13462 ) ( not ( = ?auto_13451 ?auto_13469 ) ) ( not ( = ?auto_13452 ?auto_13469 ) ) ( not ( = ?auto_13460 ?auto_13469 ) ) ( not ( = ?auto_13462 ?auto_13469 ) ) ( not ( = ?auto_13471 ?auto_13469 ) ) ( not ( = ?auto_13466 ?auto_13469 ) ) ( IS-CRATE ?auto_13466 ) ( not ( = ?auto_13451 ?auto_13465 ) ) ( not ( = ?auto_13452 ?auto_13465 ) ) ( not ( = ?auto_13460 ?auto_13465 ) ) ( not ( = ?auto_13462 ?auto_13465 ) ) ( not ( = ?auto_13471 ?auto_13465 ) ) ( not ( = ?auto_13466 ?auto_13465 ) ) ( not ( = ?auto_13469 ?auto_13465 ) ) ( SURFACE-AT ?auto_13466 ?auto_13456 ) ( ON ?auto_13466 ?auto_13463 ) ( CLEAR ?auto_13466 ) ( not ( = ?auto_13451 ?auto_13463 ) ) ( not ( = ?auto_13452 ?auto_13463 ) ) ( not ( = ?auto_13460 ?auto_13463 ) ) ( not ( = ?auto_13462 ?auto_13463 ) ) ( not ( = ?auto_13471 ?auto_13463 ) ) ( not ( = ?auto_13466 ?auto_13463 ) ) ( not ( = ?auto_13469 ?auto_13463 ) ) ( not ( = ?auto_13465 ?auto_13463 ) ) ( IS-CRATE ?auto_13465 ) ( not ( = ?auto_13451 ?auto_13470 ) ) ( not ( = ?auto_13452 ?auto_13470 ) ) ( not ( = ?auto_13460 ?auto_13470 ) ) ( not ( = ?auto_13462 ?auto_13470 ) ) ( not ( = ?auto_13471 ?auto_13470 ) ) ( not ( = ?auto_13466 ?auto_13470 ) ) ( not ( = ?auto_13469 ?auto_13470 ) ) ( not ( = ?auto_13465 ?auto_13470 ) ) ( not ( = ?auto_13463 ?auto_13470 ) ) ( AVAILABLE ?auto_13459 ) ( SURFACE-AT ?auto_13465 ?auto_13458 ) ( ON ?auto_13465 ?auto_13455 ) ( CLEAR ?auto_13465 ) ( not ( = ?auto_13451 ?auto_13455 ) ) ( not ( = ?auto_13452 ?auto_13455 ) ) ( not ( = ?auto_13460 ?auto_13455 ) ) ( not ( = ?auto_13462 ?auto_13455 ) ) ( not ( = ?auto_13471 ?auto_13455 ) ) ( not ( = ?auto_13466 ?auto_13455 ) ) ( not ( = ?auto_13469 ?auto_13455 ) ) ( not ( = ?auto_13465 ?auto_13455 ) ) ( not ( = ?auto_13463 ?auto_13455 ) ) ( not ( = ?auto_13470 ?auto_13455 ) ) ( SURFACE-AT ?auto_13457 ?auto_13464 ) ( CLEAR ?auto_13457 ) ( IS-CRATE ?auto_13470 ) ( not ( = ?auto_13451 ?auto_13457 ) ) ( not ( = ?auto_13452 ?auto_13457 ) ) ( not ( = ?auto_13460 ?auto_13457 ) ) ( not ( = ?auto_13462 ?auto_13457 ) ) ( not ( = ?auto_13471 ?auto_13457 ) ) ( not ( = ?auto_13466 ?auto_13457 ) ) ( not ( = ?auto_13469 ?auto_13457 ) ) ( not ( = ?auto_13465 ?auto_13457 ) ) ( not ( = ?auto_13463 ?auto_13457 ) ) ( not ( = ?auto_13470 ?auto_13457 ) ) ( not ( = ?auto_13455 ?auto_13457 ) ) ( AVAILABLE ?auto_13461 ) ( TRUCK-AT ?auto_13453 ?auto_13456 ) ( AVAILABLE ?auto_13468 ) ( SURFACE-AT ?auto_13470 ?auto_13456 ) ( ON ?auto_13470 ?auto_13472 ) ( CLEAR ?auto_13470 ) ( not ( = ?auto_13451 ?auto_13472 ) ) ( not ( = ?auto_13452 ?auto_13472 ) ) ( not ( = ?auto_13460 ?auto_13472 ) ) ( not ( = ?auto_13462 ?auto_13472 ) ) ( not ( = ?auto_13471 ?auto_13472 ) ) ( not ( = ?auto_13466 ?auto_13472 ) ) ( not ( = ?auto_13469 ?auto_13472 ) ) ( not ( = ?auto_13465 ?auto_13472 ) ) ( not ( = ?auto_13463 ?auto_13472 ) ) ( not ( = ?auto_13470 ?auto_13472 ) ) ( not ( = ?auto_13455 ?auto_13472 ) ) ( not ( = ?auto_13457 ?auto_13472 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13468 ?auto_13470 ?auto_13472 ?auto_13456 )
      ( MAKE-ON ?auto_13451 ?auto_13452 )
      ( MAKE-ON-VERIFY ?auto_13451 ?auto_13452 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_13473 - SURFACE
      ?auto_13474 - SURFACE
    )
    :vars
    (
      ?auto_13483 - HOIST
      ?auto_13480 - PLACE
      ?auto_13486 - PLACE
      ?auto_13484 - HOIST
      ?auto_13482 - SURFACE
      ?auto_13493 - SURFACE
      ?auto_13476 - PLACE
      ?auto_13487 - HOIST
      ?auto_13490 - SURFACE
      ?auto_13481 - SURFACE
      ?auto_13478 - PLACE
      ?auto_13491 - HOIST
      ?auto_13488 - SURFACE
      ?auto_13479 - SURFACE
      ?auto_13494 - SURFACE
      ?auto_13489 - SURFACE
      ?auto_13477 - SURFACE
      ?auto_13475 - SURFACE
      ?auto_13485 - SURFACE
      ?auto_13492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13483 ?auto_13480 ) ( IS-CRATE ?auto_13473 ) ( not ( = ?auto_13473 ?auto_13474 ) ) ( not ( = ?auto_13486 ?auto_13480 ) ) ( HOIST-AT ?auto_13484 ?auto_13486 ) ( not ( = ?auto_13483 ?auto_13484 ) ) ( AVAILABLE ?auto_13484 ) ( SURFACE-AT ?auto_13473 ?auto_13486 ) ( ON ?auto_13473 ?auto_13482 ) ( CLEAR ?auto_13473 ) ( not ( = ?auto_13473 ?auto_13482 ) ) ( not ( = ?auto_13474 ?auto_13482 ) ) ( IS-CRATE ?auto_13474 ) ( not ( = ?auto_13473 ?auto_13493 ) ) ( not ( = ?auto_13474 ?auto_13493 ) ) ( not ( = ?auto_13482 ?auto_13493 ) ) ( not ( = ?auto_13476 ?auto_13480 ) ) ( not ( = ?auto_13486 ?auto_13476 ) ) ( HOIST-AT ?auto_13487 ?auto_13476 ) ( not ( = ?auto_13483 ?auto_13487 ) ) ( not ( = ?auto_13484 ?auto_13487 ) ) ( SURFACE-AT ?auto_13474 ?auto_13476 ) ( ON ?auto_13474 ?auto_13490 ) ( CLEAR ?auto_13474 ) ( not ( = ?auto_13473 ?auto_13490 ) ) ( not ( = ?auto_13474 ?auto_13490 ) ) ( not ( = ?auto_13482 ?auto_13490 ) ) ( not ( = ?auto_13493 ?auto_13490 ) ) ( IS-CRATE ?auto_13493 ) ( not ( = ?auto_13473 ?auto_13481 ) ) ( not ( = ?auto_13474 ?auto_13481 ) ) ( not ( = ?auto_13482 ?auto_13481 ) ) ( not ( = ?auto_13493 ?auto_13481 ) ) ( not ( = ?auto_13490 ?auto_13481 ) ) ( not ( = ?auto_13478 ?auto_13480 ) ) ( not ( = ?auto_13486 ?auto_13478 ) ) ( not ( = ?auto_13476 ?auto_13478 ) ) ( HOIST-AT ?auto_13491 ?auto_13478 ) ( not ( = ?auto_13483 ?auto_13491 ) ) ( not ( = ?auto_13484 ?auto_13491 ) ) ( not ( = ?auto_13487 ?auto_13491 ) ) ( SURFACE-AT ?auto_13493 ?auto_13478 ) ( ON ?auto_13493 ?auto_13488 ) ( CLEAR ?auto_13493 ) ( not ( = ?auto_13473 ?auto_13488 ) ) ( not ( = ?auto_13474 ?auto_13488 ) ) ( not ( = ?auto_13482 ?auto_13488 ) ) ( not ( = ?auto_13493 ?auto_13488 ) ) ( not ( = ?auto_13490 ?auto_13488 ) ) ( not ( = ?auto_13481 ?auto_13488 ) ) ( IS-CRATE ?auto_13481 ) ( not ( = ?auto_13473 ?auto_13479 ) ) ( not ( = ?auto_13474 ?auto_13479 ) ) ( not ( = ?auto_13482 ?auto_13479 ) ) ( not ( = ?auto_13493 ?auto_13479 ) ) ( not ( = ?auto_13490 ?auto_13479 ) ) ( not ( = ?auto_13481 ?auto_13479 ) ) ( not ( = ?auto_13488 ?auto_13479 ) ) ( SURFACE-AT ?auto_13481 ?auto_13478 ) ( ON ?auto_13481 ?auto_13494 ) ( CLEAR ?auto_13481 ) ( not ( = ?auto_13473 ?auto_13494 ) ) ( not ( = ?auto_13474 ?auto_13494 ) ) ( not ( = ?auto_13482 ?auto_13494 ) ) ( not ( = ?auto_13493 ?auto_13494 ) ) ( not ( = ?auto_13490 ?auto_13494 ) ) ( not ( = ?auto_13481 ?auto_13494 ) ) ( not ( = ?auto_13488 ?auto_13494 ) ) ( not ( = ?auto_13479 ?auto_13494 ) ) ( IS-CRATE ?auto_13479 ) ( not ( = ?auto_13473 ?auto_13489 ) ) ( not ( = ?auto_13474 ?auto_13489 ) ) ( not ( = ?auto_13482 ?auto_13489 ) ) ( not ( = ?auto_13493 ?auto_13489 ) ) ( not ( = ?auto_13490 ?auto_13489 ) ) ( not ( = ?auto_13481 ?auto_13489 ) ) ( not ( = ?auto_13488 ?auto_13489 ) ) ( not ( = ?auto_13479 ?auto_13489 ) ) ( not ( = ?auto_13494 ?auto_13489 ) ) ( AVAILABLE ?auto_13487 ) ( SURFACE-AT ?auto_13479 ?auto_13476 ) ( ON ?auto_13479 ?auto_13477 ) ( CLEAR ?auto_13479 ) ( not ( = ?auto_13473 ?auto_13477 ) ) ( not ( = ?auto_13474 ?auto_13477 ) ) ( not ( = ?auto_13482 ?auto_13477 ) ) ( not ( = ?auto_13493 ?auto_13477 ) ) ( not ( = ?auto_13490 ?auto_13477 ) ) ( not ( = ?auto_13481 ?auto_13477 ) ) ( not ( = ?auto_13488 ?auto_13477 ) ) ( not ( = ?auto_13479 ?auto_13477 ) ) ( not ( = ?auto_13494 ?auto_13477 ) ) ( not ( = ?auto_13489 ?auto_13477 ) ) ( SURFACE-AT ?auto_13475 ?auto_13480 ) ( CLEAR ?auto_13475 ) ( IS-CRATE ?auto_13489 ) ( not ( = ?auto_13473 ?auto_13475 ) ) ( not ( = ?auto_13474 ?auto_13475 ) ) ( not ( = ?auto_13482 ?auto_13475 ) ) ( not ( = ?auto_13493 ?auto_13475 ) ) ( not ( = ?auto_13490 ?auto_13475 ) ) ( not ( = ?auto_13481 ?auto_13475 ) ) ( not ( = ?auto_13488 ?auto_13475 ) ) ( not ( = ?auto_13479 ?auto_13475 ) ) ( not ( = ?auto_13494 ?auto_13475 ) ) ( not ( = ?auto_13489 ?auto_13475 ) ) ( not ( = ?auto_13477 ?auto_13475 ) ) ( AVAILABLE ?auto_13483 ) ( AVAILABLE ?auto_13491 ) ( SURFACE-AT ?auto_13489 ?auto_13478 ) ( ON ?auto_13489 ?auto_13485 ) ( CLEAR ?auto_13489 ) ( not ( = ?auto_13473 ?auto_13485 ) ) ( not ( = ?auto_13474 ?auto_13485 ) ) ( not ( = ?auto_13482 ?auto_13485 ) ) ( not ( = ?auto_13493 ?auto_13485 ) ) ( not ( = ?auto_13490 ?auto_13485 ) ) ( not ( = ?auto_13481 ?auto_13485 ) ) ( not ( = ?auto_13488 ?auto_13485 ) ) ( not ( = ?auto_13479 ?auto_13485 ) ) ( not ( = ?auto_13494 ?auto_13485 ) ) ( not ( = ?auto_13489 ?auto_13485 ) ) ( not ( = ?auto_13477 ?auto_13485 ) ) ( not ( = ?auto_13475 ?auto_13485 ) ) ( TRUCK-AT ?auto_13492 ?auto_13480 ) )
    :subtasks
    ( ( !DRIVE ?auto_13492 ?auto_13480 ?auto_13478 )
      ( MAKE-ON ?auto_13473 ?auto_13474 )
      ( MAKE-ON-VERIFY ?auto_13473 ?auto_13474 ) )
  )

)

