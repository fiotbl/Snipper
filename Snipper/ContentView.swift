//
//  ContentView.swift
//  Snipper
//
//  Created by Fiora Tan on 1/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var snippets: [Snippet] = []
    @State private var newSnippetContent: String = ""
    @State private var selectedTopic: Topic? = nil
    @State private var topics: [Topic] = [
        Topic(name: "Swift"),
        Topic(name: "Python"),
        Topic(name: "JavaScript")
    ]

    var body: some View {
        NavigationView {
            List(topics, selection: $selectedTopic) { topic in
                NavigationLink(destination: SnippetListView(snippets: $snippets, topic: topic, newSnippetContent: $newSnippetContent)) {
                    Text(topic.name)
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 150, idealWidth: 200, maxWidth: 300)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: addTopic) {
                        Label("Add Topic", systemImage: "plus")
                    }
                }
            }

            Text("Select a Topic")
        }
    }

    func addTopic() {
        // Add a new topic to the topics array
        // For example purposes, we're adding a generic new topic
        // You would have a way for the user to specify the topic name
        let newTopic = Topic(name: "New Topic \(topics.count + 1)")
        topics.append(newTopic)
    }
}

struct SnippetListView: View {
    @Binding var snippets: [Snippet]
    let topic: Topic
    @Binding var newSnippetContent: String

    var filteredSnippets: [Snippet] {
        snippets.filter { $0.topic == topic.name }
    }

    var body: some View {
        VStack {
            List {
                ForEach(filteredSnippets) { snippet in
                    HStack {
                        Text(snippet.content)
                        Spacer()
                        Button(action: {
                            self.copyToClipboard(snippet.content)
                        }) {
                            Image(systemName: "doc.on.doc")
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            
            HStack {
                TextField("New Snippet", text: $newSnippetContent)
                Button(action: {
                    addSnippet()
                }) {
                    Image(systemName: "plus")
                }
            }.padding()
        }
        .navigationTitle(topic.name)
    }

    func addSnippet() {
        let newSnippet = Snippet(content: newSnippetContent, topic: topic.name)
        snippets.append(newSnippet)
        newSnippetContent = ""
    }
    
    func delete(at offsets: IndexSet) {
        snippets.remove(atOffsets: offsets)
    }
    
    func copyToClipboard(_ string: String) {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(string, forType: .string)
    }
}
