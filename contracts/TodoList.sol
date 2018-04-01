pragma solidity ^0.4.2;

contract TodoList {
  TodoItem[] public todoItems;

  struct TodoItem {
    bytes32 value;
    bool completed;
  }

  function toggleItemComplete(uint index) public returns (bool success) {
    if (index >= todoItems.length) return;

    todoItems[index].completed = !todoItems[index].completed;
    return true;
  }

  function addTodoItem(bytes32 _value) public returns (bool success) {
    TodoItem memory todoItem;
    todoItem.value = _value;
    todoItem.completed = false;

    todoItems.push(todoItem);
    return true;
  }

  function getTodoItems() public constant returns (bytes32[], bool[]) {
    uint length = todoItems.length;

    bytes32[] memory values = new bytes32[](length);
    bool[] memory completes = new bool[](length);

    for (uint i = 0; i < length; i++) {
      values[i] = todoItems[i].value;
      completes[i] = todoItems[i].completed;
    }

    return (values, completes);
  }

  function deleteTodoItem(uint index) public returns (bool success) {
    if (index >= todoItems.length) return;

    for (uint i = index; i < todoItems.length - 1; i++){
      todoItems[i] = todoItems[i+1];
    }

    delete todoItems[todoItems.length - 1];
    todoItems.length--;
    return true;
  }
}