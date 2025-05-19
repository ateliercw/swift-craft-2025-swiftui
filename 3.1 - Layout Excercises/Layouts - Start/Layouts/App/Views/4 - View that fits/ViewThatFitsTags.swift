//
//  ViewThatFitsTags.swift
//  Layouts
//
//  Created by Coruț Fabrizio on 19.05.2025.
//

import SwiftUI

struct ViewThatFitsTags: View {
    
    /// Data source.
    private let tags: [String]
    
    // MARK: - Init.
    
    init(tags: [String]) {
        self.tags = tags
    }
    
    // MARK: - Body.
    
    var body: some View {
        HStack(spacing: 8.0) {
            ForEach(tags, id: \.self) { tag in
                TagItem(tag: tag)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    /// Event specific tag.
    struct TagItem: View {
        
        /// Data source.
        private let tag: String
        
        // MARK: - Init.
        
        init(tag: String) {
            self.tag = tag
        }
        
        // MARK: - Body.
        
        var body: some View {
            Text(tag)
                .font(.caption)
                .fontWeight(.semibold)
                .textCase(.uppercase)
                .padding(4.0)
                .foregroundStyle(.black)
                .background(.thickMaterial)
                .clipShape(.rect(cornerRadius: 6.0))
        }
    }
}

#Preview {
    ZStack {
        LinearGradient(colors: [.teal, .orange, .cyan], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
        
        VStack(alignment: .leading) {
            Image(.swiftcraft)
                .resizable()
                .scaledToFit()
            
            Text("Mastering SwiftUI")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("""
            This workshop covers how to deal some of the problems that arise when working on a complex SwiftUI project.
            Topics include understanding the data flow between view layers, designing complex layouts, and handling animations.
            """)
            .fontWeight(.thin)
            
            ViewThatFitsTags(
                tags: [
                    "Layout",
                    "Animations",
                    "State",
                    "ViewThatFits",
                    "AlignmentGuide",
                    "GeometryReader"
                ]
            )
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(.rect(cornerRadius: 16.0))
        .padding(32.0)
    }
}
