//
//  LanguageManager.swift
//  travelbuddy
//
//  Created by Edmund Mai on 12/27/15.
//  Copyright © 2015 Edmund Mai. All rights reserved.
//

import Foundation

class LanguageManager: NSObject {
  static let sharedInstance = LanguageManager()
  
  var languageOfCurrentCountry = "English"
  var languageOfDevice = "English"
  
  private let chineseSpeakingCountries = ["CN", "TW", "HK", "MO"]
  private let spanishSpeakingCountries = ["AD", "AR", "ES", "GI", "GQ", "CO", "BO", "CL", "CR", "CU", "DO", "EC", "SV", "GT", "HN", "MX", "NI", "PA", "PY", "PE", "PR", "UY", "VE"]
  private let koreanSpeakingCountries = ["KR", "KP"]
  private let japaneseSpeakingCountries = ["JP"]
  private let hindiSpeakingCountries = ["IN"]
  private let russianSpeakingCountries = ["UA", "RU", "KZ", "BY", "KG", "TJ"]
  
  private let englishWordTranslations = [
    "Toilet": "Toilet",
    "ATM": "ATM",
    "Food": "Food",
    "Taxi": "Taxi",
    "Subway": "Subway",
    "Airport": "Airport",
    "Outlet": "Outlet",
    "Hotel": "Hotel",
    "Wifi": "Wifi"
  ]

  private let koreanWordTranslations = [
    "Toilet": "화장실",
    "ATM": "ATM",
    "Food": "맛집",
    "Taxi": "택시",
    "Subway": "지하철",
    "Airport": "공항",
    "Outlet": "전기 콘센트",
    "Hotel": "호텔",
    "Wifi": "와이파이"
  ]
  
  private let spanishWordTranslations = [
    "Toilet": "El baño",
    "ATM": "ATM",
    "Food": "Comida",
    "Taxi": "Taxi",
    "Subway": "Metro",
    "Airport": "Aeropuerto",
    "Outlet": "Enchufe",
    "Hotel": "Hotel",
    "Wifi": "Wifi"
  ]
  
  private let japaneseWordTranslations = [
    "Toilet": "トイレ",
    "ATM": "ATM",
    "Food": "食べ物",
    "Taxi": "タクシー",
    "Subway": "地下鉄",
    "Airport": "空港",
    "Outlet": "コンセント",
    "Hotel": "ホテル",
    "Wifi": "Wi-Fi"
  ]
  
  private let chineseWordTranslations = [
    "Toilet": "洗手間",
    "ATM": "自動取款機",
    "Food": "好吃的",
    "Taxi": "出租車",
    "Subway": "地鐵",
    "Airport": "機場",
    "Outlet": "插孔",
    "Hotel": "飯店",
    "Wifi": "網絡"
  ]
  
  private let hindiWordTranslations = [
    "Toilet": "शौचालय",
    "ATM": "एटीएम",
    "Food": "भोजन",
    "Taxi": "टैक्सी",
    "Subway": "मेट्रो",
    "Airport": "हवाई अड्डे",
    "Outlet": "विद्युत निकास",
    "Hotel": "होटल",
    "Wifi": " वाईफ़ाई"
  ]
  
  private let englishSentenceTranslations = [
    "Toilet": "Where can I find a toilet?",
    "ATM": "Where can I find an ATM?",
    "Food": "Where can I find something to eat around here?",
    "Taxi": "Where can I find a taxi around here?",
    "Subway": "Where would I find a subway?",
    "Airport": "Please take me to the airport.",
    "Outlet": "Would you know where I can find an electric outlet?",
    "Hotel": "Could you please help me find my hotel?",
    "Wifi": "Would you know where I can find wifi?"
  ]
  
  private let russianWordTranslations = [
    "Toilet": "туалет",
    "ATM": "Банкомат",
    "Food": "еда",
    "Taxi": "такси",
    "Subway": "метро",
    "Airport": "аэропорт",
    "Outlet": "розетка",
    "Hotel": "Гостиница",
    "Wifi": "Wifi"
  ]

  private let russianSentenceTranslations = [
    "Toilet": "Где я могу найти туалет?",
    "ATM": "Где я могу найти банкомат ?",
    "Food": "Где я могу найти что-то , чтобы поесть здесь?",
    "Taxi": "Где я могу найти такси?",
    "Subway": "Где я могу найти ближайшую станцию ​​метро ?",
    "Airport": "Пожалуйста, возьми меня в аэропорт",
    "Outlet": "Есть ли у вас розетку ?",
    "Hotel": "Можете ли вы помочь мне найти мою гостиницу?",
    "Wifi": "Где я могу найти WiFi?"
  ]
  
