implementation driver(){
var s: ref;
call init_tar_model();
call SM2SM_matchAll();
call RS2RS_matchAll();
call SM2SM_applyAll();
call RS2RS_applyAll();
assume read($tarHeap, s, FSM$AbstractState.stateMachine) == null || !read($tarHeap, read($tarHeap, s, FSM$AbstractState.stateMachine), alloc);
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s);
assume Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$StateMachine), read($tarHeap, s, FSM$AbstractState.stateMachine));
assume genBy(read($tarHeap, s, FSM$AbstractState.stateMachine), _SM2SM, $srcHeap, $tarHeap);
assume genBy(s, _RS2RS, $srcHeap, $tarHeap);
assume genBy(read($tarHeap, s, FSM$AbstractState.stateMachine), _SM2SM, $srcHeap, $tarHeap) || false;
assume genBy(s, _RS2RS, $srcHeap, $tarHeap) || genBy(s, _IS2IS, $srcHeap, $tarHeap) || genBy(s, _IS2RS, $srcHeap, $tarHeap) || genBy(s, _CS2RS, $srcHeap, $tarHeap);
assert false;
}

