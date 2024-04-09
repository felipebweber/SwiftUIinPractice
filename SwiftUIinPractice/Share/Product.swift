//
//  Product.swift
//  SwiftUIinPractice
//
//  Created by Felipe Weber on 03/04/24.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    static var mock: Product {
        Product(id: 1,
                title: "Some product",
                description: "Some description",
                price: 100,
                discountPercentage: 10,
                rating: 4.5,
                stock: 10,
                brand: "Some brand",
                category: "Some category",
                thumbnail: Constants.randomImage,
                images: [Constants.randomImage, Constants.randomImage, Constants.randomImage])
    }
}

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}
