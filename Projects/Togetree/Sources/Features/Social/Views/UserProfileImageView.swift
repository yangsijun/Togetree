//
//  UserProfileView.swift
//  Togetree
//
//  Created by 양시준 on 4/14/25.
//

import SwiftUI

struct UserProfileImageView: View {
    @State private var loader = ImageLoader()
    var user: User
    var imageSize: CGFloat
    
    var body: some View {
        Group {
            Group {
                if let image = loader.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageSize, height: imageSize)
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageSize, height: imageSize)
                }
            }
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray.opacity(0.2), lineWidth: 1))
            .onAppear {
                if let url = URL(string: user.profileImageUrl ?? "") {
                    loader.load(from: url)
                }
            }
            .onChange(of: user) {
                if let url = URL(string: user.profileImageUrl ?? "") {
                    loader.load(from: url)
                }
            }
        }
    }
}

struct UserProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            UserProfileImageView(
                user: mockUserList[0],
                imageSize: 100
            )
            UserProfileImageView(
                user: mockUserList[0],
                imageSize: 64
            )
            UserProfileImageView(
                user: mockUserList[0],
                imageSize: 32
            )
//            UserProfileImageView(
//                user: .init(name: "Test User", profileImageUrl: ""),
//                imageSize: 32
//            )
        }
    }
}

@Observable class ImageLoader {
    var image: UIImage?
    var isFailed = false

    func load(from url: URL) {
        isFailed = false
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data, let img = UIImage(data: data) {
                    self.image = img
                } else {
                    self.isFailed = true
                }
            }
        }
        task.resume()
    }
}
