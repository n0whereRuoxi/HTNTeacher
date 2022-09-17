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
      ?auto_2 - SURFACE
      ?auto_3 - SURFACE
    )
    :vars
    (
      ?auto_4 - HOIST
      ?auto_5 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4 ?auto_5 ) ( SURFACE-AT ?auto_3 ?auto_5 ) ( CLEAR ?auto_3 ) ( LIFTING ?auto_4 ?auto_2 ) ( IS-CRATE ?auto_2 ) ( not ( = ?auto_2 ?auto_3 ) ) )
    :subtasks
    ( ( !DROP ?auto_4 ?auto_2 ?auto_3 ?auto_5 )
      ( MAKE-ON-VERIFY ?auto_2 ?auto_3 ) )
  )

  ( :method MAKE-ON
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
    ( and ( HOIST-AT ?auto_9 ?auto_8 ) ( SURFACE-AT ?auto_7 ?auto_8 ) ( CLEAR ?auto_7 ) ( IS-CRATE ?auto_6 ) ( not ( = ?auto_6 ?auto_7 ) ) ( TRUCK-AT ?auto_10 ?auto_8 ) ( AVAILABLE ?auto_9 ) ( IN ?auto_6 ?auto_10 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9 ?auto_6 ?auto_10 ?auto_8 )
      ( MAKE-ON ?auto_6 ?auto_7 )
      ( MAKE-ON-VERIFY ?auto_6 ?auto_7 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_11 - SURFACE
      ?auto_12 - SURFACE
    )
    :vars
    (
      ?auto_15 - HOIST
      ?auto_13 - PLACE
      ?auto_14 - TRUCK
      ?auto_16 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15 ?auto_13 ) ( SURFACE-AT ?auto_12 ?auto_13 ) ( CLEAR ?auto_12 ) ( IS-CRATE ?auto_11 ) ( not ( = ?auto_11 ?auto_12 ) ) ( AVAILABLE ?auto_15 ) ( IN ?auto_11 ?auto_14 ) ( TRUCK-AT ?auto_14 ?auto_16 ) ( not ( = ?auto_16 ?auto_13 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14 ?auto_16 ?auto_13 )
      ( MAKE-ON ?auto_11 ?auto_12 )
      ( MAKE-ON-VERIFY ?auto_11 ?auto_12 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_17 - SURFACE
      ?auto_18 - SURFACE
    )
    :vars
    (
      ?auto_21 - HOIST
      ?auto_20 - PLACE
      ?auto_19 - TRUCK
      ?auto_22 - PLACE
      ?auto_23 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_21 ?auto_20 ) ( SURFACE-AT ?auto_18 ?auto_20 ) ( CLEAR ?auto_18 ) ( IS-CRATE ?auto_17 ) ( not ( = ?auto_17 ?auto_18 ) ) ( AVAILABLE ?auto_21 ) ( TRUCK-AT ?auto_19 ?auto_22 ) ( not ( = ?auto_22 ?auto_20 ) ) ( HOIST-AT ?auto_23 ?auto_22 ) ( LIFTING ?auto_23 ?auto_17 ) ( not ( = ?auto_21 ?auto_23 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23 ?auto_17 ?auto_19 ?auto_22 )
      ( MAKE-ON ?auto_17 ?auto_18 )
      ( MAKE-ON-VERIFY ?auto_17 ?auto_18 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_24 - SURFACE
      ?auto_25 - SURFACE
    )
    :vars
    (
      ?auto_26 - HOIST
      ?auto_29 - PLACE
      ?auto_27 - TRUCK
      ?auto_28 - PLACE
      ?auto_30 - HOIST
      ?auto_31 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26 ?auto_29 ) ( SURFACE-AT ?auto_25 ?auto_29 ) ( CLEAR ?auto_25 ) ( IS-CRATE ?auto_24 ) ( not ( = ?auto_24 ?auto_25 ) ) ( AVAILABLE ?auto_26 ) ( TRUCK-AT ?auto_27 ?auto_28 ) ( not ( = ?auto_28 ?auto_29 ) ) ( HOIST-AT ?auto_30 ?auto_28 ) ( not ( = ?auto_26 ?auto_30 ) ) ( AVAILABLE ?auto_30 ) ( SURFACE-AT ?auto_24 ?auto_28 ) ( ON ?auto_24 ?auto_31 ) ( CLEAR ?auto_24 ) ( not ( = ?auto_24 ?auto_31 ) ) ( not ( = ?auto_25 ?auto_31 ) ) )
    :subtasks
    ( ( !LIFT ?auto_30 ?auto_24 ?auto_31 ?auto_28 )
      ( MAKE-ON ?auto_24 ?auto_25 )
      ( MAKE-ON-VERIFY ?auto_24 ?auto_25 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_32 - SURFACE
      ?auto_33 - SURFACE
    )
    :vars
    (
      ?auto_39 - HOIST
      ?auto_38 - PLACE
      ?auto_35 - PLACE
      ?auto_37 - HOIST
      ?auto_34 - SURFACE
      ?auto_36 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39 ?auto_38 ) ( SURFACE-AT ?auto_33 ?auto_38 ) ( CLEAR ?auto_33 ) ( IS-CRATE ?auto_32 ) ( not ( = ?auto_32 ?auto_33 ) ) ( AVAILABLE ?auto_39 ) ( not ( = ?auto_35 ?auto_38 ) ) ( HOIST-AT ?auto_37 ?auto_35 ) ( not ( = ?auto_39 ?auto_37 ) ) ( AVAILABLE ?auto_37 ) ( SURFACE-AT ?auto_32 ?auto_35 ) ( ON ?auto_32 ?auto_34 ) ( CLEAR ?auto_32 ) ( not ( = ?auto_32 ?auto_34 ) ) ( not ( = ?auto_33 ?auto_34 ) ) ( TRUCK-AT ?auto_36 ?auto_38 ) )
    :subtasks
    ( ( !DRIVE ?auto_36 ?auto_38 ?auto_35 )
      ( MAKE-ON ?auto_32 ?auto_33 )
      ( MAKE-ON-VERIFY ?auto_32 ?auto_33 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42 - SURFACE
      ?auto_43 - SURFACE
    )
    :vars
    (
      ?auto_44 - HOIST
      ?auto_45 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44 ?auto_45 ) ( SURFACE-AT ?auto_43 ?auto_45 ) ( CLEAR ?auto_43 ) ( LIFTING ?auto_44 ?auto_42 ) ( IS-CRATE ?auto_42 ) ( not ( = ?auto_42 ?auto_43 ) ) )
    :subtasks
    ( ( !DROP ?auto_44 ?auto_42 ?auto_43 ?auto_45 )
      ( MAKE-ON-VERIFY ?auto_42 ?auto_43 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_46 - SURFACE
      ?auto_47 - SURFACE
    )
    :vars
    (
      ?auto_49 - HOIST
      ?auto_48 - PLACE
      ?auto_50 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49 ?auto_48 ) ( SURFACE-AT ?auto_47 ?auto_48 ) ( CLEAR ?auto_47 ) ( IS-CRATE ?auto_46 ) ( not ( = ?auto_46 ?auto_47 ) ) ( TRUCK-AT ?auto_50 ?auto_48 ) ( AVAILABLE ?auto_49 ) ( IN ?auto_46 ?auto_50 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49 ?auto_46 ?auto_50 ?auto_48 )
      ( MAKE-ON ?auto_46 ?auto_47 )
      ( MAKE-ON-VERIFY ?auto_46 ?auto_47 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_51 - SURFACE
      ?auto_52 - SURFACE
    )
    :vars
    (
      ?auto_55 - HOIST
      ?auto_53 - PLACE
      ?auto_54 - TRUCK
      ?auto_56 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_55 ?auto_53 ) ( SURFACE-AT ?auto_52 ?auto_53 ) ( CLEAR ?auto_52 ) ( IS-CRATE ?auto_51 ) ( not ( = ?auto_51 ?auto_52 ) ) ( AVAILABLE ?auto_55 ) ( IN ?auto_51 ?auto_54 ) ( TRUCK-AT ?auto_54 ?auto_56 ) ( not ( = ?auto_56 ?auto_53 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_54 ?auto_56 ?auto_53 )
      ( MAKE-ON ?auto_51 ?auto_52 )
      ( MAKE-ON-VERIFY ?auto_51 ?auto_52 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57 - SURFACE
      ?auto_58 - SURFACE
    )
    :vars
    (
      ?auto_60 - HOIST
      ?auto_59 - PLACE
      ?auto_61 - TRUCK
      ?auto_62 - PLACE
      ?auto_63 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_60 ?auto_59 ) ( SURFACE-AT ?auto_58 ?auto_59 ) ( CLEAR ?auto_58 ) ( IS-CRATE ?auto_57 ) ( not ( = ?auto_57 ?auto_58 ) ) ( AVAILABLE ?auto_60 ) ( TRUCK-AT ?auto_61 ?auto_62 ) ( not ( = ?auto_62 ?auto_59 ) ) ( HOIST-AT ?auto_63 ?auto_62 ) ( LIFTING ?auto_63 ?auto_57 ) ( not ( = ?auto_60 ?auto_63 ) ) )
    :subtasks
    ( ( !LOAD ?auto_63 ?auto_57 ?auto_61 ?auto_62 )
      ( MAKE-ON ?auto_57 ?auto_58 )
      ( MAKE-ON-VERIFY ?auto_57 ?auto_58 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_64 - SURFACE
      ?auto_65 - SURFACE
    )
    :vars
    (
      ?auto_69 - HOIST
      ?auto_67 - PLACE
      ?auto_68 - TRUCK
      ?auto_66 - PLACE
      ?auto_70 - HOIST
      ?auto_71 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69 ?auto_67 ) ( SURFACE-AT ?auto_65 ?auto_67 ) ( CLEAR ?auto_65 ) ( IS-CRATE ?auto_64 ) ( not ( = ?auto_64 ?auto_65 ) ) ( AVAILABLE ?auto_69 ) ( TRUCK-AT ?auto_68 ?auto_66 ) ( not ( = ?auto_66 ?auto_67 ) ) ( HOIST-AT ?auto_70 ?auto_66 ) ( not ( = ?auto_69 ?auto_70 ) ) ( AVAILABLE ?auto_70 ) ( SURFACE-AT ?auto_64 ?auto_66 ) ( ON ?auto_64 ?auto_71 ) ( CLEAR ?auto_64 ) ( not ( = ?auto_64 ?auto_71 ) ) ( not ( = ?auto_65 ?auto_71 ) ) )
    :subtasks
    ( ( !LIFT ?auto_70 ?auto_64 ?auto_71 ?auto_66 )
      ( MAKE-ON ?auto_64 ?auto_65 )
      ( MAKE-ON-VERIFY ?auto_64 ?auto_65 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_72 - SURFACE
      ?auto_73 - SURFACE
    )
    :vars
    (
      ?auto_78 - HOIST
      ?auto_76 - PLACE
      ?auto_79 - PLACE
      ?auto_77 - HOIST
      ?auto_74 - SURFACE
      ?auto_75 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_78 ?auto_76 ) ( SURFACE-AT ?auto_73 ?auto_76 ) ( CLEAR ?auto_73 ) ( IS-CRATE ?auto_72 ) ( not ( = ?auto_72 ?auto_73 ) ) ( AVAILABLE ?auto_78 ) ( not ( = ?auto_79 ?auto_76 ) ) ( HOIST-AT ?auto_77 ?auto_79 ) ( not ( = ?auto_78 ?auto_77 ) ) ( AVAILABLE ?auto_77 ) ( SURFACE-AT ?auto_72 ?auto_79 ) ( ON ?auto_72 ?auto_74 ) ( CLEAR ?auto_72 ) ( not ( = ?auto_72 ?auto_74 ) ) ( not ( = ?auto_73 ?auto_74 ) ) ( TRUCK-AT ?auto_75 ?auto_76 ) )
    :subtasks
    ( ( !DRIVE ?auto_75 ?auto_76 ?auto_79 )
      ( MAKE-ON ?auto_72 ?auto_73 )
      ( MAKE-ON-VERIFY ?auto_72 ?auto_73 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_80 - SURFACE
      ?auto_81 - SURFACE
    )
    :vars
    (
      ?auto_84 - HOIST
      ?auto_83 - PLACE
      ?auto_86 - PLACE
      ?auto_82 - HOIST
      ?auto_87 - SURFACE
      ?auto_85 - TRUCK
      ?auto_88 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_84 ?auto_83 ) ( IS-CRATE ?auto_80 ) ( not ( = ?auto_80 ?auto_81 ) ) ( not ( = ?auto_86 ?auto_83 ) ) ( HOIST-AT ?auto_82 ?auto_86 ) ( not ( = ?auto_84 ?auto_82 ) ) ( AVAILABLE ?auto_82 ) ( SURFACE-AT ?auto_80 ?auto_86 ) ( ON ?auto_80 ?auto_87 ) ( CLEAR ?auto_80 ) ( not ( = ?auto_80 ?auto_87 ) ) ( not ( = ?auto_81 ?auto_87 ) ) ( TRUCK-AT ?auto_85 ?auto_83 ) ( SURFACE-AT ?auto_88 ?auto_83 ) ( CLEAR ?auto_88 ) ( LIFTING ?auto_84 ?auto_81 ) ( IS-CRATE ?auto_81 ) ( not ( = ?auto_80 ?auto_88 ) ) ( not ( = ?auto_81 ?auto_88 ) ) ( not ( = ?auto_87 ?auto_88 ) ) )
    :subtasks
    ( ( !DROP ?auto_84 ?auto_81 ?auto_88 ?auto_83 )
      ( MAKE-ON ?auto_80 ?auto_81 )
      ( MAKE-ON-VERIFY ?auto_80 ?auto_81 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_89 - SURFACE
      ?auto_90 - SURFACE
    )
    :vars
    (
      ?auto_93 - HOIST
      ?auto_92 - PLACE
      ?auto_94 - PLACE
      ?auto_95 - HOIST
      ?auto_91 - SURFACE
      ?auto_96 - TRUCK
      ?auto_97 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_93 ?auto_92 ) ( IS-CRATE ?auto_89 ) ( not ( = ?auto_89 ?auto_90 ) ) ( not ( = ?auto_94 ?auto_92 ) ) ( HOIST-AT ?auto_95 ?auto_94 ) ( not ( = ?auto_93 ?auto_95 ) ) ( AVAILABLE ?auto_95 ) ( SURFACE-AT ?auto_89 ?auto_94 ) ( ON ?auto_89 ?auto_91 ) ( CLEAR ?auto_89 ) ( not ( = ?auto_89 ?auto_91 ) ) ( not ( = ?auto_90 ?auto_91 ) ) ( TRUCK-AT ?auto_96 ?auto_92 ) ( SURFACE-AT ?auto_97 ?auto_92 ) ( CLEAR ?auto_97 ) ( IS-CRATE ?auto_90 ) ( not ( = ?auto_89 ?auto_97 ) ) ( not ( = ?auto_90 ?auto_97 ) ) ( not ( = ?auto_91 ?auto_97 ) ) ( AVAILABLE ?auto_93 ) ( IN ?auto_90 ?auto_96 ) )
    :subtasks
    ( ( !UNLOAD ?auto_93 ?auto_90 ?auto_96 ?auto_92 )
      ( MAKE-ON ?auto_89 ?auto_90 )
      ( MAKE-ON-VERIFY ?auto_89 ?auto_90 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_98 - SURFACE
      ?auto_99 - SURFACE
    )
    :vars
    (
      ?auto_106 - HOIST
      ?auto_105 - PLACE
      ?auto_103 - PLACE
      ?auto_104 - HOIST
      ?auto_101 - SURFACE
      ?auto_100 - SURFACE
      ?auto_102 - TRUCK
      ?auto_107 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_106 ?auto_105 ) ( IS-CRATE ?auto_98 ) ( not ( = ?auto_98 ?auto_99 ) ) ( not ( = ?auto_103 ?auto_105 ) ) ( HOIST-AT ?auto_104 ?auto_103 ) ( not ( = ?auto_106 ?auto_104 ) ) ( AVAILABLE ?auto_104 ) ( SURFACE-AT ?auto_98 ?auto_103 ) ( ON ?auto_98 ?auto_101 ) ( CLEAR ?auto_98 ) ( not ( = ?auto_98 ?auto_101 ) ) ( not ( = ?auto_99 ?auto_101 ) ) ( SURFACE-AT ?auto_100 ?auto_105 ) ( CLEAR ?auto_100 ) ( IS-CRATE ?auto_99 ) ( not ( = ?auto_98 ?auto_100 ) ) ( not ( = ?auto_99 ?auto_100 ) ) ( not ( = ?auto_101 ?auto_100 ) ) ( AVAILABLE ?auto_106 ) ( IN ?auto_99 ?auto_102 ) ( TRUCK-AT ?auto_102 ?auto_107 ) ( not ( = ?auto_107 ?auto_105 ) ) ( not ( = ?auto_103 ?auto_107 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_102 ?auto_107 ?auto_105 )
      ( MAKE-ON ?auto_98 ?auto_99 )
      ( MAKE-ON-VERIFY ?auto_98 ?auto_99 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_108 - SURFACE
      ?auto_109 - SURFACE
    )
    :vars
    (
      ?auto_110 - HOIST
      ?auto_115 - PLACE
      ?auto_111 - PLACE
      ?auto_112 - HOIST
      ?auto_113 - SURFACE
      ?auto_117 - SURFACE
      ?auto_114 - TRUCK
      ?auto_116 - PLACE
      ?auto_118 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_110 ?auto_115 ) ( IS-CRATE ?auto_108 ) ( not ( = ?auto_108 ?auto_109 ) ) ( not ( = ?auto_111 ?auto_115 ) ) ( HOIST-AT ?auto_112 ?auto_111 ) ( not ( = ?auto_110 ?auto_112 ) ) ( AVAILABLE ?auto_112 ) ( SURFACE-AT ?auto_108 ?auto_111 ) ( ON ?auto_108 ?auto_113 ) ( CLEAR ?auto_108 ) ( not ( = ?auto_108 ?auto_113 ) ) ( not ( = ?auto_109 ?auto_113 ) ) ( SURFACE-AT ?auto_117 ?auto_115 ) ( CLEAR ?auto_117 ) ( IS-CRATE ?auto_109 ) ( not ( = ?auto_108 ?auto_117 ) ) ( not ( = ?auto_109 ?auto_117 ) ) ( not ( = ?auto_113 ?auto_117 ) ) ( AVAILABLE ?auto_110 ) ( TRUCK-AT ?auto_114 ?auto_116 ) ( not ( = ?auto_116 ?auto_115 ) ) ( not ( = ?auto_111 ?auto_116 ) ) ( HOIST-AT ?auto_118 ?auto_116 ) ( LIFTING ?auto_118 ?auto_109 ) ( not ( = ?auto_110 ?auto_118 ) ) ( not ( = ?auto_112 ?auto_118 ) ) )
    :subtasks
    ( ( !LOAD ?auto_118 ?auto_109 ?auto_114 ?auto_116 )
      ( MAKE-ON ?auto_108 ?auto_109 )
      ( MAKE-ON-VERIFY ?auto_108 ?auto_109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_119 - SURFACE
      ?auto_120 - SURFACE
    )
    :vars
    (
      ?auto_129 - HOIST
      ?auto_125 - PLACE
      ?auto_127 - PLACE
      ?auto_124 - HOIST
      ?auto_121 - SURFACE
      ?auto_123 - SURFACE
      ?auto_126 - TRUCK
      ?auto_122 - PLACE
      ?auto_128 - HOIST
      ?auto_130 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_129 ?auto_125 ) ( IS-CRATE ?auto_119 ) ( not ( = ?auto_119 ?auto_120 ) ) ( not ( = ?auto_127 ?auto_125 ) ) ( HOIST-AT ?auto_124 ?auto_127 ) ( not ( = ?auto_129 ?auto_124 ) ) ( AVAILABLE ?auto_124 ) ( SURFACE-AT ?auto_119 ?auto_127 ) ( ON ?auto_119 ?auto_121 ) ( CLEAR ?auto_119 ) ( not ( = ?auto_119 ?auto_121 ) ) ( not ( = ?auto_120 ?auto_121 ) ) ( SURFACE-AT ?auto_123 ?auto_125 ) ( CLEAR ?auto_123 ) ( IS-CRATE ?auto_120 ) ( not ( = ?auto_119 ?auto_123 ) ) ( not ( = ?auto_120 ?auto_123 ) ) ( not ( = ?auto_121 ?auto_123 ) ) ( AVAILABLE ?auto_129 ) ( TRUCK-AT ?auto_126 ?auto_122 ) ( not ( = ?auto_122 ?auto_125 ) ) ( not ( = ?auto_127 ?auto_122 ) ) ( HOIST-AT ?auto_128 ?auto_122 ) ( not ( = ?auto_129 ?auto_128 ) ) ( not ( = ?auto_124 ?auto_128 ) ) ( AVAILABLE ?auto_128 ) ( SURFACE-AT ?auto_120 ?auto_122 ) ( ON ?auto_120 ?auto_130 ) ( CLEAR ?auto_120 ) ( not ( = ?auto_119 ?auto_130 ) ) ( not ( = ?auto_120 ?auto_130 ) ) ( not ( = ?auto_121 ?auto_130 ) ) ( not ( = ?auto_123 ?auto_130 ) ) )
    :subtasks
    ( ( !LIFT ?auto_128 ?auto_120 ?auto_130 ?auto_122 )
      ( MAKE-ON ?auto_119 ?auto_120 )
      ( MAKE-ON-VERIFY ?auto_119 ?auto_120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_131 - SURFACE
      ?auto_132 - SURFACE
    )
    :vars
    (
      ?auto_137 - HOIST
      ?auto_133 - PLACE
      ?auto_141 - PLACE
      ?auto_136 - HOIST
      ?auto_135 - SURFACE
      ?auto_139 - SURFACE
      ?auto_140 - PLACE
      ?auto_138 - HOIST
      ?auto_142 - SURFACE
      ?auto_134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_137 ?auto_133 ) ( IS-CRATE ?auto_131 ) ( not ( = ?auto_131 ?auto_132 ) ) ( not ( = ?auto_141 ?auto_133 ) ) ( HOIST-AT ?auto_136 ?auto_141 ) ( not ( = ?auto_137 ?auto_136 ) ) ( AVAILABLE ?auto_136 ) ( SURFACE-AT ?auto_131 ?auto_141 ) ( ON ?auto_131 ?auto_135 ) ( CLEAR ?auto_131 ) ( not ( = ?auto_131 ?auto_135 ) ) ( not ( = ?auto_132 ?auto_135 ) ) ( SURFACE-AT ?auto_139 ?auto_133 ) ( CLEAR ?auto_139 ) ( IS-CRATE ?auto_132 ) ( not ( = ?auto_131 ?auto_139 ) ) ( not ( = ?auto_132 ?auto_139 ) ) ( not ( = ?auto_135 ?auto_139 ) ) ( AVAILABLE ?auto_137 ) ( not ( = ?auto_140 ?auto_133 ) ) ( not ( = ?auto_141 ?auto_140 ) ) ( HOIST-AT ?auto_138 ?auto_140 ) ( not ( = ?auto_137 ?auto_138 ) ) ( not ( = ?auto_136 ?auto_138 ) ) ( AVAILABLE ?auto_138 ) ( SURFACE-AT ?auto_132 ?auto_140 ) ( ON ?auto_132 ?auto_142 ) ( CLEAR ?auto_132 ) ( not ( = ?auto_131 ?auto_142 ) ) ( not ( = ?auto_132 ?auto_142 ) ) ( not ( = ?auto_135 ?auto_142 ) ) ( not ( = ?auto_139 ?auto_142 ) ) ( TRUCK-AT ?auto_134 ?auto_133 ) )
    :subtasks
    ( ( !DRIVE ?auto_134 ?auto_133 ?auto_140 )
      ( MAKE-ON ?auto_131 ?auto_132 )
      ( MAKE-ON-VERIFY ?auto_131 ?auto_132 ) )
  )

)

