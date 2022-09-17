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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2 - SURFACE
      ?auto_3 - SURFACE
    )
    :vars
    (
      ?auto_4 - HOIST
      ?auto_5 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4 ?auto_5 ) ( SURFACE-AT ?auto_2 ?auto_5 ) ( CLEAR ?auto_2 ) ( LIFTING ?auto_4 ?auto_3 ) ( IS-CRATE ?auto_3 ) ( not ( = ?auto_2 ?auto_3 ) ) )
    :subtasks
    ( ( !DROP ?auto_4 ?auto_3 ?auto_2 ?auto_5 )
      ( MAKE-1CRATE-VERIFY ?auto_2 ?auto_3 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6 - SURFACE
      ?auto_7 - SURFACE
    )
    :vars
    (
      ?auto_9 - HOIST
      ?auto_8 - PLACE
      ?auto_10 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9 ?auto_8 ) ( SURFACE-AT ?auto_6 ?auto_8 ) ( CLEAR ?auto_6 ) ( IS-CRATE ?auto_7 ) ( not ( = ?auto_6 ?auto_7 ) ) ( TRUCK-AT ?auto_10 ?auto_8 ) ( AVAILABLE ?auto_9 ) ( IN ?auto_7 ?auto_10 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9 ?auto_7 ?auto_10 ?auto_8 )
      ( MAKE-1CRATE ?auto_6 ?auto_7 )
      ( MAKE-1CRATE-VERIFY ?auto_6 ?auto_7 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11 - SURFACE
      ?auto_12 - SURFACE
    )
    :vars
    (
      ?auto_15 - HOIST
      ?auto_14 - PLACE
      ?auto_13 - TRUCK
      ?auto_16 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15 ?auto_14 ) ( SURFACE-AT ?auto_11 ?auto_14 ) ( CLEAR ?auto_11 ) ( IS-CRATE ?auto_12 ) ( not ( = ?auto_11 ?auto_12 ) ) ( AVAILABLE ?auto_15 ) ( IN ?auto_12 ?auto_13 ) ( TRUCK-AT ?auto_13 ?auto_16 ) ( not ( = ?auto_16 ?auto_14 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13 ?auto_16 ?auto_14 )
      ( MAKE-1CRATE ?auto_11 ?auto_12 )
      ( MAKE-1CRATE-VERIFY ?auto_11 ?auto_12 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17 - SURFACE
      ?auto_18 - SURFACE
    )
    :vars
    (
      ?auto_22 - HOIST
      ?auto_19 - PLACE
      ?auto_20 - TRUCK
      ?auto_21 - PLACE
      ?auto_23 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_22 ?auto_19 ) ( SURFACE-AT ?auto_17 ?auto_19 ) ( CLEAR ?auto_17 ) ( IS-CRATE ?auto_18 ) ( not ( = ?auto_17 ?auto_18 ) ) ( AVAILABLE ?auto_22 ) ( TRUCK-AT ?auto_20 ?auto_21 ) ( not ( = ?auto_21 ?auto_19 ) ) ( HOIST-AT ?auto_23 ?auto_21 ) ( LIFTING ?auto_23 ?auto_18 ) ( not ( = ?auto_22 ?auto_23 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23 ?auto_18 ?auto_20 ?auto_21 )
      ( MAKE-1CRATE ?auto_17 ?auto_18 )
      ( MAKE-1CRATE-VERIFY ?auto_17 ?auto_18 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24 - SURFACE
      ?auto_25 - SURFACE
    )
    :vars
    (
      ?auto_29 - HOIST
      ?auto_30 - PLACE
      ?auto_26 - TRUCK
      ?auto_28 - PLACE
      ?auto_27 - HOIST
      ?auto_31 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29 ?auto_30 ) ( SURFACE-AT ?auto_24 ?auto_30 ) ( CLEAR ?auto_24 ) ( IS-CRATE ?auto_25 ) ( not ( = ?auto_24 ?auto_25 ) ) ( AVAILABLE ?auto_29 ) ( TRUCK-AT ?auto_26 ?auto_28 ) ( not ( = ?auto_28 ?auto_30 ) ) ( HOIST-AT ?auto_27 ?auto_28 ) ( not ( = ?auto_29 ?auto_27 ) ) ( AVAILABLE ?auto_27 ) ( SURFACE-AT ?auto_25 ?auto_28 ) ( ON ?auto_25 ?auto_31 ) ( CLEAR ?auto_25 ) ( not ( = ?auto_24 ?auto_31 ) ) ( not ( = ?auto_25 ?auto_31 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27 ?auto_25 ?auto_31 ?auto_28 )
      ( MAKE-1CRATE ?auto_24 ?auto_25 )
      ( MAKE-1CRATE-VERIFY ?auto_24 ?auto_25 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_32 - SURFACE
      ?auto_33 - SURFACE
    )
    :vars
    (
      ?auto_36 - HOIST
      ?auto_35 - PLACE
      ?auto_37 - PLACE
      ?auto_39 - HOIST
      ?auto_34 - SURFACE
      ?auto_38 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36 ?auto_35 ) ( SURFACE-AT ?auto_32 ?auto_35 ) ( CLEAR ?auto_32 ) ( IS-CRATE ?auto_33 ) ( not ( = ?auto_32 ?auto_33 ) ) ( AVAILABLE ?auto_36 ) ( not ( = ?auto_37 ?auto_35 ) ) ( HOIST-AT ?auto_39 ?auto_37 ) ( not ( = ?auto_36 ?auto_39 ) ) ( AVAILABLE ?auto_39 ) ( SURFACE-AT ?auto_33 ?auto_37 ) ( ON ?auto_33 ?auto_34 ) ( CLEAR ?auto_33 ) ( not ( = ?auto_32 ?auto_34 ) ) ( not ( = ?auto_33 ?auto_34 ) ) ( TRUCK-AT ?auto_38 ?auto_35 ) )
    :subtasks
    ( ( !DRIVE ?auto_38 ?auto_35 ?auto_37 )
      ( MAKE-1CRATE ?auto_32 ?auto_33 )
      ( MAKE-1CRATE-VERIFY ?auto_32 ?auto_33 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_45 - SURFACE
      ?auto_46 - SURFACE
    )
    :vars
    (
      ?auto_47 - HOIST
      ?auto_48 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_47 ?auto_48 ) ( SURFACE-AT ?auto_45 ?auto_48 ) ( CLEAR ?auto_45 ) ( LIFTING ?auto_47 ?auto_46 ) ( IS-CRATE ?auto_46 ) ( not ( = ?auto_45 ?auto_46 ) ) )
    :subtasks
    ( ( !DROP ?auto_47 ?auto_46 ?auto_45 ?auto_48 )
      ( MAKE-1CRATE-VERIFY ?auto_45 ?auto_46 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49 - SURFACE
      ?auto_50 - SURFACE
      ?auto_51 - SURFACE
    )
    :vars
    (
      ?auto_52 - HOIST
      ?auto_53 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52 ?auto_53 ) ( SURFACE-AT ?auto_50 ?auto_53 ) ( CLEAR ?auto_50 ) ( LIFTING ?auto_52 ?auto_51 ) ( IS-CRATE ?auto_51 ) ( not ( = ?auto_50 ?auto_51 ) ) ( ON ?auto_50 ?auto_49 ) ( not ( = ?auto_49 ?auto_50 ) ) ( not ( = ?auto_49 ?auto_51 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_50 ?auto_51 )
      ( MAKE-2CRATE-VERIFY ?auto_49 ?auto_50 ?auto_51 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54 - SURFACE
      ?auto_55 - SURFACE
    )
    :vars
    (
      ?auto_56 - HOIST
      ?auto_57 - PLACE
      ?auto_58 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56 ?auto_57 ) ( SURFACE-AT ?auto_54 ?auto_57 ) ( CLEAR ?auto_54 ) ( IS-CRATE ?auto_55 ) ( not ( = ?auto_54 ?auto_55 ) ) ( TRUCK-AT ?auto_58 ?auto_57 ) ( AVAILABLE ?auto_56 ) ( IN ?auto_55 ?auto_58 ) )
    :subtasks
    ( ( !UNLOAD ?auto_56 ?auto_55 ?auto_58 ?auto_57 )
      ( MAKE-1CRATE ?auto_54 ?auto_55 )
      ( MAKE-1CRATE-VERIFY ?auto_54 ?auto_55 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_59 - SURFACE
      ?auto_60 - SURFACE
      ?auto_61 - SURFACE
    )
    :vars
    (
      ?auto_64 - HOIST
      ?auto_63 - PLACE
      ?auto_62 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64 ?auto_63 ) ( SURFACE-AT ?auto_60 ?auto_63 ) ( CLEAR ?auto_60 ) ( IS-CRATE ?auto_61 ) ( not ( = ?auto_60 ?auto_61 ) ) ( TRUCK-AT ?auto_62 ?auto_63 ) ( AVAILABLE ?auto_64 ) ( IN ?auto_61 ?auto_62 ) ( ON ?auto_60 ?auto_59 ) ( not ( = ?auto_59 ?auto_60 ) ) ( not ( = ?auto_59 ?auto_61 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_60 ?auto_61 )
      ( MAKE-2CRATE-VERIFY ?auto_59 ?auto_60 ?auto_61 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_65 - SURFACE
      ?auto_66 - SURFACE
    )
    :vars
    (
      ?auto_69 - HOIST
      ?auto_67 - PLACE
      ?auto_68 - TRUCK
      ?auto_70 - SURFACE
      ?auto_71 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69 ?auto_67 ) ( SURFACE-AT ?auto_65 ?auto_67 ) ( CLEAR ?auto_65 ) ( IS-CRATE ?auto_66 ) ( not ( = ?auto_65 ?auto_66 ) ) ( AVAILABLE ?auto_69 ) ( IN ?auto_66 ?auto_68 ) ( ON ?auto_65 ?auto_70 ) ( not ( = ?auto_70 ?auto_65 ) ) ( not ( = ?auto_70 ?auto_66 ) ) ( TRUCK-AT ?auto_68 ?auto_71 ) ( not ( = ?auto_71 ?auto_67 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_68 ?auto_71 ?auto_67 )
      ( MAKE-2CRATE ?auto_70 ?auto_65 ?auto_66 )
      ( MAKE-1CRATE-VERIFY ?auto_65 ?auto_66 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72 - SURFACE
      ?auto_73 - SURFACE
      ?auto_74 - SURFACE
    )
    :vars
    (
      ?auto_77 - HOIST
      ?auto_76 - PLACE
      ?auto_75 - TRUCK
      ?auto_78 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_77 ?auto_76 ) ( SURFACE-AT ?auto_73 ?auto_76 ) ( CLEAR ?auto_73 ) ( IS-CRATE ?auto_74 ) ( not ( = ?auto_73 ?auto_74 ) ) ( AVAILABLE ?auto_77 ) ( IN ?auto_74 ?auto_75 ) ( ON ?auto_73 ?auto_72 ) ( not ( = ?auto_72 ?auto_73 ) ) ( not ( = ?auto_72 ?auto_74 ) ) ( TRUCK-AT ?auto_75 ?auto_78 ) ( not ( = ?auto_78 ?auto_76 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_73 ?auto_74 )
      ( MAKE-2CRATE-VERIFY ?auto_72 ?auto_73 ?auto_74 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_79 - SURFACE
      ?auto_80 - SURFACE
    )
    :vars
    (
      ?auto_81 - HOIST
      ?auto_83 - PLACE
      ?auto_85 - SURFACE
      ?auto_82 - TRUCK
      ?auto_84 - PLACE
      ?auto_86 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81 ?auto_83 ) ( SURFACE-AT ?auto_79 ?auto_83 ) ( CLEAR ?auto_79 ) ( IS-CRATE ?auto_80 ) ( not ( = ?auto_79 ?auto_80 ) ) ( AVAILABLE ?auto_81 ) ( ON ?auto_79 ?auto_85 ) ( not ( = ?auto_85 ?auto_79 ) ) ( not ( = ?auto_85 ?auto_80 ) ) ( TRUCK-AT ?auto_82 ?auto_84 ) ( not ( = ?auto_84 ?auto_83 ) ) ( HOIST-AT ?auto_86 ?auto_84 ) ( LIFTING ?auto_86 ?auto_80 ) ( not ( = ?auto_81 ?auto_86 ) ) )
    :subtasks
    ( ( !LOAD ?auto_86 ?auto_80 ?auto_82 ?auto_84 )
      ( MAKE-2CRATE ?auto_85 ?auto_79 ?auto_80 )
      ( MAKE-1CRATE-VERIFY ?auto_79 ?auto_80 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_87 - SURFACE
      ?auto_88 - SURFACE
      ?auto_89 - SURFACE
    )
    :vars
    (
      ?auto_92 - HOIST
      ?auto_94 - PLACE
      ?auto_91 - TRUCK
      ?auto_93 - PLACE
      ?auto_90 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_92 ?auto_94 ) ( SURFACE-AT ?auto_88 ?auto_94 ) ( CLEAR ?auto_88 ) ( IS-CRATE ?auto_89 ) ( not ( = ?auto_88 ?auto_89 ) ) ( AVAILABLE ?auto_92 ) ( ON ?auto_88 ?auto_87 ) ( not ( = ?auto_87 ?auto_88 ) ) ( not ( = ?auto_87 ?auto_89 ) ) ( TRUCK-AT ?auto_91 ?auto_93 ) ( not ( = ?auto_93 ?auto_94 ) ) ( HOIST-AT ?auto_90 ?auto_93 ) ( LIFTING ?auto_90 ?auto_89 ) ( not ( = ?auto_92 ?auto_90 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_88 ?auto_89 )
      ( MAKE-2CRATE-VERIFY ?auto_87 ?auto_88 ?auto_89 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_95 - SURFACE
      ?auto_96 - SURFACE
    )
    :vars
    (
      ?auto_100 - HOIST
      ?auto_98 - PLACE
      ?auto_102 - SURFACE
      ?auto_99 - TRUCK
      ?auto_97 - PLACE
      ?auto_101 - HOIST
      ?auto_103 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_100 ?auto_98 ) ( SURFACE-AT ?auto_95 ?auto_98 ) ( CLEAR ?auto_95 ) ( IS-CRATE ?auto_96 ) ( not ( = ?auto_95 ?auto_96 ) ) ( AVAILABLE ?auto_100 ) ( ON ?auto_95 ?auto_102 ) ( not ( = ?auto_102 ?auto_95 ) ) ( not ( = ?auto_102 ?auto_96 ) ) ( TRUCK-AT ?auto_99 ?auto_97 ) ( not ( = ?auto_97 ?auto_98 ) ) ( HOIST-AT ?auto_101 ?auto_97 ) ( not ( = ?auto_100 ?auto_101 ) ) ( AVAILABLE ?auto_101 ) ( SURFACE-AT ?auto_96 ?auto_97 ) ( ON ?auto_96 ?auto_103 ) ( CLEAR ?auto_96 ) ( not ( = ?auto_95 ?auto_103 ) ) ( not ( = ?auto_96 ?auto_103 ) ) ( not ( = ?auto_102 ?auto_103 ) ) )
    :subtasks
    ( ( !LIFT ?auto_101 ?auto_96 ?auto_103 ?auto_97 )
      ( MAKE-2CRATE ?auto_102 ?auto_95 ?auto_96 )
      ( MAKE-1CRATE-VERIFY ?auto_95 ?auto_96 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_104 - SURFACE
      ?auto_105 - SURFACE
      ?auto_106 - SURFACE
    )
    :vars
    (
      ?auto_112 - HOIST
      ?auto_110 - PLACE
      ?auto_111 - TRUCK
      ?auto_108 - PLACE
      ?auto_109 - HOIST
      ?auto_107 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112 ?auto_110 ) ( SURFACE-AT ?auto_105 ?auto_110 ) ( CLEAR ?auto_105 ) ( IS-CRATE ?auto_106 ) ( not ( = ?auto_105 ?auto_106 ) ) ( AVAILABLE ?auto_112 ) ( ON ?auto_105 ?auto_104 ) ( not ( = ?auto_104 ?auto_105 ) ) ( not ( = ?auto_104 ?auto_106 ) ) ( TRUCK-AT ?auto_111 ?auto_108 ) ( not ( = ?auto_108 ?auto_110 ) ) ( HOIST-AT ?auto_109 ?auto_108 ) ( not ( = ?auto_112 ?auto_109 ) ) ( AVAILABLE ?auto_109 ) ( SURFACE-AT ?auto_106 ?auto_108 ) ( ON ?auto_106 ?auto_107 ) ( CLEAR ?auto_106 ) ( not ( = ?auto_105 ?auto_107 ) ) ( not ( = ?auto_106 ?auto_107 ) ) ( not ( = ?auto_104 ?auto_107 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_105 ?auto_106 )
      ( MAKE-2CRATE-VERIFY ?auto_104 ?auto_105 ?auto_106 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_113 - SURFACE
      ?auto_114 - SURFACE
    )
    :vars
    (
      ?auto_120 - HOIST
      ?auto_118 - PLACE
      ?auto_121 - SURFACE
      ?auto_116 - PLACE
      ?auto_115 - HOIST
      ?auto_117 - SURFACE
      ?auto_119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_120 ?auto_118 ) ( SURFACE-AT ?auto_113 ?auto_118 ) ( CLEAR ?auto_113 ) ( IS-CRATE ?auto_114 ) ( not ( = ?auto_113 ?auto_114 ) ) ( AVAILABLE ?auto_120 ) ( ON ?auto_113 ?auto_121 ) ( not ( = ?auto_121 ?auto_113 ) ) ( not ( = ?auto_121 ?auto_114 ) ) ( not ( = ?auto_116 ?auto_118 ) ) ( HOIST-AT ?auto_115 ?auto_116 ) ( not ( = ?auto_120 ?auto_115 ) ) ( AVAILABLE ?auto_115 ) ( SURFACE-AT ?auto_114 ?auto_116 ) ( ON ?auto_114 ?auto_117 ) ( CLEAR ?auto_114 ) ( not ( = ?auto_113 ?auto_117 ) ) ( not ( = ?auto_114 ?auto_117 ) ) ( not ( = ?auto_121 ?auto_117 ) ) ( TRUCK-AT ?auto_119 ?auto_118 ) )
    :subtasks
    ( ( !DRIVE ?auto_119 ?auto_118 ?auto_116 )
      ( MAKE-2CRATE ?auto_121 ?auto_113 ?auto_114 )
      ( MAKE-1CRATE-VERIFY ?auto_113 ?auto_114 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_122 - SURFACE
      ?auto_123 - SURFACE
      ?auto_124 - SURFACE
    )
    :vars
    (
      ?auto_129 - HOIST
      ?auto_125 - PLACE
      ?auto_130 - PLACE
      ?auto_128 - HOIST
      ?auto_127 - SURFACE
      ?auto_126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_129 ?auto_125 ) ( SURFACE-AT ?auto_123 ?auto_125 ) ( CLEAR ?auto_123 ) ( IS-CRATE ?auto_124 ) ( not ( = ?auto_123 ?auto_124 ) ) ( AVAILABLE ?auto_129 ) ( ON ?auto_123 ?auto_122 ) ( not ( = ?auto_122 ?auto_123 ) ) ( not ( = ?auto_122 ?auto_124 ) ) ( not ( = ?auto_130 ?auto_125 ) ) ( HOIST-AT ?auto_128 ?auto_130 ) ( not ( = ?auto_129 ?auto_128 ) ) ( AVAILABLE ?auto_128 ) ( SURFACE-AT ?auto_124 ?auto_130 ) ( ON ?auto_124 ?auto_127 ) ( CLEAR ?auto_124 ) ( not ( = ?auto_123 ?auto_127 ) ) ( not ( = ?auto_124 ?auto_127 ) ) ( not ( = ?auto_122 ?auto_127 ) ) ( TRUCK-AT ?auto_126 ?auto_125 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_123 ?auto_124 )
      ( MAKE-2CRATE-VERIFY ?auto_122 ?auto_123 ?auto_124 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_131 - SURFACE
      ?auto_132 - SURFACE
    )
    :vars
    (
      ?auto_138 - HOIST
      ?auto_135 - PLACE
      ?auto_139 - SURFACE
      ?auto_134 - PLACE
      ?auto_137 - HOIST
      ?auto_133 - SURFACE
      ?auto_136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_138 ?auto_135 ) ( IS-CRATE ?auto_132 ) ( not ( = ?auto_131 ?auto_132 ) ) ( not ( = ?auto_139 ?auto_131 ) ) ( not ( = ?auto_139 ?auto_132 ) ) ( not ( = ?auto_134 ?auto_135 ) ) ( HOIST-AT ?auto_137 ?auto_134 ) ( not ( = ?auto_138 ?auto_137 ) ) ( AVAILABLE ?auto_137 ) ( SURFACE-AT ?auto_132 ?auto_134 ) ( ON ?auto_132 ?auto_133 ) ( CLEAR ?auto_132 ) ( not ( = ?auto_131 ?auto_133 ) ) ( not ( = ?auto_132 ?auto_133 ) ) ( not ( = ?auto_139 ?auto_133 ) ) ( TRUCK-AT ?auto_136 ?auto_135 ) ( SURFACE-AT ?auto_139 ?auto_135 ) ( CLEAR ?auto_139 ) ( LIFTING ?auto_138 ?auto_131 ) ( IS-CRATE ?auto_131 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139 ?auto_131 )
      ( MAKE-2CRATE ?auto_139 ?auto_131 ?auto_132 )
      ( MAKE-1CRATE-VERIFY ?auto_131 ?auto_132 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_140 - SURFACE
      ?auto_141 - SURFACE
      ?auto_142 - SURFACE
    )
    :vars
    (
      ?auto_144 - HOIST
      ?auto_147 - PLACE
      ?auto_148 - PLACE
      ?auto_146 - HOIST
      ?auto_143 - SURFACE
      ?auto_145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_144 ?auto_147 ) ( IS-CRATE ?auto_142 ) ( not ( = ?auto_141 ?auto_142 ) ) ( not ( = ?auto_140 ?auto_141 ) ) ( not ( = ?auto_140 ?auto_142 ) ) ( not ( = ?auto_148 ?auto_147 ) ) ( HOIST-AT ?auto_146 ?auto_148 ) ( not ( = ?auto_144 ?auto_146 ) ) ( AVAILABLE ?auto_146 ) ( SURFACE-AT ?auto_142 ?auto_148 ) ( ON ?auto_142 ?auto_143 ) ( CLEAR ?auto_142 ) ( not ( = ?auto_141 ?auto_143 ) ) ( not ( = ?auto_142 ?auto_143 ) ) ( not ( = ?auto_140 ?auto_143 ) ) ( TRUCK-AT ?auto_145 ?auto_147 ) ( SURFACE-AT ?auto_140 ?auto_147 ) ( CLEAR ?auto_140 ) ( LIFTING ?auto_144 ?auto_141 ) ( IS-CRATE ?auto_141 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_141 ?auto_142 )
      ( MAKE-2CRATE-VERIFY ?auto_140 ?auto_141 ?auto_142 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_149 - SURFACE
      ?auto_150 - SURFACE
    )
    :vars
    (
      ?auto_151 - HOIST
      ?auto_153 - PLACE
      ?auto_157 - SURFACE
      ?auto_155 - PLACE
      ?auto_152 - HOIST
      ?auto_154 - SURFACE
      ?auto_156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_151 ?auto_153 ) ( IS-CRATE ?auto_150 ) ( not ( = ?auto_149 ?auto_150 ) ) ( not ( = ?auto_157 ?auto_149 ) ) ( not ( = ?auto_157 ?auto_150 ) ) ( not ( = ?auto_155 ?auto_153 ) ) ( HOIST-AT ?auto_152 ?auto_155 ) ( not ( = ?auto_151 ?auto_152 ) ) ( AVAILABLE ?auto_152 ) ( SURFACE-AT ?auto_150 ?auto_155 ) ( ON ?auto_150 ?auto_154 ) ( CLEAR ?auto_150 ) ( not ( = ?auto_149 ?auto_154 ) ) ( not ( = ?auto_150 ?auto_154 ) ) ( not ( = ?auto_157 ?auto_154 ) ) ( TRUCK-AT ?auto_156 ?auto_153 ) ( SURFACE-AT ?auto_157 ?auto_153 ) ( CLEAR ?auto_157 ) ( IS-CRATE ?auto_149 ) ( AVAILABLE ?auto_151 ) ( IN ?auto_149 ?auto_156 ) )
    :subtasks
    ( ( !UNLOAD ?auto_151 ?auto_149 ?auto_156 ?auto_153 )
      ( MAKE-2CRATE ?auto_157 ?auto_149 ?auto_150 )
      ( MAKE-1CRATE-VERIFY ?auto_149 ?auto_150 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_158 - SURFACE
      ?auto_159 - SURFACE
      ?auto_160 - SURFACE
    )
    :vars
    (
      ?auto_166 - HOIST
      ?auto_165 - PLACE
      ?auto_161 - PLACE
      ?auto_162 - HOIST
      ?auto_163 - SURFACE
      ?auto_164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166 ?auto_165 ) ( IS-CRATE ?auto_160 ) ( not ( = ?auto_159 ?auto_160 ) ) ( not ( = ?auto_158 ?auto_159 ) ) ( not ( = ?auto_158 ?auto_160 ) ) ( not ( = ?auto_161 ?auto_165 ) ) ( HOIST-AT ?auto_162 ?auto_161 ) ( not ( = ?auto_166 ?auto_162 ) ) ( AVAILABLE ?auto_162 ) ( SURFACE-AT ?auto_160 ?auto_161 ) ( ON ?auto_160 ?auto_163 ) ( CLEAR ?auto_160 ) ( not ( = ?auto_159 ?auto_163 ) ) ( not ( = ?auto_160 ?auto_163 ) ) ( not ( = ?auto_158 ?auto_163 ) ) ( TRUCK-AT ?auto_164 ?auto_165 ) ( SURFACE-AT ?auto_158 ?auto_165 ) ( CLEAR ?auto_158 ) ( IS-CRATE ?auto_159 ) ( AVAILABLE ?auto_166 ) ( IN ?auto_159 ?auto_164 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_159 ?auto_160 )
      ( MAKE-2CRATE-VERIFY ?auto_158 ?auto_159 ?auto_160 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_167 - SURFACE
      ?auto_168 - SURFACE
    )
    :vars
    (
      ?auto_170 - HOIST
      ?auto_169 - PLACE
      ?auto_175 - SURFACE
      ?auto_173 - PLACE
      ?auto_172 - HOIST
      ?auto_171 - SURFACE
      ?auto_174 - TRUCK
      ?auto_176 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_170 ?auto_169 ) ( IS-CRATE ?auto_168 ) ( not ( = ?auto_167 ?auto_168 ) ) ( not ( = ?auto_175 ?auto_167 ) ) ( not ( = ?auto_175 ?auto_168 ) ) ( not ( = ?auto_173 ?auto_169 ) ) ( HOIST-AT ?auto_172 ?auto_173 ) ( not ( = ?auto_170 ?auto_172 ) ) ( AVAILABLE ?auto_172 ) ( SURFACE-AT ?auto_168 ?auto_173 ) ( ON ?auto_168 ?auto_171 ) ( CLEAR ?auto_168 ) ( not ( = ?auto_167 ?auto_171 ) ) ( not ( = ?auto_168 ?auto_171 ) ) ( not ( = ?auto_175 ?auto_171 ) ) ( SURFACE-AT ?auto_175 ?auto_169 ) ( CLEAR ?auto_175 ) ( IS-CRATE ?auto_167 ) ( AVAILABLE ?auto_170 ) ( IN ?auto_167 ?auto_174 ) ( TRUCK-AT ?auto_174 ?auto_176 ) ( not ( = ?auto_176 ?auto_169 ) ) ( not ( = ?auto_173 ?auto_176 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_174 ?auto_176 ?auto_169 )
      ( MAKE-2CRATE ?auto_175 ?auto_167 ?auto_168 )
      ( MAKE-1CRATE-VERIFY ?auto_167 ?auto_168 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_177 - SURFACE
      ?auto_178 - SURFACE
      ?auto_179 - SURFACE
    )
    :vars
    (
      ?auto_185 - HOIST
      ?auto_180 - PLACE
      ?auto_181 - PLACE
      ?auto_184 - HOIST
      ?auto_182 - SURFACE
      ?auto_183 - TRUCK
      ?auto_186 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_185 ?auto_180 ) ( IS-CRATE ?auto_179 ) ( not ( = ?auto_178 ?auto_179 ) ) ( not ( = ?auto_177 ?auto_178 ) ) ( not ( = ?auto_177 ?auto_179 ) ) ( not ( = ?auto_181 ?auto_180 ) ) ( HOIST-AT ?auto_184 ?auto_181 ) ( not ( = ?auto_185 ?auto_184 ) ) ( AVAILABLE ?auto_184 ) ( SURFACE-AT ?auto_179 ?auto_181 ) ( ON ?auto_179 ?auto_182 ) ( CLEAR ?auto_179 ) ( not ( = ?auto_178 ?auto_182 ) ) ( not ( = ?auto_179 ?auto_182 ) ) ( not ( = ?auto_177 ?auto_182 ) ) ( SURFACE-AT ?auto_177 ?auto_180 ) ( CLEAR ?auto_177 ) ( IS-CRATE ?auto_178 ) ( AVAILABLE ?auto_185 ) ( IN ?auto_178 ?auto_183 ) ( TRUCK-AT ?auto_183 ?auto_186 ) ( not ( = ?auto_186 ?auto_180 ) ) ( not ( = ?auto_181 ?auto_186 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_178 ?auto_179 )
      ( MAKE-2CRATE-VERIFY ?auto_177 ?auto_178 ?auto_179 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_187 - SURFACE
      ?auto_188 - SURFACE
    )
    :vars
    (
      ?auto_194 - HOIST
      ?auto_190 - PLACE
      ?auto_196 - SURFACE
      ?auto_191 - PLACE
      ?auto_189 - HOIST
      ?auto_192 - SURFACE
      ?auto_195 - TRUCK
      ?auto_193 - PLACE
      ?auto_197 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_194 ?auto_190 ) ( IS-CRATE ?auto_188 ) ( not ( = ?auto_187 ?auto_188 ) ) ( not ( = ?auto_196 ?auto_187 ) ) ( not ( = ?auto_196 ?auto_188 ) ) ( not ( = ?auto_191 ?auto_190 ) ) ( HOIST-AT ?auto_189 ?auto_191 ) ( not ( = ?auto_194 ?auto_189 ) ) ( AVAILABLE ?auto_189 ) ( SURFACE-AT ?auto_188 ?auto_191 ) ( ON ?auto_188 ?auto_192 ) ( CLEAR ?auto_188 ) ( not ( = ?auto_187 ?auto_192 ) ) ( not ( = ?auto_188 ?auto_192 ) ) ( not ( = ?auto_196 ?auto_192 ) ) ( SURFACE-AT ?auto_196 ?auto_190 ) ( CLEAR ?auto_196 ) ( IS-CRATE ?auto_187 ) ( AVAILABLE ?auto_194 ) ( TRUCK-AT ?auto_195 ?auto_193 ) ( not ( = ?auto_193 ?auto_190 ) ) ( not ( = ?auto_191 ?auto_193 ) ) ( HOIST-AT ?auto_197 ?auto_193 ) ( LIFTING ?auto_197 ?auto_187 ) ( not ( = ?auto_194 ?auto_197 ) ) ( not ( = ?auto_189 ?auto_197 ) ) )
    :subtasks
    ( ( !LOAD ?auto_197 ?auto_187 ?auto_195 ?auto_193 )
      ( MAKE-2CRATE ?auto_196 ?auto_187 ?auto_188 )
      ( MAKE-1CRATE-VERIFY ?auto_187 ?auto_188 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_198 - SURFACE
      ?auto_199 - SURFACE
      ?auto_200 - SURFACE
    )
    :vars
    (
      ?auto_201 - HOIST
      ?auto_206 - PLACE
      ?auto_205 - PLACE
      ?auto_207 - HOIST
      ?auto_203 - SURFACE
      ?auto_204 - TRUCK
      ?auto_202 - PLACE
      ?auto_208 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_201 ?auto_206 ) ( IS-CRATE ?auto_200 ) ( not ( = ?auto_199 ?auto_200 ) ) ( not ( = ?auto_198 ?auto_199 ) ) ( not ( = ?auto_198 ?auto_200 ) ) ( not ( = ?auto_205 ?auto_206 ) ) ( HOIST-AT ?auto_207 ?auto_205 ) ( not ( = ?auto_201 ?auto_207 ) ) ( AVAILABLE ?auto_207 ) ( SURFACE-AT ?auto_200 ?auto_205 ) ( ON ?auto_200 ?auto_203 ) ( CLEAR ?auto_200 ) ( not ( = ?auto_199 ?auto_203 ) ) ( not ( = ?auto_200 ?auto_203 ) ) ( not ( = ?auto_198 ?auto_203 ) ) ( SURFACE-AT ?auto_198 ?auto_206 ) ( CLEAR ?auto_198 ) ( IS-CRATE ?auto_199 ) ( AVAILABLE ?auto_201 ) ( TRUCK-AT ?auto_204 ?auto_202 ) ( not ( = ?auto_202 ?auto_206 ) ) ( not ( = ?auto_205 ?auto_202 ) ) ( HOIST-AT ?auto_208 ?auto_202 ) ( LIFTING ?auto_208 ?auto_199 ) ( not ( = ?auto_201 ?auto_208 ) ) ( not ( = ?auto_207 ?auto_208 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_199 ?auto_200 )
      ( MAKE-2CRATE-VERIFY ?auto_198 ?auto_199 ?auto_200 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_209 - SURFACE
      ?auto_210 - SURFACE
    )
    :vars
    (
      ?auto_214 - HOIST
      ?auto_218 - PLACE
      ?auto_219 - SURFACE
      ?auto_215 - PLACE
      ?auto_211 - HOIST
      ?auto_217 - SURFACE
      ?auto_213 - TRUCK
      ?auto_216 - PLACE
      ?auto_212 - HOIST
      ?auto_220 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_214 ?auto_218 ) ( IS-CRATE ?auto_210 ) ( not ( = ?auto_209 ?auto_210 ) ) ( not ( = ?auto_219 ?auto_209 ) ) ( not ( = ?auto_219 ?auto_210 ) ) ( not ( = ?auto_215 ?auto_218 ) ) ( HOIST-AT ?auto_211 ?auto_215 ) ( not ( = ?auto_214 ?auto_211 ) ) ( AVAILABLE ?auto_211 ) ( SURFACE-AT ?auto_210 ?auto_215 ) ( ON ?auto_210 ?auto_217 ) ( CLEAR ?auto_210 ) ( not ( = ?auto_209 ?auto_217 ) ) ( not ( = ?auto_210 ?auto_217 ) ) ( not ( = ?auto_219 ?auto_217 ) ) ( SURFACE-AT ?auto_219 ?auto_218 ) ( CLEAR ?auto_219 ) ( IS-CRATE ?auto_209 ) ( AVAILABLE ?auto_214 ) ( TRUCK-AT ?auto_213 ?auto_216 ) ( not ( = ?auto_216 ?auto_218 ) ) ( not ( = ?auto_215 ?auto_216 ) ) ( HOIST-AT ?auto_212 ?auto_216 ) ( not ( = ?auto_214 ?auto_212 ) ) ( not ( = ?auto_211 ?auto_212 ) ) ( AVAILABLE ?auto_212 ) ( SURFACE-AT ?auto_209 ?auto_216 ) ( ON ?auto_209 ?auto_220 ) ( CLEAR ?auto_209 ) ( not ( = ?auto_209 ?auto_220 ) ) ( not ( = ?auto_210 ?auto_220 ) ) ( not ( = ?auto_219 ?auto_220 ) ) ( not ( = ?auto_217 ?auto_220 ) ) )
    :subtasks
    ( ( !LIFT ?auto_212 ?auto_209 ?auto_220 ?auto_216 )
      ( MAKE-2CRATE ?auto_219 ?auto_209 ?auto_210 )
      ( MAKE-1CRATE-VERIFY ?auto_209 ?auto_210 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_221 - SURFACE
      ?auto_222 - SURFACE
      ?auto_223 - SURFACE
    )
    :vars
    (
      ?auto_226 - HOIST
      ?auto_228 - PLACE
      ?auto_229 - PLACE
      ?auto_230 - HOIST
      ?auto_231 - SURFACE
      ?auto_225 - TRUCK
      ?auto_224 - PLACE
      ?auto_227 - HOIST
      ?auto_232 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226 ?auto_228 ) ( IS-CRATE ?auto_223 ) ( not ( = ?auto_222 ?auto_223 ) ) ( not ( = ?auto_221 ?auto_222 ) ) ( not ( = ?auto_221 ?auto_223 ) ) ( not ( = ?auto_229 ?auto_228 ) ) ( HOIST-AT ?auto_230 ?auto_229 ) ( not ( = ?auto_226 ?auto_230 ) ) ( AVAILABLE ?auto_230 ) ( SURFACE-AT ?auto_223 ?auto_229 ) ( ON ?auto_223 ?auto_231 ) ( CLEAR ?auto_223 ) ( not ( = ?auto_222 ?auto_231 ) ) ( not ( = ?auto_223 ?auto_231 ) ) ( not ( = ?auto_221 ?auto_231 ) ) ( SURFACE-AT ?auto_221 ?auto_228 ) ( CLEAR ?auto_221 ) ( IS-CRATE ?auto_222 ) ( AVAILABLE ?auto_226 ) ( TRUCK-AT ?auto_225 ?auto_224 ) ( not ( = ?auto_224 ?auto_228 ) ) ( not ( = ?auto_229 ?auto_224 ) ) ( HOIST-AT ?auto_227 ?auto_224 ) ( not ( = ?auto_226 ?auto_227 ) ) ( not ( = ?auto_230 ?auto_227 ) ) ( AVAILABLE ?auto_227 ) ( SURFACE-AT ?auto_222 ?auto_224 ) ( ON ?auto_222 ?auto_232 ) ( CLEAR ?auto_222 ) ( not ( = ?auto_222 ?auto_232 ) ) ( not ( = ?auto_223 ?auto_232 ) ) ( not ( = ?auto_221 ?auto_232 ) ) ( not ( = ?auto_231 ?auto_232 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_222 ?auto_223 )
      ( MAKE-2CRATE-VERIFY ?auto_221 ?auto_222 ?auto_223 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_233 - SURFACE
      ?auto_234 - SURFACE
    )
    :vars
    (
      ?auto_238 - HOIST
      ?auto_243 - PLACE
      ?auto_244 - SURFACE
      ?auto_241 - PLACE
      ?auto_240 - HOIST
      ?auto_237 - SURFACE
      ?auto_239 - PLACE
      ?auto_235 - HOIST
      ?auto_242 - SURFACE
      ?auto_236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_238 ?auto_243 ) ( IS-CRATE ?auto_234 ) ( not ( = ?auto_233 ?auto_234 ) ) ( not ( = ?auto_244 ?auto_233 ) ) ( not ( = ?auto_244 ?auto_234 ) ) ( not ( = ?auto_241 ?auto_243 ) ) ( HOIST-AT ?auto_240 ?auto_241 ) ( not ( = ?auto_238 ?auto_240 ) ) ( AVAILABLE ?auto_240 ) ( SURFACE-AT ?auto_234 ?auto_241 ) ( ON ?auto_234 ?auto_237 ) ( CLEAR ?auto_234 ) ( not ( = ?auto_233 ?auto_237 ) ) ( not ( = ?auto_234 ?auto_237 ) ) ( not ( = ?auto_244 ?auto_237 ) ) ( SURFACE-AT ?auto_244 ?auto_243 ) ( CLEAR ?auto_244 ) ( IS-CRATE ?auto_233 ) ( AVAILABLE ?auto_238 ) ( not ( = ?auto_239 ?auto_243 ) ) ( not ( = ?auto_241 ?auto_239 ) ) ( HOIST-AT ?auto_235 ?auto_239 ) ( not ( = ?auto_238 ?auto_235 ) ) ( not ( = ?auto_240 ?auto_235 ) ) ( AVAILABLE ?auto_235 ) ( SURFACE-AT ?auto_233 ?auto_239 ) ( ON ?auto_233 ?auto_242 ) ( CLEAR ?auto_233 ) ( not ( = ?auto_233 ?auto_242 ) ) ( not ( = ?auto_234 ?auto_242 ) ) ( not ( = ?auto_244 ?auto_242 ) ) ( not ( = ?auto_237 ?auto_242 ) ) ( TRUCK-AT ?auto_236 ?auto_243 ) )
    :subtasks
    ( ( !DRIVE ?auto_236 ?auto_243 ?auto_239 )
      ( MAKE-2CRATE ?auto_244 ?auto_233 ?auto_234 )
      ( MAKE-1CRATE-VERIFY ?auto_233 ?auto_234 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_245 - SURFACE
      ?auto_246 - SURFACE
      ?auto_247 - SURFACE
    )
    :vars
    (
      ?auto_250 - HOIST
      ?auto_248 - PLACE
      ?auto_253 - PLACE
      ?auto_256 - HOIST
      ?auto_255 - SURFACE
      ?auto_254 - PLACE
      ?auto_251 - HOIST
      ?auto_252 - SURFACE
      ?auto_249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_250 ?auto_248 ) ( IS-CRATE ?auto_247 ) ( not ( = ?auto_246 ?auto_247 ) ) ( not ( = ?auto_245 ?auto_246 ) ) ( not ( = ?auto_245 ?auto_247 ) ) ( not ( = ?auto_253 ?auto_248 ) ) ( HOIST-AT ?auto_256 ?auto_253 ) ( not ( = ?auto_250 ?auto_256 ) ) ( AVAILABLE ?auto_256 ) ( SURFACE-AT ?auto_247 ?auto_253 ) ( ON ?auto_247 ?auto_255 ) ( CLEAR ?auto_247 ) ( not ( = ?auto_246 ?auto_255 ) ) ( not ( = ?auto_247 ?auto_255 ) ) ( not ( = ?auto_245 ?auto_255 ) ) ( SURFACE-AT ?auto_245 ?auto_248 ) ( CLEAR ?auto_245 ) ( IS-CRATE ?auto_246 ) ( AVAILABLE ?auto_250 ) ( not ( = ?auto_254 ?auto_248 ) ) ( not ( = ?auto_253 ?auto_254 ) ) ( HOIST-AT ?auto_251 ?auto_254 ) ( not ( = ?auto_250 ?auto_251 ) ) ( not ( = ?auto_256 ?auto_251 ) ) ( AVAILABLE ?auto_251 ) ( SURFACE-AT ?auto_246 ?auto_254 ) ( ON ?auto_246 ?auto_252 ) ( CLEAR ?auto_246 ) ( not ( = ?auto_246 ?auto_252 ) ) ( not ( = ?auto_247 ?auto_252 ) ) ( not ( = ?auto_245 ?auto_252 ) ) ( not ( = ?auto_255 ?auto_252 ) ) ( TRUCK-AT ?auto_249 ?auto_248 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_246 ?auto_247 )
      ( MAKE-2CRATE-VERIFY ?auto_245 ?auto_246 ?auto_247 ) )
  )

)

