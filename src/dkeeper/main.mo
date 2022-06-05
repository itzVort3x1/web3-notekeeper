import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper {
  // this is creating a data type in motoko language.
  public type Note = {
    title: Text;
    content: Text;
  };

  var notes: List.List<Note> = List.nil<Note>();

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
}