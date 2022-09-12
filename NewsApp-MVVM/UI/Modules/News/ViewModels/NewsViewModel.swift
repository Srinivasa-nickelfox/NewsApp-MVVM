//
//  ArticleListViewModel.swift
//  NewsApp-MVVM
//
//  Created by Midhun Kasibhatla on 11/09/22.
//

import Foundation

protocol ArticleViewModelDelegate: AnyObject {
    func reload() 
}

class ArticleViewModel {
    weak var view: ArticleViewModelDelegate?
    
    init(_ view: ArticleViewModelDelegate?) {
        self.view = view
    }
    
}

extension ArticleViewModel: NewsViewControllerDelegate {
    func APICall() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=af636d01048d448180b9daf62d844f43")!
        
        WebServices().getNews(url: url) { _ in
            
        }
        self.view?.reload()
    }
    
}
