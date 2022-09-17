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
      ?auto_28612 - SURFACE
      ?auto_28613 - SURFACE
    )
    :vars
    (
      ?auto_28614 - HOIST
      ?auto_28615 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28614 ?auto_28615 ) ( SURFACE-AT ?auto_28613 ?auto_28615 ) ( CLEAR ?auto_28613 ) ( LIFTING ?auto_28614 ?auto_28612 ) ( IS-CRATE ?auto_28612 ) ( not ( = ?auto_28612 ?auto_28613 ) ) )
    :subtasks
    ( ( !DROP ?auto_28614 ?auto_28612 ?auto_28613 ?auto_28615 )
      ( MAKE-ON-VERIFY ?auto_28612 ?auto_28613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28616 - SURFACE
      ?auto_28617 - SURFACE
    )
    :vars
    (
      ?auto_28619 - HOIST
      ?auto_28618 - PLACE
      ?auto_28620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28619 ?auto_28618 ) ( SURFACE-AT ?auto_28617 ?auto_28618 ) ( CLEAR ?auto_28617 ) ( IS-CRATE ?auto_28616 ) ( not ( = ?auto_28616 ?auto_28617 ) ) ( TRUCK-AT ?auto_28620 ?auto_28618 ) ( AVAILABLE ?auto_28619 ) ( IN ?auto_28616 ?auto_28620 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28619 ?auto_28616 ?auto_28620 ?auto_28618 )
      ( MAKE-ON ?auto_28616 ?auto_28617 )
      ( MAKE-ON-VERIFY ?auto_28616 ?auto_28617 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28621 - SURFACE
      ?auto_28622 - SURFACE
    )
    :vars
    (
      ?auto_28624 - HOIST
      ?auto_28623 - PLACE
      ?auto_28625 - TRUCK
      ?auto_28626 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28624 ?auto_28623 ) ( SURFACE-AT ?auto_28622 ?auto_28623 ) ( CLEAR ?auto_28622 ) ( IS-CRATE ?auto_28621 ) ( not ( = ?auto_28621 ?auto_28622 ) ) ( AVAILABLE ?auto_28624 ) ( IN ?auto_28621 ?auto_28625 ) ( TRUCK-AT ?auto_28625 ?auto_28626 ) ( not ( = ?auto_28626 ?auto_28623 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28625 ?auto_28626 ?auto_28623 )
      ( MAKE-ON ?auto_28621 ?auto_28622 )
      ( MAKE-ON-VERIFY ?auto_28621 ?auto_28622 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28627 - SURFACE
      ?auto_28628 - SURFACE
    )
    :vars
    (
      ?auto_28631 - HOIST
      ?auto_28632 - PLACE
      ?auto_28630 - TRUCK
      ?auto_28629 - PLACE
      ?auto_28633 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_28631 ?auto_28632 ) ( SURFACE-AT ?auto_28628 ?auto_28632 ) ( CLEAR ?auto_28628 ) ( IS-CRATE ?auto_28627 ) ( not ( = ?auto_28627 ?auto_28628 ) ) ( AVAILABLE ?auto_28631 ) ( TRUCK-AT ?auto_28630 ?auto_28629 ) ( not ( = ?auto_28629 ?auto_28632 ) ) ( HOIST-AT ?auto_28633 ?auto_28629 ) ( LIFTING ?auto_28633 ?auto_28627 ) ( not ( = ?auto_28631 ?auto_28633 ) ) )
    :subtasks
    ( ( !LOAD ?auto_28633 ?auto_28627 ?auto_28630 ?auto_28629 )
      ( MAKE-ON ?auto_28627 ?auto_28628 )
      ( MAKE-ON-VERIFY ?auto_28627 ?auto_28628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28634 - SURFACE
      ?auto_28635 - SURFACE
    )
    :vars
    (
      ?auto_28640 - HOIST
      ?auto_28639 - PLACE
      ?auto_28636 - TRUCK
      ?auto_28637 - PLACE
      ?auto_28638 - HOIST
      ?auto_28641 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28640 ?auto_28639 ) ( SURFACE-AT ?auto_28635 ?auto_28639 ) ( CLEAR ?auto_28635 ) ( IS-CRATE ?auto_28634 ) ( not ( = ?auto_28634 ?auto_28635 ) ) ( AVAILABLE ?auto_28640 ) ( TRUCK-AT ?auto_28636 ?auto_28637 ) ( not ( = ?auto_28637 ?auto_28639 ) ) ( HOIST-AT ?auto_28638 ?auto_28637 ) ( not ( = ?auto_28640 ?auto_28638 ) ) ( AVAILABLE ?auto_28638 ) ( SURFACE-AT ?auto_28634 ?auto_28637 ) ( ON ?auto_28634 ?auto_28641 ) ( CLEAR ?auto_28634 ) ( not ( = ?auto_28634 ?auto_28641 ) ) ( not ( = ?auto_28635 ?auto_28641 ) ) )
    :subtasks
    ( ( !LIFT ?auto_28638 ?auto_28634 ?auto_28641 ?auto_28637 )
      ( MAKE-ON ?auto_28634 ?auto_28635 )
      ( MAKE-ON-VERIFY ?auto_28634 ?auto_28635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28642 - SURFACE
      ?auto_28643 - SURFACE
    )
    :vars
    (
      ?auto_28647 - HOIST
      ?auto_28645 - PLACE
      ?auto_28648 - PLACE
      ?auto_28649 - HOIST
      ?auto_28646 - SURFACE
      ?auto_28644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28647 ?auto_28645 ) ( SURFACE-AT ?auto_28643 ?auto_28645 ) ( CLEAR ?auto_28643 ) ( IS-CRATE ?auto_28642 ) ( not ( = ?auto_28642 ?auto_28643 ) ) ( AVAILABLE ?auto_28647 ) ( not ( = ?auto_28648 ?auto_28645 ) ) ( HOIST-AT ?auto_28649 ?auto_28648 ) ( not ( = ?auto_28647 ?auto_28649 ) ) ( AVAILABLE ?auto_28649 ) ( SURFACE-AT ?auto_28642 ?auto_28648 ) ( ON ?auto_28642 ?auto_28646 ) ( CLEAR ?auto_28642 ) ( not ( = ?auto_28642 ?auto_28646 ) ) ( not ( = ?auto_28643 ?auto_28646 ) ) ( TRUCK-AT ?auto_28644 ?auto_28645 ) )
    :subtasks
    ( ( !DRIVE ?auto_28644 ?auto_28645 ?auto_28648 )
      ( MAKE-ON ?auto_28642 ?auto_28643 )
      ( MAKE-ON-VERIFY ?auto_28642 ?auto_28643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28690 - SURFACE
      ?auto_28691 - SURFACE
    )
    :vars
    (
      ?auto_28692 - HOIST
      ?auto_28696 - PLACE
      ?auto_28694 - PLACE
      ?auto_28695 - HOIST
      ?auto_28693 - SURFACE
      ?auto_28697 - TRUCK
      ?auto_28698 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28692 ?auto_28696 ) ( IS-CRATE ?auto_28690 ) ( not ( = ?auto_28690 ?auto_28691 ) ) ( not ( = ?auto_28694 ?auto_28696 ) ) ( HOIST-AT ?auto_28695 ?auto_28694 ) ( not ( = ?auto_28692 ?auto_28695 ) ) ( AVAILABLE ?auto_28695 ) ( SURFACE-AT ?auto_28690 ?auto_28694 ) ( ON ?auto_28690 ?auto_28693 ) ( CLEAR ?auto_28690 ) ( not ( = ?auto_28690 ?auto_28693 ) ) ( not ( = ?auto_28691 ?auto_28693 ) ) ( TRUCK-AT ?auto_28697 ?auto_28696 ) ( SURFACE-AT ?auto_28698 ?auto_28696 ) ( CLEAR ?auto_28698 ) ( LIFTING ?auto_28692 ?auto_28691 ) ( IS-CRATE ?auto_28691 ) ( not ( = ?auto_28690 ?auto_28698 ) ) ( not ( = ?auto_28691 ?auto_28698 ) ) ( not ( = ?auto_28693 ?auto_28698 ) ) )
    :subtasks
    ( ( !DROP ?auto_28692 ?auto_28691 ?auto_28698 ?auto_28696 )
      ( MAKE-ON ?auto_28690 ?auto_28691 )
      ( MAKE-ON-VERIFY ?auto_28690 ?auto_28691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28699 - SURFACE
      ?auto_28700 - SURFACE
    )
    :vars
    (
      ?auto_28705 - HOIST
      ?auto_28701 - PLACE
      ?auto_28703 - PLACE
      ?auto_28704 - HOIST
      ?auto_28702 - SURFACE
      ?auto_28706 - TRUCK
      ?auto_28707 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28705 ?auto_28701 ) ( IS-CRATE ?auto_28699 ) ( not ( = ?auto_28699 ?auto_28700 ) ) ( not ( = ?auto_28703 ?auto_28701 ) ) ( HOIST-AT ?auto_28704 ?auto_28703 ) ( not ( = ?auto_28705 ?auto_28704 ) ) ( AVAILABLE ?auto_28704 ) ( SURFACE-AT ?auto_28699 ?auto_28703 ) ( ON ?auto_28699 ?auto_28702 ) ( CLEAR ?auto_28699 ) ( not ( = ?auto_28699 ?auto_28702 ) ) ( not ( = ?auto_28700 ?auto_28702 ) ) ( TRUCK-AT ?auto_28706 ?auto_28701 ) ( SURFACE-AT ?auto_28707 ?auto_28701 ) ( CLEAR ?auto_28707 ) ( IS-CRATE ?auto_28700 ) ( not ( = ?auto_28699 ?auto_28707 ) ) ( not ( = ?auto_28700 ?auto_28707 ) ) ( not ( = ?auto_28702 ?auto_28707 ) ) ( AVAILABLE ?auto_28705 ) ( IN ?auto_28700 ?auto_28706 ) )
    :subtasks
    ( ( !UNLOAD ?auto_28705 ?auto_28700 ?auto_28706 ?auto_28701 )
      ( MAKE-ON ?auto_28699 ?auto_28700 )
      ( MAKE-ON-VERIFY ?auto_28699 ?auto_28700 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28714 - SURFACE
      ?auto_28715 - SURFACE
    )
    :vars
    (
      ?auto_28720 - HOIST
      ?auto_28717 - PLACE
      ?auto_28721 - PLACE
      ?auto_28718 - HOIST
      ?auto_28716 - SURFACE
      ?auto_28719 - TRUCK
      ?auto_28722 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28720 ?auto_28717 ) ( SURFACE-AT ?auto_28715 ?auto_28717 ) ( CLEAR ?auto_28715 ) ( IS-CRATE ?auto_28714 ) ( not ( = ?auto_28714 ?auto_28715 ) ) ( AVAILABLE ?auto_28720 ) ( not ( = ?auto_28721 ?auto_28717 ) ) ( HOIST-AT ?auto_28718 ?auto_28721 ) ( not ( = ?auto_28720 ?auto_28718 ) ) ( AVAILABLE ?auto_28718 ) ( SURFACE-AT ?auto_28714 ?auto_28721 ) ( ON ?auto_28714 ?auto_28716 ) ( CLEAR ?auto_28714 ) ( not ( = ?auto_28714 ?auto_28716 ) ) ( not ( = ?auto_28715 ?auto_28716 ) ) ( TRUCK-AT ?auto_28719 ?auto_28722 ) ( not ( = ?auto_28722 ?auto_28717 ) ) ( not ( = ?auto_28721 ?auto_28722 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_28719 ?auto_28722 ?auto_28717 )
      ( MAKE-ON ?auto_28714 ?auto_28715 )
      ( MAKE-ON-VERIFY ?auto_28714 ?auto_28715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_28996 - SURFACE
      ?auto_28997 - SURFACE
    )
    :vars
    (
      ?auto_28999 - HOIST
      ?auto_28998 - PLACE
      ?auto_29002 - TRUCK
      ?auto_29001 - PLACE
      ?auto_29003 - HOIST
      ?auto_29000 - SURFACE
      ?auto_29004 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_28999 ?auto_28998 ) ( SURFACE-AT ?auto_28997 ?auto_28998 ) ( CLEAR ?auto_28997 ) ( IS-CRATE ?auto_28996 ) ( not ( = ?auto_28996 ?auto_28997 ) ) ( AVAILABLE ?auto_28999 ) ( TRUCK-AT ?auto_29002 ?auto_29001 ) ( not ( = ?auto_29001 ?auto_28998 ) ) ( HOIST-AT ?auto_29003 ?auto_29001 ) ( not ( = ?auto_28999 ?auto_29003 ) ) ( SURFACE-AT ?auto_28996 ?auto_29001 ) ( ON ?auto_28996 ?auto_29000 ) ( CLEAR ?auto_28996 ) ( not ( = ?auto_28996 ?auto_29000 ) ) ( not ( = ?auto_28997 ?auto_29000 ) ) ( LIFTING ?auto_29003 ?auto_29004 ) ( IS-CRATE ?auto_29004 ) ( not ( = ?auto_28996 ?auto_29004 ) ) ( not ( = ?auto_28997 ?auto_29004 ) ) ( not ( = ?auto_29000 ?auto_29004 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29003 ?auto_29004 ?auto_29002 ?auto_29001 )
      ( MAKE-ON ?auto_28996 ?auto_28997 )
      ( MAKE-ON-VERIFY ?auto_28996 ?auto_28997 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29079 - SURFACE
      ?auto_29080 - SURFACE
    )
    :vars
    (
      ?auto_29082 - HOIST
      ?auto_29087 - PLACE
      ?auto_29081 - PLACE
      ?auto_29085 - HOIST
      ?auto_29086 - SURFACE
      ?auto_29084 - SURFACE
      ?auto_29083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29082 ?auto_29087 ) ( IS-CRATE ?auto_29079 ) ( not ( = ?auto_29079 ?auto_29080 ) ) ( not ( = ?auto_29081 ?auto_29087 ) ) ( HOIST-AT ?auto_29085 ?auto_29081 ) ( not ( = ?auto_29082 ?auto_29085 ) ) ( AVAILABLE ?auto_29085 ) ( SURFACE-AT ?auto_29079 ?auto_29081 ) ( ON ?auto_29079 ?auto_29086 ) ( CLEAR ?auto_29079 ) ( not ( = ?auto_29079 ?auto_29086 ) ) ( not ( = ?auto_29080 ?auto_29086 ) ) ( SURFACE-AT ?auto_29084 ?auto_29087 ) ( CLEAR ?auto_29084 ) ( IS-CRATE ?auto_29080 ) ( not ( = ?auto_29079 ?auto_29084 ) ) ( not ( = ?auto_29080 ?auto_29084 ) ) ( not ( = ?auto_29086 ?auto_29084 ) ) ( AVAILABLE ?auto_29082 ) ( IN ?auto_29080 ?auto_29083 ) ( TRUCK-AT ?auto_29083 ?auto_29081 ) )
    :subtasks
    ( ( !DRIVE ?auto_29083 ?auto_29081 ?auto_29087 )
      ( MAKE-ON ?auto_29079 ?auto_29080 )
      ( MAKE-ON-VERIFY ?auto_29079 ?auto_29080 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29088 - SURFACE
      ?auto_29089 - SURFACE
    )
    :vars
    (
      ?auto_29095 - HOIST
      ?auto_29094 - PLACE
      ?auto_29090 - PLACE
      ?auto_29091 - HOIST
      ?auto_29093 - SURFACE
      ?auto_29096 - SURFACE
      ?auto_29092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29095 ?auto_29094 ) ( IS-CRATE ?auto_29088 ) ( not ( = ?auto_29088 ?auto_29089 ) ) ( not ( = ?auto_29090 ?auto_29094 ) ) ( HOIST-AT ?auto_29091 ?auto_29090 ) ( not ( = ?auto_29095 ?auto_29091 ) ) ( SURFACE-AT ?auto_29088 ?auto_29090 ) ( ON ?auto_29088 ?auto_29093 ) ( CLEAR ?auto_29088 ) ( not ( = ?auto_29088 ?auto_29093 ) ) ( not ( = ?auto_29089 ?auto_29093 ) ) ( SURFACE-AT ?auto_29096 ?auto_29094 ) ( CLEAR ?auto_29096 ) ( IS-CRATE ?auto_29089 ) ( not ( = ?auto_29088 ?auto_29096 ) ) ( not ( = ?auto_29089 ?auto_29096 ) ) ( not ( = ?auto_29093 ?auto_29096 ) ) ( AVAILABLE ?auto_29095 ) ( TRUCK-AT ?auto_29092 ?auto_29090 ) ( LIFTING ?auto_29091 ?auto_29089 ) )
    :subtasks
    ( ( !LOAD ?auto_29091 ?auto_29089 ?auto_29092 ?auto_29090 )
      ( MAKE-ON ?auto_29088 ?auto_29089 )
      ( MAKE-ON-VERIFY ?auto_29088 ?auto_29089 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29097 - SURFACE
      ?auto_29098 - SURFACE
    )
    :vars
    (
      ?auto_29103 - HOIST
      ?auto_29102 - PLACE
      ?auto_29104 - PLACE
      ?auto_29105 - HOIST
      ?auto_29100 - SURFACE
      ?auto_29101 - SURFACE
      ?auto_29099 - TRUCK
      ?auto_29106 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29103 ?auto_29102 ) ( IS-CRATE ?auto_29097 ) ( not ( = ?auto_29097 ?auto_29098 ) ) ( not ( = ?auto_29104 ?auto_29102 ) ) ( HOIST-AT ?auto_29105 ?auto_29104 ) ( not ( = ?auto_29103 ?auto_29105 ) ) ( SURFACE-AT ?auto_29097 ?auto_29104 ) ( ON ?auto_29097 ?auto_29100 ) ( CLEAR ?auto_29097 ) ( not ( = ?auto_29097 ?auto_29100 ) ) ( not ( = ?auto_29098 ?auto_29100 ) ) ( SURFACE-AT ?auto_29101 ?auto_29102 ) ( CLEAR ?auto_29101 ) ( IS-CRATE ?auto_29098 ) ( not ( = ?auto_29097 ?auto_29101 ) ) ( not ( = ?auto_29098 ?auto_29101 ) ) ( not ( = ?auto_29100 ?auto_29101 ) ) ( AVAILABLE ?auto_29103 ) ( TRUCK-AT ?auto_29099 ?auto_29104 ) ( AVAILABLE ?auto_29105 ) ( SURFACE-AT ?auto_29098 ?auto_29104 ) ( ON ?auto_29098 ?auto_29106 ) ( CLEAR ?auto_29098 ) ( not ( = ?auto_29097 ?auto_29106 ) ) ( not ( = ?auto_29098 ?auto_29106 ) ) ( not ( = ?auto_29100 ?auto_29106 ) ) ( not ( = ?auto_29101 ?auto_29106 ) ) )
    :subtasks
    ( ( !LIFT ?auto_29105 ?auto_29098 ?auto_29106 ?auto_29104 )
      ( MAKE-ON ?auto_29097 ?auto_29098 )
      ( MAKE-ON-VERIFY ?auto_29097 ?auto_29098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29107 - SURFACE
      ?auto_29108 - SURFACE
    )
    :vars
    (
      ?auto_29109 - HOIST
      ?auto_29116 - PLACE
      ?auto_29113 - PLACE
      ?auto_29114 - HOIST
      ?auto_29110 - SURFACE
      ?auto_29111 - SURFACE
      ?auto_29115 - SURFACE
      ?auto_29112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_29109 ?auto_29116 ) ( IS-CRATE ?auto_29107 ) ( not ( = ?auto_29107 ?auto_29108 ) ) ( not ( = ?auto_29113 ?auto_29116 ) ) ( HOIST-AT ?auto_29114 ?auto_29113 ) ( not ( = ?auto_29109 ?auto_29114 ) ) ( SURFACE-AT ?auto_29107 ?auto_29113 ) ( ON ?auto_29107 ?auto_29110 ) ( CLEAR ?auto_29107 ) ( not ( = ?auto_29107 ?auto_29110 ) ) ( not ( = ?auto_29108 ?auto_29110 ) ) ( SURFACE-AT ?auto_29111 ?auto_29116 ) ( CLEAR ?auto_29111 ) ( IS-CRATE ?auto_29108 ) ( not ( = ?auto_29107 ?auto_29111 ) ) ( not ( = ?auto_29108 ?auto_29111 ) ) ( not ( = ?auto_29110 ?auto_29111 ) ) ( AVAILABLE ?auto_29109 ) ( AVAILABLE ?auto_29114 ) ( SURFACE-AT ?auto_29108 ?auto_29113 ) ( ON ?auto_29108 ?auto_29115 ) ( CLEAR ?auto_29108 ) ( not ( = ?auto_29107 ?auto_29115 ) ) ( not ( = ?auto_29108 ?auto_29115 ) ) ( not ( = ?auto_29110 ?auto_29115 ) ) ( not ( = ?auto_29111 ?auto_29115 ) ) ( TRUCK-AT ?auto_29112 ?auto_29116 ) )
    :subtasks
    ( ( !DRIVE ?auto_29112 ?auto_29116 ?auto_29113 )
      ( MAKE-ON ?auto_29107 ?auto_29108 )
      ( MAKE-ON-VERIFY ?auto_29107 ?auto_29108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29117 - SURFACE
      ?auto_29118 - SURFACE
    )
    :vars
    (
      ?auto_29120 - HOIST
      ?auto_29124 - PLACE
      ?auto_29123 - PLACE
      ?auto_29125 - HOIST
      ?auto_29119 - SURFACE
      ?auto_29126 - SURFACE
      ?auto_29121 - SURFACE
      ?auto_29122 - TRUCK
      ?auto_29127 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29120 ?auto_29124 ) ( IS-CRATE ?auto_29117 ) ( not ( = ?auto_29117 ?auto_29118 ) ) ( not ( = ?auto_29123 ?auto_29124 ) ) ( HOIST-AT ?auto_29125 ?auto_29123 ) ( not ( = ?auto_29120 ?auto_29125 ) ) ( SURFACE-AT ?auto_29117 ?auto_29123 ) ( ON ?auto_29117 ?auto_29119 ) ( CLEAR ?auto_29117 ) ( not ( = ?auto_29117 ?auto_29119 ) ) ( not ( = ?auto_29118 ?auto_29119 ) ) ( IS-CRATE ?auto_29118 ) ( not ( = ?auto_29117 ?auto_29126 ) ) ( not ( = ?auto_29118 ?auto_29126 ) ) ( not ( = ?auto_29119 ?auto_29126 ) ) ( AVAILABLE ?auto_29125 ) ( SURFACE-AT ?auto_29118 ?auto_29123 ) ( ON ?auto_29118 ?auto_29121 ) ( CLEAR ?auto_29118 ) ( not ( = ?auto_29117 ?auto_29121 ) ) ( not ( = ?auto_29118 ?auto_29121 ) ) ( not ( = ?auto_29119 ?auto_29121 ) ) ( not ( = ?auto_29126 ?auto_29121 ) ) ( TRUCK-AT ?auto_29122 ?auto_29124 ) ( SURFACE-AT ?auto_29127 ?auto_29124 ) ( CLEAR ?auto_29127 ) ( LIFTING ?auto_29120 ?auto_29126 ) ( IS-CRATE ?auto_29126 ) ( not ( = ?auto_29117 ?auto_29127 ) ) ( not ( = ?auto_29118 ?auto_29127 ) ) ( not ( = ?auto_29119 ?auto_29127 ) ) ( not ( = ?auto_29126 ?auto_29127 ) ) ( not ( = ?auto_29121 ?auto_29127 ) ) )
    :subtasks
    ( ( !DROP ?auto_29120 ?auto_29126 ?auto_29127 ?auto_29124 )
      ( MAKE-ON ?auto_29117 ?auto_29118 )
      ( MAKE-ON-VERIFY ?auto_29117 ?auto_29118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29156 - SURFACE
      ?auto_29157 - SURFACE
    )
    :vars
    (
      ?auto_29161 - HOIST
      ?auto_29158 - PLACE
      ?auto_29163 - PLACE
      ?auto_29164 - HOIST
      ?auto_29159 - SURFACE
      ?auto_29160 - SURFACE
      ?auto_29162 - TRUCK
      ?auto_29165 - SURFACE
      ?auto_29166 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29161 ?auto_29158 ) ( IS-CRATE ?auto_29156 ) ( not ( = ?auto_29156 ?auto_29157 ) ) ( not ( = ?auto_29163 ?auto_29158 ) ) ( HOIST-AT ?auto_29164 ?auto_29163 ) ( not ( = ?auto_29161 ?auto_29164 ) ) ( SURFACE-AT ?auto_29156 ?auto_29163 ) ( ON ?auto_29156 ?auto_29159 ) ( CLEAR ?auto_29156 ) ( not ( = ?auto_29156 ?auto_29159 ) ) ( not ( = ?auto_29157 ?auto_29159 ) ) ( SURFACE-AT ?auto_29160 ?auto_29158 ) ( CLEAR ?auto_29160 ) ( IS-CRATE ?auto_29157 ) ( not ( = ?auto_29156 ?auto_29160 ) ) ( not ( = ?auto_29157 ?auto_29160 ) ) ( not ( = ?auto_29159 ?auto_29160 ) ) ( AVAILABLE ?auto_29161 ) ( TRUCK-AT ?auto_29162 ?auto_29163 ) ( SURFACE-AT ?auto_29157 ?auto_29163 ) ( ON ?auto_29157 ?auto_29165 ) ( CLEAR ?auto_29157 ) ( not ( = ?auto_29156 ?auto_29165 ) ) ( not ( = ?auto_29157 ?auto_29165 ) ) ( not ( = ?auto_29159 ?auto_29165 ) ) ( not ( = ?auto_29160 ?auto_29165 ) ) ( LIFTING ?auto_29164 ?auto_29166 ) ( IS-CRATE ?auto_29166 ) ( not ( = ?auto_29156 ?auto_29166 ) ) ( not ( = ?auto_29157 ?auto_29166 ) ) ( not ( = ?auto_29159 ?auto_29166 ) ) ( not ( = ?auto_29160 ?auto_29166 ) ) ( not ( = ?auto_29165 ?auto_29166 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29164 ?auto_29166 ?auto_29162 ?auto_29163 )
      ( MAKE-ON ?auto_29156 ?auto_29157 )
      ( MAKE-ON-VERIFY ?auto_29156 ?auto_29157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_29262 - SURFACE
      ?auto_29263 - SURFACE
    )
    :vars
    (
      ?auto_29264 - HOIST
      ?auto_29268 - PLACE
      ?auto_29269 - PLACE
      ?auto_29266 - HOIST
      ?auto_29265 - SURFACE
      ?auto_29267 - TRUCK
      ?auto_29270 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_29264 ?auto_29268 ) ( SURFACE-AT ?auto_29263 ?auto_29268 ) ( CLEAR ?auto_29263 ) ( IS-CRATE ?auto_29262 ) ( not ( = ?auto_29262 ?auto_29263 ) ) ( not ( = ?auto_29269 ?auto_29268 ) ) ( HOIST-AT ?auto_29266 ?auto_29269 ) ( not ( = ?auto_29264 ?auto_29266 ) ) ( AVAILABLE ?auto_29266 ) ( SURFACE-AT ?auto_29262 ?auto_29269 ) ( ON ?auto_29262 ?auto_29265 ) ( CLEAR ?auto_29262 ) ( not ( = ?auto_29262 ?auto_29265 ) ) ( not ( = ?auto_29263 ?auto_29265 ) ) ( TRUCK-AT ?auto_29267 ?auto_29268 ) ( LIFTING ?auto_29264 ?auto_29270 ) ( IS-CRATE ?auto_29270 ) ( not ( = ?auto_29262 ?auto_29270 ) ) ( not ( = ?auto_29263 ?auto_29270 ) ) ( not ( = ?auto_29265 ?auto_29270 ) ) )
    :subtasks
    ( ( !LOAD ?auto_29264 ?auto_29270 ?auto_29267 ?auto_29268 )
      ( MAKE-ON ?auto_29262 ?auto_29263 )
      ( MAKE-ON-VERIFY ?auto_29262 ?auto_29263 ) )
  )

)

