//
//  ReviewData.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/30/24.
//

import Foundation

struct ReviewData {
    let reviewTitle: String
    let reviewRating: String
    let reviewDate: String
    let reviewer: String
    let reviewContent: String
    let developer: String
    let answerDate: String
    let answerContent: String
}

extension ReviewData {
    static let mockData: [ReviewData] = [
        ReviewData(reviewTitle: "토스 UX 전버전으로 해주세요",
                   reviewRating: "★★★★★",
                   reviewDate: "9월 27일 •",
                   reviewer: "흑 운영자님 ㅠㅠ",
                   reviewContent: "최근 업데이트가 토스 만의 ux 색깔 개성자체를\n잃어버린 것 같습니다. 메인 화면 볼때마다 되게\n부드럽고 한눈에 보기 편했는데, 이번 업데이트로\n인해 딱딱해진 것 같네요. 새로움을 지향하는건\n좋으나 이용자들에게 강제가 아닌 선택할 수 있는\n옵션이라도 만들어 주셨으면 어떨까요?",
                   developer: "개발자 답변",
                   answerDate: "9월 29일",
                   answerContent: "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서\n너무나 감사합니다. 토스 화면 UI를 사용자의 \n요구를 반영해 조금 더 편리하게 사용하도록 변경\n 하였습니다만, 고객님처럼 불편하게 느끼셨을\n수도 있다고 생각합니다. 사용에 불편을 드려 죄송\n합니다.\n고객님께서 말씀해주신 내용은 반영될 수 있다\n확답 드리기는 어려우나, 팀내에 공유하여 보다\n편리한 토스 사용 경험을 하실 수 있도록 노력\n하겠습니다. 다른 문의 사항이 있다면 24시간 운영\n되는 카카오톡(@toss) 또는 고객센터 1599-\n4905로 문의 부탁드립니다. 감사합니다."),
        ReviewData(reviewTitle: "굿굿",
                   reviewRating: "★★★★★",
                   reviewDate: "9월 20일 •",
                   reviewer: "리뷰어1",
                   reviewContent: "굿이에요",
                   developer: "개발자 답변",
                   answerDate: "9월 22일",
                   answerContent: "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서\n너무나 감사합니다. 토스 화면 UI를 사용자의 \n요구를 반영해 조금 더 편리하게 사용하도록 변경\n 하였습니다만, 고객님처럼 불편하게 느끼셨을\n수도 있다고 생각합니다. 사용에 불편을 드려 죄송\n합니다.\n고객님께서 말씀해주신 내용은 반영될 수 있다\n확답 드리기는 어려우나, 팀내에 공유하여 보다\n편리한 토스 사용 경험을 하실 수 있도록 노력\n하겠습니다. 다른 문의 사항이 있다면 24시간 운영\n되는 카카오톡(@toss) 또는 고객센터 1599-\n4905로 문의 부탁드립니다. 감사합니다."),
        ReviewData(reviewTitle: "아쉽네요",
                   reviewRating: "☆☆☆☆☆",
                   reviewDate: "9월 24일 •",
                   reviewer: "리뷰어2",
                   reviewContent: "우웩",
                   developer: "개발자 답변",
                   answerDate: "9월 25일",
                   answerContent: "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서\n너무나 감사합니다. 토스 화면 UI를 사용자의 \n요구를 반영해 조금 더 편리하게 사용하도록 변경\n 하였습니다만, 고객님처럼 불편하게 느끼셨을\n수도 있다고 생각합니다. 사용에 불편을 드려 죄송\n합니다.\n고객님께서 말씀해주신 내용은 반영될 수 있다\n확답 드리기는 어려우나, 팀내에 공유하여 보다\n편리한 토스 사용 경험을 하실 수 있도록 노력\n하겠습니다. 다른 문의 사항이 있다면 24시간 운영\n되는 카카오톡(@toss) 또는 고객센터 1599-\n4905로 문의 부탁드립니다. 감사합니다."),
        ReviewData(reviewTitle: "우왕",
                   reviewRating: "★★★★☆",
                   reviewDate: "10월 1일 •",
                   reviewer: "리뷰어3",
                   reviewContent: "우와아",
                   developer: "개발자 답변",
                   answerDate: "10월 2일",
                   answerContent: "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서\n너무나 감사합니다. 토스 화면 UI를 사용자의 \n요구를 반영해 조금 더 편리하게 사용하도록 변경\n 하였습니다만, 고객님처럼 불편하게 느끼셨을\n수도 있다고 생각합니다. 사용에 불편을 드려 죄송\n합니다.\n고객님께서 말씀해주신 내용은 반영될 수 있다\n확답 드리기는 어려우나, 팀내에 공유하여 보다\n편리한 토스 사용 경험을 하실 수 있도록 노력\n하겠습니다. 다른 문의 사항이 있다면 24시간 운영\n되는 카카오톡(@toss) 또는 고객센터 1599-\n4905로 문의 부탁드립니다. 감사합니다."),
        ReviewData(reviewTitle: "돈 주세요",
                   reviewRating: "★★★☆☆",
                   reviewDate: "10월 2일 •",
                   reviewer: "리뷰어4",
                   reviewContent: "우웩",
                   developer: "개발자 답변",
                   answerDate: "10월 4일",
                   answerContent: "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서\n너무나 감사합니다. 토스 화면 UI를 사용자의 \n요구를 반영해 조금 더 편리하게 사용하도록 변경\n 하였습니다만, 고객님처럼 불편하게 느끼셨을\n수도 있다고 생각합니다. 사용에 불편을 드려 죄송\n합니다.\n고객님께서 말씀해주신 내용은 반영될 수 있다\n확답 드리기는 어려우나, 팀내에 공유하여 보다\n편리한 토스 사용 경험을 하실 수 있도록 노력\n하겠습니다. 다른 문의 사항이 있다면 24시간 운영\n되는 카카오톡(@toss) 또는 고객센터 1599-\n4905로 문의 부탁드립니다. 감사합니다."),
    ]
}
