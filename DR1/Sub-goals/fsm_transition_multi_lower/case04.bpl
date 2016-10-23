implementation driver(){
var t: ref;
call init_tar_model();
call T2TB_matchAll();
call T2TB_applyAll();
assume read($tarHeap, t, FSM$Transition.stateMachine) == null || !read($tarHeap, read($tarHeap, t, FSM$Transition.stateMachine), alloc);
assume !Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$StateMachine), read($tarHeap, t, FSM$Transition.stateMachine));
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$Transition), t);
assume genBy(t, _T2TB, $srcHeap, $tarHeap);
assume genBy(t, _T2TA, $srcHeap, $tarHeap) || genBy(t, _T2TB, $srcHeap, $tarHeap) || genBy(t, _T2TC, $srcHeap, $tarHeap);
assert false;
}

