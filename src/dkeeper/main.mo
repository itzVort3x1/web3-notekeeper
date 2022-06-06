import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper {
  // this is creating a data type in motoko language.
  public type Note = {
    title: Text;
    content: Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, titleContent: Text){
    let newNote: Note = {
      title = titleText;
      content = titleContent;
    };

    notes := List.push(newNote, notes);
    Debug.print(debug_show(notes));
  };

  public query func readNotes(): async [Note]{
    return List.toArray(notes);
  };

  public func deleteNote(id: Nat){
    var firstNotes = List.take(notes, id);
    var secondNotes = List.drop(notes, id + 1);
    notes := List.append(firstNotes, secondNotes); 
  };

}

// import List "mo:base/List";

// actor {

//      var notes: List.List<Text> = List.nil<Text>();

//     notes := List.push("A", notes);
//     notes := List.push("B", notes);
//     notes := List.push("C", notes);
//     notes := List.push("D", notes);

//      public query func getNotes(): async List.List<Text> {
//          return notes;
//      };

//      public func take(index: Nat) {
//          notes := List.take(notes, index);
//      };

//     public func drop(index: Nat) {
//          notes := List.drop(notes, index);
//      };

// }