//mediator

abstract class ChatRoom {
  void send(String message, ChatMember chatMember);
}

class ChatMediator implements ChatRoom {
  List<ChatMember> users = [];

  void addUser(ChatMember chatMember) {
    users.add(chatMember);
  }

  @override
  void send(String message, ChatMember sender) {
    for (var user in users) {
      if (user != sender) {
        user.receive(message);
      }
    }
  }
}

abstract class ChatMember {
  ChatRoom chatRoom;

  ChatMember(this.chatRoom);

  void send(String message);
  void receive(String message);
}

class User extends ChatMember {
  String name;

  User(String name, ChatRoom chatRoom)
      : this.name = name,
        super(chatRoom);

  @override
  void send(String message) {
    print('User $name sending message: $message');
    chatRoom.send(message, this);
  }

  @override
  void receive(String message) {
    print('User $name received message: $message');
  }
}

void main() {
  var chatMediator = ChatMediator();
  var user1 = User('Alice', chatMediator);
  var user2 = User('Bob', chatMediator);
  var user3 = User('Charlie', chatMediator);

  chatMediator.addUser(user1);
  chatMediator.addUser(user2);
  chatMediator.addUser(user3);

  user1.send("Hi everyone!");
  user2.send("Hello Alice!");
  user3.send("Hey Bob and Alice!");
}