  private let koreanSentenceTranslations = [
    "Toilet": "근처에 화장실이 어디에 있어요?",
    "ATM": "근처에 ATM기가 어디에 있어요?",
    "Food": "근처에 유명한 맛집이 있어요?",
    "Taxi": "어디서 택시를 탈 수 있어요?",
    "Subway": "근처에 지하철 역이 어디에요?",
    "Airport": "공한으로 가주시겠어요?",
    "Outlet": "혹시, 전기 콘센트가 어디에 있는지 아세요?",
    "Hotel": "이 호텔에 어떻게 가는지 아세요?",
    "Wifi": "혹시, 와이파이 이용할 수 있는 곳을 아세요?"
  ]
  
  private let spanishSentenceTranslations = [
    "Toilet": "Donde está el baño?",
    "ATM": "Donde puedo encontrar un ATM?",
    "Food": "Donde puedo encontrar algo para comer?",
    "Taxi": "Donde puedo encontrar el metro?",
    "Subway": "Donde puedo conseguir un taxi?",
    "Airport": "Por favor lléveme al aeropuerto.",
    "Outlet": "Donde puedo encontrar un enchufe?",
    "Hotel": "Me puede ayudar a encontrar un hotel?",
    "Wifi": "Donde puedo encontrar wifi?"
  ]
  
  private let japaneseSentenceTranslations = [
    "Toilet": "トイレはどこですか？",
    "ATM": "ATMはどこですか？",
    "Food": "どこかに食べれる場所はありますか？",
    "Taxi": "タクシーはどこですか？",
    "Subway": "地下鉄はどこにありますか？",
    "Airport": "空港へ連れて行ってください",
    "Outlet": "コンセントはどこにありますか？",
    "Hotel": "ホテルどこですか？",
    "Wifi": "Wi-Fiはどこにありますか？"
  ]
  
  private let chineseSentenceTranslations = [
    "Toilet": "請問，洗手間在哪裡？",
    "ATM": "請問，附近有自動取款機嗎？",
    "Food": "請問，附近有什麼好吃的嗎？",
    "Taxi": "請問，哪邊可以叫到出租車？",
    "Subway": "請問，最近的地鐵站在哪裡？",
    "Airport": "我要去機場。",
    "Outlet": "請問，哪裡可以找到插孔？",
    "Hotel": "不好意思，您可以幫我找我的飯店嗎？",
    "Wifi": "你知道哪裡可以用網絡嗎？"
  ]
  
  private let hindiSentenceTranslations = [
    "Toilet": "कहां पास शौचालय है?",
    "ATM": "कहाँ यहाँ के पास एटीएम है?",
    "Food": "कहाँ मैं भोजन मिल सकता है?",
    "Taxi": "मुझे टैक्सी कहां मिलेगी?",
    "Subway": "यहाँ पास मैं स्टेशन कहाँ है?",
    "Airport": "कृपया मुझे हवाई अड्डे ले जाओ।.",
    "Outlet": "आपके पास बिजली के आउटलेट है?",
    "Hotel": "मुझे मेरे होटल पहुँचने के लिए मेरी मदद कर सकते हैं?",
    "Wifi": "मुझे वाईफ़ाई कहां मिलेगी?"
  ]
  
  private var sentenceTranslations: Dictionary<String, Dictionary<String, String>> {
    return [
      "Chinese": chineseSentenceTranslations,
      "English": englishSentenceTranslations,
      "Korean": koreanSentenceTranslations,
      "Japanese": japaneseSentenceTranslations,
      "Spanish": spanishSentenceTranslations,
      "Hindi": hindiSentenceTranslations,
      "Russian": russianSentenceTranslations
    ]
  }
  
  private var wordTranslations: Dictionary<String, Dictionary<String, String>> {
    return [
      "English": englishWordTranslations,
      "Chinese": chineseWordTranslations,
      "Korean": koreanWordTranslations,
      "Japanese": japaneseWordTranslations,
      "Spanish": spanishWordTranslations,
      "Hindi": hindiWordTranslations,
      "Russian": russianWordTranslations
    ]
  }
  
  func setLanguageFor(languageProperty: String, countryCode: String) {
    if chineseSpeakingCountries.contains(countryCode) {
      self.setValue("Chinese", forKey: languageProperty)
    }
    
    if spanishSpeakingCountries.contains(countryCode) {
      self.setValue("Spanish", forKey: languageProperty)
    }
    
    if koreanSpeakingCountries.contains(countryCode) {
      self.setValue("Korean", forKey: languageProperty)
    }
    
    if japaneseSpeakingCountries.contains(countryCode) {
      self.setValue("Japanese", forKey: languageProperty)
    }
    
    if hindiSpeakingCountries.contains(countryCode) {
      self.setValue("Hindi", forKey: languageProperty)
    }
    
    if russianSpeakingCountries.contains(countryCode) {
      self.setValue("Russian", forKey: languageProperty)
    }
  }
  
  func sentenceTranslation(word: String) -> String {
    let sentences = sentenceTranslations[languageOfCurrentCountry]!
    return sentences[word]!
  }
  
  func wordTranslation(word: String) -> String {
    let words = wordTranslations[languageOfDevice]!
    return words[word]!
  }
}