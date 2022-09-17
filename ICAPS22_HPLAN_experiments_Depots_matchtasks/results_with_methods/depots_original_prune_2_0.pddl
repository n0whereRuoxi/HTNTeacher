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
      ?auto_19 - HOIST
      ?auto_22 - PLACE
      ?auto_20 - TRUCK
      ?auto_21 - PLACE
      ?auto_23 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19 ?auto_22 ) ( SURFACE-AT ?auto_17 ?auto_22 ) ( CLEAR ?auto_17 ) ( IS-CRATE ?auto_18 ) ( not ( = ?auto_17 ?auto_18 ) ) ( AVAILABLE ?auto_19 ) ( TRUCK-AT ?auto_20 ?auto_21 ) ( not ( = ?auto_21 ?auto_22 ) ) ( HOIST-AT ?auto_23 ?auto_21 ) ( LIFTING ?auto_23 ?auto_18 ) ( not ( = ?auto_19 ?auto_23 ) ) )
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
      ?auto_28 - HOIST
      ?auto_29 - PLACE
      ?auto_30 - TRUCK
      ?auto_26 - PLACE
      ?auto_27 - HOIST
      ?auto_31 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28 ?auto_29 ) ( SURFACE-AT ?auto_24 ?auto_29 ) ( CLEAR ?auto_24 ) ( IS-CRATE ?auto_25 ) ( not ( = ?auto_24 ?auto_25 ) ) ( AVAILABLE ?auto_28 ) ( TRUCK-AT ?auto_30 ?auto_26 ) ( not ( = ?auto_26 ?auto_29 ) ) ( HOIST-AT ?auto_27 ?auto_26 ) ( not ( = ?auto_28 ?auto_27 ) ) ( AVAILABLE ?auto_27 ) ( SURFACE-AT ?auto_25 ?auto_26 ) ( ON ?auto_25 ?auto_31 ) ( CLEAR ?auto_25 ) ( not ( = ?auto_24 ?auto_31 ) ) ( not ( = ?auto_25 ?auto_31 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27 ?auto_25 ?auto_31 ?auto_26 )
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
      ?auto_35 - HOIST
      ?auto_39 - PLACE
      ?auto_37 - PLACE
      ?auto_36 - HOIST
      ?auto_34 - SURFACE
      ?auto_38 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_35 ?auto_39 ) ( SURFACE-AT ?auto_32 ?auto_39 ) ( CLEAR ?auto_32 ) ( IS-CRATE ?auto_33 ) ( not ( = ?auto_32 ?auto_33 ) ) ( AVAILABLE ?auto_35 ) ( not ( = ?auto_37 ?auto_39 ) ) ( HOIST-AT ?auto_36 ?auto_37 ) ( not ( = ?auto_35 ?auto_36 ) ) ( AVAILABLE ?auto_36 ) ( SURFACE-AT ?auto_33 ?auto_37 ) ( ON ?auto_33 ?auto_34 ) ( CLEAR ?auto_33 ) ( not ( = ?auto_32 ?auto_34 ) ) ( not ( = ?auto_33 ?auto_34 ) ) ( TRUCK-AT ?auto_38 ?auto_39 ) )
    :subtasks
    ( ( !DRIVE ?auto_38 ?auto_39 ?auto_37 )
      ( MAKE-1CRATE ?auto_32 ?auto_33 )
      ( MAKE-1CRATE-VERIFY ?auto_32 ?auto_33 ) )
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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_59 - SURFACE
      ?auto_60 - SURFACE
      ?auto_61 - SURFACE
    )
    :vars
    (
      ?auto_62 - HOIST
      ?auto_64 - PLACE
      ?auto_63 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62 ?auto_64 ) ( SURFACE-AT ?auto_60 ?auto_64 ) ( CLEAR ?auto_60 ) ( IS-CRATE ?auto_61 ) ( not ( = ?auto_60 ?auto_61 ) ) ( TRUCK-AT ?auto_63 ?auto_64 ) ( AVAILABLE ?auto_62 ) ( IN ?auto_61 ?auto_63 ) ( ON ?auto_60 ?auto_59 ) ( not ( = ?auto_59 ?auto_60 ) ) ( not ( = ?auto_59 ?auto_61 ) ) )
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
      ?auto_68 - PLACE
      ?auto_70 - TRUCK
      ?auto_67 - SURFACE
      ?auto_71 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69 ?auto_68 ) ( SURFACE-AT ?auto_65 ?auto_68 ) ( CLEAR ?auto_65 ) ( IS-CRATE ?auto_66 ) ( not ( = ?auto_65 ?auto_66 ) ) ( AVAILABLE ?auto_69 ) ( IN ?auto_66 ?auto_70 ) ( ON ?auto_65 ?auto_67 ) ( not ( = ?auto_67 ?auto_65 ) ) ( not ( = ?auto_67 ?auto_66 ) ) ( TRUCK-AT ?auto_70 ?auto_71 ) ( not ( = ?auto_71 ?auto_68 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_70 ?auto_71 ?auto_68 )
      ( MAKE-2CRATE ?auto_67 ?auto_65 ?auto_66 )
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
      ?auto_75 - HOIST
      ?auto_78 - PLACE
      ?auto_77 - TRUCK
      ?auto_76 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_75 ?auto_78 ) ( SURFACE-AT ?auto_73 ?auto_78 ) ( CLEAR ?auto_73 ) ( IS-CRATE ?auto_74 ) ( not ( = ?auto_73 ?auto_74 ) ) ( AVAILABLE ?auto_75 ) ( IN ?auto_74 ?auto_77 ) ( ON ?auto_73 ?auto_72 ) ( not ( = ?auto_72 ?auto_73 ) ) ( not ( = ?auto_72 ?auto_74 ) ) ( TRUCK-AT ?auto_77 ?auto_76 ) ( not ( = ?auto_76 ?auto_78 ) ) )
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
      ?auto_84 - TRUCK
      ?auto_82 - PLACE
      ?auto_86 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81 ?auto_83 ) ( SURFACE-AT ?auto_79 ?auto_83 ) ( CLEAR ?auto_79 ) ( IS-CRATE ?auto_80 ) ( not ( = ?auto_79 ?auto_80 ) ) ( AVAILABLE ?auto_81 ) ( ON ?auto_79 ?auto_85 ) ( not ( = ?auto_85 ?auto_79 ) ) ( not ( = ?auto_85 ?auto_80 ) ) ( TRUCK-AT ?auto_84 ?auto_82 ) ( not ( = ?auto_82 ?auto_83 ) ) ( HOIST-AT ?auto_86 ?auto_82 ) ( LIFTING ?auto_86 ?auto_80 ) ( not ( = ?auto_81 ?auto_86 ) ) )
    :subtasks
    ( ( !LOAD ?auto_86 ?auto_80 ?auto_84 ?auto_82 )
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
      ?auto_90 - HOIST
      ?auto_94 - PLACE
      ?auto_93 - TRUCK
      ?auto_91 - PLACE
      ?auto_92 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90 ?auto_94 ) ( SURFACE-AT ?auto_88 ?auto_94 ) ( CLEAR ?auto_88 ) ( IS-CRATE ?auto_89 ) ( not ( = ?auto_88 ?auto_89 ) ) ( AVAILABLE ?auto_90 ) ( ON ?auto_88 ?auto_87 ) ( not ( = ?auto_87 ?auto_88 ) ) ( not ( = ?auto_87 ?auto_89 ) ) ( TRUCK-AT ?auto_93 ?auto_91 ) ( not ( = ?auto_91 ?auto_94 ) ) ( HOIST-AT ?auto_92 ?auto_91 ) ( LIFTING ?auto_92 ?auto_89 ) ( not ( = ?auto_90 ?auto_92 ) ) )
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
      ?auto_97 - HOIST
      ?auto_100 - PLACE
      ?auto_102 - SURFACE
      ?auto_98 - TRUCK
      ?auto_99 - PLACE
      ?auto_101 - HOIST
      ?auto_103 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_97 ?auto_100 ) ( SURFACE-AT ?auto_95 ?auto_100 ) ( CLEAR ?auto_95 ) ( IS-CRATE ?auto_96 ) ( not ( = ?auto_95 ?auto_96 ) ) ( AVAILABLE ?auto_97 ) ( ON ?auto_95 ?auto_102 ) ( not ( = ?auto_102 ?auto_95 ) ) ( not ( = ?auto_102 ?auto_96 ) ) ( TRUCK-AT ?auto_98 ?auto_99 ) ( not ( = ?auto_99 ?auto_100 ) ) ( HOIST-AT ?auto_101 ?auto_99 ) ( not ( = ?auto_97 ?auto_101 ) ) ( AVAILABLE ?auto_101 ) ( SURFACE-AT ?auto_96 ?auto_99 ) ( ON ?auto_96 ?auto_103 ) ( CLEAR ?auto_96 ) ( not ( = ?auto_95 ?auto_103 ) ) ( not ( = ?auto_96 ?auto_103 ) ) ( not ( = ?auto_102 ?auto_103 ) ) )
    :subtasks
    ( ( !LIFT ?auto_101 ?auto_96 ?auto_103 ?auto_99 )
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
      ?auto_107 - PLACE
      ?auto_108 - HOIST
      ?auto_109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112 ?auto_110 ) ( SURFACE-AT ?auto_105 ?auto_110 ) ( CLEAR ?auto_105 ) ( IS-CRATE ?auto_106 ) ( not ( = ?auto_105 ?auto_106 ) ) ( AVAILABLE ?auto_112 ) ( ON ?auto_105 ?auto_104 ) ( not ( = ?auto_104 ?auto_105 ) ) ( not ( = ?auto_104 ?auto_106 ) ) ( TRUCK-AT ?auto_111 ?auto_107 ) ( not ( = ?auto_107 ?auto_110 ) ) ( HOIST-AT ?auto_108 ?auto_107 ) ( not ( = ?auto_112 ?auto_108 ) ) ( AVAILABLE ?auto_108 ) ( SURFACE-AT ?auto_106 ?auto_107 ) ( ON ?auto_106 ?auto_109 ) ( CLEAR ?auto_106 ) ( not ( = ?auto_105 ?auto_109 ) ) ( not ( = ?auto_106 ?auto_109 ) ) ( not ( = ?auto_104 ?auto_109 ) ) )
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
      ?auto_116 - HOIST
      ?auto_118 - PLACE
      ?auto_121 - SURFACE
      ?auto_115 - PLACE
      ?auto_119 - HOIST
      ?auto_117 - SURFACE
      ?auto_120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_116 ?auto_118 ) ( SURFACE-AT ?auto_113 ?auto_118 ) ( CLEAR ?auto_113 ) ( IS-CRATE ?auto_114 ) ( not ( = ?auto_113 ?auto_114 ) ) ( AVAILABLE ?auto_116 ) ( ON ?auto_113 ?auto_121 ) ( not ( = ?auto_121 ?auto_113 ) ) ( not ( = ?auto_121 ?auto_114 ) ) ( not ( = ?auto_115 ?auto_118 ) ) ( HOIST-AT ?auto_119 ?auto_115 ) ( not ( = ?auto_116 ?auto_119 ) ) ( AVAILABLE ?auto_119 ) ( SURFACE-AT ?auto_114 ?auto_115 ) ( ON ?auto_114 ?auto_117 ) ( CLEAR ?auto_114 ) ( not ( = ?auto_113 ?auto_117 ) ) ( not ( = ?auto_114 ?auto_117 ) ) ( not ( = ?auto_121 ?auto_117 ) ) ( TRUCK-AT ?auto_120 ?auto_118 ) )
    :subtasks
    ( ( !DRIVE ?auto_120 ?auto_118 ?auto_115 )
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
      ?auto_126 - HOIST
      ?auto_128 - PLACE
      ?auto_129 - PLACE
      ?auto_130 - HOIST
      ?auto_127 - SURFACE
      ?auto_125 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_126 ?auto_128 ) ( SURFACE-AT ?auto_123 ?auto_128 ) ( CLEAR ?auto_123 ) ( IS-CRATE ?auto_124 ) ( not ( = ?auto_123 ?auto_124 ) ) ( AVAILABLE ?auto_126 ) ( ON ?auto_123 ?auto_122 ) ( not ( = ?auto_122 ?auto_123 ) ) ( not ( = ?auto_122 ?auto_124 ) ) ( not ( = ?auto_129 ?auto_128 ) ) ( HOIST-AT ?auto_130 ?auto_129 ) ( not ( = ?auto_126 ?auto_130 ) ) ( AVAILABLE ?auto_130 ) ( SURFACE-AT ?auto_124 ?auto_129 ) ( ON ?auto_124 ?auto_127 ) ( CLEAR ?auto_124 ) ( not ( = ?auto_123 ?auto_127 ) ) ( not ( = ?auto_124 ?auto_127 ) ) ( not ( = ?auto_122 ?auto_127 ) ) ( TRUCK-AT ?auto_125 ?auto_128 ) )
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
      ?auto_135 - HOIST
      ?auto_137 - PLACE
      ?auto_139 - SURFACE
      ?auto_134 - PLACE
      ?auto_136 - HOIST
      ?auto_138 - SURFACE
      ?auto_133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_135 ?auto_137 ) ( IS-CRATE ?auto_132 ) ( not ( = ?auto_131 ?auto_132 ) ) ( not ( = ?auto_139 ?auto_131 ) ) ( not ( = ?auto_139 ?auto_132 ) ) ( not ( = ?auto_134 ?auto_137 ) ) ( HOIST-AT ?auto_136 ?auto_134 ) ( not ( = ?auto_135 ?auto_136 ) ) ( AVAILABLE ?auto_136 ) ( SURFACE-AT ?auto_132 ?auto_134 ) ( ON ?auto_132 ?auto_138 ) ( CLEAR ?auto_132 ) ( not ( = ?auto_131 ?auto_138 ) ) ( not ( = ?auto_132 ?auto_138 ) ) ( not ( = ?auto_139 ?auto_138 ) ) ( TRUCK-AT ?auto_133 ?auto_137 ) ( SURFACE-AT ?auto_139 ?auto_137 ) ( CLEAR ?auto_139 ) ( LIFTING ?auto_135 ?auto_131 ) ( IS-CRATE ?auto_131 ) )
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
      ?auto_148 - HOIST
      ?auto_146 - PLACE
      ?auto_144 - PLACE
      ?auto_143 - HOIST
      ?auto_145 - SURFACE
      ?auto_147 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_148 ?auto_146 ) ( IS-CRATE ?auto_142 ) ( not ( = ?auto_141 ?auto_142 ) ) ( not ( = ?auto_140 ?auto_141 ) ) ( not ( = ?auto_140 ?auto_142 ) ) ( not ( = ?auto_144 ?auto_146 ) ) ( HOIST-AT ?auto_143 ?auto_144 ) ( not ( = ?auto_148 ?auto_143 ) ) ( AVAILABLE ?auto_143 ) ( SURFACE-AT ?auto_142 ?auto_144 ) ( ON ?auto_142 ?auto_145 ) ( CLEAR ?auto_142 ) ( not ( = ?auto_141 ?auto_145 ) ) ( not ( = ?auto_142 ?auto_145 ) ) ( not ( = ?auto_140 ?auto_145 ) ) ( TRUCK-AT ?auto_147 ?auto_146 ) ( SURFACE-AT ?auto_140 ?auto_146 ) ( CLEAR ?auto_140 ) ( LIFTING ?auto_148 ?auto_141 ) ( IS-CRATE ?auto_141 ) )
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
      ?auto_155 - HOIST
      ?auto_154 - PLACE
      ?auto_157 - SURFACE
      ?auto_151 - PLACE
      ?auto_156 - HOIST
      ?auto_152 - SURFACE
      ?auto_153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_155 ?auto_154 ) ( IS-CRATE ?auto_150 ) ( not ( = ?auto_149 ?auto_150 ) ) ( not ( = ?auto_157 ?auto_149 ) ) ( not ( = ?auto_157 ?auto_150 ) ) ( not ( = ?auto_151 ?auto_154 ) ) ( HOIST-AT ?auto_156 ?auto_151 ) ( not ( = ?auto_155 ?auto_156 ) ) ( AVAILABLE ?auto_156 ) ( SURFACE-AT ?auto_150 ?auto_151 ) ( ON ?auto_150 ?auto_152 ) ( CLEAR ?auto_150 ) ( not ( = ?auto_149 ?auto_152 ) ) ( not ( = ?auto_150 ?auto_152 ) ) ( not ( = ?auto_157 ?auto_152 ) ) ( TRUCK-AT ?auto_153 ?auto_154 ) ( SURFACE-AT ?auto_157 ?auto_154 ) ( CLEAR ?auto_157 ) ( IS-CRATE ?auto_149 ) ( AVAILABLE ?auto_155 ) ( IN ?auto_149 ?auto_153 ) )
    :subtasks
    ( ( !UNLOAD ?auto_155 ?auto_149 ?auto_153 ?auto_154 )
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
      ?auto_161 - PLACE
      ?auto_165 - PLACE
      ?auto_163 - HOIST
      ?auto_162 - SURFACE
      ?auto_164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_166 ?auto_161 ) ( IS-CRATE ?auto_160 ) ( not ( = ?auto_159 ?auto_160 ) ) ( not ( = ?auto_158 ?auto_159 ) ) ( not ( = ?auto_158 ?auto_160 ) ) ( not ( = ?auto_165 ?auto_161 ) ) ( HOIST-AT ?auto_163 ?auto_165 ) ( not ( = ?auto_166 ?auto_163 ) ) ( AVAILABLE ?auto_163 ) ( SURFACE-AT ?auto_160 ?auto_165 ) ( ON ?auto_160 ?auto_162 ) ( CLEAR ?auto_160 ) ( not ( = ?auto_159 ?auto_162 ) ) ( not ( = ?auto_160 ?auto_162 ) ) ( not ( = ?auto_158 ?auto_162 ) ) ( TRUCK-AT ?auto_164 ?auto_161 ) ( SURFACE-AT ?auto_158 ?auto_161 ) ( CLEAR ?auto_158 ) ( IS-CRATE ?auto_159 ) ( AVAILABLE ?auto_166 ) ( IN ?auto_159 ?auto_164 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_159 ?auto_160 )
      ( MAKE-2CRATE-VERIFY ?auto_158 ?auto_159 ?auto_160 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_203 - SURFACE
      ?auto_204 - SURFACE
    )
    :vars
    (
      ?auto_206 - HOIST
      ?auto_211 - PLACE
      ?auto_210 - SURFACE
      ?auto_209 - PLACE
      ?auto_205 - HOIST
      ?auto_207 - SURFACE
      ?auto_208 - TRUCK
      ?auto_212 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_206 ?auto_211 ) ( SURFACE-AT ?auto_203 ?auto_211 ) ( CLEAR ?auto_203 ) ( IS-CRATE ?auto_204 ) ( not ( = ?auto_203 ?auto_204 ) ) ( AVAILABLE ?auto_206 ) ( ON ?auto_203 ?auto_210 ) ( not ( = ?auto_210 ?auto_203 ) ) ( not ( = ?auto_210 ?auto_204 ) ) ( not ( = ?auto_209 ?auto_211 ) ) ( HOIST-AT ?auto_205 ?auto_209 ) ( not ( = ?auto_206 ?auto_205 ) ) ( AVAILABLE ?auto_205 ) ( SURFACE-AT ?auto_204 ?auto_209 ) ( ON ?auto_204 ?auto_207 ) ( CLEAR ?auto_204 ) ( not ( = ?auto_203 ?auto_207 ) ) ( not ( = ?auto_204 ?auto_207 ) ) ( not ( = ?auto_210 ?auto_207 ) ) ( TRUCK-AT ?auto_208 ?auto_212 ) ( not ( = ?auto_212 ?auto_211 ) ) ( not ( = ?auto_209 ?auto_212 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_208 ?auto_212 ?auto_211 )
      ( MAKE-1CRATE ?auto_203 ?auto_204 )
      ( MAKE-1CRATE-VERIFY ?auto_203 ?auto_204 ) )
  )

)

