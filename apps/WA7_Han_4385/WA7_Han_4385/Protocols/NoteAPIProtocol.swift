//
//  NoteAPIProtocol.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import Foundation
// Base URL: http://apis.sakibnm.work:3000/api/note

// MARK: get all notes
protocol GetAllNoteProtocol{
    func getAllNotes(token: String)
}

// MARK: get a new note
protocol PostNoteProtocol{
    func postNote(token: String, text: String)
}

// MARK: delete a note
protocol DeleteANoteProtocol{
    func deleteNote(token: String, note: Note)
}
