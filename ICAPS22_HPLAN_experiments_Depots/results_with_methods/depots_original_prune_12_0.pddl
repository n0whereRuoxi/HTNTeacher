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
      ?auto_34110 - SURFACE
      ?auto_34111 - SURFACE
    )
    :vars
    (
      ?auto_34112 - HOIST
      ?auto_34113 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34112 ?auto_34113 ) ( SURFACE-AT ?auto_34111 ?auto_34113 ) ( CLEAR ?auto_34111 ) ( LIFTING ?auto_34112 ?auto_34110 ) ( IS-CRATE ?auto_34110 ) ( not ( = ?auto_34110 ?auto_34111 ) ) )
    :subtasks
    ( ( !DROP ?auto_34112 ?auto_34110 ?auto_34111 ?auto_34113 )
      ( MAKE-ON-VERIFY ?auto_34110 ?auto_34111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34114 - SURFACE
      ?auto_34115 - SURFACE
    )
    :vars
    (
      ?auto_34116 - HOIST
      ?auto_34117 - PLACE
      ?auto_34118 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34116 ?auto_34117 ) ( SURFACE-AT ?auto_34115 ?auto_34117 ) ( CLEAR ?auto_34115 ) ( IS-CRATE ?auto_34114 ) ( not ( = ?auto_34114 ?auto_34115 ) ) ( TRUCK-AT ?auto_34118 ?auto_34117 ) ( AVAILABLE ?auto_34116 ) ( IN ?auto_34114 ?auto_34118 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34116 ?auto_34114 ?auto_34118 ?auto_34117 )
      ( MAKE-ON ?auto_34114 ?auto_34115 )
      ( MAKE-ON-VERIFY ?auto_34114 ?auto_34115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34119 - SURFACE
      ?auto_34120 - SURFACE
    )
    :vars
    (
      ?auto_34122 - HOIST
      ?auto_34121 - PLACE
      ?auto_34123 - TRUCK
      ?auto_34124 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34122 ?auto_34121 ) ( SURFACE-AT ?auto_34120 ?auto_34121 ) ( CLEAR ?auto_34120 ) ( IS-CRATE ?auto_34119 ) ( not ( = ?auto_34119 ?auto_34120 ) ) ( AVAILABLE ?auto_34122 ) ( IN ?auto_34119 ?auto_34123 ) ( TRUCK-AT ?auto_34123 ?auto_34124 ) ( not ( = ?auto_34124 ?auto_34121 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34123 ?auto_34124 ?auto_34121 )
      ( MAKE-ON ?auto_34119 ?auto_34120 )
      ( MAKE-ON-VERIFY ?auto_34119 ?auto_34120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34125 - SURFACE
      ?auto_34126 - SURFACE
    )
    :vars
    (
      ?auto_34129 - HOIST
      ?auto_34130 - PLACE
      ?auto_34128 - TRUCK
      ?auto_34127 - PLACE
      ?auto_34131 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_34129 ?auto_34130 ) ( SURFACE-AT ?auto_34126 ?auto_34130 ) ( CLEAR ?auto_34126 ) ( IS-CRATE ?auto_34125 ) ( not ( = ?auto_34125 ?auto_34126 ) ) ( AVAILABLE ?auto_34129 ) ( TRUCK-AT ?auto_34128 ?auto_34127 ) ( not ( = ?auto_34127 ?auto_34130 ) ) ( HOIST-AT ?auto_34131 ?auto_34127 ) ( LIFTING ?auto_34131 ?auto_34125 ) ( not ( = ?auto_34129 ?auto_34131 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34131 ?auto_34125 ?auto_34128 ?auto_34127 )
      ( MAKE-ON ?auto_34125 ?auto_34126 )
      ( MAKE-ON-VERIFY ?auto_34125 ?auto_34126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34132 - SURFACE
      ?auto_34133 - SURFACE
    )
    :vars
    (
      ?auto_34134 - HOIST
      ?auto_34138 - PLACE
      ?auto_34135 - TRUCK
      ?auto_34137 - PLACE
      ?auto_34136 - HOIST
      ?auto_34139 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34134 ?auto_34138 ) ( SURFACE-AT ?auto_34133 ?auto_34138 ) ( CLEAR ?auto_34133 ) ( IS-CRATE ?auto_34132 ) ( not ( = ?auto_34132 ?auto_34133 ) ) ( AVAILABLE ?auto_34134 ) ( TRUCK-AT ?auto_34135 ?auto_34137 ) ( not ( = ?auto_34137 ?auto_34138 ) ) ( HOIST-AT ?auto_34136 ?auto_34137 ) ( not ( = ?auto_34134 ?auto_34136 ) ) ( AVAILABLE ?auto_34136 ) ( SURFACE-AT ?auto_34132 ?auto_34137 ) ( ON ?auto_34132 ?auto_34139 ) ( CLEAR ?auto_34132 ) ( not ( = ?auto_34132 ?auto_34139 ) ) ( not ( = ?auto_34133 ?auto_34139 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34136 ?auto_34132 ?auto_34139 ?auto_34137 )
      ( MAKE-ON ?auto_34132 ?auto_34133 )
      ( MAKE-ON-VERIFY ?auto_34132 ?auto_34133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34140 - SURFACE
      ?auto_34141 - SURFACE
    )
    :vars
    (
      ?auto_34142 - HOIST
      ?auto_34144 - PLACE
      ?auto_34146 - PLACE
      ?auto_34147 - HOIST
      ?auto_34145 - SURFACE
      ?auto_34143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34142 ?auto_34144 ) ( SURFACE-AT ?auto_34141 ?auto_34144 ) ( CLEAR ?auto_34141 ) ( IS-CRATE ?auto_34140 ) ( not ( = ?auto_34140 ?auto_34141 ) ) ( AVAILABLE ?auto_34142 ) ( not ( = ?auto_34146 ?auto_34144 ) ) ( HOIST-AT ?auto_34147 ?auto_34146 ) ( not ( = ?auto_34142 ?auto_34147 ) ) ( AVAILABLE ?auto_34147 ) ( SURFACE-AT ?auto_34140 ?auto_34146 ) ( ON ?auto_34140 ?auto_34145 ) ( CLEAR ?auto_34140 ) ( not ( = ?auto_34140 ?auto_34145 ) ) ( not ( = ?auto_34141 ?auto_34145 ) ) ( TRUCK-AT ?auto_34143 ?auto_34144 ) )
    :subtasks
    ( ( !DRIVE ?auto_34143 ?auto_34144 ?auto_34146 )
      ( MAKE-ON ?auto_34140 ?auto_34141 )
      ( MAKE-ON-VERIFY ?auto_34140 ?auto_34141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34188 - SURFACE
      ?auto_34189 - SURFACE
    )
    :vars
    (
      ?auto_34195 - HOIST
      ?auto_34191 - PLACE
      ?auto_34193 - PLACE
      ?auto_34194 - HOIST
      ?auto_34190 - SURFACE
      ?auto_34192 - TRUCK
      ?auto_34196 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34195 ?auto_34191 ) ( IS-CRATE ?auto_34188 ) ( not ( = ?auto_34188 ?auto_34189 ) ) ( not ( = ?auto_34193 ?auto_34191 ) ) ( HOIST-AT ?auto_34194 ?auto_34193 ) ( not ( = ?auto_34195 ?auto_34194 ) ) ( AVAILABLE ?auto_34194 ) ( SURFACE-AT ?auto_34188 ?auto_34193 ) ( ON ?auto_34188 ?auto_34190 ) ( CLEAR ?auto_34188 ) ( not ( = ?auto_34188 ?auto_34190 ) ) ( not ( = ?auto_34189 ?auto_34190 ) ) ( TRUCK-AT ?auto_34192 ?auto_34191 ) ( SURFACE-AT ?auto_34196 ?auto_34191 ) ( CLEAR ?auto_34196 ) ( LIFTING ?auto_34195 ?auto_34189 ) ( IS-CRATE ?auto_34189 ) ( not ( = ?auto_34188 ?auto_34196 ) ) ( not ( = ?auto_34189 ?auto_34196 ) ) ( not ( = ?auto_34190 ?auto_34196 ) ) )
    :subtasks
    ( ( !DROP ?auto_34195 ?auto_34189 ?auto_34196 ?auto_34191 )
      ( MAKE-ON ?auto_34188 ?auto_34189 )
      ( MAKE-ON-VERIFY ?auto_34188 ?auto_34189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34197 - SURFACE
      ?auto_34198 - SURFACE
    )
    :vars
    (
      ?auto_34205 - HOIST
      ?auto_34200 - PLACE
      ?auto_34202 - PLACE
      ?auto_34203 - HOIST
      ?auto_34204 - SURFACE
      ?auto_34199 - TRUCK
      ?auto_34201 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34205 ?auto_34200 ) ( IS-CRATE ?auto_34197 ) ( not ( = ?auto_34197 ?auto_34198 ) ) ( not ( = ?auto_34202 ?auto_34200 ) ) ( HOIST-AT ?auto_34203 ?auto_34202 ) ( not ( = ?auto_34205 ?auto_34203 ) ) ( AVAILABLE ?auto_34203 ) ( SURFACE-AT ?auto_34197 ?auto_34202 ) ( ON ?auto_34197 ?auto_34204 ) ( CLEAR ?auto_34197 ) ( not ( = ?auto_34197 ?auto_34204 ) ) ( not ( = ?auto_34198 ?auto_34204 ) ) ( TRUCK-AT ?auto_34199 ?auto_34200 ) ( SURFACE-AT ?auto_34201 ?auto_34200 ) ( CLEAR ?auto_34201 ) ( IS-CRATE ?auto_34198 ) ( not ( = ?auto_34197 ?auto_34201 ) ) ( not ( = ?auto_34198 ?auto_34201 ) ) ( not ( = ?auto_34204 ?auto_34201 ) ) ( AVAILABLE ?auto_34205 ) ( IN ?auto_34198 ?auto_34199 ) )
    :subtasks
    ( ( !UNLOAD ?auto_34205 ?auto_34198 ?auto_34199 ?auto_34200 )
      ( MAKE-ON ?auto_34197 ?auto_34198 )
      ( MAKE-ON-VERIFY ?auto_34197 ?auto_34198 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34212 - SURFACE
      ?auto_34213 - SURFACE
    )
    :vars
    (
      ?auto_34219 - HOIST
      ?auto_34215 - PLACE
      ?auto_34218 - PLACE
      ?auto_34214 - HOIST
      ?auto_34217 - SURFACE
      ?auto_34216 - TRUCK
      ?auto_34220 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34219 ?auto_34215 ) ( SURFACE-AT ?auto_34213 ?auto_34215 ) ( CLEAR ?auto_34213 ) ( IS-CRATE ?auto_34212 ) ( not ( = ?auto_34212 ?auto_34213 ) ) ( AVAILABLE ?auto_34219 ) ( not ( = ?auto_34218 ?auto_34215 ) ) ( HOIST-AT ?auto_34214 ?auto_34218 ) ( not ( = ?auto_34219 ?auto_34214 ) ) ( AVAILABLE ?auto_34214 ) ( SURFACE-AT ?auto_34212 ?auto_34218 ) ( ON ?auto_34212 ?auto_34217 ) ( CLEAR ?auto_34212 ) ( not ( = ?auto_34212 ?auto_34217 ) ) ( not ( = ?auto_34213 ?auto_34217 ) ) ( TRUCK-AT ?auto_34216 ?auto_34220 ) ( not ( = ?auto_34220 ?auto_34215 ) ) ( not ( = ?auto_34218 ?auto_34220 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_34216 ?auto_34220 ?auto_34215 )
      ( MAKE-ON ?auto_34212 ?auto_34213 )
      ( MAKE-ON-VERIFY ?auto_34212 ?auto_34213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34627 - SURFACE
      ?auto_34628 - SURFACE
    )
    :vars
    (
      ?auto_34632 - HOIST
      ?auto_34634 - PLACE
      ?auto_34633 - TRUCK
      ?auto_34629 - PLACE
      ?auto_34631 - HOIST
      ?auto_34630 - SURFACE
      ?auto_34635 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34632 ?auto_34634 ) ( SURFACE-AT ?auto_34628 ?auto_34634 ) ( CLEAR ?auto_34628 ) ( IS-CRATE ?auto_34627 ) ( not ( = ?auto_34627 ?auto_34628 ) ) ( AVAILABLE ?auto_34632 ) ( TRUCK-AT ?auto_34633 ?auto_34629 ) ( not ( = ?auto_34629 ?auto_34634 ) ) ( HOIST-AT ?auto_34631 ?auto_34629 ) ( not ( = ?auto_34632 ?auto_34631 ) ) ( SURFACE-AT ?auto_34627 ?auto_34629 ) ( ON ?auto_34627 ?auto_34630 ) ( CLEAR ?auto_34627 ) ( not ( = ?auto_34627 ?auto_34630 ) ) ( not ( = ?auto_34628 ?auto_34630 ) ) ( LIFTING ?auto_34631 ?auto_34635 ) ( IS-CRATE ?auto_34635 ) ( not ( = ?auto_34627 ?auto_34635 ) ) ( not ( = ?auto_34628 ?auto_34635 ) ) ( not ( = ?auto_34630 ?auto_34635 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34631 ?auto_34635 ?auto_34633 ?auto_34629 )
      ( MAKE-ON ?auto_34627 ?auto_34628 )
      ( MAKE-ON-VERIFY ?auto_34627 ?auto_34628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34767 - SURFACE
      ?auto_34768 - SURFACE
    )
    :vars
    (
      ?auto_34771 - HOIST
      ?auto_34774 - PLACE
      ?auto_34769 - PLACE
      ?auto_34773 - HOIST
      ?auto_34770 - SURFACE
      ?auto_34772 - TRUCK
      ?auto_34775 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34771 ?auto_34774 ) ( SURFACE-AT ?auto_34768 ?auto_34774 ) ( CLEAR ?auto_34768 ) ( IS-CRATE ?auto_34767 ) ( not ( = ?auto_34767 ?auto_34768 ) ) ( not ( = ?auto_34769 ?auto_34774 ) ) ( HOIST-AT ?auto_34773 ?auto_34769 ) ( not ( = ?auto_34771 ?auto_34773 ) ) ( AVAILABLE ?auto_34773 ) ( SURFACE-AT ?auto_34767 ?auto_34769 ) ( ON ?auto_34767 ?auto_34770 ) ( CLEAR ?auto_34767 ) ( not ( = ?auto_34767 ?auto_34770 ) ) ( not ( = ?auto_34768 ?auto_34770 ) ) ( TRUCK-AT ?auto_34772 ?auto_34774 ) ( LIFTING ?auto_34771 ?auto_34775 ) ( IS-CRATE ?auto_34775 ) ( not ( = ?auto_34767 ?auto_34775 ) ) ( not ( = ?auto_34768 ?auto_34775 ) ) ( not ( = ?auto_34770 ?auto_34775 ) ) )
    :subtasks
    ( ( !LOAD ?auto_34771 ?auto_34775 ?auto_34772 ?auto_34774 )
      ( MAKE-ON ?auto_34767 ?auto_34768 )
      ( MAKE-ON-VERIFY ?auto_34767 ?auto_34768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34838 - SURFACE
      ?auto_34839 - SURFACE
    )
    :vars
    (
      ?auto_34846 - HOIST
      ?auto_34843 - PLACE
      ?auto_34840 - PLACE
      ?auto_34844 - HOIST
      ?auto_34845 - SURFACE
      ?auto_34842 - SURFACE
      ?auto_34841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34846 ?auto_34843 ) ( IS-CRATE ?auto_34838 ) ( not ( = ?auto_34838 ?auto_34839 ) ) ( not ( = ?auto_34840 ?auto_34843 ) ) ( HOIST-AT ?auto_34844 ?auto_34840 ) ( not ( = ?auto_34846 ?auto_34844 ) ) ( AVAILABLE ?auto_34844 ) ( SURFACE-AT ?auto_34838 ?auto_34840 ) ( ON ?auto_34838 ?auto_34845 ) ( CLEAR ?auto_34838 ) ( not ( = ?auto_34838 ?auto_34845 ) ) ( not ( = ?auto_34839 ?auto_34845 ) ) ( SURFACE-AT ?auto_34842 ?auto_34843 ) ( CLEAR ?auto_34842 ) ( IS-CRATE ?auto_34839 ) ( not ( = ?auto_34838 ?auto_34842 ) ) ( not ( = ?auto_34839 ?auto_34842 ) ) ( not ( = ?auto_34845 ?auto_34842 ) ) ( AVAILABLE ?auto_34846 ) ( IN ?auto_34839 ?auto_34841 ) ( TRUCK-AT ?auto_34841 ?auto_34840 ) )
    :subtasks
    ( ( !DRIVE ?auto_34841 ?auto_34840 ?auto_34843 )
      ( MAKE-ON ?auto_34838 ?auto_34839 )
      ( MAKE-ON-VERIFY ?auto_34838 ?auto_34839 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34847 - SURFACE
      ?auto_34848 - SURFACE
    )
    :vars
    (
      ?auto_34850 - HOIST
      ?auto_34849 - PLACE
      ?auto_34851 - PLACE
      ?auto_34855 - HOIST
      ?auto_34854 - SURFACE
      ?auto_34853 - SURFACE
      ?auto_34852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34850 ?auto_34849 ) ( IS-CRATE ?auto_34847 ) ( not ( = ?auto_34847 ?auto_34848 ) ) ( not ( = ?auto_34851 ?auto_34849 ) ) ( HOIST-AT ?auto_34855 ?auto_34851 ) ( not ( = ?auto_34850 ?auto_34855 ) ) ( SURFACE-AT ?auto_34847 ?auto_34851 ) ( ON ?auto_34847 ?auto_34854 ) ( CLEAR ?auto_34847 ) ( not ( = ?auto_34847 ?auto_34854 ) ) ( not ( = ?auto_34848 ?auto_34854 ) ) ( SURFACE-AT ?auto_34853 ?auto_34849 ) ( CLEAR ?auto_34853 ) ( IS-CRATE ?auto_34848 ) ( not ( = ?auto_34847 ?auto_34853 ) ) ( not ( = ?auto_34848 ?auto_34853 ) ) ( not ( = ?auto_34854 ?auto_34853 ) ) ( AVAILABLE ?auto_34850 ) ( TRUCK-AT ?auto_34852 ?auto_34851 ) ( LIFTING ?auto_34855 ?auto_34848 ) )
    :subtasks
    ( ( !LOAD ?auto_34855 ?auto_34848 ?auto_34852 ?auto_34851 )
      ( MAKE-ON ?auto_34847 ?auto_34848 )
      ( MAKE-ON-VERIFY ?auto_34847 ?auto_34848 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34856 - SURFACE
      ?auto_34857 - SURFACE
    )
    :vars
    (
      ?auto_34860 - HOIST
      ?auto_34863 - PLACE
      ?auto_34864 - PLACE
      ?auto_34858 - HOIST
      ?auto_34861 - SURFACE
      ?auto_34862 - SURFACE
      ?auto_34859 - TRUCK
      ?auto_34865 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34860 ?auto_34863 ) ( IS-CRATE ?auto_34856 ) ( not ( = ?auto_34856 ?auto_34857 ) ) ( not ( = ?auto_34864 ?auto_34863 ) ) ( HOIST-AT ?auto_34858 ?auto_34864 ) ( not ( = ?auto_34860 ?auto_34858 ) ) ( SURFACE-AT ?auto_34856 ?auto_34864 ) ( ON ?auto_34856 ?auto_34861 ) ( CLEAR ?auto_34856 ) ( not ( = ?auto_34856 ?auto_34861 ) ) ( not ( = ?auto_34857 ?auto_34861 ) ) ( SURFACE-AT ?auto_34862 ?auto_34863 ) ( CLEAR ?auto_34862 ) ( IS-CRATE ?auto_34857 ) ( not ( = ?auto_34856 ?auto_34862 ) ) ( not ( = ?auto_34857 ?auto_34862 ) ) ( not ( = ?auto_34861 ?auto_34862 ) ) ( AVAILABLE ?auto_34860 ) ( TRUCK-AT ?auto_34859 ?auto_34864 ) ( AVAILABLE ?auto_34858 ) ( SURFACE-AT ?auto_34857 ?auto_34864 ) ( ON ?auto_34857 ?auto_34865 ) ( CLEAR ?auto_34857 ) ( not ( = ?auto_34856 ?auto_34865 ) ) ( not ( = ?auto_34857 ?auto_34865 ) ) ( not ( = ?auto_34861 ?auto_34865 ) ) ( not ( = ?auto_34862 ?auto_34865 ) ) )
    :subtasks
    ( ( !LIFT ?auto_34858 ?auto_34857 ?auto_34865 ?auto_34864 )
      ( MAKE-ON ?auto_34856 ?auto_34857 )
      ( MAKE-ON-VERIFY ?auto_34856 ?auto_34857 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34866 - SURFACE
      ?auto_34867 - SURFACE
    )
    :vars
    (
      ?auto_34871 - HOIST
      ?auto_34872 - PLACE
      ?auto_34874 - PLACE
      ?auto_34875 - HOIST
      ?auto_34869 - SURFACE
      ?auto_34868 - SURFACE
      ?auto_34870 - SURFACE
      ?auto_34873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34871 ?auto_34872 ) ( IS-CRATE ?auto_34866 ) ( not ( = ?auto_34866 ?auto_34867 ) ) ( not ( = ?auto_34874 ?auto_34872 ) ) ( HOIST-AT ?auto_34875 ?auto_34874 ) ( not ( = ?auto_34871 ?auto_34875 ) ) ( SURFACE-AT ?auto_34866 ?auto_34874 ) ( ON ?auto_34866 ?auto_34869 ) ( CLEAR ?auto_34866 ) ( not ( = ?auto_34866 ?auto_34869 ) ) ( not ( = ?auto_34867 ?auto_34869 ) ) ( SURFACE-AT ?auto_34868 ?auto_34872 ) ( CLEAR ?auto_34868 ) ( IS-CRATE ?auto_34867 ) ( not ( = ?auto_34866 ?auto_34868 ) ) ( not ( = ?auto_34867 ?auto_34868 ) ) ( not ( = ?auto_34869 ?auto_34868 ) ) ( AVAILABLE ?auto_34871 ) ( AVAILABLE ?auto_34875 ) ( SURFACE-AT ?auto_34867 ?auto_34874 ) ( ON ?auto_34867 ?auto_34870 ) ( CLEAR ?auto_34867 ) ( not ( = ?auto_34866 ?auto_34870 ) ) ( not ( = ?auto_34867 ?auto_34870 ) ) ( not ( = ?auto_34869 ?auto_34870 ) ) ( not ( = ?auto_34868 ?auto_34870 ) ) ( TRUCK-AT ?auto_34873 ?auto_34872 ) )
    :subtasks
    ( ( !DRIVE ?auto_34873 ?auto_34872 ?auto_34874 )
      ( MAKE-ON ?auto_34866 ?auto_34867 )
      ( MAKE-ON-VERIFY ?auto_34866 ?auto_34867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_34876 - SURFACE
      ?auto_34877 - SURFACE
    )
    :vars
    (
      ?auto_34884 - HOIST
      ?auto_34885 - PLACE
      ?auto_34882 - PLACE
      ?auto_34878 - HOIST
      ?auto_34883 - SURFACE
      ?auto_34881 - SURFACE
      ?auto_34880 - SURFACE
      ?auto_34879 - TRUCK
      ?auto_34886 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_34884 ?auto_34885 ) ( IS-CRATE ?auto_34876 ) ( not ( = ?auto_34876 ?auto_34877 ) ) ( not ( = ?auto_34882 ?auto_34885 ) ) ( HOIST-AT ?auto_34878 ?auto_34882 ) ( not ( = ?auto_34884 ?auto_34878 ) ) ( SURFACE-AT ?auto_34876 ?auto_34882 ) ( ON ?auto_34876 ?auto_34883 ) ( CLEAR ?auto_34876 ) ( not ( = ?auto_34876 ?auto_34883 ) ) ( not ( = ?auto_34877 ?auto_34883 ) ) ( IS-CRATE ?auto_34877 ) ( not ( = ?auto_34876 ?auto_34881 ) ) ( not ( = ?auto_34877 ?auto_34881 ) ) ( not ( = ?auto_34883 ?auto_34881 ) ) ( AVAILABLE ?auto_34878 ) ( SURFACE-AT ?auto_34877 ?auto_34882 ) ( ON ?auto_34877 ?auto_34880 ) ( CLEAR ?auto_34877 ) ( not ( = ?auto_34876 ?auto_34880 ) ) ( not ( = ?auto_34877 ?auto_34880 ) ) ( not ( = ?auto_34883 ?auto_34880 ) ) ( not ( = ?auto_34881 ?auto_34880 ) ) ( TRUCK-AT ?auto_34879 ?auto_34885 ) ( SURFACE-AT ?auto_34886 ?auto_34885 ) ( CLEAR ?auto_34886 ) ( LIFTING ?auto_34884 ?auto_34881 ) ( IS-CRATE ?auto_34881 ) ( not ( = ?auto_34876 ?auto_34886 ) ) ( not ( = ?auto_34877 ?auto_34886 ) ) ( not ( = ?auto_34883 ?auto_34886 ) ) ( not ( = ?auto_34881 ?auto_34886 ) ) ( not ( = ?auto_34880 ?auto_34886 ) ) )
    :subtasks
    ( ( !DROP ?auto_34884 ?auto_34881 ?auto_34886 ?auto_34885 )
      ( MAKE-ON ?auto_34876 ?auto_34877 )
      ( MAKE-ON-VERIFY ?auto_34876 ?auto_34877 ) )
  )

)

