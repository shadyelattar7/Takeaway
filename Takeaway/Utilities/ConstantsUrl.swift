//
//  ConstantsUrl.swift
//  Katfa
//
//  Created by Elattar on 7/15/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import Foundation


class URLs{
    
    private static let main = "http://api.limo-trip.com/"
    
    ///Post SendSmsCodeToNewUser {PhoneNumberTo: String}
    static let sendSmsCodeToNewUser: (_ PhoneNumberTo:String) -> String = { phoneNum in
        return main + "api/User/SendSmsCodeToNewUser?PhoneNumberTo=\(phoneNum)"
    }
    ///Post SendSmsCodeFromUse {Code: String ,PhoneNumberTo: String}
    static let sendSmsCodeFromUse: (_ code: String,_ PhoneNumberTo:String) -> String = { code , phoneNum in
        return main + "api/User/SendSmsCodeFromUser?Code=\(code)&Phone=\(phoneNum)"
    }
    ///Post Register {username: String , password: String, confirmPassword:  String, phoneNumber: String }
    static let register = main  + "api/Account/Register"
    ///Post Login {userName: String, Password: String}
    static let login = main + "api/Account/CustomToken"
    ///GET LoginWithGoogle
    static let loginWithGoogle: (_ email: String, _ userId: String) -> String = { email , userId in
        return main + "api/User/RegisterWithGoogle?Email=\(email)&UserId=\(userId)"
    }
    ///GET Forget Password {phoneNumber: String}
    static let forgetPassword: (_ phoneNumber: String) -> String = { phoneNum in
        return main + "api/Account/PasswordResetByPhoneNumber?PhoneNumber=\(phoneNum)"
    }
    ///GET Trip List
    static let tripList = main + "/api/Trips/List"
    ///GET Search In Trip List {wrod: String}
    static let searchTrip: (_ word: String) -> String = { word in
        return main + "/api/Trips/SearchResult?query=\(word)"
    }
    ///Post new User data after edit
    static let editUserInfo = main + "api/User/User_Edit"
    ///GET User Image
    static let getUserImage: (_ imageName: String) -> String = { imageName in
        return "http://api.limo-trip.com/Content/img/\(imageName)"
    }
    ///Post ChangePassword {oldPass, newPass , confirm Pass}
    static let changePassword = main + "api/Account/ChangePassword"
    
    ///GET ListReginCtiyFrom {travelId: String}
    static let listReginCtiyFrom: (_ travelId: Int) -> String = { travelId in
        return main + "api/Trips/ListReginCtiyFrom?travelId=\(travelId)"
    }
    ///GET ListReginCtiyFrom {travelId: String}
    static let listReginCtiyTo: (_ travelId: Int) -> String = { travelId in
        return main + "api/Trips/ListReginCtiyTo?travelId=\(travelId)"
    }
    ///GET CarList{individualNumber: Int, bagNumber: Int , fromReginCtiyId: Int, toReginCtiyId: Int , travel_id: Int}
    static let carList: (_ individualNumber: Int,_ bagNumber: Int,_ fromReginCtiyId: Int,_ toReginCtiyId: Int,_ travel_id: Int,_ isGo: Bool) -> String = { individualNumber,bagNumber,fromReginCtiyId,toReginCtiyId,travel_id,isGo in
        return main + "api/Cars/CarList?individualNumber=\(individualNumber)&bagNumber=\(bagNumber)&fromReginCtiyId=\(fromReginCtiyId)&toReginCtiyId=\(toReginCtiyId)&travel_id=\(travel_id)&IsGo=\(isGo)"
    }
    ///Get CarImage
    static let carImgUrl: (_ imgUrl: String) -> String = { imageUrl in
        return "http://dashbord.limo-trip.com/Content/img/\(imageUrl)"
    }
    ///PostAddOrder
    static let addOrder = main + "/api/Trips/AddOrders"
    ///GET UserOrder{token: String}
    static let userOrder = main + "api/User/UserOrder"
    ///Post Report {orderID: Int, reportText: String}
    static let report = main + "api/Trips/AddReport"
    ///Check Trip is Start {trip id: Int}
    static let isStart: (_ tripId: Int) -> String = { tripId in
        return main + "api/Trips/IsStart?id=\(tripId)"
    }
    ///Cancel Trip  {trip id: Int}
    static let cancelTrip: (_ tripId: Int) -> String = { tripId in
        return main + "api/Driver/CancellOrder?orderId=\(tripId)"
    }
    ///GET Notifications {Token}
    static let notifications = main + "api/Notification/NotificationList"
    ///Post DeleteNotifications{Token}
    static let deleteNotifications = main + "api/Netfacilities/NotificationsDeleteAll"
    ///Post Rate Product{product id , value, token}
    static let rating: (_ orderId: Int, _ value: Double,_ comment: String) -> String = { id , value, comment in
        return main + "api/Rates/addRate?order_ID=\(id)&value=\(value)&comment=\(comment)"
    }
    ///GET Page By Id {id: int}
    static let pageById: (_ id: String) -> String = { id in
        return main + "api/Page/PageById?Page_ID=\(id)"
    }
    ///Post PlayerId {PlayerId: String}
       static let playerId: (_ id: String) -> String = { playerId in
           return main + "api/User/Playerid?Playerid=\(playerId)"
       }
}
