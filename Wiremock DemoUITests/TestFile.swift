//
//  TestFile.swift
//  Wiremock DemoUITests
//
//  Created by Piyush Bharadwaj on 15/03/24.
//

import Foundation

/*
 
 ---->>>> ProductList
 
 
 let loginEndPoint = Endpoints.login(username, password).endpoint + "?username=\(username)&password=\(password)"
 
 await createMapping(for: loginEndPoint, requestType: "POST", bodyFileName: "login.json", statusCode: 200)
 
 let productsEndPoint = Endpoints.listProducts.endpoint
 
 await createMapping(for: productsEndPoint, requestType: "GET", bodyFileName: "products.json", statusCode: 200)
 
 app.launchArguments = LaunchArguments.launchLocalArguments
 
 
 --->>>  LoginTest - Success
 
 let endPoint = Endpoints.login(username, password).endpoint + "?username=\(username)&password=\(password)"
 
 await createMapping(for: endPoint, requestType: "POST", bodyFileName: "login.json", statusCode: 200)
 
 
 app.launchArguments = LaunchArguments.launchLocalArguments
 
 
 --->>>  LoginTest - Failure
 
 let endPoint = Endpoints.login(username, password).endpoint + "?username=\(username)&password=\(password)"

 await createMapping(for: endPoint, requestType: "POST", bodyFileName: "loginFailed.json", statusCode: 401)
 
 app.launchArguments = LaunchArguments.launchLocalArguments
*/
