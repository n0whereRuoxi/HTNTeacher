( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-7PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?obj7 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) ( OBJ-AT ?obj7 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4562 - OBJ
      ?auto_4563 - LOCATION
    )
    :vars
    (
      ?auto_4564 - TRUCK
      ?auto_4565 - LOCATION
      ?auto_4566 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4564 ?auto_4565 ) ( IN-CITY ?auto_4565 ?auto_4566 ) ( IN-CITY ?auto_4563 ?auto_4566 ) ( not ( = ?auto_4563 ?auto_4565 ) ) ( OBJ-AT ?auto_4562 ?auto_4565 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4562 ?auto_4564 ?auto_4565 )
      ( !DRIVE-TRUCK ?auto_4564 ?auto_4565 ?auto_4563 ?auto_4566 )
      ( !UNLOAD-TRUCK ?auto_4562 ?auto_4564 ?auto_4563 )
      ( DELIVER-1PKG-VERIFY ?auto_4562 ?auto_4563 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4569 - OBJ
      ?auto_4570 - LOCATION
    )
    :vars
    (
      ?auto_4572 - LOCATION
      ?auto_4573 - CITY
      ?auto_4571 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4572 ?auto_4573 ) ( IN-CITY ?auto_4570 ?auto_4573 ) ( not ( = ?auto_4570 ?auto_4572 ) ) ( OBJ-AT ?auto_4569 ?auto_4572 ) ( TRUCK-AT ?auto_4571 ?auto_4570 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4571 ?auto_4570 ?auto_4572 ?auto_4573 )
      ( DELIVER-1PKG ?auto_4569 ?auto_4570 )
      ( DELIVER-1PKG-VERIFY ?auto_4569 ?auto_4570 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4591 - OBJ
      ?auto_4593 - OBJ
      ?auto_4592 - LOCATION
    )
    :vars
    (
      ?auto_4596 - LOCATION
      ?auto_4594 - CITY
      ?auto_4595 - TRUCK
      ?auto_4597 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4593 ?auto_4591 ) ( IN-CITY ?auto_4596 ?auto_4594 ) ( IN-CITY ?auto_4592 ?auto_4594 ) ( not ( = ?auto_4592 ?auto_4596 ) ) ( OBJ-AT ?auto_4593 ?auto_4596 ) ( TRUCK-AT ?auto_4595 ?auto_4597 ) ( IN-CITY ?auto_4597 ?auto_4594 ) ( not ( = ?auto_4592 ?auto_4597 ) ) ( OBJ-AT ?auto_4591 ?auto_4597 ) ( not ( = ?auto_4591 ?auto_4593 ) ) ( not ( = ?auto_4596 ?auto_4597 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4591 ?auto_4592 )
      ( DELIVER-1PKG ?auto_4593 ?auto_4592 )
      ( DELIVER-2PKG-VERIFY ?auto_4591 ?auto_4593 ?auto_4592 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4601 - OBJ
      ?auto_4603 - OBJ
      ?auto_4602 - LOCATION
    )
    :vars
    (
      ?auto_4604 - LOCATION
      ?auto_4606 - CITY
      ?auto_4607 - LOCATION
      ?auto_4605 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4603 ?auto_4601 ) ( IN-CITY ?auto_4604 ?auto_4606 ) ( IN-CITY ?auto_4602 ?auto_4606 ) ( not ( = ?auto_4602 ?auto_4604 ) ) ( OBJ-AT ?auto_4603 ?auto_4604 ) ( IN-CITY ?auto_4607 ?auto_4606 ) ( not ( = ?auto_4602 ?auto_4607 ) ) ( OBJ-AT ?auto_4601 ?auto_4607 ) ( not ( = ?auto_4601 ?auto_4603 ) ) ( not ( = ?auto_4604 ?auto_4607 ) ) ( TRUCK-AT ?auto_4605 ?auto_4602 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4605 ?auto_4602 ?auto_4607 ?auto_4606 )
      ( DELIVER-2PKG ?auto_4601 ?auto_4603 ?auto_4602 )
      ( DELIVER-2PKG-VERIFY ?auto_4601 ?auto_4603 ?auto_4602 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4627 - OBJ
      ?auto_4629 - OBJ
      ?auto_4626 - OBJ
      ?auto_4628 - LOCATION
    )
    :vars
    (
      ?auto_4631 - LOCATION
      ?auto_4630 - CITY
      ?auto_4633 - LOCATION
      ?auto_4632 - TRUCK
      ?auto_4634 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4629 ?auto_4627 ) ( GREATER-THAN ?auto_4626 ?auto_4627 ) ( GREATER-THAN ?auto_4626 ?auto_4629 ) ( IN-CITY ?auto_4631 ?auto_4630 ) ( IN-CITY ?auto_4628 ?auto_4630 ) ( not ( = ?auto_4628 ?auto_4631 ) ) ( OBJ-AT ?auto_4626 ?auto_4631 ) ( IN-CITY ?auto_4633 ?auto_4630 ) ( not ( = ?auto_4628 ?auto_4633 ) ) ( OBJ-AT ?auto_4629 ?auto_4633 ) ( TRUCK-AT ?auto_4632 ?auto_4634 ) ( IN-CITY ?auto_4634 ?auto_4630 ) ( not ( = ?auto_4628 ?auto_4634 ) ) ( OBJ-AT ?auto_4627 ?auto_4634 ) ( not ( = ?auto_4627 ?auto_4629 ) ) ( not ( = ?auto_4633 ?auto_4634 ) ) ( not ( = ?auto_4627 ?auto_4626 ) ) ( not ( = ?auto_4629 ?auto_4626 ) ) ( not ( = ?auto_4631 ?auto_4633 ) ) ( not ( = ?auto_4631 ?auto_4634 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4627 ?auto_4629 ?auto_4628 )
      ( DELIVER-1PKG ?auto_4626 ?auto_4628 )
      ( DELIVER-3PKG-VERIFY ?auto_4627 ?auto_4629 ?auto_4626 ?auto_4628 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4640 - OBJ
      ?auto_4642 - OBJ
      ?auto_4639 - OBJ
      ?auto_4641 - LOCATION
    )
    :vars
    (
      ?auto_4643 - LOCATION
      ?auto_4645 - CITY
      ?auto_4646 - LOCATION
      ?auto_4647 - LOCATION
      ?auto_4644 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4642 ?auto_4640 ) ( GREATER-THAN ?auto_4639 ?auto_4640 ) ( GREATER-THAN ?auto_4639 ?auto_4642 ) ( IN-CITY ?auto_4643 ?auto_4645 ) ( IN-CITY ?auto_4641 ?auto_4645 ) ( not ( = ?auto_4641 ?auto_4643 ) ) ( OBJ-AT ?auto_4639 ?auto_4643 ) ( IN-CITY ?auto_4646 ?auto_4645 ) ( not ( = ?auto_4641 ?auto_4646 ) ) ( OBJ-AT ?auto_4642 ?auto_4646 ) ( IN-CITY ?auto_4647 ?auto_4645 ) ( not ( = ?auto_4641 ?auto_4647 ) ) ( OBJ-AT ?auto_4640 ?auto_4647 ) ( not ( = ?auto_4640 ?auto_4642 ) ) ( not ( = ?auto_4646 ?auto_4647 ) ) ( not ( = ?auto_4640 ?auto_4639 ) ) ( not ( = ?auto_4642 ?auto_4639 ) ) ( not ( = ?auto_4643 ?auto_4646 ) ) ( not ( = ?auto_4643 ?auto_4647 ) ) ( TRUCK-AT ?auto_4644 ?auto_4641 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4644 ?auto_4641 ?auto_4647 ?auto_4645 )
      ( DELIVER-3PKG ?auto_4640 ?auto_4642 ?auto_4639 ?auto_4641 )
      ( DELIVER-3PKG-VERIFY ?auto_4640 ?auto_4642 ?auto_4639 ?auto_4641 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4668 - OBJ
      ?auto_4670 - OBJ
      ?auto_4667 - OBJ
      ?auto_4671 - OBJ
      ?auto_4669 - LOCATION
    )
    :vars
    (
      ?auto_4672 - LOCATION
      ?auto_4674 - CITY
      ?auto_4675 - LOCATION
      ?auto_4676 - LOCATION
      ?auto_4673 - TRUCK
      ?auto_4677 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4670 ?auto_4668 ) ( GREATER-THAN ?auto_4667 ?auto_4668 ) ( GREATER-THAN ?auto_4667 ?auto_4670 ) ( GREATER-THAN ?auto_4671 ?auto_4668 ) ( GREATER-THAN ?auto_4671 ?auto_4670 ) ( GREATER-THAN ?auto_4671 ?auto_4667 ) ( IN-CITY ?auto_4672 ?auto_4674 ) ( IN-CITY ?auto_4669 ?auto_4674 ) ( not ( = ?auto_4669 ?auto_4672 ) ) ( OBJ-AT ?auto_4671 ?auto_4672 ) ( IN-CITY ?auto_4675 ?auto_4674 ) ( not ( = ?auto_4669 ?auto_4675 ) ) ( OBJ-AT ?auto_4667 ?auto_4675 ) ( IN-CITY ?auto_4676 ?auto_4674 ) ( not ( = ?auto_4669 ?auto_4676 ) ) ( OBJ-AT ?auto_4670 ?auto_4676 ) ( TRUCK-AT ?auto_4673 ?auto_4677 ) ( IN-CITY ?auto_4677 ?auto_4674 ) ( not ( = ?auto_4669 ?auto_4677 ) ) ( OBJ-AT ?auto_4668 ?auto_4677 ) ( not ( = ?auto_4668 ?auto_4670 ) ) ( not ( = ?auto_4676 ?auto_4677 ) ) ( not ( = ?auto_4668 ?auto_4667 ) ) ( not ( = ?auto_4670 ?auto_4667 ) ) ( not ( = ?auto_4675 ?auto_4676 ) ) ( not ( = ?auto_4675 ?auto_4677 ) ) ( not ( = ?auto_4668 ?auto_4671 ) ) ( not ( = ?auto_4670 ?auto_4671 ) ) ( not ( = ?auto_4667 ?auto_4671 ) ) ( not ( = ?auto_4672 ?auto_4675 ) ) ( not ( = ?auto_4672 ?auto_4676 ) ) ( not ( = ?auto_4672 ?auto_4677 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_4668 ?auto_4670 ?auto_4667 ?auto_4669 )
      ( DELIVER-1PKG ?auto_4671 ?auto_4669 )
      ( DELIVER-4PKG-VERIFY ?auto_4668 ?auto_4670 ?auto_4667 ?auto_4671 ?auto_4669 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4684 - OBJ
      ?auto_4686 - OBJ
      ?auto_4683 - OBJ
      ?auto_4687 - OBJ
      ?auto_4685 - LOCATION
    )
    :vars
    (
      ?auto_4691 - LOCATION
      ?auto_4692 - CITY
      ?auto_4690 - LOCATION
      ?auto_4693 - LOCATION
      ?auto_4689 - LOCATION
      ?auto_4688 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4686 ?auto_4684 ) ( GREATER-THAN ?auto_4683 ?auto_4684 ) ( GREATER-THAN ?auto_4683 ?auto_4686 ) ( GREATER-THAN ?auto_4687 ?auto_4684 ) ( GREATER-THAN ?auto_4687 ?auto_4686 ) ( GREATER-THAN ?auto_4687 ?auto_4683 ) ( IN-CITY ?auto_4691 ?auto_4692 ) ( IN-CITY ?auto_4685 ?auto_4692 ) ( not ( = ?auto_4685 ?auto_4691 ) ) ( OBJ-AT ?auto_4687 ?auto_4691 ) ( IN-CITY ?auto_4690 ?auto_4692 ) ( not ( = ?auto_4685 ?auto_4690 ) ) ( OBJ-AT ?auto_4683 ?auto_4690 ) ( IN-CITY ?auto_4693 ?auto_4692 ) ( not ( = ?auto_4685 ?auto_4693 ) ) ( OBJ-AT ?auto_4686 ?auto_4693 ) ( IN-CITY ?auto_4689 ?auto_4692 ) ( not ( = ?auto_4685 ?auto_4689 ) ) ( OBJ-AT ?auto_4684 ?auto_4689 ) ( not ( = ?auto_4684 ?auto_4686 ) ) ( not ( = ?auto_4693 ?auto_4689 ) ) ( not ( = ?auto_4684 ?auto_4683 ) ) ( not ( = ?auto_4686 ?auto_4683 ) ) ( not ( = ?auto_4690 ?auto_4693 ) ) ( not ( = ?auto_4690 ?auto_4689 ) ) ( not ( = ?auto_4684 ?auto_4687 ) ) ( not ( = ?auto_4686 ?auto_4687 ) ) ( not ( = ?auto_4683 ?auto_4687 ) ) ( not ( = ?auto_4691 ?auto_4690 ) ) ( not ( = ?auto_4691 ?auto_4693 ) ) ( not ( = ?auto_4691 ?auto_4689 ) ) ( TRUCK-AT ?auto_4688 ?auto_4685 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4688 ?auto_4685 ?auto_4689 ?auto_4692 )
      ( DELIVER-4PKG ?auto_4684 ?auto_4686 ?auto_4683 ?auto_4687 ?auto_4685 )
      ( DELIVER-4PKG-VERIFY ?auto_4684 ?auto_4686 ?auto_4683 ?auto_4687 ?auto_4685 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_4715 - OBJ
      ?auto_4717 - OBJ
      ?auto_4714 - OBJ
      ?auto_4718 - OBJ
      ?auto_4719 - OBJ
      ?auto_4716 - LOCATION
    )
    :vars
    (
      ?auto_4722 - LOCATION
      ?auto_4720 - CITY
      ?auto_4725 - LOCATION
      ?auto_4724 - LOCATION
      ?auto_4726 - LOCATION
      ?auto_4721 - TRUCK
      ?auto_4723 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4717 ?auto_4715 ) ( GREATER-THAN ?auto_4714 ?auto_4715 ) ( GREATER-THAN ?auto_4714 ?auto_4717 ) ( GREATER-THAN ?auto_4718 ?auto_4715 ) ( GREATER-THAN ?auto_4718 ?auto_4717 ) ( GREATER-THAN ?auto_4718 ?auto_4714 ) ( GREATER-THAN ?auto_4719 ?auto_4715 ) ( GREATER-THAN ?auto_4719 ?auto_4717 ) ( GREATER-THAN ?auto_4719 ?auto_4714 ) ( GREATER-THAN ?auto_4719 ?auto_4718 ) ( IN-CITY ?auto_4722 ?auto_4720 ) ( IN-CITY ?auto_4716 ?auto_4720 ) ( not ( = ?auto_4716 ?auto_4722 ) ) ( OBJ-AT ?auto_4719 ?auto_4722 ) ( IN-CITY ?auto_4725 ?auto_4720 ) ( not ( = ?auto_4716 ?auto_4725 ) ) ( OBJ-AT ?auto_4718 ?auto_4725 ) ( IN-CITY ?auto_4724 ?auto_4720 ) ( not ( = ?auto_4716 ?auto_4724 ) ) ( OBJ-AT ?auto_4714 ?auto_4724 ) ( IN-CITY ?auto_4726 ?auto_4720 ) ( not ( = ?auto_4716 ?auto_4726 ) ) ( OBJ-AT ?auto_4717 ?auto_4726 ) ( TRUCK-AT ?auto_4721 ?auto_4723 ) ( IN-CITY ?auto_4723 ?auto_4720 ) ( not ( = ?auto_4716 ?auto_4723 ) ) ( OBJ-AT ?auto_4715 ?auto_4723 ) ( not ( = ?auto_4715 ?auto_4717 ) ) ( not ( = ?auto_4726 ?auto_4723 ) ) ( not ( = ?auto_4715 ?auto_4714 ) ) ( not ( = ?auto_4717 ?auto_4714 ) ) ( not ( = ?auto_4724 ?auto_4726 ) ) ( not ( = ?auto_4724 ?auto_4723 ) ) ( not ( = ?auto_4715 ?auto_4718 ) ) ( not ( = ?auto_4717 ?auto_4718 ) ) ( not ( = ?auto_4714 ?auto_4718 ) ) ( not ( = ?auto_4725 ?auto_4724 ) ) ( not ( = ?auto_4725 ?auto_4726 ) ) ( not ( = ?auto_4725 ?auto_4723 ) ) ( not ( = ?auto_4715 ?auto_4719 ) ) ( not ( = ?auto_4717 ?auto_4719 ) ) ( not ( = ?auto_4714 ?auto_4719 ) ) ( not ( = ?auto_4718 ?auto_4719 ) ) ( not ( = ?auto_4722 ?auto_4725 ) ) ( not ( = ?auto_4722 ?auto_4724 ) ) ( not ( = ?auto_4722 ?auto_4726 ) ) ( not ( = ?auto_4722 ?auto_4723 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4715 ?auto_4717 ?auto_4714 ?auto_4718 ?auto_4716 )
      ( DELIVER-1PKG ?auto_4719 ?auto_4716 )
      ( DELIVER-5PKG-VERIFY ?auto_4715 ?auto_4717 ?auto_4714 ?auto_4718 ?auto_4719 ?auto_4716 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_4734 - OBJ
      ?auto_4736 - OBJ
      ?auto_4733 - OBJ
      ?auto_4737 - OBJ
      ?auto_4738 - OBJ
      ?auto_4735 - LOCATION
    )
    :vars
    (
      ?auto_4745 - LOCATION
      ?auto_4742 - CITY
      ?auto_4739 - LOCATION
      ?auto_4741 - LOCATION
      ?auto_4744 - LOCATION
      ?auto_4740 - LOCATION
      ?auto_4743 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4736 ?auto_4734 ) ( GREATER-THAN ?auto_4733 ?auto_4734 ) ( GREATER-THAN ?auto_4733 ?auto_4736 ) ( GREATER-THAN ?auto_4737 ?auto_4734 ) ( GREATER-THAN ?auto_4737 ?auto_4736 ) ( GREATER-THAN ?auto_4737 ?auto_4733 ) ( GREATER-THAN ?auto_4738 ?auto_4734 ) ( GREATER-THAN ?auto_4738 ?auto_4736 ) ( GREATER-THAN ?auto_4738 ?auto_4733 ) ( GREATER-THAN ?auto_4738 ?auto_4737 ) ( IN-CITY ?auto_4745 ?auto_4742 ) ( IN-CITY ?auto_4735 ?auto_4742 ) ( not ( = ?auto_4735 ?auto_4745 ) ) ( OBJ-AT ?auto_4738 ?auto_4745 ) ( IN-CITY ?auto_4739 ?auto_4742 ) ( not ( = ?auto_4735 ?auto_4739 ) ) ( OBJ-AT ?auto_4737 ?auto_4739 ) ( IN-CITY ?auto_4741 ?auto_4742 ) ( not ( = ?auto_4735 ?auto_4741 ) ) ( OBJ-AT ?auto_4733 ?auto_4741 ) ( IN-CITY ?auto_4744 ?auto_4742 ) ( not ( = ?auto_4735 ?auto_4744 ) ) ( OBJ-AT ?auto_4736 ?auto_4744 ) ( IN-CITY ?auto_4740 ?auto_4742 ) ( not ( = ?auto_4735 ?auto_4740 ) ) ( OBJ-AT ?auto_4734 ?auto_4740 ) ( not ( = ?auto_4734 ?auto_4736 ) ) ( not ( = ?auto_4744 ?auto_4740 ) ) ( not ( = ?auto_4734 ?auto_4733 ) ) ( not ( = ?auto_4736 ?auto_4733 ) ) ( not ( = ?auto_4741 ?auto_4744 ) ) ( not ( = ?auto_4741 ?auto_4740 ) ) ( not ( = ?auto_4734 ?auto_4737 ) ) ( not ( = ?auto_4736 ?auto_4737 ) ) ( not ( = ?auto_4733 ?auto_4737 ) ) ( not ( = ?auto_4739 ?auto_4741 ) ) ( not ( = ?auto_4739 ?auto_4744 ) ) ( not ( = ?auto_4739 ?auto_4740 ) ) ( not ( = ?auto_4734 ?auto_4738 ) ) ( not ( = ?auto_4736 ?auto_4738 ) ) ( not ( = ?auto_4733 ?auto_4738 ) ) ( not ( = ?auto_4737 ?auto_4738 ) ) ( not ( = ?auto_4745 ?auto_4739 ) ) ( not ( = ?auto_4745 ?auto_4741 ) ) ( not ( = ?auto_4745 ?auto_4744 ) ) ( not ( = ?auto_4745 ?auto_4740 ) ) ( TRUCK-AT ?auto_4743 ?auto_4735 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4743 ?auto_4735 ?auto_4740 ?auto_4742 )
      ( DELIVER-5PKG ?auto_4734 ?auto_4736 ?auto_4733 ?auto_4737 ?auto_4738 ?auto_4735 )
      ( DELIVER-5PKG-VERIFY ?auto_4734 ?auto_4736 ?auto_4733 ?auto_4737 ?auto_4738 ?auto_4735 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_4768 - OBJ
      ?auto_4770 - OBJ
      ?auto_4767 - OBJ
      ?auto_4771 - OBJ
      ?auto_4773 - OBJ
      ?auto_4772 - OBJ
      ?auto_4769 - LOCATION
    )
    :vars
    (
      ?auto_4775 - LOCATION
      ?auto_4776 - CITY
      ?auto_4781 - LOCATION
      ?auto_4777 - LOCATION
      ?auto_4779 - LOCATION
      ?auto_4780 - LOCATION
      ?auto_4774 - TRUCK
      ?auto_4778 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4770 ?auto_4768 ) ( GREATER-THAN ?auto_4767 ?auto_4768 ) ( GREATER-THAN ?auto_4767 ?auto_4770 ) ( GREATER-THAN ?auto_4771 ?auto_4768 ) ( GREATER-THAN ?auto_4771 ?auto_4770 ) ( GREATER-THAN ?auto_4771 ?auto_4767 ) ( GREATER-THAN ?auto_4773 ?auto_4768 ) ( GREATER-THAN ?auto_4773 ?auto_4770 ) ( GREATER-THAN ?auto_4773 ?auto_4767 ) ( GREATER-THAN ?auto_4773 ?auto_4771 ) ( GREATER-THAN ?auto_4772 ?auto_4768 ) ( GREATER-THAN ?auto_4772 ?auto_4770 ) ( GREATER-THAN ?auto_4772 ?auto_4767 ) ( GREATER-THAN ?auto_4772 ?auto_4771 ) ( GREATER-THAN ?auto_4772 ?auto_4773 ) ( IN-CITY ?auto_4775 ?auto_4776 ) ( IN-CITY ?auto_4769 ?auto_4776 ) ( not ( = ?auto_4769 ?auto_4775 ) ) ( OBJ-AT ?auto_4772 ?auto_4775 ) ( IN-CITY ?auto_4781 ?auto_4776 ) ( not ( = ?auto_4769 ?auto_4781 ) ) ( OBJ-AT ?auto_4773 ?auto_4781 ) ( IN-CITY ?auto_4777 ?auto_4776 ) ( not ( = ?auto_4769 ?auto_4777 ) ) ( OBJ-AT ?auto_4771 ?auto_4777 ) ( IN-CITY ?auto_4779 ?auto_4776 ) ( not ( = ?auto_4769 ?auto_4779 ) ) ( OBJ-AT ?auto_4767 ?auto_4779 ) ( IN-CITY ?auto_4780 ?auto_4776 ) ( not ( = ?auto_4769 ?auto_4780 ) ) ( OBJ-AT ?auto_4770 ?auto_4780 ) ( TRUCK-AT ?auto_4774 ?auto_4778 ) ( IN-CITY ?auto_4778 ?auto_4776 ) ( not ( = ?auto_4769 ?auto_4778 ) ) ( OBJ-AT ?auto_4768 ?auto_4778 ) ( not ( = ?auto_4768 ?auto_4770 ) ) ( not ( = ?auto_4780 ?auto_4778 ) ) ( not ( = ?auto_4768 ?auto_4767 ) ) ( not ( = ?auto_4770 ?auto_4767 ) ) ( not ( = ?auto_4779 ?auto_4780 ) ) ( not ( = ?auto_4779 ?auto_4778 ) ) ( not ( = ?auto_4768 ?auto_4771 ) ) ( not ( = ?auto_4770 ?auto_4771 ) ) ( not ( = ?auto_4767 ?auto_4771 ) ) ( not ( = ?auto_4777 ?auto_4779 ) ) ( not ( = ?auto_4777 ?auto_4780 ) ) ( not ( = ?auto_4777 ?auto_4778 ) ) ( not ( = ?auto_4768 ?auto_4773 ) ) ( not ( = ?auto_4770 ?auto_4773 ) ) ( not ( = ?auto_4767 ?auto_4773 ) ) ( not ( = ?auto_4771 ?auto_4773 ) ) ( not ( = ?auto_4781 ?auto_4777 ) ) ( not ( = ?auto_4781 ?auto_4779 ) ) ( not ( = ?auto_4781 ?auto_4780 ) ) ( not ( = ?auto_4781 ?auto_4778 ) ) ( not ( = ?auto_4768 ?auto_4772 ) ) ( not ( = ?auto_4770 ?auto_4772 ) ) ( not ( = ?auto_4767 ?auto_4772 ) ) ( not ( = ?auto_4771 ?auto_4772 ) ) ( not ( = ?auto_4773 ?auto_4772 ) ) ( not ( = ?auto_4775 ?auto_4781 ) ) ( not ( = ?auto_4775 ?auto_4777 ) ) ( not ( = ?auto_4775 ?auto_4779 ) ) ( not ( = ?auto_4775 ?auto_4780 ) ) ( not ( = ?auto_4775 ?auto_4778 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_4768 ?auto_4770 ?auto_4767 ?auto_4771 ?auto_4773 ?auto_4769 )
      ( DELIVER-1PKG ?auto_4772 ?auto_4769 )
      ( DELIVER-6PKG-VERIFY ?auto_4768 ?auto_4770 ?auto_4767 ?auto_4771 ?auto_4773 ?auto_4772 ?auto_4769 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_4790 - OBJ
      ?auto_4792 - OBJ
      ?auto_4789 - OBJ
      ?auto_4793 - OBJ
      ?auto_4795 - OBJ
      ?auto_4794 - OBJ
      ?auto_4791 - LOCATION
    )
    :vars
    (
      ?auto_4797 - LOCATION
      ?auto_4800 - CITY
      ?auto_4802 - LOCATION
      ?auto_4801 - LOCATION
      ?auto_4803 - LOCATION
      ?auto_4798 - LOCATION
      ?auto_4799 - LOCATION
      ?auto_4796 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4792 ?auto_4790 ) ( GREATER-THAN ?auto_4789 ?auto_4790 ) ( GREATER-THAN ?auto_4789 ?auto_4792 ) ( GREATER-THAN ?auto_4793 ?auto_4790 ) ( GREATER-THAN ?auto_4793 ?auto_4792 ) ( GREATER-THAN ?auto_4793 ?auto_4789 ) ( GREATER-THAN ?auto_4795 ?auto_4790 ) ( GREATER-THAN ?auto_4795 ?auto_4792 ) ( GREATER-THAN ?auto_4795 ?auto_4789 ) ( GREATER-THAN ?auto_4795 ?auto_4793 ) ( GREATER-THAN ?auto_4794 ?auto_4790 ) ( GREATER-THAN ?auto_4794 ?auto_4792 ) ( GREATER-THAN ?auto_4794 ?auto_4789 ) ( GREATER-THAN ?auto_4794 ?auto_4793 ) ( GREATER-THAN ?auto_4794 ?auto_4795 ) ( IN-CITY ?auto_4797 ?auto_4800 ) ( IN-CITY ?auto_4791 ?auto_4800 ) ( not ( = ?auto_4791 ?auto_4797 ) ) ( OBJ-AT ?auto_4794 ?auto_4797 ) ( IN-CITY ?auto_4802 ?auto_4800 ) ( not ( = ?auto_4791 ?auto_4802 ) ) ( OBJ-AT ?auto_4795 ?auto_4802 ) ( IN-CITY ?auto_4801 ?auto_4800 ) ( not ( = ?auto_4791 ?auto_4801 ) ) ( OBJ-AT ?auto_4793 ?auto_4801 ) ( IN-CITY ?auto_4803 ?auto_4800 ) ( not ( = ?auto_4791 ?auto_4803 ) ) ( OBJ-AT ?auto_4789 ?auto_4803 ) ( IN-CITY ?auto_4798 ?auto_4800 ) ( not ( = ?auto_4791 ?auto_4798 ) ) ( OBJ-AT ?auto_4792 ?auto_4798 ) ( IN-CITY ?auto_4799 ?auto_4800 ) ( not ( = ?auto_4791 ?auto_4799 ) ) ( OBJ-AT ?auto_4790 ?auto_4799 ) ( not ( = ?auto_4790 ?auto_4792 ) ) ( not ( = ?auto_4798 ?auto_4799 ) ) ( not ( = ?auto_4790 ?auto_4789 ) ) ( not ( = ?auto_4792 ?auto_4789 ) ) ( not ( = ?auto_4803 ?auto_4798 ) ) ( not ( = ?auto_4803 ?auto_4799 ) ) ( not ( = ?auto_4790 ?auto_4793 ) ) ( not ( = ?auto_4792 ?auto_4793 ) ) ( not ( = ?auto_4789 ?auto_4793 ) ) ( not ( = ?auto_4801 ?auto_4803 ) ) ( not ( = ?auto_4801 ?auto_4798 ) ) ( not ( = ?auto_4801 ?auto_4799 ) ) ( not ( = ?auto_4790 ?auto_4795 ) ) ( not ( = ?auto_4792 ?auto_4795 ) ) ( not ( = ?auto_4789 ?auto_4795 ) ) ( not ( = ?auto_4793 ?auto_4795 ) ) ( not ( = ?auto_4802 ?auto_4801 ) ) ( not ( = ?auto_4802 ?auto_4803 ) ) ( not ( = ?auto_4802 ?auto_4798 ) ) ( not ( = ?auto_4802 ?auto_4799 ) ) ( not ( = ?auto_4790 ?auto_4794 ) ) ( not ( = ?auto_4792 ?auto_4794 ) ) ( not ( = ?auto_4789 ?auto_4794 ) ) ( not ( = ?auto_4793 ?auto_4794 ) ) ( not ( = ?auto_4795 ?auto_4794 ) ) ( not ( = ?auto_4797 ?auto_4802 ) ) ( not ( = ?auto_4797 ?auto_4801 ) ) ( not ( = ?auto_4797 ?auto_4803 ) ) ( not ( = ?auto_4797 ?auto_4798 ) ) ( not ( = ?auto_4797 ?auto_4799 ) ) ( TRUCK-AT ?auto_4796 ?auto_4791 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4796 ?auto_4791 ?auto_4799 ?auto_4800 )
      ( DELIVER-6PKG ?auto_4790 ?auto_4792 ?auto_4789 ?auto_4793 ?auto_4795 ?auto_4794 ?auto_4791 )
      ( DELIVER-6PKG-VERIFY ?auto_4790 ?auto_4792 ?auto_4789 ?auto_4793 ?auto_4795 ?auto_4794 ?auto_4791 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_4827 - OBJ
      ?auto_4829 - OBJ
      ?auto_4826 - OBJ
      ?auto_4830 - OBJ
      ?auto_4832 - OBJ
      ?auto_4831 - OBJ
      ?auto_4833 - OBJ
      ?auto_4828 - LOCATION
    )
    :vars
    (
      ?auto_4834 - LOCATION
      ?auto_4835 - CITY
      ?auto_4837 - LOCATION
      ?auto_4841 - LOCATION
      ?auto_4840 - LOCATION
      ?auto_4842 - LOCATION
      ?auto_4838 - LOCATION
      ?auto_4836 - TRUCK
      ?auto_4839 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4829 ?auto_4827 ) ( GREATER-THAN ?auto_4826 ?auto_4827 ) ( GREATER-THAN ?auto_4826 ?auto_4829 ) ( GREATER-THAN ?auto_4830 ?auto_4827 ) ( GREATER-THAN ?auto_4830 ?auto_4829 ) ( GREATER-THAN ?auto_4830 ?auto_4826 ) ( GREATER-THAN ?auto_4832 ?auto_4827 ) ( GREATER-THAN ?auto_4832 ?auto_4829 ) ( GREATER-THAN ?auto_4832 ?auto_4826 ) ( GREATER-THAN ?auto_4832 ?auto_4830 ) ( GREATER-THAN ?auto_4831 ?auto_4827 ) ( GREATER-THAN ?auto_4831 ?auto_4829 ) ( GREATER-THAN ?auto_4831 ?auto_4826 ) ( GREATER-THAN ?auto_4831 ?auto_4830 ) ( GREATER-THAN ?auto_4831 ?auto_4832 ) ( GREATER-THAN ?auto_4833 ?auto_4827 ) ( GREATER-THAN ?auto_4833 ?auto_4829 ) ( GREATER-THAN ?auto_4833 ?auto_4826 ) ( GREATER-THAN ?auto_4833 ?auto_4830 ) ( GREATER-THAN ?auto_4833 ?auto_4832 ) ( GREATER-THAN ?auto_4833 ?auto_4831 ) ( IN-CITY ?auto_4834 ?auto_4835 ) ( IN-CITY ?auto_4828 ?auto_4835 ) ( not ( = ?auto_4828 ?auto_4834 ) ) ( OBJ-AT ?auto_4833 ?auto_4834 ) ( IN-CITY ?auto_4837 ?auto_4835 ) ( not ( = ?auto_4828 ?auto_4837 ) ) ( OBJ-AT ?auto_4831 ?auto_4837 ) ( IN-CITY ?auto_4841 ?auto_4835 ) ( not ( = ?auto_4828 ?auto_4841 ) ) ( OBJ-AT ?auto_4832 ?auto_4841 ) ( IN-CITY ?auto_4840 ?auto_4835 ) ( not ( = ?auto_4828 ?auto_4840 ) ) ( OBJ-AT ?auto_4830 ?auto_4840 ) ( IN-CITY ?auto_4842 ?auto_4835 ) ( not ( = ?auto_4828 ?auto_4842 ) ) ( OBJ-AT ?auto_4826 ?auto_4842 ) ( IN-CITY ?auto_4838 ?auto_4835 ) ( not ( = ?auto_4828 ?auto_4838 ) ) ( OBJ-AT ?auto_4829 ?auto_4838 ) ( TRUCK-AT ?auto_4836 ?auto_4839 ) ( IN-CITY ?auto_4839 ?auto_4835 ) ( not ( = ?auto_4828 ?auto_4839 ) ) ( OBJ-AT ?auto_4827 ?auto_4839 ) ( not ( = ?auto_4827 ?auto_4829 ) ) ( not ( = ?auto_4838 ?auto_4839 ) ) ( not ( = ?auto_4827 ?auto_4826 ) ) ( not ( = ?auto_4829 ?auto_4826 ) ) ( not ( = ?auto_4842 ?auto_4838 ) ) ( not ( = ?auto_4842 ?auto_4839 ) ) ( not ( = ?auto_4827 ?auto_4830 ) ) ( not ( = ?auto_4829 ?auto_4830 ) ) ( not ( = ?auto_4826 ?auto_4830 ) ) ( not ( = ?auto_4840 ?auto_4842 ) ) ( not ( = ?auto_4840 ?auto_4838 ) ) ( not ( = ?auto_4840 ?auto_4839 ) ) ( not ( = ?auto_4827 ?auto_4832 ) ) ( not ( = ?auto_4829 ?auto_4832 ) ) ( not ( = ?auto_4826 ?auto_4832 ) ) ( not ( = ?auto_4830 ?auto_4832 ) ) ( not ( = ?auto_4841 ?auto_4840 ) ) ( not ( = ?auto_4841 ?auto_4842 ) ) ( not ( = ?auto_4841 ?auto_4838 ) ) ( not ( = ?auto_4841 ?auto_4839 ) ) ( not ( = ?auto_4827 ?auto_4831 ) ) ( not ( = ?auto_4829 ?auto_4831 ) ) ( not ( = ?auto_4826 ?auto_4831 ) ) ( not ( = ?auto_4830 ?auto_4831 ) ) ( not ( = ?auto_4832 ?auto_4831 ) ) ( not ( = ?auto_4837 ?auto_4841 ) ) ( not ( = ?auto_4837 ?auto_4840 ) ) ( not ( = ?auto_4837 ?auto_4842 ) ) ( not ( = ?auto_4837 ?auto_4838 ) ) ( not ( = ?auto_4837 ?auto_4839 ) ) ( not ( = ?auto_4827 ?auto_4833 ) ) ( not ( = ?auto_4829 ?auto_4833 ) ) ( not ( = ?auto_4826 ?auto_4833 ) ) ( not ( = ?auto_4830 ?auto_4833 ) ) ( not ( = ?auto_4832 ?auto_4833 ) ) ( not ( = ?auto_4831 ?auto_4833 ) ) ( not ( = ?auto_4834 ?auto_4837 ) ) ( not ( = ?auto_4834 ?auto_4841 ) ) ( not ( = ?auto_4834 ?auto_4840 ) ) ( not ( = ?auto_4834 ?auto_4842 ) ) ( not ( = ?auto_4834 ?auto_4838 ) ) ( not ( = ?auto_4834 ?auto_4839 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_4827 ?auto_4829 ?auto_4826 ?auto_4830 ?auto_4832 ?auto_4831 ?auto_4828 )
      ( DELIVER-1PKG ?auto_4833 ?auto_4828 )
      ( DELIVER-7PKG-VERIFY ?auto_4827 ?auto_4829 ?auto_4826 ?auto_4830 ?auto_4832 ?auto_4831 ?auto_4833 ?auto_4828 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_4852 - OBJ
      ?auto_4854 - OBJ
      ?auto_4851 - OBJ
      ?auto_4855 - OBJ
      ?auto_4857 - OBJ
      ?auto_4856 - OBJ
      ?auto_4858 - OBJ
      ?auto_4853 - LOCATION
    )
    :vars
    (
      ?auto_4864 - LOCATION
      ?auto_4861 - CITY
      ?auto_4867 - LOCATION
      ?auto_4862 - LOCATION
      ?auto_4865 - LOCATION
      ?auto_4863 - LOCATION
      ?auto_4859 - LOCATION
      ?auto_4860 - LOCATION
      ?auto_4866 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_4854 ?auto_4852 ) ( GREATER-THAN ?auto_4851 ?auto_4852 ) ( GREATER-THAN ?auto_4851 ?auto_4854 ) ( GREATER-THAN ?auto_4855 ?auto_4852 ) ( GREATER-THAN ?auto_4855 ?auto_4854 ) ( GREATER-THAN ?auto_4855 ?auto_4851 ) ( GREATER-THAN ?auto_4857 ?auto_4852 ) ( GREATER-THAN ?auto_4857 ?auto_4854 ) ( GREATER-THAN ?auto_4857 ?auto_4851 ) ( GREATER-THAN ?auto_4857 ?auto_4855 ) ( GREATER-THAN ?auto_4856 ?auto_4852 ) ( GREATER-THAN ?auto_4856 ?auto_4854 ) ( GREATER-THAN ?auto_4856 ?auto_4851 ) ( GREATER-THAN ?auto_4856 ?auto_4855 ) ( GREATER-THAN ?auto_4856 ?auto_4857 ) ( GREATER-THAN ?auto_4858 ?auto_4852 ) ( GREATER-THAN ?auto_4858 ?auto_4854 ) ( GREATER-THAN ?auto_4858 ?auto_4851 ) ( GREATER-THAN ?auto_4858 ?auto_4855 ) ( GREATER-THAN ?auto_4858 ?auto_4857 ) ( GREATER-THAN ?auto_4858 ?auto_4856 ) ( IN-CITY ?auto_4864 ?auto_4861 ) ( IN-CITY ?auto_4853 ?auto_4861 ) ( not ( = ?auto_4853 ?auto_4864 ) ) ( OBJ-AT ?auto_4858 ?auto_4864 ) ( IN-CITY ?auto_4867 ?auto_4861 ) ( not ( = ?auto_4853 ?auto_4867 ) ) ( OBJ-AT ?auto_4856 ?auto_4867 ) ( IN-CITY ?auto_4862 ?auto_4861 ) ( not ( = ?auto_4853 ?auto_4862 ) ) ( OBJ-AT ?auto_4857 ?auto_4862 ) ( IN-CITY ?auto_4865 ?auto_4861 ) ( not ( = ?auto_4853 ?auto_4865 ) ) ( OBJ-AT ?auto_4855 ?auto_4865 ) ( IN-CITY ?auto_4863 ?auto_4861 ) ( not ( = ?auto_4853 ?auto_4863 ) ) ( OBJ-AT ?auto_4851 ?auto_4863 ) ( IN-CITY ?auto_4859 ?auto_4861 ) ( not ( = ?auto_4853 ?auto_4859 ) ) ( OBJ-AT ?auto_4854 ?auto_4859 ) ( IN-CITY ?auto_4860 ?auto_4861 ) ( not ( = ?auto_4853 ?auto_4860 ) ) ( OBJ-AT ?auto_4852 ?auto_4860 ) ( not ( = ?auto_4852 ?auto_4854 ) ) ( not ( = ?auto_4859 ?auto_4860 ) ) ( not ( = ?auto_4852 ?auto_4851 ) ) ( not ( = ?auto_4854 ?auto_4851 ) ) ( not ( = ?auto_4863 ?auto_4859 ) ) ( not ( = ?auto_4863 ?auto_4860 ) ) ( not ( = ?auto_4852 ?auto_4855 ) ) ( not ( = ?auto_4854 ?auto_4855 ) ) ( not ( = ?auto_4851 ?auto_4855 ) ) ( not ( = ?auto_4865 ?auto_4863 ) ) ( not ( = ?auto_4865 ?auto_4859 ) ) ( not ( = ?auto_4865 ?auto_4860 ) ) ( not ( = ?auto_4852 ?auto_4857 ) ) ( not ( = ?auto_4854 ?auto_4857 ) ) ( not ( = ?auto_4851 ?auto_4857 ) ) ( not ( = ?auto_4855 ?auto_4857 ) ) ( not ( = ?auto_4862 ?auto_4865 ) ) ( not ( = ?auto_4862 ?auto_4863 ) ) ( not ( = ?auto_4862 ?auto_4859 ) ) ( not ( = ?auto_4862 ?auto_4860 ) ) ( not ( = ?auto_4852 ?auto_4856 ) ) ( not ( = ?auto_4854 ?auto_4856 ) ) ( not ( = ?auto_4851 ?auto_4856 ) ) ( not ( = ?auto_4855 ?auto_4856 ) ) ( not ( = ?auto_4857 ?auto_4856 ) ) ( not ( = ?auto_4867 ?auto_4862 ) ) ( not ( = ?auto_4867 ?auto_4865 ) ) ( not ( = ?auto_4867 ?auto_4863 ) ) ( not ( = ?auto_4867 ?auto_4859 ) ) ( not ( = ?auto_4867 ?auto_4860 ) ) ( not ( = ?auto_4852 ?auto_4858 ) ) ( not ( = ?auto_4854 ?auto_4858 ) ) ( not ( = ?auto_4851 ?auto_4858 ) ) ( not ( = ?auto_4855 ?auto_4858 ) ) ( not ( = ?auto_4857 ?auto_4858 ) ) ( not ( = ?auto_4856 ?auto_4858 ) ) ( not ( = ?auto_4864 ?auto_4867 ) ) ( not ( = ?auto_4864 ?auto_4862 ) ) ( not ( = ?auto_4864 ?auto_4865 ) ) ( not ( = ?auto_4864 ?auto_4863 ) ) ( not ( = ?auto_4864 ?auto_4859 ) ) ( not ( = ?auto_4864 ?auto_4860 ) ) ( TRUCK-AT ?auto_4866 ?auto_4853 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4866 ?auto_4853 ?auto_4860 ?auto_4861 )
      ( DELIVER-7PKG ?auto_4852 ?auto_4854 ?auto_4851 ?auto_4855 ?auto_4857 ?auto_4856 ?auto_4858 ?auto_4853 )
      ( DELIVER-7PKG-VERIFY ?auto_4852 ?auto_4854 ?auto_4851 ?auto_4855 ?auto_4857 ?auto_4856 ?auto_4858 ?auto_4853 ) )
  )

)

